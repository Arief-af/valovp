const jwt = require("jsonwebtoken");
const config = require("../configs/database");
const jwtConfig = require("../configs/jwt");
const mysql = require("mysql2");
const bcrypt = require("bcrypt");
const { v4: uuidv4 } = require("uuid");

// Create a MySQL connection pool
const pool = mysql.createPool(config);

module.exports = {
  logout(req, res) {
    return res.json({
      message: "logout successful",
    });
  },

  async login(req, res) {
    const { username, password } = req.body;

    // Execute the query to get the user by username
    pool.query(
      // nanti ganti bagian ini pake procedure daf
      "SELECT users.id_user,users.name, users.username, users.email, users.password, roles.name AS role_name FROM users JOIN roles ON users.role_id = roles.id_role WHERE username = ?",
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
          { id: user.id_user, username: user.username },
          jwtConfig.secret
        );
        res.json({ user: user, token: token });
      }
    );
  },

  async register(req, res) {
    const { username, name, password, email } = req.body;
    const id = uuidv4();
    // Hash the password
    const hashedPassword = await bcrypt.hash(password, 10);

    // Execute the query to insert the user into the database
    pool.query(
      "INSERT INTO users (id_user, name, role_id, email, username, password) VALUES (?, ?, ?, ?, ?, ?)",
      [
        id,
        name,
        "214ed97f-6674-44b8-8a8d-6fdf0a02db54",
        email,
        username,
        hashedPassword,
      ],
      (error, results) => {
        if (error) {
          console.error("Error executing MySQL query:", error);
          return res.status(500).json({ message: "Internal Server Error" });
        }

        res.json({ message: "user registered" });
      }
    );
  },
};
