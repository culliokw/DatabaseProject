-- MySQL dump 10.13  Distrib 5.7.22, for Linux (i686)
--
-- Host: localhost    Database: UniversityDB
-- ------------------------------------------------------
-- Server version	5.7.22-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `AcademicDepartment`
--

DROP TABLE IF EXISTS `AcademicDepartment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AcademicDepartment` (
  `Department_No` int(11) NOT NULL,
  `Employee_No_Advisor` int(11) DEFAULT NULL,
  PRIMARY KEY (`Department_No`),
  KEY `fk_AcademicDepartment_Staff_idx` (`Employee_No_Advisor`),
  CONSTRAINT `fk_AcademicDepartment_Staff` FOREIGN KEY (`Employee_No_Advisor`) REFERENCES `Staff` (`Employee_No`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AcademicDepartment`
--

LOCK TABLES `AcademicDepartment` WRITE;
/*!40000 ALTER TABLE `AcademicDepartment` DISABLE KEYS */;
/*!40000 ALTER TABLE `AcademicDepartment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AdditionalComments`
--

DROP TABLE IF EXISTS `AdditionalComments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AdditionalComments` (
  `MNumber` varchar(45) DEFAULT NULL,
  `Comments` varchar(45) NOT NULL,
  PRIMARY KEY (`Comments`),
  KEY `fk_AdditionalComments_MN_idx` (`MNumber`),
  CONSTRAINT `fk_AdditionalComments_Student` FOREIGN KEY (`MNumber`) REFERENCES `Student` (`MNumber`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AdditionalComments`
--

LOCK TABLES `AdditionalComments` WRITE;
/*!40000 ALTER TABLE `AdditionalComments` DISABLE KEYS */;
/*!40000 ALTER TABLE `AdditionalComments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Lease`
--

DROP TABLE IF EXISTS `Lease`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Lease` (
  `Lease_No` int(11) NOT NULL,
  `MNumber` varchar(10) DEFAULT NULL,
  `Unique_Suite_No` int(11) DEFAULT NULL,
  `Unique_Room_No` int(11) DEFAULT NULL,
  `Residence_Hall_Name` varchar(45) DEFAULT NULL,
  `Move_Out` date DEFAULT NULL,
  `Move_In` date DEFAULT NULL,
  `Duration` int(11) DEFAULT NULL,
  PRIMARY KEY (`Lease_No`),
  KEY `fk_Lease_1_idx` (`MNumber`),
  KEY `fk_Lease_Suite_idx` (`Unique_Suite_No`),
  KEY `fk_Lease_Room_idx` (`Unique_Room_No`),
  KEY `fk_Lease_Res_Hall_idx` (`Residence_Hall_Name`),
  CONSTRAINT `fk_Lease_Mnumber` FOREIGN KEY (`MNumber`) REFERENCES `Student` (`MNumber`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Lease_ResidenceHall` FOREIGN KEY (`Residence_Hall_Name`) REFERENCES `ResidenceHall` (`Name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Lease_Room` FOREIGN KEY (`Unique_Room_No`) REFERENCES `Room` (`Unique_Room_No`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Lease_Suite` FOREIGN KEY (`Unique_Suite_No`) REFERENCES `Suite` (`Unique_Suite_No`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Lease`
--

LOCK TABLES `Lease` WRITE;
/*!40000 ALTER TABLE `Lease` DISABLE KEYS */;
/*!40000 ALTER TABLE `Lease` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ResidenceHall`
--

DROP TABLE IF EXISTS `ResidenceHall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ResidenceHall` (
  `Name` varchar(45) NOT NULL,
  `Employee_No_Manager` int(11) DEFAULT NULL,
  `Telephone` varchar(10) DEFAULT NULL,
  `Address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Name`),
  KEY `fk_ResidenceHall_Suite_idx` (`Employee_No_Manager`),
  CONSTRAINT `fk_ResidenceHall_Suite` FOREIGN KEY (`Employee_No_Manager`) REFERENCES `Staff` (`Employee_No`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ResidenceHall`
--

LOCK TABLES `ResidenceHall` WRITE;
/*!40000 ALTER TABLE `ResidenceHall` DISABLE KEYS */;
/*!40000 ALTER TABLE `ResidenceHall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Room`
--

DROP TABLE IF EXISTS `Room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Room` (
  `Unique_Room_No` int(11) NOT NULL,
  `Unique_Suite_No` int(11) DEFAULT NULL,
  `Door_No` int(11) DEFAULT NULL,
  `Monthly_Rate` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`Unique_Room_No`),
  KEY `fk_Room_Suite_idx` (`Unique_Suite_No`),
  CONSTRAINT `fk_Room_Suite` FOREIGN KEY (`Unique_Suite_No`) REFERENCES `Suite` (`Unique_Suite_No`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Room`
--

LOCK TABLES `Room` WRITE;
/*!40000 ALTER TABLE `Room` DISABLE KEYS */;
/*!40000 ALTER TABLE `Room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Semesters`
--

DROP TABLE IF EXISTS `Semesters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Semesters` (
  `Lease_No` int(11) DEFAULT NULL,
  `Semester` varchar(45) NOT NULL,
  PRIMARY KEY (`Semester`),
  KEY `fk_Semesters_1_idx` (`Lease_No`),
  CONSTRAINT `fk_Semesters_1` FOREIGN KEY (`Lease_No`) REFERENCES `Lease` (`Lease_No`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Semesters`
--

LOCK TABLES `Semesters` WRITE;
/*!40000 ALTER TABLE `Semesters` DISABLE KEYS */;
/*!40000 ALTER TABLE `Semesters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SpecialNeeds`
--

DROP TABLE IF EXISTS `SpecialNeeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SpecialNeeds` (
  `MNumber` varchar(45) DEFAULT NULL,
  `Needs` varchar(45) NOT NULL,
  PRIMARY KEY (`Needs`),
  KEY `fk_SpecialNeeds_MN_idx` (`MNumber`),
  CONSTRAINT `fk_SpecialNeeds_Student` FOREIGN KEY (`MNumber`) REFERENCES `Student` (`MNumber`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SpecialNeeds`
--

LOCK TABLES `SpecialNeeds` WRITE;
/*!40000 ALTER TABLE `SpecialNeeds` DISABLE KEYS */;
/*!40000 ALTER TABLE `SpecialNeeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Staff`
--

DROP TABLE IF EXISTS `Staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Staff` (
  `Employee_No` int(11) NOT NULL,
  `First_Name` varchar(15) DEFAULT NULL,
  `Last_Name` varchar(15) DEFAULT NULL,
  `Gender` varchar(1) DEFAULT NULL,
  `Job_Title` varchar(45) DEFAULT NULL,
  `Dob` date DEFAULT NULL,
  `Residence_Hall_Name` varchar(45) DEFAULT NULL,
  `Office_No` int(11) DEFAULT NULL,
  PRIMARY KEY (`Employee_No`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Staff`
--

LOCK TABLES `Staff` WRITE;
/*!40000 ALTER TABLE `Staff` DISABLE KEYS */;
/*!40000 ALTER TABLE `Staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Student`
--

DROP TABLE IF EXISTS `Student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Student` (
  `MNumber` varchar(45) NOT NULL,
  `First_Name` varchar(45) DEFAULT NULL,
  `Last_Name` varchar(45) DEFAULT NULL,
  `Dob` date DEFAULT NULL,
  `Gender` varchar(1) DEFAULT NULL,
  `Category` varchar(45) DEFAULT NULL,
  `Nationality` varchar(45) DEFAULT NULL,
  `Current_Status` varchar(45) DEFAULT NULL,
  `Apt_No` int(8) DEFAULT NULL,
  `House_No` int(8) DEFAULT NULL,
  `Street` varchar(45) DEFAULT NULL,
  `City` varchar(45) DEFAULT NULL,
  `State` varchar(15) DEFAULT NULL,
  `Zipcode` varchar(5) DEFAULT NULL,
  `Year` varchar(4) DEFAULT NULL,
  `Department_No` int(11) DEFAULT NULL,
  PRIMARY KEY (`MNumber`),
  KEY `fk_Student_Department_idx` (`Department_No`),
  CONSTRAINT `fk_Student_Department` FOREIGN KEY (`Department_No`) REFERENCES `AcademicDepartment` (`Department_No`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student`
--

LOCK TABLES `Student` WRITE;
/*!40000 ALTER TABLE `Student` DISABLE KEYS */;
/*!40000 ALTER TABLE `Student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Suite`
--

DROP TABLE IF EXISTS `Suite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Suite` (
  `Unique_Suite_No` int(11) NOT NULL,
  `Door_No` int(11) DEFAULT NULL,
  `Bedrooms` int(11) DEFAULT NULL,
  PRIMARY KEY (`Unique_Suite_No`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Suite`
--

LOCK TABLES `Suite` WRITE;
/*!40000 ALTER TABLE `Suite` DISABLE KEYS */;
/*!40000 ALTER TABLE `Suite` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-27 11:48:01
