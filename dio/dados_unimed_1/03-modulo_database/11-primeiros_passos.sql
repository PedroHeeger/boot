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

-- 11.1.14-Adicionando constraints ao nosso Banco de dados
SELECT * FROM information_schema.table_constraints WHERE CONSTRAINT_SCHEMA = 'company';
SELECT * FROM information_schema.referential_constraints WHERE CONSTRAINT_SCHEMA = 'company';

CREATE SCHEMA IF NOT EXISTS company_constraints;
CREATE TABLE IF NOT EXISTS company_constraints.employee(
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
    CONSTRAINT chk_salary CHECK (Salary > 2000.0),
    CONSTRAINT pk_employee PRIMARY KEY (Ssn)
);

USE company_constraints;
CREATE TABLE IF NOT EXISTS departament(
    Dname VARCHAR(15) NOT NULL,
    Dnumber INT NOT NULL, 
    Mgr_ssn CHAR(9) NOT NULL,
    Mgr_start_date DATE,
    Dept_create_date DATE,
    CONSTRAINT chk_date_dept CHECK (Dept_create_date < Mgr_start_date),
    CONSTRAINT pk_dept PRIMARY KEY (Dnumber),
    CONSTRAINT unique_name_dept UNIQUE (Dname),
    FOREIGN KEY (Mgr_ssn) REFERENCES employee(Ssn)
);

CREATE TABLE IF NOT EXISTS dept_locations(
    Dnumber INT NOT NULL,
    Dlocation VARCHAR(15) NOT NULL,
    CONSTRAINT pk_dept_locations PRIMARY KEY (Dnumber, Dlocation),
    CONSTRAINT fk_dept_locations FOREIGN KEY (Dnumber) REFERENCES departament(Dnumber)
);

CREATE TABLE IF NOT EXISTS project(
    Pname VARCHAR(15) NOT NULL,
    Pnumber INT NOT NULL,
    Plocation VARCHAR (15),
    Dnum INT NOT NULL,
    PRIMARY KEY (Pnumber),
    CONSTRAINT unique_projetct UNIQUE (Pname),
    CONSTRAINT fk_project FOREIGN KEY (Dnum) REFERENCES departament(Dnumber)
);

CREATE TABLE IF NOT EXISTS works_on(
    Essn CHAR(9) NOT NULL,
    Pno INT NOT NULL,
    Hours DECIMAL(3,1) NOT NULL,
    PRIMARY KEY (Essn, Pno),
    CONSTRAINT fk_employee_works_on FOREIGN KEY (Essn) REFERENCES employee(Ssn),
    CONSTRAINT fk_project_works_on FOREIGN KEY (Pno) REFERENCES project(Pnumber)
);

CREATE TABLE IF NOT EXISTS dependent(
    Essn CHAR(9) NOT NULL,
    Dependent_name VARCHAR(15),
    Sex CHAR,
    Bdate DATE,
    Relationship VARCHAR(15),
    Age INT NOT NULL,
    CONSTRAINT chk_dependent CHECK (Age < 22),
    PRIMARY KEY (Essn, Dependent_name),
    CONSTRAINT fk_dependent FOREIGN KEY (Essn) REFERENCES employee(Ssn)
);

SHOW TABLES;
DESC employee;
SELECT * FROM information_schema.table_constraints WHERE CONSTRAINT_SCHEMA = 'company_constraints';

-- 11.1.15-Adicionando constraints ao nosso Banco de dados com Alter Table
ALTER TABLE employee
    ADD CONSTRAINT fk_employee
    FOREIGN KEY (Super_ssn) REFERENCES employee(Ssn)
    ON DELETE SET NULL
    ON UPDATE CASCADE;

ALTER TABLE departament DROP CONSTRAINT departament_ibfk_1;
ALTER TABLE departament
    ADD CONSTRAINT fk_dept FOREIGN KEY (Mgr_ssn) REFERENCES employee(Ssn)
    ON UPDATE CASCADE;

SELECT * FROM information_schema.table_constraints WHERE CONSTRAINT_SCHEMA = 'company_constraints';

ALTER TABLE dept_locations DROP CONSTRAINT fk_dept_locations;
ALTER TABLE dept_locations
    ADD CONSTRAINT fk_dept_locations FOREIGN KEY (Dnumber) REFERENCES departament(Dnumber)
    ON DELETE CASCADE
    ON UPDATE CASCADE;


-- 11.1.16-Persistindo informações no banco de dados Employee
USE company_constraints;
SHOW TABLES;

INSERT INTO employee VALUES ('John', 'B', 'Smith', 123456789, '1965-01-09', '731-Fondren-Houston-TX', 'M', 30000, null, 5);

