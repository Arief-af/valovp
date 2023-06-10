-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 10, 2023 at 06:24 PM
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
-- Table structure for table `checkout`
--
CREATE TABLE `checkout` (
    `id_checkout` int(36) NOT NULL,
    `virtual_account_id` int(36) NOT NULL,
    `transaction_id` int(36) NOT NULL,
    `total_payment` float NOT NULL,
    `status` enum('pending', 'success', ' failed') NOT NULL,
    `timestamp` timestamp NULL DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = latin1;

--
-- Dumping data for table `checkout`
--
INSERT INTO
    `checkout` (
        `id_checkout`,
        `virtual_account_id`,
        `transaction_id`,
        `total_payment`,
        `status`,
        `timestamp`
    )
VALUES
    (1, 2, 1, 350000, 'pending', NULL),
    (2, 1, 2, 350000, 'success', NULL);

--
-- Indexes for dumped tables
--
--
-- Indexes for table `checkout`
--
ALTER TABLE
    `checkout`
ADD
    PRIMARY KEY (`id_checkout`),
ADD
    KEY `virtual_account_id` (`virtual_account_id`),
ADD
    KEY `transaction_id` (`transaction_id`);

--
-- AUTO_INCREMENT for dumped tables
--
--
-- AUTO_INCREMENT for table `checkout`
--
ALTER TABLE
    `checkout`
MODIFY
    `id_checkout` int(36) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 4;

--
-- Constraints for dumped tables
--
--
-- Constraints for table `checkout`
--
ALTER TABLE
    `checkout`
ADD
    CONSTRAINT `checkout_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id_transaction`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD
    CONSTRAINT `checkout_ibfk_2` FOREIGN KEY (`virtual_account_id`) REFERENCES `virtual_account` (`id_virtual_account`) ON DELETE CASCADE ON UPDATE CASCADE;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */
;

/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */
;

/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */
;