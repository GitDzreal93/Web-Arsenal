# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.25)
# Database: arsenal
# Generation Time: 2019-06-13 01:43:15 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table auth_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table auth_group_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table auth_permission
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
	(1,'Can add log entry',1,'add_logentry'),
	(2,'Can change log entry',1,'change_logentry'),
	(3,'Can delete log entry',1,'delete_logentry'),
	(4,'Can view log entry',1,'view_logentry'),
	(5,'Can add permission',2,'add_permission'),
	(6,'Can change permission',2,'change_permission'),
	(7,'Can delete permission',2,'delete_permission'),
	(8,'Can add group',3,'add_group'),
	(9,'Can change group',3,'change_group'),
	(10,'Can delete group',3,'delete_group'),
	(11,'Can add user',4,'add_user'),
	(12,'Can change user',4,'change_user'),
	(13,'Can delete user',4,'delete_user'),
	(14,'Can view group',3,'view_group'),
	(15,'Can view permission',2,'view_permission'),
	(16,'Can view user',4,'view_user'),
	(17,'Can add content type',5,'add_contenttype'),
	(18,'Can change content type',5,'change_contenttype'),
	(19,'Can delete content type',5,'delete_contenttype'),
	(20,'Can view content type',5,'view_contenttype'),
	(21,'Can add session',6,'add_session'),
	(22,'Can change session',6,'change_session'),
	(23,'Can delete session',6,'delete_session'),
	(24,'Can view session',6,'view_session'),
	(25,'Can add 类别',7,'add_category'),
	(26,'Can change 类别',7,'change_category'),
	(27,'Can delete 类别',7,'delete_category'),
	(28,'Can add 网站',8,'add_website'),
	(29,'Can change 网站',8,'change_website'),
	(30,'Can delete 网站',8,'delete_website'),
	(31,'Can view 类别',7,'view_category'),
	(32,'Can view 网站',8,'view_website'),
	(33,'Can add Bookmark',9,'add_bookmark'),
	(34,'Can change Bookmark',9,'change_bookmark'),
	(35,'Can delete Bookmark',9,'delete_bookmark'),
	(36,'Can add User Setting',10,'add_usersettings'),
	(37,'Can change User Setting',10,'change_usersettings'),
	(38,'Can delete User Setting',10,'delete_usersettings'),
	(39,'Can add User Widget',11,'add_userwidget'),
	(40,'Can change User Widget',11,'change_userwidget'),
	(41,'Can delete User Widget',11,'delete_userwidget'),
	(42,'Can add log entry',12,'add_log'),
	(43,'Can change log entry',12,'change_log'),
	(44,'Can delete log entry',12,'delete_log'),
	(45,'Can view Bookmark',9,'view_bookmark'),
	(46,'Can view log entry',12,'view_log'),
	(47,'Can view User Setting',10,'view_usersettings'),
	(48,'Can view User Widget',11,'view_userwidget');

/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table auth_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`)
VALUES
	(1,'pbkdf2_sha256$100000$JthkgEGs8kIW$spGUhy4YJKBNh7Y6t6/A/iKFcP90ZWx5eJ3Klrk8Ruk=','2019-06-13 00:26:42.791583',1,'root','','','dzreal_93@126.com',1,1,'2019-06-09 22:54:33.876265');

/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table auth_user_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table auth_user_user_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table django_admin_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table django_content_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;

INSERT INTO `django_content_type` (`id`, `app_label`, `model`)
VALUES
	(1,'admin','logentry'),
	(7,'arsenal','category'),
	(8,'arsenal','website'),
	(3,'auth','group'),
	(2,'auth','permission'),
	(4,'auth','user'),
	(5,'contenttypes','contenttype'),
	(6,'sessions','session'),
	(9,'xadmin','bookmark'),
	(12,'xadmin','log'),
	(10,'xadmin','usersettings'),
	(11,'xadmin','userwidget');

/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table django_migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`)
VALUES
	(1,'contenttypes','0001_initial','2019-06-09 22:53:51.607999'),
	(2,'auth','0001_initial','2019-06-09 22:53:52.062393'),
	(3,'admin','0001_initial','2019-06-09 22:53:52.135161'),
	(4,'admin','0002_logentry_remove_auto_add','2019-06-09 22:53:52.144258'),
	(5,'arsenal','0001_initial','2019-06-09 22:53:52.244687'),
	(6,'contenttypes','0002_remove_content_type_name','2019-06-09 22:53:52.305750'),
	(7,'auth','0002_alter_permission_name_max_length','2019-06-09 22:53:52.330292'),
	(8,'auth','0003_alter_user_email_max_length','2019-06-09 22:53:52.357047'),
	(9,'auth','0004_alter_user_username_opts','2019-06-09 22:53:52.367557'),
	(10,'auth','0005_alter_user_last_login_null','2019-06-09 22:53:52.394857'),
	(11,'auth','0006_require_contenttypes_0002','2019-06-09 22:53:52.397593'),
	(12,'auth','0007_alter_validators_add_error_messages','2019-06-09 22:53:52.407922'),
	(13,'auth','0008_alter_user_username_max_length','2019-06-09 22:53:52.442333'),
	(14,'auth','0009_alter_user_last_name_max_length','2019-06-09 22:53:52.473441'),
	(15,'sessions','0001_initial','2019-06-09 22:53:52.514374'),
	(16,'xadmin','0001_initial','2019-06-09 22:53:52.691982'),
	(17,'xadmin','0002_log','2019-06-09 22:53:52.753592'),
	(18,'xadmin','0003_auto_20160715_0100','2019-06-09 22:53:52.819851'),
	(19,'xadmin','0004_auto_20190411_1927','2019-06-09 22:53:53.011181'),
	(20,'arsenal','0002_category_is_show','2019-06-10 00:07:22.492606'),
	(21,'arsenal','0003_auto_20190610_0023','2019-06-10 00:26:09.036722'),
	(22,'arsenal','0004_auto_20190610_0026','2019-06-10 00:26:09.041705'),
	(23,'arsenal','0005_category_sn','2019-06-11 01:55:39.946891'),
	(24,'arsenal','0006_auto_20190613_0058','2019-06-13 00:58:24.745327');

