-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: quanlynhahangtieccuoi
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill` (
  `id` int NOT NULL AUTO_INCREMENT,
  `booking_id` int NOT NULL,
  `payment_id` int NOT NULL,
  `unit_price` decimal(10,2) DEFAULT '0.00',
  `num` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_booking_has_payment_booking1_idx` (`booking_id`),
  KEY `fk_bill_payment_idx` (`payment_id`),
  CONSTRAINT `fk_bill_payment` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_booking_has_payment_booking1` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=493 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES (7,23,4,200000.00,1),(8,23,4,1000000.00,1),(9,23,5,200000.00,1),(10,23,5,200000.00,1),(11,23,5,250000.00,1),(12,23,5,200000.00,1),(13,23,5,5500000.00,1),(14,23,6,6000000.00,1),(15,23,6,300000.00,1),(16,23,6,500000.00,1),(17,23,7,4000000.00,1),(18,23,7,300000.00,1),(19,23,7,500000.00,1),(20,23,8,5500000.00,1),(21,23,8,500000.00,1),(22,23,8,450000.00,1),(23,23,9,200000.00,1),(24,23,9,500000.00,1),(25,23,9,350000.00,5),(26,23,9,5000000.00,1),(27,23,10,5500000.00,1),(28,23,10,300000.00,1),(29,23,10,450000.00,5),(30,23,10,500000.00,1),(31,27,11,200000.00,1),(32,27,11,250000.00,1),(33,27,11,300000.00,1),(34,27,11,4000000.00,1),(35,27,11,500000.00,1),(36,27,12,200000.00,1),(37,27,12,400000.00,1),(38,27,12,5000000.00,1),(39,27,12,350000.00,1),(40,27,12,450000.00,1),(41,27,13,200000.00,1),(42,27,13,250000.00,1),(43,27,13,6000000.00,1),(44,27,13,350000.00,1),(45,27,14,200000.00,1),(46,27,14,250000.00,1),(47,27,14,300000.00,1),(48,27,14,200000.00,1),(49,27,14,7000000.00,1),(50,27,15,250000.00,1),(51,27,15,5000000.00,1),(52,27,16,4000000.00,1),(53,27,16,450000.00,1),(54,27,16,200000.00,1),(56,34,18,200000.00,1),(57,34,18,250000.00,1),(58,34,18,7000000.00,1),(59,34,18,500000.00,1),(60,35,19,5000000.00,1),(61,35,19,450000.00,1),(62,35,19,500000.00,1),(63,37,20,4000000.00,1),(64,37,20,150000.00,1),(65,37,20,110000.00,1),(66,37,20,400000.00,1),(67,37,20,200000.00,1),(68,38,21,5000000.00,1),(69,38,21,450000.00,10),(70,38,21,200000.00,1),(71,39,22,5000000.00,1),(72,39,22,350000.00,1),(73,39,22,200000.00,1),(74,40,23,200000.00,1),(75,40,23,5000000.00,1),(76,40,23,500000.00,1),(77,41,24,6000000.00,1),(78,41,24,300000.00,1),(79,41,24,500000.00,1),(80,42,25,250000.00,1),(81,42,25,400000.00,1),(82,42,25,350000.00,1),(83,42,25,3000000.00,1),(84,42,25,500000.00,1),(85,43,26,7000000.00,1),(86,43,26,300000.00,1),(87,43,26,200000.00,1),(88,44,27,3000000.00,1),(89,44,27,450000.00,1),(90,44,27,200000.00,1),(91,45,28,3000000.00,1),(92,45,28,400000.00,1),(93,45,28,600000.00,1),(94,45,28,300000.00,1),(95,45,28,500000.00,1),(96,45,28,500000.00,1),(97,46,29,5500000.00,1),(98,46,29,300000.00,1),(99,46,29,500000.00,1),(100,47,30,5000000.00,1),(101,47,30,400000.00,1),(102,47,30,500000.00,1),(103,48,31,6000000.00,1),(104,48,31,300000.00,1),(105,48,31,450000.00,1),(106,48,31,500000.00,1),(107,49,32,5000000.00,1),(108,49,32,300000.00,1),(109,49,32,500000.00,1),(110,50,33,8000000.00,1),(111,50,33,300000.00,1),(112,50,33,500000.00,1),(113,51,34,9000000.00,1),(114,51,34,300000.00,1),(115,51,34,450000.00,1),(116,51,34,400000.00,1),(117,52,35,4000000.00,1),(118,52,35,450000.00,1),(119,52,35,500000.00,1),(257,98,133,6000000.00,1),(258,98,133,300000.00,1),(259,98,133,1000000.00,1),(260,99,134,6000000.00,1),(261,99,134,300000.00,1),(262,99,134,500000.00,1),(263,100,146,4000000.00,1),(264,100,146,400000.00,1),(265,100,146,200000.00,1),(266,101,147,6000000.00,1),(267,101,147,300000.00,1),(268,101,147,200000.00,1),(269,102,151,9000000.00,1),(270,102,151,450000.00,1),(271,102,151,350000.00,1),(272,102,151,200000.00,1),(273,103,152,4000000.00,1),(274,103,152,600000.00,1),(275,103,152,400000.00,1),(276,103,152,200000.00,1),(277,104,153,6000000.00,1),(278,104,153,300000.00,1),(279,104,153,200000.00,1),(280,105,154,8000000.00,1),(281,105,154,300000.00,1),(282,105,154,400000.00,1),(283,105,154,500000.00,1),(284,106,155,6000000.00,1),(285,106,155,350000.00,2),(286,106,155,200000.00,1),(287,107,156,9000000.00,1),(288,107,156,500000.00,1),(289,107,156,100000.00,1),(290,107,156,200000.00,1),(291,108,157,5000000.00,1),(292,108,157,400000.00,1),(293,108,157,200000.00,1),(294,109,158,4000000.00,1),(295,109,158,400000.00,1),(296,109,158,200000.00,1),(297,110,166,4000000.00,1),(298,110,166,450000.00,1),(299,110,166,200000.00,1),(300,111,167,5000000.00,1),(301,111,167,300000.00,1),(302,111,167,400000.00,1),(303,112,168,9000000.00,1),(304,112,168,500000.00,1),(305,112,168,350000.00,1),(306,113,169,7000000.00,1),(307,113,169,300000.00,1),(308,113,169,200000.00,1),(309,114,170,6000000.00,1),(310,114,170,300000.00,1),(311,114,170,200000.00,1),(312,115,171,8000000.00,1),(313,115,171,300000.00,1),(314,115,171,200000.00,1),(315,116,177,8000000.00,1),(316,116,177,450000.00,1),(317,116,177,200000.00,1),(318,117,178,6000000.00,1),(319,117,178,1000000.00,1),(320,117,178,300000.00,1),(321,117,178,500000.00,1),(322,118,179,10000000.00,1),(323,118,179,400000.00,1),(324,118,179,500000.00,1),(325,119,180,5000000.00,1),(326,119,180,400000.00,1),(327,119,180,500000.00,1),(328,120,181,4000000.00,1),(329,120,181,500000.00,1),(330,120,181,400000.00,1),(331,120,181,500000.00,1),(332,121,182,4000000.00,1),(333,121,182,450000.00,1),(334,121,182,400000.00,1),(335,122,183,4000000.00,1),(336,122,183,200000.00,1),(337,122,183,200000.00,1),(338,123,188,4000000.00,1),(339,123,188,450000.00,1),(340,123,188,500000.00,1),(341,124,192,6000000.00,1),(342,124,192,350000.00,1),(343,124,192,200000.00,1),(344,125,193,3000000.00,1),(345,125,193,350000.00,1),(346,125,193,500000.00,1),(347,126,194,6000000.00,1),(348,126,194,350000.00,1),(349,126,194,200000.00,1),(350,127,195,5000000.00,1),(351,127,195,500000.00,1),(352,127,195,300000.00,1),(353,128,205,5000000.00,1),(354,128,205,450000.00,1),(355,128,205,200000.00,1),(356,129,206,5000000.00,1),(357,129,206,400000.00,2),(358,129,206,200000.00,1),(359,130,218,8000000.00,1),(360,130,218,450000.00,1),(361,130,218,200000.00,1),(362,131,219,4000000.00,1),(363,131,219,350000.00,1),(364,131,219,200000.00,1),(365,132,232,6000000.00,1),(366,132,232,350000.00,1),(367,132,232,200000.00,1),(368,133,236,5000000.00,1),(369,133,236,500000.00,1),(370,133,236,350000.00,1),(371,134,237,4000000.00,1),(372,134,237,400000.00,1),(373,134,237,200000.00,1),(374,135,238,5000000.00,1),(375,135,238,350000.00,1),(376,135,238,200000.00,1),(377,136,239,5000000.00,1),(378,136,239,600000.00,1),(379,136,239,1000000.00,1),(380,137,240,8000000.00,1),(381,137,240,400000.00,1),(382,137,240,200000.00,1),(383,138,243,6000000.00,1),(384,138,243,450000.00,1),(385,138,243,200000.00,1),(386,139,244,4000000.00,1),(387,139,244,300000.00,1),(388,139,244,500000.00,1),(389,140,251,8000000.00,1),(390,140,251,300000.00,1),(391,140,251,200000.00,1),(392,141,252,5000000.00,1),(393,141,252,300000.00,1),(394,141,252,500000.00,1),(395,142,256,9000000.00,1),(396,142,256,400000.00,1),(397,142,256,500000.00,1),(398,143,257,4000000.00,1),(399,143,257,400000.00,1),(400,143,257,200000.00,1),(401,144,258,4000000.00,1),(402,144,258,250000.00,1),(403,144,258,400000.00,1),(404,145,259,4000000.00,1),(405,145,259,250000.00,1),(406,145,259,200000.00,1),(407,146,260,3000000.00,1),(408,146,260,300000.00,1),(409,146,260,400000.00,1),(410,147,264,5000000.00,1),(411,147,264,200000.00,1),(412,147,264,250000.00,1),(413,148,265,5000000.00,1),(414,148,265,350000.00,1),(415,148,265,500000.00,1),(416,149,266,3000000.00,1),(417,149,266,400000.00,1),(418,149,266,400000.00,1),(419,150,267,3000000.00,1),(420,150,267,200000.00,1),(421,150,267,4000000.00,1),(422,150,267,500000.00,1),(423,151,270,6000000.00,1),(426,154,273,6000000.00,1),(427,154,273,400000.00,1),(428,154,273,500000.00,1),(429,155,274,4000000.00,1),(430,155,274,200000.00,1),(431,155,274,200000.00,1),(432,156,275,4000000.00,1),(433,156,275,200000.00,1),(434,156,275,200000.00,1),(435,157,276,5000000.00,1),(436,157,276,300000.00,1),(437,157,276,200000.00,1),(438,158,277,8000000.00,1),(439,158,277,600000.00,1),(440,158,277,400000.00,1),(441,159,278,8000000.00,1),(442,159,278,350000.00,1),(443,159,278,500000.00,1),(444,160,280,5500000.00,1),(445,160,280,400000.00,1),(446,160,280,200000.00,1),(459,173,301,4000000.00,1),(460,173,301,300000.00,1),(461,173,301,200000.00,1),(462,174,302,7000000.00,1),(463,174,302,450000.00,1),(464,174,302,200000.00,1),(465,175,303,4000000.00,1),(466,175,303,450000.00,1),(467,175,303,200000.00,1),(468,176,304,5000000.00,1),(469,176,304,300000.00,1),(470,176,304,200000.00,1),(471,177,305,7000000.00,1),(472,177,305,400000.00,1),(473,177,305,400000.00,1),(474,178,306,4000000.00,1),(475,178,306,300000.00,1),(476,178,306,200000.00,1),(477,179,307,3000000.00,1),(478,179,307,300000.00,1),(479,179,307,200000.00,1),(480,180,308,4000000.00,1),(481,180,308,450000.00,1),(482,180,308,200000.00,1),(483,181,309,5000000.00,1),(484,181,309,350000.00,1),(485,181,309,200000.00,1),(486,182,310,6000000.00,1),(487,182,310,80000.00,1),(488,182,310,600000.00,1),(489,182,310,200000.00,1),(490,183,311,5000000.00,1),(491,183,311,350000.00,1),(492,183,311,200000.00,1);
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `id` int NOT NULL AUTO_INCREMENT,
  `booking_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int NOT NULL,
  `hall_id` int NOT NULL,
  `booking_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `table_number` int DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `status` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_booking_user_idx` (`user_id`),
  KEY `fk_booking_hall_idx` (`hall_id`),
  CONSTRAINT `fk_booking_hall` FOREIGN KEY (`hall_id`) REFERENCES `hall` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_booking_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=184 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (18,'Tiệc Cưới',51,1,'2023-11-11','12:00:00',NULL,NULL,NULL),(20,'Tiệc Công Ty',51,4,'2023-09-10','04:56:33',NULL,NULL,NULL),(21,'Tiec Cuoi',53,3,'2023-09-10','21:35:08',50,NULL,NULL),(22,'Tiệc Công Ty',53,3,'2023-09-10','21:41:27',NULL,NULL,NULL),(23,'Tiệc Cưới',53,3,'2023-09-10','22:09:37',NULL,NULL,NULL),(24,'Tiệc Công Ty',53,3,'2023-09-10','22:22:22',NULL,NULL,NULL),(25,'Tiệc Cưới',53,3,'2023-09-10','22:24:04',NULL,NULL,NULL),(26,'Tiệc Tất Niên',51,2,'2023-09-10','22:26:46',NULL,NULL,NULL),(27,'Event',51,3,'2023-09-10','22:35:59',NULL,NULL,NULL),(29,'Tất Niên',1,3,'2023-09-12','15:54:39',NULL,NULL,NULL),(30,'Tiệc Cưới',1,8,'2023-09-12','15:57:50',NULL,NULL,NULL),(31,'Tiệc Cưới',1,3,'2023-09-12','16:04:14',NULL,NULL,NULL),(32,'Tiệc cưới',1,2,'2023-09-12','16:05:35',NULL,NULL,NULL),(34,'Tiệc Cưới',1,3,'2023-09-12','17:34:11',NULL,NULL,NULL),(35,'Tiệc Cưới',53,3,'2023-09-12','17:49:22',NULL,NULL,NULL),(37,NULL,53,5,'2023-09-13','01:43:02',NULL,NULL,NULL),(38,NULL,53,5,'2023-09-13','01:48:01',NULL,NULL,NULL),(39,NULL,53,5,'2023-09-13','01:55:19',NULL,NULL,NULL),(40,'Tiệc Cưới',1,2,'2023-09-13','16:48:19',NULL,NULL,NULL),(41,'Cưới',51,3,'2023-09-13','17:14:16',NULL,NULL,NULL),(42,'Tất Niên',51,3,'2023-09-13','17:16:36',NULL,NULL,NULL),(43,'Tiệc Cưới',51,3,'2023-12-13','11:00:00',NULL,NULL,NULL),(44,'Tiệc Công Ty',51,3,'2023-12-09','13:00:00',NULL,NULL,NULL),(45,'Tiệc Cưới',51,23,'2024-02-02','17:00:00',NULL,NULL,NULL),(46,'Tiệc Sự Kiện',51,6,'2024-11-03','15:00:00',NULL,NULL,NULL),(47,'Tiệc Đám Hỏi',51,3,'2024-03-22','08:00:00',NULL,NULL,NULL),(48,'Tiệc Cưới',53,12,'2024-03-03','18:00:00',NULL,NULL,NULL),(49,'Sự Kiện Công Ty',53,15,'2024-04-04','11:00:00',NULL,NULL,NULL),(50,'Tất Niên',53,18,'2024-04-03','12:00:00',NULL,NULL,NULL),(51,'Tiệc Công Ty',51,14,'2023-12-05','12:00:00',NULL,NULL,NULL),(52,'Tiệc Cưới',53,23,'2024-02-20','18:00:00',20,NULL,NULL),(98,'Tiệc Cưới',52,1,'2023-11-21','13:00:00',40,7300000.00,'Chưa thanh toán'),(99,'Tiệc Tất Niên',53,2,'2023-10-18','19:00:00',13,6800000.00,'Đã thanh toán'),(100,'Tiệc Cưới',52,3,'2024-01-23','13:00:00',30,4600000.00,'Chưa thanh toán'),(101,'Đám Hỏi',52,6,'2024-02-28','14:00:00',14,6500000.00,'Chưa thanh toán'),(102,'Đám Hỏi',52,14,'2024-03-21','13:00:00',17,10000000.00,'Chưa thanh toán'),(103,'Sự Kiện',52,23,'2024-02-23','15:00:00',20,5200000.00,'Chưa thanh toán'),(104,'Tiệc Cưới',52,17,'2024-04-04','18:00:00',40,6500000.00,'Chưa thanh toán'),(105,'Tiệc Cưới',53,23,'2024-03-28','09:00:00',30,9200000.00,'Đã hủy'),(106,'Tiệc Cưới',37,16,'2023-10-07','13:00:00',50,6900000.00,'Đã thanh toán'),(107,'Giỗ',37,9,'2023-10-09','19:00:00',13,9800000.00,'Đã hoàn thành'),(108,'Tiệc Cưới',52,17,'2024-01-27','14:00:00',60,5600000.00,'Chưa thanh toán'),(109,'Tiệc Cưới',53,18,'2024-04-23','13:00:00',45,4600000.00,'Đã hoàn thành'),(110,'Tiệc Cưới',52,3,'2024-01-20','13:00:00',40,4650000.00,'Chưa thanh toán'),(111,'Tiệc Tất Niên',52,23,'2024-02-13','18:00:00',15,5700000.00,'Chưa thanh toán'),(112,'Tiệc Cưới',53,14,'2024-03-05','13:00:00',30,9850000.00,'Đã hủy'),(113,'Tiệc Cưới',52,11,'2023-12-09','13:00:00',40,7500000.00,'Chưa thanh toán'),(114,'Tiệc Tất Niên',53,15,'2024-03-06','18:00:00',13,6500000.00,'Chưa thanh toán'),(115,'Tiệc Cưới',64,9,'2023-05-04','13:00:00',40,8500000.00,'Đã hoàn thành'),(116,'Tiệc Cưới',52,9,'2024-03-28','13:00:00',30,8650000.00,'Chưa thanh toán'),(117,'Tiệc Tất Niên',52,7,'2023-09-05','18:00:00',40,7800000.00,'Chưa thanh toán'),(118,'Tiệc Công Ty',53,16,'2024-04-28','09:00:00',30,10900000.00,'Đã thanh toán'),(119,'Tiệc Cưới',72,12,'2024-05-05','08:00:00',35,5900000.00,'Đã thanh toán'),(120,'Tiệc Cưới',75,10,'2024-04-07','13:00:00',30,5400000.00,'Đã thanh toán'),(121,'Tiệc Cưới',75,13,'2024-03-21','08:00:00',30,4850000.00,'Chưa thanh toán'),(122,'Tiệc Cưới',80,5,'2024-03-21','13:00:00',30,4400000.00,'Chưa thanh toán'),(123,'Tiệc Sinh Nhật',53,23,'2023-10-14','13:00:00',15,4950000.00,'Chưa thanh toán'),(124,'Tiệc Cưới',52,2,'2023-10-16','18:00:00',30,6550000.00,'Chưa thanh toán'),(125,'Tiệc Cưới',52,3,'2023-10-17','08:00:00',40,3850000.00,'Đã hoàn thành'),(126,'Tiệc Cưới',82,16,'2023-10-18','13:00:00',30,6550000.00,'Đã thanh toán'),(127,'Tiệc Cưới',52,18,'2023-10-19','18:00:00',30,5800000.00,'Chưa thanh toán'),(128,'Tiệc Cưới',52,13,'2023-09-29','13:00:00',35,5650000.00,'Chưa thanh toán'),(129,'Tiệc Cưới',52,17,'2024-03-18','13:00:00',30,6000000.00,'Chưa thanh toán'),(130,'TIệc Cưới',53,9,'2024-02-24','13:00:00',30,8650000.00,'Chưa thanh toán'),(131,'Sinh nhật',53,18,'2024-03-24','13:00:00',12,4550000.00,'Chưa thanh toán'),(132,'Tiệc Cưới',52,2,'2024-03-24','13:00:00',40,6550000.00,'Chưa thanh toán'),(133,'Tiệc Cưới',52,17,'2023-11-16','13:00:00',30,5850000.00,'Chưa thanh toán'),(134,'Tiệc Tất Niên',53,10,'2023-11-28','13:00:00',13,4600000.00,'Chưa thanh toán'),(135,'Tiệc Đám Hỏi',82,17,'2023-11-19','13:00:00',12,5550000.00,'Chưa thanh toán'),(136,'Tiệc Cưới',53,10,'2023-02-19','13:00:00',35,6600000.00,'Chưa thanh toán'),(137,'Tiệc Cưới ',52,21,'2024-03-13','14:00:00',35,8600000.00,'Chưa thanh toán'),(138,'Tiệc Cưới',52,13,'2024-02-19','18:00:00',35,6650000.00,'Chưa thanh toán'),(139,'Tiệc Sinh Nhật',52,18,'2024-02-21','13:00:00',10,4800000.00,'Chưa thanh toán'),(140,'Tiệc Công Ty',53,9,'2023-11-19','13:00:00',30,8500000.00,'Chưa thanh toán'),(141,'Tiệc Cưới',52,18,'2023-11-23','18:00:00',30,5800000.00,'Chưa thanh toán'),(142,'Tiệc Cưới',53,14,'2023-11-27','13:00:00',40,9900000.00,'Chưa thanh toán'),(143,'Tiệc Cưới',53,5,'2023-11-07','14:00:00',35,4600000.00,'Chưa thanh toán'),(144,'Tất Niên',53,5,'2023-11-05','19:00:00',13,4650000.00,'Chưa thanh toán'),(145,'Sinh Nhật',53,18,'2023-11-04','13:00:00',8,4450000.00,'Chưa thanh toán'),(146,'Tiệc Sự Kiện',52,5,'2023-11-01','09:00:00',14,3700000.00,'Đã thanh toán'),(147,'Tiệc Cưới',52,17,'2023-12-01','13:00:00',30,5450000.00,'Đã thanh toán'),(148,'Sự Kiện',53,15,'2023-12-02','13:00:00',14,5850000.00,'Đã thanh toán'),(149,'Đám Hỏi',52,18,'2023-12-03','09:00:00',10,3800000.00,'Chưa thanh toán'),(150,'Tiệc Cưới',53,5,'2023-12-04','13:00:00',40,7700000.00,'Đã thanh toán'),(151,'Tất Niên',52,13,'2023-12-05','18:00:00',15,7200000.00,'Đã thanh toán'),(154,'Tiệc Cưới',53,12,'2023-12-06','13:00:00',60,6900000.00,'Đã thanh toán'),(155,'Tiệc Công Ty',52,4,NULL,NULL,NULL,NULL,NULL),(156,'Tiệc Cưới',52,2,'2023-12-08','13:00:00',40,4400000.00,'Đã thanh toán'),(157,'Tiệc Cưới',52,17,'2023-12-09','13:00:00',30,5500000.00,'Chưa thanh toán'),(158,'Tiệc Cưới',52,9,'2023-12-10','13:00:00',50,9000000.00,'Đã thanh toán'),(159,'Sinh Nhật',52,21,'2023-12-11','13:00:00',12,8850000.00,'Đã thanh toán'),(160,'Tiệc Cưới',52,1,'2023-12-12','09:00:00',35,6100000.00,'Đã thanh toán'),(173,'Tiệc Sinh Nhật',53,10,'2023-12-13',NULL,10,4500000.00,'Chưa thanh toán'),(174,'Tiệc Cưới',52,11,'2023-12-13','13:00:00',35,7650000.00,'Đã thanh toán'),(175,'Sinh Nhật',52,18,'2023-12-15','13:00:00',12,4650000.00,'Đã thanh toán'),(176,'Tiệc Cưới',52,15,'2023-12-16','13:00:00',36,5500000.00,'Chưa thanh toán'),(177,'Tiệc Sinh Nhật',53,4,'2023-12-17','08:00:00',15,7800000.00,'Đã thanh toán'),(178,'Tiệc Cưới',52,18,'2023-12-17','13:00:00',50,4500000.00,'Đã thanh toán'),(179,'Tiệc Đám Hỏi',52,23,'2023-12-18','10:00:00',15,3500000.00,'Chưa thanh toán'),(180,'Tiệc Cưới',52,10,'2023-12-18','13:00:00',40,4650000.00,'Đã thanh toán'),(181,'Tiệc Cưới',52,17,'2023-12-19','14:00:00',35,5550000.00,'Đã thanh toán'),(182,'Tiệc Cưới',53,1,'2023-12-14','09:00:00',35,6880000.00,'Đã thanh toán'),(183,'Tiệc Cưới',83,13,'2023-12-21','13:00:00',40,5550000.00,'Đã thanh toán');
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_food`
--

DROP TABLE IF EXISTS `booking_food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_food` (
  `id` int NOT NULL AUTO_INCREMENT,
  `booking_id` int NOT NULL,
  `food_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_booking_food_booking_idx` (`booking_id`),
  KEY `fk_booking_food_food_idx` (`food_id`),
  CONSTRAINT `fk_booking_food_booking` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_booking_food_food` FOREIGN KEY (`food_id`) REFERENCES `food` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_food`
--

LOCK TABLES `booking_food` WRITE;
/*!40000 ALTER TABLE `booking_food` DISABLE KEYS */;
INSERT INTO `booking_food` VALUES (1,37,NULL),(2,38,NULL),(3,39,NULL),(4,40,NULL),(5,41,NULL),(6,42,NULL),(7,43,NULL),(8,44,NULL),(9,45,NULL),(10,46,NULL),(11,47,NULL),(12,48,NULL),(13,49,NULL),(14,50,NULL),(15,51,NULL),(16,52,NULL),(17,52,11),(18,52,NULL),(69,98,10),(70,99,10),(71,100,6),(72,101,10),(73,102,11),(74,102,12),(75,103,14),(76,103,15),(77,104,10),(78,105,10),(79,105,9),(80,106,12),(81,107,16),(82,107,20),(83,108,6),(84,109,6),(85,110,11),(86,111,10),(87,112,8),(88,113,10),(89,114,10),(90,115,10),(91,116,11),(92,117,4),(93,117,16),(94,118,17),(95,119,9),(96,120,16),(97,120,9),(98,121,11),(99,122,2),(100,123,11),(101,124,7),(102,125,12),(103,126,7),(104,127,4),(105,128,11),(106,129,6),(107,130,11),(108,131,7),(109,132,12),(110,133,12),(111,134,15),(112,135,7),(113,136,14),(114,137,6),(115,138,11),(116,139,10),(117,140,10),(118,141,10),(119,142,6),(120,143,6),(121,144,3),(122,145,3),(123,146,10),(124,147,3),(125,148,7),(126,149,6),(127,150,1),(128,154,6),(129,155,2),(130,156,2),(131,157,10),(132,158,14),(133,159,12),(134,160,6),(135,173,10),(136,174,11),(137,175,11),(138,176,5),(139,177,6),(140,178,10),(141,179,10),(142,180,11),(143,181,7),(144,182,18),(145,182,14),(146,183,12);
/*!40000 ALTER TABLE `booking_food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_service`
--

DROP TABLE IF EXISTS `booking_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_service` (
  `id` int NOT NULL AUTO_INCREMENT,
  `booking_id` int NOT NULL,
  `service_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_booking_service_service_idx` (`service_id`),
  KEY `fk_booking_service_booking_idx` (`booking_id`),
  CONSTRAINT `fk_booking_service_booking` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_booking_service_service` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_service`
--

LOCK TABLES `booking_service` WRITE;
/*!40000 ALTER TABLE `booking_service` DISABLE KEYS */;
INSERT INTO `booking_service` VALUES (5,35,NULL),(6,35,NULL),(7,35,NULL),(9,37,NULL),(10,38,NULL),(11,39,NULL),(12,40,NULL),(13,41,NULL),(14,42,NULL),(15,43,NULL),(16,44,NULL),(17,45,NULL),(18,46,NULL),(19,47,NULL),(20,48,NULL),(21,49,NULL),(22,50,NULL),(23,51,NULL),(24,52,NULL),(25,52,NULL),(26,52,9),(71,98,2),(72,99,7),(73,100,8),(74,101,8),(75,102,1),(76,103,8),(77,104,8),(78,105,6),(79,106,3),(80,107,3),(81,108,8),(82,109,8),(83,110,8),(84,111,4),(85,112,6),(86,113,8),(87,114,8),(88,115,8),(89,116,8),(90,117,2),(91,118,6),(92,119,6),(93,120,6),(94,121,4),(95,122,3),(96,123,6),(97,124,8),(98,125,7),(99,126,8),(100,127,7),(101,128,8),(102,129,8),(103,130,8),(104,131,8),(105,132,8),(106,133,6),(107,134,8),(108,135,8),(109,136,2),(110,137,8),(111,138,8),(112,139,7),(113,140,8),(114,141,7),(115,142,6),(116,143,3),(117,144,4),(118,145,1),(119,146,4),(120,147,5),(121,148,7),(122,149,4),(123,150,7),(124,154,6),(125,155,8),(126,156,3),(127,157,8),(128,158,4),(129,159,7),(130,160,8),(131,173,8),(132,174,8),(133,175,8),(134,176,8),(135,177,4),(136,178,8),(137,179,8),(138,180,8),(139,181,8),(140,182,8),(141,183,8);
/*!40000 ALTER TABLE `booking_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch` (
  `id` int NOT NULL AUTO_INCREMENT,
  `branch_name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `branch_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES (1,'Chi nhánh Cộng Hòa','430 Cộng Hòa, Quận Tân Bình, TP.HCM'),(2,'Chi nhánh Quang Trung','525 Quang Trung, Quận Gò Vấp, TP.HCM'),(3,'Chi nhánh Quận 1','149 Hai Bà Trưng, Phường 3, Quận 1, TP.HCM'),(4,'Chi nhánh Thủ Đức','1003 Đăng Văn Bi, Phường 2, TP.Thủ Đức');
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `branch_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_employee_branch_idx` (`branch_id`),
  CONSTRAINT `fk_employee_branch` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Nguyễn Văn','A','0123456789','nva@gmail.com',1),(2,'Nguyễn Văn','B','0123456781','nvb@gmail.com',1),(3,'Nguyễn Văn','C','0123456782','nvc@gmail.com',1),(4,'Nguyễn Văn','D','0123456783','nvd@gmail.com',1),(5,'Nguyễn Văn','E','0123456784','nve@gmail.com',1),(6,'Nguyễn Văn','F','0123456785','nvf@gmail.com',2),(7,'Nguyễn Văn','G','0123456786','nvg@gmail.com',2),(8,'Nguyễn Văn','H','0123456787','nvh@gmail.com',2),(9,'Nguyễn Văn','J','0123456788','nvj@gmail.com',2),(10,'Nguyễn Văn','K','0123456771','nvk@gmail.com',2),(11,'Nguyễn Văn','AA','012345671','nvaa@gmail.com',3),(12,'Nguyễn Văn','BB','012345672','nvbb@gmail.com',3),(13,'Nguyễn Văn','CC','012345673','nvcc@gmail.com',3),(14,'Nguyễn Văn','DD','012345674','nvdd@gmail.com',3),(15,'Nguyễn Văn','EE','012345675','nvee@gmail.com',3),(16,'Nguyễn Văn','FF','012345676','nvff@gmail.com',4),(17,'Nguyễn Văn','GG','012345677','nvgg@gmail.com',4),(18,'Nguyễn Văn','HH','012345678','nvhh@gmail.com',4);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `id` int NOT NULL AUTO_INCREMENT,
  `feedback_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feedback_date` datetime DEFAULT NULL,
  `branch_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_feedback_branch_idx` (`branch_id`),
  KEY `fk_feedback_user_idx` (`user_id`),
  CONSTRAINT `fk_feedback_branch` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_feedback_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (3,'Đồ ăn không ngon, nhân viên không chuyên nghiệp',NULL,1,37),(4,'Đồ ăn không ngon',NULL,2,37),(5,'Đồ ăn không ngon',NULL,3,37),(6,'Đồ ăn ngon',NULL,4,37),(8,'Đồ ăn không ngon, nhân viên không chuyên nghiệp',NULL,4,37),(9,'Đồ ăn không ngon lắm',NULL,1,21),(10,'Đồ ăn không ngon','2023-09-08 23:07:43',1,37),(15,'nhân viên chuyên nghiệp, 5 sao cho nhà hàng <3','2023-09-09 21:25:23',4,51),(16,'ngon','2023-09-10 03:02:55',3,51),(17,'Đồ ăn không ngon','2023-09-10 03:15:49',2,37),(18,'phục vụ tốt','2023-09-10 04:53:07',1,52),(19,'Đồ ăn ngon','2023-09-17 15:26:20',1,1),(21,'dở ồm','2023-10-06 16:06:30',1,53),(22,'Hôm nay đồ ăn ngon','2023-10-10 03:19:04',1,53),(24,'ngon','2023-10-12 03:25:36',1,75),(25,'Đồ ăn ngon','2023-10-13 17:41:14',2,53),(26,'Đồ ăn siêu ngon','2023-10-18 13:38:40',2,52),(27,'Nhân viên nhiệt tình','2023-10-18 14:34:22',1,52),(28,'Tạm ổn !!!','2023-10-24 00:33:28',2,83);
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food`
--

