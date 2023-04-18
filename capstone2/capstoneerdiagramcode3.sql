-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema capstone2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema capstone2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `capstone2` DEFAULT CHARACTER SET utf8 ;
USE `capstone2` ;

-- -----------------------------------------------------
-- Table `capstone2`.`MenuItems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `capstone2`.`MenuItems` (
  `MenuItemsID` INT NOT NULL,
  `CourseName` VARCHAR(45) NULL,
  `StarterName` VARCHAR(45) NULL,
  `DessertName` VARCHAR(45) NULL,
  PRIMARY KEY (`MenuItemsID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `capstone2`.`Menus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `capstone2`.`Menus` (
  `MenuID` INT NOT NULL,
  `MenuItemsID` INT NULL,
  `MenuName` VARCHAR(45) NULL,
  `Cuisine` VARCHAR(45) NULL,
  PRIMARY KEY (`MenuID`),
  INDEX `menu_items_id_fk_idx` (`MenuItemsID` ASC) VISIBLE,
  CONSTRAINT `menu_items_id_fk`
    FOREIGN KEY (`MenuItemsID`)
    REFERENCES `capstone2`.`MenuItems` (`MenuItemsID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `capstone2`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `capstone2`.`Customers` (
  `CustomerID` INT NOT NULL,
  `FullName` VARCHAR(100) NULL,
  `ContactNumber` VARCHAR(45) NULL,
  `Email` VARCHAR(100) NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `capstone2`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `capstone2`.`Orders` (
  `OrderID` INT NOT NULL,
  `MenuID` INT NULL,
  `CustomerID` INT NULL,
  `TotalCost` DECIMAL NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `menu_id_fk_idx` (`MenuID` ASC) VISIBLE,
  INDEX `customer_id_fk_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `menu_id_fk`
    FOREIGN KEY (`MenuID`)
    REFERENCES `capstone2`.`Menus` (`MenuID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `customer_id_fk`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `capstone2`.`Customers` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `capstone2`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `capstone2`.`Bookings` (
  `BookingID` INT NOT NULL,
  `TableNumber` INT NULL,
  `BookingDate` DATE NULL,
  `CustomerID` INT NULL,
  PRIMARY KEY (`BookingID`),
  INDEX `customer_id_fk_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `customer_id_fk`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `capstone2`.`Customers` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
