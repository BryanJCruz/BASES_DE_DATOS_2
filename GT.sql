-- MariaDB dump 10.19  Distrib 10.6.12-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: GT
-- ------------------------------------------------------
-- Server version	10.6.12-MariaDB-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `BITACORA`
--

DROP TABLE IF EXISTS `BITACORA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BITACORA` (
  `BIT_id` int(11) NOT NULL,
  `FECHA` date DEFAULT NULL,
  `HORA` time DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `EVENT` varchar(255) DEFAULT NULL,
  `ENT_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`BIT_id`),
  KEY `fk_ent` (`ENT_ID`),
  CONSTRAINT `fk_ent` FOREIGN KEY (`ENT_ID`) REFERENCES `ENTIDADES` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BITACORA`
--

LOCK TABLES `BITACORA` WRITE;
/*!40000 ALTER TABLE `BITACORA` DISABLE KEYS */;
/*!40000 ALTER TABLE `BITACORA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENTES`
--

DROP TABLE IF EXISTS `CLIENTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENTES` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `CONTACT` varchar(30) DEFAULT NULL,
  `CREDITLIMIT` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENTES`
--

LOCK TABLES `CLIENTES` WRITE;
/*!40000 ALTER TABLE `CLIENTES` DISABLE KEYS */;
INSERT INTO `CLIENTES` VALUES (1,'BRYAN CRUZ','60513722',1000000.00),(2,'FERNANDO','3242342',12314.00),(3,'MIGUEL','394934',150.25),(4,'ANTONIA VERGARA','123124',90000.00);
/*!40000 ALTER TABLE `CLIENTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ENTIDADES`
--

DROP TABLE IF EXISTS `ENTIDADES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ENTIDADES` (
  `id` int(11) NOT NULL,
  `COMERCIO` varchar(50) DEFAULT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  `COUNTRY` varchar(50) DEFAULT NULL,
  `CITY` varchar(50) DEFAULT NULL,
  `ROL_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rol` (`ROL_id`),
  CONSTRAINT `fk_rol` FOREIGN KEY (`ROL_id`) REFERENCES `ROL` (`ROL_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ENTIDADES`
--

LOCK TABLES `ENTIDADES` WRITE;
/*!40000 ALTER TABLE `ENTIDADES` DISABLE KEYS */;
INSERT INTO `ENTIDADES` VALUES (1,'BG MAÑANITAS','JOSEFINA VERGARA','PANAMA','PANAMA',1),(2,'BG 24DIC','AMABLE CRUZ','PANAMA','PANAMA',1),(3,'XTRA 24DIC','ANTONIO SOLIS','PANAMA','PANAMA',4);
/*!40000 ALTER TABLE `ENTIDADES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ENTIDADES_CLIENTES`
--

DROP TABLE IF EXISTS `ENTIDADES_CLIENTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ENTIDADES_CLIENTES` (
  `ID` int(11) NOT NULL,
  `entidad_id` int(11) DEFAULT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `entidad_id` (`entidad_id`),
  KEY `cliente_id` (`cliente_id`),
  CONSTRAINT `ENTIDADES_CLIENTES_ibfk_1` FOREIGN KEY (`entidad_id`) REFERENCES `ENTIDADES` (`id`),
  CONSTRAINT `ENTIDADES_CLIENTES_ibfk_2` FOREIGN KEY (`cliente_id`) REFERENCES `CLIENTES` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ENTIDADES_CLIENTES`
--

LOCK TABLES `ENTIDADES_CLIENTES` WRITE;
/*!40000 ALTER TABLE `ENTIDADES_CLIENTES` DISABLE KEYS */;
INSERT INTO `ENTIDADES_CLIENTES` VALUES (1,1,1),(2,1,2),(3,1,4),(4,3,3);
/*!40000 ALTER TABLE `ENTIDADES_CLIENTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PERFIL`
--

DROP TABLE IF EXISTS `PERFIL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PERFIL` (
  `ID` int(11) NOT NULL,
  `FIRTNAME` varchar(100) DEFAULT NULL,
  `LASTNAME` varchar(100) DEFAULT NULL,
  `COUNTRY` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `CLIEN_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_perfiles` (`CLIEN_ID`),
  CONSTRAINT `fk_perfiles` FOREIGN KEY (`CLIEN_ID`) REFERENCES `CLIENTES` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PERFIL`
--

LOCK TABLES `PERFIL` WRITE;
/*!40000 ALTER TABLE `PERFIL` DISABLE KEYS */;
INSERT INTO `PERFIL` VALUES (1,'BRYAN','CRUZ','PANAMA','BRYAN.CRUZ@UIP.EDU.PA',1),(2,'FERNANDO','GONZALES','PANAMA','FEGONZALES@GMAIL.COM',2),(3,'MIGUEL','CASTRELLON','USA','MIGCASTR21@OUTLOOK.ES',3),(4,'ANTONIA','VERGARA','PANAMA','ANVEQWEE@GMAIL.COM',4);
/*!40000 ALTER TABLE `PERFIL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROL`
--

DROP TABLE IF EXISTS `ROL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ROL` (
  `ROL_id` int(11) NOT NULL,
  `BANE` varchar(100) DEFAULT NULL,
  `TYPE` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ROL_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROL`
--

LOCK TABLES `ROL` WRITE;
/*!40000 ALTER TABLE `ROL` DISABLE KEYS */;
INSERT INTO `ROL` VALUES (1,'BANCO GENERAL','SF'),(2,'SCOTIA BANK','SF'),(3,'CREDICORP BANK','SF'),(4,'SUPER XTRA','VA');
/*!40000 ALTER TABLE `ROL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TRANSACCIONES`
--

DROP TABLE IF EXISTS `TRANSACCIONES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TRANSACCIONES` (
  `ID` int(11) NOT NULL,
  `FECHA` datetime DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `TOTAL` decimal(10,2) DEFAULT NULL,
  `CLIEND_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_clientes` (`CLIEND_ID`),
  CONSTRAINT `fk_clientes` FOREIGN KEY (`CLIEND_ID`) REFERENCES `CLIENTES` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TRANSACCIONES`
--

LOCK TABLES `TRANSACCIONES` WRITE;
/*!40000 ALTER TABLE `TRANSACCIONES` DISABLE KEYS */;
INSERT INTO `TRANSACCIONES` VALUES (1,'2024-01-27 00:00:00','pago de mensualidad por servicios financieros',200.00,1),(2,'2024-01-27 00:00:00','pago de mensualidad internet',45.63,2),(3,'2024-01-27 00:00:00','pago de quincena',150.00,3);
/*!40000 ALTER TABLE `TRANSACCIONES` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-27 20:10:31
