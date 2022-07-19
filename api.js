const client = require('./connection.js')
const express = require('express');
const app = express();

app.listen(5432, ()=>{
    console.log("Server is now listening at port 5432");
})

client.connect();

app.get('/staff', (req, res) =>{
    client.query('Select * from staff', (err, result)=>{
    if(!err) {
        res.send(result.rows);
    }
    });

    client.end;
})
