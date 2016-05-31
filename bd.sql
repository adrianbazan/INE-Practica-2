CREATE DATABASE  IF NOT EXISTS `eshop3_development` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `eshop3_development`;
-- MySQL dump 10.13  Distrib 5.5.49, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: eshop3_development
-- ------------------------------------------------------
-- Server version	5.5.49-0ubuntu0.14.04.1

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
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `film_id` int(11) DEFAULT NULL,
  `cart_id` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` VALUES (1,'2016-05-27 14:12:12','2016-05-27 14:12:12'),(2,'2016-05-30 19:25:21','2016-05-30 19:25:21'),(3,'2016-05-31 08:43:56','2016-05-31 08:43:56');
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directors`
--

DROP TABLE IF EXISTS `directors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `directors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directors`
--

LOCK TABLES `directors` WRITE;
/*!40000 ALTER TABLE `directors` DISABLE KEYS */;
INSERT INTO `directors` VALUES (1,'James','Cameron','2016-05-27 14:21:22','2016-05-27 14:21:22'),(3,'Francis','Ford Coppola','2016-05-31 09:08:47','2016-05-31 09:08:47'),(4,'Steven','Spielberg','2016-05-31 09:08:59','2016-05-31 09:08:59'),(5,'Olivier','Nakache','2016-05-31 09:16:55','2016-05-31 09:16:55'),(6,'Christopher','Nolan','2016-05-31 09:17:15','2016-05-31 09:17:15'),(7,'Peter','Jackson','2016-05-31 09:17:26','2016-05-31 09:17:26'),(8,'Quentin','Tarantino','2016-05-31 09:17:39','2016-05-31 09:17:39'),(9,'Robert','Zemeckis','2016-05-31 09:49:39','2016-05-31 09:49:39');
/*!40000 ALTER TABLE `directors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directors_films`
--

DROP TABLE IF EXISTS `directors_films`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `directors_films` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `director_id` int(11) NOT NULL,
  `film_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_directors_films_directors` (`director_id`) USING BTREE,
  KEY `fk_directors_films_films` (`film_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directors_films`
--

LOCK TABLES `directors_films` WRITE;
/*!40000 ALTER TABLE `directors_films` DISABLE KEYS */;
INSERT INTO `directors_films` VALUES (4,3,4,'2016-05-31 09:20:36','2016-05-31 09:20:36'),(5,3,5,'2016-05-31 09:22:01','2016-05-31 09:22:01'),(6,4,6,'2016-05-31 09:23:19','2016-05-31 09:23:19'),(7,4,7,'2016-05-31 09:24:50','2016-05-31 09:24:50'),(8,5,8,'2016-05-31 09:26:13','2016-05-31 09:26:13'),(9,5,9,'2016-05-31 09:27:55','2016-05-31 09:27:55'),(10,6,10,'2016-05-31 09:29:24','2016-05-31 09:29:24'),(11,6,11,'2016-05-31 09:30:52','2016-05-31 09:30:52'),(12,7,12,'2016-05-31 09:32:29','2016-05-31 09:32:29'),(13,8,13,'2016-05-31 09:33:55','2016-05-31 09:33:55'),(14,8,14,'2016-05-31 09:48:48','2016-05-31 09:48:48'),(15,9,15,'2016-05-31 09:51:09','2016-05-31 09:51:09'),(16,9,16,'2016-05-31 09:53:43','2016-05-31 09:53:43'),(17,8,17,'2016-05-31 09:55:07','2016-05-31 09:55:07'),(18,8,18,'2016-05-31 09:56:35','2016-05-31 09:56:35'),(19,1,19,'2016-05-31 09:58:04','2016-05-31 09:58:04');
/*!40000 ALTER TABLE `directors_films` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `films`
--

DROP TABLE IF EXISTS `films`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `films` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `producer_id` int(11) NOT NULL,
  `produced_at` datetime DEFAULT NULL,
  `cod` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `blurb` text COLLATE utf8_unicode_ci,
  `duration` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `cover_image_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cover_image_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cover_image_file_size` int(11) DEFAULT NULL,
  `cover_image_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_films_producers` (`producer_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `films`
--

