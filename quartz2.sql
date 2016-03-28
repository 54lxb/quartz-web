/*
 Navicat MySQL Data Transfer

 Source Server         : test-sneaker
 Source Server Version : 50546
 Source Host           : 115.28.8.173
 Source Database       : quartz2

 Target Server Version : 50546
 File Encoding         : utf-8

 Date: 03/23/2016 15:51:44 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `qrtz_blob_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `TRIGGER_NAME` varchar(80) COLLATE utf8_bin NOT NULL,
  `TRIGGER_GROUP` varchar(80) COLLATE utf8_bin NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `TRIGGER_NAME` (`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `qrtz_calendars`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `CALENDAR_NAME` varchar(80) COLLATE utf8_bin NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `qrtz_cron_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `TRIGGER_NAME` varchar(80) COLLATE utf8_bin NOT NULL,
  `TRIGGER_GROUP` varchar(80) COLLATE utf8_bin NOT NULL,
  `CRON_EXPRESSION` varchar(120) COLLATE utf8_bin NOT NULL,
  `TIME_ZONE_ID` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `TRIGGER_NAME` (`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `qrtz_cron_triggers`
-- ----------------------------
BEGIN;
INSERT INTO `qrtz_cron_triggers` VALUES ('price_4100000052', 'ErpTiggerGroup', '0 0 0 23 3 ? 2016-2016', 'Asia/Shanghai'), ('price_4100000053', 'ErpTiggerGroup', '0 0 0 23 3 ? 2016-2016', 'Asia/Shanghai'), ('price_4100000054', 'ErpTiggerGroup', '0 0 0 23 3 ? 2016-2016', 'Asia/Shanghai'), ('price_4100000055', 'ErpTiggerGroup', '0 0 0 23 3 ? 2016-2016', 'Asia/Shanghai');
COMMIT;

-- ----------------------------
--  Table structure for `qrtz_fired_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `ENTRY_ID` varchar(95) COLLATE utf8_bin NOT NULL,
  `TRIGGER_NAME` varchar(80) COLLATE utf8_bin NOT NULL,
  `TRIGGER_GROUP` varchar(80) COLLATE utf8_bin NOT NULL,
  `IS_VOLATILE` varchar(1) COLLATE utf8_bin NOT NULL,
  `INSTANCE_NAME` varchar(80) COLLATE utf8_bin NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) COLLATE utf8_bin NOT NULL,
  `JOB_NAME` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `JOB_GROUP` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `IS_STATEFUL` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ENTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `qrtz_job_details`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `JOB_NAME` varchar(80) COLLATE utf8_bin NOT NULL,
  `JOB_GROUP` varchar(80) COLLATE utf8_bin NOT NULL,
  `DESCRIPTION` varchar(120) COLLATE utf8_bin DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(128) COLLATE utf8_bin NOT NULL,
  `IS_DURABLE` varchar(1) COLLATE utf8_bin NOT NULL,
  `IS_VOLATILE` varchar(1) COLLATE utf8_bin NOT NULL,
  `IS_STATEFUL` varchar(1) COLLATE utf8_bin NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) COLLATE utf8_bin NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`JOB_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `qrtz_job_details`
-- ----------------------------
BEGIN;
INSERT INTO `qrtz_job_details` VALUES ('price_4100000052', 'ErpJobGroup', null, 'com.quartz.web.template.QuartzHttpTemplate', '0', '0', '0', '0', null), ('price_4100000053', 'ErpJobGroup', null, 'com.quartz.web.template.QuartzHttpTemplate', '0', '0', '0', '0', null), ('price_4100000054', 'ErpJobGroup', null, 'com.quartz.web.template.QuartzHttpTemplate', '0', '0', '0', '0', null), ('price_4100000055', 'ErpJobGroup', null, 'com.quartz.web.template.QuartzHttpTemplate', '0', '0', '0', '0', null);
COMMIT;

-- ----------------------------
--  Table structure for `qrtz_job_listeners`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_listeners`;
CREATE TABLE `qrtz_job_listeners` (
  `JOB_NAME` varchar(80) COLLATE utf8_bin NOT NULL,
  `JOB_GROUP` varchar(80) COLLATE utf8_bin NOT NULL,
  `JOB_LISTENER` varchar(80) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`JOB_NAME`,`JOB_GROUP`,`JOB_LISTENER`),
  KEY `JOB_NAME` (`JOB_NAME`,`JOB_GROUP`),
  CONSTRAINT `QRTZ_JOB_LISTENERS_ibfk_1` FOREIGN KEY (`JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `qrtz_locks`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `LOCK_NAME` varchar(40) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `qrtz_locks`
-- ----------------------------
BEGIN;
INSERT INTO `qrtz_locks` VALUES ('CALENDAR_ACCESS'), ('JOB_ACCESS'), ('MISFIRE_ACCESS'), ('STATE_ACCESS'), ('TRIGGER_ACCESS');
COMMIT;

-- ----------------------------
--  Table structure for `qrtz_paused_trigger_grps`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `TRIGGER_GROUP` varchar(80) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `qrtz_scheduler_state`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `INSTANCE_NAME` varchar(80) COLLATE utf8_bin NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `qrtz_simple_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `TRIGGER_NAME` varchar(80) COLLATE utf8_bin NOT NULL,
  `TRIGGER_GROUP` varchar(80) COLLATE utf8_bin NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(7) NOT NULL,
  PRIMARY KEY (`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `TRIGGER_NAME` (`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `qrtz_trigger_listeners`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_trigger_listeners`;
CREATE TABLE `qrtz_trigger_listeners` (
  `TRIGGER_NAME` varchar(80) COLLATE utf8_bin NOT NULL,
  `TRIGGER_GROUP` varchar(80) COLLATE utf8_bin NOT NULL,
  `TRIGGER_LISTENER` varchar(80) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_LISTENER`),
  KEY `TRIGGER_NAME` (`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_TRIGGER_LISTENERS_ibfk_1` FOREIGN KEY (`TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `qrtz_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `TRIGGER_NAME` varchar(80) COLLATE utf8_bin NOT NULL,
  `TRIGGER_GROUP` varchar(80) COLLATE utf8_bin NOT NULL,
  `JOB_NAME` varchar(80) COLLATE utf8_bin NOT NULL,
  `JOB_GROUP` varchar(80) COLLATE utf8_bin NOT NULL,
  `IS_VOLATILE` varchar(1) COLLATE utf8_bin NOT NULL,
  `DESCRIPTION` varchar(120) COLLATE utf8_bin DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) COLLATE utf8_bin NOT NULL,
  `TRIGGER_TYPE` varchar(8) COLLATE utf8_bin NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `JOB_NAME` (`JOB_NAME`,`JOB_GROUP`),
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `qrtz_triggers`
-- ----------------------------
BEGIN;
INSERT INTO `qrtz_triggers` VALUES ('price_4100000052', 'ErpTiggerGroup', 'price_4100000052', 'ErpJobGroup', '0', null, '1458662400000', '-1', '5', 'WAITING', 'CRON', '1458614858000', '0', null, '0', null), ('price_4100000053', 'ErpTiggerGroup', 'price_4100000053', 'ErpJobGroup', '0', null, '1458662400000', '-1', '5', 'WAITING', 'CRON', '1458614868000', '0', null, '0', null), ('price_4100000054', 'ErpTiggerGroup', 'price_4100000054', 'ErpJobGroup', '0', null, '1458662400000', '-1', '5', 'WAITING', 'CRON', '1458615103000', '0', null, '0', null), ('price_4100000055', 'ErpTiggerGroup', 'price_4100000055', 'ErpJobGroup', '0', null, '1458662400000', '-1', '5', 'WAITING', 'CRON', '1458615499000', '0', null, '0', null);
COMMIT;

-- ----------------------------
--  Table structure for `quartz_config`
-- ----------------------------
DROP TABLE IF EXISTS `quartz_config`;
CREATE TABLE `quartz_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ckey` varchar(128) NOT NULL COMMENT '键',
  `cvalue` varchar(1024) NOT NULL COMMENT '值 ',
  `cflag` tinyint(8) NOT NULL COMMENT '标识',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `quartz_config`
-- ----------------------------
BEGIN;
INSERT INTO `quartz_config` VALUES ('3', 'jeffwu', '123456', '1'), ('4', '系统定时任务', 'SystemJobGroup', '2'), ('5', '系统定时触发器组', 'SystemTimgerGroup', '3'), ('6', '应用定时任务', 'ApplicationJobGroup', '2'), ('8', 'URL定时任务触发器类', 'com.quartz.web.template.QuartzHttpTemplate', '4'), ('9', 'SSH执行定时任务', 'com.quartz.web.template.QuartzSshTemplate', '4'), ('10', 'ERP专用', 'ErpTiggerGroup', '3'), ('11', 'ERP专用JOB组', 'ErpJobGroup', '2');
COMMIT;

-- ----------------------------
--  Table structure for `quartz_param`
-- ----------------------------
DROP TABLE IF EXISTS `quartz_param`;
CREATE TABLE `quartz_param` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `jobname` varchar(1024) DEFAULT NULL,
  `paraname` varchar(1024) DEFAULT NULL,
  `paravalue` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `quartz_param`
-- ----------------------------
BEGIN;
INSERT INTO `quartz_param` VALUES ('5', '测试任务', 'httpurl', 'http://www.baidu.com'), ('6', '测试任务', 'httpparam', 'action=v&mn=cv'), ('9', 'httprequesttask', 'httpurl', 'http://www.baidu.com'), ('10', 'httprequesttask', 'httpparam', 'k=jk');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
