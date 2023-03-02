const express = require('express');
const { conexion } = require('../configuracion/database');
const route= express.Router();


route.get('/',(req, res) => {
    let sql = "Select Id_factura,Id_cli,Id_empleado,tipoDocumento,numDocumento,Fecha from factura;"
    
    conexion.query(sql, (err, resul) => {
        if(err) {
            console.log("Error: "+err.message);
            throw err
        }else{
            res.json(resul)
        }
    });
});

route.get('/:codigo',function(req,res) {
    let sql = 'Select Id_factura,Id_cli,Id_empleado,tipoDocumento,numDocumento,Fecha from factura where Id_factura=?'
    conexion.query(sql,[req.params.codigo],function(err,resul){
        if(err){
            throw response.json(err.message)
        }else{
            res.json(resul);
        }
    });
});

route.post('/',function(req,res) {
    let data = {
        Id_cli:req.body.Id_cli,
        Id_empleado:req.body.Id_empleado,
        tipoDocumento:req.body.tipoDocumento,
        numDocumento:req.body.numDocumento
            }
    let sql = 'Insert into factura set ?';
    conexion.query(sql,data, function(err,resul){
        if(err){
            console.log(err.message);
            res.json('Error no se adiciono');
            throw response.json(err.message)
        }else{
            res.json(resul);
            console.log('Positivo, se adiciono');
        }
    });
});


route.put('/:codigo',function(req,res) {
    let codigo = req.params.codigo;
    let Idcli= req.body.Id_cli;
    let Idemp= req.body.Id_empleado;
    let tip= req.body.tipoDocumento;
    let num= req.body.numDocumento;
   
    let sql = 'Update factura set Id_cli = ?, Id_empleado=?, tipoDocumento=?, numDocumento=? where Id_factura = ?';
    conexion.query(sql,[Idcli,Idemp,tip,num,codigo],function(err,resul){
        if(err){
            console.log(err.message);
        }else{
            res.json(resul);
        }
    });
 });
 route.delete('/:codigo',function(req,res) {
    let codigo = req.params.codigo;
    let sql = 'Delete from factura where Id_factura = ?';
    conexion.query(sql,[codigo],function(err,resul){
        if(err){
            console.log(err.message);
        }else{
            res.json(resul);
        }
    });
 });

module.exports =  route ;
