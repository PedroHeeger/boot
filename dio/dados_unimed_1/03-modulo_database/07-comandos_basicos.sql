-- 3-Modelagem de Dados para Banco de Dados
-- 3.1-Overview sobre Modelagem de Dados
-- 3.1.7-Explorando Comandos básicos SQL
SHOW DATABASES;

CREATE DATABASE RegistroDePublicoes;

SHOW DATABASES;

USE RegistroDePublicoes;

SHOW TABLES;

DROP DATABASE RegistroDePublicoes;

CREATE DATABSE firstExample;
use firstExample;

CREATE TABLE periodicos(
    id INT AUTO_INCREMENT,
    nome_periodico VARCHAR(20),
    issn INT,
    PRIMARY KEY (id)
);

CREATE TABLE editora(
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    nome_editora VARCHAR(120) UNIQUE,
    pais VARCHAR(5)
);

SHOW TABLES;

ALTER TABLE periodicos ADD CONSTRAINT fk_editora_periodico FOREIGN KEY (id_editora) REFERENCES editora(id);

INSERT INTO editora (nome_editora, pais) VALUES ('IEEE', 'EUA'), ('DataScienceMagazine', 'EUA')

SELECT * FROM editora;

INSERT INTO editora (nome_editora, pais) VALUES ('IEEE_EU', 'EU');

SELECT * FROM editora;

SELECT * FROM periodicos;

INSERT INTO periodicos (nome_periodico, issn, id_editora) VALUES ('Special Issue', '156795164', '1');

SELECT * FROM periodicos;

-- Aqui ela tenta inserir duas linhas erradas de propósito para mostrar a variação do ID com a utilização do Auto Increment
INSERT INTO periodicos (nome_periodico, issn, id_editora) VALUES ('Special Issue 2', '186795164', '4');

SELECT * FROM periodicos;

SHOW TABLES;