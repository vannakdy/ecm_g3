-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:5306:5306
-- Generation Time: Sep 06, 2023 at 04:51 PM
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
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(6) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
(23, 'Food Tes', 'Food Des Tes', NULL, 1, '2023-08-31 14:55:37'),
(24, 'Test', 'test', NULL, 1, '2023-08-31 14:57:31');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `firstname` varchar(120) NOT NULL,
  `lastname` varchar(120) NOT NULL,
  `gender` tinyint(1) NOT NULL DEFAULT 1,
  `username` varchar(120) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `role_id`, `firstname`, `lastname`, `gender`, `username`, `password`, `is_active`, `create_at`) VALUES
(1, 1, 'Mr', 'Bora', 0, '0966689955', '$2b$10$qOYgndhOOruExMY2tw5Xa.vr99ta1tKVklnLdrSfLvJJw6dP6VJou', 1, '2023-08-14 14:39:29'),
(2, 4, 'Mr', 'Join', 1, '0966689956', '$2b$10$qOYgndhOOruExMY2tw5Xa.vr99ta1tKVklnLdrSfLvJJw6dP6VJou', 0, '2023-08-14 14:44:18'),
(14, 0, 'Po', 'Boren', 1, '01299990000', '$2b$10$kEXDEEE8C4Kfh4ySO1ZjBetuLnNqElmL6ugYmDUoL412P0N8Aa...', 1, '2023-08-29 14:24:34'),
(15, 0, 'Po', 'Boren', 1, '01299990001', '$2b$10$vFTeSREN0oxXv0aT602EgO5b/2mAG2BprYRGQB.vm8RIzc.GI.SOW', 1, '2023-08-29 14:24:47'),
(16, 0, 'Po', 'Boren', 1, '01299990002', '$2b$10$6iWj5/kSRj0dkGAtNsV9P.leBS.X6hLOdBq3rnj8BrOH.ov07hrJm', 1, '2023-08-29 14:24:53'),
(17, 0, 'Po', 'Boren', 1, '01299990003', '$2b$10$BLBonyvSZgMZRQe.KEjte.6byKePsQXuJr8BPTRe.9WX6ADqgHvN.', 1, '2023-08-29 14:26:19'),
(18, 0, 'Po', 'Boren', 1, '01299990004', '$2b$10$moXvY0DBZ6Nr.UsIZg5UU.F6he1cLJ4RB.hLcWWJIVmTvdU0wxRO.', 1, '2023-08-29 14:42:41'),
(19, 0, 'Po', 'Boren', 1, '01299990005', '$2b$10$EHayuJL.SNAhWZF2yB4m1.uIBVcu6fsznrpXPKbkhXWCvNxGTIf4u', 1, '2023-08-29 14:46:52');

-- --------------------------------------------------------

--
-- Table structure for table `customer_address`
--

