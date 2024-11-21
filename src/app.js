const express = require('express')
const app = express()
const port = 3000

let users = [{
  id: 1,
  name: "Maria",
  age: 12,
  fav_princess: "Bella Durmiente",
}, {
  id: 2,
  name: "Bruno",
  age: 17,
  fav_princess: "La Sirenita"
}]
let princesses = []
let princes = []
let villains = []
let favorite_princess = []
let princess_villain = []
let the_prince_of_the_princess = []


app.use(express.json())

app.get('/', (req, res) => {
  res.send('Princesas app')
})

app.get('/api/v1/users', (req, res) => {
  res.json(users)
})

app.get('/api/v1/users/:id', (req, res) => {
  const user = users.find((element) => element.id == req.params.id)

  if (user === undefined) {
    res.sendStatus(404)
    return
  }
  res.json(user)
})

app.post('/api/v1/users', (req, res) => {
  const user = {
    id: users.length + 1,
    name: req.body.name,
    age: req.body.age,
    fav_princess: req.body.fav_princess
  }
  users.push(user)
  res.sendStatus(201).send(user)
})

app.delete('/api/v1/users/:id', (req, res) => {
  const user_exist =  !(users.find((element) => element.id == req.params.id) === undefined)
  if (!user_exist) {
    res.sendStatus(404)
    return
  }
  users = users.filter((element) => element.id != req.params.id)
  res.send(200)
  
})

app.put('/api/v1/users/:id', (req, res) => {
  let user_index =  users.findIndex((element) => element.id == req.params.id)
  if (user_index === -1) {
    res.sendStatus(404)
    return
  }
  users[user_index].name = req.body.name ?? users[user_index].name
  users[user_index].age = req.body.age ?? users[user_index].age
  users[user_index].fav_princess = req.body.fav_princess ?? users[user_index].fav_princess

  res.send(200)
})

app.listen(port, () => {
  console.log(`Princesas app listening on port ${port}`)
})

