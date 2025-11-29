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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `account` */

insert  into `account`(`account_id`,`c_id`,`IFSC_code`,`account_no`,`balance`) values (1,9,'1234',1234,519000),(2,17,'Pl20345',2147483647,1010000),(3,18,'123456',123456,124456),(4,23,' qw123',12345,1001000),(5,27,'123456',9876,2000),(6,18,'12345',1234567,11000),(7,31,'12345',12345,22222222),(8,34,'12345',12,1000),(9,36,'9876',12345,1000),(10,18,'12345',12345,10000),(11,40,'12345',123456,100000000),(12,43,'as123',1212,10000);

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

/*Data for the table `atm` */

insert  into `atm`(`card_id`,`c_id`,`card_no`,`issue_date`,`expiry_date`,`pin`,`status`) values (1,9,'1234','2023-03-17','2028-10-17',670504,'approved'),(2,10,'2342','2023-03-25','2023-03-23',1234,'approved'),(3,13,'123456789012','2023-04-30','2023-05-07',670504,'approved'),(4,16,'123456','2023-04-30','2023-04-22',670504,'pending'),(5,17,'123455','2023-04-30','2023-11-25',670504,'forwarded'),(7,18,'123456789','2023-04-19','2023-04-30',670504,'approved'),(8,22,'12345','2023-04-10','2023-04-29',12345,'forwarded'),(9,25,'12345678','2023-04-23','2023-04-07',12345,'pending'),(10,27,'9876','2023-04-23','2023-04-29',670501,'approved'),(11,29,'7777','2023-04-20','2023-05-07',12345,'approved'),(12,29,'pending','0000-00-00','0000-00-00',0,'rejected'),(13,31,'pending','0000-00-00','0000-00-00',0,'forwarded'),(14,31,'pending','0000-00-00','0000-00-00',0,'forwarded'),(15,34,'121','2023-04-19','2023-04-30',670504,'forwarded'),(16,36,'012345','2023-04-21','2023-04-30',670501,'forwarded'),(17,40,'112233','2023-04-28','2023-05-06',12345,'pending'),(18,44,'pending','0000-00-00','0000-00-00',0,'approved');

/*Table structure for table `blockhistory` */

DROP TABLE IF EXISTS `blockhistory`;

