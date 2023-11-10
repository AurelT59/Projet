-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 10 nov. 2023 à 14:21
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

--
-- Déchargement des données de la table `aliments`
--

INSERT INTO `aliments` (`CODE`, `PRODUIT`, `QUANTITE`, `PORTION`, `MARQUE`, `NUTRISCORE_GRADE`) VALUES
('3017620422003', 'Nutella', 400, 15, 'Ferrero', 'e'),
('3017760756198', 'Granola L\'original Gros éclats de Chocolat', 184, 23, 'Lu,Mondelèz International', 'e'),
('3019081239237', 'Thon entier naturel albacore MSC', 160, 112, 'Petit Navire', 'a'),
('3021760400012', 'Pom\'Potes Pomme', 90, 90, 'Materne,Pom\' Potes', 'a'),
('3023290797365', 'Crème Brûlée avec Sachet d\'Éclats de Caramel', 400, 98, 'La Laitière,Nestlé,LNUF Marques', 'd'),
('3033490005221', 'Danette Mousse Chocolat', 240, 60, 'Danone,Danette', 'd'),
('3038359011436', 'Panzani sauce provencale nat 210g f12', 210, 52, 'Panzani', 'a'),
('3083680025881', 'Maïs sans sucres ajoutés', 285, 140, 'Bonduelle', 'b'),
('3083680918497', 'Lentilles Préparées', 460, 150, 'Cassegrain', 'b'),
('3083681066838', 'Purée délice - haricots verts, courgettes, épinards, pois, crème - 4 saveurs', 780, 150, 'Bonduelle', 'a'),
('3083681095319', 'Petits Pois et Carottes', 400, 200, 'Cassegrain', 'a'),
('3083681120578', 'Champignon', 230, 115, 'Bonduelle', 'a'),
('3103220043158', 'Chamallows Choco', 160, 40, 'Haribo', 'e'),
('3168930008958', 'Nature', 150, 30, 'Lay\'s', 'd'),
('3181232220286', 'Steaks hachés', 260, 130, 'Charal', 'b'),
('3223920700127', 'Couscous Grain Moyen', 500, 50, 'Ferrero', 'a'),
('3228021170046', 'Emmental râpé', 200, 30, 'Président,Lactalis', 'd'),
('3228857000166', 'Pain 100% mie complet', 500, 50, 'Harrys', 'c'),
('3240931545059', 'Gnocchi à poêler', 515, 150, 'Lustucru', 'c'),
('3240931545264', 'GIRASOLI RICOTTA EPINARD', 250, 125, 'Lustucru Lustucru selection', 'd'),
('3266980033613', 'L\'escalope Cordon Bleu Authentique', 200, 100, 'Le Gaulois', 'b'),
('3292070008568', 'Tzatziki bio', 160, 40, 'L\'atelier Blini', 'c'),
('3294580102019', 'Reblochon de Savoie AOP Fruitier', 450, 50, 'Pochat fils', 'd'),
('3322680010818', 'Crêpes Chocolat x 15', 480, 32, 'Whaou !', 'e'),
('3329770063624', 'Panier de Yoplait', 2080, 130, 'Yoplait, Panier recette classique', 'c'),
('3329770075405', 'Yop Parfum vanille', 1080, 200, 'Yoplait', 'd'),
('3347761000670', 'Bananes', 0, 120, 'la banane française', 'c'),
('3451790988677', 'Le Beurre Tendre Doux', 250, 10, 'Elle & Vire,Savencia', 'e'),
('3504182920011', 'Tomates Gourmet', 250, 250, 'Azura', 'a'),
('3608580758686', 'Confiture Fraises', 320, 320, 'Bonne Maman', 'd'),
('3760032001884', 'Frites à la graisse de canard', 500, 100, 'Pom Bistro', 'c'),
('40884004', 'Pavés de saumon ASC', 280, 140, 'Lidl', 'a'),
('5000159492966', 'M&M\'s Cacahuètes - Pack familial', 550, 45, 'Mars,M&M\'s', 'e'),
('5053990155385', 'Sour cream & onion', 195, 30, 'Pringles', 'd'),
('7613034223852', 'BUITONI FRAICH\'UP pizza surgelée 4 Fromages 600g', 600, 150, 'Buitoni,Fraich\'up', 'c'),
('7613034626844', 'Céréales Chocapic', 430, 30, 'Nestlé,Chocapic', 'c'),
('7613035040823', 'Nestlé Dessert', 205, 25, 'Nestlé,Nestlé Dessert', 'e'),
('7613035336131', 'Le Bon Paris a l\'Etouffée', 170, 42, 'Herta', 'c'),
('7613036213127', 'HERTA Lardons allumettes fumés sans antibiotique', 150, 75, 'herta', 'e'),
('7613038437439', 'KNACKI POULET conservation sans nitrite', 210, 70, 'Herta', 'd'),
('8076800195057', 'Spaghetti n.5', 500, 85, 'Barilla', 'a');

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
) ENGINE=InnoDB AUTO_INCREMENT=1126 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`ID_CATEGORIES`, `NOM`) VALUES
(865, ' Aliments à base de fruits et de légumes'),
(1008, ' Aliments à base de plantes en conserve'),
(1086, ' Aliments à base de plantes surgelés'),
(858, ' Aliments d\'origine végétale'),
(1004, ' Allumettes de porc'),
(925, ' Amuse-gueules'),
(954, ' Animal fats'),
(869, ' Bananes'),
(1119, ' Biscuits'),
(1042, ' Biscuits apéritifs'),
(1120, ' Biscuits au chocolat'),
(1118, ' Biscuits et gâteaux'),
(1105, ' Boissons fermentées'),
(1103, ' Boissons lactées'),
(1106, ' Boissons lactées fermentées'),
(1092, ' Bonbons'),
(1075, ' Bonbons de chocolat'),
(960, ' Butter-82-fat-unsalted-easy-to-spread'),
(957, ' Butters'),
(964, ' Bœuf'),
(1077, ' Cacahuètes au chocolat'),
(1071, ' Cacao et dérivés'),
(884, ' Céréales au chocolat'),
(1019, ' Céréales en conserve'),
(1017, ' Céréales en grains'),
(882, ' Céréales et dérivés'),
(859, ' Céréales et pommes de terre'),
(886, ' Céréales extrudées'),
(885, ' Céréales pour petit déjeuner enrichies en vitamines et minéraux'),
(883, ' Céréales pour petit-déjeuner'),
(1011, ' Champignons'),
(1014, ' Champignons de Paris émincés en conserve'),
(1013, ' Champignons de Paris en conserve'),
(1012, ' Champignons en conserve'),
(1010, ' Champignons et produits dérivés'),
(1002, ' Charcuteries'),
(1003, ' Charcuteries diverses'),
(915, ' Chicken cordons bleus'),
(927, ' Chips'),
(928, ' Chips de pommes de terre'),
(929, ' Chips de pommes de terre à l\'huile de tournesol'),
(926, ' Chips et frites'),
(919, ' Chocolates'),
(918, ' Cocoa and its products'),
(876, ' Compotes'),
(879, ' Compotes à boire'),
(880, ' Compotes allégées'),
(877, ' Compotes de pomme'),
(878, ' Compotes pommes nature'),
(1072, ' Confiseries'),
(1078, ' Confiseries au chocolat dragéifiées'),
(1074, ' Confiseries chocolatées'),
(1007, ' Conserves'),
(1121, ' Cookies'),
(914, ' Cordons bleus'),
(1000, ' Couscous'),
(1111, ' Crèmes brûlées'),
(1114, ' Crêpes'),
(1113, ' Crêpes et galettes'),
(1115, ' Crêpes fourrées'),
(1117, ' Crêpes fourrées au chocolat'),
(1116, ' Crêpes fourrées sucrées'),
(956, ' Dairy spread'),
(921, ' Dark chocolate bar for cooking with more than 40% cocoa'),
(920, ' Dark chocolates'),
(875, ' Desserts'),
(1109, ' Desserts au chocolat'),
(1102, ' Desserts lactés'),
(1104, ' Desserts lactés fermentés'),
(1124, ' Desserts lactés fermentés aux fruits'),
(895, ' Emmentals'),
(897, ' Emmentals râpés'),
(930, ' en:Aliments d\'origine végétale'),
(931, ' en:Aliments et boissons à base de végétaux'),
(932, ' en:Aliments-d-origine-vegetale'),
(933, ' en:Aliments-et-boissons-a-base-de-vegetaux'),
(934, ' en:Amuse-gueules'),
(905, ' en:aoc-cheeses'),
(941, ' en:Céréales et pommes de terre'),
(935, ' en:Cereales-et-pommes-de-terre'),
(936, ' en:Chips'),
(937, ' en:Chips de pommes de terre'),
(938, ' en:Chips et frites'),
(939, ' en:Chips-de-pommes-de-terre'),
(940, ' en:Chips-et-frites'),
(873, ' en:groceries'),
(906, ' en:labeled-cheeses'),
(988, ' en:Pâtes farcies'),
(989, ' en:Pâtes farcies au fromage'),
(985, ' en:Pates farcies aux légumes'),
(990, ' en:Pâtes fraîches farcies au fromage et aux légumes'),
(987, ' en:Plats à base de pâtes'),
(986, ' en:Plats préparés'),
(1044, ' en:salty-snacks-made-from-potato'),
(942, ' en:Snacks salés'),
(943, ' en:Snacks-sales'),
(951, ' Fats'),
(961, ' fr:Beurres tendres'),
(898, ' Frais'),
(1097, ' Frites'),
(1099, ' Frites surgelées'),
(1098, ' Frites surgelées à cuire au four'),
(892, ' Fromages'),
(1046, ' Fromages à pâte filée'),
(894, ' Fromages à pâte pressée cuite'),
(902, ' Fromages à pâte pressée non cuite'),
(903, ' Fromages au lait cru'),
(900, ' Fromages de France'),
(901, ' Fromages de montagne'),
(893, ' Fromages de vache'),
(1045, ' Fromages italiens'),
(896, ' Fromages râpés'),
(867, ' Fruits'),
(1076, ' Fruits à coques enrobés de chocolat'),
(1073, ' Fruits à coques et dérivés'),
(866, ' Fruits et produits dérivés'),
(868, ' Fruits tropicaux'),
(971, ' Galettes à la viande'),
(991, ' Gnocchi'),
(993, ' Gnocchi de pommes de terre'),
(995, ' Gnocchi de pommes de terre cuits'),
(992, ' Gnocchi de semoule de blé dur'),
(996, ' Gnocchis à la semoule cuits'),
(994, ' Gnocchis cuits'),
(1015, ' Graines'),
(1036, ' Graines de légumineuses'),
(1093, ' Guimauves'),
(1094, ' Guimauves enrobées de chocolat'),
(1068, ' Hams'),
(1054, ' Knacks industrielles'),
(1005, ' Lardons de porc'),
(1006, ' Lardons de porc fumés'),
(1016, ' Légumes en conserve'),
(1009, ' Légumes et dérivés'),
(1088, ' Légumes préparés'),
(1087, ' Légumes surgelés'),
(1041, ' Legumes-preparees'),
(1035, ' Légumineuses'),
(1122, ' Légumineuses en conserve'),
(1034, ' Légumineuses et dérivés'),
(1037, ' Légumineuses sèches'),
(1038, ' Lentilles'),
(1040, ' Lentilles préparées'),
(1018, ' Maïs'),
(1021, ' Maïs doux en conserve'),
(1020, ' Maïs en conserve'),
(1066, ' Meats'),
(955, ' Milkfat'),
(1110, ' Mousses au chocolat'),
(1047, ' Mozzarella'),
(860, ' Pains'),
(863, ' Pains complets'),
(861, ' Pains de mie'),
(864, ' Pains de mie complet'),
(862, ' Pains de mie sans croûte'),
(853, ' Pâtes à tartiner'),
(855, ' Pâtes à tartiner au chocolat'),
(854, ' Pâtes à tartiner aux noisettes'),
(856, ' Pâtes à tartiner aux noisettes et au cacao'),
(944, ' Pâtes alimentaires'),
(945, ' Pâtes alimentaires de céréales'),
(947, ' Pâtes de blé dur'),
(982, ' Pâtes farcies'),
(983, ' Pâtes fraîches'),
(946, ' Pâtes sèches'),
(979, ' Pavés de saumon'),
(887, ' Pétales de blé chocolatés'),
(888, ' Pétales de blé chocolatés enrichis en vitamines et minéraux'),
(881, ' Petit-déjeuners'),
(1123, ' Petits pois et carottes en conserve'),
(1081, ' Pizzas'),
(1082, ' Pizzas au fromage'),
(1084, ' Pizzas aux quatre fromages'),
(1083, ' Pizzas et tartes surgelées'),
(1085, ' Pizzas surgelées'),
(1080, ' Pizzas tartes salées et quiches'),
(981, ' Plats à base de pâtes'),
(980, ' Plats préparés'),
(1039, ' Plats préparés en conserve'),
(975, ' Poissons'),
(1022, ' Poissons en conserve'),
(974, ' Poissons et dérivés'),
(976, ' Poissons gras'),
(1096, ' Pommes de terre normales préfrites surgelées'),
(910, ' Poulet et dérivés'),
(913, ' Préparations au poulet'),
(911, ' Préparations de viande'),
(1067, ' Prepared meats'),
(851, ' Produits à tartiner'),
(852, ' Produits à tartiner sucrés'),
(907, ' Produits AOC'),
(899, ' Produits de montagne'),
(890, ' Produits fermentés'),
(908, ' Produits labellisés'),
(1101, ' Produits laitiers'),
(891, ' Produits laitiers fermentés'),
(912, ' Produits panés'),
(1089, ' Purées'),
(1090, ' Purées de légumes'),
(1091, ' Purees-surgelees'),
(984, ' Ravioli'),
(904, ' Reblochons'),
(871, ' Sauces'),
(1030, ' Sauces pour pâtes'),
(1032, ' Sauces provençales'),
(1031, ' Sauces tomate'),
(1033, ' Sauces tomate aux oignons'),
(1048, ' Saucisses'),
(1053, ' Saucisses de poulet'),
(1052, ' Saucisses de Strasbourg'),
(1051, ' Saucisses de volaille'),
(1049, ' Saucisses françaises'),
(977, ' Saumons'),
(978, ' Saumons d\'élevage'),
(998, ' Semoules de blé'),
(999, ' Semoules de blé dur'),
(1001, ' Semoules de blé dur pour couscous'),
(997, ' Semoules de céréales'),
(923, ' Snacks'),
(924, ' Snacks salés'),
(1070, ' Snacks sucrés'),
(948, ' Spaghetti'),
(949, ' Spaghettis de blé dur'),
(953, ' Spreadable fats'),
(952, ' Spreads'),
(966, ' Steaks de bœuf'),
(969, ' Steaks de bœuf hachés'),
(965, ' Steaks de viande'),
(968, ' Steaks hachés'),
(972, ' Steaks hachés de bœuf frais'),
(970, ' Steaks hachés frais'),
(1029, ' Surgelés'),
(959, ' Sweet cream butters'),
(917, ' Sweet snacks'),
(922, ' Tablette de chocolat au lait'),
(1023, ' Thons'),
(1027, ' Thons albacore'),
(1028, ' Thons albacore au naturel'),
(1026, ' Thons au naturel'),
(1024, ' Thons en conserve'),
(1025, ' Thons tropicaux'),
(1043, ' Tuiles salées'),
(872, ' Tzatzíki'),
(958, ' Unsalted butters'),
(962, ' Viande de bœuf et dérivés'),
(963, ' Viandes'),
(967, ' Viandes fraîches'),
(1050, ' Volailles'),
(1069, ' White hams'),
(874, ' Yaourt grec concombre'),
(1107, ' Yaourts'),
(1108, ' Yaourts à boire'),
(1125, ' Yaourts aux fruits'),
(1056, 'Aliments à base de fruits et de légumes'),
(1059, 'Aliments à base de plantes frais'),
(1055, 'Aliments d\'origine végétale'),
(857, 'Aliments et boissons à base de végétaux'),
(1100, 'Boissons'),
(1095, 'Chips et frites'),
(870, 'Condiments'),
(950, 'Dairies'),
(1058, 'Frais'),
(1057, 'Légumes et dérivés'),
(1061, 'Légumes frais'),
(1065, 'Meats and their products'),
(850, 'Petit-déjeuners'),
(1112, 'Plats préparés'),
(973, 'Produits de la mer'),
(889, 'Produits laitiers'),
(916, 'Snacks'),
(1079, 'Surgelés'),
(1062, 'Tomates'),
(1063, 'Tomates cerise'),
(1060, 'Tomates et dérivés'),
(1064, 'Tomates fraîches'),
(909, 'Viandes et dérivés');

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

