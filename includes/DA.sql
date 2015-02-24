-- MySQL dump 10.13  Distrib 5.5.41, for Win32 (AMD64)
--
-- Host: localhost    Database: da
-- ------------------------------------------------------
-- Server version	5.5.41-log

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
-- Table structure for table `commodities`
--

DROP TABLE IF EXISTS `commodities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commodities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_date` date NOT NULL COMMENT '��������',
  `commodities_name` varchar(128) DEFAULT NULL COMMENT '�Ĳ�����',
  `purchase_cost` double(12,2) DEFAULT '0.00' COMMENT '�������',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�Ĳ���ϸ��';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commodities`
--

LOCK TABLES `commodities` WRITE;
/*!40000 ALTER TABLE `commodities` DISABLE KEYS */;
/*!40000 ALTER TABLE `commodities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_name` varchar(60) DEFAULT NULL COMMENT '����',
  `contact_tel` varchar(30) DEFAULT NULL COMMENT '�ֻ���',
  `contact_Position` varchar(60) DEFAULT NULL COMMENT 'ְ��',
  `e_mail` varchar(30) DEFAULT NULL COMMENT '��������',
  `qq` varchar(30) DEFAULT NULL COMMENT 'qq��',
  `other_tel` varchar(60) DEFAULT NULL COMMENT '������ϵ��ʽ',
  `company_name` varchar(128) DEFAULT NULL COMMENT '��˾����',
  `company_addr` varchar(256) DEFAULT NULL COMMENT '��˾��ַ',
  `company_Nature` varchar(128) DEFAULT NULL COMMENT '��˾����',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��ϵ��';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `electronic_sign_in`
--

DROP TABLE IF EXISTS `electronic_sign_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `electronic_sign_in` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sign_date` date NOT NULL COMMENT 'ǩ������',
  `sign_mach_type` varchar(5) DEFAULT NULL COMMENT 'ǩ��������',
  `sign_mach_count` int(11) DEFAULT '0' COMMENT 'ǩ��������',
  `sign_cost_income` double(12,2) DEFAULT '0.00' COMMENT 'ǩ������',
  `lottery_cost_income` double(12,2) DEFAULT '0.00' COMMENT '�齱����',
  `photo_print_cost_income` double(12,2) DEFAULT '0.00' COMMENT '��Ƭ��ӡ����',
  `fare_cost_income` double(12,2) DEFAULT '0.00' COMMENT '�˷�����',
  `Invoice_cost_income` double(12,2) DEFAULT '0.00' COMMENT '��Ʊ����',
  `fare_cost_outcome` double(12,2) DEFAULT '0.00' COMMENT '�˷�֧��',
  `meals_outcome` double(12,2) DEFAULT '0.00' COMMENT '�ͷ�֧��',
  `Invoice_cost_outcome` double(12,2) DEFAULT '0.00' COMMENT '��Ʊ֧��',
  `other_cost_outcome` double(12,2) DEFAULT '0.00' COMMENT '��������֧��',
  `other_cost_comments` varchar(128) DEFAULT NULL COMMENT '��������֧��˵��',
  `Surplus` double(12,2) DEFAULT '0.00' COMMENT 'ӯ��',
  `Contact_id` varchar(10) DEFAULT NULL COMMENT '��ϵ�˱��',
  `use_unit` varchar(128) DEFAULT NULL COMMENT 'ʹ�õ�λ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='����ǩ����ϸ��';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `electronic_sign_in`
--

LOCK TABLES `electronic_sign_in` WRITE;
/*!40000 ALTER TABLE `electronic_sign_in` DISABLE KEYS */;
/*!40000 ALTER TABLE `electronic_sign_in` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `p_code`
--

DROP TABLE IF EXISTS `p_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `p_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CODE_TYPE` varchar(60) DEFAULT NULL COMMENT '����',
  `CODE_DESC` varchar(60) DEFAULT NULL COMMENT '��ע',
  `CODE` varchar(5) DEFAULT NULL COMMENT '����',
  `ORD` int(11) DEFAULT NULL COMMENT '˳��',
  `ENABLE_FLAG` varchar(5) DEFAULT NULL COMMENT '���ñ�־',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�����';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `p_code`
--

LOCK TABLES `p_code` WRITE;
/*!40000 ALTER TABLE `p_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `p_code` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-02-23 22:39:26
