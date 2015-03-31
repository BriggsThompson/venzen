-- MySQL dump 10.13  Distrib 5.5.41, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: venzen
-- ------------------------------------------------------
-- Server version	5.5.41-0ubuntu0.14.04.1

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
-- Current Database: `venzen`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `venzen` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `venzen`;

--
-- Table structure for table `attribute`
--

DROP TABLE IF EXISTS `attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute` (
  `attributeId` mediumint(9) NOT NULL AUTO_INCREMENT,
  `type` varchar(200) NOT NULL,
  `createTimestamp` datetime NOT NULL,
  PRIMARY KEY (`attributeId`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute`
--

LOCK TABLES `attribute` WRITE;
/*!40000 ALTER TABLE `attribute` DISABLE KEYS */;
INSERT INTO `attribute` VALUES (1,'Billiards','2015-03-10 19:35:48'),(2,'Darts','2015-03-10 19:35:48'),(3,'Arcade','2015-03-10 19:35:48'),(4,'Bowling','2015-03-10 19:35:48'),(5,'Chef\'s Table','2015-03-10 19:35:48'),(6,'Corkage Permitted','2015-03-10 19:35:48'),(7,'Cyclorama','2015-03-10 19:35:48'),(8,'Handicap Accessible','2015-03-10 19:35:48'),(9,'Karaoke','2015-03-10 19:35:48'),(10,'BYO Food/Beverage','2015-03-10 19:35:48'),(11,'Outdoors','2015-03-10 19:35:48'),(12,'HDTV','2015-03-10 19:35:48'),(13,'Stage','2015-03-10 19:35:48'),(14,'WIFI','2015-03-10 19:35:48'),(15,'Wine Cellar','2015-03-10 19:35:48'),(16,'A/V Equipment','2015-03-10 19:35:48'),(17,'Catering Available','2015-03-10 19:35:48'),(18,'Bar Service','2015-03-10 19:35:48'),(19,'Indoors','2015-03-10 19:35:48'),(20,'Smoking Area','2015-03-10 19:35:48'),(21,'Pool','2015-03-10 19:35:48'),(22,'Theater','2015-03-10 19:35:48'),(23,'Roof Top','2015-03-10 19:35:48'),(24,'Valet Parking','2015-03-10 19:35:48'),(25,'Street Parking','2015-03-10 19:35:48');
/*!40000 ALTER TABLE `attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'Content Admin');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_0e939a4f` (`group_id`),
  KEY `auth_group_permissions_8373b171` (`permission_id`),
  CONSTRAINT `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permission_group_id_689710a9a73b7457_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,19),(2,1,20),(3,1,21),(4,1,22),(5,1,23),(6,1,24),(7,1,25),(8,1,26),(9,1,27),(10,1,28),(11,1,29),(12,1,30),(13,1,31),(14,1,32),(15,1,33),(16,1,34),(17,1,35),(18,1,36),(19,1,37),(20,1,38),(21,1,39),(22,1,40),(23,1,41),(24,1,42),(25,1,43),(26,1,44),(27,1,45),(28,1,46),(29,1,47),(30,1,48),(31,1,49),(32,1,50),(33,1,51),(34,1,52),(35,1,53),(36,1,54),(37,1,55),(38,1,56),(39,1,57);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_417f1b1c` (`content_type_id`),
  CONSTRAINT `auth__content_type_id_508cf46651277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add log entry',6,'add_logentry'),(17,'Can change log entry',6,'change_logentry'),(18,'Can delete log entry',6,'delete_logentry'),(19,'Can add attribute',9,'add_attribute'),(20,'Can change attribute',9,'change_attribute'),(21,'Can delete attribute',9,'delete_attribute'),(22,'Can add capacity',10,'add_capacity'),(23,'Can change capacity',10,'change_capacity'),(24,'Can delete capacity',10,'delete_capacity'),(25,'Can add space capacity',11,'add_spacecapacity'),(26,'Can change space capacity',11,'change_spacecapacity'),(27,'Can delete space capacity',11,'delete_spacecapacity'),(28,'Can add cost',12,'add_cost'),(29,'Can change cost',12,'change_cost'),(30,'Can delete cost',12,'delete_cost'),(31,'Can add detail',13,'add_detail'),(32,'Can change detail',13,'change_detail'),(33,'Can delete detail',13,'delete_detail'),(34,'Can add inclusion',14,'add_inclusion'),(35,'Can change inclusion',14,'change_inclusion'),(36,'Can delete inclusion',14,'delete_inclusion'),(37,'Can add requirement',15,'add_requirement'),(38,'Can change requirement',15,'change_requirement'),(39,'Can delete requirement',15,'delete_requirement'),(40,'Can add space',8,'add_space'),(41,'Can change space',8,'change_space'),(42,'Can delete space',8,'delete_space'),(43,'Can add space attribute',16,'add_spaceattribute'),(44,'Can change space attribute',16,'change_spaceattribute'),(45,'Can delete space attribute',16,'delete_spaceattribute'),(46,'Can add space image',17,'add_spaceimage'),(47,'Can change space image',17,'change_spaceimage'),(48,'Can delete space image',17,'delete_spaceimage'),(49,'Can add venue',7,'add_venue'),(50,'Can change venue',7,'change_venue'),(51,'Can delete venue',7,'delete_venue'),(52,'Can add venue attribute',18,'add_venueattribute'),(53,'Can change venue attribute',18,'change_venueattribute'),(54,'Can delete venue attribute',18,'delete_venueattribute'),(55,'Can add venue image',19,'add_venueimage'),(56,'Can change venue image',19,'change_venueimage'),(57,'Can delete venue image',19,'delete_venueimage');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$15000$OixL8eFJDRuG$J8phdSebw6PfqT4Sc+ZitIANwG8/r9GuTvai/mICjVs=','2015-03-31 01:34:08',1,'briggs','Briggs','Thompson','w.briggs.thompson@gmail.com',1,1,'2015-03-10 00:04:39'),(2,'pbkdf2_sha256$15000$mGEUU4Aj36zX$cqkVvQMFzE5VFHNGphpfAfsYskGAklzLrXGY0wAwP6s=','2015-03-18 03:28:28',0,'matt','Matt','Milbrandt','milbrandtmatt@gmail.com',1,1,'2015-03-14 01:14:39'),(3,'pbkdf2_sha256$15000$k40Yvl2zMBXz$T9srYzfAiU/EeRvGZ8SDPP+A/4emznlxxLfw2LHcIrA=','2015-03-17 17:49:24',0,'callie','Callie','Ogden','callieog@gmail.com',1,1,'2015-03-14 01:14:47'),(4,'pbkdf2_sha256$15000$zehhnOZJOizY$2OeujXUGf6AbATFQQ5P21LEpNZ27KnHe1/vb/zng45s=','2015-03-15 23:09:47',0,'josh','Josh','Fishman','josh@wecreativeagency.com',1,1,'2015-03-14 01:14:54');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_e8701ad4` (`user_id`),
  KEY `auth_user_groups_0e939a4f` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (5,2,1),(4,3,1),(3,4,1);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_e8701ad4` (`user_id`),
  KEY `auth_user_user_permissions_8373b171` (`permission_id`),
  CONSTRAINT `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissi_user_id_7f0938558328534a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `capacity`
--

DROP TABLE IF EXISTS `capacity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `capacity` (
  `capacityId` mediumint(9) NOT NULL AUTO_INCREMENT,
  `spaceId` mediumint(9) NOT NULL,
  `type` enum('Cocktail','Seated For Dining','Theater Style','Workout Activity') NOT NULL,
  `capacity` mediumint(9) NOT NULL,
  `createTimestamp` datetime NOT NULL,
  PRIMARY KEY (`capacityId`),
  KEY `FK_capacity_attributes_spaceId` (`spaceId`),
  CONSTRAINT `FK_capacity_attributes_spaceId` FOREIGN KEY (`spaceId`) REFERENCES `space` (`spaceId`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `capacity`
--

LOCK TABLES `capacity` WRITE;
/*!40000 ALTER TABLE `capacity` DISABLE KEYS */;
INSERT INTO `capacity` VALUES (13,1,'Cocktail',100,'2015-03-11 01:37:29'),(14,1,'Workout Activity',40,'2015-03-11 01:37:29'),(15,5,'Cocktail',325,'2015-03-18 04:11:59'),(16,6,'Cocktail',150,'2015-03-18 04:13:22'),(17,3,'Cocktail',800,'2015-03-18 03:13:00'),(18,3,'Seated For Dining',50,'2015-03-18 03:13:00'),(19,3,'Theater Style',300,'2015-03-18 03:13:00'),(20,9,'Cocktail',276,'2015-03-18 04:29:22'),(21,7,'Seated For Dining',150,'2015-03-18 04:25:11'),(22,7,'Cocktail',225,'2015-03-18 04:25:11'),(23,11,'Cocktail',200,'2015-03-18 04:41:22'),(24,10,'Cocktail',70,'2015-03-18 04:43:15');
/*!40000 ALTER TABLE `capacity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detail`
--

DROP TABLE IF EXISTS `detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detail` (
  `detailId` mediumint(9) NOT NULL AUTO_INCREMENT,
  `spaceId` mediumint(9) NOT NULL,
  `title` varchar(1000) NOT NULL,
  `description` text,
  `createTimestamp` datetime NOT NULL,
  PRIMARY KEY (`detailId`),
  KEY `FK_detail_spaceId` (`spaceId`),
  CONSTRAINT `FK_detail_spaceId` FOREIGN KEY (`spaceId`) REFERENCES `space` (`spaceId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detail`
--

LOCK TABLES `detail` WRITE;
/*!40000 ALTER TABLE `detail` DISABLE KEYS */;
INSERT INTO `detail` VALUES (1,3,'Security guard optional addition','$25/hr per guard','2015-03-18 03:13:00'),(2,3,'Use of the house PA requires Palm Door engineer onsite','$250 Flat rate per shift','2015-03-18 03:13:00'),(3,3,'Additional services=30% markup fee per service.','furniture, tents, entertainment, AV, lighting, decor, internet, parking and event staff ','2015-03-18 03:13:00'),(4,2,'Staffing','Staffing charges vary per event and are conditioned on specific security needs of the event and the art exhibitions on view at the museum. \r\n\r\n-A minimum of 2 staff (guard/manager on duty) must be present for setup/tear-down.\r\n\r\n-Staff required during museum hours: 3.\r\n\r\n-A minimum of 5 during event @ $125 per hour; if the event is more than 200, then up to 7 staff can be required.\r\n\r\n Security is provided through Frontera Security.','2015-03-31 04:05:49');
/*!40000 ALTER TABLE `detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_417f1b1c` (`content_type_id`),
  KEY `django_admin_log_e8701ad4` (`user_id`),
  CONSTRAINT `djang_content_type_id_697914295151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2015-03-10 02:55:31','1','Attribute object',1,'',9,1),(2,'2015-03-10 03:12:10','2','Attribute object',1,'',9,1),(3,'2015-03-10 03:12:33','3','Attribute object',1,'',9,1),(4,'2015-03-10 03:12:52','1','Attribute object',2,'Changed value.',9,1),(5,'2015-03-10 03:15:30','1','Venue object',1,'',7,1),(6,'2015-03-10 03:20:40','1','Space object',1,'',8,1),(7,'2015-03-10 03:21:14','2','Space object',1,'',8,1),(8,'2015-03-10 03:32:08','1','Inclusion object',1,'',14,1),(9,'2015-03-10 03:32:31','2','Inclusion object',1,'',14,1),(10,'2015-03-10 03:32:45','3','Inclusion object',1,'',14,1),(11,'2015-03-10 03:33:00','4','Inclusion object',1,'',14,1),(12,'2015-03-10 03:33:14','5','Inclusion object',1,'',14,1),(13,'2015-03-10 03:33:26','6','Inclusion object',1,'',14,1),(14,'2015-03-10 03:33:40','7','Inclusion object',1,'',14,1),(15,'2015-03-10 03:41:55','1','SpaceAttribute object',1,'',16,1),(16,'2015-03-10 03:42:03','2','SpaceAttribute object',1,'',16,1),(17,'2015-03-10 03:59:22','1','SpaceAttribute object',1,'',16,1),(18,'2015-03-10 04:00:40','2','SpaceAttribute object',1,'',16,1),(19,'2015-03-10 04:01:58','1','Requirement object',1,'',15,1),(20,'2015-03-10 04:05:22','1','Capacity object',1,'',10,1),(21,'2015-03-10 04:05:34','2','Capacity object',1,'',10,1),(22,'2015-03-10 04:05:43','3','Capacity object',1,'',10,1),(23,'2015-03-10 04:09:46','1','SpaceCapacity object',1,'',11,1),(24,'2015-03-10 04:09:55','2','SpaceCapacity object',1,'',11,1),(25,'2015-03-10 04:10:02','3','SpaceCapacity object',1,'',11,1),(26,'2015-03-11 00:53:34','1','The Contemporary Austin - 1',1,'',7,1),(27,'2015-03-11 00:54:45','1','The Contemporary Austin - 1',2,'Changed phoneNumber.',7,1),(28,'2015-03-11 01:38:09','1','The Contemporary Austin - Roof Deck',2,'Added space attribute \"SpaceAttribute object\". Added capacity \"Cocktail\". Added capacity \"Workout Activity\".',8,1),(29,'2015-03-14 01:11:32','1','Content Admin',1,'',2,1),(30,'2015-03-14 01:14:40','2','matt',1,'',3,1),(31,'2015-03-14 01:14:48','3','callie',1,'',3,1),(32,'2015-03-14 01:14:54','4','josh',1,'',3,1),(33,'2015-03-14 01:15:44','4','josh',2,'Changed first_name, last_name, email and groups.',3,1),(34,'2015-03-14 01:15:59','1','briggs',2,'Changed first_name and last_name.',3,1),(35,'2015-03-14 01:16:19','3','callie',2,'Changed is_staff and groups.',3,1),(36,'2015-03-14 01:16:28','4','josh',2,'Changed is_staff.',3,1),(37,'2015-03-14 01:16:48','3','callie',2,'Changed first_name, last_name and email.',3,1),(38,'2015-03-14 01:17:15','2','matt',2,'Changed first_name, last_name, email, is_staff and groups.',3,1),(39,'2015-03-14 01:27:44','1','The Contemporary Austin - 1',2,'Deleted venue venue type \"The Contemporary Austin - Raw Space\". Deleted venue venue type \"The Contemporary Austin - Banquet Hall\". Deleted venue venue type \"The Contemporary Austin - Cafe\".',7,1),(40,'2015-03-17 19:00:11','2','Palm Door on Sixth - 2',1,'',7,3),(41,'2015-03-18 04:11:37','4','The Market & Tap Room - 4',1,'',7,2),(42,'2015-03-18 04:13:17','5','The Market & Tap Room - The Market',2,'Added space attribute \"SpaceAttribute object\". Added space attribute \"SpaceAttribute object\". Added capacity \"Cocktail\".',8,2),(43,'2015-03-18 04:13:45','6','The Market & Tap Room - Tap Room',2,'Added space attribute \"SpaceAttribute object\". Added capacity \"Cocktail\".',8,2),(44,'2015-03-18 04:14:45','3','Palm Door on Sixth - Indoor',2,'Changed width, length and height. Added space attribute \"SpaceAttribute object\". Added space attribute \"SpaceAttribute object\". Added space attribute \"SpaceAttribute object\". Added capacity \"Cocktail\". Added capacity \"Seated For Dining\". Added capacity \"Theater Style\". Added detail \"Detail object\". Added detail \"Detail object\". Added detail \"Detail object\". Added inclusion \"Inclusion object\". Added inclusion \"Inclusion object\". Added requirement \"Palm Door on Sixth - Indoor - Use of the house PA requires Palm Door sound engineer onsite\". Added requirement \"Palm Door on Sixth - Indoor - Number of security guards required\".',8,3),(45,'2015-03-18 04:24:48','5','Palm Door on Sabine - 5',1,'',7,3),(46,'2015-03-18 04:28:27','6','Hangar Lounge - 6',1,'',7,2),(47,'2015-03-18 04:28:50','4','The Market & Tap Room - 4',2,'Changed email.',7,2),(48,'2015-03-18 04:31:47','9','Hangar Lounge - Hangar Lounge',2,'Added space attribute \"SpaceAttribute object\". Added space attribute \"SpaceAttribute object\". Added space attribute \"SpaceAttribute object\". Added capacity \"Cocktail\".',8,2),(49,'2015-03-18 04:32:09','7','Palm Door on Sabine - Indoor',2,'Added space attribute \"SpaceAttribute object\". Added space attribute \"SpaceAttribute object\". Added space attribute \"SpaceAttribute object\". Added space attribute \"SpaceAttribute object\". Added capacity \"Seated For Dining\". Added capacity \"Cocktail\". Added inclusion \"Inclusion object\". Added inclusion \"Inclusion object\". Added inclusion \"Inclusion object\". Added inclusion \"Inclusion object\". Added requirement \"Palm Door on Sabine - Indoor - Require 50% of room rental fee with a signed contract to secure your date\". Added requirement \"Palm Door on Sabine - Indoor - $500 damage deposit & final payment will be due two weeks prior to your event.\". Added requirement \"Palm Door on Sabine - Indoor - Pink Avocado in-house caterer\". Added requirement \"Palm Door on Sabine - Indoor - Outside catering= $3500 fee\".',8,3),(50,'2015-03-18 04:40:55','7','The Red Room - 7',1,'',7,2),(51,'2015-03-18 04:43:12','11','The Red Room - Entire Venue',2,'Changed height. Added space attribute \"SpaceAttribute object\". Added space attribute \"SpaceAttribute object\". Added space attribute \"SpaceAttribute object\". Added capacity \"Cocktail\".',8,2),(52,'2015-03-18 04:43:46','10','The Red Room - West Lounge',2,'Added space attribute \"SpaceAttribute object\". Added space attribute \"SpaceAttribute object\". Added space attribute \"SpaceAttribute object\". Added capacity \"Cocktail\".',8,2),(53,'2015-03-18 04:46:14','8','Brazos Hall - 8',1,'',7,3),(54,'2015-03-19 16:14:14','9','Swan Dive - 9',1,'',7,3),(55,'2015-03-19 16:27:51','10','Trinity Hall - 10',1,'',7,3),(56,'2015-03-19 16:28:49','10','Trinity Hall - 10',2,'Changed phoneNumber and email.',7,3),(57,'2015-03-22 22:39:06','9','Swan Dive - 9',2,'Changed description for space \"Swan Dive - Indoor\".',7,4),(58,'2015-03-22 22:40:26','8','Brazos Hall - 8',2,'Changed description for space \"Brazos Hall - Main Hall\". Changed description for space \"Brazos Hall - Rooftop Deck\".',7,4),(59,'2015-03-31 01:35:39','15','Trinity Hall - Indoor',2,'Added space image \"Indoor - 1\".',8,1),(60,'2015-03-31 01:35:52','15','Trinity Hall - Indoor',2,'Deleted space image \"Indoor - None\".',8,1),(61,'2015-03-31 03:00:17','12','Brazos Hall - Main Hall',2,'Added space image \"Main Hall - 2\". Added space floorplan \"Main Hall - 1\".',8,1),(62,'2015-03-31 03:02:45','12','Brazos Hall - Main Hall',2,'Deleted space image \"Main Hall - None\". Deleted space floorplan \"Main Hall - None\".',8,1),(63,'2015-03-31 03:50:08','10','Trinity Hall - 10',2,'Added venue venue type \"Trinity Hall - Banquet Hall\". Added venue image \"Trinity Hall - 1\". Added venue floorplan \"Trinity Hall - 1\".',7,1),(64,'2015-03-31 03:50:20','10','Trinity Hall - 10',2,'Deleted venue image \"Trinity Hall - None\". Deleted venue floorplan \"Trinity Hall - None\".',7,1),(65,'2015-03-31 04:08:08','2','The Contemporary Austin - Community Room',2,'Added detail \"Detail object\".',8,3);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_45f3b1d93ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'content type','contenttypes','contenttype'),(5,'session','sessions','session'),(6,'log entry','admin','logentry'),(7,'venue','home','venue'),(8,'space','home','space'),(9,'attribute','home','attribute'),(10,'capacity','home','capacity'),(11,'space capacity','home','spacecapacity'),(12,'cost','home','cost'),(13,'detail','home','detail'),(14,'inclusion','home','inclusion'),(15,'requirement','home','requirement'),(16,'space attribute','home','spaceattribute'),(17,'space image','home','spaceimage'),(18,'venue attribute','home','venueattribute'),(19,'venue image','home','venueimage'),(20,'venue venue type','home','venuevenuetype'),(21,'venue event','home','venueevent'),(22,'space floorplan','home','spacefloorplan'),(23,'venue floorplan','home','venuefloorplan');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2015-03-10 00:04:10'),(2,'auth','0001_initial','2015-03-10 00:04:14'),(3,'admin','0001_initial','2015-03-10 00:04:15'),(4,'sessions','0001_initial','2015-03-10 00:04:16'),(5,'home','0001_initial','2015-03-10 01:55:27');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('1dkzxo4dxvuwd9ci04moustbhosb3x8x','NzI0NDNmZmRlOTFjN2QyNjBlYzE0MTMzYmZhYjBhYTQ2MmIzYmViYTp7Il9hdXRoX3VzZXJfaGFzaCI6ImRkN2ZlN2FhNGJjZDJhNDBjMjdmOTUzYjAxZmI0ZTA1ODk0ZTYwZjciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9','2015-03-28 02:08:35'),('4ok7ifyg4m3j8sv4u2fiifm6scffmnbq','YmViNjg0MGI3MjUwNTE3MDU1NmVlNTc2Y2RhMWFkN2Q0NGMyNmNlMDp7Il9hdXRoX3VzZXJfaGFzaCI6ImYzMzFiZjkzZmVhMGUyMjhiNjk1MTA2MjJlOWMyN2RhNjcyMWQ3NTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-03-28 01:26:20'),('8fx8sjbdoi0l2v7aq7cbtbgfk72i4m9g','NzNmYmM1NjM3MTE3ZTFhZTRlYzRlMzYwNmI4NmU0ZjEwNzk5MWRjMjp7Il9hdXRoX3VzZXJfaGFzaCI6ImI2YTM2MzlmNTAzNGMzN2NjYTI3Mzc2YjI5MWQ0YzhlYTllYWVkNGIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjJ9','2015-03-31 16:23:46'),('axew2zbzhe9csqeq6dyp6b2i5kfs15j6','Mzc4NWEyOGQxOTczMDYzNTFmZDNkOWUzNzNiODk2OGJlMzIxYzZmZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjA0YTBiY2MyMDZmZWRjNjA1NzE3MzdkMzQyZGQ3ZTQxYzdkMDBjYTUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjR9','2015-03-28 02:44:59'),('bb8f2hhqeex9lyth030gyxibl4rb99hd','YmViNjg0MGI3MjUwNTE3MDU1NmVlNTc2Y2RhMWFkN2Q0NGMyNmNlMDp7Il9hdXRoX3VzZXJfaGFzaCI6ImYzMzFiZjkzZmVhMGUyMjhiNjk1MTA2MjJlOWMyN2RhNjcyMWQ3NTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-04-14 01:34:08'),('gormctijmvit8isjek5mu9r5sauuk678','Mzc4NWEyOGQxOTczMDYzNTFmZDNkOWUzNzNiODk2OGJlMzIxYzZmZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjA0YTBiY2MyMDZmZWRjNjA1NzE3MzdkMzQyZGQ3ZTQxYzdkMDBjYTUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjR9','2015-03-29 23:09:47'),('j2wqwuvt0fqckizn7ybus59yxi2zorjq','YmViNjg0MGI3MjUwNTE3MDU1NmVlNTc2Y2RhMWFkN2Q0NGMyNmNlMDp7Il9hdXRoX3VzZXJfaGFzaCI6ImYzMzFiZjkzZmVhMGUyMjhiNjk1MTA2MjJlOWMyN2RhNjcyMWQ3NTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-03-28 01:10:59'),('k2zv35g01mupxostfiumf3qfp1pyob0j','YmViNjg0MGI3MjUwNTE3MDU1NmVlNTc2Y2RhMWFkN2Q0NGMyNmNlMDp7Il9hdXRoX3VzZXJfaGFzaCI6ImYzMzFiZjkzZmVhMGUyMjhiNjk1MTA2MjJlOWMyN2RhNjcyMWQ3NTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-03-24 00:04:53'),('lhs8eveu99l4au3mm21moethmbdcp87d','YmViNjg0MGI3MjUwNTE3MDU1NmVlNTc2Y2RhMWFkN2Q0NGMyNmNlMDp7Il9hdXRoX3VzZXJfaGFzaCI6ImYzMzFiZjkzZmVhMGUyMjhiNjk1MTA2MjJlOWMyN2RhNjcyMWQ3NTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-03-31 14:58:35'),('n45otxqn5zn0w2zqllfr1z90ahk4p8oa','NzNmYmM1NjM3MTE3ZTFhZTRlYzRlMzYwNmI4NmU0ZjEwNzk5MWRjMjp7Il9hdXRoX3VzZXJfaGFzaCI6ImI2YTM2MzlmNTAzNGMzN2NjYTI3Mzc2YjI5MWQ0YzhlYTllYWVkNGIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjJ9','2015-04-01 03:28:28'),('s72xtmwheya4x69e9wvrka12hljm224l','NzI0NDNmZmRlOTFjN2QyNjBlYzE0MTMzYmZhYjBhYTQ2MmIzYmViYTp7Il9hdXRoX3VzZXJfaGFzaCI6ImRkN2ZlN2FhNGJjZDJhNDBjMjdmOTUzYjAxZmI0ZTA1ODk0ZTYwZjciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9','2015-03-31 17:49:24');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_type`
--

DROP TABLE IF EXISTS `event_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_type` (
  `eventTypeId` mediumint(9) NOT NULL AUTO_INCREMENT,
  `type` varchar(200) NOT NULL,
  `createTimestamp` datetime NOT NULL,
  PRIMARY KEY (`eventTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_type`
--

LOCK TABLES `event_type` WRITE;
/*!40000 ALTER TABLE `event_type` DISABLE KEYS */;
INSERT INTO `event_type` VALUES (1,'Birthday Party','2015-03-10 19:35:48'),(2,'Class','2015-03-10 19:35:48'),(3,'Corporate Event','2015-03-10 19:35:48'),(4,'Dinner Party','2015-03-10 19:35:48'),(5,'Filming Location','2015-03-10 19:35:48'),(6,'Launch Party','2015-03-10 19:35:48'),(7,'Meeting','2015-03-10 19:35:48'),(8,'Fundraiser','2015-03-10 19:35:48'),(9,'Photo Shoot','2015-03-10 19:35:48'),(10,'Social Event','2015-03-10 19:35:48'),(11,'Reception','2015-03-10 19:35:48');
/*!40000 ALTER TABLE `event_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inclusion`
--

DROP TABLE IF EXISTS `inclusion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inclusion` (
  `inclusionId` mediumint(9) NOT NULL AUTO_INCREMENT,
  `spaceId` mediumint(9) NOT NULL,
  `inclusion` varchar(1000) NOT NULL,
  `count` mediumint(9) DEFAULT NULL,
  `createTimestamp` datetime NOT NULL,
  PRIMARY KEY (`inclusionId`),
  KEY `FK_inclusion_spaceId` (`spaceId`),
  CONSTRAINT `FK_inclusion_spaceId` FOREIGN KEY (`spaceId`) REFERENCES `space` (`spaceId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inclusion`
--

LOCK TABLES `inclusion` WRITE;
/*!40000 ALTER TABLE `inclusion` DISABLE KEYS */;
INSERT INTO `inclusion` VALUES (1,3,'Full stage production',NULL,'2015-03-18 03:13:00'),(2,3,'Gorgeous wood bars',NULL,'2015-03-18 03:13:00'),(3,7,'60\" Round Tables',15,'2015-03-18 04:25:11'),(4,7,'36\" Round Tables',7,'2015-03-18 04:25:11'),(5,7,'Fruitwood folding chairs',150,'2015-03-18 04:25:11'),(6,7,'Gorgeous wood bar',1,'2015-03-18 04:25:11');
/*!40000 ALTER TABLE `inclusion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requirement`
--

DROP TABLE IF EXISTS `requirement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requirement` (
  `requirementId` mediumint(9) NOT NULL AUTO_INCREMENT,
  `spaceId` mediumint(9) NOT NULL,
  `requirement` varchar(1000) NOT NULL,
  `createTimestamp` datetime NOT NULL,
  PRIMARY KEY (`requirementId`),
  KEY `FK_requirement_spaceId` (`spaceId`),
  CONSTRAINT `FK_requirement_spaceId` FOREIGN KEY (`spaceId`) REFERENCES `space` (`spaceId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requirement`
--

LOCK TABLES `requirement` WRITE;
/*!40000 ALTER TABLE `requirement` DISABLE KEYS */;
INSERT INTO `requirement` VALUES (1,3,'Use of the house PA requires Palm Door sound engineer onsite','2015-03-18 03:13:00'),(2,3,'Number of security guards required','2015-03-18 03:13:00'),(3,7,'Require 50% of room rental fee with a signed contract to secure your date','2015-03-18 04:25:11'),(4,7,'$500 damage deposit & final payment will be due two weeks prior to your event.','2015-03-18 04:25:11'),(5,7,'Pink Avocado in-house caterer','2015-03-18 04:25:11'),(6,7,'Outside catering= $3500 fee','2015-03-18 04:25:11');
/*!40000 ALTER TABLE `requirement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `space`
--

DROP TABLE IF EXISTS `space`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `space` (
  `spaceId` mediumint(9) NOT NULL AUTO_INCREMENT,
  `venueId` mediumint(9) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` text,
  `squareFootage` mediumint(9) DEFAULT NULL,
  `width` mediumint(9) DEFAULT NULL,
  `length` mediumint(9) DEFAULT NULL,
  `height` mediumint(9) DEFAULT NULL,
  `deposit` decimal(10,0) DEFAULT NULL,
  `cleaningFee` decimal(10,0) DEFAULT NULL,
  `costStartRange` decimal(10,0) DEFAULT NULL,
  `costEndRange` decimal(10,0) DEFAULT NULL,
  `costDetails` varchar(500) DEFAULT NULL,
  `nonProfitDiscount` varchar(50) DEFAULT NULL,
  `createTimestamp` datetime NOT NULL,
  PRIMARY KEY (`spaceId`),
  KEY `FK_space_venueId` (`venueId`),
  CONSTRAINT `FK_space_venueId` FOREIGN KEY (`venueId`) REFERENCES `venue` (`venueId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `space`
--

LOCK TABLES `space` WRITE;
/*!40000 ALTER TABLE `space` DISABLE KEYS */;
INSERT INTO `space` VALUES (1,1,'Roof Deck','The beautiful IPE decking, interspersed with laminated glass light floor panels, creates a magical glow with a stunning view of Austin’s skyline and the Texas State Capitol. The outdoor Roof Deck is an urban paradise perfect for cocktail parties, dinners, networking events, and many other unique events.',1200,60,20,12,1000,150,2200,4000,'High Season (30x40-foot east tent included): March 17–May 5 and September 29–November 17  Saturdays: $4,000 | Friday: $3,500 | Thursday: $3,000 | Sunday–Wednesday: $2,500','25%','2015-03-11 00:47:01'),(2,1,'Community Room','An inspiring space that encourages the creative exchange of ideas, this room is ideal for meetings, screenings, lectures, business lunches, press/blog lounges, intimate receptions, and cocktail events. The room is equipped with built-in sound, audio/visual, and a beautiful, large, 15-foot window with views overlooking historic Congress Avenue.',900,30,10,12,1000,150,250,800,'Detail','25%','2015-03-11 00:47:01'),(3,2,'Indoor','Modern and Industrial. Gorgeous Wood Bars, Concrete Floors, High Ceilings \r\n\r\n3800 Sq Ft Indoor | Modern & Industrial\r\n\r\n Main Room with Full Stage Production \r\n\r\nVIP/West Annex with Private Bar',3800,0,0,0,0,0,0,0,'0','0','2015-03-17 18:31:40'),(4,2,'Outdoor','Urban Oasis. Private Courtyard, Wood Deck and Green Lawn\r\n\r\n3455 Sq Ft Outdoor | Urban Oasis\r\n\r\nPrep Kitchen/Outdoor Bar\r\n\r\nOutdoor String Lights',3455,5,22,0,0,0,0,0,'0','0','2015-03-17 18:31:40'),(5,4,'The Market','Custom**',0,0,0,0,0,0,0,0,'0','0','2015-03-18 03:41:46'),(6,4,'Tap Room','Custom**',0,0,0,0,0,0,0,0,'0','0','2015-03-18 03:41:46'),(7,5,'Indoor','Hardwood floors, 14 foot vaulted ceilings\r\nBridal Suite',0,0,0,0,0,0,0,0,'0','0','2015-03-18 04:15:06'),(8,5,'Patio/Deck','Is this rented separately? Or always included? ',0,0,0,0,0,0,0,0,'0','0','2015-03-18 04:15:06'),(9,6,'Hangar Lounge','Custom**',0,0,0,0,0,0,0,0,'0','0','2015-03-18 04:22:02'),(10,7,'West Lounge','',900,0,0,0,0,0,3000,NULL,'$3000 on-site food and wine consumption minimum','0','2015-03-18 04:33:48'),(11,7,'Entire Venue','',2000,0,0,8,0,0,5000,NULL,'$5000 on-site food and wine consumption minimum','0','2015-03-18 04:33:48'),(12,8,'Main Hall','The Main Floor includes a commercial refrigerator, icemaker and sink. \r\nThere is a 16’ loading dock in the rear. The Hall has an ADA compliant 7’ freight elevator.\r\n\r\nBoth levels feature a full range audio speaker system suitable for moderate music playback and announcements. Audio input locations are provided throughout the venue. In addition, a portable speaker system is available for small bands and DJ‘s.',8400,0,0,0,0,0,0,0,'0','0','2015-03-18 04:32:51'),(13,8,'Rooftop Deck','The Rooftop Deck includes icemaker and sink.\r\nThere is a 16’ loading dock in the rear. The Hall has an ADA compliant 7’ freight elevator.\r\n\r\nBoth levels feature a full range audio speaker system suitable for moderate music playback and announcements. Audio input locations are provided throughout the venue. In addition, a portable speaker system is available for small bands and DJ‘s.\r\n',3400,NULL,NULL,0,0,0,0,0,'0','0','2015-03-18 04:32:51'),(14,9,'Indoor','Clad in white tapestries, and decorated with custom handmade furniture and lounging areas. Swan Dive hosts a wide range of events, including Live Music, Company Parties, Mixers, Presentations, Swing Dancing, Salsa, 2-Step, Burlesque, DJ Sets and non-profit fundraisers.\r\n\r\nThe venue rental allows for company branding, decorations, outside catering, and includes the use of:\r\n- (4) booths\r\n- (7) 24” round cocktail tables\r\n-(4) 48”x24” dining tables \r\n-(19) chairs & barstools. \r\n\r\nSwan Dive is also equipped with wireless internet, Private Green Room access, Bartenders& Security.',0,0,0,0,0,0,0,0,'0','0','2015-03-19 16:06:32'),(15,10,'Indoor','This customizable space can accommodate a wide array of event configurations and set-ups for up to a capacity of 600 people.\r\n\r\nTrinity Hall is available to rent for product launches, music concerts, temporary exhibition space, trade shows, cocktail parties, holiday parties, weddings, corporate events and more.\r\n\r\nTrinity Hall also offers a full professional commercial kitchen space available to rent or for vendors to prepare during events.',11766,0,0,12,0,0,0,0,'0','0','2015-03-19 16:16:16');
/*!40000 ALTER TABLE `space` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `space_attribute`
--

DROP TABLE IF EXISTS `space_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `space_attribute` (
  `spaceAttributeId` mediumint(9) NOT NULL AUTO_INCREMENT,
  `spaceId` mediumint(9) NOT NULL,
  `attributeId` mediumint(9) NOT NULL,
  `createTimestamp` datetime NOT NULL,
  PRIMARY KEY (`spaceAttributeId`),
  KEY `FK_space_attribute_spaceId` (`spaceId`),
  KEY `FK_space_attribute_attributeId` (`attributeId`),
  CONSTRAINT `FK_space_attribute_attributeId` FOREIGN KEY (`attributeId`) REFERENCES `attribute` (`attributeId`),
  CONSTRAINT `FK_space_attribute_spaceId` FOREIGN KEY (`spaceId`) REFERENCES `space` (`spaceId`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `space_attribute`
--

LOCK TABLES `space_attribute` WRITE;
/*!40000 ALTER TABLE `space_attribute` DISABLE KEYS */;
INSERT INTO `space_attribute` VALUES (17,1,2,'2015-03-11 01:37:29'),(18,5,19,'2015-03-18 04:11:59'),(19,5,25,'2015-03-18 04:12:43'),(20,6,19,'2015-03-18 04:13:22'),(21,3,8,'2015-03-18 03:13:00'),(22,3,18,'2015-03-18 03:13:00'),(23,3,13,'2015-03-18 03:13:00'),(24,9,19,'2015-03-18 04:29:22'),(25,9,11,'2015-03-18 04:29:22'),(26,9,25,'2015-03-18 04:29:22'),(27,7,8,'2015-03-18 04:25:11'),(28,7,17,'2015-03-18 04:25:11'),(29,7,10,'2015-03-18 04:25:11'),(30,7,14,'2015-03-18 04:25:11'),(31,11,19,'2015-03-18 04:41:22'),(32,11,12,'2015-03-18 04:41:22'),(33,11,16,'2015-03-18 04:41:22'),(34,10,19,'2015-03-18 04:43:15'),(35,10,12,'2015-03-18 04:43:15'),(36,10,16,'2015-03-18 04:43:15');
/*!40000 ALTER TABLE `space_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `space_floorplan`
--

DROP TABLE IF EXISTS `space_floorplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `space_floorplan` (
  `spaceFloorplanId` mediumint(9) NOT NULL AUTO_INCREMENT,
  `spaceId` mediumint(9) NOT NULL,
  `floorplan` varchar(1000) DEFAULT NULL,
  `order` mediumint(9) DEFAULT NULL,
  `createTimestamp` datetime NOT NULL,
  PRIMARY KEY (`spaceFloorplanId`),
  KEY `FK_space_floorplan_spaceId` (`spaceId`),
  CONSTRAINT `FK_space_floorplan_spaceId` FOREIGN KEY (`spaceId`) REFERENCES `space` (`spaceId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `space_floorplan`
--

LOCK TABLES `space_floorplan` WRITE;
/*!40000 ALTER TABLE `space_floorplan` DISABLE KEYS */;
/*!40000 ALTER TABLE `space_floorplan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `space_image`
--

DROP TABLE IF EXISTS `space_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `space_image` (
  `spaceImageId` mediumint(9) NOT NULL AUTO_INCREMENT,
  `spaceId` mediumint(9) NOT NULL,
  `image` varchar(1000) DEFAULT NULL,
  `order` mediumint(9) DEFAULT NULL,
  `createTimestamp` datetime NOT NULL,
  PRIMARY KEY (`spaceImageId`),
  KEY `FK_space_images_spaceId` (`spaceId`),
  CONSTRAINT `FK_space_images_spaceId` FOREIGN KEY (`spaceId`) REFERENCES `space` (`spaceId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `space_image`
--

LOCK TABLES `space_image` WRITE;
/*!40000 ALTER TABLE `space_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `space_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venue`
--

DROP TABLE IF EXISTS `venue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venue` (
  `venueId` mediumint(9) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `description` text,
  `mission` text,
  `address` varchar(1000) DEFAULT NULL,
  `address2` varchar(1000) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `zipcode` varchar(50) DEFAULT NULL,
  `phoneNumber` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `totalCapacity` mediumint(9) DEFAULT NULL,
  `createTimestamp` datetime NOT NULL,
  PRIMARY KEY (`venueId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venue`
--

LOCK TABLES `venue` WRITE;
/*!40000 ALTER TABLE `venue` DISABLE KEYS */;
INSERT INTO `venue` VALUES (1,'The Contemporary Austin','Host your next event in exquisite style at The Contemporary Austin’s downtown location! A well-\r\nrecognized, beautiful historic building, the Jones Center offers inspiring surroundings that foster creativity and showcase sophistication right on Austin’s famed Congress Avenue in the heart of downtown.\r\n\r\nThe building opened in 1877 as Tobin Drug Store. In 1915, it became the Queen Theater, and morphed again in 1955 into the Lerner Department Store. At last, in 1996 it became Arthouse at the Jones Center and underwent an ambitious renovation and expansion in 2010. In 2011, the Austin Museum of Art (AMOA) merged with Arthouse to form AMOA-Arthouse—now reborn as The Contemporary Austin under new leadership and a refreshed mission and vision.','The Contemporary Austin reflects the spectrum of contemporary art through exhibitions, commissions, education, and the collection.','700 Congress Avenue','','Austin','TX','78701','512-458-8191 x 255','siterentals@thecontemporaryaustin.org',NULL,'2015-03-11 00:47:01'),(2,'Palm Door on Sixth','A contemporary event venue located in Downtown Austin’s historic entertainment district.\r\n\r\nPalm Door on Sixth’s versatile layout comfortably accommodates intimate dinners for 50+ people, an \r\naudience of up to 250 seats, banquets for up to 300 guests and cocktail receptions for up to 800+. \r\n\r\nThe official breakdown of standing capacity is 332 in the Main Room and 167 in the West Annex for a \r\ncombined capacity of 499 indoors. Our outdoor courtyard adds an additional capacity of 500 standing \r\nfor Palm Door on Sixth to accommodate groups of up to 1000 total.','','508 E 6th Street','','Austin','Texas','78701','(512) 391-1994','info@palmdoor.com',NULL,'2015-03-17 18:31:40'),(4,'The Market & Tap Room','The inside of The Market is warm and inviting with exposed brick and wood everywhere you look. The staff is even more inviting, willing to take time to make you a carefully crafted classic American cocktail with a modern twist.','','319 Colorado St.','','Austin','Texas','78701','(512) 472-6662','clarissa@themarketaustin.com/',NULL,'2015-03-18 03:41:46'),(5,'Palm Door on Sabine','Palm Door on Sabine is an urban loft event center located in downtown Austin.\r\n\r\nRoom Rental:\r\nRates are based on a 6 or 10 hour time block including furniture and an on-site Venue Manager.','','401 Sabine Street','','Austin','Texas','78701','(512) 391-1994','info@palmdoor.com',NULL,'2015-03-18 04:15:06'),(6,'Hangar Lounge','Custom*','Custom*',' 318 Colorado St,','','Austin','Texas','78701','512-474-4264','clarissa@themarketaustin.com/',NULL,'2015-03-18 04:22:02'),(7,'The Red Room','This is a unique space located in the heart of downtown, on 3rd street. It\'s an underground venue-the entry is on street level  and you walk down into the lounge space that\'s open to the public for wine tastings and by the glass/bottle. It has a very sexy, jazzy, masculine vibe to it-lots of leather couches (high quality and super comfy) and dim lighting, exposed wood beams on the ceiling, and local art (that\'s available for purchase) displayed on the walls. The venue is split into two sections-one of which is open to the public (semi-private) and one is specifically for events (there isn\'t a door, just a curtain, so it dances on the line of semi-private and private).','','','','','','','512-501-1536','lydia@redroomatx.com',NULL,'2015-03-18 04:33:48'),(8,'Brazos Hall','Brazos Hall is a turn-of-the-century warehouse building at the corner of 4th and Brazos, now converted to Austin\'s premier event space. With its restored long-leaf pine floors, brick walls and wood rafters, Brazos Hall is a venue unlike any other in the heart of downtown. In addition to the 10,000 square feet in the Main Hall, Brazos Hall offers a 3,500 square foot Rooftop Deck with downtown views.There is a 16’ loading dock in the rear. \r\n\r\nThe Hall has an ADA compliant 7’ freight elevator. Both levels are equipped with full men’s and women’s facilities.','','204 EAST 4TH STREET','','AUSTIN','Texas','78701','',' INFO@BRAZOSHALL.COM ',NULL,'2015-03-18 04:32:51'),(9,'Swan Dive','Swan Dive is located in the heart of Austin’s Cultural district on the corner of Red River and 7th, within walking distance from the Convention Center. It’s clad in white tapestries, and decorated with custom handmade furniture and lounging areas. Swan Dive hosts a wide range of events, including Live Music, Company Parties, Mixers, Presentations, Swing Dancing, Salsa,2-Step, Burlesque, DJ Sets and non-profit fundraisers.\r\n\r\nSwan Dive has 2 stages, (inside & outside) fully wired with a professional grade sound and lighting system, operated by The Werd Company. Backline can be provided, along with event planning, production, experiential marketing, on-site photographer, etc. Rates are negotiable and are dependent on your needs.\r\n\r\n*Swan Dive is permitted for outside sound and is an official SXSW venue.','','615 Red River Street','','Austin','Texas','78701','(512) 614-4235','swandivebookingatx@gmail.com',NULL,'2015-03-19 16:06:32'),(10,'Trinity Hall','Trinity Hall is a multi-purpose private event center in the heart of downtown Austin.\r\n\r\nThis customizable space can accommodate a wide array of event configurations and set-ups for up to a capacity of 600 people.\r\n\r\nTrinity Hall is available to rent for product launches, music concerts, temporary exhibition space, trade shows, cocktail parties, holiday parties, weddings, corporate events and more.\r\n\r\nTrinity Hall also offers a full professional commercial kitchen space available to rent or for vendors to prepare during events.','','311 E 5th Street','','Austin','Texas','78701','(512)270-4421','info@trinityhall.com',NULL,'2015-03-19 16:16:16');
/*!40000 ALTER TABLE `venue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venue_attribute`
--

DROP TABLE IF EXISTS `venue_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venue_attribute` (
  `venueAttributeId` mediumint(9) NOT NULL AUTO_INCREMENT,
  `venueId` mediumint(9) NOT NULL,
  `attributeId` mediumint(9) NOT NULL,
  `createTimestamp` datetime NOT NULL,
  PRIMARY KEY (`venueAttributeId`),
  KEY `FK_venue_attribute_venueId` (`venueId`),
  KEY `FK_venue_attribute_attributeId` (`attributeId`),
  CONSTRAINT `FK_venue_attribute_attributeId` FOREIGN KEY (`attributeId`) REFERENCES `attribute` (`attributeId`),
  CONSTRAINT `FK_venue_attribute_venueId` FOREIGN KEY (`venueId`) REFERENCES `venue` (`venueId`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venue_attribute`
--

LOCK TABLES `venue_attribute` WRITE;
/*!40000 ALTER TABLE `venue_attribute` DISABLE KEYS */;
INSERT INTO `venue_attribute` VALUES (1,1,8,'2015-03-11 00:47:01'),(2,1,23,'2015-03-11 00:47:01'),(3,1,11,'2015-03-11 00:47:01'),(4,1,20,'2015-03-11 00:47:01'),(5,1,24,'2015-03-11 00:47:01'),(6,1,25,'2015-03-11 00:47:01'),(7,2,8,'2015-03-17 18:31:40'),(8,2,19,'2015-03-17 18:31:40'),(9,2,11,'2015-03-17 18:31:40'),(10,2,20,'2015-03-17 18:31:40'),(15,4,19,'2015-03-18 03:41:46'),(16,4,23,'2015-03-18 03:41:46'),(17,4,18,'2015-03-18 03:41:46'),(18,4,25,'2015-03-18 03:41:46'),(19,5,8,'2015-03-18 04:15:06'),(20,5,19,'2015-03-18 04:15:06'),(21,5,11,'2015-03-18 04:15:06'),(22,5,17,'2015-03-18 04:15:06'),(23,6,11,'2015-03-18 04:22:02'),(24,6,18,'2015-03-18 04:22:02'),(25,6,20,'2015-03-18 04:22:02'),(26,6,23,'2015-03-18 04:22:02'),(27,6,19,'2015-03-18 04:22:02'),(28,6,25,'2015-03-18 04:22:02'),(29,7,17,'2015-03-18 04:33:48'),(30,7,16,'2015-03-18 04:33:48'),(31,7,15,'2015-03-18 04:33:48'),(32,7,19,'2015-03-18 04:33:48'),(33,7,25,'2015-03-18 04:33:48'),(34,7,12,'2015-03-18 04:33:48'),(35,8,8,'2015-03-18 04:32:51'),(36,8,19,'2015-03-18 04:32:51'),(37,8,11,'2015-03-18 04:32:51'),(38,9,13,'2015-03-19 16:06:32'),(39,9,8,'2015-03-19 16:06:32'),(40,9,18,'2015-03-19 16:06:32'),(41,9,11,'2015-03-19 16:06:32'),(42,9,19,'2015-03-19 16:06:32'),(43,9,20,'2015-03-19 16:06:32'),(44,10,19,'2015-03-19 16:16:16'),(45,10,16,'2015-03-19 16:16:16'),(46,10,18,'2015-03-19 16:16:16'),(47,10,24,'2015-03-19 16:16:16'),(48,10,13,'2015-03-19 16:16:16'),(49,10,17,'2015-03-19 16:16:16');
/*!40000 ALTER TABLE `venue_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venue_event`
--

DROP TABLE IF EXISTS `venue_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venue_event` (
  `venueEventId` mediumint(9) NOT NULL AUTO_INCREMENT,
  `venueId` mediumint(9) NOT NULL,
  `eventTypeId` mediumint(9) NOT NULL,
  `createTimestamp` datetime NOT NULL,
  PRIMARY KEY (`venueEventId`),
  KEY `FK_venue_event_venueId` (`venueId`),
  KEY `FK_venue_event_eventTypeId` (`eventTypeId`),
  CONSTRAINT `FK_venue_event_eventTypeId` FOREIGN KEY (`eventTypeId`) REFERENCES `event_type` (`eventTypeId`),
  CONSTRAINT `FK_venue_event_venueId` FOREIGN KEY (`venueId`) REFERENCES `venue` (`venueId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venue_event`
--

LOCK TABLES `venue_event` WRITE;
/*!40000 ALTER TABLE `venue_event` DISABLE KEYS */;
INSERT INTO `venue_event` VALUES (1,1,1,'2015-03-11 00:47:01'),(2,1,3,'2015-03-11 00:47:01'),(3,1,6,'2015-03-11 00:47:01'),(4,1,7,'2015-03-11 00:47:01'),(5,1,8,'2015-03-11 00:47:01');
/*!40000 ALTER TABLE `venue_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venue_floorplan`
--

DROP TABLE IF EXISTS `venue_floorplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venue_floorplan` (
  `venueFloorplanId` mediumint(9) NOT NULL AUTO_INCREMENT,
  `venueId` mediumint(9) NOT NULL,
  `floorplan` varchar(1000) DEFAULT NULL,
  `order` mediumint(9) DEFAULT NULL,
  `createTimestamp` datetime NOT NULL,
  PRIMARY KEY (`venueFloorplanId`),
  KEY `FK_venue_floorplan_venueId` (`venueId`),
  CONSTRAINT `FK_venue_floorplan_venueId` FOREIGN KEY (`venueId`) REFERENCES `venue` (`venueId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venue_floorplan`
--

LOCK TABLES `venue_floorplan` WRITE;
/*!40000 ALTER TABLE `venue_floorplan` DISABLE KEYS */;
/*!40000 ALTER TABLE `venue_floorplan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venue_image`
--

DROP TABLE IF EXISTS `venue_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venue_image` (
  `venueImageId` mediumint(9) NOT NULL AUTO_INCREMENT,
  `venueId` mediumint(9) NOT NULL,
  `image` varchar(1000) DEFAULT NULL,
  `order` mediumint(9) DEFAULT NULL,
  `createTimestamp` datetime NOT NULL,
  PRIMARY KEY (`venueImageId`),
  KEY `FK_venue_images_venueId` (`venueId`),
  CONSTRAINT `FK_venue_images_venueId` FOREIGN KEY (`venueId`) REFERENCES `venue` (`venueId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venue_image`
--

LOCK TABLES `venue_image` WRITE;
/*!40000 ALTER TABLE `venue_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `venue_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venue_type`
--

DROP TABLE IF EXISTS `venue_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venue_type` (
  `venueTypeId` mediumint(9) NOT NULL AUTO_INCREMENT,
  `type` varchar(200) NOT NULL,
  `createTimestamp` datetime NOT NULL,
  PRIMARY KEY (`venueTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venue_type`
--

LOCK TABLES `venue_type` WRITE;
/*!40000 ALTER TABLE `venue_type` DISABLE KEYS */;
INSERT INTO `venue_type` VALUES (1,'Banquet Hall','2015-03-10 19:35:48'),(2,'Bar','2015-03-10 19:35:48'),(3,'Cafe','2015-03-10 19:35:48'),(4,'Country Club','2015-03-10 19:35:48'),(5,'Raw Space','2015-03-10 19:35:48'),(6,'Gallery','2015-03-10 19:35:48'),(7,'Hotel','2015-03-10 19:35:48'),(8,'Restaurant','2015-03-10 19:35:48'),(9,'Studio','2015-03-10 19:35:48'),(10,'Winery','2015-03-10 19:35:48'),(11,'Brewery','2015-03-10 19:35:48'),(12,'Athletic Facility','2015-03-10 19:35:48'),(13,'Spa','2015-03-10 19:35:48');
/*!40000 ALTER TABLE `venue_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venue_venue_type`
--

DROP TABLE IF EXISTS `venue_venue_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venue_venue_type` (
  `venueVenueTypeId` mediumint(9) NOT NULL AUTO_INCREMENT,
  `venueId` mediumint(9) NOT NULL,
  `venueTypeId` mediumint(9) NOT NULL,
  `createTimestamp` datetime NOT NULL,
  PRIMARY KEY (`venueVenueTypeId`),
  KEY `FK_venueVenueTypeId_venueId` (`venueId`),
  KEY `FK_venueVenueTypeId_eventTypeId` (`venueTypeId`),
  CONSTRAINT `FK_venueVenueTypeId_eventTypeId` FOREIGN KEY (`venueTypeId`) REFERENCES `venue_type` (`venueTypeId`),
  CONSTRAINT `FK_venueVenueTypeId_venueId` FOREIGN KEY (`venueId`) REFERENCES `venue` (`venueId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venue_venue_type`
--

LOCK TABLES `venue_venue_type` WRITE;
/*!40000 ALTER TABLE `venue_venue_type` DISABLE KEYS */;
INSERT INTO `venue_venue_type` VALUES (4,10,1,'2015-03-31 03:49:02');
/*!40000 ALTER TABLE `venue_venue_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-31 16:53:22
