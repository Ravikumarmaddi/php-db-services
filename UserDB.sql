-- MySQL dump 10.11
--
-- Host: localhost    Database: UserDB1
-- ------------------------------------------------------
-- Server version	5.0.51b-log

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
-- Table structure for table `adminRoles`
--

DROP TABLE IF EXISTS `adminRoles`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `adminRoles` (
  `adminRoleID` int(4) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY  (`adminRoleID`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `adminRoles`
--

LOCK TABLES `adminRoles` WRITE;
/*!40000 ALTER TABLE `adminRoles` DISABLE KEYS */;
/*!40000 ALTER TABLE `adminRoles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `department` (
  `depID` int(4) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY  (`depID`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userToAdminRole`
--

DROP TABLE IF EXISTS `userToAdminRole`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `userToAdminRole` (
  `userToAdminRoleId` int(4) unsigned NOT NULL,
  `userID` int(4) unsigned NOT NULL,
  `adminRoleID` int(4) unsigned NOT NULL,
  PRIMARY KEY  (`userToAdminRoleId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `userToAdminRole`
--

LOCK TABLES `userToAdminRole` WRITE;
/*!40000 ALTER TABLE `userToAdminRole` DISABLE KEYS */;
/*!40000 ALTER TABLE `userToAdminRole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userinfo`
--

DROP TABLE IF EXISTS `userinfo`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `userinfo` (
  `userID` int(4) unsigned NOT NULL,
  `name` varchar(50) default NULL,
  `depId` int(4) NOT NULL,
  PRIMARY KEY  (`userID`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `userinfo`
--

LOCK TABLES `userinfo` WRITE;
/*!40000 ALTER TABLE `userinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `userinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'UserDB1'
--
DELIMITER ;;
/*!50003 DROP PROCEDURE IF EXISTS `addUser` */;;
/*!50003 SET SESSION SQL_MODE=""*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `addUser`(name varchar(64),department varchar(64),role
    varchar(64))
BEGIN      
        set @name = name;
        set @dep = department;
        set @role = role;
        INSERT INTO userinfo (name,depID) values(@name,(select depID from
                department where name = @dep));
        INSERT INTO  userToAdminRole (userID,adminRoleID) values ((select userID
                from userinfo where name = @name),(select adminRoleID from
                adminRoles where name = @role));
    
END */;;
/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE*/;;
/*!50003 DROP PROCEDURE IF EXISTS `getCategoryList` */;;
/*!50003 SET SESSION SQL_MODE=""*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `getCategoryList`(name varchar(64),department varchar(64),role
    varchar(64))
BEGIN      
        set @name = name;
        set @dep = department;
        set @role = role;
        INSERT INTO userinfo (name,depID) values(@name,(select depID from
                department where name = @dep));
        INSERT INTO  userToAdminRole (userID,adminRoleID) values ((select userID
                from userinfo where name = @name),(select adminRoleID from
                adminRoles where name = @role));
    
END */;;
/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE*/;;
DELIMITER ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-03-17  9:27:44