CREATE TABLE `blockhistory` (
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(20) DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `atm_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `blockhistory` */

insert  into `blockhistory`(`history_id`,`date`,`time`,`atm_id`) values (1,'2023-04-06','17:00:18',5),(2,'2023-04-25','11:52:00',5),(3,'2023-04-25','13:30:32',7);

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
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

/*Data for the table `branch` */

insert  into `branch`(`Branch_id`,`Branch_name`,`Place`,`District`,`IFSC_code`,`Email`,`Phone`,`branch_code`) values (14,'pilathara','pilathara','kannur','12345','pilathara@gmail.com',9874563210,'12345'),(15,'pilathara','pilathara','kannur','12345','pilathara@gmail.com',9874563210,'12345'),(26,'pilathara','pilathara','kannur','123456','sayoojkrishnajr100@gmail.com',7356499914,'123456'),(30,'Payyannur','kannur','Payyannur','12345','payyanur@gmail.com',9876543212,'12345'),(32,'pilathara','pilathara','kannur','12345','sayoojkrishnajr100@gmail.com',7356499991,'123456'),(35,'sss','sss','sss','9876','sayoojkrishnajr100@gmail.com',7356499914,'9876'),(37,'kannur','kannur','kanuur','12345','abhinnandu135@gmail',9876543212,'12345'),(38,'Kannur','kannur','kannur','12345','abhinnandu135@gmail',9876543212,'12345'),(39,'payyanur','payyannur','kannur','12345','abhinnandu135@gmail',9876543212,'12345'),(41,'sss','sss','sss','12345','sayoojkrishnajr100@gmail.com',7356499914,'sss'),(42,'sreestha','kannur','kannur','as123','sreestha@gmail.com',9876543212,'1234');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `complaint` */

insert  into `complaint`(`complaint_id`,`c_id`,`complaint`,`date`,`replay`,`replay_date`) values (1,13,'hiii','2023-04-06','hiii','2023-04-06'),(2,17,'haiiii','2023-04-06','helooo','2023-04-06'),(3,27,'hy','2023-04-24','ghjkmnbv ','2023-04-24');

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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

/*Data for the table `customer` */

insert  into `customer`(`c_id`,`c_name`,`place`,`phone`,`email`,`house_name`,`post`,`pin`,`branch_id`,`photo`,`district`) values (9,'Abhinand','pilathara',2147483647,'abhinnandu135@gmail.com','PILATHARA','vilayancode',670504,8,'/static/pic/230317-151529.jpg','kannur'),(10,'adith','pazhayangadi',6282877095,'adithvp318@gmail.com','vp','pazhayangadi',670303,8,'/static/pic/230317-152142.jpg','kannur'),(13,'sayooj','asd',9874563210,'sayoojkrishnajr100@gmail.com','asd','asd',123456,2,'/static/pic/230406-095047.jpg','asd'),(17,'sayooj','pilathara',9874563210,'sayoojkrishnajr100@gmail.com','abcd','pilathara',670504,15,'/static/pic/230406-144453.jpg','kannur'),(18,'Abhinand ','pilathara',9744259736,'abhinnandu135@gmail.com','ABHINAND THOTTON VEEDU PILATHARA','pilathara',670504,15,'/static/pic/230419-120257.jpg','kannur'),(22,'Abhinand av','pilathara',9744259736,'abhinnandu135@gmail.com','ABHINAND THOTTON VEEDU PILATHARA','kannur',123456,21,'/static/pic/230424-184132.jpg','kannur'),(23,'Abhinand av','pilathara',9744259736,'abhinnandu135@gmail.com','ABHINAND THOTTON VEEDU PILATHARA','kannur',123456,21,'/static/pic/230424-184135.jpg','kannur'),(24,'Abhinand av','pilathara',9744259736,'abhinnandu135@gmail.com','ABHINAND THOTTON VEEDU PILATHARA','pilathara',12345,21,'/static/pic/230424-185136.jpg','kannur'),(25,'adith','pilathara',9744259736,'abhinnandu135@gmail.com','ABHINAND THOTTON VEEDU PILATHARA','pilathara',12345,21,'/static/pic/230424-185740.jpg','kannur'),(27,'sayooj','pilathara',7356499914,'sayoojkrishnajr100@gmail.com','kakkanadan veedu','mandur',670501,26,'/static/pic/230424-192630.jpg','kannur'),(29,'adith','pilathara',9744259736,'abhinnandu135@gmail.com','THOTTON VEEDU PILATHARA','kannur',670504,15,'/static/pic/230425-050225.jpg','kannur'),(31,'Abhinand av','pilathara',9744259736,'abhinnandu135@gmail.com','ABHINAND THOTTON VEEDU PILATHARA','admin',1234,30,'/static/pic/230425-051744.jpg','kannur'),(33,'athul','pilathara',7356499914,'sayoojkrishnajr100@gmail.com','varayil','mandur',670501,32,'/static/pic/230425-095759.jpg','kannur'),(34,'fdf','hjg',9546544744,'ygty@gmail.com','fdf','45434',670504,15,'/static/pic/230425-101730.jpg','hnghngh'),(36,'roshan','rrr',7356499915,'sayoojkrishnajr100@gmail.com','rrr','rrr',670501,35,'/static/pic/230425-113525.jpg','rrr'),(40,'Abhi','kanur',9744259736,'abhinnandu135@gmail.com','ABHINAND THOTTON VEEDU PILATHARA','kannur',123456,15,'/static/pic/230425-133931.jpg','kannur'),(43,'123','kannur',6282877095,'adithvp318@gmail.com','vayaliple','123456',1234,42,'/static/pic/230425-142623.jpg','kannur'),(44,'123','kannur',6282877095,'adithvp318@gmail.com','vayaliple','123456',1234,42,'/static/pic/230425-142629.jpg','kannur');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `login_id` int(100) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `user_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`login_id`,`user_name`,`password`,`user_type`) values (0,'','',''),(1,'admin@gmail.com','admin','admin'),(2,'','',''),(3,'','',''),(4,'','',''),(6,'','',''),(7,'','',''),(8,'','',''),(9,'','',''),(10,'','',''),(12,'','',''),(13,'','',''),(14,'pilathara@gmail.com','1934','branch'),(15,'pilathara@gmail.com','1402','branch'),(17,'sayoojkrishnajr100@gmail.com','3190','customer'),(18,'abhinnandu135@gmail.com','5208','customer'),(19,'abhinnandu135@gmail.com','1109','branch'),(21,'abhijbjb135@gmail.com','5104','branch'),(22,'abhinnandu135@gmail.com','3704','customer'),(23,'abhinnandu135@gmail.com','8101','customer'),(24,'abhinnandu135@gmail.com','9854','customer'),(25,'abhinnandu135@gmail.com','7609','customer'),(26,'sayoojkrishnajr100@gmail.com','6927','branch'),(27,'sayoojkrishnajr100@gmail.com','1113','customer'),(29,'abhinnandu135@gmail.com','9206','customer'),(30,'payyanur@gmail.com','4734','branch'),(31,'abhinnandu135@gmail.com','1373','customer'),(32,'sayoojkrishnajr100@gmail.com','4555','branch'),(33,'sayoojkrishnajr100@gmail.com','6900','customer'),(34,'ygty@gmail.com','5609','customer'),(35,'sayoojkrishnajr100@gmail.com','3127','branch'),(36,'sayoojkrishnajr100@gmail.com','7008','customer'),(37,'abhinnandu135@gmail','5669','branch'),(38,'abhinnandu135@gmail','7452','branch'),(39,'abhinnandu135@gmail','580','branch'),(40,'abhinnandu135@gmail.com','5332','customer'),(41,'sayoojkrishnajr100@gmail.com','189','branch'),(42,'sreestha@gmail.com','9867','branch'),(43,'adithvp318@gmail.com','8248','customer'),(44,'adithvp318@gmail.com','7829','customer');

