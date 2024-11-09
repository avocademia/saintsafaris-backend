-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 09, 2024 at 12:10 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `saintsafaris_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

CREATE TABLE `activities` (
  `id` int(10) UNSIGNED NOT NULL,
  `activity` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_by_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `activities_tours_links`
--

CREATE TABLE `activities_tours_links` (
  `id` int(10) UNSIGNED NOT NULL,
  `activity_id` int(10) UNSIGNED DEFAULT NULL,
  `tour_id` int(10) UNSIGNED DEFAULT NULL,
  `tour_order` double UNSIGNED DEFAULT NULL,
  `activity_order` double UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_permissions`
--

CREATE TABLE `admin_permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `action` varchar(255) DEFAULT NULL,
  `action_parameters` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`action_parameters`)),
  `subject` varchar(255) DEFAULT NULL,
  `properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`properties`)),
  `conditions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`conditions`)),
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_by_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_permissions`
--

INSERT INTO `admin_permissions` (`id`, `action`, `action_parameters`, `subject`, `properties`, `conditions`, `created_at`, `updated_at`, `created_by_id`, `updated_by_id`) VALUES
(2, 'plugin::content-manager.explorer.create', '{}', 'api::tour.tour', '{\"fields\":[\"title\",\"description\",\"media\",\"ideal_dates\",\"disclaimer\",\"cancellations\",\"itinerary\",\"days\",\"nights\",\"cancellation_conclusion\",\"country\",\"display_picture\",\"continent\",\"status\"]}', '[]', '2024-03-01 20:19:26.906000', '2024-03-22 14:10:02.414000', NULL, NULL),
(4, 'plugin::content-manager.explorer.read', '{}', 'api::tour.tour', '{\"fields\":[\"title\",\"description\",\"media\",\"ideal_dates\",\"disclaimer\",\"cancellations\",\"itinerary\",\"days\",\"nights\",\"cancellation_conclusion\",\"country\",\"display_picture\",\"continent\",\"status\"]}', '[]', '2024-03-01 20:19:26.922000', '2024-03-22 14:10:02.414000', NULL, NULL),
(6, 'plugin::content-manager.explorer.update', '{}', 'api::tour.tour', '{\"fields\":[\"title\",\"description\",\"media\",\"ideal_dates\",\"disclaimer\",\"cancellations\",\"itinerary\",\"days\",\"nights\",\"cancellation_conclusion\",\"country\",\"display_picture\",\"continent\",\"status\"]}', '[]', '2024-03-01 20:19:26.934000', '2024-03-22 14:10:02.414000', NULL, NULL),
(8, 'plugin::content-manager.explorer.delete', '{}', 'api::tour.tour', '{}', '[]', '2024-03-01 20:19:26.948000', '2024-03-01 20:19:26.948000', NULL, NULL),
(9, 'plugin::content-manager.explorer.publish', '{}', 'api::tour.tour', '{}', '[]', '2024-03-01 20:19:26.953000', '2024-03-01 20:19:26.953000', NULL, NULL),
(10, 'plugin::upload.read', '{}', NULL, '{}', '[]', '2024-03-01 20:19:26.958000', '2024-03-01 20:19:26.958000', NULL, NULL),
(11, 'plugin::upload.configure-view', '{}', NULL, '{}', '[]', '2024-03-01 20:19:26.965000', '2024-03-01 20:19:26.965000', NULL, NULL),
(12, 'plugin::upload.assets.create', '{}', NULL, '{}', '[]', '2024-03-01 20:19:26.969000', '2024-03-01 20:19:26.969000', NULL, NULL),
(13, 'plugin::upload.assets.update', '{}', NULL, '{}', '[]', '2024-03-01 20:19:26.973000', '2024-03-01 20:19:26.973000', NULL, NULL),
(14, 'plugin::upload.assets.download', '{}', NULL, '{}', '[]', '2024-03-01 20:19:26.978000', '2024-03-01 20:19:26.978000', NULL, NULL),
(15, 'plugin::upload.assets.copy-link', '{}', NULL, '{}', '[]', '2024-03-01 20:19:26.985000', '2024-03-01 20:19:26.985000', NULL, NULL),
(17, 'plugin::content-manager.explorer.create', '{}', 'api::tour.tour', '{\"fields\":[\"title\",\"description\",\"media\",\"ideal_dates\",\"disclaimer\",\"cancellations\",\"itinerary\",\"days\",\"nights\",\"cancellation_conclusion\",\"country\",\"display_picture\",\"continent\",\"status\"]}', '[\"admin::is-creator\"]', '2024-03-01 20:19:26.997000', '2024-03-22 14:10:02.414000', NULL, NULL),
(19, 'plugin::content-manager.explorer.read', '{}', 'api::tour.tour', '{\"fields\":[\"title\",\"description\",\"media\",\"ideal_dates\",\"disclaimer\",\"cancellations\",\"itinerary\",\"days\",\"nights\",\"cancellation_conclusion\",\"country\",\"display_picture\",\"continent\",\"status\"]}', '[\"admin::is-creator\"]', '2024-03-01 20:19:27.007000', '2024-03-22 14:10:02.414000', NULL, NULL),
(21, 'plugin::content-manager.explorer.update', '{}', 'api::tour.tour', '{\"fields\":[\"title\",\"description\",\"media\",\"ideal_dates\",\"disclaimer\",\"cancellations\",\"itinerary\",\"days\",\"nights\",\"cancellation_conclusion\",\"country\",\"display_picture\",\"continent\",\"status\"]}', '[\"admin::is-creator\"]', '2024-03-01 20:19:27.020000', '2024-03-22 14:10:02.414000', NULL, NULL),
(23, 'plugin::content-manager.explorer.delete', '{}', 'api::tour.tour', '{}', '[\"admin::is-creator\"]', '2024-03-01 20:19:27.032000', '2024-03-01 20:19:27.032000', NULL, NULL),
(24, 'plugin::upload.read', '{}', NULL, '{}', '[\"admin::is-creator\"]', '2024-03-01 20:19:27.036000', '2024-03-01 20:19:27.036000', NULL, NULL),
(25, 'plugin::upload.configure-view', '{}', NULL, '{}', '[]', '2024-03-01 20:19:27.040000', '2024-03-01 20:19:27.040000', NULL, NULL),
(26, 'plugin::upload.assets.create', '{}', NULL, '{}', '[]', '2024-03-01 20:19:27.046000', '2024-03-01 20:19:27.046000', NULL, NULL),
(27, 'plugin::upload.assets.update', '{}', NULL, '{}', '[\"admin::is-creator\"]', '2024-03-01 20:19:27.053000', '2024-03-01 20:19:27.053000', NULL, NULL),
(28, 'plugin::upload.assets.download', '{}', NULL, '{}', '[]', '2024-03-01 20:19:27.057000', '2024-03-01 20:19:27.057000', NULL, NULL),
(29, 'plugin::upload.assets.copy-link', '{}', NULL, '{}', '[]', '2024-03-01 20:19:27.063000', '2024-03-01 20:19:27.063000', NULL, NULL),
(40, 'plugin::content-manager.explorer.delete', '{}', 'api::tour.tour', '{}', '[]', '2024-03-01 20:19:27.157000', '2024-03-01 20:19:27.157000', NULL, NULL),
(41, 'plugin::content-manager.explorer.delete', '{}', 'plugin::users-permissions.user', '{}', '[]', '2024-03-01 20:19:27.161000', '2024-03-01 20:19:27.161000', NULL, NULL),
(42, 'plugin::content-manager.explorer.publish', '{}', 'api::tour.tour', '{}', '[]', '2024-03-01 20:19:27.165000', '2024-03-01 20:19:27.165000', NULL, NULL),
(43, 'plugin::content-manager.single-types.configure-view', '{}', NULL, '{}', '[]', '2024-03-01 20:19:27.172000', '2024-03-01 20:19:27.172000', NULL, NULL),
(44, 'plugin::content-manager.collection-types.configure-view', '{}', NULL, '{}', '[]', '2024-03-01 20:19:27.181000', '2024-03-01 20:19:27.181000', NULL, NULL),
(45, 'plugin::content-manager.components.configure-layout', '{}', NULL, '{}', '[]', '2024-03-01 20:19:27.190000', '2024-03-01 20:19:27.190000', NULL, NULL),
(46, 'plugin::content-type-builder.read', '{}', NULL, '{}', '[]', '2024-03-01 20:19:27.202000', '2024-03-01 20:19:27.202000', NULL, NULL),
(47, 'plugin::email.settings.read', '{}', NULL, '{}', '[]', '2024-03-01 20:19:27.209000', '2024-03-01 20:19:27.209000', NULL, NULL),
(48, 'plugin::upload.read', '{}', NULL, '{}', '[]', '2024-03-01 20:19:27.222000', '2024-03-01 20:19:27.222000', NULL, NULL),
(49, 'plugin::upload.assets.create', '{}', NULL, '{}', '[]', '2024-03-01 20:19:27.229000', '2024-03-01 20:19:27.229000', NULL, NULL),
(50, 'plugin::upload.assets.update', '{}', NULL, '{}', '[]', '2024-03-01 20:19:27.237000', '2024-03-01 20:19:27.237000', NULL, NULL),
(51, 'plugin::upload.assets.download', '{}', NULL, '{}', '[]', '2024-03-01 20:19:27.242000', '2024-03-01 20:19:27.242000', NULL, NULL),
(52, 'plugin::upload.assets.copy-link', '{}', NULL, '{}', '[]', '2024-03-01 20:19:27.252000', '2024-03-01 20:19:27.252000', NULL, NULL),
(53, 'plugin::upload.configure-view', '{}', NULL, '{}', '[]', '2024-03-01 20:19:27.256000', '2024-03-01 20:19:27.256000', NULL, NULL),
(54, 'plugin::upload.settings.read', '{}', NULL, '{}', '[]', '2024-03-01 20:19:27.270000', '2024-03-01 20:19:27.270000', NULL, NULL),
(55, 'plugin::i18n.locale.create', '{}', NULL, '{}', '[]', '2024-03-01 20:19:27.275000', '2024-03-01 20:19:27.275000', NULL, NULL),
(56, 'plugin::i18n.locale.read', '{}', NULL, '{}', '[]', '2024-03-01 20:19:27.284000', '2024-03-01 20:19:27.284000', NULL, NULL),
(57, 'plugin::i18n.locale.update', '{}', NULL, '{}', '[]', '2024-03-01 20:19:27.290000', '2024-03-01 20:19:27.290000', NULL, NULL),
(58, 'plugin::i18n.locale.delete', '{}', NULL, '{}', '[]', '2024-03-01 20:19:27.306000', '2024-03-01 20:19:27.306000', NULL, NULL),
(59, 'plugin::users-permissions.roles.create', '{}', NULL, '{}', '[]', '2024-03-01 20:19:27.314000', '2024-03-01 20:19:27.314000', NULL, NULL),
(60, 'plugin::users-permissions.roles.read', '{}', NULL, '{}', '[]', '2024-03-01 20:19:27.321000', '2024-03-01 20:19:27.321000', NULL, NULL),
(61, 'plugin::users-permissions.roles.update', '{}', NULL, '{}', '[]', '2024-03-01 20:19:27.325000', '2024-03-01 20:19:27.325000', NULL, NULL),
(62, 'plugin::users-permissions.roles.delete', '{}', NULL, '{}', '[]', '2024-03-01 20:19:27.333000', '2024-03-01 20:19:27.333000', NULL, NULL),
(63, 'plugin::users-permissions.providers.read', '{}', NULL, '{}', '[]', '2024-03-01 20:19:27.338000', '2024-03-01 20:19:27.338000', NULL, NULL),
(64, 'plugin::users-permissions.providers.update', '{}', NULL, '{}', '[]', '2024-03-01 20:19:27.342000', '2024-03-01 20:19:27.342000', NULL, NULL),
(65, 'plugin::users-permissions.email-templates.read', '{}', NULL, '{}', '[]', '2024-03-01 20:19:27.355000', '2024-03-01 20:19:27.355000', NULL, NULL),
(66, 'plugin::users-permissions.email-templates.update', '{}', NULL, '{}', '[]', '2024-03-01 20:19:27.364000', '2024-03-01 20:19:27.364000', NULL, NULL),
(67, 'plugin::users-permissions.advanced-settings.read', '{}', NULL, '{}', '[]', '2024-03-01 20:19:27.377000', '2024-03-01 20:19:27.377000', NULL, NULL),
(68, 'plugin::users-permissions.advanced-settings.update', '{}', NULL, '{}', '[]', '2024-03-01 20:19:27.389000', '2024-03-01 20:19:27.389000', NULL, NULL),
(69, 'admin::marketplace.read', '{}', NULL, '{}', '[]', '2024-03-01 20:19:27.392000', '2024-03-01 20:19:27.392000', NULL, NULL),
(70, 'admin::webhooks.create', '{}', NULL, '{}', '[]', '2024-03-01 20:19:27.403000', '2024-03-01 20:19:27.403000', NULL, NULL),
(71, 'admin::webhooks.read', '{}', NULL, '{}', '[]', '2024-03-01 20:19:27.407000', '2024-03-01 20:19:27.407000', NULL, NULL),
(72, 'admin::webhooks.update', '{}', NULL, '{}', '[]', '2024-03-01 20:19:27.414000', '2024-03-01 20:19:27.414000', NULL, NULL),
(73, 'admin::webhooks.delete', '{}', NULL, '{}', '[]', '2024-03-01 20:19:27.421000', '2024-03-01 20:19:27.421000', NULL, NULL),
(74, 'admin::users.create', '{}', NULL, '{}', '[]', '2024-03-01 20:19:27.425000', '2024-03-01 20:19:27.425000', NULL, NULL),
(75, 'admin::users.read', '{}', NULL, '{}', '[]', '2024-03-01 20:19:27.436000', '2024-03-01 20:19:27.436000', NULL, NULL),
(76, 'admin::users.update', '{}', NULL, '{}', '[]', '2024-03-01 20:19:27.442000', '2024-03-01 20:19:27.442000', NULL, NULL),
(77, 'admin::users.delete', '{}', NULL, '{}', '[]', '2024-03-01 20:19:27.457000', '2024-03-01 20:19:27.457000', NULL, NULL),
(78, 'admin::roles.create', '{}', NULL, '{}', '[]', '2024-03-01 20:19:27.464000', '2024-03-01 20:19:27.464000', NULL, NULL),
(79, 'admin::roles.read', '{}', NULL, '{}', '[]', '2024-03-01 20:19:27.471000', '2024-03-01 20:19:27.471000', NULL, NULL),
(80, 'admin::roles.update', '{}', NULL, '{}', '[]', '2024-03-01 20:19:27.475000', '2024-03-01 20:19:27.475000', NULL, NULL),
(81, 'admin::roles.delete', '{}', NULL, '{}', '[]', '2024-03-01 20:19:27.483000', '2024-03-01 20:19:27.483000', NULL, NULL),
(82, 'admin::api-tokens.access', '{}', NULL, '{}', '[]', '2024-03-01 20:19:27.489000', '2024-03-01 20:19:27.489000', NULL, NULL),
(83, 'admin::api-tokens.create', '{}', NULL, '{}', '[]', '2024-03-01 20:19:27.496000', '2024-03-01 20:19:27.496000', NULL, NULL),
(84, 'admin::api-tokens.read', '{}', NULL, '{}', '[]', '2024-03-01 20:19:27.502000', '2024-03-01 20:19:27.502000', NULL, NULL),
(85, 'admin::api-tokens.update', '{}', NULL, '{}', '[]', '2024-03-01 20:19:27.508000', '2024-03-01 20:19:27.508000', NULL, NULL),
(86, 'admin::api-tokens.regenerate', '{}', NULL, '{}', '[]', '2024-03-01 20:19:27.515000', '2024-03-01 20:19:27.515000', NULL, NULL),
(87, 'admin::api-tokens.delete', '{}', NULL, '{}', '[]', '2024-03-01 20:19:27.521000', '2024-03-01 20:19:27.521000', NULL, NULL),
(88, 'admin::project-settings.update', '{}', NULL, '{}', '[]', '2024-03-01 20:19:27.525000', '2024-03-01 20:19:27.525000', NULL, NULL),
(89, 'admin::project-settings.read', '{}', NULL, '{}', '[]', '2024-03-01 20:19:27.531000', '2024-03-01 20:19:27.531000', NULL, NULL),
(90, 'admin::transfer.tokens.access', '{}', NULL, '{}', '[]', '2024-03-01 20:19:27.538000', '2024-03-01 20:19:27.538000', NULL, NULL),
(91, 'admin::transfer.tokens.create', '{}', NULL, '{}', '[]', '2024-03-01 20:19:27.544000', '2024-03-01 20:19:27.544000', NULL, NULL),
(92, 'admin::transfer.tokens.read', '{}', NULL, '{}', '[]', '2024-03-01 20:19:27.549000', '2024-03-01 20:19:27.549000', NULL, NULL),
(93, 'admin::transfer.tokens.update', '{}', NULL, '{}', '[]', '2024-03-01 20:19:27.553000', '2024-03-01 20:19:27.553000', NULL, NULL),
(94, 'admin::transfer.tokens.regenerate', '{}', NULL, '{}', '[]', '2024-03-01 20:19:27.557000', '2024-03-01 20:19:27.557000', NULL, NULL),
(95, 'admin::transfer.tokens.delete', '{}', NULL, '{}', '[]', '2024-03-01 20:19:27.563000', '2024-03-01 20:19:27.563000', NULL, NULL),
(126, 'plugin::content-manager.explorer.create', '{}', 'plugin::users-permissions.user', '{\"fields\":[\"username\",\"email\",\"provider\",\"password\",\"resetPasswordToken\",\"confirmationToken\",\"confirmed\",\"blocked\",\"role\",\"first_name\",\"middle_name\",\"surname\",\"dp\",\"dob\"]}', '[]', '2024-03-22 13:46:25.165000', '2024-03-22 13:46:25.165000', NULL, NULL),
(128, 'plugin::content-manager.explorer.read', '{}', 'plugin::users-permissions.user', '{\"fields\":[\"username\",\"email\",\"provider\",\"password\",\"resetPasswordToken\",\"confirmationToken\",\"confirmed\",\"blocked\",\"role\",\"first_name\",\"middle_name\",\"surname\",\"dp\",\"dob\"]}', '[]', '2024-03-22 13:46:25.182000', '2024-03-22 13:46:25.182000', NULL, NULL),
(130, 'plugin::content-manager.explorer.update', '{}', 'plugin::users-permissions.user', '{\"fields\":[\"username\",\"email\",\"provider\",\"password\",\"resetPasswordToken\",\"confirmationToken\",\"confirmed\",\"blocked\",\"role\",\"first_name\",\"middle_name\",\"surname\",\"dp\",\"dob\"]}', '[]', '2024-03-22 13:46:25.200000', '2024-03-22 13:46:25.200000', NULL, NULL),
(154, 'plugin::content-manager.explorer.delete', '{}', 'api::review.review', '{}', '[]', '2024-03-24 18:10:30.505000', '2024-03-24 18:10:30.505000', NULL, NULL),
(156, 'plugin::content-manager.explorer.create', '{}', 'api::review.review', '{\"fields\":[\"rating\",\"body\",\"tourid\",\"first_name\",\"surname\",\"username\"]}', '[]', '2024-03-24 18:11:14.839000', '2024-03-24 18:11:14.839000', NULL, NULL),
(157, 'plugin::content-manager.explorer.read', '{}', 'api::review.review', '{\"fields\":[\"rating\",\"body\",\"tourid\",\"first_name\",\"surname\",\"username\"]}', '[]', '2024-03-24 18:11:14.845000', '2024-03-24 18:11:14.845000', NULL, NULL),
(158, 'plugin::content-manager.explorer.update', '{}', 'api::review.review', '{\"fields\":[\"rating\",\"body\",\"tourid\",\"first_name\",\"surname\",\"username\"]}', '[]', '2024-03-24 18:11:14.850000', '2024-03-24 18:11:14.850000', NULL, NULL),
(159, 'plugin::content-manager.explorer.create', '{}', 'api::activity.activity', '{\"fields\":[\"activity\",\"tours\"]}', '[]', '2024-03-27 11:22:44.803000', '2024-03-27 11:22:44.803000', NULL, NULL),
(160, 'plugin::content-manager.explorer.create', '{}', 'api::tour.tour', '{\"fields\":[\"title\",\"description\",\"media\",\"ideal_dates\",\"disclaimer\",\"cancellations\",\"itinerary\",\"days\",\"nights\",\"cancellation_conclusion\",\"country\",\"display_picture\",\"continent\",\"status\",\"activities\"]}', '[]', '2024-03-27 11:22:44.811000', '2024-03-27 11:22:44.811000', NULL, NULL),
(161, 'plugin::content-manager.explorer.read', '{}', 'api::activity.activity', '{\"fields\":[\"activity\",\"tours\"]}', '[]', '2024-03-27 11:22:44.816000', '2024-03-27 11:22:44.816000', NULL, NULL),
(162, 'plugin::content-manager.explorer.read', '{}', 'api::tour.tour', '{\"fields\":[\"title\",\"description\",\"media\",\"ideal_dates\",\"disclaimer\",\"cancellations\",\"itinerary\",\"days\",\"nights\",\"cancellation_conclusion\",\"country\",\"display_picture\",\"continent\",\"status\",\"activities\"]}', '[]', '2024-03-27 11:22:44.823000', '2024-03-27 11:22:44.823000', NULL, NULL),
(163, 'plugin::content-manager.explorer.update', '{}', 'api::activity.activity', '{\"fields\":[\"activity\",\"tours\"]}', '[]', '2024-03-27 11:22:44.832000', '2024-03-27 11:22:44.832000', NULL, NULL),
(164, 'plugin::content-manager.explorer.update', '{}', 'api::tour.tour', '{\"fields\":[\"title\",\"description\",\"media\",\"ideal_dates\",\"disclaimer\",\"cancellations\",\"itinerary\",\"days\",\"nights\",\"cancellation_conclusion\",\"country\",\"display_picture\",\"continent\",\"status\",\"activities\"]}', '[]', '2024-03-27 11:22:44.836000', '2024-03-27 11:22:44.836000', NULL, NULL),
(165, 'plugin::content-manager.explorer.delete', '{}', 'api::activity.activity', '{}', '[]', '2024-03-27 11:22:44.844000', '2024-03-27 11:22:44.844000', NULL, NULL),
(166, 'plugin::content-manager.explorer.publish', '{}', 'api::activity.activity', '{}', '[]', '2024-03-27 11:22:44.850000', '2024-03-27 11:22:44.850000', NULL, NULL),
(167, 'plugin::content-manager.explorer.create', '{}', 'api::employee.employee', '{\"fields\":[\"name\",\"role\",\"social_link\",\"dp\",\"icon\"]}', '[]', '2024-03-31 17:30:22.268000', '2024-03-31 17:30:22.268000', NULL, NULL),
(168, 'plugin::content-manager.explorer.read', '{}', 'api::employee.employee', '{\"fields\":[\"name\",\"role\",\"social_link\",\"dp\",\"icon\"]}', '[]', '2024-03-31 17:30:22.279000', '2024-03-31 17:30:22.279000', NULL, NULL),
(169, 'plugin::content-manager.explorer.update', '{}', 'api::employee.employee', '{\"fields\":[\"name\",\"role\",\"social_link\",\"dp\",\"icon\"]}', '[]', '2024-03-31 17:30:22.286000', '2024-03-31 17:30:22.286000', NULL, NULL),
(170, 'plugin::content-manager.explorer.delete', '{}', 'api::employee.employee', '{}', '[]', '2024-03-31 17:30:22.293000', '2024-03-31 17:30:22.293000', NULL, NULL),
(171, 'plugin::content-manager.explorer.publish', '{}', 'api::employee.employee', '{}', '[]', '2024-03-31 17:30:22.301000', '2024-03-31 17:30:22.301000', NULL, NULL),
(180, 'plugin::content-manager.explorer.create', '{}', 'api::tour-booking.tour-booking', '{\"fields\":[\"tour\",\"first_name\",\"surname\",\"phone\",\"email\",\"adults\",\"children\",\"city\",\"travel_date\",\"message\"]}', '[]', '2024-04-25 14:45:44.121000', '2024-04-25 14:45:44.121000', NULL, NULL),
(181, 'plugin::content-manager.explorer.read', '{}', 'api::tour-booking.tour-booking', '{\"fields\":[\"tour\",\"first_name\",\"surname\",\"phone\",\"email\",\"adults\",\"children\",\"city\",\"travel_date\",\"message\"]}', '[]', '2024-04-25 14:45:44.129000', '2024-04-25 14:45:44.129000', NULL, NULL),
(182, 'plugin::content-manager.explorer.update', '{}', 'api::tour-booking.tour-booking', '{\"fields\":[\"tour\",\"first_name\",\"surname\",\"phone\",\"email\",\"adults\",\"children\",\"city\",\"travel_date\",\"message\"]}', '[]', '2024-04-25 14:45:44.134000', '2024-04-25 14:45:44.134000', NULL, NULL),
(183, 'plugin::content-manager.explorer.delete', '{}', 'api::tour-booking.tour-booking', '{}', '[]', '2024-04-25 14:45:44.140000', '2024-04-25 14:45:44.140000', NULL, NULL),
(187, 'plugin::content-manager.explorer.delete', '{}', 'api::query.query', '{}', '[]', '2024-04-25 16:02:12.477000', '2024-04-25 16:02:12.477000', NULL, NULL),
(188, 'plugin::content-manager.explorer.create', '{}', 'api::query.query', '{\"fields\":[\"full_name\",\"subject\",\"message\",\"email\"]}', '[]', '2024-04-25 16:13:56.718000', '2024-04-25 16:13:56.718000', NULL, NULL),
(189, 'plugin::content-manager.explorer.read', '{}', 'api::query.query', '{\"fields\":[\"full_name\",\"subject\",\"message\",\"email\"]}', '[]', '2024-04-25 16:13:56.728000', '2024-04-25 16:13:56.728000', NULL, NULL),
(190, 'plugin::content-manager.explorer.update', '{}', 'api::query.query', '{\"fields\":[\"full_name\",\"subject\",\"message\",\"email\"]}', '[]', '2024-04-25 16:13:56.734000', '2024-04-25 16:13:56.734000', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_permissions_role_links`
--

CREATE TABLE `admin_permissions_role_links` (
  `id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED DEFAULT NULL,
  `role_id` int(10) UNSIGNED DEFAULT NULL,
  `permission_order` double UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_permissions_role_links`
--

INSERT INTO `admin_permissions_role_links` (`id`, `permission_id`, `role_id`, `permission_order`) VALUES
(2, 2, 2, 2),
(4, 4, 2, 4),
(6, 6, 2, 6),
(8, 8, 2, 8),
(9, 9, 2, 9),
(10, 10, 2, 10),
(11, 11, 2, 11),
(12, 12, 2, 12),
(13, 13, 2, 13),
(14, 14, 2, 14),
(15, 15, 2, 15),
(17, 17, 3, 2),
(19, 19, 3, 4),
(21, 21, 3, 6),
(23, 23, 3, 8),
(24, 24, 3, 9),
(25, 25, 3, 10),
(26, 26, 3, 11),
(27, 27, 3, 12),
(28, 28, 3, 13),
(29, 29, 3, 14),
(40, 40, 1, 11),
(41, 41, 1, 12),
(42, 42, 1, 13),
(43, 43, 1, 14),
(44, 44, 1, 15),
(45, 45, 1, 16),
(46, 46, 1, 17),
(47, 47, 1, 18),
(48, 48, 1, 19),
(49, 49, 1, 20),
(50, 50, 1, 21),
(51, 51, 1, 22),
(52, 52, 1, 23),
(53, 53, 1, 24),
(54, 54, 1, 25),
(55, 55, 1, 26),
(56, 56, 1, 27),
(57, 57, 1, 28),
(58, 58, 1, 29),
(59, 59, 1, 30),
(60, 60, 1, 31),
(61, 61, 1, 32),
(62, 62, 1, 33),
(63, 63, 1, 34),
(64, 64, 1, 35),
(65, 65, 1, 36),
(66, 66, 1, 37),
(67, 67, 1, 38),
(68, 68, 1, 39),
(69, 69, 1, 40),
(70, 70, 1, 41),
(71, 71, 1, 42),
(72, 72, 1, 43),
(73, 73, 1, 44),
(74, 74, 1, 45),
(75, 75, 1, 46),
(76, 76, 1, 47),
(77, 77, 1, 48),
(78, 78, 1, 49),
(79, 79, 1, 50),
(80, 80, 1, 51),
(81, 81, 1, 52),
(82, 82, 1, 53),
(83, 83, 1, 54),
(84, 84, 1, 55),
(85, 85, 1, 56),
(86, 86, 1, 57),
(87, 87, 1, 58),
(88, 88, 1, 59),
(89, 89, 1, 60),
(90, 90, 1, 61),
(91, 91, 1, 62),
(92, 92, 1, 63),
(93, 93, 1, 64),
(94, 94, 1, 65),
(95, 95, 1, 66),
(126, 126, 1, 87),
(128, 128, 1, 89),
(130, 130, 1, 91),
(154, 154, 1, 101),
(156, 156, 1, 103),
(157, 157, 1, 104),
(158, 158, 1, 105),
(159, 159, 1, 106),
(160, 160, 1, 107),
(161, 161, 1, 108),
(162, 162, 1, 109),
(163, 163, 1, 110),
(164, 164, 1, 111),
(165, 165, 1, 112),
(166, 166, 1, 113),
(167, 167, 1, 114),
(168, 168, 1, 115),
(169, 169, 1, 116),
(170, 170, 1, 117),
(171, 171, 1, 118),
(180, 180, 1, 119),
(181, 181, 1, 120),
(182, 182, 1, 121),
(183, 183, 1, 122),
(187, 187, 1, 126),
(188, 188, 1, 127),
(189, 189, 1, 128),
(190, 190, 1, 129);

-- --------------------------------------------------------

--
-- Table structure for table `admin_roles`
--

CREATE TABLE `admin_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_by_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_roles`
--

INSERT INTO `admin_roles` (`id`, `name`, `code`, `description`, `created_at`, `updated_at`, `created_by_id`, `updated_by_id`) VALUES
(1, 'Super Admin', 'strapi-super-admin', 'Super Admins can access and manage all features and settings.', '2024-03-01 20:19:26.870000', '2024-03-01 20:19:26.870000', NULL, NULL),
(2, 'Editor', 'strapi-editor', 'Editors can manage and publish contents including those of other users.', '2024-03-01 20:19:26.881000', '2024-03-01 20:19:26.881000', NULL, NULL),
(3, 'Author', 'strapi-author', 'Authors can manage the content they have created.', '2024-03-01 20:19:26.886000', '2024-03-01 20:19:26.886000', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `reset_password_token` varchar(255) DEFAULT NULL,
  `registration_token` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `blocked` tinyint(1) DEFAULT NULL,
  `prefered_language` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_by_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `firstname`, `lastname`, `username`, `email`, `password`, `reset_password_token`, `registration_token`, `is_active`, `blocked`, `prefered_language`, `created_at`, `updated_at`, `created_by_id`, `updated_by_id`) VALUES
(1, 'Jotham', 'Jami', NULL, 'jothamoj@outlook.com', '$2a$10$162wgEMNWQaLv4DfyjMDfePATiZ6/bngnB1g627oUBanvSirSuBvu', NULL, NULL, 1, 0, NULL, '2024-03-01 20:20:02.832000', '2024-03-01 20:20:02.832000', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_users_roles_links`
--

CREATE TABLE `admin_users_roles_links` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `role_id` int(10) UNSIGNED DEFAULT NULL,
  `role_order` double UNSIGNED DEFAULT NULL,
  `user_order` double UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_users_roles_links`
--

INSERT INTO `admin_users_roles_links` (`id`, `user_id`, `role_id`, `role_order`, `user_order`) VALUES
(1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `social_link` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_by_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `alternative_text` varchar(255) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `formats` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`formats`)),
  `hash` varchar(255) DEFAULT NULL,
  `ext` varchar(255) DEFAULT NULL,
  `mime` varchar(255) DEFAULT NULL,
  `size` decimal(10,2) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `preview_url` varchar(255) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `provider_metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`provider_metadata`)),
  `folder_path` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_by_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`id`, `name`, `alternative_text`, `caption`, `width`, `height`, `formats`, `hash`, `ext`, `mime`, `size`, `url`, `preview_url`, `provider`, `provider_metadata`, `folder_path`, `created_at`, `updated_at`, `created_by_id`, `updated_by_id`) VALUES
