-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema horashechas
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema horashechas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `horashechas` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `horashechas` ;

-- -----------------------------------------------------
-- Table `horashechas`.`dia_semana`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `horashechas`.`dia_semana` (
  `dsemana` INT NOT NULL,
  `nombre_dia` VARCHAR(15) CHARACTER SET 'utf8mb3' NOT NULL,
  PRIMARY KEY USING BTREE (`dsemana`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `horashechas`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `horashechas`.`user` (
  `id_user` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellidos` VARCHAR(45) NOT NULL,
  `username` VARCHAR(16) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(32) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NOT NULL,
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_user`),
  UNIQUE INDEX `id_user_UNIQUE` (`id_user` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 19
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `horashechas`.`mes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `horashechas`.`mes` (
  `id` INT NOT NULL,
  `fecha` DATE NULL DEFAULT NULL,
  `entrada` TIME NULL DEFAULT NULL,
  `salida` TIME NULL DEFAULT NULL,
  `nombre_dia` VARCHAR(15) NULL DEFAULT NULL,
  `user_id_user` INT NOT NULL,
  PRIMARY KEY (`id`, `user_id_user`),
  INDEX `fk_mes_user1_idx` (`user_id_user` ASC) VISIBLE,
  CONSTRAINT `fk_mes_user1`
    FOREIGN KEY (`user_id_user`)
    REFERENCES `horashechas`.`user` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `horashechas`.`horas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `horashechas`.`horas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NOT NULL,
  `provincia` VARCHAR(10) CHARACTER SET 'utf8mb3' NOT NULL DEFAULT 'MADRID',
  `entrada` TIME NOT NULL,
  `salida` TIME NOT NULL,
  `obra` VARCHAR(10) CHARACTER SET 'utf8mb3' NOT NULL,
  `dsemana` INT NOT NULL,
  `dia_semana_dsemana` INT NOT NULL,
  `mes_id` INT NOT NULL,
  `mes_user_id_user` INT NOT NULL,
  `user_id_user` INT NOT NULL,
  PRIMARY KEY (`id`, `dia_semana_dsemana`, `mes_id`, `mes_user_id_user`, `user_id_user`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_horas_dia_semana1_idx` (`dia_semana_dsemana` ASC) VISIBLE,
  INDEX `fk_horas_mes1_idx` (`mes_id` ASC, `mes_user_id_user` ASC) VISIBLE,
  INDEX `fk_horas_user1_idx` (`user_id_user` ASC) VISIBLE,
  CONSTRAINT `fk_horas_dia_semana1`
    FOREIGN KEY (`dia_semana_dsemana`)
    REFERENCES `horashechas`.`dia_semana` (`dsemana`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_horas_mes1`
    FOREIGN KEY (`mes_id` , `mes_user_id_user`)
    REFERENCES `horashechas`.`mes` (`id` , `user_id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_horas_user1`
    FOREIGN KEY (`user_id_user`)
    REFERENCES `horashechas`.`user` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 12
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_spanish_ci;

USE `horashechas` ;

-- -----------------------------------------------------
-- Placeholder table for view `horashechas`.`vista-mes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `horashechas`.`vista-mes` (`fecha` INT, `entrada` INT, `salida` INT, `nombre_dia` INT);

-- -----------------------------------------------------
-- View `horashechas`.`vista-mes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `horashechas`.`vista-mes`;
USE `horashechas`;
CREATE  OR REPLACE ALGORITHM=TEMPTABLE DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `horashechas`.`vista-mes` AS select `horashechas`.`horas`.`fecha` AS `fecha`,`horashechas`.`horas`.`entrada` AS `entrada`,`horashechas`.`horas`.`salida` AS `salida`,`horashechas`.`dia_semana`.`nombre_dia` AS `nombre_dia` from (`horashechas`.`horas` join `horashechas`.`dia_semana` on((`horashechas`.`horas`.`dsemana` = `horashechas`.`dia_semana`.`dsemana`))) where ((`horashechas`.`horas`.`fecha` > '2020-07-20') and (`horashechas`.`horas`.`fecha` < '2020-08-21')) order by `horashechas`.`horas`.`fecha`;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
