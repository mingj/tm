/*
SQLyog v10.2 
MySQL - 5.5.15 : Database - tm
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`tm` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `tm`;

/*Table structure for table `t_course_info` */

DROP TABLE IF EXISTS `t_course_info`;

CREATE TABLE `t_course_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) DEFAULT NULL,
  `description` text COMMENT '课程简介',
  `teacher_id` int(11) DEFAULT NULL COMMENT '开设课程的教师资料',
  `create_date` varchar(256) DEFAULT NULL COMMENT '开设日期',
  `status` varchar(64) DEFAULT '1' COMMENT '课程状态:激活-1、关闭-2',
  `code` varchar(256) DEFAULT NULL COMMENT '课程代码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='课程表';

/*Data for the table `t_course_info` */

insert  into `t_course_info`(`id`,`name`,`description`,`teacher_id`,`create_date`,`status`,`code`) values (1,'企业级开发','<span style=\"color: rgb(51, 51, 51); font-family: 宋体; line-height: 22px;\">&nbsp; &nbsp; &nbsp;从来没有任何事物像互联网那样，对人类的活动产生如此深刻的影响，无论是政府、企业，以及个人，莫不如此。与此同时，IT产业也正面临着一场变革——传统应用向基于Internet/Web的服务模式转化。&nbsp;</span><br style=\"color: rgb(51, 51, 51); font-family: 宋体; line-height: 22px;\" /><span style=\"color: rgb(51, 51, 51); font-family: 宋体; line-height: 22px;\">　　 翻开历史，我们可以看到互联网的形成和发展就是以分布性、开放性和平台无关性为基础的，这是Internet与生俱有的属性。随着互联网应用的发展，又引入了诸如RPC/COM/CORBA等技术，但这些技术在实际应用中又存在着很多不足和局限。它们的特定协议也难以通过防火墙，因而不适合在Web上的应用开发。为了进一步开发基于Web的应用，相继出现了Sun公司的Sun ONE（Open Net Environment开放网络环境）和Microsoft公司的.NET两大Web服务技术体系。其中，Sun ONE以Java技术为核心，更接近或者满足于互联网在智能化Web服务上对分布性、开放性和平台无关性的要求，同时其在健壮性、安全性、组件化等方面也更为成熟稳定，获得了众多IT厂商和产品的支持，是目前惟一在市场上得到了广泛应用的技术体系</span><br /><br />',1,'2014-06-09','1','CODE2');

/*Table structure for table `t_dictionary_info` */

DROP TABLE IF EXISTS `t_dictionary_info`;

CREATE TABLE `t_dictionary_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dictionary_key` varchar(64) NOT NULL COMMENT '数据字典键值',
  `dictionary_value` varchar(256) DEFAULT NULL COMMENT '数据字典数值',
  `dictionary_name` varchar(256) DEFAULT NULL COMMENT '数据字典名称',
  `description` varchar(256) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='字典表';

/*Data for the table `t_dictionary_info` */

insert  into `t_dictionary_info`(`id`,`dictionary_key`,`dictionary_value`,`dictionary_name`,`description`) values (1,'ISLOCK','1','是','是否锁定'),(2,'ISLOCK','0','否','是否锁定'),(3,'SEX','1','男',NULL),(4,'SEX','2','女',NULL),(5,'COURSE_STATUS','1','开放','课程状态'),(6,'COURSE_STATUS','2','关闭','课程状态'),(7,'JOB_STATUS','1','发布','作业状态'),(8,'JOB_STATUS','2','关闭','作业状态'),(9,'RESOURCE_TYPE','1','视频资料','资料库类型'),(10,'RESOURCE_TYPE','4','课程课件','资料库类型'),(11,'RESOURCE_TYPE','2','文本资料','资料库类型'),(12,'RESOURCE_TYPE','3','图片资料','资料库类型'),(13,'FILE_STATUS','1','发布','文件状态'),(14,'FILE_STATUS','2','关闭','文件状态');

/*Table structure for table `t_file_info` */

DROP TABLE IF EXISTS `t_file_info`;

CREATE TABLE `t_file_info` (
  `id` varchar(64) NOT NULL,
  `file_name` varchar(256) DEFAULT NULL,
  `file_path` varchar(500) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `create_date` varchar(256) DEFAULT NULL,
  `resource_type` varchar(64) DEFAULT NULL COMMENT '所属资源库类别',
  `extension` varchar(256) DEFAULT NULL COMMENT '扩展名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_file_info` */

/*Table structure for table `t_job_info` */

DROP TABLE IF EXISTS `t_job_info`;

CREATE TABLE `t_job_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) DEFAULT NULL COMMENT '作业标题',
  `content` text COMMENT '作业内容',
  `teacher_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `create_date` varchar(256) DEFAULT NULL,
  `status` varchar(64) DEFAULT NULL COMMENT '1-发布,2-关闭',
  `finish_date` varchar(256) DEFAULT NULL COMMENT '作业完成日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_job_info` */

