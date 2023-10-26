-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 26 oct. 2023 à 10:21
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
-- Base de données : `projet`
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
  `NUTRISCORE_GRADE` varchar(256) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CATEGORIES` varchar(256) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `aliments`
--

INSERT INTO `aliments` (`CODE`, `PRODUIT`, `QUANTITE`, `PORTION`, `MARQUE`, `ENERGY`, `ENERGY_UNIT`, `NUTRISCORE_GRADE`, `CATEGORIES`) VALUES
('3095756193011', 'Blanc de Poulet - Doré au Four', 160, 40, 'Fleury Michon', 416, 'kJ', 'b', 'Viandes et dérivés, Charcuteries, Charcuteries cuites, Blancs de volaille en tranches, Blancs de poulet en tranches, Blancs de poulet doré au four'),
('3228857000166', 'Pain 100% mie complet', 500, 0, 'Harrys', 1053, 'kJ', 'c', 'Aliments et boissons à base de végétaux, Aliments d\'origine végétale, Céréales et pommes de terre, Pains, Pains de mie, Pains de mie sans croûte, Pains complets, Pains de mie complet'),
('3608580784524', 'dessert fruitier pommes nature', 1600, 100, 'Andros', 310, 'kcal', 'a', 'Aliments et boissons à base de végétaux, Aliments d\'origine végétale, Desserts, Aliments à base de fruits et de légumes, Fruits et produits dérivés, Compotes, Compotes de pomme, Compotes pommes nature');

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
('3095756193011', 9, 3),
('3095756193011', 10, 0),
('3095756193011', 11, 94),
('3095756193011', 12, 1),
('3095756193011', 13, 1),
('3095756193011', 14, 0),
('3095756193011', 15, 0),
('3095756193011', 16, 0),
('3095756193011', 17, 0),
('3228857000166', 9, 3),
('3228857000166', 19, 6),
('3228857000166', 20, 37),
('3228857000166', 21, 21),
('3228857000166', 22, 18),
('3228857000166', 23, 12),
('3228857000166', 24, 1),
('3228857000166', 25, 1),
('3228857000166', 26, 0),
('3228857000166', 27, 0),
('3228857000166', 28, 0),
('3228857000166', 29, 0),
('3608580784524', 17, 2),
('3608580784524', 18, 93),
('3608580784524', 19, 5);

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
  `UNITE` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`CODE`,`ID_NUTRIMENT`),
  KEY `ID_NUTRIMENT` (`ID_NUTRIMENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `composition_nutritive`
--

INSERT INTO `composition_nutritive` (`CODE`, `ID_NUTRIMENT`, `VALEUR_100`, `VALEUR_PORTION`, `UNITE`) VALUES
('3095756193011', 3, 0.5, 0.2, 'g'),
('3095756193011', 5, 1.6, 0.64, 'g'),
('3095756193011', 6, 0, 0, 'g'),
('3095756193011', 8, 21, 8.4, 'g'),
('3095756193011', 9, 1.8, 0.72, 'g'),
('3228857000166', 3, 39.7, 0, 'g'),
('3228857000166', 5, 4.3, 0, 'g'),
('3228857000166', 6, 7.1, 0, 'g'),
('3228857000166', 8, 7.2, 0, 'g'),
('3228857000166', 9, 1.1, 0, 'g'),
('3608580784524', 3, 17, 17, 'g'),
('3608580784524', 5, 0.1, 0.1, 'g'),
('3608580784524', 6, 1.3, 1.3, 'g'),
('3608580784524', 8, 0.3, 0.3, 'g'),
('3608580784524', 9, 0, 0, 'g');

-- --------------------------------------------------------

