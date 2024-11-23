const { PrismaClient } = require('@prisma/client')
const express = require('express')
const app = express()
const puerto = 3000
const prisma = new PrismaClient()

app.use(express.json())

app.get('/', (req, res) => {
  res.send('Princesas app')
})


app.get('/api/v1/usuarios', async (req, res) => {
  const usuarios = await prisma.usuario.findMany()
  res.json(usuarios)
  })

app.get('/api/v1/usuarios/:id', async (req, res) => {
  const usuario = await prisma.usuario.findUnique({ 
    where: {
      id : parseInt(req.params.id)
    }
  })

  if (usuario === null) {
    res.sendStatus(404)
    return
  }
  res.json(usuario)
})  

app.post('/api/v1/usuarios', async (req, res) => {
  const usuario = await prisma.usuario.create({
    data:{
      nombre: req.body.nombre,
      edad: req.body.edad,
      princesa_fav: req.body.princesa_fav
    }
  })
  res.status(201).send(usuario)
})

app.delete('/api/v1/usuarios/:id', async (req, res) => {
  const usuario = await prisma.usuario.findUnique({
    where: {
      id : parseInt(req.params.id)
    }
  })

  if (usuario === null) {
    res.sendStatus(404)
    return
  }
  await prisma.usuario.delete({
    where: {
      id: parseInt(req.params.id)
    }
  })
  
  res.send(usuario)
  
})

app.put('/api/v1/usuarios/:id', async(req, res) => {
  let usuario =  await prisma.usuario.findUnique({
    where:{
      id: parseInt(req.params.id)
    }
  })
  if (usuario === null) {
    res.sendStatus(404)
  }

  usuario = await prisma.usuario.update({
    where:{
      id: parseInt(req.params.id)
    },
    data: {
      nombre : req.body.nombre,
      princesscoin: req.body.princesscoin, 
      edad: req.body.edad,
      cantidad_de_princesas: req.body.cantidad_de_princesas,
      princesa_fav: req.body.princesa_fav
    }
  })

  res.send(usuario)

})

app.listen(puerto, () => {
  console.log(`Princesas escuchando en el puerto ${puerto}`)
})