/*Table structure for table `t_menu_info` */

DROP TABLE IF EXISTS `t_menu_info`;

CREATE TABLE `t_menu_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) DEFAULT NULL COMMENT '菜单名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='菜单表';

/*Data for the table `t_menu_info` */

insert  into `t_menu_info`(`id`,`name`) values (1,'基本管理'),(2,'系统管理'),(3,'教师菜单'),(4,'学生菜单'),(5,'论坛');

/*Table structure for table `t_message_info` */

DROP TABLE IF EXISTS `t_message_info`;

CREATE TABLE `t_message_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) DEFAULT NULL COMMENT '通知标题',
  `content` text COMMENT '通知内容',
  `teacher_id` int(11) DEFAULT NULL COMMENT '发送通知人',
  `course_id` int(11) DEFAULT NULL COMMENT '通知课程',
  `create_date` varchar(256) DEFAULT NULL COMMENT '通知日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='教学通知信息表';

/*Data for the table `t_message_info` */

insert  into `t_message_info`(`id`,`title`,`content`,`teacher_id`,`course_id`,`create_date`) values (1,'教学通知','教学通知',1,1,'2014-06-09');

/*Table structure for table `t_org_info` */

DROP TABLE IF EXISTS `t_org_info`;

CREATE TABLE `t_org_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) DEFAULT NULL COMMENT '院系名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='院系表';

/*Data for the table `t_org_info` */

insert  into `t_org_info`(`id`,`name`) values (1,'信息学院'),(2,'数理学院'),(3,'电气工程与自动化学院'),(4,'机械与汽车工程学院'),(5,'艺术学院'),(6,'食品与生物工程学院'),(7,'外国语学院'),(8,'轻化与环境工程学院');

/*Table structure for table `t_role_info` */

DROP TABLE IF EXISTS `t_role_info`;

CREATE TABLE `t_role_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL COMMENT '角色名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='角色表';

/*Data for the table `t_role_info` */

insert  into `t_role_info`(`id`,`name`) values (1,'管理员'),(2,'教师'),(3,'学生');

/*Table structure for table `t_role_submenu_rec` */

DROP TABLE IF EXISTS `t_role_submenu_rec`;

