-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Ruta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Ruta` (
  `idRuta` INT NOT NULL,
  PRIMARY KEY (`idRuta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Remolques`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Remolques` (
  `idRemolques` INT NOT NULL,
  PRIMARY KEY (`idRemolques`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Hoja_de_Ruta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Hoja_de_Ruta` (
  `idHoja_de_Ruta` INT NOT NULL,
  `Ruta_idRuta` INT NOT NULL,
  `Remolques_idRemolques` INT NOT NULL,
  PRIMARY KEY (`idHoja_de_Ruta`, `Ruta_idRuta`, `Remolques_idRemolques`),
  INDEX `fk_Hoja_de_Ruta_Ruta1_idx` (`Ruta_idRuta` ASC) VISIBLE,
  INDEX `fk_Hoja_de_Ruta_Remolques1_idx` (`Remolques_idRemolques` ASC) VISIBLE,
  CONSTRAINT `fk_Hoja_de_Ruta_Ruta1`
    FOREIGN KEY (`Ruta_idRuta`)
    REFERENCES `mydb`.`Ruta` (`idRuta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Hoja_de_Ruta_Remolques1`
    FOREIGN KEY (`Remolques_idRemolques`)
    REFERENCES `mydb`.`Remolques` (`idRemolques`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Ciudades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Ciudades` (
  `idCiudades` INT NOT NULL,
  PRIMARY KEY (`idCiudades`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Bulto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Bulto` (
  `idBulto` INT NOT NULL,
  `Hoja_de_Ruta_idHoja_de_Ruta` INT NOT NULL,
  `Provincia_idProvincia` INT NOT NULL,
  `Ciudades_idCiudades` INT NOT NULL,
  PRIMARY KEY (`idBulto`, `Provincia_idProvincia`, `Ciudades_idCiudades`),
  INDEX `fk_Bulto_Hoja_de_Ruta1_idx` (`Hoja_de_Ruta_idHoja_de_Ruta` ASC) VISIBLE,
  INDEX `fk_Bulto_Ciudades1_idx` (`Ciudades_idCiudades` ASC) VISIBLE,
  CONSTRAINT `fk_Bulto_Hoja_de_Ruta1`
    FOREIGN KEY (`Hoja_de_Ruta_idHoja_de_Ruta`)
    REFERENCES `mydb`.`Hoja_de_Ruta` (`idHoja_de_Ruta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Bulto_Ciudades1`
    FOREIGN KEY (`Ciudades_idCiudades`)
    REFERENCES `mydb`.`Ciudades` (`idCiudades`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Clientes` (
  `idClientes` INT NOT NULL,
  `Bulto_idBulto` INT NOT NULL,
  `Bulto_Provincia_idProvincia` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `apellido` VARCHAR(45) NULL,
  PRIMARY KEY (`idClientes`, `Bulto_idBulto`, `Bulto_Provincia_idProvincia`),
  INDEX `fk_Clientes_Bulto1_idx` (`Bulto_idBulto` ASC, `Bulto_Provincia_idProvincia` ASC) VISIBLE,
  CONSTRAINT `fk_Clientes_Bulto1`
    FOREIGN KEY (`Bulto_idBulto` , `Bulto_Provincia_idProvincia`)
    REFERENCES `mydb`.`Bulto` (`idBulto` , `Provincia_idProvincia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Choferes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Choferes` (
  `idChoferes` INT NOT NULL,
  `Hoja_de_Ruta_idHoja_de_Ruta` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `apellido` VARCHAR(45) NULL,
  `DNI` VARCHAR(45) NULL,
  `provincia` VARCHAR(45) NULL,
  PRIMARY KEY (`idChoferes`),
  INDEX `fk_Choferes_Hoja_de_Ruta1_idx` (`Hoja_de_Ruta_idHoja_de_Ruta` ASC) VISIBLE,
  CONSTRAINT `fk_Choferes_Hoja_de_Ruta1`
    FOREIGN KEY (`Hoja_de_Ruta_idHoja_de_Ruta`)
    REFERENCES `mydb`.`Hoja_de_Ruta` (`idHoja_de_Ruta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tramo_entre_ciudades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tramo_entre_ciudades` (
  `idTramo_entre_ciudades` INT NOT NULL,
  PRIMARY KEY (`idTramo_entre_ciudades`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tarifa_por_tamaño`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tarifa_por_tamaño` (
  `idTarifa_por_tamaño` INT NOT NULL,
  PRIMARY KEY (`idTarifa_por_tamaño`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tarifa_de_peso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tarifa_de_peso` (
  `idTarifa_de_peso` INT NOT NULL,
  PRIMARY KEY (`idTarifa_de_peso`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tarifa_por_kilometro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tarifa_por_kilometro` (
  `idTarifa_por_kilometro` INT NOT NULL,
  PRIMARY KEY (`idTarifa_por_kilometro`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Flujo_de_Caja`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Flujo_de_Caja` (
  `idFlujo_de_Caja` INT NOT NULL,
  PRIMARY KEY (`idFlujo_de_Caja`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Camiones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Camiones` (
  `idCamiones` INT NOT NULL,
  `Hoja_de_Ruta_idHoja_de_Ruta` INT NOT NULL,
  `Hoja_de_Ruta_Ruta_idRuta` INT NOT NULL,
  PRIMARY KEY (`idCamiones`, `Hoja_de_Ruta_idHoja_de_Ruta`, `Hoja_de_Ruta_Ruta_idRuta`),
  INDEX `fk_Camiones_Hoja_de_Ruta1_idx` (`Hoja_de_Ruta_idHoja_de_Ruta` ASC, `Hoja_de_Ruta_Ruta_idRuta` ASC) VISIBLE,
  CONSTRAINT `fk_Camiones_Hoja_de_Ruta1`
    FOREIGN KEY (`Hoja_de_Ruta_idHoja_de_Ruta` , `Hoja_de_Ruta_Ruta_idRuta`)
    REFERENCES `mydb`.`Hoja_de_Ruta` (`idHoja_de_Ruta` , `Ruta_idRuta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`pedido` (
  `Bulto_idBulto` INT NOT NULL,
  `Bulto_Provincia_idProvincia` INT NOT NULL,
  `Bulto_Ciudades_idCiudades` INT NOT NULL,
  INDEX `fk_pedido_Bulto1_idx` (`Bulto_idBulto` ASC, `Bulto_Provincia_idProvincia` ASC, `Bulto_Ciudades_idCiudades` ASC) VISIBLE,
  CONSTRAINT `fk_pedido_Bulto1`
    FOREIGN KEY (`Bulto_idBulto` , `Bulto_Provincia_idProvincia` , `Bulto_Ciudades_idCiudades`)
    REFERENCES `mydb`.`Bulto` (`idBulto` , `Provincia_idProvincia` , `Ciudades_idCiudades`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`detinatario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`detinatario` (
  `Bulto_idBulto` INT NOT NULL,
  `Bulto_Provincia_idProvincia` INT NOT NULL,
  `Bulto_Ciudades_idCiudades` INT NOT NULL,
  INDEX `fk_detinatario_Bulto1_idx` (`Bulto_idBulto` ASC, `Bulto_Provincia_idProvincia` ASC, `Bulto_Ciudades_idCiudades` ASC) VISIBLE,
  CONSTRAINT `fk_detinatario_Bulto1`
    FOREIGN KEY (`Bulto_idBulto` , `Bulto_Provincia_idProvincia` , `Bulto_Ciudades_idCiudades`)
    REFERENCES `mydb`.`Bulto` (`idBulto` , `Provincia_idProvincia` , `Ciudades_idCiudades`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
