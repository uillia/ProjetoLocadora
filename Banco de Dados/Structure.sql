-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: locadora
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `codcliente` int NOT NULL AUTO_INCREMENT,
  `cpf` varchar(20) DEFAULT NULL,
  `numero_cnh` text,
  `nome` varchar(80) DEFAULT NULL,
  `numero` varchar(25) DEFAULT NULL,
  `endereco` text,
  `data_nascimento` date DEFAULT NULL,
  `categoria_cnh` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`codcliente`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `funcionarios`
--

DROP TABLE IF EXISTS `funcionarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionarios` (
  `codfuncionario` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) DEFAULT NULL,
  `endereco` text,
  `data_nascimento` date DEFAULT NULL,
  `cpf` varchar(20) DEFAULT NULL,
  `numero` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`codfuncionario`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `locacao`
--

DROP TABLE IF EXISTS `locacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locacao` (
  `codlocacao` int NOT NULL AUTO_INCREMENT,
  `codcliente` int DEFAULT NULL,
  `codveiculo` int DEFAULT NULL,
  `codfuncionario` int DEFAULT NULL,
  `data_locacao` date DEFAULT NULL,
  `qtdias` double DEFAULT NULL,
  `data_prev` date DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `atividade` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`codlocacao`),
  KEY `locacao_codcliente_fkey` (`codcliente`),
  KEY `locacao_codfuncionario_fkey` (`codfuncionario`),
  KEY `locacao_codveiculo_fkey` (`codveiculo`),
  CONSTRAINT `locacao_codcliente_fkey` FOREIGN KEY (`codcliente`) REFERENCES `clientes` (`codcliente`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `locacao_codfuncionario_fkey` FOREIGN KEY (`codfuncionario`) REFERENCES `funcionarios` (`codfuncionario`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `locacao_codveiculo_fkey` FOREIGN KEY (`codveiculo`) REFERENCES `veiculos` (`codveiculo`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `marcas`
--

DROP TABLE IF EXISTS `marcas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marcas` (
  `codmarca` int NOT NULL AUTO_INCREMENT,
  `nome_marca` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`codmarca`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `registroentrega`
--

DROP TABLE IF EXISTS `registroentrega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registroentrega` (
  `codentrega` int NOT NULL AUTO_INCREMENT,
  `codlocacao` int DEFAULT NULL,
  `codcliente` int DEFAULT NULL,
  `codveiculo` int DEFAULT NULL,
  `codfuncionario` int DEFAULT NULL,
  `data_locacao` date DEFAULT NULL,
  `data_prev` date DEFAULT NULL,
  `data_entrega` date DEFAULT NULL,
  `valortotal` double DEFAULT NULL,
  `multa` int DEFAULT NULL,
  PRIMARY KEY (`codentrega`),
  KEY `registroentrega_codlocacao_fkey` (`codlocacao`),
  KEY `registroentrega_codcliente_fkey` (`codcliente`),
  KEY `registroentrega_codfuncionario_fkey` (`codfuncionario`),
  KEY `registroentrega_codveiculo_fkey` (`codveiculo`),
  CONSTRAINT `registroentrega_codcliente_fkey` FOREIGN KEY (`codcliente`) REFERENCES `locacao` (`codcliente`),
  CONSTRAINT `registroentrega_codfuncionario_fkey` FOREIGN KEY (`codfuncionario`) REFERENCES `locacao` (`codfuncionario`),
  CONSTRAINT `registroentrega_codlocacao_fkey` FOREIGN KEY (`codlocacao`) REFERENCES `locacao` (`codlocacao`),
  CONSTRAINT `registroentrega_codveiculo_fkey` FOREIGN KEY (`codveiculo`) REFERENCES `locacao` (`codveiculo`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `veiculos`
--

DROP TABLE IF EXISTS `veiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veiculos` (
  `codveiculo` int NOT NULL AUTO_INCREMENT,
  `numero_crv` int DEFAULT NULL,
  `codmarca` int DEFAULT NULL,
  `ano` varchar(4) DEFAULT NULL,
  `modelo` varchar(30) DEFAULT NULL,
  `categoria` varchar(4) DEFAULT NULL,
  `quilometragem` text,
  `disponibilidade` int DEFAULT '1',
  `valor_dia` double DEFAULT NULL,
  `valor_fixo` double DEFAULT NULL,
  PRIMARY KEY (`codveiculo`),
  KEY `codmarca` (`codmarca`),
  CONSTRAINT `codmarca` FOREIGN KEY (`codmarca`) REFERENCES `marcas` (`codmarca`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'locadora'
--

--
-- Dumping routines for database 'locadora'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-26 14:41:26
