/*
SQLyog Community v12.2.4 (64 bit)
MySQL - 10.4.11-MariaDB : Database - ecom
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ecom` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;

USE `ecom`;

/*Table structure for table `admins` */

DROP TABLE IF EXISTS `admins`;

CREATE TABLE `admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `admins` */

insert  into `admins`(`id`,`username`,`password`,`status`,`created_at`,`updated_at`) values 
(1,'admin','482c811da5d5b4bc6d497ffa98491e38',1,'2018-12-15 00:00:00','2020-07-09 07:02:08');

/*Table structure for table `banners` */

DROP TABLE IF EXISTS `banners`;

CREATE TABLE `banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `banners` */

insert  into `banners`(`id`,`image`,`title`,`link`,`status`,`created_at`,`updated_at`) values 
(1,'94972.png','Banner Image 1','products/t-shirts1',1,'2018-08-05 14:33:27','2018-08-07 15:59:17'),
(2,'66584.png','Banner Image','products/t-shirts',1,'2018-08-05 14:34:06','2018-08-05 14:34:06'),
(4,'71958.png','Test Banner','products/shoes',1,'2018-08-07 16:13:25','2018-08-07 16:13:25');

/*Table structure for table `cart` */

DROP TABLE IF EXISTS `cart`;

CREATE TABLE `cart` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `user_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cart` */

insert  into `cart`(`id`,`product_id`,`product_name`,`product_code`,`product_color`,`size`,`price`,`quantity`,`user_email`,`session_id`,`created_at`,`updated_at`) values 
(2,18,'Red TShirt','RT001-S','Red','Small',1000.00,2,'dandygantengkok@gmail.com','9pFZNOzn9n3QISQ2rSFvzSIIqVAltPITZume1a8l',NULL,NULL);

/*Table structure for table `categories` */

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT 0,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_keywords` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `categories` */

insert  into `categories`(`id`,`parent_id`,`name`,`description`,`url`,`meta_title`,`meta_description`,`meta_keywords`,`status`,`remember_token`,`created_at`,`updated_at`) values 
(1,0,'T-Shirts',NULL,'t-shirts','T-Shirts','High Quality T-Shirts','',1,NULL,'2018-03-26 16:20:29','2019-03-17 06:18:13'),
(2,0,'Shoes',NULL,'shoes','','','',1,NULL,'2018-03-26 17:25:46','2018-03-26 17:25:46'),
(3,1,'Formal T-Shirts','test','format-tshirts','','','',1,NULL,'2018-03-26 18:47:41','2018-03-26 19:03:19'),
(4,2,'Formal Shoes',NULL,'formal-shoes','','','',1,NULL,'2018-05-02 15:58:00','2018-05-02 15:58:00'),
(5,1,'Casual T-Shirts',NULL,'casual-t-shirts','','','',1,NULL,'2018-05-02 16:00:27','2018-05-20 05:34:21'),
(6,1,'Sports T-Shirts','test','sports-tshirts','','','',0,NULL,'2018-05-09 17:55:52','2019-06-07 15:28:06'),
(7,8,'Test T-shirts','tet','test','','','',0,NULL,'2018-05-09 17:56:56','2019-02-11 02:13:59'),
(8,0,'Shirts',NULL,'shirts','','','',1,NULL,'2018-11-30 19:10:39','2018-11-30 19:10:39'),
(9,1,'Round T-Shirts','Round T-Shirts','round-tshirts','Round T-Shirts','Round T-Shirts at best prices','round-tshirts, best prices, ecom website',1,NULL,'2019-03-17 06:10:09','2019-03-17 06:14:42');

/*Table structure for table `cms_pages` */

DROP TABLE IF EXISTS `cms_pages`;

CREATE TABLE `cms_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `url` varchar(30) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keywords` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `cms_pages` */

insert  into `cms_pages`(`id`,`title`,`description`,`url`,`meta_title`,`meta_description`,`meta_keywords`,`status`,`created_at`,`updated_at`) values 
(1,'About Us','About Us page is coming soon','about-us','About Us','E-com website having lot of products','about us',1,'2019-02-10 14:53:37','2019-03-16 17:10:33'),
(2,'Terms & Conditions','Terms & Condition is coming soon...','terms-conditions','','','',1,'2019-02-17 08:52:22','2019-02-17 10:22:22'),
(3,'Privacy Policy','Privacy Policy is coming soon','privacy-policy','','','',1,'2019-02-17 08:58:53','2019-02-17 10:29:46'),
(4,'Refund Policy','Page is coming soon..','refund-policy','E-com Website Refund Policy','Refund policy of our E-com website before apply for refund.','ecom website, refund policy',1,'2019-03-16 15:33:52','2019-03-16 17:06:39');

/*Table structure for table `cod_pincodes` */

DROP TABLE IF EXISTS `cod_pincodes`;

CREATE TABLE `cod_pincodes` (
  `id` int(11) NOT NULL,
  `pincode` varchar(20) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cod_pincodes` */

