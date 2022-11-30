* **Plataforma**: [DIO (Digital Inovation One)](/dio/)
* **Bootcamp**: [Geração Tech Unimed-BH - Ciência de Dados: Básico; 126 Hrs](/dio/dados_unimed_1/)
* **Módulo_Bootcamp**: [3) Bancos de Dados SQL e NoSQL (17)](/dio/dados_unimed_1/03-modulo_database/)

# 3.3) Curso: Modelagem de Dados para Banco de Dados (2)
## Objetivos
Aprender comandos básicos em SQL no MySQL Workbench.
## Tecnologias
* Linguagem de Consulta: SQL
* Ambiente de Desenvolvimento: VS Code; Docker; Arquivo **.env**
* Banco de dados: MySQL; MySQL Workbench

<a id="ancora"></a>
## Índice
* 3.3.1) Overview sobre Modelagem de Dados (7)
    * 3.3.1.1) Introdução à Modelagem de dados - Parte 1
    * 3.3.1.2) Introdução à Modelagem de dados - Parte 2
    * 3.3.1.3) Instalação MySQL Windows
    * 3.3.1.4) PostgreSQL Windows
    * 3.3.1.5) Instalando MySQL no Ubuntu
    * 3.3.1.6) Instalando PostgreSQL no Ubuntu
    * [3.3.1.7) Explorando Comandos básicos SQL](#ancora1)
* 3.3.2) Materiais de apoio e Questionário (2)
    * 3.3.2.1) Materiais de apoio
    * 3.3.2.2) Certifique seu conhecimento

----------------------------------------------------------------------------------------------
<a id="ancora1"></a>
## 3.3.1.7) Explorando Comandos básicos SQL
[voltar](#ancora)   

* Exibindo os bancos de dados existentes
```
SHOW DATABASES;
```
* Criando um banco de dados
```
CREATE DATABASE RegistroDePublicoes;
```
* Exibindo os bancos de dados existentes
```
SHOW DATABASES;
```
* Acessando o banco de dados criado
```
USE RegistroDePublicoes;
```
* Exibindo as tabelas criadas
```
SHOW TABLES;
```
* Removendo o banco de dados criado
```
DROP DATABASE RegistroDePublicoes;
```
* Criando um outro banco de dados
```
CREATE DATABSE firstExample;
```
* Acessando esse novo banco de dados criado
```
USE firstExample;
```
* Criando a tabela **periodicos**
CREATE TABLE periodicos(
    id INT AUTO_INCREMENT,
    nome_periodico VARCHAR(20),
    issn INT,
    PRIMARY KEY (id)
);
* Criando a tabela **editora**
CREATE TABLE editora(
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    nome_editora VARCHAR(120) UNIQUE,
    pais VARCHAR(5)
);

* Exibindo todas as tabelas existentes
```
SHOW TABLES;
```
* Alterando a tabela **periodicos** e adicionando uma chave estrangeira
```
ALTER TABLE periodicos ADD CONSTRAINT fk_editora_periodico FOREIGN KEY (id_editora) REFERENCES editora(id);
```
* Inserindo os dados na tabela **editora**
```
INSERT INTO editora (nome_editora, pais) VALUES ('IEEE', 'EUA'), ('DataScienceMagazine', 'EUA')
```
* Selecionando os dados inseridos na tabela **editora**
```
SELECT * FROM editora;
```
* Inserindo mais dados na tabela **editora**
```
INSERT INTO editora (nome_editora, pais) VALUES ('IEEE_EU', 'EU');
```
* Selecionando os dados inseridos na tabela **editora**
```
SELECT * FROM editora;
```
* Selecionando os dados inseridos na tabela **periodicos**
```
SELECT * FROM periodicos;
```
* Inserindo os dados na tabela **periodicos**
```
INSERT INTO periodicos (nome_periodico, issn, id_editora) VALUES ('Special Issue', '156795164', '1');
```
* Selecionando os dados inseridos na tabela **periodicos**
```
SELECT * FROM periodicos;
```
* Tentando inserir duas linhas erradas de propósito para mostrar a variação do ID com a utilização do Auto Increment
```
INSERT INTO periodicos (nome_periodico, issn, id_editora) VALUES ('Special Issue 2', '186795164', '4');
```
* Selecionando os dados inseridos na tabela **periodicos**
```
SELECT * FROM periodicos;
```
* Exibindo todas as tabelas existentes
```
SHOW TABLES;
```