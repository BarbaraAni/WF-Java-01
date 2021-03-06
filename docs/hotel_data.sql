-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 14. Jan 2020 um 15:31
-- Server-Version: 10.4.10-MariaDB
-- PHP-Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `hotel`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `booking`
--

CREATE TABLE `booking` (
  `id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `number_guests` int(11) NOT NULL,
  `price` int(11) DEFAULT NULL,
  `checkin_date` date NOT NULL DEFAULT curdate(),
  `checkout_date` date DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `booking`
--

INSERT INTO `booking` (`id`, `room_id`, `payment_id`, `number_guests`, `price`, `checkin_date`, `checkout_date`) VALUES
(1, 3, 1, 1, 105, '2020-01-14', '2020-01-15'),
(2, 10, 2, 7, 3202, '2020-01-14', '2020-01-16'),
(3, 7, 3, 4, 2594, '2020-01-14', '2020-01-17');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `booking_services`
--

CREATE TABLE `booking_services` (
  `booking_id` int(11) NOT NULL,
  `services_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `booking_services`
--

INSERT INTO `booking_services` (`booking_id`, `services_id`, `quantity`) VALUES
(1, 0, 1),
(3, 0, 4),
(3, 1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `guest`
--

CREATE TABLE `guest` (
  `id` int(11) NOT NULL,
  `first_name` varchar(55) NOT NULL,
  `last_name` varchar(55) NOT NULL,
  `email` varchar(55) NOT NULL,
  `address` varchar(255) NOT NULL,
  `doc_number` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `guest`
--

INSERT INTO `guest` (`id`, `first_name`, `last_name`, `email`, `address`, `doc_number`) VALUES
(0, 'Mary', 'Ryan', 'mary.ry@gmx.at', 'Spittelwiese 23, 8692 Veitschbach', '98674367'),
(1, 'Flora', 'Clarke', 'fk@gail.com', 'Ernstbrunner Straße 74, 4462 Reichraming', '16938406'),
(2, 'Martin', 'Todd', 'm.todd88@gmx.at', 'Hauptplatz 39, 4132 Oberlembach', '29583750'),
(3, 'Sherill', 'Poston', 'sherill.poston@gmx.at', 'Glocknerstrasse 20, 8584 Hirschegg-Piber-Sonnseite', '12345678'),
(4, 'Jack', 'Rodgers', 'jr45@gmx.at', 'Lettental 78, 9772 Suppersberg', '72837200'),
(5, 'Wally', 'Leger', 'wally.leger@outlook.com', 'Waldstrasse 40, 9544 Carinthia', '24149767'),
(6, 'Carina', 'Theo', 'car.theo@gmx.at', 'Prager Strasse 96, 7222 Rohrbach bei Mattersburg', '29184967'),
(7, 'Wanda', 'Kelly', 'wanda.kelly@yahoo.at', 'Horner Strasse 71m 4090 Saag', '49204536'),
(8, 'Fred', 'Moore', 'fred1234@gmx.at', 'Aspernstrasse 23, 9462 Schiefling', '12049583'),
(9, 'Rose', 'Davis', 'rose.davis@gmx.at', 'Floridusgasse 52, 1130 Wien', '33557535'),
(10, 'Earl', 'Hall', 'earlhall938@gmail.com', 'Waldstrasse 48, 4030 Felling', '18190191'),
(11, 'Ann', 'Perez', 'annperez1988@gmx.at', 'Rossmarkt 64, 1210 Langenzersdorf', '39483911'),
(12, 'Marlin', 'Estes', 'marli.estes@gmx.at', 'Steinamangerer Strasse 21, 4342 Pitzing', '241894967');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `guest_booking`
--

CREATE TABLE `guest_booking` (
  `booking_id` int(11) NOT NULL,
  `guest_id` int(11) NOT NULL,
  `iscontactperson` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `guest_booking`
--

INSERT INTO `guest_booking` (`booking_id`, `guest_id`, `iscontactperson`) VALUES
(1, 1, 1),
(2, 3, 0),
(2, 4, 0),
(2, 7, 0),
(2, 8, 0),
(2, 9, 0),
(2, 10, 1),
(2, 11, 0),
(3, 0, 1),
(3, 2, 0),
(3, 5, 0),
(3, 6, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `payment_method_id` int(11) NOT NULL,
  `payment_status_id` int(11) NOT NULL,
  `payment_system_id` varchar(55) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `payment`
--

INSERT INTO `payment` (`id`, `payment_method_id`, `payment_status_id`, `payment_system_id`, `amount`) VALUES
(1, 3, 0, 'BK123EX987', 90),
(2, 1, 2, 'BK123EX999', 1000),
(3, 4, 1, 'BK123EX911', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `payment_method`
--

CREATE TABLE `payment_method` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `payment_method`
--

INSERT INTO `payment_method` (`id`, `name`) VALUES
(0, 'paypal'),
(1, 'Master Card'),
(2, 'VISA Card'),
(3, 'Direct Transfer'),
(4, 'Cash');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `payment_status`
--

CREATE TABLE `payment_status` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `payment_status`
--

INSERT INTO `payment_status` (`id`, `name`) VALUES
(0, 'payed'),
(1, 'open'),
(2, 'half-payed');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `room`
--

CREATE TABLE `room` (
  `room_number` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `size` int(11) NOT NULL,
  `isAvailable` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `room`
--

INSERT INTO `room` (`room_number`, `type_id`, `size`, `isAvailable`) VALUES
(1, 0, 15, 1),
(2, 0, 14, 1),
(3, 1, 22, 1),
(4, 1, 22, 1),
(5, 2, 35, 1),
(6, 3, 56, 1),
(7, 3, 55, 1),
(8, 4, 30, 1),
(9, 4, 30, 1),
(10, 5, 90, 1),
(11, 2, 23, 1),
(12, 0, 14, 1),
(13, 0, 15, 1),
(14, 0, 15, 1),
(15, 1, 21, 1),
(16, 1, 22, 1),
(17, 2, 35, 1),
(18, 2, 36, 1),
(19, 3, 55, 1),
(20, 4, 30, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `services`
--

INSERT INTO `services` (`id`, `name`, `price`) VALUES
(0, 'Breakfast', 15),
(1, 'WIFI', 20),
(2, 'Extra Bed', 10);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `type`
--

CREATE TABLE `type` (
  `id` int(11) NOT NULL,
  `capacity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `equipment` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `type`
--

INSERT INTO `type` (`id`, `capacity`, `price`, `equipment`, `description`) VALUES
(0, 1, 90, 'TV, Coffee Machine, Shower', 'Room for One'),
(1, 2, 140, 'TV, Coffee Machine, Shower', 'Room for Two'),
(2, 2, 228, 'TV, DVD-Player, Coffee Machine, Shower, Bathtub', 'Deluxe Room for Two'),
(3, 4, 818, 'DVD-Player, TV, Coffee Machine, Shower, Bathtub', 'Deluxe Suite for Four'),
(4, 6, 356, 'TV', 'Budget Group Room for Six'),
(5, 8, 1601, 'TV, DVD-Player, Coffee Machine, Shower, Bathtub', 'Deluxe Royal Suite for Eight');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_id` (`payment_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Indizes für die Tabelle `booking_services`
--
ALTER TABLE `booking_services`
  ADD PRIMARY KEY (`booking_id`,`services_id`),
  ADD KEY `booking_services_ibfk_2` (`services_id`);

--
-- Indizes für die Tabelle `guest`
--
ALTER TABLE `guest`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `guest_booking`
--
ALTER TABLE `guest_booking`
  ADD PRIMARY KEY (`booking_id`,`guest_id`),
  ADD KEY `guest_booking_ibfk_2` (`guest_id`);

--
-- Indizes für die Tabelle `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_status_id` (`payment_status_id`),
  ADD KEY `payment_method_id` (`payment_method_id`);

--
-- Indizes für die Tabelle `payment_method`
--
ALTER TABLE `payment_method`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `payment_status`
--
ALTER TABLE `payment_status`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`room_number`),
  ADD KEY `type_id` (`type_id`);

--
-- Indizes für die Tabelle `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `payment_status`
--
ALTER TABLE `payment_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT für Tabelle `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `type`
--
ALTER TABLE `type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_number`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`id`),
  ADD CONSTRAINT `booking_ibfk_3` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_number`);

--
-- Constraints der Tabelle `booking_services`
--
ALTER TABLE `booking_services`
  ADD CONSTRAINT `booking_services_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`id`),
  ADD CONSTRAINT `booking_services_ibfk_2` FOREIGN KEY (`services_id`) REFERENCES `services` (`id`);

--
-- Constraints der Tabelle `guest_booking`
--
ALTER TABLE `guest_booking`
  ADD CONSTRAINT `guest_booking_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`id`),
  ADD CONSTRAINT `guest_booking_ibfk_2` FOREIGN KEY (`guest_id`) REFERENCES `guest` (`id`);

--
-- Constraints der Tabelle `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_method` (`id`),
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`payment_status_id`) REFERENCES `payment_status` (`id`);

--
-- Constraints der Tabelle `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `room_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
