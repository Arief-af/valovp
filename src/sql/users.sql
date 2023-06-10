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
-- Table structure for table `users`
--
CREATE TABLE `users` (
    `id_user` int(36) NOT NULL,
    `name` varchar(100) NOT NULL,
    `role_id` int(36) NOT NULL,
    `email` varchar(30) NOT NULL,
    `username` varchar(30) NOT NULL,
    `password` varchar(100) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = latin1;

--
-- Dumping data for table `users`
--
INSERT INTO
    `users` (
        `id_user`,
        `name`,
        `role_id`,
        `email`,
        `username`,
        `password`
    )
VALUES
    (
        1,
        'udin semewew',
        1,
        'kldadaad@gmail.com',
        'kalo',
        'manadawdaw'
    ),
    (
        2,
        'jamaludin',
        1,
        'daffa@gmail.com',
        'daffa',
        'daffa123'
    ),
    (3, 'cakcuk', 1, 'ucok@gmail.com', 'cuk', 'cak');

--
-- Indexes for dumped tables
--
--
-- Indexes for table `users`
--
ALTER TABLE
    `users`
ADD
    PRIMARY KEY (`id_user`),
ADD
    KEY `id_role` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE
    `users`
MODIFY
    `id_user` int(36) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 4;

--
-- Constraints for dumped tables
--
--
-- Constraints for table `users`
--
ALTER TABLE
    `users`
ADD
    CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id_role`) ON DELETE CASCADE ON UPDATE CASCADE;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */
;

/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */
;

/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */
;