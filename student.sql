-- MySQL dump 10.13  Distrib 8.0.24, for macos11 (x86_64)
--
-- Host: localhost    Database: demo
-- ------------------------------------------------------
-- Server version	8.0.24

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
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `number` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `age` int NOT NULL,
  `place` varchar(255) NOT NULL,
  `chi` int NOT NULL,
  `math` int NOT NULL,
  `eng` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'101','San Zhang',18,'Henan',99,100,99),(2,'102','Si Li',19,'Shanghai',92,80,55),(3,'103','Wu Wang',20,'Guangdong',88,79,88),(4,'104','Liu Ma',21,'Yunnan',75,88,99),(5,'105','Qi Zhao',17,'Yunnan',88,54,67),(6,'106','Ba Chen',24,'Henan',87,77,33),(7,'107','Jiu Zhu',23,'Hunan',91,44,56),(8,'108','Hong Xiao',8,'Hubei',82,77,90),(9,'109','Qiang Wen',8,'Heilongjiang',78,35,88),(10,'110','Da Bai',17,'Liaoning',73,42,71),(11,'111','Hua Xiao',20,'Shanghai',73,76,88),(12,'112','Xin He',7,'Tianjin',59,59,59),(13,'113','Fang Huang',14,'Shandong',78,30,93),(14,'114','Tainan Zhang',20,'Henna',100,100,100),(15,'115','Jie Zhang',40,'Hubei',70,71,88),(16,'116','Na Xie',40,'Hunan',88,39,77),(17,'117','Jielun Zhou',41,'Taiwan',80,44,20),(18,'118','Xiaoming Zhu',32,'Yunnan',81,60,72),(19,'119','Xiang Chen',36,'Yunnan',71,30,69),(20,'120','Zha Wang',32,'Yunnan',90,41,49),(21,'121','Tai Mao',45,'Yuanna',76,56,57),(22,'122','Meng Leng',29,'Jiangxi',88,82,90),(23,'123','Tailang Hui',35,'Zhejiang',67,90,74),(24,'124','Tailang Jiao',18,'Sichuan',72,72,73),(25,'125','Tailang Hong',35,'Fujian',80,65,72),(26,'126','Mike Feng',30,'Shanghai',9,60,90),(27,'127','Bob Li',23,'Beijing',60,70,80),(28,'100','Lu Xu',30,'Fujian',100,100,100);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-27 22:17:25
