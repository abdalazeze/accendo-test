-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 07, 2021 at 12:47 AM
-- Server version: 8.0.21
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `accendo-test-database`
--

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
-- Table structure for table `homeworks`
--

DROP TABLE IF EXISTS `homeworks`;
CREATE TABLE IF NOT EXISTS `homeworks` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `teacher_id` int UNSIGNED DEFAULT NULL,
  `student_id` int UNSIGNED DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `submited` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `homeworks`
--

INSERT INTO `homeworks` (`id`, `teacher_id`, `student_id`, `name`, `description`, `submited`, `created_at`, `updated_at`) VALUES
(1, 1, 21, 'Test homework', 'test', 1, '2021-05-02 19:50:25', '2021-05-04 22:35:00'),
(2, 1, 21, 'Test homework', 'test', 0, '2021-05-02 19:50:25', '2021-05-02 19:50:25');

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
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2021_05_02_022536_create_roles_table', 1),
(10, '2021_05_02_022727_create_role_user_table', 1),
(11, '2021_05_02_030525_create_homeworks_table', 1),
(12, '2019_02_08_030250_create_synchronizations_table', 2);

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
('eff6752259e15f76f7375fca18f7135aef061f14e99a1d024d64f3f6b6a314b4a7b3ff40a65db445', 1, 1, 'MyTeacherApp', '[]', 0, '2021-05-02 18:13:52', '2021-05-02 18:13:52', '2022-05-03 02:13:52'),
('f1ff568e97b9156ae04572c8b73fffe4a7a8e202ee3ebf5625f6996b7e6bf9804914b05f760d7feb', 2, 1, 'MyTeacherApp', '[]', 0, '2021-05-02 20:31:10', '2021-05-02 20:31:10', '2022-05-03 04:31:10'),
('026f5a3d9c781d969d5ce85f58305e5cb084fef229221f0f319a796b78841f738bba8860b6670501', 2, 1, 'MyTeacherApp', '[]', 0, '2021-05-02 20:31:33', '2021-05-02 20:31:33', '2022-05-03 04:31:33'),
('c84665f8d57df9e6cfb87e2d32bdfce05ba9d19c72c6dc7507f47262b1f0574abb684c8c777ba974', 6, 1, 'MyStudentApp', '[]', 0, '2021-05-02 20:33:36', '2021-05-02 20:33:36', '2022-05-03 04:33:36'),
('b1766cdaff03c7284fa68b06688980a403c7b4c2d2afb7ed223dd71e1644486f6963333f0d9130b6', 26, 1, 'MyApp', '[]', 0, '2021-05-03 20:15:28', '2021-05-03 20:15:28', '2022-05-04 04:15:28'),
('52d9efeeeca6741800441217a44ec1a5adc12c77d7ceb66e05b3216a0351daaaa4589b52d4cda924', 27, 1, 'MyApp', '[]', 0, '2021-05-03 20:17:08', '2021-05-03 20:17:08', '2022-05-04 04:17:08'),
('1a9aeab075120ac627cf937a546a9ec445b9fbea6ece01161d92e02789cf0cfc7dd53e17f4ce0ac1', 28, 1, 'MyApp', '[]', 0, '2021-05-03 20:18:11', '2021-05-03 20:18:11', '2022-05-04 04:18:11'),
('56ef1eda88e90e26e4c3687cf371a27658166b4941f81768e5420e85b647b5020e17ac2308303068', 29, 1, 'MyApp', '[]', 0, '2021-05-03 20:23:12', '2021-05-03 20:23:12', '2022-05-04 04:23:12'),
('a1ce3585e14c74beb224abdb9eb1023fc01c2ef25542f57512172ef6fcc86b7d646b233017a8d4a9', 30, 1, 'MyApp', '[]', 0, '2021-05-03 20:27:41', '2021-05-03 20:27:41', '2022-05-04 04:27:41'),
('5183e2ade808ca4e7f0d12f4fe468c6cb53135e6187d069979a54ceef4c32a1a915db927bafa2b3a', 31, 1, 'MyApp', '[]', 0, '2021-05-03 20:29:29', '2021-05-03 20:29:29', '2022-05-04 04:29:29'),
('97a4a2681b76666b38aa1e02a028da37c8c0633bf734e60882a7b3de6bb171abcd8038bd9e1cc9fd', 32, 1, 'MyApp', '[]', 0, '2021-05-03 20:31:17', '2021-05-03 20:31:17', '2022-05-04 04:31:17'),
('4295c427c15092d39593dabc82dec8a6c0662144c8b8aaea4c4574fb8923eaadb1faa1c5b2a37d36', 33, 1, 'MyApp', '[]', 0, '2021-05-03 20:31:48', '2021-05-03 20:31:48', '2022-05-04 04:31:48'),
('6cb99f91a95810c6d5db914bf6d79105c5b55c6fe00e95eecfb2a60122b0cd581c2413e712ee95f9', 34, 1, 'MyApp', '[]', 0, '2021-05-03 20:32:53', '2021-05-03 20:32:53', '2022-05-04 04:32:53'),
('6894c68e655144e5415d01975308c6452552ef388823c75f07a3804aafeaec90495cdad40c27c9ee', 35, 1, 'MyApp', '[]', 0, '2021-05-03 20:33:40', '2021-05-03 20:33:40', '2022-05-04 04:33:40'),
('80e978a746eaad1d96a17f93a9c22c01283e83fa31b123ba9a7311b0b3847964ed9500d45c10f99b', 36, 1, 'MyApp', '[]', 0, '2021-05-03 20:38:07', '2021-05-03 20:38:07', '2022-05-04 04:38:07'),
('f1eab1b8e9226a0bbc324fcc2ea21773488347c3c49c8b498210030038454db38e3076423eb68231', 37, 1, 'MyApp', '[]', 0, '2021-05-03 20:38:41', '2021-05-03 20:38:41', '2022-05-04 04:38:41'),
('3636ad1170a78db2dcaa58b22322e2a2007be027a77b5887a3d0485b4502c24375d063972d3f1d57', 38, 1, 'MyApp', '[]', 0, '2021-05-03 20:39:18', '2021-05-03 20:39:18', '2022-05-04 04:39:18'),
('695e792d27f39af6aafbc4dce71112571d77382c2f53e6d02abd1be674b79d7d893612cf849fcfe7', 39, 1, 'MyApp', '[]', 0, '2021-05-03 20:40:09', '2021-05-03 20:40:09', '2022-05-04 04:40:09'),
('822be591644764dc69e8c548a8d08178ad57ae223bde1e87938e01d95e85aed99dffe7fad5824901', 40, 1, 'MyApp', '[]', 0, '2021-05-03 20:41:13', '2021-05-03 20:41:13', '2022-05-04 04:41:13'),
('7e7df88ef08d543cc3bc747c9b92335498fafcd8e0e52ff80224f3a9a060449125b0979aec1aa002', 41, 1, 'MyApp', '[]', 0, '2021-05-03 20:45:13', '2021-05-03 20:45:13', '2022-05-04 04:45:13'),
('ce90f49873e13cd771d4645dbfb7f979278637be3eb59fc4d409459f438ed5a32639846d05525b6d', 42, 1, 'MyApp', '[]', 0, '2021-05-03 20:45:27', '2021-05-03 20:45:27', '2022-05-04 04:45:27'),
('af85ff6411257847eff731b57346c599c8fd6acaf10480fbfd9ae0ef80bdc7ecfa0ca3f65a973a01', 43, 1, 'MyApp', '[]', 0, '2021-05-03 20:53:18', '2021-05-03 20:53:18', '2022-05-04 04:53:18'),
('ae7b2ea431146809248a20e661a91c4ce160da26441417cb3824d9f8efe0eb31988d9bcb6bbfec36', 44, 1, 'MyApp', '[]', 0, '2021-05-03 20:54:29', '2021-05-03 20:54:29', '2022-05-04 04:54:29'),
('179e1d1538fabd1d3e721a606e0d85939da8e855a218fdd3018243b053c58979ab64e252ddc97b86', 45, 1, 'MyApp', '[]', 0, '2021-05-03 20:55:11', '2021-05-03 20:55:11', '2022-05-04 04:55:11'),
('9f1732b9731bb505833aadebf5aca62e9ac8ee97e647c13667c3f4ea02a0cbd6a3307c305f50fda4', 46, 1, 'MyApp', '[]', 0, '2021-05-03 20:56:03', '2021-05-03 20:56:03', '2022-05-04 04:56:03'),
('81fceeebc07b2395ef48b3093572f5d8b8f0345c17a7913a7a7da6fec69b01670938e85cb8281b48', 47, 1, 'MyApp', '[]', 0, '2021-05-03 20:56:33', '2021-05-03 20:56:33', '2022-05-04 04:56:33'),
('60fd26ee45ca228af7bb68491852109484a4d3a1b3c0bf0281d65339c56e2284fa09f33e646b96db', 48, 1, 'MyApp', '[]', 0, '2021-05-03 22:24:18', '2021-05-03 22:24:18', '2022-05-04 06:24:18'),
('b09489df4ce4cb52eee8d1baff60b14e30b676867f04265e75f92f3644f1d9a857be688a3ae99a28', 49, 1, 'MyApp', '[]', 0, '2021-05-03 22:25:45', '2021-05-03 22:25:45', '2022-05-04 06:25:45'),
('9db4cbc677779524703902d3a2477ec64df9109af396d37b9cefc710426813b68cafd36932ef06bb', 50, 1, 'MyApp', '[]', 0, '2021-05-03 22:26:28', '2021-05-03 22:26:28', '2022-05-04 06:26:28'),
('6b8a61108f992cd98c5444e673e5745cc24c19cba003af9999d0f5ddac5abbf4be29c3aa5437a209', 6, 1, 'MyStudentApp', '[]', 0, '2021-05-03 22:29:01', '2021-05-03 22:29:01', '2022-05-04 06:29:01'),
('d2ea088ccefd45cad3f84a4b18deed96d6a5d73d54e6e73c0ba816f53d2cf33607affea7e6ce6a34', 6, 1, 'MyStudentApp', '[]', 0, '2021-05-03 22:30:05', '2021-05-03 22:30:05', '2022-05-04 06:30:05'),
('24b4a70e4b4b55dd11e73ec5ff6509d39a62f78471c3bec4cfae7273eb6ae3faa511f8b7b273c98e', 21, 1, 'MyStudentApp', '[]', 0, '2021-05-03 22:38:42', '2021-05-03 22:38:42', '2022-05-04 06:38:42'),
('67785330cdaa7a61a2f8b7cba80eef8237e453cddbdd85ce60451b42b580eba56d7b58234231e234', 21, 1, 'MyStudentApp', '[]', 0, '2021-05-03 23:00:18', '2021-05-03 23:00:18', '2022-05-04 07:00:18'),
('dd4b0dee3376580a4063b1c9670f7cce04c3c4aac04752747c7cbd645a6d3c6c47a7a5fad3f9ab2c', 21, 1, 'MyStudentApp', '[]', 0, '2021-05-04 18:55:45', '2021-05-04 18:55:45', '2022-05-05 02:55:45');

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
(1, NULL, 'Laravel Personal Access Client', 'Nd7LTGEQi42eLrTcfB4TwahKynKLD4V1bVCSNiiu', NULL, 'http://localhost', 1, 0, 0, '2021-05-02 18:06:42', '2021-05-02 18:06:42'),
(2, NULL, 'Laravel Password Grant Client', 'LZYZrfrz7VfOcjBkl5u6LVrpXPiILaHJjOZNbmFb', 'users', 'http://localhost', 0, 1, 0, '2021-05-02 18:06:42', '2021-05-02 18:06:42');

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
(1, 1, '2021-05-02 18:06:42', '2021-05-02 18:06:42');

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
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'teacher', 'A teacher user', '2021-05-02 18:06:47', '2021-05-02 18:06:47'),
(2, 'student', 'A student user', '2021-05-02 18:06:47', '2021-05-02 18:06:47');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

