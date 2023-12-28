-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 28, 2023 at 01:44 PM
-- Server version: 8.0.31
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `backendtestdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
CREATE TABLE IF NOT EXISTS `employees` (
  `id` int NOT NULL AUTO_INCREMENT,
  `person_id` int NOT NULL,
  `position_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `person_id`, `position_id`, `created_at`, `updated_at`) VALUES
(1, 2, 2, '2023-12-28 11:29:35', '2023-12-28 11:29:35'),
(2, 3, 3, '2023-12-28 11:35:58', '2023-12-28 11:35:58'),
(3, 4, 2, '2023-12-28 11:39:11', '2023-12-28 11:39:11'),
(4, 5, 1, '2023-12-28 11:39:44', '2023-12-28 11:39:44'),
(7, 15, 3, '2023-12-28 13:32:18', '2023-12-28 13:32:18'),
(6, 14, 1, '2023-12-28 12:07:40', '2023-12-28 13:09:23');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(6, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(7, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(8, '2016_06_01_000004_create_oauth_clients_table', 2),
(9, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('bcaa049285f7de9c83007f618915f54f129d7a9bb6404df5a8afad69029c90146a56c9ed45568006', 1, 1, 'MyApp', '[]', 0, '2023-12-27 21:53:12', '2023-12-27 21:53:12', '2024-12-28 05:53:12'),
('563a31c9bf2088efb341149fb14c47280c0613a5e973f1e71173ba1cb696aa3becc0afe108a76764', 1, 1, 'MyApp', '[]', 0, '2023-12-27 23:32:18', '2023-12-27 23:32:18', '2024-12-28 07:32:18'),
('777ea885b52b7b24e8779bf8953399081d4bfb56657ba934314d60a10d60127f2d8515de5a67ce03', 3, 1, 'MyApp', '[]', 0, '2023-12-28 04:03:01', '2023-12-28 04:03:01', '2024-12-28 12:03:01'),
('71c3f1bf0aad42509e7505001c3be02f1be1e1718156e4dcd32877ec9bb7a75f0756a5a8ce3039e0', 2, 1, 'MyApp', '[]', 0, '2023-12-28 04:06:56', '2023-12-28 04:06:56', '2024-12-28 12:06:56'),
('57146e80a17ff82d4f20aa4f4cd7095316b0723004d2b44c49156a21022306a339a44f781aef358b', 4, 1, 'MyApp', '[]', 0, '2023-12-28 04:07:33', '2023-12-28 04:07:33', '2024-12-28 12:07:33'),
('0c409c295c99357dff4ab1d184fc42dd671fb528bac17afc4f18b34b66048b65b1d58df922ddf1bf', 2, 1, 'MyApp', '[]', 0, '2023-12-28 04:50:52', '2023-12-28 04:50:52', '2024-12-28 12:50:52'),
('89879fc93db0f787a4992b87ea8ee9458e545fd31a63a0957f4419723941b7974b9f4f9d341d0354', 4, 1, 'MyApp', '[]', 0, '2023-12-28 05:26:48', '2023-12-28 05:26:48', '2024-12-28 13:26:48'),
('35bfe05d88d89969f70d28e20b931fb02f63bffa0ead0196451c97c57a7f45e10a181a6cdf087dda', 3, 1, 'MyApp', '[]', 0, '2023-12-28 05:32:47', '2023-12-28 05:32:47', '2024-12-28 13:32:47'),
('2c27fa9058a00350684a64c1f362e4e849e92a58d7851927dc802ba1a8ba9f84b89c1d0ec8f96b93', 2, 1, 'MyApp', '[]', 0, '2023-12-28 05:37:19', '2023-12-28 05:37:19', '2024-12-28 13:37:19'),
('aff962867df0f5f6528d072dec6d584ae97d82ee9d624c13c065110da3f4da54cfde6fd038ebeb71', 1, 1, 'MyApp', '[]', 0, '2023-12-28 05:40:11', '2023-12-28 05:40:11', '2024-12-28 13:40:11'),
('cf3f15d15b13012f23812f2585db07a7f1e34632277416ec0f7e3ca2a35fd7b2fcaed39bb34909d8', 1, 1, 'MyApp', '[]', 0, '2023-12-28 05:40:14', '2023-12-28 05:40:14', '2024-12-28 13:40:14');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'g4uhXburZurf0UnspJaTj3LIK8uX4hoX7CDR7Bpj', NULL, 'http://localhost', 1, 0, 0, '2023-12-27 19:01:56', '2023-12-27 19:01:56'),
(2, NULL, 'Laravel Password Grant Client', '7ZaYvQxcwy1JtdntBP6q0LyueQlZfAE2J6TvLKHw', 'users', 'http://localhost', 0, 1, 0, '2023-12-27 19:01:56', '2023-12-27 19:01:56');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `client_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2023-12-27 19:01:56', '2023-12-27 19:01:56');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `persons`
--

DROP TABLE IF EXISTS `persons`;
CREATE TABLE IF NOT EXISTS `persons` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lastname` varchar(100) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `persons`
--

INSERT INTO `persons` (`id`, `lastname`, `firstname`, `created_at`, `updated_at`) VALUES
(1, 'Aballe', 'Jason', '2023-12-28 18:11:35', NULL),
(2, 'SARAEL', 'NECA ROSE', '2023-12-28 11:29:35', '2023-12-28 11:29:35'),
(3, 'Aballe Test', 'Lyra', '2023-12-28 11:35:58', '2023-12-28 11:35:58'),
(4, 'fasdfas', 'ffsdfsad', '2023-12-28 11:39:11', '2023-12-28 11:39:11'),
(5, 'fdsafsdfsdaf', 'fdasfsd', '2023-12-28 11:39:44', '2023-12-28 11:39:44'),
(6, 'Doe', 'John', '2023-12-28 19:57:22', NULL),
(7, 'Doe', 'John', '2023-12-28 19:58:30', NULL),
(8, 'Doe', 'Brian', '2023-12-28 19:58:30', NULL),
(9, 'Doe', 'Kim', '2023-12-28 19:58:30', NULL),
(10, 'fdsafsdaf', 'test web dev', '2023-12-28 12:03:17', '2023-12-28 12:03:17'),
(11, 'dev', 'add test new web', '2023-12-28 12:04:29', '2023-12-28 12:04:29'),
(12, 'dev', 'test web d', '2023-12-28 12:05:05', '2023-12-28 12:05:05'),
(15, 'fgghjjkj', 'frank', '2023-12-28 13:32:18', '2023-12-28 13:32:28'),
(14, 'fdsafsd', 'web designerdddddddd', '2023-12-28 12:07:40', '2023-12-28 13:08:13');

-- --------------------------------------------------------

--
-- Table structure for table `positions`
--

DROP TABLE IF EXISTS `positions`;
CREATE TABLE IF NOT EXISTS `positions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `position_name` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `positions`
--

INSERT INTO `positions` (`id`, `position_name`, `created_at`, `updated_at`) VALUES
(1, 'Manager', '2023-12-28 18:37:45', NULL),
(2, 'Web Developer', '2023-12-28 18:37:45', NULL),
(3, 'Web Designer', '2023-12-28 18:37:48', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `person_id` int NOT NULL,
  `usertype_id` int NOT NULL DEFAULT '1',
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `person_id`, `usertype_id`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 7, 1, 'manager@gmail.com', NULL, '$2y$12$cV8rDCKcf65Cf9a0dkhJkux9IRojfOFCzw/JHZisyauMBl8EU/pJS', NULL, '2023-12-28 11:58:30', NULL),
(3, 8, 2, 'webdeveloper@gmail.com', NULL, '$2y$12$.vh/VD66TpN0R/WAGmEkgeCZJDgOraNsS9DQyy3jN0ejNf5OogPji', NULL, '2023-12-28 11:58:30', NULL),
(4, 9, 3, 'webdesigner@gmail.com', NULL, '$2y$12$ox/y79ujsdAQl2uqxiILMew6HrjurN6Utbj60LOSBxDBBgWrTD5DS', NULL, '2023-12-28 11:58:31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_type`
--

DROP TABLE IF EXISTS `user_type`;
CREATE TABLE IF NOT EXISTS `user_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `status` int DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user_type`
--

INSERT INTO `user_type` (`id`, `type`, `created_at`, `updated_at`, `status`) VALUES
(1, 'Manager', '2023-12-28 12:13:32', NULL, 1),
(2, 'Web Developer', '2023-12-28 12:13:32', NULL, 1),
(3, 'Web Designer', '2023-12-28 12:13:39', NULL, 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
