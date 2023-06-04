const config = require('../configs/database');
const mysql = require('mysql2');
const pool = mysql.createPool(config);

pool.on('error',(err)=> {
    console.error(err);
});

module.exports ={
    // Ambil data semua users
    getDataVouchers(req,res){
        pool.getConnection(function(err, connection) {
            if (err) throw err;
            connection.query(
                `
               call voucher_read();
                `
            , function (error, results) {
                if(error) throw error;  
                res.send({ 
                    success: true, 
                    message: 'Collecting all data from voucher table',
                    data: results 
                });
            });
            connection.release();
        })
    },

    createDataVouchers(req,res){
        pool.getConnection(function(err, connection) {
            if (err) throw err;
            connection.query(
                `
               call voucher_create(${req.body.id_voucher}, ${req.body.amount}, ${req.body.price});
                `
            , function (error, results) {
                if(error) throw error;  
                res.send({ 
                    success: true, 
                    message: `Data voucher with ${id_voucher} has been created`,
                    data: results 
                });
            });
            connection.release();
        })
    },

    deleteDataVouchers(req,res){
        pool.getConnection(function(err, connection) {
            if (err) throw err;
            connection.query(
                `
               call voucher_delete(${id_voucher});
                `
            , function (error, results) {
                if(error) throw error;  
                res.send({ 
                    success: true, 
                    message: `Data voucher with ${id_voucher} has been deleted`,
                    data: results 
                });
            });
            connection.release();
        })
    },

    updateDataVouchers(req,res){
        pool.getConnection(function(err, connection) {
            if (err) throw err;
            connection.query(
                `
               call voucher_update(${req.body.id_voucher}, ${req.body.amount}, ${req.body.price});
                `
            , function (error, results) {
                if(error) throw error;  
                res.send({ 
                    success: true, 
                    message: `Data voucher with ${id_voucher} has been updated`,
                    data: results 
                });
            });
            connection.release();
        })
    },

    editDataVouchers(req,res){
        pool.getConnection(function(err, connection) {
            if (err) throw err;
            connection.query(
                `
               call voucher_edit(${id_voucher});
                `
            , function (error, results) {
                if(error) throw error;  
                res.send({ 
                    success: true, 
                    message: `Collecting voucher Data with id ${id_voucher}`,
                    data: results 
                });
            });
            connection.release();
        })
    },

}

