/*
SQLyog Ultimate v12.08 (32 bit)
MySQL - 8.0.18 : Database - mistress
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`mistress` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `mistress`;

/*Table structure for table `address_info` */

DROP TABLE IF EXISTS `address_info`;

CREATE TABLE `address_info` (
  `id` int(7) unsigned NOT NULL AUTO_INCREMENT COMMENT '地址ID',
  `uid` int(6) NOT NULL COMMENT '用户ID',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '默认地址0非1是',
  `tel` varchar(11) COLLATE utf8mb4_general_ci NOT NULL COMMENT '联系电话',
  `reveivername` varchar(32) COLLATE utf8mb4_general_ci NOT NULL COMMENT '接收者姓名',
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_user_info_to_address_info` FOREIGN KEY (`id`) REFERENCES `user_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `address_info` */

/*Table structure for table `blog` */

DROP TABLE IF EXISTS `blog`;

CREATE TABLE `blog` (
  `id` int(3) unsigned NOT NULL AUTO_INCREMENT COMMENT '博客ID',
  `name` varchar(32) COLLATE utf8mb4_general_ci NOT NULL COMMENT '博客名',
  `author` varchar(16) COLLATE utf8mb4_general_ci NOT NULL COMMENT '博客作者',
  `time` timestamp(6) NOT NULL COMMENT '发表时间',
  `summer` varchar(64) COLLATE utf8mb4_general_ci NOT NULL COMMENT '博客简述',
  `url` varchar(32) COLLATE utf8mb4_general_ci NOT NULL COMMENT '博客详情',
  `did` int(3) unsigned NOT NULL COMMENT '博客详情ID',
  PRIMARY KEY (`id`),
  KEY `fk_blog_to_detail` (`did`),
  CONSTRAINT `fk_blog_to_detail` FOREIGN KEY (`did`) REFERENCES `detail` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `blog` */

/*Table structure for table `categories` */

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` tinyint(2) unsigned NOT NULL AUTO_INCREMENT COMMENT '产品分类ID',
  `name` varchar(32) COLLATE utf8mb4_general_ci NOT NULL COMMENT '分类名称',
  `parent` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '父分类编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `categories` */

/*Table structure for table `contact` */

DROP TABLE IF EXISTS `contact`;

CREATE TABLE `contact` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT COMMENT '联系ID',
  `name` varchar(16) COLLATE utf8mb4_general_ci NOT NULL COMMENT '联系名',
  `email` varchar(32) COLLATE utf8mb4_general_ci NOT NULL COMMENT '联系邮箱',
  `comments` varchar(256) COLLATE utf8mb4_general_ci NOT NULL COMMENT '联系内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `contact` */

/*Table structure for table `detail` */

DROP TABLE IF EXISTS `detail`;

CREATE TABLE `detail` (
  `id` int(3) unsigned NOT NULL AUTO_INCREMENT COMMENT '博客详情ID',
  `content` blob COMMENT '博客详情内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `detail` */

/*Table structure for table `menu` */

DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `url` varchar(64) COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单地址',
  `name` varchar(64) COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名',
  `parentId` int(8) NOT NULL COMMENT '父菜单',
  `eabled` tinyint(1) NOT NULL DEFAULT '1' COMMENT '可用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `menu` */

/*Table structure for table `menu__role` */

DROP TABLE IF EXISTS `menu__role`;

CREATE TABLE `menu__role` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT COMMENT '菜单权限ID',
  `mid` int(8) unsigned NOT NULL COMMENT '菜单ID',
  `rid` tinyint(1) unsigned NOT NULL COMMENT '权限ID',
  PRIMARY KEY (`id`),
  KEY `fk_menu_role_to_menu` (`mid`),
  KEY `fk_menu_role_to_role` (`rid`),
  CONSTRAINT `fk_menu_role_to_menu` FOREIGN KEY (`mid`) REFERENCES `menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_menu_role_to_role` FOREIGN KEY (`rid`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `menu__role` */

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `cid` tinyint(2) unsigned NOT NULL COMMENT '分类编号',
  `tid` int(3) unsigned NOT NULL COMMENT '标签',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品名',
  `desc` varchar(256) COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品描述',
  `star` tinyint(1) NOT NULL COMMENT '星级',
  `view` int(3) NOT NULL COMMENT '查看数',
  PRIMARY KEY (`id`),
  KEY `fk_product_to_categories` (`cid`),
  KEY `fk_product_to_tag` (`tid`),
  CONSTRAINT `fk_product_to_categories` FOREIGN KEY (`cid`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_product_to_tag` FOREIGN KEY (`tid`) REFERENCES `tag` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `product` */

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` tinyint(1) unsigned NOT NULL AUTO_INCREMENT COMMENT '权限ID',
  `name` varchar(8) COLLATE utf8mb4_general_ci NOT NULL COMMENT '权限名',
  `desc` varchar(32) COLLATE utf8mb4_general_ci NOT NULL COMMENT '权限描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `role` */

/*Table structure for table `stock` */

DROP TABLE IF EXISTS `stock`;

CREATE TABLE `stock` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '库存ID',
  `pid` int(4) unsigned NOT NULL COMMENT '商品ID',
  `price` double(4,2) unsigned NOT NULL COMMENT '商品价格',
  `oprice` double(4,2) NOT NULL COMMENT '商品历史价格',
  `stock` int(2) NOT NULL COMMENT '库存',
  `brand` varchar(16) COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品品牌',
  `color` tinyint(1) NOT NULL COMMENT '商品颜色',
  `size` varchar(8) COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品型号',
  PRIMARY KEY (`id`),
  KEY `fk_stock_to_product` (`pid`),
  CONSTRAINT `fk_stock_to_product` FOREIGN KEY (`pid`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `stock` */

/*Table structure for table `tag` */

DROP TABLE IF EXISTS `tag`;

CREATE TABLE `tag` (
  `id` int(3) unsigned NOT NULL AUTO_INCREMENT COMMENT '标签ID',
  `name` varchar(16) COLLATE utf8mb4_general_ci NOT NULL COMMENT ' 标签名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tag` */

/*Table structure for table `user_info` */

DROP TABLE IF EXISTS `user_info`;

CREATE TABLE `user_info` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(32) COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `faceimg` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户头像',
  `userpass` varchar(64) COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户密码',
  `birthday` time(6) DEFAULT NULL COMMENT '生日',
  `email` varchar(32) COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户邮箱',
  `grade` tinyint(1) NOT NULL COMMENT '用户等级',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `user_info` */

/*Table structure for table `user_role` */

DROP TABLE IF EXISTS `user_role`;

CREATE TABLE `user_role` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户权限ID',
  `uid` int(7) unsigned NOT NULL COMMENT '用户ID',
  `rid` tinyint(1) unsigned NOT NULL COMMENT '权限ID',
  PRIMARY KEY (`id`),
  KEY `fk_user_role_to_user_info` (`uid`),
  KEY `fk_user_role_to_role` (`rid`),
  CONSTRAINT `fk_user_role_to_role` FOREIGN KEY (`rid`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_role_to_user_info` FOREIGN KEY (`uid`) REFERENCES `user_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `user_role` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
