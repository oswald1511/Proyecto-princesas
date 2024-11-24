const express = require('express');
const router = express.Router();
const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();
module.exports = router;

router.get('/', async (req, res) => {
    const princesas = await prisma.princesa.findMany();
    res.json(princesas);
});
  
router.get('/:id', async (req, res) => {
    const princesa = await prisma.princesa.findUnique({ 
        where: {
          id : parseInt(req.params.id)
        }
      })
    
    if (princesa === null) {
        res.sendStatus(404)
        return
    }
    res.json(princesas)
})  
    
router.post('/', async (req, res) => {
    const princesa = await prisma.princesa.create({
        data:{
          nombre: req.body.nombre,
          cuento: req.body.cuento,
          virtud: req.body.virtud,
          habilidad: req.body.habilidad,
          principe: req.body.principe,
          precio: req.body.precio,
        }
    })
    res.status(201).send(princesa)
})
    
router.delete('/:id', async (req, res) => {
    const usuario = await prisma.usuario.findUnique({
        where: {
          id : parseInt(req.params.id)
        }
    })
    
    if (princesa === null) {
        res.sendStatus(404)
        return
    }
    await prisma.princesa.delete({
        where: {
          id: parseInt(req.params.id)
        }
    })
      
    res.send(princesa)
      
})
    
router.put('/:id', async(req, res) => {
    let princesa =  await prisma.princesa.findUnique({
        where:{
          id: parseInt(req.params.id)
        }
    })
    if (princesa === null) {
        res.sendStatus(404)
    }
    
    princesa = await prisma.princesa.update({
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
    
    res.send(princesa)
    
})