-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 15 nov. 2023 à 21:58
-- Version du serveur : 8.0.31
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `portfolio`
--

-- --------------------------------------------------------

--
-- Structure de la table `backend_access_log`
--

DROP TABLE IF EXISTS `backend_access_log`;
CREATE TABLE IF NOT EXISTS `backend_access_log` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int UNSIGNED NOT NULL,
  `ip_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `backend_users`
--

DROP TABLE IF EXISTS `backend_users`;
CREATE TABLE IF NOT EXISTS `backend_users` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activation_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `persist_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reset_password_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permissions` mediumtext COLLATE utf8mb4_unicode_ci,
  `is_activated` tinyint(1) NOT NULL DEFAULT '0',
  `is_superuser` tinyint(1) NOT NULL DEFAULT '0',
  `activated_at` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `role_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_password_expired` tinyint(1) NOT NULL DEFAULT '0',
  `password_changed_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_unique` (`login`),
  UNIQUE KEY `email_unique` (`email`),
  KEY `act_code_index` (`activation_code`),
  KEY `reset_code_index` (`reset_password_code`),
  KEY `admin_role_index` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `backend_users`
--

INSERT INTO `backend_users` (`id`, `first_name`, `last_name`, `login`, `email`, `password`, `activation_code`, `persist_code`, `reset_password_code`, `permissions`, `is_activated`, `is_superuser`, `activated_at`, `last_login`, `deleted_at`, `role_id`, `created_at`, `updated_at`, `is_password_expired`, `password_changed_at`) VALUES
(1, 'Hakim', 'FIDJEL', 'Hakim', 'hakimfidjel.pro@gmail.com', '$2y$10$dMUKIUka6A8eBfZcFlc0p.ymiFu4dRMhi6W1MXFRc62vbYigB4S3y', NULL, '$2y$10$LJlo5kipFlFjragbvZHBzuP0Wc9adhC072ekoiEWbY4j.lfddL4Vu', NULL, '', 1, 1, NULL, '2023-10-20 18:40:34', NULL, 1, '2023-10-20 18:40:34', '2023-10-20 18:40:34', 0, '2023-10-20 18:40:34');

-- --------------------------------------------------------

--
-- Structure de la table `backend_users_groups`
--

DROP TABLE IF EXISTS `backend_users_groups`;
CREATE TABLE IF NOT EXISTS `backend_users_groups` (
  `user_id` int UNSIGNED NOT NULL,
  `user_group_id` int UNSIGNED NOT NULL,
  PRIMARY KEY (`user_id`,`user_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `backend_users_groups`
--

