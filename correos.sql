-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: correos
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `AreaDeEnvio`
--

DROP TABLE IF EXISTS `AreaDeEnvio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AreaDeEnvio` (
  `id` int NOT NULL,
  `codOficina` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `codOficina` (`codOficina`),
  CONSTRAINT `AreaDeEnvio_ibfk_1` FOREIGN KEY (`codOficina`) REFERENCES `Oficina` (`cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AreaDeEnvio`
--

LOCK TABLES `AreaDeEnvio` WRITE;
/*!40000 ALTER TABLE `AreaDeEnvio` DISABLE KEYS */;
/*!40000 ALTER TABLE `AreaDeEnvio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AreaIncluyeArea`
--

DROP TABLE IF EXISTS `AreaIncluyeArea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AreaIncluyeArea` (
  `idAreaHija` int NOT NULL,
  `idAreaPadre` int NOT NULL,
  PRIMARY KEY (`idAreaHija`,`idAreaPadre`),
  KEY `idAreaPadre` (`idAreaPadre`),
  CONSTRAINT `AreaIncluyeArea_ibfk_1` FOREIGN KEY (`idAreaHija`) REFERENCES `AreaDeEnvio` (`id`),
  CONSTRAINT `AreaIncluyeArea_ibfk_2` FOREIGN KEY (`idAreaPadre`) REFERENCES `AreaDeEnvio` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AreaIncluyeArea`
--

LOCK TABLES `AreaIncluyeArea` WRITE;
/*!40000 ALTER TABLE `AreaIncluyeArea` DISABLE KEYS */;
/*!40000 ALTER TABLE `AreaIncluyeArea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Calle`
--

DROP TABLE IF EXISTS `Calle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Calle` (
  `nombre` varchar(30) NOT NULL,
  `nombreMunicipio` varchar(30) NOT NULL,
  PRIMARY KEY (`nombre`,`nombreMunicipio`),
  KEY `nombreMunicipio` (`nombreMunicipio`),
  CONSTRAINT `Calle_ibfk_1` FOREIGN KEY (`nombreMunicipio`) REFERENCES `Municipio` (`nombre`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Calle`
--

LOCK TABLES `Calle` WRITE;
/*!40000 ALTER TABLE `Calle` DISABLE KEYS */;
/*!40000 ALTER TABLE `Calle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Carta`
--

DROP TABLE IF EXISTS `Carta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Carta` (
  `id` int NOT NULL,
  `fecha` date NOT NULL,
  `formato` varchar(30) NOT NULL,
  `idEmisor` int NOT NULL,
  `idReceptor` int NOT NULL,
  `dniCartero` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `idEmisor` (`idEmisor`),
  KEY `idReceptor` (`idReceptor`),
  KEY `dniCartero` (`dniCartero`),
  CONSTRAINT `Carta_ibfk_1` FOREIGN KEY (`idEmisor`) REFERENCES `UsuarioGenerico` (`id`),
  CONSTRAINT `Carta_ibfk_2` FOREIGN KEY (`idReceptor`) REFERENCES `UsuarioGenerico` (`id`),
  CONSTRAINT `Carta_ibfk_3` FOREIGN KEY (`dniCartero`) REFERENCES `Cartero` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Carta`
--

LOCK TABLES `Carta` WRITE;
/*!40000 ALTER TABLE `Carta` DISABLE KEYS */;
/*!40000 ALTER TABLE `Carta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CartaCertificada`
--

DROP TABLE IF EXISTS `CartaCertificada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CartaCertificada` (
  `id` int NOT NULL,
  `nivelUrgencia` int NOT NULL,
  `dniEmisor` varchar(30) NOT NULL,
  `dniReceptor` varchar(30) NOT NULL,
  `dniCartero` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `dniEmisor` (`dniEmisor`),
  KEY `dniReceptor` (`dniReceptor`),
  KEY `dniCartero` (`dniCartero`),
  CONSTRAINT `CartaCertificada_ibfk_1` FOREIGN KEY (`dniEmisor`) REFERENCES `UsuarioCertificado` (`dni`),
  CONSTRAINT `CartaCertificada_ibfk_2` FOREIGN KEY (`dniReceptor`) REFERENCES `UsuarioCertificado` (`dni`),
  CONSTRAINT `CartaCertificada_ibfk_3` FOREIGN KEY (`dniCartero`) REFERENCES `Cartero` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CartaCertificada`
--

LOCK TABLES `CartaCertificada` WRITE;
/*!40000 ALTER TABLE `CartaCertificada` DISABLE KEYS */;
/*!40000 ALTER TABLE `CartaCertificada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cartero`
--

DROP TABLE IF EXISTS `Cartero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cartero` (
  `dni` varchar(30) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  PRIMARY KEY (`dni`),
  UNIQUE KEY `dni` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cartero`
--

LOCK TABLES `Cartero` WRITE;
/*!40000 ALTER TABLE `Cartero` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cartero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CarteroRecorreAreaDeEnvio`
--

DROP TABLE IF EXISTS `CarteroRecorreAreaDeEnvio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CarteroRecorreAreaDeEnvio` (
  `dniCartero` varchar(30) NOT NULL,
  `idArea` int NOT NULL,
  PRIMARY KEY (`dniCartero`,`idArea`),
  KEY `idArea` (`idArea`),
  CONSTRAINT `CarteroRecorreAreaDeEnvio_ibfk_1` FOREIGN KEY (`dniCartero`) REFERENCES `Cartero` (`dni`),
  CONSTRAINT `CarteroRecorreAreaDeEnvio_ibfk_2` FOREIGN KEY (`idArea`) REFERENCES `AreaDeEnvio` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CarteroRecorreAreaDeEnvio`
--

LOCK TABLES `CarteroRecorreAreaDeEnvio` WRITE;
/*!40000 ALTER TABLE `CarteroRecorreAreaDeEnvio` DISABLE KEYS */;
/*!40000 ALTER TABLE `CarteroRecorreAreaDeEnvio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CentroDeClasificacion`
--

DROP TABLE IF EXISTS `CentroDeClasificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CentroDeClasificacion` (
  `cod` varchar(30) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `nMaxPaquetes` int NOT NULL,
  `nMaxCartas` int NOT NULL,
  `nombreMunicipio` varchar(30) NOT NULL,
  PRIMARY KEY (`cod`),
  UNIQUE KEY `cod` (`cod`),
  KEY `nombreMunicipio` (`nombreMunicipio`),
  CONSTRAINT `CentroDeClasificacion_ibfk_1` FOREIGN KEY (`nombreMunicipio`) REFERENCES `Municipio` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CentroDeClasificacion`
--

LOCK TABLES `CentroDeClasificacion` WRITE;
/*!40000 ALTER TABLE `CentroDeClasificacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `CentroDeClasificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Coche`
--

DROP TABLE IF EXISTS `Coche`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Coche` (
  `matricula` varchar(30) NOT NULL,
  `capacidad` int NOT NULL,
  `codOficina` varchar(30) NOT NULL,
  PRIMARY KEY (`matricula`),
  UNIQUE KEY `matricula` (`matricula`),
  KEY `codOficina` (`codOficina`),
  CONSTRAINT `Coche_ibfk_1` FOREIGN KEY (`codOficina`) REFERENCES `Oficina` (`cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Coche`
--

LOCK TABLES `Coche` WRITE;
/*!40000 ALTER TABLE `Coche` DISABLE KEYS */;
/*!40000 ALTER TABLE `Coche` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Direccion`
--

DROP TABLE IF EXISTS `Direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Direccion` (
  `numero` int NOT NULL,
  `piso` varchar(30) NOT NULL,
  `letra` varchar(30) NOT NULL,
  `Portal` varchar(30) NOT NULL,
  `nombreCalle` varchar(30) NOT NULL,
  `nombreMunicipio` varchar(30) NOT NULL,
  PRIMARY KEY (`numero`,`piso`,`letra`,`Portal`,`nombreCalle`,`nombreMunicipio`),
  KEY `nombreCalle` (`nombreCalle`,`nombreMunicipio`),
  CONSTRAINT `Direccion_ibfk_1` FOREIGN KEY (`nombreCalle`, `nombreMunicipio`) REFERENCES `Calle` (`nombre`, `nombreMunicipio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Direccion`
--

LOCK TABLES `Direccion` WRITE;
/*!40000 ALTER TABLE `Direccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `Direccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EntregaCertificada`
--

DROP TABLE IF EXISTS `EntregaCertificada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EntregaCertificada` (
  `hora` varchar(30) NOT NULL,
  `fecha` date NOT NULL,
  `dniCartero` varchar(30) NOT NULL,
  `idCarta` int NOT NULL,
  `dniUsuario` varchar(30) NOT NULL,
  PRIMARY KEY (`dniCartero`,`idCarta`,`dniUsuario`),
  KEY `idCarta` (`idCarta`),
  KEY `dniUsuario` (`dniUsuario`),
  CONSTRAINT `EntregaCertificada_ibfk_1` FOREIGN KEY (`dniCartero`) REFERENCES `Cartero` (`dni`),
  CONSTRAINT `EntregaCertificada_ibfk_2` FOREIGN KEY (`idCarta`) REFERENCES `Carta` (`id`),
  CONSTRAINT `EntregaCertificada_ibfk_3` FOREIGN KEY (`dniUsuario`) REFERENCES `UsuarioCertificado` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EntregaCertificada`
--

LOCK TABLES `EntregaCertificada` WRITE;
/*!40000 ALTER TABLE `EntregaCertificada` DISABLE KEYS */;
/*!40000 ALTER TABLE `EntregaCertificada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Municipio`
--

DROP TABLE IF EXISTS `Municipio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Municipio` (
  `nombre` varchar(30) NOT NULL,
  `nombreProvincia` varchar(30) NOT NULL,
  PRIMARY KEY (`nombre`),
  UNIQUE KEY `nombre` (`nombre`),
  KEY `nombreProvincia` (`nombreProvincia`),
  CONSTRAINT `Municipio_ibfk_1` FOREIGN KEY (`nombreProvincia`) REFERENCES `Provincia` (`nombre`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Municipio`
--

LOCK TABLES `Municipio` WRITE;
/*!40000 ALTER TABLE `Municipio` DISABLE KEYS */;
/*!40000 ALTER TABLE `Municipio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Oficina`
--

DROP TABLE IF EXISTS `Oficina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Oficina` (
  `cod` varchar(30) NOT NULL,
  `codCentro` varchar(30) NOT NULL,
  PRIMARY KEY (`cod`),
  UNIQUE KEY `cod` (`cod`),
  KEY `codCentro` (`codCentro`),
  CONSTRAINT `Oficina_ibfk_1` FOREIGN KEY (`codCentro`) REFERENCES `CentroDeClasificacion` (`cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Oficina`
--

LOCK TABLES `Oficina` WRITE;
/*!40000 ALTER TABLE `Oficina` DISABLE KEYS */;
/*!40000 ALTER TABLE `Oficina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Paquete`
--

DROP TABLE IF EXISTS `Paquete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Paquete` (
  `id` int NOT NULL,
  `fecha` date NOT NULL,
  `comentario` varchar(200) DEFAULT NULL,
  `idEmisor` int NOT NULL,
  `idReceptor` int NOT NULL,
  `dniCartero` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `idEmisor` (`idEmisor`),
  KEY `idReceptor` (`idReceptor`),
  KEY `dniCartero` (`dniCartero`),
  CONSTRAINT `Paquete_ibfk_1` FOREIGN KEY (`idEmisor`) REFERENCES `UsuarioGenerico` (`id`),
  CONSTRAINT `Paquete_ibfk_2` FOREIGN KEY (`idReceptor`) REFERENCES `UsuarioGenerico` (`id`),
  CONSTRAINT `Paquete_ibfk_3` FOREIGN KEY (`dniCartero`) REFERENCES `Cartero` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Paquete`
--

LOCK TABLES `Paquete` WRITE;
/*!40000 ALTER TABLE `Paquete` DISABLE KEYS */;
/*!40000 ALTER TABLE `Paquete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Provincia`
--

DROP TABLE IF EXISTS `Provincia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Provincia` (
  `nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`nombre`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Provincia`
--

LOCK TABLES `Provincia` WRITE;
/*!40000 ALTER TABLE `Provincia` DISABLE KEYS */;
/*!40000 ALTER TABLE `Provincia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Recogida`
--

DROP TABLE IF EXISTS `Recogida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Recogida` (
  `id` int NOT NULL,
  `fecha` date NOT NULL,
  `numDireccion` int NOT NULL,
  `pisoDireccion` varchar(30) NOT NULL,
  `letraDireccion` varchar(30) NOT NULL,
  `portalDireccion` varchar(30) NOT NULL,
  `nombreCalle` varchar(30) NOT NULL,
  `nombreMunicipio` varchar(30) NOT NULL,
  `dniCartero` varchar(30) NOT NULL,
  `dniUsuario` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `dniUsuario` (`dniUsuario`),
  KEY `numDireccion` (`numDireccion`,`pisoDireccion`,`letraDireccion`,`portalDireccion`,`nombreCalle`,`nombreMunicipio`),
  KEY `dniCartero` (`dniCartero`),
  CONSTRAINT `Recogida_ibfk_1` FOREIGN KEY (`dniUsuario`) REFERENCES `UsuarioCertificado` (`dni`),
  CONSTRAINT `Recogida_ibfk_2` FOREIGN KEY (`numDireccion`, `pisoDireccion`, `letraDireccion`, `portalDireccion`, `nombreCalle`, `nombreMunicipio`) REFERENCES `Direccion` (`numero`, `piso`, `letra`, `Portal`, `nombreCalle`, `nombreMunicipio`),
  CONSTRAINT `Recogida_ibfk_3` FOREIGN KEY (`dniCartero`) REFERENCES `Cartero` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Recogida`
--

LOCK TABLES `Recogida` WRITE;
/*!40000 ALTER TABLE `Recogida` DISABLE KEYS */;
/*!40000 ALTER TABLE `Recogida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reparto`
--

DROP TABLE IF EXISTS `Reparto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Reparto` (
  `id` int NOT NULL,
  `fecha` date NOT NULL,
  `idRuta` int NOT NULL,
  `matriculaCoche` varchar(30) NOT NULL,
  `dniCartero` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `matriculaCoche` (`matriculaCoche`),
  KEY `dniCartero` (`dniCartero`),
  KEY `idRuta` (`idRuta`),
  CONSTRAINT `Reparto_ibfk_1` FOREIGN KEY (`matriculaCoche`) REFERENCES `Coche` (`matricula`),
  CONSTRAINT `Reparto_ibfk_2` FOREIGN KEY (`dniCartero`) REFERENCES `Cartero` (`dni`),
  CONSTRAINT `Reparto_ibfk_3` FOREIGN KEY (`idRuta`) REFERENCES `Ruta` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reparto`
--

LOCK TABLES `Reparto` WRITE;
/*!40000 ALTER TABLE `Reparto` DISABLE KEYS */;
/*!40000 ALTER TABLE `Reparto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ruta`
--

DROP TABLE IF EXISTS `Ruta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ruta` (
  `id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ruta`
--

LOCK TABLES `Ruta` WRITE;
/*!40000 ALTER TABLE `Ruta` DISABLE KEYS */;
/*!40000 ALTER TABLE `Ruta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SegmentoDeCalle`
--

DROP TABLE IF EXISTS `SegmentoDeCalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SegmentoDeCalle` (
  `numSegmento` int NOT NULL,
  `numInicio` int NOT NULL,
  `numFinal` int NOT NULL,
  `nombreCalle` varchar(30) NOT NULL,
  `nombreMunicipio` varchar(30) NOT NULL,
  PRIMARY KEY (`numSegmento`,`nombreCalle`,`nombreMunicipio`),
  KEY `nombreCalle` (`nombreCalle`,`nombreMunicipio`),
  CONSTRAINT `SegmentoDeCalle_ibfk_1` FOREIGN KEY (`nombreCalle`, `nombreMunicipio`) REFERENCES `Calle` (`nombre`, `nombreMunicipio`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SegmentoDeCalle`
--

LOCK TABLES `SegmentoDeCalle` WRITE;
/*!40000 ALTER TABLE `SegmentoDeCalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `SegmentoDeCalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SegmentoIncluyeRuta`
--

DROP TABLE IF EXISTS `SegmentoIncluyeRuta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SegmentoIncluyeRuta` (
  `idRuta` int NOT NULL,
  `numSegmento` int NOT NULL,
  `numOrden` varchar(30) NOT NULL,
  PRIMARY KEY (`idRuta`,`numSegmento`),
  KEY `numSegmento` (`numSegmento`),
  CONSTRAINT `SegmentoIncluyeRuta_ibfk_1` FOREIGN KEY (`idRuta`) REFERENCES `Ruta` (`id`),
  CONSTRAINT `SegmentoIncluyeRuta_ibfk_2` FOREIGN KEY (`numSegmento`) REFERENCES `SegmentoDeCalle` (`numSegmento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SegmentoIncluyeRuta`
--

LOCK TABLES `SegmentoIncluyeRuta` WRITE;
/*!40000 ALTER TABLE `SegmentoIncluyeRuta` DISABLE KEYS */;
/*!40000 ALTER TABLE `SegmentoIncluyeRuta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Trabaja`
--

DROP TABLE IF EXISTS `Trabaja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Trabaja` (
  `fechaComienzo` date NOT NULL,
  `dniCartero` varchar(30) NOT NULL,
  `codOficina` varchar(30) NOT NULL,
  `jornadaTurno` varchar(30) NOT NULL,
  PRIMARY KEY (`fechaComienzo`,`codOficina`,`jornadaTurno`),
  KEY `codOficina` (`codOficina`),
  KEY `jornadaTurno` (`jornadaTurno`),
  CONSTRAINT `Trabaja_ibfk_1` FOREIGN KEY (`codOficina`) REFERENCES `Oficina` (`cod`),
  CONSTRAINT `Trabaja_ibfk_2` FOREIGN KEY (`jornadaTurno`) REFERENCES `Turno` (`jornada`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Trabaja`
--

LOCK TABLES `Trabaja` WRITE;
/*!40000 ALTER TABLE `Trabaja` DISABLE KEYS */;
/*!40000 ALTER TABLE `Trabaja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Turno`
--

DROP TABLE IF EXISTS `Turno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Turno` (
  `jornada` varchar(30) NOT NULL,
  `horario` varchar(30) NOT NULL,
  `codOficina` varchar(30) NOT NULL,
  PRIMARY KEY (`jornada`,`codOficina`),
  KEY `codOficina` (`codOficina`),
  CONSTRAINT `Turno_ibfk_1` FOREIGN KEY (`codOficina`) REFERENCES `Oficina` (`cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Turno`
--

LOCK TABLES `Turno` WRITE;
/*!40000 ALTER TABLE `Turno` DISABLE KEYS */;
/*!40000 ALTER TABLE `Turno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UsuarioCertificado`
--

DROP TABLE IF EXISTS `UsuarioCertificado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `UsuarioCertificado` (
  `dni` varchar(30) NOT NULL,
  `mail` varchar(30) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `dniAutorizado` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`dni`),
  UNIQUE KEY `dni` (`dni`),
  KEY `dniAutorizado` (`dniAutorizado`),
  CONSTRAINT `UsuarioCertificado_ibfk_1` FOREIGN KEY (`dniAutorizado`) REFERENCES `UsuarioCertificado` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UsuarioCertificado`
--

LOCK TABLES `UsuarioCertificado` WRITE;
/*!40000 ALTER TABLE `UsuarioCertificado` DISABLE KEYS */;
/*!40000 ALTER TABLE `UsuarioCertificado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UsuarioGenerico`
--

DROP TABLE IF EXISTS `UsuarioGenerico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `UsuarioGenerico` (
  `id` int NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `numDireccion` int NOT NULL,
  `pisoDireccion` varchar(30) NOT NULL,
  `letraDireccion` varchar(30) NOT NULL,
  `portalDireccion` varchar(30) NOT NULL,
  `nombreCalle` varchar(30) NOT NULL,
  `nombreMunicipio` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `numDireccion` (`numDireccion`,`pisoDireccion`,`letraDireccion`,`portalDireccion`,`nombreCalle`,`nombreMunicipio`),
  CONSTRAINT `UsuarioGenerico_ibfk_1` FOREIGN KEY (`numDireccion`, `pisoDireccion`, `letraDireccion`, `portalDireccion`, `nombreCalle`, `nombreMunicipio`) REFERENCES `Direccion` (`numero`, `piso`, `letra`, `Portal`, `nombreCalle`, `nombreMunicipio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UsuarioGenerico`
--

LOCK TABLES `UsuarioGenerico` WRITE;
/*!40000 ALTER TABLE `UsuarioGenerico` DISABLE KEYS */;
/*!40000 ALTER TABLE `UsuarioGenerico` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-17 16:04:49
