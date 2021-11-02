-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `albums`
--

DROP TABLE IF EXISTS `albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `albums` (
  `idAlbums` int NOT NULL AUTO_INCREMENT,
  `Album_name` varchar(45) NOT NULL,
  `Release_Date` datetime NOT NULL,
  `Num_of_songs` int NOT NULL,
  `Album_price` decimal(10,2) NOT NULL,
  `Genre_idGenre` int NOT NULL,
  `Artist_idArtist` int NOT NULL,
  PRIMARY KEY (`idAlbums`),
  KEY `fk_Albums_Genre1_idx` (`Genre_idGenre`),
  KEY `fk_Albums_Artist1_idx` (`Artist_idArtist`),
  CONSTRAINT `fk_Albums_Artist1` FOREIGN KEY (`Artist_idArtist`) REFERENCES `artist` (`idArtist`),
  CONSTRAINT `fk_Albums_Genre1` FOREIGN KEY (`Genre_idGenre`) REFERENCES `genre` (`idGenre`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albums`
--

LOCK TABLES `albums` WRITE;
/*!40000 ALTER TABLE `albums` DISABLE KEYS */;
INSERT INTO `albums` VALUES (1,'Always','2017-11-27 00:00:00',5,9.00,6,7),(2,'The moon','2017-08-21 00:00:00',7,8.00,4,3),(3,'Christmas','2017-07-15 00:00:00',7,15.00,1,1),(4,'Legends never die','2018-05-21 00:00:00',6,7.00,1,8),(5,'Across the sky','2018-02-25 00:00:00',4,8.00,8,5),(6,'At all cost','2019-01-22 00:00:00',4,5.00,7,4),(7,'Pop smoke','2019-08-17 00:00:00',5,5.00,5,6),(8,'Always','2020-07-14 00:00:00',6,11.00,2,2),(9,'Forever','2020-08-21 00:00:00',6,6.00,2,4);
/*!40000 ALTER TABLE `albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `albums_has_instruments`
--

DROP TABLE IF EXISTS `albums_has_instruments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `albums_has_instruments` (
  `Albums_idAlbums` int NOT NULL,
  `Instruments_idInstruments` int NOT NULL,
  PRIMARY KEY (`Albums_idAlbums`,`Instruments_idInstruments`),
  KEY `fk_Albums_has_Instruments_Instruments1_idx` (`Instruments_idInstruments`),
  KEY `fk_Albums_has_Instruments_Albums1_idx` (`Albums_idAlbums`),
  CONSTRAINT `fk_Albums_has_Instruments_Albums1` FOREIGN KEY (`Albums_idAlbums`) REFERENCES `albums` (`idAlbums`),
  CONSTRAINT `fk_Albums_has_Instruments_Instruments1` FOREIGN KEY (`Instruments_idInstruments`) REFERENCES `instruments` (`idInstruments`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albums_has_instruments`
--

LOCK TABLES `albums_has_instruments` WRITE;
/*!40000 ALTER TABLE `albums_has_instruments` DISABLE KEYS */;
INSERT INTO `albums_has_instruments` VALUES (4,1),(9,1),(5,2),(6,2),(8,3),(1,5),(3,6),(2,7),(7,8);
/*!40000 ALTER TABLE `albums_has_instruments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artist`
--

DROP TABLE IF EXISTS `artist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artist` (
  `idArtist` int NOT NULL AUTO_INCREMENT,
  `Artist_First_Name` varchar(45) NOT NULL,
  `Artist_Last_Nmae` varchar(45) NOT NULL,
  `Artist_Gender` varchar(45) NOT NULL,
  `Artist_age` int NOT NULL,
  PRIMARY KEY (`idArtist`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artist`
--

LOCK TABLES `artist` WRITE;
/*!40000 ALTER TABLE `artist` DISABLE KEYS */;
INSERT INTO `artist` VALUES (1,'Rihana','Rodyn','F',30),(2,'Taylor','Swift','F',34),(3,'Justin','Bieber','M',32),(4,'Chris','Brown','M',40),(5,'Bruno','Maris','M',40),(6,'Adele','Blue','F',38),(7,'Honey','Singh','M',38),(8,'Taylor','Swift','M',39),(9,'Mika','singh','F',45),(10,'Taylor','swift','F',37);
/*!40000 ALTER TABLE `artist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `idCustomers` int NOT NULL AUTO_INCREMENT,
  `First_Name` varchar(45) NOT NULL,
  `Last_Name` varchar(45) NOT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Gender` varchar(45) NOT NULL,
  `City` varchar(45) NOT NULL,
  `Country` varchar(45) NOT NULL,
  `Province` varchar(45) NOT NULL,
  PRIMARY KEY (`idCustomers`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Jack','Daniel','jg@gmail.com','M','LA','USA','Louisiana'),(2,'Robert','Jane','rjane@gmail.com','M','Brampton','Canada','Ontario'),(3,'Maroky','Jackson','mv@gmail.com','M','Cochan','India','Kerala'),(4,'Jenny','Ben','jennyb@gmail.com','F','Brampton','Canada','Ontario'),(5,'Diego','Ronan','dr@gmail.com','M','Paris','France','Lie-de-france'),(6,'Marco','Polo','mvPolo@gmail.com','M','Monstreal','Canada','Quebec'),(7,'Gurbeer','Singh','gs@gmail.com','F','Moga','India','Punjab'),(8,'Ajay','Deep','aj@gmail.com','M','Brampton','Canada','Ontario'),(9,'John ','Berry','jberry@gmail.com','F','New York','America','Albany'),(10,'Sahav','Singh','ss@gmail.com','M','Mumbai','India','Maharastra');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre` (
  `idGenre` int NOT NULL AUTO_INCREMENT,
  `Genre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idGenre`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (1,'Hip Hop'),(2,'Romantic'),(3,'Electro'),(4,'Jazz'),(5,'Country music'),(6,'Rock music'),(7,'Metal'),(8,'Rap');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instruments`
--

DROP TABLE IF EXISTS `instruments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instruments` (
  `idInstruments` int NOT NULL AUTO_INCREMENT,
  `Instrument_Name` varchar(45) NOT NULL,
  `Instrument_Type` varchar(45) NOT NULL,
  PRIMARY KEY (`idInstruments`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instruments`
--

LOCK TABLES `instruments` WRITE;
/*!40000 ALTER TABLE `instruments` DISABLE KEYS */;
INSERT INTO `instruments` VALUES (1,'Drum','Percussion'),(2,'Guitar','Electric'),(3,'Piano','Keyboard'),(4,'Flute','Wind'),(5,'Organ','Wind'),(6,'Banjo','Electric'),(7,'Harmonium','Keyboard'),(8,'Violin','Stringed');
/*!40000 ALTER TABLE `instruments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `idOrder_Items` int NOT NULL AUTO_INCREMENT,
  `Product_Price` decimal(10,2) NOT NULL,
  `Product_quantity` int NOT NULL,
  `Orders_idOrders` int NOT NULL,
  `Albums_idAlbums` int NOT NULL,
  PRIMARY KEY (`idOrder_Items`),
  KEY `fk_Order_Items_Orders1_idx` (`Orders_idOrders`),
  KEY `fk_Order_Items_Albums1_idx` (`Albums_idAlbums`),
  CONSTRAINT `fk_Order_Items_Albums1` FOREIGN KEY (`Albums_idAlbums`) REFERENCES `albums` (`idAlbums`),
  CONSTRAINT `fk_Order_Items_Orders1` FOREIGN KEY (`Orders_idOrders`) REFERENCES `orders` (`idOrders`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,2.00,3,2,3),(2,1.00,1,3,4),(3,1.50,4,4,5),(4,1.00,3,6,1),(5,1.25,4,7,2),(6,3.00,1,10,2),(7,0.75,1,8,7),(8,1.75,1,5,6),(9,4.00,2,9,4),(10,2.25,2,1,8);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `idOrders` int NOT NULL AUTO_INCREMENT,
  `Order_Date` date NOT NULL,
  `Ship_Amount` decimal(10,2) NOT NULL,
  `Ship_Date` date NOT NULL,
  `Customers_idCustomers` int NOT NULL,
  PRIMARY KEY (`idOrders`),
  KEY `fk_Orders_Customers_idx` (`Customers_idCustomers`),
  CONSTRAINT `fk_Orders_Customers` FOREIGN KEY (`Customers_idCustomers`) REFERENCES `customers` (`idCustomers`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2020-09-23',2.00,'2020-03-17',3),(2,'2020-09-22',1.00,'2018-05-11',2),(3,'2020-09-24',3.00,'2018-09-22',1),(4,'2020-09-11',2.00,'2019-05-01',7),(5,'2020-09-12',1.00,'2019-06-10',6),(6,'2020-09-11',2.00,'2020-09-21',5),(7,'2020-09-18',4.00,'2020-04-11',4),(8,'2020-08-27',3.00,'2020-08-18',8),(9,'2020-08-25',2.00,'2020-09-21',10),(10,'2020-09-19',1.00,'2020-10-28',9);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'mydb'
--

--
-- Dumping routines for database 'mydb'
--
/*!50003 DROP FUNCTION IF EXISTS `product_sales` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `product_sales`(
sales_month DATE
) RETURNS int
    READS SQL DATA
    DETERMINISTIC
BEGIN 
    DECLARE product_number INT;
    SELECT SUM(ot.Product_quantity)
    INTO product_number
    FROM order_items ot
    JOIN orders o ON ot.Orders_idOrders= o.idOrders
    WHERE MONTH(o.Order_Date) = sales_month;
    RETURN (product_number);
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-08 13:25:33
