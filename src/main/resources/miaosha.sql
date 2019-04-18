/*
Navicat MySQL Data Transfer

Source Server         : 阿里云
Source Server Version : 50173
Source Host           : 120.79.34.216:3306
Source Database       : miaosha

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2019-03-28 23:26:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品Id',
  `goods_name` varchar(16) DEFAULT NULL COMMENT '商品名称',
  `goods_title` varchar(64) DEFAULT NULL COMMENT '商品标题',
  `goods_img` varchar(64) DEFAULT NULL COMMENT '商品图片',
  `goods_detail` longtext COMMENT '商品的详情介绍',
  `goods_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品单价',
  `goods_stock` int(11) DEFAULT '0' COMMENT '商品库存，-1表示没有限制',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', 'iphoneX', 'Apple iPhone X 64GB 银色', '/img/iphone.png', '商品详情介绍', '5555.99', '10');
INSERT INTO `goods` VALUES ('2', '华为Meta9', '华为Meta9 4GB+32GB版', '/img/meta10.png', '华为Meta 9 商品详情介绍', '4555.99', '10');

-- ----------------------------
-- Table structure for miaosha_goods
-- ----------------------------
DROP TABLE IF EXISTS `miaosha_goods`;
CREATE TABLE `miaosha_goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `goods_id` bigint(20) DEFAULT NULL COMMENT '秒杀的商品id',
  `miaosha_price` decimal(10,2) DEFAULT '0.00' COMMENT '秒杀价',
  `stock_count` int(11) DEFAULT '0' COMMENT '秒杀的库存',
  `start_date` datetime DEFAULT NULL COMMENT '秒杀开始时间',
  `end_date` datetime DEFAULT NULL COMMENT '秒杀结束时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of miaosha_goods
-- ----------------------------

-- ----------------------------
-- Table structure for miaosha_order
-- ----------------------------
DROP TABLE IF EXISTS `miaosha_order`;
CREATE TABLE `miaosha_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `goods_id` bigint(20) DEFAULT NULL COMMENT '商品ID',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of miaosha_order
-- ----------------------------

-- ----------------------------
-- Table structure for miaosha_user
-- ----------------------------
DROP TABLE IF EXISTS `miaosha_user`;
CREATE TABLE `miaosha_user` (
  `id` bigint(20) NOT NULL COMMENT '用户ID,手机密码',
  `nickname` varchar(255) NOT NULL,
  `password` varchar(32) DEFAULT NULL COMMENT 'MD5(MD5(pass明文+固定salt) + salt)',
  `salt` varchar(10) DEFAULT NULL,
  `head` varchar(128) DEFAULT NULL COMMENT '头像，云存储的ID',
  `register_date` datetime DEFAULT NULL COMMENT '注册时间',
  `last_login_date` datetime DEFAULT NULL COMMENT '上次登录时间',
  `login_count` int(11) DEFAULT '0' COMMENT '登录次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of miaosha_user
-- ----------------------------
INSERT INTO `miaosha_user` VALUES ('18912341234', '18912341234', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c4d', null, null, null, '0');

-- ----------------------------
-- Table structure for order_info
-- ----------------------------
DROP TABLE IF EXISTS `order_info`;
CREATE TABLE `order_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `goods_id` bigint(20) DEFAULT NULL,
  `delivery_addr_id` bigint(20) DEFAULT NULL COMMENT '收货地址ID',
  `goods_name` varchar(16) DEFAULT NULL COMMENT '冗余过来的商品名称',
  `goods_count` int(11) DEFAULT '0' COMMENT '商品数量',
  `goods_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品单价',
  `order_channel` tinyint(4) DEFAULT '0' COMMENT '订单渠道，1pc,2android,3ios',
  `status` tinyint(4) DEFAULT '0' COMMENT '订单状态，0新建未支付，1已支付，2已发货，3已收货，4已退款，5已完成',
  `create_date` datetime DEFAULT NULL COMMENT '订单的创建时间',
  `pay_date` datetime DEFAULT NULL COMMENT '支付时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_info
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类别Id',
  `name` varchar(50) DEFAULT NULL COMMENT '类别名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100032 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'jim');
INSERT INTO `user` VALUES ('2', 'tom');
