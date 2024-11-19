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
  res.send('Hello World!')
})

app.get('/api/v1/users', (req, res) => {
  res.json(users)
})

app.get('/api/v1/users/:id', (req, res) => {
  const user = users.find((element) => element.id == req.params.id)

  if (user === undefined) {
    res.sendStatus(404)
  }
  res.json(user)
})

app.post('/api/v1/users', (req, res) => {
  users.push({
    id: users.length + 1,
    name: req.body.name,
    age: req.body.age,
    fav_princess: req.body.fav_princess
  })
  res.sendStatus(201)
})

app.listen(port, () => {
  console.log(`Princesas app listening on port ${port}`)
})

