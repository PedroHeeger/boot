* **Plataforma**: [DIO (Digital Inovation One)](/dio/)
* **Bootcamp**: [Geração Tech Unimed-BH - Ciência de Dados: Básico; 126 Hrs](/dio/dados_unimed_1/)
* **Módulo_Bootcamp**: [3) Bancos de Dados SQL e NoSQL (17)](/dio/dados_unimed_1/03-modulo_database/)

# 3.11) Curso: Primeiros Passos com SQL (2)
## Objetivos
Aprender comandos básicos em SQL no MySQL Workbench.
## Tecnologias
* Linguagem de Consulta: SQL
* Ambiente de Desenvolvimento: VS Code; Docker; Arquivo **.env**
* Banco de dados: MySQL; MySQL Workbench

<a id="ancora"></a>
## Índice
* 3.11.1) Primeiros Passos com SQL (21)
    * 3.11.1.1) Introdução ao SQL
    * 3.11.1.2) Sublinguagens: Classificações de SQL-DDL
    * 3.11.1.3) Explorando um Primeiro Exemplo utilizando DDL
    * [3.11.1.4) Primeiro Contato com SQL e MySQL](#ancora1)
    * 3.11.1.5) Considerações sobre o ambiente do SGBD
    * [3.11.1.6) Criando meu Primeiro Esquema no MySQL - parte 1](#ancora2)
    * [3.11.1.7) Criando meu Primeiro Esquema no MySQL - parte 2](#ancora3)
    * [3.11.1.8) Populando o Banco de Dados do Meu Primeiro Exemplo](#ancora4)
    * 3.11.1.9) Continuando com as Classificações (DML, DCL e DQL) Statements, Cláusulas, Termos e Esquema
    * [3.11.1.10) Definindo o Esquema Relacional de COMPANY com SQL](#ancora5)
    * 3.11.1.11) Tipos de dados no MySQL
    * 3.11.1.12) Constraints: Especificando Restrinções em SQL
    * 3.11.1.13) Queries/Insertion com SQL
    * [3.11.1.14) Adicionando constraints ao nosso Banco de dados](#ancora6)
    * [3.11.1.15) Adicionando constraints ao nosso Banco de dados com Alter Table](#ancora7)
    * [3.11.1.16) Persistindo informações no banco de dados Employee](#ancora8)
    * [3.11.1.17) Recuperando dados com Queries SQL](#ancora9)
    * [3.11.1.18) Nomes, Aliasing e Variação de Tuplas - SQL](#ancora10)
    * [3.11.1.19) Realizando Queries com Alias](#ancora11)
    * 3.11.1.20) When Good Statements Go Bad
    * 3.11.1.21) MySQL e PostgreSQL e suas diferenças 
* 3.11.2) Materiais de apoio e Questionário (2)
    * 3.11.2.1) Materiais de apoio
    * 3.11.2.2) Certifique seu conhecimento

