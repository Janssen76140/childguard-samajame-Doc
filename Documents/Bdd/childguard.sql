-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 18, 2020 at 02:38 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chilguard`
--

-- --------------------------------------------------------

--
-- Table structure for table `chi_enfant`
--

CREATE TABLE `chi_enfant` (
  `id_enfant` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `prenom` varchar(45) NOT NULL,
  `responsableLegal` varchar(45) NOT NULL,
  `dateNaissance` date NOT NULL,
  `allergie` enum('Arachide','Lait','Soja','Oeuf') NOT NULL,
  `vaccins` enum('DTPolio','Coqueluche','Hæmophilus influenzae b','Pneumocoque','Hépatite B','Méningocoque C','ROR') NOT NULL,
  `maladie` enum('varicelle','rubeole','bronchiolite','rhinopharyngite','angine','coqueluche','otite','rougeole','oreillons') NOT NULL,
  `regimeAlimentaire` enum('vegetarien','vegan','hallal','casher') NOT NULL,
  `id_parent` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `chi_enfant`
--

INSERT INTO `chi_enfant` (`id_enfant`, `nom`, `prenom`, `responsableLegal`, `dateNaissance`, `allergie`, `vaccins`, `maladie`, `regimeAlimentaire`, `id_parent`, `created_at`, `modified_at`) VALUES
(1, 'Lacaille', 'Julian', 'Samuel Lacaile', '1999-11-24', '', '', 'oreillons', '', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'Lacaille', 'Michel', 'Lacaille Samuel', '2020-04-23', 'Lait', '', '', '', 1, '2020-04-01 15:45:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `chi_enfant_has_chi_pro`
--

CREATE TABLE `chi_enfant_has_chi_pro` (
  `chi_enfant_id_enfant` int(11) NOT NULL,
  `chi_pro_id_pro` int(11) NOT NULL,
  `date` date NOT NULL,
  `heureDebut` datetime NOT NULL,
  `heureFin` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `chi_enfant_has_chi_user`
--

CREATE TABLE `chi_enfant_has_chi_user` (
  `chi_enfant_id_enfant` int(11) NOT NULL,
  `chi_user_id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `chi_enfant_has_chi_user`
--

INSERT INTO `chi_enfant_has_chi_user` (`chi_enfant_id_enfant`, `chi_user_id_user`) VALUES
(1, 1),
(3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `chi_facture`
--

CREATE TABLE `chi_facture` (
  `id_facture` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_pro` int(11) NOT NULL,
  `montant` float NOT NULL,
  `created_at` datetime NOT NULL,
  `relance` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `chi_jours`
--

CREATE TABLE `chi_jours` (
  `id_jours` int(11) NOT NULL,
  `jour` varchar(45) NOT NULL,
  `numeroSemaine` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `chi_pro`
--

CREATE TABLE `chi_pro` (
  `id` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `siret` varchar(16) NOT NULL,
  `email` varchar(45) NOT NULL,
  `mdp` varchar(45) NOT NULL,
  `prix` float NOT NULL,
  `heureDebut` time NOT NULL,
  `heureFin` time NOT NULL,
  `longitude` float NOT NULL,
  `latitude` float NOT NULL,
  `id_enfant` int(11) NOT NULL,
  `adresse` text NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `chi_pro`
--

INSERT INTO `chi_pro` (`id`, `nom`, `siret`, `email`, `mdp`, `prix`, `heureDebut`, `heureFin`, `longitude`, `latitude`, `id_enfant`, `adresse`, `created_at`, `modified_at`) VALUES
(1, 'bbguard', ' 73282132000074', 'bbguard@test.com', '5be61c5ebe9bd531d9f9d25b7c5d73ae8e6da7cc', 4.5, '07:00:00', '18:00:00', 0.47, 49.43, 1, '3 rue de la creche', '2020-04-01 11:00:00', '0000-00-00 00:00:00'),
(2, 'garderieRouen', '061645789541235', 'garderie@rouen.com', '66c2ea21fffb2ad70dabe90f9144d4fcc73109c6', 5, '06:15:00', '19:00:00', 0, 0, 2, '4 rue de la garderie', '2020-04-01 07:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `chi_pro_has_jours`
--

CREATE TABLE `chi_pro_has_jours` (
  `chi_pro_id_pro` int(11) NOT NULL,
  `chi_jours_id_jours` int(11) NOT NULL,
  `horraireDebut` time NOT NULL,
  `horraireFin` time NOT NULL,
  `nbPlaceDispo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `chi_user`
--

CREATE TABLE `chi_user` (
  `id_user` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `prenom` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `mdp` varchar(45) NOT NULL,
  `adresse` text NOT NULL,
  `ville` varchar(45) NOT NULL,
  `téléphone` varchar(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `chi_user`
--

INSERT INTO `chi_user` (`id_user`, `nom`, `prenom`, `email`, `mdp`, `adresse`, `ville`, `téléphone`, `created_at`, `modified_at`) VALUES
(1, 'LACAILLE', 'Samuel', 'samuel76560@outlook.fr', '$2y$10$C4Y7o0PcOCYtga06/PeQc.1LXgnad71vvOck7z', '6 Bv Gambetta', 'Rouen', '0611449517', '2020-04-01 10:23:34', '2020-04-01 10:23:34');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chi_enfant`
--
ALTER TABLE `chi_enfant`
  ADD PRIMARY KEY (`id_enfant`);

--
-- Indexes for table `chi_enfant_has_chi_user`
--
ALTER TABLE `chi_enfant_has_chi_user`
  ADD UNIQUE KEY `chi_enfant_id_enfant` (`chi_enfant_id_enfant`);

--
-- Indexes for table `chi_facture`
--
ALTER TABLE `chi_facture`
  ADD PRIMARY KEY (`id_facture`),
  ADD UNIQUE KEY `id_pro` (`id_pro`),
  ADD UNIQUE KEY `id_user` (`id_user`);

--
-- Indexes for table `chi_jours`
--
ALTER TABLE `chi_jours`
  ADD PRIMARY KEY (`id_jours`);

--
-- Indexes for table `chi_pro`
--
ALTER TABLE `chi_pro`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_enfant` (`id_enfant`);

--
-- Indexes for table `chi_pro_has_jours`
--
ALTER TABLE `chi_pro_has_jours`
  ADD UNIQUE KEY `chi_pro_id_pro` (`chi_pro_id_pro`),
  ADD UNIQUE KEY `chi_jours_id_jours` (`chi_jours_id_jours`);

--
-- Indexes for table `chi_user`
--
ALTER TABLE `chi_user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chi_enfant`
--
ALTER TABLE `chi_enfant`
  MODIFY `id_enfant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `chi_facture`
--
ALTER TABLE `chi_facture`
  MODIFY `id_facture` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chi_jours`
--
ALTER TABLE `chi_jours`
  MODIFY `id_jours` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chi_pro`
--
ALTER TABLE `chi_pro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `chi_user`
--
ALTER TABLE `chi_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
