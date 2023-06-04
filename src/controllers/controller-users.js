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
               call user_read();
                `
            , function (error, results) {
                if(error) throw error;  
                res.send({ 
                    success: true, 
                    message: 'Collecting all data from user table',
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
                `
               call user_create('${req.body.id_user}', '${req.body.role_id}', '${req.body.email}', '${req.body.username}', '${req.body.password}');
                `
            , function (error, results) {
                if(error) throw error;  
                res.send({ 
                    success: true, 
                    message: `Data user with ${req.body.id_user} has been created`,
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
               call user_delete('${req.body.id_user}');
                `
            , function (error, results) {
                if(error) throw error;  
                res.send({ 
                    success: true, 
                    message: `Data user with ${req.body.id_user} has been deleted`,
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
                `
               call user_update('${req.body.id_user}', '${req.body.role_id}', '${req.body.email}', '${req.body.username}', '${req.body.password}');
                `
            , function (error, results) {
                if(error) throw error;  
                res.send({ 
                    success: true, 
                    message: `Data user with ${req.body.id_user} has been updated`,
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
               call user_edit('${req.body.id_user}');
                `
            , function (error, results) {
                if(error) throw error;  
                res.send({ 
                    success: true, 
                    message: `Collecting user Data with id ${req.body.id_user}`,
                    data: results 
                });
            });
            connection.release();
        })
    },

}

