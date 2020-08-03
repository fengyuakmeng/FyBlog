-- MySQL dump 10.13  Distrib 5.7.26, for Win64 (x86_64)
--
-- Host: localhost    Database: fyblog
-- ------------------------------------------------------
-- Server version	5.7.26

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add 分类',7,'add_category'),(26,'Can change 分类',7,'change_category'),(27,'Can delete 分类',7,'delete_category'),(28,'Can view 分类',7,'view_category'),(29,'Can add 文章',8,'add_post'),(30,'Can change 文章',8,'change_post'),(31,'Can delete 文章',8,'delete_post'),(32,'Can view 文章',8,'view_post'),(33,'Can add 标签',9,'add_tag'),(34,'Can change 标签',9,'change_tag'),(35,'Can delete 标签',9,'delete_tag'),(36,'Can view 标签',9,'view_tag'),(37,'Can add comment',10,'add_comment'),(38,'Can change comment',10,'change_comment'),(39,'Can delete comment',10,'delete_comment'),(40,'Can view comment',10,'view_comment'),(41,'Can add reply',11,'add_reply'),(42,'Can change reply',11,'change_reply'),(43,'Can delete reply',11,'delete_reply'),(44,'Can view reply',11,'view_reply'),(45,'Can add 友情链接',12,'add_link'),(46,'Can change 友情链接',12,'change_link'),(47,'Can delete 友情链接',12,'delete_link'),(48,'Can view 友情链接',12,'view_link'),(49,'Can add 侧边栏',13,'add_sidebar'),(50,'Can change 侧边栏',13,'change_sidebar'),(51,'Can delete 侧边栏',13,'delete_sidebar'),(52,'Can view 侧边栏',13,'view_sidebar'),(53,'Can add Bookmark',14,'add_bookmark'),(54,'Can change Bookmark',14,'change_bookmark'),(55,'Can delete Bookmark',14,'delete_bookmark'),(56,'Can view Bookmark',14,'view_bookmark'),(57,'Can add User Setting',15,'add_usersettings'),(58,'Can change User Setting',15,'change_usersettings'),(59,'Can delete User Setting',15,'delete_usersettings'),(60,'Can view User Setting',15,'view_usersettings'),(61,'Can add User Widget',16,'add_userwidget'),(62,'Can change User Widget',16,'change_userwidget'),(63,'Can delete User Widget',16,'delete_userwidget'),(64,'Can view User Widget',16,'view_userwidget'),(65,'Can add log entry',17,'add_log'),(66,'Can change log entry',17,'change_log'),(67,'Can delete log entry',17,'delete_log'),(68,'Can view log entry',17,'view_log'),(69,'Can add user',18,'add_user'),(70,'Can change user',18,'change_user'),(71,'Can delete user',18,'delete_user'),(72,'Can view user',18,'view_user'),(73,'Can add 邮箱验证码',19,'add_emailpro'),(74,'Can change 邮箱验证码',19,'change_emailpro'),(75,'Can delete 邮箱验证码',19,'delete_emailpro'),(76,'Can view 邮箱验证码',19,'view_emailpro'),(77,'Can add periodic task',20,'add_periodictask'),(78,'Can change periodic task',20,'change_periodictask'),(79,'Can delete periodic task',20,'delete_periodictask'),(80,'Can view periodic task',20,'view_periodictask'),(81,'Can add interval',21,'add_intervalschedule'),(82,'Can change interval',21,'change_intervalschedule'),(83,'Can delete interval',21,'delete_intervalschedule'),(84,'Can view interval',21,'view_intervalschedule'),(85,'Can add crontab',22,'add_crontabschedule'),(86,'Can change crontab',22,'change_crontabschedule'),(87,'Can delete crontab',22,'delete_crontabschedule'),(88,'Can view crontab',22,'view_crontabschedule'),(89,'Can add periodic tasks',23,'add_periodictasks'),(90,'Can change periodic tasks',23,'change_periodictasks'),(91,'Can delete periodic tasks',23,'delete_periodictasks'),(92,'Can view periodic tasks',23,'view_periodictasks'),(93,'Can add task state',24,'add_taskmeta'),(94,'Can change task state',24,'change_taskmeta'),(95,'Can delete task state',24,'delete_taskmeta'),(96,'Can view task state',24,'view_taskmeta'),(97,'Can add saved group result',25,'add_tasksetmeta'),(98,'Can change saved group result',25,'change_tasksetmeta'),(99,'Can delete saved group result',25,'delete_tasksetmeta'),(100,'Can view saved group result',25,'view_tasksetmeta'),(101,'Can add worker',26,'add_workerstate'),(102,'Can change worker',26,'change_workerstate'),(103,'Can delete worker',26,'delete_workerstate'),(104,'Can view worker',26,'view_workerstate'),(105,'Can add task',27,'add_taskstate'),(106,'Can change task',27,'change_taskstate'),(107,'Can delete task',27,'delete_taskstate'),(108,'Can view task',27,'view_taskstate'),(109,'Can add 网站日访问统计',28,'add_daynumber'),(110,'Can change 网站日访问统计',28,'change_daynumber'),(111,'Can delete 网站日访问统计',28,'delete_daynumber'),(112,'Can view 网站日访问统计',28,'view_daynumber'),(113,'Can add 访问用户信息',29,'add_userip'),(114,'Can change 访问用户信息',29,'change_userip'),(115,'Can delete 访问用户信息',29,'delete_userip'),(116,'Can view 访问用户信息',29,'view_userip'),(117,'Can add 网站访问总次数',30,'add_visitnumber'),(118,'Can change 网站访问总次数',30,'change_visitnumber'),(119,'Can delete 网站访问总次数',30,'delete_visitnumber'),(120,'Can view 网站访问总次数',30,'view_visitnumber');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$120000$biYGdCOEXiJi$WcHcrZkeDgMYnO50SIJ2VQvg3mOrFcCe2oHZ4ei8OC8=','2019-12-06 13:36:59.649920',1,'fys','','','yaoshun72@163.com',1,1,'2019-06-06 10:13:32.950960');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_category`
--

DROP TABLE IF EXISTS `blog_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `is_nav` tinyint(1) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_category_owner_id_96951406_fk_auth_user_id` (`owner_id`),
  CONSTRAINT `blog_category_owner_id_96951406_fk_auth_user_id` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_category`
--

