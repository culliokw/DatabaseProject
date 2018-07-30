

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `AcademicDepartment` (
  `Departmentno` int(11) NOT NULL,
  `EmployeeNoAdvisor` int(11) DEFAULT NULL,
  PRIMARY KEY (`Departmentno`),
  KEY `Academic_Advisor_Num_idx` (`EmployeeNoAdvisor`),
  KEY `Advisor_Employee_Num_idx` (`EmployeeNoAdvisor`),
  CONSTRAINT `EmployeeNoAdvisor` FOREIGN KEY (`EmployeeNoAdvisor`) REFERENCES `staff` (`employeeno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AcademicDepartment`
--

LOCK TABLES `AcademicDepartment` WRITE;
/*!40000 ALTER TABLE `AcademicDepartment` DISABLE KEYS */;
INSERT INTO `AcademicDepartment` VALUES (4,44444444),(3,66664333),(2,77775666), (1,33334444);
/*!40000 ALTER TABLE `AcademicDepartment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `additional_comments`
--

DROP TABLE IF EXISTS `additional_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `additional_comments` (
  `MNumber` int(11) NOT NULL,
  `Comment` varchar(45) NOT NULL,
  PRIMARY KEY (`Comment`),
  KEY `MNumber_idx` (`MNumber`),
  CONSTRAINT `Student_MNumber` FOREIGN KEY (`MNumber`) REFERENCES `student` (`MNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `additional_comments`
--

LOCK TABLES `additional_comments` WRITE;
/*!40000 ALTER TABLE `additional_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `additional_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lease`
--

DROP TABLE IF EXISTS `lease`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `lease` (
  `Leaseno` int(11) NOT NULL,
  `MNumber` int(11) DEFAULT NULL,
  `UniqueSuiteNo` int(11) DEFAULT NULL,
  `UniqueRoomNo` int(11) DEFAULT NULL,
  `Residence_Hall_Name` varchar(45) DEFAULT NULL,
  `Move_In` date DEFAULT NULL,
  `Move_Out` date DEFAULT NULL,
  `Duration` int(11) DEFAULT NULL,
  `Academic_Year` int(11) DEFAULT NULL,
  PRIMARY KEY (`Leaseno`),
  KEY `Student_MNumber_idx` (`MNumber`),
  KEY `Room_UID_idx` (`UniqueRoomNo`),
  KEY `Suite_ID_idx` (`UniqueSuiteNo`),
  KEY `Residence_Hall_Name_idx` (`Residence_Hall_Name`),
  CONSTRAINT `Lessee_MNumber` FOREIGN KEY (`MNumber`) REFERENCES `student` (`mnumber`),
  CONSTRAINT `Residence_Hall_Name` FOREIGN KEY (`Residence_Hall_Name`) REFERENCES `residence_hall` (`name`),
  CONSTRAINT `Room_ID` FOREIGN KEY (`UniqueRoomNo`) REFERENCES `Room` (`roomno`),
  CONSTRAINT `Suite_ID` FOREIGN KEY (`UniqueSuiteNo`) REFERENCES `Suite` (`suiteno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lease`
--

LOCK TABLES `lease` WRITE;
/*!40000 ALTER TABLE `lease` DISABLE KEYS */;
INSERT INTO `lease` VALUES (1,12345670,1,1,'Scioto','2017-09-01','2018-04-28',2,3),(2,12345673,1,2,'Scioto','2017-09-01','2018-04-28',2,3),(3,12345672,2,5,'Scioto','2017-09-01','2018-04-28',2,5),(4,12345674,2,4,'Turner','2017-09-01','2018-04-28',2,5),(5,12345679,2,6,'Turner','2017-09-01','2018-04-28',2,4),(6,12345680,2,7,'Turner','2017-09-01','2018-04-28',2,5),(7,12345681,2,8,'Turner','2017-09-01','2018-04-28',2,5),(8,12345675,NULL,9,'Dabney','2017-09-01','2018-04-28',2,3),(9,12345676,NULL,10,'Daniels','2017-09-01','2018-04-28',2,3),(10,12345677,NULL,11,'Calhoun','2017-09-01','2018-04-28',2,3),(11,12345682,NULL,12,'Stratford','2017-09-01','2018-04-28',2,1),(12,12345683,NULL,13,'Stratford','2017-09-01','2018-04-28',2,2),(13,12345684,NULL,14,'Daniels','2017-09-01','2018-04-28',2,4),(14,12345685,NULL,15,'Turner','2017-09-01','2018-04-28',2,5),
(15,12345672,2,5,'Scioto','2016-09-01','2017-04-28',2,4),(16,12345674,2,4,'Scioto','2016-09-01','2017-04-28',2,4),(17,12345679,2,6,'Scioto','2016-09-01','2017-04-28',2,3),(18,12345680,2,7,'Scioto','2016-09-01','2017-04-28',2,4),(19,12345681,2,8,'Scioto','2016-09-01','2017-04-28',2,4),(20,12345672,2,5,'Scioto','2017-09-01','2018-04-28',2,3),(21,12345674,2,4,'Scioto','2017-09-01','2018-04-28',2,3),(22,12345679,2,6,'Scioto','2017-09-01','2018-04-28',2,2),(23,12345680,2,7,'Scioto','2017-09-01','2018-04-28',2,3),(24,12345681,2,8,'Scioto','2017-09-01','2018-04-28',2,3),(25,12345672,2,5,'Scioto','2015-09-01','2016-04-28',2,2),(26,12345674,2,4,'Scioto','2015-09-01','2016-04-28',2,2),(27,12345679,2,6,'Scioto','2015-09-01','2016-04-28',2,1),(28,12345680,2,7,'Scioto','2015-09-01','2016-04-28',2,2),(29,12345681,2,8,'Scioto','2015-09-01','2016-04-28',2,2),(30,12345672,2,5,'Scioto','2014-09-01','2015-04-28',2,1),(31,12345674,2,4,'Scioto','2014-09-01','2015-04-28',2,1),(32,12345680,2,7,'Scioto','2014-09-01','2015-04-28',2,1),(33,12345681,2,8,'Scioto','2014-09-01','2015-04-28',2,1),
(34,12345684,NULL,14,'Daniels','2016-09-01','2017-04-28',2,3),(35,12345684,NULL,14,'Daniels','2015-09-01','2016-04-28',2,2),(36,12345684,NULL,15,'Turner','2014-09-01','2015-04-28',2,1);
/*!40000 ALTER TABLE `lease` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `residence_hall`
--

DROP TABLE IF EXISTS `residence_hall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `residence_hall` (
  `Name` varchar(45) NOT NULL,
  `EmployeeNoManager` int(11) DEFAULT NULL,
  `Telephone` varchar(45) DEFAULT NULL,
  `House_No` int(11) DEFAULT NULL,
  `Street` varchar(100) DEFAULT NULL,
  `City` varchar(45) DEFAULT NULL,
  `State` varchar(45) DEFAULT NULL,
  `Zip` int(11) DEFAULT NULL,
  PRIMARY KEY (`Name`),
  KEY `Manager_Employee_Num_idx` (`EmployeeNoManager`),
  CONSTRAINT `EmployeeNoManager` FOREIGN KEY (`EmployeeNoManager`) REFERENCES `staff` (`employeeno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `residence_hall`
--

LOCK TABLES `residence_hall` WRITE;
/*!40000 ALTER TABLE `residence_hall` DISABLE KEYS */;
INSERT INTO `residence_hall` VALUES ('Calhoun',22266666,'4565553215',32,'Ravine','Cincinnati','OH',45220),('Dabney',0,'1112223333',365,'Street','Cincinnati','OH',45220),('Daniels',11122222,'9876543211',56,'Searching','Cincinnati','OH',45220),('Turner',55555,'1231234444',321,'Baker','Cincinnati','OH',45220),('Stratford',33399999,'6667778888',300,'Baker','Cincinnati','OH',45220),('Scioto',33388888,'1234567899',45,'Da','Cincinnati','OH',45220);
/*!40000 ALTER TABLE `residence_hall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `room` (
  `Roomno` int(11) NOT NULL,
  `Suiteno` int(11) DEFAULT NULL,
  `Doorno` int(11) DEFAULT NULL,
  `Monthly_Rate` int(11) DEFAULT NULL,
  PRIMARY KEY (`Roomno`),
  KEY `Suite_UID_idx` (`Suiteno`),
  CONSTRAINT `Suite_UID` FOREIGN KEY (`Suiteno`) REFERENCES `suite` (`UniqueSuiteNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,1,121,402),(2,1,120,402),(3,1,122,402),(4,2,408,200),(5,2,407,200),(6,2,406,200),(7,2,405,200),(8,2,404,200),(9,NULL,300,800),(10,NULL,204,800),(11,NULL,101,800),(12,NULL,385,800),(13,NULL,386,800),(14,NULL,207,800),(15,NULL,200,800);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semesters`
--

DROP TABLE IF EXISTS `semesters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `semesters` (
  `Leaseno` int(11) NOT NULL,
  `Semester` varchar(2) NOT NULL,
  KEY `Lease_Num_idx` (`Leaseno`),
  CONSTRAINT `Lease_Num` FOREIGN KEY (`Leaseno`) REFERENCES `lease` (`Leaseno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semesters`
--

LOCK TABLES `semesters` WRITE;
/*!40000 ALTER TABLE `semesters` DISABLE KEYS */;
INSERT INTO `semesters` VALUES (1,'FS'),(1,'SS'),(2,'FS'),(2,'SS'),(3,'FS'),(3,'SS'),(4,'FS'),(4,'SS'),(5,'FS'),(5,'SS'),(6,'FS'),(6,'SS'),(7,'FS'),(7,'SS'),(8,'FS'),(8,'SS'),(9,'FS'),(9,'SS'),(10,'FS'),(10,'SS'),(11,'FS'),(11,'SS'),(12,'FS'),(12,'SS'),(13,'FS'),(13,'SS'),(14,'FS'),(14,'SS');
/*!40000 ALTER TABLE `semesters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `special_needs`
--

DROP TABLE IF EXISTS `special_needs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `special_needs` (
  `MNumber` int(11) NOT NULL,
  `Needs` varchar(45) NOT NULL,
  PRIMARY KEY (`Needs`),
  KEY `MNumber_idx` (`MNumber`),
  CONSTRAINT `MNumber` FOREIGN KEY (`MNumber`) REFERENCES `student` (`MNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `special_needs`
--

LOCK TABLES `special_needs` WRITE;
/*!40000 ALTER TABLE `special_needs` DISABLE KEYS */;
/*!40000 ALTER TABLE `special_needs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `staff` (
  `Employeeno` int(11) NOT NULL,
  `Firstname` varchar(45) DEFAULT NULL,
  `Lastname` varchar(45) DEFAULT NULL,
  `Gender` varchar(1) DEFAULT NULL,
  `Job_Title` varchar(45) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `Residence_Hall_Name` varchar(45) DEFAULT NULL,
  `Office_Num` int(11) DEFAULT NULL,
  PRIMARY KEY (`Employeeno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (0,'Person','Last','F','Hall Manager','1955-01-01','Dabney',100),(55555,'Joe','Smith','M','Hall Manager','1985-01-01','Scioto',0),(10000000,'Steve','McQueen','F','Hall Manager','1950-02-05',NULL,NULL),(11111111,'Johnny','Marr','M','Hall Manager','1900-01-01',NULL,NULL),(11122222,'Mike','Patrick','F','Hall Manager','1955-01-01','Daniels',100),(20000000,'Patrick','Starr','M','Hall Manager','1900-01-01',NULL,NULL),(22266666,'Theodore','Roosevelt','F','Hall Manager','1960-01-01','Calhoun',200),(30000000,'Steven','Sinclair','M','Hall Manager','2000-05-30',NULL,NULL),(33388888,'Lyle','Lanley','M','Hall Manager','1990-01-01','Turner',400),(33399999,'Ken','Baker','M','Hall Manager','1985-01-01','Stratford',300),(44444444,'Jane','Doe','F','Academic Advisor','1960-06-28',NULL,1000),(66664333,'Flynt','Coal','M','Academic Advisor','1970-08-30',NULL,1100),(77775666,'John','Doe','M','Academic Advisor','1980-01-01',NULL,1200),(99999999,'Nick','Stevens','M','Hall Manager','1960-02-01',NULL,NULL), (33334444, 'Steph', 'Curry', 'M', 'Academic Advisor', '1986-09-30', NULL, 1100);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `student` (
  `MNumber` int(11) NOT NULL,
  `Departmentno` int(11) DEFAULT NULL,
  `Firstname` varchar(45) DEFAULT NULL,
  `Lastname` varchar(45) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `Gender` varchar(1) DEFAULT NULL,
  `Category` varchar(45) DEFAULT NULL,
  `Nationality` varchar(45) DEFAULT NULL,
  `Current_Status` varchar(45) DEFAULT NULL,
  `Apt_Num` int(11) DEFAULT NULL,
  `House_Num` int(11) DEFAULT NULL,
  `Street` varchar(45) DEFAULT NULL,
  `City` varchar(45) DEFAULT NULL,
  `State` varchar(45) DEFAULT NULL,
  `Zip` int(11) DEFAULT NULL,
  `Academic_Year` int(11) DEFAULT NULL,
  PRIMARY KEY (`MNumber`),
  KEY `Student_Department_Num_idx` (`Departmentno`),
  CONSTRAINT `Student_Department_Num` FOREIGN KEY (`Departmentno`) REFERENCES `AcademicDepartment` (`departmentno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (12345670,2,'Kyle','Cullion','1997-12-04','M','G','American','placed',121,45,'Da','Cincinnati','OH',45220,3),(12345671,2,'Theodore','Smythe','1996-10-14','M','U','american','waiting',NULL,32,'Ravine','Cincinnati','OH',45220,3),(12345672,3,'Joe','Hirschfeld','1996-08-07','M','G','american','placed',407,321,'Baker','Cincinnati','OH',45220,5),(12345673,2,'Joe','Jobs','1996-09-26','M','U','american','placed',120,45,'Da','Cincinnati','OH',45220,3),(12345674,2,'Ken','Myers','1996-11-26','M','G','american','placed',408,321,'Baker','Cincinnati','OH',45220,5),(12345675,4,'Person','King','1997-01-04','M','G','american','placed',300,365,'Street','Cincinnati','OH',45220,3),(12345676,3,'Mike','Gilbert','1997-06-17','M','U','american','placed',204,56,'Searching','Cincinnati','OH',45220,3),(12345677,3,'William','Klunk','1997-02-24','M','U','indian','placed',101,32,'Ravine','Cincinnati','OH',45220,3),(12345678,4,'Chris','Johnson','1997-02-24','M','U','korean','waiting',NULL,300,'Baker','Cincinnati','OH',45220,1),(12345679,2,'George','Bluthe','1996-11-27','M','G','american','placed',406,321,'Baker','Cincinnati','OH',45220,4),(12345680,3,'Tobias','Funke','1997-09-27','M','G','american','placed',405,321,'Baker','Cincinnati','OH',45220,5),(12345681,4,'Ken','Jenkins','1995-09-30','F','G','american','placed',404,321,'Baker','Cincinnati','OH',45220,5),(12345682,3,'Lyle','Beth','1990-10-21','F','U','spanish','placed',385,300,'Baker','Cincinnati','OH',45220,1),(12345683,2,'Michael','Bluthe','1995-03-26','M','G','russian','placed',386,300,'Baker','Cincinnati','OH',45220,2),(12345684,1,'Rita','Maid','1992-07-04','F','U','portugese','placed',207,56,'Searching','Cincinnati','OH',45220,4),(12345685,2,'Joe','Lex','1997-01-01','M','U','chinese','placed',200,45,'Da','Cincinnati','OH',45220,5),(12345686,2,'Jenni','Hirschfeld','1994-02-01','F','U','american','waiting',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12345687,3,'Madhav','Lolla','1995-03-01','F','G','indian','waiting',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suite`
--

DROP TABLE IF EXISTS `suite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `suite` (
  `UniqueSuiteNo` int(11) NOT NULL,
  `Doorno` int(11) DEFAULT NULL,
  `Bedrooms` int(11) DEFAULT NULL,
  PRIMARY KEY (`UniqueSuiteNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suite`
--

LOCK TABLES `suite` WRITE;
/*!40000 ALTER TABLE `suite` DISABLE KEYS */;
INSERT INTO `suite` VALUES (1,100,3),(2,400,5), (3,300,4), (4,500, 2), (5,700,2);
/*!40000 ALTER TABLE `suite` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


