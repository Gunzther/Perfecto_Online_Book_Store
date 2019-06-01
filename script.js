var express = require("express");
var mysql = require("mysql");
var app = express();
var path = require("path");
var fs = require("fs");
var bodyParser = require("body-parser");

let current_order_num;
let order_list;

app.use(bodyParser.urlencoded({ extended: false }));
app.use(express.static(__dirname + "./files"));

function getConnection() {
  return mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "keep1234", //if need, put your password here
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

app.get("/book_detail_rows_all", function(req, res) {
  // mysql here
  connection.query(
    "SELECT distinct BookName,BookID,BookPrice FROM book_detail",
    function(error, rows, fields) {
      if (error) {
        console.log("Error in query1");
      } else {
        res.send(rows);
      }
    }
  );
});
//for admin
app.get("/book_detail_rows_checking_for_admin_1", function(req, res) {
  connection.query(
    "SELECT YEAR(DATE) as YearDate, BookName, PublisherName, sum(Quantity) as Quantity, sum(BookPrice*Quantity) as Total FROM  order_detail, book_detail, publishers WHERE order_detail.BookID = book_detail.BookID and book_detail.PublisherID = publishers.PublisherID GROUP BY YearDate,BookName, PublisherName ORDER By YearDate, Total",
    function(error, rows, fields) {
      if (error) {
        console.log("Error in query2");
        console.log(error);
      } else {
        res.send(rows);
      }
    }
  );
});
app.get("/book_detail_rows_checking_for_admin_2", function(req, res) {
  connection.query(
    "SELECT YEAR(DATE) as YearDate, BookName, PublisherName" +
      " FROM order_detail, book_detail, publishers" +
      " WHERE book_detail.BookID NOT IN(SELECT BookID" +
      " FROM order_detail)and book_detail.PublisherID = publishers.PublisherID" +
      " GROUP BY YEAR(DATE), BookName, PublisherName",
    function(error, rows, fields) {
      if (error) {
        console.log("Error in query3");
      } else {
        res.send(rows);
      }
    }
  );
});
app.get("/book_detail_rows_checking_for_admin_3", function(req, res) {
  connection.query(
    "SELECT YEAR(DATE) as YearDate, Categories,  sum(Quantity) as Quantity, sum(BookPrice*Quantity) as Total" +
      " FROM order_detail, book_detail" +
      " WHERE order_detail.BookID = book_detail.BookID" +
      " GROUP BY YEAR(Date), Categories",
    function(error, rows, fields) {
      if (error) {
        console.log("Error in query4");
      } else {
        res.send(rows);
      }
    }
  );
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
        "SELECT BookID, BookName, PenName, ISBN, BookPrice, Categories FROM perfectoDB.book_detail, perfectoDB.authors WHERE book_detail.AuthorID = authors.AuthorID and Categories = " +
          element,
        function(error, rows, fields) {
          if (error) {
            console.log("Error in query5");
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

app.post("/customer_order_list", function(req, res) {
  order_list = req.body.cart;
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
  let id;

  function appendLeadingZeroes(n) {
    if (n <= 9) {
      return "0" + n;
    }
    return n;
  }

  let current_datetime = new Date();
  let formatted_date =
    current_datetime.getFullYear() +
    "-" +
    appendLeadingZeroes(current_datetime.getMonth() + 1) +
    "-" +
    appendLeadingZeroes(current_datetime.getDate());

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
      id = results.insertId;
    }
  );
  // get current number

  connection.query("SELECT OrderNumber FROM order_detail", function(
    error,
    rows,
    fields
  ) {
    if (error) {
      console.log("Error in query6");
    } else {
      current_order_num = rows[rows.length - 1].OrderNumber;
    }
  });

  const queryStringOrder =
    "INSERT INTO order_detail (OrderNumber, Date, CustomerID, BookID, Quantity, Shipping_Method) VALUES (?, ?, ?, ?, ?, ?)";
  var bookID = order_list.split(";");

  setTimeout(function() {
    var quantity = 1;
    var shipping_Method = 1;
    var order_num_put = current_order_num + 1;
    bookID.forEach(element => {
      getConnection().query(
        queryStringOrder,
        [order_num_put, formatted_date, id, element, quantity, shipping_Method],
        (err, results, fields) => {
          if (err) {
            console.log("failed");
            res.sendStatus(500);
            return;
          }
        }
      );
    });
  }, 2000);
  res.redirect("/fin");
});

app.post("/cart_", (req, res) => {
  console.log("posting to order_detail");

  var orderNumber;
  var today = new Date();
  var date =
    today.getFullYear() + "-" + (today.getMonth() + 1) + "-" + today.getDate();
  var CustomerID;
  var bookName = "HarryPotter";
  var quantity = 3;

  const queryString =
    "INSERT INTO order_detial (OrderNumber,Date, CustomerID, BookName, Quantity) VALUES (?,?, ?, ?, ?)";
  getConnection().query(
    queryString,
    [orderNumber, date, CustomerID, bookName, quantity],
    (err, results) => {
      if (err) {
        console.log("failed");
        res.sendStatus(500);
        return;
      }
      console.log("id ----> ", results.insertedId);
    }
  );
});
// res.redirect("/index");

app.post("/put_to_cart", (req, res) => {
  console.log("posting" + req);
  console.log("isbn: " + req.body.isbn);

  res.end();
});
app.listen(1234);
