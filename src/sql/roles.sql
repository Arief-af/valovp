-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 10, 2023 at 06:25 PM
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
-- Table structure for table `roles`
--
CREATE TABLE `roles` (
    `id_role` int(36) NOT NULL,
    `name` varchar(50) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = latin1;

--
-- Dumping data for table `roles`
--
INSERT INTO
    `roles` (`id_role`, `name`)
VALUES
    (1, 'user'),
    (2, 'admin'),
    (3, 'ucok');

--
-- Indexes for dumped tables
--
--
-- Indexes for table `roles`
--
ALTER TABLE
    `roles`
ADD
    PRIMARY KEY (`id_role`);

--
-- AUTO_INCREMENT for dumped tables
--
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE
    `roles`
MODIFY
    `id_role` int(36) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 4;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */
;

/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */
;

/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */
;