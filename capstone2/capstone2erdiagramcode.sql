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
-- Table `capstone2`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `capstone2`.`Customers` (
  `CustomerID` INT NOT NULL,
  `CustomerName` VARCHAR(100) NULL,
  `PhoneNumber` VARCHAR(45) NULL,
  `Email` VARCHAR(100) NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `capstone2`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `capstone2`.`Bookings` (
  ` BookingID` INT NOT NULL,
  `CustomerID` INT NULL,
  `BookingDate` DATE NULL,
  `TableNumber` INT NULL,
  PRIMARY KEY (` BookingID`),
  INDEX `fk_customer_id_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `fk_customer_id`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `capstone2`.`Customers` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `capstone2`.`MenuItems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `capstone2`.`MenuItems` (
  `MenuItemsID` INT NOT NULL,
  `CourseName` VARCHAR(100) NULL,
  `StarterName` VARCHAR(100) NULL,
  `DessertName` VARCHAR(100) NULL,
  PRIMARY KEY (`MenuItemsID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `capstone2`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `capstone2`.`Menu` (
  `MenuID` INT NOT NULL,
  `MenuItemsID` INT NULL,
  `MenuName` VARCHAR(100) NULL,
  `CuisineType` VARCHAR(100) NULL,
  PRIMARY KEY (`MenuID`),
  INDEX `menu_items_id_fk_idx` (`MenuItemsID` ASC) VISIBLE,
  CONSTRAINT `menu_items_id_fk`
    FOREIGN KEY (`MenuItemsID`)
    REFERENCES `capstone2`.`MenuItems` (`MenuItemsID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `capstone2`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `capstone2`.`Staff` (
  `StaffID` INT NOT NULL,
  `EmployeeName` VARCHAR(100) NULL,
  `Role` VARCHAR(45) NULL,
  `Salary` DECIMAL NULL,
  PRIMARY KEY (`StaffID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `capstone2`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `capstone2`.`Orders` (
  `OrderID` INT NOT NULL,
  `BookingID` INT NULL,
  `OrderDate` DATE NULL,
  `MenuID` INT NULL,
  `StaffID` INT NULL,
  `Quantity` INT NULL,
  `TotalCost` DECIMAL NULL,
  `CustomerID` INT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `booking_id_fk_idx` (`BookingID` ASC) VISIBLE,
  INDEX `menu_id_fk_idx` (`MenuID` ASC) VISIBLE,
  INDEX `staff_id_fk_idx` (`StaffID` ASC) VISIBLE,
  INDEX `customer_id_fk_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `booking_id_fk`
    FOREIGN KEY (`BookingID`)
    REFERENCES `capstone2`.`Bookings` (` BookingID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `menu_id_fk`
    FOREIGN KEY (`MenuID`)
    REFERENCES `capstone2`.`Menu` (`MenuID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `staff_id_fk`
    FOREIGN KEY (`StaffID`)
    REFERENCES `capstone2`.`Staff` (`StaffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `customer_id_fk`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `capstone2`.`Customers` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `capstone2`.`Delivery`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `capstone2`.`Delivery` (
  `DeliveryID` INT NOT NULL,
  `DeliveryDate` DATE NULL,
  `DeliveryStatus` VARCHAR(45) NULL,
  `OrderID` INT NULL,
  PRIMARY KEY (`DeliveryID`),
  INDEX `order_id_fk_idx` (`OrderID` ASC) VISIBLE,
  CONSTRAINT `order_id_fk`
    FOREIGN KEY (`OrderID`)
    REFERENCES `capstone2`.`Orders` (`OrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
