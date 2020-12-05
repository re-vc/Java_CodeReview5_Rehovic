-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 05. Dez 2020 um 16:14
-- Server-Version: 10.4.16-MariaDB
-- PHP-Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr5_famazon_peter`
--
CREATE DATABASE IF NOT EXISTS `cr5_famazon_peter` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `cr5_famazon_peter`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `company`
--

CREATE TABLE `company` (
  `company_id` int(11) NOT NULL,
  `company_name` varchar(55) DEFAULT NULL,
  `company_adress` varchar(55) DEFAULT NULL,
  `company_email` varchar(55) DEFAULT NULL,
  `company_phone_number` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `company`
--

INSERT INTO `company` (`company_id`, `company_name`, `company_adress`, `company_email`, `company_phone_number`) VALUES
(1, 'Acomp', 'CompStreet 1-1', 'acomp@mail.com', '+123456789'),
(2, 'Bcomp', 'BcompStreet 1-1', 'bcomp@mail.com', '+554923566'),
(3, 'Ccomp', 'CompStreet 3-3', 'ccomp@mail.com', '+994923566');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `customer_email` varchar(55) DEFAULT NULL,
  `customer_phone_number` varchar(55) DEFAULT NULL,
  `customer_adress` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `customer`
--

INSERT INTO `customer` (`customer_id`, `first_name`, `last_name`, `customer_email`, `customer_phone_number`, `customer_adress`) VALUES
(1, 'John', 'Doe', 'johndoe@mail.com', '+43 123 456 78', 'A-Street 1-1'),
(2, 'Bob', 'Cent', 'bobcent@mail.com', '+43 126 354 98', 'B-Street 1-1'),
(3, 'Dean', 'John', 'deanjohn@mail.com', '+43 126 353 98', 'C-Street 1-1');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` int(11) NOT NULL,
  `fk_shipping_id` int(11) DEFAULT NULL,
  `fk_payment_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `fk_shipping_id`, `fk_payment_id`) VALUES
(1, 3, 1),
(2, 2, 2),
(3, 2, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `order`
--

CREATE TABLE `order` (
  `order_id` int(11) NOT NULL,
  `fk_customer_id` int(11) DEFAULT NULL,
  `fk_product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `order`
--

INSERT INTO `order` (`order_id`, `fk_customer_id`, `fk_product_id`) VALUES
(1, 2, 2),
(2, 1, 3),
(3, 2, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `payment_IBAN` varchar(55) DEFAULT NULL,
  `payment_BIC` varchar(55) DEFAULT NULL,
  `payment_bank` varchar(55) DEFAULT NULL,
  `fk_customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `payment`
--

INSERT INTO `payment` (`payment_id`, `payment_IBAN`, `payment_BIC`, `payment_bank`, `fk_customer_id`) VALUES
(1, '123456789', '123456', 'ABANK', 1),
(2, '321654987', '123456', 'ABANK', 2),
(3, '987654321', '123456', 'ABANK', 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(55) DEFAULT NULL,
  `product_price` float DEFAULT NULL,
  `product_stock` int(11) DEFAULT NULL,
  `fk_company_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `product_price`, `product_stock`, `fk_company_id`) VALUES
(1, 'soap', 2.99, 100, 1),
(2, 'oil', 2.99, 99, NULL),
(3, 'clay', 5.99, 10, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `shipping`
--

CREATE TABLE `shipping` (
  `shipping_id` int(11) NOT NULL,
  `shipping_name` varchar(55) DEFAULT NULL,
  `shipping_delivery_date` date DEFAULT NULL,
  `fk_customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `shipping`
--

INSERT INTO `shipping` (`shipping_id`, `shipping_name`, `shipping_delivery_date`, `fk_customer_id`) VALUES
(1, 'UPS', '2020-12-24', NULL),
(2, 'Fedex', '2020-12-22', NULL),
(3, 'Adelivery', '2020-12-11', NULL),
(4, 'Fedex', '2020-12-21', 2);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`company_id`);

--
-- Indizes für die Tabelle `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indizes für die Tabelle `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`),
  ADD KEY `fk_shipping_id` (`fk_shipping_id`),
  ADD KEY `fk_payment_id` (`fk_payment_id`);

--
-- Indizes für die Tabelle `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`),
  ADD KEY `fk_product_id` (`fk_product_id`);

--
-- Indizes für die Tabelle `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`);

--
-- Indizes für die Tabelle `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `fk_company_id` (`fk_company_id`);

--
-- Indizes für die Tabelle `shipping`
--
ALTER TABLE `shipping`
  ADD PRIMARY KEY (`shipping_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`fk_shipping_id`) REFERENCES `shipping` (`shipping_id`),
  ADD CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`fk_payment_id`) REFERENCES `payment` (`payment_id`);

--
-- Constraints der Tabelle `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`fk_product_id`) REFERENCES `product` (`product_id`);

--
-- Constraints der Tabelle `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints der Tabelle `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`fk_company_id`) REFERENCES `company` (`company_id`);

--
-- Constraints der Tabelle `shipping`
--
ALTER TABLE `shipping`
  ADD CONSTRAINT `shipping_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
