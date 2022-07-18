const express = require('express')
const app = express()
const importData = require('./suraubookingsystem.json')
const port = process.env.PORT || 3000
const cors = require('cors')

app.use(cors({
    origin: "*"
}))

app.get('/', (req, res) => {
    res.send("Surau Booking System Staffs database")
})

app.get('/staffs', (req, res) => {
    res.send(importData)
})

app.get('/AJK', (req, res) => {
    if (importData.staffs[0].staffrole === 'AJK') {
        res.send(importData.staffs[0].members)
    }
})

app.get('/Bilal', (req, res) => {
    if (importData.staffs[1].staffrole === 'Bilal 1') {
        res.send(importData.staffs[1].members)
    }
})

app.get('/Imam', (req, res) => {
    if (importData.staffs[2].staffrole === 'Imam 1') {
        res.send(importData.players[2].members)
    }
})

app.get('/Setiausaha', (req, res) => {
    if (importData.players[3].staffrole === 'Setiausaha') {
        res.send(importData.staffs[3].members)
    }
})

app.listen(port, () => {
    console.log(`App is listening to port ${port}`)
})