(1, 'south-kenya-4.png', NULL, NULL, 2823, 1805, '{\"thumbnail\":{\"name\":\"thumbnail_south-kenya-4.png\",\"hash\":\"thumbnail_south_kenya_4_173fd38fd9\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":244,\"height\":156,\"size\":97.03,\"url\":\"/uploads/thumbnail_south_kenya_4_173fd38fd9.png\"},\"small\":{\"name\":\"small_south-kenya-4.png\",\"hash\":\"small_south_kenya_4_173fd38fd9\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":500,\"height\":320,\"size\":372.47,\"url\":\"/uploads/small_south_kenya_4_173fd38fd9.png\"},\"medium\":{\"name\":\"medium_south-kenya-4.png\",\"hash\":\"medium_south_kenya_4_173fd38fd9\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":750,\"height\":480,\"size\":798.5,\"url\":\"/uploads/medium_south_kenya_4_173fd38fd9.png\"},\"large\":{\"name\":\"large_south-kenya-4.png\",\"hash\":\"large_south_kenya_4_173fd38fd9\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":1000,\"height\":639,\"size\":1376.72,\"url\":\"/uploads/large_south_kenya_4_173fd38fd9.png\"}}', 'south_kenya_4_173fd38fd9', '.png', 'image/png', 1872.75, '/uploads/south_kenya_4_173fd38fd9.png', NULL, 'local', NULL, '/', '2024-03-02 12:10:28.258000', '2024-03-02 12:10:28.258000', 1, 1),
(2, 'south-kenya-3.png', NULL, NULL, 2816, 1717, '{\"thumbnail\":{\"name\":\"thumbnail_south-kenya-3.png\",\"hash\":\"thumbnail_south_kenya_3_8b4e8e619b\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":245,\"height\":149,\"size\":81.27,\"url\":\"/uploads/thumbnail_south_kenya_3_8b4e8e619b.png\"},\"small\":{\"name\":\"small_south-kenya-3.png\",\"hash\":\"small_south_kenya_3_8b4e8e619b\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":500,\"height\":305,\"size\":320.51,\"url\":\"/uploads/small_south_kenya_3_8b4e8e619b.png\"},\"medium\":{\"name\":\"medium_south-kenya-3.png\",\"hash\":\"medium_south_kenya_3_8b4e8e619b\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":750,\"height\":457,\"size\":711.63,\"url\":\"/uploads/medium_south_kenya_3_8b4e8e619b.png\"},\"large\":{\"name\":\"large_south-kenya-3.png\",\"hash\":\"large_south_kenya_3_8b4e8e619b\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":1000,\"height\":610,\"size\":1261.76,\"url\":\"/uploads/large_south_kenya_3_8b4e8e619b.png\"}}', 'south_kenya_3_8b4e8e619b', '.png', 'image/png', 2136.97, '/uploads/south_kenya_3_8b4e8e619b.png', NULL, 'local', NULL, '/', '2024-03-02 12:10:28.728000', '2024-03-02 12:10:28.728000', 1, 1),
(3, 'south-kenya-1.png', NULL, NULL, 3180, 1909, '{\"thumbnail\":{\"name\":\"thumbnail_south-kenya-1.png\",\"hash\":\"thumbnail_south_kenya_1_2ed7cc64a1\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":245,\"height\":147,\"size\":59.66,\"url\":\"/uploads/thumbnail_south_kenya_1_2ed7cc64a1.png\"},\"small\":{\"name\":\"small_south-kenya-1.png\",\"hash\":\"small_south_kenya_1_2ed7cc64a1\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":500,\"height\":300,\"size\":223.82,\"url\":\"/uploads/small_south_kenya_1_2ed7cc64a1.png\"},\"medium\":{\"name\":\"medium_south-kenya-1.png\",\"hash\":\"medium_south_kenya_1_2ed7cc64a1\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":750,\"height\":450,\"size\":495.89,\"url\":\"/uploads/medium_south_kenya_1_2ed7cc64a1.png\"},\"large\":{\"name\":\"large_south-kenya-1.png\",\"hash\":\"large_south_kenya_1_2ed7cc64a1\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":1000,\"height\":600,\"size\":874.16,\"url\":\"/uploads/large_south_kenya_1_2ed7cc64a1.png\"}}', 'south_kenya_1_2ed7cc64a1', '.png', 'image/png', 1808.31, '/uploads/south_kenya_1_2ed7cc64a1.png', NULL, 'local', NULL, '/', '2024-03-02 12:10:29.074000', '2024-03-02 12:10:29.074000', 1, 1),
(4, 'south-kenya-5.png', NULL, NULL, 2832, 1858, '{\"thumbnail\":{\"name\":\"thumbnail_south-kenya-5.png\",\"hash\":\"thumbnail_south_kenya_5_9ee17552e2\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":238,\"height\":156,\"size\":91.09,\"url\":\"/uploads/thumbnail_south_kenya_5_9ee17552e2.png\"},\"medium\":{\"name\":\"medium_south-kenya-5.png\",\"hash\":\"medium_south_kenya_5_9ee17552e2\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":750,\"height\":492,\"size\":792.06,\"url\":\"/uploads/medium_south_kenya_5_9ee17552e2.png\"},\"large\":{\"name\":\"large_south-kenya-5.png\",\"hash\":\"large_south_kenya_5_9ee17552e2\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":1000,\"height\":656,\"size\":1389.36,\"url\":\"/uploads/large_south_kenya_5_9ee17552e2.png\"},\"small\":{\"name\":\"small_south-kenya-5.png\",\"hash\":\"small_south_kenya_5_9ee17552e2\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":500,\"height\":328,\"size\":363.55,\"url\":\"/uploads/small_south_kenya_5_9ee17552e2.png\"}}', 'south_kenya_5_9ee17552e2', '.png', 'image/png', 1951.04, '/uploads/south_kenya_5_9ee17552e2.png', NULL, 'local', NULL, '/', '2024-03-02 12:10:29.143000', '2024-03-02 12:10:29.143000', 1, 1),
(5, 'south-kenya-2.png', NULL, NULL, 3052, 1736, '{\"thumbnail\":{\"name\":\"thumbnail_south-kenya-2.png\",\"hash\":\"thumbnail_south_kenya_2_585fdef45d\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":245,\"height\":139,\"size\":69.12,\"url\":\"/uploads/thumbnail_south_kenya_2_585fdef45d.png\"},\"small\":{\"name\":\"small_south-kenya-2.png\",\"hash\":\"small_south_kenya_2_585fdef45d\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":500,\"height\":284,\"size\":264.3,\"url\":\"/uploads/small_south_kenya_2_585fdef45d.png\"},\"medium\":{\"name\":\"medium_south-kenya-2.png\",\"hash\":\"medium_south_kenya_2_585fdef45d\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":750,\"height\":427,\"size\":577.08,\"url\":\"/uploads/medium_south_kenya_2_585fdef45d.png\"},\"large\":{\"name\":\"large_south-kenya-2.png\",\"hash\":\"large_south_kenya_2_585fdef45d\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":1000,\"height\":569,\"size\":992.78,\"url\":\"/uploads/large_south_kenya_2_585fdef45d.png\"}}', 'south_kenya_2_585fdef45d', '.png', 'image/png', 1592.25, '/uploads/south_kenya_2_585fdef45d.png', NULL, 'local', NULL, '/', '2024-03-02 12:10:29.756000', '2024-03-02 12:10:29.756000', 1, 1),
(6, 'south-kenya-6.png', NULL, NULL, 2808, 1635, '{\"thumbnail\":{\"name\":\"thumbnail_south-kenya-6.png\",\"hash\":\"thumbnail_south_kenya_6_72ba25d784\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":245,\"height\":143,\"size\":96.51,\"url\":\"/uploads/thumbnail_south_kenya_6_72ba25d784.png\"},\"small\":{\"name\":\"small_south-kenya-6.png\",\"hash\":\"small_south_kenya_6_72ba25d784\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":500,\"height\":291,\"size\":391.37,\"url\":\"/uploads/small_south_kenya_6_72ba25d784.png\"},\"large\":{\"name\":\"large_south-kenya-6.png\",\"hash\":\"large_south_kenya_6_72ba25d784\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":1000,\"height\":582,\"size\":1523.04,\"url\":\"/uploads/large_south_kenya_6_72ba25d784.png\"},\"medium\":{\"name\":\"medium_south-kenya-6.png\",\"hash\":\"medium_south_kenya_6_72ba25d784\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":750,\"height\":437,\"size\":866.73,\"url\":\"/uploads/medium_south_kenya_6_72ba25d784.png\"}}', 'south_kenya_6_72ba25d784', '.png', 'image/png', 2803.05, '/uploads/south_kenya_6_72ba25d784.png', NULL, 'local', NULL, '/', '2024-03-02 12:10:30.960000', '2024-03-02 12:10:30.960000', 1, 1),
(7, 'central-kenya-1.jpg', NULL, NULL, 4115, 5224, '{\"thumbnail\":{\"name\":\"thumbnail_central-kenya-1.jpg\",\"hash\":\"thumbnail_central_kenya_1_850eb5bebd\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":123,\"height\":156,\"size\":3.55,\"url\":\"/uploads/thumbnail_central_kenya_1_850eb5bebd.jpg\"},\"medium\":{\"name\":\"medium_central-kenya-1.jpg\",\"hash\":\"medium_central_kenya_1_850eb5bebd\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":590,\"height\":750,\"size\":52.69,\"url\":\"/uploads/medium_central_kenya_1_850eb5bebd.jpg\"},\"small\":{\"name\":\"small_central-kenya-1.jpg\",\"hash\":\"small_central_kenya_1_850eb5bebd\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":394,\"height\":500,\"size\":25.54,\"url\":\"/uploads/small_central_kenya_1_850eb5bebd.jpg\"},\"large\":{\"name\":\"large_central-kenya-1.jpg\",\"hash\":\"large_central_kenya_1_850eb5bebd\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":787,\"height\":1000,\"size\":87.85,\"url\":\"/uploads/large_central_kenya_1_850eb5bebd.jpg\"}}', 'central_kenya_1_850eb5bebd', '.jpg', 'image/jpeg', 1297.06, '/uploads/central_kenya_1_850eb5bebd.jpg', NULL, 'local', NULL, '/', '2024-03-04 07:57:40.152000', '2024-03-04 07:57:40.152000', 1, 1),
(8, 'central-kenya-5.jpg', NULL, NULL, 5870, 2896, '{\"thumbnail\":{\"name\":\"thumbnail_central-kenya-5.jpg\",\"hash\":\"thumbnail_central_kenya_5_dd6759abac\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":245,\"height\":121,\"size\":5.14,\"url\":\"/uploads/thumbnail_central_kenya_5_dd6759abac.jpg\"},\"large\":{\"name\":\"large_central-kenya-5.jpg\",\"hash\":\"large_central_kenya_5_dd6759abac\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":1000,\"height\":494,\"size\":59.62,\"url\":\"/uploads/large_central_kenya_5_dd6759abac.jpg\"},\"medium\":{\"name\":\"medium_central-kenya-5.jpg\",\"hash\":\"medium_central_kenya_5_dd6759abac\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":750,\"height\":370,\"size\":36.84,\"url\":\"/uploads/medium_central_kenya_5_dd6759abac.jpg\"},\"small\":{\"name\":\"small_central-kenya-5.jpg\",\"hash\":\"small_central_kenya_5_dd6759abac\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":247,\"size\":17.9,\"url\":\"/uploads/small_central_kenya_5_dd6759abac.jpg\"}}', 'central_kenya_5_dd6759abac', '.jpg', 'image/jpeg', 946.51, '/uploads/central_kenya_5_dd6759abac.jpg', NULL, 'local', NULL, '/', '2024-03-04 07:57:40.613000', '2024-03-04 07:57:40.613000', 1, 1),
(9, 'central-kenya-6.jpg', NULL, NULL, 3893, 2595, '{\"thumbnail\":{\"name\":\"thumbnail_central-kenya-6.jpg\",\"hash\":\"thumbnail_central_kenya_6_2fa16bba9a\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":234,\"height\":156,\"size\":11.75,\"url\":\"/uploads/thumbnail_central_kenya_6_2fa16bba9a.jpg\"},\"small\":{\"name\":\"small_central-kenya-6.jpg\",\"hash\":\"small_central_kenya_6_2fa16bba9a\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":333,\"size\":43.63,\"url\":\"/uploads/small_central_kenya_6_2fa16bba9a.jpg\"},\"medium\":{\"name\":\"medium_central-kenya-6.jpg\",\"hash\":\"medium_central_kenya_6_2fa16bba9a\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":750,\"height\":499,\"size\":83.79,\"url\":\"/uploads/medium_central_kenya_6_2fa16bba9a.jpg\"},\"large\":{\"name\":\"large_central-kenya-6.jpg\",\"hash\":\"large_central_kenya_6_2fa16bba9a\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":1000,\"height\":666,\"size\":132.68,\"url\":\"/uploads/large_central_kenya_6_2fa16bba9a.jpg\"}}', 'central_kenya_6_2fa16bba9a', '.jpg', 'image/jpeg', 1035.53, '/uploads/central_kenya_6_2fa16bba9a.jpg', NULL, 'local', NULL, '/', '2024-03-04 07:57:40.868000', '2024-03-04 07:57:40.868000', 1, 1),
(10, 'central-kenya-2.png', NULL, NULL, 1131, 735, '{\"thumbnail\":{\"name\":\"thumbnail_central-kenya-2.png\",\"hash\":\"thumbnail_central_kenya_2_f7dd573db8\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":240,\"height\":156,\"size\":75.03,\"url\":\"/uploads/thumbnail_central_kenya_2_f7dd573db8.png\"},\"small\":{\"name\":\"small_central-kenya-2.png\",\"hash\":\"small_central_kenya_2_f7dd573db8\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":500,\"height\":325,\"size\":321.37,\"url\":\"/uploads/small_central_kenya_2_f7dd573db8.png\"},\"medium\":{\"name\":\"medium_central-kenya-2.png\",\"hash\":\"medium_central_kenya_2_f7dd573db8\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":750,\"height\":487,\"size\":714.19,\"url\":\"/uploads/medium_central_kenya_2_f7dd573db8.png\"},\"large\":{\"name\":\"large_central-kenya-2.png\",\"hash\":\"large_central_kenya_2_f7dd573db8\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":1000,\"height\":650,\"size\":1246.2,\"url\":\"/uploads/large_central_kenya_2_f7dd573db8.png\"}}', 'central_kenya_2_f7dd573db8', '.png', 'image/png', 476.41, '/uploads/central_kenya_2_f7dd573db8.png', NULL, 'local', NULL, '/', '2024-03-04 07:57:40.941000', '2024-03-04 07:57:40.941000', 1, 1),
(11, 'central-kenya-4.jpg', NULL, NULL, 4000, 6000, '{\"thumbnail\":{\"name\":\"thumbnail_central-kenya-4.jpg\",\"hash\":\"thumbnail_central_kenya_4_096765d3aa\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":104,\"height\":156,\"size\":3.84,\"url\":\"/uploads/thumbnail_central_kenya_4_096765d3aa.jpg\"},\"small\":{\"name\":\"small_central-kenya-4.jpg\",\"hash\":\"small_central_kenya_4_096765d3aa\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":333,\"height\":500,\"size\":33.99,\"url\":\"/uploads/small_central_kenya_4_096765d3aa.jpg\"},\"medium\":{\"name\":\"medium_central-kenya-4.jpg\",\"hash\":\"medium_central_kenya_4_096765d3aa\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":750,\"size\":76.25,\"url\":\"/uploads/medium_central_kenya_4_096765d3aa.jpg\"},\"large\":{\"name\":\"large_central-kenya-4.jpg\",\"hash\":\"large_central_kenya_4_096765d3aa\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":667,\"height\":1000,\"size\":134.72,\"url\":\"/uploads/large_central_kenya_4_096765d3aa.jpg\"}}', 'central_kenya_4_096765d3aa', '.jpg', 'image/jpeg', 3824.44, '/uploads/central_kenya_4_096765d3aa.jpg', NULL, 'local', NULL, '/', '2024-03-04 07:57:41.539000', '2024-03-04 07:57:41.539000', 1, 1),
(12, 'central-kenya-3.jpg', NULL, NULL, 6000, 4000, '{\"thumbnail\":{\"name\":\"thumbnail_central-kenya-3.jpg\",\"hash\":\"thumbnail_central_kenya_3_5ff7a842f2\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":234,\"height\":156,\"size\":10.01,\"url\":\"/uploads/thumbnail_central_kenya_3_5ff7a842f2.jpg\"},\"small\":{\"name\":\"small_central-kenya-3.jpg\",\"hash\":\"small_central_kenya_3_5ff7a842f2\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":333,\"size\":39.15,\"url\":\"/uploads/small_central_kenya_3_5ff7a842f2.jpg\"},\"medium\":{\"name\":\"medium_central-kenya-3.jpg\",\"hash\":\"medium_central_kenya_3_5ff7a842f2\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":750,\"height\":500,\"size\":84.3,\"url\":\"/uploads/medium_central_kenya_3_5ff7a842f2.jpg\"},\"large\":{\"name\":\"large_central-kenya-3.jpg\",\"hash\":\"large_central_kenya_3_5ff7a842f2\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":1000,\"height\":667,\"size\":141.23,\"url\":\"/uploads/large_central_kenya_3_5ff7a842f2.jpg\"}}', 'central_kenya_3_5ff7a842f2', '.jpg', 'image/jpeg', 3055.67, '/uploads/central_kenya_3_5ff7a842f2.jpg', NULL, 'local', NULL, '/', '2024-03-04 07:57:41.609000', '2024-03-04 07:57:41.609000', 1, 1),
(13, 'Schengen 2.jpg', NULL, NULL, 1280, 853, '{\"thumbnail\":{\"name\":\"thumbnail_Schengen 2.jpg\",\"hash\":\"thumbnail_Schengen_2_f45dd1ae40\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":234,\"height\":156,\"size\":12.15,\"url\":\"/uploads/thumbnail_Schengen_2_f45dd1ae40.jpg\"},\"small\":{\"name\":\"small_Schengen 2.jpg\",\"hash\":\"small_Schengen_2_f45dd1ae40\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":333,\"size\":50.33,\"url\":\"/uploads/small_Schengen_2_f45dd1ae40.jpg\"},\"medium\":{\"name\":\"medium_Schengen 2.jpg\",\"hash\":\"medium_Schengen_2_f45dd1ae40\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":750,\"height\":500,\"size\":111.19,\"url\":\"/uploads/medium_Schengen_2_f45dd1ae40.jpg\"},\"large\":{\"name\":\"large_Schengen 2.jpg\",\"hash\":\"large_Schengen_2_f45dd1ae40\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":1000,\"height\":666,\"size\":193.1,\"url\":\"/uploads/large_Schengen_2_f45dd1ae40.jpg\"}}', 'Schengen_2_f45dd1ae40', '.jpg', 'image/jpeg', 306.98, '/uploads/Schengen_2_f45dd1ae40.jpg', NULL, 'local', NULL, '/', '2024-03-04 08:04:47.027000', '2024-03-04 08:04:47.027000', 1, 1),
(14, 'Schengen 1.jpg', NULL, NULL, 3456, 2304, '{\"thumbnail\":{\"name\":\"thumbnail_Schengen 1.jpg\",\"hash\":\"thumbnail_Schengen_1_652ecb7d08\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":234,\"height\":156,\"size\":4.8,\"url\":\"/uploads/thumbnail_Schengen_1_652ecb7d08.jpg\"},\"large\":{\"name\":\"large_Schengen 1.jpg\",\"hash\":\"large_Schengen_1_652ecb7d08\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":1000,\"height\":667,\"size\":62.58,\"url\":\"/uploads/large_Schengen_1_652ecb7d08.jpg\"},\"medium\":{\"name\":\"medium_Schengen 1.jpg\",\"hash\":\"medium_Schengen_1_652ecb7d08\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":750,\"height\":500,\"size\":36.87,\"url\":\"/uploads/medium_Schengen_1_652ecb7d08.jpg\"},\"small\":{\"name\":\"small_Schengen 1.jpg\",\"hash\":\"small_Schengen_1_652ecb7d08\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":333,\"size\":17.27,\"url\":\"/uploads/small_Schengen_1_652ecb7d08.jpg\"}}', 'Schengen_1_652ecb7d08', '.jpg', 'image/jpeg', 444.39, '/uploads/Schengen_1_652ecb7d08.jpg', NULL, 'local', NULL, '/', '2024-03-04 08:04:47.085000', '2024-03-04 08:04:47.085000', 1, 1),
(15, 'Schengen 7.jpg', NULL, NULL, 5507, 3671, '{\"thumbnail\":{\"name\":\"thumbnail_Schengen 7.jpg\",\"hash\":\"thumbnail_Schengen_7_6ee1dac486\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":234,\"height\":156,\"size\":9.68,\"url\":\"/uploads/thumbnail_Schengen_7_6ee1dac486.jpg\"},\"large\":{\"name\":\"large_Schengen 7.jpg\",\"hash\":\"large_Schengen_7_6ee1dac486\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":1000,\"height\":666,\"size\":82.47,\"url\":\"/uploads/large_Schengen_7_6ee1dac486.jpg\"},\"medium\":{\"name\":\"medium_Schengen 7.jpg\",\"hash\":\"medium_Schengen_7_6ee1dac486\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":750,\"height\":500,\"size\":53.94,\"url\":\"/uploads/medium_Schengen_7_6ee1dac486.jpg\"},\"small\":{\"name\":\"small_Schengen 7.jpg\",\"hash\":\"small_Schengen_7_6ee1dac486\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":333,\"size\":29.53,\"url\":\"/uploads/small_Schengen_7_6ee1dac486.jpg\"}}', 'Schengen_7_6ee1dac486', '.jpg', 'image/jpeg', 1127.47, '/uploads/Schengen_7_6ee1dac486.jpg', NULL, 'local', NULL, '/', '2024-03-04 08:04:48.736000', '2024-03-04 08:04:48.736000', 1, 1),
(16, 'Schengen 6.jpg', NULL, NULL, 4849, 3875, '{\"thumbnail\":{\"name\":\"thumbnail_Schengen 6.jpg\",\"hash\":\"thumbnail_Schengen_6_dc4e2f4b38\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":195,\"height\":156,\"size\":7.63,\"url\":\"/uploads/thumbnail_Schengen_6_dc4e2f4b38.jpg\"},\"medium\":{\"name\":\"medium_Schengen 6.jpg\",\"hash\":\"medium_Schengen_6_dc4e2f4b38\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":750,\"height\":599,\"size\":56.73,\"url\":\"/uploads/medium_Schengen_6_dc4e2f4b38.jpg\"},\"small\":{\"name\":\"small_Schengen 6.jpg\",\"hash\":\"small_Schengen_6_dc4e2f4b38\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":399,\"size\":29.63,\"url\":\"/uploads/small_Schengen_6_dc4e2f4b38.jpg\"},\"large\":{\"name\":\"large_Schengen 6.jpg\",\"hash\":\"large_Schengen_6_dc4e2f4b38\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":1000,\"height\":799,\"size\":90.78,\"url\":\"/uploads/large_Schengen_6_dc4e2f4b38.jpg\"}}', 'Schengen_6_dc4e2f4b38', '.jpg', 'image/jpeg', 1343.57, '/uploads/Schengen_6_dc4e2f4b38.jpg', NULL, 'local', NULL, '/', '2024-03-04 08:04:49.486000', '2024-03-04 08:04:49.486000', 1, 1),
(17, 'Schengen 3.jpg', NULL, NULL, 6000, 3376, '{\"thumbnail\":{\"name\":\"thumbnail_Schengen 3.jpg\",\"hash\":\"thumbnail_Schengen_3_6a11ea0c70\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":245,\"height\":138,\"size\":8.41,\"url\":\"/uploads/thumbnail_Schengen_3_6a11ea0c70.jpg\"},\"medium\":{\"name\":\"medium_Schengen 3.jpg\",\"hash\":\"medium_Schengen_3_6a11ea0c70\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":750,\"height\":422,\"size\":58.47,\"url\":\"/uploads/medium_Schengen_3_6a11ea0c70.jpg\"},\"small\":{\"name\":\"small_Schengen 3.jpg\",\"hash\":\"small_Schengen_3_6a11ea0c70\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":281,\"size\":28.24,\"url\":\"/uploads/small_Schengen_3_6a11ea0c70.jpg\"},\"large\":{\"name\":\"large_Schengen 3.jpg\",\"hash\":\"large_Schengen_3_6a11ea0c70\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":1000,\"height\":563,\"size\":97.4,\"url\":\"/uploads/large_Schengen_3_6a11ea0c70.jpg\"}}', 'Schengen_3_6a11ea0c70', '.jpg', 'image/jpeg', 1795.66, '/uploads/Schengen_3_6a11ea0c70.jpg', NULL, 'local', NULL, '/', '2024-03-04 08:04:49.998000', '2024-03-04 08:04:49.998000', 1, 1),
(18, 'Schengen 5.jpg', NULL, NULL, 3648, 2736, '{\"thumbnail\":{\"name\":\"thumbnail_Schengen 5.jpg\",\"hash\":\"thumbnail_Schengen_5_14b8e3577f\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":208,\"height\":156,\"size\":11.16,\"url\":\"/uploads/thumbnail_Schengen_5_14b8e3577f.jpg\"},\"large\":{\"name\":\"large_Schengen 5.jpg\",\"hash\":\"large_Schengen_5_14b8e3577f\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":1000,\"height\":750,\"size\":177.69,\"url\":\"/uploads/large_Schengen_5_14b8e3577f.jpg\"},\"medium\":{\"name\":\"medium_Schengen 5.jpg\",\"hash\":\"medium_Schengen_5_14b8e3577f\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":750,\"height\":563,\"size\":108.67,\"url\":\"/uploads/medium_Schengen_5_14b8e3577f.jpg\"},\"small\":{\"name\":\"small_Schengen 5.jpg\",\"hash\":\"small_Schengen_5_14b8e3577f\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":375,\"size\":52.53,\"url\":\"/uploads/small_Schengen_5_14b8e3577f.jpg\"}}', 'Schengen_5_14b8e3577f', '.jpg', 'image/jpeg', 1143.92, '/uploads/Schengen_5_14b8e3577f.jpg', NULL, 'local', NULL, '/', '2024-03-04 08:04:50.072000', '2024-03-04 08:04:50.072000', 1, 1),
(19, 'Schengen 4.jpg', NULL, NULL, 5914, 3932, '{\"thumbnail\":{\"name\":\"thumbnail_Schengen 4.jpg\",\"hash\":\"thumbnail_Schengen_4_3bc3b68aff\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":235,\"height\":156,\"size\":13.73,\"url\":\"/uploads/thumbnail_Schengen_4_3bc3b68aff.jpg\"},\"small\":{\"name\":\"small_Schengen 4.jpg\",\"hash\":\"small_Schengen_4_3bc3b68aff\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":332,\"size\":56.61,\"url\":\"/uploads/small_Schengen_4_3bc3b68aff.jpg\"},\"medium\":{\"name\":\"medium_Schengen 4.jpg\",\"hash\":\"medium_Schengen_4_3bc3b68aff\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":750,\"height\":499,\"size\":125.75,\"url\":\"/uploads/medium_Schengen_4_3bc3b68aff.jpg\"},\"large\":{\"name\":\"large_Schengen 4.jpg\",\"hash\":\"large_Schengen_4_3bc3b68aff\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":1000,\"height\":665,\"size\":215.96,\"url\":\"/uploads/large_Schengen_4_3bc3b68aff.jpg\"}}', 'Schengen_4_3bc3b68aff', '.jpg', 'image/jpeg', 4188.03, '/uploads/Schengen_4_3bc3b68aff.jpg', NULL, 'local', NULL, '/', '2024-03-04 08:04:50.747000', '2024-03-04 08:04:50.747000', 1, 1),
(20, 'North Tanzania 7.jpg', NULL, NULL, 5312, 2988, '{\"thumbnail\":{\"name\":\"thumbnail_North Tanzania 7.jpg\",\"hash\":\"thumbnail_North_Tanzania_7_f7058206de\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":245,\"height\":138,\"size\":8.48,\"url\":\"/uploads/thumbnail_North_Tanzania_7_f7058206de.jpg\"},\"small\":{\"name\":\"small_North Tanzania 7.jpg\",\"hash\":\"small_North_Tanzania_7_f7058206de\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":281,\"size\":30.43,\"url\":\"/uploads/small_North_Tanzania_7_f7058206de.jpg\"},\"large\":{\"name\":\"large_North Tanzania 7.jpg\",\"hash\":\"large_North_Tanzania_7_f7058206de\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":1000,\"height\":563,\"size\":115.02,\"url\":\"/uploads/large_North_Tanzania_7_f7058206de.jpg\"},\"medium\":{\"name\":\"medium_North Tanzania 7.jpg\",\"hash\":\"medium_North_Tanzania_7_f7058206de\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":750,\"height\":422,\"size\":66.51,\"url\":\"/uploads/medium_North_Tanzania_7_f7058206de.jpg\"}}', 'North_Tanzania_7_f7058206de', '.jpg', 'image/jpeg', 1978.21, '/uploads/North_Tanzania_7_f7058206de.jpg', NULL, 'local', NULL, '/', '2024-03-04 08:13:29.785000', '2024-03-04 08:13:29.785000', 1, 1),
(21, 'North Tanzania 1.jpg', NULL, NULL, 5472, 3648, '{\"thumbnail\":{\"name\":\"thumbnail_North Tanzania 1.jpg\",\"hash\":\"thumbnail_North_Tanzania_1_2fa82f4210\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":234,\"height\":156,\"size\":10.24,\"url\":\"/uploads/thumbnail_North_Tanzania_1_2fa82f4210.jpg\"},\"small\":{\"name\":\"small_North Tanzania 1.jpg\",\"hash\":\"small_North_Tanzania_1_2fa82f4210\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":333,\"size\":34.49,\"url\":\"/uploads/small_North_Tanzania_1_2fa82f4210.jpg\"},\"large\":{\"name\":\"large_North Tanzania 1.jpg\",\"hash\":\"large_North_Tanzania_1_2fa82f4210\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":1000,\"height\":667,\"size\":105.55,\"url\":\"/uploads/large_North_Tanzania_1_2fa82f4210.jpg\"},\"medium\":{\"name\":\"medium_North Tanzania 1.jpg\",\"hash\":\"medium_North_Tanzania_1_2fa82f4210\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":750,\"height\":500,\"size\":67.11,\"url\":\"/uploads/medium_North_Tanzania_1_2fa82f4210.jpg\"}}', 'North_Tanzania_1_2fa82f4210', '.jpg', 'image/jpeg', 1881.95, '/uploads/North_Tanzania_1_2fa82f4210.jpg', NULL, 'local', NULL, '/', '2024-03-04 08:13:30.874000', '2024-03-04 08:13:30.874000', 1, 1),
(22, 'North Tanzania 3.jpg', NULL, NULL, 5069, 7097, '{\"thumbnail\":{\"name\":\"thumbnail_North Tanzania 3.jpg\",\"hash\":\"thumbnail_North_Tanzania_3_fa401d1c53\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":111,\"height\":156,\"size\":3.92,\"url\":\"/uploads/thumbnail_North_Tanzania_3_fa401d1c53.jpg\"},\"medium\":{\"name\":\"medium_North Tanzania 3.jpg\",\"hash\":\"medium_North_Tanzania_3_fa401d1c53\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":535,\"height\":750,\"size\":56.69,\"url\":\"/uploads/medium_North_Tanzania_3_fa401d1c53.jpg\"},\"small\":{\"name\":\"small_North Tanzania 3.jpg\",\"hash\":\"small_North_Tanzania_3_fa401d1c53\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":357,\"height\":500,\"size\":29.38,\"url\":\"/uploads/small_North_Tanzania_3_fa401d1c53.jpg\"},\"large\":{\"name\":\"large_North Tanzania 3.jpg\",\"hash\":\"large_North_Tanzania_3_fa401d1c53\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":714,\"height\":1000,\"size\":94.2,\"url\":\"/uploads/large_North_Tanzania_3_fa401d1c53.jpg\"}}', 'North_Tanzania_3_fa401d1c53', '.jpg', 'image/jpeg', 2314.84, '/uploads/North_Tanzania_3_fa401d1c53.jpg', NULL, 'local', NULL, '/', '2024-03-04 08:13:31.414000', '2024-03-04 08:13:31.414000', 1, 1),
(23, 'North Tanzania 4.jpg', NULL, NULL, 5923, 3955, '{\"thumbnail\":{\"name\":\"thumbnail_North Tanzania 4.jpg\",\"hash\":\"thumbnail_North_Tanzania_4_371b425cd7\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":234,\"height\":156,\"size\":10.49,\"url\":\"/uploads/thumbnail_North_Tanzania_4_371b425cd7.jpg\"},\"small\":{\"name\":\"small_North Tanzania 4.jpg\",\"hash\":\"small_North_Tanzania_4_371b425cd7\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":334,\"size\":44.11,\"url\":\"/uploads/small_North_Tanzania_4_371b425cd7.jpg\"},\"medium\":{\"name\":\"medium_North Tanzania 4.jpg\",\"hash\":\"medium_North_Tanzania_4_371b425cd7\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":750,\"height\":501,\"size\":96.63,\"url\":\"/uploads/medium_North_Tanzania_4_371b425cd7.jpg\"},\"large\":{\"name\":\"large_North Tanzania 4.jpg\",\"hash\":\"large_North_Tanzania_4_371b425cd7\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":1000,\"height\":668,\"size\":162.43,\"url\":\"/uploads/large_North_Tanzania_4_371b425cd7.jpg\"}}', 'North_Tanzania_4_371b425cd7', '.jpg', 'image/jpeg', 2727.58, '/uploads/North_Tanzania_4_371b425cd7.jpg', NULL, 'local', NULL, '/', '2024-03-04 08:13:31.806000', '2024-03-04 08:13:31.806000', 1, 1),
(24, 'North Tanzania 6.jpg', NULL, NULL, 6393, 4262, '{\"thumbnail\":{\"name\":\"thumbnail_North Tanzania 6.jpg\",\"hash\":\"thumbnail_North_Tanzania_6_0691fd8068\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":234,\"height\":156,\"size\":6.32,\"url\":\"/uploads/thumbnail_North_Tanzania_6_0691fd8068.jpg\"},\"medium\":{\"name\":\"medium_North Tanzania 6.jpg\",\"hash\":\"medium_North_Tanzania_6_0691fd8068\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":750,\"height\":500,\"size\":51.13,\"url\":\"/uploads/medium_North_Tanzania_6_0691fd8068.jpg\"},\"small\":{\"name\":\"small_North Tanzania 6.jpg\",\"hash\":\"small_North_Tanzania_6_0691fd8068\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":333,\"size\":23.51,\"url\":\"/uploads/small_North_Tanzania_6_0691fd8068.jpg\"},\"large\":{\"name\":\"large_North Tanzania 6.jpg\",\"hash\":\"large_North_Tanzania_6_0691fd8068\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":1000,\"height\":666,\"size\":89.78,\"url\":\"/uploads/large_North_Tanzania_6_0691fd8068.jpg\"}}', 'North_Tanzania_6_0691fd8068', '.jpg', 'image/jpeg', 3016.95, '/uploads/North_Tanzania_6_0691fd8068.jpg', NULL, 'local', NULL, '/', '2024-03-04 08:13:32.067000', '2024-03-04 08:13:32.067000', 1, 1),
(25, 'North Tanzania 2.jpg', NULL, NULL, 6016, 4012, '{\"thumbnail\":{\"name\":\"thumbnail_North Tanzania 2.jpg\",\"hash\":\"thumbnail_North_Tanzania_2_77efb2bf8f\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":234,\"height\":156,\"size\":7.84,\"url\":\"/uploads/thumbnail_North_Tanzania_2_77efb2bf8f.jpg\"},\"medium\":{\"name\":\"medium_North Tanzania 2.jpg\",\"hash\":\"medium_North_Tanzania_2_77efb2bf8f\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":750,\"height\":500,\"size\":63.08,\"url\":\"/uploads/medium_North_Tanzania_2_77efb2bf8f.jpg\"},\"small\":{\"name\":\"small_North Tanzania 2.jpg\",\"hash\":\"small_North_Tanzania_2_77efb2bf8f\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":333,\"size\":29.42,\"url\":\"/uploads/small_North_Tanzania_2_77efb2bf8f.jpg\"},\"large\":{\"name\":\"large_North Tanzania 2.jpg\",\"hash\":\"large_North_Tanzania_2_77efb2bf8f\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":1000,\"height\":667,\"size\":106.82,\"url\":\"/uploads/large_North_Tanzania_2_77efb2bf8f.jpg\"}}', 'North_Tanzania_2_77efb2bf8f', '.jpg', 'image/jpeg', 3523.26, '/uploads/North_Tanzania_2_77efb2bf8f.jpg', NULL, 'local', NULL, '/', '2024-03-04 08:13:32.759000', '2024-03-04 08:13:32.759000', 1, 1),
(26, 'North Tanzania 5.jpg', NULL, NULL, 4272, 2848, '{\"thumbnail\":{\"name\":\"thumbnail_North Tanzania 5.jpg\",\"hash\":\"thumbnail_North_Tanzania_5_02314dfac6\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":234,\"height\":156,\"size\":7.68,\"url\":\"/uploads/thumbnail_North_Tanzania_5_02314dfac6.jpg\"},\"small\":{\"name\":\"small_North Tanzania 5.jpg\",\"hash\":\"small_North_Tanzania_5_02314dfac6\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":333,\"size\":28.17,\"url\":\"/uploads/small_North_Tanzania_5_02314dfac6.jpg\"},\"medium\":{\"name\":\"medium_North Tanzania 5.jpg\",\"hash\":\"medium_North_Tanzania_5_02314dfac6\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":750,\"height\":500,\"size\":56.63,\"url\":\"/uploads/medium_North_Tanzania_5_02314dfac6.jpg\"},\"large\":{\"name\":\"large_North Tanzania 5.jpg\",\"hash\":\"large_North_Tanzania_5_02314dfac6\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":1000,\"height\":667,\"size\":95.36,\"url\":\"/uploads/large_North_Tanzania_5_02314dfac6.jpg\"}}', 'North_Tanzania_5_02314dfac6', '.jpg', 'image/jpeg', 1109.92, '/uploads/North_Tanzania_5_02314dfac6.jpg', NULL, 'local', NULL, '/', '2024-03-04 08:13:32.831000', '2024-03-04 08:13:32.831000', 1, 1),
(27, 'Cape Town 4.jpg', NULL, NULL, 4110, 2287, '{\"thumbnail\":{\"name\":\"thumbnail_Cape Town 4.jpg\",\"hash\":\"thumbnail_Cape_Town_4_207fe54125\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":245,\"height\":136,\"size\":9.65,\"url\":\"/uploads/thumbnail_Cape_Town_4_207fe54125.jpg\"},\"small\":{\"name\":\"small_Cape Town 4.jpg\",\"hash\":\"small_Cape_Town_4_207fe54125\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":278,\"size\":34.95,\"url\":\"/uploads/small_Cape_Town_4_207fe54125.jpg\"},\"large\":{\"name\":\"large_Cape Town 4.jpg\",\"hash\":\"large_Cape_Town_4_207fe54125\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":1000,\"height\":556,\"size\":124.93,\"url\":\"/uploads/large_Cape_Town_4_207fe54125.jpg\"},\"medium\":{\"name\":\"medium_Cape Town 4.jpg\",\"hash\":\"medium_Cape_Town_4_207fe54125\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":750,\"height\":417,\"size\":72.06,\"url\":\"/uploads/medium_Cape_Town_4_207fe54125.jpg\"}}', 'Cape_Town_4_207fe54125', '.jpg', 'image/jpeg', 1093.31, '/uploads/Cape_Town_4_207fe54125.jpg', NULL, 'local', NULL, '/', '2024-03-04 08:17:34.161000', '2024-03-04 08:17:34.161000', 1, 1),
(28, 'Cape Town 6.jpg', NULL, NULL, 3899, 2455, '{\"thumbnail\":{\"name\":\"thumbnail_Cape Town 6.jpg\",\"hash\":\"thumbnail_Cape_Town_6_623e0dbdd1\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":245,\"height\":154,\"size\":10.28,\"url\":\"/uploads/thumbnail_Cape_Town_6_623e0dbdd1.jpg\"},\"small\":{\"name\":\"small_Cape Town 6.jpg\",\"hash\":\"small_Cape_Town_6_623e0dbdd1\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":315,\"size\":36.08,\"url\":\"/uploads/small_Cape_Town_6_623e0dbdd1.jpg\"},\"large\":{\"name\":\"large_Cape Town 6.jpg\",\"hash\":\"large_Cape_Town_6_623e0dbdd1\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":1000,\"height\":630,\"size\":125.42,\"url\":\"/uploads/large_Cape_Town_6_623e0dbdd1.jpg\"},\"medium\":{\"name\":\"medium_Cape Town 6.jpg\",\"hash\":\"medium_Cape_Town_6_623e0dbdd1\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":750,\"height\":472,\"size\":72.58,\"url\":\"/uploads/medium_Cape_Town_6_623e0dbdd1.jpg\"}}', 'Cape_Town_6_623e0dbdd1', '.jpg', 'image/jpeg', 1033.26, '/uploads/Cape_Town_6_623e0dbdd1.jpg', NULL, 'local', NULL, '/', '2024-03-04 08:17:35.364000', '2024-03-04 08:17:35.364000', 1, 1),
(29, 'Cape Town 2.jpg', NULL, NULL, 5240, 3912, '{\"thumbnail\":{\"name\":\"thumbnail_Cape Town 2.jpg\",\"hash\":\"thumbnail_Cape_Town_2_900177f03a\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":209,\"height\":156,\"size\":10.26,\"url\":\"/uploads/thumbnail_Cape_Town_2_900177f03a.jpg\"},\"small\":{\"name\":\"small_Cape Town 2.jpg\",\"hash\":\"small_Cape_Town_2_900177f03a\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":373,\"size\":44.19,\"url\":\"/uploads/small_Cape_Town_2_900177f03a.jpg\"},\"medium\":{\"name\":\"medium_Cape Town 2.jpg\",\"hash\":\"medium_Cape_Town_2_900177f03a\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":750,\"height\":560,\"size\":89.35,\"url\":\"/uploads/medium_Cape_Town_2_900177f03a.jpg\"},\"large\":{\"name\":\"large_Cape Town 2.jpg\",\"hash\":\"large_Cape_Town_2_900177f03a\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":1000,\"height\":747,\"size\":145.29,\"url\":\"/uploads/large_Cape_Town_2_900177f03a.jpg\"}}', 'Cape_Town_2_900177f03a', '.jpg', 'image/jpeg', 1919.99, '/uploads/Cape_Town_2_900177f03a.jpg', NULL, 'local', NULL, '/', '2024-03-04 08:17:36.327000', '2024-03-04 08:17:36.327000', 1, 1),
(30, 'Cape Town 1.jpg', NULL, NULL, 3623, 5434, '{\"thumbnail\":{\"name\":\"thumbnail_Cape Town 1.jpg\",\"hash\":\"thumbnail_Cape_Town_1_d00299def0\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":104,\"height\":156,\"size\":3.7,\"url\":\"/uploads/thumbnail_Cape_Town_1_d00299def0.jpg\"},\"medium\":{\"name\":\"medium_Cape Town 1.jpg\",\"hash\":\"medium_Cape_Town_1_d00299def0\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":750,\"size\":61.98,\"url\":\"/uploads/medium_Cape_Town_1_d00299def0.jpg\"},\"small\":{\"name\":\"small_Cape Town 1.jpg\",\"hash\":\"small_Cape_Town_1_d00299def0\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":333,\"height\":500,\"size\":28.72,\"url\":\"/uploads/small_Cape_Town_1_d00299def0.jpg\"},\"large\":{\"name\":\"large_Cape Town 1.jpg\",\"hash\":\"large_Cape_Town_1_d00299def0\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":666,\"height\":1000,\"size\":105.48,\"url\":\"/uploads/large_Cape_Town_1_d00299def0.jpg\"}}', 'Cape_Town_1_d00299def0', '.jpg', 'image/jpeg', 2031.32, '/uploads/Cape_Town_1_d00299def0.jpg', NULL, 'local', NULL, '/', '2024-03-04 08:17:36.827000', '2024-03-04 08:17:36.827000', 1, 1),
(31, 'Cape Town 5.jpg', NULL, NULL, 4000, 5000, '{\"thumbnail\":{\"name\":\"thumbnail_Cape Town 5.jpg\",\"hash\":\"thumbnail_Cape_Town_5_6c4c40f6c1\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":125,\"height\":156,\"size\":5.44,\"url\":\"/uploads/thumbnail_Cape_Town_5_6c4c40f6c1.jpg\"},\"small\":{\"name\":\"small_Cape Town 5.jpg\",\"hash\":\"small_Cape_Town_5_6c4c40f6c1\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":400,\"height\":500,\"size\":42.01,\"url\":\"/uploads/small_Cape_Town_5_6c4c40f6c1.jpg\"},\"medium\":{\"name\":\"medium_Cape Town 5.jpg\",\"hash\":\"medium_Cape_Town_5_6c4c40f6c1\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":600,\"height\":750,\"size\":88.39,\"url\":\"/uploads/medium_Cape_Town_5_6c4c40f6c1.jpg\"},\"large\":{\"name\":\"large_Cape Town 5.jpg\",\"hash\":\"large_Cape_Town_5_6c4c40f6c1\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":800,\"height\":1000,\"size\":145.62,\"url\":\"/uploads/large_Cape_Town_5_6c4c40f6c1.jpg\"}}', 'Cape_Town_5_6c4c40f6c1', '.jpg', 'image/jpeg', 2246.61, '/uploads/Cape_Town_5_6c4c40f6c1.jpg', NULL, 'local', NULL, '/', '2024-03-04 08:17:37.041000', '2024-03-04 08:17:37.041000', 1, 1),
(32, 'Cape Town 3.jpg', NULL, NULL, 4777, 3185, '{\"thumbnail\":{\"name\":\"thumbnail_Cape Town 3.jpg\",\"hash\":\"thumbnail_Cape_Town_3_bd405e7fdd\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":234,\"height\":156,\"size\":11.52,\"url\":\"/uploads/thumbnail_Cape_Town_3_bd405e7fdd.jpg\"},\"small\":{\"name\":\"small_Cape Town 3.jpg\",\"hash\":\"small_Cape_Town_3_bd405e7fdd\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":333,\"size\":44.12,\"url\":\"/uploads/small_Cape_Town_3_bd405e7fdd.jpg\"},\"medium\":{\"name\":\"medium_Cape Town 3.jpg\",\"hash\":\"medium_Cape_Town_3_bd405e7fdd\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":750,\"height\":500,\"size\":96.18,\"url\":\"/uploads/medium_Cape_Town_3_bd405e7fdd.jpg\"},\"large\":{\"name\":\"large_Cape Town 3.jpg\",\"hash\":\"large_Cape_Town_3_bd405e7fdd\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":1000,\"height\":667,\"size\":167.41,\"url\":\"/uploads/large_Cape_Town_3_bd405e7fdd.jpg\"}}', 'Cape_Town_3_bd405e7fdd', '.jpg', 'image/jpeg', 2456.75, '/uploads/Cape_Town_3_bd405e7fdd.jpg', NULL, 'local', NULL, '/', '2024-03-04 08:17:37.672000', '2024-03-05 00:17:05.432000', 1, 1),
(33, 'Dubai 7.jpg', NULL, NULL, 2832, 2832, '{\"thumbnail\":{\"name\":\"thumbnail_Dubai 7.jpg\",\"hash\":\"thumbnail_Dubai_7_0bf3638dbe\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":156,\"height\":156,\"size\":4.66,\"url\":\"/uploads/thumbnail_Dubai_7_0bf3638dbe.jpg\"},\"medium\":{\"name\":\"medium_Dubai 7.jpg\",\"hash\":\"medium_Dubai_7_0bf3638dbe\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":750,\"height\":750,\"size\":50.48,\"url\":\"/uploads/medium_Dubai_7_0bf3638dbe.jpg\"},\"small\":{\"name\":\"small_Dubai 7.jpg\",\"hash\":\"small_Dubai_7_0bf3638dbe\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":500,\"size\":27.18,\"url\":\"/uploads/small_Dubai_7_0bf3638dbe.jpg\"},\"large\":{\"name\":\"large_Dubai 7.jpg\",\"hash\":\"large_Dubai_7_0bf3638dbe\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":1000,\"height\":1000,\"size\":78.35,\"url\":\"/uploads/large_Dubai_7_0bf3638dbe.jpg\"}}', 'Dubai_7_0bf3638dbe', '.jpg', 'image/jpeg', 390.65, '/uploads/Dubai_7_0bf3638dbe.jpg', NULL, 'local', NULL, '/', '2024-03-04 08:20:25.764000', '2024-03-04 08:20:25.764000', 1, 1),
(34, 'Dubai 5.jpg', NULL, NULL, 4623, 2606, '{\"thumbnail\":{\"name\":\"thumbnail_Dubai 5.jpg\",\"hash\":\"thumbnail_Dubai_5_d73825be6c\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":245,\"height\":138,\"size\":4.6,\"url\":\"/uploads/thumbnail_Dubai_5_d73825be6c.jpg\"},\"large\":{\"name\":\"large_Dubai 5.jpg\",\"hash\":\"large_Dubai_5_d73825be6c\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":1000,\"height\":564,\"size\":50.55,\"url\":\"/uploads/large_Dubai_5_d73825be6c.jpg\"},\"medium\":{\"name\":\"medium_Dubai 5.jpg\",\"hash\":\"medium_Dubai_5_d73825be6c\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":750,\"height\":423,\"size\":30.44,\"url\":\"/uploads/medium_Dubai_5_d73825be6c.jpg\"},\"small\":{\"name\":\"small_Dubai 5.jpg\",\"hash\":\"small_Dubai_5_d73825be6c\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":282,\"size\":14.85,\"url\":\"/uploads/small_Dubai_5_d73825be6c.jpg\"}}', 'Dubai_5_d73825be6c', '.jpg', 'image/jpeg', 464.80, '/uploads/Dubai_5_d73825be6c.jpg', NULL, 'local', NULL, '/', '2024-03-04 08:20:26.251000', '2024-03-04 08:20:26.251000', 1, 1),
(35, 'Dubai 4.jpg', NULL, NULL, 4032, 3024, '{\"thumbnail\":{\"name\":\"thumbnail_Dubai 4.jpg\",\"hash\":\"thumbnail_Dubai_4_8822b5458a\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":208,\"height\":156,\"size\":11.47,\"url\":\"/uploads/thumbnail_Dubai_4_8822b5458a.jpg\"},\"small\":{\"name\":\"small_Dubai 4.jpg\",\"hash\":\"small_Dubai_4_8822b5458a\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":375,\"size\":59.38,\"url\":\"/uploads/small_Dubai_4_8822b5458a.jpg\"},\"medium\":{\"name\":\"medium_Dubai 4.jpg\",\"hash\":\"medium_Dubai_4_8822b5458a\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":750,\"height\":563,\"size\":122.7,\"url\":\"/uploads/medium_Dubai_4_8822b5458a.jpg\"},\"large\":{\"name\":\"large_Dubai 4.jpg\",\"hash\":\"large_Dubai_4_8822b5458a\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":1000,\"height\":750,\"size\":206.64,\"url\":\"/uploads/large_Dubai_4_8822b5458a.jpg\"}}', 'Dubai_4_8822b5458a', '.jpg', 'image/jpeg', 1769.97, '/uploads/Dubai_4_8822b5458a.jpg', NULL, 'local', NULL, '/', '2024-03-04 08:20:26.770000', '2024-03-04 08:20:26.770000', 1, 1),
(36, 'Dubai 3.jpg', NULL, NULL, 5760, 3840, '{\"thumbnail\":{\"name\":\"thumbnail_Dubai 3.jpg\",\"hash\":\"thumbnail_Dubai_3_8d704667b8\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":234,\"height\":156,\"size\":5.37,\"url\":\"/uploads/thumbnail_Dubai_3_8d704667b8.jpg\"},\"medium\":{\"name\":\"medium_Dubai 3.jpg\",\"hash\":\"medium_Dubai_3_8d704667b8\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":750,\"height\":500,\"size\":42.35,\"url\":\"/uploads/medium_Dubai_3_8d704667b8.jpg\"},\"small\":{\"name\":\"small_Dubai 3.jpg\",\"hash\":\"small_Dubai_3_8d704667b8\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":333,\"size\":19.39,\"url\":\"/uploads/small_Dubai_3_8d704667b8.jpg\"},\"large\":{\"name\":\"large_Dubai 3.jpg\",\"hash\":\"large_Dubai_3_8d704667b8\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":1000,\"height\":667,\"size\":73.13,\"url\":\"/uploads/large_Dubai_3_8d704667b8.jpg\"}}', 'Dubai_3_8d704667b8', '.jpg', 'image/jpeg', 1407.95, '/uploads/Dubai_3_8d704667b8.jpg', NULL, 'local', NULL, '/', '2024-03-04 08:20:27.965000', '2024-03-04 08:20:27.965000', 1, 1),
(37, 'Dubai 2.jpg', NULL, NULL, 6000, 4000, '{\"thumbnail\":{\"name\":\"thumbnail_Dubai 2.jpg\",\"hash\":\"thumbnail_Dubai_2_125a3d56ec\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":234,\"height\":156,\"size\":6.75,\"url\":\"/uploads/thumbnail_Dubai_2_125a3d56ec.jpg\"},\"medium\":{\"name\":\"medium_Dubai 2.jpg\",\"hash\":\"medium_Dubai_2_125a3d56ec\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":750,\"height\":500,\"size\":46.54,\"url\":\"/uploads/medium_Dubai_2_125a3d56ec.jpg\"},\"small\":{\"name\":\"small_Dubai 2.jpg\",\"hash\":\"small_Dubai_2_125a3d56ec\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":333,\"size\":23.04,\"url\":\"/uploads/small_Dubai_2_125a3d56ec.jpg\"},\"large\":{\"name\":\"large_Dubai 2.jpg\",\"hash\":\"large_Dubai_2_125a3d56ec\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":1000,\"height\":667,\"size\":77,\"url\":\"/uploads/large_Dubai_2_125a3d56ec.jpg\"}}', 'Dubai_2_125a3d56ec', '.jpg', 'image/jpeg', 2670.74, '/uploads/Dubai_2_125a3d56ec.jpg', NULL, 'local', NULL, '/', '2024-03-04 08:20:29.444000', '2024-03-04 08:20:29.444000', 1, 1),
(38, 'Dubai 1.jpg', NULL, NULL, 5412, 3608, '{\"thumbnail\":{\"name\":\"thumbnail_Dubai 1.jpg\",\"hash\":\"thumbnail_Dubai_1_d4d5a793a4\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":234,\"height\":156,\"size\":9.48,\"url\":\"/uploads/thumbnail_Dubai_1_d4d5a793a4.jpg\"},\"small\":{\"name\":\"small_Dubai 1.jpg\",\"hash\":\"small_Dubai_1_d4d5a793a4\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":334,\"size\":38.13,\"url\":\"/uploads/small_Dubai_1_d4d5a793a4.jpg\"},\"medium\":{\"name\":\"medium_Dubai 1.jpg\",\"hash\":\"medium_Dubai_1_d4d5a793a4\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":750,\"height\":500,\"size\":81.68,\"url\":\"/uploads/medium_Dubai_1_d4d5a793a4.jpg\"},\"large\":{\"name\":\"large_Dubai 1.jpg\",\"hash\":\"large_Dubai_1_d4d5a793a4\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":1000,\"height\":667,\"size\":137.08,\"url\":\"/uploads/large_Dubai_1_d4d5a793a4.jpg\"}}', 'Dubai_1_d4d5a793a4', '.jpg', 'image/jpeg', 2185.30, '/uploads/Dubai_1_d4d5a793a4.jpg', NULL, 'local', NULL, '/', '2024-03-04 08:20:29.660000', '2024-03-04 08:20:29.660000', 1, 1),
(39, 'Dubai 6.jpg', NULL, NULL, 5380, 8070, '{\"thumbnail\":{\"name\":\"thumbnail_Dubai 6.jpg\",\"hash\":\"thumbnail_Dubai_6_6bf8bf16cf\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":104,\"height\":156,\"size\":1.59,\"url\":\"/uploads/thumbnail_Dubai_6_6bf8bf16cf.jpg\"},\"large\":{\"name\":\"large_Dubai 6.jpg\",\"hash\":\"large_Dubai_6_6bf8bf16cf\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":667,\"height\":1000,\"size\":39.69,\"url\":\"/uploads/large_Dubai_6_6bf8bf16cf.jpg\"},\"medium\":{\"name\":\"medium_Dubai 6.jpg\",\"hash\":\"medium_Dubai_6_6bf8bf16cf\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":750,\"size\":22.34,\"url\":\"/uploads/medium_Dubai_6_6bf8bf16cf.jpg\"},\"small\":{\"name\":\"small_Dubai 6.jpg\",\"hash\":\"small_Dubai_6_6bf8bf16cf\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":333,\"height\":500,\"size\":10.67,\"url\":\"/uploads/small_Dubai_6_6bf8bf16cf.jpg\"}}', 'Dubai_6_6bf8bf16cf', '.jpg', 'image/jpeg', 3156.14, '/uploads/Dubai_6_6bf8bf16cf.jpg', NULL, 'local', NULL, '/', '2024-03-04 08:20:30.346000', '2024-03-04 08:20:30.346000', 1, 1),
(40, 'janetravels.jpg', NULL, NULL, 3840, 5760, '{\"thumbnail\":{\"name\":\"thumbnail_janetravels.jpg\",\"hash\":\"thumbnail_janetravels_7b4851268d\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":104,\"height\":156,\"size\":3.45,\"url\":\"/uploads/thumbnail_janetravels_7b4851268d.jpg\"}}', 'janetravels_7b4851268d', '.jpg', 'image/jpeg', 1768.14, '/uploads/janetravels_7b4851268d.jpg', NULL, 'local', NULL, '/1', '2024-03-06 11:20:48.510000', '2024-03-06 11:20:48.510000', 1, 1),
(41, 'johndoe.jpg', NULL, NULL, 4233, 6349, '{\"thumbnail\":{\"name\":\"thumbnail_johndoe.jpg\",\"hash\":\"thumbnail_johndoe_946c924b28\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":104,\"height\":156,\"size\":4.6,\"url\":\"/uploads/thumbnail_johndoe_946c924b28.jpg\"}}', 'johndoe_946c924b28', '.jpg', 'image/jpeg', 3039.70, '/uploads/johndoe_946c924b28.jpg', NULL, 'local', NULL, '/1', '2024-03-06 11:36:27.291000', '2024-03-06 11:37:24.937000', 1, 1);
INSERT INTO `files` (`id`, `name`, `alternative_text`, `caption`, `width`, `height`, `formats`, `hash`, `ext`, `mime`, `size`, `url`, `preview_url`, `provider`, `provider_metadata`, `folder_path`, `created_at`, `updated_at`, `created_by_id`, `updated_by_id`) VALUES
(42, 'alexdoe.jpg', NULL, NULL, 3651, 5477, '{\"thumbnail\":{\"name\":\"thumbnail_alexdoe.jpg\",\"hash\":\"thumbnail_alexdoe_9b57017615\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":104,\"height\":156,\"size\":3.17,\"url\":\"/uploads/thumbnail_alexdoe_9b57017615.jpg\"}}', 'alexdoe_9b57017615', '.jpg', 'image/jpeg', 1882.07, '/uploads/alexdoe_9b57017615.jpg', NULL, 'local', NULL, '/1', '2024-03-06 11:36:27.511000', '2024-03-08 14:02:41.236000', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `files_folder_links`
--

CREATE TABLE `files_folder_links` (
  `id` int(10) UNSIGNED NOT NULL,
  `file_id` int(10) UNSIGNED DEFAULT NULL,
  `folder_id` int(10) UNSIGNED DEFAULT NULL,
  `file_order` double UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `files_folder_links`
--

INSERT INTO `files_folder_links` (`id`, `file_id`, `folder_id`, `file_order`) VALUES
(1, 40, 1, 1),
(2, 41, 1, 2),
(3, 42, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `files_related_morphs`
--

CREATE TABLE `files_related_morphs` (
  `id` int(10) UNSIGNED NOT NULL,
  `file_id` int(10) UNSIGNED DEFAULT NULL,
  `related_id` int(10) UNSIGNED DEFAULT NULL,
  `related_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `files_related_morphs`
--

INSERT INTO `files_related_morphs` (`id`, `file_id`, `related_id`, `related_type`, `field`, `order`) VALUES
(40, 27, 5, 'api::tour.tour', 'media', 1),
(41, 28, 5, 'api::tour.tour', 'media', 2),
(42, 29, 5, 'api::tour.tour', 'media', 3),
(43, 30, 5, 'api::tour.tour', 'media', 4),
(44, 31, 5, 'api::tour.tour', 'media', 5),
(45, 32, 5, 'api::tour.tour', 'media', 6),
(46, 30, 5, 'api::tour.tour', 'display_picture', 1),
(47, 33, 6, 'api::tour.tour', 'media', 1),
(48, 34, 6, 'api::tour.tour', 'media', 2),
(49, 35, 6, 'api::tour.tour', 'media', 3),
(50, 36, 6, 'api::tour.tour', 'media', 4),
(51, 37, 6, 'api::tour.tour', 'media', 5),
(52, 38, 6, 'api::tour.tour', 'media', 6),
(53, 39, 6, 'api::tour.tour', 'media', 7),
(54, 38, 6, 'api::tour.tour', 'display_picture', 1),
(55, 20, 4, 'api::tour.tour', 'media', 1),
(56, 21, 4, 'api::tour.tour', 'media', 2),
(57, 22, 4, 'api::tour.tour', 'media', 3),
(58, 23, 4, 'api::tour.tour', 'media', 4),
(59, 24, 4, 'api::tour.tour', 'media', 5),
(60, 25, 4, 'api::tour.tour', 'media', 6),
(61, 26, 4, 'api::tour.tour', 'media', 7),
(62, 25, 4, 'api::tour.tour', 'display_picture', 1),
(85, 40, 2, 'plugin::users-permissions.user', 'display_picture', 1),
(86, 41, 4, 'plugin::users-permissions.user', 'display_picture', 1),
(87, 42, 3, 'plugin::users-permissions.user', 'display_picture', 1),
(88, 41, 1, 'plugin::users-permissions.user', 'display_picture', 1),
(89, 4, 1, 'api::tour.tour', 'media', 1),
(90, 5, 1, 'api::tour.tour', 'media', 2),
(91, 6, 1, 'api::tour.tour', 'media', 3),
(92, 3, 1, 'api::tour.tour', 'media', 4),
(93, 1, 1, 'api::tour.tour', 'media', 5),
(94, 2, 1, 'api::tour.tour', 'media', 6),
(95, 2, 1, 'api::tour.tour', 'display_picture', 1),
(96, 7, 2, 'api::tour.tour', 'media', 1),
(97, 8, 2, 'api::tour.tour', 'media', 2),
(98, 9, 2, 'api::tour.tour', 'media', 3),
(99, 10, 2, 'api::tour.tour', 'media', 4),
(100, 11, 2, 'api::tour.tour', 'media', 5),
(101, 12, 2, 'api::tour.tour', 'media', 6),
(102, 8, 2, 'api::tour.tour', 'display_picture', 1),
(103, 13, 3, 'api::tour.tour', 'media', 1),
(104, 14, 3, 'api::tour.tour', 'media', 2),
(105, 15, 3, 'api::tour.tour', 'media', 3),
(106, 16, 3, 'api::tour.tour', 'media', 4),
(107, 18, 3, 'api::tour.tour', 'media', 5),
(108, 17, 3, 'api::tour.tour', 'media', 6),
(109, 19, 3, 'api::tour.tour', 'media', 7),
(110, 17, 3, 'api::tour.tour', 'display_picture', 1),
(111, 42, 4, 'plugin::users-permissions.user', 'dp', 1),
(112, 41, 1, 'plugin::users-permissions.user', 'dp', 1),
(113, 40, 2, 'plugin::users-permissions.user', 'dp', 1),
(114, 41, 3, 'plugin::users-permissions.user', 'dp', 1);

-- --------------------------------------------------------

--
-- Table structure for table `i18n_locale`
--

CREATE TABLE `i18n_locale` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_by_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `i18n_locale`
--

INSERT INTO `i18n_locale` (`id`, `name`, `code`, `created_at`, `updated_at`, `created_by_id`, `updated_by_id`) VALUES
(1, 'English (en)', 'en', '2024-03-01 20:19:26.760000', '2024-03-01 20:19:26.760000', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `queries`
--

CREATE TABLE `queries` (
  `id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_by_id` int(10) UNSIGNED DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `queries`
--

INSERT INTO `queries` (`id`, `full_name`, `subject`, `message`, `created_at`, `updated_at`, `created_by_id`, `updated_by_id`, `email`) VALUES
(1, '', '87jh7', 'k 98j8t 79yg 6f9797t', '2024-04-25 16:45:48.657000', '2024-04-25 16:45:48.657000', NULL, NULL, 'vizionbnm@gmail.com'),
(2, 'Jotham Oyior', 'tehg ', 'ryju r6ium46u, =59ok7h7 0', '2024-04-25 16:50:11.849000', '2024-04-25 16:50:11.849000', NULL, NULL, 'jothamoj@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(10) UNSIGNED NOT NULL,
  `rating` int(11) DEFAULT NULL,
  `body` longtext DEFAULT NULL,
  `tourid` bigint(20) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_by_id` int(10) UNSIGNED DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `rating`, `body`, `tourid`, `first_name`, `surname`, `created_at`, `updated_at`, `created_by_id`, `updated_by_id`, `username`) VALUES
(1, 5, 'It was an amazing experience. Would definetely like to do it again', 1, 'Jotham', 'Oyiro', '2024-03-24 18:16:32.049000', '2024-03-24 18:18:09.117000', 1, 1, 'jami.travel'),
(2, 5, 'I have never had that much fun before on holiday.I would definitely recommend', 2, 'Jane', 'Doe', '2024-03-24 18:17:30.796000', '2024-03-24 18:18:01.945000', 1, 1, 'jane.travels'),
(3, 4, 'Would Love to do it again', 1, 'Alex', 'Doe', '2024-03-24 20:49:19.878000', '2024-03-24 20:49:19.878000', 1, 1, 'alex.doe'),
(12, 4, 'wow amazing', 6, 'Jotham', 'Jami', '2024-03-26 13:03:21.383000', '2024-03-26 13:03:21.383000', NULL, NULL, 'jami.travel'),
(13, 4, 'amazing', 2, 'Jotham', 'Jami', '2024-03-26 13:07:04.013000', '2024-03-26 13:07:04.013000', NULL, NULL, 'jami.travel'),
(14, 4, 'Wat an amazing experience. will definetely redo', 4, 'Jotham', 'Jami', '2024-03-27 14:17:28.294000', '2024-03-27 14:17:28.294000', NULL, NULL, 'jami.travel'),
(15, 4, 'amamzing', 5, 'Jotham', 'Jami', '2024-03-27 15:43:12.843000', '2024-03-27 15:43:12.843000', NULL, NULL, 'jami.travel');

-- --------------------------------------------------------

--
-- Table structure for table `strapi_api_tokens`
--

CREATE TABLE `strapi_api_tokens` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `access_key` varchar(255) DEFAULT NULL,
  `last_used_at` datetime(6) DEFAULT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `lifespan` bigint(20) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_by_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `strapi_api_tokens`
--

INSERT INTO `strapi_api_tokens` (`id`, `name`, `description`, `type`, `access_key`, `last_used_at`, `expires_at`, `lifespan`, `created_at`, `updated_at`, `created_by_id`, `updated_by_id`) VALUES
(1, 'myApi', '', 'custom', '90c42df93f1956c41d22947cf3b133aa548938482be453a4eacd30274d11871c4d75e01e387d66f89b6c2bff7a66416846be55161595b905a8710fe9bfab7647', NULL, NULL, NULL, '2024-03-05 10:52:35.883000', '2024-03-18 13:06:11.067000', NULL, NULL),
(2, 'main', '', 'full-access', '7689205ca3aa19b4feed76e15acb448f9a7f15dabf14579e0fcecccb3d3626744debdd011a639a22c8ff4fd1dac566db51e81ea2effcc4c86b5ad4d76e877f26', NULL, NULL, NULL, '2024-03-15 02:14:48.398000', '2024-03-15 02:14:48.398000', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `strapi_api_token_permissions`
--

CREATE TABLE `strapi_api_token_permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `action` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_by_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `strapi_api_token_permissions`
--

INSERT INTO `strapi_api_token_permissions` (`id`, `action`, `created_at`, `updated_at`, `created_by_id`, `updated_by_id`) VALUES
(4, 'api::tour.tour.find', '2024-03-05 10:52:35.899000', '2024-03-05 10:52:35.899000', NULL, NULL),
(6, 'api::tour.tour.findOne', '2024-03-05 10:52:35.899000', '2024-03-05 10:52:35.899000', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `strapi_api_token_permissions_token_links`
--

CREATE TABLE `strapi_api_token_permissions_token_links` (
  `id` int(10) UNSIGNED NOT NULL,
  `api_token_permission_id` int(10) UNSIGNED DEFAULT NULL,
  `api_token_id` int(10) UNSIGNED DEFAULT NULL,
  `api_token_permission_order` double UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `strapi_api_token_permissions_token_links`
--

INSERT INTO `strapi_api_token_permissions_token_links` (`id`, `api_token_permission_id`, `api_token_id`, `api_token_permission_order`) VALUES
(4, 4, 1, 1),
(6, 6, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `strapi_core_store_settings`
--

CREATE TABLE `strapi_core_store_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` longtext DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `environment` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `strapi_core_store_settings`
--

INSERT INTO `strapi_core_store_settings` (`id`, `key`, `value`, `type`, `environment`, `tag`) VALUES
(1, 'strapi_content_types_schema', '{\"admin::permission\":{\"collectionName\":\"admin_permissions\",\"info\":{\"name\":\"Permission\",\"description\":\"\",\"singularName\":\"permission\",\"pluralName\":\"permissions\",\"displayName\":\"Permission\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"actionParameters\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":{}},\"subject\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false},\"properties\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":{}},\"conditions\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":[]},\"role\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToOne\",\"inversedBy\":\"permissions\",\"target\":\"admin::role\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"admin_permissions\",\"info\":{\"name\":\"Permission\",\"description\":\"\",\"singularName\":\"permission\",\"pluralName\":\"permissions\",\"displayName\":\"Permission\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"actionParameters\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":{}},\"subject\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false},\"properties\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":{}},\"conditions\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":[]},\"role\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToOne\",\"inversedBy\":\"permissions\",\"target\":\"admin::role\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"permission\",\"connection\":\"default\",\"uid\":\"admin::permission\",\"plugin\":\"admin\",\"globalId\":\"AdminPermission\"},\"admin::user\":{\"collectionName\":\"admin_users\",\"info\":{\"name\":\"User\",\"description\":\"\",\"singularName\":\"user\",\"pluralName\":\"users\",\"displayName\":\"User\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"firstname\":{\"type\":\"string\",\"unique\":false,\"minLength\":1,\"configurable\":false,\"required\":false},\"lastname\":{\"type\":\"string\",\"unique\":false,\"minLength\":1,\"configurable\":false,\"required\":false},\"username\":{\"type\":\"string\",\"unique\":false,\"configurable\":false,\"required\":false},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true,\"unique\":true,\"private\":true},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"required\":false,\"private\":true,\"searchable\":false},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true,\"searchable\":false},\"registrationToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true,\"searchable\":false},\"isActive\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false,\"private\":true},\"roles\":{\"configurable\":false,\"private\":true,\"type\":\"relation\",\"relation\":\"manyToMany\",\"inversedBy\":\"users\",\"target\":\"admin::role\",\"collectionName\":\"strapi_users_roles\"},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false,\"private\":true},\"preferedLanguage\":{\"type\":\"string\",\"configurable\":false,\"required\":false,\"searchable\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"config\":{\"attributes\":{\"resetPasswordToken\":{\"hidden\":true},\"registrationToken\":{\"hidden\":true}}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"admin_users\",\"info\":{\"name\":\"User\",\"description\":\"\",\"singularName\":\"user\",\"pluralName\":\"users\",\"displayName\":\"User\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"firstname\":{\"type\":\"string\",\"unique\":false,\"minLength\":1,\"configurable\":false,\"required\":false},\"lastname\":{\"type\":\"string\",\"unique\":false,\"minLength\":1,\"configurable\":false,\"required\":false},\"username\":{\"type\":\"string\",\"unique\":false,\"configurable\":false,\"required\":false},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true,\"unique\":true,\"private\":true},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"required\":false,\"private\":true,\"searchable\":false},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true,\"searchable\":false},\"registrationToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true,\"searchable\":false},\"isActive\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false,\"private\":true},\"roles\":{\"configurable\":false,\"private\":true,\"type\":\"relation\",\"relation\":\"manyToMany\",\"inversedBy\":\"users\",\"target\":\"admin::role\",\"collectionName\":\"strapi_users_roles\"},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false,\"private\":true},\"preferedLanguage\":{\"type\":\"string\",\"configurable\":false,\"required\":false,\"searchable\":false}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"user\",\"connection\":\"default\",\"uid\":\"admin::user\",\"plugin\":\"admin\",\"globalId\":\"AdminUser\"},\"admin::role\":{\"collectionName\":\"admin_roles\",\"info\":{\"name\":\"Role\",\"description\":\"\",\"singularName\":\"role\",\"pluralName\":\"roles\",\"displayName\":\"Role\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"unique\":true,\"configurable\":false,\"required\":true},\"code\":{\"type\":\"string\",\"minLength\":1,\"unique\":true,\"configurable\":false,\"required\":true},\"description\":{\"type\":\"string\",\"configurable\":false},\"users\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToMany\",\"mappedBy\":\"roles\",\"target\":\"admin::user\"},\"permissions\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"oneToMany\",\"mappedBy\":\"role\",\"target\":\"admin::permission\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"admin_roles\",\"info\":{\"name\":\"Role\",\"description\":\"\",\"singularName\":\"role\",\"pluralName\":\"roles\",\"displayName\":\"Role\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"unique\":true,\"configurable\":false,\"required\":true},\"code\":{\"type\":\"string\",\"minLength\":1,\"unique\":true,\"configurable\":false,\"required\":true},\"description\":{\"type\":\"string\",\"configurable\":false},\"users\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToMany\",\"mappedBy\":\"roles\",\"target\":\"admin::user\"},\"permissions\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"oneToMany\",\"mappedBy\":\"role\",\"target\":\"admin::permission\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"role\",\"connection\":\"default\",\"uid\":\"admin::role\",\"plugin\":\"admin\",\"globalId\":\"AdminRole\"},\"admin::api-token\":{\"collectionName\":\"strapi_api_tokens\",\"info\":{\"name\":\"Api Token\",\"singularName\":\"api-token\",\"pluralName\":\"api-tokens\",\"displayName\":\"Api Token\",\"description\":\"\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true,\"unique\":true},\"description\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false,\"default\":\"\"},\"type\":{\"type\":\"enumeration\",\"enum\":[\"read-only\",\"full-access\",\"custom\"],\"configurable\":false,\"required\":true,\"default\":\"read-only\"},\"accessKey\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true,\"searchable\":false},\"lastUsedAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"permissions\":{\"type\":\"relation\",\"target\":\"admin::api-token-permission\",\"relation\":\"oneToMany\",\"mappedBy\":\"token\",\"configurable\":false,\"required\":false},\"expiresAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"lifespan\":{\"type\":\"biginteger\",\"configurable\":false,\"required\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"strapi_api_tokens\",\"info\":{\"name\":\"Api Token\",\"singularName\":\"api-token\",\"pluralName\":\"api-tokens\",\"displayName\":\"Api Token\",\"description\":\"\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true,\"unique\":true},\"description\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false,\"default\":\"\"},\"type\":{\"type\":\"enumeration\",\"enum\":[\"read-only\",\"full-access\",\"custom\"],\"configurable\":false,\"required\":true,\"default\":\"read-only\"},\"accessKey\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true,\"searchable\":false},\"lastUsedAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"permissions\":{\"type\":\"relation\",\"target\":\"admin::api-token-permission\",\"relation\":\"oneToMany\",\"mappedBy\":\"token\",\"configurable\":false,\"required\":false},\"expiresAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"lifespan\":{\"type\":\"biginteger\",\"configurable\":false,\"required\":false}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"api-token\",\"connection\":\"default\",\"uid\":\"admin::api-token\",\"plugin\":\"admin\",\"globalId\":\"AdminApiToken\"},\"admin::api-token-permission\":{\"collectionName\":\"strapi_api_token_permissions\",\"info\":{\"name\":\"API Token Permission\",\"description\":\"\",\"singularName\":\"api-token-permission\",\"pluralName\":\"api-token-permissions\",\"displayName\":\"API Token Permission\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"token\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToOne\",\"inversedBy\":\"permissions\",\"target\":\"admin::api-token\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"strapi_api_token_permissions\",\"info\":{\"name\":\"API Token Permission\",\"description\":\"\",\"singularName\":\"api-token-permission\",\"pluralName\":\"api-token-permissions\",\"displayName\":\"API Token Permission\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"token\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToOne\",\"inversedBy\":\"permissions\",\"target\":\"admin::api-token\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"api-token-permission\",\"connection\":\"default\",\"uid\":\"admin::api-token-permission\",\"plugin\":\"admin\",\"globalId\":\"AdminApiTokenPermission\"},\"admin::transfer-token\":{\"collectionName\":\"strapi_transfer_tokens\",\"info\":{\"name\":\"Transfer Token\",\"singularName\":\"transfer-token\",\"pluralName\":\"transfer-tokens\",\"displayName\":\"Transfer Token\",\"description\":\"\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true,\"unique\":true},\"description\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false,\"default\":\"\"},\"accessKey\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"lastUsedAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"permissions\":{\"type\":\"relation\",\"target\":\"admin::transfer-token-permission\",\"relation\":\"oneToMany\",\"mappedBy\":\"token\",\"configurable\":false,\"required\":false},\"expiresAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"lifespan\":{\"type\":\"biginteger\",\"configurable\":false,\"required\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"strapi_transfer_tokens\",\"info\":{\"name\":\"Transfer Token\",\"singularName\":\"transfer-token\",\"pluralName\":\"transfer-tokens\",\"displayName\":\"Transfer Token\",\"description\":\"\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true,\"unique\":true},\"description\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false,\"default\":\"\"},\"accessKey\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"lastUsedAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"permissions\":{\"type\":\"relation\",\"target\":\"admin::transfer-token-permission\",\"relation\":\"oneToMany\",\"mappedBy\":\"token\",\"configurable\":false,\"required\":false},\"expiresAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"lifespan\":{\"type\":\"biginteger\",\"configurable\":false,\"required\":false}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"transfer-token\",\"connection\":\"default\",\"uid\":\"admin::transfer-token\",\"plugin\":\"admin\",\"globalId\":\"AdminTransferToken\"},\"admin::transfer-token-permission\":{\"collectionName\":\"strapi_transfer_token_permissions\",\"info\":{\"name\":\"Transfer Token Permission\",\"description\":\"\",\"singularName\":\"transfer-token-permission\",\"pluralName\":\"transfer-token-permissions\",\"displayName\":\"Transfer Token Permission\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"token\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToOne\",\"inversedBy\":\"permissions\",\"target\":\"admin::transfer-token\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"strapi_transfer_token_permissions\",\"info\":{\"name\":\"Transfer Token Permission\",\"description\":\"\",\"singularName\":\"transfer-token-permission\",\"pluralName\":\"transfer-token-permissions\",\"displayName\":\"Transfer Token Permission\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"token\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToOne\",\"inversedBy\":\"permissions\",\"target\":\"admin::transfer-token\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"transfer-token-permission\",\"connection\":\"default\",\"uid\":\"admin::transfer-token-permission\",\"plugin\":\"admin\",\"globalId\":\"AdminTransferTokenPermission\"},\"plugin::upload.file\":{\"collectionName\":\"files\",\"info\":{\"singularName\":\"file\",\"pluralName\":\"files\",\"displayName\":\"File\",\"description\":\"\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"alternativeText\":{\"type\":\"string\",\"configurable\":false},\"caption\":{\"type\":\"string\",\"configurable\":false},\"width\":{\"type\":\"integer\",\"configurable\":false},\"height\":{\"type\":\"integer\",\"configurable\":false},\"formats\":{\"type\":\"json\",\"configurable\":false},\"hash\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"ext\":{\"type\":\"string\",\"configurable\":false},\"mime\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"size\":{\"type\":\"decimal\",\"configurable\":false,\"required\":true},\"url\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"previewUrl\":{\"type\":\"string\",\"configurable\":false},\"provider\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"provider_metadata\":{\"type\":\"json\",\"configurable\":false},\"related\":{\"type\":\"relation\",\"relation\":\"morphToMany\",\"configurable\":false},\"folder\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::upload.folder\",\"inversedBy\":\"files\",\"private\":true},\"folderPath\":{\"type\":\"string\",\"min\":1,\"required\":true,\"private\":true,\"searchable\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"indexes\":[{\"name\":\"upload_files_folder_path_index\",\"columns\":[\"folder_path\"],\"type\":null},{\"name\":\"upload_files_created_at_index\",\"columns\":[\"created_at\"],\"type\":null},{\"name\":\"upload_files_updated_at_index\",\"columns\":[\"updated_at\"],\"type\":null},{\"name\":\"upload_files_name_index\",\"columns\":[\"name\"],\"type\":null},{\"name\":\"upload_files_size_index\",\"columns\":[\"size\"],\"type\":null},{\"name\":\"upload_files_ext_index\",\"columns\":[\"ext\"],\"type\":null}],\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"files\",\"info\":{\"singularName\":\"file\",\"pluralName\":\"files\",\"displayName\":\"File\",\"description\":\"\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"alternativeText\":{\"type\":\"string\",\"configurable\":false},\"caption\":{\"type\":\"string\",\"configurable\":false},\"width\":{\"type\":\"integer\",\"configurable\":false},\"height\":{\"type\":\"integer\",\"configurable\":false},\"formats\":{\"type\":\"json\",\"configurable\":false},\"hash\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"ext\":{\"type\":\"string\",\"configurable\":false},\"mime\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"size\":{\"type\":\"decimal\",\"configurable\":false,\"required\":true},\"url\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"previewUrl\":{\"type\":\"string\",\"configurable\":false},\"provider\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"provider_metadata\":{\"type\":\"json\",\"configurable\":false},\"related\":{\"type\":\"relation\",\"relation\":\"morphToMany\",\"configurable\":false},\"folder\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::upload.folder\",\"inversedBy\":\"files\",\"private\":true},\"folderPath\":{\"type\":\"string\",\"min\":1,\"required\":true,\"private\":true,\"searchable\":false}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"file\",\"connection\":\"default\",\"uid\":\"plugin::upload.file\",\"plugin\":\"upload\",\"globalId\":\"UploadFile\"},\"plugin::upload.folder\":{\"collectionName\":\"upload_folders\",\"info\":{\"singularName\":\"folder\",\"pluralName\":\"folders\",\"displayName\":\"Folder\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"min\":1,\"required\":true},\"pathId\":{\"type\":\"integer\",\"unique\":true,\"required\":true},\"parent\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::upload.folder\",\"inversedBy\":\"children\"},\"children\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::upload.folder\",\"mappedBy\":\"parent\"},\"files\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::upload.file\",\"mappedBy\":\"folder\"},\"path\":{\"type\":\"string\",\"min\":1,\"required\":true},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"indexes\":[{\"name\":\"upload_folders_path_id_index\",\"columns\":[\"path_id\"],\"type\":\"unique\"},{\"name\":\"upload_folders_path_index\",\"columns\":[\"path\"],\"type\":\"unique\"}],\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"upload_folders\",\"info\":{\"singularName\":\"folder\",\"pluralName\":\"folders\",\"displayName\":\"Folder\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"min\":1,\"required\":true},\"pathId\":{\"type\":\"integer\",\"unique\":true,\"required\":true},\"parent\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::upload.folder\",\"inversedBy\":\"children\"},\"children\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::upload.folder\",\"mappedBy\":\"parent\"},\"files\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::upload.file\",\"mappedBy\":\"folder\"},\"path\":{\"type\":\"string\",\"min\":1,\"required\":true}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"folder\",\"connection\":\"default\",\"uid\":\"plugin::upload.folder\",\"plugin\":\"upload\",\"globalId\":\"UploadFolder\"},\"plugin::content-releases.release\":{\"collectionName\":\"strapi_releases\",\"info\":{\"singularName\":\"release\",\"pluralName\":\"releases\",\"displayName\":\"Release\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"required\":true},\"releasedAt\":{\"type\":\"datetime\"},\"scheduledAt\":{\"type\":\"datetime\"},\"timezone\":{\"type\":\"string\"},\"status\":{\"type\":\"enumeration\",\"enum\":[\"ready\",\"blocked\",\"failed\",\"done\",\"empty\"],\"required\":true},\"actions\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::content-releases.release-action\",\"mappedBy\":\"release\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"strapi_releases\",\"info\":{\"singularName\":\"release\",\"pluralName\":\"releases\",\"displayName\":\"Release\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"required\":true},\"releasedAt\":{\"type\":\"datetime\"},\"scheduledAt\":{\"type\":\"datetime\"},\"timezone\":{\"type\":\"string\"},\"status\":{\"type\":\"enumeration\",\"enum\":[\"ready\",\"blocked\",\"failed\",\"done\",\"empty\"],\"required\":true},\"actions\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::content-releases.release-action\",\"mappedBy\":\"release\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"release\",\"connection\":\"default\",\"uid\":\"plugin::content-releases.release\",\"plugin\":\"content-releases\",\"globalId\":\"ContentReleasesRelease\"},\"plugin::content-releases.release-action\":{\"collectionName\":\"strapi_release_actions\",\"info\":{\"singularName\":\"release-action\",\"pluralName\":\"release-actions\",\"displayName\":\"Release Action\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"type\":{\"type\":\"enumeration\",\"enum\":[\"publish\",\"unpublish\"],\"required\":true},\"entry\":{\"type\":\"relation\",\"relation\":\"morphToOne\",\"configurable\":false},\"contentType\":{\"type\":\"string\",\"required\":true},\"locale\":{\"type\":\"string\"},\"release\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::content-releases.release\",\"inversedBy\":\"actions\"},\"isEntryValid\":{\"type\":\"boolean\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"strapi_release_actions\",\"info\":{\"singularName\":\"release-action\",\"pluralName\":\"release-actions\",\"displayName\":\"Release Action\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"type\":{\"type\":\"enumeration\",\"enum\":[\"publish\",\"unpublish\"],\"required\":true},\"entry\":{\"type\":\"relation\",\"relation\":\"morphToOne\",\"configurable\":false},\"contentType\":{\"type\":\"string\",\"required\":true},\"locale\":{\"type\":\"string\"},\"release\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::content-releases.release\",\"inversedBy\":\"actions\"},\"isEntryValid\":{\"type\":\"boolean\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"release-action\",\"connection\":\"default\",\"uid\":\"plugin::content-releases.release-action\",\"plugin\":\"content-releases\",\"globalId\":\"ContentReleasesReleaseAction\"},\"plugin::users-permissions.permission\":{\"collectionName\":\"up_permissions\",\"info\":{\"name\":\"permission\",\"description\":\"\",\"singularName\":\"permission\",\"pluralName\":\"permissions\",\"displayName\":\"Permission\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"role\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::users-permissions.role\",\"inversedBy\":\"permissions\",\"configurable\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"up_permissions\",\"info\":{\"name\":\"permission\",\"description\":\"\",\"singularName\":\"permission\",\"pluralName\":\"permissions\",\"displayName\":\"Permission\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"role\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::users-permissions.role\",\"inversedBy\":\"permissions\",\"configurable\":false}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"permission\",\"connection\":\"default\",\"uid\":\"plugin::users-permissions.permission\",\"plugin\":\"users-permissions\",\"globalId\":\"UsersPermissionsPermission\"},\"plugin::users-permissions.role\":{\"collectionName\":\"up_roles\",\"info\":{\"name\":\"role\",\"description\":\"\",\"singularName\":\"role\",\"pluralName\":\"roles\",\"displayName\":\"Role\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":3,\"required\":true,\"configurable\":false},\"description\":{\"type\":\"string\",\"configurable\":false},\"type\":{\"type\":\"string\",\"unique\":true,\"configurable\":false},\"permissions\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::users-permissions.permission\",\"mappedBy\":\"role\",\"configurable\":false},\"users\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::users-permissions.user\",\"mappedBy\":\"role\",\"configurable\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"up_roles\",\"info\":{\"name\":\"role\",\"description\":\"\",\"singularName\":\"role\",\"pluralName\":\"roles\",\"displayName\":\"Role\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":3,\"required\":true,\"configurable\":false},\"description\":{\"type\":\"string\",\"configurable\":false},\"type\":{\"type\":\"string\",\"unique\":true,\"configurable\":false},\"permissions\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::users-permissions.permission\",\"mappedBy\":\"role\",\"configurable\":false},\"users\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::users-permissions.user\",\"mappedBy\":\"role\",\"configurable\":false}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"role\",\"connection\":\"default\",\"uid\":\"plugin::users-permissions.role\",\"plugin\":\"users-permissions\",\"globalId\":\"UsersPermissionsRole\"},\"plugin::users-permissions.user\":{\"collectionName\":\"up_users\",\"info\":{\"name\":\"user\",\"description\":\"\",\"singularName\":\"user\",\"pluralName\":\"users\",\"displayName\":\"User\"},\"options\":{\"draftAndPublish\":false},\"attributes\":{\"username\":{\"type\":\"string\",\"minLength\":3,\"unique\":true,\"configurable\":false,\"required\":true},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true},\"provider\":{\"type\":\"string\",\"configurable\":false},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"private\":true,\"searchable\":false},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true,\"searchable\":false},\"confirmationToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true,\"searchable\":false},\"confirmed\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"role\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::users-permissions.role\",\"inversedBy\":\"users\",\"configurable\":false},\"first_name\":{\"type\":\"string\",\"required\":true},\"middle_name\":{\"type\":\"string\"},\"surname\":{\"type\":\"string\",\"required\":true},\"dp\":{\"type\":\"media\",\"multiple\":false,\"required\":false,\"allowedTypes\":[\"images\"]},\"dob\":{\"type\":\"date\",\"required\":true},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"config\":{\"attributes\":{\"resetPasswordToken\":{\"hidden\":true},\"confirmationToken\":{\"hidden\":true},\"provider\":{\"hidden\":true}}},\"kind\":\"collectionType\",\"__filename__\":\"schema.json\",\"__schema__\":{\"collectionName\":\"up_users\",\"info\":{\"name\":\"user\",\"description\":\"\",\"singularName\":\"user\",\"pluralName\":\"users\",\"displayName\":\"User\"},\"options\":{\"draftAndPublish\":false},\"attributes\":{\"username\":{\"type\":\"string\",\"minLength\":3,\"unique\":true,\"configurable\":false,\"required\":true},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true},\"provider\":{\"type\":\"string\",\"configurable\":false},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"private\":true,\"searchable\":false},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true,\"searchable\":false},\"confirmationToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true,\"searchable\":false},\"confirmed\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"role\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::users-permissions.role\",\"inversedBy\":\"users\",\"configurable\":false},\"first_name\":{\"type\":\"string\",\"required\":true},\"middle_name\":{\"type\":\"string\"},\"surname\":{\"type\":\"string\",\"required\":true},\"dp\":{\"type\":\"media\",\"multiple\":false,\"required\":false,\"allowedTypes\":[\"images\"]},\"dob\":{\"type\":\"date\",\"required\":true}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"user\",\"connection\":\"default\",\"uid\":\"plugin::users-permissions.user\",\"plugin\":\"users-permissions\",\"globalId\":\"UsersPermissionsUser\"},\"plugin::i18n.locale\":{\"info\":{\"singularName\":\"locale\",\"pluralName\":\"locales\",\"collectionName\":\"locales\",\"displayName\":\"Locale\",\"description\":\"\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"min\":1,\"max\":50,\"configurable\":false},\"code\":{\"type\":\"string\",\"unique\":true,\"configurable\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"info\":{\"singularName\":\"locale\",\"pluralName\":\"locales\",\"collectionName\":\"locales\",\"displayName\":\"Locale\",\"description\":\"\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"min\":1,\"max\":50,\"configurable\":false},\"code\":{\"type\":\"string\",\"unique\":true,\"configurable\":false}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"locale\",\"connection\":\"default\",\"uid\":\"plugin::i18n.locale\",\"plugin\":\"i18n\",\"collectionName\":\"i18n_locale\",\"globalId\":\"I18NLocale\"},\"api::activity.activity\":{\"kind\":\"collectionType\",\"collectionName\":\"activities\",\"info\":{\"singularName\":\"activity\",\"pluralName\":\"activities\",\"displayName\":\"Destination Activities\",\"description\":\"\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"activity\":{\"type\":\"string\"},\"tours\":{\"type\":\"relation\",\"relation\":\"manyToMany\",\"target\":\"api::tour.tour\",\"inversedBy\":\"activities\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"__schema__\":{\"collectionName\":\"activities\",\"info\":{\"singularName\":\"activity\",\"pluralName\":\"activities\",\"displayName\":\"Destination Activities\",\"description\":\"\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"activity\":{\"type\":\"string\"},\"tours\":{\"type\":\"relation\",\"relation\":\"manyToMany\",\"target\":\"api::tour.tour\",\"inversedBy\":\"activities\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"activity\",\"connection\":\"default\",\"uid\":\"api::activity.activity\",\"apiName\":\"activity\",\"globalId\":\"Activity\",\"actions\":{},\"lifecycles\":{}},\"api::employee.employee\":{\"kind\":\"collectionType\",\"collectionName\":\"employees\",\"info\":{\"singularName\":\"employee\",\"pluralName\":\"employees\",\"displayName\":\"Employees\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"name\":{\"type\":\"string\",\"required\":true},\"role\":{\"type\":\"string\",\"required\":true},\"social_link\":{\"type\":\"string\",\"required\":true},\"dp\":{\"allowedTypes\":[\"images\"],\"type\":\"media\",\"multiple\":false,\"required\":true},\"icon\":{\"allowedTypes\":[\"images\"],\"type\":\"media\",\"multiple\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"__schema__\":{\"collectionName\":\"employees\",\"info\":{\"singularName\":\"employee\",\"pluralName\":\"employees\",\"displayName\":\"Employees\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"name\":{\"type\":\"string\",\"required\":true},\"role\":{\"type\":\"string\",\"required\":true},\"social_link\":{\"type\":\"string\",\"required\":true},\"dp\":{\"allowedTypes\":[\"images\"],\"type\":\"media\",\"multiple\":false,\"required\":true},\"icon\":{\"allowedTypes\":[\"images\"],\"type\":\"media\",\"multiple\":false}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"employee\",\"connection\":\"default\",\"uid\":\"api::employee.employee\",\"apiName\":\"employee\",\"globalId\":\"Employee\",\"actions\":{},\"lifecycles\":{}},\"api::query.query\":{\"kind\":\"collectionType\",\"collectionName\":\"queries\",\"info\":{\"singularName\":\"query\",\"pluralName\":\"queries\",\"displayName\":\"queries\",\"description\":\"\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{},\"attributes\":{\"full_name\":{\"type\":\"string\",\"required\":true},\"subject\":{\"type\":\"string\"},\"message\":{\"type\":\"text\",\"required\":true},\"email\":{\"type\":\"string\",\"required\":true},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"__schema__\":{\"collectionName\":\"queries\",\"info\":{\"singularName\":\"query\",\"pluralName\":\"queries\",\"displayName\":\"queries\",\"description\":\"\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{},\"attributes\":{\"full_name\":{\"type\":\"string\",\"required\":true},\"subject\":{\"type\":\"string\"},\"message\":{\"type\":\"text\",\"required\":true},\"email\":{\"type\":\"string\",\"required\":true}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"query\",\"connection\":\"default\",\"uid\":\"api::query.query\",\"apiName\":\"query\",\"globalId\":\"Query\",\"actions\":{},\"lifecycles\":{}},\"api::review.review\":{\"kind\":\"collectionType\",\"collectionName\":\"reviews\",\"info\":{\"singularName\":\"review\",\"pluralName\":\"reviews\",\"displayName\":\"Reviews\",\"description\":\"\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{},\"attributes\":{\"rating\":{\"type\":\"integer\",\"max\":5,\"required\":true},\"body\":{\"type\":\"text\",\"required\":true},\"tourid\":{\"required\":true,\"type\":\"biginteger\"},\"first_name\":{\"type\":\"string\",\"required\":true},\"surname\":{\"type\":\"string\",\"required\":true},\"username\":{\"type\":\"string\",\"required\":true},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"__schema__\":{\"collectionName\":\"reviews\",\"info\":{\"singularName\":\"review\",\"pluralName\":\"reviews\",\"displayName\":\"Reviews\",\"description\":\"\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{},\"attributes\":{\"rating\":{\"type\":\"integer\",\"max\":5,\"required\":true},\"body\":{\"type\":\"text\",\"required\":true},\"tourid\":{\"required\":true,\"type\":\"biginteger\"},\"first_name\":{\"type\":\"string\",\"required\":true},\"surname\":{\"type\":\"string\",\"required\":true},\"username\":{\"type\":\"string\",\"required\":true}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"review\",\"connection\":\"default\",\"uid\":\"api::review.review\",\"apiName\":\"review\",\"globalId\":\"Review\",\"actions\":{},\"lifecycles\":{}},\"api::tour.tour\":{\"kind\":\"collectionType\",\"collectionName\":\"tours\",\"info\":{\"singularName\":\"tour\",\"pluralName\":\"tours\",\"displayName\":\"tours\",\"description\":\"\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"title\":{\"type\":\"string\",\"required\":true},\"description\":{\"type\":\"text\",\"required\":true},\"media\":{\"type\":\"media\",\"multiple\":true,\"required\":true,\"allowedTypes\":[\"images\",\"videos\"]},\"ideal_dates\":{\"type\":\"json\",\"required\":true},\"disclaimer\":{\"type\":\"json\",\"required\":true},\"cancellations\":{\"type\":\"json\",\"required\":true},\"itinerary\":{\"type\":\"media\",\"multiple\":true,\"required\":false,\"allowedTypes\":[\"files\"]},\"days\":{\"type\":\"integer\",\"required\":true},\"nights\":{\"type\":\"integer\",\"required\":true},\"cancellation_conclusion\":{\"type\":\"text\",\"required\":true},\"country\":{\"type\":\"string\",\"required\":true},\"display_picture\":{\"type\":\"media\",\"multiple\":false,\"required\":true,\"allowedTypes\":[\"images\",\"files\",\"videos\",\"audios\"]},\"continent\":{\"type\":\"enumeration\",\"enum\":[\"africa\",\"europe\",\"asia\",\"america\",\"pacific\"],\"required\":true},\"status\":{\"type\":\"enumeration\",\"enum\":[\"featured\",\"popular\",\"other\"],\"required\":true},\"activities\":{\"type\":\"relation\",\"relation\":\"manyToMany\",\"target\":\"api::activity.activity\",\"mappedBy\":\"tours\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"__schema__\":{\"collectionName\":\"tours\",\"info\":{\"singularName\":\"tour\",\"pluralName\":\"tours\",\"displayName\":\"tours\",\"description\":\"\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"title\":{\"type\":\"string\",\"required\":true},\"description\":{\"type\":\"text\",\"required\":true},\"media\":{\"type\":\"media\",\"multiple\":true,\"required\":true,\"allowedTypes\":[\"images\",\"videos\"]},\"ideal_dates\":{\"type\":\"json\",\"required\":true},\"disclaimer\":{\"type\":\"json\",\"required\":true},\"cancellations\":{\"type\":\"json\",\"required\":true},\"itinerary\":{\"type\":\"media\",\"multiple\":true,\"required\":false,\"allowedTypes\":[\"files\"]},\"days\":{\"type\":\"integer\",\"required\":true},\"nights\":{\"type\":\"integer\",\"required\":true},\"cancellation_conclusion\":{\"type\":\"text\",\"required\":true},\"country\":{\"type\":\"string\",\"required\":true},\"display_picture\":{\"type\":\"media\",\"multiple\":false,\"required\":true,\"allowedTypes\":[\"images\",\"files\",\"videos\",\"audios\"]},\"continent\":{\"type\":\"enumeration\",\"enum\":[\"africa\",\"europe\",\"asia\",\"america\",\"pacific\"],\"required\":true},\"status\":{\"type\":\"enumeration\",\"enum\":[\"featured\",\"popular\",\"other\"],\"required\":true},\"activities\":{\"type\":\"relation\",\"relation\":\"manyToMany\",\"target\":\"api::activity.activity\",\"mappedBy\":\"tours\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"tour\",\"connection\":\"default\",\"uid\":\"api::tour.tour\",\"apiName\":\"tour\",\"globalId\":\"Tour\",\"actions\":{},\"lifecycles\":{}},\"api::tour-booking.tour-booking\":{\"kind\":\"collectionType\",\"collectionName\":\"tour_bookings\",\"info\":{\"singularName\":\"tour-booking\",\"pluralName\":\"tour-bookings\",\"displayName\":\"Tour Booking\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{},\"attributes\":{\"tour\":{\"type\":\"string\",\"required\":true},\"first_name\":{\"type\":\"string\",\"required\":true},\"surname\":{\"type\":\"string\",\"required\":true},\"phone\":{\"required\":true,\"type\":\"biginteger\"},\"email\":{\"type\":\"string\",\"required\":true},\"adults\":{\"type\":\"integer\",\"required\":true},\"children\":{\"type\":\"integer\"},\"city\":{\"type\":\"string\",\"required\":true},\"travel_date\":{\"type\":\"date\"},\"message\":{\"type\":\"text\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"__schema__\":{\"collectionName\":\"tour_bookings\",\"info\":{\"singularName\":\"tour-booking\",\"pluralName\":\"tour-bookings\",\"displayName\":\"Tour Booking\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{},\"attributes\":{\"tour\":{\"type\":\"string\",\"required\":true},\"first_name\":{\"type\":\"string\",\"required\":true},\"surname\":{\"type\":\"string\",\"required\":true},\"phone\":{\"required\":true,\"type\":\"biginteger\"},\"email\":{\"type\":\"string\",\"required\":true},\"adults\":{\"type\":\"integer\",\"required\":true},\"children\":{\"type\":\"integer\"},\"city\":{\"type\":\"string\",\"required\":true},\"travel_date\":{\"type\":\"date\"},\"message\":{\"type\":\"text\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"tour-booking\",\"connection\":\"default\",\"uid\":\"api::tour-booking.tour-booking\",\"apiName\":\"tour-booking\",\"globalId\":\"TourBooking\",\"actions\":{},\"lifecycles\":{}}}', 'object', NULL, NULL);
INSERT INTO `strapi_core_store_settings` (`id`, `key`, `value`, `type`, `environment`, `tag`) VALUES
(2, 'plugin_content_manager_configuration_content_types::admin::api-token', '{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":true,\"sortable\":true}},\"type\":{\"edit\":{\"label\":\"type\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"type\",\"searchable\":true,\"sortable\":true}},\"accessKey\":{\"edit\":{\"label\":\"accessKey\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"accessKey\",\"searchable\":true,\"sortable\":true}},\"lastUsedAt\":{\"edit\":{\"label\":\"lastUsedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"lastUsedAt\",\"searchable\":true,\"sortable\":true}},\"permissions\":{\"edit\":{\"label\":\"permissions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"action\"},\"list\":{\"label\":\"permissions\",\"searchable\":false,\"sortable\":false}},\"expiresAt\":{\"edit\":{\"label\":\"expiresAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"expiresAt\",\"searchable\":true,\"sortable\":true}},\"lifespan\":{\"edit\":{\"label\":\"lifespan\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"lifespan\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"description\",\"type\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"description\",\"size\":6}],[{\"name\":\"type\",\"size\":6},{\"name\":\"accessKey\",\"size\":6}],[{\"name\":\"lastUsedAt\",\"size\":6},{\"name\":\"permissions\",\"size\":6}],[{\"name\":\"expiresAt\",\"size\":6},{\"name\":\"lifespan\",\"size\":4}]]},\"uid\":\"admin::api-token\"}', 'object', NULL, NULL),
(3, 'plugin_content_manager_configuration_content_types::admin::transfer-token-permission', '{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"action\",\"defaultSortBy\":\"action\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"action\":{\"edit\":{\"label\":\"action\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"action\",\"searchable\":true,\"sortable\":true}},\"token\":{\"edit\":{\"label\":\"token\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"token\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"action\",\"token\",\"createdAt\"],\"edit\":[[{\"name\":\"action\",\"size\":6},{\"name\":\"token\",\"size\":6}]]},\"uid\":\"admin::transfer-token-permission\"}', 'object', NULL, NULL),
(4, 'plugin_content_manager_configuration_content_types::plugin::users-permissions.permission', '{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"action\",\"defaultSortBy\":\"action\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"action\":{\"edit\":{\"label\":\"action\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"action\",\"searchable\":true,\"sortable\":true}},\"role\":{\"edit\":{\"label\":\"role\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"role\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"action\",\"role\",\"createdAt\"],\"edit\":[[{\"name\":\"action\",\"size\":6},{\"name\":\"role\",\"size\":6}]]},\"uid\":\"plugin::users-permissions.permission\"}', 'object', NULL, NULL),
(5, 'plugin_content_manager_configuration_content_types::admin::api-token-permission', '{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"action\",\"defaultSortBy\":\"action\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"action\":{\"edit\":{\"label\":\"action\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"action\",\"searchable\":true,\"sortable\":true}},\"token\":{\"edit\":{\"label\":\"token\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"token\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"action\",\"token\",\"createdAt\"],\"edit\":[[{\"name\":\"action\",\"size\":6},{\"name\":\"token\",\"size\":6}]]},\"uid\":\"admin::api-token-permission\"}', 'object', NULL, NULL),
(7, 'plugin_content_manager_configuration_content_types::api::tour.tour', '{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"title\",\"defaultSortBy\":\"title\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"title\":{\"edit\":{\"label\":\"title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"title\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":true,\"sortable\":true}},\"media\":{\"edit\":{\"label\":\"media\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"media\",\"searchable\":false,\"sortable\":false}},\"ideal_dates\":{\"edit\":{\"label\":\"ideal_dates\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"ideal_dates\",\"searchable\":false,\"sortable\":false}},\"disclaimer\":{\"edit\":{\"label\":\"disclaimer\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"disclaimer\",\"searchable\":false,\"sortable\":false}},\"cancellations\":{\"edit\":{\"label\":\"cancellations\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"cancellations\",\"searchable\":false,\"sortable\":false}},\"itinerary\":{\"edit\":{\"label\":\"itinerary\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"itinerary\",\"searchable\":false,\"sortable\":false}},\"days\":{\"edit\":{\"label\":\"days\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"days\",\"searchable\":true,\"sortable\":true}},\"nights\":{\"edit\":{\"label\":\"nights\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"nights\",\"searchable\":true,\"sortable\":true}},\"cancellation_conclusion\":{\"edit\":{\"label\":\"cancellation_conclusion\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"cancellation_conclusion\",\"searchable\":true,\"sortable\":true}},\"country\":{\"edit\":{\"label\":\"country\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"country\",\"searchable\":true,\"sortable\":true}},\"display_picture\":{\"edit\":{\"label\":\"display_picture\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"display_picture\",\"searchable\":false,\"sortable\":false}},\"continent\":{\"edit\":{\"label\":\"continent\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"continent\",\"searchable\":true,\"sortable\":true}},\"status\":{\"edit\":{\"label\":\"status\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"status\",\"searchable\":true,\"sortable\":true}},\"activities\":{\"edit\":{\"label\":\"activities\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"activity\"},\"list\":{\"label\":\"activities\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"title\",\"description\",\"media\"],\"edit\":[[{\"name\":\"title\",\"size\":6},{\"name\":\"description\",\"size\":6}],[{\"name\":\"media\",\"size\":6}],[{\"name\":\"ideal_dates\",\"size\":12}],[{\"name\":\"disclaimer\",\"size\":12}],[{\"name\":\"cancellations\",\"size\":12}],[{\"name\":\"itinerary\",\"size\":6},{\"name\":\"days\",\"size\":4}],[{\"name\":\"nights\",\"size\":4},{\"name\":\"cancellation_conclusion\",\"size\":6}],[{\"name\":\"continent\",\"size\":6}],[{\"name\":\"country\",\"size\":6},{\"name\":\"display_picture\",\"size\":6}],[{\"name\":\"status\",\"size\":6},{\"name\":\"activities\",\"size\":6}]]},\"uid\":\"api::tour.tour\"}', 'object', NULL, NULL),
(8, 'plugin_content_manager_configuration_content_types::plugin::upload.folder', '{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"pathId\":{\"edit\":{\"label\":\"pathId\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"pathId\",\"searchable\":true,\"sortable\":true}},\"parent\":{\"edit\":{\"label\":\"parent\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"parent\",\"searchable\":true,\"sortable\":true}},\"children\":{\"edit\":{\"label\":\"children\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"children\",\"searchable\":false,\"sortable\":false}},\"files\":{\"edit\":{\"label\":\"files\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"files\",\"searchable\":false,\"sortable\":false}},\"path\":{\"edit\":{\"label\":\"path\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"path\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"pathId\",\"parent\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"pathId\",\"size\":4}],[{\"name\":\"parent\",\"size\":6},{\"name\":\"children\",\"size\":6}],[{\"name\":\"files\",\"size\":6},{\"name\":\"path\",\"size\":6}]]},\"uid\":\"plugin::upload.folder\"}', 'object', NULL, NULL),
(9, 'plugin_content_manager_configuration_content_types::plugin::content-releases.release-action', '{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"contentType\",\"defaultSortBy\":\"contentType\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"type\":{\"edit\":{\"label\":\"type\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"type\",\"searchable\":true,\"sortable\":true}},\"contentType\":{\"edit\":{\"label\":\"contentType\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"contentType\",\"searchable\":true,\"sortable\":true}},\"locale\":{\"edit\":{\"label\":\"locale\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"locale\",\"searchable\":true,\"sortable\":true}},\"release\":{\"edit\":{\"label\":\"release\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"release\",\"searchable\":true,\"sortable\":true}},\"isEntryValid\":{\"edit\":{\"label\":\"isEntryValid\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"isEntryValid\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"type\",\"contentType\",\"locale\"],\"edit\":[[{\"name\":\"type\",\"size\":6},{\"name\":\"contentType\",\"size\":6}],[{\"name\":\"locale\",\"size\":6},{\"name\":\"release\",\"size\":6}],[{\"name\":\"isEntryValid\",\"size\":4}]]},\"uid\":\"plugin::content-releases.release-action\"}', 'object', NULL, NULL),
(10, 'plugin_content_manager_configuration_content_types::plugin::users-permissions.role', '{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":true,\"sortable\":true}},\"type\":{\"edit\":{\"label\":\"type\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"type\",\"searchable\":true,\"sortable\":true}},\"permissions\":{\"edit\":{\"label\":\"permissions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"action\"},\"list\":{\"label\":\"permissions\",\"searchable\":false,\"sortable\":false}},\"users\":{\"edit\":{\"label\":\"users\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"username\"},\"list\":{\"label\":\"users\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"description\",\"type\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"description\",\"size\":6}],[{\"name\":\"type\",\"size\":6},{\"name\":\"permissions\",\"size\":6}],[{\"name\":\"users\",\"size\":6}]]},\"uid\":\"plugin::users-permissions.role\"}', 'object', NULL, NULL),
(11, 'plugin_content_manager_configuration_content_types::admin::permission', '{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"action\",\"defaultSortBy\":\"action\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"action\":{\"edit\":{\"label\":\"action\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"action\",\"searchable\":true,\"sortable\":true}},\"actionParameters\":{\"edit\":{\"label\":\"actionParameters\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"actionParameters\",\"searchable\":false,\"sortable\":false}},\"subject\":{\"edit\":{\"label\":\"subject\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"subject\",\"searchable\":true,\"sortable\":true}},\"properties\":{\"edit\":{\"label\":\"properties\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"properties\",\"searchable\":false,\"sortable\":false}},\"conditions\":{\"edit\":{\"label\":\"conditions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"conditions\",\"searchable\":false,\"sortable\":false}},\"role\":{\"edit\":{\"label\":\"role\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"role\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"action\",\"subject\",\"role\"],\"edit\":[[{\"name\":\"action\",\"size\":6}],[{\"name\":\"actionParameters\",\"size\":12}],[{\"name\":\"subject\",\"size\":6}],[{\"name\":\"properties\",\"size\":12}],[{\"name\":\"conditions\",\"size\":12}],[{\"name\":\"role\",\"size\":6}]]},\"uid\":\"admin::permission\"}', 'object', NULL, NULL),
(12, 'plugin_content_manager_configuration_content_types::admin::user', '{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"firstname\",\"defaultSortBy\":\"firstname\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"firstname\":{\"edit\":{\"label\":\"firstname\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"firstname\",\"searchable\":true,\"sortable\":true}},\"lastname\":{\"edit\":{\"label\":\"lastname\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"lastname\",\"searchable\":true,\"sortable\":true}},\"username\":{\"edit\":{\"label\":\"username\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"username\",\"searchable\":true,\"sortable\":true}},\"email\":{\"edit\":{\"label\":\"email\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"email\",\"searchable\":true,\"sortable\":true}},\"password\":{\"edit\":{\"label\":\"password\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"password\",\"searchable\":true,\"sortable\":true}},\"resetPasswordToken\":{\"edit\":{\"label\":\"resetPasswordToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"resetPasswordToken\",\"searchable\":true,\"sortable\":true}},\"registrationToken\":{\"edit\":{\"label\":\"registrationToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"registrationToken\",\"searchable\":true,\"sortable\":true}},\"isActive\":{\"edit\":{\"label\":\"isActive\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"isActive\",\"searchable\":true,\"sortable\":true}},\"roles\":{\"edit\":{\"label\":\"roles\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"roles\",\"searchable\":false,\"sortable\":false}},\"blocked\":{\"edit\":{\"label\":\"blocked\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"blocked\",\"searchable\":true,\"sortable\":true}},\"preferedLanguage\":{\"edit\":{\"label\":\"preferedLanguage\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"preferedLanguage\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"firstname\",\"lastname\",\"username\"],\"edit\":[[{\"name\":\"firstname\",\"size\":6},{\"name\":\"lastname\",\"size\":6}],[{\"name\":\"username\",\"size\":6},{\"name\":\"email\",\"size\":6}],[{\"name\":\"password\",\"size\":6},{\"name\":\"isActive\",\"size\":4}],[{\"name\":\"roles\",\"size\":6},{\"name\":\"blocked\",\"size\":4}],[{\"name\":\"preferedLanguage\",\"size\":6}]]},\"uid\":\"admin::user\"}', 'object', NULL, NULL),
(13, 'plugin_content_manager_configuration_content_types::admin::role', '{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"code\":{\"edit\":{\"label\":\"code\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"code\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":true,\"sortable\":true}},\"users\":{\"edit\":{\"label\":\"users\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"users\",\"searchable\":false,\"sortable\":false}},\"permissions\":{\"edit\":{\"label\":\"permissions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"action\"},\"list\":{\"label\":\"permissions\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"code\",\"description\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"code\",\"size\":6}],[{\"name\":\"description\",\"size\":6},{\"name\":\"users\",\"size\":6}],[{\"name\":\"permissions\",\"size\":6}]]},\"uid\":\"admin::role\"}', 'object', NULL, NULL),
(14, 'plugin_content_manager_configuration_content_types::admin::transfer-token', '{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":true,\"sortable\":true}},\"accessKey\":{\"edit\":{\"label\":\"accessKey\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"accessKey\",\"searchable\":true,\"sortable\":true}},\"lastUsedAt\":{\"edit\":{\"label\":\"lastUsedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"lastUsedAt\",\"searchable\":true,\"sortable\":true}},\"permissions\":{\"edit\":{\"label\":\"permissions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"action\"},\"list\":{\"label\":\"permissions\",\"searchable\":false,\"sortable\":false}},\"expiresAt\":{\"edit\":{\"label\":\"expiresAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"expiresAt\",\"searchable\":true,\"sortable\":true}},\"lifespan\":{\"edit\":{\"label\":\"lifespan\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"lifespan\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"description\",\"accessKey\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"description\",\"size\":6}],[{\"name\":\"accessKey\",\"size\":6},{\"name\":\"lastUsedAt\",\"size\":6}],[{\"name\":\"permissions\",\"size\":6},{\"name\":\"expiresAt\",\"size\":6}],[{\"name\":\"lifespan\",\"size\":4}]]},\"uid\":\"admin::transfer-token\"}', 'object', NULL, NULL),
(15, 'plugin_content_manager_configuration_content_types::plugin::upload.file', '{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"alternativeText\":{\"edit\":{\"label\":\"alternativeText\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"alternativeText\",\"searchable\":true,\"sortable\":true}},\"caption\":{\"edit\":{\"label\":\"caption\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"caption\",\"searchable\":true,\"sortable\":true}},\"width\":{\"edit\":{\"label\":\"width\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"width\",\"searchable\":true,\"sortable\":true}},\"height\":{\"edit\":{\"label\":\"height\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"height\",\"searchable\":true,\"sortable\":true}},\"formats\":{\"edit\":{\"label\":\"formats\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"formats\",\"searchable\":false,\"sortable\":false}},\"hash\":{\"edit\":{\"label\":\"hash\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"hash\",\"searchable\":true,\"sortable\":true}},\"ext\":{\"edit\":{\"label\":\"ext\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"ext\",\"searchable\":true,\"sortable\":true}},\"mime\":{\"edit\":{\"label\":\"mime\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"mime\",\"searchable\":true,\"sortable\":true}},\"size\":{\"edit\":{\"label\":\"size\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"size\",\"searchable\":true,\"sortable\":true}},\"url\":{\"edit\":{\"label\":\"url\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"url\",\"searchable\":true,\"sortable\":true}},\"previewUrl\":{\"edit\":{\"label\":\"previewUrl\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"previewUrl\",\"searchable\":true,\"sortable\":true}},\"provider\":{\"edit\":{\"label\":\"provider\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"provider\",\"searchable\":true,\"sortable\":true}},\"provider_metadata\":{\"edit\":{\"label\":\"provider_metadata\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"provider_metadata\",\"searchable\":false,\"sortable\":false}},\"folder\":{\"edit\":{\"label\":\"folder\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"folder\",\"searchable\":true,\"sortable\":true}},\"folderPath\":{\"edit\":{\"label\":\"folderPath\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"folderPath\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"alternativeText\",\"caption\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"alternativeText\",\"size\":6}],[{\"name\":\"caption\",\"size\":6},{\"name\":\"width\",\"size\":4}],[{\"name\":\"height\",\"size\":4}],[{\"name\":\"formats\",\"size\":12}],[{\"name\":\"hash\",\"size\":6},{\"name\":\"ext\",\"size\":6}],[{\"name\":\"mime\",\"size\":6},{\"name\":\"size\",\"size\":4}],[{\"name\":\"url\",\"size\":6},{\"name\":\"previewUrl\",\"size\":6}],[{\"name\":\"provider\",\"size\":6}],[{\"name\":\"provider_metadata\",\"size\":12}],[{\"name\":\"folder\",\"size\":6},{\"name\":\"folderPath\",\"size\":6}]]},\"uid\":\"plugin::upload.file\"}', 'object', NULL, NULL),
(16, 'plugin_content_manager_configuration_content_types::plugin::content-releases.release', '{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"releasedAt\":{\"edit\":{\"label\":\"releasedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"releasedAt\",\"searchable\":true,\"sortable\":true}},\"scheduledAt\":{\"edit\":{\"label\":\"scheduledAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"scheduledAt\",\"searchable\":true,\"sortable\":true}},\"timezone\":{\"edit\":{\"label\":\"timezone\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"timezone\",\"searchable\":true,\"sortable\":true}},\"status\":{\"edit\":{\"label\":\"status\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"status\",\"searchable\":true,\"sortable\":true}},\"actions\":{\"edit\":{\"label\":\"actions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"contentType\"},\"list\":{\"label\":\"actions\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"releasedAt\",\"scheduledAt\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"releasedAt\",\"size\":6}],[{\"name\":\"scheduledAt\",\"size\":6},{\"name\":\"timezone\",\"size\":6}],[{\"name\":\"actions\",\"size\":6},{\"name\":\"status\",\"size\":6}]]},\"uid\":\"plugin::content-releases.release\"}', 'object', NULL, NULL),
(17, 'plugin_content_manager_configuration_content_types::plugin::i18n.locale', '{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"code\":{\"edit\":{\"label\":\"code\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"code\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"code\",\"createdAt\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"code\",\"size\":6}]]},\"uid\":\"plugin::i18n.locale\"}', 'object', NULL, NULL),
(18, 'plugin_content_manager_configuration_content_types::plugin::users-permissions.user', '{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"username\",\"defaultSortBy\":\"username\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"username\":{\"edit\":{\"label\":\"username\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"username\",\"searchable\":true,\"sortable\":true}},\"email\":{\"edit\":{\"label\":\"email\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"email\",\"searchable\":true,\"sortable\":true}},\"provider\":{\"edit\":{\"label\":\"provider\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"provider\",\"searchable\":true,\"sortable\":true}},\"password\":{\"edit\":{\"label\":\"password\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"password\",\"searchable\":true,\"sortable\":true}},\"resetPasswordToken\":{\"edit\":{\"label\":\"resetPasswordToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"resetPasswordToken\",\"searchable\":true,\"sortable\":true}},\"confirmationToken\":{\"edit\":{\"label\":\"confirmationToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"confirmationToken\",\"searchable\":true,\"sortable\":true}},\"confirmed\":{\"edit\":{\"label\":\"confirmed\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"confirmed\",\"searchable\":true,\"sortable\":true}},\"blocked\":{\"edit\":{\"label\":\"blocked\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"blocked\",\"searchable\":true,\"sortable\":true}},\"role\":{\"edit\":{\"label\":\"role\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"role\",\"searchable\":true,\"sortable\":true}},\"first_name\":{\"edit\":{\"label\":\"first_name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"first_name\",\"searchable\":true,\"sortable\":true}},\"middle_name\":{\"edit\":{\"label\":\"middle_name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"middle_name\",\"searchable\":true,\"sortable\":true}},\"surname\":{\"edit\":{\"label\":\"surname\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"surname\",\"searchable\":true,\"sortable\":true}},\"dp\":{\"edit\":{\"label\":\"dp\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"dp\",\"searchable\":false,\"sortable\":false}},\"dob\":{\"edit\":{\"label\":\"dob\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"dob\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"username\",\"email\",\"confirmed\"],\"edit\":[[{\"name\":\"username\",\"size\":6},{\"name\":\"email\",\"size\":6}],[{\"name\":\"password\",\"size\":6},{\"name\":\"confirmed\",\"size\":4}],[{\"name\":\"blocked\",\"size\":4},{\"name\":\"role\",\"size\":6}],[{\"name\":\"first_name\",\"size\":6},{\"name\":\"middle_name\",\"size\":6}],[{\"name\":\"surname\",\"size\":6}],[{\"name\":\"dob\",\"size\":4}],[{\"name\":\"dp\",\"size\":6}]]},\"uid\":\"plugin::users-permissions.user\"}', 'object', NULL, NULL),
(19, 'plugin_upload_settings', '{\"sizeOptimization\":true,\"responsiveDimensions\":false,\"autoOrientation\":false}', 'object', NULL, NULL),
(20, 'plugin_upload_view_configuration', '{\"pageSize\":10,\"sort\":\"createdAt:DESC\"}', 'object', NULL, NULL),
(21, 'plugin_upload_metrics', '{\"weeklySchedule\":\"53 24 23 * * 5\",\"lastWeeklyUpdate\":1731097493036}', 'object', NULL, NULL),
(22, 'plugin_i18n_default_locale', '\"en\"', 'string', NULL, NULL);
INSERT INTO `strapi_core_store_settings` (`id`, `key`, `value`, `type`, `environment`, `tag`) VALUES
(23, 'plugin_users-permissions_grant', '{\"email\":{\"enabled\":true,\"icon\":\"envelope\"},\"discord\":{\"enabled\":false,\"icon\":\"discord\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/discord/callback\",\"scope\":[\"identify\",\"email\"]},\"facebook\":{\"enabled\":false,\"icon\":\"facebook-square\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/facebook/callback\",\"scope\":[\"email\"]},\"google\":{\"enabled\":false,\"icon\":\"google\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/google/callback\",\"scope\":[\"email\"]},\"github\":{\"enabled\":false,\"icon\":\"github\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/github/callback\",\"scope\":[\"user\",\"user:email\"]},\"microsoft\":{\"enabled\":false,\"icon\":\"windows\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/microsoft/callback\",\"scope\":[\"user.read\"]},\"twitter\":{\"enabled\":false,\"icon\":\"twitter\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/twitter/callback\"},\"instagram\":{\"enabled\":false,\"icon\":\"instagram\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/instagram/callback\",\"scope\":[\"user_profile\"]},\"vk\":{\"enabled\":false,\"icon\":\"vk\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/vk/callback\",\"scope\":[\"email\"]},\"twitch\":{\"enabled\":false,\"icon\":\"twitch\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/twitch/callback\",\"scope\":[\"user:read:email\"]},\"linkedin\":{\"enabled\":false,\"icon\":\"linkedin\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/linkedin/callback\",\"scope\":[\"r_liteprofile\",\"r_emailaddress\"]},\"cognito\":{\"enabled\":false,\"icon\":\"aws\",\"key\":\"\",\"secret\":\"\",\"subdomain\":\"my.subdomain.com\",\"callback\":\"api/auth/cognito/callback\",\"scope\":[\"email\",\"openid\",\"profile\"]},\"reddit\":{\"enabled\":false,\"icon\":\"reddit\",\"key\":\"\",\"secret\":\"\",\"state\":true,\"callback\":\"api/auth/reddit/callback\",\"scope\":[\"identity\"]},\"auth0\":{\"enabled\":false,\"icon\":\"\",\"key\":\"\",\"secret\":\"\",\"subdomain\":\"my-tenant.eu\",\"callback\":\"api/auth/auth0/callback\",\"scope\":[\"openid\",\"email\",\"profile\"]},\"cas\":{\"enabled\":false,\"icon\":\"book\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/cas/callback\",\"scope\":[\"openid email\"],\"subdomain\":\"my.subdomain.com/cas\"},\"patreon\":{\"enabled\":false,\"icon\":\"\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/patreon/callback\",\"scope\":[\"identity\",\"identity[email]\"]},\"keycloak\":{\"enabled\":false,\"icon\":\"\",\"key\":\"\",\"secret\":\"\",\"subdomain\":\"myKeycloakProvider.com/realms/myrealm\",\"callback\":\"api/auth/keycloak/callback\",\"scope\":[\"openid\",\"email\",\"profile\"]}}', 'object', NULL, NULL),
(24, 'plugin_users-permissions_email', '{\"reset_password\":{\"display\":\"Email.template.reset_password\",\"icon\":\"sync\",\"options\":{\"from\":{\"name\":\"Administration Panel\",\"email\":\"no-reply@strapi.io\"},\"response_email\":\"\",\"object\":\"Reset password\",\"message\":\"<p>We heard that you lost your password. Sorry about that!</p>\\n\\n<p>But don’t worry! You can use the following link to reset your password:</p>\\n<p><%= URL %>?code=<%= TOKEN %></p>\\n\\n<p>Thanks.</p>\"}},\"email_confirmation\":{\"display\":\"Email.template.email_confirmation\",\"icon\":\"check-square\",\"options\":{\"from\":{\"name\":\"Admin\",\"email\":\"vizionbnm@gmail.com\"},\"response_email\":\"\",\"object\":\"Account confirmation\",\"message\":\"<p>Thank you for registering!</p>\\n\\n<p>You have to confirm your email address. Please click on the link below.</p>\\n\\n<p><%= URL %>?confirmation=<%= CODE %></p>\\n\\n<p>Thanks.</p>\"}}}', 'object', NULL, NULL),
(25, 'plugin_users-permissions_advanced', '{\"unique_email\":true,\"allow_register\":true,\"email_confirmation\":true,\"email_reset_password\":null,\"email_confirmation_redirection\":\"http://localhost:5173/\",\"default_role\":\"authenticated\"}', 'object', NULL, NULL),
(26, 'core_admin_auth', '{\"providers\":{\"autoRegister\":false,\"defaultRole\":null,\"ssoLockedRoles\":null}}', 'object', NULL, NULL),
(28, 'plugin_content_manager_configuration_content_types::api::review.review', '{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"first_name\",\"defaultSortBy\":\"first_name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"rating\":{\"edit\":{\"label\":\"rating\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"rating\",\"searchable\":true,\"sortable\":true}},\"body\":{\"edit\":{\"label\":\"body\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"body\",\"searchable\":true,\"sortable\":true}},\"tourid\":{\"edit\":{\"label\":\"tourid\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"tourid\",\"searchable\":true,\"sortable\":true}},\"first_name\":{\"edit\":{\"label\":\"first_name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"first_name\",\"searchable\":true,\"sortable\":true}},\"surname\":{\"edit\":{\"label\":\"surname\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"surname\",\"searchable\":true,\"sortable\":true}},\"username\":{\"edit\":{\"label\":\"username\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"username\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"rating\",\"body\",\"tourid\"],\"edit\":[[{\"name\":\"rating\",\"size\":4},{\"name\":\"body\",\"size\":6}],[{\"name\":\"tourid\",\"size\":4},{\"name\":\"first_name\",\"size\":6}],[{\"name\":\"surname\",\"size\":6},{\"name\":\"username\",\"size\":6}]]},\"uid\":\"api::review.review\"}', 'object', NULL, NULL),
(29, 'plugin_content_manager_configuration_content_types::api::activity.activity', '{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"activity\",\"defaultSortBy\":\"activity\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"activity\":{\"edit\":{\"label\":\"activity\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"activity\",\"searchable\":true,\"sortable\":true}},\"tours\":{\"edit\":{\"label\":\"tours\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"title\"},\"list\":{\"label\":\"tours\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"activity\",\"tours\",\"createdAt\"],\"edit\":[[{\"name\":\"activity\",\"size\":6},{\"name\":\"tours\",\"size\":6}]]},\"uid\":\"api::activity.activity\"}', 'object', NULL, NULL),
(30, 'plugin_content_manager_configuration_content_types::api::employee.employee', '{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"role\":{\"edit\":{\"label\":\"role\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"role\",\"searchable\":true,\"sortable\":true}},\"social_link\":{\"edit\":{\"label\":\"social_link\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"social_link\",\"searchable\":true,\"sortable\":true}},\"dp\":{\"edit\":{\"label\":\"dp\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"dp\",\"searchable\":false,\"sortable\":false}},\"icon\":{\"edit\":{\"label\":\"icon\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"icon\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"role\",\"social_link\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"role\",\"size\":6}],[{\"name\":\"social_link\",\"size\":6},{\"name\":\"dp\",\"size\":6}],[{\"name\":\"icon\",\"size\":6}]]},\"uid\":\"api::employee.employee\"}', 'object', NULL, NULL),
(32, 'plugin_content_manager_configuration_content_types::api::tour-booking.tour-booking', '{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"tour\",\"defaultSortBy\":\"tour\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"tour\":{\"edit\":{\"label\":\"tour\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"tour\",\"searchable\":true,\"sortable\":true}},\"first_name\":{\"edit\":{\"label\":\"first_name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"first_name\",\"searchable\":true,\"sortable\":true}},\"surname\":{\"edit\":{\"label\":\"surname\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"surname\",\"searchable\":true,\"sortable\":true}},\"phone\":{\"edit\":{\"label\":\"phone\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"phone\",\"searchable\":true,\"sortable\":true}},\"email\":{\"edit\":{\"label\":\"email\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"email\",\"searchable\":true,\"sortable\":true}},\"adults\":{\"edit\":{\"label\":\"adults\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"adults\",\"searchable\":true,\"sortable\":true}},\"children\":{\"edit\":{\"label\":\"children\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"children\",\"searchable\":true,\"sortable\":true}},\"city\":{\"edit\":{\"label\":\"city\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"city\",\"searchable\":true,\"sortable\":true}},\"travel_date\":{\"edit\":{\"label\":\"travel_date\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"travel_date\",\"searchable\":true,\"sortable\":true}},\"message\":{\"edit\":{\"label\":\"message\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"message\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"tour\",\"first_name\",\"surname\"],\"edit\":[[{\"name\":\"tour\",\"size\":6},{\"name\":\"first_name\",\"size\":6}],[{\"name\":\"surname\",\"size\":6},{\"name\":\"phone\",\"size\":4}],[{\"name\":\"email\",\"size\":6},{\"name\":\"adults\",\"size\":4}],[{\"name\":\"children\",\"size\":4},{\"name\":\"city\",\"size\":6}],[{\"name\":\"travel_date\",\"size\":4},{\"name\":\"message\",\"size\":6}]]},\"uid\":\"api::tour-booking.tour-booking\"}', 'object', NULL, NULL),
(33, 'plugin_content_manager_configuration_content_types::api::query.query', '{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"full_name\",\"defaultSortBy\":\"full_name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"full_name\":{\"edit\":{\"label\":\"full_name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"full_name\",\"searchable\":true,\"sortable\":true}},\"subject\":{\"edit\":{\"label\":\"subject\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"subject\",\"searchable\":true,\"sortable\":true}},\"message\":{\"edit\":{\"label\":\"message\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"message\",\"searchable\":true,\"sortable\":true}},\"email\":{\"edit\":{\"label\":\"email\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"email\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"full_name\",\"subject\",\"message\"],\"edit\":[[{\"name\":\"full_name\",\"size\":6},{\"name\":\"subject\",\"size\":6}],[{\"name\":\"message\",\"size\":6},{\"name\":\"email\",\"size\":6}]]},\"uid\":\"api::query.query\"}', 'object', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `strapi_database_schema`
--

CREATE TABLE `strapi_database_schema` (
  `id` int(10) UNSIGNED NOT NULL,
  `schema` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`schema`)),
  `time` datetime DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `strapi_database_schema`
--

INSERT INTO `strapi_database_schema` (`id`, `schema`, `time`, `hash`) VALUES
(36, '{\"tables\":[{\"name\":\"strapi_core_store_settings\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"key\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"value\",\"type\":\"text\",\"args\":[\"longtext\"],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"environment\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"tag\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"strapi_webhooks\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"url\",\"type\":\"text\",\"args\":[\"longtext\"],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"headers\",\"type\":\"jsonb\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"events\",\"type\":\"jsonb\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"enabled\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"admin_permissions\",\"indexes\":[{\"name\":\"admin_permissions_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"admin_permissions_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"admin_permissions_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"admin_permissions_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"action\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"action_parameters\",\"type\":\"jsonb\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"subject\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"properties\",\"type\":\"jsonb\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"conditions\",\"type\":\"jsonb\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"admin_users\",\"indexes\":[{\"name\":\"admin_users_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"admin_users_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"admin_users_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"admin_users_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"firstname\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"lastname\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"username\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"email\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"password\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"reset_password_token\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"registration_token\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"is_active\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"blocked\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"prefered_language\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"admin_roles\",\"indexes\":[{\"name\":\"admin_roles_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"admin_roles_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"admin_roles_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"admin_roles_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"code\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"description\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"strapi_api_tokens\",\"indexes\":[{\"name\":\"strapi_api_tokens_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"strapi_api_tokens_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"strapi_api_tokens_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"strapi_api_tokens_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"description\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"access_key\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"last_used_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"expires_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"lifespan\",\"type\":\"bigInteger\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"strapi_api_token_permissions\",\"indexes\":[{\"name\":\"strapi_api_token_permissions_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"strapi_api_token_permissions_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"strapi_api_token_permissions_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"strapi_api_token_permissions_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"action\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"strapi_transfer_tokens\",\"indexes\":[{\"name\":\"strapi_transfer_tokens_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"strapi_transfer_tokens_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"strapi_transfer_tokens_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"strapi_transfer_tokens_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"description\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"access_key\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"last_used_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"expires_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"lifespan\",\"type\":\"bigInteger\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"strapi_transfer_token_permissions\",\"indexes\":[{\"name\":\"strapi_transfer_token_permissions_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"strapi_transfer_token_permissions_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"strapi_transfer_token_permissions_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"strapi_transfer_token_permissions_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"action\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"files\",\"indexes\":[{\"name\":\"upload_files_folder_path_index\",\"columns\":[\"folder_path\"],\"type\":null},{\"name\":\"upload_files_created_at_index\",\"columns\":[\"created_at\"],\"type\":null},{\"name\":\"upload_files_updated_at_index\",\"columns\":[\"updated_at\"],\"type\":null},{\"name\":\"upload_files_name_index\",\"columns\":[\"name\"],\"type\":null},{\"name\":\"upload_files_size_index\",\"columns\":[\"size\"],\"type\":null},{\"name\":\"upload_files_ext_index\",\"columns\":[\"ext\"],\"type\":null},{\"name\":\"files_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"files_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"files_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"files_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"alternative_text\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"caption\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"width\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"height\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"formats\",\"type\":\"jsonb\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"hash\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"ext\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"mime\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"size\",\"type\":\"decimal\",\"args\":[10,2],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"url\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"preview_url\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"provider\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"provider_metadata\",\"type\":\"jsonb\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"folder_path\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"upload_folders\",\"indexes\":[{\"name\":\"upload_folders_path_id_index\",\"columns\":[\"path_id\"],\"type\":\"unique\"},{\"name\":\"upload_folders_path_index\",\"columns\":[\"path\"],\"type\":\"unique\"},{\"name\":\"upload_folders_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"upload_folders_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"upload_folders_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"upload_folders_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"path_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"path\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"strapi_releases\",\"indexes\":[{\"name\":\"strapi_releases_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"strapi_releases_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"strapi_releases_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"strapi_releases_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"released_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"scheduled_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"timezone\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"status\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"strapi_release_actions\",\"indexes\":[{\"name\":\"strapi_release_actions_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"strapi_release_actions_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"strapi_release_actions_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"strapi_release_actions_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"target_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"target_type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"content_type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"locale\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"is_entry_valid\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"up_permissions\",\"indexes\":[{\"name\":\"up_permissions_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"up_permissions_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"up_permissions_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"up_permissions_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"action\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"up_roles\",\"indexes\":[{\"name\":\"up_roles_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"up_roles_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"up_roles_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"up_roles_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"description\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"up_users\",\"indexes\":[{\"name\":\"up_users_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"up_users_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"up_users_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"up_users_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"username\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"email\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"provider\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"password\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"reset_password_token\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"confirmation_token\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"confirmed\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"blocked\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"first_name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"middle_name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"surname\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"dob\",\"type\":\"date\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"i18n_locale\",\"indexes\":[{\"name\":\"i18n_locale_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"i18n_locale_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"i18n_locale_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"i18n_locale_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"code\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"activities\",\"indexes\":[{\"name\":\"activities_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"activities_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"activities_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"activities_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"activity\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"published_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"employees\",\"indexes\":[{\"name\":\"employees_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"employees_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"employees_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"employees_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"role\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"social_link\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"published_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"queries\",\"indexes\":[{\"name\":\"queries_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"queries_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"queries_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"queries_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"full_name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"subject\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"message\",\"type\":\"text\",\"args\":[\"longtext\"],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"email\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"reviews\",\"indexes\":[{\"name\":\"reviews_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"reviews_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"reviews_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"reviews_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"rating\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"body\",\"type\":\"text\",\"args\":[\"longtext\"],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"tourid\",\"type\":\"bigInteger\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"first_name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"surname\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"username\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"tours\",\"indexes\":[{\"name\":\"tours_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"tours_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"tours_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"tours_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"title\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"description\",\"type\":\"text\",\"args\":[\"longtext\"],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"ideal_dates\",\"type\":\"jsonb\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"disclaimer\",\"type\":\"jsonb\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"cancellations\",\"type\":\"jsonb\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"days\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"nights\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"cancellation_conclusion\",\"type\":\"text\",\"args\":[\"longtext\"],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"country\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"continent\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"status\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"published_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"tour_bookings\",\"indexes\":[{\"name\":\"tour_bookings_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"tour_bookings_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"tour_bookings_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"tour_bookings_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"tour\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"first_name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"surname\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"phone\",\"type\":\"bigInteger\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"email\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"adults\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"children\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"city\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"travel_date\",\"type\":\"date\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"message\",\"type\":\"text\",\"args\":[\"longtext\"],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"admin_permissions_role_links\",\"indexes\":[{\"name\":\"admin_permissions_role_links_fk\",\"columns\":[\"permission_id\"]},{\"name\":\"admin_permissions_role_links_inv_fk\",\"columns\":[\"role_id\"]},{\"name\":\"admin_permissions_role_links_unique\",\"columns\":[\"permission_id\",\"role_id\"],\"type\":\"unique\"},{\"name\":\"admin_permissions_role_links_order_inv_fk\",\"columns\":[\"permission_order\"]}],\"foreignKeys\":[{\"name\":\"admin_permissions_role_links_fk\",\"columns\":[\"permission_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"admin_permissions\",\"onDelete\":\"CASCADE\"},{\"name\":\"admin_permissions_role_links_inv_fk\",\"columns\":[\"role_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"admin_roles\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"permission_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"role_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"permission_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"admin_users_roles_links\",\"indexes\":[{\"name\":\"admin_users_roles_links_fk\",\"columns\":[\"user_id\"]},{\"name\":\"admin_users_roles_links_inv_fk\",\"columns\":[\"role_id\"]},{\"name\":\"admin_users_roles_links_unique\",\"columns\":[\"user_id\",\"role_id\"],\"type\":\"unique\"},{\"name\":\"admin_users_roles_links_order_fk\",\"columns\":[\"role_order\"]},{\"name\":\"admin_users_roles_links_order_inv_fk\",\"columns\":[\"user_order\"]}],\"foreignKeys\":[{\"name\":\"admin_users_roles_links_fk\",\"columns\":[\"user_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"admin_users\",\"onDelete\":\"CASCADE\"},{\"name\":\"admin_users_roles_links_inv_fk\",\"columns\":[\"role_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"admin_roles\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"user_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"role_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"role_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"user_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"strapi_api_token_permissions_token_links\",\"indexes\":[{\"name\":\"strapi_api_token_permissions_token_links_fk\",\"columns\":[\"api_token_permission_id\"]},{\"name\":\"strapi_api_token_permissions_token_links_inv_fk\",\"columns\":[\"api_token_id\"]},{\"name\":\"strapi_api_token_permissions_token_links_unique\",\"columns\":[\"api_token_permission_id\",\"api_token_id\"],\"type\":\"unique\"},{\"name\":\"strapi_api_token_permissions_token_links_order_inv_fk\",\"columns\":[\"api_token_permission_order\"]}],\"foreignKeys\":[{\"name\":\"strapi_api_token_permissions_token_links_fk\",\"columns\":[\"api_token_permission_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"strapi_api_token_permissions\",\"onDelete\":\"CASCADE\"},{\"name\":\"strapi_api_token_permissions_token_links_inv_fk\",\"columns\":[\"api_token_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"strapi_api_tokens\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"api_token_permission_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"api_token_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"api_token_permission_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"strapi_transfer_token_permissions_token_links\",\"indexes\":[{\"name\":\"strapi_transfer_token_permissions_token_links_fk\",\"columns\":[\"transfer_token_permission_id\"]},{\"name\":\"strapi_transfer_token_permissions_token_links_inv_fk\",\"columns\":[\"transfer_token_id\"]},{\"name\":\"strapi_transfer_token_permissions_token_links_unique\",\"columns\":[\"transfer_token_permission_id\",\"transfer_token_id\"],\"type\":\"unique\"},{\"name\":\"strapi_transfer_token_permissions_token_links_order_inv_fk\",\"columns\":[\"transfer_token_permission_order\"]}],\"foreignKeys\":[{\"name\":\"strapi_transfer_token_permissions_token_links_fk\",\"columns\":[\"transfer_token_permission_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"strapi_transfer_token_permissions\",\"onDelete\":\"CASCADE\"},{\"name\":\"strapi_transfer_token_permissions_token_links_inv_fk\",\"columns\":[\"transfer_token_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"strapi_transfer_tokens\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"transfer_token_permission_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"transfer_token_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"transfer_token_permission_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"files_related_morphs\",\"indexes\":[{\"name\":\"files_related_morphs_fk\",\"columns\":[\"file_id\"]},{\"name\":\"files_related_morphs_order_index\",\"columns\":[\"order\"]},{\"name\":\"files_related_morphs_id_column_index\",\"columns\":[\"related_id\"]}],\"foreignKeys\":[{\"name\":\"files_related_morphs_fk\",\"columns\":[\"file_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"files\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"file_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"related_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"related_type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"field\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"files_folder_links\",\"indexes\":[{\"name\":\"files_folder_links_fk\",\"columns\":[\"file_id\"]},{\"name\":\"files_folder_links_inv_fk\",\"columns\":[\"folder_id\"]},{\"name\":\"files_folder_links_unique\",\"columns\":[\"file_id\",\"folder_id\"],\"type\":\"unique\"},{\"name\":\"files_folder_links_order_inv_fk\",\"columns\":[\"file_order\"]}],\"foreignKeys\":[{\"name\":\"files_folder_links_fk\",\"columns\":[\"file_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"files\",\"onDelete\":\"CASCADE\"},{\"name\":\"files_folder_links_inv_fk\",\"columns\":[\"folder_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"upload_folders\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"file_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"folder_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"file_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"upload_folders_parent_links\",\"indexes\":[{\"name\":\"upload_folders_parent_links_fk\",\"columns\":[\"folder_id\"]},{\"name\":\"upload_folders_parent_links_inv_fk\",\"columns\":[\"inv_folder_id\"]},{\"name\":\"upload_folders_parent_links_unique\",\"columns\":[\"folder_id\",\"inv_folder_id\"],\"type\":\"unique\"},{\"name\":\"upload_folders_parent_links_order_inv_fk\",\"columns\":[\"folder_order\"]}],\"foreignKeys\":[{\"name\":\"upload_folders_parent_links_fk\",\"columns\":[\"folder_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"upload_folders\",\"onDelete\":\"CASCADE\"},{\"name\":\"upload_folders_parent_links_inv_fk\",\"columns\":[\"inv_folder_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"upload_folders\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"folder_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"inv_folder_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"folder_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"strapi_release_actions_release_links\",\"indexes\":[{\"name\":\"strapi_release_actions_release_links_fk\",\"columns\":[\"release_action_id\"]},{\"name\":\"strapi_release_actions_release_links_inv_fk\",\"columns\":[\"release_id\"]},{\"name\":\"strapi_release_actions_release_links_unique\",\"columns\":[\"release_action_id\",\"release_id\"],\"type\":\"unique\"},{\"name\":\"strapi_release_actions_release_links_order_inv_fk\",\"columns\":[\"release_action_order\"]}],\"foreignKeys\":[{\"name\":\"strapi_release_actions_release_links_fk\",\"columns\":[\"release_action_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"strapi_release_actions\",\"onDelete\":\"CASCADE\"},{\"name\":\"strapi_release_actions_release_links_inv_fk\",\"columns\":[\"release_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"strapi_releases\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"release_action_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"release_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"release_action_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"up_permissions_role_links\",\"indexes\":[{\"name\":\"up_permissions_role_links_fk\",\"columns\":[\"permission_id\"]},{\"name\":\"up_permissions_role_links_inv_fk\",\"columns\":[\"role_id\"]},{\"name\":\"up_permissions_role_links_unique\",\"columns\":[\"permission_id\",\"role_id\"],\"type\":\"unique\"},{\"name\":\"up_permissions_role_links_order_inv_fk\",\"columns\":[\"permission_order\"]}],\"foreignKeys\":[{\"name\":\"up_permissions_role_links_fk\",\"columns\":[\"permission_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"up_permissions\",\"onDelete\":\"CASCADE\"},{\"name\":\"up_permissions_role_links_inv_fk\",\"columns\":[\"role_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"up_roles\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"permission_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"role_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"permission_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"up_users_role_links\",\"indexes\":[{\"name\":\"up_users_role_links_fk\",\"columns\":[\"user_id\"]},{\"name\":\"up_users_role_links_inv_fk\",\"columns\":[\"role_id\"]},{\"name\":\"up_users_role_links_unique\",\"columns\":[\"user_id\",\"role_id\"],\"type\":\"unique\"},{\"name\":\"up_users_role_links_order_inv_fk\",\"columns\":[\"user_order\"]}],\"foreignKeys\":[{\"name\":\"up_users_role_links_fk\",\"columns\":[\"user_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"up_users\",\"onDelete\":\"CASCADE\"},{\"name\":\"up_users_role_links_inv_fk\",\"columns\":[\"role_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"up_roles\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"user_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"role_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"user_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"activities_tours_links\",\"indexes\":[{\"name\":\"activities_tours_links_fk\",\"columns\":[\"activity_id\"]},{\"name\":\"activities_tours_links_inv_fk\",\"columns\":[\"tour_id\"]},{\"name\":\"activities_tours_links_unique\",\"columns\":[\"activity_id\",\"tour_id\"],\"type\":\"unique\"},{\"name\":\"activities_tours_links_order_fk\",\"columns\":[\"tour_order\"]},{\"name\":\"activities_tours_links_order_inv_fk\",\"columns\":[\"activity_order\"]}],\"foreignKeys\":[{\"name\":\"activities_tours_links_fk\",\"columns\":[\"activity_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"activities\",\"onDelete\":\"CASCADE\"},{\"name\":\"activities_tours_links_inv_fk\",\"columns\":[\"tour_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"tours\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"activity_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"tour_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"tour_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"activity_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]}]}', '2024-04-25 16:13:56', '82f722831976504f7737db0f1c649d85');

-- --------------------------------------------------------

--
-- Table structure for table `strapi_migrations`
--

CREATE TABLE `strapi_migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `strapi_releases`
--

CREATE TABLE `strapi_releases` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `released_at` datetime(6) DEFAULT NULL,
  `scheduled_at` datetime(6) DEFAULT NULL,
  `timezone` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_by_id` int(10) UNSIGNED DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `strapi_release_actions`
--

CREATE TABLE `strapi_release_actions` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `target_id` int(10) UNSIGNED DEFAULT NULL,
  `target_type` varchar(255) DEFAULT NULL,
  `content_type` varchar(255) DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_by_id` int(10) UNSIGNED DEFAULT NULL,
  `is_entry_valid` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `strapi_release_actions_release_links`
--

CREATE TABLE `strapi_release_actions_release_links` (
  `id` int(10) UNSIGNED NOT NULL,
  `release_action_id` int(10) UNSIGNED DEFAULT NULL,
  `release_id` int(10) UNSIGNED DEFAULT NULL,
  `release_action_order` double UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `strapi_transfer_tokens`
--

CREATE TABLE `strapi_transfer_tokens` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `access_key` varchar(255) DEFAULT NULL,
  `last_used_at` datetime(6) DEFAULT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `lifespan` bigint(20) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_by_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `strapi_transfer_token_permissions`
--

CREATE TABLE `strapi_transfer_token_permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `action` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_by_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `strapi_transfer_token_permissions_token_links`
--

CREATE TABLE `strapi_transfer_token_permissions_token_links` (
  `id` int(10) UNSIGNED NOT NULL,
  `transfer_token_permission_id` int(10) UNSIGNED DEFAULT NULL,
  `transfer_token_id` int(10) UNSIGNED DEFAULT NULL,
  `transfer_token_permission_order` double UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `strapi_webhooks`
--

CREATE TABLE `strapi_webhooks` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `url` longtext DEFAULT NULL,
  `headers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`headers`)),
  `events` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`events`)),
  `enabled` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tours`
--

CREATE TABLE `tours` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `ideal_dates` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`ideal_dates`)),
  `disclaimer` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`disclaimer`)),
  `cancellations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`cancellations`)),
  `days` int(11) DEFAULT NULL,
  `nights` int(11) DEFAULT NULL,
  `cancellation_conclusion` longtext DEFAULT NULL,
  `continent` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_by_id` int(10) UNSIGNED DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tours`
