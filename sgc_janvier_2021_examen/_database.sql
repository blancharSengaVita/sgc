# ************************************************************
# Sequel Pro SQL dump
# Version 5446
#
# https://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 8.0.18)
# Database: sgc_janvier_2021
# Generation Time: 2021-01-04 23:45:35 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;

INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`)
VALUES
	(1,'Apéro','apero','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(2,'Entrée','entree','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(3,'Plat','plat','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(4,'Dessert','dessert','2021-01-04 23:32:32','2021-01-04 23:32:32');

/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ingredient_recipe
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ingredient_recipe`;

CREATE TABLE `ingredient_recipe` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ingredient_id` bigint(20) unsigned NOT NULL,
  `recipe_id` bigint(20) unsigned NOT NULL,
  `quantity` double(7,2) unsigned DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ingredient_recipe_ingredient_id_foreign` (`ingredient_id`),
  KEY `ingredient_recipe_recipe_id_foreign` (`recipe_id`),
  CONSTRAINT `ingredient_recipe_ingredient_id_foreign` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ingredient_recipe_recipe_id_foreign` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `ingredient_recipe` WRITE;
/*!40000 ALTER TABLE `ingredient_recipe` DISABLE KEYS */;

INSERT INTO `ingredient_recipe` (`id`, `ingredient_id`, `recipe_id`, `quantity`, `unit`)
VALUES
	(1,15,1,9.00,NULL),
	(2,14,1,1.50,NULL),
	(3,11,1,1.50,NULL),
	(4,10,1,1.50,NULL),
	(5,9,1,1.00,NULL),
	(6,8,1,1.00,'gousse'),
	(7,16,1,4.00,NULL),
	(8,17,1,2.00,'cuillères à soupe'),
	(9,18,1,NULL,NULL),
	(10,7,1,NULL,NULL),
	(11,2,1,NULL,NULL),
	(12,3,1,NULL,NULL),
	(13,19,1,NULL,NULL),
	(14,20,2,500.00,'g'),
	(15,7,2,NULL,NULL),
	(16,11,2,0.50,NULL),
	(17,9,2,1.00,NULL),
	(18,8,2,2.00,'gousses'),
	(19,15,2,1.00,'kg'),
	(20,21,2,NULL,NULL),
	(21,22,2,NULL,NULL),
	(22,23,3,250.00,'g'),
	(23,24,3,200.00,'g'),
	(24,25,3,20.00,'cl'),
	(25,9,3,1.00,NULL),
	(26,8,3,1.00,'gousse'),
	(27,21,3,20.00,'cl'),
	(28,26,3,2.00,NULL),
	(29,27,3,NULL,NULL),
	(30,18,3,NULL,NULL),
	(31,2,3,NULL,NULL),
	(32,3,3,NULL,NULL),
	(33,29,4,100.00,'g'),
	(34,31,4,25.00,'g'),
	(35,32,4,100.00,'g'),
	(36,21,4,150.00,'ml'),
	(37,9,4,3.00,NULL),
	(38,8,4,3.00,'gousses'),
	(39,28,4,NULL,NULL),
	(40,2,4,NULL,NULL),
	(41,23,4,NULL,NULL),
	(42,33,4,450.00,'g'),
	(43,30,4,0.50,NULL),
	(44,34,5,400.00,'g'),
	(45,35,5,2.00,NULL),
	(46,9,5,3.00,NULL),
	(47,8,5,3.00,'gousses'),
	(48,37,5,50.00,'g'),
	(49,30,5,1.00,NULL),
	(50,3,5,1.00,NULL),
	(51,2,5,1.00,NULL),
	(52,42,6,0.50,'l'),
	(53,26,6,5.00,NULL),
	(54,4,6,70.00,'g'),
	(55,39,6,1.00,'bâton'),
	(56,30,6,0.50,NULL),
	(57,40,6,0.25,NULL),
	(58,41,6,1.00,'gousse'),
	(59,3,6,1.00,'pincée'),
	(60,43,7,1.00,NULL),
	(61,44,7,100.00,'g'),
	(62,26,7,1.00,NULL),
	(63,42,7,2.00,'cuillère à soupe'),
	(64,49,8,800.00,'g'),
	(65,34,8,8.00,NULL),
	(66,9,8,8.00,NULL),
	(67,11,8,2.00,NULL),
	(68,13,8,2.00,NULL),
	(69,35,8,8.00,NULL),
	(70,50,8,1.00,'boîte'),
	(71,26,9,4.00,NULL),
	(72,32,9,150.00,'g'),
	(73,29,9,60.00,'g'),
	(74,5,9,60.00,'g'),
	(75,42,9,40.00,'cl'),
	(76,34,10,1.00,'kg'),
	(77,42,10,25.00,'cl'),
	(78,4,10,300.00,'g'),
	(79,29,10,200.00,'g'),
	(80,45,10,0.50,'cuillère à soupe'),
	(81,46,10,3.00,'cuillère à soupe'),
	(82,47,10,3.00,'cuillère à soupe'),
	(83,48,11,4.00,'tranche'),
	(84,15,11,2.00,NULL),
	(85,18,11,6.00,'feuille'),
	(86,8,11,1.00,'gousse'),
	(87,7,11,3.00,'cuillère à soupe'),
	(88,3,11,2.00,NULL),
	(89,2,11,2.00,NULL);

/*!40000 ALTER TABLE `ingredient_recipe` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ingredients
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ingredients`;

CREATE TABLE `ingredients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `ingredients` WRITE;
/*!40000 ALTER TABLE `ingredients` DISABLE KEYS */;

INSERT INTO `ingredients` (`id`, `name`, `created_at`, `updated_at`)
VALUES
	(1,'Eau','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(2,'Poivre','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(3,'Sel','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(4,'Sucre','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(5,'Farine','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(6,'Vinaigre balsamique','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(7,'Huile d\'olive','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(8,'Ail','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(9,'Oignon','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(10,'Concombre','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(11,'Poivron vert','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(12,'Poivron jaune','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(13,'Poivron orange','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(14,'Poivron rouge','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(15,'Tomate','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(16,'Oignon nouveau','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(17,'Vinaigre de Xérès','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(18,'Basilic','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(19,'Piment rouge','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(20,'Porc pour sauté','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(21,'Vin blanc','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(22,'Bouillon de poule','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(23,'Tagliatelles fraîches','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(24,'Lardons fumés','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(25,'Crème fraîche','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(26,'Oeuf','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(27,'Muscade','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(28,'Persil','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(29,'Beurre','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(30,'Citron','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(31,'Pecorino','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(32,'Parmesan','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(33,'Linguine','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(34,'Carotte','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(35,'Courgette','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(36,'Patate douce','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(37,'Pâte de curry rouge','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(38,'Cumin','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(39,'Cannelle','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(40,'Orange','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(41,'Vanille','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(42,'Lait','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(43,'Pâte feuilletée','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(44,'Saumon fumé','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(45,'Cardamome','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(46,'Pistaches','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(47,'Amandes','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(48,'Pain','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(49,'Viande','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(50,'Pois chiche','2021-01-04 23:32:32','2021-01-04 23:32:32');

/*!40000 ALTER TABLE `ingredients` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ratings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ratings`;

CREATE TABLE `ratings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `recipe_id` bigint(20) unsigned NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ratings_recipe_id_email_unique` (`recipe_id`,`email`),
  CONSTRAINT `ratings_recipe_id_foreign` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=320 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;

