-- MariaDB dump 10.19  Distrib 10.5.11-MariaDB, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: ksc_django
-- ------------------------------------------------------
-- Server version	10.5.11-MariaDB

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
-- Table structure for table `account_emailaddress`
--

DROP TABLE IF EXISTS `account_emailaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_emailaddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `account_emailaddress_user_id_2c513194_fk_auth_user_id` (`user_id`),
  CONSTRAINT `account_emailaddress_user_id_2c513194_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailaddress`
--

LOCK TABLES `account_emailaddress` WRITE;
/*!40000 ALTER TABLE `account_emailaddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_emailaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_emailconfirmation`
--

DROP TABLE IF EXISTS `account_emailconfirmation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_emailconfirmation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_address_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` (`email_address_id`),
  CONSTRAINT `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailconfirmation`
--

LOCK TABLES `account_emailconfirmation` WRITE;
/*!40000 ALTER TABLE `account_emailconfirmation` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_emailconfirmation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
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
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add affiliation',1,'add_affiliation'),(2,'Can change affiliation',1,'change_affiliation'),(3,'Can delete affiliation',1,'delete_affiliation'),(4,'Can view affiliation',1,'view_affiliation'),(5,'Can add marathon',2,'add_marathon'),(6,'Can change marathon',2,'change_marathon'),(7,'Can delete marathon',2,'delete_marathon'),(8,'Can view marathon',2,'view_marathon'),(9,'Can add marathon booking category',3,'add_marathonbookingcategory'),(10,'Can change marathon booking category',3,'change_marathonbookingcategory'),(11,'Can delete marathon booking category',3,'delete_marathonbookingcategory'),(12,'Can view marathon booking category',3,'view_marathonbookingcategory'),(13,'Can add marathon category',4,'add_marathoncategory'),(14,'Can change marathon category',4,'change_marathoncategory'),(15,'Can delete marathon category',4,'delete_marathoncategory'),(16,'Can view marathon category',4,'view_marathoncategory'),(17,'Can add marathon booking',5,'add_marathonbooking'),(18,'Can change marathon booking',5,'change_marathonbooking'),(19,'Can delete marathon booking',5,'delete_marathonbooking'),(20,'Can view marathon booking',5,'view_marathonbooking'),(21,'Can add itinerary',6,'add_itinerary'),(22,'Can change itinerary',6,'change_itinerary'),(23,'Can delete itinerary',6,'delete_itinerary'),(24,'Can view itinerary',6,'view_itinerary'),(25,'Can add faq',7,'add_faq'),(26,'Can change faq',7,'change_faq'),(27,'Can delete faq',7,'delete_faq'),(28,'Can view faq',7,'view_faq'),(29,'Can add gallery',8,'add_gallery'),(30,'Can change gallery',8,'change_gallery'),(31,'Can delete gallery',8,'delete_gallery'),(32,'Can view gallery',8,'view_gallery'),(33,'Can add gallery category',9,'add_gallerycategory'),(34,'Can change gallery category',9,'change_gallerycategory'),(35,'Can delete gallery category',9,'delete_gallerycategory'),(36,'Can view gallery category',9,'view_gallerycategory'),(37,'Can add image gallery',10,'add_imagegallery'),(38,'Can change image gallery',10,'change_imagegallery'),(39,'Can delete image gallery',10,'delete_imagegallery'),(40,'Can view image gallery',10,'view_imagegallery'),(41,'Can add slider',11,'add_slider'),(42,'Can change slider',11,'change_slider'),(43,'Can delete slider',11,'delete_slider'),(44,'Can view slider',11,'view_slider'),(45,'Can add testemonial',12,'add_testemonial'),(46,'Can change testemonial',12,'change_testemonial'),(47,'Can delete testemonial',12,'delete_testemonial'),(48,'Can view testemonial',12,'view_testemonial'),(49,'Can add timer',13,'add_timer'),(50,'Can change timer',13,'change_timer'),(51,'Can delete timer',13,'delete_timer'),(52,'Can view timer',13,'view_timer'),(53,'Can add log entry',14,'add_logentry'),(54,'Can change log entry',14,'change_logentry'),(55,'Can delete log entry',14,'delete_logentry'),(56,'Can view log entry',14,'view_logentry'),(57,'Can add permission',15,'add_permission'),(58,'Can change permission',15,'change_permission'),(59,'Can delete permission',15,'delete_permission'),(60,'Can view permission',15,'view_permission'),(61,'Can add group',16,'add_group'),(62,'Can change group',16,'change_group'),(63,'Can delete group',16,'delete_group'),(64,'Can view group',16,'view_group'),(65,'Can add user',17,'add_user'),(66,'Can change user',17,'change_user'),(67,'Can delete user',17,'delete_user'),(68,'Can view user',17,'view_user'),(69,'Can add content type',18,'add_contenttype'),(70,'Can change content type',18,'change_contenttype'),(71,'Can delete content type',18,'delete_contenttype'),(72,'Can view content type',18,'view_contenttype'),(73,'Can add session',19,'add_session'),(74,'Can change session',19,'change_session'),(75,'Can delete session',19,'delete_session'),(76,'Can view session',19,'view_session'),(77,'Can add site',20,'add_site'),(78,'Can change site',20,'change_site'),(79,'Can delete site',20,'delete_site'),(80,'Can view site',20,'view_site'),(81,'Can add email address',21,'add_emailaddress'),(82,'Can change email address',21,'change_emailaddress'),(83,'Can delete email address',21,'delete_emailaddress'),(84,'Can view email address',21,'view_emailaddress'),(85,'Can add email confirmation',22,'add_emailconfirmation'),(86,'Can change email confirmation',22,'change_emailconfirmation'),(87,'Can delete email confirmation',22,'delete_emailconfirmation'),(88,'Can view email confirmation',22,'view_emailconfirmation'),(89,'Can add social account',23,'add_socialaccount'),(90,'Can change social account',23,'change_socialaccount'),(91,'Can delete social account',23,'delete_socialaccount'),(92,'Can view social account',23,'view_socialaccount'),(93,'Can add social application',24,'add_socialapp'),(94,'Can change social application',24,'change_socialapp'),(95,'Can delete social application',24,'delete_socialapp'),(96,'Can view social application',24,'view_socialapp'),(97,'Can add social application token',25,'add_socialtoken'),(98,'Can change social application token',25,'change_socialtoken'),(99,'Can delete social application token',25,'delete_socialtoken'),(100,'Can view social application token',25,'view_socialtoken');
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
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$260000$jD6V52XjAHCi2bPvzdiX8L$eEGefZG73QLkHrN77S8mUwFRJmLj87qy5dvAaUA43DE=','2021-07-04 08:46:11.376476',1,'admin','','','a@g.com',1,1,'2021-07-04 08:45:03.617791');
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
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
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
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
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
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (21,'account','emailaddress'),(22,'account','emailconfirmation'),(14,'admin','logentry'),(16,'auth','group'),(15,'auth','permission'),(17,'auth','user'),(18,'contenttypes','contenttype'),(8,'gallery','gallery'),(9,'gallery','gallerycategory'),(10,'gallery','imagegallery'),(11,'home','slider'),(12,'home','testemonial'),(13,'home','timer'),(1,'marathon','affiliation'),(7,'marathon','faq'),(6,'marathon','itinerary'),(2,'marathon','marathon'),(5,'marathon','marathonbooking'),(3,'marathon','marathonbookingcategory'),(4,'marathon','marathoncategory'),(19,'sessions','session'),(20,'sites','site'),(23,'socialaccount','socialaccount'),(24,'socialaccount','socialapp'),(25,'socialaccount','socialtoken');
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
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-07-04 08:43:24.679656'),(2,'auth','0001_initial','2021-07-04 08:43:24.784958'),(3,'account','0001_initial','2021-07-04 08:43:24.831048'),(4,'account','0002_email_max_length','2021-07-04 08:43:24.840686'),(5,'admin','0001_initial','2021-07-04 08:43:24.879115'),(6,'admin','0002_logentry_remove_auto_add','2021-07-04 08:43:24.888213'),(7,'admin','0003_logentry_add_action_flag_choices','2021-07-04 08:43:24.900150'),(8,'contenttypes','0002_remove_content_type_name','2021-07-04 08:43:24.935611'),(9,'auth','0002_alter_permission_name_max_length','2021-07-04 08:43:24.961306'),(10,'auth','0003_alter_user_email_max_length','2021-07-04 08:43:24.974011'),(11,'auth','0004_alter_user_username_opts','2021-07-04 08:43:24.989875'),(12,'auth','0005_alter_user_last_login_null','2021-07-04 08:43:25.010345'),(13,'auth','0006_require_contenttypes_0002','2021-07-04 08:43:25.012575'),(14,'auth','0007_alter_validators_add_error_messages','2021-07-04 08:43:25.028152'),(15,'auth','0008_alter_user_username_max_length','2021-07-04 08:43:25.046788'),(16,'auth','0009_alter_user_last_name_max_length','2021-07-04 08:43:25.066619'),(17,'auth','0010_alter_group_name_max_length','2021-07-04 08:43:25.086081'),(18,'auth','0011_update_proxy_permissions','2021-07-04 08:43:25.101954'),(19,'auth','0012_alter_user_first_name_max_length','2021-07-04 08:43:25.117795'),(20,'gallery','0001_initial','2021-07-04 08:43:25.170714'),(21,'gallery','0002_auto_20210321_1424','2021-07-04 08:43:25.179361'),(22,'gallery','0003_auto_20210322_1413','2021-07-04 08:43:25.183026'),(23,'marathon','0001_initial','2021-07-04 08:43:25.318405'),(24,'home','0001_initial','2021-07-04 08:43:25.361140'),(25,'sessions','0001_initial','2021-07-04 08:43:25.370408'),(26,'sites','0001_initial','2021-07-04 08:43:25.379517'),(27,'sites','0002_alter_domain_unique','2021-07-04 08:43:25.387903'),(28,'socialaccount','0001_initial','2021-07-04 08:43:25.504176'),(29,'socialaccount','0002_token_max_lengths','2021-07-04 08:43:25.534042'),(30,'socialaccount','0003_extra_data_default_dict','2021-07-04 08:43:25.547368');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('lepv7tysnp9iingp8vay4nqtiet1af2d','.eJxVjDsOwjAQBe_iGln-rB2bkp4zROvdDQmgWIqTCnF3iJQC2jcz76V63Nax35os_cTqrKw6_W4F6SHzDviO861qqvO6TEXvij5o09fK8rwc7t_BiG381sE5C5nTUAzakBPYLolxEGNA7y1T7MQ7JknEMQK6ISRThDpAITBZvT-9YTdy:1lzxlT:Gg15YF_4vLILfXO_dpmQsqegi0eTVxxZg4ToPQbnTLk','2021-07-18 08:46:11.378069');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (2,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery_gallery`
--

