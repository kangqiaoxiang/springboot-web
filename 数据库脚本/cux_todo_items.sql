/*
Navicat MySQL Data Transfer

Source Server         : xiang
Source Server Version : 50638
Source Host           : localhost:3306
Source Database       : hand

Target Server Type    : MYSQL
Target Server Version : 50638
File Encoding         : 65001

Date: 2018-08-17 09:14:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cux_todo_items
-- ----------------------------
DROP TABLE IF EXISTS `cux_todo_items`;
CREATE TABLE `cux_todo_items` (
  `to_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `todo_item_title` varchar(255) DEFAULT NULL,
  `todo_item_content` varchar(255) NOT NULL,
  `priority` varchar(255) NOT NULL,
  `creation_date` datetime NOT NULL,
  `last_update_date` datetime NOT NULL,
  `comments` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`to_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cux_todo_items
-- ----------------------------
INSERT INTO `cux_todo_items` VALUES ('2', '1', '洗车', '到洗车店清洗汽车', 'medium', '2018-01-16 09:55:33', '2018-01-16 09:55:33', '路途比较远，尽量便宜');
INSERT INTO `cux_todo_items` VALUES ('3', '1', '考试', '帮助复习功课，准备考试', 'high', '2018-01-16 09:57:15', '2018-01-16 09:57:15', '第一次使用，多多关照');
