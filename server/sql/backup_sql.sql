-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: supermarket_comparator
-- ------------------------------------------------------
-- Server version	8.0.45

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`,`product_id`),
  KEY `fk_carts_product` (`product_id`),
  CONSTRAINT `fk_carts_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_carts_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` VALUES (2,1,3,'2026-03-10 12:23:21'),(2,2,2,'2026-03-10 12:23:25'),(2,3,1,'2026-03-10 12:23:28'),(2,5,1,'2026-03-10 12:23:31'),(2,41,1,'2026-03-10 12:24:19'),(2,42,1,'2026-03-10 12:24:21'),(2,43,1,'2026-03-10 12:24:22'),(2,44,1,'2026-03-10 12:24:23'),(2,45,1,'2026-03-10 12:24:25'),(2,81,3,'2026-03-10 12:24:33'),(2,82,1,'2026-03-10 12:24:34'),(2,83,2,'2026-03-10 12:24:36'),(2,84,2,'2026-03-10 12:24:40'),(8,1,3,'2026-03-10 12:31:06'),(8,2,2,'2026-03-10 12:31:07'),(8,3,2,'2026-03-10 12:31:09');
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `supermarket_id` int NOT NULL,
  `text` text COLLATE utf8mb4_general_ci NOT NULL,
  `image_url` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_comments_user` (`user_id`),
  KEY `fk_comments_product` (`product_id`),
  KEY `fk_comments_supermarket` (`supermarket_id`),
  CONSTRAINT `fk_comments_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_comments_supermarket` FOREIGN KEY (`supermarket_id`) REFERENCES `supermarkets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_comments_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,2,1,1,'החלב הגיע לי מקולקל','1773138623505-278469876.jpg','2026-03-10 12:30:23'),(2,8,1,1,'החלב הגיע מעוך לגמרי ונשפך הרוב',NULL,'2026-03-10 12:31:52');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `brand` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `quantity` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `category` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'חלב 3%','תנובה','1 ליטר','dairy','2026-03-08 11:54:01'),(2,'חלב 1%','תנובה','1 ליטר','dairy','2026-03-08 11:54:01'),(3,'חלב ללא לקטוז','תנובה','1 ליטר','dairy','2026-03-08 11:54:01'),(4,'שוקו','יטבתה','1 ליטר','dairy','2026-03-08 11:54:01'),(5,'יוגורט טבעי','דנונה','200 גרם','dairy','2026-03-08 11:54:01'),(6,'יוגורט תות','דנונה','200 גרם','dairy','2026-03-08 11:54:01'),(7,'קוטג׳ 5%','תנובה','250 גרם','dairy','2026-03-08 11:54:01'),(8,'גבינה לבנה 5%','תנובה','500 גרם','dairy','2026-03-08 11:54:01'),(9,'גבינה צהובה פרוסות','עמק','200 גרם','dairy','2026-03-08 11:54:01'),(10,'גבינת שמנת','פילדלפיה','200 גרם','dairy','2026-03-08 11:54:01'),(11,'חמאה','תנובה','200 גרם','dairy','2026-03-08 11:54:01'),(12,'שמנת לבישול 15%','תנובה','500 מ״ל','dairy','2026-03-08 11:54:01'),(13,'שמנת מתוקה 38%','תנובה','250 מ״ל','dairy','2026-03-08 11:54:01'),(14,'גבינת פטה','פיראוס','200 גרם','dairy','2026-03-08 11:54:01'),(15,'מוצרלה מגוררת','גד','200 גרם','dairy','2026-03-08 11:54:01'),(16,'פרמזן מגורד','גד','100 גרם','dairy','2026-03-08 11:54:01'),(17,'מעדן שוקולד','דנונה','4 יחידות','dairy','2026-03-08 11:54:01'),(18,'לבנה','תנובה','200 גרם','dairy','2026-03-08 11:54:01'),(19,'ביצים L','משק מקומי','12 יחידות','dairy','2026-03-08 11:54:01'),(20,'ביצים M','משק מקומי','12 יחידות','dairy','2026-03-08 11:54:01'),(21,'עגבניות','טרי','1 ק״ג','fruits','2026-03-08 11:54:01'),(22,'מלפפונים','טרי','1 ק״ג','fruits','2026-03-08 11:54:01'),(23,'פלפל אדום','טרי','1 ק״ג','fruits','2026-03-08 11:54:01'),(24,'פלפל ירוק','טרי','1 ק״ג','fruits','2026-03-08 11:54:01'),(25,'בצל','טרי','1 ק״ג','fruits','2026-03-08 11:54:01'),(26,'שום','טרי','3 ראשים','fruits','2026-03-08 11:54:01'),(27,'גזר','טרי','1 ק״ג','fruits','2026-03-08 11:54:01'),(28,'תפוח אדמה','טרי','2 ק״ג','fruits','2026-03-08 11:54:01'),(29,'בטטה','טרי','1 ק״ג','fruits','2026-03-08 11:54:01'),(30,'חסה','טרי','1 יחידה','fruits','2026-03-08 11:54:01'),(31,'עגבניות שרי','טרי','500 גרם','fruits','2026-03-08 11:54:01'),(32,'פטריות שמפיניון','טרי','250 גרם','fruits','2026-03-08 11:54:01'),(33,'בננות','טרי','1 ק״ג','fruits','2026-03-08 11:54:01'),(34,'תפוחים','טרי','1 ק״ג','fruits','2026-03-08 11:54:01'),(35,'תפוזים','טרי','1 ק״ג','fruits','2026-03-08 11:54:01'),(36,'קלמנטינות','טרי','1 ק״ג','fruits','2026-03-08 11:54:01'),(37,'ענבים','טרי','500 גרם','fruits','2026-03-08 11:54:01'),(38,'לימונים','טרי','500 גרם','fruits','2026-03-08 11:54:01'),(39,'אבוקדו','טרי','3 יחידות','fruits','2026-03-08 11:54:01'),(40,'תותים','טרי','500 גרם','fruits','2026-03-08 11:54:01'),(41,'חזה עוף','טרי','1 ק״ג','meat','2026-03-08 11:54:01'),(42,'פרגיות','טרי','1 ק״ג','meat','2026-03-08 11:54:01'),(43,'שוקיים עוף','טרי','1 ק״ג','meat','2026-03-08 11:54:01'),(44,'כנפיים עוף','טרי','1 ק״ג','meat','2026-03-08 11:54:01'),(45,'בשר טחון','טרי','500 גרם','meat','2026-03-08 11:54:01'),(46,'בשר בקר לצלי','טרי','1 ק״ג','meat','2026-03-08 11:54:01'),(47,'קבב קפוא','זוגלובק','400 גרם','meat','2026-03-08 11:54:01'),(48,'נקניקיות','זוגלובק','300 גרם','meat','2026-03-08 11:54:01'),(49,'פסטרמה','זוגלובק','200 גרם','meat','2026-03-08 11:54:01'),(50,'סלמי','מעדני יחיעם','200 גרם','meat','2026-03-08 11:54:01'),(51,'שניצל עוף מצופה','מאמא עוף','700 גרם','meat','2026-03-08 11:54:01'),(52,'המבורגר קפוא','מעדני יחיעם','4 יחידות','meat','2026-03-08 11:54:01'),(53,'דג סלמון','טרי','400 גרם','meat','2026-03-08 11:54:01'),(54,'דג אמנון','טרי','1 ק״ג','meat','2026-03-08 11:54:01'),(55,'דג מושט קפוא','דלי דגים','600 גרם','meat','2026-03-08 11:54:01'),(56,'טונה בשמן','סטארקיסט','3×160 גרם','meat','2026-03-08 11:54:01'),(57,'טונה במים','סטארקיסט','3×160 גרם','meat','2026-03-08 11:54:01'),(58,'סרדינים','פרימיום','125 גרם','meat','2026-03-08 11:54:01'),(59,'קציצות בקר קפואות','זוגלובק','500 גרם','meat','2026-03-08 11:54:01'),(60,'קציצות עוף קפואות','מאמא עוף','600 גרם','meat','2026-03-08 11:54:01'),(61,'שוקולד חלב','עלית','100 גרם','snacks','2026-03-08 11:54:01'),(62,'שוקולד מריר 60%','עלית','100 גרם','snacks','2026-03-08 11:54:01'),(63,'שוקולד לבן','עלית','100 גרם','snacks','2026-03-08 11:54:01'),(64,'וופלים','לואקר','175 גרם','snacks','2026-03-08 11:54:01'),(65,'עוגיות חמאה','דניש בטר','200 גרם','snacks','2026-03-08 11:54:01'),(66,'פתי בר','אסם','500 גרם','snacks','2026-03-08 11:54:01'),(67,'ביסקוויטים שוקולד','אסם','500 גרם','snacks','2026-03-08 11:54:01'),(68,'במבה','אסם','80 גרם','snacks','2026-03-08 11:54:01'),(69,'ביסלי BBQ','אסם','70 גרם','snacks','2026-03-08 11:54:01'),(70,'צ׳יטוס','אסם','70 גרם','snacks','2026-03-08 11:54:01'),(71,'דוריטוס נאצ׳ו','דוריטוס','70 גרם','snacks','2026-03-08 11:54:01'),(72,'תפוצ׳יפס קלאסי','תפוצ׳יפס','150 גרם','snacks','2026-03-08 11:54:01'),(73,'פופקורן למיקרו','אסם','3 שקיות','snacks','2026-03-08 11:54:01'),(74,'קורנפלקס','תלמה','750 גרם','snacks','2026-03-08 11:54:01'),(75,'דגני בוקר שוקו','תלמה','500 גרם','snacks','2026-03-08 11:54:01'),(76,'גרנולה','אלופים','500 גרם','snacks','2026-03-08 11:54:01'),(77,'ממרח שוקולד','השחר','500 גרם','snacks','2026-03-08 11:54:01'),(78,'ריבה תות','אחוה','400 גרם','snacks','2026-03-08 11:54:01'),(79,'דבש','יד מרדכי','350 גרם','snacks','2026-03-08 11:54:01'),(80,'סוכריות גומי','Haribo','200 גרם','snacks','2026-03-08 11:54:01'),(81,'מים מינרליים','נביעות','6×1.5 ליטר','drinks','2026-03-08 11:54:01'),(82,'מים מוגזים','סן בנדטו','1 ליטר','drinks','2026-03-08 11:54:01'),(83,'קולה','קוקה קולה','1.5 ליטר','drinks','2026-03-08 11:54:01'),(84,'קולה זירו','קוקה קולה','1.5 ליטר','drinks','2026-03-08 11:54:01'),(85,'ספרייט','קוקה קולה','1.5 ליטר','drinks','2026-03-08 11:54:01'),(86,'פאנטה','קוקה קולה','1.5 ליטר','drinks','2026-03-08 11:54:01'),(87,'מיץ תפוזים','פרימור','1 ליטר','drinks','2026-03-08 11:54:01'),(88,'מיץ תפוחים','פרימור','1 ליטר','drinks','2026-03-08 11:54:01'),(89,'תה שחור','ויסוצקי','25 שקיות','drinks','2026-03-08 11:54:01'),(90,'תה ירוק','ויסוצקי','25 שקיות','drinks','2026-03-08 11:54:01'),(91,'תה נענע','ויסוצקי','25 שקיות','drinks','2026-03-08 11:54:01'),(92,'קפה נמס','עלית','200 גרם','drinks','2026-03-08 11:54:01'),(93,'קפה שחור','עלית','200 גרם','drinks','2026-03-08 11:54:01'),(94,'שוקו בקבוק קטן','יטבתה','250 מ״ל','drinks','2026-03-08 11:54:01'),(95,'סודה','שוופס','1 ליטר','drinks','2026-03-08 11:54:01'),(96,'משקה אנרגיה','XL','250 מ״ל','drinks','2026-03-08 11:54:01'),(97,'מי טוניק','שוופס','1 ליטר','drinks','2026-03-08 11:54:01'),(98,'מיץ ענבים','פרימור','1 ליטר','drinks','2026-03-08 11:54:01'),(99,'מים בטעמים','נביעות','1 ליטר','drinks','2026-03-08 11:54:01'),(100,'חליטת צמחים','ויסוצקי','20 שקיות','drinks','2026-03-08 11:54:01'),(101,'נייר טואלט','לילי','24 גלילים','cleaning','2026-03-08 11:54:01'),(102,'מגבות נייר','ניקול','6 גלילים','cleaning','2026-03-08 11:54:01'),(103,'טישו','קלינקס','6 קופסאות','cleaning','2026-03-08 11:54:01'),(104,'סבון כלים','פיירי','650 מ״ל','cleaning','2026-03-08 11:54:01'),(105,'אקונומיקה','סנו','1 ליטר','cleaning','2026-03-08 11:54:01'),(106,'נוזל ניקוי רצפות','סנו','1 ליטר','cleaning','2026-03-08 11:54:01'),(107,'מסיר שומנים','סנו','750 מ״ל','cleaning','2026-03-08 11:54:01'),(108,'מרכך כביסה','בדין','1 ליטר','cleaning','2026-03-08 11:54:01'),(109,'אבקת כביסה','אריאל','3 ק״ג','cleaning','2026-03-08 11:54:01'),(110,'קפסולות למדיח','פיניש','40 יחידות','cleaning','2026-03-08 11:54:01'),(111,'נוזל חיטוי','סנו די','1 ליטר','cleaning','2026-03-08 11:54:01'),(112,'שקיות אשפה','ניקול','50 יחידות','cleaning','2026-03-08 11:54:01'),(113,'סבון ידיים','Dove','500 מ״ל','cleaning','2026-03-08 11:54:01'),(114,'שמפו','פינוק','700 מ״ל','cleaning','2026-03-08 11:54:01'),(115,'מרכך שיער','פינוק','700 מ״ל','cleaning','2026-03-08 11:54:01'),(116,'משחת שיניים','קולגייט','100 מ״ל','cleaning','2026-03-08 11:54:01'),(117,'דאודורנט','Dove','150 מ״ל','cleaning','2026-03-08 11:54:01'),(118,'קרם גוף','Dove','400 מ״ל','cleaning','2026-03-08 11:54:01'),(119,'נייר אלומיניום','סנו סושי','30 מטר','cleaning','2026-03-08 11:54:01'),(120,'נייר אפייה','סנו סושי','50 דפים','cleaning','2026-03-08 11:54:01'),(121,'ברוקולי קפוא','סנפרוסט','800 גרם','frozen','2026-03-08 11:54:01'),(122,'אפונה וגזר קפוא','סנפרוסט','800 גרם','frozen','2026-03-08 11:54:01'),(123,'תירס קפוא','סנפרוסט','800 גרם','frozen','2026-03-08 11:54:01'),(124,'שעועית ירוקה קפואה','סנפרוסט','800 גרם','frozen','2026-03-08 11:54:01'),(125,'תרד קפוא','סנפרוסט','800 גרם','frozen','2026-03-08 11:54:01'),(126,'פול ירוק קפוא','סנפרוסט','800 גרם','frozen','2026-03-08 11:54:01'),(127,'קטשופ','היינץ','500 גרם','frozen','2026-03-08 11:54:01'),(128,'מיונז','הלמנס','400 גרם','frozen','2026-03-08 11:54:01'),(129,'חרדל','היינץ','250 גרם','frozen','2026-03-08 11:54:01'),(130,'מלפפון חמוץ','יכין','670 גרם','frozen','2026-03-08 11:54:01'),(131,'זיתים ירוקים','יכין','560 גרם','frozen','2026-03-08 11:54:01'),(132,'חומוס בשימור','שופרסל','560 גרם','frozen','2026-03-08 11:54:01'),(133,'שעועית לבנה ברוטב','יכין','560 גרם','frozen','2026-03-08 11:54:01'),(134,'פטריות בשימור','יכין','560 גרם','frozen','2026-03-08 11:54:01'),(135,'תירס בשימור','יכין','560 גרם','frozen','2026-03-08 11:54:01'),(136,'רוטב עגבניות לפסטה','ברילה','400 גרם','frozen','2026-03-08 11:54:01'),(137,'רסק עגבניות מרוכז','פריניר','200 גרם','frozen','2026-03-08 11:54:01'),(138,'טונה בשימור','סטארקיסט','160 גרם','frozen','2026-03-08 11:54:01'),(139,'עגבניות מרוסקות','Mutti','400 גרם','frozen','2026-03-08 11:54:01'),(140,'רוטב פסטו','ברילה','190 גרם','frozen','2026-03-08 11:54:01'),(141,'אורז בסמטי','סוגת','1 ק״ג','pantry','2026-03-08 11:54:01'),(142,'אורז פרסי','סוגת','1 ק״ג','pantry','2026-03-08 11:54:01'),(143,'פסטה ספגטי','ברילה','500 גרם','pantry','2026-03-08 11:54:01'),(144,'פסטה פנה','ברילה','500 גרם','pantry','2026-03-08 11:54:01'),(145,'קמח לבן','שטיבל','1 ק״ג','pantry','2026-03-08 11:54:01'),(146,'קמח תופח','שטיבל','1 ק״ג','pantry','2026-03-08 11:54:01'),(147,'סוכר לבן','סוגת','1 ק״ג','pantry','2026-03-08 11:54:01'),(148,'סוכר חום','סוגת','1 ק״ג','pantry','2026-03-08 11:54:01'),(149,'מלח','מלח הארץ','1 ק״ג','pantry','2026-03-08 11:54:01'),(150,'פלפל שחור','תבליני מזרח ומערב','50 גרם','pantry','2026-03-08 11:54:01'),(151,'שמן זית','יד מרדכי','750 מ״ל','pantry','2026-03-08 11:54:01'),(152,'שמן קנולה','עץ הזית','1 ליטר','pantry','2026-03-08 11:54:01'),(153,'עדשים ירוקות','סוגת','500 גרם','pantry','2026-03-08 11:54:01'),(154,'חומוס יבש','סוגת','500 גרם','pantry','2026-03-08 11:54:01'),(155,'קוסקוס','אסם','500 גרם','pantry','2026-03-08 11:54:01'),(156,'פתיתים','אסם','500 גרם','pantry','2026-03-08 11:54:01'),(157,'קפה טחון','עלית','200 גרם','pantry','2026-03-08 11:54:01'),(158,'טונה בשמן (יחיד)','סטארקיסט','160 גרם','pantry','2026-03-08 11:54:01'),(159,'סודה לשתייה','Arm&Hammer','454 גרם','pantry','2026-03-08 11:54:01'),(160,'שיבולת שועל','קוואקר','500 גרם','pantry','2026-03-08 11:54:01'),(161,'לחם אחיד פרוס','אנג׳ל','750 גרם','bread','2026-03-08 11:54:01'),(162,'לחם קל פרוס','אנג׳ל','500 גרם','bread','2026-03-08 11:54:01'),(163,'לחם מחמצת','מאפייה','700 גרם','bread','2026-03-08 11:54:01'),(164,'חלות','אנג׳ל','2 יחידות','bread','2026-03-08 11:54:01'),(165,'פיתות','מאפיית ירושלים','10 יחידות','bread','2026-03-08 11:54:01'),(166,'לחמניות','אנג׳ל','8 יחידות','bread','2026-03-08 11:54:01'),(167,'טורטיות','אליאנס','8 יחידות','bread','2026-03-08 11:54:01'),(168,'קרואסון קפוא לאפייה','מעדנות','600 גרם','bread','2026-03-08 11:54:01'),(169,'בצק עלים','מעדנות','1 ק״ג','bread','2026-03-08 11:54:01'),(170,'בצק פילו','מעדנות','1 ק״ג','bread','2026-03-08 11:54:01'),(171,'לחמניות המבורגר','אנג׳ל','6 יחידות','bread','2026-03-08 11:54:01'),(172,'לחם שיפון','מאפייה','700 גרם','bread','2026-03-08 11:54:01'),(173,'עוגת שיש','אחוה','400 גרם','bread','2026-03-08 11:54:01'),(174,'עוגה בחושה וניל','אחוה','400 גרם','bread','2026-03-08 11:54:01'),(175,'עוגיות אוראו','Oreo','176 גרם','bread','2026-03-08 11:54:01'),(176,'בייגלה','מאפייה','6 יחידות','bread','2026-03-08 11:54:01'),(177,'לחמניית קינמון','מאפייה','4 יחידות','bread','2026-03-08 11:54:01'),(178,'בורקס גבינה','מעדנות','600 גרם','bread','2026-03-08 11:54:01'),(179,'פוקצ׳ה','מאפייה','1 יחידה','bread','2026-03-08 11:54:01'),(180,'לחם פרוס מלא','אנג׳ל','750 גרם','bread','2026-03-08 11:54:01');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supermarketproducts`
