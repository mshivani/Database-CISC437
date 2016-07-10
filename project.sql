-- MySQL dump 10.13  Distrib 5.7.11, for osx10.9 (x86_64)
--
-- Host: localhost    Database: CISC474_StackOverflow
-- ------------------------------------------------------
-- Server version	5.7.11

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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `c_id` int(11) NOT NULL,
  `p_id` int(11) DEFAULT NULL,
  `u_id` int(11) DEFAULT NULL,
  `c_date` datetime DEFAULT NULL,
  `text` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`c_id`),
  KEY `com_p_id_idx` (`p_id`),
  KEY `com_u_id_idx` (`u_id`),
  CONSTRAINT `com_p_id` FOREIGN KEY (`p_id`) REFERENCES `posts` (`p_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `com_u_id` FOREIGN KEY (`u_id`) REFERENCES `users` (`u_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `favs`
--

DROP TABLE IF EXISTS `favs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favs` (
  `p_id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  `f_date` datetime DEFAULT NULL,
  PRIMARY KEY (`p_id`,`u_id`),
  KEY `fave_u_id_idx` (`u_id`),
  CONSTRAINT `fave_u_id` FOREIGN KEY (`u_id`) REFERENCES `users` (`u_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `favs_p_id` FOREIGN KEY (`p_id`) REFERENCES `posts` (`p_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `p_id` int(11) NOT NULL,
  `p_type` int(1) DEFAULT NULL,
  `u_id` int(11) DEFAULT NULL,
  `p_date` datetime DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `p_body` varchar(2500) DEFAULT NULL,
  `parent_id` int(1) DEFAULT NULL,
  `accepted_id` int(1) DEFAULT NULL,
  PRIMARY KEY (`p_id`),
  KEY `post_u_id_idx` (`u_id`),
  KEY `title` (`title`),
  KEY `p_date` (`p_date`),
  KEY `p_date_2` (`p_date`),
  CONSTRAINT `post_u_id` FOREIGN KEY (`u_id`) REFERENCES `users` (`u_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `posttags`
--

DROP TABLE IF EXISTS `posttags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posttags` (
  `p_id` int(11) NOT NULL,
  `t_id` int(11) NOT NULL,
  PRIMARY KEY (`p_id`,`t_id`),
  KEY `ptag_t_id_idx` (`t_id`),
  CONSTRAINT `ptag_p_id` FOREIGN KEY (`p_id`) REFERENCES `posts` (`p_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `ptag_t_id` FOREIGN KEY (`t_id`) REFERENCES `tags` (`t_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `t_id` int(11) NOT NULL,
  `t_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `u_id` int(11) NOT NULL,
  `u_name` varchar(45) DEFAULT NULL,
  `u_date` datetime DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `votes`
--

DROP TABLE IF EXISTS `votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `votes` (
  `p_id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  `v_type` int(1) DEFAULT NULL,
  `v_date` datetime DEFAULT NULL,
  KEY `vote_u_id_idx` (`u_id`),
  KEY `vote_p_id_idx` (`p_id`),
  CONSTRAINT `vote_u_id` FOREIGN KEY (`u_id`) REFERENCES `users` (`u_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-26 21:04:02
