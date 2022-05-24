-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 26, 2022 at 06:05 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `q&a`
--

-- --------------------------------------------------------

--
-- Table structure for table `askquestion`
--

CREATE TABLE `askquestion` (
  `sn` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `askquestion`
--

INSERT INTO `askquestion` (`sn`, `code`, `email`, `title`, `description`, `category`, `status`) VALUES
(1, 'UiEtMXq_1', 'Riya@gmail.com', 'Convert JKS to PEM in one step', 'Converting truststore client.jks, in JKS format, to client.pem in PEM format... I know how to do this in two steps, with an intermediate (.p12) file: $ keytool -importkeystore -srckeystore client.jks -...', 'C++,JQUERY', 0);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `sn` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`sn`, `code`, `email`, `category_name`, `status`) VALUES
(1, 'aDp0kAz_1', 'pramod@gmail.com', 'C++', 0),
(2, 'eia1MwC_2', 'pramod@gmail.com', 'JAVA', 0),
(3, '6XiLTIM_3', 'pramod@gmail.com', 'PYTHON', 0),
(4, 'sCrJ6pm_4', 'pramod@gmail.com', 'BOOTSTRAP-4', 0),
(5, '0RCUcD7_5', 'pramod@gmail.com', 'JQUERY', 0),
(6, 'pYAP7gu_6', 'pramod@gmail.com', 'DJANGO-MODELS', 0),
(7, 'LjJ6UxA_7', 'pramod@gmail.com', 'JSP', 0),
(8, '6CcwdXv_8', 'pramod@gmail.com', 'PHP', 1),
(9, 'r0Smtpk_9', 'pramod@gmail.com', 'MVC ', 0);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`email`, `password`) VALUES
('pramod@gmail.com', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `sn` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `intersted` varchar(255) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`sn`, `code`, `name`, `email`, `phone`, `password`, `intersted`, `status`) VALUES
(1, 'uem5vDy_1', 'Riya Jain', 'Riya@gmail.com', '8905648522', '123', 'C++,JAVA,PYTHON', 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
