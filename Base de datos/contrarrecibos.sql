/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE DATABASE IF NOT EXISTS `contrarrecibos` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `contrarrecibos`;

CREATE TABLE IF NOT EXISTS `cliente` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `razon_social` varchar(300) NOT NULL DEFAULT '',
  `rfc` varchar(13) NOT NULL DEFAULT '',
  `direccion` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_cliente`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

INSERT INTO `cliente` (`id_cliente`, `razon_social`, `rfc`, `direccion`) VALUES
	(1, 'Compra', 'FSDDS33', 'avenida insurgentes'),
	(2, 'Transporte', 'DDFSDF', 'Juan escutia');

CREATE TABLE IF NOT EXISTS `contrarecibo` (
  `id_contrarrecibo` int(11) NOT NULL AUTO_INCREMENT,
  `factura` varchar(10) NOT NULL DEFAULT '',
  `folio` varchar(10) NOT NULL DEFAULT '',
  `fk_tiquet` int(11) NOT NULL DEFAULT 0,
  `subtotal` double NOT NULL DEFAULT 0,
  `iva` double NOT NULL DEFAULT 0,
  `retencion` double NOT NULL DEFAULT 0,
  `total` double NOT NULL DEFAULT 0,
  `status` varchar(3) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_contrarrecibo`) USING BTREE,
  KEY `FK1 Tiquet` (`fk_tiquet`) USING BTREE,
  CONSTRAINT `FK1 Tiquet` FOREIGN KEY (`fk_tiquet`) REFERENCES `tiquet` (`id_tiquet`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

INSERT INTO `contrarecibo` (`id_contrarrecibo`, `factura`, `folio`, `fk_tiquet`, `subtotal`, `iva`, `retencion`, `total`, `status`) VALUES
	(1, '3433', 'WEWE323', 1, 800, 345, 0, 1145, 'Act'),
	(2, '3212', '312321', 2, 400, 23, 0, 423, 'Act');

CREATE TABLE IF NOT EXISTS `empresa` (
  `id_empresa` int(11) NOT NULL AUTO_INCREMENT,
  `razon_social` varchar(300) NOT NULL DEFAULT '',
  `rfc` varchar(13) NOT NULL DEFAULT '',
  `direccion` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_empresa`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

INSERT INTO `empresa` (`id_empresa`, `razon_social`, `rfc`, `direccion`) VALUES
	(1, 'Transporte de materiales', 'DS343', 'Calle 5 de mayo'),
	(2, 'Compra de materiales', 'SD343', 'Avenida sureste');

CREATE TABLE IF NOT EXISTS `login` (
  `id_login` char(12) NOT NULL DEFAULT '',
  `contraseña` char(12) NOT NULL,
  PRIMARY KEY (`id_login`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `login` (`id_login`, `contraseña`) VALUES
	('YramGB', 'Noviembredos');

CREATE TABLE IF NOT EXISTS `mercancia` (
  `codigo_mercancia` varchar(10) NOT NULL,
  `nombre` varchar(50) NOT NULL DEFAULT '',
  `status` varchar(3) NOT NULL DEFAULT '',
  PRIMARY KEY (`codigo_mercancia`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `mercancia` (`codigo_mercancia`, `nombre`, `status`) VALUES
	('ABC123', 'Arena', 'Act'),
	('EFE344', 'Gravilla', 'Act');

CREATE TABLE IF NOT EXISTS `operador` (
  `id_operador` int(11) NOT NULL AUTO_INCREMENT,
  `apellido_paterno` varchar(50) NOT NULL DEFAULT '',
  `apellido_materno` varchar(50) NOT NULL DEFAULT '',
  `nombre` varchar(50) NOT NULL DEFAULT '',
  `curp` varchar(30) NOT NULL DEFAULT '',
  `rfc` varchar(13) NOT NULL DEFAULT '',
  `nss` varchar(12) NOT NULL DEFAULT '',
  `licencia` varchar(15) NOT NULL DEFAULT '',
  `status` varchar(3) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_operador`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

INSERT INTO `operador` (`id_operador`, `apellido_paterno`, `apellido_materno`, `nombre`, `curp`, `rfc`, `nss`, `licencia`, `status`) VALUES
	(1, 'Gonzalez', 'Bartolo', 'Angel Yram', 'GOBA011111HVZNRA4', 'GOBA011111', '232312312', '3432DA', 'Act'),
	(2, 'Pérez', 'Torres', 'Juan', 'FGFGFGA444', 'SDDSF3444', '3333', 'DFDS34', 'Act');

CREATE TABLE IF NOT EXISTS `poliza` (
  `numero_poliza` int(11) NOT NULL DEFAULT 0,
  `fk_contrarrecibo` int(11) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`numero_poliza`) USING BTREE,
  KEY `FK1 Contrarrecibo` (`fk_contrarrecibo`) USING BTREE,
  CONSTRAINT `FK1 Contrarrecibo` FOREIGN KEY (`fk_contrarrecibo`) REFERENCES `contrarecibo` (`id_contrarrecibo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `poliza` (`numero_poliza`, `fk_contrarrecibo`, `fecha`) VALUES
	(123, 1, '2022-12-12'),
	(1234, 2, '2022-12-12');

CREATE TABLE IF NOT EXISTS `tiquet` (
  `id_tiquet` int(11) NOT NULL AUTO_INCREMENT,
  `fk_unidad` int(11) NOT NULL DEFAULT 0,
  `fk_operador` int(11) NOT NULL DEFAULT 0,
  `fk_empresa` int(11) NOT NULL DEFAULT 0,
  `fk_cliente` int(11) NOT NULL DEFAULT 0,
  `fk_material` varchar(50) NOT NULL DEFAULT '0',
  `viaje` double NOT NULL DEFAULT 0,
  `toneladas` double NOT NULL DEFAULT 0,
  `status` varchar(3) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_tiquet`) USING BTREE,
  KEY `FK1 Unidad` (`fk_unidad`) USING BTREE,
  KEY `FK2 Operador` (`fk_operador`) USING BTREE,
  KEY `FK3 Empresa` (`fk_empresa`) USING BTREE,
  KEY `FK4 Cliente` (`fk_cliente`) USING BTREE,
  KEY `FK5 Material` (`fk_material`) USING BTREE,
  CONSTRAINT `FK1 Unidad` FOREIGN KEY (`fk_unidad`) REFERENCES `unidad` (`id_unidad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK2 Operador` FOREIGN KEY (`fk_operador`) REFERENCES `operador` (`id_operador`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK3 Empresa` FOREIGN KEY (`fk_empresa`) REFERENCES `empresa` (`id_empresa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK4 Cliente` FOREIGN KEY (`fk_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK5 Material` FOREIGN KEY (`fk_material`) REFERENCES `mercancia` (`codigo_mercancia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

INSERT INTO `tiquet` (`id_tiquet`, `fk_unidad`, `fk_operador`, `fk_empresa`, `fk_cliente`, `fk_material`, `viaje`, `toneladas`, `status`) VALUES
	(1, 1, 1, 1, 1, 'ABC123', 1, 9000, 'Act'),
	(2, 2, 2, 1, 2, 'EFE344', 1, 2333, 'Act'),
	(3, 2, 2, 1, 2, 'ABC123', 3, 56556, 'Act'),
	(4, 1, 1, 2, 1, 'EFE344', 2, 42432, 'act');

CREATE TABLE IF NOT EXISTS `unidad` (
  `id_unidad` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL DEFAULT '',
  `status` varchar(3) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_unidad`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

INSERT INTO `unidad` (`id_unidad`, `nombre`, `status`) VALUES
	(1, 'Unidad 1', 'Act'),
	(2, 'Unidad 2', 'Act');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
