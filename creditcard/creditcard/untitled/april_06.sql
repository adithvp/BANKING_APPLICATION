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

/*Table structure for table `account` */

DROP TABLE IF EXISTS `account`;

CREATE TABLE `account` (
  `account_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) DEFAULT NULL,
  `IFSC_code` varchar(100) DEFAULT NULL,
  `account_no` int(11) DEFAULT NULL,
  `balance` int(11) DEFAULT '500',
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `account` */

insert  into `account`(`account_id`,`c_id`,`IFSC_code`,`account_no`,`balance`) values (1,9,'1234',1234,519000),(2,17,'12345',12345,1010000);

/*Table structure for table `atm` */

DROP TABLE IF EXISTS `atm`;

CREATE TABLE `atm` (
  `card_id` int(100) NOT NULL AUTO_INCREMENT,
  `c_id` int(100) DEFAULT NULL,
  `card_no` varchar(200) DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `pin` int(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`card_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `atm` */

insert  into `atm`(`card_id`,`c_id`,`card_no`,`issue_date`,`expiry_date`,`pin`,`status`) values (1,9,'1234','2023-03-17','2028-10-17',670504,'approved'),(2,10,'2342','2023-03-25','2023-03-23',1234,'approved'),(3,13,'123456789012','2023-04-30','2023-05-07',670504,'approved'),(4,16,'123456','2023-04-30','2023-04-22',670504,'pending'),(5,17,'12345','2023-04-30','2023-11-25',670504,'blocked'),(6,17,'pending','0000-00-00','0000-00-00',0,'pending');

/*Table structure for table `blockhistory` */

DROP TABLE IF EXISTS `blockhistory`;

CREATE TABLE `blockhistory` (
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(20) DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `atm_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `blockhistory` */

insert  into `blockhistory`(`history_id`,`date`,`time`,`atm_id`) values (1,'2023-04-06','17:00:18',5);

/*Table structure for table `branch` */

DROP TABLE IF EXISTS `branch`;

CREATE TABLE `branch` (
  `Branch_id` int(100) NOT NULL AUTO_INCREMENT,
  `Branch_name` varchar(100) DEFAULT NULL,
  `Place` varchar(100) DEFAULT NULL,
  `District` varchar(100) DEFAULT NULL,
  `IFSC_code` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Phone` bigint(200) DEFAULT NULL,
  `branch_code` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Data for the table `branch` */

insert  into `branch`(`Branch_id`,`Branch_name`,`Place`,`District`,`IFSC_code`,`Email`,`Phone`,`branch_code`) values (5,'kannur','kannur','kannur','123456','abhinnandu135@gmail.com',9876543212,'er456'),(14,'pilathara','pilathara','kannur','12345','pilathara@gmail.com',9874563210,'12345'),(15,'pilathara','pilathara','kannur','12345','pilathara@gmail.com',9874563210,'12345');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `complaint` */

insert  into `complaint`(`complaint_id`,`c_id`,`complaint`,`date`,`replay`,`replay_date`) values (1,13,'hhiiiisnjsksk','2023-04-06','nhgbv hjbj','2023-04-06'),(2,17,'haiiii','2023-04-06','helooo','2023-04-06');

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
  `phone` bigint(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `house_name` varchar(100) DEFAULT NULL,
  `post` varchar(100) DEFAULT NULL,
  `pin` int(100) DEFAULT NULL,
  `branch_id` int(100) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `district` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

/*Data for the table `customer` */

insert  into `customer`(`c_id`,`c_name`,`place`,`phone`,`email`,`house_name`,`post`,`pin`,`branch_id`,`photo`,`district`) values (9,'Abhinand','pilathara',2147483647,'abhinnandu135@gmail.com','PILATHARA','vilayancode',670504,8,'/static/pic/230317-151529.jpg','kannur'),(10,'adith','pazhayangadi',6282877095,'adithvp318@gmail.com','vp','pazhayangadi',670303,8,'/static/pic/230317-152142.jpg','kannur'),(13,'sayooj','asd',9874563210,'sayoojkrishnajr100@gmail.com','asd','asd',123456,2,'/static/pic/230406-095047.jpg','asd'),(17,'sayooj','pilathara',9874563210,'sayoojkrishnajr100@gmail.com','abcd','pilathara',670504,15,'/static/pic/230406-144453.jpg','kannur');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `login_id` int(100) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `user_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`login_id`,`user_name`,`password`,`user_type`) values (1,'admin@gmail.com','admin','admin'),(2,'abhinnandu135@gmail.com','1786','branch'),(3,'abhinnandu135@gmail.com','1190','branch'),(4,'abhinnandu135@gmail.com','2267','branch'),(5,'abhinnandu135@gmail.com','596','branch'),(6,'abhinnandu135@gmail.com','1789','branch'),(7,'abhinnandu135@gmail.com','6713','branch'),(8,'abhinnandu135@gmail.com','9346',''),(9,'abhinnandu135@gmail.com','5041','customer'),(10,'adithvp318@gmail.com','1168','customer'),(12,'abhinnandu135@gmail.com','5760','branch'),(13,'sayoojkrishnajr100@gmail.com','4632','customer'),(14,'pilathara@gmail.com','1934','branch'),(15,'pilathara@gmail.com','1402','branch'),(17,'sayoojkrishnajr100@gmail.com','3190','customer');

/*Table structure for table `otp` */

DROP TABLE IF EXISTS `otp`;

CREATE TABLE `otp` (
  `o_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) DEFAULT NULL,
  `otp` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`o_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `otp` */

insert  into `otp`(`o_id`,`c_id`,`otp`,`status`) values (1,9,'9318','finished'),(2,17,'8706','pending');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `transaction` */

insert  into `transaction`(`transaction_id`,`time`,`date`,`amount`,`customer_id`,`type(credit,debit)`,`description`) values (1,'16:17:40','2023-03-17',5000,9,'debit',''),(2,'16:39:39','2023-03-17',2000,9,'credit',''),(3,'16:42:19','2023-03-17',5000,9,'credit',''),(4,'10:38:09','2023-04-06',1000000,17,'credit',''),(5,'11:07:07','2023-04-06',5000,17,'debit',''),(6,'16:25:55','2023-04-06',5000,17,'debit','');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
