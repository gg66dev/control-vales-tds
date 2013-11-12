SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `control_vales` ;
CREATE SCHEMA IF NOT EXISTS `control_vales` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `control_vales` ;

-- -----------------------------------------------------
-- Table `control_vales`.`usuario`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `control_vales`.`usuario` (
  `idusuario` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL ,
  `usuario` VARCHAR(45) NULL ,
  `password` VARCHAR(45) NULL ,
  `rut` VARCHAR(45) NULL ,
  `email` VARCHAR(45) NULL ,
  PRIMARY KEY (`idusuario`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `control_vales`.`empresa`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `control_vales`.`empresa` (
  `idempresa` INT NOT NULL ,
  `nombre` VARCHAR(45) NULL ,
  `rut` VARCHAR(45) NULL ,
  PRIMARY KEY (`idempresa`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `control_vales`.`vale`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `control_vales`.`vale` (
  `idvale` INT NOT NULL ,
  `fecha_uso` DATE NULL ,
  `origen` VARCHAR(45) NULL ,
  `destino` VARCHAR(45) NULL ,
  `motivo_viaje` VARCHAR(45) NULL ,
  `monto_estipulado` INT NULL ,
  `monto_real` INT NULL ,
  `fecha_confirmacion` DATE NULL ,
  `estado` VARCHAR(45) NULL ,
  `usuario_idusuario` INT NOT NULL ,
  `empresa_idempresa` INT NOT NULL ,
  PRIMARY KEY (`idvale`) ,
  INDEX `fk_vale_usuario_idx` (`usuario_idusuario` ASC) ,
  INDEX `fk_vale_empresa1_idx` (`empresa_idempresa` ASC) ,
  CONSTRAINT `fk_vale_usuario`
    FOREIGN KEY (`usuario_idusuario` )
    REFERENCES `control_vales`.`usuario` (`idusuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vale_empresa1`
    FOREIGN KEY (`empresa_idempresa` )
    REFERENCES `control_vales`.`empresa` (`idempresa` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
