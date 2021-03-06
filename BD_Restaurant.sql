CREATE DATABASE `restaurant` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_spanish_ci */;

CREATE TABLE `users` (
  `id` char(40) COLLATE latin1_spanish_ci NOT NULL,
  `userName` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `password` varchar(100) COLLATE latin1_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci

CREATE TABLE `food` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE latin1_spanish_ci DEFAULT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci

CREATE TABLE `order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `idUser` char(40) COLLATE latin1_spanish_ci NOT NULL,
  `dateOrder` date DEFAULT NULL,
  `hour` time DEFAULT NULL,
  `price` float DEFAULT NULL,
  `address` varchar(100) COLLATE latin1_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_FK` (`idUser`),
  CONSTRAINT `order_FK` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci

CREATE TABLE `order_food` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `idOrder` bigint(20) DEFAULT NULL,
  `idFood` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_food_FK` (`idFood`),
  KEY `order_food_FK_1` (`idOrder`),
  CONSTRAINT `order_food_FK` FOREIGN KEY (`idFood`) REFERENCES `food` (`id`),
  CONSTRAINT `order_food_FK_1` FOREIGN KEY (`idOrder`) REFERENCES `order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci

INSERT INTO restaurant.food (name,price) VALUES
	 ('Bandeja Paisa',23000.0),
	 ('Lechona',8000.0),
	 ('Chuleta',15000.0),
	 ('Pollo plancha',16000.0);