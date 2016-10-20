-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: superheroes
-- ------------------------------------------------------
-- Server version	5.7.9

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `superhero_2_pk`
--

DROP DATABASE IF EXISTS `superheroes`;

CREATE DATABASE `superheroes`;

USE `superheroes`;

DROP TABLE IF EXISTS `superhero_2_pk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `superhero_2_pk` (
  `name` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `real_first_name` varchar(20) DEFAULT NULL,
  `real_surname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`name`,`city`)
) ENGINE=INNODB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `superhero_2_pk`
--

LOCK TABLES `superhero_2_pk` WRITE;
/*!40000 ALTER TABLE `superhero_2_pk` DISABLE KEYS */;
INSERT INTO `superhero_2_pk` VALUES ('Spiderman','New York','Peter','Parker'),('Superman','Metropolis','Clark','Kent'),('Batman','Gotham City','Bruce','Wayne'),('Spiderman','Metropolis','Bruce','Clark'),('Batman','Metropolis','Bruce','Wayne'),('Batgirl','Gotham City','Barbara','Gordon'),('Radioactiveman','Springfield',NULL,NULL);
/*!40000 ALTER TABLE `superhero_2_pk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `superhero_no_pk`
--

DROP TABLE IF EXISTS `superhero_no_pk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `superhero_no_pk` (
  `name` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `Real_First_Name` varchar(20) DEFAULT NULL,
  `Real_Surname` varchar(20) DEFAULT NULL
) ENGINE=INNODB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `superhero_no_pk`
--

LOCK TABLES `superhero_no_pk` WRITE;
/*!40000 ALTER TABLE `superhero_no_pk` DISABLE KEYS */;
INSERT INTO `superhero_no_pk` VALUES ('Spiderman','New York','Peter','Parker'),('Superman','Metropolis','Clark','Kent'),('Batman','Gotham City','Bruce','Wayne');
/*!40000 ALTER TABLE `superhero_no_pk` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-08-23 10:10:39
