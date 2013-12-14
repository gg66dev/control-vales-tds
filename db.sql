SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `control_vales` ;
CREATE SCHEMA IF NOT EXISTS `control_vales` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `control_vales` ;

-- -----------------------------------------------------
-- Table `control_vales`.`departamento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `control_vales`.`departamento` ;

CREATE  TABLE IF NOT EXISTS `control_vales`.`departamento` (
  `iddepartamento` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NOT NULL ,
  `descripcion` VARCHAR(45) NULL ,
  PRIMARY KEY (`iddepartamento`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `control_vales`.`centro_costo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `control_vales`.`centro_costo` ;

CREATE  TABLE IF NOT EXISTS `control_vales`.`centro_costo` (
  `idcentro_costo` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NOT NULL ,
  `descripcion` VARCHAR(45) NULL ,
  `departamento_iddepartamento` INT NOT NULL ,
  PRIMARY KEY (`idcentro_costo`) ,
  INDEX `fk_centro_costo_departamento1_idx` (`departamento_iddepartamento` ASC) ,
  CONSTRAINT `fk_centro_costo_departamento1`
    FOREIGN KEY (`departamento_iddepartamento` )
    REFERENCES `control_vales`.`departamento` (`iddepartamento` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `control_vales`.`usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `control_vales`.`usuario` ;

CREATE  TABLE IF NOT EXISTS `control_vales`.`usuario` (
  `idusuario` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NOT NULL ,
  `usuario` VARCHAR(45) NOT NULL ,
  `password` VARCHAR(45) NOT NULL ,
  `rut` VARCHAR(45) NULL ,
  `domicilio` VARCHAR(45) NULL ,
  `email` VARCHAR(45) NULL ,
  `perfil` VARCHAR(45) NOT NULL ,
  `centro_costo_idcentro_costo` INT NULL ,
  PRIMARY KEY (`idusuario`) ,
  INDEX `fk_usuario_centro_costo1_idx` (`centro_costo_idcentro_costo` ASC) ,
  CONSTRAINT `fk_usuario_centro_costo1`
    FOREIGN KEY (`centro_costo_idcentro_costo` )
    REFERENCES `control_vales`.`centro_costo` (`idcentro_costo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `control_vales`.`vale`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `control_vales`.`vale` ;

CREATE  TABLE IF NOT EXISTS `control_vales`.`vale` (
  `idvale` INT NOT NULL AUTO_INCREMENT ,
  `folio` MEDIUMTEXT NOT NULL ,
  `fecha_uso` DATE NULL ,
  `origen` VARCHAR(45) NULL ,
  `destino` VARCHAR(45) NULL ,
  `motivo_viaje` VARCHAR(45) NULL ,
  `monto_estipulado` INT NULL ,
  `monto_real` INT NULL ,
  `fecha_confirmacion` DATE NULL ,
  `patente` VARCHAR(45) NULL ,
  `estado` VARCHAR(45) NULL ,
  `usuario_idusuario` INT NOT NULL ,
  PRIMARY KEY (`idvale`) ,
  INDEX `fk_vale_usuario_idx` (`usuario_idusuario` ASC) ,
  CONSTRAINT `fk_vale_usuario`
    FOREIGN KEY (`usuario_idusuario` )
    REFERENCES `control_vales`.`usuario` (`idusuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `control_vales` ;

GRANT USAGE ON `control_vales`.* TO 'kross';
SET SQL_MODE = '';
DROP USER kross;
SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
CREATE USER 'kross' IDENTIFIED BY 'sprit3';

GRANT ALL ON `control_vales`.* TO 'kross';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
