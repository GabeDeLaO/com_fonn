# ************************************************************
# Sequel Pro SQL dump
# Version 3408
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: localhost (MySQL 5.1.44)
# Database: fonn
# Generation Time: 2012-07-10 05:53:24 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table profilebanners
# ------------------------------------------------------------

DROP TABLE IF EXISTS `profilebanners`;

CREATE TABLE `profilebanners` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `companyID` int(11) DEFAULT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `createdat` datetime DEFAULT NULL,
  `updatedat` datetime DEFAULT NULL,
  `deletedat` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

LOCK TABLES `profilebanners` WRITE;
/*!40000 ALTER TABLE `profilebanners` DISABLE KEYS */;

INSERT INTO `profilebanners` (`id`, `companyID`, `banner`, `thumb`, `text`, `createdat`, `updatedat`, `deletedat`)
VALUES
	(1,1,'p1715h58i515j8ecag08sd51mu74.jpg',NULL,'The banner\'s text goes here.','2012-07-02 23:21:54','2012-07-09 20:53:35','2012-07-09 21:36:23'),
	(6,1,'p171nbjc7jnqf1c8e9uf17fl8j74.jpg',NULL,'Don\'t miss out on the gorgeous views!','2012-07-09 21:31:02','2012-07-09 21:36:08','2012-07-10 00:01:07'),
	(5,1,'p1715i7h2pqcqpug16i01iehttj4.png',NULL,'Testing.','2012-07-02 23:40:33','2012-07-09 21:08:17','2012-07-09 21:29:42'),
	(7,1,'p171nbuclo4et6i1akh13dl1ssc4.jpg',NULL,'This is a duplicate banner.','2012-07-09 21:37:02','2012-07-09 21:37:28','2012-07-09 21:37:39'),
	(8,1,'p171nc2c5crpnvbv1jnul8mlpp4.jpg',NULL,'Yet another test.','2012-07-09 21:39:11','2012-07-09 21:39:31','2012-07-09 21:39:44'),
	(9,1,'p171nc620lp3jneunk613cifu54.jpg',NULL,'Testing. testing.','2012-07-09 21:41:12','2012-07-09 21:41:27','2012-07-09 21:41:31'),
	(10,1,'p171nc90rdfft1km919ofc3k195j4.jpg',NULL,'Good to see you.','2012-07-09 21:42:50','2012-07-09 21:44:41','2012-07-10 00:01:05'),
	(11,1,'p171ncb5f5611inn15nn119k8ts4.jpg',NULL,'Hi there.','2012-07-09 21:44:00','2012-07-09 21:44:35','2012-07-09 21:44:53'),
	(12,1,'p171nfh3ss12mi1ve1ob26n11pnh4.jpg',NULL,NULL,'2012-07-09 22:39:41','2012-07-09 22:39:41','2012-07-09 22:42:53'),
	(13,1,'p171nfn73ihkg1pod1j8v1r9l4.jpg',NULL,NULL,'2012-07-09 22:43:00','2012-07-09 22:43:00','2012-07-09 22:44:23'),
	(14,1,'p171nfq4n06gt6dfcmb1fphb3b4.jpg',NULL,NULL,'2012-07-09 22:44:36','2012-07-09 22:44:36','2012-07-09 22:46:09'),
	(15,1,'p171nft77ug6eq4ilcm856a0j4.jpg',NULL,NULL,'2012-07-09 22:46:17','2012-07-09 22:46:17','2012-07-09 22:56:01'),
	(16,1,'p171ng01r51ed7193cd1p1k518jb4.png',NULL,NULL,'2012-07-09 22:47:51','2012-07-09 22:47:51','2012-07-09 22:49:54'),
	(17,1,'p171ng1o7c1m1aaai1aem1lc415dk4.png',NULL,NULL,'2012-07-09 22:48:45','2012-07-09 22:48:45','2012-07-09 22:49:52'),
	(18,1,'p171ng2mcn19ke4r11ma1t27s5c4.png',NULL,NULL,'2012-07-09 22:49:16','2012-07-09 22:49:16','2012-07-09 22:49:49'),
	(19,1,'p171ng46371o8qecnfr9155adep4.jpg',NULL,NULL,'2012-07-09 22:50:07','2012-07-09 22:50:07','2012-07-09 22:50:42'),
	(20,1,'p171ng6kok167f199b1qno18571iuq4.png',NULL,NULL,'2012-07-09 22:51:26','2012-07-09 22:51:26','2012-07-09 22:55:57'),
	(21,1,'p171ng85036kjqptnmr1pdrkrn4.png',NULL,NULL,'2012-07-09 22:52:19','2012-07-09 22:52:19','2012-07-09 22:55:59'),
	(22,1,'p171ngbe6s1d6vqvj1ks21lc519n64.png',NULL,NULL,'2012-07-09 22:54:04','2012-07-09 22:54:04','2012-07-09 22:55:56'),
	(23,1,'p171ngrnva1biae7k1ql11o771qga4.png',NULL,NULL,'2012-07-09 23:02:57','2012-07-09 23:02:57','2012-07-09 23:04:03'),
	(24,1,'p171ngtupq43u1sf51fgd71m1q0t4.png',NULL,NULL,'2012-07-09 23:04:10','2012-07-09 23:04:10','2012-07-09 23:12:09'),
	(25,1,'p171nh0bud1obt1tdpuno1k0f6eo4.png',NULL,NULL,'2012-07-09 23:05:28','2012-07-09 23:05:28','2012-07-09 23:12:07'),
	(26,1,'p171nh1ea21i8m12g2166d13grstv4.png',NULL,NULL,'2012-07-09 23:06:04','2012-07-09 23:06:04','2012-07-09 23:12:01'),
	(27,1,'p171nh2f4e150a1d7k16t12q61rah4.png',NULL,NULL,'2012-07-09 23:06:37','2012-07-09 23:06:37','2012-07-09 23:11:59'),
	(28,1,'p171nh3nota44v4744ukp81kto4.png',NULL,NULL,'2012-07-09 23:07:19','2012-07-09 23:07:19','2012-07-09 23:12:03'),
	(29,1,'p171nh5145fh61vdo1k4a1mt1k774.png',NULL,NULL,'2012-07-09 23:08:01','2012-07-09 23:08:01','2012-07-09 23:12:04'),
	(30,1,'p171nh5ods1hl110d91tr1ppb9ku4.png',NULL,NULL,'2012-07-09 23:08:25','2012-07-09 23:08:25','2012-07-09 23:12:06'),
	(31,1,'p171nh688p7ol1fmn1ju0ljq15l64.png',NULL,NULL,'2012-07-09 23:08:41','2012-07-09 23:08:41','2012-07-09 23:12:10'),
	(32,1,'p171niemkm3ve1dbngoiir1rhe4.jpg',NULL,NULL,'2012-07-09 23:30:47','2012-07-09 23:30:47','2012-07-09 23:34:28'),
	(34,1,'p171nilkni1abl27q139u11f48h4.jpg',NULL,NULL,'2012-07-09 23:34:34','2012-07-09 23:34:34','2012-07-09 23:47:09'),
	(35,2,'p171njgs0a1smfd4016du1lb69sj4.jpg',NULL,'Some text to go along here.','2012-07-09 23:49:27','2012-07-09 23:49:40','2012-07-10 00:04:05'),
	(36,1,'p171nk6ngrhm01ein1q1715nn1mq94.jpg',NULL,'Don\'t miss the spectacular views.','2012-07-10 00:01:23','2012-07-10 00:01:36','2012-07-10 00:01:51'),
	(37,1,'p171nk7qcqjbu1mapa9414j7lkg4.jpg',NULL,'Don\'t miss out on the spectacular view.','2012-07-10 00:01:58','2012-07-10 00:02:14',NULL),
	(38,1,'p171nka2v1g1q8il1qqv1pnljfj9.jpg',NULL,'The second banner, and the text changes.','2012-07-10 00:03:13','2012-07-10 00:03:27',NULL),
	(39,2,'p171nkc63776p6mvfg7rru19nc4.jpg',NULL,'Some text goes here.','2012-07-10 00:04:22','2012-07-10 00:04:39',NULL),
	(40,3,'p171nkn9a9rsmjfqjml1adndog4.jpg',NULL,'Had to put a different image.','2012-07-10 00:10:26','2012-07-10 00:10:38',NULL);

/*!40000 ALTER TABLE `profilebanners` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
