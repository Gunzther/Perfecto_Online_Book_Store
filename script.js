var express = require("express");
var mysql = require("mysql");
var app = express();
var path = require("path");
var fs = require("fs");
var bodyParser = require("body-parser");

app.use(bodyParser.urlencoded({ extended: false }));
app.use(express.static(__dirname + "./files"));

function getConnection() {
  return mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "new12345", //if need, put your password here
    database: "perfectoDB"
  });
}

var connection = getConnection();

app.use("/cssFiles", express.static(__dirname + "/css"));
app.use("/js", express.static(__dirname + "/js"));
app.use("/img", express.static(__dirname + "/img"));

connection.connect(function(error) {
  if (error) {
    console.log(error);
    console.log("Error");
  } else {
    console.log("Connected");
  }
});

var main_web = "/book_detail_rows_";
var Categories_book = [
  "'Literature and Fiction'",
  "'Health and Well-Being'",
  "'Comics and Graphic Novels'",
  "'Computers and Internet'",
  "'Military and War'",
  "'Self-Enrichment'"
];

Categories_book.forEach(element => {
  app.get(
    main_web +
      element
        .split(" ")
        .join("_")
        .split("'")
        .join(""),
    function(req, res) {
      // mysql here
      connection.query(
        "SELECT BookID, BookName, PenName, ISBN, BookPrice, Categories FROM perfectodb.book_detail, perfectodb.authors WHERE book_detail.AuthorID = authors.AuthorID and Categories = " +
          element,
        function(error, rows, fields) {
          if (error) {
            console.log("Error in query");
          } else {
            res.send(rows);
          }
        }
      );
    }
  );
});

app.get("/", function(req, res) {
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
    res.sendFile("404.html", { root: path.join(__dirname, "./files") });
  }
});

app.post("/cart_fin", (req, res) => {
  console.log("posting");
  console.log("first name: " + req.body.create_first_name);

  var firstName = req.body.create_first_name;
  var lastName = req.body.create_last_name;
  var age = req.body.create_age;
  var gender = req.body.create_gender;
  var address = req.body.create_address;
  var city = req.body.create_city;
  var country = req.body.create_country;
  var zip = req.body.create_zip;

  const queryString =
    "INSERT INTO customers (FirstName, LastName, Age, Gender, Address, City, Country, ZipCode) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
  getConnection().query(
    queryString,
    [firstName, lastName, age, gender, address, city, country, zip],
    (err, results, fields) => {
      if (err) {
        console.log("failed");
        res.sendStatus(500);
        return;
      }
      console.log("The customerID is: ", results.insertId);
    }
  );
  res.end();
});
// res.redirect("/index");

app.post("/put_to_cart", (req, res) => {
  console.log("posting" + req);
  console.log("isbn: " + req.body.isbn);

  res.end();
});
app.listen(1234);