insert  into `cod_pincodes`(`id`,`pincode`,`city`,`state`,`created_at`,`updated_at`) values 
(1,'744104','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(2,'744208','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(3,'744107','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(4,'744201','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(5,'744302','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(6,'744301','Car Nicobar','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(7,'744202','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(8,'744102','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(9,'744211','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(10,'744207','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(11,'744103','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(12,'744209','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(13,'744304','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(14,'744203','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(15,'744101','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(16,'744204','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(17,'744101','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(18,'744303','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(19,'744104','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(20,'744105','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(21,'744210','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(22,'744101','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(23,'744205','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(24,'744106','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(25,'744206','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(26,'524002','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(27,'508207','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(28,'504251','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(29,'500463','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(30,'500890','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(31,'531001','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(32,'500030','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(33,'500049','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(34,'509343','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(35,'522004','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(36,'515001','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(37,'518543','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(38,'506144','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(39,'505208','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(40,'522015','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(41,'522403','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(42,'500004','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(43,'500252','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(44,'509375','Lingotam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(45,'534123','Achanta','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(46,'531011','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(47,'504001','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(48,'500463','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(49,'523201','Addanki','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(50,'523001','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(51,'533428','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(52,'504001','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(53,'504002','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(54,'505188','Adivarampet','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(55,'507101','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(56,'500007','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(57,'500032','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(58,'518301','Adoni','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(59,'518302','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(60,'518301','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(61,'518301','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(62,'508367','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(63,'500007','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(64,'522263','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(65,'500012','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(66,'516421','Agadur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(67,'515311','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(68,'501146','Agnoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(69,'522270','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(70,'534196','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(71,'522004','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(72,'500030','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(73,'500028','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(74,'523155','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(75,'501522','Ainapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(76,'522659','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(77,'500043','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(78,'508216','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(79,'520015','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(80,'532552','Ajjada','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(81,'534339','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(82,'516132','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(83,'534235','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(84,'534235','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(85,'516506','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(86,'530016','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(87,'532219','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(88,'517536','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(89,'518196','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(90,'521245','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(91,'509362','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(92,'531240','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(93,'509152','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(94,'533233','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(95,'534126','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(96,'533101','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(97,'505533','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(98,'505330','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(99,'508101','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(100,'502269','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(101,'518543','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(102,'533217','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(103,'502310','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(104,'530004','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(105,'503214','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(106,'524315','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(107,'524315','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(108,'509150','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(109,'501514','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(110,'518395','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(111,'509149','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(112,'509388','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(113,'515566','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(114,'532185','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(115,'532185','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(116,'501504','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(117,'533201','Amalapuram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(118,'533201','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(119,'515445','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(120,'509321','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(121,'509201','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(122,'515281','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(123,'522020','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(124,'522007','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(125,'509130','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(126,'509142','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(127,'533214','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(128,'503235','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(129,'505306','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(130,'502103','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(131,'500013','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(132,'500016','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(133,'509330','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(134,'515822','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(135,'523180','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(136,'532015','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(137,'508219','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(138,'522325','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(139,'508290','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(140,'531001','Anakapalle','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(141,'531001','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(142,'531001','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(143,'531001','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(144,'500004','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(145,'522003','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(146,'530042','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(147,'534111','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(148,'515001','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(149,'515002','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(150,'516357','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(151,'516105','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(152,'516228','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(153,'524302','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(154,'533222','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(155,'522301','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(156,'522014','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(157,'501105','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(158,'516116','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(159,'533342','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(160,'533342','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(161,'501201','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(162,'524004','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(163,'500044','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(164,'503215','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(165,'530003','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(166,'502273','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(167,'524203','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(168,'522211','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(169,'521330','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(170,'533307','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(171,'508290','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(172,'508227','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(173,'533406','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(174,'524304','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(175,'533252','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(176,'505466','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(177,'505514','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(178,'521176','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(179,'533557','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(180,'517325','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(181,'515455','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(182,'522310','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(183,'533005','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(184,'500049','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(185,'522503','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(186,'531230','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(187,'531149','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(188,'531151','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(189,'532401','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(190,'534230','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(191,'515001','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(192,'524119','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(193,'503224','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(194,'503224','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(195,'503224','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(196,'517330','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(197,'508112','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(198,'523335','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(199,'521114','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(200,'534152','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(201,'517129','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(202,'520002','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(203,'522002','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(204,'522601','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(205,'502220','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(206,'533104','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(207,'505173','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(208,'500020','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(209,'518005','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(210,'506133','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(211,'507116','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(212,'500028','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(213,'504293','Asifabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(214,'518347','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(215,'507301','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(216,'522409','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(217,'531011','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(218,'516501','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(219,'515751','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(220,'518422','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(221,'502292','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(222,'508111','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(223,'524322','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(224,'506342','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(225,'509131','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(226,'533235','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(227,'534134','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(228,'534134','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(229,'521211','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(230,'509363','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(231,'530012','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(232,'521121','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(233,'521121','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(234,'533230','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(235,'530001','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(236,'517109','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(237,'520003','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(238,'517278','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(239,'501504','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(240,'500038','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(241,'515862','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(242,'521102','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(243,'516227','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(244,'516227','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(245,'500264','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(246,'517415','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(247,'500048','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(248,'517194','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(249,'509202','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(250,'522202','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(251,'508206','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(252,'524002','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(253,'516484','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(254,'521001','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(255,'516484','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(256,'524129','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(257,'517561','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(258,'532557','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(259,'503217','Balkonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(260,'521177','Balusupadu','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(261,'518124','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(262,'518124','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(263,'505407','Bandankal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(264,'533221','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(265,'522021','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(266,'518523','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(267,'521179','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(268,'522663','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(269,'523226','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(270,'524404','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(271,'517416','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(272,'507202','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(273,'500034','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(274,'508213','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(275,'503187','Banswada','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(276,'503187','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(277,'506003','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(278,'502103','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(279,'503231','Bardipur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(280,'500027','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(281,'532263','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(282,'532264','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(283,'505187','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(284,'504101','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(285,'515306','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(286,'500001','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(287,'501143','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(288,'501528','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(289,'521001','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(290,'515661','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(291,'532456','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(292,'516164','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(293,'507127','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(294,'507211','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(295,'500004','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(296,'533242','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(297,'506002','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(298,'500039','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(299,'505188','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(300,'500012','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(301,'500016','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(302,'500003','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(303,'505528','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(304,'504324','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(305,'518462','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(306,'522411','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(307,'504251','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(308,'504251','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(309,'504251','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(310,'500049','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(311,'515741','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(312,'534001','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(313,'533409','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(314,'533210','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(315,'524126','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(316,'520002','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(317,'518599','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(318,'522279','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(319,'521301','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(320,'507111','Bhadrachalam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(321,'534251','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(322,'504001','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(323,'518004','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(324,'504103','Bhainsa','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(325,'507101','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(326,'517501','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(327,'530012','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(328,'502103','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(329,'518301','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(330,'533003','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(331,'521001','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(332,'521140','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(333,'522256','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(334,'521118','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(335,'521231','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(336,'500002','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(337,'503115','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(338,'531241','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(339,'533514','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(340,'531163','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(341,'504204','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(342,'505471','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(343,'503101','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(344,'503307','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(345,'517106','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(346,'534201','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(347,'534301','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(348,'534203','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(349,'533410','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(350,'534301','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(351,'503307','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(352,'505101','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(353,'531216','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(354,'508116','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(355,'500003','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(356,'500003','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(357,'508116','Bhongir','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(358,'508116','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(359,'508224','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(360,'504001','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(361,'507112','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(362,'509382','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(363,'508126','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(364,'503125','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(365,'533343','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(366,'503306','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(367,'505475','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(368,'509203','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(369,'505475','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(370,'509145','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(371,'523106','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(372,'503321','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(373,'524142','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(374,'524142','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(375,'504304','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(376,'532573','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(377,'532573','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(378,'532558','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(379,'532558','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(380,'532558','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(381,'533215','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(382,'518146','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(383,'503185','Bodhan','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(384,'503185','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(385,'522354','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(386,'522354','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(387,'524142','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(388,'516392','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(389,'500010','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(390,'516360','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(391,'518517','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(392,'517134','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(393,'515763','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(394,'505480','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(395,'507204','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(396,'508126','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(397,'505472','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(398,'501502','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(399,'509345','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(400,'531160','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(401,'534207','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(402,'515427','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(403,'531260','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(404,'508105','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(405,'532408','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(406,'517146','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(407,'505524','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(408,'517108','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(409,'523155','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(410,'523110','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(411,'500361','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(412,'500011','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(413,'524346','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(414,'521370','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(415,'522214','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(416,'518432','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(417,'532220','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(418,'522002','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(419,'524001','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(420,'501202','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(421,'517111','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(422,'506221','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(423,'524305','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(424,'520002','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(425,'522013','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(426,'509213','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(427,'515241','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(428,'532427','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(429,'504106','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(430,'524003','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(431,'515144','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(432,'515144','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(433,'504106','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(434,'517351','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(435,'532417','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(436,'507114','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(437,'507001','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(438,'532445','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(439,'532551','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(440,'522601','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(441,'522201','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(442,'502110','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(443,'524305','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(444,'532312','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(445,'503111','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(446,'522010','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(447,'532502','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(448,'500003','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(449,'530006','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(450,'505102','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(451,'521001','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(452,'534448','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(453,'508001','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(454,'501158','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(455,'517001','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(456,'517001','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(457,'517001','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(458,'517002','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(459,'532406','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(460,'503180','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(461,'507154','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(462,'508202','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(463,'506381','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(464,'532406','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(465,'516001','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(466,'516001','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(467,'516001','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(468,'516001','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(469,'516001','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(470,'516001','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(471,'516001','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(472,'516001','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(473,'518206','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(474,'504209','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(475,'500013','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(476,'500022','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(477,'500768','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(478,'500134','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(479,'534196','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(480,'515813','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(481,'508111','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(482,'506301','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(483,'518553','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(484,'534342','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(485,'500171','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(486,'500036','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(487,'524221','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(488,'516260','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(489,'508350','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(490,'533503','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(491,'521126','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(492,'532581','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(493,'515419','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(494,'505505','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(495,'500024','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(496,'508259','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(497,'515458','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(498,'509115','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(499,'521182','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(500,'522311','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(501,'522007','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(502,'517101','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(503,'517101','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(504,'520010','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(505,'507135','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(506,'500264','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(507,'508116','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(508,'508255','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(509,'505505','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(510,'532216','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(511,'518675','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(512,'502221','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(513,'517260','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(514,'507133','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(515,'534004','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(516,'522274','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(517,'522277','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(518,'523188','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(519,'515843','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(520,'533449','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(521,'522212','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(522,'505412','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(523,'502255','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(524,'509333','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(525,'509332','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(526,'501516','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(527,'533261','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(528,'505468','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(529,'506168','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(530,'517417','Chembakur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(531,'517417','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(532,'530001','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(533,'515101','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(534,'516502','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(535,'506332','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(536,'506332','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(537,'516162','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(538,'524406','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(539,'503228','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(540,'508013','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(541,'517305','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(542,'517305','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(543,'522309','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1,'744104','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(2,'744208','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(3,'744107','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(4,'744201','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(5,'744302','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(6,'744301','Car Nicobar','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(7,'744202','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(8,'744102','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(9,'744211','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(10,'744207','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(11,'744103','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(12,'744209','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(13,'744304','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(14,'744203','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(15,'744101','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(16,'744204','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(17,'744101','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(18,'744303','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(19,'744104','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(20,'744105','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(21,'744210','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(22,'744101','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(23,'744205','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(24,'744106','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(25,'744206','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(26,'524002','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(27,'508207','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(28,'504251','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(29,'500463','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(30,'500890','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(31,'531001','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(32,'500030','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(33,'500049','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(34,'509343','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(35,'522004','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(36,'515001','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(37,'518543','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(38,'506144','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(39,'505208','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(40,'522015','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(41,'522403','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(42,'500004','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(43,'500252','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(44,'509375','Lingotam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(45,'534123','Achanta','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(46,'531011','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(47,'504001','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(48,'500463','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(49,'523201','Addanki','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(50,'523001','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(51,'533428','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(52,'504001','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(53,'504002','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(54,'505188','Adivarampet','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(55,'507101','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(56,'500007','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(57,'500032','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(58,'518301','Adoni','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(59,'518302','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(60,'518301','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(61,'518301','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(62,'508367','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(63,'500007','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(64,'522263','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(65,'500012','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(66,'516421','Agadur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(67,'515311','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(68,'501146','Agnoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(69,'522270','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(70,'534196','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(71,'522004','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(72,'500030','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(73,'500028','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(74,'523155','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(75,'501522','Ainapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(76,'522659','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(77,'500043','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(78,'508216','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(79,'520015','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(80,'532552','Ajjada','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(81,'534339','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(82,'516132','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(83,'534235','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(84,'534235','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(85,'516506','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(86,'530016','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(87,'532219','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(88,'517536','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(89,'518196','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(90,'521245','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(91,'509362','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(92,'531240','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(93,'509152','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(94,'533233','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(95,'534126','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(96,'533101','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(97,'505533','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(98,'505330','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(99,'508101','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(100,'502269','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(101,'518543','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(102,'533217','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(103,'502310','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(104,'530004','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(105,'503214','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(106,'524315','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(107,'524315','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(108,'509150','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(109,'501514','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(110,'518395','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(111,'509149','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(112,'509388','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(113,'515566','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(114,'532185','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(115,'532185','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(116,'501504','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(117,'533201','Amalapuram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(118,'533201','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(119,'515445','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(120,'509321','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(121,'509201','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(122,'515281','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(123,'522020','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(124,'522007','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(125,'509130','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(126,'509142','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(127,'533214','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(128,'503235','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(129,'505306','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(130,'502103','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(131,'500013','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(132,'500016','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(133,'509330','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(134,'515822','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(135,'523180','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(136,'532015','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(137,'508219','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(138,'522325','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(139,'508290','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(140,'531001','Anakapalle','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(141,'531001','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(142,'531001','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(143,'531001','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(144,'500004','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(145,'522003','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(146,'530042','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(147,'534111','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(148,'515001','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(149,'515002','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(150,'516357','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(151,'516105','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(152,'516228','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(153,'524302','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(154,'533222','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(155,'522301','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(156,'522014','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(157,'501105','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(158,'516116','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(159,'533342','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(160,'533342','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(161,'501201','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(162,'524004','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(163,'500044','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(164,'503215','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(165,'530003','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(166,'502273','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(167,'524203','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(168,'522211','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(169,'521330','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(170,'533307','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(171,'508290','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(172,'508227','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(173,'533406','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(174,'524304','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(175,'533252','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(176,'505466','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(177,'505514','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(178,'521176','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(179,'533557','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(180,'517325','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(181,'515455','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(182,'522310','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(183,'533005','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(184,'500049','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(185,'522503','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(186,'531230','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(187,'531149','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(188,'531151','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(189,'532401','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(190,'534230','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(191,'515001','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(192,'524119','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(193,'503224','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(194,'503224','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(195,'503224','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(196,'517330','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(197,'508112','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(198,'523335','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(199,'521114','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(200,'534152','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(201,'517129','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(202,'520002','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(203,'522002','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(204,'522601','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(205,'502220','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(206,'533104','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(207,'505173','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(208,'500020','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(209,'518005','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(210,'506133','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(211,'507116','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(212,'500028','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(213,'504293','Asifabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(214,'518347','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(215,'507301','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(216,'522409','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(217,'531011','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(218,'516501','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(219,'515751','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(220,'518422','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(221,'502292','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(222,'508111','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(223,'524322','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(224,'506342','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(225,'509131','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(226,'533235','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(227,'534134','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(228,'534134','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(229,'521211','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(230,'509363','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(231,'530012','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(232,'521121','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(233,'521121','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(234,'533230','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(235,'530001','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(236,'517109','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(237,'520003','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(238,'517278','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(239,'501504','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(240,'500038','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(241,'515862','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(242,'521102','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(243,'516227','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(244,'516227','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(245,'500264','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(246,'517415','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(247,'500048','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(248,'517194','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(249,'509202','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(250,'522202','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(251,'508206','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(252,'524002','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(253,'516484','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(254,'521001','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(255,'516484','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(256,'524129','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(257,'517561','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(258,'532557','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(259,'503217','Balkonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(260,'521177','Balusupadu','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(261,'518124','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(262,'518124','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(263,'505407','Bandankal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(264,'533221','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(265,'522021','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(266,'518523','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(267,'521179','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(268,'522663','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(269,'523226','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(270,'524404','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(271,'517416','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(272,'507202','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(273,'500034','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(274,'508213','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(275,'503187','Banswada','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(276,'503187','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(277,'506003','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(278,'502103','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(279,'503231','Bardipur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(280,'500027','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(281,'532263','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(282,'532264','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(283,'505187','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(284,'504101','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(285,'515306','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(286,'500001','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(287,'501143','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(288,'501528','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(289,'521001','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(290,'515661','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(291,'532456','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(292,'516164','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(293,'507127','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(294,'507211','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(295,'500004','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(296,'533242','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(297,'506002','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(298,'500039','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(299,'505188','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(300,'500012','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(301,'500016','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(302,'500003','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(303,'505528','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(304,'504324','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(305,'518462','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(306,'522411','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(307,'504251','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(308,'504251','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(309,'504251','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(310,'500049','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(311,'515741','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(312,'534001','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(313,'533409','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(314,'533210','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(315,'524126','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(316,'520002','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(317,'518599','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(318,'522279','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(319,'521301','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(320,'507111','Bhadrachalam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(321,'534251','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(322,'504001','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(323,'518004','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(324,'504103','Bhainsa','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(325,'507101','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(326,'517501','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(327,'530012','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(328,'502103','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(329,'518301','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(330,'533003','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(331,'521001','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(332,'521140','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(333,'522256','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(334,'521118','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(335,'521231','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(336,'500002','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(337,'503115','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(338,'531241','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(339,'533514','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(340,'531163','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(341,'504204','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(342,'505471','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(343,'503101','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(344,'503307','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(345,'517106','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(346,'534201','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(347,'534301','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(348,'534203','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(349,'533410','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(350,'534301','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(351,'503307','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(352,'505101','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(353,'531216','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(354,'508116','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(355,'500003','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(356,'500003','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(357,'508116','Bhongir','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(358,'508116','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(359,'508224','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(360,'504001','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(361,'507112','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(362,'509382','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(363,'508126','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(364,'503125','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(365,'533343','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(366,'503306','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(367,'505475','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(368,'509203','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(369,'505475','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(370,'509145','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(371,'523106','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(372,'503321','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(373,'524142','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(374,'524142','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(375,'504304','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(376,'532573','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(377,'532573','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(378,'532558','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(379,'532558','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(380,'532558','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(381,'533215','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(382,'518146','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(383,'503185','Bodhan','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(384,'503185','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(385,'522354','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(386,'522354','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(387,'524142','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(388,'516392','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(389,'500010','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(390,'516360','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(391,'518517','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(392,'517134','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(393,'515763','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(394,'505480','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(395,'507204','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(396,'508126','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(397,'505472','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(398,'501502','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(399,'509345','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(400,'531160','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(401,'534207','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(402,'515427','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(403,'531260','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(404,'508105','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(405,'532408','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(406,'517146','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(407,'505524','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(408,'517108','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(409,'523155','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(410,'523110','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(411,'500361','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(412,'500011','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(413,'524346','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(414,'521370','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(415,'522214','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(416,'518432','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(417,'532220','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(418,'522002','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(419,'524001','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(420,'501202','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(421,'517111','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(422,'506221','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(423,'524305','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(424,'520002','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(425,'522013','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(426,'509213','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(427,'515241','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(428,'532427','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(429,'504106','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(430,'524003','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(431,'515144','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(432,'515144','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(433,'504106','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(434,'517351','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(435,'532417','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(436,'507114','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(437,'507001','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(438,'532445','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(439,'532551','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(440,'522601','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(441,'522201','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(442,'502110','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(443,'524305','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(444,'532312','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(445,'503111','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(446,'522010','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(447,'532502','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(448,'500003','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(449,'530006','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(450,'505102','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(451,'521001','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(452,'534448','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(453,'508001','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(454,'501158','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(455,'517001','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(456,'517001','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(457,'517001','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(458,'517002','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(459,'532406','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(460,'503180','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(461,'507154','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(462,'508202','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(463,'506381','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(464,'532406','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(465,'516001','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(466,'516001','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(467,'516001','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(468,'516001','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(469,'516001','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(470,'516001','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(471,'516001','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(472,'516001','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(473,'518206','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(474,'504209','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(475,'500013','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(476,'500022','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(477,'500768','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(478,'500134','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(479,'534196','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(480,'515813','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(481,'508111','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(482,'506301','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(483,'518553','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(484,'534342','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(485,'500171','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(486,'500036','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(487,'524221','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(488,'516260','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(489,'508350','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(490,'533503','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(491,'521126','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(492,'532581','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(493,'515419','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(494,'505505','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(495,'500024','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(496,'508259','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(497,'515458','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(498,'509115','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(499,'521182','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(500,'522311','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(501,'522007','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(502,'517101','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(503,'517101','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(504,'520010','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(505,'507135','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(506,'500264','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(507,'508116','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(508,'508255','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(509,'505505','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(510,'532216','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(511,'518675','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(512,'502221','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(513,'517260','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(514,'507133','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(515,'534004','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(516,'522274','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(517,'522277','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(518,'523188','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(519,'515843','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(520,'533449','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(521,'522212','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(522,'505412','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(523,'502255','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(524,'509333','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(525,'509332','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(526,'501516','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(527,'533261','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(528,'505468','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(529,'506168','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(530,'517417','Chembakur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(531,'517417','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(532,'530001','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(533,'515101','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(534,'516502','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(535,'506332','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(536,'506332','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(537,'516162','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(538,'524406','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(539,'503228','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(540,'508013','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(541,'517305','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(542,'517305','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(543,'522309','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(544,'508258','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(545,'517390','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(546,'507169','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(547,'507169','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(548,'501503','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(549,'533225','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(550,'517517','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(551,'500020','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(552,'502374','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(553,'521002','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(554,'516310','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(555,'515341','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(556,'500025','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(557,'508230','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(558,'521178','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(559,'524412','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(560,'522332','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(561,'523226','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(562,'508116','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(563,'532001','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(564,'531163','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(565,'523135','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(566,'509218','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(567,'501143','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(568,'509243','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(569,'508287','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(570,'501512','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(571,'530023','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(572,'516109','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(573,'522299','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(574,'522201','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(575,'504110','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(576,'517193','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(577,'516433','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(578,'516165','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(579,'516214','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(580,'515422','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(581,'509141','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(582,'534486','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(583,'504201','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(584,'522620','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(585,'508250','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(586,'531111','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(587,'517277','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(588,'507208','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(589,'509111','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(590,'534460','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(591,'502299','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(592,'533232','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(593,'521001','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(594,'507126','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(595,'532128','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(596,'502220','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(597,'523155','Chirala','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(598,'523155','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(599,'523124','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(600,'504294','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(601,'521128','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(602,'506223','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(603,'501113','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(604,'531162','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(605,'517198','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(606,'520009','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(607,'517001','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(608,'517002','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(609,'517004','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(610,'517003','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(611,'516104','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(612,'508114','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(613,'506356','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(614,'509109','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(615,'522298','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(616,'521117','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(617,'523285','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(618,'531036','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(619,'522264','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(620,'505415','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(621,'521251','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(622,'533461','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(623,'522006','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(624,'508252','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(625,'522003','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(626,'517257','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(627,'520005','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(628,'515415','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(629,'507001','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(630,'533002','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(631,'521001','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(632,'515001','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(633,'515004','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(634,'522403','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(635,'508002','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(636,'523001','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(637,'518202','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(638,'524201','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(639,'532001','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(640,'533203','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(641,'504001','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(642,'534275','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(643,'534211','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(644,'500037','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(645,'504001','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(646,'532284','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(647,'500005','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(648,'516001','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(649,'516163','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(650,'516004','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(651,'523333','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(652,'523333','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(653,'505184','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(654,'534390','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(655,'530020','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(656,'507003','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(657,'500023','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(658,'517152','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(659,'509407','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(660,'508375','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(661,'524152','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(662,'505476','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(663,'507306','Dammapeta','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(664,'533103','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(665,'504206','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(666,'533263','Dangeru','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(667,'522297','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(668,'524003','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(669,'500024','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(670,'503165','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(671,'523267','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(672,'523247','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(673,'531202','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(674,'506315','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(675,'500028','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(676,'518669','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(677,'533240','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(678,'515332','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(679,'503124','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(680,'507206','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(681,'520050','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(682,'530009','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(683,'521001','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(684,'506006','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(685,'522050','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(686,'516441','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(687,'523277','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(688,'506011','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(689,'518465','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(690,'504218','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(691,'508248','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(692,'509204','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(693,'531030','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(694,'534313','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(695,'506302','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(696,'533339','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(697,'502305','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(698,'509205','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(699,'505425','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(700,'503230','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(701,'503145','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(702,'506330','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(703,'534462','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(704,'506330','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(705,'515671','Dharmavaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(706,'533430','Dharmavaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(707,'531148','Dharmavaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(708,'515671','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(709,'515672','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(710,'509133','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(711,'501121','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(712,'518222','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(713,'518222','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(714,'500006','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(715,'522258','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(716,'503175','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(717,'502321','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(718,'500036','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(719,'504306','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(720,'531061','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(721,'522276','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(722,'508258','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(723,'518021','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(724,'534314','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(725,'508333','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(726,'534239','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(727,'505002','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(728,'530002','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(729,'521002','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(730,'520001','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(731,'534202','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(732,'534266','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(733,'521332','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(734,'501525','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(735,'503123','Domakonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(736,'516431','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(737,'534351','Dommeru','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(738,'504207','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(739,'523305','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(740,'508272','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(741,'522503','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(742,'530004','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(743,'531135','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(744,'522002','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(745,'531110','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(746,'522002','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(747,'503314','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(748,'532578','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(749,'502334','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(750,'506381','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(751,'517110','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(752,'518135','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(753,'533292','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(754,'533125','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(755,'500762','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(756,'532001','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(757,'533262','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(758,'523002','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(759,'502108','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(760,'502277','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(761,'524102','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(762,'522330','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(763,'521202','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(764,'507137','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(765,'523330','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(766,'520002','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(767,'517583','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(768,'520003','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(769,'522612','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(770,'532484','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(771,'524222','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(772,'534156','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(773,'516175','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(774,'524306','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(775,'533341','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(776,'534426','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(777,'530016','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(778,'500026','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(779,'534001','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(780,'504307','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(781,'500762','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(782,'523356','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(783,'509307','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(784,'500023','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(785,'522233','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(786,'522340','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(787,'503202','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(788,'521144','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(789,'518017','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(790,'516271','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(791,'504106','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(792,'517592','Ekambara kuppam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(793,'501103','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(794,'521148','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(795,'505525','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(796,'505401','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(797,'505188','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(798,'534268','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(799,'534001','Eluru','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(800,'534001','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(801,'534006','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(802,'534006','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(803,'534006','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(804,'534006','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(805,'534005','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(806,'534006','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(807,'522308','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(808,'500021','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(809,'505526','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(810,'533003','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(811,'500007','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(812,'521001','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(813,'507168','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(814,'517240','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(815,'500018','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(816,'523327','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(817,'500004','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(818,'500027','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(819,'523280','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(820,'531082','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(821,'522017','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(822,'522003','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(823,'506165','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(824,'522003','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(825,'500253','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(826,'500265','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(827,'500018','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(828,'502110','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(829,'503220','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(830,'524003','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(831,'506003','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(832,'534275','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(833,'505210','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(834,'502110','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(835,'533101','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(836,'506008','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(837,'530001','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(838,'524101','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(839,'524101','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(840,'533285','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(841,'500004','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(842,'522001','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(843,'522001','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(844,'522001','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(845,'522001','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(846,'522001','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(847,'522001','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(848,'521101','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(849,'521101','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(850,'500032','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(851,'500032','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(852,'515844','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(853,'509125','Gadwal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(854,'509323','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(855,'500029','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(856,'531270','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(857,'523315','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(858,'503001','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(859,'518583','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(860,'517141','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(861,'531201','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(862,'530026','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(863,'521109','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(864,'516120','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(865,'516267','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(866,'521403','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(867,'534198','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(868,'524317','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(869,'503114','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(870,'515001','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(871,'533201','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(872,'500001','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(873,'504001','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(874,'522403','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(875,'505301','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(876,'507003','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(877,'509103','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(878,'530005','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(879,'503001','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(880,'500003','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(881,'521123','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(882,'531001','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(883,'533004','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(884,'522201','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(885,'500380','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(886,'508248','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(887,'520003','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(888,'520003','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(889,'521202','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(890,'531001','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(891,'534002','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(892,'530003','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(893,'533103','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(894,'517325','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(895,'505001','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(896,'521201','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(897,'524236','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(898,'515521','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(899,'505445','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(900,'517125','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(901,'522271','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(902,'509306','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(903,'531029','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(904,'501115','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(905,'517564','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(906,'516319','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(907,'505474','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(908,'521101','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(909,'531215','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(910,'532405','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(911,'532102','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(912,'508201','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(913,'518452','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(914,'507210','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(915,'515731','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(916,'505186','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(917,'532463','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(918,'505471','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(919,'531075','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(920,'515004','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(921,'506345','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(922,'506143','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(923,'521133','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(924,'501301','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(925,'509173','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(926,'523357','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(927,'523357','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(928,'523357','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(929,'501151','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(930,'503001','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(931,'506244','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(932,'501102','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(933,'505209','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(934,'521001','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(935,'507158','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(936,'533286','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(937,'508286','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(938,'500008','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(939,'500020','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(940,'533468','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(941,'517147','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(942,'521111','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(943,'515866','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(944,'505532','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(945,'509303','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(946,'533445','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(947,'507174','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(948,'518138','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(949,'533344','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(950,'534362','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(951,'521322','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(952,'508381','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(953,'518463','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(954,'515401','Gooty','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(955,'515401','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(956,'515401','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(957,'515402','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(958,'523001','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(959,'509206','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(960,'530027','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(961,'533274','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(962,'534316','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(963,'534450','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(964,'507214','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(965,'516233','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(966,'534260','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(967,'515231','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(968,'523246','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(969,'500015','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(970,'507134','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(971,'531023','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(972,'515292','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(973,'506344','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(974,'533105','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(975,'530040','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(976,'530040','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(977,'533450','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(978,'501403','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(979,'515233','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(980,'534350','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(981,'507138','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(982,'504208','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(983,'506002','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(984,'515801','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(985,'500265','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(986,'515271','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(987,'508238','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(988,'508257','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(989,'504308','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(990,'521301','Gudivada','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(991,'521301','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(992,'521301','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(993,'509221','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(994,'521356','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(995,'523281','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(996,'518466','Gudur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(997,'508127','Gudur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(998,'524101','Gudur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(999,'506134','Gudur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1000,'517161','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1001,'532005','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1002,'502278','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1003,'502278','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1004,'502278','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1005,'524407','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1006,'505304','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1007,'504309','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1008,'508257','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1009,'515863','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1010,'532523','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1011,'534267','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1012,'524234','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1013,'500001','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1014,'520005','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1015,'524414','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1016,'501515','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1017,'534116','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1018,'523240','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1019,'523243','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1020,'516438','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1021,'509342','Gundmal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1022,'534427','Gundugolanu','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1023,'518150','Gundupapala','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1024,'509341','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1025,'501521','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1026,'515801','Guntakal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1027,'522024','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1028,'522026','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1029,'522036','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1030,'522001','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1031,'522003','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1032,'522004','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1033,'522004','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1034,'504322','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1035,'502211','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1036,'503001','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1037,'531303','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1038,'517297','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1039,'533101','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1040,'522281','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1041,'533014','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1042,'534343','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1043,'507003','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1044,'515164','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1045,'518426','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1046,'517213','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1047,'530004','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1048,'500010','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1049,'504344','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1050,'518348','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1051,'515282','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1052,'518333','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1053,'500029','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1054,'508116','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1055,'506001','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1056,'506011','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1057,'502251','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1058,'518470','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1059,'500014','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1060,'509001','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1061,'521105','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1062,'502001','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1063,'534211','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1064,'523227','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1065,'520003','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1066,'515801','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1067,'532243','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1068,'515872','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1069,'532550','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1070,'506371','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1071,'504305','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1072,'502297','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1073,'502113','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1074,'501505','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1075,'508126','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1076,'515286','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1077,'500266','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1078,'508202','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1079,'501504','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1080,'500029','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1081,'500029','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1082,'500001','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1083,'515201','Hindupur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1084,'515202','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1,'744104','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(2,'744208','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(3,'744107','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(4,'744201','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(5,'744302','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(6,'744301','Car Nicobar','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(7,'744202','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(8,'744102','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(9,'744211','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(10,'744207','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(11,'744103','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(12,'744209','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(13,'744304','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(14,'744203','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(15,'744101','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(16,'744204','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(17,'744101','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(18,'744303','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(19,'744104','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(20,'744105','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(21,'744210','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(22,'744101','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(23,'744205','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(24,'744106','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(25,'744206','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(26,'524002','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(27,'508207','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(28,'504251','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(29,'500463','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(30,'500890','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(31,'531001','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(32,'500030','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(33,'500049','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(34,'509343','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(35,'522004','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(36,'515001','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(37,'518543','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(38,'506144','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(39,'505208','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(40,'522015','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(41,'522403','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(42,'500004','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(43,'500252','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(44,'509375','Lingotam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(45,'534123','Achanta','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(46,'531011','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(47,'504001','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(48,'500463','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(49,'523201','Addanki','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(50,'523001','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(51,'533428','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(52,'504001','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(53,'504002','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(54,'505188','Adivarampet','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(55,'507101','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(56,'500007','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(57,'500032','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(58,'518301','Adoni','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(59,'518302','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(60,'518301','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(61,'518301','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(62,'508367','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(63,'500007','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(64,'522263','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(65,'500012','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(66,'516421','Agadur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(67,'515311','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(68,'501146','Agnoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(69,'522270','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(70,'534196','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(71,'522004','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(72,'500030','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(73,'500028','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(74,'523155','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(75,'501522','Ainapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(76,'522659','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(77,'500043','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(78,'508216','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(79,'520015','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(80,'532552','Ajjada','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(81,'534339','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(82,'516132','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(83,'534235','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(84,'534235','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(85,'516506','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(86,'530016','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(87,'532219','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(88,'517536','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(89,'518196','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(90,'521245','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(91,'509362','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(92,'531240','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(93,'509152','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(94,'533233','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(95,'534126','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(96,'533101','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(97,'505533','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(98,'505330','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(99,'508101','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(100,'502269','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(101,'518543','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(102,'533217','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(103,'502310','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(104,'530004','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(105,'503214','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(106,'524315','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(107,'524315','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(108,'509150','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(109,'501514','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(110,'518395','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(111,'509149','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(112,'509388','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(113,'515566','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(114,'532185','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(115,'532185','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(116,'501504','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(117,'533201','Amalapuram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(118,'533201','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(119,'515445','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(120,'509321','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(121,'509201','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(122,'515281','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(123,'522020','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(124,'522007','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(125,'509130','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(126,'509142','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(127,'533214','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(128,'503235','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(129,'505306','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(130,'502103','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(131,'500013','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(132,'500016','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(133,'509330','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(134,'515822','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(135,'523180','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(136,'532015','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(137,'508219','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(138,'522325','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(139,'508290','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(140,'531001','Anakapalle','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(141,'531001','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(142,'531001','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(143,'531001','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(144,'500004','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(145,'522003','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(146,'530042','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(147,'534111','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(148,'515001','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(149,'515002','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(150,'516357','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(151,'516105','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(152,'516228','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(153,'524302','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(154,'533222','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(155,'522301','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(156,'522014','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(157,'501105','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(158,'516116','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(159,'533342','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(160,'533342','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(161,'501201','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(162,'524004','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(163,'500044','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(164,'503215','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(165,'530003','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(166,'502273','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(167,'524203','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(168,'522211','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(169,'521330','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(170,'533307','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(171,'508290','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(172,'508227','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(173,'533406','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(174,'524304','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(175,'533252','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(176,'505466','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(177,'505514','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(178,'521176','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(179,'533557','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(180,'517325','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(181,'515455','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(182,'522310','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(183,'533005','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(184,'500049','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(185,'522503','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(186,'531230','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(187,'531149','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(188,'531151','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(189,'532401','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(190,'534230','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(191,'515001','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(192,'524119','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(193,'503224','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(194,'503224','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(195,'503224','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(196,'517330','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(197,'508112','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(198,'523335','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(199,'521114','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(200,'534152','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(201,'517129','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(202,'520002','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(203,'522002','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(204,'522601','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(205,'502220','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(206,'533104','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(207,'505173','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(208,'500020','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(209,'518005','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(210,'506133','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(211,'507116','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(212,'500028','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(213,'504293','Asifabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(214,'518347','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(215,'507301','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(216,'522409','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(217,'531011','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(218,'516501','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(219,'515751','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(220,'518422','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(221,'502292','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(222,'508111','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(223,'524322','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(224,'506342','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(225,'509131','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(226,'533235','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(227,'534134','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(228,'534134','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(229,'521211','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(230,'509363','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(231,'530012','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(232,'521121','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(233,'521121','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(234,'533230','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(235,'530001','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(236,'517109','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(237,'520003','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(238,'517278','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(239,'501504','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(240,'500038','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(241,'515862','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(242,'521102','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(243,'516227','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(244,'516227','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(245,'500264','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(246,'517415','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(247,'500048','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(248,'517194','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(249,'509202','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(250,'522202','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(251,'508206','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(252,'524002','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(253,'516484','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(254,'521001','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(255,'516484','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(256,'524129','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(257,'517561','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(258,'532557','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(259,'503217','Balkonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(260,'521177','Balusupadu','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(261,'518124','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(262,'518124','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(263,'505407','Bandankal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(264,'533221','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(265,'522021','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(266,'518523','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(267,'521179','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(268,'522663','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(269,'523226','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(270,'524404','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(271,'517416','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(272,'507202','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(273,'500034','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(274,'508213','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(275,'503187','Banswada','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(276,'503187','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(277,'506003','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(278,'502103','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(279,'503231','Bardipur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(280,'500027','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(281,'532263','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(282,'532264','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(283,'505187','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(284,'504101','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(285,'515306','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(286,'500001','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(287,'501143','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(288,'501528','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(289,'521001','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(290,'515661','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(291,'532456','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(292,'516164','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(293,'507127','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(294,'507211','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(295,'500004','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(296,'533242','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(297,'506002','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(298,'500039','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(299,'505188','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(300,'500012','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(301,'500016','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(302,'500003','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(303,'505528','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(304,'504324','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(305,'518462','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(306,'522411','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(307,'504251','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(308,'504251','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(309,'504251','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(310,'500049','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(311,'515741','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(312,'534001','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(313,'533409','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(314,'533210','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(315,'524126','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(316,'520002','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(317,'518599','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(318,'522279','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(319,'521301','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(320,'507111','Bhadrachalam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(321,'534251','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(322,'504001','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(323,'518004','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(324,'504103','Bhainsa','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(325,'507101','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(326,'517501','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(327,'530012','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(328,'502103','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(329,'518301','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(330,'533003','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(331,'521001','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(332,'521140','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(333,'522256','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(334,'521118','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(335,'521231','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(336,'500002','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(337,'503115','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(338,'531241','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(339,'533514','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(340,'531163','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(341,'504204','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(342,'505471','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(343,'503101','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(344,'503307','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(345,'517106','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(346,'534201','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(347,'534301','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(348,'534203','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(349,'533410','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(350,'534301','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(351,'503307','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(352,'505101','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(353,'531216','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(354,'508116','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(355,'500003','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(356,'500003','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(357,'508116','Bhongir','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(358,'508116','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(359,'508224','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(360,'504001','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(361,'507112','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(362,'509382','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(363,'508126','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(364,'503125','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(365,'533343','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(366,'503306','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(367,'505475','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(368,'509203','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(369,'505475','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(370,'509145','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(371,'523106','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(372,'503321','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(373,'524142','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(374,'524142','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(375,'504304','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(376,'532573','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(377,'532573','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(378,'532558','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(379,'532558','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(380,'532558','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(381,'533215','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(382,'518146','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(383,'503185','Bodhan','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(384,'503185','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(385,'522354','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(386,'522354','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(387,'524142','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(388,'516392','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(389,'500010','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(390,'516360','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(391,'518517','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(392,'517134','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(393,'515763','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(394,'505480','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(395,'507204','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(396,'508126','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(397,'505472','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(398,'501502','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(399,'509345','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(400,'531160','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(401,'534207','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(402,'515427','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(403,'531260','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(404,'508105','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(405,'532408','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(406,'517146','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(407,'505524','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(408,'517108','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(409,'523155','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(410,'523110','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(411,'500361','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(412,'500011','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(413,'524346','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(414,'521370','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(415,'522214','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(416,'518432','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(417,'532220','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(418,'522002','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(419,'524001','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(420,'501202','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(421,'517111','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(422,'506221','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(423,'524305','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(424,'520002','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(425,'522013','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(426,'509213','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(427,'515241','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(428,'532427','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(429,'504106','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(430,'524003','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(431,'515144','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(432,'515144','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(433,'504106','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(434,'517351','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(435,'532417','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(436,'507114','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(437,'507001','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(438,'532445','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(439,'532551','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(440,'522601','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(441,'522201','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(442,'502110','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(443,'524305','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(444,'532312','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(445,'503111','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(446,'522010','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(447,'532502','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(448,'500003','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(449,'530006','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(450,'505102','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(451,'521001','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(452,'534448','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(453,'508001','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(454,'501158','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(455,'517001','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(456,'517001','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(457,'517001','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(458,'517002','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(459,'532406','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(460,'503180','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(461,'507154','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(462,'508202','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(463,'506381','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(464,'532406','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(465,'516001','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(466,'516001','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(467,'516001','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(468,'516001','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(469,'516001','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(470,'516001','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(471,'516001','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(472,'516001','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(473,'518206','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(474,'504209','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(475,'500013','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(476,'500022','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(477,'500768','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(478,'500134','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(479,'534196','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(480,'515813','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(481,'508111','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(482,'506301','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(483,'518553','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(484,'534342','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(485,'500171','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(486,'500036','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(487,'524221','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(488,'516260','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(489,'508350','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(490,'533503','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(491,'521126','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(492,'532581','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(493,'515419','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(494,'505505','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(495,'500024','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(496,'508259','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(497,'515458','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(498,'509115','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(499,'521182','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(500,'522311','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(501,'522007','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(502,'517101','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(503,'517101','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(504,'520010','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(505,'507135','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(506,'500264','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(507,'508116','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(508,'508255','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(509,'505505','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(510,'532216','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(511,'518675','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(512,'502221','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(513,'517260','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(514,'507133','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(515,'534004','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(516,'522274','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(517,'522277','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(518,'523188','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(519,'515843','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(520,'533449','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(521,'522212','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(522,'505412','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(523,'502255','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(524,'509333','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(525,'509332','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(526,'501516','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(527,'533261','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(528,'505468','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(529,'506168','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(530,'517417','Chembakur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(531,'517417','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(532,'530001','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(533,'515101','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(534,'516502','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(535,'506332','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(536,'506332','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(537,'516162','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(538,'524406','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(539,'503228','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(540,'508013','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(541,'517305','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(542,'517305','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(543,'522309','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(544,'508258','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(545,'517390','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(546,'507169','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(547,'507169','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(548,'501503','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(549,'533225','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(550,'517517','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(551,'500020','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(552,'502374','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(553,'521002','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(554,'516310','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(555,'515341','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(556,'500025','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(557,'508230','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(558,'521178','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(559,'524412','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(560,'522332','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(561,'523226','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(562,'508116','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(563,'532001','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(564,'531163','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(565,'523135','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(566,'509218','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(567,'501143','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(568,'509243','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(569,'508287','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(570,'501512','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(571,'530023','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(572,'516109','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(573,'522299','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(574,'522201','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(575,'504110','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(576,'517193','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(577,'516433','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(578,'516165','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(579,'516214','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(580,'515422','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(581,'509141','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(582,'534486','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(583,'504201','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(584,'522620','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(585,'508250','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(586,'531111','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(587,'517277','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(588,'507208','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(589,'509111','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(590,'534460','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(591,'502299','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(592,'533232','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(593,'521001','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(594,'507126','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(595,'532128','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(596,'502220','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(597,'523155','Chirala','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(598,'523155','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(599,'523124','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(600,'504294','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(601,'521128','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(602,'506223','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(603,'501113','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(604,'531162','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(605,'517198','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(606,'520009','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(607,'517001','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(608,'517002','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(609,'517004','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(610,'517003','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(611,'516104','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(612,'508114','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(613,'506356','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(614,'509109','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(615,'522298','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(616,'521117','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(617,'523285','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(618,'531036','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(619,'522264','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(620,'505415','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(621,'521251','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(622,'533461','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(623,'522006','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(624,'508252','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(625,'522003','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(626,'517257','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(627,'520005','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(628,'515415','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(629,'507001','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(630,'533002','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(631,'521001','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(632,'515001','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(633,'515004','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(634,'522403','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(635,'508002','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(636,'523001','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(637,'518202','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(638,'524201','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(639,'532001','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(640,'533203','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(641,'504001','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(642,'534275','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(643,'534211','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(644,'500037','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(645,'504001','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(646,'532284','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(647,'500005','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(648,'516001','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(649,'516163','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(650,'516004','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(651,'523333','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(652,'523333','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(653,'505184','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(654,'534390','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(655,'530020','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(656,'507003','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(657,'500023','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(658,'517152','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(659,'509407','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(660,'508375','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(661,'524152','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(662,'505476','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(663,'507306','Dammapeta','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(664,'533103','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(665,'504206','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(666,'533263','Dangeru','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(667,'522297','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(668,'524003','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(669,'500024','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(670,'503165','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(671,'523267','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(672,'523247','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(673,'531202','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(674,'506315','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(675,'500028','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(676,'518669','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(677,'533240','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(678,'515332','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(679,'503124','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(680,'507206','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(681,'520050','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(682,'530009','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(683,'521001','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(684,'506006','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(685,'522050','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(686,'516441','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(687,'523277','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(688,'506011','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(689,'518465','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(690,'504218','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(691,'508248','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(692,'509204','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(693,'531030','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(694,'534313','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(695,'506302','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(696,'533339','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(697,'502305','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(698,'509205','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(699,'505425','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(700,'503230','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(701,'503145','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(702,'506330','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(703,'534462','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(704,'506330','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(705,'515671','Dharmavaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(706,'533430','Dharmavaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(707,'531148','Dharmavaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(708,'515671','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(709,'515672','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(710,'509133','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(711,'501121','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(712,'518222','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(713,'518222','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(714,'500006','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(715,'522258','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(716,'503175','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(717,'502321','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(718,'500036','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(719,'504306','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(720,'531061','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(721,'522276','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(722,'508258','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(723,'518021','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(724,'534314','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(725,'508333','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(726,'534239','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(727,'505002','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(728,'530002','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(729,'521002','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(730,'520001','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(731,'534202','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(732,'534266','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(733,'521332','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(734,'501525','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(735,'503123','Domakonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(736,'516431','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(737,'534351','Dommeru','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(738,'504207','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(739,'523305','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(740,'508272','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(741,'522503','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(742,'530004','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(743,'531135','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(744,'522002','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(745,'531110','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(746,'522002','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(747,'503314','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(748,'532578','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(749,'502334','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(750,'506381','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(751,'517110','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(752,'518135','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(753,'533292','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(754,'533125','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(755,'500762','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(756,'532001','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(757,'533262','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(758,'523002','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(759,'502108','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(760,'502277','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(761,'524102','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(762,'522330','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(763,'521202','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(764,'507137','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(765,'523330','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(766,'520002','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(767,'517583','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(768,'520003','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(769,'522612','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(770,'532484','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(771,'524222','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(772,'534156','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(773,'516175','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(774,'524306','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(775,'533341','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(776,'534426','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(777,'530016','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(778,'500026','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(779,'534001','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(780,'504307','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(781,'500762','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(782,'523356','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(783,'509307','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(784,'500023','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(785,'522233','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(786,'522340','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(787,'503202','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(788,'521144','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(789,'518017','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(790,'516271','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(791,'504106','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(792,'517592','Ekambara kuppam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(793,'501103','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(794,'521148','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(795,'505525','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(796,'505401','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(797,'505188','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(798,'534268','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(799,'534001','Eluru','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(800,'534001','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(801,'534006','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(802,'534006','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(803,'534006','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(804,'534006','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(805,'534005','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(806,'534006','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(807,'522308','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(808,'500021','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(809,'505526','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(810,'533003','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(811,'500007','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(812,'521001','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(813,'507168','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(814,'517240','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(815,'500018','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(816,'523327','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(817,'500004','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(818,'500027','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(819,'523280','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(820,'531082','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(821,'522017','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(822,'522003','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(823,'506165','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(824,'522003','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(825,'500253','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(826,'500265','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(827,'500018','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(828,'502110','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(829,'503220','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(830,'524003','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(831,'506003','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(832,'534275','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(833,'505210','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(834,'502110','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(835,'533101','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(836,'506008','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(837,'530001','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(838,'524101','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(839,'524101','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(840,'533285','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(841,'500004','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(842,'522001','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(843,'522001','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(844,'522001','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(845,'522001','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(846,'522001','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(847,'522001','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(848,'521101','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(849,'521101','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(850,'500032','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(851,'500032','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(852,'515844','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(853,'509125','Gadwal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(854,'509323','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(855,'500029','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(856,'531270','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(857,'523315','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(858,'503001','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(859,'518583','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(860,'517141','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(861,'531201','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(862,'530026','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(863,'521109','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(864,'516120','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(865,'516267','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(866,'521403','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(867,'534198','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(868,'524317','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(869,'503114','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(870,'515001','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(871,'533201','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(872,'500001','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(873,'504001','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(874,'522403','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(875,'505301','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(876,'507003','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(877,'509103','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(878,'530005','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(879,'503001','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(880,'500003','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(881,'521123','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(882,'531001','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(883,'533004','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(884,'522201','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(885,'500380','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(886,'508248','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(887,'520003','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(888,'520003','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(889,'521202','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(890,'531001','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(891,'534002','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(892,'530003','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(893,'533103','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(894,'517325','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(895,'505001','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(896,'521201','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(897,'524236','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(898,'515521','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(899,'505445','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(900,'517125','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(901,'522271','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(902,'509306','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(903,'531029','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(904,'501115','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(905,'517564','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(906,'516319','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(907,'505474','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(908,'521101','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(909,'531215','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(910,'532405','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(911,'532102','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(912,'508201','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(913,'518452','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(914,'507210','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(915,'515731','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(916,'505186','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(917,'532463','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(918,'505471','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(919,'531075','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(920,'515004','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(921,'506345','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(922,'506143','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(923,'521133','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(924,'501301','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(925,'509173','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(926,'523357','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(927,'523357','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(928,'523357','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(929,'501151','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(930,'503001','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(931,'506244','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(932,'501102','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(933,'505209','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(934,'521001','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(935,'507158','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(936,'533286','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(937,'508286','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(938,'500008','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(939,'500020','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(940,'533468','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(941,'517147','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(942,'521111','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(943,'515866','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(944,'505532','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(945,'509303','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(946,'533445','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(947,'507174','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(948,'518138','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(949,'533344','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(950,'534362','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(951,'521322','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(952,'508381','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(953,'518463','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(954,'515401','Gooty','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(955,'515401','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(956,'515401','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(957,'515402','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(958,'523001','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(959,'509206','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(960,'530027','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(961,'533274','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(962,'534316','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(963,'534450','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(964,'507214','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(965,'516233','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(966,'534260','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(967,'515231','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(968,'523246','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(969,'500015','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(970,'507134','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(971,'531023','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(972,'515292','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(973,'506344','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(974,'533105','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(975,'530040','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(976,'530040','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(977,'533450','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(978,'501403','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(979,'515233','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(980,'534350','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(981,'507138','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(982,'504208','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(983,'506002','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(984,'515801','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(985,'500265','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(986,'515271','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(987,'508238','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(988,'508257','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(989,'504308','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(990,'521301','Gudivada','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(991,'521301','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(992,'521301','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(993,'509221','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(994,'521356','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(995,'523281','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(996,'518466','Gudur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(997,'508127','Gudur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(998,'524101','Gudur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(999,'506134','Gudur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1000,'517161','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1001,'532005','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1002,'502278','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1003,'502278','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1004,'502278','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1005,'524407','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1006,'505304','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1007,'504309','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1008,'508257','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1009,'515863','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1010,'532523','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1011,'534267','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1012,'524234','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1013,'500001','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1014,'520005','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1015,'524414','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1016,'501515','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1017,'534116','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1018,'523240','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1019,'523243','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1020,'516438','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1021,'509342','Gundmal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1022,'534427','Gundugolanu','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1023,'518150','Gundupapala','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1024,'509341','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1025,'501521','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1026,'515801','Guntakal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1027,'522024','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1028,'522026','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1029,'522036','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1030,'522001','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1031,'522003','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1032,'522004','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1033,'522004','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1034,'504322','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1035,'502211','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1036,'503001','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1037,'531303','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1038,'517297','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1039,'533101','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1040,'522281','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1041,'533014','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1042,'534343','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1043,'507003','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1044,'515164','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1045,'518426','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1046,'517213','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1047,'530004','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1048,'500010','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1049,'504344','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1050,'518348','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1051,'515282','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1052,'518333','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1053,'500029','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1054,'508116','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1055,'506001','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1056,'506011','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1057,'502251','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1058,'518470','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1059,'500014','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1060,'509001','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1061,'521105','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1062,'502001','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1063,'534211','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1064,'523227','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1065,'520003','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1066,'515801','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1067,'532243','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1068,'515872','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1069,'532550','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1070,'506371','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1071,'504305','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1072,'502297','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1073,'502113','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1074,'501505','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1075,'508126','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1076,'515286','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1077,'500266','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1078,'508202','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1079,'501504','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1080,'500029','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1081,'500029','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1082,'500001','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1083,'515201','Hindupur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1084,'515202','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1085,'515212','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1086,'500042','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1087,'500051','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1088,'500051','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1089,'532459','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1090,'518346','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1091,'516361','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1092,'518382','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1093,'500003','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1094,'530022','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1095,'500028','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1096,'509334','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1097,'505467','Husnabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1098,'509350','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1099,'518011','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1100,'500264','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1101,'508204','Huzurnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1102,'500001','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1103,'505468','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1104,'500012','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1105,'500001','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1106,'500013','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1107,'500001','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1108,'500036','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1109,'521301','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1110,'500017','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1111,'500031','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1112,'502267','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1113,'509347','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1114,'505450','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1115,'521226','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1116,'501506','Ibrahimpatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1117,'532312','Ichapuram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1118,'502324','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1119,'502307','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1120,'523194','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1121,'523190','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1122,'517148','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1123,'518186','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1124,'500855','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1125,'533124','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1126,'503164','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1127,'504342','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1128,'504346','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1129,'503111','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1130,'502103','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1131,'508346','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1132,'501152','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1133,'504106','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1134,'509226','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1135,'502330','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1136,'533006','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1137,'524314','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1138,'521311','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1139,'505530','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1140,'504296','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1141,'530007','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1142,'531211','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1143,'506007','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1144,'522034','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1145,'509002','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1146,'500040','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1147,'531211','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1148,'500035','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1149,'518157','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1150,'508288','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1151,'530014','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1152,'521001','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1153,'506252','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1154,'522296','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1155,'522658','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1156,'523166','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1157,'534217','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1158,'517130','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1159,'521170','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1160,'502114','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1161,'517128','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1162,'530010','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1163,'505187','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1164,'524324','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1165,'503111','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1166,'533219','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1167,'502296','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1168,'522265','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1169,'500028','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1170,'502281','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1171,'503111','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1172,'500014','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1173,'521301','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1174,'532407','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1175,'517501','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1176,'533435','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1177,'521175','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1178,'505327','Jagtial','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1179,'500587','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1180,'504325','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1181,'504313','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1182,'504216','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1183,'509211','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1184,'509353','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1185,'503201','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1186,'524223','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1187,'518220','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1188,'508126','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1189,'505184','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1190,'515712','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1191,'532432','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1192,'500007','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1193,'531250','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1194,'516434','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1195,'516434','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1196,'505122','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1197,'522266','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1198,'507152','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1199,'521321','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1200,'524202','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1201,'517217','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1202,'523165','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1203,'534447','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1204,'506352','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1205,'503102','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1206,'501142','Jangaon','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1207,'505547','Jangaon','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1208,'506167','Jangaon','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1209,'506167','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1210,'534447','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1211,'503193','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1212,'504205','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1213,'503246','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1214,'508355','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1215,'501508','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1216,'505002','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1217,'503001','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1218,'524131','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1219,'521171','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1220,'521171','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1221,'523297','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1222,'507177','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1223,'505498','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1224,'534456','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1225,'521175','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1226,'521175','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1227,'500006','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1228,'505410','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1229,'534265','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1230,'502270','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1231,'502270','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1232,'502270','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1233,'518016','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1234,'500002','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1235,'505001','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1236,'503305','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1237,'509140','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1238,'505188','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1239,'518596','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1240,'508289','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1241,'503001','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1242,'501154','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1243,'508262','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1244,'521181','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1245,'508248','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1246,'505498','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1247,'505001','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1248,'505470','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1249,'508115','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1250,'523181','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1251,'515591','Kadiri','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1252,'533126','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1253,'524410','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1254,'518350','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1255,'509358','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1256,'509383','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1257,'534416','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1258,'530024','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1259,'522273','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1260,'517002','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1261,'534331','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1262,'506015','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1263,'506007','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1264,'533001','Kakinada','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1265,'533001','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1266,'533007','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1267,'533007','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1268,'522112','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1269,'507313','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1270,'517236','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1271,'516217','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1272,'524409','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1273,'517301','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1274,'521344','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1275,'524224','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1276,'517234','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1277,'501106','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1278,'534237','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1279,'521333','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1280,'515303','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1281,'517113','Kallur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1282,'507209','Kallur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1283,'524441','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1284,'515774','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1285,'508347','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1286,'524343','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1287,'517151','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1288,'502001','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1289,'505188','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1290,'509324','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1291,'509117','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1292,'515761','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1293,'507111','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1294,'515761','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1295,'504231','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1296,'503111','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1297,'517166','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1298,'520012','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1299,'515835','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1300,'515001','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1301,'505102','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1302,'516289','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1303,'505188','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1304,'503111','Kamareddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1305,'503111','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1306,'534449','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1307,'515765','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1308,'521227','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1309,'517216','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1310,'503111','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1311,'523271','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1312,'523303','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1313,'505184','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1314,'517565','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1315,'508002','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1316,'522259','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1317,'515641','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1318,'505152','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1319,'501504','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1320,'518593','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1321,'500258','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1322,'508281','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1323,'506244','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1324,'530008','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1325,'522180','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(0,'141001','Ludhiana','Punjab','0000-00-00 00:00:00','2019-03-24 22:28:38');

/*Table structure for table `countries` */

DROP TABLE IF EXISTS `countries`;

CREATE TABLE `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_code` varchar(2) NOT NULL DEFAULT '',
  `country_name` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=247 DEFAULT CHARSET=utf8;

/*Data for the table `countries` */

insert  into `countries`(`id`,`country_code`,`country_name`) values 
(1,'AF','Afghanistan'),
(2,'AL','Albania'),
(3,'DZ','Algeria'),
(4,'DS','American Samoa'),
(5,'AD','Andorra'),
(6,'AO','Angola'),
(7,'AI','Anguilla'),
(8,'AQ','Antarctica'),
(9,'AG','Antigua and Barbuda'),
(10,'AR','Argentina'),
(11,'AM','Armenia'),
(12,'AW','Aruba'),
(13,'AU','Australia'),
(14,'AT','Austria'),
(15,'AZ','Azerbaijan'),
(16,'BS','Bahamas'),
(17,'BH','Bahrain'),
(18,'BD','Bangladesh'),
(19,'BB','Barbados'),
(20,'BY','Belarus'),
(21,'BE','Belgium'),
(22,'BZ','Belize'),
(23,'BJ','Benin'),
(24,'BM','Bermuda'),
(25,'BT','Bhutan'),
(26,'BO','Bolivia'),
(27,'BA','Bosnia and Herzegovina'),
(28,'BW','Botswana'),
(29,'BV','Bouvet Island'),
(30,'BR','Brazil'),
(31,'IO','British Indian Ocean Territory'),
(32,'BN','Brunei Darussalam'),
(33,'BG','Bulgaria'),
(34,'BF','Burkina Faso'),
(35,'BI','Burundi'),
(36,'KH','Cambodia'),
(37,'CM','Cameroon'),
(38,'CA','Canada'),
(39,'CV','Cape Verde'),
(40,'KY','Cayman Islands'),
(41,'CF','Central African Republic'),
(42,'TD','Chad'),
(43,'CL','Chile'),
(44,'CN','China'),
(45,'CX','Christmas Island'),
(46,'CC','Cocos (Keeling) Islands'),
(47,'CO','Colombia'),
(48,'KM','Comoros'),
(49,'CG','Congo'),
(50,'CK','Cook Islands'),
(51,'CR','Costa Rica'),
(52,'HR','Croatia (Hrvatska)'),
(53,'CU','Cuba'),
(54,'CY','Cyprus'),
(55,'CZ','Czech Republic'),
(56,'DK','Denmark'),
(57,'DJ','Djibouti'),
(58,'DM','Dominica'),
(59,'DO','Dominican Republic'),
(60,'TP','East Timor'),
(61,'EC','Ecuador'),
(62,'EG','Egypt'),
(63,'SV','El Salvador'),
(64,'GQ','Equatorial Guinea'),
(65,'ER','Eritrea'),
(66,'EE','Estonia'),
(67,'ET','Ethiopia'),
(68,'FK','Falkland Islands (Malvinas)'),
(69,'FO','Faroe Islands'),
(70,'FJ','Fiji'),
(71,'FI','Finland'),
(72,'FR','France'),
(73,'FX','France, Metropolitan'),
(74,'GF','French Guiana'),
(75,'PF','French Polynesia'),
(76,'TF','French Southern Territories'),
(77,'GA','Gabon'),
(78,'GM','Gambia'),
(79,'GE','Georgia'),
(80,'DE','Germany'),
(81,'GH','Ghana'),
(82,'GI','Gibraltar'),
(83,'GK','Guernsey'),
(84,'GR','Greece'),
(85,'GL','Greenland'),
(86,'GD','Grenada'),
(87,'GP','Guadeloupe'),
(88,'GU','Guam'),
(89,'GT','Guatemala'),
(90,'GN','Guinea'),
(91,'GW','Guinea-Bissau'),
(92,'GY','Guyana'),
(93,'HT','Haiti'),
(94,'HM','Heard and Mc Donald Islands'),
(95,'HN','Honduras'),
(96,'HK','Hong Kong'),
(97,'HU','Hungary'),
(98,'IS','Iceland'),
(99,'IN','India'),
(100,'IM','Isle of Man'),
(101,'ID','Indonesia'),
(102,'IR','Iran (Islamic Republic of)'),
(103,'IQ','Iraq'),
(104,'IE','Ireland'),
(105,'IL','Israel'),
(106,'IT','Italy'),
(107,'CI','Ivory Coast'),
(108,'JE','Jersey'),
(109,'JM','Jamaica'),
(110,'JP','Japan'),
(111,'JO','Jordan'),
(112,'KZ','Kazakhstan'),
(113,'KE','Kenya'),
(114,'KI','Kiribati'),
(115,'KP','Korea, Democratic People\'s Republic of'),
(116,'KR','Korea, Republic of'),
(117,'XK','Kosovo'),
(118,'KW','Kuwait'),
(119,'KG','Kyrgyzstan'),
(120,'LA','Lao People\'s Democratic Republic'),
(121,'LV','Latvia'),
(122,'LB','Lebanon'),
(123,'LS','Lesotho'),
(124,'LR','Liberia'),
(125,'LY','Libyan Arab Jamahiriya'),
(126,'LI','Liechtenstein'),
(127,'LT','Lithuania'),
(128,'LU','Luxembourg'),
(129,'MO','Macau'),
(130,'MK','Macedonia'),
(131,'MG','Madagascar'),
(132,'MW','Malawi'),
(133,'MY','Malaysia'),
(134,'MV','Maldives'),
(135,'ML','Mali'),
(136,'MT','Malta'),
(137,'MH','Marshall Islands'),
(138,'MQ','Martinique'),
(139,'MR','Mauritania'),
(140,'MU','Mauritius'),
(141,'TY','Mayotte'),
(142,'MX','Mexico'),
(143,'FM','Micronesia, Federated States of'),
(144,'MD','Moldova, Republic of'),
(145,'MC','Monaco'),
(146,'MN','Mongolia'),
(147,'ME','Montenegro'),
(148,'MS','Montserrat'),
(149,'MA','Morocco'),
(150,'MZ','Mozambique'),
(151,'MM','Myanmar'),
(152,'NA','Namibia'),
(153,'NR','Nauru'),
(154,'NP','Nepal'),
(155,'NL','Netherlands'),
(156,'AN','Netherlands Antilles'),
(157,'NC','New Caledonia'),
(158,'NZ','New Zealand'),
(159,'NI','Nicaragua'),
(160,'NE','Niger'),
(161,'NG','Nigeria'),
(162,'NU','Niue'),
(163,'NF','Norfolk Island'),
(164,'MP','Northern Mariana Islands'),
(165,'NO','Norway'),
(166,'OM','Oman'),
(167,'PK','Pakistan'),
(168,'PW','Palau'),
(169,'PS','Palestine'),
(170,'PA','Panama'),
(171,'PG','Papua New Guinea'),
(172,'PY','Paraguay'),
(173,'PE','Peru'),
(174,'PH','Philippines'),
(175,'PN','Pitcairn'),
(176,'PL','Poland'),
(177,'PT','Portugal'),
(178,'PR','Puerto Rico'),
(179,'QA','Qatar'),
(180,'RE','Reunion'),
(181,'RO','Romania'),
(182,'RU','Russian Federation'),
(183,'RW','Rwanda'),
(184,'KN','Saint Kitts and Nevis'),
(185,'LC','Saint Lucia'),
(186,'VC','Saint Vincent and the Grenadines'),
(187,'WS','Samoa'),
(188,'SM','San Marino'),
(189,'ST','Sao Tome and Principe'),
(190,'SA','Saudi Arabia'),
(191,'SN','Senegal'),
(192,'RS','Serbia'),
(193,'SC','Seychelles'),
(194,'SL','Sierra Leone'),
(195,'SG','Singapore'),
(196,'SK','Slovakia'),
(197,'SI','Slovenia'),
(198,'SB','Solomon Islands'),
(199,'SO','Somalia'),
(200,'ZA','South Africa'),
(201,'GS','South Georgia South Sandwich Islands'),
(202,'SS','South Sudan'),
(203,'ES','Spain'),
(204,'LK','Sri Lanka'),
(205,'SH','St. Helena'),
(206,'PM','St. Pierre and Miquelon'),
(207,'SD','Sudan'),
(208,'SR','Suriname'),
(209,'SJ','Svalbard and Jan Mayen Islands'),
(210,'SZ','Swaziland'),
(211,'SE','Sweden'),
(212,'CH','Switzerland'),
(213,'SY','Syrian Arab Republic'),
(214,'TW','Taiwan'),
(215,'TJ','Tajikistan'),
(216,'TZ','Tanzania, United Republic of'),
(217,'TH','Thailand'),
(218,'TG','Togo'),
(219,'TK','Tokelau'),
(220,'TO','Tonga'),
(221,'TT','Trinidad and Tobago'),
(222,'TN','Tunisia'),
(223,'TR','Turkey'),
(224,'TM','Turkmenistan'),
(225,'TC','Turks and Caicos Islands'),
(226,'TV','Tuvalu'),
(227,'UG','Uganda'),
(228,'UA','Ukraine'),
(229,'AE','United Arab Emirates'),
(230,'GB','United Kingdom'),
(231,'US','United States'),
(232,'UM','United States minor outlying islands'),
(233,'UY','Uruguay'),
(234,'UZ','Uzbekistan'),
(235,'VU','Vanuatu'),
(236,'VA','Vatican City State'),
(237,'VE','Venezuela'),
(238,'VN','Vietnam'),
(239,'VG','Virgin Islands (British)'),
(240,'VI','Virgin Islands (U.S.)'),
(241,'WF','Wallis and Futuna Islands'),
(242,'EH','Western Sahara'),
(243,'YE','Yemen'),
(244,'ZR','Zaire'),
(245,'ZM','Zambia'),
(246,'ZW','Zimbabwe');

/*Table structure for table `coupons` */

DROP TABLE IF EXISTS `coupons`;

CREATE TABLE `coupons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` int(11) NOT NULL,
  `amount_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiry_date` date NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `coupons` */

insert  into `coupons`(`id`,`coupon_code`,`amount`,`amount_type`,`expiry_date`,`status`,`created_at`,`updated_at`) values 
(1,'test15',15,'Percentage','2018-08-31',0,'2018-07-13 15:11:19','2018-10-05 03:28:09'),
(3,'test150',150,'Fixed','2018-11-30',1,'2018-07-16 16:57:39','2018-11-04 10:03:50'),
(4,'test10',10,'Percentage','2018-10-31',1,'2018-07-22 03:36:00','2018-10-19 15:19:35');

/*Table structure for table `currencies` */

DROP TABLE IF EXISTS `currencies`;

CREATE TABLE `currencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currency_code` varchar(255) NOT NULL,
  `exchange_rate` float NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `currencies` */

insert  into `currencies`(`id`,`currency_code`,`exchange_rate`,`status`,`created_at`,`updated_at`) values 
(1,'USD',70,1,'2019-04-11 14:19:40','2019-04-14 11:38:11'),
(2,'GBP',90,1,'2019-04-11 15:28:00','2019-04-11 16:58:00'),
(3,'EUR',80,1,'2019-04-14 10:07:54','2019-04-14 11:37:54');

/*Table structure for table `delivery_addresses` */

DROP TABLE IF EXISTS `delivery_addresses`;

CREATE TABLE `delivery_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `pincode` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `delivery_addresses` */

insert  into `delivery_addresses`(`id`,`user_id`,`user_email`,`name`,`address`,`city`,`state`,`country`,`pincode`,`mobile`,`created_at`,`updated_at`) values 
(1,2,'amit100@yopmail.com','Amit Gupta','12345 Civil Lines','Ludhiana','Punjab','India','141001','9700000000','2018-12-30 15:33:29','2018-12-30 10:03:29'),
(2,8,'steve@yopmail.com','Steve','Test Address','Ludhiana','Punjab','India','141001','08054711805','2019-03-17 12:01:48','2019-03-17 06:31:48'),
(3,4,'john@yopmail.com','Amit Gupta','Test Address','Ludhiana','Punjab','India','141001','9800000000','2019-03-24 22:27:26','2019-03-24 16:57:26'),
(4,15,'amit5600@yopmail.com','Amit Gupta','Test Address','Ludhiana','Punjab','India','141001','+918054711805','2019-04-14 11:29:10','2019-04-14 11:29:10'),
(5,17,'amit300@yopmail.com','Amit Gupta','Test Address','Ludhiana','Punjab','India','141001','+919800000000','2019-06-26 23:23:21','2019-06-26 17:53:21'),
(6,23,'dandygantengkok@gmail.com','Dandy Firmansyah','Jalan Sunter Karya','Jakarta Utara','Jakarta','Indonesia','14350','082113843687','2020-07-09 11:35:10','2020-07-09 04:35:10');

/*Table structure for table `enquiries` */

DROP TABLE IF EXISTS `enquiries`;

CREATE TABLE `enquiries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `enquiries` */

insert  into `enquiries`(`id`,`name`,`email`,`subject`,`message`,`created_at`,`updated_at`) values 
(1,'Amit Gupta','amitphpprogrammer@gmail.com','testing','testing is going on','2019-03-31 09:58:14','2019-03-31 11:28:14'),
(2,'John','john@yopmail.com','Intro','I want some intro','2019-03-31 09:58:51','2019-03-31 11:28:51');

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_resets_table',1),
(3,'2018_03_18_090951_create_category_table',2),
(4,'2018_03_18_100532_add_url_to_categories',3),
(5,'2018_03_29_144354_create_products_table',4),
(6,'2018_04_16_135232_create_products_attributes_table',5),
(7,'2018_06_21_174929_create_cart_table',6),
(8,'2018_07_09_150844_create_coupons_table',7);

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `pincode` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `shipping_charges` float NOT NULL,
  `coupon_code` varchar(255) NOT NULL,
  `coupon_amount` float NOT NULL,
  `order_status` varchar(255) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `grand_total` float NOT NULL,
  `transfer_attach` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

/*Data for the table `orders` */

insert  into `orders`(`id`,`user_id`,`user_email`,`name`,`address`,`city`,`state`,`pincode`,`country`,`mobile`,`shipping_charges`,`coupon_code`,`coupon_amount`,`order_status`,`payment_method`,`grand_total`,`transfer_attach`,`created_at`,`updated_at`) values 
(1,2,'amit100@yopmail.com','Amit Gupta','123 Mall Road','New Delhi','Delhi','141001','India','9800000000',0,'test10',340,'Paid','COD',3060,NULL,'2018-10-28 10:08:22','2018-12-09 14:51:36'),
(2,2,'amit100@yopmail.com','Amit Gupta','123 Mall Road','New Delhi','Delhi','141001','India','9800000000',0,'test150',150,'New','COD',1850,NULL,'2018-11-04 08:35:33','2018-11-04 10:05:33'),
(3,2,'amit100@yopmail.com','Amit Gupta','123 Mall Road','New Delhi','Delhi','141001','India','9800000000',0,'test150',150,'New','COD',4050,NULL,'2018-11-04 08:38:16','2018-11-04 10:08:16'),
(4,2,'amit100@yopmail.com','Amit Gupta','123 Mall Road','New Delhi','Delhi','141001','India','9800000000',0,'',0,'Cancelled','COD',4200,NULL,'2018-11-08 08:32:00','2018-12-09 14:50:04'),
(5,2,'amit100@yopmail.com','Amit Gupta','123 Mall Road','New Delhi','Delhi','141001','India','9800000000',0,'',0,'New','COD',500,NULL,'2018-11-12 15:29:39','2018-11-12 16:59:39'),
(6,2,'amit100@yopmail.com','Amit Gupta','123 Mall Road','New Delhi','Delhi','141001','India','9800000000',0,'',0,'New','Paypal',1200,NULL,'2018-11-12 15:43:05','2018-11-12 17:13:05'),
(7,2,'amit100@yopmail.com','Amit Gupta','123 Mall Road','New Delhi','Delhi','141001','India','9800000000',0,'',0,'New','Paypal',1500,NULL,'2018-11-12 15:45:15','2018-11-12 17:15:15'),
(8,2,'amit100@yopmail.com','Amit Gupta','123 Mall Road','New Delhi','Delhi','141001','India','9800000000',0,'',0,'New','Paypal',3700,NULL,'2018-11-12 15:54:45','2018-11-12 17:24:45'),
(9,2,'amit100@yopmail.com','Amit Gupta','123 Mall Road','New Delhi','Delhi','141001','India','9800000000',0,'',0,'New','Paypal',2200,NULL,'2018-11-12 15:56:39','2018-11-12 17:26:39'),
(10,2,'amit100@yopmail.com','Amit Gupta','123 Mall Road','New Delhi','Delhi','141001','India','9800000000',0,'',0,'New','Paypal',2200,NULL,'2018-11-12 15:59:14','2018-11-12 17:29:14'),
(11,2,'amit100@yopmail.com','Amit Gupta','123 Mall Road','New Delhi','Delhi','141001','India','9800000000',0,'',0,'New','Paypal',2200,NULL,'2018-11-12 16:06:19','2018-11-12 17:36:19'),
(12,2,'amit100@yopmail.com','Amit Gupta','123 Mall Road','New Delhi','Delhi','141001','India','9800000000',0,'',0,'New','Paypal',2200,NULL,'2018-11-12 16:36:11','2018-11-12 18:06:11'),
(13,2,'amit100@yopmail.com','Amit Gupta','123 Mall Road','New Delhi','Delhi','141001','India','9800000000',0,'',0,'New','Paypal',500,NULL,'2018-11-12 16:37:36','2018-11-12 18:07:36'),
(14,2,'amit100@yopmail.com','Amit Gupta','123 Mall Road','New Delhi','Delhi','141001','India','9800000000',0,'',0,'New','Paypal',2200,NULL,'2018-11-12 16:38:49','2018-11-12 18:08:49'),
(15,2,'amit100@yopmail.com','Amit Gupta','123 Mall Road','New Delhi','Delhi','141001','India','9800000000',0,'',0,'New','Paypal',500,NULL,'2018-11-13 16:31:50','2018-11-13 18:01:50'),
(16,2,'amit100@yopmail.com','Amit Gupta','123 Mall Road','New Delhi','Delhi','141001','India','9800000000',0,'',0,'New','Paypal',2200,NULL,'2018-11-13 16:37:37','2018-11-13 18:07:37'),
(17,2,'amit100@yopmail.com','Amit Gupta','123 Mall Road','New Delhi','Delhi','141001','India','9800000000',0,'',0,'New','Paypal',500,NULL,'2018-11-16 11:27:13','2018-11-16 12:57:13'),
(18,2,'amit100@yopmail.com','Amit Gupta','123 Mall Road','New Delhi','Delhi','141001','India','9800000000',0,'',0,'New','COD',500,NULL,'2018-12-29 13:47:49','2018-12-29 15:17:49'),
(19,2,'amit100@yopmail.com','Amit Gupta','123 Mall Road','New Delhi','Delhi','141001','India','9800000000',0,'',0,'New','COD',1700,NULL,'2018-12-29 13:53:37','2018-12-29 15:23:37'),
(20,2,'amit100@yopmail.com','Amit Gupta','123 Mall Road','New Delhi','Delhi','141001','India','9800000000',0,'',0,'New','COD',1700,NULL,'2018-12-29 13:55:09','2018-12-29 15:25:09'),
(21,2,'amit100@yopmail.com','Amit Gupta','123 Mall Road','New Delhi','Delhi','141001','India','9800000000',0,'',0,'New','COD',1700,NULL,'2018-12-29 14:04:34','2018-12-29 15:34:34'),
(22,2,'amit100@yopmail.com','Amit Gupta','123 Mall Road','New Delhi','Delhi','141001','India','9800000000',0,'',0,'New','COD',1700,NULL,'2018-12-29 14:10:27','2018-12-29 15:40:27'),
(23,2,'amit100@yopmail.com','Amit Gupta','123 Mall Road','New Delhi','Delhi','141001','India','9800000000',0,'',0,'New','COD',1700,NULL,'2018-12-30 08:03:07','2018-12-30 09:33:07'),
(24,2,'amit100@yopmail.com','Amit Gupta','123 Mall Road','New Delhi','Delhi','141001','India','9800000000',0,'',0,'New','COD',1700,NULL,'2018-12-30 08:04:18','2018-12-30 09:34:18'),
(25,2,'amit100@yopmail.com','Amit Gupta','123 Mall Road','New Delhi','Delhi','141001','India','9800000000',0,'',0,'New','COD',1700,NULL,'2018-12-30 08:09:39','2018-12-30 09:39:39'),
(26,2,'amit100@yopmail.com','Amit Gupta','123 Mall Road','New Delhi','Delhi','141001','India','9800000000',0,'',0,'New','COD',1700,NULL,'2018-12-30 08:15:14','2018-12-30 09:45:14'),
(27,2,'amit100@yopmail.com','Amit Gupta','123 Mall Road','New Delhi','Delhi','141001','India','9800000000',0,'',0,'New','COD',3400,NULL,'2018-12-30 08:24:06','2018-12-30 09:54:06'),
(28,2,'amit100@yopmail.com','Amit Gupta','12345 Civil Lines','Ludhiana','Punjab','141001','India','9700000000',0,'',0,'New','COD',5900,NULL,'2018-12-30 08:33:36','2018-12-30 10:03:36'),
(29,4,'john@yopmail.com','Amit Gupta','Test Address','Ludhiana','Punjab','141001','India','9800000000',0,'',0,'New','COD',500,NULL,'2019-03-24 15:28:50','2019-03-24 16:58:50'),
(30,17,'amit300@yopmail.com','Amit Gupta','Test Address','Ludhiana','Punjab','141001','India','+919800000000',0,'',0,'New','COD',1500,NULL,'2019-05-30 15:16:36','2019-05-30 16:46:36'),
(31,17,'amit300@yopmail.com','Amit Gupta','Test Address','Ludhiana','Punjab','141001','India','+919800000000',0,'',0,'New','COD',1500,NULL,'2019-05-30 15:26:09','2019-05-30 16:56:09'),
(32,17,'amit300@yopmail.com','Amit Gupta','Test Address','Ludhiana','Punjab','141001','India','+919800000000',0,'',0,'New','COD',1500,NULL,'2019-05-30 15:28:03','2019-05-30 16:58:03'),
(33,17,'amit300@yopmail.com','Amit Gupta','Test Address','Ludhiana','Punjab','141001','India','+919800000000',0,'',0,'New','COD',5200,NULL,'2019-05-30 15:32:19','2019-05-30 17:02:19'),
(34,17,'amit300@yopmail.com','Amit Gupta','Test Address','Ludhiana','Punjab','141001','India','+919800000000',0,'',0,'New','COD',1500,NULL,'2019-05-31 13:46:57','2019-05-31 15:16:57'),
(35,17,'amit300@yopmail.com','Amit Gupta','Test Address','Ludhiana','Punjab','141001','India','+919800000000',0,'',0,'New','COD',2200,NULL,'2019-06-01 14:52:27','2019-06-01 16:22:27'),
(36,17,'amit300@yopmail.com','Amit Gupta','Test Address','Ludhiana','Punjab','141001','India','+919800000000',0,'',0,'New','COD',1200,NULL,'2019-06-07 13:42:21','2019-06-07 15:12:21'),
(37,17,'amit300@yopmail.com','Amit Gupta','Test Address','Ludhiana','Punjab','141001','India','+919800000000',0,'',0,'New','COD',1500,NULL,'2019-06-14 16:40:56','2019-06-14 18:10:56'),
(38,17,'amit300@yopmail.com','Amit Gupta','Test Address','Ludhiana','Punjab','141001','Argentina','+919800000000',200,'',0,'New','COD',700,NULL,'2019-06-14 16:46:42','2019-06-14 18:16:42'),
(39,17,'amit300@yopmail.com','Amit Gupta','Test Address','Ludhiana','Punjab','141001','India','+919800000000',100,'',0,'New','COD',2600,NULL,'2019-06-26 16:34:46','2019-06-26 18:04:46'),
(40,23,'dandygantengkok@gmail.com','Dandy Firmansyah','Jalan Sunter Karya','Jakarta Utara','Jakarta','14350','Indonesia','082113843687',0,'',0,'New','Paypal',1000,'5166.jpg','2020-07-09 01:33:49','2020-07-09 04:27:44'),
(41,23,'dandygantengkok@gmail.com','Dandy Firmansyah','Jalan Sunter Karya','Jakarta Utara','Jakarta','14350','Indonesia','082113843687',0,'',0,'New','Transfer',2000,NULL,'2020-07-09 04:37:05','2020-07-09 04:37:05'),
(42,23,'dandygantengkok@gmail.com','Dandy Firmansyah','Jalan Sunter Karya','Jakarta Utara','Jakarta','14350','Indonesia','082113843687',0,'',0,'New','Transfer',2000,NULL,'2020-07-09 04:38:09','2020-07-09 04:38:09');

/*Table structure for table `orders_products` */

DROP TABLE IF EXISTS `orders_products`;

CREATE TABLE `orders_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_size` varchar(255) NOT NULL,
  `product_color` varchar(255) NOT NULL,
  `product_price` float NOT NULL,
  `product_qty` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=latin1;

/*Data for the table `orders_products` */

insert  into `orders_products`(`id`,`order_id`,`user_id`,`product_id`,`product_code`,`product_name`,`product_size`,`product_color`,`product_price`,`product_qty`,`created_at`,`updated_at`) values 
(1,1,2,9,'GTS001-S','Green TShirt','Small','Green',2200,1,'2018-10-28 10:08:22','2018-10-28 11:38:22'),
(2,1,2,11,'FTS001-S','Sports TShirt','Small','Black',1200,1,'2018-10-28 10:08:22','2018-10-28 11:38:22'),
(3,2,2,9,'GTS001-S','Green TShirt','Small','Green',500,1,'2018-11-04 08:35:34','2018-11-04 10:05:34'),
(4,2,2,10,'BCT01-M','Blue Casual Tshirt','Medium','Blue',1500,1,'2018-11-04 08:35:36','2018-11-04 10:05:36'),
(5,3,2,9,'GTS001-S','Green TShirt','Small','Green',500,1,'2018-11-04 08:38:16','2018-11-04 10:08:16'),
(6,3,2,10,'BCT01-M','Blue Casual Tshirt','Medium','Blue',1500,1,'2018-11-04 08:38:16','2018-11-04 10:08:16'),
(7,3,2,9,'GTS001-S','Green TShirt','Small','Green',2200,1,'2018-11-04 08:38:16','2018-11-04 10:08:16'),
(8,4,2,9,'GTS001-S','Green TShirt','Small','Green',500,1,'2018-11-08 08:32:00','2018-11-08 10:02:00'),
(9,4,2,10,'BCT01-M','Blue Casual Tshirt','Medium','Blue',1500,1,'2018-11-08 08:32:00','2018-11-08 10:02:00'),
(10,4,2,9,'GTS001-S','Green TShirt','Small','Green',2200,1,'2018-11-08 08:32:00','2018-11-08 10:02:00'),
(11,5,2,9,'GTS001-S','Green TShirt','Small','Green',500,1,'2018-11-12 15:29:39','2018-11-12 16:59:39'),
(12,6,2,11,'FTS001-S','Sports TShirt','Small','Black',1200,1,'2018-11-12 15:43:08','2018-11-12 17:13:08'),
(13,7,2,10,'BCT01-S','Blue Casual Tshirt','Small','Blue',1500,1,'2018-11-12 15:45:16','2018-11-12 17:15:16'),
(14,8,2,10,'BCT01-S','Blue Casual Tshirt','Small','Blue',1500,1,'2018-11-12 15:54:45','2018-11-12 17:24:45'),
(15,8,2,9,'GTS001-S','Green TShirt','Small','Green',2200,1,'2018-11-12 15:54:45','2018-11-12 17:24:45'),
(16,9,2,9,'GTS001-S','Green TShirt','Small','Green',2200,1,'2018-11-12 15:56:39','2018-11-12 17:26:39'),
(17,10,2,9,'GTS001-M','Green TShirt','Medium','Green',2200,1,'2018-11-12 15:59:14','2018-11-12 17:29:14'),
(18,11,2,9,'GTS001-S','Green TShirt','Small','Green',2200,1,'2018-11-12 16:06:20','2018-11-12 17:36:20'),
(19,12,2,9,'GTS001-S','Green TShirt','Small','Green',2200,1,'2018-11-12 16:36:13','2018-11-12 18:06:13'),
(20,13,2,9,'GTS001-S','Green TShirt','Small','Green',500,1,'2018-11-12 16:37:36','2018-11-12 18:07:36'),
(21,14,2,9,'GTS001-S','Green TShirt','Small','Green',2200,1,'2018-11-12 16:38:52','2018-11-12 18:08:52'),
(22,15,2,9,'GTS001-S','Green TShirt','Small','Green',500,1,'2018-11-13 16:31:50','2018-11-13 18:01:50'),
(23,16,2,9,'GTS001-S','Green TShirt','Small','Green',2200,1,'2018-11-13 16:37:37','2018-11-13 18:07:37'),
(24,17,2,9,'GTS001-S','Green TShirt','Small','Green',500,1,'2018-11-16 11:27:14','2018-11-16 12:57:14'),
(25,18,2,9,'GTS001-S','Green TShirt','Small','Green',500,1,'2018-12-29 13:47:49','2018-12-29 15:17:49'),
(26,19,2,9,'GTS001-S','Green TShirt','Small','Green',500,1,'2018-12-29 13:53:39','2018-12-29 15:23:39'),
(27,19,2,11,'FTS001-S','Sports TShirt','Small','Black',1200,1,'2018-12-29 13:53:39','2018-12-29 15:23:39'),
(28,20,2,9,'GTS001-S','Green TShirt','Small','Green',500,1,'2018-12-29 13:55:11','2018-12-29 15:25:11'),
(29,20,2,11,'FTS001-S','Sports TShirt','Small','Black',1200,1,'2018-12-29 13:55:11','2018-12-29 15:25:11'),
(30,21,2,9,'GTS001-S','Green TShirt','Small','Green',500,1,'2018-12-29 14:04:36','2018-12-29 15:34:36'),
(31,21,2,11,'FTS001-S','Sports TShirt','Small','Black',1200,1,'2018-12-29 14:04:36','2018-12-29 15:34:36'),
(32,22,2,9,'GTS001-S','Green TShirt','Small','Green',500,1,'2018-12-29 14:10:29','2018-12-29 15:40:29'),
(33,22,2,11,'FTS001-S','Sports TShirt','Small','Black',1200,1,'2018-12-29 14:10:29','2018-12-29 15:40:29'),
(34,23,2,9,'GTS001-S','Green TShirt','Small','Green',500,1,'2018-12-30 08:03:10','2018-12-30 09:33:10'),
(35,23,2,11,'FTS001-S','Sports TShirt','Small','Black',1200,1,'2018-12-30 08:03:10','2018-12-30 09:33:10'),
(36,24,2,9,'GTS001-S','Green TShirt','Small','Green',500,1,'2018-12-30 08:04:18','2018-12-30 09:34:18'),
(37,24,2,11,'FTS001-S','Sports TShirt','Small','Black',1200,1,'2018-12-30 08:04:18','2018-12-30 09:34:18'),
(38,25,2,9,'GTS001-S','Green TShirt','Small','Green',500,1,'2018-12-30 08:09:40','2018-12-30 09:39:40'),
(39,25,2,11,'FTS001-S','Sports TShirt','Small','Black',1200,1,'2018-12-30 08:09:40','2018-12-30 09:39:40'),
(40,26,2,9,'GTS001-S','Green TShirt','Small','Green',500,1,'2018-12-30 08:15:16','2018-12-30 09:45:16'),
(41,26,2,11,'FTS001-S','Sports TShirt','Small','Black',1200,1,'2018-12-30 08:15:16','2018-12-30 09:45:16'),
(42,27,2,9,'GTS001-S','Green TShirt','Small','Green',2200,1,'2018-12-30 08:24:06','2018-12-30 09:54:06'),
(43,27,2,11,'FTS001-S','Sports TShirt','Small','Black',1200,1,'2018-12-30 08:24:06','2018-12-30 09:54:06'),
(44,28,2,9,'GTS001-S','Green TShirt','Small','Green',2200,1,'2018-12-30 08:33:36','2018-12-30 10:03:36'),
(45,28,2,10,'BCT01-S','Blue Casual Tshirt','Small','Blue',1500,1,'2018-12-30 08:33:36','2018-12-30 10:03:36'),
(46,28,2,11,'FTS001-S','Sports TShirt','Small','Black',2200,1,'2018-12-30 08:33:36','2018-12-30 10:03:36'),
(47,29,4,9,'GTS001-S','Green TShirt','Small','Green',500,1,'2019-03-24 15:28:50','2019-03-24 16:58:50'),
(48,30,17,10,'BCT01-S','Blue Casual Tshirt','Small','Blue',1500,1,'2019-05-30 15:16:37','2019-05-30 16:46:37'),
(49,31,17,10,'BCT01-S','Blue Casual Tshirt','Small','Blue',1500,1,'2019-05-30 15:26:10','2019-05-30 16:56:10'),
(50,32,17,10,'BCT01-S','Blue Casual Tshirt','Small','Blue',1500,1,'2019-05-30 15:28:05','2019-05-30 16:58:05'),
(51,33,17,9,'GTS001-S','Green TShirt','Small','Green',2200,1,'2019-05-30 15:32:21','2019-05-30 17:02:21'),
(52,33,17,10,'BCT01-M','Blue Casual Tshirt','Medium','Blue',1500,2,'2019-05-30 15:32:21','2019-05-30 17:02:21'),
(53,34,17,10,'BCT01-M','Blue Casual Tshirt','Medium','Blue',1500,1,'2019-05-31 13:46:57','2019-05-31 15:16:57'),
(54,35,17,9,'GTS001-S','Green TShirt','Small','Green',2200,1,'2019-06-01 14:52:27','2019-06-01 16:22:27'),
(55,36,17,11,'FTS001-S','Sports TShirt','Small','Black',1200,1,'2019-06-07 13:42:21','2019-06-07 15:12:21'),
(56,37,17,21,'Bl001-Small','Black T-Shirt','Small','Black',1000,1,'2019-06-14 16:41:03','2019-06-14 18:11:03'),
(57,38,17,21,'Bl001-Small','Black T-Shirt','Small','Black',500,1,'2019-06-14 16:46:44','2019-06-14 18:16:44'),
(58,39,17,18,'RT001-S','Red TShirt','Small','Red',1000,1,'2019-06-26 16:34:46','2019-06-26 18:04:46'),
(59,39,17,10,'BCT01-S','Blue Casual Tshirt','Small','Blue',1500,1,'2019-06-26 16:34:46','2019-06-26 18:04:46'),
(60,40,23,18,'RT001-S','Red TShirt','Small','Red',1000,1,'2020-07-09 01:33:49','2020-07-09 01:33:49'),
(61,41,23,18,'RT001-S','Red TShirt','Small','Red',1000,2,'2020-07-09 04:37:06','2020-07-09 04:37:06'),
(62,42,23,18,'RT001-S','Red TShirt','Small','Red',1000,2,'2020-07-09 04:38:09','2020-07-09 04:38:09');

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `pincodes` */

DROP TABLE IF EXISTS `pincodes`;

CREATE TABLE `pincodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pincode` varchar(20) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1327 DEFAULT CHARSET=latin1;

/*Data for the table `pincodes` */

insert  into `pincodes`(`id`,`pincode`,`city`,`state`,`created_at`,`updated_at`) values 
(1,'744104','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(2,'744208','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(3,'744107','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(4,'744201','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(5,'744302','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(6,'744301','Car Nicobar','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(7,'744202','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(8,'744102','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(9,'744211','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(10,'744207','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(11,'744103','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(12,'744209','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(13,'744304','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(14,'744203','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(15,'744101','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(16,'744204','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(17,'744101','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(18,'744303','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(19,'744104','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(20,'744105','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(21,'744210','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(22,'744101','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(23,'744205','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(24,'744106','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(25,'744206','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(26,'524002','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(27,'508207','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(28,'504251','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(29,'500463','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(30,'500890','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(31,'531001','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(32,'500030','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(33,'500049','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(34,'509343','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(35,'522004','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(36,'515001','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(37,'518543','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(38,'506144','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(39,'505208','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(40,'522015','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(41,'522403','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(42,'500004','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(43,'500252','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(44,'509375','Lingotam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(45,'534123','Achanta','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(46,'531011','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(47,'504001','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(48,'500463','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(49,'523201','Addanki','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(50,'523001','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(51,'533428','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(52,'504001','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(53,'504002','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(54,'505188','Adivarampet','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(55,'507101','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(56,'500007','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(57,'500032','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(58,'518301','Adoni','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(59,'518302','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(60,'518301','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(61,'518301','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(62,'508367','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(63,'500007','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(64,'522263','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(65,'500012','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(66,'516421','Agadur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(67,'515311','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(68,'501146','Agnoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(69,'522270','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(70,'534196','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(71,'522004','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(72,'500030','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(73,'500028','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(74,'523155','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(75,'501522','Ainapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(76,'522659','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(77,'500043','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(78,'508216','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(79,'520015','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(80,'532552','Ajjada','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(81,'534339','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(82,'516132','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(83,'534235','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(84,'534235','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(85,'516506','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(86,'530016','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(87,'532219','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(88,'517536','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(89,'518196','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(90,'521245','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(91,'509362','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(92,'531240','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(93,'509152','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(94,'533233','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(95,'534126','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(96,'533101','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(97,'505533','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(98,'505330','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(99,'508101','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(100,'502269','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(101,'518543','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(102,'533217','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(103,'502310','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(104,'530004','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(105,'503214','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(106,'524315','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(107,'524315','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(108,'509150','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(109,'501514','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(110,'518395','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(111,'509149','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(112,'509388','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(113,'515566','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(114,'532185','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(115,'532185','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(116,'501504','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(117,'533201','Amalapuram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(118,'533201','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(119,'515445','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(120,'509321','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(121,'509201','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(122,'515281','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(123,'522020','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(124,'522007','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(125,'509130','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(126,'509142','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(127,'533214','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(128,'503235','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(129,'505306','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(130,'502103','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(131,'500013','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(132,'500016','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(133,'509330','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(134,'515822','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(135,'523180','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(136,'532015','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(137,'508219','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(138,'522325','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(139,'508290','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(140,'531001','Anakapalle','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(141,'531001','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(142,'531001','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(143,'531001','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(144,'500004','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(145,'522003','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(146,'530042','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(147,'534111','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(148,'515001','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(149,'515002','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(150,'516357','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(151,'516105','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(152,'516228','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(153,'524302','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(154,'533222','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(155,'522301','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(156,'522014','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(157,'501105','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(158,'516116','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(159,'533342','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(160,'533342','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(161,'501201','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(162,'524004','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(163,'500044','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(164,'503215','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(165,'530003','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(166,'502273','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(167,'524203','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(168,'522211','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(169,'521330','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(170,'533307','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(171,'508290','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(172,'508227','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(173,'533406','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(174,'524304','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(175,'533252','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(176,'505466','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(177,'505514','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(178,'521176','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(179,'533557','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(180,'517325','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(181,'515455','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(182,'522310','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(183,'533005','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(184,'500049','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(185,'522503','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(186,'531230','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(187,'531149','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(188,'531151','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(189,'532401','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(190,'534230','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(191,'515001','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(192,'524119','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(193,'503224','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(194,'503224','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(195,'503224','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(196,'517330','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(197,'508112','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(198,'523335','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(199,'521114','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(200,'534152','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(201,'517129','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(202,'520002','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(203,'522002','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(204,'522601','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(205,'502220','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(206,'533104','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(207,'505173','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(208,'500020','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(209,'518005','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(210,'506133','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(211,'507116','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(212,'500028','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(213,'504293','Asifabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(214,'518347','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(215,'507301','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(216,'522409','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(217,'531011','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(218,'516501','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(219,'515751','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(220,'518422','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(221,'502292','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(222,'508111','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(223,'524322','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(224,'506342','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(225,'509131','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(226,'533235','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(227,'534134','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(228,'534134','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(229,'521211','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(230,'509363','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(231,'530012','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(232,'521121','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(233,'521121','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(234,'533230','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(235,'530001','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(236,'517109','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(237,'520003','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(238,'517278','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(239,'501504','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(240,'500038','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(241,'515862','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(242,'521102','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(243,'516227','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(244,'516227','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(245,'500264','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(246,'517415','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(247,'500048','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(248,'517194','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(249,'509202','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(250,'522202','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(251,'508206','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(252,'524002','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(253,'516484','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(254,'521001','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(255,'516484','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(256,'524129','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(257,'517561','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(258,'532557','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(259,'503217','Balkonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(260,'521177','Balusupadu','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(261,'518124','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(262,'518124','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(263,'505407','Bandankal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(264,'533221','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(265,'522021','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(266,'518523','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(267,'521179','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(268,'522663','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(269,'523226','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(270,'524404','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(271,'517416','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(272,'507202','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(273,'500034','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(274,'508213','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(275,'503187','Banswada','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(276,'503187','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(277,'506003','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(278,'502103','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(279,'503231','Bardipur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(280,'500027','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(281,'532263','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(282,'532264','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(283,'505187','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(284,'504101','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(285,'515306','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(286,'500001','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(287,'501143','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(288,'501528','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(289,'521001','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(290,'515661','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(291,'532456','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(292,'516164','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(293,'507127','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(294,'507211','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(295,'500004','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(296,'533242','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(297,'506002','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(298,'500039','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(299,'505188','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(300,'500012','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(301,'500016','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(302,'500003','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(303,'505528','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(304,'504324','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(305,'518462','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(306,'522411','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(307,'504251','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(308,'504251','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(309,'504251','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(310,'500049','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(311,'515741','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(312,'534001','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(313,'533409','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(314,'533210','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(315,'524126','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(316,'520002','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(317,'518599','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(318,'522279','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(319,'521301','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(320,'507111','Bhadrachalam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(321,'534251','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(322,'504001','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(323,'518004','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(324,'504103','Bhainsa','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(325,'507101','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(326,'517501','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(327,'530012','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(328,'502103','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(329,'518301','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(330,'533003','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(331,'521001','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(332,'521140','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(333,'522256','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(334,'521118','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(335,'521231','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(336,'500002','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(337,'503115','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(338,'531241','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(339,'533514','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(340,'531163','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(341,'504204','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(342,'505471','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(343,'503101','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(344,'503307','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(345,'517106','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(346,'534201','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(347,'534301','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(348,'534203','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(349,'533410','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(350,'534301','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(351,'503307','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(352,'505101','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(353,'531216','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(354,'508116','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(355,'500003','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(356,'500003','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(357,'508116','Bhongir','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(358,'508116','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(359,'508224','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(360,'504001','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(361,'507112','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(362,'509382','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(363,'508126','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(364,'503125','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(365,'533343','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(366,'503306','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(367,'505475','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(368,'509203','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(369,'505475','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(370,'509145','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(371,'523106','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(372,'503321','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(373,'524142','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(374,'524142','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(375,'504304','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(376,'532573','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(377,'532573','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(378,'532558','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(379,'532558','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(380,'532558','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(381,'533215','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(382,'518146','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(383,'503185','Bodhan','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(384,'503185','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(385,'522354','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(386,'522354','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(387,'524142','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(388,'516392','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(389,'500010','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(390,'516360','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(391,'518517','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(392,'517134','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(393,'515763','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(394,'505480','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(395,'507204','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(396,'508126','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(397,'505472','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(398,'501502','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(399,'509345','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(400,'531160','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(401,'534207','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(402,'515427','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(403,'531260','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(404,'508105','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(405,'532408','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(406,'517146','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(407,'505524','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(408,'517108','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(409,'523155','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(410,'523110','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(411,'500361','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(412,'500011','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(413,'524346','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(414,'521370','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(415,'522214','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(416,'518432','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(417,'532220','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(418,'522002','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(419,'524001','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(420,'501202','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(421,'517111','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(422,'506221','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(423,'524305','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(424,'520002','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(425,'522013','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(426,'509213','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(427,'515241','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(428,'532427','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(429,'504106','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(430,'524003','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(431,'515144','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(432,'515144','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(433,'504106','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(434,'517351','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(435,'532417','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(436,'507114','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(437,'507001','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(438,'532445','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(439,'532551','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(440,'522601','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(441,'522201','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(442,'502110','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(443,'524305','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(444,'532312','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(445,'503111','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(446,'522010','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(447,'532502','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(448,'500003','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(449,'530006','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(450,'505102','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(451,'521001','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(452,'534448','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(453,'508001','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(454,'501158','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(455,'517001','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(456,'517001','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(457,'517001','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(458,'517002','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(459,'532406','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(460,'503180','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(461,'507154','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(462,'508202','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(463,'506381','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(464,'532406','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(465,'516001','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(466,'516001','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(467,'516001','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(468,'516001','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(469,'516001','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(470,'516001','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(471,'516001','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(472,'516001','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(473,'518206','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(474,'504209','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(475,'500013','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(476,'500022','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(477,'500768','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(478,'500134','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(479,'534196','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(480,'515813','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(481,'508111','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(482,'506301','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(483,'518553','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(484,'534342','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(485,'500171','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(486,'500036','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(487,'524221','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(488,'516260','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(489,'508350','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(490,'533503','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(491,'521126','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(492,'532581','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(493,'515419','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(494,'505505','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(495,'500024','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(496,'508259','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(497,'515458','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(498,'509115','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(499,'521182','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(500,'522311','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(501,'522007','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(502,'517101','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(503,'517101','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(504,'520010','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(505,'507135','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(506,'500264','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(507,'508116','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(508,'508255','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(509,'505505','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(510,'532216','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(511,'518675','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(512,'502221','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(513,'517260','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(514,'507133','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(515,'534004','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(516,'522274','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(517,'522277','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(518,'523188','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(519,'515843','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(520,'533449','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(521,'522212','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(522,'505412','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(523,'502255','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(524,'509333','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(525,'509332','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(526,'501516','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(527,'533261','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(528,'505468','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(529,'506168','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(530,'517417','Chembakur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(531,'517417','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(532,'530001','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(533,'515101','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(534,'516502','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(535,'506332','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(536,'506332','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(537,'516162','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(538,'524406','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(539,'503228','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(540,'508013','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(541,'517305','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(542,'517305','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(543,'522309','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(544,'508258','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(545,'517390','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(546,'507169','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(547,'507169','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(548,'501503','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(549,'533225','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(550,'517517','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(551,'500020','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(552,'502374','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(553,'521002','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(554,'516310','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(555,'515341','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(556,'500025','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(557,'508230','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(558,'521178','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(559,'524412','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(560,'522332','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(561,'523226','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(562,'508116','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(563,'532001','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(564,'531163','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(565,'523135','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(566,'509218','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(567,'501143','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(568,'509243','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(569,'508287','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(570,'501512','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(571,'530023','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(572,'516109','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(573,'522299','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(574,'522201','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(575,'504110','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(576,'517193','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(577,'516433','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(578,'516165','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(579,'516214','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(580,'515422','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(581,'509141','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(582,'534486','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(583,'504201','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(584,'522620','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(585,'508250','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(586,'531111','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(587,'517277','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(588,'507208','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(589,'509111','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(590,'534460','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(591,'502299','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(592,'533232','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(593,'521001','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(594,'507126','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(595,'532128','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(596,'502220','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(597,'523155','Chirala','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(598,'523155','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(599,'523124','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(600,'504294','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(601,'521128','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(602,'506223','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(603,'501113','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(604,'531162','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(605,'517198','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(606,'520009','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(607,'517001','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(608,'517002','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(609,'517004','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(610,'517003','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(611,'516104','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(612,'508114','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(613,'506356','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(614,'509109','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(615,'522298','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(616,'521117','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(617,'523285','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(618,'531036','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(619,'522264','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(620,'505415','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(621,'521251','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(622,'533461','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(623,'522006','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(624,'508252','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(625,'522003','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(626,'517257','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(627,'520005','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(628,'515415','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(629,'507001','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(630,'533002','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(631,'521001','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(632,'515001','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(633,'515004','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(634,'522403','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(635,'508002','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(636,'523001','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(637,'518202','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(638,'524201','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(639,'532001','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(640,'533203','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(641,'504001','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(642,'534275','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(643,'534211','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(644,'500037','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(645,'504001','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(646,'532284','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(647,'500005','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(648,'516001','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(649,'516163','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(650,'516004','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(651,'523333','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(652,'523333','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(653,'505184','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(654,'534390','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(655,'530020','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(656,'507003','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(657,'500023','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(658,'517152','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(659,'509407','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(660,'508375','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(661,'524152','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(662,'505476','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(663,'507306','Dammapeta','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(664,'533103','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(665,'504206','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(666,'533263','Dangeru','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(667,'522297','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(668,'524003','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(669,'500024','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(670,'503165','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(671,'523267','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(672,'523247','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(673,'531202','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(674,'506315','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(675,'500028','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(676,'518669','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(677,'533240','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(678,'515332','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(679,'503124','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(680,'507206','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(681,'520050','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(682,'530009','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(683,'521001','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(684,'506006','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(685,'522050','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(686,'516441','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(687,'523277','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(688,'506011','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(689,'518465','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(690,'504218','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(691,'508248','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(692,'509204','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(693,'531030','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(694,'534313','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(695,'506302','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(696,'533339','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(697,'502305','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(698,'509205','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(699,'505425','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(700,'503230','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(701,'503145','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(702,'506330','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(703,'534462','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(704,'506330','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(705,'515671','Dharmavaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(706,'533430','Dharmavaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(707,'531148','Dharmavaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(708,'515671','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(709,'515672','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(710,'509133','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(711,'501121','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(712,'518222','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(713,'518222','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(714,'500006','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(715,'522258','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(716,'503175','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(717,'502321','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(718,'500036','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(719,'504306','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(720,'531061','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(721,'522276','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(722,'508258','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(723,'518021','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(724,'534314','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(725,'508333','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(726,'534239','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(727,'505002','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(728,'530002','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(729,'521002','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(730,'520001','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(731,'534202','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(732,'534266','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(733,'521332','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(734,'501525','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(735,'503123','Domakonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(736,'516431','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(737,'534351','Dommeru','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(738,'504207','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(739,'523305','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(740,'508272','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(741,'522503','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(742,'530004','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(743,'531135','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(744,'522002','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(745,'531110','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(746,'522002','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(747,'503314','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(748,'532578','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(749,'502334','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(750,'506381','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(751,'517110','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(752,'518135','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(753,'533292','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(754,'533125','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(755,'500762','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(756,'532001','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(757,'533262','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(758,'523002','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(759,'502108','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(760,'502277','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(761,'524102','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(762,'522330','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(763,'521202','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(764,'507137','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(765,'523330','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(766,'520002','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(767,'517583','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(768,'520003','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(769,'522612','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(770,'532484','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(771,'524222','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(772,'534156','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(773,'516175','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(774,'524306','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(775,'533341','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(776,'534426','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(777,'530016','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(778,'500026','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(779,'534001','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(780,'504307','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(781,'500762','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(782,'523356','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(783,'509307','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(784,'500023','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(785,'522233','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(786,'522340','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(787,'503202','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(788,'521144','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(789,'518017','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(790,'516271','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(791,'504106','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(792,'517592','Ekambara kuppam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(793,'501103','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(794,'521148','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(795,'505525','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(796,'505401','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(797,'505188','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(798,'534268','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(799,'534001','Eluru','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(800,'534001','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(801,'534006','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(802,'534006','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(803,'534006','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(804,'534006','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(805,'534005','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(806,'534006','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(807,'522308','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(808,'500021','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(809,'505526','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(810,'533003','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(811,'500007','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(812,'521001','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(813,'507168','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(814,'517240','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(815,'500018','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(816,'523327','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(817,'500004','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(818,'500027','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(819,'523280','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(820,'531082','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(821,'522017','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(822,'522003','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(823,'506165','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(824,'522003','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(825,'500253','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(826,'500265','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(827,'500018','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(828,'502110','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(829,'503220','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(830,'524003','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(831,'506003','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(832,'534275','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(833,'505210','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(834,'502110','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(835,'533101','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(836,'506008','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(837,'530001','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(838,'524101','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(839,'524101','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(840,'533285','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(841,'500004','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(842,'522001','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(843,'522001','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(844,'522001','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(845,'522001','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(846,'522001','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(847,'522001','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(848,'521101','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(849,'521101','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(850,'500032','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(851,'500032','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(852,'515844','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(853,'509125','Gadwal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(854,'509323','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(855,'500029','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(856,'531270','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(857,'523315','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(858,'503001','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(859,'518583','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(860,'517141','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(861,'531201','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(862,'530026','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(863,'521109','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(864,'516120','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(865,'516267','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(866,'521403','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(867,'534198','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(868,'524317','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(869,'503114','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(870,'515001','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(871,'533201','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(872,'500001','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(873,'504001','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(874,'522403','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(875,'505301','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(876,'507003','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(877,'509103','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(878,'530005','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(879,'503001','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(880,'500003','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(881,'521123','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(882,'531001','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(883,'533004','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(884,'522201','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(885,'500380','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(886,'508248','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(887,'520003','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(888,'520003','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(889,'521202','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(890,'531001','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(891,'534002','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(892,'530003','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(893,'533103','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(894,'517325','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(895,'505001','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(896,'521201','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(897,'524236','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(898,'515521','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(899,'505445','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(900,'517125','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(901,'522271','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(902,'509306','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(903,'531029','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(904,'501115','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(905,'517564','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(906,'516319','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(907,'505474','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(908,'521101','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(909,'531215','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(910,'532405','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(911,'532102','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(912,'508201','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(913,'518452','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(914,'507210','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(915,'515731','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(916,'505186','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(917,'532463','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(918,'505471','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(919,'531075','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(920,'515004','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(921,'506345','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(922,'506143','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(923,'521133','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(924,'501301','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(925,'509173','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(926,'523357','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(927,'523357','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(928,'523357','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(929,'501151','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(930,'503001','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(931,'506244','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(932,'501102','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(933,'505209','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(934,'521001','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(935,'507158','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(936,'533286','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(937,'508286','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(938,'500008','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(939,'500020','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(940,'533468','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(941,'517147','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(942,'521111','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(943,'515866','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(944,'505532','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(945,'509303','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(946,'533445','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(947,'507174','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(948,'518138','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(949,'533344','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(950,'534362','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(951,'521322','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(952,'508381','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(953,'518463','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(954,'515401','Gooty','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(955,'515401','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(956,'515401','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(957,'515402','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(958,'523001','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(959,'509206','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(960,'530027','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(961,'533274','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(962,'534316','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(963,'534450','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(964,'507214','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(965,'516233','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(966,'534260','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(967,'515231','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(968,'523246','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(969,'500015','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(970,'507134','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(971,'531023','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(972,'515292','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(973,'506344','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(974,'533105','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(975,'530040','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(976,'530040','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(977,'533450','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(978,'501403','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(979,'515233','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(980,'534350','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(981,'507138','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(982,'504208','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(983,'506002','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(984,'515801','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(985,'500265','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(986,'515271','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(987,'508238','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(988,'508257','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(989,'504308','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(990,'521301','Gudivada','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(991,'521301','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(992,'521301','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(993,'509221','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(994,'521356','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(995,'523281','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(996,'518466','Gudur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(997,'508127','Gudur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(998,'524101','Gudur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(999,'506134','Gudur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1000,'517161','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1001,'532005','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1002,'502278','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1003,'502278','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1004,'502278','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1005,'524407','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1006,'505304','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1007,'504309','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1008,'508257','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1009,'515863','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1010,'532523','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1011,'534267','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1012,'524234','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1013,'500001','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1014,'520005','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1015,'524414','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1016,'501515','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1017,'534116','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1018,'523240','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1019,'523243','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1020,'516438','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1021,'509342','Gundmal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1022,'534427','Gundugolanu','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1023,'518150','Gundupapala','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1024,'509341','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1025,'501521','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1026,'515801','Guntakal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1027,'522024','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1028,'522026','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1029,'522036','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1030,'522001','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1031,'522003','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1032,'522004','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1033,'522004','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1034,'504322','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1035,'502211','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1036,'503001','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1037,'531303','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1038,'517297','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1039,'533101','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1040,'522281','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1041,'533014','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1042,'534343','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1043,'507003','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1044,'515164','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1045,'518426','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1046,'517213','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1047,'530004','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1048,'500010','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1049,'504344','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1050,'518348','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1051,'515282','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1052,'518333','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1053,'500029','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1054,'508116','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1055,'506001','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1056,'506011','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1057,'502251','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1058,'518470','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1059,'500014','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1060,'509001','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1061,'521105','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1062,'502001','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1063,'534211','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1064,'523227','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1065,'520003','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1066,'515801','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1067,'532243','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1068,'515872','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1069,'532550','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1070,'506371','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1071,'504305','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1072,'502297','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1073,'502113','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1074,'501505','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1075,'508126','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1076,'515286','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1077,'500266','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1078,'508202','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1079,'501504','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1080,'500029','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1081,'500029','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1082,'500001','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1083,'515201','Hindupur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1084,'515202','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1085,'515212','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1086,'500042','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1087,'500051','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1088,'500051','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1089,'532459','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1090,'518346','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1091,'516361','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1092,'518382','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1093,'500003','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1094,'530022','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1095,'500028','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1096,'509334','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1097,'505467','Husnabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1098,'509350','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1099,'518011','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1100,'500264','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1101,'508204','Huzurnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1102,'500001','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1103,'505468','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1104,'500012','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1105,'500001','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1106,'500013','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1107,'500001','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1108,'500036','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1109,'521301','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1110,'500017','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1111,'500031','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1112,'502267','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1113,'509347','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1114,'505450','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1115,'521226','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1116,'501506','Ibrahimpatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1117,'532312','Ichapuram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1118,'502324','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1119,'502307','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1120,'523194','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1121,'523190','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1122,'517148','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1123,'518186','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1124,'500855','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1125,'533124','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1126,'503164','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1127,'504342','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1128,'504346','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1129,'503111','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1130,'502103','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1131,'508346','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1132,'501152','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1133,'504106','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1134,'509226','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1135,'502330','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1136,'533006','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1137,'524314','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1138,'521311','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1139,'505530','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1140,'504296','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1141,'530007','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1142,'531211','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1143,'506007','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1144,'522034','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1145,'509002','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1146,'500040','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1147,'531211','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1148,'500035','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1149,'518157','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1150,'508288','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1151,'530014','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1152,'521001','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1153,'506252','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1154,'522296','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1155,'522658','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1156,'523166','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1157,'534217','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1158,'517130','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1159,'521170','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1160,'502114','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1161,'517128','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1162,'530010','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1163,'505187','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1164,'524324','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1165,'503111','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1166,'533219','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1167,'502296','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1168,'522265','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1169,'500028','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1170,'502281','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1171,'503111','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1172,'500014','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1173,'521301','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1174,'532407','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1175,'517501','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1176,'533435','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1177,'521175','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1178,'505327','Jagtial','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1179,'500587','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1180,'504325','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1181,'504313','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1182,'504216','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1183,'509211','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1184,'509353','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1185,'503201','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1186,'524223','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1187,'518220','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1188,'508126','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1189,'505184','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1190,'515712','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1191,'532432','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1192,'500007','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1193,'531250','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1194,'516434','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1195,'516434','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1196,'505122','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1197,'522266','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1198,'507152','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1199,'521321','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1200,'524202','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1201,'517217','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1202,'523165','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1203,'534447','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1204,'506352','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1205,'503102','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1206,'501142','Jangaon','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1207,'505547','Jangaon','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1208,'506167','Jangaon','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1209,'506167','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1210,'534447','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1211,'503193','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1212,'504205','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1213,'503246','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1214,'508355','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1215,'501508','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1216,'505002','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1217,'503001','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1218,'524131','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1219,'521171','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1220,'521171','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1221,'523297','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1222,'507177','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1223,'505498','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1224,'534456','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1225,'521175','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1226,'521175','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1227,'500006','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1228,'505410','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1229,'534265','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1230,'502270','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1231,'502270','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1232,'502270','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1233,'518016','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1234,'500002','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1235,'505001','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1236,'503305','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1237,'509140','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1238,'505188','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1239,'518596','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1240,'508289','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1241,'503001','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1242,'501154','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1243,'508262','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1244,'521181','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1245,'508248','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1246,'505498','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1247,'505001','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1248,'505470','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1249,'508115','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1250,'523181','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1251,'515591','Kadiri','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1252,'533126','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1253,'524410','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1254,'518350','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1255,'509358','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1256,'509383','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1257,'534416','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1258,'530024','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1259,'522273','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1260,'517002','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1261,'534331','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1262,'506015','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1263,'506007','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1264,'533001','Kakinada','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1265,'533001','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1266,'533007','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1267,'533007','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1268,'522112','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1269,'507313','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1270,'517236','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1271,'516217','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1272,'524409','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1273,'517301','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1274,'521344','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1275,'524224','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1276,'517234','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1277,'501106','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1278,'534237','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1279,'521333','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1280,'515303','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1281,'517113','Kallur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1282,'507209','Kallur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1283,'524441','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1284,'515774','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1285,'508347','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1286,'524343','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1287,'517151','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1288,'502001','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1289,'505188','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1290,'509324','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1291,'509117','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1292,'515761','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1293,'507111','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1294,'515761','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1295,'504231','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1296,'503111','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1297,'517166','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1298,'520012','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1299,'515835','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1300,'515001','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1301,'505102','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1302,'516289','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1303,'505188','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1304,'503111','Kamareddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1305,'503111','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1306,'534449','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1307,'515765','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1308,'521227','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1309,'517216','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1310,'503111','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1311,'523271','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1312,'523303','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1313,'505184','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1314,'517565','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1315,'508002','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1316,'522259','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1317,'515641','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1318,'505152','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1319,'501504','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1320,'518593','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1321,'500258','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1322,'508281','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1323,'506244','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1324,'530008','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1325,'522180','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1326,'141001','Ludhiana','Punjab','0000-00-00 00:00:00','2019-03-24 22:27:17');

/*Table structure for table `prepaid_pincodes` */

DROP TABLE IF EXISTS `prepaid_pincodes`;

CREATE TABLE `prepaid_pincodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pincode` varchar(20) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1327 DEFAULT CHARSET=latin1;

/*Data for the table `prepaid_pincodes` */

insert  into `prepaid_pincodes`(`id`,`pincode`,`city`,`state`,`created_at`,`updated_at`) values 
(1,'744104','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(2,'744208','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(3,'744107','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(4,'744201','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(5,'744302','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(6,'744301','Car Nicobar','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(7,'744202','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(8,'744102','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(9,'744211','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(10,'744207','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(11,'744103','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(12,'744209','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(13,'744304','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(14,'744203','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(15,'744101','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(16,'744204','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(17,'744101','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(18,'744303','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(19,'744104','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(20,'744105','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(21,'744210','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(22,'744101','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(23,'744205','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(24,'744106','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(25,'744206','Port Blair','Andaman Nicobar','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(26,'524002','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(27,'508207','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(28,'504251','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(29,'500463','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(30,'500890','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(31,'531001','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(32,'500030','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(33,'500049','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(34,'509343','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(35,'522004','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(36,'515001','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(37,'518543','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(38,'506144','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(39,'505208','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(40,'522015','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(41,'522403','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(42,'500004','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(43,'500252','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(44,'509375','Lingotam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(45,'534123','Achanta','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(46,'531011','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(47,'504001','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(48,'500463','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(49,'523201','Addanki','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(50,'523001','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(51,'533428','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(52,'504001','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(53,'504002','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(54,'505188','Adivarampet','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(55,'507101','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(56,'500007','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(57,'500032','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(58,'518301','Adoni','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(59,'518302','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(60,'518301','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(61,'518301','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(62,'508367','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(63,'500007','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(64,'522263','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(65,'500012','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(66,'516421','Agadur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(67,'515311','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(68,'501146','Agnoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(69,'522270','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(70,'534196','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(71,'522004','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(72,'500030','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(73,'500028','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(74,'523155','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(75,'501522','Ainapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(76,'522659','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(77,'500043','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(78,'508216','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(79,'520015','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(80,'532552','Ajjada','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(81,'534339','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(82,'516132','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(83,'534235','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(84,'534235','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(85,'516506','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(86,'530016','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(87,'532219','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(88,'517536','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(89,'518196','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(90,'521245','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(91,'509362','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(92,'531240','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(93,'509152','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(94,'533233','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(95,'534126','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(96,'533101','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(97,'505533','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(98,'505330','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(99,'508101','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(100,'502269','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(101,'518543','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(102,'533217','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(103,'502310','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(104,'530004','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(105,'503214','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(106,'524315','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(107,'524315','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(108,'509150','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(109,'501514','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(110,'518395','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(111,'509149','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(112,'509388','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(113,'515566','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(114,'532185','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(115,'532185','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(116,'501504','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(117,'533201','Amalapuram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(118,'533201','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(119,'515445','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(120,'509321','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(121,'509201','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(122,'515281','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(123,'522020','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(124,'522007','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(125,'509130','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(126,'509142','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(127,'533214','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(128,'503235','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(129,'505306','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(130,'502103','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(131,'500013','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(132,'500016','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(133,'509330','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(134,'515822','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(135,'523180','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(136,'532015','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(137,'508219','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(138,'522325','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(139,'508290','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(140,'531001','Anakapalle','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(141,'531001','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(142,'531001','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(143,'531001','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(144,'500004','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(145,'522003','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(146,'530042','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(147,'534111','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(148,'515001','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(149,'515002','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(150,'516357','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(151,'516105','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(152,'516228','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(153,'524302','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(154,'533222','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(155,'522301','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(156,'522014','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(157,'501105','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(158,'516116','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(159,'533342','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(160,'533342','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(161,'501201','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(162,'524004','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(163,'500044','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(164,'503215','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(165,'530003','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(166,'502273','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(167,'524203','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(168,'522211','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(169,'521330','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(170,'533307','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(171,'508290','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(172,'508227','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(173,'533406','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(174,'524304','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(175,'533252','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(176,'505466','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(177,'505514','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(178,'521176','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(179,'533557','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(180,'517325','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(181,'515455','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(182,'522310','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(183,'533005','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(184,'500049','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(185,'522503','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(186,'531230','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(187,'531149','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(188,'531151','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(189,'532401','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(190,'534230','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(191,'515001','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(192,'524119','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(193,'503224','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(194,'503224','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(195,'503224','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(196,'517330','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(197,'508112','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(198,'523335','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(199,'521114','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(200,'534152','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(201,'517129','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(202,'520002','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(203,'522002','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(204,'522601','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(205,'502220','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(206,'533104','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(207,'505173','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(208,'500020','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(209,'518005','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(210,'506133','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(211,'507116','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(212,'500028','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(213,'504293','Asifabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(214,'518347','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(215,'507301','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(216,'522409','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(217,'531011','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(218,'516501','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(219,'515751','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(220,'518422','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(221,'502292','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(222,'508111','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(223,'524322','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(224,'506342','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(225,'509131','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(226,'533235','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(227,'534134','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(228,'534134','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(229,'521211','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(230,'509363','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(231,'530012','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(232,'521121','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(233,'521121','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(234,'533230','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(235,'530001','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(236,'517109','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(237,'520003','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(238,'517278','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(239,'501504','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(240,'500038','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(241,'515862','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(242,'521102','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(243,'516227','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(244,'516227','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(245,'500264','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(246,'517415','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(247,'500048','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(248,'517194','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(249,'509202','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(250,'522202','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(251,'508206','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(252,'524002','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(253,'516484','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(254,'521001','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(255,'516484','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(256,'524129','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(257,'517561','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(258,'532557','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(259,'503217','Balkonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(260,'521177','Balusupadu','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(261,'518124','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(262,'518124','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(263,'505407','Bandankal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(264,'533221','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(265,'522021','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(266,'518523','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(267,'521179','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(268,'522663','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(269,'523226','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(270,'524404','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(271,'517416','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(272,'507202','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(273,'500034','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(274,'508213','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(275,'503187','Banswada','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(276,'503187','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(277,'506003','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(278,'502103','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(279,'503231','Bardipur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(280,'500027','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(281,'532263','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(282,'532264','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(283,'505187','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(284,'504101','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(285,'515306','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(286,'500001','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(287,'501143','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(288,'501528','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(289,'521001','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(290,'515661','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(291,'532456','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(292,'516164','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(293,'507127','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(294,'507211','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(295,'500004','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(296,'533242','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(297,'506002','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(298,'500039','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(299,'505188','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(300,'500012','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(301,'500016','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(302,'500003','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(303,'505528','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(304,'504324','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(305,'518462','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(306,'522411','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(307,'504251','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(308,'504251','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(309,'504251','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(310,'500049','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(311,'515741','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(312,'534001','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(313,'533409','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(314,'533210','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(315,'524126','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(316,'520002','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(317,'518599','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(318,'522279','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(319,'521301','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(320,'507111','Bhadrachalam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(321,'534251','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(322,'504001','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(323,'518004','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(324,'504103','Bhainsa','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(325,'507101','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(326,'517501','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(327,'530012','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(328,'502103','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(329,'518301','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(330,'533003','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(331,'521001','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(332,'521140','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(333,'522256','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(334,'521118','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(335,'521231','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(336,'500002','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(337,'503115','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(338,'531241','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(339,'533514','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(340,'531163','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(341,'504204','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(342,'505471','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(343,'503101','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(344,'503307','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(345,'517106','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(346,'534201','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(347,'534301','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(348,'534203','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(349,'533410','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(350,'534301','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(351,'503307','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(352,'505101','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(353,'531216','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(354,'508116','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(355,'500003','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(356,'500003','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(357,'508116','Bhongir','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(358,'508116','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(359,'508224','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(360,'504001','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(361,'507112','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(362,'509382','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(363,'508126','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(364,'503125','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(365,'533343','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(366,'503306','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(367,'505475','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(368,'509203','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(369,'505475','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(370,'509145','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(371,'523106','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(372,'503321','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(373,'524142','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(374,'524142','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(375,'504304','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(376,'532573','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(377,'532573','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(378,'532558','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(379,'532558','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(380,'532558','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(381,'533215','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(382,'518146','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(383,'503185','Bodhan','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(384,'503185','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(385,'522354','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(386,'522354','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(387,'524142','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(388,'516392','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(389,'500010','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(390,'516360','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(391,'518517','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(392,'517134','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(393,'515763','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(394,'505480','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(395,'507204','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(396,'508126','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(397,'505472','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(398,'501502','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(399,'509345','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(400,'531160','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(401,'534207','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(402,'515427','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(403,'531260','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(404,'508105','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(405,'532408','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(406,'517146','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(407,'505524','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(408,'517108','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(409,'523155','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(410,'523110','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(411,'500361','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(412,'500011','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(413,'524346','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(414,'521370','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(415,'522214','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(416,'518432','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(417,'532220','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(418,'522002','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(419,'524001','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(420,'501202','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(421,'517111','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(422,'506221','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(423,'524305','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(424,'520002','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(425,'522013','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(426,'509213','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(427,'515241','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(428,'532427','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(429,'504106','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(430,'524003','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(431,'515144','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(432,'515144','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(433,'504106','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(434,'517351','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(435,'532417','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(436,'507114','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(437,'507001','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(438,'532445','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(439,'532551','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(440,'522601','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(441,'522201','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(442,'502110','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(443,'524305','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(444,'532312','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(445,'503111','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(446,'522010','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(447,'532502','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(448,'500003','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(449,'530006','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(450,'505102','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(451,'521001','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(452,'534448','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(453,'508001','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(454,'501158','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(455,'517001','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(456,'517001','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(457,'517001','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(458,'517002','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(459,'532406','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(460,'503180','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(461,'507154','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(462,'508202','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(463,'506381','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(464,'532406','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(465,'516001','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(466,'516001','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(467,'516001','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(468,'516001','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(469,'516001','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(470,'516001','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(471,'516001','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(472,'516001','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(473,'518206','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(474,'504209','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(475,'500013','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(476,'500022','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(477,'500768','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(478,'500134','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(479,'534196','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(480,'515813','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(481,'508111','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(482,'506301','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(483,'518553','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(484,'534342','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(485,'500171','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(486,'500036','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(487,'524221','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(488,'516260','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(489,'508350','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(490,'533503','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(491,'521126','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(492,'532581','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(493,'515419','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(494,'505505','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(495,'500024','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(496,'508259','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(497,'515458','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(498,'509115','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(499,'521182','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(500,'522311','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(501,'522007','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(502,'517101','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(503,'517101','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(504,'520010','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(505,'507135','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(506,'500264','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(507,'508116','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(508,'508255','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(509,'505505','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(510,'532216','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(511,'518675','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(512,'502221','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(513,'517260','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(514,'507133','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(515,'534004','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(516,'522274','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(517,'522277','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(518,'523188','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(519,'515843','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(520,'533449','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(521,'522212','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(522,'505412','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(523,'502255','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(524,'509333','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(525,'509332','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(526,'501516','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(527,'533261','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(528,'505468','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(529,'506168','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(530,'517417','Chembakur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(531,'517417','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(532,'530001','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(533,'515101','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(534,'516502','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(535,'506332','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(536,'506332','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(537,'516162','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(538,'524406','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(539,'503228','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(540,'508013','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(541,'517305','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(542,'517305','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(543,'522309','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(544,'508258','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(545,'517390','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(546,'507169','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(547,'507169','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(548,'501503','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(549,'533225','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(550,'517517','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(551,'500020','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(552,'502374','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(553,'521002','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(554,'516310','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(555,'515341','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(556,'500025','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(557,'508230','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(558,'521178','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(559,'524412','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(560,'522332','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(561,'523226','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(562,'508116','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(563,'532001','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(564,'531163','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(565,'523135','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(566,'509218','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(567,'501143','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(568,'509243','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(569,'508287','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(570,'501512','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(571,'530023','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(572,'516109','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(573,'522299','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(574,'522201','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(575,'504110','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(576,'517193','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(577,'516433','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(578,'516165','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(579,'516214','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(580,'515422','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(581,'509141','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(582,'534486','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(583,'504201','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(584,'522620','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(585,'508250','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(586,'531111','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(587,'517277','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(588,'507208','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(589,'509111','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(590,'534460','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(591,'502299','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(592,'533232','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(593,'521001','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(594,'507126','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(595,'532128','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(596,'502220','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(597,'523155','Chirala','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(598,'523155','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(599,'523124','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(600,'504294','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(601,'521128','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(602,'506223','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(603,'501113','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(604,'531162','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(605,'517198','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(606,'520009','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(607,'517001','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(608,'517002','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(609,'517004','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(610,'517003','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(611,'516104','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(612,'508114','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(613,'506356','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(614,'509109','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(615,'522298','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(616,'521117','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(617,'523285','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(618,'531036','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(619,'522264','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(620,'505415','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(621,'521251','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(622,'533461','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(623,'522006','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(624,'508252','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(625,'522003','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(626,'517257','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(627,'520005','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(628,'515415','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(629,'507001','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(630,'533002','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(631,'521001','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(632,'515001','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(633,'515004','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(634,'522403','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(635,'508002','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(636,'523001','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(637,'518202','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(638,'524201','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(639,'532001','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(640,'533203','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(641,'504001','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(642,'534275','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(643,'534211','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(644,'500037','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(645,'504001','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(646,'532284','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(647,'500005','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(648,'516001','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(649,'516163','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(650,'516004','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(651,'523333','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(652,'523333','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(653,'505184','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(654,'534390','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(655,'530020','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(656,'507003','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(657,'500023','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(658,'517152','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(659,'509407','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(660,'508375','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(661,'524152','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(662,'505476','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(663,'507306','Dammapeta','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(664,'533103','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(665,'504206','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(666,'533263','Dangeru','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(667,'522297','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(668,'524003','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(669,'500024','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(670,'503165','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(671,'523267','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(672,'523247','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(673,'531202','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(674,'506315','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(675,'500028','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(676,'518669','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(677,'533240','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(678,'515332','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(679,'503124','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(680,'507206','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(681,'520050','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(682,'530009','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(683,'521001','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(684,'506006','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(685,'522050','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(686,'516441','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(687,'523277','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(688,'506011','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(689,'518465','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(690,'504218','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(691,'508248','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(692,'509204','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(693,'531030','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(694,'534313','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(695,'506302','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(696,'533339','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(697,'502305','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(698,'509205','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(699,'505425','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(700,'503230','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(701,'503145','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(702,'506330','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(703,'534462','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(704,'506330','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(705,'515671','Dharmavaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(706,'533430','Dharmavaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(707,'531148','Dharmavaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(708,'515671','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(709,'515672','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(710,'509133','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(711,'501121','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(712,'518222','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(713,'518222','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(714,'500006','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(715,'522258','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(716,'503175','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(717,'502321','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(718,'500036','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(719,'504306','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(720,'531061','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(721,'522276','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(722,'508258','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(723,'518021','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(724,'534314','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(725,'508333','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(726,'534239','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(727,'505002','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(728,'530002','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(729,'521002','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(730,'520001','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(731,'534202','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(732,'534266','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(733,'521332','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(734,'501525','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(735,'503123','Domakonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(736,'516431','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(737,'534351','Dommeru','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(738,'504207','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(739,'523305','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(740,'508272','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(741,'522503','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(742,'530004','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(743,'531135','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(744,'522002','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(745,'531110','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(746,'522002','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(747,'503314','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(748,'532578','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(749,'502334','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(750,'506381','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(751,'517110','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(752,'518135','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(753,'533292','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(754,'533125','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(755,'500762','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(756,'532001','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(757,'533262','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(758,'523002','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(759,'502108','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(760,'502277','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(761,'524102','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(762,'522330','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(763,'521202','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(764,'507137','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(765,'523330','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(766,'520002','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(767,'517583','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(768,'520003','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(769,'522612','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(770,'532484','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(771,'524222','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(772,'534156','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(773,'516175','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(774,'524306','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(775,'533341','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(776,'534426','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(777,'530016','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(778,'500026','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(779,'534001','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(780,'504307','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(781,'500762','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(782,'523356','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(783,'509307','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(784,'500023','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(785,'522233','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(786,'522340','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(787,'503202','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(788,'521144','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(789,'518017','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(790,'516271','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(791,'504106','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(792,'517592','Ekambara kuppam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(793,'501103','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(794,'521148','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(795,'505525','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(796,'505401','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(797,'505188','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(798,'534268','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(799,'534001','Eluru','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(800,'534001','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(801,'534006','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(802,'534006','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(803,'534006','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(804,'534006','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(805,'534005','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(806,'534006','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(807,'522308','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(808,'500021','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(809,'505526','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(810,'533003','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(811,'500007','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(812,'521001','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(813,'507168','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(814,'517240','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(815,'500018','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(816,'523327','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(817,'500004','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(818,'500027','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(819,'523280','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(820,'531082','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(821,'522017','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(822,'522003','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(823,'506165','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(824,'522003','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(825,'500253','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(826,'500265','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(827,'500018','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(828,'502110','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(829,'503220','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(830,'524003','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(831,'506003','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(832,'534275','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(833,'505210','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(834,'502110','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(835,'533101','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(836,'506008','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(837,'530001','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(838,'524101','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(839,'524101','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(840,'533285','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(841,'500004','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(842,'522001','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(843,'522001','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(844,'522001','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(845,'522001','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(846,'522001','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(847,'522001','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(848,'521101','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(849,'521101','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(850,'500032','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(851,'500032','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(852,'515844','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(853,'509125','Gadwal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(854,'509323','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(855,'500029','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(856,'531270','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(857,'523315','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(858,'503001','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(859,'518583','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(860,'517141','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(861,'531201','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(862,'530026','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(863,'521109','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(864,'516120','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(865,'516267','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(866,'521403','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(867,'534198','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(868,'524317','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(869,'503114','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(870,'515001','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(871,'533201','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(872,'500001','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(873,'504001','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(874,'522403','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(875,'505301','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(876,'507003','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(877,'509103','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(878,'530005','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(879,'503001','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(880,'500003','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(881,'521123','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(882,'531001','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(883,'533004','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(884,'522201','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(885,'500380','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(886,'508248','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(887,'520003','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(888,'520003','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(889,'521202','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(890,'531001','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(891,'534002','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(892,'530003','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(893,'533103','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(894,'517325','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(895,'505001','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(896,'521201','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(897,'524236','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(898,'515521','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(899,'505445','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(900,'517125','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(901,'522271','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(902,'509306','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(903,'531029','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(904,'501115','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(905,'517564','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(906,'516319','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(907,'505474','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(908,'521101','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(909,'531215','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(910,'532405','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(911,'532102','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(912,'508201','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(913,'518452','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(914,'507210','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(915,'515731','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(916,'505186','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(917,'532463','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(918,'505471','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(919,'531075','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(920,'515004','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(921,'506345','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(922,'506143','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(923,'521133','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(924,'501301','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(925,'509173','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(926,'523357','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(927,'523357','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(928,'523357','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(929,'501151','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(930,'503001','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(931,'506244','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(932,'501102','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(933,'505209','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(934,'521001','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(935,'507158','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(936,'533286','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(937,'508286','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(938,'500008','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(939,'500020','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(940,'533468','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(941,'517147','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(942,'521111','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(943,'515866','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(944,'505532','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(945,'509303','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(946,'533445','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(947,'507174','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(948,'518138','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(949,'533344','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(950,'534362','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(951,'521322','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(952,'508381','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(953,'518463','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(954,'515401','Gooty','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(955,'515401','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(956,'515401','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(957,'515402','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(958,'523001','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(959,'509206','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(960,'530027','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(961,'533274','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(962,'534316','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(963,'534450','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(964,'507214','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(965,'516233','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(966,'534260','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(967,'515231','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(968,'523246','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(969,'500015','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(970,'507134','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(971,'531023','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(972,'515292','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(973,'506344','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(974,'533105','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(975,'530040','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(976,'530040','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(977,'533450','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(978,'501403','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(979,'515233','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(980,'534350','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(981,'507138','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(982,'504208','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(983,'506002','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(984,'515801','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(985,'500265','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(986,'515271','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(987,'508238','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(988,'508257','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(989,'504308','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(990,'521301','Gudivada','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(991,'521301','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(992,'521301','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(993,'509221','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(994,'521356','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(995,'523281','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(996,'518466','Gudur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(997,'508127','Gudur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(998,'524101','Gudur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(999,'506134','Gudur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1000,'517161','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1001,'532005','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1002,'502278','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1003,'502278','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1004,'502278','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1005,'524407','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1006,'505304','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1007,'504309','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1008,'508257','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1009,'515863','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1010,'532523','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1011,'534267','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1012,'524234','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1013,'500001','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1014,'520005','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1015,'524414','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1016,'501515','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1017,'534116','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1018,'523240','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1019,'523243','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1020,'516438','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1021,'509342','Gundmal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1022,'534427','Gundugolanu','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1023,'518150','Gundupapala','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1024,'509341','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1025,'501521','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1026,'515801','Guntakal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1027,'522024','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1028,'522026','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1029,'522036','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1030,'522001','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1031,'522003','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1032,'522004','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1033,'522004','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1034,'504322','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1035,'502211','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1036,'503001','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1037,'531303','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1038,'517297','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1039,'533101','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1040,'522281','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1041,'533014','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1042,'534343','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1043,'507003','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1044,'515164','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1045,'518426','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1046,'517213','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1047,'530004','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1048,'500010','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1049,'504344','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1050,'518348','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1051,'515282','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1052,'518333','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1053,'500029','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1054,'508116','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1055,'506001','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1056,'506011','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1057,'502251','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1058,'518470','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1059,'500014','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1060,'509001','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1061,'521105','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1062,'502001','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1063,'534211','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1064,'523227','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1065,'520003','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1066,'515801','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1067,'532243','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1068,'515872','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1069,'532550','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1070,'506371','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1071,'504305','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1072,'502297','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1073,'502113','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1074,'501505','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1075,'508126','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1076,'515286','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1077,'500266','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1078,'508202','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1079,'501504','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1080,'500029','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1081,'500029','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1082,'500001','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1083,'515201','Hindupur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1084,'515202','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1085,'515212','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1086,'500042','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1087,'500051','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1088,'500051','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1089,'532459','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1090,'518346','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1091,'516361','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1092,'518382','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1093,'500003','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1094,'530022','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1095,'500028','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1096,'509334','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1097,'505467','Husnabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1098,'509350','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1099,'518011','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1100,'500264','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1101,'508204','Huzurnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1102,'500001','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1103,'505468','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1104,'500012','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1105,'500001','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1106,'500013','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1107,'500001','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1108,'500036','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1109,'521301','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1110,'500017','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1111,'500031','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1112,'502267','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1113,'509347','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1114,'505450','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1115,'521226','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1116,'501506','Ibrahimpatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1117,'532312','Ichapuram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1118,'502324','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1119,'502307','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1120,'523194','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1121,'523190','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1122,'517148','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1123,'518186','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1124,'500855','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1125,'533124','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1126,'503164','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1127,'504342','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1128,'504346','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1129,'503111','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1130,'502103','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1131,'508346','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1132,'501152','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1133,'504106','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1134,'509226','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1135,'502330','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1136,'533006','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1137,'524314','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1138,'521311','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1139,'505530','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1140,'504296','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1141,'530007','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1142,'531211','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1143,'506007','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1144,'522034','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1145,'509002','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1146,'500040','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1147,'531211','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1148,'500035','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1149,'518157','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1150,'508288','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1151,'530014','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1152,'521001','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1153,'506252','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1154,'522296','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1155,'522658','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1156,'523166','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1157,'534217','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1158,'517130','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1159,'521170','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1160,'502114','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1161,'517128','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1162,'530010','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1163,'505187','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1164,'524324','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1165,'503111','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1166,'533219','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1167,'502296','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1168,'522265','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1169,'500028','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1170,'502281','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1171,'503111','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1172,'500014','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1173,'521301','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1174,'532407','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1175,'517501','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1176,'533435','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1177,'521175','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1178,'505327','Jagtial','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1179,'500587','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1180,'504325','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1181,'504313','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1182,'504216','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1183,'509211','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1184,'509353','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1185,'503201','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1186,'524223','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1187,'518220','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1188,'508126','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1189,'505184','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1190,'515712','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1191,'532432','Srikakulam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1192,'500007','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1193,'531250','Vizianagaram','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1194,'516434','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1195,'516434','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1196,'505122','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1197,'522266','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1198,'507152','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1199,'521321','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1200,'524202','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1201,'517217','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1202,'523165','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1203,'534447','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1204,'506352','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1205,'503102','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1206,'501142','Jangaon','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1207,'505547','Jangaon','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1208,'506167','Jangaon','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1209,'506167','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1210,'534447','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1211,'503193','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1212,'504205','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1213,'503246','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1214,'508355','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1215,'501508','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1216,'505002','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1217,'503001','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1218,'524131','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1219,'521171','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1220,'521171','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1221,'523297','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1222,'507177','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1223,'505498','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1224,'534456','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1225,'521175','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1226,'521175','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1227,'500006','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1228,'505410','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1229,'534265','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1230,'502270','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1231,'502270','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1232,'502270','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1233,'518016','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1234,'500002','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1235,'505001','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1236,'503305','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1237,'509140','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1238,'505188','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1239,'518596','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1240,'508289','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1241,'503001','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1242,'501154','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1243,'508262','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1244,'521181','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1245,'508248','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1246,'505498','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1247,'505001','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1248,'505470','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1249,'508115','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1250,'523181','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1251,'515591','Kadiri','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1252,'533126','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1253,'524410','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1254,'518350','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1255,'509358','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1256,'509383','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1257,'534416','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1258,'530024','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1259,'522273','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1260,'517002','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1261,'534331','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1262,'506015','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1263,'506007','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1264,'533001','Kakinada','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1265,'533001','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1266,'533007','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1267,'533007','East Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1268,'522112','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1269,'507313','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1270,'517236','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1271,'516217','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1272,'524409','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1273,'517301','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1274,'521344','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1275,'524224','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1276,'517234','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1277,'501106','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1278,'534237','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1279,'521333','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1280,'515303','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1281,'517113','Kallur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1282,'507209','Kallur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1283,'524441','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1284,'515774','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1285,'508347','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1286,'524343','Nellore','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1287,'517151','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1288,'502001','Medak','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1289,'505188','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1290,'509324','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1291,'509117','Mahboobnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1292,'515761','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1293,'507111','Khammam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1294,'515761','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1295,'504231','Adilabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1296,'503111','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1297,'517166','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1298,'520012','Krishna','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1299,'515835','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1300,'515001','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1301,'505102','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1302,'516289','Cuddapah','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1303,'505188','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1304,'503111','Kamareddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1305,'503111','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1306,'534449','West Godavari','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1307,'515765','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1308,'521227','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1309,'517216','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1310,'503111','Nizamabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1311,'523271','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1312,'523303','Prakasam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1313,'505184','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1314,'517565','Chittoor','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1315,'508002','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1316,'522259','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1317,'515641','Anantapur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1318,'505152','Karimnagar','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1319,'501504','Ranga Reddy','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1320,'518593','Kurnool','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1321,'500258','Hyderabad','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1322,'508281','Nalgonda','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1323,'506244','Warangal','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1324,'530008','Vishakhapatnam','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1325,'522180','Guntur','Andhra Pradesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(1326,'141001','Ludhiana','Punjab','0000-00-00 00:00:00','2019-03-24 22:28:21');

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `care` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sleeve` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pattern` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `weight` int(11) NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `video` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `feature_item` tinyint(4) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `products` */

insert  into `products`(`id`,`category_id`,`product_name`,`product_code`,`product_color`,`description`,`care`,`sleeve`,`pattern`,`price`,`weight`,`image`,`video`,`feature_item`,`status`,`created_at`,`updated_at`) values 
(9,5,'Green TShirt','GTS001','Green','Green TShirt is at its best price and of high quality.','Not washable','Half Sleeve','Plain',2200.00,200,'76925.jpg','amit.mp4',1,1,'2018-04-14 15:34:05','2019-06-26 17:50:11'),
(10,3,'Blue Casual Tshirt','BCT011','Blue','','','Half Sleeve','Checked',1500.00,100,'52109.jpg','',1,1,'2018-04-14 15:34:29','2019-06-26 17:50:30'),
(11,6,'Sports TShirt','FTS001','Black','','','Half Sleeve','',2200.00,0,'28449.jpg','',0,1,'2018-05-06 10:39:16','2019-05-06 17:40:06'),
(12,5,'Blue Casual Tshirt','BCT012','Blue','Blue Casual Tshirt has a round neck, half sleeves','','','',2200.00,0,'83971.png','',1,1,'2018-05-20 05:21:22','2019-01-24 16:58:35'),
(13,5,'Blue Casual Tshirt','BCT01','Blue','test','','','',1000.00,0,'51771.jpg','',1,1,'2018-05-20 05:22:27','2019-02-09 17:29:44'),
(14,5,'Blue Casual Tshirt','BCT03','Blue','test','test1','','',1000.00,0,'9988.jpg','',0,1,'2018-05-20 05:29:25','2019-01-09 17:13:58'),
(17,5,'Blue Casual Tshirt','BCT06','Blue','','','','',1000.00,0,'57345.jpg','',0,0,'2018-06-16 16:29:01','2019-01-09 17:14:49'),
(18,5,'Red TShirt','RT001','Red','Test Product','','Half Sleeve','Printed',1000.00,200,'98469.jpg','',1,1,'2019-01-24 16:50:59','2019-06-26 17:51:21'),
(19,5,'Blue T-Shirt','BT1001','Blue','','','Half Sleeve','',800.00,0,'18479.jpg','amit.mp4',0,1,'2019-04-05 16:58:13','2019-05-06 17:28:04'),
(20,5,'Sleeveless T-Shirt','STS001','Blue','','','Sleeveless','Plain',1000.00,0,'66475.jpg','',0,1,'2019-05-06 17:17:20','2019-05-15 16:51:00'),
(21,5,'Black T-Shirt','Bl001','Black','','','Half Sleeve','Plain',500.00,0,'57087.jpg','',0,1,'2019-05-15 16:39:56','2019-05-15 16:44:58'),
(22,5,'Black Casual TShirt','BCT001','Black','','','','',1000.00,300,'10148.jpg','',0,1,'2019-06-16 04:35:33','2019-06-16 04:39:10');

/*Table structure for table `products_attributes` */

DROP TABLE IF EXISTS `products_attributes`;

CREATE TABLE `products_attributes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `products_attributes` */

insert  into `products_attributes`(`id`,`product_id`,`sku`,`size`,`price`,`stock`,`created_at`,`updated_at`) values 
(6,10,'BCT01-S','Small',1500.00,100,'2018-05-15 18:40:25','2019-06-26 18:04:46'),
(7,10,'BCT01-M','Medium',1800.00,40,'2018-05-15 18:40:28','2019-06-01 16:10:21'),
(8,11,'FTS001-S','Small',1200.00,30,'2018-06-26 16:18:35','2019-06-07 15:12:21'),
(9,21,'Bl001-Small','Small',1000.00,20,'2019-06-07 15:26:59','2019-06-14 18:16:44'),
(10,18,'RT001-S','Small',1000.00,17,'2019-06-26 17:52:11','2020-07-09 04:38:09');

/*Table structure for table `products_images` */

DROP TABLE IF EXISTS `products_images`;

CREATE TABLE `products_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `products_images` */

insert  into `products_images`(`id`,`product_id`,`image`,`created_at`,`updated_at`) values 
(3,9,'69412.jpg','2018-05-26 17:32:58','2018-05-26 19:02:58'),
(4,9,'81426.png','2018-05-26 17:32:59','2018-05-26 19:02:59'),
(5,9,'86890.jpg','2018-05-26 17:33:00','2018-05-26 19:03:00'),
(6,9,'15927.jpg','2018-06-02 14:30:10','2018-06-02 16:00:10');

/*Table structure for table `shipping_charges` */

DROP TABLE IF EXISTS `shipping_charges`;

CREATE TABLE `shipping_charges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country` varchar(100) NOT NULL DEFAULT '',
  `shipping_charges0_500g` int(11) NOT NULL,
  `shipping_charges501_1000g` int(11) NOT NULL,
  `shipping_charges1001_2000g` int(11) NOT NULL,
  `shipping_charges2001_5000g` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=247 DEFAULT CHARSET=utf8;

/*Data for the table `shipping_charges` */

insert  into `shipping_charges`(`id`,`country`,`shipping_charges0_500g`,`shipping_charges501_1000g`,`shipping_charges1001_2000g`,`shipping_charges2001_5000g`,`created_at`,`updated_at`) values 
(1,'Afghanistan',100,100,100,100,'0000-00-00 00:00:00','2019-06-16 05:03:34'),
(2,'Albania',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(3,'Algeria',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(4,'American Samoa',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(5,'Andorra',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(6,'Angola',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(7,'Anguilla',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(8,'Antarctica',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(9,'Antigua and Barbuda',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(10,'Argentina',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(11,'Armenia',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(12,'Aruba',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(13,'Australia',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(14,'Austria',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(15,'Azerbaijan',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(16,'Bahamas',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(17,'Bahrain',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(18,'Bangladesh',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(19,'Barbados',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(20,'Belarus',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(21,'Belgium',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(22,'Belize',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(23,'Benin',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(24,'Bermuda',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(25,'Bhutan',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(26,'Bolivia',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(27,'Bosnia and Herzegovina',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(28,'Botswana',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(29,'Bouvet Island',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(30,'Brazil',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(31,'British Indian Ocean Territory',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(32,'Brunei Darussalam',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(33,'Bulgaria',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(34,'Burkina Faso',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(35,'Burundi',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(36,'Cambodia',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(37,'Cameroon',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(38,'Canada',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(39,'Cape Verde',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(40,'Cayman Islands',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(41,'Central African Republic',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(42,'Chad',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(43,'Chile',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(44,'China',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(45,'Christmas Island',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(46,'Cocos (Keeling) Islands',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(47,'Colombia',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(48,'Comoros',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(49,'Congo',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(50,'Cook Islands',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(51,'Costa Rica',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(52,'Croatia (Hrvatska)',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(53,'Cuba',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(54,'Cyprus',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(55,'Czech Republic',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(56,'Denmark',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(57,'Djibouti',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(58,'Dominica',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(59,'Dominican Republic',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(60,'East Timor',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(61,'Ecuador',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(62,'Egypt',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(63,'El Salvador',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(64,'Equatorial Guinea',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(65,'Eritrea',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(66,'Estonia',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(67,'Ethiopia',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(68,'Falkland Islands (Malvinas)',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(69,'Faroe Islands',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(70,'Fiji',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(71,'Finland',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(72,'France',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(73,'France, Metropolitan',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(74,'French Guiana',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(75,'French Polynesia',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(76,'French Southern Territories',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(77,'Gabon',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(78,'Gambia',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(79,'Georgia',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(80,'Germany',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(81,'Ghana',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(82,'Gibraltar',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(83,'Guernsey',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(84,'Greece',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(85,'Greenland',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(86,'Grenada',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(87,'Guadeloupe',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(88,'Guam',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(89,'Guatemala',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(90,'Guinea',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(91,'Guinea-Bissau',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(92,'Guyana',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(93,'Haiti',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(94,'Heard and Mc Donald Islands',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(95,'Honduras',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(96,'Hong Kong',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(97,'Hungary',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(98,'Iceland',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(99,'India',100,200,300,400,'0000-00-00 00:00:00','2019-06-16 05:04:13'),
(100,'Isle of Man',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(101,'Indonesia',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(102,'Iran (Islamic Republic of)',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(103,'Iraq',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(104,'Ireland',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(105,'Israel',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(106,'Italy',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(107,'Ivory Coast',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(108,'Jersey',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(109,'Jamaica',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(110,'Japan',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(111,'Jordan',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(112,'Kazakhstan',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(113,'Kenya',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(114,'Kiribati',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(115,'Korea, Democratic People\'s Republic of',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(116,'Korea, Republic of',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(117,'Kosovo',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(118,'Kuwait',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(119,'Kyrgyzstan',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(120,'Lao People\'s Democratic Republic',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(121,'Latvia',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(122,'Lebanon',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(123,'Lesotho',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(124,'Liberia',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(125,'Libyan Arab Jamahiriya',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(126,'Liechtenstein',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(127,'Lithuania',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(128,'Luxembourg',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(129,'Macau',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(130,'Macedonia',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(131,'Madagascar',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(132,'Malawi',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(133,'Malaysia',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(134,'Maldives',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(135,'Mali',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(136,'Malta',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(137,'Marshall Islands',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(138,'Martinique',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(139,'Mauritania',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(140,'Mauritius',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(141,'Mayotte',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(142,'Mexico',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(143,'Micronesia, Federated States of',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(144,'Moldova, Republic of',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(145,'Monaco',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(146,'Mongolia',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(147,'Montenegro',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(148,'Montserrat',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(149,'Morocco',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(150,'Mozambique',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(151,'Myanmar',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(152,'Namibia',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(153,'Nauru',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(154,'Nepal',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(155,'Netherlands',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(156,'Netherlands Antilles',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(157,'New Caledonia',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(158,'New Zealand',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(159,'Nicaragua',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(160,'Niger',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(161,'Nigeria',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(162,'Niue',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(163,'Norfolk Island',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(164,'Northern Mariana Islands',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(165,'Norway',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(166,'Oman',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(167,'Pakistan',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(168,'Palau',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(169,'Palestine',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(170,'Panama',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(171,'Papua New Guinea',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(172,'Paraguay',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(173,'Peru',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(174,'Philippines',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(175,'Pitcairn',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(176,'Poland',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(177,'Portugal',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(178,'Puerto Rico',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(179,'Qatar',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(180,'Reunion',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(181,'Romania',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(182,'Russian Federation',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(183,'Rwanda',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(184,'Saint Kitts and Nevis',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(185,'Saint Lucia',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(186,'Saint Vincent and the Grenadines',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(187,'Samoa',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(188,'San Marino',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(189,'Sao Tome and Principe',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(190,'Saudi Arabia',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(191,'Senegal',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(192,'Serbia',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(193,'Seychelles',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(194,'Sierra Leone',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(195,'Singapore',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(196,'Slovakia',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(197,'Slovenia',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(198,'Solomon Islands',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(199,'Somalia',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(200,'South Africa',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(201,'South Georgia South Sandwich Islands',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(202,'South Sudan',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(203,'Spain',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(204,'Sri Lanka',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(205,'St. Helena',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(206,'St. Pierre and Miquelon',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(207,'Sudan',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(208,'Suriname',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(209,'Svalbard and Jan Mayen Islands',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(210,'Swaziland',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(211,'Sweden',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(212,'Switzerland',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(213,'Syrian Arab Republic',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(214,'Taiwan',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(215,'Tajikistan',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(216,'Tanzania, United Republic of',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(217,'Thailand',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(218,'Togo',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(219,'Tokelau',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(220,'Tonga',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(221,'Trinidad and Tobago',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(222,'Tunisia',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(223,'Turkey',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(224,'Turkmenistan',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(225,'Turks and Caicos Islands',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(226,'Tuvalu',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(227,'Uganda',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(228,'Ukraine',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(229,'United Arab Emirates',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(230,'United Kingdom',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(231,'United States',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(232,'United States minor outlying islands',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(233,'Uruguay',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(234,'Uzbekistan',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(235,'Vanuatu',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(236,'Vatican City State',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(237,'Venezuela',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(238,'Vietnam',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(239,'Virgin Islands (British)',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(240,'Virgin Islands (U.S.)',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(241,'Wallis and Futuna Islands',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(242,'Western Sahara',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(243,'Yemen',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(244,'Zaire',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(245,'Zambia',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45'),
(246,'Zimbabwe',0,0,0,0,'0000-00-00 00:00:00','2019-06-16 10:21:45');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pincode` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin` tinyint(1) DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`address`,`city`,`state`,`country`,`pincode`,`mobile`,`email`,`password`,`admin`,`status`,`remember_token`,`created_at`,`updated_at`) values 
(1,'Amit Gupta','','','','','','','dandyfirmansyah1998@gmail.com','$2y$10$yA9vviVNndvRSNtV9YaowuFGpXr/Xv.4Xua9xt6trQ7nChttfUN8S',1,0,'DYtCJ20Ne5ygScQWPHOokeYOMXbKV2BOF2mYkJHskHWGg0tDCqoP50d0joBa','2018-03-09 16:18:34','2018-06-04 16:56:05'),
(2,'Amit Gupta','123 Mall Road','New Delhi','Delhi','India','141001','9800000000','amit100@yopmail.com','$2y$10$yUPws5R.kIcy2CGUKJfUEe.t3G9QA9WEIJ4sm7q0KfQaZaXf7xcwa',0,1,'YBeBEbdd3IJb3MY48gm1bF0NhUWujIwDTuDyihKq6Yd9dL1gRrnGDrbDW86y','2018-08-31 16:17:18','2019-01-31 18:49:01'),
(3,'Amit Gupta','','','','','','','amit100646@yopmail.com','$2y$10$dD3FmfhMJHWNxClkx5cfu.zEqV16K0bOR9WJLWF0ZpEgeoWDT.o32',0,0,'AUaLi6uH21i9eaOXbFlNriHGMo3BoxpBNh8ABkcrgv5hH9mKfFiQBscBkJsn','2018-08-31 16:18:19','2018-08-31 16:18:19'),
(4,'John','Test Address','Ludhiana','Punjab','India','141001','9800000000','john@yopmail.com','$2y$10$CNwOV/ocptJajX7hwWe8wO86PFJwTvYkjjQWSLGGOxChAl.BBBipO',0,1,'2IGUMgzO09iGYUdJYcQQJC6bdTLBBPq3BsLKcojdby09Vc42Bmv2F1PsEcN8','2018-08-31 16:26:01','2019-03-24 16:57:26'),
(5,'Mike','','','','','','','mike1000@yahoo.com','$2y$10$a9fgfK/K/jdJFxGQVavPM.3UvXC2FWpRzV/H4sytx1.NMwz/UlMBi',0,0,'9HdPQabUf8s75UZ4gKKI2vWD9c74rRAnoGLFt5WwVOpDQc2zLy1dQFwpXPAZ','2018-09-01 18:35:21','2018-09-01 18:35:21'),
(6,'Raj','','','','','','','raj@gmail.com','$2y$10$wXQwSZLMkA1ZWpnUI35Zr.oQtAaKe2d9K1RThq7zBLlsLV4ukzip2',0,0,'cSQdOPc6E1qH7xRwLR9wxPuaSFeuZDWpcjwenWQlmDWpwHpWko2nWw5Korsr','2018-09-01 18:47:33','2018-09-01 18:47:33'),
(7,'Amit Gupta',NULL,'','','','','','amit400@yopmail.com','$2y$10$rd43vJDziNsdrJlsKbDZru/esOMhLAA8nJtCrMgglJ.ABDb7DwO0C',0,0,NULL,'2018-10-07 09:36:07','2018-10-07 09:36:07'),
(8,'Steve','Test Address','Ludhiana','Punjab','India','141001','08054711805','steve@yopmail.com','$2y$10$f1iChQYzBeYcG59bnlsZKexrCV.PF0kvZr1./Oa4omMqGafmZuRji',0,1,'ENVpCTZxj6Q7EBerLcABOytYgzzuYaa5IffxFOu28G7HFCgN6zcmOLwIl4Pj','2018-10-19 17:08:03','2019-03-17 06:31:48'),
(9,'Amit Gupta',NULL,'','','','','','test@yopmail.com','$2y$10$A6ov12TrJDxV580bx7VIjuvlRXvdliKtgdqKy87zz3JAbmoxobcHe',0,0,NULL,'2018-11-30 04:43:32','2018-11-30 04:43:32'),
(10,'Amit Gupta',NULL,'','','','','','amit58395@yopmail.com','$2y$10$7SV2k5/otjssdA9zXaRu6eHdruAniix/Ucw4kwJrUI9UjruYvPgsa',0,0,NULL,'2018-12-18 17:03:09','2018-12-18 17:03:09'),
(11,'Amit Gupta',NULL,'','','','','','amit835783@yopmail.com','$2y$10$as0CDsVU9LbfJqtp0M0VJ.oM85shKu4HHfHM1wUXiAkTeFV.6xI9i',0,0,'VDofs1zg16G9P8oX1mznVzhoLi0Bse2dbPc0EOl5ymu9LIKlVYKvttfXA6BM','2018-12-18 17:03:56','2018-12-18 17:03:56'),
(12,'Amit Gupta',NULL,'','','','','','amit5000@yopmail.com','$2y$10$bklnJWAnHgHQru97ohU8buIEjNsnw7uc6nrQlAQ3G2jDBE3wjVT0C',0,1,NULL,'2018-12-18 17:06:04','2018-12-18 17:06:04'),
(13,'Amit Gupta',NULL,'','','','','','amit2100@yopmail.com','$2y$10$OR7K9n2ZLEAY9FixC1ogcexOdm9j3JbIJiTtbBL8qBUEd9O1MyFkS',0,1,'qwB0pxTaVPm08s8QUUQiKWRn0WEuFAQ2MzCPR768Cm01PNWxob3lKKkfQVT8','2018-12-21 17:12:15','2018-12-21 17:12:15'),
(14,'Amit Gupta',NULL,'','','','','','amit2070@yopmail.com','$2y$10$vrOhOsmhANMOS/1yN6uONuMrOG16zMVOSIEAuV4LJ.jat5VyvCNdO',0,0,NULL,'2018-12-21 17:15:02','2018-12-21 17:15:02'),
(15,'Amit Gupta','Test Address','Ludhiana','Punjab','India','141001','+918054711805','amit5600@yopmail.com','$2y$10$Dq0BSkC.bRObjzHQIz5cTOAHcALZk5VFvfYrc2I/QtVNNFY9cAzgi',0,1,'zP5w5si1PsGMMCBrMkaH8zs9loz7UTiIRtGApY0C6dRHFNs9Q8TmcZqdfKXq','2018-12-23 08:12:50','2019-04-14 11:29:10'),
(16,'Amit Gupta',NULL,'','','','','','amit35363@yopmail.com','$2y$10$WgbQKJ7vtiIMeHJ6JgU/8uU.p.Dk1msR2XLcBhQ5ni9p/s9VJaFBK',0,1,'WFiYmzPeTtIdGcVLGSqUpAtPHcL8ACcdquLEq5uUfL7eSB8dcRVR5CyVhETr','2018-12-23 08:30:13','2019-01-31 18:50:31'),
(17,'Amit Gupta','Test Address','Ludhiana','Punjab','India','141001','+919800000000','amit300@yopmail.com','$2y$10$nvADdd/V6KOgFZ6bf684q.SikY/0uc0kxw9d1On9905YC6lDJa0bu',0,1,NULL,'2019-05-30 16:44:54','2019-06-26 17:53:21'),
(18,'Amit Gupta',NULL,'','','','','','amit3535@yopmail.com','$2y$10$5SAXVsjIogwkkOtDAtemWOAGPc1lwk6pZ.nreSozzjr49fBKppNcW',0,1,NULL,'2019-06-28 15:28:52','2019-06-28 15:40:24'),
(19,'Amit Gupta',NULL,'','','','','','amit24550@yopmail.com','$2y$10$WQejyN9HIf0JmWT398p5WO2KFhHXvHXlHbiVJVb3VKmEmfCRQ3jfy',0,0,NULL,'2019-06-28 20:50:11','2019-06-28 20:50:11'),
(20,'Amit Gupta',NULL,'','','','','','amit24353@yopmail.com','$2y$10$QJr8JQBK0Nvxr4VeBevCg..X3UQdEDc5A4M/xwjRVjUp93cZO2zh2',0,0,NULL,'2019-06-29 00:21:13','2019-06-29 00:21:13'),
(21,'Amit Gupta',NULL,'','','','','','amit2343500@yopmail.com','$2y$10$WXFDyAd6W8DEaNnUqgdQT.mskBmeeUxRVRqqkT.2iNtZGr7J5wASa',0,0,NULL,'2019-06-28 20:01:49','2019-06-28 20:01:49'),
(22,'Amit Gupta',NULL,'','','','','','amit20435430@yopmail.com','$2y$10$gU351ktdr9dQvtTj85KzGu.0qdJKLpboziCaakxSkPp9rC0z2tiBK',0,0,NULL,'2019-06-29 08:35:53','2019-06-29 08:35:53'),
(23,'Dandy Firmansyah','Jalan Sunter Karya','Jakarta Utara','Jakarta','Indonesia','14350','082113843687','dandygantengkok@gmail.com','$2y$10$Nft4OcnpvOO9LsORgjhKEegaxV2fArUl33i9Qp1I8pTzN2x/sclLK',0,1,NULL,'2020-07-09 05:36:20','2020-07-09 04:35:10');

/*Table structure for table `wishlist` */

DROP TABLE IF EXISTS `wishlist`;

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `wishlist` */

insert  into `wishlist`(`id`,`user_email`,`product_id`,`created_at`,`updated_at`) values 
(1,'dandygantengkok@gmail.com',21,'2020-07-09 10:33:43','2020-07-09 10:33:43');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
