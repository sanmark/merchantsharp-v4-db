-- MySQL dump 10.13  Distrib 5.7.12, for Linux (x86_64)
--
-- Host: localhost    Database: msharp
-- ------------------------------------------------------
-- Server version	5.7.12-0ubuntu1.1

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
-- Table structure for table `bank`
--

DROP TABLE IF EXISTS `bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `created_by` (`created_by`),
  KEY `modified_by` (`modified_by`),
  CONSTRAINT `bank_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bank_ibfk_2` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank`
--

LOCK TABLES `bank` WRITE;
/*!40000 ALTER TABLE `bank` DISABLE KEYS */;
INSERT INTO `bank` VALUES (1,'NSB',1,'2014-02-04 11:32:37',1,'2014-02-04 11:32:37'),(2,'BOC',1,'2014-02-04 11:32:37',1,'2014-02-04 11:32:37'),(3,'HNB',1,'2014-02-04 11:32:37',1,'2014-02-04 11:32:37'),(4,'PBC',1,'2014-02-04 11:32:37',1,'2014-02-04 11:32:37'),(5,'NDB',1,'2014-02-04 11:32:37',1,'2014-02-04 11:32:37'),(6,'DFCC',1,'2014-02-04 11:32:37',1,'2014-02-04 11:32:37'),(7,'CBC',1,'2014-02-04 11:32:37',1,'2014-02-04 11:32:37'),(9,'Seylan',1,'2014-02-04 11:32:37',1,'2014-02-04 11:32:37'),(10,'SMIB',1,'2014-02-04 11:32:37',1,'2014-02-04 11:32:37'),(11,'COM',1,'2014-02-04 11:32:37',1,'2014-02-04 11:32:37'),(12,'PBL',1,'2014-02-04 11:32:37',1,'2014-02-04 11:32:37'),(14,'ICICI',1,'2014-02-04 11:32:37',1,'2014-02-04 11:32:37'),(15,'HSBC',1,'2014-02-04 11:32:37',1,'2014-02-04 11:32:37');
/*!40000 ALTER TABLE `bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buying_cash`
--

DROP TABLE IF EXISTS `buying_cash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buying_cash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `buying_invoice_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `amount` double(10,2) unsigned NOT NULL,
  `account_transfer` double(10,2) NOT NULL DEFAULT '0.00',
  `notes` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `buying_cash+buying_invoice_idx` (`buying_invoice_id`),
  KEY `created_by` (`created_by`),
  KEY `modified_by` (`modified_by`),
  CONSTRAINT `buying_cash_ibfk_1` FOREIGN KEY (`buying_invoice_id`) REFERENCES `buying_invoice` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `buying_cash_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `buying_cash_ibfk_3` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buying_cash`
--

LOCK TABLES `buying_cash` WRITE;
/*!40000 ALTER TABLE `buying_cash` DISABLE KEYS */;
/*!40000 ALTER TABLE `buying_cash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buying_cheque`
--

DROP TABLE IF EXISTS `buying_cheque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buying_cheque` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `buying_invoice_id` int(11) NOT NULL,
  `bank_id` int(11) NOT NULL,
  `cheque_number` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `issued_date` date NOT NULL,
  `payable_date` date NOT NULL,
  `amount` double(10,2) unsigned NOT NULL,
  `account_transfer` double(10,2) NOT NULL DEFAULT '0.00',
  `notes` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `status` int(1) NOT NULL DEFAULT '1',
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `buying_invoice_idx` (`buying_invoice_id`),
  KEY `bank_idx` (`bank_id`),
  KEY `buying_invoice_idx1` (`buying_invoice_id`),
  KEY `buying_cheque+buying_invoice_idx` (`buying_invoice_id`),
  KEY `buying_cheque+bank_idx` (`bank_id`),
  KEY `created_by` (`created_by`),
  KEY `modified_by` (`modified_by`),
  CONSTRAINT `buying_cheque_ibfk_1` FOREIGN KEY (`buying_invoice_id`) REFERENCES `buying_invoice` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `buying_cheque_ibfk_2` FOREIGN KEY (`bank_id`) REFERENCES `bank` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `buying_cheque_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `buying_cheque_ibfk_4` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buying_cheque`
--

LOCK TABLES `buying_cheque` WRITE;
/*!40000 ALTER TABLE `buying_cheque` DISABLE KEYS */;
/*!40000 ALTER TABLE `buying_cheque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buying_invoice`
--

DROP TABLE IF EXISTS `buying_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buying_invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) NOT NULL,
  `invoice_number` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `grn` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `ordered_date` date NOT NULL,
  `received_date` date NOT NULL,
  `discount` double NOT NULL,
  `is_completely_paid` int(1) NOT NULL DEFAULT '0',
  `market_return_discount` double(10,2) NOT NULL DEFAULT '0.00',
  `expected_paying_date` date NOT NULL,
  `details` varchar(0) COLLATE utf8_unicode_ci NOT NULL,
  `vendor_account_balance_type` int(1) NOT NULL DEFAULT '0',
  `vendor_account_balance_change` double(10,2) NOT NULL DEFAULT '0.00',
  `later_discount` double(10,2) NOT NULL DEFAULT '0.00',
  `status` int(1) NOT NULL DEFAULT '1',
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `vendor_idx` (`vendor_id`),
  KEY `created_by` (`created_by`),
  KEY `modified_by` (`modified_by`),
  CONSTRAINT `buying_invoice_ibfk_1` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `buying_invoice_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `buying_invoice_ibfk_3` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buying_invoice`
--

LOCK TABLES `buying_invoice` WRITE;
/*!40000 ALTER TABLE `buying_invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `buying_invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buying_item`
--

DROP TABLE IF EXISTS `buying_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buying_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `buying_invoice_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `stock_location_id` int(11) NOT NULL,
  `buying_price` double(10,2) unsigned NOT NULL,
  `buying_price_actual` double(10,2) NOT NULL DEFAULT '0.00',
  `unit_selling_price` double(10,2) unsigned NOT NULL,
  `pack_selling_price` double(10,2) unsigned NOT NULL,
  `quantity` double(10,3) unsigned NOT NULL DEFAULT '0.000',
  `free_quantity` double(10,3) NOT NULL DEFAULT '0.000',
  `buying_mode` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'p',
  `expiry_date` date DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `buying_item+buying_invoice_idx` (`buying_invoice_id`),
  KEY `buying_item+item_idx` (`item_id`),
  KEY `created_by` (`created_by`),
  KEY `modified_by` (`modified_by`),
  KEY `stock_location_id` (`stock_location_id`),
  CONSTRAINT `buying_item_ibfk_1` FOREIGN KEY (`buying_invoice_id`) REFERENCES `buying_invoice` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `buying_item_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `buying_item_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `buying_item_ibfk_4` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `buying_item_ibfk_5` FOREIGN KEY (`stock_location_id`) REFERENCES `stock_location` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buying_item`
--

LOCK TABLES `buying_item` WRITE;
/*!40000 ALTER TABLE `buying_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `buying_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buying_other`
--

DROP TABLE IF EXISTS `buying_other`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buying_other` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `buying_invoice_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `amount` double(10,2) NOT NULL DEFAULT '0.00',
  `account_transfer` double(10,2) NOT NULL DEFAULT '0.00',
  `notes` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `buying_invoice_id` (`buying_invoice_id`),
  KEY `created_by` (`created_by`),
  KEY `modified_by` (`modified_by`),
  CONSTRAINT `buying_other_ibfk_1` FOREIGN KEY (`buying_invoice_id`) REFERENCES `buying_invoice` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `buying_other_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `buying_other_ibfk_3` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buying_other`
--

LOCK TABLES `buying_other` WRITE;
/*!40000 ALTER TABLE `buying_other` DISABLE KEYS */;
/*!40000 ALTER TABLE `buying_other` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  KEY `modified_by` (`modified_by`),
  CONSTRAINT `category_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `category_ibfk_2` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  KEY `modified_by` (`modified_by`),
  CONSTRAINT `company_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `company_ibfk_2` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (9,'-',1,'2014-02-04 11:32:37',1,'2014-02-04 11:32:37');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_return`
--

DROP TABLE IF EXISTS `company_return`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_return` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `buying_invoice_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `price` double(10,2) NOT NULL,
  `quantity` double(10,2) unsigned zerofill NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_market_return` (`item_id`),
  KEY `created_by` (`created_by`),
  KEY `modified_by` (`modified_by`),
  KEY `buying_invoice_id` (`buying_invoice_id`),
  CONSTRAINT `company_return_ibfk_1` FOREIGN KEY (`buying_invoice_id`) REFERENCES `buying_invoice` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `company_return_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_return`
--

LOCK TABLES `company_return` WRITE;
/*!40000 ALTER TABLE `company_return` DISABLE KEYS */;
/*!40000 ALTER TABLE `company_return` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `telephone` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `account_balance` double(10,2) NOT NULL DEFAULT '0.00',
  `status` int(1) NOT NULL DEFAULT '1',
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  KEY `modified_by` (`modified_by`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'-','','',0.00,1,1,'2014-02-04 11:32:37',1,'2015-02-24 11:54:54');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daily_initial_cash`
--

DROP TABLE IF EXISTS `daily_initial_cash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `daily_initial_cash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `amount` double(10,2) NOT NULL DEFAULT '0.00',
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  KEY `modified_by` (`modified_by`),
  CONSTRAINT `daily_initial_cash_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `daily_initial_cash_ibfk_2` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_initial_cash`
--

LOCK TABLES `daily_initial_cash` WRITE;
/*!40000 ALTER TABLE `daily_initial_cash` DISABLE KEYS */;
/*!40000 ALTER TABLE `daily_initial_cash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount`
--

DROP TABLE IF EXISTS `discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `mode` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'u',
  `quantity` double(10,2) NOT NULL DEFAULT '0.00',
  `value` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0.00',
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `item` (`item_id`),
  KEY `created_by` (`created_by`),
  KEY `modified_by` (`modified_by`),
  CONSTRAINT `discount_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `discount_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `discount_ibfk_3` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount`
--

LOCK TABLES `discount` WRITE;
/*!40000 ALTER TABLE `discount` DISABLE KEYS */;
/*!40000 ALTER TABLE `discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expense`
--

DROP TABLE IF EXISTS `expense`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expense` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `amount` double NOT NULL,
  `receiver` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `details` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  KEY `modified_by` (`modified_by`),
  CONSTRAINT `expense_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `expense_ibfk_2` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expense`
--

LOCK TABLES `expense` WRITE;
/*!40000 ALTER TABLE `expense` DISABLE KEYS */;
/*!40000 ALTER TABLE `expense` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(11) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `barcode` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pos_name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `sip` int(1) NOT NULL DEFAULT '0',
  `quantity_per_pack` double(10,2) NOT NULL,
  `pack_name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `display_percentage` double(10,2) NOT NULL DEFAULT '100.00',
  `reorder_level` double(10,2) unsigned zerofill NOT NULL,
  `details` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `show_category_in_printed_invoice` int(1) NOT NULL DEFAULT '0',
  `show_company_in_printed_invoice` int(1) NOT NULL DEFAULT '1',
  `default_buying_mode` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'p',
  `default_selling_mode` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'p',
  `pack_buying_price` double(10,2) NOT NULL DEFAULT '0.00',
  `unit_buying_price` double(10,2) NOT NULL DEFAULT '0.00',
  `pack_selling_price` double(10,2) NOT NULL DEFAULT '0.00',
  `unit_selling_price` double(10,2) NOT NULL DEFAULT '0.00',
  `status` int(1) NOT NULL DEFAULT '1',
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `item+category_idx` (`category_id`),
  KEY `item+company_idx` (`company_id`),
  KEY `item+unit_idx` (`unit_id`),
  KEY `created_by` (`created_by`),
  KEY `modified_by` (`modified_by`),
  CONSTRAINT `item_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `item_ibfk_2` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `item_ibfk_3` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `item_ibfk_4` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `item_ibfk_5` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meta`
--

DROP TABLE IF EXISTS `meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meta`
--

LOCK TABLES `meta` WRITE;
/*!40000 ALTER TABLE `meta` DISABLE KEYS */;
INSERT INTO `meta` VALUES (1,'isTrial',0),(2,'trialLeft',0),(3,'isActiveExpiryDate',0),(4,'isActiveMultipleStocks',0),(5,'isActiveVendorAccountBalance',0),(6,'isActiveBuyingOtherPayments',0),(7,'isActiveCustomerAccountBalance',1),(8,'isActiveSellingOtherPayments',1),(9,'isActiveCompanyReturnManager',1);
/*!40000 ALTER TABLE `meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `parent` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES (1,'canLogin','Can Login',0),(2,'canAccessProductTransactions','Can Manage Product Transactions',0),(3,'canAccessReports','Can View Reports',0),(4,'canAccessShopManagement','Can Manage Shop Management',0),(5,'canAccessStakeHolders','Can Manage Stake Holders',0),(6,'canAccessTools','Can Access Tools',0),(7,'canAccessSettings','Can Access Settings',0),(8,'canAddBuyingInvoice','Can Add Buying Invoice',2),(9,'canAccessBuyingInvoiceHistory','Can View Buying Invoice History',2),(10,'canAccessBuyingItemHistory','Can View Buying Item History',2),(11,'canAccessStockManager','Can View Stock Manager',2),(12,'canAddStockTransfer','Can Add Stock Transaction',2),(13,'canAccessStockTransaferHistory','Can View Stock Transactions',2),(14,'canAccessOldStockBySellingInvoice','Can View Old Stocks by Selling Invoice',2),(15,'canAddSellingInvoice','Can Add Selling Invoice',2),(16,'canAccessSellingInvoiceHistory','Can View Selling Invoice History',2),(17,'canAccessSellingItemHistory','Can View Selling Item History',2),(18,'canAddSellingInvoicePayment','Can Add Selling Invoice Payment',2),(19,'canAddRequestBuyingInvoice','Can Add Buying Request Order',2),(20,'canAccessRequestBuyingInvoiceHistory','Can View Buying Request Order History',2),(21,'canAddVendor','Can Add Vendor',5),(22,'canAddSellingPrice','Can Add Selling Price',4),(23,'canDeleteSellingPrice','Can Delete Selling Price',4),(24,'canAddBank','Can Add Bank',5),(25,'canAddBuyingCash','Can Add Buying Cash',2),(26,'canDeleteBuyingCash','Can Delete Buying Cash',2),(27,'canAddBuyingCheque','Can Add Buying Cheque',2),(28,'canDeleteBuyingCheque','Can Delete Buying Other',2),(29,'canAddBuyingOther','Can Add Buying Other',2),(30,'canDeleteBuyingOther','Can Delete Buying Other',2),(31,'canAccessDiscountManager','Can Access Discount Manager',4),(32,'canAddDiscount','Can Add Discount',4),(33,'canUpdateDiscount','Can Add Discount',4),(34,'canDeleteDiscount','Can Update Discount',4),(35,'canEditBuyingInvoice','Can Edit Buying Invoice',2),(36,'canDeleteBuyingInvoice','Can Delete Buying Invoice',2),(37,'canAccessUserManager','Can Access User Manager',4),(38,'canAccessExpenseManager','Can Access Expense Manager',4),(39,'canAccessDailyCash','Can Access Daily Cash',4),(40,'canAccessCategoryManager','Can Access Category Manager',4),(41,'canAccessCompanyManager','Can Access Company Manager',4),(42,'canAccessItemManager','Can Access Item Manager',4),(43,'canAccessUnitManager','Can Access Unit Manager',4),(44,'canAccessSellingPriceManager','Can Access Selling Price Manager',4),(45,'canAccessChequeManager','Can Access Cheque Manager',4),(46,'canAddCustomer','Can Add Customer',5),(47,'canAddSellingCash','Can Add Selling Cash',4),(48,'canDeleteSellingCash','Can Delete Selling Cash',4),(49,'canAddSellingCheque','Can Add Selling Cheque',2),(50,'canDeleteSellingCheque','Can Delete Selling Cheque',2),(51,'canAddSellingOther','Can Add Selling Other',2),(52,'canDeleteSellingOther','Can Delete Selling Other',2),(53,'canEditSellingInvoice','Can Edit Selling Invoice',2),(54,'canAddUnit','Can Add Unit',4),(55,'canAddItem','Can Add Item',4),(56,'canUpdateItem','Can Update Item',4),(57,'canAddCategory','Can Add Category',4),(58,'canAddCompany','Can Add Company',4),(59,'canUpdateStock','Can Update Stock',2),(60,'canAccessDailySale','Can Access Daily Sale',3),(61,'canAccessDailyItemSale','Can Access Daily Item Sale',3),(62,'canAccessDailyProfit','Can Access Daily Profit',3),(63,'canAccessProfitPerItem','can Access Profit Per Item',3),(64,'canAccessDailyBuyingCredit','Can Access Daily Buying Credit',3),(65,'canAccessTotalBuyingCredit','Can Access Total Buying Credit',3),(66,'canAddStockLocation','Can Add Stock Location',7),(67,'canUpdateStockLocation','Can Update Stock Location',7),(68,'canAccessBuyingCheques','Can Access Buying Cheques',3),(69,'canAccessSellingCheques','Can Access Selling Cheques',3),(70,'canAddUser','Can Add User',4),(71,'canUpdateUser','Can Update User',4),(72,'canAddExpense','Can Add Expense',4),(73,'canUpdateExpense','Can Update Expense',4),(74,'canUpdateUnit','Can Update Unit',4),(75,'canUpdateCategory','Can Update Category',4),(76,'canUpdateCompany','Can Update Company',4),(77,'canUpdateSellingPrice','Can Update Selling Price',4),(78,'canAccessVendorManager','Can Access Vendor Manager',5),(79,'canUpdateVendor','Can Update Vendor',5),(80,'canAccessCustomerManager','Can Access Customer Manager',5),(81,'canUpdateCustomer','Can Update Customer',5),(82,'canAccessBankManager','Can Access Bank Manager',5),(83,'canUpdateBank','Can Update Bank',5),(84,'canBackupDatabase','Can Backup Database',6),(85,'canChequePrint','Can Cheque Print',6),(86,'canAccessCashCounter','Can Access Cash Counter',6),(87,'canAccessPreferences','Can Access Preferences',7),(88,'canUpdateProfile','Can Update Profile',7),(89,'canAddDailyInitialCash','Can Save Daily Initial Cash',4),(90,'canUpdateDailyInitialCash','Can Update Daily Initial Cash',4),(91,'canAccessCompanyReturnHistory','Can Access Company Return History',2);
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_user`
--

DROP TABLE IF EXISTS `permission_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `value` int(11) NOT NULL DEFAULT '0',
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  KEY `modified_by` (`modified_by`),
  KEY `user_id` (`user_id`),
  KEY `permission_id` (`permission_id`),
  CONSTRAINT `permission_user_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permission_user_ibfk_2` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permission_user_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permission_user_ibfk_4` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_user`
--

LOCK TABLES `permission_user` WRITE;
/*!40000 ALTER TABLE `permission_user` DISABLE KEYS */;
INSERT INTO `permission_user` VALUES (1,1,1,1,1,'2013-11-21 17:03:42',1,'2014-01-20 10:13:49'),(2,1,2,1,1,'2013-11-21 17:03:42',1,'2014-01-20 10:13:49'),(3,1,3,1,1,'2013-11-21 17:03:42',1,'2014-01-20 10:13:49'),(4,1,4,1,1,'2013-11-21 17:03:42',1,'2014-01-20 10:13:49'),(5,1,5,1,1,'2013-11-21 17:03:42',1,'2014-01-20 10:13:49'),(6,1,6,1,1,'2013-11-21 17:03:42',1,'2014-01-20 10:13:49'),(7,1,7,1,1,'2013-11-21 17:03:42',1,'2014-01-20 10:13:49'),(8,1,8,1,1,'2013-11-21 17:03:42',1,'2014-01-20 10:13:49'),(9,1,9,1,1,'2013-11-21 17:03:42',1,'2014-01-20 10:13:49'),(10,1,10,1,1,'2013-11-21 17:03:42',1,'2014-01-20 10:13:49'),(11,1,11,1,1,'2013-11-21 17:03:42',1,'2014-01-20 10:13:49'),(12,1,12,1,1,'2013-11-21 17:03:42',1,'2014-01-20 10:13:49'),(13,1,13,1,1,'2013-11-21 17:03:42',1,'2014-01-20 10:13:49'),(14,1,14,1,1,'2013-11-21 17:03:42',1,'2014-01-20 10:13:49'),(15,1,15,1,1,'2013-11-21 17:03:42',1,'2014-01-20 10:13:49'),(16,1,16,1,1,'2013-11-21 17:03:42',1,'2014-01-20 10:13:49'),(17,1,17,1,1,'2013-11-21 17:03:42',1,'2014-01-20 10:13:49'),(18,1,18,1,1,'2013-11-21 17:03:42',1,'2014-01-20 10:13:49'),(19,1,19,1,1,'2013-11-21 17:03:42',1,'2014-01-20 10:13:49'),(20,1,20,1,1,'2013-11-21 17:03:42',1,'2014-01-20 10:13:50'),(21,1,21,1,1,'2013-11-29 10:31:01',1,'2014-01-20 10:13:50'),(22,1,22,1,1,'2013-12-02 10:00:57',1,'2014-01-20 10:13:50'),(23,1,23,1,1,'2013-12-02 12:27:12',1,'2014-01-20 10:13:50'),(24,1,24,1,1,'2013-12-09 14:32:27',1,'2014-01-20 10:13:50'),(25,1,25,1,1,'2013-12-09 15:13:05',1,'2014-01-20 10:13:50'),(26,1,26,1,1,'2013-12-09 15:13:05',1,'2014-01-20 10:13:50'),(27,1,27,1,1,'2013-12-09 15:56:49',1,'2014-01-20 10:13:50'),(28,1,28,1,1,'2013-12-09 16:26:34',1,'2014-01-20 10:13:50'),(29,1,29,1,1,'2013-12-11 10:20:47',1,'2014-01-20 10:13:50'),(30,1,30,1,1,'2013-12-11 14:59:30',1,'2014-01-20 10:13:50'),(31,1,31,1,1,'2013-12-11 16:58:46',1,'2014-01-20 10:13:50'),(32,1,32,1,1,'2013-12-11 17:11:58',1,'2014-01-20 10:13:50'),(33,1,33,1,1,'2013-12-12 12:35:28',1,'2014-01-20 10:13:50'),(34,1,34,1,1,'2013-12-12 12:35:28',1,'2014-01-20 10:13:50'),(35,1,35,1,1,'2013-12-17 09:03:50',1,'2014-01-20 10:13:50'),(36,1,36,1,1,'2013-12-17 09:12:18',1,'2014-01-20 10:13:50'),(37,1,37,1,1,'2013-12-17 09:55:53',1,'2014-01-20 10:13:50'),(38,1,38,1,1,'2013-12-17 09:55:53',1,'2014-01-20 10:13:50'),(39,1,39,1,1,'2013-12-17 09:55:53',1,'2014-01-20 10:13:50'),(40,1,40,1,1,'2013-12-17 09:55:53',1,'2014-01-20 10:13:50'),(41,1,41,1,1,'2013-12-17 09:55:53',1,'2014-01-20 10:13:50'),(42,1,42,1,1,'2013-12-17 09:55:53',1,'2014-01-20 10:13:50'),(43,1,43,1,1,'2013-12-17 09:55:53',1,'2014-01-20 10:13:50'),(44,1,44,1,1,'2013-12-17 09:55:53',1,'2014-01-20 10:13:50'),(45,1,45,1,1,'2013-12-17 09:55:53',1,'2014-01-20 10:13:50'),(46,1,46,1,1,'2013-12-17 09:55:53',1,'2014-01-20 10:13:50'),(47,1,47,1,1,'2013-12-26 11:57:36',1,'2014-01-20 10:13:50'),(48,1,48,1,1,'2013-12-26 11:57:51',1,'2014-01-20 10:13:50'),(49,1,49,1,1,'2013-12-26 11:57:51',1,'2014-01-20 10:13:51'),(50,1,50,1,1,'2013-12-26 11:57:51',1,'2014-01-20 10:13:51'),(51,1,51,1,1,'2013-12-26 11:58:17',1,'2014-01-20 10:13:51'),(52,1,52,1,1,'2013-12-26 11:58:17',1,'2014-01-20 10:13:51'),(53,1,53,1,1,'2013-12-26 14:59:55',1,'2014-01-20 10:13:51'),(54,1,54,1,1,'2013-12-31 12:17:32',1,'2014-01-20 10:13:51'),(55,1,55,1,1,'2014-01-01 11:40:30',1,'2014-01-20 10:13:51'),(56,1,56,1,1,'2014-01-01 11:40:30',1,'2014-01-20 10:13:51'),(57,1,57,1,1,'2014-01-01 15:48:11',1,'2014-01-20 10:13:51'),(58,1,58,1,1,'2014-01-01 15:48:11',1,'2014-01-20 10:13:51'),(59,1,59,1,1,'2014-01-06 09:53:30',1,'2014-01-20 10:13:51'),(60,1,60,1,1,'2014-01-09 09:22:37',1,'2014-01-20 10:13:51'),(61,1,61,1,1,'2014-01-09 09:34:19',1,'2014-01-20 10:13:51'),(62,1,62,1,1,'2014-01-09 09:34:19',1,'2014-01-20 10:13:51'),(63,1,63,1,1,'2014-01-09 09:34:19',1,'2014-01-20 10:13:51'),(64,1,64,1,1,'2014-01-09 09:34:19',1,'2014-01-20 10:13:51'),(65,1,65,1,1,'2014-01-09 09:34:19',1,'2014-01-20 10:13:51'),(66,1,66,1,1,'2014-01-09 09:34:19',1,'2014-01-20 10:13:51'),(67,1,67,1,1,'2014-01-09 09:34:19',1,'2014-01-20 10:13:51'),(68,1,68,1,1,'2014-01-09 09:34:19',1,'2014-01-20 10:13:51'),(69,1,69,1,1,'2014-01-09 09:34:19',1,'2014-01-20 10:13:51'),(70,1,70,1,1,'2014-01-10 15:02:04',1,'2014-01-20 10:13:51'),(71,1,71,1,1,'2014-01-13 10:54:45',1,'2014-01-20 10:13:51'),(72,1,72,1,1,'2014-01-13 13:49:11',1,'2014-01-20 10:13:51'),(73,1,73,1,1,'2014-01-13 16:39:05',1,'2014-01-20 10:13:51'),(74,1,74,1,1,'2014-01-14 09:19:46',1,'2014-01-20 10:13:51'),(75,1,75,1,1,'2014-01-14 11:42:49',1,'2014-01-20 10:13:51'),(76,1,76,1,1,'2014-01-14 11:42:49',1,'2014-01-20 10:13:51'),(77,1,77,1,1,'2014-01-14 16:36:20',1,'2014-01-20 10:13:51'),(78,1,78,1,1,'2014-01-14 16:40:28',1,'2014-01-20 10:13:51'),(79,1,79,1,1,'2014-01-16 09:24:43',1,'2014-01-20 10:13:52'),(80,1,80,1,1,'2014-01-16 09:39:24',1,'2014-01-20 10:13:52'),(81,1,81,1,1,'2014-01-16 10:07:19',1,'2014-01-20 10:13:52'),(82,1,82,1,1,'2014-01-16 10:27:37',1,'2014-01-20 10:13:52'),(83,1,83,1,1,'2014-01-16 10:50:49',1,'2014-01-20 10:13:52'),(84,1,84,1,1,'2014-01-16 11:00:50',1,'2014-01-20 10:13:52'),(85,1,85,1,1,'2014-01-16 11:19:04',1,'2014-01-20 10:13:52'),(86,1,86,1,1,'2014-01-16 12:03:46',1,'2014-01-20 10:13:52'),(87,1,87,1,1,'2014-01-16 13:10:22',1,'2014-01-20 10:13:52'),(88,1,88,1,1,'2014-01-20 10:53:09',1,'2014-01-20 10:53:09'),(89,1,89,1,1,'2014-01-27 16:47:29',1,'2014-01-27 16:47:29'),(90,1,90,1,1,'2014-01-27 16:48:49',1,'2014-01-27 16:48:49'),(91,1,91,1,1,'2014-02-20 12:19:22',1,'2014-02-20 12:19:22');
/*!40000 ALTER TABLE `permission_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preference`
--

DROP TABLE IF EXISTS `preference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preference` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_UNIQUE` (`key`),
  KEY `created_by` (`created_by`),
  KEY `modified_by` (`modified_by`),
  CONSTRAINT `preference_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `preference_ibfk_2` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preference`
--

LOCK TABLES `preference` WRITE;
/*!40000 ALTER TABLE `preference` DISABLE KEYS */;
INSERT INTO `preference` VALUES (1,'autoBackupLocation','C:\\Users\\Acme\\Merchent#',1,'2013-11-19 16:49:48',1,'2016-02-21 15:46:21'),(2,'licensedTo','Acme Stores',1,'2013-12-02 17:15:31',1,'2013-12-02 17:15:31'),(3,'defaultBuyingStock','1',1,'2013-12-18 09:14:49',1,'2014-03-10 14:45:49'),(4,'defaultSellingStock','1',1,'2013-12-18 09:14:49',1,'2014-03-10 14:45:49'),(5,'defaultItemSelectMode','0',1,'2013-12-26 12:00:08',1,'2015-06-05 18:07:36'),(6,'itemCodeGenerateBy','l',1,'2014-01-01 10:50:30',1,'2015-06-05 18:07:36'),(7,'isActiveSecureAuthentication','1',1,'2014-01-16 12:34:37',1,'2014-02-18 09:48:03'),(8,'secureAuthenticationTime','30',1,'2014-01-16 13:29:25',1,'2014-01-31 10:06:24'),(9,'isShowVFD','0',1,'2014-01-31 08:16:34',1,'2014-01-31 10:06:14'),(10,'portVFD','COM3',1,'2014-01-31 14:24:44',1,'2014-01-31 14:24:44'),(11,'shopName','Acme Stores',1,'2014-01-31 14:30:44',1,'2014-01-31 14:30:44'),(12,'shopAddress1','Street',1,'2014-02-03 09:10:05',1,'2014-02-03 09:10:05'),(13,'shopAddress2','City',1,'2014-02-03 09:13:33',1,'2014-02-03 09:13:33'),(14,'shopAddress3','',1,'2014-02-03 09:14:08',1,'2014-02-03 09:14:08'),(15,'shopTelephone','119',1,'2014-02-03 09:14:42',1,'2014-02-03 09:14:42'),(16,'sellingInvoicePrint_language','c',1,'2014-02-03 09:31:29',1,'2014-02-12 10:47:10'),(17,'sellingInvoicePrint_showDiscountOrOurPrice','o',1,'2014-02-03 09:31:55',1,'2014-02-12 10:55:12'),(18,'sellingInvoicePrint_invoiceNumber_customLanguageText','Invoice Number',1,'2014-02-03 09:42:29',1,'2014-02-12 10:47:46'),(19,'sellingInvoicePrint_creditInvoice_customLanguageText','Credit Invoice',1,'2014-02-03 09:44:24',1,'2014-02-12 10:48:49'),(20,'sellingInvoicePrint_userName_customLanguageText','Username',1,'2014-02-03 09:52:02',1,'2014-02-12 10:55:02'),(21,'sellingInvoicePrint_customerName_customLanguageText','Customer Name',1,'2014-02-03 10:03:32',1,'2014-02-12 11:20:44'),(22,'sellingInvoicePrint_printedPrice_customLanguageText','Printed Price',1,'2014-02-03 10:12:04',1,'2014-02-12 10:48:49'),(23,'sellingInvoicePrint_ourPrice_customLanguageText','Our Price',1,'2014-02-03 10:13:05',1,'2014-02-12 10:55:01'),(24,'sellingInvoicePrint_discount_customLanguageText','Discount',1,'2014-02-03 10:13:34',1,'2014-02-12 10:55:01'),(25,'sellingInvoicePrint_quantity_customLanguageText','Quantity',1,'2014-02-03 10:15:11',1,'2014-02-12 10:55:01'),(26,'sellingInvoicePrint_lineTotal_customLanguageText','Line Total',1,'2014-02-03 10:16:04',1,'2014-02-12 10:55:01'),(27,'sellingInvoicePrint_subTotal_customLanguageText','Sub Total',1,'2014-02-03 10:17:48',1,'2014-02-12 10:55:01'),(28,'sellingInvoicePrint_displayLineDiscount','a',1,'2014-02-03 10:29:30',1,'2014-02-03 14:05:21'),(29,'sellingInvoicePrint_numberOfItems_customLanguageText','Number of Items',1,'2014-02-03 10:57:23',1,'2014-02-12 10:55:02'),(30,'sellingInvoicePrint_billDiscount_customLanguageText','Bill Discount',1,'2014-02-03 11:04:38',1,'2014-02-12 10:55:01'),(31,'sellingInvoicePrint_totalReturn_customLanguageText','Total Returns',1,'2014-02-03 11:06:03',1,'2014-02-12 10:55:01'),(32,'sellingInvoicePrint_netTotal_customLanguageText','Net Total',1,'2014-02-03 11:08:52',1,'2014-02-12 10:55:01'),(33,'sellingInvoicePrint_givenMoney_customLanguageText','Given Money',1,'2014-02-03 11:14:40',1,'2014-02-12 10:55:01'),(34,'sellingInvoicePrint_totalPayment_customLanguageText','Total Payment',1,'2014-02-03 11:19:20',1,'2014-02-12 10:55:02'),(35,'sellingInvoicePrint_balance_customLanguageText','Balance',1,'2014-02-03 11:23:15',1,'2014-02-12 10:55:01'),(36,'sellingInvoicePrint_totalDiscount_customLanguageText','Total Discount',1,'2014-02-03 11:28:17',1,'2014-02-12 10:55:01'),(37,'sellingInvoicePrint_message','',1,'2014-02-03 11:31:03',1,'2014-02-03 14:17:08'),(38,'sellingInvoicePrint_thankyouText','Thank you. Come again.',1,'2014-02-03 11:33:08',1,'2014-02-12 10:47:10'),(39,'sellingInvoiceFooterText','SYSTEM BY SANMARK $( http://thesanmark.com )$TEL +94912261067 / +94776042481',1,'2014-02-03 11:36:39',1,'2014-02-03 11:36:39'),(40,'sellingInvoicePrint_numberOfCopiesOfCreditBill','1',1,'2014-02-03 12:04:24',1,'2015-08-09 18:57:40'),(41,'defaultCompanyReturnStock','3',1,'2014-02-20 12:23:59',1,'2014-03-10 14:45:49');
/*!40000 ALTER TABLE `preference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `selling_cash`
--

DROP TABLE IF EXISTS `selling_cash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `selling_cash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `selling_invoice_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `amount` double(10,2) NOT NULL,
  `account_transfer` double(10,2) NOT NULL DEFAULT '0.00',
  `notes` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `selling_cash+selling_invoice_idx` (`selling_invoice_id`),
  KEY `created_by` (`created_by`),
  KEY `modified_by` (`modified_by`),
  CONSTRAINT `selling_cash_ibfk_1` FOREIGN KEY (`selling_invoice_id`) REFERENCES `selling_invoice` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `selling_cash_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `selling_cash_ibfk_3` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `selling_cash`
--

LOCK TABLES `selling_cash` WRITE;
/*!40000 ALTER TABLE `selling_cash` DISABLE KEYS */;
/*!40000 ALTER TABLE `selling_cash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `selling_cheque`
--

DROP TABLE IF EXISTS `selling_cheque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `selling_cheque` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `selling_invoice_id` int(11) NOT NULL,
  `bank_id` int(11) NOT NULL,
  `cheque_number` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `issued_date` date NOT NULL,
  `payable_date` date NOT NULL,
  `amount` double(10,2) unsigned NOT NULL,
  `account_transfer` double(10,2) NOT NULL DEFAULT '0.00',
  `notes` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `status` int(1) NOT NULL DEFAULT '1',
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `selling_cheque+selling_invoice_idx` (`selling_invoice_id`),
  KEY `selling_cheque+bank_idx` (`bank_id`),
  KEY `created_by` (`created_by`),
  KEY `modified_by` (`modified_by`),
  CONSTRAINT `selling_cheque_ibfk_1` FOREIGN KEY (`selling_invoice_id`) REFERENCES `selling_invoice` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `selling_cheque_ibfk_2` FOREIGN KEY (`bank_id`) REFERENCES `bank` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `selling_cheque_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `selling_cheque_ibfk_4` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `selling_cheque`
--

LOCK TABLES `selling_cheque` WRITE;
/*!40000 ALTER TABLE `selling_cheque` DISABLE KEYS */;
/*!40000 ALTER TABLE `selling_cheque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `selling_invoice`
--

DROP TABLE IF EXISTS `selling_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `selling_invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `invoice_number` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `details` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `discount` double(10,2) NOT NULL DEFAULT '0.00',
  `is_completely_paid` int(1) NOT NULL DEFAULT '0',
  `referrer_commision` double(10,2) NOT NULL DEFAULT '0.00',
  `is_quick_paid` int(1) NOT NULL DEFAULT '0',
  `given_money` double(10,2) NOT NULL DEFAULT '0.00',
  `customer_account_balance_change` double(10,2) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_idx` (`customer_id`),
  KEY `created_by` (`created_by`),
  KEY `modified_by` (`modified_by`),
  CONSTRAINT `selling_invoice_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `selling_invoice_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `selling_invoice_ibfk_3` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `selling_invoice`
--

LOCK TABLES `selling_invoice` WRITE;
/*!40000 ALTER TABLE `selling_invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `selling_invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `selling_item`
--

DROP TABLE IF EXISTS `selling_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `selling_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `selling_invoice_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `stock_location_id` int(11) NOT NULL,
  `default_price` double(10,2) NOT NULL DEFAULT '0.00',
  `sold_price` double(10,2) NOT NULL DEFAULT '0.00',
  `selling_mode` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` double(10,3) unsigned NOT NULL,
  `good_return_quantity` double(10,2) unsigned NOT NULL,
  `market_return_quantity` double(10,2) unsigned NOT NULL,
  `waste_return_quantity` double(10,2) unsigned NOT NULL,
  `discount` double(10,2) NOT NULL DEFAULT '0.00',
  `stock_before_sale` double(10,2) NOT NULL DEFAULT '0.00',
  `selling_price_actual` double(10,2) NOT NULL DEFAULT '0.00',
  `buying_price_actual` double(10,2) NOT NULL DEFAULT '0.00',
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `selling_invoice_idx` (`selling_invoice_id`),
  KEY `item_idx` (`item_id`),
  KEY `created_by` (`created_by`),
  KEY `modified_by` (`modified_by`),
  KEY `stock_location_id` (`stock_location_id`),
  CONSTRAINT `selling_item_ibfk_1` FOREIGN KEY (`selling_invoice_id`) REFERENCES `selling_invoice` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `selling_item_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `selling_item_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `selling_item_ibfk_4` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `selling_item_ibfk_5` FOREIGN KEY (`stock_location_id`) REFERENCES `stock_location` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `selling_item`
--

LOCK TABLES `selling_item` WRITE;
/*!40000 ALTER TABLE `selling_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `selling_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `selling_other`
--

DROP TABLE IF EXISTS `selling_other`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `selling_other` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `selling_invoice_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `amount` double(10,2) NOT NULL DEFAULT '0.00',
  `account_transfer` double(10,2) NOT NULL DEFAULT '0.00',
  `notes` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `selling_invoice_id` (`selling_invoice_id`),
  KEY `created_by` (`created_by`),
  KEY `modified_by` (`modified_by`),
  CONSTRAINT `selling_other_ibfk_1` FOREIGN KEY (`selling_invoice_id`) REFERENCES `selling_invoice` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `selling_other_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `selling_other_ibfk_3` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `selling_other`
--

LOCK TABLES `selling_other` WRITE;
/*!40000 ALTER TABLE `selling_other` DISABLE KEYS */;
/*!40000 ALTER TABLE `selling_other` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `selling_price`
--

DROP TABLE IF EXISTS `selling_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `selling_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `mode` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `price` double(10,2) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `selling_price_pack?item_idx` (`item_id`),
  KEY `created_by` (`created_by`),
  KEY `modified_by` (`modified_by`),
  CONSTRAINT `selling_price_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `selling_price_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `selling_price_ibfk_3` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `selling_price`
--

LOCK TABLES `selling_price` WRITE;
/*!40000 ALTER TABLE `selling_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `selling_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_item`
--

DROP TABLE IF EXISTS `stock_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_location_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` double(10,2) NOT NULL DEFAULT '0.00',
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `stock+item_idx` (`item_id`),
  KEY `stock_location_id` (`stock_location_id`),
  KEY `created_by` (`created_by`),
  KEY `modified_by` (`modified_by`),
  CONSTRAINT `stock_item_ibfk_1` FOREIGN KEY (`stock_location_id`) REFERENCES `stock_location` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stock_item_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stock_item_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stock_item_ibfk_4` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_item`
--

LOCK TABLES `stock_item` WRITE;
/*!40000 ALTER TABLE `stock_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_location`
--

DROP TABLE IF EXISTS `stock_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  KEY `modified_by` (`modified_by`),
  CONSTRAINT `stock_location_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stock_location_ibfk_2` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_location`
--

LOCK TABLES `stock_location` WRITE;
/*!40000 ALTER TABLE `stock_location` DISABLE KEYS */;
INSERT INTO `stock_location` VALUES (1,'Main',1,1,'2013-12-05 11:58:40',1,'2013-12-05 11:58:40'),(2,'Sub',0,1,'2014-02-20 12:25:04',1,'2014-03-10 14:46:13'),(3,'Return',1,1,'2014-02-20 12:25:16',1,'2014-02-20 12:25:16');
/*!40000 ALTER TABLE `stock_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_transfer`
--

DROP TABLE IF EXISTS `stock_transfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_transfer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_location_id` int(11) NOT NULL,
  `to_location_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `carrier` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `details` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `from_location_id` (`from_location_id`),
  KEY `to_location_id` (`to_location_id`),
  KEY `created_by` (`created_by`),
  KEY `modified_by` (`modified_by`),
  CONSTRAINT `stock_transfer_ibfk_1` FOREIGN KEY (`from_location_id`) REFERENCES `stock_location` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stock_transfer_ibfk_2` FOREIGN KEY (`to_location_id`) REFERENCES `stock_location` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stock_transfer_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stock_transfer_ibfk_4` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_transfer`
--

LOCK TABLES `stock_transfer` WRITE;
/*!40000 ALTER TABLE `stock_transfer` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_transfer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_transfer_item`
--

DROP TABLE IF EXISTS `stock_transfer_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_transfer_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_transfer_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` double(10,2) NOT NULL DEFAULT '0.00',
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_transfer_id` (`stock_transfer_id`),
  KEY `item_id` (`item_id`),
  KEY `created_by` (`created_by`),
  KEY `modified_by` (`modified_by`),
  CONSTRAINT `stock_transfer_item_ibfk_1` FOREIGN KEY (`stock_transfer_id`) REFERENCES `stock_transfer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stock_transfer_item_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stock_transfer_item_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stock_transfer_item_ibfk_4` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_transfer_item`
--

LOCK TABLES `stock_transfer_item` WRITE;
/*!40000 ALTER TABLE `stock_transfer_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_transfer_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unit`
--

DROP TABLE IF EXISTS `unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `created_by` (`created_by`),
  KEY `modified_by` (`modified_by`),
  CONSTRAINT `unit_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `unit_ibfk_2` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit`
--

LOCK TABLES `unit` WRITE;
/*!40000 ALTER TABLE `unit` DISABLE KEYS */;
INSERT INTO `unit` VALUES (1,'Item',1,'2014-02-04 11:32:37',1,'2014-02-04 11:32:37'),(2,'m',1,'2014-02-04 11:32:37',1,'2014-02-04 11:32:37'),(4,'l',1,'2014-02-04 11:32:37',1,'2014-02-04 11:32:37'),(5,'g',1,'2014-02-04 11:32:37',1,'2014-02-04 11:32:37'),(6,'ft',1,'2014-02-04 11:32:37',1,'2014-02-04 11:32:37'),(8,'Pack',1,'2014-02-04 11:32:37',1,'2014-02-04 11:32:37'),(9,'Kg',1,'2014-02-04 11:32:37',1,'2014-02-04 11:32:37'),(12,'ml',1,'2014-02-04 11:32:37',1,'2014-02-04 11:32:37'),(13,'cm',1,'2014-02-04 11:32:37',1,'2014-02-04 11:32:37'),(14,'mm',1,'2014-02-04 11:32:37',1,'2014-02-04 11:32:37'),(15,'කැරලි',1,'2014-11-17 10:59:52',1,'2014-11-17 10:59:52'),(16,'pkt',1,'2015-03-20 19:01:25',1,'2015-03-20 19:01:25');
/*!40000 ALTER TABLE `unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `status` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','40-BD-00-15-63-08-5F-C3-51-65-32-9E-A1-FF-5C-5E-CB-DB-BE-EF','admin','',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor`
--

DROP TABLE IF EXISTS `vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `telephone` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `account_balance` double(10,2) NOT NULL DEFAULT '0.00',
  `status` int(1) NOT NULL DEFAULT '1',
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `created_by` (`created_by`),
  KEY `modified_by` (`modified_by`),
  CONSTRAINT `vendor_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `vendor_ibfk_2` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor`
--

LOCK TABLES `vendor` WRITE;
/*!40000 ALTER TABLE `vendor` DISABLE KEYS */;
INSERT INTO `vendor` VALUES (89,'-','','',0.00,1,1,'2014-02-04 11:32:37',1,'2014-02-04 11:32:37');
/*!40000 ALTER TABLE `vendor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-19 10:02:27