--

DROP TABLE IF EXISTS `supermarketproducts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supermarketproducts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `supermarket_id` int NOT NULL,
  `product_id` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `status` enum('available','out_of_stock','missing') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'available',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_supermarket_product` (`supermarket_id`,`product_id`),
  KEY `fk_sp_product` (`product_id`),
  CONSTRAINT `fk_sp_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_sp_supermarket` FOREIGN KEY (`supermarket_id`) REFERENCES `supermarkets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supermarketproducts`
--

LOCK TABLES `supermarketproducts` WRITE;
/*!40000 ALTER TABLE `supermarketproducts` DISABLE KEYS */;
INSERT INTO `supermarketproducts` VALUES (1,1,1,5.90,'available','2026-03-10 11:55:00'),(2,1,2,7.00,'available','2026-03-10 11:55:11'),(3,1,3,9.00,'available','2026-03-10 11:55:17'),(4,1,41,35.00,'available','2026-03-10 11:55:37'),(5,1,42,50.00,'available','2026-03-10 11:55:42'),(6,1,43,30.00,'out_of_stock','2026-03-10 11:55:55'),(7,1,44,25.00,'out_of_stock','2026-03-10 11:56:07'),(8,1,81,7.00,'available','2026-03-10 11:57:18'),(9,1,82,10.00,'available','2026-03-10 11:57:26'),(10,1,83,10.00,'available','2026-03-10 11:57:35'),(11,2,1,3.00,'available','2026-03-10 12:03:42'),(12,2,2,8.00,'available','2026-03-10 12:03:49'),(13,2,3,10.00,'available','2026-03-10 12:03:53'),(14,2,4,5.00,'out_of_stock','2026-03-10 12:03:58'),(15,2,5,7.00,'available','2026-03-10 12:04:04'),(16,2,6,8.00,'out_of_stock','2026-03-10 12:04:13'),(17,2,7,6.00,'available','2026-03-10 12:04:19'),(18,2,41,30.00,'available','2026-03-10 12:04:36'),(19,2,42,55.00,'available','2026-03-10 12:05:06'),(20,2,43,34.00,'available','2026-03-10 12:05:12'),(21,2,44,26.00,'available','2026-03-10 12:05:20'),(22,2,45,60.00,'available','2026-03-10 12:05:34'),(23,2,81,6.00,'available','2026-03-10 12:05:49'),(24,2,82,9.00,'out_of_stock','2026-03-10 12:05:54'),(25,2,83,11.00,'available','2026-03-10 12:06:01'),(26,2,84,11.00,'out_of_stock','2026-03-10 12:06:09'),(27,3,1,7.00,'available','2026-03-10 12:07:13'),(28,3,2,8.00,'available','2026-03-10 12:07:16'),(29,3,3,9.00,'available','2026-03-10 12:07:20'),(30,3,4,9.00,'available','2026-03-10 12:07:27'),(31,3,5,6.00,'available','2026-03-10 12:07:32'),(32,3,6,6.00,'available','2026-03-10 12:07:37'),(33,3,7,7.00,'out_of_stock','2026-03-10 12:07:44'),(34,3,8,7.00,'available','2026-03-10 12:07:51'),(35,3,41,25.00,'available','2026-03-10 12:08:19'),(36,3,42,50.00,'out_of_stock','2026-03-10 12:08:27'),(37,3,43,30.00,'available','2026-03-10 12:08:32'),(38,3,44,20.00,'available','2026-03-10 12:08:38'),(39,3,46,52.00,'available','2026-03-10 12:08:47'),(40,3,81,8.00,'available','2026-03-10 12:09:00'),(41,3,82,10.00,'available','2026-03-10 12:09:06'),(42,3,83,10.00,'available','2026-03-10 12:09:11'),(43,3,84,10.00,'available','2026-03-10 12:09:15'),(44,4,1,5.00,'available','2026-03-10 12:09:57'),(45,4,2,7.00,'available','2026-03-10 12:10:02'),(46,4,3,9.00,'out_of_stock','2026-03-10 12:10:08'),(47,4,5,5.00,'available','2026-03-10 12:10:14'),(48,4,6,6.00,'available','2026-03-10 12:10:18'),(49,4,41,40.00,'available','2026-03-10 12:10:27'),(50,4,42,50.00,'available','2026-03-10 12:10:35'),(51,4,43,35.00,'available','2026-03-10 12:10:44'),(52,4,44,30.00,'available','2026-03-10 12:10:50'),(53,4,45,56.00,'available','2026-03-10 12:10:56'),(54,4,81,7.00,'available','2026-03-10 12:11:05'),(55,4,82,9.00,'available','2026-03-10 12:11:09'),(56,4,83,7.00,'available','2026-03-10 12:11:14'),(57,4,84,8.00,'available','2026-03-10 12:11:19'),(58,4,85,10.00,'available','2026-03-10 12:11:24'),(59,4,86,13.00,'available','2026-03-10 12:11:29');
/*!40000 ALTER TABLE `supermarketproducts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supermarkets`
--

DROP TABLE IF EXISTS `supermarkets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supermarkets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_supermarkets_user` (`user_id`),
  CONSTRAINT `fk_supermarkets_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supermarkets`
--

LOCK TABLES `supermarkets` WRITE;
/*!40000 ALTER TABLE `supermarkets` DISABLE KEYS */;
INSERT INTO `supermarkets` VALUES (1,'רמי לוי','באר שבע',3,'2026-03-10 11:47:57'),(2,'שופרסל','באר שבע דרך חברון',4,'2026-03-10 12:03:29'),(3,'מחסני השוק','באר שבע אשל הנשיא',5,'2026-03-10 12:07:00'),(4,'אושר עד','עמק שרה באר שבע',6,'2026-03-10 12:09:46');
/*!40000 ALTER TABLE `supermarkets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `role` enum('client','manager','admin') COLLATE utf8mb4_general_ci NOT NULL,
  `supermarket_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_users_email` (`email`),
  KEY `fk_users_supermarket` (`supermarket_id`),
  CONSTRAINT `fk_users_supermarket` FOREIGN KEY (`supermarket_id`) REFERENCES `supermarkets` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'לקוח','client@gmail.com','$2b$10$092sbgc7cy2lzPFHFJXvr.GISFDzWTbOiePXQeTQ6DZ91ytvhdtLi','client',NULL,'2026-03-08 12:01:07'),(3,'רמי לוי','rami_levy@gmail.com','$2b$10$UNRW2Pcg9d3TflqknLxbielqrqBM8DcV5RHrCv3tBE532bzeNGQrm','manager',1,'2026-03-10 11:47:57'),(4,'שופרסל','shufersal@gmail.com','$2b$10$1dr31m6epc7Hgm9epblUju6a33utktyY6u43yWKyD/UBNwjONA/oG','manager',2,'2026-03-10 12:03:29'),(5,'מחסני השוק','mahsaneyHashuk@gmail.com','$2b$10$HQSDBynoh6kBQ1bdA6a6JugGLKDQZ0jD2bF8uJ1uO5ITZrKYgYDIW','manager',3,'2026-03-10 12:07:00'),(6,'אושר עד','osherAd@gmail.com','$2b$10$H1cwZM7xrncuUy5u826z3uXo9AJSNsGrDE3GO.kCyz6LtpVmAhhe6','manager',4,'2026-03-10 12:09:46'),(8,'אבי','client2@gmail.com','$2b$10$71cZWmaReC6TTJyCpQBHFeAMpiGh4Rt8aPdqlRnvr0kkmoeNX6t/.','client',NULL,'2026-03-10 12:31:00');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-12 11:31:07
