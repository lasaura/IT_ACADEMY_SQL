-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema OPTICAPROYITACADEMY
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema OPTICAPROYITACADEMY
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `OPTICAPROYITACADEMY`;
USE `OPTICAPROYITACADEMY` ;

-- -----------------------------------------------------
-- Table `OPTICAPROYITACADEMY`.`CLIENTS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `OPTICAPROYITACADEMY`.`CLIENTS` ;

CREATE TABLE IF NOT EXISTS `OPTICAPROYITACADEMY`.`CLIENTS` (
  `idCLIENTS` INT NOT NULL,
  `NOM_CLIENT` VARCHAR(45) NOT NULL,
  `CALLE` VARCHAR(45) NOT NULL,
  `TELF` INT NOT NULL,
  `EMAIL` VARCHAR(45) NOT NULL,
  `DATA_ALTA` DATE NOT NULL,
  `ID_CLIENT_RECOM` INT NULL,
  PRIMARY KEY (`idCLIENTS`),
  UNIQUE INDEX `idCLIENTS_UNIQUE` (`idCLIENTS` ASC) VISIBLE,
  UNIQUE INDEX `TELF_UNIQUE` (`TELF` ASC) VISIBLE,
  UNIQUE INDEX `EMAIL_UNIQUE` (`EMAIL` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OPTICAPROYITACADEMY`.`PROVEIDOR`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `OPTICAPROYITACADEMY`.`PROVEIDOR` ;

