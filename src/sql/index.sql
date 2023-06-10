-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 10, 2023 at 03:39 PM
-- Server version: 8.0.33-0ubuntu0.22.04.2
-- PHP Version: 8.1.18
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
DELIMITER $ $ --
-- Procedures
--
CREATE DEFINER = `ziaq` @`localhost` PROCEDURE `bank_create` (
  IN `id` INT(25) UNSIGNED ZEROFILL,
  IN `name` VARCHAR(75)
) BEGIN
insert INTO
  banks(id_bank, name)
VALUES
(id_bank, name);

END $ $ CREATE DEFINER = `ziaq` @`localhost` PROCEDURE `bank_delete` (IN `id` INT(25)) BEGIN DECLARE affected_rows INT;

DELETE FROM
  banks
WHERE
  id_bank = id;

SET
  affected_rows = ROW_COUNT();

IF affected_rows = 0 THEN SIGNAL SQLSTATE '45000'
SET
  MESSAGE_TEXT = 'The provided ID does not          exist.';

END IF;

END $ $ CREATE DEFINER = `ziaq` @`localhost` PROCEDURE `bank_edit` (IN `id` INT(25)) BEGIN
SELECT
  *
from
  banks
where
  id_bank = id;

END $ $ CREATE DEFINER = `ziaq` @`localhost` PROCEDURE `bank_read` () BEGIN
SELECT
  *
FROM
  banks;

END $ $ CREATE DEFINER = `ziaq` @`localhost` PROCEDURE `bank_update` (IN `id` INT(25), IN `name` VARCHAR(75)) BEGIN
UPDATE
  banks
SET
  name = name
WHERE
  id_bank = id;

END $ $ CREATE DEFINER = `ziaq` @`localhost` PROCEDURE `change_status` (
  IN `id` INT(25),
  IN `status` ENUM('pending', 'success', ' failed')
) BEGIN
UPDATE
  checkout
set
  status = status
WHERE
  id_checkout = id;

END $ $ CREATE DEFINER = `ziaq` @`localhost` PROCEDURE `checkout_create` (
  IN `id` INT(25) UNSIGNED ZEROFILL,
  IN `virtual_account_id` INT(25),
  IN `transaction_id` INT(25),
  IN `total_payment` FLOAT,
  IN `status` ENUM('pending', 'success', ' failed')
) BEGIN
insert INTO
  checkout(
    id_checkout,
    virtual_account_id,
    transaction_id,
    total_payment,
    status
  )
VALUES
(
    id,
    virtual_account_id,
    transaction_id,
    total_payment,
    status
  );

END $ $ CREATE DEFINER = `ziaq` @`localhost` PROCEDURE `checkout_delete` (IN `id` INT) BEGIN DECLARE affected_rows INT;

DELETE FROM
  checkout
WHERE
  id_checkout = id;

SET
  affected_rows = ROW_COUNT();

IF affected_rows = 0 THEN SIGNAL SQLSTATE '45000'
SET
  MESSAGE_TEXT = 'The provided ID does not          exist.';

END IF;

END $ $ CREATE DEFINER = `ziaq` @`localhost` PROCEDURE `checkout_read` () BEGIN
SELECT
  *
FROM
  checkout;

END $ $ CREATE DEFINER = `ziaq` @`localhost` PROCEDURE `checkout_update` (
  IN `id` INT(25),
  IN `va_id` INT(25),
  IN `trans_id` INT(25),
  IN `total_payment` FLOAT,
  IN `status` ENUM('pending', 'success', ' failed')
) BEGIN
UPDATE
  checkout
SET
  virtual_account_id = va_id,
  transaction_id = trans_id,
  total_payment = total_payment,
  status = status
WHERE
  id_checkout = id;

END $ $ CREATE DEFINER = `ziaq` @`localhost` PROCEDURE `role_create` (
  IN `id_role` INT(25) UNSIGNED ZEROFILL,
  IN `name` VARCHAR(50)
) BEGIN
insert INTO
  roles(id_role, name)
