-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 11, 2023 at 09:12 AM
-- Server version: 8.0.33-0ubuntu0.20.04.2
-- PHP Version: 8.0.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vpvalorant1`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`ziaq`@`localhost` PROCEDURE `bank_create` (IN `id` VARCHAR(36), IN `name` VARCHAR(75))  BEGIN
insert INTO banks(id_bank, name) VALUES(id_bank, name);
END$$

CREATE DEFINER=`ziaq`@`localhost` PROCEDURE `bank_delete` (IN `id` VARCHAR(36))  BEGIN
       DECLARE affected_rows INT;

        DELETE FROM banks WHERE id_bank = id;
       SET affected_rows = ROW_COUNT();

       IF affected_rows = 0 THEN
           SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'The provided ID does not          exist.';
       END IF;
 END$$

CREATE DEFINER=`ziaq`@`localhost` PROCEDURE `bank_edit` (IN `id` VARCHAR(36))  BEGIN
   SELECT * from banks where id_bank = id;
END$$

CREATE DEFINER=`ziaq`@`localhost` PROCEDURE `bank_read` ()  BEGIN
   SELECT * FROM banks;
END$$

CREATE DEFINER=`ziaq`@`localhost` PROCEDURE `bank_update` (IN `id` VARCHAR(36), IN `name` VARCHAR(75))  BEGIN
 UPDATE banks SET name = name WHERE id_bank = id;
END$$

CREATE DEFINER=`ziaq`@`localhost` PROCEDURE `chackout_user` (IN `uid` VARCHAR(36))  BEGIN
  SELECT
    checkout.id_checkout,
    transactions.riotId,
    checkout.total_payment,
    virtual_account.number,
    checkout.timestamp,
    checkout.status,
    vouchers.amount as voucher_amount,
    virtual_account.name as bank,
    users.name,
    users.email,
    users.username
  FROM
    checkout
    JOIN transactions ON checkout.transaction_id = transactions.id_transaction
    JOIN virtual_account ON checkout.virtual_account_id = virtual_account.id_virtual_account
    JOIN vouchers ON transactions.voucher_id = vouchers.id_voucher
    JOIN users ON transactions.user_id = users.id_user
    WHERE transactions.user_id = uid;
END$$

CREATE DEFINER=`ziaq`@`localhost` PROCEDURE `change_status` (IN `id` VARCHAR(36), IN `status` ENUM('pending','success',' failed'))  BEGIN
UPDATE checkout set status = status WHERE id_checkout = id;
END$$

CREATE DEFINER=`ziaq`@`localhost` PROCEDURE `checkout_create` (IN `id` VARCHAR(36), IN `virtual_account_id` VARCHAR(36), IN `transaction_id` VARCHAR(36), IN `total_payment` FLOAT, IN `status` ENUM('pending','success',' failed'), IN `tm` TIMESTAMP)  BEGIN
   insert INTO checkout(id_checkout, virtual_account_id, transaction_id, total_payment, status, timestamp) VALUES(id, virtual_account_id, transaction_id, total_payment, status, tm);
END$$

CREATE DEFINER=`ziaq`@`localhost` PROCEDURE `checkout_delete` (IN `id` VARCHAR(36))  BEGIN
       DECLARE affected_rows INT;

        DELETE FROM checkout WHERE id_checkout = id;
       SET affected_rows = ROW_COUNT();

       IF affected_rows = 0 THEN
           SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'The provided ID does not          exist.';
       END IF;
END$$

CREATE DEFINER=`ziaq`@`localhost` PROCEDURE `checkout_edit` (IN `checkoutID` VARCHAR(36))  BEGIN
  SELECT
    checkout.id_checkout,
    transactions.riotId,
    checkout.total_payment,
    virtual_account.number,
    checkout.timestamp,
    checkout.status,
    vouchers.amount as voucher_amount,
    virtual_account.name as bank
  FROM
    checkout
    JOIN transactions ON checkout.transaction_id = transactions.id_transaction
    JOIN virtual_account ON checkout.virtual_account_id = virtual_account.id_virtual_account
    JOIN vouchers ON transactions.voucher_id = vouchers.id_voucher
  WHERE
    checkout.id_checkout = checkoutID;
END$$

CREATE DEFINER=`ziaq`@`localhost` PROCEDURE `checkout_read` ()  BEGIN
  SELECT
    checkout.id_checkout,
    transactions.riotId,
    checkout.total_payment,
    virtual_account.number,
    checkout.timestamp,
    checkout.status,
    vouchers.amount as voucher_amount,
    virtual_account.name as bank,
    users.name,
    users.email,
    users.username
  FROM
    checkout
    JOIN transactions ON checkout.transaction_id = transactions.id_transaction
    JOIN virtual_account ON checkout.virtual_account_id = virtual_account.id_virtual_account
    JOIN vouchers ON transactions.voucher_id = vouchers.id_voucher
    JOIN users ON transactions.user_id = users.id_user;
END$$

CREATE DEFINER=`ziaq`@`localhost` PROCEDURE `checkout_update` (IN `id` VARCHAR(36), IN `va_id` VARCHAR(36), IN `trans_id` VARCHAR(36), IN `total_payment` FLOAT, IN `status` ENUM('pending','success',' failed'))  BEGIN
   UPDATE checkout SET virtual_account_id = va_id, transaction_id = trans_id, total_payment = total_payment, status =    status WHERE id_checkout = id;
END$$

CREATE DEFINER=`ziaq`@`localhost` PROCEDURE `login` (IN `uname` VARCHAR(100))  BEGIN
SELECT users.id_user, users.name, users.username, users.email, roles.name AS role_name, roles.id_role AS role_id FROM users JOIN roles ON users.role_id = roles.id_role WHERE username = uname;
END$$

CREATE DEFINER=`ziaq`@`localhost` PROCEDURE `role_create` (IN `id_role` VARCHAR(36), IN `name` VARCHAR(50))  BEGIN
insert INTO roles(id_role, name) VALUES(id_role, name);
END$$

CREATE DEFINER=`ziaq`@`localhost` PROCEDURE `role_delete` (IN `id` VARCHAR(36))  BEGIN
    DECLARE affected_rows INT;

    DELETE FROM roles WHERE id_role = id;
    SET affected_rows = ROW_COUNT();

    IF affected_rows = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'The provided ID does not exist.';
    END IF;
END$$

CREATE DEFINER=`ziaq`@`localhost` PROCEDURE `role_edit` (IN `id` VARCHAR(36))  BEGIN
SELECT * from roles where id_role = id;
END$$

CREATE DEFINER=`ziaq`@`localhost` PROCEDURE `role_read` ()  BEGIN
SELECT * FROM roles;
END$$

CREATE DEFINER=`ziaq`@`localhost` PROCEDURE `role_update` (IN `id` VARCHAR(36), IN `name` VARCHAR(50))  BEGIN
UPDATE roles SET name = name WHERE id_role = id;
END$$

CREATE DEFINER=`ziaq`@`localhost` PROCEDURE `transaction_create` (IN `id_transaction` VARCHAR(36), IN `voucher_id` VARCHAR(36), IN `user_id` VARCHAR(36), IN `riotId` VARCHAR(50), IN `timestamp` TIMESTAMP)  BEGIN
   insert INTO transactions(id_transaction, voucher_id, user_id, riotId, timestamp) VALUES(id_transaction, voucher_id, user_id, riotId, timestamp);
END$$

CREATE DEFINER=`ziaq`@`localhost` PROCEDURE `transaction_delete` (IN `id` VARCHAR(36))  BEGIN
       DECLARE affected_rows INT;

        DELETE FROM transactions WHERE id_transaction = id;
       SET affected_rows = ROW_COUNT();

       IF affected_rows = 0 THEN
           SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'The provided ID does not          exist.';
       END IF;
END$$

CREATE DEFINER=`ziaq`@`localhost` PROCEDURE `transaction_read` ()  BEGIN
SELECT transactions.id_transaction, users.username , vouchers.amount, vouchers.price FROM transactions
JOIN vouchers ON transactions.voucher_id = vouchers.id_voucher
JOIN users ON transactions.user_id = users.id_user;
END$$

CREATE DEFINER=`ziaq`@`localhost` PROCEDURE `transaction_update` (IN `id` VARCHAR(36), IN `vcr_id` INT(36), IN `usr_id` INT(36), IN `riotId` VARCHAR(50))  BEGIN
   UPDATE transactions SET voucher_id = vcr_id, user_id = usr_id WHERE id_transaction = id;
   END$$

CREATE DEFINER=`ziaq`@`localhost` PROCEDURE `user_create` (IN `id_user` VARCHAR(36), IN `role_id` VARCHAR(36), IN `email` VARCHAR(30), IN `username` VARCHAR(30), IN `password` VARCHAR(50), IN `name` VARCHAR(30))  BEGIN
 insert INTO users(id_user, role_id, email, username, password, name) VALUES(id_user, role_id, email, username, password, name);
END$$

CREATE DEFINER=`ziaq`@`localhost` PROCEDURE `user_delete` (IN `id` VARCHAR(36))  BEGIN
       DECLARE affected_rows INT;

        DELETE FROM users WHERE id_user = id;
       SET affected_rows = ROW_COUNT();

       IF affected_rows = 0 THEN
           SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'The provided ID does not          exist.';
       END IF;
END$$

CREATE DEFINER=`ziaq`@`localhost` PROCEDURE `user_edit` (IN `id` VARCHAR(25))  BEGIN
   SELECT * from users where id_user = id;
END$$

CREATE DEFINER=`ziaq`@`localhost` PROCEDURE `user_password` (IN `pw` VARCHAR(100), IN `id` VARCHAR(36))  BEGIN
UPDATE users
SET users.password = pw
WHERE users.id_user = pw;
END$$

CREATE DEFINER=`ziaq`@`localhost` PROCEDURE `user_read` ()  BEGIN
 SELECT users.id_user, users.name, users.username, users.email, roles.name AS role_name, roles.id_role AS role_id FROM users JOIN roles ON users.role_id = roles.id_role;
END$$

CREATE DEFINER=`ziaq`@`localhost` PROCEDURE `user_update` (IN `id` VARCHAR(36), IN `role_id` VARCHAR(36), IN `email` VARCHAR(30), IN `username` VARCHAR(30), IN `password` VARCHAR(50))  BEGIN
 UPDATE users SET role_id = role_id, email = email, username = username, password = password  WHERE id_user = id;
END$$

CREATE DEFINER=`ziaq`@`localhost` PROCEDURE `virtual_account_create` (IN `id` VARCHAR(36), IN `name` VARCHAR(25), IN `number` VARCHAR(25))  BEGIN
   insert INTO virtual_account(id_virtual_account, name, number) VALUES(id, name, number);
END$$

CREATE DEFINER=`ziaq`@`localhost` PROCEDURE `virtual_account_delete` (IN `id` VARCHAR(36))  BEGIN
      DECLARE affected_rows INT;

       DELETE FROM virtual_account WHERE id_virtual_account = id;
      SET affected_rows = ROW_COUNT();

      IF affected_rows = 0 THEN
          SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'The provided ID does not          exist.';
      END IF;
END$$

CREATE DEFINER=`ziaq`@`localhost` PROCEDURE `virtual_account_edit` (IN `id` VARCHAR(25))  BEGIN
   SELECT * from virtual_account WHERE id_virtual_account = id;
END$$

CREATE DEFINER=`ziaq`@`localhost` PROCEDURE `virtual_account_read` ()  BEGIN
   SELECT * FROM virtual_account;
END$$

CREATE DEFINER=`ziaq`@`localhost` PROCEDURE `virtual_account_update` (IN `id` VARCHAR(36), IN `name` VARCHAR(25), IN `number` VARCHAR(25))  BEGIN
   UPDATE virtual_account SET name = name, number = number WHERE id_virtual_account = id;
END$$

CREATE DEFINER=`ziaq`@`localhost` PROCEDURE `voucher_create` (IN `id` VARCHAR(36), IN `amount` INT(4), IN `price` FLOAT)  BEGIN
insert INTO vouchers(id_voucher, amount, price) VALUES(id, amount, price);
END$$

CREATE DEFINER=`ziaq`@`localhost` PROCEDURE `voucher_delete` (IN `id` VARCHAR(36))  BEGIN
DECLARE affected_rows INT;

DELETE FROM vouchers WHERE id_voucher = id;
SET affected_rows = ROW_COUNT();

IF affected_rows = 0 THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'The provided ID does not exist.';
END if;
END$$

CREATE DEFINER=`ziaq`@`localhost` PROCEDURE `voucher_edit` (IN `id` INT(25))  BEGIN
   SELECT * from vouchers where id_voucher = id;
 END$$

CREATE DEFINER=`ziaq`@`localhost` PROCEDURE `voucher_read` ()  BEGIN
   SELECT * FROM vouchers;
END$$

CREATE DEFINER=`ziaq`@`localhost` PROCEDURE `voucher_update` (IN `id` VARCHAR(36), IN `amount` INT(4), IN `price` FLOAT)  BEGIN
UPDATE vouchers SET amount = amount, price = price WHERE id_voucher = id;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `banks`
--

CREATE TABLE `banks` (
  `id_bank` bigint NOT NULL,
  `name` varchar(75) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `banks`
--

INSERT INTO `banks` (`id_bank`, `name`) VALUES
(1, 'BCA'),
(2, 'MANDIRI');

-- --------------------------------------------------------

--
-- Table structure for table `checkout`
--

CREATE TABLE `checkout` (
  `id_checkout` varchar(36) NOT NULL,
  `virtual_account_id` varchar(36) NOT NULL,
  `transaction_id` varchar(36) NOT NULL,
  `total_payment` float NOT NULL,
  `status` enum('pending','success',' failed') NOT NULL,
  `timestamp` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `checkout`
--

INSERT INTO `checkout` (`id_checkout`, `virtual_account_id`, `transaction_id`, `total_payment`, `status`, `timestamp`) VALUES
('1b3064ac-2055-4e55-85b2-2eaa60621bdb', '7e4ee3d4-aa16-492a-a1c9-2c18d02de3b4', 'c41ec3cd-f271-4fc1-a99e-d3a02a4ad964', 501000, 'pending', '2023-06-10 19:04:19'),
('1cca8ef3-df44-4365-a4ea-4befaea31e6e', '461e5549-46e9-4ac3-a814-e9beb0aab577', '6e3c76d7-42a8-4762-bd94-35743f48924b', 501000, 'success', '2023-06-11 08:53:33'),
('380825e2-28a1-4c12-b377-5f94559a7700', 'a1d1c183-a2e2-428c-9a62-00670e249272', '2b9d3c52-4c8e-4ec9-b7ee-4580ac5ce68d', 1213120, 'success', '2023-06-10 19:56:43'),
('393b86e7-ca38-459d-80ef-451f57984b28', '0f7ca9bf-bba3-40c0-8363-5a130ae99eff', 'c95bb19f-5fed-482e-a05e-610eadf94e52', 1213120, 'pending', '2023-06-10 23:54:55'),
('63c331df-743e-43df-8ada-e621f4a70077', '447468af-0b6b-4b56-ba5d-91813a27fd61', '8be5447d-2345-4a8a-b076-a9945b86314b', 501000, 'success', '2023-06-11 09:04:25'),
('7a4383db-4be0-4f81-ad3d-c44e1aac5576', '0cb39bce-452a-4613-ab1f-4c4d5869a166', 'f0e25231-bfae-4821-877b-178d34fd6e7b', 501000, 'success', '2023-06-10 19:52:11'),
('7a7068b9-0805-4693-80cc-05aa68060d3e', '6e256f9f-91a2-49bd-b36c-fee3137cdd21', '3db81c43-7033-4a56-954f-d080484f1954', 1213120, 'success', '2023-06-10 19:54:46'),
('cfe558ca-6fcf-4446-9230-c44f82f96684', 'e7e3ec92-0bfe-466a-bd58-f592651d7d20', '957c44a4-b410-4cfe-9b31-96c4a071c4ae', 501000, 'pending', '2023-06-10 18:15:10');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id_role` varchar(36) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id_role`, `name`) VALUES
('06253bad-5034-4166-a113-33c372093a06', 'admin'),
('214ed97f-6674-44b8-8a8d-6fdf0a02db54', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id_transaction` varchar(36) NOT NULL,
  `voucher_id` varchar(36) NOT NULL,
  `user_id` varchar(36) NOT NULL,
  `timestamp` timestamp NULL DEFAULT NULL,
  `riotId` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id_transaction`, `voucher_id`, `user_id`, `timestamp`, `riotId`) VALUES
('0158d8ad-147d-4a1a-8edf-890181a692e3', '742b463f-54b1-49fd-87b0-0dd8cbf889ef', '5590a8b8-af02-4af3-af77-f6e32d59156a', '2023-06-10 17:13:38', 'moorise#nite'),
('03eec297-93df-4bc8-a7fd-0ea76a0bddaf', '742b463f-54b1-49fd-87b0-0dd8cbf889ef', '5590a8b8-af02-4af3-af77-f6e32d59156a', '2023-06-10 17:09:51', '12121'),
('17eef262-6970-44be-bda3-252c7cc88302', 'e3e0345a-6576-492c-9b04-d0269cf068dd', '5590a8b8-af02-4af3-af77-f6e32d59156a', '2023-06-10 17:56:22', 'moonrise#nite'),
('18ab992a-17be-4011-a167-19917409f2cc', '742b463f-54b1-49fd-87b0-0dd8cbf889ef', '5590a8b8-af02-4af3-af77-f6e32d59156a', '2023-06-10 17:12:44', '12121'),
('1b06b81a-12c2-4656-b449-dd69e05c271d', 'e3e0345a-6576-492c-9b04-d0269cf068dd', '5590a8b8-af02-4af3-af77-f6e32d59156a', '2023-06-10 16:51:02', 'moonrise#nite'),
('2173c0cb-5f7c-4a6f-9057-4f037aaffa11', '742b463f-54b1-49fd-87b0-0dd8cbf889ef', '5590a8b8-af02-4af3-af77-f6e32d59156a', '2023-06-10 17:18:00', 'djadjwad#nite'),
('23b8a48e-39e2-4780-9878-6547f210881e', 'e3e0345a-6576-492c-9b04-d0269cf068dd', '5590a8b8-af02-4af3-af77-f6e32d59156a', '2023-06-10 17:15:19', 'lalalenda#dawd'),
('248262e6-02be-4f3b-808d-e608439c3ee2', '742b463f-54b1-49fd-87b0-0dd8cbf889ef', '5590a8b8-af02-4af3-af77-f6e32d59156a', '2023-06-10 18:14:51', 'undefined'),
('28344494-e4e2-4780-b7db-bc7fbf9cbf8e', '742b463f-54b1-49fd-87b0-0dd8cbf889ef', '5590a8b8-af02-4af3-af77-f6e32d59156a', '2023-06-10 17:35:23', 'tes#mail'),
('2a5af3c9-9fe2-4654-b7ac-0d21a869bd61', 'e3e0345a-6576-492c-9b04-d0269cf068dd', '5590a8b8-af02-4af3-af77-f6e32d59156a', '2023-06-10 17:26:58', 'valo#haha'),
('2b9d3c52-4c8e-4ec9-b7ee-4580ac5ce68d', '742b463f-54b1-49fd-87b0-0dd8cbf889ef', '5590a8b8-af02-4af3-af77-f6e32d59156a', '2023-06-10 19:56:43', 'dadawd'),
('36abb93b-0513-456e-9295-557ce9f3fab1', 'e3e0345a-6576-492c-9b04-d0269cf068dd', '5590a8b8-af02-4af3-af77-f6e32d59156a', '2023-06-10 17:16:40', 'moonrise#ntie'),
('3db81c43-7033-4a56-954f-d080484f1954', '742b463f-54b1-49fd-87b0-0dd8cbf889ef', '5590a8b8-af02-4af3-af77-f6e32d59156a', '2023-06-10 19:54:46', 'dadawd'),
('65b2755c-05b1-4f3f-bfdd-09c9a1ab776f', '742b463f-54b1-49fd-87b0-0dd8cbf889ef', '5590a8b8-af02-4af3-af77-f6e32d59156a', '2023-06-10 17:23:59', 'moonrise'),
('6e3c76d7-42a8-4762-bd94-35743f48924b', 'e3e0345a-6576-492c-9b04-d0269cf068dd', '5590a8b8-af02-4af3-af77-f6e32d59156a', '2023-06-11 08:53:32', 'moonrise#nite'),
('78c14815-23fc-4a53-98a1-0647ac44c173', 'e3e0345a-6576-492c-9b04-d0269cf068dd', '5590a8b8-af02-4af3-af77-f6e32d59156a', '2023-06-10 17:30:29', 'final#test'),
('87ff75a4-8c85-4174-9f6b-087d08236f48', 'e3e0345a-6576-492c-9b04-d0269cf068dd', '5590a8b8-af02-4af3-af77-f6e32d59156a', '2023-06-10 17:07:56', 'moonrise#nite'),
('88f16b69-7287-439f-a67a-773cb99857ec', 'e3e0345a-6576-492c-9b04-d0269cf068dd', '5590a8b8-af02-4af3-af77-f6e32d59156a', '2023-06-10 17:14:29', 'gunbullet#nt'),
('8be5447d-2345-4a8a-b076-a9945b86314b', 'e3e0345a-6576-492c-9b04-d0269cf068dd', '5590a8b8-af02-4af3-af77-f6e32d59156a', '2023-06-11 09:04:24', 'lili#la2'),
('957c44a4-b410-4cfe-9b31-96c4a071c4ae', 'e3e0345a-6576-492c-9b04-d0269cf068dd', '5590a8b8-af02-4af3-af77-f6e32d59156a', '2023-06-10 18:15:10', 'semewew#nite'),
('a4abd44e-838f-4fd5-bec7-d8513e9779ec', '742b463f-54b1-49fd-87b0-0dd8cbf889ef', '5590a8b8-af02-4af3-af77-f6e32d59156a', '2023-06-10 17:21:34', 'djadjwad#nite'),
('c41ec3cd-f271-4fc1-a99e-d3a02a4ad964', 'e3e0345a-6576-492c-9b04-d0269cf068dd', '5590a8b8-af02-4af3-af77-f6e32d59156a', '2023-06-10 19:04:19', 'deepbullets#gun'),
('c95bb19f-5fed-482e-a05e-610eadf94e52', '742b463f-54b1-49fd-87b0-0dd8cbf889ef', '5590a8b8-af02-4af3-af77-f6e32d59156a', '2023-06-10 23:54:55', 'undefined'),
('e3c22a34-dd9a-41b7-81fd-1709187ebb96', 'e3e0345a-6576-492c-9b04-d0269cf068dd', '5590a8b8-af02-4af3-af77-f6e32d59156a', '2023-06-10 18:13:39', 'lalalend#nothing'),
('ee28f6e8-9c1d-4352-a4ca-0fc0faab0969', 'e3e0345a-6576-492c-9b04-d0269cf068dd', '5590a8b8-af02-4af3-af77-f6e32d59156a', '2023-06-10 18:11:49', 'lalalend#nothing'),
('ef7bda75-9d8a-425e-b018-f6ad79067bba', '742b463f-54b1-49fd-87b0-0dd8cbf889ef', '5590a8b8-af02-4af3-af77-f6e32d59156a', '2023-06-10 17:47:39', 'lalallend#1212'),
('f0e25231-bfae-4821-877b-178d34fd6e7b', 'e3e0345a-6576-492c-9b04-d0269cf068dd', '5590a8b8-af02-4af3-af77-f6e32d59156a', '2023-06-10 19:52:11', 'ux#ui'),
('fe28fc9f-7c50-4dfe-ac40-e4134b94f593', 'e3e0345a-6576-492c-9b04-d0269cf068dd', '5590a8b8-af02-4af3-af77-f6e32d59156a', '2023-06-10 17:09:00', 'adwadawdad');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` varchar(36) NOT NULL,
  `name` varchar(100) NOT NULL,
  `role_id` varchar(36) NOT NULL,
  `email` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `name`, `role_id`, `email`, `username`, `password`) VALUES