CREATE TABLE IF NOT EXISTS `OPTICAPROYITACADEMY`.`PROVEIDOR` (
  `idPROVEIDOR` INT NOT NULL AUTO_INCREMENT,
  `NIF` VARCHAR(45) NOT NULL,
  `NOM_PROV` VARCHAR(45) NOT NULL,
  `DIRECCION` VARCHAR(45) NULL,
  `CIUDAD` VARCHAR(45) NULL,
  `CODI_POSTAL` VARCHAR(45) NULL,
  `TELF_PROV` VARCHAR(45) NULL,
  `FAX` VARCHAR(45) NULL,
  `PAIS` VARCHAR(45) NULL,
  PRIMARY KEY (`idPROVEIDOR`),
  UNIQUE INDEX `idPROVEIDOR_UNIQUE` (`idPROVEIDOR` ASC) VISIBLE,
  UNIQUE INDEX `NIF_UNIQUE` (`NIF` ASC) VISIBLE,
  UNIQUE INDEX `NOM_PROV_UNIQUE` (`NOM_PROV` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OPTICAPROYITACADEMY`.`ULLERES`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `OPTICAPROYITACADEMY`.`ULLERES` ;

CREATE TABLE IF NOT EXISTS `OPTICAPROYITACADEMY`.`ULLERES` (
  `idULLERES` INT NOT NULL AUTO_INCREMENT,
  `MARCA` VARCHAR(45) NOT NULL,
  `GRADUACION` FLOAT NULL,
  `TIPUS_MONTURA` VARCHAR(45) NULL,
  `COLOR_MONTURA` VARCHAR(45) NULL,
  `COLOR_VIDRE` VARCHAR(45) NULL,
  `PREU` INT NOT NULL,
  `PROVEIDOR_ID` INT NOT NULL,
  PRIMARY KEY (`idULLERES`),
  UNIQUE INDEX `idULLERES_UNIQUE` (`idULLERES` ASC) VISIBLE,
  INDEX `IDPROVEIDOR_idx` (`PROVEIDOR_ID` ASC) VISIBLE,
  CONSTRAINT `IDPROVEIDOR`
    FOREIGN KEY (`PROVEIDOR_ID`)
    REFERENCES `OPTICAPROYITACADEMY`.`PROVEIDOR` (`idPROVEIDOR`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OPTICAPROYITACADEMY`.`EMPLEAT`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `OPTICAPROYITACADEMY`.`EMPLEAT` ;

CREATE TABLE IF NOT EXISTS `OPTICAPROYITACADEMY`.`EMPLEAT` (
  `idEMPLEAT` INT NOT NULL AUTO_INCREMENT,
  `NOM_EMPLEAT` VARCHAR(45) NULL,
  PRIMARY KEY (`idEMPLEAT`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OPTICAPROYITACADEMY`.`VENTA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `OPTICAPROYITACADEMY`.`VENTA` ;

CREATE TABLE IF NOT EXISTS `OPTICAPROYITACADEMY`.`VENTA` (
  `idVENTA` INT NOT NULL AUTO_INCREMENT,
  `EMPLEAT_ID` INT NOT NULL,
  `ULLERES_ID` INT NOT NULL,
  `FECHA_VENTA` DATE NOT NULL,
  `CLIENTS_ID` INT NOT NULL,
  PRIMARY KEY (`idVENTA`),
  UNIQUE INDEX `idVENTA_UNIQUE` (`idVENTA` ASC) VISIBLE,
  INDEX `IDEMPLEAT_idx` (`EMPLEAT_ID` ASC) VISIBLE,
  INDEX `IDULLERES_idx` (`ULLERES_ID` ASC) VISIBLE,
  INDEX `IDCLIENTS_idx` (`CLIENTS_ID` ASC) VISIBLE,
  CONSTRAINT `IDEMPLEAT`
    FOREIGN KEY (`EMPLEAT_ID`)
    REFERENCES `OPTICAPROYITACADEMY`.`EMPLEAT` (`idEMPLEAT`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `IDULLERES`
    FOREIGN KEY (`ULLERES_ID`)
    REFERENCES `OPTICAPROYITACADEMY`.`ULLERES` (`idULLERES`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `IDCLIENTS`
    FOREIGN KEY (`CLIENTS_ID`)
    REFERENCES `OPTICAPROYITACADEMY`.`CLIENTS` (`idCLIENTS`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `OPTICAPROYITACADEMY`.`CLIENTS`
-- -----------------------------------------------------
START TRANSACTION;
USE `OPTICAPROYITACADEMY`;
INSERT INTO `OPTICAPROYITACADEMY`.`CLIENTS` (`idCLIENTS`, `NOM_CLIENT`, `CALLE`, `TELF`, `EMAIL`, `DATA_ALTA`, `ID_CLIENT_RECOM`) VALUES (10, 'MIREIA', 'HOLLYWOOD 48', 937432112, 'productorahollywood@gmail.com', '2015-03-03', NULL);
INSERT INTO `OPTICAPROYITACADEMY`.`CLIENTS` (`idCLIENTS`, `NOM_CLIENT`, `CALLE`, `TELF`, `EMAIL`, `DATA_ALTA`, `ID_CLIENT_RECOM`) VALUES (11, 'CARLOS', 'SOSO 42', 937321134, 'cantstopthefeeling@gmail.com', '2016-01-10', NULL);
INSERT INTO `OPTICAPROYITACADEMY`.`CLIENTS` (`idCLIENTS`, `NOM_CLIENT`, `CALLE`, `TELF`, `EMAIL`, `DATA_ALTA`, `ID_CLIENT_RECOM`) VALUES (12, 'LUIS', 'APPLE 40', 934568907, 'luis.informatico@gmail.com', '2017-03-28', NULL);
INSERT INTO `OPTICAPROYITACADEMY`.`CLIENTS` (`idCLIENTS`, `NOM_CLIENT`, `CALLE`, `TELF`, `EMAIL`, `DATA_ALTA`, `ID_CLIENT_RECOM`) VALUES (13, 'KINSLEY', 'YUBA 4', 937712324, 'wilcoxeat@gmail.com', '2018-03-11', 10);

COMMIT;


-- -----------------------------------------------------
-- Data for table `OPTICAPROYITACADEMY`.`PROVEIDOR`
-- -----------------------------------------------------
START TRANSACTION;
USE `OPTICAPROYITACADEMY`;
INSERT INTO `OPTICAPROYITACADEMY`.`PROVEIDOR` (`idPROVEIDOR`, `NIF`, `NOM_PROV`, `DIRECCION`, `CIUDAD`, `CODI_POSTAL`, `TELF_PROV`, `FAX`, `PAIS`) VALUES (1, '44224412A', 'PRIMERO', 'BARCELONA BAJOS 1', 'BARCELONA', '08033', '934432121', '933324546', 'ESPAÑA');
INSERT INTO `OPTICAPROYITACADEMY`.`PROVEIDOR` (`idPROVEIDOR`, `NIF`, `NOM_PROV`, `DIRECCION`, `CIUDAD`, `CODI_POSTAL`, `TELF_PROV`, `FAX`, `PAIS`) VALUES (2, '55773341D', 'SEGUNDO', 'DIAGONAL 358', 'BARCELONA', '08003', '934567890', '932213345', 'ESPAÑA');
INSERT INTO `OPTICAPROYITACADEMY`.`PROVEIDOR` (`idPROVEIDOR`, `NIF`, `NOM_PROV`, `DIRECCION`, `CIUDAD`, `CODI_POSTAL`, `TELF_PROV`, `FAX`, `PAIS`) VALUES (3, '44215689C', 'TERCERO', 'SERRANO 35', 'MADRID', '28023', '914532212', '913345899', 'ESPAÑA');
INSERT INTO `OPTICAPROYITACADEMY`.`PROVEIDOR` (`idPROVEIDOR`, `NIF`, `NOM_PROV`, `DIRECCION`, `CIUDAD`, `CODI_POSTAL`, `TELF_PROV`, `FAX`, `PAIS`) VALUES (4, '00321158B', 'CUARTO', 'ANDALUCIA 40', 'SEVILLA', '41002', '953778912', '953778913', 'ESPAÑA');

COMMIT;


-- -----------------------------------------------------
-- Data for table `OPTICAPROYITACADEMY`.`ULLERES`
-- -----------------------------------------------------
START TRANSACTION;
USE `OPTICAPROYITACADEMY`;
INSERT INTO `OPTICAPROYITACADEMY`.`ULLERES` (`idULLERES`, `MARCA`, `GRADUACION`, `TIPUS_MONTURA`, `COLOR_MONTURA`, `COLOR_VIDRE`, `PREU`, `PROVEIDOR_ID`) VALUES (100, 'DOLCE&GABANNA', 3.5, 'NORMAL', 'AMARILLA', 'AZUL', 400, 3);
INSERT INTO `OPTICAPROYITACADEMY`.`ULLERES` (`idULLERES`, `MARCA`, `GRADUACION`, `TIPUS_MONTURA`, `COLOR_MONTURA`, `COLOR_VIDRE`, `PREU`, `PROVEIDOR_ID`) VALUES (101, 'GUCCI', 2, 'GRANDE', 'ROJA', 'TRANSPARENTE', 300, 1);
INSERT INTO `OPTICAPROYITACADEMY`.`ULLERES` (`idULLERES`, `MARCA`, `GRADUACION`, `TIPUS_MONTURA`, `COLOR_MONTURA`, `COLOR_VIDRE`, `PREU`, `PROVEIDOR_ID`) VALUES (102, 'PRADA', 1, 'MUJER', 'BLANCA', 'ROSA', 450, 1);
INSERT INTO `OPTICAPROYITACADEMY`.`ULLERES` (`idULLERES`, `MARCA`, `GRADUACION`, `TIPUS_MONTURA`, `COLOR_MONTURA`, `COLOR_VIDRE`, `PREU`, `PROVEIDOR_ID`) VALUES (103, 'RALPH LAUREN', 0.8, 'HOMBRE', 'NEGRA', 'AZUL MARINO', 190, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `OPTICAPROYITACADEMY`.`EMPLEAT`
-- -----------------------------------------------------
START TRANSACTION;
USE `OPTICAPROYITACADEMY`;
INSERT INTO `OPTICAPROYITACADEMY`.`EMPLEAT` (`idEMPLEAT`, `NOM_EMPLEAT`) VALUES (1001, 'JOHN WESTERN');
INSERT INTO `OPTICAPROYITACADEMY`.`EMPLEAT` (`idEMPLEAT`, `NOM_EMPLEAT`) VALUES (1002, 'DENVER COLORADO');
INSERT INTO `OPTICAPROYITACADEMY`.`EMPLEAT` (`idEMPLEAT`, `NOM_EMPLEAT`) VALUES (1003, 'CALIFORNIA NEVADA');

COMMIT;


-- -----------------------------------------------------
-- Data for table `OPTICAPROYITACADEMY`.`VENTA`
-- -----------------------------------------------------
START TRANSACTION;
USE `OPTICAPROYITACADEMY`;
INSERT INTO `OPTICAPROYITACADEMY`.`VENTA` (`idVENTA`, `EMPLEAT_ID`, `ULLERES_ID`, `FECHA_VENTA`, `CLIENTS_ID`) VALUES (10001, 1001, 100, '2018-03-29', 10);
INSERT INTO `OPTICAPROYITACADEMY`.`VENTA` (`idVENTA`, `EMPLEAT_ID`, `ULLERES_ID`, `FECHA_VENTA`, `CLIENTS_ID`) VALUES (10002, 1001, 101, '2018-04-14', 11);
INSERT INTO `OPTICAPROYITACADEMY`.`VENTA` (`idVENTA`, `EMPLEAT_ID`, `ULLERES_ID`, `FECHA_VENTA`, `CLIENTS_ID`) VALUES (10003, 1003, 101, '2018-04-15', 10);
INSERT INTO `OPTICAPROYITACADEMY`.`VENTA` (`idVENTA`, `EMPLEAT_ID`, `ULLERES_ID`, `FECHA_VENTA`, `CLIENTS_ID`) VALUES (10004, 1002, 103, '2019-01-20', 12);

COMMIT;

