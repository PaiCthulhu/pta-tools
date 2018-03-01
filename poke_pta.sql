-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 01-Mar-2018 às 16:48
-- Versão do servidor: 10.1.22-MariaDB
-- PHP Version: 7.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `poke_pta`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `region`
--

CREATE TABLE `region` (
  `region_id` int(11) NOT NULL,
  `name` varchar(20) COLLATE utf8_bin NOT NULL,
  `code` varchar(3) COLLATE utf8_bin NOT NULL,
  `continent` enum('Asia','Europe','Africa','N.America','S.America','Oceania','Antartica') COLLATE utf8_bin NOT NULL,
  `color_main` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  `color_sub` varchar(6) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `region`
--

INSERT INTO `region` (`region_id`, `name`, `code`, `continent`, `color_main`, `color_sub`) VALUES
(1, 'Tsukyoto', 'TSU', 'Asia', 'FFFFFF', 'FF0000'),
(2, 'Al\'khaimah', 'ALK', 'Asia', 'FFFF00', '00FF00'),
(3, 'Kievrus', 'KIE', 'Asia', 'FFFF00', '000000'),
(4, 'Shandiguo', 'SHA', 'Asia', '9ACD32', 'FFFFFF'),
(5, 'Jivanadi', 'JIV', 'Asia', 'ADD8E6', '660099'),
(6, 'Khmere', 'KHM', 'Asia', 'FFD700', '000080'),
(7, 'Alexandros', 'ALE', 'Europe', '0000FF', 'FFFFFF'),
(8, 'Norge', 'NOR', 'Europe', '000080', 'FF0000'),
(9, 'Drachburg', 'DRA', 'Europe', '808080', '000000'),
(10, 'Kingsland', 'KIN', 'Europe', '800000', 'FFFFFF'),
(11, 'Ibéria', 'IBE', 'Europe', 'FF0000', 'FFFF00'),
(12, 'Talos', 'TAL', 'Europe', 'ADD8E6', 'FFFF00'),
(13, 'Aksum', 'AKS', 'Africa', '3964C3', 'FF681F'),
(14, 'Niani', 'NIA', 'Africa', 'C5751A', '8A312F'),
(15, 'Ras-tsion', 'RAS', 'Africa', '112A0D', 'FD201D'),
(16, 'An\'aketh', 'ANA', 'Africa', '006400', 'FFFF00'),
(17, 'Mwenekwango ', 'MWE', 'Africa', 'FFFF00', 'FF0000'),
(18, 'Kwabantu', 'KWA', 'Africa', '00FF00', 'FFFFED'),
(19, 'Teotihuan', 'TEO', 'N.America', '00FFFF', '8A0707'),
(20, 'N.E.O.', 'NEO', 'N.America', '0000C8', 'FFFFFF'),
(21, 'Yucatec', 'YUC', 'N.America', 'C7A782', '2C4747'),
(22, 'Maplewoods', 'MAP', 'N.America', '4F69C6', '00FF00'),
(23, 'Sava\'maui', 'SAV', 'N.America', 'DB520E', 'FFFC62'),
(24, 'Islas Paradiso', 'ISP', 'N.America', 'EE4000', '4F69C6'),
(25, 'El Dorado', 'DOR', 'S.America', 'FFD700', '3D7D52'),
(26, 'Sertanal', 'SER', 'S.America', '808080', 'C7A782'),
(27, 'Andina', 'AND', 'S.America', 'FBA525', '1FA069'),
(28, 'Terra Platina', 'PLA', 'S.America', '0038A8', 'FCD116'),
(29, 'Sulagônia', 'SUL', 'S.America', '0000FF', 'ADD8E6'),
(30, 'Tupinambá', 'TUP', 'S.America', '50C878', 'FFFF00'),
(31, 'Atlantis', 'ATL', 'Oceania', 'FF681F', 'FFFFFF');

-- --------------------------------------------------------

--
-- Estrutura da tabela `trainer`
--

CREATE TABLE `trainer` (
  `trainer_id` int(11) NOT NULL,
  `national` int(11) NOT NULL,
  `trainer_code` int(11) NOT NULL,
  `name` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT 'Unknown',
  `player_name` varchar(80) COLLATE utf8_bin NOT NULL DEFAULT 'NPC',
  `level` int(11) NOT NULL DEFAULT '0',
  `age` int(11) NOT NULL DEFAULT '0',
  `gender` enum('n','m','f') COLLATE utf8_bin NOT NULL DEFAULT 'n',
  `height` decimal(10,0) NOT NULL DEFAULT '0',
  `weight` decimal(10,0) NOT NULL DEFAULT '0',
  `stats` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '[6,6,6,6,6,6]',
  `date_started` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `trainer`
--

INSERT INTO `trainer` (`trainer_id`, `national`, `trainer_code`, `name`, `player_name`, `level`, `age`, `gender`, `height`, `weight`, `stats`, `date_started`) VALUES
(1, 9, 21240, 'Willheim von Hyazinthe', 'William J. Venancio', 12, 23, 'm', '2', '130', '[12,10,13,17,15,10]', '1932-02-22 09:58:36');

-- --------------------------------------------------------

--
-- Estrutura da tabela `type`
--

CREATE TABLE `type` (
  `type_id` int(11) NOT NULL,
  `name` varchar(8) COLLATE utf8_bin NOT NULL,
  `color` varchar(6) COLLATE utf8_bin NOT NULL,
  `effect` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `type`
--

INSERT INTO `type` (`type_id`, `name`, `color`, `effect`) VALUES
(0, '???', '68a090', '[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]'),
(1, 'Normal', 'a8a878', '[1,1,1,1,1,1,0.5,1,0,0.5,1,1,1,1,1,1,1,1,1]'),
(2, 'Fight', 'c03028', '[1,2,1,0.5,0.5,1,2,0.5,0,2,1,1,1,1,0.5,2,1,2,0.5]'),
(3, 'Flying', 'a890f0', '[1,1,2,1,1,1,0.5,2,1,0.5,1,1,2,0.5,1,1,1,1,1]'),
(4, 'Poison', 'a040a0', '[1,1,1,1,0.5,0.5,0.5,1,0.5,0,1,1,2,1,1,1,1,1,2]'),
(5, 'Ground', 'e3c368', '[1,1,1,0,2,1,2,0.5,1,2,2,1,0.5,2,1,1,1,1,1]'),
(6, 'Rock', 'b8a038', '[1,1,0.5,2,1,0.5,1,2,1,0.5,2,1,1,1,1,2,1,1,1]'),
(7, 'Bug', 'a8b820', '[1,1,0.5,0.5,0.5,1,1,1,0.5,0.5,0.5,1,2,1,2,1,1,2,0.5]'),
(8, 'Ghost', '705898', '[1,0,1,1,1,1,1,1,2,1,1,1,1,1,2,1,1,0.5,1]'),
(9, 'Steel', 'b8b8d0', '[1,1,1,1,1,1,2,1,1,0.5,0.5,0.5,1,0.5,1,2,1,1,2]'),
(10, 'Fire', 'f08030', '[1,1,1,1,1,1,0.5,2,1,2,0.5,0.5,2,1,1,2,0.5,1,1]'),
(11, 'Water', '6890f0', '[1,1,1,1,1,2,2,1,1,1,2,0.5,0.5,1,1,1,0.5,1,1]'),
(12, 'Grass', '78c850', '[1,1,1,0.5,0.5,2,2,0.5,1,0.5,0.5,2,0.5,1,1,1,0.5,1,1]'),
(13, 'Electric', 'f8d030', '[1,1,1,2,1,0,1,1,1,1,1,2,0.5,0.5,1,1,0.5,1,1]'),
(14, 'Psychic', 'f85888', '[1,1,2,1,2,1,1,1,1,0.5,1,1,1,1,0.5,1,1,0,1]'),
(15, 'Ice', '98d8d8', '[1,1,1,2,1,2,1,1,1,0.5,0.5,0.5,2,1,1,0.5,2,1,1]'),
(16, 'Dragon', '7038f8', '[1,1,1,1,1,1,1,1,1,0.5,1,1,1,1,1,1,2,1,0]'),
(17, 'Dark', '705848', '[1,1,0.5,1,1,1,1,1,2,1,1,1,1,1,2,1,1,0.5,0.5]'),
(18, 'Fairy', 'eb6fc6', '[1,1,2,1,0.5,1,1,1,1,0.5,0.5,1,1,1,1,1,2,2,1]');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`region_id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `trainer`
--
ALTER TABLE `trainer`
  ADD PRIMARY KEY (`trainer_id`),
  ADD KEY `trainer_code` (`trainer_code`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`type_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `region`
--
ALTER TABLE `region`
  MODIFY `region_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `trainer`
--
ALTER TABLE `trainer`
  MODIFY `trainer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `type`
--
ALTER TABLE `type`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
