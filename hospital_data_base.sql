-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 08, 2024 at 10:17 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospital_data_base`
--

-- --------------------------------------------------------

--
-- Table structure for table `consultation`
--

CREATE TABLE `consultation` (
  `ID_Consultation` int(11) NOT NULL,
  `ID_Patient` int(11) DEFAULT NULL,
  `ID_Médecin` int(11) DEFAULT NULL,
  `Date_heure` date DEFAULT NULL,
  `diagnostic` text DEFAULT NULL,
  `prescription` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `examen / test médical`
--

CREATE TABLE `examen / test médical` (
  `ID_Examen` int(11) NOT NULL,
  `type_examen` text DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `resultats` text DEFAULT NULL,
  `ID_Patient` int(11) DEFAULT NULL,
  `ID_Médecin` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hospitalisation`
--

CREATE TABLE `hospitalisation` (
  `ID_Hospitalisation` int(11) NOT NULL,
  `ID_Patient` int(11) DEFAULT NULL,
  `date_admission` date DEFAULT NULL,
  `service` varchar(255) DEFAULT NULL,
  `ID_Médecin` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `intervention chirurgicale`
--

CREATE TABLE `intervention chirurgicale` (
  `ID_Intervention` int(11) NOT NULL,
  `ID_Patient` int(11) DEFAULT NULL,
  `ID_Médecin` int(11) DEFAULT NULL,
  `date_intervention` date DEFAULT NULL,
  `type_intervention` varchar(255) DEFAULT NULL,
  `anesthesie` varchar(255) DEFAULT NULL,
  `salle` varchar(255) DEFAULT NULL,
  `ID_Personnel` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `médecin`
--

CREATE TABLE `médecin` (
  `ID_Médecin` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `specialite` varchar(255) NOT NULL,
  `telephone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `médicament`
--

CREATE TABLE `médicament` (
  `ID_Médicament` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `forme` varchar(255) DEFAULT NULL,
  `dosage` text DEFAULT NULL,
  `effects` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `date_peremption` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `ID_Patient` int(11) NOT NULL,
  `non` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `date_naissance` date DEFAULT NULL,
  `sexe` varchar(255) DEFAULT NULL,
  `adresse` text DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `taille` varchar(255) DEFAULT NULL,
  `poids` varchar(255) DEFAULT NULL,
  `groupe_sanguin` char(5) DEFAULT NULL,
  `antecedents` text DEFAULT NULL,
  `carte_soins` tinyint(1) DEFAULT NULL,
  `date_admission` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personnel (inrmiers, techniciens...)`
--

CREATE TABLE `personnel (inrmiers, techniciens...)` (
  `ID_Personnel` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `poste` varchar(50) DEFAULT NULL,
  `service` varchar(50) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `email` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rendez-vous`
--

CREATE TABLE `rendez-vous` (
  `ID_Rendezvous` int(11) NOT NULL,
  `ID_Patient` int(11) DEFAULT NULL,
  `ID_Médecin` int(11) DEFAULT NULL,
  `date_heure` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `traitement`
--

CREATE TABLE `traitement` (
  `ID_Traitement` int(11) NOT NULL,
  `ID_Patient` int(11) DEFAULT NULL,
  `nom_medicament` varchar(255) DEFAULT NULL,
  `dosage` text DEFAULT NULL,
  `duree` varchar(255) DEFAULT NULL,
  `date_prescription` date DEFAULT NULL,
  `ID_Médecin` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `consultation`
--
ALTER TABLE `consultation`
  ADD PRIMARY KEY (`ID_Consultation`),
  ADD KEY `ID_Patient` (`ID_Patient`),
  ADD KEY `ID_Médecin` (`ID_Médecin`);

--
-- Indexes for table `examen / test médical`
--
ALTER TABLE `examen / test médical`
  ADD PRIMARY KEY (`ID_Examen`),
  ADD KEY `ID_Patient` (`ID_Patient`),
  ADD KEY `ID_Médecin` (`ID_Médecin`);

--
-- Indexes for table `hospitalisation`
--
ALTER TABLE `hospitalisation`
  ADD PRIMARY KEY (`ID_Hospitalisation`),
  ADD KEY `ID_Patient` (`ID_Patient`),
  ADD KEY `ID_Médecin` (`ID_Médecin`);

--
-- Indexes for table `intervention chirurgicale`
--
ALTER TABLE `intervention chirurgicale`
  ADD PRIMARY KEY (`ID_Intervention`),
  ADD KEY `ID_Patient` (`ID_Patient`),
  ADD KEY `ID_Médecin` (`ID_Médecin`),
  ADD KEY `ID_Personnel` (`ID_Personnel`);

--
-- Indexes for table `médecin`
--
ALTER TABLE `médecin`
  ADD PRIMARY KEY (`ID_Médecin`);

--
-- Indexes for table `médicament`
--
ALTER TABLE `médicament`
  ADD PRIMARY KEY (`ID_Médicament`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`ID_Patient`);

--
-- Indexes for table `personnel (inrmiers, techniciens...)`
--
ALTER TABLE `personnel (inrmiers, techniciens...)`
  ADD PRIMARY KEY (`ID_Personnel`);

--
-- Indexes for table `rendez-vous`
--
ALTER TABLE `rendez-vous`
  ADD PRIMARY KEY (`ID_Rendezvous`),
  ADD KEY `ID_Patient` (`ID_Patient`),
  ADD KEY `ID_Médecin` (`ID_Médecin`);

--
-- Indexes for table `traitement`
--
ALTER TABLE `traitement`
  ADD PRIMARY KEY (`ID_Traitement`),
  ADD KEY `ID_Patient` (`ID_Patient`),
  ADD KEY `ID_Médecin` (`ID_Médecin`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `consultation`
--
ALTER TABLE `consultation`
  ADD CONSTRAINT `FK_consultation_médecin` FOREIGN KEY (`ID_Médecin`) REFERENCES `médecin` (`ID_Médecin`),
  ADD CONSTRAINT `FK_consultation_patient` FOREIGN KEY (`ID_Patient`) REFERENCES `patient` (`ID_Patient`);

--
-- Constraints for table `examen / test médical`
--
ALTER TABLE `examen / test médical`
  ADD CONSTRAINT `examen / test médical_ibfk_1` FOREIGN KEY (`ID_Médecin`) REFERENCES `médecin` (`ID_Médecin`),
  ADD CONSTRAINT `examen / test médical_ibfk_2` FOREIGN KEY (`ID_Patient`) REFERENCES `patient` (`ID_Patient`);

--
-- Constraints for table `hospitalisation`
--
ALTER TABLE `hospitalisation`
  ADD CONSTRAINT `FK_hospitalisation_médecin` FOREIGN KEY (`ID_Médecin`) REFERENCES `médecin` (`ID_Médecin`),
  ADD CONSTRAINT `FK_hospitalisation_patient` FOREIGN KEY (`ID_Patient`) REFERENCES `patient` (`ID_Patient`);

--
-- Constraints for table `intervention chirurgicale`
--
ALTER TABLE `intervention chirurgicale`
  ADD CONSTRAINT `intervention chirurgicale_ibfk_1` FOREIGN KEY (`ID_Patient`) REFERENCES `patient` (`ID_Patient`),
  ADD CONSTRAINT `intervention chirurgicale_ibfk_2` FOREIGN KEY (`ID_Médecin`) REFERENCES `médecin` (`ID_Médecin`),
  ADD CONSTRAINT `intervention chirurgicale_ibfk_3` FOREIGN KEY (`ID_Personnel`) REFERENCES `personnel (inrmiers, techniciens...)` (`ID_Personnel`);

--
-- Constraints for table `rendez-vous`
--
ALTER TABLE `rendez-vous`
  ADD CONSTRAINT `rendez-vous_ibfk_1` FOREIGN KEY (`ID_Médecin`) REFERENCES `médecin` (`ID_Médecin`),
  ADD CONSTRAINT `rendez-vous_ibfk_2` FOREIGN KEY (`ID_Patient`) REFERENCES `patient` (`ID_Patient`);

--
-- Constraints for table `traitement`
--
ALTER TABLE `traitement`
  ADD CONSTRAINT `FK_traitement_médecin` FOREIGN KEY (`ID_Médecin`) REFERENCES `médecin` (`ID_Médecin`),
  ADD CONSTRAINT `FK_traitement_patient` FOREIGN KEY (`ID_Patient`) REFERENCES `patient` (`ID_Patient`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
