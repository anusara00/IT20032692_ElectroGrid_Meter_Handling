-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 13, 2022 at 05:47 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `electrogrid`
--

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `billNo` int(10) NOT NULL,
  `AccountNo` varchar(100) NOT NULL,
  `Cus_name` varchar(50) NOT NULL,
  `Units` int(50) NOT NULL,
  `Total_amount` varchar(50) NOT NULL,
  `Bill_Date` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `UserID` varchar(10) NOT NULL,
  `Cus_name` varchar(100) NOT NULL,
  `AccountNo` varchar(20) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `PhoneNo` varchar(10) NOT NULL,
  `Address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`UserID`, `Cus_name`, `AccountNo`, `Email`, `PhoneNo`, `Address`) VALUES
('user1246', 'kasun jayasanka', '2234758948', 'kasun@gmail.com', '0722364789', 'No 376, Galle Road, Dehiwala');

-- --------------------------------------------------------

--
-- Table structure for table `inquirys`
--

CREATE TABLE `inquirys` (
  `inquiryID` int(10) NOT NULL,
  `inquiryType` varchar(50) NOT NULL,
  `inquiryEmail` varchar(50) NOT NULL,
  `inquiryName` varchar(50) NOT NULL,
  `inquiryMsg` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inquirys`
--

INSERT INTO `inquirys` (`inquiryID`, `inquiryType`, `inquiryEmail`, `inquiryName`, `inquiryMsg`) VALUES
(2, 'Wire breakage moratuwa', 'anusara@gmail.com', 'kunkuma', '2-hour power cut due to a power outage in the Moratuwa area'),
(5, 'Meter board damage', 'harsha@gmail.com', 'harsha', 'Wire breakage Moratuwa area');

-- --------------------------------------------------------

--
-- Table structure for table `meters`
--

CREATE TABLE `meters` (
  `MeterH_ID` int(10) NOT NULL,
  `AccountNo` varchar(1000) NOT NULL,
  `Cus_name` varchar(100) NOT NULL,
  `Units` varchar(100) NOT NULL,
  `Total_amount` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `meters`
--

INSERT INTO `meters` (`MeterH_ID`, `AccountNo`, `Cus_name`, `Units`, `Total_amount`) VALUES
(1, '3452358976', 'Anusara Kumarasinghe', '11', '2500.00'),
(2, '3452358976', 'Anusara Kumarasinghe', '12', '2500.00');

-- --------------------------------------------------------

--
-- Table structure for table `notices`
--

CREATE TABLE `notices` (
  `noticeID` int(10) NOT NULL,
  `noticeTitle` varchar(100) NOT NULL,
  `noticeDescription` varchar(100) NOT NULL,
  `noticeDetails` varchar(50) NOT NULL,
  `noticeDate` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notices`
--

INSERT INTO `notices` (`noticeID`, `noticeTitle`, `noticeDescription`, `noticeDetails`, `noticeDate`) VALUES
(2, 'Power outage in Colombo.', '6-hour power outage in Colombo, Kollupitiya, Maradana, and Bambalapitiya areas.', '6 hour power outage. 2022-04-239 to 2-8 p.m.', '2022-04-29');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `Pay_ID` int(10) NOT NULL,
  `AccountNo` varchar(50) NOT NULL,
  `Cus_name` varchar(100) NOT NULL,
  `Pay_date` varchar(100) NOT NULL,
  `Total_amount` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UserID` varchar(100) NOT NULL,
  `UserPass` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`billNo`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`UserID`);

--
-- Indexes for table `inquirys`
--
ALTER TABLE `inquirys`
  ADD PRIMARY KEY (`inquiryID`);

--
-- Indexes for table `meters`
--
ALTER TABLE `meters`
  ADD PRIMARY KEY (`MeterH_ID`);

--
-- Indexes for table `notices`
--
ALTER TABLE `notices`
  ADD PRIMARY KEY (`noticeID`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`Pay_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bills`
--
ALTER TABLE `bills`
  MODIFY `billNo` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inquirys`
--
ALTER TABLE `inquirys`
  MODIFY `inquiryID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `meters`
--
ALTER TABLE `meters`
  MODIFY `MeterH_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `notices`
--
ALTER TABLE `notices`
  MODIFY `noticeID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `Pay_ID` int(10) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