INSERT INTO employee VALUES ('Franklin', 'T', 'Wong', 333445555, '1955-12-08', '638-Voss-Houston-TX', 'M', 40000, 123456789, 5),
                           ('Alicia', 'J', 'Zelaya', 999887777, '1968-01-19', '3321-Castle-Spring-TX', 'F', 25000, 333445555, 4),
                           ('Jennifer', 'S', 'Wallace', 987654321, '1941-06-20', '291-Berry-Bellaire-TX', 'F', 43000, null, 4),
                           ('Ramesh', 'K', 'Narayan', 666884444, '1962-09-15', '975-Fire-Oak-Humble', 'M', 38000, 987654321, 5),
                           ('Joyce', 'A', 'English', 453453453, '1972-07-31', '5631-Rice-Houston-TX', 'F', 25000, 987654321, 5),
                           ('Ahmad', 'V', 'Jabbar', 987987987, '1969-03-29', '980-Dallas-Houston-TX', 'M', 25000, 123456789, 4),
                           ('James', 'E', 'Borg', 888665555, '1937-11-10', '450-Stone-Houston-TX', 'M', 55000, 333445555, 1);
SELECT * FROM employee;

DROP TABLE dependent;
CREATE TABLE IF NOT EXISTS dependent(
    Essn CHAR(9) NOT NULL,
    Dependent_name VARCHAR(15),
    Sex CHAR,
    Bdate DATE,
    Relationship VARCHAR(15),
    PRIMARY KEY (Essn, Dependent_name),
    CONSTRAINT fk_dependent FOREIGN KEY (Essn) REFERENCES employee(Ssn)
);

INSERT INTO dependent VALUES (333445555, 'Alice', 'F', '1986-04-05', 'Daughter'),
                             (333445555, 'Theodore', 'M', '1983-10-25', 'Son'),
                             (333445555, 'Joy', 'F', '1958-05-03', 'Spouse'),
                             (987654321, 'Abner', 'M', '1942-02-28', 'Spouse'),
                             (123456789, 'Michael', 'M', '1988-01-04', 'Son'),
                             (123456789, 'Alice', 'F', '1988-12-30', 'Daughter'),
                             (123456789, 'Elizabeth', 'F', '1967-05-05', 'Spouse');

SELECT * FROM dependent;

INSERT INTO departament VALUES ('Research', 5, 333445555, '1988-05-22', '1986-05-22'),
                               ('Administration', 4, 987654321, '1995-01-01', '1994-01-01'),
                               ('Headquarters', 1, 888665555, '1981-06-19', '1980-06-19');
SELECT * FROM departament;

INSERT INTO dept_locations VALUES (1, 'Houston'),
                                  (4, 'Stafford'),
                                  (5, 'Bellaire'),
                                  (5, 'Sugarland'),
                                  (5, 'Houston');
SELECT * FROM dept_locations;                        

INSERT INTO project VALUES ('ProductX', 1, 'Bellaire', 5),
                           ('ProductY', 2, 'Sugarland', 5),
                           ('ProductZ', 3, 'Houston', 5),
                           ('Computerization', 10, 'Stafford', 4),
                           ('Reorganization', 20, 'Houston', 1),
                           ('Newbenefits', 30, 'Stafford', 4);
SELECT * FROM project;

INSERT INTO works_on VALUES (123456789, 1, 32.5),
                            (123456789, 2, 7.5),
                            (666884444, 3, 40.0),
                            (453453453, 1, 20.0),
                            (453453453, 2, 20.0),
                            (333445555, 2, 10.0),
                            (333445555, 3, 10.0),
                            (333445555, 10, 10.0),
                            (333445555, 20, 10.0),
                            (999887777, 30, 30.0),
                            (999887777, 10, 10.0),
                            (987987987, 10, 35.0),
                            (987987987, 30, 5.0),
                            (987654321, 30, 20.0),
                            (987654321, 20, 15.0),
                            (888665555, 20, 0.0);
SELECT * FROM works_on;

load data infile 'path' into table employee
    fields terminated by ','
    lines terminated by ';';

-- 11.1.17-Recuperando dados com Queries SQL
SELECT * FROM employee;

-- gerente e seu departamento:
SELECT Ssn, Fname, Dname FROM employee e, departament d WHERE (e.Ssn = d.Mgr_ssn);

-- funcionário, seu dependente e a relação:
SELECT Fname, Dependent_name, Relationship FROM employee, dependent WHERE Essn = Ssn;

-- data de aniversário e endereço:
SELECT Bdate, Address FROM employee WHERE Fname='John' and Minit='B' and Lname='Smith';

-- departamento específico:
SELECT * FROM departament WHERE Dname='Research';

-- funcionários que trabalham em pesquisa:
SELECT Fname, Lname, Address FROM employee, departament WHERE Dname='Research' and Dnumber=Dno;

-- projeto, funcionário e horas:
SELECT Pname, Essn, Fname, Hours FROM project, works_on, employee WHERE Pnumber=Pno and Essn=Ssn;


-- 11.1.18-Nomes, Aliasing e Variação de Tuplas - SQL
SELECT Fname, employee.Name, Address FROM employee, departament 
    WHERE departament.Name='Research' and departament.Dnumber=employee.Dnumber;

-- funcionários do departamento de pesquisa:
SELECT employee.Fname, employee.Lname, employee.Address FROM employee, departament 
    WHERE departament.Dname='Research' and departament.Dnumber=employee.Dno;


-- 11.1.19-Realizando Queries com Alias
USE company_constraints;
SHOW TABLES;

-- departamento e suas localidades:
SELECT Dname, l.Dlocation as Dependent_name FROM departament as d, dept_locations as l 
    WHERE d.Dnumber=l.Dnumber;

SELECT concat(Fname, ' ', Lname) as Employee from employee;
