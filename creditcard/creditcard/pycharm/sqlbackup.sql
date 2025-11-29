/*
SQLyog Community Edition- MySQL GUI v8.03 
MySQL - 5.6.12-log : Database - credit_card
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`credit_card` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `credit_card`;

/*Table structure for table `atm` */

DROP TABLE IF EXISTS `atm`;

CREATE TABLE `atm` (
  `card_id` int(100) NOT NULL AUTO_INCREMENT,
  `c_id` int(100) DEFAULT NULL,
  `card_no` int(100) unsigned zerofill DEFAULT NULL,
  `issue_date` int(100) DEFAULT NULL,
  `expiry_date` int(100) DEFAULT NULL,
  `pin` int(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`card_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `atm` */

insert  into `atm`(`card_id`,`c_id`,`card_no`,`issue_date`,`expiry_date`,`pin`,`status`) values (1,1,0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000222,234,678,99,'approved'),(2,2,0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000222,222,222,22,'rejected');

/*Table structure for table `branch` */

DROP TABLE IF EXISTS `branch`;

CREATE TABLE `branch` (
  `Branch_id` int(100) NOT NULL AUTO_INCREMENT,
  `Branch_name` varchar(100) DEFAULT NULL,
  `Place` varchar(100) DEFAULT NULL,
  `District` varchar(100) DEFAULT NULL,
  `IFSC_code` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Phone` int(100) DEFAULT NULL,
  `branch_code` int(100) DEFAULT NULL,
  PRIMARY KEY (`Branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `branch` */

insert  into `branch`(`Branch_id`,`Branch_name`,`Place`,`District`,`IFSC_code`,`Email`,`Phone`,`branch_code`) values (2,'aa','11','www','ww','ww',0,11),(6,'rfghjkl','45678','ghgsdfgh','rdgy','45678',0,76898);

/*Table structure for table `complaint` */

DROP TABLE IF EXISTS `complaint`;

CREATE TABLE `complaint` (
  `complaint_id` int(100) NOT NULL AUTO_INCREMENT,
  `c_id` int(100) DEFAULT NULL,
  `complaint` varchar(300) DEFAULT NULL,
  `date` varchar(100) DEFAULT NULL,
  `replay` varchar(300) DEFAULT NULL,
  `replay_date` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`complaint_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `complaint` */

insert  into `complaint`(`complaint_id`,`c_id`,`complaint`,`date`,`replay`,`replay_date`) values (1,1,'dfgh',NULL,'dfghjk','2023-01-07');

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `c_id` int(100) NOT NULL AUTO_INCREMENT,
  `c_name` varchar(100) DEFAULT NULL,
  `place` varchar(100) DEFAULT NULL,
  `phone` int(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `house_name` varchar(100) DEFAULT NULL,
  `post` varchar(100) DEFAULT NULL,
  `pin` int(100) DEFAULT NULL,
  `branch_id` int(100) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `district` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `customer` */

insert  into `customer`(`c_id`,`c_name`,`place`,`phone`,`email`,`house_name`,`post`,`pin`,`branch_id`,`photo`,`district`) values (1,'abhi','knr',222,'aaaa','sss','222',77,2,'jj',NULL),(2,'ss','ss',22,'ss','ss','11',11,11,'ss','ss');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `login_id` int(100) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `user_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`login_id`,`user_name`,`password`,`user_type`) values (1,'admin','admin','admin'),(2,'branch','branch','branch');

/*Table structure for table `transaction` */

DROP TABLE IF EXISTS `transaction`;

CREATE TABLE `transaction` (
  `transaction_id` int(100) NOT NULL AUTO_INCREMENT,
  `time` int(100) DEFAULT NULL,
  `date` varchar(100) DEFAULT NULL,
  `amount` int(100) DEFAULT NULL,
  `customer_id` int(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `transaction` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
