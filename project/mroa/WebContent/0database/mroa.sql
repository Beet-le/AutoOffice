/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50615
Source Host           : localhost:3306
Source Database       : mroa

Target Server Type    : MYSQL
Target Server Version : 50615
File Encoding         : 65001

Date: 2016-12-08 11:04:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `base_userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `base_userinfo`;
CREATE TABLE `base_userinfo` (
  `base_id` varchar(64) NOT NULL,
  `base_name` varchar(10) DEFAULT NULL,
  `base_sex` char(10) DEFAULT NULL,
  `base_age` int(11) DEFAULT NULL,
  `base_fatieshu` int(11) DEFAULT NULL,
  `base_huitieshu` int(11) DEFAULT NULL,
  `base_photo` varchar(255) DEFAULT NULL,
  `base_shenfenzheng` varchar(20) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`base_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of base_userinfo
-- ----------------------------
INSERT INTO `base_userinfo` VALUES ('1', '小明明', '男', '18', '15', '65', null, '220105198888882011', 'admin1');

-- ----------------------------
-- Table structure for `checking_in`
-- ----------------------------
DROP TABLE IF EXISTS `checking_in`;
CREATE TABLE `checking_in` (
  `ckin_id` varchar(64) NOT NULL,
  `ckin_content` varchar(255) DEFAULT NULL,
  `ckin_times` varchar(88) NOT NULL,
  `ckin_date` date NOT NULL,
  `username` varchar(20) NOT NULL,
  PRIMARY KEY (`ckin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of checking_in
-- ----------------------------
INSERT INTO `checking_in` VALUES ('05545265-d962-4694-96e9-d669bcef4ed7', '', '04:27:13,04:27:15,04:27:17', '2016-12-07', 'admin1');
INSERT INTO `checking_in` VALUES ('2286ac44-4f90-400a-bffd-6c350f43b5fa', '无', '08:21:11', '2016-08-18', 'admin');
INSERT INTO `checking_in` VALUES ('2b7b33ff-88c5-4f81-a70f-8eddb4923bec', '的长常常常常长春常常常常', '09:59:47,10:31:05,10:34:02,11:04:12,11:04:19,11:05:06,11:06:37,11:07:08', '2016-08-16', 'admin1');
INSERT INTO `checking_in` VALUES ('2d6f7fec-9684-4abb-8cfd-8152e49d6a7f', '', '10:29:09', '2016-12-08', 'xiaoke');
INSERT INTO `checking_in` VALUES ('3d3fce85-e968-4f42-8745-9fec472d4909', '提前下班,哦啦啦\n下班啊.哦啦啦\n哈哈哈哈哈哈', '03:32:53,04:14:12,04:22:41,04:27:40,04:28:11,04:30:56', '2016-08-17', 'admin');
INSERT INTO `checking_in` VALUES ('52cd98a3-2f17-43c9-9b4d-38454869701b', '上班    \n', '10:09:02,10:11:56,10:12:00,10:16:12,10:16:17,10:16:30', '2016-08-20', 'admin1');
INSERT INTO `checking_in` VALUES ('6acdf10b-e11a-4bd2-a102-61b444e117e2', '', '11:07:54', '2016-08-17', 'admin1');
INSERT INTO `checking_in` VALUES ('7948ee3e-62c3-460f-baba-c8d138b9e18f', '上班', '04:19:08,04:19:17,04:19:23,04:19:26,04:19:29,04:41:08', '2016-09-02', 'admin1');
INSERT INTO `checking_in` VALUES ('a2', 'gogo Let\'go', '09:59:47', '2016-07-13', 'admin1');
INSERT INTO `checking_in` VALUES ('b4ce1678-bd21-4b35-9682-c513c3aa93fa', 'ddddd', '09:23:23', '2016-09-19', 'admin1');
INSERT INTO `checking_in` VALUES ('b7be131a-219e-46aa-8400-5c24538012b3', '', '09:19:25', '2016-08-18', 'admin1');
INSERT INTO `checking_in` VALUES ('b99eb5d5-e851-4fd6-973d-6ac8ed362eeb', '无', '08:25:32', '2016-09-26', 'admin1');
INSERT INTO `checking_in` VALUES ('c3b1a595-f815-4af5-9016-1254ce9f4f91', '外出', '03:52:53', '2016-12-07', 'admin');
INSERT INTO `checking_in` VALUES ('fc924d90-73dc-4c56-a87d-f5c4bd4f013c', 'erwerwe', '10:22:42,10:22:48', '2016-12-08', 'admin1');

-- ----------------------------
-- Table structure for `memorandum`
-- ----------------------------
DROP TABLE IF EXISTS `memorandum`;
CREATE TABLE `memorandum` (
  `memo_id` varchar(64) NOT NULL,
  `memo_xqzs` tinyint(11) NOT NULL,
  `memo_ylzs` tinyint(11) NOT NULL,
  `memo_title` varchar(80) NOT NULL,
  `memo_content` text NOT NULL,
  `memo_year` char(4) NOT NULL,
  `memo_month` char(2) NOT NULL,
  `memo_day` char(2) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`memo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of memorandum
-- ----------------------------
INSERT INTO `memorandum` VALUES ('0f615a5b-bce0-4d94-ab84-4f7edc893865', '2', '3', '顶顶顶', 'vvvv', '2016', '8', '9', 'admin');
INSERT INTO `memorandum` VALUES ('2e79e22e-8f11-492c-92d6-1c66105d8dd0', '4', '2', '心情', '测试', '2016', '9', '2', 'admin1');
INSERT INTO `memorandum` VALUES ('34c1cc30-1923-489c-a113-84f6d365fc3d', '1', '1', '101050501', 'bmbb', '2016', '8', '16', 'admin1');
INSERT INTO `memorandum` VALUES ('3bfae433-e37c-4497-8615-ed261568b19d', '1', '1', '', '打算发达所发生的范德萨发生的', '2016', '8', '10', 'admin1');
INSERT INTO `memorandum` VALUES ('869c84b0-a580-4b29-a886-56c4a16ec82b', '1', '1', '125102102', '0020202', '2016', '8', '4', 'admin1');
INSERT INTO `memorandum` VALUES ('87839d33-007c-4cef-92e5-340021f462c2', '3', '3', '标题党', '标题党', '2016', '9', '26', 'admin1');
INSERT INTO `memorandum` VALUES ('8c4d1f09-0489-46ac-83b8-ef3938b24f8b', '1', '1', '备忘录', '另', '2016', '12', '8', 'admin1');
INSERT INTO `memorandum` VALUES ('a164e12f-a26d-4a83-804b-dff8d1fc9502', '1', '1', 'ss', 'dfds', '2016', '12', '8', 'admin');
INSERT INTO `memorandum` VALUES ('ad6d0a11-01ca-4ecc-a474-a9f386996227', '3', '2', '长城长', 'vvvvvvv水水水水水', '2016', '8', '10', 'admin');
INSERT INTO `memorandum` VALUES ('b74cb7e2-149b-4dad-b125-7f04e8eb4911', '3', '2', '收拾收拾', '常常常常', '2016', '9', '24', 'admin1');
INSERT INTO `memorandum` VALUES ('c24128eb-93ec-42f9-a228-93432d99e13c', '3', '4', '标题', '内容', '2016', '9', '25', 'admin1');
INSERT INTO `memorandum` VALUES ('cbb8835b-da6d-4aca-8b91-293b7f49a601', '2', '4', '从机场究竟是', '点击打开的进口量厂家可是我', '2016', '8', '3', 'admin1');
INSERT INTO `memorandum` VALUES ('d58c4b54-e2ed-41e2-b1c7-43dca54ae161', '1', '1', '测试Admin', '啦啦啦德玛西亚', '2016', '9', '19', 'admin1');
INSERT INTO `memorandum` VALUES ('dea2a0ce-f6b1-424f-a5ed-bee066782ddf', '1', '1', '是发的撒发的撒发达省份', '但是发的撒发的撒发的撒发大水发达省份打算发达省份   ', '2016', '8', '20', 'admin1');
INSERT INTO `memorandum` VALUES ('e6449365-7382-49bb-aed8-4591f3a3eb11', '1', '1', '收拾收拾收拾收拾', '常常常常常常常常常常\r\n<br>\r\n常常常常常常常常常常\r\n<br>\r\n常常常常常常常常常常', '2016', '8', '8', 'admin1');
INSERT INTO `memorandum` VALUES ('ebaa27a5-4584-482c-899b-40110b4de16d', '2', '3', '某某某获得一枚金牌', '大家的健康的肯定就看到了大家', '2016', '8', '2', 'admin1');
INSERT INTO `memorandum` VALUES ('f96aeed8-f012-4dfd-9e23-958b6a3d8147', '2', '3', 'xxxxxxx', '<p style=\'color:blue\' >成绩查询经常</p>\r\n\r\n<p style=\'color:red\' >成绩查询经常</p>\r\n\r\n<p style=\'color:red\' >成绩查询经常</p>\r\n\r\n<p style=\'color:red\' >成绩查询经常</p>\r\n', '2016', '8', '1', 'admin1');
INSERT INTO `memorandum` VALUES ('f97131da-c8ff-40c1-a378-95a576bb92ec', '5', '5', '打算发达省份', 'da\'s\'f\'da\'s\'f\'s\'f\'da\'s\'f\'s\'fa\'s\'f\'da\'s\'f', '2016', '8', '11', 'admin1');

-- ----------------------------
-- Table structure for `plan_work`
-- ----------------------------
DROP TABLE IF EXISTS `plan_work`;
CREATE TABLE `plan_work` (
  `plan_id` varchar(64) NOT NULL,
  `plan_content` text NOT NULL,
  `plan_title` varchar(80) NOT NULL,
  `plan_creat` varchar(64) NOT NULL COMMENT '创建人',
  `plan_to` varchar(64) NOT NULL COMMENT '发送给谁',
  `plan_creatime` datetime NOT NULL,
  `plan_updatetime` datetime NOT NULL,
  `plan_flag` char(1) NOT NULL COMMENT '审批状态',
  `plan_update` varchar(64) DEFAULT NULL,
  `plan_yxj` int(11) NOT NULL DEFAULT '1',
  `plan_fzd` int(11) NOT NULL DEFAULT '1',
  `plan_start` datetime NOT NULL,
  `plan_end` datetime NOT NULL,
  PRIMARY KEY (`plan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of plan_work
-- ----------------------------
INSERT INTO `plan_work` VALUES ('1c1eeff0-b761-4ffa-b271-3db7afb757ef', '第一周工作计划', '明日科技周计划', 'admin1', 'xiaoke', '2016-12-08 10:31:47', '2016-12-08 10:32:11', '2', 'xiaoke', '5', '5', '2016-12-08 10:31:25', '2016-12-08 10:31:25');
INSERT INTO `plan_work` VALUES ('49afb9c6-de46-43e1-b10c-6027630ba4b9', 'A计划，申报。修改问卷调查的数据库', '任务计划申请', 'admin1', 'admin1', '2016-09-26 08:51:42', '2016-12-07 16:12:02', '2', '刘娜', '3', '2', '2016-09-26 08:50:31', '2016-09-26 08:50:31');
INSERT INTO `plan_work` VALUES ('7d1b3fd7-6ea2-45ce-ae8e-83cc383e8e18', '写文档', '我的工作计划', 'admin1', 'mr', '2016-12-08 11:00:02', '2016-12-08 11:00:02', '1', '明日科技', '1', '1', '2016-12-08 10:59:22', '2016-12-10 10:59:22');
INSERT INTO `plan_work` VALUES ('7ebd4223-b10e-4f93-8820-68b8c49598e0', '统计部门人员工作完成情况', '统计工作完成情况', 'admin1', 'admin1', '2016-12-08 10:56:34', '2016-12-08 10:56:34', '1', '明日科技', '1', '1', '2016-12-08 10:55:40', '2016-12-10 10:55:40');

-- ----------------------------
-- Table structure for `sys_login`
-- ----------------------------
DROP TABLE IF EXISTS `sys_login`;
CREATE TABLE `sys_login` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(64) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `wxname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`login_id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='登录信息表';

-- ----------------------------
-- Records of sys_login
-- ----------------------------
INSERT INTO `sys_login` VALUES ('1', 'mr', 'fdb390e945559e74475ed8c8bbb48ca5', '80303857@qq.com', '明日科技');
INSERT INTO `sys_login` VALUES ('4', 'admin1', '21232f297a57a5a743894a0e4a801fc3', '80303857@qq.com', '刘娜');
INSERT INTO `sys_login` VALUES ('5', 'admin2', '21232f297a57a5a743894a0e4a801fc3', '80303857@qq.com', '明日');
INSERT INTO `sys_login` VALUES ('6', 'admin3', '21232f297a57a5a743894a0e4a801fc3', '80303857@qq.com', '迪迪');
INSERT INTO `sys_login` VALUES ('26', '请叫我大王', 'e10adc3949ba59abbe56e057f20f883e', '893808512@qq.com', '请叫我大王');
INSERT INTO `sys_login` VALUES ('27', 'xiaoke', 'e068ef92aa755ecd329e67489e21773c', 'xiaoke@163.com', 'xiaoke');

-- ----------------------------
-- Table structure for `sys_login_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_role`;
CREATE TABLE `sys_login_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='用户较色对照表';

-- ----------------------------
-- Records of sys_login_role
-- ----------------------------
INSERT INTO `sys_login_role` VALUES ('1', '4', '1', 'admin1');
INSERT INTO `sys_login_role` VALUES ('2', '21', '2', 'admin2');
INSERT INTO `sys_login_role` VALUES ('3', '1', '3', 'mr');
INSERT INTO `sys_login_role` VALUES ('4', '23', '5', 'admin3');
INSERT INTO `sys_login_role` VALUES ('5', '24', '3', 'aaxxss');
INSERT INTO `sys_login_role` VALUES ('6', '25', '3', 'aa789456');
INSERT INTO `sys_login_role` VALUES ('7', '26', '3', '请叫我大王');
INSERT INTO `sys_login_role` VALUES ('8', '27', '3', 'xiaoke');

-- ----------------------------
-- Table structure for `sys_permission`
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission` (
  `permission_id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_name` varchar(20) NOT NULL,
  `permission_menu_name` varchar(20) NOT NULL,
  `permission_menu_pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`permission_id`),
  UNIQUE KEY `permission_name_UNIQUE` (`permission_name`),
  UNIQUE KEY `permission_menu_name_UNIQUE` (`permission_menu_name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='权限';

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES ('1', 'xinwgl', '新闻管理1', '0');
INSERT INTO `sys_permission` VALUES ('2', 'yonggxx', '用工信息', '0');
INSERT INTO `sys_permission` VALUES ('3', 'zhaopxx', '招聘信息', '0');
INSERT INTO `sys_permission` VALUES ('4', 'qiywh', '企业文化', '0');
INSERT INTO `sys_permission` VALUES ('6', 'zengj', '增加', '1');
INSERT INTO `sys_permission` VALUES ('7', 'maic', '卖场', '0');
INSERT INTO `sys_permission` VALUES ('8', 'quanxian', '权限设置', null);

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(20) NOT NULL,
  `role_des` varchar(20) NOT NULL,
  `role_pid` int(11) NOT NULL,
  `role_group` varchar(10) DEFAULT NULL,
  `role_groupname` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_des_UNIQUE` (`role_des`),
  UNIQUE KEY `role_name_UNIQUE` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', 'kfbzg', '开发部主管', '0', 'kaifabu', '开发部');
INSERT INTO `sys_role` VALUES ('2', 'cpbzg', '产品部主管', '0', 'chanpinbu', '产品部');
INSERT INTO `sys_role` VALUES ('3', 'zhbzg', '综合部主管', '0', 'zonghebu', '综合部');
INSERT INTO `sys_role` VALUES ('4', 'role', '权限分配', '-1', '-1', '-1');
INSERT INTO `sys_role` VALUES ('5', 'bjbzg', '编辑部主管', '0', 'bianjibu', '编辑部');
INSERT INTO `sys_role` VALUES ('6', 'kfbzy', '开发部组员', '1', 'kaifabu', '开发部');
INSERT INTO `sys_role` VALUES ('7', 'cpbzy', '产品部组员', '2', 'chanpinbu', '产品部');
INSERT INTO `sys_role` VALUES ('8', 'zhbzy', '综合部组员', '3', 'zonghebu', '综合部');
INSERT INTO `sys_role` VALUES ('9', 'bjbzy', '编辑部组员', '4', 'bianjibu', '编辑部');

-- ----------------------------
-- Table structure for `sys_role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `role_name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='角色，权限对照表';

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES ('13', '1', '1', 'admin');
INSERT INTO `sys_role_permission` VALUES ('14', '1', '6', 'admin');
INSERT INTO `sys_role_permission` VALUES ('15', '1', '2', 'admin');
INSERT INTO `sys_role_permission` VALUES ('16', '1', '3', 'admin');
INSERT INTO `sys_role_permission` VALUES ('17', '1', '4', 'admin');
INSERT INTO `sys_role_permission` VALUES ('18', '1', '7', 'admin');