/*Table structure for table `otp` */

DROP TABLE IF EXISTS `otp`;

CREATE TABLE `otp` (
  `o_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) DEFAULT NULL,
  `otp` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`o_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `otp` */

insert  into `otp`(`o_id`,`c_id`,`otp`,`status`) values (1,9,'9318','0'),(2,17,'6393','pending'),(3,18,'5218','0'),(4,25,'6244','0'),(5,27,'5365','0'),(6,34,'3049','0'),(7,40,'9249','pending');

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Data for the table `transaction` */

insert  into `transaction`(`transaction_id`,`time`,`date`,`amount`,`customer_id`,`type(credit,debit)`,`description`) values (1,'16:17:40','2023-03-17',5000,9,'debit',''),(2,'16:39:39','2023-03-17',2000,9,'credit',''),(3,'16:42:19','2023-03-17',5000,9,'credit',''),(4,'10:38:09','2023-04-06',1000000,17,'credit',''),(5,'11:07:07','2023-04-06',5000,17,'debit',''),(6,'16:25:55','2023-04-06',5000,17,'debit',''),(7,'12:13:34','2023-04-19',500,18,'debit',''),(8,'11:18:27','2023-04-21',100,18,'debit',''),(9,'18:45:16','2023-04-24',1000,23,'credit',''),(10,'19:30:18','2023-04-24',1000,27,'credit',''),(11,'19:40:36','2023-04-24',500,27,'debit',''),(12,'05:08:37','2023-04-25',1000,18,'credit',''),(13,'09:58:52','2023-04-25',1000,18,'credit','');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
