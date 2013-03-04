-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 04, 2013 at 05:07 PM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `evaluation_sys`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE IF NOT EXISTS `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `code` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `course_eval`
--

CREATE TABLE IF NOT EXISTS `course_eval` (
  `student_id` int(11) NOT NULL,
  `eval_id` int(11) NOT NULL,
  `e1` enum('1','2','3','4','5') NOT NULL,
  `e2` enum('1','2','3','4','5') NOT NULL,
  `e3` enum('1','2','3','4','5') NOT NULL,
  `e4` enum('1','2','3','4','5') NOT NULL,
  `e5` enum('1','2','3','4','5') NOT NULL,
  `comment` varchar(200) DEFAULT NULL,
  `late` int(1) unsigned NOT NULL DEFAULT '0' COMMENT 'field indicates if the student fill evaluation late(1) or on time(0)',
  PRIMARY KEY (`student_id`,`eval_id`),
  KEY `eval_id` (`eval_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `evaluation`
--

CREATE TABLE IF NOT EXISTS `evaluation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `track_id` int(11) NOT NULL,
  `inst_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `due_date` date NOT NULL,
  `active` enum('activated','deactivated') NOT NULL DEFAULT 'activated',
  PRIMARY KEY (`id`),
  KEY `track_id` (`track_id`),
  KEY `inst_id` (`inst_id`),
  KEY `course_id` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `instructor`
--

CREATE TABLE IF NOT EXISTS `instructor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `work` int(1) unsigned NOT NULL DEFAULT '1' COMMENT 'field indicates if instructor still work or not',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `instructor`
--

INSERT INTO `instructor` (`id`, `name`, `work`) VALUES
(1, 'ahmed', 1),
(2, 'farag', 1),
(3, 'shaimaa', 1);

-- --------------------------------------------------------

--
-- Table structure for table `instructor_eval`
--

CREATE TABLE IF NOT EXISTS `instructor_eval` (
  `student_id` int(11) NOT NULL,
  `eval_id` int(11) NOT NULL,
  `e1` enum('1','2','3','4','5') NOT NULL,
  `e2` enum('1','2','3','4','5') NOT NULL,
  `e3` enum('1','2','3','4','5') NOT NULL,
  `e4` enum('1','2','3','4','5') NOT NULL,
  `e5` enum('1','2','3','4','5') NOT NULL,
  `comment` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`student_id`,`eval_id`),
  KEY `eval_id` (`eval_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `inst_course`
--

CREATE TABLE IF NOT EXISTS `inst_course` (
  `course_id` int(11) NOT NULL,
  `inst_id` int(11) NOT NULL,
  `scope` enum('1','2') NOT NULL,
  PRIMARY KEY (`course_id`,`inst_id`),
  KEY `inst_id` (`inst_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `intake`
--

CREATE TABLE IF NOT EXISTS `intake` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `intake_no` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `intake_no` (`intake_no`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `intake`
--

INSERT INTO `intake` (`id`, `intake_no`) VALUES
(1, '33');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `username` varchar(25) NOT NULL COMMENT 'username of student',
  `password` varchar(40) NOT NULL,
  `track_id` int(11) NOT NULL,
  `intake_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `track_id` (`track_id`),
  KEY `intake_id` (`intake_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `name`, `username`, `password`, `track_id`, `intake_id`) VALUES
(3, 'Ahmed Habib', 'ahmedhabib', '123', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `track`
--

CREATE TABLE IF NOT EXISTS `track` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `supervisor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `supervisor_id` (`supervisor_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `track`
--

INSERT INTO `track` (`id`, `name`, `supervisor_id`) VALUES
(1, 'open source', 1);

-- --------------------------------------------------------

--
-- Table structure for table `track_course_intake`
--

CREATE TABLE IF NOT EXISTS `track_course_intake` (
  `track_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `intake_id` int(11) NOT NULL,
  PRIMARY KEY (`track_id`,`course_id`,`intake_id`),
  KEY `course_id` (`course_id`),
  KEY `intake_id` (`intake_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `course_eval`
--
ALTER TABLE `course_eval`
  ADD CONSTRAINT `course_eval_ibfk_6` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `course_eval_ibfk_5` FOREIGN KEY (`eval_id`) REFERENCES `evaluation` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `evaluation`
--
ALTER TABLE `evaluation`
  ADD CONSTRAINT `evaluation_ibfk_8` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `evaluation_ibfk_4` FOREIGN KEY (`track_id`) REFERENCES `track` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `evaluation_ibfk_7` FOREIGN KEY (`inst_id`) REFERENCES `instructor` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `instructor_eval`
--
ALTER TABLE `instructor_eval`
  ADD CONSTRAINT `instructor_eval_ibfk_6` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `instructor_eval_ibfk_4` FOREIGN KEY (`eval_id`) REFERENCES `evaluation` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `inst_course`
--
ALTER TABLE `inst_course`
  ADD CONSTRAINT `inst_course_ibfk_4` FOREIGN KEY (`inst_id`) REFERENCES `instructor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `inst_course_ibfk_3` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_8` FOREIGN KEY (`intake_id`) REFERENCES `intake` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `student_ibfk_7` FOREIGN KEY (`track_id`) REFERENCES `track` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `track`
--
ALTER TABLE `track`
  ADD CONSTRAINT `track_ibfk_2` FOREIGN KEY (`supervisor_id`) REFERENCES `instructor` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `track_course_intake`
--
ALTER TABLE `track_course_intake`
  ADD CONSTRAINT `track_course_intake_ibfk_6` FOREIGN KEY (`intake_id`) REFERENCES `intake` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `track_course_intake_ibfk_4` FOREIGN KEY (`track_id`) REFERENCES `track` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `track_course_intake_ibfk_5` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