/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table django_session
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`)
VALUES
	('8ayltfu8xnl2otjfj9d4ozq0ixky1tbo','YjQ3MjAzMTE2ZTgxNDZlYzRjZTlmMGY3NzEwYTg1OTM5ZjVhODgzZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNTM3OTYwZGI0ZTQ2NzFiMzg1Yjg3YzM5NzkxYzFlZjMyZDE1Y2EzIiwiTElTVF9RVUVSWSI6W1siYXJzZW5hbCIsIndlYnNpdGUiXSwiIl19','2019-06-25 10:48:19.848814'),
	('ojvolrd4xkhz7hl2px4lq64q9y5uwyb7','ZmQwMjJjYWNiODg2ZTFkYjYxNTEwNjFhNDIwOTk0OWVlN2Y4OTM0ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNTM3OTYwZGI0ZTQ2NzFiMzg1Yjg3YzM5NzkxYzFlZjMyZDE1Y2EzIiwiTElTVF9RVUVSWSI6W1siYXJzZW5hbCIsImNhdGVnb3J5Il0sIiJdfQ==','2019-06-25 02:46:57.489147'),
	('qo00azpzg8eteswvikk6xdws6aaf6je9','YjQ3MjAzMTE2ZTgxNDZlYzRjZTlmMGY3NzEwYTg1OTM5ZjVhODgzZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNTM3OTYwZGI0ZTQ2NzFiMzg1Yjg3YzM5NzkxYzFlZjMyZDE1Y2EzIiwiTElTVF9RVUVSWSI6W1siYXJzZW5hbCIsIndlYnNpdGUiXSwiIl19','2019-06-27 01:25:09.009208');

/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tb_category
# ------------------------------------------------------------

CREATE TABLE `tb_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(20) NOT NULL,
  `weight` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `is_show` tinyint(1) NOT NULL,
  `sn` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `tb_category` WRITE;
/*!40000 ALTER TABLE `tb_category` DISABLE KEYS */;

INSERT INTO `tb_category` (`id`, `category`, `weight`, `add_time`, `is_show`, `sn`)
VALUES
	(31,'随便了',200,'2019-06-13 01:02:00.000000',1,'wbkckcri'),
	(32,'再来一个',21,'2019-06-13 01:02:00.000000',1,'evbqraod'),
	(33,'Bug真多',21,'2019-06-13 01:03:00.000000',1,'wjiymkdw');

/*!40000 ALTER TABLE `tb_category` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tb_website
# ------------------------------------------------------------

CREATE TABLE `tb_website` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `desc` varchar(29) DEFAULT NULL,
  `url` varchar(300) NOT NULL,
  `logo` varchar(200) DEFAULT NULL,
  `add_time` datetime(6) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `tb_website_category_id_ebfadc7d_fk_tb_category_id` (`category_id`),
  CONSTRAINT `tb_website_category_id_ebfadc7d_fk_tb_category_id` FOREIGN KEY (`category_id`) REFERENCES `tb_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `tb_website` WRITE;
/*!40000 ALTER TABLE `tb_website` DISABLE KEYS */;

