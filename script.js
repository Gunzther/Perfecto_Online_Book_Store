var express = require('express');
var mysql = require('mysql');
var app = express();

var connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '', //if need, put your password here
    database: 'perfectoDB'
});

connection.connect(function(error){
    if(!!error){
        console.log('Error');
    }else{
        console.log('Connected');
    }
});

app.get('/', function(req, resp){
    // mysql here
    connection.query("SELECT * FROM Books", function(error, rows, fields){
        if(error){
            console.log('Error in query');
        }else{
            console.log('Successful query\n');
            console.log(rows);
        }
    })
});

app.listen(1234);