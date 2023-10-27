-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 27 oct. 2023 à 12:19
-- Version du serveur : 8.0.31
-- Version de PHP : 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `database`
--

-- --------------------------------------------------------

--
-- Structure de la table `aliments`
--

DROP TABLE IF EXISTS `aliments`;
CREATE TABLE IF NOT EXISTS `aliments` (
  `CODE` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `PRODUIT` varchar(256) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `QUANTITE` int DEFAULT NULL,
  `PORTION` int DEFAULT NULL,
  `MARQUE` varchar(256) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ENERGY` int DEFAULT NULL,
  `ENERGY_UNIT` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `NUTRISCORE_GRADE` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`CODE`),
  KEY `INDEX_PRODUIT` (`PRODUIT`(250))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `aliments`
--

INSERT INTO `aliments` (`CODE`, `PRODUIT`, `QUANTITE`, `PORTION`, `MARQUE`, `ENERGY`, `ENERGY_UNIT`, `NUTRISCORE_GRADE`) VALUES
('3228857000166', 'Pain 100% mie complet', 500, NULL, 'Harrys', 1053, 'kJ', 'c');

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `ID_CATEGORIES` int NOT NULL AUTO_INCREMENT,
  `NOM` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID_CATEGORIES`),
  KEY `INDEX_NOM_CATEGORIES` (`NOM`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`ID_CATEGORIES`, `NOM`) VALUES
(18, ' Aliments d\'origine végétale'),
(19, ' Céréales et pommes de terre'),
(20, ' Pains'),
(23, ' Pains complets'),
(21, ' Pains de mie'),
(24, ' Pains de mie complet'),
(22, ' Pains de mie sans croûte'),
(17, 'Aliments et boissons à base de végétaux');

-- --------------------------------------------------------

--
-- Structure de la table `composition`
--

