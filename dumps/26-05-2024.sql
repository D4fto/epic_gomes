CREATE DATABASE  IF NOT EXISTS `pedro_henrique_tunes_degasperi_loja_jogos` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `pedro_henrique_tunes_degasperi_loja_jogos`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: pedro_henrique_tunes_degasperi_loja_jogos
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `analises`
--

DROP TABLE IF EXISTS `analises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `analises` (
  `id_analise` int NOT NULL AUTO_INCREMENT,
  `usuario_email` varchar(345) NOT NULL,
  `jogos_id_jogos` int NOT NULL,
  `texto` mediumtext,
  `avaliacao` int DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `status_id_status` int NOT NULL,
  PRIMARY KEY (`id_analise`),
  KEY `fk_analises_jogos1_idx` (`jogos_id_jogos`),
  KEY `fk_analises_usuario1_idx` (`usuario_email`),
  KEY `fk_analises_status1_idx` (`status_id_status`),
  CONSTRAINT `fk_analises_jogos1` FOREIGN KEY (`jogos_id_jogos`) REFERENCES `jogos` (`id_jogos`),
  CONSTRAINT `fk_analises_status1` FOREIGN KEY (`status_id_status`) REFERENCES `status` (`id_status`),
  CONSTRAINT `fk_analises_usuario1` FOREIGN KEY (`usuario_email`) REFERENCES `usuarios` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=33145 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analises`
--

