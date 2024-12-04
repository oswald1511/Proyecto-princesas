const express = require('express');
const router = express.Router();
const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();
module.exports = router;

router.get('/', async (req, res) => {
    const principes = await prisma.principe.findMany();
    res.json(principes);
});
  
router.get('/:id', async (req, res) => {
    const principe = await prisma.principe.findUnique({ 
        where: {
          id : parseInt(req.params.id)
        }
      })
    
    if (principe === null) {
        res.sendStatus(404)
        return
    }
    res.json(principes)
})  
    
router.post('/', async (req, res) => {
    const principe = await prisma.principe.create({
        data:{
          nombre: req.body.nombre,
          origen: req.body.origen,
          virtud: req.body.virtud,
          habilidad: req.body.habilidad,
          alias: req.body.alias,
        }
    })
    res.status(201).send(principe) 
})
    
router.delete('/:id', async (req, res) => {
    const principe = await prisma.principe.findUnique({
        where: {
          id : parseInt(req.params.id)
        }
    })
    
    if (principe === null) {
        res.sendStatus(404)
        return
    }
    await prisma.principe.delete({
        where: {
          id: parseInt(req.params.id)
        }
    })
      
    res.send(principe)
      
})
    
router.put('/:id', async(req, res) => {
    let principe =  await prisma.principe.findUnique({
        where:{
          id: parseInt(req.params.id)
        }
    })
    if (principe === null) {
        res.sendStatus(404)
    }
    
    principe = await prisma.principe.update({
        where:{
          id: parseInt(req.params.id)
        },
        data: {
            nombre: req.body.nombre,
            cuento: req.body.cuento,
            virtud: req.body.virtud,
            habilidad: req.body.habilidad,
            principe: req.body.principe,
            precio: req.body.precio,
        }
    })
    
    res.send(principe)
    
})