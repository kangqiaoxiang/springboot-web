/*
Navicat MySQL Data Transfer

Source Server         : xiang
Source Server Version : 50638
Source Host           : localhost:3306
Source Database       : hand

Target Server Type    : MYSQL
Target Server Version : 50638
File Encoding         : 65001

Date: 2018-08-17 09:14:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cux_users
-- ----------------------------
DROP TABLE IF EXISTS `cux_users`;
CREATE TABLE `cux_users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `sex` varchar(10) NOT NULL,
  `age` int(11) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `creation_date` datetime NOT NULL,
  `last_update_date` datetime DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cux_users
-- ----------------------------
INSERT INTO `cux_users` VALUES ('1', '张三', 'e10adc3949ba59abbe56', 'M', '20', '15827724106', '2018-01-16 07:27:57', '2018-01-16 09:56:34', '第一次使用，多多关照');
