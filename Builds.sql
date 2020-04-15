-- MySQL dump 10.13  Distrib 8.0.18, for osx10.15 (x86_64)
--
-- Host: localhost    Database: Builds
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Android`
--

DROP TABLE IF EXISTS `Android`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Android` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `environment` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `url` varchar(150) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Android`
--

LOCK TABLES `Android` WRITE;
/*!40000 ALTER TABLE `Android` DISABLE KEYS */;
INSERT INTO `Android` VALUES (1,'2020-03-18 15:56:21','v1.1.0','test','https://localhost:3000'),(2,'2020-03-18 16:54:09','v1.0.9','test','https://example.com'),(3,'2020-03-18 16:54:42','v1.0.9','test','https://example.com'),(4,'2020-03-18 16:55:16','v1.0.9','test','https://example.com');
/*!40000 ALTER TABLE `Android` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iOS`
--

DROP TABLE IF EXISTS `iOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iOS` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `environment` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `url` varchar(150) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iOS`
--

LOCK TABLES `iOS` WRITE;
/*!40000 ALTER TABLE `iOS` DISABLE KEYS */;
INSERT INTO `iOS` VALUES (9,'2020-03-18 20:16:02','v1.1.0','test','https://example.com','18.03.2020-13.17.03-bta-v1.1.0-test.ipa'),(10,'2020-03-18 20:16:04','v1.1.0','test','https://example.com','18.03.2020-13.17.03-bta-v1.1.0-test.ipa'),(11,'2020-03-18 20:16:06','v1.1.0','test','https://example.com','18.03.2020-13.17.03-bta-v1.1.0-test.ipa'),(12,'2020-03-18 20:16:07','v1.1.0','test','https://example.com','18.03.2020-13.17.03-bta-v1.1.0-test.ipa'),(13,'2020-03-18 20:16:07','v1.1.0','test','https://example.com','18.03.2020-13.17.03-bta-v1.1.0-test.ipa'),(14,'2020-03-18 20:22:12','v1.0.9','test','https://example.com','18.03.2020-13.17.03-bta-v1.1.0-test.ipa'),(15,'2020-03-18 20:22:21','v1.0.7','test','https://example.com','18.03.2020-13.17.03-bta-v1.1.0-test.ipa'),(16,'2020-03-18 20:22:25','v1.0.8','test','https://example.com','18.03.2020-13.17.03-bta-v1.1.0-test.ipa'),(17,'2020-03-18 20:22:29','v1.0.3','test','https://example.com','18.03.2020-13.17.03-bta-v1.1.0-test.ipa'),(18,'2020-03-18 20:22:37','v1.2.3','test','https://example.com','18.03.2020-13.17.03-bta-v1.1.0-test.ipa');
/*!40000 ALTER TABLE `iOS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-23 20:26:08
