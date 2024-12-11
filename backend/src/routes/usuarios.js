const express = require('express');
const router = express.Router();
const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();
module.exports = router;

router.get('/', async (req, res) => {
  const usuarios = await prisma.usuario.findMany();
  res.json(usuarios);
});

router.get('/:identificador', async (req, res) => {
  const identificador = req.params.identificador;
  let usuario;

  if (!isNaN(identificador)) {
    // Si el identificador es un número, buscar por ID
    usuario = await prisma.usuario.findUnique({
      where: {
        id: parseInt(identificador)
      }
    });
  } else {
    // Si el identificador no es un número, buscar por nombre
    usuario = await prisma.usuario.findUnique({
      where: {
        nombre: identificador
      }
    });
  }

  if (usuario === null) {
    res.sendStatus(404);
    return;
  }
  res.json(usuario);
});
  
router.get('/:id', async(req, res) => {
  const id = parseInt(req.params.id, 10);
  let usuario =  await prisma.usuario.findUnique({
    where:{
      id: id
    },
    include: {
      princesas: true,
      principes: true,
      villanos: true
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
      nombre: req.body.nombre,
      edad: req.body.edad,
      princesa_fav: req.body.princesa_fav,
    } 
  })
  res.status(201).send(usuario)
})
 
router.post('/:id/princesa/:princesa_id', async (req, res) => {
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
  
router.post('/:id/principe/:principe_id', async (req, res) => {
  const usuario = await prisma.usuario.findUnique({
    where: {
      id: parseInt(req.params.id)
    }
  });
  if (usuario === null) {
    res.sendStatus(404);
    return;
  }
  const principe = await prisma.principe.findUnique({
    where: {
      id: parseInt(req.params.principe_id)
    }
  });
  if (principe === null) {
    res.sendStatus(404);
    return;
  }
  const usuarioPrincipe = await prisma.usuarios_principes.create({
    data: {
      usuario_id: parseInt(req.params.id),
      principe_id: parseInt(req.params.principe_id)
    } 
  });
  res.status(201).send(usuarioPrincipe);
  console.log(usuarioPrincipe);
});

router.post('/:id/villano/:villano_id', async (req, res) => {
  const usuario = await prisma.usuario.findUnique({
    where: {
      id: parseInt(req.params.id)
    }
  });
  if (usuario === null) {
    res.sendStatus(404);
    return;
  }
  const villano = await prisma.villano.findUnique({
    where: {
      id: parseInt(req.params.villano_id)
    }
  });
  if (villano === null) {
    res.sendStatus(404);
    return;
  }
  const usuarioVillano = await prisma.usuarios_villanos.create({
    data: {
      usuario_id: parseInt(req.params.id),
      villano_id: parseInt(req.params.villano_id)
    } 
  });
  res.status(201).send(usuarioVillano);
  console.log(usuarioVillano);
});

router.delete('/:id', async (req, res) => {
  const userId = parseInt(req.params.id);

  // Verificar si el usuario existe
  const usuario = await prisma.usuario.findUnique({
    where: {
      id: userId
    }
  });

  if (usuario === null) {
    res.sendStatus(404);
    return;
  }

  // Eliminar registros dependientes en usuarios_princesas
  await prisma.usuarios_princesas.deleteMany({
    where: {
      usuario_id: userId
    }
  });

  // Eliminar registros dependientes en usuarios_principes
  await prisma.usuarios_principes.deleteMany({
    where: {
      usuario_id: userId
    }
  });

  // Eliminar registros dependientes en usuarios_villanos
  await prisma.usuarios_villanos.deleteMany({
    where: {
      usuario_id: userId
    }
  });

  // Ahora eliminar el usuario
  await prisma.usuario.delete({
    where: {
      id: userId
    }
  });

  res.send(usuario);
});
  
router.put('/:id', async(req, res) => {
  let usuario =  await prisma.usuario.findUnique({
    where:{
      id: parseInt(req.params.id)
    } 
  })
  if (usuario === null) {
    res.sendStatus(404).send("Usuario no encontrado")
  }
  
  usuario = await prisma.usuario.update({
    where:{
      id: parseInt(req.params.id)
    },
    data: {
      nombre : req.body.nombre,
      edad: req.body.edad,
      princesa_fav: req.body.princesa_fav,
    }
  })
  
  res.send(usuario)
  
})

router.delete('/', async (req, res) => {
  await prisma.usuario.deleteMany();
  res.send("Todos los usuarios fueron borrados");
});

router.get('/:id_usuario/princesa/:id_princesa', async (req, res) => {
  const usuarioPrincesa = await prisma.usuarios_princesas.findUnique({
    where: {
      usuario_id_princesa_id: {
        usuario_id: parseInt(req.params.id_usuario),
        princesa_id: parseInt(req.params.id_princesa)
      }
    }
  });
  if (usuarioPrincesa === null) {
    res.status(404);
    return;
  }
  res.status(200).json(usuarioPrincesa);
});

router.get('/:id_usuario/principe/:id_principe', async (req, res) => {
  const usuarioPrincipe = await prisma.usuarios_principes.findUnique({
    where: {
      usuario_id_principe_id: {
        usuario_id: parseInt(req.params.id_usuario),
        principe_id: parseInt(req.params.id_principe)
      }
    }
  });
  if (usuarioPrincipe === null) {
    res.status(404);
    return;
  }
  res.status(200).json(usuarioPrincipe);
});

router.get('/:id_usuario/villano/:id_villano', async (req, res) => {
  const usuarioVillano = await prisma.usuarios_villanos.findUnique({
    where: {
      usuario_id_villano_id: {
        usuario_id: parseInt(req.params.id_usuario),
        villano_id: parseInt(req.params.id_villano)
      }
    }
  });
  if (usuarioVillano === null) {
    res.status(404);
    return;
  }
  res.status(200).json(usuarioVillano);
});

router.delete('/:usuario_id/princesa/:princesa_id', async (req, res) => {
  const usuarioPrincesa = await prisma.usuarios_princesas.delete({
    where: {
      usuario_id_princesa_id: {
        usuario_id: parseInt(req.params.usuario_id),
        princesa_id: parseInt(req.params.princesa_id)
      }
    }
  });
  if (usuarioPrincesa === null) {
    res.status(404);
    return;
  }
  res.status(200).json(usuarioPrincesa);
});

router.delete('/:usuario_id/principe/:principe_id', async (req, res) => {
  const usuarioPrincipe = await prisma.usuarios_principes.delete({
    where: {
      usuario_id_principe_id: {
        usuario_id: parseInt(req.params.usuario_id),
        principe_id: parseInt(req.params.principe_id)
      }
    }
  });
  if (usuarioPrincipe === null) {
    res.status(404);
    return;
  }
  res.status(200).json(usuarioPrincipe);
});

router.delete('/:usuario_id/villano/:villano_id', async (req, res) => {
  const usuarioVillano = await prisma.usuarios_villanos.delete({
    where: {
      usuario_id_villano_id: {
        usuario_id: parseInt(req.params.usuario_id),
        villano_id: parseInt(req.params.villano_id)
      }
    }
  });
  if (usuarioVillano === null) {
    res.status(404);
    return;
  }
  res.status(200).json(usuarioVillano);
});