VALUES
(id_role, name);

END $ $ CREATE DEFINER = `ziaq` @`localhost` PROCEDURE `role_delete` (IN `id` INT(25)) BEGIN DECLARE affected_rows INT;

DELETE FROM
  roles
WHERE
  id_role = id;

SET
  affected_rows = ROW_COUNT();

IF affected_rows = 0 THEN SIGNAL SQLSTATE '45000'
SET
  MESSAGE_TEXT = 'The provided ID does not exist.';

END IF;

END $ $ CREATE DEFINER = `ziaq` @`localhost` PROCEDURE `role_edit` (IN `id` INT(25)) BEGIN
SELECT
  *
from
  roles
where
  id_role = id;

END $ $ CREATE DEFINER = `ziaq` @`localhost` PROCEDURE `role_read` () BEGIN
SELECT
  *
FROM
  roles;

END $ $ CREATE DEFINER = `ziaq` @`localhost` PROCEDURE `role_update` (
  IN `id` INT(25) UNSIGNED ZEROFILL,
  IN `name` VARCHAR(50)
) BEGIN
UPDATE
  roles
SET
  name = name
WHERE
  id_role = id;

END $ $ CREATE DEFINER = `ziaq` @`localhost` PROCEDURE `transaction_create` (
  IN `id_transaction` INT(25) UNSIGNED ZEROFILL,
  IN `voucher_id` INT(25),
  IN `user_id` INT(25),
  IN `riotId` VARCHAR(50)
) BEGIN
insert INTO
  transactions(id_transaction, voucher_id, user_id, riotId)
VALUES
(id_transaction, voucher_id, user_id, riotId);

END $ $ CREATE DEFINER = `ziaq` @`localhost` PROCEDURE `transaction_delete` (IN `id` INT(25)) BEGIN DECLARE affected_rows INT;

DELETE FROM
  transactions
WHERE
  id_transaction = id;

SET
  affected_rows = ROW_COUNT();

IF affected_rows = 0 THEN SIGNAL SQLSTATE '45000'
SET
  MESSAGE_TEXT = 'The provided ID does not          exist.';

END IF;

END $ $ CREATE DEFINER = `ziaq` @`localhost` PROCEDURE `transaction_read` () BEGIN
SELECT
  *
FROM
  transactions;

END $ $ CREATE DEFINER = `ziaq` @`localhost` PROCEDURE `transaction_update` (
  IN `id` INT(25),
  IN `vcr_id` INT(25),
  IN `usr_id` INT(25),
  IN `riotId` VARCHAR(50)
) BEGIN
UPDATE
  transactions
SET
  voucher_id = vcr_id,
  user_id = usr_id
WHERE
  id_transaction = id;

END $ $ CREATE DEFINER = `ziaq` @`localhost` PROCEDURE `user_create` (
  IN `id_user` INT(25) UNSIGNED ZEROFILL,
  IN `role_id` INT(25),
  IN `email` VARCHAR(30),
  IN `username` VARCHAR(30),
  IN `password` VARCHAR(50)
) BEGIN
insert INTO
  users(id_user, role_id, email, username, password)
VALUES
(id_user, role_id, email, username, password);

END $ $ CREATE DEFINER = `ziaq` @`localhost` PROCEDURE `user_delete` (IN `id` INT(25)) BEGIN DECLARE affected_rows INT;

DELETE FROM
  users
WHERE
  id_user = id;

SET
  affected_rows = ROW_COUNT();

IF affected_rows = 0 THEN SIGNAL SQLSTATE '45000'
SET
  MESSAGE_TEXT = 'The provided ID does not          exist.';

END IF;

END $ $ CREATE DEFINER = `ziaq` @`localhost` PROCEDURE `user_edit` (IN `id` INT(25)) BEGIN
SELECT
  *
from
  users
where
  id_user = id;

