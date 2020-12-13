-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 13, 2020 at 08:05 PM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr5_famazon_albadri`
--

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `city_Id` int(11) NOT NULL,
  `city_name` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`city_Id`, `city_name`) VALUES
(1, 'Vienna'),
(2, 'Burgenland'),
(3, 'Kärnten'),
(4, 'Niederösterreich'),
(5, 'Oberösterreich'),
(6, 'Salzburg'),
(7, 'Steiermark'),
(8, 'Tirol'),
(9, 'Vorarlberg');

-- --------------------------------------------------------

--
-- Table structure for table `cutomers`
--

CREATE TABLE `cutomers` (
  `coustmer_Id` int(11) NOT NULL,
  `first_name` varchar(60) DEFAULT NULL,
  `last_name` varchar(60) DEFAULT NULL,
  `user_name` varchar(60) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `fk_city_Id` int(11) NOT NULL,
  `address` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cutomers`
--

INSERT INTO `cutomers` (`coustmer_Id`, `first_name`, `last_name`, `user_name`, `email`, `fk_city_Id`, `address`) VALUES
(1, 'maxi', 'melan', 'Maxi7', 'maxi@gmx.net', 1, 'lechterstrasse2'),
(2, 'joe', 'doe', 'Joe3', 'Joe@gmail.com', 2, 'mulergasse'),
(3, 'mary', 'simon', 'Mary1', 'mary@yahoo.com', 3, 'leystrasse23'),
(4, 'sara', 'loes', 'saraloe', 'sara@hotmail.com', 4, 'brandstromgasse1');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_Id` int(11) NOT NULL,
  `fk_customer_Id` int(11) DEFAULT NULL,
  `fk_product_Id` int(11) DEFAULT NULL,
  `fk_supplier_Id` int(11) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `approved_status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_Id`, `fk_customer_Id`, `fk_product_Id`, `fk_supplier_Id`, `order_date`, `quantity`, `approved_status`) VALUES
(1, 1, 1, 1, '2020-10-12', 1, 'approved'),
(2, 2, 2, 2, '2020-11-12', 2, 'approved'),
(3, 3, 3, 3, '2020-12-12', 3, 'approved'),
(4, 1, 2, 3, '0000-00-00', 4, 'approved');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_Id` int(11) NOT NULL,
  `product_name` varchar(60) DEFAULT NULL,
  `fk_product_category_Id` int(11) DEFAULT NULL,
  `fk_supplier_Id` int(11) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `price` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_Id`, `product_name`, `fk_product_category_Id`, `fk_supplier_Id`, `stock`, `price`) VALUES
(1, 'Iphone12', 1, 1, 100, '1200Euro'),
(2, 'tablet', 2, 2, 120, '400Euro'),
(3, 'laptop', 3, 3, 70, '850Euro');

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

CREATE TABLE `product_category` (
  `product_category_Id` int(11) NOT NULL,
  `product_category_name` varchar(60) DEFAULT NULL,
  `product_category_description` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_category`
--

INSERT INTO `product_category` (`product_category_Id`, `product_category_name`, `product_category_description`) VALUES
(1, 'Phone ', 'This category contains all phones'),
(2, 'Tablet', 'This category contains all Tabllets'),
(3, 'laptop', 'This category contains all laptops');

-- --------------------------------------------------------

--
-- Table structure for table `shipment_status`
--

CREATE TABLE `shipment_status` (
  `status_Id` int(11) NOT NULL,
  `fk_order_Id` int(11) DEFAULT NULL,
  `shipped` varchar(60) DEFAULT NULL,
  `fk_city` int(11) DEFAULT NULL,
  `sent_date` date DEFAULT NULL,
  `delivery_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shipment_status`
--

INSERT INTO `shipment_status` (`status_Id`, `fk_order_Id`, `shipped`, `fk_city`, `sent_date`, `delivery_date`) VALUES
(1, 1, 'Yes', 2, '2020-12-10', '2020-12-17'),
(2, 2, 'Yes', 1, '2020-12-11', '2020-12-18'),
(3, 4, 'Yes', 3, '2020-12-12', '2020-12-18');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `supplier_id` int(11) NOT NULL,
  `supplier_name` varchar(55) DEFAULT NULL,
  `supplier_address` varchar(66) DEFAULT NULL,
  `supplier_email` varchar(66) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`supplier_id`, `supplier_name`, `supplier_address`, `supplier_email`) VALUES
(1, 'Apple', 'staefanplaz5', 'info@Apple'),
(2, 'Samsung', 'landstrasse3', 'info@Samsung'),
(3, 'Huawei', 'mariahelferstrasse 7', 'info@Huawei');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`city_Id`);

--
-- Indexes for table `cutomers`
--
ALTER TABLE `cutomers`
  ADD PRIMARY KEY (`coustmer_Id`),
  ADD UNIQUE KEY `fk_ID_city` (`fk_city_Id`) USING BTREE;

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_Id`),
  ADD KEY `fk_customer_Id` (`fk_customer_Id`),
  ADD KEY `fk_product_Id` (`fk_product_Id`),
  ADD KEY `fk_supplier_Id` (`fk_supplier_Id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_Id`),
  ADD UNIQUE KEY `fk_product_category_Id` (`fk_product_category_Id`) USING BTREE,
  ADD UNIQUE KEY `fk_supplier_Id` (`fk_supplier_Id`) USING BTREE;

--
-- Indexes for table `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`product_category_Id`);

--
-- Indexes for table `shipment_status`
--
ALTER TABLE `shipment_status`
  ADD PRIMARY KEY (`status_Id`),
  ADD UNIQUE KEY `fk_order_Id` (`fk_order_Id`) USING BTREE,
  ADD UNIQUE KEY `fk_city` (`fk_city`) USING BTREE;

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`supplier_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `city_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `cutomers`
--
ALTER TABLE `cutomers`
  MODIFY `coustmer_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product_category`
--
ALTER TABLE `product_category`
  MODIFY `product_category_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shipment_status`
--
ALTER TABLE `shipment_status`
  MODIFY `status_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cutomers`
--
ALTER TABLE `cutomers`
  ADD CONSTRAINT `fk_ID_city` FOREIGN KEY (`fk_city_Id`) REFERENCES `cities` (`city_Id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`fk_customer_Id`) REFERENCES `cutomers` (`coustmer_Id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`fk_product_Id`) REFERENCES `products` (`product_Id`),
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`fk_supplier_Id`) REFERENCES `supplier` (`supplier_id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`fk_product_category_Id`) REFERENCES `product_category` (`product_category_Id`);

--
-- Constraints for table `shipment_status`
--
ALTER TABLE `shipment_status`
  ADD CONSTRAINT `shipment_status_ibfk_1` FOREIGN KEY (`fk_order_Id`) REFERENCES `orders` (`order_Id`),
  ADD CONSTRAINT `shipment_status_ibfk_2` FOREIGN KEY (`fk_city`) REFERENCES `cities` (`city_Id`);

--
-- Constraints for table `supplier`
--
ALTER TABLE `supplier`
  ADD CONSTRAINT `supplier_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `products` (`fk_supplier_Id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
