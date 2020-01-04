/*
 Navicat Premium Data Transfer

 Source Server         : Aliyun-Mysql
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : 47.104.7.130:3306
 Source Schema         : mistress

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 03/01/2020 22:29:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for blog
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog`  (
  `id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '博客ID',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '博客名',
  `uid` int(6) UNSIGNED NOT NULL COMMENT '作者',
  `time` timestamp(6) NOT NULL COMMENT '发表时间',
  `summer` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '博客简述',
  `url` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '博客详情',
  `did` int(3) UNSIGNED NOT NULL COMMENT '博客详情ID',
  `pid` int(4) UNSIGNED NOT NULL COMMENT '商品ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_blog_to_detail`(`did`) USING BTREE,
  INDEX `fk_blog_to_user`(`uid`) USING BTREE,
  INDEX `fk_blog_to_product`(`pid`) USING BTREE,
  CONSTRAINT `fk_blog_to_detail` FOREIGN KEY (`did`) REFERENCES `blog_detail` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_blog_to_product` FOREIGN KEY (`pid`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_blog_to_user` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for blog_detail
-- ----------------------------
DROP TABLE IF EXISTS `blog_detail`;
CREATE TABLE `blog_detail`  (
  `id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '博客详情ID',
  `bid` int(3) UNSIGNED NOT NULL COMMENT '博客ID',
  `content` blob NOT NULL COMMENT '博客详情内容',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_blog_detail_to_blog`(`bid`) USING BTREE,
  CONSTRAINT `fk_blog_detail_to_blog` FOREIGN KEY (`bid`) REFERENCES `blog` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '购物车ID',
  `pid` int(4) UNSIGNED NOT NULL COMMENT '商品ID',
  `uid` int(6) UNSIGNED NOT NULL COMMENT '用户ID',
  `num` int(2) UNSIGNED NOT NULL COMMENT '商品数量',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_cart_to_user`(`uid`) USING BTREE,
  INDEX `fk_cart_to_product`(`pid`) USING BTREE,
  CONSTRAINT `fk_cart_to_product` FOREIGN KEY (`pid`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_cart_to_user` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `id` tinyint(2) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '产品分类ID',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分类名称',
  `parent` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '父分类编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `bid` int(3) UNSIGNED NOT NULL COMMENT '博客ID',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '评论人',
  `email` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '评论人邮箱',
  `comments` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '评论内容',
  `time` timestamp(6) NOT NULL COMMENT '评论时间',
  `parentId` int(4) NULL DEFAULT NULL COMMENT '评论父级',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_comment_to_blog`(`bid`) USING BTREE,
  CONSTRAINT `fk_comment_to_blog` FOREIGN KEY (`bid`) REFERENCES `blog` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for contact
-- ----------------------------
DROP TABLE IF EXISTS `contact`;
CREATE TABLE `contact`  (
  `id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '联系ID',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '联系名',
  `email` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '联系邮箱',
  `comments` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '联系内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for coupon
-- ----------------------------
DROP TABLE IF EXISTS `coupon`;
CREATE TABLE `coupon`  (
  `id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '优惠券ID',
  `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '优惠券码',
  `deadline` timestamp(6) NOT NULL COMMENT '优惠券截止日期',
  `uid` int(6) UNSIGNED NULL DEFAULT NULL COMMENT '优惠券所属用户ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_coupon_to_user`(`uid`) USING BTREE,
  CONSTRAINT `fk_coupon_to_user` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `url` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单地址',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名',
  `parentId` int(8) NOT NULL COMMENT '父菜单',
  `eabled` tinyint(1) NOT NULL DEFAULT 1 COMMENT '可用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for menu__role
-- ----------------------------
DROP TABLE IF EXISTS `menu__role`;
CREATE TABLE `menu__role`  (
  `id` int(9) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '菜单权限ID',
  `mid` int(8) UNSIGNED NOT NULL COMMENT '菜单ID',
  `rid` tinyint(1) UNSIGNED NOT NULL COMMENT '权限ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_menu_role_to_menu`(`mid`) USING BTREE,
  INDEX `fk_menu_role_to_role`(`rid`) USING BTREE,
  CONSTRAINT `fk_menu_role_to_menu` FOREIGN KEY (`mid`) REFERENCES `menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_menu_role_to_role` FOREIGN KEY (`rid`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `cid` tinyint(2) UNSIGNED NOT NULL COMMENT '分类编号',
  `tid` int(3) UNSIGNED NOT NULL COMMENT '标签',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品名',
  `desc` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品描述',
  `star` tinyint(1) NOT NULL COMMENT '星级',
  `view` int(3) NOT NULL COMMENT '查看数',
  `time` time(6) NOT NULL COMMENT '上架时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_product_to_categories`(`cid`) USING BTREE,
  INDEX `fk_product_to_tag`(`tid`) USING BTREE,
  CONSTRAINT `fk_product_to_categories` FOREIGN KEY (`cid`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_product_to_tag` FOREIGN KEY (`tid`) REFERENCES `tag` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` tinyint(1) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '权限ID',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '权限名',
  `desc` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '权限描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'super_admin', '超级管理员');
INSERT INTO `role` VALUES (2, 'system_admin', '系统管理员');
INSERT INTO `role` VALUES (3, 'product_admin', '商品管理员');
INSERT INTO `role` VALUES (4, 'message_admib', '消息管理员');
INSERT INTO `role` VALUES (5, 'email_admin', '邮件管理员');
INSERT INTO `role` VALUES (6, 'general_user', '普通用户');
INSERT INTO `role` VALUES (7, 'important_user', '重要用户');
INSERT INTO `role` VALUES (8, 'anonymous\n_user', '匿名用户');

-- ----------------------------
-- Table structure for stock
-- ----------------------------
DROP TABLE IF EXISTS `stock`;
CREATE TABLE `stock`  (
  `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '库存ID',
  `pid` int(4) UNSIGNED NOT NULL COMMENT '商品ID',
  `price` double(4, 2) UNSIGNED NOT NULL COMMENT '商品价格',
  `oprice` double(4, 2) NOT NULL COMMENT '商品历史价格',
  `stock` int(2) NOT NULL COMMENT '库存',
  `brand` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品品牌',
  `color` tinyint(1) NOT NULL COMMENT '商品颜色',
  `size` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品型号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_stock_to_product`(`pid`) USING BTREE,
  CONSTRAINT `fk_stock_to_product` FOREIGN KEY (`pid`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for subscribe
-- ----------------------------
DROP TABLE IF EXISTS `subscribe`;
CREATE TABLE `subscribe`  (
  `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '订阅ID',
  `email` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订阅邮箱',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag`  (
  `id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '标签ID',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标签名',
  `desc` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标签解释',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES (1, 'home', '轮播大图');
INSERT INTO `tag` VALUES (2, 'banner', '轮播小图');
INSERT INTO `tag` VALUES (3, 'trending', '折扣');
INSERT INTO `tag` VALUES (4, 'pivot', '特色');
INSERT INTO `tag` VALUES (5, 'discount', '打折');
INSERT INTO `tag` VALUES (6, 'brand', '品牌');
INSERT INTO `tag` VALUES (7, 'blog', '推荐博客');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `faceimg` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户头像',
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `userpass` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户密码',
  `email` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户邮箱',
  `grade` tinyint(1) NOT NULL COMMENT '用户等级',
  `enabled` tinyint(1) NOT NULL COMMENT '账户可用',
  `locked` tinyint(1) NOT NULL COMMENT '账户被锁',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, NULL, 'super', '$2a$10$ZyBM9MVisI7FSVUkvjoK5eB/NbCGYgyfpv27Z7cH9tKaMTICcdgRe', '754012729@qq.com', 0, 1, 0);
INSERT INTO `user` VALUES (2, NULL, 'system', '$2a$10$ZyBM9MVisI7FSVUkvjoK5eB/NbCGYgyfpv27Z7cH9tKaMTICcdgRe', '754012729@qq.com', 0, 1, 0);
INSERT INTO `user` VALUES (3, NULL, 'product', '$2a$10$ZyBM9MVisI7FSVUkvjoK5eB/NbCGYgyfpv27Z7cH9tKaMTICcdgRe', '754012729@qq.com', 0, 1, 0);
INSERT INTO `user` VALUES (4, NULL, 'messge', '$2a$10$ZyBM9MVisI7FSVUkvjoK5eB/NbCGYgyfpv27Z7cH9tKaMTICcdgRe', '754012729@qq.com', 0, 1, 0);
INSERT INTO `user` VALUES (5, NULL, 'email', '$2a$10$ZyBM9MVisI7FSVUkvjoK5eB/NbCGYgyfpv27Z7cH9tKaMTICcdgRe', '754012729@qq.com', 0, 1, 0);
INSERT INTO `user` VALUES (6, NULL, 'important1', '$2a$10$ZyBM9MVisI7FSVUkvjoK5eB/NbCGYgyfpv27Z7cH9tKaMTICcdgRe', '754012729@qq.com', 1, 1, 0);
INSERT INTO `user` VALUES (7, NULL, 'important2', '$2a$10$ZyBM9MVisI7FSVUkvjoK5eB/NbCGYgyfpv27Z7cH9tKaMTICcdgRe', '754012729@qq.com', 1, 1, 0);
INSERT INTO `user` VALUES (8, NULL, 'general1', '$2a$10$ZyBM9MVisI7FSVUkvjoK5eB/NbCGYgyfpv27Z7cH9tKaMTICcdgRe', '754012729@qq.com', 0, 1, 0);
INSERT INTO `user` VALUES (9, NULL, 'general2', '$2a$10$ZyBM9MVisI7FSVUkvjoK5eB/NbCGYgyfpv27Z7cH9tKaMTICcdgRe', '754012729@qq.com', 0, 1, 0);

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '地址ID',
  `uid` int(6) NOT NULL COMMENT '用户ID',
  `tel` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '联系电话',
  `reveivername` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '接收者姓名',
  `birth` time(6) NULL DEFAULT NULL COMMENT '用户生日',
  `address` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户地址',
  PRIMARY KEY (`id`, `uid`) USING BTREE,
  CONSTRAINT `fk_user_to_user_info` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES (1, 6, '13332007656', '俞超', NULL, '安徽合肥');
INSERT INTO `user_info` VALUES (2, 7, '13332007656', '贾金霞', NULL, '山西临汾');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户权限ID',
  `uid` int(7) UNSIGNED NOT NULL COMMENT '用户ID',
  `rid` tinyint(1) UNSIGNED NOT NULL COMMENT '权限ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_user_role_to_role`(`rid`) USING BTREE,
  INDEX `fk_user_role_to_user`(`uid`) USING BTREE,
  CONSTRAINT `fk_user_role_to_role` FOREIGN KEY (`rid`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_role_to_user` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, 1, 1);
INSERT INTO `user_role` VALUES (2, 1, 2);
INSERT INTO `user_role` VALUES (3, 1, 3);
INSERT INTO `user_role` VALUES (4, 1, 4);
INSERT INTO `user_role` VALUES (5, 1, 5);
INSERT INTO `user_role` VALUES (6, 2, 2);
INSERT INTO `user_role` VALUES (7, 3, 3);
INSERT INTO `user_role` VALUES (8, 4, 4);
INSERT INTO `user_role` VALUES (9, 5, 5);
INSERT INTO `user_role` VALUES (10, 8, 6);

SET FOREIGN_KEY_CHECKS = 1;
