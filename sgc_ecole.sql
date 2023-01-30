-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mer 28 Septembre 2016 à 09:50
-- Version du serveur :  5.7.9
-- Version de PHP :  5.6.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `sgbd_ecole`
--

-- --------------------------------------------------------

--
-- Structure de la table `ecole_activites`
--

DROP TABLE IF EXISTS `ecole_activites`;
CREATE TABLE IF NOT EXISTS `ecole_activites` (
  `niveau` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `equipe` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`niveau`,`nom`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `ecole_activites`
--

INSERT INTO `ecole_activites` (`niveau`, `nom`, `equipe`) VALUES
(1, 'Mini foot', 'AMC indus'),
(1, 'Surf', 'Les planchiste runis'),
(1, 'Volley ball', 'Avs80'),
(2, 'Mini foot', 'Les as du ballon'),
(2, 'Tennis', 'Ace club'),
(2, 'Volley ball', 'smash'),
(3, 'Tennis', 'Ace club');

-- --------------------------------------------------------

--
-- Structure de la table `ecole_activites_pratiquees`
--

DROP TABLE IF EXISTS `ecole_activites_pratiquees`;
CREATE TABLE IF NOT EXISTS `ecole_activites_pratiquees` (
  `num_eleve` int(11) NOT NULL,
  `niveau` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL,
  PRIMARY KEY (`num_eleve`,`niveau`,`nom`),
  KEY `ref_activ` (`niveau`,`nom`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `ecole_activites_pratiquees`
--

INSERT INTO `ecole_activites_pratiquees` (`num_eleve`, `niveau`, `nom`) VALUES
(1, 1, 'Mini foot'),
(2, 1, 'Mini foot'),
(5, 1, 'Mini foot'),
(8, 1, 'Mini foot'),
(9, 1, 'Mini foot'),
(10, 1, 'Mini foot'),
(1, 1, 'Surf'),
(4, 1, 'Surf'),
(5, 1, 'Surf'),
(1, 1, 'Volley ball'),
(5, 1, 'Volley ball'),
(8, 1, 'Volley ball'),
(3, 2, 'Mini foot'),
(4, 2, 'Mini foot'),
(1, 2, 'Tennis'),
(2, 2, 'Tennis'),
(3, 2, 'Tennis'),
(10, 2, 'Tennis'),
(3, 2, 'Volley ball'),
(8, 2, 'Volley ball'),
(9, 2, 'Volley ball'),
(10, 2, 'Volley ball');

-- --------------------------------------------------------

--
-- Structure de la table `ecole_charge`
--

DROP TABLE IF EXISTS `ecole_charge`;
CREATE TABLE IF NOT EXISTS `ecole_charge` (
  `num_cours` int(11) NOT NULL,
  `num_prof` int(11) NOT NULL,
  PRIMARY KEY (`num_prof`,`num_cours`),
  KEY `ref_cours_ch` (`num_cours`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `ecole_charge`
--

INSERT INTO `ecole_charge` (`num_cours`, `num_prof`) VALUES
(1, 1),
(1, 2),
(1, 8),
(2, 3),
(2, 4),
(2, 8),
(3, 8),
(4, 1),
(4, 3),
(4, 7),
(4, 8),
(5, 3),
(5, 8);

-- --------------------------------------------------------

--
-- Structure de la table `ecole_cours`
--

DROP TABLE IF EXISTS `ecole_cours`;
CREATE TABLE IF NOT EXISTS `ecole_cours` (
  `num_cours` int(11) NOT NULL,
  `nom` varchar(20) DEFAULT NULL,
  `nbheures` int(11) DEFAULT NULL,
  `annee` int(11) DEFAULT NULL,
  PRIMARY KEY (`num_cours`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `ecole_cours`
--

INSERT INTO `ecole_cours` (`num_cours`, `nom`, `nbheures`, `annee`) VALUES
(1, 'Réseau', 15, 1),
(2, 'Sgbd', 30, 1),
(3, 'Programmation', 15, 1),
(4, 'Sgbd', 30, 2),
(5, 'Analyse', 60, 2);

-- --------------------------------------------------------

--
-- Structure de la table `ecole_eleves`
--

DROP TABLE IF EXISTS `ecole_eleves`;
CREATE TABLE IF NOT EXISTS `ecole_eleves` (
  `num_eleve` int(11) NOT NULL,
  `nom` varchar(20) DEFAULT NULL,
  `prenom` varchar(20) DEFAULT NULL,
  `date_naissance` date DEFAULT NULL,
  `poids` int(11) DEFAULT NULL,
  `annee` int(11) DEFAULT NULL,
  PRIMARY KEY (`num_eleve`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `ecole_eleves`
--

INSERT INTO `ecole_eleves` (`num_eleve`, `nom`, `prenom`, `date_naissance`, `poids`, `annee`) VALUES
(1, 'Brisefer', 'Benoit', '1978-12-10', 35, 1),
(2, 'Genial', 'Olivier', '1978-04-10', 42, 1),
(3, 'Jourdan', 'Gil', '1974-06-28', 72, 2),
(4, 'Spring', 'Jerry', '1974-02-16', 78, 2),
(5, 'Tsuno', 'Yoko', '1977-10-29', 45, 1),
(6, 'Lebut', 'Marc', '1974-04-29', 75, 2),
(7, 'Lagaffe', 'Gaston', '1975-04-08', 61, 1),
(8, 'Dubois', 'Robin', '1976-04-20', 60, 2),
(9, 'Walthery', 'Natache', '1977-09-07', 59, 1),
(10, 'Danny', 'Buck', '1973-02-15', 82, 2);

-- --------------------------------------------------------

--
-- Structure de la table `ecole_professeurs`
--

DROP TABLE IF EXISTS `ecole_professeurs`;
CREATE TABLE IF NOT EXISTS `ecole_professeurs` (
  `num_prof` int(11) NOT NULL,
  `nom` varchar(20) DEFAULT NULL,
  `specialite` varchar(20) DEFAULT NULL,
  `date_entree` date DEFAULT NULL,
  `der_prom` date DEFAULT NULL,
  `salaire_base` int(11) DEFAULT NULL,
  `salaire_actuel` int(11) DEFAULT NULL,
  PRIMARY KEY (`num_prof`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `ecole_professeurs`
--

INSERT INTO `ecole_professeurs` (`num_prof`, `nom`, `specialite`, `date_entree`, `der_prom`, `salaire_base`, `salaire_actuel`) VALUES
(1, 'Bottle', 'poésie', '1970-10-01', '1988-10-01', 2000000, 2600000),
(2, 'Bolenov', 'réseaux', '1968-11-15', '1998-10-01', 1900000, 2468000),
(3, 'Tonilaclasse', 'poo', '1979-10-01', '1989-01-10', 1900000, 2360000),
(4, 'Pastecnov', 'sql', '1975-10-01', NULL, 2500000, 2500000),
(5, 'Selector', 'sql', '1982-10-15', NULL, 1900000, 1900000),
(6, 'Vilplusplus', 'poo', '1990-04-25', '1994-06-05', 1900000, 2200000),
(7, 'Franscesca', NULL, '1975-10-01', '1998-01-11', 2000000, 3200000),
(8, 'Pucette', 'sql', '1988-12-06', '1996-02-29', 2000000, 2500000);

-- --------------------------------------------------------

--
-- Structure de la table `ecole_resultats`
--

DROP TABLE IF EXISTS `ecole_resultats`;
CREATE TABLE IF NOT EXISTS `ecole_resultats` (
  `num_eleve` int(11) NOT NULL,
  `num_cours` int(11) NOT NULL,
  `points` int(11) DEFAULT NULL,
  PRIMARY KEY (`num_eleve`,`num_cours`),
  KEY `ref_cours` (`num_cours`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `ecole_resultats`
--

INSERT INTO `ecole_resultats` (`num_eleve`, `num_cours`, `points`) VALUES
(1, 1, 15),
(1, 2, 11),
(1, 4, 8),
(1, 5, 20),
(2, 1, 14),
(2, 2, 12),
(2, 4, 11),
(2, 5, 2),
(3, 1, 14),
(3, 2, 15),
(3, 4, 16),
(3, 5, 20),
(4, 1, 17),
(4, 2, 14),
(4, 4, 11),
(4, 5, 8),
(5, 1, 5),
(5, 2, 7),
(5, 4, 13),
(5, 5, 13),
(6, 1, 15),
(6, 2, 4),
(6, 4, 16),
(6, 5, 5),
(7, 1, 3),
(7, 2, 18),
(7, 4, 11),
(7, 5, 10),
(8, 1, 16),
(8, 2, 0),
(8, 4, 6),
(8, 5, 12),
(9, 1, 20),
(9, 2, 20),
(9, 4, 14),
(9, 5, 10),
(10, 1, 3),
(10, 2, 13),
(10, 4, 0),
(10, 5, 16);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `ecole_activites_pratiquees`
--
ALTER TABLE `ecole_activites_pratiquees`
  ADD CONSTRAINT `ref_activ` FOREIGN KEY (`niveau`,`nom`) REFERENCES `ecole_activites` (`niveau`, `nom`),
  ADD CONSTRAINT `ref_eleves_ap` FOREIGN KEY (`num_eleve`) REFERENCES `ecole_eleves` (`num_eleve`);

--
-- Contraintes pour la table `ecole_charge`
--
ALTER TABLE `ecole_charge`
  ADD CONSTRAINT `ref_cours_ch` FOREIGN KEY (`num_cours`) REFERENCES `ecole_cours` (`num_cours`),
  ADD CONSTRAINT `ref_profs_ch` FOREIGN KEY (`num_prof`) REFERENCES `ecole_professeurs` (`num_prof`);

--
-- Contraintes pour la table `ecole_resultats`
--
ALTER TABLE `ecole_resultats`
  ADD CONSTRAINT `ref_cours` FOREIGN KEY (`num_cours`) REFERENCES `ecole_cours` (`num_cours`),
  ADD CONSTRAINT `ref_eleves` FOREIGN KEY (`num_eleve`) REFERENCES `ecole_eleves` (`num_eleve`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
