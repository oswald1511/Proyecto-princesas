const express = require('express');
const router = express.Router();
const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();
module.exports = router;

router.get('/', async (req, res) => {
  const usuarios = await prisma.usuario.findMany();
  res.json(usuarios);
});

router.get('/:id', async (req, res) => {
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
  
router.get('/:id/personajes', async (req, res) => {
  const usuario = await prisma.usuario.findUnique({ 
    where: {
      id : parseInt(req.params.id)
    },
    include: {
      usuarios_princesas: true,
      usuarios_principes: true,
      usuarios_villanos: true
  },
  })
  
  if (usuario === null) {
    res.sendStatus(404)
    return
  }
  res.json(usuario)
})

router.post('/', async (req, res) => {
  const usuario = await prisma.usuario.create({
    data:{
      nombre : req.body.nombre,
      princesscoin: req.body.princesscoin, 
      edad: req.body.edad,
      cantidad_de_princesas: req.body.cantidad_de_princesas,
      princesa_fav: req.body.princesa_fav
    }
  })
  res.status(201).send(usuario)
})

router.post('/:id/princesas/:princesa_id', async (req, res) => {
  const usuario = await prisma.usuario.findUnique({
    where: {
      id: parseInt(req.params.id)
    }
  });
  if (usuario === null) {
    res.sendStatus(404);
    return;
  }
  const princesa = await prisma.princesa.findUnique({
    where: {
      id: parseInt(req.params.princesa_id)
    }
  });
  if (princesa === null) {
    res.sendStatus(404);
    return;
  }
  const usuarioPrincesa = await prisma.usuarios_princesas.create({
    data: {
      usuario_id: parseInt(req.params.id),
      princesa_id: parseInt(req.params.princesa_id)
    }
  });
  res.status(201).send(usuarioPrincesa);
  console.log(usuarioPrincesa);
});
  
router.delete('/:id', async (req, res) => {
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
  
router.put('/:id', async(req, res) => {
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