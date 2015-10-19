CREATE DATABASE  IF NOT EXISTS `mall_schema` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `mall_schema`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: mall_schema
-- ------------------------------------------------------
-- Server version	5.6.21

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
-- Table structure for table `activity`
--

DROP TABLE IF EXISTS `activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(1000) DEFAULT NULL,
  `title` varchar(1000) DEFAULT NULL,
  `content` varchar(10000) DEFAULT NULL,
  `start_time` varchar(45) DEFAULT NULL COMMENT '活动开始时间',
  `end_time` varchar(45) DEFAULT NULL COMMENT '活动结束时间',
  `state` int(11) NOT NULL DEFAULT '1' COMMENT '活动状态 1：筹备中 2：运行中  3:活动正常结束 4：活动强制结束',
  `is_delete` char(1) DEFAULT 'N' COMMENT '是否删除 默认未删除',
  `create_time` varchar(45) NOT NULL COMMENT '创建时间',
  `last_edit_time` varchar(45) DEFAULT NULL COMMENT '最后一次修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='活动管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `activity_images`
--

DROP TABLE IF EXISTS `activity_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` varchar(45) NOT NULL,
  `image_path` varchar(450) DEFAULT NULL COMMENT '图片路径',
  `is_delete` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='活动相关图片';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dealer`
--

DROP TABLE IF EXISTS `dealer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dealer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(45) NOT NULL COMMENT '登录名',
  `login_pwd` varchar(45) NOT NULL COMMENT '登录密码',
  `organization_name` varchar(45) DEFAULT NULL COMMENT '经销商名称',
  `integral` int(11) DEFAULT '0' COMMENT '积分',
  `state` int(1) DEFAULT '0' COMMENT '1 ：可用  2： 禁用',
  `create_time` varchar(45) DEFAULT NULL COMMENT '创建时间',
  `last_edit_time` varchar(45) DEFAULT NULL COMMENT '最后一次修改时间',
  `is_delete` char(1) NOT NULL DEFAULT 'N' COMMENT '是否删除 默认未删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='经销商';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `great`
--

DROP TABLE IF EXISTS `great`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `great` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL COMMENT '点赞的用户ID',
  `create_time` varchar(45) DEFAULT NULL COMMENT '点赞时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='点赞';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_integral_action`
--

DROP TABLE IF EXISTS `log_integral_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_integral_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dealer_id` int(11) NOT NULL COMMENT '对应的经销商的ID',
  `operator` varchar(45) NOT NULL COMMENT '运算符 + / - ',
  `number` varchar(45) NOT NULL COMMENT '数量',
  `create_time` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='积分操作日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(45) DEFAULT NULL COMMENT '用户昵称 ',
  `sex` int(11) NOT NULL DEFAULT '0' COMMENT '用户的性别，值为1时是男性，值为2时是女性，值为0时是未知 ',
  `head_img_url` varchar(450) DEFAULT NULL COMMENT '用户头像',
  `third_account_type` int(11) NOT NULL COMMENT '账户类型 1:微信用户',
  `third_account_id` varchar(450) DEFAULT NULL,
  `union_id` varchar(450) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales_records`
--

DROP TABLE IF EXISTS `sales_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(5000) DEFAULT NULL,
  `dealer_id` int(11) DEFAULT NULL COMMENT '经销商ID',
  `create_time` varchar(45) DEFAULT NULL COMMENT '添加时间',
  `last_edit_time` varchar(45) DEFAULT NULL COMMENT '最后一次修改时间',
  `is_delete` char(1) DEFAULT 'N' COMMENT '是否删除 默认未删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='销售记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(45) DEFAULT NULL COMMENT '登录名',
  `login_pwd` varchar(45) DEFAULT NULL COMMENT '登录密码',
  `create_time` varchar(45) DEFAULT NULL COMMENT '创建时间',
  `last_edit_time` varchar(45) DEFAULT NULL COMMENT '最后一次修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'mall_schema'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-10-14 19:09:03