INSERT INTO `ratings` (`id`, `recipe_id`, `email`, `rate`, `created_at`, `updated_at`)
VALUES
	(1,10,'mina92@example.net',5,'2020-01-06 19:57:10','2020-01-06 19:57:10'),
	(2,6,'vmarvin@example.org',3,'2020-01-09 22:15:33','2020-01-09 22:15:33'),
	(3,1,'hahn.yessenia@example.org',5,'2020-01-10 06:50:12','2020-01-10 06:50:12'),
	(4,9,'hirthe.burley@example.net',3,'2020-01-10 10:46:09','2020-01-10 10:46:09'),
	(5,4,'george.price@example.com',2,'2020-01-14 02:55:39','2020-01-14 02:55:39'),
	(6,10,'towne.federico@example.com',3,'2020-01-16 10:55:23','2020-01-16 10:55:23'),
	(7,6,'oharber@example.org',1,'2020-01-19 07:04:48','2020-01-19 07:04:48'),
	(8,5,'lauren.berge@example.net',4,'2020-01-19 20:46:34','2020-01-19 20:46:34'),
	(9,1,'joey.emard@example.com',4,'2020-01-20 20:06:29','2020-01-20 20:06:29'),
	(10,1,'bhaley@example.com',1,'2020-01-21 20:17:52','2020-01-21 20:17:52'),
	(11,9,'hackett.wilburn@example.org',1,'2020-01-22 01:22:08','2020-01-22 01:22:08'),
	(12,8,'eino81@example.com',5,'2020-01-27 05:56:21','2020-01-27 05:56:21'),
	(13,9,'joesph.adams@example.com',5,'2020-01-27 06:41:43','2020-01-27 06:41:43'),
	(14,9,'nnitzsche@example.com',2,'2020-01-29 13:44:54','2020-01-29 13:44:54'),
	(15,11,'clark.leannon@example.net',2,'2020-01-31 05:19:27','2020-01-31 05:19:27'),
	(16,5,'lkozey@example.org',2,'2020-02-01 05:59:57','2020-02-01 05:59:57'),
	(17,10,'caleb78@example.net',2,'2020-02-01 19:56:37','2020-02-01 19:56:37'),
	(18,7,'dorothy.berge@example.net',5,'2020-02-03 07:58:01','2020-02-03 07:58:01'),
	(19,2,'heller.francesco@example.net',1,'2020-02-04 05:52:22','2020-02-04 05:52:22'),
	(20,5,'stroman.uriah@example.org',4,'2020-02-05 15:49:01','2020-02-05 15:49:01'),
	(21,2,'crawford29@example.com',2,'2020-02-07 16:55:28','2020-02-07 16:55:28'),
	(22,2,'emile.champlin@example.com',5,'2020-02-07 21:58:32','2020-02-07 21:58:32'),
	(23,10,'roy.abernathy@example.net',3,'2020-02-12 21:42:10','2020-02-12 21:42:10'),
	(24,6,'leonel.champlin@example.com',4,'2020-02-13 08:33:37','2020-02-13 08:33:37'),
	(25,10,'carlos.schuppe@example.org',5,'2020-02-14 18:28:46','2020-02-14 18:28:46'),
	(26,6,'schiller.jayme@example.com',4,'2020-02-15 00:48:48','2020-02-15 00:48:48'),
	(27,9,'monahan.lamont@example.net',2,'2020-02-16 21:40:10','2020-02-16 21:40:10'),
	(28,8,'jovani04@example.org',1,'2020-02-17 23:34:47','2020-02-17 23:34:47'),
	(29,4,'jeff11@example.org',2,'2020-02-18 02:52:57','2020-02-18 02:52:57'),
	(30,4,'napoleon.roob@example.net',4,'2020-02-18 06:58:32','2020-02-18 06:58:32'),
	(31,10,'omari.gleichner@example.net',4,'2020-02-18 14:00:31','2020-02-18 14:00:31'),
	(32,4,'hillard53@example.org',1,'2020-02-19 03:19:25','2020-02-19 03:19:25'),
	(33,7,'murl.strosin@example.org',5,'2020-02-20 14:12:24','2020-02-20 14:12:24'),
	(34,10,'clara61@example.org',3,'2020-02-21 13:28:13','2020-02-21 13:28:13'),
	(35,5,'marcia78@example.org',5,'2020-02-21 17:00:58','2020-02-21 17:00:58'),
	(36,4,'reynolds.melyssa@example.com',3,'2020-02-21 18:29:08','2020-02-21 18:29:08'),
	(37,7,'fpurdy@example.net',5,'2020-02-22 11:29:56','2020-02-22 11:29:56'),
	(38,9,'elnora.lubowitz@example.org',2,'2020-02-25 14:18:41','2020-02-25 14:18:41'),
	(39,7,'vilma60@example.org',3,'2020-02-28 13:40:23','2020-02-28 13:40:23'),
	(40,9,'lenny26@example.com',3,'2020-02-28 17:48:28','2020-02-28 17:48:28'),
	(41,7,'wmurphy@example.net',2,'2020-02-29 00:01:38','2020-02-29 00:01:38'),
	(42,5,'quigley.bethany@example.com',3,'2020-02-29 11:09:24','2020-02-29 11:09:24'),
	(43,5,'catherine.wintheiser@example.net',1,'2020-02-29 12:05:03','2020-02-29 12:05:03'),
	(44,9,'leonard.stokes@example.net',2,'2020-03-01 06:11:43','2020-03-01 06:11:43'),
	(45,6,'cconroy@example.net',5,'2020-03-03 08:53:16','2020-03-03 08:53:16'),
	(46,1,'alec41@example.org',3,'2020-03-05 15:05:58','2020-03-05 15:05:58'),
	(47,9,'stoltenberg.gerson@example.com',4,'2020-03-07 06:03:21','2020-03-07 06:03:21'),
	(48,7,'grogahn@example.org',2,'2020-03-10 18:49:02','2020-03-10 18:49:02'),
	(49,5,'ebba.padberg@example.org',5,'2020-03-11 12:06:54','2020-03-11 12:06:54'),
	(50,8,'ruthie.jaskolski@example.com',3,'2020-03-14 03:58:23','2020-03-14 03:58:23'),
	(51,5,'umuller@example.net',5,'2020-03-14 16:31:20','2020-03-14 16:31:20'),
	(52,8,'hudson.alexander@example.net',2,'2020-03-15 20:58:05','2020-03-15 20:58:05'),
	(53,4,'nick.streich@example.com',3,'2020-03-19 16:43:06','2020-03-19 16:43:06'),
	(54,1,'abdul38@example.com',1,'2020-03-21 17:42:11','2020-03-21 17:42:11'),
	(55,4,'moore.meggie@example.org',5,'2020-03-22 22:39:28','2020-03-22 22:39:28'),
	(56,5,'adelbert53@example.net',1,'2020-03-23 07:00:40','2020-03-23 07:00:40'),
	(57,4,'otto34@example.com',3,'2020-03-25 03:36:48','2020-03-25 03:36:48'),
	(58,9,'letitia.hagenes@example.net',1,'2020-03-25 15:17:44','2020-03-25 15:17:44'),
	(59,1,'jskiles@example.com',4,'2020-03-25 16:03:54','2020-03-25 16:03:54'),
	(60,10,'gustave85@example.org',3,'2020-03-28 15:07:48','2020-03-28 15:07:48'),
	(61,3,'alivia48@example.net',5,'2020-03-29 05:22:54','2020-03-29 05:22:54'),
	(62,8,'nitzsche.ofelia@example.net',1,'2020-03-29 15:45:30','2020-03-29 15:45:30'),
	(63,10,'freda.gusikowski@example.org',3,'2020-03-30 13:23:04','2020-03-30 13:23:04'),
	(64,1,'louie97@example.net',5,'2020-04-01 05:28:53','2020-04-01 05:28:53'),
	(65,10,'ian14@example.org',2,'2020-04-01 14:44:09','2020-04-01 14:44:09'),
	(66,3,'creilly@example.net',5,'2020-04-04 13:30:14','2020-04-04 13:30:14'),
	(67,11,'eraynor@example.org',2,'2020-04-05 02:39:45','2020-04-05 02:39:45'),
	(68,6,'marianne.thompson@example.com',3,'2020-04-05 02:44:20','2020-04-05 02:44:20'),
	(69,4,'olson.federico@example.net',4,'2020-04-05 15:12:32','2020-04-05 15:12:32'),
	(70,7,'sbogisich@example.com',2,'2020-04-06 07:29:17','2020-04-06 07:29:17'),
	(71,4,'bauch.reta@example.com',2,'2020-04-07 00:30:52','2020-04-07 00:30:52'),
	(72,5,'jimmie19@example.com',5,'2020-04-08 06:57:37','2020-04-08 06:57:37'),
	(73,10,'rita70@example.org',2,'2020-04-11 16:07:05','2020-04-11 16:07:05'),
	(74,7,'herman.harber@example.org',2,'2020-04-11 19:46:00','2020-04-11 19:46:00'),
	(75,9,'turcotte.anibal@example.net',4,'2020-04-14 04:40:47','2020-04-14 04:40:47'),
	(76,9,'fwalsh@example.net',5,'2020-04-15 13:04:37','2020-04-15 13:04:37'),
	(77,9,'ruben04@example.net',2,'2020-04-15 21:01:35','2020-04-15 21:01:35'),
	(78,7,'cortney.considine@example.org',5,'2020-04-16 13:18:59','2020-04-16 13:18:59'),
	(79,9,'pink52@example.org',5,'2020-04-20 02:47:33','2020-04-20 02:47:33'),
	(80,2,'rickey25@example.com',1,'2020-04-20 10:24:12','2020-04-20 10:24:12'),
	(81,8,'rschroeder@example.net',3,'2020-04-22 11:30:21','2020-04-22 11:30:21'),
	(82,4,'bartell.margarete@example.net',1,'2020-04-22 16:33:34','2020-04-22 16:33:34'),
	(83,2,'kaycee.smitham@example.net',3,'2020-04-24 08:26:08','2020-04-24 08:26:08'),
	(84,10,'wbauch@example.net',3,'2020-04-26 09:27:42','2020-04-26 09:27:42'),
	(85,9,'pweber@example.com',5,'2020-04-27 04:35:56','2020-04-27 04:35:56'),
	(86,11,'nvonrueden@example.org',4,'2020-04-27 05:20:31','2020-04-27 05:20:31'),
	(87,8,'nbeahan@example.com',3,'2020-04-28 18:26:00','2020-04-28 18:26:00'),
	(88,4,'klocko.josianne@example.org',3,'2020-04-29 05:35:38','2020-04-29 05:35:38'),
	(89,7,'levi66@example.net',4,'2020-05-01 09:21:17','2020-05-01 09:21:17'),
	(90,9,'torp.benjamin@example.net',2,'2020-05-02 10:36:55','2020-05-02 10:36:55'),
	(91,5,'andreane61@example.net',4,'2020-05-03 15:32:38','2020-05-03 15:32:38'),
	(92,4,'schaden.rene@example.org',2,'2020-05-05 08:43:06','2020-05-05 08:43:06'),
	(93,6,'reta59@example.com',1,'2020-05-06 08:18:05','2020-05-06 08:18:05'),
	(94,9,'kuvalis.neha@example.com',3,'2020-05-07 00:48:41','2020-05-07 00:48:41'),
	(95,11,'pfeffer.armani@example.org',4,'2020-05-09 03:54:11','2020-05-09 03:54:11'),
	(96,10,'cnitzsche@example.net',1,'2020-05-10 02:38:11','2020-05-10 02:38:11'),
	(97,4,'khessel@example.net',4,'2020-05-10 11:32:17','2020-05-10 11:32:17'),
	(98,5,'spencer.nichole@example.org',2,'2020-05-10 19:39:57','2020-05-10 19:39:57'),
	(99,10,'vbalistreri@example.org',5,'2020-05-11 03:08:28','2020-05-11 03:08:28'),
	(100,4,'wisoky.idella@example.org',4,'2020-05-14 07:15:52','2020-05-14 07:15:52'),
	(101,8,'ycummings@example.com',4,'2020-05-14 09:17:36','2020-05-14 09:17:36'),
	(102,3,'mozelle24@example.net',3,'2020-05-14 17:42:28','2020-05-14 17:42:28'),
	(103,8,'twiegand@example.net',5,'2020-05-15 03:58:34','2020-05-15 03:58:34'),
	(104,4,'kaci65@example.net',5,'2020-05-15 11:30:08','2020-05-15 11:30:08'),
	(105,10,'vada.hyatt@example.org',4,'2020-05-16 01:27:22','2020-05-16 01:27:22'),
	(106,9,'qondricka@example.net',1,'2020-05-16 11:19:44','2020-05-16 11:19:44'),
	(107,4,'alda.anderson@example.org',2,'2020-05-17 23:25:30','2020-05-17 23:25:30'),
	(108,6,'kilback.adela@example.com',3,'2020-05-18 12:11:41','2020-05-18 12:11:41'),
	(109,7,'fay.shanahan@example.org',1,'2020-05-18 14:02:54','2020-05-18 14:02:54'),
	(110,10,'habbott@example.net',2,'2020-05-21 19:41:01','2020-05-21 19:41:01'),
	(111,6,'patricia.rath@example.com',3,'2020-05-23 13:40:18','2020-05-23 13:40:18'),
	(112,11,'pearline.collins@example.com',5,'2020-05-23 22:16:57','2020-05-23 22:16:57'),
	(113,5,'karine25@example.org',5,'2020-05-26 06:37:05','2020-05-26 06:37:05'),
	(114,9,'ihartmann@example.org',5,'2020-05-27 01:42:14','2020-05-27 01:42:14'),
	(115,4,'predovic.vance@example.org',1,'2020-05-27 02:40:39','2020-05-27 02:40:39'),
	(116,9,'stephany92@example.com',1,'2020-05-28 02:37:48','2020-05-28 02:37:48'),
	(117,11,'camille.fahey@example.org',2,'2020-05-28 05:10:00','2020-05-28 05:10:00'),
	(118,9,'marianne.swift@example.org',1,'2020-05-28 16:28:25','2020-05-28 16:28:25'),
	(119,4,'fryan@example.com',1,'2020-05-29 19:04:43','2020-05-29 19:04:43'),
	(120,4,'peggie75@example.org',2,'2020-05-29 23:51:54','2020-05-29 23:51:54'),
	(121,2,'hokon@example.org',5,'2020-05-31 12:47:06','2020-05-31 12:47:06'),
	(122,5,'maryam.batz@example.org',3,'2020-05-31 17:05:55','2020-05-31 17:05:55'),
	(123,9,'nathanial67@example.com',1,'2020-06-03 21:59:32','2020-06-03 21:59:32'),
	(124,8,'rylee11@example.org',5,'2020-06-05 18:23:00','2020-06-05 18:23:00'),
	(125,4,'lrunte@example.com',4,'2020-06-07 08:33:19','2020-06-07 08:33:19'),
	(126,5,'qfranecki@example.net',4,'2020-06-07 12:49:27','2020-06-07 12:49:27'),
	(127,8,'ohara.nicolas@example.com',1,'2020-06-07 13:04:26','2020-06-07 13:04:26'),
	(128,9,'kmosciski@example.net',5,'2020-06-07 14:36:16','2020-06-07 14:36:16'),
	(129,8,'carmine22@example.org',5,'2020-06-07 20:25:59','2020-06-07 20:25:59'),
	(130,4,'rfahey@example.org',4,'2020-06-09 10:38:59','2020-06-09 10:38:59'),
	(131,5,'therese.maggio@example.net',2,'2020-06-09 20:24:55','2020-06-09 20:24:55'),
	(132,5,'will.jones@example.net',1,'2020-06-10 16:49:34','2020-06-10 16:49:34'),
	(133,5,'bbuckridge@example.net',3,'2020-06-12 04:33:18','2020-06-12 04:33:18'),
	(134,9,'clare60@example.net',2,'2020-06-13 10:19:34','2020-06-13 10:19:34'),
	(135,9,'shields.shanny@example.org',5,'2020-06-13 20:10:25','2020-06-13 20:10:25'),
	(136,10,'duane.greenholt@example.net',5,'2020-06-14 09:40:38','2020-06-14 09:40:38'),
	(137,8,'kailey.beahan@example.org',3,'2020-06-15 08:08:28','2020-06-15 08:08:28'),
	(138,9,'yjacobson@example.com',5,'2020-06-17 14:58:51','2020-06-17 14:58:51'),
	(139,4,'shanny.romaguera@example.org',2,'2020-06-18 15:38:50','2020-06-18 15:38:50'),
	(140,8,'qpaucek@example.org',3,'2020-06-22 03:05:17','2020-06-22 03:05:17'),
	(141,5,'wiegand.burley@example.net',2,'2020-06-22 10:51:30','2020-06-22 10:51:30'),
	(142,11,'ewill@example.com',2,'2020-06-22 10:57:32','2020-06-22 10:57:32'),
	(143,4,'ekutch@example.org',4,'2020-06-22 13:50:48','2020-06-22 13:50:48'),
	(144,6,'destany64@example.net',5,'2020-06-22 18:49:48','2020-06-22 18:49:48'),
	(145,7,'alphonso60@example.org',4,'2020-06-22 23:47:14','2020-06-22 23:47:14'),
	(146,2,'tevin.kunde@example.net',5,'2020-06-25 22:34:00','2020-06-25 22:34:00'),
	(147,11,'ghayes@example.com',2,'2020-06-26 02:19:44','2020-06-26 02:19:44'),
	(148,8,'maureen.mcdermott@example.net',3,'2020-06-26 14:44:13','2020-06-26 14:44:13'),
	(149,2,'weston77@example.org',5,'2020-06-26 19:13:31','2020-06-26 19:13:31'),
	(150,7,'alexandra.hauck@example.com',4,'2020-06-29 07:55:40','2020-06-29 07:55:40'),
	(151,5,'reilly.joan@example.com',2,'2020-06-30 10:00:23','2020-06-30 10:00:23'),
	(152,9,'sauer.marlee@example.org',4,'2020-06-30 18:09:10','2020-06-30 18:09:10'),
	(153,6,'mclaughlin.alta@example.org',5,'2020-07-04 16:18:08','2020-07-04 16:18:08'),
	(154,4,'vswaniawski@example.org',5,'2020-07-04 23:26:40','2020-07-04 23:26:40'),
	(155,5,'roxane86@example.org',3,'2020-07-05 09:32:25','2020-07-05 09:32:25'),
	(156,8,'istrosin@example.com',2,'2020-07-07 22:41:41','2020-07-07 22:41:41'),
	(157,8,'lottie04@example.com',2,'2020-07-09 05:20:47','2020-07-09 05:20:47'),
	(158,2,'herman.agnes@example.net',5,'2020-07-10 07:14:04','2020-07-10 07:14:04'),
	(159,8,'altenwerth.hans@example.net',3,'2020-07-10 17:20:35','2020-07-10 17:20:35'),
	(160,4,'nschuster@example.com',4,'2020-07-10 19:38:28','2020-07-10 19:38:28'),
	(161,5,'armstrong.rachelle@example.com',3,'2020-07-13 07:14:50','2020-07-13 07:14:50'),
	(162,9,'conn.earnestine@example.com',2,'2020-07-14 13:13:27','2020-07-14 13:13:27'),
	(163,2,'torrance08@example.org',2,'2020-07-16 08:03:10','2020-07-16 08:03:10'),
	(164,5,'warren34@example.org',1,'2020-07-17 00:32:51','2020-07-17 00:32:51'),
	(165,1,'virginie.beer@example.org',3,'2020-07-17 03:45:05','2020-07-17 03:45:05'),
	(166,10,'dickens.jarvis@example.net',5,'2020-07-19 02:26:02','2020-07-19 02:26:02'),
	(167,4,'ramon.mraz@example.net',2,'2020-07-19 17:51:59','2020-07-19 17:51:59'),
	(168,5,'turner88@example.net',2,'2020-07-20 20:33:52','2020-07-20 20:33:52'),
	(169,7,'taryn.reynolds@example.org',5,'2020-07-21 12:58:57','2020-07-21 12:58:57'),
	(170,8,'gibson.newton@example.org',4,'2020-07-21 18:49:51','2020-07-21 18:49:51'),
	(171,7,'rhianna.stark@example.org',4,'2020-07-22 05:15:13','2020-07-22 05:15:13'),
	(172,6,'terry.roob@example.net',2,'2020-07-22 12:31:59','2020-07-22 12:31:59'),
	(173,10,'boyd26@example.org',4,'2020-07-23 07:36:59','2020-07-23 07:36:59'),
	(174,4,'cronin.jacklyn@example.net',1,'2020-07-23 14:30:16','2020-07-23 14:30:16'),
	(175,6,'chyna88@example.org',3,'2020-07-24 02:02:15','2020-07-24 02:02:15'),
	(176,10,'ernser.jovany@example.com',1,'2020-07-24 02:28:09','2020-07-24 02:28:09'),
	(177,6,'gpollich@example.org',1,'2020-07-24 10:02:37','2020-07-24 10:02:37'),
	(178,5,'jsatterfield@example.com',3,'2020-07-24 13:03:26','2020-07-24 13:03:26'),
	(179,7,'bailey.llewellyn@example.com',1,'2020-07-25 03:33:26','2020-07-25 03:33:26'),
	(180,5,'skuvalis@example.com',4,'2020-07-27 16:43:31','2020-07-27 16:43:31'),
	(181,1,'conn.jaquan@example.com',1,'2020-07-30 00:39:56','2020-07-30 00:39:56'),
	(182,4,'annabel63@example.net',5,'2020-07-30 13:34:16','2020-07-30 13:34:16'),
	(183,8,'moshe98@example.com',1,'2020-07-30 18:52:19','2020-07-30 18:52:19'),
	(184,9,'jermaine.lowe@example.net',4,'2020-08-08 17:48:37','2020-08-08 17:48:37'),
	(185,5,'strosin.odessa@example.org',4,'2020-08-09 16:50:29','2020-08-09 16:50:29'),
	(186,9,'violette29@example.net',5,'2020-08-09 19:30:36','2020-08-09 19:30:36'),
	(187,4,'leonard50@example.net',4,'2020-08-12 22:19:30','2020-08-12 22:19:30'),
	(188,1,'jacobson.alanna@example.org',3,'2020-08-13 00:36:20','2020-08-13 00:36:20'),
	(189,4,'ova83@example.com',4,'2020-08-14 15:38:51','2020-08-14 15:38:51'),
	(190,10,'charley.blanda@example.org',1,'2020-08-18 03:59:34','2020-08-18 03:59:34'),
	(191,10,'ischowalter@example.com',4,'2020-08-20 06:21:35','2020-08-20 06:21:35'),
	(192,9,'kaya65@example.net',1,'2020-08-21 02:48:23','2020-08-21 02:48:23'),
	(193,5,'skiles.belle@example.net',4,'2020-08-22 03:11:37','2020-08-22 03:11:37'),
	(194,5,'glenda.ebert@example.com',5,'2020-08-22 16:08:42','2020-08-22 16:08:42'),
	(195,2,'randall.bauch@example.com',3,'2020-08-25 03:25:56','2020-08-25 03:25:56'),
	(196,6,'nicolette27@example.com',4,'2020-08-25 05:28:52','2020-08-25 05:28:52'),
	(197,7,'cooper82@example.org',3,'2020-08-25 15:51:19','2020-08-25 15:51:19'),
	(198,8,'xrolfson@example.net',1,'2020-08-27 15:34:51','2020-08-27 15:34:51'),
	(199,2,'kutch.albina@example.net',4,'2020-08-28 06:53:45','2020-08-28 06:53:45'),
	(200,7,'npouros@example.net',4,'2020-08-28 09:16:37','2020-08-28 09:16:37'),
	(201,9,'pgoldner@example.com',4,'2020-08-28 13:03:35','2020-08-28 13:03:35'),
	(202,11,'holden.padberg@example.net',4,'2020-08-29 08:16:28','2020-08-29 08:16:28'),
	(203,10,'darwin.strosin@example.com',3,'2020-08-29 22:19:24','2020-08-29 22:19:24'),
	(204,5,'qdare@example.net',3,'2020-08-30 19:58:23','2020-08-30 19:58:23'),
	(205,2,'xjakubowski@example.net',3,'2020-08-30 21:56:08','2020-08-30 21:56:08'),
	(206,5,'tzulauf@example.org',2,'2020-09-01 07:42:33','2020-09-01 07:42:33'),
	(207,10,'raynor.domenica@example.com',3,'2020-09-04 15:43:40','2020-09-04 15:43:40'),
	(208,10,'walker.mikayla@example.org',5,'2020-09-05 11:06:12','2020-09-05 11:06:12'),
	(209,4,'zelda.ohara@example.org',5,'2020-09-08 03:55:30','2020-09-08 03:55:30'),
	(210,7,'zieme.armando@example.org',5,'2020-09-09 03:10:00','2020-09-09 03:10:00'),
	(211,2,'nolan.mireya@example.com',5,'2020-09-09 12:59:05','2020-09-09 12:59:05'),
	(212,11,'glenda.zieme@example.org',4,'2020-09-13 06:52:48','2020-09-13 06:52:48'),
	(213,9,'dietrich.brenda@example.org',5,'2020-09-13 14:50:25','2020-09-13 14:50:25'),
	(214,8,'howell.konopelski@example.com',5,'2020-09-14 00:45:29','2020-09-14 00:45:29'),
	(215,2,'haley.oconner@example.com',1,'2020-09-15 18:53:23','2020-09-15 18:53:23'),
	(216,9,'maritza.kemmer@example.com',3,'2020-09-16 14:12:06','2020-09-16 14:12:06'),
	(217,10,'qjenkins@example.org',2,'2020-09-16 14:29:16','2020-09-16 14:29:16'),
	(218,11,'snienow@example.com',5,'2020-09-16 18:27:14','2020-09-16 18:27:14'),
	(219,10,'heller.domingo@example.com',1,'2020-09-17 09:18:23','2020-09-17 09:18:23'),
	(220,4,'corwin.aidan@example.org',1,'2020-09-17 11:06:38','2020-09-17 11:06:38'),
	(221,5,'dsteuber@example.net',2,'2020-09-17 16:04:59','2020-09-17 16:04:59'),
	(222,8,'hkertzmann@example.org',2,'2020-09-21 19:07:38','2020-09-21 19:07:38'),
	(223,10,'vernie.hackett@example.net',2,'2020-09-22 06:55:41','2020-09-22 06:55:41'),
	(224,8,'cwaters@example.org',2,'2020-09-22 22:46:37','2020-09-22 22:46:37'),
	(225,3,'conroy.mathilde@example.org',3,'2020-09-26 05:12:32','2020-09-26 05:12:32'),
	(226,4,'gbaumbach@example.org',5,'2020-09-28 05:56:57','2020-09-28 05:56:57'),
	(227,11,'hulda24@example.com',3,'2020-09-30 22:59:47','2020-09-30 22:59:47'),
	(228,10,'ariel30@example.com',2,'2020-10-02 14:47:06','2020-10-02 14:47:06'),
	(229,4,'mozell.gleichner@example.com',1,'2020-10-02 20:09:31','2020-10-02 20:09:31'),
	(230,7,'rodrick.goyette@example.com',1,'2020-10-04 09:33:30','2020-10-04 09:33:30'),
	(231,4,'okey35@example.com',3,'2020-10-04 10:45:25','2020-10-04 10:45:25'),
	(232,7,'predovic.darby@example.net',1,'2020-10-05 10:42:21','2020-10-05 10:42:21'),
	(233,5,'vlehner@example.net',3,'2020-10-06 00:24:34','2020-10-06 00:24:34'),
	(234,7,'tyrell22@example.net',3,'2020-10-06 21:28:43','2020-10-06 21:28:43'),
	(235,5,'lincoln88@example.org',3,'2020-10-07 17:37:27','2020-10-07 17:37:27'),
	(236,4,'antone.abbott@example.org',2,'2020-10-09 17:56:18','2020-10-09 17:56:18'),
	(237,3,'hschuster@example.com',1,'2020-10-11 09:28:19','2020-10-11 09:28:19'),
	(238,5,'von.doug@example.com',1,'2020-10-14 09:38:22','2020-10-14 09:38:22'),
	(239,4,'elnora60@example.net',4,'2020-10-16 07:17:06','2020-10-16 07:17:06'),
	(240,7,'enrico.welch@example.org',5,'2020-10-17 18:28:39','2020-10-17 18:28:39'),
	(241,9,'neva.schowalter@example.net',3,'2020-10-18 16:27:17','2020-10-18 16:27:17'),
	(242,8,'arturo.abshire@example.net',3,'2020-10-19 12:16:18','2020-10-19 12:16:18'),
	(243,9,'kody.fahey@example.com',2,'2020-10-23 01:26:06','2020-10-23 01:26:06'),
	(244,9,'conrad54@example.org',2,'2020-10-23 01:40:49','2020-10-23 01:40:49'),
	(245,1,'tgutmann@example.org',1,'2020-10-23 14:58:05','2020-10-23 14:58:05'),
	(246,8,'trantow.mable@example.net',1,'2020-10-23 17:34:36','2020-10-23 17:34:36'),
	(247,7,'kreiger.eloise@example.com',5,'2020-10-24 10:41:32','2020-10-24 10:41:32'),
	(248,10,'smorar@example.net',3,'2020-10-25 23:06:58','2020-10-25 23:06:58'),
	(249,4,'lward@example.net',2,'2020-10-26 18:38:46','2020-10-26 18:38:46'),
	(250,8,'ohane@example.net',3,'2020-10-26 20:22:34','2020-10-26 20:22:34'),
	(251,5,'bayer.edgardo@example.org',5,'2020-10-26 21:02:12','2020-10-26 21:02:12'),
	(252,6,'esteban55@example.org',3,'2020-10-26 21:08:39','2020-10-26 21:08:39'),
	(253,5,'schuster.wilburn@example.org',1,'2020-10-27 02:43:13','2020-10-27 02:43:13'),
	(254,5,'garnet80@example.org',5,'2020-10-28 05:51:25','2020-10-28 05:51:25'),
	(255,9,'kfritsch@example.net',1,'2020-10-28 08:56:05','2020-10-28 08:56:05'),
	(256,6,'flavie19@example.com',3,'2020-10-30 19:19:19','2020-10-30 19:19:19'),
	(257,9,'muriel.brakus@example.org',3,'2020-11-01 20:02:08','2020-11-01 20:02:08'),
	(258,1,'ltoy@example.org',1,'2020-11-02 06:06:40','2020-11-02 06:06:40'),
	(259,5,'schoen.vern@example.com',3,'2020-11-03 09:21:40','2020-11-03 09:21:40'),
	(260,9,'qhoppe@example.com',4,'2020-11-03 14:04:15','2020-11-03 14:04:15'),
	(261,1,'lemke.theron@example.org',4,'2020-11-03 19:21:41','2020-11-03 19:21:41'),
	(262,7,'brandy02@example.net',2,'2020-11-04 02:35:22','2020-11-04 02:35:22'),
	(263,3,'little.keyon@example.net',4,'2020-11-06 10:02:05','2020-11-06 10:02:05'),
	(264,4,'kunze.melisa@example.net',3,'2020-11-08 07:16:02','2020-11-08 07:16:02'),
	(265,8,'greg.mohr@example.net',3,'2020-11-09 09:25:04','2020-11-09 09:25:04'),
	(266,2,'mckenzie.javonte@example.net',4,'2020-11-09 20:59:21','2020-11-09 20:59:21'),
	(267,11,'schowalter.candace@example.org',5,'2020-11-10 02:07:25','2020-11-10 02:07:25'),
	(268,7,'iritchie@example.com',2,'2020-11-11 07:53:35','2020-11-11 07:53:35'),
	(269,9,'romaine.jacobs@example.com',1,'2020-11-12 10:12:16','2020-11-12 10:12:16'),
	(270,7,'reinhold68@example.com',3,'2020-11-13 16:43:08','2020-11-13 16:43:08'),
	(271,8,'white.dasia@example.org',2,'2020-11-13 18:10:27','2020-11-13 18:10:27'),
	(272,9,'plynch@example.com',1,'2020-11-14 04:01:09','2020-11-14 04:01:09'),
	(273,2,'orunolfsson@example.net',2,'2020-11-14 12:21:56','2020-11-14 12:21:56'),
	(274,5,'wilbert04@example.net',2,'2020-11-15 18:11:05','2020-11-15 18:11:05'),
	(275,9,'yhowe@example.com',2,'2020-11-20 11:19:40','2020-11-20 11:19:40'),
	(276,1,'zpowlowski@example.org',3,'2020-11-21 03:37:54','2020-11-21 03:37:54'),
	(277,1,'lizzie.hane@example.org',5,'2020-11-21 16:15:29','2020-11-21 16:15:29'),
	(278,8,'jrunolfsson@example.net',3,'2020-11-21 19:21:10','2020-11-21 19:21:10'),
	(279,7,'astrid.hahn@example.com',4,'2020-11-23 10:40:07','2020-11-23 10:40:07'),
	(280,9,'adan03@example.com',2,'2020-11-23 13:54:07','2020-11-23 13:54:07'),
	(281,9,'skyla.cummerata@example.com',2,'2020-11-24 16:53:04','2020-11-24 16:53:04'),
	(282,1,'serena23@example.org',4,'2020-11-25 13:30:33','2020-11-25 13:30:33'),
	(283,7,'olen.hermiston@example.com',3,'2020-11-25 21:11:27','2020-11-25 21:11:27'),
	(284,10,'mccullough.nellie@example.org',5,'2020-11-27 03:42:15','2020-11-27 03:42:15'),
	(285,2,'wolff.elton@example.org',4,'2020-11-27 06:33:35','2020-11-27 06:33:35'),
	(286,9,'xlang@example.org',4,'2020-11-28 09:59:27','2020-11-28 09:59:27'),
	(287,11,'ngerhold@example.org',1,'2020-11-30 10:31:49','2020-11-30 10:31:49'),
	(288,5,'eudora19@example.net',5,'2020-12-01 04:11:30','2020-12-01 04:11:30'),
	(289,4,'camilla.rippin@example.com',2,'2020-12-01 13:32:24','2020-12-01 13:32:24'),
	(290,8,'louvenia58@example.net',2,'2020-12-03 05:49:53','2020-12-03 05:49:53'),
	(291,4,'leonie14@example.net',1,'2020-12-05 01:34:38','2020-12-05 01:34:38'),
	(292,9,'zdibbert@example.com',3,'2020-12-06 15:38:37','2020-12-06 15:38:37'),
	(293,5,'euna39@example.com',5,'2020-12-07 08:11:09','2020-12-07 08:11:09'),
	(294,7,'jailyn28@example.net',3,'2020-12-08 13:12:31','2020-12-08 13:12:31'),
	(295,11,'shanny.luettgen@example.net',5,'2020-12-09 06:48:08','2020-12-09 06:48:08'),
	(296,7,'giuseppe65@example.net',3,'2020-12-09 20:07:46','2020-12-09 20:07:46'),
	(297,6,'kendall.lockman@example.com',5,'2020-12-10 23:10:58','2020-12-10 23:10:58'),
	(298,5,'rex95@example.org',2,'2020-12-11 14:19:05','2020-12-11 14:19:05'),
	(299,4,'fisher.demarcus@example.org',2,'2020-12-13 07:12:50','2020-12-13 07:12:50'),
	(300,5,'clemmie.cronin@example.net',5,'2020-12-13 22:41:00','2020-12-13 22:41:00'),
	(301,9,'pollich.allison@example.com',1,'2020-12-14 10:51:12','2020-12-14 10:51:12'),
	(302,9,'dovie.schaden@example.net',4,'2020-12-14 21:23:55','2020-12-14 21:23:55'),
	(303,10,'xdavis@example.com',4,'2020-12-15 08:48:53','2020-12-15 08:48:53'),
	(304,3,'towne.hoyt@example.com',1,'2020-12-16 02:34:18','2020-12-16 02:34:18'),
	(305,6,'lhegmann@example.net',1,'2020-12-18 05:51:18','2020-12-18 05:51:18'),
	(306,4,'carroll.gayle@example.org',5,'2020-12-23 12:36:00','2020-12-23 12:36:00'),
	(307,5,'okey09@example.net',4,'2020-12-26 05:58:57','2020-12-26 05:58:57'),
	(308,3,'jewell.hoppe@example.org',5,'2020-12-26 10:44:44','2020-12-26 10:44:44'),
	(309,5,'nannie.mills@example.com',4,'2020-12-28 00:54:37','2020-12-28 00:54:37'),
	(310,7,'icole@example.org',3,'2020-12-28 03:25:34','2020-12-28 03:25:34'),
	(311,4,'kian.dach@example.org',5,'2020-12-29 15:30:35','2020-12-29 15:30:35'),
	(312,5,'schmidt.lucy@example.org',5,'2020-12-30 00:38:44','2020-12-30 00:38:44'),
	(313,7,'wilma.bailey@example.net',3,'2020-12-30 05:09:35','2020-12-30 05:09:35'),
	(314,10,'dewayne43@example.org',3,'2020-12-30 05:18:07','2020-12-30 05:18:07'),
	(315,11,'wilfred.murphy@example.org',3,'2021-01-02 12:32:19','2021-01-02 12:32:19'),
	(316,10,'augustine.prohaska@example.org',5,'2021-01-03 11:09:12','2021-01-03 11:09:12'),
	(317,11,'damaris.brakus@example.org',3,'2021-01-03 20:31:59','2021-01-03 20:31:59'),
	(318,4,'ephraim84@example.net',5,'2021-01-04 04:15:19','2021-01-04 04:15:19'),
	(319,8,'gwen.jakubowski@example.org',4,'2021-01-04 11:52:30','2021-01-04 11:52:30');

