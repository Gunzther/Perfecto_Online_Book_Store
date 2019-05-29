var express = require("express");
var mysql = require("mysql");
var app = express();

var connection = mysql.createConnection({
  host: "localhost",
  port: "8081",
  user: "root",
  passward: "keep1234",
  database: "keeplearning"
});

connection.connect(function(error) {
  if (error) {
    console.log("Error");
  } else {
    console.log("Connected");
  }
});

// app.get("/", function(req, resp) {
//   //mysql here
//   // connection.query("SELECT * FROM perfectoDB", function(error, rows, fields){
//   //     if(!!error){
//   //         console.log('Error in query');
//   //     }else{
//   //         console.log('Successful query');
//   //     }
//   // })
// });

// app.listen(1337);
