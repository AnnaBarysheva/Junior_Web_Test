#
# My Test Site Database Dump
# Evolution CMS Version:3.1.29
# 
# Host: 
# Generation Time: 23-01-2025 17:27:37
# Server version: 8.0.39
# PHP Version: 8.2.12
# Database: `evolution_db`
# Description: test_backup
#

# --------------------------------------------------------

SET @old_sql_mode := @@sql_mode;
SET @new_sql_mode := @old_sql_mode;
SET @new_sql_mode := TRIM(BOTH ',' FROM REPLACE(CONCAT(',',@new_sql_mode,','),',NO_ZERO_DATE,'  ,','));
SET @new_sql_mode := TRIM(BOTH ',' FROM REPLACE(CONCAT(',',@new_sql_mode,','),',NO_ZERO_IN_DATE,',','));
SET @@sql_mode := @new_sql_mode ;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;


# --------------------------------------------------------



# --------------------------------------------------------

#
# Table structure for table `htbu_active_user_locks`
#

DROP TABLE IF EXISTS `htbu_active_user_locks`;
CREATE TABLE `htbu_active_user_locks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sid` varchar(32) NOT NULL DEFAULT '',
  `internalKey` int NOT NULL DEFAULT '0',
  `elementType` int NOT NULL DEFAULT '0',
  `elementId` int NOT NULL DEFAULT '0',
  `lasthit` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_element_id` (`elementType`,`elementId`,`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

#
# Dumping data for table `htbu_active_user_locks`
#

INSERT INTO `htbu_active_user_locks` VALUES
  ('109','vqrb4f1c8knqebs0n3ajcpj0rp','1','7','14','1737624583'),
  ('112','vqrb4f1c8knqebs0n3ajcpj0rp','1','7','1','1737627020');


# --------------------------------------------------------

#
# Table structure for table `htbu_active_user_sessions`
#

DROP TABLE IF EXISTS `htbu_active_user_sessions`;
CREATE TABLE `htbu_active_user_sessions` (
  `sid` varchar(32) NOT NULL DEFAULT '',
  `internalKey` int NOT NULL DEFAULT '0',
  `lasthit` int NOT NULL DEFAULT '0',
  `ip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

#
# Dumping data for table `htbu_active_user_sessions`
#

INSERT INTO `htbu_active_user_sessions` VALUES
  ('vqrb4f1c8knqebs0n3ajcpj0rp','1','1737649656','127.0.0.1');


# --------------------------------------------------------

#
# Table structure for table `htbu_active_users`
#

DROP TABLE IF EXISTS `htbu_active_users`;
CREATE TABLE `htbu_active_users` (
  `sid` varchar(32) NOT NULL DEFAULT '',
  `internalKey` int NOT NULL DEFAULT '0',
  `username` varchar(50) NOT NULL DEFAULT '',
  `lasthit` int NOT NULL DEFAULT '0',
  `action` varchar(10) NOT NULL DEFAULT '',
  `id` int DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

#
# Dumping data for table `htbu_active_users`
#

INSERT INTO `htbu_active_users` VALUES
  ('vqrb4f1c8knqebs0n3ajcpj0rp','1','admin','1737649656','93','0');


# --------------------------------------------------------

#
# Table structure for table `htbu_categories`
#

DROP TABLE IF EXISTS `htbu_categories`;
CREATE TABLE `htbu_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(45) NOT NULL DEFAULT '',
  `rank` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

#
# Dumping data for table `htbu_categories`
#

INSERT INTO `htbu_categories` VALUES
  ('1','Manager and Admin','0'),
  ('2','Content','0'),
  ('3','Navigation','0'),
  ('4','Commerce','0'),
  ('5','Шаблоны страниц','0');


# --------------------------------------------------------

#
# Table structure for table `htbu_commerce_currency`
#

DROP TABLE IF EXISTS `htbu_commerce_currency`;
CREATE TABLE `htbu_commerce_currency` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `code` varchar(8) NOT NULL,
  `value` float NOT NULL DEFAULT '1',
  `left` varchar(32) NOT NULL DEFAULT '',
  `right` varchar(32) NOT NULL DEFAULT '',
  `decimals` tinyint unsigned NOT NULL DEFAULT '2',
  `decsep` varchar(8) NOT NULL,
  `thsep` varchar(8) NOT NULL,
  `active` tinyint unsigned NOT NULL DEFAULT '1',
  `default` tinyint unsigned NOT NULL,
  `lang` varchar(8) NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

#
# Dumping data for table `htbu_commerce_currency`
#

INSERT INTO `htbu_commerce_currency` VALUES
  ('1','Рубль','RUB','1','',' руб.','2',',',' ','1','1','',NULL,NULL);


# --------------------------------------------------------

#
# Table structure for table `htbu_commerce_order_history`
#

DROP TABLE IF EXISTS `htbu_commerce_order_history`;
CREATE TABLE `htbu_commerce_order_history` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int unsigned NOT NULL,
  `status_id` int unsigned NOT NULL,
  `comment` text NOT NULL,
  `notify` tinyint unsigned NOT NULL DEFAULT '1',
  `user_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`,`status_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `commerce_order_history_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `htbu_commerce_orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;



# --------------------------------------------------------

#
# Table structure for table `htbu_commerce_order_payments`
#

DROP TABLE IF EXISTS `htbu_commerce_order_payments`;
CREATE TABLE `htbu_commerce_order_payments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int unsigned NOT NULL,
  `amount` decimal(16,6) NOT NULL,
  `paid` tinyint unsigned NOT NULL DEFAULT '0',
  `hash` varchar(128) NOT NULL,
  `payment_method` varchar(255) NOT NULL DEFAULT '',
  `original_order_id` varchar(255) NOT NULL DEFAULT '',
  `meta` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `hash` (`hash`),
  KEY `original_order_id` (`original_order_id`),
  KEY `original_order_id_2` (`original_order_id`),
  CONSTRAINT `commerce_order_payments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `htbu_commerce_orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;



# --------------------------------------------------------

#
# Table structure for table `htbu_commerce_order_products`
#

DROP TABLE IF EXISTS `htbu_commerce_order_products`;
CREATE TABLE `htbu_commerce_order_products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int unsigned NOT NULL,
  `product_id` int unsigned DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `price` decimal(16,6) NOT NULL,
  `count` float unsigned NOT NULL DEFAULT '1',
  `options` text,
  `meta` text,
  `position` tinyint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`,`product_id`),
  CONSTRAINT `commerce_order_products_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `htbu_commerce_orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;



# --------------------------------------------------------

#
# Table structure for table `htbu_commerce_order_statuses`
#

