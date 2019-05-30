var express = require("express");
var mysql = require("mysql");
var app = express();
var path = require('path');
var fs = require('fs');
var bodyParser = require('body-parser');

app.use(bodyParser.urlencoded({extended: false}))

function getConnection(){
    return mysql.createConnection({
        host: 'localhost',
        user: 'root',
        password: '', //if need, put your password here
        database: 'perfectoDB'
    })
}
var connection = getConnection();

app.use("/cssFiles", express.static(__dirname + "/assets"));

connection.connect(function(error) {
  if (error) {
    console.log("Error");
  } else {
    console.log("Connected");
  }
});

app.get('/customers', function(req, res){
    // mysql here
    connection.query("SELECT * FROM customers", function(error, rows, fields){
        if(error){
            console.log('Error in query');
        }else{
            res.send(rows);
        }
    })
});

app.get(/^(.+)$/, function(req, res) {
  try {
    if (
      fs
        .statSync(path.join(__dirname, "./files", req.params[0] + ".html"))
        .isFile()
    ) {
      res.sendFile(req.params[0] + ".html", {
        root: path.join(__dirname, "./files")
      });
    }
  } catch (err) {
    console.log(err);
    res.sendFile("404.html", { root: path.join(__dirname, "./files") });
  }
});

app.post('/cart_fin', (req, res) =>{
    console.log("posting");
    console.log("first name" + req.body.create_first_name);

    var firstName = req.body.create_first_name;
    var lastName = req.body.create_last_name;
    var age = req.body.create_age;
    var gender = req.body.create_gender;
    var address = req.body.create_address;
    var city = req.body.create_city;
    var country = req.body.create_country;
    var zip = req.body.create_zip;

    const queryString =  "INSERT INTO customers (FirstName, LastName, Age, Gender, Address, City, Country, ZipCode) VALUES (?, ?, ?, ?, ?, ?, ?, ?)"
    getConnection().query(queryString, [firstName, lastName, age, gender, address, city, country, zip], (err, results, fields) =>{
        if(err){
            console.log("failed")
            res.sendStatus(500)
            return;
        }
        console.log("id ----> ", results.insertedId)
    })
    res.end();
})

app.listen(1234);
