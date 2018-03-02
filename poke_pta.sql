-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 02-Mar-2018 às 22:01
-- Versão do servidor: 10.1.28-MariaDB
-- PHP Version: 7.1.11

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
-- Estrutura da tabela `color`
--

CREATE TABLE `color` (
  `color_id` int(11) NOT NULL,
  `name` varchar(8) COLLATE utf8_bin NOT NULL DEFAULT 'Unknown',
  `color` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT '000000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Pokédex Species Color';

--
-- Extraindo dados da tabela `color`
--

INSERT INTO `color` (`color_id`, `name`, `color`) VALUES
(1, 'Red', 'F05868'),
(2, 'Blue', '3088F0'),
(3, 'Yellow', 'F0D048'),
(4, 'Green', '40B868'),
(5, 'Black', '585858'),
(6, 'Brown', 'B07030'),
(7, 'Purple', 'A868C0'),
(8, 'Gray', 'A0A0A0'),
(9, 'White', 'F0F0F0'),
(10, 'Pink', 'F890C8');

-- --------------------------------------------------------

--
-- Estrutura da tabela `egg_group`
--

CREATE TABLE `egg_group` (
  `egg_group_id` int(11) NOT NULL,
  `name` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT 'Indeterminate',
  `color` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT '000000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `egg_group`
--

INSERT INTO `egg_group` (`egg_group_id`, `name`, `color`) VALUES
(1, 'Monster', 'D25064'),
(2, 'Water1', '97B5FD'),
(3, 'Water2', '729AFA'),
(4, 'Water3', '5876BE'),
(5, 'Bug', 'AAC22A'),
(6, 'Flying', 'B29AFA'),
(7, 'Field', 'E0C068'),
(8, 'Fairy', 'FFC8F0'),
(9, 'Grass', '82D25A'),
(10, 'Humanlike', 'D29682'),
(11, 'Mineral', '7A6252'),
(12, 'Amorphous', '8A8A8A'),
(13, 'Dragon', '7A42FF'),
(14, 'Ditto', 'A664BF'),
(15, 'Undiscovered', '333333'),
(16, 'Unknown', '0080C0');

-- --------------------------------------------------------

--
-- Estrutura da tabela `feature_cat`
--

CREATE TABLE `feature_cat` (
  `feature_cat_id` int(11) NOT NULL,
  `name` varchar(60) COLLATE utf8_bin NOT NULL,
  `type` enum('Common','Base','Advanced') COLLATE utf8_bin NOT NULL DEFAULT 'Common',
  `parent` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `feature_cat`
--

INSERT INTO `feature_cat` (`feature_cat_id`, `name`, `type`, `parent`) VALUES
(1, 'Class', 'Common', 0),
(2, 'Trainer', 'Common', 1),
(3, 'Ace Trainer', 'Base', 2),
(4, 'Chaser', 'Advanced', 3),
(5, 'Enduring Soul', 'Advanced', 3),
(6, 'Stat Ace', 'Advanced', 3),
(7, 'Strategist', 'Advanced', 3),
(8, 'Tag Battler', 'Advanced', 3),
(9, 'Type Ace', 'Advanced', 3),
(10, 'Underdog', 'Advanced', 3),
(11, 'Breeder', 'Base', 2),
(12, 'Botanist', 'Advanced', 11),
(13, 'Chef', 'Advanced', 11),
(14, 'Evolver', 'Advanced', 11),
(15, 'Groomer', 'Advanced', 11),
(16, 'Hatcher', 'Advanced', 11),
(17, 'Medic', 'Advanced', 11),
(18, 'Move Tutor', 'Advanced', 11),
(19, 'Capture Specialist', 'Base', 2),
(20, 'Artificer', 'Advanced', 19),
(21, 'Collector', 'Advanced', 19),
(22, 'Engineer', 'Advanced', 19),
(23, 'Juggler', 'Advanced', 19),
(24, 'Pokeball Designer', 'Advanced', 19),
(25, 'Snagger', 'Advanced', 19),
(26, 'Trapper', 'Advanced', 19),
(27, 'Coordinator', 'Base', 2),
(28, 'Beauty Modeler', 'Advanced', 27),
(29, 'Choreographer', 'Advanced', 27),
(30, 'Cool Trainer', 'Advanced', 27),
(31, 'Cute Idol', 'Advanced', 27),
(32, 'Fashion Designer', 'Advanced', 27),
(33, 'Smart Teacher', 'Advanced', 27),
(34, 'Tough Guy', 'Advanced', 27),
(35, 'Martial Artist', 'Base', 2),
(36, 'Athlete', 'Advanced', 35),
(37, 'Aura User', 'Advanced', 35),
(38, 'Black Belt', 'Advanced', 35),
(39, 'Dirty Fighter', 'Advanced', 35),
(40, 'Ninja', 'Advanced', 35),
(41, 'Weapons Master', 'Advanced', 35),
(42, 'Yogi', 'Advanced', 35),
(44, 'Mystic', 'Base', 2),
(45, 'Bard', 'Advanced', 43),
(46, 'Bodysnatcher', 'Advanced', 43),
(47, 'Conduit', 'Advanced', 43),
(48, 'Godspeaker', 'Advanced', 43),
(49, 'Guardian', 'Advanced', 43),
(50, 'Rune Master', 'Advanced', 43),
(51, 'Shaman', 'Advanced', 43),
(52, 'Psychic', 'Base', 2),
(53, 'Air Adept', 'Advanced', 51),
(54, 'Clairsentient', 'Advanced', 51),
(55, 'Earth Shaker', 'Advanced', 51),
(56, 'Empath', 'Advanced', 51),
(57, 'Fire Breather', 'Advanced', 51),
(58, 'Hex Maniac', 'Advanced', 51),
(59, 'Rain Waker', 'Advanced', 51),
(60, 'Ranger', 'Base', 2),
(61, 'Coach', 'Advanced', 59),
(62, 'Commander', 'Advanced', 59),
(63, 'Detective', 'Advanced', 59),
(64, 'Rider', 'Advanced', 59),
(65, 'Signer', 'Advanced', 59),
(66, 'Special Operations', 'Advanced', 59),
(67, 'Survivalist', 'Advanced', 59),
(68, 'Researcher', 'Base', 2),
(69, 'Cryptozoologist', 'Advanced', 68),
(70, 'Dream Doctor', 'Advanced', 68),
(71, 'Petrologist', 'Advanced', 68),
(72, 'Photographer', 'Advanced', 68),
(73, 'Professor', 'Advanced', 68),
(74, 'Scientist', 'Advanced', 68),
(75, 'Watcher', 'Advanced', 68);

-- --------------------------------------------------------

--
-- Estrutura da tabela `nature`
--

CREATE TABLE `nature` (
  `nature_id` int(11) NOT NULL,
  `name` varchar(40) COLLATE utf8_bin NOT NULL,
  `raise` enum('HP','ATK','DEF','S.ATK','S.DEF','SPD') COLLATE utf8_bin DEFAULT NULL,
  `lower` enum('HP','ATK','DEF','S.ATK','S.DEF','SPD') COLLATE utf8_bin DEFAULT NULL,
  `liked` enum('None','Dry','Sweet','Bitter','Sour','Spicy') COLLATE utf8_bin NOT NULL DEFAULT 'None',
  `disliked` enum('None','Dry','Sweet','Bitter','Sour','Spicy') COLLATE utf8_bin NOT NULL DEFAULT 'None'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `nature`
--

INSERT INTO `nature` (`nature_id`, `name`, `raise`, `lower`, `liked`, `disliked`) VALUES
(1, 'Hardy', 'HP', 'ATK', 'None', 'Spicy'),
(2, 'Docile', 'HP', 'DEF', 'None', 'Sour'),
(3, 'Proud', 'HP', 'S.ATK', 'None', 'Dry'),
(4, 'Quirky', 'HP', 'S.DEF', 'None', 'Bitter'),
(5, 'Lazy', 'HP', 'SPD', 'None', 'Sweet'),
(6, 'Desperate', 'ATK', 'HP', 'Spicy', 'None'),
(7, 'Lonely', 'ATK', 'DEF', 'Spicy', 'Sour'),
(8, 'Adamant', 'ATK', 'S.ATK', 'Spicy', 'Dry'),
(9, 'Naughty', 'ATK', 'S.DEF', 'Spicy', 'Bitter'),
(10, 'Brave', 'ATK', 'SPD', 'Spicy', 'Sweet'),
(11, 'Stark', 'DEF', 'HP', 'Sour', 'None'),
(12, 'Bold', 'DEF', 'ATK', 'Sour', 'Spicy'),
(13, 'Impish', 'DEF', 'S.ATK', 'Sour', 'Dry'),
(14, 'Lax', 'DEF', 'S.DEF', 'Sour', 'Bitter'),
(15, 'Relaxed', 'DEF', 'SPD', 'Sour', 'Sweet'),
(16, 'Bashful', 'S.ATK', 'HP', 'Dry', 'None'),
(17, 'Modest', 'S.ATK', 'ATK', 'Dry', 'Spicy'),
(18, 'Mild', 'S.ATK', 'DEF', 'Dry', 'Sour'),
(19, 'Rash', 'S.ATK', 'S.DEF', 'Dry', 'Bitter'),
(20, 'Quiet', 'S.ATK', 'SPD', 'Dry', 'Sweet'),
(21, 'Sickly', 'S.DEF', 'HP', 'Bitter', 'None'),
(22, 'Calm', 'S.DEF', 'ATK', 'Bitter', 'Spicy'),
(23, 'Gentle', 'S.DEF', 'DEF', 'Bitter', 'Sour'),
(24, 'Careful', 'S.DEF', 'S.ATK', 'Bitter', 'Dry'),
(25, 'Sassy', 'S.DEF', 'SPD', 'Bitter', 'Sweet'),
(26, 'Serious', 'SPD', 'HP', 'Sweet', 'None'),
(27, 'Timid', 'SPD', 'ATK', 'Sweet', 'Spicy'),
(28, 'Hasty', 'SPD', 'DEF', 'Sweet', 'Sour'),
(29, 'Jolly', 'SPD', 'S.ATK', 'Sweet', 'Dry'),
(30, 'Naive', 'SPD', 'S.DEF', 'Sweet', 'Bitter'),
(31, 'Composed', NULL, NULL, 'None', 'None'),
(32, 'Dull', NULL, NULL, 'None', 'None'),
(33, 'Patient', NULL, NULL, 'None', 'None'),
(34, 'Poised', NULL, NULL, 'None', 'None'),
(35, 'Stoic', NULL, NULL, 'None', 'None');

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
-- Estrutura da tabela `shape`
--

CREATE TABLE `shape` (
  `shape_id` int(11) NOT NULL,
  `name` varchar(20) COLLATE utf8_bin NOT NULL,
  `nick` varchar(12) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `shape`
--

INSERT INTO `shape` (`shape_id`, `name`, `nick`) VALUES
(1, 'Pomaceous', 'ball'),
(2, 'Caudal', 'squiggle'),
(3, 'Ichthyic', 'fish'),
(4, 'Brachial', 'arms'),
(5, 'Alvine', 'blob'),
(6, 'Sciurine', 'upright'),
(7, 'Crural', 'legs'),
(8, 'Mensal', 'quadruped'),
(9, 'Alar', 'wings'),
(10, 'Cilial', 'tentacles'),
(11, 'Polycephalic', 'heads'),
(12, 'Anthropomorphic', 'humanoid'),
(13, 'Lepidopterous', 'bug-wings'),
(14, 'Chitinous', 'armor');

-- --------------------------------------------------------

--
-- Estrutura da tabela `species`
--

CREATE TABLE `species` (
  `species_id` int(11) NOT NULL,
  `dex_num` int(11) NOT NULL,
  `type1_id` int(11) NOT NULL,
  `type2_id` int(11) DEFAULT NULL,
  `name` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT 'Unknown',
  `base_hp` int(11) NOT NULL,
  `base_atk` int(11) NOT NULL,
  `base_def` int(11) NOT NULL,
  `base_satk` int(11) NOT NULL,
  `base_sdef` int(11) NOT NULL,
  `base_spd` int(11) NOT NULL,
  `unique_trait` text COLLATE utf8_bin,
  `capture_rate` int(11) NOT NULL,
  `xp_drop` int(11) NOT NULL,
  `kind` varchar(255) COLLATE utf8_bin NOT NULL,
  `info` text COLLATE utf8_bin,
  `height` decimal(4,2) NOT NULL,
  `weight` float NOT NULL,
  `color_id` int(11) NOT NULL,
  `shape_id` int(11) NOT NULL,
  `egg_group1_id` int(11) NOT NULL,
  `egg_group2_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `trainer`
--

CREATE TABLE `trainer` (
  `trainer_id` int(11) NOT NULL,
  `region_id` int(11) NOT NULL,
  `trainer_code` int(11) NOT NULL,
  `name` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT 'Unknown',
  `player_name` varchar(80) COLLATE utf8_bin NOT NULL DEFAULT 'NPC',
  `level` int(11) NOT NULL DEFAULT '0',
  `age` int(11) NOT NULL DEFAULT '0',
  `gender` enum('n','m','f') COLLATE utf8_bin NOT NULL DEFAULT 'n',
  `height` decimal(4,2) NOT NULL DEFAULT '0.00',
  `weight` float NOT NULL DEFAULT '0',
  `stats` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '[6,6,6,6,6,6]',
  `date_started` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `trainer`
--

INSERT INTO `trainer` (`trainer_id`, `region_id`, `trainer_code`, `name`, `player_name`, `level`, `age`, `gender`, `height`, `weight`, `stats`, `date_started`) VALUES
(1, 9, 21240, 'Willheim von Hyazinthe', 'William J. Venancio', 12, 23, 'm', '1.82', 130, '[12,10,13,17,15,10]', '1932-02-22 09:58:36');

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
-- Indexes for table `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`color_id`);

--
-- Indexes for table `egg_group`
--
ALTER TABLE `egg_group`
  ADD PRIMARY KEY (`egg_group_id`);

--
-- Indexes for table `feature_cat`
--
ALTER TABLE `feature_cat`
  ADD PRIMARY KEY (`feature_cat_id`);

--
-- Indexes for table `nature`
--
ALTER TABLE `nature`
  ADD PRIMARY KEY (`nature_id`);

--
-- Indexes for table `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`region_id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `shape`
--
ALTER TABLE `shape`
  ADD PRIMARY KEY (`shape_id`);

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
-- AUTO_INCREMENT for table `color`
--
ALTER TABLE `color`
  MODIFY `color_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `egg_group`
--
ALTER TABLE `egg_group`
  MODIFY `egg_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `feature_cat`
--
ALTER TABLE `feature_cat`
  MODIFY `feature_cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `nature`
--
ALTER TABLE `nature`
  MODIFY `nature_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `region`
--
ALTER TABLE `region`
  MODIFY `region_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `shape`
--
ALTER TABLE `shape`
  MODIFY `shape_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `trainer`
--
ALTER TABLE `trainer`
  MODIFY `trainer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `type`
--
ALTER TABLE `type`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
