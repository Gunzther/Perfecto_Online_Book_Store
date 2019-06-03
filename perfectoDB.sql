-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: perfectodb
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `authors` (
  `AuthorID` int(11) DEFAULT NULL,
  `PenName` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1,'J.K. Rowling'),(2,'Joe Wicks'),(3,' Kibblesmith, Daniel'),(4,' Del Pennino, Mario'),(5,'Campbell, Jim'),(6,'Fisch, Sholly'),(7,'Villa, Carlos '),(8,'Ortiz, Ricardo Lopez '),(9,'Kano'),(10,'Portela, Francis'),(11,'Dawson, Delilah S.'),(12,'Charm, Derek'),(13,'Galloway, Sean'),(14,'Martin, Robert C.'),(15,' Frank,Anne'),(16,'Manson, Mark'),(17,'Clear, James'),(18,'Byrne, Rhonda');
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_detail`
--

DROP TABLE IF EXISTS `book_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `book_detail` (
  `BookID` int(11) NOT NULL,
  `BookName` text,
  `ISBN` bigint(20) DEFAULT NULL,
  `Categories` text,
  `BookPrice` int(11) DEFAULT NULL,
  `BookWeight` int(11) DEFAULT NULL,
  `AuthorID` int(11) DEFAULT NULL,
  `PublisherID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_detail`
--

LOCK TABLES `book_detail` WRITE;
/*!40000 ALTER TABLE `book_detail` DISABLE KEYS */;
INSERT INTO `book_detail` VALUES (1,'Harry Potter and the Philosopher\'s Stone',9781408855652,'Literature and Fiction',307,800,1,1),(2,'Harry Potter and the Chamber of Secrets',9781408898109,'Literature and Fiction',276,760,1,1),(3,'Harry Potter and the Prisoner of Azkaban',9781408855911,'Literature and Fiction',276,760,1,1),(4,'Harry Potter and the Goblet of Fire',9781408855928,'Literature and Fiction',389,830,1,1),(5,'Harry Potter and the Order of the Phoenix',9781408855935,'Literature and Fiction',304,800,1,1),(6,'Harry Potter and the Half-Blood Prince',9781408855942,'Literature and Fiction',315,800,1,1),(7,'Harry Potter and the Deathly Hallows',9781408855959,'Literature and Fiction',304,800,1,1),(8,'Cooking for Family & Friends : 100 Lean Recipes to Enjoy Together',9781509820252,'Health and Well-Being',723,600,2,2),(9,'Marvel Super Hero Adventures Spider-Man (Marvel Super Hero Adventures)',9781302917326,'Comics and Graphic Novels',336,100,3,3),(9,'Marvel Super Hero Adventures Spider-Man (Marvel Super Hero Adventures)',9781302917326,'Comics and Graphic Novels',336,100,4,3),(9,'Marvel Super Hero Adventures Spider-Man (Marvel Super Hero Adventures)',9781302917326,'Comics and Graphic Novels',336,100,5,3),(9,'Marvel Super Hero Adventures Spider-Man (Marvel Super Hero Adventures)',9781302917326,'Comics and Graphic Novels',336,100,6,3),(10,'Lockjaw : Who\'s a Good Boy? (Lockjaw)',9781302912529,'Comics and Graphic Novels',537,100,3,3),(10,'Lockjaw : Who\'s a Good Boy? (Lockjaw)',9781302912529,'Comics and Graphic Novels',537,100,7,3),(11,'Black Panther vs. Deadpool (Black Panther Vs. Deadpool)',9781302915490,'Comics and Graphic Novels',510,100,3,3),(11,'Black Panther vs. Deadpool (Black Panther Vs. Deadpool)',9781302915490,'Comics and Graphic Novels',510,100,8,3),(12,'Quantum and Woody! 1 : Kiss Kiss, Klang Klang (Quantum and Woody!)',9781682152690,'Comics and Graphic Novels',336,100,3,3),(12,'Quantum and Woody! 1 : Kiss Kiss, Klang Klang (Quantum and Woody!)',9781682152690,'Comics and Graphic Novels',336,100,9,3),(12,'Quantum and Woody! 1 : Kiss Kiss, Klang Klang (Quantum and Woody!)',9781682152690,'Comics and Graphic Novels',336,100,10,3),(13,'Star Wars Adventures 3 : Endangered (Star Wars Adventures)',9781684052493,'Comics and Graphic Novels',336,100,6,4),(13,'Star Wars Adventures 3 : Endangered (Star Wars Adventures)',9781684052493,'Comics and Graphic Novels',336,100,11,4),(13,'Star Wars Adventures 3 : Endangered (Star Wars Adventures)',9781684052493,'Comics and Graphic Novels',336,100,12,4),(13,'Star Wars Adventures 3 : Endangered (Star Wars Adventures)',9781684052493,'Comics and Graphic Novels',336,100,13,4),(14,'Clean Code : A Handbook of Agile Software Craftsmanship',9780132350884,'Computers and Internet',2127,1100,14,5),(15,'Clean Architecture : A Craftsman\'s Guide to Software Structure and Design',9780134494166,'Computers and Internet',1276,960,14,5),(16,'The Clean Coder : A Code of Conduct for Professional Programmers ',9780137081073,'Computers and Internet',1772,1000,14,5),(17,'Diary of a Young Girl : The Definitive Edition',9780241952436,'Military and War',380,810,15,6),(18,'The Cult of the Constitution',9781503603226,'Military and War',874,500,15,7),(19,'Everything is F*cked',9780062888464,'Self-Enrichment',604,400,16,8),(20,'The Subtle Art of Not Giving a F*ck : A Counterintuitive Approach to Living a Good Life (OME)',9780062641540,'Self-Enrichment',575,400,16,8),(21,'Atomic Habits : An Easy and Proven Way to Build Good Habits and Break Bad Ones',9781847941831,'Self-Enrichment',576,400,17,6),(22,'The Secret',9781582701707,'Self-Enrichment',779,500,18,9);
/*!40000 ALTER TABLE `book_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customers` (
  `CustomerID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` text,
  `LastName` text,
  `Age` int(11) DEFAULT NULL,
  `Gender` text,
  `Address` text,
  `City` text,
  `Country` text,
  `ZipCode` text,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Morgan','Howell',14,'Male','Upper Saddle River','New Jersey','United State ','7458'),(2,'Abraham','Barker',54,'Male','20 Vauxhall Bridge Road','London','United State','SW1V 2SA'),(3,'Sara','Morton',42,'Female','485 Broadway, First Floor','Redwood','California','CA 94063-8460'),(4,'Bruce','Hale',72,'Male','195 Broadway','New York','United State ','NY 10007'),(5,'Floyd','Preston',11,'Male','Hillsboro, Oregon','','United States','-'),(6,'Timothy','Rooney',40,'Male','50 Bedford Square','London','United Kingdom','WC1B 3DP'),(7,'Hussain','Rhodes',23,'Male','20 New Wharf Road','London','United Kingdom','N1 9RR'),(8,'Jackson','Gonzalez',59,'Male','135 W. 50th Street','New York','United State ','NY 10020'),(9,'Shane','Cole',21,'Female','5080 Santa Fe Street Suite 106 ','San Diego','United States','CA 92109'),(10,'Ted','Duran',46,'Male','20 RF7Q+WF Bang Phai, Mueang Nonthaburi ','Nonthaburi','Thailand','11130'),(11,'Hank','Sims',17,'Male','14 Khwaeng Sala Thammasop, Khet Thawi Watthana','Bangkok','Thailand','10170'),(12,'Jim','Fields',42,'Male','Noppharat Alley, Khwaeng Sala Thammasop, Khet Thawi Watthana','Bangkok','Thailand','10170'),(13,'Henry','Garner',41,'Male','75/1 Sala Thammasop, Thawi Watthana','Bangkok','Thailand','10170'),(14,'Willard','Lyam',63,'Male','199/62 Kuphara 1 Alley, Tambon Bang Phli Yai, Amphoe Bang Phli','Samut Prakan','Thailand','10540'),(15,'Ronnie','Robles',58,'Male','47 Ekachai Rd, Tambon Mahachai','Samut Sakhon','Thailand','74000'),(16,'Myles','Davison',62,'Male','35 Moo 7 Amphoe Lansaka, Nakhonsrithammarat, Tambon Tha Di','Nakhon Si Thammarat','Thailand','80230'),(17,'Zach','Jimenez',51,'Male','390 Thanon Si Sunthon, Tambon Choeng Thale, Amphoe Thalang','Phuket','Thailand','83110'),(18,'Aiden','Day',32,'Male','8 Khwaeng Sala Thammasop, Khet Thawi Watthana','Bangkok','Thailand','10170'),(19,'Bryan','Castro',47,'Male','12 Noppharat Alley, Khwaeng Sala Thammasop, Khet Thawi Watthana','Bangkok','Thailand','10170'),(20,'Abe','Parsons',21,'Male','78 Sala Thammasop, Thawi Watthana','Bangkok','Thailand','10170'),(21,'Elizabeth','Higgins',21,'Female','191 Kuphara 1 Alley, Tambon Bang Phli Yai, Amphoe Bang Phli','Samut Prakan','Thailand','10540'),(22,'Michaela','Delgado',20,'Female','414 Ekachai Rd, Tambon Mahachai','Samut Sakhon','Thailand','74000'),(23,'Jane','Armstrong',28,'Female','31 Moo 7 Amphoe Lansaka, Nakhonsrithammarat, Tambon Tha Di','Nakhon Si Thammarat','Thailand','80230'),(24,'Shelley','Frost',79,'Female','30 Thanon Si Sunthon, Tambon Choeng Thale, Amphoe Thalang','Phuket','Thailand','83110'),(25,'Katy','Matthews',50,'Female','18/4 Tambon Bang Pu Mai, Amphoe Mueang Samut Prakan','Samut Prakan','Thailand','10280'),(26,'Hana','Ryan',43,'Female','Hillsboro, Oregon','','United States','-'),(27,'Kitty','Houston',36,'Female','501 Bedford Square','London','United Kingdom','WC1B 3DP'),(28,'Veronica','Gomez',37,'Female','201 New Wharf Road','London','United Kingdom','N1 9RR'),(29,'Hafsa','Mejia',28,'Female','13 W. 50th Street','New York','United State ','NY 10020'),(30,'Isabelle','Hamilton',17,'Female','508 Santa Fe Street Suite 106 ','San Diego','United States','CA 92109'),(31,'Harris','Burke',19,'Male','208 RF7Q+WF Bang Phai, Mueang Nonthaburi ','Nonthaburi','Thailand','11130'),(32,'Julie','Deleon',18,'Female','145 Khwaeng Sala Thammasop, Khet Thawi Watthana','Bangkok','Thailand','10170'),(33,'Nia','Lawrence',49,'Female','Noppharat Alley, Khwaeng Sala Thammasop, Khet Thawi Watthana','Bangkok','Thailand','10170'),(34,'Halima','Gibbs',47,'Female','75/1 Sala Thammasop, Thawi Watthana','Bangkok','Thailand','10170'),(35,'Tianna','Ward',42,'Female','518/4 Tambon Bang Pu Mai, Amphoe Mueang Samut Prakan','Samut Prakan','Thailand','10280'),(36,'Ray','Stewart',15,'Male','47/89 Noppharat Alley, Khwaeng Sala Thammasop, Khet Thawi Watthana','Bangkok','Thailand','10170'),(37,'Mandi','Rowe',52,'Female','142/9 Sala Thammasop, Thawi Watthana','Bangkok','Thailand','10170'),(38,'Anya','Christie',61,'Female','47/3 Kuphara 7 Alley, Tambon Bang Phli Yai, Amphoe Bang Phli','Samut Prakan','Thailand','10540'),(39,'Demi','Terry',27,'Male','7 Ekachai Rd, Tambon Mahachai','Samut Sakhon','Thailand','74000'),(40,'Amanda','Clarke',25,'Female','3 Moo 9 Amphoe Lansaka, Nakhonsrithammarat, Tambon Tha Di','Nakhon Si Thammarat','Thailand','80230'),(41,'Ilan','Orward',18,'Male','78/1 red-oak road.','London','England','78052CD'),(42,'pornpavee','seri-umnuoy',20,'Female','77/223, Lane.8, Pantiya 1 Village., Bangsithong sub-district, Bangkruai','Nonthaburi','Thailand','11130'),(43,'Jennis','Jenny',19,'Female','50 Kasetsart','Bangkok','Thailand','10000');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `order_detail` (
  `OrderNumber` int(11) DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `CustomerID` int(11) DEFAULT NULL,
  `BookID` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Shipping_Method` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (1,'2018-01-01 00:00:00',3,1,1,1),(1,'2018-01-01 00:00:00',3,2,1,1),(1,'2018-01-01 00:00:00',3,3,1,1),(1,'2018-01-01 00:00:00',3,4,1,1),(1,'2018-01-01 00:00:00',3,5,1,1),(1,'2018-01-01 00:00:00',3,6,1,1),(1,'2018-01-01 00:00:00',3,7,1,1),(2,'2018-01-19 00:00:00',26,20,1,1),(2,'2018-01-19 00:00:00',26,21,1,1),(2,'2018-01-19 00:00:00',26,8,1,1),(3,'2018-01-28 00:00:00',24,9,20,1),(3,'2018-01-28 00:00:00',24,10,1,1),(3,'2018-01-28 00:00:00',24,11,1,1),(3,'2018-01-31 00:00:00',24,13,1,1),(4,'2018-02-02 00:00:00',30,8,1,1),(4,'2018-02-02 00:00:00',30,17,1,1),(5,'2018-02-04 00:00:00',5,8,2,1),(6,'2018-02-07 00:00:00',23,17,1,1),(6,'2018-02-07 00:00:00',23,18,1,1),(6,'2018-02-07 00:00:00',23,9,1,1),(6,'2018-02-07 00:00:00',23,11,1,1),(7,'2018-02-08 00:00:00',14,16,1,1),(7,'2018-02-08 00:00:00',14,15,1,1),(7,'2018-02-08 00:00:00',14,11,3,1),(8,'2018-02-14 00:00:00',2,13,2,1),(8,'2018-02-14 00:00:00',2,11,1,1),(9,'2018-02-16 00:00:00',28,12,1,1),(9,'2018-02-16 00:00:00',28,11,1,1),(9,'2018-02-16 00:00:00',28,13,1,1),(9,'2018-02-16 00:00:00',28,10,1,1),(9,'2018-02-16 00:00:00',28,17,1,1),(10,'2018-02-20 00:00:00',33,13,1,1),(11,'2018-02-21 00:00:00',4,11,1,1),(12,'2018-02-22 00:00:00',13,10,1,1),(13,'2018-02-26 00:00:00',7,13,1,1),(14,'2018-02-28 00:00:00',6,17,1,1),(15,'2018-03-04 00:00:00',21,12,1,1),(16,'2018-03-09 00:00:00',18,1,2,1),(17,'2018-03-21 00:00:00',9,10,1,1),(18,'2018-04-20 00:00:00',34,12,1,1),(19,'2018-04-23 00:00:00',40,11,1,1),(20,'2018-04-30 00:00:00',12,17,1,1),(21,'2018-05-01 00:00:00',35,12,2,1),(22,'2018-05-24 00:00:00',1,1,1,1),(23,'2018-05-26 00:00:00',27,1,1,1),(24,'2018-06-29 00:00:00',15,12,2,1),(25,'2018-06-19 00:00:00',11,1,1,1),(26,'2018-08-11 00:00:00',25,11,1,1),(27,'2018-08-31 00:00:00',32,17,2,1),(28,'2018-09-25 00:00:00',31,12,1,1),(29,'2018-10-17 00:00:00',19,6,1,1),(30,'2018-10-22 00:00:00',10,13,1,1),(31,'2018-11-02 00:00:00',20,5,1,1),(32,'2018-11-06 00:00:00',8,11,2,1),(33,'2018-11-29 00:00:00',17,3,1,1),(34,'2018-11-30 00:00:00',29,12,1,1),(35,'2018-12-05 00:00:00',37,17,1,1),(36,'2018-12-09 00:00:00',22,13,1,1),(36,'2018-12-09 00:00:00',22,20,1,1),(36,'2018-12-09 00:00:00',22,21,1,1),(36,'2018-12-09 00:00:00',22,16,1,1),(37,'2018-12-14 00:00:00',16,16,1,1),(38,'2018-12-22 00:00:00',38,11,1,1),(39,'2018-12-30 00:00:00',39,16,2,1),(40,'2018-12-31 00:00:00',36,12,3,1),(41,'2019-06-01 00:00:00',41,18,1,1),(41,'2019-06-01 00:00:00',41,11,1,1),(42,'2019-06-01 00:00:00',42,8,1,1),(42,'2019-06-01 00:00:00',42,10,1,1),(43,'2019-06-01 00:00:00',43,22,1,1);
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publishers`
--

DROP TABLE IF EXISTS `publishers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `publishers` (
  `PublisherID` int(11) DEFAULT NULL,
  `PublisherName` text,
  `Address` text,
  `City` text,
  `Country` text,
  `ZipCode` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publishers`
--

LOCK TABLES `publishers` WRITE;
/*!40000 ALTER TABLE `publishers` DISABLE KEYS */;
INSERT INTO `publishers` VALUES (1,'Bloomsbury Publishing Plc ','50 Bedford Square','London','United Kingdom','WC1B 3DP'),(2,'Pan Macmillan ','20 New Wharf Road','London','United Kingdom','N1 9RR'),(3,'Marvel Enterprises','135 W. 50th Street','New York','United State ','NY 10020'),(4,'Idea & Design Works Llc','5080 Santa Fe Street Suite 106 ','San Diego','United States','CA 92109'),(5,'Prentice Hall','Upper Saddle River','New Jersey','United State ','7458'),(6,'Penguin Books Ltd','20 Vauxhall Bridge Road','London','United State','SW1V 2SA'),(7,'Stanford Univ Pr','485 Broadway, First Floor','Redwood','California','CA 94063-8460'),(8,'Harpercollins Publishers Inc','195 Broadway','New York','United State ','NY 10007'),(9,'Beyond Words Pub Co','Hillsboro, Oregon','','United States','-');
/*!40000 ALTER TABLE `publishers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_method`
--

DROP TABLE IF EXISTS `shipping_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `shipping_method` (
  `ShippingMethodID` int(11) DEFAULT NULL,
  `CompanyName` text,
  `MethodType` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_method`
--

LOCK TABLES `shipping_method` WRITE;
/*!40000 ALTER TABLE `shipping_method` DISABLE KEYS */;
INSERT INTO `shipping_method` VALUES (1,'ThailandPost','Normal'),(2,'ThailandPost','Registered'),(3,'ThailandPost','EMS'),(4,'Kerry','Bangkok (Bag A 32 x 23 cm.)'),(5,'Kerry','Bangkok (Bag B 36 x 28 cm.)'),(6,'Kerry','Bangkok (Bag C 44 x 31 cm.)'),(7,'Kerry','Bangkok (Mini Size)'),(8,'Kerry','Bangkok (Plus Size)'),(9,'Kerry','Bangkok (Normal)'),(10,'Kerry','Upcountry (Bag A 32 x 23 cm.)'),(11,'Kerry','Upcountry (Bag B 36 x 28 cm.)'),(12,'Kerry','Upcountry (Bag C 44 x 31 cm.)'),(13,'Kerry','Upcountry (Mini Size)'),(14,'Kerry','Upcountry (Plus Size)'),(15,'Kerry','Upcountry (Normal)');
/*!40000 ALTER TABLE `shipping_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_rate`
--

DROP TABLE IF EXISTS `shipping_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `shipping_rate` (
  `ShippingRateID` int(11) DEFAULT NULL,
  `ShippingMethodID` int(11) DEFAULT NULL,
  `WeightFloor(g)` int(11) DEFAULT NULL,
  `WeightCeiling(g)` int(11) DEFAULT NULL,
  `ShippingCost` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_rate`
--

LOCK TABLES `shipping_rate` WRITE;
/*!40000 ALTER TABLE `shipping_rate` DISABLE KEYS */;
INSERT INTO `shipping_rate` VALUES (1,1,0,1000,20),(2,1,1000,2000,35),(3,1,2000,3000,50),(4,1,3000,4000,65),(5,1,4000,5000,80),(6,1,5000,6000,95),(7,1,6000,7000,110),(8,1,7000,8000,125),(9,1,8000,9000,140),(10,1,9000,10000,155),(11,1,10000,11000,170),(12,1,11000,12000,185),(13,1,12000,13000,200),(14,1,13000,14000,215),(15,1,14000,15000,230),(16,2,0,100,18),(17,2,100,200,22),(18,2,250,500,28),(19,2,500,1000,38),(20,2,1000,2000,58),(21,3,0,20,32),(22,3,20,100,37),(23,3,100,250,42),(24,3,250,500,52),(25,3,500,1000,67),(26,3,1000,1500,82),(27,3,1500,2000,97),(28,3,2000,2500,122),(29,3,2500,3000,137),(30,3,3000,3500,157),(31,3,3500,4000,177),(32,3,4000,4500,197),(33,3,4500,5000,217),(34,3,5000,5500,242),(35,3,5500,6000,267),(36,3,6000,6500,292),(37,3,6500,7000,317),(38,3,7000,7500,342),(39,3,7500,8000,367),(40,3,8000,8500,397),(41,3,8500,9000,427),(42,3,9000,9500,457),(43,3,9500,10000,487),(44,4,0,1000,35),(45,5,0,1000,45),(46,6,0,5000,65),(47,7,0,1000,30),(48,8,0,5000,85),(49,8,5000,15000,140),(50,9,0,500,65),(51,9,500,10000,100),(52,9,10000,15000,185),(53,9,15000,20000,290),(54,9,20000,25000,380),(55,10,0,1000,50),(56,11,0,1000,65),(57,12,0,5000,80),(58,13,0,1000,45),(59,14,0,5000,100),(60,14,5000,15000,155),(61,15,0,500,80),(62,15,500,10000,115),(63,15,10000,15000,205),(64,15,15000,20000,330),(65,15,20000,25000,420);
/*!40000 ALTER TABLE `shipping_rate` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-03 13:02:12