END $ $ CREATE DEFINER = `ziaq` @`localhost` PROCEDURE `user_read` () BEGIN
SELECT
  users.name,
  users.username,
  users.email,
  roles.name AS role_name,
  roles.id_role AS role_id
FROM
  users
  JOIN roles ON users.role_id = roles.id_role;

END $ $ CREATE DEFINER = `ziaq` @`localhost` PROCEDURE `user_update` (
  IN `id` INT(25),
  IN `role_id` INT(25),
  IN `email` VARCHAR(30),
  IN `username` VARCHAR(30),
  IN `password` VARCHAR(50)
) BEGIN
UPDATE
  users
SET
  role_id = role_id,
  email = email,
  username = username,
  password = password
WHERE
  id_user = id;

END $ $ CREATE DEFINER = `ziaq` @`localhost` PROCEDURE `virtual_account_create` (
  IN `id` INT(25) UNSIGNED ZEROFILL,
  IN `name` VARCHAR(25),
  IN `number` VARCHAR(25)
) BEGIN
insert INTO
  virtual_account(id_virtual_account, name, number)
VALUES
(id, name, number);

END $ $ CREATE DEFINER = `ziaq` @`localhost` PROCEDURE `virtual_account_delete` (IN `id` INT(25)) BEGIN DECLARE affected_rows INT;

DELETE FROM
  virtual_account
WHERE
  id_virtual_account = id;

SET
  affected_rows = ROW_COUNT();

IF affected_rows = 0 THEN SIGNAL SQLSTATE '45000'
SET
  MESSAGE_TEXT = 'The provided ID does not          exist.';

END IF;

END $ $ CREATE DEFINER = `ziaq` @`localhost` PROCEDURE `virtual_account_edit` (IN `id` INT(25)) BEGIN
SELECT
  *
from
  virtual_account
WHERE
  id_virtual_account = id;

END $ $ CREATE DEFINER = `ziaq` @`localhost` PROCEDURE `virtual_account_read` () BEGIN
SELECT
  *
FROM
  virtual_account;

END $ $ CREATE DEFINER = `ziaq` @`localhost` PROCEDURE `virtual_account_update` (
  IN `id` INT(25),
  IN `name` VARCHAR(25),
  IN `number` VARCHAR(25)
) BEGIN
UPDATE
  virtual_account
SET
  name = name,
  number = number
WHERE
  id_virtual_account = id;

END $ $ CREATE DEFINER = `ziaq` @`localhost` PROCEDURE `voucher_create` (
  IN `id` INT(25) UNSIGNED ZEROFILL,
  IN `amount` INT(4),
  IN `price` FLOAT
) BEGIN
insert INTO
  vouchers(id_voucher, amount, price)
VALUES
(id, amount, price);

END $ $ CREATE DEFINER = `ziaq` @`localhost` PROCEDURE `voucher_delete` (IN `id` INT(25)) BEGIN DECLARE affected_rows INT;

DELETE FROM
  vouchers
WHERE
  id_voucher = id;

SET
  affected_rows = ROW_COUNT();

IF affected_rows = 0 THEN SIGNAL SQLSTATE '45000'
SET
  MESSAGE_TEXT = 'The provided ID does not exist.';

END if;

END $ $ CREATE DEFINER = `ziaq` @`localhost` PROCEDURE `voucher_edit` (IN `id` INT(25)) BEGIN
SELECT
  *
from
  vouchers
where
  id_voucher = id;

END $ $ CREATE DEFINER = `ziaq` @`localhost` PROCEDURE `voucher_read` () BEGIN
SELECT
  *
FROM
  vouchers;

END $ $ CREATE DEFINER = `ziaq` @`localhost` PROCEDURE `voucher_update` (
  IN `id` INT(25),
  IN `amount` INT(4),
  IN `price` FLOAT
) BEGIN
UPDATE
  vouchers
SET
  amount = amount,
  price = price
