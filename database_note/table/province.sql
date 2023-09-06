-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 18, 2023 at 03:07 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zando`
--

-- --------------------------------------------------------

--
-- Table structure for table `province`
--

CREATE TABLE `province` (
  `province_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_modified` datetime NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `province`
  ADD PRIMARY KEY (`province_id`);


ALTER TABLE `province`
  MODIFY `province_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
COMMIT;


--
-- Dumping data for table `province`
--

INSERT INTO `province` (`name`, `description`, `date_modified`, `date_added`) VALUES
('Phnom Penh', 'Delivery in Phnom Penh', '2019-11-05 14:44:42', '2019-08-03 10:00:22'),
('Oddar Meancheay (Kerry)', 'Oddar Meancheay', '2019-11-07 14:09:32', '2019-10-24 17:11:46'),
('Oddar Meancheay (Other )', 'Oddar Meancheay', '2019-11-07 14:09:16', '2019-10-24 17:20:02'),
('Battambang', 'Battambang', '0000-00-00 00:00:00', '2019-11-07 14:05:05'),
('Kampong Cham', 'Kampong Cham', '0000-00-00 00:00:00', '2019-11-07 14:05:22'),
('Kampong Chhnang', 'Kampong Chhnang', '0000-00-00 00:00:00', '2019-11-07 14:05:38'),
('Kampong Som', 'Kampong Som', '0000-00-00 00:00:00', '2019-11-07 14:05:54'),
('Kampong Speu', 'Kampong Speu', '0000-00-00 00:00:00', '2019-11-07 14:06:07'),
('Kampong Thom', 'Kampong Thom', '0000-00-00 00:00:00', '2019-11-07 14:06:19'),
('Kampot', 'Kampot', '0000-00-00 00:00:00', '2019-11-07 14:06:31'),
('Kandal', 'Kandal', '0000-00-00 00:00:00', '2019-11-07 14:06:44'),
('Kaoh Kong', 'Kaoh Kong', '0000-00-00 00:00:00', '2019-11-07 14:06:58'),
('Keb', 'Keb', '0000-00-00 00:00:00', '2019-11-07 14:07:10'),
('Kratie', 'Kratie', '0000-00-00 00:00:00', '2019-11-07 14:07:21'),
('Mondul Kiri', 'Mondul Kiri', '0000-00-00 00:00:00', '2019-11-07 14:07:33'),
('Pailin', 'Pailin', '0000-00-00 00:00:00', '2019-11-07 14:09:47'),
('Preah Seihanu', 'Preah Seihanu (Kompong Som or Sihanoukville)', '0000-00-00 00:00:00', '2019-11-07 14:10:22'),
('Preah Vihear', 'Preah Vihear', '0000-00-00 00:00:00', '2019-11-07 14:10:36'),
('Prey Veng', 'Prey Veng', '0000-00-00 00:00:00', '2019-11-07 14:10:54'),
('Pursat', 'Pursat', '0000-00-00 00:00:00', '2019-11-07 14:11:11'),
('Ratanak Kiri', 'Ratanak Kiri', '0000-00-00 00:00:00', '2019-11-07 14:11:27'),
('Siemreap', 'Siemreap', '0000-00-00 00:00:00', '2019-11-07 14:11:40'),
('Stung Treng', 'Stung Treng', '0000-00-00 00:00:00', '2019-11-07 14:11:53'),
('Svay Rieng', 'Svay Rieng', '0000-00-00 00:00:00', '2019-11-07 14:12:08'),
('Takeo', 'Takeo', '0000-00-00 00:00:00', '2019-11-07 14:12:25'),
('Banteay Meanchey', 'Banteay Meanchey', '0000-00-00 00:00:00', '2019-11-07 14:12:34');