DROP TABLE IF EXISTS `composition`;
CREATE TABLE IF NOT EXISTS `composition` (
  `CODE` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `ID_INGREDIENT` int NOT NULL,
  `POURCENTAGE` int DEFAULT NULL,
  PRIMARY KEY (`CODE`,`ID_INGREDIENT`),
  KEY `ID_INGREDIENT` (`ID_INGREDIENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `composition`
--

INSERT INTO `composition` (`CODE`, `ID_INGREDIENT`, `POURCENTAGE`) VALUES
('3228857000166', 1, 37),
('3228857000166', 2, 21),
('3228857000166', 3, 18),
('3228857000166', 4, 12),
('3228857000166', 5, 6),
('3228857000166', 6, 3),
('3228857000166', 7, 1),
('3228857000166', 8, 1),
('3228857000166', 9, 0),
('3228857000166', 10, 0),
('3228857000166', 11, 0),
('3228857000166', 12, 0);

-- --------------------------------------------------------

--
-- Structure de la table `composition_nutritive`
--

DROP TABLE IF EXISTS `composition_nutritive`;
CREATE TABLE IF NOT EXISTS `composition_nutritive` (
  `CODE` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `ID_NUTRIMENT` int NOT NULL,
  `VALEUR_100` float DEFAULT NULL,
  `VALEUR_PORTION` float DEFAULT NULL,
  `UNITE` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`CODE`,`ID_NUTRIMENT`),
  KEY `ID_NUTRIMENT` (`ID_NUTRIMENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `composition_nutritive`
--

INSERT INTO `composition_nutritive` (`CODE`, `ID_NUTRIMENT`, `VALEUR_100`, `VALEUR_PORTION`, `UNITE`) VALUES
('3228857000166', 2, 39.7, NULL, 'g'),
('3228857000166', 4, 4.3, NULL, 'g'),
('3228857000166', 5, 7.1, NULL, 'g'),
('3228857000166', 7, 7.2, NULL, 'g'),
('3228857000166', 8, 1.1, NULL, 'g');

-- --------------------------------------------------------

--
-- Structure de la table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
CREATE TABLE IF NOT EXISTS `ingredients` (
  `ID_INGREDIENT` int NOT NULL AUTO_INCREMENT,
  `NOM` varchar(40) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID_INGREDIENT`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `ingredients`
--

INSERT INTO `ingredients` (`ID_INGREDIENT`, `NOM`) VALUES
(1, 'Farine complète de blé'),
(2, 'eau'),
(3, 'farine de blé'),
(4, 'huile de colza'),
(5, 'sucre'),
(6, 'sel'),
(7, 'arôme'),
(8, 'gluten de blé'),
(9, 'farine de seigle maltée'),
(10, 'levure'),
(11, 'vinaigre'),
(12, 'extrait d\'acérola');

-- --------------------------------------------------------

--
-- Structure de la table `journal`
--

DROP TABLE IF EXISTS `journal`;
CREATE TABLE IF NOT EXISTS `journal` (
  `ID_JOURNAL` int NOT NULL AUTO_INCREMENT,
  `CODE` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `IDENTIFIANT` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `QUANTITE` int DEFAULT NULL,
  `DATE` date DEFAULT NULL,
  PRIMARY KEY (`ID_JOURNAL`),
  KEY `IDENTIFIANT` (`IDENTIFIANT`),
  KEY `CODE` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `labels`
--

DROP TABLE IF EXISTS `labels`;
CREATE TABLE IF NOT EXISTS `labels` (
  `CODE` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `ID_CATEGORIES` int NOT NULL,
  PRIMARY KEY (`CODE`,`ID_CATEGORIES`),
  KEY `ID_CATEGORIES` (`ID_CATEGORIES`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `labels`
--

INSERT INTO `labels` (`CODE`, `ID_CATEGORIES`) VALUES
('3228857000166', 17),
('3228857000166', 18),
('3228857000166', 19),
('3228857000166', 20),
('3228857000166', 21),
('3228857000166', 22),
('3228857000166', 23),
('3228857000166', 24);

-- --------------------------------------------------------

--
-- Structure de la table `nutriments`
--

DROP TABLE IF EXISTS `nutriments`;
CREATE TABLE IF NOT EXISTS `nutriments` (
  `ID_NUTRIMENT` int NOT NULL AUTO_INCREMENT,
  `NOM` varchar(40) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `NOM_EN` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID_NUTRIMENT`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `nutriments`
--

INSERT INTO `nutriments` (`ID_NUTRIMENT`, `NOM`, `NOM_EN`) VALUES
(1, 'Calcium', 'calcium'),
(2, 'Glucides', 'carbohydrates'),
(3, 'Cholestérol', 'cholesterol'),
(4, 'Matières grasses', 'fat'),
(5, 'Fibres', 'fiber'),
(6, 'Fer', 'iron'),
(7, 'Protéines', 'proteins'),
(8, 'Sel', 'salt');

-- --------------------------------------------------------

--
-- Structure de la table `pratique_sportive`
--

DROP TABLE IF EXISTS `pratique_sportive`;
CREATE TABLE IF NOT EXISTS `pratique_sportive` (
  `ID_SPORTIF` int NOT NULL AUTO_INCREMENT,
  `NOM` varchar(40) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID_SPORTIF`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `pratique_sportive`
--

INSERT INTO `pratique_sportive` (`ID_SPORTIF`, `NOM`) VALUES
(1, 'Nulle'),
(2, 'Ponctuelle'),
(3, 'Régulière'),
(4, 'Fréquente');

-- --------------------------------------------------------

--
-- Structure de la table `recommendations`
--

DROP TABLE IF EXISTS `recommendations`;
CREATE TABLE IF NOT EXISTS `recommendations` (
  `IDENTIFIANT` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `ID_NUTRIMENT` int NOT NULL,
  `QUANTITE` int DEFAULT NULL,
  PRIMARY KEY (`IDENTIFIANT`,`ID_NUTRIMENT`),
  KEY `ID_NUTRIMENT` (`ID_NUTRIMENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `sexe`
--

DROP TABLE IF EXISTS `sexe`;
CREATE TABLE IF NOT EXISTS `sexe` (
  `ID_SEXE` int NOT NULL AUTO_INCREMENT,
  `NOM` varchar(40) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID_SEXE`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `sexe`
--

INSERT INTO `sexe` (`ID_SEXE`, `NOM`) VALUES
(1, 'Femme'),
(2, 'Homme');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

DROP TABLE IF EXISTS `utilisateurs`;
CREATE TABLE IF NOT EXISTS `utilisateurs` (
  `IDENTIFIANT` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `ID_SPORTIF` int NOT NULL,
  `ID_SEXE` int DEFAULT NULL,
  `MOT_DE_PASSE` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PRENOM` varchar(40) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `NOM` varchar(40) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AGE` int DEFAULT NULL,
  PRIMARY KEY (`IDENTIFIANT`),
  KEY `INDEX_NOM_PRENOM` (`PRENOM`,`NOM`),
  KEY `ID_SEXE` (`ID_SEXE`),
  KEY `ID_SPORTIF` (`ID_SPORTIF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `composition`
--
ALTER TABLE `composition`
  ADD CONSTRAINT `composition_ibfk_1` FOREIGN KEY (`CODE`) REFERENCES `aliments` (`CODE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `composition_ibfk_2` FOREIGN KEY (`ID_INGREDIENT`) REFERENCES `ingredients` (`ID_INGREDIENT`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Contraintes pour la table `composition_nutritive`
--
ALTER TABLE `composition_nutritive`
  ADD CONSTRAINT `composition_nutritive_ibfk_1` FOREIGN KEY (`CODE`) REFERENCES `aliments` (`CODE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `composition_nutritive_ibfk_2` FOREIGN KEY (`ID_NUTRIMENT`) REFERENCES `nutriments` (`ID_NUTRIMENT`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Contraintes pour la table `journal`
--
ALTER TABLE `journal`
  ADD CONSTRAINT `journal_ibfk_1` FOREIGN KEY (`IDENTIFIANT`) REFERENCES `utilisateurs` (`IDENTIFIANT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `journal_ibfk_2` FOREIGN KEY (`CODE`) REFERENCES `aliments` (`CODE`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Contraintes pour la table `labels`
--
ALTER TABLE `labels`
  ADD CONSTRAINT `labels_ibfk_1` FOREIGN KEY (`CODE`) REFERENCES `aliments` (`CODE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `labels_ibfk_2` FOREIGN KEY (`ID_CATEGORIES`) REFERENCES `categories` (`ID_CATEGORIES`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Contraintes pour la table `recommendations`
--
ALTER TABLE `recommendations`
  ADD CONSTRAINT `recommendations_ibfk_1` FOREIGN KEY (`IDENTIFIANT`) REFERENCES `utilisateurs` (`IDENTIFIANT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `recommendations_ibfk_2` FOREIGN KEY (`ID_NUTRIMENT`) REFERENCES `nutriments` (`ID_NUTRIMENT`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Contraintes pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD CONSTRAINT `utilisateurs_ibfk_1` FOREIGN KEY (`ID_SEXE`) REFERENCES `sexe` (`ID_SEXE`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `utilisateurs_ibfk_2` FOREIGN KEY (`ID_SPORTIF`) REFERENCES `pratique_sportive` (`ID_SPORTIF`) ON DELETE RESTRICT ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