--
-- Déchargement des données de la table `composition`
--

INSERT INTO `composition` (`CODE`, `ID_INGREDIENT`, `POURCENTAGE`) VALUES
('3017620422003', 664, 38),
('3017620422003', 665, 25),
('3017620422003', 666, 13),
('3017620422003', 667, 7),
('3017620422003', 668, 7),
('3017620422003', 669, 3),
('3017620422003', 670, 3),
('3017620422003', 671, 3),
('3017760756198', 664, 7),
('3017760756198', 665, 19),
('3017760756198', 676, 2),
('3017760756198', 677, 0),
('3017760756198', 780, 1),
('3017760756198', 799, 0),
('3017760756198', 812, 4),
('3017760756198', 847, 33),
('3017760756198', 865, 34),
('3019081239237', 673, 17),
('3019081239237', 676, 17),
('3019081239237', 755, 67),
('3021760400012', 664, 3),
('3021760400012', 692, 96),
('3021760400012', 693, 1),
('3021760400012', 694, 1),
('3023290797365', 664, 8),
('3023290797365', 698, 0),
('3023290797365', 848, 50),
('3023290797365', 850, 34),
('3023290797365', 851, 8),
('3023290797365', 852, 0),
('3023290797365', 853, 0),
('3023290797365', 854, 0),
('3023290797365', 855, 0),
('3023290797365', 856, 0),
('3033490005221', 664, 5),
('3033490005221', 667, 5),
('3033490005221', 676, 5),
('3033490005221', 691, 5),
('3033490005221', 696, 5),
('3033490005221', 702, 5),
('3033490005221', 846, 53),
('3033490005221', 847, 9),
('3033490005221', 848, 5),
('3033490005221', 849, 5),
('3038359011436', 664, 0),
('3038359011436', 676, 0),
('3038359011436', 756, 50),
('3038359011436', 757, 50),
('3038359011436', 758, 0),
('3038359011436', 759, 0),
('3038359011436', 760, 0),
('3038359011436', 761, 0),
('3038359011436', 762, 0),
('3038359011436', 763, 0),
('3038359011436', 764, 0),
('3083680025881', 673, 17),
('3083680025881', 676, 17),
('3083680025881', 754, 67),
('3083680918497', 673, 59),
('3083680918497', 676, 1),
('3083680918497', 765, 32),
('3083680918497', 766, 4),
('3083680918497', 767, 3),
('3083680918497', 768, 1),
('3083680918497', 769, 0),
('3083680918497', 770, 0),
('3083680918497', 771, 0),
('3083680918497', 772, 0),
('3083680918497', 773, 0),
('3083681066838', 676, 1),
('3083681066838', 822, 33),
('3083681066838', 823, 32),
('3083681066838', 824, 15),
('3083681066838', 825, 11),
('3083681066838', 826, 5),
('3083681066838', 827, 3),
('3083681066838', 828, 1),
('3083681066838', 829, 0),
('3083681066838', 830, 0),
('3083681095319', 664, 3),
('3083681095319', 673, 30),
('3083681095319', 676, 1),
('3083681095319', 703, 0),
('3083681095319', 866, 63),
('3083681095319', 867, 2),
('3083681095319', 868, 0),
('3083681120578', 673, 17),
('3083681120578', 676, 17),
('3083681120578', 753, 67),
('3103220043158', 664, 11),
('3103220043158', 673, 6),
('3103220043158', 677, 0),
('3103220043158', 698, 22),
('3103220043158', 760, 0),
('3103220043158', 831, 56),
('3103220043158', 832, 3),
('3103220043158', 833, 1),
('3103220043158', 834, 1),
('3168930008958', 676, 3),
('3168930008958', 730, 65),
('3168930008958', 731, 22),
('3168930008958', 732, 7),
('3168930008958', 733, 3),
('3181232220286', 738, 100),
('3223920700127', 744, 100),
('3228021170046', 676, 19),
('3228021170046', 713, 63),
('3228021170046', 714, 9),
('3228021170046', 715, 9),
('3228857000166', 664, 6),
('3228857000166', 672, 37),
('3228857000166', 673, 21),
('3228857000166', 674, 18),
('3228857000166', 675, 12),
('3228857000166', 676, 3),
('3228857000166', 677, 1),
('3228857000166', 678, 1),
('3228857000166', 679, 0),
('3228857000166', 680, 0),
('3228857000166', 681, 0),
('3228857000166', 682, 0),
('3240931545059', 674, 3),
('3240931545059', 675, 10),
('3240931545059', 676, 3),
('3240931545059', 686, 5),
('3240931545059', 742, 58),
('3240931545059', 743, 21),
('3240931545264', 740, 60),
('3240931545264', 741, 40),
('3266980033613', 686, 0),
('3266980033613', 720, 58),
('3266980033613', 721, 22),
('3266980033613', 722, 10),
('3266980033613', 723, 10),
('3292070008568', 673, 0),
('3292070008568', 676, 0),
('3292070008568', 681, 0),
('3292070008568', 684, 62),
('3292070008568', 685, 31),
('3292070008568', 686, 4),
('3292070008568', 687, 2),
('3292070008568', 688, 1),
('3292070008568', 689, 0),
('3292070008568', 690, 0),
('3292070008568', 691, 0),
('3294580102019', 676, 20),
('3294580102019', 716, 60),
('3294580102019', 717, 10),
('3294580102019', 718, 5),
('3294580102019', 719, 5),
('3322680010818', 664, 30),
('3322680010818', 668, 1),
('3322680010818', 676, 0),
('3322680010818', 702, 0),
('3322680010818', 731, 11),
('3322680010818', 732, 11),
('3322680010818', 795, -1),
('3322680010818', 857, 20),
('3322680010818', 858, 16),
('3322680010818', 859, 6),
('3322680010818', 860, 4),
('3322680010818', 861, 2),
('3322680010818', 862, 1),
('3322680010818', 863, 0),
('3322680010818', 864, 0),
('3329770063624', 664, 9),
('3329770063624', 691, 2),
('3329770063624', 703, 1),
('3329770063624', 844, 50),
('3329770063624', 845, 0),
('3329770063624', 869, 25),
('3329770063624', 870, 8),
('3329770063624', 871, 4),
('3329770063624', 872, 0),
('3329770075405', 664, 8),
('3329770075405', 708, 3),
('3329770075405', 784, 3),
('3329770075405', 844, 85),
('3329770075405', 845, 3),
('3347761000670', 683, 100),
('3451790988677', 735, 67),
('3451790988677', 736, 17),
('3451790988677', 737, 17),
('3504182920011', 786, 100),
('3608580758686', 664, 21),
('3608580758686', 839, 58),
('3608580758686', 840, 10),
('3608580758686', 841, 5),
('3608580758686', 842, 3),
('3760032001884', 676, 0),
('3760032001884', 690, 1),
('3760032001884', 835, 93),
('3760032001884', 836, 6),
('40884004', 739, 100),
('5000159492966', 664, 53),
('5000159492966', 665, 0),
('5000159492966', 676, 0),
('5000159492966', 698, 0),
('5000159492966', 702, 0),
('5000159492966', 760, 1),
('5000159492966', 767, 0),
('5000159492966', 794, 24),
('5000159492966', 795, 12),
('5000159492966', 796, 6),
('5000159492966', 797, 3),
('5000159492966', 798, 1),
('5000159492966', 799, 0),
('5000159492966', 800, 0),
('5000159492966', 801, 0),
('5000159492966', 802, 0),
('5000159492966', 803, 0),
('5000159492966', 804, 0),
('5000159492966', 805, 0),
('5000159492966', 806, 0),
('5053990155385', 676, 0),
('5053990155385', 702, 1),
('5053990155385', 730, 55),
('5053990155385', 774, 23),
('5053990155385', 775, 11),
('5053990155385', 776, 6),
('5053990155385', 777, 3),
('5053990155385', 778, 1),
('5053990155385', 779, 0),
('5053990155385', 780, 0),
('7613034223852', 664, 2),
('7613034223852', 673, 20),
('7613034223852', 674, 33),
('7613034223852', 676, 0),
('7613034223852', 678, 3),
('7613034223852', 680, 3),
('7613034223852', 686, 2),
('7613034223852', 743, 0),
('7613034223852', 807, 8),
('7613034223852', 808, 8),
('7613034223852', 809, 7),
('7613034223852', 810, 5),
('7613034223852', 811, 4),
('7613034223852', 812, 3),
('7613034223852', 813, 2),
('7613034223852', 814, 1),
('7613034223852', 815, 0),
('7613034223852', 816, 0),
('7613034223852', 817, 0),
('7613034223852', 818, 0),
('7613034223852', 819, 0),
('7613034223852', 820, 0),
('7613034223852', 821, 0),
('7613034626844', 664, 5),
('7613034626844', 665, 1),
('7613034626844', 674, 17),
('7613034626844', 676, 0),
('7613034626844', 695, 35),
('7613034626844', 696, 23),
('7613034626844', 697, 9),
('7613034626844', 698, 7),
('7613034626844', 699, 2),
('7613034626844', 700, 1),
('7613034626844', 701, 0),
('7613034626844', 702, 0),
('7613034626844', 703, 0),
('7613034626844', 704, 0),
('7613034626844', 705, 0),
('7613034626844', 706, 0),
('7613034626844', 707, 0),
('7613034626844', 708, 0),
('7613034626844', 709, 0),
('7613034626844', 710, 0),
('7613034626844', 711, 0),
('7613034626844', 712, 0),
('7613035040823', 724, 50),
('7613035040823', 725, 25),
('7613035040823', 726, 13),
('7613035040823', 727, 6),
('7613035040823', 728, 3),
('7613035040823', 729, 3),
('7613035336131', 787, 57),
('7613035336131', 788, 21),
('7613035336131', 789, 11),
('7613035336131', 790, 5),
('7613035336131', 791, 3),
('7613035336131', 792, 1),
('7613035336131', 793, 1),
('7613036213127', 676, 1),
('7613036213127', 694, 0),
('7613036213127', 745, 55),
('7613036213127', 746, 23),
('7613036213127', 747, 11),
('7613036213127', 748, 6),
('7613036213127', 749, 3),
('7613036213127', 750, 1),
('7613036213127', 751, 0),
('7613036213127', 752, 0),
('7613038437439', 664, 1),
('7613038437439', 673, 6),
('7613038437439', 676, 3),
('7613038437439', 694, 1),
('7613038437439', 717, 0),
('7613038437439', 767, 0),
('7613038437439', 781, 75),
('7613038437439', 782, 14),
('7613038437439', 783, 1),
('7613038437439', 784, 0),
('8076800195057', 673, 25),
('8076800195057', 734, 75);

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