LOCK TABLES `films` WRITE;
/*!40000 ALTER TABLE `films` DISABLE KEYS */;
INSERT INTO `films` VALUES (4,'El Padrino',1,'2011-05-01 00:00:00','111','Película ambientada en el Nueva York de 1945. Los Corleone son una de las cinco familias más reputadas de la mafia asentadas en la ciudad.',180,15,'2016-05-31 09:20:36','2016-05-31 09:20:36','p1.jpg','image/jpeg',107947,'2016-05-31 09:20:34'),(5,'On the road',1,'2016-04-05 00:00:00','112','Finales de los años cuarenta. Al día siguiente del fallecimiento de su padre, Sal Paradise (Sam Riley, \'Control\'), aprendiz de escritor en Nueva York, conoce a Dean Moriarty (Garrett Hedlund, \'Tron: Legacy\'), un joven rebelde y problemático que ha pasado por la cárcel y que siempre anda envuelto en problemas, y a su novia, la fascinante Marylou (Kristen Stewart, \'Crepúsculo\'). ',140,20,'2016-05-31 09:22:01','2016-05-31 09:22:01','p2.jpeg','image/jpeg',29097,'2016-05-31 09:22:01'),(6,'La lista de Schindler',1,'2016-05-16 00:00:00','113','Durante la Segunda Guerra Mundial, Oskar Schindler (Liam Neeson, \'Michael Collins\') proyecta un plan para hacerse amigos de los nazis y salvar la raza judia.',175,25,'2016-05-31 09:23:19','2016-05-31 09:23:19','p3.jpg','image/jpeg',602541,'2016-05-31 09:23:19'),(7,'El puente de los espías',2,'2016-05-14 00:00:00','114','Década de los años 60. Estados Unidos y la Unión Soviética se encuentran en plena Guerra Fría. El 1 de mayo de 1960 un avión espía estadounidense es derribado por el ejército enemigo cuando sobrevolaba territorio soviético. Sorprendentemente, el piloto Francis Gary Powers (Austin Stowell) logra escapar gracias a su paracaídas. Cuando ya se creía a salvo, el piloto del avión U-2 es capturado por los soviéticos. Tras este suceso, el abogado especializado en seguros James B. Donovan (Tom Hanks) es reclutado por la CIA como encargado de negociar la liberación del soldado.',120,10,'2016-05-31 09:24:50','2016-05-31 09:24:50','p4.jpeg','image/jpeg',82723,'2016-05-31 09:24:50'),(8,'Intocable',2,'2011-03-03 00:00:00','115','Philippe (François Cluzet, \'No se lo digas a nadie\') es un hombre adinerado que pertenece a una clase social alta. Sin embargo, su vida cambiará cuando conozca a un chico que le cuidará de por vida.',90,20,'2016-05-31 09:26:13','2016-05-31 09:26:13','p5.jpg','image/jpeg',105573,'2016-05-31 09:26:13'),(9,'Aquellos días felices',3,'2012-10-31 00:00:00','116','Vicente Rousseau tiene por primera vez la oportunidad de dirigir su propio campamento de verano. Tres semanas llenas de batallas de comida, guateques, primeros amores, canciones junto al fuego…\r\n\r\nAl principio todo es un sueño hecho realidad, pero poco a poco todo se va desmoronando y pasa a ser una terrible pesadilla de la que tendrá que salir como sea. ',76,5,'2016-05-31 09:27:55','2016-05-31 09:27:55','p6.jpg','image/jpeg',148119,'2016-05-31 09:27:55'),(10,'El caballero oscuro',2,'2013-04-22 00:00:00','117','Después de derrotar a la Orden de las Sombras y frustrar al jefe de la mafia Carmine Falcone en \'Batman Begins\', Bruce Wayne vuelve a enfundarse el traje del hombre murciélago para combatir el crimen en Gotham.\r\n\r\nCon Falcone fuera, el mafioso Salvatore Maroni se ha hecho con el control en la ciudad y parece que la lucha de Batman frente a los criminales será interminable. Por suerte, la ciudad cuenta ahora con Harvey Dent, un nuevo Fiscal del Distrito caracterizado por su mano dura contra el crimen, lo que da un aire de esperanza a Gotham y permite que Bruce se centre en Rachel Dawes, el amor de su vida y la única que conoce su verdadera identidad.\r\n\r\nSin embargo, la llegada de un nuevo villano a la ciudad destruirá todos los planes de Batman. Se trata de El Joker, un psicópata retorcido y sádico, con una morbosa fascinación por todo lo que rodea al murciélago. Pronto comenzará a sembrar el pánico y a causar estragos en Gotham, convirtiéndose en el peor enemigo posible para El caballero oscuro. ',155,20,'2016-05-31 09:29:24','2016-05-31 09:29:24','p7.jpg','image/jpeg',147510,'2016-05-31 09:29:24'),(11,'Interstellar',4,'2014-04-19 00:00:00','118','\r\n\r\nInspirada en la teoría del experto en relatividad Kip Stepehen Thorne sobre la existencia de los agujeros de gusano, y su función como canal para llevar a cabo los viajes en el tiempo. La historia gira en torno a un grupo de intrépidos exploradores que se adentran por uno de esos agujeros y viajan a través del mismo, encontrándose en otra dimensión. Un mundo desconocido se abre ante ellos y deberán luchar por mantenerse unidos si quieren volver de una pieza.\r\n\r\nLa película cuenta con un reparto de lujo con nombres como Matthew McConaughey (\'Sahara\'), Anne Hathaway (\'El caballero oscuro. La leyenda renace\'), Jessica Chastain (\'La noche más oscura\') y Michael Caine (\'El caballero oscuro\'), todos ellos a las órdenes de Christopher Nolan (\'Memento\', \'Origen\').',200,27,'2016-05-31 09:30:52','2016-05-31 09:30:52','p8.jpeg','image/jpeg',325748,'2016-05-31 09:30:52'),(12,'El Señor de los Anillos: La Comunidad del Anillo',2,'2012-02-01 00:00:00','119','La trilogía del Señor de los Anillos se estrenó en 2001 con La Comunidad del Anillo, le siguió Las dos torres en 2002 y acabó con El retorno del Rey en 2003.\r\n\r\nEn este episodio de la trilogía, el joven y tímido hobbit, Frodo Bolsón, hereda un anillo. Lejos de ser una simple baratija, se trata del Anillo único, un instrumento de poder que permitiría a Sauron, el Señor Oscuro, reinar en la Tierra Media y convertir en esclavos a sus habitantes. Frodo, con la ayuda de una Compañía formada por hobbits, hombres, un mago, un enano y un elfo, tiene la misión de llevar el Anillo viajando por toda la Tierra Media hasta el Monte del Destino, lugar donde fue forjado, y destruirlo para siempre. Un tal periplo supone aventurarse muy lejos en Mordor, la tierra del Señor Oscuro, donde se concentra su ejército de orcos maléficos... La Compañía, no solo debe combatir las fuerzas externas del mal, sino también las fuerzas internas y la influencia corruptora que ejerce el propio anillo. El final de la historia está íntimamente ligado a la suerte de la Compañía. ',170,14,'2016-05-31 09:32:29','2016-05-31 09:32:29','p9.jpg','image/jpeg',111633,'2016-05-31 09:32:29'),(13,'Pulp Fiction',3,'2011-09-17 00:00:00','120','\r\n\r\nEsta película policiaca que se enreda en el tiempo, nos lleva a conocer a Jules (Samuel L. Jackson, \'Jackie Brown\') y Vincent (John Travolta, \'Grease\'), dos asesinos a sueldo bajo las órdenes del temido Marsellus Wallace (Ving Rhames, \'Amanecer de los muertos\').\r\n\r\nCuando éste les encarga la misión de recuperar su misterioso maletín, comienzan los problemas. No solo porque los criminales son polos opuestos, sino porque, además, Marsellus le encarga a Vincent que cuide de su novia Mia Jones-Wallace (Uma Thurman, \'Kill Bill\'), algo con lo que su inseparable compañero no está de acuerdo.\r\n\r\nAdemás, de fondo, se cuenta la huída de Butch Coolidge (Bruce Willis, \'Jungla de cristal\'), un boxeador que pretende estafar a Wallace, con el que ha acordado un combate amañado; y la historia de dos criminales Pumpkin/Ringo (Tim Roth, \'Reservoir Dogs\') y Honey Bunny/Yolanda (Amanda Plummer, \'Mi vida sin mí\') que, por su lamentable situación laboral, deciden atracar un establecimiento.\r\n',145,10,'2016-05-31 09:33:55','2016-05-31 09:33:55','p10.jpg','image/jpeg',453180,'2016-05-31 09:33:55'),(14,'The Hateful Eight',3,'2014-03-27 00:00:00','121','En algún lugar de Wyoming, pocos años después de la Guerra Civil Norteamericana, ocho variopintos personajes se encuentran atrapados en un refugio en las montañas a causa de un gran temporal de nieve.\r\n\r\nEntre ellos están el cazarrecompensas John Ruth (Kurt Russell), conocido en esas tierras como \"The Hangman\" (El Verdugo), y su prisionera Daisy Domergue (Jennifer Jason Leigh), que se dirigen hacia el pueblo de Red Rock donde Ruth pretende entregar viva a la fugitiva ante la justicia. En su camino se les une el Mayor Marquis Warren, (Samuel L. Jackson) que ahora se dedica a ser cazarrecompensas aunque fue soldado en el pasado, y que en cambio prefiere llevar a cuestas los cadáveres de unos fugitivos para cobrar por su recompensa. También se unirá a su viaje Chris Mannix (Walton Goggins), un joven cuyo padre luchó con los Conferedaros, que afirma va ser el nuevo sheriff de Red Rock.\r\n\r\nDebido a la enorme tormenta que se aproxima, los cuatro viajeros de esta caravana se ven obligados a refugiarse en un bar de carretera infame y en medio de la nada, conocido como la tienda de Minnie. Cuando llegan allí, la propietaria no está por ninguna parte, y es Bob (Demian Bichir), el que está al cargo. La posada además, está bastante al completo, allí se encuentran también el verdugo Oswaldo Mobray (Tim Roth), el vaquero Joe Gage (Michael Madsen) y el retirado General Confederado Sandy Smithers (Bruce Dern). Todos ellos deberán aguardar allí dentro a que amaine el temporal. La tensión entre ellos no tardará en surgir...',145,24,'2016-05-31 09:48:48','2016-05-31 09:48:48','p11.jpeg','image/jpeg',244714,'2016-05-31 09:48:48'),(15,'Forrest Gump',2,'2013-03-20 00:00:00','122','\r\n\r\nAl tener el coeficiente intelectual de un niño, Forrest Gump siempre ha sido considerado el “tonto” de clase. Bajo las faldas de su madre se siente protegido y junto a su amiga Jenny es feliz, aunque en su propio mundo. Un problema en su columna vertebral no le impide convertirse en un ágil corredor. Ya más mayor, Forrest luchará en la guerra de Vietnam y conocerá al mismísimo presidente de los Estados Unidos. Llegará a ser muy rico, pero para Forrest hay algo que no cambia: el amor de su vida es y será Jenny.\r\n\r\nRobert Zemeckis (\'Back for the Future\', \'El vuelo\') es el director de este largometraje, contando con la activa participación de Eric Roth para adaptar la historia original creada en su día por el novelista Winston Groom. En cuanto al reparto de la obra, cabe destacar la presencia de diversos intérpretes de gran nivel en lo que se refiere al ámbito cinematográfico como es el caso de Tom Hanks (\'Capitán Phillips\', \'American Gods\') o Robin Wright (\'House of Cards\', \'A Most Wanted Man\').\r\n',120,14,'2016-05-31 09:51:09','2016-05-31 09:51:09','p12.jpg','image/jpeg',90063,'2016-05-31 09:51:08'),(16,'El vuelo',4,'2018-09-25 00:00:00','123','El cineasta Robert Zemeckis (Forrest Gump) dirige esta película que narra la curiosa historia de Whip Whitaker (Denzel Washington, Malcolm X), un piloto que trabaja en una aerolínea comercial.\r\n\r\nWhip pasa la vida de avión en avión pilotando por pura rutina, hasta que un día en uno de sus vuelos ocurre algo totalmente inesperado. El avión que pilota empieza a temblar debido a una avería, causando el pánico entre los cien pasajeros que van en la aeronave. Gracias a sus conocimientos y a la suerte que le acompaña, Whip logra realizar las maniobras oportunas para que el avión no se estrelle, salvando la vida de todos los pasajeros del avión. Su logro no tiene precedentes, ya que para aterrizar decide prácticamente darle la vuelta al avión en una pirueta mortal. Pero las cosas saldrán bien, y de repente, Whit pasará de ser un ciudadano anónimo a un héroe reconocido por todos.\r\n\r\nPero la historia solo acaba de empezar. La investigación pertinente sobre este acontecimiento descubre unos extraños sucesos acaecidos momentos antes del despegue, lo que complicará la situación del protagonista llevándole a unos derroteros insospechados. El héroe al que todos aclaman parece tener un oscuro secreto.',125,23,'2016-05-31 09:53:43','2016-05-31 09:53:43','p13.jpg','image/jpeg',42253,'2016-05-31 09:53:42'),(17,'Kill Bill',4,'2012-03-24 00:00:00','124','En plena celebración de su boda, la Novia sufre un ataque brutal que acaba con la vida de muchos de sus invitados y también del novio. Mamba Negra estaba embarazada y se sumerge en un largo coma que durará hasta cuatro años. Después de este trance, la Novia se despierta y recuerda lo ocurrido. Descubre desconsolada que ha perdido a su hijo y con él todo lo que más quería, así que la sed de venganza contra los responsables de aquella tragedia será infinita. ',90,13,'2016-05-31 09:55:07','2016-05-31 09:55:07','p14.jpg','image/jpeg',72841,'2016-05-31 09:55:06'),(18,'Django desencadenado',2,'2013-12-26 00:00:00','126','\r\n\r\nEstados del Sur de Norteamérica. Unos años antes de la Guerra de Secesión. El ambiente comienza a estar caldeado entre los partidarios de la abolición de la esclavitud y los defensores de mantener sus derechos sobre los hombres y mujeres de raza negra. En medio de esa tensa situación social, un esclavo de nombre Django (Jamie Foxx, \'Ray\') ha sido separado de su esposa Bromhilda (Kerry Washington, \'Ray\') y su mayor esperanza en la vida es poder ser libre algún día para poder ir en su busca y reunirse con ella.\r\n\r\nSe encuentra en manos del malvado Calvin Candie (Leonardo DiCaprio, \'El Gran Gatsby\'), un proxeneta y cruel esclavista que se dedica no solo a prostituir a sus esclavos, sino a obligarles a que luchen entre sí los unos contra los otros en combates a vida o muerte, para así sacar beneficios con las apuestas, en un panorama de degradación moral absoluta. Con un pasado llevo de trauma y dolor, Django verá su oportunidad cuando un médico alemán reconvertido en cazarrecompensas, Dr. King Schultz (Christoph Waltz, \'Malditos bastardos\') lo tome bajo su protección para que le ayude a encontrar la pista de dos de los asesinos más buscados de la región.\r\n\r\nLa química entre ambos hombres será absoluta, y pronto se convertirán en un inusual tándem inseparable de justicieros dispuestos a vengar todas las tropelías que ocurran a su alrededor.\r\nSu última parada, será encontrar al malvado Calvin y a su trouppe de torturadores, entre los que también se encuentra Ace Speck (James Remar, \'Dexter\'), otro sanguinario sádico que entrena a los esclavos para despedazarse entre sí.\r\n',130,26,'2016-05-31 09:56:35','2016-05-31 09:56:35','p15.jpeg','image/jpeg',87371,'2016-05-31 09:56:35'),(19,'Titanic',4,'2017-03-24 00:00:00','127','Jack (Leonardo DiCaprio, \'El gran Gatsby\'), un humilde y joven artista, y Rose (Kate Winslet, \'Un Dios salvaje\'), una chica de clase acomodada, se conocerán a bordo del Titanic, el barco más espectacular que jamás haya surcado los siete mares.\r\n\r\nJack ha ganado el billete en una timba, y sus aposentos en el barco no son precisamete confortables. Por su parte, Rose, no está contenta con su suerte, pues está comprometida con un hombre al que no ama, Caledon (Billy Zane), que la trata como si fuera otra más de sus posesiones, olvidándose de que en realidad es un ser humano.\r\n\r\nLa joven verá en Jack un galán romántico hecho a su medida, pero su amor es imposible debido a las barreras sociales que les separan. Cuando los dos están decididos a luchar por sus sentimientos, el barco choca contra un iceberg, se desata la locura y comienza una lucha generalizada por la supervivencia.\r\n\r\nJames Cameron reconstruye con precisión el hundimiento del famoso trasantlántico, consiguiendo una de las epopeyas románticas más importantes del cine de todos los tiempos. ',165,10,'2016-05-31 09:58:04','2016-05-31 09:58:04','p16.jpg','image/jpeg',28559,'2016-05-31 09:58:04');
/*!40000 ALTER TABLE `films` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum_posts`
--

DROP TABLE IF EXISTS `forum_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forum_posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `root_id` int(11) NOT NULL DEFAULT '0',
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `depth` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum_posts`
--

LOCK TABLES `forum_posts` WRITE;
/*!40000 ALTER TABLE `forum_posts` DISABLE KEYS */;
INSERT INTO `forum_posts` VALUES (2,'Hater','ESDLA no vale nada','La verdad es que me ha decepcionado la saga, esperaba mucho más después de leerme los libros...',2,0,0,'2016-05-31 09:35:49','2016-05-31 09:35:49'),(3,'Anti-Hater','No tienes ni idea','No tienes ni idea de cine, vete a ver series anda!',2,2,1,'2016-05-31 09:36:12','2016-05-31 09:36:12'),(4,'Hater','Vamos a calmarnos','Vamos a calmarnos, no quiero malos rollos, solo era una opinión.',2,3,2,'2016-05-31 09:36:41','2016-05-31 09:36:41'),(5,'Nolan-Lover','Nola eres el DIOS','Nolan, eres el Dios del cine, me encanta tus películas, eres increible.',5,0,0,'2016-05-31 09:37:22','2016-05-31 09:37:22'),(6,'Christopher Nolan','Gracias!','Gracias querido fan, seguiré haciendo estas películas para satisfasceros.',5,5,1,'2016-05-31 09:38:40','2016-05-31 09:38:40'),(8,'Ahyik','Qué esperais de la nueva de Batman?','La verdad es que creo que va a ser alucinante!',8,0,0,'2016-05-31 09:40:17','2016-05-31 09:40:17'),(9,'Batman','No se yo eh...','He leido que los directores no están muy contentos con el resultado.',8,8,1,'2016-05-31 09:40:41','2016-05-31 09:40:41'),(10,'ForoMotos','SUB-POLE!','Sub-pole!',8,8,1,'2016-05-31 09:41:02','2016-05-31 09:41:02'),(11,'Joker','No Joker no Party','Si no sale nuestro amado Joker no creo que valga la pena verla...',8,8,1,'2016-05-31 09:41:41','2016-05-31 09:41:41');
/*!40000 ALTER TABLE `forum_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `film_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_items_orders` (`order_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ship_to_first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ship_to_last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ship_to_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ship_to_city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ship_to_postal_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ship_to_country_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `error_message` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producers`
--

DROP TABLE IF EXISTS `producers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producers`
--

LOCK TABLES `producers` WRITE;
/*!40000 ALTER TABLE `producers` DISABLE KEYS */;
INSERT INTO `producers` VALUES (1,'Universal Studio','2016-05-27 14:21:33','2016-05-27 14:21:33'),(2,'FOX Films','2016-05-31 09:18:43','2016-05-31 09:18:43'),(3,'A3 Media','2016-05-31 09:18:47','2016-05-31 09:18:47'),(4,'Pixar','2016-05-31 09:19:00','2016-05-31 09:19:00');
/*!40000 ALTER TABLE `producers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20130304165555'),('20130304165926'),('20160403125624'),('20160403125625'),('20160411083206'),('20160412123806'),('20160426124750'),('20160426124835'),('20160510122949'),('20160524122950'),('20160530211205'),('20160530211303'),('20160530211405'),('20160530211614'),('20160530211702');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggings`
--

DROP TABLE IF EXISTS `taggings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) DEFAULT NULL,
  `taggable_id` int(11) DEFAULT NULL,
  `taggable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tagger_id` int(11) DEFAULT NULL,
  `tagger_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `context` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `taggings_idx` (`tag_id`,`taggable_id`,`taggable_type`,`context`,`tagger_id`,`tagger_type`),
  KEY `index_taggings_on_taggable_id_and_taggable_type_and_context` (`taggable_id`,`taggable_type`,`context`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggings`
--

LOCK TABLES `taggings` WRITE;
/*!40000 ALTER TABLE `taggings` DISABLE KEYS */;
INSERT INTO `taggings` VALUES (8,7,4,'Film',NULL,NULL,'tags','2016-05-31 09:20:36'),(9,8,4,'Film',NULL,NULL,'tags','2016-05-31 09:20:36'),(10,9,4,'Film',NULL,NULL,'tags','2016-05-31 09:20:36'),(11,10,4,'Film',NULL,NULL,'tags','2016-05-31 09:20:36'),(12,11,5,'Film',NULL,NULL,'tags','2016-05-31 09:22:01'),(13,12,5,'Film',NULL,NULL,'tags','2016-05-31 09:22:01'),(14,13,5,'Film',NULL,NULL,'tags','2016-05-31 09:22:01'),(15,14,5,'Film',NULL,NULL,'tags','2016-05-31 09:22:01'),(16,15,5,'Film',NULL,NULL,'tags','2016-05-31 09:22:01'),(17,16,6,'Film',NULL,NULL,'tags','2016-05-31 09:23:19'),(18,17,6,'Film',NULL,NULL,'tags','2016-05-31 09:23:19'),(19,18,6,'Film',NULL,NULL,'tags','2016-05-31 09:23:19'),(20,19,6,'Film',NULL,NULL,'tags','2016-05-31 09:23:19'),(21,20,6,'Film',NULL,NULL,'tags','2016-05-31 09:23:19'),(22,21,6,'Film',NULL,NULL,'tags','2016-05-31 09:23:19'),(23,22,6,'Film',NULL,NULL,'tags','2016-05-31 09:23:19'),(24,10,6,'Film',NULL,NULL,'tags','2016-05-31 09:23:19'),(25,7,7,'Film',NULL,NULL,'tags','2016-05-31 09:24:50'),(26,23,7,'Film',NULL,NULL,'tags','2016-05-31 09:24:50'),(27,18,7,'Film',NULL,NULL,'tags','2016-05-31 09:24:50'),(28,24,7,'Film',NULL,NULL,'tags','2016-05-31 09:24:50'),(29,25,7,'Film',NULL,NULL,'tags','2016-05-31 09:24:50'),(30,9,7,'Film',NULL,NULL,'tags','2016-05-31 09:24:50'),(31,10,7,'Film',NULL,NULL,'tags','2016-05-31 09:24:50'),(32,26,8,'Film',NULL,NULL,'tags','2016-05-31 09:26:13'),(33,10,8,'Film',NULL,NULL,'tags','2016-05-31 09:26:13'),(34,27,8,'Film',NULL,NULL,'tags','2016-05-31 09:26:13'),(35,28,8,'Film',NULL,NULL,'tags','2016-05-31 09:26:13'),(36,29,9,'Film',NULL,NULL,'tags','2016-05-31 09:27:55'),(37,30,9,'Film',NULL,NULL,'tags','2016-05-31 09:27:55'),(38,31,9,'Film',NULL,NULL,'tags','2016-05-31 09:27:55'),(39,32,9,'Film',NULL,NULL,'tags','2016-05-31 09:27:55'),(40,33,9,'Film',NULL,NULL,'tags','2016-05-31 09:27:55'),(41,7,10,'Film',NULL,NULL,'tags','2016-05-31 09:29:24'),(42,34,10,'Film',NULL,NULL,'tags','2016-05-31 09:29:24'),(43,35,10,'Film',NULL,NULL,'tags','2016-05-31 09:29:24'),(44,9,10,'Film',NULL,NULL,'tags','2016-05-31 09:29:24'),(45,36,10,'Film',NULL,NULL,'tags','2016-05-31 09:29:24'),(46,37,10,'Film',NULL,NULL,'tags','2016-05-31 09:29:24'),(47,38,11,'Film',NULL,NULL,'tags','2016-05-31 09:30:52'),(48,9,11,'Film',NULL,NULL,'tags','2016-05-31 09:30:52'),(49,36,11,'Film',NULL,NULL,'tags','2016-05-31 09:30:52'),(50,10,11,'Film',NULL,NULL,'tags','2016-05-31 09:30:52'),(51,39,11,'Film',NULL,NULL,'tags','2016-05-31 09:30:52'),(52,7,12,'Film',NULL,NULL,'tags','2016-05-31 09:32:29'),(53,40,12,'Film',NULL,NULL,'tags','2016-05-31 09:32:29'),(54,18,12,'Film',NULL,NULL,'tags','2016-05-31 09:32:29'),(55,24,12,'Film',NULL,NULL,'tags','2016-05-31 09:32:29'),(56,41,12,'Film',NULL,NULL,'tags','2016-05-31 09:32:29'),(57,36,12,'Film',NULL,NULL,'tags','2016-05-31 09:32:29'),(58,9,12,'Film',NULL,NULL,'tags','2016-05-31 09:32:29'),(59,42,12,'Film',NULL,NULL,'tags','2016-05-31 09:32:29'),(60,43,13,'Film',NULL,NULL,'tags','2016-05-31 09:33:55'),(61,44,13,'Film',NULL,NULL,'tags','2016-05-31 09:33:55'),(62,9,13,'Film',NULL,NULL,'tags','2016-05-31 09:33:55'),(63,45,13,'Film',NULL,NULL,'tags','2016-05-31 09:33:55'),(64,33,13,'Film',NULL,NULL,'tags','2016-05-31 09:33:55'),(65,24,14,'Film',NULL,NULL,'tags','2016-05-31 09:48:48'),(66,46,14,'Film',NULL,NULL,'tags','2016-05-31 09:48:48'),(67,47,14,'Film',NULL,NULL,'tags','2016-05-31 09:48:48'),(68,9,14,'Film',NULL,NULL,'tags','2016-05-31 09:48:48'),(69,45,14,'Film',NULL,NULL,'tags','2016-05-31 09:48:48'),(70,48,14,'Film',NULL,NULL,'tags','2016-05-31 09:48:48'),(71,49,15,'Film',NULL,NULL,'tags','2016-05-31 09:51:09'),(72,50,15,'Film',NULL,NULL,'tags','2016-05-31 09:51:09'),(73,33,15,'Film',NULL,NULL,'tags','2016-05-31 09:51:09'),(74,10,15,'Film',NULL,NULL,'tags','2016-05-31 09:51:09'),(75,7,16,'Film',NULL,NULL,'tags','2016-05-31 09:53:43'),(76,51,16,'Film',NULL,NULL,'tags','2016-05-31 09:53:43'),(77,9,16,'Film',NULL,NULL,'tags','2016-05-31 09:53:43'),(78,52,16,'Film',NULL,NULL,'tags','2016-05-31 09:53:43'),(79,53,17,'Film',NULL,NULL,'tags','2016-05-31 09:55:07'),(80,54,17,'Film',NULL,NULL,'tags','2016-05-31 09:55:07'),(81,9,17,'Film',NULL,NULL,'tags','2016-05-31 09:55:07'),(82,45,17,'Film',NULL,NULL,'tags','2016-05-31 09:55:07'),(83,55,18,'Film',NULL,NULL,'tags','2016-05-31 09:56:35'),(84,56,18,'Film',NULL,NULL,'tags','2016-05-31 09:56:35'),(85,48,18,'Film',NULL,NULL,'tags','2016-05-31 09:56:35'),(86,45,18,'Film',NULL,NULL,'tags','2016-05-31 09:56:35'),(87,9,18,'Film',NULL,NULL,'tags','2016-05-31 09:56:35'),(88,33,18,'Film',NULL,NULL,'tags','2016-05-31 09:56:35'),(89,57,19,'Film',NULL,NULL,'tags','2016-05-31 09:58:04'),(90,58,19,'Film',NULL,NULL,'tags','2016-05-31 09:58:04'),(91,59,19,'Film',NULL,NULL,'tags','2016-05-31 09:58:04'),(92,10,19,'Film',NULL,NULL,'tags','2016-05-31 09:58:04'),(93,60,19,'Film',NULL,NULL,'tags','2016-05-31 09:58:04');
/*!40000 ALTER TABLE `taggings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `taggings_count` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_tags_on_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'12',0),(2,'anios',0),(3,'soledad',0),(4,'doce',0),(5,'viky',0),(6,'barcelona',0),(7,'el',5),(8,'padrino',1),(9,'accion',10),(10,'drama',7),(11,'on',1),(12,'the',1),(13,'road',1),(14,'carretera',1),(15,'romance',1),(16,'la',1),(17,'lista',1),(18,'de',3),(19,'schindler',1),(20,'judios',1),(21,'nazis',1),(22,'guerra',1),(23,'puente',1),(24,'los',3),(25,'espias',1),(26,'intocable',1),(27,'bonita',1),(28,'emotiva',1),(29,'aquellos',1),(30,'dias',1),(31,'felices',1),(32,'felicidad',1),(33,'comedia',4),(34,'caballero',1),(35,'oscuro',1),(36,'ciencia',3),(37,'ficcion',1),(38,'interstellar',1),(39,'espacio',1),(40,'senor',1),(41,'anillos',1),(42,'fantasia',1),(43,'pulp',1),(44,'fiction',1),(45,'gore',4),(46,'odiosos',1),(47,'ochos',1),(48,'tiros',2),(49,'forrest',1),(50,'gump',1),(51,'vuelo',1),(52,'terror',1),(53,'kill',1),(54,'bill',1),(55,'django',1),(56,'desencadenado',1),(57,'titanic',1),(58,'barco',1),(59,'frio',1),(60,'hundimiento',1);
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `login` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `crypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `persistence_token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `perishable_token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `login_count` int(11) NOT NULL DEFAULT '0',
  `failed_login_count` int(11) NOT NULL DEFAULT '0',
  `last_request_at` datetime DEFAULT NULL,
  `current_login_at` datetime DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL,
  `current_login_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_login_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin','admin@uca.es','221fe99b0a00b0b5e60c4dba04a2b80b32dffcb3b5c3f7c3e2e34e71aacb603ff99ca62ea44ce25051d521cbd639e5ea3a1bea58787fb87c3450f5e9d044a9f7','jAnSa9rBwgISsiQ6t0b','0e9825594a8d7362ed1b6d92090bd9bfbd6cab2085488a8d6ea01b9517e955518eeb88bd7bb3a59b2bd1c8bf54cf4ba820eb1f615314a7531a91299fe1c222d0','xVZQichH7eMDmv796Wcc',9,0,'2016-05-31 09:58:06','2016-05-31 09:56:50','2016-05-31 09:35:01','127.0.0.1','127.0.0.1','2016-05-27 14:21:03','2016-05-31 09:58:06');
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

-- Dump completed on 2016-05-31 12:14:51
