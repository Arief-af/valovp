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
-- Table structure for table `virtual_account`
--
CREATE TABLE `virtual_account` (
    `id_virtual_account` int(36) NOT NULL,
    `name` varchar(25) NOT NULL,
    `number` varchar(25) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = latin1;

--
-- Dumping data for table `virtual_account`
--
INSERT INTO
    `virtual_account` (`id_virtual_account`, `name`, `number`)
VALUES
    (1, 'daffa', '1254421'),
    (2, 'fauzi', '2203156'),
    (3, 'cakcukcok', '33655488512');

--
-- Indexes for dumped tables
--
--
-- Indexes for table `virtual_account`
--
ALTER TABLE
    `virtual_account`
ADD
    PRIMARY KEY (`id_virtual_account`);

--
-- AUTO_INCREMENT for dumped tables
--
--
-- AUTO_INCREMENT for table `virtual_account`
--
ALTER TABLE
    `virtual_account`
MODIFY
    `id_virtual_account` int(36) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 4;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */
;

/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */
;

/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */
;