INSERT INTO `tb_website` (`id`, `name`, `desc`, `url`, `logo`, `add_time`, `category_id`)
VALUES
	(8,'多少字合适多少字合适多少字合适','多少字合适多少字合适多少字合适多少字合适多少字合适多少字合','http://127.0.0.1:8000/','logo/img_gJZtHwj.jpg','2019-06-13 01:03:00.000000',31),
	(9,'多少字合适多少字合适','多少字合适多少字合适多少字合适多少字合适多少字合适多少字合','http://127.0.0.1:8000/','','2019-06-13 01:04:00.000000',32),
	(10,'多少字合适','多少字合适多少字合适多少字合适多少字合适多少字合适多少字合','http://127.0.0.1:8000/','','2019-06-13 01:05:00.000000',33),
	(11,'多少字合适多少字合适多少字合适多少字合适','多少字合适多少字合适多少字合适多少字合适多少字合适多少字合','http://127.0.0.1:8000/','','2019-06-13 01:10:00.000000',32);

/*!40000 ALTER TABLE `tb_website` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table xadmin_bookmark
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xadmin_bookmark`;

CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `url_name` varchar(64) NOT NULL,
  `query` varchar(1000) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookmark_content_type_id_60941679_fk_django_co` (`content_type_id`),
  KEY `xadmin_bookmark_user_id_42d307fc_fk_auth_user_id` (`user_id`),
  CONSTRAINT `xadmin_bookmark_content_type_id_60941679_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table xadmin_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xadmin_log`;

CREATE TABLE `xadmin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `ip_addr` char(39) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` varchar(32) NOT NULL,
  `message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_log_user_id_bb16a176_fk_auth_user_id` (`user_id`),
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `xadmin_log` WRITE;
/*!40000 ALTER TABLE `xadmin_log` DISABLE KEYS */;

INSERT INTO `xadmin_log` (`id`, `action_time`, `ip_addr`, `object_id`, `object_repr`, `action_flag`, `message`, `content_type_id`, `user_id`)
VALUES
	(1,'2019-06-09 23:00:55.363544','127.0.0.1','1','阿克索德离开家','create','已添加。',7,1),
	(2,'2019-06-09 23:02:43.262761','127.0.0.1','1','1','create','已添加。',8,1),
	(3,'2019-06-10 00:17:43.950172','127.0.0.1','1','阿克索德离开家','change','修改 is_show',7,1),
	(4,'2019-06-10 00:18:11.017701','127.0.0.1','2','zxcjqwe','create','已添加。',7,1),
	(5,'2019-06-10 00:18:24.315287','127.0.0.1','3','no show','create','已添加。',7,1),
	(6,'2019-06-10 00:18:59.061165','127.0.0.1','2','2','create','已添加。',8,1),
	(7,'2019-06-10 00:19:19.058514','127.0.0.1','3','3','create','已添加。',8,1),
	(8,'2019-06-10 00:20:20.799100','127.0.0.1','1','阿克索德离开家','change','修改 weight',7,1),
	(9,'2019-06-11 02:03:23.003232','127.0.0.1','4','热门排行','create','已添加。',7,1),
	(10,'2019-06-11 02:19:23.063731','127.0.0.1','5','asdasdasd','create','已添加。',7,1),
	(11,'2019-06-11 03:45:42.057421','127.0.0.1','4','4','create','已添加。',8,1),
	(12,'2019-06-11 03:45:57.182091','127.0.0.1','5','5','create','已添加。',8,1),
	(13,'2019-06-11 10:37:59.972555','127.0.0.1','6','6','create','已添加。',8,1),
	(14,'2019-06-13 00:59:16.486291','127.0.0.1','7','7','create','已添加。',8,1),
	(15,'2019-06-13 01:00:38.730202','127.0.0.1','7','7','change','修改 logo',8,1),
	(16,'2019-06-13 01:02:35.468447','127.0.0.1',NULL,'','delete','批量删除 20 个 类别',NULL,1),
	(17,'2019-06-13 01:04:36.441103','127.0.0.1','8','8','create','已添加。',8,1),
	(18,'2019-06-13 01:05:01.521083','127.0.0.1','9','9','create','已添加。',8,1),
	(19,'2019-06-13 01:05:37.579353','127.0.0.1','10','10','create','已添加。',8,1),
	(20,'2019-06-13 01:10:34.184101','127.0.0.1','11','11','create','已添加。',8,1);

/*!40000 ALTER TABLE `xadmin_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table xadmin_usersettings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xadmin_usersettings`;

CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_user_id_edeabe4a_fk_auth_user_id` (`user_id`),
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `xadmin_usersettings` WRITE;
/*!40000 ALTER TABLE `xadmin_usersettings` DISABLE KEYS */;

INSERT INTO `xadmin_usersettings` (`id`, `key`, `value`, `user_id`)
VALUES
	(1,'dashboard:home:pos','',1),
	(2,'site-theme','https://bootswatch.com/3/journal/bootstrap.min.css',1);

/*!40000 ALTER TABLE `xadmin_usersettings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table xadmin_userwidget
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xadmin_userwidget`;

CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) NOT NULL,
  `widget_type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_user_id_c159233a_fk_auth_user_id` (`user_id`),
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