--
-- Structure de la table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
CREATE TABLE IF NOT EXISTS `ingredients` (
  `ID_INGREDIENT` int NOT NULL AUTO_INCREMENT,
  `NOM` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`ID_INGREDIENT`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `ingredients`
--

INSERT INTO `ingredients` (`ID_INGREDIENT`, `NOM`) VALUES
(1, 'Pommes de terre'),
(2, 'huiles végétales'),
(3, 'farine de riz'),
(4, 'amidon de BLÉ'),
(5, 'farine de maïs'),
(6, 'assaisonnement crème acidulée et oignon'),
(7, 'émulsifiant'),
(8, 'maltodextrine'),
(9, 'sel'),
(10, 'colorant'),
(11, 'Filet de poulet'),
(12, 'bouillons'),
(13, 'concentrés de carotte'),
(14, '_céleri_'),
(15, 'dextrose de maïs'),
(16, 'ferments'),
(17, 'antioxydant'),
(18, 'pommes'),
(19, 'sucre'),
(20, 'Farine complète de blé'),
(21, 'eau'),
(22, 'farine de blé'),
(23, 'huile de colza'),
(24, 'arôme'),
(25, 'gluten de blé'),
(26, 'farine de seigle maltée'),
(27, 'levure'),
(28, 'vinaigre'),
(29, 'extrait d\'acérola');

-- --------------------------------------------------------

--
-- Structure de la table `journal`
--

DROP TABLE IF EXISTS `journal`;
CREATE TABLE IF NOT EXISTS `journal` (
  `ID_JOURNAL` int NOT NULL,
  `CODE` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `IDENTIFIANT` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `QUANTITE` int DEFAULT NULL,
  `DATE` date DEFAULT NULL,
  PRIMARY KEY (`ID_JOURNAL`),
  KEY `CODE` (`CODE`),
  KEY `IDENTIFIANT` (`IDENTIFIANT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `nutriments`
--

DROP TABLE IF EXISTS `nutriments`;
CREATE TABLE IF NOT EXISTS `nutriments` (
  `ID_NUTRIMENT` int NOT NULL AUTO_INCREMENT,
  `NOM` varchar(40) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `NOM_EN` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`ID_NUTRIMENT`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `nutriments`
--

INSERT INTO `nutriments` (`ID_NUTRIMENT`, `NOM`, `NOM_EN`) VALUES
(2, 'Calcium', 'calcium'),
(3, 'Glucides', 'carbohydrates'),
(4, 'Cholestérol', 'cholesterol'),
(5, 'Matières grasses', 'fat'),
(6, 'Fibres', 'fiber'),
(7, 'Fer', 'iron'),
(8, 'Protéines', 'proteins'),
(9, 'Sel', 'salt');

-- --------------------------------------------------------

--
-- Structure de la table `pratique_sportive`
--

DROP TABLE IF EXISTS `pratique_sportive`;
CREATE TABLE IF NOT EXISTS `pratique_sportive` (
  `ID_SPORTIF` int NOT NULL,
  `NOM` varchar(40) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID_SPORTIF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `ID_SEXE` int NOT NULL,
  `NOM` varchar(40) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID_SEXE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  ADD CONSTRAINT `composition_ibfk_2` FOREIGN KEY (`ID_INGREDIENT`) REFERENCES `ingredients` (`ID_INGREDIENT`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `composition_nutritive`
--
ALTER TABLE `composition_nutritive`
  ADD CONSTRAINT `composition_nutritive_ibfk_1` FOREIGN KEY (`CODE`) REFERENCES `aliments` (`CODE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `composition_nutritive_ibfk_2` FOREIGN KEY (`ID_NUTRIMENT`) REFERENCES `nutriments` (`ID_NUTRIMENT`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `journal`
--
ALTER TABLE `journal`
  ADD CONSTRAINT `journal_ibfk_1` FOREIGN KEY (`CODE`) REFERENCES `aliments` (`CODE`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `journal_ibfk_2` FOREIGN KEY (`IDENTIFIANT`) REFERENCES `utilisateurs` (`IDENTIFIANT`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `recommendations`
--
ALTER TABLE `recommendations`
  ADD CONSTRAINT `recommendations_ibfk_1` FOREIGN KEY (`IDENTIFIANT`) REFERENCES `utilisateurs` (`IDENTIFIANT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `recommendations_ibfk_2` FOREIGN KEY (`ID_NUTRIMENT`) REFERENCES `nutriments` (`ID_NUTRIMENT`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD CONSTRAINT `utilisateurs_ibfk_1` FOREIGN KEY (`ID_SEXE`) REFERENCES `sexe` (`ID_SEXE`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `utilisateurs_ibfk_2` FOREIGN KEY (`ID_SPORTIF`) REFERENCES `pratique_sportive` (`ID_SPORTIF`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