LOCK TABLES `analises` WRITE;
/*!40000 ALTER TABLE `analises` DISABLE KEYS */;
INSERT INTO `analises` VALUES (1,'111@gmail.com',304430,'\"Inside\" é uma obra-prima do gênero de quebra-cabeças e plataforma, desenvolvido pela Playdead. Com uma narrativa intrigante e uma atmosfera envolvente, este jogo cativa os jogadores desde os primeiros momentos até o final arrebatador.\\nDesde o início, \"Inside\" mergulha os jogadores em um mundo sombrio e misterioso, onde assumem o controle de um jovem explorador. A jogabilidade é simples, mas eficaz, com controles responsivos que permitem aos jogadores explorar o ambiente e resolver uma variedade de quebra-cabeças ambientais desafiadores.\\nO que realmente diferencia \"Inside\" é sua narrativa sutil e intrigante. Sem diálogos ou texto explicativo, o jogo conta sua história através de imagens e eventos ambientais, convidando os jogadores a interpretar e decifrar seu significado. Essa abordagem não linear cria uma experiência imersiva e estimulante, onde cada descoberta revela novas camadas de mistério e intriga.\\nAlém disso, a estética visual de \"Inside\" é impressionante. Os gráficos são minimalistas, mas lindamente renderizados, com uma paleta de cores sombria e atmosférica que adiciona profundidade ao mundo do jogo. A trilha sonora também desempenha um papel crucial na criação de uma atmosfera assombrosa, com músicas sutis que ampliam a sensação de suspense e tensão.\\nNo entanto, \"Inside\" não é apenas sobre sua história e atmosfera. Os quebra-cabeças são o cerne da experiência, desafiando os jogadores a pensar de forma criativa e encontrar soluções para os obstáculos que encontram pelo caminho. A dificuldade aumenta de forma constante, mas justa, mantendo os jogadores engajados e motivados até o final.\\nEm suma, \"Inside\" é um jogo excepcional que combina uma narrativa envolvente, uma atmosfera sombria e quebra-cabeças desafiadores para criar uma experiência verdadeiramente inesquecível. Se você é fã de jogos indie que exploram temas profundos e complexos, não deixe de conferir este título notável.',1,NULL,NULL,11),(2,'222@gmail.com',1086940,'\"Baldur\'s Gate 3\" é uma jornada épica e ambiciosa que retoma o legado da série clássica, trazendo uma nova geração de jogadores para os Reinos Esquecidos com sua narrativa envolvente e jogabilidade rica. Desenvolvido pela Larian Studios, este RPG mantém a essência do universo de Dungeons & Dragons enquanto oferece uma experiência contemporânea e emocionante.\\nO ponto central de \"Baldur\'s Gate 3\" é sua narrativa intrincada e ramificada. Ambientado no mundo vibrante e perigoso dos Reinos Esquecidos, o jogo coloca os jogadores no papel de aventureiros inexperientes que se veem envolvidos em uma trama de intriga, magia e conflito. Cada decisão que os jogadores tomam molda o curso da história, criando uma experiência verdadeiramente personalizada e imersiva.\\nOs personagens são outro destaque de \"Baldur\'s Gate 3\". Desde os companheiros de equipe até os antagonistas, cada personagem é habilmente escrito e desenvolvido, com histórias complexas e motivações profundas. O diálogo é afiado e cheio de humor, adicionando uma camada de humanidade aos personagens e tornando as interações ainda mais cativantes.\\nA jogabilidade de \"Baldur\'s Gate 3\" é uma fusão hábil de elementos clássicos e modernos. O sistema de combate baseado em turnos permite aos jogadores enfrentar desafios táticos emocionantes, enquanto a exploração livre do mundo aberto proporciona uma sensação de liberdade e descoberta. A personalização do personagem é profunda e flexível, permitindo que os jogadores desenvolvam seus aventureiros de acordo com seu estilo de jogo preferido.\\nVisualmente, \"Baldur\'s Gate 3\" é deslumbrante. Os gráficos são impressionantes, com ambientes detalhados e personagens ricamente renderizados. A trilha sonora também merece elogios, com composições atmosféricas que complementam perfeitamente a atmosfera do jogo.\\nNo entanto, \"Baldur\'s Gate 3\" não é perfeito. Como ainda está em acesso antecipado, alguns bugs e problemas de desempenho podem atrapalhar a experiência. No entanto, a Larian Studios tem sido diligente em fornecer atualizações regulares e correções de bugs, o que mostra um compromisso com a melhoria contínua do jogo.\\nEm resumo, \"Baldur\'s Gate 3\" é uma adição digna à lendária série de RPGs. Com uma narrativa rica, personagens cativantes e jogabilidade envolvente, este é um jogo que atrairá tanto os fãs antigos quanto os novos para os Reinos Esquecidos.',1,NULL,NULL,11),(3,'333@gmail.com',620,'\"Portal 2\" é uma obra-prima do gênero de quebra-cabeças em primeira pessoa que eleva a criatividade e a narrativa interativa a um novo patamar. Desenvolvido pela Valve, este jogo é uma sequência do aclamado \"Portal\", expandindo e aprimorando todos os elementos que tornaram o original tão amado.\\nO cerne de \"Portal 2\" é seu design de quebra-cabeças inteligente e desafiador. Os jogadores assumem o papel de Chell, uma protagonista silenciosa que se vê presa em um laboratório controlado por uma inteligência artificial malévola chamada GLaDOS. Usando o dispositivo de portal, os jogadores devem resolver uma série de quebra-cabeças engenhosos, que exigem raciocínio espacial e pensamento criativo para serem superados.\\nO que torna os quebra-cabeças de \"Portal 2\" tão cativantes é a maneira como eles se baseiam em um conjunto simples de regras, mas permitem uma variedade surpreendente de soluções. Cada câmara de teste é como um quebra-cabeça em constante evolução, desafiando os jogadores a pensar fora da caixa e experimentar com novas abordagens. A curva de dificuldade é perfeitamente equilibrada, proporcionando um desafio gratificante sem ser frustrante.\\nAlém dos quebra-cabeças, \"Portal 2\" também brilha em sua narrativa e personagens. GLaDOS retorna como uma antagonista carismática e hilária, cujas observações sarcásticas acrescentam uma camada adicional de humor à experiência. Novos personagens, como Wheatley, um robô de personalidade excêntrica, também se destacam, adicionando profundidade à história e ao mundo do jogo.\\nVisualmente, \"Portal 2\" é deslumbrante. Os ambientes do laboratório Aperture Science são meticulosamente detalhados, com uma estética futurista e industrial que adiciona uma sensação de imersão à experiência. A trilha sonora também merece elogios, com composições atmosféricas que complementam perfeitamente a atmosfera do jogo.\\nAlém da campanha para um jogador, \"Portal 2\" também apresenta um modo cooperativo robusto, onde dois jogadores assumem o controle de robôs chamados Atlas e P-body. Este modo oferece uma série de quebra-cabeças exclusivos que exigem cooperação e comunicação entre os jogadores, proporcionando uma experiência multiplayer única e gratificante.\\nEm resumo, \"Portal 2\" é um exemplo exemplar de design de jogos criativos e envolventes. Com quebra-cabeças desafiadores, uma narrativa inteligente e personagens memoráveis, este é um jogo que permanecerá na memória dos jogadores por muitos anos após o seu lançamento. Seja você fã de quebra-cabeças ou apenas apreciador de uma boa história, \"Portal 2\" é uma experiência que não deve ser desperdiçada.',1,NULL,NULL,11),(4,'333@gmail.com',960090,'\"Bloons TD 6\" é um jogo de defesa de torres que combina estratégia, ação e diversão em um pacote viciante. Desenvolvido pela Ninja Kiwi, este título é a sexta entrada na popular série \"Bloons\", e continua a tradição de oferecer uma experiência de jogo envolvente e desafiadora.\\nEm \"Bloons TD 6\", os jogadores enfrentam hordas de balões coloridos que tentam atravessar um labirinto de torres de defesa. Cada balão possui características diferentes, desde simples balões vermelhos até balões blindados e até mesmo balões com poderes especiais. Os jogadores devem usar uma combinação inteligente de torres e habilidades especiais para estourar os balões antes que eles alcancem o fim do caminho.\\nUma das principais características de \"Bloons TD 6\" é a variedade de torres disponíveis para os jogadores. Desde torres básicas de dardos até canhões de plasma e lançadores de foguetes, há uma ampla gama de opções para os jogadores experimentarem e personalizarem suas estratégias de defesa. Além disso, cada torre pode ser atualizada e personalizada com melhorias únicas, adicionando uma camada adicional de profundidade estratégica ao jogo.\\nOutro aspecto cativante de \"Bloons TD 6\" é a sua jogabilidade acessível e viciante. Os controles são simples e intuitivos, permitindo que os jogadores concentrem sua atenção na elaboração de estratégias e na coordenação de ataques contra os balões invasores. A curva de aprendizado é suave, tornando o jogo acessível para jogadores de todos os níveis de habilidade.\\nVisualmente, \"Bloons TD 6\" é vibrante e colorido, com gráficos nítidos e animações suaves que tornam cada explosão de balão uma festa visual. A trilha sonora e os efeitos sonoros também são alegres e cativantes, adicionando uma dose extra de diversão à experiência de jogo.\\nEm suma, \"Bloons TD 6\" é um jogo de defesa de torres divertido, desafiador e viciante que oferece horas de entretenimento para jogadores de todas as idades. Com sua variedade de torres, jogabilidade acessível e visuais encantadores, este é um jogo que certamente conquistará tanto os fãs antigos quanto os novos da série \"Bloons\".',1,NULL,NULL,11),(5,'pedrohenriquetunes1@gmail.com',359060,'Apaga, apenas apaga',0,NULL,NULL,9);
/*!40000 ALTER TABLE `analises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filtro_tipos`
--

DROP TABLE IF EXISTS `filtro_tipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filtro_tipos` (
  `id_filtro_tipo` int NOT NULL AUTO_INCREMENT,
  `tipo_nome` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_filtro_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filtro_tipos`
--

LOCK TABLES `filtro_tipos` WRITE;
/*!40000 ALTER TABLE `filtro_tipos` DISABLE KEYS */;
INSERT INTO `filtro_tipos` VALUES (1,'genero'),(2,'idioma'),(3,'SO'),(4,'compatibilidade com RV'),(5,'recurso');
/*!40000 ALTER TABLE `filtro_tipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filtros`
--

DROP TABLE IF EXISTS `filtros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filtros` (
  `id_filtro` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) DEFAULT NULL,
  `filtro_tipo_id_filtro_tipo` int NOT NULL,
  PRIMARY KEY (`id_filtro`),
  KEY `fk_filtros_filtro_tipo1_idx` (`filtro_tipo_id_filtro_tipo`),
  CONSTRAINT `fk_filtros_filtro_tipo1` FOREIGN KEY (`filtro_tipo_id_filtro_tipo`) REFERENCES `filtro_tipos` (`id_filtro_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filtros`
--

LOCK TABLES `filtros` WRITE;
/*!40000 ALTER TABLE `filtros` DISABLE KEYS */;
INSERT INTO `filtros` VALUES (1,'FPS',1),(2,'Battle Royale',1),(3,'PVP',1),(4,'MOBA',1),(5,'RPG',1),(6,'Aventura',1),(7,'Simulação',1),(8,'Português (Brasil)',2),(9,'Chinês simplificado',2),(10,'Chinês tradicional',2),(11,'Japonês',2),(12,'Alemão',2),(13,'Inglês',2),(14,'Espanhol (Espanha)',2),(15,'Espanhol (América Latina)',2),(16,'Francês',2),(17,'Italiano',2),(18,'Windows',3),(19,'macOS',3),(20,'SteamOS + Linux',3),(21,'Roguelike',1),(22,'Sandbox',1),(23,'Metroidvania',1),(24,'Indie',1),(25,'2D',1),(26,'3D',1),(27,'Difícil',1),(28,'Soulslike',1),(29,'Um Jogador',1),(30,'Plataforma',1),(31,'Mundo Aberto',1),(32,'Primeira Pessoa',1),(33,'Engraçado',1),(34,'Cooperativo',1);
/*!40000 ALTER TABLE `filtros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jogo_has_contents`
--

DROP TABLE IF EXISTS `jogo_has_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jogo_has_contents` (
  `jogos_id_jogos` int NOT NULL,
  `ordem` int NOT NULL,
  `content` text,
  PRIMARY KEY (`jogos_id_jogos`,`ordem`),
  CONSTRAINT `fk_jogo_has_img_jogos1` FOREIGN KEY (`jogos_id_jogos`) REFERENCES `jogos` (`id_jogos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jogo_has_contents`
--

LOCK TABLES `jogo_has_contents` WRITE;
/*!40000 ALTER TABLE `jogo_has_contents` DISABLE KEYS */;
INSERT INTO `jogo_has_contents` VALUES (620,1,'Video'),(620,2,'Foto'),(620,3,'Foto'),(4000,1,'Video'),(4000,2,'Foto'),(4000,3,'Foto'),(4000,4,'Foto'),(1677740,1,'Foto'),(1677740,2,'Foto'),(1677740,3,'Foto');
/*!40000 ALTER TABLE `jogo_has_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jogo_has_filtros`
--

DROP TABLE IF EXISTS `jogo_has_filtros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jogo_has_filtros` (
  `filtros_id_filtro` int NOT NULL,
  `jogos_id_jogos` int NOT NULL,
  PRIMARY KEY (`filtros_id_filtro`,`jogos_id_jogos`),
  KEY `fk_jogo_has_genero_jogos1_idx` (`jogos_id_jogos`),
  CONSTRAINT `fk_jogo_has_genero_generos` FOREIGN KEY (`filtros_id_filtro`) REFERENCES `filtros` (`id_filtro`),
  CONSTRAINT `fk_jogo_has_genero_jogos1` FOREIGN KEY (`jogos_id_jogos`) REFERENCES `jogos` (`id_jogos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jogo_has_filtros`
--

LOCK TABLES `jogo_has_filtros` WRITE;
/*!40000 ALTER TABLE `jogo_has_filtros` DISABLE KEYS */;
INSERT INTO `jogo_has_filtros` VALUES (1,620),(6,620),(7,620),(8,620),(13,620),(18,620),(30,620),(32,620),(33,620),(3,4000),(13,4000),(3,271590),(13,271590),(18,271590),(3,381210),(8,381210),(18,381210),(6,1030300),(8,1030300),(9,1030300),(11,1030300),(12,1030300),(13,1030300),(14,1030300),(16,1030300),(17,1030300),(18,1030300),(23,1030300),(24,1030300),(25,1030300),(27,1030300),(28,1030300),(29,1030300),(30,1030300),(31,1030300),(3,1517290),(13,1517290);
/*!40000 ALTER TABLE `jogo_has_filtros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jogos`
--

DROP TABLE IF EXISTS `jogos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jogos` (
  `id_jogos` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) DEFAULT NULL,
  `qtd_vendas` int DEFAULT '0',
  `cover_img` text,
  `desconto` double DEFAULT '0',
  `data_lancamento` date DEFAULT NULL,
  `avaliacao` float DEFAULT '-1',
  `desenvolvedor` varchar(200) DEFAULT NULL,
  `descricao` text,
  `status_id_status` int NOT NULL,
  PRIMARY KEY (`id_jogos`),
  KEY `fk_jogos_status1_idx` (`status_id_status`),
  CONSTRAINT `fk_jogos_status1` FOREIGN KEY (`status_id_status`) REFERENCES `status` (`id_status`)
) ENGINE=InnoDB AUTO_INCREMENT=2923304 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jogos`
--

LOCK TABLES `jogos` WRITE;
/*!40000 ALTER TABLE `jogos` DISABLE KEYS */;
INSERT INTO `jogos` VALUES (570,'Dota 2',912562645,'./assets/imgs/Dota_2.jpg',0,'2013-07-09',4.75,'Valve',NULL,1),(620,'Portal 2',877787653,'./assets/imgs/Portal_2.jpg',66,'2011-04-19',5,'Valve',NULL,1),(4000,'Garry\'s Mod',515964313,'./assets/imgs/Garrys_Mod.jpg',0,'2006-11-29',4.5,' Facepunch Studios',NULL,1),(207140,'SpeedRunners',418996216,'./assets/imgs/SpeedRunners.jpg',66,'2016-04-19',4,'DoubleDutch Games',NULL,1),(271590,'Grand Theft Auto V',645165165,'./assets/imgs/Grand_Theft_Auto_V.jpeg',66,'2015-04-14',4,'Rockstar North',NULL,1),(304430,'INSIDE',415484112,'./assets/imgs/INSIDE.png',0,'2016-07-07',5,'Playdead',NULL,1),(312520,'Rain World',415615641,'./assets/imgs/rain_world.png',65,'2017-03-28',5,'Videocult',NULL,1),(319510,'Five Nights at Freddys',451466345,'./assets/imgs/Five_Nights_at_Freddys.jpg',0,'2014-08-18',4.49,'Scott Cawthon',NULL,1),(322330,'Don\'t Starve Together',757547551,'./assets/imgs/Dont_Starve_Together.jpg',0,'2016-04-21',5,'Klei Entertainment',NULL,1),(359060,'Switch Galaxy Ultra',30,'./assets/imgs/Switch_Galaxy_Ultra.jpg',0,'2015-11-20',1,'Atomicom Limited',NULL,1),(359550,'Tom Clancy\'s Rainbow Six® Siege',596413879,'./assets/imgs/Call_of_Duty®_Warzone™.jpg',0,'2015-12-01',4,'Ubisoft Montreal',NULL,1),(367520,'Hollow Knight',645844512,'./assets/imgs/Hollow_Knight.jpg',0,'2017-02-24',5,'Team Cherry',NULL,1),(377160,'Fallout 4',621651613,'./assets/imgs/Fallout_4.jpg',0,'2015-11-10',4,'Bethesda Game Studios',NULL,1),(381210,'Dead by Daylight',987654321,'./assets/imgs/Dead_by_Daylight.png',0,'2016-06-14',4,'Behaviour Interactive Inc.',NULL,1),(413150,'Stardew Valley',654161321,'./assets/imgs/Stardew_Valley.png',50,'2016-02-26',5,'ConcernedApe',NULL,1),(504230,'Celeste',445452312,'./assets/imgs/Celeste.png',0,'2018-01-25',5,'Maddy Makes Games Inc., Extremely OK Games, Ltd.',NULL,1),(584640,'SUPER CHICKEN JUMPER',459614213,'./assets/imgs/SUPER_CHICKEN_JUMPER.jpg',0,'2021-09-24',5,'Sewer Cat, Heavy Sheep',NULL,1),(648800,'Raft',951151231,'./assets/imgs/Raft.jpg',50,'2022-06-20',4,'Redbeet Interactive',NULL,1),(700100,'Spooky Station',564261465,'./assets/imgs/Spooky_Station.png',0,'2019-10-29',5,'Coletivo Vaca Roxa, Vee, JoyMasher, PKO Game Studio, Spookids Team, Calangames, Expresso Studios, Pastel Studios, Heavy Sheep, LASTONE, Asteristic Game Studio',NULL,1),(960090,'Bloons TD 6',415691531,'./assets/imgs/Bloons_TD_6.jpg',0,'2018-12-17',4,'Ninja Kiwi',NULL,1),(1030300,'Hollow Knight: Silksong',654198499,'./assets/imgs/Hollow_Knight_Silksong.png',90,'2025-04-10',5,'Team Cherry',NULL,1),(1085660,'Destiny 2',456164519,'./assets/imgs/Destiny_2.jpg',0,'2019-10-01',4,'Bungie',NULL,1),(1086940,'Baldur\'s Gate 3',415612339,'./assets/imgs/Baldurs_Gate_3.png',0,'2023-08-03',5,'Larian Studios',NULL,1),(1145350,'Hades II',534343532,'./assets/imgs/Hades_2.jpeg',95,'2024-05-06',4,'Supergiant Games',NULL,1),(1222670,'The Sims™ 4',415641459,'./assets/imgs/The_Sims™_4.png',0,'2014-09-02',4,'Maxis',NULL,1),(1363080,'Manor Lords',159612200,'./assets/imgs/Manor_Lords.png',25,'2024-04-26',4,'Slavic Magic',NULL,1),(1424240,'Mineirinho Classic (Miner Ultra Adventures)',546516000,'./assets/imgs/Mineirinho_Classic_(Miner_Ultra_Adventures).jpg',0,'2020-09-24',2,'Sinned Games',NULL,1),(1431230,'Gods of Sand',456112365,'./assets/imgs/Gods_of_Sand.jpg',0,'2022-02-07',5,'Achenar Studios, Sad Socket',NULL,1),(1507580,'Enigma do Medo',546569785,'./assets/imgs/Enigma_do_Medo.jpg',0,'2057-12-31',5,' Dumativa, Cellbit',NULL,1),(1517290,'Battlefield™ 2042',156020651,'./assets/imgs/Battlefield™_2042.jpg',87,'2021-11-19',3,'DICE',NULL,1),(1677740,'Stumble Guys',459646921,'./assets/imgs/Stumble_Guys.jpeg',0,'2021-10-07',4,'Scopely',NULL,1),(1887840,'Another Crab\'s Treasure',596145623,'./assets/imgs/Another_Crabs_Treasure.png',0,'2024-04-25',4,'Aggro\'s Crab',NULL,1),(1919460,'Seraph\'s Last Stand',231654976,'./assets/imgs/Seraphs_Last_Stand.png',0,'2022-03-23',5,'Sad Socket',NULL,1),(1962663,'Call of Duty®: Warzone™',944132133,'./assets/imgs/Call_of_Duty®_Warzone™.jpg',0,'2022-11-16',3.7,'Infinity Ward, Raven Software, Beenox, Treyarch, High Moon Studios, Sledgehammer Games, Activision Shanghai, Demonware, Toys for Bob',NULL,1),(2663530,'POOLS',464465432,'./assets/imgs/POOLS.jpg',0,'2024-04-26',4,'Tensori',NULL,1),(2835570,'Buckshot Roulette',145616632,'./assets/imgs/Buckshot_Roulette.jpeg',0,'2024-04-04',5,'Mike Klubnika',NULL,1),(2923300,'Banana',154961312,'./assets/imgs/banana.jpg',0,'2024-04-23',5,'aaladin66',NULL,1),(2923301,'Terraria',0,'https://upload.wikimedia.org/wikipedia/en/1/1a/Terraria_Steam_artwork.jpg',0,'2011-05-16',5,'re-logic',NULL,1),(2923302,'League of Legends',0,'https://i.pinimg.com/originals/c5/6c/77/c56c774ee09e3e16bf12460dea765109.jpg',0,'2009-07-14',1.2,'Riot Games',NULL,1),(2923303,'League of Legends2',0,'ljljghhljhll',0,'2009-07-14',2,'413f1ghjhh',NULL,1);
/*!40000 ALTER TABLE `jogos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_has_jogos`
--

DROP TABLE IF EXISTS `pedido_has_jogos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_has_jogos` (
  `jogos_id_jogos` int NOT NULL,
  `pedido_id_pedido` int NOT NULL,
  `email` varchar(345) DEFAULT NULL,
  PRIMARY KEY (`jogos_id_jogos`,`pedido_id_pedido`),
  KEY `fk_carrinho_has_jogo_jogos1_idx` (`jogos_id_jogos`),
  KEY `fk_pedido_has_jogo_pedido1_idx` (`pedido_id_pedido`),
  CONSTRAINT `fk_carrinho_has_jogo_jogos1` FOREIGN KEY (`jogos_id_jogos`) REFERENCES `jogos` (`id_jogos`),
  CONSTRAINT `fk_pedido_has_jogo_pedido1` FOREIGN KEY (`pedido_id_pedido`) REFERENCES `pedidos` (`id_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_has_jogos`
--

LOCK TABLES `pedido_has_jogos` WRITE;
/*!40000 ALTER TABLE `pedido_has_jogos` DISABLE KEYS */;
INSERT INTO `pedido_has_jogos` VALUES (620,4,'111@gmail.com'),(271590,3,NULL),(304430,1,NULL),(413150,3,NULL),(648800,5,NULL),(960090,2,NULL),(960090,4,NULL),(1086940,2,NULL),(1424240,4,'111@gmail.com'),(2835570,4,NULL);
/*!40000 ALTER TABLE `pedido_has_jogos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `id_pedido` int NOT NULL AUTO_INCREMENT,
  `usuario_email` varchar(345) NOT NULL,
  `data_hora_pedido` datetime DEFAULT NULL,
  `status_id_status` int NOT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `fk_pedido_status1_idx` (`status_id_status`),
  KEY `fk_pedido_usuario1_idx` (`usuario_email`),
  CONSTRAINT `fk_pedido_status1` FOREIGN KEY (`status_id_status`) REFERENCES `status` (`id_status`),
  CONSTRAINT `fk_pedido_usuario1` FOREIGN KEY (`usuario_email`) REFERENCES `usuarios` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,'111@gmail.com','2018-03-21 15:03:24',8),(2,'222@gmail.com','2019-03-21 16:12:24',8),(3,'111@gmail.com','2019-05-21 15:03:24',5),(4,'666@gmail.com','2020-12-12 05:01:01',8),(5,'666@gmail.com','2024-05-13 07:09:28',6);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preco_jogos`
--

DROP TABLE IF EXISTS `preco_jogos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preco_jogos` (
  `jogos_id_jogos` int NOT NULL,
  `data_preco_jogo` date NOT NULL,
  `preco_jogo` double DEFAULT NULL,
  PRIMARY KEY (`jogos_id_jogos`,`data_preco_jogo`),
  CONSTRAINT `fk_preco_jogo_jogos1` FOREIGN KEY (`jogos_id_jogos`) REFERENCES `jogos` (`id_jogos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preco_jogos`
--

LOCK TABLES `preco_jogos` WRITE;
/*!40000 ALTER TABLE `preco_jogos` DISABLE KEYS */;
INSERT INTO `preco_jogos` VALUES (570,'2013-07-09',0),(620,'2011-04-19',32.99),(4000,'2006-11-29',25.99),(4000,'2006-12-29',19.99),(207140,'2016-04-19',46.99),(271590,'2015-04-14',82.35),(304430,'2016-07-07',79.99),(312520,'2017-03-28',73.99),(319510,'2014-08-18',10.89),(322330,'2016-04-21',27.99),(359060,'2015-11-20',1.99),(359550,'2015-12-01',84.99),(367520,'2017-02-24',46.99),(377160,'2015-11-10',59.99),(381210,'2016-06-14',59.97),(413150,'2016-02-26',24.99),(504230,'2018-01-25',59.99),(584640,'2021-09-24',10.89),(648800,'2022-06-20',36.99),(700100,'2019-10-29',9.99),(960090,'2018-12-17',27.89),(1030300,'2025-04-10',46.99),(1085660,'2019-10-01',0),(1086940,'2023-08-03',199.99),(1145350,'2024-05-06',88.99),(1222670,'2014-09-02',0),(1363080,'2024-04-26',99.99),(1424240,'2020-09-24',3.49),(1431230,'2022-02-07',17.99),(1507580,'2057-12-31',49.99),(1517290,'2021-11-19',249),(1677740,'2021-10-07',0),(1887840,'2024-04-25',87.99),(1919460,'2022-03-23',3.15),(1962663,'2022-11-16',0),(2663530,'2024-04-26',32.99),(2835570,'2024-04-04',9.99),(2923300,'2024-04-23',0),(2923301,'2011-05-16',32.99),(2923302,'2009-07-14',0);
/*!40000 ALTER TABLE `preco_jogos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `id_status` int NOT NULL AUTO_INCREMENT,
  `nome_status` varchar(45) DEFAULT NULL,
  `tipo_status_id_tipo_status` int NOT NULL,
  PRIMARY KEY (`id_status`),
  KEY `fk_status_tipo_status1_idx` (`tipo_status_id_tipo_status`),
  CONSTRAINT `fk_status_tipo_status1` FOREIGN KEY (`tipo_status_id_tipo_status`) REFERENCES `tipo_status` (`id_tipo_status`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'disponível',1),(2,'indisponível',1),(3,'ativo',2),(4,'inativo',2),(5,'No carrinho',3),(6,'Finalizando',3),(7,'Agauardando pagamento',3),(8,'Finalizado',3),(9,'Deletado',4),(10,'Oculto',4),(11,'Visível',4);
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_status`
--

DROP TABLE IF EXISTS `tipo_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_status` (
  `id_tipo_status` int NOT NULL AUTO_INCREMENT,
  `nome_tipo_status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_status`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_status`
--

LOCK TABLES `tipo_status` WRITE;
/*!40000 ALTER TABLE `tipo_status` DISABLE KEYS */;
INSERT INTO `tipo_status` VALUES (1,'jogo'),(2,'usuário'),(3,'pedido'),(4,'analise'),(5,'sim');
/*!40000 ALTER TABLE `tipo_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_usuario`
--

DROP TABLE IF EXISTS `tipo_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_usuario` (
  `id_tipo_usuario` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_usuario`
--

LOCK TABLES `tipo_usuario` WRITE;
/*!40000 ALTER TABLE `tipo_usuario` DISABLE KEYS */;
INSERT INTO `tipo_usuario` VALUES (1,'cliente'),(2,'Suporte'),(3,'Admin'),(4,'Dev'),(5,'Auxiliar');
/*!40000 ALTER TABLE `tipo_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_has_jogos`
--

DROP TABLE IF EXISTS `usuario_has_jogos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_has_jogos` (
  `usuario_email` varchar(345) NOT NULL,
  `jogos_id_jogos` int NOT NULL,
  `tempo_jogo` int DEFAULT NULL,
  `ultima_sessao` datetime DEFAULT NULL,
  PRIMARY KEY (`usuario_email`,`jogos_id_jogos`),
  KEY `fk_usuario_has_jogo_jogos1_idx` (`jogos_id_jogos`),
  KEY `fk_usuario_has_jogo_usuario1_idx` (`usuario_email`),
  CONSTRAINT `fk_usuario_has_jogo_jogos1` FOREIGN KEY (`jogos_id_jogos`) REFERENCES `jogos` (`id_jogos`),
  CONSTRAINT `fk_usuario_has_jogo_usuario1` FOREIGN KEY (`usuario_email`) REFERENCES `usuarios` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_has_jogos`
--

LOCK TABLES `usuario_has_jogos` WRITE;
/*!40000 ALTER TABLE `usuario_has_jogos` DISABLE KEYS */;
INSERT INTO `usuario_has_jogos` VALUES ('111@gmail.com',620,1234514,'2020-05-02 14:04:45'),('111@gmail.com',304430,6541651,'2023-05-02 13:04:45'),('111@gmail.com',1424240,4564512,'2023-05-12 23:04:45'),('222@gmail.com',960090,98784653,'2022-11-02 03:54:45'),('222@gmail.com',1086940,46416548,'2023-07-23 14:04:45'),('666@gmail.com',960090,59645432,'2023-05-02 10:54:45'),('666@gmail.com',2835570,4651113,'2023-05-02 13:04:05');
/*!40000 ALTER TABLE `usuario_has_jogos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `email` varchar(345) NOT NULL,
  `cpf_cnpj` varchar(14) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `senha` varchar(300) DEFAULT NULL,
  `nome_usuario` varchar(64) DEFAULT NULL,
  `usuario_imagem` text,
  `tipo_usuario_id_tipo_usuario` int NOT NULL,
  `status_id_status` int NOT NULL,
  PRIMARY KEY (`email`),
  UNIQUE KEY `nome_usuario_UNIQUE` (`nome_usuario`),
  UNIQUE KEY `cpf/cnpj_UNIQUE` (`cpf_cnpj`),
  KEY `fk_usuario_status1_idx` (`status_id_status`),
  KEY `fk_usuario_tipo_usuario1_idx` (`tipo_usuario_id_tipo_usuario`),
  CONSTRAINT `fk_usuario_status1` FOREIGN KEY (`status_id_status`) REFERENCES `status` (`id_status`),
  CONSTRAINT `fk_usuario_tipo_usuario1` FOREIGN KEY (`tipo_usuario_id_tipo_usuario`) REFERENCES `tipo_usuario` (`id_tipo_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES ('111@gmail.com',NULL,'2000-05-01','111','sir_marcelo','Imagem_muito_massa',1,3),('222@gmail.com',NULL,'1998-05-26','222','opala4portas','Imagem_muito_massa',1,3),('333@gmail.com','111','1976-09-27','333','Adélia129','Imagem_muito_massa',2,3),('444@gmail.com','222',NULL,'444','Roberto\'s Entretreiment','Imagem_muito_massa',4,3),('555@gmail.com','333','1968-04-30','555','LucasLegal53','Imagem_muito_massa',4,3),('666@gmail.com',NULL,'2004-02-29','666','Matiolitos','Imagem_muito_massa',1,3),('pedrohenriquetunes1@gmail.com',NULL,'2008-07-07','777','D4fto','Imagem_muito_massa',3,3);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-26 19:36:49