----------------------------------------------------------------------------------------------
<a id="ancora1"></a>
## 3.11.1.4) Primeiro Contato com SQL e MySQL
[voltar](#ancora) 

* Exibindo os bancos de dados existentes
```
SHOW DATABASES;
```
* Exibindo os schemas (banco de dados) existentes
```
SHOW SCHEMAS;
```
* Criando um esquema
```
CREATE SCHEMA test;
```
* Criando um banco de dados
```
CREATE DATABASE test2;
```
* Exibindo os bancos de dados existentes
```
SHOW DATABASES;
```
* Exibindo os schemas (banco de dados) existentes
```
SHOW SCHEMAS;
```
* Removendo um banco de dados existente
```
DROP DATABASE test;
DROP DATABASE test2;
```
* Removendo um banco de dados existente
```
DROP SCHEMA test2;
```
* Acessando um banco de dados existente
```
USE mysql;
```
* Exibindo as tabelas criadas
```
SHOW TABLES;
```
* Exibindo os bancos de dados existentes
```
SHOW DATABASES;
```
* Exibindo a descrição da tabela criada
```
DESC component;
```

----------------------------------------------------------------------------------------------
<a id="ancora2"></a>
## 3.11.1.6) Criando meu Primeiro Esquema no MySQL - parte 1
[voltar](#ancora) 

* Exibindo os bancos de dados existentes
```
SHOW DATABASES;
```
* Criando um outro banco de dados caso não já exista
```
CREATE DATABASE IF NOT EXISTS first_example;
```
* Acessando o novo banco de dados criado
```
USE first_example;
```
* Exibindo as tabelas criadas
```
SHOW TABLES;
```
* Criando uma tabela caso ela não já exista
```
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
```
* Exibindo a descrição da tabela criada
```
DESC person;
```

----------------------------------------------------------------------------------------------
<a id="ancora3"></a>
## 3.11.1.7) Criando meu Primeiro Esquema no MySQL - parte 2
[voltar](#ancora) 

* Criando uma nova tabela
```
CREATE TABLE favorite_food(
    person_id SMALLINT UNSIGNED,
    food VARCHAR(20),
    CONSTRAINT pk_favoreite_food PRIMARY KEY (person_id, food),
    CONSTRAINT fk_favorite_food FOREIGN KEY (person_id) REFERENCES person(person_id)
);
```
* Exibindo a descrição da tabela criada
```
DESC favorite_food;
```
* Selecionando tudo da tabela de constraints para condição determinada
```
SELECT * FROM information_schema.table_constraints WHERE CONSTRAINT_SCHEMA = 'first_example';
```
* Selecionando as constraints da tabela de constraints para condição determinada
```
SELECT constraint_name FROM information_schema.table_constraints WHERE TABLE_NAME = 'person';
```

----------------------------------------------------------------------------------------------
<a id="ancora4"></a>
## 3.11.1.8) Populando o Banco de Dados do Meu Primeiro Exemplo
[voltar](#ancora) 

* Inserindo os dados na tabela **person**
```
INSERT INTO person VALUES ('2', 'Carolina', 'Silva', 'F', '1979-08-21', 'rua tal', 'Cidade J', 'RJ', 'Brasil', '26054-89');
```
* Selecionando os dados inseridos na tabela **person**
```
SELECT * FROM person;
```
* Inserindo mais dados na tabela **person**
```
INSERT INTO person VALUES ('1', 'Carolina', 'Silva', 'F', '1979-08-21', 'rua tal', 'Cidade J', 'RJ', 'Brasil', '26054-89'), ('3', 'Carolina', 'Silva', 'F', '1979-08-21', 'rua tal', 'Cidade J', 'RJ', 'Brasil', '26054-89'), ('4', 'Carolina', 'Silva', 'F', '1979-08-21', 'rua tal', 'Cidade J', 'RJ', 'Brasil', '26054-89');
```
* Selecionando os dados inseridos na tabela **person**
```
SELECT * FROM person;
```
* Inserindo mais dados na tabela **person**
```
INSERT INTO person VALUES ('5', 'Roberta', 'Silva', 'F', '1979-08-21', 'rua tal', 'Cidade J', 'RJ', 'Brasil', '26054-89'), ('6', 'Luiz', 'Silva', 'F', '1979-08-21', 'rua tal', 'Cidade J', 'RJ', 'Brasil', '26054-89');
```
* Selecionando os dados inseridos na tabela **person**
```
SELECT * FROM person;
```
* Removendo os dados determinado da tabela **person**
```
DELETE FROM person WHERE person_id = 2 or person_id = 3 or person_id = 4;
```
* Selecionando os dados inseridos na tabela **person**
```
SELECT * FROM person;
```
* Inserindo os dados na tabela **favorite_food**
```
INSERT INTO favorite_food VALUES (1, 'lasanha'), (5, 'carne assada'), (6, 'fetuccine');
```
* Selecionando os dados inseridos na tabela **favorite_food**
```
SELECT * FROM favorite_food;
```

----------------------------------------------------------------------------------------------
<a id="ancora5"></a>
## 3.11.1.10) Definindo o Esquema Relacional de COMPANY com SQL
[voltar](#ancora) 
--     CHECK (Dept_create_date <= Mgr_start_date), CHECK (Dnumber <> 0),

* Criando um esquema (banco de dados) para um cenário de **company**
```
CREATE SCHEMA IF NOT EXISTS company;
```
* Criando a tabela **employee** caso não já exista
O Social Security Number (SSN) é um número de identificação pessoal nos Estados Unidos, bastante semelhante ao CPF no Brasil.
```
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
```
* Acessando o banco de dados criado
```
USE company;
```
* Criando a tabela de department caso não já exista
```
CREATE TABLE IF NOT EXISTS department(
    Dname VARCHAR(15) NOT NULL,
    Dnumber INT NOT NULL, 
    Mgr_ssn CHAR(9) NOT NULL,
    Mgr_start_date DATE,
    Dept_create_date DATE,
    PRIMARY KEY (Dnumber),
    UNIQUE (Dname),
    FOREIGN KEY (Mgr_ssn) REFERENCES employee(Ssn)
);
```
* Criando a tabela dept_locations caso não já exista
```
CREATE TABLE IF NOT EXISTS dept_locations(
    Dnumber INT NOT NULL,
    Dlocation VARCHAR(15) NOT NULL,
    PRIMARY KEY (Dnumber, Dlocation),
    FOREIGN KEY (Dnumber) REFERENCES departament(Dnumber)
);
```
* Criando a tabela project caso não já exista
```
CREATE TABLE IF NOT EXISTS project(
    Pname VARCHAR(15) NOT NULL,
    Pnumber INT NOT NULL,
    Plocation VARCHAR (15),
    Dnum INT NOT NULL,
    PRIMARY KEY (Pnumber),
    UNIQUE (Pname),
    FOREIGN KEY (Dnum) REFERENCES departament(Dnumber)
);
```
* Criando a tabela works_on caso não ja exista
```
CREATE TABLE IF NOT EXISTS works_on(
    Essn CHAR(9) NOT NULL,
    Pno INT NOT NULL,
    Hours DECIMAL(3,1) NOT NULL,
    PRIMARY KEY (Essn, Pno),
    FOREIGN KEY (Essn) REFERENCES employee(Ssn),
    FOREIGN KEY (Pno) REFERENCES project(Pnumber)
);
```
* Criando a tabela dependent caso não já exista
```
CREATE TABLE IF NOT EXISTS dependent(
    Essn CHAR(9) NOT NULL,
    Dependent_name VARCHAR(15),
    Sex CHAR,
    Bdate DATE,
    Relationship VARCHAR(15),
    PRIMARY KEY (Essn, Dependent_name),
    FOREIGN KEY (Essn) REFERENCES employee(Ssn)
);
```
* Exibindo as tabelas criadas
```
SHOW TABLES;
```
* Exibindo a descrição da tabela criada
```
DESC works_on;
```

----------------------------------------------------------------------------------------------
<a id="ancora6"></a>
## 3.11.1.14) Adicionando constraints ao nosso Banco de dados
[voltar](#ancora) 

* Selecionando tudo da tabela de constraints para a condição determinada
```
SELECT * FROM information_schema.table_constraints WHERE CONSTRAINT_SCHEMA = 'company';
```
* Selecionando tudo da tabela de constraints referências para a condição determinada
```
SELECT * FROM information_schema.referential_constraints WHERE CONSTRAINT_SCHEMA = 'company';
```
* Criando um novo esquema (banco de dados) caso não exista
```
CREATE SCHEMA IF NOT EXISTS company_constraints;
```
* Criando a tabela **employee** para esse novo esquema caso não já exista
```
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
```
* Acessando o novo banco criado
```
USE company_constraints;
```
* Criando a tabela **department** para esse novo esquema caso não já exista
```
CREATE TABLE IF NOT EXISTS department(
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
```
* Criando a tabela **dept_locations** para esse novo esquema caso não já exista
```
CREATE TABLE IF NOT EXISTS dept_locations(
    Dnumber INT NOT NULL,
    Dlocation VARCHAR(15) NOT NULL,
    CONSTRAINT pk_dept_locations PRIMARY KEY (Dnumber, Dlocation),
    CONSTRAINT fk_dept_locations FOREIGN KEY (Dnumber) REFERENCES departament(Dnumber)
);
```
* Criando a tabela **project** para esse novo esquema caso não já exista
```
CREATE TABLE IF NOT EXISTS project(
    Pname VARCHAR(15) NOT NULL,
    Pnumber INT NOT NULL,
    Plocation VARCHAR (15),
    Dnum INT NOT NULL,
    PRIMARY KEY (Pnumber),
    CONSTRAINT unique_projetct UNIQUE (Pname),
    CONSTRAINT fk_project FOREIGN KEY (Dnum) REFERENCES departament(Dnumber)
);
```
* Criando a tabela **works_on** para esse novo esquema caso não já exista
```
CREATE TABLE IF NOT EXISTS works_on(
    Essn CHAR(9) NOT NULL,
    Pno INT NOT NULL,
    Hours DECIMAL(3,1) NOT NULL,
    PRIMARY KEY (Essn, Pno),
    CONSTRAINT fk_employee_works_on FOREIGN KEY (Essn) REFERENCES employee(Ssn),
    CONSTRAINT fk_project_works_on FOREIGN KEY (Pno) REFERENCES project(Pnumber)
);
```
* Criando a tabela **dependent** para esse novo esquema caso não já exista
```
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
```
* Exibindo as tabelas criadas
```
SHOW TABLES;
```
* Exibindo a descrição da tabela criada
```
DESC employee;
```
* Selecionando tudo da tabela constraints para a condição determinada
```
SELECT * FROM information_schema.table_constraints WHERE CONSTRAINT_SCHEMA = 'company_constraints';
```

----------------------------------------------------------------------------------------------
<a id="ancora7"></a>
## 3.11.1.15) Adicionando constraints ao nosso Banco de dados com Alter Table
[voltar](#ancora) 

* Alterando a tabela **employee** e adicionando constraint
```
ALTER TABLE employee
    ADD CONSTRAINT fk_employee
    FOREIGN KEY (Super_ssn) REFERENCES employee(Ssn)
    ON DELETE SET NULL
    ON UPDATE CASCADE;
```
* Alterando a tabela **department** e removendo uma constraint
```
ALTER TABLE department DROP CONSTRAINT departament_ibfk_1;
```
* Alterando a tabela **department** e adicionando uma nova constraint
```
ALTER TABLE department
    ADD CONSTRAINT fk_dept FOREIGN KEY (Mgr_ssn) REFERENCES employee(Ssn)
    ON UPDATE CASCADE;
```
* Selecionando tudo da tabela constraints para a condição determinada
```
SELECT * FROM information_schema.table_constraints WHERE CONSTRAINT_SCHEMA = 'company_constraints';
```
* Alterando a tabela **dept_locations** e removendo uma constraint
```
ALTER TABLE dept_locations DROP CONSTRAINT fk_dept_locations;
```
* Alterando a tabela **dept_locations** e adicionando uma nova constraint
```
ALTER TABLE dept_locations
    ADD CONSTRAINT fk_dept_locations FOREIGN KEY (Dnumber) REFERENCES departament(Dnumber)
    ON DELETE CASCADE
    ON UPDATE CASCADE;
```

----------------------------------------------------------------------------------------------
<a id="ancora8"></a>
## 3.11.1.16) Persistindo informações no banco de dados Employee
[voltar](#ancora) 

* Acessando o banco de dados **company_constraints**
```
USE company_constraints;
```
* Exibindo as tabelas criadas
```
SHOW TABLES;
```
* Inserindo APENAS uma instância na tabela **employee**
```
INSERT INTO employee VALUES ('John', 'B', 'Smith', 123456789, '1965-01-09', '731-Fondren-Houston-TX', 'M', 30000, null, 5);
```
* Inserindo MAIS uma instância na tabela **employee** 
```
INSERT INTO employee VALUES ('Franklin', 'T', 'Wong', 333445555, '1955-12-08', '638-Voss-Houston-TX', 'M', 40000, 123456789, 5),
                           ('Alicia', 'J', 'Zelaya', 999887777, '1968-01-19', '3321-Castle-Spring-TX', 'F', 25000, 333445555, 4),
                           ('Jennifer', 'S', 'Wallace', 987654321, '1941-06-20', '291-Berry-Bellaire-TX', 'F', 43000, null, 4),
                           ('Ramesh', 'K', 'Narayan', 666884444, '1962-09-15', '975-Fire-Oak-Humble', 'M', 38000, 987654321, 5),
                           ('Joyce', 'A', 'English', 453453453, '1972-07-31', '5631-Rice-Houston-TX', 'F', 25000, 987654321, 5),
                           ('Ahmad', 'V', 'Jabbar', 987987987, '1969-03-29', '980-Dallas-Houston-TX', 'M', 25000, 123456789, 4),
                           ('James', 'E', 'Borg', 888665555, '1937-11-10', '450-Stone-Houston-TX', 'M', 55000, 333445555, 1);
```
* Selecionando tudo da tabela **employee**
```
SELECT * FROM employee;
```
* Removendo a tabela **dependent**
```
DROP TABLE dependent;
```
* Criando novamente a tabela **dependent** caso não já exista
```
CREATE TABLE IF NOT EXISTS dependent(
    Essn CHAR(9) NOT NULL,
    Dependent_name VARCHAR(15),
    Sex CHAR,
    Bdate DATE,
    Relationship VARCHAR(15),
    PRIMARY KEY (Essn, Dependent_name),
    CONSTRAINT fk_dependent FOREIGN KEY (Essn) REFERENCES employee(Ssn)
);
```
* Inserindo os dados na tabela **dependent**
```
INSERT INTO dependent VALUES (333445555, 'Alice', 'F', '1986-04-05', 'Daughter'),
                             (333445555, 'Theodore', 'M', '1983-10-25', 'Son'),
                             (333445555, 'Joy', 'F', '1958-05-03', 'Spouse'),
                             (987654321, 'Abner', 'M', '1942-02-28', 'Spouse'),
                             (123456789, 'Michael', 'M', '1988-01-04', 'Son'),
                             (123456789, 'Alice', 'F', '1988-12-30', 'Daughter'),
                             (123456789, 'Elizabeth', 'F', '1967-05-05', 'Spouse');
```
* Selecionando tudo da tabela **dependent**
```
SELECT * FROM dependent;
```
* Inserindo os dados na tabela **department**
```
INSERT INTO department VALUES ('Research', 5, 333445555, '1988-05-22', '1986-05-22'),
                               ('Administration', 4, 987654321, '1995-01-01', '1994-01-01'),
                               ('Headquarters', 1, 888665555, '1981-06-19', '1980-06-19');
```
* Selecionando tudo da tabela **department**
```
SELECT * FROM department;
```
* Inserindo os dados na tabela **dept_locations**
```
INSERT INTO dept_locations VALUES (1, 'Houston'),
                                  (4, 'Stafford'),
                                  (5, 'Bellaire'),
                                  (5, 'Sugarland'),
                                  (5, 'Houston');
```
* Selecionando tudo na tabela **dept_locations**
```
SELECT * FROM dept_locations;                        
```
* Inserindo os dados na tabela **project**
```
INSERT INTO project VALUES ('ProductX', 1, 'Bellaire', 5),
                           ('ProductY', 2, 'Sugarland', 5),
                           ('ProductZ', 3, 'Houston', 5),
                           ('Computerization', 10, 'Stafford', 4),
                           ('Reorganization', 20, 'Houston', 1),
                           ('Newbenefits', 30, 'Stafford', 4);
```
* Selecionando tudo da tabela **project**
```
SELECT * FROM project;
```
* Inserindo os dados na tabela **works_on**
```
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
```
* Selecionando tudo da tabela **works_on**
```
SELECT * FROM works_on;
```
* Inserindo os dados na tabela **employee** através de arquivo csv (Apenas exemplo)
load data infile 'path' into table employee
    fields terminated by ','
    lines terminated by ';';

----------------------------------------------------------------------------------------------
<a id="ancora9"></a>
## 3.11.1.17) Recuperando dados com Queries SQL
[voltar](#ancora) 

* Selecionando tudo da tabela **employee**
```
SELECT * FROM employee;
```
* Selecionando o gerente e seu departamento
```
SELECT Ssn, Fname, Dname FROM employee e, departament d WHERE (e.Ssn = d.Mgr_ssn);
```
* Selecionando o funcionário, seu dependente e a relação entre eles
```
SELECT Fname, Dependent_name, Relationship FROM employee, dependent WHERE Essn = Ssn;
```
* Selecionando a data de aniversário e o endereço
```
SELECT Bdate, Address FROM employee WHERE Fname='John' and Minit='B' and Lname='Smith';
```
* Selecionando um departamento específico
```
SELECT * FROM departament WHERE Dname='Research';
```
* Selecionando os funcionários que trabalham em pesquisa
```
SELECT Fname, Lname, Address FROM employee, departament WHERE Dname='Research' and Dnumber=Dno;
```
* Selecionando o projeto, o funcionário e as horas nesse projeto
```
SELECT Pname, Essn, Fname, Hours FROM project, works_on, employee WHERE Pnumber=Pno and Essn=Ssn;
```

----------------------------------------------------------------------------------------------
<a id="ancor10"></a>
## 3.11.1.18) Nomes, Aliasing e Variação de Tuplas - SQL
[voltar](#ancora) 

* Selecionando o departamento, o funcionário e o endereço
```
SELECT Fname, employee.Name, Address FROM employee, departament 
    WHERE departament.Name='Research' and departament.Dnumber=employee.Dnumber;
```
* Selecionando os funcionários do departamento de pesquisa
```
SELECT employee.Fname, employee.Lname, employee.Address FROM employee, departament 
    WHERE departament.Dname='Research' and departament.Dnumber=employee.Dno;
```

----------------------------------------------------------------------------------------------
<a id="ancora11"></a>
## 3.11.1.19) Realizando Queries com Alias
[voltar](#ancora) 

* Acessando o banco de dados **company_constraints**
USE company_constraints;
* Exibindo as tabelas criadas
```
SHOW TABLES;
```
* Selecionando o departamento e suas localidades
```
SELECT Dname, l.Dlocation as Dependent_name FROM departament as d, dept_locations as l 
    WHERE d.Dnumber=l.Dnumber;
```
* Selecionando o nome completo dos funcionários concatenando
```
SELECT concat(Fname, ' ', Lname) as Employee from employee;
```