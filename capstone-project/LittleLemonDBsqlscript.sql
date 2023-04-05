-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db-capstone-project
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db-capstone-project
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db-capstone-project` DEFAULT CHARACTER SET utf8 ;
USE `db-capstone-project` ;

-- -----------------------------------------------------
-- Table `db-capstone-project`.`Addresses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db-capstone-project`.`Addresses` (
  `AddressID` INT NOT NULL,
  `Street` VARCHAR(100) NOT NULL,
  `City` VARCHAR(100) NOT NULL,
  `State` VARCHAR(100) NOT NULL,
  `PostalCode` VARCHAR(45) NOT NULL,
  `Country` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`AddressID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db-capstone-project`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db-capstone-project`.`Customers` (
  `CustomerID` INT NOT NULL,
  `FullName` VARCHAR(200) NOT NULL,
  `PhoneNumber` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(100) NOT NULL,
  `AddressID` INT NOT NULL,
  PRIMARY KEY (`CustomerID`),
  INDEX `address_id_fk_idx` (`AddressID` ASC) VISIBLE,
  CONSTRAINT `address_id_fk`
    FOREIGN KEY (`AddressID`)
    REFERENCES `db-capstone-project`.`Addresses` (`AddressID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db-capstone-project`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db-capstone-project`.`Bookings` (
  `BookingID` INT NOT NULL AUTO_INCREMENT,
  `CustomerID` INT NOT NULL,
  `BookedDate` DATE NOT NULL,
  `TableNumber` INT NOT NULL,
  PRIMARY KEY (`BookingID`),
  INDEX `customer_id_fk_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `customer_id_fk`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `db-capstone-project`.`Customers` (`CustomerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db-capstone-project`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db-capstone-project`.`Menu` (
  `MenuID` INT NOT NULL,
  `DishName` VARCHAR(100) NULL,
  `DishCategory` VARCHAR(100) NULL,
  `CuisineType` VARCHAR(45) NULL,
  PRIMARY KEY (`MenuID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db-capstone-project`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db-capstone-project`.`Staff` (
  `StaffID` INT NOT NULL,
  `EmployeeName` VARCHAR(100) NOT NULL,
  `Role` VARCHAR(100) NOT NULL,
  `Salary` DECIMAL NOT NULL,
  PRIMARY KEY (`StaffID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db-capstone-project`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db-capstone-project`.`Orders` (
  `OrderID` INT NOT NULL,
  `BookingID` INT NOT NULL,
  `OrderDate` DATE NOT NULL,
  `MenuID` INT NOT NULL,
  `StaffID` INT NOT NULL,
  `Quantity` INT NOT NULL,
  `TotalCost` DECIMAL NOT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `booking_id_fk_idx` (`BookingID` ASC) VISIBLE,
  INDEX `menu_id_fk_idx` (`MenuID` ASC) VISIBLE,
  INDEX `staff_id_fk_idx` (`StaffID` ASC) VISIBLE,
  CONSTRAINT `booking_id_fk`
    FOREIGN KEY (`BookingID`)
    REFERENCES `db-capstone-project`.`Bookings` (`BookingID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `menu_id_fk`
    FOREIGN KEY (`MenuID`)
    REFERENCES `db-capstone-project`.`Menu` (`MenuID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `staff_id_fk`
    FOREIGN KEY (`StaffID`)
    REFERENCES `db-capstone-project`.`Staff` (`StaffID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db-capstone-project`.`Delivery`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db-capstone-project`.`Delivery` (
  `DeliveryID` INT NOT NULL,
  `DeliveryDate` DATE NOT NULL,
  `DeliveryStatus` VARCHAR(45) NOT NULL,
  `OrderID` INT NOT NULL,
  PRIMARY KEY (`DeliveryID`),
  INDEX `order_id_fk_idx` (`OrderID` ASC) VISIBLE,
  CONSTRAINT `order_id_fk`
    FOREIGN KEY (`OrderID`)
    REFERENCES `db-capstone-project`.`Orders` (`OrderID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
