-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 10, 2023 at 06:27 PM
-- Server version: 5.7.33
-- PHP Version: 8.1.11
SET
    SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";

START TRANSACTION;

SET
    time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */
;

/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */
;

/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */
;

/*!40101 SET NAMES utf8mb4 */
;

--
-- Database: `vpvalorant`
--
-- --------------------------------------------------------
--
-- Table structure for table `vouchers`
--
CREATE TABLE `vouchers` (
    `id_voucher` int(36) NOT NULL,
    `amount` int(11) NOT NULL,
    `price` float NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = latin1;

--
-- Dumping data for table `vouchers`
--
INSERT INTO
    `vouchers` (`id_voucher`, `amount`, `price`)
VALUES
    (3, 9, 300000),
    (4, 5, 120000),
    (5, 21, 1000000);

--
-- Indexes for dumped tables
--
--
-- Indexes for table `vouchers`
--
ALTER TABLE
    `vouchers`
ADD
    PRIMARY KEY (`id_voucher`);

--
-- AUTO_INCREMENT for dumped tables
--
--
-- AUTO_INCREMENT for table `vouchers`
--
ALTER TABLE
    `vouchers`
MODIFY
    `id_voucher` int(36) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 6;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */
;

/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */
;

/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */
;