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
  `card_no` int(12) unsigned zerofill DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `pin` int(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`card_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `atm` */

insert  into `atm`(`card_id`,`c_id`,`card_no`,`issue_date`,`expiry_date`,`pin`,`status`) values (1,0,000000000225,'0000-00-00','0000-00-00',8,'approved'),(2,2,000000000006,'0000-00-00','0000-00-00',8,'approved'),(3,3,000002222222,'0000-00-00','0000-00-00',22,'pending'),(5,2,000000001212,'0000-00-00','0000-00-00',67543,'forwarded'),(6,2,000000000124,'0000-00-00','0000-00-00',0,'forwarded'),(7,2,000012121212,'2022-12-05','2022-12-05',12,'forwarded'),(8,4,000000000002,'2023-01-04','2023-01-29',23456,'forwarded'),(9,4,000000000333,'2023-02-19','2023-02-26',323,'pending'),(10,4,000000000000,'2023-02-05','2023-03-03',23456,'pending'),(11,4,000000345678,'2023-02-10','2023-03-04',2345678,'pending');

/*Table structure for table `blockhistory` */

DROP TABLE IF EXISTS `blockhistory`;

CREATE TABLE `blockhistory` (
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(20) DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `counter_id` int(11) DEFAULT NULL,
  `atm_id` int(11) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `blockhistory` */

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `branch` */

insert  into `branch`(`Branch_id`,`Branch_name`,`Place`,`District`,`IFSC_code`,`Email`,`Phone`,`branch_code`) values (2,'branch','45678','ghgsdfgh','rdgy','45678',121243453,76898),(7,'kannur','dfgbg','kannur','kannur','SDF2345',325656252,987654321),(8,'mn','jnjn','jnkj','kmk','mnkn',0,0),(9,'asd','45sdf','sdf','sdfv','sdfgcvb',0,0),(10,'pilatahara','qwer','asdfg','sdfgh','sdfg',0,0),(11,'pilatahara','qwer','asdfg','sdfgh','sdfg',0,0);

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

/*Table structure for table `counter` */

DROP TABLE IF EXISTS `counter`;

CREATE TABLE `counter` (
  `counter_id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) DEFAULT NULL,
  `place` varchar(50) DEFAULT NULL,
  `latitude` varchar(50) DEFAULT NULL,
  `longitude` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`counter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `counter` */

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `customer` */

insert  into `customer`(`c_id`,`c_name`,`place`,`phone`,`email`,`house_name`,`post`,`pin`,`branch_id`,`photo`,`district`) values (2,'ss','ss',22,' ss','ss','11',11,11,'/static/pic/230117-150005.jpg','ss'),(4,'sudu','kannur',2562563,'  fdzfdgsfh@gmail.com','aaaa','knr',1234,2,'/static/pic/230131-150046.jpg','knr');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `login_id` int(100) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `user_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`login_id`,`user_name`,`password`,`user_type`) values (1,'admin','admin','admin'),(2,'branch','branch','branch'),(3,'sss','2767','customer'),(4,'fdzfdgsfh@gmail.com','6146','customer');

/*Table structure for table `transaction` */

DROP TABLE IF EXISTS `transaction`;

CREATE TABLE `transaction` (
  `transaction_id` int(100) NOT NULL AUTO_INCREMENT,
  `time` varchar(20) DEFAULT NULL,
  `date` varchar(20) DEFAULT NULL,
  `amount` int(100) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `type(credit,debit)` varchar(20) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`transaction_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `transaction` */

insert  into `transaction`(`transaction_id`,`time`,`date`,`amount`,`customer_id`,`type(credit,debit)`,`description`) values (1,'12:00:00','2023-01-12',1000,NULL,NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