('0cd04790-5bb9-4c4b-8cd5-a3693a25cd20', 'admin', '214ed97f-6674-44b8-8a8d-6fdf0a02db54', 'admin@mail.com', 'admin', '$2b$10$cAol0ruX6i4zF/QkPsCt6OWL8L.d8AkcMXUHhNqNO4h7d4BjpxznS'),
('1924dd1d-f9d6-488a-9aca-b51b82abf07b', 'tester', '214ed97f-6674-44b8-8a8d-6fdf0a02db54', 'tester@mail.com', 'tester', '$2b$10$oKr225PqF0sryZQAoti76.9OM2ifPVckL5uSPPb2rjgAbKvz9N2o.'),
('416502b8-8676-4d95-8e7f-49eaf20d7226', 'valorant', '214ed97f-6674-44b8-8a8d-6fdf0a02db54', 'valorant@mail.com', 'valorant', '$2b$10$Ml2XSoLIxjNdBsFdLTmPhebVzigpSPMbN5Gr0qa19/hRr20SDEhim'),
('4fe125ab-f323-466c-a16b-d5d33a41182e', 'udin7', '214ed97f-6674-44b8-8a8d-6fdf0a02db54', 'udin7@mail.com', 'udin7', '$2b$10$w7zxSnqClxle2x1VrT3KUu3zNLDxJaheXFlJPn61ftu9xHFWHndwK'),
('5590a8b8-af02-4af3-af77-f6e32d59156a', 'daddwda', '214ed97f-6674-44b8-8a8d-6fdf0a02db54', 'arief@mail.com', 'dawdad', '[object Promise]'),
('65bf6681-6c2a-4d06-a7d8-4db4ba664976', 'lampir', '214ed97f-6674-44b8-8a8d-6fdf0a02db54', 'lampir@mail.com', 'lampir', '$2b$10$oP6G9QIVUDzrgpD/nUS2me6PHOfvTsoTA552EEfnYRnSDE8F2wodO'),
('73c6a77d-492f-4e81-b343-c3c01b4eab3b', 'lalallal', '214ed97f-6674-44b8-8a8d-6fdf0a02db54', 'lalall@main.com', 'lalalalal', '$2b$10$hScEl.cSZRruZM77EOZ43uAQ/Y5IibHi2KA65gTHwyY.TkuUsqnwO'),
('77f543b4-5f66-4055-8b82-33ebee74dc36', 'kuntul', '214ed97f-6674-44b8-8a8d-6fdf0a02db54', 'kuntul@mail.com', 'kuntul', '$2b$10$Li42T0EBEPn.2K3x2wUwP.okGtKzr749K63wrx6EihZvnlSSYxxwS'),
('8d3e20c4-046e-42a9-9292-57b3d6bba483', 'kamaludin', '214ed97f-6674-44b8-8a8d-6fdf0a02db54', 'kamal@mail.com', 'kamaludin', '$2b$10$m5pBGqpx7CGHEepC33c64.BO82TJOHY1fipAh8jxB3pQYSZKd37q.'),
('998ac5a3-1fdc-45e8-bc59-e725e0b01e5a', 'udin9', '214ed97f-6674-44b8-8a8d-6fdf0a02db54', 'udin9@mail.com', 'udin9', '$2b$10$i9ffinxFMgQX00nWfDbskOuqOJoHy1wLvPtNtOTxbT9VpgqtR5J0y'),
('9ddbad28-f2c5-43fd-8f8e-68ceb114b07f', 'udin', '214ed97f-6674-44b8-8a8d-6fdf0a02db54', 'dwwadawd@mail.net', 'dawdad', '[object Promise]'),
('aca4e575-5807-47dd-a3fe-259c36c2426e', 'kamaludin1', '214ed97f-6674-44b8-8a8d-6fdf0a02db54', 'kamal1@mail.com', 'kamaludin1', '$2b$10$TyC32PKrHq6L5P5Mg4D4mulZv4KCvY3LmwxxyElQIGgC4UKc0jh9y'),
('b31284c8-8aff-4fbc-9cf2-6b2c3b1975e2', 'ukal', '214ed97f-6674-44b8-8a8d-6fdf0a02db54', 'ukal@mail.com', 'ukal', '$2b$10$wG8fX7.9n3w72FaAm6M05eANiy.1gL0aDttCovYKbUa5JWWNKvjiG'),
('b639b8dc-3d42-4472-a0c9-164070fc9a9f', 'kamuadalah1', '214ed97f-6674-44b8-8a8d-6fdf0a02db54', 'kamuadala1h@mail.com', 'kamuadalah1', '$2b$10$.KMajeAX7DwjiG1XNFiYXO7Shwre46toS5N8rL/yXoSrwwDg6vlyq'),
('c416b4e5-6a57-4dbb-a10a-3b9e1223970f', 'vpvalorant1', '214ed97f-6674-44b8-8a8d-6fdf0a02db54', 'vpvalorant1@mail.com', 'vpvalorant1', '$2b$10$j6CB4R6EvA/lb/95AEx8LuoRNtvq0/0OSv/5Yw/0IkCOQXUC6Zdz2'),
('e5f5c99c-901c-4ede-b498-54a2b89eccef', 'udin', '214ed97f-6674-44b8-8a8d-6fdf0a02db54', 'udin@mail.com', 'udin', '$2b$10$JAn6iCkEjgpKSkFBY.N6VO1AenhLWQ1NHk2l94snTzxiKf71Gqsqu'),
('ec796eb8-714c-440a-8c17-85b0c65b2384', 'register', '214ed97f-6674-44b8-8a8d-6fdf0a02db54', 'register@mail.com', 'register', '$2b$10$5K/jTCbF0XKvS6xQc9Oeqe.OX9tgcEJ.aDs5IzftnyXQCc0uofA8O'),
('f119b462-4645-41c6-8f5a-ea858a89e6f3', 'client', '214ed97f-6674-44b8-8a8d-6fdf0a02db54', 'client@mail.com', 'client', '$2b$10$.NJkOn7TlDVmZxuPUnTGTeQ7jTyuwRt7s/jPGPMGniqDbNdqjr1ra'),
('f7816fce-6bdc-481e-b574-13e804be8b0c', 'lama', '214ed97f-6674-44b8-8a8d-6fdf0a02db54', 'lama@mail.com', 'lama', '$2b$10$gP8icQgjW6DPeRqPZ0gNde4mGjLMzO7hzA7hexUmN44m6jU4eRJ.u'),
('fbbe74bc-328d-4d12-ac79-d08b39fbdea8', 'name', '214ed97f-6674-44b8-8a8d-6fdf0a02db54', 'name@mail.com', 'name', '$2b$10$CQjQBDsZI98WoxyGox4Li.Twsl.4EuJ2Nr9me/yecGn5G.hgOn/mG');

