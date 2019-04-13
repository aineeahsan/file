

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fts`
--
CREATE DATABASE IF NOT EXISTS `fts` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `fts`;

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
CREATE TABLE IF NOT EXISTS `files` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `user_id` int(255) NOT NULL,
  `hardid` varchar(500) NOT NULL,
  `filename` varchar(500) NOT NULL,
  `attachment` varchar(500) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`id`, `user_id`, `hardid`, `filename`, `attachment`, `description`, `created_at`, `updated_at`) VALUES
(18, 8, '1', 'Mark Report 2017-2018', '4feb87f26a4cf07869fdbb28313c1123.png', 'MCA I Year', '2018-11-23 14:41:33', '2018-11-23 14:41:33');

-- --------------------------------------------------------

--
-- Table structure for table `movements`
--

DROP TABLE IF EXISTS `movements`;
CREATE TABLE IF NOT EXISTS `movements` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `from_id` int(255) DEFAULT NULL,
  `file_id` int(255) DEFAULT NULL,
  `to_id` int(255) DEFAULT NULL,
  `note` varchar(500) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `movements`
--

INSERT INTO `movements` (`id`, `from_id`, `file_id`, `to_id`, `note`, `created_at`, `updated_at`) VALUES
(31, 8, 18, 10, 'Correction Done.', '2018-11-23 14:45:33', '2018-11-23 14:45:33'),
(30, 10, 18, 8, 'For correction in roll number 08652', '2018-11-23 14:45:19', '2018-11-23 14:45:19'),
(29, 8, 18, 10, 'Please proceed for mark sheet formation.', '2018-11-23 14:44:19', '2018-11-23 14:44:19'),
(27, 8, 18, 9, 'For Scrutiny.', '2018-11-23 14:42:23', '2018-11-23 14:42:23'),
(28, 9, 18, 8, 'Scurrility Done.', '2018-11-23 14:43:05', '2018-11-23 14:43:05'),
(26, 8, 18, 8, NULL, '2018-11-23 14:41:33', '2018-11-23 14:41:33');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `content` varchar(500) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `content`, `created_at`, `updated_at`) VALUES
(10, 8, 'A file with name \"Mark Report 2017-2018\" has been arrived from \"Shoaib\" with note: \"For correction in roll number 08652\".', '2018-11-23 14:45:19', '2018-11-23 14:45:19'),
(9, 10, 'A file with name \"Mark Report 2017-2018\" has been arrived from \"Shoaib\" with note: \"Please proceed for mark sheet formation.\".', '2018-11-23 14:44:19', '2018-11-23 14:44:19'),
(8, 8, 'A file with name \"Mark Report 2017-2018\" has been arrived from \"Shoaib\" with note: \"Scurrility Done.\".', '2018-11-23 14:43:05', '2018-11-23 14:43:05'),
(7, 9, 'A file with name \"Mark Report 2017-2018\" has been arrived from \"Shoaib\" with note: \"For Scrutiny.\".', '2018-11-23 14:42:23', '2018-11-23 14:42:23'),
(11, 10, 'A file with name \"Mark Report 2017-2018\" has been arrived from \"Shoaib\" with note: \"Correction Done.\".', '2018-11-23 14:45:33', '2018-11-23 14:45:33');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `is_admin`) VALUES
(10, 'Naved', 'naved@somewhere.com', 'mypassword', 0),
(9, 'Adnan Hussain', 'adnan@somewhere.com', 'mypassword', 0),
(8, 'Shoaib', 'shoaib@somewhere.com', 'mypassword', 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
