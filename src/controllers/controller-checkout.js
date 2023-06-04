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
               call checkout_read();
                `
            , function (error, results) {
                if(error) throw error;  
                res.send({ 
                    success: true, 
                    message: 'Collecting all data from checkout table',
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
               call checkout_create(${req.body.id_checkout}, ${req.body.virtual_account_id}, ${req.body.transaction_id}, ${req.body.total_payment}, ${req.body.status});
                `
            , function (error, results) {
                if(error) throw error;  
                res.send({ 
                    success: true, 
                    message: `Data checkout with ${id_checkout} has been created`,
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
               call checkout_delete(${id_checkout});
                `
            , function (error, results) {
                if(error) throw error;  
                res.send({ 
                    success: true, 
                    message: `Data checkout with ${id_checkout} has been deleted`,
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
               call checkout_update(${req.body.id_checkout}, ${req.body.virtual_account_id}, ${req.body.transaction_id}, ${req.body.total_payment}, ${req.body.status});
                `
            , function (error, results) {
                if(error) throw error;  
                res.send({ 
                    success: true, 
                    message: `Data checkout with ${id_checkout} has been updated`,
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
               call checkout_edit(${id_checkout});
                `
            , function (error, results) {
                if(error) throw error;  
                res.send({ 
                    success: true, 
                    message: `Collecting checkout Data with id ${id_checkout}`,
                    data: results 
                });
            });
            connection.release();
        })
    },

}

