-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 10, 2023 at 06:21 PM
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
-- Table structure for table `banks`
--
CREATE TABLE `banks` (
    `id_bank` int(36) NOT NULL,
    `name` varchar(75) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = latin1;

--
-- Dumping data for table `banks`
--
INSERT INTO
    `banks` (`id_bank`, `name`)
VALUES
    (1, 'KONTOL'),
    (2, 'TOLOL'),
    (3, 'BCA');

--
-- Indexes for dumped tables
--
--
-- Indexes for table `banks`
--
ALTER TABLE
    `banks`
ADD
    PRIMARY KEY (`id_bank`);

--
-- AUTO_INCREMENT for dumped tables
--
--
-- AUTO_INCREMENT for table `banks`
--
ALTER TABLE
    `banks`
MODIFY
    `id_bank` int(36) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 4;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */
;

/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */
;

/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */
;