/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table recipe_theme
# ------------------------------------------------------------

DROP TABLE IF EXISTS `recipe_theme`;

CREATE TABLE `recipe_theme` (
  `theme_id` bigint(20) unsigned NOT NULL,
  `recipe_id` bigint(20) unsigned NOT NULL,
  `main` tinyint(1) NOT NULL DEFAULT '0',
  KEY `recipe_theme_theme_id_foreign` (`theme_id`),
  KEY `recipe_theme_recipe_id_foreign` (`recipe_id`),
  CONSTRAINT `recipe_theme_recipe_id_foreign` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `recipe_theme_theme_id_foreign` FOREIGN KEY (`theme_id`) REFERENCES `themes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `recipe_theme` WRITE;
/*!40000 ALTER TABLE `recipe_theme` DISABLE KEYS */;

INSERT INTO `recipe_theme` (`theme_id`, `recipe_id`, `main`)
VALUES
	(1,1,0),
	(2,1,0),
	(3,1,0),
	(8,1,1),
	(8,2,1),
	(1,3,0),
	(3,3,0),
	(6,3,1),
	(2,4,1),
	(6,4,0),
	(7,5,1),
	(3,5,0),
	(8,6,1),
	(2,6,0),
	(1,7,1),
	(2,7,0),
	(3,7,0),
	(1,8,0),
	(5,8,0),
	(3,9,1),
	(7,10,1),
	(6,11,1),
	(3,11,0),
	(1,11,0),
	(2,11,0);

/*!40000 ALTER TABLE `recipe_theme` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table recipes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `recipes`;

CREATE TABLE `recipes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `minutes` int(10) unsigned NOT NULL,
  `serves` int(10) unsigned NOT NULL,
  `level` int(10) unsigned NOT NULL,
  `pricing` int(10) unsigned NOT NULL,
  `intro` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `recipes_slug_unique` (`slug`),
  KEY `recipes_category_id_foreign` (`category_id`),
  CONSTRAINT `recipes_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `recipes` WRITE;
/*!40000 ALTER TABLE `recipes` DISABLE KEYS */;

INSERT INTO `recipes` (`id`, `category_id`, `title`, `slug`, `img`, `minutes`, `serves`, `level`, `pricing`, `intro`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,2,'Gaspacho (Andalousie)','gaspacho-andalousie','35057_w600.jpg',15,6,1,1,'Excellent, facile et rapide à réaliser. Servi dans des bols individuels, ces petites entrées dégagent un parfum naturel irrésistible.','2021-01-04 23:32:32','2021-01-04 23:32:32',NULL),
	(2,3,'Magra con tomate','magra-con-tomate','3009_w600.jpg',90,4,3,2,'C\'est vraiment simple et bon ! On peut mettre un poivron entier et du vin rouge à defaut du blanc.','2021-01-04 23:32:32','2021-01-04 23:32:32',NULL),
	(3,3,'Tagliatelles carbonara spéciales','tagliatelles-carbonnara-speciales','45730_w600.jpg',30,2,1,1,'C‘est une variante amusante et un peu plus sophistiquée des très célèbres Carbonara. Mon amie se régale de ce plat simple à préparer.','2021-01-04 23:32:32','2021-01-04 23:32:32',NULL),
	(4,3,'Linguine aux oignons caramélisés','linguine-oignons-caramelises','linguine.jpg',20,2,1,1,'La linguina ou lingue di passero en Italie est une pâte alimentaire traditionnelle de la cuisine italienne, variante des spaghettis, originaire de la cuisine ligure de la région de Ligurie en Italie.','2021-01-04 23:32:32','2021-01-04 23:32:32',NULL),
	(5,3,'Curry de légumes','curry-de-legumes','curry.jpg',80,4,2,1,'Surtout ne pas trop remuer en cours de cuisson pour éviter \"l‘effet bouillie\". Enlever le couvercle en fin de cuisson pour éviter que le plat ne soit pas trop liquide et l‘accompagner d‘un riz sauvage, d‘un mélange de riz complet ou d‘un riz basmati tout simple.','2021-01-04 23:32:32','2021-01-04 23:32:32',NULL),
	(6,4,'Crème catalane','creme-catalane','creme.jpeg',25,6,1,2,'Si cette crème ressemble d’aspect à notre crème brûlée, elle se réalise de façon très différente, et sa texture est moins riche, tout en étant onctueuse.','2021-01-04 23:32:32','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(7,1,'Croissants apéritifs','croissants-aperitifs','croissants.png',40,4,1,1,'Des petits croissants en pâte feuilletée fourrés avec du fromage frais à la ciboulette et du saumon fumé.','2021-01-04 23:32:32','2021-01-04 23:32:32',NULL),
	(8,3,'Mon couscous marocain','couscous','couscous.jpg',75,4,2,2,'Le couscous est d‘une part une semoule de blé dur préparée à l‘huile d‘olive et d‘autre part, une spécialité culinaire issue de la cuisine berbère, à base de couscous, de légumes, d‘épices, d‘huile d‘olive, et de viande ou de poisson','2021-01-04 23:32:32','2021-01-04 23:32:32',NULL),
	(9,2,'Soufflé au fromage','souffle-fromage','souffle.jpg',50,4,3,1,'Vous vous demandez quel fromage choisir pour un soufflé maison... Mais, pourquoi choisir ?? Découvrez notre recette de soufflé très gourmand, aux trois fromages !','2021-01-04 23:32:32','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(10,4,'Gâteau de carottes indien','gateau-carottes-indien','gateau.png',60,10,3,1,'La version carotte du Halwa est typique de l‘Inde du Nord où il est est vendu sur le bord des routes tôt le matin, lorsque les gens partent travailler alors qu‘il fait froid, ce gâteau étant plutôt calorique!!!','2021-01-04 23:32:32','2021-01-04 23:32:32',NULL),
	(11,1,'Bruschetta aux tomates','bruschetta-tomates','bruschetta.jpg',10,4,1,1,'D‘origine italienne, les bruschettas sont des tranches de pain grillé sur lesquelles plusieurs ingrédients sont disposés. Consommées froides ou chaudes, elles sont ici composées de dés de tomates arômatisés à l‘huile d‘olive, à l‘ail et au basilic. Un régal !','2021-01-04 23:32:32','2021-01-04 23:32:32',NULL);

/*!40000 ALTER TABLE `recipes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table steps
# ------------------------------------------------------------

DROP TABLE IF EXISTS `steps`;

CREATE TABLE `steps` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `recipe_id` bigint(20) unsigned NOT NULL,
  `order` int(10) unsigned NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `steps_recipe_id_foreign` (`recipe_id`),
  CONSTRAINT `steps_recipe_id_foreign` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `steps` WRITE;
/*!40000 ALTER TABLE `steps` DISABLE KEYS */;

INSERT INTO `steps` (`id`, `recipe_id`, `order`, `content`, `created_at`, `updated_at`)
VALUES
	(1,1,1,'Couper les tomates, 1 poivron rouge, 1 poivron vert, 1 concombre, oignons et l\'ail, passer le tout au mixer.','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(2,1,2,'Assaisonner avec sel, poivre, 4 cuillères à soupe d\'huile d\'olive, 2 cuillères à soupe de vinaigre de Xérès et de piment (selon les goûts).','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(3,1,3,'Laisser reposer au frais au minimum 2 heures.','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(4,1,4,'Détailler en petits dés poivrons et concombre restants ainsi que les oignons nouveaux. Parsemer la soupe de basilic ciselé.','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(5,1,5,'Disposer les garnitures dans des ramequins et chacun accommodera son gaspacho selon ses goûts.','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(6,2,1,'Couper le poivron et l\'oignon en fine julienne.','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(7,2,2,'Dans une cocotte, les faire revenir à feu doux dans l\'huile d\'olive, sans les laisser roussir! Réserver.','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(8,2,3,'Dans le reste d\'huile, faire dorer les morceaux de porcs salés et poivrés.','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(9,2,4,'Ajouter l\'ail finement coupé, et faire dorer pendant 30 secondes.','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(10,2,5,'Remettre poivrons et oignons dans la cocotte, puis verser le vin blanc à mi-hauteur du porc, et ajouter le bouillon de poule jusqu\'à tout juste recouvrir la viande.','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(11,2,6,'Laisser cuire à découvert environ 1/2 h, en mettant de temps en temps dessous les morceaux du dessus.','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(12,2,7,'Ajouter les tomates pelées et concassées, et laisser sur feu moyen encore à peu près 40 min.','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(13,2,8,'Le résultat ne doit pas être liquide mais plutôt \"purée\"!','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(14,3,1,'Faites revenir l\'oignon et l\'ail émincés dans un peu d\'huile d\'olive. Ajoutez ensuite les lardons. Faites les dégraisser à feu moyen quelques minutes. Versez le vin blanc et laisser réduire.','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(15,3,2,'Faite bouillir un large volume d\'eau, ajoutez du sel et une coulée d\'huile d\'olive, puis plongez-y les pâtes pour une cuisson al-dente.','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(16,3,3,'Une fois le vin blanc presque entièrement réduit, versez la crème fraîche, portez la à ébullition puis retirez le tout du feu. Gardez au chaud le temps que les pates soient prêtes.','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(17,3,4,'Sortez les pâtes, égouttez-les et servez-les dans les assiettes.','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(18,3,5,'Séparez les jaunes des oeufs et délayez-les très rapidement à la sauce, hors du feu. Verser une pincée de muscade, de poivre et servez la sauce sur les pâtes. Parsemez les assiettes de basilic fraîchement coupé.','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(19,4,1,'Préparez vos ingrédients : coupez les oignons en deux, puis tranchez-les finement. Hachez finement l‘ail et le persil.','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(20,4,2,'Ajoutez presque tout le beurre dans une grande poêle. Laissez fondre puis ajouter les oignons.','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(21,4,3,'Laissez cuire vos oignons pendant 30 à 40 minutes jusqu’à ce qu’ils soient dorés.','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(22,4,4,'Ajoutez l’ail à la poêle avec le reste du beurre et laissez rôtir pendant une minute. Ajoutez le vin blanc et laissez évaporer. Râpez le parmesan et le pecorino pendant ce temps.','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(23,4,5,'Quand le vin s’est évaporé, ajoutez le parmesan et le pecorino ainsi que beaucoup de poivre noir et une belle pensée de sel. Mélangez le tout avec une cuillère en bois.','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(24,4,6,'Faites cuire les pâtes dans de l’eau bouillante salée.','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(25,4,7,'Prélevez 200ml d’eau des pâtes et ajoutez celle-ci aux oignons.','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(26,4,8,'Lorsque les pâtes sont cuites, égouttez-les tout en gardant de côté l’eau de cuisson. Ajoutez les pâtes à la sauce.','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(27,4,9,'Continuez à ajouter de l’eau des pâtes tout en mélangeant jusqu’à ce que la sauce prenne. Pressez le jus d’un demi citron sur le tout et ajoutez le persil.','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(28,4,10,'Servez avec encore un peu plus de parmesan râpé, de persil et de poivre noir.','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(29,5,1,'Débiter les carottes en fines tranches et la patate en petits morceaux. Découper les courgettes en quarts de rondelles tout en conservant la peau.','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(30,5,2,'Détailler les échalotes et l‘ail et les faire dorer dans une grande sauteuse avec un peu d‘huile. Ajouter les légumes, réduire le feu et couvrir.','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(31,5,3,'En parallèle, dans un saladier, mélanger la crème de coco, le concentré de tomates et la pâte de curry avec le jus des citrons verts. Ajouter le piment et le basilic moulus, le cumin, et napper les légumes de ce mélange bien homogène. Ajouter 1/2 verre d‘eau.','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(32,5,4,'Poivrer et saler à discrétion.','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(33,5,5,'Bien laisser mijoter sous couvercle à feu minimum.','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(34,6,1,'Portez le lait à ébullition avec le sucre au fond','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(35,6,2,'Prélevez le zeste du citron et de l‘orange, et faites les infuser dans le lait chaud avec la cannelle et la vanille fendue pendant 10 minutes hors du feu en couvrant','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(36,6,3,'Séparer les blancs des jaunes, et délayez la maïzéna dans les jaunes (les blancs ne servent pas dans cette recette)','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(37,6,4,'Versez le lait chaud sur les jaunes, puis remettez le tout sur le feu à épaissir en remuant sans cesse avec une spatule','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(38,6,5,'Lorsque la consistance est celle d‘une crème, versez la crème dans des ramequins individuels','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(39,7,1,'Etaler la pâte feuilletée sur le plan de travail, la couper en 16 parts égales (d‘abord 2, puis 4, etc...)','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(40,7,2,'Déposer une petite quantité de saumon (env. une cuillère à thé) sur la partie large des triangles ainsi obtenus.','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(41,7,3,'Les rouler un par un en prenant soin de bien les fermer.','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(42,7,4,'Vous pouvez ramener les pointes vers un côté pour leur donner l‘aspect de vrais croissants.','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(43,7,5,'Mélanger dans une tasse le jaune d‘oeuf et le lait, battre, étaler de ce mélange sur les croissants.','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(44,7,6,'Préchauffez le four à 180°C.','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(45,7,7,'Enfourner 15 mn.','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(46,8,1,'Faire revenir les oignons et les retirer quand ils sont dorés','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(47,8,2,'Faire revenir toutes les viandes, sauf les merguez, que l‘on cuira au dernier moment. Réserver.','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(48,8,3,'Dans le faitout, ajouter un peu d‘huile d‘olive et faire revenir tous les légumes sauf les courgettes et les pois chiches s‘ils sont cuits/en conserve. Ajouter les tomates coupées, puis leur jus.','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(49,8,4,'A ce stade, on ajoute les épices, dont la quantité est à ajuster au goût de chacun... Mais on trouve des épices à couscous tout prêts: cumin, paprika, safran, 4 épices, ras el hanout, gingembre et un soupçon de cannelle','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(50,8,5,'Ensuite, on couvre de bouillon de viande corsé, et on laisse cuire 1h30 à petits bouillons.','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(51,8,6,'10 minutes avant la fin de la cuisson, on rajoute les courgettes et éventuellement les pois chiches.','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(52,9,1,'Préchauffer le four à 180°C (thermostat 6). Beurrer le moule.','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(53,9,2,'Chauffer le beurre dans une casserole, ajouter la farine et remuer rapidement pendant 1 min. Ajouter le lait tiédi, remuer au fouet pendant quelques minutes à feu doux.','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(54,9,3,'Retirer la casserole du feu.','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(55,9,4,'Séparer les blancs et les battre fermement (avec une pincée de sel).','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(56,9,5,'Dans la casserole refroidie, ajouter les jaunes d‘oeufs un à un, puis le fromage râpé. Mettre une pincée de muscade, poivrer. Saler peu car le fromage contient déjà du sel.','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(57,9,6,'Incorporer les blancs d‘oeufs battus en mélangeant délicatement.','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(58,9,7,'Verser dans le moule, au maximum jusqu‘à 4 cm du bord.','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(59,9,8,'Enfourner pendant 35 minutes en position chaleur tournante.','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(60,10,1,'Laver, peler, râper les carottes.','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(61,10,2,'Les faire revenir dans une poêle à fond épais, dans la moitié du beurre, pendant 20 à 30 min. Remuer de temps en temps.','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(62,10,3,'Ensuite, incorporer le reste du beurre, ainsi que le lait, le sucre et la cardamome.','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(63,10,4,'Laisser cuire à feu vif, en remuant plus rapidement pendant 15 min environ, jusqu’à ce que l’ensemble soit assez épais pour se détacher du bord en une masse compacte.','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(64,10,5,'Etaler la préparation sur un plateau, décorer la surface de pistaches et d’amandes effilées.','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(65,10,6,'Laisser refroidir, puis découper en losanges ou en rectangles.','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(66,11,1,'Faire griller les tranches de pain. Les frotter avec la gousse d‘ail.','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(67,11,2,'Couper les tomates en deux, enlever les pépins, et couper la chair en cubes.','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(68,11,3,'Dans un saladier, mélanger la chair des tomates, le basilic ciselé. Saler, poivrer et ajouter l‘huile d‘olive.','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(69,11,4,'Au moment de servir, garnir chaque tranche de pain d‘une cuillère à soupe de dés de tomates avec un peu de jus.','2021-01-04 23:32:32','2021-01-04 23:32:32');

/*!40000 ALTER TABLE `steps` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table themes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `themes`;

CREATE TABLE `themes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `themes_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `themes` WRITE;
/*!40000 ALTER TABLE `themes` DISABLE KEYS */;

INSERT INTO `themes` (`id`, `name`, `title`, `slug`, `description`, `created_at`, `updated_at`)
VALUES
	(1,'Je débute','Recettes pour débutants','debutants','Il faut bien commencer un jour ! Marmiton accompagne vos premiers pas en cuisine. Parce que cuisiner s\'apprend peu à peu, commencez simplement... Une cuisine simple, des recettes faciles et le tour est joué, vous deviendrez vite un cordon bleu et y prendrez du plaisir ! Promis. Choisissez une recette facile et suivez le guide...','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(2,'Rapide et facile','Recettes pour les citadins stressés','rapide-et-facile','Métro, boulot, chrono... Cuisiner ? Pas le temps. Pas le courage. Trop compliqué. Pourtant, vous en avez marre des pizzas à emporter, des nems réchauffés ou de la quiche surgelée...vous avez besoin d\'une cuisine rapide et simple et de recettes rapides et simples ! Calmez-vous, éteignez la télé, passez-vous un peu d\'eau sur la figure et choisissez une bonne recette rapide et simple. Parce qu\'une recette n\'a pas forcément besoin d\'être compliquée pour être bonne ! Ça, c\'est dit ! Découvrez aussi notre sélection de recettes de cuisine rapide !','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(3,'Moins cher','Recettes pour les étudiants fauchés','economique','Marre du resto U ? Les pâtes au beurre vous donnent des envies de meurtre ? Seulement vous n\'avez pas les moyens de vous payer la Tour d\'Argent tous les soirs...et vous êtes plus \"Courses à Auchon\" que \"Goûter chez Fauchan\".   Pas de panique, on va essayer de vous aider. Trouvez une casserole propre et choisissez dans notre sélection des recettes faciles, économiques et carrément bonnes. Gageons qu\'avec ces recettes pour étudiants vous allez séduire toute la fac !','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(4,'Pique-nique','Recettes à grignoter dans un parc','pique-nique','Les oiseaux gazouillent, le soleil pointe le bout de son nez… Ah, le début des beaux jours ! Tout cela fait naitre chez vous des envies de grandes étendues et de pique-nique (pic nic pour les intimes) ? Nous avons sélectionné pour vous de jolies petites recettes pour changer du traditionnel jambon-beurre. A nous  les salades, les tartes, cakes and Co ! Et pour rendre encore plus ludiques vos pique-niques, pensez aux bentos et autres jolies petites boites pour contenir vos aliments préférés et autre recette. Pique nique, en avant !','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(5,'Afrique','Recettes d\'origine Africaine','afrique','L\'Afrique est le berceau de l\'humanité, mais c\'est également un vaste continent aux cultures, décors et influences multiples. Et qui dit variété de cultures dit variété de saveurs ! Découvrez la cuisine africaine en réalisant une recette africaine parmi celles-ci. A découvrir aussi : recettes du Ramadan','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(6,'Italie','Recettes d\'origine Italienne','italie','Dans de nombreux pays, la cuisine est bien plus qu\'un moyen de se nourrir. Forme d\'art, manifestation culturelle, elle est la source régulière de plaisirs chaque fois renouvellés. Parmi les pays où la cuisine atteint des sommets quasi-mystiques, l\'Italie joue un rôle central. Berceau de la renaissance, carrefour d\'influences venues des quatres coins de la Méditerranée, elle recèle de trésors que nous ne connaissons pas toujours autant qu\'ils le méritent. La cuisine italienne est incontournable et toujours réalisée autour d\'ingrédients frais et de bonne qualité. L\'Italie est un paradis pour les gourmets et cette sélection de recettes italiennes regorgent d\'alléchantes idées. Et vous, quelle est votre recette italienne favorite ?','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(7,'Inde','Recettes d\'origine Indienne','inde','Cuisiner à l\'indienne c\'est découvrir un monde de saveurs et d\'odeurs aux mille visages en direct de sa cuisine. Inde lointaine, Inde végétarienne, Inde gourmande, découvrez les différentes facettes de ce pays en cuisinant régulièrement une recette indienne. INFO : Le web a pu donner l\'image d\'un monde sans foi ni loi sinon celle du marché... Mais n\'oublions pas que l\'Internet a d\'abord été conçu autour d\'un concept fort : le partage. Partage d\'informations, de ressources, il est à la base même de Marmiton.   C\'est pourquoi nous désirons nous associer à un autre partage : celui des connaissances, avec KALAM, organisation qui agit en Inde pour la rescolarisation d\'enfants au travail.','2021-01-04 23:32:32','2021-01-04 23:32:32'),
	(8,'Espagne','Recettes d\'origine Espagnole','espagne','Et viva España ! Il est temps de se mettre à l\'heure d\'été avec la cuisine espagnole... Qui dit recette espagnole ne dit pas que tortilla ou paëlla, la preuve avec cette sélection de recettes de cuisine espagnole pour vivre au rythme de l\'Espagne toute l\'année durant. A vous la cuisine espagnole : tapas, gaspacho, paëlla... muy caliente','2021-01-04 23:32:32','2021-01-04 23:32:32');

/*!40000 ALTER TABLE `themes` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
