* **Plataforma**: [DIO (Digital Inovation One)](/dio/)
* **Bootcamp**: [Geração Tech Unimed-BH - Ciência de Dados: Básico; 126 Hrs](/dio/dados_unimed_1/)
* **Módulo_Bootcamp**: [3) Bancos de Dados SQL e NoSQL (17)](/dio/dados_unimed_1/03-modulo_database/)

# 3.11) Curso: Primeiros Passos com SQL (2)
## Objetivos
* Aprender comandos básicos em SQL no MySQL Workbench;
* Criar um esquema de banco de dados para o cenário de comida favorita;
* Criar um esquema de banco de dados para o cenário de empresa;
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

* Exibindo os bancos de dados
```
SHOW DATABASES;
```
* Exibindo os schemas (banco de dados)
```
SHOW SCHEMAS;
```
* Criando um esquema
```
CREATE SCHEMA BootDio_Test;
```
* Criando um banco de dados
```
CREATE DATABASE BootDio_Test2;
```
* Exibindo os bancos de dados
```
SHOW DATABASES;
```
* Exibindo os schemas (banco de dados)
```
SHOW SCHEMAS;
```
* Removendo um banco de dados
```
DROP DATABASE BootDio_Test;
```
* Removendo um esquema (banco de dados)
```
DROP SCHEMA BootDio_Test2;
```
* Exibindo os bancos de dados
```
SHOW DATABASES;
```
* Acessando um banco de dados
```
USE mysql;
```
* Exibindo as tabelas
```
SHOW TABLES;
```
* Exibindo a descrição da tabela
```
DESC component;
```

