-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 08, 2018 at 08:29 AM
-- Server version: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `testproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `book_car`
--

DROP TABLE IF EXISTS `book_car`;
CREATE TABLE IF NOT EXISTS `book_car` (
  `Id` int(255) NOT NULL AUTO_INCREMENT,
  `Status` varchar(255) NOT NULL,
  `customerID` int(255) NOT NULL,
  `testDate` varchar(255) NOT NULL,
  `carID` int(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `calling_list`
--

DROP TABLE IF EXISTS `calling_list`;
CREATE TABLE IF NOT EXISTS `calling_list` (
  `Id` int(255) NOT NULL AUTO_INCREMENT,
  `book_car_id` int(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `date_time` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

DROP TABLE IF EXISTS `car`;
CREATE TABLE IF NOT EXISTS `car` (
  `Id` int(255) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Model` varchar(255) NOT NULL,
  `Quantity` int(255) NOT NULL,
  `Price` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer_data`
--

DROP TABLE IF EXISTS `customer_data`;
CREATE TABLE IF NOT EXISTS `customer_data` (
  `Id` int(255) NOT NULL AUTO_INCREMENT,
  `Name` varchar(500) NOT NULL,
  `Email` varchar(500) NOT NULL,
  `Phone` varchar(50) NOT NULL,
  `IC` varchar(255) NOT NULL,
  `DrivingLicense` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_data`
--

INSERT INTO `customer_data` (`Id`, `Name`, `Email`, `Phone`, `IC`, `DrivingLicense`) VALUES
(1, 'SALSA', 'salsa@gmail.com', '018265537', 'B34897', '9382748ff83'),
(2, 'test', 'test@gmail.com', '0849723', 'B38648', 'kjhsadkfjh83443234');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `Id` int(255) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `UserType` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
