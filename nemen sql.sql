-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: callfit
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `dietas`
--

DROP TABLE IF EXISTS `dietas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dietas` (
  `id_dieta` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `id_usuario` int  NULL,
  `filtro_carbohidratos` float DEFAULT NULL,
  `filtro_proteina` float DEFAULT NULL,
  `filtro_condicion` float DEFAULT NULL,
  PRIMARY KEY (`id_dieta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dietas`
--

LOCK TABLES `dietas` WRITE;
/*!40000 ALTER TABLE `dietas` DISABLE KEYS */;
/*!40000 ALTER TABLE `dietas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dietas_has_recetas`
--

DROP TABLE IF EXISTS `dietas_has_recetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dietas_has_recetas` (
  `dietas_id_dieta` int NOT NULL,
  `recetas_id_receta` int NOT NULL,
  PRIMARY KEY (`dietas_id_dieta`,`recetas_id_receta`),
  KEY `fk_dietas_has_recetas_recetas1_idx` (`recetas_id_receta`),
  KEY `fk_dietas_has_recetas_dietas1_idx` (`dietas_id_dieta`),
  CONSTRAINT `fk_dietas_has_recetas_dietas1` FOREIGN KEY (`dietas_id_dieta`) REFERENCES `dietas` (`id_dieta`),
  CONSTRAINT `fk_dietas_has_recetas_recetas1` FOREIGN KEY (`recetas_id_receta`) REFERENCES `recetas` (`id_receta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dietas_has_recetas`
--

LOCK TABLES `dietas_has_recetas` WRITE;
/*!40000 ALTER TABLE `dietas_has_recetas` DISABLE KEYS */;
/*!40000 ALTER TABLE `dietas_has_recetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredientes`
--

DROP TABLE IF EXISTS `ingredientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredientes` (
  `idIngredientes` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `porcion` int DEFAULT NULL,
  `kcal` int DEFAULT NULL,
  `proteinas` float DEFAULT NULL,
  `carbohidratos` float DEFAULT NULL,
  `grasas` float DEFAULT NULL,
  `sodio` float DEFAULT NULL,
  `peso` float DEFAULT NULL,
  PRIMARY KEY (`idIngredientes`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredientes`
--

LOCK TABLES `ingredientes` WRITE;
/*!40000 ALTER TABLE `ingredientes` DISABLE KEYS */;
INSERT INTO `ingredientes` VALUES (1,'pechuga de pollo',100,165,31,0,3.6,74,150),(2,'pollo',100,165,31,0,3.6,74,150),(3,'pata muslo',100,209,26,0,10.9,84,150),(4,'pechuga de pavo',100,135,30,0,1,68,160),(5,'carne vacuna',100,250,26,0,17,72,150),(6,'carne magra',100,217,26,0,12,72,150),(7,'carne picada',100,254,26,0,17,72,150),(8,'nalga',100,160,21,0,8,60,150),(9,'bola de lomo',100,165,21.5,0,8.5,60,150),(10,'peceto',100,145,22,0,6,55,150),(11,'cuadril',100,180,21,0,10,60,150),(12,'lomo',100,206,27,0,10,55,150),(13,'vacío',100,240,20,0,17,65,150),(14,'asado',100,320,18,0,27,70,150),(15,'bondiola',100,242,27,0,14,62,150),(16,'solomillo de cerdo',100,143,26,0,3.5,50,160),(17,'jamón cocido',100,126,18,1,5.5,960,40),(18,'jamón crudo',100,241,31,0.5,13,2340,40),(19,'pescado',100,128,26,0,2.7,56,150),(20,'merluza',100,90,18,0,1.5,60,150),(21,'atún',100,132,28,0,1.3,47,120),(22,'atún al natural',100,116,26,0,1,330,100),(23,'salmón',100,208,20,0,13,59,150),(24,'salmon',100,208,20,0,13,59,150),(25,'cornalitos',100,95,17,0,2.5,80,120),(26,'langostinos',100,99,24,0.2,0.3,111,160),(27,'calamares',100,92,16,3.1,1.4,44,100),(28,'anchoas',100,210,29,0,10,3668,20),(29,'huevo',100,155,12.6,1.1,10.6,124,50),(30,'huevo duro',100,155,12.6,1.1,10.6,124,50),(31,'clara de huevo',100,52,10.9,0.7,0.2,166,35),(32,'lechuga',100,15,1.4,2.9,0.2,28,80),(33,'lechuga capuchina',100,14,0.9,3,0.1,10,100),(34,'rúcula',100,25,2.6,3.7,0.7,27,100),(35,'tomate',100,18,0.9,3.9,0.2,5,120),(36,'tomate cherry',100,18,0.9,3.9,0.2,5,60),(37,'tomates secos',100,258,14,55,3,2095,25),(38,'zanahoria',100,41,0.9,9.6,0.2,69,60),(39,'brócoli',100,34,2.8,6.6,0.4,33,90),(40,'zucchini',100,17,1.2,3.1,0.3,8,100),(41,'morrón',100,31,1,6,0.3,4,100),(42,'morrón rojo',100,31,1,6,0.3,4,80),(43,'morrón verde',100,20,0.9,4.6,0.2,3,80),(44,'cebolla',100,40,1.1,9.3,0.1,4,80),(45,'cebolla morada',100,40,1.1,9.3,0.1,4,40),(46,'cebollita de verdeo',100,32,1.8,7.3,0.2,16,30),(47,'pepino',100,15,0.7,3.6,0.1,2,150),(48,'espinaca',100,23,2.9,3.6,0.4,79,80),(49,'acelga',100,19,1.8,3.7,0.2,213,80),(50,'coliflor',100,25,1.9,5,0.3,30,100),(51,'repollo',100,25,1.3,5.8,0.1,18,100),(52,'berenjena',100,25,1,5.9,0.2,2,100),(53,'zapallo',100,26,1,6.5,0.1,1,150),(54,'zapallo anco',100,45,1,11.7,0.1,1,150),(55,'batata',100,86,1.6,20.1,0.1,55,150),(56,'papa',100,77,2,17.5,0.1,6,150),(57,'choclo',100,86,3.3,19,1.4,15,100),(58,'arvejas',100,81,5.4,14.5,0.4,5,100),(59,'remolacha',100,43,1.6,9.6,0.2,78,100),(60,'rabanito',100,16,0.7,3.4,0.1,39,50),(61,'espárragos',100,20,2.2,3.9,0.1,2,150),(62,'hongos',100,22,3.1,3.3,0.3,5,60),(63,'palmitos',100,28,2.5,4.6,0.6,426,60),(64,'chauchas',100,31,1.8,7,0.2,6,80),(65,'manzana',100,52,0.3,13.8,0.2,1,150),(66,'banana',100,89,1.1,22.8,0.3,1,120),(67,'naranja',100,47,0.9,11.8,0.1,0,150),(68,'mandarina',100,53,0.8,13.3,0.3,2,100),(69,'frutilla',100,32,0.7,7.7,0.3,1,150),(70,'arándanos',100,57,0.7,14.5,0.3,1,100),(71,'pera',100,57,0.4,15.2,0.1,1,150),(72,'durazno',100,39,0.9,9.5,0.3,0,150),(73,'kiwi',100,61,1.1,14.7,0.5,3,100),(74,'uva',100,69,0.7,18.1,0.2,2,100),(75,'sandía',100,30,0.6,7.6,0.2,1,200),(76,'melón',100,34,0.8,8.2,0.2,16,200),(77,'arroz blanco',100,130,2.7,28.2,0.3,1,150),(78,'arroz integral',100,123,2.7,25.6,1,1,150),(79,'avena',100,389,16.9,66.3,6.9,2,50),(80,'quinoa',100,120,4.4,21.3,1.9,7,150),(81,'fideos',100,158,5.8,30.9,0.9,1,150),(82,'pan integral',100,247,13,41,4.2,400,60),(83,'pan blanco',100,266,8.9,49.4,3.2,490,60),(84,'harina integral',100,340,13.7,72,2.5,5,50),(85,'tapa de tarta integral',100,290,8,45,9,380,50),(86,'tapa de empanada',100,280,7.5,48,6.5,410,30),(87,'lentejas',100,116,9,20.1,0.4,2,150),(88,'garbanzos',100,164,8.9,27.4,2.6,7,150),(89,'porotos',100,127,8.7,22.8,0.5,2,150),(90,'porotos de soja',100,173,16.6,9.9,9,1,100),(91,'leche entera',100,61,3.2,4.8,3.3,43,200),(92,'leche descremada',100,34,3.4,5,0.1,42,200),(93,'yogur natural',100,61,3.5,4.7,3.3,46,150),(94,'yogur descremado',100,63,5.3,7,1.6,70,150),(95,'queso cremona',100,264,18,3.5,20,450,40),(96,'queso port salut',100,240,19,2,17,410,40),(97,'queso port salut descremado',100,170,20,3,8,380,40),(98,'ricota',100,138,11,3,9,100,60),(99,'ricota magra',100,98,11,3.4,4.3,364,60),(100,'queso rallado',100,431,38,4.1,29,1529,20),(101,'queso crema',100,342,6,4.1,34,321,30),(102,'queso crema light',100,120,8,5,8,350,30),(103,'queso azul',100,353,21,2.3,29,1395,30),(104,'almendras',100,579,21.2,21.6,49.9,1,30),(105,'nueces',100,654,15.2,13.7,65.2,2,30),(106,'maní',100,567,25.8,16.1,49.2,18,30),(107,'semillas de chía',100,486,16.5,42.1,30.7,16,15),(108,'semillas de lino',100,534,18.3,28.9,42.2,30,15),(109,'semillas de zapallo',100,559,30,10.7,49,7,15),(110,'semillas de girasol',100,584,20.8,20,51.5,9,15),(111,'aceite de oliva',100,884,0,0,100,2,13.5),(112,'aceite de girasol',100,884,0,0,100,0,13.5),(113,'aceite de sésamo',100,884,0,0,100,0,13.5),(114,'aceitunas',100,115,0.8,6,10.7,735,25),(115,'aceitunas negras',100,115,0.8,6,10.7,735,25),(116,'aceitunas verdes',100,145,1,3.8,15.3,1556,30),(117,'alcaparras',100,23,2.4,5,0.9,2964,15),(118,'limón',100,29,1.1,9.3,0.3,2,50),(119,'vinagre',100,18,0,0.9,0,5,15),(120,'vinagre de manzana',100,21,0,0.9,0,5,15),(121,'aceto balsámico',100,88,0.5,17,0,23,15),(122,'mostaza',100,66,4.4,6,3.3,1120,10),(123,'salsa de soja',100,53,8,4.9,0.6,5493,15),(124,'salsa de tomate',100,29,1.3,7,0.2,310,60),(125,'palta',100,160,2,8.5,14.7,7,100),(126,'miel',100,304,0.3,82.4,0,4,10);
/*!40000 ALTER TABLE `ingredientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredientes_has_recetas`
--

DROP TABLE IF EXISTS `ingredientes_has_recetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredientes_has_recetas` (
  `Ingredientes_idIngredientes` int NOT NULL,
  `Recetas_id_receta` int NOT NULL,
  PRIMARY KEY (`Ingredientes_idIngredientes`,`Recetas_id_receta`),
  KEY `fk_Ingredientes_has_Recetas_Recetas1_idx` (`Recetas_id_receta`),
  KEY `fk_Ingredientes_has_Recetas_Ingredientes1_idx` (`Ingredientes_idIngredientes`),
  CONSTRAINT `fk_Ingredientes_has_Recetas_Ingredientes1` FOREIGN KEY (`Ingredientes_idIngredientes`) REFERENCES `ingredientes` (`idIngredientes`),
  CONSTRAINT `fk_Ingredientes_has_Recetas_Recetas1` FOREIGN KEY (`Recetas_id_receta`) REFERENCES `recetas` (`id_receta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredientes_has_recetas`
--

LOCK TABLES `ingredientes_has_recetas` WRITE;
/*!40000 ALTER TABLE `ingredientes_has_recetas` DISABLE KEYS */;
/*!40000 ALTER TABLE `ingredientes_has_recetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan_semanal`
--

DROP TABLE IF EXISTS `plan_semanal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan_semanal` (
  `id_plan` int NOT NULL AUTO_INCREMENT,
  `fecha` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `Usuario_id` int NOT NULL,
  PRIMARY KEY (`id_plan`),
  KEY `fk_Plan_semanal_Usuario1_idx` (`Usuario_id`),
  CONSTRAINT `fk_Plan_semanal_Usuario1` FOREIGN KEY (`Usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_semanal`
--

LOCK TABLES `plan_semanal` WRITE;
/*!40000 ALTER TABLE `plan_semanal` DISABLE KEYS */;
/*!40000 ALTER TABLE `plan_semanal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recetas`
--

DROP TABLE IF EXISTS `recetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recetas` (
  `id_receta` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) DEFAULT NULL,
  `descripcion` text,
  `imagen` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id_receta`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recetas`
--

LOCK TABLES `recetas` WRITE;
/*!40000 ALTER TABLE `recetas` DISABLE KEYS */;
INSERT INTO `recetas` VALUES (56,'Pechuga al romero con batata al horno','Plato reconfortante bajo en sodio, lleno de carbohidratos complejos y proteína magra.','https://images.unsplash.com/photo-1532550907401-a500c9a57435?auto=format&fit=crop&w=1000&q=80'),(57,'Salmón al vapor con vegetales verdes y limón','Cocción limpia y natural, sin añadidos de sal para maximizar el aporte de Omega-3.','https://images.unsplash.com/photo-1467003909585-2f8a72700288?auto=format&fit=crop&w=1000&q=80'),(58,'Ensalada de lentejas con zapallo anco y comino','Opción vegetal saciante, rica en hierro y potasio, sazonada con hierbas naturales.','https://images.unsplash.com/photo-1540420773420-3366772f4999?auto=format&fit=crop&w=1000&q=80'),(59,'Bife de cuadril a la plancha con papas al horno','Plato proteico y energético con un toque equilibrado de sal marina.','https://images.unsplash.com/photo-1544025162-d76694265947?auto=format&fit=crop&w=1000&q=80'),(60,'Arroz con pollo al curry y vegetales','Especia potente y aromática con sodio controlado para mantener el equilibrio nutricional.','https://images.unsplash.com/photo-1603133872878-684f208fb84b?auto=format&fit=crop&w=1000&q=80'),(61,'Ensalada de atún con huevo duro y garbanzos','Rápida, fresca y rica en nutrientes, con sodio controlado mediante atún al natural.','https://images.unsplash.com/photo-1512621776951-a57141f2eefd?auto=format&fit=crop&w=1000&q=80'),(62,'Pechuga de pollo a la vinagreta de alcaparras y mostaza','Sabor ácido e intenso con nivel elevado de sodio aportado por los encurtidos.','https://images.unsplash.com/photo-1568901346375-23c9450c58cd?auto=format&fit=crop&w=1000&q=80'),(63,'Fideos con salsa de anchoas, tomates secos y aceitunas','Plato de fuerte inspiración mediterránea con alto contenido salino proveniente de las conservas marinas.','https://images.unsplash.com/photo-1621996346565-e3def6164286?auto=format&fit=crop&w=1000&q=80'),(64,'Ensalada de jamón crudo, queso port salut y rúcula','Combinación gourmet con alto perfil de sodio por el curado del fiambre y el queso.','https://images.unsplash.com/photo-1540420773420-3366772f4999?auto=format&fit=crop&w=1000&q=80'),(65,'Wok de calamares y langostinos con salsa de soja y sésamo','Salteado oriental marino con marcada presencia de sodio proveniente de mariscos y salsa de soja.','https://images.unsplash.com/photo-1551248429-40975aa4de74?auto=format&fit=crop&w=1000&q=80'),(76,'Matambre de pollo magro al verdeo con calabaza gratinada','Versión liviana del clásico arrollado, rellena de vegetales y servida con calabaza rica en potasio.','https://images.unsplash.com/photo-1532550907401-a500c9a57435?auto=format&fit=crop&w=1000&q=80'),(77,'Guiso de lentejas saludable con vegetales y quinoa','Sin embutidos ni grasas pesadas, repleto de fibra, hierro y proteína vegetal de alta calidad.','https://images.unsplash.com/photo-1540420773420-3366772f4999?auto=format&fit=crop&w=1000&q=80'),(78,'Bife de nalga a la criolla con vegetales al vapor','Corte vacuno ultra magro cocinado en una jugosa salsa de tomates frescos y morrones.','https://images.unsplash.com/photo-1544025162-d76694265947?auto=format&fit=crop&w=1000&q=80'),(79,'Milanesas de peceto al horno con ensalada de rúcula y tomate','Empanado saludable con avena o salvado de trigo, super crocante y con mínimo aceite.','https://images.unsplash.com/photo-1544025162-d76694265947?auto=format&fit=crop&w=1000&q=80'),(80,'Pastel de calabaza magro con carne vacuna y huevo duro','Sustituye la papa por calabaza para reducir carbohidratos simples y sumar betacarotenos.','https://images.unsplash.com/photo-1544025162-d76694265947?auto=format&fit=crop&w=1000&q=80'),(81,'Tartita integral de choclo, calabaza y queso port salut','Inspirada en la humita porteña, en formato tarta liviana con masa de harina integral.','https://images.unsplash.com/photo-1540420773420-3366772f4999?auto=format&fit=crop&w=1000&q=80'),(82,'Bife de chorizo a la napolitana con queso port salut y tomate','El gusto clásico napolitano pero magro: carne a la parrilla/plancha sin empanar con queso magro.','https://images.unsplash.com/photo-1544025162-d76694265947?auto=format&fit=crop&w=1000&q=80'),(83,'Empanadas integrales de pollo al verdeo (3 unidades)','Versión fitness del clásico criollo usando masa de harina integral rica en fibra.','https://images.unsplash.com/photo-1568901346375-23c9450c58cd?auto=format&fit=crop&w=1000&q=80'),(84,'Guiso criollo de mondongo liviano con garbanzos','Corte proteico y bajísimo en grasa, preparado en cazuela vegetal rica en sodio natural.','https://images.unsplash.com/photo-1540420773420-3366772f4999?auto=format&fit=crop&w=1000&q=80'),(85,'Ensalada tibia de provoleta magra, rúcula y pimientos asados','Sabor de parrilla argentina equilibrado con abundantísima verdura fresca y limpia.','https://images.unsplash.com/photo-1540420773420-3366772f4999?auto=format&fit=crop&w=1000&q=80'),(86,'Colita de cuadril al horno con batatas al romero','Corte vacuno magro asado al horno lentamente, sazonado con hierbas aromáticas sin sal agregada.','https://images.unsplash.com/photo-1544025162-d76694265947?auto=format&fit=crop&w=1000&q=80'),(87,'Pollo al chimmichurri casero sin sal con calabaza','Sabor criollo intenso a base de especias puras y aceite de oliva sobre pechuga a la plancha.','https://images.unsplash.com/photo-1532550907401-a500c9a57435?auto=format&fit=crop&w=1000&q=80'),(88,'Cazuela de garbanzos, espinaca y zapallo anco','Plato de cuchara 100% vegetal, saciante y lleno de nutrientes esenciales para los días fríos.','https://images.unsplash.com/photo-1540420773420-3366772f4999?auto=format&fit=crop&w=1000&q=80'),(89,'Milanesas de berenjena a la napolitana con ensalada','Opción vegetariana ligera, rebozada con avena y cubierta con queso magro y tomate fresco.','https://images.unsplash.com/photo-1540420773420-3366772f4999?auto=format&fit=crop&w=1000&q=80'),(90,'Bife de lomo al alverdeo con puré de papas liviano','Corte tierno por excelencia salteado con cebollita de verdeo y guarnición tradicional.','https://images.unsplash.com/photo-1544025162-d76694265947?auto=format&fit=crop&w=1000&q=80'),(91,'Canelones de verdura y ricota con salsa filetto','Pasta clásica dominguera en versión liviana, con abundante relleno vegetal e hidratante.','https://images.unsplash.com/photo-1621996346565-e3def6164286?auto=format&fit=crop&w=1000&q=80'),(92,'Suprema a la suiza magra con papas rústicas','Pechuga crocante al horno gratina con queso derretido y salsa blanca liviana.','https://images.unsplash.com/photo-1532550907401-a500c9a57435?auto=format&fit=crop&w=1000&q=80'),(93,'Locro liviano de carne vacuna, calabaza y maiz blanco','Adaptación saludable del ícono patrio, sin embutidos grasos pero con mucho sabor.','https://images.unsplash.com/photo-1540420773420-3366772f4999?auto=format&fit=crop&w=1000&q=80'),(94,'Matambre a la pizza con ensalada mixta','Corte vacuno tierno asado a la parrilla o al horno con cubierta clásica de pizza.','https://images.unsplash.com/photo-1544025162-d76694265947?auto=format&fit=crop&w=1000&q=80'),(95,'Arroz con mariscos y tentáculos de calamar a la provenzal','Inspirado en la cazuela de mariscos del puerto, rico en minerales y de sabor marcado.','https://images.unsplash.com/photo-1551248429-40975aa4de74?auto=format&fit=crop&w=1000&q=80'),(106,'Bife de cuadril a la criolla con puré de papas y calabaza','Plato magro e hidratante, sazonado con vegetales frescos para realzar el sabor sin sal.','https://images.unsplash.com/photo-1544025162-d76694265947?auto=format&fit=crop&w=1000&q=80'),(107,'Pechuga de pollo a la plancha con batatas asadas y romero','Combinación limpia de proteína magra y energía de absorción lenta sin sodio añadido.','https://images.unsplash.com/photo-1532550907401-a500c9a57435?auto=format&fit=crop&w=1000&q=80'),(108,'Ensalada de lentejas, calabaza asada y espinaca fresca','Opción vegetariana saciante y completa, rica en hierro, potasio y fibra.','https://images.unsplash.com/photo-1540420773420-3366772f4999?auto=format&fit=crop&w=1000&q=80'),(109,'Milanesa de peceto al horno con ensalada de rúcula y tomate','Sabor tradicional argentino preparado con avena integral y sal marina controlada.','https://images.unsplash.com/photo-1544025162-d76694265947?auto=format&fit=crop&w=1000&q=80'),(110,'Tartita integral de zapallitos, ricota magra y queso port salut','Plato ligero y fresco, perfecto para incorporar vegetales y calcio con modera sal.','https://images.unsplash.com/photo-1540420773420-3366772f4999?auto=format&fit=crop&w=1000&q=80'),(111,'Salteado de arroz integral con pollo, arvejas y zanahoria','Arroz wok liviano al estilo criollo con aporte equilibrado de macronutrientes.','https://images.unsplash.com/photo-1603133872878-684f208fb84b?auto=format&fit=crop&w=1000&q=80'),(112,'Bife a la napolitana magro con queso port salut y tomate','Versión de sartén sin empanado, baja en grasas y repleta del clásico sabor porteño.','https://images.unsplash.com/photo-1544025162-d76694265947?auto=format&fit=crop&w=1000&q=80'),(113,'Empanadas integrales de carne a la cuchillo (3 unidades)','Clásico criollo elaborado con cortes magros y masa de harina integral rica en fibra.','https://images.unsplash.com/photo-1568901346375-23c9450c58cd?auto=format&fit=crop&w=1000&q=80'),(114,'Fideos integrales con salsa de atún, tomate y aceitunas','Pasta energética mediterránea con intenso perfil salino proveniente de conservas de pescado y aceitunas.','https://images.unsplash.com/photo-1621996346565-e3def6164286?auto=format&fit=crop&w=1000&q=80'),(115,'Picada saludable con jamón crudo, queso cremona y frutos secos','Propuesta de picada gourmet sin cocción, con excelente densidad nutricional y grasas cardioprotectoras.','https://images.unsplash.com/photo-1540420773420-3366772f4999?auto=format&fit=crop&w=1000&q=80'),(116,'Bife de cuadril con puré de batata y verdeo','Proteína magra a la plancha con puré dulce y aromático, libre de sal agregada.','https://images.unsplash.com/photo-1544025162-d76694265947?auto=format&fit=crop&w=1000&q=80'),(117,'Pechuga al ajillo con calabaza en cubos al horno','Sabor intenso a ajo y hierbas naturales que reemplaza la necesidad de sal.','https://images.unsplash.com/photo-1532550907401-a500c9a57435?auto=format&fit=crop&w=1000&q=80'),(118,'Ensalada tibia de quinoa, lentejas y vegetales salteados','Plato 100% vegetal con aminoácidos completos, fibra y mucha saciedad.','https://images.unsplash.com/photo-1540420773420-3366772f4999?auto=format&fit=crop&w=1000&q=80'),(119,'Bife de nalga al romero con papas rústicas al horno','Corte vacuno magro y clásico porteño con guarnición crocante y sal marina medida.','https://images.unsplash.com/photo-1544025162-d76694265947?auto=format&fit=crop&w=1000&q=80'),(120,'Tartita integral de acelga, ricota magra y clara de huevo','Ligera, nutritiva y con rico aporte de fibra mediante su masa integral casera.','https://images.unsplash.com/photo-1540420773420-3366772f4999?auto=format&fit=crop&w=1000&q=80'),(121,'Guisito liviano de arroz integral, pollo y arvejas','Plato de cuchara casero y balanceado, rico en energía duradera y proteína limpia.','https://images.unsplash.com/photo-1603133872878-684f208fb84b?auto=format&fit=crop&w=1000&q=80'),(122,'Bife a la napolitana con queso port salut y ensalada mixta','El clásico de los bodegones en versión a la plancha para evitar fritos sin perder sabor.','https://images.unsplash.com/photo-1544025162-d76694265947?auto=format&fit=crop&w=1000&q=80'),(123,'Empanadas integrales de pollo al verdeo (3 unidades)','Empanadas caseras de pechuga desmenuzada y verdeo, horneadas con masa de salvado.','https://images.unsplash.com/photo-1568901346375-23c9450c58cd?auto=format&fit=crop&w=1000&q=80'),(124,'Fideos integrales al tuco de atún con aceitunas verdes','Salsa de pescado súper rápida, rica en hierro, proteínas y el toque salino de las aceitunas.','https://images.unsplash.com/photo-1621996346565-e3def6164286?auto=format&fit=crop&w=1000&q=80'),(125,'Tabla de picada magra con jamón crudo, queso cremona y nueces','Opción práctica de fiambres curados y grasas saludables para resolver un almuerzo rápido.','https://images.unsplash.com/photo-1540420773420-3366772f4999?auto=format&fit=crop&w=1000&q=80');
/*!40000 ALTER TABLE `recetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro_glucosa`
--

DROP TABLE IF EXISTS `registro_glucosa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registro_glucosa` (
  `id_registro` int NOT NULL AUTO_INCREMENT,
  `glucosa` float DEFAULT NULL,
  `fecha` varchar(45) DEFAULT NULL,
  `Usuario_id` int NOT NULL,
  `nota` varchar(45) DEFAULT NULL,
  `comentarios` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_registro`),
  KEY `fk_Registro_glucosa_Usuario1_idx` (`Usuario_id`),
  CONSTRAINT `fk_Registro_glucosa_Usuario1` FOREIGN KEY (`Usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro_glucosa`
--

LOCK TABLES `registro_glucosa` WRITE;
/*!40000 ALTER TABLE `registro_glucosa` DISABLE KEYS */;
INSERT INTO `registro_glucosa` VALUES (23,28,'2026-09-17 11:00',1,'Despues del almuerzo','Sin comentarios');
/*!40000 ALTER TABLE `registro_glucosa` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Table structure for table `semaforo`
--

DROP TABLE IF EXISTS `semaforo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `semaforo` (
  `idSemaforo` int NOT NULL,
  PRIMARY KEY (`idSemaforo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semaforo`
--

LOCK TABLES `semaforo` WRITE;
/*!40000 ALTER TABLE `semaforo` DISABLE KEYS */;
/*!40000 ALTER TABLE `semaforo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `nombre` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `contrasenia` varchar(45) DEFAULT NULL,
  `edad` int DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES ('Pedro','arielito@gmail.com','123456',18,1),('sdasada','sadsadsa@gmail.com','1234',NULL,2),('arielitos','alo@gmail.com','123456',NULL,3),('lucho','lucho.chucky@gmail.com','1234',NULL,4);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_has_dietas`
--

DROP TABLE IF EXISTS `usuario_has_dietas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_has_dietas` (
  `Usuario_id` int NOT NULL,
  `Dietas_id_dieta` int NOT NULL,
  PRIMARY KEY (`Usuario_id`,`Dietas_id_dieta`),
  KEY `fk_Usuario_has_Dietas_Dietas1_idx` (`Dietas_id_dieta`),
  KEY `fk_Usuario_has_Dietas_Usuario1_idx` (`Usuario_id`),
  CONSTRAINT `fk_Usuario_has_Dietas_Dietas1` FOREIGN KEY (`Dietas_id_dieta`) REFERENCES `dietas` (`id_dieta`),
  CONSTRAINT `fk_Usuario_has_Dietas_Usuario1` FOREIGN KEY (`Usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_has_dietas`
--

LOCK TABLES `usuario_has_dietas` WRITE;
/*!40000 ALTER TABLE `usuario_has_dietas` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_has_dietas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-17 11:31:59
