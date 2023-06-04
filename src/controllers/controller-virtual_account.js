const config = require('../configs/database');
const mysql = require('mysql2');
const pool = mysql.createPool(config);

pool.on('error',(err)=> {
    console.error(err);
});

module.exports ={
    // Ambil data semua users
    getDataVirtual_account(req,res){
        pool.getConnection(function(err, connection) {
            if (err) throw err;
            connection.query(
                `
               call virtual_account_read();
                `
            , function (error, results) {
                if(error) throw error;  
                res.send({ 
                    success: true, 
                    message: 'Collecting all data from virtual_account table',
                    data: results 
                });
            });
            connection.release();
        })
    },

    createDataVirtual_account(req,res){
        pool.getConnection(function(err, connection) {
            if (err) throw err;
            connection.query(
                `
               call virtual_account_create(${req.body.id_virtual_account}, ${req.body.name}, ${req.body.number});
                `
            , function (error, results) {
                if(error) throw error;  
                res.send({ 
                    success: true, 
                    message: `Data virtual_account with ${id_virtual_account} has been created`,
                    data: results 
                });
            });
            connection.release();
        })
    },

    deleteDataVirtual_account(req,res){
        pool.getConnection(function(err, connection) {
            if (err) throw err;
            connection.query(
                `
               call virtual_account_delete(${id_virtual_account});
                `
            , function (error, results) {
                if(error) throw error;  
                res.send({ 
                    success: true, 
                    message: `Data virtual_account with ${id_virtual_account} has been deleted`,
                    data: results 
                });
            });
            connection.release();
        })
    },

    updateDataVirtual_account(req,res){
        pool.getConnection(function(err, connection) {
            if (err) throw err;
            connection.query(
                `
               call virtual_account_update(${req.body.virtual_account}, ${req.body.name}, ${req.body.number});
                `
            , function (error, results) {
                if(error) throw error;  
                res.send({ 
                    success: true, 
                    message: `Data virtual_account with ${id_virtual_account} has been updated`,
                    data: results 
                });
            });
            connection.release();
        })
    },

    editDataVirtual_account(req,res){
        pool.getConnection(function(err, connection) {
            if (err) throw err;
            connection.query(
                `
               call virtual_account_edit(${id_virtual_account});
                `
            , function (error, results) {
                if(error) throw error;  
                res.send({ 
                    success: true, 
                    message: `Collecting virtual_account Data with id ${id_virtual_account}`,
                    data: results 
                });
            });
            connection.release();
        })
    },

}

