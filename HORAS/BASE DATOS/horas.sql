-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.32-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.10.0.7000
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para horashechas
CREATE DATABASE IF NOT EXISTS `horashechas` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `horashechas`;

-- Volcando estructura para tabla horashechas.dia_semana
CREATE TABLE IF NOT EXISTS `dia_semana` (
  `dsemana` int(10) NOT NULL,
  `nombre_dia` varchar(15) NOT NULL,
  PRIMARY KEY (`dsemana`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla horashechas.horas
CREATE TABLE IF NOT EXISTS `horas` (
  `fecha` date NOT NULL,
  `provincia` varchar(10) NOT NULL DEFAULT 'MADRID',
  `entrada` time NOT NULL,
  `salida` time NOT NULL,
  `obra` varchar(10) NOT NULL,
  `dsemana` int(10) NOT NULL,
  PRIMARY KEY (`fecha`),
  KEY `dsemana` (`dsemana`),
  CONSTRAINT `FK_horas_dia_semana` FOREIGN KEY (`dsemana`) REFERENCES `dia_semana` (`dsemana`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `horas_ibfk_1` FOREIGN KEY (`dsemana`) REFERENCES `dia_semana` (`dsemana`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla horashechas.mes
CREATE TABLE IF NOT EXISTS `mes` (
  `fecha` date DEFAULT NULL,
  `entrada` time DEFAULT NULL,
  `salida` time DEFAULT NULL,
  `nombre_dia` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para vista horashechas.vista-mes
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vista-mes` (
	`fecha` DATE NOT NULL,
	`entrada` TIME NOT NULL,
	`salida` TIME NOT NULL,
	`nombre_dia` VARCHAR(1) NOT NULL COLLATE 'utf8_spanish_ci'
) ENGINE=MyISAM;

-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vista-mes`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vista-mes` AS select `horas`.`fecha` AS `fecha`,`horas`.`entrada` AS `entrada`,`horas`.`salida` AS `salida`,`dia_semana`.`nombre_dia` AS `nombre_dia` from (`horas` join `dia_semana` on(`horas`.`dsemana` = `dia_semana`.`dsemana`)) where `horas`.`fecha` > '2020-07-20' and `horas`.`fecha` < '2020-08-21' order by `horas`.`fecha`
;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
