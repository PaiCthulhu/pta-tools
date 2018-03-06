-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 06-Mar-2018 às 12:48
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
-- Estrutura da tabela `contest_type`
--

CREATE TABLE `contest_type` (
  `contest_type_id` int(11) NOT NULL,
  `name` varchar(8) COLLATE utf8_bin NOT NULL,
  `flavor` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT 'Umami',
  `color` varchar(6) COLLATE utf8_bin NOT NULL,
  `effect` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `contest_type`
--

INSERT INTO `contest_type` (`contest_type_id`, `name`, `flavor`, `color`, `effect`) VALUES
(1, 'Cool', 'Spicy', 'F08030', '[\"+\",\"\",\"\",\"-\",\"-\"]'),
(2, 'Tough', 'Sour', 'F8D030', '[\"\",\"+\",\"-\",\"\",\"-\"]'),
(3, 'Beauty', 'Dry', '6890F0', '[\"\",\"-\",\"+\",\"-\",\"\"]'),
(4, 'Smart', 'Bitter', '78C850', '[\"-\",\"\",\"-\",\"+\",\"\"]'),
(5, 'Cute', 'Sweet', 'F85888', '[\"-\",\"-\",\"\",\"\",\"+\"]');

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
-- Estrutura da tabela `feature`
--

CREATE TABLE `feature` (
  `feature_id` int(11) NOT NULL,
  `feature_cat_id` int(11) NOT NULL,
  `name` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT 'Feature',
  `prerequisites` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '{}',
  `frequency` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT 'Static',
  `target` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `use_trigger` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `effect` text COLLATE utf8_bin NOT NULL,
  `action` enum('static','free','trainer','interrupt','extended') COLLATE utf8_bin NOT NULL DEFAULT 'static',
  `legal` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `feature`
--

INSERT INTO `feature` (`feature_id`, `feature_cat_id`, `name`, `prerequisites`, `frequency`, `target`, `use_trigger`, `effect`, `action`, `legal`) VALUES
(1, 2, 'Arms User', '{}', 'Static', NULL, NULL, 'Your Accuracy Check for Arms attacks is 6. Whenever you deal damage with an\r\nArms Feature, add the highest of your ATK or SPD modifiers to the damage dealt.\r\n- Whenever you use an Arms feature, you deal 1d10+4 damage.\r\n- If you are level 7 or higher, you deal 1d12+6 damage instead.\r\n- If you are level 15 or higher, you deal 2d8+6 damage instead.', 'trainer', 0),
(2, 2, 'Weapon of Choice', '{\'class\':2}', 'Static', NULL, NULL, 'Choose a specific weapon type such as ‘longsword’, ‘unarmed’, or ‘slingshot’. This is your “Weapon of Choice”. You may take Weapon of Choice multiple times, each time choosing a new weapon.\r\n- When using your Weapon of Choice, your Accuracy Check for Arms Features is 4\r\nand you deal 1d12+6 damage.\r\n- If you are level 7 or higher, you deal 2d10+8 damage instead.\r\n- If you are level 15 or higher, you deal 3d10+12 damage instead.', 'trainer', 0);

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
-- Estrutura da tabela `habitat`
--

CREATE TABLE `habitat` (
  `habitat_id` int(11) NOT NULL,
  `name` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT 'Unknown'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `habitat`
--

INSERT INTO `habitat` (`habitat_id`, `name`) VALUES
(1, 'Forest'),
(2, 'Grassland'),
(3, 'Rainforest'),
(4, 'Marsh'),
(5, 'Cave'),
(6, 'Mountain'),
(7, 'Beach'),
(8, 'Freshwater'),
(9, 'Ocean'),
(10, 'Taiga'),
(11, 'Tundra'),
(12, 'Urban'),
(13, 'Artic'),
(14, 'Desert'),
(15, 'Non Space'),
(16, 'Unknown'),
(17, 'Unknown'),
(18, 'Unknown'),
(19, 'Foreign Dimension'),
(20, 'Space');

-- --------------------------------------------------------

--
-- Estrutura da tabela `move`
--

CREATE TABLE `move` (
  `move_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `category` enum('physical','special','status') COLLATE utf8_bin NOT NULL DEFAULT 'status',
  `name` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT 'Move',
  `frequency` enum('atwill','eot','battle','center') COLLATE utf8_bin NOT NULL DEFAULT 'atwill',
  `damage_roll` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `accuracy` int(11) NOT NULL,
  `move_range` enum('self','melee','ranged') COLLATE utf8_bin NOT NULL,
  `reach` int(11) DEFAULT NULL COMMENT 'Ranged Attack''s Reach',
  `target` enum('no','one','two','area') COLLATE utf8_bin NOT NULL DEFAULT 'no',
  `keywords` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `effect` text COLLATE utf8_bin,
  `contest_type_id` int(11) NOT NULL,
  `performance` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `contest_effect_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `move`
--

INSERT INTO `move` (`move_id`, `type_id`, `category`, `name`, `frequency`, `damage_roll`, `accuracy`, `move_range`, `reach`, `target`, `keywords`, `effect`, `contest_type_id`, `performance`, `contest_effect_id`) VALUES
(1, 0, 'physical', 'Struggle', 'atwill', '1d10+4', 4, 'melee', NULL, 'one', NULL, 'Struggle Attack Modifying Capabilities\r\n\r\nFirestarter: The user’s struggle Attacks may be Fire-Typed if they wish. They may also add their Special Attack\r\ninstead of their Attack and have the attack deal Special Damage, if they wish. Multiple Fire-Type Moves grant\r\nFirestarter.\r\n\r\nFountain: The user’s struggle Attacks may be Water-Typed if they wish. They may also add their Special Attack\r\ninstead of their Attack and have the attack deal Special Damage, if they wish. Multiple Water-Type Moves grant\r\nFountain.\r\n\r\nFreezer: The user’s struggle Attacks may be Ice-Typed if they wish. They may also add their Special Attack instead\r\nof their Attack and have the attack deal Special Damage, if they wish. Multiple Ice-Type Moves grant Freezer.\r\n\r\nGuster: The user’s struggle Attacks may be Flying-Typed if they wish. They may also add their Special Attack\r\ninstead of their Attack and have the attack deal Special Damage, if they wish. Multiple Flying-Type Moves grant\r\nGuster.\r\n\r\nMaterializer: The user’s struggle Attacks may be Rock-Typed if they wish. They may also add their Special Attack\r\ninstead of their Attack and have the attack deal Special Damage, if they wish. Multiple Rock-Type Moves grant\r\nMaterializer.\r\n\r\nTelekinetic: Telekinetic Pokémon and Trainers can move objects with their mind. They can lift things with Telekinesis\r\nas if they were using a Power Capability equal to their Focus Rank. When lifting Staggering Weights with\r\nTelekinesis, they roll Focus instead of Athletics, and the DC is 10 instead of 4. They can target objects up to 8 meters\r\naway. Count the combined weight of all objects when determining whether they can lift all of them. Using this\r\nCapability to lift the user’s Drag Weight or greater leaves discoverable psychic residue. Additionally, the user may\r\nuse Struggle Attacks at a range of X, where X is the user’s Focus Rank. These Struggle Attacks deal Normal-Type\r\nDamage as usual, but the user may add their Special Attack instead of their Attack and have the attack deal Special\r\nDamage, if they wish. The user may perform the Disarm, Trip, and Push Maneuvers at the range of your Telekinetic\r\nCapability and using the Focus Skill for all opposed rolls. When the Push Maneuver is used this way, the user does\r\nnot repeat the Push but instead Pushes the target a number of meters equal to half their Focus Rank. If a Pokémon\r\nlearns the Move Psychic or Telekinesis and does not have the Telekinetic Capability, they gain Telekinetic.\r\n\r\nZapper: The user’s struggle Attacks may be Electric-Typed if they wish. They may also add their Special Attack\r\ninstead of their', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `nature`
--

CREATE TABLE `nature` (
  `nature_id` int(11) NOT NULL,
  `name` varchar(40) COLLATE utf8_bin NOT NULL,
  `raise` enum('hp','atk','def','satk','sdef','spd') COLLATE utf8_bin DEFAULT NULL,
  `lower` enum('hp','atk','def','satk','sdef','spd') COLLATE utf8_bin DEFAULT NULL,
  `liked_flavor_id` int(11) DEFAULT NULL,
  `disliked_flavor_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `nature`
--

INSERT INTO `nature` (`nature_id`, `name`, `raise`, `lower`, `liked_flavor_id`, `disliked_flavor_id`) VALUES
(1, 'Hardy', 'hp', 'atk', NULL, 1),
(2, 'Docile', 'hp', 'def', NULL, 2),
(3, 'Proud', 'hp', 'satk', NULL, 3),
(4, 'Quirky', 'hp', 'sdef', NULL, 4),
(5, 'Lazy', 'hp', 'spd', NULL, 5),
(6, 'Desperate', 'atk', 'hp', 1, NULL),
(7, 'Lonely', 'atk', 'def', 1, 2),
(8, 'Adamant', 'atk', 'satk', 1, 3),
(9, 'Naughty', 'atk', 'sdef', 1, 4),
(10, 'Brave', 'atk', 'spd', 1, 5),
(11, 'Stark', 'def', 'hp', 2, NULL),
(12, 'Bold', 'def', 'atk', 2, 1),
(13, 'Impish', 'def', 'satk', 2, 3),
(14, 'Lax', 'def', 'sdef', 2, 4),
(15, 'Relaxed', 'def', 'spd', 2, 5),
(16, 'Bashful', 'satk', 'hp', 3, NULL),
(17, 'Modest', 'satk', 'atk', 3, 1),
(18, 'Mild', 'satk', 'def', 3, 2),
(19, 'Rash', 'satk', 'sdef', 3, 4),
(20, 'Quiet', 'satk', 'spd', 3, 5),
(21, 'Sickly', 'sdef', 'hp', 4, NULL),
(22, 'Calm', 'sdef', 'atk', 4, 1),
(23, 'Gentle', 'sdef', 'def', 4, 2),
(24, 'Careful', 'sdef', 'satk', 4, 3),
(25, 'Sassy', 'sdef', 'spd', 4, 5),
(26, 'Serious', 'spd', 'hp', 5, NULL),
(27, 'Timid', 'spd', 'atk', 5, 1),
(28, 'Hasty', 'spd', 'def', 5, 2),
(29, 'Jolly', 'spd', 'satk', 5, 3),
(30, 'Naive', 'spd', 'sdef', 5, 4),
(31, 'Composed', NULL, NULL, NULL, NULL),
(32, 'Dull', NULL, NULL, NULL, NULL),
(33, 'Patient', NULL, NULL, NULL, NULL),
(34, 'Poised', NULL, NULL, NULL, NULL),
(35, 'Stoic', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pokemon_skill`
--

CREATE TABLE `pokemon_skill` (
  `pokemon_skill_id` int(11) NOT NULL,
  `name` varchar(20) COLLATE utf8_bin NOT NULL,
  `type` enum('base','speed','plant','psionic','ice','fire','water','earth','wind','electric','species','legendary') COLLATE utf8_bin NOT NULL DEFAULT 'base',
  `max_value` int(11) NOT NULL DEFAULT '0',
  `description` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `pokemon_skill`
--

INSERT INTO `pokemon_skill` (`pokemon_skill_id`, `name`, `type`, `max_value`, `description`) VALUES
(1, 'Overland', 'speed', 99, 'Overland is a Speed Skill that defines how quickly the Pokémon moves while on dry land. After the word Overland, in the Skills\r\nlisting, a number should be listed. The number paired with the Overland Keyword corresponds with a value representing how\r\nmany spaces/meters the Pokémon can Shift over normal terrain during a round of combat.'),
(2, 'Surface', 'speed', 99, 'Surface is a Speed Skill that defines how quickly the Pokémon moves while on the surface of water to the Pokémon’s height\r\nbelow the surface of the water. After the word Surface, in the Skills listing, a number should be listed. The number paired with\r\nthe Surface Keyword corresponds with a value representing how many spaces/meters the Pokémon can Shift during a round of\r\ncombat. If a Pokémon learns the Move Surf and does not have the Surface Skill, they gain Surface 4. If they already have the\r\nSurface Skill, the Surface value is raised 4. If the Pokémon had the Sinker Skill before learning Surf, they lose their Sinker Skill.'),
(3, 'Underwater', 'speed', 99, 'Underwater is a Speed Skill that defines how quickly the Pokémon can move underwater. After the word Underwater, in the\r\nSkills listing, a number from should be listed. The number paired with the Underwater Keyword corresponds with a value representing\r\nhow many spaces/meters the Pokémon can Shift during a round of combat underwater. If the Pokémon does not have\r\nthe Gilled Skill, they must surface at least once every 4 rounds no matter how high their Underwater Skill’s value is. If a Pokémon\r\nlearns the Move Dive and does not have the Underwater Skill, they gain Underwater 3. If they already have the Underwater\r\nSkill, the Underwater value is raised 3.'),
(4, 'Sky', 'speed', 99, 'Sky is a Speed Skill that defines how quickly the Pokémon moves while flying, floating or levitating. After the word Sky, in the\r\nSkills listing, a number should be listed. The number paired with the Sky Keyword corresponds with a value representing how\r\nmany spaces/meters the Pokémon can Shift during a round of combat in the air. If a Pokémon has the keyword Sky, it can propel\r\nitself of the ground for at least 5 minutes off the ground at a time. If a Pokémon learns the Move Fly and does not have the\r\nSky Skill, they gain Sky 4. If they already have the Sky Skill, the Sky value is raised 4.'),
(5, 'Burrow', 'speed', 99, 'Burrow is a Speed Skill that defines how quickly the Pokémon can move underground. After the word Burrow, in the Pokémon\'s\r\nSkills listing, a number should be listed. The number paired with the Burrow Keyword corresponds with a value representing\r\nhow many spaces/meters the Pokémon can Shift during a round of combat underground. The holes dug are only as large as the\r\nPokémon who burrows. While Burrowing the Pokémon has knowledge of its underground surroundings up to X meters away,\r\nwhere X is its Burrow value. If a Pokémon learns the Move Dig and does not have the Burrow Skill, they gain Burrow 3. If they\r\nalready have the Burrow Skill, the Burrow value is raised 3.'),
(6, 'Jump', 'base', 10, 'The Jump Skill is paired with a number from 1 to 10 that states the max height the Pokémon can jump into the air in a single\r\nbound. If your Pokémon utilizes their Jump Skill during a round of an encounter, it counts as their Shift for that round. Keep in\r\nmind you don’t have to jump straight upwards. If a Pokémon learns the Move Bounce their Jump value is raised 1.'),
(7, 'Power', 'base', 10, 'Power represents a Pokémon’s strength. Next to Power in the Pokémon’s Skill listing is a number from 1 to 10 that corresponds\r\nto a weight that the Pokémon should be able to lift. The weight given is an average, depending on how well trained your\r\nPokémon is, they may be able to lift slightly more then the average. Based on how much they can lift you should be able to\r\nguess at how much they can push, or how much force they can put into their strikes. If a Pokémon learns the Move Strength\r\ntheir Power value is raised 1. If you appropriately feed and often train your Pokémon\'s strength your GM may allow you to raise\r\nyour Pokémon\'s Power Skill.'),
(8, 'Intelligence', 'base', 7, 'The Intelligence Skill is paired with a number from 1 to 7 that defines the Pokémon’s competence when it comes to simple\r\nthought. The Intelligence is an average expectancy of all members of that Pokémon’s species. The smarter the Pokémon is, the\r\neasier it is to act on their own accord if you can’t command them. This also means that the Species of Pokémon is more\r\ncompetent in the wild and a greater threat to the average Trainer.'),
(9, 'Alluring', 'plant', 0, 'Pokémon who are Alluring smell very pleasant. They may attract wild Pokémon easily. Attention is commonly turned toward\r\nfragrant, Alluring Pokémon by wilds. If a Pokémon learns the Move Sweet Scent and does not have the Alluring Skill, they gain\r\nAlluring.'),
(10, 'Amorphous', 'base', 0, 'Amorphous Pokémon have an inconsistent shape. They can flatten and reform themselves like water. They can stretch out their\r\nbody material and condense themselves as well. By doing this, a Pokémon can access places others couldn’t, or bypass a door\r\nor two, only to let their non-Amorphous friends in afterwards.'),
(11, 'Aura', 'psionic', 0, 'Pokémon who can use Aura are blessed with a great power. Pokémon who can use Aura can project their thoughts to Pokémon\r\nand Humans. Pokémon with the Aura Skill can also read a person’s Aura, but cannot read a person’s thoughts. Everything has an\r\nAura, but not many can access their Aura. Auras can be any color. The shade of the color varies from very tinted to very\r\ndarkened. If the color of the Aura is tinted, the target has little negative intentions. If the color of the Aura is very blackened, the\r\ntarget has many malicious intentions. An Aura’s shade can be anywhere in between and most are pretty neutral. If a Pokémon\r\nlearns the Move Aura Sphere, Dragon Pulse, Dark Pulse, Focus Blast, Force Palm, Heal Pulse, Detect or Vacuum Wave and does\r\nnot have the Aura Skill, they gain Aura.'),
(12, 'Blender', 'base', 0, 'A Pokémon with Blender is an advanced Stealth user. While Shifting, unless they purposely want to, Blender Pokémon do not\r\nmake any noise. Unless a Pokémon with Blender has used a Ranged Move during the current round or the round previous,\r\nRanged Moves may not target them if the line of sight drawn goes through Rough Terrain or if the Pokémon is on Rough\r\nTerrain. Whenever a Blender is targeted by a Move, one must roll +2 during Accuracy Check to hit.'),
(13, 'Bloom', 'species', 0, 'When a Pokémon with Bloom, Cherrim, is in Sunny weather it transforms; changing its appearance from the closed bud, purplepetal\r\nform into the pink open flower form.'),
(14, 'Chilled', 'ice', 0, 'A Pokémon with the Chilled Skill is always cold when touched.'),
(15, 'Climber', 'base', 0, 'A Pokémon with the Climber skill treats vertical terrain as normal non-hindering terrain while using their Overland Skill, unless it\r\nis specifically a smooth vertical surface.'),
(16, 'Dream Smoke', 'base', 0, 'A Pokémon who has the Dream Smoke Skill can produce Dream Smoke. Dream Smoke is harvested for Dream Doctor who can\r\nmanipulate a Pokémon’s mind with the use of Dream Smoke and machinery. If a Pokémon learns the Move Dream Eater and\r\ndoes not have the Dream Smoke Skill, they gain Dream Smoke.'),
(17, 'Egg Warmer', 'fire', 0, 'A Pokémon with Egg Warmer can keep an egg safely warmer than the average human. Eggs tend to hatch 2 hours per day faster\r\nthan average per species when watched over by a Pokémon with this Skill.'),
(18, 'Family Ties', 'species', 0, 'A Pokémon with family ties can naturally make eggs that are from another species as detailed below.\r\nPokémon mother: Can hatch:\r\nNidoran F, Nidorina or Nidoqueen: Nidoran F or Nidoran M\r\nJynx: Smoochum or Mime Jr.\r\nMiltank: Miltank or Tauros\r\nPlusle or Minun: Plusle or Minun\r\nIllumise: Illumise or Volbeat\r\nLunatone or Solrock: Lunatone or Solrock'),
(19, 'Firestarter', 'fire', 0, 'A Pokémon who has the Firestarter Skill can produce flames. They can control how lightly or powerfully they produce the fire,\r\ncreates puffs of fire the size of a lighter or a large burst of fire capable on engulfing a tree. If a Pokémon learns the Move\r\nEmber, Fire Blast, Fire Spin, Flame Wheel or Flamethrower and does not have the Firestarter Skill, they gain Firestarter.'),
(20, 'Fountain', 'water', 0, 'A Pokémon who has the Fountain Skill can produce freshwater. They can control how lightly or powerfully they produce the\r\nwater, sprinkling water or forcefully shooting water with the strength of a fire hose. If a Pokémon learns the Move Water Gun,\r\nWater Pulse, Hydro Pump or Water Sport and does not have the Fountain Skill, they gain Fountain.'),
(21, 'Fragile', 'species', 0, 'Archen and Archeops’ default Ability is always Defeatist.'),
(22, 'Freezer', 'ice', 0, 'When a Pokémon has the Freezer Skill, they can target an area on the ground and turn it into Icy Terrain in place of their Move\r\nduring their turn, EOT. A 1d20 roll determines the amount of ground turned into Icy Terrain. On a check below 5, only 1 square\r\nmeter, or 1 space, is changed into Icy Terrain; on 6, up to 5 meters, 5 adjacent spaces; on 9, up to 7 square meters, 7 adjacent\r\nspaces; on up to 10 square meters, 10 adjacent spaces; on up to 15 square meters, 15 adjacent spaces; on up to 20 square\r\nmeters, 20 adjacent spaces; on up to 30 square meters, 30 adjacent spaces. If a Pokémon learns the Move Aurora Beam,\r\nBlizzard, Ice Beam or Sheer Cold, and does not have the Freezer Skill, they gain Freezer.'),
(23, 'Gilled', 'water', 0, 'A Gilled Pokémon can breath underwater. It never needs to come up for air, remaining underwater for as long as it wants to.'),
(24, 'Glow', 'base', 0, 'A Pokémon with the Glow Skill can emit light from a part of its body. Depending on the variety of wild Pokémon nearby, it\r\nmight attract Pokémon or ward them away. If a Pokémon learns the Move Flash or Tail Glow and does not have the Glow Skill,\r\nthey gain Glow.'),
(25, 'Groundshaper', 'earth', 0, 'A Pokémon with the Groundshaper Skill can transform the terrain around them to create Rough Terrain or flatten out Rough\r\nTerrain to create Basic Terrain. In place of the Pokémon’s Move during their turn they can change a 1 meter radius around\r\nthem, or all adjacent spaces, from Basic Earth Terrain into Rough Terrain or change Rough Terrain into Basic Earth Terrain, EOT.\r\nIf a Pokémon learns the Move Earthquake or Magnitude and does not have the Groundshaper Skill, they gain Groundshaper.'),
(26, 'Guster', 'wind', 0, 'The Guster can create bursts of wind. The power can vary from a light breeze to a powerful burst of air capable of lifting light\r\nobjects into the air or providing lift for a chute. If a Pokémon learns the Move Gust or Tailwind and does not have the Guster\r\nSkill, they gain Guster.'),
(27, 'Heater', 'fire', 0, 'A Pokémon with the Heater Skill is always warm when touched.'),
(28, 'Husk', 'species', 0, 'Minior’s default Ability is always Shields Down.'),
(29, 'Icestep', 'ice', 0, 'Pokémon with the Icestep Skill treat Icy or Snowy terrain as Basic Terrain.'),
(30, 'Inflatable', 'base', 0, 'A Pokémon with the Skill Inflatable can expand its size up to 125% of its normal size. While Inflated, a Pokémon does not\r\nchange its weight. To hit an Inflated Pokémon, you must roll -3 during Accuracy Check. While Inflated, a Pokémon become\r\nBlocking Terrain, you may not target through an Inflated Pokémon. If a Pokémon learns the Move Growth or Stockpile and does\r\nnot have the Inflatable Skill, they gain Inflatable.'),
(31, 'Invisibility', 'psionic', 0, 'Pokémon who have the Invisibility Skill can turn invisible. Pokémon may not perform Moves while invisible. While invisible, you\r\nmust roll +4 during Accuracy Checks to hit the Pokémon. When a Pokémon turns invisible, they can only remain invisible for up\r\nto 4 minutes. After becoming visible, they must wait two plus the number of minutes they spent invisible before turning\r\ninvisible again.'),
(32, 'Juicer', 'species', 0, 'When Shuckle is holding a berry, after 24 hours of that Berry going unused, it will be juiced and stored in the Shuckle’s shell.\r\nThe Berry Juice is a held item that can be taken from the shuckle and given to another Pokémon. It will have all of the properties\r\nof the berry it was made from, except that any HP or PP recovery total will be doubled. If the Berry Juice item is left in the\r\nShuckle’s shell unused for two weeks, the Berry Juice will be condensed into a Rare Candy.'),
(33, 'Magnetic', 'electric', 0, 'Magnetic Pokémon can lightly manipulate magnetic fields. With this, they can repel iron and/or steel or attract iron and/or\r\nsteel, holding it too their body or pushing it away. Through this magnetic manipulation, they can also feel magnetic fields and\r\ndiscern north. If a Pokémon learns the Move Magnet Rise or Magnet Bomb and does not have the Magnetic Skill, they gain\r\nMagnetic.'),
(34, 'Materializer', 'earth', 0, 'The Materializer can form rock, normal sedimentary rock, from nothing. It can be anywhere from the size of a pebble to the\r\nsize of a person sized boulder. For every 2.5 grams, or 5 pounds, of rock formed the Pokémon loses 2 HP. The Rock is formed\r\nadjacent to the Pokémon and a Pokémon can only add up to 25 grams, or 50 pounds, of rock over 1 round in place of a Move\r\nduring their turn during an encounter. If a Pokémon learns the Move Rock Wrecker and does not have the Materializer Skill,\r\nthey gain Materializer.'),
(35, 'Mind Lock', 'psionic', 0, 'Pokémon who have the Skill Mind Lock cannot have their minds read.'),
(36, 'Pack Mon', 'species', 0, 'A Pokémon with Pack Mon instinctively belong to a rigid pack structure, and are naturally inclined to the top of that structure.\r\nWild Pokémon that are of this Pokémon’s unevolved form will instantly be considered “Helpful” to you and your group and will\r\ndo tasks for the party within their power. When applied to Pokémon who do not evolve, wild Pokémon of the same species as\r\nyour Pack Leader of at least 10 levels lower will fall under this Skill. Helpful Pokémon cannot be ordered to attack without\r\nreason, and if capture is attempted it will fail and the Pokémon will run away. However if your Pack Leader encroaches on the\r\nterritory of a Pokémon of the same species within 10 levels of your Pack Leader, that wild Pokémon could become hostile and\r\nattack. If the Wild Pack Leader is at least ten levels higher than your Pokémon, it will expect your Pokémon to obey it, and may\r\nattack if it does not.'),
(37, 'Phasing', 'base', 0, 'A Pokémon with Phasing may Shift through Hindering or Blocking Terrain without their Speed Skills being affected. They can\r\nturn intangible and move through solid walls or other Pokémon. A Pokémon can remain intangible with Phasing for up to 30\r\nseconds. If a Pokémon remains intangible, they may not perform Moves during their turn.'),
(38, 'Reach', 'base', 0, 'A Pokémon with Reach may make Melee attacks from up to 5 meters, or 5 spaces, away from the Pokémon. Pokémon with\r\nreach are either really large or have a stretchy limb with which they can strike foes from a distance.'),
(39, 'Schooling', 'species', 0, 'Wishiwashi’s default Ability is always Schooling.'),
(40, 'Shrinkable', 'base', 0, 'A Pokémon with the Skill Shrinkable can shrink its size up to 25% of its normal size. While Shrunken, a Pokémon may not perform\r\nany Moves. While Shrunken, a Pokémon does not change its weight. To hit a Shrunken Pokémon, you must roll +3 during\r\nAccuracy Check. Using Shrinkable is not the same as using the Move Minimize. If a Pokémon learns the Move Minimize and\r\ndoes not have the Shrinkable Skill, they gain Shrinkable.'),
(41, 'Sinker', 'base', 0, 'Sinker means the Pokémon cannot swim, or move in water. For every round of an encounter the Pokémon is in water that is\r\ndeep enough for them to stand submerged in, or is submerged in they lose 25% of their max HP. If the Pokémon is lowered to\r\n-100% HP for more than 10 rounds of combat, make a Deaths savings roll as usual. If a Pokémon gains a Surface or Underwater\r\nSkill, they lose their Sinker Skill.'),
(42, 'Soulless', 'species', 0, 'Shedinja is a unique Pokémon. Its default Ability will always be Wonder Guard and Shedinja’s Max HP is always 1. You may not\r\nadd to a Shedinja’s HP stat, and Shedinja may not have temporary HP. However, Shedinja never need to make a Death Saving’s\r\nThrow. Shedinja may not ever also have the Ability Solid Rock. Shedinja may not be targeted by Press On!'),
(43, 'Sprouter', 'plant', 0, 'A Pokémon with the Sprouter Skill can rapidly influence the growth of plants and flora around them. Over 5 seconds, a\r\nSprouter can grow a plant 1 meter taller or wider than it currently was. Through the use of Sprouter, the Pokémon can also\r\nmake plants grow up to 125% of the normal size they would become naturally. For a Pokémon to use their Sprouter ability for\r\n10 seconds, they must sacrifice 1 HP, in place of a Move. If a Pokémon learns the Move Ingrain, Natural Gift, Nature Power,\r\nSecret Power or Synthesis and does not have the Sprouter Skill, they gain Sprouter.'),
(44, 'Stance', 'species', 0, 'Aegislash’s default Ability is always Stance Change.'),
(45, 'Stealth', 'base', 0, 'A Pokémon with the Stealth Skill are excellent at approaching the enemy for an up close assault. While Shifting, unless they\r\npurposely want to, Stealth Pokémon do not make any noise. Unless a Pokémon with Stealth has used a Ranged Move during\r\nthe current round or the round previous, Ranged Moves may not target them if the line of sight drawn goes through Rough\r\nTerrain or if the Pokémon is on Rough Terrain.'),
(46, 'Stick Climber', 'base', 0, 'A Pokémon with the Sticky Climber skill treats vertical terrain as normal non-hindering terrain while using their Overland Skill,\r\nand can even move on ceiling surface as normal non-hindering terrain.'),
(47, 'Telekinetic', 'psionic', 0, 'Telekinetic Pokémon can move objects with their mind. They can lift things that are lighter then their level multiplied by 5\r\npounds or 2.5 grams. They can target objects up to X meters away, where X is the Pokémon’s level. If a Pokémon learns the\r\nMove Psychic or Telekinesis and does not have the Telekinetic Skill, they gain Telekinetic.'),
(48, 'Telepath', 'psionic', 0, 'A Telepathic Pokémon can read the minds of people and other Pokémon. Telepathic Pokémon can project their thoughts to\r\nhumans and Pokémon. The Pokémon can only read surface thoughts. The Pokémon cannot read the minds of another\r\nPokémon whose Intelligence is two ranks below or two ranks higher than their own.'),
(49, 'Threaded', 'base', 0, 'If a Pokémon has the Threaded Skill they may replace their turn’s Shift with a Threaded Shift. A Threaded Shift is when a\r\nPokémon targets an object and shoots a strong, thin line of silk, or extends a vine from themselves, and then quickly retracts\r\nthat silk, or vine, pulling itself towards the object if the Pokémon is lighter than the object or pulling the object towards the\r\nPokémon if it is lighter then it is. The line of silk, or vine, may be up to 10 meters long. If you target another Pokémon or\r\nperson with a Threaded Shift, the Accuracy Check is 6. You may still use a Move on the same turn you perform a Threaded\r\nShift. If a Pokémon learns the Move Electro Web, Spider Web, String Shot, Vine Whip or Power Whip and does not have the\r\nThreaded Skill, they gain Threaded.'),
(50, 'Tracker', 'base', 0, 'Pokémon with the Skill Tracker have a strong sense of smell that they can use to follow other Pokémon or people. If the\r\nPokémon has smelt whom they want to track in the past day, or one of their personal belongings, they can pursue that prey\r\nwith a check of 11 or better on d20. To pick up a random scent from nothing, a check of 16 or better on d20 will allow the\r\nPokémon to follow that scent. To pick up a specific scent from nothing, a check of 20 on d20 will allow the Pokémon to follow\r\nthat scent. A Pokémon may only make these checks once per hour. If a Pokémon learns the Move Odor Sleuth and does not\r\nhave the Tracker Skill, they gain Tracker.'),
(51, 'Troublesome', 'species', 0, 'Slakoth and Slaking’s default Ability is always Truant.'),
(52, 'Weathershape', 'species', 0, 'Castform’s appearance changes with the weather around it. It changes to its orange form in Sunny weather, its blue and grey\r\nform in Raining weather and its light blue form when it’s Hailing.'),
(53, 'Weeble', 'species', 0, 'Wobbufett are very limited when it comes to their Move variety. As a result, Wobbufett can use Counter and Mirror Coat as\r\nEOT Frequency Moves rather than as Battle Frequency Moves. However, after the first use of Mirror Coat or Counter during an\r\nencounter, meaning on the second use of Mirror Coat or the second use of Counter and from that point on during the\r\nencounter, Wobbufett’s Defense and Special Defense are treated as if they are ten less (-10). This penalty is only active while\r\ncalculating damage while using Mirror Coat and Counter after the first use per Encounter. If a PP Up is used on a Wobbufett’s\r\nCounter or Mirror Coat, Weeble is not needed for that Move anymore.'),
(54, 'Wimp', 'species', 0, 'Wimpod’s default Ability is always Wimp Out.'),
(55, 'Wired', 'electric', 0, 'Wired Pokémon have a special relation to electronic devices. They can enter machines and travel through connected\r\nelectronics through any cords that connect them instantly. While inside machines, they can read data on the machine on a\r\ncheck of Daily. While inside machines, they can take control of the machine on a check of 16 on d20 once per hour.'),
(56, 'Wormadam’s Coat', 'species', 0, 'When a female Burmy evolves, it gains either the type Grass, Ground or Steel. Its new type, in addition to the Moves it will\r\nhave access to, are based on the Burmy’s surrounding at the time of evolution. If surrounded by natural greenery, it’d be likely\r\nto gain Grass type; by sandy or rocky terrain, Ground type; if by industrial or urban surroundings, Steel type.'),
(57, 'Zapper', 'electric', 0, 'Pokémon with the Zapper Skill can produce controlled electricity or send electrical currents through various conductive\r\nmaterials. If an electrical device is capable of being recharged, a Pokémon with Zapper can recharge it to full power on a check\r\nof 13 or better on 1d20 Daily. If a Pokémon learns the Move Charge, Discharge, Thunderbolt or Thundershock and does not\r\nhave the Zapper Skill, they gain Zapper.'),
(65, 'All for One', 'legendary', 0, 'The Swords of Justice work together very naturally. When within 10 spaces, or 10m, of another Pokémon\r\nwith All for One, this Pokémon rolls an additional d20 per other Pokémon with all for One.'),
(66, 'Avatar', 'legendary', 0, 'Some legendary Pokémon can change their form into a human like body that retains their power but\r\nwould fool anyone who does not know of the Pokémon’s disguise. In this human form, they may retain\r\nall Skills, Abilities and Moves.'),
(67, 'Extinguisher', 'legendary', 0, 'The Extinguisher can calm an erupting volcano by making a check of 20 or higher on 2d20 every hour.\r\nOnce calmed, the Extinguisher can settle it, so as to not let it erupt for at least 1d4 years, or the\r\nExtinguisher can release a dormant volcano with the same roll, letting it erupt again.'),
(68, 'Force of Life', 'legendary', 0, 'Pokémon with Force of Life can give and take life from other beings, rapidly, at a massive scale. They are\r\nnot compelled to do so, but when they choose to, all form of life within line of sight to the Pokémon with\r\nForce of Life lose or gain 15% of their max HP per round.'),
(69, 'Impenetrable', 'legendary', 0, 'A Pokémon with Impenetrable has an unbreakable barrier around their skin. It subtracts an additional 40\r\ndamage from all Moves that hit them. Impenetrable can’t be altered further to have even more\r\nresistance to harm, or less.'),
(70, 'Mindslaver', 'legendary', 0, 'Mewtwo can have complete control of up to 10 Pokémon or Trainers at any given time. Those who\r\nMewtwo controls have the title Mindslave. Once per day; a role of 39 or better, adding any one Modifier,\r\non 2d20 will free a Mindslave. In order to give a target the Mindslave title, Mewtwo must make a Melee\r\nattack in place of a Move and roll 9 or better on 1d20. Mindslaves can be controlled from any distance\r\nfrom Mewtwo once they are Mindslaves. Mewtwo can experience everything a Mindslave does no\r\nmatter how far away the Mindslave is from Mewtwo.'),
(71, 'Multiform', 'legendary', 0, 'Multiform Pokémon may change between their forms at will. Prepare stats for any forms if you intend to\r\nuse a Multiform Pokémon.'),
(72, 'Power of the Land', 'legendary', 0, 'The Tapu are instinctive beings that are in tune with the space around them. As long as they are fighting\r\nwithin the land they protect, attackers must first roll a 16 on 1d20 before targeting the Tapu with a\r\nMove, Skill, or Feature.'),
(73, 'Realm Ruler', 'legendary', 0, 'Realm Rulers own their own space in reality where they rule as a divine being. It is a separate realm of\r\nexistence that is incredibly difficult to reach. Arceus is the ruler of the Realm of Creation. Dialga is the\r\nruler of the Realm of Time. Giratina is the ruler of the Reverse World. Palkia is the ruler of the Realm of\r\nSpace. It is possible for very powerful Legendaries to have other realms as well.'),
(74, 'Space Bender', 'legendary', 0, 'Pokémon with Space Bender can move objects that they have knowledge of from any point to any point\r\nwithin line of sight. They can do this to unwilling targets on a check of 16 on 1d20.'),
(75, 'Tide Caller', 'legendary', 0, 'The Tide Caller can calm an active tsunami or tidal wave by making a check of 20 or higher on 2d20 every\r\nhour. Once calmed, the Tide Caller can settle the ocean, or the Tide Caller can raise another tidal wave or\r\ntsunami with the same roll again.'),
(76, 'Time Traveler', 'legendary', 0, 'A Time Traveler can go back and forth through time. Usually, Time Travelers will need an anchor point to\r\nreturn to, when leaving a particular moment in Time that could be considered their ‘real place in time.’ A\r\nTime Traveler can also stop time for anyone other then themselves, EOT, for up to 1d4 minutes.'),
(77, 'Ultra Beast', 'legendary', 0, 'Ultra Beasts are Pokémon from another dimension. Not in the sense of a parallel universe like the\r\nReverse World, or a world where Ash Ketchum from Pallet Town has won first place in a regional\r\nchampionship, but in the sense that there is a completely different universe where rules and physics do\r\nnot exist in the same way they do in the Pokémon world, yet Poké Balls can still potentially affect Ultra\r\nBeasts. If an Ultra Beast is encountered, a dangerous hole into that world must have opened. Ultra\r\nBeasts always begin an encounter with each stat raised 2 Combat Stages.'),
(78, 'Wish Granter', 'legendary', 0, 'Jirachi has three tags on its body, which will grant any wish that is written on them. Only one wish will be\r\ngranted per tag. A wish on a tag will remain on the tag for 1d100 + 50 years, at which point the written\r\nwish will fade. If the wish alters reality in any way, it is possible that the wish will have very bad repercussions\r\nand on rare occasions it is possible the wish will not be granted.');

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
  `gender_ratio` enum('genderless','alwaysmale','femaleoneeighth','female25','female50','female75','femaleseveneighths','alwaysfemale') COLLATE utf8_bin NOT NULL DEFAULT 'genderless',
  `hatch_rate` int(11) DEFAULT NULL,
  `diet1` enum('nullivore','phototroph','herbivore','carnivore','omnivore','terravore','ergovore') COLLATE utf8_bin NOT NULL DEFAULT 'nullivore',
  `diet2` enum('nullivore','phototroph','herbivore','carnivore','omnivore','terravore','ergovore') COLLATE utf8_bin DEFAULT NULL,
  `color_id` int(11) NOT NULL,
  `shape_id` int(11) NOT NULL,
  `egg_group1_id` int(11) NOT NULL,
  `egg_group2_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `species`
--

INSERT INTO `species` (`species_id`, `dex_num`, `type1_id`, `type2_id`, `name`, `base_hp`, `base_atk`, `base_def`, `base_satk`, `base_sdef`, `base_spd`, `unique_trait`, `capture_rate`, `xp_drop`, `kind`, `info`, `height`, `weight`, `gender_ratio`, `hatch_rate`, `diet1`, `diet2`, `color_id`, `shape_id`, `egg_group1_id`, `egg_group2_id`) VALUES
(1, 1, 12, 4, 'Bulbasaur', 5, 5, 5, 7, 7, 5, NULL, 20, 15, 'Seed', 'Bulbasaur can be seen napping in bright sunlight. There is a seed on its back. By soaking up the sun\'s rays, the seed grows progressively larger.', '0.70', 6.9, 'femaleoneeighth', 10, 'herbivore', 'phototroph', 4, 8, 1, 9);

-- --------------------------------------------------------

--
-- Estrutura da tabela `species_habitat`
--

CREATE TABLE `species_habitat` (
  `species_id` int(11) NOT NULL,
  `habitat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `species_habitat`
--

INSERT INTO `species_habitat` (`species_id`, `habitat_id`) VALUES
(1, 1),
(1, 2),
(1, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `species_move`
--

CREATE TABLE `species_move` (
  `species_id` int(11) NOT NULL,
  `move_id` int(11) NOT NULL,
  `type` enum('level','egg','tutor') COLLATE utf8_bin NOT NULL DEFAULT 'level',
  `level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `species_skill`
--

CREATE TABLE `species_skill` (
  `species_id` int(11) NOT NULL,
  `pokemon_skill_id` int(11) NOT NULL,
  `value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `species_skill`
--

INSERT INTO `species_skill` (`species_id`, `pokemon_skill_id`, `value`) VALUES
(1, 1, 7),
(1, 2, 2),
(1, 6, 2),
(1, 7, 1),
(1, 8, 3),
(1, 43, 0);

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
-- Estrutura da tabela `trainer_skill`
--

CREATE TABLE `trainer_skill` (
  `trainer_skill_id` int(11) NOT NULL,
  `name` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT 'Unknown',
  `stat` enum('base','hp','atk','def','satk','sdef','spd') COLLATE utf8_bin NOT NULL DEFAULT 'base',
  `max_value` int(11) NOT NULL,
  `description` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `trainer_skill`
--

INSERT INTO `trainer_skill` (`trainer_skill_id`, `name`, `stat`, `max_value`, `description`) VALUES
(1, 'Overland', 'base', 99, 'Overland defines how quickly the Trainer moves while on dry land. After the word Overland, in the Skills\r\nlisting, a number should be listed. The number paired with the Overland Keyword corresponds with a value representing how\r\nmany spaces/meters the Trainer can Shift over normal terrain during a round of combat.\r\nAll Trainers have a base Overland skill of 5. If 3 + (1/2 your SPD or ATK modifier) is greater than 5, you may use that instead.'),
(2, 'Surface', 'base', 99, 'Surface defines how quickly the Trainer moves while on the surface of water to the Trainer’s height\r\nbelow the surface of the water. After the word Surface, in the Skills listing, a number should be listed. The number paired with\r\nthe Surface Keyword corresponds with a value representing how many spaces/meters the Trainer can Shift during a round of\r\ncombat.\r\nA Trainer starts with a base Surface Skill of 4. If 2 + (1/2 your Defense modifier) is greater than 4, you may use that instead.'),
(3, 'Underwater', 'base', 99, 'Underwater defines how quickly the Trainer can move underwater. After the word Underwater, in the\r\nSkills listing, a number from should be listed. The number paired with the Underwater Keyword corresponds with a value representing\r\nhow many spaces/meters the Trainer can Shift during a round of combat underwater. If the Trainer does not have\r\nthe Breathless Skill, they must surface at least once every 4 rounds no matter how high their Underwater Skill’s value is.\r\nTrainers have a base Underwater Skill of 3. If you have at least 3 for your Attack or Defense modifier, your Underwater Skill is 4.'),
(4, 'Breathless', 'hp', 0, 'You can hold your breath for up to five minutes.'),
(5, 'Fasting', 'hp', 0, 'Fasting has to do with how long you can hold out for food and water. While most Trainers can go for four days without water and two weeks without food, you can withstand a week without water and a month without food.'),
(6, 'Endurance', 'hp', 0, 'The Endurance Skill has to do with your ability to withstand exhausting situations. You do not tire and risk losing HP after even hours of swimming, running, or laboring.'),
(7, 'Resistant', 'hp', 0, 'If you are resistant, you take 3/4ths of the damage you would usually take from Poisoning and Burns. In addition to that, when rolling for Confusion, Freezing, Paralysis, or Sleep, you get +2 to your roll.'),
(8, 'Browbeat', 'atk', 2, 'Sometimes you need something your way and you don’t want to be nice about it. Browbeat is rolled against other Trainers or Pokémon. For this reason, you’ll always be rolling against a GM controlled NPC which means that you don’t know how high you must roll, but as always will want to roll high.'),
(9, 'Jump', 'atk', 2, 'Leaping higher and further is easier with Jump. While most Trainer are capable of a vertical jump at least 2 ft. (.6m) high. Some Trainers may want to make a check to surpass the standard or a GM might want to make sure you all clear the gap between buildings?\r\n1—You trip and fall prone.\r\n5—You jump a normal height 2 ft. (.6m), or leap forward a normal distance of 5 ft. (1.5m)\r\n10– You jump higher, 4 ft. (1.2m), or leap forward 10 ft. (3m)\r\n15– You jump higher, 5 ft. (1.5m), or leap forward 12 ft. (3.6m)\r\n20– You leap upwards 8ft. (2.4m), or leap forward 20 ft. (6m)\r\n30—Adrenaline pumping, you leap upwards 10 ft. (3m), or leap forward 30 ft. (9m)'),
(10, 'Sprint', 'atk', 2, 'You are likely to be able to catch up or escape by Sprinting. A Sprint attempt is usually initiated by a Trainer wanting to push themselves a little further. A GM may ask you to make a Sprint check if your party has been running quite far in a short time.\r\n1 – You trip and fall prone.\r\n5 – You strain yourself and Shift at a -1 Shift this turn.\r\n10 – You Shift as normal.\r\n15 – You book it, Shifting at +2 this turn.\r\n20 – You’re making great time, Shifting at +4 this turn.\r\n30 – You’re a speed demon, gaining an Overland Skill for x4 distance this turn.'),
(11, 'Strength', 'atk', 2, 'Regardless of your Attack Stat, proper form is needed to really use the muscle you may build. Strength will help you properly use your Attack to lift or move heavy objects. On average, a 140 lbs. (62kg) Train-er can easily lift 80 pounds (36kg). This can be different for each trainer, but know that the higher your Attack, the heavier you can lift/push/pull. You may attempt a Skill check on your own, or a GM may initi-ate it.\r\n1—You tense up and strain yourself, Flinching.\r\n5—You use your Strength as normal.\r\n10—You lift up to 150 lbs. (68kg), push 135 lbs. (61kg)\r\n15—You dig in and can lift up to 250 lbs. (113kg), push 225 lbs. (102kg)\r\n20—Through tremendous effort you raise 350 lbs. (158kg), push 315 lbs. (142kg)\r\n30—Adrenaline pumping, you lift 800 lbs.. (362 kg), push 720 lbs. (326kg)'),
(12, 'Concentration', 'def', 2, 'If you need focus to perform a task, Concentration will help get you through the task without losing focus even while being struck or Psychically attacked. When taking damage, the GM may ask you to make a Concentration check if they feel the task/Feature you are performing is particularly difficult.\r\n1—The lightest tap disrupts your focus.\r\n5—You can take up to 10 damage without losing focus.\r\n10—You can take up to 20 damage without losing focus.\r\n15—You can take up to 50 damage without losing focus.\r\n20—You can take up to 150 damage without losing your focus.\r\n30 — No amount of damage will disrupt your focus.'),
(13, 'Deflection', 'def', 2, 'Trying to intercept an object or push it away midflight is easier with this Skill. This may not be made against Pokémon Moves, but can be used against other Trainers who might be using a Feature, includ-ing an Arms Feature. Deflection is rolled against other Trainers or Pokémon. For this reason, you’ll al-ways be rolling against a GM controlled NPC which means that you don’t know how high you must roll, but as always will want to roll high.'),
(14, 'Healing', 'def', 2, 'Trainers with Healing are more likely to recover a greater deal of HP after an extended rest. Usually, an eight hour rest will recover 10% of your Max HP. This is normal and unless you are constantly wok-en up, your GM shouldn\'t force this check. However, you may make this check when you wake up.\r\n1—You don’t recover anything.\r\n5—You recover a normal 10% of your Max HP.\r\n10—You recover 15% of your Max HP.\r\n15—You recover 25% of your Max HP.\r\n18– You recover 50% of your Max HP.\r\n20—You recover to full HP and remove any afflictions you were suffering.'),
(15, 'Tireless', 'def', 2, 'Going without sleep is easier when you are Tireless. If your party has been pushing a full day without rest, your GM might make everyone roll a Tireless Skill check. The higher you roll, the less HP you’ll lose for exhaustion. A GM may make you make this check every 2 hours past the first 24 without sleep.\r\n1—You fall asleep for 1d4 hours.\r\n5– You lose 25% of your max HP.\r\n10—You lose 15% of your max HP.\r\n15-You lose 5% of your max HP.\r\n20– You don’t lose any HP and feel fine.'),
(16, 'Engineering', 'satk', 2, 'You’re more adept than most at understanding and operating machinery. The GM may make you make an Engineering check when coming upon a machine.\r\n1—The device is foreign to you.\r\n5—You can guess the purpose, but you cannot operate the device.\r\n10—You know the purpose of the device and can at least understand how to turn off the device.\r\n15—You can repair the device and operate the device.\r\n20—You are an expert with the device and can use it without any problems.\r\n30—You can replicate the machine with the right resources, you have an intimate knowledge of it.'),
(17, 'History', 'satk', 2, 'Sometimes you need to know more about the past of the Pokémon world, the better your History, the more you know about the world. When in a new space or hearing about ,some kind of historical event you may initiate a check or your GM might ask you to make one when your party isn’t sure about where anything is.\r\n1—You don’t know anything about anything.\r\n5—You’ve heard about the place/event in passing, but wasn’t really paying attention.\r\n10—You know about the place - any Gyms, major sights, famous people from there\r\nYou know about the event - who/what/when/why it happened.\r\n15—You know about the Gym’s specialties, team specifics of the famous people from there\r\nYou know about details that are often left out in history books.\r\n20—It’d be hard to tell you hadn’t been to the place before, or weren’t at the event personally.'),
(18, 'Investigate', 'satk', 2, 'When trying to understand something’s purpose or find relevant items in an area, Investigation helps. This is used sometimes to find items of importance in a space or something else you may have missed. When used it will often be against a GM created scenario so whether you or the GM initiates the check, you don’t know how high you must roll, but as always will want to roll high.'),
(19, 'Programming', 'satk', 2, 'A better understanding and access of computers is possible with Programming. While you may be able to attempt any of the following things, they will often be against GM controlled networks and NPCs programmers. For this reason, you’ll want to explain each thing you’re doing and roll each time against the GM’s roll. You don’t know how high you must roll, but as always will want to roll high.\r\nProgramming tasks: Access digital device (timer, detonator, lock), access personal computer, access small network (small office, personal business), access large network (Pokémon Centers in the city, local government), access massive corporate network (Ranger Union, Rocket database, Silph Co.), damage programming, crash computers, crash network, activate/shutdown remote task (cameras, locks, alarm), change network keys, manipulate computer hardware, hide evidence of tam-pering.'),
(20, 'Diplomacy', 'sdef', 2, 'Deception is a tricky thing, just as tricky as diplomacy, this might help convince others to do or believe as you say. Bluff/Diplomacy is rolled against other Trainers or Pokémon. For this reason, you’ll always be rolling against a GM controlled NPC which means that you don’t know how high you must roll, but as always will want to roll high.'),
(21, 'Perception', 'sdef', 2, 'Often, things are happening around you. Perception is important to catch things that you wouldn’t catch otherwise. When used it will often be against a GM created scenario so whether you or the GM initiates the check, you don’t know how high you must roll, but as always will want to roll high.'),
(22, 'Sooth', 'sdef', 2, 'Pokémon can often be upset. Whether they’re afraid, worried, angry or even aggressive, a Trainer with Sooth is more likely to get through to a Pokémon in need. Sooth is rolled against Pokémon. For this rea-son, you’ll always be rolling against a GM controlled NPC which means that you don’t know how high you must roll, but as always will want to roll high.'),
(23, 'Streetwise', 'sdef', 2, 'It’s hard to be in a new place and while journeying, you’ll encounter new places often. With Streetwise, it’ll be much easier to know where to hang out, or sometimes where to avoid.\r\n1—You don’t know anything about anything.\r\n5—You’ve heard about some important business people, but nothing important.\r\n10—You know about any places to avoid, but also know where to find some questionable services.\r\n15—You know details about the leaders in any groups you may want to avoid.\r\n20—You know how to pass for a member of any groups that reside in the town or city you’re visiting.'),
(24, 'Acrobatics', 'spd', 2, 'Whether its careful balance, a parkour climb, or a swinging flip Acrobatics will come in handy to suc-ceed. Usually Trainers will initiate this Skill check, but a GM may ask you to make it while you cross a tattered rope bridge.\r\n1—You fall over.\r\n5—You navigate a board wide enough for you to walk normally on or scale a normal fence.\r\n10—You can balance across a ledge or a large tree trunk, or scale a story of a building.\r\n15—You pass through thin paths of balance unhindered in speed and can scale the side of a building.\r\n20—You have no trouble scaling buildings or overcoming difficult pathways.'),
(25, 'Perform', 'spd', 2, 'Perform helps you play your instruments better or put on your magician’s act or dance with more ex-pertise or even give a rousing speech. Usually Trainers will initiate this Skill check, but a GM may ask you to make it while performing in a tough spot.\r\n1—You get stage freight.\r\n5—Everything goes pretty well, only a pair of unnoticed missed steps/notes/lines.\r\n10—You get a round of applause.\r\n15—You get a standing ovation, crowds loved the performance. Some might even give you some credits (up to 100 credits a day).\r\n20—The cheers go on for many minutes. A stunning performance. Surely someone gave you credits, some might contact you to arrange performances (up to 1000 credits a day). You can begin gathering local fame.\r\n30—Your performance is the stuff of starting movements.'),
(26, 'Sleight of Hand', 'spd', 2, 'While pickpocketing is bad, some still want to be able to do it well. This is also useful for concealing things you own. Sleight of Hand is rolled against other Trainers or Pokémon. For this reason, you’ll al-ways be rolling against a GM controlled NPC which means that you don’t know how high you must roll, but as always will want to roll high.'),
(27, 'Stealth', 'spd', 2, 'Moving sneakily comes in handy. With Stealth, you can move quieter and hide yourself better. Stealth is rolled against other Trainers or Pokémon. For this reason, you’ll always be rolling against a GM con-trolled NPC which means that you don’t know how high you must roll, but as always will want to roll high.');

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
-- Indexes for table `contest_type`
--
ALTER TABLE `contest_type`
  ADD PRIMARY KEY (`contest_type_id`);

--
-- Indexes for table `egg_group`
--
ALTER TABLE `egg_group`
  ADD PRIMARY KEY (`egg_group_id`);

--
-- Indexes for table `feature`
--
ALTER TABLE `feature`
  ADD PRIMARY KEY (`feature_id`);

--
-- Indexes for table `feature_cat`
--
ALTER TABLE `feature_cat`
  ADD PRIMARY KEY (`feature_cat_id`);

--
-- Indexes for table `habitat`
--
ALTER TABLE `habitat`
  ADD PRIMARY KEY (`habitat_id`);

--
-- Indexes for table `move`
--
ALTER TABLE `move`
  ADD PRIMARY KEY (`move_id`);

--
-- Indexes for table `nature`
--
ALTER TABLE `nature`
  ADD PRIMARY KEY (`nature_id`);

--
-- Indexes for table `pokemon_skill`
--
ALTER TABLE `pokemon_skill`
  ADD PRIMARY KEY (`pokemon_skill_id`);

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
-- Indexes for table `species`
--
ALTER TABLE `species`
  ADD PRIMARY KEY (`species_id`);

--
-- Indexes for table `trainer`
--
ALTER TABLE `trainer`
  ADD PRIMARY KEY (`trainer_id`),
  ADD KEY `trainer_code` (`trainer_code`);

--
-- Indexes for table `trainer_skill`
--
ALTER TABLE `trainer_skill`
  ADD PRIMARY KEY (`trainer_skill_id`);

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
-- AUTO_INCREMENT for table `contest_type`
--
ALTER TABLE `contest_type`
  MODIFY `contest_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `egg_group`
--
ALTER TABLE `egg_group`
  MODIFY `egg_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `feature`
--
ALTER TABLE `feature`
  MODIFY `feature_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `feature_cat`
--
ALTER TABLE `feature_cat`
  MODIFY `feature_cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;
--
-- AUTO_INCREMENT for table `habitat`
--
ALTER TABLE `habitat`
  MODIFY `habitat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `move`
--
ALTER TABLE `move`
  MODIFY `move_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `nature`
--
ALTER TABLE `nature`
  MODIFY `nature_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `pokemon_skill`
--
ALTER TABLE `pokemon_skill`
  MODIFY `pokemon_skill_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;
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
-- AUTO_INCREMENT for table `species`
--
ALTER TABLE `species`
  MODIFY `species_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `trainer`
--
ALTER TABLE `trainer`
  MODIFY `trainer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `trainer_skill`
--
ALTER TABLE `trainer_skill`
  MODIFY `trainer_skill_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `type`
--
ALTER TABLE `type`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
