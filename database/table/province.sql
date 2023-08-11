-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:5306:5306
-- Generation Time: Aug 07, 2023 at 05:00 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecm_g4`
--

-- --------------------------------------------------------

--
-- Table structure for table `province`
--

CREATE TABLE `province` (
  `province_id` int(11) NOT NULL,
  `name` varchar(120) NOT NULL,
  `description` text NOT NULL,
  `date_modified` datetime NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `province`
--

INSERT INTO `province` (`province_id`, `name`, `description`, `date_modified`, `date_added`) VALUES
(1, 'Phnom Penh', 'Delivery in Phnom Penh', '2019-11-05 14:44:42', '2019-08-03 03:00:22'),
(2, 'Oddar Meancheay (Kerry)', 'Oddar Meancheay', '2019-11-07 14:09:32', '2019-10-24 10:11:46'),
(3, 'Oddar Meancheay (Other )', 'Oddar Meancheay', '2019-11-07 14:09:16', '2019-10-24 10:20:02'),
(4, 'Battambang', 'Battambang', '0000-00-00 00:00:00', '2019-11-07 07:05:05'),
(5, 'Kampong Cham', 'Kampong Cham', '0000-00-00 00:00:00', '2019-11-07 07:05:22'),
(6, 'Kampong Chhnang', 'Kampong Chhnang', '0000-00-00 00:00:00', '2019-11-07 07:05:38'),
(7, 'Kampong Som', 'Kampong Som', '0000-00-00 00:00:00', '2019-11-07 07:05:54'),
(8, 'Kampong Speu', 'Kampong Speu', '0000-00-00 00:00:00', '2019-11-07 07:06:07'),
(9, 'Kampong Thom', 'Kampong Thom', '0000-00-00 00:00:00', '2019-11-07 07:06:19'),
(10, 'Kampot', 'Kampot', '0000-00-00 00:00:00', '2019-11-07 07:06:31'),
(11, 'Kandal', 'Kandal', '0000-00-00 00:00:00', '2019-11-07 07:06:44'),
(12, 'Kaoh Kong', 'Kaoh Kong', '0000-00-00 00:00:00', '2019-11-07 07:06:58'),
(13, 'Keb', 'Keb', '0000-00-00 00:00:00', '2019-11-07 07:07:10'),
(14, 'Kratie', 'Kratie', '0000-00-00 00:00:00', '2019-11-07 07:07:21'),
(15, 'Mondul Kiri', 'Mondul Kiri', '0000-00-00 00:00:00', '2019-11-07 07:07:33'),
(16, 'Pailin', 'Pailin', '0000-00-00 00:00:00', '2019-11-07 07:09:47'),
(17, 'Preah Seihanu', 'Preah Seihanu (Kompong Som or Sihanoukville)', '0000-00-00 00:00:00', '2019-11-07 07:10:22'),
(18, 'Preah Vihear', 'Preah Vihear', '0000-00-00 00:00:00', '2019-11-07 07:10:36'),
(19, 'Prey Veng', 'Prey Veng', '0000-00-00 00:00:00', '2019-11-07 07:10:54'),
(20, 'Pursat', 'Pursat', '0000-00-00 00:00:00', '2019-11-07 07:11:11'),
(21, 'Ratanak Kiri', 'Ratanak Kiri', '0000-00-00 00:00:00', '2019-11-07 07:11:27'),
(22, 'Siemreap', 'Siemreap', '0000-00-00 00:00:00', '2019-11-07 07:11:40'),
(23, 'Stung Treng', 'Stung Treng', '0000-00-00 00:00:00', '2019-11-07 07:11:53'),
(24, 'Svay Rieng', 'Svay Rieng', '0000-00-00 00:00:00', '2019-11-07 07:12:08'),
(25, 'Takeo', 'Takeo', '0000-00-00 00:00:00', '2019-11-07 07:12:25'),
(26, 'Banteay Meanchey', 'Banteay Meanchey', '0000-00-00 00:00:00', '2019-11-07 07:12:34');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `province`
--
ALTER TABLE `province`
  ADD PRIMARY KEY (`province_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `province`
--
ALTER TABLE `province`
  MODIFY `province_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
