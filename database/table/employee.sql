-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:5306:5306
-- Generation Time: Aug 07, 2023 at 05:01 PM
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
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL,
  `firstname` varchar(120) NOT NULL,
  `lastname` varchar(120) NOT NULL,
  `tel` varchar(16) NOT NULL, -- username
  `password` varchar(16) DEFAULT NULL, -- username
  `email` varchar(120) DEFAULT NULL,
  `base_salary` decimal(6,0) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `province` varchar(120) DEFAULT NULL,
  `country` varchar(120) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employee_id`, `firstname`, `lastname`, `tel`, `email`, `base_salary`, `address`, `province`, `country`, `create_at`) VALUES
(1, 'Dara', 'KOK', '0998887777', 'dara@gmail.com', 1300, '#233 st 122 PP...', 'Battam Bong', 'Cambodia', '2023-07-12 15:08:35'),
(2, 'Chana', 'Chan', '098777665', 'borachan@gmail.com', 800, '#233 st 122 PP...', 'Battam Bong', 'Cambodia', '2023-07-12 15:10:08'),
(3, 'Join', 'Chan1', '098777665', 'borachan1@gmail.com', 500, '#233 st 122 PP...', 'Battam Bong', 'Cambodia', '2023-07-12 15:15:18'),
(4, 'Bora22', 'Chan2', '098777665', 'borachan2@gmail.com', 400, '#233 st 122 PP...', 'PP', 'Cambodia', '2023-07-12 15:15:18'),
(5, 'Bora3', 'Chan3', '098777665', 'borachan3@gmail.com', 200, '#233 st 122 PP...', 'PP', 'Cambodia', '2023-07-12 15:15:18'),
(6, 'Bora2', 'Chan', '098777665', 'borachan@gmail.com', 500, '#233 st 122 PP...', 'Battam Bong', 'Cambodia', '2023-07-12 15:15:18'),
(7, 'Sona', 'Chan', '098777665', 'borachan@gmail.com', 700, '#233 st 122 PP...', 'KC', 'Cambodia', '2023-07-12 15:15:18'),
(8, 'Solo', 'Chan', '098777665', 'borachan@gmail.com', 800, '#233 st 122 PP...', 'Battam Bong', 'Cambodia', '2023-07-12 15:15:18'),
(9, 'Bora12', 'Chan', '098777665', 'borachan@gmail.com', 90, '#233 st 122 PP...', 'Battam Bong', 'Cambodia', '2023-07-12 15:15:18'),
(10, 'Bora13', 'Chan', '098777665', 'borachan@gmail.com', 209, '33 st 122 PP...', 'Battam Bong', 'Cambodia', '2023-07-12 15:15:18'),
(12, 'Som', 'Tona', '0998885566', 'tona@gmail.com', 1000, '#222 st....', 'BB', 'Cambodia', '2023-07-18 14:57:25'),
(15, 'Chan', 'Boran', '0998885566', 'boran@gmail.com', 1000, '#222 st....', 'BB', 'Cambodia', '2023-07-19 15:05:57'),
(16, 'Chan', 'Boran', '0998885566', 'boran@gmail.com', 1000, '#222 st....', 'BB', 'Cambodia', '2023-07-20 14:40:13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