LOCK TABLES `blog_category` WRITE;
/*!40000 ALTER TABLE `blog_category` DISABLE KEYS */;
INSERT INTO `blog_category` VALUES (1,'1',1,1,'2019-06-06 10:14:03.379794',1),(2,'软件编程',0,1,'2019-07-21 14:53:48.095814',1),(3,'网络安全',0,1,'2019-07-21 14:54:13.678713',1),(4,'网络设备配置',0,1,'2019-07-21 14:54:28.430129',1),(5,'杂谈',0,1,'2019-10-23 13:40:54.329689',1);
/*!40000 ALTER TABLE `blog_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_post`
--

DROP TABLE IF EXISTS `blog_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `desc` longtext NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `content` longtext NOT NULL,
  `content_html` longtext NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `uv` int(10) unsigned NOT NULL,
  `pv` int(10) unsigned NOT NULL,
  `category_id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_post_category_id_c326dbf8_fk_blog_category_id` (`category_id`),
  KEY `blog_post_owner_id_ff7c9277_fk_auth_user_id` (`owner_id`),
  CONSTRAINT `blog_post_category_id_c326dbf8_fk_blog_category_id` FOREIGN KEY (`category_id`) REFERENCES `blog_category` (`id`),
  CONSTRAINT `blog_post_owner_id_ff7c9277_fk_auth_user_id` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_post`
--

LOCK TABLES `blog_post` WRITE;
/*!40000 ALTER TABLE `blog_post` DISABLE KEYS */;
INSERT INTO `blog_post` VALUES (2,'ospf原理与运行','OSPF(Open Shortest Path First开放式最短路径优先）是一个内部网关协议(Interior Gateway Protocol，简称IGP），用于在单一自治系统（autonomous system,AS）内决策路由。是对链路状态路由协议的一种实现，隶属内部网关协议（IGP），故运作于自治系统内部。著名的迪克斯加算法被用来计算最短路径树。OSPF支持负载均衡和基于服务类型的选路，也支持多种路由形式，如特定主机路由和子网路由等。',0,'fggfg','','2019-06-14 15:26:22.781836',44,44,4,1,'2019-07-22 22:08:07.297205'),(3,'xss攻击和防御','XSS攻击通常指的是通过利用网页开发时留下的漏洞，通过巧妙的方法注入恶意指令代码到网页，使用户加载并执行攻击者恶意制造的网页程序。这些恶意网页程序通常是JavaScript，但实际上也可以包括Java、 VBScript、ActiveX、 Flash 或者甚至是普通的HTML。攻击成功后，攻击者可能得到包括但不限于更高的权限（如执行一些操作）、私密网页内容、会话和cookie等各种内容。',0,'![](/media/editor/timg_20190614153114275762.jpg)','','2019-06-14 15:31:27.979223',10,10,3,1,'2019-07-22 22:08:07.297205'),(4,'python 数据结构浅谈','在计算机科学中，数据结构是一门进阶性课程，概念抽象，难度较大。Python语言的语法简单，交互性强。用Python来讲解数据结构等主题，比C语言等实现起来更为容易，更为清晰。',1,'![](/media/editor/timg_20190628215436467271.jpg)','<p><img src=\"/media/editor/timg_20190628215436467271.jpg\" alt=\"\"></p>\r\n','2019-06-28 21:54:50.364560',1,1,2,1,'2019-08-21 16:35:02.495690'),(5,'c语言程序设计','C语言是一门面向过程、抽象化的通用程序设计语言，广泛应用于底层开发。C语言能以简易的方式编译、处理低级存储器。C语言是仅产生少量的机器语言以及不需要任何运行环境支持便能运行的高效率程序设计语言。尽管C语言提供了许多低级处理的功能，但仍然保持着跨平台的特性，以一个标准规格写出的C语言程序可在包括一些类似嵌入式处理器以及超级计算机等作业平台的许多计算机平台上进行编译.',2,'```\r\nimport requests\r\nif a > 1:\r\n	a = 6\r\nelse:\r\n	a = 2\r\n```','<pre><code>import requests\r\nif a &gt; 1:\r\n    a = 6\r\nelse:\r\n    a = 2\r\n</code></pre>','2019-07-21 15:42:12.772126',1,1,2,1,'2019-08-21 16:34:24.363381'),(6,'celery+redis在django中的使用','celery是一个分布式任务队列框架，配合redis使用可实现程序的异步操作，本篇博客采用celery+redis实现异步操作，实现延迟向用户发送邮件，减少用户在页面等待的时间。',0,'# 0x01 起步\r\n### 1.1 安装依赖\r\n```\r\npip3 install django-celery\r\npip3 install Celery\r\npip3 install django-redis\r\npip3 insatll redis\r\n```\r\n\r\n### 1.2 本地安装redis\r\n本地安装redis不再详细阐述，按菜鸟教程[redis安装](https://www.runoob.com/redis/redis-install.html \"redis安装\")即可。\r\n\r\n### 1.3 环境\r\npython == 3.7\r\ndjango == 2.1.0\r\n\r\n\r\n# 0x01.5 开始之前\r\n```\r\npython manange.py runserver\r\ncelery -A project worker --loglevel=info\r\nredis-server.exe redis.windows.conf\r\n```\r\n\r\n# 0x02 开始\r\n### 2.1 将django-celery添加进INSTALL_APPS\r\n```\r\nINSTALLED_APPS = [\r\n    \'django.contrib.admin\',\r\n    \'django.contrib.auth\',\r\n    \'django.contrib.contenttypes\',\r\n    \'django.contrib.sessions\',\r\n    \'django.contrib.messages\',\r\n    \'django.contrib.staticfiles\',\r\n    \'blog\',\r\n    \'comment\',\r\n    \'config\',\r\n    \'mdeditor\',\r\n    \'FyBlog\',\r\n    \'login\',\r\n    \'djcelery\',\r\n\r\n]\r\n```\r\n\r\n### 2.2 在settings.py里设置相关配置\r\n```\r\n#############################\r\n#celery配置信息\r\n#############################\r\nimport djcelery\r\ndjcelery.setup_loader()\r\nBROKER_URL = \"redis://127.0.0.1:6379/0\" #redis默认配置\r\n\r\nCELERY_TIMEZONE = \'Asia/Shanghai\'\r\nCELERYBEAT_SCHDULER = \"djcelery.schedulers.DatabaseScheduler\"\r\n```\r\n\r\n### 2.3 创建celery.py文件\r\n在project目录下（与settings.py同级）创建celery.py文件,代码如下:\r\n```\r\n#隐式引入\r\nfrom __future__ import absolute_import,unicode_literals\r\nimport os\r\nfrom celery import Celery\r\nfrom django.conf import settings\r\n\r\nos.environ.setdefault(\"DJANGO_SETTINGS_MODULE\",\'project.settings\')\r\n\r\napp = Celery(\'project\')\r\napp.config_from_object(\"django.conf:settings\")\r\napp.autodiscover_tasks(lambda :settings.INSTALLED_APPS) #自动发现已注册app下的tasks.py文件\r\n```\r\n\r\n### 2.4 在app目录下编写tasks.py文件\r\n在你需要执行异步操作的app目录下创建tasks.py文件,代码如下:\r\n```\r\nfrom __future__ import absolute_import,unicode_literals\r\nfrom celery.task import task\r\nfrom project.celery import app\r\n\r\n@app.task\r\ndef add(x,y):\r\n	return x + y \r\n```\r\n至此，异步功能基本实现。\r\n\r\n# 0x03 验证\r\n\r\n### 3.1 验证是否执行异步操作\r\n```\r\npython manage.py shell\r\n```\r\n进入交互界面后\r\n```\r\nfrom app.tasks import add\r\nadd.delay(1,2)\r\n```\r\n> 结果返回<AsyncResult: bbc4eb32-a9d4-4014-9664-2066501c94b3>\r\n\r\n异步操作执行成功\r\n\r\n### 3.2 报错\r\n其实在windows10上执行celery4.x版本会报这样的错误:\r\n> Traceback (most recent call last):\r\n  File \"d:\\python37\\lib\\site-packages\\billiard\\pool.py\", line 362, in workloop\r\n    result = (True, prepare_result(fun(*args, **kwargs)))\r\n  File \"d:\\python37\\lib\\site-packages\\celery\\app\\trace.py\", line 544, in _fast_trace_task\r\n    tasks, accept, hostname = _loc\r\nValueError: not enough values to unpack (expected 3, got 0)\r\n\r\n具体的解决办法，我在百度上找到了一个解决办法，详情请见[Celery ValueError: not enough values to unpack (expected 3, got 0)的解决方案](https://blog.csdn.net/qq_30242609/article/details/79047660 \"Celery ValueError: not enough values to unpack (expected 3, got 0)的解决方案\")\r\n\r\n### 0x04 结语\r\n本人水平有限，本篇条目仅是celery最基础的用法，celery还可以进行定时操作，可能会在以后的条目中提到。\r\n***如有错误或者问题，请在下方评论留言吧！***','<h1 id=\"h1-0x01-\"><a name=\"0x01 起步\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>0x01 起步</h1><h3 id=\"h3-1-1-\"><a name=\"1.1 安装依赖\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>1.1 安装依赖</h3><pre><code>pip3 install django-celery\r\npip3 install Celery\r\npip3 install django-redis\r\npip3 insatll redis\r\n</code></pre><h3 id=\"h3-1-2-redis\"><a name=\"1.2 本地安装redis\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>1.2 本地安装redis</h3><p>本地安装redis不再详细阐述，按菜鸟教程<a href=\"https://www.runoob.com/redis/redis-install.html\" title=\"redis安装\">redis安装</a>即可。</p>\r\n<h3 id=\"h3-1-3-\"><a name=\"1.3 环境\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>1.3 环境</h3><p>python == 3.7<br>django == 2.1.0</p>\r\n<h1 id=\"h1-0x01-5-\"><a name=\"0x01.5 开始之前\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>0x01.5 开始之前</h1><pre><code>python manange.py runserver\r\ncelery -A project worker --loglevel=info\r\nredis-server.exe redis.windows.conf\r\n</code></pre><h1 id=\"h1-0x02-\"><a name=\"0x02 开始\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>0x02 开始</h1><h3 id=\"h3-2-1-django-celery-install_apps\"><a name=\"2.1 将django-celery添加进INSTALL_APPS\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>2.1 将django-celery添加进INSTALL_APPS</h3><pre><code>INSTALLED_APPS = [\r\n    &#39;django.contrib.admin&#39;,\r\n    &#39;django.contrib.auth&#39;,\r\n    &#39;django.contrib.contenttypes&#39;,\r\n    &#39;django.contrib.sessions&#39;,\r\n    &#39;django.contrib.messages&#39;,\r\n    &#39;django.contrib.staticfiles&#39;,\r\n    &#39;blog&#39;,\r\n    &#39;comment&#39;,\r\n    &#39;config&#39;,\r\n    &#39;mdeditor&#39;,\r\n    &#39;FyBlog&#39;,\r\n    &#39;login&#39;,\r\n    &#39;djcelery&#39;,\r\n\r\n]\r\n</code></pre><h3 id=\"h3-2-2-settings-py-\"><a name=\"2.2 在settings.py里设置相关配置\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>2.2 在settings.py里设置相关配置</h3><pre><code>#############################\r\n#celery配置信息\r\n#############################\r\nimport djcelery\r\ndjcelery.setup_loader()\r\nBROKER_URL = &quot;redis://127.0.0.1:6379/0&quot; #redis默认配置\r\n\r\nCELERY_TIMEZONE = &#39;Asia/Shanghai&#39;\r\nCELERYBEAT_SCHDULER = &quot;djcelery.schedulers.DatabaseScheduler&quot;\r\n</code></pre><h3 id=\"h3-2-3-celery-py-\"><a name=\"2.3 创建celery.py文件\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>2.3 创建celery.py文件</h3><p>在project目录下（与settings.py同级）创建celery.py文件,代码如下:</p>\r\n<pre><code>#隐式引入\r\nfrom __future__ import absolute_import,unicode_literals\r\nimport os\r\nfrom celery import Celery\r\nfrom django.conf import settings\r\n\r\nos.environ.setdefault(&quot;DJANGO_SETTINGS_MODULE&quot;,&#39;project.settings&#39;)\r\n\r\napp = Celery(&#39;project&#39;)\r\napp.config_from_object(&quot;django.conf:settings&quot;)\r\napp.autodiscover_tasks(lambda :settings.INSTALLED_APPS) #自动发现已注册app下的tasks.py文件\r\n</code></pre><h3 id=\"h3-2-4-app-tasks-py-\"><a name=\"2.4 在app目录下编写tasks.py文件\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>2.4 在app目录下编写tasks.py文件</h3><p>在你需要执行异步操作的app目录下创建tasks.py文件,代码如下:</p>\r\n<pre><code>from __future__ import absolute_import,unicode_literals\r\nfrom celery.task import task\r\nfrom project.celery import app\r\n\r\n@app.task\r\ndef add(x,y):\r\n    return x + y\r\n</code></pre><p>至此，异步功能基本实现。</p>\r\n<h1 id=\"h1-0x03-\"><a name=\"0x03 验证\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>0x03 验证</h1><h3 id=\"h3-3-1-\"><a name=\"3.1 验证是否执行异步操作\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>3.1 验证是否执行异步操作</h3><pre><code>python manage.py shell\r\n</code></pre><p>进入交互界面后</p>\r\n<pre><code>from app.tasks import add\r\nadd.delay(1,2)\r\n</code></pre><blockquote>\r\n<p>结果返回&lt;AsyncResult: bbc4eb32-a9d4-4014-9664-2066501c94b3&gt;</p>\r\n</blockquote>\r\n<p>异步操作执行成功</p>\r\n<h3 id=\"h3-3-2-\"><a name=\"3.2 报错\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>3.2 报错</h3><p>其实在windows10上执行celery4.x版本会报这样的错误:</p>\r\n<blockquote>\r\n<p>Traceback (most recent call last):<br>  File “d:\\python37\\lib\\site-packages\\billiard\\pool.py”, line 362, in workloop<br>    result = (True, prepare_result(fun(<em>args, *</em>kwargs)))<br>  File “d:\\python37\\lib\\site-packages\\celery\\app\\trace.py”, line 544, in _fast_trace_task<br>    tasks, accept, hostname = _loc<br>ValueError: not enough values to unpack (expected 3, got 0)</p>\r\n</blockquote>\r\n<p>具体的解决办法，我在百度上找到了一个解决办法，详情请见<a href=\"https://blog.csdn.net/qq_30242609/article/details/79047660\" title=\"Celery ValueError: not enough values to unpack (expected 3, got 0)的解决方案\">Celery ValueError: not enough values to unpack (expected 3, got 0)的解决方案</a></p>\r\n<h3 id=\"h3-0x04-\"><a name=\"0x04 结语\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>0x04 结语</h3><p>本人水平有限，本篇条目仅是celery最基础的用法，celery还可以进行定时操作，可能会在以后的条目中提到。<br><strong><em>如有错误或者问题，请在下方评论留言吧！</em></strong></p>\r\n','2019-08-16 19:42:39.664201',15,15,2,1,'2019-08-17 19:02:10.645247'),(12,'棋魂真正的结局（转载）','棋魂本来不是23棋结局\r\n是因为在北斗杯篇,因为韩国棋士高永夏的设定,\r\n引来韩国方面的不满,为了平息事件,集英社方面在故事才让韩国胜出,\r\n而且暂停连载(甚至完结),大家又点睇?\r\n节录内文:\r\n棋魂书中出场人物常有影射现实棋士,高永夏的狂傲形象,影射的是南韩天才少年李世石,并且其实影射得很棒,\r\n除了长相外,李世石就是这样的人,韩国读者受不受得了,则是另一回事\r\n原著作者就是这样子....因为被人告....所以就无法 连载下去\r\n结局咁早完 因为引来韩国不满 所以暂停连载 所以作到光仔输左\r\n就是这样子...棋魂就结局都没有\r\n但是给我在网上找到原著...棋魂结局...\r\n我本人很喜欢棋魂.........\r\n以下就是真正的结局.........',0,'前回提要：自从塔矢行洋老师引退之后到目前为止，日本围棋界各头衔战接二连三的被年轻一辈所胜出：\r\n塔矢亮继承父亲成为新一代名人，绪方精次在获得十段头衔之后又赢得了棋圣和天元两个头衔，不久之后，仓田八段也摘取了王座的头衔，目前仍然保留头衔的老一辈棋手中，只剩下桑原本因方了。\r\n而进藤光，刚刚晋升为四段的17岁少年，终于打入「本因方」循环赛，并击败对手越智、和谷等人，获得向桑原老师挑战的资格！\r\n而为期两天的「本因方」挑战赛，光仔的表现令人刮目相看，尽管是第一次参加头衔战，他不仅没有怯场，反而恰到好处地给桑原老师以回击，到第七场比赛开始之前，他们打成了3：3的平局，那么最后的关键一局情况会怎么样呢？\r\n「进藤光……他终于走到这一步了……！」围棋周刊的编辑三宅先生一边看着直播的荧幕一边感叹。\r\n「这应该是他第一次参加头衔战吧，表现不俗啊！」仓田先生吃着荞麦面，却目不转睛地望着电视机。\r\n而塔矢、绪方等人都聚集在日本棋院的直播间里，等待着第七局的结果。\r\n「按照现在的情形，进藤胜出的可能并非没有呢。」\r\n绪方吐出一个烟圈，缓缓地说。\r\n「进藤……你终于开始发挥实力了吗？……」\r\n塔矢虽然没有回答绪方的话，却在心中默默地想着，不禁回忆起四年前他们的第一次对战：「你的棋力有几段？」\r\n「我也不知道……应该比较厉害吧！」\r\n「不知道却说比较厉害，啊哈哈……！」\r\n\r\n定石的手法很古老，下子的手势很外行，可是，自己却真的败在他的手上了。\r\n但，为什么在中学团体赛的时候遇到的他，棋艺一下子退步那么多呢？\r\n「在你的心中，有另外一个你……在围棋会所跟我下过两次棋，那是……SAI！抑或\r\n是……现在的你？」塔矢看着「幽玄棋室」中专心致志下棋的光仔，心中充满了疑问。\r\n\r\n时间一点一点过去，离第七局开始已经过了四个多小时，桑原老师渐渐露出了疲态。\r\n「不行了吗……？毕竟年事已高了啊……」桑原老师的手指夹着白子，久久没有落子，「日本的围棋界，真的已经刮起一阵年轻的风呢……！」\r\n「但是，进藤光，你有资格从我的地方夺走本因方的头衔吗？」桑原老师那狭长的眼隙中射出精灵般的光芒，「如果有的话，就在这里打败我吧！」他将一颗白子「啪！」得定在出乎意料的地方。\r\n观战的人们均是一惊：\r\n「竟然还有这一手？！不愧是桑原老师……」可是，光仔却没有慌张。\r\n他慢慢地收起手中的折扇，不慌不忙地执起黑子。\r\n「进藤，你要怎么应付呢？」塔矢仔细地观摩着棋局，暗暗地想。\r\n优雅而纤细的手势，冷静而自信的微笑，光仔下出了关键的一步。\r\n「什么？！？！」这一步棋顿时引起场内场外一阵喧哗。\r\n桑原老师吃惊地看着光仔的落子，围棋周刊的三宅先生和做报道的记者们都发出了惊叹，而更多的人，仓田、绪方、塔矢、伊角、越智、和谷、森下、白川等一干职业棋手脸上则浮现出更为奇特的表情，\r\n那与其说是惊讶，不如说是─骇异！因为他们的脑海中同时浮现出一个人─「本因方……秀策！！！」\r\n「幽玄棋室」中，再一次出现了短暂的沉默。\r\n「佐为，你看得到吗？……现在我所下的棋。」\r\n光仔凝神在棋局上，脑海中浮现起第一次和佐为来这里下棋的情形，—那是他成为新初段后的幼狮战，与塔矢行洋老师的对决。\r\n来到这间充满了幽玄气氛的棋室里，佐为他禁不住就想亲自上阵呢！还和光仔闹起别\r\n扭。\r\n「佐为那家伙，总是叫嚷着要下棋呢……」光仔默默地怀想着。\r\n「可是，如果不是你曾经那么无私地站在我身后，就没有现在的我！」\r\n他的手紧紧地握着折扇。\r\n「我的棋中，有你的存在……佐为，你一定看得到我所下的每一步吧……」\r\n桑原老师陷入了苦思冥想中，而光仔的思绪依然沉浸在过往的回忆里。\r\n「本因方秀策……就是佐为你啊，……所以，这一局我一定要赢！」\r\n他抬起头，眼眸中露出坚定的神情。\r\n桑原老师的心理防线终于崩溃了。「我认输了……」\r\n他低下了头。\r\n东京日本棋院再次掀起喧哗。\r\n「我想我确实……应该让位了……」桑原老师的脸上露出难得一见的和蔼笑容，「日本围棋界需要一股年轻的风呵……少年，你赢了！」\r\n「谢谢……桑原老师您的指教！」\r\n光仔的眼里浮出一层柔和的银光，他站起身走到桑原老师的面前，大声地说。\r\n\r\n历时两天的「本因方」挑战赛终于结束了，而新的本因方也就此诞生—进藤本因方。\r\n就这样，以绪方精次、仓田厚、塔矢亮和进藤光为首的新一代日本围棋界顶尖高手终成定局，\r\n老一辈的棋士们也在完成了自己的使命后退出了职业棋坛的舞台。\r\n然而，故事并没有完结，因为还有来自韩国和中国等职业棋手的威胁，以及更年轻的后辈们的挑战呀！\r\n\r\n走出「幽玄棋室」，难缠的媒体们倾巢出动，把光仔围得水泄不通。\r\n「哎呀，真糟糕！」光仔望着铺天盖地的采访者，脑后掉下一滴汗。\r\n幸亏三宅先生帮忙解了围。\r\n「各位，进藤本因方刚刚下完比赛，让他休息一下再做采访吧！这也是媒体应有的职业道德呀！」\r\n「说的好听，结果还不是想周刊围棋做独家采访？」\r\n虽然有些记者们这么嘟囔着，但是三宅先生是有威信的报刊编辑，大家也总算「放过」了光仔。\r\n「啊，真是太谢谢你了，三宅先生。」\r\n「太客气了，进藤老师。应该要先祝贺A吧！」\r\n「不……别称呼我老师行吗？」光仔吐了吐舌头，「还是像以前那样叫吧，很不习惯呢！」\r\n三宅先生刚想回答，只听到从身后传来塔矢亮那沉静的声音。\r\n「进藤，祝贺你。」\r\n「塔矢……」\r\n进藤回过头，看到了穿着西服的塔矢和绪方。\r\n「谢谢。」\r\n他也以平静的口吻回答他。\r\n「话说回来，你真的变强了呢……四年多前，那个让我觉得深不可测的进藤终于回来\r\n了……」\r\n塔矢望着他的眼睛，极力地想寻找些什么。\r\n光仔迟疑了一下，突然问道：\r\n「塔矢，我问你：四年前的我和现在的我相比，哪一个比较厉害？」\r\n「嗯……不相上下呢。」\r\n「真的吗？不相上下啊……」\r\n光仔不相信地问。\r\n「啊，我的意思不是说你没有进步呀……因为我也在进步呢！」\r\n塔矢会错了意，忙补充道。\r\n「不……能说不相上下就已经……是最好的评价了……」\r\n光仔抬起头，仰望着天空中飞翔的鸟儿。\r\n「塔矢，能陪我去一个地方吗？」\r\n「什么地方？」\r\n「因岛。——本因方秀策的出生地！」\r\n两位年轻的棋士，怀着各异的心情，一同PowerZone上了前往广岛的列车。\r\n「哪，进藤，为什么突然要去那地方呀？」\r\n塔矢还是有些疑惑。\r\n「因为……我觉得会有什么好事在那里发生呢！」\r\n光仔神秘地一笑。\r\n「我的心中，有另一个我。」\r\n「哎？」\r\n「两年多前，你不是这样对我说吗？」\r\n「可那是我的胡言乱语呀！」\r\n塔矢的脸红了，但是光仔却面色严肃。\r\n「塔矢，你并没有猜错，我的心中，有另外一个我；一个可以和本因方秀策媲美的\r\n我……想知道原因的话，到了因岛我会告诉你哟！」\r\n「是这样子吗？……」\r\n几经转车，他们终于踏上了因岛的土地。\r\n海滨的空气异常清新，到处可见翱翔的海鸟，感受到与东京截然不同的舒适气氛，塔矢与光仔不禁精神一振。\r\n「怎么说呢，真的感觉好象会有好事发生的样子耶！」\r\n光仔深吸了一口气。\r\n「你以前就来过这里吗？」\r\n塔矢见他熟门熟路的，便问道。\r\n「是啊，很匆忙地来过一趟。你呢？」\r\n「我只去过东京的秀策墓地。」\r\n「那这里应该有很多地方值得你去呀！」\r\n光仔拉拉他的衣服，「我们快走吧。第一站：秀策纪念馆。」\r\n「秀策纪念馆？」\r\n「嗯，秀策的出生地呀。」\r\n\r\n带有和式风格的庙会展现在两人面前，篱墙围着的庭园里立着一块大理石碑，上书「日本第一棋圣本因方秀策」几个大字。\r\n欣赏着幽静的风景，光仔回忆起曾经为了寻找佐为而特意来此的情形；秀策纪念馆的景致似乎一点也没有改变，然而来访者的心情却不同昔日呢。\r\n「就是这里吗？」\r\n他们停在一间屋子前，在门口玄关处换上拖鞋。\r\n柔和的阳光穿过薄薄的窗帘透进朴素的房间，窗边一盆淡雅素洁的菖蒲花正悄然绽放。\r\n明凈的玻璃柜子里，整齐地陈列着秀策的遗物：带着四脚的棋盘，散乱的棋子，已经有些泛黄的棋谱，还有歌舞伎的道具，字画卷轴，油纸伞，横笛，桧扇等等100多年江户时代的器物。\r\n「保存得可真完整呀。」\r\n塔矢一件件浏览过去，发出了感叹。\r\n「还有呢，我们去看看秀策的墓地吧。」\r\n光仔似乎有些等不及的样子，拉着塔矢来到后山的墓地。\r\n「不只是秀策，历代所有的本因方之墓都在这儿哪！」\r\n塔矢边走边观察，随着光仔来到一座青灰色的石碑前，看到上面用工整的字体写着「秀策四量墓」这五个字。\r\n墓碑的雕花基石旁，放着前来拜谒的人所留下的白菊花。\r\n他们不约而同地驻足在这墓碑边，没有说一句话。\r\n风飒飒地吹过，可以听见啁啾的鸟声；白菊花的叶子上沾着晶莹的水珠。\r\n「本因方秀策啊……」\r\n第一次，如此接近的感觉到这位江户时代的棋圣，尽管从那至今已经过了100多年，可是现在的棋艺是不是超越了那个时代呢……？\r\n墓地里非常的安静，仿佛不愿吵醒安睡在这里的灵魂。一个身穿褐衣的僧人，长时间地伫立在墓地中；偶尔会有一只受了惊吓的鸟破林而出，才稍微显出这里的生机。\r\n「果然……还是不在啊……虽然早就猜到了……」\r\n光仔颇觉失望。\r\n「谁不在啊？」\r\n塔矢侧脸问道。\r\n「不，没什么。我们再去一处地方吧。」\r\n「呃？」\r\n「竹原的宝泉寺啊，秀策曾在那里下过棋。喂，我们要不要用那时的棋盘来下一局？」\r\n「好是好，不过……那么珍贵的东西，收藏的管理员会让我们使用吗？」\r\n「没问题的啦，那里涨悝B是很好说话的人！走啊！」\r\n「知道了啦，你不要扯我的袖子嘛……」\r\n光仔迫不及待地拉着塔矢来到宝泉寺，他们屏气敛神地走过那些阒无人声的厢房，来到收藏秀策棋盘的那一间屋子里。\r\n「这就是当时使用过的棋盘，小兄弟，我记得你好象来过吧。」\r\n管理员大叔似乎认出了光仔。\r\n「哎，两年前来过呢。大叔记性真好！」\r\n「呵呵，因为会两次来这里的人并不多见呀。小兄弟，你也会下围棋吗？」\r\n听着那个大叔近乎于没有常识的问题，塔矢和光仔相视一笑。\r\n「大叔，你能让我们用这个棋盘下一局棋吗？」\r\n「可以呀，这里是棋子。」\r\n那个管理员很大方地说，还把当时所用的棋子也拿了出来，又叮嘱他们：\r\n「不过，还是要尽量小心一点啊。」\r\n「是！」\r\n塔矢和光仔异口同声地答道，很快地相对而坐在棋盘的两边。那大叔微笑着看了看他\r\n们，便起身走出门去。\r\n「呀，我用黑子。」\r\n猜子的结果，是光仔执黑子，塔矢执白子。\r\n「和那个时候一样呢。」\r\n不知道是有意还是无意，塔矢冒出一句话。\r\n「……是呀，不过，和你对决的人可不一样哦。」\r\n光仔在「星」的位置下了第一手。\r\n「这是什么意思？」\r\n塔矢也同样下了「星」。\r\n「在我的心里，曾经存在有另一个我。」\r\n光仔一边落子，一边说。\r\n「他是平安时代的棋士，以前在本因方秀策的心中复活，100多年后又复活在我的心\r\n里，借着我的身体继续下围棋。—为了达到神之一招！」\r\n光仔的脸色很平静，尽管叙述的是一个并不平静的故事。\r\n「那么，曾经和我在围棋会馆下过棋的人果然……」\r\n「是佐为呀，那个复活在我心中的棋魂，——藤原佐为；也是网上那个打败你爸爸的\r\nSAI。」\r\n「藤原……佐为……SAI？」\r\n塔矢重复着这些名字，光仔继续说下去。\r\n「我在佐为的影响下开始下围棋，而且，以你为目标……可是有一天，佐为消失了；就是在我成为新初段后不久。」\r\n「是你连续不战而败的那段低潮期吗？」\r\n「没错。我为了寻找佐为，来到过这里。可是，他彻底地消失了……」\r\n光仔低垂着眼帘说。\r\n「真不敢相信，这个世界居然真的有鬼怪的存在。」\r\n虽然已经猜到些什么，这个匪夷所思的故事还是让塔矢感到不可思议。\r\n「现在你明白了吧，为什么我的棋艺一下子好一下子坏了吧。因为我是个蠢材，光想着自己下自己下，完全没有考虑佐为的心情……」直到今天，他还是把佐为消失的责任归咎在自己身上。\r\n「我也要跟你说对不起，塔矢，我知道你很想和佐为下，可是就因为我的缘故你们下棋的机会很少……我想佐为他，一定是带着遗憾离开这个世界的吧。」\r\n光仔的眼中涌起一种酸酸的感觉，一想到佐为的消失，他还是无法克制悲伤的心情。\r\n「不……我认为不是那样子的。」\r\n塔矢的眼中亮着光芒。\r\n「哎？」\r\n光仔不解地看着塔矢。\r\n「因为，我想他应该和我们一样，发现了你的光芒，你的与众不同之处。我想，他一定是带着希望和欣慰离开你的，他相信你可以完成他所没有完成的事情，.....神之一招\r\n！」「神……之……一……招？」\r\n光仔听到这个词的时候，心中划过一丝奇异的感觉。\r\n这个时候，房间里想起一个声音。\r\n「是呀，小光，塔矢亮说的没错。」\r\n听到这个熟悉又陌生，亲切又温柔的声音，光仔的心一下子定住了。\r\n「进藤，你怎么了？刚刚好象有人叫你哎！」\r\n是佐为吗？是佐为吗？光仔睁大眼睛朝着四处问道。\r\n「你也听到了是不是？是佐为啊！！！！」\r\n他大声对塔矢说。\r\n「佐为！佐为！你在吗？你在这里是吗？」\r\n光仔急切地在房间里寻找。\r\n「佐为！我一直在找你啊！你在哪里呢？」\r\n「进藤！你看这棋盘！」\r\n塔矢突然说。\r\n棋盘上空的空气发生一阵异常的波动，两个少年目不转睛地盯着那地方，突然之间，在空气中浮现出一位戴着高帽的平安棋士的身影。锦衣朱唇，长发轻扬，不是佐为是谁？！\r\n「佐为！！」\r\n光仔激动地跑上前。\r\n「我是佐为，藤原佐为，一个平安时代的棋士。小光，我一直在等你呀。」\r\n「你就是……进藤所说的……藤原佐为吗？」塔矢也吃惊地看着那个神秘的身影。\r\n「正是，很荣幸曾跟你和你的父亲交过手啊。」佐为微微的笑着。\r\n「佐为！你原来没有消失啊！回到我身边来呀，佐为！以后我把所以的棋都给你下啊！\r\n不要……不要再离开我呀！」\r\n光仔哭喊着说。\r\n「小光，我其实一直都在你的身边呀。」带着优雅而高贵的笑颜，佐为温柔地说。\r\n「我的形体虽然已经消失了，可是我的棋局和我的存在，却融化在你的每一步棋中\r\n了……」\r\n「小光，你知道吗？虎次郎是为了我而存在的，而我是为了你而存在的呵……」\r\n「围棋就是这样，才会一代一代相传下去，总有一天，你也会发现那个你为之存在的人吧……」\r\n「什么存在不存在我不管啦！我只要你回到我身边就可以了！求求你！只要像我们刚认识的时候一样就好了……」\r\n「你错了，小光。现在的我，已经没有什么可以教你的了，神之一招……你要自己用心去体会……」\r\n「佐为！佐为！你别走啊！佐为！我还有许多话要跟你说呢！佐为！」\r\n不管光仔如何呼喊，那绚丽的面颜在空气中逐渐黯淡下去，最终消失于无形。\r\n「佐为！佐为！佐为！！！佐为啊！！！！！」\r\n「他已经消失啦！进藤！」看着光仔不顾一切地在棋盘四处寻找，塔矢不禁提醒他。\r\n「为什么？为什么？佐为！为什么呀？……」光仔痛苦地跪在棋盘前，喃喃自语。\r\n「进藤，他已经说得很清楚了。」\r\n耳边，塔矢的声音传来。「他是完成了自己的使命而走的，将棋艺留传给后人的使命……他是为了将围棋传给他的后代而存在，同样，我们也是为了我们的后代而存在……」\r\n「可是，我想和佐为下棋啊，我们一直都是好朋友啊……」虽然也知道佐为的心意，光仔还是低着头哭泣。\r\n「进藤，你别忘了，还有我们啊！你忘了你现在的身份了吗？你是新一代的本因方啊！\r\n本因方秀策曾获得的荣誉，现在正由你承受着啊！」塔矢一把拉起他。\r\n「为了达到神之一招，我们还有很多路要走呢……」\r\n「神之一招……吗？」光仔轻轻地重复说。\r\n「没错，我们不是一直都以这个为目标吗？……而且，即使在我们有生之年无法达到，也要像佐为一样，寻找到可以继承围棋的后人哪……」\r\n听着塔矢的话，光仔逐渐停止了啜泣。\r\n「那，我以后还能再见到佐为吗？」他看着秀策用过的棋盘问。\r\n「佐为不是一直都和你在一起吗？在你的棋当中……你不是说因为你的缘故而使我错失了和他交手的机会吗？\r\n那么，你现在就要代替他补偿我喽？……」\r\n塔矢看着光仔，眼中燃烧起竞争的火焰。光仔默默地收起了泪水。塔矢亮，一生的劲敌啊……\r\n「你说的不错，我必须，继续下围棋！」\r\n「和你，和绪方老师，和仓田先生，和所有的人！」\r\n「只有这么做，才能让佐为继续存在下去！」\r\n他说着又重新做到原来的位子上。「现在，我们把这一局结束吧。」\r\n塔矢的嘴边浮现出一丝不易察觉的微笑。「你还没有赢过我呢！」\r\n他执起白子很快地落子。\r\n光仔用袖子擦干残留在眼角的泪水，立刻回了一子。「我不会再轻易输给你了！」\r\n「出这招吗？看我的！」\r\n隐约，浮现了佐为的身影。\r\n在两个少年你来我往的执子、落子中，棋盘间隐约浮现出佐为的身影。可是，他们谁都没有再注意。因为，他们都正朝着新的目标奋斗着……\r\n还是像以往那样，佐为微笑着，俯视为了达到「神之一招」的年轻的棋士们，佐为微笑着。\r\n「围棋，就是这样一代一代相传下去的啊，小光……」','<p>前回提要：自从塔矢行洋老师引退之后到目前为止，日本围棋界各头衔战接二连三的被年轻一辈所胜出：<br>塔矢亮继承父亲成为新一代名人，绪方精次在获得十段头衔之后又赢得了棋圣和天元两个头衔，不久之后，仓田八段也摘取了王座的头衔，目前仍然保留头衔的老一辈棋手中，只剩下桑原本因方了。<br>而进藤光，刚刚晋升为四段的17岁少年，终于打入「本因方」循环赛，并击败对手越智、和谷等人，获得向桑原老师挑战的资格！<br>而为期两天的「本因方」挑战赛，光仔的表现令人刮目相看，尽管是第一次参加头衔战，他不仅没有怯场，反而恰到好处地给桑原老师以回击，到第七场比赛开始之前，他们打成了3：3的平局，那么最后的关键一局情况会怎么样呢？<br>「进藤光……他终于走到这一步了……！」围棋周刊的编辑三宅先生一边看着直播的荧幕一边感叹。<br>「这应该是他第一次参加头衔战吧，表现不俗啊！」仓田先生吃着荞麦面，却目不转睛地望着电视机。<br>而塔矢、绪方等人都聚集在日本棋院的直播间里，等待着第七局的结果。<br>「按照现在的情形，进藤胜出的可能并非没有呢。」<br>绪方吐出一个烟圈，缓缓地说。<br>「进藤……你终于开始发挥实力了吗？……」<br>塔矢虽然没有回答绪方的话，却在心中默默地想着，不禁回忆起四年前他们的第一次对战：「你的棋力有几段？」<br>「我也不知道……应该比较厉害吧！」<br>「不知道却说比较厉害，啊哈哈……！」</p>\r\n<p>定石的手法很古老，下子的手势很外行，可是，自己却真的败在他的手上了。<br>但，为什么在中学团体赛的时候遇到的他，棋艺一下子退步那么多呢？<br>「在你的心中，有另外一个你……在围棋会所跟我下过两次棋，那是……SAI！抑或<br>是……现在的你？」塔矢看着「幽玄棋室」中专心致志下棋的光仔，心中充满了疑问。</p>\r\n<p>时间一点一点过去，离第七局开始已经过了四个多小时，桑原老师渐渐露出了疲态。<br>「不行了吗……？毕竟年事已高了啊……」桑原老师的手指夹着白子，久久没有落子，「日本的围棋界，真的已经刮起一阵年轻的风呢……！」<br>「但是，进藤光，你有资格从我的地方夺走本因方的头衔吗？」桑原老师那狭长的眼隙中射出精灵般的光芒，「如果有的话，就在这里打败我吧！」他将一颗白子「啪！」得定在出乎意料的地方。<br>观战的人们均是一惊：<br>「竟然还有这一手？！不愧是桑原老师……」可是，光仔却没有慌张。<br>他慢慢地收起手中的折扇，不慌不忙地执起黑子。<br>「进藤，你要怎么应付呢？」塔矢仔细地观摩着棋局，暗暗地想。<br>优雅而纤细的手势，冷静而自信的微笑，光仔下出了关键的一步。<br>「什么？！？！」这一步棋顿时引起场内场外一阵喧哗。<br>桑原老师吃惊地看着光仔的落子，围棋周刊的三宅先生和做报道的记者们都发出了惊叹，而更多的人，仓田、绪方、塔矢、伊角、越智、和谷、森下、白川等一干职业棋手脸上则浮现出更为奇特的表情，<br>那与其说是惊讶，不如说是─骇异！因为他们的脑海中同时浮现出一个人─「本因方……秀策！！！」<br>「幽玄棋室」中，再一次出现了短暂的沉默。<br>「佐为，你看得到吗？……现在我所下的棋。」<br>光仔凝神在棋局上，脑海中浮现起第一次和佐为来这里下棋的情形，—那是他成为新初段后的幼狮战，与塔矢行洋老师的对决。<br>来到这间充满了幽玄气氛的棋室里，佐为他禁不住就想亲自上阵呢！还和光仔闹起别<br>扭。<br>「佐为那家伙，总是叫嚷着要下棋呢……」光仔默默地怀想着。<br>「可是，如果不是你曾经那么无私地站在我身后，就没有现在的我！」<br>他的手紧紧地握着折扇。<br>「我的棋中，有你的存在……佐为，你一定看得到我所下的每一步吧……」<br>桑原老师陷入了苦思冥想中，而光仔的思绪依然沉浸在过往的回忆里。<br>「本因方秀策……就是佐为你啊，……所以，这一局我一定要赢！」<br>他抬起头，眼眸中露出坚定的神情。<br>桑原老师的心理防线终于崩溃了。「我认输了……」<br>他低下了头。<br>东京日本棋院再次掀起喧哗。<br>「我想我确实……应该让位了……」桑原老师的脸上露出难得一见的和蔼笑容，「日本围棋界需要一股年轻的风呵……少年，你赢了！」<br>「谢谢……桑原老师您的指教！」<br>光仔的眼里浮出一层柔和的银光，他站起身走到桑原老师的面前，大声地说。</p>\r\n<p>历时两天的「本因方」挑战赛终于结束了，而新的本因方也就此诞生—进藤本因方。<br>就这样，以绪方精次、仓田厚、塔矢亮和进藤光为首的新一代日本围棋界顶尖高手终成定局，<br>老一辈的棋士们也在完成了自己的使命后退出了职业棋坛的舞台。<br>然而，故事并没有完结，因为还有来自韩国和中国等职业棋手的威胁，以及更年轻的后辈们的挑战呀！</p>\r\n<p>走出「幽玄棋室」，难缠的媒体们倾巢出动，把光仔围得水泄不通。<br>「哎呀，真糟糕！」光仔望着铺天盖地的采访者，脑后掉下一滴汗。<br>幸亏三宅先生帮忙解了围。<br>「各位，进藤本因方刚刚下完比赛，让他休息一下再做采访吧！这也是媒体应有的职业道德呀！」<br>「说的好听，结果还不是想周刊围棋做独家采访？」<br>虽然有些记者们这么嘟囔着，但是三宅先生是有威信的报刊编辑，大家也总算「放过」了光仔。<br>「啊，真是太谢谢你了，三宅先生。」<br>「太客气了，进藤老师。应该要先祝贺A吧！」<br>「不……别称呼我老师行吗？」光仔吐了吐舌头，「还是像以前那样叫吧，很不习惯呢！」<br>三宅先生刚想回答，只听到从身后传来塔矢亮那沉静的声音。<br>「进藤，祝贺你。」<br>「塔矢……」<br>进藤回过头，看到了穿着西服的塔矢和绪方。<br>「谢谢。」<br>他也以平静的口吻回答他。<br>「话说回来，你真的变强了呢……四年多前，那个让我觉得深不可测的进藤终于回来<br>了……」<br>塔矢望着他的眼睛，极力地想寻找些什么。<br>光仔迟疑了一下，突然问道：<br>「塔矢，我问你：四年前的我和现在的我相比，哪一个比较厉害？」<br>「嗯……不相上下呢。」<br>「真的吗？不相上下啊……」<br>光仔不相信地问。<br>「啊，我的意思不是说你没有进步呀……因为我也在进步呢！」<br>塔矢会错了意，忙补充道。<br>「不……能说不相上下就已经……是最好的评价了……」<br>光仔抬起头，仰望着天空中飞翔的鸟儿。<br>「塔矢，能陪我去一个地方吗？」<br>「什么地方？」<br>「因岛。——本因方秀策的出生地！」<br>两位年轻的棋士，怀着各异的心情，一同PowerZone上了前往广岛的列车。<br>「哪，进藤，为什么突然要去那地方呀？」<br>塔矢还是有些疑惑。<br>「因为……我觉得会有什么好事在那里发生呢！」<br>光仔神秘地一笑。<br>「我的心中，有另一个我。」<br>「哎？」<br>「两年多前，你不是这样对我说吗？」<br>「可那是我的胡言乱语呀！」<br>塔矢的脸红了，但是光仔却面色严肃。<br>「塔矢，你并没有猜错，我的心中，有另外一个我；一个可以和本因方秀策媲美的<br>我……想知道原因的话，到了因岛我会告诉你哟！」<br>「是这样子吗？……」<br>几经转车，他们终于踏上了因岛的土地。<br>海滨的空气异常清新，到处可见翱翔的海鸟，感受到与东京截然不同的舒适气氛，塔矢与光仔不禁精神一振。<br>「怎么说呢，真的感觉好象会有好事发生的样子耶！」<br>光仔深吸了一口气。<br>「你以前就来过这里吗？」<br>塔矢见他熟门熟路的，便问道。<br>「是啊，很匆忙地来过一趟。你呢？」<br>「我只去过东京的秀策墓地。」<br>「那这里应该有很多地方值得你去呀！」<br>光仔拉拉他的衣服，「我们快走吧。第一站：秀策纪念馆。」<br>「秀策纪念馆？」<br>「嗯，秀策的出生地呀。」</p>\r\n<p>带有和式风格的庙会展现在两人面前，篱墙围着的庭园里立着一块大理石碑，上书「日本第一棋圣本因方秀策」几个大字。<br>欣赏着幽静的风景，光仔回忆起曾经为了寻找佐为而特意来此的情形；秀策纪念馆的景致似乎一点也没有改变，然而来访者的心情却不同昔日呢。<br>「就是这里吗？」<br>他们停在一间屋子前，在门口玄关处换上拖鞋。<br>柔和的阳光穿过薄薄的窗帘透进朴素的房间，窗边一盆淡雅素洁的菖蒲花正悄然绽放。<br>明凈的玻璃柜子里，整齐地陈列着秀策的遗物：带着四脚的棋盘，散乱的棋子，已经有些泛黄的棋谱，还有歌舞伎的道具，字画卷轴，油纸伞，横笛，桧扇等等100多年江户时代的器物。<br>「保存得可真完整呀。」<br>塔矢一件件浏览过去，发出了感叹。<br>「还有呢，我们去看看秀策的墓地吧。」<br>光仔似乎有些等不及的样子，拉着塔矢来到后山的墓地。<br>「不只是秀策，历代所有的本因方之墓都在这儿哪！」<br>塔矢边走边观察，随着光仔来到一座青灰色的石碑前，看到上面用工整的字体写着「秀策四量墓」这五个字。<br>墓碑的雕花基石旁，放着前来拜谒的人所留下的白菊花。<br>他们不约而同地驻足在这墓碑边，没有说一句话。<br>风飒飒地吹过，可以听见啁啾的鸟声；白菊花的叶子上沾着晶莹的水珠。<br>「本因方秀策啊……」<br>第一次，如此接近的感觉到这位江户时代的棋圣，尽管从那至今已经过了100多年，可是现在的棋艺是不是超越了那个时代呢……？<br>墓地里非常的安静，仿佛不愿吵醒安睡在这里的灵魂。一个身穿褐衣的僧人，长时间地伫立在墓地中；偶尔会有一只受了惊吓的鸟破林而出，才稍微显出这里的生机。<br>「果然……还是不在啊……虽然早就猜到了……」<br>光仔颇觉失望。<br>「谁不在啊？」<br>塔矢侧脸问道。<br>「不，没什么。我们再去一处地方吧。」<br>「呃？」<br>「竹原的宝泉寺啊，秀策曾在那里下过棋。喂，我们要不要用那时的棋盘来下一局？」<br>「好是好，不过……那么珍贵的东西，收藏的管理员会让我们使用吗？」<br>「没问题的啦，那里涨悝B是很好说话的人！走啊！」<br>「知道了啦，你不要扯我的袖子嘛……」<br>光仔迫不及待地拉着塔矢来到宝泉寺，他们屏气敛神地走过那些阒无人声的厢房，来到收藏秀策棋盘的那一间屋子里。<br>「这就是当时使用过的棋盘，小兄弟，我记得你好象来过吧。」<br>管理员大叔似乎认出了光仔。<br>「哎，两年前来过呢。大叔记性真好！」<br>「呵呵，因为会两次来这里的人并不多见呀。小兄弟，你也会下围棋吗？」<br>听着那个大叔近乎于没有常识的问题，塔矢和光仔相视一笑。<br>「大叔，你能让我们用这个棋盘下一局棋吗？」<br>「可以呀，这里是棋子。」<br>那个管理员很大方地说，还把当时所用的棋子也拿了出来，又叮嘱他们：<br>「不过，还是要尽量小心一点啊。」<br>「是！」<br>塔矢和光仔异口同声地答道，很快地相对而坐在棋盘的两边。那大叔微笑着看了看他<br>们，便起身走出门去。<br>「呀，我用黑子。」<br>猜子的结果，是光仔执黑子，塔矢执白子。<br>「和那个时候一样呢。」<br>不知道是有意还是无意，塔矢冒出一句话。<br>「……是呀，不过，和你对决的人可不一样哦。」<br>光仔在「星」的位置下了第一手。<br>「这是什么意思？」<br>塔矢也同样下了「星」。<br>「在我的心里，曾经存在有另一个我。」<br>光仔一边落子，一边说。<br>「他是平安时代的棋士，以前在本因方秀策的心中复活，100多年后又复活在我的心<br>里，借着我的身体继续下围棋。—为了达到神之一招！」<br>光仔的脸色很平静，尽管叙述的是一个并不平静的故事。<br>「那么，曾经和我在围棋会馆下过棋的人果然……」<br>「是佐为呀，那个复活在我心中的棋魂，——藤原佐为；也是网上那个打败你爸爸的<br>SAI。」<br>「藤原……佐为……SAI？」<br>塔矢重复着这些名字，光仔继续说下去。<br>「我在佐为的影响下开始下围棋，而且，以你为目标……可是有一天，佐为消失了；就是在我成为新初段后不久。」<br>「是你连续不战而败的那段低潮期吗？」<br>「没错。我为了寻找佐为，来到过这里。可是，他彻底地消失了……」<br>光仔低垂着眼帘说。<br>「真不敢相信，这个世界居然真的有鬼怪的存在。」<br>虽然已经猜到些什么，这个匪夷所思的故事还是让塔矢感到不可思议。<br>「现在你明白了吧，为什么我的棋艺一下子好一下子坏了吧。因为我是个蠢材，光想着自己下自己下，完全没有考虑佐为的心情……」直到今天，他还是把佐为消失的责任归咎在自己身上。<br>「我也要跟你说对不起，塔矢，我知道你很想和佐为下，可是就因为我的缘故你们下棋的机会很少……我想佐为他，一定是带着遗憾离开这个世界的吧。」<br>光仔的眼中涌起一种酸酸的感觉，一想到佐为的消失，他还是无法克制悲伤的心情。<br>「不……我认为不是那样子的。」<br>塔矢的眼中亮着光芒。<br>「哎？」<br>光仔不解地看着塔矢。<br>「因为，我想他应该和我们一样，发现了你的光芒，你的与众不同之处。我想，他一定是带着希望和欣慰离开你的，他相信你可以完成他所没有完成的事情，…..神之一招<br>！」「神……之……一……招？」<br>光仔听到这个词的时候，心中划过一丝奇异的感觉。<br>这个时候，房间里想起一个声音。<br>「是呀，小光，塔矢亮说的没错。」<br>听到这个熟悉又陌生，亲切又温柔的声音，光仔的心一下子定住了。<br>「进藤，你怎么了？刚刚好象有人叫你哎！」<br>是佐为吗？是佐为吗？光仔睁大眼睛朝着四处问道。<br>「你也听到了是不是？是佐为啊！！！！」<br>他大声对塔矢说。<br>「佐为！佐为！你在吗？你在这里是吗？」<br>光仔急切地在房间里寻找。<br>「佐为！我一直在找你啊！你在哪里呢？」<br>「进藤！你看这棋盘！」<br>塔矢突然说。<br>棋盘上空的空气发生一阵异常的波动，两个少年目不转睛地盯着那地方，突然之间，在空气中浮现出一位戴着高帽的平安棋士的身影。锦衣朱唇，长发轻扬，不是佐为是谁？！<br>「佐为！！」<br>光仔激动地跑上前。<br>「我是佐为，藤原佐为，一个平安时代的棋士。小光，我一直在等你呀。」<br>「你就是……进藤所说的……藤原佐为吗？」塔矢也吃惊地看着那个神秘的身影。<br>「正是，很荣幸曾跟你和你的父亲交过手啊。」佐为微微的笑着。<br>「佐为！你原来没有消失啊！回到我身边来呀，佐为！以后我把所以的棋都给你下啊！<br>不要……不要再离开我呀！」<br>光仔哭喊着说。<br>「小光，我其实一直都在你的身边呀。」带着优雅而高贵的笑颜，佐为温柔地说。<br>「我的形体虽然已经消失了，可是我的棋局和我的存在，却融化在你的每一步棋中<br>了……」<br>「小光，你知道吗？虎次郎是为了我而存在的，而我是为了你而存在的呵……」<br>「围棋就是这样，才会一代一代相传下去，总有一天，你也会发现那个你为之存在的人吧……」<br>「什么存在不存在我不管啦！我只要你回到我身边就可以了！求求你！只要像我们刚认识的时候一样就好了……」<br>「你错了，小光。现在的我，已经没有什么可以教你的了，神之一招……你要自己用心去体会……」<br>「佐为！佐为！你别走啊！佐为！我还有许多话要跟你说呢！佐为！」<br>不管光仔如何呼喊，那绚丽的面颜在空气中逐渐黯淡下去，最终消失于无形。<br>「佐为！佐为！佐为！！！佐为啊！！！！！」<br>「他已经消失啦！进藤！」看着光仔不顾一切地在棋盘四处寻找，塔矢不禁提醒他。<br>「为什么？为什么？佐为！为什么呀？……」光仔痛苦地跪在棋盘前，喃喃自语。<br>「进藤，他已经说得很清楚了。」<br>耳边，塔矢的声音传来。「他是完成了自己的使命而走的，将棋艺留传给后人的使命……他是为了将围棋传给他的后代而存在，同样，我们也是为了我们的后代而存在……」<br>「可是，我想和佐为下棋啊，我们一直都是好朋友啊……」虽然也知道佐为的心意，光仔还是低着头哭泣。<br>「进藤，你别忘了，还有我们啊！你忘了你现在的身份了吗？你是新一代的本因方啊！<br>本因方秀策曾获得的荣誉，现在正由你承受着啊！」塔矢一把拉起他。<br>「为了达到神之一招，我们还有很多路要走呢……」<br>「神之一招……吗？」光仔轻轻地重复说。<br>「没错，我们不是一直都以这个为目标吗？……而且，即使在我们有生之年无法达到，也要像佐为一样，寻找到可以继承围棋的后人哪……」<br>听着塔矢的话，光仔逐渐停止了啜泣。<br>「那，我以后还能再见到佐为吗？」他看着秀策用过的棋盘问。<br>「佐为不是一直都和你在一起吗？在你的棋当中……你不是说因为你的缘故而使我错失了和他交手的机会吗？<br>那么，你现在就要代替他补偿我喽？……」<br>塔矢看着光仔，眼中燃烧起竞争的火焰。光仔默默地收起了泪水。塔矢亮，一生的劲敌啊……<br>「你说的不错，我必须，继续下围棋！」<br>「和你，和绪方老师，和仓田先生，和所有的人！」<br>「只有这么做，才能让佐为继续存在下去！」<br>他说着又重新做到原来的位子上。「现在，我们把这一局结束吧。」<br>塔矢的嘴边浮现出一丝不易察觉的微笑。「你还没有赢过我呢！」<br>他执起白子很快地落子。<br>光仔用袖子擦干残留在眼角的泪水，立刻回了一子。「我不会再轻易输给你了！」<br>「出这招吗？看我的！」<br>隐约，浮现了佐为的身影。<br>在两个少年你来我往的执子、落子中，棋盘间隐约浮现出佐为的身影。可是，他们谁都没有再注意。因为，他们都正朝着新的目标奋斗着……<br>还是像以往那样，佐为微笑着，俯视为了达到「神之一招」的年轻的棋士们，佐为微笑着。<br>「围棋，就是这样一代一代相传下去的啊，小光……」</p>\r\n','2019-10-23 14:01:29.847221',5,5,5,1,'2019-10-23 14:02:08.432776'),(13,'dfdfd','fdfdf',0,'dfdf','<p>dfdf</p>\r\n','2019-11-06 11:21:02.008727',1,1,2,1,'2019-11-06 11:21:02.008727'),(14,'dfdfdf','dfdf',0,'fdfdf','<p>fdfdf</p>\r\n','2019-11-06 11:21:12.467531',1,1,2,1,'2019-11-06 11:21:12.467531');
/*!40000 ALTER TABLE `blog_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_post_tag`
--

DROP TABLE IF EXISTS `blog_post_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_post_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_post_tag_post_id_tag_id_ba2a5f83_uniq` (`post_id`,`tag_id`),
  KEY `blog_post_tag_tag_id_2bbd31e4_fk_blog_tag_id` (`tag_id`),
  CONSTRAINT `blog_post_tag_post_id_a5c00319_fk_blog_post_id` FOREIGN KEY (`post_id`) REFERENCES `blog_post` (`id`),
  CONSTRAINT `blog_post_tag_tag_id_2bbd31e4_fk_blog_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `blog_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_post_tag`
--

LOCK TABLES `blog_post_tag` WRITE;
/*!40000 ALTER TABLE `blog_post_tag` DISABLE KEYS */;
INSERT INTO `blog_post_tag` VALUES (9,2,8),(3,3,1),(8,3,7),(5,4,2),(6,4,3),(7,4,4),(10,5,3),(12,6,3),(11,6,9),(15,12,11),(16,13,3),(17,14,4);
/*!40000 ALTER TABLE `blog_post_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_tag`
--

DROP TABLE IF EXISTS `blog_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_tag_owner_id_3c8290ca_fk_auth_user_id` (`owner_id`),
  CONSTRAINT `blog_tag_owner_id_3c8290ca_fk_auth_user_id` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_tag`
--

LOCK TABLES `blog_tag` WRITE;
/*!40000 ALTER TABLE `blog_tag` DISABLE KEYS */;
INSERT INTO `blog_tag` VALUES (1,'网络空间安全',0,'2019-06-06 10:28:56.407632',1),(2,'python',0,'2019-07-21 14:53:12.862736',1),(3,'编程',0,'2019-07-21 14:53:22.591941',1),(4,'数据结构',0,'2019-07-21 14:53:28.207175',1),(5,'java',0,'2019-07-21 14:53:32.230394',1),(6,'漏洞',0,'2019-07-21 14:55:23.943551',1),(7,'基础',0,'2019-07-21 14:55:29.199741',1),(8,'配置',0,'2019-07-21 14:56:25.224447',1),(9,'django',0,'2019-08-16 19:32:18.495592',1),(11,'动漫',0,'2019-10-23 13:42:23.830648',1);
/*!40000 ALTER TABLE `blog_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `celery_taskmeta`
--

DROP TABLE IF EXISTS `celery_taskmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `celery_taskmeta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL,
  `result` longtext,
  `date_done` datetime(6) NOT NULL,
  `traceback` longtext,
  `hidden` tinyint(1) NOT NULL,
  `meta` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_id` (`task_id`),
  KEY `celery_taskmeta_hidden_23fd02dc` (`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `celery_taskmeta`
--

LOCK TABLES `celery_taskmeta` WRITE;
/*!40000 ALTER TABLE `celery_taskmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `celery_taskmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `celery_tasksetmeta`
--

DROP TABLE IF EXISTS `celery_tasksetmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `celery_tasksetmeta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskset_id` varchar(255) NOT NULL,
  `result` longtext NOT NULL,
  `date_done` datetime(6) NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `taskset_id` (`taskset_id`),
  KEY `celery_tasksetmeta_hidden_593cfc24` (`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `celery_tasksetmeta`
--

LOCK TABLES `celery_tasksetmeta` WRITE;
/*!40000 ALTER TABLE `celery_tasksetmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `celery_tasksetmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_comment`
--

DROP TABLE IF EXISTS `comment_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_user_id` int(11) NOT NULL,
  `comment_text` longtext NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `target_id` int(11) NOT NULL,
  `comment_parent_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_comment_target_id_b37fe95c_fk_blog_post_id` (`target_id`),
  KEY `comment_comment_comment_user_id_f0937c94` (`comment_user_id`),
  CONSTRAINT `comment_comment_comment_user_id_f0937c94_fk_login_user_id` FOREIGN KEY (`comment_user_id`) REFERENCES `login_user` (`id`),
  CONSTRAINT `comment_comment_target_id_b37fe95c_fk_blog_post_id` FOREIGN KEY (`target_id`) REFERENCES `blog_post` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_comment`
--

LOCK TABLES `comment_comment` WRITE;
/*!40000 ALTER TABLE `comment_comment` DISABLE KEYS */;
INSERT INTO `comment_comment` VALUES (8,19,'这是另一个测试','2019-09-25 21:43:48.929566',0,2,0),(13,18,'@风语:收到请回复！','2019-09-25 22:42:41.942172',0,2,8),(14,18,'这是第二个评论','2019-10-10 15:38:51.617727',0,2,0),(24,18,'@冯尧顺:收到!','2019-10-12 16:21:08.610055',0,2,13),(25,18,'@风语:test','2019-10-12 20:14:48.954228',0,2,8),(26,18,'dfdf','2019-11-06 11:51:26.449488',0,3,0),(27,18,'fdfdf','2019-11-06 11:51:35.094472',0,2,0),(28,18,'fdfdf','2019-11-06 11:51:41.168654',0,2,0),(29,18,'fdfdf','2019-11-06 11:51:48.798907',0,3,0);
/*!40000 ALTER TABLE `comment_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_daynumber`
--

DROP TABLE IF EXISTS `config_daynumber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_daynumber` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day` datetime(6) NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=306 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_daynumber`
--

LOCK TABLES `config_daynumber` WRITE;
/*!40000 ALTER TABLE `config_daynumber` DISABLE KEYS */;
INSERT INTO `config_daynumber` VALUES (1,'2019-10-15 21:16:45.560380',1),(2,'2019-10-15 21:25:18.183553',1),(3,'2019-10-15 21:27:46.272434',1),(4,'2019-10-15 21:28:20.217044',1),(5,'2019-10-15 21:28:22.133141',1),(6,'2019-10-15 21:29:13.064623',1),(7,'2019-10-15 21:29:15.269486',1),(8,'2019-10-15 21:29:36.931107',1),(9,'2019-10-15 21:29:39.461860',1),(10,'2019-10-15 21:29:41.277693',1),(11,'2019-10-15 21:29:47.098144',1),(12,'2019-10-15 21:31:50.059177',1),(13,'2019-10-15 21:32:15.132341',1),(14,'2019-10-15 21:32:21.552416',1),(15,'2019-10-15 21:32:28.273301',1),(16,'2019-10-15 21:32:30.975815',1),(17,'2019-10-15 21:32:33.248886',1),(18,'2019-10-15 21:36:24.898300',1),(19,'2019-10-16 10:17:54.598657',1),(20,'2019-10-16 10:18:13.028339',1),(21,'2019-10-16 10:18:14.492030',1),(22,'2019-10-16 10:18:16.510041',1),(23,'2019-10-16 10:18:17.221403',1),(24,'2019-10-16 10:18:17.513180',1),(25,'2019-10-16 10:18:18.561720',1),(26,'2019-10-16 10:18:20.673565',1),(27,'2019-10-16 10:18:22.522363',1),(28,'2019-10-16 10:18:23.412334',1),(29,'2019-10-16 10:18:25.887856',1),(30,'2019-10-16 10:18:26.020088',1),(31,'2019-10-16 10:18:26.186549',1),(32,'2019-10-16 10:18:26.400160',1),(33,'2019-10-16 10:18:26.554129',1),(34,'2019-10-16 10:18:27.482285',1),(35,'2019-10-16 10:18:27.635776',1),(36,'2019-10-16 10:18:27.812169',1),(37,'2019-10-16 10:18:28.814514',1),(38,'2019-10-16 10:18:29.717553',1),(39,'2019-10-16 10:18:29.871461',1),(40,'2019-10-16 10:18:30.015048',1),(41,'2019-10-16 10:18:30.178882',1),(42,'2019-10-16 10:18:30.371540',1),(43,'2019-10-16 10:18:30.503299',1),(44,'2019-10-16 10:18:30.657285',1),(45,'2019-10-16 10:18:32.323259',1),(46,'2019-10-16 10:19:37.920656',1),(47,'2019-10-16 10:19:41.768200',1),(48,'2019-10-16 10:21:54.557102',1),(49,'2019-10-16 10:24:42.336807',1),(50,'2019-10-16 10:32:35.652018',1),(51,'2019-10-16 10:32:50.128291',1),(52,'2019-10-16 10:32:52.062767',1),(53,'2019-10-16 10:46:23.234315',1),(54,'2019-10-16 10:46:36.288939',1),(55,'2019-10-16 16:32:27.613948',1),(56,'2019-10-16 16:33:47.228645',1),(57,'2019-10-16 16:40:57.622351',1),(58,'2019-10-16 19:31:33.557145',1),(59,'2019-10-18 20:14:20.272246',1),(60,'2019-10-18 21:21:12.991773',1),(61,'2019-10-20 11:06:48.060188',1),(62,'2019-10-21 20:07:55.293793',1),(63,'2019-10-21 20:13:24.582216',1),(64,'2019-10-22 09:41:52.700963',1),(65,'2019-10-22 09:51:31.145254',1),(66,'2019-10-22 11:29:24.775403',1),(67,'2019-10-22 15:24:30.157508',1),(68,'2019-10-22 15:51:27.403908',1),(69,'2019-10-23 09:58:39.308273',1),(70,'2019-10-23 10:16:48.480953',1),(71,'2019-10-23 10:19:29.040852',1),(72,'2019-10-23 10:19:38.419765',1),(73,'2019-10-23 10:19:41.437786',1),(74,'2019-10-23 10:20:22.575156',1),(75,'2019-10-23 10:47:21.777927',1),(76,'2019-10-23 13:41:05.168476',1),(77,'2019-10-23 13:41:09.567169',1),(78,'2019-10-23 13:41:11.283766',1),(79,'2019-10-23 13:55:53.231432',1),(80,'2019-10-23 13:55:54.753478',1),(81,'2019-10-23 13:55:55.872453',1),(82,'2019-10-23 13:55:55.945648',1),(83,'2019-10-23 14:01:36.006596',1),(84,'2019-10-23 14:01:37.120550',1),(85,'2019-10-23 14:01:39.427662',1),(86,'2019-10-23 14:01:41.014900',1),(87,'2019-10-24 11:04:01.502024',1),(88,'2019-10-24 11:05:12.364989',1),(89,'2019-10-24 11:05:20.927534',1),(90,'2019-10-24 11:05:25.368945',1),(91,'2019-10-24 11:19:49.048526',1),(92,'2019-10-24 11:19:52.621990',1),(93,'2019-10-27 12:26:32.804644',1),(94,'2019-10-27 12:32:55.125156',1),(95,'2019-10-27 12:34:04.618588',1),(96,'2019-10-27 15:08:52.149674',1),(97,'2019-10-27 15:08:54.215654',1),(98,'2019-10-27 15:08:55.725177',1),(99,'2019-10-27 15:08:56.903240',1),(100,'2019-10-27 16:48:18.897439',1),(101,'2019-10-27 16:48:21.931856',1),(102,'2019-10-27 16:48:23.628333',1),(103,'2019-10-27 16:48:36.014349',1),(104,'2019-10-27 16:48:40.199340',1),(105,'2019-10-27 16:51:42.830756',1),(106,'2019-10-27 16:51:53.337573',1),(107,'2019-10-27 16:51:55.304922',1),(108,'2019-10-27 16:51:57.860799',1),(109,'2019-10-27 16:51:59.466182',1),(110,'2019-10-27 16:57:20.446101',1),(111,'2019-10-27 17:01:26.043594',1),(112,'2019-10-27 17:01:27.224907',1),(113,'2019-10-27 17:01:37.360263',1),(114,'2019-10-27 17:05:45.509505',1),(115,'2019-10-27 17:09:55.444993',1),(116,'2019-10-28 10:13:57.423393',1),(117,'2019-10-28 10:14:08.282314',1),(118,'2019-10-28 10:14:10.206384',1),(119,'2019-10-28 10:14:20.928935',1),(120,'2019-10-28 10:19:00.338626',1),(121,'2019-10-28 10:19:03.260396',1),(122,'2019-10-28 10:19:09.004744',1),(123,'2019-10-28 10:19:25.660227',1),(124,'2019-10-28 10:19:28.234058',1),(125,'2019-10-28 10:23:42.716668',1),(126,'2019-10-28 10:23:44.483359',1),(127,'2019-10-28 10:29:42.306834',1),(128,'2019-10-28 10:29:44.531733',1),(129,'2019-10-28 10:29:46.219224',1),(130,'2019-10-28 10:29:48.511294',1),(131,'2019-10-28 10:29:50.385277',1),(132,'2019-10-28 10:29:52.331451',1),(133,'2019-10-28 10:29:56.142618',1),(134,'2019-10-28 10:29:58.528961',1),(135,'2019-10-28 10:30:00.599438',1),(136,'2019-10-28 10:30:03.368801',1),(137,'2019-10-28 10:30:34.586816',1),(138,'2019-10-28 10:30:45.688895',1),(139,'2019-10-28 10:34:04.550444',1),(140,'2019-10-28 10:34:15.206421',1),(141,'2019-10-28 11:19:16.279040',1),(142,'2019-10-28 11:29:24.317829',1),(143,'2019-10-28 11:40:27.717830',1),(144,'2019-10-28 11:40:41.054291',1),(145,'2019-10-28 11:52:56.286342',1),(146,'2019-10-28 15:22:27.604132',1),(147,'2019-10-28 15:22:47.421107',1),(148,'2019-10-28 15:22:49.041414',1),(149,'2019-10-28 15:23:06.154952',1),(150,'2019-10-28 15:23:40.085147',1),(151,'2019-10-28 15:47:37.860524',1),(152,'2019-10-28 15:48:44.974983',1),(153,'2019-10-28 15:53:23.536686',1),(154,'2019-10-29 15:53:53.156351',1),(155,'2019-10-29 15:54:08.441790',1),(156,'2019-10-30 13:07:03.610053',1),(157,'2019-10-30 14:18:45.696129',1),(158,'2019-10-30 14:19:50.489253',1),(159,'2019-10-30 14:20:02.308302',1),(160,'2019-10-30 14:21:28.101608',1),(161,'2019-10-30 14:21:30.083845',1),(162,'2019-10-30 14:22:12.648183',1),(163,'2019-10-30 14:22:23.099437',1),(164,'2019-10-30 14:22:57.839134',1),(165,'2019-10-30 14:25:05.958349',1),(166,'2019-10-30 14:26:07.317235',1),(167,'2019-10-30 14:52:11.602422',1),(168,'2019-10-30 14:52:55.287321',1),(169,'2019-10-30 14:52:57.624529',1),(170,'2019-10-30 14:53:00.654620',1),(171,'2019-10-30 15:17:35.086610',1),(172,'2019-10-30 15:51:55.623308',1),(173,'2019-10-30 16:10:20.399714',1),(174,'2019-10-30 16:54:26.580545',1),(175,'2019-10-31 15:26:12.722479',1),(176,'2019-10-31 15:26:52.993547',1),(177,'2019-11-01 15:24:26.062093',1),(178,'2019-11-01 15:33:17.540710',1),(179,'2019-11-01 15:33:23.851033',1),(180,'2019-11-01 16:09:57.640489',1),(181,'2019-11-01 16:10:14.509877',1),(182,'2019-11-01 16:14:27.227571',1),(183,'2019-11-01 17:28:35.883548',1),(184,'2019-11-01 17:28:40.009109',1),(185,'2019-11-02 15:28:44.067746',1),(186,'2019-11-02 15:28:46.959571',1),(187,'2019-11-02 16:05:54.305452',1),(188,'2019-11-03 11:57:28.475257',1),(189,'2019-11-03 11:57:52.399095',1),(190,'2019-11-03 14:12:16.616708',1),(191,'2019-11-03 14:12:25.385646',1),(192,'2019-11-03 14:13:31.185270',1),(193,'2019-11-03 14:15:05.878638',1),(194,'2019-11-03 14:16:20.561336',1),(195,'2019-11-03 14:17:50.736631',1),(196,'2019-11-03 14:18:02.054677',1),(197,'2019-11-03 14:18:10.341233',1),(198,'2019-11-03 14:18:25.367133',1),(199,'2019-11-03 20:54:03.343181',1),(200,'2019-11-03 20:54:30.389440',1),(201,'2019-11-03 20:55:20.027981',1),(202,'2019-11-04 14:16:47.853575',1),(203,'2019-11-04 14:17:03.138937',1),(204,'2019-11-04 14:54:54.536128',1),(205,'2019-11-04 15:25:22.633907',1),(206,'2019-11-04 15:31:02.657751',1),(207,'2019-11-04 16:00:40.355477',1),(208,'2019-11-04 16:02:45.825307',1),(209,'2019-11-04 16:32:51.464787',1),(210,'2019-11-04 16:33:30.130574',1),(211,'2019-11-04 17:15:19.392798',1),(212,'2019-11-04 20:40:10.255429',1),(213,'2019-11-06 10:53:43.852380',1),(214,'2019-11-06 11:09:10.723417',1),(215,'2019-11-06 11:13:21.618465',1),(216,'2019-11-06 11:13:46.904734',1),(217,'2019-11-06 11:16:37.549641',1),(218,'2019-11-06 11:16:39.878841',1),(219,'2019-11-06 11:19:52.869908',1),(220,'2019-11-06 11:20:35.246574',1),(221,'2019-11-06 11:20:36.705461',1),(222,'2019-11-06 11:20:47.727790',1),(223,'2019-11-06 11:21:15.725192',1),(224,'2019-11-06 11:21:18.877577',1),(225,'2019-11-06 11:21:20.982169',1),(226,'2019-11-06 11:21:24.990832',1),(227,'2019-11-06 11:21:27.126505',1),(228,'2019-11-06 11:21:30.552614',1),(229,'2019-11-06 11:22:12.419925',1),(230,'2019-11-06 11:22:18.411857',1),(231,'2019-11-06 11:33:33.779457',1),(232,'2019-11-06 13:01:44.881161',1),(233,'2019-11-06 13:01:47.990427',1),(234,'2019-11-06 13:01:55.283817',1),(235,'2019-11-06 13:01:56.645437',1),(236,'2019-11-06 13:01:59.142106',1),(237,'2019-11-06 13:02:06.004935',1),(238,'2019-11-06 13:02:07.972140',1),(239,'2019-11-06 13:02:09.235499',1),(240,'2019-11-06 13:02:14.438331',1),(241,'2019-11-06 13:02:15.869136',1),(242,'2019-11-06 13:02:16.959034',1),(243,'2019-11-06 13:02:47.484190',1),(244,'2019-11-06 13:07:06.100431',1),(245,'2019-11-06 13:07:06.208718',1),(246,'2019-11-06 13:09:24.542506',1),(247,'2019-11-06 13:12:23.842613',1),(248,'2019-11-06 14:43:38.447124',1),(249,'2019-11-18 15:14:06.991247',1),(250,'2019-11-18 15:14:13.090934',1),(251,'2019-11-22 16:13:47.401676',1),(252,'2019-11-22 17:39:18.913346',1),(253,'2019-11-22 17:53:45.064310',1),(254,'2019-11-22 18:06:06.890050',1),(255,'2019-11-22 18:06:16.638109',1),(256,'2019-11-22 18:06:33.597912',1),(257,'2019-11-22 18:06:53.207008',1),(258,'2019-11-22 18:07:05.276437',1),(259,'2019-11-22 18:12:02.144007',1),(260,'2019-11-22 18:12:27.001690',1),(261,'2019-11-22 18:12:45.571389',1),(262,'2019-11-22 18:23:46.090000',1),(263,'2019-11-22 18:23:48.001146',1),(264,'2019-12-04 14:33:31.285202',1),(265,'2019-12-05 16:14:26.382887',1),(266,'2019-12-05 16:47:21.996732',1),(267,'2019-12-05 16:50:00.722430',1),(268,'2019-12-05 16:52:55.940186',1),(269,'2019-12-05 16:52:58.291102',1),(270,'2019-12-05 17:04:50.049855',1),(271,'2019-12-05 17:04:51.217541',1),(272,'2019-12-05 17:04:54.677645',1),(273,'2019-12-05 18:11:55.406447',1),(274,'2019-12-05 18:13:09.705734',1),(275,'2019-12-05 18:15:52.072321',1),(276,'2019-12-05 18:29:36.004518',1),(277,'2019-12-05 18:29:38.451234',1),(278,'2019-12-05 18:31:28.536814',1),(279,'2019-12-05 18:32:50.786530',1),(280,'2019-12-05 18:36:25.777812',1),(281,'2019-12-05 18:40:32.496244',1),(282,'2019-12-05 18:41:56.017286',1),(283,'2019-12-05 18:43:20.166050',1),(284,'2019-12-05 18:47:34.163582',1),(285,'2019-12-05 18:49:52.125827',1),(286,'2019-12-05 18:50:54.204180',1),(287,'2019-12-05 18:56:02.452104',1),(288,'2019-12-05 18:56:26.313070',1),(289,'2019-12-05 21:11:23.424334',1),(290,'2019-12-05 21:24:43.152225',1),(291,'2019-12-05 21:24:45.574611',1),(292,'2019-12-05 21:25:00.282747',1),(293,'2019-12-05 21:25:04.803602',1),(294,'2019-12-06 12:45:33.254174',1),(295,'2019-12-06 12:45:33.529903',1),(296,'2019-12-06 12:47:40.945696',1),(297,'2019-12-06 13:35:15.971373',1),(298,'2019-12-06 13:35:16.223716',1),(299,'2019-12-06 13:36:47.218217',1),(300,'2019-12-06 13:37:51.686108',1),(301,'2019-12-06 13:38:10.577069',1),(302,'2019-12-06 13:42:18.814738',1),(303,'2019-12-06 13:42:21.044017',1),(304,'2019-12-06 13:46:40.102679',1),(305,'2019-12-06 13:47:55.321747',1);
/*!40000 ALTER TABLE `config_daynumber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_link`
--

DROP TABLE IF EXISTS `config_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `href` varchar(200) NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `weight` int(11) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_link`
--

LOCK TABLES `config_link` WRITE;
/*!40000 ALTER TABLE `config_link` DISABLE KEYS */;
INSERT INTO `config_link` VALUES (1,'百度','http://www.baidu.com',0,10,'2019-11-22 18:07:32.725340'),(2,'微博','http://weibo.com',0,10,'2019-11-22 18:12:24.132576');
/*!40000 ALTER TABLE `config_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_sidebar`
--

DROP TABLE IF EXISTS `config_sidebar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_sidebar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `display_type` int(10) unsigned NOT NULL,
  `content` longtext NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `weight` int(11) NOT NULL,
  `class_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_sidebar`
--

LOCK TABLES `config_sidebar` WRITE;
/*!40000 ALTER TABLE `config_sidebar` DISABLE KEYS */;
INSERT INTO `config_sidebar` VALUES (1,'公告',1,'此内容为test，测试sidebar兼容性',1,'2019-06-19 16:20:20.181457',100,'gonggao'),(2,'联系方式',1,'<div>微信：str0416</div><div>微博：<a href=\"https://weibo.com/5236892041/profile?rightmod=1&wvr=6&mod=personinfo\">幻艾风青</a></div><div>qq：879892739</div>',1,'2019-06-20 13:36:08.028498',100,'contact'),(3,'关于我',1,'<p>计算机专业，Python.</p>',1,'2019-06-28 17:46:55.032849',1,'aboutme'),(4,'搜索',1,'<form class=\"form-inline\" action=\"/blog/search/\" method=\"GET\">\r\n        <span><input class=\"input\" type=\"search\" placeholder=\"Search\" aria-label=\"Search\" name=\"keyword\" value=\"\" style=\"width: 200px\"></span>\r\n        <span><button class=\"button\" type=\"submit\" value=\"submit\">搜索</button></span>\r\n    </form>',1,'2019-07-11 16:14:49.414788',5,'Search'),(5,'登录',1,'<span><a href=\"/login/?next=@\">现在登录！</a></span>&nbsp\r\n   <span><a href=\"/login/register/\">现在注册！</a></span>',1,'2019-08-08 16:03:36.637921',0,'login');
/*!40000 ALTER TABLE `config_sidebar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_userip`
--

DROP TABLE IF EXISTS `config_userip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_userip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(30) NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_userip`
--

LOCK TABLES `config_userip` WRITE;
/*!40000 ALTER TABLE `config_userip` DISABLE KEYS */;
INSERT INTO `config_userip` VALUES (1,'127.0.0.1',304),(2,'172.17.77.150',1);
/*!40000 ALTER TABLE `config_userip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_visitnumber`
--

DROP TABLE IF EXISTS `config_visitnumber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_visitnumber` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_visitnumber`
--

LOCK TABLES `config_visitnumber` WRITE;
/*!40000 ALTER TABLE `config_visitnumber` DISABLE KEYS */;
INSERT INTO `config_visitnumber` VALUES (1,306);
/*!40000 ALTER TABLE `config_visitnumber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=281 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-06-06 10:14:03.384794','1','1',1,'[{\"added\": {}}]',7,1),(2,'2019-06-06 10:28:56.410574','1','网络空间安全',1,'[{\"added\": {}}]',9,1),(3,'2019-06-06 10:34:28.189424','1','test',1,'[{\"added\": {}}]',8,1),(4,'2019-06-06 21:24:13.726260','1','Comment object (1)',1,'[{\"added\": {}}]',10,1),(5,'2019-06-06 21:24:57.639664','1','Comment object (1)',3,'',10,1),(6,'2019-06-06 21:25:14.890483','2','Comment object (2)',1,'[{\"added\": {}}]',10,1),(7,'2019-06-07 16:01:58.647235','3','Comment object (3)',1,'[{\"added\": {}}]',10,1),(8,'2019-06-07 16:03:36.140223','4','1',1,'[{\"added\": {}}]',10,1),(9,'2019-06-11 10:24:05.891811','2','1',1,'[{\"added\": {}}]',7,1),(10,'2019-06-11 10:24:21.029748','2','1',3,'',7,1),(11,'2019-06-11 10:25:57.509346','6','1',1,'[{\"added\": {}}]',10,1),(12,'2019-06-11 10:27:51.059683','1','1',1,'[{\"added\": {}}]',11,1),(13,'2019-06-11 10:28:02.073361','1','1',3,'',11,1),(14,'2019-06-11 10:28:23.568128','6','1',3,'',10,1),(15,'2019-06-11 10:28:23.752629','5','1',3,'',10,1),(16,'2019-06-11 10:28:23.824442','4','1',3,'',10,1),(17,'2019-06-11 10:28:23.871302','3','1',3,'',10,1),(18,'2019-06-11 10:28:23.906327','2','1',3,'',10,1),(19,'2019-06-11 10:28:40.749526','7','this ...',1,'[{\"added\": {}}]',10,1),(20,'2019-06-11 10:28:53.396201','8','this ...',1,'[{\"added\": {}}]',10,1),(21,'2019-06-11 10:29:10.159698','7','this ...',2,'[{\"changed\": {\"fields\": [\"comment_text\"]}}]',10,1),(22,'2019-06-11 10:29:15.608047','8','this ...',2,'[{\"changed\": {\"fields\": [\"comment_text\"]}}]',10,1),(23,'2019-06-11 10:29:22.361583','2','test',1,'[{\"added\": {}}]',11,1),(24,'2019-06-11 10:29:32.682123','2','test',2,'[]',11,1),(25,'2019-06-14 15:26:22.816742','2','1',1,'[{\"added\": {}}]',8,1),(26,'2019-06-14 15:31:28.145777','3','pic test',1,'[{\"added\": {}}]',8,1),(27,'2019-06-19 16:20:20.245286','1','SideBar object (1)',1,'[{\"added\": {}}]',13,1),(28,'2019-06-20 13:28:53.914795','1','SideBar object (1)',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',13,1),(29,'2019-06-20 13:31:12.736268','1','SideBar object (1)',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',13,1),(30,'2019-06-20 13:36:08.037282','2','SideBar object (2)',1,'[{\"added\": {}}]',13,1),(31,'2019-06-20 13:56:58.697973','2','SideBar object (2)',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',13,1),(32,'2019-06-28 17:46:55.033845','3','SideBar object (3)',1,'[{\"added\": {}}]',13,1),(33,'2019-06-28 17:51:20.627075','3','SideBar object (3)',2,'[{\"changed\": {\"fields\": [\"weight\"]}}]',13,1),(34,'2019-06-28 21:01:15.833288','3','SideBar object (3)',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',13,1),(35,'2019-06-28 21:32:28.349062','1','SideBar object (1)',2,'[]',13,1),(36,'2019-06-28 21:32:36.359062','2','SideBar object (2)',2,'[{\"changed\": {\"fields\": [\"class_name\"]}}]',13,1),(37,'2019-06-28 21:32:41.481158','3','SideBar object (3)',2,'[{\"changed\": {\"fields\": [\"class_name\"]}}]',13,1),(38,'2019-06-28 21:54:50.371542','4','test1',1,'[{\"added\": {}}]',8,1),(39,'2019-07-11 16:14:49.602506','4','SideBar object (4)',1,'[{\"added\": {}}]',13,1),(40,'2019-07-11 16:15:00.687569','4','SideBar object (4)',2,'[{\"changed\": {\"fields\": [\"weight\"]}}]',13,1),(41,'2019-07-11 16:29:50.436823','4','SideBar object (4)',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',13,1),(42,'2019-07-11 16:30:25.025623','4','SideBar object (4)',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',13,1),(43,'2019-07-11 16:30:48.145226','4','SideBar object (4)',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',13,1),(44,'2019-07-11 16:33:38.022224','4','SideBar object (4)',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',13,1),(45,'2019-07-11 16:34:51.823771','4','SideBar object (4)',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',13,1),(46,'2019-07-11 16:37:53.368291','1','SideBar object (1)',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',13,1),(47,'2019-07-11 16:38:03.726403','1','SideBar object (1)',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',13,1),(48,'2019-07-21 14:53:12.865732','2','python',1,'[{\"added\": {}}]',9,1),(49,'2019-07-21 14:53:22.592919','3','编程',1,'[{\"added\": {}}]',9,1),(50,'2019-07-21 14:53:28.208153','4','数据结构',1,'[{\"added\": {}}]',9,1),(51,'2019-07-21 14:53:32.230394','5','java',1,'[{\"added\": {}}]',9,1),(52,'2019-07-21 14:53:48.097796','2','软件编程',1,'[{\"added\": {}}]',7,1),(53,'2019-07-21 14:54:13.680732','3','网络安全',1,'[{\"added\": {}}]',7,1),(54,'2019-07-21 14:54:28.433138','4','网络设备配置',1,'[{\"added\": {}}]',7,1),(55,'2019-07-21 14:54:39.499810','4','python 数据结构浅谈',2,'[{\"changed\": {\"fields\": [\"category\", \"title\", \"desc\", \"tag\"]}}]',8,1),(56,'2019-07-21 14:55:23.945582','6','漏洞',1,'[{\"added\": {}}]',9,1),(57,'2019-07-21 14:55:29.200702','7','基础',1,'[{\"added\": {}}]',9,1),(58,'2019-07-21 14:55:36.529217','3','xss攻击和防御',2,'[{\"changed\": {\"fields\": [\"category\", \"title\", \"desc\", \"tag\"]}}]',8,1),(59,'2019-07-21 14:56:25.226428','8','配置',1,'[{\"added\": {}}]',9,1),(60,'2019-07-21 14:56:31.254059','2','ospf原理与运行',2,'[{\"changed\": {\"fields\": [\"category\", \"title\", \"desc\", \"tag\"]}}]',8,1),(61,'2019-07-21 15:41:25.656957','1','test',2,'[{\"changed\": {\"fields\": [\"desc\"]}}]',8,1),(62,'2019-07-21 15:42:13.216307','5','c语言程序设计',1,'[{\"added\": {}}]',8,1),(63,'2019-07-21 15:43:00.763767','1','test',3,'',8,1),(64,'2019-07-22 16:46:31.944136','3','SideBar object (3)',2,'[{\"changed\": {\"fields\": [\"title\", \"content\", \"class_name\"]}}]',13,1),(65,'2019-07-22 16:53:56.741394','3','网络安全',2,'[{\"changed\": {\"fields\": [\"is_nav\"]}}]',7,1),(66,'2019-07-22 16:55:02.860545','2','软件编程',2,'[{\"changed\": {\"fields\": [\"is_nav\"]}}]',7,1),(67,'2019-07-22 20:17:40.626080','4','SideBar object (4)',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',13,1),(68,'2019-07-22 20:31:09.335488','4','SideBar object (4)',2,'[]',13,1),(69,'2019-07-22 20:34:31.718536','4','SideBar object (4)',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',13,1),(70,'2019-07-22 20:40:27.134742','4','SideBar object (4)',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',13,1),(71,'2019-07-22 22:09:19.392956','5','c语言程序设计',2,'[{\"changed\": {\"fields\": [\"desc\"]}}]',8,1),(72,'2019-08-07 15:45:53.151071','5','c语言程序设计',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,1),(73,'2019-08-07 15:50:34.770082','5','c语言程序设计',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,1),(74,'2019-08-07 16:13:53.872680','5','c语言程序设计',2,'[]',8,1),(75,'2019-08-08 16:03:36.637921','5','SideBar object (5)',1,'[{\"added\": {}}]',13,1),(76,'2019-08-08 16:03:57.999791','5','SideBar object (5)',2,'[{\"changed\": {\"fields\": [\"weight\", \"class_name\"]}}]',13,1),(77,'2019-08-08 16:04:10.236679','3','SideBar object (3)',2,'[{\"changed\": {\"fields\": [\"weight\"]}}]',13,1),(78,'2019-08-08 16:05:02.085526','5','SideBar object (5)',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',13,1),(79,'2019-08-08 16:10:30.255285','5','SideBar object (5)',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',13,1),(80,'2019-08-08 16:11:23.534160','5','SideBar object (5)',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',13,1),(81,'2019-08-08 16:22:53.708958','2','fys1',1,'[{\"added\": {}}]',4,1),(82,'2019-08-08 16:23:38.315292','2','fys1',3,'',4,1),(83,'2019-08-14 20:19:43.750212','1','EmailPro object (1)',3,'',19,1),(84,'2019-08-16 19:32:18.500042','9','django',1,'[{\"added\": {}}]',9,1),(85,'2019-08-16 19:42:39.981565','6','celery+redis在django中的使用',1,'[{\"added\": {}}]',8,1),(86,'2019-08-16 19:43:33.983488','6','celery+redis在django中的使用',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,1),(87,'2019-08-16 20:00:18.755318','6','celery+redis在django中的使用',2,'[{\"changed\": {\"fields\": [\"desc\", \"content\"]}}]',8,1),(88,'2019-08-16 21:07:07.628371','6','celery+redis在django中的使用',2,'[]',8,1),(89,'2019-08-16 21:13:12.054710','6','celery+redis在django中的使用',2,'[]',8,1),(90,'2019-08-16 21:15:05.207812','6','celery+redis在django中的使用',2,'[]',8,1),(91,'2019-08-16 21:15:22.876917','6','celery+redis在django中的使用',2,'[]',8,1),(92,'2019-08-16 21:44:38.633325','6','celery+redis在django中的使用',2,'[]',8,1),(93,'2019-08-16 21:45:25.078660','6','celery+redis在django中的使用',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,1),(94,'2019-08-16 21:49:28.085471','6','celery+redis在django中的使用',2,'[]',8,1),(95,'2019-08-16 21:50:34.859992','6','celery+redis在django中的使用',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,1),(96,'2019-08-16 22:00:25.675904','6','celery+redis在django中的使用',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,1),(97,'2019-08-17 15:57:58.181451','6','celery+redis在django中的使用',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,1),(98,'2019-08-17 19:02:10.648257','6','celery+redis在django中的使用',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,1),(99,'2019-08-20 16:31:54.666925','10','yaoshun31@163.com',3,'',18,1),(100,'2019-08-20 16:31:54.820787','9','yaoshun31@163.com',3,'',18,1),(101,'2019-08-20 16:31:54.856981','8','yaoshun31@163.com',3,'',18,1),(102,'2019-08-20 16:31:54.892331','7','yaoshun31@163.com',3,'',18,1),(103,'2019-08-20 16:31:54.939414','6','yaoshun31@163.com',3,'',18,1),(104,'2019-08-20 16:31:54.964040','5','yaoshun31@163.com',3,'',18,1),(105,'2019-08-20 16:31:54.988379','4','yaoshun31@163.com',3,'',18,1),(106,'2019-08-20 16:31:55.024513','3','yaoshun31@163.com',3,'',18,1),(107,'2019-08-20 16:31:55.060108','2','yaoshun31@163.com',3,'',18,1),(108,'2019-08-20 16:31:55.095977','1','yaoshun31@163.com',3,'',18,1),(109,'2019-08-20 17:13:52.349341','13','879892739@qq.com',3,'',18,1),(110,'2019-08-20 17:13:52.501745','12','18118107808@163.com',3,'',18,1),(111,'2019-08-20 17:13:52.548657','11','yaoshun31@163.com',3,'',18,1),(112,'2019-08-20 17:52:43.558897','17','EmailPro object (17)',3,'',19,1),(113,'2019-08-20 17:52:43.747400','16','EmailPro object (16)',3,'',19,1),(114,'2019-08-20 17:52:43.794023','15','EmailPro object (15)',3,'',19,1),(115,'2019-08-20 17:52:43.829628','14','EmailPro object (14)',3,'',19,1),(116,'2019-08-20 17:52:43.865715','13','EmailPro object (13)',3,'',19,1),(117,'2019-08-20 17:52:43.901309','12','EmailPro object (12)',3,'',19,1),(118,'2019-08-20 17:52:43.936903','11','EmailPro object (11)',3,'',19,1),(119,'2019-08-20 17:52:43.984028','10','EmailPro object (10)',3,'',19,1),(120,'2019-08-20 17:52:44.041682','9','EmailPro object (9)',3,'',19,1),(121,'2019-08-20 17:52:44.077278','8','EmailPro object (8)',3,'',19,1),(122,'2019-08-20 17:52:44.124402','7','EmailPro object (7)',3,'',19,1),(123,'2019-08-20 17:52:44.171527','6','EmailPro object (6)',3,'',19,1),(124,'2019-08-20 17:52:44.218152','5','EmailPro object (5)',3,'',19,1),(125,'2019-08-20 17:52:44.254252','4','EmailPro object (4)',3,'',19,1),(126,'2019-08-20 17:52:44.372570','3','EmailPro object (3)',3,'',19,1),(127,'2019-08-20 17:52:44.418710','2','EmailPro object (2)',3,'',19,1),(128,'2019-08-20 18:00:03.213884','15','yaoshun31@163.com',3,'',18,1),(129,'2019-08-20 18:00:03.264487','14','yaoshun31@qq.com',3,'',18,1),(130,'2019-08-20 18:01:41.330619','16','yaoshun31@163.com',3,'',18,1),(131,'2019-08-20 18:01:50.243876','18','EmailPro object (18)',3,'',19,1),(132,'2019-08-20 18:03:56.738470','19','EmailPro object (19)',3,'',19,1),(133,'2019-08-20 18:04:13.869260','17','yaoshun31@163.com',3,'',18,1),(134,'2019-08-21 16:34:24.365893','5','c语言程序设计',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',8,1),(135,'2019-08-21 16:35:02.497685','4','python 数据结构浅谈',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',8,1),(136,'2019-09-23 14:39:12.680799','19','879892739@qq.com',2,'[{\"changed\": {\"fields\": [\"nick\", \"sex\"]}}]',18,1),(137,'2019-09-23 15:26:05.792868','3','fdfdf...',3,'',10,1),(138,'2019-09-23 15:26:09.703859','1','fdfdf...',3,'',10,1),(139,'2019-09-23 17:07:27.259322','18','yaoshun31@163.com',2,'[{\"changed\": {\"fields\": [\"nick\", \"sex\"]}}]',18,1),(140,'2019-09-24 10:47:18.273600','5','登录',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',13,1),(141,'2019-09-24 10:47:49.467492','5','登录',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',13,1),(142,'2019-09-24 11:04:13.532812','5','登录',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',13,1),(143,'2019-09-24 13:47:35.310072','5','登录',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',13,1),(144,'2019-09-24 15:40:03.817215','9','fdfdf...',2,'[]',10,1),(145,'2019-09-24 15:48:00.605967','9','test',2,'[{\"changed\": {\"fields\": [\"comment_text\"]}}]',10,1),(146,'2019-09-24 20:50:34.989460','9','test',2,'[]',10,1),(147,'2019-09-24 21:31:32.053318','9','test',3,'',10,1),(148,'2019-09-24 21:31:32.102550','8','fdfdf...',3,'',10,1),(149,'2019-09-24 21:31:32.138199','6','fdfd',3,'',10,1),(150,'2019-09-24 21:31:32.184503','5','fdfdf...',3,'',10,1),(151,'2019-09-24 21:31:32.220551','4','fdfdf...',3,'',10,1),(152,'2019-09-24 21:31:32.327868','2','fdfdf...',3,'',10,1),(153,'2019-09-25 21:43:48.930569','8','这是另一个...',1,'[{\"added\": {}}]',10,1),(154,'2019-09-25 21:54:51.464810','11','@风语丿:...',3,'',10,1),(155,'2019-09-25 21:54:51.596401','10','@风语丿:...',3,'',10,1),(156,'2019-09-25 21:54:51.620894','9','fdfdf...',3,'',10,1),(157,'2019-09-25 22:36:39.905579','12','@风语:回...',3,'',10,1),(158,'2019-09-25 22:36:39.945949','7','测试第一个...',3,'',10,1),(159,'2019-10-10 15:38:51.924544','14','这是第二个...',1,'[{\"added\": {}}]',10,1),(160,'2019-10-11 20:43:17.799521','18','yaoshun31@163.com',2,'[{\"changed\": {\"fields\": [\"nick\"]}}]',18,1),(161,'2019-10-11 20:43:21.473675','18','yaoshun31@163.com',2,'[]',18,1),(162,'2019-10-11 20:43:26.232112','19','879892739@qq.com',2,'[{\"changed\": {\"fields\": [\"uid\"]}}]',18,1),(163,'2019-10-12 08:45:27.579027','3','关于我',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',13,1),(164,'2019-10-12 08:46:03.441751','2','联系方式',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',13,1),(165,'2019-10-12 08:48:30.408830','2','联系方式',2,'[]',13,1),(166,'2019-10-12 13:59:48.390959','21','',3,'',10,1),(167,'2019-10-12 13:59:51.612231','20','',3,'',10,1),(168,'2019-10-12 13:59:54.306049','19','',3,'',10,1),(169,'2019-10-12 13:59:56.569764','18','',3,'',10,1),(170,'2019-10-12 13:59:58.843486','17','',3,'',10,1),(171,'2019-10-12 14:00:00.843698','16','',3,'',10,1),(172,'2019-10-12 14:00:03.396824','15','',3,'',10,1),(173,'2019-10-12 20:20:34.252734','23','test',3,'',10,1),(174,'2019-10-12 20:20:34.382746','22','    ',3,'',10,1),(175,'2019-10-21 20:14:18.339860','20','yaoshun72@163.com',3,'',18,1),(176,'2019-10-21 20:25:48.678300','21','yaoshun72@163.com',3,'',18,1),(177,'2019-10-21 21:17:25.291415','31','EmailPro object (31)',3,'',19,1),(178,'2019-10-21 21:17:25.423264','30','EmailPro object (30)',3,'',19,1),(179,'2019-10-21 21:17:25.470903','29','EmailPro object (29)',3,'',19,1),(180,'2019-10-21 21:17:25.517520','28','EmailPro object (28)',3,'',19,1),(181,'2019-10-21 21:17:25.564141','27','EmailPro object (27)',3,'',19,1),(182,'2019-10-21 21:17:25.611267','26','EmailPro object (26)',3,'',19,1),(183,'2019-10-21 21:17:25.657889','25','EmailPro object (25)',3,'',19,1),(184,'2019-10-21 21:17:25.704514','24','EmailPro object (24)',3,'',19,1),(185,'2019-10-21 21:17:25.751640','23','EmailPro object (23)',3,'',19,1),(186,'2019-10-21 21:17:25.798765','22','EmailPro object (22)',3,'',19,1),(187,'2019-10-21 21:17:25.845389','21','EmailPro object (21)',3,'',19,1),(188,'2019-10-21 21:17:25.892516','20','EmailPro object (20)',3,'',19,1),(189,'2019-10-21 21:18:22.620780','33','EmailPro object (33)',3,'',19,1),(190,'2019-10-21 21:18:22.757208','32','EmailPro object (32)',3,'',19,1),(191,'2019-10-21 21:56:58.427510','47','EmailPro object (47)',3,'',19,1),(192,'2019-10-21 21:56:58.836662','46','EmailPro object (46)',3,'',19,1),(193,'2019-10-21 21:56:58.905846','45','EmailPro object (45)',3,'',19,1),(194,'2019-10-21 21:56:59.013131','44','EmailPro object (44)',3,'',19,1),(195,'2019-10-21 21:56:59.059756','43','EmailPro object (43)',3,'',19,1),(196,'2019-10-21 21:56:59.106882','42','EmailPro object (42)',3,'',19,1),(197,'2019-10-21 21:56:59.142476','41','EmailPro object (41)',3,'',19,1),(198,'2019-10-21 21:56:59.178071','40','EmailPro object (40)',3,'',19,1),(199,'2019-10-21 21:56:59.225195','39','EmailPro object (39)',3,'',19,1),(200,'2019-10-21 21:56:59.271820','38','EmailPro object (38)',3,'',19,1),(201,'2019-10-21 21:56:59.307917','37','EmailPro object (37)',3,'',19,1),(202,'2019-10-21 21:56:59.343511','36','EmailPro object (36)',3,'',19,1),(203,'2019-10-21 21:56:59.390137','35','EmailPro object (35)',3,'',19,1),(204,'2019-10-21 21:56:59.450795','34','EmailPro object (34)',3,'',19,1),(205,'2019-10-22 11:28:17.299970','10','qqqq',1,'[{\"added\": {}}]',9,1),(206,'2019-10-22 13:36:17.768614','10','qqqq',3,'',9,1),(207,'2019-10-23 13:40:54.329689','5','杂谈',1,'[{\"added\": {}}]',7,1),(208,'2019-10-23 13:42:23.831675','11','动漫',1,'[{\"added\": {}}]',9,1),(209,'2019-10-23 13:55:41.366888','7','fdf',1,'[{\"added\": {}}]',8,1),(210,'2019-10-23 13:56:13.067811','7','fdf',3,'',8,1),(211,'2019-10-23 13:59:56.477951','11','dfdf',1,'[{\"added\": {}}]',8,1),(212,'2019-10-23 14:00:01.985595','11','dfdf',3,'',8,1),(213,'2019-10-23 14:01:30.588190','12','棋魂真正的结局',1,'[{\"added\": {}}]',8,1),(214,'2019-10-23 14:02:08.637320','12','棋魂真正的结局（转载）',2,'[{\"changed\": {\"fields\": [\"title\"]}}]',8,1),(215,'2019-10-30 14:52:51.667722','18','yaoshun31@163.com',2,'[{\"changed\": {\"fields\": [\"nick\"]}}]',18,1),(216,'2019-10-30 15:43:12.588230','23','18118107808@163.com',2,'[{\"changed\": {\"fields\": [\"birthday\", \"sex\"]}}]',18,1),(217,'2019-10-30 15:43:16.434489','22','yaoshun72@163.com',2,'[{\"changed\": {\"fields\": [\"birthday\", \"sex\"]}}]',18,1),(218,'2019-10-30 15:43:19.606917','19','879892739@qq.com',2,'[{\"changed\": {\"fields\": [\"birthday\"]}}]',18,1),(219,'2019-10-30 15:43:22.459510','18','yaoshun31@163.com',2,'[{\"changed\": {\"fields\": [\"birthday\"]}}]',18,1),(220,'2019-11-04 14:30:07.971558','18','yaoshun31@163.com',2,'[{\"changed\": {\"fields\": [\"avatars\"]}}]',18,1),(221,'2019-11-04 14:50:39.873574','18','yaoshun31@163.com',2,'[{\"changed\": {\"fields\": [\"avatars\"]}}]',18,1),(222,'2019-11-04 14:55:17.257009','18','yaoshun31@163.com',2,'[{\"changed\": {\"fields\": [\"avatars\"]}}]',18,1),(223,'2019-11-04 15:00:02.610768','18','yaoshun31@163.com',2,'[{\"changed\": {\"fields\": [\"avatars\"]}}]',18,1),(224,'2019-11-04 15:00:15.829764','18','yaoshun31@163.com',2,'[{\"changed\": {\"fields\": [\"avatars\"]}}]',18,1),(225,'2019-11-04 16:02:40.299907','18','yaoshun31@163.com',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',18,1),(226,'2019-11-04 16:03:12.735342','18','yaoshun31@163.com',2,'[{\"changed\": {\"fields\": [\"avatars\"]}}]',18,1),(227,'2019-11-04 16:03:51.742422','18','yaoshun31@163.com',2,'[{\"changed\": {\"fields\": [\"avatars\"]}}]',18,1),(228,'2019-11-06 11:21:02.115031','13','dfdfd',1,'[{\"added\": {}}]',8,1),(229,'2019-11-06 11:21:12.470538','14','dfdfdf',1,'[{\"added\": {}}]',8,1),(230,'2019-11-06 11:51:26.450509','26','dfdf',1,'[{\"added\": {}}]',10,1),(231,'2019-11-06 11:51:35.094472','27','fdfdf...',1,'[{\"added\": {}}]',10,1),(232,'2019-11-06 11:51:41.168654','28','fdfdf...',1,'[{\"added\": {}}]',10,1),(233,'2019-11-06 11:51:48.799911','29','fdfdf...',1,'[{\"added\": {}}]',10,1),(234,'2019-11-22 18:07:32.726361','1','百度',1,'[{\"added\": {}}]',12,1),(235,'2019-11-22 18:12:24.133579','2','微博',1,'[{\"added\": {}}]',12,1),(236,'2019-11-22 18:12:42.269220','2','微博',2,'[{\"changed\": {\"fields\": [\"href\"]}}]',12,1),(237,'2019-12-05 18:36:10.683515','23','18118107808@163.com',3,'',18,1),(238,'2019-12-05 18:40:25.777250','24','18118107808@163.com',3,'',18,1),(239,'2019-12-05 18:41:52.500031','25','18118107808@163.com',3,'',18,1),(240,'2019-12-05 18:43:14.221860','26','18118107808@163.com',3,'',18,1),(241,'2019-12-05 18:47:24.907727','27','18118107808@163.com',2,'[{\"changed\": {\"fields\": [\"status\", \"sex\"]}}]',18,1),(242,'2019-12-05 18:50:03.627400','28','18118107808@163.com',3,'',18,1),(243,'2019-12-05 18:50:03.763612','27','18118107808@163.com',3,'',18,1),(244,'2019-12-05 18:51:04.578565','29','18118107808@163.com',3,'',18,1),(245,'2019-12-05 18:55:55.824940','74','EmailPro object (74)',3,'',19,1),(246,'2019-12-05 18:55:55.898111','73','EmailPro object (73)',3,'',19,1),(247,'2019-12-05 18:55:55.933547','72','EmailPro object (72)',3,'',19,1),(248,'2019-12-05 18:55:55.969491','71','EmailPro object (71)',3,'',19,1),(249,'2019-12-05 18:55:56.005559','70','EmailPro object (70)',3,'',19,1),(250,'2019-12-05 18:55:56.052102','69','EmailPro object (69)',3,'',19,1),(251,'2019-12-05 18:55:56.098838','68','EmailPro object (68)',3,'',19,1),(252,'2019-12-05 18:55:56.123406','67','EmailPro object (67)',3,'',19,1),(253,'2019-12-05 18:55:56.170533','66','EmailPro object (66)',3,'',19,1),(254,'2019-12-05 18:55:56.206129','65','EmailPro object (65)',3,'',19,1),(255,'2019-12-05 18:55:56.230690','64','EmailPro object (64)',3,'',19,1),(256,'2019-12-05 18:55:56.266488','63','EmailPro object (63)',3,'',19,1),(257,'2019-12-05 18:55:56.302484','62','EmailPro object (62)',3,'',19,1),(258,'2019-12-05 18:55:56.349385','61','EmailPro object (61)',3,'',19,1),(259,'2019-12-05 18:55:56.373469','60','EmailPro object (60)',3,'',19,1),(260,'2019-12-05 18:55:56.420994','59','EmailPro object (59)',3,'',19,1),(261,'2019-12-05 18:55:56.527649','58','EmailPro object (58)',3,'',19,1),(262,'2019-12-05 18:55:56.553021','57','EmailPro object (57)',3,'',19,1),(263,'2019-12-05 18:55:56.599549','56','EmailPro object (56)',3,'',19,1),(264,'2019-12-05 18:55:56.646136','55','EmailPro object (55)',3,'',19,1),(265,'2019-12-05 18:55:56.693186','54','EmailPro object (54)',3,'',19,1),(266,'2019-12-05 18:55:56.728762','53','EmailPro object (53)',3,'',19,1),(267,'2019-12-05 18:55:56.776084','52','EmailPro object (52)',3,'',19,1),(268,'2019-12-05 18:55:56.811657','51','EmailPro object (51)',3,'',19,1),(269,'2019-12-05 18:55:56.858730','50','EmailPro object (50)',3,'',19,1),(270,'2019-12-05 18:55:56.894384','49','EmailPro object (49)',3,'',19,1),(271,'2019-12-05 18:55:56.930095','48','EmailPro object (48)',3,'',19,1),(272,'2019-12-05 18:56:21.378659','30','18118107808@163.com',3,'',18,1),(273,'2019-12-05 21:05:57.358192','75','EmailPro object (75)',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',19,1),(274,'2019-12-05 21:06:18.413514','75','EmailPro object (75)',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',19,1),(275,'2019-12-05 21:08:36.129985','75','EmailPro object (75)',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',19,1),(276,'2019-12-05 21:09:18.858150','75','EmailPro object (75)',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',19,1),(277,'2019-12-05 21:10:13.818542','75','EmailPro object (75)',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',19,1),(278,'2019-12-05 21:11:17.278976','22','yaoshun72@163.com',2,'[{\"changed\": {\"fields\": [\"nick\"]}}]',18,1),(279,'2019-12-06 13:37:08.324505','31','18118107808@163.com',3,'',18,1),(280,'2019-12-06 13:47:40.797681','22','yaoshun72@163.com',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',18,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(7,'blog','category'),(8,'blog','post'),(9,'blog','tag'),(10,'comment','comment'),(11,'comment','reply'),(28,'config','daynumber'),(12,'config','link'),(13,'config','sidebar'),(29,'config','userip'),(30,'config','visitnumber'),(5,'contenttypes','contenttype'),(22,'djcelery','crontabschedule'),(21,'djcelery','intervalschedule'),(20,'djcelery','periodictask'),(23,'djcelery','periodictasks'),(24,'djcelery','taskmeta'),(25,'djcelery','tasksetmeta'),(27,'djcelery','taskstate'),(26,'djcelery','workerstate'),(19,'login','emailpro'),(18,'login','user'),(6,'sessions','session'),(14,'xadmin','bookmark'),(17,'xadmin','log'),(15,'xadmin','usersettings'),(16,'xadmin','userwidget');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-06-06 10:04:21.393406'),(2,'auth','0001_initial','2019-06-06 10:04:37.501913'),(3,'admin','0001_initial','2019-06-06 10:04:41.016434'),(4,'admin','0002_logentry_remove_auto_add','2019-06-06 10:04:41.179996'),(5,'admin','0003_logentry_add_action_flag_choices','2019-06-06 10:04:41.263774'),(6,'contenttypes','0002_remove_content_type_name','2019-06-06 10:04:43.001064'),(7,'auth','0002_alter_permission_name_max_length','2019-06-06 10:04:44.324290'),(8,'auth','0003_alter_user_email_max_length','2019-06-06 10:04:45.764740'),(9,'auth','0004_alter_user_username_opts','2019-06-06 10:04:45.817598'),(10,'auth','0005_alter_user_last_login_null','2019-06-06 10:04:46.886167'),(11,'auth','0006_require_contenttypes_0002','2019-06-06 10:04:46.927085'),(12,'auth','0007_alter_validators_add_error_messages','2019-06-06 10:04:46.979923'),(13,'auth','0008_alter_user_username_max_length','2019-06-06 10:04:48.220091'),(14,'auth','0009_alter_user_last_name_max_length','2019-06-06 10:04:49.321910'),(15,'blog','0001_initial','2019-06-06 10:05:02.243058'),(16,'sessions','0001_initial','2019-06-06 10:05:03.395170'),(17,'comment','0001_initial','2019-06-06 14:13:19.111260'),(18,'comment','0002_auto_20190606_2058','2019-06-06 21:01:00.153700'),(19,'comment','0003_auto_20190606_2100','2019-06-06 21:01:03.404008'),(20,'comment','0004_auto_20190606_2100','2019-06-06 21:01:05.341829'),(21,'comment','0005_auto_20190606_2123','2019-06-06 21:23:58.703059'),(22,'comment','0006_auto_20190607_1741','2019-06-07 17:42:01.503221'),(23,'config','0001_initial','2019-06-07 17:42:02.324544'),(24,'comment','0007_auto_20190607_1755','2019-06-07 17:55:30.934751'),(25,'config','0002_auto_20190607_1755','2019-06-07 17:55:31.155753'),(26,'comment','0008_auto_20190607_1812','2019-06-07 18:12:41.126016'),(27,'xadmin','0001_initial','2019-06-07 18:12:45.067649'),(28,'xadmin','0002_log','2019-06-07 18:12:46.821121'),(29,'xadmin','0003_auto_20160715_0100','2019-06-07 18:12:47.722767'),(30,'blog','0002_auto_20190611_1040','2019-06-11 10:40:44.673627'),(31,'comment','0009_auto_20190611_1040','2019-06-11 10:40:46.089309'),(32,'blog','0002_auto_20190614_1514','2019-06-14 15:14:38.056712'),(33,'comment','0010_auto_20190614_1514','2019-06-14 15:14:40.146162'),(34,'blog','0003_auto_20190614_1540','2019-06-14 15:40:22.604033'),(35,'comment','0011_auto_20190614_1540','2019-06-14 15:40:24.066126'),(36,'comment','0012_auto_20190628_1750','2019-06-28 17:50:38.109120'),(37,'config','0003_sidebar_weight','2019-06-28 17:50:39.538112'),(38,'comment','0013_auto_20190628_2131','2019-06-28 21:31:49.737846'),(39,'config','0004_auto_20190628_2131','2019-06-28 21:31:51.158129'),(40,'comment','0014_auto_20190722_2016','2019-07-22 20:16:51.590783'),(41,'config','0005_auto_20190722_2016','2019-07-22 20:16:52.497856'),(42,'blog','0004_post_updated_time','2019-07-22 22:08:08.049646'),(43,'comment','0015_auto_20190722_2207','2019-07-22 22:08:08.795692'),(44,'login','0001_initial','2019-08-11 13:44:04.725599'),(45,'login','0002_auto_20190811_1351','2019-08-11 13:51:23.354406'),(46,'comment','0016_auto_20190811_1340','2019-08-13 15:56:29.846012'),(47,'comment','0017_auto_20190811_1343','2019-08-13 15:56:30.723517'),(48,'comment','0018_auto_20190811_1344','2019-08-13 15:56:31.509682'),(49,'comment','0019_auto_20190813_1556','2019-08-13 15:56:32.390998'),(50,'login','0003_auto_20190813_1556','2019-08-13 15:56:33.178544'),(51,'comment','0020_auto_20190814_1935','2019-08-14 19:35:21.847929'),(52,'comment','0021_auto_20190815_1442','2019-08-15 14:42:36.424989'),(53,'login','0004_auto_20190815_1442','2019-08-15 14:42:36.475338'),(54,'comment','0022_auto_20190815_1447','2019-08-15 14:47:19.269215'),(55,'login','0005_auto_20190815_1447','2019-08-15 14:47:19.923798'),(56,'comment','0023_auto_20190815_1458','2019-08-15 14:58:44.621673'),(57,'comment','0024_auto_20190815_1503','2019-08-15 15:03:34.893439'),(58,'comment','0025_auto_20190815_1504','2019-08-15 15:04:11.509123'),(59,'comment','0026_auto_20190815_1504','2019-08-15 15:04:30.885666'),(60,'comment','0027_auto_20190815_1509','2019-08-15 15:09:25.306481'),(61,'comment','0028_auto_20190815_1509','2019-08-15 15:09:56.347741'),(62,'comment','0029_auto_20190815_1510','2019-08-15 15:10:36.822398'),(63,'comment','0030_auto_20190815_1514','2019-08-15 15:14:41.860593'),(64,'comment','0031_auto_20190815_1517','2019-08-15 15:17:33.524105'),(65,'login','0002_user_birthday','2019-08-15 15:18:25.664738'),(66,'djcelery','0001_initial','2019-08-16 16:48:39.174538'),(67,'login','0003_user_avatars','2019-08-20 16:23:25.240541'),(68,'login','0004_emailpro_status','2019-08-20 17:58:32.672297'),(69,'comment','0032_auto_20190913_1536','2019-09-13 15:36:09.826684'),(70,'login','0005_auto_20190913_1536','2019-09-13 15:36:10.504213'),(71,'comment','0033_auto_20190924_1538','2019-09-24 15:38:34.594159'),(72,'comment','0034_auto_20190925_1733','2019-09-25 17:33:36.348710'),(73,'config','0006_daynumber_userip_visitnumber','2019-10-15 21:16:01.162466'),(74,'login','0002_auto_20191030_1529','2019-10-30 15:29:56.041966'),(75,'login','0003_auto_20191030_1533','2019-10-30 15:34:07.378081');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('18kwrcf83hyllfbfatihgtaxdu894hv2','YzU1YTg2ZWIxODAxYTQxZGM5YTEyYWNhMmFkYmYxMTc5YWQ3Y2QwMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OTkxOTI2ZjIzZTk1NmM4YjUwZDgwODRkZGE4MDU2MGU0MjNmYTUzIiwidXNlcm5hbWUiOiJkMjJjMGYxYTE3MzQ4MjFhYmI3YTZkMjRhYTZjZmM2NiIsIm5pY2siOiJcdTk4Y2VcdThiZWRcdTRlM2YiLCJpc19sb2dpbiI6dHJ1ZSwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==','2019-10-10 14:18:17.225784'),('1tqf2cqzytsjmdu3p6o3l96b1obwzhjk','ZWFkYWM5MzJhZmE2MTk2NGI0OTQ0NjUzZWQ5Y2NiODgxN2MyMDNlZTp7InVzZXJuYW1lIjoiZDIyYzBmMWExNzM0ODIxYWJiN2E2ZDI0YWE2Y2ZjNjYiLCJuaWNrIjoiXHU1MWFmXHU1YzI3XHU5ODdhIiwiaXNfbG9naW4iOnRydWUsIl9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6Ijc5OTE5MjZmMjNlOTU2YzhiNTBkODA4NGRkYTgwNTYwZTQyM2ZhNTMifQ==','2019-11-13 14:52:23.099954'),('2eh7px8iva7o4snxfb3ewv3p3yqg9d5z','OGU5NjllZjdiZDg0MmFjY2FmMzBiYjAzMzA1YjJhNjNiNjg2ZGMxOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OTkxOTI2ZjIzZTk1NmM4YjUwZDgwODRkZGE4MDU2MGU0MjNmYTUzIn0=','2019-06-25 10:40:22.198909'),('2isx355q7u8oc83e5fu3wmsraid1spzi','NDlhNWMxYmFkNWRmNjQ0Y2QxNGYwMDJkNTk1YmVjYjE3YmU3NzM5YTp7Im5pY2siOiJcdTk4Y2VcdThiZWRcdTRlM2YiLCJfc2Vzc2lvbl9leHBpcnkiOjAsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OTkxOTI2ZjIzZTk1NmM4YjUwZDgwODRkZGE4MDU2MGU0MjNmYTUzIiwidXNlcm5hbWUiOiJkMjJjMGYxYTE3MzQ4MjFhYmI3YTZkMjRhYTZjZmM2NiIsImlzX2xvZ2luIjp0cnVlfQ==','2019-10-07 17:24:31.666596'),('2rrucphbawrw3gpb10g6c7l8bvdd8920','M2RkYTg2NjY0ZWZhYWIwNTM2ZGNmMTA5MjI0YzViZTQyMmY0OWU2ZTp7InVzZXJuYW1lIjoiZDIyYzBmMWExNzM0ODIxYWJiN2E2ZDI0YWE2Y2ZjNjYiLCJuaWNrIjoiMTIzIiwiaXNfbG9naW4iOnRydWUsIl9zZXNzaW9uX2V4cGlyeSI6MH0=','2019-10-04 14:24:44.146379'),('3ea8qpv0g9net9nhljnzx72hz5it1w8w','NzNhZjg3Nzc0YWY2Mjk4ZGE5OGY1ZmU2NmMzNjRhMTQzZjk2ZmQ5Zjp7InVlc3JuYW1lIjoieWFvc2h1bjMxQDE2My5jb20iLCJ0aW1lem9uZSI6IjIwMTkwOTEzMTU0ODM5IiwiaXNfbG9naW4iOnRydWUsInJlIjowLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzk5MTkyNmYyM2U5NTZjOGI1MGQ4MDg0ZGRhODA1NjBlNDIzZmE1MyIsInVzZXJuYW1lIjoiZDIyYzBmMWExNzM0ODIxYWJiN2E2ZDI0YWE2Y2ZjNjYifQ==','2019-09-27 15:53:02.123178'),('558c4ru7jqk0e05s8eylna6oo9tsal8g','NGYzZjRmMjE0ZWQxMjEwYmJmNTZmYWU5MTczYzEyNTI3OWJmOWVhODp7InRva2VuIjoiZDIyYzBmMWExNzM0ODIxYWJiN2E2ZDI0YWE2Y2ZjNjYiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzk5MTkyNmYyM2U5NTZjOGI1MGQ4MDg0ZGRhODA1NjBlNDIzZmE1MyIsImVtYWlsIjoieWFvc2h1bjMxQDE2My5jb20iLCJuaWNrIjoiXHU1MWFmXHU1YzI3XHU5ODdhIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==','2019-11-06 15:59:49.438662'),('58v4cww9gfhmtup2d1chc3aht2s7t8wg','OGU5NjllZjdiZDg0MmFjY2FmMzBiYjAzMzA1YjJhNjNiNjg2ZGMxOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OTkxOTI2ZjIzZTk1NmM4YjUwZDgwODRkZGE4MDU2MGU0MjNmYTUzIn0=','2019-07-12 17:43:53.321696'),('5cueka2u3hq4wdfzeurw73i0wkn2gh3i','NmFhYzY0ODJmYThkZjI5NThkZTIzYjk3NGZjMjgzOTRiOWZjYzFiYzp7InVzZXJuYW1lIjoiZDIyYzBmMWExNzM0ODIxYWJiN2E2ZDI0YWE2Y2ZjNjYiLCJuaWNrIjoiXHU1MWFmXHU1YzI3XHU5ODdhIiwiaXNfbG9naW4iOnRydWUsIl9zZXNzaW9uX2V4cGlyeSI6MH0=','2019-10-26 12:12:30.114633'),('5g47yf4f54q7d8y5st3lbri15it6rsok','N2ZiYzY2MzA5NTY0MDU1Mjc2NzMyOTU3NjJiNDEwNjg0ZmI4MzIwMDp7Im5pY2siOiJcdTUxYWZcdTVjMjdcdTk4N2EiLCJfc2Vzc2lvbl9leHBpcnkiOjAsInVzZXJuYW1lIjoiZDIyYzBmMWExNzM0ODIxYWJiN2E2ZDI0YWE2Y2ZjNjYiLCJpc19sb2dpbiI6dHJ1ZX0=','2019-11-11 10:30:34.255959'),('5vnvkhrqr3whpm9nfqmso3k79ogfd8on','N2ZiYzY2MzA5NTY0MDU1Mjc2NzMyOTU3NjJiNDEwNjg0ZmI4MzIwMDp7Im5pY2siOiJcdTUxYWZcdTVjMjdcdTk4N2EiLCJfc2Vzc2lvbl9leHBpcnkiOjAsInVzZXJuYW1lIjoiZDIyYzBmMWExNzM0ODIxYWJiN2E2ZDI0YWE2Y2ZjNjYiLCJpc19sb2dpbiI6dHJ1ZX0=','2019-11-11 10:14:20.689281'),('680xrw05luoa5i4fhw2y503uvatogp0g','OGU5NjllZjdiZDg0MmFjY2FmMzBiYjAzMzA1YjJhNjNiNjg2ZGMxOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OTkxOTI2ZjIzZTk1NmM4YjUwZDgwODRkZGE4MDU2MGU0MjNmYTUzIn0=','2019-06-28 13:31:28.696118'),('7176v777c1x1ygyoecaupwndqlz7ww0a','MmYwMjVjNjdhNzRiZWZmODdhYzI3NmRjMDBkNWQxNDJkYmIzMDcwYjp7InRva2VuIjoiZDIyYzBmMWExNzM0ODIxYWJiN2E2ZDI0YWE2Y2ZjNjYiLCJlbWFpbCI6Inlhb3NodW4zMUAxNjMuY29tIiwibmljayI6ImZ5cyIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=','2019-11-15 17:28:39.867746'),('747wropo6jflnu4dmrs68ue3oxdlherr','NGQ0Yjg3NWIxMWFmMDAxNWFmOWNjYmNkYjdkMzhhYjU4ZTEwZDJmNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OTkxOTI2ZjIzZTk1NmM4YjUwZDgwODRkZGE4MDU2MGU0MjNmYTUzIiwidXNlcm5hbWUiOiJkMjJjMGYxYTE3MzQ4MjFhYmI3YTZkMjRhYTZjZmM2NiIsIm5pY2siOiIxMjMiLCJpc19sb2dpbiI6dHJ1ZSwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==','2019-10-07 16:34:30.386461'),('78l3rmsbr5z6oa9tiid84tejq5p542g8','NTc5NzlkYzUxNjU4ODI5OTg0Y2FkYmFhZjkzMzU3N2JmMzg0ODcyNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OTkxOTI2ZjIzZTk1NmM4YjUwZDgwODRkZGE4MDU2MGU0MjNmYTUzIiwiZm9ybSI6WzEsMl0sInN0YXR1cyI6ImVycm9yIiwibWVzc2FnZSI6Ilx1OTBhZVx1N2JiMVx1NjIxNlx1ODAwNVx1NWJjNlx1NzgwMVx1OTUxOVx1OGJlZiIsImxvZ2luX2Zyb20iOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYmxvZy9pbmRleC8iLCJuaWNrIjoiXHU1MWFmXHU1YzI3XHU5ODdhIiwiX3Nlc3Npb25fZXhwaXJ5IjowLCJ1c2VybmFtZSI6ImQyMmMwZjFhMTczNDgyMWFiYjdhNmQyNGFhNmNmYzY2IiwiaXNfbG9naW4iOnRydWV9','2019-11-10 17:09:37.055550'),('7y6d4zf545s2wrc54jujfa38wsvwl7o6','OGU5NjllZjdiZDg0MmFjY2FmMzBiYjAzMzA1YjJhNjNiNjg2ZGMxOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OTkxOTI2ZjIzZTk1NmM4YjUwZDgwODRkZGE4MDU2MGU0MjNmYTUzIn0=','2019-08-31 18:38:59.782068'),('859uwvctbaiwa1gt3x63ni4qkbuvig9a','MWNiYTcxYTFkMDFlOGI5NTBiOGRkMWI0YzBlZTY2YzViNTFlN2E3ODp7InVzZXJuYW1lIjoiZDIyYzBmMWExNzM0ODIxYWJiN2E2ZDI0YWE2Y2ZjNjYiLCJpc19sb2dpbiI6dHJ1ZX0=','2019-09-27 16:02:51.323415'),('8kgoc3e1cfwb0fe7dwxf9yrssarz2ieb','ODY2ZjYwZDM0ODI4ZWUzZmYyZDlhMzQ5ZDVmYTZhOWVkODdiNzA2Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OTkxOTI2ZjIzZTk1NmM4YjUwZDgwODRkZGE4MDU2MGU0MjNmYTUzIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==','2019-11-20 13:01:56.431870'),('8s5ymt6kzcfxlfysnq4jkd1ka1zlcetk','MDMxNWI0MDdiYmFlMzZhMThmYTUxNzQ0MGRiMzMwMzQ5MmU2MGY3Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OTkxOTI2ZjIzZTk1NmM4YjUwZDgwODRkZGE4MDU2MGU0MjNmYTUzIiwiTElTVF9RVUVSWSI6W1siYmxvZyIsInBvc3QiXSwiIl19','2019-06-25 09:39:00.523962'),('8vkv5yyhfklfm0qdfms9btsq4l2a57h3','OGU5NjllZjdiZDg0MmFjY2FmMzBiYjAzMzA1YjJhNjNiNjg2ZGMxOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OTkxOTI2ZjIzZTk1NmM4YjUwZDgwODRkZGE4MDU2MGU0MjNmYTUzIn0=','2019-10-29 11:21:23.213894'),('99z1ri26uila8cmt9l9v47iwkhm5e1st','MmRmZDg1Y2M2NjcxMDJjZjJiMWNiZmQ0OTMyMzJhYTI3NTMzMGZjNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OTkxOTI2ZjIzZTk1NmM4YjUwZDgwODRkZGE4MDU2MGU0MjNmYTUzIiwiTElTVF9RVUVSWSI6W1siYmxvZyIsImNhdGVnb3J5Il0sIiJdLCJ3aXphcmRfeGFkbWludXNlcndpZGdldF9hZG1pbl93aXphcmRfZm9ybV9wbHVnaW4iOnsic3RlcCI6bnVsbCwic3RlcF9kYXRhIjp7fSwic3RlcF9maWxlcyI6e30sImV4dHJhX2RhdGEiOnt9fX0=','2019-06-24 10:17:37.204739'),('9ldlxip37dnbq1f2sglsj1ri5psqsvbz','YjllZTVhZTUyYTM1ODkwNDI4NzQxZDk1MmNkYTZmMDdjMTA2YjdlOTp7InRva2VuIjoiZDIyYzBmMWExNzM0ODIxYWJiN2E2ZDI0YWE2Y2ZjNjYiLCJlbWFpbCI6Inlhb3NodW4zMUAxNjMuY29tIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6Ijc5OTE5MjZmMjNlOTU2YzhiNTBkODA4NGRkYTgwNTYwZTQyM2ZhNTMifQ==','2019-11-07 10:31:42.762569'),('9wr04g9w69p3c1n5oemw0733b0xsfqc5','OGU5NjllZjdiZDg0MmFjY2FmMzBiYjAzMzA1YjJhNjNiNjg2ZGMxOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OTkxOTI2ZjIzZTk1NmM4YjUwZDgwODRkZGE4MDU2MGU0MjNmYTUzIn0=','2019-08-28 20:19:33.529327'),('bcho85apk0a2geyfoql1bf0lgwop5iw7','MWNiYTcxYTFkMDFlOGI5NTBiOGRkMWI0YzBlZTY2YzViNTFlN2E3ODp7InVzZXJuYW1lIjoiZDIyYzBmMWExNzM0ODIxYWJiN2E2ZDI0YWE2Y2ZjNjYiLCJpc19sb2dpbiI6dHJ1ZX0=','2019-09-27 20:28:11.104903'),('cda42vhizh4pjw0i9dailp0s4usowbqx','NWJkNDJlM2Q1MGQ2NjM5MWMwN2EyNTdjMmZiZGIzMzkwNzY4NTVkNDp7InVzZXJuYW1lIjoiZDIyYzBmMWExNzM0ODIxYWJiN2E2ZDI0YWE2Y2ZjNjYiLCJuaWNrIjoiZnlzIiwiaXNfbG9naW4iOnRydWUsIl9zZXNzaW9uX2V4cGlyeSI6MH0=','2019-11-14 15:26:52.869214'),('ck52mp6uhyup7rohxsn8p0bgqhmkuvtj','ZWFkYWM5MzJhZmE2MTk2NGI0OTQ0NjUzZWQ5Y2NiODgxN2MyMDNlZTp7InVzZXJuYW1lIjoiZDIyYzBmMWExNzM0ODIxYWJiN2E2ZDI0YWE2Y2ZjNjYiLCJuaWNrIjoiXHU1MWFmXHU1YzI3XHU5ODdhIiwiaXNfbG9naW4iOnRydWUsIl9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6Ijc5OTE5MjZmMjNlOTU2YzhiNTBkODA4NGRkYTgwNTYwZTQyM2ZhNTMifQ==','2019-10-26 13:59:27.724325'),('co9glxf2mhnkby5n4qm49w4491qf0qp2','OGU5NjllZjdiZDg0MmFjY2FmMzBiYjAzMzA1YjJhNjNiNjg2ZGMxOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OTkxOTI2ZjIzZTk1NmM4YjUwZDgwODRkZGE4MDU2MGU0MjNmYTUzIn0=','2019-06-26 22:20:35.965251'),('cqmwpwp9zlwur5emb7jgzsyk6xkhmj2j','MDM4YTA0MjJmNDNjZTk1N2Y5MzY3YmJhMWM2OTRmMjIzYTJjM2I4YTp7Il9zZXNzaW9uX2V4cGlyeSI6MH0=','2019-10-03 16:16:04.572336'),('ctgg0ahvoyn3yfo7mahgk6ikphwoclm4','ZWFkYWM5MzJhZmE2MTk2NGI0OTQ0NjUzZWQ5Y2NiODgxN2MyMDNlZTp7InVzZXJuYW1lIjoiZDIyYzBmMWExNzM0ODIxYWJiN2E2ZDI0YWE2Y2ZjNjYiLCJuaWNrIjoiXHU1MWFmXHU1YzI3XHU5ODdhIiwiaXNfbG9naW4iOnRydWUsIl9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6Ijc5OTE5MjZmMjNlOTU2YzhiNTBkODA4NGRkYTgwNTYwZTQyM2ZhNTMifQ==','2019-10-26 20:19:54.837169'),('cuqk9w94zv4j7ot7dkcmak4tuv602iog','OGU5NjllZjdiZDg0MmFjY2FmMzBiYjAzMzA1YjJhNjNiNjg2ZGMxOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OTkxOTI2ZjIzZTk1NmM4YjUwZDgwODRkZGE4MDU2MGU0MjNmYTUzIn0=','2019-08-25 13:53:22.346733'),('el8l495fx7c677n0e6ww1h7wnhnnkwh2','Nzc0MTg3NjhlZDcyM2I1YTJiZjVlMmExMmEyODA0MTc5NDZiYmFkZTp7InVzZXJuYW1lIjoiZDIyYzBmMWExNzM0ODIxYWJiN2E2ZDI0YWE2Y2ZjNjYiLCJpc19sb2dpbiI6dHJ1ZSwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==','2019-09-28 22:14:11.987084'),('f6wzfk9zllnr57emssb8rpdvro1cn1s6','Nzc0MTg3NjhlZDcyM2I1YTJiZjVlMmExMmEyODA0MTc5NDZiYmFkZTp7InVzZXJuYW1lIjoiZDIyYzBmMWExNzM0ODIxYWJiN2E2ZDI0YWE2Y2ZjNjYiLCJpc19sb2dpbiI6dHJ1ZSwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==','2019-09-28 22:15:16.058857'),('fscd77f8b812qutuimn1vbli6bsimndw','ZWVlYmY5ZTE2MWE3YjYzYTc4NDI5ZWMyNmVkNTc2ZmUxOTAzN2M3NTp7InVzZXJuYW1lIjoiZDIyYzBmMWExNzM0ODIxYWJiN2E2ZDI0YWE2Y2ZjNjYiLCJ1aWQiOjE4LCJuaWNrIjoiZnlzIiwiaXNfbG9naW4iOnRydWUsIl9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6Ijc5OTE5MjZmMjNlOTU2YzhiNTBkODA4NGRkYTgwNTYwZTQyM2ZhNTMifQ==','2019-11-18 14:27:40.871783'),('hcdtj8dpm6x3kem2yqjfthxhbb5vuepk','OGU5NjllZjdiZDg0MmFjY2FmMzBiYjAzMzA1YjJhNjNiNjg2ZGMxOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OTkxOTI2ZjIzZTk1NmM4YjUwZDgwODRkZGE4MDU2MGU0MjNmYTUzIn0=','2019-08-30 19:48:22.157233'),('hm11zlkadiujjt4x51f377bk9hip7gn4','OGU5NjllZjdiZDg0MmFjY2FmMzBiYjAzMzA1YjJhNjNiNjg2ZGMxOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OTkxOTI2ZjIzZTk1NmM4YjUwZDgwODRkZGE4MDU2MGU0MjNmYTUzIn0=','2019-10-26 08:45:15.108996'),('imqlnysba5sqcy7xeb2hgrtq34oxtt8o','OGU5NjllZjdiZDg0MmFjY2FmMzBiYjAzMzA1YjJhNjNiNjg2ZGMxOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OTkxOTI2ZjIzZTk1NmM4YjUwZDgwODRkZGE4MDU2MGU0MjNmYTUzIn0=','2019-12-02 15:14:24.883330'),('kf06l3hmkvodevzznlfvcnqmooqkco4b','OGU5NjllZjdiZDg0MmFjY2FmMzBiYjAzMzA1YjJhNjNiNjg2ZGMxOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OTkxOTI2ZjIzZTk1NmM4YjUwZDgwODRkZGE4MDU2MGU0MjNmYTUzIn0=','2019-08-04 16:00:35.588747'),('knbsmnt3sdtjzp7hq4c06jf7s6o0en4j','OGU5NjllZjdiZDg0MmFjY2FmMzBiYjAzMzA1YjJhNjNiNjg2ZGMxOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OTkxOTI2ZjIzZTk1NmM4YjUwZDgwODRkZGE4MDU2MGU0MjNmYTUzIn0=','2019-08-22 15:59:53.285207'),('lr1h1ze8gq2yr6u9hsnatah9okjsxhay','OGU5NjllZjdiZDg0MmFjY2FmMzBiYjAzMzA1YjJhNjNiNjg2ZGMxOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OTkxOTI2ZjIzZTk1NmM4YjUwZDgwODRkZGE4MDU2MGU0MjNmYTUzIn0=','2019-08-04 14:39:18.730513'),('lzaiimpejnkjo63t0if5cgu00d28qyrb','M2FkZTljMTliZjg4NDYwZTEyN2E3NTA5MDczOTY5ODBhNjFmMTk1ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OTkxOTI2ZjIzZTk1NmM4YjUwZDgwODRkZGE4MDU2MGU0MjNmYTUzIiwidXNlcm5hbWUiOiJkMjJjMGYxYTE3MzQ4MjFhYmI3YTZkMjRhYTZjZmM2NiIsInVpZCI6MTgsIm5pY2siOiJmeXMiLCJpc19sb2dpbiI6dHJ1ZSwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==','2019-11-18 16:02:45.602378'),('m6jlglz1qnnh9e6q11u9nyez9dic46te','OGU5NjllZjdiZDg0MmFjY2FmMzBiYjAzMzA1YjJhNjNiNjg2ZGMxOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OTkxOTI2ZjIzZTk1NmM4YjUwZDgwODRkZGE4MDU2MGU0MjNmYTUzIn0=','2019-08-05 22:03:52.638328'),('n5s4dctxb2ax7rat5z41zimlbnatky7k','OGU5NjllZjdiZDg0MmFjY2FmMzBiYjAzMzA1YjJhNjNiNjg2ZGMxOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OTkxOTI2ZjIzZTk1NmM4YjUwZDgwODRkZGE4MDU2MGU0MjNmYTUzIn0=','2019-06-26 10:37:24.236595'),('o2fwz1pltu0pci8c1r9imnwq2rs8ag0c','NDlhNWMxYmFkNWRmNjQ0Y2QxNGYwMDJkNTk1YmVjYjE3YmU3NzM5YTp7Im5pY2siOiJcdTk4Y2VcdThiZWRcdTRlM2YiLCJfc2Vzc2lvbl9leHBpcnkiOjAsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OTkxOTI2ZjIzZTk1NmM4YjUwZDgwODRkZGE4MDU2MGU0MjNmYTUzIiwidXNlcm5hbWUiOiJkMjJjMGYxYTE3MzQ4MjFhYmI3YTZkMjRhYTZjZmM2NiIsImlzX2xvZ2luIjp0cnVlfQ==','2019-10-08 14:40:12.775505'),('ogfpr1x7mugrci4j8oj6wd4ji6349agc','OGU5NjllZjdiZDg0MmFjY2FmMzBiYjAzMzA1YjJhNjNiNjg2ZGMxOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OTkxOTI2ZjIzZTk1NmM4YjUwZDgwODRkZGE4MDU2MGU0MjNmYTUzIn0=','2019-09-06 11:21:52.689393'),('oo8ugmw35z8wxgq7jb7uy1zl41zbh57z','NmFhYzY0ODJmYThkZjI5NThkZTIzYjk3NGZjMjgzOTRiOWZjYzFiYzp7InVzZXJuYW1lIjoiZDIyYzBmMWExNzM0ODIxYWJiN2E2ZDI0YWE2Y2ZjNjYiLCJuaWNrIjoiXHU1MWFmXHU1YzI3XHU5ODdhIiwiaXNfbG9naW4iOnRydWUsIl9zZXNzaW9uX2V4cGlyeSI6MH0=','2019-11-11 15:23:05.923343'),('p7q1m993falggk16n506kolwimuaxsfv','M2U5YzZhYjBiOTk3MGVmMjQxNzJlNWYwNjViMDcxNTQ4Y2UyY2NjZjp7Im5pY2siOiJcdTUxYWZcdTVjMjdcdTk4N2EiLCJfc2Vzc2lvbl9leHBpcnkiOjAsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OTkxOTI2ZjIzZTk1NmM4YjUwZDgwODRkZGE4MDU2MGU0MjNmYTUzIn0=','2019-10-30 10:32:51.907974'),('pl5jgr6l8icnj31n8xhu5qf3ih9d9yrb','MWNiYTcxYTFkMDFlOGI5NTBiOGRkMWI0YzBlZTY2YzViNTFlN2E3ODp7InVzZXJuYW1lIjoiZDIyYzBmMWExNzM0ODIxYWJiN2E2ZDI0YWE2Y2ZjNjYiLCJpc19sb2dpbiI6dHJ1ZX0=','2019-09-28 21:46:51.620651'),('qa528o6bqj3p6qhhvc4funazj26embpk','YzU1YTg2ZWIxODAxYTQxZGM5YTEyYWNhMmFkYmYxMTc5YWQ3Y2QwMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OTkxOTI2ZjIzZTk1NmM4YjUwZDgwODRkZGE4MDU2MGU0MjNmYTUzIiwidXNlcm5hbWUiOiJkMjJjMGYxYTE3MzQ4MjFhYmI3YTZkMjRhYTZjZmM2NiIsIm5pY2siOiJcdTk4Y2VcdThiZWRcdTRlM2YiLCJpc19sb2dpbiI6dHJ1ZSwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==','2019-10-09 21:51:03.139859'),('rzh8l8sj41irewe78dby456v2msubpl2','ZTRmMjcxOWRiMzM2NmM2YzUwZDc1NWMxOWI3ZjA1NjU4NTE4ZGRlZDp7InVzZXJuYW1lIjoiZDIyYzBmMWExNzM0ODIxYWJiN2E2ZDI0YWE2Y2ZjNjYiLCJuaWNrIjoiXHU1MWFmXHU1YzI3XHU5ODdhIiwiaXNfbG9naW4iOnRydWV9','2019-11-11 10:34:04.394993'),('s4l36sijhpedvz8bj9y1kremitckvf3k','MWEyYjQ5ZmU5YmM4OTE5YTM1YWQ3ODI1NzFlYjZjNWMzN2MyODExOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OTkxOTI2ZjIzZTk1NmM4YjUwZDgwODRkZGE4MDU2MGU0MjNmYTUzIiwiX3Nlc3Npb25fZXhwaXJ5IjowLCJ0b2tlbiI6ImQyMmMwZjFhMTczNDgyMWFiYjdhNmQyNGFhNmNmYzY2IiwiZW1haWwiOiJ5YW9zaHVuMzFAMTYzLmNvbSJ9','2019-12-20 13:44:41.246648'),('sqe66gpxv5u580fkzt197ptg8gth0xot','MTRhZDhmZDVjMThiZTIxNTRkOWI3NjIyNDY4NzRhODE1N2ZhNmU3Njp7InVlc3JuYW1lIjoieWFvc2h1bjMxQDE2My5jb20iLCJ0aW1lem9uZSI6IjIwMTkwOTAxMjMyMzE2IiwicmUiOjAsImlzX2xvZ2luIjoxfQ==','2019-09-15 23:23:16.779329'),('t0qx4uj3rlzb7nungwf0cunw3jyw2w78','OWQwNjc4Y2Q4MWUzYjJiM2Y4ODczNDA1Y2M1MzU2OGQwZjQ1YTg4Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OTkxOTI2ZjIzZTk1NmM4YjUwZDgwODRkZGE4MDU2MGU0MjNmYTUzIiwidXNlcm5hbWUiOiJkMjJjMGYxYTE3MzQ4MjFhYmI3YTZkMjRhYTZjZmM2NiIsIm5pY2siOiJcdTUxYWZcdTVjMjdcdTk4N2EiLCJpc19sb2dpbiI6dHJ1ZSwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==','2019-10-29 21:29:12.473048'),('tg9llagc6vocq125zc20c3v5w3fjnwnm','ZDllZWExZjA0NDE2Yzk0YmQwYjFhYmYxYTllZjQwMTY2MmNiNDkxOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OTkxOTI2ZjIzZTk1NmM4YjUwZDgwODRkZGE4MDU2MGU0MjNmYTUzIiwidWVzcm5hbWUiOiJ5YW9zaHVuMzFAMTYzLmNvbSIsInRpbWV6b25lIjoiMjAxOTA5MDEyMjUyNDIiLCJyZSI6MH0=','2019-09-15 22:52:42.690546'),('trbueye6i72688tq28o47s6qpowxa4y5','ZjBjZDQzYWRmYzM4NmUyNTUzMTE4ZGUzOGQ3YzhmMTY0YjM3NTJhZTp7Im5pY2siOiJcdTUxYWZcdTVjMjdcdTk4N2EiLCJfc2Vzc2lvbl9leHBpcnkiOjB9','2019-11-11 10:19:03.045823'),('u4nb0vvlare6zuyvf43e4eu4xerrfgnu','OWQwNjc4Y2Q4MWUzYjJiM2Y4ODczNDA1Y2M1MzU2OGQwZjQ1YTg4Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OTkxOTI2ZjIzZTk1NmM4YjUwZDgwODRkZGE4MDU2MGU0MjNmYTUzIiwidXNlcm5hbWUiOiJkMjJjMGYxYTE3MzQ4MjFhYmI3YTZkMjRhYTZjZmM2NiIsIm5pY2siOiJcdTUxYWZcdTVjMjdcdTk4N2EiLCJpc19sb2dpbiI6dHJ1ZSwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==','2019-10-25 20:43:49.844355'),('uibx8dnk51k8z36h24gfe6scc7v5y0ld','OGU5NjllZjdiZDg0MmFjY2FmMzBiYjAzMzA1YjJhNjNiNjg2ZGMxOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OTkxOTI2ZjIzZTk1NmM4YjUwZDgwODRkZGE4MDU2MGU0MjNmYTUzIn0=','2019-08-21 15:34:27.849405'),('v2cm9oz9tan9536oa1o4mnucmh7nu06n','YTdhOTdmMDBmMjM4YTgyY2YzMmMwYjQxNDVlZDhmNDZhOTlmYzU0Mzp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6Ijc5OTE5MjZmMjNlOTU2YzhiNTBkODA4NGRkYTgwNTYwZTQyM2ZhNTMiLCJ1c2VybmFtZSI6ImQyMmMwZjFhMTczNDgyMWFiYjdhNmQyNGFhNmNmYzY2IiwidWlkIjoxOCwibmljayI6ImZ5cyIsImlzX2xvZ2luIjp0cnVlfQ==','2019-11-17 20:55:19.394684'),('v5y952kjt210qcx452etjlv07qp3ngtp','OGU5NjllZjdiZDg0MmFjY2FmMzBiYjAzMzA1YjJhNjNiNjg2ZGMxOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OTkxOTI2ZjIzZTk1NmM4YjUwZDgwODRkZGE4MDU2MGU0MjNmYTUzIn0=','2019-08-22 16:21:54.585445'),('vqq8wgm31mhu6615sqyzywtzodwvc8rg','OGU5NjllZjdiZDg0MmFjY2FmMzBiYjAzMzA1YjJhNjNiNjg2ZGMxOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OTkxOTI2ZjIzZTk1NmM4YjUwZDgwODRkZGE4MDU2MGU0MjNmYTUzIn0=','2019-07-12 17:43:53.025491'),('wckpthz4qtxzushcgumellb8ucymkcfg','OGU5NjllZjdiZDg0MmFjY2FmMzBiYjAzMzA1YjJhNjNiNjg2ZGMxOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OTkxOTI2ZjIzZTk1NmM4YjUwZDgwODRkZGE4MDU2MGU0MjNmYTUzIn0=','2019-08-05 16:44:06.289977'),('xqb72v9yucnkpbewm7l59nmui7lopx34','MWNiYTcxYTFkMDFlOGI5NTBiOGRkMWI0YzBlZTY2YzViNTFlN2E3ODp7InVzZXJuYW1lIjoiZDIyYzBmMWExNzM0ODIxYWJiN2E2ZDI0YWE2Y2ZjNjYiLCJpc19sb2dpbiI6dHJ1ZX0=','2019-09-27 16:18:47.846065'),('yi6cdq5mnawhrvhprkafkooo4k22gj1u','MWNiYTcxYTFkMDFlOGI5NTBiOGRkMWI0YzBlZTY2YzViNTFlN2E3ODp7InVzZXJuYW1lIjoiZDIyYzBmMWExNzM0ODIxYWJiN2E2ZDI0YWE2Y2ZjNjYiLCJpc19sb2dpbiI6dHJ1ZX0=','2019-09-28 17:37:13.473479'),('yjbpbi4oqqykdpkyrwlqon3de5mlc4r2','OGU5NjllZjdiZDg0MmFjY2FmMzBiYjAzMzA1YjJhNjNiNjg2ZGMxOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OTkxOTI2ZjIzZTk1NmM4YjUwZDgwODRkZGE4MDU2MGU0MjNmYTUzIn0=','2019-08-04 15:41:00.342815'),('zk9agyzncsygo3m5g1cf7kxa2f9y4pur','MzFhYTdlMGVmZDAwNjhmYzYyMzRmNTUwOTIzNzlmZDczYTczODE1MDp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6Ijc5OTE5MjZmMjNlOTU2YzhiNTBkODA4NGRkYTgwNTYwZTQyM2ZhNTMifQ==','2019-12-19 18:21:08.622408');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_crontabschedule`
--

DROP TABLE IF EXISTS `djcelery_crontabschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_crontabschedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `minute` varchar(64) NOT NULL,
  `hour` varchar(64) NOT NULL,
  `day_of_week` varchar(64) NOT NULL,
  `day_of_month` varchar(64) NOT NULL,
  `month_of_year` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_crontabschedule`
--

LOCK TABLES `djcelery_crontabschedule` WRITE;
/*!40000 ALTER TABLE `djcelery_crontabschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_crontabschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_intervalschedule`
--

DROP TABLE IF EXISTS `djcelery_intervalschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_intervalschedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `every` int(11) NOT NULL,
  `period` varchar(24) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_intervalschedule`
--

LOCK TABLES `djcelery_intervalschedule` WRITE;
/*!40000 ALTER TABLE `djcelery_intervalschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_intervalschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_periodictask`
--

DROP TABLE IF EXISTS `djcelery_periodictask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_periodictask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `task` varchar(200) NOT NULL,
  `args` longtext NOT NULL,
  `kwargs` longtext NOT NULL,
  `queue` varchar(200) DEFAULT NULL,
  `exchange` varchar(200) DEFAULT NULL,
  `routing_key` varchar(200) DEFAULT NULL,
  `expires` datetime(6) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `last_run_at` datetime(6) DEFAULT NULL,
  `total_run_count` int(10) unsigned NOT NULL,
  `date_changed` datetime(6) NOT NULL,
  `description` longtext NOT NULL,
  `crontab_id` int(11) DEFAULT NULL,
  `interval_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `djcelery_periodictas_crontab_id_75609bab_fk_djcelery_` (`crontab_id`),
  KEY `djcelery_periodictas_interval_id_b426ab02_fk_djcelery_` (`interval_id`),
  CONSTRAINT `djcelery_periodictas_crontab_id_75609bab_fk_djcelery_` FOREIGN KEY (`crontab_id`) REFERENCES `djcelery_crontabschedule` (`id`),
  CONSTRAINT `djcelery_periodictas_interval_id_b426ab02_fk_djcelery_` FOREIGN KEY (`interval_id`) REFERENCES `djcelery_intervalschedule` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_periodictask`
--

LOCK TABLES `djcelery_periodictask` WRITE;
/*!40000 ALTER TABLE `djcelery_periodictask` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_periodictask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_periodictasks`
--

DROP TABLE IF EXISTS `djcelery_periodictasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_periodictasks` (
  `ident` smallint(6) NOT NULL,
  `last_update` datetime(6) NOT NULL,
  PRIMARY KEY (`ident`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_periodictasks`
--

LOCK TABLES `djcelery_periodictasks` WRITE;
/*!40000 ALTER TABLE `djcelery_periodictasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_periodictasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_taskstate`
--

DROP TABLE IF EXISTS `djcelery_taskstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_taskstate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(64) NOT NULL,
  `task_id` varchar(36) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `tstamp` datetime(6) NOT NULL,
  `args` longtext,
  `kwargs` longtext,
  `eta` datetime(6) DEFAULT NULL,
  `expires` datetime(6) DEFAULT NULL,
  `result` longtext,
  `traceback` longtext,
  `runtime` double DEFAULT NULL,
  `retries` int(11) NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  `worker_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_id` (`task_id`),
  KEY `djcelery_taskstate_state_53543be4` (`state`),
  KEY `djcelery_taskstate_name_8af9eded` (`name`),
  KEY `djcelery_taskstate_tstamp_4c3f93a1` (`tstamp`),
  KEY `djcelery_taskstate_hidden_c3905e57` (`hidden`),
  KEY `djcelery_taskstate_worker_id_f7f57a05_fk_djcelery_workerstate_id` (`worker_id`),
  CONSTRAINT `djcelery_taskstate_worker_id_f7f57a05_fk_djcelery_workerstate_id` FOREIGN KEY (`worker_id`) REFERENCES `djcelery_workerstate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_taskstate`
--

LOCK TABLES `djcelery_taskstate` WRITE;
/*!40000 ALTER TABLE `djcelery_taskstate` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_taskstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_workerstate`
--

DROP TABLE IF EXISTS `djcelery_workerstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_workerstate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostname` varchar(255) NOT NULL,
  `last_heartbeat` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hostname` (`hostname`),
  KEY `djcelery_workerstate_last_heartbeat_4539b544` (`last_heartbeat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_workerstate`
--

LOCK TABLES `djcelery_workerstate` WRITE;
/*!40000 ALTER TABLE `djcelery_workerstate` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_workerstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_emailpro`
--

DROP TABLE IF EXISTS `login_emailpro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_emailpro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `send_type` varchar(10) NOT NULL,
  `send_time` datetime(6) NOT NULL,
  `status` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_emailpro`
--

LOCK TABLES `login_emailpro` WRITE;
/*!40000 ALTER TABLE `login_emailpro` DISABLE KEYS */;
INSERT INTO `login_emailpro` VALUES (75,'7893f3be72cec8a1444c63721538017321c58214003122f13c5afa7e333ca925','18118107808@163.com','register','2019-12-05 18:56:44.000000',1),(76,'7893f3be72cec8a1444c63721538017321c58214003122f13c5afa7e333ca925','18118107808@163.com','register','2019-12-06 13:37:19.341906',1),(77,'1059','yaoshun31@163.com','forget','2019-12-06 13:44:44.124895',0);
/*!40000 ALTER TABLE `login_emailpro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_user`
--

DROP TABLE IF EXISTS `login_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nick` varchar(10) NOT NULL,
  `question1` int(10) unsigned NOT NULL,
  `anwser1` varchar(255) NOT NULL,
  `question2` int(10) unsigned NOT NULL,
  `anwser2` varchar(255) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `sex` int(10) unsigned NOT NULL,
  `uid` varchar(255) NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `isActive` int(11) NOT NULL,
  `birthday` date NOT NULL,
  `avatars` varchar(100) NOT NULL,
  `introduction` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_user`
--

LOCK TABLES `login_user` WRITE;
/*!40000 ALTER TABLE `login_user` DISABLE KEYS */;
INSERT INTO `login_user` VALUES (18,'yaoshun31@163.com','25f9e794323b453885f5181f1b624d0b','fys',0,'捷安特',1,'南环中学','2019-08-20 18:04:39.444992',2,'u001',0,1,'2019-11-03','avatars/default_pWkR1rm.png','I\'m the monster'),(19,'879892739@qq.com','f2327b92c03089fb8df368744ccc1e90','风语',0,'123',2,'wew','2019-08-20 18:31:59.346421',0,'u002',0,0,'2019-10-30','avatars/default.png','I\'m the monster'),(22,'yaoshun72@163.com','879892739','321',0,'123',2,'123','2019-10-21 20:26:01.537812',1,'u001',1,0,'2019-11-03','avatars/default.png','I\'m the monster'),(32,'18118107808@163.com','f2327b92c03089fb8df368744ccc1e90','123',0,'1',2,'2','2019-12-06 13:37:17.948966',3,'u001',0,1,'2019-12-06','avatars/default.png','I\'m the monster');
/*!40000 ALTER TABLE `login_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_bookmark`
--

DROP TABLE IF EXISTS `xadmin_bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_bookmark`
--

LOCK TABLES `xadmin_bookmark` WRITE;
/*!40000 ALTER TABLE `xadmin_bookmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `xadmin_bookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_log`
--

DROP TABLE IF EXISTS `xadmin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_log`
--

LOCK TABLES `xadmin_log` WRITE;
/*!40000 ALTER TABLE `xadmin_log` DISABLE KEYS */;
INSERT INTO `xadmin_log` VALUES (1,'2019-06-08 11:50:03.487931','127.0.0.1',NULL,'','delete','批量删除 1 个 用户小组件',NULL,1),(2,'2019-06-08 12:12:43.444058','127.0.0.1','5','1','create','已添加。',10,1);
/*!40000 ALTER TABLE `xadmin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_usersettings`
--

DROP TABLE IF EXISTS `xadmin_usersettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_user_id_edeabe4a_fk_auth_user_id` (`user_id`),
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_usersettings`
--

LOCK TABLES `xadmin_usersettings` WRITE;
/*!40000 ALTER TABLE `xadmin_usersettings` DISABLE KEYS */;
INSERT INTO `xadmin_usersettings` VALUES (1,'dashboard:home:pos','2',1),(2,'site-theme','/static/xadmin/css/themes/bootstrap-xadmin.css',1);
/*!40000 ALTER TABLE `xadmin_usersettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_userwidget`
--

DROP TABLE IF EXISTS `xadmin_userwidget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) NOT NULL,
  `widget_type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_user_id_c159233a_fk_auth_user_id` (`user_id`),
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_userwidget`
--

LOCK TABLES `xadmin_userwidget` WRITE;
/*!40000 ALTER TABLE `xadmin_userwidget` DISABLE KEYS */;
INSERT INTO `xadmin_userwidget` VALUES (2,'home','html','{\"id\": \"2\", \"title\": \"Fy\'s Blog\", \"content\": \"2019/6/8:实现xadmin对传统admin的替换\\r\\n\\r\\n\"}',1);
/*!40000 ALTER TABLE `xadmin_userwidget` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-09 15:31:24
