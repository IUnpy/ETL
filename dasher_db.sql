-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: datax_web
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `job_group`
--

DROP TABLE IF EXISTS `job_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `job_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '执行器AppName',
  `title` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '执行器名称',
  `order` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `address_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '执行器地址类型：0=自动注册、1=手动录入',
  `address_list` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '执行器地址列表，多地址逗号分隔',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_group`
--

LOCK TABLES `job_group` WRITE;
/*!40000 ALTER TABLE `job_group` DISABLE KEYS */;
INSERT INTO `job_group` VALUES (1,'datax-executor','datax执行器',1,0,'192.168.137.1:9999'),(3,'dasher-executor','执行器2',2,1,'http://127.0.0.1:8082');
/*!40000 ALTER TABLE `job_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_info`
--

DROP TABLE IF EXISTS `job_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `job_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_group` int(11) NOT NULL COMMENT '执行器主键ID',
  `job_cron` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务执行CRON',
  `job_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `project_id` int(11) DEFAULT NULL COMMENT '所属项目id',
  `add_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `user_id` int(11) NOT NULL COMMENT '修改用户',
  `alarm_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '报警邮件',
  `executor_route_strategy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '执行器路由策略',
  `executor_handler` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '执行器任务handler',
  `executor_param` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '执行器任务参数',
  `executor_block_strategy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '阻塞处理策略',
  `executor_timeout` int(11) NOT NULL DEFAULT '0' COMMENT '任务执行超时时间，单位分钟',
  `executor_fail_retry_count` int(11) NOT NULL DEFAULT '0' COMMENT '失败重试次数',
  `glue_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'GLUE类型',
  `glue_source` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT 'GLUE源代码',
  `glue_remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'GLUE备注',
  `glue_updatetime` datetime DEFAULT NULL COMMENT 'GLUE更新时间',
  `child_jobid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '子任务ID，多个逗号分隔',
  `trigger_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态：0-停止，1-运行',
  `trigger_last_time` bigint(13) NOT NULL DEFAULT '0' COMMENT '上次调度时间',
  `trigger_next_time` bigint(13) NOT NULL DEFAULT '0' COMMENT '下次调度时间',
  `job_json` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT 'datax运行脚本',
  `replace_param` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '动态参数',
  `jvm_param` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'jvm参数',
  `inc_start_time` datetime DEFAULT NULL COMMENT '增量初始时间',
  `partition_info` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '分区信息',
  `last_handle_code` int(11) DEFAULT '0' COMMENT '最近一次执行状态',
  `replace_param_type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '增量时间格式',
  `reader_table` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'reader表名称',
  `primary_key` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '增量表主键',
  `inc_start_id` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '增量初始id',
  `increment_type` tinyint(4) DEFAULT '0' COMMENT '增量类型',
  `datasource_id` bigint(11) DEFAULT NULL COMMENT '数据源id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_info`
--

LOCK TABLES `job_info` WRITE;
/*!40000 ALTER TABLE `job_info` DISABLE KEYS */;
INSERT INTO `job_info` VALUES (7,1,'* * 22 ? 1-2 * *','任务构建测试',1,'2021-05-13 20:05:40','2021-05-13 20:06:24',1,'','RANDOM','executorJobHandler','','DISCARD_LATER',0,0,'BEAN',NULL,NULL,'2021-05-13 20:06:24','',0,0,0,'{\n  \"job\": {\n    \"content\": [\n      {\n        \"reader\": {\n          \"name\": \"streamreader\",\n          \"parameter\": {\n            \"sliceRecordCount\": 10,\n            \"column\": [\n              {\n                \"type\": \"long\",\n                \"value\": \"10\"\n              },\n              {\n                \"type\": \"string\",\n                \"value\": \"hello，你好，世界-DataX\"\n              }\n            ]\n          }\n        },\n        \"writer\": {\n          \"name\": \"streamwriter\",\n          \"parameter\": {\n            \"encoding\": \"UTF-8\",\n            \"print\": true\n          }\n        }\n      }\n    ],\n    \"setting\": {\n      \"speed\": {\n        \"channel\": 5\n      }\n    }\n  }\n}','','',NULL,'',0,'Timestamp','','',NULL,0,0),(9,1,'* * 22 ? 1-2 * *','dbo.Student',1,'2021-05-16 20:22:35','2021-05-16 20:22:35',1,'','RANDOM','executorJobHandler','','DISCARD_LATER',0,0,'BEAN',NULL,NULL,'2021-05-16 20:22:35','',0,0,0,'{\n  \"job\": {\n    \"setting\": {\n      \"speed\": {\n        \"channel\": 3,\n        \"byte\": 1048576\n      },\n      \"errorLimit\": {\n        \"record\": 0,\n        \"percentage\": 0.02\n      }\n    },\n    \"content\": [\n      {\n        \"reader\": {\n          \"name\": \"sqlserverreader\",\n          \"parameter\": {\n            \"username\": \"/waFujDmQ7jhe03mTlPo9w==\",\n            \"password\": \"/waFujDmQ7jhe03mTlPo9w==\",\n            \"column\": [\n              \"[Sno]\",\n              \"[Ssex]\",\n              \"[Sage]\",\n              \"[Sdept]\",\n              \"[Sname]\"\n            ],\n            \"splitPk\": \"\",\n            \"connection\": [\n              {\n                \"table\": [\n                  \"dbo.Student\"\n                ],\n                \"jdbcUrl\": [\n                  \"jdbc:sqlserver://localhost:1433;DatabaseName=testDB\"\n                ]\n              }\n            ]\n          }\n        },\n        \"writer\": {\n          \"name\": \"mysqlwriter\",\n          \"parameter\": {\n            \"username\": \"yRjwDFuoPKlqya9h9H2Amg==\",\n            \"password\": \"fMaKElymbiVDjjwluBXyhA==\",\n            \"column\": [\n              \"`name`\",\n              \"`sex`\",\n              \"`age`\",\n              \"`major`\",\n              \"`id`\"\n            ],\n            \"connection\": [\n              {\n                \"table\": [\n                  \"mysql_student\"\n                ],\n                \"jdbcUrl\": \"jdbc:mysql://127.0.0.1:3306/mysql_testdb?serverTimezone=UTC\"\n              }\n            ]\n          }\n        }\n      }\n    ]\n  }\n}',NULL,'',NULL,NULL,0,'Timestamp',NULL,NULL,NULL,0,0),(10,1,'00 00 00 L * ? 2022-2022','计算机学院软件工程专业学生数据同步',1,'2021-05-17 00:59:28','2021-06-02 10:51:36',1,'','RANDOM','executorJobHandler','','DISCARD_LATER',0,0,'BEAN',NULL,NULL,'2021-06-02 10:51:36','',0,0,0,'{\n  \"job\": {\n    \"setting\": {\n      \"speed\": {\n        \"channel\": 3,\n        \"byte\": 1048576\n      },\n      \"errorLimit\": {\n        \"record\": 0,\n        \"percentage\": 0.02\n      }\n    },\n    \"content\": [\n      {\n        \"reader\": {\n          \"name\": \"sqlserverreader\",\n          \"parameter\": {\n            \"username\": \"/waFujDmQ7jhe03mTlPo9w==\",\n            \"password\": \"/waFujDmQ7jhe03mTlPo9w==\",\n            \"column\": [\n              \"[number]\",\n              \"[name]\",\n              \"[gender]\",\n              \"[birth]\",\n              \"[native_place]\",\n              \"[politics_status]\",\n              \"[phone]\",\n              \"[major]\"\n            ],\n            \"where\": \"major = \'软件工程\';\",\n            \"splitPk\": \"\",\n            \"connection\": [\n              {\n                \"table\": [\n                  \"dbo.student_computer\"\n                ],\n                \"jdbcUrl\": [\n                  \"jdbc:sqlserver://localhost:1433;DatabaseName=testDB\"\n                ]\n              }\n            ]\n          }\n        },\n        \"writer\": {\n          \"name\": \"mysqlwriter\",\n          \"parameter\": {\n            \"username\": \"yRjwDFuoPKlqya9h9H2Amg==\",\n            \"password\": \"fMaKElymbiVDjjwluBXyhA==\",\n            \"column\": [\n              \"`sid`\",\n              \"`sname`\",\n              \"`gender`\",\n              \"`birth`\",\n              \"`native_place`\",\n              \"`politics_status`\",\n              \"`phone`\",\n              \"`major`\"\n            ],\n            \"postSql\": [\n              \"alter table student_se drop column major\"\n            ],\n            \"connection\": [\n              {\n                \"table\": [\n                  \"student_se\"\n                ],\n                \"jdbcUrl\": \"jdbc:mysql://127.0.0.1:3306/mysql_testdb?serverTimezone=UTC\"\n              }\n            ]\n          }\n        }\n      }\n    ]\n  }\n}','','',NULL,'',200,'Timestamp','','',NULL,0,0),(12,1,'00 00 00 L * ? 2023-2025','test',1,'2021-05-17 15:56:08','2021-05-17 16:51:41',1,'','RANDOM','executorJobHandler','','DISCARD_LATER',0,0,'BEAN',NULL,NULL,'2021-05-17 16:51:41','',0,0,0,'{\n  \"job\": {\n    \"setting\": {\n      \"speed\": {\n        \"channel\": 3,\n        \"byte\": 1048576\n      },\n      \"errorLimit\": {\n        \"record\": 0,\n        \"percentage\": 0.02\n      }\n    },\n    \"content\": [\n      {\n        \"reader\": {\n          \"name\": \"mysqlreader\",\n          \"parameter\": {\n            \"username\": \"yRjwDFuoPKlqya9h9H2Amg==\",\n            \"password\": \"fMaKElymbiVDjjwluBXyhA==\",\n            \"column\": [\n              \"`sid`\",\n              \"`sname`\",\n              \"`gender`\",\n              \"`birth`\",\n              \"`native_place`\",\n              \"`politics_status`\",\n              \"`phone`\",\n              \"`major`\"\n            ],\n            \"where\": \"native_place = \'北京\'\",\n            \"splitPk\": \"\",\n            \"connection\": [\n              {\n                \"table\": [\n                  \"se_test\"\n                ],\n                \"jdbcUrl\": [\n                  \"jdbc:mysql://127.0.0.1:3306/mysql_testdb?userSSL=false&serverTimezone=UTC\"\n                ]\n              }\n            ]\n          }\n        },\n        \"writer\": {\n          \"name\": \"mysqlwriter\",\n          \"parameter\": {\n            \"username\": \"yRjwDFuoPKlqya9h9H2Amg==\",\n            \"password\": \"fMaKElymbiVDjjwluBXyhA==\",\n            \"column\": [\n              \"`sid`\",\n              \"`sname`\",\n              \"`gender`\",\n              \"`birth`\",\n              \"`native_place`\",\n              \"`politics_status`\",\n              \"`phone`\",\n              \"`major`\"\n            ],\n            \"connection\": [\n              {\n                \"table\": [\n                  \"se_test2\"\n                ],\n                \"jdbcUrl\": \"jdbc:mysql://127.0.0.1:3306/mysql_testdb?userSSL=false&serverTimezone=UTC\"\n              }\n            ]\n          }\n        }\n      }\n    ]\n  }\n}','','',NULL,'',200,'Timestamp','','',NULL,0,0);
/*!40000 ALTER TABLE `job_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_jdbc_datasource`
--

DROP TABLE IF EXISTS `job_jdbc_datasource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `job_jdbc_datasource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `datasource_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据源名称',
  `datasource` varchar(45) COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据源',
  `datasource_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'Default' COMMENT '数据源分组',
  `database_name` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '数据库名',
  `jdbc_username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '用户名',
  `jdbc_password` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '密码',
  `jdbc_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'jdbc url',
  `jdbc_driver_class` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'jdbc驱动类',
  `zk_adress` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态：0删除 1启用 2禁用',
  `create_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `comments` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='jdbc数据源配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_jdbc_datasource`
--

LOCK TABLES `job_jdbc_datasource` WRITE;
/*!40000 ALTER TABLE `job_jdbc_datasource` DISABLE KEYS */;
INSERT INTO `job_jdbc_datasource` VALUES (6,'Test_MySql','mysql','Default',NULL,'yRjwDFuoPKlqya9h9H2Amg==','fMaKElymbiVDjjwluBXyhA==','jdbc:mysql://127.0.0.1:3306/mysql_testdb?serverTimezone=UTC','com.mysql.cj.jdbc.Driver',NULL,1,'admin','2021-04-26 14:51:22','admin','2021-05-17 15:58:41','MySql数据源测试'),(7,'Test_SqlServer','sqlserver','Default',NULL,'/waFujDmQ7jhe03mTlPo9w==','/waFujDmQ7jhe03mTlPo9w==','jdbc:sqlserver://localhost:1433;DatabaseName=testDB','com.microsoft.sqlserver.jdbc.SQLServerDriver',NULL,1,'admin','2021-05-16 19:47:54',NULL,NULL,'');
/*!40000 ALTER TABLE `job_jdbc_datasource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_lock`
--

DROP TABLE IF EXISTS `job_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `job_lock` (
  `lock_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '锁名称',
  PRIMARY KEY (`lock_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_lock`
--

LOCK TABLES `job_lock` WRITE;
/*!40000 ALTER TABLE `job_lock` DISABLE KEYS */;
INSERT INTO `job_lock` VALUES ('schedule_lock');
/*!40000 ALTER TABLE `job_lock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_log`
--

DROP TABLE IF EXISTS `job_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `job_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `job_group` int(11) NOT NULL COMMENT '执行器主键ID',
  `job_id` int(11) NOT NULL COMMENT '任务，主键ID',
  `job_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `executor_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '执行器地址，本次执行的地址',
  `executor_handler` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '执行器任务handler',
  `executor_param` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '执行器任务参数',
  `executor_sharding_param` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '执行器任务分片参数，格式如 1/2',
  `executor_fail_retry_count` int(11) DEFAULT '0' COMMENT '失败重试次数',
  `trigger_time` datetime DEFAULT NULL COMMENT '调度-时间',
  `trigger_code` int(11) NOT NULL COMMENT '调度-结果',
  `trigger_msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '调度-日志',
  `handle_time` datetime DEFAULT NULL COMMENT '执行-时间',
  `handle_code` int(11) NOT NULL COMMENT '执行-状态',
  `handle_msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '执行-日志',
  `alarm_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '告警状态：0-默认、1-无需告警、2-告警成功、3-告警失败',
  `process_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'datax进程Id',
  `max_id` bigint(20) DEFAULT NULL COMMENT '增量表max id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `I_trigger_time` (`trigger_time`) USING BTREE,
  KEY `I_handle_code` (`handle_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_log`
--

LOCK TABLES `job_log` WRITE;
/*!40000 ALTER TABLE `job_log` DISABLE KEYS */;
INSERT INTO `job_log` VALUES (1,1,10,'计算机学院软件工程专业学生数据同步','172.29.208.1:9999','executorJobHandler','',NULL,0,'2021-05-17 01:07:14',200,'任务触发类型：Cron触发<br>调度机器：172.29.208.1<br>执行器-注册方式：自动注册<br>执行器-地址列表：[172.29.208.1:9999]<br>路由策略：随机<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：172.29.208.1:9999<br>code：200<br>msg：null','2021-05-17 01:07:19',500,'command exit value(1) is failed',1,'1920',NULL),(2,1,10,'计算机学院软件工程专业学生数据同步','172.29.208.1:9999','executorJobHandler','',NULL,0,'2021-05-17 01:07:15',200,'任务触发类型：Cron触发<br>调度机器：172.29.208.1<br>执行器-注册方式：自动注册<br>执行器-地址列表：[172.29.208.1:9999]<br>路由策略：随机<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：172.29.208.1:9999<br>code：200<br>msg：null','2021-05-17 01:07:17',500,'null [job running, killed]',1,'7140',NULL),(3,1,10,'计算机学院软件工程专业学生数据同步','172.29.208.1:9999','executorJobHandler','',NULL,0,'2021-05-17 01:07:16',200,'任务触发类型：Cron触发<br>调度机器：172.29.208.1<br>执行器-注册方式：自动注册<br>执行器-地址列表：[172.29.208.1:9999]<br>路由策略：随机<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：172.29.208.1:9999<br>code：200<br>msg：null','2021-05-17 01:07:17',500,'null [job running, killed]',1,'22732',NULL),(4,1,10,'计算机学院软件工程专业学生数据同步','172.29.208.1:9999','executorJobHandler','',NULL,0,'2021-05-17 01:07:17',500,'任务触发类型：Cron触发<br>调度机器：172.29.208.1<br>执行器-注册方式：自动注册<br>执行器-地址列表：[172.29.208.1:9999]<br>路由策略：随机<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：172.29.208.1:9999<br>code：500<br>msg：block strategy effect：Discard Later',NULL,0,NULL,1,NULL,NULL),(5,1,10,'计算机学院软件工程专业学生数据同步','172.29.208.1:9999','executorJobHandler','',NULL,0,'2021-05-17 01:07:18',500,'任务触发类型：Cron触发<br>调度机器：172.29.208.1<br>执行器-注册方式：自动注册<br>执行器-地址列表：[172.29.208.1:9999]<br>路由策略：随机<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：172.29.208.1:9999<br>code：500<br>msg：block strategy effect：Discard Later',NULL,0,NULL,1,NULL,NULL),(6,1,10,'计算机学院软件工程专业学生数据同步','172.29.208.1:9999','executorJobHandler','',NULL,0,'2021-05-17 01:07:19',200,'任务触发类型：Cron触发<br>调度机器：172.29.208.1<br>执行器-注册方式：自动注册<br>执行器-地址列表：[172.29.208.1:9999]<br>路由策略：随机<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：172.29.208.1:9999<br>code：200<br>msg：null','2021-05-17 01:07:19',500,'command exit value(1) is failed',1,'16936',NULL),(7,1,10,'计算机学院软件工程专业学生数据同步','172.29.208.1:9999','executorJobHandler','',NULL,0,'2021-05-17 01:07:20',200,'任务触发类型：Cron触发<br>调度机器：172.29.208.1<br>执行器-注册方式：自动注册<br>执行器-地址列表：[172.29.208.1:9999]<br>路由策略：随机<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：172.29.208.1:9999<br>code：200<br>msg：null','2021-05-17 01:07:20',500,'command exit value(1) is failed',1,'260',NULL),(8,1,10,'计算机学院软件工程专业学生数据同步','172.29.208.1:9999','executorJobHandler','',NULL,0,'2021-05-17 01:07:21',200,'任务触发类型：Cron触发<br>调度机器：172.29.208.1<br>执行器-注册方式：自动注册<br>执行器-地址列表：[172.29.208.1:9999]<br>路由策略：随机<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：172.29.208.1:9999<br>code：200<br>msg：null','2021-05-17 01:07:21',500,'command exit value(1) is failed',1,'17884',NULL),(9,1,10,'计算机学院软件工程专业学生数据同步','172.29.208.1:9999','executorJobHandler','',NULL,0,'2021-05-17 01:07:22',200,'任务触发类型：Cron触发<br>调度机器：172.29.208.1<br>执行器-注册方式：自动注册<br>执行器-地址列表：[172.29.208.1:9999]<br>路由策略：随机<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：172.29.208.1:9999<br>code：200<br>msg：null','2021-05-17 01:07:22',500,'command exit value(1) is failed',1,'17476',NULL),(10,1,10,'计算机学院软件工程专业学生数据同步','172.29.208.1:9999','executorJobHandler','',NULL,0,'2021-05-17 01:07:23',200,'任务触发类型：Cron触发<br>调度机器：172.29.208.1<br>执行器-注册方式：自动注册<br>执行器-地址列表：[172.29.208.1:9999]<br>路由策略：随机<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：172.29.208.1:9999<br>code：200<br>msg：null','2021-05-17 01:07:23',500,'command exit value(1) is failed',1,'19292',NULL),(11,1,10,'计算机学院软件工程专业学生数据同步','172.29.208.1:9999','executorJobHandler','',NULL,0,'2021-05-17 01:07:24',200,'任务触发类型：Cron触发<br>调度机器：172.29.208.1<br>执行器-注册方式：自动注册<br>执行器-地址列表：[172.29.208.1:9999]<br>路由策略：随机<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：172.29.208.1:9999<br>code：200<br>msg：null','2021-05-17 01:07:24',500,'command exit value(1) is failed',1,'5884',NULL),(12,1,10,'计算机学院软件工程专业学生数据同步','172.29.208.1:9999','executorJobHandler','',NULL,0,'2021-05-17 01:07:25',200,'任务触发类型：Cron触发<br>调度机器：172.29.208.1<br>执行器-注册方式：自动注册<br>执行器-地址列表：[172.29.208.1:9999]<br>路由策略：随机<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：172.29.208.1:9999<br>code：200<br>msg：null','2021-05-17 01:07:25',500,'command exit value(1) is failed',1,'18792',NULL),(13,1,10,'计算机学院软件工程专业学生数据同步','172.29.208.1:9999','executorJobHandler','',NULL,0,'2021-05-17 01:07:26',200,'任务触发类型：Cron触发<br>调度机器：172.29.208.1<br>执行器-注册方式：自动注册<br>执行器-地址列表：[172.29.208.1:9999]<br>路由策略：随机<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：172.29.208.1:9999<br>code：200<br>msg：null','2021-05-17 01:07:26',500,'command exit value(1) is failed',1,'8168',NULL),(14,1,10,'计算机学院软件工程专业学生数据同步','172.29.208.1:9999','executorJobHandler','',NULL,0,'2021-05-17 01:07:27',200,'任务触发类型：Cron触发<br>调度机器：172.29.208.1<br>执行器-注册方式：自动注册<br>执行器-地址列表：[172.29.208.1:9999]<br>路由策略：随机<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：172.29.208.1:9999<br>code：200<br>msg：null','2021-05-17 01:07:27',500,'command exit value(1) is failed',1,'17876',NULL),(15,1,10,'计算机学院软件工程专业学生数据同步','172.29.208.1:9999','executorJobHandler','',NULL,0,'2021-05-17 01:07:28',200,'任务触发类型：Cron触发<br>调度机器：172.29.208.1<br>执行器-注册方式：自动注册<br>执行器-地址列表：[172.29.208.1:9999]<br>路由策略：随机<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：172.29.208.1:9999<br>code：200<br>msg：null','2021-05-17 01:07:28',500,'command exit value(1) is failed',1,'19712',NULL),(16,1,10,'计算机学院软件工程专业学生数据同步','172.29.208.1:9999','executorJobHandler','',NULL,0,'2021-05-17 01:07:29',200,'任务触发类型：Cron触发<br>调度机器：172.29.208.1<br>执行器-注册方式：自动注册<br>执行器-地址列表：[172.29.208.1:9999]<br>路由策略：随机<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：172.29.208.1:9999<br>code：200<br>msg：null','2021-05-17 01:07:29',500,'command exit value(1) is failed',1,'17496',NULL),(17,1,10,'计算机学院软件工程专业学生数据同步','172.29.208.1:9999','executorJobHandler','',NULL,0,'2021-05-17 01:37:09',200,'任务触发类型：手动触发<br>调度机器：172.29.208.1<br>执行器-注册方式：自动注册<br>执行器-地址列表：[172.29.208.1:9999]<br>路由策略：随机<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：172.29.208.1:9999<br>code：200<br>msg：null','2021-05-17 01:39:30',500,'command exit value(1) is failed',1,'564',NULL),(18,1,10,'计算机学院软件工程专业学生数据同步','172.29.208.1:9999','executorJobHandler','',NULL,0,'2021-05-17 01:45:09',200,'任务触发类型：手动触发<br>调度机器：172.29.208.1<br>执行器-注册方式：自动注册<br>执行器-地址列表：[172.29.208.1:9999]<br>路由策略：随机<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：172.29.208.1:9999<br>code：200<br>msg：null','2021-05-17 01:46:09',500,'command exit value(1) is failed',1,'1720',NULL),(19,1,10,'计算机学院软件工程专业学生数据同步',NULL,'executorJobHandler','',NULL,0,'2021-05-17 15:07:37',500,'任务触发类型：手动触发<br>调度机器：192.168.137.1<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：随机<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>',NULL,0,NULL,1,NULL,NULL),(20,1,10,'计算机学院软件工程专业学生数据同步','192.168.137.1:9999','executorJobHandler','',NULL,0,'2021-05-17 15:08:26',200,'任务触发类型：手动触发<br>调度机器：192.168.137.1<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.137.1:9999]<br>路由策略：随机<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.137.1:9999<br>code：200<br>msg：null','2021-05-17 15:09:20',500,'command exit value(1) is failed',1,'16004',NULL),(21,1,10,'计算机学院软件工程专业学生数据同步','192.168.137.1:9999','executorJobHandler','',NULL,0,'2021-05-17 15:11:00',200,'任务触发类型：手动触发<br>调度机器：192.168.137.1<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.137.1:9999]<br>路由策略：随机<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.137.1:9999<br>code：200<br>msg：null','2021-05-17 15:14:14',500,'command exit value(1) is failed',1,'16484',NULL),(22,1,10,'计算机学院软件工程专业学生数据同步','192.168.137.1:9999','executorJobHandler','',NULL,0,'2021-05-17 15:46:14',200,'任务触发类型：手动触发<br>调度机器：192.168.137.1<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.137.1:9999]<br>路由策略：随机<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.137.1:9999<br>code：200<br>msg：null','2021-05-17 15:49:53',500,'command exit value(1) is failed',1,'11624',NULL),(23,1,12,'test','192.168.137.1:9999','executorJobHandler','',NULL,0,'2021-05-17 15:56:25',200,'任务触发类型：手动触发<br>调度机器：192.168.137.1<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.137.1:9999]<br>路由策略：随机<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.137.1:9999<br>code：200<br>msg：null','2021-05-17 15:57:31',500,'command exit value(1) is failed',1,'15392',NULL),(24,1,12,'test','192.168.137.1:9999','executorJobHandler','',NULL,0,'2021-05-17 16:23:10',200,'任务触发类型：手动触发<br>调度机器：192.168.137.1<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.137.1:9999]<br>路由策略：随机<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.137.1:9999<br>code：200<br>msg：null','2021-05-17 16:23:48',500,'command exit value(1) is failed',1,'16780',NULL),(25,1,12,'test','192.168.137.1:9999','executorJobHandler','',NULL,0,'2021-05-17 16:42:20',200,'任务触发类型：手动触发<br>调度机器：192.168.137.1<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.137.1:9999]<br>路由策略：随机<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.137.1:9999<br>code：200<br>msg：null','2021-05-17 16:42:42',200,'LogStatistics{taskStartTime=2021-05-17 16:42:22, taskEndTime=2021-05-17 16:42:41, taskTotalTime=18s, taskAverageFlow=16B/s, taskRecordWritingSpeed=0rec/s, taskRecordReaderNum=4, taskRecordWriteFailNum=0}',0,'21484',NULL),(26,1,10,'计算机学院软件工程专业学生数据同步','192.168.137.1:9999','executorJobHandler','',NULL,0,'2021-05-17 18:27:59',200,'任务触发类型：手动触发<br>调度机器：192.168.137.1<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.137.1:9999]<br>路由策略：随机<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.137.1:9999<br>code：200<br>msg：null','2021-05-17 18:28:20',500,'command exit value(1) is failed',1,'14700',NULL),(27,1,10,'计算机学院软件工程专业学生数据同步','192.168.137.1:9999','executorJobHandler','',NULL,0,'2021-05-17 18:29:21',200,'任务触发类型：手动触发<br>调度机器：192.168.137.1<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.137.1:9999]<br>路由策略：随机<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.137.1:9999<br>code：200<br>msg：null','2021-05-17 18:29:41',500,'command exit value(1) is failed',1,'2176',NULL),(28,1,10,'计算机学院软件工程专业学生数据同步','192.168.137.1:9999','executorJobHandler','',NULL,0,'2021-05-17 18:36:16',200,'任务触发类型：手动触发<br>调度机器：192.168.137.1<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.137.1:9999]<br>路由策略：随机<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.137.1:9999<br>code：200<br>msg：null','2021-05-17 18:36:36',200,'LogStatistics{taskStartTime=2021-05-17 18:36:17, taskEndTime=2021-05-17 18:36:36, taskTotalTime=19s, taskAverageFlow=170B/s, taskRecordWritingSpeed=4rec/s, taskRecordReaderNum=40, taskRecordWriteFailNum=0}',0,'5936',NULL),(29,1,10,'计算机学院软件工程专业学生数据同步','192.168.137.1:9999','executorJobHandler','',NULL,0,'2021-05-17 19:00:55',200,'任务触发类型：手动触发<br>调度机器：192.168.137.1<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.137.1:9999]<br>路由策略：随机<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.137.1:9999<br>code：200<br>msg：null','2021-05-17 19:01:16',200,'LogStatistics{taskStartTime=2021-05-17 19:00:56, taskEndTime=2021-05-17 19:01:15, taskTotalTime=19s, taskAverageFlow=170B/s, taskRecordWritingSpeed=4rec/s, taskRecordReaderNum=40, taskRecordWriteFailNum=0}',0,'1924',NULL),(30,1,10,'计算机学院软件工程专业学生数据同步','192.168.137.1:9999','executorJobHandler','',NULL,0,'2021-06-02 10:04:32',200,'任务触发类型：手动触发<br>调度机器：192.168.137.1<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.137.1:9999]<br>路由策略：随机<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.137.1:9999<br>code：200<br>msg：null','2021-06-02 10:05:02',200,'LogStatistics{taskStartTime=2021-06-02 10:04:40, taskEndTime=2021-06-02 10:05:01, taskTotalTime=21s, taskAverageFlow=170B/s, taskRecordWritingSpeed=4rec/s, taskRecordReaderNum=40, taskRecordWriteFailNum=0}',0,'8560',NULL),(31,1,10,'计算机学院软件工程专业学生数据同步','192.168.137.1:9999','executorJobHandler','',NULL,0,'2021-06-02 10:51:50',200,'任务触发类型：手动触发<br>调度机器：192.168.137.1<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.137.1:9999]<br>路由策略：随机<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.137.1:9999<br>code：200<br>msg：null','2021-06-02 10:52:13',200,'LogStatistics{taskStartTime=2021-06-02 10:51:53, taskEndTime=2021-06-02 10:52:13, taskTotalTime=20s, taskAverageFlow=170B/s, taskRecordWritingSpeed=4rec/s, taskRecordReaderNum=40, taskRecordWriteFailNum=0}',0,'13192',NULL);
/*!40000 ALTER TABLE `job_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_log_report`
--

DROP TABLE IF EXISTS `job_log_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `job_log_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trigger_day` datetime DEFAULT NULL COMMENT '调度-时间',
  `running_count` int(11) NOT NULL DEFAULT '0' COMMENT '运行中-日志数量',
  `suc_count` int(11) NOT NULL DEFAULT '0' COMMENT '执行成功-日志数量',
  `fail_count` int(11) NOT NULL DEFAULT '0' COMMENT '执行失败-日志数量',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `i_trigger_day` (`trigger_day`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_log_report`
--

LOCK TABLES `job_log_report` WRITE;
/*!40000 ALTER TABLE `job_log_report` DISABLE KEYS */;
INSERT INTO `job_log_report` VALUES (20,'2019-12-07 00:00:00',0,0,0),(21,'2019-12-10 00:00:00',77,52,23),(22,'2019-12-11 00:00:00',9,2,11),(23,'2019-12-13 00:00:00',9,48,74),(24,'2019-12-12 00:00:00',10,8,30),(25,'2019-12-14 00:00:00',78,45,66),(26,'2019-12-15 00:00:00',24,76,9),(27,'2019-12-16 00:00:00',23,85,10),(28,'2021-04-26 00:00:00',0,0,0),(29,'2021-04-25 00:00:00',0,0,0),(30,'2021-04-24 00:00:00',0,0,0),(31,'2021-05-06 00:00:00',0,0,0),(32,'2021-05-05 00:00:00',0,0,0),(33,'2021-05-04 00:00:00',0,0,0),(34,'2021-05-10 00:00:00',0,0,0),(35,'2021-05-09 00:00:00',0,0,0),(36,'2021-05-08 00:00:00',0,0,0),(37,'2021-05-12 00:00:00',0,0,0),(38,'2021-05-11 00:00:00',0,0,0),(39,'2021-05-13 00:00:00',0,0,0),(40,'2021-05-15 00:00:00',0,0,0),(41,'2021-05-14 00:00:00',0,0,0),(42,'2021-05-16 00:00:00',0,0,0),(43,'2021-05-17 00:00:00',0,3,26),(44,'2021-05-21 00:00:00',0,0,0),(45,'2021-05-20 00:00:00',0,0,0),(46,'2021-05-19 00:00:00',0,0,0),(47,'2021-05-25 00:00:00',0,0,0),(48,'2021-05-24 00:00:00',0,0,0),(49,'2021-05-23 00:00:00',0,0,0),(50,'2021-05-29 00:00:00',0,0,0),(51,'2021-05-28 00:00:00',0,0,0),(52,'2021-05-27 00:00:00',0,0,0),(53,'2021-06-02 00:00:00',0,2,0),(54,'2021-06-01 00:00:00',0,0,0),(55,'2021-05-31 00:00:00',0,0,0);
/*!40000 ALTER TABLE `job_log_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_logglue`
--

DROP TABLE IF EXISTS `job_logglue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `job_logglue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL COMMENT '任务，主键ID',
  `glue_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'GLUE类型',
  `glue_source` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT 'GLUE源代码',
  `glue_remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'GLUE备注',
  `add_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_logglue`
--

LOCK TABLES `job_logglue` WRITE;
/*!40000 ALTER TABLE `job_logglue` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_logglue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_permission`
--

DROP TABLE IF EXISTS `job_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `job_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '权限名',
  `description` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '权限描述',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_permission`
--

LOCK TABLES `job_permission` WRITE;
/*!40000 ALTER TABLE `job_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_project`
--

DROP TABLE IF EXISTS `job_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `job_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'key',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'project name',
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT 'creator id',
  `flag` tinyint(4) DEFAULT '1' COMMENT '0 not available, 1 available',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'update time',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_project`
--

LOCK TABLES `job_project` WRITE;
/*!40000 ALTER TABLE `job_project` DISABLE KEYS */;
INSERT INTO `job_project` VALUES (1,'project_test','项目测试',1,1,'2021-05-06 19:20:49','2021-05-06 19:20:49');
/*!40000 ALTER TABLE `job_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_registry`
--

DROP TABLE IF EXISTS `job_registry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `job_registry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `registry_group` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `registry_key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `registry_value` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cpu_usage` double DEFAULT NULL,
  `memory_usage` double DEFAULT NULL,
  `load_average` double DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `i_g_k_v` (`registry_group`,`registry_key`,`registry_value`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_registry`
--

LOCK TABLES `job_registry` WRITE;
/*!40000 ALTER TABLE `job_registry` DISABLE KEYS */;
INSERT INTO `job_registry` VALUES (32,'EXECUTOR','datax-executor','192.168.137.1:9999',10.43,49.08,-1,'2021-06-02 10:54:28');
/*!40000 ALTER TABLE `job_registry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_template`
--

DROP TABLE IF EXISTS `job_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `job_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_group` int(11) NOT NULL COMMENT '执行器主键ID',
  `job_cron` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务执行CRON',
  `job_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `add_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `user_id` int(11) NOT NULL COMMENT '修改用户',
  `alarm_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '报警邮件',
  `executor_route_strategy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '执行器路由策略',
  `executor_handler` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '执行器任务handler',
  `executor_param` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '执行器参数',
  `executor_block_strategy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '阻塞处理策略',
  `executor_timeout` int(11) NOT NULL DEFAULT '0' COMMENT '任务执行超时时间，单位秒',
  `executor_fail_retry_count` int(11) NOT NULL DEFAULT '0' COMMENT '失败重试次数',
  `glue_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'GLUE类型',
  `glue_source` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT 'GLUE源代码',
  `glue_remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'GLUE备注',
  `glue_updatetime` datetime DEFAULT NULL COMMENT 'GLUE更新时间',
  `child_jobid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '子任务ID，多个逗号分隔',
  `trigger_last_time` bigint(13) NOT NULL DEFAULT '0' COMMENT '上次调度时间',
  `trigger_next_time` bigint(13) NOT NULL DEFAULT '0' COMMENT '下次调度时间',
  `job_json` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT 'datax运行脚本',
  `jvm_param` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'jvm参数',
  `project_id` int(11) DEFAULT NULL COMMENT '所属项目Id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_template`
--

LOCK TABLES `job_template` WRITE;
/*!40000 ALTER TABLE `job_template` DISABLE KEYS */;
INSERT INTO `job_template` VALUES (22,1,'00 00 22,00 L * ? 2024-2026','template_test','2021-05-06 19:22:01','2021-05-17 15:53:24',1,'','RANDOM','executorJobHandler','','DISCARD_LATER',0,0,'BEAN',NULL,NULL,'2021-05-06 19:22:01','',0,0,NULL,'',1),(23,1,'* * * ? * * *','计算机学院软件工程专业学生数据同步','2021-05-17 00:52:07','2021-05-17 00:52:07',1,'','RANDOM','executorJobHandler','','DISCARD_LATER',0,0,'BEAN',NULL,NULL,'2021-05-17 00:52:07','',0,0,NULL,'',1);
/*!40000 ALTER TABLE `job_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_user`
--

DROP TABLE IF EXISTS `job_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `job_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账号',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '角色：0-普通用户、1-管理员',
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '权限：执行器ID列表，多个逗号分割',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `i_username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_user`
--

LOCK TABLES `job_user` WRITE;
/*!40000 ALTER TABLE `job_user` DISABLE KEYS */;
INSERT INTO `job_user` VALUES (1,'admin','$2a$10$2KCqRbra0Yn2TwvkZxtfLuWuUP5KyCWsljO/ci5pLD27pqR3TV1vy','ROLE_ADMIN',NULL),(10,'test1','$2a$10$8A.sS5CfKGQna9.sCIiiyubYAWnklc2aCQO8q.vdwRoTH6/kVKFMC','ROLE_USER',''),(11,'test2','$2a$10$bMI1duZwT1hCkIcfI3YCyuxbk5oVkIeTwFfyGWXHIACEeQsIAAcqC','ROLE_USER','');
/*!40000 ALTER TABLE `job_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-10 14:19:13
