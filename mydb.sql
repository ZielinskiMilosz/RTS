-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 29 Wrz 2022, 10:54
-- Wersja serwera: 10.4.24-MariaDB
-- Wersja PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `mydb`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buildings`
--

CREATE TABLE `buildings` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `dom z gliny` int(11) NOT NULL,
  `huta  żelaza` int(11) NOT NULL,
  `chata drwala` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `players`
--

CREATE TABLE `players` (
  `id` int(11) NOT NULL,
  `nick` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `players`
--

INSERT INTO `players` (`id`, `nick`, `email`, `password`) VALUES
(1, 'tytus', 'tytus@wp.pl', 'tytus123'),
(2, 'romek', 'romuald23@gmail.com', 'RomanOwicz333'),
(3, 'Agatka', 'AgAtA69@wp.pl', 'x123x321x'),
(4, 'Bonio55', 'Bonifacy.Okr@gmail.com', 'Mastermind');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `resources`
--

CREATE TABLE `resources` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `drewno` int(11) NOT NULL,
  `żelazo` int(11) NOT NULL,
  `glina` int(11) NOT NULL,
  `kamień` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `resources`
--

INSERT INTO `resources` (`id`, `name`, `description`, `drewno`, `żelazo`, `glina`, `kamień`) VALUES
(1, NULL, NULL, 500, 500, 500, 500);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `troops`
--

CREATE TABLE `troops` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `damage` varchar(45) DEFAULT NULL,
  `defence` varchar(45) DEFAULT NULL,
  `troopscoldistance damage` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `troops_has_villages`
--

CREATE TABLE `troops_has_villages` (
  `troops_id` int(11) NOT NULL,
  `villages_id` int(11) NOT NULL,
  `villages_players_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `villages`
--

CREATE TABLE `villages` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `x` varchar(45) DEFAULT NULL,
  `y` varchar(45) DEFAULT NULL,
  `players_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `villages`
--

INSERT INTO `villages` (`id`, `name`, `x`, `y`, `players_id`) VALUES
(1, 'tytus', '5', '5', 1),
(2, 'romek', '5', '5', 2),
(3, 'Agatka', '5', '5', 3),
(4, 'Bonio55', '5', '5', 4);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `villages_has_buildings`
--

CREATE TABLE `villages_has_buildings` (
  `villages_id` int(11) NOT NULL,
  `villages_players_id` int(11) NOT NULL,
  `buildings_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `villages_has_resources`
--

CREATE TABLE `villages_has_resources` (
  `villages_id` int(11) NOT NULL,
  `resources_id` int(11) NOT NULL,
  `value` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `buildings`
--
ALTER TABLE `buildings`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `resources`
--
ALTER TABLE `resources`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `troops`
--
ALTER TABLE `troops`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `troops_has_villages`
--
ALTER TABLE `troops_has_villages`
  ADD PRIMARY KEY (`troops_id`,`villages_id`,`villages_players_id`),
  ADD KEY `fk_troops_has_villages_villages1` (`villages_id`,`villages_players_id`);

--
-- Indeksy dla tabeli `villages`
--
ALTER TABLE `villages`
  ADD PRIMARY KEY (`id`,`players_id`),
  ADD KEY `fk_villages_players1` (`players_id`);

--
-- Indeksy dla tabeli `villages_has_buildings`
--
ALTER TABLE `villages_has_buildings`
  ADD PRIMARY KEY (`villages_id`,`villages_players_id`,`buildings_id`),
  ADD KEY `fk_villages_has_buildings_buildings1` (`buildings_id`);

--
-- Indeksy dla tabeli `villages_has_resources`
--
ALTER TABLE `villages_has_resources`
  ADD PRIMARY KEY (`villages_id`,`resources_id`),
  ADD KEY `fk_villages_has_reasarces_reasarces1` (`resources_id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `buildings`
--
ALTER TABLE `buildings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `players`
--
ALTER TABLE `players`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `resources`
--
ALTER TABLE `resources`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `troops`
--
ALTER TABLE `troops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `villages`
--
ALTER TABLE `villages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `troops_has_villages`
--
ALTER TABLE `troops_has_villages`
  ADD CONSTRAINT `fk_troops_has_villages_troops1` FOREIGN KEY (`troops_id`) REFERENCES `troops` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_troops_has_villages_villages1` FOREIGN KEY (`villages_id`,`villages_players_id`) REFERENCES `villages` (`id`, `players_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `villages`
--
ALTER TABLE `villages`
  ADD CONSTRAINT `fk_villages_players1` FOREIGN KEY (`players_id`) REFERENCES `players` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `villages_has_buildings`
--
ALTER TABLE `villages_has_buildings`
  ADD CONSTRAINT `fk_villages_has_buildings_buildings1` FOREIGN KEY (`buildings_id`) REFERENCES `buildings` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_villages_has_buildings_villages1` FOREIGN KEY (`villages_id`,`villages_players_id`) REFERENCES `villages` (`id`, `players_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
