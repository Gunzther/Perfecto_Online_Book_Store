# Perfecto_Online_Book_Store

This is a web application that provides users to do an E-commerce about opening a book store. By using the application that has an OLTP part for customers and data warehouse part for the business owner.
The main feature for that OLTP part is user able to select books and then check out after finished choosing books from the application. For the data wear house part, this application has the admin page which can use for show number of books that sold per year, books which weren't sold in each year, and the number of books sold per year in each category.

## Requirement

We recommend using this application with MySQL server for Microsoft Windows operation system

- NPM
- Browser (Reccomended Chrome)
- MySQL server
- MySQL GUI tools (Reccomended MySQLWorkbench)

## How to install

    We reccomended for using this application in window operation system

1. Clone project reposity. Go to your workspace and then clone the project.

   <pre>
   $ cd your_workspace
   $ git clone https://github.com/KameriiJ/Perfecto_Online_Book_Store.git
    </pre>

2. Install MySQL server. You can download it here: [download](https://dev.mysql.com/downloads/mysql/) (download the latest version) then start a server

Or you can use docker by

<pre>
$ docker pull mysql
$ docker run --name some-mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql:tag
</pre>

3. Add data base to your server by using your MySQL GUI tools (In this case MySQLWorkbench)

   1. Create a connection with your server as in the picture <img src ="readme_image/Screen Shot 2562-06-03 at 16.28.04.png">

   2. Go to task server and press Data Import<img src ="readme_image/Screen Shot 2562-06-03 at 16.31.13.png">

   3. Import the data base that is attach in this directory and set the Default Target Schema by adding new schema <img src ="readme_image/Screen Shot 2562-06-03 at 16.36.28.png">

   then your data base is all set

4) Last thing to be concerned. If your server has a password, you must provide that pass word for the script to start a connection you can add your password at script.js file

<img src ="readme_image/Screen Shot 2562-06-03 at 16.40.07.png">

Then run

   <pre>
    $(Perfecto_Online_Book_Store) node script.js
   </pre>

## How to use

You can using application [here](http://localhost:1234/)

To go to the admin page [here](http://localhost:1234/admin)

## Screenshot

<img src ="readme_image/Screen Shot 2562-06-03 at 16.52.35.png">
<img src ="readme_image/Screen Shot 2562-06-03 at 16.52.56.png">
<img src ="readme_image/Screen Shot 2562-06-03 at 16.53.31.png">
<img src ="readme_image/Screen Shot 2562-06-03 at 16.53.46.png">
