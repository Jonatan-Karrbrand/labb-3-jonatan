-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 30, 2018 at 08:25 AM
-- Server version: 5.6.34-log
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fish_store`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `category` enum('accessory','fresh_fish','ready_meal') NOT NULL,
  `price` int(11) NOT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `category`, `price`, `stock`) VALUES
(1, 'Lax', 'fresh_fish', 125, 50),
(2, 'Happy angle', 'accessory', 159, 24),
(3, 'Fisk bullar', 'ready_meal', 28, 137),
(4, 'Abborre', 'fresh_fish', 89, 23),
(5, 'Berggylta', 'fresh_fish', 336, 4),
(6, 'Bergtunga', 'fresh_fish', 567, 6),
(7, 'Blåmussla', 'fresh_fish', 123, 334),
(8, 'Bläckfisk 10-armad', 'fresh_fish', 345, 14),
(9, 'Gädda', 'fresh_fish', 237, 45),
(10, 'Hummer', 'fresh_fish', 32, 499),
(11, 'Kolja', 'fresh_fish', 136, 56),
(12, 'Krabba', 'fresh_fish', 89, 235),
(13, 'Makrill', 'fresh_fish', 49, 754),
(14, 'Ostron', 'fresh_fish', 187, 98),
(15, 'Regnbågslax', 'fresh_fish', 235, 76),
(16, 'Räkor', 'fresh_fish', 26, 563),
(17, 'Röding', 'fresh_fish', 229, 102),
(18, 'Rapala RCD', 'accessory', 224, 94),
(19, 'Senaps sill', 'ready_meal', 21, 74),
(20, 'Brännvins sill', 'ready_meal', 21, 45),
(21, 'Surströmming', 'ready_meal', 49, 36),
(22, 'test', 'accessory', 9999, 500);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
