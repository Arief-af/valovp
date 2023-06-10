-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 10, 2023 at 06:26 PM
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
-- Table structure for table `transactions`
--
CREATE TABLE `transactions` (
    `id_transaction` int(36) NOT NULL,
    `voucher_id` int(36) NOT NULL,
    `user_id` int(36) NOT NULL,
    `timestamp` timestamp NULL DEFAULT NULL,
    `riotId` varchar(50) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = latin1;

--
-- Dumping data for table `transactions`
--
INSERT INTO
    `transactions` (
        `id_transaction`,
        `voucher_id`,
        `user_id`,
        `timestamp`,
        `riotId`
    )
VALUES
    (1, 4, 1, NULL, 'Cerberus#X3M'),
    (2, 4, 2, NULL, 'asdad'),
    (3, 3, 3, NULL, 'lalala#lol1');

--
-- Indexes for dumped tables
--
--
-- Indexes for table `transactions`
--
ALTER TABLE
    `transactions`
ADD
    PRIMARY KEY (`id_transaction`),
ADD
    KEY `voucher_id` (`voucher_id`),
ADD
    KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--
--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE
    `transactions`
MODIFY
    `id_transaction` int(36) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 4;

--
-- Constraints for dumped tables
--
--
-- Constraints for table `transactions`
--
ALTER TABLE
    `transactions`
ADD
    CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`voucher_id`) REFERENCES `vouchers` (`id_voucher`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD
    CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */
;

/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */
;

/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */
;