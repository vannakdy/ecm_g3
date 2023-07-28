


// const  mysql = require("mysql2/promise")

// // get the promise implementation, we will use bluebird
// const bluebird = require('bluebird');
// const connection = await mysql.createConnection({
//     host : "localhost",
//     user : 'root',
//     password : "",
//     database : "ecm_g4",
//     Promise: bluebird
// })
// // module.exports = connection

const  mysql = require("mysql2")
const db = mysql.createConnection({
    host : "localhost",
    user : 'root',
    password : "",
    database : "ecm_g4"
})

module.exports = db