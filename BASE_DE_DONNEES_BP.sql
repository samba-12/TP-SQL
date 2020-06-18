-- MySQL dump 10.13  Distrib 8.0.20, for macos10.15 (x86_64)
--
-- Host: localhost    Database: banque_populaire
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `agence`
--

DROP TABLE IF EXISTS `agence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agence` (
  `id_agence` int unsigned NOT NULL AUTO_INCREMENT,
  `numero_agence` int NOT NULL,
  `adresse_agence` varchar(30) NOT NULL,
  PRIMARY KEY (`id_agence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agence`
--

LOCK TABLES `agence` WRITE;
/*!40000 ALTER TABLE `agence` DISABLE KEYS */;
/*!40000 ALTER TABLE `agence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_entreprise`
--

DROP TABLE IF EXISTS `client_entreprise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_entreprise` (
  `id_entreprise` int unsigned NOT NULL AUTO_INCREMENT,
  `nom_entreprise` varchar(30) NOT NULL,
  `ninea` int NOT NULL,
  `registre_commerce` varchar(20) NOT NULL,
  PRIMARY KEY (`id_entreprise`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_entreprise`
--

LOCK TABLES `client_entreprise` WRITE;
/*!40000 ALTER TABLE `client_entreprise` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_entreprise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_physique`
--

DROP TABLE IF EXISTS `client_physique`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_physique` (
  `id_client` int unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(30) NOT NULL,
  `telephone` varchar(15) NOT NULL,
  `adresse` varchar(50) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `salaire` double DEFAULT NULL,
  `profession` varchar(30) DEFAULT NULL,
  `infos_employeur` text,
  PRIMARY KEY (`id_client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_physique`
--

LOCK TABLES `client_physique` WRITE;
/*!40000 ALTER TABLE `client_physique` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_physique` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compte`
--

DROP TABLE IF EXISTS `compte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compte` (
  `numero_compte` int unsigned NOT NULL AUTO_INCREMENT,
  `type_compte` varchar(30) NOT NULL,
  `id_client_entreprise` int unsigned NOT NULL,
  `id_client_physique` int unsigned NOT NULL,
  PRIMARY KEY (`numero_compte`),
  KEY `fk_id_client` (`id_client_physique`),
  KEY `fk_id_entreprise` (`id_client_entreprise`),
  CONSTRAINT `fk_id_client` FOREIGN KEY (`id_client_physique`) REFERENCES `client_physique` (`id_client`),
  CONSTRAINT `fk_id_entreprise` FOREIGN KEY (`id_client_entreprise`) REFERENCES `client_entreprise` (`id_entreprise`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compte`
--

LOCK TABLES `compte` WRITE;
/*!40000 ALTER TABLE `compte` DISABLE KEYS */;
/*!40000 ALTER TABLE `compte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employe`
--

DROP TABLE IF EXISTS `employe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employe` (
  `id_employe` int unsigned NOT NULL AUTO_INCREMENT,
  `nom_employe` varchar(30) NOT NULL,
  `prenom_employe` varchar(30) NOT NULL,
  `nature_poste` varchar(30) NOT NULL,
  `agence` int unsigned NOT NULL,
  PRIMARY KEY (`id_employe`),
  KEY `fk_id_agence` (`agence`),
  CONSTRAINT `fk_id_agence` FOREIGN KEY (`agence`) REFERENCES `agence` (`id_agence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employe`
--

LOCK TABLES `employe` WRITE;
/*!40000 ALTER TABLE `employe` DISABLE KEYS */;
/*!40000 ALTER TABLE `employe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operations`
--

DROP TABLE IF EXISTS `operations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operations` (
  `id_operations` int unsigned NOT NULL AUTO_INCREMENT,
  `type_operation` varchar(30) NOT NULL,
  `montant` double NOT NULL,
  `date` datetime DEFAULT NULL,
  `num_compte` int unsigned NOT NULL,
  PRIMARY KEY (`id_operations`),
  KEY `fk_num_compte` (`num_compte`),
  CONSTRAINT `fk_num_compte` FOREIGN KEY (`num_compte`) REFERENCES `compte` (`numero_compte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operations`
--

LOCK TABLES `operations` WRITE;
/*!40000 ALTER TABLE `operations` DISABLE KEYS */;
/*!40000 ALTER TABLE `operations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-18 21:39:09
