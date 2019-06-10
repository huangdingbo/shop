-- phpMyAdmin SQL Dump
-- version 4.4.12
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2019-04-10 11:50:04
-- 服务器版本： 5.5.53
-- PHP Version: 5.6.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `imooc_shop`
--
CREATE DATABASE IF NOT EXISTS `imooc_shop` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `imooc_shop`;

-- --------------------------------------------------------

--
-- 表的结构 `shop_address`
--

DROP TABLE IF EXISTS `shop_address`;
CREATE TABLE IF NOT EXISTS `shop_address` (
  `addressid` bigint(20) unsigned NOT NULL,
  `firstname` varchar(32) NOT NULL DEFAULT '',
  `lastname` varchar(32) NOT NULL DEFAULT '',
  `company` varchar(100) NOT NULL DEFAULT '',
  `address` text,
  `postcode` char(6) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `telephone` varchar(20) NOT NULL DEFAULT '',
  `userid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `shop_address`
--

INSERT INTO `shop_address` (`addressid`, `firstname`, `lastname`, `company`, `address`, `postcode`, `email`, `telephone`, `userid`, `createtime`) VALUES
(2, '蜡笔', '小新', '', '北京市朝阳区某某街道', '100000', 'test@test.com', '13888888888', 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `shop_admin`
--

DROP TABLE IF EXISTS `shop_admin`;
CREATE TABLE IF NOT EXISTS `shop_admin` (
  `adminid` int(10) unsigned NOT NULL COMMENT '主键ID',
  `adminuser` varchar(32) NOT NULL DEFAULT '' COMMENT '管理员账号',
  `adminpass` char(64) NOT NULL DEFAULT '',
  `adminemail` varchar(50) NOT NULL DEFAULT '' COMMENT '管理员电子邮箱',
  `logintime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录时间',
  `loginip` bigint(20) NOT NULL DEFAULT '0' COMMENT '登录IP',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间'
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `shop_admin`
--

INSERT INTO `shop_admin` (`adminid`, `adminuser`, `adminpass`, `adminemail`, `logintime`, `loginip`, `createtime`) VALUES
(12, 'admin', '$2y$13$WKgRoLs09iUfFBuBNdBDSeNrzX7mzPPRU7I8gBLRGzM21nQd8cb0y', 'admintest@admintest.com', 0, 0, 0),
(15, 'testuser', '$2y$13$rt8KZr3rwQsZN.ppMnMYIeZqe5FlsbHyaSDhRO2LBg8qvFVE1leJe', 'testuser123@test.com', 0, 0, 0),
(18, 'ruler', '$2y$13$hFIhJxyDbw/da./ZlXNZqeAOdlF4tT0I0qlCA2xWZMnCCqsq8mDny', 'test@tes123.com', 0, 0, 0),
(19, 'test1', '$2y$13$WQvJErEPjc1Bze5ryydLHeYqwgw92MDrrhX4rUchYinauA4ls5Gby', 'test@test1.com', 0, 0, 0),
(20, 'test2', '$2y$13$xh6EFVdMqKa4obdi/Yl2DecaGpXdj2JqNcXVOUTjZgBNxDVxn55hm', 'test2@test2.com', 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `shop_auth_assignment`
--

DROP TABLE IF EXISTS `shop_auth_assignment`;
CREATE TABLE IF NOT EXISTS `shop_auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `shop_auth_assignment`
--

INSERT INTO `shop_auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('admin', '12', 1480370458),
('category', '15', 1480370643),
('category/*', '16', 1480378369),
('default', '19', 1480432021),
('default/*', '16', 1480378369),
('testrule', '18', 1480391980);

-- --------------------------------------------------------

--
-- 表的结构 `shop_auth_item`
--

DROP TABLE IF EXISTS `shop_auth_item`;
CREATE TABLE IF NOT EXISTS `shop_auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `shop_auth_item`
--

INSERT INTO `shop_auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('admin', 1, '超级管理员', NULL, NULL, 1480370333, 1480370333),
('category', 1, '分类管理员', NULL, NULL, 1480370572, 1480370572),
('category/*', 2, 'category/*', NULL, NULL, 1480370372, 1480370372),
('category/add', 2, 'category/add', NULL, NULL, 1480370372, 1480370372),
('category/del', 2, 'category/del', NULL, NULL, 1480370372, 1480370372),
('category/delete', 2, 'category/delete', NULL, NULL, 1480370372, 1480370372),
('category/list', 2, 'category/list', NULL, NULL, 1480370372, 1480370372),
('category/mod', 2, 'category/mod', NULL, NULL, 1480370372, 1480370372),
('category/rename', 2, 'category/rename', NULL, NULL, 1480370372, 1480370372),
('category/tree', 2, 'category/tree', NULL, NULL, 1480370372, 1480370372),
('common/*', 2, 'common/*', NULL, NULL, 1480370372, 1480370372),
('default', 1, '游客', NULL, NULL, 1480431968, 1480431968),
('default/*', 2, 'default/*', NULL, NULL, 1480370372, 1480370372),
('default/index', 2, 'default/index', NULL, NULL, 1480370372, 1480370372),
('manage/*', 2, 'manage/*', NULL, NULL, 1480370372, 1480370372),
('manage/assign', 2, 'manage/assign', NULL, NULL, 1480370372, 1480370372),
('manage/changeemail', 2, 'manage/changeemail', NULL, NULL, 1480370372, 1480370372),
('manage/changepass', 2, 'manage/changepass', NULL, NULL, 1480370372, 1480370372),
('manage/del', 2, 'manage/del', NULL, NULL, 1480370372, 1480370372),
('manage/mailchangepass', 2, 'manage/mailchangepass', NULL, NULL, 1480370372, 1480370372),
('manage/managers', 2, 'manage/managers', NULL, NULL, 1480370372, 1480370372),
('manage/reg', 2, 'manage/reg', NULL, NULL, 1480370372, 1480370372),
('order/*', 2, 'order/*', NULL, NULL, 1480370372, 1480370372),
('order/detail', 2, 'order/detail', NULL, NULL, 1480370372, 1480370372),
('order/list', 2, 'order/list', NULL, NULL, 1480370372, 1480370372),
('order/send', 2, 'order/send', NULL, NULL, 1480370372, 1480370372),
('product/*', 2, 'product/*', NULL, NULL, 1480370372, 1480370372),
('product/add', 2, 'product/add', NULL, NULL, 1480370372, 1480370372),
('product/del', 2, 'product/del', NULL, NULL, 1480370372, 1480370372),
('product/list', 2, 'product/list', NULL, NULL, 1480370372, 1480370372),
('product/mod', 2, 'product/mod', NULL, NULL, 1480370372, 1480370372),
('product/off', 2, 'product/off', NULL, NULL, 1480370372, 1480370372),
('product/on', 2, 'product/on', NULL, NULL, 1480370372, 1480370372),
('product/removepic', 2, 'product/removepic', NULL, NULL, 1480370372, 1480370372),
('public/*', 2, 'public/*', NULL, NULL, 1480370372, 1480370372),
('public/login', 2, 'public/login', NULL, NULL, 1480370372, 1480370372),
('public/logout', 2, 'public/logout', NULL, NULL, 1480370372, 1480370372),
('public/seekpassword', 2, 'public/seekpassword', NULL, NULL, 1480370372, 1480370372),
('rbac/*', 2, 'rbac/*', NULL, NULL, 1480370372, 1480370372),
('rbac/assignitem', 2, 'rbac/assignitem', NULL, NULL, 1480370372, 1480370372),
('rbac/createrole', 2, 'rbac/createrole', NULL, NULL, 1480370372, 1480370372),
('rbac/roles', 2, 'rbac/roles', NULL, NULL, 1480370372, 1480370372),
('testrule', 1, '测试规则', 'isAuthor', NULL, 1480391834, 1480391834),
('user/*', 2, 'user/*', NULL, NULL, 1480370372, 1480370372),
('user/del', 2, 'user/del', NULL, NULL, 1480370372, 1480370372),
('user/reg', 2, 'user/reg', NULL, NULL, 1480370372, 1480370372),
('user/users', 2, 'user/users', NULL, NULL, 1480370372, 1480370372);

-- --------------------------------------------------------

--
-- 表的结构 `shop_auth_item_child`
--

DROP TABLE IF EXISTS `shop_auth_item_child`;
CREATE TABLE IF NOT EXISTS `shop_auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `shop_auth_item_child`
--

INSERT INTO `shop_auth_item_child` (`parent`, `child`) VALUES
('admin', 'category/*'),
('category', 'category/*'),
('testrule', 'category/*'),
('category', 'category/add'),
('category', 'category/del'),
('category', 'category/delete'),
('category', 'category/list'),
('category', 'category/mod'),
('category', 'category/rename'),
('category', 'category/tree'),
('admin', 'common/*'),
('admin', 'default/*'),
('category', 'default/*'),
('default', 'default/*'),
('testrule', 'default/*'),
('admin', 'manage/*'),
('admin', 'order/*'),
('admin', 'product/*'),
('admin', 'public/*'),
('admin', 'rbac/*'),
('admin', 'user/*');

-- --------------------------------------------------------

--
-- 表的结构 `shop_auth_rule`
--

DROP TABLE IF EXISTS `shop_auth_rule`;
CREATE TABLE IF NOT EXISTS `shop_auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `shop_auth_rule`
--

INSERT INTO `shop_auth_rule` (`name`, `data`, `created_at`, `updated_at`) VALUES
('isAuthor', 'O:21:"app\\models\\AuthorRule":3:{s:4:"name";s:8:"isAuthor";s:9:"createdAt";i:1480391749;s:9:"updatedAt";i:1480391749;}', 1480391749, 1480391749);

-- --------------------------------------------------------

--
-- 表的结构 `shop_cart`
--

DROP TABLE IF EXISTS `shop_cart`;
CREATE TABLE IF NOT EXISTS `shop_cart` (
  `cartid` bigint(20) unsigned NOT NULL,
  `productid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `productnum` int(10) unsigned NOT NULL DEFAULT '0',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `userid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `shop_category`
--

DROP TABLE IF EXISTS `shop_category`;
CREATE TABLE IF NOT EXISTS `shop_category` (
  `cateid` bigint(20) unsigned NOT NULL,
  `title` varchar(32) NOT NULL DEFAULT '',
  `parentid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  `adminid` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `shop_category`
--

INSERT INTO `shop_category` (`cateid`, `title`, `parentid`, `createtime`, `adminid`) VALUES
(7, '家用电器', 0, 1467541004, 0),
(8, '手机', 0, 1467541036, 0),
(9, '电脑', 0, 1467541047, 0),
(10, '办公', 0, 1467541057, 0),
(11, '家居', 0, 1467541066, 0),
(12, '男装', 0, 1467541082, 0),
(13, '女装', 0, 1467541091, 0),
(14, '个护化妆', 0, 1467541099, 0),
(15, '汽车用品', 0, 1467541111, 0),
(16, '玩具乐器', 0, 1467541131, 0),
(17, '食品222', 0, 1467541144, 0),
(18, '平板电视', 7, 1467541223, 0),
(19, '空调', 7, 1467541235, 0),
(20, '冰箱', 7, 1467541243, 0),
(21, '洗衣机', 7, 1467541254, 0),
(22, '家庭影院', 7, 1467541263, 0),
(23, 'DVD', 7, 1467541273, 0),
(24, '迷你音响', 7, 1467541282, 0),
(25, '冷柜/冰吧', 7, 1467541294, 0),
(26, '酒柜', 7, 1467541302, 0),
(27, '家电配件', 7, 1467541310, 0),
(28, '油烟机', 7, 1467541343, 0),
(29, '燃气灶', 7, 1467541353, 0),
(30, '烟灶套装', 7, 1467541361, 0),
(31, '消毒柜', 7, 1467541368, 0),
(32, '洗碗机', 7, 1467541376, 0),
(33, '电热水器', 7, 1467541385, 0),
(34, '嵌入式厨电', 7, 1467541471, 0),
(35, '移动电源', 8, 1467557001, 0),
(36, '蓝牙耳机', 8, 1467557013, 0),
(37, '充电器', 8, 1467557023, 0),
(38, '数据线', 8, 1467557031, 0),
(39, '手机耳机', 8, 1467557039, 0),
(40, '手机支架', 8, 1467557048, 0),
(41, '贴膜', 8, 1467557055, 0),
(42, '手机存储卡', 8, 1467557062, 0),
(43, 'CPU', 9, 1467557083, 0),
(44, '键盘', 9, 1467557088, 0),
(47, '显卡', 9, 1467557102, 0),
(48, '硬盘', 9, 1467557108, 0),
(49, '打印纸', 10, 1467557130, 0),
(50, '圆珠笔', 10, 1467557142, 0),
(51, '中性笔', 10, 1467557147, 0),
(52, '投影机', 10, 1467557168, 0),
(53, '打印机', 10, 1467557173, 0),
(54, '沙发', 11, 1467557187, 0),
(55, '壁柜', 11, 1467557192, 0),
(57, '写字台', 11, 1467557205, 0),
(58, '椅子', 11, 1467557209, 0),
(59, '空调', 11, 1467557217, 0),
(60, '衬衫', 12, 1467557244, 0),
(64, '短裤', 12, 1467557273, 0),
(65, '棉服', 12, 1467557278, 0),
(66, '连衣裙', 13, 1467557293, 0),
(67, '雪纺衫', 13, 1467557298, 0),
(68, '吊带', 13, 1467557307, 0),
(69, '背心', 13, 1467557311, 0),
(71, '洁面', 14, 1467557354, 0),
(72, '爽肤水', 14, 1467557359, 0),
(73, '行车记录仪', 15, 1467557377, 0),
(74, '导航仪', 15, 1467557381, 0),
(75, '车蜡', 15, 1467557391, 0),
(76, '钢琴', 16, 1467557414, 0),
(78, '打击乐器', 16, 1467557425, 0),
(81, '猪牛羊肉', 17, 1467557473, 0),
(88, '测试分类', 0, 1480390320, 12);

-- --------------------------------------------------------

--
-- 表的结构 `shop_migration`
--

DROP TABLE IF EXISTS `shop_migration`;
CREATE TABLE IF NOT EXISTS `shop_migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `shop_migration`
--

INSERT INTO `shop_migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1480304961),
('m140506_102106_rbac_init', 1480306877);

-- --------------------------------------------------------

--
-- 表的结构 `shop_order`
--

DROP TABLE IF EXISTS `shop_order`;
CREATE TABLE IF NOT EXISTS `shop_order` (
  `orderid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `addressid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `status` int(10) unsigned NOT NULL DEFAULT '0',
  `expressid` int(10) unsigned NOT NULL DEFAULT '0',
  `expressno` varchar(50) NOT NULL DEFAULT '',
  `tradeno` varchar(100) NOT NULL DEFAULT '',
  `tradeext` text,
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `shop_order`
--

INSERT INTO `shop_order` (`orderid`, `userid`, `addressid`, `amount`, `status`, `expressid`, `expressno`, `tradeno`, `tradeext`, `createtime`, `updatetime`) VALUES
(1, 1, 2, '6710.00', 100, 2, '', '', NULL, 1468308342, '2016-11-26 02:42:17'),
(2, 1, 2, '2894.00', 100, 3, '', '', NULL, 1468308474, '2016-07-12 07:28:05'),
(3, 1, 0, '0.00', 0, 0, '', '', NULL, 1480128001, '2016-11-26 02:40:01'),
(4, 1, 0, '0.00', 0, 0, '', '', NULL, 1480128041, '2016-11-26 02:40:41'),
(5, 1, 0, '0.00', 0, 0, '', '', NULL, 1480128079, '2016-11-26 02:41:19'),
(6, 1, 0, '0.00', 0, 0, '', '', NULL, 1480128109, '2016-11-26 02:41:49'),
(7, 1, 0, '0.00', 0, 0, '', '', NULL, 1480128193, '2016-11-26 02:43:13'),
(8, 1, 2, '1518.00', 100, 2, '', '', NULL, 1480128231, '2016-11-26 02:57:22'),
(9, 1, 0, '0.00', 0, 0, '', '', NULL, 1480193198, '2016-11-26 20:46:38'),
(10, 1, 0, '0.00', 0, 0, '', '', NULL, 1480194095, '2016-11-26 21:01:35'),
(11, 12, 0, '0.00', 0, 0, '', '', NULL, 1481656816, '2016-12-13 19:20:16'),
(12, 12, 0, '0.00', 0, 0, '', '', NULL, 1481656865, '2016-12-13 19:21:05'),
(13, 12, 0, '0.00', 0, 0, '', '', NULL, 1481661237, '2016-12-13 20:33:57'),
(14, 12, 0, '0.00', 0, 0, '', '', NULL, 1481661280, '2016-12-13 20:34:40');

-- --------------------------------------------------------

--
-- 表的结构 `shop_order_detail`
--

DROP TABLE IF EXISTS `shop_order_detail`;
CREATE TABLE IF NOT EXISTS `shop_order_detail` (
  `detailid` bigint(20) unsigned NOT NULL,
  `productid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `productnum` int(10) unsigned NOT NULL DEFAULT '0',
  `orderid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `shop_order_detail`
--

INSERT INTO `shop_order_detail` (`detailid`, `productid`, `price`, `productnum`, `orderid`, `createtime`) VALUES
(1, 7, '6690.00', 1, 1, 1468308342),
(2, 8, '1396.00', 1, 2, 1468308474),
(3, 10, '1498.00', 1, 2, 1468308474),
(4, 8, '1396.00', 1, 3, 1480128001),
(5, 8, '1396.00', 1, 4, 1480128041),
(6, 7, '6690.00', 6, 5, 1480128079),
(7, 12, '688.00', 1, 6, 1480128109),
(8, 10, '1498.00', 1, 7, 1480128193),
(9, 11, '1498.00', 1, 8, 1480128231),
(10, 7, '6690.00', 3, 9, 1480193198),
(11, 7, '6690.00', 1, 10, 1480194095),
(12, 27, '92.00', 1, 11, 1481656816),
(13, 26, '90.00', 1, 11, 1481656816),
(14, 8, '1396.00', 1, 11, 1481656816),
(15, 7, '6690.00', 1, 11, 1481656816),
(16, 7, '6690.00', 1, 12, 1481656865),
(17, 8, '1396.00', 1, 13, 1481661237),
(18, 26, '90.00', 1, 14, 1481661280);

-- --------------------------------------------------------

--
-- 表的结构 `shop_product`
--

DROP TABLE IF EXISTS `shop_product`;
CREATE TABLE IF NOT EXISTS `shop_product` (
  `productid` bigint(20) unsigned NOT NULL,
  `cateid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `title` varchar(200) NOT NULL DEFAULT '',
  `descr` text,
  `num` int(10) unsigned NOT NULL DEFAULT '0',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `cover` varchar(200) NOT NULL DEFAULT '',
  `pics` text,
  `issale` enum('0','1') NOT NULL DEFAULT '0',
  `ishot` enum('0','1') NOT NULL DEFAULT '0',
  `istui` enum('0','1') NOT NULL DEFAULT '0',
  `saleprice` decimal(10,2) NOT NULL DEFAULT '0.00',
  `ison` enum('0','1') NOT NULL DEFAULT '1',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `shop_product`
--

INSERT INTO `shop_product` (`productid`, `cateid`, `title`, `descr`, `num`, `price`, `cover`, `pics`, `issale`, `ishot`, `istui`, `saleprice`, `ison`, `createtime`, `updatetime`) VALUES
(30, 7, 'test', 'test', 111, '111.00', 'http://pp9uv6lb0.bkt.clouddn.com/5ca1c53231c02', '{"5ca1c5327b7c4":"http:\\/\\/pp9uv6lb0.bkt.clouddn.com\\/5ca1c5327b7c4","5ca1c532ed816":"http:\\/\\/pp9uv6lb0.bkt.clouddn.com\\/5ca1c532ed816"}', '1', '1', '1', '111.00', '1', 1554105651, 1554105651),
(31, 7, 'gfdgf', 'fsgfsf', 111, '11111.00', 'http://pp9uv6lb0.bkt.clouddn.com/5cad50fc5d2d6', '{"5cad50fe19549":"http:\\/\\/pp9uv6lb0.bkt.clouddn.com\\/5cad50fe19549"}', '1', '1', '1', '112.00', '1', 1554862334, 1554862334),
(32, 7, '111', '111', 11, '111.00', 'http://pp9uv6lb0.bkt.clouddn.com/5cadce9c426a0', '{"5cadce9c8c649":"http:\\/\\/pp9uv6lb0.bkt.clouddn.com\\/5cadce9c8c649"}', '1', '1', '1', '11.00', '1', 1554894492, 1554894492),
(33, 7, '111', '111', 11, '111.00', 'http://pp9uv6lb0.bkt.clouddn.com/5cadcebe7185c', '{"5cadcebe9c016":"http:\\/\\/pp9uv6lb0.bkt.clouddn.com\\/5cadcebe9c016"}', '1', '1', '1', '11.00', '1', 1554894526, 1554894526),
(34, 7, '111', '111', 11, '111.00', 'http://pp9uv6lb0.bkt.clouddn.com/5cadced504766', '{"5cadced53c213":"http:\\/\\/pp9uv6lb0.bkt.clouddn.com\\/5cadced53c213"}', '1', '1', '1', '11.00', '1', 1554894549, 1554894549),
(35, 24, '1111', '111', 11, '111.00', 'http://pp9uv6lb0.bkt.clouddn.com/5cadcf436c0e2', '{"5cadcf43dd57c":"http:\\/\\/pp9uv6lb0.bkt.clouddn.com\\/5cadcf43dd57c"}', '1', '1', '1', '11.00', '1', 1554894660, 1554894660),
(36, 24, '1111', '111', 11, '111.00', 'http://pp9uv6lb0.bkt.clouddn.com/5cadcfb7ed9cb', '{"5cadcfb8596c9":"http:\\/\\/pp9uv6lb0.bkt.clouddn.com\\/5cadcfb8596c9"}', '1', '1', '1', '11.00', '1', 1554894776, 1554894776),
(37, 24, '1111', '111', 11, '111.00', 'http://pp9uv6lb0.bkt.clouddn.com/5cadd01237475', '{"5cadd0127a6bd":"http:\\/\\/pp9uv6lb0.bkt.clouddn.com\\/5cadd0127a6bd"}', '1', '1', '1', '11.00', '1', 1554894866, 1554894866),
(38, 24, '1111', '111', 11, '111.00', 'http://pp9uv6lb0.bkt.clouddn.com/5cadd027e9510', '{"5cadd028584d7":"http:\\/\\/pp9uv6lb0.bkt.clouddn.com\\/5cadd028584d7"}', '1', '1', '1', '11.00', '1', 1554894888, 1554894888),
(39, 24, '1111', '111', 11, '111.00', 'http://pp9uv6lb0.bkt.clouddn.com/5cadd03890ecf', '{"5cadd038eeecd":"http:\\/\\/pp9uv6lb0.bkt.clouddn.com\\/5cadd038eeecd"}', '1', '1', '1', '11.00', '1', 1554894905, 1554894905),
(40, 26, '1111', 'gdfgf', 111, '231.00', 'http://pp9uv6lb0.bkt.clouddn.com/5cadd06ca202a', '{"5cadd06cde128":"http:\\/\\/pp9uv6lb0.bkt.clouddn.com\\/5cadd06cde128"}', '0', '0', '0', '111.00', '1', 1554894957, 1554894957);

-- --------------------------------------------------------

--
-- 表的结构 `shop_profile`
--

DROP TABLE IF EXISTS `shop_profile`;
CREATE TABLE IF NOT EXISTS `shop_profile` (
  `id` bigint(20) unsigned NOT NULL COMMENT '主键ID',
  `truename` varchar(32) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `age` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '年龄',
  `sex` enum('0','1','2') NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date NOT NULL DEFAULT '2016-01-01' COMMENT '生日',
  `nickname` varchar(32) NOT NULL DEFAULT '' COMMENT '昵称',
  `company` varchar(100) NOT NULL DEFAULT '' COMMENT '公司',
  `userid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户的ID',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `shop_user`
--

DROP TABLE IF EXISTS `shop_user`;
CREATE TABLE IF NOT EXISTS `shop_user` (
  `userid` bigint(20) unsigned NOT NULL COMMENT '主键ID',
  `username` varchar(32) NOT NULL DEFAULT '',
  `userpass` char(64) NOT NULL DEFAULT '',
  `useremail` varchar(100) NOT NULL DEFAULT '',
  `openid` char(32) NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `shop_user`
--

INSERT INTO `shop_user` (`userid`, `username`, `userpass`, `useremail`, `openid`, `createtime`) VALUES
(8, 'imooc_584ff2d3690df', '$2y$13$IIHLV1c6b5L2TVdmqmVkVux5zfHRAlekvoc90EYvQbGkaj2RSUD1y', '86267659@qq.com', '0', 1481634515),
(9, 'imooc_584ff2e9cf596', '$2y$13$fOfENY.LLav0Lyv0x99JveKkun8QuUjmLPobtpepIGC.xpPsxvWs.', '86267659222222@qq.com', '0', 1481634537),
(10, 'imooc_585009f93169f', '$2y$13$MbfHFopQnzfkcciH49ax/OSbifK1W5lXBOre7dFF1ovd3astSyuVq', 'zhangsan@163.com', '0', 1481640441),
(11, 'imooc_5850119de9ecd', '$2y$13$szqUH0mYsgsWOPjBp5yFUesmyzKf.grbsbwyGaObOEjx5ozdEr0Km', 'zhangsan123@imooc.com', '0', 1481642398),
(12, 'root', '$2y$13$WKgRoLs09iUfFBuBNdBDSeNrzX7mzPPRU7I8gBLRGzM21nQd8cb0y', 'zhangsan@zhangsan.com', '0', 1481652118);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `shop_address`
--
ALTER TABLE `shop_address`
  ADD PRIMARY KEY (`addressid`),
  ADD KEY `shop_address_userid` (`userid`);

--
-- Indexes for table `shop_admin`
--
ALTER TABLE `shop_admin`
  ADD PRIMARY KEY (`adminid`),
  ADD UNIQUE KEY `shop_admin_adminuser_adminpass` (`adminuser`,`adminpass`),
  ADD UNIQUE KEY `shop_admin_adminuser_adminemail` (`adminuser`,`adminemail`);

--
-- Indexes for table `shop_auth_assignment`
--
ALTER TABLE `shop_auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`);

--
-- Indexes for table `shop_auth_item`
--
ALTER TABLE `shop_auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`),
  ADD KEY `idx-auth_item-type` (`type`);

--
-- Indexes for table `shop_auth_item_child`
--
ALTER TABLE `shop_auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Indexes for table `shop_auth_rule`
--
ALTER TABLE `shop_auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `shop_cart`
--
ALTER TABLE `shop_cart`
  ADD PRIMARY KEY (`cartid`),
  ADD KEY `shop_cart_productid` (`productid`),
  ADD KEY `shop_cart_userid` (`userid`);

--
-- Indexes for table `shop_category`
--
ALTER TABLE `shop_category`
  ADD PRIMARY KEY (`cateid`),
  ADD KEY `shop_category_parentid` (`parentid`);

--
-- Indexes for table `shop_migration`
--
ALTER TABLE `shop_migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `shop_order`
--
ALTER TABLE `shop_order`
  ADD PRIMARY KEY (`orderid`),
  ADD KEY `shop_order_userid` (`userid`),
  ADD KEY `shop_order_addressid` (`addressid`),
  ADD KEY `shop_order_expressid` (`expressid`);

--
-- Indexes for table `shop_order_detail`
--
ALTER TABLE `shop_order_detail`
  ADD PRIMARY KEY (`detailid`),
  ADD KEY `shop_order_detail_productid` (`productid`),
  ADD KEY `shop_order_detail_orderid` (`orderid`);

--
-- Indexes for table `shop_product`
--
ALTER TABLE `shop_product`
  ADD PRIMARY KEY (`productid`),
  ADD KEY `shop_product_cateid` (`cateid`),
  ADD KEY `shop_product_ison` (`ison`);

--
-- Indexes for table `shop_profile`
--
ALTER TABLE `shop_profile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shop_profile_userid` (`userid`);

--
-- Indexes for table `shop_user`
--
ALTER TABLE `shop_user`
  ADD PRIMARY KEY (`userid`),
  ADD UNIQUE KEY `shop_user_username_userpass` (`username`,`userpass`),
  ADD UNIQUE KEY `shop_user_useremail_userpass` (`useremail`,`userpass`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `shop_address`
--
ALTER TABLE `shop_address`
  MODIFY `addressid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `shop_admin`
--
ALTER TABLE `shop_admin`
  MODIFY `adminid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `shop_cart`
--
ALTER TABLE `shop_cart`
  MODIFY `cartid` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `shop_category`
--
ALTER TABLE `shop_category`
  MODIFY `cateid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=89;
--
-- AUTO_INCREMENT for table `shop_order`
--
ALTER TABLE `shop_order`
  MODIFY `orderid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `shop_order_detail`
--
ALTER TABLE `shop_order_detail`
  MODIFY `detailid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `shop_product`
--
ALTER TABLE `shop_product`
  MODIFY `productid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `shop_profile`
--
ALTER TABLE `shop_profile`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID';
--
-- AUTO_INCREMENT for table `shop_user`
--
ALTER TABLE `shop_user`
  MODIFY `userid` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',AUTO_INCREMENT=13;
--
-- 限制导出的表
--

--
-- 限制表 `shop_auth_assignment`
--
ALTER TABLE `shop_auth_assignment`
  ADD CONSTRAINT `shop_auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `shop_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `shop_auth_item`
--
ALTER TABLE `shop_auth_item`
  ADD CONSTRAINT `shop_auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `shop_auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- 限制表 `shop_auth_item_child`
--
ALTER TABLE `shop_auth_item_child`
  ADD CONSTRAINT `shop_auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `shop_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `shop_auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `shop_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
