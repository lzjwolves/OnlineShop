-- MySQL dump 10.13  Distrib 5.6.41, for Win64 (x86_64)
--
-- Host: localhost    Database: onlineshop
-- ------------------------------------------------------
-- Server version	5.6.41

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
-- Table structure for table `address_detail_info`
--

DROP TABLE IF EXISTS `address_detail_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address_detail_info` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) NOT NULL COMMENT 'ç”¨æˆ·å',
  `recipient` varchar(20) NOT NULL COMMENT 'æ”¶ä»¶äºº',
  `mobile` varchar(11) NOT NULL COMMENT 'æ”¶ä»¶äººæ‰‹æœºå·',
  `province` varchar(30) DEFAULT NULL COMMENT 'çœ',
  `city` varchar(30) DEFAULT NULL COMMENT 'å¸‚',
  `district` varchar(30) DEFAULT NULL COMMENT 'åŒºæˆ–åŽ¿',
  `street` varchar(30) DEFAULT NULL COMMENT 'è¡—é“',
  `zipcode` varchar(10) DEFAULT NULL COMMENT 'é‚®æ”¿ç¼–ç ',
  `address` varchar(100) NOT NULL DEFAULT '' COMMENT 'è¯¦ç»†åœ°å€',
  `is_default` int(1) DEFAULT '0' COMMENT 'æ˜¯å¦ä¸ºé»˜è®¤åœ°å€',
  `create_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'åˆ›å»ºæ—¶é—´',
  PRIMARY KEY (`user_name`,`address`,`recipient`,`mobile`) USING BTREE,
  KEY `user_name` (`id`,`user_name`,`address`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_detail_info`
--

