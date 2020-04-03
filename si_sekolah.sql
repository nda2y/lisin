-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 03, 2020 at 01:28 PM
-- Server version: 5.6.14
-- PHP Version: 5.5.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `si_sekolah`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE IF NOT EXISTS `barang` (
  `id` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `kode_barang` varchar(10) NOT NULL,
  `nama_barang` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id`, `id_kategori`, `kode_barang`, `nama_barang`) VALUES
(0, 1, 'HP001', 'SONY EREKSON');

-- --------------------------------------------------------

--
-- Table structure for table `elek_brg`
--

CREATE TABLE IF NOT EXISTS `elek_brg` (
  `id_brg` int(11) NOT NULL AUTO_INCREMENT,
  `id_user_brg` int(11) NOT NULL,
  `nm_brg` varchar(22) NOT NULL,
  `merk` varchar(22) NOT NULL,
  `SN` int(11) NOT NULL,
  PRIMARY KEY (`id_brg`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(3, 'ELEKTRONIKA', 'General User'),
(4, 'INSTRUMEN', 'General User'),
(5, 'AC & PENDINGIN', 'General User'),
(6, 'LISTRIK JARINGAN', 'General User'),
(7, 'LISTRIK REWINDING', 'General User'),
(8, 'members', 'General User');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE IF NOT EXISTS `kategori` (
  `id_kategori` int(11) NOT NULL AUTO_INCREMENT,
  `kode_kategori` varchar(10) NOT NULL,
  `nama_kategori` varchar(30) NOT NULL,
  PRIMARY KEY (`id_kategori`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `kode_kategori`, `nama_kategori`) VALUES
(1, 'E001', 'ELEKTRONIK'),
(2, 'S002', 'SABUN');

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE IF NOT EXISTS `login_attempts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link` varchar(100) NOT NULL,
  `judul` varchar(70) NOT NULL,
  `icon` varchar(30) NOT NULL,
  `isParent` int(11) NOT NULL,
  `aktif` enum('y','n') NOT NULL,
  `groups_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `link`, `judul`, `icon`, `isParent`, `aktif`, `groups_id`) VALUES
(0, '#', 'MAIN MENU', '', 0, 'y', 1),
(4, 'menu', 'DATA MASTER', 'fa-inbox', 0, 'y', 1),
(10, '/', 'PENGGUNA SISTEM', 'fa-user', 0, 'y', 1),
(12, '/', 'USERS', 'fa-keyboard-o', 10, 'y', 0),
(13, 'groups', 'Role / Groups', 'fa-barcode', 10, 'y', 0),
(14, 'Elek_brg', 'ELEKTRONIKA BARANG', 'fa fa-list-alt', 0, 'y', 0),
(15, 'menu', 'MENU MANAGEMENT', 'fa fa-list-alt', 4, 'y', 0),
(16, 'Harviacode', 'HARVIACODE', 'fa fa-list-alt', 4, 'y', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) unsigned DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) unsigned NOT NULL,
  `last_login` int(11) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES
(1, '127.0.0.1', 'administrator', '$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36', '', 'admin@admin.com', '', NULL, NULL, NULL, 1268889823, 1585912961, 1, 'Admin', 'istrator', 'ADMIN', '0'),
(3, '::1', NULL, '$2y$08$w1u1cgbDI863iUFnlr1ujODfhRSuNvCBhFjOKYG55w11A13UyZWTm', NULL, 'fb.nda2y@gmail.com', NULL, NULL, NULL, NULL, 1584872831, 1585571433, 1, 'Thoyib', 'Hidayat', 'pusri', '085643640613'),
(4, '::1', NULL, '$2y$08$cI5RxnKwhRpyixecA/nz3uuqX9cf9cM4gbtbrDVoGCjAbQl7L31R6', NULL, 'imamk@pusri.co.id', NULL, NULL, NULL, NULL, 1585570229, NULL, 1, 'Imam', 'Kurniawan', 'pusri', '085643'),
(5, '::1', NULL, '$2y$08$tsyXwrHADByzDdI4I6DQBumF3BqiIgVY.T88Hs8DOHOAmJSq3.IYa', NULL, 'mrama@pusri.co.id', NULL, NULL, NULL, NULL, 1585570341, NULL, 1, 'Muhamad ', 'Rama', 'pusri', '085'),
(6, '::1', NULL, '$2y$08$H82dTB4gHgluctUfzzxl7eeWc18h.AnXit./r0mznE0paQuh9mGLS', NULL, 'tanzim@pusri.co.id', NULL, NULL, NULL, NULL, 1585570456, NULL, 1, 'Tanzi', 'Mariansi', 'pusri', '0858976456'),
(7, '::1', NULL, '$2y$08$teAvou1Px334OOvxxnFUAONYjOQvDdQ2cEPi6l6jv84/uvVwUukw.', NULL, 'darwansyah@pusri.co.id', NULL, NULL, NULL, NULL, 1585570537, NULL, 1, 'Darwansyah', 'Permana', 'pusri', '086543'),
(8, '::1', NULL, '$2y$08$bhlQSlsueQWwatyRRKQ1Ve/dMxFgj5ZLaTD.c6xn85a4c/yOWf8GO', NULL, 'kartono@pusri.co.id', NULL, NULL, NULL, NULL, 1585570611, NULL, 1, 'Kartono', 'K', 'pusri', '097564'),
(9, '::1', NULL, '$2y$08$gnfwdlbA6bxwJLOhuNW8dePswmLJaQtdfnllU2xSvbHjtOZo2Crx6', NULL, 'risandha@pusri.co.id', NULL, NULL, NULL, NULL, 1585570673, NULL, 1, 'Risandha ', 'Dwi K', 'pusri', '08564');

-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

CREATE TABLE IF NOT EXISTS `users_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  KEY `fk_users_groups_users1_idx` (`user_id`),
  KEY `fk_users_groups_groups1_idx` (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=35 ;

--
-- Dumping data for table `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1),
(29, 3, 1),
(30, 3, 3),
(31, 3, 4),
(32, 3, 5),
(33, 3, 6),
(34, 3, 7),
(11, 4, 4),
(13, 5, 4),
(15, 6, 5),
(17, 7, 5),
(20, 8, 6),
(21, 9, 6);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
