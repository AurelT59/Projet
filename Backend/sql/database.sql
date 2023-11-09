-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 09 nov. 2023 à 10:10
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
('3038359003356', 'banzaï noodle saveur poulet', 60, 340, 'Lustucru,Panzani', 'c'),
('3166352968591', 'Lasagnes à la bolognaise', 300, 300, 'Marie', 'c'),
('3168930008958', 'Chips Nature', 150, 30, 'Lay\'s', 'd'),
('3242272261650', 'XtremBox - Radiatori  Bœuf Sauce au poivre', 400, 400, 'Sodebo, pasta xtrem', 'c'),
('8076800195057', 'Spaghetti n.5', 500, 85, 'Barilla', 'a'),
('8076809513722', 'Tomatensosse Basilico', 400, 100, 'Barilla', 'a');

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
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`ID_CATEGORIES`, `NOM`) VALUES
(18, ' Aliments d\'origine végétale'),
(58, ' Amuse-gueules'),
(88, ' Box'),
(25, ' Céréales et dérivés'),
(19, ' Céréales et pommes de terre'),
(60, ' Chips'),
(61, ' Chips de pommes de terre'),
(62, ' Chips de pommes de terre à l\'huile de tournesol'),
(59, ' Chips et frites'),
(63, ' en:Aliments d\'origine végétale'),
(64, ' en:Aliments et boissons à base de végétaux'),
(65, ' en:Aliments-d-origine-vegetale'),
(66, ' en:Aliments-et-boissons-a-base-de-vegetaux'),
(67, ' en:Amuse-gueules'),
(74, ' en:Céréales et pommes de terre'),
(68, ' en:Cereales-et-pommes-de-terre'),
(69, ' en:Chips'),
(70, ' en:Chips de pommes de terre'),
(71, ' en:Chips et frites'),
(72, ' en:Chips-de-pommes-de-terre'),
(73, ' en:Chips-et-frites'),
(81, ' en:Food'),
(82, ' en:groceries'),
(48, ' en:Meat lasagnas'),
(75, ' en:Snacks salés'),
(76, ' en:Snacks-sales'),
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
(85, ' Pâtes à la viande'),
(28, ' Pâtes alimentaires'),
(51, ' Pâtes alimentaires de céréales'),
(87, ' Pâtes au boeuf'),
(53, ' Pâtes de blé dur'),
(84, ' Pâtes instantanées'),
(52, ' Pâtes sèches'),
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
(78, ' Sauces'),
(86, ' Sauces au poivre'),
(79, ' Sauces tomate'),
(80, ' Sauces tomates au basilic'),
(56, ' Snacks'),
(57, ' Snacks salés'),
(31, ' Soupes'),
(34, ' Soupes déshydratées'),
(54, ' Spaghetti'),
(55, ' Spaghettis de blé dur'),
(83, ' Viandes et dérivés'),
(17, 'Aliments et boissons à base de végétaux'),
(77, 'Condiments'),
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
('3166352968591', 51, 0),
('3168930008958', 6, 3),
('3168930008958', 70, 65),
('3168930008958', 71, 22),
('3168930008958', 72, 7),
('3168930008958', 73, 3),
('3242272261650', 2, 6),
('3242272261650', 6, 0),
('3242272261650', 23, 0),
('3242272261650', 77, 0),
('3242272261650', 78, 54),
('3242272261650', 79, 23),
('3242272261650', 80, 11),
('3242272261650', 81, 3),
('3242272261650', 82, 1),
('3242272261650', 83, 1),
('3242272261650', 84, 0),
('3242272261650', 85, 0),
('8076800195057', 2, 25),
('8076800195057', 69, 75),
('8076809513722', 5, 1),
('8076809513722', 6, 0),
('8076809513722', 44, 6),
('8076809513722', 47, 2),
('8076809513722', 74, 72),
('8076809513722', 75, 14),
('8076809513722', 76, 5),
('8076809513722', 77, 0);

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
('3166352968591', 2, 14, 42, 'g'),
('3166352968591', 4, 5.3, 15.9, 'g'),
('3166352968591', 5, 1, 3, 'g'),
('3166352968591', 7, 7.5, 22.5, 'g'),
('3166352968591', 8, 0.67, 2.01, 'g'),
('3166352968591', 9, 570, 1710, 'kJ'),
('3168930008958', 2, 53, 15.9, 'g'),
('3168930008958', 4, 34, 10.2, 'g'),
('3168930008958', 5, 4.2, 1.26, 'g'),
('3168930008958', 7, 6.3, 1.89, 'g'),
('3168930008958', 8, 1.1, 0.33, 'g'),
('3168930008958', 9, 2305, 692, 'kJ'),
('3242272261650', 2, 22, 88, 'g'),
('3242272261650', 4, 4.7, 18.8, 'g'),
('3242272261650', 5, 1.3, 5.2, 'g'),
('3242272261650', 7, 8.6, 34.4, 'g'),
('3242272261650', 8, 0.48, 1.92, 'g'),
('3242272261650', 9, 698, 2790, 'kJ'),
('8076800195057', 2, 71, 60.3, 'g'),
('8076800195057', 4, 2, 1.7, 'g'),
('8076800195057', 5, 3, 2.55, 'g'),
('8076800195057', 7, 13, 11.1, 'g'),
('8076800195057', 8, 0.01, 0.0085, 'g'),
('8076800195057', 9, 1521, 1290, 'kJ'),
('8076809513722', 2, 7.6, 7.6, 'g'),
('8076809513722', 4, 2.6, 2.6, 'g'),
('8076809513722', 5, 1.9, 1.9, 'g'),
('8076809513722', 7, 1.6, 1.6, 'g'),
('8076809513722', 8, 0.9, 0.9, 'g'),
('8076809513722', 9, 268, 268, 'kJ');

