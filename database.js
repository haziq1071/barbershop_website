const {Client} = require('pg')

const client = new Client({
    host: "ec2-52-72-56-59.compute-1.amazonaws.com",
    user: "dnzxqagexabepj",
    port: 5432,
    password: "edb330e6fe55ed3bb6d1ee1eb3c1f995e6b205eb5d464bee634abc3345b2d294",
    database: "d274lnoegak379"
})

client.connect();

client.query('Select * from staff', (err, res)=>{
    if(!err){
        console.log(res.rows);
    }else {
        console.log(err.message);
    }
    client.end;
})