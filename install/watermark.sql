-- --------------------------------------------------------
-- 
--
--  Database: `wartermark`
--
--
-- --------------------------------------------------------

SET sql_mode = '';

--
-- Table structure for table `wm_country`
--

CREATE TABLE IF NOT EXISTS `wm_country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_name` varchar(128) NOT NULL,
  `iso_code_2` varchar(2) NULL,
  `iso_code_3` varchar(3) NULL,
  `postcode_required` tinyint(1) NOT NULL DEFAULT '0',
  `active_fg` tinyint(1) NOT NULL DEFAULT '1',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT pk_country PRIMARY KEY (country_id) 
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Alter structure for table `wm_country`
--

ALTER TABLE `wm_country` ADD UNIQUE idx_country_name (country_name);

--
-- Dumping data for table `wm_country`
--

INSERT INTO `wm_country` (`country_id`, `country_name`, `iso_code_2`, `iso_code_3`, `postcode_required`) VALUES
(null, '中国', 'CN', 'CHN', 0),
(null, 'Thailand', 'TH', 'THA', 0),
(null, 'United States', 'US', 'USA', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wm_city`
--

CREATE TABLE IF NOT EXISTS `wm_city` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT,  
  `city_name` varchar(128) NOT NULL,
  `city_code_2` varchar(2) NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `active_fg` tinyint(1) NOT NULL DEFAULT '1',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT pk_city PRIMARY KEY (city_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Alter structure for table `wm_city`
--

ALTER TABLE `wm_city` ADD UNIQUE idx_city_name_country_id (city_name, country_id);

--
-- Dumping data for table `wm_city`
--

INSERT INTO `wm_city` (`city_id`, `city_name`, `city_code_2`, `postcode`, `country_id`) VALUES 
(null, 'Shanghai', 'SH', '200000', 1),
(null, 'Suzhou', 'SZ', '', 1),
(null, 'Shenzhen', 'SZ', '', 1),
(null, 'Nantong', 'NT', '', 1);  

-- --------------------------------------------------------

--
-- Table structure for table `wm_company_type`
--

CREATE TABLE IF NOT EXISTS `wm_company_type` (
  `company_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_type_name` varchar(100) NOT NULL,
  `active_fg` tinyint(1) NOT NULL DEFAULT '1',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT pk_company_type PRIMARY KEY (company_type_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Alter structure for table `wm_company_type`
--

ALTER TABLE `wm_company_type` ADD UNIQUE idx_company_type (company_type_name);

--
-- Dumping data for table `wm_company_type`
--

INSERT INTO `wm_company_type` (`company_type_id`, `company_type_name`) VALUES 
(null, '房地产'),
(null, '婚庆'),
(null, '广告'),
(null, '传媒'),
(null, '汽车'),
(null, '酒店'),
(null, '教育'),
(null, '投资');

-- --------------------------------------------------------

--
-- Table structure for table `wm_company`
--

CREATE TABLE IF NOT EXISTS `wm_company` (
  `company_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(200) NOT NULL,
  `company_type_id` int(11) NOT NULL DEFAULT '0',
  `active_fg` tinyint(1) NOT NULL DEFAULT '1',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT pk_company PRIMARY KEY (company_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Alter structure for table `wm_company`

ALTER TABLE `wm_company` ADD UNIQUE idx_company_name (company_name);

--
-- Dumping data for table `wm_company`
--

-- --------------------------------------------------------

--
-- Table structure for table `wm_service_type`
--

CREATE TABLE IF NOT EXISTS `wm_service_type` (
  `service_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `service_type_name` varchar(100) NOT NULL,
  `active_fg` tinyint(1) NOT NULL DEFAULT '1',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT pk_service_type PRIMARY KEY (service_type_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Alter structure for table `wm_service_type`
--

ALTER TABLE `wm_service_type` ADD UNIQUE idx_service_type_name (service_type_name);

--
-- Dumping data for table `wm_service_type`
--

INSERT INTO `wm_service_type` (`service_type_id`, `service_type_name`) VALUES 
(null, 'e-signature'),
(null, 'lottery'),
(null, 'photo printing');

-- --------------------------------------------------------

--
-- Table structure for table `wm_cost_type`
--

CREATE TABLE IF NOT EXISTS `wm_cost_type` (
  `cost_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `cost_type_name` varchar(100) NOT NULL,
  `active_fg` tinyint(1) NOT NULL DEFAULT '1',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT pk_cost_type PRIMARY KEY (cost_type_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Alter structure for table `wm_cost_type`
--

ALTER TABLE `wm_cost_type` ADD UNIQUE idx_cost_type_name (cost_type_name);

--
-- Dumping data for table `wm_cost_type`
--

INSERT INTO `wm_cost_type` (`cost_type_id`, `cost_type_name`) VALUES
(null, '耗材'),
(null, '租车'),
(null, '饭费'),
(null, '发票');

-- --------------------------------------------------------

-- 
-- Table structure for table `wm_service`
--
CREATE TABLE IF NOT EXISTS `wm_service` (
  `service_id` int(11) NOT NULL AUTO_INCREMENT,
  `service_name` varchar(200) NOT NULL,
  `service_time` datetime NOT NULL,
  `quotation_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `deal_price` decimal(15,4) NOT NULL DEFAULT '0.0000', 
  `invoic_required` tinyint(1) NOT NULL DEFAULT '0',
  `service_type_id` int(11) NOT NULL DEFAULT '0',
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT pk_service PRIMARY KEY (service_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Alter structure for table `wm_service`
--

ALTER TABLE `wm_service` ADD UNIQUE idx_service_name_type_customer (service_name, service_type_id, customer_id);

--
-- Dumping data for table `wm_service`
--

-- --------------------------------------------------------

--
-- Table structure for table `wm_service_cost`
--

CREATE TABLE IF NOT EXISTS `wm_service_cost` (
  `service_cost_id` int(11) NOT NULL AUTO_INCREMENT,
  `service_cost_name` varchar(200) NOT NULL,
  `cost_fee` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `cost_type_id` int(11) NOT NULL DEFAULT '0',
  `service_id` int(11) NOT NULL DEFAULT '0',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT pk_service_cost PRIMARY KEY (service_cost_id) 
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Alter structure for table `wm_service_cost`
--

ALTER TABLE `wm_service_cost` ADD UNIQUE idx_service_cost_name_id (service_cost_name, cost_type_id, service_id);

--
-- Dumping data for table `wm_service_cost`
--

-- --------------------------------------------------------

--
-- Table structure for table `wm_customer`
--

CREATE TABLE IF NOT EXISTS `wm_customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(200) NOT NULL,
  `email` varchar(100) NULL,
  `telephone` varchar(32) NULL,
  `qq` varchar(32) NULL,
  `wechat` varchar(32) NULL,
  `job_title` varchar(50) NULL,
  `other_info` varchar(100) NULL,
  `direct_contact` tinyint(1) NOT NULL DEFAULT '1',
  `company_id` int(11) NOT NULL DEFAULT '0',  
  `acitve_fg` tinyint(1) NOT NULL DEFAULT '1',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT pk_customer PRIMARY KEY (customer_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Alter structure for table `wm_customer`
--

ALTER TABLE `wm_customer` ADD UNIQUE idx_customer_name (customer_name);

--
-- Dumping data for table `wm_customer`
--

-- --------------------------------------------------------

--
-- Table structure for table `wm_address`
--

CREATE TABLE IF NOT EXISTS `wm_address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `address_1` varchar(200) NOT NULL,
  `address_2` varchar(200) NULL,
  `postcode` varchar(10) NOT NULL DEFAULT '000000',
  `city_id` int(11) NOT NULL DEFAULT '0',
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `active_fg` tinyint(1) NOT NULL DEFAULT '1',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT pk_address PRIMARY KEY (address_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Alter structure for table `wm_address`
--

ALTER TABLE `wm_address` ADD UNIQUE idx_address_customer_city (address_1, city_id, customer_id);

--
-- Dumping data for table `wm_address`
--
