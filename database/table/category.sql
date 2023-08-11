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
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `name` varchar(120) NOT NULL,
  `description` text DEFAULT NULL,
  `parent_id` int(11) DEFAULT 0,
  `status` tinyint(4) DEFAULT 1,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `name`, `description`, `parent_id`, `status`, `create_at`) VALUES
(1, 'Macbook', 'Apple product', NULL, 1, '2023-07-25 14:30:24'),
(2, 'Asus ssss', 'Asus product ssss', NULL, 1, '2023-07-25 14:31:35'),
(3, 'HPs', 'HP products', NULL, 0, '2023-07-25 14:39:50'),
(4, 'Lenevo', 'Lenevo product', NULL, 1, '2023-07-25 14:40:02'),
(12, 'Test2', 'Test2 product', NULL, 1, '2023-07-27 15:18:02'),
(13, 'Test2', 'Test2 product', NULL, 1, '2023-07-27 15:18:04'),
(16, 'Test3', 'Desc Test3', NULL, 1, '2023-07-31 14:56:00'),
(17, 'Test4 updated', 'Dest Test4 updated', NULL, 1, '2023-07-31 14:57:57'),
(19, 'AAA', 'Dest AA', NULL, 0, '2023-08-01 15:16:23'),
(21, 'aaa', 'aaa', NULL, 0, '2023-08-02 15:06:07');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
