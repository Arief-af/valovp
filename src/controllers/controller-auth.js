const jwt = require("jsonwebtoken");
const config = require("../configs/database");
const jwtConfig = require("../configs/jwt");
const mysql = require("mysql2");
const bcrypt = require('bcrypt');

// Create a MySQL connection pool
const pool = mysql.createPool(config);

module.exports = {
  login(req, res) {
    const { username, password } = req.body;

    // Execute the query to get the user by username
    pool.query(
      "SELECT * FROM users WHERE username = ?",
      [username],
      async (error, results) => {
        if (error) {
          console.error("Error executing MySQL query:", error);
          return res.status(500).json({ message: "Internal Server Error" });
        }

        if (results.length === 0) {
          return res.status(401).json({ message: "Invalid credentials" });
        }

        const user = results[0];

        // Compare the provided password with the hashed password in the database
        const passwordMatch = await bcrypt.compare(password, user.password);
        if (!passwordMatch) {
          return res.status(401).json({ message: "Invalid credentials" });
        }

        // Generate the JWT token
        const token = jwt.sign(
          { id: user.id, username: user.username },
          jwtConfig.secret,
          { expiresIn: "1h" }
        );
        res.json({ token });
      }
    );
  },

  async register(req, res) {
    const { username, password, email } = req.body;

    // Hash the password
    const hashedPassword = await bcrypt.hash(password, 10);

    // Execute the query to insert the user into the database
    pool.query(
      "INSERT INTO users (id_role, email, username, password) VALUES (?, ?, ?, ?)",
      [1,email, username, hashedPassword],
      (error, results) => {
        if (error) {
          console.error("Error executing MySQL query:", error);
          return res.status(500).json({ message: "Internal Server Error" });
        }

        // Generate the JWT token
        const token = jwt.sign(
          { id: results.insertId, username: username },
          jwtConfig.secret,
          { expiresIn: "1h" }
        );
        res.json({ token });
      }
    );
  },
};