LOCK TABLES `address_detail_info` WRITE;
/*!40000 ALTER TABLE `address_detail_info` DISABLE KEYS */;
INSERT INTO `address_detail_info` VALUES (15,'1457409663@qq.com','坑坑','18352561465',NULL,NULL,NULL,NULL,NULL,'龚路',1,'2018-09-22 00:58:29'),(14,'1457409663@qq.com','咋咋','13262790702',NULL,NULL,NULL,NULL,NULL,'龚路新城115栋201',0,'2018-09-22 00:58:29');
/*!40000 ALTER TABLE `address_detail_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand_item`
--

DROP TABLE IF EXISTS `brand_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brand_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) NOT NULL,
  `brand_name` varchar(255) NOT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `category_id` varchar(20) DEFAULT NULL,
  `is_enable` int(2) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `t1` (`parent_id`,`brand_name`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand_item`
--

LOCK TABLES `brand_item` WRITE;
/*!40000 ALTER TABLE `brand_item` DISABLE KEYS */;
INSERT INTO `brand_item` VALUES (1,4,'荣耀','assets/temp/brands/4/1.jpg','0401',1),(2,4,'苹果','assets/temp/brands/4/2.jpg','0402',1),(3,4,'三星','assets/temp/brands/4/3.jpg','0403',1),(4,4,'小米','assets/temp/brands/4/4.jpg','0404',1),(5,4,'锤子','assets/temp/brands/4/5.jpg','0405',1),(6,1,'bershka','assets/temp/brands/1/1.jpg','0101',1),(7,1,'pull&bear','assets/temp/brands/1/2.jpg','0102',1),(8,1,'初语','assets/temp/brands/1/3.jpg','0103',1),(9,4,'oppo','assets/temp/brands/4/6.jpg','0406',1),(10,4,'vivo','assets/temp/brands/4/7.jpg','0407',1),(12,4,'魅族','assets/temp/brands/4/8.jpg','0408',1),(13,4,'乐视','assets/temp/brands/4/9.jpg','0409',1),(14,4,'美图','assets/temp/brands/4/10.jpg','0410',1),(15,4,'联想','assets/temp/brands/4/11.jpg','0411',1),(16,4,'索尼','assets/temp/brands/4/12.jpg','0412',1),(17,1,'miiow','assets/temp/brands/1/4.jpg','0104',1),(18,1,'三枪','assets/temp/brands/1/5.jpg','0105',1),(19,1,'曼妮芬','assets/temp/brands/1/6.jpg','0106',1),(20,1,'oysho','assets/temp/brands/1/7.jpg','0107',1),(21,1,'凯撒','assets/temp/brands/1/8.jpg','0108',1),(22,1,'only','assets/temp/brands/1/9.jpg','0109',1),(23,1,'猴子','assets/temp/brands/1/10.jpg','0110',1),(24,1,'索菲丝尔','assets/temp/brands/1/11.jpg','0111',1),(25,1,'teenie','assets/temp/brands/1/12.jpg','0112',1);
/*!40000 ALTER TABLE `brand_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_item`
--

DROP TABLE IF EXISTS `cart_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL COMMENT '用户名',
  `goods_id` varchar(255) DEFAULT NULL COMMENT '商品id',
  `goods_name` varchar(255) DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `amount` int(255) DEFAULT NULL COMMENT '数量',
  `state` int(255) NOT NULL DEFAULT '1' COMMENT '1:正常 0:缺货',
  `img_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_item`
--

LOCK TABLES `cart_item` WRITE;
/*!40000 ALTER TABLE `cart_item` DISABLE KEYS */;
INSERT INTO `cart_item` VALUES (162,'1234123@qq.com','040101153672634300000005','Apple/苹果 iPhone 8',5837.00,'RMB','2018-09-17 03:18:42',1,1,'assets/temp/goods/4/1/1/5.jpg'),(166,'qqq@qq.com','040101153672634300000001','Apple /iPhone 8 Plus 64GB',6630.12,'RMB','2018-09-17 03:29:27',4,1,'assets/temp/goods/4/1/1/1.jpg'),(167,'qqq@qq.com','040101153672634300000002','Apple/苹果 iPhone 8',5837.34,'RMB','2018-09-17 03:29:27',2,1,'assets/temp/goods/4/1/1/2.jpg'),(168,'qqq@qq.com','040101153672634300000003','Apple/苹果 iPhone X',9605.00,'RMB','2018-09-17 03:29:28',2,1,'assets/temp/goods/4/1/1/3.jpg'),(169,'qqq@qq.com','040101153672634300000005','Apple/苹果 iPhone 8',5837.00,'RMB','2018-09-17 03:29:30',2,1,'assets/temp/goods/4/1/1/5.jpg'),(170,'qqq@qq.com','040101153672634300000006','Apple/苹果 iPhone X',9605.00,'RMB','2018-09-17 03:29:31',2,1,'assets/temp/goods/4/1/1/6.jpg'),(171,'32111111@qq.com','040101153672634300000002','Apple/苹果 iPhone 8',5837.34,'RMB','2018-09-18 01:12:11',1,1,'assets/temp/goods/4/1/1/2.jpg'),(172,'32111111@qq.com','040101153672634300000003','Apple/苹果 iPhone X',9605.00,'RMB','2018-09-18 01:12:11',1,1,'assets/temp/goods/4/1/1/3.jpg'),(173,'32111111@qq.com','040101153672634300000001','Apple /iPhone 8 Plus 64GB',6630.12,'RMB','2018-09-18 01:12:12',1,1,'assets/temp/goods/4/1/1/1.jpg'),(204,'111111@qq.com','040101153672634300000001','Apple iPhone 8',5999.00,'RMB','2018-10-08 09:01:20',17,1,'assets/temp/goods/4/1/1/1.jpg');
/*!40000 ALTER TABLE `cart_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_item`
--

DROP TABLE IF EXISTS `category_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) NOT NULL COMMENT '类别名称',
  `parent_id` int(11) DEFAULT NULL COMMENT '父节点',
  `child_id` int(11) DEFAULT NULL COMMENT '子节点',
  `category_id` varchar(255) DEFAULT NULL COMMENT '类别唯一id',
  `is_enable` int(11) NOT NULL DEFAULT '1' COMMENT '1：可用 0：禁用',
  PRIMARY KEY (`id`,`category_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_item`
--

LOCK TABLES `category_item` WRITE;
/*!40000 ALTER TABLE `category_item` DISABLE KEYS */;
INSERT INTO `category_item` VALUES (1,'女装',NULL,1,NULL,1),(2,'男装',NULL,2,NULL,1),(3,'美妆',NULL,3,NULL,1),(4,'手机',NULL,4,NULL,1),(5,'家电',NULL,5,NULL,1),(6,'美食',NULL,6,NULL,1),(7,'百货',NULL,7,NULL,1),(8,'女鞋',1,101,NULL,1),(9,'衣服',1,102,NULL,1),(10,'裤子',1,103,NULL,1),(11,'配饰',1,104,NULL,1),(12,'衣服',2,201,NULL,1),(13,'裤子',2,202,NULL,1),(14,'配饰',2,203,NULL,1),(15,'男鞋',2,204,NULL,1),(16,'护肤品',3,301,NULL,1),(17,'彩妆',3,302,NULL,1),(18,'洗护用品',3,303,NULL,1),(19,'iphone',401,NULL,'040101',1),(20,'锤子手机',401,NULL,'040102',1),(21,'三星',401,NULL,'040103',1),(22,'小米',401,NULL,'040104',1),(23,'华为',401,NULL,'040105',1),(24,'一加',401,NULL,'040106',1),(25,'vivo',401,NULL,'040107',1),(26,'oppo',401,NULL,'040108',1),(27,'魅族',401,NULL,'040109',1),(28,'扫地机器人',5,NULL,'0501',1),(29,'空气净化器',5,NULL,'0502',1),(30,'厨房电器',5,NULL,'0503',1),(31,'生活电器',5,NULL,'0504',1),(32,'按摩器材',5,NULL,'0505',1),(33,'零食',6,NULL,NULL,1),(34,'生鲜',6,NULL,NULL,1),(35,'酒水',6,NULL,NULL,1),(36,'整理箱',7,NULL,'0701',1),(37,'雨伞',7,NULL,'0702',1),(38,'垃圾袋',7,NULL,'0703',1),(39,'梳子镜子',7,NULL,'0704',1),(40,'帆布鞋',101,NULL,'010101',1),(41,'皮鞋',101,NULL,'010102',1),(42,'高跟鞋',101,NULL,'010103',1),(43,'平底鞋',101,NULL,'010104',1),(44,'热门品牌',4,401,NULL,1),(45,'手机配件',4,402,NULL,1),(46,'耳机',402,NULL,'040201',1),(47,'充电宝',402,NULL,'040202',1),(48,'数据线',402,NULL,'040203',1),(51,'连衣裙',102,NULL,'010201',1),(52,'卫衣',201,NULL,'020101',1),(53,'其它',4,403,NULL,1),(54,'二手买卖',403,NULL,'040301',1),(55,'售后服务',403,NULL,'040302',1),(56,'在线客服',403,NULL,'040303',1),(57,'长风衣',102,NULL,'010202',1),(58,'西装',102,NULL,'010203',1),(59,'甜美清新',102,NULL,'010204',1),(60,'街头潮流',102,NULL,'010205',1),(61,'婚纱礼服',102,NULL,'010206',1),(62,'帽子',104,NULL,'010401',1),(63,'丝巾',104,NULL,'010402',1),(64,'手套',104,NULL,'010403',1),(65,'腰带',104,NULL,'010404',1),(66,'牛仔裤',103,NULL,'010301',1);
/*!40000 ALTER TABLE `category_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_info`
--

DROP TABLE IF EXISTS `goods_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` varchar(30) NOT NULL COMMENT '所属类型id',
  `goods_id` varchar(30) NOT NULL COMMENT '商品唯一id',
  `goods_name` varchar(255) NOT NULL COMMENT '商品名称',
  `unit_price` double(20,2) NOT NULL COMMENT '单价',
  `current_price` double(20,2) DEFAULT NULL COMMENT '现价，非特价时现价等于单价',
  `currency` varchar(255) DEFAULT NULL,
  `is_special_price` int(2) DEFAULT NULL COMMENT '是否特价',
  `is_new` int(2) DEFAULT NULL COMMENT '是否新品',
  `is_hot` int(2) DEFAULT NULL COMMENT '是否火热',
  `monthly sales` bigint(20) DEFAULT NULL COMMENT '月销量',
  `total_sales` bigint(20) DEFAULT NULL COMMENT '总销量',
  `inventory` bigint(20) DEFAULT NULL COMMENT '库存量',
  `img_url` varchar(255) NOT NULL COMMENT '商品图片',
  `is_sell` int(2) DEFAULT '1' COMMENT '是否卖',
  `create_time` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL COMMENT '商品描述',
  PRIMARY KEY (`id`,`category_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_info`
--

LOCK TABLES `goods_info` WRITE;
/*!40000 ALTER TABLE `goods_info` DISABLE KEYS */;
INSERT INTO `goods_info` VALUES (1,'040101','040101153672634300000001','Apple iPhone 8',5999.00,5999.00,'RMB',0,0,1,5,20,9,'assets/temp/goods/4/1/1/1.jpg',1,'2018-09-12 15:21:31','Apple iPhone 8 (A1863) 256GB 深空灰色 移动联通电信4G手机'),(2,'040101','040101153672634300000002','Apple iPhone 8 64GB',4799.00,4799.00,'RMB',0,0,0,4,16,18,'assets/temp/goods/4/1/1/2.jpg',1,'2018-09-12 15:21:31','Apple iPhone 8 64GB 红色特别版 移动联通电信4G手机'),(3,'040101','040101153672634300000003','Apple iPhone XS Max',9599.00,9599.00,'RMB',0,1,1,35,50,96,'assets/temp/goods/4/1/1/3.jpg',1,'2018-09-12 15:21:31','Apple iPhone XS Max (A2104) 64GB 金色 移动联通电信4G手机 双卡双待'),(4,'040101','040101153672634300000004','Apple iPhone XR',6499.00,6499.00,'RMB',0,1,1,5,20,10,'assets/temp/goods/4/1/1/4.jpg',1,'2018-09-12 15:21:31','Apple iPhone XR (A2108) 64GB 白色 移动联通电信4G手机 双卡双待'),(5,'040101','040101153672634300000005','Apple iPhone X',7099.00,7099.00,'RMB',0,0,0,4,16,15,'assets/temp/goods/4/1/1/5.jpg',1,'2018-09-12 15:21:31','Apple iPhone X (A1865) 64GB 深空灰色 移动联通电信4G手机'),(6,'040101','040101153672634300000006','Apple iPhone 6',1899.00,1899.00,'RMB',0,0,0,35,50,99,'assets/temp/goods/4/1/1/6.jpg',1,'2018-09-12 15:21:31','Apple iPhone 6 32GB 金色 移动联通电信4G手机'),(7,'040101','040101153672634300000007','Apple iPhone 7',4599.00,4599.00,'RMB',0,0,0,5,20,12,'assets/temp/goods/4/1/1/7.jpg',1,'2018-09-12 15:21:31','Apple iPhone 7 (A1660) 128G 玫瑰金色 移动联通电信4G手机'),(8,'040101','040101153672634300000008','Apple 苹果 iPhone8',4698.00,4698.00,'RMB',0,0,0,4,16,18,'assets/temp/goods/4/1/1/8.jpg',1,'2018-09-12 15:21:31','Apple 苹果 iPhone X手机 深空灰色 全网通256G版'),(9,'040101','040101153672634300000009','Apple/苹果 iPhone X',8188.00,8188.00,'RMB',0,0,0,35,50,99,'assets/temp/goods/4/1/1/9.jpg',1,'2018-09-12 15:21:31','Apple 苹果 iPhone X手机 深空灰色 全网通256G版'),(10,'040101','040101153672634300000010','Apple 苹果 iPhone7',3928.00,3928.00,'RMB',0,0,0,5,20,12,'assets/temp/goods/4/1/1/10.jpg',1,'2018-09-12 15:21:31','Apple 苹果 iPhone7 手机 黑色 全网通 32GB'),(11,'040101','040101153672634300000011','Apple 苹果 iPhone 8 plus ',5768.00,5768.00,'RMB',0,0,0,4,16,18,'assets/temp/goods/4/1/1/11.jpg',1,'2018-09-12 15:21:31','Apple 苹果 iPhone 8 plus 手机 金色 全网通 64GB'),(12,'040101','040101153672634300000012','Apple 苹果 iPhone X',7099.00,7099.00,'RMB',0,0,0,35,50,99,'assets/temp/goods/4/1/1/12.jpg',1,'2018-09-12 15:21:31','Apple 苹果 iPhone X 全面屏 4G 手机 银色 全网通 64GB'),(13,'040102','040102153751703500000013','锤子（smartisan） 坚果 R1 全面屏双摄手机 碳黑色 8G+1TB',9488.00,9488.00,'RMB',0,0,0,0,0,3,'assets/temp/goods/4/1/2/1.jpg',1,'2018-09-21 16:03:55','锤子（smartisan） 坚果 R1 全面屏双摄手机 碳黑色 8G+1TB'),(14,'040102','040102153751703500000014','锤子（smartisan） 坚果 R1 8G+512GB',4999.00,4999.00,'RMB',0,0,0,14,32,22,'assets/temp/goods/4/1/2/2.jpg',1,'2018-09-21 16:03:55','锤子（smartisan） 坚果 R1 8G+512GB 纯白色 全面屏双摄 全网通4G手机 双卡双待 游戏手机'),(15,'040102','040102153751703500000015','锤子（smartisan） 坚果 R1',4499.00,4499.00,'RMB',0,0,0,0,0,3,'assets/temp/goods/4/1/2/3.jpg',1,'2018-09-21 16:03:55','锤子（smartisan） 坚果 R1 全面屏双摄 双卡双待 全网通游戏手机 炭黑色 8G+128G'),(16,'040102','040102153751703500000016','锤子（smartisan） 坚果 R1',9848.00,9848.00,'RMB',0,0,0,1,13,34,'assets/temp/goods/4/1/2/4.jpg',1,'2018-09-21 16:03:55','锤子（smartisan） 坚果 R1 全面屏双摄 双卡双待 全网通游戏手机 纯白色 8G+1TB'),(17,'040102','040102153751703500000017','锤子（smartisan） 坚果 R1',3909.00,3909.00,'RMB',0,0,0,3,24,12,'assets/temp/goods/4/1/2/5.jpg',1,'2018-09-21 16:03:55','锤子（smartisan） 坚果 R1 全面屏双摄 全网通4G手机 双卡双待 游戏手机 碳黑色 6GB+128GB “吃鸡”利器骁龙845，6.17英寸，指纹+人脸识别'),(18,'040102','040102153751703500000018','锤子（smartisan） 坚果R1',3899.00,3899.00,'RMB',0,0,0,23,133,38,'assets/temp/goods/4/1/2/6.jpg',1,'2018-09-21 16:03:55','锤子（smartisan） 坚果R1手机 炭黑 全网通(8G+128G)+一年碎屏险\r\n送创意USB分线器+无线冲+M2运动手环+吃鸡辅助+自拍杆【新品坚果pro2s】'),(19,'040102','040102153751703500000019','锤子（smartisan） 坚果R1 ',3899.00,3899.00,'RMB',0,0,0,12,12,234,'assets/temp/goods/4/1/2/7.jpg',1,'2018-09-21 16:03:55','锤子（smartisan） 坚果R1 全网通4G全面屏游戏手机 纯白色 8GB 128GB\r\n 送蓝牙耳机+自拍杆+吃鸡神器+大容量移动电源！'),(20,'040102','040102153751703500000020','锤子（smartisan） 坚果R1',3799.00,3799.00,'RMB',0,0,0,13,34,56,'assets/temp/goods/4/1/2/8.jpg',1,'2018-09-21 16:03:55','锤子（smartisan） 坚果R1 手机 炭黑色 8G+128G\r\n【下单享好礼 】眼部按摩仪+充电宝+壳+膜+一年延保 华为p20'),(21,'040102','040102153751703500000021','锤子（smartisan） 锤子 坚果R1',3499.00,3499.00,'RMB',0,0,0,12,56,111,'assets/temp/goods/4/1/2/9.jpg',1,'2018-09-21 16:03:55','锤子（smartisan） 锤子 坚果R1 全面屏手机 黑色 8G+128G\r\n现货速发！下单送大量实用好！ 坚果pro2s热销中'),(22,'040102','040102153751703500000022','锤子（smartisan） 坚果Pro2',3299.00,3299.00,'RMB',0,0,0,11,23,12,'assets/temp/goods/4/1/2/10.jpg',1,'2018-09-21 16:03:55','\r\n锤子（smartisan） 坚果Pro2 移动联通电信4G手机 双卡双待 酒红色 全网通6+256G锤子（smartisan） 坚果Pro2 移动联通电信4G手机 双卡双待 酒红色 全网通6+256G锤子（smartisan） 坚果Pro2 移动联通电信4G手机 双卡双待 酒红色 全网通6+256G锤子（smartisan） 坚果Pro2 移动联通电信4G手机 双卡双待 酒红色 全网通6+256G锤子（smartisan） 坚果Pro2 移动联通电信4G手机 双卡双待 酒红色 全网通6+256G\r\n锤'),(23,'040106','040106153751791000000023','一加手机6',3599.00,3599.00,'RMB',0,0,0,11,23,109,'assets/temp/goods/4/1/6/1.jpg',1,'2018-09-21 16:18:30','一加手机6 8GB+128GB 墨岩黑 全面屏双摄游戏手机 全网通4G 双卡双待'),(24,'040106','040106153751791000000024','一加手机6',3199.00,3199.00,'RMB',0,0,0,0,0,11,'assets/temp/goods/4/1/6/2.jpg',1,'2018-09-21 16:18:30','一加手机6 6GB+64GB 亮瓷黑 全面屏双摄游戏手机 全网通4G 双卡双待\r\n领券立减150元+送原厂耳机+3期免息！够帅，也够快！6GB+64GB，骁龙845超高性能！6.28英寸19:9全面屏！3D曲面玻璃后盖'),(25,'040106','040106153751791000000025','一加手机6',3599.00,3599.00,'RMB',0,0,0,121,213,45,'assets/temp/goods/4/1/6/3.jpg',1,'2018-09-21 16:18:30','一加手机6 8GB+128GB 月牙白 全面屏双摄游戏手机 全网通4G 双卡双待\r\n领券立减150元+送原厂耳机+3期免息！够帅，也够快！8GB+128GB，骁龙845超高性能！6.28英寸19:9全面屏！3D曲面玻璃后盖'),(26,'040106','040106153751791000000026','一加 5T（A5010）',2999.00,2999.00,'RMB',0,0,0,1,3,12,'assets/temp/goods/4/1/6/4.jpg',1,'2018-09-21 16:18:30','一加 5T（A5010）手机 OnePlus5T 星辰黑 全网通(6G+64G)'),(27,'040106','040106153751791000000027','一加 6手机 OnePlus6',4699.00,4699.00,'RMB',0,0,0,12,120,23,'assets/temp/goods/4/1/6/5.jpg',1,'2018-09-21 16:18:30','一加 6手机 OnePlus6 （六）游戏手机 复仇者联盟限量版 全网通(8G+256G)\r\n一加6全套价值399元赠品大礼包/原装正品/正规授权/售后保障'),(28,'040106','040106153751791000000028','一加 6手机 OnePlus6 5t升级版',3999.00,3999.00,'RMB',0,1,0,1,13,12,'assets/temp/goods/4/1/6/6.jpg',1,'2018-09-21 16:18:30','一加 6手机 OnePlus6 5t升级版 全面屏双摄游戏手机 全网通4G 双卡双待 墨岩黑 8GB+256GB\r\n【 官方正品】一加6骁龙845，超高性能超高颜值！！！ 【购机享中秋大礼包】运动蓝牙耳机+吃鸡神器+不限流量大王卡');
/*!40000 ALTER TABLE `goods_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail_info`
--

DROP TABLE IF EXISTS `order_detail_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_detail_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(50) NOT NULL COMMENT '订单号',
  `goods_id` varchar(255) NOT NULL COMMENT '商品id',
  `goods_name` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `price` double(30,2) NOT NULL,
  `currency` varchar(255) DEFAULT NULL COMMENT '货币单位',
  `amount` int(20) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`order_id`,`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail_info`
--

LOCK TABLES `order_detail_info` WRITE;
/*!40000 ALTER TABLE `order_detail_info` DISABLE KEYS */;
INSERT INTO `order_detail_info` VALUES (22,'153721832483071174609','040101153672634300000001','Apple /iPhone 8 Plus 64GB',6630.12,'RMB',4,'assets/temp/goods/4/1/1/1.jpg','2018-09-18 05:05:25'),(23,'153721832483071174609','040101153672634300000002','Apple/苹果 iPhone 8',5837.34,'RMB',1,'assets/temp/goods/4/1/1/2.jpg','2018-09-18 05:05:25'),(24,'153721832483071174609','040101153672634300000003','Apple/苹果 iPhone X',9605.00,'RMB',1,'assets/temp/goods/4/1/1/3.jpg','2018-09-18 05:05:25'),(25,'153721858420873036138','040101153672634300000003','Apple/苹果 iPhone X',9605.00,'RMB',1,'assets/temp/goods/4/1/1/3.jpg','2018-09-18 05:09:44'),(26,'153721858420873036138','040101153672634300000001','Apple /iPhone 8 Plus 64GB',6630.12,'RMB',1,'assets/temp/goods/4/1/1/1.jpg','2018-09-18 05:09:44'),(27,'153721858420873036138','040101153672634300000005','Apple/苹果 iPhone 8',5837.00,'RMB',1,'assets/temp/goods/4/1/1/5.jpg','2018-09-18 05:09:44'),(28,'153721858420873036138','040101153672634300000004','Apple /iPhone 8 Plus 64GB',6630.00,'RMB',1,'assets/temp/goods/4/1/1/4.jpg','2018-09-18 05:09:44'),(29,'153721915324650054932','040101153672634300000001','Apple /iPhone 8 Plus 64GB',6630.12,'RMB',1,'assets/temp/goods/4/1/1/1.jpg','2018-09-18 05:19:13'),(30,'153721915324650054932','040101153672634300000003','Apple/苹果 iPhone X',9605.00,'RMB',1,'assets/temp/goods/4/1/1/3.jpg','2018-09-18 05:19:13'),(31,'153721915324650054932','040101153672634300000005','Apple/苹果 iPhone 8',5837.00,'RMB',1,'assets/temp/goods/4/1/1/5.jpg','2018-09-18 05:19:13'),(32,'153721920826541412044','040101153672634300000001','Apple /iPhone 8 Plus 64GB',6630.12,'RMB',1,'assets/temp/goods/4/1/1/1.jpg','2018-09-18 05:20:08'),(33,'153721920826541412044','040101153672634300000004','Apple /iPhone 8 Plus 64GB',6630.00,'RMB',1,'assets/temp/goods/4/1/1/4.jpg','2018-09-18 05:20:08'),(34,'153721920826541412044','040101153672634300000005','Apple/苹果 iPhone 8',5837.00,'RMB',1,'assets/temp/goods/4/1/1/5.jpg','2018-09-18 05:20:08'),(35,'153728885564883379469','040101153672634300000002','Apple/苹果 iPhone 8',5837.34,'RMB',1,'assets/temp/goods/4/1/1/2.jpg','2018-09-19 00:40:56'),(36,'153728885564883379469','040101153672634300000003','Apple/苹果 iPhone X',9605.00,'RMB',1,'assets/temp/goods/4/1/1/3.jpg','2018-09-19 00:40:56'),(37,'153729242037140298470','040101153672634300000001','Apple /iPhone 8 Plus 64GB',6630.12,'RMB',1,'assets/temp/goods/4/1/1/1.jpg','2018-09-19 01:40:20'),(38,'153729242037140298470','040101153672634300000003','Apple/苹果 iPhone X',9605.00,'RMB',1,'assets/temp/goods/4/1/1/3.jpg','2018-09-19 01:40:20'),(39,'153729242037140298470','040101153672634300000004','Apple /iPhone 8 Plus 64GB',6630.00,'RMB',1,'assets/temp/goods/4/1/1/4.jpg','2018-09-19 01:40:20'),(41,'153755071066985794072','040106153751791000000023','一加手机6',3599.00,'RMB',1,'assets/temp/goods/4/1/6/1.jpg','2018-09-22 01:25:11');
/*!40000 ALTER TABLE `order_detail_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(50) NOT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  `receiver` varchar(255) DEFAULT NULL COMMENT '收货人',
  `mobile` varchar(255) DEFAULT NULL COMMENT '收货人电话',
  `address` varchar(255) DEFAULT NULL COMMENT '收货人地址',
  `total_pay` double(255,2) DEFAULT NULL COMMENT '付款总额',
  `payment` int(255) DEFAULT NULL COMMENT '付款方式：0 积分 1现金 2 混合',
  `create_time` datetime DEFAULT NULL COMMENT '下单时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '用户备注',
  `state` int(255) DEFAULT NULL COMMENT '0：待发货，1待收货，2.确认收货',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES (9,'153721858420873036138','111111@qq.com',NULL,NULL,NULL,172212.72,0,'2018-09-18 05:09:44',NULL,0),(10,'153721915324650054932','111111@qq.com',NULL,NULL,NULL,132432.72,0,'2018-09-18 05:19:13',NULL,0),(11,'153721920826541412044','111111@qq.com',NULL,NULL,NULL,114582.72,0,'2018-09-18 05:20:08',NULL,0),(12,'153728885564883379469','111111@qq.com','','','',92654.04,0,'2018-09-19 00:40:56',NULL,0),(13,'153729242037140298470','111111@qq.com','王狗子','18352561234','上海市浦东任命医院精神科201室',137190.72,0,'2018-09-19 01:40:20','尼玛比',0),(15,'153755071066985794072','1457409663@qq.com','咋咋','13262790702','龚路新城115栋201',3599.00,0,'2018-09-22 01:25:11','',1);
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sign_in_info`
--

DROP TABLE IF EXISTS `sign_in_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sign_in_info` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `sign_in_time` datetime DEFAULT NULL COMMENT '签到时间',
  `sign_in_date` date NOT NULL COMMENT '签到日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sign_in_info`
--

LOCK TABLES `sign_in_info` WRITE;
/*!40000 ALTER TABLE `sign_in_info` DISABLE KEYS */;
INSERT INTO `sign_in_info` VALUES (6,'111111@qq.com','2018-09-19 23:37:43','2018-09-19'),(8,'1457409663@qq.com','2018-09-22 01:24:26','2018-09-22'),(9,'111111@qq.com','2018-10-08 09:00:28','2018-10-08'),(10,'111111@qq.com','2018-10-10 20:24:36','2018-10-10'),(11,'18213451234','2018-10-10 21:36:48','2018-10-10');
/*!40000 ALTER TABLE `sign_in_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test` (
  `a` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_account_info`
--

DROP TABLE IF EXISTS `user_account_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_account_info` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) NOT NULL COMMENT '111',
  `user_password` varchar(100) NOT NULL COMMENT '11',
  `is_realname_verified` int(1) DEFAULT '0' COMMENT '111111',
  `is_locked` int(1) DEFAULT '0' COMMENT '11111',
  `safe_question1` varchar(255) NOT NULL DEFAULT '' COMMENT '1111',
  `safe_answer1` varchar(255) NOT NULL DEFAULT '' COMMENT '111111',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '1111',
  `last_visit_time` datetime DEFAULT NULL COMMENT '111111',
  `total_visits` bigint(20) unsigned zerofill DEFAULT NULL COMMENT '111111',
  `account_type` int(2) DEFAULT NULL COMMENT '账号类型。0：手机号，1：邮箱',
  `gold` int(255) unsigned DEFAULT '0' COMMENT '金币',
  PRIMARY KEY (`user_name`) USING BTREE,
  KEY `user_name` (`id`,`user_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_account_info`
--

LOCK TABLES `user_account_info` WRITE;
/*!40000 ALTER TABLE `user_account_info` DISABLE KEYS */;
INSERT INTO `user_account_info` VALUES (37,'111111@qq.com','6CF3F46EA537C5B89A129E4D5CABF1AB',0,0,'','','2018-09-11 01:01:31','2018-10-10 21:11:06',00000000000000000869,1,76160),(29,'11111@qq.com','6CF3F46EA537C5B89A129E4D5CABF1AB',0,0,'','','2018-09-09 23:00:01','2018-09-09 23:00:01',00000000000000000000,0,0),(28,'12234567896@qq.com','20833409018FEDEC8D9A45D477D22F75',0,0,'','','2018-09-09 22:50:45','2018-09-09 22:50:45',00000000000000000000,0,0),(39,'1234123@qq.com','6CF3F46EA537C5B89A129E4D5CABF1AB',0,0,'','','2018-09-17 02:43:35','2018-09-17 03:21:40',00000000000000000019,1,0),(36,'12345678@qq.com','6CF3F46EA537C5B89A129E4D5CABF1AB',0,0,'','','2018-09-10 00:15:06','2018-09-10 00:15:06',00000000000000000001,1,0),(35,'123456@qq.com','6CF3F46EA537C5B89A129E4D5CABF1AB',0,0,'','','2018-09-09 23:55:35','2018-09-09 23:55:35',00000000000000000000,0,0),(30,'12345@qq.com','6CF3F46EA537C5B89A129E4D5CABF1AB',0,0,'','','2018-09-09 23:40:51','2018-09-09 23:40:51',00000000000000000000,0,0),(31,'13412341345','6CF3F46EA537C5B89A129E4D5CABF1AB',0,0,'','','2018-09-09 23:44:49','2018-09-09 23:44:49',00000000000000000000,0,0),(32,'13712341234','6CF3F46EA537C5B89A129E4D5CABF1AB',0,0,'','','2018-09-09 23:46:01','2018-09-09 23:46:01',00000000000000000000,0,0),(26,'13867341234','6CF3F46EA537C5B89A129E4D5CABF1AB',0,0,'','','2018-09-09 01:03:15','2018-09-09 01:03:15',00000000000000000000,0,0),(34,'13879861234','20833409018FEDEC8D9A45D477D22F75',0,0,'','','2018-09-09 23:52:31','2018-09-09 23:52:31',00000000000000000000,0,0),(42,'1457409663@qq.com','ACBB494D4E1692F9C067E129556E4453',0,0,'','','2018-09-22 00:15:10','2018-09-24 13:05:42',00000000000000000094,1,2010),(23,'18213451234','6CF3F46EA537C5B89A129E4D5CABF1AB',0,0,'','','2018-09-09 00:47:14','2018-10-10 21:29:30',00000000000000000205,0,38000),(25,'18245637645','20833409018FEDEC8D9A45D477D22F75',0,0,'','','2018-09-09 01:01:03','2018-09-09 01:01:03',00000000000000000000,0,0),(24,'18345671342','E297271E37B635391A274BE8674AC8F4',0,0,'','','2018-09-09 00:55:34','2018-09-09 00:55:34',00000000000000000000,0,0),(33,'18356561234','6CF3F46EA537C5B89A129E4D5CABF1AB',0,0,'','','2018-09-09 23:50:13','2018-09-09 23:50:13',00000000000000000000,0,0),(38,'221221@qq.com','6CF3F46EA537C5B89A129E4D5CABF1AB',0,0,'','','2018-09-17 02:38:53','2018-09-17 02:39:45',00000000000000000001,1,0),(41,'32111111@qq.com','6CF3F46EA537C5B89A129E4D5CABF1AB',0,0,'','','2018-09-18 01:12:05','2018-09-18 01:12:42',00000000000000000008,1,0),(40,'qqq@qq.com','6CF3F46EA537C5B89A129E4D5CABF1AB',0,0,'','','2018-09-17 03:26:34','2018-09-17 03:59:09',00000000000000000011,1,0);
/*!40000 ALTER TABLE `user_account_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_detail_info`
--

DROP TABLE IF EXISTS `user_detail_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_detail_info` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '???',
  `user_sex` int(1) DEFAULT '0' COMMENT '性别',
  `nickname` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '??',
  `remark` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '????',
  `head_picture` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT '??',
  `user_realname` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '????',
  `id_card` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '????',
  `birthday` varchar(8) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '??',
  `address` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '????',
  PRIMARY KEY (`user_name`) USING BTREE,
  KEY `user_name` (`id`,`user_name`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_detail_info`
--

LOCK TABLES `user_detail_info` WRITE;
/*!40000 ALTER TABLE `user_detail_info` DISABLE KEYS */;
INSERT INTO `user_detail_info` VALUES (1,'我的',0,'1','1','1','1','1','1','1');
/*!40000 ALTER TABLE `user_detail_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-11 22:22:38
