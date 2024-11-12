-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 17, 2024 at 10:20 PM
-- Server version: 10.6.17-MariaDB-cll-lve
-- PHP Version: 8.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `happyhours_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `role_id` int(50) NOT NULL,
  `remember_token` varchar(200) NOT NULL,
  `email_verified_at` varchar(200) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `role_id`, `remember_token`, `email_verified_at`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', '$2y$10$pupWAXOxsbgWXXKaVZD01.guFaME9w3fBnMYe72e71E1C/gOtTaJm', 1, '', '', '2021-08-26 18:11:31', '2021-08-26 18:11:31');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(20) UNSIGNED NOT NULL,
  `categoryName` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `categoryName`, `created_at`, `updated_at`) VALUES
(3, 'Karaoke', '2022-07-08 15:10:15', '2022-08-02 11:16:24'),
(4, 'Dancing', '2022-07-08 16:59:01', '2022-08-02 11:16:32'),
(5, 'Brunch', '2022-07-10 00:23:27', '2022-08-02 11:16:41'),
(6, 'Lunch', '2022-07-22 01:36:58', '2022-08-02 11:16:47'),
(7, 'Dinner', '2022-08-02 18:15:43', '2022-08-02 11:16:54'),
(8, 'Pool Table', '2022-08-02 18:17:13', '2022-08-12 08:57:54'),
(9, 'Sports Tv', '2022-08-02 18:17:26', '2022-08-12 08:58:05'),
(10, 'Board Games', '2022-08-02 18:17:53', '2022-08-12 08:58:10'),
(12, 'LGBT', '2022-08-02 18:18:11', '2022-08-12 08:58:21'),
(13, 'Dog Friendly', '2022-08-02 18:18:25', '2022-08-12 08:58:34'),
(19, 'Live Entertainment', '2022-08-04 20:46:37', '2022-08-12 08:59:30'),
(20, 'Dj', '2022-08-12 15:59:43', '2022-08-12 15:59:43'),
(21, '420 Smoke Shops', '2022-08-12 16:00:17', '2022-08-12 16:00:17'),
(32, 'Happy Hour', '2022-11-25 17:28:58', '2022-11-25 17:28:58'),
(33, '420 Lounge', '2023-01-04 07:18:28', '2023-01-04 07:18:28'),
(36, 'Sports Bar', '2023-01-04 07:21:44', '2023-01-04 07:21:44'),
(37, 'Jukebox Bar', '2023-08-31 00:11:41', '2023-08-31 00:11:41');

-- --------------------------------------------------------

--
-- Table structure for table `favourite`
--

CREATE TABLE `favourite` (
  `id` int(11) NOT NULL,
  `placeId` int(11) UNSIGNED NOT NULL,
  `userId` int(11) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `favourite`
--

INSERT INTO `favourite` (`id`, `placeId`, `userId`, `created_at`, `updated_at`) VALUES
(6, 4, 185, '2023-01-18 12:53:34', '2023-01-18 12:53:34'),
(7, 4, 120, '2023-01-19 00:20:00', '2023-01-19 00:20:00'),
(10, 2, 174, '2023-01-19 14:02:34', '2023-01-19 14:02:34'),
(11, 7, 174, '2023-01-19 15:00:38', '2023-01-19 15:00:38'),
(13, 7, 120, '2023-01-19 22:18:52', '2023-01-19 22:18:52'),
(14, 1, 122, '2023-01-19 23:14:45', '2023-01-19 23:14:45'),
(15, 6, 120, '2023-01-20 01:28:53', '2023-01-20 01:28:53'),
(17, 2, 193, '2023-01-25 10:32:33', '2023-01-25 10:32:33'),
(18, 5, 122, '2023-01-25 10:53:46', '2023-01-25 10:53:46'),
(22, 4, 131, '2023-01-25 14:36:10', '2023-01-25 14:36:10'),
(24, 1, 120, '2023-01-25 15:49:50', '2023-01-25 15:49:50'),
(29, 11, 142, '2023-01-25 19:33:54', '2023-01-25 19:33:54'),
(30, 1, 195, '2023-01-27 18:31:29', '2023-01-27 18:31:29'),
(31, 1, 10, '2023-01-30 00:09:31', '2023-01-30 00:09:31'),
(32, 6, 185, '2023-01-31 11:37:08', '2023-01-31 11:37:08'),
(35, 4, 202, '2023-02-14 11:32:42', '2023-02-14 11:32:42'),
(36, 4, 218, '2023-03-16 15:41:41', '2023-03-16 15:41:41'),
(37, 4, 2, '2023-04-08 15:00:15', '2023-04-08 15:00:15'),
(38, 6, 2, '2023-04-08 15:00:52', '2023-04-08 15:00:52'),
(39, 1, 230, '2023-05-09 16:16:16', '2023-05-09 16:16:16'),
(40, 10, 230, '2023-05-09 16:16:49', '2023-05-09 16:16:49'),
(41, 5, 230, '2023-05-09 16:18:25', '2023-05-09 16:18:25'),
(42, 4, 208, '2023-05-12 16:16:10', '2023-05-12 16:16:10'),
(43, 18, 208, '2023-05-12 16:57:21', '2023-05-12 16:57:21'),
(44, 4, 238, '2023-05-16 01:40:22', '2023-05-16 01:40:22'),
(45, 4, 234, '2023-05-17 16:10:28', '2023-05-17 16:10:28'),
(46, 7, 234, '2023-05-17 23:32:55', '2023-05-17 23:32:55'),
(48, 7, 239, '2023-05-18 12:45:45', '2023-05-18 12:45:45'),
(49, 10, 239, '2023-05-18 12:46:36', '2023-05-18 12:46:36'),
(52, 6, 208, '2023-05-19 16:13:06', '2023-05-19 16:13:06'),
(53, 6, 234, '2023-05-20 12:03:53', '2023-05-20 12:03:53'),
(54, 7, 191, '2023-05-22 11:28:41', '2023-05-22 11:28:41'),
(55, 1, 208, '2023-05-22 14:23:20', '2023-05-22 14:23:20'),
(56, 7, 208, '2023-05-22 14:24:10', '2023-05-22 14:24:10'),
(58, 15, 191, '2023-05-22 23:30:14', '2023-05-22 23:30:14'),
(59, 15, 208, '2023-05-22 23:35:07', '2023-05-22 23:35:07'),
(60, 7, 274, '2023-08-08 12:26:14', '2023-08-08 12:26:14'),
(61, 6, 245, '2023-08-08 17:47:45', '2023-08-08 17:47:45'),
(62, 6, 191, '2023-08-14 12:07:41', '2023-08-14 12:07:41'),
(63, 16, 256, '2024-02-20 12:42:38', '2024-02-20 12:42:38');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `place_id` int(11) UNSIGNED NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `place_id`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, 'http://beautyliciousnj.com/happyhours/public/Place_uploads/16732819210.jpg', '2023-01-09 23:32:01', '2023-01-09 23:32:01'),
(2, 1, 'http://beautyliciousnj.com/happyhours/public/Place_uploads/16732819211.jpg', '2023-01-09 23:32:01', '2023-01-09 23:32:01'),
(3, 1, 'http://beautyliciousnj.com/happyhours/public/Place_uploads/16732819212.jpg', '2023-01-09 23:32:01', '2023-01-09 23:32:01'),
(4, 1, 'http://beautyliciousnj.com/happyhours/public/Place_uploads/16732819213.jpg', '2023-01-09 23:32:01', '2023-01-09 23:32:01'),
(5, 2, 'http://beautyliciousnj.com/happyhours/public/Place_uploads/16732833040.jpg', '2023-01-09 23:55:04', '2023-01-09 23:55:04'),
(7, 2, 'http://beautyliciousnj.com/happyhours/public/Place_uploads/16732833042.jpg', '2023-01-09 23:55:04', '2023-01-09 23:55:04'),
(9, 2, 'http://beautyliciousnj.com/happyhours/public/Place_uploads/16732833520.jpg', '2023-01-09 23:55:52', '2023-01-09 23:55:52'),
(10, 2, 'http://beautyliciousnj.com/happyhours/public/Place_uploads/16732833890.jpg', '2023-01-09 23:56:29', '2023-01-09 23:56:29'),
(11, 3, 'http://beautyliciousnj.com/happyhours/public/Place_uploads/16732840500.jpg', '2023-01-10 00:07:30', '2023-01-10 00:07:30'),
(12, 3, 'http://beautyliciousnj.com/happyhours/public/Place_uploads/16732840501.jpg', '2023-01-10 00:07:30', '2023-01-10 00:07:30'),
(13, 3, 'http://beautyliciousnj.com/happyhours/public/Place_uploads/16732840502.jpg', '2023-01-10 00:07:30', '2023-01-10 00:07:30'),
(14, 3, 'http://beautyliciousnj.com/happyhours/public/Place_uploads/16732840503.jpg', '2023-01-10 00:07:30', '2023-01-10 00:07:30'),
(15, 4, 'http://beautyliciousnj.com/happyhours/public/Place_uploads/16732855580.jpg', '2023-01-10 00:32:38', '2023-01-10 00:32:38'),
(16, 4, 'http://beautyliciousnj.com/happyhours/public/Place_uploads/16732855581.jpg', '2023-01-10 00:32:38', '2023-01-10 00:32:38'),
(17, 4, 'http://beautyliciousnj.com/happyhours/public/Place_uploads/16732855582.jpg', '2023-01-10 00:32:38', '2023-01-10 00:32:38'),
(18, 5, 'http://beautyliciousnj.com/happyhours/public/Place_uploads/16734220200.jpg', '2023-01-11 14:27:00', '2023-01-11 14:27:00'),
(20, 5, 'http://beautyliciousnj.com/happyhours/public/Place_uploads/16734220202.jpg', '2023-01-11 14:27:00', '2023-01-11 14:27:00'),
(21, 5, 'http://beautyliciousnj.com/happyhours/public/Place_uploads/16734220203.jpg', '2023-01-11 14:27:00', '2023-01-11 14:27:00'),
(22, 5, 'http://beautyliciousnj.com/happyhours/public/Place_uploads/16734225020.jpg', '2023-01-11 14:35:02', '2023-01-11 14:35:02'),
(23, 6, 'http://beautyliciousnj.com/happyhours/public/Place_uploads/16740284220.jpg', '2023-01-18 14:53:42', '2023-01-18 14:53:42'),
(24, 6, 'http://beautyliciousnj.com/happyhours/public/Place_uploads/16740285270.jpg', '2023-01-18 14:55:27', '2023-01-18 14:55:27'),
(25, 6, 'http://beautyliciousnj.com/happyhours/public/Place_uploads/16740296740.jpg', '2023-01-18 15:14:34', '2023-01-18 15:14:34'),
(29, 11, 'http://beautyliciousnj.com/happyhours/public/Place_uploads/16758607650.png', '2023-02-08 19:52:45', '2023-02-08 19:52:45'),
(30, 15, 'http://beautyliciousnj.com/happyhours/public/Place_uploads/16795474990.jpg', '2023-03-23 11:58:19', '2023-03-23 11:58:19'),
(31, 18, 'http://beautyliciousnj.com/happyhours/public/Place_uploads/16838853330.jpg', '2023-05-12 16:55:33', '2023-05-12 16:55:33'),
(32, 7, 'http://beautyliciousnj.com/happyhours/public/Place_uploads/16855349260.jpg', '2023-05-31 19:08:46', '2023-05-31 19:08:46'),
(33, 7, 'http://beautyliciousnj.com/happyhours/public/Place_uploads/16855350170.jpg', '2023-05-31 19:10:17', '2023-05-31 19:10:17');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2013_05_01_095936_create_roles_table', 1),
(2, '2014_10_12_000000_create_users_table', 1),
(3, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(13, '2014_10_12_100000_create_password_resets_table', 2),
(14, '2019_12_14_000001_create_personal_access_tokens_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` int(11) NOT NULL,
  `placeId` int(11) UNSIGNED NOT NULL,
  `heading` varchar(200) NOT NULL,
  `message` varchar(2000) NOT NULL,
  `image_path` varchar(1000) DEFAULT NULL,
  `time` time(6) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`id`, `placeId`, `heading`, `message`, `image_path`, `time`, `created_at`, `updated_at`) VALUES
(13, 7, 'Testing add functionality', 'ss', 'http://beautyliciousnj.com/happyhours/public/Offers/1684403816.jpg', '10:36:20.000000', '2023-05-18 17:36:20', '2023-05-18 17:36:20'),
(17, 15, 'Happy Hour', 'Daily\r\nAll day and night', 'http://beautyliciousnj.com/happyhours/public/Offers/1679547690.png', '16:31:00.000000', '2023-05-22 23:31:00', '2023-05-22 23:31:00'),
(18, 15, 'Live Country Band', 'Friday & Saturday 8pm-12am', 'http://beautyliciousnj.com/happyhours/public/Offers/1679547590.png', '16:31:03.000000', '2023-05-22 23:31:03', '2023-05-22 23:31:03'),
(19, 15, 'TEST', 'FREE DRINK', 'http://beautyliciousnj.com/happyhours/public/Offers/1684773769.jpg', '16:42:57.000000', '2023-05-22 23:42:57', '2023-05-22 23:42:57');

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `id` int(201) NOT NULL,
  `place_id` int(11) UNSIGNED NOT NULL,
  `Heading` varchar(201) NOT NULL,
  `valid_upto` varchar(201) DEFAULT NULL,
  `description` mediumtext NOT NULL,
  `Image` varchar(201) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `is_notified` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `offers`
--

