-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 07, 2014 at 09:34 AM
-- Server version: 5.5.37
-- PHP Version: 5.3.10-1ubuntu3.12

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `lancasterproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `omeka_collections`
--

CREATE TABLE IF NOT EXISTS `omeka_collections` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `public` tinyint(4) NOT NULL,
  `featured` tinyint(4) NOT NULL,
  `added` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `owner_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `public` (`public`),
  KEY `featured` (`featured`),
  KEY `owner_id` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `omeka_csv_import_imported_items`
--

CREATE TABLE IF NOT EXISTS `omeka_csv_import_imported_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL,
  `import_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `item_id` (`item_id`),
  KEY `import_id` (`import_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `omeka_csv_import_imports`
--

CREATE TABLE IF NOT EXISTS `omeka_csv_import_imports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_type_id` int(10) unsigned DEFAULT NULL,
  `collection_id` int(10) unsigned DEFAULT NULL,
  `owner_id` int(10) unsigned NOT NULL,
  `delimiter` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `original_filename` text COLLATE utf8_unicode_ci NOT NULL,
  `file_path` text COLLATE utf8_unicode_ci NOT NULL,
  `file_position` bigint(20) unsigned NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `skipped_row_count` int(10) unsigned NOT NULL,
  `skipped_item_count` int(10) unsigned NOT NULL,
  `is_public` tinyint(1) DEFAULT '0',
  `is_featured` tinyint(1) DEFAULT '0',
  `serialized_column_maps` text COLLATE utf8_unicode_ci NOT NULL,
  `added` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `omeka_elements`
--

CREATE TABLE IF NOT EXISTS `omeka_elements` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `element_set_id` int(10) unsigned NOT NULL,
  `order` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_element_set_id` (`element_set_id`,`name`),
  UNIQUE KEY `order_element_set_id` (`element_set_id`,`order`),
  KEY `element_set_id` (`element_set_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=56 ;

--
-- Dumping data for table `omeka_elements`
--

INSERT INTO `omeka_elements` (`id`, `element_set_id`, `order`, `name`, `description`, `comment`) VALUES
(37, 1, 8, 'Contributor', 'An entity responsible for making contributions to the resource', NULL),
(38, 1, 15, 'Coverage', 'The spatial or temporal topic of the resource, the spatial applicability of the resource, or the jurisdiction under which the resource is relevant', NULL),
(39, 1, 4, 'Creator', 'An entity primarily responsible for making the resource', NULL),
(40, 1, 7, 'Date', 'A point or period of time associated with an event in the lifecycle of the resource', NULL),
(41, 1, 3, 'Description', 'An account of the resource', NULL),
(42, 1, 11, 'Format', 'The file format, physical medium, or dimensions of the resource', NULL),
(43, 1, 14, 'Identifier', 'An unambiguous reference to the resource within a given context', NULL),
(44, 1, 12, 'Language', 'A language of the resource', NULL),
(45, 1, 6, 'Publisher', 'An entity responsible for making the resource available', NULL),
(46, 1, 10, 'Relation', 'A related resource', NULL),
(47, 1, 9, 'Rights', 'Information about rights held in and over the resource', NULL),
(48, 1, 5, 'Source', 'A related resource from which the described resource is derived', NULL),
(49, 1, 2, 'Subject', 'The topic of the resource', NULL),
(50, 1, 1, 'Title', 'A name given to the resource', NULL),
(51, 1, 13, 'Type', 'The nature or genre of the resource', NULL),
(52, 3, NULL, 'Description', 'Description of the Item', ''),
(53, 3, NULL, 'Source', 'Bibliographical Source', ''),
(54, 3, NULL, 'Rarity', '', ''),
(55, 3, NULL, 'Sense of the Modern', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `omeka_element_sets`
--

CREATE TABLE IF NOT EXISTS `omeka_element_sets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `record_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `record_type` (`record_type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `omeka_element_sets`
--

INSERT INTO `omeka_element_sets` (`id`, `record_type`, `name`, `description`) VALUES
(1, NULL, 'Dublin Core', 'The Dublin Core metadata element set is common to all Omeka records, including items, files, and collections. For more information see, http://dublincore.org/documents/dces/.'),
(3, 'Item', 'Item Type Metadata', 'The item type metadata element set, consisting of all item type elements bundled with Omeka and all item type elements created by an administrator.');

-- --------------------------------------------------------

--
-- Table structure for table `omeka_element_texts`
--

CREATE TABLE IF NOT EXISTS `omeka_element_texts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `record_id` int(10) unsigned NOT NULL,
  `record_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `element_id` int(10) unsigned NOT NULL,
  `html` tinyint(4) NOT NULL,
  `text` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `record_type_record_id` (`record_type`,`record_id`),
  KEY `element_id` (`element_id`),
  KEY `text` (`text`(20))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=33 ;

--
-- Dumping data for table `omeka_element_texts`
--

INSERT INTO `omeka_element_texts` (`id`, `record_id`, `record_type`, `element_id`, `html`, `text`) VALUES
(3, 2, 'Item', 50, 0, 'First Electric Street Lamp'),
(4, 2, 'Item', 38, 0, 'POINT(-8376939.3531198 4864501.4764768)|15|-8377297.6516899|4864322.7004195|osm\r\n'),
(5, 2, 'Item', 52, 0, 'Is this a "Thing" or an "Event"?'),
(6, 3, 'Item', 50, 0, 'First time a car drives down Lancaster '),
(7, 3, 'Item', 38, 0, 'POINT(-8379581.2079096 4865962.0656686)|13|-8380613.1077913|4864425.2633852|osm\r\n'),
(8, 3, 'Item', 52, 0, 'Momentous occasion'),
(9, 4, 'Item', 50, 0, 'Bumbelowski family'),
(10, 4, 'Item', 38, 0, 'POINT(-8388734.5420455 4868039.8987926)|3|0.0000000|0.0000000|osm\r\n'),
(11, 4, 'Item', 52, 0, 'Polish family in first wave of Polish Immigration '),
(12, 4, 'Item', 53, 0, '"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."'),
(13, 5, 'Item', 50, 0, 'Mayor Wilhelm '),
(14, 5, 'Item', 38, 0, 'POINT(-8385142.0017165 4859217.3936697)|3|-9490421.4305667|3561354.0213672|osm\r\n'),
(15, 5, 'Item', 52, 0, '"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."'),
(16, 6, 'Item', 50, 0, 'Last cry of the Buffalo '),
(17, 6, 'Item', 52, 0, 'Last cry of the Buffalo '),
(18, 6, 'Item', 54, 0, 'Very rare. '),
(19, 7, 'Item', 50, 0, 'First public library'),
(20, 7, 'Item', 38, 0, 'POINT(-8374287.9437016 4860396.195965)|11|-8370236.7812031|4854401.8608883|osm\r\n'),
(21, 7, 'Item', 52, 0, 'The first public library along Lancaster'),
(22, 7, 'Item', 55, 0, '"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."'),
(23, 8, 'Item', 50, 0, 'Precious family heirloom'),
(24, 8, 'Item', 38, 0, 'POINT(-8396454.6819013 4860834.514549)|9|-8395231.6894488|4831353.7082063|osm\r\n'),
(25, 8, 'Item', 52, 0, 'This item of the Malvern family connects the history of Lancaster to this broader trend noticed during the turn of the century. '),
(26, 8, 'Item', 53, 0, '"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."'),
(27, 8, 'Item', 55, 0, 'Surprisingly high'),
(28, 9, 'Item', 50, 0, 'Napoleon Bonaparte''s table'),
(29, 5, 'Item', 55, 0, 'Very low'),
(30, 4, 'Item', 55, 0, 'Very high'),
(31, 9, 'Item', 52, 0, 'Usu ea laoreet molestie appetere. Vis solum copiosae explicari an, lobortis vituperata suscipiantur quo ut. Iudicabit gubergren assueverit ut est, an duis corpora his. Ne assum accumsan sed. Ne impetus voluptatum mea, munere ridens malorum eu mea. Delenit antiopam urbanitas usu at.\r\n'),
(32, 9, 'Item', 55, 0, 'Usu ea laoreet molestie appetere. Vis solum copiosae explicari an, lobortis vituperata suscipiantur quo ut. Iudicabit gubergren assueverit ut est, an duis corpora his. Ne assum accumsan sed. Ne impetus voluptatum mea, munere ridens malorum eu mea. Delenit antiopam urbanitas usu at.\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `omeka_exhibits`
--

CREATE TABLE IF NOT EXISTS `omeka_exhibits` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `credits` text COLLATE utf8_unicode_ci,
  `featured` tinyint(1) DEFAULT '0',
  `public` tinyint(1) DEFAULT '0',
  `theme` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `theme_options` text COLLATE utf8_unicode_ci,
  `slug` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `added` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `owner_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `public` (`public`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `omeka_exhibit_block_attachments`
--

CREATE TABLE IF NOT EXISTS `omeka_exhibit_block_attachments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `block_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL,
  `file_id` int(10) unsigned DEFAULT NULL,
  `caption` text COLLATE utf8_unicode_ci,
  `order` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `block_id_order` (`block_id`,`order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `omeka_exhibit_pages`
--

CREATE TABLE IF NOT EXISTS `omeka_exhibit_pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `exhibit_id` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `order` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `exhibit_id_parent_id_slug` (`exhibit_id`,`parent_id`,`slug`),
  KEY `exhibit_id_order` (`exhibit_id`,`order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `omeka_exhibit_page_blocks`
--

CREATE TABLE IF NOT EXISTS `omeka_exhibit_page_blocks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(10) unsigned NOT NULL,
  `layout` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `options` text COLLATE utf8_unicode_ci,
  `text` mediumtext COLLATE utf8_unicode_ci,
  `order` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `page_id_order` (`page_id`,`order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `omeka_files`
--

CREATE TABLE IF NOT EXISTS `omeka_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL,
  `order` int(10) unsigned DEFAULT NULL,
  `size` int(10) unsigned NOT NULL,
  `has_derivative_image` tinyint(1) NOT NULL,
  `authentication` char(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mime_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type_os` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `filename` text COLLATE utf8_unicode_ci NOT NULL,
  `original_filename` text COLLATE utf8_unicode_ci NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `added` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `stored` tinyint(1) NOT NULL DEFAULT '0',
  `metadata` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `omeka_files`
--

INSERT INTO `omeka_files` (`id`, `item_id`, `order`, `size`, `has_derivative_image`, `authentication`, `mime_type`, `type_os`, `filename`, `original_filename`, `modified`, `added`, `stored`, `metadata`) VALUES
(1, 3, NULL, 9096, 1, '8316ce23718acd900011e6930990e9b5', 'image/jpeg', 'JPEG image data, JFIF standard 1.01', '7ee602cc4fe752267d5f584755186ea2.jpg', 'url.jpg', '2014-08-06 18:33:01', '2014-08-06 18:32:09', 1, '{"mime_type":"image\\/jpeg","video":{"dataformat":"jpg","lossless":false,"bits_per_sample":24,"pixel_aspect_ratio":1,"resolution_x":281,"resolution_y":179,"compression_ratio":0.060279528420048}}');

-- --------------------------------------------------------

--
-- Table structure for table `omeka_items`
--

CREATE TABLE IF NOT EXISTS `omeka_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_type_id` int(10) unsigned DEFAULT NULL,
  `collection_id` int(10) unsigned DEFAULT NULL,
  `featured` tinyint(4) NOT NULL,
  `public` tinyint(4) NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `added` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `owner_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_type_id` (`item_type_id`),
  KEY `collection_id` (`collection_id`),
  KEY `public` (`public`),
  KEY `featured` (`featured`),
  KEY `owner_id` (`owner_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `omeka_items`
--

INSERT INTO `omeka_items` (`id`, `item_type_id`, `collection_id`, `featured`, `public`, `modified`, `added`, `owner_id`) VALUES
(2, 21, NULL, 0, 1, '2014-08-06 18:32:43', '2014-08-06 18:17:56', 2),
(3, 21, NULL, 0, 1, '2014-08-06 18:33:01', '2014-08-06 18:32:09', 3),
(4, 18, NULL, 0, 1, '2014-08-07 08:25:06', '2014-08-06 18:35:43', 3),
(5, 18, NULL, 0, 1, '2014-08-07 08:22:19', '2014-08-06 18:36:40', 3),
(6, 19, NULL, 0, 1, '2014-08-07 08:16:47', '2014-08-06 18:40:14', 3),
(7, 19, NULL, 0, 1, '2014-08-07 08:25:55', '2014-08-06 18:41:48', 3),
(8, 20, NULL, 0, 1, '2014-08-06 18:46:55', '2014-08-06 18:44:04', 3),
(9, 20, NULL, 0, 1, '2014-08-07 08:25:38', '2014-08-06 18:47:17', 3);

-- --------------------------------------------------------

--
-- Table structure for table `omeka_item_order_item_orders`
--

CREATE TABLE IF NOT EXISTS `omeka_item_order_item_orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `collection_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL,
  `order` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `item_id_order` (`item_id`,`order`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `omeka_item_types`
--

CREATE TABLE IF NOT EXISTS `omeka_item_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=22 ;

--
-- Dumping data for table `omeka_item_types`
--

INSERT INTO `omeka_item_types` (`id`, `name`, `description`) VALUES
(18, 'Person', 'Ask Andrew for a Benjaminian description'),
(19, 'Place', 'Ask Andrew for Description'),
(20, 'Thing', 'Ask Andrew for Description'),
(21, 'Event', 'Ask Andrew');

-- --------------------------------------------------------

--
-- Table structure for table `omeka_item_types_elements`
--

CREATE TABLE IF NOT EXISTS `omeka_item_types_elements` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_type_id` int(10) unsigned NOT NULL,
  `element_id` int(10) unsigned NOT NULL,
  `order` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `item_type_id_element_id` (`item_type_id`,`element_id`),
  KEY `item_type_id` (`item_type_id`),
  KEY `element_id` (`element_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=17 ;

--
-- Dumping data for table `omeka_item_types_elements`
--

INSERT INTO `omeka_item_types_elements` (`id`, `item_type_id`, `element_id`, `order`) VALUES
(1, 18, 52, 2),
(2, 18, 53, 3),
(3, 18, 54, 4),
(4, 18, 55, 5),
(5, 19, 52, 2),
(6, 19, 53, 3),
(7, 19, 54, 4),
(8, 19, 55, 5),
(9, 20, 52, 2),
(10, 20, 53, 3),
(11, 20, 55, 4),
(12, 20, 54, 5),
(13, 21, 52, 2),
(14, 21, 53, 3),
(15, 21, 55, 4),
(16, 21, 54, 5);

-- --------------------------------------------------------

--
-- Table structure for table `omeka_keys`
--

CREATE TABLE IF NOT EXISTS `omeka_keys` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `key` char(40) COLLATE utf8_unicode_ci NOT NULL,
  `ip` varbinary(16) DEFAULT NULL,
  `accessed` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `omeka_neatline_exhibits`
--

CREATE TABLE IF NOT EXISTS `omeka_neatline_exhibits` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `owner_id` int(10) unsigned NOT NULL,
  `added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  `published` timestamp NULL DEFAULT NULL,
  `item_query` text COLLATE utf8_unicode_ci,
  `spatial_layers` text COLLATE utf8_unicode_ci,
  `spatial_layer` text COLLATE utf8_unicode_ci,
  `image_layer` text COLLATE utf8_unicode_ci,
  `image_height` smallint(5) unsigned DEFAULT NULL,
  `image_width` smallint(5) unsigned DEFAULT NULL,
  `zoom_levels` smallint(5) unsigned DEFAULT NULL,
  `wms_address` text COLLATE utf8_unicode_ci,
  `wms_layers` text COLLATE utf8_unicode_ci,
  `widgets` text COLLATE utf8_unicode_ci,
  `title` text COLLATE utf8_unicode_ci,
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `narrative` longtext COLLATE utf8_unicode_ci,
  `spatial_querying` tinyint(1) NOT NULL,
  `public` tinyint(1) NOT NULL,
  `styles` text COLLATE utf8_unicode_ci,
  `map_focus` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `map_zoom` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `omeka_neatline_exhibits`
--

INSERT INTO `omeka_neatline_exhibits` (`id`, `owner_id`, `added`, `modified`, `published`, `item_query`, `spatial_layers`, `spatial_layer`, `image_layer`, `image_height`, `image_width`, `zoom_levels`, `wms_address`, `wms_layers`, `widgets`, `title`, `slug`, `narrative`, `spatial_querying`, `public`, `styles`, `map_focus`, `map_zoom`) VALUES
(1, 3, '2014-08-04 01:10:18', '2014-08-07 12:44:46', '2014-08-03 13:10:18', 'a:5:{s:5:"range";s:0:"";s:10:"collection";s:0:"";s:4:"type";s:0:"";s:4:"tags";s:0:"";s:13:"submit_search";s:12:"Import Items";}', NULL, 'StamenToner', NULL, NULL, NULL, 20, NULL, NULL, 'Simile,Waypoints,Text', 'Demonstration ', 'demonstration', NULL, 1, 1, '.1887 {\n  start-date: 0;\n  end-date: 0;\n  after-date: 1800;\n  before-date: 1900;\n}\n\n.1900 {\n  start-date: 0;\n  end-date: 0;\n  after-date: 1900;\n  before-date: 1907;\n}\n\n.1907 {\n  start-date: 0;\n  end-date: 0;\n  after-date: 1907;\n  before-date: 3000;\n}\n\n.redd {\n  fill-color: : #B20000;\n  fill-color-select: #B20000;\n  fill-opacity: 1;\n  fill-opacity-select: 1;\n  min-zoom: 11;\n  max-zoom: 20;\n}\n\n.blue {\n  fill-color: #6633FF;\n  fill-color-select: #6633FF;\n  stroke-color: #6633FF;\n  fill-opacity: 1;\n  fill-opacity-select: 1;\n  min-zoom: 11;\n  max-zoom: 20;\n}\n\n.grey {\n  fill-color: #787878;\n  fill-color-select: #787878;\n  fill-opacity: 1;\n  stroke-color: #787878;\n  fill-opacity-select: 1;\n  min-zoom: 11;\n  max-zoom: 20;\n}\n\n.gold {\n  fill-color-select: #DA9100;\n  stroke-color: #DA9100;\n  fill-opacity: 1;\n  fill-opacity-select: 1;\n  min-zoom: 11;\n  max-zoom: 20;\n}', '-8375672.0618332,4869604.4274626', 10),
(2, 2, '2014-08-06 18:12:40', '2014-08-07 12:35:38', '2014-08-06 06:23:46', NULL, 'StamenToner', 'OpenStreetMap', NULL, NULL, NULL, 20, NULL, NULL, 'Simile,Waypoints', 'Electric Light', 'electric-light', '<p>This maps the arrival of electric light at various points on Lancaster Ave.</p>\r\n', 1, 1, '', NULL, NULL),
(3, 3, '2014-08-04 01:10:18', '2014-08-07 12:44:46', '2014-08-03 13:10:18', 'a:5:{s:5:"range";s:0:"";s:10:"collection";s:0:"";s:4:"type";s:0:"";s:4:"tags";s:0:"";s:13:"submit_search";s:12:"Import Items";}', NULL, 'StamenToner', NULL, NULL, NULL, 20, NULL, NULL, 'Simile,Waypoints,Text', 'Demonstration ', 'demonstration', NULL, 1, 1, '.1887 {\r\n  start-date: 0;\r\n  end-date: 0;\r\n  after-date: 1800;\r\n  before-date: 1900;\r\n}\r\n\r\n.1900 {\r\n  start-date: 0;\r\n  end-date: 0;\r\n  after-date: 1900;\r\n  before-date: 1907;\r\n}\r\n\r\n.1907 {\r\n  start-date: 0;\r\n  end-date: 0;\r\n  after-date: 1907;\r\n  before-date: 3000;\r\n}\r\n\r\n.redd {\r\n  fill-color: : #B20000;\r\n  fill-color-select: #B20000;\r\n  fill-opacity: 1;\r\n  fill-opacity-select: 1;\r\n  min-zoom: 11;\r\n  max-zoom: 20;\r\n}\r\n\r\n.blue {\r\n  fill-color: #6633FF;\r\n  fill-color-select: #6633FF;\r\n  stroke-color: #6633FF;\r\n  fill-opacity: 1;\r\n  fill-opacity-select: 1;\r\n  min-zoom: 11;\r\n  max-zoom: 20;\r\n}\r\n\r\n.grey {\r\n  fill-color: #787878;\r\n  fill-color-select: #787878;\r\n  fill-opacity: 1;\r\n  stroke-color: #787878;\r\n  fill-opacity-select: 1;\r\n  min-zoom: 11;\r\n  max-zoom: 20;\r\n}\r\n\r\n.gold {\r\n  fill-color-select: #DA9100;\r\n  stroke-color: #DA9100;\r\n  fill-opacity: 1;\r\n  fill-opacity-select: 1;\r\n  min-zoom: 11;\r\n  max-zoom: 20;\r\n}', '-8375672.0618332,4869604.4274626', 10),
(4, 1, '2014-08-07 13:17:26', '2014-08-07 13:23:28', '2014-08-07 13:17:26', 'a:5:{s:5:"range";s:0:"";s:10:"collection";s:0:"";s:4:"type";s:0:"";s:4:"tags";s:3:"old";s:13:"submit_search";s:12:"Import Items";}', 'OpenStreetMap,StamenToner', 'StamenToner', NULL, NULL, NULL, 8, NULL, NULL, 'Simile,Waypoints,Text', 'laurie', 'laurie', NULL, 1, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `omeka_neatline_features`
--

CREATE TABLE IF NOT EXISTS `omeka_neatline_features` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `item_id` int(10) unsigned NOT NULL,
  `element_text_id` int(10) unsigned NOT NULL,
  `is_map` tinyint(1) NOT NULL DEFAULT '0',
  `geo` text COLLATE utf8_unicode_ci,
  `zoom` smallint(2) NOT NULL DEFAULT '3',
  `center_lon` decimal(20,7) NOT NULL DEFAULT '0.0000000',
  `center_lat` decimal(20,7) NOT NULL DEFAULT '0.0000000',
  `base_layer` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`,`element_text_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=16 ;

--
-- Dumping data for table `omeka_neatline_features`
--

INSERT INTO `omeka_neatline_features` (`id`, `added`, `item_id`, `element_text_id`, `is_map`, `geo`, `zoom`, `center_lon`, `center_lat`, `base_layer`) VALUES
(5, '2014-08-06 18:32:43', 2, 4, 1, 'POINT(-8376939.3531198 4864501.4764768)', 15, -8377297.6516899, 4864322.7004195, 'osm'),
(6, '2014-08-06 18:33:01', 3, 7, 1, 'POINT(-8379581.2079096 4865962.0656686)', 13, -8380613.1077913, 4864425.2633852, 'osm'),
(12, '2014-08-06 18:46:55', 8, 24, 1, 'POINT(-8396454.6819013 4860834.514549)', 9, -8395231.6894488, 4831353.7082063, 'osm'),
(13, '2014-08-07 08:22:19', 5, 14, 1, 'POINT(-8385142.0017165 4859217.3936697)', 3, -9490421.4305667, 3561354.0213672, 'osm'),
(14, '2014-08-07 08:25:06', 4, 10, 1, 'POINT(-8388734.5420455 4868039.8987926)', 3, 0.0000000, 0.0000000, 'osm'),
(15, '2014-08-07 08:25:55', 7, 20, 1, 'POINT(-8374287.9437016 4860396.195965)', 11, -8370236.7812031, 4854401.8608883, 'osm');

-- --------------------------------------------------------

--
-- Table structure for table `omeka_neatline_records`
--

CREATE TABLE IF NOT EXISTS `omeka_neatline_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `owner_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned DEFAULT NULL,
  `exhibit_id` int(10) unsigned DEFAULT NULL,
  `added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  `is_coverage` tinyint(1) NOT NULL,
  `is_wms` tinyint(1) NOT NULL,
  `slug` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` mediumtext COLLATE utf8_unicode_ci,
  `item_title` mediumtext COLLATE utf8_unicode_ci,
  `body` mediumtext COLLATE utf8_unicode_ci,
  `coverage` geometry NOT NULL,
  `tags` text COLLATE utf8_unicode_ci,
  `widgets` text COLLATE utf8_unicode_ci,
  `presenter` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fill_color` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fill_color_select` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stroke_color` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stroke_color_select` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fill_opacity` decimal(3,2) DEFAULT NULL,
  `fill_opacity_select` decimal(3,2) DEFAULT NULL,
  `stroke_opacity` decimal(3,2) DEFAULT NULL,
  `stroke_opacity_select` decimal(3,2) DEFAULT NULL,
  `stroke_width` int(10) unsigned DEFAULT NULL,
  `point_radius` int(10) unsigned DEFAULT NULL,
  `zindex` int(10) unsigned DEFAULT NULL,
  `weight` int(10) unsigned DEFAULT NULL,
  `start_date` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `end_date` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `after_date` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `before_date` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `point_image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wms_address` text COLLATE utf8_unicode_ci,
  `wms_layers` text COLLATE utf8_unicode_ci,
  `min_zoom` int(10) unsigned DEFAULT NULL,
  `max_zoom` int(10) unsigned DEFAULT NULL,
  `map_zoom` int(10) unsigned DEFAULT NULL,
  `map_focus` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `added` (`added`),
  KEY `exhibit_id` (`exhibit_id`,`item_id`),
  KEY `min_zoom` (`min_zoom`,`max_zoom`),
  SPATIAL KEY `coverage` (`coverage`),
  FULLTEXT KEY `title` (`title`,`body`,`slug`),
  FULLTEXT KEY `tags` (`tags`),
  FULLTEXT KEY `widgets` (`widgets`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=44 ;

--
-- Dumping data for table `omeka_neatline_records`
--

INSERT INTO `omeka_neatline_records` (`id`, `owner_id`, `item_id`, `exhibit_id`, `added`, `modified`, `is_coverage`, `is_wms`, `slug`, `title`, `item_title`, `body`, `coverage`, `tags`, `widgets`, `presenter`, `fill_color`, `fill_color_select`, `stroke_color`, `stroke_color_select`, `fill_opacity`, `fill_opacity_select`, `stroke_opacity`, `stroke_opacity_select`, `stroke_width`, `point_radius`, `zindex`, `weight`, `start_date`, `end_date`, `after_date`, `before_date`, `point_image`, `wms_address`, `wms_layers`, `min_zoom`, `max_zoom`, `map_zoom`, `map_focus`) VALUES
(2, 3, NULL, 1, '2014-08-04 01:56:13', '2014-08-07 12:44:46', 0, 1, NULL, 'Atlas-1887', NULL, 'Here''s a brief history of this map and why it was created.  It was commissioned by the Such and Such Railroad Company to show the path of the railway through the Western Suburbs of Philadelphia in 1909.', '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '1887', 'Simile', 'StaticBubble', '#00aeff', '#00aeff', '#000000', '#000000', 1.00, 1.00, 1.00, 1.00, 2, 10, NULL, NULL, '0', '0', '1800', '1900', NULL, 'http://geo.haverford.edu:8765/geoserver/wms/', 'Blair:Atlas_1887', NULL, 12, NULL, NULL),
(3, 3, NULL, 1, '2014-08-04 02:00:24', '2014-08-06 10:34:54', 0, 1, NULL, 'Plate 11 1887', NULL, NULL, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '1887', 'Simile', 'StaticBubble', '#00aeff', '#00aeff', '#000000', '#000000', 1.00, 1.00, 1.00, 1.00, 2, 10, NULL, NULL, '0', '0', '1800', '1900', NULL, 'http://geo.haverford.edu:8765/geoserver/wms/', 'plate_11_1887', NULL, NULL, NULL, NULL),
(4, 3, NULL, 1, '2014-08-04 02:01:07', '2014-08-06 10:34:44', 0, 1, NULL, 'Plate 12 1887', NULL, NULL, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '1887', 'Simile', 'StaticBubble', '#00aeff', '#00aeff', '#000000', '#000000', 1.00, 1.00, 1.00, 1.00, 2, 10, NULL, NULL, '0', '0', '1800', '1900', NULL, 'http://geo.haverford.edu:8765/geoserver/wms/', 'plate_12_1887', NULL, NULL, NULL, NULL),
(5, 3, NULL, 1, '2014-08-04 02:02:21', '2014-08-06 10:34:34', 0, 1, NULL, 'Plate 13 1887', NULL, NULL, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '1887', 'Simile', 'StaticBubble', '#00aeff', '#00aeff', '#000000', '#000000', 1.00, 1.00, 1.00, 1.00, 2, 10, NULL, NULL, '0', '0', '1800', '1900', NULL, 'http://geo.haverford.edu:8765/geoserver/wms/', 'plate_13_1887', NULL, NULL, NULL, NULL),
(6, 3, NULL, 1, '2014-08-04 02:04:31', '2014-08-06 10:34:25', 0, 1, NULL, 'Plate 6 1887', NULL, NULL, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '1887', 'Simile', 'StaticBubble', '#00aeff', '#00aeff', '#000000', '#000000', 1.00, 1.00, 1.00, 1.00, 2, 10, NULL, NULL, '0', '0', '1800', '1900', NULL, 'http://geo.haverford.edu:8765/geoserver/wms/', 'plate_6_1887', NULL, NULL, NULL, NULL),
(7, 3, NULL, 1, '2014-08-04 02:05:22', '2014-08-06 10:34:13', 0, 1, NULL, 'Plate 7 1887', NULL, NULL, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '1887', 'Simile', 'StaticBubble', '#00aeff', '#00aeff', '#000000', '#000000', 1.00, 1.00, 1.00, 1.00, 2, 10, NULL, NULL, '0', '0', '1800', '1900', NULL, 'http://geo.haverford.edu:8765/geoserver/wms/', 'plate_7_1887', NULL, NULL, NULL, NULL),
(8, 3, NULL, 1, '2014-08-04 02:06:00', '2014-08-06 10:34:02', 0, 1, NULL, 'Plate 8 1887', NULL, NULL, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '1887', 'Simile', 'StaticBubble', '#00aeff', '#00aeff', '#000000', '#000000', 1.00, 1.00, 1.00, 1.00, 2, 10, NULL, NULL, '0', '0', '1800', '1900', NULL, 'http://geo.haverford.edu:8765/geoserver/wms/', 'plate_8_1887', NULL, NULL, NULL, NULL),
(9, 3, NULL, 1, '2014-08-04 02:14:32', '2014-08-06 10:33:50', 0, 1, NULL, 'Atlas 1900', NULL, NULL, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '1900', 'Simile', 'StaticBubble', '#00aeff', '#00aeff', '#000000', '#000000', 1.00, 1.00, 1.00, 1.00, 2, 10, NULL, NULL, '0', '0', '1900', '1907', NULL, 'http://geo.haverford.edu:8765/geoserver/wms/', 'Atlas_1900', NULL, 12, NULL, NULL),
(10, 3, NULL, 1, '2014-08-04 02:17:37', '2014-08-06 10:33:35', 0, 1, NULL, 'Plate 11 1900', NULL, NULL, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '1900', 'Simile', 'StaticBubble', '#00aeff', '#00aeff', '#000000', '#000000', 1.00, 1.00, 1.00, 1.00, 2, 10, NULL, NULL, '0', '0', '1900', '1907', NULL, 'http://geo.haverford.edu:8765/geoserver/wms/', 'plate_11_1900', NULL, NULL, NULL, NULL),
(11, 3, NULL, 1, '2014-08-04 02:18:15', '2014-08-06 10:33:20', 0, 1, NULL, 'Plate 12 1900', NULL, NULL, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '1900', 'Simile', 'StaticBubble', '#00aeff', '#00aeff', '#000000', '#000000', 1.00, 1.00, 1.00, 1.00, 2, 10, NULL, NULL, '0', '0', '1900', '1907', NULL, 'http://geo.haverford.edu:8765/geoserver/wms/', 'plate_12_1900', NULL, NULL, NULL, NULL),
(12, 3, NULL, 1, '2014-08-04 02:19:02', '2014-08-06 10:33:10', 0, 1, NULL, 'Plate 13 1900', NULL, NULL, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '1900', 'Simile', 'StaticBubble', '#00aeff', '#00aeff', '#000000', '#000000', 1.00, 1.00, 1.00, 1.00, 2, 10, NULL, NULL, '0', '0', '1900', '1907', NULL, 'http://geo.haverford.edu:8765/geoserver/wms/', 'plate_13_1900', NULL, NULL, NULL, NULL),
(13, 3, NULL, 1, '2014-08-04 02:19:38', '2014-08-06 10:33:00', 0, 1, NULL, 'Plate 15 1900', NULL, NULL, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '1900', 'Simile', 'StaticBubble', '#00aeff', '#00aeff', '#000000', '#000000', 1.00, 1.00, 1.00, 1.00, 2, 10, NULL, NULL, '0', '0', '1900', '1907', NULL, 'http://geo.haverford.edu:8765/geoserver/wms/', 'plate_15_1900', NULL, NULL, NULL, NULL),
(14, 3, NULL, 1, '2014-08-04 02:20:14', '2014-08-06 10:32:42', 0, 1, NULL, 'Plate 16 1900', NULL, NULL, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '1900', 'Simile', 'StaticBubble', '#00aeff', '#00aeff', '#000000', '#000000', 1.00, 1.00, 1.00, 1.00, 2, 10, NULL, NULL, '0', '0', '1900', '1907', NULL, 'http://geo.haverford.edu:8765/geoserver/wms/', 'plate_16_1900', NULL, NULL, NULL, NULL),
(15, 3, NULL, 1, '2014-08-04 02:21:30', '2014-08-06 10:32:31', 0, 1, NULL, 'Plate 6 1900', NULL, NULL, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '1900', 'Simile', 'StaticBubble', '#00aeff', '#00aeff', '#000000', '#000000', 1.00, 1.00, 1.00, 1.00, 2, 10, NULL, NULL, '0', '0', '1900', '1907', NULL, 'http://geo.haverford.edu:8765/geoserver/wms/', 'plate_6_1900', NULL, NULL, NULL, NULL),
(16, 3, NULL, 1, '2014-08-04 02:22:01', '2014-08-06 10:32:21', 0, 1, NULL, 'Plate 7 1900', NULL, NULL, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '1900', 'Simile', 'StaticBubble', '#00aeff', '#00aeff', '#000000', '#000000', 1.00, 1.00, 1.00, 1.00, 2, 10, NULL, NULL, '0', '0', '1900', '1907', NULL, 'http://geo.haverford.edu:8765/geoserver/wms/', ' plate_1900', NULL, NULL, NULL, NULL),
(17, 3, NULL, 1, '2014-08-04 02:27:59', '2014-08-06 10:32:07', 0, 1, NULL, 'Atlas 1907', NULL, NULL, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '1907', 'Simile', 'StaticBubble', '#00aeff', '#00aeff', '#000000', '#000000', 1.00, 1.00, 1.00, 1.00, 2, 10, NULL, NULL, '0', '0', '1907', '3000', NULL, 'http://geo.haverford.edu:8765/geoserver/wms/', 'atlas_1907', NULL, 12, NULL, NULL),
(18, 3, NULL, 1, '2014-08-04 02:32:56', '2014-08-06 10:31:56', 0, 1, NULL, 'Plate 10 1907', NULL, NULL, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '1907', 'Simile', 'StaticBubble', '#00aeff', '#00aeff', '#000000', '#000000', 1.00, 1.00, 1.00, 1.00, 2, 10, NULL, NULL, '0', '0', '1907', '3000', NULL, 'http://geo.haverford.edu:8765/geoserver/wms/', 'plate_10_1907', NULL, NULL, NULL, NULL),
(19, 3, NULL, 1, '2014-08-04 02:35:06', '2014-08-06 10:31:46', 0, 1, NULL, 'Plate 11 1907', NULL, NULL, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '1907', 'Simile', 'StaticBubble', '#00aeff', '#00aeff', '#000000', '#000000', 1.00, 1.00, 1.00, 1.00, 2, 10, NULL, NULL, '0', '0', '1907', '3000', NULL, 'http://geo.haverford.edu:8765/geoserver/wms/', 'plate_11_1907', NULL, NULL, NULL, NULL),
(20, 3, NULL, 1, '2014-08-04 02:35:47', '2014-08-06 10:31:34', 0, 1, NULL, 'Plate 12 1907', NULL, NULL, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '1907', 'Simile', 'StaticBubble', '#00aeff', '#00aeff', '#000000', '#000000', 1.00, 1.00, 1.00, 1.00, 2, 10, NULL, NULL, '0', '0', '1907', '3000', NULL, 'http://geo.haverford.edu:8765/geoserver/wms/', 'plate_12_1907', NULL, NULL, NULL, NULL),
(21, 3, NULL, 1, '2014-08-04 02:36:38', '2014-08-06 10:31:25', 0, 1, NULL, 'Plate 2 1907', NULL, NULL, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '1907', 'Simile', 'StaticBubble', '#00aeff', '#00aeff', '#000000', '#000000', 1.00, 1.00, 1.00, 1.00, 2, 10, NULL, NULL, '0', '0', '1907', '3000', NULL, 'http://geo.haverford.edu:8765/geoserver/wms/', 'plate_2_1907', NULL, NULL, NULL, NULL),
(22, 3, NULL, 1, '2014-08-04 02:37:20', '2014-08-06 10:31:06', 0, 1, NULL, 'Plate 7 1907', NULL, NULL, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '1907', 'Simile', 'StaticBubble', '#00aeff', '#00aeff', '#000000', '#000000', 1.00, 1.00, 1.00, 1.00, 2, 10, NULL, NULL, '0', '0', '1907', '3000', NULL, 'http://geo.haverford.edu:8765/geoserver/wms/', 'plate_7_1907', NULL, NULL, NULL, NULL),
(23, 3, NULL, 1, '2014-08-04 02:37:54', '2014-08-06 07:03:59', 0, 1, NULL, 'Plate 8 1907', NULL, NULL, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '1907', 'Simile', 'StaticBubble', '#00aeff', '#00aeff', '#000000', '#000000', 1.00, 1.00, 1.00, 1.00, 2, 10, NULL, NULL, '0', '0', '1907', '3000', NULL, 'http://geo.haverford.edu:8765/geoserver/wms/', 'plate_8_1907', NULL, NULL, NULL, NULL),
(24, 3, NULL, 1, '2014-08-04 02:38:23', '2014-08-06 06:52:12', 0, 1, NULL, 'Plate 9 1907', NULL, NULL, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '1907', 'Simile', 'StaticBubble', '#00aeff', '#00aeff', '#000000', '#000000', 1.00, 1.00, 1.00, 1.00, 2, 10, NULL, NULL, '0', '0', '1907', '3000', NULL, 'http://geo.haverford.edu:8765/geoserver/wms/', 'plate_9_1907', NULL, NULL, NULL, NULL),
(26, 2, 2, 2, '2014-08-06 18:23:35', '2014-08-06 06:32:43', 1, 0, NULL, 'First Electric Street Lamp', 'First Electric Street Lamp', 'This is the first electric streetlamp installed on Lancaster Avenue, at its intersection with City Ave.', '\0\0\0\0\0\0\0\0\0\0\0\0\0 Éô÷öÙ_¡åò~^}éRA', 'light', 'Waypoints', 'StaticBubble', '#00aeff', '#00aeff', '#000000', '#000000', 0.30, 0.40, 0.90, 1.00, 2, 10, NULL, NULL, '1882', NULL, NULL, NULL, NULL, NULL, NULL, 15, NULL, 15, '-8377049.2579088,4863909.0987034'),
(27, 3, 9, 1, '2014-08-06 18:47:17', '2014-08-07 08:25:38', 1, 0, NULL, 'Napoleon Bonaparte''s table', 'Napoleon Bonaparte''s table', '<a href="http://www.bbc.co.uk/history/historic_figures/bonaparte_napoleon.shtml"><img src="http://www.bbc.co.uk/history/historic_figures/images/bonaparte_napoleon.jpg" alt="Napoleon" width="250" height="300"></a></p>', '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\r:¸Qeˇ_¡ü6Oe]ñRAæ5ãÃ˛_¡~ÄˇÙ^òRAC¯<IL¸_¡Ñë(ÒºñRA©ÁMÓ˝_¡†`póRA\r:¸Qeˇ_¡ü6Oe]ñRA', 'grey, old, strange', 'Simile', 'StaticBubble', '#787878', '#787878', '#787878', '#000000', 1.00, 1.00, 0.90, 1.00, 2, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, 20, 14, '-8386325.472649,4872284.5007664'),
(28, 3, 8, 1, '2014-08-06 18:44:04', '2014-08-07 06:34:59', 1, 0, NULL, 'Precious family heirloom', 'Precious family heirloom', NULL, '\0\0\0\0\0\0\0\0\0\0\0\0\0≠"“’‘`¡Ó^Ó†ËäRA', 'family, gold, old', 'Simile', 'StaticBubble', '#DA9100', '#DA9100', '#DA9100', '#000000', 1.00, 1.00, 0.90, 1.00, 2, 10, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, 20, 16, '-8396454.6819013,4860834.514549'),
(29, 3, 7, 1, '2014-08-06 18:41:48', '2014-08-07 08:25:55', 1, 0, NULL, 'First public library', 'First public library', NULL, '\0\0\0\0\0\0\0\0\0\0\0\0\0eõe¸Ú_¡…∞ä{äRA', 'blue, education, first', 'Simile', 'StaticBubble', '#6633FF', '#6633FF', '#6633FF', '#000000', 1.00, 1.00, 0.90, 1.00, 2, 10, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, 20, 17, '-8374287.9437016,4860396.195965'),
(30, 3, 6, 1, '2014-08-06 18:40:14', '2014-08-07 08:18:07', 1, 0, NULL, 'Last Cry of the Buffalo', 'Last cry of the Buffalo ', '<iframe width="100%" height="450" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/151708770&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true"></iframe>', '\0\0\0\0\0\0\0\0\0\0\0\0\0Q„9RÛ_¡)ﬂ˝±çRA', 'old, redd', 'Simile', 'StaticBubble', ': #B20000', '#B20000', '#B20000', '#000000', 1.00, 1.00, 0.90, 1.00, 2, 10, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, 20, 15, '-8375274.4590978,4863780.9231232'),
(31, 3, 5, 1, '2014-08-06 18:36:40', '2014-08-07 08:22:19', 1, 0, NULL, 'Mayor Wilhelm ', 'Mayor Wilhelm ', NULL, '\0\0\0\0\0\0\0\0\0\0\0\0\0ÜÄù¸_¡f‚1YTâRA', 'blue, democrat, politics', 'Simile', 'StaticBubble', '#6633FF', '#6633FF', '#6633FF', '#000000', 1.00, 1.00, 0.90, 1.00, 2, 10, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, 20, 16, '-8385142.0017165,4859217.3936697'),
(32, 3, 4, 1, '2014-08-06 18:35:43', '2014-08-07 08:25:06', 1, 0, NULL, 'Bumbelowski family', 'Bumbelowski family', NULL, '\0\0\0\0\0\0\0\0\0\0\0\0\0ŒoX—\0`¡f—Ö˘ÒëRA', 'blue, family, immigration', 'Simile', 'StaticBubble', '#6633FF', '#6633FF', '#6633FF', '#000000', 1.00, 1.00, 0.90, 1.00, 2, 10, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, 20, 17, '-8388734.5420455,4868039.8987926'),
(33, 3, 3, 1, '2014-08-06 18:32:09', '2014-08-07 08:00:44', 1, 0, NULL, 'First time a car drives down Lancaster ', 'First time a car drives down Lancaster ', '<iframe src="//player.vimeo.com/video/102693238?title=0&amp;byline=0&amp;portrait=0" width="350" height="197" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe> <p><a href="http://vimeo.com/102693238">Driving Through The Notch (rear view) HD</a> from <a href="http://vimeo.com/user24789581">Jaclyn Sovern</a> on <a href="https://vimeo.com">Vimeo</a>.</p>', '\0\0\0\0\0\0\0\0\0\0\0\0\0dNM/˜_¡Í3ÑÍèRA\0\0\0À≠ˇMœ˜_¡Q*a&ëRA', 'first, redd, technology', 'Simile', 'StaticBubble', ': #B20000', '#B20000', '#B20000', '#000000', 1.00, 1.00, 0.90, 1.00, 2, 10, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, 20, 17, '-8380158.5164806,4867308.5218366'),
(34, 3, 2, 1, '2014-08-06 18:17:56', '2014-08-07 08:04:40', 1, 0, NULL, 'First Electric Street Lamp', 'First Electric Street Lamp', '\n\n<img src="http://33.media.tumblr.com/3d0412eb1ae1aa4565e5b822be79f047/tumblr_mlxd635pkC1s2skm4o1_500.gif" alt="some_text">\n', '\0\0\0\0\0\0\0\0\0\0\0\0\0 Éô÷öÙ_¡åò~^}éRA', 'first, redd, technology', 'Simile', 'StaticBubble', ': #B20000', '#B20000', '#B20000', '#000000', 1.00, 1.00, 0.90, 1.00, 2, 10, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, 20, 15, '-8376939.3531198,4864501.4764768'),
(35, 3, NULL, 1, '2014-08-07 06:24:59', '2014-08-07 07:57:33', 1, 0, NULL, '\n\n<p>Zoom in to find more. Try clicking on points such as these:</p>\n\n<p style="text-align:center;><a href="http://ds.haverford.edu/lancasterproject/neatline/show/demonstration#records/31"><img src="http://www.clker.com/cliparts/c/F/b/R/J/N/smaller-blue-dot-md.png" alt="HTML tutorial" width="25" height="25"></a> </p>', NULL, 'Who knows what you will find when you zoom in. ', '\0\0\0\0\0\0\0\0\0\0\0\0\0Ì<ªÌª¸_¡<sE $íRA', NULL, 'Waypoints', 'StaticBubble', '#ffffff', '#00aeff', '#000000', '#000000', 0.00, 0.00, 0.00, 0.00, 2, 10, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, '-8382347.1641932,4864416.2641682'),
(36, 3, NULL, 1, '2014-08-07 06:32:42', '2014-08-07 07:02:37', 1, 0, NULL, 'Haverford College', NULL, '<object data=http://www.haverford.edu width="400" height="400"> <embed src=http://www.haverford.edu width="600" height="400"> </embed> \n\nError: Embedded data could not be displayed. </object>\n', '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ìN)˙_¡Rì¥‘ëRA≠´›∂û˘_¡PëRAıï—˘˙_¡Éê‚ãPêRAπ´≤ÅE˚_¡——Ö€5ëRAìN)˙_¡Rì¥‘ëRA', NULL, NULL, 'StaticBubble', '#00aeff', '#00aeff', '#000000', '#000000', 0.30, 0.40, 0.90, 1.00, 2, 10, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13, NULL, 16, '-8382060.525337,4867511.9638132'),
(37, 3, NULL, 1, '2014-08-07 07:00:55', '2014-08-07 07:57:33', 0, 0, NULL, ' for more information.', NULL, NULL, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', NULL, 'Waypoints', 'StaticBubble', '#00aeff', '#00aeff', '#000000', '#000000', 0.30, 0.40, 0.90, 1.00, 2, 10, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, '-8382270.7271649,4866867.0263874'),
(38, 3, NULL, 1, '2014-08-07 07:14:42', '2014-08-07 07:57:33', 0, 0, NULL, '<p>There are many interesting items hidden across this map.</p>', NULL, NULL, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', NULL, 'Waypoints', 'StaticBubble', '#00aeff', '#00aeff', '#000000', '#000000', 0.30, 0.40, 0.90, 1.00, 2, 10, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, '-8384334.5269284,4868773.1747799'),
(39, 3, NULL, 1, '2014-08-07 07:56:46', '2014-08-07 07:57:33', 0, 0, NULL, 'Try scrolling through the timeline...', NULL, 'And see what happens to the maps.', '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', NULL, 'Waypoints', 'StaticBubble', '#00aeff', '#00aeff', '#000000', '#000000', 0.30, 0.40, 0.90, 1.00, 2, 10, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(40, 2, NULL, 2, '2014-08-07 12:30:59', '2014-08-07 12:35:38', 0, 1, NULL, 'Plate whatever', NULL, NULL, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', NULL, 'Waypoints', 'StaticBubble', '#00aeff', '#00aeff', '#000000', '#000000', 0.90, 0.90, 0.90, 1.00, 2, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'http://geo.haverford.edu:8765/geoserver/wms/', 'plate_15_1900', NULL, NULL, NULL, NULL),
(41, 1, 9, 4, '2014-08-06 18:47:17', '2014-08-07 13:17:37', 0, 0, NULL, NULL, 'Napoleon Bonaparte''s table', NULL, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', NULL, NULL, 'StaticBubble', '#00aeff', '#00aeff', '#000000', '#000000', 0.30, 0.40, 0.90, 1.00, 2, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(42, 1, 8, 4, '2014-08-06 18:44:04', '2014-08-07 13:17:37', 1, 0, NULL, NULL, 'Precious family heirloom', NULL, '\0\0\0\0\0\0\0\0\0\0\0\0\0≠"“’‘`¡Ó^Ó†ËäRA', NULL, NULL, 'StaticBubble', '#00aeff', '#00aeff', '#000000', '#000000', 0.30, 0.40, 0.90, 1.00, 2, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(43, 1, 6, 4, '2014-08-06 18:40:14', '2014-08-07 13:17:37', 0, 0, NULL, NULL, 'Last cry of the Buffalo ', NULL, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', NULL, NULL, 'StaticBubble', '#00aeff', '#00aeff', '#000000', '#000000', 0.30, 0.40, 0.90, 1.00, 2, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `omeka_neatline_simile_exhibit_expansions`
--

CREATE TABLE IF NOT EXISTS `omeka_neatline_simile_exhibit_expansions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `simile_default_date` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `simile_interval_unit` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `simile_interval_pixels` int(10) unsigned DEFAULT NULL,
  `simile_tape_height` int(10) unsigned DEFAULT NULL,
  `simile_track_height` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `omeka_neatline_simile_exhibit_expansions`
--

INSERT INTO `omeka_neatline_simile_exhibit_expansions` (`id`, `parent_id`, `simile_default_date`, `simile_interval_unit`, `simile_interval_pixels`, `simile_tape_height`, `simile_track_height`) VALUES
(1, 1, '1886', 'YEAR', 100, 5, 10),
(2, 2, NULL, 'YEAR', 100, 10, 30),
(3, 4, NULL, 'YEAR', 100, 10, 30);

-- --------------------------------------------------------

--
-- Table structure for table `omeka_options`
--

CREATE TABLE IF NOT EXISTS `omeka_options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=78 ;

--
-- Dumping data for table `omeka_options`
--

INSERT INTO `omeka_options` (`id`, `name`, `value`) VALUES
(1, 'omeka_version', '2.2.2'),
(2, 'administrator_email', 'lallen@haverford.edu'),
(3, 'copyright', ''),
(4, 'site_title', 'The Lancaster Avenue Project'),
(5, 'author', ''),
(6, 'description', ''),
(13, 'path_to_convert', '/usr/bin'),
(14, 'admin_theme', 'default'),
(16, 'file_extension_whitelist', 'aac,aif,aiff,asf,asx,avi,bmp,c,cc,class,css,divx,doc,docx,exe,gif,gz,gzip,h,ico,j2k,jp2,jpe,jpeg,jpg,m4a,mdb,mid,midi,mov,mp2,mp3,mp4,mpa,mpe,mpeg,mpg,mpp,odb,odc,odf,odg,odp,ods,odt,ogg, pdf,png,pot,pps,ppt,pptx,qt,ra,ram,rtf,rtx,swf,tar,tif,tiff,txt, wav,wax,wma,wmv,wmx,wri,xla,xls,xlsx,xlt,xlw,zip'),
(17, 'file_mime_type_whitelist', 'application/msword,application/ogg,application/pdf,application/rtf,application/vnd.ms-access,application/vnd.ms-excel,application/vnd.ms-powerpoint,application/vnd.ms-project,application/vnd.ms-write,application/vnd.oasis.opendocument.chart,application/vnd.oasis.opendocument.database,application/vnd.oasis.opendocument.formula,application/vnd.oasis.opendocument.graphics,application/vnd.oasis.opendocument.presentation,application/vnd.oasis.opendocument.spreadsheet,application/vnd.oasis.opendocument.text,application/x-ms-wmp,application/x-ogg,application/x-gzip,application/x-msdownload,application/x-shockwave-flash,application/x-tar,application/zip,audio/aac,audio/aiff,audio/mid,audio/midi,audio/mp3,audio/mp4,audio/mpeg,audio/mpeg3,audio/ogg,audio/wav,audio/wma,audio/x-aac,audio/x-aiff,audio/x-midi,audio/x-mp3,audio/x-mp4,audio/x-mpeg,audio/x-mpeg3,audio/x-mpegaudio,audio/x-ms-wax,audio/x-realaudio,audio/x-wav,audio/x-wma,image/bmp,image/gif,image/icon,image/jpeg,image/pjpeg,image/png,image/tiff,image/x-icon,image/x-ms-bmp,text/css,text/plain,text/richtext,text/rtf,video/asf,video/avi,video/divx,video/mp4,video/mpeg,video/msvideo,video/ogg,video/quicktime,video/x-ms-wmv,video/x-msvideo'),
(18, 'disable_default_file_validation', ''),
(20, 'display_system_info', '1'),
(21, 'html_purifier_is_enabled', '1'),
(22, 'html_purifier_allowed_html_elements', 'p,br,strong,em,span,div,ul,ol,li,a,h1,h2,h3,h4,h5,h6,address,pre,table,tr,td,blockquote,thead,tfoot,tbody,th,dl,dt,dd,q,small,strike,sup,sub,b,i,big,small,tt'),
(23, 'html_purifier_allowed_html_attributes', '*.style,*.class,a.href,a.title,a.target'),
(24, 'tag_delimiter', ','),
(26, 'search_record_types', 'a:3:{s:4:"Item";s:4:"Item";s:4:"File";s:4:"File";s:10:"Collection";s:10:"Collection";}'),
(27, 'api_enable', ''),
(28, 'api_per_page', '50'),
(31, 'exhibit_builder_sort_browse', 'added'),
(33, 'redact_elements_settings', '{"overrides":["super"],"replacement":"[REDACTED]","patterns":[{"label":"Email Address","regex":"\\\\b[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\\\.[a-zA-Z]{2,4}\\\\b"},{"label":"URL","regex":"\\\\b((([A-Za-z]{3,9}:(?:\\\\\\/\\\\\\/)?)(?:[\\\\-;:&=\\\\+\\\\$,\\\\w]+@)?[A-Za-z0-9\\\\.\\\\-]+|(?:www\\\\.|[\\\\-;:&=\\\\+\\\\$,\\\\w]+@)[A-Za-z0-9\\\\.\\\\-]+)((?:\\\\\\/[\\\\+~%\\\\\\/\\\\.\\\\w\\\\-_]*)?\\\\??(?:[\\\\-\\\\+=&;%@\\\\.\\\\w_]*)#?(?:[\\\\.\\\\!\\\\\\/\\\\\\\\w]*))?)\\\\b"},{"label":"IP Address","regex":"\\\\b(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\\\\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\\\\b"}],"elements":[]}'),
(35, 'simple_pages_filter_page_content', '0'),
(38, 'csv_import_memory_limit', ''),
(39, 'csv_import_php_path', ''),
(40, 'csv_import_column_delimiter', ','),
(41, 'csv_import_element_delimiter', ''),
(42, 'csv_import_tag_delimiter', ','),
(43, 'csv_import_file_delimiter', ','),
(45, 'theme_berlin_default_options', 'a:11:{s:4:"logo";N;s:12:"header_image";N;s:21:"display_featured_item";s:1:"1";s:27:"display_featured_collection";s:1:"1";s:24:"display_featured_exhibit";s:1:"1";s:21:"homepage_recent_items";N;s:13:"homepage_text";N;s:11:"footer_text";N;s:24:"display_footer_copyright";s:1:"0";s:19:"use_advanced_search";s:1:"0";s:17:"theme_config_csrf";N;}'),
(50, 'hide_elements_settings', '{"override":[],"form":{"Dublin Core":{"Subject":"1","Description":"1","Creator":"1","Source":"1","Publisher":"1","Date":"1","Contributor":"1","Rights":"1","Relation":"1","Format":"1","Language":"1","Type":"1","Identifier":"1"}},"admin":{"Dublin Core":{"Subject":"1","Description":"1","Creator":"1","Source":"1","Publisher":"1","Date":"1","Contributor":"1","Rights":"1","Relation":"1","Format":"1","Language":"1","Type":"1","Identifier":"1"}},"public":{"Dublin Core":{"Subject":"1","Description":"1","Creator":"1","Source":"1","Publisher":"1","Date":"1","Contributor":"1","Rights":"1","Relation":"1","Format":"1","Language":"1","Type":"1","Identifier":"1"}},"search":{"Dublin Core":{"49":"1","41":"1","39":"1","48":"1","45":"1","40":"1","37":"1","47":"1","46":"1","42":"1","44":"1","51":"1","43":"1"}}}'),
(53, 'theme_berlin_options', 'a:10:{s:4:"logo";N;s:12:"header_image";N;s:21:"display_featured_item";s:1:"0";s:27:"display_featured_collection";s:1:"0";s:24:"display_featured_exhibit";s:1:"0";s:21:"homepage_recent_items";s:0:"";s:13:"homepage_text";s:0:"";s:11:"footer_text";s:0:"";s:24:"display_footer_copyright";s:1:"0";s:19:"use_advanced_search";s:1:"0";}'),
(54, 'public_navigation_main', '[{"uid":"\\/lancasterproject\\/items\\/browse","can_delete":false,"label":"Browse Items","fragment":null,"id":null,"class":null,"title":null,"target":null,"accesskey":null,"rel":[],"rev":[],"customHtmlAttribs":[],"order":1,"resource":null,"privilege":null,"active":false,"visible":true,"type":"Omeka_Navigation_Page_Uri","pages":[],"uri":"\\/lancasterproject\\/items\\/browse"},{"uid":"\\/lancasterproject\\/collections\\/browse","can_delete":false,"label":"Browse Collections","fragment":null,"id":null,"class":null,"title":null,"target":null,"accesskey":null,"rel":[],"rev":[],"customHtmlAttribs":[],"order":2,"resource":null,"privilege":null,"active":false,"visible":true,"type":"Omeka_Navigation_Page_Uri","pages":[],"uri":"\\/lancasterproject\\/collections\\/browse"},{"uid":"\\/lancasterproject\\/exhibits","can_delete":false,"label":"Browse Exhibits","fragment":null,"id":null,"class":null,"title":null,"target":null,"accesskey":null,"rel":[],"rev":[],"customHtmlAttribs":[],"order":3,"resource":null,"privilege":null,"active":false,"visible":false,"type":"Omeka_Navigation_Page_Uri","pages":[],"uri":"\\/lancasterproject\\/exhibits"},{"uid":"\\/lancasterproject\\/neatline","can_delete":false,"label":"Neatline","fragment":null,"id":null,"class":null,"title":null,"target":null,"accesskey":null,"rel":[],"rev":[],"customHtmlAttribs":[],"order":4,"resource":null,"privilege":null,"active":false,"visible":true,"type":"Omeka_Navigation_Page_Uri","pages":[],"uri":"\\/lancasterproject\\/neatline"},{"uid":"\\/lancasterproject\\/about","can_delete":false,"label":"About","fragment":null,"id":null,"class":null,"title":null,"target":null,"accesskey":null,"rel":[],"rev":[],"customHtmlAttribs":[],"order":5,"resource":null,"privilege":null,"active":false,"visible":true,"type":"Omeka_Navigation_Page_Uri","pages":[],"uri":"\\/lancasterproject\\/about"}]'),
(55, 'homepage_uri', '/'),
(56, 'fullsize_constraint', '800'),
(57, 'thumbnail_constraint', '200'),
(58, 'square_thumbnail_constraint', '200'),
(59, 'per_page_admin', '50'),
(60, 'per_page_public', '10'),
(61, 'show_empty_elements', '0'),
(62, 'show_element_set_headings', '1'),
(64, 'theme_seasons_options', 'a:12:{s:11:"style_sheet";s:6:"winter";s:4:"logo";N;s:21:"display_featured_item";s:1:"1";s:27:"display_featured_collection";s:1:"1";s:24:"display_featured_exhibit";s:1:"1";s:21:"homepage_recent_items";N;s:13:"homepage_text";N;s:11:"footer_text";N;s:24:"display_footer_copyright";s:1:"0";s:17:"item_file_gallery";s:1:"0";s:19:"use_advanced_search";s:1:"1";s:17:"theme_config_csrf";N;}'),
(70, 'theme_berlin_old_options', 'a:11:{s:4:"logo";N;s:12:"header_image";N;s:21:"display_featured_item";s:1:"1";s:27:"display_featured_collection";s:1:"1";s:24:"display_featured_exhibit";s:1:"1";s:21:"homepage_recent_items";N;s:13:"homepage_text";N;s:11:"footer_text";N;s:24:"display_footer_copyright";s:1:"0";s:19:"use_advanced_search";s:1:"0";s:17:"theme_config_csrf";N;}'),
(76, 'public_theme', 'berlin_old'),
(77, 'omeka_update', 'a:2:{s:14:"latest_version";s:5:"2.2.2";s:12:"last_updated";i:1407346137;}');

-- --------------------------------------------------------

--
-- Table structure for table `omeka_plugins`
--

CREATE TABLE IF NOT EXISTS `omeka_plugins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(4) NOT NULL,
  `version` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `active_idx` (`active`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=21 ;

--
-- Dumping data for table `omeka_plugins`
--

INSERT INTO `omeka_plugins` (`id`, `name`, `active`, `version`) VALUES
(1, 'Coins', 1, '2.0.3'),
(2, 'DerivativeImages', 1, '2.0'),
(3, 'ExhibitBuilder', 1, '3.1.1'),
(4, 'ItemOrder', 1, '2.0.1'),
(6, 'NeatlineSimile', 1, '2.0.1'),
(7, 'NeatlineWaypoints', 1, '2.0.2'),
(8, 'RecordRelations', 1, '2.0'),
(9, 'RedactElements', 1, '1.0'),
(10, 'ShortcodeCarousel', 1, '1.0'),
(11, 'SimplePages', 1, '3.0.1'),
(12, 'SimpleVocab', 1, '2.0.1'),
(13, 'HideElements', 1, '1.3'),
(14, 'CsvImport', 1, '2.0.2'),
(15, 'NeatlineFeatures', 1, '2.0.4'),
(19, 'Neatline', 1, '2.3.0'),
(20, 'NeatlineText', 1, '0.2');

-- --------------------------------------------------------

--
-- Table structure for table `omeka_processes`
--

CREATE TABLE IF NOT EXISTS `omeka_processes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `pid` int(10) unsigned DEFAULT NULL,
  `status` enum('starting','in progress','completed','paused','error','stopped') COLLATE utf8_unicode_ci NOT NULL,
  `args` text COLLATE utf8_unicode_ci NOT NULL,
  `started` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `stopped` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `pid` (`pid`),
  KEY `started` (`started`),
  KEY `stopped` (`stopped`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `omeka_processes`
--

INSERT INTO `omeka_processes` (`id`, `class`, `user_id`, `pid`, `status`, `args`, `started`, `stopped`) VALUES
(1, 'Omeka_Job_Process_Wrapper', 3, NULL, 'completed', 'a:1:{s:3:"job";s:210:"{"className":"Neatline_Job_ImportItems","options":{"exhibit_id":1,"query":{"range":"1","collection":"","type":"","tags":"","submit_search":"Import Items"}},"createdAt":"2014-08-01T09:43:01-04:00","createdBy":3}";}', '2014-08-01 13:43:04', '2014-08-01 13:43:06'),
(2, 'Omeka_Job_Process_Wrapper', 3, NULL, 'completed', 'a:1:{s:3:"job";s:209:"{"className":"Neatline_Job_ImportItems","options":{"exhibit_id":1,"query":{"range":"","collection":"","type":"","tags":"","submit_search":"Import Items"}},"createdAt":"2014-08-01T09:43:16-04:00","createdBy":3}";}', '2014-08-01 13:43:16', '2014-08-01 13:43:17'),
(3, 'Omeka_Job_Process_Wrapper', 3, NULL, 'completed', 'a:1:{s:3:"job";s:209:"{"className":"Neatline_Job_ImportItems","options":{"exhibit_id":1,"query":{"range":"","collection":"","type":"","tags":"","submit_search":"Import Items"}},"createdAt":"2014-08-06T14:49:35-04:00","createdBy":3}";}', '2014-08-06 18:49:35', '2014-08-06 18:49:35'),
(4, 'Omeka_Job_Process_Wrapper', 1, NULL, 'completed', 'a:1:{s:3:"job";s:212:"{"className":"Neatline_Job_ImportItems","options":{"exhibit_id":4,"query":{"range":"","collection":"","type":"","tags":"old","submit_search":"Import Items"}},"createdAt":"2014-08-07T09:17:37-04:00","createdBy":1}";}', '2014-08-07 13:17:37', '2014-08-07 13:17:37');

-- --------------------------------------------------------

--
-- Table structure for table `omeka_records_tags`
--

CREATE TABLE IF NOT EXISTS `omeka_records_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `record_id` int(10) unsigned NOT NULL,
  `record_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tag_id` int(10) unsigned NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag` (`record_type`,`record_id`,`tag_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=26 ;

--
-- Dumping data for table `omeka_records_tags`
--

INSERT INTO `omeka_records_tags` (`id`, `record_id`, `record_type`, `tag_id`, `time`) VALUES
(1, 2, 'Item', 1, '2014-08-06 18:32:43'),
(2, 2, 'Item', 2, '2014-08-06 18:32:43'),
(3, 2, 'Item', 3, '2014-08-06 18:32:43'),
(4, 3, 'Item', 1, '2014-08-06 18:33:01'),
(5, 3, 'Item', 2, '2014-08-06 18:33:01'),
(6, 3, 'Item', 3, '2014-08-06 18:33:01'),
(7, 4, 'Item', 4, '2014-08-06 18:35:43'),
(8, 4, 'Item', 5, '2014-08-06 18:35:43'),
(9, 4, 'Item', 6, '2014-08-06 18:35:43'),
(10, 5, 'Item', 7, '2014-08-06 18:37:28'),
(11, 5, 'Item', 6, '2014-08-06 18:37:28'),
(12, 5, 'Item', 8, '2014-08-06 18:37:28'),
(14, 6, 'Item', 2, '2014-08-06 18:40:14'),
(16, 7, 'Item', 1, '2014-08-06 18:41:48'),
(17, 7, 'Item', 11, '2014-08-06 18:41:48'),
(18, 7, 'Item', 6, '2014-08-06 18:41:48'),
(19, 8, 'Item', 12, '2014-08-06 18:46:55'),
(20, 8, 'Item', 5, '2014-08-06 18:46:55'),
(21, 8, 'Item', 13, '2014-08-06 18:46:55'),
(22, 9, 'Item', 14, '2014-08-06 18:47:17'),
(23, 9, 'Item', 15, '2014-08-06 18:47:17'),
(24, 9, 'Item', 12, '2014-08-06 18:47:17'),
(25, 6, 'Item', 12, '2014-08-06 18:47:57');

-- --------------------------------------------------------

--
-- Table structure for table `omeka_record_relations_properties`
--

CREATE TABLE IF NOT EXISTS `omeka_record_relations_properties` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vocabulary_id` int(10) unsigned NOT NULL,
  `local_part` varchar(100) NOT NULL,
  `label` varchar(100) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=92 ;

--
-- Dumping data for table `omeka_record_relations_properties`
--

INSERT INTO `omeka_record_relations_properties` (`id`, `vocabulary_id`, `local_part`, `label`, `description`) VALUES
(1, 1, 'account_of', 'has account', 'The user account relates to this person'),
(2, 1, 'has_space', 'has space', 'The resource is in the object sioc:Space'),
(3, 1, 'member_of', 'member of', 'A Usergroup that this UserAccount is a member of.'),
(4, 1, 'has_member', 'has member', 'A UserAccount that is a member of this Usergroup.'),
(5, 1, 'has_container', 'has container', 'The Container to which this Item belongs.'),
(6, 2, 'relation', 'Relation', 'A related resource.'),
(7, 2, 'conformsTo', 'Conforms To', 'An established standard to which the described resource conforms.'),
(8, 2, 'hasFormat', 'Has Format', 'A related resource that is substantially the same as the pre-existing described resource, but in another format.'),
(9, 2, 'hasPart', 'Has Part', 'A related resource that is included either physically or logically in the described resource.'),
(10, 2, 'hasVersion', 'Has Version', 'A related resource that is a version, edition, or adaptation of the described resource.'),
(11, 2, 'isFormatOf', 'Is Format Of', 'A related resource that is substantially the same as the described resource, but in another format.'),
(12, 2, 'isPartOf', 'Is Part Of', 'A related resource in which the described resource is physically or logically included.'),
(13, 2, 'isReferencedBy', 'Is Referenced By', 'A related resource that references, cites, or otherwise points to the described resource.'),
(14, 2, 'isReplacedBy', 'Is Replaced By', 'A related resource that supplants, displaces, or supersedes the described resource.'),
(15, 2, 'isRequiredBy', 'Is Required By', 'A related resource that requires the described resource to support its function, delivery, or coherence.'),
(16, 2, 'isVersionOf', 'Is Version Of', 'A related resource of which the described resource is a version, edition, or adaptation.'),
(17, 2, 'references', 'References', 'A related resource that is referenced, cited, or otherwise pointed to by the described resource.'),
(18, 2, 'replaces', 'Replaces', 'A related resource that is supplanted, displaced, or superseded by the described resource.'),
(19, 2, 'requires', 'Requires', 'A related resource that is required by the described resource to support its function, delivery, or coherence.'),
(20, 2, 'source', 'Source', 'A related resource from which the described resource is derived.'),
(21, 3, 'annotates', 'annotates', 'Critical or explanatory note for a Document.'),
(22, 3, 'citedBy', 'cited by', 'Relates a document to another document that cites the first document.'),
(23, 3, 'cites', 'cites', 'Relates a document to another document that is cited by the first document as reference, comment, review, quotation or for another purpose.'),
(24, 3, 'reviewOf', 'review of', 'Relates a review document to a reviewed thing (resource, item, etc.).'),
(25, 3, 'reproducedIn', 'reproduced in', 'The resource in which another resource is reproduced.'),
(26, 3, 'affirmedBy', 'affirmed by', 'A legal decision that affirms a ruling.'),
(27, 3, 'reversedBy', 'reversed by', 'A legal decision that reverses a ruling.'),
(28, 3, 'subsequentLegalDecision', 'subsequent legal decision', 'A legal decision on appeal that takes action on a case (affirming it, reversing it, etc.).'),
(29, 3, 'transcriptOf', 'transcript of', 'Relates a document to some transcribed original.'),
(30, 3, 'translationOf', 'translation of', 'Relates a translated document to the original document.'),
(31, 4, 'based_near', 'based near', 'A location that something is based near, for some broadly human notion of near.'),
(32, 4, 'depiction', 'depiction', 'A depiction of some thing.'),
(33, 4, 'depicts', 'depicts', 'A thing depicted in this representation.'),
(34, 4, 'fundedBy', 'funded by', 'An organization funding a project or person.'),
(35, 4, 'img', 'image', 'An image that can be used to represent some thing (ie. those depictions which are particularly representative of something, eg. one''s photo on a homepage).'),
(36, 4, 'isPrimaryTopicOf', 'is primary topic of', 'A document that this thing is the primary topic of.'),
(37, 4, 'knows', 'knows', 'A person known by this person (indicating some level of reciprocated interaction between the parties).'),
(38, 4, 'logo', 'logo', 'A logo representing some thing.'),
(39, 4, 'made', 'made', 'Something that was made by this agent.'),
(40, 4, 'maker', 'maker', 'An agent that made this thing.'),
(41, 4, 'member', 'member', 'Indicates a member of a Group.'),
(42, 4, 'page', 'page', 'A page or document about this thing.'),
(43, 4, 'primaryTopic', 'primary topic', 'The primary topic of some page or document.'),
(44, 4, 'thumbnail', 'thumbnail', 'A derived thumbnail image.'),
(45, 5, 'abridgement', 'abridgement', 'A property representing an abridgment of an expression.'),
(46, 5, 'abridgementOf', 'abridgement of', 'A property representing an expression that is abridged.'),
(47, 5, 'adaption', 'adaption', 'A property representing an adaption of a work or expression.'),
(48, 5, 'adaptionOf', 'adaption of', 'A property representing a work or expression that is adapted.'),
(49, 5, 'alternate', 'alternate', 'A property representing an alternative to a manifestation.'),
(50, 5, 'alternateOf', 'alternate of', 'A property representing a manifestation that is alternated.'),
(51, 5, 'arrangement', 'arrangement', 'A property representing an arrangement of an expression.'),
(52, 5, 'arrangementOf', 'arrangement of', 'A property representing an expression that is arranged.'),
(53, 5, 'complement', 'complement', 'A property representing a complement to a work or expression.'),
(54, 5, 'complementOf', 'complement of', 'A property representing a work or expression that is complemented.'),
(55, 5, 'creator', 'creator', 'A property representing an entity in some way responsible for the creation of a work.'),
(56, 5, 'creatorOf', 'creator of', 'A property representing a work that was in some way created by of an entity.'),
(57, 5, 'embodiment', 'embodiment', 'A property representing a manifestation that embodies an expression.'),
(58, 5, 'embodimentOf', 'embodiment of', 'A property representing an expression that is embodied by a manifestation.'),
(59, 5, 'exemplar', 'exemplar', 'A property representing an item that is an exemplar of a manifestation.'),
(60, 5, 'exemplarOf', 'exemplar of', 'A property representing the manifestation that is exemplified by a item.'),
(61, 5, 'imitation', 'imitation', 'A property representing an imitation of a work or expression.'),
(62, 5, 'imitationOf', 'imitation of', 'A property representing a work or expression that is imitated.'),
(63, 5, 'owner', 'owner', 'A property representing an entity that owns an item.'),
(64, 5, 'ownerOf', 'owner of', 'A property representing an item that is in some way owned an entity.'),
(65, 5, 'part', 'part', 'A property representing a part of an endeavour.'),
(66, 5, 'partOf', 'part of', 'A property representing an endeavour incorporating an endeavour.'),
(67, 5, 'producer', 'producer', 'A property representing an entity in some way responsible for producing a manifestation.'),
(68, 5, 'producerOf', 'producer of', 'A property representing a manifestation that was in some way produced an entity.'),
(69, 5, 'realization', 'realization', 'A property representing an expression that is an intellectual or artistic realization of a work.'),
(70, 5, 'realizationOf', 'realization of', 'A property representing the work that has been realized by an expression.'),
(71, 5, 'realizer', 'realizer', 'A property representing an entity in some way responsible for realizing an expression.'),
(72, 5, 'realizerOf', 'realizer of', 'A property representing an expression that was in some way realized by an entity.'),
(73, 5, 'reconfiguration', 'reconfiguration', 'A property representing a recongifuration of an item.'),
(74, 5, 'reconfigurationOf', 'reconfiguration of', 'A property representing an item that is reconfigured.'),
(75, 5, 'relatedEndeavour', 'related endeavour', 'A property representing another endeavour that is related in some way to an endeavour.'),
(76, 5, 'reproduction', 'reproduction', 'A property representing a reproduction of a manifestation or item.'),
(77, 5, 'reproductionOf', 'reproduction of', 'A property representing a manifestation or item that is reproduced.'),
(78, 5, 'responsibleEntity', 'responsible entity', 'A property representing an entity in some way responsible for an endeavour.'),
(79, 5, 'responsibleEntityOf', 'responsible entity of', 'A property representing an endeavour that is the responsibility of an entity.'),
(80, 5, 'revision', 'revision', 'A property representing a revision of an expression.'),
(81, 5, 'revisionOf', 'revision of', 'A property representing an expression that is revised.'),
(82, 5, 'successor', 'successor', 'A property representing a successor to a work or expression.'),
(83, 5, 'successorOf', 'successor of', 'A property representing a work or expression that is succeeded.'),
(84, 5, 'summarization', 'summarization', 'A property representing a summarization of a work or expression.'),
(85, 5, 'summarizationOf', 'summarization of', 'A property representing a work or expression that is summarized.'),
(86, 5, 'supplement', 'supplement', 'A property representing a supplement to a work or expression.'),
(87, 5, 'supplementOf', 'supplement of', 'A property representing a work or expression that is supplemented.'),
(88, 5, 'transformation', 'transformation', 'A property representing a transformation of a work or expression.'),
(89, 5, 'transformationOf', 'transformation of', 'A property representing a work or expression that is transformed.'),
(90, 5, 'translation', 'translation', 'A property representing a translation of an expression.'),
(91, 5, 'translationOf', 'translation of', 'A property representing an expression that is translated.');

-- --------------------------------------------------------

--
-- Table structure for table `omeka_record_relations_relations`
--

CREATE TABLE IF NOT EXISTS `omeka_record_relations_relations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subject_id` int(10) unsigned NOT NULL,
  `property_id` int(10) unsigned NOT NULL,
  `object_id` int(10) unsigned NOT NULL,
  `subject_record_type` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `object_record_type` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(10) unsigned NOT NULL,
  `public` int(1) unsigned DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `omeka_record_relations_vocabularies`
--

CREATE TABLE IF NOT EXISTS `omeka_record_relations_vocabularies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text,
  `namespace_prefix` varchar(100) NOT NULL,
  `namespace_uri` varchar(200) NOT NULL,
  `custom` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `omeka_record_relations_vocabularies`
--

INSERT INTO `omeka_record_relations_vocabularies` (`id`, `name`, `description`, `namespace_prefix`, `namespace_uri`, `custom`) VALUES
(1, 'Semantically Interlinked Online Communities', 'Relations from SIOC http://sioc-project.org', 'sioc', 'http://rdfs.org/sioc/ns#', 0),
(2, 'Dublin Core', 'Relations defined by DCMI Metadata Terms: http://dublincore.org/documents/dcmi-terms/', 'dcterms', 'http://purl.org/dc/terms/', 0),
(3, 'BIBO', 'Relations defined by the Bibliographic Ontology (BIBO): http://bibotools.googlecode.com/svn/bibo-ontology/trunk/doc/index.html', 'bibo', 'http://purl.org/ontology/bibo/', 0),
(4, 'FOAF', 'Relations defined by the Friend of a Friend vocabulary (FOAF): http://xmlns.com/foaf/spec/', 'foaf', 'http://xmlns.com/foaf/0.1/', 0),
(5, 'FRBR', 'Relations defined by the Functional Requirements for Bibliographic Records (FRBR): http://vocab.org/frbr/core.html', 'frbr', 'http://purl.org/vocab/frbr/core#', 0);

-- --------------------------------------------------------

--
-- Table structure for table `omeka_schema_migrations`
--

CREATE TABLE IF NOT EXISTS `omeka_schema_migrations` (
  `version` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `omeka_schema_migrations`
--

INSERT INTO `omeka_schema_migrations` (`version`) VALUES
('20100401000000'),
('20100810120000'),
('20110113000000'),
('20110124000001'),
('20110301103900'),
('20110328192100'),
('20110426181300'),
('20110601112200'),
('20110627223000'),
('20110824110000'),
('20120112100000'),
('20120220000000'),
('20120221000000'),
('20120224000000'),
('20120224000001'),
('20120402000000'),
('20120516000000'),
('20120612112000'),
('20120623095000'),
('20120710000000'),
('20120723000000'),
('20120808000000'),
('20120808000001'),
('20120813000000'),
('20120914000000'),
('20121007000000'),
('20121015000000'),
('20121015000001'),
('20121018000001'),
('20121110000000'),
('20121218000000'),
('20130422000000'),
('20130426000000'),
('20130429000000'),
('20130701000000'),
('20130809000000'),
('20140304131700');

-- --------------------------------------------------------

--
-- Table structure for table `omeka_search_texts`
--

CREATE TABLE IF NOT EXISTS `omeka_search_texts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `record_type` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `record_id` int(10) unsigned NOT NULL,
  `public` tinyint(1) NOT NULL,
  `title` tinytext COLLATE utf8_unicode_ci,
  `text` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `record_name` (`record_type`,`record_id`),
  FULLTEXT KEY `text` (`text`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=11 ;

--
-- Dumping data for table `omeka_search_texts`
--

INSERT INTO `omeka_search_texts` (`id`, `record_type`, `record_id`, `public`, `title`, `text`) VALUES
(1, 'SimplePagesPage', 1, 1, 'About', 'About <p>This is an example page. Feel free to replace this content, or delete the page and start from scratch.</p> '),
(4, 'Item', 3, 1, 'First time a car drives down Lancaster ', 'first red technology First time a car drives down Lancaster  POINT(-8379581.2079096 4865962.0656686)|13|-8380613.1077913|4864425.2633852|osm\r\n Momentous occasion '),
(3, 'Item', 2, 1, 'First Electric Street Lamp', 'first red technology First Electric Street Lamp POINT(-8376939.3531198 4864501.4764768)|15|-8377297.6516899|4864322.7004195|osm\r\n Is this a "Thing" or an "Event"? '),
(5, 'Item', 4, 1, 'Bumbelowski family', 'blue family immigration Bumbelowski family POINT(-8388734.5420455 4868039.8987926)|3|0.0000000|0.0000000|osm\r\n Polish family in first wave of Polish Immigration  "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." Very high '),
(6, 'Item', 5, 1, 'Mayor Wilhelm ', 'blue democrat politics Mayor Wilhelm  POINT(-8385142.0017165 4859217.3936697)|3|-9490421.4305667|3561354.0213672|osm\r\n "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." Very low '),
(7, 'Item', 6, 1, 'Last cry of the Buffalo ', 'old red Last cry of the Buffalo  Last cry of the Buffalo  Very rare.  '),
(8, 'Item', 7, 1, 'First public library', 'blue education first First public library POINT(-8374287.9437016 4860396.195965)|11|-8370236.7812031|4854401.8608883|osm\r\n The first public library along Lancaster "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." '),
(9, 'Item', 8, 1, 'Precious family heirloom', 'family gold old Precious family heirloom POINT(-8396454.6819013 4860834.514549)|9|-8395231.6894488|4831353.7082063|osm\r\n This item of the Malvern family connects the history of Lancaster to this broader trend noticed during the turn of the century.  "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." Surprisingly high '),
(10, 'Item', 9, 1, 'Napoleon Bonaparte''s table', 'grey old strange Napoleon Bonaparte''s table Usu ea laoreet molestie appetere. Vis solum copiosae explicari an, lobortis vituperata suscipiantur quo ut. Iudicabit gubergren assueverit ut est, an duis corpora his. Ne assum accumsan sed. Ne impetus voluptatum mea, munere ridens malorum eu mea. Delenit antiopam urbanitas usu at.\r\n Usu ea laoreet molestie appetere. Vis solum copiosae explicari an, lobortis vituperata suscipiantur quo ut. Iudicabit gubergren assueverit ut est, an duis corpora his. Ne assum accumsan sed. Ne impetus voluptatum mea, munere ridens malorum eu mea. Delenit antiopam urbanitas usu at.\r\n ');

-- --------------------------------------------------------

--
-- Table structure for table `omeka_sessions`
--

CREATE TABLE IF NOT EXISTS `omeka_sessions` (
  `id` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `modified` bigint(20) DEFAULT NULL,
  `lifetime` int(11) DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `omeka_sessions`
--

INSERT INTO `omeka_sessions` (`id`, `modified`, `lifetime`, `data`) VALUES
('02rhcd5dcf4ler0l542ej40953', 1406735115, 1209600, ''),
('0ppekn59lo4nrqfbnh7ma64ot6', 1406903077, 1209600, 'Default|a:1:{s:8:"redirect";s:33:"/settings/edit-item-type-elements";}Zend_Auth|a:1:{s:7:"storage";i:3;}OmekaSessionCsrfToken|a:1:{s:5:"token";s:32:"da437af4aeb64ca7664a5aaa7b77c10f";}__ZF|a:1:{s:37:"Zend_Form_Element_Hash_salt_user_csrf";a:2:{s:4:"ENNH";i:1;s:3:"ENT";i:1406905885;}}Zend_Form_Element_Hash_salt_user_csrf|a:1:{s:4:"hash";s:32:"f9018d8c1f17e8f80bc7612b25785fce";}'),
('0ud2pmjqlvah0vji60234r6017', 1407400328, 1209600, 'Default|a:1:{s:8:"redirect";s:1:"/";}Zend_Auth|a:1:{s:7:"storage";i:3;}OmekaSessionCsrfToken|a:1:{s:5:"token";s:32:"d91d712a008ee01e3abca24032df472e";}__ZF|a:1:{s:37:"Zend_Form_Element_Hash_salt_user_csrf";a:2:{s:4:"ENNH";i:1;s:3:"ENT";i:1407401754;}}Zend_Form_Element_Hash_salt_user_csrf|a:1:{s:4:"hash";s:32:"5b4adc2d1bbf90ec8e30dc4e45d65a1c";}'),
('2aqhdrt99v43fqtkthd1nqpbb0', 1407417457, 1209600, ''),
('9vk6m3tr7v6b6t6dtpqfnioi80', 1406551149, 1209600, ''),
('a95b1rplhjarm2ta604jm1d5s5', 1406748083, 1209600, 'Default|a:1:{s:8:"redirect";s:1:"/";}Zend_Auth|a:1:{s:7:"storage";i:1;}__ZF|a:1:{s:37:"Zend_Form_Element_Hash_salt_user_csrf";a:2:{s:4:"ENNH";i:1;s:3:"ENT";i:1406751214;}}Zend_Form_Element_Hash_salt_user_csrf|a:1:{s:4:"hash";s:32:"90e136ca68f3a7f2cad08877dcf265c9";}'),
('abka790nqquru97jiou91m91r2', 1406900904, 1209600, 'Default|a:1:{s:8:"redirect";s:1:"/";}Zend_Auth|a:1:{s:7:"storage";i:3;}OmekaSessionCsrfToken|a:1:{s:5:"token";s:32:"9ffb638b61d49a77ac9aa4ed83c9a5ff";}__ZF|a:2:{s:37:"Zend_Form_Element_Hash_salt_user_csrf";a:2:{s:4:"ENNH";i:1;s:3:"ENT";i:1406904262;}s:41:"Zend_Form_Element_Hash_salt_settings_csrf";a:2:{s:4:"ENNH";i:1;s:3:"ENT";i:1406904423;}}Zend_Form_Element_Hash_salt_user_csrf|a:1:{s:4:"hash";s:32:"a3fbe956b576b877ee5c4011089c3a62";}Zend_Form_Element_Hash_salt_settings_csrf|a:1:{s:4:"hash";s:32:"6c68af8cdd98fc90c8a7ce8f9a3f122f";}'),
('bdot22efq1ig5t6fnnjdjg2pe1', 1407417852, 1209600, 'Default|a:1:{s:8:"redirect";s:1:"/";}Zend_Auth|a:1:{s:7:"storage";i:1;}__ZF|a:1:{s:37:"Zend_Form_Element_Hash_salt_user_csrf";a:2:{s:4:"ENNH";i:1;s:3:"ENT";i:1407420825;}}Zend_Form_Element_Hash_salt_user_csrf|a:1:{s:4:"hash";s:32:"65817bf55835378125d6c00668cbe08b";}'),
('ckiibk7d38m5oc8l2q1rnd5j07', 1406900599, 1209600, ''),
('f946b2ip4a1ns22gsobo1amtt0', 1407159390, 1209600, 'Default|a:1:{s:8:"redirect";s:1:"/";}__ZF|a:1:{s:14:"FlashMessenger";a:1:{s:4:"ENNH";i:1;}}'),
('fca3nag5quofs5vmm24vcdpik6', 1407169392, 1209600, 'Default|a:1:{s:8:"redirect";s:8:"/plugins";}'),
('ippaiemp7sf8t4bu1c3dm4im73', 1407416352, 1209600, 'Default|a:1:{s:8:"redirect";s:1:"/";}Zend_Auth|a:1:{s:7:"storage";i:2;}OmekaSessionCsrfToken|a:1:{s:5:"token";s:32:"9c2356a115137c6373dbf2666c8f8f66";}'),
('jn9725bpkk97vpe3j2q8iuqj16', 1407124966, 1209600, 'Default|a:1:{s:8:"redirect";s:33:"/settings/edit-item-type-elements";}Zend_Auth|a:1:{s:7:"storage";i:3;}OmekaSessionCsrfToken|a:1:{s:5:"token";s:32:"85c65335c654c24f8a51a9080505e1ad";}'),
('nhlhv1sa9e251h6v94panrf391', 1406900586, 1209600, ''),
('q36rn9cjt5l3atfmdk1lj09sp3', 1407350975, 1209600, ''),
('q9p0nksv8j9mv36oh9vvonktd6', 1406925811, 1209600, 'Default|a:1:{s:8:"redirect";s:1:"/";}Zend_Auth|a:1:{s:7:"storage";i:2;}OmekaSessionCsrfToken|a:1:{s:5:"token";s:32:"64ea54cda3ede89bac3678a59ea194f1";}'),
('rme1r3ctn6baih796d5mhrb5u0', 1407357066, 1209600, 'Default|a:1:{s:8:"redirect";s:1:"/";}Zend_Auth|a:1:{s:7:"storage";i:1;}OmekaSessionCsrfToken|a:1:{s:5:"token";s:32:"e3f354205d44f9fc863e6297198603d7";}'),
('s4o3l1o6h2evk33o86m1apvi34', 1406308971, 1209600, 'Default|a:1:{s:8:"redirect";s:1:"/";}Zend_Auth|a:1:{s:7:"storage";i:1;}OmekaSessionCsrfToken|a:1:{s:5:"token";s:32:"1378bae85dffd21303b559d84366a314";}');

-- --------------------------------------------------------

--
-- Table structure for table `omeka_simple_pages_pages`
--

CREATE TABLE IF NOT EXISTS `omeka_simple_pages_pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `modified_by_user_id` int(10) unsigned NOT NULL,
  `created_by_user_id` int(10) unsigned NOT NULL,
  `is_published` tinyint(1) NOT NULL,
  `title` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `slug` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `text` text COLLATE utf8_unicode_ci,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `inserted` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `order` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned NOT NULL,
  `template` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `use_tiny_mce` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `is_published` (`is_published`),
  KEY `inserted` (`inserted`),
  KEY `updated` (`updated`),
  KEY `created_by_user_id` (`created_by_user_id`),
  KEY `modified_by_user_id` (`modified_by_user_id`),
  KEY `order` (`order`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `omeka_simple_pages_pages`
--

INSERT INTO `omeka_simple_pages_pages` (`id`, `modified_by_user_id`, `created_by_user_id`, `is_published`, `title`, `slug`, `text`, `updated`, `inserted`, `order`, `parent_id`, `template`, `use_tiny_mce`) VALUES
(1, 1, 1, 1, 'About', 'about', '<p>This is an example page. Feel free to replace this content, or delete the page and start from scratch.</p>', '2014-07-25 17:15:09', '2014-07-25 17:15:09', 0, 0, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `omeka_simple_vocab_terms`
--

CREATE TABLE IF NOT EXISTS `omeka_simple_vocab_terms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `element_id` int(10) unsigned NOT NULL,
  `terms` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `element_id` (`element_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `omeka_tags`
--

CREATE TABLE IF NOT EXISTS `omeka_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=16 ;

--
-- Dumping data for table `omeka_tags`
--

INSERT INTO `omeka_tags` (`id`, `name`) VALUES
(6, 'blue'),
(10, 'change'),
(8, 'democrat'),
(11, 'education'),
(5, 'family'),
(1, 'first'),
(13, 'gold'),
(15, 'grey'),
(4, 'immigration'),
(9, 'last'),
(12, 'old'),
(7, 'politics'),
(2, 'red'),
(14, 'strange'),
(3, 'technology');

-- --------------------------------------------------------

--
-- Table structure for table `omeka_users`
--

CREATE TABLE IF NOT EXISTS `omeka_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `email` text COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `salt` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(4) NOT NULL,
  `role` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `active_idx` (`active`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `omeka_users`
--

INSERT INTO `omeka_users` (`id`, `username`, `name`, `email`, `password`, `salt`, `active`, `role`) VALUES
(1, 'lallen', 'Super User', 'lallen@haverford.edu', '78d3e646466b6e7aaaf969e869d20f7e10e63274', 'fcbb79cd61416ec4', 1, 'super'),
(2, 'mzarafon', 'Mike Zarafonetis', 'mzarafon@haverford.edu', 'ddabdcd50760183dbefb974796c85611206076ac', '96f80fe17b38f1a1', 1, 'super'),
(3, 'evan', 'Evan Hamilton', 'ephamilton@haverford.edu', 'a319920e27a104d4fb063eaf8da3b8dbd20372dd', 'bb8234d88040f77b', 1, 'super');

-- --------------------------------------------------------

--
-- Table structure for table `omeka_users_activations`
--

CREATE TABLE IF NOT EXISTS `omeka_users_activations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `url` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `added` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
