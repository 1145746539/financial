/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1_3306
Source Server Version : 50513
Source Host           : 127.0.0.1:3306
Source Database       : financial

Target Server Type    : MYSQL
Target Server Version : 50513
File Encoding         : 65001

Date: 2018-09-07 14:44:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for accountype
-- ----------------------------
DROP TABLE IF EXISTS `accountype`;
CREATE TABLE `accountype` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `types` varchar(40) NOT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of accountype
-- ----------------------------
INSERT INTO `accountype` VALUES ('1', '同事聚餐');
INSERT INTO `accountype` VALUES ('2', '市内游玩');
INSERT INTO `accountype` VALUES ('3', '省外旅行');
INSERT INTO `accountype` VALUES ('4', '其他事情');
INSERT INTO `accountype` VALUES ('5', '假日休假');

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `aname` varchar(30) DEFAULT NULL,
  `apwd` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', 'a');

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `dname` varchar(40) DEFAULT NULL,
  `dlevel` int(11) NOT NULL,
  `account` varchar(255) DEFAULT NULL,
  `staff` int(11) DEFAULT NULL,
  `uplevel` int(11) NOT NULL,
  PRIMARY KEY (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES ('1', '采购部', '1', '456', '3', '2');
INSERT INTO `dept` VALUES ('2', '财务部', '2', '2', '3', '3');
INSERT INTO `dept` VALUES ('3', '财务总监', '3', '3', '2', '4');
INSERT INTO `dept` VALUES ('4', '总经理', '4', '4', '1', '4');

-- ----------------------------
-- Table structure for details
-- ----------------------------
DROP TABLE IF EXISTS `details`;
CREATE TABLE `details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `types` varchar(40) NOT NULL,
  `project` varchar(40) DEFAULT NULL,
  `account` varchar(30) DEFAULT NULL,
  `reportime` datetime DEFAULT NULL,
  `auditime` datetime DEFAULT NULL,
  `money` decimal(8,2) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `allmoney` decimal(8,2) DEFAULT NULL,
  `state` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of details
-- ----------------------------
INSERT INTO `details` VALUES ('66', '同事聚餐', '吃饭', '456', '2018-09-06 14:34:45', null, '50.00', '2', '100.00', '2');
INSERT INTO `details` VALUES ('67', '市内游玩', '同事轰趴', '456', '2018-09-06 14:35:35', null, '500.00', '1', '500.00', '1');
INSERT INTO `details` VALUES ('68', '省外旅行', '布达拉宫旅游', '456', '2018-09-06 14:37:05', null, '1000.00', '5', '5000.00', '2');
INSERT INTO `details` VALUES ('69', '其他事情', '出差', '456', '2018-09-06 14:37:42', null, '6500.00', '1', '6500.00', '2');
INSERT INTO `details` VALUES ('70', '同事聚餐', '同事吃饭', '857326', '2018-09-06 14:46:52', null, '300.00', '1', '300.00', '1');
INSERT INTO `details` VALUES ('71', '市内游玩', '打车费用', '857326', '2018-09-06 14:47:36', null, '250.00', '1', '250.00', '1');
INSERT INTO `details` VALUES ('72', '省外旅行', '上海参观', '857326', '2018-09-06 14:48:22', null, '1050.00', '2', '2100.00', '2');
INSERT INTO `details` VALUES ('73', '其他事情', '北京出差', '857326', '2018-09-06 14:49:13', null, '2500.00', '1', '2500.00', '1');
INSERT INTO `details` VALUES ('74', '其他事情', '出国出差', '321384', '2018-09-06 15:12:37', null, '20000.00', '2', '40000.00', '1');
INSERT INTO `details` VALUES ('75', '省外旅行', '年假旅游', '321384', '2018-09-06 15:13:15', null, '10000.00', '1', '10000.00', '2');
INSERT INTO `details` VALUES ('76', '同事聚餐', '部门聚餐', '321384', '2018-09-06 15:13:43', null, '6000.00', '2', '12000.00', '2');
INSERT INTO `details` VALUES ('77', '假日休假', '国庆旅游', '456', '2018-09-06 16:19:47', null, '500.00', '20', '10000.00', '0');
INSERT INTO `details` VALUES ('78', '假日休假', '休年假', '456', '2018-09-07 14:23:34', null, '500.00', '1', '500.00', '0');
INSERT INTO `details` VALUES ('79', '市内游玩', '爬衡山', '456', '2018-09-07 14:24:19', null, '200.00', '10', '2000.00', '0');
INSERT INTO `details` VALUES ('80', '假日休假', '法定假期休假', '3', '2018-09-07 14:25:38', null, '2000.00', '1', '2000.00', '0');
INSERT INTO `details` VALUES ('81', '假日休假', '休年假', '4', '2018-09-07 14:27:36', null, '20000.00', '1', '20000.00', '2');
INSERT INTO `details` VALUES ('82', '省外旅行', '国庆旅行', '857326', '2018-09-07 14:41:15', null, '500.00', '2', '1000.00', '0');
INSERT INTO `details` VALUES ('83', '假日休假', '周末休假', '857326', '2018-09-07 14:41:40', null, '200.00', '1', '200.00', '0');

-- ----------------------------
-- Table structure for flowmeter
-- ----------------------------
DROP TABLE IF EXISTS `flowmeter`;
CREATE TABLE `flowmeter` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `did` int(11) NOT NULL,
  `state` int(11) DEFAULT '1',
  `remarks` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flowmeter
-- ----------------------------
INSERT INTO `flowmeter` VALUES ('64', '66', '2', '2', null);
INSERT INTO `flowmeter` VALUES ('65', '67', '2', '1', null);
INSERT INTO `flowmeter` VALUES ('66', '68', '2', '1', null);
INSERT INTO `flowmeter` VALUES ('67', '69', '2', '2', null);
INSERT INTO `flowmeter` VALUES ('68', '70', '2', '1', null);
INSERT INTO `flowmeter` VALUES ('69', '71', '2', '1', null);
INSERT INTO `flowmeter` VALUES ('70', '72', '2', '2', null);
INSERT INTO `flowmeter` VALUES ('71', '73', '2', '1', null);
INSERT INTO `flowmeter` VALUES ('72', '74', '2', '1', null);
INSERT INTO `flowmeter` VALUES ('73', '75', '2', '1', null);
INSERT INTO `flowmeter` VALUES ('74', '76', '2', '2', null);
INSERT INTO `flowmeter` VALUES ('75', '70', '3', '1', null);
INSERT INTO `flowmeter` VALUES ('76', '68', '3', '2', null);
INSERT INTO `flowmeter` VALUES ('77', '75', '3', '2', null);
INSERT INTO `flowmeter` VALUES ('78', '67', '3', '1', null);
INSERT INTO `flowmeter` VALUES ('79', '71', '3', '1', null);
INSERT INTO `flowmeter` VALUES ('80', '73', '3', '1', null);
INSERT INTO `flowmeter` VALUES ('81', '74', '3', '1', null);
INSERT INTO `flowmeter` VALUES ('82', '67', '4', '1', null);
INSERT INTO `flowmeter` VALUES ('83', '70', '4', '1', null);
INSERT INTO `flowmeter` VALUES ('84', '77', '2', '1', null);
INSERT INTO `flowmeter` VALUES ('85', '78', '2', '0', null);
INSERT INTO `flowmeter` VALUES ('86', '79', '2', '0', null);
INSERT INTO `flowmeter` VALUES ('87', '80', '2', '0', null);
INSERT INTO `flowmeter` VALUES ('88', '81', '2', '2', null);
INSERT INTO `flowmeter` VALUES ('89', '71', '4', '1', null);
INSERT INTO `flowmeter` VALUES ('90', '73', '4', '1', null);
INSERT INTO `flowmeter` VALUES ('91', '74', '4', '1', null);
INSERT INTO `flowmeter` VALUES ('92', '82', '2', '0', null);
INSERT INTO `flowmeter` VALUES ('93', '83', '2', '1', null);
INSERT INTO `flowmeter` VALUES ('94', '77', '3', '0', null);
INSERT INTO `flowmeter` VALUES ('95', '83', '3', '0', null);

-- ----------------------------
-- Table structure for payroll
-- ----------------------------
DROP TABLE IF EXISTS `payroll`;
CREATE TABLE `payroll` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(30) DEFAULT NULL,
  `dname` varchar(40) DEFAULT NULL,
  `pay` decimal(8,2) DEFAULT '1000.00',
  `paytime` date DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of payroll
-- ----------------------------
INSERT INTO `payroll` VALUES ('1', '456', '采购部', '6500.00', '2018-09-10');
INSERT INTO `payroll` VALUES ('2', '2', '财务部', '8500.00', '2018-09-10');
INSERT INTO `payroll` VALUES ('3', '3', '财务总监', '10000.00', '2018-09-10');
INSERT INTO `payroll` VALUES ('4', '4', '总经理', '15000.00', '2018-09-10');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(30) DEFAULT NULL,
  `account` varchar(30) DEFAULT NULL,
  `upwd` varchar(200) DEFAULT NULL,
  `phone` varchar(40) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `did` int(11) DEFAULT NULL,
  `sex` int(11) DEFAULT '1',
  `upic` varchar(10000) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '张三', '4', 'C4CA4238A0B923820DCC509A6F75849B', '1', '1249273846@qq.com', '4', '2', 'f:\\picture\\1536080216432.jpg');
INSERT INTO `users` VALUES ('2', '李四', '2', '54FDA78AA8A09B4D77B5AAEC57B75028', '3131', '1249273846@qq.com', '2', '2', 'f:\\picture\\1536092224462.jpg');
INSERT INTO `users` VALUES ('3', '王五', '3', 'CAF1A3DFB505FFED0D024130F58C5CFA', '321', '1249273846@qq.com', '3', '1', 'f:\\picture\\1535763504614.jpg');
INSERT INTO `users` VALUES ('4', '赵六', '456', '250CF8B51C773F3F8DC8B4BE867A9A02', '456', '1249273846@qq.com', '1', '2', 'f:\\picture\\1536289419494.jpg');
INSERT INTO `users` VALUES ('12', '李三', '352874', '250CF8B51C773F3F8DC8B4BE867A9A02', '654341351', '1249273846@qq.com', '2', '1', 'f:\\picture\\1536210077700.jpg');
INSERT INTO `users` VALUES ('13', '钱七', '321384', '61CB72858BE523B9926ECC3D7DA5D0C6', '18397401780', '954313816@qq.com', '3', '1', 'f:\\picture\\1536260193955.jpg');
INSERT INTO `users` VALUES ('14', '开奖号', '823003', '202CB962AC59075B964B07152D234B70', '1321.2135', '231326513@qq.com', '2', '1', 'f:\\picture\\1536249324614.jpg');
INSERT INTO `users` VALUES ('15', '王五', '857326', 'E08392BB89DEDB8ED6FB298F8E729C15', '18397401780', '954313816@qq.com', '1', '1', 'f:\\picture\\1536306664224.jpg');

-- ----------------------------
-- View structure for details_sel
-- ----------------------------
DROP VIEW IF EXISTS `details_sel`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `details_sel` AS SELECT d.id,d.types,d.project,d.account,u.uname,d.reportime,d.auditime,d.money,d.number,d.allmoney,d.state,u.did
FROM details d,users u where d.account = u.account ;

-- ----------------------------
-- View structure for details_users
-- ----------------------------
DROP VIEW IF EXISTS `details_users`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `details_users` AS SELECT d.id,d.types,d.project,u.uname,d.reportime,d.auditime,d.money,d.number,d.allmoney,d.state 
FROM details d,users u where d.account = u.account ;

-- ----------------------------
-- View structure for payroll_users
-- ----------------------------
DROP VIEW IF EXISTS `payroll_users`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `payroll_users` AS SELECT p.pid,p.account,u.uname,p.dname,p.pay,p.paytime 
FROM payroll p , users u WHERE p.account = u.account ;
