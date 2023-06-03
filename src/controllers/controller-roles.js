const config = require('../configs/database');
const mysql = require('mysql2');
const pool = mysql.createPool(config);

pool.on('error',(err)=> {
    console.error(err);
});

module.exports ={
    // Ambil data semua users
    getDataRole(req,res){
        pool.getConnection(function(err, connection) {
            if (err) throw err;
            connection.query(
                `
                call role_read();
                `
            , function (error, results) {
                if(error) throw error;  
                res.send({ 
                    success: true, 
                    message: 'Collecting all data from role table',
                    data: results 
                });
            });
            connection.release();
        })
    },

    deleteDataRole(req,res){
        pool.getConnection(function(err, connection) {
            if (err) throw err;
            connection.query(
                `
                call role_delete(${req.body.id});
                `
            , function (error, results) {
                if(error) throw error;  
                res.send({ 
                    success: true, 
                    message: `Data role with ${id} has been deleted`,
                    data: results 
                });
            });
            connection.release();
        })
    },

    updateDataRole(req,res){
        pool.getConnection(function(err, connection) {
            if (err) throw err;
            connection.query(
                `
                call role_update(${req.body.id}, ${req.body.name});
                `
            , function (error, results) {
                if(error) throw error;  
                res.send({ 
                    success: true, 
                    message: `Data role with ${id} has been updated`,
                    data: results 
                });
            });
            connection.release();
        })
    },

    createDataRole(req,res){
        pool.getConnection(function(err, connection) {
            if (err) throw err;
            connection.query(
                `
                call role_create(${req.body.id}, ${req.body.name});
                `
            , function (error, results) {
                if(error) throw error;  
                res.send({ 
                    success: true, 
                    message: `Data role with ${id} has been created`,
                    data: results 
                });
            });
            connection.release();
        })
    },

    editDataRole(req,res){
        pool.getConnection(function(err, connection) {
            if (err) throw err;
            connection.query(
                `
                call role_edit(${req.body.id});
                `
            , function (error, results) {
                if(error) throw error;  
                res.send({ 
                    success: true, 
                    message: `Collecting Role Data with id ${req.body.id}`,
                    data: results 
                });
            });
            connection.release();
        })
    }
}