-- --------------------------------------------------------

--
-- Table structure for table `virtual_account`
--

CREATE TABLE `virtual_account` (
  `id_virtual_account` varchar(36) NOT NULL,
  `name` varchar(25) NOT NULL,
  `number` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `virtual_account`
--

INSERT INTO `virtual_account` (`id_virtual_account`, `name`, `number`) VALUES
('02bf5af7-1c64-4102-b02e-e9cf4478613c', 'TOLOL', '46095095'),
('0cb39bce-452a-4613-ab1f-4c4d5869a166', 'parah euy', '213097422'),
('0f7ca9bf-bba3-40c0-8363-5a130ae99eff', 'parah euy', '259828159'),
('1', 'daffa', '1254421'),
('118711f1-7049-4179-83ab-6af7ab571fdb', 'TOLOL', '294064625'),
('1d6b792e-2c9d-4421-b8c9-e126521cebde', 'parah euy', '493582638'),
('1e6bb199-6ea9-462b-b5bd-679959020b66', 'parah euy', '510374297'),
('2', 'fauzi', '2203156'),
('3', 'cakcukcok', '33655488512'),
('447468af-0b6b-4b56-ba5d-91813a27fd61', 'BCA', '1148479663'),
('461e5549-46e9-4ac3-a814-e9beb0aab577', 'parah euy', '1176393033'),
('4a4d195b-5933-41f0-b23a-0c8b272ccbdc', 'TOLOL', '1246566747'),
('6e256f9f-91a2-49bd-b36c-fee3137cdd21', 'TOLOL', '1847947167'),
('7e4ee3d4-aa16-492a-a1c9-2c18d02de3b4', 'TOLOL', '2119099348'),
('81a592a3-40f8-4e2e-96fd-3a2caba8e907', 'parah euy', '2175111843'),
('90a4d908-85ad-4629-ab13-7c8bdc324b26', 'parah euy', '2426722568'),
('95ca3f67-e50b-4c68-8970-229566a58ab3', 'parah euy', '2513059687'),
('9badcb44-06bc-4f7d-a6cd-d948d0ba5b18', 'parah euy', '2611858244'),
('9ef3297c-8489-4edb-b7cd-aa7fb24ee10b', 'parah euy', '2666735996'),
('a1d1c183-a2e2-428c-9a62-00670e249272', 'parah euy', '2714878339'),
('e7e3ec92-0bfe-466a-bd58-f592651d7d20', 'TOLOL', '3890474130'),
('ffdd738b-5b39-4673-ab12-9d3e711d9224', 'parah euy', '4292703115');

-- --------------------------------------------------------

--
-- Table structure for table `vouchers`
--

CREATE TABLE `vouchers` (
  `id_voucher` varchar(36) NOT NULL,
  `amount` int NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vouchers`
--

INSERT INTO `vouchers` (`id_voucher`, `amount`, `price`) VALUES
('742b463f-54b1-49fd-87b0-0dd8cbf889ef', 12121, 1212120),
('e3e0345a-6576-492c-9b04-d0269cf068dd', 12000, 500000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banks`
--
ALTER TABLE `banks`
  ADD PRIMARY KEY (`id_bank`);

--
-- Indexes for table `checkout`
--
ALTER TABLE `checkout`
  ADD PRIMARY KEY (`id_checkout`),
  ADD KEY `virtual_account_id` (`virtual_account_id`),
  ADD KEY `transaction_id` (`transaction_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_role`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id_transaction`),
  ADD KEY `voucher_id` (`voucher_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_role` (`role_id`);

--
-- Indexes for table `virtual_account`
--
ALTER TABLE `virtual_account`
  ADD PRIMARY KEY (`id_virtual_account`);

--
-- Indexes for table `vouchers`
--
ALTER TABLE `vouchers`
  ADD PRIMARY KEY (`id_voucher`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banks`
--
ALTER TABLE `banks`
  MODIFY `id_bank` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `checkout`
--
ALTER TABLE `checkout`
  ADD CONSTRAINT `checkout_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id_transaction`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `checkout_ibfk_2` FOREIGN KEY (`virtual_account_id`) REFERENCES `virtual_account` (`id_virtual_account`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`voucher_id`) REFERENCES `vouchers` (`id_voucher`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id_role`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;