WHERE
  id_voucher = id;

END $ $ DELIMITER;

-- --------------------------------------------------------
--
-- Table structure for table `banks`
--
CREATE TABLE `banks` (
  `id_bank` int NOT NULL,
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

-- --------------------------------------------------------
--
-- Table structure for table `checkout`
--
CREATE TABLE `checkout` (
  `id_checkout` int NOT NULL,
  `virtual_account_id` int NOT NULL,
  `transaction_id` int NOT NULL,
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

-- --------------------------------------------------------
--
-- Table structure for table `roles`
--
CREATE TABLE `roles` (
  `id_role` int NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = latin1;

--
-- Dumping data for table `roles`
--
INSERT INTO
  `roles` (`id_role`, `name`)
VALUES
  (1, 'user'),
  (2, 'admin');

-- --------------------------------------------------------
--
-- Table structure for table `transactions`
--
CREATE TABLE `transactions` (
  `id_transaction` int NOT NULL,
  `voucher_id` int NOT NULL,
  `user_id` int NOT NULL,
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
  (2, 4, 2, NULL, 'asdad');

-- --------------------------------------------------------
--
-- Table structure for table `users`
--
CREATE TABLE `users` (
  `id_user` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `role_id` int NOT NULL,
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
  );

-- --------------------------------------------------------
--
-- Table structure for table `virtual_account`
--
CREATE TABLE `virtual_account` (
  `id_virtual_account` int NOT NULL,
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
  (2, 'fauzi', '2203156');

-- --------------------------------------------------------
--
-- Table structure for table `vouchers`
--
CREATE TABLE `vouchers` (
  `id_voucher` int NOT NULL,
  `amount` int NOT NULL,
  `price` float NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = latin1;

--
-- Dumping data for table `vouchers`
--
INSERT INTO
  `vouchers` (`id_voucher`, `amount`, `price`)
VALUES
  (4, 2000, 20000),
  (5, 3000, 350000);

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
-- Indexes for table `roles`
--
ALTER TABLE
  `roles`
ADD
  PRIMARY KEY (`id_role`);

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
-- Indexes for table `users`
--
ALTER TABLE
  `users`
ADD
  PRIMARY KEY (`id_user`),
ADD
  KEY `id_role` (`role_id`);

--
-- Indexes for table `virtual_account`
--
ALTER TABLE
  `virtual_account`
ADD
  PRIMARY KEY (`id_virtual_account`);

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
-- AUTO_INCREMENT for table `banks`
--
ALTER TABLE
  `banks`
MODIFY
  `id_bank` int NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 4;

--
-- AUTO_INCREMENT for table `checkout`
--
ALTER TABLE
  `checkout`
MODIFY
  `id_checkout` int NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 3;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE
  `roles`
MODIFY
  `id_role` int NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 3;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE
  `transactions`
MODIFY
  `id_transaction` int NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE
  `users`
MODIFY
  `id_user` int NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 3;

--
-- AUTO_INCREMENT for table `virtual_account`
--
ALTER TABLE
  `virtual_account`
MODIFY
  `id_virtual_account` int NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 3;

--
-- AUTO_INCREMENT for table `vouchers`
--
ALTER TABLE
  `vouchers`
MODIFY
  `id_voucher` int NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 6;

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

--
-- Constraints for table `transactions`
--
ALTER TABLE
  `transactions`
ADD
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`voucher_id`) REFERENCES `vouchers` (`id_voucher`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD
  CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE
  `users`
ADD
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id_role`) ON DELETE CASCADE ON UPDATE CASCADE;

COMMIT;

<<<<<<< HEAD
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

CREATE DEFINER=`ziaq`@`localhost` PROCEDURE `login`(IN `uname` VARCHAR(50))
SELECT * FROM users WHERE username = uname$$
=======
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */
;

/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */
;

/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */
;
>>>>>>> 08f7f79bae2c4c01d9c2a6a473f64fe4df08849d
