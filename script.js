var express = require("express");
var mysql = require("mysql");
var app = express();
var path = require("path");
var fs = require("fs");

var connection = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "", //if need, put your password here
  database: "perfectoDB"
});

app.use("/cssFiles", express.static(__dirname + "/assets"));

connection.connect(function(error) {
  if (error) {
    console.log("Error");
  } else {
    console.log("Connected");
  }
});

app.get("/", function(req, res) {
  // mysql here
  // connection.query("SELECT * FROM Books", function(error, rows, fields){
  //     if(error){
  //         console.log('Error in query');
  //     }else{
  //         console.log('Successful query\n');
  //         console.log(rows);
  //     }
  // }),
  res.sendFile("index.html", { root: path.join(__dirname, "./files") });
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

app.listen(1234);
