const config = require("../configs/database");
const mysql = require("mysql2");
const pool = mysql.createPool(config);
const { v4: uuidv4 } = require("uuid");

pool.on("error", (err) => {
  console.error(err);
});

module.exports = {
  // Ambil data semua users
  getDataRole(req, res) {
    pool.getConnection(function (err, connection) {
      if (err) throw err;
      connection.query(
        `
                call role_read();
                `,
        function (error, results) {
          if (error) throw error;
          res.send({
            success: true,
            message: "Collecting all data from role table",
            data: results,
          });
        }
      );
      connection.release();
    });
  },

  deleteDataRole(req, res) {
    pool.getConnection(function (err, connection) {
      if (err) throw err;
      connection.query(
        `
                call role_delete('${req.body.id_role}');
                `,
        function (error, results) {
          if (error) throw error;
          res.send({
            success: true,
            message: `Data role with ${req.body.id_role} has been deleted`,
            data: results,
          });
        }
      );
      connection.release();
    });
  },

  updateDataRole(req, res) {
    pool.getConnection(function (err, connection) {
      if (err) throw err;
      connection.query(
        `
                call role_update('${req.body.id_role}', '${req.body.name}');
                `,
        function (error, results) {
          if (error) throw error;
          res.send({
            success: true,
            message: `Data role with ID : ${req.body.id_role} has been updated`,
            data: results,
          });
        }
      );
      connection.release();
    });
  },

  createDataRole(req, res) {
    pool.getConnection(function (err, connection) {
      if (err) throw err;
      const uuid = uuidv4();
      connection.query(
        `
                call role_create('${uuid}', '${req.body.name}');
                `,
        function (error, results) {
          if (error) throw error;
          res.send({
            success: true,
            message: `Data role with ${uuid} has been created`,
            data: results,
          });
        }
      );
      connection.release();
    });
  },

  editDataRole(req, res) {
    pool.getConnection(function (err, connection) {
      if (err) {
        throw err;
      }

      connection.query(
        `CALL role_edit(?)`,
        [req.query.id_role],
        function (error, results) {
          connection.release();
          if (error) {
            throw error;
          }

          res.send({
            success: true,
            message: `Collecting Role Data with id ${req.query.id_role}`,
            data: results[0],
          });
        }
      );
    });
  },
};
