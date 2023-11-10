-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 10 nov. 2023 à 14:49
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
  `CODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PRODUIT` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `QUANTITE` float DEFAULT NULL,
  `PORTION` float DEFAULT NULL,
  `MARQUE` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `NUTRISCORE_GRADE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`CODE`),
  KEY `INDEX_PRODUIT` (`PRODUIT`(250))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `ID_CATEGORIES` int NOT NULL AUTO_INCREMENT,
  `NOM` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID_CATEGORIES`),
  KEY `INDEX_NOM_CATEGORIES` (`NOM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `composition`
--

DROP TABLE IF EXISTS `composition`;
CREATE TABLE IF NOT EXISTS `composition` (
  `CODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ID_INGREDIENT` int NOT NULL,
  `POURCENTAGE` int DEFAULT NULL,
  PRIMARY KEY (`CODE`,`ID_INGREDIENT`),
  KEY `ID_INGREDIENT` (`ID_INGREDIENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `composition_nutritive`
--

DROP TABLE IF EXISTS `composition_nutritive`;
CREATE TABLE IF NOT EXISTS `composition_nutritive` (
  `CODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ID_NUTRIMENT` int NOT NULL,
  `VALEUR_100` float DEFAULT NULL,
  `VALEUR_PORTION` float DEFAULT NULL,
  `UNITE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`CODE`,`ID_NUTRIMENT`),
  KEY `ID_NUTRIMENT` (`ID_NUTRIMENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
CREATE TABLE IF NOT EXISTS `ingredients` (
  `ID_INGREDIENT` int NOT NULL AUTO_INCREMENT,
  `NOM` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID_INGREDIENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `journal`
--

DROP TABLE IF EXISTS `journal`;
CREATE TABLE IF NOT EXISTS `journal` (
  `ID_JOURNAL` int NOT NULL AUTO_INCREMENT,
  `CODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `IDENTIFIANT` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
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
  `CODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ID_CATEGORIES` int NOT NULL,
  PRIMARY KEY (`CODE`,`ID_CATEGORIES`),
  KEY `ID_CATEGORIES` (`ID_CATEGORIES`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `nutriments`
--

DROP TABLE IF EXISTS `nutriments`;
CREATE TABLE IF NOT EXISTS `nutriments` (
  `ID_NUTRIMENT` int NOT NULL AUTO_INCREMENT,
  `NOM` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `NOM_EN` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID_NUTRIMENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `pratique_sportive`
--

DROP TABLE IF EXISTS `pratique_sportive`;
CREATE TABLE IF NOT EXISTS `pratique_sportive` (
  `ID_SPORTIF` int NOT NULL AUTO_INCREMENT,
  `NOM` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID_SPORTIF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `recommendations`
--

DROP TABLE IF EXISTS `recommendations`;
CREATE TABLE IF NOT EXISTS `recommendations` (
  `IDENTIFIANT` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ID_NUTRIMENT` int NOT NULL,
  `QUANTITE` float DEFAULT NULL,
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
  `NOM` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID_SEXE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

DROP TABLE IF EXISTS `utilisateurs`;
CREATE TABLE IF NOT EXISTS `utilisateurs` (
  `IDENTIFIANT` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ID_SPORTIF` int NOT NULL,
  `ID_SEXE` int DEFAULT NULL,
  `MOT_DE_PASSE` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PRENOM` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `NOM` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AGE` int DEFAULT NULL,
  `POIDS` int DEFAULT NULL,
  `TAILLE` int DEFAULT NULL,
  PRIMARY KEY (`IDENTIFIANT`),
  KEY `INDEX_NOM_PRENOM` (`PRENOM`,`NOM`),
  KEY `ID_SEXE` (`ID_SEXE`),
  KEY `ID_SPORTIF` (`ID_SPORTIF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
DROP TRIGGER IF EXISTS `calcul_calcium_update`;
DELIMITER $$
CREATE TRIGGER `calcul_calcium_update` AFTER UPDATE ON `utilisateurs` FOR EACH ROW BEGIN
    DECLARE new_quantite DECIMAL(10, 2);
    
    IF NEW.ID_SEXE = 1 THEN
        SET new_quantite = 0.95;
    ELSEIF NEW.ID_SEXE = 2 THEN
        SET new_quantite = 1;
    ELSE
        SET new_quantite = 0;
    END IF;

    UPDATE recommendations SET QUANTITE=new_quantite
    WHERE IDENTIFIANT=NEW.IDENTIFIANT AND ID_NUTRIMENT=1;
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
DROP TRIGGER IF EXISTS `calcul_cholesterol_update`;
DELIMITER $$
CREATE TRIGGER `calcul_cholesterol_update` AFTER UPDATE ON `utilisateurs` FOR EACH ROW BEGIN
    UPDATE recommendations SET QUANTITE=0.3
    WHERE IDENTIFIANT=NEW.IDENTIFIANT AND ID_NUTRIMENT=3;
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
    VALUES (NEW.IDENTIFIANT, 2, 0.5*new_reco/4);
    
    INSERT INTO recommendations (IDENTIFIANT, ID_NUTRIMENT, QUANTITE)
    VALUES (NEW.IDENTIFIANT, 7, 0.15*new_reco/4);
    
    INSERT INTO recommendations (IDENTIFIANT, ID_NUTRIMENT, QUANTITE)
    VALUES (NEW.IDENTIFIANT, 4, 0.4*new_reco/9);
    
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `calcul_energie_et_dependant_update`;
DELIMITER $$
CREATE TRIGGER `calcul_energie_et_dependant_update` AFTER UPDATE ON `utilisateurs` FOR EACH ROW BEGIN
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

    UPDATE recommendations SET QUANTITE=new_reco
    WHERE IDENTIFIANT=NEW.IDENTIFIANT AND ID_NUTRIMENT=9;
    
    UPDATE recommendations SET QUANTITE=0.5*new_reco/4
    WHERE IDENTIFIANT=NEW.IDENTIFIANT AND ID_NUTRIMENT=2;
    
    UPDATE recommendations SET QUANTITE=0.15*new_reco/4
    WHERE IDENTIFIANT=NEW.IDENTIFIANT AND ID_NUTRIMENT=7;
    
    UPDATE recommendations SET QUANTITE=0.4*new_reco/9
    WHERE IDENTIFIANT=NEW.IDENTIFIANT AND ID_NUTRIMENT=4;
    
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
DROP TRIGGER IF EXISTS `calcul_fer_update`;
DELIMITER $$
CREATE TRIGGER `calcul_fer_update` AFTER UPDATE ON `utilisateurs` FOR EACH ROW BEGIN
    UPDATE recommendations SET QUANTITE=11
    WHERE IDENTIFIANT=NEW.IDENTIFIANT AND ID_NUTRIMENT=6;
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
DROP TRIGGER IF EXISTS `calcul_fibres_update`;
DELIMITER $$
CREATE TRIGGER `calcul_fibres_update` AFTER UPDATE ON `utilisateurs` FOR EACH ROW BEGIN
    UPDATE recommendations SET QUANTITE=30
    WHERE IDENTIFIANT=NEW.IDENTIFIANT AND ID_NUTRIMENT=5;
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
DROP TRIGGER IF EXISTS `calcul_sel_update`;
DELIMITER $$
CREATE TRIGGER `calcul_sel_update` AFTER UPDATE ON `utilisateurs` FOR EACH ROW BEGIN
    UPDATE recommendations SET QUANTITE=5
    WHERE IDENTIFIANT=NEW.IDENTIFIANT AND ID_NUTRIMENT=8;
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
