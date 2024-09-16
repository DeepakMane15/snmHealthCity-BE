/*!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.4.2-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: snm_healthcity
-- ------------------------------------------------------
-- Server version	11.4.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `common_user_login`
--

DROP TABLE IF EXISTS `common_user_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_user_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(225) DEFAULT NULL,
  `last_name` varchar(225) DEFAULT NULL,
  `username` varchar(200) NOT NULL,
  `user_type` varchar(20) DEFAULT '',
  `password` varchar(150) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT 0,
  `cust_name` varchar(255) DEFAULT NULL,
  `user_screen` varchar(60) NOT NULL DEFAULT '',
  `user_screen_id` int(11) NOT NULL DEFAULT 0,
  `user_access` varchar(2) NOT NULL DEFAULT '1',
  `role` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `cell_number` varchar(50) DEFAULT NULL,
  `avatar` varchar(1000) DEFAULT NULL,
  `guest_address` varchar(1000) DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT 1,
  `force_password_change` int(11) NOT NULL DEFAULT 0,
  `email_consent` int(11) NOT NULL,
  `from_app` int(11) NOT NULL DEFAULT 0,
  `profile_completed` int(11) NOT NULL DEFAULT 1,
  `email_verified` int(11) NOT NULL DEFAULT 1,
  `otp` int(11) DEFAULT NULL,
  `unsubscribe_reason` varchar(256) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3045 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_user_login`
--

LOCK TABLES `common_user_login` WRITE;
/*!40000 ALTER TABLE `common_user_login` DISABLE KEYS */;
INSERT INTO `common_user_login` VALUES
(19,NULL,NULL,'amitkumar@cargo411.com','admin','8a342dd9f9c415bb070d8789a2c7fcc3',1,'teamedserv','customer',2,'0','',NULL,'1','0664130117ce3e7bf6f11a96ea8fb611.png',NULL,1,0,0,0,1,1,NULL,'Content not relevant','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(2637,NULL,NULL,'dev@santnirankarihealthcity.com','admin','369705c3bd7e108e716ba6e182d29993',1,'Sant Nirankari Health City','customer',1,'1','',NULL,NULL,'0664130117ce3e7bf6f11a96ea8fb611.png',NULL,1,0,0,0,1,1,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `common_user_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NOT NULL,
  `username` varchar(200) DEFAULT NULL,
  `user_type` varchar(20) DEFAULT NULL,
  `3pl_type` varchar(50) NOT NULL,
  `password` varchar(150) DEFAULT NULL,
  `company_name` varchar(255) NOT NULL,
  `company_id` varchar(20) NOT NULL,
  `branch` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip_code` bigint(20) DEFAULT NULL,
  `mailing_address` text NOT NULL,
  `mailing_city` varchar(255) DEFAULT NULL,
  `mailing_state` varchar(255) DEFAULT NULL,
  `mailing_zipcode` bigint(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_number` varchar(20) NOT NULL,
  `fax` varchar(20) NOT NULL,
  `website` varchar(255) NOT NULL,
  `time_zone` varchar(100) NOT NULL,
  `utc` varchar(10) DEFAULT NULL,
  `subscription_status` int(11) NOT NULL DEFAULT 0,
  `credit_limit` varchar(100) NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `payment_days` varchar(30) DEFAULT '',
  `payment_terms` text NOT NULL,
  `notes` text NOT NULL,
  `federal_id` varchar(50) NOT NULL,
  `api_code` int(11) DEFAULT NULL,
  `bar_code` varchar(100) DEFAULT NULL,
  `pcontact_name` varchar(50) NOT NULL,
  `pcontact_position` varchar(50) NOT NULL,
  `pcontact_phno` varchar(50) NOT NULL,
  `pcontact_email` varchar(50) NOT NULL,
  `acontact_name` varchar(50) NOT NULL,
  `acontact_phno` varchar(50) NOT NULL,
  `acontact_email` varchar(50) NOT NULL,
  `acontact_position` varchar(50) NOT NULL,
  `customer_quote_pref` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `permission` int(11) NOT NULL DEFAULT 1,
  `truck_board` int(11) NOT NULL DEFAULT 1,
  `show_shipment` int(11) NOT NULL DEFAULT 1,
  `show_warehouse` int(11) NOT NULL DEFAULT 1,
  `show_customer` int(11) NOT NULL DEFAULT 1,
  `show_carrier` int(11) NOT NULL DEFAULT 1,
  `reporting` int(4) NOT NULL DEFAULT 1,
  `accounting` int(4) NOT NULL DEFAULT 1,
  `dictionary` int(4) NOT NULL DEFAULT 1,
  `product` int(4) NOT NULL DEFAULT 1,
  `support` int(11) NOT NULL DEFAULT 1,
  `pin` varchar(10) NOT NULL,
  `password_changed` tinyint(4) NOT NULL DEFAULT 0,
  `logo` varchar(500) NOT NULL,
  `portal_status` int(4) DEFAULT 0,
  `date_format` int(2) NOT NULL,
  `cargo411_prefered` int(11) NOT NULL DEFAULT 0,
  `profile_image` varchar(255) NOT NULL,
  `customer_transaction` varchar(255) NOT NULL,
  `marine_board` int(5) NOT NULL DEFAULT 0,
  `plane_board` int(5) NOT NULL DEFAULT 0,
  `activestatus` varchar(1) NOT NULL DEFAULT 'N',
  `us_dot` varchar(60) DEFAULT NULL,
  `us_mc` varchar(60) DEFAULT NULL,
  `transaction_letter` varchar(20) NOT NULL DEFAULT '',
  `transaction_compid` varchar(20) NOT NULL DEFAULT '',
  `transaction_autoid` varchar(20) NOT NULL DEFAULT '',
  `updated_customer_transaction` varchar(255) NOT NULL,
  `mycarrier_truck` varchar(11) NOT NULL DEFAULT '',
  `cargo_truck` varchar(11) NOT NULL DEFAULT '',
  `view_shipment` varchar(11) NOT NULL DEFAULT '',
  `add_shipment` varchar(11) NOT NULL DEFAULT '',
  `control_favorite` varchar(11) NOT NULL DEFAULT '',
  `all_facilities` varchar(11) NOT NULL DEFAULT '',
  `add_facilities` varchar(11) NOT NULL DEFAULT '',
  `view_customer` varchar(11) NOT NULL DEFAULT '',
  `add_customer` varchar(11) NOT NULL DEFAULT '',
  `view_carrier` varchar(11) NOT NULL DEFAULT '',
  `add_carrier` varchar(11) NOT NULL DEFAULT '',
  `truckbd_mycarrier` varchar(11) NOT NULL DEFAULT '',
  `truckbd_cargocarrier` varchar(11) NOT NULL DEFAULT '',
  `description` varchar(1000) DEFAULT NULL,
  `services` varchar(1000) DEFAULT NULL,
  `banner` varchar(1000) DEFAULT NULL,
  `publish` int(11) NOT NULL DEFAULT 0,
  `rating` int(11) NOT NULL,
  `comment` int(11) NOT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=756 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES
(1,0,'john@mycargo.com','1','','KRCWfVa#','TeamedServ','13','','1201 Orange St #700, Wilmington, DE 19801, USA',NULL,NULL,NULL,'1201 Orange St #700, Wilmington, DE 19801, USA',NULL,NULL,NULL,'john@cargo411.com','(999) 999-9999','(123) 123-1231','','	\r\nPacific Daylight Time',NULL,1,'','','','','','213-123123',NULL,NULL,'John','','(123) 123-1212','john@mycargo.com','','','','customer','','2023-11-27 01:05:25',0,1,3,3,3,3,3,3,3,3,3,1,'',0,'',1,0,0,'','Abi-728-1001',0,0,'N',NULL,NULL,'','','','Abi-728-1001','','','3','3','3','3','3','3','3','3','3','','',NULL,NULL,NULL,0,0,0);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snm_driver`
--

DROP TABLE IF EXISTS `snm_driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snm_driver` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sewadar_code` varchar(100) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `dl_no` varchar(100) NOT NULL,
  `dl_exp_date` varchar(100) DEFAULT NULL,
  `dl_pic` varchar(1000) DEFAULT NULL,
  `phone` varchar(11) NOT NULL,
  `status` varchar(11) NOT NULL DEFAULT 'In',
  `is_active` int(11) NOT NULL DEFAULT 1,
  `department` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `emergency_no` varchar(20) NOT NULL,
  `emergency_name` varchar(100) NOT NULL,
  `insurance` int(11) NOT NULL DEFAULT 0,
  `insurance_date` varchar(225) DEFAULT NULL,
  `fuel_card_issued` int(11) NOT NULL DEFAULT 0,
  `fuel_card_no` varchar(100) DEFAULT NULL,
  `fuel_card_make` varchar(100) DEFAULT NULL,
  `cash_eligiblity` int(11) NOT NULL DEFAULT 0,
  `cash_limit` int(11) DEFAULT NULL,
  `type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snm_driver`
--

LOCK TABLES `snm_driver` WRITE;
/*!40000 ALTER TABLE `snm_driver` DISABLE KEYS */;
INSERT INTO `snm_driver` VALUES
(1,'SD000001','Amit Kumar','Kannaujiya','12321123321','',NULL,'312312312','In',1,'asd','1','1','1',1,'2024-05-25',0,'871878138978','Rupay',0,12221,'driver'),
(10,'SD000002','Aarav ','Sharma','DL23456789','',NULL,'8765432109','Out',1,'HR','123 Elm St, Springfield, IL	','998767898','Abhishek Sharma',1,'2024-05-25',0,'12219989739','Platinum',0,150000,'driver'),
(11,'SD000003','Aditi ','Patel','DL23456789','',NULL,'8765432109','In',1,'Marketing','34 Marine Drive, Mumbai, Maharashtra	','765432110','Priya Singh	',1,'2024-05-25',0,'86682189739','Platinum',0,150000,'driver'),
(12,'SD000004','Raj','Singh','DL34567890','',NULL,'7654321098','In',1,'Finance','78 Banjara Hills, Hyderabad, Telangana	','543210998','Rohan Iyer	',1,'2024-05-25',0,'866821897221439','Platinum',0,150000,'driver'),
(13,'SD000005','Ananya','Iyer','DL56789012','',NULL,'5432109876','In',1,'Sales','90 Residency Road, Chennai, Tamil Nadu	','543210998','Rohini Iyer	',1,'2024-05-25',0,'9668217221439','Visa',0,150000,'driver'),
(14,'SD000006','Nisha','Kumar','DL78901234','',NULL,'3210987654','In',1,'Operations','45 Civil Lines, Kanpur, Uttar Pradesh	','1210988765','Arjun Kumar	',1,'2024-05-25',0,'9668217221439','Visa',0,150000,'driver'),
(15,'SD000007','Arjun','Mehta','DL89012345','',NULL,'2109876543','In',1,'R&D	','67 Sector 21, Noida, Uttar Pradesh	','2109877654','Nisha Mehta	',1,'2024-05-25',0,'887997718397','Rupay',0,150000,'driver'),
(16,'SD000008','Kavya','Reddy','DL90123456','',NULL,'1098765432','In',1,'Customer Care	','89 Jubilee Hills, Hyderabad, Telangana	','1098766543','Vivek Reddy	',1,'2024-05-25',0,'668818668717','Rupay',0,150000,'driver'),
(17,'SD000009','Karan','Das','DL23456078','',NULL,'3987654209','In',1,'Procurement','56 New Market, Kolkata, West Bengal	','3987654232','Sneha Das	',1,'2024-05-25',0,'668818668717','Rupay',0,150000,'driver'),
(18,'SD000010','Neha','Chawla','DL56789001','',NULL,'6987654326','In',1,'IT','23 Bhandarkar Road, Pune, Maharashtra	','6987654322','Rahul Chawla	',1,'2024-05-25',0,'668818668717','Visa',0,150000,'driver');
/*!40000 ALTER TABLE `snm_driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snm_fuel_inward`
--

DROP TABLE IF EXISTS `snm_fuel_inward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snm_fuel_inward` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receipt_no` int(11) NOT NULL,
  `fuel_in_litre` varchar(100) NOT NULL,
  `rate` varchar(100) NOT NULL,
  `amount` varchar(100) NOT NULL,
  `received_by` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `amount_paid` int(11) NOT NULL,
  `refill_from` varchar(100) NOT NULL,
  `refill_to` varchar(100) NOT NULL,
  `transaction_type` varchar(100) NOT NULL,
  `is_refill_in` int(11) NOT NULL DEFAULT 0,
  `present_km` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snm_fuel_inward`
--

LOCK TABLES `snm_fuel_inward` WRITE;
/*!40000 ALTER TABLE `snm_fuel_inward` DISABLE KEYS */;
INSERT INTO `snm_fuel_inward` VALUES
(1,1990,'12','123','12312',1,'2024-05-16 16:09:30',12310,'Tanker','','Cash',0,0),
(2,123,'asd','asd','asd',0,'2024-05-19 05:17:17',123,'Tanker','','Cash',0,0),
(4,912,'19','98','981',0,'2024-05-19 10:41:24',98989,'Pump','2','Cheque',0,9897987),
(5,129,'30','106','3180',0,'2024-05-19 10:59:07',3100,'Pump','1','Fuel Card',0,3000),
(6,129,'30','106','3180',0,'2024-05-19 11:00:19',3100,'Pump','1','Fuel Card',0,3000),
(7,1221,'123','1212','1212',0,'2024-05-19 11:01:23',121212,'Tanker','1','Cash',0,4000),
(8,21,'20','106','1000',0,'2024-05-23 15:01:00',990,'Tanker','77','Cash',0,313131);
/*!40000 ALTER TABLE `snm_fuel_inward` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snm_fuel_outward`
--

DROP TABLE IF EXISTS `snm_fuel_outward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snm_fuel_outward` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fuel_in_litre` varchar(100) NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  `rate` varchar(100) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `driver_id` int(11) NOT NULL,
  `km` varchar(1000) NOT NULL,
  `mode` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snm_fuel_outward`
--

LOCK TABLES `snm_fuel_outward` WRITE;
/*!40000 ALTER TABLE `snm_fuel_outward` DISABLE KEYS */;
/*!40000 ALTER TABLE `snm_fuel_outward` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snm_petrocard`
--

DROP TABLE IF EXISTS `snm_petrocard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snm_petrocard` (
  `id` int(11) NOT NULL,
  `card_number` int(11) NOT NULL,
  `card_make` varchar(100) NOT NULL,
  `expiry_date` date NOT NULL,
  `issued_to` int(11) NOT NULL,
  `issued_date` date NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snm_petrocard`
--

LOCK TABLES `snm_petrocard` WRITE;
/*!40000 ALTER TABLE `snm_petrocard` DISABLE KEYS */;
/*!40000 ALTER TABLE `snm_petrocard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snm_pollution`
--

DROP TABLE IF EXISTS `snm_pollution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snm_pollution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(100) NOT NULL,
  `vehicle` int(11) NOT NULL,
  `amount` varchar(1000) NOT NULL,
  `valid_till` varchar(100) NOT NULL,
  `tenure` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snm_pollution`
--

LOCK TABLES `snm_pollution` WRITE;
/*!40000 ALTER TABLE `snm_pollution` DISABLE KEYS */;
INSERT INTO `snm_pollution` VALUES
(1,'',1,'1000','25-05-2024',0),
(2,'',1,'1200','05-19-2024',12),
(3,'',1,'12001','05-22-2024',6),
(4,'',173,'100','05-24-2024',12),
(5,'Insurance',173,'100','05-25-2024',3);
/*!40000 ALTER TABLE `snm_pollution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snm_prerequest`
--

DROP TABLE IF EXISTS `snm_prerequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snm_prerequest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `pickup` varchar(1000) NOT NULL,
  `destination` varchar(1000) NOT NULL,
  `date` varchar(100) DEFAULT NULL,
  `phone` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL DEFAULT 'pending',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snm_prerequest`
--

LOCK TABLES `snm_prerequest` WRITE;
/*!40000 ALTER TABLE `snm_prerequest` DISABLE KEYS */;
INSERT INTO `snm_prerequest` VALUES
(1,'Driver','Delhi','Mumbai','2024-05-17','','pending','2024-05-17 10:37:04'),
(2,'Amit Kumar Kannaujiya','Haryana','Mumbai',NULL,'','pending','2024-05-19 10:11:26'),
(3,'Deepak','Delhi','Mumbai','0000-00-00','','complete','2024-05-21 10:09:39'),
(4,'asd','asd','asd','05-07-2024','','unapproved','2024-05-21 10:10:55'),
(5,'Airport pickup','Mumbai Airport','Chembur','05-14-2024','1212121212','unapproved','2024-05-21 14:27:35'),
(6,'Avinash Garg','Delhi','SNM Complex','05-25-2024','8510005224','pending','2024-05-25 06:54:55'),
(7,'Vivek','Gurgaon, Sector 84','Sant Nirankari Administrative Block','09-09-2024','9871879636','pending','2024-09-08 12:39:31');
/*!40000 ALTER TABLE `snm_prerequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snm_spareparts`
--

DROP TABLE IF EXISTS `snm_spareparts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snm_spareparts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `part` varchar(1000) NOT NULL,
  `desc` varchar(1000) NOT NULL,
  `vehicle` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snm_spareparts`
--

LOCK TABLES `snm_spareparts` WRITE;
/*!40000 ALTER TABLE `snm_spareparts` DISABLE KEYS */;
INSERT INTO `snm_spareparts` VALUES
(1,'Engine','Replaced engine',1,0,'2024-05-17'),
(2,'as','asd',0,0,'0000-00-00'),
(3,'asd','asdd',2,0,'0000-00-00'),
(4,'Engine','Engine',0,1500,'0000-00-00'),
(5,'Engine','Engine replaced',0,1500,'0000-00-00'),
(6,'Horn','Horn replaced',0,1212,'0000-00-00'),
(7,'asd','as',1,12,'0000-00-00');
/*!40000 ALTER TABLE `snm_spareparts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snm_transaction`
--

DROP TABLE IF EXISTS `snm_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snm_transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(100) NOT NULL,
  `amount` varchar(1000) NOT NULL,
  `issued_to` int(11) NOT NULL,
  `issued_by` int(11) NOT NULL,
  `reason` varchar(1000) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `received_from` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snm_transaction`
--

LOCK TABLES `snm_transaction` WRITE;
/*!40000 ALTER TABLE `snm_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `snm_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snm_vehicle_average`
--

DROP TABLE IF EXISTS `snm_vehicle_average`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snm_vehicle_average` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` int(11) NOT NULL,
  `reading` varchar(1000) NOT NULL,
  `total_fuel` varchar(1000) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snm_vehicle_average`
--

LOCK TABLES `snm_vehicle_average` WRITE;
/*!40000 ALTER TABLE `snm_vehicle_average` DISABLE KEYS */;
INSERT INTO `snm_vehicle_average` VALUES
(1,1,'7000','153'),
(2,2,'1000','10'),
(3,77,'313131','20'),
(4,174,'1000','0');
/*!40000 ALTER TABLE `snm_vehicle_average` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snm_vehicle_inout`
--

DROP TABLE IF EXISTS `snm_vehicle_inout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snm_vehicle_inout` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle_id` int(11) NOT NULL,
  `driver_id` int(11) NOT NULL,
  `request` int(11) NOT NULL,
  `type` varchar(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `time` time NOT NULL,
  `km` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snm_vehicle_inout`
--

LOCK TABLES `snm_vehicle_inout` WRITE;
/*!40000 ALTER TABLE `snm_vehicle_inout` DISABLE KEYS */;
INSERT INTO `snm_vehicle_inout` VALUES
(1,1,1,0,'Out','2024-05-21 12:19:37','01:36:25','1234'),
(2,2,2,0,'Out','2024-05-21 12:19:37','11:10:00','1212'),
(3,2,2,0,'In','2024-05-21 12:19:37','11:10:00','1212312'),
(4,2,2,0,'Out','2024-05-21 12:19:37','12:10:00','1000'),
(5,2,2,0,'In','2024-05-21 12:19:37','11:10:00','1000'),
(6,2,2,0,'In','2024-05-21 12:19:37','11:10:00','1000'),
(7,1,2,2,'In','2024-05-21 12:19:37','11:19:00','1500'),
(8,1,2,1,'Out','2024-05-21 12:19:37','11:10:00','1212'),
(9,1,1,4,'In','2024-05-21 12:42:34','00:00:00','1219'),
(10,1,10,2,'Out','2024-05-21 13:07:00','00:00:00','1300'),
(11,1,1,3,'In','2024-05-21 13:07:41','00:00:00','1301'),
(12,1,16,4,'In','2024-05-23 13:29:08','00:00:00','1234'),
(13,174,18,0,'Out','2024-05-23 15:09:01','00:00:00','1000');
/*!40000 ALTER TABLE `snm_vehicle_inout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle`
--

DROP TABLE IF EXISTS `vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chassis_no` varchar(25) NOT NULL,
  `registeration_no` varchar(25) NOT NULL,
  `engine_no` varchar(25) DEFAULT NULL,
  `manufacturing_date` varchar(100) DEFAULT NULL,
  `sitting_capacity` int(11) DEFAULT NULL,
  `vehicle_class` varchar(25) DEFAULT NULL,
  `model_name` varchar(25) DEFAULT NULL,
  `vehicle_make` varchar(256) DEFAULT NULL,
  `purchase_date` varchar(100) DEFAULT NULL,
  `registeration_date` varchar(100) DEFAULT NULL,
  `fuel_type` varchar(25) DEFAULT NULL,
  `color` varchar(25) DEFAULT NULL,
  `status` varchar(11) DEFAULT 'in',
  `available` int(11) DEFAULT 1,
  `cylinder` int(11) DEFAULT 0,
  `registeration_validity` varchar(100) DEFAULT NULL,
  `remark` varchar(150) DEFAULT NULL,
  `present_km` double DEFAULT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=327 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle`
--

LOCK TABLES `vehicle` WRITE;
/*!40000 ALTER TABLE `vehicle` DISABLE KEYS */;
INSERT INTO `vehicle` VALUES
(1,'79118','HR-51BA-4578','64201','Jun-2014',7,'NA','Bolero','Mahindra & Mah.','30-06-2014','30-06-2014','Diesel','NA','In',1,0,'16-06-2029','NA',0,1),
(2,'MA1NA2XZXP6B41065','HR-85G-1342','XZP6A18744','Feb-2023',7,'NA','Bolero Neo-8','Mahindra & Mah.','20-03-2023','20-03-2023','Diesel','NA','In',1,0,'19-03-2038','NA',0,1),
(3,'ESG89712','HR-51BB-4096','E4G59208','Aug-2014',7,'NA','Bolero','Mahindra & Mah.','28-10-2014','28-10-2014','Diesel','NA','In',1,0,'29-09-2029','NA',0,1),
(4,'MA1NA2XZXN6H95654','HR-85F-7664','XZN6H64131','Aug-2022',7,'NA','Bolero','Mahindra & Mah.','03-10-2022','03-10-2022','Diesel','NA','In',1,0,'06-10-2037','NA',0,1),
(5,'MA1XK2WJXH5G37675','HP-48A-6912','WJH6G53908','Jul-2017',7,'NA','Bolero','Mahindra & Mah.','28-09-2017','28-09-2017','Diesel','NA','In',1,0,'27-09-2032','NA',0,1),
(6,'ME4JC449JA8014257','HP-38B-6810','JC44E08901179','Sep-2010',2,'NA','Activa','Honda ','20-09-2010','20-09-2010','Petrol','NA','In',1,0,'19-09-2025','NA',0,1),
(7,'MA1NA2XZXP6J88722','HR-85G-1158','XZP6J85295','Oct 2023',7,'NA','Bolero Neo-8','Mahindra & Mah.','18-10-2023','18-10-2023','Diesel','NA','In',1,0,'17-10-2038','NA',0,1),
(8,'MA1NA2XZXP6J88722','HR-85G-1158','XZP6J85295','Aug-2023',7,'NA','Bolero Neo-8','Mahindra & Mah.','18-10-2023','18-10-2023','Diesel','NA','In',1,0,'17-10-2038','NA',0,1),
(9,'MAIXM2WJXK5452029','HR-51BY-8025','WJK6H56116','Aug-2019',7,'NA','Bolero','Mahindra & Mah.','04-10-2019','04-10-2019','Diesel','NA','In',1,0,'03-10-2034','NA',0,1),
(10,'61335','HR-24C-0076','79207','Jun-2015',7,'NA','Bolero','Mahindra & Mah.','08-07-2015','08-07-2015','Diesel','NA','In',1,0,'26-06-2030','NA',0,1),
(11,'MBLHA10EZA9K00755','HR-05AB- 5106','HA10EFA9K00968','Nov-2010',2,'NA','Motor cycle','Hero Honda Motor Ltd.','29-11-2010','29-11-2010','Petrol','NA','In',1,0,'28-11-2025','NA',0,1),
(12,'MA7AM20DDKU008464','PB-02BH-7080','3HNCK025497','Apr-2010',5,'NA','Ambassador','Hindustan Motors','26-04-2010','26-04-2010','Diesel','NA','In',1,0,'25-04-2025','NA',0,1),
(13,'MA1NA2SMXH6A40208','DL-8CAQ-0501','SMH6A14257','Jan-2017',7,'NA','Mahindra TUV 300','Mahindra & Mah.','21-02-2017','21-02-2017','Diesel','NA','In',1,0,'20-02-2027','NA',0,1),
(14,'MA1NA2XZXP6J98099','HR-85G-6605','XZP6J83681','Aug-2023',7,'NA','Bolero Neo-8','Mahindra & Mah.','18-10-2023','18-10-2023','Diesel','NA','In',1,0,'17-10-2038','NA',0,1),
(15,'MA1NA2SMXG6A37442','DL-8CAL-8598','SMG6A12137','Jan-2016',7,'NA','Mahindra TUV 300','Mahindra & Mah.','04-02-2016','04-02-2016','Diesel','NA','In',1,0,'11-02-2031','NA',0,1),
(16,'MA1XM2WJXG5L35258','HR-51BN-3798','WJG6L49069','Dec-2012',7,'NA','Bolero','Mahindra & Mah.','13-02-2017','13-02-2017','Diesel','NA','In',1,0,'23-01-2032','NA',0,1),
(17,'F5F4E81091','HR-26M-0049','GRF4E811091','Jun-2015',7,'NA','Bolero','Mahindra & Mah.','30-07-2015','30-07-2015','Diesel','NA','In',1,0,'26-06-2030','NA',0,1),
(18,'ME4JF49DBK8028598','DL-10SY-2807','JF49E8410047','Feb-2019',2,'NA','Activa','Honda','06-07-2019','06-07-2019','Diesel','NA','In',1,0,'05-07-2034','NA',0,1),
(19,'ME4JF507HH8122103','DL-12SK-8191','JF50E851220-83','Aug-2017',2,'NA','Activa','Honda','16-08-2017','16-08-2017','Petrol','NA','In',1,0,'15-08-2032','NA',0,1),
(20,'MC1M4BAA5RP30424','DD-03M-2812','D710452014','Jan-2024',13,'NA','Urbania Force (13)','Force Motor Ltd.','01-01-2024','01-01-2024','Diesel','NA','In',1,0,'01-01-2039','NA',0,1),
(21,'WBA27EN0XRY431399','DL-2FEH-0001','0015Y474','Jan-2024',7,'NA','B.M.W','B.M.W','01-01-2024','01-01-2024','Diesel','NA','In',1,0,'01-01-2039','NA',0,1),
(22,'MA1NA2XZP6A29266','DL-7CV-1921','XZP6A10225','Jan-2023',7,'NA','Bolero Neo-8','Mahindra & Mah.','01-04-2023','01-04-2023','Diesel','NA','In',1,0,'31-03-2033','NA',0,1),
(23,'MBJ11JV4007554656-0915','HR-01AN-4977','2KDS595652','Sep-2015',8,'NA','Innova','Toyota Kiloskar Motor Ltd.','01-07-2016','01-07-2016','Diesel','NA','In',1,0,'27-05-2031','NA',0,1),
(24,'MBLHA11ENA9J17215','HR-10Q-5265','HA11ECA9J34409','Nov-2010',2,'NA','Motor cycle','Hero Honda Motor Ltd.','01-12-2010','01-12-2010','Petrol','NA','In',1,0,'07-11-2025','NA',0,1),
(25,'MA1TA4WR2J2C30391','DL-8CAT-8327','WRJ4B22028','Mar-2018',7,'NA','Scorpio','Mahindra & Mah.','02-04-2018','02-04-2018','Diesel','NA','In',1,0,'01-04-2033','NA',0,1),
(26,'00794917-0219','HR-26G-0040','290867','Feb-2019',7,'NA','Innova','Mahindra & Mah.','02-04-2019','02-04-2019','Diesel','NA','In',1,0,'01-04-2034','NA',0,1),
(27,'MAT460082JUJ05659','UP-81DT-0507','DICOR27JRYJI9402','Oct-2019',2,'NA','Ambulance','Tata Motor Ltd.','03-02-2021','03-02-2021','Diesel','NA','In',1,0,'02-02-2023','NA',0,1),
(28,'MBLHAW051KHL73173','HR-10AJ-8971','HA10AGKHLF1168','Nov-2019',2,'NA','Motor cycle','Hero Honda Motor Ltd.','03-03-2020','03-03-2020','Petrol','NA','In',1,0,'02-03-2035','NA',0,1),
(29,'QYCA61617009898','HR-42A-0692','47140SGN2907','Mar-2006',1,'NA','Tractor','Soraj.','03-05-2006','03-05-2006','Diesel','NA','In',1,0,'01-03-2021','NA',0,1),
(30,'MA7AM20DJNU02073','HR-70E-2218 ','3HNGN027935','Oct-2013',5,'NA','Ambassador','Hindustan Motors','03-12-2013','03-12-2013','Diesel','NA','In',1,0,'05-11-2028','NA',0,1),
(31,'ME4JF495MH8157644','DL-10SU-7260','JF49E82267078','Dec-2017',2,'NA','Activa','Hero Honda Motor Ltd.','04-01-2018','04-01-2018','Petrol','NA','In',1,0,'03-01-2033','NA',0,1),
(32,'MA3DND62SRB758991','DL-10CX-1834','K15CN9445274','Feb-2024',7,'NA','Toyota Rumion','Toyota Kiloskar Motor Ltd.','04-03-2024','04-03-2024','CNG','NA','In',1,0,'05-03-2039','NA',0,1),
(33,'MA3DND62SRB758626','DL-10CX-1874','K15CN9444756','Feb-2024',7,'NA','Toyota Rumion','Toyota Kiloskar Motor Ltd.','04-03-2024','04-03-2024','CNG','NA','In',1,0,'05-03-2039','NA',0,1),
(34,'MA3DND62SRB757643','DL-10CX-1896','K15CN9443266','Feb-2024',7,'NA','Toyota Rumion','Toyota Kiloskar Motor Ltd.','04-03-2024','04-03-2024','CNG','NA','In',1,0,'05-03-2039','NA',0,1),
(35,'MA3DND62SRB758764','DL-10CX-1830','K15CN9444891','Feb-2024',7,'NA','Toyota Rumion','Toyota Kiloskar Motor Ltd.','04-03-2024','04-03-2024','CNG','NA','In',1,0,'05-03-2039','NA',0,1),
(36,'C070916','HR-85G-8994','VEDX*356209*K6*P','Mar-2021',6,'NA','Generator Van','Mahindra & Mah.','04-09-2023','04-09-2023','Diesel','NA','In',1,0,'03-09-2038','NA',0,1),
(37,'MA1NA2XZXP6E8906','HR-85G-6321','XZP6E53770','May-2023',7,'NA','Bolero Neo-8','Mahindra & Mah.','04-09-2023','04-09-2023','Diesel','NA','In',1,0,'03-09-2038','NA',0,1),
(38,'MA1TA2HFNA2M27669','DL-3CBU-4848','HFA4M46064','Dec-2010',7,'NA','Scorpio','Mahindra & Mah.','04-1-2011','04-1-2011','Diesel','NA','In',1,0,'03-01-2026','NA',0,1),
(39,'MAT453552DBE16581','HR-38S-9161','497TC92EW827229','May-2013',8,'NA','Generator Van','Tata Motor Ltd.','04-10-2013','04-10-2013','Diesel','NA','In',1,0,'30-05-2028','NA',0,1),
(40,'MC1EIBJA2AP000298','HR-38P-9258','D18028822','Nov-2009',10,'NA','Ambulance','Force Motor Ltd.','04-11-2009','04-11-2009','Diesel','NA','In',1,0,'07-07-2021','NA',0,1),
(41,'MC2CBMRC0PC088269','HR-38AF-2294','E426CDPC428391','Mar-2023',2,'NA','Tempo','Eicher.','05-02-2023','05-02-2023','Diesel','NA','In',1,0,'05-01-2025','NA',0,1),
(42,'MA1NA2VZXK6B36009','HR-26DX-4314','VZK6B19431','Feb-2019',7,'NA','Mahindra TUV T6+','Mahindra & Mah.','05-04-2019','05-04-2019','Diesel','NA','In',1,0,'04-04-2034','NA',0,1),
(43,'31554','HR-26DX-9712','22397','Feb-2019',7,'NA','Bolero','Mahindra & Mah.','05-04-2019','05-04-2019','Diesel','NA','In',1,0,'04-04-2034','NA',0,1),
(44,'MA1TA2MXND2D49197','UK-07AW-6292','24780','Jun-2013',7,'NA','Scorpio','Mahindra & Mah.','05-06-2013','05-06-2013','Diesel','NA','In',1,0,'04-06-2028','NA',0,1),
(45,'MC1E4C3EP001350','HR-37E-2586','D-56003532','Apr-2014',21,'NA','Tempo Traveller','Force Motor Ltd.','05-08-2014','05-08-2014','Diesel','NA','In',1,0,'22-08-2024','NA',0,1),
(46,'MA1NA2XZXP6G97746','HR-85G-0850','XZP6F62977','Jul-2023',7,'NA','Bolero Neo-8','Mahindra & Mah.','05-09-2023','05-09-2023','Diesel','NA','In',1,0,'04-09-2038','NA',0,1),
(47,'HAR3DXSSA02518055','HR-51BL-8341','H00122688','Sep-2016',1,'NA','J.C.B ','J.C.B. India Ltd.','05-10-2016','05-10-2016','Diesel','NA','In',1,0,'15-09-2031','NA',0,1),
(48,'1PY5050DCGA021752','HR-02AK-9320','PY3029T243870','Jul-2016',1,'NA','Tractor','Johndeere Ind. Pvt. Ltd.','05-10-2016','05-10-2016','Diesel','NA','In',1,0,'25-08-2031','NA',0,1),
(49,'MA1FA2LCRF6E27936','DL-1LW-4101','LCF6E20934','Oct-2015',2,'NA','Maxmo vehicle','Mahindra & Mah.','05-11-2015','05-11-2015','CNG','NA','In',1,0,'22-09-2024','NA',0,1),
(50,'5739','DL-1PD-2529','827032','Aug-2016',37,'NA','Bus','Tata Motor Ltd.','05-11-2016','05-11-2016','Diesel','NA','In',1,0,'25-11-2025','NA',0,1),
(51,'ME4JF501AD8038961','DL-8SBB-5799','JF50E80041072','Jan-2013',2,'NA','Activa','Honda ','06-02-2013','06-02-2013','Petrol','NA','In',1,0,'05-02-2028','NA',0,1),
(52,'MA1NA2XZXP6J90224','HR-85H-0399','XZP6J88501','Sep-2023',7,'NA','Bolero Neo-8','Mahindra & Mah.','06-02-2024','06-02-2024','Diesel','NA','In',1,0,'05-02-2039','NA',0,1),
(53,'MA1NA2XZXP6M87241','HR-85H-2867','ZXP6L19455','Dec-2023',7,'NA','Bolero Neo-8','Mahindra & Mah.','06-02-2024','06-02-2024','Diesel','NA','In',1,0,'05-02-2039','NA',0,1),
(54,'MA1NA2XZXP6K92307','HR-85H-4541','XZP6K97844','Dec-2023',7,'NA','Bolero Neo-8','Mahindra & Mah.','06-02-2024','06-02-2024','Diesel','NA','In',1,0,'05-02-2039','NA',0,1),
(55,'MA1NA2XZXP6K87210','HR-85H-8886','XZP6K92486','Oct-2023',7,'NA','Bolero Neo-8','Mahindra & Mah.','06-02-2024','06-02-2024','Diesel','NA','In',1,0,'05-02-2039','NA',0,1),
(56,'MA1NA2XZXP6K91524','HR-85H-5768','XZP6K94816','Sep-2023',7,'NA','Bolero Neo-8','Mahindra & Mah.','06-02-2024','06-02-2024','Diesel','NA','In',1,0,'05-02-2039','NA',0,1),
(57,'MA1NA2XZXP6M96943','HR-85H-8891','zxp6L19100','Dec-2023',7,'NA','Bolero Neo-8','Mahindra & Mah.','06-02-2024','06-02-2024','Diesel','NA','In',1,0,'05-02-2039','NA',0,1),
(58,'MZBMC81AMNN011156','HR-23C-0036','D4HBLH702728','Jun-2022',7,'NA','Kia Carnival','Kia India Pvt. Ltd.','06-07-2022','06-07-2022','Diesel','NA','In',1,0,'05-07-2037','NA',0,1),
(59,'483DLTC55JWY708850','UK-07PA-2024','MAT460124DUJ05272','Nov-2013',7,'NA','Ambulance','Mahindra & Mah.','06-11-2013','06-11-2013','Diesel','NA','In',1,0,'03-11-2024','NA',0,1),
(60,'MA1PL2GRKE5J49886','MH-42K-8765','GRE4H67225','Sep-2014',7,'NA','Bolero','Mahindra & Mah.','07-01-2015','07-01-2015','Diesel','NA','In',1,0,'06-01-2030','NA',0,1),
(61,'MBLHA11AEE9C51021','HR-10W-5822','HA11EFE9C48478','Mar-2014',2,'NA','Motor cycle','Hero Motor','07-04-2014','07-04-2014','Petrol','NA','In',1,0,'20-04-2029','NA',0,1),
(62,'MAT453542E8G17658','DL-1LT-8617','497TC92GVY823975','Jul-2014',3,'NA','Tempo','Tata Motor Ltd.','07-08-2014','07-08-2014','Diesel','NA','In',1,0,'06-08-2024','NA',0,1),
(63,'MBJ11JV4007546217-0815','DL-14CC-2396','2KDS574907','Aug-2015',7,'NA','Toyota Innova','Toyota Kiloskar Motor Ltd.','07-09-2015','07-09-2015','Diesel','NA','In',1,0,'15-09-2030','NA',0,1),
(64,'MBJAB3EM402531808-0819','HR-30B-0049','2GDA-355739','Aug-2019',7,'NA','Innova','Toyota Kiloskar Motor Ltd.','07-10-2019','07-10-2019','Diesel','NA','In',1,0,'06-10-2034','NA',0,1),
(65,'MC2CBMRC0PM101606','DL-1GE-3011','E426CCPM459838','Dec-2023',2,'NA','Tempo','Eicher.','08-02-2024','08-02-2024','CNG','NA','In',1,0,'07-02-2026','NA',0,1),
(66,'MAKJN253AR4203174','DL-1CAH-4170','L15ZD2023938','Jan-2024',5,'NA','Honda City','Honda','08-02-2024','08-02-2024','Petrol','NA','In',1,0,'07-02-2039','NA',0,1),
(67,'MC1E4CFA8LP059557','MP-09TB-0178','D71000529','Jun-2020',14,'NA','Tempo Traveller','Force Motor Ltd.','08-06-2022','08-06-2022','Diesel','NA','In',1,0,'07-06-2037','NA',0,1),
(68,'WFOHXXTTGHHP36062','HR-30R-5506','36062','Jan-2017',8,'NA','Ford Transit','Ford Transit.','08-09-2017','08-09-2017','Diesel','NA','In',1,0,'23-07-2032','NA',0,1),
(69,'MBJAB3EM402553565~0821','DL-1CAE-6353','2GDA540282','Aug-2021',7,'NA','Innova','Toyota Kiloskar Motor Ltd.','08-09-2021','08-09-2021','Diesel','NA','In',1,0,'07-09-2031','NA',0,1),
(70,'MA1ZU2TBKJ1E43876','DL-1LAB-5153','TBJ1E52677','Apr-2018',2,'NA','Pick up','Mahindra & Mah.','08-11-2018','08-11-2018','Diesel','NA','In',1,0,'11-11-2024','NA',0,1),
(71,'MD626CG51M3K34686','HR-59E-0140','CG5KM3808947','Sep-2021',2,'NA','Activa','TVS Motors Co. Ltd.','08-11-2021','08-11-2021','Petrol','NA','In',1,0,'07-11-2036','NA',0,1),
(72,'T2249396','HR-42B-7683','E2249734','Jul-2012',1,'NA','Tractor','Escorts Ltd.','09-01-2013','09-01-2013','Diesel','NA','In',1,0,'23-07-2027','NA',0,1),
(73,'MBJJB8EMX01535610','HR-26DM-0114','2GDA171790','Feb-2018',7,'NA','Toyota Innova','Toyota Kiloskar Motor Ltd.','09-03-2018','09-03-2018','Diesel','NA','In',1,0,'08-03-2033','NA',0,1),
(74,'MAT505420J0E05674','DL-1LAB-0187','3.8SG172DRY814378','Apr-2018',3,'NA','Tempo (Water)','Tata Motor Ltd.','09-08-2018','09-08-2018','CNG','NA','In',1,0,'09-08-2024','NA',0,1),
(75,'MAIPL2GKHA5L-91259','WB-42Q-6590','GHA4L60951','Dec-2025',7,'NA','Bolero','Mahindra & Mah.','09-12-2010','09-12-2010','Diesel','NA','In',1,0,'07-12-2025','NA',0,1),
(76,'M3GTGS864KB800562','HR-51BZ-7678','TE9324','Aug-2019',5,'NA','Isuzu','Isuzu Motor Ind. Pvt. Ltd.','09-12-2019','09-12-2019','Diesel','NA','In',1,0,'08-12-2034','NA',0,1),
(77,'MBNAAANBBKJG03745','HR-02AT-6737','NKF2MRE0026','Oct-2019',1,'NA','Tractor','Mahindra & Mah.','10-01-2020','10-01-2020','Diesel','NA','In',1,0,'09-01-2035','NA',0,1),
(78,'MA1NA2SMXG6D46506','DL-8CAN-3910','SMG6D21463','Apr-2016',7,'NA','Mahindra TUV','Mahindra & Mah.','10-06-2016','10-06-2016','Diesel','NA','In',1,0,'13-07-2031','NA',0,1),
(79,'MA1NA2SMXH6G46746','DL-8CAS-1909','SMH6G52204','Jul-2017',7,'NA','Mahindra TUV','Mahindra & Mah.','10-10-2017','10-10-2017','Diesel','NA','In',1,0,'09-10-2032','NA',0,1),
(80,'MA1NA2SMXH6G46240','DL-8CAS-1941','SMH6G51134','Jul-2017',7,'NA','Mahindra TUV','Mahindra & Mah.','10-10-2017','10-10-2017','Diesel','NA','In',1,0,'09-10-2032','NA',0,1),
(81,'MA1NA2SMXH6G46817','DL-8CAS-1976','SMH6G52272','Jul-2017',7,'NA','Mahindra TUV','Mahindra & Mah.','10-10-2017','10-10-2017','Diesel','NA','In',1,0,'09-10-2032','NA',0,1),
(82,'CIC27519','MP-41CA-2087','CIC19234','Dec-2012',7,'NA','Utility Pick up','Mahindra & Mah.','11-01-2012','11-01-2012','Diesel','NA','In',1,0,'31-10-2027','NA',0,1),
(83,'MAKCP262HDN400326','DL-9CU-5758','K24Z25980509','Aug-2013',5,'NA','Honda Accord ','Honda ','11-09-2013','11-09-2013','Petrol','NA','In',1,0,'10-09-2028','NA',0,1),
(84,'25210','DL-7CQ-9253','20002','Feb-2019',7,'NA','Scorpio','Mahindra & Mah.','12-03-2019','12-03-2019','Diesel','NA','In',1,0,'11-03-2034','NA',0,1),
(85,'MA1TA2XM2N2B28812','HR-09D-0085','XMN4B17230','Feb-2022',7,'NA','Scorpio','Mahindra & Mah.','12-05-2022','12-05-2022','Diesel','NA','In',1,0,'11-05-2037','NA',0,1),
(86,'MA3FJEB1S00799203','DL-8CAH-6154','D13A-2653561','Aug-2015',5,'NA','Maruti Swift Dzire','Maruti Suzuki','12-08-2015','12-08-2015','Diesel','NA','In',1,0,'11-08-2023','NA',0,1),
(87,'MAT460127HUV02474','UK-07PA-3609','2.2LDICOR11HSYJ14126','Aug-2017',9,'NA','Ambulance','Mahindra & Mah.','12-10-2017','12-10-2017','Diesel','NA','In',1,0,'27-10-2025','NA',0,1),
(88,'MC1M4AAA3RP88870','HR-85H-8672','D71044784','Mar-2024',18,'NA','Urbania Force (17)','Force Motor Ltd.','13-03-2024','13-03-2024','Diesel','NA','In',1,0,'12-03-2039','NA',0,1),
(89,'MC1E4DJA0JP031262','HR-38X-7204','D67008517','Sep-2017',18,'NA','Tempo Traveller','Force Motor Ltd.','13-12-2017','13-12-2017','Diesel','NA','In',1,0,'24-11-2025','NA',0,1),
(90,'MAT386554A8B05845','HR-38Q-3688','497TC94BZY808143','Jun-2010',3,'NA','Fire Tender Vehicle','Tata Motor Ltd.','14-06-2010','14-06-2010','Diesel','NA','In',1,0,'13-10-2024','NA',0,1),
(91,'MA1XB2GBK92E88536','HR-26AX-2698','GB94E26315','Jul-2009',7,'NA','Bolero','Mahindra & Mah.','14-07-2009','14-07-2009','Diesel','NA','In',1,0,'30-09-2024','NA',0,1),
(92,'404059521','UP-26AM-7701','IVD-133502','Aug-2011',7,'NA','Land Cruiser','Toyota Kiloskar Motor Ltd.','14-10-2011','14-10-2011','Diesel','NA','In',1,0,'13-10-2026','NA',0,1),
(93,'MA1WG2GHKC5G43632','UK-07AT-1356','GHC4G75523','Oct-2015',9,'NA','Bolero','Mahindra & Mah.','14-10-2015','14-10-2015','Diesel','NA','In',1,0,'28-01-2025','NA',0,1),
(94,'32636','DL-8CAL-7935','24097','Sep-2016',7,'NA','Scorpio','Mahindra & Mah.','14-10-2016','14-10-2016','Diesel','NA','In',1,0,'13-10-2026','NA',0,1),
(95,'ME4JF49MGMD068897','DL-6SBG-7484','JF49ED4105912','Jul-2021',2,'NA','Activa','Honda ','14-10-2021','14-10-2021','Petrol','NA','In',1,0,'13-10-2036','NA',0,1),
(96,'MA1NA2XZXP6K92156','HR-85G-8459','XZP6K97195','Oct-2023',7,'NA','Bolero Neo-8','Mahindra & Mah.','15-01-2024','15-01-2024','Diesel','NA','In',1,0,'14-01-2039','NA',0,1),
(97,'MA1NA2XZXP6L87138','HR-85G-4449','XZP6K10493','Nov-2023',7,'NA','Bolero Neo-8','Mahindra & Mah.','15-01-2024','15-01-2024','Diesel','NA','In',1,0,'14-01-2039','NA',0,1),
(98,'MA1NA2XZXP6K92375','HR-85G-0483','XZP6K97522','Oct-2023',7,'NA','Bolero Neo-8','Mahindra & Mah.','15-01-2024','15-01-2024','Diesel','NA','In',1,0,'14-01-2039','NA',0,1),
(99,'MA1XM2XKXN5B26301','HR-85F-6252','XKM6A10299','Feb-2022',7,'NA','Bolero','Mahindra & Mah.','15-06-2022','15-06-2022','Diesel','NA','In',1,0,'14-06-2037','NA',0,1),
(100,'M3GTGR876MB300046','HR-98E-6301','VM6751','Jun-2022',5,'NA','Isuzu','Isuzu Motor Ind. Pvt. Ltd.','15-06-2022','15-06-2022','Diesel','NA','In',1,0,'14-06-2037','NA',0,1),
(101,'MBJB7YHK106003181~0523','DL-1CAH-6022','A25B1175971','May-2023',5,'NA','Toyota Camry','Toyota Kiloskar Motor Ltd.','15-06-2023','15-06-2023','Petrol','NA','In',1,0,'14-06-2038','NA',0,1),
(102,'MC2ESLRCONK215963','HR-38AD-9624','E426CDNK411135','Oct-2022',3,'NA','Tempo','Escorts Ltd.','15-11-2022','15-11-2022','Diesel','NA','In',1,0,'14-11-2024','NA',0,1),
(103,'MC1E4DLA3CP005268','UK-07AN-8668','D560007544','Nov-2011',15,'NA','Tempo Traveller','Force Motor Ltd.','15-12-2022','15-12-2022','Diesel','NA','In',1,0,'14-02-2027','NA',0,1),
(104,'MAINA2SMXH6A400015','HR-51BN-2206','SMH6A13889','Jan-2017',7,'NA','Mahindra TUV 300','Mahindra & Mah.','16-03-2017','16-03-2017','Diesel','NA','In',1,0,'16-03-2032','NA',0,1),
(105,'M3GTGR876NB800257','HR-98J-8547','AAE908','Aug-2022',5,'NA','Isuzu','Isuzu Motor Ind. Pvt. Ltd.','16-03-2023','16-03-2023','Diesel','NA','In',1,0,'15-03-2038','NA',0,1),
(106,'ME4JF507HH8122203','DL-12SK-8179','JF50E851218-32','Aug-2017',2,'NA','Activa','Honda','16-08-2017','16-08-2017','Petrol','NA','In',1,0,'15-08-2032','NA',0,1),
(107,'MA1PL2GRKD5F724498','HR-85G-7577','GRD4E-81135','Sep-2013',7,'NA','Bolero','Mahindra & Mah.','16-09-2013','16-09-2013','Diesel','NA','In',1,0,'15-09-2028','NA',0,1),
(108,'MA1PL2GRKD5G83309','DL-1CQ-2150','GRD4F84200','Sep-2013',7,'NA','Bolero','Mahindra & Mah.','16-09-2013','16-09-2013','Diesel','NA','In',1,0,'15-09-2028','NA',0,1),
(109,'MA1PL2GRKD5G85320','HR-85G-5114','GRD4G77629','Sep-2013',7,'NA','Bolero','Mahindra & Mah.','16-09-2013','16-09-2013','Diesel','NA','In',1,0,'15-09-2028','NA',0,1),
(110,'MA1XM2WJXJ5J48376','HR-51BU-2050','WJJ6G64277','Sep-2018',7,'NA','Bolero','Mahindra & Mah.','16-10-2018','16-10-2018','Diesel','NA','In',1,0,'15-10-2033','NA',0,1),
(111,'MA1XM2WJXJ5F34805','HR-51BU-9094','WJJ6E54980','Sep-2018',7,'NA','Bolero','Mahindra & Mah.','16-10-2018','16-10-2018','Diesel','NA','In',1,0,'15-10-2033','NA',0,1),
(112,'MAT453552E7F10286','HR-38U-5121','497TC92FVY822339','Jun-2014',8,'NA','Generator Van','Tata Motor Ltd.','16-11-2015','16-11-2015','Diesel','NA','In',1,0,'23-07-2024','NA',0,1),
(113,'MAT460124FUK03966','UK-17-PA-0079','483DLTC55KUYJ14122','Oct-2015',8,'NA','Ambulance','Tata Motor Ltd.','16-12-2015','16-12-2015','Diesel','NA','In',1,0,'15-11-2024','NA',0,1),
(114,'MAT460124FUK03973','UK-17-PA-0078','483DL1C55KUYJ14120','Oct-2015',8,'NA','Ambulance','Tata Motor Ltd.','16-12-2015','16-12-2015','Diesel','NA','In',1,0,'15-11-2024','NA',0,1),
(115,'MAT453545E8F16821','DL-1LV-0835','497TC92FVY822819','Oct-2014',3,'NA','Tempo (Water)','Tata Motor Ltd.','17-10-2014','17-10-2014','Diesel','NA','In',1,0,'06-08-2024','NA',0,1),
(116,'MA1ZN2EPKH1G54478','DL-1LY-6908','EPH1G86888','Jul-2017',2,'NA','Pick up','Mahindra & Mah.','17-10-2017','17-10-2017','Diesel','NA','In',1,0,'06-12-2025','NA',0,1),
(117,'MA1TA2YS2N2H35609','HR-85F-4723','YSN4H66952','Aug-2022',7,'NA','Scorpio','Mahindra & Mah.','17-10-2022','17-10-2022','Diesel','NA','In',1,0,'16-10-2037','NA',0,1),
(118,'ME4JF507KHU645408','DL-10SU-4820','JF50EU5645443','Oct-2017',2,'NA','Activa','Hero Honda Motor Ltd.','17-11-2017','17-11-2017','Petrol','NA','In',1,0,'16-11-2032','NA',0,1),
(119,'M3GTFR54MB701329','HR-85E-6258','AAC161','Jul-2021',5,'NA','Isuzu','Isuzu Motor Ind. Pvt. Ltd.','17-11-2021','17-11-2021','Diesel','NA','In',1,0,'17-11-2036','NA',0,1),
(120,'MC1E4FKA8PP015636','HR-38AD-7697','D71022058','Oct-2022',26,'NA','Tempo Traveller','Force Motor Ltd.','17-11-2022','17-11-2022','Diesel','NA','In',1,0,'16-11-2024','NA',0,1),
(121,'MA11A2MXND2D45445','UP-26AR-1665','20406','May-2013',7,'NA','Scorpio','Mahindra & Mah.','18-05-2013','18-05-2013','Diesel','NA','In',1,0,'17-05-2028','NA',0,1),
(122,'MC1D4DEA1MP095076','HR-38AB-8890','D72003013','May-2021',7,'NA','Ambulance','Force Motor Ltd.','18-06-2021','18-06-2021','Diesel','NA','In',1,0,'05-07-2025','NA',0,1),
(123,'ME4JF507JH8149093','DL-10ST-8751','JF50E8514085','Sep-2017',2,'NA','Activa','Honda ','18-09-2017','18-09-2017','Petrol','NA','In',1,0,'17-09-2032','NA',0,1),
(124,'MA1NA2XZXP6J95103','HR-85G-6077','XZP6J83311','Aug-2023',7,'NA','Bolero Neo-8','Mahindra & Mah.','18-10-2023','18-10-2023','Diesel','NA','In',1,0,'17-10-2038','NA',0,1),
(125,'MA1NA2XZP6A35974','DL-7CV-1351','XZP6A14911','Jan-2023',7,'NA','Bolero Neo-8','Mahindra & Mah.','19-04-2023','19-04-2023','Diesel','NA','In',1,0,'18-04-2033','NA',0,1),
(126,'MAT460124DUJ05298','HR-45B-3459','483DLTC55JWY708796','Sep-2013',9,'NA','Ambulance','Tata Motor Ltd.','19-11-2013','19-11-2013','Diesel','NA','In',1,0,'18-12-2023','NA',0,1),
(127,'MAT460124DUJ05301','HR-45B-3361','483DLTC55JWY708992','Sep-2013',9,'NA','Ambulance','Tata Motor Ltd.','19-11-2013','19-11-2013','Diesel','NA','In',1,0,'18-12-2023','NA',0,1),
(128,'UJ05452','HR-38Y-6372','YI18397','Aug-2018',9,'NA','Ambulance','Tata Motor Ltd.','19-11-2018','19-11-2018','Diesel','NA','In',1,0,'11-11-2024','NA',0,1),
(129,'MA1NA2XZXP6B41073','HR-85G-2513','XZP6B19349','Feb-2023',7,'NA','Bolero Neo-8','Mahindra & Mah.','20-03-2023','20-03-2023','Diesel','NA','In',1,0,'19-03-2038','NA',0,1),
(130,'MA1NA2XZXP6B41015','HR-85G-5664','XZP6B19364','Feb-2023',7,'NA','Bolero Neo-8','Mahindra & Mah.','20-03-2023','20-03-2023','Diesel','NA','In',1,0,'19-03-2038','NA',0,1),
(131,'MA1NA2XZXP6B41035','HR-85G-1485','XZP6B19311','Feb-2023',7,'NA','Bolero Neo-8','Mahindra & Mah.','20-03-2023','20-03-2023','Diesel','NA','In',1,0,'19-03-2038','NA',0,1),
(132,'MA1NA2XZXP6B40926','HR-85G-4693','XZP6A18757','Feb-2023',7,'NA','Bolero Neo-8','Mahindra & Mah.','20-03-2023','20-03-2023','Diesel','NA','In',1,0,'19-03-2038','NA',0,1),
(133,'MA1NA2XZXP6B40936','HR-85G-4669','XZP6B19273','Feb-2023',7,'NA','Bolero Neo-8','Mahindra & Mah.','20-03-2023','20-03-2023','Diesel','NA','In',1,0,'19-03-2038','NA',0,1),
(134,'MA1NA2XZXP6B41069','HR-85G-6659','XZP6B19348','Feb-2023',7,'NA','Bolero Neo-8','Mahindra & Mah.','20-03-2023','20-03-2023','Diesel','NA','In',1,0,'19-03-2038','NA',0,1),
(135,'MA1ZU2TBKH1E45120','DL-1LY-7132','TBH1E60548','May-2017',2,'NA','Pick up','Mahindra & Mah.','20-10-2017','20-10-2017','CNG','NA','In',1,0,'29-10-2025','NA',0,1),
(136,'G6C42512','HR-51BJ-1437','16374','Mar-2016',7,'NA','Mahindra TUV 300','Mahindra & Mah.','21-04-2016','21-04-2016','Diesel','NA','In',1,0,'24-03-2031','NA',0,1),
(137,'G6C42511','HR-51BJ-1245','16362','Mar-2016',7,'NA','Mahindra TUV','Mahindra & Mah.','21-04-2016','21-04-2016','Diesel','NA','In',1,0,'24-03-2031','NA',0,1),
(138,'G6C42588','HR-51BJ-3436','16462','Mar-2016',7,'NA','Mahindra TUV 300','Mahindra & Mah.','21-04-2016','21-04-2016','Diesel','NA','In',1,0,'24-03-2031','NA',0,1),
(139,'MA1NA2XZXP6E89102','DL-2FAL-0048','XZP6E53777','May-2023',7,'NA','Bolero Neo-8','Mahindra & Mah.','21-06-2023','21-06-2023','Diesel','NA','In',1,0,'20-06-2033','NA',0,1),
(140,'3818','DL-8SAN-6970','18528','Aug-2008',2,'NA','Motor cycle','Hero Honda Motor Ltd.','21-08-2008','21-08-2008','Petrol','NA','In',1,0,'20-08-2023','NA',0,1),
(141,'ME4JF495CJ8188692','DL-10SW-2216','JF49E82318861','Mar-2018',2,'NA','Activa','Honda','21-08-2018','21-08-2018','Petrol','NA','In',1,0,'20-08-2033','NA',0,1),
(142,'MA1ZU2TNKN1G67110','HR-38AD-8305','TNN1G80278','Jul-2022',2,'NA','Pick up','Mahindra & Mah.','21-09-2022','21-09-2022','Diesel','NA','In',1,0,'20-09-2024','NA',0,1),
(143,'MC1E4CJA4JP047491','HR-73A-6185','D67008235','Jan-2017',13,'NA','Tempo Traveller','Force Motor Ltd.','22-01-2018','22-01-2018','Diesel','NA','In',1,0,'01-05-2025','NA',0,1),
(144,'MA1NA2SMXH6A40217','DL-8CAQ-0607','SMH6A13269','Jan-2017',7,'NA','Mahindra TUV 300','Mahindra & Mah.','22-02-2017','22-02-2017','Diesel','NA','In',1,0,'21-02-2027','NA',0,1),
(145,'MBJGB8EM1020595910119','HR-26DW-4282','2GDA283654','Jan-2019',7,'NA','Toyota Innova','Toyota Kiloskar Motor Ltd.','22-03-2019','22-03-2019','Diesel','NA','In',1,0,'21-03-2034','NA',0,1),
(146,'MAT455044F8B04329','DL-1LV-7216','497SPBJY605236','Mar-2015',3,'NA','Water Tank','Tata Motor Ltd.','22-04-2015','22-04-2015','Diesel','NA','In',1,0,'22-03-2025','NA',0,1),
(147,'MAT453131f8c06262','DL-1LV-7215','49TC96CUY809601','Mar-2015',3,'NA','Tempo','Tata Motor Ltd.','22-04-2015','22-04-2015','Diesel','NA','In',1,0,'22-03-2025','NA',0,1),
(148,'MC1E4DLA4EP012250','UK-08AF-5093','D56003057','May-2014',8,'NA','Tempo Traveller','Force Motor Ltd.','22-05-2014','22-05-2014','Diesel','NA','In',1,0,'04-07-2024','NA',0,1),
(149,'MA1NA2XZXP6E48111','HR-85G-4190','XZP6E45900','May-2023',7,'NA','Bolero Neo-8','Mahindra & Mah.','22-06-2023','22-06-2023','Diesel','NA','In',1,0,'21-06-2038','NA',0,1),
(150,'MA1NA2XZXP6E25099','HR-85G-6741','XZP6E48232','May-2023',7,'NA','Bolero Neo-8','Mahindra & Mah.','22-06-2023','22-06-2023','Diesel','NA','In',1,0,'21-06-2038','NA',0,1),
(151,'MAT-35720190J15081','DL-1LK-9546','497SPCNG72HQZ623614','Sep-2009',3,'NA','Tempo 407','Tata Motor Ltd.','22-09-2009','22-09-2009','CNG','NA','In',1,0,'30-06-2024','NA',0,1),
(152,'MAT35720190J15063','DL-1LK-9547','497SPCNG72HQZ623611','Sep-2009',3,'NA','Tempo 407','Tata Motor Ltd.','22-09-2009','22-09-2009','CNG','NA','In',1,0,'03-09-2023','NA',0,1),
(153,'JTMHV05JX041190120713','HR-85G-0111','1VD0217619','Oct-2013',7,'NA','Land Cruiser','Mahindra & Mah.','22-10-2013','22-10-2013','Diesel','NA','In',1,0,'21-10-2028','NA',0,1),
(154,'MA1TA2SJXF2A1249712497','DL-8CAK-3848','SJF4A10370','Feb-2015',7,'NA','Scorpio','Mahindra & Mah.','23-02-2015','23-02-2015','Diesel','NA','In',1,0,'22-02-2030','NA',0,1),
(155,'ME4JF505EG7162277','DL-8SBW-8856','JE50E73161514','May-2016',2,'NA','Activa','Honda ','23-06-2016','23-06-2016','Petrol','NA','In',1,0,'18-09-2031','NA',0,1),
(156,'ME4JF481JE8199067','DL-8SBS-2096','JF48E80199008','Sep-2014',2,'NA','Activa','Honda','23-09-2014','23-09-2014','Petrol','NA','In',1,0,'22-09-2029','NA',0,1),
(157,'HAR3DXSSA01883731','DL-1LW-2383','H00096487','Sep-2015',1,'NA','J.C.B ','J.C.B. India Ltd.','23-09-2015','23-09-2015','Diesel','NA','In',1,0,'18-08-2024','NA',0,1),
(158,'MAIPL2GHK92M-86086','DL-1CM-0908','GH946-65929','Dec-2009',7,'NA','Bolero','Mahindra & Mah.','23-12-2009','23-12-2009','Diesel','NA','In',1,0,'22-12-2024','NA',0,1),
(159,'5K15199','MP-09CA-5605 ','5K15198','Jan-2006',7,'NA','Ford Transit','Ford Transit.','24-06-2006','24-06-2006','Diesel','NA','In',1,0,'12-06-2027','NA',0,1),
(160,'MA1NA2XZXP6E89103','HR-23C-0035','XZP6E53806','Apr-2023',7,'NA','Bolero Neo-8','Mahindra & Mah.','24-07-2023','24-07-2023','Diesel','NA','In',1,0,'23-07-2038','NA',0,1),
(161,'MAINA25MXH6E40488','DL-8CAR-7435','SMH6E39532','May-2017',7,'NA','Mahindra TUV T6','Mahindra & Mah.','24-08-2017','24-08-2017','Diesel','NA','In',1,0,'23-08-2023','NA',0,1),
(162,'MAINA2SMXH6F43257','DL-8CAR-7485','SMH6F44959','Jun-2017',7,'NA','Mahindra TUV T6','Mahindra & Mah.','24-08-2017','24-08-2017','Diesel','NA','In',1,0,'23-08-2032','NA',0,1),
(163,'MAINA2SMXH6E40489','DL-8CAR-7440','SMH6E39501','May-2017',7,'NA','Mahindra TUV T6','Mahindra & Mah.','24-09-2017','24-09-2017','Diesel','NA','In',1,0,'23-08-2032','NA',0,1),
(164,'MAINA2SMXH6F42564','DL-8CAR-7421','SMH6F44200','Jun-2017',7,'NA','Mahindra TUV T6','Mahindra & Mah.','24-09-2017','24-09-2017','Diesel','NA','In',1,0,'23-08-2032','NA',0,1),
(165,'MCHJELDEOBPC01696','DL-1LN-8228','ADEO0345623','May-2011',2,'NA','Three Wheeler','J.S Auto Pvt. Ltd.','26-05-2011','26-05-2011','CNG','NA','In',1,0,'20-09-2023','NA',0,1),
(166,'MA3BNC62SPJ675026','DL-8CBG-0242','K15CN9326206','Sep-2023',7,'NA','Maruti Ertiga','Mahindra & Mah.','26-09-2023 ','26-09-2023 ','CNG','NA','In',1,0,'25-09-2038','NA',0,1),
(167,'MA3BNC62SPJ674781','DL-8CBG-0228','K15CN6326109','Sep-2023',7,'NA','Maruti Ertiga','Maruti Suzuki','26-09-2023 ','26-09-2023 ','CNG','NA','In',1,0,'25-09-2038','NA',0,1),
(168,'MAIPL2GRKD5G86876','HR-85G-9680','GRD4G78721','Oct-2013',7,'NA','Bolero','Mahindra & Mah.','26-10-2013','26-10-2013','Diesel','NA','In',1,0,'25-10-2028','NA',0,1),
(169,'MA1PL2GRKD5G85326','HR-85G-3606','GRD4G77934','Oct-2013',7,'NA','Bolero','Mahindra & Mah.','26-10-2013','26-10-2013','Diesel','NA','In',1,0,'25-10-2028','NA',0,1),
(170,'MAIPL2GRKDG86868','HR-85G-4137','GRD4G79038','Oct-2013',7,'NA','Bolero','Mahindra & Mah.','26-10-2013','26-10-2013','Diesel','NA','In',1,0,'25-10-2028','NA',0,1),
(171,'MA1PL2GBK92F90553','HR-26AX-3552','GB94F64604','Jul-2009',7,'NA','Bolero','Mahindra & Mah.','27-07-2009','27-07-2009','Diesel','NA','In',1,0,'30-09-2024','NA',0,1),
(172,'MBLHAR079HHH43564','HR-10AD-2120','HA10AGHHH44770','Aug-2017',2,'NA','Motor cycle','Hero Motor','27-10-2017','27-10-2017','Petrol','NA','In',1,0,'26-10-2032','NA',0,1),
(173,'MA1XG2GRKH2K68008','HR-38X-8332','GRH4K88831','Oct-2017',6,'NA','Ambulance','Mahindra & Mah.','27-11-2017','27-11-2017','Diesel','NA','In',1,0,'07-12-2025','NA',0,1),
(174,'MA1PL2GHKA389182','HR-05AB-7197','GHA4L62004','Dec-2010',7,'NA','Bolero','Mahindra & Mah.','27-12-2010','27-12-2010','Diesel','NA','In',1,0,'17-12-2025','NA',0,1),
(175,'MA1XB2GBK92A75341','DL-8CL-5680','GB94A260564','Jan-2009',7,'NA','Bolero','Mahindra & Mah.','28-02-2009','28-02-2009','Diesel','NA','In',1,0,'27-02-2024','NA',0,1),
(176,'MCHJCL0COAPM01927','DL-1LN-7348','A0L0411097','Mar-2011',2,'NA','Three Wheeler','J.S Auto Pvt. Ltd.','28-03-2011','28-03-2011','CNG','NA','In',1,0,'26-07-2024','NA',0,1),
(177,'MAT457104E7D05926','DL-1GC-2482','497TC92DVY812272','May-2024',3,'NA','Tempo','Tata Motor Ltd.','28-05-2024','28-05-2024','Diesel','NA','In',1,0,'27-05-2024','NA',0,1),
(178,'MAT457104E7d05745','DL-1GC-2481','497TC92DVY812689','May-2024',3,'NA','Tempo','Mahindra & Mah.','28-05-2024','28-05-2024','Diesel','NA','In',1,0,'27-05-2024','NA',0,1),
(179,'MAT457104d7d13057','DL-1GC-1143','497TC92DWY821188','Apr-2013',3,'NA','Tempo','Tata Motor Ltd.','29-05-2013','29-05-2013','Diesel','NA','In',1,0,'20-05-2023','NA',0,1),
(180,'MA1RU2GHKB3H45702','PB-08BW-9506','GHB1H78365','Aug-2011',5,'NA','Pick up','Mahindra & Mah.','29-09-2011','29-09-2011','Diesel','NA','In',1,0,'08-03-2022','NA',0,1),
(181,'MBLJF16EDAGK19913','HR-10Q-7031','JF16EBAGK24559','Apr-2010',2,'NA','Moped','Hero Honda Motor Ltd.','29-12-2010','29-12-2010','Petrol','NA','In',1,0,'03-11-2025','NA',0,1),
(182,'MEC091GECPP065141','HR-85G-6858','400929D0055098','Mar-2023',5,'NA','Generator Van','Bharat Benz','29-12-2023','29-12-2023','Diesel','NA','In',1,0,'28-12-2038','NA',0,1),
(183,'79346','HR-51BA-9072','64639','Jun-2014',7,'NA','Bolero','Mahindra & Mah.','30-06-2014','30-06-2014','Diesel','NA','In',1,0,'15-06-2029','NA',0,1),
(184,'ME4JF495AJ8163136','DL-10SU-9203','JF49E82276883','Jan-2018',2,'NA','Activa','Hero Honda Motor Ltd.','31-01-2018','31-01-2018','Petrol','NA','In',1,0,'30-01-2033','NA',0,1),
(185,'MBJJB8EM701620811~0422','HR-26G-0071','2GDA633543','Apr-2022',7,'NA','Innova','Toyota Kiloskar Motor Ltd.','31-05-2022','31-05-2022','Diesel','NA','In',1,0,'30-05-2037','NA',0,1),
(186,'MA1TA2XM2NC331696','HR-30G-0059','XMN4B19818','Mar-2022',7,'NA','Scorpio','Mahindra & Mah.','31-05-2022','31-05-2022','Diesel','NA','In',1,0,'30-05-2037','NA',0,1),
(187,'F2146625','HR-42A-7874','E-2249038','Jul-2009',1,'NA','Tractor','Escorts Ltd.','31-07-2009','31-07-2009','Diesel','NA','In',1,0,'01-07-2024','NA',0,1),
(188,'ME4JF495DJ8195750','DL-10SV-6692','JF49E82330489','Apr-2018',2,'NA','Activa','Honda ','14-05-2018','14-05-2018','Petrol','NA','In',1,0,'13-05-2033','NA',0,1),
(189,'MA1TJ2YJ2R6B68030','HR-85H-7855','YJR4B34940','Feb-2024',7,'NA','Scorpio','Mahindra & Mah.','05-04-2024','05-04-2024','Diesel','NA','In',1,0,'04-04-2039','NA',0,1),
(190,'ME4JF507HH8122260','DL-12SK-8149','JF50E85122248','Aug-2017',2,'NA','Activa','Honda','16-08-2017','16-08-2017','Petrol','NA','In',1,0,'15-08-2032','NA',0,1),
(191,'MAT505276J8E12957','DL-1LAB-0110','4SPCR11ERY628313','Apr-2018',3,'NA','Tempo (Water)','Tata Motor Ltd.','09-08-2018','09-08-2018','Diesel','NA','In',1,0,'12-08-2024','NA',0,1),
(192,'MA1PL2GRKC5M18937','HR-85F-4015 ','47883','Jan-2012',7,'NA','Bolero','Mahindra & Mah.','24-01-2013','24-01-2013','Diesel','NA','In',1,0,'23-01-2028','NA',0,1),
(193,'MA1YA2KJNB2E43391','DL-1CM-4719','KJB4E28748','May-2011',7,'NA','Xylo Eagle','Mahindra & Mah.','25-07-2011','25-07-2011','Diesel','NA','In',1,0,'24-07-2026','NA',0,1),
(194,'ME4JF495LH8148569','DL-10SU-7211','JF49E82250820','Nov-2017',2,'NA','Activa','Hero Honda Motor Ltd.','04-01-2018','04-01-2018','Petrol','NA','In',1,0,'03-01-2033','NA',0,1),
(195,'ME4JF495AJ8159920','DL-10SU-9392','JF49E82271092','Jan-2018',2,'NA','Activa','Hero Honda Motor Ltd.','31-01-2018','31-01-2018','Petrol','NA','In',1,0,'30-01-2033','NA',0,1),
(196,'MA1NA2SMXG6D46466','DL-8CAN-3935','SMG6D21455','Apr-2016',7,'NA','Mahindra TUV','Mahindra & Mah.','10-06-2016','10-06-2016','Diesel','NA','In',1,0,'13-07-2031','NA',0,1),
(197,'MA1NA2SMXG6D46526','DL-8CAN-3916','SMG6D21200','Apr-2016',7,'NA','Mahindra TUV','Mahindra & Mah.','10-06-2016','10-06-2016','Diesel','NA','In',1,0,'13-07-2031','NA',0,1),
(198,'61332','DL-8CAC-2775','80917','Jun-2015',7,'NA','Bolero','Mahindra & Mah.','22-06-2015','22-06-2015','Diesel','NA','In',1,0,'17-06-2030','NA',0,1),
(199,'MA1NA2SMXGA37232','PB-65AF-7135','SMG6A12029','Feb-2016',7,'NA','Mahindra TUV T8','Mahindra & Mah.','05-02-2016','05-02-2016','Diesel','NA','In',1,0,'04-02-2031','NA',0,1),
(200,'MA1NA2XZXP6J882014','HR-85G-3972','xzp6j84387','Aug-2023',7,'NA','Bolero Neo-8','Mahindra & Mah.','18-10-2023','18-10-2023','Diesel','NA','In',1,0,'17-10-2038','NA',0,1),
(201,'MA1NA2XZXP6G97779','HR-85G-6724','XZP6F62978','Jul-2023',7,'NA','Bolero Neo-8','Mahindra & Mah.','24-08-2023','24-08-2023','Diesel','NA','In',1,0,'23-08-2038','NA',0,1),
(202,'MA1TA2SJXF2G42665','DL-8CAM-6437','SJF4F24813','Jul-2015',7,'NA','Scorpio','Mahindra & Mah.','29-10-2015','29-10-2015','Diesel','NA','In',1,0,'22-11-2030','NA',0,1),
(203,'MA3FJEB1S00A75332','DL-8CAQ- 0749','75332','Feb-2017',5,'NA','Maruti Swift Dzire','Maruti Suzuki','23-02-2017','23-02-2017','Diesel','NA','In',1,0,'22-02-2027','NA',0,1),
(204,'28812','HR-25DX-2344','12558','Jan-2019',7,'NA','Mahindra TUV T6+','Mahindra & Mah.','05-04-2019','05-04-2019','Diesel','NA','In',1,0,'04-04-2034','NA',0,1),
(205,'F5F61334','HR-42D-0046','GRF4E79653','Jun-2015',7,'NA','Bolero','Mahindra & Mah.','30-06-2015','30-06-2015','Diesel','NA','In',1,0,'27-06-2030','NA',0,1),
(206,'E4F70137','HR-51BB-4609','ESF84796','Jun-2014',7,'NA','Bolero','Mahindra & Mah.','28-10-2014','28-10-2014','Diesel','NA','In',1,0,'29-09-2029','NA',0,1),
(207,'MAINA2SMXH6A40188','HR-51BN- 4247','SMH6A14095','Jan-2017',7,'NA','Mahindra TUV','Mahindra & Mah.','16-03-2017','16-03-2017','Diesel','NA','In',1,0,'16-03-2032','NA',0,1),
(208,'ESH91806','HR-51BB-1173','E4G80259','Aug-2014',7,'NA','Bolero','Mahindra & Mah.','28-10-2014','28-10-2014','Diesel','NA','In',1,0,'29-09-2029','NA',0,1),
(209,'MA1PL2GRkF5B32050','DL-8CAC-2522','GRE4M87897','Mar-2015',7,'NA','Bolero','Mahindra & Mah.','15-03-2015','15-03-2015','Diesel','NA','In',1,0,'22-03-2030','NA',0,1),
(210,'MA1NA2XZXP6K87531','HR-85H-5643','ZXP6K93870','Oct-2023',7,'NA','Bolero Neo-8','Mahindra & Mah.','06-02-2024','06-02-2024','Diesel','NA','In',1,0,'05-02-2039','NA',0,1),
(211,'MA1NA2XZXP6E48101','HR-85G-1865','XZP6D44958','May-2023',7,'NA','Bolero Neo-8','Mahindra & Mah.','22-06-2023','22-06-2023','Diesel','NA','In',1,0,'21-06-2038','NA',0,1),
(212,'MA1NA2XZXP6G97777','HR-85G-4131','XZP6F62953','Jul-2023',7,'NA','Bolero Neo-8','Mahindra & Mah.','24-08-2023','24-08-2023','Diesel','NA','In',1,0,'23-08-2038','NA',0,1),
(213,'MA1XM2WJXG2J66631','CG-07BE-5559','WJGSJ38221','Dec-2016',7,'NA','Bolero','Mahindra & Mah.','11-02-2017','11-02-2017','Diesel','NA','In',1,0,'10-02-2032','NA',0,1),
(214,'F5F61333','HR-24G-0096','GRF4E81815','Jun-2015',7,'NA','Bolero','Mahindra & Mah.','08-07-2015','08-07-2015','Diesel','NA','In',1,0,'26-06-2030','NA',0,1),
(215,'MA1XM2WJXK5E40442','HR-51BX-6153','WJK6D36198','Jul-2019',7,'NA','Bolero','Mahindra & Mah.','06-09-2019','06-09-2019','Diesel','NA','In',1,0,'05-09-2034','NA',0,1),
(216,'58806','DL-8CAC-2773','78583','May-2015',7,'NA','Bolero','Mahindra & Mah.','17-06-2015','17-06-2015','Diesel','NA','In',1,0,'15-06-2030','NA',0,1),
(217,'MA1NA2XZXN6H95771','HR-85F-3103','XXZN6H64260','Aug-2022',7,'NA','Bolero','Mahindra & Mah.','07-20-2022','07-20-2022','Diesel','NA','In',1,0,'06-10-2037','NA',0,1),
(218,'MA!XM2WJXH5E30533','GJ-01RX-9391','WJH6E39087','Jun-2017',7,'NA','Bolero','Mahindra & Mah.','27-06-2017','27-06-2017','Diesel','NA','In',1,0,'26-06-2032','NA',0,1),
(219,'MA1NA2XZXP6J95175','HR-85G-5745','ZP6J83376','Sep-2023',7,'NA','Bolero Neo-8','Mahindra & Mah.','18-10-2023','18-10-2023','Diesel','NA','In',1,0,'17-10-2038','NA',0,1),
(220,'36963','GJ-5JR-0485','78328','Jul-2016',7,'NA','Bolero','Mahindra & Mah.','24-10-2016','24-10-2016','Diesel','NA','In',1,0,'23-10-2031','NA',0,1),
(221,'MA1XM2XKXN5B26577','HR-85F-8272','XKN6A12268','Feb-2022',7,'NA','Bolero','Mahindra & Mah.','15-06-2022','15-06-2022','Diesel','NA','In',1,0,'14-06-2037','NA',0,1),
(222,'61474','HR-22F-0062','81819','Jun-2015',7,'NA','Bolero','Mahindra & Mah.','08-07-2015','08-07-2015','Diesel','NA','In',1,0,'26-06-2030','NA',0,1),
(223,'MAT460124AUK05793','MH-09BC-7534','483DLTC55KZY720181','Oct-2010',9,'NA','Ambulance','Tata Motor Ltd.','29-11-2010','29-11-2010','Diesel','NA','In',1,0,'10-11-2012','NA',0,1),
(224,'MA1XM2WJXJ5J48009','HR-51BU-0136','WJJ6J77801','Sep-2018',7,'NA','Bolero','Mahindra & Mah.','05-11-2018','05-11-2018','Diesel','NA','In',1,0,'04-11-2033','NA',0,1),
(225,'MA1ZP2TBGKG2E77441','MH-12MV-4400','TBG4E80664','May-2016',5,'NA','Pick up','Mahindra & Mah.','21-06-2016','21-06-2016','Diesel','NA','In',1,0,'30-06-2024','NA',0,1),
(226,'MA1NA2VZXJ6F43733','MH-48BF-1122','VZJ6E55085','Jun-2018',7,'NA','Mahindra TUV','Mahindra & Mah.','18-07-2018','18-07-2018','Diesel','NA','In',1,0,'17-07-2033','NA',0,1),
(227,'MA1XM2WJXH5A40134','DL-8CAP-9735','10107','Jan-2017',7,'NA','Bolero','Mahindra & Mah.','16-02-2017','16-02-2017','Diesel','NA','In',1,0,'15-02-2027','NA',0,1),
(228,'MA1NA2VZXJ6B44177','MH-03CS-6875','VZJ6B22594','Feb-2018',7,'NA','Mahindra TUV','Mahindra & Mah.','16-04-2018','16-04-2018','Diesel','NA','In',1,0,'15-04-2033','NA',0,1),
(229,'273545','MH-05AS-4090','1426907','Jun-2010',5,'NA','Maruti Swift','Maruti Suzuki','06-07-2010','06-07-2010','Diesel','NA','In',1,0,'05-07-2025','NA',0,1),
(230,'MC1E4CGA3NP065428','MH-02FG-7186','D71008755','Jul-2021',11,'NA','Ambulance','Force Motor Ltd.','20-04-2022','20-04-2022','Diesel','NA','In',1,0,'17-10-2038','NA',0,1),
(231,'E5G90920','KA-05MQ-3471','MA1PLGRKE5G90920','Sep-2014',7,'NA','Bolero','Mahindra & Mah.','22-09-2014','22-09-2014','Diesel','NA','In',1,0,'21-09-2029','NA',0,1),
(232,'H61555','TN-02BF-6690','H32162','Aug-2016',7,'NA','Bolero','Mahindra & Mah.','24-10-2016','24-10-2016','Diesel','NA','In',1,0,'23-10-2031','NA',0,1),
(233,'MA1XM2WJXH5A36025','TS-09ES-8000','WJG6M50967','Jan-2017',7,'NA','Bolero','Mahindra & Mah.','31-03-2017','31-03-2017','Diesel','NA','In',1,0,'30-03-2032','NA',0,1),
(234,'MA1XB2GBK82F40544','HR-26AU- 2193','GB84F47228','Nov-2008',7,'NA','Bolero','Mahindra & Mah.','21-11-2008','21-11-2008','Diesel','NA','In',1,0,'31-10-2023','NA',0,1),
(235,'MA1PS2GHK2L86683','OR-02BK-7300','GHA4L76054','Nov-2010',7,'NA','Bolero','Mahindra & Mah.','14-12-2010','14-12-2010','Diesel','NA','In',1,0,'21-12-2025','NA',0,1),
(236,'79342','HR-51BA-1020','63827','Jun-2014',7,'NA','Bolero','Mahindra & Mah.','30-06-2014','30-06-2014','Diesel','NA','In',1,0,'15-06-2029','NA',0,1),
(237,'MD622DC1772D14656','OR-14P-6794','0C2D72117947','Apr-2007',2,'NA','Scooty','TVS Motors Co. Ltd.','26-05-2007','26-05-2007','Petrol','NA','In',1,0,'25-05-2027','NA',0,1),
(238,'MA1XM2WJXJ6D44140','WB-02AM-8862','WJJ6D42221','Apr-2018',7,'NA','Bolero','Mahindra & Mah.','13-06-2018','13-06-2018','Diesel','NA','In',1,0,'12-06-2033','NA',0,1),
(239,'32068','HR-26DX-2850','21875','Feb-2019',7,'NA','Bolero','Mahindra & Mah.','05-04-2019','05-04-2019','Diesel','NA','In',1,0,'04-04-2034','NA',0,1),
(240,'MAT460124GUP04843','WB-19H-7273','19492','Dec-2012',10,'NA','Ambulance','Tata Motor Ltd.','04-04-2017','04-04-2017','Diesel','NA','In',1,0,'30-06-2024','NA',0,1),
(241,'MA1XM2WJXK5E40673','WB-42AT-7823','WJK6C32139','May-2019',7,'NA','Bolero','Mahindra & Mah.','21-08-2019','21-08-2019','Diesel','NA','In',1,0,'20-08-2034','NA',0,1),
(242,'MA1XM2WJXG5L35089','HR-51BN-8341','WJG6L48806','Dec-2016',7,'NA','Bolero','Mahindra & Mah.','13-02-2017','13-02-2017','Diesel','NA','In',1,0,'23-01-2032','NA',0,1),
(243,'MA1WY2GPKG2J62828','AS-03T-2666','GPG4J75452','Sep-2016',7,'NA','Bolero','Mahindra & Mah.','31-10-2016','31-10-2016','Diesel','NA','In',1,0,'28-10-2031','NA',0,1),
(244,'MA1XM2WJXG5L35102','HR-51BN-2866','WJG6L48784','Dec-2032',7,'NA','Bolero','Mahindra & Mah.','13-02-2017','13-02-2017','Diesel','NA','In',1,0,'23-01-2032','NA',0,1),
(245,'58808','DL-8CAC-2774','78562','May-2015',7,'NA','Bolero','Mahindra & Mah.','17-06-2015','17-06-2015','Diesel','NA','In',1,0,'15-06-2030','NA',0,1),
(246,'MA1XM2WJXH5A41127','DL-8CAP-9948','11283','Jan-2017',7,'NA','Bolero','Mahindra & Mah.','16-02-2017','16-02-2017','Diesel','NA','In',1,0,'16-02-2027','NA',0,1),
(247,'MA1NA2XZXP6J95052','HR-85G-6805','xzp6j81800','Aug-2023',7,'NA','Bolero Neo-8','Mahindra & Mah.','18-10-2023','18-10-2023','Diesel','NA','In',1,0,'17-10-2038','NA',0,1),
(248,'E2G86351','HR-51BB-5060','E4F71808','Aug-2014',7,'NA','Bolero','Mahindra & Mah.','28-10-2014','28-10-2014','Diesel','NA','In',1,0,'29-09-2029','NA',0,1),
(249,'E5E75148','HR-51BA-2538','E59532','Apr-2014',7,'NA','Bolero','Mahindra & Mah.','30-06-2014','30-06-2014','Diesel','NA','In',1,0,'16-06-2029','NA',0,1),
(250,'MAIXM2WJXK54-52183','HR-51BY-8351','WJK6H55543','Aug-2019',7,'NA','Bolero','Mahindra & Mah.','04-10-2019','04-10-2019','Diesel','NA','In',1,0,'03-10-2034','NA',0,1),
(251,'MA1TA2WLXH2C31523','UK-07BX-5797','WLH4C12712','Mar-2017',7,'NA','Scorpio','Mahindra & Mah.','08-06-2017','08-06-2017','Diesel','NA','In',1,0,'07-06-2032','NA',0,1),
(252,'MCLE4CC84FP033014','UK-07PA-2462','D63014513','Jul-2015',10,'NA','Ambulance','Force Motor Ltd.','05-07-2015','05-07-2015','Diesel','NA','In',1,0,'30-06-2024','NA',0,1),
(253,'ME4JK13CEPD014662','UK-07FM-9163','JK13ED7020967','May-2023',2,'NA','Scooty','Honda','12-07-2023','12-07-2023','Petrol','NA','In',1,0,'21-07-2038','NA',0,1),
(254,'MA1ZC4TNKN1F58902','UK-07CD-0870','TNN1F73439','Jun-2022',2,'NA','Utility Pick up','Mahindra & Mah.','21-07-2022','21-07-2022','Diesel','NA','In',1,0,'27-07-2037','NA',0,1),
(255,'ME4JF49MGMD065560','UK-07DY-5220','JF49ED4100753','Jul-2021',2,'NA','Activa','Honda ','23-07-2021','23-07-2021','Petrol','NA','In',1,0,'22-07-2036','NA',0,1),
(256,'MC1E4CHA5NP065543','UK-07PA-4705','D71008933','Aug-2021',11,'NA','Ambulance','Force Motor Ltd.','29-10-2021','29-10-2021','Diesel','NA','In',1,0,'01-01-2023','NA',0,1),
(257,'42869','DL-8CAC-2756','80350','Mar-2015',7,'NA','Bolero','Mahindra & Mah.','11-06-2015','11-06-2015','Diesel','NA','In',1,0,'09-06-2030','NA',0,1),
(258,'MAIXM2WJXK5H48687','HR-51BY-3057','WJK6G50943','Jul-2019',7,'NA','Bolero','Mahindra & Mah.','04-10-2019','04-10-2019','Diesel','NA','In',1,0,'03-10-2034','NA',0,1),
(259,'E4G79736','HR-51BB-7519','ESH91900','Jul-2014',7,'NA','Bolero','Mahindra & Mah.','28-10-2014','28-10-2014','Diesel','NA','In',1,0,'30-09-2029','NA',0,1),
(260,'61338','DL-2FGH-0777','81802','Jun-2015',7,'NA','Bolero','Mahindra & Mah.','25-06-2015','25-06-2015','Diesel','NA','In',1,0,'24-06-2030','NA',0,1),
(261,'MA1NA2SMXG6A37453','DL-8CAL-8578','SMG6A12185','Jan-2016',7,'NA','Mahindra TUV 300','Mahindra & Mah.','04-02-2016','04-02-2016','Diesel','NA','In',1,0,'11-02-2031','NA',0,1),
(262,'MA1NA2SMXH6G46765','DL-8CAS-1996','SMH6G52206','Jul-2017',7,'NA','Mahindra TUV','Mahindra & Mah.','10-10-2017','10-10-2017','Diesel','NA','In',1,0,'09-10-2032','NA',0,1),
(263,'04D5KA408664','UP-31H-5786','5KA408664','Aug-2004',2,'NA','Motor cycle','Yamaha Motors','18-08-2004','18-08-2004','Petrol','NA','In',1,0,'17-08-2019','NA',0,1),
(264,'MA1NA2SMXG6D46507','DL-8CAN-3929','SMG6D21466','Apr-2016',7,'NA','Mahindra TUV','Mahindra & Mah.','10-06-2016','10-06-2016','Diesel','NA','In',1,0,'13-07-2031','NA',0,1),
(265,'5832096','HR-26DX-4772','22817','Feb-2019',7,'NA','Bolero','Mahindra & Mah.','05-04-2019','05-04-2019','Diesel','NA','In',1,0,'04-04-2024','NA',0,1),
(266,'79345','HR-51BA-5831','64724','Jun-2014',7,'NA','Bolero','Mahindra & Mah.','30-06-2014','30-06-2014','Diesel','NA','In',1,0,'16-06-2029','NA',0,1),
(267,'MA1XM2WJXK5448644','HR-51BY-4464','WJK6G50044','Jul-2019',7,'NA','Bolero','Mahindra & Mah.','04-10-2019','04-10-2019','Diesel','NA','In',1,0,'03-10-2034','NA',0,1),
(268,'MA1NA2XZXP6J87399','HR-85G-0961','XZP6J84522','Aug-2023',7,'NA','Bolero Neo-8','Mahindra & Mah.','18-10-2023','18-10-2023','Diesel','NA','In',1,0,'17-10-2038','NA',0,1),
(269,'RZ828317','UP-62R-4229 ','RZ631830','Dec-2008',7,'NA','Ambulance','Tata Motor Ltd.','11-02-2009','11-02-2009','Diesel','NA','In',1,0,'30-06-2024','NA',0,1),
(270,'MA1NA2XZXP6B41208','UP-65EU-0153','XZP6B19327','Feb-2023',7,'NA','Bolero Neo-8','Mahindra & Mah.','31-03-2023','31-03-2023','Diesel','NA','In',1,0,'01-02-2038','NA',0,1),
(271,'MA1XM2WJXJ5E29161','UP-90R-7573','WJJ6D45661','May-2018',7,'NA','Bolero','Mahindra & Mah.','21-07-2018','21-07-2018','Diesel','NA','In',1,0,'20-07-2033','NA',0,1),
(272,'MA1NA2XZXP6H92538','HR-85G-4991','XZP6H7951','Aug-2023',7,'NA','Bolero Neo-8','Mahindra & Mah.','18-10-2023','18-10-2023','Diesel','NA','In',1,0,'17-10-2038','NA',0,1),
(273,'MA1NA2XZXP6E89105','HR-85G-5405','XZPE53779','May-2023',7,'NA','Bolero Neo-8','Mahindra & Mah.','04-09-2023','04-09-2023','Diesel','NA','In',1,0,'03-09-2038','NA',0,1),
(274,'MA1NA2SMXG6D46525','DL-8CAN-3968','SMG6D21458','Apr-2016',7,'NA','Mahindra TUV','Mahindra & Mah.','10-06-2016','10-06-2016','Diesel','NA','In',1,0,'13-07-2031','NA',0,1),
(275,'MA1PL2GRKF5C39005','DL-8CAC-2521','GRF4C77049','Mar-2015',7,'NA','Bolero','Mahindra & Mah.','15-03-2015','15-03-2015','Diesel','NA','In',1,0,'22-03-2030','NA',0,1),
(276,'MA1NA2XZXP6F97463','HR-85G-4763','XZP6F62555','Jun-2023',7,'NA','Bolero Neo-8','Mahindra & Mah.','05-09-2023','05-09-2023','Diesel','NA','In',1,0,'04-09-2038','NA',0,1),
(277,'MA1NA2XZXP6E48107','HR-85G-9627','XZP6E45971','May-2023',7,'NA','Bolero Neo-8','Mahindra & Mah.','22-06-2023','22-06-2023','Diesel','NA','In',1,0,'21-06-2038','NA',0,1),
(278,'MA1PL2GRF5C39003','DL-8CAC-2520','GRF4C77474','Mar-2015',7,'NA','Bolero','Mahindra & Mah.','25-03-2015','25-03-2015','Diesel','NA','In',1,0,'22-03-2030','NA',0,1),
(279,'MA1XM2WJXJ5j48199','HR-51BU-9939','WJJ6J79077','Sep-2018',7,'NA','Bolero','Mahindra & Mah.','16-10-2018','16-10-2018','Diesel','NA','In',1,0,'15-10-2033','NA',0,1),
(280,'MA1NA2XZXP6D46711','HR-85G-7923','XZP6D44065','May-2023',7,'NA','Bolero Neo-8','Mahindra & Mah.','22-06-2023','22-06-2023','Diesel','NA','In',1,0,'21-06-2038','NA',0,1),
(281,'MA1NA2XZX6E48099','HR-85G-1575','XZP6E45904','May-2023',7,'NA','Bolero Neo-8','Mahindra & Mah.','22-06-2023','22-06-2023','Diesel','NA','In',1,0,'21-06-2038','NA',0,1),
(282,'MA1NA2XZXP6G97912','HR-85G-0814','ZXP6F63157','Jul-2023',7,'NA','Bolero Neo-8','Mahindra & Mah.','05-09-2023','05-09-2023','Diesel','NA','In',1,0,'04-09-2038','NA',0,1),
(283,'MA1N2XZXP6E89104','HR-85G-4547','XZ{6E53774','May-2023',7,'NA','Bolero Neo-8','Mahindra & Mah.','04-09-2023','04-09-2023','Diesel','NA','In',1,0,'03-09-2038','NA',0,1),
(284,'J5E31490','MP-04CU-9288','WJJ6E50766','Jul 2033',7,'NA','Bolero','Mahindra & Mah.','09-07-2018','09-07-2018','Diesel','NA','In',1,0,'08-07-2033','NA',0,1),
(285,'MA1NA2XZXP6F89410','HR-85G-4984','xzp6E54100','May-2023',7,'NA','Bolero Neo-8','Mahindra & Mah.','14-09-2023','14-09-2023','Diesel','NA','In',1,0,'03-09-2038','NA',0,1),
(286,'MA1NA2XZXP6J88365','HR-85G-7052','XZP6J86230','Aug-2023',7,'NA','Bolero Neo-8','Mahindra & Mah.','18-10-2023','18-10-2023','Diesel','NA','In',1,0,'17-10-2038','NA',0,1),
(287,'MA1NA2XZXN6H95617','HR-85F-6672','XXZN6H64249','Aug-2022',7,'NA','Bolero','Mahindra & Mah.','03-10-2022','03-10-2022','Diesel','NA','In',1,0,'02-10-2037','NA',0,1),
(288,'MA1NA2XZXP6F89412','HR-85G-1542','xzp6c52692','Jun-2023',7,'NA','Bolero Neo-8','Mahindra & Mah.','04-09-2023','04-09-2023','Diesel','NA','In',1,0,'03-09-2038','NA',0,1),
(289,'Ma1xm2wjxh5l2108','HP-12J-7861','83086','Nov-2017',7,'NA','Bolero','Mahindra & Mah.','10-01-2018','10-01-2018','Diesel','NA','In',1,0,'09-01-2033','NA',0,1),
(290,'MA1NA2XZXN6H95750','HR-85F-4399','XZN6H64597','Aug-2022',7,'NA','Bolero','Mahindra & Mah.','07-10-2022','07-10-2022','Diesel','NA','In',1,0,'06-10-2037','NA',0,1),
(291,'29058','MH-42AX-5202','12841','Jan-2019',7,'NA','Mahindra TUV','Mahindra & Mah.','15-03-2019','15-03-2019','Diesel','NA','In',1,0,'14-03-2034','NA',0,1),
(292,'MA1PL2GRKE5J49397','MH-42K-8768','GRE4H66551','Sep-2014',7,'NA','Bolero','Mahindra & Mah.','06-01-2015','06-01-2015','Diesel','NA','In',1,0,'05-01-2030','NA',0,1),
(293,'MA1NA2VZXJ6A39401','MH-20EJ-5737','VZJ6A12167','Jan-2018',7,'NA','Mahindra TUV T6','Mahindra & Mah.','31-01-2018','31-01-2018','Diesel','NA','In',1,0,'30-01-2033','NA',0,1),
(294,'H6E40240','MH-18BC-1827','WJH6E39218','May-2017',7,'NA','Bolero','Mahindra & Mah.','14-07-2017','14-07-2017','Diesel','NA','In',1,0,'13-07-2032','NA',0,1),
(295,'MA1NA2SMXH6E39636','MH-33V-0238','SMH6E37747','May-2017',7,'NA','Mahindra TUV','Mahindra & Mah.','05-07-2017','05-07-2017','Diesel','NA','In',1,0,'04-07-2032','NA',0,1),
(296,'MA1XM2WJXJ5J48225','HR-51BU-7653','WJJ6J79581','Sep-2018',7,'NA','Bolero','Mahindra & Mah.','16-10-2018','16-10-2018','Diesel','NA','In',1,0,'15-10-2033','NA',0,1),
(297,'MA1NA2XZXR6C57779','KL-01DB-4974','XZR6C51403','Jan-2024',7,'NA','Bolero Neo-8','Mahindra & Mah.','01-01-2024','01-01-2024','Diesel','NA','In',1,0,'01-01-2039','NA',0,1),
(298,'MA1XM2WJXK5D39468','OD-14S-6916','WJK6C31637','Apr-2019',7,'NA','Bolero','Mahindra & Mah.','20-08-2019','20-08-2019','Diesel','NA','In',1,0,'19-07-2034','NA',0,1),
(299,'MA1NA2XZXP6F92057','HR-85G-2726','ZXP6F55730','Jun-2023',7,'NA','Bolero Neo-8','Mahindra & Mah.','04-09-2023','04-09-2023','Diesel','NA','In',1,0,'03-09-2038','NA',0,1),
(300,'MA1NA2XZXP6E89100','HR-85G-2463','ZXPE53800','May-2023',7,'NA','Bolero Neo-8','Mahindra & Mah.','14-09-2023','14-09-2023','Diesel','NA','In',1,0,'03-09-2038','NA',0,1),
(301,'MA1PL2GRK5G89712','HR-51BB-9929','GRE4G59208','Jul-2014',7,'NA','Bolero','Mahindra & Mah.','28-10-2014','28-10-2014','Diesel','NA','In',1,0,'29-09-2029','NA',0,1),
(302,'MA1NA2XZXP6H87434','HR-85G-1143','ZXP6H75929','Aug-2023',7,'NA','Bolero Neo-8','Mahindra & Mah.','18-10-2023','18-10-2023','Diesel','NA','In',1,0,'17-10-2038','NA',0,1),
(303,'61331','HR-25D-0032','80925','Jun-2015',7,'NA','Bolero','Mahindra & Mah.','08-07-2015','08-07-2015','Diesel','NA','In',1,0,'26-06-2030','NA',0,1),
(304,'D39462','UP-70EZ-6056','C30207','Apr-2019',7,'NA','Bolero','Mahindra & Mah.','20-08-2019','20-08-2019','Diesel','NA','In',1,0,'19-08-2034','NA',0,1),
(305,'826136','UP-70AT-7629','601704','Oct-2007',5,'NA','Ambulance','Tata Motor Ltd.','08-10-2012','08-10-2012','Diesel','NA','In',1,0,'21-11-2022','NA',0,1),
(306,'MBNWHBOUBMNH03668','UP-70GB-3833','NMH2WBE0205','Nov-2021',1,'NA','Tractor','Mahindra & Mah.','14-04-2022','14-04-2022','Diesel','NA','In',1,0,'13-04-2037','NA',0,1),
(307,'MA1PL2GRKE5J49394','MH-42K-8766','GRE4J55780','Sep-2014',7,'NA','Bolero','Mahindra & Mah.','06-01-2015','06-01-2015','Diesel','NA','In',1,0,'05-01-2030','NA',0,1),
(308,'MA1NA2SMXG6D46492','DL-8CAN-3997','SMG6D21398','Apr-2016',7,'NA','Mahindra TUV','Mahindra & Mah.','10-06-2016','10-06-2016','Diesel','NA','In',1,0,'13-07-2031','NA',0,1),
(309,'MA1TA2WR2J2A13831','TS-09EZ-0800','WRH4L15593','Jan-2018',7,'NA','Scorpio','Mahindra & Mah.','23-04-2018','23-04-2018','Diesel','NA','In',1,0,'22-04-2033','NA',0,1),
(310,'MA1NA2SMXH6F43593','MP-20CG-5542','SMH6F45704','Aug-2017',7,'NA','Mahindra TUV','Mahindra & Mah.','10-08-2017','10-08-2017','Diesel','NA','In',1,0,'09-08-2032','NA',0,1),
(311,'MA1XM2WJXJ5E29688','UP-62BL-1298','WJJ6E47582','May-2018',7,'NA','Bolero','Mahindra & Mah.','26-06-2018','26-06-2018','Diesel','NA','In',1,0,'25-06-2033','NA',0,1),
(312,'G6C42581','HR-51BJ-6589','16487','Mar-2016',7,'NA','Mahindra TUV','Mahindra & Mah.','21-04-2016','21-04-2016','Diesel','NA','In',1,0,'24-03-2031','NA',0,1),
(313,'MB1PAEFC3DESL6606','PB-10ES-8778','DSEZ203837','Dec-2013',41,'NA','Bus','Ashok Leyland','17-04-2015','17-04-2015','Diesel','NA','In',1,0,'30-06-2024','NA',0,1),
(314,'BUNO74443','MH-12FC-9884','N44-720064','Nov-2011',8,'NA','Ambulance','Tata Winger.','17-01-2012','17-01-2012','Diesel','NA','In',1,0,'23-03-2022','NA',0,1),
(315,'BUN-07446','MH-12FC-9885','N44-720081','Nov-2011',8,'NA','Ambulance','Tata Winger.','17-01-2012','17-01-2012','Diesel','NA','In',1,0,'25-02-2021','NA',0,1),
(316,'MA1XG2GRKH2K68016','UK-07PA-3638','GRH4K88829','Oct-2017',6,'NA','Ambulance','Mahindra & Mah.','16-11-2017','16-11-2017','Diesel','NA','In',1,0,'15-11-2025','NA',0,1),
(317,'MA1NA2VZXG6H44685','MH-12NJ-4400','VZGH31001','Aug-2016',7,'NA','Mahindra TUV','Mahindra & Mah.','30-09-2016','30-09-2016','Diesel','NA','In',1,0,'29-09-2031','NA',0,1),
(318,'MA3FJEB1S00799741','DL-8CAH-6153','D13A-2653452','Aug-2015',5,'NA','Maruti Swift Dzire','Maruti Suzuki','12-08-2015','12-08-2015','Diesel','NA','In',1,0,'10-08-2030','NA',0,1),
(319,'MA1XB2GBK92A75321','HR-26AW- 0942','GB94A26042','Apr-2009',7,'NA','Bolero','Mahindra & Mah.','15-04-2009','15-04-2009','Diesel','NA','In',1,0,'31-03-2024','NA',0,1),
(320,'MA1PL2GHKB5B66928','HR-05AC-2891','GHB4B29563','Mar-2011',7,'NA','Bolero','Mahindra & Mah.','21-03-2011','21-03-2011','Diesel','NA','In',1,0,'06-03-2026','NA',0,1),
(321,'MA1RC4GGAA1453953','HR-05AC-3284','GGA1464079','Dec-2010',7,'NA','Jeep','Mahindra & Mah.','28-03-2011','28-03-2011','Diesel','NA','In',1,0,'27-01-2026','NA',0,1),
(322,'MD2A14AZ0DRD17636','HR-05AJ-4392','JBZRDD38347','Jul-2013',2,'NA','Motor cycle','Bajaj Auto Ltd.','03-08-2013','03-08-2013','Petrol','NA','In',1,0,'22-07-2028','NA',0,1),
(323,'MA1PL2GRKD5G86870','HR-85G-9875','GRD4G79057','Oct-2013',7,'NA','Bolero','Mahindra & Mah.','26-10-2013','26-10-2013','Diesel','NA','In',1,0,'25-10-2028','NA',0,1),
(324,'MA1TJ4GTN6J99125','DL-3CCX-4848','YGN4J81756','Sep-2022',7,'NA','Scorpio','Mahindra & Mah.','31-10-2022','31-10-2022','Diesel','NA','In',1,0,'30-10-2032','NA',0,1),
(325,'MBLHA10EJ99J07764','HR-10P-3359','HA10EA-99J15659','Sep-2009',2,'NA','Motor cycle','Hero Honda Motor Ltd.','28-04-2010','28-04-2010','Petrol','NA','In',1,0,'24-09-2024','NA',0,1),
(326,'779','HR-05AK-7201','779','Dec-2013',1,'NA','Tractor','Mahindra & Mah.','10-02-2014','10-02-2014','Diesel','NA','In',1,0,'02-02-2024','NA',0,1);
/*!40000 ALTER TABLE `vehicle` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2024-09-16 21:43:51
