-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 15, 2024 at 03:04 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pasilanddl`
--

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `OrderDetailsID` int(11) NOT NULL,
  `OrderID` int(11) DEFAULT NULL,
  `ProductID` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `UnitPrice` decimal(10,2) DEFAULT NULL,
  `Discount` decimal(5,2) DEFAULT NULL,
  `StatusID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orderdetails`
--

INSERT INTO `orderdetails` (`OrderDetailsID`, `OrderID`, `ProductID`, `Quantity`, `UnitPrice`, `Discount`, `StatusID`) VALUES
(1, 1, 1, 1, 1200.00, 0.00, 1),
(2, 1, 4, 2, 150.00, 0.05, 1),
(3, 2, 2, 1, 800.00, 0.00, 1),
(4, 2, 3, 1, 500.00, 0.00, 2),
(5, 3, 5, 2, 300.00, 0.10, 3);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `OrderID` int(11) NOT NULL,
  `EmployeeID` int(11) DEFAULT NULL,
  `CustomerID` int(11) DEFAULT NULL,
  `Customer` varchar(100) DEFAULT NULL,
  `OrderDate` date DEFAULT NULL,
  `ShippedDate` date DEFAULT NULL,
  `ShipperID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`OrderID`, `EmployeeID`, `CustomerID`, `Customer`, `OrderDate`, `ShippedDate`, `ShipperID`) VALUES
(1, 1, 101, 'John Doe', '2024-10-01', '2024-10-05', 1),
(2, 2, 102, 'Jane Smith', '2024-10-02', '2024-10-06', 2),
(3, 3, 103, 'Robert Johnson', '2024-10-03', '2024-10-07', 3),
(4, 4, 104, 'Emily Davis', '2024-10-04', '2024-10-08', 1),
(5, 5, 105, 'Michael Brown', '2024-10-05', '2024-10-09', 2);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `ID` int(11) NOT NULL,
  `ProductCode` varchar(50) NOT NULL,
  `ProductName` varchar(100) NOT NULL,
  `Description` text DEFAULT NULL,
  `StandardCost` decimal(10,2) DEFAULT NULL,
  `ListPrice` decimal(10,2) DEFAULT NULL,
  `ReorderLevel` int(11) DEFAULT NULL,
  `TargetLevel` int(11) DEFAULT NULL,
  `QuantityPerUnit` int(11) DEFAULT NULL,
  `Discontinued` tinyint(1) DEFAULT NULL,
  `MinimumReorderQuantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`ID`, `ProductCode`, `ProductName`, `Description`, `StandardCost`, `ListPrice`, `ReorderLevel`, `TargetLevel`, `QuantityPerUnit`, `Discontinued`, `MinimumReorderQuantity`) VALUES
(1, 'P001', 'Laptop', 'High-end gaming laptop', 500.00, 1200.00, 10, 20, 1, 0, 5),
(2, 'P002', 'Smartphone', 'Flagship smartphone', 200.00, 800.00, 15, 30, 1, 0, 10),
(3, 'P003', 'Tablet', 'Lightweight tablet', 150.00, 500.00, 5, 10, 1, 0, 2),
(4, 'P004', 'Headphones', 'Noise-cancelling headphones', 50.00, 150.00, 20, 50, 1, 0, 10),
(5, 'P005', 'Monitor', '4K UHD Monitor', 100.00, 300.00, 10, 20, 1, 0, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`OrderDetailsID`),
  ADD KEY `OrderID` (`OrderID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `OrderDetailsID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
