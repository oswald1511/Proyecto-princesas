const { PrismaClient } = require('@prisma/client');
const express = require('express');
var cors = require('cors');
const app = express();
const puerto = 3000;
const prisma = new PrismaClient();
const usuarios = require('./routes/usuarios');

app.use(express.json());
app.use(cors());

app.get('/', (req, res) => {
  res.send('Princesas app');
});

app.use('/api/v1/usuarios', usuarios);
app.use('/api/v1/princesas', princesas);
app.listen(puerto, () => {
  console.log(`Princesas escuchando en el puerto ${puerto}`);
});