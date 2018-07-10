-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: kinder_crm
-- ------------------------------------------------------
-- Server version	5.7.17-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `empno_auto`
--

DROP TABLE IF EXISTS `empno_auto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empno_auto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empno` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empno_auto`
--

LOCK TABLES `empno_auto` WRITE;
/*!40000 ALTER TABLE `empno_auto` DISABLE KEYS */;
INSERT INTO `empno_auto` VALUES (1,1046);
/*!40000 ALTER TABLE `empno_auto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_agreement`
--

DROP TABLE IF EXISTS `tb_agreement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_agreement` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '员工协议表ID',
  `emp_id` int(11) DEFAULT NULL COMMENT '协议表',
  `agree_name` varchar(20) DEFAULT NULL COMMENT '协议名',
  `start_time` date DEFAULT NULL COMMENT '开始时间',
  `end_time` date DEFAULT NULL COMMENT '结束时间',
  `url` varchar(2048) DEFAULT NULL COMMENT '文件保存路径',
  `file_name` varchar(1024) DEFAULT NULL COMMENT '文件名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_agreement`
--

LOCK TABLES `tb_agreement` WRITE;
/*!40000 ALTER TABLE `tb_agreement` DISABLE KEYS */;
INSERT INTO `tb_agreement` VALUES (1,1,'劳动合同','2018-03-08','2018-06-18','C:/agreement,','劳动合同.doc、'),(2,3,'劳动合同','2018-06-07','2070-06-01','C:/agreement,','劳动合同.doc、'),(25,3,'劳动合同1','2018-06-15','2018-06-15','upload/agreement/0ff465ae-f873-4731-af73-840758d1b81d工作计划.txt,upload/agreement/195d14c4-97e1-4903-9c85-993a5c272846幼儿园电教资料管理系统 .txt,','工作计划.txt、幼儿园电教资料管理系统 .txt、');
/*!40000 ALTER TABLE `tb_agreement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cate_level`
--

DROP TABLE IF EXISTS `tb_cate_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_cate_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '职称级别表',
  `level_name` varchar(255) NOT NULL COMMENT '级别名称',
  `time_limit` int(11) DEFAULT NULL COMMENT '职称年限',
  `level` varchar(255) DEFAULT NULL COMMENT '级别  有职称类别表中的员工类别表有关 ---备用字段',
  `category_id` int(11) DEFAULT NULL COMMENT '所属类别ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cate_level`
--

LOCK TABLES `tb_cate_level` WRITE;
/*!40000 ALTER TABLE `tb_cate_level` DISABLE KEYS */;
INSERT INTO `tb_cate_level` VALUES (1,'特级教师',2,'一级',1),(2,'高级教师',2,'二级',1),(3,'中级教师',2,'三级',1),(4,'中级护理',2,'二级',2),(15,'y',1,'y',4),(16,'e',2,'e',4),(17,'y',1,'y',6),(18,'e',2,'e',6);
/*!40000 ALTER TABLE `tb_cate_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_category`
--

DROP TABLE IF EXISTS `tb_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '职称的类别表',
  `cate_name` varchar(255) DEFAULT NULL COMMENT '类别名',
  `level_num` int(11) DEFAULT NULL COMMENT '级别数量',
  `note` varchar(255) DEFAULT '暂无描述' COMMENT '类别描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_category`
--

LOCK TABLES `tb_category` WRITE;
/*!40000 ALTER TABLE `tb_category` DISABLE KEYS */;
INSERT INTO `tb_category` VALUES (1,'教师',3,'暂无描述'),(2,'护理',2,'暂无描述'),(4,'电教',2,'嗯嗯'),(6,'你好',2,'好');
/*!40000 ALTER TABLE `tb_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_changed`
--

DROP TABLE IF EXISTS `tb_changed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_changed` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '变更表',
  `emp_id` int(11) DEFAULT NULL,
  `change_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '生效时间',
  `status` int(11) DEFAULT '0' COMMENT '工作状态  0在编/ 1人事代理/ 2非人事代理/ 3退休返聘',
  `nature` int(11) DEFAULT '0' COMMENT '工作性质 0在职/ 1离职/ 2退休/ 3返聘',
  `post_id` int(11) DEFAULT NULL COMMENT '变更职位',
  `method` int(11) DEFAULT '0' COMMENT '0/还未执行变更的信息（未来变更）   1/已经变更过的员工信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_changed`
--

LOCK TABLES `tb_changed` WRITE;
/*!40000 ALTER TABLE `tb_changed` DISABLE KEYS */;
INSERT INTO `tb_changed` VALUES (1,3,'2018-05-28 01:35:14',0,1,7,1),(9,3,'2018-06-18 16:00:00',1,0,1,NULL),(10,26,'2018-06-27 16:00:00',1,1,6,1);
/*!40000 ALTER TABLE `tb_changed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_commend`
--

DROP TABLE IF EXISTS `tb_commend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_commend` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表彰',
  `level` varchar(10) DEFAULT NULL COMMENT '表彰级别 园级/ 区级/ 市级/ 省级/ 国家级',
  `commend_name` varchar(20) DEFAULT NULL COMMENT '表彰名称',
  `emp_id` int(11) DEFAULT NULL COMMENT '员工ID',
  `note` varchar(56) DEFAULT NULL COMMENT '说明',
  `get_time` date DEFAULT NULL,
  `url` varchar(2090) DEFAULT NULL,
  `file_name` varchar(1024) DEFAULT NULL COMMENT '文件名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_commend`
--

LOCK TABLES `tb_commend` WRITE;
/*!40000 ALTER TABLE `tb_commend` DISABLE KEYS */;
INSERT INTO `tb_commend` VALUES (1,'市级','优秀教师奖',1,'第十一届优秀教师评比','2018-05-21','upload/commend/,','优秀教师荣誉证书.pdf、'),(63,'省级','优秀教师',3,'河南省第十届优秀教师评选','2018-06-15','upload/commendFiles/9a06078a-a6c5-400e-8d48-ed0ae8b0efc5幼儿园电教资料管理系统 .txt,upload/commendFiles/db22c2dc-ccb9-4a6f-b962-ece8be692314工作计划.txt,','幼儿园电教资料管理系统 .txt、工作计划.txt、'),(84,'园级','test19(update)',2,'test19(update)','2018-06-25','upload/commendFiles/2e065fb8-8406-4080-ba9c-adbd3fad9b5a工作计划.txt,upload/commendFiles/1722ccf2-2edd-4249-b054-0b5b9b0484e4平台服务端配置说明.xlsx,','工作计划.txt、平台服务端配置说明.xlsx、'),(85,'园级','test19',3,'test19','2018-06-25','upload/commendFiles/2e065fb8-8406-4080-ba9c-adbd3fad9b5a工作计划.txt,','工作计划.txt、'),(86,'园级','test19',7,'test19','2018-06-25','upload/commendFiles/2e065fb8-8406-4080-ba9c-adbd3fad9b5a工作计划.txt,','工作计划.txt、'),(87,'园级','test19',26,'test19','2018-06-25','upload/commendFiles/2e065fb8-8406-4080-ba9c-adbd3fad9b5a工作计划.txt,','工作计划.txt、'),(88,'园级','test19',27,'test19','2018-06-25','upload/commendFiles/2e065fb8-8406-4080-ba9c-adbd3fad9b5a工作计划.txt,','工作计划.txt、'),(89,'园级','test20',2,'test20','2018-06-25','upload/commendFiles/162dab1a-4d2e-4071-85fe-4f9f55bd16e2index.html,','index.html、'),(90,'园级','test20',3,'test20','2018-06-25','upload/commendFiles/162dab1a-4d2e-4071-85fe-4f9f55bd16e2index.html,','index.html、'),(91,'园级','test20',7,'test20','2018-06-25','upload/commendFiles/162dab1a-4d2e-4071-85fe-4f9f55bd16e2index.html,','index.html、'),(93,'园级','test20',27,'test20','2018-06-25','upload/commendFiles/162dab1a-4d2e-4071-85fe-4f9f55bd16e2index.html,','index.html、'),(98,'园级','test20',27,'test20','2014-06-25','',''),(99,'园级','test21',16,'test21','2018-06-25','upload/commendFiles/590fbcf9-8872-43c9-8df7-19301e295996平台服务端配置说明.xlsx,','平台服务端配置说明.xlsx、'),(100,'园级','test21',1,'test21','2018-06-25','upload/commendFiles/590fbcf9-8872-43c9-8df7-19301e295996平台服务端配置说明.xlsx,','平台服务端配置说明.xlsx、'),(101,'园级','test21',17,'test21','2018-06-25','upload/commendFiles/590fbcf9-8872-43c9-8df7-19301e295996平台服务端配置说明.xlsx,','平台服务端配置说明.xlsx、'),(102,'园级','test21',18,'test21','2018-06-25','upload/commendFiles/590fbcf9-8872-43c9-8df7-19301e295996平台服务端配置说明.xlsx,','平台服务端配置说明.xlsx、'),(103,'园级','test21',19,'test21','2018-06-25','upload/commendFiles/590fbcf9-8872-43c9-8df7-19301e295996平台服务端配置说明.xlsx,','平台服务端配置说明.xlsx、'),(104,'园级','test21',4,'test21','2018-06-25','upload/commendFiles/590fbcf9-8872-43c9-8df7-19301e295996平台服务端配置说明.xlsx,','平台服务端配置说明.xlsx、'),(105,'园级','test21',20,'test21','2018-06-25','upload/commendFiles/590fbcf9-8872-43c9-8df7-19301e295996平台服务端配置说明.xlsx,','平台服务端配置说明.xlsx、'),(106,'园级','test21',21,'test21','2018-06-25','upload/commendFiles/590fbcf9-8872-43c9-8df7-19301e295996平台服务端配置说明.xlsx,','平台服务端配置说明.xlsx、');
/*!40000 ALTER TABLE `tb_commend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_db_save`
--

DROP TABLE IF EXISTS `tb_db_save`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_db_save` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '数据库备份记录',
  `save_time` datetime DEFAULT NULL,
  `emp_name` varchar(255) NOT NULL COMMENT '操作人',
  `filename` varchar(255) DEFAULT NULL COMMENT '文件名',
  `filepath` varchar(255) DEFAULT NULL COMMENT '保存路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_db_save`
--

LOCK TABLES `tb_db_save` WRITE;
/*!40000 ALTER TABLE `tb_db_save` DISABLE KEYS */;
INSERT INTO `tb_db_save` VALUES (1,'2018-06-29 15:52:08','张亮','20180629155208074.sql','C:\\Users\\mm\\数据库备份\\20180629155208074.sql'),(2,'2018-06-29 15:52:13','张亮','20180629155212821.sql','C:\\Users\\mm\\数据库备份\\20180629155212821.sql'),(3,'2018-06-29 15:52:15','张亮','20180629155214307.sql','C:\\Users\\mm\\数据库备份\\20180629155214307.sql'),(4,'2018-06-29 17:45:48','张亮','20180629174547451.sql','C:\\Users\\mm\\数据库备份\\20180629174547451.sql'),(5,'2018-06-29 17:45:52','张亮','20180629174552159.sql','C:\\Users\\mm\\数据库备份\\20180629174552159.sql'),(6,'2018-06-29 17:46:17','张亮','20180629174617011.sql','C:\\Users\\mm\\数据库备份\\20180629174617011.sql'),(7,'2018-06-29 17:48:44','张亮','20180629174843626.sql','C:\\Users\\mm\\数据库备份\\20180629174843626.sql'),(8,'2018-06-29 17:50:42','张亮','20180629175041771.sql','C:\\Users\\mm\\数据库备份\\20180629175041771.sql');
/*!40000 ALTER TABLE `tb_db_save` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_dept`
--

DROP TABLE IF EXISTS `tb_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(20) DEFAULT NULL COMMENT '部门名称',
  `note` varchar(56) DEFAULT '暂无描述' COMMENT '描述',
  `order_num` int(11) DEFAULT NULL COMMENT '排序字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_dept`
--

LOCK TABLES `tb_dept` WRITE;
/*!40000 ALTER TABLE `tb_dept` DISABLE KEYS */;
INSERT INTO `tb_dept` VALUES (1,'园领导','暂无描述',1),(2,'办公室','暂无描述',2),(3,'保教处','暂无描述',3),(4,'航海路分园','暂无描述',5),(5,'中心幼儿园','暂无描述',4),(9,'人事部门','人事部门',6);
/*!40000 ALTER TABLE `tb_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_education_background`
--

DROP TABLE IF EXISTS `tb_education_background`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_education_background` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '教育背景',
  `school` varchar(20) DEFAULT NULL COMMENT '毕业院校',
  `major` varchar(20) DEFAULT NULL COMMENT '专业',
  `entry_date` date DEFAULT NULL COMMENT '入学时间',
  `graduation_date` date DEFAULT NULL COMMENT '毕业时间',
  `emp_id` int(11) DEFAULT NULL COMMENT '员工编号',
  `remark` varchar(128) DEFAULT NULL COMMENT '备注',
  `order_num` int(11) DEFAULT '0' COMMENT '排序字段',
  `edu_level` int(10) DEFAULT NULL COMMENT '0/初中 1/高中 2/中专 3/大专 4/本科 5/硕士 6/博士',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_education_background`
--

LOCK TABLES `tb_education_background` WRITE;
/*!40000 ALTER TABLE `tb_education_background` DISABLE KEYS */;
INSERT INTO `tb_education_background` VALUES (1,'河南工业大学','软件工程','2013-09-01','2017-06-01',1,'表现良好',0,5),(2,'清华大学','软件工程','2016-09-01','2018-03-01',1,'表现良好',1,6),(18,'上海交通大学','金融管理','2018-06-08','2018-06-08',2,'aaaaaa',0,5),(40,'北京大学','幼儿教育','2018-06-11','2018-06-11',16,'优秀',0,4),(41,'清华大学','外语','2018-06-11','2018-06-11',3,'优秀',0,5);
/*!40000 ALTER TABLE `tb_education_background` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_employee`
--

DROP TABLE IF EXISTS `tb_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL COMMENT '姓名',
  `emp_no` varchar(255) DEFAULT NULL COMMENT '员工编号',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机号',
  `password` varchar(56) DEFAULT 'null' COMMENT '密码',
  `sex` char(5) DEFAULT NULL COMMENT '男',
  `brithday` date DEFAULT NULL COMMENT '生日',
  `persion_id` varchar(19) DEFAULT NULL COMMENT '身份证号',
  `navite_place` varchar(56) DEFAULT NULL COMMENT '籍贯',
  `edu_background` varchar(255) DEFAULT ' ' COMMENT '学历',
  `status` int(11) DEFAULT '1' COMMENT '工作状态  0/离职  1/在职  2/退休  3/返聘/',
  `nature` int(11) DEFAULT '0' COMMENT '工作性质  0在编/ 1人事代理/ 2非人事代理/ 3退休返聘',
  `entry_day` date DEFAULT NULL COMMENT '入职日期',
  `post_id` int(11) DEFAULT NULL COMMENT '岗位ID 对岗位表是多对一关系',
  `kindergarten_id` int(11) DEFAULT NULL COMMENT '幼儿园ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_employee`
--

LOCK TABLES `tb_employee` WRITE;
/*!40000 ALTER TABLE `tb_employee` DISABLE KEYS */;
INSERT INTO `tb_employee` VALUES (1,'张亮','001000','18336349795','E10ADC3949BA59ABBE56E057F20F883E','男','1993-05-14','1','中国河南','本科',1,1,'2018-05-10',1,0),(2,'孙怡','001001','18348933989','null','女','1996-01-01','1','中国河南','本科',1,0,'2018-05-10',7,NULL),(3,'郭瑶瑶','001002','18461547874','null','女','1996-01-01','412728199503103667','中国河南','博士',1,0,'2018-05-09',7,NULL),(4,'李逍遥','005413','12184318746','null','男','1993-05-14','1','中国河南','本科',1,0,'2018-05-10',1,NULL),(5,'张大雷','009413',NULL,'null',NULL,NULL,' ',' ',' ',1,0,NULL,NULL,NULL),(6,'孙小红','009413',NULL,'null',NULL,'2018-06-05',' ',' ',' ',1,0,NULL,NULL,NULL),(7,'赵灵儿','009413','18136613781','null','女','2018-06-20',' 415612','中国河南',' 本科',1,0,'2018-06-20',7,NULL),(8,'郭靖','009413',NULL,'null',NULL,NULL,' ',' ',' ',1,0,NULL,NULL,NULL),(9,'韩梅梅','009413',NULL,'null',NULL,NULL,' ',' ',' ',1,0,NULL,NULL,NULL),(10,'李大壮','009413',NULL,'null',NULL,NULL,' ',' ',' ',1,0,NULL,NULL,NULL),(11,'祖龙','009413',NULL,'null',NULL,NULL,' ',' ',' ',1,0,NULL,NULL,NULL),(12,'发过的','007814','4198','null','男',NULL,'41258','人',' ',1,0,'2018-06-01',1,NULL),(16,'郭＆吕','001011','18134414278','null','男','2018-06-01','412728199503105874','河南','本科',1,0,'2018-06-01',1,NULL),(17,'郭＆&吕','001012','18134414278','null','男','2018-06-01','412728199503105874','河南',' ',1,0,'2018-06-01',1,NULL),(18,'郭＆&&吕','001013','18134414278','null','男','2018-06-01','412728199503105874','河南',' ',1,0,'2018-06-01',1,NULL),(19,'郭＆&&&&吕','001014','18336349795','null','男','2018-06-02','412728199503105874','河南',' ',1,0,'2018-06-01',1,NULL),(20,'吕&郭','001015','18336349795','null','男','2018-06-01','412728199503105874','打算',' ',1,0,'2018-06-01',1,NULL),(21,'吕&&郭','001016','18336349795','null','男','2018-06-01','412728199503105874','河南',' ',1,0,'2018-06-01',1,NULL),(26,'郭玉','001021','13834946721','null','女',NULL,NULL,'河南郑州','本科',1,1,'2018-06-05',6,NULL),(27,'上官若雪','001022','13834946721','null','女',NULL,NULL,'河南郑州','本科',1,0,'2018-06-05',6,NULL),(28,'郭玉','001023','13834946721','null','女',NULL,NULL,'河南郑州','本科',1,0,'2018-06-05',6,NULL),(29,'郭玉','001024','13834946721','null','女',NULL,NULL,'河南郑州','本科',1,0,'2018-06-05',6,NULL),(30,'上官若雪','001025','13834946721','null','女',NULL,NULL,'河南郑州','本科',1,0,'2018-06-05',6,NULL),(31,'上官若雪','001026','13834946721','null','女',NULL,NULL,'河南郑州','本科',1,0,'2018-06-05',6,NULL),(32,'郭玉','001027','13834946721','null','女',NULL,NULL,'河南郑州','本科',1,0,'2018-06-05',6,NULL),(33,'上官若雪','001028','13834946721','null','女',NULL,NULL,'河南郑州','本科',1,0,'2018-06-05',6,NULL),(34,'郭玉','001029','13834946721','null','女',NULL,NULL,'河南郑州','本科',1,0,'2018-06-05',6,NULL),(35,'上官若雪','001030','13834946721','null','女',NULL,NULL,'河南郑州','本科',1,0,'2018-06-05',6,NULL),(36,'郭玉','001031','13834946721','null','女',NULL,NULL,'河南郑州','本科',1,0,'2018-06-05',6,NULL),(37,'上官若雪','001032','13834946721','null','女',NULL,NULL,'河南郑州','本科',1,0,'2018-06-05',6,NULL),(38,'郭玉','001033','13834946721','null','女',NULL,NULL,'河南郑州','本科',1,0,'2018-06-05',6,NULL),(39,'上官若雪','001034','13834946721','null','女',NULL,NULL,'河南郑州','本科',1,0,'2018-06-05',6,NULL),(40,'郭玉','001035','13834946721','null','女',NULL,NULL,'河南郑州','本科',1,0,'2018-06-05',6,NULL),(41,'上官若雪','001036','13834946721','null','女',NULL,NULL,'河南郑州','本科',1,0,'2018-06-05',6,NULL),(42,'郭玉','001037','13834946721','null','女',NULL,NULL,'河南郑州','本科',1,0,'2018-06-05',6,NULL),(43,'上官若雪','001038','13834946721','null','女',NULL,NULL,'河南郑州','本科',1,0,'2018-06-05',6,NULL),(44,'郭玉','001039','13834946721','null','女',NULL,NULL,'河南郑州','本科',1,0,'2018-06-05',6,NULL),(45,'上官若雪','001040','13834946721','null','女',NULL,NULL,'河南郑州','本科',1,0,'2018-06-05',6,NULL),(46,'郭玉','001041','13834946721','null','女',NULL,NULL,'河南郑州','本科',1,0,'2018-06-05',6,NULL),(47,'上官若雪','001042','13834946721','null','女',NULL,NULL,'河南郑州','本科',1,0,'2018-06-05',6,NULL),(48,'郭玉','001043','13834946721','null','女',NULL,NULL,'河南郑州','本科',1,0,'2018-06-05',6,NULL),(49,'上官若雪','001044','13834946721','null','女',NULL,NULL,'河南郑州','本科',1,0,'2018-06-05',6,NULL),(50,'郭玉','001045','13834946721','null','女',NULL,NULL,'河南郑州','本科',1,0,'2018-06-05',6,NULL),(51,'上官若雪','001046','13834946721','null','女',NULL,NULL,'河南郑州','本科',1,0,'2018-06-05',6,NULL);
/*!40000 ALTER TABLE `tb_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_examine`
--

DROP TABLE IF EXISTS `tb_examine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_examine` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '员工考核表ID',
  `emp_id` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL COMMENT '考核年份',
  `result` int(255) DEFAULT NULL COMMENT '考核结果  0优秀/1合格/2基本合格/3不合格',
  PRIMARY KEY (`id`),
  KEY `id` (`id`,`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_examine`
--

LOCK TABLES `tb_examine` WRITE;
/*!40000 ALTER TABLE `tb_examine` DISABLE KEYS */;
INSERT INTO `tb_examine` VALUES (1,1,2018,0),(2,2,2018,1),(3,1,2017,3),(4,2,2017,1),(5,1,2016,1),(6,2,2016,0),(7,3,2016,1),(8,3,2017,0),(9,3,2018,0),(10,7,2016,0),(11,7,2017,2),(12,7,2018,1);
/*!40000 ALTER TABLE `tb_examine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_kindergarten`
--

DROP TABLE IF EXISTS `tb_kindergarten`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_kindergarten` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '幼儿园',
  `kinder_name` varchar(20) DEFAULT NULL COMMENT '幼儿园名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_kindergarten`
--

LOCK TABLES `tb_kindergarten` WRITE;
/*!40000 ALTER TABLE `tb_kindergarten` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_kindergarten` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_position`
--

DROP TABLE IF EXISTS `tb_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position_name` varchar(20) DEFAULT NULL COMMENT '职称名',
  `category_id` int(11) DEFAULT NULL COMMENT '职称级别表ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_position`
--

LOCK TABLES `tb_position` WRITE;
/*!40000 ALTER TABLE `tb_position` DISABLE KEYS */;
INSERT INTO `tb_position` VALUES (1,'高级教师',1),(2,'中级教师',1),(3,'特级教师',1),(4,'护理专家',4);
/*!40000 ALTER TABLE `tb_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_position_emp`
--

DROP TABLE IF EXISTS `tb_position_emp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_position_emp` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '员工职称中间表',
  `position_id` int(11) DEFAULT NULL COMMENT '职称ID',
  `emp_id` int(11) DEFAULT NULL COMMENT '员工ID',
  `get_time` date DEFAULT NULL COMMENT '获取时间',
  `url` varchar(10024) DEFAULT NULL COMMENT '文件保存路径',
  `file_name` varchar(1024) DEFAULT NULL COMMENT '职称文件名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_position_emp`
--

LOCK TABLES `tb_position_emp` WRITE;
/*!40000 ALTER TABLE `tb_position_emp` DISABLE KEYS */;
INSERT INTO `tb_position_emp` VALUES (1,2,1,'2015-05-17','sss','sss'),(86,2,2,'2018-06-12','upload/equipViews/5bd9fef7-0cda-4ff4-b16a-4a291d8c14f4QQ截图20180521180431.png,upload/equipViews/2b388cda-9bee-4e1e-9632-dc620b390801工作计划.txt,','QQ截图20180521180431.png、工作计划.txt、'),(133,2,3,'2018-06-14','upload/positionFiles/d37e27d4-214a-404d-a23f-aefc3b86fb40工作计划.txt,upload/positionFiles/acb365e4-569c-4cff-af27-00ac589a98ef幼儿园电教资料管理系统 .txt,','工作计划.txt、幼儿园电教资料管理系统 .txt、');
/*!40000 ALTER TABLE `tb_position_emp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_post`
--

DROP TABLE IF EXISTS `tb_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '岗位表ID',
  `post_name` varchar(20) DEFAULT NULL COMMENT '岗位名',
  `note` varchar(256) DEFAULT '' COMMENT '描述',
  `order_num` int(11) NOT NULL DEFAULT '0' COMMENT '排序字段',
  `dept_id` int(11) DEFAULT NULL COMMENT '该岗位所属部门',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_post`
--

LOCK TABLES `tb_post` WRITE;
/*!40000 ALTER TABLE `tb_post` DISABLE KEYS */;
INSERT INTO `tb_post` VALUES (1,'园长','幼儿园决策者',1,1),(2,'党委书记',NULL,2,1),(3,'支部书记',NULL,3,1),(4,'主任',NULL,4,1),(5,'班主任','班主任老师',5,3),(6,'生活老师','生活老师',6,3),(7,'配班老师',NULL,7,3),(9,'','',8,1);
/*!40000 ALTER TABLE `tb_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `sex` char(5) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `balance` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'郭潇','女',20,1300),(2,'杨佻','女',20,2000);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-02 10:36:59