DROP TABLE IF EXISTS `htbu_commerce_order_statuses`;
CREATE TABLE `htbu_commerce_order_statuses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL DEFAULT '',
  `color` varchar(6) NOT NULL DEFAULT '',
  `notify` tinyint unsigned NOT NULL DEFAULT '0',
  `default` tinyint unsigned NOT NULL DEFAULT '0',
  `canbepaid` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;

#
# Dumping data for table `htbu_commerce_order_statuses`
#

INSERT INTO `htbu_commerce_order_statuses` VALUES
  ('1','Новый','order.status.new','000000','0','1','1'),
  ('2','В обработке','order.status.processing','4CAF50','0','0','1'),
  ('3','Оплачен','order.status.paid','E91E63','1','0','1'),
  ('4','Доставлен','order.status.shipped','673AB7','0','0','1'),
  ('5','Отменен','order.status.canceled','FF5722','1','0','0'),
  ('6','Завершен','order.status.complete','2196F3','0','0','0'),
  ('7','Ожидание','order.status.pending','9E9E9E','0','0','1');


# --------------------------------------------------------

#
# Table structure for table `htbu_commerce_orders`
#

DROP TABLE IF EXISTS `htbu_commerce_orders`;
CREATE TABLE `htbu_commerce_orders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int unsigned DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `amount` decimal(16,6) NOT NULL,
  `currency` varchar(8) NOT NULL,
  `lang` varchar(32) NOT NULL,
  `fields` text,
  `status_id` tinyint unsigned NOT NULL,
  `hash` varchar(32) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `hash` (`hash`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;



# --------------------------------------------------------

#
# Table structure for table `htbu_document_groups`
#

DROP TABLE IF EXISTS `htbu_document_groups`;
CREATE TABLE `htbu_document_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `document_group` int NOT NULL DEFAULT '0',
  `document` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_dg_id` (`document_group`,`document`),
  KEY `document_group` (`document_group`),
  KEY `document` (`document`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# --------------------------------------------------------

#
# Table structure for table `htbu_documentgroup_names`
#

DROP TABLE IF EXISTS `htbu_documentgroup_names`;
CREATE TABLE `htbu_documentgroup_names` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(245) NOT NULL DEFAULT '',
  `private_memgroup` int DEFAULT '0' COMMENT 'determine whether the document group is private to manager users',
  `private_webgroup` int DEFAULT '0' COMMENT 'determines whether the document is private to web users',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# --------------------------------------------------------

#
# Table structure for table `htbu_event_log`
#

DROP TABLE IF EXISTS `htbu_event_log`;
CREATE TABLE `htbu_event_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `eventid` int DEFAULT '0',
  `createdon` int NOT NULL DEFAULT '0',
  `type` int NOT NULL DEFAULT '1' COMMENT '1- information, 2 - warning, 3- error',
  `user` int NOT NULL DEFAULT '0' COMMENT 'link to user table',
  `usertype` int NOT NULL DEFAULT '0' COMMENT '0 - manager, 1 - web',
  `source` varchar(50) NOT NULL DEFAULT '',
  `description` longtext,
  PRIMARY KEY (`id`),
  KEY `event_log_user_index` (`user`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

#
# Dumping data for table `htbu_event_log`
#

INSERT INTO `htbu_event_log` VALUES
  ('1','0','1729582965','3','1','0','Системные файлы были изменены.','Вы включили проверку системных файлов на наличие изменений, характерных для взломанных сайтов. Это не значит, что сайт был взломан, но желательно просмотреть измененные файлы.(index.php, .htaccess, manager/index.php, manager/includes/config.inc.php) index.php, .htaccess, manager/index.php, /core/config/database/connections/default.php'),
  ('2','0','1736586409','3','1','0','Системные файлы были изменены.','Вы включили проверку системных файлов на наличие изменений, характерных для взломанных сайтов. Это не значит, что сайт был взломан, но желательно просмотреть измененные файлы.(index.php, .htaccess, manager/index.php, manager/includes/config.inc.php) index.php, .htaccess, manager/index.php, /core/config/database/connections/default.php'),
  ('3','0','1736587144','3','0','1','Parser -   &lt;?php echo e(head); ?&gt;\n / Undefi','<h2 style=\"color:red\">&laquo; Evolution CMS Parse Error &raquo;</h2><h3 style=\"color:red\">Undefined constant \"head\" (View: C:\\xampp\\htdocs\\evolution\\views\\info.blade.php)</h3>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>File</td>\n		<td>C:\\xampp\\htdocs\\evolution\\core\\storage\\blade\\a4f24de38526715afe964b8119134949b13569c5.php</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Line</td>\n		<td>5</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Source</td>\n		<td>  &lt;?php echo e(head); ?&gt;\n</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://127.0.0.1/evolution/catalog</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[4] <a href=\"http://127.0.0.1/evolution/catalog\" target=\"_blank\">Каталог</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td>http://127.0.0.1/evolution/manager/</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2025-01-11 10:19:04</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0000 s (0 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.2351 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.2351 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>17.589149475098 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>EvolutionCMS\\Core->processRoutes</strong>()<br />index.php on line 137</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Routing\\Router->dispatch</strong>(Illuminate\\Http\\Request $var1)<br />core/src/Core.php on line 2676</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Router->dispatchToRoute</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/routing/Router.php on line 651</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Routing\\Router->runRoute</strong>(Illuminate\\Http\\Request $var1, Illuminate\\Routing\\Route $var2)<br />core/vendor/illuminate/routing/Router.php on line 662</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Router->runRouteWithinStack</strong>(Illuminate\\Routing\\Route $var1, Illuminate\\Http\\Request $var2)<br />core/vendor/illuminate/routing/Router.php on line 698</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->then</strong>(Closure $var1)<br />core/vendor/illuminate/routing/Router.php on line 719</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 103</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Session\\Middleware\\StartSession->handle</strong>(Illuminate\\Http\\Request $var1, Closure $var2)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 167</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Session\\Middleware\\StartSession->handleStatefulRequest</strong>(Illuminate\\Http\\Request $var1, Illuminate\\Session\\Store $var2, Closure $var3)<br />core/vendor/illuminate/session/Middleware/StartSession.php on line 64</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/session/Middleware/StartSession.php on line 121</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Middleware\\SubstituteBindings->handle</strong>(Illuminate\\Http\\Request $var1, Closure $var2)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 167</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/routing/Middleware/SubstituteBindings.php on line 50</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle</strong>(Illuminate\\Http\\Request $var1, Closure $var2)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 167</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/view/Middleware/ShareErrorsFromSession.php on line 49</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 128</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Routing\\Route->run</strong>()<br />core/vendor/illuminate/routing/Router.php on line 721</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Route->runCallable</strong>()<br />core/vendor/illuminate/routing/Route.php on line 208</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>EvolutionCMS\\Extensions\\Router->EvolutionCMS\\Extensions\\{closure}</strong>(\'catalog\')<br />core/vendor/illuminate/routing/Route.php on line 237</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>EvolutionCMS\\Core->executeParser</strong>()<br />core/src/Extensions/Router.php on line 25</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>EvolutionCMS\\Core->prepareResponse</strong>()<br />core/src/Core.php on line 2826</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\View->render</strong>()<br />core/src/Core.php on line 2924</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\View->renderContents</strong>()<br />core/vendor/illuminate/view/View.php on line 91</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\View->getContents</strong>()<br />core/vendor/illuminate/view/View.php on line 122</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\Engines\\CompilerEngine->get</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/View.php on line 139</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\Engines\\PhpEngine->evaluatePath</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/Engines/CompilerEngine.php on line 61</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Filesystem\\Filesystem->getRequire</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/Engines/PhpEngine.php on line 58</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Filesystem\\Filesystem::Illuminate\\Filesystem\\{closure}</strong>()<br />core/vendor/illuminate/filesystem/Filesystem.php on line 108</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>require</strong>()<br />core/vendor/illuminate/filesystem/Filesystem.php on line 107</td>\n	</tr>\n</table>\n'),
  ('4','0','1736590948','3','0','1','Parser -         throw new InvalidArgumentExceptio','<h2 style=\"color:red\">&laquo; Evolution CMS Parse Error &raquo;</h2><h3 style=\"color:red\">View [main1] not found.</h3>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>File</td>\n		<td>C:\\xampp\\htdocs\\evolution\\core\\vendor\\illuminate\\view\\FileViewFinder.php</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Line</td>\n		<td>137</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Source</td>\n		<td>        throw new InvalidArgumentException(&quot;View [{$name}] not found.&quot;);\n</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://127.0.0.1/evolution/</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[1] <a href=\"http://127.0.0.1/evolution/\" target=\"_blank\">Главная страница</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td>http://127.0.0.1/evolution/manager/</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2025-01-11 11:22:28</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0000 s (0 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.4105 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.4105 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>17.590980529785 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>EvolutionCMS\\Core->processRoutes</strong>()<br />index.php on line 137</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Routing\\Router->dispatch</strong>(Illuminate\\Http\\Request $var1)<br />core/src/Core.php on line 2676</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Router->dispatchToRoute</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/routing/Router.php on line 651</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Routing\\Router->runRoute</strong>(Illuminate\\Http\\Request $var1, Illuminate\\Routing\\Route $var2)<br />core/vendor/illuminate/routing/Router.php on line 662</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Router->runRouteWithinStack</strong>(Illuminate\\Routing\\Route $var1, Illuminate\\Http\\Request $var2)<br />core/vendor/illuminate/routing/Router.php on line 698</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->then</strong>(Closure $var1)<br />core/vendor/illuminate/routing/Router.php on line 719</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 103</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Session\\Middleware\\StartSession->handle</strong>(Illuminate\\Http\\Request $var1, Closure $var2)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 167</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Session\\Middleware\\StartSession->handleStatefulRequest</strong>(Illuminate\\Http\\Request $var1, Illuminate\\Session\\Store $var2, Closure $var3)<br />core/vendor/illuminate/session/Middleware/StartSession.php on line 64</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/session/Middleware/StartSession.php on line 121</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Middleware\\SubstituteBindings->handle</strong>(Illuminate\\Http\\Request $var1, Closure $var2)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 167</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/routing/Middleware/SubstituteBindings.php on line 50</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle</strong>(Illuminate\\Http\\Request $var1, Closure $var2)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 167</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/view/Middleware/ShareErrorsFromSession.php on line 49</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 128</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Routing\\Route->run</strong>()<br />core/vendor/illuminate/routing/Router.php on line 721</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Route->runCallable</strong>()<br />core/vendor/illuminate/routing/Route.php on line 208</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>EvolutionCMS\\Extensions\\Router->EvolutionCMS\\Extensions\\{closure}</strong>()<br />core/vendor/illuminate/routing/Route.php on line 237</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>EvolutionCMS\\Core->executeParser</strong>()<br />core/src/Extensions/Router.php on line 25</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>EvolutionCMS\\Core->prepareResponse</strong>()<br />core/src/Core.php on line 2741</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\Factory->make</strong>(\'main1\', array $var2)<br />core/src/Core.php on line 2923</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\FileViewFinder->find</strong>(\'main1\')<br />core/vendor/illuminate/view/Factory.php on line 137</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\FileViewFinder->findInPaths</strong>(\'main1\', array $var2)<br />core/vendor/illuminate/view/FileViewFinder.php on line 79</td>\n	</tr>\n</table>\n'),
  ('5','0','1736591106','3','0','1','Parser -         throw new InvalidArgumentExceptio','<h2 style=\"color:red\">&laquo; Evolution CMS Parse Error &raquo;</h2><h3 style=\"color:red\">View [main1] not found.</h3>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>File</td>\n		<td>C:\\xampp\\htdocs\\evolution\\core\\vendor\\illuminate\\view\\FileViewFinder.php</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Line</td>\n		<td>137</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Source</td>\n		<td>        throw new InvalidArgumentException(&quot;View [{$name}] not found.&quot;);\n</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://127.0.0.1/evolution/</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[1] <a href=\"http://127.0.0.1/evolution/\" target=\"_blank\">Главная страница</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td>http://127.0.0.1/evolution/manager/</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2025-01-11 11:25:06</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0000 s (0 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.4145 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.4145 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>17.590980529785 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>EvolutionCMS\\Core->processRoutes</strong>()<br />index.php on line 137</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Routing\\Router->dispatch</strong>(Illuminate\\Http\\Request $var1)<br />core/src/Core.php on line 2676</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Router->dispatchToRoute</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/routing/Router.php on line 651</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Routing\\Router->runRoute</strong>(Illuminate\\Http\\Request $var1, Illuminate\\Routing\\Route $var2)<br />core/vendor/illuminate/routing/Router.php on line 662</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Router->runRouteWithinStack</strong>(Illuminate\\Routing\\Route $var1, Illuminate\\Http\\Request $var2)<br />core/vendor/illuminate/routing/Router.php on line 698</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->then</strong>(Closure $var1)<br />core/vendor/illuminate/routing/Router.php on line 719</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 103</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Session\\Middleware\\StartSession->handle</strong>(Illuminate\\Http\\Request $var1, Closure $var2)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 167</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Session\\Middleware\\StartSession->handleStatefulRequest</strong>(Illuminate\\Http\\Request $var1, Illuminate\\Session\\Store $var2, Closure $var3)<br />core/vendor/illuminate/session/Middleware/StartSession.php on line 64</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/session/Middleware/StartSession.php on line 121</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Middleware\\SubstituteBindings->handle</strong>(Illuminate\\Http\\Request $var1, Closure $var2)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 167</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/routing/Middleware/SubstituteBindings.php on line 50</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle</strong>(Illuminate\\Http\\Request $var1, Closure $var2)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 167</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/view/Middleware/ShareErrorsFromSession.php on line 49</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 128</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Routing\\Route->run</strong>()<br />core/vendor/illuminate/routing/Router.php on line 721</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Route->runCallable</strong>()<br />core/vendor/illuminate/routing/Route.php on line 208</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>EvolutionCMS\\Extensions\\Router->EvolutionCMS\\Extensions\\{closure}</strong>()<br />core/vendor/illuminate/routing/Route.php on line 237</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>EvolutionCMS\\Core->executeParser</strong>()<br />core/src/Extensions/Router.php on line 25</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>EvolutionCMS\\Core->prepareResponse</strong>()<br />core/src/Core.php on line 2741</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\Factory->make</strong>(\'main1\', array $var2)<br />core/src/Core.php on line 2923</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\FileViewFinder->find</strong>(\'main1\')<br />core/vendor/illuminate/view/Factory.php on line 137</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\FileViewFinder->findInPaths</strong>(\'main1\', array $var2)<br />core/vendor/illuminate/view/FileViewFinder.php on line 79</td>\n	</tr>\n</table>\n'),
  ('6','0','1736591174','3','0','1','Parser -         throw new InvalidArgumentExceptio','<h2 style=\"color:red\">&laquo; Evolution CMS Parse Error &raquo;</h2><h3 style=\"color:red\">View [main1] not found.</h3>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>File</td>\n		<td>C:\\xampp\\htdocs\\evolution\\core\\vendor\\illuminate\\view\\FileViewFinder.php</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Line</td>\n		<td>137</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Source</td>\n		<td>        throw new InvalidArgumentException(&quot;View [{$name}] not found.&quot;);\n</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://127.0.0.1/evolution/</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[1] <a href=\"http://127.0.0.1/evolution/\" target=\"_blank\">Главная страница</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td>http://127.0.0.1/evolution/manager/</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2025-01-11 11:26:14</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0000 s (0 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.3786 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.3786 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>17.590980529785 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>EvolutionCMS\\Core->processRoutes</strong>()<br />index.php on line 137</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Routing\\Router->dispatch</strong>(Illuminate\\Http\\Request $var1)<br />core/src/Core.php on line 2676</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Router->dispatchToRoute</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/routing/Router.php on line 651</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Routing\\Router->runRoute</strong>(Illuminate\\Http\\Request $var1, Illuminate\\Routing\\Route $var2)<br />core/vendor/illuminate/routing/Router.php on line 662</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Router->runRouteWithinStack</strong>(Illuminate\\Routing\\Route $var1, Illuminate\\Http\\Request $var2)<br />core/vendor/illuminate/routing/Router.php on line 698</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->then</strong>(Closure $var1)<br />core/vendor/illuminate/routing/Router.php on line 719</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 103</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Session\\Middleware\\StartSession->handle</strong>(Illuminate\\Http\\Request $var1, Closure $var2)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 167</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Session\\Middleware\\StartSession->handleStatefulRequest</strong>(Illuminate\\Http\\Request $var1, Illuminate\\Session\\Store $var2, Closure $var3)<br />core/vendor/illuminate/session/Middleware/StartSession.php on line 64</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/session/Middleware/StartSession.php on line 121</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Middleware\\SubstituteBindings->handle</strong>(Illuminate\\Http\\Request $var1, Closure $var2)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 167</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/routing/Middleware/SubstituteBindings.php on line 50</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle</strong>(Illuminate\\Http\\Request $var1, Closure $var2)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 167</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/view/Middleware/ShareErrorsFromSession.php on line 49</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 128</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Routing\\Route->run</strong>()<br />core/vendor/illuminate/routing/Router.php on line 721</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Route->runCallable</strong>()<br />core/vendor/illuminate/routing/Route.php on line 208</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>EvolutionCMS\\Extensions\\Router->EvolutionCMS\\Extensions\\{closure}</strong>()<br />core/vendor/illuminate/routing/Route.php on line 237</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>EvolutionCMS\\Core->executeParser</strong>()<br />core/src/Extensions/Router.php on line 25</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>EvolutionCMS\\Core->prepareResponse</strong>()<br />core/src/Core.php on line 2741</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\Factory->make</strong>(\'main1\', array $var2)<br />core/src/Core.php on line 2923</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\FileViewFinder->find</strong>(\'main1\')<br />core/vendor/illuminate/view/Factory.php on line 137</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\FileViewFinder->findInPaths</strong>(\'main1\', array $var2)<br />core/vendor/illuminate/view/FileViewFinder.php on line 79</td>\n	</tr>\n</table>\n'),
  ('7','0','1736591479','3','0','1','Parser -         throw new InvalidArgumentExceptio','<h2 style=\"color:red\">&laquo; Evolution CMS Parse Error &raquo;</h2><h3 style=\"color:red\">View [main1] not found.</h3>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>File</td>\n		<td>C:\\xampp\\htdocs\\evolution\\core\\vendor\\illuminate\\view\\FileViewFinder.php</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Line</td>\n		<td>137</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Source</td>\n		<td>        throw new InvalidArgumentException(&quot;View [{$name}] not found.&quot;);\n</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://127.0.0.1/evolution/</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[1] <a href=\"http://127.0.0.1/evolution/\" target=\"_blank\">Главная страница</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td>http://127.0.0.1/evolution/manager/</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2025-01-11 11:31:19</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0000 s (0 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.4436 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.4436 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>17.591102600098 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>EvolutionCMS\\Core->processRoutes</strong>()<br />index.php on line 137</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Routing\\Router->dispatch</strong>(Illuminate\\Http\\Request $var1)<br />core/src/Core.php on line 2676</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Router->dispatchToRoute</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/routing/Router.php on line 651</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Routing\\Router->runRoute</strong>(Illuminate\\Http\\Request $var1, Illuminate\\Routing\\Route $var2)<br />core/vendor/illuminate/routing/Router.php on line 662</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Router->runRouteWithinStack</strong>(Illuminate\\Routing\\Route $var1, Illuminate\\Http\\Request $var2)<br />core/vendor/illuminate/routing/Router.php on line 698</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->then</strong>(Closure $var1)<br />core/vendor/illuminate/routing/Router.php on line 719</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 103</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Session\\Middleware\\StartSession->handle</strong>(Illuminate\\Http\\Request $var1, Closure $var2)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 167</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Session\\Middleware\\StartSession->handleStatefulRequest</strong>(Illuminate\\Http\\Request $var1, Illuminate\\Session\\Store $var2, Closure $var3)<br />core/vendor/illuminate/session/Middleware/StartSession.php on line 64</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/session/Middleware/StartSession.php on line 121</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Middleware\\SubstituteBindings->handle</strong>(Illuminate\\Http\\Request $var1, Closure $var2)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 167</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/routing/Middleware/SubstituteBindings.php on line 50</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle</strong>(Illuminate\\Http\\Request $var1, Closure $var2)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 167</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/view/Middleware/ShareErrorsFromSession.php on line 49</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 128</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Routing\\Route->run</strong>()<br />core/vendor/illuminate/routing/Router.php on line 721</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Route->runCallable</strong>()<br />core/vendor/illuminate/routing/Route.php on line 208</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>EvolutionCMS\\Extensions\\Router->EvolutionCMS\\Extensions\\{closure}</strong>()<br />core/vendor/illuminate/routing/Route.php on line 237</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>EvolutionCMS\\Core->executeParser</strong>()<br />core/src/Extensions/Router.php on line 25</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>EvolutionCMS\\Core->prepareResponse</strong>()<br />core/src/Core.php on line 2741</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\Factory->make</strong>(\'main1\', array $var2)<br />core/src/Core.php on line 2923</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\FileViewFinder->find</strong>(\'main1\')<br />core/vendor/illuminate/view/Factory.php on line 137</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\FileViewFinder->findInPaths</strong>(\'main1\', array $var2)<br />core/vendor/illuminate/view/FileViewFinder.php on line 79</td>\n	</tr>\n</table>\n'),
  ('8','0','1736591501','3','0','1','Parser -         throw new InvalidArgumentExceptio','<h2 style=\"color:red\">&laquo; Evolution CMS Parse Error &raquo;</h2><h3 style=\"color:red\">View [main1] not found.</h3>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>File</td>\n		<td>C:\\xampp\\htdocs\\evolution\\core\\vendor\\illuminate\\view\\FileViewFinder.php</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Line</td>\n		<td>137</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Source</td>\n		<td>        throw new InvalidArgumentException(&quot;View [{$name}] not found.&quot;);\n</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://127.0.0.1/evolution/</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[1] <a href=\"http://127.0.0.1/evolution/\" target=\"_blank\">Главная страница</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td>http://127.0.0.1/evolution/manager/</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2025-01-11 11:31:41</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0000 s (0 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.4453 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.4453 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>17.590980529785 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>EvolutionCMS\\Core->processRoutes</strong>()<br />index.php on line 137</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Routing\\Router->dispatch</strong>(Illuminate\\Http\\Request $var1)<br />core/src/Core.php on line 2676</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Router->dispatchToRoute</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/routing/Router.php on line 651</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Routing\\Router->runRoute</strong>(Illuminate\\Http\\Request $var1, Illuminate\\Routing\\Route $var2)<br />core/vendor/illuminate/routing/Router.php on line 662</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Router->runRouteWithinStack</strong>(Illuminate\\Routing\\Route $var1, Illuminate\\Http\\Request $var2)<br />core/vendor/illuminate/routing/Router.php on line 698</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->then</strong>(Closure $var1)<br />core/vendor/illuminate/routing/Router.php on line 719</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 103</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Session\\Middleware\\StartSession->handle</strong>(Illuminate\\Http\\Request $var1, Closure $var2)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 167</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Session\\Middleware\\StartSession->handleStatefulRequest</strong>(Illuminate\\Http\\Request $var1, Illuminate\\Session\\Store $var2, Closure $var3)<br />core/vendor/illuminate/session/Middleware/StartSession.php on line 64</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/session/Middleware/StartSession.php on line 121</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Middleware\\SubstituteBindings->handle</strong>(Illuminate\\Http\\Request $var1, Closure $var2)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 167</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/routing/Middleware/SubstituteBindings.php on line 50</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle</strong>(Illuminate\\Http\\Request $var1, Closure $var2)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 167</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/view/Middleware/ShareErrorsFromSession.php on line 49</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 128</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Routing\\Route->run</strong>()<br />core/vendor/illuminate/routing/Router.php on line 721</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Route->runCallable</strong>()<br />core/vendor/illuminate/routing/Route.php on line 208</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>EvolutionCMS\\Extensions\\Router->EvolutionCMS\\Extensions\\{closure}</strong>()<br />core/vendor/illuminate/routing/Route.php on line 237</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>EvolutionCMS\\Core->executeParser</strong>()<br />core/src/Extensions/Router.php on line 25</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>EvolutionCMS\\Core->prepareResponse</strong>()<br />core/src/Core.php on line 2741</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\Factory->make</strong>(\'main1\', array $var2)<br />core/src/Core.php on line 2923</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\FileViewFinder->find</strong>(\'main1\')<br />core/vendor/illuminate/view/Factory.php on line 137</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\FileViewFinder->findInPaths</strong>(\'main1\', array $var2)<br />core/vendor/illuminate/view/FileViewFinder.php on line 79</td>\n	</tr>\n</table>\n'),
  ('9','0','1736591528','3','0','1','Parser -         throw new InvalidArgumentExceptio','<h2 style=\"color:red\">&laquo; Evolution CMS Parse Error &raquo;</h2><h3 style=\"color:red\">View [main1] not found.</h3>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>File</td>\n		<td>C:\\xampp\\htdocs\\evolution\\core\\vendor\\illuminate\\view\\FileViewFinder.php</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Line</td>\n		<td>137</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Source</td>\n		<td>        throw new InvalidArgumentException(&quot;View [{$name}] not found.&quot;);\n</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://127.0.0.1/evolution/</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[1] <a href=\"http://127.0.0.1/evolution/\" target=\"_blank\">Главная страница</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td>http://127.0.0.1/evolution/manager/</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2025-01-11 11:32:08</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0000 s (0 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.4112 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.4112 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>17.590866088867 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>EvolutionCMS\\Core->processRoutes</strong>()<br />index.php on line 137</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Routing\\Router->dispatch</strong>(Illuminate\\Http\\Request $var1)<br />core/src/Core.php on line 2676</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Router->dispatchToRoute</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/routing/Router.php on line 651</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Routing\\Router->runRoute</strong>(Illuminate\\Http\\Request $var1, Illuminate\\Routing\\Route $var2)<br />core/vendor/illuminate/routing/Router.php on line 662</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Router->runRouteWithinStack</strong>(Illuminate\\Routing\\Route $var1, Illuminate\\Http\\Request $var2)<br />core/vendor/illuminate/routing/Router.php on line 698</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->then</strong>(Closure $var1)<br />core/vendor/illuminate/routing/Router.php on line 719</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 103</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Session\\Middleware\\StartSession->handle</strong>(Illuminate\\Http\\Request $var1, Closure $var2)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 167</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Session\\Middleware\\StartSession->handleStatefulRequest</strong>(Illuminate\\Http\\Request $var1, Illuminate\\Session\\Store $var2, Closure $var3)<br />core/vendor/illuminate/session/Middleware/StartSession.php on line 64</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/session/Middleware/StartSession.php on line 121</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Middleware\\SubstituteBindings->handle</strong>(Illuminate\\Http\\Request $var1, Closure $var2)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 167</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/routing/Middleware/SubstituteBindings.php on line 50</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle</strong>(Illuminate\\Http\\Request $var1, Closure $var2)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 167</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/view/Middleware/ShareErrorsFromSession.php on line 49</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 128</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Routing\\Route->run</strong>()<br />core/vendor/illuminate/routing/Router.php on line 721</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Route->runCallable</strong>()<br />core/vendor/illuminate/routing/Route.php on line 208</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>EvolutionCMS\\Extensions\\Router->EvolutionCMS\\Extensions\\{closure}</strong>()<br />core/vendor/illuminate/routing/Route.php on line 237</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>EvolutionCMS\\Core->executeParser</strong>()<br />core/src/Extensions/Router.php on line 25</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>EvolutionCMS\\Core->prepareResponse</strong>()<br />core/src/Core.php on line 2741</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\Factory->make</strong>(\'main1\', array $var2)<br />core/src/Core.php on line 2923</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\FileViewFinder->find</strong>(\'main1\')<br />core/vendor/illuminate/view/Factory.php on line 137</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\FileViewFinder->findInPaths</strong>(\'main1\', array $var2)<br />core/vendor/illuminate/view/FileViewFinder.php on line 79</td>\n	</tr>\n</table>\n');

INSERT INTO `htbu_event_log` VALUES
  ('10','0','1736977114','3','0','1','Parser -   &lt;?php echo e(head); ?&gt;\n / Undefi','<h2 style=\"color:red\">&laquo; Evolution CMS Parse Error &raquo;</h2><h3 style=\"color:red\">Undefined constant \"head\" (View: C:\\xampp\\htdocs\\evolution\\views\\main_page.blade.php)</h3>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>File</td>\n		<td>C:\\xampp\\htdocs\\evolution\\core\\storage\\blade\\ac1168256e4828d2604ff8ce7dd487ac987f674a.php</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Line</td>\n		<td>5</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Source</td>\n		<td>  &lt;?php echo e(head); ?&gt;\n</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://127.0.0.1/evolution/</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[1] <a href=\"http://127.0.0.1/evolution/\" target=\"_blank\">Главная страница</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td>http://127.0.0.1/evolution/manager/</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2025-01-15 22:38:34</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0000 s (0 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.4463 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.4463 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>17.591087341309 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>EvolutionCMS\\Core->processRoutes</strong>()<br />index.php on line 137</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Routing\\Router->dispatch</strong>(Illuminate\\Http\\Request $var1)<br />core/src/Core.php on line 2676</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Router->dispatchToRoute</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/routing/Router.php on line 651</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Routing\\Router->runRoute</strong>(Illuminate\\Http\\Request $var1, Illuminate\\Routing\\Route $var2)<br />core/vendor/illuminate/routing/Router.php on line 662</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Router->runRouteWithinStack</strong>(Illuminate\\Routing\\Route $var1, Illuminate\\Http\\Request $var2)<br />core/vendor/illuminate/routing/Router.php on line 698</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->then</strong>(Closure $var1)<br />core/vendor/illuminate/routing/Router.php on line 719</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 103</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Session\\Middleware\\StartSession->handle</strong>(Illuminate\\Http\\Request $var1, Closure $var2)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 167</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Session\\Middleware\\StartSession->handleStatefulRequest</strong>(Illuminate\\Http\\Request $var1, Illuminate\\Session\\Store $var2, Closure $var3)<br />core/vendor/illuminate/session/Middleware/StartSession.php on line 64</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/session/Middleware/StartSession.php on line 121</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Middleware\\SubstituteBindings->handle</strong>(Illuminate\\Http\\Request $var1, Closure $var2)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 167</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/routing/Middleware/SubstituteBindings.php on line 50</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle</strong>(Illuminate\\Http\\Request $var1, Closure $var2)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 167</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/view/Middleware/ShareErrorsFromSession.php on line 49</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 128</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Routing\\Route->run</strong>()<br />core/vendor/illuminate/routing/Router.php on line 721</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Route->runCallable</strong>()<br />core/vendor/illuminate/routing/Route.php on line 208</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>EvolutionCMS\\Extensions\\Router->EvolutionCMS\\Extensions\\{closure}</strong>()<br />core/vendor/illuminate/routing/Route.php on line 237</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>EvolutionCMS\\Core->executeParser</strong>()<br />core/src/Extensions/Router.php on line 25</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>EvolutionCMS\\Core->prepareResponse</strong>()<br />core/src/Core.php on line 2741</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\View->render</strong>()<br />core/src/Core.php on line 2924</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\View->renderContents</strong>()<br />core/vendor/illuminate/view/View.php on line 91</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\View->getContents</strong>()<br />core/vendor/illuminate/view/View.php on line 122</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\Engines\\CompilerEngine->get</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/View.php on line 139</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\Engines\\PhpEngine->evaluatePath</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/Engines/CompilerEngine.php on line 61</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Filesystem\\Filesystem->getRequire</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/Engines/PhpEngine.php on line 58</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Filesystem\\Filesystem::Illuminate\\Filesystem\\{closure}</strong>()<br />core/vendor/illuminate/filesystem/Filesystem.php on line 108</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>require</strong>()<br />core/vendor/illuminate/filesystem/Filesystem.php on line 107</td>\n	</tr>\n</table>\n'),
  ('11','0','1736977150','3','0','1','Parser -   &lt;?php echo e(head); ?&gt;\n / Undefi','<h2 style=\"color:red\">&laquo; Evolution CMS Parse Error &raquo;</h2><h3 style=\"color:red\">Undefined constant \"head\" (View: C:\\xampp\\htdocs\\evolution\\views\\main_page.blade.php)</h3>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>File</td>\n		<td>C:\\xampp\\htdocs\\evolution\\core\\storage\\blade\\ac1168256e4828d2604ff8ce7dd487ac987f674a.php</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Line</td>\n		<td>5</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Source</td>\n		<td>  &lt;?php echo e(head); ?&gt;\n</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://127.0.0.1/evolution/</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[1] <a href=\"http://127.0.0.1/evolution/\" target=\"_blank\">Главная страница</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td>http://127.0.0.1/evolution/manager/</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2025-01-15 22:39:10</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0000 s (0 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.3620 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.3620 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>17.591087341309 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>EvolutionCMS\\Core->processRoutes</strong>()<br />index.php on line 137</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Routing\\Router->dispatch</strong>(Illuminate\\Http\\Request $var1)<br />core/src/Core.php on line 2676</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Router->dispatchToRoute</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/routing/Router.php on line 651</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Routing\\Router->runRoute</strong>(Illuminate\\Http\\Request $var1, Illuminate\\Routing\\Route $var2)<br />core/vendor/illuminate/routing/Router.php on line 662</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Router->runRouteWithinStack</strong>(Illuminate\\Routing\\Route $var1, Illuminate\\Http\\Request $var2)<br />core/vendor/illuminate/routing/Router.php on line 698</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->then</strong>(Closure $var1)<br />core/vendor/illuminate/routing/Router.php on line 719</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 103</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Session\\Middleware\\StartSession->handle</strong>(Illuminate\\Http\\Request $var1, Closure $var2)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 167</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Session\\Middleware\\StartSession->handleStatefulRequest</strong>(Illuminate\\Http\\Request $var1, Illuminate\\Session\\Store $var2, Closure $var3)<br />core/vendor/illuminate/session/Middleware/StartSession.php on line 64</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/session/Middleware/StartSession.php on line 121</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Middleware\\SubstituteBindings->handle</strong>(Illuminate\\Http\\Request $var1, Closure $var2)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 167</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/routing/Middleware/SubstituteBindings.php on line 50</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle</strong>(Illuminate\\Http\\Request $var1, Closure $var2)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 167</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/view/Middleware/ShareErrorsFromSession.php on line 49</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 128</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Routing\\Route->run</strong>()<br />core/vendor/illuminate/routing/Router.php on line 721</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Route->runCallable</strong>()<br />core/vendor/illuminate/routing/Route.php on line 208</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>EvolutionCMS\\Extensions\\Router->EvolutionCMS\\Extensions\\{closure}</strong>()<br />core/vendor/illuminate/routing/Route.php on line 237</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>EvolutionCMS\\Core->executeParser</strong>()<br />core/src/Extensions/Router.php on line 25</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>EvolutionCMS\\Core->prepareResponse</strong>()<br />core/src/Core.php on line 2741</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\View->render</strong>()<br />core/src/Core.php on line 2924</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\View->renderContents</strong>()<br />core/vendor/illuminate/view/View.php on line 91</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\View->getContents</strong>()<br />core/vendor/illuminate/view/View.php on line 122</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\Engines\\CompilerEngine->get</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/View.php on line 139</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\Engines\\PhpEngine->evaluatePath</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/Engines/CompilerEngine.php on line 61</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Filesystem\\Filesystem->getRequire</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/Engines/PhpEngine.php on line 58</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Filesystem\\Filesystem::Illuminate\\Filesystem\\{closure}</strong>()<br />core/vendor/illuminate/filesystem/Filesystem.php on line 108</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>require</strong>()<br />core/vendor/illuminate/filesystem/Filesystem.php on line 107</td>\n	</tr>\n</table>\n'),
  ('12','0','1736977214','3','0','1','Parser -   &lt;?php echo e(head); ?&gt;\n / Undefi','<h2 style=\"color:red\">&laquo; Evolution CMS Parse Error &raquo;</h2><h3 style=\"color:red\">Undefined constant \"head\" (View: C:\\xampp\\htdocs\\evolution\\views\\main_page.blade.php)</h3>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>File</td>\n		<td>C:\\xampp\\htdocs\\evolution\\core\\storage\\blade\\ac1168256e4828d2604ff8ce7dd487ac987f674a.php</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Line</td>\n		<td>5</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Source</td>\n		<td>  &lt;?php echo e(head); ?&gt;\n</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://127.0.0.1/evolution/</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[1] <a href=\"http://127.0.0.1/evolution/\" target=\"_blank\">Главная страница</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td>http://127.0.0.1/evolution/manager/</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2025-01-15 22:40:14</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0000 s (0 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.4070 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.4070 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>17.591087341309 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>EvolutionCMS\\Core->processRoutes</strong>()<br />index.php on line 137</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Routing\\Router->dispatch</strong>(Illuminate\\Http\\Request $var1)<br />core/src/Core.php on line 2676</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Router->dispatchToRoute</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/routing/Router.php on line 651</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Routing\\Router->runRoute</strong>(Illuminate\\Http\\Request $var1, Illuminate\\Routing\\Route $var2)<br />core/vendor/illuminate/routing/Router.php on line 662</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Router->runRouteWithinStack</strong>(Illuminate\\Routing\\Route $var1, Illuminate\\Http\\Request $var2)<br />core/vendor/illuminate/routing/Router.php on line 698</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->then</strong>(Closure $var1)<br />core/vendor/illuminate/routing/Router.php on line 719</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 103</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Session\\Middleware\\StartSession->handle</strong>(Illuminate\\Http\\Request $var1, Closure $var2)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 167</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Session\\Middleware\\StartSession->handleStatefulRequest</strong>(Illuminate\\Http\\Request $var1, Illuminate\\Session\\Store $var2, Closure $var3)<br />core/vendor/illuminate/session/Middleware/StartSession.php on line 64</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/session/Middleware/StartSession.php on line 121</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Middleware\\SubstituteBindings->handle</strong>(Illuminate\\Http\\Request $var1, Closure $var2)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 167</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/routing/Middleware/SubstituteBindings.php on line 50</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle</strong>(Illuminate\\Http\\Request $var1, Closure $var2)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 167</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/view/Middleware/ShareErrorsFromSession.php on line 49</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 128</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Routing\\Route->run</strong>()<br />core/vendor/illuminate/routing/Router.php on line 721</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Route->runCallable</strong>()<br />core/vendor/illuminate/routing/Route.php on line 208</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>EvolutionCMS\\Extensions\\Router->EvolutionCMS\\Extensions\\{closure}</strong>()<br />core/vendor/illuminate/routing/Route.php on line 237</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>EvolutionCMS\\Core->executeParser</strong>()<br />core/src/Extensions/Router.php on line 25</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>EvolutionCMS\\Core->prepareResponse</strong>()<br />core/src/Core.php on line 2741</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\View->render</strong>()<br />core/src/Core.php on line 2924</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\View->renderContents</strong>()<br />core/vendor/illuminate/view/View.php on line 91</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\View->getContents</strong>()<br />core/vendor/illuminate/view/View.php on line 122</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\Engines\\CompilerEngine->get</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/View.php on line 139</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\Engines\\PhpEngine->evaluatePath</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/Engines/CompilerEngine.php on line 61</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Filesystem\\Filesystem->getRequire</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/Engines/PhpEngine.php on line 58</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Filesystem\\Filesystem::Illuminate\\Filesystem\\{closure}</strong>()<br />core/vendor/illuminate/filesystem/Filesystem.php on line 108</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>require</strong>()<br />core/vendor/illuminate/filesystem/Filesystem.php on line 107</td>\n	</tr>\n</table>\n'),
  ('13','0','1737397359','3','0','1','Parser -         throw new InvalidArgumentExceptio','<h2 style=\"color:red\">&laquo; Evolution CMS Parse Error &raquo;</h2><h3 style=\"color:red\">View [catalog1] not found.</h3>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>File</td>\n		<td>C:\\xampp\\htdocs\\evolution\\core\\vendor\\illuminate\\view\\FileViewFinder.php</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Line</td>\n		<td>137</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Source</td>\n		<td>        throw new InvalidArgumentException(&quot;View [{$name}] not found.&quot;);\n</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://127.0.0.1/evolution/catalog/form/tovar-1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[7] <a href=\"http://127.0.0.1/evolution/catalog/form/tovar-1\" target=\"_blank\">Товар 1</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td>http://127.0.0.1/evolution/manager/</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2025-01-20 19:22:39</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0000 s (0 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.4604 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.4604 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>17.589179992676 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>EvolutionCMS\\Core->processRoutes</strong>()<br />index.php on line 137</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Routing\\Router->dispatch</strong>(Illuminate\\Http\\Request $var1)<br />core/src/Core.php on line 2676</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Router->dispatchToRoute</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/routing/Router.php on line 651</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Routing\\Router->runRoute</strong>(Illuminate\\Http\\Request $var1, Illuminate\\Routing\\Route $var2)<br />core/vendor/illuminate/routing/Router.php on line 662</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Router->runRouteWithinStack</strong>(Illuminate\\Routing\\Route $var1, Illuminate\\Http\\Request $var2)<br />core/vendor/illuminate/routing/Router.php on line 698</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->then</strong>(Closure $var1)<br />core/vendor/illuminate/routing/Router.php on line 719</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 103</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Session\\Middleware\\StartSession->handle</strong>(Illuminate\\Http\\Request $var1, Closure $var2)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 167</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Session\\Middleware\\StartSession->handleStatefulRequest</strong>(Illuminate\\Http\\Request $var1, Illuminate\\Session\\Store $var2, Closure $var3)<br />core/vendor/illuminate/session/Middleware/StartSession.php on line 64</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/session/Middleware/StartSession.php on line 121</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Middleware\\SubstituteBindings->handle</strong>(Illuminate\\Http\\Request $var1, Closure $var2)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 167</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/routing/Middleware/SubstituteBindings.php on line 50</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle</strong>(Illuminate\\Http\\Request $var1, Closure $var2)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 167</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/view/Middleware/ShareErrorsFromSession.php on line 49</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 128</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Routing\\Route->run</strong>()<br />core/vendor/illuminate/routing/Router.php on line 721</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Route->runCallable</strong>()<br />core/vendor/illuminate/routing/Route.php on line 208</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>EvolutionCMS\\Extensions\\Router->EvolutionCMS\\Extensions\\{closure}</strong>(\'catalog/form/tovar-1\')<br />core/vendor/illuminate/routing/Route.php on line 237</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>EvolutionCMS\\Core->executeParser</strong>()<br />core/src/Extensions/Router.php on line 25</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>EvolutionCMS\\Core->prepareResponse</strong>()<br />core/src/Core.php on line 2826</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\Factory->make</strong>(\'catalog1\', array $var2)<br />core/src/Core.php on line 2923</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\FileViewFinder->find</strong>(\'catalog1\')<br />core/vendor/illuminate/view/Factory.php on line 137</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\FileViewFinder->findInPaths</strong>(\'catalog1\', array $var2)<br />core/vendor/illuminate/view/FileViewFinder.php on line 79</td>\n	</tr>\n</table>\n'),
  ('14','0','1737397694','3','0','1','Parser -         throw new InvalidArgumentExceptio','<h2 style=\"color:red\">&laquo; Evolution CMS Parse Error &raquo;</h2><h3 style=\"color:red\">View [catalog1] not found.</h3>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>File</td>\n		<td>C:\\xampp\\htdocs\\evolution\\core\\vendor\\illuminate\\view\\FileViewFinder.php</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Line</td>\n		<td>137</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Source</td>\n		<td>        throw new InvalidArgumentException(&quot;View [{$name}] not found.&quot;);\n</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://127.0.0.1/evolution/smartphones</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[14] <a href=\"http://127.0.0.1/evolution/smartphones\" target=\"_blank\">Смартфоны</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td>http://127.0.0.1/evolution/manager/</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2025-01-20 19:28:14</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0000 s (0 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.3486 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.3486 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>17.589256286621 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>EvolutionCMS\\Core->processRoutes</strong>()<br />index.php on line 137</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Routing\\Router->dispatch</strong>(Illuminate\\Http\\Request $var1)<br />core/src/Core.php on line 2676</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Router->dispatchToRoute</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/routing/Router.php on line 651</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Routing\\Router->runRoute</strong>(Illuminate\\Http\\Request $var1, Illuminate\\Routing\\Route $var2)<br />core/vendor/illuminate/routing/Router.php on line 662</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Router->runRouteWithinStack</strong>(Illuminate\\Routing\\Route $var1, Illuminate\\Http\\Request $var2)<br />core/vendor/illuminate/routing/Router.php on line 698</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->then</strong>(Closure $var1)<br />core/vendor/illuminate/routing/Router.php on line 719</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 103</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Session\\Middleware\\StartSession->handle</strong>(Illuminate\\Http\\Request $var1, Closure $var2)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 167</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Session\\Middleware\\StartSession->handleStatefulRequest</strong>(Illuminate\\Http\\Request $var1, Illuminate\\Session\\Store $var2, Closure $var3)<br />core/vendor/illuminate/session/Middleware/StartSession.php on line 64</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/session/Middleware/StartSession.php on line 121</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Middleware\\SubstituteBindings->handle</strong>(Illuminate\\Http\\Request $var1, Closure $var2)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 167</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/routing/Middleware/SubstituteBindings.php on line 50</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle</strong>(Illuminate\\Http\\Request $var1, Closure $var2)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 167</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/view/Middleware/ShareErrorsFromSession.php on line 49</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 128</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Routing\\Route->run</strong>()<br />core/vendor/illuminate/routing/Router.php on line 721</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Route->runCallable</strong>()<br />core/vendor/illuminate/routing/Route.php on line 208</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>EvolutionCMS\\Extensions\\Router->EvolutionCMS\\Extensions\\{closure}</strong>(\'smartphones\')<br />core/vendor/illuminate/routing/Route.php on line 237</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>EvolutionCMS\\Core->executeParser</strong>()<br />core/src/Extensions/Router.php on line 25</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>EvolutionCMS\\Core->prepareResponse</strong>()<br />core/src/Core.php on line 2826</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\Factory->make</strong>(\'catalog1\', array $var2)<br />core/src/Core.php on line 2923</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\FileViewFinder->find</strong>(\'catalog1\')<br />core/vendor/illuminate/view/Factory.php on line 137</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\FileViewFinder->findInPaths</strong>(\'catalog1\', array $var2)<br />core/vendor/illuminate/view/FileViewFinder.php on line 79</td>\n	</tr>\n</table>\n'),
  ('15','0','1737397717','3','0','1','Parser -         throw new InvalidArgumentExceptio','<h2 style=\"color:red\">&laquo; Evolution CMS Parse Error &raquo;</h2><h3 style=\"color:red\">View [catalog1] not found.</h3>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>File</td>\n		<td>C:\\xampp\\htdocs\\evolution\\core\\vendor\\illuminate\\view\\FileViewFinder.php</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Line</td>\n		<td>137</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Source</td>\n		<td>        throw new InvalidArgumentException(&quot;View [{$name}] not found.&quot;);\n</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://127.0.0.1/evolution/smartphones</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[14] <a href=\"http://127.0.0.1/evolution/smartphones\" target=\"_blank\">Смартфоны</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td>http://127.0.0.1/evolution/smartphones</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2025-01-20 19:28:37</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0000 s (0 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.4890 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.4890 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>17.589256286621 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>EvolutionCMS\\Core->processRoutes</strong>()<br />index.php on line 137</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Routing\\Router->dispatch</strong>(Illuminate\\Http\\Request $var1)<br />core/src/Core.php on line 2676</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Router->dispatchToRoute</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/routing/Router.php on line 651</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Routing\\Router->runRoute</strong>(Illuminate\\Http\\Request $var1, Illuminate\\Routing\\Route $var2)<br />core/vendor/illuminate/routing/Router.php on line 662</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Router->runRouteWithinStack</strong>(Illuminate\\Routing\\Route $var1, Illuminate\\Http\\Request $var2)<br />core/vendor/illuminate/routing/Router.php on line 698</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->then</strong>(Closure $var1)<br />core/vendor/illuminate/routing/Router.php on line 719</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 103</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Session\\Middleware\\StartSession->handle</strong>(Illuminate\\Http\\Request $var1, Closure $var2)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 167</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Session\\Middleware\\StartSession->handleStatefulRequest</strong>(Illuminate\\Http\\Request $var1, Illuminate\\Session\\Store $var2, Closure $var3)<br />core/vendor/illuminate/session/Middleware/StartSession.php on line 64</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/session/Middleware/StartSession.php on line 121</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Middleware\\SubstituteBindings->handle</strong>(Illuminate\\Http\\Request $var1, Closure $var2)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 167</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/routing/Middleware/SubstituteBindings.php on line 50</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle</strong>(Illuminate\\Http\\Request $var1, Closure $var2)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 167</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/view/Middleware/ShareErrorsFromSession.php on line 49</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 128</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Routing\\Route->run</strong>()<br />core/vendor/illuminate/routing/Router.php on line 721</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Route->runCallable</strong>()<br />core/vendor/illuminate/routing/Route.php on line 208</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>EvolutionCMS\\Extensions\\Router->EvolutionCMS\\Extensions\\{closure}</strong>(\'smartphones\')<br />core/vendor/illuminate/routing/Route.php on line 237</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>EvolutionCMS\\Core->executeParser</strong>()<br />core/src/Extensions/Router.php on line 25</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>EvolutionCMS\\Core->prepareResponse</strong>()<br />core/src/Core.php on line 2826</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\Factory->make</strong>(\'catalog1\', array $var2)<br />core/src/Core.php on line 2923</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\FileViewFinder->find</strong>(\'catalog1\')<br />core/vendor/illuminate/view/Factory.php on line 137</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\FileViewFinder->findInPaths</strong>(\'catalog1\', array $var2)<br />core/vendor/illuminate/view/FileViewFinder.php on line 79</td>\n	</tr>\n</table>\n'),
  ('16','0','1737397856','3','0','1','Parser -         throw new InvalidArgumentExceptio','<h2 style=\"color:red\">&laquo; Evolution CMS Parse Error &raquo;</h2><h3 style=\"color:red\">View [catalog1] not found.</h3>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>File</td>\n		<td>C:\\xampp\\htdocs\\evolution\\core\\vendor\\illuminate\\view\\FileViewFinder.php</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Line</td>\n		<td>137</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Source</td>\n		<td>        throw new InvalidArgumentException(&quot;View [{$name}] not found.&quot;);\n</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://127.0.0.1/evolution/catalog/smartphones</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[14] <a href=\"http://127.0.0.1/evolution/catalog/smartphones\" target=\"_blank\">Смартфоны</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td>http://127.0.0.1/evolution/manager/</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2025-01-20 19:30:56</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0000 s (0 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.3948 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.3948 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>17.589057922363 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>EvolutionCMS\\Core->processRoutes</strong>()<br />index.php on line 137</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Routing\\Router->dispatch</strong>(Illuminate\\Http\\Request $var1)<br />core/src/Core.php on line 2676</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Router->dispatchToRoute</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/routing/Router.php on line 651</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Routing\\Router->runRoute</strong>(Illuminate\\Http\\Request $var1, Illuminate\\Routing\\Route $var2)<br />core/vendor/illuminate/routing/Router.php on line 662</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Router->runRouteWithinStack</strong>(Illuminate\\Routing\\Route $var1, Illuminate\\Http\\Request $var2)<br />core/vendor/illuminate/routing/Router.php on line 698</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->then</strong>(Closure $var1)<br />core/vendor/illuminate/routing/Router.php on line 719</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 103</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Session\\Middleware\\StartSession->handle</strong>(Illuminate\\Http\\Request $var1, Closure $var2)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 167</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Session\\Middleware\\StartSession->handleStatefulRequest</strong>(Illuminate\\Http\\Request $var1, Illuminate\\Session\\Store $var2, Closure $var3)<br />core/vendor/illuminate/session/Middleware/StartSession.php on line 64</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/session/Middleware/StartSession.php on line 121</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Middleware\\SubstituteBindings->handle</strong>(Illuminate\\Http\\Request $var1, Closure $var2)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 167</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/routing/Middleware/SubstituteBindings.php on line 50</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle</strong>(Illuminate\\Http\\Request $var1, Closure $var2)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 167</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/view/Middleware/ShareErrorsFromSession.php on line 49</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 128</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Routing\\Route->run</strong>()<br />core/vendor/illuminate/routing/Router.php on line 721</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Route->runCallable</strong>()<br />core/vendor/illuminate/routing/Route.php on line 208</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>EvolutionCMS\\Extensions\\Router->EvolutionCMS\\Extensions\\{closure}</strong>(\'catalog/smartphones\')<br />core/vendor/illuminate/routing/Route.php on line 237</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>EvolutionCMS\\Core->executeParser</strong>()<br />core/src/Extensions/Router.php on line 25</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>EvolutionCMS\\Core->prepareResponse</strong>()<br />core/src/Core.php on line 2826</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\Factory->make</strong>(\'catalog1\', array $var2)<br />core/src/Core.php on line 2923</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\FileViewFinder->find</strong>(\'catalog1\')<br />core/vendor/illuminate/view/Factory.php on line 137</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\FileViewFinder->findInPaths</strong>(\'catalog1\', array $var2)<br />core/vendor/illuminate/view/FileViewFinder.php on line 79</td>\n	</tr>\n</table>\n');


# --------------------------------------------------------

#
# Table structure for table `htbu_manager_log`
#

DROP TABLE IF EXISTS `htbu_manager_log`;
CREATE TABLE `htbu_manager_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `timestamp` int NOT NULL DEFAULT '0',
  `internalKey` int NOT NULL DEFAULT '0',
  `username` varchar(255) DEFAULT NULL,
  `action` int NOT NULL DEFAULT '0',
  `itemid` varchar(10) DEFAULT '0',
  `itemname` varchar(255) DEFAULT NULL,
  `message` varchar(255) NOT NULL DEFAULT '',
  `ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `useragent` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `manager_log_internalkey_index` (`internalKey`),
  KEY `manager_log_action_index` (`action`),
  KEY `manager_log_itemid_index` (`itemid`),
  KEY `manager_log_itemname_index` (`itemname`),
  KEY `manager_log_message_index` (`message`),
  KEY `manager_log_timestamp_index` (`timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=850 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

#
# Dumping data for table `htbu_manager_log`
#

INSERT INTO `htbu_manager_log` VALUES
  ('1','1729111445','1','admin','58','-','EVO','Logged in','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('2','1729111446','1','admin','17','','-','Editing settings','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('3','1729111500','1','admin','30','','-','Saving settings','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('4','1729148935','1','admin','17','','-','Editing settings','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('5','1729149049','1','admin','30','','-','Saving settings','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('6','1729149063','1','admin','27','1','Evolution CMS Install Success','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('7','1729149457','1','admin','71','','-','Searching','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('8','1729149801','1','admin','76','','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('9','1729149812','1','admin','101','','Новый сниппет','Create new plugin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('10','1729149939','1','admin','103','-','TinyMCE4','Saving plugin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('11','1729149940','1','admin','102','6','TinyMCE4','Edit plugin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('12','1729149961','1','admin','53','','-','Viewing system info','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('13','1729149972','1','admin','71','','-','Searching','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('14','1729149973','1','admin','71','','-','Searching','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('15','1729150180','1','admin','17','','-','Editing settings','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('16','1729150222','1','admin','30','','-','Saving settings','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('17','1729150232','1','admin','27','1','Evolution CMS Install Success','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('18','1729150413','1','admin','4','','Новый ресурс','Creating a resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('19','1729150419','1','admin','5','-','new','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('20','1729150420','1','admin','27','2','new','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('21','1729150420','1','admin','67','-','-','Removing locks','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('22','1729150483','1','admin','4','','Новый ресурс','Creating a resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('23','1729150487','1','admin','5','-','in new','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('24','1729150487','1','admin','27','3','in new','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('25','1729150488','1','admin','67','-','-','Removing locks','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('26','1729150531','1','admin','17','','-','Editing settings','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('27','1729150795','1','admin','30','','-','Saving settings','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('28','1729150835','1','admin','17','','-','Editing settings','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('29','1729150874','1','admin','27','3','in new','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('30','1729150876','1','admin','27','2','new','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('31','1729150902','1','admin','5','2','new','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('32','1729150903','1','admin','27','2','new','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('33','1729150905','1','admin','27','1','Evolution CMS Install Success','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('34','1729150928','1','admin','30','','-','Saving settings','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('35','1729151231','1','admin','114','','-','View event log','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('36','1729151534','1','admin','93','','-','Backup Manager','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('37','1729151549','1','admin','93','','-','Backup Manager','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('38','1729151689','1','admin','27','1','Evolution CMS Install Success','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('39','1729151746','1','admin','5','1','Main','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('40','1729151746','1','admin','27','1','Main','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('41','1729151750','1','admin','17','','-','Editing settings','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('42','1729152247','1','admin','112','1','Extras','Execute module','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('43','1729152364','1','admin','30','','Extras','Saving settings','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('44','1729152374','1','admin','17','','-','Editing settings','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('45','1729152385','1','admin','27','1','Main','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('46','1729152530','1','admin','112','1','Extras','Execute module','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('47','1729155226','1','admin','71','','Extras','Searching','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('48','1729155228','1','admin','71','','-','Searching','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('49','1729155229','1','admin','71','','-','Searching','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('50','1729155230','1','admin','71','','-','Searching','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('51','1729155231','1','admin','71','','-','Searching','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('52','1729155231','1','admin','71','','-','Searching','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('53','1729155236','1','admin','71','','-','Searching','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('54','1729155582','1','admin','76','','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('55','1729155608','1','admin','76','','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('56','1729155610','1','admin','76','','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('57','1729155615','1','admin','101','','Новый сниппет','Create new plugin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('58','1729155628','1','admin','76','','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('59','1729155629','1','admin','67','-','-','Removing locks','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('60','1729156296','1','admin','76','','Extras','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('61','1729156298','1','admin','23','','Новый сниппет','Creating a new Snippet','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('62','1729156327','1','admin','24','-','DocLister','Saving Snippet','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('63','1729156327','1','admin','22','1','DocLister','Editing Snippet','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('64','1729156349','1','admin','112','1','Extras','Execute module','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('65','1729156467','1','admin','27','3','in new','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('66','1729156484','1','admin','5','3','in new','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('67','1729156484','1','admin','27','3','in new','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('68','1729156581','1','admin','76','','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('69','1729156594','1','admin','77','','Новый чанк','Creating a new Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('70','1729156612','1','admin','79','-','rowTpl','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('71','1729156612','1','admin','78','1','rowTpl','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('72','1729156649','1','admin','3','2','new','Viewing data for resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('73','1729156697','1','admin','5','3','in new','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('74','1729156697','1','admin','27','3','in new','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('75','1729156798','1','admin','5','3','in new','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('76','1729156798','1','admin','27','3','in new','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('77','1729156853','1','admin','76','','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('78','1729156912','1','admin','76','','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('79','1729156914','1','admin','22','1','DocLister','Editing Snippet','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('80','1729157012','1','admin','5','3','in new','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('81','1729157012','1','admin','27','3','in new','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('82','1729157057','1','admin','17','','-','Editing settings','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('83','1729157123','1','admin','112','1','Extras','Execute module','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('84','1729157128','1','admin','26','','-','Refreshing site','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('85','1729157145','1','admin','27','1','Main','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('86','1729157153','1','admin','5','3','in new','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('87','1729157153','1','admin','27','3','in new','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('88','1729157262','1','admin','23','','Новый сниппет','Creating a new Snippet','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('89','1729157265','1','admin','67','-','-','Removing locks','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('90','1729157398','1','admin','22','1','DocLister','Editing Snippet','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('91','1729157420','1','admin','22','3','DDocInfo','Editing Snippet','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('92','1729157440','1','admin','22','2','PageBuilder','Editing Snippet','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('93','1729157615','1','admin','76','','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('94','1729157618','1','admin','102','10','ClientSettings','Edit plugin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('95','1729157654','1','admin','71','','-','Searching','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('96','1729157655','1','admin','71','','-','Searching','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('97','1729157656','1','admin','71','','-','Searching','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('98','1729157657','1','admin','71','','-','Searching','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('99','1729157657','1','admin','71','','-','Searching','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('100','1729157657','1','admin','71','','-','Searching','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('101','1729157687','1','admin','112','1','Extras','Execute module','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('102','1729157690','1','admin','112','2','ClientSettings','Execute module','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('103','1729157714','1','admin','112','2','ClientSettings','Execute module','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('104','1729157732','1','admin','112','2','ClientSettings','Execute module','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('105','1729157737','1','admin','112','2','ClientSettings','Execute module','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('106','1729157780','1','admin','112','1','Extras','Execute module','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('107','1729157803','1','admin','76','','Extras','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('108','1729157806','1','admin','16','1','Minimal Template','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('109','1729157831','1','admin','27','1','Main','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('110','1729157853','1','admin','19','','Новый шаблон','Creating a new template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('111','1729157965','1','admin','20','-','Главная страница','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('112','1729157965','1','admin','16','2','Главная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('113','1729158031','1','admin','27','1','Main','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('114','1729158034','1','admin','27','1','Main','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('115','1729158062','1','admin','5','1','Main','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('116','1729158063','1','admin','27','1','Main','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('117','1729158428','1','admin','4','','Новый ресурс','Creating a resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('118','1729158483','1','admin','112','2','ClientSettings','Execute module','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('119','1729158489','1','admin','76','','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('120','1729158491','1','admin','19','','Новый шаблон','Creating a new template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('121','1729158564','1','admin','20','-','Каталог','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('122','1729158565','1','admin','16','3','Каталог','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('123','1729158607','1','admin','67','-','-','Removing locks','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('124','1729158608','1','admin','4','','Новый ресурс','Creating a resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('125','1729158611','1','admin','4','-','Новый ресурс','Creating a resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('126','1729158612','1','admin','67','-','-','Removing locks','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('127','1729158625','1','admin','5','-','Каталог','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('128','1729158625','1','admin','27','4','Каталог','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('129','1729158654','1','admin','76','','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('130','1729158656','1','admin','19','','Новый шаблон','Creating a new template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('131','1729158735','1','admin','51','4','Каталог','Moving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('132','1729158757','1','admin','3','4','Каталог','Viewing data for resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('133','1729158794','1','admin','4','','Новый ресурс','Creating a resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('134','1729158809','1','admin','67','-','-','Removing locks','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('135','1729158810','1','admin','67','-','-','Removing locks','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('136','1729158810','1','admin','4','','Новый ресурс','Creating a resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('137','1729158855','1','admin','19','','Новый шаблон','Creating a new template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('138','1729158873','1','admin','20','-','Раздел в каталоге','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('139','1729158874','1','admin','16','4','Раздел в каталоге','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('140','1729158908','1','admin','67','-','-','Removing locks','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('141','1729158909','1','admin','4','','Новый ресурс','Creating a resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('142','1729158912','1','admin','4','-','Новый ресурс','Creating a resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('143','1729158912','1','admin','67','-','-','Removing locks','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('144','1729158924','1','admin','5','-','Форма','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('145','1729158925','1','admin','27','5','Форма','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('146','1729158949','1','admin','4','','Новый ресурс','Creating a resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('147','1729158964','1','admin','5','-','Кепки','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('148','1729158964','1','admin','27','6','Кепки','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('149','1729158988','1','admin','19','','Новый шаблон','Creating a new template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('150','1729159025','1','admin','20','-','Товар','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('151','1729159026','1','admin','16','5','Товар','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('152','1729159031','1','admin','20','5','Товар','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('153','1729159031','1','admin','16','5','Товар','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('154','1729159060','1','admin','20','5','Товар','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('155','1729159060','1','admin','16','5','Товар','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('156','1729159097','1','admin','4','','Новый ресурс','Creating a resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('157','1729159124','1','admin','4','-','Новый ресурс','Creating a resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('158','1729159124','1','admin','67','-','-','Removing locks','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('159','1729159127','1','admin','5','-','Товар 1','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('160','1729159128','1','admin','27','7','Товар 1','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('161','1729159151','1','admin','94','7','Товар 1 Копия','Duplicate resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('162','1729159151','1','admin','3','8','Товар 1 Копия','Viewing data for resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('163','1729159160','1','admin','3','8','Товар 1 Копия','Viewing data for resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('164','1729159165','1','admin','27','8','Товар 1 Копия','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('165','1729159173','1','admin','5','8','Товар 1 Копия','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('166','1729159173','1','admin','27','8','Товар 1 Копия','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('167','1729159207','1','admin','5','8','Товар 1 Копия','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('168','1729159207','1','admin','27','8','Товар 1 Копия','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('169','1729159328','1','admin','5','7','Товар 1','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('170','1729159328','1','admin','27','7','Товар 1','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'),
  ('171','1729582964','1','admin','58','-','EVO','Logged in','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36'),
  ('172','1729583075','1','admin','17','','-','Editing settings','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36'),
  ('173','1729583179','1','admin','30','','-','Saving settings','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36'),
  ('174','1729583189','1','admin','17','','-','Editing settings','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36'),
  ('175','1729583253','1','admin','30','','-','Saving settings','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36'),
  ('176','1729585300','1','admin','28','','-','Changing password','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36'),
  ('177','1729585371','1','admin','99','','-','Manage Users','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36'),
  ('178','1729585469','1','admin','88','1','admin','Editing user','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36'),
  ('179','1729587944','1','admin','27','2','new','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36'),
  ('180','1729587946','1','admin','27','3','in new','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36'),
  ('181','1729587959','1','admin','27','4','Каталог','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36'),
  ('182','1729588019','1','admin','27','5','Форма','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36'),
  ('183','1729588121','1','admin','27','7','Товар 1','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36'),
  ('184','1729588249','1','admin','99','','-','Manage Users','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36'),
  ('185','1729588252','1','admin','88','1','admin','Editing user','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36'),
  ('186','1729588279','1','admin','58','-','EVO','Logged in','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36'),
  ('187','1729588284','1','admin','27','7','Товар 1','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36'),
  ('188','1729588294','1','admin','27','8','Товар 1 Копия','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36'),
  ('189','1729588334','1','admin','19','','Новый шаблон','Creating a new template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36'),
  ('190','1729588351','1','admin','20','-','Текстовая страница','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36'),
  ('191','1729588352','1','admin','16','6','Текстовая страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36'),
  ('192','1729588400','1','admin','4','','Новый ресурс','Creating a resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36'),
  ('193','1729588417','1','admin','4','-','Новый ресурс','Creating a resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36'),
  ('194','1729588417','1','admin','67','-','-','Removing locks','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36'),
  ('195','1729588444','1','admin','5','-','Доставка','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36'),
  ('196','1729588444','1','admin','27','9','Доставка','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36'),
  ('197','1729588481','1','admin','4','','Новый ресурс','Creating a resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36'),
  ('198','1729588502','1','admin','5','-','О нас ','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36'),
  ('199','1729588502','1','admin','27','10','О нас','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36'),
  ('200','1729588509','1','admin','20','6','Текстовая страница','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36'),
  ('201','1729588509','1','admin','16','6','Текстовая страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36'),
  ('202','1729588529','1','admin','19','','Новый шаблон','Creating a new template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36'),
  ('203','1729588565','1','admin','20','-','Контакты','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36'),
  ('204','1729588566','1','admin','16','7','Контакты','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36'),
  ('205','1729588574','1','admin','20','6','Текстовая страница','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36'),
  ('206','1729588574','1','admin','16','6','Текстовая страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36'),
  ('207','1729588638','1','admin','26','','-','Refreshing site','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36'),
  ('208','1729588653','1','admin','20','7','Контакты','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36'),
  ('209','1729588653','1','admin','16','7','Контакты','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36'),
  ('210','1729588674','1','admin','4','','Новый ресурс','Creating a resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36'),
  ('211','1729588677','1','admin','4','-','Новый ресурс','Creating a resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36'),
  ('212','1729588677','1','admin','67','-','-','Removing locks','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36'),
  ('213','1729588690','1','admin','5','-','Контакты','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36'),
  ('214','1729588690','1','admin','27','11','Контакты','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36'),
  ('215','1729588706','1','admin','19','','Новый шаблон','Creating a new template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36'),
  ('216','1729588721','1','admin','20','-','404','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36'),
  ('217','1729588721','1','admin','16','8','404','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36'),
  ('218','1729588739','1','admin','4','','Новый ресурс','Creating a resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36'),
  ('219','1729588756','1','admin','4','-','Новый ресурс','Creating a resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36'),
  ('220','1729588756','1','admin','67','-','-','Removing locks','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36'),
  ('221','1729588765','1','admin','5','-','404','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36'),
  ('222','1729588766','1','admin','27','12','404','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36'),
  ('223','1729588794','1','admin','17','','-','Editing settings','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36'),
  ('224','1729589122','1','admin','17','','-','Editing settings','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36'),
  ('225','1729589172','1','admin','27','1','Main','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36'),
  ('226','1729589190','1','admin','5','1','Главная','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36'),
  ('227','1729589191','1','admin','27','1','Главная','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36'),
  ('228','1736451470','1','admin','58','-','EVO','Logged in','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('229','1736451644','1','admin','53','','-','Viewing system info','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('230','1736451739','1','admin','4','','Новый ресурс','Creating a resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('231','1736451742','1','admin','67','-','-','Removing locks','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('232','1736451747','1','admin','31','','-','Using file manager','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('233','1736451870','1','admin','31','','-','Using file manager','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('234','1736451897','1','admin','27','4','Каталог','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('235','1736451933','1','admin','112','2','ClientSettings','Execute module','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('236','1736451947','1','admin','17','','-','Editing settings','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('237','1736452106','1','admin','27','1','Главная','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('238','1736579679','1','admin','71','','-','Searching','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('239','1736579680','1','admin','71','','-','Searching','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36');

INSERT INTO `htbu_manager_log` VALUES
  ('240','1736579703','1','admin','27','9','Доставка','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('241','1736580214','1','admin','27','1','Главная','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('242','1736580235','1','admin','5','1','Главная страница','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('243','1736580236','1','admin','27','1','Главная страница','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('244','1736580321','1','admin','5','1','Главная страница','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('245','1736580321','1','admin','27','1','Главная страница','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('246','1736580348','1','admin','27','10','О нас','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('247','1736580354','1','admin','27','11','Контакты','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('248','1736580359','1','admin','5','10','О компании','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('249','1736580360','1','admin','27','10','О компании','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('250','1736580404','1','admin','27','4','Каталог','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('251','1736580434','1','admin','5','9','Покупателю','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('252','1736580435','1','admin','27','9','Покупателю','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('253','1736580449','1','admin','5','11','Услуги','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('254','1736580450','1','admin','27','11','Услуги','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('255','1736580455','1','admin','27','2','new','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('256','1736580461','1','admin','6','2','new','Deleting resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('257','1736580461','1','admin','3','2','new','Viewing data for resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('258','1736580493','1','admin','5','11','Контакты','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('259','1736580494','1','admin','27','11','Контакты','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('260','1736580496','1','admin','4','','Новый ресурс','Creating a resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('261','1736580508','1','admin','5','-','Услуги','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('262','1736580508','1','admin','27','13','Услуги','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('263','1736580515','1','admin','76','','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('264','1736580539','1','admin','76','','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('265','1736580562','1','admin','101','','Новый сниппет','Create new plugin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('266','1736580569','1','admin','67','-','-','Removing locks','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('267','1736580639','1','admin','101','','Новый сниппет','Create new plugin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('268','1736580650','1','admin','76','','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('269','1736580651','1','admin','67','-','-','Removing locks','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('270','1736580877','1','admin','16','2','Главная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('271','1736581027','1','admin','20','2','Главная страница','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('272','1736581027','1','admin','16','2','Главная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('273','1736581086','1','admin','16','7','Контакты','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('274','1736585674','1','admin','16','3','Каталог','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('275','1736585716','1','admin','20','3','Категория каталога','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('276','1736585716','1','admin','16','3','Категория каталога','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('277','1736585727','1','admin','20','3','Категория каталога','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('278','1736585727','1','admin','16','3','Категория каталога','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('279','1736585743','1','admin','16','5','Товар','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('280','1736585759','1','admin','20','5','Категория товара','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('281','1736585759','1','admin','16','5','Категория товара','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('282','1736585777','1','admin','20','5','Карточка товара','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('283','1736585777','1','admin','16','5','Карточка товара','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('284','1736585784','1','admin','16','6','Текстовая страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('285','1736585802','1','admin','20','6','Информационная страница','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('286','1736585802','1','admin','16','6','Информационная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('287','1736585820','1','admin','76','','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('288','1736585843','1','admin','27','5','Форма','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('289','1736585850','1','admin','27','5','Форма','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('290','1736585851','1','admin','5','5','Форма','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('291','1736585852','1','admin','27','5','Форма','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('292','1736585860','1','admin','27','6','Кепки','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('293','1736585864','1','admin','27','6','Кепки','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('294','1736585865','1','admin','5','6','Кепки','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('295','1736585865','1','admin','27','6','Кепки','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('296','1736585897','1','admin','27','11','Контакты','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('297','1736585905','1','admin','27','11','Контакты','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('298','1736585908','1','admin','5','11','Контакты','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('299','1736585908','1','admin','27','11','Контакты','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('300','1736585929','1','admin','21','7','Контакты','Deleting template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('301','1736585929','1','admin','76','','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('302','1736585929','1','admin','76','','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('303','1736585933','1','admin','21','4','Раздел в каталоге','Deleting template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('304','1736585933','1','admin','76','','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('305','1736585933','1','admin','76','','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('306','1736585946','1','admin','27','12','404','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('307','1736585948','1','admin','27','12','404','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('308','1736585950','1','admin','5','12','404','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('309','1736585950','1','admin','27','12','404','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('310','1736585969','1','admin','27','4','Каталог','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('311','1736585971','1','admin','5','4','Каталог','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('312','1736585971','1','admin','27','4','Каталог','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('313','1736585975','1','admin','16','6','Информационная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('314','1736586017','1','admin','5','9','Покупателю','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('315','1736586017','1','admin','27','9','Покупателю','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('316','1736586031','1','admin','27','10','О компании','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('317','1736586032','1','admin','5','10','О компании','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('318','1736586032','1','admin','27','10','О компании','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('319','1736586046','1','admin','27','12','404','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('320','1736586053','1','admin','5','12','Ошибка 404','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('321','1736586053','1','admin','27','12','Ошибка 404','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('322','1736586064','1','admin','27','13','Услуги','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('323','1736586065','1','admin','5','13','Услуги','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('324','1736586066','1','admin','27','13','Услуги','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('325','1736586412','1','admin','16','6','Информационная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('326','1736586425','1','admin','27','4','Каталог','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('327','1736586447','1','admin','27','12','Ошибка 404','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('328','1736586492','1','admin','20','6','Информационная страница','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('329','1736586493','1','admin','16','6','Информационная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('330','1736586514','1','admin','16','6','Информационная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('331','1736586604','1','admin','20','6','Информационная страница','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('332','1736586605','1','admin','16','6','Информационная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('333','1736586644','1','admin','27','4','Каталог','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('334','1736586652','1','admin','27','11','Контакты','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('335','1736586677','1','admin','26','','-','Refreshing site','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('336','1736586686','1','admin','16','6','Информационная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('337','1736586714','1','admin','27','4','Каталог','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('338','1736586974','1','admin','16','2','Главная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('339','1736586993','1','admin','20','2','Главная страница','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('340','1736586993','1','admin','16','2','Главная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('341','1736587039','1','admin','20','6','Информационная страница','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('342','1736587039','1','admin','16','6','Информационная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('343','1736587048','1','admin','20','6','Информационная страница','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('344','1736587049','1','admin','16','6','Информационная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('345','1736587087','1','admin','20','6','Информационная страница','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('346','1736587088','1','admin','16','6','Информационная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('347','1736588667','1','admin','76','','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('348','1736588696','1','admin','300','','Новый шаблон','Create Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('349','1736588748','1','admin','302','-','Meta title','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('350','1736588749','1','admin','301','1','Meta title','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('351','1736588836','1','admin','302','1','Meta title','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('352','1736588837','1','admin','301','1','Meta title','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('353','1736588900','1','admin','20','2','Главная страница','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('354','1736588901','1','admin','16','2','Главная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('355','1736588924','1','admin','302','1','Meta title','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('356','1736588925','1','admin','301','1','Meta title','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('357','1736588990','1','admin','302','1','Meta title','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('358','1736588991','1','admin','301','1','Meta title','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('359','1736589228','1','admin','76','','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('360','1736589242','1','admin','20','6','Информационная страница','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('361','1736589243','1','admin','16','6','Информационная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('362','1736589248','1','admin','27','10','О компании','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('363','1736590464','1','admin','76','','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('364','1736590479','1','admin','77','','Новый чанк','Creating a new Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('365','1736590722','1','admin','77','-','Новый чанк','Creating a new Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('366','1736590723','1','admin','67','-','-','Removing locks','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('367','1736590742','1','admin','79','-','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('368','1736590743','1','admin','78','2','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('369','1736590761','1','admin','76','','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('370','1736590762','1','admin','78','2','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('371','1736590788','1','admin','79','2','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('372','1736590789','1','admin','78','2','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('373','1736590859','1','admin','79','2','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('374','1736590860','1','admin','78','2','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('375','1736590872','1','admin','76','','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('376','1736590874','1','admin','16','6','Информационная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('377','1736590908','1','admin','20','6','Информационная страница','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('378','1736590908','1','admin','16','6','Информационная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('379','1736590930','1','admin','20','6','Информационная страница','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('380','1736590930','1','admin','16','6','Информационная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('381','1736590936','1','admin','16','2','Главная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('382','1736590946','1','admin','20','2','Главная страница','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('383','1736590946','1','admin','16','2','Главная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('384','1736590967','1','admin','27','1','Главная страница','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('385','1736590975','1','admin','5','1','Главная страница','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('386','1736590976','1','admin','27','1','Главная страница','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('387','1736591086','1','admin','20','2','Главная страница','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('388','1736591086','1','admin','16','2','Главная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('389','1736591118','1','admin','20','2','Главная страница','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('390','1736591119','1','admin','16','2','Главная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('391','1736591156','1','admin','76','','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('392','1736591168','1','admin','20','2','Главная страница','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('393','1736591169','1','admin','16','2','Главная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('394','1736591426','1','admin','27','1','Главная страница','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('395','1736591429','1','admin','5','1','Главная страница','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('396','1736591430','1','admin','27','1','Главная страница','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('397','1736591443','1','admin','27','1','Главная страница','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('398','1736591454','1','admin','5','1','Главная страница','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('399','1736591455','1','admin','27','1','Главная страница','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('400','1736591522','1','admin','112','2','ClientSettings','Execute module','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('401','1736591525','1','admin','26','','-','Refreshing site','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('402','1736591548','1','admin','20','2','Главная страница','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('403','1736591549','1','admin','16','2','Главная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('404','1736970268','1','admin','76','','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('405','1736970297','1','admin','76','','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('406','1736971969','1','admin','16','2','Главная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('407','1736971985','1','admin','20','2','Главная страница','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('408','1736971986','1','admin','16','2','Главная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('409','1736972070','1','admin','76','','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('410','1736972086','1','admin','27','1','Главная страница','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('411','1736972092','1','admin','27','1','Главная страница','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('412','1736972095','1','admin','5','1','Главная страница','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('413','1736972095','1','admin','27','1','Главная страница','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('414','1736972102','1','admin','19','','Новый шаблон','Creating a new template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('415','1736972112','1','admin','21','2','Главная страница','Deleting template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('416','1736972113','1','admin','76','','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('417','1736972114','1','admin','76','','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('418','1736972162','1','admin','20','-','Главная страница','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('419','1736972162','1','admin','16','9','Главная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('420','1736972165','1','admin','27','1','Главная страница','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('421','1736972180','1','admin','20','9','Главная страница','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('422','1736972181','1','admin','16','9','Главная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('423','1736972187','1','admin','27','1','Главная страница','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('424','1736972191','1','admin','5','1','Главная страница','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('425','1736972192','1','admin','27','1','Главная страница','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('426','1736973445','1','admin','27','1','Главная страница','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('427','1736973449','1','admin','5','1','Главная страница','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('428','1736973450','1','admin','27','1','Главная страница','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('429','1736973461','1','admin','76','','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('430','1736973468','1','admin','21','9','Главная страница','Deleting template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('431','1736973468','1','admin','76','','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('432','1736973469','1','admin','76','','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('433','1736973517','1','admin','19','','Новый шаблон','Creating a new template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('434','1736973577','1','admin','20','-','Главная страница','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('435','1736973578','1','admin','16','10','Главная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('436','1736973582','1','admin','27','1','Главная страница','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('437','1736973585','1','admin','27','1','Главная страница','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('438','1736973586','1','admin','5','1','Главная страница','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('439','1736973587','1','admin','27','1','Главная страница','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('440','1736973630','1','admin','5','1','Главная страница','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('441','1736973631','1','admin','27','1','Главная страница','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('442','1736973713','1','admin','5','1','Главная страница','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('443','1736973714','1','admin','27','1','Главная страница','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('444','1736976444','1','admin','5','1','Главная страница','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('445','1736976445','1','admin','27','1','Главная страница','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('446','1736976448','1','admin','76','','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('447','1736976454','1','admin','77','','Новый чанк','Creating a new Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('448','1736976458','1','admin','67','-','-','Removing locks','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('449','1736976460','1','admin','78','2','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('450','1736976473','1','admin','77','','Новый чанк','Creating a new Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('451','1736976477','1','admin','67','-','-','Removing locks','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('452','1736977092','1','admin','79','2','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('453','1736977093','1','admin','78','2','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('454','1736977138','1','admin','77','','Новый чанк','Creating a new Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('455','1736977145','1','admin','79','-','head','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('456','1736977146','1','admin','78','3','head','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('457','1736977190','1','admin','79','3','head','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('458','1736977190','1','admin','78','3','head','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('459','1737058161','1','admin','112','2','ClientSettings','Execute module','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('460','1737058250','1','admin','27','1','Главная страница','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('461','1737058257','1','admin','76','','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('462','1737058260','1','admin','16','10','Главная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('463','1737058318','1','admin','78','3','head','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('464','1737058372','1','admin','20','10','Главная страница','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36');

INSERT INTO `htbu_manager_log` VALUES
  ('465','1737058372','1','admin','16','10','Главная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('466','1737058472','1','admin','5','1','Главная страница','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('467','1737058472','1','admin','27','1','Главная страница','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('468','1737058485','1','admin','20','10','Главная страница','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('469','1737058486','1','admin','16','10','Главная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('470','1737058543','1','admin','76','','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('471','1737058557','1','admin','77','','Новый чанк','Creating a new Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('472','1737058563','1','admin','79','-','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('473','1737058564','1','admin','78','4','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('474','1737058888','1','admin','79','3','head','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('475','1737058889','1','admin','78','3','head','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('476','1737058933','1','admin','26','','-','Refreshing site','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('477','1737058947','1','admin','79','3','head','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('478','1737058948','1','admin','78','3','head','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('479','1737059128','1','admin','79','3','head','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('480','1737059128','1','admin','78','3','head','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('481','1737059186','1','admin','79','3','head','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('482','1737059187','1','admin','78','3','head','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('483','1737059195','1','admin','78','2','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('484','1737059718','1','admin','20','10','Главная страница','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('485','1737059718','1','admin','16','10','Главная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('486','1737061630','1','admin','79','2','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('487','1737061631','1','admin','78','2','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('488','1737062729','1','admin','79','2','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('489','1737062730','1','admin','78','2','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('490','1737064428','1','admin','79','2','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('491','1737064428','1','admin','78','2','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('492','1737064512','1','admin','79','2','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('493','1737064512','1','admin','78','2','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('494','1737064636','1','admin','79','2','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('495','1737064637','1','admin','78','2','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('496','1737064819','1','admin','79','2','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('497','1737064820','1','admin','78','2','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('498','1737064841','1','admin','79','2','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('499','1737064842','1','admin','78','2','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('500','1737064936','1','admin','79','2','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('501','1737064937','1','admin','78','2','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('502','1737065117','1','admin','79','2','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('503','1737065119','1','admin','78','2','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('504','1737065283','1','admin','79','2','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('505','1737065284','1','admin','78','2','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('506','1737066017','1','admin','79','2','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('507','1737066018','1','admin','78','2','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('508','1737145781','1','admin','16','10','Главная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('509','1737146109','1','admin','78','4','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('510','1737146319','1','admin','79','4','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('511','1737146319','1','admin','78','4','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('512','1737151368','1','admin','20','10','Главная страница','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('513','1737151368','1','admin','16','10','Главная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('514','1737151574','1','admin','20','10','Главная страница','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('515','1737151575','1','admin','16','10','Главная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('516','1737151909','1','admin','20','10','Главная страница','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('517','1737151910','1','admin','16','10','Главная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('518','1737153140','1','admin','20','10','Главная страница','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('519','1737153141','1','admin','16','10','Главная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('520','1737153702','1','admin','20','10','Главная страница','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('521','1737153703','1','admin','16','10','Главная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('522','1737153855','1','admin','20','10','Главная страница','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('523','1737153856','1','admin','16','10','Главная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('524','1737154412','1','admin','20','10','Главная страница','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('525','1737154412','1','admin','16','10','Главная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('526','1737393273','1','admin','16','10','Главная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('527','1737393368','1','admin','78','4','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('528','1737393566','1','admin','79','4','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('529','1737393566','1','admin','78','4','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('530','1737393816','1','admin','78','2','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('531','1737393864','1','admin','79','4','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('532','1737393865','1','admin','78','4','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('533','1737394074','1','admin','79','4','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('534','1737394075','1','admin','78','4','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('535','1737394084','1','admin','79','4','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('536','1737394084','1','admin','78','4','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('537','1737396121','1','admin','79','4','footer','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('538','1737396122','1','admin','78','4','footer','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('539','1737396525','1','admin','77','','Новый чанк','Creating a new Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('540','1737396557','1','admin','79','-','main_home','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('541','1737396558','1','admin','78','5','main_home','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('542','1737396585','1','admin','20','10','Главная страница','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('543','1737396585','1','admin','16','10','Главная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('544','1737396876','1','admin','80','5','main_home','Deleting Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('545','1737396877','1','admin','76','','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('546','1737396882','1','admin','20','10','Главная страница','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('547','1737396883','1','admin','16','10','Главная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('548','1737397173','1','admin','76','','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('549','1737397177','1','admin','16','5','Карточка товара','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('550','1737397203','1','admin','16','3','Категория каталога','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('551','1737397224','1','admin','20','3','Категория каталога','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('552','1737397225','1','admin','16','3','Категория каталога','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('553','1737397230','1','admin','27','4','Каталог','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('554','1737397286','1','admin','27','5','Форма','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('555','1737397300','1','admin','27','7','Товар 1','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('556','1737397305','1','admin','27','7','Товар 1','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('557','1737397336','1','admin','5','7','Товар 1','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('558','1737397337','1','admin','27','7','Товар 1','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('559','1737397340','1','admin','26','','-','Refreshing site','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('560','1737397637','1','admin','27','4','Каталог','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('561','1737397648','1','admin','4','','Новый ресурс','Creating a resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('562','1737397678','1','admin','4','-','Новый ресурс','Creating a resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('563','1737397679','1','admin','67','-','-','Removing locks','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('564','1737397686','1','admin','5','-','Смартфоны','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('565','1737397686','1','admin','27','14','Смартфоны','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('566','1737397746','1','admin','20','3','Категория каталога','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('567','1737397746','1','admin','16','3','Категория каталога','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('568','1737397813','1','admin','27','1','Главная страница','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('569','1737397849','1','admin','20','3','Категория каталога','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('570','1737397850','1','admin','16','3','Категория каталога','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('571','1737399277','1','admin','20','3','Категория каталога','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('572','1737399277','1','admin','16','3','Категория каталога','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('573','1737399284','1','admin','19','','Новый шаблон','Creating a new template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('574','1737399332','1','admin','20','-','Категория каталогаа','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('575','1737399333','1','admin','16','11','Категория каталогаа','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('576','1737399370','1','admin','20','11','Категория каталогаа','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('577','1737399371','1','admin','16','11','Категория каталогаа','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('578','1737399396','1','admin','16','11','Категория каталогаа','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('579','1737399404','1','admin','27','14','Смартфоны','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('580','1737399408','1','admin','27','14','Смартфоны','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('581','1737399413','1','admin','5','14','Смартфоны','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('582','1737399414','1','admin','27','14','Смартфоны','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('583','1737399549','1','admin','20','11','Категория каталогаа','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('584','1737399550','1','admin','16','11','Категория каталогаа','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('585','1737399627','1','admin','78','3','head','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('586','1737399681','1','admin','79','3','head','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('587','1737399682','1','admin','78','3','head','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('588','1737399683','1','admin','26','','-','Refreshing site','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('589','1737399766','1','admin','79','3','head','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('590','1737399766','1','admin','78','3','head','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('591','1737399834','1','admin','16','10','Главная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('592','1737399892','1','admin','20','11','Категория каталогаа','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('593','1737399893','1','admin','16','11','Категория каталогаа','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('594','1737455841','1','admin','27','4','Каталог','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('595','1737455900','1','admin','16','11','Категория каталогаа','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('596','1737455928','1','admin','27','14','Смартфоны','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('597','1737531308','1','admin','16','11','Категория каталогаа','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('598','1737538737','1','admin','20','11','Категория каталогаа','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('599','1737538738','1','admin','16','11','Категория каталогаа','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('600','1737540019','1','admin','20','11','Категория каталогаа','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('601','1737540020','1','admin','16','11','Категория каталогаа','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('602','1737540074','1','admin','20','11','Категория каталогаа','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('603','1737540075','1','admin','16','11','Категория каталогаа','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('604','1737540244','1','admin','20','11','Категория каталогаа','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('605','1737540244','1','admin','16','11','Категория каталогаа','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('606','1737541770','1','admin','20','11','Категория каталогаа','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('607','1737541771','1','admin','16','11','Категория каталогаа','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('608','1737544291','1','admin','16','6','Информационная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('609','1737544329','1','admin','20','6','Информационная страница','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('610','1737544329','1','admin','16','6','Информационная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('611','1737544348','1','admin','27','10','О компании','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('612','1737544404','1','admin','20','6','Информационная страница','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('613','1737544404','1','admin','16','6','Информационная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('614','1737553598','1','admin','77','','Новый чанк','Creating a new Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('615','1737553625','1','admin','20','11','Категория каталогаа','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('616','1737553626','1','admin','16','11','Категория каталогаа','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('617','1737553650','1','admin','78','3','head','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('618','1737553666','1','admin','79','-','pagetitle','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('619','1737553667','1','admin','78','6','pagetitle','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('620','1737553691','1','admin','20','6','Информационная страница','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('621','1737553692','1','admin','16','6','Информационная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('622','1737553724','1','admin','20','11','Категория каталогаа','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('623','1737553724','1','admin','16','11','Категория каталогаа','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('624','1737553754','1','admin','20','11','Категория каталогаа','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('625','1737553755','1','admin','16','11','Категория каталогаа','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('626','1737553757','1','admin','27','1','Главная страница','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('627','1737553767','1','admin','16','10','Главная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('628','1737560740','1','admin','78','6','pagetitle','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('629','1737560805','1','admin','16','10','Главная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('630','1737562206','1','admin','78','3','head','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('631','1737562217','1','admin','78','2','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('632','1737562323','1','admin','27','1','Главная страница','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('633','1737567111','1','admin','79','2','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('634','1737567112','1','admin','78','2','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('635','1737568936','1','admin','79','2','header','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('636','1737568937','1','admin','78','2','header','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('637','1737571525','1','admin','76','','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('638','1737571528','1','admin','300','','Новый шаблон','Create Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('639','1737571577','1','admin','302','-','meta_h1','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('640','1737571578','1','admin','301','2','meta_h1','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('641','1737571588','1','admin','302','2','meta_h1','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('642','1737571589','1','admin','301','2','meta_h1','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('643','1737571906','1','admin','300','','Новый шаблон','Create Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('644','1737571949','1','admin','302','-','home_banner_desktop','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('645','1737571950','1','admin','301','3','home_banner_desktop','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('646','1737572036','1','admin','20','10','Главная страница','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('647','1737572036','1','admin','16','10','Главная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('648','1737572040','1','admin','20','10','Главная страница','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('649','1737572041','1','admin','16','10','Главная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('650','1737576459','1','admin','79','3','head','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('651','1737576460','1','admin','78','3','head','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('652','1737576669','1','admin','20','10','Главная страница','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('653','1737576670','1','admin','16','10','Главная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('654','1737576687','1','admin','27','1','Главная страница','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('655','1737576847','1','admin','5','1','Главная страница','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('656','1737576848','1','admin','27','1','Главная страница','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('657','1737576908','1','admin','16','10','Главная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('658','1737577033','1','admin','20','10','Главная страница','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('659','1737577033','1','admin','16','10','Главная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('660','1737577161','1','admin','5','1','Главная страница','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('661','1737577162','1','admin','27','1','Главная страница','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('662','1737577178','1','admin','5','1','Главная страница','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('663','1737577179','1','admin','27','1','Главная страница','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('664','1737577338','1','admin','20','10','Главная страница','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('665','1737577339','1','admin','16','10','Главная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('666','1737577385','1','admin','20','10','Главная страница','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('667','1737577385','1','admin','16','10','Главная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('668','1737577393','1','admin','20','10','Главная страница','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('669','1737577394','1','admin','16','10','Главная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('670','1737577420','1','admin','5','1','Главная страница','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('671','1737577421','1','admin','27','1','Главная страница','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('672','1737577540','1','admin','5','1','Главная страница','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('673','1737577541','1','admin','27','1','Главная страница','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('674','1737577626','1','admin','5','1','Главная страница','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('675','1737577626','1','admin','27','1','Главная страница','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('676','1737577660','1','admin','300','','Новый шаблон','Create Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('677','1737577675','1','admin','302','-','home_banner_mobile','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('678','1737577676','1','admin','301','4','home_banner_mobile','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('679','1737577680','1','admin','302','4','home_banner_mobile','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('680','1737577680','1','admin','301','4','home_banner_mobile','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('681','1737577693','1','admin','302','4','home_banner_mobile','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('682','1737577694','1','admin','301','4','home_banner_mobile','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('683','1737577702','1','admin','19','','Новый шаблон','Creating a new template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('684','1737577718','1','admin','67','-','-','Removing locks','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('685','1737577722','1','admin','300','','Новый шаблон','Create Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36');

INSERT INTO `htbu_manager_log` VALUES
  ('686','1737577737','1','admin','302','-','category_image','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('687','1737577738','1','admin','301','5','category_image','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('688','1737577745','1','admin','302','5','category_image','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('689','1737577746','1','admin','301','5','category_image','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('690','1737577767','1','admin','300','','Новый шаблон','Create Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('691','1737577797','1','admin','302','-','product_image','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('692','1737577798','1','admin','301','6','product_image','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('693','1737577812','1','admin','300','','Новый шаблон','Create Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('694','1737577825','1','admin','302','-','product_price','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('695','1737577826','1','admin','301','7','product_price','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('696','1737577831','1','admin','76','','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('697','1737577889','1','admin','301','2','meta_h1','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('698','1737577913','1','admin','300','','Новый шаблон','Create Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('699','1737577929','1','admin','302','-','og_title','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('700','1737577929','1','admin','301','8','og_title','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('701','1737577934','1','admin','300','','Новый шаблон','Create Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('702','1737577952','1','admin','302','-','og_description','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('703','1737577953','1','admin','301','9','og_description','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('704','1737577965','1','admin','300','','Новый шаблон','Create Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('705','1737577984','1','admin','302','-','og_image','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('706','1737577984','1','admin','301','10','og_image','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('707','1737577992','1','admin','76','','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('708','1737577995','1','admin','301','9','og_description','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('709','1737578000','1','admin','302','9','og_description','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('710','1737578001','1','admin','301','9','og_description','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('711','1737578006','1','admin','76','','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('712','1737578008','1','admin','27','1','Главная страница','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('713','1737579226','1','admin','16','10','Главная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('714','1737579277','1','admin','76','','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('715','1737579279','1','admin','78','3','head','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('716','1737579291','1','admin','76','','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('717','1737579295','1','admin','301','1','Meta title','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('718','1737579302','1','admin','302','1','Meta title','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('719','1737579302','1','admin','301','1','Meta title','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('720','1737579329','1','admin','302','1','Meta title','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('721','1737579329','1','admin','301','1','Meta title','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('722','1737579347','1','admin','79','3','head','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('723','1737579348','1','admin','78','3','head','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('724','1737579521','1','admin','79','3','head','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('725','1737579521','1','admin','78','3','head','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('726','1737579556','1','admin','79','3','head','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('727','1737579556','1','admin','78','3','head','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('728','1737579558','1','admin','112','2','ClientSettings','Execute module','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('729','1737579677','1','admin','20','10','Главная страница','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('730','1737579678','1','admin','16','10','Главная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('731','1737579706','1','admin','5','1','Главная страница','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('732','1737579706','1','admin','27','1','Главная страница','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('733','1737579807','1','admin','20','10','Главная страница','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('734','1737579807','1','admin','16','10','Главная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('735','1737579817','1','admin','5','1','Главная страница','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('736','1737579817','1','admin','27','1','Главная страница','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('737','1737579875','1','admin','20','10','Главная страница','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('738','1737579876','1','admin','16','10','Главная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('739','1737580010','1','admin','5','1','Главная страница','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('740','1737580011','1','admin','27','1','Главная страница','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('741','1737580056','1','admin','6','6','Кепки','Deleting resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('742','1737580056','1','admin','3','4','Каталог','Viewing data for resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('743','1737580061','1','admin','6','5','Форма','Deleting resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('744','1737580061','1','admin','3','4','Каталог','Viewing data for resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('745','1737580088','1','admin','76','','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('746','1737580092','1','admin','16','5','Карточка товара','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('747','1737580136','1','admin','16','11','Категория каталогаа','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('748','1737580169','1','admin','301','5','category_image','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('749','1737580208','1','admin','301','6','product_image','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('750','1737580214','1','admin','302','6','product_image','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('751','1737580214','1','admin','301','6','product_image','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('752','1737580221','1','admin','301','7','product_price','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('753','1737580225','1','admin','302','7','product_price','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('754','1737580225','1','admin','301','7','product_price','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('755','1737580235','1','admin','27','14','Смартфоны','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('756','1737580464','1','admin','78','6','pagetitle','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('757','1737580471','1','admin','79','6','pagetitle','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('758','1737580471','1','admin','78','6','pagetitle','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('759','1737580476','1','admin','5','14','Смартфоны','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('760','1737580476','1','admin','27','14','Смартфоны','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('761','1737580682','1','admin','20','11','Категория каталогаа','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('762','1737580682','1','admin','16','11','Категория каталогаа','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('763','1737580698','1','admin','5','14','Смартфоны','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('764','1737580698','1','admin','27','14','Смартфоны','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('765','1737580738','1','admin','5','14','Смартфоны','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('766','1737580739','1','admin','27','14','Смартфоны','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('767','1737580801','1','admin','20','11','Категория каталогаа','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('768','1737580802','1','admin','16','11','Категория каталогаа','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('769','1737580829','1','admin','20','11','Категория каталогаа','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('770','1737580829','1','admin','16','11','Категория каталогаа','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('771','1737580930','1','admin','20','11','Категория каталогаа','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('772','1737580930','1','admin','16','11','Категория каталогаа','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('773','1737580985','1','admin','5','14','Смартфоны','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('774','1737580986','1','admin','27','14','Смартфоны','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('775','1737581023','1','admin','20','11','Категория каталогаа','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('776','1737581024','1','admin','16','11','Категория каталогаа','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('777','1737581067','1','admin','20','11','Категория каталогаа','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('778','1737581068','1','admin','16','11','Категория каталогаа','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('779','1737619694','1','admin','27','14','Смартфоны','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('780','1737623949','1','admin','4','','Новый ресурс','Creating a resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('781','1737623982','1','admin','4','-','Новый ресурс','Creating a resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('782','1737623983','1','admin','67','-','-','Removing locks','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('783','1737623986','1','admin','5','-','Смартфон Xiaomi Redmi Note','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('784','1737623987','1','admin','27','15','Смартфон Xiaomi Redmi Note','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('785','1737624054','1','admin','5','15','Смартфон Xiaomi Redmi Note 10S 6/128 ГБ, синий','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('786','1737624055','1','admin','27','15','Смартфон Xiaomi Redmi Note 10S 6/128 ГБ, синий','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('787','1737624073','1','admin','76','','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('788','1737624121','1','admin','300','','Новый шаблон','Create Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('789','1737624123','1','admin','67','-','-','Removing locks','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('790','1737624154','1','admin','16','11','Категория каталогаа','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('791','1737624428','1','admin','300','','Новый шаблон','Create Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('792','1737624440','1','admin','302','-','product-name','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('793','1737624441','1','admin','301','11','product-name','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('794','1737624563','1','admin','20','11','Категория каталогаа','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('795','1737624564','1','admin','16','11','Категория каталогаа','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('796','1737624578','1','admin','27','14','Смартфоны','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('797','1737624583','1','admin','5','14','Смартфоны','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('798','1737624584','1','admin','27','14','Смартфоны','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('799','1737625162','1','admin','78','3','head','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('800','1737625227','1','admin','79','3','head','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('801','1737625228','1','admin','78','3','head','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('802','1737625388','1','admin','76','','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('803','1737625390','1','admin','16','10','Главная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('804','1737625978','1','admin','20','10','Главная страница','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('805','1737625979','1','admin','16','10','Главная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('806','1737625988','1','admin','27','1','Главная страница','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('807','1737625996','1','admin','5','1','Главная страница','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('808','1737625996','1','admin','27','1','Главная страница','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('809','1737626148','1','admin','20','10','Главная страница','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('810','1737626149','1','admin','16','10','Главная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('811','1737626283','1','admin','20','10','Главная страница','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('812','1737626284','1','admin','16','10','Главная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('813','1737626307','1','admin','5','1','Главная страница','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('814','1737626307','1','admin','27','1','Главная страница','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('815','1737626355','1','admin','20','10','Главная страница','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('816','1737626356','1','admin','16','10','Главная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('817','1737626375','1','admin','20','10','Главная страница','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('818','1737626376','1','admin','16','10','Главная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('819','1737626407','1','admin','26','','-','Refreshing site','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('820','1737626805','1','admin','20','10','Главная страница','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('821','1737626806','1','admin','16','10','Главная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('822','1737626878','1','admin','20','10','Главная страница','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('823','1737626879','1','admin','16','10','Главная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('824','1737627020','1','admin','5','1','Главная страница','Saving resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('825','1737627021','1','admin','27','1','Главная страница','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('826','1737627035','1','admin','20','10','Главная страница','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('827','1737627036','1','admin','16','10','Главная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('828','1737627091','1','admin','20','10','Главная страница','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('829','1737627091','1','admin','16','10','Главная страница','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('830','1737636145','1','admin','16','11','Категория каталогаа','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('831','1737636193','1','admin','112','1','Extras','Execute module','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('832','1737637785','1','admin','78','3','head','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('833','1737638369','1','admin','79','3','head','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('834','1737638369','1','admin','78','3','head','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('835','1737638443','1','admin','79','3','head','Saving Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('836','1737638444','1','admin','78','3','head','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('837','1737638455','1','admin','78','3','head','Editing Chunk (HTML Snippet)','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('838','1737649430','1','admin','93','','-','Backup Manager','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('839','1737649475','1','admin','27','15','Смартфон Xiaomi Redmi Note 10S 6/128 ГБ, синий','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('840','1737649501','1','admin','93','','-','Backup Manager','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('841','1737649514','1','admin','76','','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('842','1737649518','1','admin','16','3','Категория каталога','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('843','1737649546','1','admin','16','11','Категория каталогаа','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('844','1737649557','1','admin','21','3','Категория каталога','Deleting template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('845','1737649558','1','admin','76','','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('846','1737649558','1','admin','76','','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('847','1737649583','1','admin','27','9','Покупателю','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('848','1737649591','1','admin','27','10','О компании','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
  ('849','1737649653','1','admin','93','','-','Backup Manager','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36');


# --------------------------------------------------------

#
# Table structure for table `htbu_member_groups`
#

DROP TABLE IF EXISTS `htbu_member_groups`;
CREATE TABLE `htbu_member_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_group` int NOT NULL DEFAULT '0',
  `member` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_group_member` (`user_group`,`member`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# --------------------------------------------------------

#
# Table structure for table `htbu_membergroup_access`
#

DROP TABLE IF EXISTS `htbu_membergroup_access`;
CREATE TABLE `htbu_membergroup_access` (
  `id` int NOT NULL AUTO_INCREMENT,
  `membergroup` int NOT NULL DEFAULT '0',
  `documentgroup` int NOT NULL DEFAULT '0',
  `context` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# --------------------------------------------------------

#
# Table structure for table `htbu_membergroup_names`
#

DROP TABLE IF EXISTS `htbu_membergroup_names`;
CREATE TABLE `htbu_membergroup_names` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(245) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `membergroup_names_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# --------------------------------------------------------

#
# Table structure for table `htbu_migrations_install`
#

DROP TABLE IF EXISTS `htbu_migrations_install`;
CREATE TABLE `htbu_migrations_install` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

#
# Dumping data for table `htbu_migrations_install`
#

INSERT INTO `htbu_migrations_install` VALUES
  ('1','2018_06_29_182342_create_active_user_locks_table','1'),
  ('2','2018_06_29_182342_create_active_user_sessions_table','1'),
  ('3','2018_06_29_182342_create_active_users_table','1'),
  ('4','2018_06_29_182342_create_categories_table','1'),
  ('5','2018_06_29_182342_create_document_groups_table','1'),
  ('6','2018_06_29_182342_create_documentgroup_names_table','1'),
  ('7','2018_06_29_182342_create_event_log_table','1'),
  ('8','2018_06_29_182342_create_manager_log_table','1'),
  ('9','2018_06_29_182342_create_manager_users_table','1'),
  ('10','2018_06_29_182342_create_member_groups_table','1'),
  ('11','2018_06_29_182342_create_membergroup_access_table','1'),
  ('12','2018_06_29_182342_create_membergroup_names_table','1'),
  ('13','2018_06_29_182342_create_permissions_groups_table','1'),
  ('14','2018_06_29_182342_create_permissions_table','1'),
  ('15','2018_06_29_182342_create_role_permissions_table','1'),
  ('16','2018_06_29_182342_create_site_content_table','1'),
  ('17','2018_06_29_182342_create_site_htmlsnippets_table','1'),
  ('18','2018_06_29_182342_create_site_module_access_table','1'),
  ('19','2018_06_29_182342_create_site_module_depobj_table','1'),
  ('20','2018_06_29_182342_create_site_modules_table','1'),
  ('21','2018_06_29_182342_create_site_plugin_events_table','1'),
  ('22','2018_06_29_182342_create_site_plugins_table','1'),
  ('23','2018_06_29_182342_create_site_snippets_table','1'),
  ('24','2018_06_29_182342_create_site_templates_table','1'),
  ('25','2018_06_29_182342_create_site_tmplvar_access_table','1'),
  ('26','2018_06_29_182342_create_site_tmplvar_contentvalues_table','1'),
  ('27','2018_06_29_182342_create_site_tmplvar_templates_table','1'),
  ('28','2018_06_29_182342_create_site_tmplvars_table','1'),
  ('29','2018_06_29_182342_create_system_eventnames_table','1'),
  ('30','2018_06_29_182342_create_system_settings_table','1'),
  ('31','2018_06_29_182342_create_user_attributes_table','1'),
  ('32','2018_06_29_182342_create_user_roles_table','1'),
  ('33','2018_06_29_182342_create_user_settings_table','1'),
  ('34','2018_06_29_182342_create_web_groups_table','1'),
  ('35','2018_06_29_182342_create_web_user_attributes_table','1'),
  ('36','2018_06_29_182342_create_web_user_settings_table','1'),
  ('37','2018_06_29_182342_create_web_users_table','1'),
  ('38','2018_06_29_182342_create_webgroup_access_table','1'),
  ('39','2018_06_29_182342_create_webgroup_names_table','1'),
  ('40','2020_09_12_110820_create_site_content_closure','1'),
  ('41','2020_09_16_110820_update_web_user_attributes_table','1'),
  ('42','2020_10_05_124820_second_update_web_user_attributes_table','1'),
  ('43','2020_10_05_154230_drop_manager_user_tables','1'),
  ('44','2020_10_05_162325_rename_web_user_tables','1'),
  ('45','2020_10_08_112342_remove_column_from_role_table','1'),
  ('46','2020_10_12_065655_make_guid_nullable_in_modules','1'),
  ('47','2020_10_12_065655_make_moduleguid_nullable_in_plugins','1'),
  ('48','2020_10_28_154230_drop_webuser_group_tables','1'),
  ('49','2020_10_30_065655_make_dob_nullable_in_userattributes','1'),
  ('50','2020_11_02_100555_add_token_columns_to_user_table','1'),
  ('51','2020_11_10_110555_add_verified_columns_to_user_table','1'),
  ('52','2020_11_22_114803_create_user_role_vars','1'),
  ('53','2020_11_22_114809_create_user_values','1'),
  ('54','2020_12_23_065655_make_display_nullable_in_tmplvars','1'),
  ('55','2021_02_05_121655_add_index_to_pubdate_column_content_table','1'),
  ('56','2021_02_10_060454_add_properties_column_to_site_tmplvars','1'),
  ('57','2021_02_17_102610_rename_donthit_column_in_site_content_table','1'),
  ('58','2022_04_17_133922_add_context_column_to_membergroup_access','1'),
  ('59','2022_09_07_130522_resize_ip_column_in_manager_log','1'),
  ('60','2022_12_03_183200_add_unique_index_to_name_col_in_system_eventnames_table','1'),
  ('61','2023_01_06_191600_add_indexes_to_fields_in_manager_log_table','1'),
  ('62','2023_10_06_145300_modify_fullname_column_in_userattributes_table','1'),
  ('63','2024_03_13_001412_add_templatecontroller_column_to_site_templates','1'),
  ('64','2018_06_29_182342_create_permissions_table','1');


# --------------------------------------------------------

#
# Table structure for table `htbu_pagebuilder`
#

DROP TABLE IF EXISTS `htbu_pagebuilder`;
CREATE TABLE `htbu_pagebuilder` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `document_id` int unsigned NOT NULL,
  `container` varchar(255) DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `config` varchar(255) NOT NULL,
  `values` mediumtext NOT NULL,
  `visible` tinyint unsigned DEFAULT '1',
  `index` smallint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `document_id` (`document_id`,`container`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# --------------------------------------------------------

#
# Table structure for table `htbu_permissions`
#

DROP TABLE IF EXISTS `htbu_permissions`;
CREATE TABLE `htbu_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `lang_key` varchar(255) NOT NULL DEFAULT '',
  `group_id` int DEFAULT NULL,
  `disabled` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

#
# Dumping data for table `htbu_permissions`
#

INSERT INTO `htbu_permissions` VALUES
  ('1','Request manager frames','frames','role_frames','1','1',NULL,NULL),
  ('2','Request manager intro page','home','role_home','1','1',NULL,NULL),
  ('3','Log out of the manager','logout','role_logout','1','1',NULL,NULL),
  ('4','View help pages','help','role_help','1','0',NULL,NULL),
  ('5','View action completed screen','action_ok','role_actionok','1','1',NULL,NULL),
  ('6','View error dialog','error_dialog','role_errors','1','1',NULL,NULL),
  ('7','View the about page','about','role_about','1','1',NULL,NULL),
  ('8','View credits','credits','role_credits','1','1',NULL,NULL),
  ('9','Change password','change_password','role_change_password','1','0',NULL,NULL),
  ('10','Save password','save_password','role_save_password','1','0',NULL,NULL),
  ('11','View a Resource\'s data','view_document','role_view_docdata','2','1',NULL,NULL),
  ('12','Create new Resources','new_document','role_create_doc','2','0',NULL,NULL),
  ('13','Edit a Resource','edit_document','role_edit_doc','2','0',NULL,NULL),
  ('14','Change Resource-Type','change_resourcetype','role_change_resourcetype','2','0',NULL,NULL),
  ('15','Save Resources','save_document','role_save_doc','2','0',NULL,NULL),
  ('16','Publish Resources','publish_document','role_publish_doc','2','0',NULL,NULL),
  ('17','Delete Resources','delete_document','role_delete_doc','2','0',NULL,NULL),
  ('18','Permanently purge deleted Resources','empty_trash','role_empty_trash','2','0',NULL,NULL),
  ('19','Empty the site\'s cache','empty_cache','role_cache_refresh','2','0',NULL,NULL),
  ('20','View Unpublished Resources','view_unpublished','role_view_unpublished','2','0',NULL,NULL),
  ('21','Use the file manager (full root access)','file_manager','role_file_manager','3','0',NULL,NULL),
  ('22','Manage assets/files','assets_files','role_assets_files','3','0',NULL,NULL),
  ('23','Manage assets/images','assets_images','role_assets_images','3','0',NULL,NULL),
  ('24','Use the Category Manager','category_manager','role_category_manager','4','0',NULL,NULL),
  ('25','Create new Module','new_module','role_new_module','5','0',NULL,NULL),
  ('26','Edit Module','edit_module','role_edit_module','5','0',NULL,NULL),
  ('27','Save Module','save_module','role_save_module','5','0',NULL,NULL),
  ('28','Delete Module','delete_module','role_delete_module','5','0',NULL,NULL),
  ('29','Run Module','exec_module','role_run_module','5','0',NULL,NULL),
  ('30','List Module','list_module','role_list_module','5','0',NULL,NULL),
  ('31','Create new site Templates','new_template','role_create_template','6','0',NULL,NULL),
  ('32','Edit site Templates','edit_template','role_edit_template','6','0',NULL,NULL),
  ('33','Save Templates','save_template','role_save_template','6','0',NULL,NULL),
  ('34','Delete Templates','delete_template','role_delete_template','6','0',NULL,NULL),
  ('35','Create new Snippets','new_snippet','role_create_snippet','7','0',NULL,NULL),
  ('36','Edit Snippets','edit_snippet','role_edit_snippet','7','0',NULL,NULL),
  ('37','Save Snippets','save_snippet','role_save_snippet','7','0',NULL,NULL),
  ('38','Delete Snippets','delete_snippet','role_delete_snippet','7','0',NULL,NULL),
  ('39','Create new Chunks','new_chunk','role_create_chunk','8','0',NULL,NULL),
  ('40','Edit Chunks','edit_chunk','role_edit_chunk','8','0',NULL,NULL),
  ('41','Save Chunks','save_chunk','role_save_chunk','8','0',NULL,NULL),
  ('42','Delete Chunks','delete_chunk','role_delete_chunk','8','0',NULL,NULL),
  ('43','Create new Plugins','new_plugin','role_create_plugin','9','0',NULL,NULL),
  ('44','Edit Plugins','edit_plugin','role_edit_plugin','9','0',NULL,NULL),
  ('45','Save Plugins','save_plugin','role_save_plugin','9','0',NULL,NULL),
  ('46','Delete Plugins','delete_plugin','role_delete_plugin','9','0',NULL,NULL),
  ('47','Create new users','new_user','role_new_user','10','0',NULL,NULL),
  ('48','Edit users','edit_user','role_edit_user','10','0',NULL,NULL),
  ('49','Save users','save_user','role_save_user','10','0',NULL,NULL),
  ('50','Delete users','delete_user','role_delete_user','10','0',NULL,NULL),
  ('51','Manager access permissions','access_permissions','manager_access_permissions','11','0',NULL,NULL),
  ('52','Manage document and user groups','manage_groups','manage_groups','11','0',NULL,NULL),
  ('53','Manage document permissions','manage_document_permissions','manage_document_permissions','11','0',NULL,NULL),
  ('54','Manage module permissions','manage_module_permissions','manage_module_permissions','11','0',NULL,NULL),
  ('55','Manage TV permissions','manage_tv_permissions','manage_tv_permissions','11','0',NULL,NULL),
  ('56','Create new roles','new_role','role_new_role','12','0',NULL,NULL),
  ('57','Edit roles','edit_role','role_edit_role','12','0',NULL,NULL),
  ('58','Save roles','save_role','role_save_role','12','0',NULL,NULL),
  ('59','Delete roles','delete_role','role_delete_role','12','0',NULL,NULL),
  ('60','View event log','view_eventlog','role_view_eventlog','13','0',NULL,NULL),
  ('61','Delete event log','delete_eventlog','role_delete_eventlog','13','0',NULL,NULL),
  ('62','View system logs','logs','role_view_logs','14','0',NULL,NULL),
  ('63','Change site settings','settings','role_edit_settings','14','0',NULL,NULL),
  ('64','Use the Backup Manager','bk_manager','role_bk_manager','14','0',NULL,NULL),
  ('65','Remove Locks','remove_locks','role_remove_locks','14','0',NULL,NULL),
  ('66','Display Locks','display_locks','role_display_locks','14','0',NULL,NULL);


# --------------------------------------------------------

#
# Table structure for table `htbu_permissions_groups`
#

DROP TABLE IF EXISTS `htbu_permissions_groups`;
CREATE TABLE `htbu_permissions_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `lang_key` varchar(255) NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

#
# Dumping data for table `htbu_permissions_groups`
#

INSERT INTO `htbu_permissions_groups` VALUES
  ('1','General','page_data_general',NULL,NULL),
  ('2','Content Management','role_content_management',NULL,NULL),
  ('3','File Management','role_file_management',NULL,NULL),
  ('4','Category Management','category_management',NULL,NULL),
  ('5','Module Management','role_module_management',NULL,NULL),
  ('6','Template Management','role_template_management',NULL,NULL),
  ('7','Snippet Management','role_snippet_management',NULL,NULL),
  ('8','Chunk Management','role_chunk_management',NULL,NULL),
  ('9','Plugin Management','role_plugin_management',NULL,NULL),
  ('10','User Management','role_user_management',NULL,NULL),
  ('11','Permissions','role_udperms',NULL,NULL),
  ('12','Role Management','role_role_management',NULL,NULL),
  ('13','Events Log Management','role_eventlog_management',NULL,NULL),
  ('14','Config Management','role_config_management',NULL,NULL);


# --------------------------------------------------------

#
# Table structure for table `htbu_role_permissions`
#

DROP TABLE IF EXISTS `htbu_role_permissions`;
CREATE TABLE `htbu_role_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permission` varchar(255) NOT NULL,
  `role_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

#
# Dumping data for table `htbu_role_permissions`
#

INSERT INTO `htbu_role_permissions` VALUES
  ('1','frames','1',NULL,NULL),
  ('2','home','1',NULL,NULL),
  ('3','logout','1',NULL,NULL),
  ('4','help','1',NULL,NULL),
  ('5','role_actionok','1',NULL,NULL),
  ('6','error_dialog','1',NULL,NULL),
  ('7','about','1',NULL,NULL),
  ('8','credits','1',NULL,NULL),
  ('9','change_password','1',NULL,NULL),
  ('10','save_password','1',NULL,NULL),
  ('11','view_document','1',NULL,NULL),
  ('12','new_document','1',NULL,NULL),
  ('13','edit_document','1',NULL,NULL),
  ('14','change_resourcetype','1',NULL,NULL),
  ('15','save_document','1',NULL,NULL),
  ('16','publish_document','1',NULL,NULL),
  ('17','delete_document','1',NULL,NULL),
  ('18','empty_trash','1',NULL,NULL),
  ('19','empty_cache','1',NULL,NULL),
  ('20','view_unpublished','1',NULL,NULL),
  ('21','file_manager','1',NULL,NULL),
  ('22','assets_files','1',NULL,NULL),
  ('23','assets_images','1',NULL,NULL),
  ('24','category_manager','1',NULL,NULL),
  ('25','new_module','1',NULL,NULL),
  ('26','edit_module','1',NULL,NULL),
  ('27','save_module','1',NULL,NULL),
  ('28','delete_module','1',NULL,NULL),
  ('29','exec_module','1',NULL,NULL),
  ('30','list_module','1',NULL,NULL),
  ('31','new_template','1',NULL,NULL),
  ('32','edit_template','1',NULL,NULL),
  ('33','save_template','1',NULL,NULL),
  ('34','delete_template','1',NULL,NULL),
  ('35','new_snippet','1',NULL,NULL),
  ('36','edit_snippet','1',NULL,NULL),
  ('37','save_snippet','1',NULL,NULL),
  ('38','delete_snippet','1',NULL,NULL),
  ('39','new_chunk','1',NULL,NULL),
  ('40','edit_chunk','1',NULL,NULL),
  ('41','save_chunk','1',NULL,NULL),
  ('42','delete_chunk','1',NULL,NULL),
  ('43','new_plugin','1',NULL,NULL),
  ('44','edit_plugin','1',NULL,NULL),
  ('45','save_plugin','1',NULL,NULL),
  ('46','delete_plugin','1',NULL,NULL),
  ('47','new_user','1',NULL,NULL),
  ('48','edit_user','1',NULL,NULL),
  ('49','save_user','1',NULL,NULL),
  ('50','delete_user','1',NULL,NULL),
  ('51','access_permissions','1',NULL,NULL),
  ('52','manage_groups','1',NULL,NULL),
  ('53','manage_document_permissions','1',NULL,NULL),
  ('54','manage_module_permissions','1',NULL,NULL),
  ('55','manage_tv_permissions','1',NULL,NULL),
  ('56','new_role','1',NULL,NULL),
  ('57','edit_role','1',NULL,NULL),
  ('58','save_role','1',NULL,NULL),
  ('59','delete_role','1',NULL,NULL),
  ('60','view_eventlog','1',NULL,NULL),
  ('61','delete_eventlog','1',NULL,NULL),
  ('62','logs','1',NULL,NULL),
  ('63','settings','1',NULL,NULL),
  ('64','bk_manager','1',NULL,NULL),
  ('65','remove_locks','1',NULL,NULL),
  ('66','display_locks','1',NULL,NULL),
  ('67','frames','2',NULL,NULL),
  ('68','home','2',NULL,NULL),
  ('69','logout','2',NULL,NULL),
  ('70','help','2',NULL,NULL),
  ('71','role_actionok','2',NULL,NULL),
  ('72','error_dialog','2',NULL,NULL),
  ('73','about','2',NULL,NULL),
  ('74','credits','2',NULL,NULL),
  ('75','change_password','2',NULL,NULL),
  ('76','save_password','2',NULL,NULL),
  ('77','view_document','2',NULL,NULL),
  ('78','new_document','2',NULL,NULL),
  ('79','edit_document','2',NULL,NULL),
  ('80','change_resourcetype','2',NULL,NULL),
  ('81','save_document','2',NULL,NULL),
  ('82','publish_document','2',NULL,NULL),
  ('83','delete_document','2',NULL,NULL),
  ('84','empty_cache','2',NULL,NULL),
  ('85','view_unpublished','2',NULL,NULL),
  ('86','file_manager','2',NULL,NULL),
  ('87','assets_files','2',NULL,NULL),
  ('88','assets_images','2',NULL,NULL),
  ('89','exec_module','2',NULL,NULL),
  ('90','list_module','2',NULL,NULL),
  ('91','edit_chunk','2',NULL,NULL),
  ('92','save_chunk','2',NULL,NULL),
  ('93','remove_locks','2',NULL,NULL),
  ('94','display_locks','2',NULL,NULL),
  ('95','access_permissions','2',NULL,NULL),
  ('96','manage_document_permissions','2',NULL,NULL),
  ('97','frames','3',NULL,NULL),
  ('98','home','3',NULL,NULL),
  ('99','logout','3',NULL,NULL),
  ('100','help','3',NULL,NULL),
  ('101','role_actionok','3',NULL,NULL),
  ('102','error_dialog','3',NULL,NULL),
  ('103','about','3',NULL,NULL),
  ('104','credits','3',NULL,NULL),
  ('105','change_password','3',NULL,NULL),
  ('106','save_password','3',NULL,NULL),
  ('107','view_document','3',NULL,NULL),
  ('108','new_document','3',NULL,NULL),
  ('109','edit_document','3',NULL,NULL),
  ('110','change_resourcetype','3',NULL,NULL),
  ('111','save_document','3',NULL,NULL),
  ('112','publish_document','3',NULL,NULL),
  ('113','delete_document','3',NULL,NULL),
  ('114','empty_trash','3',NULL,NULL),
  ('115','empty_cache','3',NULL,NULL),
  ('116','view_unpublished','3',NULL,NULL),
  ('117','file_manager','3',NULL,NULL),
  ('118','assets_files','3',NULL,NULL),
  ('119','assets_images','3',NULL,NULL),
  ('120','exec_module','3',NULL,NULL),
  ('121','list_module','3',NULL,NULL),
  ('122','new_template','3',NULL,NULL),
  ('123','edit_template','3',NULL,NULL),
  ('124','save_template','3',NULL,NULL),
  ('125','delete_template','3',NULL,NULL),
  ('126','new_chunk','3',NULL,NULL),
  ('127','edit_chunk','3',NULL,NULL),
  ('128','save_chunk','3',NULL,NULL),
  ('129','delete_chunk','3',NULL,NULL),
  ('130','new_user','3',NULL,NULL),
  ('131','edit_user','3',NULL,NULL),
  ('132','save_user','3',NULL,NULL),
  ('133','delete_user','3',NULL,NULL),
  ('134','logs','3',NULL,NULL),
  ('135','settings','3',NULL,NULL),
  ('136','bk_manager','3',NULL,NULL),
  ('137','remove_locks','3',NULL,NULL),
  ('138','display_locks','3',NULL,NULL),
  ('139','access_permissions','3',NULL,NULL),
  ('140','manage_document_permissions','3',NULL,NULL);


# --------------------------------------------------------

#
# Table structure for table `htbu_site_content`
#

DROP TABLE IF EXISTS `htbu_site_content`;
CREATE TABLE `htbu_site_content` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL DEFAULT 'document',
  `contentType` varchar(50) NOT NULL DEFAULT 'text/html',
  `pagetitle` varchar(255) NOT NULL DEFAULT '',
  `longtitle` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(245) DEFAULT '',
  `link_attributes` varchar(255) NOT NULL DEFAULT '' COMMENT 'Link attriubtes',
  `published` int NOT NULL DEFAULT '0',
  `pub_date` int NOT NULL DEFAULT '0',
  `unpub_date` int NOT NULL DEFAULT '0',
  `parent` int NOT NULL DEFAULT '0',
  `isfolder` int NOT NULL DEFAULT '0',
  `introtext` text COMMENT 'Used to provide quick summary of the document',
  `content` longtext,
  `richtext` tinyint(1) NOT NULL DEFAULT '1',
  `template` int NOT NULL DEFAULT '0',
  `menuindex` int NOT NULL DEFAULT '0',
  `searchable` int NOT NULL DEFAULT '1',
  `cacheable` int NOT NULL DEFAULT '1',
  `createdby` int NOT NULL DEFAULT '0',
  `createdon` int NOT NULL DEFAULT '0',
  `editedby` int NOT NULL DEFAULT '0',
  `editedon` int NOT NULL DEFAULT '0',
  `deleted` int NOT NULL DEFAULT '0',
  `deletedon` int NOT NULL DEFAULT '0',
  `deletedby` int NOT NULL DEFAULT '0',
  `publishedon` int NOT NULL DEFAULT '0' COMMENT 'Date the document was published',
  `publishedby` int NOT NULL DEFAULT '0' COMMENT 'ID of user who published the document',
  `menutitle` varchar(255) NOT NULL DEFAULT '' COMMENT 'Menu title',
  `hide_from_tree` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Disable page hit count',
  `privateweb` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Private web document',
  `privatemgr` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Private manager document',
  `content_dispo` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-inline, 1-attachment',
  `hidemenu` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Hide document from menu',
  `alias_visible` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `typeidx` (`type`),
  KEY `aliasidx` (`alias`),
  KEY `parent` (`parent`),
  KEY `pub_unpub_published` (`pub_date`,`unpub_date`,`published`),
  KEY `pub_unpub` (`pub_date`,`unpub_date`),
  KEY `unpub` (`unpub_date`),
  KEY `pub` (`pub_date`),
  FULLTEXT KEY `content_ft_idx` (`pagetitle`,`description`,`content`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

#
# Dumping data for table `htbu_site_content`
#

INSERT INTO `htbu_site_content` VALUES
  ('1','document','text/html','Главная страница','','','glavnaya-stranica','','1','0','0','0','0','','','1','10','0','1','1','0','1130304721','1','1737627020','0','0','0','1130304721','1','Base Install','0','0','0','0','0','1'),
  ('2','document','text/html','new','','','new','','1','0','0','0','1','','','1','1','1','1','1','1','1729150419','0','1737397729','1','1736580461','1','1729150419','1','','0','0','0','0','0','1'),
  ('3','document','text/html','in new','','','in-new','','1','0','0','2','0','','<h3>Install Successful!</h3>\n<p>You have successfully installed Evolution CMS (Community Edition).</p>\n<h3>Getting Help</h3>\n<p>The <a href=\"https://evo-cms.com/\" target=\"_blank\" rel=\"noopener\">Evolution CMS</a> site provides a great starting point to learn all things about Evolution CMS.</p>\n<p>Welcome to Evolution CMS!</p>','1','1','0','1','1','1','1729150487','1','1729157153','1','1736580461','1','1729150486','1','','0','0','0','0','0','1'),
  ('4','document','text/html','Каталог','','','catalog','','1','0','0','0','1','','','1','6','3','1','1','1','1729158625','1','1737397732','0','0','0','1729158625','1','','0','0','0','0','0','1'),
  ('5','document','text/html','Форма','','','form','','1','0','0','4','1','','','1','5','0','1','1','1','1729158924','1','1737397732','1','1737580061','1','1729158924','1','','0','0','0','0','0','1'),
  ('6','document','text/html','Кепки','','','caps','','1','0','0','4','1','','','1','5','1','1','1','1','1729158964','1','1737397732','1','1737580056','1','1729158964','1','','0','0','0','0','0','1'),
  ('7','document','text/html','Товар 1','','','tovar-1','','1','0','0','5','0','','','1','3','0','1','1','1','1729159127','1','1737397336','1','1737580061','1','1729159127','1','','0','0','0','0','0','1'),
  ('8','document','text/html','Товар 1 Копия','','','tovar-1-kopiya','','1','0','0','6','0','','','1','5','0','1','1','1','1729159150','1','1729159173','1','1737580056','1','1729159172','1','','0','0','0','0','0','1'),
  ('9','document','text/html','Покупателю','','','delivery','','1','0','0','0','0','','','1','6','4','1','1','1','1729588444','1','1737397729','0','0','0','1729588443','1','','0','0','0','0','0','1'),
  ('10','document','text/html','О компании','','','about','','1','0','0','0','0','','','1','6','5','1','1','1','1729588502','1','1737397729','0','0','0','1729588501','1','','0','0','0','0','0','1'),
  ('11','document','text/html','Контакты','','','contacts','','1','0','0','0','0','','','1','6','6','1','1','1','1729588690','1','1737397729','0','0','0','1729588689','1','','0','0','0','0','0','1'),
  ('12','document','text/html','Ошибка 404','','','404','','1','0','0','0','0','','','1','6','7','1','1','1','1729588765','1','1737397729','0','0','0','1729588765','1','','0','0','0','0','1','1'),
  ('13','document','text/html','Услуги','','','uslugi','','1','0','0','0','0','','','1','6','8','1','1','1','1736580508','1','1737397729','0','0','0','1736580507','1','','0','0','0','0','0','1'),
  ('14','document','text/html','Смартфоны','','','smartphones','','1','0','0','4','1','','','1','11','2','1','1','1','1737397686','1','1737623986','0','0','0','1737397685','1','','0','0','0','0','0','1'),
  ('15','document','text/html','Смартфон Xiaomi Redmi Note 10S 6/128 ГБ, синий','','','smartfon-xiaomi-redmi-note','','1','0','0','14','0','','','1','5','0','1','1','1','1737623986','1','1737624054','0','0','0','1737623985','1','','0','0','0','0','0','1');


# --------------------------------------------------------

#
# Table structure for table `htbu_site_content_closure`
#

DROP TABLE IF EXISTS `htbu_site_content_closure`;
CREATE TABLE `htbu_site_content_closure` (
  `closure_id` int unsigned NOT NULL AUTO_INCREMENT,
  `ancestor` int unsigned NOT NULL,
  `descendant` int unsigned NOT NULL,
  `depth` int unsigned NOT NULL,
  PRIMARY KEY (`closure_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

#
# Dumping data for table `htbu_site_content_closure`
#

INSERT INTO `htbu_site_content_closure` VALUES
  ('1','1','1','0'),
  ('2','2','2','0'),
  ('3','2','3','1'),
  ('4','3','3','0'),
  ('5','4','4','0'),
  ('6','4','5','1'),
  ('7','5','5','0'),
  ('8','4','6','1'),
  ('9','6','6','0'),
  ('10','4','7','2'),
  ('11','5','7','1'),
  ('12','7','7','0'),
  ('13','4','8','2'),
  ('14','5','8','1'),
  ('15','8','8','0'),
  ('16','9','9','0'),
  ('17','10','10','0'),
  ('18','11','11','0'),
  ('19','12','12','0'),
  ('20','13','13','0'),
  ('21','14','14','0'),
  ('22','14','15','1'),
  ('23','15','15','0');


# --------------------------------------------------------

#
# Table structure for table `htbu_site_htmlsnippets`
#

DROP TABLE IF EXISTS `htbu_site_htmlsnippets`;
CREATE TABLE `htbu_site_htmlsnippets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Chunk',
  `editor_type` int NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `editor_name` varchar(50) NOT NULL DEFAULT 'none',
  `category` int NOT NULL DEFAULT '0' COMMENT 'category id',
  `cache_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Cache option',
  `snippet` mediumtext,
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `createdon` int NOT NULL DEFAULT '0',
  `editedon` int NOT NULL DEFAULT '0',
  `disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Disables the snippet',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

#
# Dumping data for table `htbu_site_htmlsnippets`
#

INSERT INTO `htbu_site_htmlsnippets` VALUES
  ('1','rowTpl','','2','none','0','0','<div class=\"doc-item\">\n  <h2><a href=\"[[~[+id]]\">[+pagetitle+]</a></h2>\n  <p>[+introtext+]</p>\n</div>\n','0','1729156612','1729156612','0'),
  ('2','header','','2','none','0','0','<header>\n  <div class=\"header-container\">\n	  <div class=\"header-top\">\n    	<nav class=\"menu\">\n		  <ul>\n			<li><a href=\"[[~1]]\">О компании</a></li>\n			<li><a href=\"[[~2]]\">Услуги</a></li>\n			<li><a href=\"[[~3]]\">Доставка</a></li>\n			<li><a href=\"[[~4]]\">Оплата</a></li>\n			<li><a href=\"[[~5]]\">Контакты</a></li>\n		  </ul>\n		</nav>\n    <div class=\"contacts\">\n      <span>+375 (29) 111-22-33</span>\n      <span>+375 (33) 111-22-33</span>\n    </div>\n	</div>\n	<div class=\"header-bottom\">\n		<div class=\"burger-btn\"></div>\n		<a href=\"/\" class=\"logo\">\n			<div class=\"icon\"></div>\n			<div class=\"text\">\n				<span>Qmedia Market</span>\n				<span>Интернет-магазин полезных вещей</span>\n			</div>\n		</a>\n		<div class=\"search-bar\">\n			<input type=\"text\" class=\"search-input\" placeholder=\"Поиск по каталогу...\" />\n			<button class=\"search-button\"></button>\n		</div>\n	</div>\n  </div>\n</header>\n','0','1736590742','1737568936','0'),
  ('3','head','','2','none','0','0','<meta charset=\"UTF-8\">\n<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n<title>[*meta_title*]</title>\n<link rel=\"stylesheet\" href=\"/evolution/assets/css/styles.css\">\n<link rel=\"stylesheet\" href=\"/evolution/assets/js/script.js\">\n<meta property=\"og:title\" content=\"[*og_title*]\">\n<meta property=\"og:description\" content=\"[*og_description*]\">\n<meta property=\"og:image\" content=\"[*og_image*]\">\n<meta property=\"og:type\" content=\"website\">\n<meta property=\"og:url\" content=\"[(site_url)][~[*id*]~]\">\n<meta property=\"og:image\" content=\"[(site_url)][*og_image*]\">','0','1736977145','1737638443','0'),
  ('4','footer','','2','none','0','0','<footer>\n  <div class=\"footer-container\">\n    <div class=\"footer-logo\">\n		<a href=\"/\" class=\"logo\">\n			<div class=\"icon\"></div>\n			<div class=\"text\">\n				<span>Qmedia Market</span>\n				<span>Интернет-магазин полезных вещей</span>\n			</div>\n		</a>\n      <p>Юр. адрес: 220123, г. Минск, ул. Старовиленская 100–4а<br>\n      Свидетельство о гос. регистрации номер: 0191397<br>(выдано Минским горисполкомом 14.10.2022)</p>\n    </div>\n	<div class=\"footer-info\">\n		<div class=\"footer-menu\">\n		  <h4>Каталог</h4>\n		  <a href=\"#\">Смартфоны</a>\n		  <a href=\"#\">Планшеты</a>\n		  <a href=\"#\">Ноутбуки</a>\n		  <a href=\"#\">Наушники и аудиотехника</a>\n		  <a href=\"#\">Телевизоры и видеотехника</a>\n		  <a href=\"#\">Бытовая техника</a>\n		</div>\n		<div class=\"footer-menu\">\n		  <h4>Информация</h4>\n		  <a href=\"#\">О компании</a>\n		  <a href=\"#\">Услуги</a>\n		  <a href=\"#\">Доставка</a>\n		  <a href=\"#\">Оплата</a>\n		  <a href=\"#\">Контакты</a>\n		</div>\n		<div class=\"footer-contacts\">\n		  <h4>Связаться с нами</h4>\n		  <p><a href=\"tel:+375291112233\" class=\"phone-link\">+375 (29) 111-22-33</a></p>\n		  <p><a href=\"tel:+375331112233\" class=\"phone-link\">+375 (33) 111-22-33</a></p>\n		  <p><a href=\"mailto:info@qmedia.by\" class=\"email-link\">info@qmedia.by</a></p>\n		</div>\n	</div>\n  </div>\n</footer>\n','0','1737058563','1737396121','0'),
  ('6','pagetitle','','2','none','0','0','<div class=\"breadcrumbs\">\n	<a href=\"/\">Главная</a> > <a href=\"#\">Каталог</a> > <span>Смартфоны</span>\n</div>\n<h1>[*meta_h1*]</h1>','0','1737553666','1737580471','0');


# --------------------------------------------------------

#
# Table structure for table `htbu_site_module_access`
#

DROP TABLE IF EXISTS `htbu_site_module_access`;
CREATE TABLE `htbu_site_module_access` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `module` int NOT NULL DEFAULT '0',
  `usergroup` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# --------------------------------------------------------

#
# Table structure for table `htbu_site_module_depobj`
#

DROP TABLE IF EXISTS `htbu_site_module_depobj`;
CREATE TABLE `htbu_site_module_depobj` (
  `id` int NOT NULL AUTO_INCREMENT,
  `module` int NOT NULL DEFAULT '0',
  `resource` int NOT NULL DEFAULT '0',
  `type` int NOT NULL DEFAULT '0' COMMENT '10-chunks, 20-docs, 30-plugins, 40-snips, 50-tpls, 60-tvs',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

#
# Dumping data for table `htbu_site_module_depobj`
#

INSERT INTO `htbu_site_module_depobj` VALUES
  ('1','2','10','30');


# --------------------------------------------------------

#
# Table structure for table `htbu_site_modules`
#

DROP TABLE IF EXISTS `htbu_site_modules`;
CREATE TABLE `htbu_site_modules` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '0',
  `editor_type` int NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `disabled` tinyint(1) NOT NULL DEFAULT '0',
  `category` int NOT NULL DEFAULT '0' COMMENT 'category id',
  `wrap` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT 'url to module icon',
  `enable_resource` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'enables the resource file feature',
  `resourcefile` varchar(255) NOT NULL DEFAULT '' COMMENT 'a physical link to a resource file',
  `createdon` int NOT NULL DEFAULT '0',
  `editedon` int NOT NULL DEFAULT '0',
  `guid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT 'globally unique identifier',
  `enable_sharedparams` tinyint(1) NOT NULL DEFAULT '0',
  `properties` text,
  `modulecode` mediumtext COMMENT 'module boot up code',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

#
# Dumping data for table `htbu_site_modules`
#

INSERT INTO `htbu_site_modules` VALUES
  ('1','Extras','<strong>0.1.3</strong> first repository for Evolution CMS','0','0','1','0','0','','0','','1729111335','1729111335','store435243542tf542t5t','1','',' \n/**\n * Extras\n * \n * first repository for Evolution CMS\n * \n * @category	module\n * @version 	0.1.3\n * @internal	@properties\n * @internal	@guid store435243542tf542t5t	\n * @internal	@shareparams 1\n * @internal	@dependencies requires files located at /assets/modules/store/\n * @internal	@modx_category Manager and Admin\n * @internal    @installset base, sample\n * @lastupdate  25/11/2016\n */\n\n//AUTHORS: Bumkaka & Dmi3yy \ninclude_once(\'../assets/modules/store/core.php\');'),
  ('2','ClientSettings','<strong>2.2.1</strong> Customizable set of fields for user settings','0','0','1','0','0','','0','','1729157525','1729157525','clsee234523g354f542t5t','1','{\"prefix\":[{\"label\":\"Prefix for settings\",\"type\":\"text\",\"value\":\"client_\",\"default\":\"client_\",\"desc\":\"\"}],\"config_path\":[{\"label\":\"Path to configuration files\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}]}','\n\nrequire_once MODX_BASE_PATH . \'assets/modules/clientsettings/core/src/ClientSettings.php\';\n\nif (!$modx->hasPermission(\'exec_module\')) {\n    $modx->sendRedirect(\'index.php?a=106\');\n}\n\nif (!is_array($modx->event->params)) {\n    $modx->event->params = [];\n}\n\nif (!function_exists(\'renderFormElement\')) {\n    include_once MODX_MANAGER_PATH . \'includes/tmplvars.commands.inc.php\';\n    include_once MODX_MANAGER_PATH . \'includes/tmplvars.inc.php\';\n}\n\nif (isset($_REQUEST[\'stay\'])) {\n    $_SESSION[\'stay\'] = $_REQUEST[\'stay\'];\n} else if (isset($_SESSION[\'stay\'])) {\n    $_REQUEST[\'stay\'] = $_SESSION[\'stay\'];\n}\n\n(new ClientSettings($params))->processRequest();\n'),
  ('3','Commerce','<strong>0.7.0</strong> Commerce solution','0','0','4','0','0','','0','','1729157789','1729157789','','0','','if (!$modx->hasPermission(\'exec_module\')) {\n    $modx->sendRedirect(\'index.php?a=106\');\n}\n\nif (!is_array($modx->event->params)) {\n    $modx->event->params = [];\n}\n\nif (!isset($_COOKIE[\'MODX_themeMode\'])) {\n    $_COOKIE[\'MODX_themeMode\'] = \'\';\n}\n\n$manager = new Commerce\\Module\\Manager($modx, array_merge($modx->event->params, [\n    \'module_url\' => \'index.php?a=112&id=\' . $_GET[\'id\'],\n    \'stay\' => \'\',\n]));\n\n$route = filter_input(INPUT_GET, \'type\', FILTER_VALIDATE_REGEXP, [\'options\' => [\n    \'regexp\'  => \'/^[a-z]+(:?\\/[a-z-]+)*$/\',\n    \'default\' => \'\',\n]]);\n\nreturn $manager->processRoute($route);\n');


# --------------------------------------------------------

#
# Table structure for table `htbu_site_plugin_events`
#

DROP TABLE IF EXISTS `htbu_site_plugin_events`;
CREATE TABLE `htbu_site_plugin_events` (
  `pluginid` int NOT NULL,
  `evtid` int NOT NULL DEFAULT '0',
  `priority` int NOT NULL DEFAULT '0' COMMENT 'determines plugin run order',
  PRIMARY KEY (`pluginid`,`evtid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

#
# Dumping data for table `htbu_site_plugin_events`
#

INSERT INTO `htbu_site_plugin_events` VALUES
  ('1','83','0'),
  ('2','39','0'),
  ('2','45','0'),
  ('2','89','0'),
  ('2','97','0'),
  ('2','99','0'),
  ('2','106','0'),
  ('2','111','0'),
  ('2','115','0'),
  ('3','83','1'),
  ('4','108','0'),
  ('5','83','2'),
  ('5','91','0'),
  ('5','102','0'),
  ('6','99','1'),
  ('6','100','1'),
  ('7','61','0'),
  ('7','64','0'),
  ('7','65','0'),
  ('7','93','0'),
  ('7','99','1'),
  ('7','100','1'),
  ('7','129','0'),
  ('8','9','0'),
  ('8','42','0'),
  ('8','45','1'),
  ('8','46','0'),
  ('9','91','1'),
  ('9','117','0'),
  ('9','123','0'),
  ('9','125','0'),
  ('9','128','0'),
  ('10','74','0'),
  ('12','64','1'),
  ('12','74','1'),
  ('12','77','0'),
  ('12','91','2'),
  ('12','102','1'),
  ('12','128','1'),
  ('12','129','1');


# --------------------------------------------------------

#
# Table structure for table `htbu_site_plugins`
#

DROP TABLE IF EXISTS `htbu_site_plugins`;
CREATE TABLE `htbu_site_plugins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Plugin',
  `editor_type` int NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int NOT NULL DEFAULT '0' COMMENT 'category id',
  `cache_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Cache option',
  `plugincode` mediumtext,
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `properties` text COMMENT 'Default Properties',
  `disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Disables the plugin',
  `moduleguid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT 'GUID of module from which to import shared parameters',
  `createdon` int NOT NULL DEFAULT '0',
  `editedon` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

#
# Dumping data for table `htbu_site_plugins`
#

INSERT INTO `htbu_site_plugins` VALUES
  ('1','AboutEvoWidget','<strong>1.1.0</strong> displays useful links at the dashboardn','0','1','0','require MODX_BASE_PATH.\'assets/plugins/aboutevo/plugin.aboutevo.php\';\n','0','{\"col_lg\":[{\"label\":\"Widget width\",\"type\":\"list\",\"value\":\"6\",\"options\":\"1,2,3,4,5,6,7,8,9,10,11,12\",\"default\":\"6\",\"desc\":\"\"}],\"menu_index\":[{\"label\":\"Output position\",\"type\":\"text\",\"value\":\"11\",\"default\":\"11\",\"desc\":\"\"}],\"hide_menu\":[{\"label\":\"Hide\",\"type\":\"list\",\"value\":\"0\",\"options\":\"0,1\",\"default\":\"0\",\"desc\":\"\"}]}','0','','1729111335','1729111335'),
  ('2','CodeMirror','<strong>1.7</strong> JavaScript library that can be used to create a relatively pleasant editor interface based on CodeMirror 5.33 (released on 21-12-2017)','0','1','0','\n/**\n * CodeMirror\n *\n * JavaScript library that can be used to create a relatively pleasant editor interface based on CodeMirror 5.33 (released on 21-12-2017)\n *\n * @category    plugin\n * @version     1.7\n * @license     http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)\n * @package     evo\n * @internal    @events OnDocFormRender,OnChunkFormRender,OnModFormRender,OnPluginFormRender,OnSnipFormRender,OnTempFormRender,OnRichTextEditorInit,OnTVFormRender\n * @internal    @modx_category Manager and Admin\n * @internal    @properties &theme=Theme;list;default,ambiance,blackboard,cobalt,eclipse,elegant,erlang-dark,lesser-dark,midnight,monokai,neat,night,one-dark,rubyblue,solarized,twilight,vibrant-ink,xq-dark,xq-light;default &darktheme=Dark Theme;list;default,ambiance,blackboard,cobalt,eclipse,elegant,erlang-dark,lesser-dark,midnight,monokai,neat,night,one-dark,rubyblue,solarized,twilight,vibrant-ink,xq-dark,xq-light;one-dark &fontSize=Font-size;list;10,11,12,13,14,15,16,17,18;14 &lineHeight=Line-height;list;1,1.1,1.2,1.3,1.4,1.5;1.3 &indentUnit=Indent unit;int;4 &tabSize=The width of a tab character;int;4 &lineWrapping=lineWrapping;list;true,false;true &matchBrackets=matchBrackets;list;true,false;true &activeLine=activeLine;list;true,false;false &emmet=emmet;list;true,false;true &search=search;list;true,false;true &indentWithTabs=indentWithTabs;list;true,false;true &undoDepth=undoDepth;int;200 &historyEventDelay=historyEventDelay;int;1250\n * @internal    @installset base\n * @reportissues https://github.com/evolution-cms/evolution/issues/\n * @documentation Official docs https://codemirror.net/doc/manual.html\n * @author      hansek from http://www.modxcms.cz\n * @author      update Mihanik71\n * @author      update Deesen\n * @author      update 64j\n * @lastupdate  08-01-2018\n */\n\n$_CM_BASE = \'assets/plugins/codemirror/\';\n\n$_CM_URL = MODX_SITE_URL . $_CM_BASE;\n\nrequire(MODX_BASE_PATH. $_CM_BASE .\'codemirror.plugin.php\');\n','0','{\"theme\":[{\"label\":\"Theme\",\"type\":\"list\",\"value\":\"default\",\"options\":\"default,ambiance,blackboard,cobalt,eclipse,elegant,erlang-dark,lesser-dark,midnight,monokai,neat,night,one-dark,rubyblue,solarized,twilight,vibrant-ink,xq-dark,xq-light\",\"default\":\"default\",\"desc\":\"\"}],\"darktheme\":[{\"label\":\"Dark Theme\",\"type\":\"list\",\"value\":\"one-dark\",\"options\":\"default,ambiance,blackboard,cobalt,eclipse,elegant,erlang-dark,lesser-dark,midnight,monokai,neat,night,one-dark,rubyblue,solarized,twilight,vibrant-ink,xq-dark,xq-light\",\"default\":\"one-dark\",\"desc\":\"\"}],\"fontSize\":[{\"label\":\"Font-size\",\"type\":\"list\",\"value\":\"14\",\"options\":\"10,11,12,13,14,15,16,17,18\",\"default\":\"14\",\"desc\":\"\"}],\"lineHeight\":[{\"label\":\"Line-height\",\"type\":\"list\",\"value\":\"1.3\",\"options\":\"1,1.1,1.2,1.3,1.4,1.5\",\"default\":\"1.3\",\"desc\":\"\"}],\"indentUnit\":[{\"label\":\"Indent unit\",\"type\":\"int\",\"value\":\"4\",\"default\":\"4\",\"desc\":\"\"}],\"tabSize\":[{\"label\":\"The width of a tab character\",\"type\":\"int\",\"value\":\"4\",\"default\":\"4\",\"desc\":\"\"}],\"lineWrapping\":[{\"label\":\"lineWrapping\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"matchBrackets\":[{\"label\":\"matchBrackets\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"activeLine\":[{\"label\":\"activeLine\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"emmet\":[{\"label\":\"emmet\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"search\":[{\"label\":\"search\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"indentWithTabs\":[{\"label\":\"indentWithTabs\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"undoDepth\":[{\"label\":\"undoDepth\",\"type\":\"int\",\"value\":\"200\",\"default\":\"200\",\"desc\":\"\"}],\"historyEventDelay\":[{\"label\":\"historyEventDelay\",\"type\":\"int\",\"value\":\"1250\",\"default\":\"1250\",\"desc\":\"\"}]}','0','','1729111335','1729111335'),
  ('3','OutdatedExtrasCheck','<strong>1.4.6</strong> Check for Outdated critical extras not compatible with EVO 1.4.6','0','1','0','/**\n * OutdatedExtrasCheck\n *\n * Check for Outdated critical extras not compatible with EVO 1.4.6\n *\n * @category	plugin\n * @version     1.4.6\n * @license 	http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)\n * @package     evo\n * @author      Author: Nicola Lambathakis\n * @internal    @events OnManagerWelcomeHome\n * @internal    @properties &wdgVisibility=Show widget for:;menu;All,AdminOnly,AdminExcluded,ThisRoleOnly,ThisUserOnly;AdminOnly &ThisRole=Run only for this role:;string;;;(role id) &ThisUser=Run only for this user:;string;;;(username)\n * @internal    @modx_category Manager and Admin\n * @internal    @installset base\n * @internal    @disabled 0\n */\n\nrequire MODX_BASE_PATH . \'assets/plugins/extrascheck/OutdatedExtrasCheck.plugin.php\';\n','0','{\"wdgVisibility\":[{\"label\":\"Show widget for:\",\"type\":\"menu\",\"value\":\"AdminOnly\",\"options\":\"All,AdminOnly,AdminExcluded,ThisRoleOnly,ThisUserOnly\",\"default\":\"AdminOnly\",\"desc\":\"\"}],\"ThisRole\":[{\"label\":\"Run only for this role:\",\"type\":\"string\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"ThisUser\":[{\"label\":\"Run only for this user:\",\"type\":\"string\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}]}','0','','1729111335','1729111335'),
  ('4','TransAlias','<strong>1.0.4</strong> Human readible URL translation supporting multiple languages and overrides','0','1','0','require MODX_BASE_PATH.\'assets/plugins/transalias/plugin.transalias.php\';','0','{\"table_name\":[{\"label\":\"Trans table\",\"type\":\"list\",\"value\":\"russian\",\"options\":\"common,russian,dutch,german,czech,utf8,utf8lowercase\",\"default\":\"russian\",\"desc\":\"\"}],\"char_restrict\":[{\"label\":\"Restrict alias to\",\"type\":\"list\",\"value\":\"lowercase alphanumeric\",\"options\":\"lowercase alphanumeric,alphanumeric,legal characters\",\"default\":\"lowercase alphanumeric\",\"desc\":\"\"}],\"remove_periods\":[{\"label\":\"Remove Periods\",\"type\":\"list\",\"value\":\"No\",\"options\":\"Yes,No\",\"default\":\"No\",\"desc\":\"\"}],\"word_separator\":[{\"label\":\"Word Separator\",\"type\":\"list\",\"value\":\"dash\",\"options\":\"dash,underscore,none\",\"default\":\"dash\",\"desc\":\"\"}],\"override_tv\":[{\"label\":\"Override TV name\",\"type\":\"string\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}]}','0','','1729111335','1729111335'),
  ('5','Updater','<strong>0.9.2</strong> show message about outdated CMS version','0','1','0','require MODX_BASE_PATH.\'assets/plugins/updater/plugin.updater.php\';\n','0','{\"wdgVisibility\":[{\"label\":\"Show widget for:\",\"type\":\"menu\",\"value\":\"All\",\"options\":\"All,AdminOnly,AdminExcluded,ThisRoleOnly,ThisUserOnly\",\"default\":\"All\",\"desc\":\"\"}],\"ThisRole\":[{\"label\":\"Show only to this role id:\",\"type\":\"string\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"ThisUser\":[{\"label\":\"Show only to this username:\",\"type\":\"string\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"showButton\":[{\"label\":\"Show Update Button:\",\"type\":\"menu\",\"value\":\"AdminOnly\",\"options\":\"show,hide,AdminOnly\",\"default\":\"AdminOnly\",\"desc\":\"\"}]}','0','','1729111335','1729111335'),
  ('6','TinyMCE4','','0','0','0','\nif ($modx->event->name == \'OnRichTextEditorInit\') {\n    $script = \'<script type=\"text/javascript\" src=\"/assets/plugins/tinymce4/tinymce.min.js\"></script>\';\n    $modx->regClientStartupScript($script);\n}\n\nif ($modx->event->name == \'OnRichTextEditorRegister\') {\n    $modx->event->output(\'TinyMCE4\');\n}\n\nif ($modx->event->name == \'OnRichTextEditorStartup\') {\n    $editorConfig = \"\n        <script type=\'text/javascript\'>\n            tinymce.init({\n                selector: \'textarea\',\n                plugins: \'advlist autolink lists link image charmap print preview hr anchor pagebreak\',\n                toolbar_mode: \'floating\',\n                toolbar: \'undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image\',\n                height: 500\n            });\n        </script>\";\n    $modx->regClientStartupScript($editorConfig);\n}\n','0','','1','','1729149939','1729152343'),
  ('7','TinyMCE4','<strong>4.9.11</strong> Javascript rich text editor','0','1','0','if (!defined(\'MODX_BASE_PATH\')) { die(\'What are you doing? Get out of here!\'); }\n\nrequire(MODX_BASE_PATH.\"assets/plugins/tinymce4/plugin.tinymce.inc.php\");','0','{\"styleFormats\":[{\"label\":\"Custom Style Formats <b>RAW<\\/b><br\\/><br\\/><ul><li>leave empty to use below block\\/inline formats<\\/li><li>allows simple-format: <i>Title,cssClass|Title2,cssClass2<\\/i><\\/li><li>Also accepts full JSON-config as per TinyMCE4 docs \\/ configure \\/ content-formating \\/ style_formats<\\/li><\\/ul>\",\"type\":\"textarea\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"styleFormats_inline\":[{\"label\":\"Custom Style Formats <b>INLINE<\\/b><br\\/><br\\/><ul><li>will wrap selected text with span-tag + css-class<\\/li><li>simple-format only<\\/li><\\/ul>\",\"type\":\"textarea\",\"value\":\"InlineTitle,cssClass1|InlineTitle2,cssClass2\",\"default\":\"InlineTitle,cssClass1|InlineTitle2,cssClass2\",\"desc\":\"\"}],\"styleFormats_block\":[{\"label\":\"Custom Style Formats <b>BLOCK<\\/b><br\\/><br\\/><ul><li>will add css-class to selected block-element<\\/li><li>simple-format only<\\/li><\\/ul>\",\"type\":\"textarea\",\"value\":\"BlockTitle,cssClass3|BlockTitle2,cssClass4\",\"default\":\"BlockTitle,cssClass3|BlockTitle2,cssClass4\",\"desc\":\"\"}],\"customParams\":[{\"label\":\"Custom Parameters<br\\/><b>(Be careful or leave empty!)<\\/b>\",\"type\":\"textarea\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"entityEncoding\":[{\"label\":\"Entity Encoding\",\"type\":\"list\",\"value\":\"named\",\"options\":\"named,numeric,raw\",\"default\":\"named\",\"desc\":\"\"}],\"entities\":[{\"label\":\"Entities\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"pathOptions\":[{\"label\":\"Path Options\",\"type\":\"list\",\"value\":\"Site config\",\"options\":\"Site config,Absolute path,Root relative,URL,No convert\",\"default\":\"Site config\",\"desc\":\"\"}],\"resizing\":[{\"label\":\"Advanced Resizing\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"disabledButtons\":[{\"label\":\"Disabled Buttons\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"webTheme\":[{\"label\":\"Web Theme\",\"type\":\"test\",\"value\":\"webuser\",\"default\":\"webuser\",\"desc\":\"\"}],\"webPlugins\":[{\"label\":\"Web Plugins\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"webButtons1\":[{\"label\":\"Web Buttons 1\",\"type\":\"text\",\"value\":\"bold italic underline strikethrough removeformat alignleft aligncenter alignright\",\"default\":\"bold italic underline strikethrough removeformat alignleft aligncenter alignright\",\"desc\":\"\"}],\"webButtons2\":[{\"label\":\"Web Buttons 2\",\"type\":\"text\",\"value\":\"link unlink image undo redo\",\"default\":\"link unlink image undo redo\",\"desc\":\"\"}],\"webButtons3\":[{\"label\":\"Web Buttons 3\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"webButtons4\":[{\"label\":\"Web Buttons 4\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"webAlign\":[{\"label\":\"Web Toolbar Alignment\",\"type\":\"list\",\"value\":\"ltr\",\"options\":\"ltr,rtl\",\"default\":\"ltr\",\"desc\":\"\"}],\"width\":[{\"label\":\"Width\",\"type\":\"text\",\"value\":\"100%\",\"default\":\"100%\",\"desc\":\"\"}],\"height\":[{\"label\":\"Height\",\"type\":\"text\",\"value\":\"400px\",\"default\":\"400px\",\"desc\":\"\"}],\"introtextRte\":[{\"label\":\"<b>Introtext RTE<\\/b><br\\/>add richtext-features to \\\"introtext\\\"\",\"type\":\"list\",\"value\":\"disabled\",\"options\":\"enabled,disabled\",\"default\":\"disabled\",\"desc\":\"\"}],\"inlineMode\":[{\"label\":\"<b>Inline-Mode<\\/b>\",\"type\":\"list\",\"value\":\"disabled\",\"options\":\"enabled,disabled\",\"default\":\"disabled\",\"desc\":\"\"}],\"inlineTheme\":[{\"label\":\"<b>Inline-Mode<\\/b><br\\/>Theme\",\"type\":\"text\",\"value\":\"inline\",\"default\":\"inline\",\"desc\":\"\"}],\"browser_spellcheck\":[{\"label\":\"<b>Browser Spellcheck<\\/b><br\\/>At least one dictionary must be installed inside your browser\",\"type\":\"list\",\"value\":\"disabled\",\"options\":\"enabled,disabled\",\"default\":\"disabled\",\"desc\":\"\"}],\"paste_as_text\":[{\"label\":\"<b>Force Paste as Text<\\/b>\",\"type\":\"list\",\"value\":\"disabled\",\"options\":\"enabled,disabled\",\"default\":\"disabled\",\"desc\":\"\"}]}','0','','1729152270','1729152343'),
  ('8','PageBuilder','<strong>1.3.16</strong> Creates form for manage content sections','0','1','0','include_once MODX_BASE_PATH . \'assets/plugins/pagebuilder/pagebuilder.php\';\n\n$e = &$modx->event;\n\nswitch ($e->name) {\n    case \'OnWebPageInit\':\n    case \'OnManagerPageInit\': {\n        $modx->db->query(\"DELETE FROM \" . $modx->getFullTableName(\'site_plugin_events\') . \"\n            WHERE pluginid IN (\n               SELECT id\n               FROM \" . $modx->getFullTableName(\'site_plugins\') . \"\n               WHERE name = \'\" . $e->activePlugin . \"\'\n               AND disabled = 0\n            )\n            AND evtid IN (\n               SELECT id\n               FROM \" . $modx->getFullTableName(\'system_eventnames\') . \"\n               WHERE name IN (\'OnWebPageInit\', \'OnManagerPageInit\')\n            )\");\n\n        $modx->clearCache(\'full\');\n\n        (new PageBuilder($modx))->install();\n\n        return;\n    }\n\n    case \'OnDocFormRender\': {\n        $e->output((new PageBuilder($modx))->renderForm());\n        return;\n    }\n\n    case \'OnDocFormSave\': {\n        (new PageBuilder($modx))->save();\n        return;\n    }\n\n    case \'OnBeforeEmptyTrash\': {\n        (new PageBuilder($modx))->delete();\n        return;\n    }\n\n    case \'OnDocDuplicate\': {\n        (new PageBuilder($modx))->duplicate();\n        return;\n    }\n}\n\n\n','0','{\"tabName\":[{\"label\":\"Tab name\",\"type\":\"text\",\"value\":\"Page Builder\",\"default\":\"Page Builder\",\"desc\":\"\"}],\"addType\":[{\"label\":\"Add type\",\"type\":\"menu\",\"value\":\"dropdown\",\"options\":\"dropdown,icons,images\",\"default\":\"dropdown\",\"desc\":\"\"}],\"placement\":[{\"label\":\"Placement\",\"type\":\"menu\",\"value\":\"tab\",\"options\":\"content,tab\",\"default\":\"tab\",\"desc\":\"\"}],\"order\":[{\"label\":\"Default container ordering\",\"type\":\"text\",\"value\":\"0\",\"default\":\"0\",\"desc\":\"\"}]}','0','','1729157192','1729157192'),
  ('9','userHelper','<strong>1.21.1</strong> addition to FormLister','0','2','0','require MODX_BASE_PATH.\'assets/snippets/FormLister/plugin.userHelper.php\';\n','0','{\"model\":[{\"label\":\"Model\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"logoutKey\":[{\"label\":\"Request key\",\"type\":\"text\",\"value\":\"logout\",\"default\":\"logout\",\"desc\":\"\"}],\"cookieName\":[{\"label\":\"Cookie Name\",\"type\":\"text\",\"value\":\"WebLoginPE\",\"default\":\"WebLoginPE\",\"desc\":\"\"}],\"cookieLifetime\":[{\"label\":\"Cookie Lifetime, seconds\",\"type\":\"text\",\"value\":\"157680000\",\"default\":\"157680000\",\"desc\":\"\"}],\"maxFails\":[{\"label\":\"Max failed logins\",\"type\":\"text\",\"value\":\"3\",\"default\":\"3\",\"desc\":\"\"}],\"blockTime\":[{\"label\":\"Block for, seconds\",\"type\":\"text\",\"value\":\"3600\",\"default\":\"3600\",\"desc\":\"\"}],\"trackWebUserActivity\":[{\"label\":\"Track web user activity\",\"type\":\"list\",\"value\":\"No\",\"options\":\"No,Yes\",\"default\":\"No\",\"desc\":\"\"}]}','1','','1729157491','1729157491'),
  ('10','ClientSettings','<strong>2.2.1</strong> Creates menu item for user module ClientSettings','0','1','0','\n\nif ($modx->event->name == \'OnManagerMenuPrerender\') {\n    require_once MODX_BASE_PATH . \'assets/modules/clientsettings/core/src/ClientSettings.php\';\n\n    $cs   = new ClientSettings($params);\n    $mid  = $cs->getModuleId();\n    $lang = $cs->loadLang();\n    $tabs = $cs->loadStructure();\n\n    if (!empty($tabs)) {\n        $menuparams = [\'client_settings\', \'main\', \'<i class=\"fa fa-cog\"></i>\' . $lang[\'cs.module_title\'], \'index.php?a=112&id=\' . $mid . \'&type=default\', $lang[\'cs.module_title\'], \'\', \'\', \'main\', 0, 100, \'\'];\n\n        if (count($tabs) > 1) {\n            $menuparams[3] = \'javscript:;\';\n            $menuparams[5] = \'return false;\';\n            $sort = 0;\n\n            $params[\'menu\'][\'client_settings_main\'] = [\'client_settings_main\', \'client_settings\', \'<i class=\"fa fa-cog\"></i>\' . $lang[\'cs.module_title\'], \'index.php?a=112&id=\' . $mid . \'&type=default\', $lang[\'cs.module_title\'], \'\', \'\', \'main\', 0, $sort, \'\'];\n\n            foreach ($tabs as $alias => $item) {\n                if ($alias != \'default\') {\n                    $params[\'menu\'][\'client_settings_\' . $alias] = [\'client_settings_\' . $alias, \'client_settings\', \'<i class=\"fa \' . (isset($item[\'menu\'][\'icon\']) ? $item[\'menu\'][\'icon\'] : \'fa-cog\') . \'\"></i>\' . $item[\'menu\'][\'caption\'], \'index.php?a=112&id=\' . $mid . \'&type=\' . $alias, $item[\'menu\'][\'caption\'], \'\', \'\', \'main\', 0, $sort += 10, \'\'];\n                }\n            }\n        }\n\n        $params[\'menu\'][\'client_settings\'] = $menuparams;\n        $modx->event->output(serialize($params[\'menu\']));\n    }\n\n    return;\n}\n\n','0','','0','clsee234523g354f542t5t','1729157525','1729157525'),
  ('12','Commerce','<strong>0.13.2</strong> Commerce solution','0','4','0','if (!class_exists(\'Commerce\\\\Commerce\')) {\n    require_once MODX_BASE_PATH . \'assets/plugins/commerce/autoload.php\';\n\n    $ci = ci();\n\n    $ci->set(\'modx\', function($ci) use ($modx) {\n        return $modx;\n    });\n\n    $ci->set(\'commerce\', function($ci) use ($modx, $params) {\n        return new Commerce\\Commerce($modx, $params);\n    });\n\n    $ci->set(\'currency\', function($ci) {\n        return $ci->commerce->currency;\n    });\n\n    $ci->set(\'cache\', function($ci) use ($modx) {\n        return Commerce\\Cache::getInstance();\n    });\n\n    $ci->set(\'carts\', function($ci) use ($modx) {\n        return Commerce\\CartsManager::getManager($modx);\n    });\n\n    $ci->set(\'db\', function($ci) {\n        return $ci->modx->db;\n    });\n\n    $ci->set(\'tpl\', function($ci) use ($modx) {\n        require_once MODX_BASE_PATH . \'assets/snippets/DocLister/lib/DLTemplate.class.php\';\n        return DLTemplate::getInstance($modx);\n    });\n\n    $ci->set(\'flash\', function($ci) {\n        return new Commerce\\Module\\FlashMessages;\n    });\n\n    $ci->set(\'statuses\', function($ci) use ($modx) {\n        return new Commerce\\Statuses($modx);\n    });\n}\n\nif ($modx instanceof \\Illuminate\\Container\\Container) {\n    if (!$modx->offsetExists(\'commerce\')) {\n        $modx->instance(\'commerce\', ci()->commerce);\n        $modx->commerce->initializeCommerce();\n    }\n} else if (!isset($modx->commerce) || isset($modx->commerce) && !($modx->commerce instanceof \\Commerce\\Commerce)) {\n    $modx->commerce = ci()->commerce;\n    $modx->commerce->initializeCommerce();\n}\n\nswitch ($modx->event->name) {\n    case \'OnWebPageInit\': {\n        $order_id = ci()->flash->get(\'last_order_id\');\n\n        if (!empty($order_id) && is_numeric($order_id)) {\n            $modx->commerce->loadProcessor()->populateOrderPlaceholders($order_id);\n        }\n\n        $payment_id = ci()->flash->get(\'last_payment_id\');\n\n        if (!empty($payment_id) && is_numeric($payment_id)) {\n            $modx->commerce->loadProcessor()->populatePaymentPlaceholders($payment_id);\n        }\n\n        break;\n    }\n\n    case \'OnLoadWebDocument\': {\n        if (!empty($params[\'product_templates\'])) {\n            $templates = array_map(\'trim\', explode(\',\', $params[\'product_templates\']));\n\n            if (in_array($modx->documentObject[\'template\'], $templates)) {\n                $modx->commerce->populateProductPagePlaceholders();\n            }\n        }\n\n        break;\n    }\n\n    case \'OnWebPagePrerender\': {\n        $modx->documentOutput = str_replace(\'</body>\', $modx->commerce->populateClientScripts() . \'</body>\', $modx->documentOutput);\n        return;\n    }\n\n    case \'OnManagerMenuPrerender\': {\n        if(!isset($params[\'module_id\'])) {\n            $moduleid = $modx->db->getValue($modx->db->select(\'id\', $modx->getFullTablename(\'site_modules\'), \"name = \'Commerce\'\"));\n        } else {\n            $moduleid = $params[\'module_id\'];\n        }\n        $url = \'index.php?a=112&id=\' . $moduleid;\n        $lang = $modx->commerce->getUserLanguage(\'menu\');\n\n        $params[\'menu\'] = array_merge($params[\'menu\'], [\n            \'commerce\' => [\'commerce\', \'main\', \'<i class=\"fa fa-shopping-cart\"></i>\' . $lang[\'menu.commerce\'], \'javascript:;\', $lang[\'menu.commerce\'], \'return false;\', \'exec_module\', \'main\', 0, 90, \'\'],\n            \'orders\'   => [\'orders\', \'commerce\', \'<i class=\"fa fa-list\"></i>\' . $lang[\'menu.orders\'], $url . \'&type=orders\', $lang[\'menu.orders\'], \'\', \'exec_module\', \'main\', 0, 10, \'\'],\n            \'statuses\' => [\'statuses\', \'commerce\', \'<i class=\"fa fa-play-circle\"></i>\' . $lang[\'menu.statuses\'], $url . \'&type=statuses\', $lang[\'menu.statuses\'], \'\', \'exec_module\', \'main\', 0, 20, \'\'],\n            \'currency\' => [\'currency\', \'commerce\', \'<i class=\"fa fa-usd\"></i>\' . $lang[\'menu.currency\'], $url . \'&type=currency\', $lang[\'menu.currency\'], \'\', \'exec_module\', \'main\', 0, 30, \'\'],\n        ]);\n\n        $modx->event->output(serialize($params[\'menu\']));\n        break;\n    }\n\n    case \'OnPageNotFound\': {\n        if (!empty($_GET[\'q\']) && is_scalar($_GET[\'q\']) && strpos($_GET[\'q\'], \'commerce\') === 0) {\n            $modx->commerce->processRoute($_GET[\'q\']);\n        }\n        break;\n    }\n\n    case \'OnSiteRefresh\': {\n        ci()->cache->clean();\n        break;\n    }\n}\n','0','{\"payment_success_page_id\":[{\"label\":\"Page ID for redirect after successfull payment\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"payment_failed_page_id\":[{\"label\":\"Page ID for redirect after payment error\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"cart_page_id\":[{\"label\":\"Cart page ID\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"order_page_id\":[{\"label\":\"Order page ID\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"status_id_after_payment\":[{\"label\":\"Status ID after payment\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"product_templates\":[{\"label\":\"Product templates IDs\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"title_field\":[{\"label\":\"Product title field name\",\"type\":\"text\",\"value\":\"pagetitle\",\"default\":\"pagetitle\",\"desc\":\"\"}],\"price_field\":[{\"label\":\"Product price field name\",\"type\":\"text\",\"value\":\"price\",\"default\":\"price\",\"desc\":\"\"}],\"status_notification\":[{\"label\":\"Chunk name for status change notification\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"order_paid\":[{\"label\":\"Chunk name for order paid notification\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"order_changed\":[{\"label\":\"Chunk name for order changed notification\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"templates_path\":[{\"label\":\"Path to custom templates\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"email\":[{\"label\":\"Email notifications recipient\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"default_payment\":[{\"label\":\"Default payment code\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"default_delivery\":[{\"label\":\"Default delivery code\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"instant_redirect_to_payment\":[{\"label\":\"Redirect to payment after order process\",\"type\":\"list\",\"value\":\"1\",\"options\":\"Instant==1||Show prepare text==0\",\"default\":\"1\",\"desc\":\"\"}],\"redirect_to_payment_tpl\":[{\"label\":\"Chunk name for redirect prepare text\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"payment_wait_time\":[{\"label\":\"Waiting time for order payment, days\",\"type\":\"text\",\"value\":\"3\",\"default\":\"3\",\"desc\":\"\"}],\"cart_controller\":[{\"label\":\"Class to use as a cart controller\",\"type\":\"text\",\"value\":\"CartDocLister\",\"default\":\"CartDocLister\",\"desc\":\"\"}],\"orders_display\":[{\"label\":\"The number of orders per page\",\"type\":\"text\",\"value\":\"10\",\"default\":\"10\",\"desc\":\"\"}],\"module_id\":[{\"label\":\"Commerce module ID (if renamed)\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}]}','0','','1729157789','1729157789');


# --------------------------------------------------------

#
# Table structure for table `htbu_site_snippets`
#

DROP TABLE IF EXISTS `htbu_site_snippets`;
CREATE TABLE `htbu_site_snippets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Snippet',
  `editor_type` int NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int NOT NULL DEFAULT '0' COMMENT 'category id',
  `cache_type` int NOT NULL DEFAULT '0' COMMENT 'Cache option',
  `snippet` mediumtext,
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `properties` text COMMENT 'Default Properties',
  `moduleguid` varchar(32) NOT NULL DEFAULT '' COMMENT 'GUID of module from which to import shared parameters',
  `createdon` int NOT NULL DEFAULT '0',
  `editedon` int NOT NULL DEFAULT '0',
  `disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Disables the snippet',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

#
# Dumping data for table `htbu_site_snippets`
#

INSERT INTO `htbu_site_snippets` VALUES
  ('1','DocLister','<strong>2.7.8</strong> Snippet to display the information of the tables by the description rules. The main goal - replacing Ditto and CatalogView','0','0','0','return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DocLister.php\';\n','0','','','1729156327','1729157244','0'),
  ('2','PageBuilder','<strong>1.3.16</strong> output content sections for current page','0','2','0','include_once MODX_BASE_PATH . \'assets/plugins/pagebuilder/pagebuilder.php\';\nreturn (new PageBuilder($modx))->render($params);\n\n','0','','','0','0','0'),
  ('3','DDocInfo','<strong>1</strong> DDocInfo','0','2','0','$id = isset($id) ? (int)$id : $modx->documentObject[\'id\'];\n$field = isset($field) ? (string)$field : \'id\';\nif($field == \'id\'){\n    $out = $id;\n}else{\n    if($modx->documentObject[\'id\'] == $id){\n        $out = isset($modx->documentObject[$field]) ? $modx->documentObject[$field] : \'\';\n        if(is_array($out)){\n           $out = isset($out[1]) ? $out[1] : \'\';\n        }\n    }else{\n        $out = $modx->doc->edit($id)->get($field);\n    }\n}\nreturn (string)$out;','0','','','0','0','0'),
  ('4','DLBeforeAfter','<strong>1</strong> Navigation between post and upcoming events relative to the current date.','0','2','0','return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DLBeforeAfter.php\';','0','','','0','0','0'),
  ('5','DLCrumbs','<strong>1.2</strong> DLCrumbs','0','3','0','return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DLCrumbs.php\';\n','0','','','0','0','0'),
  ('6','DLFirstChar','<strong>1</strong> Grouping documents by the first character','0','2','0','return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DLFirstChar.php\';','0','','','0','0','0'),
  ('7','DLGlossary','<strong>0.1</strong> Filtering documents by the first character','0','2','0','return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DLGlossary.php\';','0','','','0','0','0'),
  ('8','DLMenu','<strong>1.4.2</strong> Snippet to build menu with DocLister','0','3','0','return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DLMenu.php\';\n','0','','','0','0','0'),
  ('9','DLPrevNext','<strong>1.2</strong> DLPrevNext','0','2','0','return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DLPrevNext.php\';\n','0','','','0','0','0'),
  ('10','DLReflect','<strong>2</strong> Building a list of dates to filter documents','0','2','0','return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DLReflect.php\';','0','','','0','0','0'),
  ('11','DLReflectFilter','<strong>2</strong> Filtering documents by dates provided by DLReflect snippet','0','2','0','return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DLReflectFilter.php\';','0','','','0','0','0'),
  ('12','DLSitemap','<strong>1.0.2</strong> Snippet to build XML sitemap','0','2','0','return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DLSitemap.php\';\n','0','','','0','0','0'),
  ('13','DLTemplate','<strong>1</strong> DLTemplate','0','2','0','return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DLTemplate.php\';','0','','','0','0','0'),
  ('14','DLValuelist','<strong>1.1</strong> DLValuelist','0','2','0','return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DLValuelist.php\';','0','','','0','0','0'),
  ('15','summary','<strong>2.0.2</strong> Truncates the string to the specified length','0','2','0','return require MODX_BASE_PATH.\'assets/snippets/summary/snippet.summary.php\';','0','','','0','0','0'),
  ('16','FormLister','<strong>1.21.1</strong> Form processor','0','2','0','return require MODX_BASE_PATH.\'assets/snippets/FormLister/snippet.FormLister.php\';\n','0','','','0','0','0'),
  ('17','Cart','<strong>0.13.1</strong> Cart contents, DocLister based','0','4','0','if (defined(\'COMMERCE_INITIALIZED\')) {\n    $instance = isset($instance) ? $instance : \'products\';\n    $theme    = !empty($theme) ? $theme : \'\';\n    $cart     = ci()->carts->getCart($instance);\n\n    if (!is_null($cart)) {\n        return $modx->runSnippet(\'DocLister\', array_merge([\n            \'controller\'        => $modx->commerce->getSetting(\'cart_controller\'),\n            \'tpl\'               => \'@FILE:\' . $theme . \'cart_row\',\n            \'optionsTpl\'        => \'@FILE:\' . $theme . \'cart_row_options_row\',\n            \'ownerTPL\'          => \'@FILE:\' . $theme . \'cart_wrap\',\n            \'subtotalsRowTpl\'   => \'@FILE:\' . $theme . \'cart_subtotals_row\',\n            \'subtotalsTpl\'      => \'@FILE:\' . $theme . \'cart_subtotals\',\n            \'noneTPL\'           => \'@FILE:\' . $theme . \'cart_empty\',\n            \'langDir\'           => \'assets/plugins/commerce/lang/\',\n            \'customLang\'        => \'cart\',\n            \'noneWrapOuter\'     => 0,\n        ], $params, [\n            \'idType\'     => \'documents\',\n            \'documents\'  => array_column($cart->getItems(), \'id\'),\n            \'instance\'   => $instance,\n            \'hash\'       => ci()->commerce->storeParams($params),\n            \'cart\'       => $cart,\n            \'tree\'       => 0,\n        ]));\n    }\n}\n','0','','','0','0','0'),
  ('18','Comparison','<strong>0.13.1</strong> Comparison snippet, DocLister based','0','4','0','/**\n * [!Comparison\n *      &showCategories=`1`\n *      &tvCategory=`10`\n *      &excludeTV=`category`\n *      &includeTV=`best`\n *      &checkBoundingList=`0`\n *      &categoryItemClass=`btn-secondary`\n *      &categoryActiveClass=`btn-primary`\n * !]\n */\n\nif (!defined(\'COMMERCE_INITIALIZED\')) {\n    return;\n}\n\nif (isset($ids)) {\n    if (!is_array($ids)) {\n        $ids = array_map(\'trim\', explode(\',\', $ids));\n    }\n    $items = $ids;\n} else {\n    $items = array_map(function($item) {\n        return $item[\'id\'];\n    }, ci()->carts->getCart(\'comparison\')->getItems());\n}\n\n$showCategories = isset($params[\'showCategories\']) ? $params[\'showCategories\'] : 1;\n$categories = \'\';\n\nif (!empty($items) && $showCategories) {\n    $table   = $modx->getFullTablename(\'site_content\');\n    $parents = $modx->db->getColumn(\'parent\', $modx->db->select(\'parent\', $table, \"`id` IN (\" . implode(\',\', $items) . \")\"));\n    $parents = array_unique($parents);\n\n    $categoryParams = [];\n\n    foreach ($params as $key => $value) {\n        if (strpos($key, \'category\') === 0) {\n            unset($params[$key]);\n            $key = preg_replace(\'/^category/\', \'\', $key);\n            $key = lcfirst($key);\n            $categoryParams[$key] = $value;\n        }\n    }\n\n    if (isset($_GET[\'category\']) && is_scalar($_GET[\'category\']) && in_array($_GET[\'category\'], $parents)) {\n        $currentCategory = $_GET[\'category\'];\n    }\n\n    if (empty($currentCategory)) {\n        $currentCategory = reset($parents);\n    }\n\n    if (count($parents) > 1) {\n        $categoryParams = array_merge([\n            \'tpl\'               => \'@FILE:comparison_category\',\n            \'ownerTPL\'          => \'@FILE:comparison_categories\',\n            \'itemClass\'         => \'btn-secondary\',\n            \'activeClass\'       => \'btn-primary\',\n            \'prepare\'           => function($data, $modx, $DL, $eDL) {\n                $data[\'class\'] = $DL->getCFGDef(\'currentId\') == $data[\'id\'] ? $DL->getCFGDef(\'activeClass\') : $DL->getCFGDef(\'itemClass\');\n                return $data;\n            },\n        ], $categoryParams, [\n            \'controller\' => \'CustomLang\',\n            \'dir\'        => \'assets/plugins/commerce/src/Controllers/\',\n            \'currentId\'  => $currentCategory,\n            \'idType\'     => \'documents\',\n            \'documents\'  => $parents,\n            \'sortType\'   => \'doclist\',\n        ]);\n\n        $categories = $modx->runSnippet(\'DocLister\', $categoryParams);\n    }\n\n    $ids = $modx->db->getColumn(\'id\', $modx->db->select(\'id\', $table, \"`parent` = \'$currentCategory\' AND `id` IN (\'\" . implode(\"\',\'\", array_unique($items)) . \"\')\"));\n} else {\n    $ids = array_values(array_unique($items));\n    $currentCategory = 0;\n}\n\n$params = array_merge([\n    \'ownerTPL\'          => \'@FILE:comparison_table\',\n    \'headerTpl\'         => \'@FILE:comparison_table_header_cell\',\n    \'footerTpl\'         => \'@FILE:comparison_table_footer_cell\',\n    \'keyTpl\'            => \'@FILE:comparison_table_key_cell\',\n    \'valueTpl\'          => \'@FILE:comparison_table_value_cell\',\n    \'rowTpl\'            => \'@FILE:comparison_table_row\',\n    \'customLang\'        => \'common,cart\',\n], $params, [\n    \'controller\' => \'Comparison\',\n    \'dir\'        => \'assets/plugins/commerce/src/Controllers/\',\n    \'idType\'     => \'documents\',\n    \'sortType\'   => \'doclist\',\n    \'documents\'  => $ids,\n    \'category\'   => $currentCategory,\n    \'rows\'       => array_flip($items),\n]);\n\n$docs = $modx->runSnippet(\'DocLister\', $params);\nreturn $categories . $docs;\n','0','','','0','0','0'),
  ('19','CurrencySelect','<strong>0.13.1</strong> Shows currency select','0','4','0','if (defined(\'COMMERCE_INITIALIZED\')) {\n    $tpl = ci()->tpl;\n\n    $params = array_merge([\n        \'templatePath\'      => \'assets/plugins/commerce/templates/front/\',\n        \'templateExtension\' => \'tpl\',\n        \'tpl\'               => \'@FILE:currency_select_row\',\n        \'activeTpl\'         => \'@FILE:currency_select_active_row\',\n        \'outerTpl\'          => \'@FILE:currency_select_wrap\',\n    ], $params);\n\n    $currency = ci()->currency;\n    $rows     = $currency->getCurrencies();\n    $active   = $currency->getCurrencyCode();\n\n    $out = \'\';\n\n    $tpl->setTemplatePath($params[\'templatePath\']);\n    $tpl->setTemplateExtension($params[\'templateExtension\']);\n\n    foreach ($rows as $row) {\n        $chunk = $row[\'code\'] == $active ? $params[\'activeTpl\'] : $params[\'tpl\'];\n        $out  .= $tpl->parseChunk($chunk, $row);\n    }\n\n    return $tpl->parseChunk($params[\'outerTpl\'], [\'wrap\' => $out]);\n}\n','0','','','0','0','0'),
  ('20','Order','<strong>0.13.1</strong> Order form, FormLister based','0','4','0','if (defined(\'COMMERCE_INITIALIZED\')) {\n    $commerce    = ci()->commerce;\n    $userLang    = $commerce->getUserLanguage(\'order\');\n    $adminLang   = $commerce->getUserLanguage(\'order\', true);\n    $theme       = !empty($theme) ? $theme : \'\';\n    $storeParams = !empty($storeParams) ? $storeParams : 1;\n\n    $params = array_merge([\n        \'controller\'            => \'Order\',\n        \'dir\'                   => \'assets/plugins/commerce/src/Controllers/\',\n        \'formid\'                => \'order\',\n        \'parseDocumentSource\'   => 1,\n        \'langDir\'               => \'assets/plugins/commerce/lang/\',\n        \'lexicon\'               => \'common,delivery,payments,order\',\n        \'formTpl\'               => \'@FILE:\' . $theme . \'order_form\',\n        \'deliveryTpl\'           => \'@FILE:\' . $theme . \'order_form_delivery\',\n        \'deliveryRowTpl\'        => \'@FILE:\' . $theme . \'order_form_delivery_row\',\n        \'paymentsTpl\'           => \'@FILE:\' . $theme . \'order_form_payments\',\n        \'paymentsRowTpl\'        => \'@FILE:\' . $theme . \'order_form_payments_row\',\n        \'reportTpl\'             => $commerce->getUserLanguageTemplate(\'order_report\', true),\n        \'to\'                    => $commerce->getSetting(\'email\', $modx->getConfig(\'emailsender\')),\n        \'ccSender\'              => \'1\',\n        \'ccSenderField\'         => \'email\',\n        \'ccSenderTpl\'           => $commerce->getUserLanguageTemplate(\'order_reportback\'),\n        \'subjectTpl\'            => $adminLang[\'order.subject\'],\n        \'ccSubjectTpl\'          => $adminLang[\'order.subject\'],\n        \'successTpl\'            => $userLang[\'order.success\'],\n        \'rules\'                 => [\n            \'name\' => [\n                \'required\' => $userLang[\'order.error.name_required\'],\n            ],\n            \'email\' => [\n                \'required\' => $userLang[\'order.error.email_required\'],\n                \'email\'    => $userLang[\'order.error.email_incorrect\'],\n            ],\n            \'phone\' => [\n                \'required\' => $userLang[\'order.error.phone_required\'],\n            ],\n        ],\n    ], $params);\n\n    $params[\'form_hash\'] = $storeParams ? $commerce->storeParams($params) : \'\';\n\n    return $modx->runSnippet(\'FormLister\', $params);\n}\n','0','','','0','0','0'),
  ('21','PriceConvert','<strong>0.13.1</strong> Convert price using predefined settings','0','4','0','if (empty($modx->commerce) && !defined(\'COMMERCE_INITIALIZED\')) {\n    return $params[\'price\'];\n}\n\n$currency = ci()->currency;\nreturn $currency->convertFromDefault($params[\'price\'], !empty($params[\'currency\']) ? $params[\'currency\'] : null);\n','0','','','0','0','0'),
  ('22','PriceFormat','<strong>0.13.1</strong> Format price using predefined settings','0','4','0','if (defined(\'COMMERCE_INITIALIZED\')) {\n    $currency = ci()->currency;\n\n    $params = array_merge([\n        \'price\'   => 0,\n        \'convert\' => 1,\n    ], $params);\n\n    if ($params[\'convert\']) {\n        $params[\'price\'] = $currency->convertToActive($params[\'price\']);\n    }\n\n    return $currency->format($params[\'price\']);\n}\n\nreturn array_shift($params);\n','0','','','0','0','0'),
  ('23','Wishlist','<strong>0.13.1</strong> Wishlist contents, DocLister based','0','4','0','if (defined(\'COMMERCE_INITIALIZED\')) {\n    return $modx->runSnippet(\'Cart\', array_merge([\n        \'controller\'        => \'Wishlist\',\n        \'instance\'          => \'wishlist\',\n        \'tpl\'               => \'@FILE:wishlist_row\',\n        \'ownerTPL\'          => \'@FILE:wishlist_wrap\',\n        \'customLang\'        => \'common,cart\',\n    ], $params));\n}\n','0','','','0','0','0'),
  ('24','if','<strong>1.3</strong> A simple conditional snippet. Allows for eq/neq/lt/gt/etc logic within templates, resources, chunks, etc.','0','3','0','return require MODX_BASE_PATH.\'assets/snippets/if/snippet.if.php\';','0','','','0','0','0'),
  ('25','DocInfo','<strong>0.4.1</strong> Take any field from any document (fewer requests than GetField)','0','2','0','return require MODX_BASE_PATH.\'assets/snippets/docinfo/snippet.docinfo.php\';\n','0','','','0','0','0');


# --------------------------------------------------------

#
# Table structure for table `htbu_site_templates`
#

DROP TABLE IF EXISTS `htbu_site_templates`;
CREATE TABLE `htbu_site_templates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `templatename` varchar(100) NOT NULL DEFAULT '',
  `templatealias` varchar(100) NOT NULL DEFAULT '',
  `templatecontroller` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Template',
  `editor_type` int NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int NOT NULL DEFAULT '0' COMMENT 'category id',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT 'url to icon file',
  `template_type` int NOT NULL DEFAULT '0' COMMENT '0-page,1-content',
  `content` mediumtext,
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `selectable` tinyint(1) NOT NULL DEFAULT '1',
  `createdon` int NOT NULL DEFAULT '0',
  `editedon` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

#
# Dumping data for table `htbu_site_templates`
#

INSERT INTO `htbu_site_templates` VALUES
  ('1','Minimal Template','','','Default minimal empty template (content returned only)','0','0','','0','[*content*]','0','1','0','0'),
  ('5','Карточка товара','product','','Шаблон для товара','0','5','','0','Карточка товара','0','1','1729159025','1736585777'),
  ('6','Информационная страница','info1','','','0','5','','0','<!DOCTYPE html>\n<html lang=\"ru\">\n\n<head>\n  {{head}}\n</head>\n\n<body>\n  {{header}}\n<main>\n	<div class=\"category-page\">\n  {{pagetitle}}\n  <section class=\"seo-content\">\n			<h2>Контент для SEO-продвижения</h2>\n			<p>\n				Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptas, est harum tempora accusantium eos\n				tenetur obcaecati beatae quis veritatis nihil, quibusdam ullam sit ducimus praesentium tempore\n				voluptates? Natus, numquam corrupti.\n			</p>\n	  </section>\n		</div>\n</main>\n\n\n\n  {{footer}}\n</body>\n\n</html>\n','0','1','1729588351','1737553691'),
  ('8','404','404','','','0','5','','0','','0','1','1729588721','1729588721'),
  ('10','Главная страница','main_page1','','','0','5','','0','<!DOCTYPE html>\n<html lang=\"ru\">\n\n<head>\n  {{head}}\n</head>\n\n<body>\n  {{header}}\n<main>\n <div class=\"main_container\">\n <section class=\"banner\">\n  <picture class=\"banner-image\">\n    <source srcset=\"[*home_banner_mobile*]\" media=\"(max-width: 768px)\">    \n    <img src=\"[*home_banner_desktop*]\" alt=\"home_banner<br>1400×250 | 900×300\">\n  </picture>\n</section>\n\n<section class=\"categories-section\">\n  <div class=\"categories\">\n    <div class=\"category-item\">\n      <div class=\"category-image\">\n        <span>category_image 120x120</span>\n      </div>\n      <p>Смартфоны</p>\n    </div>\n    <div class=\"category-item\">\n      <div class=\"category-image\">\n        <span>category_image 120x120</span>\n      </div>\n      <p>Планшеты</p>\n    </div>\n    <div class=\"category-item\">\n      <div class=\"category-image\">\n        <span>category_image 120x120</span>\n      </div>\n      <p>Ноутбуки</p>\n    </div>\n    <div class=\"category-item\">\n      <div class=\"category-image\">\n        <span>category_image 120x120</span>\n      </div>\n      <p>Наушники и аудиотехника</p>\n    </div>\n    <div class=\"category-item\">\n      <div class=\"category-image\">\n        <span>category_image 120x120</span>\n      </div>\n      <p>Телевизоры и видеотехника</p>\n    </div>\n    <div class=\"category-item\">\n      <div class=\"category-image\">\n        <span>category_image 120x120</span>\n      </div>\n      <p>Бытовая техника</p>\n    </div>\n  </div>\n</section>\n\n\n<div class=\"feedback_container\">\n  <section class=\"description\">\n	<h1>[*og_title*]</h1>\n    <!-- <h2>Qmedia Market – Интернет-магазин полезных вещей</h2> -->\n	<p>[*og_description*]</p>\n<!-- <p>      Qmedia Market — магазин полезных вещей для себя, дома, офиса и дачи. Здесь вы найдете товары под свои предпочтения: от аудиотехники и одежды до строительных материалов и велосипедов. Работаем с проверенными производителями с 2007 года. Доставляем товары точно в срок.\n    </p>\n    <p>\n      Покупка товара просто только на первый взгляд. Нужно думать о том, как оформить доставку, кто соберет шкаф или установит кондиционер. В нашем магазине эти услуги уже продуманы. Думайте только о подборе товаров в каталоге. Для этого предлагаем комплексный подход — наша команда выполнит все задачи!\n    </p> -->\n  </section>\n\n  <section class=\"contact-form\">\n  <form>\n    <div class=\"form-group\">\n      <label for=\"name\">Имя *</label>\n      <input type=\"text\" id=\"name\" name=\"name\" placeholder=\"Екатерина\" required>\n    </div>\n\n    <div class=\"form-group\">\n      <label for=\"phone\">Телефон *</label>\n      <input type=\"tel\" id=\"phone\" name=\"phone\" placeholder=\"+375 ___ __-__-__\" required>\n    </div>\n\n    <div class=\"form-group\">\n      <label for=\"email\">Email</label>\n      <input type=\"email\" id=\"email\" name=\"email\" placeholder=\"katya@mail.by\">\n    </div>\n\n    <button type=\"submit\">Отправить</button>\n  </form>\n</section>\n\n</div>\n</div>\n</main>\n\n\n  {{footer}}\n</body>\n\n</html>\n','0','1','1736973577','1737627091'),
  ('11','Категория каталогаа','catalog_category','','','0','5','','0','<!DOCTYPE html>\n<html lang=\"ru\">\n\n<head>\n  {{head}}\n</head>\n\n<body>\n  {{header}}\n<main>\n  <div class=\"category-page\">\n	{{pagetitle}}\n  <div class=\"category-container\">\n    <aside class=\"category-sidebar\">\n      <button class=\"back-button\">Каталог</button>\n      <ul class=\"category-list\">\n        <li><a href=\"#\">Смартфоны</a></li>\n        <li><a href=\"#\">Планшеты</a></li>\n        <li><a href=\"#\">Ноутбуки</a></li>\n        <li><a href=\"#\">Наушники и аудиотехника</a></li>\n        <li><a href=\"#\">Телевизоры и видеотехника</a></li>\n        <li><a href=\"#\">Бытовая техника</a></li>\n      </ul>\n    </aside>\n    <section class=\"category-products\">\n      <div class=\"products-grid\">\n        <div class=\"product-card\">\n          <div class=\"product-image\" style=\"background-image: url(\'[*product_image*]\');\">\n			  product_image<br>400×400\n			</div>\n          <p class=\"product-price\">[*product_price*] р.</p>\n          <p class=\"product-name\">[*product-name*]</p>\n        </div>\n        <div class=\"product-card\">\n          <div class=\"product-image\">product_image<br>400×400</div>\n          <p class=\"product-price\">758,01 р.</p>\n          <p class=\"product-name\">Смартфон Xiaomi Redmi Note 10S 6/128 ГБ, синий</p>\n        </div>\n        <div class=\"product-card\">\n          <div class=\"product-image\">product_image<br>400×400</div>\n          <p class=\"product-price\">758,01 р.</p>\n          <p class=\"product-name\">Смартфон Xiaomi Redmi 9A 2/32 ГБ, голубой</p>\n        </div>\n        <div class=\"product-card\">\n          <div class=\"product-image\">product_image<br>400×400</div>\n          <p class=\"product-price\">758,01 р.</p>\n          <p class=\"product-name\">Смартфон Xiaomi Redmi Note 10 4/64 ГБ, серый</p>\n        </div>\n        <div class=\"product-card\">\n          <div class=\"product-image\">product_image<br>400×400</div>\n          <p class=\"product-price\">758,01 р.</p>\n          <p class=\"product-name\">Смартфон Apple iPhone 13 512 ГБ, (PRODUCT) Red</p>\n        </div>\n      </div>\n      <div class=\"pagination\">\n        <button>1</button>\n        <button>2</button>\n        <button>3</button>\n        <button>4</button>\n        <span>...</span>\n        <button>12</button>\n        <button>13</button>\n      </div>\n		<section class=\"seo-content\">\n			<h1>[*og_title*]</h1>\n			<p>\n				[*og_description*]\n			</p>\n	  </section>\n    </section>\n  </div>\n  \n		</div>\n</main>\n\n\n\n  {{footer}}\n</body>\n\n</html>\n','0','1','1737399332','1737624563');


# --------------------------------------------------------

#
# Table structure for table `htbu_site_tmplvar_access`
#

DROP TABLE IF EXISTS `htbu_site_tmplvar_access`;
CREATE TABLE `htbu_site_tmplvar_access` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tmplvarid` int NOT NULL DEFAULT '0',
  `documentgroup` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# --------------------------------------------------------

#
# Table structure for table `htbu_site_tmplvar_contentvalues`
#

DROP TABLE IF EXISTS `htbu_site_tmplvar_contentvalues`;
CREATE TABLE `htbu_site_tmplvar_contentvalues` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tmplvarid` int NOT NULL DEFAULT '0' COMMENT 'Template Variable id',
  `contentid` int NOT NULL DEFAULT '0' COMMENT 'Site Content Id',
  `value` mediumtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_tvid_contentid` (`tmplvarid`,`contentid`),
  KEY `idx_tmplvarid` (`tmplvarid`),
  KEY `idx_id` (`contentid`),
  FULLTEXT KEY `content_ft_idx` (`value`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

#
# Dumping data for table `htbu_site_tmplvar_contentvalues`
#

INSERT INTO `htbu_site_tmplvar_contentvalues` VALUES
  ('1','3','1','assets/images/noimage.jpg'),
  ('3','2','1','Добро пожаловать на Qmedia Market'),
  ('4','4','1','assets/images/noimage.jpg'),
  ('5','8','1','Qmedia Market – Интернет-магазин полезных вещей'),
  ('6','9','1','<p>      Qmedia Market — магазин полезных вещей для себя, дома, офиса и дачи. Здесь вы найдете товары под свои предпочтения: от аудиотехники и одежды до строительных материалов и велосипедов. Работаем с проверенными производителями с 2007 года. Доставляем товары точно в срок.\n    </p>\n    <p>\n      Покупка товара просто только на первый взгляд. Нужно думать о том, как оформить доставку, кто соберет шкаф или установит кондиционер. В нашем магазине эти услуги уже продуманы. Думайте только о подборе товаров в каталоге. Для этого предлагаем комплексный подход — наша команда выполнит все задачи!\n    </p> '),
  ('7','10','1','assets/images/noimage.jpg'),
  ('8','2','14','Смартфоны'),
  ('9','5','14','assets/images/noimage.jpg'),
  ('10','6','14','assets/images/noimage.jpg'),
  ('11','7','14','758,01'),
  ('12','8','14','Контент для SEO-продвижения'),
  ('13','9','14','Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptas, est harum tempora accusantium eos tenetur obcaecati beatae quis veritatis nihil, quibusdam ullam sit ducimus praesentium tempore voluptates? Natus, numquam corrupti.'),
  ('14','10','14','assets/images/noimage.jpg'),
  ('15','11','14','Смартфон Poco POCO M5 4/64 ГБ, желтый');


# --------------------------------------------------------

#
# Table structure for table `htbu_site_tmplvar_templates`
#

DROP TABLE IF EXISTS `htbu_site_tmplvar_templates`;
CREATE TABLE `htbu_site_tmplvar_templates` (
  `tmplvarid` int NOT NULL DEFAULT '0' COMMENT 'Template Variable id',
  `templateid` int NOT NULL DEFAULT '0',
  `rank` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`tmplvarid`,`templateid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

#
# Dumping data for table `htbu_site_tmplvar_templates`
#

INSERT INTO `htbu_site_tmplvar_templates` VALUES
  ('1','1','0'),
  ('1','5','0'),
  ('1','6','0'),
  ('1','8','0'),
  ('1','10','0'),
  ('1','11','0'),
  ('2','1','0'),
  ('2','5','0'),
  ('2','6','0'),
  ('2','8','0'),
  ('2','10','0'),
  ('2','11','0'),
  ('3','10','0'),
  ('4','10','0'),
  ('5','11','0'),
  ('6','5','0'),
  ('6','11','0'),
  ('7','5','0'),
  ('7','11','0'),
  ('8','1','0'),
  ('8','5','0'),
  ('8','6','0'),
  ('8','8','0'),
  ('8','10','0'),
  ('8','11','0'),
  ('9','1','0'),
  ('9','5','0'),
  ('9','6','0'),
  ('9','8','0'),
  ('9','10','0'),
  ('9','11','0'),
  ('10','1','0'),
  ('10','5','0'),
  ('10','6','0'),
  ('10','8','0'),
  ('10','10','0'),
  ('10','11','0'),
  ('11','5','0'),
  ('11','11','0');


# --------------------------------------------------------

#
# Table structure for table `htbu_site_tmplvars`
#

DROP TABLE IF EXISTS `htbu_site_tmplvars`;
CREATE TABLE `htbu_site_tmplvars` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `caption` varchar(80) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `editor_type` int NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int NOT NULL DEFAULT '0' COMMENT 'category id',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `elements` text,
  `rank` int NOT NULL DEFAULT '0',
  `display` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT 'Display Control',
  `display_params` text COMMENT 'Display Control Properties',
  `default_text` text,
  `createdon` int NOT NULL DEFAULT '0',
  `editedon` int NOT NULL DEFAULT '0',
  `properties` text,
  PRIMARY KEY (`id`),
  KEY `indx_rank` (`rank`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

#
# Dumping data for table `htbu_site_tmplvars`
#

INSERT INTO `htbu_site_tmplvars` VALUES
  ('1','text','meta_title','Meta title','','0','0','0','','0','','','[*pagetitle*] - [(site_name)]','1736588748','1737579302','[]'),
  ('2','text','meta_h1','meta_h1','H1 для SEO','0','0','0','','0','','','','1737571577','1737571577','[]'),
  ('3','image','home_banner_desktop','home_banner_desktop','Баннер для десктопов (image)','0','0','0','','0','','','','1737571949','1737571949','[]'),
  ('4','image','home_banner_mobile','home_banner_mobile','Баннер для мобильных','0','0','0','','0','','','','1737577675','1737577675','[]'),
  ('5','image','category_image','category_image','Изображение категории','0','0','0','','0','','','','1737577737','1737577737','[]'),
  ('6','image','product_image','product_image','Изображение товара','0','0','0','','0','','','','1737577797','1737577797','[]'),
  ('7','text','product_price','product_price','Цена','0','0','0','','0','','','','1737577825','1737577825','[]'),
  ('8','text','og_title','og_title','Заголовок для Open Graph','0','0','0','','0','','','','1737577928','1737577928','[]'),
  ('9','textarea','og_description','og_description','Описание для Open Graph','0','0','0','','0','','','','1737577952','1737578000','[]'),
  ('10','image','og_image','og_image','Изображение для Open Graph','0','0','0','','0','','','','1737577984','1737577984','[]'),
  ('11','text','product-name','product-name','','0','0','0','','0','','','','1737624440','1737624440','[]');


# --------------------------------------------------------

#
# Table structure for table `htbu_system_eventnames`
#

DROP TABLE IF EXISTS `htbu_system_eventnames`;
CREATE TABLE `htbu_system_eventnames` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `service` int NOT NULL DEFAULT '0' COMMENT 'System Service number',
  `groupname` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `system_eventnames_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

#
# Dumping data for table `htbu_system_eventnames`
#

INSERT INTO `htbu_system_eventnames` VALUES
  ('1','OnAfterLoadDocumentObject','5',''),
  ('2','OnAfterMoveDocument','1','Documents'),
  ('3','OnBeforeCacheUpdate','4',''),
  ('4','OnBeforeChunkFormDelete','1','Chunks'),
  ('5','OnBeforeChunkFormSave','1','Chunks'),
  ('6','OnBeforeDocDuplicate','1','Documents'),
  ('7','OnBeforeDocFormDelete','1','Documents'),
  ('8','OnBeforeDocFormSave','1','Documents'),
  ('9','OnBeforeEmptyTrash','1','Documents'),
  ('10','OnBeforeFileBrowserCopy','1','File Browser Events'),
  ('11','OnBeforeFileBrowserDelete','1','File Browser Events'),
  ('12','OnBeforeFileBrowserMove','1','File Browser Events'),
  ('13','OnBeforeFileBrowserRename','1','File Browser Events'),
  ('14','OnBeforeFileBrowserUpload','1','File Browser Events'),
  ('15','OnBeforeLoadDocumentObject','5',''),
  ('16','OnBeforeLoadExtension','5',''),
  ('17','OnBeforeManagerPageInit','2',''),
  ('18','OnBeforeMinifyCss','1',''),
  ('19','OnBeforeModFormDelete','1','Modules'),
  ('20','OnBeforeModFormSave','1','Modules'),
  ('21','OnBeforeMoveDocument','1','Documents'),
  ('22','OnBeforeParseParams','5',''),
  ('23','OnBeforePluginFormDelete','1','Plugins'),
  ('24','OnBeforePluginFormSave','1','Plugins'),
  ('25','OnBeforeSaveWebPageCache','4',''),
  ('26','OnBeforeSnipFormDelete','1','Snippets'),
  ('27','OnBeforeSnipFormSave','1','Snippets'),
  ('28','OnBeforeTempFormDelete','1','Templates'),
  ('29','OnBeforeTempFormSave','1','Templates'),
  ('30','OnBeforeTVFormDelete','1','Template Variables'),
  ('31','OnBeforeTVFormSave','1','Template Variables'),
  ('32','OnBeforeUserDelete','1','Users'),
  ('33','OnBeforeUserLogin','1','Users'),
  ('34','OnBeforeUserLogout','1','Users'),
  ('35','OnBeforeUserSave','1','Users'),
  ('36','OnCacheUpdate','4',''),
  ('37','OnChunkFormDelete','1','Chunks'),
  ('38','OnChunkFormPrerender','1','Chunks'),
  ('39','OnChunkFormRender','1','Chunks'),
  ('40','OnChunkFormSave','1','Chunks'),
  ('41','OnCreateDocGroup','1','Documents'),
  ('42','OnDocDuplicate','1','Documents'),
  ('43','OnDocFormDelete','1','Documents'),
  ('44','OnDocFormPrerender','1','Documents'),
  ('45','OnDocFormRender','1','Documents'),
  ('46','OnDocFormSave','1','Documents'),
  ('47','OnDocFormTemplateRender','1','Documents'),
  ('48','OnDocFormUnDelete','1','Documents'),
  ('49','OnDocPublished','5',''),
  ('50','OnDocUnPublished','5',''),
  ('51','OnEmptyTrash','1','Documents'),
  ('52','OnFileBrowserCopy','1','File Browser Events'),
  ('53','OnFileBrowserDelete','1','File Browser Events'),
  ('54','OnFileBrowserInit','1','File Browser Events'),
  ('55','OnFileBrowserMove','1','File Browser Events'),
  ('56','OnFileBrowserRename','1','File Browser Events'),
  ('57','OnFileBrowserUpload','1','File Browser Events'),
  ('58','OnFileManagerSettingsRender','1','System Settings'),
  ('59','OnFileManagerUpload','1',''),
  ('60','OnFriendlyURLSettingsRender','1','System Settings'),
  ('61','OnInterfaceSettingsRender','1','System Settings'),
  ('62','OnLoadDocumentObject','5',''),
  ('63','OnLoadSettings','1','System Settings'),
  ('64','OnLoadWebDocument','5',''),
  ('65','OnLoadWebPageCache','4',''),
  ('66','OnLogEvent','1','Log Event'),
  ('67','OnLogPageHit','5',''),
  ('68','OnMakeDocUrl','5',''),
  ('69','OnMakePageCacheKey','4',''),
  ('70','OnManagerFrameLoader','2',''),
  ('71','OnManagerLoginFormPrerender','2',''),
  ('72','OnManagerLoginFormRender','2',''),
  ('73','OnManagerMainFrameHeaderHTMLBlock','2',''),
  ('74','OnManagerMenuPrerender','2',''),
  ('75','OnManagerNodePrerender','2',''),
  ('76','OnManagerNodeRender','2',''),
  ('77','OnManagerPageInit','2',''),
  ('78','OnManagerPreFrameLoader','2',''),
  ('79','OnManagerTopPrerender','2',''),
  ('80','OnManagerTreeInit','2',''),
  ('81','OnManagerTreePrerender','2',''),
  ('82','OnManagerTreeRender','2',''),
  ('83','OnManagerWelcomeHome','2',''),
  ('84','OnManagerWelcomePrerender','2',''),
  ('85','OnManagerWelcomeRender','2',''),
  ('86','OnMiscSettingsRender','1','System Settings'),
  ('87','OnModFormDelete','1','Modules'),
  ('88','OnModFormPrerender','1','Modules'),
  ('89','OnModFormRender','1','Modules'),
  ('90','OnModFormSave','1','Modules'),
  ('91','OnPageNotFound','1',''),
  ('92','OnPageUnauthorized','1',''),
  ('93','OnParseDocument','5',''),
  ('94','OnParseProperties','5',''),
  ('95','OnPluginFormDelete','1','Plugins'),
  ('96','OnPluginFormPrerender','1','Plugins'),
  ('97','OnPluginFormRender','1','Plugins'),
  ('98','OnPluginFormSave','1','Plugins'),
  ('99','OnRichTextEditorInit','1','RichText Editor'),
  ('100','OnRichTextEditorRegister','1','RichText Editor'),
  ('101','OnSecuritySettingsRender','1','System Settings'),
  ('102','OnSiteRefresh','1',''),
  ('103','OnSiteSettingsRender','1','System Settings'),
  ('104','OnSnipFormDelete','1','Snippets'),
  ('105','OnSnipFormPrerender','1','Snippets'),
  ('106','OnSnipFormRender','1','Snippets'),
  ('107','OnSnipFormSave','1','Snippets'),
  ('108','OnStripAlias','1','Documents'),
  ('109','OnTempFormDelete','1','Templates'),
  ('110','OnTempFormPrerender','1','Templates'),
  ('111','OnTempFormRender','1','Templates'),
  ('112','OnTempFormSave','1','Templates'),
  ('113','OnTVFormDelete','1','Template Variables'),
  ('114','OnTVFormPrerender','1','Template Variables'),
  ('115','OnTVFormRender','1','Template Variables'),
  ('116','OnTVFormSave','1','Template Variables'),
  ('117','OnUserAuthentication','1','Users'),
  ('118','OnUserChangePassword','1','Users'),
  ('119','OnUserCreateGroup','1','Users'),
  ('120','OnUserDelete','1','Users'),
  ('121','OnUserFormPrerender','1','Users'),
  ('122','OnUserFormRender','1','Users'),
  ('123','OnUserLogin','1','Users'),
  ('124','OnUserLogout','1','Users'),
  ('125','OnUserSave','1','Users'),
  ('126','OnUserSettingsRender','1','System Settings'),
  ('127','OnWebPageComplete','5',''),
  ('128','OnWebPageInit','5',''),
  ('129','OnWebPagePrerender','5',''),
  ('130','OnBeforeMailSend','1',''),
  ('131','OnPBContainerRender','6','PageBuilder'),
  ('132','OnPBFieldRender','6','PageBuilder'),
  ('133','OnBeforeClientSettingsSave','6','ClientSettings'),
  ('134','OnClientSettingsSave','6','ClientSettings'),
  ('135','OnInitializeCommerce','6','Commerce'),
  ('136','OnCommerceInitialized','6','Commerce'),
  ('137','OnInitializeOrderProcessor','6','Commerce'),
  ('138','OnInitializeOrderForm','6','Commerce'),
  ('139','OnCollectSubtotals','6','Commerce'),
  ('140','OnRegisterDelivery','6','Commerce'),
  ('141','OnRegisterPayments','6','Commerce'),
  ('142','OnBeforeOrderAddonsRender','6','Commerce'),
  ('143','OnBeforeCartItemAdding','6','Commerce'),
  ('144','OnBeforeCartItemUpdating','6','Commerce'),
  ('145','OnBeforeCartItemRemoving','6','Commerce'),
  ('146','OnBeforeCartCleaning','6','Commerce'),
  ('147','OnCartChanged','6','Commerce'),
  ('148','OnOrderRawDataChanged','6','Commerce'),
  ('149','OnBeforeOrderProcessing','6','Commerce'),
  ('150','OnBeforePaymentProcess','6','Commerce'),
  ('151','OnBeforePaymentCreate','6','Commerce'),
  ('152','OnBeforeOrderSaving','6','Commerce'),
  ('153','OnBeforeOrderDeleting','6','Commerce'),
  ('154','OnBeforeOrderSending','6','Commerce'),
  ('155','OnOrderSaved','6','Commerce'),
  ('156','OnOrderDeleted','6','Commerce'),
  ('157','OnOrderPaid','6','Commerce'),
  ('158','OnOrderProcessed','6','Commerce'),
  ('159','OnBeforeOrderHistoryUpdate','6','Commerce'),
  ('160','OnBeforeCustomerNotifySending','6','Commerce'),
  ('161','OnManagerBeforeOrdersListRender','6','Commerce'),
  ('162','OnManagerOrdersListRender','6','Commerce'),
  ('163','OnManagerBeforeOrderRender','6','Commerce'),
  ('164','OnManagerOrderRender','6','Commerce'),
  ('165','OnManagerBeforeOrderEditRender','6','Commerce'),
  ('166','OnManagerOrderEditRender','6','Commerce'),
  ('167','OnManagerBeforeOrderValidating','6','Commerce'),
  ('168','OnManagerOrderValidated','6','Commerce'),
  ('169','OnManagerStatusesListRender','6','Commerce'),
  ('170','OnManagerStatusRender','6','Commerce'),
  ('171','OnManagerCurrencyListRender','6','Commerce'),
  ('172','OnManagerCurrencyRender','6','Commerce'),
  ('173','OnManagerBeforeDefaultCurrencyChange','6','Commerce'),
  ('174','OnManagerRegisterCommerceController','6','Commerce'),
  ('175','OnBeforeCurrencyChange','6','Commerce'),
  ('176','OnCommerceAjaxResponse','6','Commerce'),
  ('177','OnOrderPlaceholdersPopulated','6','Commerce');


# --------------------------------------------------------

#
# Table structure for table `htbu_system_settings`
#

DROP TABLE IF EXISTS `htbu_system_settings`;
CREATE TABLE `htbu_system_settings` (
  `setting_name` varchar(50) NOT NULL DEFAULT '',
  `setting_value` text,
  PRIMARY KEY (`setting_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

#
# Dumping data for table `htbu_system_settings`
#

INSERT INTO `htbu_system_settings` VALUES
  ('_token','pGy08KL7ce0R3rpXYIJAlnDNo77lU7yjCZ2cf3Xh'),
  ('a','30'),
  ('alias_listing','1'),
  ('allow_duplicate_alias','0'),
  ('allow_eval','with_scan'),
  ('allow_multiple_emails','0'),
  ('auto_menuindex','1'),
  ('auto_template_logic','sibling'),
  ('automatic_alias','1'),
  ('blocked_minutes','60'),
  ('cache_default','1'),
  ('cache_type','2'),
  ('captcha_words','EVO,Access,Better,BitCode,Chunk,Cache,Desc,Design,Excell,Enjoy,URLs,TechView,Gerald,Griff,Humphrey,Holiday,Intel,Integration,Joystick,Join(),Oscope,Genetic,Light,Likeness,Marit,Maaike,Niche,Netherlands,Ordinance,Oscillo,Parser,Phusion,Query,Question,Regalia,Righteous,Snippet,Sentinel,Template,Thespian,Unity,Enterprise,Verily,Tattoo,Veri,Website,WideWeb,Yap,Yellow,Zebra,Zygote'),
  ('captcha_words_default','EVO,Access,Better,BitCode,Chunk,Cache,Desc,Design,Excell,Enjoy,URLs,TechView,Gerald,Griff,Humphrey,Holiday,Intel,Integration,Joystick,Join(),Oscope,Genetic,Light,Likeness,Marit,Maaike,Niche,Netherlands,Ordinance,Oscillo,Parser,Phusion,Query,Question,Regalia,Righteous,Snippet,Sentinel,Template,Thespian,Unity,Enterprise,Verily,Tattoo,Veri,Website,WideWeb,Yap,Yellow,Zebra,Zygote'),
  ('check_files_onlogin','index.php\n.htaccess\nmanager/index.php\n/core/config/database/connections/default.php'),
  ('chunk_processor','DLTemplate'),
  ('clean_uploaded_filename','1'),
  ('clientResize','0'),
  ('ControllerNamespace',''),
  ('custom_contenttype','application/rss+xml,application/pdf,application/vnd.ms-word,application/vnd.ms-excel,text/html,text/css,text/xml,text/javascript,text/plain,application/json'),
  ('datepicker_offset','-10'),
  ('datetime_format','dd-mm-YYYY'),
  ('default_template','1'),
  ('denyExtensionRename','0'),
  ('denyZipDownload','0'),
  ('disable_chunk_cache','0'),
  ('disable_plugins_cache','0'),
  ('disable_snippet_cache','0'),
  ('editor_css_path',''),
  ('editor_css_selectors',''),
  ('email_method','mail'),
  ('email_sender_method','1'),
  ('emailsender','admin@mail.ru'),
  ('emailsubject','Данные для авторизации'),
  ('emailsubject_default','Данные для авторизации'),
  ('enable_bindings','1'),
  ('enable_cache','2'),
  ('error_page','1'),
  ('error_reporting','1'),
  ('failed_login_attempts','3'),
  ('fck_editor_autolang','0'),
  ('fck_editor_toolbar','standard'),
  ('fe_editor_lang','ru'),
  ('filemanager_path','C:/OSPanel/home/evolution/'),
  ('friendly_alias_urls','1'),
  ('friendly_url_prefix',''),
  ('friendly_url_suffix',''),
  ('friendly_urls','1'),
  ('global_tabs','1'),
  ('group_tvs','0'),
  ('jpegQuality','90'),
  ('lang_code','ru'),
  ('login_bg',''),
  ('login_form_position','left'),
  ('login_form_style','dark'),
  ('login_logo',''),
  ('make_folders','0'),
  ('manager_direction','ltr'),
  ('manager_language','ru'),
  ('manager_layout','4'),
  ('manager_menu_position','top'),
  ('manager_theme','default'),
  ('manager_theme_mode','3'),
  ('maxImageHeight','2200'),
  ('maxImageWidth','2600'),
  ('minifyphp_incache','0'),
  ('modx_charset','UTF-8'),
  ('new_file_permissions','0644'),
  ('new_folder_permissions','0755'),
  ('noThumbnailsRecreation','0'),
  ('number_of_logs','100'),
  ('number_of_results','30'),
  ('old_template','1'),
  ('publish_default','1'),
  ('rb_base_dir','C:/OSPanel/home/evolution/assets/'),
  ('rb_base_url','assets/'),
  ('rb_webuser','0'),
  ('reload_captcha_words',''),
  ('reload_emailsubject',''),
  ('reload_site_unavailable',''),
  ('reload_system_email_webreminder_message',''),
  ('reload_websignupemail_message',''),
  ('remember_last_tab','1'),
  ('resource_tree_node_name','pagetitle'),
  ('rss_url_news','https://github.com/evocms-community/evolution/releases.atom'),
  ('rss_url_security','https://github.com/extras-evolution/security-fix/releases.atom'),
  ('safe_functions_at_eval','time,date,strtotime,strftime'),
  ('search_default','1'),
  ('send_errormail','0'),
  ('seostrict','1'),
  ('server_offset_time','0'),
  ('server_protocol','http'),
  ('session_timeout','15'),
  ('session.cookie.lifetime','604800'),
  ('settings_version','3.1.29'),
  ('show_fullscreen_btn','0'),
  ('show_newresource_btn','0'),
  ('show_picker','0'),
  ('showHiddenFiles','0'),
  ('site_id','6710252744043'),
  ('site_name','My Test Site'),
  ('site_start','1'),
  ('site_status','1'),
  ('site_unavailable_message','В настоящее время сайт недоступен.'),
  ('site_unavailable_page',''),
  ('siteunavailable_message_default','ru'),
  ('smtp_auth','0'),
  ('smtp_autotls','0'),
  ('smtp_host','smtp.example.com'),
  ('smtp_port','25'),
  ('smtp_secure','none'),
  ('smtp_username','emailsender'),
  ('strip_image_paths','1'),
  ('sys_files_checksum','a:4:{s:35:\"C:/OSPanel/home/evolution/index.php\";s:32:\"599511a98673763d066ea76b9e50fbb0\";s:35:\"C:/OSPanel/home/evolution/.htaccess\";s:32:\"4d525766cb6232034562a1732ec06a9c\";s:43:\"C:/OSPanel/home/evolution/manager/index.php\";s:32:\"19c60de055d5efeb3fdd9debde124cb7\";s:71:\"C:/OSPanel/home/evolution//core/config/database/connections/default.php\";s:32:\"091ae1ee1a37b29a344fa2232246facb\";}'),
  ('system_email_webreminder_default','Здравствуйте, [+uid+]!\n\nЧтобы активировать ваш новый пароль, перейдите по следующей ссылке:\n\n[+surl+]\n\nПозже вы сможете использовать следующий пароль для авторизации: [+pwd+]\n\nЕсли это письмо пришло к вам по ошибке, пожалуйста, проигнорируйте его.\n\nС уважением, Администрация'),
  ('system_email_websignup_default','Здравствуйте, [+uid+]!\n\nВаши данные для авторизации на [+sname+]:\n\nИмя пользователя: [+uid+]\nПароль: [+pwd+]\n\nПосле успешной авторизации на [+sname+] ([+surl+]), вы сможете изменить свой пароль.\n\nС уважением, Администрация'),
  ('theme_refresher',''),
  ('thumbHeight','150'),
  ('thumbsDir','.thumbs'),
  ('thumbWidth','150'),
  ('tinymce4_blockFormats','Paragraph=p;Header 1=h1;Header 2=h2;Header 3=h3'),
  ('tinymce4_custom_buttons1','undo redo | cut copy paste | searchreplace | bold italic underline strikethrough | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent blockquote | styleselect'),
  ('tinymce4_custom_buttons2','link unlink anchor image media codesample table | hr removeformat | subscript superscript charmap | nonbreaking | visualchars visualblocks print preview fullscreen code formatselect'),
  ('tinymce4_custom_buttons3',''),
  ('tinymce4_custom_buttons4',''),
  ('tinymce4_custom_plugins','advlist autolink lists link image charmap print preview hr anchor pagebreak searchreplace wordcount visualblocks visualchars code fullscreen spellchecker insertdatetime media nonbreaking save table contextmenu directionality emoticons template paste textcolor codesample colorpicker textpattern imagetools paste modxlink youtube'),
  ('tinymce4_element_format','xhtml'),
  ('tinymce4_entermode','p'),
  ('tinymce4_schema','html5'),
  ('tinymce4_skin','lightgray'),
  ('tinymce4_skintheme','inlite'),
  ('tinymce4_template_chunks',''),
  ('tinymce4_template_docs',''),
  ('tinymce4_theme','custom'),
  ('track_visitors','0'),
  ('tree_page_click','27'),
  ('tree_show_protected','0'),
  ('udperms_allowroot','0'),
  ('unauthorized_page','1'),
  ('UpgradeRepository',''),
  ('upload_files','bmp,ico,gif,jpeg,jpg,png,psd,tif,tiff,fla,flv,swf,aac,au,avi,css,cache,doc,docx,gz,gzip,htaccess,htm,html,js,mp3,mp4,mpeg,mpg,ods,odp,odt,pdf,ppt,pptx,rar,tar,tgz,txt,wav,wmv,xls,xlsx,xml,z,zip,JPG,JPEG,PNG,GIF,svg,webp,tpl'),
  ('upload_images','bmp,ico,gif,jpeg,jpg,png,psd,tif,tiff,svg,webp'),
  ('upload_maxsize','10485760'),
  ('upload_media','au,avi,mp3,mp4,mpeg,mpg,wav,wmv'),
  ('use_alias_path','1'),
  ('use_breadcrumbs','0'),
  ('use_browser','1'),
  ('use_captcha','0'),
  ('use_editor','1'),
  ('use_udperms','1'),
  ('validate_referer','1'),
  ('warning_visibility','0'),
  ('webpwdreminder_message','Здравствуйте, [+uid+]!\n\nЧтобы активировать ваш новый пароль, перейдите по следующей ссылке:\n\n[+surl+]\n\nПозже вы сможете использовать следующий пароль для авторизации: [+pwd+]\n\nЕсли это письмо пришло к вам по ошибке, пожалуйста, проигнорируйте его.\n\nС уважением, Администрация'),
  ('websignupemail_message','Здравствуйте, [+uid+]!\n\nВаши данные для авторизации на [+sname+]:\n\nИмя пользователя: [+uid+]\nПароль: [+pwd+]\n\nПосле успешной авторизации на [+sname+] ([+surl+]), вы сможете изменить свой пароль.\n\nС уважением, Администрация'),
  ('which_browser','mcpuk'),
  ('which_editor','TinyMCE4'),
  ('xhtml_urls','0');


# --------------------------------------------------------

#
# Table structure for table `htbu_user_attributes`
#

DROP TABLE IF EXISTS `htbu_user_attributes`;
CREATE TABLE `htbu_user_attributes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `internalKey` int NOT NULL DEFAULT '0',
  `fullname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `role` int NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT '',
  `phone` varchar(100) NOT NULL DEFAULT '',
  `mobilephone` varchar(100) NOT NULL DEFAULT '',
  `blocked` int NOT NULL DEFAULT '0',
  `blockeduntil` int NOT NULL DEFAULT '0',
  `blockedafter` int NOT NULL DEFAULT '0',
  `logincount` int NOT NULL DEFAULT '0',
  `lastlogin` int NOT NULL DEFAULT '0',
  `thislogin` int NOT NULL DEFAULT '0',
  `failedlogincount` int NOT NULL DEFAULT '0',
  `sessionid` varchar(100) NOT NULL DEFAULT '',
  `dob` int DEFAULT '0',
  `gender` int NOT NULL DEFAULT '0' COMMENT '0 - unknown, 1 - Male 2 - female',
  `country` varchar(25) NOT NULL DEFAULT '',
  `street` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `state` varchar(25) NOT NULL DEFAULT '',
  `zip` varchar(25) NOT NULL DEFAULT '',
  `fax` varchar(100) NOT NULL DEFAULT '',
  `photo` varchar(255) NOT NULL DEFAULT '' COMMENT 'link to photo',
  `comment` text,
  `createdon` int NOT NULL DEFAULT '0',
  `editedon` int NOT NULL DEFAULT '0',
  `verified` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `web_user_attributes_internalkey_index` (`internalKey`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

#
# Dumping data for table `htbu_user_attributes`
#

INSERT INTO `htbu_user_attributes` VALUES
  ('1','1','',NULL,NULL,NULL,'1','admin@mail.ru','','','0','0','0','4','1736451470','1736451470','0','1','0','0','','','','','','','',NULL,'1729111335','1736451470','1');


# --------------------------------------------------------

#
# Table structure for table `htbu_user_role_vars`
#

DROP TABLE IF EXISTS `htbu_user_role_vars`;
CREATE TABLE `htbu_user_role_vars` (
  `tmplvarid` int NOT NULL DEFAULT '0',
  `roleid` int NOT NULL DEFAULT '0',
  `rank` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`tmplvarid`,`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# --------------------------------------------------------

#
# Table structure for table `htbu_user_roles`
#

DROP TABLE IF EXISTS `htbu_user_roles`;
CREATE TABLE `htbu_user_roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

#
# Dumping data for table `htbu_user_roles`
#

INSERT INTO `htbu_user_roles` VALUES
  ('1','Administrator','Site administrators have full access to all functions'),
  ('2','Editor','Limited to managing content'),
  ('3','Publisher','Editor with expanded permissions including manage users, update Elements and site settings');


# --------------------------------------------------------

#
# Table structure for table `htbu_user_settings`
#

DROP TABLE IF EXISTS `htbu_user_settings`;
CREATE TABLE `htbu_user_settings` (
  `user` int NOT NULL,
  `setting_name` varchar(50) NOT NULL DEFAULT '',
  `setting_value` text,
  PRIMARY KEY (`user`,`setting_name`),
  KEY `user_settings_user_index` (`user`),
  KEY `setting_name` (`setting_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# --------------------------------------------------------

#
# Table structure for table `htbu_user_values`
#

DROP TABLE IF EXISTS `htbu_user_values`;
CREATE TABLE `htbu_user_values` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tmplvarid` int NOT NULL DEFAULT '0',
  `userid` int NOT NULL DEFAULT '0',
  `value` mediumtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_values_tmplvarid_userid_unique` (`tmplvarid`,`userid`),
  KEY `user_values_tmplvarid_index` (`tmplvarid`),
  KEY `user_values_userid_index` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# --------------------------------------------------------

#
# Table structure for table `htbu_users`
#

DROP TABLE IF EXISTS `htbu_users`;
CREATE TABLE `htbu_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `cachepwd` varchar(100) NOT NULL DEFAULT '' COMMENT 'Store new unconfirmed password',
  `refresh_token` varchar(255) DEFAULT NULL,
  `access_token` varchar(255) DEFAULT NULL,
  `valid_to` timestamp NULL DEFAULT NULL,
  `verified_key` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `web_users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

#
# Dumping data for table `htbu_users`
#

INSERT INTO `htbu_users` VALUES
  ('1','admin','$P$BUVcbp1atDmO7Wg2nIou0oRk8nzjx8/','','ee548087bbee9c72c4a6f7b4055cb6c8f88ba9856deb24d78db7407e6a4ba5a1','d4887c5e7e7ce8a8f883a282d1fcf4f2bd58b06a5765bd17a39bd55fc29615d4','2025-01-10 07:37:50',NULL);


# --------------------------------------------------------

SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

SET @@sql_mode := @old_sql_mode ;


# --------------------------------------------------------