DROP TABLE IF EXISTS `food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food` (
  `id` int NOT NULL AUTO_INCREMENT,
  `food_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `food_price` decimal(10,2) NOT NULL,
  `food_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food`
--

LOCK TABLES `food` WRITE;
/*!40000 ALTER TABLE `food` DISABLE KEYS */;
INSERT INTO `food` VALUES (1,'Súp hải sản hột gà',200000.00,'https://res.cloudinary.com/drqfqkwfo/image/upload/v1690802459/s%C3%BAp_h%E1%BA%A3i_s%E1%BA%A3n_h%E1%BB%99t_g%C3%A0_ro483p.jpg','Còn Hàng'),(2,'Súp bắp cua gà xé',200000.00,'https://res.cloudinary.com/drqfqkwfo/image/upload/v1690802458/Soup_b%E1%BA%AFp_cua_g%C3%A0_x%C3%A9_m9kmom.jpg','Còn Hàng'),(3,'Chả giò hải sản',250000.00,'https://res.cloudinary.com/drqfqkwfo/image/upload/v1690802456/Ch%E1%BA%A3_gi%C3%B2_h%E1%BA%A3i_s%E1%BA%A3n_zb8m6b.jpg','Còn Hàng'),(4,'Gỏi ngó sen tôm thịt',300000.00,'https://res.cloudinary.com/drqfqkwfo/image/upload/v1690802457/g%E1%BB%8Fi_ng%C3%B3_sen_t%C3%B4m_th%E1%BB%8Bt_zefv5e.jpg','Còn Hàng'),(5,'Gỏi củ hủ dừa tôm thịt',300000.00,'https://res.cloudinary.com/drqfqkwfo/image/upload/v1690802457/G%E1%BB%8Fi_c%E1%BB%A7_h%E1%BB%A7_d%E1%BB%ABa_t%C3%B4m_th%E1%BB%8Bt_iwgpsi.jpg','Còn Hàng'),(6,'Tôm sú hấp bia',400000.00,'https://res.cloudinary.com/drqfqkwfo/image/upload/v1690802459/T%C3%B4m_s%C3%BA_h%E1%BA%A5p_bia_u2tjw8.jpg','Còn Hàng'),(7,'Mực hấp gừng',350000.00,'https://res.cloudinary.com/drqfqkwfo/image/upload/v1690802458/M%E1%BB%B1c_h%E1%BA%A5p_g%E1%BB%ABng_z9mntr.jpg','Còn Hàng'),(8,'Giò heo nấu giả cầy',350000.00,'https://res.cloudinary.com/drqfqkwfo/image/upload/v1690802457/Gi%C3%B2_heo_n%C3%A1u_gi%E1%BA%A3_c%E1%BA%A7y_bth2qi.jpg','Còn Hàng'),(9,'Gà hấp mắm nhĩ',400000.00,'https://res.cloudinary.com/drqfqkwfo/image/upload/v1690802456/G%C3%A0_h%E1%BA%A5p_m%E1%BA%AFm_nh%C4%A9_mj6dmp.jpg','Còn Hàng'),(10,'Bò nấu tiêu xanh',300000.00,'https://res.cloudinary.com/drqfqkwfo/image/upload/v1690802456/B%C3%B2_n%E1%BA%A5u_ti%C3%AAu_xanh_zat7ra.jpg','Còn Hàng'),(11,'Gà bó xôi chiên',450000.00,'https://res.cloudinary.com/drqfqkwfo/image/upload/v1690802456/G%C3%A0_b%C3%B3_x%C3%B4i_chi%C3%AAn_qzk01w.jpg','Còn Hàng'),(12,'Cá diêu hồng chiên xù',350000.00,'https://res.cloudinary.com/drqfqkwfo/image/upload/v1690802456/Di%C3%AAu_h%E1%BB%93ng_chi%C3%AAn_x%C3%B9_khh5u5.jpg','Còn Hàng'),(13,'Lẫu thái',400000.00,'https://res.cloudinary.com/drqfqkwfo/image/upload/v1690802458/L%E1%BA%A9u_th%C3%A1i_oyznx1.jpg','Còn Hàng'),(14,'Lẫu cá tầm nấu măng chua',600000.00,'https://res.cloudinary.com/drqfqkwfo/image/upload/v1690802458/L%E1%BA%A9u_c%C3%A1_t%E1%BA%A7m_n%E1%BA%A5u_m%C4%83ng_chua_pokbs6.jpg','Còn Hàng'),(15,'Lẫu thác lác khổ qua',400000.00,'https://res.cloudinary.com/drqfqkwfo/image/upload/v1690802457/L%E1%BA%A9u_th%C3%A1c_l%C3%A1c_a9yqzb.jpg','Còn Hàng'),(16,'Lẫu cua đồng',500000.00,'https://res.cloudinary.com/drqfqkwfo/image/upload/v1690802457/L%E1%BA%A5u_cua_%C4%91%E1%BB%93ng_r9pdwv.jpg','Còn Hàng'),(17,'Lẫu cá kèo',400000.00,'https://res.cloudinary.com/drqfqkwfo/image/upload/v1690802457/L%E1%BA%A9u_c%C3%A1_k%C3%A8o_xkn20x.jpg','Còn Hàng'),(18,'Rau câu dừa',80000.00,'https://res.cloudinary.com/drqfqkwfo/image/upload/v1690802458/Rau_c%C3%A2u_d%E1%BB%ABa_dvckhk.jpg','Còn Hàng'),(19,'Rau câu lá dứa',80000.00,'https://res.cloudinary.com/drqfqkwfo/image/upload/v1690802458/Rau_c%C3%A2u_l%C3%A1_d%E1%BB%A9a_jluiiz.jpg','Còn Hàng'),(20,'Rau câu thập cẩm',100000.00,'https://res.cloudinary.com/drqfqkwfo/image/upload/v1690802458/Rau_c%C3%A2u_yhuz5j.jpg','Còn Hàng'),(21,'Nho mỹ',150000.00,'https://res.cloudinary.com/drqfqkwfo/image/upload/v1690802458/Nho_m%E1%BB%B9_jnxhdv.jpg','Còn Hàng'),(22,'Bánh Flan',110000.00,'https://res.cloudinary.com/drqfqkwfo/image/upload/v1690802456/B%C3%A1nh_Flan_hgm72o.jpg','Còn Hàng'),(41,'Gà Chiên Xù Giòn Ngon ',400000.00,'https://res.cloudinary.com/drqfqkwfo/image/upload/v1697275288/xdofjti09xafv7qcbkg6.jpg','Hết Hàng');
/*!40000 ALTER TABLE `food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hall`
--

DROP TABLE IF EXISTS `hall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hall` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hall_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `capacity` int NOT NULL,
  `hall_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_hall_branch_idx` (`branch_id`),
  CONSTRAINT `fk_hall_branch` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hall`
--

LOCK TABLES `hall` WRITE;
/*!40000 ALTER TABLE `hall` DISABLE KEYS */;
INSERT INTO `hall` VALUES (1,'Sảnh AMUR',1000,'https://res.cloudinary.com/drqfqkwfo/image/upload/v1693363949/hamt5z7ze0i6q8rhjetq.jpg',1),(2,'Sảnh DANUBE',800,'https://res.cloudinary.com/drqfqkwfo/image/upload/v1693364072/p4jpm3g9jr8x6h9coeeu.jpg',1),(3,'Sảnh NILE',500,'https://res.cloudinary.com/drqfqkwfo/image/upload/v1693364167/d4mkirqgnxehzvr358yn.jpg',1),(4,'Sảnh BALLROOM',1000,'https://res.cloudinary.com/drqfqkwfo/image/upload/v1693364276/g2n7hnfch7s49sgbpq5l.jpg',1),(5,'Sảnh THAMES',500,'https://res.cloudinary.com/drqfqkwfo/image/upload/v1693364405/bfym85jpzigzdxpvhb59.jpg',1),(6,'Sảnh AMUR',1000,'https://res.cloudinary.com/drqfqkwfo/image/upload/v1693364479/gf0t8sxxelqbqxvxxeeu.jpg',2),(7,'Sảnh DANUBE',800,'https://res.cloudinary.com/drqfqkwfo/image/upload/v1693364567/zkkqmx7xjcvvro3miixj.jpg',2),(8,'Sảnh NILE',500,'https://res.cloudinary.com/drqfqkwfo/image/upload/v1693364609/qcmcwlnjhbj2ogwolern.jpg',2),(9,'Sảnh BALLROOM',1000,'https://res.cloudinary.com/drqfqkwfo/image/upload/v1693364724/epdpb5v2dfv06fim28zx.jpg',2),(10,'Sảnh VOLGA',500,'https://res.cloudinary.com/drqfqkwfo/image/upload/v1693364776/xichxv1wlak5cqnmrhc7.jpg',2),(11,'Sảnh AMUR',1000,'https://res.cloudinary.com/drqfqkwfo/image/upload/v1693364856/uacpqnpxdncocr5ckvau.jpg',3),(12,'Sảnh DANUBE',800,'https://res.cloudinary.com/drqfqkwfo/image/upload/v1693364889/kqflyoahioyvgqjtxupk.jpg',3),(13,'Sảnh NILE',500,'https://res.cloudinary.com/drqfqkwfo/image/upload/v1693365068/tnwmmcc3qcxt56nqkuba.jpg',3),(14,'Sảnh BALLROOM',1000,'https://res.cloudinary.com/drqfqkwfo/image/upload/v1693365095/dt5pfu9oteh7ajl3wfev.jpg',3),(15,'Sảnh SEINE',500,'https://res.cloudinary.com/drqfqkwfo/image/upload/v1693365167/pzpexavxxesor06dig31.jpg',3),(16,'Sảnh AMUR',1000,'https://res.cloudinary.com/drqfqkwfo/image/upload/v1693365247/ctharugozqzwlp05rqsj.jpg',4),(17,'Sảnh DANUBE',800,'https://res.cloudinary.com/drqfqkwfo/image/upload/v1693365267/vhqlvqavng2ixinln0gn.jpg',4),(18,'Sảnh NILE',500,'https://res.cloudinary.com/drqfqkwfo/image/upload/v1693365311/yd5mxu5njlvbh4mqprdq.jpg',4),(21,'Sảnh BALLROOM',1000,'https://res.cloudinary.com/drqfqkwfo/image/upload/v1693365344/aa9o5ztdrb6rqswuqein.jpg',4),(23,'Sảnh VOLGA',500,'https://res.cloudinary.com/drqfqkwfo/image/upload/v1693365375/ebs3msavkoct6ujbd9sj.jpg',4);
/*!40000 ALTER TABLE `hall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hall_price`
--

DROP TABLE IF EXISTS `hall_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hall_price` (
  `id` int NOT NULL AUTO_INCREMENT,
  `time_period` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_start` time DEFAULT NULL,
  `time_end` time DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `hall_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_hall_price_hall_idx` (`hall_id`),
  CONSTRAINT `fk_hall_price_hall` FOREIGN KEY (`hall_id`) REFERENCES `hall` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hall_price`
--

LOCK TABLES `hall_price` WRITE;
/*!40000 ALTER TABLE `hall_price` DISABLE KEYS */;
INSERT INTO `hall_price` VALUES (1,'Morning','07:00:00','12:00:00',5500000.00,1),(2,'Afternoon','13:00:00','17:00:00',6000000.00,1),(3,'Evening','18:00:00','22:00:00',7000000.00,1),(5,'Weekend','07:00:00','22:00:00',10000000.00,1),(6,'Morning','07:00:00','12:00:00',4000000.00,2),(7,'Morning','07:00:00','12:00:00',3000000.00,3),(8,'Morning','07:00:00','12:00:00',7000000.00,4),(9,'Morning','07:00:00','12:00:00',3000000.00,5),(10,'Morning','07:00:00','12:00:00',5000000.00,6),(11,'Morning','07:00:00','12:00:00',4000000.00,7),(12,'Morning','07:00:00','12:00:00',3000000.00,8),(13,'Morning','07:00:00','12:00:00',7000000.00,9),(14,'Morning','07:00:00','12:00:00',3000000.00,10),(15,'Morning','07:00:00','12:00:00',6000000.00,11),(16,'Morning','07:00:00','12:00:00',5000000.00,12),(17,'Morning','07:00:00','12:00:00',4000000.00,13),(18,'Morning','07:00:00','12:00:00',8000000.00,14),(19,'Morning','07:00:00','12:00:00',4500000.00,15),(20,'Morning','07:00:00','12:00:00',5000000.00,16),(21,'Morning','07:00:00','12:00:00',4000000.00,17),(22,'Morning','07:00:00','12:00:00',3000000.00,18),(23,'Morning','07:00:00','12:00:00',7000000.00,21),(24,'Morning','07:00:00','12:00:00',3000000.00,23),(25,'Afternoon','13:00:00','17:00:00',6000000.00,16),(26,'Afternoon','13:00:00','17:00:00',5000000.00,17),(27,'Afternoon','13:00:00','17:00:00',4000000.00,18),(28,'Afternoon','13:00:00','17:00:00',8000000.00,21),(29,'Afternoon','13:00:00','17:00:00',4000000.00,23),(30,'Afternoon','13:00:00','17:00:00',7000000.00,11),(31,'Afternoon','13:00:00','17:00:00',6000000.00,12),(32,'Afternoon','13:00:00','17:00:00',5000000.00,13),(33,'Afternoon','13:00:00','17:00:00',9000000.00,14),(34,'Afternoon','13:00:00','17:00:00',5000000.00,15),(35,'Afternoon','13:00:00','17:00:00',6000000.00,6),(36,'Afternoon','13:00:00','17:00:00',5000000.00,7),(37,'Afternoon','13:00:00','17:00:00',4000000.00,8),(38,'Afternoon','13:00:00','17:00:00',8000000.00,9),(39,'Afternoon','13:00:00','17:00:00',4000000.00,10),(40,'Afternoon','13:00:00','17:00:00',5000000.00,2),(41,'Afternoon','13:00:00','17:00:00',4000000.00,3),(42,'Afternoon','13:00:00','17:00:00',8000000.00,4),(43,'Afternoon','13:00:00','17:00:00',4000000.00,5),(44,'Evening','18:00:00','22:00:00',6000000.00,2),(45,'Evening','18:00:00','22:00:00',5000000.00,3),(46,'Evening','18:00:00','22:00:00',9000000.00,4),(47,'Evening','18:00:00','22:00:00',5000000.00,5),(48,'Evening','18:00:00','22:00:00',7000000.00,6),(49,'Evening','18:00:00','22:00:00',6000000.00,7),(50,'Evening','18:00:00','22:00:00',5000000.00,8),(51,'Evening','18:00:00','22:00:00',9000000.00,9),(52,'Evening','18:00:00','22:00:00',5000000.00,10),(53,'Evening','18:00:00','22:00:00',8000000.00,11),(54,'Evening','18:00:00','22:00:00',7000000.00,12),(55,'Evening','18:00:00','22:00:00',6000000.00,13),(56,'Evening','18:00:00','22:00:00',10000000.00,14),(57,'Evening','18:00:00','22:00:00',6000000.00,15),(58,'Evening','18:00:00','22:00:00',7000000.00,16),(59,'Evening','18:00:00','22:00:00',6000000.00,17),(60,'Evening','18:00:00','22:00:00',5000000.00,18),(61,'Evening','18:00:00','22:00:00',9000000.00,21),(62,'Evening','18:00:00','22:00:00',5000000.00,23),(63,'Weekend','07:00:00','22:00:00',9000000.00,2),(64,'Weekend','07:00:00','22:00:00',8000000.00,3),(65,'Weekend','07:00:00','22:00:00',11000000.00,4),(66,'Weekend','07:00:00','22:00:00',8000000.00,5),(67,'Weekend','07:00:00','22:00:00',10000000.00,6),(68,'Weekend','07:00:00','22:00:00',9000000.00,7),(69,'Weekend','07:00:00','22:00:00',8000000.00,8),(70,'Weekend','07:00:00','22:00:00',11000000.00,9),(71,'Weekend','07:00:00','22:00:00',8000000.00,10),(72,'Weekend','07:00:00','22:00:00',11000000.00,11),(73,'Weekend','07:00:00','22:00:00',10000000.00,12),(74,'Weekend','07:00:00','22:00:00',9000000.00,13),(75,'Weekend','07:00:00','22:00:00',12000000.00,14),(76,'Weekend','07:00:00','22:00:00',9000000.00,15),(77,'Weekend','07:00:00','22:00:00',10000000.00,16),(78,'Weekend','07:00:00','22:00:00',9000000.00,17),(79,'Weekend','07:00:00','22:00:00',8000000.00,18),(80,'Weekend','07:00:00','22:00:00',11000000.00,21),(81,'Weekend','07:00:00','22:00:00',8000000.00,23);
/*!40000 ALTER TABLE `hall_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `payment_date` datetime DEFAULT NULL,
  `payment_method` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_payment_user_idx` (`user_id`),
  CONSTRAINT `fk_payment_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=312 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (4,'2023-09-10 22:22:22',NULL,53),(5,'2023-09-10 22:24:04',NULL,53),(6,'2023-09-10 22:26:46',NULL,51),(7,'2023-09-10 22:30:46',NULL,51),(8,'2023-09-10 22:33:11',NULL,51),(9,'2023-09-10 22:35:59',NULL,51),(10,'2023-09-11 00:34:44',NULL,21),(11,'2023-09-12 15:54:39',NULL,1),(12,'2023-09-12 15:57:50',NULL,1),(13,'2023-09-12 15:59:26',NULL,1),(14,'2023-09-12 16:01:25',NULL,1),(15,'2023-09-12 16:04:13',NULL,1),(16,'2023-09-12 16:05:35',NULL,1),(18,'2023-09-12 17:34:11',NULL,1),(19,'2023-09-12 17:49:22',NULL,53),(20,'2023-09-13 01:43:02',NULL,53),(21,'2023-09-13 01:48:01',NULL,53),(22,'2023-09-13 01:55:19',NULL,53),(23,'2023-09-13 16:48:20',NULL,1),(24,'2023-09-13 17:14:17',NULL,51),(25,'2023-09-13 17:16:36',NULL,51),(26,'2023-09-13 18:00:13',NULL,51),(27,'2023-09-13 18:03:13',NULL,51),(28,'2023-09-14 15:08:41',NULL,51),(29,'2023-09-14 15:16:16','Thanh toán TRỰC TIẾP',51),(30,'2023-09-14 15:19:45','Thanh toán qua ví MOMO',51),(31,'2023-09-15 02:26:13','Thanh toán qua ZALOPAY',53),(32,'2023-09-15 03:40:47',NULL,53),(33,'2023-09-15 15:30:54','Thanh toán qua ví MOMO',53),(34,'2023-09-16 03:10:50','Thanh toán qua ví MOMO',51),(35,'2023-09-16 03:21:40','Thanh toán qua ví MOMO',53),(41,'2023-09-16 16:36:52','Thanh toán qua ví MOMO',52),(46,'2023-09-17 15:25:21','Thanh toán qua ví MOMO',1),(47,'2023-09-26 22:23:49','Thanh toán TRỰC TIẾP',53),(48,'2023-09-26 22:34:44','Thanh toán qua ZALOPAY',53),(67,'2023-09-27 01:10:43','Thanh toán qua ví MOMO',53),(70,'2023-09-27 02:02:28','Thanh toán qua ví MOMO',52),(72,'2023-09-27 16:54:37','Thanh toán qua ví MOMO',53),(75,'2023-09-27 21:56:55','Thanh toán qua ZALOPAY',52),(76,'2023-09-27 21:59:21','Thanh toán qua ví MOMO',52),(77,'2023-09-28 01:51:17','Thanh toán qua ví MOMO',52),(79,'2023-10-04 22:31:40','Thanh toán qua ví MOMO',52),(84,'2023-10-06 14:45:12','Thanh toán qua ví MOMO',52),(89,'2023-10-06 14:56:50','Thanh toán qua ví MOMO',53),(90,'2023-10-06 14:59:44','Thanh toán qua ZALOPAY',53),(97,'2023-10-06 15:52:49','Thanh toán qua ZALOPAY',53),(100,'2023-10-06 16:43:18','Thanh toán qua ví MOMO',37),(101,'2023-10-06 19:42:18','Thanh toán qua ZALOPAY',37),(133,'2023-10-06 21:15:48','Thanh toán qua ví MOMO',52),(134,'2023-10-06 21:16:53','Thanh toán qua ví MOMO',53),(146,'2023-10-06 21:31:35','Thanh toán TRỰC TIẾP',52),(147,'2023-10-06 21:32:12','Thanh toán qua ví MOMO',52),(151,'2023-10-06 21:40:31','Thanh toán qua ví MOMO',52),(152,'2023-10-06 21:41:19','Thanh toán qua ZALOPAY',52),(153,'2023-10-06 21:41:54','Thanh toán TRỰC TIẾP',52),(154,'2023-10-06 21:42:41','Thanh toán qua ví MOMO',53),(155,'2023-10-06 21:45:56','Thanh toán qua ZALOPAY',37),(156,'2023-10-06 21:48:11','Thanh toán TRỰC TIẾP',37),(157,'2023-10-06 22:30:23','Thanh toán qua ví MOMO',52),(158,'2023-10-07 04:27:35','Thanh toán qua ví MOMO',53),(166,'2023-10-08 18:50:08','Thanh toán qua ví MOMO',52),(167,'2023-10-08 18:51:00','Thanh toán qua ZALOPAY',52),(168,'2023-10-08 18:51:46','Thanh toán TRỰC TIẾP',53),(169,'2023-10-10 03:11:55','Thanh toán qua ví MOMO',52),(170,'2023-10-10 03:14:02','Thanh toán qua ZALOPAY',53),(171,'2023-10-10 23:50:41','Thanh toán qua ví MOMO',64),(177,'2023-10-11 00:06:02','Thanh toán qua ví MOMO',52),(178,'2023-10-11 00:06:52','Thanh toán qua ZALOPAY',52),(179,'2023-10-11 00:07:40','Thanh toán TRỰC TIẾP',53),(180,'2023-10-11 00:11:55','Thanh toán qua ví MOMO',72),(181,'2023-10-11 23:26:09','Thanh toán qua ví MOMO',75),(182,'2023-10-11 23:34:13','Thanh toán qua ZALOPAY',75),(183,'2023-10-12 22:03:15','Thanh toán qua ví MOMO',80),(188,'2023-10-13 17:32:53','Thanh toán qua ví MOMO',53),(192,'2023-10-13 20:53:56','Thanh toán qua ZALOPAY',52),(193,'2023-10-13 20:54:45','Thanh toán TRỰC TIẾP',52),(194,'2023-10-16 14:19:52','Thanh toán qua ZALOPAY',82),(195,'2023-10-16 15:51:56','Thanh toán qua ví MOMO',52),(205,'2023-10-16 19:27:13','Thanh toán TRỰC TIẾP',52),(206,'2023-10-16 19:28:39','Thanh toán TRỰC TIẾP',52),(218,'2023-10-16 22:46:11','Thanh toán TRỰC TIẾP',53),(219,'2023-10-16 22:47:36','Thanh toán TRỰC TIẾP',53),(232,'2023-10-16 23:02:11','Thanh toán TRỰC TIẾP',52),(236,'2023-10-17 00:12:18','Thanh toán TRỰC TIẾP',52),(237,'2023-10-17 00:13:02','Thanh toán TRỰC TIẾP',53),(238,'2023-10-17 00:14:50','Thanh toán qua ví MOMO',82),(239,'2023-10-17 00:26:13','Thanh toán TRỰC TIẾP',53),(240,'2023-10-17 01:24:35','Thanh toán TRỰC TIẾP',52),(243,'2023-10-17 01:57:05','Thanh toán qua PAYPAL',52),(244,'2023-10-17 02:01:03','Thanh toán qua PAYPAL',52),(251,'2023-10-17 02:09:26','Thanh toán qua PAYPAL',53),(252,'2023-10-17 02:10:32','Thanh toán qua ví MOMO',52),(256,'2023-10-17 02:37:21','Thanh toán qua PAYPAL',53),(257,'2023-10-17 02:38:28','Thanh toán qua ZALOPAY',53),(258,'2023-10-17 02:39:27','Thanh toán qua ví MOMO',53),(259,'2023-10-17 02:40:02','Thanh toán TRỰC TIẾP',53),(260,'2023-10-17 02:43:17','Thanh toán qua PAYPAL',52),(264,'2023-10-17 02:56:28','Thanh toán qua PAYPAL',52),(265,'2023-10-17 02:57:00','Thanh toán qua PAYPAL',53),(266,'2023-10-17 02:58:05','Thanh toán qua ví MOMO',52),(267,'2023-10-17 03:24:28','Thanh toán qua PAYPAL',53),(270,'2023-10-17 03:31:45','Thanh toán qua PAYPAL',52),(273,'2023-10-17 03:37:56','Thanh toán qua PAYPAL',53),(274,'2023-10-17 03:39:44','Thanh toán qua PAYPAL',52),(275,'2023-10-17 03:48:19','Thanh toán qua PAYPAL',52),(276,'2023-10-17 03:49:43','Thanh toán qua ví MOMO',52),(277,'2023-10-17 16:46:42','Thanh toán qua PAYPAL',52),(278,'2023-10-17 16:51:59','Thanh toán qua PAYPAL',52),(279,'2023-10-18 13:07:13',NULL,52),(280,'2023-10-18 13:37:04','Thanh toán qua PAYPAL',52),(301,'2023-10-18 14:09:21','Thanh toán qua ví MOMO',53),(302,'2023-10-18 14:10:49','Thanh toán qua PAYPAL',52),(303,'2023-10-18 14:33:56','Thanh toán qua PAYPAL',52),(304,'2023-10-18 14:35:17','Thanh toán qua ví MOMO',52),(305,'2023-10-18 15:00:35','Thanh toán qua PAYPAL',53),(306,'2023-10-19 01:44:07','Thanh toán qua PAYPAL',52),(307,'2023-10-19 01:46:02','Thanh toán qua ZALOPAY',52),(308,'2023-10-19 22:26:38','Thanh toán qua PAYPAL',52),(309,'2023-10-20 17:34:16','Thanh toán qua PAYPAL',52),(310,'2023-10-20 23:43:10','Thanh toán qua PAYPAL',53),(311,'2023-10-24 00:32:33','Thanh toán qua PAYPAL',83);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service` (
  `id` int NOT NULL AUTO_INCREMENT,
  `service_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `service_price` decimal(10,2) NOT NULL,
  `service_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` VALUES (1,'Trang trí tranh ký tên',200000.00,'Là nơi các vị khách mời lưu lại những lời chúc mừng hạnh phúc','https://res.cloudinary.com/drqfqkwfo/image/upload/v1690802519/TRANH_K%C3%9D_T%C3%8AN_ny9qux.jpg','Sẵn sàng'),(2,'Trang trí và tổ chức tiệc tại nhà',1000000.00,'Là dịch vụ tổ chức tiệc theo yêu cầu tại nhà','https://res.cloudinary.com/drqfqkwfo/image/upload/v1690802519/T%E1%BB%95_ch%E1%BB%A9c_t%E1%BA%A1i_nh%C3%A0_szebm4.jpg','Sẵn sàng'),(3,'Trang trí bàn',200000.00,'Là sự trang trí theo phong khách thiết kế của bạn','https://res.cloudinary.com/drqfqkwfo/image/upload/v1690802519/trang-tri-ban-gallery_14_tugeoz.jpg','Sẵn sàng'),(4,'Trang trí khu vực để chụp ảnh',400000.00,'Là nơi các vị khách mời lưu lại chụp hình theo sở thích','https://res.cloudinary.com/drqfqkwfo/image/upload/v1690802519/KHU_V%E1%BB%B0C_CH%E1%BB%A4P_H%C3%8CNH_yi4jp2.jpg','Sẵn sàng'),(5,'Trang trí cổng chào bằng hoa',200000.00,'Là nơi cổng chào đón khách hàng','https://res.cloudinary.com/drqfqkwfo/image/upload/v1690802518/C%E1%BB%94NG_HOA_CH%C3%80O_kfay85.jpg','Sẵn sàng'),(6,'Nhạc đón khách',500000.00,'Là dịch vũ nhạc bằng các loại nhạc cụ để đón tiếp khách hàng','https://res.cloudinary.com/drqfqkwfo/image/upload/v1690802518/PIANIST_V%C3%80_VIOLINIST_%C4%90%C3%93N_KH%C3%81CH_adutvc.jpg','Sẵn sàng'),(7,'Tiết mục khai tiệc',500000.00,'Là các tiết mục để làm sôi động sân khấu trước khi bắt đầu','https://res.cloudinary.com/drqfqkwfo/image/upload/v1690802518/TI%E1%BA%BET_M%E1%BB%A4C_KHAI_TI%E1%BB%86C_jtqrpq.jpg','Sẵn sàng'),(8,'Bắn pháo',200000.00,'Bắn những quả pháo giấy lấp lánh tăng nhịp độ buổi tiệc','https://res.cloudinary.com/drqfqkwfo/image/upload/v1690802518/B%E1%BA%AFn_ph%C3%A1o_zjgc57.jpg','Sẵn sàng'),(9,'Chụp ảnh và quay video buổi tiệc',500000.00,'Là dịch vụ lưu lại những khoảng khắc đẹp trong buổi tiệc','https://res.cloudinary.com/drqfqkwfo/image/upload/v1690802518/Ch%E1%BB%A5p_%E1%BA%A2nh_C%C6%B0%E1%BB%9Bi_jomr21.jpg','Chưa sẵn sàng'),(20,'Hát Karaoke',500000.00,'Hát karaokeke','https://res.cloudinary.com/drqfqkwfo/image/upload/v1697274940/j1mt0sqaotfndr2hg24h.jpg','Chưa sẵn sàng');
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_role` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Nguyễn Hoàng','Hảo','hao123','$2a$10$3YohAzphxM8cU1uvEkikleeAf4xPlPZrQ0eqx5iPgc0bcUT48j/SC',NULL,NULL,'https://res.cloudinary.com/drqfqkwfo/image/upload/v1689310233/cld-sample.jpg','ROLE_ADMIN'),(2,'Hoàng Thanh','An','an123','$2a$10$ukdSuAd3filzhppJYBc3DuiHPH5NxpwSnAvLmkcvvbaJDIRWQtjaS',NULL,NULL,'https://res.cloudinary.com/drqfqkwfo/image/upload/v1689310212/samples/bike.jpg','ROLE_EMPLOYEE'),(11,'Nguyễn Văn','B','b123','$2a$10$s4lId3vxOK1AY3zBNumUKOVpcPZbJBmQ5tQQleLdHraIVVOw4D2K.',NULL,NULL,'https://res.cloudinary.com/drqfqkwfo/image/upload/v1691771180/gkbm4x2arg8wb2sexcto.png','ROLE_CUSTOMER'),(12,'Nguyễn Hoàng','K','k123','$2a$10$oK4Obm2Ef3OTXbUybnblNe.xjxAJxXUQb4EcGH2qznJrtt7sLhmT6',NULL,NULL,'https://res.cloudinary.com/drqfqkwfo/image/upload/v1691771507/kemk0egvyclygzici2ne.png','ROLE_CUSTOMER'),(14,'Hoàng Xanh ','An','an1234','$2a$10$uNC3pQw9mKRcmeiwRWiX4u7PL0n7QnvGsxzsr0.XB0yzxSfgS27KO',NULL,NULL,'https://res.cloudinary.com/drqfqkwfo/image/upload/v1691771910/enbytainrywnnmvqyeij.png','ROLE_CUSTOMER'),(15,'Nguyễn Văn','C','m123','$2a$10$xfOxYT5kgklOu89lren/2O2LFR06JuTLsVB7FXurpjjfRV6RNnMve',NULL,NULL,'https://res.cloudinary.com/drqfqkwfo/image/upload/v1691773588/kkxbs9ltal25ofiwbnbp.png','ROLE_CUSTOMER'),(21,'Nguyễn Văn','Hảo','hao','$2a$10$40NgmEjB70zjvVV5H9fi0OJNQsbLPFejKTe.uW5PF6eV8XbkdXU5m',NULL,NULL,'https://res.cloudinary.com/drqfqkwfo/image/upload/v1691833208/dlj6qhsgrs4ovsj3pn2p.png','ROLE_CUSTOMER'),(24,'Nguyễn Hoàng','C','abc','$2a$10$slogctJfM3EZfOiYtmNpz.ncOVEkHMoGnzItyBYY5Nvg6tZShzBcK',NULL,NULL,'https://res.cloudinary.com/drqfqkwfo/image/upload/v1691835801/dxnz89jt0tozistgtlve.png','ROLE_EMPLOYEE'),(37,'Nguyễn Hoàng','N','n123','$2a$10$90gM07Wi2tGGCcdgbJLYlOWnXPR8GdclQnKpXBpK0V1YyvAFcREpi',NULL,NULL,'https://res.cloudinary.com/drqfqkwfo/image/upload/v1692271237/mec17lt1rsxkdjk0sezg.jpg','ROLE_CUSTOMER'),(47,'Nguyễn Văn','Hảo','hao12345','$2a$10$q7g/HvW7sv7TiUmbCkICSe9SAbR1.vu4Fm6OrtHM.bW32Z0kbbSiC',NULL,NULL,'https://res.cloudinary.com/drqfqkwfo/image/upload/v1693824375/nabnq6i0leywrnwhcqwo.jpg','ROLE_CUSTOMER'),(51,'Hoang Thanh','An An','an123456','$2a$10$nrogaQUvkIOE0pY7TM98ReAJ4VqOOlXFg2JBf2laDb1IOi75qBzLK',NULL,NULL,'https://res.cloudinary.com/drqfqkwfo/image/upload/v1693913463/fzapvcietjc5bhjmxiqm.jpg','ROLE_CUSTOMER'),(52,'Nguyễn Hoàng','Hảo','haohaohao','$2a$10$JH1Xogdinr1arD8/LSb27OvMEZDuXZ/.6MEI2aspmYZcfrfD9OSSi','bbiukn290102150502@gmail.com','0977621803','https://res.cloudinary.com/drqfqkwfo/image/upload/v1694296337/vg76orddqi4t5ufu28ll.jpg','ROLE_CUSTOMER'),(53,'Nguyễn Hoàng Thanh','Bé An','beiu','$2a$10$Dd72j8BTH0lQr4Gu0UYVb.Frb2xDdBitJcv303DmMDo3Cp1ipL2vm','hao8a1vn@gmail.com','0974432343','https://res.cloudinary.com/drqfqkwfo/image/upload/v1694296500/cjqt0q14mvp5evkus7hj.jpg','ROLE_CUSTOMER'),(54,'Nguyễn Thị','Tha','tha1245','$2a$10$mCo3CQoGyrMraDHAO8ULou0n578lZO/iHMn4e7njRZyc7axR0N9da',NULL,NULL,'https://res.cloudinary.com/drqfqkwfo/image/upload/v1694863260/dgizy95xy8xftqwygcjl.jpg','ROLE_CUSTOMER'),(55,'Nguyễn','Hoàng Hẻo','heo123','$2a$10$4LLi4ViweNvC96lMs7B1NerOlajBZXdDk3jZBpCPh4CMHYJ/70b3i',NULL,NULL,'https://res.cloudinary.com/drqfqkwfo/image/upload/v1695798825/etblcoidoomoujpi6kle.jpg','ROLE_CUSTOMER'),(56,'Nguyễn Heo','Heo','h12346','$2a$10$Zgs.u0hgmUwVwJX.WiIF4OkNpxqWZxhCDqNp9a0wM7WDJaaveOk7q',NULL,NULL,'https://res.cloudinary.com/drqfqkwfo/image/upload/v1695804795/ct0phuxmvsk6trfvzk36.jpg','ROLE_CUSTOMER'),(64,'Nguyễn','Hảo','ba123','$2a$10$MwmCaHxMu69dIPwvu1qBJOljcG0q6J55dOLJXWIXO.5grMq7MjCc.','2041010084hao@ou.edu.vn','0937621803','https://res.cloudinary.com/drqfqkwfo/image/upload/v1696766045/dpaqkbvtbgh53tbn7qkv.jpg','ROLE_CUSTOMER'),(66,'Nguyễn Thị Hoàn ','Hảo','haohao1122','$2a$10$m4U3wiWMtgpXTijya1LFEeTNY1DHNa5QwrImUz0IS977SW36FshQS','hao8a1vn@gmail.com','0988323452','https://res.cloudinary.com/drqfqkwfo/image/upload/v1696954002/ttpay843vc58avmocxl0.png','ROLE_CUSTOMER'),(71,'Nguyễn thị mỹ ','hảo','haodsd','$2a$10$wRmDaSCokKcBhZ/hcRnAculHtnZkmTScx1QCvD6VdKd0alTbbl5v6','hao8a1vn@gmail.com','0974432343','https://res.cloudinary.com/drqfqkwfo/image/upload/v1696955981/nfrfnh7cqjack5gkv8ys.jpg','ROLE_CUSTOMER'),(72,'Nhị','Ca','ca343','$2a$10$DOyCMptK6tTeCUUEJeheV.K2A1ZZaviWnwT.cb96ONcmNfyDPGNoe','2051010084hao@ou.edu.vn','0967621803','https://res.cloudinary.com/drqfqkwfo/image/upload/v1696957810/nl7qfne1wko4lgqxo0ov.jpg','ROLE_CUSTOMER'),(73,'Nguyễn','Hảo Hão','had2','$2a$10$MNCPUUXizlWosHPn3Vz8H./0Igb5foHapWXj8GNnou6etlrypv7g6','bbiukn290102150502@gmail.com','0977621803','https://res.cloudinary.com/drqfqkwfo/image/upload/v1697036259/d07jisiblgbujwknbd3j.jpg','ROLE_CUSTOMER'),(74,'HaoHao','Nguyễn','had23','$2a$10$MA8DnLtL1IY48Iwvrr3MreYGH1NVkwW8wRgFjWmjD0VLN745oJXD2','bbiukn290102150502@gmail.com','0977621803','https://res.cloudinary.com/drqfqkwfo/image/upload/v1697038703/l9rbc3dfxhbqtejyjhti.jpg','ROLE_CUSTOMER'),(75,'Nguyễn Ca Ci','Ci','Co1234','$2a$10$YyYMGXVxCXyLwRX1GcW.kOBal2OO4wQuypbqDQzEDB.Qm48abnW9q','hao8a1vn@gmail.com','0974432343','https://res.cloudinary.com/drqfqkwfo/image/upload/v1697041461/qqjyzhcf0cn8botquhhc.png','ROLE_CUSTOMER'),(76,'Nguyễn Hoàng','Hảo 2','admin','$2a$10$NY.aFgY1uF6XdntTKPeb2ehN8RVlTr94YXUfoKUHQNcIIoQcwG4qS','2051010084hao@ou.edu.vn','0977621803','https://res.cloudinary.com/drqfqkwfo/image/upload/v1697054469/pwot29butalrtmc9zlhv.jpg','ROLE_ADMIN'),(80,'Nguyễn Hoàng Ka','Ka','kakaka','$2a$10$.f60pGg2.AURArPYbe.7JeP3FSHSl97R4YjOP8RpLPp1Z2SqM8lZG','ka@gmail.com','0983843453','https://res.cloudinary.com/drqfqkwfo/image/upload/v1697122854/b3whj3jgpwfndtslgrss.jpg','ROLE_CUSTOMER'),(82,'Hoàng Hoàng ','Thanh An','ananan','$2a$10$/BMg1p5OuSAfNKWfA6dJKuAv8YpfflRfqJuMfzo2OAvAqV3baRDE.','bbiukn290102150502@gmail.com','0347408827','https://res.cloudinary.com/drqfqkwfo/image/upload/v1697440703/weharxc5xeth6skiy5qm.jpg','ROLE_CUSTOMER'),(83,'Nguyễn Hoàng ','Huy Hảo','huyhao123','$2a$10$kP35JnUNtFhGWSqjgw9P3OlWpVPlEZl1gC7tRty7cp1EVIv0aNu0y','huyhao8a1vn@gmail.com','0333013764','https://res.cloudinary.com/drqfqkwfo/image/upload/v1698082276/alfciyphnx5jbrez9krd.jpg','ROLE_CUSTOMER');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-24  0:52:34
