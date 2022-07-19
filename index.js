const express = require("express");
const app = express();
const port = 3000;

app.get("/", (req, res) => res.send("Hello apa khabar"));
app.get("/makan", (req, res) => res.send("Sudah makan"));

app.listen(port, ()=> console.log('Aplikasi berjalan di port ${port}'));