const config = require('../configs/database');
const mysql = require('mysql2');
const pool = mysql.createPool(config);

pool.on('error',(err)=> {
    console.error(err);
});

module.exports ={
    // Ambil data semua users
    getDataUser(req,res){
        pool.getConnection(function(err, connection) {
            if (err) throw err;
            connection.query(
                `
               call transaction_read();
                `
            , function (error, results) {
                if(error) throw error;  
                res.send({ 
                    success: true, 
                    message: 'Collecting all data from transaction table',
                    data: results 
                });
            });
            connection.release();
        })
    },

    createDataUser(req,res){
        pool.getConnection(function(err, connection) {
            if (err) throw err;
            connection.query(

                //timestamp nya belum
                `
               call transaction_create(${req.body.id_transaction}, ${req.body.voucher_id}, ${req.body.user_id}, ${req.body.riotId});
                `
            , function (error, results) {
                if(error) throw error;  
                res.send({ 
                    success: true, 
                    message: `Data transaction with ${id_transaction} has been created`,
                    data: results 
                });
            });
            connection.release();
        })
    },

    deleteDataUser(req,res){
        pool.getConnection(function(err, connection) {
            if (err) throw err;
            connection.query(
                `
               call transaction_delete(${id_transaction});
                `
            , function (error, results) {
                if(error) throw error;  
                res.send({ 
                    success: true, 
                    message: `Data transaction with ${id_transaction} has been deleted`,
                    data: results 
                });
            });
            connection.release();
        })
    },

    updateDataUser(req,res){
        pool.getConnection(function(err, connection) {
            if (err) throw err;
            connection.query(

                //timestamp nya belum
                `
               call transaction_update(${req.body.id_transaction}, ${req.body.voucher_id}, ${req.body.user_id}, ${req.body.riotId});
                `
            , function (error, results) {
                if(error) throw error;  
                res.send({ 
                    success: true, 
                    message: `Data transaction with ${id_transaction} has been updated`,
                    data: results 
                });
            });
            connection.release();
        })
    },

    editDataUser(req,res){
        pool.getConnection(function(err, connection) {
            if (err) throw err;
            connection.query(
                `
               call transaction_edit(${id_transaction});
                `
            , function (error, results) {
                if(error) throw error;  
                res.send({ 
                    success: true, 
                    message: `Collecting transaction Data with id ${id_transaction}`,
                    data: results 
                });
            });
            connection.release();
        })
    },

}

