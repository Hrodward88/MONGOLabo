-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema publications
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema blockbuster
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema blockbuster
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `blockbuster` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `blockbuster` ;

-- -----------------------------------------------------
-- Table `blockbuster`.`Actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`Actor` (
  `actor_id` INT NOT NULL,
  `last_name` VARCHAR(45) NULL DEFAULT NULL,
  `last_update` VARCHAR(45) NULL DEFAULT NULL,
  `first_name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`actor_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `blockbuster`.`Categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`Categories` (
  `category_id` INT NOT NULL,
  `last_update` VARCHAR(45) NULL DEFAULT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `blockbuster`.`Language`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`Language` (
  `language_id` INT NOT NULL,
  `last_update` VARCHAR(45) NULL DEFAULT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`language_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `blockbuster`.`Rental`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`Rental` (
  `rental_id` INT NOT NULL,
  `rental_date` VARCHAR(45) NULL DEFAULT NULL,
  `inventory_id` INT NULL DEFAULT NULL,
  `customer_id` VARCHAR(45) NULL DEFAULT NULL,
  `return_date` VARCHAR(45) NULL DEFAULT NULL,
  `staff_id` VARCHAR(45) NULL DEFAULT NULL,
  `last_update` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`rental_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `blockbuster`.`inventory2`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`inventory2` (
  `inventory_id` INT NOT NULL,
  `film_id` INT NULL DEFAULT NULL,
  `store_id` INT NULL DEFAULT NULL,
  `last_update` TEXT NULL DEFAULT NULL,
  `Rental_rental_id` INT NOT NULL,
  PRIMARY KEY (`inventory_id`),
  INDEX `fk_inventory2_Rental1_idx` (`Rental_rental_id` ASC) VISIBLE,
  CONSTRAINT `fk_inventory2_Rental1`
    FOREIGN KEY (`Rental_rental_id`)
    REFERENCES `blockbuster`.`Rental` (`rental_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `blockbuster`.`old_hdd2`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`old_hdd2` (
  `first_name` TEXT NULL DEFAULT NULL,
  `last_name` TEXT NULL DEFAULT NULL,
  `title` TEXT NULL DEFAULT NULL,
  `release_year` INT NULL DEFAULT NULL,
  `category_id` INT NOT NULL,
  `Actor_actor_id` INT NOT NULL,
  `Categories_category_id` INT NOT NULL,
  PRIMARY KEY (`category_id`),
  INDEX `fk_old_hdd2_Actor1_idx` (`Actor_actor_id` ASC) VISIBLE,
  INDEX `fk_old_hdd2_Categories1_idx` (`Categories_category_id` ASC) VISIBLE,
  CONSTRAINT `fk_old_hdd2_Actor1`
    FOREIGN KEY (`Actor_actor_id`)
    REFERENCES `blockbuster`.`Actor` (`actor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_old_hdd2_Categories1`
    FOREIGN KEY (`Categories_category_id`)
    REFERENCES `blockbuster`.`Categories` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `blockbuster`.`films_clean2`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`films_clean2` (
  `film_id` INT NOT NULL,
  `title` TEXT NULL DEFAULT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `release_year` INT NULL DEFAULT NULL,
  `language_id` INT NULL DEFAULT NULL,
  `rental_duration` INT NULL DEFAULT NULL,
  `rental_rate` DOUBLE NULL DEFAULT NULL,
  `length` INT NULL DEFAULT NULL,
  `replacement_cost` DOUBLE NULL DEFAULT NULL,
  `rating` TEXT NULL DEFAULT NULL,
  `special_features` TEXT NULL DEFAULT NULL,
  `last_update` TEXT NULL DEFAULT NULL,
  `inventory2_inventory_id` INT NOT NULL,
  `Language_language_id` INT NOT NULL,
  `old_hdd2_category_id` INT NOT NULL,
  PRIMARY KEY (`film_id`),
  INDEX `fk_films_clean2_inventory21_idx` (`inventory2_inventory_id` ASC) VISIBLE,
  INDEX `fk_films_clean2_Language1_idx` (`Language_language_id` ASC) VISIBLE,
  INDEX `fk_films_clean2_old_hdd21_idx` (`old_hdd2_category_id` ASC) VISIBLE,
  CONSTRAINT `fk_films_clean2_inventory21`
    FOREIGN KEY (`inventory2_inventory_id`)
    REFERENCES `blockbuster`.`inventory2` (`inventory_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_films_clean2_Language1`
    FOREIGN KEY (`Language_language_id`)
    REFERENCES `blockbuster`.`Language` (`language_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_films_clean2_old_hdd21`
    FOREIGN KEY (`old_hdd2_category_id`)
    REFERENCES `blockbuster`.`old_hdd2` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