INSERT INTO `backend_users_groups` (`user_id`, `user_group_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `backend_user_groups`
--

DROP TABLE IF EXISTS `backend_user_groups`;
CREATE TABLE IF NOT EXISTS `backend_user_groups` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_new_user_default` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_unique` (`name`),
  KEY `code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `backend_user_groups`
--

INSERT INTO `backend_user_groups` (`id`, `name`, `code`, `description`, `is_new_user_default`, `created_at`, `updated_at`) VALUES
(1, 'Owners', 'owners', 'Default group for website owners.', 0, '2023-10-20 18:39:48', '2023-10-20 18:39:48');

-- --------------------------------------------------------

--
-- Structure de la table `backend_user_preferences`
--

DROP TABLE IF EXISTS `backend_user_preferences`;
CREATE TABLE IF NOT EXISTS `backend_user_preferences` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int UNSIGNED NOT NULL,
  `namespace` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `site_id` int UNSIGNED DEFAULT NULL,
  `site_root_id` int UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_item_index` (`user_id`,`namespace`,`group`,`item`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `backend_user_preferences`
--

INSERT INTO `backend_user_preferences` (`id`, `user_id`, `namespace`, `group`, `item`, `value`, `site_id`, `site_root_id`) VALUES
(1, 1, 'cms', 'theme', 'edit', '\"portfolio\"', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `backend_user_roles`
--

DROP TABLE IF EXISTS `backend_user_roles`;
CREATE TABLE IF NOT EXISTS `backend_user_roles` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color_background` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `permissions` mediumtext COLLATE utf8mb4_unicode_ci,
  `is_system` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_unique` (`name`),
  KEY `role_code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `backend_user_roles`
--

INSERT INTO `backend_user_roles` (`id`, `name`, `code`, `color_background`, `description`, `permissions`, `is_system`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 'Developer', 'developer', '#3498db', 'Site administrator with access to developer tools.', '', 1, 1, '2023-10-20 18:39:48', '2023-10-20 18:39:48'),
(2, 'Publisher', 'publisher', '#1abc9c', 'Site editor with access to publishing tools.', '', 1, 2, '2023-10-20 18:39:48', '2023-10-20 18:39:48');

-- --------------------------------------------------------

--
-- Structure de la table `backend_user_throttle`
--

DROP TABLE IF EXISTS `backend_user_throttle`;
CREATE TABLE IF NOT EXISTS `backend_user_throttle` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int UNSIGNED DEFAULT NULL,
  `ip_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attempts` int NOT NULL DEFAULT '0',
  `last_attempt_at` timestamp NULL DEFAULT NULL,
  `is_suspended` tinyint(1) NOT NULL DEFAULT '0',
  `suspended_at` timestamp NULL DEFAULT NULL,
  `is_banned` tinyint(1) NOT NULL DEFAULT '0',
  `banned_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `backend_user_throttle_user_id_index` (`user_id`),
  KEY `backend_user_throttle_ip_address_index` (`ip_address`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `backend_user_throttle`
--

INSERT INTO `backend_user_throttle` (`id`, `user_id`, `ip_address`, `attempts`, `last_attempt_at`, `is_suspended`, `suspended_at`, `is_banned`, `banned_at`) VALUES
(1, 1, '127.0.0.1', 0, NULL, 0, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `cache`
--

DROP TABLE IF EXISTS `cache`;
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  UNIQUE KEY `cache_key_unique` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cms_theme_data`
--

DROP TABLE IF EXISTS `cms_theme_data`;
CREATE TABLE IF NOT EXISTS `cms_theme_data` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `theme` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_theme_data_theme_index` (`theme`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cms_theme_logs`
--

DROP TABLE IF EXISTS `cms_theme_logs`;
CREATE TABLE IF NOT EXISTS `cms_theme_logs` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_template` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `old_content` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_theme_logs_type_index` (`type`),
  KEY `cms_theme_logs_theme_index` (`theme`),
  KEY `cms_theme_logs_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cms_theme_templates`
--

DROP TABLE IF EXISTS `cms_theme_templates`;
CREATE TABLE IF NOT EXISTS `cms_theme_templates` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `source` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_size` int UNSIGNED NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_theme_templates_source_index` (`source`),
  KEY `cms_theme_templates_path_index` (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `deferred_bindings`
--

DROP TABLE IF EXISTS `deferred_bindings`;
CREATE TABLE IF NOT EXISTS `deferred_bindings` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `master_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `master_field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slave_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slave_id` int NOT NULL,
  `pivot_data` mediumtext COLLATE utf8mb4_unicode_ci,
  `session_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_bind` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci,
  `failed_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_reserved_at_index` (`queue`,`reserved_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2013_10_01_000001_Db_Deferred_Bindings', 1),
(2, '2013_10_01_000002_Db_System_Files', 1),
(3, '2013_10_01_000003_Db_System_Plugin_Versions', 1),
(4, '2013_10_01_000004_Db_System_Plugin_History', 1),
(5, '2013_10_01_000005_Db_System_Settings', 1),
(6, '2013_10_01_000006_Db_System_Parameters', 1),
(7, '2013_10_01_000008_Db_System_Mail_Templates', 1),
(8, '2013_10_01_000009_Db_System_Mail_Layouts', 1),
(9, '2014_10_01_000010_Db_Jobs', 1),
(10, '2014_10_01_000011_Db_System_Event_Logs', 1),
(11, '2014_10_01_000012_Db_System_Request_Logs', 1),
(12, '2014_10_01_000013_Db_System_Sessions', 1),
(13, '2015_10_01_000016_Db_Cache', 1),
(14, '2015_10_01_000017_Db_System_Revisions', 1),
(15, '2015_10_01_000018_Db_FailedJobs', 1),
(16, '2017_10_01_000023_Db_System_Mail_Partials', 1),
(17, '2021_10_01_000025_Db_Add_Pivot_Data_To_Deferred_Bindings', 1),
(18, '2022_10_01_000026_Db_System_Site_Definitions', 1),
(19, '2023_10_01_000027_Db_Add_Site_To_Settings', 1),
(20, '2023_10_01_000028_Db_Add_Restrict_Roles_To_Sites', 1),
(21, '2023_10_01_000029_Db_System_Site_Groups', 1),
(22, '2023_10_01_000030_Db_Add_Group_To_Sites', 1),
(23, '2013_10_01_000001_Db_Backend_Users', 2),
(24, '2013_10_01_000002_Db_Backend_User_Groups', 2),
(25, '2013_10_01_000003_Db_Backend_Users_Groups', 2),
(26, '2013_10_01_000004_Db_Backend_User_Throttle', 2),
(27, '2014_01_04_000005_Db_Backend_User_Preferences', 2),
(28, '2014_10_01_000006_Db_Backend_Access_Log', 2),
(29, '2017_10_01_000010_Db_Backend_User_Roles', 2),
(30, '2018_12_16_000011_Db_Backend_Add_Deleted_At', 2),
(31, '2022_10_01_000012_Db_Backend_User_Roles_Sortable', 2),
(32, '2023_10_01_000013_Db_Add_Site_To_Preferences', 2),
(33, '2023_10_01_000014_Db_Add_User_Expired_Password', 2),
(34, '2014_10_01_000001_Db_Cms_Theme_Data', 3),
(35, '2017_10_01_000003_Db_Cms_Theme_Logs', 3),
(36, '2018_11_01_000001_Db_Cms_Theme_Templates', 3),
(37, '2021_05_01_000001_Db_Tailor_Globals', 4),
(38, '2021_05_01_000002_Db_Tailor_Content', 4),
(39, '2021_06_01_000003_Db_Tailor_PreviewToken', 4),
(40, '2023_10_01_000004_Db_Tailor_Content_Joins', 4);

-- --------------------------------------------------------

--
-- Structure de la table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci,
  `last_activity` int DEFAULT NULL,
  `user_id` int UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  UNIQUE KEY `sessions_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `system_event_logs`
--

DROP TABLE IF EXISTS `system_event_logs`;
CREATE TABLE IF NOT EXISTS `system_event_logs` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `level` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `details` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_event_logs_level_index` (`level`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `system_event_logs`
--

INSERT INTO `system_event_logs` (`id`, `level`, `message`, `details`, `created_at`, `updated_at`) VALUES
(1, 'error', 'GuzzleHttp\\Exception\\RequestException: cURL error 60: SSL certificate problem: unable to get local issuer certificate (see https://curl.haxx.se/libcurl/c/libcurl-errors.html) for https://gateway.octobercms.com/api/project/detail in C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\Handler\\CurlFactory.php:211\nStack trace:\n#0 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\Handler\\CurlFactory.php(158): GuzzleHttp\\Handler\\CurlFactory::createRejection(Object(GuzzleHttp\\Handler\\EasyHandle), Array)\n#1 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\Handler\\CurlFactory.php(110): GuzzleHttp\\Handler\\CurlFactory::finishError(Object(GuzzleHttp\\Handler\\CurlHandler), Object(GuzzleHttp\\Handler\\EasyHandle), Object(GuzzleHttp\\Handler\\CurlFactory))\n#2 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\Handler\\CurlHandler.php(47): GuzzleHttp\\Handler\\CurlFactory::finish(Object(GuzzleHttp\\Handler\\CurlHandler), Object(GuzzleHttp\\Handler\\EasyHandle), Object(GuzzleHttp\\Handler\\CurlFactory))\n#3 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\Handler\\Proxy.php(28): GuzzleHttp\\Handler\\CurlHandler->__invoke(Object(GuzzleHttp\\Psr7\\Request), Array)\n#4 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\Handler\\Proxy.php(48): GuzzleHttp\\Handler\\Proxy::GuzzleHttp\\Handler\\{closure}(Object(GuzzleHttp\\Psr7\\Request), Array)\n#5 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Http\\Client\\PendingRequest.php(1150): GuzzleHttp\\Handler\\Proxy::GuzzleHttp\\Handler\\{closure}(Object(GuzzleHttp\\Psr7\\Request), Array)\n#6 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Http\\Client\\PendingRequest.php(1116): Illuminate\\Http\\Client\\PendingRequest->Illuminate\\Http\\Client\\{closure}(Object(GuzzleHttp\\Psr7\\Request), Array)\n#7 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Http\\Client\\PendingRequest.php(1102): Illuminate\\Http\\Client\\PendingRequest->Illuminate\\Http\\Client\\{closure}(Object(GuzzleHttp\\Psr7\\Request), Array)\n#8 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\PrepareBodyMiddleware.php(64): Illuminate\\Http\\Client\\PendingRequest->Illuminate\\Http\\Client\\{closure}(Object(GuzzleHttp\\Psr7\\Request), Array)\n#9 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\Middleware.php(38): GuzzleHttp\\PrepareBodyMiddleware->__invoke(Object(GuzzleHttp\\Psr7\\Request), Array)\n#10 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\RedirectMiddleware.php(71): GuzzleHttp\\Middleware::GuzzleHttp\\{closure}(Object(GuzzleHttp\\Psr7\\Request), Array)\n#11 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\Middleware.php(63): GuzzleHttp\\RedirectMiddleware->__invoke(Object(GuzzleHttp\\Psr7\\Request), Array)\n#12 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\HandlerStack.php(75): GuzzleHttp\\Middleware::GuzzleHttp\\{closure}(Object(GuzzleHttp\\Psr7\\Request), Array)\n#13 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\Client.php(333): GuzzleHttp\\HandlerStack->__invoke(Object(GuzzleHttp\\Psr7\\Request), Array)\n#14 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\Client.php(169): GuzzleHttp\\Client->transfer(Object(GuzzleHttp\\Psr7\\Request), Array)\n#15 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\Client.php(189): GuzzleHttp\\Client->requestAsync(\'POST\', Object(GuzzleHttp\\Psr7\\Uri), Array)\n#16 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Http\\Client\\PendingRequest.php(961): GuzzleHttp\\Client->request(\'POST\', \'https://gateway...\', Array)\n#17 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Http\\Client\\PendingRequest.php(823): Illuminate\\Http\\Client\\PendingRequest->sendRequest(\'POST\', \'https://gateway...\', Array)\n#18 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\helpers.php(247): Illuminate\\Http\\Client\\PendingRequest->Illuminate\\Http\\Client\\{closure}(1)\n#19 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Http\\Client\\PendingRequest.php(821): retry(0, Object(Closure), 100, Object(Closure))\n#20 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Http\\Client\\PendingRequest.php(727): Illuminate\\Http\\Client\\PendingRequest->send(\'POST\', \'https://gateway...\', Array)\n#21 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\system\\classes\\updatemanager\\HasGatewayAccess.php(145): Illuminate\\Http\\Client\\PendingRequest->post(\'https://gateway...\', Array)\n#22 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\system\\classes\\updatemanager\\HasGatewayAccess.php(39): System\\Classes\\UpdateManager->makeHttpRequest(\'https://gateway...\', Array)\n#23 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\system\\classes\\updatemanager\\ManagesProject.php(163): System\\Classes\\UpdateManager->requestServerData(\'project/detail\', Array)\n#24 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\system\\classes\\updatemanager\\ManagesProject.php(62): System\\Classes\\UpdateManager->requestProjectDetails(\'0Zmt3ZwpgZwp4Aw...\')\n#25 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\system\\controllers\\Updates.php(83): System\\Classes\\UpdateManager->getProjectDetails()\n#26 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\system\\traits\\DependencyMaker.php(29): System\\Controllers\\Updates->index()\n#27 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\backend\\classes\\Controller.php(387): Backend\\Classes\\Controller->makeCallMethod(Object(System\\Controllers\\Updates), \'index\', Array)\n#28 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\backend\\classes\\Controller.php(269): Backend\\Classes\\Controller->execPageAction(\'index\', Array)\n#29 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\backend\\classes\\BackendController.php(98): Backend\\Classes\\Controller->run(\'index\', Array)\n#30 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(54): Backend\\Classes\\BackendController->run(\'system/updates\')\n#31 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(43): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#32 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(259): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Backend\\Classes\\BackendController), \'run\')\n#33 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(205): Illuminate\\Routing\\Route->runController()\n#34 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(798): Illuminate\\Routing\\Route->run()\n#35 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#36 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\SubstituteBindings.php(50): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#37 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#38 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#39 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#40 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(121): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#41 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(64): Illuminate\\Session\\Middleware\\StartSession->handleStatefulRequest(Object(Illuminate\\Http\\Request), Object(Illuminate\\Session\\Store), Object(Closure))\n#42 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#43 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#44 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#45 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(67): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#46 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#47 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#48 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(797): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#49 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(776): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#50 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(740): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#51 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\october\\rain\\src\\Router\\CoreRouter.php(32): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#52 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(190): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#53 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#54 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance.php(86): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#55 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\october\\rain\\src\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(23): Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#56 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): October\\Rain\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#57 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#58 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(165): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#59 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(134): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#60 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\index.php(42): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#61 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\october\\rain\\src\\Foundation\\resources\\server.php(18): require_once(\'C:\\\\Users\\\\Hakim\\\\...\')\n#62 {main}', '[]', '2023-10-20 18:41:49', '2023-10-20 18:41:49'),
(2, 'error', 'GuzzleHttp\\Exception\\RequestException: cURL error 60: SSL certificate problem: unable to get local issuer certificate (see https://curl.haxx.se/libcurl/c/libcurl-errors.html) for https://gateway.octobercms.com/api/project/detail in C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\Handler\\CurlFactory.php:211\nStack trace:\n#0 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\Handler\\CurlFactory.php(158): GuzzleHttp\\Handler\\CurlFactory::createRejection(Object(GuzzleHttp\\Handler\\EasyHandle), Array)\n#1 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\Handler\\CurlFactory.php(110): GuzzleHttp\\Handler\\CurlFactory::finishError(Object(GuzzleHttp\\Handler\\CurlHandler), Object(GuzzleHttp\\Handler\\EasyHandle), Object(GuzzleHttp\\Handler\\CurlFactory))\n#2 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\Handler\\CurlHandler.php(47): GuzzleHttp\\Handler\\CurlFactory::finish(Object(GuzzleHttp\\Handler\\CurlHandler), Object(GuzzleHttp\\Handler\\EasyHandle), Object(GuzzleHttp\\Handler\\CurlFactory))\n#3 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\Handler\\Proxy.php(28): GuzzleHttp\\Handler\\CurlHandler->__invoke(Object(GuzzleHttp\\Psr7\\Request), Array)\n#4 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\Handler\\Proxy.php(48): GuzzleHttp\\Handler\\Proxy::GuzzleHttp\\Handler\\{closure}(Object(GuzzleHttp\\Psr7\\Request), Array)\n#5 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Http\\Client\\PendingRequest.php(1150): GuzzleHttp\\Handler\\Proxy::GuzzleHttp\\Handler\\{closure}(Object(GuzzleHttp\\Psr7\\Request), Array)\n#6 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Http\\Client\\PendingRequest.php(1116): Illuminate\\Http\\Client\\PendingRequest->Illuminate\\Http\\Client\\{closure}(Object(GuzzleHttp\\Psr7\\Request), Array)\n#7 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Http\\Client\\PendingRequest.php(1102): Illuminate\\Http\\Client\\PendingRequest->Illuminate\\Http\\Client\\{closure}(Object(GuzzleHttp\\Psr7\\Request), Array)\n#8 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\PrepareBodyMiddleware.php(64): Illuminate\\Http\\Client\\PendingRequest->Illuminate\\Http\\Client\\{closure}(Object(GuzzleHttp\\Psr7\\Request), Array)\n#9 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\Middleware.php(38): GuzzleHttp\\PrepareBodyMiddleware->__invoke(Object(GuzzleHttp\\Psr7\\Request), Array)\n#10 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\RedirectMiddleware.php(71): GuzzleHttp\\Middleware::GuzzleHttp\\{closure}(Object(GuzzleHttp\\Psr7\\Request), Array)\n#11 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\Middleware.php(63): GuzzleHttp\\RedirectMiddleware->__invoke(Object(GuzzleHttp\\Psr7\\Request), Array)\n#12 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\HandlerStack.php(75): GuzzleHttp\\Middleware::GuzzleHttp\\{closure}(Object(GuzzleHttp\\Psr7\\Request), Array)\n#13 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\Client.php(333): GuzzleHttp\\HandlerStack->__invoke(Object(GuzzleHttp\\Psr7\\Request), Array)\n#14 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\Client.php(169): GuzzleHttp\\Client->transfer(Object(GuzzleHttp\\Psr7\\Request), Array)\n#15 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\Client.php(189): GuzzleHttp\\Client->requestAsync(\'POST\', Object(GuzzleHttp\\Psr7\\Uri), Array)\n#16 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Http\\Client\\PendingRequest.php(961): GuzzleHttp\\Client->request(\'POST\', \'https://gateway...\', Array)\n#17 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Http\\Client\\PendingRequest.php(823): Illuminate\\Http\\Client\\PendingRequest->sendRequest(\'POST\', \'https://gateway...\', Array)\n#18 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\helpers.php(247): Illuminate\\Http\\Client\\PendingRequest->Illuminate\\Http\\Client\\{closure}(1)\n#19 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Http\\Client\\PendingRequest.php(821): retry(0, Object(Closure), 100, Object(Closure))\n#20 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Http\\Client\\PendingRequest.php(727): Illuminate\\Http\\Client\\PendingRequest->send(\'POST\', \'https://gateway...\', Array)\n#21 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\system\\classes\\updatemanager\\HasGatewayAccess.php(145): Illuminate\\Http\\Client\\PendingRequest->post(\'https://gateway...\', Array)\n#22 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\system\\classes\\updatemanager\\HasGatewayAccess.php(39): System\\Classes\\UpdateManager->makeHttpRequest(\'https://gateway...\', Array)\n#23 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\system\\classes\\updatemanager\\ManagesProject.php(163): System\\Classes\\UpdateManager->requestServerData(\'project/detail\', Array)\n#24 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\system\\classes\\updatemanager\\ManagesProject.php(62): System\\Classes\\UpdateManager->requestProjectDetails(\'0Zmt3ZwpgZwp4Aw...\')\n#25 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\system\\controllers\\Updates.php(83): System\\Classes\\UpdateManager->getProjectDetails()\n#26 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\system\\traits\\DependencyMaker.php(29): System\\Controllers\\Updates->index()\n#27 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\backend\\classes\\Controller.php(387): Backend\\Classes\\Controller->makeCallMethod(Object(System\\Controllers\\Updates), \'index\', Array)\n#28 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\backend\\classes\\Controller.php(269): Backend\\Classes\\Controller->execPageAction(\'index\', Array)\n#29 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\backend\\classes\\BackendController.php(98): Backend\\Classes\\Controller->run(\'index\', Array)\n#30 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(54): Backend\\Classes\\BackendController->run(\'system/updates\')\n#31 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(43): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#32 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(259): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Backend\\Classes\\BackendController), \'run\')\n#33 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(205): Illuminate\\Routing\\Route->runController()\n#34 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(798): Illuminate\\Routing\\Route->run()\n#35 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#36 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\SubstituteBindings.php(50): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#37 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#38 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#39 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#40 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(121): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#41 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(64): Illuminate\\Session\\Middleware\\StartSession->handleStatefulRequest(Object(Illuminate\\Http\\Request), Object(Illuminate\\Session\\Store), Object(Closure))\n#42 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#43 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#44 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#45 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(67): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#46 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#47 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#48 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(797): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#49 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(776): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#50 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(740): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#51 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\october\\rain\\src\\Router\\CoreRouter.php(32): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#52 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(190): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#53 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#54 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance.php(86): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#55 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\october\\rain\\src\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(23): Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#56 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): October\\Rain\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#57 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#58 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(165): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#59 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(134): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#60 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\index.php(42): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#61 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\october\\rain\\src\\Foundation\\resources\\server.php(18): require_once(\'C:\\\\Users\\\\Hakim\\\\...\')\n#62 {main}', '[]', '2023-10-20 18:41:50', '2023-10-20 18:41:50'),
(3, 'error', 'GuzzleHttp\\Exception\\RequestException: cURL error 60: SSL certificate problem: unable to get local issuer certificate (see https://curl.haxx.se/libcurl/c/libcurl-errors.html) for https://gateway.octobercms.com/api/project/detail in C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\Handler\\CurlFactory.php:211\nStack trace:\n#0 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\Handler\\CurlFactory.php(158): GuzzleHttp\\Handler\\CurlFactory::createRejection(Object(GuzzleHttp\\Handler\\EasyHandle), Array)\n#1 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\Handler\\CurlFactory.php(110): GuzzleHttp\\Handler\\CurlFactory::finishError(Object(GuzzleHttp\\Handler\\CurlHandler), Object(GuzzleHttp\\Handler\\EasyHandle), Object(GuzzleHttp\\Handler\\CurlFactory))\n#2 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\Handler\\CurlHandler.php(47): GuzzleHttp\\Handler\\CurlFactory::finish(Object(GuzzleHttp\\Handler\\CurlHandler), Object(GuzzleHttp\\Handler\\EasyHandle), Object(GuzzleHttp\\Handler\\CurlFactory))\n#3 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\Handler\\Proxy.php(28): GuzzleHttp\\Handler\\CurlHandler->__invoke(Object(GuzzleHttp\\Psr7\\Request), Array)\n#4 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\Handler\\Proxy.php(48): GuzzleHttp\\Handler\\Proxy::GuzzleHttp\\Handler\\{closure}(Object(GuzzleHttp\\Psr7\\Request), Array)\n#5 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Http\\Client\\PendingRequest.php(1150): GuzzleHttp\\Handler\\Proxy::GuzzleHttp\\Handler\\{closure}(Object(GuzzleHttp\\Psr7\\Request), Array)\n#6 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Http\\Client\\PendingRequest.php(1116): Illuminate\\Http\\Client\\PendingRequest->Illuminate\\Http\\Client\\{closure}(Object(GuzzleHttp\\Psr7\\Request), Array)\n#7 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Http\\Client\\PendingRequest.php(1102): Illuminate\\Http\\Client\\PendingRequest->Illuminate\\Http\\Client\\{closure}(Object(GuzzleHttp\\Psr7\\Request), Array)\n#8 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\PrepareBodyMiddleware.php(64): Illuminate\\Http\\Client\\PendingRequest->Illuminate\\Http\\Client\\{closure}(Object(GuzzleHttp\\Psr7\\Request), Array)\n#9 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\Middleware.php(38): GuzzleHttp\\PrepareBodyMiddleware->__invoke(Object(GuzzleHttp\\Psr7\\Request), Array)\n#10 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\RedirectMiddleware.php(71): GuzzleHttp\\Middleware::GuzzleHttp\\{closure}(Object(GuzzleHttp\\Psr7\\Request), Array)\n#11 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\Middleware.php(63): GuzzleHttp\\RedirectMiddleware->__invoke(Object(GuzzleHttp\\Psr7\\Request), Array)\n#12 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\HandlerStack.php(75): GuzzleHttp\\Middleware::GuzzleHttp\\{closure}(Object(GuzzleHttp\\Psr7\\Request), Array)\n#13 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\Client.php(333): GuzzleHttp\\HandlerStack->__invoke(Object(GuzzleHttp\\Psr7\\Request), Array)\n#14 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\Client.php(169): GuzzleHttp\\Client->transfer(Object(GuzzleHttp\\Psr7\\Request), Array)\n#15 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\Client.php(189): GuzzleHttp\\Client->requestAsync(\'POST\', Object(GuzzleHttp\\Psr7\\Uri), Array)\n#16 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Http\\Client\\PendingRequest.php(961): GuzzleHttp\\Client->request(\'POST\', \'https://gateway...\', Array)\n#17 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Http\\Client\\PendingRequest.php(823): Illuminate\\Http\\Client\\PendingRequest->sendRequest(\'POST\', \'https://gateway...\', Array)\n#18 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\helpers.php(247): Illuminate\\Http\\Client\\PendingRequest->Illuminate\\Http\\Client\\{closure}(1)\n#19 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Http\\Client\\PendingRequest.php(821): retry(0, Object(Closure), 100, Object(Closure))\n#20 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Http\\Client\\PendingRequest.php(727): Illuminate\\Http\\Client\\PendingRequest->send(\'POST\', \'https://gateway...\', Array)\n#21 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\system\\classes\\updatemanager\\HasGatewayAccess.php(145): Illuminate\\Http\\Client\\PendingRequest->post(\'https://gateway...\', Array)\n#22 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\system\\classes\\updatemanager\\HasGatewayAccess.php(39): System\\Classes\\UpdateManager->makeHttpRequest(\'https://gateway...\', Array)\n#23 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\system\\classes\\updatemanager\\ManagesProject.php(163): System\\Classes\\UpdateManager->requestServerData(\'project/detail\', Array)\n#24 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\system\\classes\\updatemanager\\ManagesProject.php(62): System\\Classes\\UpdateManager->requestProjectDetails(\'0Zmt3ZwpgZwp4Aw...\')\n#25 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\system\\controllers\\Updates.php(83): System\\Classes\\UpdateManager->getProjectDetails()\n#26 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\system\\traits\\DependencyMaker.php(29): System\\Controllers\\Updates->index()\n#27 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\backend\\classes\\Controller.php(387): Backend\\Classes\\Controller->makeCallMethod(Object(System\\Controllers\\Updates), \'index\', Array)\n#28 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\backend\\classes\\Controller.php(269): Backend\\Classes\\Controller->execPageAction(\'index\', Array)\n#29 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\backend\\classes\\BackendController.php(98): Backend\\Classes\\Controller->run(\'index\', Array)\n#30 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(54): Backend\\Classes\\BackendController->run(\'system/updates\')\n#31 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(43): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#32 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(259): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Backend\\Classes\\BackendController), \'run\')\n#33 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(205): Illuminate\\Routing\\Route->runController()\n#34 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(798): Illuminate\\Routing\\Route->run()\n#35 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#36 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\SubstituteBindings.php(50): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#37 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#38 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#39 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#40 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(121): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#41 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(64): Illuminate\\Session\\Middleware\\StartSession->handleStatefulRequest(Object(Illuminate\\Http\\Request), Object(Illuminate\\Session\\Store), Object(Closure))\n#42 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#43 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#44 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#45 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(67): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#46 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#47 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#48 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(797): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#49 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(776): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#50 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(740): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#51 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\october\\rain\\src\\Router\\CoreRouter.php(32): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#52 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(190): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#53 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#54 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance.php(86): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#55 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\october\\rain\\src\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(23): Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#56 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): October\\Rain\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#57 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#58 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(165): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#59 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(134): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#60 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\index.php(42): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#61 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\october\\rain\\src\\Foundation\\resources\\server.php(18): require_once(\'C:\\\\Users\\\\Hakim\\\\...\')\n#62 {main}', '[]', '2023-10-20 18:44:53', '2023-10-20 18:44:53');
INSERT INTO `system_event_logs` (`id`, `level`, `message`, `details`, `created_at`, `updated_at`) VALUES
(4, 'error', 'GuzzleHttp\\Exception\\RequestException: cURL error 60: SSL certificate problem: unable to get local issuer certificate (see https://curl.haxx.se/libcurl/c/libcurl-errors.html) for https://gateway.octobercms.com/api/project/detail in C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\Handler\\CurlFactory.php:211\nStack trace:\n#0 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\Handler\\CurlFactory.php(158): GuzzleHttp\\Handler\\CurlFactory::createRejection(Object(GuzzleHttp\\Handler\\EasyHandle), Array)\n#1 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\Handler\\CurlFactory.php(110): GuzzleHttp\\Handler\\CurlFactory::finishError(Object(GuzzleHttp\\Handler\\CurlHandler), Object(GuzzleHttp\\Handler\\EasyHandle), Object(GuzzleHttp\\Handler\\CurlFactory))\n#2 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\Handler\\CurlHandler.php(47): GuzzleHttp\\Handler\\CurlFactory::finish(Object(GuzzleHttp\\Handler\\CurlHandler), Object(GuzzleHttp\\Handler\\EasyHandle), Object(GuzzleHttp\\Handler\\CurlFactory))\n#3 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\Handler\\Proxy.php(28): GuzzleHttp\\Handler\\CurlHandler->__invoke(Object(GuzzleHttp\\Psr7\\Request), Array)\n#4 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\Handler\\Proxy.php(48): GuzzleHttp\\Handler\\Proxy::GuzzleHttp\\Handler\\{closure}(Object(GuzzleHttp\\Psr7\\Request), Array)\n#5 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Http\\Client\\PendingRequest.php(1150): GuzzleHttp\\Handler\\Proxy::GuzzleHttp\\Handler\\{closure}(Object(GuzzleHttp\\Psr7\\Request), Array)\n#6 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Http\\Client\\PendingRequest.php(1116): Illuminate\\Http\\Client\\PendingRequest->Illuminate\\Http\\Client\\{closure}(Object(GuzzleHttp\\Psr7\\Request), Array)\n#7 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Http\\Client\\PendingRequest.php(1102): Illuminate\\Http\\Client\\PendingRequest->Illuminate\\Http\\Client\\{closure}(Object(GuzzleHttp\\Psr7\\Request), Array)\n#8 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\PrepareBodyMiddleware.php(64): Illuminate\\Http\\Client\\PendingRequest->Illuminate\\Http\\Client\\{closure}(Object(GuzzleHttp\\Psr7\\Request), Array)\n#9 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\Middleware.php(38): GuzzleHttp\\PrepareBodyMiddleware->__invoke(Object(GuzzleHttp\\Psr7\\Request), Array)\n#10 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\RedirectMiddleware.php(71): GuzzleHttp\\Middleware::GuzzleHttp\\{closure}(Object(GuzzleHttp\\Psr7\\Request), Array)\n#11 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\Middleware.php(63): GuzzleHttp\\RedirectMiddleware->__invoke(Object(GuzzleHttp\\Psr7\\Request), Array)\n#12 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\HandlerStack.php(75): GuzzleHttp\\Middleware::GuzzleHttp\\{closure}(Object(GuzzleHttp\\Psr7\\Request), Array)\n#13 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\Client.php(333): GuzzleHttp\\HandlerStack->__invoke(Object(GuzzleHttp\\Psr7\\Request), Array)\n#14 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\Client.php(169): GuzzleHttp\\Client->transfer(Object(GuzzleHttp\\Psr7\\Request), Array)\n#15 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\Client.php(189): GuzzleHttp\\Client->requestAsync(\'POST\', Object(GuzzleHttp\\Psr7\\Uri), Array)\n#16 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Http\\Client\\PendingRequest.php(961): GuzzleHttp\\Client->request(\'POST\', \'https://gateway...\', Array)\n#17 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Http\\Client\\PendingRequest.php(823): Illuminate\\Http\\Client\\PendingRequest->sendRequest(\'POST\', \'https://gateway...\', Array)\n#18 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\helpers.php(247): Illuminate\\Http\\Client\\PendingRequest->Illuminate\\Http\\Client\\{closure}(1)\n#19 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Http\\Client\\PendingRequest.php(821): retry(0, Object(Closure), 100, Object(Closure))\n#20 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Http\\Client\\PendingRequest.php(727): Illuminate\\Http\\Client\\PendingRequest->send(\'POST\', \'https://gateway...\', Array)\n#21 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\system\\classes\\updatemanager\\HasGatewayAccess.php(145): Illuminate\\Http\\Client\\PendingRequest->post(\'https://gateway...\', Array)\n#22 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\system\\classes\\updatemanager\\HasGatewayAccess.php(39): System\\Classes\\UpdateManager->makeHttpRequest(\'https://gateway...\', Array)\n#23 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\system\\classes\\updatemanager\\ManagesProject.php(163): System\\Classes\\UpdateManager->requestServerData(\'project/detail\', Array)\n#24 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\system\\classes\\updatemanager\\ManagesProject.php(62): System\\Classes\\UpdateManager->requestProjectDetails(\'0Zmt3ZwpgZwp4Aw...\')\n#25 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\system\\controllers\\Updates.php(83): System\\Classes\\UpdateManager->getProjectDetails()\n#26 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\system\\traits\\DependencyMaker.php(29): System\\Controllers\\Updates->index()\n#27 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\backend\\classes\\Controller.php(387): Backend\\Classes\\Controller->makeCallMethod(Object(System\\Controllers\\Updates), \'index\', Array)\n#28 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\backend\\classes\\Controller.php(269): Backend\\Classes\\Controller->execPageAction(\'index\', Array)\n#29 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\backend\\classes\\BackendController.php(98): Backend\\Classes\\Controller->run(\'index\', Array)\n#30 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(54): Backend\\Classes\\BackendController->run(\'system/updates\')\n#31 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(43): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#32 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(259): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Backend\\Classes\\BackendController), \'run\')\n#33 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(205): Illuminate\\Routing\\Route->runController()\n#34 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(798): Illuminate\\Routing\\Route->run()\n#35 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#36 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\SubstituteBindings.php(50): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#37 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#38 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#39 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#40 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(121): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#41 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(64): Illuminate\\Session\\Middleware\\StartSession->handleStatefulRequest(Object(Illuminate\\Http\\Request), Object(Illuminate\\Session\\Store), Object(Closure))\n#42 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#43 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#44 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#45 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(67): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#46 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#47 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#48 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(797): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#49 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(776): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#50 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(740): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#51 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\october\\rain\\src\\Router\\CoreRouter.php(32): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#52 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(190): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#53 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#54 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance.php(86): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#55 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\october\\rain\\src\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(23): Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#56 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): October\\Rain\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#57 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#58 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(165): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#59 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(134): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#60 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\index.php(42): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#61 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\october\\rain\\src\\Foundation\\resources\\server.php(18): require_once(\'C:\\\\Users\\\\Hakim\\\\...\')\n#62 {main}', '[]', '2023-10-20 18:46:54', '2023-10-20 18:46:54'),
(5, 'error', 'GuzzleHttp\\Exception\\RequestException: cURL error 60: SSL certificate problem: unable to get local issuer certificate (see https://curl.haxx.se/libcurl/c/libcurl-errors.html) for https://gateway.octobercms.com/api/project/detail in C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\Handler\\CurlFactory.php:211\nStack trace:\n#0 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\Handler\\CurlFactory.php(158): GuzzleHttp\\Handler\\CurlFactory::createRejection(Object(GuzzleHttp\\Handler\\EasyHandle), Array)\n#1 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\Handler\\CurlFactory.php(110): GuzzleHttp\\Handler\\CurlFactory::finishError(Object(GuzzleHttp\\Handler\\CurlHandler), Object(GuzzleHttp\\Handler\\EasyHandle), Object(GuzzleHttp\\Handler\\CurlFactory))\n#2 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\Handler\\CurlHandler.php(47): GuzzleHttp\\Handler\\CurlFactory::finish(Object(GuzzleHttp\\Handler\\CurlHandler), Object(GuzzleHttp\\Handler\\EasyHandle), Object(GuzzleHttp\\Handler\\CurlFactory))\n#3 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\Handler\\Proxy.php(28): GuzzleHttp\\Handler\\CurlHandler->__invoke(Object(GuzzleHttp\\Psr7\\Request), Array)\n#4 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\Handler\\Proxy.php(48): GuzzleHttp\\Handler\\Proxy::GuzzleHttp\\Handler\\{closure}(Object(GuzzleHttp\\Psr7\\Request), Array)\n#5 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Http\\Client\\PendingRequest.php(1150): GuzzleHttp\\Handler\\Proxy::GuzzleHttp\\Handler\\{closure}(Object(GuzzleHttp\\Psr7\\Request), Array)\n#6 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Http\\Client\\PendingRequest.php(1116): Illuminate\\Http\\Client\\PendingRequest->Illuminate\\Http\\Client\\{closure}(Object(GuzzleHttp\\Psr7\\Request), Array)\n#7 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Http\\Client\\PendingRequest.php(1102): Illuminate\\Http\\Client\\PendingRequest->Illuminate\\Http\\Client\\{closure}(Object(GuzzleHttp\\Psr7\\Request), Array)\n#8 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\PrepareBodyMiddleware.php(64): Illuminate\\Http\\Client\\PendingRequest->Illuminate\\Http\\Client\\{closure}(Object(GuzzleHttp\\Psr7\\Request), Array)\n#9 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\Middleware.php(38): GuzzleHttp\\PrepareBodyMiddleware->__invoke(Object(GuzzleHttp\\Psr7\\Request), Array)\n#10 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\RedirectMiddleware.php(71): GuzzleHttp\\Middleware::GuzzleHttp\\{closure}(Object(GuzzleHttp\\Psr7\\Request), Array)\n#11 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\Middleware.php(63): GuzzleHttp\\RedirectMiddleware->__invoke(Object(GuzzleHttp\\Psr7\\Request), Array)\n#12 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\HandlerStack.php(75): GuzzleHttp\\Middleware::GuzzleHttp\\{closure}(Object(GuzzleHttp\\Psr7\\Request), Array)\n#13 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\Client.php(333): GuzzleHttp\\HandlerStack->__invoke(Object(GuzzleHttp\\Psr7\\Request), Array)\n#14 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\Client.php(169): GuzzleHttp\\Client->transfer(Object(GuzzleHttp\\Psr7\\Request), Array)\n#15 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\Client.php(189): GuzzleHttp\\Client->requestAsync(\'POST\', Object(GuzzleHttp\\Psr7\\Uri), Array)\n#16 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Http\\Client\\PendingRequest.php(961): GuzzleHttp\\Client->request(\'POST\', \'https://gateway...\', Array)\n#17 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Http\\Client\\PendingRequest.php(823): Illuminate\\Http\\Client\\PendingRequest->sendRequest(\'POST\', \'https://gateway...\', Array)\n#18 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\helpers.php(247): Illuminate\\Http\\Client\\PendingRequest->Illuminate\\Http\\Client\\{closure}(1)\n#19 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Http\\Client\\PendingRequest.php(821): retry(0, Object(Closure), 100, Object(Closure))\n#20 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Http\\Client\\PendingRequest.php(727): Illuminate\\Http\\Client\\PendingRequest->send(\'POST\', \'https://gateway...\', Array)\n#21 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\system\\classes\\updatemanager\\HasGatewayAccess.php(145): Illuminate\\Http\\Client\\PendingRequest->post(\'https://gateway...\', Array)\n#22 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\system\\classes\\updatemanager\\HasGatewayAccess.php(39): System\\Classes\\UpdateManager->makeHttpRequest(\'https://gateway...\', Array)\n#23 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\system\\classes\\updatemanager\\ManagesProject.php(163): System\\Classes\\UpdateManager->requestServerData(\'project/detail\', Array)\n#24 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\system\\classes\\updatemanager\\ManagesProject.php(62): System\\Classes\\UpdateManager->requestProjectDetails(\'0Zmt3ZwpgZwp4Aw...\')\n#25 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\system\\controllers\\Updates.php(83): System\\Classes\\UpdateManager->getProjectDetails()\n#26 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\system\\traits\\DependencyMaker.php(29): System\\Controllers\\Updates->index()\n#27 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\backend\\classes\\Controller.php(387): Backend\\Classes\\Controller->makeCallMethod(Object(System\\Controllers\\Updates), \'index\', Array)\n#28 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\backend\\classes\\Controller.php(269): Backend\\Classes\\Controller->execPageAction(\'index\', Array)\n#29 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\backend\\classes\\BackendController.php(98): Backend\\Classes\\Controller->run(\'index\', Array)\n#30 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(54): Backend\\Classes\\BackendController->run(\'system/updates\')\n#31 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(43): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#32 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(259): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Backend\\Classes\\BackendController), \'run\')\n#33 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(205): Illuminate\\Routing\\Route->runController()\n#34 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(798): Illuminate\\Routing\\Route->run()\n#35 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#36 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\SubstituteBindings.php(50): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#37 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#38 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#39 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#40 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(121): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#41 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(64): Illuminate\\Session\\Middleware\\StartSession->handleStatefulRequest(Object(Illuminate\\Http\\Request), Object(Illuminate\\Session\\Store), Object(Closure))\n#42 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#43 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#44 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#45 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(67): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#46 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#47 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#48 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(797): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#49 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(776): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#50 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(740): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#51 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\october\\rain\\src\\Router\\CoreRouter.php(32): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#52 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(190): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#53 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#54 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance.php(86): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#55 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\october\\rain\\src\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(23): Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#56 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): October\\Rain\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#57 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#58 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(165): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#59 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(134): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#60 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\index.php(42): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#61 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\october\\rain\\src\\Foundation\\resources\\server.php(18): require_once(\'C:\\\\Users\\\\Hakim\\\\...\')\n#62 {main}', '[]', '2023-10-20 18:53:15', '2023-10-20 18:53:15'),
(6, 'error', 'GuzzleHttp\\Exception\\RequestException: cURL error 60: SSL certificate problem: unable to get local issuer certificate (see https://curl.haxx.se/libcurl/c/libcurl-errors.html) for https://gateway.octobercms.com/api/project/detail in C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\Handler\\CurlFactory.php:211\nStack trace:\n#0 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\Handler\\CurlFactory.php(158): GuzzleHttp\\Handler\\CurlFactory::createRejection(Object(GuzzleHttp\\Handler\\EasyHandle), Array)\n#1 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\Handler\\CurlFactory.php(110): GuzzleHttp\\Handler\\CurlFactory::finishError(Object(GuzzleHttp\\Handler\\CurlHandler), Object(GuzzleHttp\\Handler\\EasyHandle), Object(GuzzleHttp\\Handler\\CurlFactory))\n#2 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\Handler\\CurlHandler.php(47): GuzzleHttp\\Handler\\CurlFactory::finish(Object(GuzzleHttp\\Handler\\CurlHandler), Object(GuzzleHttp\\Handler\\EasyHandle), Object(GuzzleHttp\\Handler\\CurlFactory))\n#3 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\Handler\\Proxy.php(28): GuzzleHttp\\Handler\\CurlHandler->__invoke(Object(GuzzleHttp\\Psr7\\Request), Array)\n#4 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\Handler\\Proxy.php(48): GuzzleHttp\\Handler\\Proxy::GuzzleHttp\\Handler\\{closure}(Object(GuzzleHttp\\Psr7\\Request), Array)\n#5 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Http\\Client\\PendingRequest.php(1150): GuzzleHttp\\Handler\\Proxy::GuzzleHttp\\Handler\\{closure}(Object(GuzzleHttp\\Psr7\\Request), Array)\n#6 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Http\\Client\\PendingRequest.php(1116): Illuminate\\Http\\Client\\PendingRequest->Illuminate\\Http\\Client\\{closure}(Object(GuzzleHttp\\Psr7\\Request), Array)\n#7 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Http\\Client\\PendingRequest.php(1102): Illuminate\\Http\\Client\\PendingRequest->Illuminate\\Http\\Client\\{closure}(Object(GuzzleHttp\\Psr7\\Request), Array)\n#8 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\PrepareBodyMiddleware.php(64): Illuminate\\Http\\Client\\PendingRequest->Illuminate\\Http\\Client\\{closure}(Object(GuzzleHttp\\Psr7\\Request), Array)\n#9 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\Middleware.php(38): GuzzleHttp\\PrepareBodyMiddleware->__invoke(Object(GuzzleHttp\\Psr7\\Request), Array)\n#10 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\RedirectMiddleware.php(71): GuzzleHttp\\Middleware::GuzzleHttp\\{closure}(Object(GuzzleHttp\\Psr7\\Request), Array)\n#11 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\Middleware.php(63): GuzzleHttp\\RedirectMiddleware->__invoke(Object(GuzzleHttp\\Psr7\\Request), Array)\n#12 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\HandlerStack.php(75): GuzzleHttp\\Middleware::GuzzleHttp\\{closure}(Object(GuzzleHttp\\Psr7\\Request), Array)\n#13 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\Client.php(333): GuzzleHttp\\HandlerStack->__invoke(Object(GuzzleHttp\\Psr7\\Request), Array)\n#14 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\Client.php(169): GuzzleHttp\\Client->transfer(Object(GuzzleHttp\\Psr7\\Request), Array)\n#15 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\guzzlehttp\\guzzle\\src\\Client.php(189): GuzzleHttp\\Client->requestAsync(\'POST\', Object(GuzzleHttp\\Psr7\\Uri), Array)\n#16 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Http\\Client\\PendingRequest.php(961): GuzzleHttp\\Client->request(\'POST\', \'https://gateway...\', Array)\n#17 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Http\\Client\\PendingRequest.php(823): Illuminate\\Http\\Client\\PendingRequest->sendRequest(\'POST\', \'https://gateway...\', Array)\n#18 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\helpers.php(247): Illuminate\\Http\\Client\\PendingRequest->Illuminate\\Http\\Client\\{closure}(1)\n#19 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Http\\Client\\PendingRequest.php(821): retry(0, Object(Closure), 100, Object(Closure))\n#20 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Http\\Client\\PendingRequest.php(727): Illuminate\\Http\\Client\\PendingRequest->send(\'POST\', \'https://gateway...\', Array)\n#21 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\system\\classes\\updatemanager\\HasGatewayAccess.php(145): Illuminate\\Http\\Client\\PendingRequest->post(\'https://gateway...\', Array)\n#22 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\system\\classes\\updatemanager\\HasGatewayAccess.php(39): System\\Classes\\UpdateManager->makeHttpRequest(\'https://gateway...\', Array)\n#23 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\system\\classes\\updatemanager\\ManagesProject.php(163): System\\Classes\\UpdateManager->requestServerData(\'project/detail\', Array)\n#24 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\system\\classes\\updatemanager\\ManagesProject.php(62): System\\Classes\\UpdateManager->requestProjectDetails(\'0Zmt3ZwpgZwp4Aw...\')\n#25 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\system\\controllers\\Updates.php(83): System\\Classes\\UpdateManager->getProjectDetails()\n#26 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\system\\traits\\DependencyMaker.php(29): System\\Controllers\\Updates->index()\n#27 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\backend\\classes\\Controller.php(387): Backend\\Classes\\Controller->makeCallMethod(Object(System\\Controllers\\Updates), \'index\', Array)\n#28 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\backend\\classes\\Controller.php(269): Backend\\Classes\\Controller->execPageAction(\'index\', Array)\n#29 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\backend\\classes\\BackendController.php(98): Backend\\Classes\\Controller->run(\'index\', Array)\n#30 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(54): Backend\\Classes\\BackendController->run(\'system/updates\')\n#31 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(43): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#32 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(259): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Backend\\Classes\\BackendController), \'run\')\n#33 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(205): Illuminate\\Routing\\Route->runController()\n#34 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(798): Illuminate\\Routing\\Route->run()\n#35 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#36 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\SubstituteBindings.php(50): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#37 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#38 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#39 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#40 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(121): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#41 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(64): Illuminate\\Session\\Middleware\\StartSession->handleStatefulRequest(Object(Illuminate\\Http\\Request), Object(Illuminate\\Session\\Store), Object(Closure))\n#42 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#43 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#44 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#45 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(67): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#46 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#47 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#48 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(797): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#49 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(776): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#50 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(740): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#51 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\october\\rain\\src\\Router\\CoreRouter.php(32): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#52 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(190): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#53 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#54 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance.php(86): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#55 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\october\\rain\\src\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(23): Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#56 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): October\\Rain\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#57 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#58 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(165): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#59 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(134): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#60 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\index.php(42): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#61 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\october\\rain\\src\\Foundation\\resources\\server.php(18): require_once(\'C:\\\\Users\\\\Hakim\\\\...\')\n#62 {main}', '[]', '2023-10-20 18:53:15', '2023-10-20 18:53:15');
INSERT INTO `system_event_logs` (`id`, `level`, `message`, `details`, `created_at`, `updated_at`) VALUES
(7, 'error', 'RuntimeException: [OFFLINE.Vite] Set the VITE_MANIFEST env variable to the path of your manifest.json file. in C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\plugins\\offline\\vite\\classes\\Vite.php:62\nStack trace:\n#0 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\october\\rain\\src\\Support\\Traits\\Singleton.php(40): OFFLINE\\Vite\\Classes\\Vite->init()\n#1 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\october\\rain\\src\\Support\\Traits\\Singleton.php(24): OFFLINE\\Vite\\Classes\\Vite->__construct()\n#2 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\plugins\\offline\\vite\\Plugin.php(48): OFFLINE\\Vite\\Classes\\Vite::instance()\n#3 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Events\\Dispatcher.php(421): OFFLINE\\Vite\\Plugin->OFFLINE\\Vite\\{closure}(Object(Cms\\Classes\\Controller))\n#4 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Events\\Dispatcher.php(249): Illuminate\\Events\\Dispatcher->Illuminate\\Events\\{closure}(\'cms.page.start\', Array)\n#5 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\october\\rain\\src\\Events\\PriorityDispatcher.php(112): Illuminate\\Events\\Dispatcher->dispatch(\'cms.page.start\', Array, true)\n#6 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\october\\rain\\src\\Events\\PriorityDispatcher.php(79): October\\Rain\\Events\\PriorityDispatcher->fireEvent(\'cms.page.start\', Array, true)\n#7 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Facades\\Facade.php(338): October\\Rain\\Events\\PriorityDispatcher->fire(\'cms.page.start\', Array, true)\n#8 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\system\\traits\\EventEmitter.php(54): Illuminate\\Support\\Facades\\Facade::__callStatic(\'fire\', Array)\n#9 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\cms\\classes\\Controller.php(458): Cms\\Classes\\Controller->fireSystemEvent(\'cms.page.start\')\n#10 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\cms\\classes\\Controller.php(385): Cms\\Classes\\Controller->execPageCycle()\n#11 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\cms\\classes\\Controller.php(219): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#12 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\cms\\classes\\CmsController.php(65): Cms\\Classes\\Controller->run(\'/\')\n#13 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(54): Cms\\Classes\\CmsController->run(\'/\')\n#14 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(43): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#15 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(259): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Cms\\Classes\\CmsController), \'run\')\n#16 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(205): Illuminate\\Routing\\Route->runController()\n#17 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(798): Illuminate\\Routing\\Route->run()\n#18 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#19 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\SubstituteBindings.php(50): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#20 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#21 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#22 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#23 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(121): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#24 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(64): Illuminate\\Session\\Middleware\\StartSession->handleStatefulRequest(Object(Illuminate\\Http\\Request), Object(Illuminate\\Session\\Store), Object(Closure))\n#25 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#26 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#27 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#28 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(67): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#29 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#30 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#31 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(797): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#32 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(776): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#33 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(740): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#34 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\october\\rain\\src\\Router\\CoreRouter.php(32): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#35 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(190): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#36 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#37 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance.php(86): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#38 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\october\\rain\\src\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(23): Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#39 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): October\\Rain\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#40 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#41 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(165): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#42 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(134): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#43 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\index.php(42): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#44 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\october\\rain\\src\\Foundation\\resources\\server.php(18): require_once(\'C:\\\\Users\\\\Hakim\\\\...\')\n#45 {main}', '[]', '2023-10-20 19:20:00', '2023-10-20 19:20:00'),
(8, 'error', 'RuntimeException: [OFFLINE.Vite] Set the VITE_MANIFEST env variable to the path of your manifest.json file. in C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\plugins\\offline\\vite\\classes\\Vite.php:62\nStack trace:\n#0 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\october\\rain\\src\\Support\\Traits\\Singleton.php(40): OFFLINE\\Vite\\Classes\\Vite->init()\n#1 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\october\\rain\\src\\Support\\Traits\\Singleton.php(24): OFFLINE\\Vite\\Classes\\Vite->__construct()\n#2 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\plugins\\offline\\vite\\Plugin.php(48): OFFLINE\\Vite\\Classes\\Vite::instance()\n#3 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Events\\Dispatcher.php(421): OFFLINE\\Vite\\Plugin->OFFLINE\\Vite\\{closure}(Object(Cms\\Classes\\Controller))\n#4 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Events\\Dispatcher.php(249): Illuminate\\Events\\Dispatcher->Illuminate\\Events\\{closure}(\'cms.page.start\', Array)\n#5 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\october\\rain\\src\\Events\\PriorityDispatcher.php(112): Illuminate\\Events\\Dispatcher->dispatch(\'cms.page.start\', Array, true)\n#6 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\october\\rain\\src\\Events\\PriorityDispatcher.php(79): October\\Rain\\Events\\PriorityDispatcher->fireEvent(\'cms.page.start\', Array, true)\n#7 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Facades\\Facade.php(338): October\\Rain\\Events\\PriorityDispatcher->fire(\'cms.page.start\', Array, true)\n#8 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\system\\traits\\EventEmitter.php(54): Illuminate\\Support\\Facades\\Facade::__callStatic(\'fire\', Array)\n#9 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\cms\\classes\\Controller.php(458): Cms\\Classes\\Controller->fireSystemEvent(\'cms.page.start\')\n#10 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\cms\\classes\\Controller.php(385): Cms\\Classes\\Controller->execPageCycle()\n#11 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\cms\\classes\\Controller.php(219): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#12 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\cms\\classes\\CmsController.php(65): Cms\\Classes\\Controller->run(\'/\')\n#13 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(54): Cms\\Classes\\CmsController->run(\'/\')\n#14 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(43): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#15 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(259): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Cms\\Classes\\CmsController), \'run\')\n#16 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(205): Illuminate\\Routing\\Route->runController()\n#17 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(798): Illuminate\\Routing\\Route->run()\n#18 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#19 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\SubstituteBindings.php(50): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#20 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#21 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#22 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#23 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(121): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#24 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(64): Illuminate\\Session\\Middleware\\StartSession->handleStatefulRequest(Object(Illuminate\\Http\\Request), Object(Illuminate\\Session\\Store), Object(Closure))\n#25 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#26 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#27 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#28 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(67): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#29 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#30 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#31 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(797): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#32 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(776): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#33 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(740): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#34 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\october\\rain\\src\\Router\\CoreRouter.php(32): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#35 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(190): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#36 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#37 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance.php(86): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#38 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\october\\rain\\src\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(23): Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#39 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): October\\Rain\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#40 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#41 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(165): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#42 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(134): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#43 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\index.php(42): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#44 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\october\\rain\\src\\Foundation\\resources\\server.php(18): require_once(\'C:\\\\Users\\\\Hakim\\\\...\')\n#45 {main}', '[]', '2023-10-20 19:21:23', '2023-10-20 19:21:23'),
(9, 'error', 'Cms\\Classes\\CmsException: Le modèle partiel \"home.htm\" est introuvable. in C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\cms\\classes\\controller\\HasRenderers.php:180\nStack trace:\n#0 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\cms\\twig\\Extension.php(154): Cms\\Classes\\Controller->renderPartial(\'home.htm\', Array, true)\n#1 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\storage\\cms\\twig\\89\\8931ee464d47ef141a49b3abfbc6fcd2.php(38): Cms\\Twig\\Extension->partialFunction(\'home.htm\', Array, true)\n#2 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\twig\\twig\\src\\Template.php(394): __TwigTemplate_51f8f18e38f7426066c6e463e578effa->doDisplay(Array, Array)\n#3 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\twig\\twig\\src\\Template.php(367): Twig\\Template->displayWithErrorHandling(Array, Array)\n#4 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\twig\\twig\\src\\Template.php(379): Twig\\Template->display(Array)\n#5 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\twig\\twig\\src\\TemplateWrapper.php(40): Twig\\Template->render(Array, Array)\n#6 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\cms\\classes\\controller\\HasRenderers.php(83): Twig\\TemplateWrapper->render(Array)\n#7 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\cms\\classes\\Controller.php(414): Cms\\Classes\\Controller->renderPageContents()\n#8 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\cms\\classes\\Controller.php(219): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#9 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\cms\\classes\\CmsController.php(65): Cms\\Classes\\Controller->run(\'/\')\n#10 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(54): Cms\\Classes\\CmsController->run(\'/\')\n#11 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(43): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#12 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(259): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Cms\\Classes\\CmsController), \'run\')\n#13 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(205): Illuminate\\Routing\\Route->runController()\n#14 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(798): Illuminate\\Routing\\Route->run()\n#15 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#16 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\SubstituteBindings.php(50): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#17 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#18 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#19 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#20 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(121): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#21 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(64): Illuminate\\Session\\Middleware\\StartSession->handleStatefulRequest(Object(Illuminate\\Http\\Request), Object(Illuminate\\Session\\Store), Object(Closure))\n#22 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#23 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#24 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#25 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(67): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#26 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#27 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#28 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(797): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#29 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(776): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#30 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(740): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#31 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\october\\rain\\src\\Router\\CoreRouter.php(32): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#32 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(190): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#33 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#34 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance.php(86): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#35 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\october\\rain\\src\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(23): Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#36 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): October\\Rain\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#37 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#38 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(165): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#39 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(134): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#40 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\index.php(42): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#41 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\october\\rain\\src\\Foundation\\resources\\server.php(18): require_once(\'C:\\\\Users\\\\Hakim\\\\...\')\n#42 {main}\n\nNext Twig\\Error\\RuntimeError: An exception has been thrown during the rendering of a template (\"Le modèle partiel \"home.htm\" est introuvable.\") in \"C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\themes/portfolio/pages/main.htm\" at line 1. in C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\twig\\twig\\src\\Template.php:408\nStack trace:\n#0 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\twig\\twig\\src\\Template.php(367): Twig\\Template->displayWithErrorHandling(Array, Array)\n#1 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\twig\\twig\\src\\Template.php(379): Twig\\Template->display(Array)\n#2 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\twig\\twig\\src\\TemplateWrapper.php(40): Twig\\Template->render(Array, Array)\n#3 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\cms\\classes\\controller\\HasRenderers.php(83): Twig\\TemplateWrapper->render(Array)\n#4 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\cms\\classes\\Controller.php(414): Cms\\Classes\\Controller->renderPageContents()\n#5 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\cms\\classes\\Controller.php(219): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#6 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\cms\\classes\\CmsController.php(65): Cms\\Classes\\Controller->run(\'/\')\n#7 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(54): Cms\\Classes\\CmsController->run(\'/\')\n#8 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(43): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#9 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(259): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Cms\\Classes\\CmsController), \'run\')\n#10 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(205): Illuminate\\Routing\\Route->runController()\n#11 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(798): Illuminate\\Routing\\Route->run()\n#12 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#13 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\SubstituteBindings.php(50): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#14 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#15 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#16 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#17 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(121): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#18 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(64): Illuminate\\Session\\Middleware\\StartSession->handleStatefulRequest(Object(Illuminate\\Http\\Request), Object(Illuminate\\Session\\Store), Object(Closure))\n#19 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#20 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#21 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#22 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(67): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#23 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#24 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#25 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(797): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#26 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(776): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#27 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(740): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#28 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\october\\rain\\src\\Router\\CoreRouter.php(32): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#29 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(190): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#30 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#31 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance.php(86): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#32 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\october\\rain\\src\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(23): Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#33 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): October\\Rain\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#34 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#35 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(165): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#36 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(134): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#37 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\index.php(42): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#38 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\october\\rain\\src\\Foundation\\resources\\server.php(18): require_once(\'C:\\\\Users\\\\Hakim\\\\...\')\n#39 {main}', '[]', '2023-10-28 10:52:05', '2023-10-28 10:52:05');
INSERT INTO `system_event_logs` (`id`, `level`, `message`, `details`, `created_at`, `updated_at`) VALUES
(10, 'error', 'Cms\\Classes\\CmsException: Le modèle partiel \"links\" est introuvable. in C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\cms\\classes\\controller\\HasRenderers.php:180\nStack trace:\n#0 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\cms\\twig\\Extension.php(154): Cms\\Classes\\Controller->renderPartial(\'links\', Array, true)\n#1 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\storage\\cms\\twig\\75\\75d7b13ab318208b3ea86bbc7ef78ab2.php(49): Cms\\Twig\\Extension->partialFunction(\'links\', Array, true)\n#2 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\twig\\twig\\src\\Template.php(394): __TwigTemplate_d84b55b1d551f9d8288d25d3e9448bea->doDisplay(Array, Array)\n#3 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\twig\\twig\\src\\Template.php(367): Twig\\Template->displayWithErrorHandling(Array, Array)\n#4 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\twig\\twig\\src\\Template.php(379): Twig\\Template->display(Array)\n#5 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\twig\\twig\\src\\TemplateWrapper.php(40): Twig\\Template->render(Array, Array)\n#6 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\cms\\classes\\controller\\HasRenderers.php(70): Twig\\TemplateWrapper->render(Array)\n#7 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\cms\\classes\\Controller.php(418): Cms\\Classes\\Controller->renderLayoutContents()\n#8 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\cms\\classes\\Controller.php(219): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#9 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\cms\\classes\\CmsController.php(65): Cms\\Classes\\Controller->run(\'/\')\n#10 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(54): Cms\\Classes\\CmsController->run(\'/\')\n#11 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(43): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#12 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(259): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Cms\\Classes\\CmsController), \'run\')\n#13 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(205): Illuminate\\Routing\\Route->runController()\n#14 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(798): Illuminate\\Routing\\Route->run()\n#15 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#16 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\SubstituteBindings.php(50): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#17 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#18 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#19 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#20 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(121): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#21 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(64): Illuminate\\Session\\Middleware\\StartSession->handleStatefulRequest(Object(Illuminate\\Http\\Request), Object(Illuminate\\Session\\Store), Object(Closure))\n#22 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#23 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#24 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#25 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(67): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#26 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#27 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#28 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(797): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#29 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(776): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#30 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(740): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#31 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\october\\rain\\src\\Router\\CoreRouter.php(32): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#32 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(190): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#33 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#34 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance.php(86): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#35 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\october\\rain\\src\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(23): Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#36 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): October\\Rain\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#37 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#38 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(165): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#39 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(134): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#40 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\index.php(42): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#41 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\october\\rain\\src\\Foundation\\resources\\server.php(18): require_once(\'C:\\\\Users\\\\Hakim\\\\...\')\n#42 {main}\n\nNext Twig\\Error\\RuntimeError: An exception has been thrown during the rendering of a template (\"Le modèle partiel \"links\" est introuvable.\") in \"C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\themes/portfolio/layouts/layout.htm\" at line 10. in C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\twig\\twig\\src\\Template.php:408\nStack trace:\n#0 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\twig\\twig\\src\\Template.php(367): Twig\\Template->displayWithErrorHandling(Array, Array)\n#1 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\twig\\twig\\src\\Template.php(379): Twig\\Template->display(Array)\n#2 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\twig\\twig\\src\\TemplateWrapper.php(40): Twig\\Template->render(Array, Array)\n#3 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\cms\\classes\\controller\\HasRenderers.php(70): Twig\\TemplateWrapper->render(Array)\n#4 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\cms\\classes\\Controller.php(418): Cms\\Classes\\Controller->renderLayoutContents()\n#5 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\cms\\classes\\Controller.php(219): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#6 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\cms\\classes\\CmsController.php(65): Cms\\Classes\\Controller->run(\'/\')\n#7 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(54): Cms\\Classes\\CmsController->run(\'/\')\n#8 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(43): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#9 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(259): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Cms\\Classes\\CmsController), \'run\')\n#10 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(205): Illuminate\\Routing\\Route->runController()\n#11 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(798): Illuminate\\Routing\\Route->run()\n#12 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#13 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\SubstituteBindings.php(50): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#14 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#15 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#16 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#17 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(121): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#18 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(64): Illuminate\\Session\\Middleware\\StartSession->handleStatefulRequest(Object(Illuminate\\Http\\Request), Object(Illuminate\\Session\\Store), Object(Closure))\n#19 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#20 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#21 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#22 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(67): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#23 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#24 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#25 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(797): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#26 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(776): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#27 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(740): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#28 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\october\\rain\\src\\Router\\CoreRouter.php(32): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#29 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(190): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#30 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#31 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance.php(86): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#32 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\october\\rain\\src\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(23): Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#33 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): October\\Rain\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#34 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#35 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(165): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#36 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(134): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#37 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\index.php(42): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#38 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\october\\rain\\src\\Foundation\\resources\\server.php(18): require_once(\'C:\\\\Users\\\\Hakim\\\\...\')\n#39 {main}', '[]', '2023-10-28 10:52:38', '2023-10-28 10:52:38'),
(11, 'error', 'Cms\\Classes\\CmsException: Le modèle partiel \"elements/preloader\" est introuvable. in C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\cms\\classes\\controller\\HasRenderers.php:180\nStack trace:\n#0 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\cms\\twig\\Extension.php(154): Cms\\Classes\\Controller->renderPartial(\'elements/preloa...\', Array, true)\n#1 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\storage\\cms\\twig\\75\\75d7b13ab318208b3ea86bbc7ef78ab2.php(58): Cms\\Twig\\Extension->partialFunction(\'elements/preloa...\', Array, true)\n#2 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\twig\\twig\\src\\Template.php(394): __TwigTemplate_d84b55b1d551f9d8288d25d3e9448bea->doDisplay(Array, Array)\n#3 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\twig\\twig\\src\\Template.php(367): Twig\\Template->displayWithErrorHandling(Array, Array)\n#4 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\twig\\twig\\src\\Template.php(379): Twig\\Template->display(Array)\n#5 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\twig\\twig\\src\\TemplateWrapper.php(40): Twig\\Template->render(Array, Array)\n#6 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\cms\\classes\\controller\\HasRenderers.php(70): Twig\\TemplateWrapper->render(Array)\n#7 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\cms\\classes\\Controller.php(418): Cms\\Classes\\Controller->renderLayoutContents()\n#8 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\cms\\classes\\Controller.php(219): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#9 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\cms\\classes\\CmsController.php(65): Cms\\Classes\\Controller->run(\'/\')\n#10 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(54): Cms\\Classes\\CmsController->run(\'/\')\n#11 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(43): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#12 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(259): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Cms\\Classes\\CmsController), \'run\')\n#13 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(205): Illuminate\\Routing\\Route->runController()\n#14 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(798): Illuminate\\Routing\\Route->run()\n#15 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#16 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\SubstituteBindings.php(50): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#17 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#18 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#19 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#20 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(121): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#21 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(64): Illuminate\\Session\\Middleware\\StartSession->handleStatefulRequest(Object(Illuminate\\Http\\Request), Object(Illuminate\\Session\\Store), Object(Closure))\n#22 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#23 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#24 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#25 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(67): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#26 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#27 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#28 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(797): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#29 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(776): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#30 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(740): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#31 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\october\\rain\\src\\Router\\CoreRouter.php(32): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#32 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(190): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#33 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#34 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance.php(86): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#35 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\october\\rain\\src\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(23): Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#36 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): October\\Rain\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#37 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#38 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(165): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#39 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(134): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#40 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\index.php(42): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#41 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\october\\rain\\src\\Foundation\\resources\\server.php(18): require_once(\'C:\\\\Users\\\\Hakim\\\\...\')\n#42 {main}\n\nNext Twig\\Error\\RuntimeError: An exception has been thrown during the rendering of a template (\"Le modèle partiel \"elements/preloader\" est introuvable.\") in \"C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\themes/portfolio/layouts/layout.htm\" at line 15. in C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\twig\\twig\\src\\Template.php:408\nStack trace:\n#0 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\twig\\twig\\src\\Template.php(367): Twig\\Template->displayWithErrorHandling(Array, Array)\n#1 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\twig\\twig\\src\\Template.php(379): Twig\\Template->display(Array)\n#2 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\twig\\twig\\src\\TemplateWrapper.php(40): Twig\\Template->render(Array, Array)\n#3 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\cms\\classes\\controller\\HasRenderers.php(70): Twig\\TemplateWrapper->render(Array)\n#4 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\cms\\classes\\Controller.php(418): Cms\\Classes\\Controller->renderLayoutContents()\n#5 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\cms\\classes\\Controller.php(219): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#6 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\modules\\cms\\classes\\CmsController.php(65): Cms\\Classes\\Controller->run(\'/\')\n#7 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(54): Cms\\Classes\\CmsController->run(\'/\')\n#8 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(43): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#9 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(259): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Cms\\Classes\\CmsController), \'run\')\n#10 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(205): Illuminate\\Routing\\Route->runController()\n#11 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(798): Illuminate\\Routing\\Route->run()\n#12 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#13 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\SubstituteBindings.php(50): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#14 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#15 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#16 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#17 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(121): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#18 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(64): Illuminate\\Session\\Middleware\\StartSession->handleStatefulRequest(Object(Illuminate\\Http\\Request), Object(Illuminate\\Session\\Store), Object(Closure))\n#19 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#20 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#21 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#22 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(67): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#23 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#24 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#25 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(797): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#26 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(776): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#27 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(740): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#28 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\october\\rain\\src\\Router\\CoreRouter.php(32): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#29 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(190): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#30 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#31 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance.php(86): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#32 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\october\\rain\\src\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(23): Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#33 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): October\\Rain\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#34 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#35 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(165): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#36 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(134): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#37 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\index.php(42): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#38 C:\\Users\\Hakim\\Documents\\Travail_Important\\Code\\Projet\\Portfolio\\vendor\\october\\rain\\src\\Foundation\\resources\\server.php(18): require_once(\'C:\\\\Users\\\\Hakim\\\\...\')\n#39 {main}', '[]', '2023-10-28 11:07:25', '2023-10-28 11:07:25');

-- --------------------------------------------------------

--
-- Structure de la table `system_files`
--

DROP TABLE IF EXISTS `system_files`;
CREATE TABLE IF NOT EXISTS `system_files` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `disk_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_size` int NOT NULL,
  `content_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment_id` int DEFAULT NULL,
  `attachment_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_files_master_index` (`attachment_type`,`attachment_id`,`field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `system_mail_layouts`
--

DROP TABLE IF EXISTS `system_mail_layouts`;
CREATE TABLE IF NOT EXISTS `system_mail_layouts` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_html` text COLLATE utf8mb4_unicode_ci,
  `content_text` text COLLATE utf8mb4_unicode_ci,
  `content_css` text COLLATE utf8mb4_unicode_ci,
  `is_locked` tinyint(1) NOT NULL DEFAULT '0',
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `system_mail_layouts`
--

INSERT INTO `system_mail_layouts` (`id`, `name`, `code`, `content_html`, `content_text`, `content_css`, `is_locked`, `options`, `created_at`, `updated_at`) VALUES
(1, 'Default layout', 'default', '<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n</head>\n<body>\n    <style type=\"text/css\" media=\"screen\">\n        {{ brandCss|raw }}\n        {{ css|raw }}\n    </style>\n\n    <table class=\"wrapper layout-default\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n\n        <!-- Header -->\n        {% partial \'header\' body %}\n            {{ subject|raw }}\n        {% endpartial %}\n\n        <tr>\n            <td align=\"center\">\n                <table class=\"content\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                    <!-- Email Body -->\n                    <tr>\n                        <td class=\"body\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                            <table class=\"inner-body\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\">\n                                <!-- Body content -->\n                                <tr>\n                                    <td class=\"content-cell\">\n                                        {{ content|raw }}\n                                    </td>\n                                </tr>\n                            </table>\n                        </td>\n                    </tr>\n                </table>\n            </td>\n        </tr>\n\n        <!-- Footer -->\n        {% partial \'footer\' body %}\n            &copy; {{ \"now\"|date(\"Y\") }} {{ appName }}. All rights reserved.\n        {% endpartial %}\n\n    </table>\n\n</body>\n</html>', '{{ content|raw }}', '@media only screen and (max-width: 600px) {\n    .inner-body {\n        width: 100% !important;\n    }\n\n    .footer {\n        width: 100% !important;\n    }\n}\n\n@media only screen and (max-width: 500px) {\n    .button {\n        width: 100% !important;\n    }\n}', 1, NULL, '2023-10-20 18:39:44', '2023-10-20 18:39:44'),
(2, 'System layout', 'system', '<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n</head>\n<body>\n    <style type=\"text/css\" media=\"screen\">\n        {{ brandCss|raw }}\n        {{ css|raw }}\n    </style>\n\n    <table class=\"wrapper layout-system\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n        <tr>\n            <td align=\"center\">\n                <table class=\"content\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                    <!-- Email Body -->\n                    <tr>\n                        <td class=\"body\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                            <table class=\"inner-body\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\">\n                                <!-- Body content -->\n                                <tr>\n                                    <td class=\"content-cell\">\n                                        {{ content|raw }}\n\n                                        <!-- Subcopy -->\n                                        {% partial \'subcopy\' body %}\n                                            **This is an automatic message. Please do not reply to it.**\n                                        {% endpartial %}\n                                    </td>\n                                </tr>\n                            </table>\n                        </td>\n                    </tr>\n                </table>\n            </td>\n        </tr>\n    </table>\n\n</body>\n</html>', '{{ content|raw }}\n\n\n---\nThis is an automatic message. Please do not reply to it.', '@media only screen and (max-width: 600px) {\n    .inner-body {\n        width: 100% !important;\n    }\n\n    .footer {\n        width: 100% !important;\n    }\n}\n\n@media only screen and (max-width: 500px) {\n    .button {\n        width: 100% !important;\n    }\n}', 1, NULL, '2023-10-20 18:39:44', '2023-10-20 18:39:44');

-- --------------------------------------------------------

--
-- Structure de la table `system_mail_partials`
--

DROP TABLE IF EXISTS `system_mail_partials`;
CREATE TABLE IF NOT EXISTS `system_mail_partials` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_html` text COLLATE utf8mb4_unicode_ci,
  `content_text` text COLLATE utf8mb4_unicode_ci,
  `is_custom` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `system_mail_templates`
--

DROP TABLE IF EXISTS `system_mail_templates`;
CREATE TABLE IF NOT EXISTS `system_mail_templates` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content_html` text COLLATE utf8mb4_unicode_ci,
  `content_text` text COLLATE utf8mb4_unicode_ci,
  `layout_id` int DEFAULT NULL,
  `is_custom` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_mail_templates_layout_id_index` (`layout_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `system_parameters`
--

DROP TABLE IF EXISTS `system_parameters`;
CREATE TABLE IF NOT EXISTS `system_parameters` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `namespace` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `item_index` (`namespace`,`group`,`item`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `system_parameters`
--

INSERT INTO `system_parameters` (`id`, `namespace`, `group`, `item`, `value`) VALUES
(1, 'system', 'update', 'count', '1'),
(2, 'system', 'core', 'build', '\"4\"'),
(3, 'system', 'update', 'retry', '1698582789'),
(4, 'system', 'project', 'key', '\"0Zmt3ZwpgZwp4Awx2YJD2MTIxLGuzMGRmZwMyZGV5ZGV5ZGMxMTWuMwIxLzDk\"'),
(5, 'system', 'update', 'versions', '{\"count\":1,\"core\":\"3.5.5\",\"plugins\":[]}'),
(6, 'system', 'project', 'id', '278696'),
(7, 'system', 'project', 'name', '\"Puyrassol\"'),
(8, 'system', 'project', 'owner', '\"FIDJEL Hakim\"'),
(9, 'system', 'project', 'is_active', 'true');

-- --------------------------------------------------------

--
-- Structure de la table `system_plugin_history`
--

DROP TABLE IF EXISTS `system_plugin_history`;
CREATE TABLE IF NOT EXISTS `system_plugin_history` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_plugin_history_code_index` (`code`),
  KEY `system_plugin_history_type_index` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `system_plugin_history`
--

INSERT INTO `system_plugin_history` (`id`, `code`, `type`, `version`, `detail`, `created_at`) VALUES
(1, 'October.Demo', 'comment', '1.0.1', 'First version of Demo', '2023-10-20 18:39:44'),
(2, 'OFFLINE.Vite', 'comment', '1.0.1', 'First version of Vite', '2023-10-20 19:19:19'),
(3, 'OFFLINE.Vite', 'comment', '1.0.2', 'Fixed style includes', '2023-10-20 19:19:19'),
(4, 'OFFLINE.Vite', 'comment', '2.0.0', 'Simplified API, see README', '2023-10-20 19:19:19'),
(5, 'OFFLINE.Vite', 'comment', '2.0.1', '`vite()` function now generates output where it was called', '2023-10-20 19:19:19'),
(6, 'OFFLINE.Vite', 'comment', '2.0.2', '`vite()` function now generates output where it was called', '2023-10-20 19:19:19'),
(7, 'OFFLINE.Vite', 'comment', '2.0.3', 'Fixed PHP 8.0 compatibility', '2023-10-20 19:19:19'),
(8, 'OFFLINE.Vite', 'comment', '2.0.4', 'Added support to force script/link tag based on a \"ext\" attribute', '2023-10-20 19:19:19'),
(9, 'OFFLINE.Vite', 'comment', '2.0.5', 'fmt', '2023-10-20 19:19:19'),
(10, 'OFFLINE.Vite', 'comment', '2.0.6', 'Added support for Laravel 10', '2023-10-20 19:19:19'),
(11, 'OFFLINE.Vite', 'comment', '2.0.7', 'Fixed usage of deprecated PHP syntax', '2023-10-20 19:19:19');

-- --------------------------------------------------------

--
-- Structure de la table `system_plugin_versions`
--

DROP TABLE IF EXISTS `system_plugin_versions`;
CREATE TABLE IF NOT EXISTS `system_plugin_versions` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_frozen` tinyint(1) NOT NULL DEFAULT '0',
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_plugin_versions_code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `system_plugin_versions`
--

INSERT INTO `system_plugin_versions` (`id`, `code`, `version`, `is_frozen`, `is_disabled`, `created_at`) VALUES
(1, 'October.Demo', '1.0.1', 0, 0, '2023-10-20 18:39:44'),
(2, 'OFFLINE.Vite', '2.0.7', 0, 0, '2023-10-20 19:19:19');

-- --------------------------------------------------------

--
-- Structure de la table `system_request_logs`
--

DROP TABLE IF EXISTS `system_request_logs`;
CREATE TABLE IF NOT EXISTS `system_request_logs` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `status_code` int DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referer` text COLLATE utf8mb4_unicode_ci,
  `count` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `system_revisions`
--

DROP TABLE IF EXISTS `system_revisions`;
CREATE TABLE IF NOT EXISTS `system_revisions` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `revisionable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revisionable_id` int NOT NULL,
  `user_id` int UNSIGNED DEFAULT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cast` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_value` text COLLATE utf8mb4_unicode_ci,
  `new_value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`),
  KEY `system_revisions_user_id_index` (`user_id`),
  KEY `system_revisions_field_index` (`field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `system_settings`
--

DROP TABLE IF EXISTS `system_settings`;
CREATE TABLE IF NOT EXISTS `system_settings` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `item` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci,
  `site_id` int UNSIGNED DEFAULT NULL,
  `site_root_id` int UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_settings_item_index` (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `system_site_definitions`
--

DROP TABLE IF EXISTS `system_site_definitions`;
CREATE TABLE IF NOT EXISTS `system_site_definitions` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_order` int DEFAULT NULL,
  `is_custom_url` tinyint(1) NOT NULL DEFAULT '0',
  `app_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timezone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_host_restricted` tinyint(1) NOT NULL DEFAULT '0',
  `allow_hosts` mediumtext COLLATE utf8mb4_unicode_ci,
  `is_prefixed` tinyint(1) NOT NULL DEFAULT '0',
  `route_prefix` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_styled` tinyint(1) NOT NULL DEFAULT '0',
  `color_foreground` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color_background` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_role_restricted` tinyint(1) NOT NULL DEFAULT '0',
  `allow_roles` mediumtext COLLATE utf8mb4_unicode_ci,
  `is_primary` tinyint(1) NOT NULL DEFAULT '0',
  `is_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `is_enabled_edit` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `group_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_site_definitions_code_index` (`code`),
  KEY `system_site_definitions_group_id_index` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `system_site_definitions`
--

INSERT INTO `system_site_definitions` (`id`, `name`, `code`, `sort_order`, `is_custom_url`, `app_url`, `theme`, `locale`, `timezone`, `is_host_restricted`, `allow_hosts`, `is_prefixed`, `route_prefix`, `is_styled`, `color_foreground`, `color_background`, `is_role_restricted`, `allow_roles`, `is_primary`, `is_enabled`, `is_enabled_edit`, `created_at`, `updated_at`, `group_id`) VALUES
(1, 'Primary Site', 'primary', 1, 0, NULL, 'portfolio', NULL, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, 0, NULL, 1, 1, 1, '2023-10-20 18:39:43', '2023-10-20 18:39:43', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `system_site_groups`
--

DROP TABLE IF EXISTS `system_site_groups`;
CREATE TABLE IF NOT EXISTS `system_site_groups` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_site_groups_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `tailor_content_joins`
--

DROP TABLE IF EXISTS `tailor_content_joins`;
CREATE TABLE IF NOT EXISTS `tailor_content_joins` (
  `parent_id` int DEFAULT NULL,
  `parent_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `relation_id` int DEFAULT NULL,
  `relation_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `field_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_id` int DEFAULT NULL,
  KEY `tailor_content_joins_pidx` (`parent_id`,`parent_type`),
  KEY `tailor_content_joins_ridx` (`relation_id`,`relation_type`),
  KEY `tailor_content_joins_field_name_index` (`field_name`),
  KEY `tailor_content_joins_site_id_index` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `tailor_content_schema`
--

DROP TABLE IF EXISTS `tailor_content_schema`;
CREATE TABLE IF NOT EXISTS `tailor_content_schema` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta` mediumtext COLLATE utf8mb4_unicode_ci,
  `fields` mediumtext COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tailor_content_schema_table_name_index` (`table_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `tailor_content_schema`
--

INSERT INTO `tailor_content_schema` (`id`, `table_name`, `meta`, `fields`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'xc_6947ff28b66047d7924024ca6d58aeaec', '{\"blueprint_uuid\":\"6947ff28-b660-47d7-9240-24ca6d58aeae\",\"blueprint_type\":\"entry\",\"multisite_sync\":false}', '{\"active\":{\"avatar\":{\"type\":\"mediumText\",\"name\":\"avatar\",\"nullable\":true},\"role\":{\"type\":\"text\",\"name\":\"role\",\"nullable\":true},\"about\":{\"type\":\"mediumText\",\"name\":\"about\",\"nullable\":true}},\"dropped\":[]}', NULL, '2023-10-20 18:39:45', '2023-10-20 18:39:45'),
(2, 'xc_b022a74b15e64c6b9eb917efc5103543c', '{\"blueprint_uuid\":\"b022a74b-15e6-4c6b-9eb9-17efc5103543\",\"blueprint_type\":\"structure\",\"multisite_sync\":false}', '{\"active\":{\"description\":{\"type\":\"text\",\"name\":\"description\",\"nullable\":true}},\"dropped\":[]}', NULL, '2023-10-20 18:39:45', '2023-10-20 18:39:46'),
(3, 'xc_edcd102e05254e4db07e633ae6c18db6c', '{\"blueprint_uuid\":\"edcd102e-0525-4e4d-b07e-633ae6c18db6\",\"blueprint_type\":\"stream\",\"multisite_sync\":false}', '{\"active\":{\"content\":{\"type\":\"mediumText\",\"name\":\"content\",\"nullable\":true},\"author_id\":{\"type\":\"integer\",\"name\":\"author_id\",\"autoIncrement\":false,\"unsigned\":true,\"nullable\":true},\"featured_text\":{\"type\":\"mediumText\",\"name\":\"featured_text\",\"nullable\":true},\"gallery_media\":{\"type\":\"mediumText\",\"name\":\"gallery_media\",\"nullable\":true}},\"dropped\":[]}', NULL, '2023-10-20 18:39:46', '2023-10-20 18:39:46'),
(4, 'xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1c', '{\"blueprint_uuid\":\"a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1\",\"blueprint_type\":\"single\",\"multisite_sync\":false}', '{\"active\":[],\"dropped\":[]}', NULL, '2023-10-20 18:39:46', '2023-10-20 18:39:46'),
(5, 'xc_339b11b769ad43c49be16953e7738827c', '{\"blueprint_uuid\":\"339b11b7-69ad-43c4-9be1-6953e7738827\",\"blueprint_type\":\"structure\",\"multisite_sync\":false}', '{\"active\":{\"content\":{\"type\":\"mediumText\",\"name\":\"content\",\"nullable\":true},\"show_in_toc\":{\"type\":\"boolean\",\"name\":\"show_in_toc\",\"nullable\":true},\"summary_text\":{\"type\":\"mediumText\",\"name\":\"summary_text\",\"nullable\":true}},\"dropped\":[]}', NULL, '2023-10-20 18:39:46', '2023-10-20 18:39:47'),
(6, 'xc_6743a1c33e574cfaa886e0c0a277fd71c', '{\"blueprint_uuid\":\"6743a1c3-3e57-4cfa-a886-e0c0a277fd71\",\"blueprint_type\":\"structure\",\"multisite_sync\":false}', '{\"active\":{\"reference\":{\"type\":\"text\",\"name\":\"reference\",\"nullable\":true},\"priority\":{\"type\":\"text\",\"name\":\"priority\",\"nullable\":true},\"changefreq\":{\"type\":\"text\",\"name\":\"changefreq\",\"nullable\":true},\"nesting\":{\"type\":\"boolean\",\"name\":\"nesting\",\"nullable\":true},\"replace\":{\"type\":\"boolean\",\"name\":\"replace\",\"nullable\":true}},\"dropped\":[]}', NULL, '2023-10-20 18:39:47', '2023-10-20 18:39:47');

-- --------------------------------------------------------

--
-- Structure de la table `tailor_globals`
--

DROP TABLE IF EXISTS `tailor_globals`;
CREATE TABLE IF NOT EXISTS `tailor_globals` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `site_id` int DEFAULT NULL,
  `site_root_id` int DEFAULT NULL,
  `blueprint_uuid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tailor_globals_site_id_index` (`site_id`),
  KEY `tailor_globals_site_root_id_index` (`site_root_id`),
  KEY `tailor_globals_blueprint_uuid_index` (`blueprint_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `tailor_globals`
--

INSERT INTO `tailor_globals` (`id`, `site_id`, `site_root_id`, `blueprint_uuid`, `content`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '3328c303-7989-462e-b866-27e7037ba275', '[]', NULL, '2023-10-20 18:40:45', '2023-10-20 18:40:45');

-- --------------------------------------------------------

--
-- Structure de la table `tailor_global_joins`
--

DROP TABLE IF EXISTS `tailor_global_joins`;
CREATE TABLE IF NOT EXISTS `tailor_global_joins` (
  `parent_id` int DEFAULT NULL,
  `relation_id` int DEFAULT NULL,
  `relation_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `field_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_id` int DEFAULT NULL,
  KEY `tailor_global_joins_idx` (`relation_id`,`relation_type`),
  KEY `tailor_global_joins_field_name_index` (`field_name`),
  KEY `tailor_global_joins_site_id_index` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `tailor_global_repeaters`
--

DROP TABLE IF EXISTS `tailor_global_repeaters`;
CREATE TABLE IF NOT EXISTS `tailor_global_repeaters` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `host_id` int DEFAULT NULL,
  `host_field` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_id` int DEFAULT NULL,
  `content_group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_value` mediumtext COLLATE utf8mb4_unicode_ci,
  `content_spawn_path` text COLLATE utf8mb4_unicode_ci,
  `sort_order` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tailor_global_repeaters_idx` (`host_id`,`host_field`),
  KEY `tailor_global_repeaters_site_id_index` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `tailor_preview_tokens`
--

DROP TABLE IF EXISTS `tailor_preview_tokens`;
CREATE TABLE IF NOT EXISTS `tailor_preview_tokens` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `site_id` int DEFAULT NULL,
  `route` mediumtext COLLATE utf8mb4_unicode_ci,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `count_use` int NOT NULL DEFAULT '0',
  `count_limit` int NOT NULL DEFAULT '0',
  `created_user_id` int UNSIGNED DEFAULT NULL,
  `expired_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tailor_preview_tokens_site_id_index` (`site_id`),
  KEY `tailor_preview_tokens_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `xc_339b11b769ad43c49be16953e7738827c`
--

DROP TABLE IF EXISTS `xc_339b11b769ad43c49be16953e7738827c`;
CREATE TABLE IF NOT EXISTS `xc_339b11b769ad43c49be16953e7738827c` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `site_id` int DEFAULT NULL,
  `site_root_id` int DEFAULT NULL,
  `blueprint_uuid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_enabled` tinyint(1) DEFAULT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  `published_at_date` timestamp NULL DEFAULT NULL,
  `expired_at` timestamp NULL DEFAULT NULL,
  `draft_mode` int NOT NULL DEFAULT '1',
  `primary_id` int UNSIGNED DEFAULT NULL,
  `primary_attrs` mediumtext COLLATE utf8mb4_unicode_ci,
  `is_version` tinyint(1) NOT NULL DEFAULT '0',
  `fullslug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `nest_left` int DEFAULT NULL,
  `nest_right` int DEFAULT NULL,
  `nest_depth` int DEFAULT NULL,
  `content` mediumtext COLLATE utf8mb4_unicode_ci,
  `show_in_toc` tinyint(1) DEFAULT NULL,
  `summary_text` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_user_id` int UNSIGNED DEFAULT NULL,
  `updated_user_id` int UNSIGNED DEFAULT NULL,
  `deleted_user_id` int UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xc_339b11b769ad43c49be16953e7738827c_site_id_index` (`site_id`),
  KEY `xc_339b11b769ad43c49be16953e7738827c_site_root_id_index` (`site_root_id`),
  KEY `xc_339b11b769ad43c49be16953e7738827c_blueprint_uuid_index` (`blueprint_uuid`),
  KEY `xc_339b11b769ad43c49be16953e7738827c_content_group_index` (`content_group`),
  KEY `xc_339b11b769ad43c49be16953e7738827c_slug_index` (`slug`),
  KEY `xc_339b11b769ad43c49be16953e7738827c_primary_id_index` (`primary_id`),
  KEY `xc_339b11b769ad43c49be16953e7738827c_fullslug_index` (`fullslug`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Content for Article [Page\\Article].';

--
-- Déchargement des données de la table `xc_339b11b769ad43c49be16953e7738827c`
--

INSERT INTO `xc_339b11b769ad43c49be16953e7738827c` (`id`, `site_id`, `site_root_id`, `blueprint_uuid`, `content_group`, `title`, `slug`, `is_enabled`, `published_at`, `published_at_date`, `expired_at`, `draft_mode`, `primary_id`, `primary_attrs`, `is_version`, `fullslug`, `parent_id`, `nest_left`, `nest_right`, `nest_depth`, `content`, `show_in_toc`, `summary_text`, `created_user_id`, `updated_user_id`, `deleted_user_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '339b11b7-69ad-43c4-9be1-6953e7738827', NULL, 'Our Locations', 'our-locations', 1, NULL, '2023-10-20 18:39:47', NULL, 1, NULL, NULL, 0, 'our-locations', NULL, 1, 8, 0, '<p>The term location generally implies a higher degree of certainty than place, the latter often indicating an entity with an ambiguous boundary, relying more on human or social attributes of place identity and sense of place than on geometry. An absolute location can be designated using a specific pairing of latitude and longitude in a Cartesian coordinate grid (for example, a spherical coordinate system or an ellipsoid-based system such as the World Geodetic System) or similar methods. For instance, the position of Lake Maracaibo in Venezuela can be expressed using the coordinate system as the location 9.80°N (latitude), 71.56°W (longitude).</p>', 1, 'In geography, location or place are used to denote a region (point, line, or area) on Earth\'s surface or elsewhere.', NULL, NULL, NULL, NULL, '2023-10-20 18:39:47', '2023-10-20 18:39:48'),
(2, 1, 2, '339b11b7-69ad-43c4-9be1-6953e7738827', NULL, 'Canberra', 'canberra', 1, NULL, '2023-10-20 18:39:48', NULL, 1, NULL, NULL, 0, 'our-locations/canberra', 1, 2, 3, 1, '<p>Unusual among Australian cities, it is an entirely planned city. The city is located at the northern end of the Australian Capital Territory[11] at the northern tip of the Australian Alps, the country\'s highest mountain range. As of June 2020, Canberra\'s estimated population was 431,380.[12]</p><p>The area chosen for the capital had been inhabited by Indigenous Australians for up to 21,000 years,[13] with the principal group being the Ngunnawal people. European settlement commenced in the first half of the 19th century, as evidenced by surviving landmarks such as St John\'s Anglican Church and Blundells Cottage. On 1 January 1901, federation of the colonies of Australia was achieved. Following a long dispute over whether Sydney or Melbourne should be the national capital,[14] a compromise was reached: the new capital would be built in New South Wales, so long as it was at least 100 miles (160 km) from Sydney. The capital city was founded and formally named as Canberra in 1913. A blueprint by American architects Walter Burley Griffin and Marion Mahony Griffin was selected after an international design contest, and construction commenced in 1913.[15] The Griffins\' plan featured geometric motifs and was centred on axes aligned with significant topographical landmarks such as Black Mountain, Mount Ainslie, Capital Hill and City Hill. Canberra\'s mountainous location makes it the only mainland Australian city where snow-capped mountains can be seen in winter; although snow in the city itself is rare.</p><p>As the seat of the Government of Australia, Canberra is home to many important institutions of the federal government, national monuments and museums. This includes Parliament House, Government House, the High Court and the headquarters of numerous government agencies. It is the location of many social and cultural institutions of national significance such as the Australian War Memorial, the Australian National University, the Royal Australian Mint, the Australian Institute of Sport, the National Gallery, the National Museum and the National Library. The city is home to many important institutions of the Australian Defence Force including the Royal Military College Duntroon and the Australian Defence Force Academy. It hosts all foreign embassies in Australia as well as regional headquarters of many international organisations, not-for-profit groups, lobbying groups and professional associations.</p>', 1, 'Canberra (/ˈkænbərə/ KAN-bə-rə) is the capital city of Australia. Founded following the federation of the colonies of Australia as the seat of government for the new nation, it is Australia\'s largest inland city and the eighth-largest city overall.', NULL, NULL, NULL, NULL, '2023-10-20 18:39:48', '2023-10-20 18:39:48'),
(3, 1, 3, '339b11b7-69ad-43c4-9be1-6953e7738827', NULL, 'Sydney', 'sydney', 1, NULL, '2023-10-20 18:39:48', NULL, 1, NULL, NULL, 0, 'our-locations/sydney', 1, 4, 5, 1, '<p>Located on Australia\'s east coast, the metropolis surrounds Port Jackson and extends about 70 km (43.5 mi) on its periphery towards the Blue Mountains to the west, Hawkesbury to the north, the Royal National Park to the south and Macarthur to the south-west. Sydney is made up of 658 suburbs, spread across 33 local government areas. Residents of the city are known as \"Sydneysiders\". As of June 2020, Sydney\'s estimated metropolitan population was 5,361,466, meaning the city is home to approximately 66% of the state\'s population. Nicknames of the city include the \'Emerald City\' and the \'Harbour City\'.</p><p>Indigenous Australians have inhabited the Sydney area for at least 30,000 years, and thousands of Aboriginal engravings remain throughout the region. During his first Pacific voyage in 1770, Lieutenant James Cook and his crew became the first Europeans to chart the eastern coast of Australia, making landfall at Botany Bay. In 1788, the First Fleet of convicts, led by Arthur Phillip, founded Sydney as a British penal colony, the first European settlement in Australia. After World War II, it experienced mass migration and became one of the most multicultural cities in the world. Furthermore, 45.4% of the population reported having been born overseas, and the city has the third-largest foreign-born population of any city in the world after London and New York City.</p><p>Despite being one of the most expensive cities in the world, Sydney frequently ranks in the top ten most liveable cities in the world. It is classified as an Alpha global city by the Globalization and World Cities Research Network, indicating its influence in the region and throughout the world. Ranked eleventh in the world for economic opportunity, Sydney has an advanced market economy with strengths in finance, manufacturing and tourism. Established in 1850, the University of Sydney was Australia\'s first university and is regarded as one of the world\'s leading universities.</p>', 1, 'Sydney is the capital city of the state of New South Wales, and the most populous city in Australia and Oceania.', NULL, NULL, NULL, NULL, '2023-10-20 18:39:48', '2023-10-20 18:39:48'),
(4, 1, 4, '339b11b7-69ad-43c4-9be1-6953e7738827', NULL, 'Vancouver', 'vancouver', 1, NULL, '2023-10-20 18:39:48', NULL, 1, NULL, NULL, 0, 'our-locations/vancouver', 1, 6, 7, 1, '<p>As the most populous city in the province, the 2021 census recorded 662,248 people in the city, up from 631,486 in 2016. The Greater Vancouver area had a population of 2,642,825 in 2021, making it the third-largest metropolitan area in Canada. Vancouver has the highest population density in Canada, with over 5,400 people per square kilometre. Vancouver is one of the most ethnically and linguistically diverse cities in Canada: 52 percent of its residents are not native English speakers, 48.9 percent are native speakers of neither English nor French, and 50.6 percent of residents belong to visible minority groups.</p><p>Vancouver is one of the most livable cities in Canada and in the world. In terms of housing affordability, Vancouver is also one of the most expensive cities in Canada and in the world. Vancouver plans to become the greenest city in the world. Vancouverism is the city\'s urban planning design philosophy.</p><p>Indigenous settlement of Vancouver began more than 10,000 years ago, and the city is on the traditional and unceded territories of the Squamish, Musqueam, and Tsleil-Waututh (Burrard) peoples. The beginnings of the modern city, which was originally named Gastown, grew around the site of a makeshift tavern on the western edges of Hastings Mill that was built on July 1, 1867, and owned by proprietor Gassy Jack. The original site is marked by the Gastown steam clock. Gastown then formally registered as a townsite dubbed Granville, Burrard Inlet. The city was renamed \"Vancouver\" in 1886, through a deal with the Canadian Pacific Railway (CPR). The Canadian Pacific transcontinental railway was extended to the city by 1887. The city\'s large natural seaport on the Pacific Ocean became a vital link in the trade between Asia-Pacific, East Asia, Europe, and Eastern Canada.</p>', 1, 'Vancouver is a major city in western Canada, located in the Lower Mainland region of British Columbia.', NULL, NULL, NULL, NULL, '2023-10-20 18:39:48', '2023-10-20 18:39:48'),
(5, 1, 5, '339b11b7-69ad-43c4-9be1-6953e7738827', NULL, 'Knowledge Base', 'knowledge-base', 1, NULL, '2023-10-20 18:39:48', NULL, 1, NULL, NULL, 0, 'our-locations/knowledge-base', NULL, 9, 10, 0, '<p>Knowledge Base</p>', 1, '', NULL, NULL, NULL, NULL, '2023-10-20 18:39:48', '2023-10-20 18:39:48');

-- --------------------------------------------------------

--
-- Structure de la table `xc_339b11b769ad43c49be16953e7738827j`
--

DROP TABLE IF EXISTS `xc_339b11b769ad43c49be16953e7738827j`;
CREATE TABLE IF NOT EXISTS `xc_339b11b769ad43c49be16953e7738827j` (
  `parent_id` int DEFAULT NULL,
  `relation_id` int DEFAULT NULL,
  `relation_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `field_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_id` int DEFAULT NULL,
  KEY `xc_339b11b769ad43c49be16953e7738827j_idx` (`relation_id`,`relation_type`),
  KEY `xc_339b11b769ad43c49be16953e7738827j_field_name_index` (`field_name`),
  KEY `xc_339b11b769ad43c49be16953e7738827j_site_id_index` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Joins for Article [Page\\Article].';

-- --------------------------------------------------------

--
-- Structure de la table `xc_339b11b769ad43c49be16953e7738827r`
--

DROP TABLE IF EXISTS `xc_339b11b769ad43c49be16953e7738827r`;
CREATE TABLE IF NOT EXISTS `xc_339b11b769ad43c49be16953e7738827r` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `host_id` int DEFAULT NULL,
  `host_field` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_id` int DEFAULT NULL,
  `content_group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_value` mediumtext COLLATE utf8mb4_unicode_ci,
  `content_spawn_path` text COLLATE utf8mb4_unicode_ci,
  `sort_order` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xc_339b11b769ad43c49be16953e7738827r_idx` (`host_id`,`host_field`),
  KEY `xc_339b11b769ad43c49be16953e7738827r_site_id_index` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Repeaters for Article [Page\\Article].';

--
-- Déchargement des données de la table `xc_339b11b769ad43c49be16953e7738827r`
--

INSERT INTO `xc_339b11b769ad43c49be16953e7738827r` (`id`, `host_id`, `host_field`, `site_id`, `content_group`, `content_value`, `content_spawn_path`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 2, 'external_links', NULL, NULL, '{\"link_text\":\"Canberra travel guide from Wikivoyage\",\"link_url\":\"https:\\/\\/en.wikivoyage.org\\/wiki\\/Canberra\"}', 'Tailor\\Models\\EntryRecord@339b11b7-69ad-43c4-9be1-6953e7738827.external_links', 1, '2023-10-20 18:39:48', '2023-10-20 18:39:48'),
(2, 2, 'external_links', NULL, NULL, '{\"link_text\":\"Official Tourism Website\",\"link_url\":\"https:\\/\\/visitcanberra.com.au\\/\"}', 'Tailor\\Models\\EntryRecord@339b11b7-69ad-43c4-9be1-6953e7738827.external_links', 2, '2023-10-20 18:39:48', '2023-10-20 18:39:48'),
(3, 2, 'external_links', NULL, NULL, '{\"link_text\":\"Canberra 100 – Celebrating Canberra\'s 100th anniversary\",\"link_url\":\"https:\\/\\/www.canberra100.com.au\\/\"}', 'Tailor\\Models\\EntryRecord@339b11b7-69ad-43c4-9be1-6953e7738827.external_links', 3, '2023-10-20 18:39:48', '2023-10-20 18:39:48');

-- --------------------------------------------------------

--
-- Structure de la table `xc_6743a1c33e574cfaa886e0c0a277fd71c`
--

DROP TABLE IF EXISTS `xc_6743a1c33e574cfaa886e0c0a277fd71c`;
CREATE TABLE IF NOT EXISTS `xc_6743a1c33e574cfaa886e0c0a277fd71c` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `site_id` int DEFAULT NULL,
  `site_root_id` int DEFAULT NULL,
  `blueprint_uuid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_enabled` tinyint(1) DEFAULT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  `published_at_date` timestamp NULL DEFAULT NULL,
  `expired_at` timestamp NULL DEFAULT NULL,
  `draft_mode` int NOT NULL DEFAULT '1',
  `primary_id` int UNSIGNED DEFAULT NULL,
  `primary_attrs` mediumtext COLLATE utf8mb4_unicode_ci,
  `is_version` tinyint(1) NOT NULL DEFAULT '0',
  `fullslug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `nest_left` int DEFAULT NULL,
  `nest_right` int DEFAULT NULL,
  `nest_depth` int DEFAULT NULL,
  `reference` text COLLATE utf8mb4_unicode_ci,
  `priority` text COLLATE utf8mb4_unicode_ci,
  `changefreq` text COLLATE utf8mb4_unicode_ci,
  `nesting` tinyint(1) DEFAULT NULL,
  `replace` tinyint(1) DEFAULT NULL,
  `created_user_id` int UNSIGNED DEFAULT NULL,
  `updated_user_id` int UNSIGNED DEFAULT NULL,
  `deleted_user_id` int UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xc_6743a1c33e574cfaa886e0c0a277fd71c_site_id_index` (`site_id`),
  KEY `xc_6743a1c33e574cfaa886e0c0a277fd71c_site_root_id_index` (`site_root_id`),
  KEY `xc_6743a1c33e574cfaa886e0c0a277fd71c_blueprint_uuid_index` (`blueprint_uuid`),
  KEY `xc_6743a1c33e574cfaa886e0c0a277fd71c_content_group_index` (`content_group`),
  KEY `xc_6743a1c33e574cfaa886e0c0a277fd71c_slug_index` (`slug`),
  KEY `xc_6743a1c33e574cfaa886e0c0a277fd71c_primary_id_index` (`primary_id`),
  KEY `xc_6743a1c33e574cfaa886e0c0a277fd71c_fullslug_index` (`fullslug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Content for Sitemap [Site\\Sitemap].';

-- --------------------------------------------------------

--
-- Structure de la table `xc_6743a1c33e574cfaa886e0c0a277fd71j`
--

DROP TABLE IF EXISTS `xc_6743a1c33e574cfaa886e0c0a277fd71j`;
CREATE TABLE IF NOT EXISTS `xc_6743a1c33e574cfaa886e0c0a277fd71j` (
  `parent_id` int DEFAULT NULL,
  `relation_id` int DEFAULT NULL,
  `relation_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `field_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_id` int DEFAULT NULL,
  KEY `xc_6743a1c33e574cfaa886e0c0a277fd71j_idx` (`relation_id`,`relation_type`),
  KEY `xc_6743a1c33e574cfaa886e0c0a277fd71j_field_name_index` (`field_name`),
  KEY `xc_6743a1c33e574cfaa886e0c0a277fd71j_site_id_index` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Joins for Sitemap [Site\\Sitemap].';

-- --------------------------------------------------------

--
-- Structure de la table `xc_6743a1c33e574cfaa886e0c0a277fd71r`
--

DROP TABLE IF EXISTS `xc_6743a1c33e574cfaa886e0c0a277fd71r`;
CREATE TABLE IF NOT EXISTS `xc_6743a1c33e574cfaa886e0c0a277fd71r` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `host_id` int DEFAULT NULL,
  `host_field` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_id` int DEFAULT NULL,
  `content_group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_value` mediumtext COLLATE utf8mb4_unicode_ci,
  `content_spawn_path` text COLLATE utf8mb4_unicode_ci,
  `sort_order` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xc_6743a1c33e574cfaa886e0c0a277fd71r_idx` (`host_id`,`host_field`),
  KEY `xc_6743a1c33e574cfaa886e0c0a277fd71r_site_id_index` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Repeaters for Sitemap [Site\\Sitemap].';

-- --------------------------------------------------------

--
-- Structure de la table `xc_6947ff28b66047d7924024ca6d58aeaec`
--

DROP TABLE IF EXISTS `xc_6947ff28b66047d7924024ca6d58aeaec`;
CREATE TABLE IF NOT EXISTS `xc_6947ff28b66047d7924024ca6d58aeaec` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `site_id` int DEFAULT NULL,
  `site_root_id` int DEFAULT NULL,
  `blueprint_uuid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_enabled` tinyint(1) DEFAULT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  `published_at_date` timestamp NULL DEFAULT NULL,
  `expired_at` timestamp NULL DEFAULT NULL,
  `draft_mode` int NOT NULL DEFAULT '1',
  `primary_id` int UNSIGNED DEFAULT NULL,
  `primary_attrs` mediumtext COLLATE utf8mb4_unicode_ci,
  `is_version` tinyint(1) NOT NULL DEFAULT '0',
  `avatar` mediumtext COLLATE utf8mb4_unicode_ci,
  `role` text COLLATE utf8mb4_unicode_ci,
  `about` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_user_id` int UNSIGNED DEFAULT NULL,
  `updated_user_id` int UNSIGNED DEFAULT NULL,
  `deleted_user_id` int UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xc_6947ff28b66047d7924024ca6d58aeaec_site_id_index` (`site_id`),
  KEY `xc_6947ff28b66047d7924024ca6d58aeaec_site_root_id_index` (`site_root_id`),
  KEY `xc_6947ff28b66047d7924024ca6d58aeaec_blueprint_uuid_index` (`blueprint_uuid`),
  KEY `xc_6947ff28b66047d7924024ca6d58aeaec_content_group_index` (`content_group`),
  KEY `xc_6947ff28b66047d7924024ca6d58aeaec_slug_index` (`slug`),
  KEY `xc_6947ff28b66047d7924024ca6d58aeaec_primary_id_index` (`primary_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Content for Author [Blog\\Author].';

--
-- Déchargement des données de la table `xc_6947ff28b66047d7924024ca6d58aeaec`
--

INSERT INTO `xc_6947ff28b66047d7924024ca6d58aeaec` (`id`, `site_id`, `site_root_id`, `blueprint_uuid`, `content_group`, `title`, `slug`, `is_enabled`, `published_at`, `published_at_date`, `expired_at`, `draft_mode`, `primary_id`, `primary_attrs`, `is_version`, `avatar`, `role`, `about`, `created_user_id`, `updated_user_id`, `deleted_user_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '6947ff28-b660-47d7-9240-24ca6d58aeae', NULL, 'John Smith', 'john-smith', 1, NULL, '2023-10-20 18:39:47', NULL, 1, NULL, NULL, 0, NULL, 'Manager', 'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL, NULL, NULL, NULL, '2023-10-20 18:39:47', '2023-10-20 18:39:47');

-- --------------------------------------------------------

--
-- Structure de la table `xc_6947ff28b66047d7924024ca6d58aeaej`
--

DROP TABLE IF EXISTS `xc_6947ff28b66047d7924024ca6d58aeaej`;
CREATE TABLE IF NOT EXISTS `xc_6947ff28b66047d7924024ca6d58aeaej` (
  `parent_id` int DEFAULT NULL,
  `relation_id` int DEFAULT NULL,
  `relation_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `field_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_id` int DEFAULT NULL,
  KEY `xc_6947ff28b66047d7924024ca6d58aeaej_idx` (`relation_id`,`relation_type`),
  KEY `xc_6947ff28b66047d7924024ca6d58aeaej_field_name_index` (`field_name`),
  KEY `xc_6947ff28b66047d7924024ca6d58aeaej_site_id_index` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Joins for Author [Blog\\Author].';

-- --------------------------------------------------------

--
-- Structure de la table `xc_6947ff28b66047d7924024ca6d58aeaer`
--

DROP TABLE IF EXISTS `xc_6947ff28b66047d7924024ca6d58aeaer`;
CREATE TABLE IF NOT EXISTS `xc_6947ff28b66047d7924024ca6d58aeaer` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `host_id` int DEFAULT NULL,
  `host_field` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_id` int DEFAULT NULL,
  `content_group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_value` mediumtext COLLATE utf8mb4_unicode_ci,
  `content_spawn_path` text COLLATE utf8mb4_unicode_ci,
  `sort_order` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xc_6947ff28b66047d7924024ca6d58aeaer_idx` (`host_id`,`host_field`),
  KEY `xc_6947ff28b66047d7924024ca6d58aeaer_site_id_index` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Repeaters for Author [Blog\\Author].';

--
-- Déchargement des données de la table `xc_6947ff28b66047d7924024ca6d58aeaer`
--

INSERT INTO `xc_6947ff28b66047d7924024ca6d58aeaer` (`id`, `host_id`, `host_field`, `site_id`, `content_group`, `content_value`, `content_spawn_path`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 1, 'social_links', NULL, NULL, '{\"platform\":\"twitter\",\"url\":\"https:\\/\\/twitter.com\\/octobercms\"}', 'Tailor\\Models\\EntryRecord@6947ff28-b660-47d7-9240-24ca6d58aeae.social_links', 1, '2023-10-20 18:39:47', '2023-10-20 18:39:47'),
(2, 1, 'social_links', NULL, NULL, '{\"platform\":\"youtube\",\"url\":\"https:\\/\\/www.youtube.com\\/c\\/OctoberCMSOfficial\"}', 'Tailor\\Models\\EntryRecord@6947ff28-b660-47d7-9240-24ca6d58aeae.social_links', 2, '2023-10-20 18:39:47', '2023-10-20 18:39:47'),
(3, 1, 'social_links', NULL, NULL, '{\"platform\":\"facebook\",\"url\":\"https:\\/\\/facebook.com\\/octobercms\"}', 'Tailor\\Models\\EntryRecord@6947ff28-b660-47d7-9240-24ca6d58aeae.social_links', 3, '2023-10-20 18:39:47', '2023-10-20 18:39:47'),
(4, 1, 'social_links', NULL, NULL, '{\"platform\":\"linkedin\",\"url\":\"https:\\/\\/www.linkedin.com\\/company\\/october-cms\\/\"}', 'Tailor\\Models\\EntryRecord@6947ff28-b660-47d7-9240-24ca6d58aeae.social_links', 4, '2023-10-20 18:39:47', '2023-10-20 18:39:47');

-- --------------------------------------------------------

--
-- Structure de la table `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1c`
--

DROP TABLE IF EXISTS `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1c`;
CREATE TABLE IF NOT EXISTS `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1c` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `site_id` int DEFAULT NULL,
  `site_root_id` int DEFAULT NULL,
  `blueprint_uuid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_enabled` tinyint(1) DEFAULT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  `published_at_date` timestamp NULL DEFAULT NULL,
  `expired_at` timestamp NULL DEFAULT NULL,
  `draft_mode` int NOT NULL DEFAULT '1',
  `primary_id` int UNSIGNED DEFAULT NULL,
  `primary_attrs` mediumtext COLLATE utf8mb4_unicode_ci,
  `is_version` tinyint(1) NOT NULL DEFAULT '0',
  `created_user_id` int UNSIGNED DEFAULT NULL,
  `updated_user_id` int UNSIGNED DEFAULT NULL,
  `deleted_user_id` int UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1c_site_id_index` (`site_id`),
  KEY `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1c_site_root_id_index` (`site_root_id`),
  KEY `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1c_blueprint_uuid_index` (`blueprint_uuid`),
  KEY `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1c_content_group_index` (`content_group`),
  KEY `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1c_slug_index` (`slug`),
  KEY `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1c_primary_id_index` (`primary_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Content for About Page [Page\\About].';

--
-- Déchargement des données de la table `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1c`
--

INSERT INTO `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1c` (`id`, `site_id`, `site_root_id`, `blueprint_uuid`, `content_group`, `title`, `slug`, `is_enabled`, `published_at`, `published_at_date`, `expired_at`, `draft_mode`, `primary_id`, `primary_attrs`, `is_version`, `created_user_id`, `updated_user_id`, `deleted_user_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1', NULL, 'About Us', 'about-us', 1, NULL, '2023-10-20 18:39:48', NULL, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, '2023-10-20 18:39:48', '2023-10-20 18:39:48');

-- --------------------------------------------------------

--
-- Structure de la table `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1j`
--

DROP TABLE IF EXISTS `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1j`;
CREATE TABLE IF NOT EXISTS `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1j` (
  `parent_id` int DEFAULT NULL,
  `relation_id` int DEFAULT NULL,
  `relation_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `field_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_id` int DEFAULT NULL,
  KEY `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1j_idx` (`relation_id`,`relation_type`),
  KEY `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1j_field_name_index` (`field_name`),
  KEY `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1j_site_id_index` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Joins for About Page [Page\\About].';

-- --------------------------------------------------------

--
-- Structure de la table `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1r`
--

DROP TABLE IF EXISTS `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1r`;
CREATE TABLE IF NOT EXISTS `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1r` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `host_id` int DEFAULT NULL,
  `host_field` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_id` int DEFAULT NULL,
  `content_group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_value` mediumtext COLLATE utf8mb4_unicode_ci,
  `content_spawn_path` text COLLATE utf8mb4_unicode_ci,
  `sort_order` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1r_idx` (`host_id`,`host_field`),
  KEY `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1r_site_id_index` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Repeaters for About Page [Page\\About].';

--
-- Déchargement des données de la table `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1r`
--

INSERT INTO `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1r` (`id`, `host_id`, `host_field`, `site_id`, `content_group`, `content_value`, `content_spawn_path`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 1, 'blocks', NULL, 'image_slice', '{\"image\":\"\"}', 'Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:image_slice', 1, '2023-10-20 18:39:48', '2023-10-20 18:39:48'),
(2, 1, 'blocks', NULL, 'paragraph_block', '{\"title\":\"Outstanding performance\",\"content\":\"<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.<\\/p>\",\"image\":\"\"}', 'Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:paragraph_block', 2, '2023-10-20 18:39:48', '2023-10-20 18:39:48'),
(3, 1, 'blocks', NULL, 'detailed_block', '{\"title\":\"Why work with us\",\"content\":\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<\\/p>\",\"list_items\":\"[{\\\"text\\\":\\\"Doloremque\\\"},{\\\"text\\\":\\\"Beatae vitae\\\"},{\\\"text\\\":\\\"Totam rem aperiam\\\"}]\",\"button_text\":\"Learn more about our process\",\"button_url\":\"https:\\/\\/octobercms.com\\/features\",\"image\":\"\"}', 'Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:detailed_block', 3, '2023-10-20 18:39:48', '2023-10-20 18:39:48'),
(4, 1, 'blocks', NULL, 'scoreboard_metrics', '[]', 'Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:scoreboard_metrics', 4, '2023-10-20 18:39:48', '2023-10-20 18:39:48'),
(5, 4, 'metrics', NULL, NULL, '{\"number\":3912,\"description\":\"Sed ut perspiciatis\",\"icon\":\"notepad\"}', 'Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:scoreboard_metrics.metrics', 1, '2023-10-20 18:39:48', '2023-10-20 18:39:48'),
(6, 4, 'metrics', NULL, NULL, '{\"number\":223,\"description\":\"Nemo enim ipsam\",\"icon\":\"shield\"}', 'Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:scoreboard_metrics.metrics', 2, '2023-10-20 18:39:48', '2023-10-20 18:39:48'),
(7, 4, 'metrics', NULL, NULL, '{\"number\":863,\"description\":\"Nam libero tempore\",\"icon\":\"basket\"}', 'Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:scoreboard_metrics.metrics', 3, '2023-10-20 18:39:48', '2023-10-20 18:39:48'),
(8, 4, 'metrics', NULL, NULL, '{\"number\":865,\"description\":\"Et harum quidem rerum\",\"icon\":\"briefcase\"}', 'Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:scoreboard_metrics.metrics', 4, '2023-10-20 18:39:48', '2023-10-20 18:39:48'),
(9, 1, 'blocks', NULL, 'team_leaders', '[]', 'Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders', 5, '2023-10-20 18:39:48', '2023-10-20 18:39:48'),
(10, 9, 'members', NULL, NULL, '{\"title\":\"Andy Anderson\",\"role\":\"Sales Manager\",\"description\":\"Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam.\",\"avatar\":\"\"}', 'Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders.members', 1, '2023-10-20 18:39:48', '2023-10-20 18:39:48'),
(11, 10, 'social_links', NULL, NULL, '{\"platform\":\"twitter\",\"url\":\"https:\\/\\/twitter.com\\/octobercms\"}', 'Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders.members.social_links', 1, '2023-10-20 18:39:48', '2023-10-20 18:39:48'),
(12, 10, 'social_links', NULL, NULL, '{\"platform\":\"linkedin\",\"url\":\"https:\\/\\/www.linkedin.com\\/company\\/october-cms\\/\"}', 'Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders.members.social_links', 2, '2023-10-20 18:39:48', '2023-10-20 18:39:48'),
(13, 10, 'social_links', NULL, NULL, '{\"platform\":\"facebook\",\"url\":\"https:\\/\\/facebook.com\\/octobercms\"}', 'Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders.members.social_links', 3, '2023-10-20 18:39:48', '2023-10-20 18:39:48'),
(14, 9, 'members', NULL, NULL, '{\"title\":\"Bob Harris\",\"role\":\"Product Designer\",\"description\":\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque.\",\"avatar\":\"\"}', 'Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders.members', 2, '2023-10-20 18:39:48', '2023-10-20 18:39:48'),
(15, 14, 'social_links', NULL, NULL, '{\"platform\":\"twitter\",\"url\":\"https:\\/\\/twitter.com\\/octobercms\"}', 'Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders.members.social_links', 1, '2023-10-20 18:39:48', '2023-10-20 18:39:48'),
(16, 14, 'social_links', NULL, NULL, '{\"platform\":\"youtube\",\"url\":\"https:\\/\\/www.youtube.com\\/c\\/OctoberCMSOfficial\"}', 'Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders.members.social_links', 2, '2023-10-20 18:39:48', '2023-10-20 18:39:48'),
(17, 14, 'social_links', NULL, NULL, '{\"platform\":\"dribbble\",\"url\":\"https:\\/\\/www.dribbble.com\"}', 'Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders.members.social_links', 3, '2023-10-20 18:39:48', '2023-10-20 18:39:48'),
(18, 14, 'social_links', NULL, NULL, '{\"platform\":\"facebook\",\"url\":\"https:\\/\\/facebook.com\\/octobercms\"}', 'Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders.members.social_links', 4, '2023-10-20 18:39:48', '2023-10-20 18:39:48'),
(19, 9, 'members', NULL, NULL, '{\"title\":\"Ann Lewis\",\"role\":\"Marketing Manager\",\"description\":\"Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla.\",\"avatar\":\"\"}', 'Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders.members', 3, '2023-10-20 18:39:48', '2023-10-20 18:39:48'),
(20, 19, 'social_links', NULL, NULL, '{\"platform\":\"twitter\",\"url\":\"https:\\/\\/twitter.com\\/octobercms\"}', 'Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders.members.social_links', 1, '2023-10-20 18:39:48', '2023-10-20 18:39:48'),
(21, 19, 'social_links', NULL, NULL, '{\"platform\":\"linkedin\",\"url\":\"https:\\/\\/www.linkedin.com\\/company\\/october-cms\\/\"}', 'Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders.members.social_links', 2, '2023-10-20 18:39:48', '2023-10-20 18:39:48'),
(22, 19, 'social_links', NULL, NULL, '{\"platform\":\"facebook\",\"url\":\"https:\\/\\/facebook.com\\/octobercms\"}', 'Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders.members.social_links', 3, '2023-10-20 18:39:48', '2023-10-20 18:39:48'),
(23, 9, 'members', NULL, NULL, '{\"title\":\"Christina Thompson\",\"role\":\"System Analyst\",\"description\":\"Et harum quidem rerum facilis est et expedita distinctio.\",\"avatar\":\"\"}', 'Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders.members', 4, '2023-10-20 18:39:48', '2023-10-20 18:39:48'),
(24, 23, 'social_links', NULL, NULL, '{\"platform\":\"twitter\",\"url\":\"https:\\/\\/twitter.com\\/octobercms\"}', 'Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders.members.social_links', 1, '2023-10-20 18:39:48', '2023-10-20 18:39:48'),
(25, 23, 'social_links', NULL, NULL, '{\"platform\":\"youtube\",\"url\":\"https:\\/\\/www.youtube.com\\/c\\/OctoberCMSOfficial\"}', 'Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders.members.social_links', 2, '2023-10-20 18:39:48', '2023-10-20 18:39:48'),
(26, 23, 'social_links', NULL, NULL, '{\"platform\":\"dribbble\",\"url\":\"https:\\/\\/www.dribbble.com\"}', 'Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders.members.social_links', 3, '2023-10-20 18:39:48', '2023-10-20 18:39:48'),
(27, 23, 'social_links', NULL, NULL, '{\"platform\":\"facebook\",\"url\":\"https:\\/\\/facebook.com\\/octobercms\"}', 'Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders.members.social_links', 4, '2023-10-20 18:39:48', '2023-10-20 18:39:48'),
(28, 9, 'members', NULL, NULL, '{\"title\":\"John Smith\",\"role\":\"President\",\"description\":\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.\",\"avatar\":\"\"}', 'Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders.members', 5, '2023-10-20 18:39:48', '2023-10-20 18:39:48'),
(29, 28, 'social_links', NULL, NULL, '{\"platform\":\"dribbble\",\"url\":\"https:\\/\\/www.dribbble.com\"}', 'Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders.members.social_links', 1, '2023-10-20 18:39:48', '2023-10-20 18:39:48'),
(30, 28, 'social_links', NULL, NULL, '{\"platform\":\"linkedin\",\"url\":\"https:\\/\\/www.linkedin.com\\/company\\/october-cms\\/\"}', 'Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders.members.social_links', 2, '2023-10-20 18:39:48', '2023-10-20 18:39:48'),
(31, 28, 'social_links', NULL, NULL, '{\"platform\":\"youtube\",\"url\":\"https:\\/\\/www.youtube.com\\/c\\/OctoberCMSOfficial\"}', 'Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders.members.social_links', 3, '2023-10-20 18:39:48', '2023-10-20 18:39:48');

-- --------------------------------------------------------

--
-- Structure de la table `xc_b022a74b15e64c6b9eb917efc5103543c`
--

DROP TABLE IF EXISTS `xc_b022a74b15e64c6b9eb917efc5103543c`;
CREATE TABLE IF NOT EXISTS `xc_b022a74b15e64c6b9eb917efc5103543c` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `site_id` int DEFAULT NULL,
  `site_root_id` int DEFAULT NULL,
  `blueprint_uuid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_enabled` tinyint(1) DEFAULT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  `published_at_date` timestamp NULL DEFAULT NULL,
  `expired_at` timestamp NULL DEFAULT NULL,
  `draft_mode` int NOT NULL DEFAULT '1',
  `primary_id` int UNSIGNED DEFAULT NULL,
  `primary_attrs` mediumtext COLLATE utf8mb4_unicode_ci,
  `is_version` tinyint(1) NOT NULL DEFAULT '0',
  `fullslug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `nest_left` int DEFAULT NULL,
  `nest_right` int DEFAULT NULL,
  `nest_depth` int DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_user_id` int UNSIGNED DEFAULT NULL,
  `updated_user_id` int UNSIGNED DEFAULT NULL,
  `deleted_user_id` int UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xc_b022a74b15e64c6b9eb917efc5103543c_site_id_index` (`site_id`),
  KEY `xc_b022a74b15e64c6b9eb917efc5103543c_site_root_id_index` (`site_root_id`),
  KEY `xc_b022a74b15e64c6b9eb917efc5103543c_blueprint_uuid_index` (`blueprint_uuid`),
  KEY `xc_b022a74b15e64c6b9eb917efc5103543c_content_group_index` (`content_group`),
  KEY `xc_b022a74b15e64c6b9eb917efc5103543c_slug_index` (`slug`),
  KEY `xc_b022a74b15e64c6b9eb917efc5103543c_primary_id_index` (`primary_id`),
  KEY `xc_b022a74b15e64c6b9eb917efc5103543c_fullslug_index` (`fullslug`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Content for Category [Blog\\Category].';

--
-- Déchargement des données de la table `xc_b022a74b15e64c6b9eb917efc5103543c`
--

INSERT INTO `xc_b022a74b15e64c6b9eb917efc5103543c` (`id`, `site_id`, `site_root_id`, `blueprint_uuid`, `content_group`, `title`, `slug`, `is_enabled`, `published_at`, `published_at_date`, `expired_at`, `draft_mode`, `primary_id`, `primary_attrs`, `is_version`, `fullslug`, `parent_id`, `nest_left`, `nest_right`, `nest_depth`, `description`, `created_user_id`, `updated_user_id`, `deleted_user_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'b022a74b-15e6-4c6b-9eb9-17efc5103543', NULL, 'Announcements', 'announcements', 1, NULL, '2023-10-20 18:39:47', NULL, 1, NULL, NULL, 0, NULL, NULL, 1, 2, 0, 'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt molliti', NULL, NULL, NULL, NULL, '2023-10-20 18:39:47', '2023-10-20 18:39:47'),
(2, 1, 2, 'b022a74b-15e6-4c6b-9eb9-17efc5103543', NULL, 'News', 'news', 1, NULL, '2023-10-20 18:39:47', NULL, 1, NULL, NULL, 0, NULL, NULL, 3, 4, 0, 'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.', NULL, NULL, NULL, NULL, '2023-10-20 18:39:47', '2023-10-20 18:39:47'),
(3, 1, 3, 'b022a74b-15e6-4c6b-9eb9-17efc5103543', NULL, 'Startup Ideas', 'startup-ideas', 1, NULL, '2023-10-20 18:39:47', NULL, 1, NULL, NULL, 0, NULL, NULL, 5, 6, 0, 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proide', NULL, NULL, NULL, NULL, '2023-10-20 18:39:47', '2023-10-20 18:39:47'),
(4, 1, 4, 'b022a74b-15e6-4c6b-9eb9-17efc5103543', NULL, 'Updates', 'updates', 1, NULL, '2023-10-20 18:39:47', NULL, 1, NULL, NULL, 0, NULL, NULL, 7, 8, 0, 'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt molliti', NULL, NULL, NULL, NULL, '2023-10-20 18:39:47', '2023-10-20 18:39:47'),
(5, 1, 5, 'b022a74b-15e6-4c6b-9eb9-17efc5103543', NULL, 'Automation', 'automation', 1, NULL, '2023-10-20 18:39:47', NULL, 1, NULL, NULL, 0, NULL, NULL, 9, 10, 0, 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.', NULL, NULL, NULL, NULL, '2023-10-20 18:39:47', '2023-10-20 18:39:47');

-- --------------------------------------------------------

--
-- Structure de la table `xc_b022a74b15e64c6b9eb917efc5103543j`
--

DROP TABLE IF EXISTS `xc_b022a74b15e64c6b9eb917efc5103543j`;
CREATE TABLE IF NOT EXISTS `xc_b022a74b15e64c6b9eb917efc5103543j` (
  `parent_id` int DEFAULT NULL,
  `relation_id` int DEFAULT NULL,
  `relation_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `field_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_id` int DEFAULT NULL,
  KEY `xc_b022a74b15e64c6b9eb917efc5103543j_idx` (`relation_id`,`relation_type`),
  KEY `xc_b022a74b15e64c6b9eb917efc5103543j_field_name_index` (`field_name`),
  KEY `xc_b022a74b15e64c6b9eb917efc5103543j_site_id_index` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Joins for Category [Blog\\Category].';

-- --------------------------------------------------------

--
-- Structure de la table `xc_b022a74b15e64c6b9eb917efc5103543r`
--

DROP TABLE IF EXISTS `xc_b022a74b15e64c6b9eb917efc5103543r`;
CREATE TABLE IF NOT EXISTS `xc_b022a74b15e64c6b9eb917efc5103543r` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `host_id` int DEFAULT NULL,
  `host_field` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_id` int DEFAULT NULL,
  `content_group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_value` mediumtext COLLATE utf8mb4_unicode_ci,
  `content_spawn_path` text COLLATE utf8mb4_unicode_ci,
  `sort_order` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xc_b022a74b15e64c6b9eb917efc5103543r_idx` (`host_id`,`host_field`),
  KEY `xc_b022a74b15e64c6b9eb917efc5103543r_site_id_index` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Repeaters for Category [Blog\\Category].';

-- --------------------------------------------------------

--
-- Structure de la table `xc_edcd102e05254e4db07e633ae6c18db6c`
--

DROP TABLE IF EXISTS `xc_edcd102e05254e4db07e633ae6c18db6c`;
CREATE TABLE IF NOT EXISTS `xc_edcd102e05254e4db07e633ae6c18db6c` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `site_id` int DEFAULT NULL,
  `site_root_id` int DEFAULT NULL,
  `blueprint_uuid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_enabled` tinyint(1) DEFAULT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  `published_at_date` timestamp NULL DEFAULT NULL,
  `expired_at` timestamp NULL DEFAULT NULL,
  `draft_mode` int NOT NULL DEFAULT '1',
  `primary_id` int UNSIGNED DEFAULT NULL,
  `primary_attrs` mediumtext COLLATE utf8mb4_unicode_ci,
  `is_version` tinyint(1) NOT NULL DEFAULT '0',
  `published_at_day` int DEFAULT NULL,
  `published_at_month` int DEFAULT NULL,
  `published_at_year` int DEFAULT NULL,
  `content` mediumtext COLLATE utf8mb4_unicode_ci,
  `author_id` int UNSIGNED DEFAULT NULL,
  `featured_text` mediumtext COLLATE utf8mb4_unicode_ci,
  `gallery_media` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_user_id` int UNSIGNED DEFAULT NULL,
  `updated_user_id` int UNSIGNED DEFAULT NULL,
  `deleted_user_id` int UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xc_edcd102e05254e4db07e633ae6c18db6c_site_id_index` (`site_id`),
  KEY `xc_edcd102e05254e4db07e633ae6c18db6c_site_root_id_index` (`site_root_id`),
  KEY `xc_edcd102e05254e4db07e633ae6c18db6c_blueprint_uuid_index` (`blueprint_uuid`),
  KEY `xc_edcd102e05254e4db07e633ae6c18db6c_content_group_index` (`content_group`),
  KEY `xc_edcd102e05254e4db07e633ae6c18db6c_slug_index` (`slug`),
  KEY `xc_edcd102e05254e4db07e633ae6c18db6c_primary_id_index` (`primary_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Content for Post [Blog\\Post].';

--
-- Déchargement des données de la table `xc_edcd102e05254e4db07e633ae6c18db6c`
--

INSERT INTO `xc_edcd102e05254e4db07e633ae6c18db6c` (`id`, `site_id`, `site_root_id`, `blueprint_uuid`, `content_group`, `title`, `slug`, `is_enabled`, `published_at`, `published_at_date`, `expired_at`, `draft_mode`, `primary_id`, `primary_attrs`, `is_version`, `published_at_day`, `published_at_month`, `published_at_year`, `content`, `author_id`, `featured_text`, `gallery_media`, `created_user_id`, `updated_user_id`, `deleted_user_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'edcd102e-0525-4e4d-b07e-633ae6c18db6', 'regular_post', 'Consectetur adipiscing elit', 'consectetur-adipiscing-elit', 1, NULL, '2023-10-20 18:39:47', NULL, 1, NULL, NULL, 0, 20, 10, 2023, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p><p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p>', 1, 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.', NULL, NULL, NULL, NULL, NULL, '2023-10-20 18:39:47', '2023-10-20 18:39:47'),
(2, 1, 2, 'edcd102e-0525-4e4d-b07e-633ae6c18db6', 'regular_post', 'Nemo enim ipsam', 'nemo-enim-ipsam', 1, NULL, '2023-10-20 18:39:47', NULL, 1, NULL, NULL, 0, 20, 10, 2023, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p><p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p>', 1, 'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga.', NULL, NULL, NULL, NULL, NULL, '2023-10-20 18:39:47', '2023-10-20 18:39:47');

-- --------------------------------------------------------

--
-- Structure de la table `xc_edcd102e05254e4db07e633ae6c18db6j`
--

DROP TABLE IF EXISTS `xc_edcd102e05254e4db07e633ae6c18db6j`;
CREATE TABLE IF NOT EXISTS `xc_edcd102e05254e4db07e633ae6c18db6j` (
  `parent_id` int DEFAULT NULL,
  `relation_id` int DEFAULT NULL,
  `relation_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `field_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_id` int DEFAULT NULL,
  KEY `xc_edcd102e05254e4db07e633ae6c18db6j_idx` (`relation_id`,`relation_type`),
  KEY `xc_edcd102e05254e4db07e633ae6c18db6j_field_name_index` (`field_name`),
  KEY `xc_edcd102e05254e4db07e633ae6c18db6j_site_id_index` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Joins for Post [Blog\\Post].';

--
-- Déchargement des données de la table `xc_edcd102e05254e4db07e633ae6c18db6j`
--

INSERT INTO `xc_edcd102e05254e4db07e633ae6c18db6j` (`parent_id`, `relation_id`, `relation_type`, `field_name`, `site_id`) VALUES
(1, 1, 'Tailor\\Models\\EntryRecord@xc_b022a74b15e64c6b9eb917efc5103543c', 'categories', NULL),
(2, 2, 'Tailor\\Models\\EntryRecord@xc_b022a74b15e64c6b9eb917efc5103543c', 'categories', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `xc_edcd102e05254e4db07e633ae6c18db6r`
--

DROP TABLE IF EXISTS `xc_edcd102e05254e4db07e633ae6c18db6r`;
CREATE TABLE IF NOT EXISTS `xc_edcd102e05254e4db07e633ae6c18db6r` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `host_id` int DEFAULT NULL,
  `host_field` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_id` int DEFAULT NULL,
  `content_group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_value` mediumtext COLLATE utf8mb4_unicode_ci,
  `content_spawn_path` text COLLATE utf8mb4_unicode_ci,
  `sort_order` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xc_edcd102e05254e4db07e633ae6c18db6r_idx` (`host_id`,`host_field`),
  KEY `xc_edcd102e05254e4db07e633ae6c18db6r_site_id_index` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Repeaters for Post [Blog\\Post].';
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
