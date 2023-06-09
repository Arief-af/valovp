const config = require('../configs/database');
const mysql = require('mysql2');
const { v4: uuidv4 } = require("uuid");
const pool = mysql.createPool(config);

pool.on('error',(err)=> {
    console.error(err);
});

module.exports ={
    // Ambil data semua users
    getDataBanks(req,res){
        pool.getConnection(function(err, connection) {
            if (err) throw err;
            connection.query(
                `
               call bank_read();
                `
            , function (error, results) {
                if(error) throw error;  
                res.send({ 
                    success: true, 
                    message: 'Collecting all data from bank table',
                    data: results 
                });
            });
            connection.release();
        })
    },

    createDataBanks(req,res){
        const uuid = uuidv4();
        pool.getConnection(function(err, connection) {
            if (err) throw err;
            connection.query(
                `
               call bank_create('${uuid}', '${req.body.name}');
                `
            , function (error, results) {
                if(error) throw error;  
                res.send({ 
                    success: true, 
                    message: `Data bank with ${uuid} has been created`,
                    data: results 
                });
            });
            connection.release();
        })
    },

    deleteDataBanks(req,res){
        pool.getConnection(function(err, connection) {
            if (err) throw err;
            connection.query(
                `
               call bank_delete('${req.body.id_bank}');
                `
            , function (error, results) {
                if(error) throw error;  
                res.send({ 
                    success: true, 
                    message: `Data bank with ${req.body.id_bank} has been deleted`,
                    data: results 
                });
            });
            connection.release();
        })
    },

    updateDataBanks(req,res){
        pool.getConnection(function(err, connection) {
            if (err) throw err;
            connection.query(
                `
               call bank_update('${req.body.id_bank}', '${req.body.name}');
                `
            , function (error, results) {
                if(error) throw error;  
                res.send({ 
                    success: true, 
                    message: `Data bank with ${req.body.id_bank} has been updated`,
                    data: results 
                });
            });
            connection.release();
        })
    },

    editDataBanks(req,res){
        pool.getConnection(function(err, connection) {
            if (err) throw err;
            connection.query(
                `
               call bank_edit('${id_bank}');
                `
            , function (error, results) {
                if(error) throw error;  
                res.send({ 
                    success: true, 
                    message: `Collecting bank Data with id ${req.query.id_bank}`,
                    data: results 
                });
            });
            connection.release();
        })
    },

}