----------------------------------------------------------------------------------------------
<a id="ancora2"></a>
## 3.11.1.6) Criando meu Primeiro Esquema no MySQL - parte 1
[voltar](#ancora) 

* Exibindo os bancos de dados
```
SHOW DATABASES;
```
* Criando um banco de dados caso não já exista para o cenário de **comida favorita**
```
CREATE DATABASE IF NOT EXISTS BootDio_Food;
```
* Acessando o banco de dados criado
```
USE BootDio_Food;
```
* Exibindo as tabelas
```
SHOW TABLES;
```
* Criando a tabela **person** caso não já exista
```
CREATE TABLE IF NOT EXISTS person(
    id SMALLINT UNSIGNED,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    gender ENUM('M', 'F'),
    birth_date DATE,
    street VARCHAR(30),
    city VARCHAR(20),
    state VARCHAR(20),
    country VARCHAR(20),
    postal_code VARCHAR(20),
    CONSTRAINT pk_person PRIMARY KEY (id)
);
```
* Exibindo a descrição da tabela **person**
```
DESC person;
```

----------------------------------------------------------------------------------------------
<a id="ancora3"></a>
## 3.11.1.7) Criando meu Primeiro Esquema no MySQL - parte 2
[voltar](#ancora) 

* Criando a tabela **favorite_food** caso não já exista
```
CREATE TABLE IF NOT EXISTS favorite_food(
    person_id SMALLINT UNSIGNED,
    food VARCHAR(20),
    CONSTRAINT pk_favoreite_food PRIMARY KEY (person_id, food),
    CONSTRAINT fk_favorite_food_1 FOREIGN KEY (person_id) REFERENCES person(id)
);
```
* Exibindo a descrição da tabela criada
```
DESC favorite_food;
```
* Selecionando tudo da tabela de constraints para condição determinada (banco de dados)
```
SELECT * FROM information_schema.table_constraints WHERE CONSTRAINT_SCHEMA = 'BootDio_Food';
```
* Selecionando tudo da tabela de constraints para condição determinada (tabela)
```
SELECT * FROM information_schema.table_constraints WHERE TABLE_NAME = 'person';
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
* Inserindo os dados na tabela **person**
```
INSERT INTO person VALUES ('1', 'Carolina', 'Silva', 'F', '1979-08-21', 'rua tal', 'Cidade J', 'RJ', 'Brasil', '26054-89'), 
                          ('3', 'Carolina', 'Silva', 'F', '1979-08-21', 'rua tal', 'Cidade J', 'RJ', 'Brasil', '26054-89'), 
                          ('4', 'Carolina', 'Silva', 'F', '1979-08-21', 'rua tal', 'Cidade J', 'RJ', 'Brasil', '26054-89');
```
* Selecionando os dados inseridos na tabela **person**
```
SELECT * FROM person;
```
* Inserindo os dados na tabela **person**
```
INSERT INTO person VALUES ('5', 'Roberta', 'Silva', 'F', '1979-08-21', 'rua tal', 'Cidade J', 'RJ', 'Brasil', '26054-89'), 
                          ('6', 'Luiz', 'Silva', 'F', '1979-08-21', 'rua tal', 'Cidade J', 'RJ', 'Brasil', '26054-89');
```
* Selecionando os dados inseridos na tabela **person**
```
SELECT * FROM person;
```
* Removendo os dados determinados da tabela **person**
```
DELETE FROM person WHERE id = 2 or id = 3 or id = 4;
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
* Removendo o banco de dados
```
DROP DATABASE BootDio_Food;
```

----------------------------------------------------------------------------------------------
<a id="ancora5"></a>
## 3.11.1.10) Definindo o Esquema Relacional de COMPANY com SQL
[voltar](#ancora)   

* Criando um esquema (banco de dados) caso não já exista para um cenário de **empresa**
```
CREATE SCHEMA IF NOT EXISTS BootDio_Company;
```
* Criando a tabela **employee** caso não já exista
O Social Security Number (SSN) é um número de identificação pessoal nos Estados Unidos, bastante semelhante ao CPF no Brasil.
```
CREATE TABLE IF NOT EXISTS BootDio_Company.employee(
    first_name VARCHAR(15) NOT NULL,
    middle_name CHAR,
    last_name VARCHAR(15) NOT NULL,
    ssn CHAR(9) NOT NULL,
    birth_date DATE,
    address VARCHAR(30),
    sex CHAR,
    salary DECIMAL(10,2),
    super_ssn CHAR(9),
    dept_no INT NOT NULL,
    PRIMARY KEY (ssn)
);
```
* Acessando o banco de dados
```
USE BootDio_Company;
```
* Criando a tabela **department** caso não já exista
```
CREATE TABLE IF NOT EXISTS department(
    name VARCHAR(15) NOT NULL,
    number INT NOT NULL, 
    mgr_ssn CHAR(9) NOT NULL,
    mgr_start_date DATE,
    dept_create_date DATE,
    PRIMARY KEY (number),
    UNIQUE (name),
    FOREIGN KEY (mgr_ssn) REFERENCES employee(ssn)
);
```
* Criando a tabela **dept_locations** caso não já exista
```
CREATE TABLE IF NOT EXISTS dept_locations(
    dept_no INT NOT NULL,
    location VARCHAR(15) NOT NULL,
    PRIMARY KEY (dept_no, location),
    FOREIGN KEY (dept_no) REFERENCES department(number)
);
```
* Criando a tabela **project** caso não já exista
```
CREATE TABLE IF NOT EXISTS project(
    name VARCHAR(15) NOT NULL,
    number INT NOT NULL,
    location VARCHAR (15),
    dept_no INT NOT NULL,
    PRIMARY KEY (number),
    UNIQUE (name),
    FOREIGN KEY (dept_no) REFERENCES department(number)
);
```
* Criando a tabela **works_on** caso não ja exista
```
CREATE TABLE IF NOT EXISTS works_on(
    employee_ssn CHAR(9) NOT NULL,
    project_no INT NOT NULL,
    hours DECIMAL(3,1) NOT NULL,
    PRIMARY KEY (employee_ssn, project_no),
    FOREIGN KEY (employee_ssn) REFERENCES employee(ssn),
    FOREIGN KEY (project_no) REFERENCES project(number)
);
```
* Criando a tabela **dependent** caso não já exista
```
CREATE TABLE IF NOT EXISTS dependent(
    employee_ssn CHAR(9) NOT NULL,
    name VARCHAR(15),
    sex CHAR,
    birth_date DATE,
    relationship VARCHAR(15),
    PRIMARY KEY (employee_ssn, name),
    FOREIGN KEY (employee_ssn) REFERENCES employee(ssn)
);
```
* Exibindo as tabelas
```
SHOW TABLES;
```
* Exibindo a descrição da tabela
```
DESC works_on;
```

----------------------------------------------------------------------------------------------
<a id="ancora6"></a>
## 3.11.1.14) Adicionando constraints ao nosso Banco de dados
[voltar](#ancora) 

* Selecionando tudo da tabela de constraints para condição determinada (banco de dados)
```
SELECT * FROM information_schema.table_constraints WHERE CONSTRAINT_SCHEMA = 'BootDio_Company';
```
* Selecionando tudo da tabela de constraints referências para a condição determinada (banco de dados)
```
SELECT * FROM information_schema.referential_constraints WHERE CONSTRAINT_SCHEMA = 'BootDio_Company';
```
* Criando um esquema (banco de dados) caso não já exista
```
CREATE SCHEMA IF NOT EXISTS BootDio_Company_2;
```
* Criando a tabela **employee** caso não já exista
O Social Security Number (SSN) é um número de identificação pessoal nos Estados Unidos, bastante semelhante ao CPF no Brasil.
```
CREATE TABLE IF NOT EXISTS BootDio_Company_2.employee(
    first_name VARCHAR(15) NOT NULL,
    middle_name CHAR,
    last_name VARCHAR(15) NOT NULL,
    ssn CHAR(9) NOT NULL,
    birth_date DATE,
    address VARCHAR(30),
    sex CHAR,
    salary DECIMAL(10,2),
    super_ssn CHAR(9),
    dept_no INT NOT NULL,
    CONSTRAINT chk_employee_salary CHECK (salary > 2000.0),
    CONSTRAINT pk_employee PRIMARY KEY (ssn)
);
```
* Acessando o banco de dados
```
USE BootDio_Company_2;
```
* Criando a tabela **department** caso não já exista
```
CREATE TABLE IF NOT EXISTS department(
    name VARCHAR(15) NOT NULL,
    number INT NOT NULL, 
    mgr_ssn CHAR(9) NOT NULL,
    mgr_start_date DATE,
    dept_create_date DATE,
    CONSTRAINT chk_department_date CHECK (dept_create_date < mgr_start_date),
    CONSTRAINT pk_department PRIMARY KEY (number),
    CONSTRAINT unique_department_name UNIQUE (name),
    FOREIGN KEY (mgr_ssn) REFERENCES employee(ssn)
);
```
* Criando a tabela **dept_locations** caso não já exista
```
CREATE TABLE IF NOT EXISTS dept_locations(
    dept_no INT NOT NULL,
    location VARCHAR(15) NOT NULL,
    CONSTRAINT pk_dept_locations PRIMARY KEY (dept_no, location),
    CONSTRAINT fk_dept_locations_department FOREIGN KEY (dept_no) REFERENCES department(number)
);
```
* Criando a tabela **project** caso não já exista
```
CREATE TABLE IF NOT EXISTS project(
    name VARCHAR(15) NOT NULL,
    number INT NOT NULL,
    location VARCHAR (15),
    dept_no INT NOT NULL,
    PRIMARY KEY (number),
    CONSTRAINT unique_projetct_name UNIQUE (name),
    CONSTRAINT fk_project_department FOREIGN KEY (dept_no) REFERENCES department(number)
);
```
* Criando a tabela **works_on** caso não ja exista
```
CREATE TABLE IF NOT EXISTS works_on(
    employee_ssn CHAR(9) NOT NULL,
    project_no INT NOT NULL,
    hours DECIMAL(3,1) NOT NULL,
    PRIMARY KEY (employee_ssn, project_no),
    CONSTRAINT fk_works_on_employee FOREIGN KEY (employee_ssn) REFERENCES employee(ssn),
    CONSTRAINT fk_works_on_project FOREIGN KEY (project_no) REFERENCES project(number)
);
```
* Criando a tabela **dependent** caso não já exista
```
CREATE TABLE IF NOT EXISTS dependent(
    employee_ssn CHAR(9) NOT NULL,
    name VARCHAR(15),
    sex CHAR,
    birth_date DATE,
    relationship VARCHAR(15),
    age INT NOT NULL,
    CONSTRAINT chk_dependent_age CHECK (age < 22),
    PRIMARY KEY (employee_ssn, name),
    CONSTRAINT fk_dependent_employee FOREIGN KEY (employee_ssn) REFERENCES employee(ssn)
);
```

* Exibindo as tabelas
```
SHOW TABLES;
```
* Exibindo a descrição da tabela
```
DESC employee;
```
* Selecionando tudo da tabela constraints para a condição determinada (banco de dados)
```
SELECT * FROM information_schema.table_constraints WHERE CONSTRAINT_SCHEMA = 'BootDio_Company_2';
```

----------------------------------------------------------------------------------------------
<a id="ancora7"></a>
## 3.11.1.15) Adicionando constraints ao nosso Banco de dados com Alter Table
[voltar](#ancora) 

* Alterando a tabela **employee** e adicionando constraint
```
ALTER TABLE employee
    ADD CONSTRAINT fk_employee_employee
    FOREIGN KEY (super_ssn) REFERENCES employee(ssn)
    ON DELETE SET NULL
    ON UPDATE CASCADE;
```
* Alterando a tabela **department** e removendo uma constraint
```
ALTER TABLE department DROP CONSTRAINT department_ibfk_1;
```
* Alterando a tabela **department** e adicionando uma nova constraint
```
ALTER TABLE department
    ADD CONSTRAINT fk_department_employee FOREIGN KEY (mgr_ssn) REFERENCES employee(ssn)
    ON UPDATE CASCADE;
```
* Selecionando tudo da tabela constraints para a condição determinada (banco de dados)
```
SELECT * FROM information_schema.table_constraints WHERE CONSTRAINT_SCHEMA = 'BootDio_Company_2';
```
* Alterando a tabela **dept_locations** e removendo uma constraint
```
ALTER TABLE dept_locations DROP CONSTRAINT fk_dept_locations_department;
```
* Alterando a tabela **dept_locations** e adicionando uma nova constraint
```
ALTER TABLE dept_locations
    ADD CONSTRAINT fk_dept_locations_department FOREIGN KEY (dept_no) REFERENCES department(number)
    ON DELETE CASCADE
    ON UPDATE CASCADE;
```

----------------------------------------------------------------------------------------------
<a id="ancora8"></a>
## 3.11.1.16) Persistindo informações no banco de dados Employee
[voltar](#ancora) 

* Acessando o banco de dados
```
USE BootDio_Company_2;
```
* Exibindo as tabelas
```
SHOW TABLES;
```
* Inserindo os dados na tabela **employee**
```
INSERT INTO employee VALUES ('John', 'B', 'Smith', 123456789, '1965-01-09', '731-Fondren-Houston-TX', 'M', 30000, null, 5);
```
* Inserindo os dados na tabela **employee** 
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
    employee_ssn CHAR(9) NOT NULL,
    name VARCHAR(15),
    sex CHAR,
    birth_date DATE,
    relationship VARCHAR(15),
    PRIMARY KEY (employee_ssn, name),
    CONSTRAINT fk_dependent_employee FOREIGN KEY (employee_ssn) REFERENCES employee(ssn)
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
* Inserindo os dados na tabela **employee** através de arquivo csv **(APENAS EXEMPLO)**
```
load data infile 'path' into table employee
    fields terminated by ','
    lines terminated by ';';
```

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
SELECT concat(first_name, ' ', middle_name, ' ', last_name) AS manager_name, name AS dept_name 
	FROM department, employee
    WHERE (ssn = mgr_ssn);
```
![query1](/dio/dados_unimed_1/03-modulo_database/11-primeiros_passos/query1.PNG)
* Selecionando o funcionário, seu dependente e a relação entre eles
```
SELECT concat(first_name, ' ', middle_name, ' ', last_name) AS employee_name, 
name AS dependent_name, relationship
	FROM dependent, employee
    WHERE (ssn = employee_ssn);
```
![query1](/dio/dados_unimed_1/03-modulo_database/11-primeiros_passos/query2.PNG)
* Selecionando a data de aniversário e o endereço de John B Smith
```
SELECT birth_date, address FROM employee WHERE first_name = 'John' AND middle_name = 'B' AND last_name = 'Smith';
```
![query1](/dio/dados_unimed_1/03-modulo_database/11-primeiros_passos/query3.PNG)
* Selecionando tudo do departamento de pesquisa
```
SELECT * FROM department WHERE name = 'Research';
```
![query1](/dio/dados_unimed_1/03-modulo_database/11-primeiros_passos/query4.PNG)
Selecionando os funcionários do departamento de pesquisa
```
SELECT concat(first_name, ' ', middle_name, ' ', last_name) AS employee_name
	FROM employee, department
    WHERE (dept_no = number AND name = 'Research');
```
![query1](/dio/dados_unimed_1/03-modulo_database/11-primeiros_passos/query5.PNG)
* Selecionando o projeto, o funcionário e as horas nesse projeto
```
SELECT Pname, Essn, Fname, Hours FROM project, works_on, employee WHERE Pnumber=Pno and Essn=Ssn;
```
![query1](/dio/dados_unimed_1/03-modulo_database/11-primeiros_passos/query6.PNG)

----------------------------------------------------------------------------------------------
<a id="ancor10"></a>
## 3.11.1.18) Nomes, Aliasing e Variação de Tuplas - SQL
[voltar](#ancora) 

* Selecionando o departamento, o funcionário e o endereço
```
SELECT concat(first_name, ' ', middle_name, ' ', last_name) as employee_name,
name, address
	FROM employee, department
    WHERE (dept_no = number);
```
![query1](/dio/dados_unimed_1/03-modulo_database/11-primeiros_passos/query7.PNG)
* Selecionando os funcionários do departamento de pesquisa
```
SELECT concat(first_name, ' ', middle_name, ' ', last_name) AS employee_name
	FROM employee, department
    WHERE (dept_no = number AND name = 'Research');
```
![query1](/dio/dados_unimed_1/03-modulo_database/11-primeiros_passos/query5.PNG)

----------------------------------------------------------------------------------------------
<a id="ancora11"></a>
## 3.11.1.19) Realizando Queries com Alias
[voltar](#ancora) 

* Acessando o banco de dados
```
USE BootDio_Company_2;
```
* Exibindo as tabelas
```
SHOW TABLES;
```
* Selecionando o departamento e suas localidades
```
SELECT name, location
	FROM department, dept_locations
    WHERE (number = dept_no);
```
![query1](/dio/dados_unimed_1/03-modulo_database/11-primeiros_passos/query8.PNG)
* Selecionando o nome completo dos funcionários concatenando
```
SELECT concat(first_name, ' ', middle_name, ' ', last_name) as employee_name FROM employee;
```
![query1](/dio/dados_unimed_1/03-modulo_database/11-primeiros_passos/query9.PNG)