--
-- Déchargement des données de la table `composition_nutritive`
--

INSERT INTO `composition_nutritive` (`CODE`, `ID_NUTRIMENT`, `VALEUR_100`, `VALEUR_PORTION`, `UNITE`) VALUES
('3017620422003', 2, 57.5, 8.62, 'g'),
('3017620422003', 4, 30.9, 4.63, 'g'),
('3017620422003', 5, 0, 0, 'g'),
('3017620422003', 7, 6.3, 0.945, 'g'),
('3017620422003', 8, 0.107, 0.016, 'g'),
('3017620422003', 9, 2252, 338, 'kJ'),
('3017760756198', 2, 60, 13.8, 'g'),
('3017760756198', 4, 26, 5.98, 'g'),
('3017760756198', 5, 3.3, 0.759, 'g'),
('3017760756198', 7, 5.7, 1.31, 'g'),
('3017760756198', 8, 1, 0.23, 'g'),
('3017760756198', 9, 2104, 484, 'kJ'),
('3019081239237', 2, 0, 0, 'g'),
('3019081239237', 4, 1, 1.12, 'g'),
('3019081239237', 7, 25, 28, 'g'),
('3019081239237', 8, 1, 1.12, 'g'),
('3019081239237', 9, 456, 511, 'kcal'),
('3021760400012', 2, 15, 13.5, 'g'),
('3021760400012', 4, 0.6, 0.54, 'g'),
('3021760400012', 5, 1.3, 1.17, 'g'),
('3021760400012', 7, 0.5, 0.45, 'g'),
('3021760400012', 8, 0.1, 0.09, 'g'),
('3021760400012', 9, 293, 264, 'kJ'),
('3023290797365', 2, 17.2, 16.9, 'g'),
('3023290797365', 4, 20.1, 19.7, 'g'),
('3023290797365', 7, 4.3, 4.21, 'g'),
('3023290797365', 8, 0.13, 0.127, 'g'),
('3023290797365', 9, 1110, 1090, 'kJ'),
('3033490005221', 2, 20.7, 12.4, 'g'),
('3033490005221', 4, 8, 4.8, 'g'),
('3033490005221', 7, 4.5, 2.7, 'g'),
('3033490005221', 8, 0.24, 0.144, 'g'),
('3033490005221', 9, 734, 440, 'kJ'),
('3038359011436', 2, 7.7, 2, 'g'),
('3038359011436', 4, 1.7, 0.4, 'g'),
('3038359011436', 5, 1.3, 0.3, 'g'),
('3038359011436', 7, 1.5, 0.4, 'g'),
('3038359011436', 8, 0.99, 0.25, 'g'),
('3038359011436', 9, 230, 57.5, 'kJ'),
('3083680025881', 2, 10.8, 15.1, 'g'),
('3083680025881', 4, 1.9, 2.66, 'g'),
('3083680025881', 5, 3.8, 5.32, 'g'),
('3083680025881', 7, 2.9, 4.06, 'g'),
('3083680025881', 8, 0.4, 0.56, 'g'),
('3083680025881', 9, 334, 468, 'kJ'),
('3083680918497', 2, 12.5, 18.8, 'g'),
('3083680918497', 4, 0.5, 0.75, 'g'),
('3083680918497', 5, 4.2, 6.3, 'g'),
('3083680918497', 7, 6.6, 9.9, 'g'),
('3083680918497', 8, 0.85, 1.28, 'g'),
('3083680918497', 9, 384, 576, 'kJ'),
('3083681066838', 2, 3.8, 5.7, 'g'),
('3083681066838', 4, 2.1, 3.15, 'g'),
('3083681066838', 5, 3.2, 4.8, 'g'),
('3083681066838', 7, 2.2, 3.3, 'g'),
('3083681066838', 8, 0.64, 0.96, 'g'),
('3083681066838', 9, 205, 308, 'kJ'),
('3083681095319', 2, 8.3, 16.6, 'g'),
('3083681095319', 4, 0.6, 1.2, 'g'),
('3083681095319', 5, 3.9, 8, 'g'),
('3083681095319', 7, 3.1, 6.2, 'g'),
('3083681095319', 8, 0.66, 1.2, 'g'),
('3083681095319', 9, 247, 499, 'kJ'),
('3083681120578', 2, 0.7, 0.805, 'g'),
('3083681120578', 4, 0.6, 0.69, 'g'),
('3083681120578', 5, 2.4, 2.76, 'g'),
('3083681120578', 7, 1.8, 2.07, 'g'),
('3083681120578', 8, 0.58, 0.667, 'g'),
('3083681120578', 9, 80, 92, 'kJ'),
('3103220043158', 2, 64, 25.6, 'g'),
('3103220043158', 4, 16, 6.4, 'g'),
('3103220043158', 5, 0, 0, 'g'),
('3103220043158', 7, 5.6, 2.24, 'g'),
('3103220043158', 8, 0.09, 0.036, 'g'),
('3103220043158', 9, 1778, 711.2, 'kJ'),
('3168930008958', 2, 53, 15.9, 'g'),
('3168930008958', 4, 34, 10.2, 'g'),
('3168930008958', 5, 4.2, 1.26, 'g'),
('3168930008958', 7, 6.3, 1.89, 'g'),
('3168930008958', 8, 1.1, 0.33, 'g'),
('3168930008958', 9, 2305, 692, 'kJ'),
('3181232220286', 2, 0, 0, 'g'),
('3181232220286', 4, 5, 6.5, 'g'),
('3181232220286', 5, 0, 0, 'g'),
('3181232220286', 6, 0.00265, 0.00344, 'mg'),
('3181232220286', 7, 20, 26, 'g'),
('3181232220286', 8, 0.22, 0.286, 'g'),
('3181232220286', 9, 527, 685.1, 'kcal'),
('3223920700127', 2, 73, 36, 'g'),
('3223920700127', 4, 2, 1, 'g'),
('3223920700127', 5, 3.4, 1.7, 'g'),
('3223920700127', 7, 12, 6, 'g'),
('3223920700127', 8, 0, 0, 'g'),
('3223920700127', 9, 1546, 773, 'kJ'),
('3228021170046', 1, 0.96, 0.288, 'mg'),
('3228021170046', 2, 1, 0.3, 'g'),
('3228021170046', 4, 29, 8.7, 'g'),
('3228021170046', 7, 27, 8.1, 'g'),
('3228021170046', 8, 0.83, 0.249, 'g'),
('3228021170046', 9, 1549, 465, 'kJ'),
('3228857000166', 2, 39.7, 20, 'g'),
('3228857000166', 4, 4.3, 2.1, 'g'),
('3228857000166', 5, 7.1, 3.5, 'g'),
('3228857000166', 7, 7.2, 3.5, 'g'),
('3228857000166', 8, 1.1, 0.5, 'g'),
('3228857000166', 9, 1053, 526, 'kJ'),
('3240931545059', 2, 35, 52.5, 'g'),
('3240931545059', 4, 2.7, 4.05, 'g'),
('3240931545059', 5, 2.6, 3.9, 'g'),
('3240931545059', 7, 5, 7.5, 'g'),
('3240931545059', 8, 1.1, 1.65, 'g'),
('3240931545059', 9, 801, 1200, 'kJ'),
('3240931545264', 2, 29, 36.2, 'g'),
('3240931545264', 4, 10, 12.5, 'g'),
('3240931545264', 5, 2.9, 3.62, 'g'),
('3240931545264', 7, 8.1, 10.1, 'g'),
('3240931545264', 8, 1.1, 1.38, 'g'),
('3240931545264', 9, 1024, 1280, 'kJ'),
('3266980033613', 2, 13, 13, 'g'),
('3266980033613', 4, 11, 11, 'g'),
('3266980033613', 5, 1.6, 1.6, 'g'),
('3266980033613', 7, 15, 15, 'g'),
('3266980033613', 8, 0.825, 0.825, 'g'),
('3266980033613', 9, 896, 896, 'kJ'),
('3292070008568', 2, 3.6, 1.44, ''),
('3292070008568', 4, 9.4, 3.76, ''),
('3292070008568', 7, 4, 1.6, ''),
('3292070008568', 8, 1, 0.4, ''),
('3292070008568', 9, 481, 192.4, 'kcal'),
('3294580102019', 2, 0.5, 0.25, 'g'),
('3294580102019', 4, 27, 13.5, 'g'),
('3294580102019', 5, 0, 0, 'g'),
('3294580102019', 7, 21, 10.5, 'g'),
('3294580102019', 8, 1.4, 0.7, 'g'),
('3294580102019', 9, 1377, 687.5, 'kcal'),
('3322680010818', 2, 59, 18.9, 'g'),
('3322680010818', 4, 22, 7.04, 'g'),
('3322680010818', 5, 2.5, 0.8, 'g'),
('3322680010818', 7, 6.6, 2.11, 'g'),
('3322680010818', 8, 0.65, 0.208, 'g'),
('3322680010818', 9, 1949, 624, 'kJ'),
('3329770063624', 2, 12.4, 16.1, 'g'),
('3329770063624', 4, 2.3, 2.99, 'g'),
('3329770063624', 7, 3.3, 4.29, 'g'),
('3329770063624', 8, 0.13, 0.169, 'g'),
('3329770063624', 9, 389, 506, 'kJ'),
('3329770075405', 2, 10.6, 21.2, 'g'),
('3329770075405', 4, 0.8, 1.6, 'g'),
('3329770075405', 7, 3, 6, 'g'),
('3329770075405', 8, 0.12, 0.24, 'g'),
('3329770075405', 9, 276, 552, 'kcal'),
('3347761000670', 2, 19.6, 23.52, 'g'),
('3347761000670', 4, 0.25, 0.3, 'g'),
('3347761000670', 5, 1.9, 2.28, 'g'),
('3347761000670', 7, 0.98, 1.17, 'g'),
('3347761000670', 8, 0, 0, 'g'),
('3347761000670', 9, 377, 452.4, 'kcal'),
('3451790988677', 2, 0.8, 0.08, 'g'),
('3451790988677', 4, 82, 8.2, 'g'),
('3451790988677', 5, 0, 0, 'g'),
('3451790988677', 7, 0.7, 0.07, 'g'),
('3451790988677', 8, 0.05, 0.005, 'g'),
('3451790988677', 9, 3060, 306, 'kJ'),
('3760032001884', 2, 17.2, 17.2, 'g'),
('3760032001884', 4, 6.1, 6.1, 'g'),
('3760032001884', 5, 4, 4, 'g'),
('3760032001884', 7, 2.2, 2.2, 'g'),
('3760032001884', 8, 0.4, 0.4, 'g'),
('3760032001884', 9, 588, 588, 'kJ'),
('40884004', 2, 0.5, 0.7, 'g'),
('40884004', 4, 16, 22.4, 'g'),
('40884004', 5, 0, 0, 'g'),
('40884004', 7, 20, 28, 'g'),
('40884004', 8, 0.09, 0.126, 'g'),
('40884004', 9, 937, 1310, 'kcal'),
('5000159492966', 2, 59, 26.5, 'g'),
('5000159492966', 4, 26, 11.7, 'g'),
('5000159492966', 7, 9.8, 4.41, 'g'),
('5000159492966', 8, 0.11, 0.0495, 'g'),
('5000159492966', 9, 2194, 987, 'kJ'),
('5053990155385', 2, 56, 16.8, 'g'),
('5053990155385', 4, 30, 9, 'g'),
('5053990155385', 5, 3.4, 1.02, 'g'),
('5053990155385', 7, 6, 1.8, 'g'),
('5053990155385', 8, 1.3, 0.39, 'g'),
('5053990155385', 9, 2237, 671, 'kJ'),
('7613034223852', 2, 27.8, 41.7, 'g'),
('7613034223852', 4, 7.9, 11.8, 'g'),
('7613034223852', 5, 1.5, 2.25, 'g'),
('7613034223852', 7, 11.8, 17.7, 'g'),
('7613034223852', 8, 0.72, 1.08, 'g'),
('7613034223852', 9, 979, 1470, 'kJ'),
('7613034626844', 1, 0.502, 0.151, 'mg'),
('7613034626844', 2, 73.6, 22.1, 'g'),
('7613034626844', 4, 4.8, 1.44, 'g'),
('7613034626844', 5, 7.5, 2.25, 'g'),
('7613034626844', 6, 0.012, 0.0036, 'mg'),
('7613034626844', 7, 8.8, 2.64, 'g'),
('7613034626844', 8, 0.22, 0.066, 'g'),
('7613034626844', 9, 1638, 491, 'kJ'),
('7613035040823', 2, 50.7, 12.7, 'g'),
('7613035040823', 4, 34.1, 8.53, 'g'),
('7613035040823', 5, 7.3, 1.82, 'g'),
('7613035040823', 7, 6, 1.5, 'g'),
('7613035040823', 8, 0.01, 0.0025, 'g'),
('7613035040823', 9, 2285, 571, 'kJ'),
('7613035336131', 2, 0.5, 0.21, 'g'),
('7613035336131', 4, 2.5, 1.05, 'g'),
('7613035336131', 5, 0.5, 0.21, 'g'),
('7613035336131', 7, 20, 8.4, 'g'),
('7613035336131', 8, 1.8, 0.756, 'g'),
('7613035336131', 9, 439, 184, 'kcal'),
('7613036213127', 2, 0.4, 0.3, 'g'),
('7613036213127', 4, 20, 15, 'g'),
('7613036213127', 5, 0.5, 0.375, 'g'),
('7613036213127', 7, 17, 12.75, 'g'),
('7613036213127', 8, 2.2, 1.65, 'g'),
('7613036213127', 9, 1046, 784.5, 'kcal'),
('7613038437439', 2, 2.1, 1.47, 'g'),
('7613038437439', 4, 15, 10.5, 'g'),
('7613038437439', 5, 0.5, 0.35, 'g'),
('7613038437439', 7, 14, 9.8, 'g'),
('7613038437439', 8, 1.8, 1.26, 'g'),
('7613038437439', 9, 829, 580, 'kJ'),
('8076800195057', 2, 71, 60.3, 'g'),
('8076800195057', 4, 2, 1.7, 'g'),
('8076800195057', 5, 3, 2.55, 'g'),
('8076800195057', 7, 13, 11.1, 'g'),
('8076800195057', 8, 0.01, 0.0085, 'g'),
('8076800195057', 9, 1521, 1290, 'kJ');

