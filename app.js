const express = require('express')
const app = express()
const puerto = 3000

let usuarios = [{
  id: 1,
  nombre: "Maria",
  edad: 12,
  princesa_fav: "Bella Durmiente",
}, {
  id: 2,
  nombre: "Bruno",
  edad: 17,
  princesa_fav: "La Sirenita"
}]
let princesas = []
let principes = []
let villanos = []
let acompañantes = []

app.use(express.json())

app.get('/', (req, res) => {
  res.send('Hello World!')
})

app.get('/api/v1/usuarios', (req, res) => {
  res.json(usuarios)
})

app.get('/api/v1/usuarios/:id', (req, res) => {
  const usuario = usuarios.find((elemento) => elemento.id == req.params.id)

  if (usuario === undefined) {
    res.sendStatus(404)
    return
  }
  res.json(usuario)
})

app.post('/api/v1/usuarios', (req, res) => {
  usuarios.push({
    id: usuarios.length + 1,
    nombre: req.body.nombre,
    edad: req.body.edad,
    princesa_fav: req.body.princesa_fav
  })
  res.sendStatus(201)
})

app.delete('/api/v1/usuarios/:id', (req, res) => {
  const existe_usuario =  !(usuarios.find((elemento) => elemento.id == req.params.id) === undefined)
  if (!existe_usuario) {
    res.sendStatus(404)
    return
  }
  usuarios = usuarios.filter((elemento) => elemento.id != req.params.id)
  res.send(200)
  
})

app.put('/api/v1/usuarios/:id', (req, res) => {
  let indice_usuario =  usuarios.findIndex((elemento) => elemento.id == req.params.id)
  if (indice_usuario === -1) {
    res.sendStatus(404)
    return
  }
  usuarios[indice_usuario].nombre = req.body.nombre ?? usuarios[indice_usuario].nombre
  usuarios[indice_usuario].edad = req.body.edad ?? usuarios[indice_usuario].edad
  usuarios[indice_usuario].princesa_fav = req.body.princesa_fav ?? usuarios[indice_usuario].princesa_fav

  res.send(200)
})

app.listen(puerto, () => {
  console.log(`Princesas escuchando en el puerto ${puerto}`)
})

