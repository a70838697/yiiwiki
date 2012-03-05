-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 05, 2012 at 04:51 AM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `csp_wiki`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_entries`
--

CREATE TABLE IF NOT EXISTS `tbl_entries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `access` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL,
  `ip` int(11) unsigned zerofill NOT NULL,
  `revision` int(11) NOT NULL DEFAULT '1',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_entry_revisions`
--

CREATE TABLE IF NOT EXISTS `tbl_entry_revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `access` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `ip` int(11) NOT NULL,
  `revision` int(11) NOT NULL,
  `entry_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_migration`
--

CREATE TABLE IF NOT EXISTS `tbl_migration` (
  `version` varchar(255) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_migration`
--

INSERT INTO `tbl_migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1330915628),
('m110805_153437_installYiiUser', 1330915633),
('m110810_162301_userTimestampFix', 1330915634);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_profiles`
--

CREATE TABLE IF NOT EXISTS `tbl_profiles` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tbl_profiles`
--

INSERT INTO `tbl_profiles` (`user_id`, `first_name`, `last_name`) VALUES
(1, 'Administrator', 'Admin'),
(2, 'Demo', 'Demo');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_profiles_fields`
--

CREATE TABLE IF NOT EXISTS `tbl_profiles_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `varname` varchar(50) NOT NULL,
  `title` varchar(255) NOT NULL,
  `field_type` varchar(50) NOT NULL,
  `field_size` int(3) NOT NULL,
  `field_size_min` int(3) NOT NULL,
  `required` int(1) NOT NULL,
  `match` varchar(255) NOT NULL,
  `range` varchar(255) NOT NULL,
  `error_message` varchar(255) NOT NULL,
  `other_validator` text NOT NULL,
  `default` varchar(255) NOT NULL,
  `widget` varchar(255) NOT NULL,
  `widgetparams` text NOT NULL,
  `position` int(3) NOT NULL,
  `visible` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tbl_profiles_fields`
--

INSERT INTO `tbl_profiles_fields` (`id`, `varname`, `title`, `field_type`, `field_size`, `field_size_min`, `required`, `match`, `range`, `error_message`, `other_validator`, `default`, `widget`, `widgetparams`, `position`, `visible`) VALUES
(1, 'first_name', 'First Name', 'VARCHAR', 255, 3, 2, '', '', 'Incorrect First Name (length between 3 and 50 characters).', '', '', '', '', 1, 3),
(2, 'last_name', 'Last Name', 'VARCHAR', 255, 3, 2, '', '', 'Incorrect Last Name (length between 3 and 50 characters).', '', '', '', '', 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_uploads`
--

CREATE TABLE IF NOT EXISTS `tbl_uploads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) NOT NULL,
  `filesize` int(11) NOT NULL,
  `location` varchar(255) NOT NULL,
  `access` int(11) NOT NULL,
  `create_time` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `ip` int(11) unsigned zerofill NOT NULL,
  `revision` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE IF NOT EXISTS `tbl_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `activkey` varchar(128) NOT NULL,
  `superuser` int(1) NOT NULL,
  `status` int(1) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastvisit_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_username` (`username`),
  UNIQUE KEY `user_email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`id`, `username`, `password`, `email`, `activkey`, `superuser`, `status`, `create_at`, `lastvisit_at`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'webmaster@example.com', 'dcfd1bb010216eb03e19abe78b858d5a', 1, 1, '2012-03-05 02:47:13', '0000-00-00 00:00:00'),
(2, 'demo', 'fe01ce2a7fbac8fafaed7c982a04e229', 'demo@example.com', '214b7ca06cbd07a461b5218cb63e25fe', 0, 1, '2012-03-05 02:47:13', '0000-00-00 00:00:00');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_entries`
--
ALTER TABLE `tbl_entries`
  ADD CONSTRAINT `tbl_entries_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tbl_entry_revisions`
--
ALTER TABLE `tbl_entry_revisions`
  ADD CONSTRAINT `tbl_entry_revisions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tbl_entry_revisions_ibfk_2` FOREIGN KEY (`entry_id`) REFERENCES `tbl_entries` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tbl_profiles`
--
ALTER TABLE `tbl_profiles`
  ADD CONSTRAINT `user_profile_id` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tbl_uploads`
--
ALTER TABLE `tbl_uploads`
  ADD CONSTRAINT `tbl_uploads_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

