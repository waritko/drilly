-- Adminer 4.7.0 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `drills`;
CREATE TABLE `drills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `drillSet` int(11) NOT NULL,
  `drillOrder` tinyint(4) NOT NULL,
  `head` tinyint(4) NOT NULL DEFAULT '0',
  `alpha` tinyint(4) NOT NULL DEFAULT '0',
  `charlie` tinyint(4) NOT NULL DEFAULT '0',
  `delta` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `drillSet` (`drillSet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

INSERT INTO `drills` (`id`, `name`, `drillSet`, `drillOrder`, `head`, `alpha`, `charlie`, `delta`) VALUES
(1,	'Mozambique Drill',	1,	1,	1,	2,	0,	0),
(2,	'Reload Drill',	1,	2,	0,	4,	4,	4),
(3,	'F.A.S.T.',	1,	3,	2,	4,	0,	0),
(4,	'ACiD Drill',	1,	4,	0,	6,	0,	0),
(5,	'MOD Joe Drill',	1,	5,	0,	6,	0,	0),
(6,	'MOD Bill Drill',	1,	6,	0,	6,	6,	6),
(7,	'MOD F.A.S.T.',	1,	7,	2,	4,	0,	0),
(8,	'MOD El Presidente',	1,	8,	0,	12,	12,	12),
(9,	'Bill Drill',	2,	1,	0,	6,	6,	6),
(10,	'Tripple Bill',	2,	2,	0,	18,	18,	18),
(11,	'El Presidente',	2,	3,	0,	12,	12,	12),
(12,	'V-Drill',	2,	4,	0,	18,	18,	18),
(13,	'Chaos Drill',	2,	5,	0,	15,	15,	15),
(14,	'Tripple Treat Drill',	2,	6,	0,	15,	0,	0),
(15,	'Super Presidente',	2,	7,	0,	20,	20,	20),
(16,	'Mosambique Drill',	3,	1,	1,	2,	0,	0),
(17,	'Reload Drill',	3,	2,	0,	4,	4,	4),
(18,	'F.A.S.T.',	3,	3,	2,	4,	0,	0),
(19,	'ACiD Drill',	3,	4,	0,	6,	0,	0),
(20,	'MOD Joe Drill',	3,	5,	0,	6,	0,	0),
(21,	'MOD Bill Drill',	3,	6,	0,	6,	6,	6),
(22,	'MOD F.A.S.T.',	3,	7,	2,	4,	0,	0),
(23,	'MOD El Presidente',	3,	8,	0,	12,	12,	12),
(24,	'3m, 3 výstřely, silná ruka',	4,	1,	0,	3,	0,	0),
(25,	'3m, 3 výstřely, silná ruka',	4,	2,	0,	3,	0,	0),
(26,	'3m, 3 výstřely silná ruka, 3 slabá',	4,	3,	0,	6,	0,	0),
(27,	'5m, 3 výstřely',	4,	4,	0,	3,	0,	0),
(28,	'5m, 3 výstřely',	4,	5,	0,	3,	0,	0),
(29,	'5m, 3 výstřely',	4,	6,	0,	3,	0,	0),
(30,	'5m, 3 výstřely',	4,	7,	0,	3,	0,	0),
(31,	'7m, 4 výstřely',	4,	8,	0,	4,	0,	0),
(32,	'7m, 4 výstřely',	4,	9,	0,	4,	0,	0),
(33,	'7m, 4 výstřely, přebít, 4 výstřely',	4,	10,	0,	8,	0,	0),
(34,	'14m, 3 výstřely',	4,	11,	0,	3,	0,	0),
(35,	'14m, 3 výstřely',	4,	12,	0,	3,	0,	0),
(36,	'14m, 4 výstřely',	4,	13,	0,	4,	0,	0),
(37,	'23m, 2 výstřely, zakleknout, 3 výstřely',	4,	14,	0,	5,	0,	0),
(38,	'23m, 2 výstřely, zakleknout, 3 výstřely',	4,	15,	0,	5,	0,	0),
(39,	'Mozambique Drill',	5,	1,	1,	2,	0,	0),
(40,	'Reload Drill',	5,	2,	0,	4,	0,	0),
(41,	'F.A.S.T.',	5,	3,	2,	4,	0,	0),
(42,	'Pakárna Drill',	5,	4,	0,	6,	0,	0),
(43,	'MOD Joe Drill',	5,	5,	0,	6,	0,	0),
(44,	'MOD Bill Drill',	5,	6,	0,	6,	0,	0),
(45,	'MOD F.A.S.T.',	5,	7,	2,	4,	0,	0),
(46,	'MOD El Presidente',	5,	8,	0,	10,	0,	0),
(47,	'Reload Drill',	6,	2,	0,	4,	4,	4),
(48,	'Mosambique Drill',	6,	1,	0,	3,	3,	3),
(49,	'F.A.S.T.',	6,	3,	0,	6,	6,	6),
(50,	'MOD Presidente',	6,	4,	0,	9,	9,	9),
(51,	'Chaos Drill',	6,	7,	0,	15,	15,	15),
(52,	'Bill Drill',	6,	6,	0,	6,	6,	6),
(53,	'MOD Reload',	6,	8,	0,	4,	4,	4),
(54,	'JOE Drill',	6,	5,	0,	6,	6,	6);

DROP TABLE IF EXISTS `events`;
CREATE TABLE `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `date` date NOT NULL,
  `eventOrder` tinyint(4) NOT NULL DEFAULT '1',
  `drillSet` int(11) NOT NULL,
  `isMatch` enum('T','F') NOT NULL DEFAULT 'F',
  `memo` varchar(255) CHARACTER SET utf8 COLLATE utf8_czech_ci NOT NULL DEFAULT '',
  `userSet` varchar(255) CHARACTER SET utf8 COLLATE utf8_czech_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  KEY `userSet` (`userSet`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `sets`;
CREATE TABLE `sets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `sets` (`id`, `name`) VALUES
(1,	'Drill Brno - A. Luffer'),
(2,	'Action Drill - A. Luffer'),
(3,	'Dark Drill - A. Luffer'),
(4,	'FBI Qualification'),
(5,	'Shotgun Drill'),
(6,	'Waritko Drill');

DROP TABLE IF EXISTS `situations`;
CREATE TABLE `situations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event` int(11) NOT NULL,
  `situation` int(11) NOT NULL,
  `baseTime` decimal(5,2) NOT NULL DEFAULT '0.00',
  `head` tinyint(4) NOT NULL,
  `alpha` tinyint(4) NOT NULL,
  `charlie` tinyint(4) NOT NULL,
  `delta` tinyint(4) NOT NULL,
  `miss` tinyint(4) NOT NULL,
  `proc` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `situation` (`situation`),
  KEY `event` (`event`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `googleId` char(64) COLLATE utf8_czech_ci NOT NULL,
  `mail` char(255) COLLATE utf8_czech_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `googleId` (`googleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;


-- 2019-10-30 07:21:36