-- --------------------------------------------------------

--
-- Structure de la table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
CREATE TABLE IF NOT EXISTS `ingredients` (
  `ID_INGREDIENT` int NOT NULL AUTO_INCREMENT,
  `NOM` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID_INGREDIENT`)
) ENGINE=InnoDB AUTO_INCREMENT=873 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `ingredients`
--

INSERT INTO `ingredients` (`ID_INGREDIENT`, `NOM`) VALUES
(664, 'Sucre'),
(665, 'huile de palme'),
(666, 'huile de NOISETTES'),
(667, 'cacao maigre'),
(668, 'LAIT écrémé en poudre'),
(669, 'LACTOSERUM en poudre'),
(670, 'émulsifiants'),
(671, 'vanilline'),
(672, 'Farine complète de blé'),
(673, 'eau'),
(674, 'farine de blé'),
(675, 'huile de colza'),
(676, 'sel'),
(677, 'arôme'),
(678, 'gluten de blé'),
(679, 'farine de seigle maltée'),
(680, 'levure'),
(681, 'vinaigre'),
(682, 'extrait d\'acérola'),
(683, 'flocon d\'avoine'),
(684, 'yaourt Grec'),
(685, 'concombre'),
(686, 'huile de tournesol'),
(687, 'aneth'),
(688, 'menthe'),
(689, 'poivre noir'),
(690, 'ail'),
(691, 'épaississant'),
(692, 'Pomme'),
(693, 'jus de citron concentré'),
(694, 'antioxydant'),
(695, 'Ingrédients blé complet'),
(696, 'chocolat en poudre'),
(697, 'semoule de maïs'),
(698, 'sirop de glucose'),
(699, 'extrait de malt d\'orge'),
(700, 'contient de l\'huile de tournesol'),
(701, 'carbonate de calcium'),
(702, 'émulsifiant'),
(703, 'arômes naturels'),
(704, 'fer'),
(705, 'vitamines'),
(706, 'vitamine B3'),
(707, 'vitamine B5'),
(708, 'vitamine D'),
(709, 'vitamine B6'),
(710, 'vitamine B1'),
(711, 'vitamine B2'),
(712, 'vitamine B9'),
(713, 'LAIT de vache pasteurisé'),
(714, 'ferments lactiques'),
(715, 'fécule de pomme de terre'),
(716, 'Lait cru de vache'),
(717, 'ferments'),
(718, 'présure'),
(719, 'colorant de croûte'),
(720, 'Viande de poulet traitée en salaison'),
(721, 'panure'),
(722, 'jambon de dinde standard fumé'),
(723, '_EMMENTAL_ fondu'),
(724, 'sugar'),
(725, 'cocoa paste'),
(726, 'cocoa butter'),
(727, 'emulsifier sunflower lecithin'),
(728, 'natural vanilla aroma madagascar'),
(729, 'cocoa'),
(730, 'Pommes de terre'),
(731, 'huiles végétales de tournesol'),
(732, 'huiles végétales de colza'),
(733, 'maïs'),
(734, 'Semoule de BLÉ dur'),
(735, 'cream'),
(736, 'milk fat'),
(737, 'lactic ferments'),
(738, 'viande hachée de bœuf'),
(739, '_saumon'),
(740, 'Farce'),
(741, 'Pâte'),
(742, 'Purée'),
(743, 'semoule de BLE'),
(744, 'semoule de BLE dur de qualité supérieure'),
(745, 'Poitrine de porc'),
(746, 'Viande de porc'),
(747, 'gonservateurs'),
(748, 'lactate de potassium'),
(749, 'acétate de sodium'),
(750, 'Dextrose de maïs'),
(751, 'Fumée'),
(752, 'Fumage traditionnel au bois de hêtre'),
(753, 'Champignons'),
(754, 'Maïs doux en grains sans OGM'),
(755, '_Thon_'),
(756, 'tomates fraîches avec'),
(757, 'purées de tomates'),
(758, 'légumes frais'),
(759, 'huile d\'olive vierge'),
(760, 'amidon'),
(761, 'persil'),
(762, 'herbes de provence'),
(763, 'arômes naturels d\'herbe'),
(764, 'extrait d\'oigons'),
(765, 'lentilles blondes'),
(766, 'carottes'),
(767, 'arômes'),
(768, 'oignons'),
(769, 'une feuille de laurier'),
(770, 'graisse de poulet'),
(771, 'graisse de porc'),
(772, 'extrait de romarin'),
(773, 'épices'),
(774, 'huiles végétales'),
(775, 'farine de riz'),
(776, 'amidon de BLÉ'),
(777, 'farine de maïs'),
(778, 'assaisonnement crème acidulée et oignon'),
(779, 'maltodextrine'),
(780, 'colorant'),
(781, 'Viande de poulet'),
(782, 'Peau de poulet'),
(783, 'Protéines de pois'),
(784, 'Arôme naturel'),
(785, 'Mélange de miels non originaires et orig'),
(786, 'Tomates cerises'),
(787, 'pork ham'),
(788, 'broth'),
(789, 'salt'),
(790, 'corn dextrose'),
(791, 'natural flavours'),
(792, 'preservative'),
(793, 'antioxidant'),
(794, '_cacahuètes_'),
(795, 'pâte de cacao'),
(796, '_lait_ entier en poudre'),
(797, 'beurre de cacao'),
(798, 'matière grasse de palme'),
(799, '_lait_ écrémé en poudre'),
(800, '_lactose_'),
(801, 'stabilisant'),
(802, 'matière grasse de karité'),
(803, 'matière grasse du _lait_'),
(804, 'dextrine'),
(805, 'agent d\'enrobage'),
(806, 'colorants'),
(807, 'EMMENTAL'),
(808, 'EDAM'),
(809, 'MOZZARELLA'),
(810, 'purée de tomates'),
(811, 'sauce au chèvre'),
(812, 'poudres à lever'),
(813, 'carbonates de sodium'),
(814, 'huile d\'olive vierge extra'),
(815, 'levain déshydraté'),
(816, 'amidon modifié de pomme de terre'),
(817, 'pulpe d\'ail'),
(818, 'épices et plantes aromatiques'),
(819, 'farine de BLE dur'),
(820, 'agents de traitement de la farine'),
(821, 'xylanase'),
(822, 'Haricots verts'),
(823, 'courgettes'),
(824, 'épinards'),
(825, 'petits pois doux'),
(826, 'flocons de pomme de terre'),
(827, 'CREME fraîche'),
(828, 'BEURRE'),
(829, 'ail déshydraté'),
(830, 'arôme naturel de poivre'),
(831, 'Chocolat au _lait_'),
(832, 'humectant'),
(833, 'gélatine'),
(834, 'dextrose'),
(835, 'Pomme de terre'),
(836, 'graisse de canard'),
(837, 'Tous les ingrédients sont'),
(838, 'mais ne proviennent pas d\'Agen'),
(839, 'Fraises'),
(840, 'sucre roux de canne'),
(841, 'jus de citrons concentré et'),
(842, 'gélifiant'),
(843, 'si les fraises n\'en contenaient pas suff'),
(844, 'Yaourt'),
(845, 'concentré des minéraux du lait'),
(846, 'lait entier'),
(847, 'chocolat'),
(848, 'crème'),
(849, 'gélatine bovine'),
(850, '_lait_ entier'),
(851, 'jaunes d\'_oeufs_'),
(852, '_œufs_'),
(853, 'poudre de _lait_ écrémé'),
(854, 'arôme vanille'),
(855, 'correcteur d\'acidité'),
(856, 'Garniture'),
(857, 'LAIT frais entier'),
(858, 'farine de BLÉ CRC'),
(859, 'CEUFS extra-frais entiers'),
(860, 'oudre de cacao maigre'),
(861, 'BEURRE pâtissier'),
(862, 'LACTOSE'),
(863, 'pâte de NOISETTES'),
(864, 'arôme naturel de vanille'),
(865, 'Farine de _blé_'),
(866, 'Légumes'),
(867, 'salade'),
(868, 'oignon grelot'),
(869, 'Fruits'),
(870, 'Amidon transformé de maïs'),
(871, 'Jus de carotte'),
(872, 'LAIT');

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
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `journal`
--

INSERT INTO `journal` (`ID_JOURNAL`, `CODE`, `IDENTIFIANT`, `QUANTITE`, `DATE`) VALUES
(1, '3240931545264', 'MangeurSain', 1, '2023-11-10'),
(2, '7613035336131', 'MangeurSain', 2, '2023-11-10'),
(3, '3083680918497', 'MangeurSain', 1, '2023-11-10'),
(4, '3021760400012', 'MangeurSain', 1, '2023-11-10'),
(5, '7613034626844', 'MangeurSain', 2, '2023-11-10'),
(6, '3451790988677', 'MangeurSain', 3, '2023-11-10'),
(7, '3181232220286', 'MangeurSain', 1, '2023-11-10'),
(8, '3347761000670', 'MangeurSain', 1, '2023-11-10'),
(9, '3760032001884', 'MangeurMoyen', 1, '2023-11-10'),
(10, '7613038437439', 'MangeurMoyen', 2, '2023-11-10'),
(11, '3223920700127', 'MangeurMoyen', 1, '2023-11-10'),
(12, '3083681120578', 'MangeurMoyen', 1, '2023-11-10'),
(13, '7613036213127', 'MangeurMoyen', 1, '2023-11-10'),
(14, '3504182920011', 'MangeurMoyen', 1, '2023-11-10'),
(15, '7613035040823', 'MangeurMoyen', 1, '2023-11-10'),
(16, '3103220043158', 'MangeurMoyen', 1, '2023-11-10'),
(17, '3228857000166', 'MangeurMoyen', 2, '2023-11-10'),
(18, '3017620422003', 'MangeurMoyen', 2, '2023-11-10'),
(19, '3228021170046', 'MangeurMoyen', 1, '2023-11-10'),
(20, '3294580102019', 'MangeurMoyen', 1, '2023-11-10'),
(21, '3168930008958', 'MangeurMoyen', 1, '2023-11-10'),
(22, '3292070008568', 'MangeurMoyen', 1, '2023-11-10'),
(23, '7613034223852', 'GrosMangeur', 4, '2023-11-10'),
(24, '3266980033613', 'GrosMangeur', 1, '2023-11-10'),
(25, '3240931545059', 'GrosMangeur', 1, '2023-11-10'),
(26, '5000159492966', 'GrosMangeur', 4, '2023-11-10'),
(27, '5053990155385', 'GrosMangeur', 4, '2023-11-10'),
(28, '3228857000166', 'GrosMangeur', 2, '2023-11-10'),
(29, '3017620422003', 'GrosMangeur', 4, '2023-11-10'),
(30, '3019081239237', 'GrosMangeur', 2, '2023-11-09'),
(31, '3083680025881', 'GrosMangeur', 1, '2023-11-09'),
(32, '3017760756198', 'GrosMangeur', 2, '2023-11-09'),
(33, '7613038437439', 'GrosMangeur', 3, '2023-11-09'),
(34, '8076800195057', 'GrosMangeur', 2, '2023-11-09'),
(35, '3038359011436', 'GrosMangeur', 1, '2023-11-09'),
(36, '3228021170046', 'GrosMangeur', 2, '2023-11-09'),
(37, '3023290797365', 'GrosMangeur', 1, '2023-11-09'),
(38, '3017620422003', 'GrosMangeur', 2, '2023-11-09'),
(39, '3228857000166', 'GrosMangeur', 1, '2023-11-09'),
(40, '3451790988677', 'GrosMangeur', 2, '2023-11-09'),
(41, '3294580102019', 'GrosMangeur', 1, '2023-11-09'),
(42, '5053990155385', 'GrosMangeur', 5, '2023-11-08'),
(43, '3294580102019', 'GrosMangeur', 2, '2023-11-08'),
(44, '3228857000166', 'GrosMangeur', 3, '2023-11-08'),
(45, '3017620422003', 'GrosMangeur', 4, '2023-11-08'),
(46, '7613035040823', 'GrosMangeur', 2, '2023-11-08'),
(47, '3266980033613', 'GrosMangeur', 2, '2023-11-08'),
(48, '3760032001884', 'GrosMangeur', 2, '2023-11-08'),
(49, '7613034223852', 'GrosMangeur', 3, '2023-11-08'),
(50, '3240931545059', 'GrosMangeur', 2, '2023-11-07'),
(51, '3033490005221', 'GrosMangeur', 2, '2023-11-07'),
(52, '7613038437439', 'GrosMangeur', 3, '2023-11-07'),
(53, '5000159492966', 'GrosMangeur', 3, '2023-11-07'),
(54, '40884004', 'GrosMangeur', 1, '2023-11-07'),
(55, '3223920700127', 'GrosMangeur', 3, '2023-11-07'),
(56, '7613034626844', 'GrosMangeur', 4, '2023-11-07'),
(57, '5053990155385', 'GrosMangeur', 2, '2023-11-07'),
(58, '3329770075405', 'GrosMangeur', 2, '2023-11-06'),
(59, '3181232220286', 'GrosMangeur', 2, '2023-11-06'),
(60, '8076800195057', 'GrosMangeur', 3, '2023-11-06'),
(61, '3038359011436', 'GrosMangeur', 2, '2023-11-06'),
(62, '3228021170046', 'GrosMangeur', 2, '2023-11-06'),
(63, '3322680010818', 'GrosMangeur', 5, '2023-11-06'),
(64, '3017760756198', 'GrosMangeur', 5, '2023-11-06'),
(65, '7613034223852', 'GrosMangeur', 6, '2023-11-05'),
(66, '3017760756198', 'GrosMangeur', 5, '2023-11-05'),
(67, '3228857000166', 'GrosMangeur', 2, '2023-11-05'),
(68, '3017620422003', 'GrosMangeur', 4, '2023-11-05'),
(69, '7613035336131', 'GrosMangeur', 4, '2023-11-05'),
(70, '3760032001884', 'GrosMangeur', 2, '2023-11-05'),
(71, '3451790988677', 'GrosMangeur', 5, '2023-11-05'),
(72, '7613034223852', 'MangeurMoyen', 2, '2023-11-09'),
(73, '3023290797365', 'MangeurMoyen', 1, '2023-11-09'),
(74, '3083681066838', 'MangeurMoyen', 1, '2023-11-09'),
(75, '3266980033613', 'MangeurMoyen', 1, '2023-11-09'),
(76, '7613034626844', 'MangeurMoyen', 2, '2023-11-09'),
(77, '3329770075405', 'MangeurMoyen', 1, '2023-11-09'),
(78, '3504182920011', 'MangeurMoyen', 1, '2023-11-09'),
(79, '3228857000166', 'MangeurMoyen', 2, '2023-11-09'),
(80, '3294580102019', 'MangeurMoyen', 2, '2023-11-09'),
(81, '3017760756198', 'MangeurMoyen', 2, '2023-11-09'),
(82, '7613036213127', 'MangeurMoyen', 1, '2023-11-08'),
(83, '8076800195057', 'MangeurMoyen', 2, '2023-11-08'),
(84, '3294580102019', 'MangeurMoyen', 2, '2023-11-08'),
(85, '3038359011436', 'MangeurMoyen', 1, '2023-11-08'),
(86, '3228021170046', 'MangeurMoyen', 1, '2023-11-08'),
(87, '3608580758686', 'MangeurMoyen', 1, '2023-11-08'),
(88, '3228857000166', 'MangeurMoyen', 4, '2023-11-08'),
(89, '7613035040823', 'MangeurMoyen', 1, '2023-11-08'),
(90, '3347761000670', 'MangeurMoyen', 1, '2023-11-07'),
(91, '3322680010818', 'MangeurMoyen', 2, '2023-11-07'),
(92, '7613034626844', 'MangeurMoyen', 2, '2023-11-07'),
(93, '3083680918497', 'MangeurMoyen', 1, '2023-11-07'),
(94, '7613038437439', 'MangeurMoyen', 2, '2023-11-07'),
(95, '3083680025881', 'MangeurMoyen', 1, '2023-11-07'),
(96, '3019081239237', 'MangeurMoyen', 1, '2023-11-07'),
(97, '3292070008568', 'MangeurMoyen', 1, '2023-11-07'),
(98, '3103220043158', 'MangeurMoyen', 3, '2023-11-07'),
(99, '3294580102019', 'MangeurMoyen', 1, '2023-11-07'),
(100, '3083681066838', 'MangeurMoyen', 1, '2023-11-06'),
(101, '40884004', 'MangeurMoyen', 1, '2023-11-06'),
(102, '3181232220286', 'MangeurMoyen', 1, '2023-11-06'),
(103, '3760032001884', 'MangeurMoyen', 2, '2023-11-06'),
(104, '3033490005221', 'MangeurMoyen', 1, '2023-11-06'),
(105, '3329770075405', 'MangeurMoyen', 1, '2023-11-06'),
(106, '5000159492966', 'MangeurMoyen', 2, '2023-11-06'),
(107, '3240931545059', 'MangeurMoyen', 1, '2023-11-05'),
(108, '7613036213127', 'MangeurMoyen', 1, '2023-11-05'),
(109, '3228021170046', 'MangeurMoyen', 1, '2023-11-05'),
(110, '7613038437439', 'MangeurMoyen', 2, '2023-11-05'),
(111, '8076800195057', 'MangeurMoyen', 2, '2023-11-05'),
(112, '3504182920011', 'MangeurMoyen', 1, '2023-11-05'),
(113, '3294580102019', 'MangeurMoyen', 1, '2023-11-05'),
(114, '5053990155385', 'MangeurMoyen', 2, '2023-11-05'),
(115, '3021760400012', 'MangeurMoyen', 2, '2023-11-05'),
(116, '3083681120578', 'MangeurSain', 1, '2023-11-09'),
(117, '3760032001884', 'MangeurSain', 1, '2023-11-09'),
(118, '3223920700127', 'MangeurSain', 1, '2023-11-09'),
(119, '3083680025881', 'MangeurSain', 1, '2023-11-09'),
(120, '3329770075405', 'MangeurSain', 1, '2023-11-09'),
(121, '3347761000670', 'MangeurSain', 1, '2023-11-09'),
(122, '7613034626844', 'MangeurSain', 2, '2023-11-09'),
(123, '3228857000166', 'MangeurSain', 2, '2023-11-09'),
(124, '3294580102019', 'MangeurSain', 2, '2023-11-09'),
(125, '40884004', 'MangeurSain', 1, '2023-11-08'),
(126, '3083681095319', 'MangeurSain', 1, '2023-11-08'),
(127, '3083681066838', 'MangeurSain', 1, '2023-11-08'),
(128, '7613035336131', 'MangeurSain', 2, '2023-11-08'),
(129, '3168930008958', 'MangeurSain', 2, '2023-11-08'),
(130, '3347761000670', 'MangeurSain', 2, '2023-11-08'),
(131, '7613034626844', 'MangeurSain', 2, '2023-11-08'),
(132, '3292070008568', 'MangeurSain', 1, '2023-11-08'),
(133, '3504182920011', 'MangeurSain', 1, '2023-11-08'),
(134, '3181232220286', 'MangeurSain', 1, '2023-11-07'),
(135, '8076800195057', 'MangeurSain', 1, '2023-11-07'),
(136, '3038359011436', 'MangeurSain', 1, '2023-11-07'),
(137, '3083680918497', 'MangeurSain', 1, '2023-11-07'),
(138, '3083681120578', 'MangeurSain', 1, '2023-11-07'),
(139, '3019081239237', 'MangeurSain', 1, '2023-11-07'),
(140, '3292070008568', 'MangeurSain', 1, '2023-11-07'),
(141, '3021760400012', 'MangeurSain', 1, '2023-11-07'),
(142, '7613035040823', 'MangeurSain', 1, '2023-11-07'),
(143, '3017760756198', 'MangeurSain', 1, '2023-11-06'),
(144, '3083681095319', 'MangeurSain', 1, '2023-11-06'),
(145, '3266980033613', 'MangeurSain', 1, '2023-11-06'),
(146, '3451790988677', 'MangeurSain', 1, '2023-11-06'),
(147, '3760032001884', 'MangeurSain', 1, '2023-11-06'),
(148, '3181232220286', 'MangeurSain', 1, '2023-11-06'),
(149, '3228857000166', 'MangeurSain', 2, '2023-11-06'),
(150, '3294580102019', 'MangeurSain', 2, '2023-11-06'),
(151, '7613036213127', 'MangeurSain', 1, '2023-11-05'),
(152, '8076800195057', 'MangeurSain', 1, '2023-11-05'),
(153, '3451790988677', 'MangeurSain', 1, '2023-11-05'),
(154, '3322680010818', 'MangeurSain', 1, '2023-11-05'),
(155, '3083681120578', 'MangeurSain', 1, '2023-11-05'),
(156, '7613038437439', 'MangeurSain', 1, '2023-11-05'),
(157, '3083680918497', 'MangeurSain', 1, '2023-11-05'),
(158, '3329770075405', 'MangeurSain', 1, '2023-11-05');

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

--
-- Déchargement des données de la table `labels`
--

INSERT INTO `labels` (`CODE`, `ID_CATEGORIES`) VALUES
('3017620422003', 850),
('3017620422003', 851),
('3017620422003', 852),
('3017620422003', 853),
('3017620422003', 854),
('3017620422003', 855),
('3017620422003', 856),
('3021760400012', 857),
('3083680025881', 857),
('3083680918497', 857),
('3083681066838', 857),
('3083681095319', 857),
('3083681120578', 857),
('3168930008958', 857),
('3223920700127', 857),
('3228857000166', 857),
('3240931545059', 857),
('3240931545264', 857),
('3347761000670', 857),
('3504182920011', 857),
('5000159492966', 857),
('7613034626844', 857),
('8076800195057', 857),
('3021760400012', 858),
('3083680025881', 858),
('3083680918497', 858),
('3083681066838', 858),
('3083681095319', 858),
('3083681120578', 858),
('3168930008958', 858),
('3223920700127', 858),
('3228857000166', 858),
('3240931545059', 858),
('3240931545264', 858),
('3347761000670', 858),
('5000159492966', 858),
('7613034626844', 858),
('8076800195057', 858),
('3083680025881', 859),
('3168930008958', 859),
('3223920700127', 859),
('3228857000166', 859),
('3240931545059', 859),
('7613034626844', 859),
('8076800195057', 859),
('3228857000166', 860),
('3228857000166', 861),
('3228857000166', 862),
('3228857000166', 863),
('3228857000166', 864),
('3021760400012', 865),
('3083680025881', 865),
('3083681066838', 865),
('3083681095319', 865),
('3083681120578', 865),
('3347761000670', 865),
('3021760400012', 866),
('3347761000670', 866),
('3347761000670', 867),
('3347761000670', 868),
('3347761000670', 869),
('3038359011436', 870),
('3292070008568', 870),
('3038359011436', 871),
('3292070008568', 871),
('3292070008568', 872),
('3292070008568', 873),
('3292070008568', 874),
('3017760756198', 875),
('3021760400012', 875),
('3023290797365', 875),
('3033490005221', 875),
('3329770063624', 875),
('3329770075405', 875),
('7613035040823', 875),
('3021760400012', 876),
('3021760400012', 877),
('3021760400012', 878),
('3021760400012', 879),
('3021760400012', 880),
('7613034626844', 881),
('3083680025881', 882),
('3223920700127', 882),
('3240931545059', 882),
('7613034626844', 882),
('8076800195057', 882),
('7613034626844', 883),
('7613034626844', 884),
('7613034626844', 885),
('7613034626844', 886),
('7613034626844', 887),
('7613034626844', 888),
('3023290797365', 889),
('3033490005221', 889),
('3228021170046', 889),
('3294580102019', 889),
('3329770063624', 889),
('3228021170046', 890),
('3294580102019', 890),
('3329770063624', 890),
('3329770075405', 890),
('3228021170046', 891),
('3294580102019', 891),
('3329770063624', 891),
('3329770075405', 891),
('3228021170046', 892),
('3294580102019', 892),
('3228021170046', 893),
('3294580102019', 893),
('3228021170046', 894),
('3228021170046', 895),
('3228021170046', 896),
('3228021170046', 897),
('3181232220286', 898),
('3294580102019', 898),
('3294580102019', 899),
('3294580102019', 900),
('3294580102019', 901),
('3294580102019', 902),
('3294580102019', 903),
('3294580102019', 904),
('3294580102019', 905),
('3294580102019', 906),
('3294580102019', 907),
('3294580102019', 908),
('3181232220286', 909),
('3266980033613', 909),
('7613036213127', 909),
('7613038437439', 909),
('3266980033613', 910),
('7613038437439', 910),
('3181232220286', 911),
('3266980033613', 911),
('7613038437439', 911),
('3266980033613', 912),
('3266980033613', 913),
('7613038437439', 913),
('3266980033613', 914),
('3266980033613', 915),
('3017760756198', 916),
('3103220043158', 916),
('5053990155385', 916),
('7613035040823', 916),
('7613035040823', 917),
('7613035040823', 918),
('7613035040823', 919),
('7613035040823', 920),
('7613035040823', 921),
('7613035040823', 922),
('3168930008958', 923),
('5000159492966', 923),
('3168930008958', 924),
('5053990155385', 924),
('3168930008958', 925),
('5053990155385', 925),
('3168930008958', 926),
('5053990155385', 926),
('3168930008958', 927),
('5053990155385', 927),
('3168930008958', 928),
('3168930008958', 929),
('3168930008958', 930),
('3168930008958', 931),
('3168930008958', 932),
('3168930008958', 933),
('3168930008958', 934),
('3168930008958', 935),
('3168930008958', 936),
('3168930008958', 937),
('3168930008958', 938),
('3168930008958', 939),
('3168930008958', 940),
('3168930008958', 941),
('3168930008958', 942),
('3168930008958', 943),
('3240931545264', 944),
('8076800195057', 944),
('8076800195057', 945),
('8076800195057', 946),
('8076800195057', 947),
('8076800195057', 948),
('8076800195057', 949),
('3451790988677', 950),
('3451790988677', 951),
('3451790988677', 952),
('3451790988677', 953),
('3451790988677', 954),
('3451790988677', 955),
('3451790988677', 956),
('3451790988677', 957),
('3451790988677', 958),
('3451790988677', 959),
('3451790988677', 960),
('3451790988677', 961),
('3181232220286', 962),
('3181232220286', 963),
('7613036213127', 963),
('7613038437439', 963),
('3181232220286', 964),
('3181232220286', 965),
('3181232220286', 966),
('3181232220286', 967),
('3181232220286', 968),
('3181232220286', 969),
('3181232220286', 970),
('3181232220286', 971),
('3181232220286', 972),
('3019081239237', 973),
('40884004', 973),
('3019081239237', 974),
('40884004', 974),
('3019081239237', 975),
('40884004', 975),
('3019081239237', 976),
('40884004', 976),
('40884004', 977),
('40884004', 978),
('40884004', 979),
('3083680918497', 980),
('3083681066838', 980),
('3223920700127', 980),
('3240931545264', 980),
('7613034223852', 980),
('3240931545264', 981),
('3240931545264', 982),
('3240931545264', 983),
('3240931545264', 984),
('3240931545264', 985),
('3240931545264', 986),
('3240931545264', 987),
('3240931545264', 988),
('3240931545264', 989),
('3240931545264', 990),
('3240931545059', 991),
('3240931545059', 992),
('3240931545059', 993),
('3240931545059', 994),
('3240931545059', 995),
('3240931545059', 996),
('3223920700127', 997),
('3223920700127', 998),
('3223920700127', 999),
('3223920700127', 1000),
('3223920700127', 1001),
('7613036213127', 1002),
('7613038437439', 1002),
('7613036213127', 1003),
('7613036213127', 1004),
('7613036213127', 1005),
('7613036213127', 1006),
('3019081239237', 1007),
('3083680025881', 1007),
('3083680918497', 1007),
('3083681095319', 1007),
('3083681120578', 1007),
('3083680025881', 1008),
('3083681095319', 1008),
('3083681120578', 1008),
('3083680025881', 1009),
('3083681066838', 1009),
('3083681095319', 1009),
('3083681120578', 1009),
('3083681120578', 1010),
('3083681120578', 1011),
('3083681120578', 1012),
('3083681120578', 1013),
('3083681120578', 1014),
('3083680025881', 1015),
('3083680918497', 1015),
('3083680025881', 1016),
('3083681095319', 1016),
('3083680025881', 1017),
('3083680025881', 1018),
('3083680025881', 1019),
('3083680025881', 1020),
('3083680025881', 1021),
('3019081239237', 1022),
('3019081239237', 1023),
('3019081239237', 1024),
('3019081239237', 1025),
('3019081239237', 1026),
('3019081239237', 1027),
('3019081239237', 1028),
('3038359011436', 1029),
('3083681066838', 1029),
('3329770075405', 1029),
('3760032001884', 1029),
('3038359011436', 1030),
('3038359011436', 1031),
('3038359011436', 1032),
('3038359011436', 1033),
('3083680918497', 1034),
('3083681095319', 1034),
('3083680918497', 1035),
('3083681095319', 1035),
('3083680918497', 1036),
('3083680918497', 1037),
('3083680918497', 1038),
('3083680918497', 1039),
('3083680918497', 1040),
('3083680918497', 1041),
('5053990155385', 1042),
('5053990155385', 1043),
('5053990155385', 1044),
('7613038437439', 1048),
('7613038437439', 1049),
('7613038437439', 1050),
('7613038437439', 1051),
('7613038437439', 1052),
('7613038437439', 1053),
('7613038437439', 1054),
('3504182920011', 1055),
('3504182920011', 1056),
('3504182920011', 1057),
('3504182920011', 1058),
('3504182920011', 1059),
('3504182920011', 1060),
('3504182920011', 1061),
('3504182920011', 1062),
('3504182920011', 1063),
('3504182920011', 1064),
('7613035336131', 1065),
('7613035336131', 1066),
('7613035336131', 1067),
('7613035336131', 1068),
('7613035336131', 1069),
('3017760756198', 1070),
('3103220043158', 1070),
('5000159492966', 1070),
('3103220043158', 1071),
('5000159492966', 1071),
('3103220043158', 1072),
('5000159492966', 1072),
('5000159492966', 1073),
('3103220043158', 1074),
('5000159492966', 1074),
('5000159492966', 1075),
('5000159492966', 1076),
('5000159492966', 1077),
('5000159492966', 1078),
('7613034223852', 1079),
('7613034223852', 1080),
('7613034223852', 1081),
('7613034223852', 1082),
('7613034223852', 1083),
('7613034223852', 1084),
('7613034223852', 1085),
('3083681066838', 1086),
('3083681066838', 1087),
('3083681066838', 1088),
('3083681066838', 1089),
('3083681066838', 1090),
('3083681066838', 1091),
('3103220043158', 1092),
('3103220043158', 1093),
('3103220043158', 1094),
('3760032001884', 1095),
('3760032001884', 1096),
('3760032001884', 1097),
('3760032001884', 1098),
('3760032001884', 1099),
('3329770075405', 1100),
('3329770075405', 1101),
('3023290797365', 1102),
('3033490005221', 1102),
('3329770063624', 1102),
('3329770075405', 1102),
('3329770075405', 1103),
('3329770063624', 1104),
('3329770075405', 1104),
('3329770075405', 1105),
('3329770075405', 1106),
('3329770063624', 1107),
('3329770075405', 1107),
('3329770075405', 1108),
('3033490005221', 1109),
('3033490005221', 1110),
('3023290797365', 1111),
('3322680010818', 1112),
('3322680010818', 1113),
('3322680010818', 1114),
('3322680010818', 1115),
('3322680010818', 1116),
('3322680010818', 1117),
('3017760756198', 1118),
('3017760756198', 1119),
('3017760756198', 1120),
('3017760756198', 1121),
('3083681095319', 1122),
('3083681095319', 1123),
('3329770063624', 1124),
('3329770063624', 1125);

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
  `NOM` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
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
  `IDENTIFIANT` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ID_NUTRIMENT` int NOT NULL,
  `QUANTITE` float DEFAULT NULL,
  PRIMARY KEY (`IDENTIFIANT`,`ID_NUTRIMENT`),
  KEY `ID_NUTRIMENT` (`ID_NUTRIMENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `recommendations`
--

INSERT INTO `recommendations` (`IDENTIFIANT`, `ID_NUTRIMENT`, `QUANTITE`) VALUES
('GrosMangeur', 1, 1),
('GrosMangeur', 2, 338.25),
('GrosMangeur', 3, 0.3),
('GrosMangeur', 4, 120.267),
('GrosMangeur', 5, 30),
('GrosMangeur', 6, 11),
('GrosMangeur', 7, 101.475),
('GrosMangeur', 8, 5),
('GrosMangeur', 9, 2706),
('MangeurMoyen', 1, 1),
('MangeurMoyen', 2, 390.801),
('MangeurMoyen', 3, 0.3),
('MangeurMoyen', 4, 138.952),
('MangeurMoyen', 5, 30),
('MangeurMoyen', 6, 11),
('MangeurMoyen', 7, 117.24),
('MangeurMoyen', 8, 5),
('MangeurMoyen', 9, 3126.41),
('MangeurSain', 1, 0.95),
('MangeurSain', 2, 318.767),
('MangeurSain', 3, 0.3),
('MangeurSain', 4, 113.34),
('MangeurSain', 5, 30),
('MangeurSain', 6, 11),
('MangeurSain', 7, 95.6302),
('MangeurSain', 8, 5),
('MangeurSain', 9, 2550.14);

-- --------------------------------------------------------

--
-- Structure de la table `sexe`
--

DROP TABLE IF EXISTS `sexe`;
CREATE TABLE IF NOT EXISTS `sexe` (
  `ID_SEXE` int NOT NULL AUTO_INCREMENT,
  `NOM` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
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
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`IDENTIFIANT`, `ID_SPORTIF`, `ID_SEXE`, `MOT_DE_PASSE`, `PRENOM`, `NOM`, `AGE`, `POIDS`, `TAILLE`) VALUES
('GrosMangeur', 1, 2, '$2y$10$HqQh1j6dceY7eS9O7UrhLeBnul8GPq9bA9fVW3BT8oclLHK.N4h7C', 'Raoul', 'Hassan', 25, 100, 180),
('MangeurMoyen', 2, 2, '$2y$10$OrnwpiuTIi2zCNW0IYd4xe6ZfsFiZYT8Oi57bFvBB755aX81pkMMa', 'Phillipe', 'Martin', 55, 90, 175),
('MangeurSain', 3, 1, '$2y$10$oiW.lurP3CLtnjGfhD2Yl.LaHLBpUSWstEd/wzqIORFQ3IpRs11i6', 'Cécile', 'Dupont', 35, 60, 165);

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
