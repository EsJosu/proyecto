const express = require('express');
const route = express.Router();
const jwt= require('jsonwebtoken')

const {jwt_secret}= require('../configuracion/parametro');

const test = function(req,res,next){
    console.log('Holas estas apunto de crear un sukulento middlewires');
    let tok = req.get('Authorization');
    if(!tok){
        res.json('error, eres un usuario wey')
    }else{       
         jwt.verify(tok,jwt_secret, function(err,datos){
        if(err) {
            console.log("Es invalido");
            // console.log(tok);
            res.json('Error, invalidacion intentelo mas tarde')
        }else{
            console.log(datos);
            next();
        }
    });    
    }
    }       
module.exports=route 
module.exports=test