CREATE TABLE `t_role_submenu_rec` (
  `submenu_id` int(11) NOT NULL COMMENT '子菜单ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`submenu_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色与子菜单关联表';

/*Data for the table `t_role_submenu_rec` */

insert  into `t_role_submenu_rec`(`submenu_id`,`role_id`) values (1,1),(2,1),(3,2),(4,2),(5,2),(6,2),(7,2),(8,2),(9,2),(9,3),(10,3),(11,3),(12,3),(13,3),(14,3),(15,1),(16,1),(17,1);

/*Table structure for table `t_student_course_rec` */

DROP TABLE IF EXISTS `t_student_course_rec`;

CREATE TABLE `t_student_course_rec` (
  `student_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`student_id`,`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生与课程关联表';

/*Data for the table `t_student_course_rec` */

/*Table structure for table `t_student_info` */

DROP TABLE IF EXISTS `t_student_info`;

CREATE TABLE `t_student_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `code` varchar(256) DEFAULT NULL COMMENT '学号',
  `id_number` varchar(32) DEFAULT NULL COMMENT '身份证',
  `org_id` int(11) DEFAULT NULL COMMENT '所在院系',
  `classes` varchar(64) DEFAULT NULL COMMENT '所在班级',
  `sex` varchar(64) DEFAULT NULL COMMENT '性别',
  `age` int(3) DEFAULT NULL COMMENT '年龄',
  `mobile` varchar(64) DEFAULT NULL,
  `email` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生表';

/*Data for the table `t_student_info` */

/*Table structure for table `t_submenu_info` */

DROP TABLE IF EXISTS `t_submenu_info`;

CREATE TABLE `t_submenu_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL COMMENT '子菜单名',
  `menu_id` int(11) NOT NULL COMMENT '父菜单ID',
  `path` varchar(256) DEFAULT NULL COMMENT '子菜单关联的页面',
  `order_num` int(11) DEFAULT NULL,
  `code` varchar(256) DEFAULT NULL COMMENT '编码-客户端用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='子菜单表';

/*Data for the table `t_submenu_info` */

insert  into `t_submenu_info`(`id`,`name`,`menu_id`,`path`,`order_num`,`code`) values (1,'登录账户管理',2,'/main/goUserManager.do',4,NULL),(2,'角色管理',2,'/main/goRoleManager.do',5,NULL),(3,'首页',3,'/goTeacher.do',1,'icon-home'),(4,'教师信息',3,'/goTeacherInfo.do',2,'icon-user'),(5,'课程管理',3,'/goCourseManager.do',3,'icon-th-large'),(6,'教学资料库',3,'/goTeachResource.do',4,'icon-th-list'),(7,'发布作业',3,'/goPublishJob.do',5,'icon-pencil'),(8,'教学通知',3,'/goMessageManager.do',6,'icon-envelope'),(9,'课程交流BBS',5,'',7,'icon-comment'),(10,'首页',4,'/goStudent.do',1,'icon-home'),(11,'学生信息',4,'/goStudentInfo.do',2,'icon-user'),(12,'教学资料库',4,'/goStudentResource.do',4,'icon-th-list'),(13,'课程管理',4,'/goStudentCourse.do',3,'icon-th-large'),(14,'教学通知',4,'/goStudentMessage.do',6,'icon-envelope'),(15,'教师录入',2,'/main/goTeacherManager.do',2,NULL),(16,'学生录入',2,'/main/goStudentManager.do',3,NULL),(17,'学院管理',2,'/main/goOrgManager.do',1,NULL);

/*Table structure for table `t_teacher_info` */

DROP TABLE IF EXISTS `t_teacher_info`;

CREATE TABLE `t_teacher_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `code` varchar(256) DEFAULT NULL,
  `id_number` varchar(32) DEFAULT NULL COMMENT '身份证号',
  `profession` varchar(64) DEFAULT NULL COMMENT '职称',
  `org_id` int(11) DEFAULT NULL COMMENT '所在院系或组织',
  `age` int(3) DEFAULT NULL,
  `sex` varchar(64) DEFAULT NULL,
  `mobile` varchar(64) DEFAULT NULL,
  `email` varchar(256) DEFAULT NULL,
  `description` text COMMENT '简介',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='教师表';

/*Data for the table `t_teacher_info` */

insert  into `t_teacher_info`(`id`,`name`,`code`,`id_number`,`profession`,`org_id`,`age`,`sex`,`mobile`,`email`,`description`) values (1,'程序猿','admin123','432502199102070038','高级教师',1,21,'1','15651775791','41989824@qq.com',NULL);

/*Table structure for table `t_user_info` */

DROP TABLE IF EXISTS `t_user_info`;

CREATE TABLE `t_user_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(256) DEFAULT NULL,
  `password` varchar(256) DEFAULT NULL,
  `name` varchar(256) DEFAULT NULL COMMENT '实际姓名',
  `role_id` int(11) DEFAULT NULL COMMENT '角色ID',
  `create_time` varchar(64) DEFAULT NULL COMMENT '创建时间',
  `update_time` varchar(64) DEFAULT NULL COMMENT '修改时间',
  `isLock` int(1) DEFAULT '0' COMMENT '0-不锁定 1-锁定',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `t_user_info` */

insert  into `t_user_info`(`id`,`username`,`password`,`name`,`role_id`,`create_time`,`update_time`,`isLock`) values (1,'admin','admin123','管理员',1,'2014-04-11','2014-04-11',0),(2,'admin123','123','程序猿',2,'2014-06-05',NULL,0);

/* Function  structure for function  `classesName` */

/*!50003 DROP FUNCTION IF EXISTS `classesName` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `classesName`(in_id INT) RETURNS varchar(256) CHARSET utf8
BEGIN
	DECLARE out_name VARCHAR(256) DEFAULT '';
	SELECT `name` INTO out_name FROM t_classes_info WHERE id=in_id;
	RETURN out_name;
    END */$$
DELIMITER ;

/* Function  structure for function  `courseName` */

/*!50003 DROP FUNCTION IF EXISTS `courseName` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `courseName`(in_id int) RETURNS varchar(256) CHARSET utf8
BEGIN
	DECLARE out_name varchar(256) default '';
	select `name` into out_name from t_course_info where id=in_id;
	return out_name;
    END */$$
DELIMITER ;

/* Function  structure for function  `nameByCode` */

/*!50003 DROP FUNCTION IF EXISTS `nameByCode` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `nameByCode`(in_key varchar(64),in_value varchar(64)) RETURNS varchar(256) CHARSET utf8
BEGIN
	DECLARE out_name varchar(256) DEFAULT '';
	SELECT dictionary_name into out_name from t_dictionary_info where dictionary_key=in_key and dictionary_value=in_value;
	RETURN out_name;
    END */$$
DELIMITER ;

/* Function  structure for function  `orgName` */

/*!50003 DROP FUNCTION IF EXISTS `orgName` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `orgName`(in_id INT) RETURNS varchar(256) CHARSET utf8
BEGIN
	DECLARE out_name VARCHAR(256) DEFAULT '';
	SELECT `name` INTO out_name FROM t_org_info WHERE id=in_id;
	RETURN out_name;
    END */$$
DELIMITER ;

/* Function  structure for function  `teacherName` */

/*!50003 DROP FUNCTION IF EXISTS `teacherName` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `teacherName`(in_id INT) RETURNS varchar(256) CHARSET utf8
BEGIN
	DECLARE out_name VARCHAR(256) DEFAULT '';
	SELECT `name` INTO out_name FROM t_teacher_info WHERE id=in_id;
	RETURN out_name;
    END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