DROP TABLE IF EXISTS `role_user`;
CREATE TABLE IF NOT EXISTS `role_user` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`id`, `role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 1, 2, NULL, NULL),
(3, 1, 3, NULL, NULL),
(4, 1, 4, NULL, NULL),
(5, 1, 5, NULL, NULL),
(6, 2, 6, NULL, NULL),
(7, 2, 7, NULL, NULL),
(8, 2, 8, NULL, NULL),
(9, 2, 9, NULL, NULL),
(10, 2, 10, NULL, NULL),
(11, 2, 11, NULL, NULL),
(12, 2, 12, NULL, NULL),
(13, 2, 13, NULL, NULL),
(14, 2, 14, NULL, NULL),
(15, 2, 15, NULL, NULL),
(16, 2, 16, NULL, NULL),
(17, 2, 17, NULL, NULL),
(18, 2, 18, NULL, NULL),
(19, 2, 19, NULL, NULL),
(20, 2, 20, NULL, NULL),
(21, 2, 21, NULL, NULL),
(22, 2, 22, NULL, NULL),
(23, 2, 23, NULL, NULL),
(24, 2, 24, NULL, NULL),
(25, 2, 25, NULL, NULL),
(26, 2, 26, NULL, NULL),
(27, 2, 27, NULL, NULL),
(28, 2, 28, NULL, NULL),
(29, 2, 29, NULL, NULL),
(30, 2, 30, NULL, NULL),
(31, 2, 31, NULL, NULL),
(32, 2, 32, NULL, NULL),
(33, 2, 33, NULL, NULL),
(34, 2, 34, NULL, NULL),
(35, 2, 35, NULL, NULL),
(36, 2, 36, NULL, NULL),
(37, 2, 37, NULL, NULL),
(38, 2, 38, NULL, NULL),
(39, 2, 39, NULL, NULL),
(40, 2, 40, NULL, NULL),
(41, 2, 41, NULL, NULL),
(42, 1, 42, NULL, NULL),
(43, 2, 43, NULL, NULL),
(44, 2, 44, NULL, NULL),
(45, 2, 45, NULL, NULL),
(46, 2, 46, NULL, NULL),
(47, 2, 47, NULL, NULL),
(48, 2, 48, NULL, NULL),
(49, 2, 49, NULL, NULL),
(50, 2, 50, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `synchronizations`
--

DROP TABLE IF EXISTS `synchronizations`;
CREATE TABLE IF NOT EXISTS `synchronizations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `synchronization` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int UNSIGNED NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `synchronizations`
--

