-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 30 oct. 2023 à 13:30
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
  `NUTRISCORE_GRADE` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`CODE`),
  KEY `INDEX_PRODUIT` (`PRODUIT`(250))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `aliments`
--

INSERT INTO `aliments` (`CODE`, `PRODUIT`, `QUANTITE`, `PORTION`, `MARQUE`, `NUTRISCORE_GRADE`) VALUES
('3032220061100', 'PRESIDENT BURGER CHEDDAR EMMENTAL 12 TRANCHES 200g', 200, 30, 'Président,Lactalis', 'e'),
('3038359003356', 'banzaï noodle saveur poulet', 60, 340, 'Lustucru,Panzani', 'c'),
('3166352968591', 'Lasagnes à la bolognaise', 300, 300, 'Marie', 'c');

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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`ID_CATEGORIES`, `NOM`) VALUES
(18, ' Aliments d\'origine végétale'),
(25, ' Céréales et dérivés'),
(19, ' Céréales et pommes de terre'),
(48, ' en:Meat lasagnas'),
(40, ' Frais'),
(38, ' Fromages'),
(39, ' Fromages de vache'),
(41, ' Fromages en tranches'),
(42, ' Fromages fondus'),
(50, ' Lasagnes à la bolognaise'),
(46, ' Lasagnes préparées'),
(30, ' Nouilles'),
(33, ' Nouilles instantanées'),
(20, ' Pains'),
(23, ' Pains complets'),
(21, ' Pains de mie'),
(24, ' Pains de mie complet'),
(22, ' Pains de mie sans croûte'),
(28, ' Pâtes alimentaires'),
(44, ' Plats à base de pâtes'),
(47, ' Plats au bœuf'),
(26, ' Plats préparés'),
(45, ' Plats préparés à la viande'),
(49, ' Plats préparés à réchauffer au micro-ondes'),
(32, ' Plats préparés déshydratés'),
(27, ' Produits déshydratés'),
(36, ' Produits fermentés'),
(37, ' Produits laitiers fermentés'),
(29, ' Produits lyophilisés à reconstituer'),
(31, ' Soupes'),
(34, ' Soupes déshydratées'),
(17, 'Aliments et boissons à base de végétaux'),
(35, 'Produits laitiers'),
(43, 'Viandes et dérivés');

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
('3032220061100', 2, 2),
('3032220061100', 6, 0),
('3032220061100', 7, 0),
('3032220061100', 25, 0),
('3032220061100', 27, 0),
('3032220061100', 31, 50),
('3032220061100', 32, 46),
('3032220061100', 33, 1),
('3032220061100', 34, 1),
('3032220061100', 35, 0),
('3032220061100', 36, 0),
('3032220061100', 37, 0),
('3038359003356', 5, 0),
('3038359003356', 6, 6),
('3038359003356', 13, 88),
('3038359003356', 14, 3),
('3038359003356', 15, 2),
('3038359003356', 16, 1),
('3038359003356', 17, 0),
('3038359003356', 18, 0),
('3038359003356', 19, 0),
('3038359003356', 20, 0),
('3038359003356', 21, 0),
('3038359003356', 22, 0),
('3038359003356', 23, 0),
('3038359003356', 24, 0),
('3038359003356', 25, 0),
('3038359003356', 26, 0),
('3038359003356', 27, 0),
('3038359003356', 28, 0),
('3038359003356', 29, 0),
('3038359003356', 30, 0),
('3166352968591', 2, 13),
('3166352968591', 6, 0),
('3166352968591', 23, 0),
('3166352968591', 38, 33),
('3166352968591', 39, 18),
('3166352968591', 40, 9),
('3166352968591', 41, 6),
('3166352968591', 42, 6),
('3166352968591', 43, 5),
('3166352968591', 44, 3),
('3166352968591', 45, 3),
('3166352968591', 46, 2),
('3166352968591', 47, 1),
('3166352968591', 48, 0),
('3166352968591', 49, 0),
('3166352968591', 50, 0),
('3166352968591', 51, 0);

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
('3032220061100', 1, 0.45, 0.135, 'mg'),
('3032220061100', 2, 4.5, 1.35, 'g'),
('3032220061100', 4, 17, 5.1, 'g'),
('3032220061100', 7, 13.5, 4.05, 'g'),
('3032220061100', 8, 2.4, 0.72, 'g'),
('3032220061100', 9, 961, 288, 'kJ'),
('3166352968591', 2, 14, 42, 'g'),
('3166352968591', 4, 5.3, 15.9, 'g'),
('3166352968591', 5, 1, 3, 'g'),
('3166352968591', 7, 7.5, 22.5, 'g'),
('3166352968591', 8, 0.67, 2.01, 'g'),
('3166352968591', 9, 570, 1710, 'kJ');

