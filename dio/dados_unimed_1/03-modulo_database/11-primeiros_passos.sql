-- 11-Primeiros Passos com SQL
-- 11.1-Primeiros Passos com SQL
-- 11.1.4-Primeiro Contato com SQL e MySQL
SHOW DATABASES;
SHOW SCHEMAS;

CREATE SCHEMA test;
CREATE DATABASE test2;

SHOW DATABASES;
SHOW SCHEMA;

DROP DATABASE test;
DROP DATABASE test2;

USE mysql;
SHOW TABLES;
SHOW DATABASES;
DESC component;

-- 11.1.6-Criando meu Primeiro Esquema no MySQL - parte 1
SHOW DATABASES;
CREATE DATABASE IF NOT EXISTS first_example;
USE first_example;
SHOW TABLES;

CREATE TABLE IF NOT EXISTS person(
    person_id SMALLINT UNSIGNED,
    fname VARCHAR(20),
    lname VARCHAR(20),
    gender ENUM('M', 'F'),
    birth_date DATE,
    street VARCHAR(30),
    city VARCHAR(20),
    state VARCHAR(20),
    country VARCHAR(20),
    postal_code VARCHAR(20),
    CONSTRAINT pk_person PRIMARY KEY (person_id)
);

DESC person;

-- 11.1.7-Criando meu Primeiro Esquema no MySQL - parte 2
CREATE TABLE favorite_food(
    person_id SMALLINT UNSIGNED,
    food VARCHAR(20),
    CONSTRAINT pk_favoreite_food PRIMARY KEY (person_id, food),
    CONSTRAINT fk_favorite_food FOREIGN KEY (person_id) REFERENCES person(person_id)
);

DESC favorite_food;
SELECT * FROM information_schema.table_constraints WHERE CONSTRAINT_SCHEMA = 'first_example';
SELECT constraint_name FROM information_schema.table_constraints WHERE TABLE_NAME = 'person';


-- 11.1.8-Populando o Banco de Dados do Meu Primeiro Exemplo
INSERT INTO person VALUES ('2', 'Carolina', 'Silva', 'F', '1979-08-21', 'rua tal', 'Cidade J', 'RJ', 'Brasil', '26054-89');
SELECT * FROM person;

INSERT INTO person VALUES ('1', 'Carolina', 'Silva', 'F', '1979-08-21', 'rua tal', 'Cidade J', 'RJ', 'Brasil', '26054-89'), ('3', 'Carolina', 'Silva', 'F', '1979-08-21', 'rua tal', 'Cidade J', 'RJ', 'Brasil', '26054-89'), ('4', 'Carolina', 'Silva', 'F', '1979-08-21', 'rua tal', 'Cidade J', 'RJ', 'Brasil', '26054-89');
SELECT * FROM person;

INSERT INTO person VALUES ('5', 'Roberta', 'Silva', 'F', '1979-08-21', 'rua tal', 'Cidade J', 'RJ', 'Brasil', '26054-89'), ('6', 'Luiz', 'Silva', 'F', '1979-08-21', 'rua tal', 'Cidade J', 'RJ', 'Brasil', '26054-89');
SELECT * FROM person;

DELETE FROM person WHERE person_id = 2 or person_id = 3 or person_id = 4;
SELECT * FROM person;

INSERT INTO favorite_food VALUES (1, 'lasanha'), (5, 'carne assada'), (6, 'fetuccine');
SELECT * FROM favorite_food;


-- 11.1.10-Definindo o Esquema Relacional de COMPANY com SQL
--     CHECK (Dept_create_date <= Mgr_start_date), CHECK (Dnumber <> 0),
CREATE SCHEMA IF NOT EXISTS company;
CREATE TABLE IF NOT EXISTS company.employee(
    Fname VARCHAR(15) NOT NULL,
    Minit CHAR,
    Lname VARCHAR(15) NOT NULL,
    Ssn CHAR(9) NOT NULL,
    Bdate DATE,
    Address VARCHAR(30),
    Sex CHAR,
    Salary DECIMAL(10,2),
    Super_ssn CHAR(9),
    Dno INT NOT NULL,
    PRIMARY KEY (Ssn)
);

USE company;
CREATE TABLE IF NOT EXISTS departament(
    Dname VARCHAR(15) NOT NULL,
    Dnumber INT NOT NULL, 
    Mgr_ssn CHAR(9) NOT NULL,
    Mgr_start_date DATE,
    Dept_create_date DATE,
    PRIMARY KEY (Dnumber),
    UNIQUE (Dname),
    FOREIGN KEY (Mgr_ssn) REFERENCES employee(Ssn)
);

CREATE TABLE IF NOT EXISTS dept_locations(
    Dnumber INT NOT NULL,
    Dlocation VARCHAR(15) NOT NULL,
    PRIMARY KEY (Dnumber, Dlocation),
    FOREIGN KEY (Dnumber) REFERENCES departament(Dnumber)
);

CREATE TABLE IF NOT EXISTS project(
    Pname VARCHAR(15) NOT NULL,
    Pnumber INT NOT NULL,
    Plocation VARCHAR (15),
    Dnum INT NOT NULL,
    PRIMARY KEY (Pnumber),
    UNIQUE (Pname),
    FOREIGN KEY (Dnum) REFERENCES departament(Dnumber)
);

CREATE TABLE IF NOT EXISTS works_on(
    Essn CHAR(9) NOT NULL,
    Pno INT NOT NULL,
    Hours DECIMAL(3,1) NOT NULL,
    PRIMARY KEY (Essn, Pno),
    FOREIGN KEY (Essn) REFERENCES employee(Ssn),
    FOREIGN KEY (Pno) REFERENCES project(Pnumber)
);

CREATE TABLE IF NOT EXISTS dependent(
    Essn CHAR(9) NOT NULL,
    Dependent_name VARCHAR(15),
    Sex CHAR,
    Bdate DATE,
    Relationship VARCHAR(15),
    PRIMARY KEY (Essn, Dependent_name),
    FOREIGN KEY (Essn) REFERENCES employee(Ssn)
);

SHOW TABLES;
DESC works_on;