-- --------------------------------------------------------

--
-- Structure de la table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
CREATE TABLE IF NOT EXISTS `ingredients` (
  `ID_INGREDIENT` int NOT NULL AUTO_INCREMENT,
  `NOM` varchar(40) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID_INGREDIENT`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(51, 'origan'),
(52, 'pork'),
(53, 'water'),
(54, 'pork fat'),
(55, 'whey'),
(56, 'salt'),
(57, 'milk protein'),
(58, 'dextrose'),
(59, 'wheat fiber'),
(60, 'yeast'),
(61, 'pea protein'),
(62, 'flavor'),
(63, 'color'),
(64, 'paprika extract'),
(65, 'antioxidant'),
(66, 'preservative'),
(67, 'ferment'),
(68, 'smoke'),
(69, 'Semoule de BLÉ dur'),
(70, 'Pommes de terre'),
(71, 'huiles végétales de tournesol'),
(72, 'huiles végétales de colza'),
(73, 'maïs'),
(74, 'Pulpe de tomates'),
(75, 'concentré de tomates'),
(76, 'huile de tournesol'),
(77, 'arôme naturel'),
(78, 'Radiatori cuits'),
(79, 'crème fraiche légère'),
(80, 'viande de boeuf'),
(81, 'lait écrémé'),
(82, 'fécule de manioc'),
(83, 'conservateurs'),
(84, 'e2621'),
(85, 'Boeuf');

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `journal`
--

INSERT INTO `journal` (`ID_JOURNAL`, `CODE`, `IDENTIFIANT`, `QUANTITE`, `DATE`) VALUES
(5, '8076809513722', 'lil', 2, '2023-11-05'),
(10, '8076800195057', 'lil', 1, '2023-11-05'),
(11, '3038359003356', 'lil', 1, '2023-11-07'),
(12, '3166352968591', 'lil', 1, '2023-11-08'),
(13, '3242272261650', 'lil', 2, '2023-11-09');

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
('3168930008958', 17),
('8076800195057', 17),
('3038359003356', 18),
('3168930008958', 18),
('8076800195057', 18),
('3038359003356', 19),
('3168930008958', 19),
('8076800195057', 19),
('3038359003356', 25),
('8076800195057', 25),
('3038359003356', 26),
('3166352968591', 26),
('3242272261650', 26),
('3038359003356', 27),
('3038359003356', 28),
('8076800195057', 28),
('3038359003356', 29),
('3038359003356', 30),
('3038359003356', 31),
('3038359003356', 32),
('3038359003356', 33),
('3038359003356', 34),
('3166352968591', 43),
('3166352968591', 44),
('3242272261650', 44),
('3166352968591', 45),
('3242272261650', 45),
('3166352968591', 46),
('3166352968591', 47),
('3242272261650', 47),
('3166352968591', 48),
('3166352968591', 49),
('3242272261650', 49),
('3166352968591', 50),
('8076800195057', 51),
('8076800195057', 52),
('8076800195057', 53),
('8076800195057', 54),
('8076800195057', 55),
('3168930008958', 56),
('3168930008958', 57),
('3168930008958', 58),
('3168930008958', 59),
('3168930008958', 60),
('3168930008958', 61),
('3168930008958', 62),
('3168930008958', 63),
('3168930008958', 64),
('3168930008958', 65),
('3168930008958', 66),
('3168930008958', 67),
('3168930008958', 68),
('3168930008958', 69),
('3168930008958', 70),
('3168930008958', 71),
('3168930008958', 72),
('3168930008958', 73),
('3168930008958', 74),
('3168930008958', 75),
('3168930008958', 76),
('3242272261650', 77),
('8076809513722', 77),
('3242272261650', 78),
('8076809513722', 78),
('8076809513722', 79),
('8076809513722', 80),
('8076809513722', 81),
('8076809513722', 82),
('3242272261650', 83),
('3242272261650', 84),
('3242272261650', 85),
('3242272261650', 86),
('3242272261650', 87),
('3242272261650', 88);

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
('lil', 1, 0.95),
('lil', 2, 860.58),
('lil', 3, 0.3),
('lil', 4, 356.981),
('lil', 5, 30),
('lil', 6, 11),
('lil', 7, 659.778),
('lil', 8, 5),
('lil', 9, 2294.88);

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
('lil', 2, 1, '$2y$10$FIN8qMwzaSCxHsett1I0TuMgQqWzWrl53w820cMIYsyMvdkn.mBL2', 'Aurel', 'Tera', 21, 60, 180);

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