DROP TABLE IF EXISTS `gallery_gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gallery_gallery` (
  `id` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `category_id` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gallery_gallery_category_id_47760de1_fk_gallery_g` (`category_id`),
  CONSTRAINT `gallery_gallery_category_id_47760de1_fk_gallery_g` FOREIGN KEY (`category_id`) REFERENCES `gallery_gallerycategory` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery_gallery`
--

LOCK TABLES `gallery_gallery` WRITE;
/*!40000 ALTER TABLE `gallery_gallery` DISABLE KEYS */;
/*!40000 ALTER TABLE `gallery_gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery_gallerycategory`
--

DROP TABLE IF EXISTS `gallery_gallerycategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gallery_gallerycategory` (
  `id` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery_gallerycategory`
--

LOCK TABLES `gallery_gallerycategory` WRITE;
/*!40000 ALTER TABLE `gallery_gallerycategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `gallery_gallerycategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery_imagegallery`
--

DROP TABLE IF EXISTS `gallery_imagegallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gallery_imagegallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gallery_id` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gallery_imagegallery_gallery_id_f0531d74_fk_gallery_gallery_id` (`gallery_id`),
  CONSTRAINT `gallery_imagegallery_gallery_id_f0531d74_fk_gallery_gallery_id` FOREIGN KEY (`gallery_id`) REFERENCES `gallery_gallery` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery_imagegallery`
--

LOCK TABLES `gallery_imagegallery` WRITE;
/*!40000 ALTER TABLE `gallery_imagegallery` DISABLE KEYS */;
/*!40000 ALTER TABLE `gallery_imagegallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_slider`
--

DROP TABLE IF EXISTS `home_slider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `home_slider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_order` int(11) NOT NULL,
  `link` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_slider`
--

LOCK TABLES `home_slider` WRITE;
/*!40000 ALTER TABLE `home_slider` DISABLE KEYS */;
/*!40000 ALTER TABLE `home_slider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_testemonial`
--

DROP TABLE IF EXISTS `home_testemonial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `home_testemonial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `testemonial_text` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_testemonial`
--

LOCK TABLES `home_testemonial` WRITE;
/*!40000 ALTER TABLE `home_testemonial` DISABLE KEYS */;
/*!40000 ALTER TABLE `home_testemonial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_timer`
--

DROP TABLE IF EXISTS `home_timer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `home_timer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_active` tinyint(1) NOT NULL,
  `marathon_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `home_timer_marathon_id_ec428f15_fk_marathon_marathon_id` (`marathon_id`),
  CONSTRAINT `home_timer_marathon_id_ec428f15_fk_marathon_marathon_id` FOREIGN KEY (`marathon_id`) REFERENCES `marathon_marathon` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_timer`
--

LOCK TABLES `home_timer` WRITE;
/*!40000 ALTER TABLE `home_timer` DISABLE KEYS */;
/*!40000 ALTER TABLE `home_timer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marathon_affiliation`
--

DROP TABLE IF EXISTS `marathon_affiliation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marathon_affiliation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marathon_affiliation`
--

LOCK TABLES `marathon_affiliation` WRITE;
/*!40000 ALTER TABLE `marathon_affiliation` DISABLE KEYS */;
/*!40000 ALTER TABLE `marathon_affiliation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marathon_faq`
--

DROP TABLE IF EXISTS `marathon_faq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marathon_faq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` varchar(600) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `marathon_faq_category_id_cddbf5ff_fk_marathon_` (`category_id`),
  CONSTRAINT `marathon_faq_category_id_cddbf5ff_fk_marathon_` FOREIGN KEY (`category_id`) REFERENCES `marathon_marathoncategory` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marathon_faq`
--

LOCK TABLES `marathon_faq` WRITE;
/*!40000 ALTER TABLE `marathon_faq` DISABLE KEYS */;
/*!40000 ALTER TABLE `marathon_faq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marathon_itinerary`
--

DROP TABLE IF EXISTS `marathon_itinerary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marathon_itinerary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `day` int(11) NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `marathon_itinerary_category_id_57cca534_fk_marathon_marathon_id` (`category_id`),
  CONSTRAINT `marathon_itinerary_category_id_57cca534_fk_marathon_marathon_id` FOREIGN KEY (`category_id`) REFERENCES `marathon_marathon` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marathon_itinerary`
--

LOCK TABLES `marathon_itinerary` WRITE;
/*!40000 ALTER TABLE `marathon_itinerary` DISABLE KEYS */;
/*!40000 ALTER TABLE `marathon_itinerary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marathon_marathon`
--

DROP TABLE IF EXISTS `marathon_marathon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marathon_marathon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `time` time(6) DEFAULT NULL,
  `tag` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `map_image` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `distance_start` int(11) NOT NULL,
  `distance_end` int(11) NOT NULL,
  `location` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `marathon_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `marathon_marathon_marathon_type_id_46135843_fk_marathon_` (`marathon_type_id`),
  KEY `marathon_marathon_slug_5da73b03` (`slug`),
  CONSTRAINT `marathon_marathon_marathon_type_id_46135843_fk_marathon_` FOREIGN KEY (`marathon_type_id`) REFERENCES `marathon_marathoncategory` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marathon_marathon`
--

LOCK TABLES `marathon_marathon` WRITE;
/*!40000 ALTER TABLE `marathon_marathon` DISABLE KEYS */;
/*!40000 ALTER TABLE `marathon_marathon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marathon_marathon_affiliation`
--

DROP TABLE IF EXISTS `marathon_marathon_affiliation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marathon_marathon_affiliation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `marathon_id` int(11) NOT NULL,
  `affiliation_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `marathon_marathon_affili_marathon_id_affiliation__60d90aee_uniq` (`marathon_id`,`affiliation_id`),
  KEY `marathon_marathon_af_affiliation_id_22a6fc96_fk_marathon_` (`affiliation_id`),
  CONSTRAINT `marathon_marathon_af_affiliation_id_22a6fc96_fk_marathon_` FOREIGN KEY (`affiliation_id`) REFERENCES `marathon_affiliation` (`id`),
  CONSTRAINT `marathon_marathon_af_marathon_id_6a82d861_fk_marathon_` FOREIGN KEY (`marathon_id`) REFERENCES `marathon_marathon` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marathon_marathon_affiliation`
--

LOCK TABLES `marathon_marathon_affiliation` WRITE;
/*!40000 ALTER TABLE `marathon_marathon_affiliation` DISABLE KEYS */;
/*!40000 ALTER TABLE `marathon_marathon_affiliation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marathon_marathonbooking`
--

DROP TABLE IF EXISTS `marathon_marathonbooking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marathon_marathonbooking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_first_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `person_last_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `person_email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `person_mobile_number` varchar(17) COLLATE utf8mb4_unicode_ci NOT NULL,
  `person_gender` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `person_birthdate` date DEFAULT NULL,
  `person_nationality` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `person_passport_no` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_street_address` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_address_l2` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_city` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_state` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_zip_code` int(11) NOT NULL,
  `address_country` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `arrival_date` date NOT NULL,
  `departure_date` date NOT NULL,
  `others_text` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visa_recommend` tinyint(1) NOT NULL,
  `agree_policy` tinyint(1) NOT NULL,
  `marathon_id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `marathon_marathonboo_marathon_id_be7c328a_fk_marathon_` (`marathon_id`),
  KEY `marathon_marathonboo_package_id_882f691c_fk_marathon_` (`package_id`),
  CONSTRAINT `marathon_marathonboo_marathon_id_be7c328a_fk_marathon_` FOREIGN KEY (`marathon_id`) REFERENCES `marathon_marathon` (`id`),
  CONSTRAINT `marathon_marathonboo_package_id_882f691c_fk_marathon_` FOREIGN KEY (`package_id`) REFERENCES `marathon_marathonbookingcategory` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marathon_marathonbooking`
--

LOCK TABLES `marathon_marathonbooking` WRITE;
/*!40000 ALTER TABLE `marathon_marathonbooking` DISABLE KEYS */;
/*!40000 ALTER TABLE `marathon_marathonbooking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marathon_marathonbookingcategory`
--

DROP TABLE IF EXISTS `marathon_marathonbookingcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marathon_marathonbookingcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marathon_marathonbookingcategory`
--

LOCK TABLES `marathon_marathonbookingcategory` WRITE;
/*!40000 ALTER TABLE `marathon_marathonbookingcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `marathon_marathonbookingcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marathon_marathoncategory`
--

DROP TABLE IF EXISTS `marathon_marathoncategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marathon_marathoncategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marathon_marathoncategory`
--

LOCK TABLES `marathon_marathoncategory` WRITE;
/*!40000 ALTER TABLE `marathon_marathoncategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `marathon_marathoncategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialaccount`
--

DROP TABLE IF EXISTS `socialaccount_socialaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialaccount_socialaccount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `extra_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialaccount_provider_uid_fc810c6e_uniq` (`provider`,`uid`),
  KEY `socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id` (`user_id`),
  CONSTRAINT `socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialaccount`
--

LOCK TABLES `socialaccount_socialaccount` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialaccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp`
--

DROP TABLE IF EXISTS `socialaccount_socialapp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialaccount_socialapp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp`
--

LOCK TABLES `socialaccount_socialapp` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialapp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp_sites`
--

DROP TABLE IF EXISTS `socialaccount_socialapp_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialaccount_socialapp_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `socialapp_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialapp_sites_socialapp_id_site_id_71a9a768_uniq` (`socialapp_id`,`site_id`),
  KEY `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` (`site_id`),
  CONSTRAINT `socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc` FOREIGN KEY (`socialapp_id`) REFERENCES `socialaccount_socialapp` (`id`),
  CONSTRAINT `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp_sites`
--

LOCK TABLES `socialaccount_socialapp_sites` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialtoken`
--

DROP TABLE IF EXISTS `socialaccount_socialtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialaccount_socialtoken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `token_secret` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq` (`app_id`,`account_id`),
  KEY `socialaccount_social_account_id_951f210e_fk_socialacc` (`account_id`),
  CONSTRAINT `socialaccount_social_account_id_951f210e_fk_socialacc` FOREIGN KEY (`account_id`) REFERENCES `socialaccount_socialaccount` (`id`),
  CONSTRAINT `socialaccount_social_app_id_636a42d7_fk_socialacc` FOREIGN KEY (`app_id`) REFERENCES `socialaccount_socialapp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialtoken`
--

LOCK TABLES `socialaccount_socialtoken` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialtoken` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-04 14:36:50
