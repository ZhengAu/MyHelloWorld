/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : addressbook

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2017-12-04 19:16:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `person`
-- ----------------------------
DROP TABLE IF EXISTS `person`;
CREATE TABLE `person` (
  `id` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `birthDate` date DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `qq` varchar(20) DEFAULT NULL,
  `remarks` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of person
-- ----------------------------
INSERT INTO `person` VALUES ('10', '张三', '1995-06-06', '男', '12312345658', '123123@123.com', '159874568', '天之骄子zpj');
INSERT INTO `person` VALUES ('11', '李四', '1995-07-07', '女', '15945678940', '159753@123.com', '895869123', '地狱之神');
INSERT INTO `person` VALUES ('12', '流量', '1990-01-02', '男', '1787999999', '17876253312@163.com', '5982345637', '我是谁，我要到哪里去');
INSERT INTO `person` VALUES ('13', '王五', '1995-08-08', '男', '12545677899', '156785@123.com', '789654159', '天空之城');
INSERT INTO `person` VALUES ('1512317511139', '二五八', '1989-12-12', '男', '456123', '123@123', '123', 'asdf');
INSERT INTO `person` VALUES ('1512319743424', '好人', '1994-04-04', '女', '19940404', '19940404@04.com', '19940404789', '我是一个好人，乐于助人。');
INSERT INTO `person` VALUES ('1512319801091', '三六九', '1990-01-01', '男', '123789', 'asdf@123', '12341234', '三六九');
INSERT INTO `person` VALUES ('1512382637204', 'Jerry', '1990-01-01', '男', '123123123123', '123@123', '123', 'Jerry love Mary.');
INSERT INTO `person` VALUES ('1512385950310', '郑氏', '1995-09-05', '男', '1787456347', '683347@163.com', '598529897', 'Who I am?\r\nWhere am I come from?\r\nWhere should I go?');
INSERT INTO `person` VALUES ('3', 'Arice', '1990-01-01', '女', '5667', '123@163.com', '123123', '123123');
INSERT INTO `person` VALUES ('4', 'Jim', '1994-09-09', '男', '123123123', '45564556@234', '6778453454', '大师傅');
INSERT INTO `person` VALUES ('6', 'Tom', '1990-01-01', '女', '12332112323', '234@11', '123412341324', 'asdf');
INSERT INTO `person` VALUES ('7', 'lisi', '1995-09-09', '女', '456874589351', '156348@123.com', '132564321', '汪洋大海');
INSERT INTO `person` VALUES ('8', 'si', '1990-01-01', '男', '123123123123', '123@123.com', '1231231', '阿什顿发斯蒂芬阿斯蒂芬而台湾而让他阿斯蒂微软员工');

-- ----------------------------
-- Table structure for `root`
-- ----------------------------
DROP TABLE IF EXISTS `root`;
CREATE TABLE `root` (
  `rid` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `gender` int(10) DEFAULT '1',
  `telephone` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of root
-- ----------------------------
INSERT INTO `root` VALUES ('001', 'admin', 'admin', '1', '12332112323', '123@163.com');
INSERT INTO `root` VALUES ('002', 'root', 'root', '0', '12345678998', '456@163.com');
