-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           8.0.30 - MySQL Community Server - GPL
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour parc
CREATE DATABASE IF NOT EXISTS `parc` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `parc`;

-- Listage de la structure de table parc. accesattrac
CREATE TABLE IF NOT EXISTS `accesattrac` (
  `id_attraction` int NOT NULL,
  `id_forfait` int NOT NULL,
  PRIMARY KEY (`id_attraction`,`id_forfait`),
  KEY `id_forfait` (`id_forfait`),
  CONSTRAINT `accesattrac_ibfk_1` FOREIGN KEY (`id_attraction`) REFERENCES `attraction` (`id_attraction`),
  CONSTRAINT `accesattrac_ibfk_2` FOREIGN KEY (`id_forfait`) REFERENCES `forfait` (`id_forfait`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table parc.accesattrac : ~0 rows (environ)

-- Listage de la structure de table parc. accesexp
CREATE TABLE IF NOT EXISTS `accesexp` (
  `id_experience` int NOT NULL,
  `id_forfait` int NOT NULL,
  PRIMARY KEY (`id_experience`,`id_forfait`),
  KEY `id_forfait` (`id_forfait`),
  CONSTRAINT `accesexp_ibfk_1` FOREIGN KEY (`id_experience`) REFERENCES `experience` (`id_experience`),
  CONSTRAINT `accesexp_ibfk_2` FOREIGN KEY (`id_forfait`) REFERENCES `forfait` (`id_forfait`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table parc.accesexp : ~0 rows (environ)

-- Listage de la structure de table parc. accompagnement
CREATE TABLE IF NOT EXISTS `accompagnement` (
  `id_experience` int NOT NULL,
  `id_employe` int NOT NULL,
  PRIMARY KEY (`id_experience`,`id_employe`),
  KEY `id_employe` (`id_employe`),
  CONSTRAINT `accompagnement_ibfk_1` FOREIGN KEY (`id_experience`) REFERENCES `experience` (`id_experience`),
  CONSTRAINT `accompagnement_ibfk_2` FOREIGN KEY (`id_employe`) REFERENCES `employe` (`id_employe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table parc.accompagnement : ~0 rows (environ)

-- Listage de la structure de table parc. attraction
CREATE TABLE IF NOT EXISTS `attraction` (
  `id_attraction` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `intensite` varchar(50) DEFAULT NULL,
  `capacitéHeure` int DEFAULT NULL,
  `dureeMinutes` double DEFAULT NULL,
  PRIMARY KEY (`id_attraction`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table parc.attraction : ~5 rows (environ)
INSERT INTO `attraction` (`id_attraction`, `nom`, `description`, `intensite`, `capacitéHeure`, `dureeMinutes`) VALUES
	(1, 'Silver Star', 'Montagne russe en acier atteignant 73 mètres de hauteur avec des vitesses jusqu\'à 130 km/h. Une expérience intense avec des descentes vertigineuses et des virages serrés.', 'Extrême', 1750, 3),
	(2, 'Blue Fire', 'Montagne russe de nouvelle génération avec un lancement magnétique de 0 à 100 km/h en 2,5 secondes. Comprend plusieurs inversions et un heartline roll.', 'Extrême', 1720, 2.5),
	(3, 'Pirates in Batavia', 'Croisière scénique en bateau à travers l\'ancienne Batavia (Indonésie). Une aventure immersive avec des décors détaillés et des animatroniques.', 'Familiale', 2000, 8),
	(4, 'Euro-Mir', 'Montagne russe rotative unique avec une tour futuriste. Les wagons tournent sur eux-mêmes pendant le parcours qui alterne entre intérieur et extérieur.', 'Modérée', 1600, 4),
	(5, 'Voletarium', 'Cinéma dynamique proposant un survol des plus beaux paysages d\'Europe. Les sièges bougent en synchronisation avec le film sur écran géant.', 'Familiale', 1400, 5);

-- Listage de la structure de table parc. avis
CREATE TABLE IF NOT EXISTS `avis` (
  `id_avis` int NOT NULL AUTO_INCREMENT,
  `note` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `commentaire` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `dateTime` datetime NOT NULL,
  `id_visiteur` int NOT NULL,
  `id_attraction` int NOT NULL,
  PRIMARY KEY (`id_avis`),
  KEY `id_visiteur` (`id_visiteur`),
  KEY `id_attraction` (`id_attraction`),
  CONSTRAINT `avis_ibfk_1` FOREIGN KEY (`id_visiteur`) REFERENCES `visiteur` (`id_visiteur`),
  CONSTRAINT `avis_ibfk_2` FOREIGN KEY (`id_attraction`) REFERENCES `attraction` (`id_attraction`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table parc.avis : ~3 rows (environ)
INSERT INTO `avis` (`id_avis`, `note`, `commentaire`, `dateTime`, `id_visiteur`, `id_attraction`) VALUES
	(1, '5/5', 'Sensations garanties ! Le départ est à couper le souffle. Les inversions sont fluides et bien rythmées.', '2024-12-27 14:11:47', 1, 2),
	(2, '4/5', 'Une belle balade en bateau, très immersive. Les décors sont magnifiques. Seul bémol : l\'attente était un peu longue.', '2024-12-27 14:12:33', 3, 3),
	(3, '5/5', 'Parfait pour toute la famille ! Les images sont époustouflantes et on a vraiment l\'impression de voler au-dessus de l\'Europe.', '2024-12-27 14:13:09', 4, 5);

-- Listage de la structure de table parc. categorie
CREATE TABLE IF NOT EXISTS `categorie` (
  `id_categorie` int NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_categorie`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table parc.categorie : ~3 rows (environ)
INSERT INTO `categorie` (`id_categorie`, `libelle`) VALUES
	(1, 'Montagne Russe'),
	(2, 'Manège'),
	(3, 'Spectacle');

-- Listage de la structure de table parc. employe
CREATE TABLE IF NOT EXISTS `employe` (
  `id_employe` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `prenom` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id_employe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table parc.employe : ~0 rows (environ)

-- Listage de la structure de table parc. experience
CREATE TABLE IF NOT EXISTS `experience` (
  `id_experience` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `prix` double NOT NULL,
  `dureeHeures` int DEFAULT NULL,
  PRIMARY KEY (`id_experience`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table parc.experience : ~0 rows (environ)

-- Listage de la structure de table parc. forfait
CREATE TABLE IF NOT EXISTS `forfait` (
  `id_forfait` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `prix` double NOT NULL,
  PRIMARY KEY (`id_forfait`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table parc.forfait : ~0 rows (environ)

-- Listage de la structure de table parc. resaattrac
CREATE TABLE IF NOT EXISTS `resaattrac` (
  `id_attraction` int NOT NULL,
  `id_reservation` int NOT NULL,
  PRIMARY KEY (`id_attraction`,`id_reservation`),
  KEY `resaattrac_ibfk_2` (`id_reservation`),
  CONSTRAINT `resaattrac_ibfk_1` FOREIGN KEY (`id_attraction`) REFERENCES `attraction` (`id_attraction`),
  CONSTRAINT `resaattrac_ibfk_2` FOREIGN KEY (`id_reservation`) REFERENCES `reservation` (`id_reservation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table parc.resaattrac : ~0 rows (environ)

-- Listage de la structure de table parc. resaexp
CREATE TABLE IF NOT EXISTS `resaexp` (
  `id_reservation` int NOT NULL,
  `id_experience` int NOT NULL,
  PRIMARY KEY (`id_reservation`,`id_experience`),
  KEY `id_experience` (`id_experience`),
  CONSTRAINT `resaexp_ibfk_1` FOREIGN KEY (`id_reservation`) REFERENCES `reservation` (`id_reservation`),
  CONSTRAINT `resaexp_ibfk_2` FOREIGN KEY (`id_experience`) REFERENCES `experience` (`id_experience`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table parc.resaexp : ~0 rows (environ)

-- Listage de la structure de table parc. resafor
CREATE TABLE IF NOT EXISTS `resafor` (
  `id_reservation` int NOT NULL,
  `id_forfait` int NOT NULL,
  PRIMARY KEY (`id_reservation`,`id_forfait`),
  KEY `id_forfait` (`id_forfait`),
  CONSTRAINT `resafor_ibfk_1` FOREIGN KEY (`id_reservation`) REFERENCES `reservation` (`id_reservation`),
  CONSTRAINT `resafor_ibfk_2` FOREIGN KEY (`id_forfait`) REFERENCES `forfait` (`id_forfait`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table parc.resafor : ~0 rows (environ)

-- Listage de la structure de table parc. reservation
CREATE TABLE IF NOT EXISTS `reservation` (
  `id_reservation` int NOT NULL AUTO_INCREMENT,
  `statut` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nbPersonne` int DEFAULT NULL,
  `dateTime` datetime DEFAULT NULL,
  `id_visiteur` int NOT NULL,
  PRIMARY KEY (`id_reservation`),
  KEY `id_visiteur` (`id_visiteur`),
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`id_visiteur`) REFERENCES `visiteur` (`id_visiteur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table parc.reservation : ~0 rows (environ)

-- Listage de la structure de table parc. supervision
CREATE TABLE IF NOT EXISTS `supervision` (
  `id_attraction` int NOT NULL,
  `id_employe` int NOT NULL,
  PRIMARY KEY (`id_attraction`,`id_employe`),
  KEY `id_employe` (`id_employe`),
  CONSTRAINT `supervision_ibfk_1` FOREIGN KEY (`id_attraction`) REFERENCES `attraction` (`id_attraction`),
  CONSTRAINT `supervision_ibfk_2` FOREIGN KEY (`id_employe`) REFERENCES `employe` (`id_employe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table parc.supervision : ~0 rows (environ)

-- Listage de la structure de table parc. type
CREATE TABLE IF NOT EXISTS `type` (
  `id_attraction` int NOT NULL,
  `id_categorie` int NOT NULL,
  PRIMARY KEY (`id_attraction`,`id_categorie`),
  KEY `type_ibfk_2` (`id_categorie`),
  CONSTRAINT `type_ibfk_1` FOREIGN KEY (`id_attraction`) REFERENCES `attraction` (`id_attraction`),
  CONSTRAINT `type_ibfk_2` FOREIGN KEY (`id_categorie`) REFERENCES `categorie` (`id_categorie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table parc.type : ~5 rows (environ)
INSERT INTO `type` (`id_attraction`, `id_categorie`) VALUES
	(1, 1),
	(2, 1),
	(4, 1),
	(3, 2),
	(5, 3);

-- Listage de la structure de table parc. visiteur
CREATE TABLE IF NOT EXISTS `visiteur` (
  `id_visiteur` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `prenom` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `tel` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_visiteur`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table parc.visiteur : ~5 rows (environ)
INSERT INTO `visiteur` (`id_visiteur`, `nom`, `prenom`, `email`, `tel`) VALUES
	(1, 'Dubois', 'Marion', 'marion.dubois78@email.fr', '06 12 34 56 78'),
	(2, 'Schmidt', 'Thomas', 't.schmidt@email.de', '07 23 45 67 89'),
	(3, 'Martinez', 'Sofia', 'sofia.m2023@email.es', '06 98 76 54 32'),
	(4, 'Müller', 'Andreas', 'a.mueller@email.at', '07 11 22 33 44'),
	(5, 'Lefebvre', 'Julie', 'julie.lefebvre@email.fr', '06 44 55 66 77');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