INSERT INTO `offers` (`id`, `place_id`, `Heading`, `valid_upto`, `description`, `Image`, `status`, `is_notified`, `created_at`, `updated_at`) VALUES
(1, 1, 'Regular deals', NULL, 'Select any 2 Medium Pizzas Worth $79 @28', 'http://beautyliciousnj.com/happyhours/public/Offers/1673282226.jpg', 1, 0, '2023-01-09 23:37:06', '2023-01-09 23:37:06'),
(2, 5, 'Happy hour', NULL, 'happy hours from 7pm till 9pm', 'http://beautyliciousnj.com/happyhours/public/Offers/1673531211.jpg', 1, 0, '2023-01-12 20:46:51', '2023-01-25 22:24:21'),
(3, 6, 'Happy Hour', NULL, 'Daily 3:00pm-6:00pm', 'http://beautyliciousnj.com/happyhours/public/Offers/1674027918.jpg', 1, 0, '2023-01-18 14:45:18', '2023-01-18 14:45:18'),
(4, 6, 'Live Entertainment', NULL, 'Fri. & Sat. 8:00pm-12:00am', 'http://beautyliciousnj.com/happyhours/public/Offers/1674028743.jpg', 1, 0, '2023-01-18 14:59:03', '2023-01-18 14:59:03'),
(5, 6, 'Karaoke Thursday', NULL, 'Come in and sing the night away 8-10pm', 'http://beautyliciousnj.com/happyhours/public/Offers/1674028869.jpg', 1, 0, '2023-01-18 15:01:09', '2023-01-18 15:01:09'),
(7, 6, 'Beer Pong Contest', NULL, 'Friday Jan. 20 at 8:00pm', 'http://beautyliciousnj.com/happyhours/public/Offers/1674030017.jpg', 1, 0, '2023-01-18 15:20:17', '2023-01-18 15:20:17'),
(9, 1, 'Happy hour', NULL, 'happy hour provides the perfect deals', 'http://beautyliciousnj.com/happyhours/public/Offers/1674145356.jpg', 1, 0, '2023-01-19 23:22:36', '2023-01-19 23:22:36'),
(10, 1, 'one on one', NULL, 'Select any 2 Regular Pizzas  @128', 'http://beautyliciousnj.com/happyhours/public/Offers/1674146816.jpg', 1, 0, '2023-01-19 23:46:56', '2023-01-19 23:47:08'),
(12, 15, 'Live Country Band', NULL, 'Friday & Saturday 8pm-12am', 'http://beautyliciousnj.com/happyhours/public/Offers/1679547590.png', 1, 1, '2023-03-23 11:59:50', '2023-05-22 23:31:03'),
(13, 15, 'Happy Hour', NULL, 'Daily\r\nAll day and night', 'http://beautyliciousnj.com/happyhours/public/Offers/1679547690.png', 1, 1, '2023-03-23 12:01:30', '2023-05-22 23:31:00'),
(16, 18, 'weekend offer 10%', NULL, 'its valid from only weekend', 'http://beautyliciousnj.com/happyhours/public/Offers/1683885274.png', 1, 0, '2023-05-12 16:54:34', '2023-05-12 16:54:34'),
(17, 7, 'Offer 1024', NULL, 'Best in business', 'http://beautyliciousnj.com/happyhours/public/Offers/1684341192.jpg', 1, 1, '2023-05-17 23:33:12', '2023-05-18 17:36:42'),
(18, 7, 'New Offer', NULL, 'Grab the best Deals', 'http://beautyliciousnj.com/happyhours/public/Offers/1684391011.jpg', 1, 1, '2023-05-18 13:23:31', '2023-05-18 17:36:37'),
(19, 7, 'Testing add functionality', NULL, 'ss', 'http://beautyliciousnj.com/happyhours/public/Offers/1684403816.jpg', 1, 1, '2023-05-18 16:56:56', '2023-05-18 17:36:20'),
(20, 7, 'Testing add functionality', NULL, 'sda', 'http://beautyliciousnj.com/happyhours/public/Offers/1684406519.png', 1, 1, '2023-05-18 17:41:59', '2023-05-18 17:42:03'),
(21, 15, 'TEST', NULL, 'FREE DRINK', 'http://beautyliciousnj.com/happyhours/public/Offers/1684773769.jpg', 1, 1, '2023-05-22 23:42:49', '2023-05-22 23:42:57');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\Listuser', 234, 'api-token', '1d1eddccc1c51c96478d2a4b5c696eb907c2bd8f3ddff374927db8192a12b62d', '[\"*\"]', NULL, '2023-05-14 11:23:37', '2023-05-14 11:23:37'),
(2, 'App\\Models\\Listuser', 234, 'api-token', 'cfe01d6e7e3035db6a185aa3fb19842b69a53625185eb2e56d128a24db144760', '[\"*\"]', '2023-05-22 14:25:43', '2023-05-14 11:25:05', '2023-05-22 14:25:43'),
(3, 'App\\Models\\Listuser', 234, 'api-token', '87ed2ed0c90ffdec6f31e8613b1f6e3d70fed77af773554dd78d23b7c7cdb96e', '[\"*\"]', NULL, '2023-05-14 18:08:57', '2023-05-14 18:08:57'),
(4, 'App\\Models\\Listuser', 235, 'api-token', '14f6b251f732719ff49395c570cd5788a2622d4bd37647bba58222e92547ebcd', '[\"*\"]', NULL, '2023-05-15 09:25:05', '2023-05-15 09:25:05'),
(5, 'App\\Models\\Listuser', 235, 'api-token', '315fe5666078f448e98cb3f628da61dfbfaa892e5ec144fcd623e0cb2c098c02', '[\"*\"]', NULL, '2023-05-15 09:25:08', '2023-05-15 09:25:08'),
(6, 'App\\Models\\Listuser', 235, 'api-token', 'cd7c94a48dfb4ab8e672d547a024c31015043129ec974a1b3c19de23fe17a34a', '[\"*\"]', NULL, '2023-05-15 09:25:11', '2023-05-15 09:25:11'),
(7, 'App\\Models\\Listuser', 235, 'api-token', 'eb05f24a6512c0b7e18269be452f7ae1538a54009fa5312653ce1ca70bef92ae', '[\"*\"]', NULL, '2023-05-15 09:26:55', '2023-05-15 09:26:55'),
(8, 'App\\Models\\Listuser', 235, 'api-token', 'b85e1e17371afec123cacef255cd785c1c7d2da4b07adbb988e0471cac143b3e', '[\"*\"]', NULL, '2023-05-15 09:26:56', '2023-05-15 09:26:56'),
(9, 'App\\Models\\Listuser', 234, 'api-token', 'fd364fe9028e7c019fe68bb2b7b35eff3ce932ec8b429b0587e9ebbdc9629b7d', '[\"*\"]', NULL, '2023-05-15 12:20:14', '2023-05-15 12:20:14'),
(10, 'App\\Models\\Listuser', 234, 'api-token', 'a4a056a01093600287a39d263f6f0372b64f2fa4559864167a7d34460c53a380', '[\"*\"]', NULL, '2023-05-15 14:00:56', '2023-05-15 14:00:56'),
(11, 'App\\Models\\Listuser', 234, 'api-token', '84b3347c00b878b1c4982142946ed61596e390a52353b62751dfbd0c0d108747', '[\"*\"]', NULL, '2023-05-15 17:02:01', '2023-05-15 17:02:01'),
(12, 'App\\Models\\Listuser', 234, 'api-token', 'ba5518cce7d86db579064ef8fc3e070177688720378ea1f153af61fca870369d', '[\"*\"]', NULL, '2023-05-15 17:02:53', '2023-05-15 17:02:53'),
(13, 'App\\Models\\Listuser', 236, 'api-token', '3a38e518dba27aa0458cc78a74f1ddd38a55dc8d3f57f97a64bc5e2c62e99f25', '[\"*\"]', NULL, '2023-05-15 17:16:56', '2023-05-15 17:16:56'),
(14, 'App\\Models\\Listuser', 236, 'api-token', 'f44e121bfafdd7b762b41ab3be1ec2010c1f9ebf35db3aab3c1ba94290ca1c2b', '[\"*\"]', NULL, '2023-05-15 17:17:04', '2023-05-15 17:17:04'),
(15, 'App\\Models\\Listuser', 236, 'api-token', 'e6a90e1813adce7330dd32461934075762eb49f9ea6734240074311e6819c9c3', '[\"*\"]', NULL, '2023-05-15 17:17:07', '2023-05-15 17:17:07'),
(16, 'App\\Models\\Listuser', 237, 'api-token', '92aeafb2e5f7058674b0cfa1404859843f74b15feaf2bad79ae3dc81cd0b49d3', '[\"*\"]', NULL, '2023-05-15 17:20:06', '2023-05-15 17:20:06'),
(17, 'App\\Models\\Listuser', 238, 'api-token', '36a027e93bae1d0c1c21b41cbf23cba75ca3572118f033c7a7e0f34e2e6b5bae', '[\"*\"]', NULL, '2023-05-16 01:02:33', '2023-05-16 01:02:33'),
(18, 'App\\Models\\Listuser', 238, 'api-token', 'b1d8b450adea49c9b919a659dae767a7437d2f2533837cdd28fb13b883e6c601', '[\"*\"]', NULL, '2023-05-16 01:05:35', '2023-05-16 01:05:35'),
(19, 'App\\Models\\Listuser', 238, 'api-token', 'bf9bd917d52a8a806b782477ecaf6c56186335230abbe8ae378b48833d5e4c88', '[\"*\"]', '2023-05-22 01:17:15', '2023-05-16 01:20:10', '2023-05-22 01:17:15'),
(20, 'App\\Models\\Listuser', 234, 'api-token', 'a7c007887fb6ec08765f7a5f334e5067acf68f63379cb31140397fc6addeb392', '[\"*\"]', NULL, '2023-05-17 11:49:24', '2023-05-17 11:49:24'),
(21, 'App\\Models\\Listuser', 234, 'api-token', '2a0b09fcf78ddfcbbf9a81cde5c9d79b2c04a74c7eef546ba067bba225236af7', '[\"*\"]', NULL, '2023-05-17 12:50:09', '2023-05-17 12:50:09'),
(22, 'App\\Models\\Listuser', 234, 'api-token', '3671a3d4d2e5908bf676b6674ad260a2a43834ff2b63d31287aa9cee2a161c13', '[\"*\"]', '2023-05-23 00:15:21', '2023-05-17 12:51:28', '2023-05-23 00:15:21'),
(23, 'App\\Models\\Listuser', 234, 'api-token', '9b7f3b9b745feb62dfc9305c5cc4019bc8993d3591d8caf6094b441046a4f6b8', '[\"*\"]', NULL, '2023-05-17 12:51:46', '2023-05-17 12:51:46'),
(24, 'App\\Models\\Listuser', 239, 'api-token', '95b5ac341f907cb6a150be3b1d95d115d3076bcd77dd46fba793147ccc225952', '[\"*\"]', NULL, '2023-05-17 12:53:36', '2023-05-17 12:53:36'),
(25, 'App\\Models\\Listuser', 234, 'api-token', 'e56b910949631d2bd8c9edac339ea9507a644156ca24172ee6856757b38af6a5', '[\"*\"]', '2023-05-17 16:36:40', '2023-05-17 15:23:21', '2023-05-17 16:36:40'),
(26, 'App\\Models\\Listuser', 239, 'api-token', 'e394fd769eaf02000c06636b57b4f93203b47389513d2f1ebe06819ade12853d', '[\"*\"]', '2023-05-17 16:49:37', '2023-05-17 16:37:09', '2023-05-17 16:49:37'),
(27, 'App\\Models\\Listuser', 234, 'api-token', '33e4fd8ea103202dde71abb1a13576a1279f278d35efe246728d6ef1ea79e0d9', '[\"*\"]', '2023-05-17 17:44:02', '2023-05-17 17:14:34', '2023-05-17 17:44:02'),
(28, 'App\\Models\\Listuser', 234, 'api-token', '19498b0bc365807a1846b91d8aa96964d9427a953d04bd2366d72ae94e86eae1', '[\"*\"]', NULL, '2023-05-17 22:52:13', '2023-05-17 22:52:13'),
(29, 'App\\Models\\Listuser', 234, 'api-token', '9a68874c7d6528266a1f4ef39dd37d2d7ec3fee0c5eb4412aa2dc9af6cb35d62', '[\"*\"]', NULL, '2023-05-17 23:30:03', '2023-05-17 23:30:03'),
(30, 'App\\Models\\Listuser', 234, 'api-token', 'c0619d19540fb662f28b48fb1f4090a92d4340e425ace9a062aec4663e90cd6d', '[\"*\"]', NULL, '2023-05-17 23:30:15', '2023-05-17 23:30:15'),
(31, 'App\\Models\\Listuser', 234, 'api-token', 'd72cf56df0c803d58b027bfb9391240d3ed0d07fbaf2e631165d2aca668f757a', '[\"*\"]', NULL, '2023-05-17 23:30:24', '2023-05-17 23:30:24'),
(32, 'App\\Models\\Listuser', 234, 'api-token', '54476e27cf2a061e1231369a6a46042da263d81e81bcb5bed2be1dfaef0f4192', '[\"*\"]', NULL, '2023-05-17 23:30:25', '2023-05-17 23:30:25'),
(33, 'App\\Models\\Listuser', 234, 'api-token', 'bbf6ce98d667d41f5096b4c84bd366aa452ceed75cf9c3cca295ea1272a3a075', '[\"*\"]', NULL, '2023-05-17 23:30:25', '2023-05-17 23:30:25'),
(34, 'App\\Models\\Listuser', 234, 'api-token', 'b7629706d732f2a9db5f04375a9562ac8f9e43884187da021a77d767267706c1', '[\"*\"]', NULL, '2023-05-17 23:30:25', '2023-05-17 23:30:25'),
(35, 'App\\Models\\Listuser', 234, 'api-token', 'b686d01bd1807851448e80d080f768a69ce5cb237853602b249c410b6c95086d', '[\"*\"]', NULL, '2023-05-17 23:30:25', '2023-05-17 23:30:25'),
(36, 'App\\Models\\Listuser', 234, 'api-token', '1c2fb262e11fed93d4d2b480060ccc7c3f965fbe003fca69ef5c8fe1a0162b37', '[\"*\"]', NULL, '2023-05-17 23:30:25', '2023-05-17 23:30:25'),
(37, 'App\\Models\\Listuser', 234, 'api-token', '941b0bd662936e02f1074c76c7e6b68b43bd19ea12e386cc5fed662e44e17b57', '[\"*\"]', NULL, '2023-05-17 23:30:26', '2023-05-17 23:30:26'),
(38, 'App\\Models\\Listuser', 234, 'api-token', '1f7b74c577f14bd27c48390a7085950eaa8d33b48870d94cf5c19355f5274a8b', '[\"*\"]', NULL, '2023-05-17 23:30:26', '2023-05-17 23:30:26'),
(39, 'App\\Models\\Listuser', 234, 'api-token', 'ea24cc2aa977cc1c97b116968a72ccfc9255fa03dfed3422d9a7edada6b57f2b', '[\"*\"]', NULL, '2023-05-17 23:30:26', '2023-05-17 23:30:26'),
(40, 'App\\Models\\Listuser', 234, 'api-token', '311ef40e0c661233748c7e24fcb0f90261a1c175e7ae42baf813cf838bea28bc', '[\"*\"]', NULL, '2023-05-17 23:30:27', '2023-05-17 23:30:27'),
(41, 'App\\Models\\Listuser', 234, 'api-token', 'ec26a62d3883d431a15164c30ab5112f7bd7a3d4b9481e2807ba2586b6fdd7b7', '[\"*\"]', NULL, '2023-05-17 23:30:27', '2023-05-17 23:30:27'),
(42, 'App\\Models\\Listuser', 234, 'api-token', '3b36948b1266f907fca79ab2e69ca21dc24a1f2d354fd9cbdda53462ea3f6864', '[\"*\"]', NULL, '2023-05-17 23:30:27', '2023-05-17 23:30:27'),
(43, 'App\\Models\\Listuser', 234, 'api-token', '03b8a1cbb84f53b225be05bad0e006dbe4abb55a00b2f12d3e76bb5887466daf', '[\"*\"]', NULL, '2023-05-17 23:30:27', '2023-05-17 23:30:27'),
(44, 'App\\Models\\Listuser', 234, 'api-token', 'd720e346869057e53edf38a15d701edce0f45c4f953ff75eee35c6b3728fb7ea', '[\"*\"]', NULL, '2023-05-17 23:30:28', '2023-05-17 23:30:28'),
(45, 'App\\Models\\Listuser', 234, 'api-token', 'e3759427ec53be93f57aa1cb4f8fa4f848c495c0169582b1d93e1846dbe3f161', '[\"*\"]', NULL, '2023-05-17 23:30:28', '2023-05-17 23:30:28'),
(46, 'App\\Models\\Listuser', 234, 'api-token', 'd4518859e39230e6c81d1205dd9ea6227b181dfd57ee5a6d99b424f0dbd98af0', '[\"*\"]', NULL, '2023-05-17 23:30:28', '2023-05-17 23:30:28'),
(47, 'App\\Models\\Listuser', 234, 'api-token', '6342f31bacefbfb74b565f1c34e098d81d4d0029451eb718b6bfbec9a1c13d0f', '[\"*\"]', NULL, '2023-05-17 23:30:45', '2023-05-17 23:30:45'),
(48, 'App\\Models\\Listuser', 234, 'api-token', 'e77a0f14f6b800f7a40edfdad83861666023c39c41b1cef59dbd5f47342eccf6', '[\"*\"]', NULL, '2023-05-17 23:30:46', '2023-05-17 23:30:46'),
(49, 'App\\Models\\Listuser', 234, 'api-token', 'bc0c9ccb5b6f63915061f2dec18f57a98aed6a952e7e6e2544d29b992872cb04', '[\"*\"]', NULL, '2023-05-17 23:30:46', '2023-05-17 23:30:46'),
(50, 'App\\Models\\Listuser', 234, 'api-token', '91dce03362dcc2f8fd0dfe05ef7e17cc5e4fe75f8a9536756ca80dc15c10a6c6', '[\"*\"]', NULL, '2023-05-17 23:30:46', '2023-05-17 23:30:46'),
(51, 'App\\Models\\Listuser', 234, 'api-token', 'db87e37991fc7102bc14b266094fec425b013a8a7578b760f911577ec85a45dc', '[\"*\"]', NULL, '2023-05-17 23:30:46', '2023-05-17 23:30:46'),
(52, 'App\\Models\\Listuser', 234, 'api-token', '95ac033cb16f19546a06f00f6806adf3f5e46337cf2c320a83fc74604c292d2a', '[\"*\"]', NULL, '2023-05-17 23:30:46', '2023-05-17 23:30:46'),
(53, 'App\\Models\\Listuser', 234, 'api-token', '6d348f1e8dc54358f334754d0f13116e7fe6606a98db2b1a5fac95fc4d423c0e', '[\"*\"]', NULL, '2023-05-17 23:30:46', '2023-05-17 23:30:46'),
(54, 'App\\Models\\Listuser', 234, 'api-token', 'c01c44c6ac88143ddbc996ed729bc18389c06765a23a13d6ce2c3b1e750a2b2f', '[\"*\"]', '2023-05-21 21:39:22', '2023-05-17 23:32:25', '2023-05-21 21:39:22'),
(55, 'App\\Models\\Listuser', 239, 'api-token', '5d75b32deadbc256929212076e6c77dca5d76d9e86712fdb4e143d545d40d668', '[\"*\"]', '2023-05-20 01:33:49', '2023-05-18 12:45:09', '2023-05-20 01:33:49'),
(56, 'App\\Models\\Listuser', 191, 'api-token', 'db519b528a14bee429176ac39a4d04b175648c83a68e1a9537f56959079b1174', '[\"*\"]', '2023-05-18 18:36:40', '2023-05-18 16:52:41', '2023-05-18 18:36:40'),
(57, 'App\\Models\\Listuser', 191, 'api-token', 'b34d7ae8517335a5cb8c83c960bd85c4fb0771afbb3438a1bde584494385e65e', '[\"*\"]', '2023-05-18 21:40:12', '2023-05-18 18:39:09', '2023-05-18 21:40:12'),
(58, 'App\\Models\\Listuser', 191, 'api-token', 'fb2b077a4dd40214ce1f591dd5875e47f9a0c005c407a61b66b08dfa498dabe7', '[\"*\"]', '2023-05-19 10:49:16', '2023-05-18 22:40:47', '2023-05-19 10:49:16'),
(59, 'App\\Models\\Listuser', 240, 'api-token', '94fab6bc5ca280c99b7fe6e9bc84d52ee048de9a643ce8fe174a9920a62f1310', '[\"*\"]', NULL, '2023-05-18 23:38:09', '2023-05-18 23:38:09'),
(60, 'App\\Models\\Listuser', 240, 'api-token', '29688efe4a61ae62f216c1b534792bd7c4e63c80aafbdfce40ba196e1e254752', '[\"*\"]', NULL, '2023-05-18 23:38:12', '2023-05-18 23:38:12'),
(61, 'App\\Models\\Listuser', 240, 'api-token', '2c8625fee0e96528d46ca56a342ae650a521d139d1d28a290f69080266074d9e', '[\"*\"]', NULL, '2023-05-18 23:38:12', '2023-05-18 23:38:12'),
(62, 'App\\Models\\Listuser', 240, 'api-token', '532c62cae032834b4702f6986c64a169a7c94c940a82a8bd9decd913feea3028', '[\"*\"]', NULL, '2023-05-18 23:38:13', '2023-05-18 23:38:13'),
(63, 'App\\Models\\Listuser', 240, 'api-token', '2a55142f66bd67d12d42415fca1c010944cc1ed69627023626717c239710e2e6', '[\"*\"]', NULL, '2023-05-18 23:38:15', '2023-05-18 23:38:15'),
(64, 'App\\Models\\Listuser', 240, 'api-token', '67273987274f59b81468fbcf0d12eafcb02d6cf53d27ae2629cb48ac14352df7', '[\"*\"]', NULL, '2023-05-18 23:38:15', '2023-05-18 23:38:15'),
(65, 'App\\Models\\Listuser', 240, 'api-token', 'd4d0da3de3429891ef8c25c07e24ab19980267ef8eff91098b34283c9cd8fe90', '[\"*\"]', NULL, '2023-05-18 23:38:15', '2023-05-18 23:38:15'),
(66, 'App\\Models\\Listuser', 240, 'api-token', '4288e45fcd06332f01ddfe0344390b3e79a5637e303f5367d6a4aea0413d0d50', '[\"*\"]', NULL, '2023-05-18 23:38:16', '2023-05-18 23:38:16'),
(67, 'App\\Models\\Listuser', 240, 'api-token', '82602e0c6815bf281e16fc92d935c178c11ca4b0f518c035a5c861deeb848796', '[\"*\"]', NULL, '2023-05-18 23:38:16', '2023-05-18 23:38:16'),
(68, 'App\\Models\\Listuser', 240, 'api-token', 'a0951d5b0193eac85a5859903f04b22155ad71923fc25c5c0d0d19236630bbf5', '[\"*\"]', NULL, '2023-05-18 23:38:16', '2023-05-18 23:38:16'),
(69, 'App\\Models\\Listuser', 240, 'api-token', '0ff4798fd140bbbdb41c8740b5dc289f92dd9c2a9e24ca943a6bcd0e3b8ef91a', '[\"*\"]', NULL, '2023-05-18 23:38:16', '2023-05-18 23:38:16'),
(70, 'App\\Models\\Listuser', 240, 'api-token', '2214ff4fce74ae6ca4a9e69ee1ee91edf9d09dfc48b9488b3d3a117213ddcfee', '[\"*\"]', NULL, '2023-05-18 23:38:17', '2023-05-18 23:38:17'),
(71, 'App\\Models\\Listuser', 240, 'api-token', 'b90452ed52ca7e8af22cc29430558b4f5f35502944e8239b22e1926c6bf341f4', '[\"*\"]', NULL, '2023-05-18 23:38:17', '2023-05-18 23:38:17'),
(72, 'App\\Models\\Listuser', 240, 'api-token', '660925a38f51c9bbe91c51ffe60b524ac26f213d49341d52267692ca09894d55', '[\"*\"]', NULL, '2023-05-18 23:38:18', '2023-05-18 23:38:18'),
(73, 'App\\Models\\Listuser', 240, 'api-token', '63035fe9fc2c973e4198464d8db9580bed304fda04afb15cbbaa4710180ac30d', '[\"*\"]', NULL, '2023-05-18 23:38:18', '2023-05-18 23:38:18'),
(74, 'App\\Models\\Listuser', 240, 'api-token', '3d2ce7e0a790cb2b3821934d3c33786b64f9dfcafc6df979378091b12ba0987b', '[\"*\"]', NULL, '2023-05-18 23:38:19', '2023-05-18 23:38:19'),
(75, 'App\\Models\\Listuser', 240, 'api-token', '3fd78b3dc55c11bf43ed61aad173d45a525674cae86de54b423ef32252a4e0f8', '[\"*\"]', NULL, '2023-05-18 23:38:19', '2023-05-18 23:38:19'),
(76, 'App\\Models\\Listuser', 240, 'api-token', 'be67cb879eb3d4aafae8848457b323d461b7e98d3bdf3f9197081abd39aacd9b', '[\"*\"]', NULL, '2023-05-18 23:38:19', '2023-05-18 23:38:19'),
(77, 'App\\Models\\Listuser', 240, 'api-token', '98b731d57ee0cfa7a4968d0379ea17e47f92bf76a19de4c8431c22c1cadaf179', '[\"*\"]', NULL, '2023-05-18 23:38:19', '2023-05-18 23:38:19'),
(78, 'App\\Models\\Listuser', 240, 'api-token', '6e31623ba52d4c5f07eb9c758587c7e80c87d487c6105d83609b4d413d26baaf', '[\"*\"]', NULL, '2023-05-18 23:38:20', '2023-05-18 23:38:20'),
(79, 'App\\Models\\Listuser', 240, 'api-token', 'a6da42e65090323aa693aeef531785169abf922dc55ec6e2409120a527647226', '[\"*\"]', NULL, '2023-05-18 23:38:20', '2023-05-18 23:38:20'),
(80, 'App\\Models\\Listuser', 240, 'api-token', 'c1d8c60802450994587e6f3fede4e2f8b7510c42301a3b080d0dd380cc530825', '[\"*\"]', NULL, '2023-05-18 23:38:20', '2023-05-18 23:38:20'),
(81, 'App\\Models\\Listuser', 240, 'api-token', '6cb315712f7e6e1b6dbb2412dd795e23deb1cacd21ef2be30d6348b68b2f7d07', '[\"*\"]', NULL, '2023-05-18 23:38:20', '2023-05-18 23:38:20'),
(82, 'App\\Models\\Listuser', 240, 'api-token', '019bb2c95a06cd26efb88e877564dc7b38521626a625e93d11149db44c7539f1', '[\"*\"]', NULL, '2023-05-18 23:38:24', '2023-05-18 23:38:24'),
(83, 'App\\Models\\Listuser', 240, 'api-token', '86d4a2a837e65621e38da432820fe2abc4f10f7eed14111ecc76ece46b76fe75', '[\"*\"]', NULL, '2023-05-18 23:38:24', '2023-05-18 23:38:24'),
(84, 'App\\Models\\Listuser', 240, 'api-token', 'ed62c24b3b03ad705cd797bcfed4e329573601a10833f279544c837d960c0922', '[\"*\"]', NULL, '2023-05-18 23:38:25', '2023-05-18 23:38:25'),
(85, 'App\\Models\\Listuser', 240, 'api-token', '60ac3de0b6cb1d53bae05815d00189fb91c0f7b3eaa7278342ec3317965c42ac', '[\"*\"]', NULL, '2023-05-18 23:38:25', '2023-05-18 23:38:25'),
(86, 'App\\Models\\Listuser', 240, 'api-token', 'ce403e28956b2547e9b32a740106c9c2a15ea26da5b09dcea62c79ae802235d8', '[\"*\"]', NULL, '2023-05-18 23:38:25', '2023-05-18 23:38:25'),
(87, 'App\\Models\\Listuser', 240, 'api-token', '54abc2863e29d480f7927a9c60871e1e2363233e475002069c26e4a3e4882f9f', '[\"*\"]', NULL, '2023-05-18 23:38:25', '2023-05-18 23:38:25'),
(88, 'App\\Models\\Listuser', 240, 'api-token', 'b0eed788023a1c3210e28c1fd0c019344f2461ff37b87e7052d8bc5eb2a419db', '[\"*\"]', NULL, '2023-05-18 23:38:26', '2023-05-18 23:38:26'),
(89, 'App\\Models\\Listuser', 240, 'api-token', '1ea7c26c3538095a2694f424c2983e45dc50d207ba53aa5f711d12f5ddceaf25', '[\"*\"]', NULL, '2023-05-18 23:38:26', '2023-05-18 23:38:26'),
(90, 'App\\Models\\Listuser', 240, 'api-token', 'e2d93f788aecadf1f7226f8f97e665b942668f59532648a0c1cafb640e16b966', '[\"*\"]', NULL, '2023-05-18 23:38:26', '2023-05-18 23:38:26'),
(91, 'App\\Models\\Listuser', 241, 'api-token', 'c7f7f88981351706dd7fbaba5367e8562c5196a5aea6f81d32d65c791d049fd7', '[\"*\"]', NULL, '2023-05-18 23:39:49', '2023-05-18 23:39:49'),
(92, 'App\\Models\\Listuser', 241, 'api-token', '3e5d11842b737d32147fb3572c4f30bae76d00a05127148b550788ff2958fd79', '[\"*\"]', NULL, '2023-05-18 23:39:51', '2023-05-18 23:39:51'),
(93, 'App\\Models\\Listuser', 241, 'api-token', 'c4c32643328d454be22e10f427abdf20a6a2e89b855b1492735c34b87a6dbac0', '[\"*\"]', NULL, '2023-05-18 23:39:52', '2023-05-18 23:39:52'),
(94, 'App\\Models\\Listuser', 241, 'api-token', '8d7388128dbd4d4c550ae3f8af16dcc25ba15185a26e50c06aae54e32f3eabd9', '[\"*\"]', NULL, '2023-05-18 23:39:53', '2023-05-18 23:39:53'),
(95, 'App\\Models\\Listuser', 241, 'api-token', '914d7a7c7777d417e08f2d49061374596fe58b2246e237d7b34660686eaed76b', '[\"*\"]', NULL, '2023-05-18 23:39:53', '2023-05-18 23:39:53'),
(96, 'App\\Models\\Listuser', 241, 'api-token', 'd9a5ce13ad4485b3055d6188a960c182970984cd2a224b34f552b0d9dfe800e5', '[\"*\"]', NULL, '2023-05-18 23:39:55', '2023-05-18 23:39:55'),
(97, 'App\\Models\\Listuser', 241, 'api-token', 'aea3d1d1a1fc3e640cbe162cad749c0bd71ab9fec46bf00fa689949dd13ad508', '[\"*\"]', NULL, '2023-05-18 23:43:19', '2023-05-18 23:43:19'),
(98, 'App\\Models\\Listuser', 241, 'api-token', 'a4ec1fa86690e369be0b7921efd581afd6f4b00b54177cdefa011ca594d2e007', '[\"*\"]', NULL, '2023-05-18 23:43:20', '2023-05-18 23:43:20'),
(99, 'App\\Models\\Listuser', 241, 'api-token', '6fef4ae47e5eb47c25d263f754eb97dd930b3f9f87b6a38bdd4401c5ff40f8f4', '[\"*\"]', NULL, '2023-05-18 23:43:21', '2023-05-18 23:43:21'),
(100, 'App\\Models\\Listuser', 241, 'api-token', '7a75a6602cdc73eb9748dcbab4acd4211bcf7dc06e8331db2aa78ca14fb7d39f', '[\"*\"]', NULL, '2023-05-18 23:43:21', '2023-05-18 23:43:21'),
(101, 'App\\Models\\Listuser', 241, 'api-token', '58e07dc0d842a475b1cf98e97e6016481a5a9cd518d8f5fd76e495cd2a609ef5', '[\"*\"]', NULL, '2023-05-18 23:43:21', '2023-05-18 23:43:21'),
(102, 'App\\Models\\Listuser', 241, 'api-token', '3910240675917fbda412d6a19945280c31fe0b31677953f66d0ff5555617e1b7', '[\"*\"]', NULL, '2023-05-18 23:43:21', '2023-05-18 23:43:21'),
(103, 'App\\Models\\Listuser', 241, 'api-token', 'dbc12e47937b794ce533483cfb028307dad7902dd884fa3e31cae18f0260fca3', '[\"*\"]', NULL, '2023-05-18 23:43:21', '2023-05-18 23:43:21'),
(104, 'App\\Models\\Listuser', 241, 'api-token', '118bcea6eac57836850a4035377cf0e2264e93b23472bf775d010968bd2d544d', '[\"*\"]', NULL, '2023-05-18 23:43:21', '2023-05-18 23:43:21'),
(105, 'App\\Models\\Listuser', 241, 'api-token', 'a7857d1954d5981118f7d3d8b272d335168448229fbf4dfc9898769cfbbd671e', '[\"*\"]', NULL, '2023-05-18 23:43:22', '2023-05-18 23:43:22'),
(106, 'App\\Models\\Listuser', 241, 'api-token', '67372fa91a73ec350eea6141ea5cf088065a9403679745378f1cacc0cc3a2a4b', '[\"*\"]', NULL, '2023-05-18 23:43:22', '2023-05-18 23:43:22'),
(107, 'App\\Models\\Listuser', 241, 'api-token', '51a7b9739674d795aba709e2a5b193b771b8ed20ab61398eba10fb2488e9e827', '[\"*\"]', NULL, '2023-05-18 23:43:22', '2023-05-18 23:43:22'),
(108, 'App\\Models\\Listuser', 241, 'api-token', '2a2811a4217038bfcee33daedd98c7acb2b87e582a5ffdcfd217ba72c890f72e', '[\"*\"]', NULL, '2023-05-18 23:43:22', '2023-05-18 23:43:22'),
(109, 'App\\Models\\Listuser', 241, 'api-token', 'f15e181c82bea50506cf6860f7734b9f7db156031ffeda34ad89cd7be08e340c', '[\"*\"]', NULL, '2023-05-18 23:43:23', '2023-05-18 23:43:23'),
(110, 'App\\Models\\Listuser', 241, 'api-token', '9db68927b0d29162e9053ec45c33d33e75f13b56022b3ae59606fa2d1498f179', '[\"*\"]', NULL, '2023-05-18 23:43:23', '2023-05-18 23:43:23'),
(111, 'App\\Models\\Listuser', 241, 'api-token', 'c7cb499d8ebcef8b0a2b9cd6d9c90910917a4ba8585c96c35ec542b18bac4608', '[\"*\"]', NULL, '2023-05-18 23:43:23', '2023-05-18 23:43:23'),
(112, 'App\\Models\\Listuser', 241, 'api-token', 'd7ce777f2b94682e99fefc9a93e1d28663a0c9f76a08dda42bbefb7c99729a85', '[\"*\"]', NULL, '2023-05-18 23:43:24', '2023-05-18 23:43:24'),
(113, 'App\\Models\\Listuser', 241, 'api-token', 'bab22c66f3fb265bbbfc53aa2a63663656f661133ae1d85783e5ae1088d578ae', '[\"*\"]', NULL, '2023-05-18 23:43:24', '2023-05-18 23:43:24'),
(114, 'App\\Models\\Listuser', 241, 'api-token', '4df68c750992c003a407a1b77b5b60b10c85968f9489034c4859ac9889c129a2', '[\"*\"]', NULL, '2023-05-18 23:44:08', '2023-05-18 23:44:08'),
(115, 'App\\Models\\Listuser', 241, 'api-token', '0f3951ddf55796c8a70edb3daefdac4fafac61dd05252bef4ef86a56dd82cf33', '[\"*\"]', NULL, '2023-05-18 23:44:11', '2023-05-18 23:44:11'),
(116, 'App\\Models\\Listuser', 241, 'api-token', '2aab1d90e5ac314350c8c37554276926144817301921d16b6807e5f383c3b576', '[\"*\"]', NULL, '2023-05-18 23:45:40', '2023-05-18 23:45:40'),
(117, 'App\\Models\\Listuser', 241, 'api-token', 'cfb351b5b646f085a242aa40976c053622d2453b2a97618dccd6df325ecfeb03', '[\"*\"]', NULL, '2023-05-18 23:45:52', '2023-05-18 23:45:52'),
(118, 'App\\Models\\Listuser', 241, 'api-token', '56eeae5be0b9207dcbe6d6d8c94a75efcfa4c600f4b929d51d67b3281ae12293', '[\"*\"]', NULL, '2023-05-18 23:45:53', '2023-05-18 23:45:53'),
(119, 'App\\Models\\Listuser', 241, 'api-token', '44f942f8aa984baeca7c15606ef550f9501303493f4fa96a73b1e666c8525bc4', '[\"*\"]', NULL, '2023-05-18 23:45:54', '2023-05-18 23:45:54'),
(120, 'App\\Models\\Listuser', 241, 'api-token', '5e00b061b6a4da3e81d4511a4969963549c87cfdef16265f88c72f934cfad348', '[\"*\"]', NULL, '2023-05-18 23:45:54', '2023-05-18 23:45:54'),
(121, 'App\\Models\\Listuser', 241, 'api-token', '2aadaf8c95277a97faf16145051ea49cd66c717cc6daac59c79fb626b643d692', '[\"*\"]', NULL, '2023-05-18 23:45:54', '2023-05-18 23:45:54'),
(122, 'App\\Models\\Listuser', 241, 'api-token', '90802a0d3bdfc1643426c1eaa0dc872b64aaae67c17069a590578c62b7e8b931', '[\"*\"]', NULL, '2023-05-18 23:45:54', '2023-05-18 23:45:54'),
(123, 'App\\Models\\Listuser', 208, 'api-token', 'cadc00fb6e6688b33c5540607fb196ce455ec7d4faa26fbffff084674b62749f', '[\"*\"]', '2023-05-19 16:18:38', '2023-05-19 01:28:08', '2023-05-19 16:18:38'),
(124, 'App\\Models\\Listuser', 191, 'api-token', '353846ec184b994053cc065eec59a383917c01784fc885788b4ee1999cc8d461', '[\"*\"]', '2023-05-19 16:32:57', '2023-05-19 11:18:09', '2023-05-19 16:32:57'),
(125, 'App\\Models\\Listuser', 234, 'api-token', 'dc05a5a1e2d4fe64579fb4c10f432e51ad47d04dd4963e1cd8fc94f175417ba4', '[\"*\"]', '2023-05-19 16:28:46', '2023-05-19 16:20:01', '2023-05-19 16:28:46'),
(126, 'App\\Models\\Listuser', 239, 'api-token', '944257da560d8d447a678a4a07045c2cdd63d3557b03223f618d2e29ff7afdd4', '[\"*\"]', '2023-05-22 13:22:29', '2023-05-20 01:34:55', '2023-05-22 13:22:29'),
(127, 'App\\Models\\Listuser', 234, 'api-token', 'ab689e6e2533d269b7f4423de01f8c88e26e828a883e8c921ed54862252f2504', '[\"*\"]', '2023-05-21 01:27:34', '2023-05-20 12:02:02', '2023-05-21 01:27:34'),
(128, 'App\\Models\\Listuser', 234, 'api-token', 'b222635ac8eaf5d12cd751ec0f95c62420b6be0381f1317752dd6c7cb975fb51', '[\"*\"]', '2023-06-14 10:47:19', '2023-05-22 01:15:57', '2023-06-14 10:47:19'),
(129, 'App\\Models\\Listuser', 191, 'api-token', '3df368db9f20e66254ce696abc220eb74b74be4415a25540536096906d991e3d', '[\"*\"]', '2023-05-22 11:32:56', '2023-05-22 11:28:11', '2023-05-22 11:32:56'),
(130, 'App\\Models\\Listuser', 191, 'api-token', '45a504ecb65fb1475f23aa33472bd5515a7bbaa9a05193af5c3167d3f4936365', '[\"*\"]', '2023-05-22 14:47:18', '2023-05-22 11:33:26', '2023-05-22 14:47:18'),
(131, 'App\\Models\\Listuser', 239, 'api-token', '6b9ad2b2e94571c5035fb0c3067c2a6375ec28692327ad724838eec7ac31fd68', '[\"*\"]', '2023-07-19 09:13:21', '2023-05-22 13:21:34', '2023-07-19 09:13:21'),
(132, 'App\\Models\\Listuser', 208, 'api-token', '11d9d502d4a8e8d01452f3406831b505ec7830ade831c1e5c0de58dffd85a08e', '[\"*\"]', '2023-05-23 13:24:07', '2023-05-22 14:21:49', '2023-05-23 13:24:07'),
(133, 'App\\Models\\Listuser', 234, 'api-token', 'c7b2c9364f55a5c2f4712afe4d0fde59c96cd8b8d68b13921443ae1aad02951e', '[\"*\"]', '2023-05-22 14:42:39', '2023-05-22 14:30:04', '2023-05-22 14:42:39'),
(134, 'App\\Models\\Listuser', 234, 'api-token', '0f14ceea3d4416d475828f7a1371e350050bced21211ab8533fb62c9c460b3ec', '[\"*\"]', NULL, '2023-05-22 14:32:09', '2023-05-22 14:32:09'),
(135, 'App\\Models\\Listuser', 234, 'api-token', 'bcc7d1022ddc865d90c35302902d6a1577f8fc88e063e1cb31afc98e1b095eff', '[\"*\"]', NULL, '2023-05-22 14:42:51', '2023-05-22 14:42:51'),
(136, 'App\\Models\\Listuser', 191, 'api-token', '439025239e65308660d0112d6ddaa2d66aacd2bf03ae57d80f32edbcbf200c04', '[\"*\"]', '2023-05-22 23:05:05', '2023-05-22 14:47:33', '2023-05-22 23:05:05'),
(137, 'App\\Models\\Listuser', 243, 'api-token', '876fa9fba03b7a5894f62c67ada457755a50b6e1012657602fd2150a4905e9b4', '[\"*\"]', '2023-05-22 23:19:45', '2023-05-22 23:06:58', '2023-05-22 23:19:45'),
(138, 'App\\Models\\Listuser', 191, 'api-token', '618715f3ad57709913797d96b17e54ce97e00a98e7e818ead5096259f282e3d1', '[\"*\"]', '2023-05-25 11:37:33', '2023-05-22 23:20:02', '2023-05-25 11:37:33'),
(139, 'App\\Models\\Listuser', 239, 'api-token', 'ebd2a4b5f05270ea067b023c0b825cef1e6945cfe504152250b95e678e4ab4a4', '[\"*\"]', '2023-06-01 12:40:12', '2023-05-22 23:52:48', '2023-06-01 12:40:12'),
(140, 'App\\Models\\Listuser', 208, 'api-token', '00635f5623ee0b2ec4635c400cd42e87c4c5e260920378b66ed75e0fba6ea0fb', '[\"*\"]', '2023-05-24 01:12:37', '2023-05-23 13:30:49', '2023-05-24 01:12:37'),
(141, 'App\\Models\\Listuser', 208, 'api-token', '7b80f827e1666baad763ca660d752292389a401dd8dda8ad8873035ca5cf4b06', '[\"*\"]', NULL, '2023-05-23 23:02:42', '2023-05-23 23:02:42'),
(142, 'App\\Models\\Listuser', 208, 'api-token', '1b4db74725d03f0abb466ec9d6fa4002c13772adbe9ae1f3c431b7c5d8bf9304', '[\"*\"]', NULL, '2023-05-23 23:02:42', '2023-05-23 23:02:42'),
(143, 'App\\Models\\Listuser', 208, 'api-token', 'dccf56c0812bc6f98d783d9abd2d183acc0b07a7d0aa5189a8b48d89949d8c76', '[\"*\"]', NULL, '2023-05-23 23:02:42', '2023-05-23 23:02:42'),
(144, 'App\\Models\\Listuser', 208, 'api-token', '81afc12729e9d6d6f5ae390ac3d3f9202328e3c09530d33660ae5cfdc245e3dd', '[\"*\"]', NULL, '2023-05-23 23:02:42', '2023-05-23 23:02:42'),
(145, 'App\\Models\\Listuser', 208, 'api-token', '7ca3fba95bf20b2c550992d70b0a2b9081c2d61bb73caf520eb7a3548abc500c', '[\"*\"]', NULL, '2023-05-23 23:02:43', '2023-05-23 23:02:43'),
(146, 'App\\Models\\Listuser', 208, 'api-token', 'ab53a1eee1f22933c06d3367651c96864d40e383cd2d9dab13d53f764ad7a00c', '[\"*\"]', NULL, '2023-05-23 23:02:43', '2023-05-23 23:02:43'),
(147, 'App\\Models\\Listuser', 208, 'api-token', '2069d2d6c463899f5ed51630b3e280820e28fdbedd76f8a8ffa4b43947c254d2', '[\"*\"]', NULL, '2023-05-23 23:02:43', '2023-05-23 23:02:43'),
(148, 'App\\Models\\Listuser', 208, 'api-token', '8b9e65c0762e46a058e1a2beb1d7d3a40c8ac525a759face7e6e3e566022023d', '[\"*\"]', NULL, '2023-05-23 23:02:44', '2023-05-23 23:02:44'),
(149, 'App\\Models\\Listuser', 208, 'api-token', '1a23e436db3b6bf54d724ee407e1cbedf202a9d9c9f1c7b59a9ecaa3ffc19e79', '[\"*\"]', NULL, '2023-05-23 23:02:44', '2023-05-23 23:02:44'),
(150, 'App\\Models\\Listuser', 208, 'api-token', 'e2d678ce2a77b6fd1b73a4c36cfeb0e84073a2a20016b2f74c6e31541f01dbde', '[\"*\"]', NULL, '2023-05-23 23:02:47', '2023-05-23 23:02:47'),
(151, 'App\\Models\\Listuser', 208, 'api-token', '1a8802d8465a0084ebb8c6c93ddaf2178aa3d9b9f870aeb44b93f73900bbc87b', '[\"*\"]', NULL, '2023-05-23 23:03:03', '2023-05-23 23:03:03'),
(152, 'App\\Models\\Listuser', 208, 'api-token', '994cd0f11a16da106d5ca1fd92618985e52feae0641c81d3a7895db3ed523559', '[\"*\"]', NULL, '2023-05-23 23:03:03', '2023-05-23 23:03:03'),
(153, 'App\\Models\\Listuser', 208, 'api-token', '268c141311f312df9d0fdd3ed1b2f89a07148dd86f4bac38d2f8552bf84c5db7', '[\"*\"]', NULL, '2023-05-24 01:11:58', '2023-05-24 01:11:58'),
(154, 'App\\Models\\Listuser', 208, 'api-token', '9a284117a993bdf6f2f67748cd32657c4ff1e32367261c9ed6c5d99e11fa9b6c', '[\"*\"]', NULL, '2023-05-24 01:11:58', '2023-05-24 01:11:58'),
(155, 'App\\Models\\Listuser', 208, 'api-token', '081b39a39aaeb978cae4eb5ffd414bbc20b99430aa1b19549cd947483867f8be', '[\"*\"]', NULL, '2023-05-24 01:11:58', '2023-05-24 01:11:58'),
(156, 'App\\Models\\Listuser', 208, 'api-token', '80e319249f8098a35e28a77fa1a4d3d030c99e9981beae6cea398020c9905d57', '[\"*\"]', NULL, '2023-05-24 01:11:59', '2023-05-24 01:11:59'),
(157, 'App\\Models\\Listuser', 208, 'api-token', '539682c0fc97ed8bd1b5e78ed2651d31084856ffc9d2e460784b47b2fbcd3ddf', '[\"*\"]', NULL, '2023-05-24 01:11:59', '2023-05-24 01:11:59'),
(158, 'App\\Models\\Listuser', 208, 'api-token', '7cffd8a7601bfe4f417d6511a993c0789a1306e0555c283735d0f665979721d2', '[\"*\"]', NULL, '2023-05-24 01:11:59', '2023-05-24 01:11:59'),
(159, 'App\\Models\\Listuser', 208, 'api-token', 'ff54d0c448190dae00ac0ee320ce7745f475d0a67afba655d20c739fe4a2be8c', '[\"*\"]', '2023-05-25 15:31:42', '2023-05-24 16:08:49', '2023-05-25 15:31:42'),
(160, 'App\\Models\\Listuser', 191, 'api-token', 'f98b4920c740194944fea189ce13e855ea8f7f4c26b48eb5817ccb3b773f155f', '[\"*\"]', '2023-05-31 23:42:51', '2023-05-25 11:57:55', '2023-05-31 23:42:51'),
(161, 'App\\Models\\Listuser', 245, 'api-token', 'b3ff8674cfb9740a72f40b826fceb935cdd2b52d8b11a8f5555bef0e0ebc0823', '[\"*\"]', '2023-10-10 10:02:21', '2023-05-29 16:25:06', '2023-10-10 10:02:21'),
(162, 'App\\Models\\Listuser', 245, 'api-token', '31059641dcc1be3f463e91d4f48814ddeb82c75ec4461f546a5699d3bb8d54ec', '[\"*\"]', '2023-05-29 16:37:26', '2023-05-29 16:34:22', '2023-05-29 16:37:26'),
(163, 'App\\Models\\Listuser', 208, 'api-token', '9aaf631f2132265635dee25e7fc60d655b8b3359c1dad004a0d52e72ad2c4c94', '[\"*\"]', '2023-05-30 15:35:36', '2023-05-30 15:23:27', '2023-05-30 15:35:36'),
(164, 'App\\Models\\Listuser', 247, 'api-token', 'f43b995325ffccf3719dbca53a197c79ed7ed36ff49b8b55e8808cbcbbc0d929', '[\"*\"]', '2023-05-31 16:15:14', '2023-05-31 16:11:33', '2023-05-31 16:15:14'),
(165, 'App\\Models\\Listuser', 208, 'api-token', '7cdccc95dd2c37806be53aa55853641e5fd5d0ede5fd3cff07e7cdaa396e8e1d', '[\"*\"]', '2023-05-31 19:04:26', '2023-05-31 19:04:17', '2023-05-31 19:04:26'),
(166, 'App\\Models\\Listuser', 208, 'api-token', '22a90777c3a0a40fbc2cb61796c1bc2982b767d637376924524ee110227a1861', '[\"*\"]', '2023-06-01 01:10:12', '2023-05-31 19:05:44', '2023-06-01 01:10:12'),
(167, 'App\\Models\\Listuser', 234, 'api-token', 'c348d1e95e46801bd32fbd84346bb439581c852342ae453c57ac7a007e547d69', '[\"*\"]', '2023-06-01 00:07:09', '2023-05-31 23:13:59', '2023-06-01 00:07:09'),
(168, 'App\\Models\\Listuser', 208, 'api-token', '09124a8bb29f2133e2ba7e99559afc871c65da0b3576d16cfb562630a18e1b57', '[\"*\"]', '2023-06-01 15:20:03', '2023-06-01 15:01:45', '2023-06-01 15:20:03'),
(169, 'App\\Models\\Listuser', 208, 'api-token', 'dca0d75901a6d90864546ce5d13f36471c459e7b0aa559a5d4afeecfa3d58530', '[\"*\"]', '2023-06-01 15:51:05', '2023-06-01 15:47:59', '2023-06-01 15:51:05'),
(170, 'App\\Models\\Listuser', 234, 'api-token', '59754ec49715b29e4ab9d1336ec53596fdfa7d5fa7f44bf9f480b921653d64da', '[\"*\"]', NULL, '2023-06-06 01:21:20', '2023-06-06 01:21:20'),
(171, 'App\\Models\\Listuser', 208, 'api-token', '825e715f253e12ae943ed76537daad54822bee03efde9cb683f7735e60b3ec13', '[\"*\"]', '2023-06-06 20:24:17', '2023-06-06 15:33:22', '2023-06-06 20:24:17'),
(172, 'App\\Models\\Listuser', 239, 'api-token', '1898e7189b17d731c0868c06aea541f688f7a8e67732eeea015caf830962adbd', '[\"*\"]', '2023-06-14 15:26:20', '2023-06-09 12:16:05', '2023-06-14 15:26:20'),
(173, 'App\\Models\\Listuser', 234, 'api-token', 'bae12004321ca06599cc7c95d38a060ec7ae5c37f3afbb26e1e01d825057d7ff', '[\"*\"]', '2023-06-14 10:48:43', '2023-06-14 10:48:43', '2023-06-14 10:48:43'),
(174, 'App\\Models\\Listuser', 249, 'api-token', '5be04ecc5ebcb01290e204f183801a38c9695c173aaba8baab818520725f15bc', '[\"*\"]', '2023-06-14 10:50:55', '2023-06-14 10:50:54', '2023-06-14 10:50:55'),
(175, 'App\\Models\\Listuser', 249, 'api-token', '66c2071735b1e998ad18b847dd406248ff6d868d42470ebe7c01dcfb25ddce5c', '[\"*\"]', '2023-06-14 10:55:37', '2023-06-14 10:55:37', '2023-06-14 10:55:37'),
(176, 'App\\Models\\Listuser', 208, 'api-token', '8107f8b5e4616a6fb6fe1ed6961ae18e82ef78ab54b08b14d1577912298c9f0f', '[\"*\"]', '2023-06-14 15:23:09', '2023-06-14 13:36:37', '2023-06-14 15:23:09'),
(177, 'App\\Models\\Listuser', 250, 'api-token', '1c23c6b7d23e95cfbd94ec54907b1858b1e872d4145089ebb1eb66699563e762', '[\"*\"]', '2023-06-14 13:59:16', '2023-06-14 13:58:46', '2023-06-14 13:59:16'),
(178, 'App\\Models\\Listuser', 251, 'api-token', '52254d31fa0734e31dcfedac5d345f7c74b9f97a492da3d942b35a366704b843', '[\"*\"]', '2023-06-14 15:10:18', '2023-06-14 14:27:49', '2023-06-14 15:10:18'),
(179, 'App\\Models\\Listuser', 253, 'api-token', 'f6ff640ae713de641fc5355ce8fd0cb93e3fafcf33b5b8654ff99beea5440924', '[\"*\"]', '2023-07-05 23:12:15', '2023-06-14 14:52:38', '2023-07-05 23:12:15'),
(180, 'App\\Models\\Listuser', 254, 'api-token', '6d910ef0a75d3fa019b375332accf3a8653f50c0a0be62857165e2dc1bac24a4', '[\"*\"]', '2023-06-16 21:24:31', '2023-06-15 04:55:26', '2023-06-16 21:24:31'),
(181, 'App\\Models\\Listuser', 254, 'api-token', '81131b0197e65527bd353e4fc7bbe30463e6e34f1df14f8ef88c67fe748c5a69', '[\"*\"]', '2023-06-16 00:49:21', '2023-06-15 05:09:07', '2023-06-16 00:49:21'),
(182, 'App\\Models\\Listuser', 208, 'api-token', '4cbfb68cc32803b358b7446ddec1cfd5a9e2f1ca854c3837f0505031f013c577', '[\"*\"]', '2023-06-15 15:00:29', '2023-06-15 14:38:32', '2023-06-15 15:00:29'),
(183, 'App\\Models\\Listuser', 245, 'api-token', '212bff7f982ee5133d6c67ab8acbf3504b5c21fcbe09aeb08dbb205700f304a8', '[\"*\"]', '2023-06-16 11:52:28', '2023-06-15 14:46:54', '2023-06-16 11:52:28'),
(184, 'App\\Models\\Listuser', 254, 'api-token', '0e779965b19d56b1ed10eb86a651bd65b75469a2ea3867da4ce3f1bda8fa9fed', '[\"*\"]', '2023-06-16 05:29:38', '2023-06-16 05:27:17', '2023-06-16 05:29:38'),
(185, 'App\\Models\\Listuser', 254, 'api-token', 'fabe2b20e51e360f69feff044898267e4a6c9da1843d25737277337a6eb2d8df', '[\"*\"]', '2023-06-16 21:22:53', '2023-06-16 05:30:13', '2023-06-16 21:22:53'),
(186, 'App\\Models\\Listuser', 255, 'api-token', 'b7951d2cb922418eff6780b4c0eb41529bedc2973aded185cc504f600647ffa6', '[\"*\"]', '2023-06-16 11:53:28', '2023-06-16 11:53:27', '2023-06-16 11:53:28'),
(187, 'App\\Models\\Listuser', 255, 'api-token', '9c59bc781cb9ef829acc8bd3654b6f646dda9d15c00fb83574b13bf7a841a605', '[\"*\"]', '2023-06-28 20:19:37', '2023-06-16 11:55:52', '2023-06-28 20:19:37'),
(188, 'App\\Models\\Listuser', 185, 'api-token', 'a9eea6b8be11b1ea8e95b11fc2851df98f8e3c546570ce4efa1447716f5fb863', '[\"*\"]', '2023-06-16 21:45:17', '2023-06-16 21:45:17', '2023-06-16 21:45:17'),
(189, 'App\\Models\\Listuser', 185, 'api-token', '83adc126edc27c85d547cb85ea2330dd6c963ee0f67fb87113eac6668a3fcf33', '[\"*\"]', '2023-06-20 11:37:47', '2023-06-16 22:01:38', '2023-06-20 11:37:47'),
(190, 'App\\Models\\Listuser', 185, 'api-token', '09217d5f61261e583426ad8857a4770b2f2a6e80d61959f440b7ffdd0863c4a0', '[\"*\"]', '2023-06-28 04:23:03', '2023-06-16 22:33:42', '2023-06-28 04:23:03'),
(191, 'App\\Models\\Listuser', 208, 'api-token', '784a4ec9cf8f3b9b2649e227b281fcec853454137b65935dad7e6a1ca5da4def', '[\"*\"]', '2023-06-17 11:17:20', '2023-06-17 11:17:11', '2023-06-17 11:17:20'),
(192, 'App\\Models\\Listuser', 208, 'api-token', '263ba7bcf6eb627ee7b5365e016bf7a5f9ee01804330d1230618e9fa05613f25', '[\"*\"]', '2023-06-19 23:07:15', '2023-06-17 11:19:39', '2023-06-19 23:07:15'),
(193, 'App\\Models\\Listuser', 208, 'api-token', 'ca4865e70394737a4a708c7e5ad1611913e692f1af831cf30bec1ff19dd38e30', '[\"*\"]', '2023-06-19 23:13:11', '2023-06-19 23:09:46', '2023-06-19 23:13:11'),
(194, 'App\\Models\\Listuser', 254, 'api-token', 'b07ef12ea0c968b970adf6f331f888661f3bfb5f43d2b613d6f1878616afb784', '[\"*\"]', '2023-06-20 12:09:42', '2023-06-20 12:04:31', '2023-06-20 12:09:42'),
(195, 'App\\Models\\Listuser', 254, 'api-token', '6e67ffa602c79682a7e9719078a5047917949395a83c5d80576a03aa1bebad10', '[\"*\"]', '2023-06-22 12:45:33', '2023-06-20 12:11:32', '2023-06-22 12:45:33'),
(196, 'App\\Models\\Listuser', 208, 'api-token', '45fdebd626b0ec792e16e42cbc6a85ae14dcfdfc647d456cd9db2b6c97621ad4', '[\"*\"]', '2023-10-26 20:02:49', '2023-06-20 13:51:04', '2023-10-26 20:02:49'),
(197, 'App\\Models\\Listuser', 245, 'api-token', 'ae5709ad04db7ee50dbe9e567321b921d4d16f1a9c083880bbaebd9142265a61', '[\"*\"]', '2023-09-11 18:01:56', '2023-06-20 14:13:08', '2023-09-11 18:01:56'),
(198, 'App\\Models\\Listuser', 257, 'api-token', '6271f86cd6b849f66baa42eb55cd02c27a67d6ba26e1300a572f413703860070', '[\"*\"]', '2023-06-25 04:46:47', '2023-06-25 04:46:04', '2023-06-25 04:46:47'),
(199, 'App\\Models\\Listuser', 254, 'api-token', '0e524068926776e041bd85e52966e148b6b0a50062e88068fc8040f37063fe72', '[\"*\"]', '2023-06-29 08:57:11', '2023-06-25 22:02:39', '2023-06-29 08:57:11'),
(200, 'App\\Models\\Listuser', 254, 'api-token', '0aaa72ac320527ab61a026cf8dff82a70ff39c6587c8f48b608d1a742d4cbee3', '[\"*\"]', '2023-06-30 20:28:03', '2023-06-29 08:58:44', '2023-06-30 20:28:03'),
(201, 'App\\Models\\Listuser', 254, 'api-token', 'ad896308ce02a8ebd85dbd918011f4db0f291683acb4ee9da4ff0ebcbfb0e56b', '[\"*\"]', '2023-06-30 21:17:16', '2023-06-30 20:39:32', '2023-06-30 21:17:16'),
(202, 'App\\Models\\Listuser', 254, 'api-token', '82a79876e58dc7f4b098eec211652167242eda479b40a55a27c01d9f52493551', '[\"*\"]', '2023-07-06 16:16:15', '2023-07-06 15:41:29', '2023-07-06 16:16:15'),
(203, 'App\\Models\\Listuser', 254, 'api-token', '84859c14fb4e1efad7f5732371486c88f6d728b4a05b7da858880a25346b0abe', '[\"*\"]', '2023-07-06 16:08:43', '2023-07-06 15:59:18', '2023-07-06 16:08:43'),
(204, 'App\\Models\\Listuser', 254, 'api-token', 'f812f91805a8e1c1130068f8b41bd29c41b7e9ed14674d5db5ad5acc9bd62c0a', '[\"*\"]', '2023-11-10 10:57:07', '2023-07-06 16:14:20', '2023-11-10 10:57:07'),
(205, 'App\\Models\\Listuser', 254, 'api-token', '0a08547cf58a44dc478df3e2aef3569552f2ec6bf767419c3153dc08b74f7248', '[\"*\"]', '2023-08-04 05:44:33', '2023-07-06 16:29:29', '2023-08-04 05:44:33'),
(206, 'App\\Models\\Listuser', 142, 'api-token', '8ca1d880a9b683718a9d981bc0aa09a158b20ef81ae2eccf90cda6253de80e44', '[\"*\"]', '2023-07-15 20:00:11', '2023-07-15 19:59:56', '2023-07-15 20:00:11'),
(207, 'App\\Models\\Listuser', 258, 'api-token', 'e4931d917df2d2b20f906c85eab22ec75a4325e00ca4cda149f10478445187f0', '[\"*\"]', '2023-07-16 22:40:33', '2023-07-16 22:34:33', '2023-07-16 22:40:33'),
(208, 'App\\Models\\Listuser', 239, 'api-token', '837aa6e206f2dc26a266ec29ddd3e6f1c9d5c83fb15fd7f95d368755d6401751', '[\"*\"]', '2023-07-19 09:27:08', '2023-07-19 09:10:05', '2023-07-19 09:27:08'),
(209, 'App\\Models\\Listuser', 264, 'api-token', 'd880059a622f112eda8f5c23669499ae9615cf54d8a37a3a440eadb6307373a7', '[\"*\"]', NULL, '2023-07-19 20:02:44', '2023-07-19 20:02:44'),
(210, 'App\\Models\\Listuser', 264, 'api-token', '6c7d8b9ff8533388ab64835e853c8b666ab0df8a44422c427bdaaf2f64a12a48', '[\"*\"]', NULL, '2023-07-19 20:03:11', '2023-07-19 20:03:11'),
(211, 'App\\Models\\Listuser', 264, 'api-token', '88b9c0a41fb446b27e8638edc076c9f2ff995fb5d5e575d349b4ed8b640e4b87', '[\"*\"]', '2023-07-19 20:04:26', '2023-07-19 20:04:09', '2023-07-19 20:04:26'),
(212, 'App\\Models\\Listuser', 265, 'api-token', '2fa96e10867cd597192c7b1335a1751b9266f2e723b232aca97c4f93456dbaf4', '[\"*\"]', '2023-07-19 20:07:42', '2023-07-19 20:06:56', '2023-07-19 20:07:42'),
(213, 'App\\Models\\Listuser', 266, 'api-token', 'efb1dd25fc838af82895eb88c8d2d13bd919cefa943e425d3f88350ed2cbfd9f', '[\"*\"]', NULL, '2023-07-19 20:11:01', '2023-07-19 20:11:01'),
(214, 'App\\Models\\Listuser', 266, 'api-token', '393ecf81b6d649a3e1e8777206626b0fa6557666fa7fb36d8747d45503c0299e', '[\"*\"]', '2023-07-19 20:11:12', '2023-07-19 20:11:11', '2023-07-19 20:11:12'),
(215, 'App\\Models\\Listuser', 266, 'api-token', '875b63c2bb3e855a7cd1cfcd2edffd844bf4e35561414768e953bc52de348816', '[\"*\"]', '2023-07-19 20:24:15', '2023-07-19 20:19:39', '2023-07-19 20:24:15'),
(216, 'App\\Models\\Listuser', 267, 'api-token', 'c4a462b0d00f12001a1e6d57230a8889505ad8966ed86b1365589a015019fed3', '[\"*\"]', NULL, '2023-07-19 20:28:07', '2023-07-19 20:28:07'),
(217, 'App\\Models\\Listuser', 267, 'api-token', 'a35a176098499141df93cb5af7a396416ccd1251f6289d1d719cb133d501abd3', '[\"*\"]', NULL, '2023-07-19 20:28:26', '2023-07-19 20:28:26'),
(218, 'App\\Models\\Listuser', 267, 'api-token', '4df59684a4b77e679936fd1a9242659c154755bf3915b779d20d8e7171a5c8ba', '[\"*\"]', NULL, '2023-07-19 20:29:41', '2023-07-19 20:29:41'),
(219, 'App\\Models\\Listuser', 268, 'api-token', '1c0c5a983bc8bedbd7eb46d04f9ad5c33820e4422572e7f209b06d80595d2115', '[\"*\"]', NULL, '2023-07-19 20:29:59', '2023-07-19 20:29:59'),
(220, 'App\\Models\\Listuser', 268, 'api-token', '729526329c41290e13dd6ba0e1f3b15d5bc57c9013d7fc66e069db946b233104', '[\"*\"]', '2023-07-19 21:08:23', '2023-07-19 20:30:35', '2023-07-19 21:08:23'),
(221, 'App\\Models\\Listuser', 268, 'api-token', '6fa01d4f4ef9126dfde4ae0b285a9147ffdbf711357943ac216095752867f363', '[\"*\"]', NULL, '2023-07-19 20:36:04', '2023-07-19 20:36:04'),
(222, 'App\\Models\\Listuser', 268, 'api-token', '60d0a8b5097c7e52804be72a7265673df40d5a99360ee3c891aef0a008090090', '[\"*\"]', NULL, '2023-07-19 20:37:57', '2023-07-19 20:37:57'),
(223, 'App\\Models\\Listuser', 266, 'api-token', '572a6ab302dea0a57a5428b3c1ff8af963c2b163ce16cbcde177a7efb7fc5703', '[\"*\"]', NULL, '2023-07-19 21:16:32', '2023-07-19 21:16:32'),
(224, 'App\\Models\\Listuser', 266, 'api-token', '8570a25909caf36876cfbec5765d898b9f2ef693e3ed47ade50d8229679f023d', '[\"*\"]', NULL, '2023-07-19 21:28:32', '2023-07-19 21:28:32'),
(225, 'App\\Models\\Listuser', 266, 'api-token', 'f38242bef5fa95b564c1144a80d2d0daee8b243b59b5ca0693a1a13770ba0f1f', '[\"*\"]', '2023-07-19 21:52:26', '2023-07-19 21:34:26', '2023-07-19 21:52:26'),
(226, 'App\\Models\\Listuser', 266, 'api-token', '9772b0e0fd96c7494cb928cee2da65266b9d00631c49c03921c10f83fac30fa2', '[\"*\"]', '2023-07-25 03:26:08', '2023-07-20 00:59:56', '2023-07-25 03:26:08'),
(227, 'App\\Models\\Listuser', 269, 'api-token', 'e56f960b3a462a4bfe92d65a9ffae7633c12cef72d8d4aa22d73edd100927d4b', '[\"*\"]', '2023-07-31 12:19:53', '2023-07-20 01:22:31', '2023-07-31 12:19:53'),
(228, 'App\\Models\\Listuser', 142, 'api-token', 'c052d1e35cbd76a7af040e6a92759fe2349c1961f0fd9b8ef34e9ab8b2d590d0', '[\"*\"]', '2023-07-25 12:30:35', '2023-07-25 11:52:27', '2023-07-25 12:30:35'),
(229, 'App\\Models\\Listuser', 271, 'api-token', '38c186cc753be49ea3525949ff626052a0c2033e315ca423649fbb2d5f1b8b6f', '[\"*\"]', '2023-07-25 23:45:26', '2023-07-25 12:33:50', '2023-07-25 23:45:26'),
(230, 'App\\Models\\Listuser', 272, 'api-token', '721375b36c6a7e6c247c563d59adbbe84044dabe920fa4d9e3605246db8affb2', '[\"*\"]', '2023-08-11 00:18:17', '2023-07-25 23:46:20', '2023-08-11 00:18:17'),
(231, 'App\\Models\\Listuser', 203, 'api-token', '8222e477865d57c64a68892728af7e1958c84e1fda7e8a1a461b299f7d9006f3', '[\"*\"]', '2023-07-27 10:08:34', '2023-07-27 10:07:26', '2023-07-27 10:08:34'),
(232, 'App\\Models\\Listuser', 256, 'api-token', '465b45db82e1469097c6f91cd0a2ba2509d802ab04eef4253e9cd06f7fa6096a', '[\"*\"]', '2023-07-27 12:05:41', '2023-07-27 12:00:55', '2023-07-27 12:05:41'),
(233, 'App\\Models\\Listuser', 273, 'api-token', 'b6c439d571ebeffee433d45535f734b3810f1443ea9844bb271dc8d6961d1e85', '[\"*\"]', '2023-09-04 07:54:04', '2023-08-03 22:49:32', '2023-09-04 07:54:04'),
(234, 'App\\Models\\Listuser', 254, 'api-token', '98d1b3d792aca2a5efa1bb9e2474051a806c0f337d57885d7fe161e955522db9', '[\"*\"]', '2024-01-02 03:44:01', '2023-08-04 06:49:25', '2024-01-02 03:44:01'),
(235, 'App\\Models\\Listuser', 256, 'api-token', 'f6401209fec5238091337fa3c08cdf4a4ba88b07cd7329f26075e5faa0999bbd', '[\"*\"]', '2023-08-04 13:55:51', '2023-08-04 13:51:06', '2023-08-04 13:55:51'),
(236, 'App\\Models\\Listuser', 274, 'api-token', '48b72679c9eec8acb1945109556e3eabf32dbd182334fbdd0688d8d30822a3e7', '[\"*\"]', '2023-08-08 13:30:39', '2023-08-08 12:19:19', '2023-08-08 13:30:39'),
(237, 'App\\Models\\Listuser', 275, 'api-token', '0c30d555986950ef7bba94849e0b15891aea68db9162b0dd7f1ea6aa8e3adc15', '[\"*\"]', NULL, '2023-08-08 15:56:05', '2023-08-08 15:56:05'),
(238, 'App\\Models\\Listuser', 275, 'api-token', 'e80ecfa6936560fe365b5d5547f03bfe16ff6fcfb3052c5d3d25685eade5cbbd', '[\"*\"]', '2024-02-04 16:51:46', '2023-08-08 15:56:18', '2024-02-04 16:51:46'),
(239, 'App\\Models\\Listuser', 245, 'api-token', '39b6895da40bd57c7df0bf5af9e7277a6c1069fb0065d1ce6a38be271dd62b20', '[\"*\"]', '2023-08-08 17:47:52', '2023-08-08 17:46:19', '2023-08-08 17:47:52'),
(240, 'App\\Models\\Listuser', 239, 'api-token', '0b749e743d6f0d5e50555a3985680d61b5796b8a3ae85604ea2b560f6278452c', '[\"*\"]', '2023-08-11 13:56:45', '2023-08-11 11:38:04', '2023-08-11 13:56:45'),
(241, 'App\\Models\\Listuser', 239, 'api-token', 'd88302df4cd1b52e6c0efbdacf5d5752d970931a4ede76ba3e6d767d1a13fc3e', '[\"*\"]', '2023-08-18 14:46:26', '2023-08-11 14:05:29', '2023-08-18 14:46:26'),
(242, 'App\\Models\\Listuser', 276, 'api-token', '11eff4cdf942ef5ad5c2073342d41713253c6073b034237fc3ff3e0940d5f3f0', '[\"*\"]', NULL, '2023-08-12 11:31:37', '2023-08-12 11:31:37'),
(243, 'App\\Models\\Listuser', 191, 'api-token', '73e98c9ee88b43b4a453275351be107efb38818cc659fd9dd08a08e6c664ccb8', '[\"*\"]', '2023-08-21 12:14:09', '2023-08-14 11:47:55', '2023-08-21 12:14:09'),
(244, 'App\\Models\\Listuser', 256, 'api-token', '677a2752d1445a19475b63a54034520c764ebda77f62593bd25a519ccb2ae644', '[\"*\"]', '2023-08-18 07:37:43', '2023-08-18 07:32:54', '2023-08-18 07:37:43'),
(245, 'App\\Models\\Listuser', 277, 'api-token', '6b799dd8922db877e8014196bb2821e3fb88fa3355567b8e5ed86345121cabf1', '[\"*\"]', NULL, '2023-08-19 01:21:40', '2023-08-19 01:21:40'),
(246, 'App\\Models\\Listuser', 191, 'api-token', '0aeca793fd74bdbd445d6316e6f3deec5602c1ec45f91f7081d1aa03d3d4815e', '[\"*\"]', '2023-08-21 12:14:27', '2023-08-21 12:14:26', '2023-08-21 12:14:27'),
(247, 'App\\Models\\Listuser', 239, 'api-token', '8f32ff80f5aee29111f38b35dc484dd7f03531989e0d5dc0b3f8c82ff9d1a09b', '[\"*\"]', '2023-08-27 06:28:20', '2023-08-23 06:59:48', '2023-08-27 06:28:20'),
(248, 'App\\Models\\Listuser', 278, 'api-token', 'a5bb3f8209caf0c16b0135da3ad352eb8bb9cb0de3289f3c4365c8372bab3d96', '[\"*\"]', '2023-08-23 16:28:49', '2023-08-23 15:38:28', '2023-08-23 16:28:49'),
(249, 'App\\Models\\Listuser', 256, 'api-token', '66194741335255daad7ba3373544212d3b91b2ec10fdd14a7c83c2d72cc4eab1', '[\"*\"]', '2023-08-24 19:19:11', '2023-08-24 19:14:24', '2023-08-24 19:19:11'),
(250, 'App\\Models\\Listuser', 142, 'api-token', '2a0d43852e27d92b9ea1c745bf78e7f6484cd4d1be737af3f15dc1c2b3283689', '[\"*\"]', '2023-08-27 06:21:23', '2023-08-27 05:48:57', '2023-08-27 06:21:23'),
(251, 'App\\Models\\Listuser', 142, 'api-token', '21ed3c49eec8f44ea50608c651127849a62814605c0bb3bd79912bcc605f7d01', '[\"*\"]', '2023-08-27 15:15:19', '2023-08-27 06:26:46', '2023-08-27 15:15:19'),
(252, 'App\\Models\\Listuser', 142, 'api-token', '71d094baaab85cd342a6af95b02693f07a30b3d7a780d0f80fa2924d56014a44', '[\"*\"]', '2023-08-27 06:31:08', '2023-08-27 06:30:40', '2023-08-27 06:31:08'),
(253, 'App\\Models\\Listuser', 142, 'api-token', 'cd13530e955b91caa5476dd8997430f83c7e4fb3c5ca2f251b89d95342c19efa', '[\"*\"]', '2023-08-27 07:57:00', '2023-08-27 07:41:19', '2023-08-27 07:57:00'),
(254, 'App\\Models\\Listuser', 266, 'api-token', '68475150e07d2babcacc8d6d817f62e5c2283a7ea1417446df1eb3460c48c11b', '[\"*\"]', '2023-08-28 11:52:24', '2023-08-27 08:58:24', '2023-08-28 11:52:24'),
(255, 'App\\Models\\Listuser', 142, 'api-token', 'ac0f0944f8543d7a59035654ae7bd6c8d27c10652854450c8ead6e381ccdd598', '[\"*\"]', '2023-08-29 04:15:03', '2023-08-28 11:52:44', '2023-08-29 04:15:03'),
(256, 'App\\Models\\Listuser', 142, 'api-token', '8ecbd4397227d2ef4cce7f61a323efa4024616dff0c90cebec48e31edbf43090', '[\"*\"]', '2023-08-28 12:01:35', '2023-08-28 11:53:52', '2023-08-28 12:01:35'),
(257, 'App\\Models\\Listuser', 256, 'api-token', 'affc387ae36abd5c831b36f22c8cf47b394b1c07e276f86323ffe98ee2e0003c', '[\"*\"]', '2023-09-01 11:01:38', '2023-09-01 10:55:57', '2023-09-01 11:01:38'),
(258, 'App\\Models\\Listuser', 256, 'api-token', '20e4a3503fdfdd3823bee96757a19d3c36792e682eb4d17ee9c32fd7ea804594', '[\"*\"]', '2023-09-08 20:40:41', '2023-09-08 20:35:14', '2023-09-08 20:40:41'),
(259, 'App\\Models\\Listuser', 256, 'api-token', '4801d8f60c3756c90921dcff64f1978e79e1d4cfeaebb221813df67300980009', '[\"*\"]', '2023-09-16 09:34:45', '2023-09-16 09:28:25', '2023-09-16 09:34:45'),
(260, 'App\\Models\\Listuser', 256, 'api-token', '0551916441bd806f7f7f0d24f547d680647a019df2760aa648ec04a0cf46d603', '[\"*\"]', '2023-09-24 20:31:41', '2023-09-24 20:25:34', '2023-09-24 20:31:41'),
(261, 'App\\Models\\Listuser', 245, 'api-token', '4db73f83e4fa6c1b14cc1c6825b57c89b0194efd1d23b75915405875db962ced', '[\"*\"]', '2023-10-01 18:09:32', '2023-10-01 18:08:45', '2023-10-01 18:09:32'),
(262, 'App\\Models\\Listuser', 256, 'api-token', '6885a7cac2cca0a553bb7a4be52239951c9560f5ad3e2199613a64a4370a617b', '[\"*\"]', '2023-10-04 11:35:36', '2023-10-04 11:29:58', '2023-10-04 11:35:36'),
(263, 'App\\Models\\Listuser', 256, 'api-token', '492b47441f9f4e228bee9e0a0f8a9a9d4e62fa7266333bd0da1f80480f9c19e8', '[\"*\"]', '2023-10-13 09:34:08', '2023-10-13 09:28:15', '2023-10-13 09:34:08'),
(264, 'App\\Models\\Listuser', 256, 'api-token', '2fef49b9359adb089ec925a29d83a4c3dc0fe71e9c50cf556b4242c0ac3e9097', '[\"*\"]', '2023-10-23 10:36:43', '2023-10-23 10:30:55', '2023-10-23 10:36:43'),
(265, 'App\\Models\\Listuser', 256, 'api-token', '88fa71cf7d9b65229f4acf7c4680de206923dcfa2e3ba7739da7c17d1bafe5bb', '[\"*\"]', '2023-11-21 13:09:54', '2023-11-21 13:04:20', '2023-11-21 13:09:54'),
(266, 'App\\Models\\Listuser', 256, 'api-token', '8545c6ed6a8d029d06326cea6193748e815a58acee2c76f6220a56d72142985a', '[\"*\"]', '2023-12-18 14:48:57', '2023-12-18 14:43:10', '2023-12-18 14:48:57'),
(267, 'App\\Models\\Listuser', 266, 'api-token', 'a121218bcf48cfb114d3db0b7c03bc99b1b649bb7d13448aeeef1c419d7dd375', '[\"*\"]', '2024-03-05 05:01:10', '2023-12-19 05:56:11', '2024-03-05 05:01:10');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(268, 'App\\Models\\Listuser', 256, 'api-token', '237469f46e6c06a49890a4feb4b0bcd5de2203b38b7d494abeed9df68747477b', '[\"*\"]', '2023-12-26 14:17:11', '2023-12-26 14:11:14', '2023-12-26 14:17:11'),
(269, 'App\\Models\\Listuser', 256, 'api-token', '9724d3896f9828f0d697582aefc963ab87df62a58d1bd4d55de4102998c6cd8e', '[\"*\"]', '2024-01-31 12:33:04', '2024-01-31 12:27:26', '2024-01-31 12:33:04'),
(270, 'App\\Models\\Listuser', 256, 'api-token', '873bf6f7703aa66c1cc70fb1648acf5ee9ee9d4822475b9afe080e9346231529', '[\"*\"]', '2024-02-08 15:49:18', '2024-02-08 15:43:06', '2024-02-08 15:49:18'),
(271, 'App\\Models\\Listuser', 256, 'api-token', '745f6b02c9053c65069919473402200e76c0d349d76a8a2936a7eb61bc0d90eb', '[\"*\"]', '2024-02-20 12:16:05', '2024-02-20 12:10:37', '2024-02-20 12:16:05'),
(272, 'App\\Models\\Listuser', 256, 'api-token', '0aeb30ee73ff4a9295821cb2d5ba50f54383241ad45c8936aaf9f0cb8d1bac96', '[\"*\"]', '2024-02-20 12:46:24', '2024-02-20 12:39:35', '2024-02-20 12:46:24'),
(273, 'App\\Models\\Listuser', 279, 'api-token', '0bd1dd850fe156759e438cc0e7bc1b35ca2434c0da126437e74de9a27110e56e', '[\"*\"]', '2024-03-17 00:36:47', '2024-03-13 23:28:29', '2024-03-17 00:36:47');

-- --------------------------------------------------------

--
-- Table structure for table `places`
--

CREATE TABLE `places` (
  `id` int(11) UNSIGNED NOT NULL,
  `placeName` varchar(200) NOT NULL,
  `mobile` varchar(100) NOT NULL,
  `business_owner_type` varchar(10) DEFAULT 'owner',
  `business_owner_name` varchar(255) DEFAULT NULL,
  `location` varchar(200) NOT NULL,
  `longitude` varchar(100) DEFAULT NULL,
  `lattitude` varchar(100) DEFAULT NULL,
  `ratings` varchar(100) DEFAULT '0',
  `services` varchar(200) DEFAULT NULL,
  `website` varchar(200) NOT NULL,
  `image` varchar(500) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `address` varchar(200) DEFAULT NULL,
  `marketing_phone` varchar(201) NOT NULL,
  `marketing_email` varchar(201) NOT NULL,
  `marketing_name` varchar(201) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `email` varchar(200) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `streetname` varchar(50) NOT NULL,
  `streetnumber` varchar(50) NOT NULL,
  `zipcode` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `landmark` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `places`
--

INSERT INTO `places` (`id`, `placeName`, `mobile`, `business_owner_type`, `business_owner_name`, `location`, `longitude`, `lattitude`, `ratings`, `services`, `website`, `image`, `description`, `status`, `address`, `marketing_phone`, `marketing_email`, `marketing_name`, `created_at`, `updated_at`, `email`, `password`, `streetname`, `streetnumber`, `zipcode`, `city`, `landmark`) VALUES
(1, 'Dominos', '9878125064', 'owner', NULL, 'Palm Springs', '-116.54694031023222', '33.837465931330385', '4.0', 'Italian,Pizza', 'https://pizza.dominos.com/california/palm-springs/', 'http://beautyliciousnj.com/happyhours/public/place/52380.png', 'Order pizza delivery & takeout in Palm Springs, CA. Call Domino\'s for pizza and food delivery in Palm Springs. Order pizza, wings, sandwiches, salads and much more', 1, '425 S Sunrise Way STE H9, Palm Springs, CA 92262, United States', '9878125064', 'guestcaredominos@jublfood.com', 'Gurman', '2023-01-09 23:24:54', '2023-05-14 18:46:15', 'dominos@jublfood.com', '$2y$10$Vx34XPjMMDJFyXnD2CSyve0FuuHYMppakIHU3myHTi5glgKF07mYG', '', '', '', '', NULL),
(2, 'Apong\'s Philly Steak', '7607700229', 'owner', NULL, 'Cathedral City', '-116.46772790675563', '33.7855440852395', '2.5', 'Non-veg,Drinks', 'https://apongsphillysteak.com/', 'http://beautyliciousnj.com/happyhours/public/place/19436.png', 'We are the only local shop serving authentic Philly-style cheese steaks on Amoroso bread. We also serve authentic Filipino cuisine to excite your taste buds.', 1, '68444 Perez Rd STE N, Cathedral City, CA 92234', '7607700229', 'supportapongsphillysteak@yahoo.com', 'Gurman', '2023-01-09 23:45:38', '2023-01-25 10:32:14', 'Apongsphillysteak@yahoo.com', '$2y$10$2p9xn2UCoKxf2VB.LldEK.fok/n1gw0y49nBtdH62spa6xQjBuB7K', '', '', '', '', NULL),
(3, 'Yard House', '7607791415', 'owner', NULL, 'Rancho Mirage', '-116.40876500400472', '33.739697828723486', '5.0', 'Bar,Happy hour,Pub', 'https://www.yardhouse.com/locations/ca/rancho-mirage/rancho-mirage-the-river/8304?cmpid=br:yh_ag:ie_ch:dry_ca:YHGMB_sn:gmb_gt:rancho-mirage-ca-8304_pl:locurl_rd:1004', 'http://beautyliciousnj.com/happyhours/public/place/17151.jpg', 'If you\'re looking for the best variety of beer and the only late night food in the valley, look no further than the Yard House located in Rancho Mirage in the River Mall. To experience innovative cuisines from our amazing scratch kitchen and our wide selection of beers, visit our Yard House location at 71800 Highway 111!', 1, '71800 Highway 111 Space B-101 Rancho Mirage, CA 92270', '7607791415', 'suppurtyard@gmail.com', 'Gurman', '2023-01-10 00:02:14', '2023-01-10 00:12:36', 'yard@gmail.com', '$2y$10$RLUwuWWo1NEkvHuKVqKMkOeR3VhzG4NAx54eshniH/yhAK6xW.FkG', '', '', '', '', NULL),
(4, '19th Hole', '7607726696', 'owner', NULL, 'Palm Desert', '-116.30527955924362', '33.74197681358173', '2.7', 'Tasty Food,Live Events,Happy Hour', 'https://19thholepd.com/', 'http://beautyliciousnj.com/happyhours/public/place/34067.png', 'The 19th Hole is Palm Desert’s original bar. Open 7 days a week,, locals and visitors to the Coachella Valley know: The 19th Hole is the stop for tasty food, great drinks, and good times in the desert.', 0, '42305 Washington St A, Palm Desert, CA 92211', '7607726696', 'support19hole@gmail.com', 'Gurman', '2023-01-10 00:19:00', '2023-06-16 22:32:53', '19hole@gmail.com', '$2y$10$0XCibtFQQN7YfZD5bl5Va.b/Kp/xErTBwFEjV1xHGN0YROV4Loseq', '', '', '', '', NULL),
(5, 'Five Guys', '7607719300', 'owner', NULL, 'La Quinta', '-116.29584420342972', '33.74302817098311', '5.0', 'Fast food,Pickup,Dine-in,Delivery', 'https://restaurants.fiveguys.com/78-445-highway-111', 'http://beautyliciousnj.com/happyhours/public/place/9793.jpg', 'Welcome to your local Five Guys at 78-445 Highway 111 in La Quinta. With more than 250,000 ways to customize your burger and more than 1,000 milkshake combinations, your perfect meal is just a click away! Whether it’s using fresh ground beef (there are no freezers in our restaurants), double-cooking our fries in 100 percent peanut oil, hand-preparing fresh ingredients every morning or serving peanuts while you wait, we strive to provide the best experience each and every time you visit.', 1, '78-445 Highway 111 La Quinta, CA 92253', '7607719300', 'john@fiveguys.com', 'john', '2023-01-11 14:16:37', '2023-05-13 20:21:22', 'support@fiveguys.com', '$2y$10$GCNtmX.f8p7RCUE7FC4NM.miTTojmAvY5dqTr3ICaKbjHr6SYf5uu', '', '', '', '', NULL),
(6, 'Barrel District', '7607993961', 'owner', NULL, 'Cathedral City', NULL, NULL, '0.8', 'Daily Happy Hour,$4 Beer and $5 Wine,9pm-12am,3-pm-6pm', 'http://mybusiness.com', 'http://beautyliciousnj.com/happyhours/public/place/70687.jpg', 'American traditional comfort food. Dancing and live bands on the weekends. \r\nHappy Hours Daily\r\n\r\nFri & Sat Dancing and DJ \r\n9:00pm-2:00am\r\n\r\nKaraoke\r\nThursay 7:00-10:00pm', 1, '123 Bar St', '7607993961', 'sales@happyhourguideofthedesert.com', 'Cat', '2023-01-18 14:38:30', '2023-08-14 12:07:33', 'sales@happyhourguideofthedesert.com', '$2y$10$5FW0u3mo7epPYJEmyRdueOgDl/u0iHfcXzrTLjsqJkMcpP6gzSP2e', '', '', '', '', NULL),
(7, 'The Living Desert Zoo and Garden', '7603465694', 'owner', NULL, 'Cathedral City', '-116.30144119262695', '33.10060160229781', '2.5', 'Wildlife,Travel,Environment', 'https://www.livingdesert.org/', 'http://beautyliciousnj.com/happyhours/public/place/66574.png', 'The Living Desert Zoo and Gardens is a nonprofit, accredited member of the Association of Zoos and Aquariums, ensuring the highest standards of all aspects of animal care, education, conservation, public service, and operations. The Zoo is active in conservation research, habitat protection, breedin', 1, '13 koka-kurud Indian Wells  490023', '7867867864', 'rashadkhan351@gmail.com', 'Rashad', '2023-01-19 14:20:30', '2023-05-22 14:30:31', 'livingdesert@gmail.com', '$2y$10$pinWHV/srNS/VzSJ6S4QWO02zvGOjnmzbtAjLDSbuHNp1LVkhryge', 'koka-kurud', '13', '490023', 'Indian Wells', NULL),
(10, 'Zephr Kinney', '7655432345', 'owner', NULL, 'Rancho Mirage', '-116.3881303984375', '33.75797570510451', '0', 'Illum nesciunt qui', 'https://www.megu.ca', 'http://beautyliciousnj.com/happyhours/public/place/4642.jpg', 'Dolor est vitae rec', 1, 'bolyq@mailinator.com', '8765432190', 'siromacex@mailinator.com', 'Lana Rivera', '2023-01-19 18:28:56', '2023-05-13 20:21:12', 'nocahafy@mailinator.com', '$2y$10$Y0ZQm5VkiKWhtpynYlHwt.xBCoy0LHJk0FToSSANKuSyfj4pIwtLe', '', '', '', '', NULL),
(11, 'Pizza Hut', '7769889013', 'owner', NULL, 'Cathedral City', '74.254879208015', '16.810176520061027', '0', 'Italian,Pizza', 'https://www.pizzahut.co.in/account/otp', 'http://beautyliciousnj.com/happyhours/public/place/20586.jpg', 'dafasfadsfafadsfadsfadfafadsfaf', 1, 'kolhapur maharashtra', '8766863940', 'saurabhkumbhar718@gmail.com', 'sasdas', '2023-01-25 17:14:03', '2023-05-13 20:21:01', 'saurabhkumbhar187@gmail.com', '$2y$10$V.GmL8VWwPZIXF3aNx1nUec0cdmZM451f1CEhik1Ty0jsTtlNR8C6', '', '', '', '', NULL),
(13, 'Testing', '7769889012', 'owner', 'Saurabh', 'Palm Springs', '-100.69883095669243', '31.158428579028595', '0.0', 'Testing purpose', 'www.pizzahut.com', 'http://beautyliciousnj.com/happyhours/public/place/89126.jpg', 'Testing', 1, 'Plot no 423 Ayodhya Colony Palm Springs Near Hill Station 416001', '8766863942', 'dassad@gmail.com', NULL, '2023-03-21 23:08:30', '2023-05-24 04:37:15', 'Testing1@gmail.com', '$2y$10$KwDvb/zmXm.bA7RICLWPueKUaE44F8s9W.OwRZB9RHmS0RiIPBDZS', 'Ayodhya Colony', 'Plot no 423', '416001', 'Palm Springs', 'Near Hill Station'),
(15, 'Cat Bar', '7603271422', 'manager', 'Cat Cece', 'Cathedral City', NULL, NULL, '4.0', 'Live Band-Thursday from 6-10pm', 'www.lagrandecatering.com', 'http://beautyliciousnj.com/happyhours/public/place/13671.JPG', 'This is a hip place to dance and enjoy dancing and listen to music.', 1, '123 B street Cathedral City  92234', '7603469425', 'catbarmarketing@mailinator.com', NULL, '2023-03-23 11:32:08', '2023-05-22 23:44:40', 'catbar@mailinator.com', '$2y$10$zV8rmLSRFWcE.dCwAnWUO.Vy/ovsqFT99l3iMBr0wMuA1ImB9p.ZK', 'B street', '123', '92234', 'Cathedral City', NULL),
(16, 'Testing', '+917769889012', 'owner', 'Saurabh', 'Cathedral City', '-111.52607896591178', '36.91196317134604', '2.5', '', 'www.happyhour.com', 'http://beautyliciousnj.com/happyhours/public/place/89328.jpeg', 'assd', 1, 'Plot no 423 Ayodhya Colony Palm Springs Near Hill Station 416001', '+918766863944', 'saurabhkumbhar7118@gmail.com', NULL, '2023-04-17 22:08:46', '2023-05-23 04:15:00', 'admivvn@gmail.com', '$2y$10$Uhn.eSXKmLOZ/Gv42fE5lupOI.fBA7moET4qXQfpsy70si3a2wBIu', 'Ayodhya Colony', 'Plot no 423', '416001', 'Palm Springs', 'Near Hill Station'),
(18, 'Rizwan N Sayyednavar', '7338614460', 'manager', 'cxczxc', 'Cathedral City', NULL, NULL, '0', '', 'www.ddhshkdh.com', 'http://beautyliciousnj.com/happyhours/public/place/67975.JPG', 'fsdasdasdasd', 1, 'shivaganga nagar kamti plot murghamath dharwad Shivanganga nagar first colony Coachella bvxcvxcv 580001', '9844843410', 'rarpaas@gmail.com', 'gulmohar', '2023-04-27 22:07:38', '2023-05-22 14:30:28', 'admin@gmail.com', '$2y$10$k6li8KfcnVh2XZ0tWa9LA.B.PsVudu6NjhDkce671jdD0ek4ary0a', 'Shivanganga nagar first colony', 'shivaganga nagar kamti plot murghamath dharwad', '580001', 'Coachella', 'bvxcvxcv'),
(19, 'TaShya Dickerson', '1234567898', 'owner', 'Nicole Norman', 'Cathedral City', NULL, NULL, '0', '', 'https://www.jyxaceturucejed.net', 'http://beautyliciousnj.com/happyhours/public/place/80157.png', 'Voluptatum natus provident eu laudantium quas elit dolore voluptas voluptate est ea quibusdam incidunt cillum voluptatem sunt', 1, '477 Alvin Sosa Palm Springs Aperiam provident v 86884', '1234567898', 'vifomybego@mailinator.com', 'Odysseus Grant', '2023-05-13 13:20:58', '2023-05-13 13:20:58', 'savebefo@mailinator.com', '$2y$10$geMJGN.Advv5t.Lh3ATxluEDKrZtVdBRHPqiruE5OJruElWaRDEkq', 'Alvin Sosa', '477', '86884', 'Palm Springs', 'Aperiam provident v');

-- --------------------------------------------------------

--
-- Table structure for table `place_categories`
--

CREATE TABLE `place_categories` (
  `id` int(100) UNSIGNED NOT NULL,
  `category_id` int(20) UNSIGNED NOT NULL,
  `places_id` int(11) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `place_categories`
--

INSERT INTO `place_categories` (`id`, `category_id`, `places_id`, `created_at`, `updated_at`) VALUES
(1, 6, 1, '2023-01-09 16:24:54', '2023-01-09 16:24:54'),
(2, 7, 1, '2023-01-09 16:24:54', '2023-01-09 16:24:54'),
(4, 6, 2, '2023-01-09 16:45:38', '2023-01-09 16:45:38'),
(5, 7, 2, '2023-01-09 16:45:38', '2023-01-09 16:45:38'),
(6, 19, 2, '2023-01-09 16:45:38', '2023-01-09 16:45:38'),
(7, 21, 2, '2023-01-09 16:45:38', '2023-01-09 16:45:38'),
(8, 20, 3, '2023-01-09 17:02:14', '2023-01-09 17:02:14'),
(10, 32, 3, '2023-01-09 17:02:14', '2023-01-09 17:02:14'),
(11, 33, 3, '2023-01-09 17:02:14', '2023-01-09 17:02:14'),
(12, 3, 4, '2023-01-09 17:19:00', '2023-01-09 17:19:00'),
(13, 4, 4, '2023-01-09 17:19:00', '2023-01-09 17:19:00'),
(14, 8, 4, '2023-01-09 17:19:00', '2023-01-09 17:19:00'),
(15, 13, 4, '2023-01-09 17:19:00', '2023-01-09 17:19:00'),
(16, 32, 4, '2023-01-09 17:19:00', '2023-01-09 17:19:00'),
(19, 5, 5, '2023-01-12 16:21:55', '2023-01-12 16:21:55'),
(20, 19, 5, '2023-01-12 16:21:55', '2023-01-12 16:21:55'),
(21, 32, 5, '2023-01-12 16:21:55', '2023-01-12 16:21:55'),
(34, 3, 6, '2023-01-18 07:50:42', '2023-01-18 07:50:42'),
(35, 4, 6, '2023-01-18 07:50:42', '2023-01-18 07:50:42'),
(36, 9, 6, '2023-01-18 07:50:42', '2023-01-18 07:50:42'),
(38, 32, 6, '2023-01-18 07:50:42', '2023-01-18 07:50:42'),
(66, 4, 10, '2023-01-19 11:28:56', '2023-01-19 11:28:56'),
(67, 6, 10, '2023-01-19 11:28:56', '2023-01-19 11:28:56'),
(68, 9, 10, '2023-01-19 11:28:56', '2023-01-19 11:28:56'),
(69, 12, 10, '2023-01-19 11:28:56', '2023-01-19 11:28:56'),
(70, 13, 10, '2023-01-19 11:28:56', '2023-01-19 11:28:56'),
(72, 32, 10, '2023-01-19 11:28:56', '2023-01-19 11:28:56'),
(121, 4, 11, '2023-02-08 12:53:01', '2023-02-08 12:53:01'),
(122, 5, 11, '2023-02-08 12:53:01', '2023-02-08 12:53:01'),
(123, 7, 11, '2023-02-08 12:53:01', '2023-02-08 12:53:01'),
(131, 4, 13, '2023-03-21 16:08:30', '2023-03-21 16:08:30'),
(137, 7, 15, '2023-03-23 05:07:41', '2023-03-23 05:07:41'),
(138, 19, 15, '2023-03-23 05:07:41', '2023-03-23 05:07:41'),
(140, 32, 15, '2023-03-23 05:07:41', '2023-03-23 05:07:41'),
(141, 3, 16, '2023-04-17 15:08:46', '2023-04-17 15:08:46'),
(143, 4, 18, '2023-04-27 15:07:38', '2023-04-27 15:07:38'),
(144, 4, 19, '2023-05-13 06:20:58', '2023-05-13 06:20:58'),
(145, 8, 19, '2023-05-13 06:20:58', '2023-05-13 06:20:58'),
(146, 21, 19, '2023-05-13 06:20:58', '2023-05-13 06:20:58'),
(148, 32, 19, '2023-05-13 06:20:58', '2023-05-13 06:20:58'),
(149, 33, 19, '2023-05-13 06:20:58', '2023-05-13 06:20:58'),
(207, 3, 7, '2023-05-31 16:52:49', '2023-05-31 16:52:49'),
(208, 4, 7, '2023-05-31 16:52:49', '2023-05-31 16:52:49'),
(209, 7, 7, '2023-05-31 16:52:49', '2023-05-31 16:52:49'),
(210, 8, 7, '2023-05-31 16:52:49', '2023-05-31 16:52:49'),
(211, 9, 7, '2023-05-31 16:52:49', '2023-05-31 16:52:49');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `placeId` varchar(100) NOT NULL,
  `userId` varchar(200) NOT NULL,
  `rating` varchar(100) NOT NULL,
  `message` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `placeId`, `userId`, `rating`, `message`, `created_at`, `updated_at`) VALUES
(1, '3', '122', '5.0', 'Highly recommended', '2023-01-10 00:12:36', '2023-01-10 00:12:36'),
(2, '4', '142', '2.5', 'good', '2023-01-11 12:38:17', '2023-01-11 12:38:17'),
(3, '5', '122', '5.0', 'good', '2023-01-11 15:26:23', '2023-01-11 15:26:23'),
(4, '2', '1', '5', 'kya baat hai, maza aagaya!!', '2023-01-12 23:39:40', '2023-01-12 23:39:40'),
(5, '4', '190', '0.0', 'huu', '2023-01-19 01:10:09', '2023-01-19 01:10:09'),
(6, '6', '120', '4', 'Good', '2023-01-22 22:22:40', '2023-01-22 22:22:40'),
(7, '2', '193', '0.0', 'it\'s a wonderful place', '2023-01-25 10:32:14', '2023-01-25 10:32:14'),
(8, '1', '131', '4', 'Good to visit', '2023-01-25 14:41:11', '2023-01-25 14:41:11'),
(9, '6', '142', '0.0', 'awesome', '2023-01-25 18:51:32', '2023-01-25 18:51:32'),
(10, '4', '132', '4.5', 'The place is too good', '2023-03-24 04:38:36', '2023-03-24 04:38:36'),
(11, '6', '132', '4.5', 'ho', '2023-04-17 15:16:42', '2023-04-17 15:16:42'),
(12, '4', '238', '4', 'Good review', '2023-05-16 01:35:14', '2023-05-16 01:35:14'),
(13, '7', '239', '0.0', 'Loved this place ❤❤❤❤', '2023-05-18 14:00:50', '2023-05-18 14:00:50'),
(14, '7', '239', '5.0', 'Awesome place to be', '2023-05-18 14:01:13', '2023-05-18 14:01:13'),
(15, '4', '191', '5.0', 'Good', '2023-05-18 17:05:19', '2023-05-18 17:05:19'),
(17, '15', '208', '4', 'Nice place to visit', '2023-05-22 23:44:40', '2023-05-22 23:44:40'),
(19, '16', '239', '5.0', 'good', '2023-05-23 04:14:45', '2023-05-23 04:14:45'),
(20, '16', '239', '0.0', 'bad', '2023-05-23 04:15:00', '2023-05-23 04:15:00'),
(21, '4', '239', '0.0', 'bad', '2023-05-24 04:33:33', '2023-05-24 04:33:33'),
(22, '6', '239', '0.0', 'bad', '2023-05-24 04:34:13', '2023-05-24 04:34:13'),
(23, '6', '239', '0.0', 'bad', '2023-05-24 04:34:20', '2023-05-24 04:34:20'),
(24, '6', '239', '0.0', 'bad', '2023-05-24 04:34:25', '2023-05-24 04:34:25'),
(25, '6', '239', '0.0', 'bad', '2023-05-24 04:34:59', '2023-05-24 04:34:59'),
(26, '6', '239', '0.0', 'bad', '2023-05-24 04:35:05', '2023-05-24 04:35:05'),
(27, '6', '239', '0.0', 'bad', '2023-05-24 04:35:27', '2023-05-24 04:35:27'),
(28, '6', '239', '0.0', 'bad', '2023-05-24 04:35:32', '2023-05-24 04:35:32'),
(29, '6', '239', '0.0', 'bad', '2023-05-24 04:35:36', '2023-05-24 04:35:36'),
(30, '6', '239', '0.0', 'soamming bad', '2023-05-24 04:35:47', '2023-05-24 04:35:47'),
(31, '6', '239', '0.0', 'bad', '2023-05-24 04:36:05', '2023-05-24 04:36:05'),
(32, '6', '239', '0.0', 'spamming bad', '2023-05-24 04:36:12', '2023-05-24 04:36:12'),
(33, '6', '239', '0.0', 'spamming bad', '2023-05-24 04:36:21', '2023-05-24 04:36:21'),
(34, '6', '239', '0.0', 'spamming bad', '2023-05-24 04:36:31', '2023-05-24 04:36:31'),
(35, '13', '239', '0.0', 'bad', '2023-05-24 04:37:15', '2023-05-24 04:37:15'),
(36, '6', '191', '5.0', 'Good place', '2023-08-14 12:07:33', '2023-08-14 12:07:33');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(100) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `password` varchar(200) NOT NULL,
  `imagePath` varchar(200) DEFAULT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `otp` int(11) DEFAULT NULL,
  `provider_id` varchar(500) DEFAULT NULL,
  `token` varchar(200) DEFAULT NULL,
  `provider_name` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstName`, `lastName`, `email`, `mobile`, `password`, `imagePath`, `dateOfBirth`, `created_at`, `updated_at`, `otp`, `provider_id`, `token`, `provider_name`) VALUES
(1, 'Ashutosh', 'Chauhan', 'ashutosh@gmail.com', '8468921900', 'ashutosh123', 'http://beautyliciousnj.com/happyhours/public/profileImage/1661451087.jpg', '2001-11-11', '2022-07-06 01:15:59', '2022-08-25 18:11:27', NULL, NULL, NULL, NULL),
(2, 'Ashutosh', 'Chauhan', 'ashutoshchauhan129@gmail.com', '8468921900', 'ashutosh123', 'http://beautyliciousnj.com/happyhours/public/profileImage/1669376282.jpg', '2001-11-11', '2022-07-06 01:46:29', '2022-11-25 13:03:03', 8668, NULL, NULL, NULL),
(3, 'Saif', 'Khan', 'saif@gmail.com', '8468921523', 'saifkhan', NULL, '2001-11-11', '2022-07-06 04:50:07', '2022-07-06 04:50:07', NULL, NULL, NULL, NULL),
(4, 'demmo', 'singh', 'demo@gmail.com', '123456798', 'demo123123', NULL, '2003-12-12', '2022-07-07 00:13:39', '2022-07-07 00:13:39', NULL, NULL, NULL, NULL),
(5, 'demmo', 'singh', 'demo@gmail.com', '123456798', 'demo123123', NULL, '2003-12-12', '2022-07-07 03:07:53', '2022-07-07 03:07:53', NULL, NULL, NULL, NULL),
(6, 'jsjsj', 'jzjsjs', 'jsjsjj', 'nznzj', 'jzjzjs', NULL, '2022-12-12', '2022-07-07 06:02:48', '2022-07-07 06:02:48', NULL, NULL, NULL, NULL),
(7, 'kalash', 'sonker', 'kalashsonker22@gmail.com', '18192992', '123', NULL, '2022-01-16', '2022-07-07 06:05:47', '2022-07-07 06:05:47', NULL, NULL, NULL, NULL),
(9, 'ahhw', 'hahha', 'babab', 'bhsbaha', 'babsb', NULL, '2022-03-12', '2022-07-08 02:05:30', '2022-07-08 02:05:30', NULL, NULL, NULL, NULL),
(10, 'kalash', 'Sonker', 'kalashsonker9@gmail.com', '012345678', '456', 'http://beautyliciousnj.com/happyhours/public/profileImage/1659971447.jpg', '2022-06-07', '2022-07-08 03:00:59', '2022-08-31 07:04:47', 7227, NULL, NULL, NULL),
(11, 'kalash', 'sonker', 'kalashsonker19@gmail.com', '9292993', '123', NULL, '2022-03-03', '2022-07-10 22:24:19', '2022-07-10 22:24:19', NULL, NULL, NULL, NULL),
(12, 'demmo', 'singh', 'demo1@gmail.com', '1234567981', 'demo123123', NULL, '2003-12-12', '2022-07-23 06:47:56', '2022-07-23 06:47:56', NULL, NULL, NULL, NULL),
(13, 'Ashutosh', 'Chauhan', 'aashutosh.quantum@gmail.com', '7838066278', 'asdfghhj', 'http://beautyliciousnj.com/happyhours/public/profileImage/1658625642.jpg', '2001-11-11', '2022-07-23 07:48:21', '2022-11-25 13:02:41', 64, NULL, NULL, NULL),
(15, 'Vikas', 'soni', 'Vikassoni@gmail.com', '9996333823', 'Vikas123@', 'http://beautyliciousnj.com/happyhours/public/profileImage/1659513405.jpg', '1999-05-05', '2022-07-24 22:14:15', '2022-08-07 05:10:41', NULL, NULL, NULL, NULL),
(16, 'vikas', 'soni', 'vikassoni1@gmail.com', '8977886545', 'Vikas123', NULL, '1999-05-05', '2022-07-24 22:15:51', '2022-07-24 22:15:51', NULL, NULL, NULL, NULL),
(17, 'vikas', 'soni', 'Vikasssoni@gmail.com', 'bsjnfnns', 'Vikas123', NULL, '1999-05-06', '2022-07-25 00:12:20', '2022-07-25 00:12:20', NULL, NULL, NULL, NULL),
(18, 'vjj', 'xgg', 'dhhj', '7755', 'bhh', NULL, '1999-05-06', '2022-07-25 02:57:21', '2022-07-25 02:57:21', NULL, NULL, NULL, NULL),
(20, 'test', 'test', 'test@test.com', '8912345677', 'hello', 'http://beautyliciousnj.com/happyhours/public/profileImage/1659356156.jpeg', '2000-01-01', '2022-08-01 05:13:18', '2022-08-01 12:15:56', NULL, NULL, NULL, NULL),
(21, 'Hey', 'Heyy', 'hey@hey.com', '67546543', '123', NULL, '2000-12-10', '2022-08-01 20:12:11', '2022-08-19 08:24:04', 4687, NULL, NULL, NULL),
(23, 'vikas', 'soni', 'vikassoniiii@gmail.com', '777777777777777777777777777', 'vikas123', NULL, '2022-08-19', '2022-08-02 23:26:17', '2022-08-02 23:26:17', NULL, NULL, NULL, NULL),
(24, 'vikassoni', 'soni', 'vikassonii@gmail.com', 'Kdiiiieiieki', 'Vikas123', NULL, '1999-05-05', '2022-08-03 01:00:07', '2022-08-03 01:00:07', NULL, NULL, NULL, NULL),
(25, 'soni', 'vikas', 'vikassoni20189@gmail.com', 'dhjjjdjd', 'Vikas123@', NULL, '1999-05-05', '2022-08-03 01:02:20', '2022-08-03 01:02:20', NULL, NULL, NULL, NULL),
(26, 'soni', 'fgh', 'Vikassoni20186@gmail.com', '9996333825', 'Vikas123', 'http://beautyliciousnj.com/happyhours/public/profileImage/1659514186.jpg', '1999-05-05', '2022-08-03 01:04:21', '2022-08-03 08:09:46', NULL, NULL, NULL, NULL),
(27, 'kalash', 'sonker', 'kalashsonker99@gmail.com', '0123456799', '123', NULL, '2022-03-03', '2022-08-04 01:36:02', '2022-08-04 01:36:02', NULL, NULL, NULL, NULL),
(28, 'kalash', 'sonker', 'kalashsonker999@gmail.com', '01239', '123', NULL, '2022-03-03', '2022-08-04 01:36:37', '2022-08-04 01:36:37', NULL, NULL, NULL, NULL),
(29, 'kalash', 'sonker', 'kalashsonker123@gmail.com', '123', '123', NULL, '2022-03-03', '2022-08-04 01:37:34', '2022-08-04 01:37:34', NULL, NULL, NULL, NULL),
(30, 'kalash', 'sonker', 'kalashsonker1234@gmail.com', '12345', '123', NULL, '2022-03-03', '2022-08-04 01:43:54', '2022-08-04 01:43:54', NULL, NULL, NULL, NULL),
(31, 'kala', 'sonker', 'kalashsonker8@gmail.com', '123456', '12345', 'http://beautyliciousnj.com/happyhours/public/profileImage/1659603647.jpg', '2022-03-03', '2022-08-04 01:45:23', '2022-08-04 09:00:47', NULL, NULL, NULL, NULL),
(32, 'vicky', 'son', 'vickysoni@gmail.com', '98887778677', 'Vikas123', 'http://beautyliciousnj.com/happyhours/public/profileImage/1660274701.jpg', '1999-05-05', '2022-08-04 05:41:50', '2022-08-12 03:25:01', NULL, NULL, NULL, NULL),
(33, 'vicky', 'verma', 'Vickyverma@gmail.com', '898989977987', 'Vikas123', NULL, '1999-05-05', '2022-08-04 06:02:23', '2022-08-04 06:02:23', NULL, NULL, NULL, NULL),
(34, 'vikas', 'soni', 'Vickyverma@yopmail.com', '789456313131', 'Vikas', NULL, '1999-05-05', '2022-08-04 06:04:06', '2022-08-04 06:04:06', NULL, NULL, NULL, NULL),
(35, 'vicky', 'verma', 'Vickyverma1@yopmail.com', '787987546543', 'Vikas', 'http://beautyliciousnj.com/happyhours/public/profileImage/1659618898.png', '1999-05-05', '2022-08-04 06:06:13', '2022-08-04 13:53:58', 8721, NULL, NULL, NULL),
(36, 'vikas', 'soni', 'soni@gmail.com', 'Vikas123@', 'Vikas123', 'http://beautyliciousnj.com/happyhours/public/profileImage/1659622863.png', '1999-05-05', '2022-08-04 06:56:20', '2022-08-04 14:21:03', NULL, NULL, NULL, NULL),
(37, 'demmo', 'singh', 'hr@gmail.com', '1234567982', 'demo123123', 'http://beautyliciousnj.com/happyhours/public/profileImage/1660673336.', '2003-12-12', '2022-08-04 11:12:59', '2022-08-16 18:08:56', NULL, NULL, NULL, NULL),
(38, 'vicky', 'soni', 'Vikcy@gmail.com', '4546465465465465', 'Vikas123', NULL, '2022-08-07', '2022-08-06 22:02:40', '2022-08-06 22:02:40', NULL, NULL, NULL, NULL),
(39, 'vikas', 'soni', 'Vickys@gmail.com', '789978887898', 'Vicky123', NULL, '1999-05-05', '2022-08-06 22:12:57', '2022-08-07 05:15:28', NULL, NULL, NULL, NULL),
(41, 'John', 'Joe', 'johnjoe@gmail.com', '0123456798', '123', NULL, '2022-03-12', '2022-08-08 07:30:19', '2022-08-08 07:30:19', NULL, NULL, NULL, NULL),
(42, 'john', 'doe', 'johndoe123@gmail.com', '0123456789', '12345', 'http://beautyliciousnj.com/happyhours/public/profileImage/1659972184.jpg', '1999-12-03', '2022-08-08 08:18:22', '2022-08-08 15:23:04', NULL, NULL, NULL, NULL),
(43, 'vikas', 'soni', 'Life@yopmail.com', '989697958998', 'Vikas123', 'http://beautyliciousnj.com/happyhours/public/profileImage/1660018610.jpg', '2022-08-09', '2022-08-08 21:04:48', '2022-08-09 04:16:50', NULL, NULL, NULL, NULL),
(44, 'demmo', 'singh', 'demo4@gmail.com', '1234567984', 'demo123123', NULL, '2003-12-12', '2022-08-09 10:00:38', '2022-08-09 10:00:38', NULL, NULL, NULL, NULL),
(45, 'demmo', 'singh', 'demo9@gmail.com', '1234567920', 'demo123123', NULL, '2003-12-12', '2022-08-09 10:00:54', '2022-08-09 10:00:54', NULL, NULL, NULL, NULL),
(46, 'demmo', 'singh', 'demo298@gmail.com', '9598542070', 'demo123123', NULL, '2003-12-12', '2022-08-09 10:01:24', '2022-08-09 10:01:24', NULL, NULL, NULL, NULL),
(47, 'Ashutosh', 'Chauhan', 'ashutoshchauhan129@gmail.com', '8468921900', '12345678', NULL, '2001-11-11', '2022-08-11 05:59:13', '2022-08-16 16:19:00', NULL, NULL, NULL, NULL),
(48, 'Nick', 'Jones', 'nick.jones123@gmail.com', '0123987654', '12345678', NULL, '1999-05-07', '2022-08-12 04:00:48', '2022-08-12 04:00:48', NULL, NULL, NULL, NULL),
(49, 'Abhishek', 'khot', 'jeamsb003@gmail.com', 'newuser007', 'NEW123456', 'http://beautyliciousnj.com/happyhours/public/profileImage/1662441045.png', '2001-12-09', '2022-08-16 03:19:17', '2022-09-09 09:43:10', 3144, NULL, NULL, NULL),
(50, 'vicky', 's', 'ss@gmail.com', '964967365994', 'Vikas123', 'http://beautyliciousnj.com/happyhours/public/profileImage/1661775252.jpg', '1999-05-05', '2022-08-19 08:30:53', '2022-08-29 12:14:12', NULL, NULL, NULL, NULL),
(52, 'bhavesh', 'jain', 'bhavesh@gmail.com', '762044846', '123456489', NULL, '1996-08-26', '2022-08-25 07:05:22', '2022-08-25 07:05:22', NULL, NULL, NULL, NULL),
(54, 'Bhavesh', 'Jain', 'bhaveshh@gmail.com', '7620444846', 'Bhavesh@12', NULL, '2022-08-30', '2022-08-29 21:54:03', '2022-08-29 21:54:03', NULL, NULL, NULL, NULL),
(55, 'vikas', 'soni', 'vik', 'v6', 'vikas123', 'http://beautyliciousnj.com/happyhours/public/profileImage/1663580237.jpg', '1999-05-02', '2022-09-01 04:28:42', '2022-09-19 09:37:48', NULL, NULL, NULL, NULL),
(56, '223555', '1255', 'vk', 'hhhh', 'aa', 'http://beautyliciousnj.com/happyhours/public/profileImage/1663158869.png', '2055-05-05', '2022-09-01 04:30:36', '2022-09-14 12:36:13', NULL, NULL, NULL, NULL),
(57, 'Sahil', 'Khan', 'sahil.alwar.sk@gmail.com', '8507893333', 'sahilkhan@1', NULL, '2001-10-07', '2022-09-05 04:25:58', '2022-11-04 05:37:32', 6671, NULL, NULL, NULL),
(58, 'Kalash', 'Sonker', 'kalashsonker989@gmail.com', '01234567698', '123', NULL, '2022-03-03', '2022-09-06 11:37:51', '2022-09-06 11:37:51', NULL, NULL, NULL, NULL),
(59, 'vi', 've', 'vik@gmail.com', '9996333725', 'Vikas123', 'http://beautyliciousnj.com/happyhours/public/profileImage/1662520222.jpg', '1999-05-05', '2022-09-06 20:03:58', '2022-09-07 03:13:47', NULL, NULL, NULL, NULL),
(60, 'swaraj', 'changole', 'swarajchangole.quantumit@gmail.com', '9404689585', 'Swaraj123', NULL, '1995-01-26', '2022-09-07 00:03:19', '2022-09-07 00:03:19', NULL, NULL, NULL, NULL),
(61, 'shubham', 'changole', 'swaraj.changole@gmail.com', '9175742019', 'Swaraj123', NULL, '1995-01-26', '2022-09-07 00:03:55', '2022-09-07 00:03:55', NULL, NULL, NULL, NULL),
(62, 'vikas', 'soni', 'sonii@gmail.com', '9996333828', 'Vikas123', 'http://beautyliciousnj.com/happyhours/public/profileImage/1662704709.webp', '1999-05-05', '2022-09-08 23:09:52', '2022-09-09 06:25:09', NULL, NULL, NULL, NULL),
(63, 'abc', 'abc', 'abc@gmail.com', '9823840813', '1234567', 'http://beautyliciousnj.com/happyhours/public/profileImage/1665333085.jpg', '1996-08-26', '2022-09-08 23:50:08', '2022-10-09 16:31:25', NULL, NULL, NULL, NULL),
(64, 'abc', 'xyz', 'xyza@gmail.com', '919357818378', '12345678910', NULL, '2000-10-09', '2022-09-09 03:54:25', '2022-09-09 03:54:25', NULL, NULL, NULL, NULL),
(65, 'something', 'something', 'something@gmail.com', '1234567890', '123some', NULL, '2000-12-09', '2022-09-09 04:04:51', '2022-09-09 04:04:51', NULL, NULL, NULL, NULL),
(66, 'ak', 'kk', 'k234@gmail.com', '9087616186', 'sad0074', NULL, '2000-12-06', '2022-09-09 05:13:04', '2022-09-09 05:13:04', NULL, NULL, NULL, NULL),
(67, 'final', 'makdirj', 'final@.comgmail.com', '8536192840', 'wi1834bc', NULL, '1995-09-05', '2022-09-09 05:30:01', '2022-09-09 05:30:01', NULL, NULL, NULL, NULL),
(68, 'abhk', 'jsjdj3qodo', 'kdkjebd@gmail.com', '1234950261', 'aidiirjrkfk245', NULL, '1745-12-09', '2022-09-09 05:32:51', '2022-09-09 05:32:51', NULL, NULL, NULL, NULL),
(69, 'abc', 'xyz', 'jeamsb007@gmail.com', 'newuser0070098', 'NEW1234567890', NULL, '2000-12-09', '2022-09-09 05:39:06', '2022-09-09 05:39:06', NULL, NULL, NULL, NULL),
(70, 'akkk', 'apsje', 'odjr@gmail.com', '3452661978', '123jfjdow', NULL, '1775-06-06', '2022-09-09 05:43:59', '2022-09-09 05:43:59', NULL, NULL, NULL, NULL),
(71, 'sneeok', 'kdoqosb', 'dijeb3jd@gmail.com', '4987318285', 'qhiqd8x72bx', NULL, '4648-04-12', '2022-09-09 05:45:47', '2022-09-09 05:45:47', NULL, NULL, NULL, NULL),
(72, 'Abhishek', 'khot', 'jeamsb@gmail.com', '9966625499', 'NEW12345', NULL, '1996-07-07', '2022-09-12 02:14:47', '2022-09-12 02:14:47', NULL, NULL, NULL, NULL),
(73, 'ak', 'kk', 'someday@gmail.com', '9966452316', 'NEW1234567890', NULL, '1888-12-05', '2022-09-12 02:16:01', '2022-09-12 02:16:01', NULL, NULL, NULL, NULL),
(74, 'ak', 'kk', 'another@gmail.com', '9996663322', '12345', NULL, '1988-03-03', '2022-09-12 02:29:07', '2022-09-12 02:29:07', NULL, NULL, NULL, NULL),
(75, 'ak', 'kk', 'anotherone@gmail.com', '9966332277', '12345', NULL, '1888-12-06', '2022-09-12 02:37:39', '2022-09-12 02:37:39', NULL, NULL, NULL, NULL),
(76, 'xzy', 'czy', 'abcd@gmail.com', '6492031358', '12345', NULL, '1988-03-06', '2022-09-12 04:12:17', '2022-09-12 04:12:17', NULL, NULL, NULL, NULL),
(77, 'ak', 'ak', 'ak@gmail.com', '4319597664', '12345', NULL, '1980-08-06', '2022-09-12 04:12:51', '2022-09-12 04:12:51', NULL, NULL, NULL, NULL),
(78, 'evening', 'evening', 'evening@gmail.com', '8899553355', '12345', NULL, '1999-09-03', '2022-09-12 04:23:45', '2022-09-12 04:23:45', NULL, NULL, NULL, NULL),
(79, 'xyz', 'zhc', 'zhc@gmail.com', '9988552233', '12345', NULL, '1999-09-03', '2022-09-12 04:39:18', '2022-09-12 04:39:18', NULL, NULL, NULL, NULL),
(80, 'what', 'what', 'random@gmail.com', '9988552244', '12345', NULL, '1998-09-03', '2022-09-12 05:21:00', '2022-09-12 05:21:00', NULL, NULL, NULL, NULL),
(81, 'some', 'some', 'just@gmail.com', '8899002255', '12345', NULL, '2001-12-03', '2022-09-12 05:38:48', '2022-09-12 05:38:48', NULL, NULL, NULL, NULL),
(82, 'paifh', 'kkdkwl', 'what@gmail.com', '6461629561', '12345', NULL, '1500-09-09', '2022-09-12 05:47:07', '2022-09-12 05:47:07', NULL, NULL, NULL, NULL),
(83, 'vvvv', 'vvvv', 'v@gmail.com', '8899955666', '12345', NULL, '1999-09-06', '2022-09-12 21:22:22', '2022-09-12 21:22:22', NULL, NULL, NULL, NULL),
(84, 'sodjrh', 'kdkwn', 'kk@gmail.com', '6431629899', '1234567890', NULL, '1205-03-03', '2022-09-12 21:52:25', '2022-09-12 21:52:25', NULL, NULL, NULL, NULL),
(85, 'wpeij', 'skkskdometimieowles', 'pc@gmail.com', '6451349204', '1234567', NULL, '1275-03-05', '2022-09-12 22:07:47', '2022-09-12 22:07:47', NULL, NULL, NULL, NULL),
(86, 'done', 'done', 'done@gmail.com', '9881952441', 'done12345', 'http://beautyliciousnj.com/happyhours/public/profileImage/1663055773.png', '2022-02-04', '2022-09-12 22:23:31', '2022-09-19 11:20:12', NULL, NULL, NULL, NULL),
(87, 'Kalash', 'Sonker', 'kalashsonker90@gmail.com', '0123654789', '123456', NULL, '2022-03-22', '2022-09-13 02:05:14', '2022-09-13 02:05:14', NULL, NULL, NULL, NULL),
(88, 'woeoj', 'sidjj', 'jhon@gmail.com', '9881952454', 'jhon12345', NULL, '1995-09-02', '2022-09-13 05:43:37', '2022-09-13 05:43:37', NULL, NULL, NULL, NULL),
(89, 'no', 'no', 'no@gmail.com', '8855994433', 'nope12345', NULL, '1975-07-07', '2022-09-13 05:44:27', '2022-09-13 05:44:27', NULL, NULL, NULL, NULL),
(90, 'jain', 'jain', 'jain@gmail.com', '8329924753', '12345678', NULL, '2022-09-15', '2022-09-14 23:06:00', '2022-09-14 23:06:00', NULL, NULL, NULL, NULL),
(91, 'jeff', 'bezoes', 'jeff@gmail.com', '1685236497', '1234567890', NULL, '2022-09-02', '2022-09-14 23:06:02', '2022-09-14 23:06:02', NULL, NULL, NULL, NULL),
(92, 'Swaraj', 'Changole', 'sthakre77.st@gmail.com', '9404689585', 'Swaraj123#', NULL, '1995-01-26', '2022-09-16 01:49:22', '2022-09-16 10:23:28', NULL, NULL, NULL, NULL),
(93, 'vk', 'vik', 'vk@gmail.com', '9996333826', 'Vikas123', NULL, '2022-09-05', '2022-09-19 05:49:09', '2022-09-19 05:49:09', NULL, NULL, NULL, NULL),
(94, 'kml', 'k', 'kml@gmail.com', '99985528522', 'aa', 'http://beautyliciousnj.com/happyhours/public/profileImage/1663689459.jpg', '1999-05-31', '2022-09-19 05:55:33', '2022-09-20 16:00:57', NULL, NULL, NULL, NULL),
(95, 'test', 'test', 'test@gmail.com', '9885541356', 'test12345', NULL, '2001-06-06', '2022-09-19 21:11:37', '2022-09-19 21:11:37', NULL, NULL, NULL, NULL),
(96, 'error', 'error', 'error@gmail.com', '8056653825', 'error12345', NULL, '2022-03-05', '2022-09-19 21:18:08', '2022-09-19 21:18:08', NULL, NULL, NULL, NULL),
(97, 'whaterror', 'errornumber', 'numberformat@gmail.com', '9224413569', 'number12345', NULL, '2022-03-01', '2022-09-19 21:24:58', '2022-09-19 21:24:58', NULL, NULL, NULL, NULL),
(98, 'somewhat', 'somewhat', 'somewhat@gmail.com', '5544666002', 'somewhat12345', NULL, '2005-01-09', '2022-09-19 21:30:51', '2022-09-19 21:30:51', NULL, NULL, NULL, NULL),
(99, 'fixed', 'fix', 'fixed@gmail.com', '9524415836', 'fix12345', NULL, '2005-02-03', '2022-09-19 21:38:03', '2022-09-19 21:38:03', NULL, NULL, NULL, NULL),
(100, 'fixed', 'check', 'checked@gmail.com', '-64520726', 'checked12345', NULL, '2007-12-11', '2022-09-19 21:45:28', '2022-09-19 21:45:28', NULL, NULL, NULL, NULL),
(101, 'tok', 'hh', 'vas@gmail.com', '9996338522', 'Vikas123', NULL, '1999-05-06', '2022-09-20 08:46:22', '2022-09-20 08:46:22', NULL, NULL, NULL, NULL),
(102, 'sas', 'sos', 'sos@gmail.com', '8886333828', 'Vikas123@', NULL, '2021-09-25', '2022-09-20 08:47:18', '2022-09-20 08:47:18', NULL, NULL, NULL, NULL),
(103, 'kamal', 'sharma', 'kmal@gmail.com', '8885222325', 'Vikas123', NULL, '2022-09-19', '2022-09-20 08:53:48', '2022-09-20 08:53:48', NULL, NULL, NULL, NULL),
(104, 'vik', 'ggg', '333@gmail.com', '7776333824', 'Vikas123', NULL, '2022-09-20', '2022-09-20 09:04:34', '2022-09-20 09:04:34', NULL, NULL, NULL, NULL),
(105, 'vik', 'ggg', '444@gmail.com', '8885222358', 'Vikas123', 'http://beautyliciousnj.com/happyhours/public/profileImage/1663691564.jpg', '1999-03-05', '2022-09-20 09:07:42', '2022-09-20 16:33:22', NULL, NULL, NULL, NULL),
(106, 'Vikas', 'soni', 'ansu@mail.com', '789845126545', 'Vikas123', NULL, '1999-05-05', '2022-09-20 09:36:30', '2022-09-20 09:36:30', NULL, NULL, NULL, NULL),
(107, 'vk', 'soni', 'ans@mail.com', '8596745241', 'Vikas123', 'http://beautyliciousnj.com/happyhours/public/profileImage/1664170226.png', '1999-05-05', '2022-09-20 09:38:26', '2022-09-26 05:30:26', NULL, NULL, NULL, NULL),
(108, 'Kalash', 'Sonker', 'kalashsonker9999@gmail.com', '0123456987', '123456', NULL, '2021-03-03', '2022-09-23 05:50:33', '2022-09-23 05:50:33', NULL, NULL, NULL, NULL),
(109, 'ggg', 'zzz', 'zzz@gmail.com', '8574965241', 'Vikas124', 'http://beautyliciousnj.com/happyhours/public/profileImage/1663997273.jpg', '2022-09-24', '2022-09-23 22:24:45', '2022-09-24 05:27:53', NULL, NULL, NULL, NULL),
(110, '123456677', '124445678', 'laxman@gmail.com', '477414747755852856954866666668570855084755', 'Laxman@12', NULL, '2022-09-24', '2022-09-23 22:37:37', '2022-09-23 22:37:37', NULL, NULL, NULL, NULL),
(111, 'dev', 'surana', 'suranadev', '7620444849', 'aa', 'http://beautyliciousnj.com/happyhours/public/profileImage/1663998958.', '2022-09-24', '2022-09-23 22:38:24', '2022-09-24 05:55:58', NULL, NULL, NULL, NULL),
(112, 'Shubham', 'Khare', 'khare@gmail.com', '9630852741', '12345678', NULL, '1995-09-28', '2022-09-28 07:47:08', '2022-09-28 07:47:08', NULL, NULL, NULL, NULL),
(115, 'testing1', 'testing1', 'test1@gmail.com', '012345678901', '123456789', NULL, '2022-10-13', '2022-10-14 01:54:36', '2022-10-14 01:54:36', NULL, NULL, NULL, NULL),
(116, 'Steave', 'Roger', 'steave@gmail.com', '7532061955', 'roger123456789', NULL, '2018-05-12', '2022-10-17 11:29:51', '2022-10-17 11:29:51', NULL, NULL, NULL, NULL),
(120, 'Shubham', 'Khare', 'hr1@gmail.com', '9087654321', '12345678', 'http://beautyliciousnj.com/happyhours/public/profileImage/1674757057.', '2022-10-21', '2022-10-21 10:35:25', '2023-01-26 18:17:37', NULL, NULL, NULL, NULL),
(121, 'jjj', 'jjj', 'ansu@yopmail.com', '9865329865', 'Vikas123', 'http://beautyliciousnj.com/happyhours/public/profileImage/1666759047.jpeg', '2022-10-26', '2022-10-25 21:26:52', '2022-10-26 04:37:27', NULL, NULL, NULL, NULL),
(122, 'gurman', 'deep', 'gurma381@gmail.com', '9878125064', 'Amritsar12', 'http://beautyliciousnj.com/happyhours/public/profileImage/1669279734.png', '2001-07-30', '2022-10-26 09:12:36', '2022-11-24 08:48:54', NULL, NULL, NULL, NULL),
(123, 'Abhishek', 'khot', 'happyhours@gmail.com', '0699342991', 'happyhours123', NULL, '1990-06-02', '2022-10-27 00:28:23', '2022-10-27 00:28:23', NULL, NULL, NULL, NULL),
(124, 'kkk', 'oni', 'lll@gmail.com', '2356896532', 'Vikas123', NULL, '2022-10-28', '2022-10-28 03:41:20', '2022-10-28 03:41:20', NULL, NULL, NULL, NULL),
(125, 'uuu', 'uuu', 'uuu@gmail.com', '1245785421', 'Vikas123', NULL, '2022-10-28', '2022-10-28 03:42:20', '2022-10-28 03:42:20', NULL, NULL, NULL, NULL),
(126, 'uuu', 'uuu', 'uu@gmail.com', '8754215487', 'Vikas123', NULL, '2022-10-28', '2022-10-28 03:42:55', '2022-10-28 03:42:55', NULL, NULL, NULL, NULL),
(127, 'uuu', 'uuu', 'uuuu@gmail.com', '1245785423', 'Vikas123', NULL, '2022-10-28', '2022-10-28 03:44:06', '2022-10-28 03:44:06', NULL, NULL, NULL, NULL),
(128, 'gurman', 'deep', 'gurmandeep1235@gmail.com', '9878125060', 'Amritsar12', NULL, '2001-07-25', '2022-10-28 04:02:07', '2022-10-28 04:02:07', NULL, NULL, NULL, NULL),
(129, 'everything', 'skfk', 'mdk@gmail.com', '6431956831', 'passwordmdk123', NULL, '2018-04-24', '2022-10-28 04:16:55', '2022-10-28 04:16:55', NULL, NULL, NULL, NULL),
(130, 'babu', 'babu', 'babu26@gmail.com', '7620444123', '7620444847', NULL, '2022-10-28', '2022-10-28 04:46:07', '2022-10-28 04:46:07', NULL, NULL, NULL, NULL),
(131, 'raju', 'jain', 'raju@gmail.com', '1234567898', '12345678', 'http://beautyliciousnj.com/happyhours/public/profileImage/1674632415.', '2022-10-28', '2022-10-28 04:57:26', '2023-01-25 07:40:15', NULL, NULL, NULL, NULL),
(133, 'Sahil', 'Pc', 'sahilpc.alwar@gmail.com', NULL, 'w+PjNA7-Ih?*', NULL, NULL, '2022-11-04 01:25:33', '2022-11-04 01:25:33', NULL, '100412628770939458136', 'o9xAxRcby7y6ljxlvhcnOltLwesCshlG6GD8jWEtnOTA30pv0R', 'GOOGLE'),
(134, 'aak', 'kakak', 'kalashsonker909@gmail.com', '9846464664', '123456', NULL, '2022-03-11', '2022-11-08 07:08:12', '2022-11-08 07:08:12', NULL, NULL, NULL, NULL),
(135, 'ᏦᏬᏝᎴᏋᏋᎮ', 'ddghjkllljhh', 'fghjkllkkj@gmail.com', '44555632222', ';)PbL7^tpG$s', 'https://graph.facebook.com/v3.3/1519338685249081/picture?type=normal', '1998-01-05', '2022-11-14 03:47:35', '2022-11-14 12:46:56', NULL, '1519338685249081', 'XtXU6pSAHecGmvzRtZ55zzSaMR2ggJbfEhby2995wcAkhBBC0A', 'FACEBOOK'),
(136, 'Vikas', 'Soni', 'vikas.quantumit.@gmail.com', '9996358855', 'I:H_=MB;owf5', 'http://beautyliciousnj.com/happyhours/public/profileImage/1668429309.jpg', '1999-05-05', '2022-11-14 05:32:41', '2022-11-14 12:41:37', NULL, '115020583553408850736', 'tmVVUVpf5KFhqI1symDtbNHHVjxXk9QJaj4P7VpMXu9YJDBpPQ', 'GOOGLE'),
(137, 'Vikas', 'Soni', 'vikas.quantumit.innovation@gmail.com', '9865326598', 'BNwlD-P@pn(R', 'http://beautyliciousnj.com/happyhours/public/profileImage/1669368288.jpeg', '1999-09-05', '2022-11-14 05:42:55', '2022-11-25 09:24:48', NULL, '115020583553408850736', 'CmNaVH6soDMoMWsamVixTpxRW1CkfkMNd2AsnB3LXRLxY5dEqZ', 'GOOGLE'),
(138, 'Vikas', 'gggg', 'gggg@gmail.com', '3265986532', '*3%qn_Gg.Qf)', 'http://beautyliciousnj.com/happyhours/public/profileImage/1669279366.jpeg', '1999-01-01', '2022-11-14 05:47:12', '2022-11-24 08:42:46', NULL, '672474490963644', 'X30GQ6UmPSktqO9hv2E8rGBQiimClR9zKKX5BUWQtrv3a1C9CE', 'FACEBOOK'),
(141, 'Gurman', 'Deep', 'gurman381@gmail.com', '9878125064', '*c$^g!zKt=ds', 'https://graph.facebook.com/v3.3/1579881195780706/picture?type=normal', '2001-11-11', '2022-11-14 09:42:00', '2022-11-14 16:48:47', NULL, '1579881195780706', 'PR64vItBPa3mgKP99uiB7ZRGKJy1gNYTXtJuXVOBYPqQvQJNYm', 'FACEBOOK'),
(142, 'Priyam', 'Prakash', 'priyamprakash56@gmail.com', '7493859235', '$2y$10$9LSzsoBZekp9v.vwORbubexACGtgKjrfLWNw0EDKaThlkLv8YeN86', 'http://beautyliciousnj.com/happyhours/public/profileImage/1693198376.jpg', '2002-08-27', '2022-11-17 05:53:25', '2023-08-28 04:52:56', 5543, NULL, NULL, NULL),
(143, 'priyam', 'prakash', 'p@gmail.com', '1234567899', '12345678', 'http://beautyliciousnj.com/happyhours/public/profileImage/1674559257.jpg', '1999-04-28', '2022-11-18 10:05:55', '2023-01-24 11:20:57', NULL, NULL, NULL, NULL),
(144, 'myFirstName', 'myLastName', 'myEmail@gmail.com', '987654310', '12345678', NULL, NULL, '2022-11-20 22:23:44', '2022-11-20 22:23:44', NULL, NULL, NULL, NULL),
(145, 'Shivam', 'chawla', 'shivam10101chawla@gmail.com', '0909090909', 'shivam123', 'http://beautyliciousnj.com/happyhours/public/profileImage/1674619209.', '1992-11-22', '2022-11-22 03:11:17', '2023-01-25 04:00:09', 5564, NULL, NULL, NULL),
(146, 'vikas', 'soni', 'soniii@gmail.com', '8754215454', 'Vikas123', NULL, '1989-05-05', '2022-11-25 02:30:29', '2022-11-25 02:30:29', NULL, NULL, NULL, NULL),
(147, 'vikas', 'soni', 'kkk@gmail.com', '3254876532', 'vikas123', NULL, '1999-02-02', '2022-11-25 02:32:39', '2022-11-25 02:32:39', NULL, NULL, NULL, NULL),
(148, 'Vikas', 'Sonj', 'klj@gmail.com', '9854216532', 'Vikasss', NULL, '1959-05-12', '2022-11-25 02:33:32', '2022-11-25 02:33:32', NULL, NULL, NULL, NULL),
(149, 'vikas', 'soni', 'kis', '3265876532', 'Vikasss', NULL, '1999-05-05', '2022-11-25 02:34:28', '2022-11-25 02:34:28', NULL, NULL, NULL, NULL),
(150, 'kjl', 'kjl', 'kjl', '9865324556', 'Vikasss', NULL, '1999-06-04', '2022-11-25 02:35:54', '2022-11-25 02:35:54', NULL, NULL, NULL, NULL),
(151, 'hey', 'hey', 'hey@gmail.com', '9876543210', '12345678', NULL, '2022-11-25', '2022-11-25 04:31:20', '2022-11-25 04:31:20', NULL, NULL, NULL, NULL),
(152, 'vikas', 'soni', 'ppp@gmail.com', '3265987845', 'Vikassss', NULL, '1999-05-05', '2022-11-25 05:58:20', '2022-11-25 05:58:20', NULL, NULL, NULL, NULL),
(153, 'VIkas', 'soni', 'eee@gmail.com', '12457832', 'Vikassss', NULL, '1999-01-01', '2022-11-25 05:59:44', '2022-11-25 05:59:44', NULL, NULL, NULL, NULL),
(154, 'Vikas', 'Soni', 'eep@gmail.com', '9865324578', 'Vikasssss', NULL, '1999-01-01', '2022-11-25 06:00:49', '2022-11-25 06:00:49', NULL, NULL, NULL, NULL),
(155, 'Priyam', 'Prakash', 'yo@gmail.com', '9800000000000', '12345678', NULL, '1999-03-28', '2022-11-25 12:40:03', '2022-11-25 12:40:03', NULL, NULL, NULL, NULL),
(156, 'Priyam', 'Prakash', 'priyampr99@gmail.com', '0852580852580', '12345678', NULL, '2022-11-26', '2022-11-25 12:44:56', '2022-11-25 12:44:56', NULL, NULL, NULL, NULL),
(157, 'Priyam', 'Prakash', 'priyamprakas@gmail.com', '7777777777', '12345678', NULL, '2022-11-26', '2022-11-25 12:55:26', '2022-11-25 12:55:26', NULL, NULL, NULL, NULL),
(158, 'Priyam', 'Prakash', 'priya@gmail.com', '0000000000', '12345678', NULL, '2022-11-26', '2022-11-25 13:02:58', '2022-11-25 13:02:58', NULL, NULL, NULL, NULL),
(159, 'Priyam', 'Prakash', 'krsna@gmail.com', '44444444', '00000000', NULL, '2022-11-26', '2022-11-25 13:06:05', '2022-11-25 13:06:05', NULL, NULL, NULL, NULL),
(160, 'Priyam', 'Prakash', 'priyamprakashhjjjo9@gmail.com', '749385923', '12345778', NULL, '2022-11-26', '2022-11-25 13:11:37', '2022-11-25 13:11:37', NULL, NULL, NULL, NULL),
(161, 'Priyam', 'Prakash', 'poiu@gmail.com', '22222222', '12345678', NULL, '2022-11-26', '2022-11-25 13:18:00', '2022-11-25 13:18:00', NULL, NULL, NULL, NULL),
(162, 'Priyam', 'Prakash', 'lol@gmail.com', '7493859000', '00000000', NULL, '2022-04-26', '2022-11-25 13:20:33', '2022-11-25 13:20:33', NULL, NULL, NULL, NULL),
(163, 'Priyam', 'Prakash', 'nanku9@gmail.com', '55555555', '00000000', NULL, '2022-11-26', '2022-11-25 13:24:02', '2022-11-25 13:24:02', NULL, NULL, NULL, NULL),
(164, 'Priyam', 'Prakash', 'bg@gmail.com', '333336335288', '11111111', NULL, '2022-11-26', '2022-11-25 13:27:57', '2022-11-25 13:27:57', NULL, NULL, NULL, NULL),
(165, 'Priyam', 'Prakash', 'zz@gmail.com', '666555444', 'mmmmmmmmm', NULL, '2022-07-26', '2022-11-25 13:46:21', '2022-11-25 13:46:21', NULL, NULL, NULL, NULL),
(166, 'Priyam', 'Prakash', 'prraju@gmail.com', '5412369870', 'bbbbbbbb', NULL, '2022-11-26', '2022-11-25 13:53:09', '2022-11-25 13:53:09', NULL, NULL, NULL, NULL),
(167, 'Priyam', 'Prakash', 'nn6@gmail.com', '06122288944', '12345678', NULL, '2017-11-26', '2022-11-25 13:57:32', '2022-11-25 13:57:32', NULL, NULL, NULL, NULL),
(168, 'Priyam', 'Prakash', 'home9@gmail.com', '0612218988', '12345678', NULL, '2022-11-26', '2022-11-25 14:23:53', '2022-11-25 14:23:53', NULL, NULL, NULL, NULL),
(169, 'Priyam', 'Prakash', 'shreya99@gmail.com', '2525255525', '12345677', NULL, '2017-11-26', '2022-11-25 14:25:46', '2022-11-25 14:25:46', NULL, NULL, NULL, NULL),
(170, 'sunita', 'kumari', 'sunita@gmail.com', '7321806240', '12345678', NULL, '2022-11-27', '2022-11-26 15:15:22', '2022-11-26 15:15:22', NULL, NULL, NULL, NULL),
(171, 'vikas', 'soni', 'iii@gmail.com', '9865324512', 'Vikas123', 'http://beautyliciousnj.com/happyhours/public/profileImage/1669557592.jpeg', '1999-01-02', '2022-11-27 06:57:58', '2022-11-27 13:59:52', NULL, NULL, NULL, NULL),
(172, 'vikas', 'soni', 'iiii@gmail.com', '9865324521', 'vikas123', NULL, '1999-02-02', '2022-11-27 06:58:45', '2022-11-27 06:58:45', NULL, NULL, NULL, NULL),
(173, 'ddd', 'ddd', 'uiop@gmail.com', '3265986528', 'vikas123', 'http://beautyliciousnj.com/happyhours/public/profileImage/1669713602.jpeg', '1999-05-05', '2022-11-29 02:18:14', '2022-11-29 09:20:02', NULL, NULL, NULL, NULL),
(174, 'testuser', 'lastname', 'testusermail@gmail.com', '9999444455', 'Testuser@1', NULL, '2022-12-06', '2022-12-05 23:07:57', '2022-12-05 23:07:57', NULL, NULL, NULL, NULL),
(175, 'Ann', 'Ruiz', 'annruiz.51132@gmail.com', NULL, 'EWQqUa5DB17s', NULL, NULL, '2022-12-07 02:39:37', '2022-12-07 02:39:37', NULL, '111249765869600908256', 'OpjnHCm8RfhUw5Gvh1pwKR0f7tQjzqkW1yOw3US4JH5ToKmfeo', 'GOOGLE'),
(176, 'Meghan', 'Harrison', 'meghanharrison.54818@gmail.com', NULL, 'E=*ro!Y2kK7D', NULL, NULL, '2022-12-09 01:40:19', '2022-12-09 01:40:19', NULL, '113564351248290684442', 'hRm2aAjnidr0kTfD58F1B9NqWnR2Shmiac3AkwD63G0Td2TAxd', 'GOOGLE'),
(177, 'Belinda', 'Snyder', 'belindasnyder.75201@gmail.com', NULL, 'zsFI(6m:oqQP', NULL, NULL, '2022-12-19 06:16:27', '2022-12-19 06:16:27', NULL, '113439087755871549931', 'G2ikW09Osv1yscOxL9wNJLW7UnX72rDD6cbTSJKUTh3saysPGA', 'GOOGLE'),
(178, 'Shubham', 'Khare', 'qwerty@gmail.com', '9630852471', '12345678', NULL, '2019-12-21', '2022-12-21 06:15:38', '2022-12-21 06:15:38', NULL, NULL, NULL, NULL),
(179, 'jfgkf', 'ch kgg', '6@gmail.com', '99306994', '12345678', NULL, '1996-08-23', '2022-12-23 02:29:03', '2022-12-23 02:29:03', NULL, NULL, NULL, NULL),
(180, 'testing', 'testing', 'd@gmail.com', '123777833333333', '12345678', NULL, '1998-09-23', '2022-12-23 02:31:04', '2022-12-23 02:31:04', NULL, NULL, NULL, NULL),
(181, 'le', 'lotq', 's@gmail.com', '098778900', '09876543', NULL, '2022-12-24', '2022-12-23 03:15:47', '2022-12-23 03:15:47', NULL, NULL, NULL, NULL),
(182, 'Roberts', 'Kozlovskis', 'kozlovskisroberts9@gmail.com', NULL, '3uYsE147&biH', NULL, NULL, '2022-12-28 10:36:58', '2022-12-28 10:36:58', NULL, '107947502235377696186', 'ouFo1wZXjDPsDL1X0oMaITqsC9SfG8uyO5GkYiglciZTTg8P6d', 'GOOGLE'),
(183, 'Girish', 'Rohit', 'girishrohit60@gmail.com', '9945589366', '!I8o:dOl7xEb', NULL, '1981-03-03', '2022-12-31 08:21:37', '2023-02-21 08:46:58', 7046, '113505811616804490259', 't3Cr9FMFQ42R1o1AgWNpaIa2CSlSShY5R136xvBJFiDKVDkNxP', 'GOOGLE'),
(185, 'Catherine', 'cece', 'cece_catherine@yahoo.com', '7609018002', '$2y$10$bKkf18gybeHJ2CuB3OwSe.T4q/UPslhM2bM9j9DJfOyJIatv3JaxC', 'http://beautyliciousnj.com/happyhours/public/profileImage/1686928347.', '1959-05-17', '2023-01-04 21:32:04', '2023-06-16 15:12:27', 3888, NULL, NULL, NULL),
(186, 'pragati', 'Khare', 'pragati@gmail.com', '9630852560', '12345678', NULL, '2023-01-02', '2023-01-04 22:40:02', '2023-01-04 22:40:02', NULL, NULL, NULL, NULL),
(187, 'Nithin', 'garige', 'nithingarige277@gmail.com', '7093503836', 'Nithin123', NULL, '2002-08-05', '2023-01-05 11:01:01', '2023-01-05 11:01:01', NULL, NULL, NULL, NULL),
(188, 'KK', 'KK', 'kaplinskik@gmail.com', NULL, ':4p;Wfj(&#N$', NULL, NULL, '2023-01-11 06:02:59', '2023-01-11 06:02:59', NULL, '109204535402003110299', 'aJ0XDd3O8Gvetc8k9ZGxSuGnFirzALDp1DswIXb7rsMPQnCLoG', 'GOOGLE'),
(189, 'Developer', 'Priyam', 'developerpriyam99@gmail.com', '9999999999', '?QR18CjVF7!+', NULL, '2023-01-12', '2023-01-12 03:39:52', '2023-01-12 10:41:05', NULL, '103357270666174026862', 'e2nCznfB6adEAuoj5IXCY0GctSRZ8oWLV8cZb4nmtIH5CtHOE6', 'GOOGLE'),
(190, 'Utsav', 'Goel', 'utsav.quantumitinnovations@gmail.com', '7060704671', 'anubhav123', NULL, '1997-12-26', '2023-01-18 11:06:45', '2023-01-18 11:06:45', NULL, NULL, NULL, NULL),
(191, 'Saurabh', 'Kumbhatttttt', 'saurabhkumbhar187@gmail.com', '7769889013', '$2y$10$qhaCbVn.Yj3FyTcbnjc/ZeNyHzq1dHwNoHNqdlY5E9PFyW3wvB5g6', 'http://beautyliciousnj.com/happyhours/public/profileImage/1691989819.jpg', '1998-07-29', '2023-01-18 21:47:17', '2023-08-23 08:32:00', 2238, '106737621286446669492', 'b5OUWkYO8dhlWBtKI2XhWKJOsbrSg52P4o7mv5fPvu1WmxvFfy', 'GOOGLE'),
(192, 'Nidhi', 'Dhammani', 'nidhidhammani@gmail.com', NULL, 'zCktmDwbWyn.', NULL, NULL, '2023-01-20 15:14:00', '2023-01-20 15:14:00', NULL, '117634930713374302323', 'J0ZTrXqs15iMVAKHjKCeifFDqibizjG6lzpbFkFQv8G24JTSkO', 'GOOGLE'),
(193, 'utsav', 'goel', 'utsavratan@gmail.com', '7895707092', 'anubhav123', 'http://beautyliciousnj.com/happyhours/public/profileImage/1674618944.jpg', '1997-12-26', '2023-01-24 19:54:40', '2023-01-25 03:55:44', NULL, NULL, NULL, NULL),
(194, 'khushi', 'jain', 'khushi@gmail.com', '9552390033', '9552390033', NULL, '2002-10-15', '2023-01-25 00:53:03', '2023-01-25 00:53:03', NULL, NULL, NULL, NULL),
(195, 'bhavesh', 'jain', 'bhavesh1@gmail.com', '762054855866', 'Bhavesh@123', 'http://beautyliciousnj.com/happyhours/public/profileImage/1674819193.', '2023-01-25', '2023-01-25 01:43:43', '2023-01-27 11:33:13', NULL, NULL, NULL, NULL),
(196, 'Ashish', 'Gupta', 'ashishgupta8051@gmail.com', NULL, 'ZY(Kzv?q)+F=', NULL, NULL, '2023-01-25 08:07:01', '2023-01-25 08:07:01', NULL, '114585180410077761323', 'lfzKIAMUEbMS70qMmXATYsRLi598jJRhu25W3hqLimxs9E67fC', 'GOOGLE'),
(197, 'Billi', 'Conaway', 'billiconaway.86585@gmail.com', NULL, ':x!reEY%RZ)#', NULL, NULL, '2023-01-26 01:45:58', '2023-01-26 01:45:58', NULL, '101989072668386577792', 'wpP5B57600Y6LTouoTFUvxDVyFu5TXkUeSdRVRkQDySAeKLKZH', 'GOOGLE'),
(198, 'Preston', 'Jefferson', 'prestonjefferson.06540@gmail.com', NULL, 'y&$d#zAg3aZC', NULL, NULL, '2023-01-28 00:26:01', '2023-01-28 00:26:01', NULL, '101291184320122478750', 'HTQvO1a7DYWf1NedV0RkmOqEMQz251vZ1vYz7Zjls5qZkJrhC0', 'GOOGLE'),
(199, 'David', 'Přibyl', 'pribyl.dawid@gmail.com', NULL, 'Pi@8%IMLW&nv', NULL, NULL, '2023-01-29 05:25:32', '2023-01-29 05:25:32', NULL, '106123978496933596890', 'GPkZdsBV2j79Pg515hfG5dSFaIhqTKVsNxiCt1K2MrQMNgZAC5', 'GOOGLE'),
(200, 'Ishu', 'Goel', 'utsav.quantumitinnovationss@gmail.com', '7895707093', 'suggu123', NULL, '1996-12-29', '2023-02-01 09:02:25', '2023-02-01 09:02:25', NULL, NULL, NULL, NULL),
(201, 'sumit', 'Sharma', 'jkn1782@gmail.com', '7780853373', 'Care@2023', NULL, '1988-04-04', '2023-02-01 11:55:24', '2023-02-01 11:55:24', NULL, NULL, NULL, NULL),
(202, 'Saurabh', 'Kumbhar', 'saurabhkumbharr187@gmail.com', '7769889013', 'Saurabh@7', 'http://beautyliciousnj.com/happyhours/public/profileImage/1676349276.jpg', '1998-07-08', '2023-02-01 22:14:56', '2023-02-14 04:35:11', NULL, NULL, NULL, NULL),
(203, 'Laura', 'Marie', NULL, NULL, '*E;NftUAe3,i', 'https://graph.facebook.com/v3.3/3608803949406122/picture?type=normal', NULL, '2023-02-02 09:52:22', '2023-05-09 15:58:40', 3776, '3608803949406122', 'cPCNhOFjl67nBFyjar8phmUibwrm4dI6trQPA0lAFfsq1VsdtL', 'FACEBOOK'),
(204, 'Violet', 'Garza', 'violetgarza.02799@gmail.com', NULL, '#30Z@wYqap:S', NULL, NULL, '2023-02-07 07:53:50', '2023-02-07 07:53:50', NULL, '112559034496061386592', '0fxcaxj8dTRSsOOCXzAH9wbpHK6P59vkvQut9rFpatOURABAms', 'GOOGLE'),
(205, 'Wyatt', 'Miner', 'wyattminer.97384@gmail.com', NULL, 'pqkcCP)i+b1D', NULL, NULL, '2023-02-08 08:41:01', '2023-02-08 08:41:01', NULL, '110323986042295121341', '8fzDzBquRk4b2vpmrRmOrcXTi4PszUlgOrP2tsbuY5dSjYhTYu', 'GOOGLE'),
(206, 'joanca', 'lourens', 'joancalourens1@gmail.com', '0643952411', 'joanca@01', NULL, '2004-09-20', '2023-02-12 05:35:33', '2023-02-12 05:35:33', NULL, NULL, NULL, NULL),
(207, 'cat', 'cece', 'info@happyhourguideofthedesert.com', '7604098001', 'cmasdn1993', NULL, '1959-05-17', '2023-02-14 00:23:19', '2023-02-14 00:23:19', NULL, NULL, NULL, NULL),
(208, 'BHAVESH', 'JAIN', 'bhaveshquantum27@gmail.com', '+1917620444846', '$2y$10$k3eAEMvlPFc.KJjnfNUuAeo1f5SqfRYRRIrYp1RYKQ7rRCZENmt.y', 'http://beautyliciousnj.com/happyhours/public/profileImage/1683874444.', '2023-01-17', '2023-02-17 08:06:49', '2023-05-18 18:27:52', 9480, NULL, NULL, NULL),
(209, 'Shiv', 'Sharma', 'sh9410026926@gmail.com', '9456655535', 'Shiva1234', NULL, '1998-07-10', '2023-02-28 06:31:08', '2023-02-28 06:31:08', NULL, NULL, NULL, NULL),
(210, 'Ranjit', 'Kumar', 'rs.1457k@gmail.com', '+919304803038', '170686@1', NULL, '1986-06-17', '2023-02-28 19:23:57', '2023-02-28 19:23:57', NULL, NULL, NULL, NULL),
(211, 'Shimy', 'Roy', 'shimyroy7@gmail.com', '7544932428', 'Shimyroy@1996', NULL, '1996-12-25', '2023-03-02 10:58:26', '2023-03-02 10:58:26', NULL, NULL, NULL, NULL),
(212, 'dominick', 'cece', 'cecedominick@gmail.com', '7606411411', 'aster123', NULL, '1993-12-21', '2023-03-02 22:18:25', '2023-03-02 22:18:25', NULL, NULL, NULL, NULL),
(213, 'Daren', 'ahmed', 'zordanii80@gmail.com', '1234793297', 'Sam12345', NULL, '1990-03-07', '2023-03-07 05:15:27', '2023-03-07 05:15:27', NULL, NULL, NULL, NULL),
(214, 'Lewis', 'Hitchinson', 'lewis_hitchinson@hotmail.com', '07919562091', 'Nansenr0ad1', NULL, '1993-12-30', '2023-03-08 13:29:01', '2023-03-08 13:29:01', NULL, NULL, NULL, NULL),
(215, 'alladi', 'sudhakar', 'alladisunny7034@gmail.com', '9290333353', 'kalyan@123', NULL, '1987-01-25', '2023-03-09 13:00:32', '2023-03-09 13:00:32', NULL, NULL, NULL, NULL),
(216, 'Vijeta', 'Sharma', 'vijeta252@gmail.com', NULL, 'RJi_*f0=aSDQ', NULL, NULL, '2023-03-15 18:42:43', '2023-03-15 18:42:43', NULL, '109251830881678499244', 'gLMMTFznqVT8DCIA5pqcFz79I8Zgn2JkFwb280Ax3hYn0z3aOH', 'GOOGLE'),
(217, 'utsav', 'goel', 'utsavvrattan@gmail.com', '9368443304', 'Anubhav@123', NULL, '1997-12-26', '2023-03-15 22:09:26', '2023-03-15 22:09:26', NULL, NULL, NULL, NULL),
(218, 'sugandha', 'gupta', 'sugandha@gmail.com', '7906586114', 'Anubhav@123', NULL, '1997-12-26', '2023-03-15 22:11:00', '2023-03-15 22:11:00', NULL, NULL, NULL, NULL),
(219, 'Priyam', 'Prakash', 'priyamquantumitinnovation@gmail.com', NULL, '?C7FfHL%-;^S', NULL, NULL, '2023-03-16 11:30:48', '2023-03-16 11:30:48', NULL, '107651334418208144722', 'HYdsVCg4HdNesEBTQRr0W5VKepGF3Hb9noiQd0XVxnIMkNIp0J', 'GOOGLE'),
(220, 'Timmy', 'L-S', 'timmyls009@gmail.com', NULL, 'XK=6U(nLrzE-', NULL, NULL, '2023-03-18 17:13:11', '2023-03-18 17:13:11', NULL, '116918554949863180140', 'l2VwfXeIh4c8H3K3HeRITmMWumrEaA1PEdZWl8g9kxTZ72vcK3', 'GOOGLE'),
(221, 'Shubham', 'Khare', 'happy@gmail.com', '0852369741', '12345678', NULL, '2008-03-21', '2023-03-21 00:43:32', '2023-03-21 00:43:32', NULL, NULL, NULL, NULL),
(222, 'Prank', 'India', 'kedar.dhadge2525@gmail.com', NULL, 'URw=@oKDhWI^', NULL, NULL, '2023-03-26 03:08:58', '2023-03-26 03:08:58', NULL, '103377137333110815899', 'PzgbiKJoUaEqeLdjpsXsSfxgJk899Duqrd2jqxME4AxkJ5XspL', 'GOOGLE'),
(223, 'rakshit', 'jain', 'rakshitjainmtc@gmail.com', '9086789000', 'katty@2612', NULL, '1982-07-22', '2023-04-03 08:32:01', '2023-04-03 08:32:01', NULL, NULL, NULL, NULL),
(224, 'vikram Singh', 'Rajawat', 'vikramsinghrajawat8741@gmail.com', '7014473061', 'saurav@123', NULL, '1996-01-14', '2023-04-17 05:09:33', '2023-04-17 05:09:33', NULL, NULL, NULL, NULL),
(225, 'Donata', 'Serafin', 'donata.serafin@o2.pl', '661872135', 'Donata2008', NULL, '2003-04-24', '2023-04-24 04:04:14', '2023-04-24 04:04:14', NULL, NULL, NULL, NULL),
(226, 'Araavamudhan', 'Srinivasan', 'aramudanp@gmail.com', NULL, 'C+cK2y_O.JDd', NULL, NULL, '2023-04-28 00:03:54', '2023-04-28 00:03:54', NULL, '110927673868668246227', 'ZKXMwucJZ7Js5x9wZPwov4aYck2hV8d8gLLACy5YA4LT1w2Ptp', 'GOOGLE'),
(227, 'Marcel', 'Aarts', 'marcellusaarts@hotmail.com', NULL, 'TO,E6Nb4XGW=', NULL, NULL, '2023-04-29 01:21:25', '2023-04-29 01:21:25', NULL, '111432720390131744786', 'bolvu6nkucBa9yuexxMBFv3a5xjI55iGoE5bbrvQ6i4SiHktJz', 'GOOGLE'),
(228, 'Monika', 'Dziadus', 'monia090698@gmail.com', NULL, 'XnO^_@J$-y:c', NULL, NULL, '2023-05-02 04:36:46', '2023-05-02 04:36:46', NULL, '107219631269667548546', '1DcGAGOqRlPeAU9UjuS97yogYF7IU96ft1MMtwPb2EaEYCLFLo', 'GOOGLE'),
(229, 'Pierenzo', 'Morriello', 'p.morriello@gmail.com', NULL, 'MKh9@56Tsx)b', NULL, NULL, '2023-05-04 10:20:00', '2023-05-04 10:20:00', NULL, '100830291546427234404', '2KTyTeI0awBJ6CZH2LPawwiQC6z8zTJTsLmILzc4vyxDPVerlf', 'GOOGLE'),
(230, 'Bhavesh', 'Jain', 'bhaveshjain501@gmail.com', '5329924753', 'Bhavesh@12', 'http://beautyliciousnj.com/happyhours/public/profileImage/1683623722.', '1996-08-26', '2023-05-09 02:09:11', '2023-05-09 09:15:22', NULL, NULL, NULL, NULL),
(232, 'Saurabhh', 'Kumbhar', 'saurabh187.quantumitinnovation@gmail.com', '78888769889013', 'Saurabh@7', 'http://beautyliciousnj.com/happyhours/public/profileImage/1683875345.jpg', '1998-07-29', '2023-05-11 23:59:40', '2023-05-12 07:09:05', NULL, NULL, NULL, NULL),
(233, 'Saurabh', 'Kumbhar', 'vewike7049@jwsuns.com', '7769889012', 'Saurabh@7', NULL, '1998-07-29', '2023-05-12 00:12:58', '2023-05-12 00:12:58', NULL, NULL, NULL, NULL),
(234, 'Rashad', 'Khan', 'rashadkhan359@gmail.com', '7289975258', '$2y$10$fxqkgg6jCL4cKuqEGC8Xv.4shbiHd/ArVik4cnMlctOMzKDz8cu2C', 'http://beautyliciousnj.com/happyhours/public/profileImage/1684314711.jpeg', '1996-04-03', '2023-05-13 17:35:02', '2023-05-31 16:13:48', 4624, NULL, NULL, NULL),
(235, 'SANDESH PAWAN', 'TYAGI', 'sandeshpt@gmail.com', '9820278168', '$2y$10$/LzJ7heSHU26PDNQekr32.yCen2lqqWJKUVzmN72i6l0ogC.Bqovm', NULL, '1965-01-09', '2023-05-15 02:24:53', '2023-05-15 02:24:53', NULL, NULL, NULL, NULL),
(236, 'Priyam', 'Prakash', 'developerpriyam@gmail.com', '9334151908', '$2y$10$v8NUzgzNpnLk09R1OUfKdumnMThgF./qmW.SpeI/VuoE5FbBgG6Ha', NULL, '2023-05-15', '2023-05-15 10:16:34', '2023-05-15 10:16:34', NULL, NULL, NULL, NULL),
(237, 'Md', 'mohammed', 'mohammed@gmail.com', '1234567809', '$2y$10$dCFQLPDREsWZRbXtn6mUR.wVPUgAtGkbBXOwPM1.rb8qEdBAo4Y2a', NULL, '2023-05-15', '2023-05-15 10:19:32', '2023-05-15 10:19:32', NULL, NULL, NULL, NULL),
(238, 'Shubham', 'khare', 'hr8@gmail.com', '9630852771', '$2y$10$knK2eiMGEtW.jSCV3BmRV.qVnXqcmcm9f5pVKkk2xd9/0ySmiW1g.', 'http://beautyliciousnj.com/happyhours/public/profileImage/1684175883.', '2004-05-15', '2023-05-15 18:01:53', '2023-05-15 18:38:03', NULL, NULL, NULL, NULL),
(239, 'Priyam', 'Prakash', 'priyamprakash@gmail.com', '7493859233', '$2y$10$VINxjiMaVoiiwIbJvs6E/e/l25/6mjcsP.f/NrJmESL.jSftL/GxK', 'http://beautyliciousnj.com/happyhours/public/profileImage/1692290212.jpg', '2023-05-17', '2023-05-17 05:53:12', '2023-08-23 00:06:53', NULL, NULL, NULL, NULL),
(240, 'ku', 'ku', 'ku@gmail.com', '9648623315', '$2y$10$dwN2W5E0qPC.sJTV7caqCuhXgapiyA7a8K317FewCgcHVMesr5gfC', NULL, '2023-05-18', '2023-05-18 16:37:52', '2023-05-18 16:37:52', NULL, NULL, NULL, NULL),
(241, 'Bhuwan', 'Pant', 'bhuwan.pant@acem.edu.in', '7289976908', '$2y$10$pinWHV/srNS/VzSJ6S4QWO02zvGOjnmzbtAjLDSbuHNp1LVkhryge', NULL, '2002-05-18', '2023-05-18 16:39:21', '2023-05-18 16:39:21', NULL, NULL, NULL, NULL),
(242, 'Alex', 'Rotaru', 'euro.ar@gmail.com', NULL, 'C+p,BN#jy(9k', NULL, NULL, '2023-05-20 16:25:39', '2023-05-20 16:25:39', NULL, '114425312881200438607', 'y0xFGAy0nHrb5wh1ISAPnjUXtTs6XVf6qdnYx3O9HmoEytpsUm', 'GOOGLE'),
(243, 'Saurabh', 'Kumbhar', 'womose9753@cutefier.com', '7769889015', '$2y$10$XlYSo5GUq20CYu0Ub1AucOJoidIHpre.vvzRGjUilXwPQ0GKrWW3a', NULL, '1997-05-22', '2023-05-22 16:06:45', '2023-05-22 16:06:45', NULL, NULL, NULL, NULL),
(245, 'as', 'as', 'shivam@gmail.com', '1212121212', '$2y$10$fTzWVbfbJ0BAFUPtz9qwiu28W5H2qVjxNnglS3ibn3g0eeMMOslA2', NULL, '2023-05-29', '2023-05-29 09:24:56', '2023-05-29 09:24:56', NULL, NULL, NULL, NULL),
(246, 'Bhargav', 'Khagram', 'bhargavkhagram25@gmail.com', NULL, 'V9m!&:d%*hG1', NULL, NULL, '2023-05-30 11:02:38', '2023-05-30 11:02:38', NULL, '101038301443073764749', 'zhDrVqoSJuxb277w2q7iuRvQ4rxDIiMeTNvHJNqRipD5h2B3HE', 'GOOGLE'),
(247, 'Utsav', 'goyal', 'utsavratttan@gmail.com', '7895707097', '$2y$10$B48U9O5Q4qTOIb5j3i/2gOY9zJDKcZPAWxqRVb4NWCZhIuc0jzBAi', NULL, '1997-12-26', '2023-05-31 09:11:07', '2023-05-31 09:11:07', NULL, NULL, NULL, NULL),
(248, 'Ajit', 'Singh', 'ajit0132@gmail.com', '9824831117', '$2y$10$FqJDe7zVKOlr9XZ7IXa.NuQ.OkhRuPfMOj0krZPbbVKiNtH0UkUBa', NULL, '1988-01-27', '2023-06-12 19:25:18', '2023-06-12 19:29:17', 1344, NULL, NULL, NULL),
(249, 'Shubham', 'Khare', 'khareshub298@gmail.com', '9630859630', '$2y$10$byykMAukX3.Prmx5sBB0vu.KOo5VE35RqClUx0.oc0JrBrBNkSrSa', NULL, '2002-06-14', '2023-06-14 03:50:28', '2023-06-14 03:55:11', 1716, NULL, NULL, NULL),
(250, 'Apoorv', 'Verma', 'apoorv.quantumitinnovation@gmail.com', '7217497919', '$2y$10$F/8LeI4dvwFxKiQ9N7hjoev49OENpbMZHwLQfFhj6U9dycoV75hlG', NULL, '2001-12-08', '2023-06-14 06:58:19', '2023-06-14 06:58:19', NULL, NULL, NULL, NULL),
(251, 'Catherine', 'Alwani', 'calwani@yahoo.com', '7609849769', '$2y$10$tNwm5axU8XzBqhpJLDyXAu6RT87ffIw6uQH9edKOA5JtJdHDM8RCK', NULL, '1980-11-09', '2023-06-14 07:27:46', '2023-06-14 07:27:46', NULL, NULL, NULL, NULL),
(253, 'maria', 'vertucci', 'ocrealestatemariav@yahoo.com', '9498873852', '$2y$10$DNz/anabdTB80PuiG3oMlu8uNtZK3pLHieRJjlCh4ul/HX00biZ/G', NULL, '1985-01-09', '2023-06-14 07:52:15', '2023-06-14 07:52:15', NULL, NULL, NULL, NULL),
(254, 'Cat', 'Cece', 'me@mailinator.com', '4423613063', '$2y$10$UK5TVwmo1n9m/zRp1JsHL.YYjTcN1ugfstzk65LcIKG4n77XaFdBW', NULL, '1959-05-17', '2023-06-14 21:54:51', '2023-06-14 21:54:51', NULL, NULL, NULL, NULL),
(255, 'shivam', 'chawla', 'shivamc.2002@gmail.com', '0000111122', '$2y$10$okupNOiuYED.4zI8A3rhoOFYXJHHfH52SEuKkkS2XDfftiOn4sHB6', NULL, '2023-06-16', '2023-06-16 04:53:11', '2023-06-16 04:55:39', 5082, NULL, NULL, NULL),
(256, 'Nuage', 'Laboratoire', 'WOPEAD7A45YBI3RUBQMKJ762OE-00@cloudtestlabaccounts.com', NULL, '!qw(=?Hd+onS', NULL, NULL, '2023-06-22 23:18:52', '2023-06-22 23:18:52', NULL, '110509489750826906145', 'tyLclNXNA6LOqtdpEEUhVGmWj1YeCYFq1PoNGPTZqUmC6zgkov', 'GOOGLE'),
(257, 'Barbara', 'Reynolds Uber', 'twoblkkats@aol.com', '2018512001', '$2y$10$q76sfgQaKVQbOkWk.Stj3uM.aYjg/a/GNRu8FjDia6xb4lIhJDcCu', NULL, '1956-11-14', '2023-06-24 21:45:33', '2023-06-24 21:45:33', NULL, NULL, NULL, NULL),
(258, 'Anil', 'bushan', 'anilbushan@gmail.com', '9906907316', '$2y$10$WtB6JJAwRLWx27dEEZF8BOShBmlm7e45dlukQN1zOsNJ5oKO1Gnyy', NULL, '1982-04-01', '2023-07-16 15:34:31', '2023-07-16 15:34:31', NULL, NULL, NULL, NULL),
(259, 'Radu', 'Bhoraskarberg', 'zeokdshiad_1656904628@tfbnw.net', NULL, 'wlWf^qR)G781', 'https://graph.facebook.com/v3.3/44002220402127/picture?type=normal', NULL, '2023-07-17 07:19:43', '2023-07-17 07:19:43', NULL, '44002220402127', 'UGNxWlayiSZGKoHlUqt0Z9KA7ssl4b9V9Oi0LNQtcmy89C4Hx3', 'FACEBOOK'),
(260, 'Karen', 'Fotinatoswitz', 'uvjcasbupv_1650598985@tfbnw.net', NULL, 'WR51@rh3?60y', 'https://graph.facebook.com/v3.3/28602222539696/picture?type=normal', NULL, '2023-07-17 07:35:32', '2023-07-17 07:35:32', NULL, '28602222539696', 'Jji15rlXeElsseggr59jve0pPoO0DK4FOEA6PO2K7E4UAQarNv', 'FACEBOOK'),
(266, 'Priyam', 'Prakash', 'priyamprakash99@gmail.com', '7493859233', 'Qorq?;)OP7k9', 'http://beautyliciousnj.com/happyhours/public/profileImage/1693198334.jpg', '2023-07-19', '2023-07-19 06:11:01', '2023-08-28 04:52:14', 2308, '105916519910899439179', NULL, 'GOOGLE'),
(268, 'Suyog', 'Kulkarni', 'suyog.quantumitinovation@gmail.com', NULL, 'Izo0TLafjm=V', NULL, NULL, '2023-07-19 06:29:59', '2023-07-19 06:29:59', NULL, '117957837142944344101', NULL, 'GOOGLE'),
(269, 'sarah', 'vertucci', 'imsarahrose@hotmail.com', '9492852470', '$2y$10$Uju9KL0fRh3/nt7xiIkbnOCU2EAmnXhgAudn6t6ybpfICaS9R/Wqi', NULL, '1989-12-29', '2023-07-19 18:22:11', '2023-07-19 18:22:11', NULL, NULL, NULL, NULL),
(270, 'Priyam', 'Prakash', 'digegid3@rc3s.com', '0852085274', '$2y$10$XcDteL1GRATr4kXIvT0y9uH.N2XTaCO4wwLQtgqqpF2U77AMdphh6', NULL, '2023-07-25', '2023-07-25 05:31:36', '2023-07-25 05:31:36', NULL, NULL, NULL, NULL),
(271, 'dev', 'A', 'fejavi5875@sparkroi.com', '1234567891', '$2y$10$4vPBosfFTkWMApEzF00Hi.Z5V.m0wFrfG8Haa4qSnvz4dsF1tGTvy', NULL, '2023-07-25', '2023-07-25 05:33:41', '2023-07-25 05:33:41', NULL, NULL, NULL, NULL),
(272, 'developer', 'Xyz', 'xyz@gmail.com', '9871236540', '$2y$10$0g8d33vHFCUhC/1l5ZNrvOMCqncm/JMTtJdU.VGFHvkzaQr4occXC', NULL, '1998-07-25', '2023-07-25 16:46:09', '2023-07-25 16:46:09', NULL, NULL, NULL, NULL),
(273, 'dom', 'cece', 'dcece-sherley@mycod.us', '7604643880', '$2y$10$ZX/A6.860.qzMO66uEvHXuhmi9Y6EKxEtjoxqVitSGaldFG7aaZum', NULL, '1993-12-21', '2023-08-03 15:49:05', '2023-08-03 15:49:05', NULL, NULL, NULL, NULL),
(274, 'sugandha', 'gupta', 'sugandhagupta@gmail.com', '7536822105', '$2y$10$rKx8gM7SVa9UBnpzP9sA0OVdthDhDIw8SmoWbg8aiiKcJ48nMa1S2', 'http://beautyliciousnj.com/happyhours/public/profileImage/1691472309.jpg', '1997-11-26', '2023-08-08 05:18:54', '2023-08-08 06:10:34', NULL, NULL, NULL, NULL),
(275, 'Sunita', 'Kumari', 'sunita.kumari.adv153@gmail.com', '7321806240', 'M48cCWrX(1*0', NULL, '2000-08-08', '2023-08-08 01:56:05', '2023-08-08 08:57:06', NULL, '104741750263065322062', NULL, 'GOOGLE'),
(276, 'Nuage', 'Laboratoire', 'WOPEAD7A45YBI3RUBQMKJ762OE-01@cloudtestlabaccounts.com', NULL, 'X$Ou#24+v%_W', NULL, NULL, '2023-08-11 21:31:37', '2023-08-11 21:31:37', NULL, '116271358608989819060', NULL, 'GOOGLE'),
(277, 'Chris', 'Chisenga', 'chrisjayden587@gmail.com', NULL, 'l(Sz8Fmtp.#&', NULL, NULL, '2023-08-18 11:21:40', '2023-08-18 11:21:40', NULL, '111894611811167912790', NULL, 'GOOGLE'),
(278, 'sacha kj', 'fhfghkkllljfx', 'gixawo9587@dusyum.com', '7769889019', '$2y$10$i5XgD0cRnavI5rH6L6xFRuWVIsxx2MF7MpQ29iH7ODsbc7ZdHAjSS', 'http://beautyliciousnj.com/happyhours/public/profileImage/1692780087.jpg', '1993-08-23', '2023-08-23 08:33:34', '2023-08-23 08:41:27', 2722, NULL, NULL, NULL),
(279, 'Sean', 'Dawson', 'dawsonseanjune6@gmail.com', '9516105491', '$2y$10$yOGNtLWFFD5ulz8SGkx7EOU6CRBRA9djK4HSfnLzkwKE1FqwimsZa', NULL, '1964-04-01', '2024-03-13 16:28:10', '2024-03-13 16:28:10', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_availibility`
--

CREATE TABLE `user_availibility` (
  `id` int(77) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `day` varchar(201) NOT NULL,
  `start` varchar(200) DEFAULT NULL,
  `end` varchar(200) DEFAULT NULL,
  `is_open` bigint(20) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_availibility`
--

INSERT INTO `user_availibility` (`id`, `user_id`, `day`, `start`, `end`, `is_open`, `created_at`, `updated_at`) VALUES
(1, 1, 'monday', '10:00', '23:59', 1, '2023-01-09 23:26:51', '2023-01-09 23:26:51'),
(2, 1, 'tuesday', '10:00', '23:59', 1, '2023-01-09 23:26:51', '2023-01-09 23:26:51'),
(3, 1, 'wednesday', '10:00', '23:59', 1, '2023-01-09 23:26:51', '2023-01-09 23:26:51'),
(4, 1, 'thursday', '10:00', '23:59', 1, '2023-01-09 23:26:51', '2023-01-09 23:26:51'),
(5, 1, 'friday', '10:00', '23:59', 1, '2023-01-09 23:26:51', '2023-01-09 23:26:51'),
(6, 1, 'saturday', '10:00', '23:59', 1, '2023-01-09 23:26:51', '2023-01-09 23:26:51'),
(7, 1, 'sunday', NULL, NULL, 0, '2023-01-09 23:26:51', '2023-01-09 23:26:51'),
(8, 2, 'monday', '11:00', '18:00', 1, '2023-01-09 23:48:08', '2023-01-09 23:48:08'),
(9, 2, 'tuesday', '11:00', '18:00', 1, '2023-01-09 23:48:09', '2023-01-09 23:48:09'),
(10, 2, 'wednesday', '11:00', '18:00', 1, '2023-01-09 23:48:09', '2023-01-09 23:48:09'),
(11, 2, 'thursday', '11:00', '18:00', 1, '2023-01-09 23:48:09', '2023-01-09 23:48:09'),
(12, 2, 'friday', '11:00', '18:00', 1, '2023-01-09 23:48:09', '2023-01-09 23:48:09'),
(13, 2, 'saturday', NULL, NULL, 0, '2023-01-09 23:48:09', '2023-01-09 23:48:09'),
(14, 2, 'sunday', NULL, NULL, 0, '2023-01-09 23:48:09', '2023-01-09 23:48:09'),
(15, 3, 'monday', '11:00', '00:00', 1, '2023-01-10 00:04:55', '2023-01-10 00:04:55'),
(16, 3, 'tuesday', '11:00', '00:00', 1, '2023-01-10 00:04:55', '2023-01-10 00:04:55'),
(17, 3, 'wednesday', NULL, NULL, 0, '2023-01-10 00:04:55', '2023-01-10 00:04:55'),
(18, 3, 'thursday', NULL, NULL, 0, '2023-01-10 00:04:55', '2023-01-10 00:04:55'),
(19, 3, 'friday', '11:00', '00:00', 1, '2023-01-10 00:04:55', '2023-01-10 00:04:55'),
(20, 3, 'saturday', '10:00', '00:00', 1, '2023-01-10 00:04:55', '2023-01-10 00:04:55'),
(21, 3, 'sunday', '10:00', '00:00', 1, '2023-01-10 00:04:55', '2023-01-10 00:04:55'),
(22, 4, 'monday', '11:30', '20:00', 1, '2023-01-10 00:22:16', '2023-01-10 00:22:16'),
(23, 4, 'tuesday', '11:30', '20:00', 1, '2023-01-10 00:22:16', '2023-01-10 00:22:16'),
(24, 4, 'wednesday', '11:30', '20:00', 1, '2023-01-10 00:22:16', '2023-01-10 00:22:16'),
(25, 4, 'thursday', NULL, NULL, 0, '2023-01-10 00:22:16', '2023-01-10 00:22:16'),
(26, 4, 'friday', '11:30', '21:00', 1, '2023-01-10 00:22:16', '2023-01-10 00:22:16'),
(27, 4, 'saturday', NULL, NULL, 0, '2023-01-10 00:22:16', '2023-01-10 00:22:16'),
(28, 4, 'sunday', '09:00', '20:00', 1, '2023-01-10 00:22:16', '2023-01-10 00:22:16'),
(29, 5, 'monday', '11:00', '22:00', 1, '2023-01-11 14:22:22', '2023-01-11 14:22:22'),
(30, 5, 'tuesday', '11:00', '22:00', 1, '2023-01-11 14:22:22', '2023-01-11 14:22:22'),
(31, 5, 'wednesday', '11:00', '22:00', 1, '2023-01-11 14:22:22', '2023-01-11 14:22:22'),
(32, 5, 'thursday', '11:00', '22:00', 1, '2023-01-11 14:22:22', '2023-01-11 14:22:22'),
(33, 5, 'friday', '11:00', '22:00', 1, '2023-01-11 14:22:22', '2023-01-11 14:22:22'),
(34, 5, 'saturday', '11:00', '22:00', 1, '2023-01-11 14:22:22', '2023-01-12 20:45:03'),
(35, 5, 'sunday', NULL, NULL, 0, '2023-01-11 14:22:22', '2023-01-11 14:22:22'),
(36, 6, 'monday', '11:59', '12:47', 1, '2023-01-18 14:42:03', '2023-01-18 14:42:03'),
(37, 6, 'tuesday', NULL, NULL, 0, '2023-01-18 14:42:03', '2023-01-18 14:42:03'),
(38, 6, 'wednesday', NULL, NULL, 0, '2023-01-18 14:42:03', '2023-01-18 14:42:03'),
(39, 6, 'thursday', NULL, NULL, 0, '2023-01-18 14:42:03', '2023-01-18 14:42:03'),
(40, 6, 'friday', NULL, NULL, 0, '2023-01-18 14:42:03', '2023-01-18 14:42:03'),
(41, 6, 'saturday', NULL, NULL, 0, '2023-01-18 14:42:03', '2023-01-18 14:42:03'),
(42, 6, 'sunday', NULL, NULL, 0, '2023-01-18 14:42:03', '2023-01-18 14:42:03'),
(43, 7, 'monday', '02:15 pm', '09:45 am', 1, '2023-01-19 14:23:51', '2023-04-28 13:27:37'),
(44, 7, 'tuesday', '09:30 am', '06:30 pm', 1, '2023-01-19 14:23:51', '2023-04-28 13:30:06'),
(45, 7, 'wednesday', '09:00 am', '04:00 pm', 1, '2023-01-19 14:23:51', '2023-04-28 13:30:12'),
(46, 7, 'thursday', '07:30 am', '09:30 pm', 1, '2023-01-19 14:23:51', '2023-04-28 13:49:37'),
(47, 7, 'friday', NULL, NULL, 0, '2023-01-19 14:23:51', '2023-01-19 14:23:51'),
(48, 7, 'saturday', NULL, NULL, 0, '2023-01-19 14:23:51', '2023-01-19 14:23:51'),
(49, 7, 'sunday', NULL, NULL, 0, '2023-01-19 14:23:51', '2023-01-19 14:23:51'),
(64, 10, 'monday', '09:00', '17:15', 1, '2023-01-19 18:34:01', '2023-01-19 18:34:01'),
(65, 10, 'tuesday', '09:30', '16:45', 0, '2023-01-19 18:34:01', '2023-01-19 18:37:28'),
(66, 10, 'wednesday', NULL, NULL, 0, '2023-01-19 18:34:01', '2023-01-19 18:34:01'),
(67, 10, 'thursday', NULL, NULL, 0, '2023-01-19 18:34:01', '2023-01-19 18:34:01'),
(68, 10, 'friday', NULL, NULL, 0, '2023-01-19 18:34:01', '2023-01-19 18:34:01'),
(69, 10, 'saturday', NULL, NULL, 0, '2023-01-19 18:34:01', '2023-01-19 18:34:01'),
(70, 10, 'sunday', NULL, NULL, 0, '2023-01-19 18:34:01', '2023-01-19 18:34:01'),
(71, 11, 'monday', '08:00', '20:00', 1, '2023-01-25 17:14:29', '2023-01-25 17:14:29'),
(72, 11, 'tuesday', NULL, NULL, 0, '2023-01-25 17:14:29', '2023-01-25 17:14:29'),
(73, 11, 'wednesday', NULL, NULL, 0, '2023-01-25 17:14:29', '2023-01-25 17:14:29'),
(74, 11, 'thursday', NULL, NULL, 0, '2023-01-25 17:14:29', '2023-01-25 17:14:29'),
(75, 11, 'friday', NULL, NULL, 0, '2023-01-25 17:14:29', '2023-01-25 17:14:29'),
(76, 11, 'saturday', NULL, NULL, 0, '2023-01-25 17:14:29', '2023-01-25 17:14:29'),
(77, 11, 'sunday', NULL, NULL, 0, '2023-01-25 17:14:29', '2023-01-25 17:14:29'),
(85, 13, 'monday', NULL, NULL, 0, '2023-03-21 23:08:52', '2023-03-21 23:08:52'),
(86, 13, 'tuesday', NULL, NULL, 0, '2023-03-21 23:08:52', '2023-03-21 23:08:52'),
(87, 13, 'wednesday', NULL, NULL, 0, '2023-03-21 23:08:52', '2023-03-21 23:08:52'),
(88, 13, 'thursday', NULL, NULL, 0, '2023-03-21 23:08:52', '2023-03-21 23:08:52'),
(89, 13, 'friday', NULL, NULL, 0, '2023-03-21 23:08:52', '2023-03-21 23:08:52'),
(90, 13, 'saturday', NULL, NULL, 0, '2023-03-21 23:08:52', '2023-03-21 23:08:52'),
(91, 13, 'sunday', NULL, NULL, 0, '2023-03-21 23:08:52', '2023-03-21 23:08:52'),
(99, 15, 'monday', '21:00', '10:45', 1, '2023-03-23 11:35:14', '2023-03-31 23:51:15'),
(100, 15, 'tuesday', '12:00 pm', '02:00 am', 0, '2023-03-23 11:35:14', '2023-05-22 23:45:18'),
(101, 15, 'wednesday', NULL, NULL, 0, '2023-03-23 11:35:14', '2023-03-23 11:35:14'),
(102, 15, 'thursday', NULL, NULL, 0, '2023-03-23 11:35:14', '2023-03-23 11:35:14'),
(103, 15, 'friday', NULL, NULL, 0, '2023-03-23 11:35:14', '2023-03-23 11:35:14'),
(104, 15, 'saturday', NULL, NULL, 0, '2023-03-23 11:35:14', '2023-03-23 11:35:14'),
(105, 15, 'sunday', NULL, NULL, 0, '2023-03-23 11:35:14', '2023-03-23 11:35:14'),
(106, 16, 'monday', NULL, NULL, 0, '2023-04-17 22:08:52', '2023-04-17 22:08:52'),
(107, 16, 'tuesday', NULL, NULL, 0, '2023-04-17 22:08:52', '2023-04-17 22:08:52'),
(108, 16, 'wednesday', NULL, NULL, 0, '2023-04-17 22:08:52', '2023-04-17 22:08:52'),
(109, 16, 'thursday', NULL, NULL, 0, '2023-04-17 22:08:52', '2023-04-17 22:08:52'),
(110, 16, 'friday', NULL, NULL, 0, '2023-04-17 22:08:52', '2023-04-17 22:08:52'),
(111, 16, 'saturday', NULL, NULL, 0, '2023-04-17 22:08:52', '2023-04-17 22:08:52'),
(112, 16, 'sunday', NULL, NULL, 0, '2023-04-17 22:08:52', '2023-04-17 22:08:52'),
(120, 18, 'monday', '22:00', '08:15', 0, '2023-04-27 22:07:43', '2023-04-27 23:09:44'),
(121, 18, 'tuesday', NULL, NULL, 0, '2023-04-27 22:07:43', '2023-04-27 22:07:43'),
(122, 18, 'wednesday', NULL, NULL, 0, '2023-04-27 22:07:43', '2023-04-27 22:07:43'),
(123, 18, 'thursday', NULL, NULL, 0, '2023-04-27 22:07:43', '2023-04-27 22:07:43'),
(124, 18, 'friday', NULL, NULL, 0, '2023-04-27 22:07:43', '2023-04-27 22:07:43'),
(125, 18, 'saturday', NULL, NULL, 0, '2023-04-27 22:07:43', '2023-04-27 22:07:43'),
(126, 18, 'sunday', NULL, NULL, 0, '2023-04-27 22:07:43', '2023-04-27 22:07:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favourite`
--
ALTER TABLE `favourite`
  ADD PRIMARY KEY (`id`),
  ADD KEY `favourite_placeId_foreign` (`placeId`),
  ADD KEY `favourite_userId_foreign` (`userId`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `images_place_id_foreign` (`place_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notification_placeId_foreign` (`placeId`);

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `offers_place_id_foerign` (`place_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `places`
--
ALTER TABLE `places`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `place_categories`
--
ALTER TABLE `place_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `places_category_category_id_foreign` (`category_id`),
  ADD KEY `places_category_places_id_foreign` (`places_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_availibility`
--
ALTER TABLE `user_availibility`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_availability_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `favourite`
--
ALTER TABLE `favourite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `id` int(201) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=274;

--
-- AUTO_INCREMENT for table `places`
--
ALTER TABLE `places`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `place_categories`
--
ALTER TABLE `place_categories`
  MODIFY `id` int(100) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=212;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=280;

--
-- AUTO_INCREMENT for table `user_availibility`
--
ALTER TABLE `user_availibility`
  MODIFY `id` int(77) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `favourite`
--
ALTER TABLE `favourite`
  ADD CONSTRAINT `favourite_placeId_foreign` FOREIGN KEY (`placeId`) REFERENCES `places` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `favourite_userId_foreign` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_place_id_foreign` FOREIGN KEY (`place_id`) REFERENCES `places` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `notification_placeId_foreign` FOREIGN KEY (`placeId`) REFERENCES `places` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `offers`
--
ALTER TABLE `offers`
  ADD CONSTRAINT `offers_place_id_foerign` FOREIGN KEY (`place_id`) REFERENCES `places` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `place_categories`
--
ALTER TABLE `place_categories`
  ADD CONSTRAINT `places_category_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `places_category_places_id_foreign` FOREIGN KEY (`places_id`) REFERENCES `places` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_availibility`
--
ALTER TABLE `user_availibility`
  ADD CONSTRAINT `user_availability_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `places` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