CREATE TABLE `customer_address` (
  `customer_address_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `province_id` int(11) NOT NULL,
  `firstname` varchar(120) NOT NULL,
  `lastname` varchar(120) NOT NULL,
  `tel` varchar(18) NOT NULL,
  `address_des` text NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `customer_address`
--

INSERT INTO `customer_address` (`customer_address_id`, `customer_id`, `province_id`, `firstname`, `lastname`, `tel`, `address_des`, `create_at`) VALUES
(1, 1, 1, 'So', 'Bona', '0966689955', '#233, st 333, PP....', '2023-08-14 14:39:29'),
(2, 2, 2, 'Sok', 'Join', '0966689956', '#22113, st 33, PP....', '2023-08-14 14:44:18'),
(4, 1, 1, 'Sok', 'BOra', '0968888889', '#123. St 4444, PP...(Work place)', '2023-08-14 15:23:43'),
(7, 1, 1, 'Ly', 'Lina', '012446689', '#22113, st 33, PP....', '2023-08-16 13:03:52'),
(14, 14, 1, 'Po', 'Boren', '01299990000', '#123 , st34, ...', '2023-08-29 14:24:34'),
(15, 15, 1, 'Po', 'Boren', '01299990001', '#123 , st34, ...', '2023-08-29 14:24:47'),
(16, 16, 1, 'Po', 'Boren', '01299990002', '#123 , st34, ...', '2023-08-29 14:24:53'),
(17, 17, 1, 'Po', 'Boren', '01299990003', '#123 , st34, ...', '2023-08-29 14:26:19'),
(18, 18, 1, 'Po', 'Boren', '01299990004', '#123 , st34, ...', '2023-08-29 14:42:41'),
(19, 19, 1, 'Po', 'Boren', '01299990005', '#123 , st34, ...', '2023-08-29 14:46:52');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL,
  `firstname` varchar(120) NOT NULL,
  `lastname` varchar(120) NOT NULL,
  `tel` varchar(16) NOT NULL,
  `email` varchar(120) DEFAULT NULL,
  `base_salary` decimal(6,0) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `province` varchar(120) DEFAULT NULL,
  `country` varchar(120) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT current_timestamp(),
  `password` varchar(255) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employee_id`, `firstname`, `lastname`, `tel`, `email`, `base_salary`, `address`, `province`, `country`, `create_at`, `password`, `role_id`) VALUES
