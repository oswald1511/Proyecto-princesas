const express = require('express')
const app = express()
const port = 3000

let users = []
let princesas = []
let principes = []
let villanos = []
let favorite_princess = []
let princess_villain = []
let the_prince_of_the_princess = []


app.use(express.json())

app.get('/', (req, res) => {
  res.send('Hello World!')
})

app.listen(port, () => {
  console.log(`Princesas app listening on port ${port}`)
})

