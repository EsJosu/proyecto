const express = require('express');
const cors = require('cors');

const app = express();

app.use(express.json());
app.use(cors());


const categoria=require('./rutas/categoria')
const cliente=require('./rutas/cliente')
const compras=require('./rutas/compras')
const login=require('./rutas/login')
const empleado=require('./rutas/empleado')
const pagos=require('./rutas/pagos')
const persona=require('./rutas/persona')
const productos=require('./rutas/productos')
const acceso=require('./rutas/acceso')




app.use('/categoria',test,categoria);
app.use('/cli',test,cliente);
app.use('/compra',test,compras);
app.use('/emp',test,empleado);
app.use('/pago',test,pagos);
app.use('/person',test,persona);
app.use('/produc',test,productos);
app.use('/login',login);
app.use('/acceso',acceso);


const puerto = 3000
app.listen(puerto, function() {
    console.log('Servidor OK en puerto: '+puerto);
});