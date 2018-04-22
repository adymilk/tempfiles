/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50165
Source Host           : localhost:3306
Source Database       : shengteng-group

Target Server Type    : MYSQL
Target Server Version : 50165
File Encoding         : 65001

Date: 2018-04-22 10:10:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tbl_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `tbl_auth_group`;
CREATE TABLE `tbl_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` char(80) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `tbl_auth_group_access`;
CREATE TABLE `tbl_auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `tbl_auth_rule`;
CREATE TABLE `tbl_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(80) NOT NULL DEFAULT '',
  `title` char(20) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `condition` char(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_baike
-- ----------------------------
DROP TABLE IF EXISTS `tbl_baike`;
CREATE TABLE `tbl_baike` (
  `id` int(30) NOT NULL AUTO_INCREMENT COMMENT '新闻ID',
  `thumbnail` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `title` varchar(50) NOT NULL COMMENT '新闻标题',
  `author` varchar(11) DEFAULT NULL COMMENT '新闻作者',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `views` char(100) DEFAULT '0' COMMENT '浏览次数',
  `description` varchar(50) DEFAULT NULL COMMENT '新闻简介',
  `content` text COMMENT '新闻内容',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '新闻发布状态',
  `category` varchar(255) DEFAULT NULL COMMENT '百科分类',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `id_2` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='装修百科';

-- ----------------------------
-- Table structure for tbl_branch-company
-- ----------------------------
DROP TABLE IF EXISTS `tbl_branch-company`;
CREATE TABLE `tbl_branch-company` (
  `company_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分公司id',
  `company_name` varchar(20) NOT NULL COMMENT '分公司名称',
  `url` varchar(255) DEFAULT NULL COMMENT '网站网址',
  `thumbnail` varchar(255) DEFAULT NULL COMMENT '店面门头图片',
  `address` varchar(60) NOT NULL COMMENT '分公司地址',
  `tel` varchar(30) NOT NULL COMMENT '分公司电话',
  `city` varchar(20) NOT NULL DEFAULT '空' COMMENT '门店所属城市',
  `count_case` varchar(255) DEFAULT '0' COMMENT '案例总数',
  `count_designers` varchar(255) DEFAULT '0' COMMENT '设计师总数',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据创建时间',
  PRIMARY KEY (`company_id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='盛腾集团分公司汇总表';

-- ----------------------------
-- Table structure for tbl_comment
-- ----------------------------
DROP TABLE IF EXISTS `tbl_comment`;
CREATE TABLE `tbl_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `community_name` varchar(255) NOT NULL COMMENT '小区名称',
  `name` varchar(255) NOT NULL,
  `tel` varchar(255) DEFAULT NULL COMMENT '电话',
  `score` varchar(255) DEFAULT '5' COMMENT '用户打分',
  `comment` varchar(255) DEFAULT NULL COMMENT '评论内容',
  `pic1` varchar(255) DEFAULT NULL,
  `pic2` varchar(255) DEFAULT NULL,
  `pic3` varchar(255) DEFAULT NULL,
  `status` tinyint(1) unsigned zerofill NOT NULL DEFAULT '0' COMMENT '是否在前台显示评论',
  `zan` varchar(255) DEFAULT '0',
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '评论时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_decoration_case
-- ----------------------------
DROP TABLE IF EXISTS `tbl_decoration_case`;
CREATE TABLE `tbl_decoration_case` (
  `case_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '装修案例ID',
  `style` varchar(255) NOT NULL COMMENT '装修风格',
  `type` varchar(255) NOT NULL COMMENT '房屋户型',
  `area` varchar(255) NOT NULL DEFAULT '' COMMENT '面积',
  `community_name` varchar(255) NOT NULL COMMENT '小区名称',
  `case_city` varchar(255) NOT NULL COMMENT '所属城市',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `company_id` varchar(255) NOT NULL COMMENT '装修公司',
  `designer_id` varchar(255) NOT NULL COMMENT '设计师在设计师表中的ID',
  `construction_captain` varchar(255) NOT NULL COMMENT '施工队长',
  `case_photo1` varchar(255) DEFAULT NULL COMMENT '案例图片主图',
  `case_photo2` varchar(255) DEFAULT NULL COMMENT '案例图片副图',
  `case_photo3` varchar(255) DEFAULT NULL COMMENT '案例图片副图',
  `case_photo4` varchar(255) DEFAULT NULL COMMENT '案例图片副图',
  `design_concept` varchar(255) NOT NULL COMMENT '设计理念',
  `case_create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  PRIMARY KEY (`case_id`)
) ENGINE=MyISAM AUTO_INCREMENT=152 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_designer
-- ----------------------------
DROP TABLE IF EXISTS `tbl_designer`;
CREATE TABLE `tbl_designer` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '设计师id',
  `name` varchar(10) NOT NULL COMMENT '设计师姓名',
  `position` varchar(255) NOT NULL DEFAULT '0' COMMENT '设计师职位',
  `company` varchar(20) NOT NULL COMMENT '所属店面',
  `years` int(10) NOT NULL DEFAULT '0' COMMENT '设计师工作经验',
  `avatar` varchar(100) NOT NULL COMMENT '设计师头像',
  `introduction` varchar(300) NOT NULL COMMENT '设计师自我介绍',
  `motto` varchar(255) DEFAULT '' COMMENT '个性签名',
  `numbers` int(11) DEFAULT '0' COMMENT '作品数量',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据添加时间',
  PRIMARY KEY (`id`),
  KEY `belong_shops` (`company`)
) ENGINE=MyISAM AUTO_INCREMENT=104 DEFAULT CHARSET=utf8 COMMENT='设计师人员统计表';

-- ----------------------------
-- Table structure for tbl_news
-- ----------------------------
DROP TABLE IF EXISTS `tbl_news`;
CREATE TABLE `tbl_news` (
  `id` int(30) NOT NULL AUTO_INCREMENT COMMENT '新闻ID',
  `thumbnail` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `title` varchar(50) NOT NULL COMMENT '新闻标题',
  `author` varchar(11) DEFAULT NULL COMMENT '新闻作者',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `views` char(100) DEFAULT '0' COMMENT '浏览次数',
  `description` varchar(255) DEFAULT NULL COMMENT '新闻简介',
  `content` text COMMENT '新闻内容',
  `category` varchar(255) DEFAULT NULL COMMENT '新闻分类',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '新闻发布状态',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `id_2` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='网站新闻';

-- ----------------------------
-- Table structure for tbl_order
-- ----------------------------
DROP TABLE IF EXISTS `tbl_order`;
CREATE TABLE `tbl_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表ID',
  `name` varchar(30) DEFAULT NULL COMMENT '预约姓名',
  `tel` char(20) NOT NULL COMMENT '预约电话',
  `addr` varchar(100) DEFAULT NULL COMMENT '预约地址',
  `area` int(10) DEFAULT NULL COMMENT '预约房屋面积',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '提交时间',
  `from` varchar(20) DEFAULT '空' COMMENT '订单来自',
  `remark` varchar(50) DEFAULT '无' COMMENT '客户预约表备注',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COMMENT='客户在线预约报名表';

-- ----------------------------
-- Table structure for tbl_user
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) NOT NULL COMMENT '用户名称',
  `userPass` varchar(10) NOT NULL COMMENT '用户密码',
  `group` varchar(255) DEFAULT NULL COMMENT '用户组',
  `lastLoginTime` varchar(30) DEFAULT NULL COMMENT '上次登陆时间',
  `registerTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `userLoginNums` int(10) DEFAULT '0' COMMENT '用户登陆次数',
  `userRole` varchar(20) NOT NULL COMMENT '用户角色',
  `userDesc` varchar(20) DEFAULT NULL COMMENT '角色描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Table structure for tbl_website_seo
-- ----------------------------
DROP TABLE IF EXISTS `tbl_website_seo`;
CREATE TABLE `tbl_website_seo` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(50) DEFAULT NULL COMMENT '网站名称',
  `url` varchar(30) DEFAULT NULL COMMENT '网站网址',
  `desc` text COMMENT '网站描述',
  `keywords` text COMMENT '网站关键词',
  `banner1` varchar(255) DEFAULT NULL COMMENT '网站banner',
  `banner2` varchar(255) DEFAULT NULL,
  `banner3` varchar(255) DEFAULT NULL,
  `banner4` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='网站信息表';
