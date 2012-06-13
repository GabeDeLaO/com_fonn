SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS `mydb` ;
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Companies`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Companies` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Companies` (
  `id` INT NOT NULL ,
  `companyname` TEXT NULL ,
  `address` TEXT NULL COMMENT '		' ,
  `city` TEXT NULL ,
  `state` INT NULL ,
  `zipcode` INT NULL ,
  `phone` VARCHAR(45) NULL ,
  `website` VARCHAR(155) NULL ,
  `email` VARCHAR(155) NULL ,
  `createdat` DATETIME NULL ,
  `updatedat` DATETIME NULL ,
  `deletedat` DATETIME NULL ,
  `active` BIT NULL DEFAULT 1 ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`campaigns`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`campaigns` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`campaigns` (
  `id` INT NOT NULL ,
  `campaignname` VARCHAR(45) NULL ,
  `startdate` DATETIME NULL ,
  `enddate` DATETIME NULL ,
  `description` BLOB NULL ,
  `couponslots` INT NULL ,
  `couponexpiration` INT NULL ,
  `createdat` DATETIME NULL ,
  `updatedat` DATETIME NULL ,
  `deletedat` DATETIME NULL ,
  `active` BIT NULL DEFAULT 1 ,
  `status` INT NULL ,
  `approved` BIT NOT NULL DEFAULT 0 ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`coupons`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`coupons` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`coupons` (
  `id` INT NOT NULL ,
  `couponcode` VARCHAR(155) NULL ,
  `issuedate` DATETIME NULL ,
  `expirationdate` DATETIME NULL ,
  `redeemdate` DATETIME NULL ,
  `createdat` DATETIME NULL ,
  `updatedat` DATETIME NULL ,
  `deletedat` DATETIME NULL ,
  `active` BIT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`users` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`users` (
  `id` INT NOT NULL ,
  `email` VARCHAR(155) NULL ,
  `zipcode` INT NULL ,
  `address` TEXT NULL ,
  `city` TEXT NULL ,
  `state` INT NULL ,
  `country` INT NULL ,
  `createdat` DATETIME NULL ,
  `updatedat` DATETIME NULL ,
  `deletedat` DATETIME NULL ,
  `password` VARCHAR(155) NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`adminusers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`adminusers` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`adminusers` (
  `id` INT NOT NULL ,
  `email` VARCHAR(155) NULL ,
  `password` VARCHAR(155) NULL ,
  `createdat` DATETIME NULL ,
  `updatedat` DATETIME NULL ,
  `deletedat` DATETIME NULL ,
  `role` INT NULL ,
  `active` BIT NULL DEFAULT 1 ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`userroles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`userroles` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`userroles` (
  `id` INT NOT NULL ,
  `role` TEXT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) )
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
