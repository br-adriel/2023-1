DROP DATABASE IF EXISTS db_lista_sequence;

CREATE DATABASE db_lista_sequence;

USE db_lista_sequence;

CREATE TABLE
  cliente (
    codigo INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(200)
  );

CREATE TABLE
  piloto (
    codigo INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    num_voos INT NOT NULL DEFAULT '0'
  );

CREATE TABLE
  voo (
    codigo INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL,
    piloto INT NOT NULL,
    num_passageiros INT NOT NULL DEFAULT '0',
    distancia INT NOT NULL,
    CONSTRAINT `fk_voo_piloto` FOREIGN KEY (piloto) REFERENCES piloto (codigo)
  );

CREATE TABLE
  milhas (
    cliente INT NOT NULL,
    quantidade INT NOT NULL DEFAULT '0',
    CONSTRAINT `fk_milhas_cliente` FOREIGN KEY (cliente) REFERENCES cliente (codigo),
    PRIMARY KEY (cliente)
  );

CREATE TABLE
  cliente_voo (
    cliente INT NOT NULL,
    voo INT NOT NULL,
    classe VARCHAR(50) NOT NULL,
    CONSTRAINT `fk_cliente_voo_cliente` FOREIGN KEY (cliente) REFERENCES cliente (codigo),
    CONSTRAINT `fk_cliente_voo_voo` FOREIGN KEY (voo) REFERENCES voo (codigo),
    PRIMARY KEY (cliente, voo)
  );