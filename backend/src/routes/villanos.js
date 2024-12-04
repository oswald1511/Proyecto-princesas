const express = require('express');
const router = express.Router();
const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();
module.exports = router;

router.get('/', async (req, res) => {
    const villanos = await prisma.villano.findMany();
    res.json(villanos);
});
  
router.get('/:id', async (req, res) => {
    const villano = await prisma.villano.findUnique({ 
        where: {
          id : parseInt(req.params.id)
        }
      })
    
    if (villano === null) {
        res.sendStatus(404)
        return
    }
    res.json(villanos)
})  
    
router.post('/', async (req, res) => {
    const villano = await prisma.villano.create({
        data:{
          nombre: req.body.nombre,
          nivel_maldad: req.body.niv_maldad,
          tiene_magia: req.body.tiene_magia,
          alias: req.body.alias,
          debilidad: req.body.debilidad,
          precio: req.body.precio,
          imagen: req.body.imagen,
        }
    })
    res.status(201).send(villano)
})
    
router.delete('/:id', async (req, res) => {
    const villano = await prisma.villano.findUnique({
        where: {
          id : parseInt(req.params.id)
        }
    })
    
    if (villano === null) {
        res.sendStatus(404)
        return
    }
    await prisma.villano.delete({
        where: {
          id: parseInt(req.params.id)
        }
    })
      
    res.send(villano)
      
})
    
router.put('/:id', async(req, res) => {
    let villano =  await prisma.villano.findUnique({
        where:{
          id: parseInt(req.params.id)
        }
    })
    if (villano === null) {
        res.sendStatus(404)
    }
    
    villano = await prisma.villano.update({
        where:{
          id: parseInt(req.params.id)
        },
        data: {
            nombre: req.body.nombre,
            nivel_maldad: req.body.niv_maldad,
            tiene_magia: req.body.tiene_magia,
            alias: req.body.alias,
            debilidad: req.body.debilidad,
            // no agrego el precio porque no deberias poder editar ese campo
            imagen: req.body.imagen,
        }
    })
    
    res.send(villano)
    
})