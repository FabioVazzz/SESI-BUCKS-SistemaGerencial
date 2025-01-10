-- MySQL Script generated by MySQL Workbench
-- Sun Nov 17 17:03:51 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema projeto
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema projeto
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `projeto` DEFAULT CHARACTER SET utf8 ;
USE `projeto` ;

-- -----------------------------------------------------
-- Table `projeto`.`produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto`.`produtos` (
  `codigo_produtos` INT NOT NULL AUTO_INCREMENT,
  `nome_produtos` VARCHAR(45) NOT NULL,
  `valor_produtos` DECIMAL(10,2) NOT NULL,
  `tipo_produtos` VARCHAR(30) NOT NULL,
  `qtd_produtos` INT NOT NULL,
  `tamanho_produtos` VARCHAR(10) NOT NULL,
  `descrição_produtos` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`codigo_produtos`),
  UNIQUE INDEX `codigo_produto_UNIQUE` (`codigo_produtos` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `projeto`.`vendas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto`.`vendas` (
  `codigo_vendas` INT NOT NULL AUTO_INCREMENT,
  `nomecliente_vendas` VARCHAR(45) NOT NULL,
  `pagamento_vendas` VARCHAR(20) NOT NULL,
  `data_vendas` DATETIME NOT NULL,
  `mesa_vendas` INT NOT NULL,
  `telefone_vendas` VARCHAR(15) NULL DEFAULT NULL,
  `valortotal_vendas` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`codigo_vendas`),
  UNIQUE INDEX `codigo_vendas_UNIQUE` (`codigo_vendas` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `projeto`.`produtos_has_vendas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto`.`produtos_has_vendas` (
  `produtos_codigo_produtos` INT NOT NULL,
  `vendas_codigo_vendas` INT NOT NULL,
  `valor_vendas` DECIMAL(10,2) NOT NULL,
  `qtd_vendas` INT NULL DEFAULT NULL,
  PRIMARY KEY (`produtos_codigo_produtos`, `vendas_codigo_vendas`),
  INDEX `fk_produtos_has_vendas_vendas1_idx` (`vendas_codigo_vendas` ASC) VISIBLE,
  INDEX `fk_produtos_has_vendas_produtos_idx` (`produtos_codigo_produtos` ASC) VISIBLE,
  CONSTRAINT `fk_produtos_has_vendas_produtos`
    FOREIGN KEY (`produtos_codigo_produtos`)
    REFERENCES `projeto`.`produtos` (`codigo_produtos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_produtos_has_vendas_vendas1`
    FOREIGN KEY (`vendas_codigo_vendas`)
    REFERENCES `projeto`.`vendas` (`codigo_vendas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `projeto`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto`.`usuarios` (
  `codigo_usuarios` INT NOT NULL AUTO_INCREMENT,
  `usuario_usuarios` VARCHAR(30) NULL,
  `senha_usuarios` VARCHAR(20) NULL,
  `email_usuarios` VARCHAR(55) NULL,
  `cargo_usuarios` ENUM("Gerente", "Chefe de Cozinha", "Atendente", "Garçom") NULL,
  `turno_usuarios` ENUM("Matutino", "Vespertino", "Noturno") NULL,
  `salario_usuarios` VARCHAR(15) NULL,
  PRIMARY KEY (`codigo_usuarios`),
  UNIQUE INDEX `codigo_usuarios_UNIQUE` (`codigo_usuarios` ASC) VISIBLE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
