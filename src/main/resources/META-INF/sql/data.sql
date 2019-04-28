LOCK TABLES `user_group` WRITE;
/*!40000 ALTER TABLE `user_group` DISABLE KEYS */;
INSERT INTO `user_groups` VALUES (1,'Sales'),(2,'Production'),(3,'Admin');
/*!40000 ALTER TABLE `user_group` ENABLE KEYS */;
UNLOCK TABLES;


-- dane przykładowe================
LOCK TABLES `product_groups` WRITE;
INSERT INTO `product_groups` VALUES (1,'Boxes'),(2,'Accessories'),(3,'Furniture elements'), (4,'Specials');
UNLOCK TABLES;

LOCK TABLES `product_colors` WRITE;
INSERT INTO `product_colors` VALUES (1,'Red'),(2,'Black'),(3,'White'), (4,'Brown');
UNLOCK TABLES;

LOCK TABLES `product_materials` WRITE;
INSERT INTO `product_materials` VALUES (1,'Solid wood'),(2,'Veneer'),(3,'Hinges'), (4,'Lock');
UNLOCK TABLES;

-- LOCK TABLES `products` WRITE;
-- INSERT INTO `products` (id, code, description, name, notes, outerHeight, outerWidth, outerLength, productGroup_id)
-- VALUES (1,'code1', 'description1','name1','notes1',100,100,100,1),
-- (2,'code2', 'description2','name2','notes2',200,200,200,2),
-- (3,'code3', 'description3','name3','notes3',300,300,300,3);
-- UNLOCK TABLES;


