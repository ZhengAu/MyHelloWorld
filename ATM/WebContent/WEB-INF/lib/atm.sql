/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : atm

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2017-12-22 23:30:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `account`
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `userid` varchar(50) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `balance` double(255,0) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `account` VALUES ('13001642000000502420', '张三', '123456', '1', '50000');
INSERT INTO `account` VALUES ('13001642000000502421', '李四', '1234561', '1', '10000');
INSERT INTO `account` VALUES ('13001642000000502422', '王五', '12345612', '1', '50000');
INSERT INTO `account` VALUES ('13001642000000502423', '刘六', '123456123', '1', '100000');


-- ----------------------------
-- Records of account
-- ----------------------------

-- ----------------------------
-- Table structure for `history`
-- ----------------------------
DROP TABLE IF EXISTS `history`;
CREATE TABLE `history` (
  `id` varchar(50) NOT NULL,
  `userid` varchar(50) DEFAULT NULL,
  `datetime` date DEFAULT NULL,
  `expense` double(255,0) DEFAULT NULL,
  `income` double(255,0) DEFAULT NULL,
  `sourceid` varchar(50) DEFAULT NULL,
  `remarks` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  CONSTRAINT `userid` FOREIGN KEY (`userid`) REFERENCES `account` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of history
-- ----------------------------