(1, 'Mr', 'Admin', '0998887777', 'dara@gmail.com', 1300, '#233 st 122 PP...', 'Battam Bong', 'Cambodia', '2023-07-12 15:08:35', '$2b$10$khr5aemSk94M4mXV.9/1/e1E/A7FFPKuND23QZ3ocqBMQFOtKqmWa', 1),
(2, 'Chana', 'Chan', '098777665', 'borachan@gmail.com', 800, '#233 st 122 PP...', 'Battam Bong', 'Cambodia', '2023-07-12 15:10:08', NULL, NULL),
(3, 'Join', 'Chan1', '098777665', 'borachan1@gmail.com', 500, '#233 st 122 PP...', 'Battam Bong', 'Cambodia', '2023-07-12 15:15:18', NULL, NULL),
(4, 'Bora22', 'Chan2', '098777665', 'borachan2@gmail.com', 400, '#233 st 122 PP...', 'PP', 'Cambodia', '2023-07-12 15:15:18', NULL, NULL),
(5, 'Bora3', 'Chan3', '098777665', 'borachan3@gmail.com', 200, '#233 st 122 PP...', 'PP', 'Cambodia', '2023-07-12 15:15:18', NULL, NULL),
(6, 'Bora2', 'Chan', '098777665', 'borachan@gmail.com', 500, '#233 st 122 PP...', 'Battam Bong', 'Cambodia', '2023-07-12 15:15:18', NULL, NULL),
(7, 'Sona', 'Chan', '098777665', 'borachan@gmail.com', 700, '#233 st 122 PP...', 'KC', 'Cambodia', '2023-07-12 15:15:18', NULL, NULL),
(8, 'Solo', 'Chan', '098777665', 'borachan@gmail.com', 800, '#233 st 122 PP...', 'Battam Bong', 'Cambodia', '2023-07-12 15:15:18', NULL, NULL),
(9, 'Bora12', 'Chan', '098777665', 'borachan@gmail.com', 90, '#233 st 122 PP...', 'Battam Bong', 'Cambodia', '2023-07-12 15:15:18', NULL, NULL),
(10, 'Bora13', 'Chan', '098777665', 'borachan@gmail.com', 209, '33 st 122 PP...', 'Battam Bong', 'Cambodia', '2023-07-12 15:15:18', NULL, NULL),
(12, 'Som', 'Tona', '0998885566', 'tona@gmail.com', 1000, '#222 st....', 'BB', 'Cambodia', '2023-07-18 14:57:25', NULL, NULL),
(15, 'Chan', 'Boran', '0998885566', 'boran@gmail.com', 1000, '#222 st....', 'BB', 'Cambodia', '2023-07-19 15:05:57', NULL, NULL),
(16, 'Chan', 'Boran', '0998887778', 'boran@gmail.com', 1000, '#222 st....', 'BB', 'Cambodia', '2023-07-20 14:40:13', '$2b$10$khr5aemSk94M4mXV.9/1/e1E/A7FFPKuND23QZ3ocqBMQFOtKqmWa', 4);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_status_id` int(11) NOT NULL,
  `payement_methode_id` int(11) NOT NULL,
  `invoice_no` varchar(120) NOT NULL,
  `order_total` decimal(6,0) NOT NULL,
  `comment` text DEFAULT NULL,
  `firstname` varchar(120) NOT NULL,
  `lastname` varchar(120) NOT NULL,
  `telelphone` varchar(18) NOT NULL,
  `address_des` text NOT NULL,
  `status` tinyint(1) DEFAULT 1,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`order_id`, `customer_id`, `order_status_id`, `payement_methode_id`, `invoice_no`, `order_total`, `comment`, `firstname`, `lastname`, `telelphone`, `address_des`, `status`, `create_at`) VALUES
(4, 1, 1, 1, 'INV0001', 3300, '', 'So', 'Bona', '0966689955', '#233, st 333, PP....', 1, '2023-08-22 15:17:53'),
(5, 2, 1, 1, 'INV0005', 1600, '', 'Sok', 'Join', '0966689956', '#22113, st 33, PP....', 1, '2023-08-22 15:24:10'),
(6, 1, 1, 1, 'INV0006', 3400, '', 'So', 'Bona', '0966689955', '#233, st 333, PP....', 1, '2023-08-22 15:26:44');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `order_detail_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(6,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`order_detail_id`, `order_id`, `product_id`, `quantity`, `price`) VALUES
(1, 4, 1, 1, 1600),
(2, 4, 2, 1, 1700),
(3, 5, 1, 1, 1600),
(4, 6, 2, 2, 1700);

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE `order_status` (
  `order_status_id` int(11) NOT NULL,
  `name` varchar(120) NOT NULL,
  `message` text NOT NULL,
  `sort_order` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `order_status`
--

INSERT INTO `order_status` (`order_status_id`, `name`, `message`, `sort_order`) VALUES
(1, 'Pending', ' Your order has been placed successfully!.', 1),
(2, 'Packed', 'Your order has been packed.', 2),
(3, 'Shipped', 'Your order has been shipped!', 3),
(4, 'Delivered', 'Your order is complete.', 4),
(5, 'Canceled', 'order has been canceled.', 5),
(6, 'Store pick up', 'Your order is ready for store pickup!', 6),
(7, 'Phone denied', 'Denied Phone denied.', 7),
(8, 'Cancel', 'Your  has been Canceled.', 8);

-- --------------------------------------------------------

--
-- Table structure for table `payement_methode`
--

CREATE TABLE `payement_methode` (
  `payement_methode_id` int(11) NOT NULL,
  `name` varchar(120) NOT NULL,
  `code` varchar(120) NOT NULL,
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `payement_methode`
--

INSERT INTO `payement_methode` (`payement_methode_id`, `name`, `code`, `is_active`) VALUES
(1, 'Cash On Delivery', 'cod', 1),
(2, 'ABA Bank', 'aba', 1),
(3, 'ACLEDA Bank', 'ac', 1),
(4, 'Wing', 'wing', 1),
(5, 'Chip Mong', 'chm', 1),
(6, 'True Money ', 'trm', 1);

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

CREATE TABLE `permission` (
  `permission_id` int(11) NOT NULL,
  `name` varchar(120) NOT NULL,
  `code` varchar(120) NOT NULL,
  `group` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `permission`
--

INSERT INTO `permission` (`permission_id`, `name`, `code`, `group`) VALUES
(1, 'Read', 'product.Read', 'product'),
(2, 'Create', 'product.Create', 'product'),
(3, 'Update', 'product.Update', 'product'),
(4, 'Delete', 'product.Delete', 'product'),
(5, 'Read', 'order.Read', 'order'),
(6, 'Create', 'order.Create', 'order'),
(7, 'Update', 'order.Update', 'order'),
(8, 'Delete', 'order.Delete', 'order'),
(9, 'Read', 'customer.Read', 'customer'),
(10, 'Create', 'customer.Create', 'customer'),
(11, 'Update', 'customer.Update', 'customer'),
(12, 'Delete', 'customer.Delete', 'customer'),
(13, 'Read', 'category.Read', 'category'),
(14, 'Create', 'category.Create', 'category'),
(15, 'Update', 'category.Update', 'category'),
(16, 'Delete', 'category.Delete', 'category');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `barcode` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `quantity` int(6) NOT NULL,
  `price` decimal(6,0) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `create_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `category_id`, `barcode`, `name`, `quantity`, `price`, `image`, `description`, `is_active`, `create_at`, `create_by`) VALUES
(1, 1, 'P001', 'Macbook Pro 2013', 3, 1600, '', 'RAM 8GB, SSD215, 13Inch', 1, '2023-08-22 14:20:29', NULL),
(2, 1, 'P002', 'Macbook Pro 2014', 2, 1700, '', 'RAM 8GB, SSD215, 13Inch', 1, '2023-08-22 14:21:07', NULL),
(3, 1, 'P003', 'Macbook Pro 2015', 5, 2700, '', 'RAM 16GB, SSD215, 13Inch', 0, '2023-08-22 14:21:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_image`
--

CREATE TABLE `product_image` (
  `product_image_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `role_id` int(11) NOT NULL,
  `name` varchar(120) NOT NULL,
  `code` varchar(120) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`role_id`, `name`, `code`, `create_at`) VALUES
(1, 'Admin', 'amdin', '2023-08-24 14:59:17'),
(2, 'Manager', 'manger', '2023-08-24 14:59:17'),
(3, 'Accountant', 'accountant', '2023-08-24 14:59:17'),
(4, 'Online Staff', 'online_staff', '2023-08-24 14:59:17'),
(6, 'Customer', 'customer', '2023-08-28 14:01:31');

-- --------------------------------------------------------

--
-- Table structure for table `role_permission`
--

CREATE TABLE `role_permission` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `role_permission`
--

INSERT INTO `role_permission` (`role_id`, `permission_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(4, 1),
(4, 5),
(4, 9),
(4, 13),
(4, 14);

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `wishlist_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `customer_address`
--
ALTER TABLE `customer_address`
  ADD PRIMARY KEY (`customer_address_id`),
  ADD KEY `fk_customer` (`customer_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`order_detail_id`);

--
-- Indexes for table `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`order_status_id`);

--
-- Indexes for table `payement_methode`
--
ALTER TABLE `payement_methode`
  ADD PRIMARY KEY (`payement_methode_id`);

--
-- Indexes for table `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`permission_id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_image`
--
ALTER TABLE `product_image`
  ADD PRIMARY KEY (`product_image_id`);

--
-- Indexes for table `province`
--
ALTER TABLE `province`
  ADD PRIMARY KEY (`province_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `role_permission`
--
ALTER TABLE `role_permission`
  ADD PRIMARY KEY (`role_id`,`permission_id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`wishlist_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `customer_address`
--
ALTER TABLE `customer_address`
  MODIFY `customer_address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `order_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order_status`
--
ALTER TABLE `order_status`
  MODIFY `order_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `payement_methode`
--
ALTER TABLE `payement_methode`
  MODIFY `payement_methode_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `permission`
--
ALTER TABLE `permission`
  MODIFY `permission_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product_image`
--
ALTER TABLE `product_image`
  MODIFY `product_image_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `province`
--
ALTER TABLE `province`
  MODIFY `province_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `wishlist_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer_address`
--
ALTER TABLE `customer_address`
  ADD CONSTRAINT `fk_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
