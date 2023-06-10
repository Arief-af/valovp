const config = require('../configs/database');
const mysql = require('mysql2');
const pool = mysql.createPool(config);
const bcrypt = require('bcrypt');
const { v4: uuidv4 } = require("uuid");

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
            const uuid = uuidv4();
            const hashedPassword = bcrypt.hash(req.body.password, 10);
            if (err) throw err;
            connection.query(
                `
               call user_create('${uuid}', '${req.body.role_id}', '${req.body.email}', '${req.body.username}', '${hashedPassword}', '${req.body.name}');
                `
            , function (error, results) {
                if(error) throw error;  
                res.send({ 
                    success: true, 
                    message: `Data user with ${uuid} has been created`,
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
               call user_edit('${req.query.id_user}');
                `
            , function (error, results) {
                if(error) throw error;  
                res.send({ 
                    success: true, 
                    message: `Collecting user Data with id ${req.query.id_user}`,
                    data: results 
                });
            });
            connection.release();
        })
    },

}

