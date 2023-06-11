const config = require("../configs/database");
const mysql = require("mysql2");
const pool = mysql.createPool(config);
const { v4: uuidv4 } = require("uuid");

pool.on("error", (err) => {
  console.error(err);
});

module.exports = {
  // Ambil data semua users
  getDataVirtual_account(req, res) {
    pool.getConnection(function (err, connection) {
      if (err) throw err;
      connection.query(
        `
               call virtual_account_read();
                `,
        function (error, results) {
          if (error) throw error;
          res.send({
            success: true,
            message: "Collecting all data from virtual_account table",
            data: results,
          });
        }
      );
      connection.release();
    });
  },

  createDataVirtual_account(req, res) {
    pool.getConnection(function (err, connection) {
      const uuid = uuidv4();
      const shortenedUuid = uuid.substring(0, 10);
      const decimalNumber = parseInt(shortenedUuid, 16);
      if (err) throw err;
      connection.query(
        `
               call virtual_account_create('${uuid}', '${req.body.name}', '${decimalNumber}');
                `,
        function (error, results) {
          if (error) throw error;
          res.send({
            success: true,
            message: `Data virtual_account with ${uuid} has been created`,
            data: {id_virtual_account: uuid} 
          });
        }
      );
      connection.release();
    });
  },

  deleteDataVirtual_account(req, res) {
    pool.getConnection(function (err, connection) {
      if (err) throw err;
      connection.query(
        `
               call virtual_account_delete('${req.body.id_virtual_account}');
                `,
        function (error, results) {
          if (error) throw error;
          res.send({
            success: true,
            message: `Data virtual_account with ${req.body.id_virtual_account} has been deleted`,
            data: results,
          });
        }
      );
      connection.release();
    });
  },

  updateDataVirtual_account(req, res) {
    pool.getConnection(function (err, connection) {
      if (err) throw err;
      connection.query(
        `
               call virtual_account_update('${req.body.virtual_account}', '${req.body.name}', '${req.body.number}');
                `,
        function (error, results) {
          if (error) throw error;
          res.send({
            success: true,
            message: `Data virtual_account with ${req.body.id_virtual_account} has been updated`,
            data: results,
          });
        }
      );
      connection.release();
    });
  },

  editDataVirtual_account(req, res) {
    pool.getConnection(function (err, connection) {
      if (err) throw err;
      connection.query(
        `
               call virtual_account_edit('${req.query.id_virtual_account}');
                `,
        function (error, results) {
          if (error) throw error;
          return res.status(200).json({
            success: true,
            message: `Collecting virtual_account Data with id ${req.query.id_virtual_account}`,
            data: results,
          });
        }
      );
      connection.release();
    });
  },
};