INSERT INTO `synchronizations` (`id`, `synchronization`, `batch`) VALUES
(1, '2021_05_06_063620_SyncSynchronization.php', 1),
(2, '2021_05_06_160437_UserSynchronization.php', 6),
(3, '2021_05_06_160454_RoleSynchronization.php', 7),
(4, '2021_05_06_160508_HomeworksSynchronization.php', 8),
(5, '2021_05_06_160724_RoleUserSynchronization.php', 9);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'teacher Name0', 'teacher UserName0', 'teacher0@example.com', NULL, '$2y$10$Owqg7qhyXTBZX6hZnuMYCO95j1cVfgzPzh62qWWMHMIKkTBBewVHm', NULL, '2021-05-02 18:06:53', '2021-05-02 18:06:53'),
(2, 'teacher Name1', 'teacher UserName1', 'teacher1@example.com', NULL, '$2y$10$X.XNWvPqf4vVormPP8xXze.x.MRoStDmdNHK0xFBD5xrFnSC5hcaW', NULL, '2021-05-02 18:06:53', '2021-05-02 18:06:53'),
(3, 'teacher Name2', 'teacher UserName2', 'teacher2@example.com', NULL, '$2y$10$s5WEOw4plkvNNE8myEuZHOEJbBj1Gf4f310wPrXlhEGp2JpDtE00e', NULL, '2021-05-02 18:06:53', '2021-05-02 18:06:53'),
(4, 'teacher Name3', 'teacher UserName3', 'teacher3@example.com', NULL, '$2y$10$oj8frK8OyVFzoCUG8tTIge01YI1rk7EcrpA5cGmtzJw/4WG5cxR7.', NULL, '2021-05-02 18:06:53', '2021-05-02 18:06:53'),
(5, 'teacher Name4', 'teacher UserName4', 'teacher4@example.com', NULL, '$2y$10$LlAgg8VMOnhguUac79X30urblpUB4Nsfcgi6TzM8qrQu5O82fMFP2', NULL, '2021-05-02 18:06:53', '2021-05-02 18:06:53'),
(6, 'student Name0', 'student UserName5', 'student0@example.com', NULL, '$2y$10$invnZal8cfasupkAI6N3HeMLl/pk9XtEuovkVHzV0t1C49wHQLVsy', NULL, '2021-05-02 18:06:53', '2021-05-02 18:06:53'),
(7, 'student Name1', 'student UserName5', 'student1@example.com', NULL, '$2y$10$1twnozfeIYzwWQD4YydTZessffIegfX8zT2WaZUoP3fiHyORbkM/q', NULL, '2021-05-02 18:06:53', '2021-05-02 18:06:53'),
(8, 'student Name2', 'student UserName5', 'student2@example.com', NULL, '$2y$10$MvGCEecBgKZhvIZw/FQlWehOxaDlfKReqgCPYIjvMV/EPvr1gQ6p6', NULL, '2021-05-02 18:06:54', '2021-05-02 18:06:54'),
(9, 'student Name3', 'student UserName5', 'student3@example.com', NULL, '$2y$10$vr0Uk42oSsPI5qLZrczWi./jufd.dajWKiN9/ULTnvcLiXLcH6Omq', NULL, '2021-05-02 18:06:54', '2021-05-02 18:06:54'),
(10, 'student Name4', 'student UserName5', 'student4@example.com', NULL, '$2y$10$z0CLzFiaqA9ImRXkx2qHvuRpnYOsMn6pZCBxiCcf6BZSH/mX7AUBa', NULL, '2021-05-02 18:06:54', '2021-05-02 18:06:54'),
(11, 'student Name5', 'student UserName5', 'student5@example.com', NULL, '$2y$10$RmYReF0xoU5GQAX2sAJX4OGcflmBLaysO6Z74oTRI2TuCKSoT7ZnW', NULL, '2021-05-02 18:06:54', '2021-05-02 18:06:54'),
(12, 'student Name6', 'student UserName5', 'student6@example.com', NULL, '$2y$10$QSSJF8caHe.3hFKkupHF/OS06ep3OAYNdF0WG9ieMoRovtt7KDTee', NULL, '2021-05-02 18:06:54', '2021-05-02 18:06:54'),
(13, 'student Name7', 'student UserName5', 'student7@example.com', NULL, '$2y$10$5viBt8yjXul2RE2aOHr3YO0BRuKQ.S2T8UimHMmq0jhGKepxrUyS6', NULL, '2021-05-02 18:06:54', '2021-05-02 18:06:54'),
(14, 'student Name8', 'student UserName5', 'student8@example.com', NULL, '$2y$10$DCopibmycqnm9MZtstsitO55m9On9UPFa18luIYSgSGL0cSWguR9G', NULL, '2021-05-02 18:06:54', '2021-05-02 18:06:54'),
(15, 'student Name9', 'student UserName5', 'student9@example.com', NULL, '$2y$10$OGE0FHugn8IXM/0ZloEcTuppg2dV4rTImO4iACfB2VDhfVEh51fQ2', NULL, '2021-05-02 18:06:54', '2021-05-02 18:06:54'),
(16, 'student Name10', 'student UserName5', 'student10@example.com', NULL, '$2y$10$vPPkE44DyV3r13OiDW4f/.g8uMSmkxJedVBEVgl0XKfAzrIF8j2wG', NULL, '2021-05-02 18:06:54', '2021-05-02 18:06:54'),
(17, 'student Name11', 'student UserName5', 'student11@example.com', NULL, '$2y$10$aY.2.YMrZFErpH2nSn4F/ObH3MfFvG1EktaxkJ1yySBEgwjziblGe', NULL, '2021-05-02 18:06:54', '2021-05-02 18:06:54'),
(18, 'student Name12', 'student UserName5', 'student12@example.com', NULL, '$2y$10$51HDxNNHdnwh1VGV5me/RuJMLw.o2Z4QyE0CmW4Zz4ejG5vlnNpqu', NULL, '2021-05-02 18:06:54', '2021-05-02 18:06:54'),
(19, 'student Name13', 'student UserName5', 'student13@example.com', NULL, '$2y$10$bGPbXHLFI/NqqNvxIJdCBef/wnFr.Ie9VeKoYPuyDov7gjUbmQRZW', NULL, '2021-05-02 18:06:54', '2021-05-02 18:06:54'),
(20, 'student Name14', 'student UserName5', 'student14@example.com', NULL, '$2y$10$wrrbT9fuA4tmYfYBJ.UqROjUttImWdFeqz3DvTyS5H.78g23RgNtS', NULL, '2021-05-02 18:06:54', '2021-05-02 18:06:54'),
(21, 'student Name15', 'student UserName5', 'student15@example.com', NULL, '$2y$10$MX75kvdV85DtvNQ4hurah.AQRq9nUnnQ8hV8RR3qLZCtWKWPxy4Zq', NULL, '2021-05-02 18:06:54', '2021-05-02 18:06:54'),
(22, 'student Name16', 'student UserName5', 'student16@example.com', NULL, '$2y$10$/ToW06y3HlEJhl9pJxQfWOG0BylOJTDHavoShKcZjiZB1UouZL1Yy', NULL, '2021-05-02 18:06:54', '2021-05-02 18:06:54'),
(23, 'student Name17', 'student UserName5', 'student17@example.com', NULL, '$2y$10$JfTedTyu1XSdGEcJOlgfkeWRVFSVhtWDOR5IkAyaNhTsnHzztcxbK', NULL, '2021-05-02 18:06:54', '2021-05-02 18:06:54'),
(24, 'student Name18', 'student UserName5', 'student18@example.com', NULL, '$2y$10$w2eNTrPUDoM8Xf8Hnq6bIeKd2QtpNWkKRoXCaxxjrLrMlgLzj./MC', NULL, '2021-05-02 18:06:54', '2021-05-02 18:06:54'),
(25, 'student Name19', 'student UserName5', 'student19@example.com', NULL, '$2y$10$AaI/y4tSgF7hV2zrF6x7aeUBcNwetQZokIiRqawApS.0PIKjp3lrS', NULL, '2021-05-02 18:06:54', '2021-05-02 18:06:54'),
(49, 'Test1', 'Testusername', 'Test3@Test.com', NULL, '$2y$10$voWe7fBX16tne/5fzqIB..HDfZwrkaD7msK4/q0gsuFZNHF497oKK', NULL, '2021-05-03 22:25:45', '2021-05-03 22:25:45'),
(50, 'Test1', 'Testusername', 'Test@Test.com', NULL, '$2y$10$.9q0ftshlg5lCgHZk0q2t.ZRI6bLsSkpbDRgSMuqsJ6sZrIcQfMaq', NULL, '2021-05-03 22:26:28', '2021-05-03 22:26:28');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