-- --------------------------------------------------------

--
-- Structure de la table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
CREATE TABLE IF NOT EXISTS `ingredients` (
  `ID_INGREDIENT` int NOT NULL AUTO_INCREMENT,
  `NOM` varchar(40) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID_INGREDIENT`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(12, 'extrait d\'acérola'),
(13, 'Nouilles'),
(14, 'amidon'),
(15, 'exhausteurs de goût'),
(16, 'e635'),
(17, 'lactose'),
(18, 'extrait de levure'),
(19, 'arômes'),
(20, 'légumes'),
(21, 'gras de poulet'),
(22, 'persil'),
(23, 'poivre'),
(24, 'sauce SOJA'),
(25, 'colorant'),
(26, 'viande de poulet'),
(27, 'correcteur d\'acidité'),
(28, 'colorants'),
(29, 'e100'),
(30, 'antioxydant'),
(31, 'LAIT écrémé reconstitué'),
(32, 'fromages'),
(33, 'beurre'),
(34, 'lactosérum'),
(35, 'protéines de LAIT'),
(36, 'sel de fonte'),
(37, 'épaississant'),
(38, 'Béchamel'),
(39, 'lasagnes'),
(40, 'viande de bœuf'),
(41, 'double concentré de tomates'),
(42, 'pulpe de tomates au jus'),
(43, 'viande de bœuf cuite'),
(44, 'oignons'),
(45, '_emmental_'),
(46, 'bouillon de légumes'),
(47, 'basilic'),
(48, '_moutarde_ de Dijon'),
(49, 'amidon de maïs'),
(50, 'ail'),
(51, 'origan');

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
('3038359003356', 17),
('3038359003356', 18),
('3038359003356', 19),
('3038359003356', 25),
('3038359003356', 26),
('3166352968591', 26),
('3038359003356', 27),
('3038359003356', 28),
('3038359003356', 29),
('3038359003356', 30),
('3038359003356', 31),
('3038359003356', 32),
('3038359003356', 33),
('3038359003356', 34),
('3032220061100', 35),
('3032220061100', 36),
('3032220061100', 37),
('3032220061100', 38),
('3032220061100', 39),
('3032220061100', 40),
('3032220061100', 41),
('3032220061100', 42),
('3166352968591', 43),
('3166352968591', 44),
('3166352968591', 45),
('3166352968591', 46),
('3166352968591', 47),
('3166352968591', 48),
('3166352968591', 49),
('3166352968591', 50);

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(8, 'Sel', 'salt'),
(9, 'Énergie', 'energy');

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
  `QUANTITE` float DEFAULT NULL,
  PRIMARY KEY (`IDENTIFIANT`,`ID_NUTRIMENT`),
  KEY `ID_NUTRIMENT` (`ID_NUTRIMENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `recommendations`
--

INSERT INTO `recommendations` (`IDENTIFIANT`, `ID_NUTRIMENT`, `QUANTITE`) VALUES
('test', 1, 0.95),
('test', 2, 1144.48),
('test', 3, 0.3),
('test', 4, 474.748),
('test', 5, 30),
('test', 6, 11),
('test', 7, 877.436),
('test', 8, 5),
('test', 9, 3051.95);

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
  `MOT_DE_PASSE` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PRENOM` varchar(40) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `NOM` varchar(40) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AGE` int DEFAULT NULL,
  `POIDS` int DEFAULT NULL,
  `TAILLE` int DEFAULT NULL,
  PRIMARY KEY (`IDENTIFIANT`),
  KEY `INDEX_NOM_PRENOM` (`PRENOM`,`NOM`),
  KEY `ID_SEXE` (`ID_SEXE`),
  KEY `ID_SPORTIF` (`ID_SPORTIF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`IDENTIFIANT`, `ID_SPORTIF`, `ID_SEXE`, `MOT_DE_PASSE`, `PRENOM`, `NOM`, `AGE`, `POIDS`, `TAILLE`) VALUES
('test', 2, 1, 'xsx', 'sqcsq', 'sqcqsc', 21, 90, 180);

--
-- Déclencheurs `utilisateurs`
--
DROP TRIGGER IF EXISTS `calcul_calcium`;
DELIMITER $$
CREATE TRIGGER `calcul_calcium` AFTER INSERT ON `utilisateurs` FOR EACH ROW BEGIN
    DECLARE new_quantite DECIMAL(10, 2);
    
    IF NEW.ID_SEXE = 1 THEN
        SET new_quantite = 0.95;
    ELSEIF NEW.ID_SEXE = 2 THEN
        SET new_quantite = 1;
    ELSE
        SET new_quantite = 0;
    END IF;

    INSERT INTO recommendations (IDENTIFIANT, ID_NUTRIMENT, QUANTITE)
    VALUES (NEW.IDENTIFIANT, 1, new_quantite);
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `calcul_cholesterol`;
DELIMITER $$
CREATE TRIGGER `calcul_cholesterol` AFTER INSERT ON `utilisateurs` FOR EACH ROW BEGIN
    INSERT INTO recommendations (IDENTIFIANT, ID_NUTRIMENT, QUANTITE)
    VALUES (NEW.IDENTIFIANT, 3, 0.3);
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `calcul_energie_et_dependant`;
DELIMITER $$
CREATE TRIGGER `calcul_energie_et_dependant` AFTER INSERT ON `utilisateurs` FOR EACH ROW BEGIN
    DECLARE new_quantite DECIMAL(10, 2);
    DECLARE new_reco DECIMAL(10, 2);
    
    IF NEW.ID_SEXE = 2 THEN
        SET new_quantite = NEW.POIDS * 10 + NEW.TAILLE * 6.25 + NEW.AGE * 5 + 5;
    ELSEIF NEW.ID_SEXE = 1 THEN
        SET new_quantite = NEW.POIDS * 10 + NEW.TAILLE * 6.25 + NEW.AGE * 5 - 161;
    ELSE
        SET new_quantite = 0;
    END IF;
    
    IF NEW.ID_SPORTIF = 1 THEN
        SET new_reco = new_quantite * 1.2;
    ELSEIF NEW.ID_SPORTIF = 2 THEN
        SET new_reco = new_quantite * 1.375;
    ELSEIF NEW.ID_SPORTIF = 3 THEN
        SET new_reco = new_quantite * 1.55;
    ELSEIF NEW.ID_SPORTIF = 4 THEN
        SET new_reco = new_quantite * 1.725;
    ELSE
        SET new_reco = new_quantite;
    END IF;

    INSERT INTO recommendations (IDENTIFIANT, ID_NUTRIMENT, QUANTITE)
    VALUES (NEW.IDENTIFIANT, 9, new_reco);
    
    INSERT INTO recommendations (IDENTIFIANT, ID_NUTRIMENT, QUANTITE)
    VALUES (NEW.IDENTIFIANT, 2, 1.5*new_reco/4);
    
    INSERT INTO recommendations (IDENTIFIANT, ID_NUTRIMENT, QUANTITE)
    VALUES (NEW.IDENTIFIANT, 7, 1.15*new_reco/4);
    
    INSERT INTO recommendations (IDENTIFIANT, ID_NUTRIMENT, QUANTITE)
    VALUES (NEW.IDENTIFIANT, 4, 1.4*new_reco/9);
    
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `calcul_fer`;
DELIMITER $$
CREATE TRIGGER `calcul_fer` AFTER INSERT ON `utilisateurs` FOR EACH ROW BEGIN
    INSERT INTO recommendations (IDENTIFIANT, ID_NUTRIMENT, QUANTITE)
    VALUES (NEW.IDENTIFIANT, 6, 11);
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `calcul_fibres`;
DELIMITER $$
CREATE TRIGGER `calcul_fibres` AFTER INSERT ON `utilisateurs` FOR EACH ROW BEGIN
    INSERT INTO recommendations (IDENTIFIANT, ID_NUTRIMENT, QUANTITE)
    VALUES (NEW.IDENTIFIANT, 5, 30);
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `calcul_sel`;
DELIMITER $$
CREATE TRIGGER `calcul_sel` AFTER INSERT ON `utilisateurs` FOR EACH ROW BEGIN
    INSERT INTO recommendations (IDENTIFIANT, ID_NUTRIMENT, QUANTITE)
    VALUES (NEW.IDENTIFIANT, 8, 5);
END
$$
DELIMITER ;

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
