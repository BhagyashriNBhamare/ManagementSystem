-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: management
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `username` text,
  `password` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('0','2609841');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data`
--

DROP TABLE IF EXISTS `data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data` (
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `phoneno` varchar(100) DEFAULT NULL,
  `email` varchar(1000) DEFAULT NULL,
  `age` varchar(1000) DEFAULT NULL,
  `dobc` blob,
  `addc` blob,
  `markc` blob,
  `id` int NOT NULL AUTO_INCREMENT,
  `dob` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data`
--

LOCK TABLES `data` WRITE;
/*!40000 ALTER TABLE `data` DISABLE KEYS */;
/*!40000 ALTER TABLE `data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fee`
--

DROP TABLE IF EXISTS `fee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fee` (
  `firstname` text,
  `lastname` text,
  `phoneno` text,
  `email` text,
  `age` text,
  `dob` date DEFAULT NULL,
  `dobc` blob,
  `markc` blob,
  `addc` blob,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fee`
--

LOCK TABLES `fee` WRITE;
/*!40000 ALTER TABLE `fee` DISABLE KEYS */;
INSERT INTO `fee` VALUES ('tanvi','Bhamare','07249504830','bhamare.bhagyashri1999@gmail.com','14','2020-10-15',_binary '6.pdf',_binary '3.pdf',_binary '2.pdf',1),('Bhagyashri','Bhamare','07249504830','bhamare.bhagyashri1999@gmail.com','28','2020-10-21','','','',2),('SNEHAL','Bhamare','07249504830','bhamare.bhagyashri1999@gmail.com','15','2020-10-14',_binary '4.pdf',_binary '2.pdf',_binary '5.pdf',3),('Bhagyashri','Bhamare','07249504830','bhamare.bhagyashri1999@gmail.com','30','2020-11-05','','','',4),('arpit','Bhamare','07249504830','bhamare.bhagyashri1999@gmail.com','20','2020-10-21','','','',5),('arpit','jadiya','07249504830','bhamare.bhagyashri1999@gmail.com','30','2020-10-21',_binary '1.pdf',_binary '3.pdf',_binary '4.pdf',6),('chandana','tulsi','07249504830','bhamare.bhagyashri1999@gmail.com','18','2020-10-14',_binary '4.pdf',_binary '5.pdf',_binary '7.pdf',7),('arpit','jadiya','07249504830','bhamare.bhagyashri1999@gmail.com','30','2020-09-30',_binary '7.pdf',_binary '6.pdf',_binary '7.pdf',8),('Bhagyashri','Bhamare','07249504830','bhamare.bhagyashri1999@gmail.com','10','2020-10-15',_binary '1.pdf',_binary '2.pdf',_binary '4.pdf',9),('sneha','Bhamare','07249504830','bhamare.bhagyashri1999@gmail.com','20','2020-10-14',_binary '1.pdf','','',10),('sneha','Bhamare','07249504830','bhamare.bhagyashri1999@gmail.com','20','2020-10-14','','','',11),('tanvi','Bhamare','07249504830','bhamare.bhagyashri1999@gmail.com','20','2020-10-16','','','',12),('tanvi','Bhamare','07249504830','bhamare.bhagyashri1999@gmail.com','12','2020-10-08','','','',13);
/*!40000 ALTER TABLE `fee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schooldata`
--

DROP TABLE IF EXISTS `schooldata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schooldata` (
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `phoneno` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `age` varchar(100) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `dobc` blob,
  `markc` blob,
  `addc` blob,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schooldata`
--

LOCK TABLES `schooldata` WRITE;
/*!40000 ALTER TABLE `schooldata` DISABLE KEYS */;
INSERT INTO `schooldata` VALUES ('Bhagyashri','Bhamare','07249504830','bhamare.bhagyashri1999@gmail.com','0','2020-10-13',NULL,NULL,NULL,1),('Bhagyashri','Bhamare','07249504830','bhamare.bhagyashri1999@gmail.com','30','2020-10-14','','','',2),('Bhagyashri','Bhamare','07249504830','bhamare.bhagyashri1999@gmail.com','30','2020-10-14','','','',3),('Bhagyashri','Bhamare','07249504830','bhamare.bhagyashri1999@gmail.com','30',NULL,'','','',4),('Bhagyashri','Bhamare','07249504830','bhamare.bhagyashri1999@gmail.com','30',NULL,'','','',5),('Bhagyashri','Bhamare','07249504830','bhamare.bhagyashri1999@gmail.com','30','2020-10-14','','','',6),('Bhagyashri','Bhamare','07249504830','bhamare.bhagyashri1999@gmail.com','30','2020-10-14','','','',7),('Bhagyashri','Bhamare','07249504830','bhamare.bhagyashri1999@gmail.com','30','2020-10-14','','','',8);
/*!40000 ALTER TABLE `schooldata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentfee`
--

DROP TABLE IF EXISTS `studentfee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studentfee` (
  `username` text,
  `password` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentfee`
--

LOCK TABLES `studentfee` WRITE;
/*!40000 ALTER TABLE `studentfee` DISABLE KEYS */;
INSERT INTO `studentfee` VALUES ('2','28'),('3','15'),('4','30'),('5','20'),('6','30'),('7','18'),('8','30'),('9','10'),('undefined','undefined'),('undefined','undefined'),('undefined','undefined');
/*!40000 ALTER TABLE `studentfee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'management'
--

--
-- Dumping routines for database 'management'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-12 12:56:54
