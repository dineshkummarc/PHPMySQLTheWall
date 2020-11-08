CREATE DATABASE  IF NOT EXISTS `new_schema` /*!40100 DEFAULT CHARACTER SET big5 */;
USE `new_schema`;
-- MySQL dump 10.13  Distrib 5.7.12, for osx10.9 (x86_64)
--
-- Host: 127.0.0.1    Database: new_schema
-- ------------------------------------------------------
-- Server version	5.6.28

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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `message_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_on_comments_idx` (`user_id`),
  KEY `messages_on_comments_idx` (`message_id`),
  CONSTRAINT `messages_on_comments` FOREIGN KEY (`message_id`) REFERENCES `messages` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `users_on_comments` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'  ','2016-09-12 17:09:35','2016-09-12 17:09:35',NULL,NULL),(2,' fdafdafad ','2016-09-12 17:10:08','2016-09-12 17:10:08',NULL,NULL),(3,' fdafdafa ','2016-09-12 17:17:22','2016-09-12 17:17:22',NULL,NULL);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `comment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_on_message_idx` (`comment_id`),
  KEY `user_on_message_idx` (`user_id`),
  CONSTRAINT `comment_on_message` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_on_message` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,'  ','2016-09-12 17:01:29','2016-09-12 17:01:29',NULL,NULL),(2,'  ','2016-09-12 17:02:15','2016-09-12 17:02:15',NULL,NULL),(3,'  ','2016-09-12 17:02:25','2016-09-12 17:02:25',NULL,NULL),(4,'  ','2016-09-12 17:02:44','2016-09-12 17:02:44',NULL,NULL),(5,' fdafdafa ','2016-09-12 17:07:30','2016-09-12 17:07:30',NULL,NULL),(6,' fafdafda ','2016-09-12 17:17:26','2016-09-12 17:17:26',NULL,NULL),(7,' fafdafda ','2016-09-12 17:18:14','2016-09-12 17:18:14',NULL,NULL),(8,' fafdafda ','2016-09-12 17:19:00','2016-09-12 17:19:00',NULL,NULL),(9,' fafdafda ','2016-09-12 17:19:04','2016-09-12 17:19:04',NULL,NULL),(10,' posting message ','2016-09-13 07:07:34','2016-09-13 07:07:34',NULL,NULL),(11,' posting another message ','2016-09-13 07:08:52','2016-09-13 07:08:52',NULL,NULL),(12,' posting another message ','2016-09-13 07:10:17','2016-09-13 07:10:17',NULL,NULL),(13,' Post a Message ','2016-09-13 07:34:04','2016-09-13 07:34:04',NULL,NULL),(14,' Post a Message ','2016-09-13 07:35:09','2016-09-13 07:35:09',NULL,NULL),(15,' Post a Message ','2016-09-13 07:35:38','2016-09-13 07:35:38',NULL,NULL),(16,' test\r\n ','2016-09-13 07:35:55','2016-09-13 07:35:55',NULL,NULL);
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (11,'Andrew','Marr','ARMphotography@gmail.com','coding','2016-09-12 15:58:50','2016-09-12 15:58:50'),(12,'GL','Law','gloria@gmail.com','turtles','2016-09-12 16:00:09','2016-09-12 16:00:09'),(13,'Kinuyo','Fujikawa','kinuyo@fakemail.com','123456','2016-09-12 16:00:46','2016-09-12 16:00:46'),(14,'Andrew','Marr','ARMphotography@gmail.com','coding','2016-09-12 16:45:46','2016-09-12 16:45:46'),(15,'Andrew','Marr','ARMphotography@gmail.com','coding','2016-09-12 17:37:00','2016-09-12 17:37:00'),(16,'bill','gates','bill@windows.com','coding','2016-09-13 11:55:29','2016-09-13 11:55:29');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-13 13:45:42
