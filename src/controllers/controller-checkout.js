const config = require('../configs/database');
const mysql = require('mysql2');
const pool = mysql.createPool(config);
const { v4: uuidv4 } = require("uuid");

pool.on('error',(err)=> {
    console.error(err);
});

module.exports ={
    // Ambil data semua users
    getDataCheckout(req,res){
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

    editDataCheckout(req,res){
        let id_checkout = req.query.id_checkout
        pool.getConnection(function(err, connection) {
            if (err) throw err;
            connection.query(
                `
               call checkout_edit(?);
                `,[id_checkout]
            , function (error, results) {
                if(error) throw error;  
                res.send({ 
                    success: true, 
                    message: 'Collecting all data from checkout table',
                    data: [results, id_checkout] 
                });
            });
            connection.release();
        })
    },

    userCheckout(req,res){
        let user_id = req.query.user_id
        pool.getConnection(function(err, connection) {
            if (err) throw err;
            connection.query(
                `
               call checkout_user(?);
                `,[user_id]
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

    createDataCheckout(req,res){
        pool.getConnection(function(err, connection) {
            const uuid = uuidv4();
            if (err) throw err;
            const timestamp = new Date().toISOString().slice(0, 19).replace('T', ' ');
            connection.query(
            
                //timestamp nya belum
                `
               call checkout_create('${uuid}', '${req.body.virtual_account_id}', '${req.body.transaction_id}', '${req.body.total_payment}', 'pending', '${timestamp}');
                `
            , function (error, results) {
                if(error) throw error;  
                res.send({ 
                    success: true, 
                    message: `Data checkout with ${uuid} has been created`,
                    data: {id_checkout: uuid} 
                });
            });
            connection.release();
        })
    },

    deleteDataCheckout(req,res){
        pool.getConnection(function(err, connection) {
            if (err) throw err;
            connection.query(
                `
               call checkout_delete('${req.body.id_checkout}');
                `
            , function (error, results) {
                if(error) throw error;  
                res.send({ 
                    success: true, 
                    message: `Data checkout with ${req.body.id_checkout} has been deleted`,
                    data: results 
                });
            });
            connection.release();
        })
    },

    updateDataCheckout(req,res){
        pool.getConnection(function(err, connection) {
            if (err) throw err;
            connection.query(

                 //timestamp nya belum
                `
               call change_status('${req.body.id_checkout}', '${req.body.status}')
                `
            , function (error, results) {
                if(error) throw error;  
                res.send({ 
                    success: true, 
                    message: `Data checkout with ${req.body.id_checkout} has been updated`,
                    data: results 
                });
            });
            connection.release();
        })
    }
}

