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
    res.json(princesa)
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
          imagen: req.body.imagen,
        }
    })
    res.status(201).send(princesa)
    console.log(princesa)
})
    
router.delete('/:id', async (req, res) => {
    const princesa = await prisma.princesa.findUnique({
        where: {
          id : parseInt(req.params.id)
        }
    })
    
    if (princesa === null) {
        res.sendStatus(404)
        return 
    }

    await prisma.usuarios_princesas.deleteMany({
        where: {
            princesa_id: parseInt(req.params.id)
        }
    })

    await prisma.princesas_principes.deleteMany({
        where: {
            princesa_id: parseInt(req.params.id)
        }
    })

    await prisma.princesas_villanos.deleteMany({
        where: {
            princesa_id: parseInt(req.params.id)
        }
    })

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
            imagen: req.body.imagen,
        }
    })
    
    res.send(princesa)
    
})