--

INSERT INTO `tours` (`id`, `title`, `description`, `ideal_dates`, `disclaimer`, `cancellations`, `days`, `nights`, `cancellation_conclusion`, `continent`, `country`, `created_at`, `updated_at`, `published_at`, `created_by_id`, `updated_by_id`, `status`) VALUES
(1, 'Southern Kenya Circuit', 'Experience the best of Southern Kenya\'s renowned parks and reserves, including Lake Nakuru, Maasai Mara, Amboseli, and Tsavo. Witness the Great Migration, diverse wildlife, iconic landscapes, and cultural encounters. Engage with Maasai communities, explore volcanic landscapes, and immerse yourself in Kenya\'s rich biodiversity, cultural heritage, and scenic beauty.', '{\"Wilde Beast Migration : mid Jul - Late Aug\":\"Wilde Beast Migration : mid Jul - Late Aug\",\"High Peak in Drier Months (Jun - Oct and Jan - Feb)\":\"High Peak in Drier Months (Jun - Oct and Jan - Feb)\",\"Bird Watching in Lake Nakuru from Jan - Feb\":\"Bird Watching in Lake Nakuru from Jan - Feb\"}', '{\"Price_Fluctuation\":\"Please note that tour package prices are subject to fluctuation based on factors such as the time of year (low and high tourist seasons), exchange rates, fluctuating accommodation rates, government tax rates, and other external factors. For the most current pricing and availability, kindly consult our travel consultants.\",\"Travel_Documentation\":\"Participants are responsible for obtaining necessary travel documentation, including visas, passports, permits, and complying with applicable laws and regulations. We do offer assistance in obtaining this legal Documents.\",\"Transportation\":\"Transportation from the pick up point and back is catered for within the package. However, your means of transportation to (before the tour begins) and from the pick up point (after the tour end) is your responsibility. Do not hesitate to state if you need assistance with said transportation in the booking form.\",\"Appreciation\":\"We appreciate your understanding.\"}', '{\"60+\":\"60+: A cancellation fee of 10% of the total booking cost will apply.\",\"30-59\":\"30-59: A cancellation fee of 25% of the total booking cost will apply.\",\"15-29\":\"15-29: A cancellation fee of 50% of the total booking cost will apply.\",\"0-14\":\"0-14: No refund applicable if cancellation occurs within 0-14 days before departure.\"}', 8, 7, 'We encourage our customers to review the Terms and Conditions page carefully and consider purchasing travel insurance to mitigate potential financial risks associated with unforeseen cancellations. For more information or assistance, please contact us.', 'africa', 'Kenya', '2024-03-04 07:56:06.653000', '2024-03-08 12:14:38.106000', '2024-03-04 07:56:08.056000', 1, 1, 'popular'),
(2, 'Central Kenya Circuit', 'Explore the diverse landscapes and wildlife of Central Kenya, featuring Aberdare National Park, Mount Kenya, and Samburu Reserve. Witness unique flora and fauna, engage in game drives, and explore diverse ecosystems. Experience traditional cultures, stunning mountain landscapes, and wildlife encounters, offering a blend of adventure, relaxation, and cultural immersion.', '{\"Bird Watching in Mt. Kenya: Dry months (Jan - Feb and Jun - Sep)\":\"Bird Watching in Mt. Kenya: Dry months (Jan - Feb and Jun - Sep)\",\"Aberdare Hiking during dry months (Jun - Oct and Dec - Feb)\":\"Aberdare Hiking during dry months (Jun - Oct and Dec - Feb)\"}', '{\"Price_Fluctuation\":\"Please note that tour package prices are subject to fluctuation based on factors such as the time of year (low and high tourist seasons), exchange rates, fluctuating accommodation rates, government tax rates, and other external factors. For the most current pricing and availability, kindly consult our travel consultants.\",\"Travel_Documentation\":\"Participants are responsible for obtaining necessary travel documentation, including visas, passports, permits, and complying with applicable laws and regulations. We do offer assistance in obtaining this legal Documents.\",\"Transportation\":\"Transportation from the pick up point and back is catered for within the package. However, your means of transportation to (before the tour begins) and from the pick up point (after the tour end) is your responsibility. Do not hesitate to state if you need assistance with said transportation in the booking form.\",\"Appreciation\":\"We appreciate your understanding.\"}', '{\"60+\":\"60+: A cancellation fee of 10% of the total booking cost will apply.\",\"30-59\":\"30-59: A cancellation fee of 25% of the total booking cost will apply.\",\"15-29\":\"15-29: A cancellation fee of 50% of the total booking cost will apply.\",\"0-14\":\"0-14: No refund applicable if cancellation occurs within 0-14 days before departure.\"}', 7, 6, 'We encourage our customers to review the Terms and Conditions page carefully and consider purchasing travel insurance to mitigate potential financial risks associated with unforeseen cancellations. For more information or assistance, please contact us.', 'africa', 'Kenya', '2024-03-04 08:01:43.470000', '2024-03-08 12:15:51.774000', '2024-03-05 17:24:16.987000', 1, 1, 'popular'),
(3, 'Schengen Quest', 'Embark on a cultural odyssey across Europe with \"The Schengen Quest\" tour package. Spanning Barcelona\'s rich culture and culinary delights to the picturesque landscapes of Graubünden for hiking and sightseeing, delve into the history and castles of Hamburg, savor the finest wine and cuisine in Champagne, and conclude your journey in the enchanting city of Paris. This 2-day, 1-night adventure in each society promises a harmonious blend of diverse experiences, from vibrant city life to serene castle surroundings.', '{\"Summer Months for good weather(Jun - August)\":\"Summer Months for good weather(Jun - August)\",\"Low Crowds with midl weather during spring anf autumn\":\"Low Crowds with midl weather during spring anf autumn\"}', '{\"Price_Fluctuation\":\"Please note that tour package prices are subject to fluctuation based on factors such as the time of year (low and high tourist seasons), exchange rates, fluctuating accommodation rates, government tax rates, and other external factors. For the most current pricing and availability, kindly consult our travel consultants.\",\"Travel_Documentation\":\"Participants are responsible for obtaining necessary travel documentation, including visas, passports, permits, and complying with applicable laws and regulations. We do offer assistance in obtaining this legal Documents.\",\"Transportation\":\"Transportation from the pick up point and back is catered for within the package. However, your means of transportation to (before the tour begins) and from the pick up point (after the tour end) is your responsibility. Do not hesitate to state if you need assistance with said transportation in the booking form.\",\"Appreciation\":\"We appreciate your understanding.\"}', '{\"60+\":\"60+: A cancellation fee of 10% of the total booking cost will apply.\",\"30-59\":\"30-59: A cancellation fee of 25% of the total booking cost will apply.\",\"15-29\":\"15-29: A cancellation fee of 50% of the total booking cost will apply.\",\"0-14\":\"0-14: No refund applicable if cancellation occurs within 0-14 days before departure.\"}', 10, 9, 'We encourage our customers to review the Terms and Conditions page carefully and consider purchasing travel insurance to mitigate potential financial risks associated with unforeseen cancellations. For more information or assistance, please contact us.', 'europe', 'EU', '2024-03-04 08:06:43.125000', '2024-03-08 12:16:21.422000', '2024-03-05 17:24:22.342000', 1, 1, 'featured'),
(4, 'Northern Tanzania', 'Embark on a captivating journey through Northern Tanzania\'s iconic destinations, including Serengeti National Park, Ngorongoro Conservation Area, and Mount Kilimanjaro. Witness the Great Migration, diverse wildlife, and stunning landscapes. Engage with Maasai communities, explore volcanic craters, and immerse yourself in Tanzania\'s rich biodiversity, cultural heritage, and scenic beauty.', '{\"Hiking Kilimanjaro - Dry Seasons (Jan - Mar & Jun - Oct)\":\"Hiking Kilimanjaro - Dry Seasons (Jan - Mar & Jun - Oct)\",\"Serengeti Wildebeast Calving (Jan & Feb)\":\"Serengeti Wildebeast Calving (Jan & Feb)\",\"Mara River crossing (Mid Aug- Late Sept)\":\"Mara River crossing (Mid Aug- Late Sept)\"}', '{\"Price_Fluctuation\":\"Please note that tour package prices are subject to fluctuation based on factors such as the time of year (low and high tourist seasons), exchange rates, fluctuating accommodation rates, government tax rates, and other external factors. For the most current pricing and availability, kindly consult our travel consultants.\",\"Travel_Documentation\":\"Participants are responsible for obtaining necessary travel documentation, including visas, passports, permits, and complying with applicable laws and regulations. We do offer assistance in obtaining this legal Documents.\",\"Transportation\":\"Transportation from the pick up point and back is catered for within the package. However, your means of transportation to (before the tour begins) and from the pick up point (after the tour end) is your responsibility. Do not hesitate to state if you need assistance with said transportation in the booking form.\",\"Appreciation\":\"We appreciate your understanding.\"}', '{\"60+\":\"60+: A cancellation fee of 10% of the total booking cost will apply.\",\"30-59\":\"30-59: A cancellation fee of 25% of the total booking cost will apply.\",\"15-29\":\"15-29: A cancellation fee of 50% of the total booking cost will apply.\",\"0-14\":\"0-14: No refund applicable if cancellation occurs within 0-14 days before departure.\"}', 7, 6, 'We encourage our customers to review the Terms and Conditions page carefully and consider purchasing travel insurance to mitigate potential financial risks associated with unforeseen cancellations. For more information or assistance, please contact us.', 'Africa', 'Tanzania', '2024-03-04 08:15:19.862000', '2024-03-05 17:24:12.193000', '2024-03-05 17:24:12.189000', 1, 1, NULL),
(5, 'Cape Town', 'Immerse yourself in the breathtaking landscapes and diverse experiences of Cape Town. From exploring nearby national parks with terrestrial and marine wonders to scenic hikes along the iconic Table Mountain, this 8-day, 7-night itinerary promises an unforgettable journey. Discover the vibrant city life, pristine beaches, and the cultural richness of Cape Town. Unwind in luxurious accommodations, venture into the nearby national parks, and bask in the beauty of this South African gem.', '{\"High Peak in summer months i.e Dec - Feb.\":\"High Peak in summer months i.e Dec - Feb.\",\"Low peak during winter months i.e June - August\":\"Low peak during winter months i.e June - August\",\"Sweet spot - March. Lesser Tourists with okay weather\":\"Sweet spot - March. Lesser Tourists with okay weather\"}', '{\"Price_Fluctuation\":\"Please note that tour package prices are subject to fluctuation based on factors such as the time of year (low and high tourist seasons), exchange rates, fluctuating accommodation rates, government tax rates, and other external factors. For the most current pricing and availability, kindly consult our travel consultants.\",\"Travel_Documentation\":\"Participants are responsible for obtaining necessary travel documentation, including visas, passports, permits, and complying with applicable laws and regulations. We do offer assistance in obtaining this legal Documents.\",\"Transportation\":\"Transportation from the pick up point and back is catered for within the package. However, your means of transportation to (before the tour begins) and from the pick up point (after the tour end) is your responsibility. Do not hesitate to state if you need assistance with said transportation in the booking form.\",\"Appreciation\":\"We appreciate your understanding.\"}', '{\"60+\":\"60+: A cancellation fee of 10% of the total booking cost will apply.\",\"30-59\":\"30-59: A cancellation fee of 25% of the total booking cost will apply.\",\"15-29\":\"15-29: A cancellation fee of 50% of the total booking cost will apply.\",\"0-14\":\"0-14: No refund applicable if cancellation occurs within 0-14 days before departure.\"}', 8, 7, 'We encourage our customers to review the Terms and Conditions page carefully and consider purchasing travel insurance to mitigate potential financial risks associated with unforeseen cancellations. For more information or assistance, please contact us.', 'Africa', 'South Africa', '2024-03-04 08:18:46.572000', '2024-03-05 17:24:04.035000', '2024-03-05 17:24:04.031000', 1, 1, NULL),
(6, 'Dubai Extravaganza', 'Embark on a luxurious adventure in the vibrant city of Dubai. Witness the iconic Burj Khalifa, explore the mega-malls, and stroll along the glamorous Dubai Marina. Indulge in thrilling desert safaris, experience the exhilarating vibes of the city\'s cultural districts, and unwind on pristine beaches. This 7-day, 6-night journey promises a fusion of modernity and tradition, from sky-high marvels to traditional souks, creating an unforgettable experience in the heart of the Middle East.', '{\"Winter Months (Northern Hemisphere) for outdoor activities and events\":\"Winter Months (Northern Hemisphere) for outdoor activities and events\",\"May, September & October for Hot Beach Holidays\":\"May, September & October for Hot Beach Holidays\"}', '{\"Price_Fluctuation\":\"Please note that tour package prices are subject to fluctuation based on factors such as the time of year (low and high tourist seasons), exchange rates, fluctuating accommodation rates, government tax rates, and other external factors. For the most current pricing and availability, kindly consult our travel consultants.\",\"Travel_Documentation\":\"Participants are responsible for obtaining necessary travel documentation, including visas, passports, permits, and complying with applicable laws and regulations. We do offer assistance in obtaining this legal Documents.\",\"Transportation\":\"Transportation from the pick up point and back is catered for within the package. However, your means of transportation to (before the tour begins) and from the pick up point (after the tour end) is your responsibility. Do not hesitate to state if you need assistance with said transportation in the booking form.\",\"Appreciation\":\"We appreciate your understanding.\"}', '{\"60+\":\"60+: A cancellation fee of 10% of the total booking cost will apply.\",\"30-59\":\"30-59: A cancellation fee of 25% of the total booking cost will apply.\",\"15-29\":\"15-29: A cancellation fee of 50% of the total booking cost will apply.\",\"0-14\":\"0-14: No refund applicable if cancellation occurs within 0-14 days before departure.\"}', 7, 6, 'We encourage our customers to review the Terms and Conditions page carefully and consider purchasing travel insurance to mitigate potential financial risks associated with unforeseen cancellations. For more information or assistance, please contact us.', 'Asia', 'U.A.E', '2024-03-04 08:26:29.624000', '2024-03-05 17:24:07.698000', '2024-03-05 17:24:07.694000', 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tour_bookings`
--

CREATE TABLE `tour_bookings` (
  `id` int(10) UNSIGNED NOT NULL,
  `tour` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `phone` bigint(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `adults` int(11) DEFAULT NULL,
  `children` int(11) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `travel_date` date DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_by_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tour_bookings`
--

INSERT INTO `tour_bookings` (`id`, `tour`, `first_name`, `surname`, `phone`, `email`, `adults`, `children`, `city`, `travel_date`, `message`, `created_at`, `updated_at`, `created_by_id`, `updated_by_id`) VALUES
(3, 'Cape Town', 'Jotham', 'Oyiro', 114576058, 'jothamoj@gmail.com', 7, 9, 'Nairobi', '2024-06-01', 'welp', '2024-04-25 15:26:47.262000', '2024-04-25 15:26:47.262000', NULL, NULL),
(4, 'Cape Town', 'Jotham', 'Doe', 114576058, 'vizionbnm@gmail.com', 6, 5, 'Nairobi', '2024-07-01', 'welp idk', '2024-04-25 15:33:40.680000', '2024-04-25 15:33:40.680000', NULL, NULL),
(5, '', 'Jotham', 'Doe', 114576058, 'jothamoj@gmail.com', 8, 0, 'Nairobi', '2001-05-01', 'myeam', '2024-04-25 15:50:14.816000', '2024-04-25 15:50:14.816000', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `upload_folders`
--

CREATE TABLE `upload_folders` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `path_id` int(11) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_by_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `upload_folders`
--

INSERT INTO `upload_folders` (`id`, `name`, `path_id`, `path`, `created_at`, `updated_at`, `created_by_id`, `updated_by_id`) VALUES
(1, 'Display Pictures', 1, '/1', '2024-03-06 11:20:02.311000', '2024-03-06 11:20:02.311000', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `upload_folders_parent_links`
--

CREATE TABLE `upload_folders_parent_links` (
  `id` int(10) UNSIGNED NOT NULL,
  `folder_id` int(10) UNSIGNED DEFAULT NULL,
  `inv_folder_id` int(10) UNSIGNED DEFAULT NULL,
  `folder_order` double UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `up_permissions`
--

CREATE TABLE `up_permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `action` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_by_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `up_permissions`
--

INSERT INTO `up_permissions` (`id`, `action`, `created_at`, `updated_at`, `created_by_id`, `updated_by_id`) VALUES
(1, 'plugin::users-permissions.user.me', '2024-03-01 20:19:26.816000', '2024-03-01 20:19:26.816000', NULL, NULL),
(2, 'plugin::users-permissions.auth.changePassword', '2024-03-01 20:19:26.817000', '2024-03-01 20:19:26.817000', NULL, NULL),
(3, 'plugin::users-permissions.auth.callback', '2024-03-01 20:19:26.826000', '2024-03-01 20:19:26.826000', NULL, NULL),
(4, 'plugin::users-permissions.auth.connect', '2024-03-01 20:19:26.826000', '2024-03-01 20:19:26.826000', NULL, NULL),
(5, 'plugin::users-permissions.auth.forgotPassword', '2024-03-01 20:19:26.826000', '2024-03-01 20:19:26.826000', NULL, NULL),
(6, 'plugin::users-permissions.auth.resetPassword', '2024-03-01 20:19:26.826000', '2024-03-01 20:19:26.826000', NULL, NULL),
(7, 'plugin::users-permissions.auth.register', '2024-03-01 20:19:26.826000', '2024-03-01 20:19:26.826000', NULL, NULL),
(8, 'plugin::users-permissions.auth.emailConfirmation', '2024-03-01 20:19:26.826000', '2024-03-01 20:19:26.826000', NULL, NULL),
(9, 'plugin::users-permissions.auth.sendEmailConfirmation', '2024-03-01 20:19:26.826000', '2024-03-01 20:19:26.826000', NULL, NULL),
(12, 'api::tour.tour.find', '2024-03-04 08:38:26.871000', '2024-03-04 08:38:26.871000', NULL, NULL),
(13, 'api::tour.tour.findOne', '2024-03-04 08:38:26.871000', '2024-03-04 08:38:26.871000', NULL, NULL),
(14, 'plugin::users-permissions.user.find', '2024-03-06 11:01:43.913000', '2024-03-06 11:01:43.913000', NULL, NULL),
(15, 'plugin::users-permissions.user.count', '2024-03-06 11:01:43.913000', '2024-03-06 11:01:43.913000', NULL, NULL),
(16, 'plugin::users-permissions.user.findOne', '2024-03-06 11:01:43.913000', '2024-03-06 11:01:43.913000', NULL, NULL),
(19, 'plugin::users-permissions.user.me', '2024-03-08 14:08:31.173000', '2024-03-08 14:08:31.173000', NULL, NULL),
(24, 'api::tour.tour.find', '2024-03-08 22:02:46.610000', '2024-03-08 22:02:46.610000', NULL, NULL),
(25, 'api::tour.tour.findOne', '2024-03-08 22:02:46.610000', '2024-03-08 22:02:46.610000', NULL, NULL),
(31, 'api::review.review.find', '2024-03-24 18:14:32.670000', '2024-03-24 18:14:32.670000', NULL, NULL),
(32, 'api::review.review.findOne', '2024-03-24 18:14:32.670000', '2024-03-24 18:14:32.670000', NULL, NULL),
(35, 'api::review.review.find', '2024-03-24 18:38:26.602000', '2024-03-24 18:38:26.602000', NULL, NULL),
(36, 'api::review.review.findOne', '2024-03-24 18:38:26.602000', '2024-03-24 18:38:26.602000', NULL, NULL),
(39, 'api::review.review.delete', '2024-03-25 14:49:36.250000', '2024-03-25 14:49:36.250000', NULL, NULL),
(40, 'api::review.custom-review.index', '2024-03-25 14:49:54.089000', '2024-03-25 14:49:54.089000', NULL, NULL),
(43, 'api::review.custom-review.index', '2024-03-25 14:50:14.670000', '2024-03-25 14:50:14.670000', NULL, NULL),
(45, 'api::review.custom-review.find', '2024-03-25 16:15:43.684000', '2024-03-25 16:15:43.684000', NULL, NULL),
(46, 'api::review.custom-review.find', '2024-03-25 16:16:22.699000', '2024-03-25 16:16:22.699000', NULL, NULL),
(47, 'api::review.custom-review.create', '2024-03-26 11:52:51.577000', '2024-03-26 11:52:51.577000', NULL, NULL),
(48, 'api::review.review.create', '2024-03-26 12:09:06.032000', '2024-03-26 12:09:06.032000', NULL, NULL),
(49, 'api::review.custom-review.create', '2024-03-26 12:21:04.103000', '2024-03-26 12:21:04.103000', NULL, NULL),
(51, 'api::activity.activity.find', '2024-03-27 11:35:04.653000', '2024-03-27 11:35:04.653000', NULL, NULL),
(52, 'api::activity.activity.findOne', '2024-03-27 11:35:04.653000', '2024-03-27 11:35:04.653000', NULL, NULL),
(53, 'api::activity.activity.find', '2024-03-27 11:35:12.798000', '2024-03-27 11:35:12.798000', NULL, NULL),
(54, 'api::activity.activity.findOne', '2024-03-27 11:35:12.798000', '2024-03-27 11:35:12.798000', NULL, NULL),
(55, 'api::employee.employee.find', '2024-04-19 11:13:40.469000', '2024-04-19 11:13:40.469000', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `up_permissions_role_links`
--

CREATE TABLE `up_permissions_role_links` (
  `id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED DEFAULT NULL,
  `role_id` int(10) UNSIGNED DEFAULT NULL,
  `permission_order` double UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `up_permissions_role_links`
--

INSERT INTO `up_permissions_role_links` (`id`, `permission_id`, `role_id`, `permission_order`) VALUES
(1, 2, 1, 1),
(2, 1, 1, 1),
(3, 3, 2, 1),
(4, 4, 2, 1),
(5, 5, 2, 1),
(6, 8, 2, 1),
(7, 6, 2, 2),
(8, 9, 2, 2),
(9, 7, 2, 2),
(12, 12, 2, 3),
(13, 13, 2, 4),
(14, 14, 2, 5),
(15, 16, 2, 5),
(16, 15, 2, 5),
(19, 19, 2, 6),
(24, 24, 1, 3),
(25, 25, 1, 4),
(31, 31, 1, 5),
(33, 32, 1, 5),
(35, 35, 2, 7),
(36, 36, 2, 7),
(39, 39, 1, 6),
(41, 40, 1, 7),
(43, 43, 2, 8),
(45, 45, 1, 8),
(46, 46, 2, 9),
(47, 47, 1, 9),
(48, 48, 1, 10),
(49, 49, 2, 10),
(51, 51, 2, 11),
(52, 52, 2, 11),
(53, 53, 1, 11),
(54, 54, 1, 11),
(56, 55, 2, 12);

-- --------------------------------------------------------

--
-- Table structure for table `up_roles`
--

CREATE TABLE `up_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_by_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `up_roles`
--

INSERT INTO `up_roles` (`id`, `name`, `description`, `type`, `created_at`, `updated_at`, `created_by_id`, `updated_by_id`) VALUES
(1, 'Authenticated', 'Default role given to authenticated user.', 'authenticated', '2024-03-01 20:19:26.806000', '2024-04-19 11:14:22.457000', NULL, NULL),
(2, 'Public', 'Default role given to unauthenticated user.', 'public', '2024-03-01 20:19:26.809000', '2024-04-19 11:14:36.257000', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `up_users`
--

CREATE TABLE `up_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `reset_password_token` varchar(255) DEFAULT NULL,
  `confirmation_token` varchar(255) DEFAULT NULL,
  `confirmed` tinyint(1) DEFAULT NULL,
  `blocked` tinyint(1) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_by_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `up_users`
--

INSERT INTO `up_users` (`id`, `username`, `email`, `provider`, `password`, `reset_password_token`, `confirmation_token`, `confirmed`, `blocked`, `first_name`, `middle_name`, `surname`, `dob`, `created_at`, `updated_at`, `created_by_id`, `updated_by_id`) VALUES
(1, 'jami.travel', 'jothamoj@outlook.com', 'local', '$2a$10$MAifDW2eFrSyGswzWfkGl.VKoQ/fOji4Hk2nFytNcILfSvL.1TXBa', NULL, NULL, 1, 0, 'Jotham', 'Oyiro', 'Jami', '2001-05-01', '2024-03-04 08:27:30.984000', '2024-03-08 14:03:11.108000', 1, 1),
(2, 'jane.travels', 'janedoe@gmail.com', 'local', '$2a$10$oQm.RSbPZdVfkJaEXFNCk.HFFi3OPE3MTBNjuEwcpZQ4G3d9ydqum', NULL, NULL, 1, 0, 'Jane', NULL, 'Doe', '1985-03-13', '2024-03-04 08:28:19.155000', '2024-03-08 14:03:31.686000', 1, 1),
(3, 'john.travels', 'johndoe@gmail.com', 'local', '$2a$10$txZ7/.Wi2cHzHapMwu5hc.Fe6aWe0a87zR7LT4HB0vYiKO.q1yhS6', NULL, NULL, 0, 0, 'John', NULL, 'Doe', '1993-03-02', '2024-03-04 08:29:05.625000', '2024-03-08 14:03:55.253000', 1, 1),
(4, 'alex.doe', 'alexdoe@mail.com', 'local', '$2a$10$OTf8nvcb9F1c5gXFk7x1C..VLHFNGRxOb81dieWAaHB1eq/SxLypq', NULL, NULL, 1, 0, 'Alex', NULL, 'Doe', '2001-05-01', '2024-03-04 08:29:36.929000', '2024-03-08 14:02:46.041000', 1, 1),
(5, 'felix.travel', 'felixdoe@test.com', 'local', '$2a$10$QBDjeylNVZzeQXnR3Pi5fOAm3bWJ6OFeZYOz.x5zHZ2q76Awt/Pse', NULL, NULL, 1, 0, 'Felix', 'Mort', 'Doe', '2005-03-05', '2024-03-08 19:45:49.934000', '2024-03-08 19:45:49.934000', NULL, NULL),
(6, 'angelina.doe', 'angelinadoe@test.com', 'local', '$2a$10$Iq/pgfNlyFL.7lQEYp8XouBQsbargp.lswTHY8tJTWjXlJhcfeX8S', NULL, NULL, 1, 0, 'Angelina', '', 'Doe', '2004-05-08', '2024-03-08 19:47:46.268000', '2024-03-08 19:47:46.268000', NULL, NULL),
(7, 'priscilla.doe', 'prisicilladoe@test.com', 'local', '$2a$10$PElA79ehR1OarX81/i99COyuOSwbPsGV6z7cAxRbzu6EZ3jXda1Sq', NULL, NULL, 1, 0, 'Priscilla', '', 'Doe', '2004-05-08', '2024-03-08 19:49:18.416000', '2024-03-08 19:49:18.416000', NULL, NULL),
(8, 'jotham', 'vizionbnm@gmail.com', 'local', '$2a$10$ocU68QhGs5rKNl9qfWqdEeL3U2wOtC20qg2TLCv3KG9UHjS.2f3pK', NULL, NULL, 1, 0, 'Jotham', '', 'Doe', '2001-05-01', '2024-04-25 16:55:00.574000', '2024-04-25 16:55:51.996000', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `up_users_role_links`
--

CREATE TABLE `up_users_role_links` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `role_id` int(10) UNSIGNED DEFAULT NULL,
  `user_order` double UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `up_users_role_links`
--

INSERT INTO `up_users_role_links` (`id`, `user_id`, `role_id`, `user_order`) VALUES
(1, 1, 1, 1),
(2, 2, 1, 2),
(3, 3, 1, 3),
(4, 4, 1, 4),
(5, 5, 1, 5),
(6, 6, 1, 6),
(7, 7, 1, 7),
(8, 8, 1, 8);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activities_created_by_id_fk` (`created_by_id`),
  ADD KEY `activities_updated_by_id_fk` (`updated_by_id`);

--
-- Indexes for table `activities_tours_links`
--
ALTER TABLE `activities_tours_links`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `activities_tours_links_unique` (`activity_id`,`tour_id`),
  ADD KEY `activities_tours_links_fk` (`activity_id`),
  ADD KEY `activities_tours_links_inv_fk` (`tour_id`),
  ADD KEY `activities_tours_links_order_fk` (`tour_order`),
  ADD KEY `activities_tours_links_order_inv_fk` (`activity_order`);

--
-- Indexes for table `admin_permissions`
--
ALTER TABLE `admin_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_permissions_created_by_id_fk` (`created_by_id`),
  ADD KEY `admin_permissions_updated_by_id_fk` (`updated_by_id`);

--
-- Indexes for table `admin_permissions_role_links`
--
ALTER TABLE `admin_permissions_role_links`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_permissions_role_links_unique` (`permission_id`,`role_id`),
  ADD KEY `admin_permissions_role_links_fk` (`permission_id`),
  ADD KEY `admin_permissions_role_links_inv_fk` (`role_id`),
  ADD KEY `admin_permissions_role_links_order_inv_fk` (`permission_order`);

--
-- Indexes for table `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_roles_created_by_id_fk` (`created_by_id`),
  ADD KEY `admin_roles_updated_by_id_fk` (`updated_by_id`);

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_users_created_by_id_fk` (`created_by_id`),
  ADD KEY `admin_users_updated_by_id_fk` (`updated_by_id`);

--
-- Indexes for table `admin_users_roles_links`
--
ALTER TABLE `admin_users_roles_links`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_users_roles_links_unique` (`user_id`,`role_id`),
  ADD KEY `admin_users_roles_links_fk` (`user_id`),
  ADD KEY `admin_users_roles_links_inv_fk` (`role_id`),
  ADD KEY `admin_users_roles_links_order_fk` (`role_order`),
  ADD KEY `admin_users_roles_links_order_inv_fk` (`user_order`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employees_created_by_id_fk` (`created_by_id`),
  ADD KEY `employees_updated_by_id_fk` (`updated_by_id`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `upload_files_folder_path_index` (`folder_path`),
  ADD KEY `upload_files_created_at_index` (`created_at`),
  ADD KEY `upload_files_updated_at_index` (`updated_at`),
  ADD KEY `upload_files_name_index` (`name`),
  ADD KEY `upload_files_size_index` (`size`),
  ADD KEY `upload_files_ext_index` (`ext`),
  ADD KEY `files_created_by_id_fk` (`created_by_id`),
  ADD KEY `files_updated_by_id_fk` (`updated_by_id`);

--
-- Indexes for table `files_folder_links`
--
ALTER TABLE `files_folder_links`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `files_folder_links_unique` (`file_id`,`folder_id`),
  ADD KEY `files_folder_links_fk` (`file_id`),
  ADD KEY `files_folder_links_inv_fk` (`folder_id`),
  ADD KEY `files_folder_links_order_inv_fk` (`file_order`);

--
-- Indexes for table `files_related_morphs`
--
ALTER TABLE `files_related_morphs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `files_related_morphs_fk` (`file_id`),
  ADD KEY `files_related_morphs_order_index` (`order`),
  ADD KEY `files_related_morphs_id_column_index` (`related_id`);

--
-- Indexes for table `i18n_locale`
--
ALTER TABLE `i18n_locale`
  ADD PRIMARY KEY (`id`),
  ADD KEY `i18n_locale_created_by_id_fk` (`created_by_id`),
  ADD KEY `i18n_locale_updated_by_id_fk` (`updated_by_id`);

--
-- Indexes for table `queries`
--
ALTER TABLE `queries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `queries_created_by_id_fk` (`created_by_id`),
  ADD KEY `queries_updated_by_id_fk` (`updated_by_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_created_by_id_fk` (`created_by_id`),
  ADD KEY `reviews_updated_by_id_fk` (`updated_by_id`);

--
-- Indexes for table `strapi_api_tokens`
--
ALTER TABLE `strapi_api_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `strapi_api_tokens_created_by_id_fk` (`created_by_id`),
  ADD KEY `strapi_api_tokens_updated_by_id_fk` (`updated_by_id`);

--
-- Indexes for table `strapi_api_token_permissions`
--
ALTER TABLE `strapi_api_token_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `strapi_api_token_permissions_created_by_id_fk` (`created_by_id`),
  ADD KEY `strapi_api_token_permissions_updated_by_id_fk` (`updated_by_id`);

--
-- Indexes for table `strapi_api_token_permissions_token_links`
--
ALTER TABLE `strapi_api_token_permissions_token_links`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `strapi_api_token_permissions_token_links_unique` (`api_token_permission_id`,`api_token_id`),
  ADD KEY `strapi_api_token_permissions_token_links_fk` (`api_token_permission_id`),
  ADD KEY `strapi_api_token_permissions_token_links_inv_fk` (`api_token_id`),
  ADD KEY `strapi_api_token_permissions_token_links_order_inv_fk` (`api_token_permission_order`);

--
-- Indexes for table `strapi_core_store_settings`
--
ALTER TABLE `strapi_core_store_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `strapi_database_schema`
--
ALTER TABLE `strapi_database_schema`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `strapi_migrations`
--
ALTER TABLE `strapi_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `strapi_releases`
--
ALTER TABLE `strapi_releases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `strapi_releases_created_by_id_fk` (`created_by_id`),
  ADD KEY `strapi_releases_updated_by_id_fk` (`updated_by_id`);

--
-- Indexes for table `strapi_release_actions`
--
ALTER TABLE `strapi_release_actions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `strapi_release_actions_created_by_id_fk` (`created_by_id`),
  ADD KEY `strapi_release_actions_updated_by_id_fk` (`updated_by_id`);

--
-- Indexes for table `strapi_release_actions_release_links`
--
ALTER TABLE `strapi_release_actions_release_links`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `strapi_release_actions_release_links_unique` (`release_action_id`,`release_id`),
  ADD KEY `strapi_release_actions_release_links_fk` (`release_action_id`),
  ADD KEY `strapi_release_actions_release_links_inv_fk` (`release_id`),
  ADD KEY `strapi_release_actions_release_links_order_inv_fk` (`release_action_order`);

--
-- Indexes for table `strapi_transfer_tokens`
--
ALTER TABLE `strapi_transfer_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `strapi_transfer_tokens_created_by_id_fk` (`created_by_id`),
  ADD KEY `strapi_transfer_tokens_updated_by_id_fk` (`updated_by_id`);

--
-- Indexes for table `strapi_transfer_token_permissions`
--
ALTER TABLE `strapi_transfer_token_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `strapi_transfer_token_permissions_created_by_id_fk` (`created_by_id`),
  ADD KEY `strapi_transfer_token_permissions_updated_by_id_fk` (`updated_by_id`);

--
-- Indexes for table `strapi_transfer_token_permissions_token_links`
--
ALTER TABLE `strapi_transfer_token_permissions_token_links`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `strapi_transfer_token_permissions_token_links_unique` (`transfer_token_permission_id`,`transfer_token_id`),
  ADD KEY `strapi_transfer_token_permissions_token_links_fk` (`transfer_token_permission_id`),
  ADD KEY `strapi_transfer_token_permissions_token_links_inv_fk` (`transfer_token_id`),
  ADD KEY `strapi_transfer_token_permissions_token_links_order_inv_fk` (`transfer_token_permission_order`);

--
-- Indexes for table `strapi_webhooks`
--
ALTER TABLE `strapi_webhooks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tours`
--
ALTER TABLE `tours`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tours_created_by_id_fk` (`created_by_id`),
  ADD KEY `tours_updated_by_id_fk` (`updated_by_id`);

--
-- Indexes for table `tour_bookings`
--
ALTER TABLE `tour_bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tour_bookings_created_by_id_fk` (`created_by_id`),
  ADD KEY `tour_bookings_updated_by_id_fk` (`updated_by_id`);

--
-- Indexes for table `upload_folders`
--
ALTER TABLE `upload_folders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `upload_folders_path_id_index` (`path_id`),
  ADD UNIQUE KEY `upload_folders_path_index` (`path`),
  ADD KEY `upload_folders_created_by_id_fk` (`created_by_id`),
  ADD KEY `upload_folders_updated_by_id_fk` (`updated_by_id`);

--
-- Indexes for table `upload_folders_parent_links`
--
ALTER TABLE `upload_folders_parent_links`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `upload_folders_parent_links_unique` (`folder_id`,`inv_folder_id`),
  ADD KEY `upload_folders_parent_links_fk` (`folder_id`),
  ADD KEY `upload_folders_parent_links_inv_fk` (`inv_folder_id`),
  ADD KEY `upload_folders_parent_links_order_inv_fk` (`folder_order`);

--
-- Indexes for table `up_permissions`
--
ALTER TABLE `up_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `up_permissions_created_by_id_fk` (`created_by_id`),
  ADD KEY `up_permissions_updated_by_id_fk` (`updated_by_id`);

--
-- Indexes for table `up_permissions_role_links`
--
ALTER TABLE `up_permissions_role_links`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `up_permissions_role_links_unique` (`permission_id`,`role_id`),
  ADD KEY `up_permissions_role_links_fk` (`permission_id`),
  ADD KEY `up_permissions_role_links_inv_fk` (`role_id`),
  ADD KEY `up_permissions_role_links_order_inv_fk` (`permission_order`);

--
-- Indexes for table `up_roles`
--
ALTER TABLE `up_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `up_roles_created_by_id_fk` (`created_by_id`),
  ADD KEY `up_roles_updated_by_id_fk` (`updated_by_id`);

--
-- Indexes for table `up_users`
--
ALTER TABLE `up_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `up_users_created_by_id_fk` (`created_by_id`),
  ADD KEY `up_users_updated_by_id_fk` (`updated_by_id`);

--
-- Indexes for table `up_users_role_links`
--
ALTER TABLE `up_users_role_links`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `up_users_role_links_unique` (`user_id`,`role_id`),
  ADD KEY `up_users_role_links_fk` (`user_id`),
  ADD KEY `up_users_role_links_inv_fk` (`role_id`),
  ADD KEY `up_users_role_links_order_inv_fk` (`user_order`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activities`
--
ALTER TABLE `activities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `activities_tours_links`
--
ALTER TABLE `activities_tours_links`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_permissions`
--
ALTER TABLE `admin_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=191;

--
-- AUTO_INCREMENT for table `admin_permissions_role_links`
--
ALTER TABLE `admin_permissions_role_links`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=191;

--
-- AUTO_INCREMENT for table `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_users_roles_links`
--
ALTER TABLE `admin_users_roles_links`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `files_folder_links`
--
ALTER TABLE `files_folder_links`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `files_related_morphs`
--
ALTER TABLE `files_related_morphs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `i18n_locale`
--
ALTER TABLE `i18n_locale`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `queries`
--
ALTER TABLE `queries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `strapi_api_tokens`
--
ALTER TABLE `strapi_api_tokens`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `strapi_api_token_permissions`
--
ALTER TABLE `strapi_api_token_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `strapi_api_token_permissions_token_links`
--
ALTER TABLE `strapi_api_token_permissions_token_links`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `strapi_core_store_settings`
--
ALTER TABLE `strapi_core_store_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `strapi_database_schema`
--
ALTER TABLE `strapi_database_schema`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `strapi_migrations`
--
ALTER TABLE `strapi_migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `strapi_releases`
--
ALTER TABLE `strapi_releases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `strapi_release_actions`
--
ALTER TABLE `strapi_release_actions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `strapi_release_actions_release_links`
--
ALTER TABLE `strapi_release_actions_release_links`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `strapi_transfer_tokens`
--
ALTER TABLE `strapi_transfer_tokens`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `strapi_transfer_token_permissions`
--
ALTER TABLE `strapi_transfer_token_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `strapi_transfer_token_permissions_token_links`
--
ALTER TABLE `strapi_transfer_token_permissions_token_links`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `strapi_webhooks`
--
ALTER TABLE `strapi_webhooks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tours`
--
ALTER TABLE `tours`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tour_bookings`
--
ALTER TABLE `tour_bookings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `upload_folders`
--
ALTER TABLE `upload_folders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `upload_folders_parent_links`
--
ALTER TABLE `upload_folders_parent_links`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `up_permissions`
--
ALTER TABLE `up_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `up_permissions_role_links`
--
ALTER TABLE `up_permissions_role_links`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `up_roles`
--
ALTER TABLE `up_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `up_users`
--
ALTER TABLE `up_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `up_users_role_links`
--
ALTER TABLE `up_users_role_links`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activities`
--
ALTER TABLE `activities`
  ADD CONSTRAINT `activities_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `activities_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `activities_tours_links`
--
ALTER TABLE `activities_tours_links`
  ADD CONSTRAINT `activities_tours_links_fk` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `activities_tours_links_inv_fk` FOREIGN KEY (`tour_id`) REFERENCES `tours` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `admin_permissions`
--
ALTER TABLE `admin_permissions`
  ADD CONSTRAINT `admin_permissions_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `admin_permissions_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `admin_permissions_role_links`
--
ALTER TABLE `admin_permissions_role_links`
  ADD CONSTRAINT `admin_permissions_role_links_fk` FOREIGN KEY (`permission_id`) REFERENCES `admin_permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `admin_permissions_role_links_inv_fk` FOREIGN KEY (`role_id`) REFERENCES `admin_roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD CONSTRAINT `admin_roles_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `admin_roles_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD CONSTRAINT `admin_users_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `admin_users_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `admin_users_roles_links`
--
ALTER TABLE `admin_users_roles_links`
  ADD CONSTRAINT `admin_users_roles_links_fk` FOREIGN KEY (`user_id`) REFERENCES `admin_users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `admin_users_roles_links_inv_fk` FOREIGN KEY (`role_id`) REFERENCES `admin_roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `employees_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `files`
--
ALTER TABLE `files`
  ADD CONSTRAINT `files_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `files_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `files_folder_links`
--
ALTER TABLE `files_folder_links`
  ADD CONSTRAINT `files_folder_links_fk` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `files_folder_links_inv_fk` FOREIGN KEY (`folder_id`) REFERENCES `upload_folders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `files_related_morphs`
--
ALTER TABLE `files_related_morphs`
  ADD CONSTRAINT `files_related_morphs_fk` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `i18n_locale`
--
ALTER TABLE `i18n_locale`
  ADD CONSTRAINT `i18n_locale_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `i18n_locale_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `queries`
--
ALTER TABLE `queries`
  ADD CONSTRAINT `queries_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `queries_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `reviews_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `strapi_api_tokens`
--
ALTER TABLE `strapi_api_tokens`
  ADD CONSTRAINT `strapi_api_tokens_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `strapi_api_tokens_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `strapi_api_token_permissions`
--
ALTER TABLE `strapi_api_token_permissions`
  ADD CONSTRAINT `strapi_api_token_permissions_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `strapi_api_token_permissions_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `strapi_api_token_permissions_token_links`
--
ALTER TABLE `strapi_api_token_permissions_token_links`
  ADD CONSTRAINT `strapi_api_token_permissions_token_links_fk` FOREIGN KEY (`api_token_permission_id`) REFERENCES `strapi_api_token_permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `strapi_api_token_permissions_token_links_inv_fk` FOREIGN KEY (`api_token_id`) REFERENCES `strapi_api_tokens` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `strapi_releases`
--
ALTER TABLE `strapi_releases`
  ADD CONSTRAINT `strapi_releases_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `strapi_releases_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `strapi_release_actions`
--
ALTER TABLE `strapi_release_actions`
  ADD CONSTRAINT `strapi_release_actions_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `strapi_release_actions_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `strapi_release_actions_release_links`
--
ALTER TABLE `strapi_release_actions_release_links`
  ADD CONSTRAINT `strapi_release_actions_release_links_fk` FOREIGN KEY (`release_action_id`) REFERENCES `strapi_release_actions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `strapi_release_actions_release_links_inv_fk` FOREIGN KEY (`release_id`) REFERENCES `strapi_releases` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `strapi_transfer_tokens`
--
ALTER TABLE `strapi_transfer_tokens`
  ADD CONSTRAINT `strapi_transfer_tokens_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `strapi_transfer_tokens_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `strapi_transfer_token_permissions`
--
ALTER TABLE `strapi_transfer_token_permissions`
  ADD CONSTRAINT `strapi_transfer_token_permissions_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `strapi_transfer_token_permissions_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `strapi_transfer_token_permissions_token_links`
--
ALTER TABLE `strapi_transfer_token_permissions_token_links`
  ADD CONSTRAINT `strapi_transfer_token_permissions_token_links_fk` FOREIGN KEY (`transfer_token_permission_id`) REFERENCES `strapi_transfer_token_permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `strapi_transfer_token_permissions_token_links_inv_fk` FOREIGN KEY (`transfer_token_id`) REFERENCES `strapi_transfer_tokens` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tours`
--
ALTER TABLE `tours`
  ADD CONSTRAINT `tours_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `tours_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `tour_bookings`
--
ALTER TABLE `tour_bookings`
  ADD CONSTRAINT `tour_bookings_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `tour_bookings_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `upload_folders`
--
ALTER TABLE `upload_folders`
  ADD CONSTRAINT `upload_folders_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `upload_folders_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `upload_folders_parent_links`
--
ALTER TABLE `upload_folders_parent_links`
  ADD CONSTRAINT `upload_folders_parent_links_fk` FOREIGN KEY (`folder_id`) REFERENCES `upload_folders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `upload_folders_parent_links_inv_fk` FOREIGN KEY (`inv_folder_id`) REFERENCES `upload_folders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `up_permissions`
--
ALTER TABLE `up_permissions`
  ADD CONSTRAINT `up_permissions_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `up_permissions_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `up_permissions_role_links`
--
ALTER TABLE `up_permissions_role_links`
  ADD CONSTRAINT `up_permissions_role_links_fk` FOREIGN KEY (`permission_id`) REFERENCES `up_permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `up_permissions_role_links_inv_fk` FOREIGN KEY (`role_id`) REFERENCES `up_roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `up_roles`
--
ALTER TABLE `up_roles`
  ADD CONSTRAINT `up_roles_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `up_roles_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `up_users`
--
ALTER TABLE `up_users`
  ADD CONSTRAINT `up_users_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `up_users_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `up_users_role_links`
--
ALTER TABLE `up_users_role_links`
  ADD CONSTRAINT `up_users_role_links_fk` FOREIGN KEY (`user_id`) REFERENCES `up_users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `up_users_role_links_inv_fk` FOREIGN KEY (`role_id`) REFERENCES `up_roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
