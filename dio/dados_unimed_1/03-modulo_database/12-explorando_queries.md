* **Plataforma**: [DIO (Digital Inovation One)](/dio/)
* **Bootcamp**: [Geração Tech Unimed-BH - Ciência de Dados: Básico; 126 Hrs](/dio/dados_unimed_1/)
* **Módulo_Bootcamp**: [3) Bancos de Dados SQL e NoSQL (17)](/dio/dados_unimed_1/03-modulo_database/)

# 3.12) Curso: Explorando Queries com SQL (2)
## Objetivos
Aprender comandos básicos em SQL no MySQL Workbench.
## Tecnologias
* Linguagem de Consulta: SQL
* Ambiente de Desenvolvimento: VS Code; Docker; Arquivo **.env**
* Banco de dados: MySQL; MySQL Workbench

<a id="ancora"></a>
## Índice
* 3.12.1) Explorando Queries com SQL (15)
    * 3.12.1.1) Explorando os Comandos de DDL - Data Definition Language
    * 3.12.1.2) Manipulando o BD com comandos de DDL
    * [3.12.1.3) Elaborando queries SQL com Expressões](#ancora1)
    * [3.12.1.4) Submetendo Queries SQL com Expressões ao Banco de dados](#ancora2)
    * 3.12.1.5) Introdução a operações de conjuntos com SQL
    * [3.12.1.6) Mais Expressões e Operações de Conjuntos](#ancora3)
    * [3.12.1.7) Utilizando operadores Lógicos Like e Between](#ancora4)
    * [3.12.1.8) Exemplos de mais operadores lógicos](#ancora5)
    * 3.12.1.9) Comandos baseados em operações matemáticas: UNION, INTERSECTION & EXCEPT
    * [3.12.1.10) Vendo na prática como funcionam as operações matemáticas com SQL](#ancora6)
    * 3.12.1.11) Nested Queries (Subqueries) com SQL - Parte 1
    * 3.12.1.12) Nested Queries (Subqueries) com SQL - Parte 2
    * [3.12.1.13) Criando subqueries para recuperar informações no banco de dados](#ancora7)
    * [3.12.1.14) Segundo exemplo de utilização de Subqueries SQL](#ancora8)
    * [3.12.1.15) Utilizando Exists, Unique e comparação com conjuntos explícitos em Queries SQL](#ancora9)
* 3.12.2) Materiais de apoio e Questionário (2)
    * 3.12.2.1) Materiais de apoio
    * 3.12.2.2) Certifique seu conhecimento

----------------------------------------------------------------------------------------------
<a id="ancora1"></a>
## 3.12.1.3) Elaborando queries SQL com Expressões
[voltar](#ancora) 

* Criando um banco de dados caso não já exista
```
CREATE DATABASE IF NOT EXISTS manipulation;
```
* Criando a tabela **bankAccounts** caso não já exista
```
CREATE TABLE IF NOT EXISTS bankAccounts(
    Id_account INT AUTO_INCREMENT PRIMARY KEY,
    Ag_num INT NOT NULL,
    Ac_num INT NOT NULL,
    Saldo FLOAT,
    CONSTRAINT identification_account_constraint UNIQUE (Ag_num, Ac_num)
);
```
* Criando a tabela **bankClient** caso não já exista
```
CREATE TABLE IF NOT EXISTS bankClient(
    Id_client INT AUTO_INCREMENT,
    ClietAccount INT,
    CPF CHAR(11) NOT NULL,
    RG CHAR(9) NOT NULL,
    Nome VARCHAR(50) NOT NULL,
    Endereço VARCHAR(100) NOT NULL,
    Renda_mensal FLOAT,
    PRIMARY KEY (Id_client, ClietAccount),
    CONSTRAINT fk_account_client FOREIGN KEY (ClietAccount) REFERENCES bankAccounts(Id_account) ON UPDATE CASCADE
);
```
* Criando a tabela **bankTransactions** caso não já exista
```
CREATE TABLE IF NOT EXISTS bankTransactions(
    Id_transaction INT AUTO_INCREMENT PRIMARY KEY,
    Ocorrencia DATETIME,
    Status_transaction VARCHAR(20),
    Valor_transferido FLOAT,
    Source_account INT,
    Destination_account INT,
    CONSTRAINT fk_source_transaction FOREIGN KEY (Source_account) REFERENCES bankAccounts(Id_account),
    CONSTRAINT fk_destination_transaction FOREIGN KEY (Destination_account) REFERENCES bankAccounts(Id_account)
);
```
* Alterando a tabela **bankAccounts** e adicionando um novo atributo
```
ALTER TABLE bankAccounts ADD LimiteCredito FLOAT NOT NULL DEFAULT 500.00;
```
* Exibindo a descrição da tabela criada
```
DESC bankAccounts;
```
* Alterando a tabela **bankAccounts** e adicionando um novo atributo
```
ALTER TABLE bankAccounts ADD email VARCHAR(60);
```
* Exibindo a descrição da tabela criada
```
DESC bankAccounts;
```
* Alterando a tabela **bankAccounts** e removendo um atributo
```
ALTER TABLE bankAccounts DROP email;
```
* Exibindo a descrição da tabela criada
```
DESC bankAccounts;
```
* Alterando a tabela **bankClient** e adicionando um atributo
```
ALTER TABLE bankClient ADD UFF CHAR(2) NOT NULL DEFAULT 'RJ';
```
* Inserindo dados na tabela **bankAccounts**
```
INSERT INTO bankAccounts (Ag_num, Ac_num, Saldo) VALUES (156, 264358, 0);
```
* Inserindo dados na tabela **bankClient**
```
INSERT INTO bankClient (ClietAccount, CPF, RG, Nome, Endereço, Renda_mensal) VALUES (1, 12345678913, 123456789, 'Fulano', 'Rua de Lá', 6500.6);
```
* Selecionando tudo da tabela **bankClient**
```
SELECT * FROM bankClient;
```
* Atualizando a tabela **bankClient** e alterando um atributo a partir de uma condição
```
UPDATE bankClient SET UFF='MG' WHERE Nome='Fulano';
```

----------------------------------------------------------------------------------------------
<a id="ancora2"></a>
## 3.12.1.4) Submetendo Queries SQL com Expressões ao Banco de dados
[voltar](#ancora) 

* Acessando o banco de dados **company_constraints**
```
USE company_constraints;
```
* Calculando o valor do INSS (11%) para os funcionários
``` 
SELECT Fname, Lname, Salary, round(Salary*0.011,2) AS INSS FROM employee;
```
* Definindo um aumento de salário para os gerentes que trabalham no projeto associado ao ProdutoX
```
SELECT concat(Fname, ' ', Lname) AS Complete_name, Salary, round(Salary*1.1,2) AS increased_salary
    FROM employee e, works_on AS w, project AS p
    WHERE (e.Ssn = w.Essn AND w.Pno = p.Pnumber AND p.Pname='ProductX');
```
* Definindo alias para legibilidade de consulta e selecionando os nomes completos dos funcionários e seu endereço
```
SELECT concat(e.Fname, ' ', e.Lname) AS Employee_name, e.Address FROM employee e, departament d
    WHERE d.Dname = 'Research' AND d.Dnumber = e.Dno;
```

----------------------------------------------------------------------------------------------
<a id="ancora3"></a>
## 3.12.1.6) Mais Expressões e Operações de Conjuntos
[voltar](#ancora) 

* Recuperando informações dos departamentos presentes em Stafford
```
SELECT Dname AS Department_Name, Mgr_ssn AS Manager, Address FROM departament d, dept_locations l, employee e
    WHERE d.Dnumber = l.Dnumber AND l.Dlocation = 'Stafford';
```
* Recuperando todos os gerentes que trabalham em Stafford
```
SELECT Dname AS Department_Name, concat(Fname, ' ', Lname) AS Manager  FROM departament d, dept_locations l, employee e
    WHERE d.Dnumber = l.Dnumber AND l.Dlocation = 'Stafford' AND Mgr_ssn = e.Ssn;
```
* Recuperando todos os gerentes, departamentos e seus nomes completos
```
SELECT Dname AS Department_Name, concat(Fname, ' ', Lname) AS Manager, Dlocation FROM departament d, dept_locations l, employee e
    WHERE d.Dnumber = l.Dnumber AND Mgr_ssn = e.Ssn;
```
* Recuperando informações dos departamentos presentes em Stafford
```
SELECT Pnumber, Dnum, Lname, Address, Bdate, p.Plocation FROM departament d, project p, employee e
    WHERE d.Dnumber = p.Dnum AND p.Plocation = 'Stafford' AND Mgr_ssn = e.Ssn;
```

----------------------------------------------------------------------------------------------
<a id="ancora4"></a>
## 3.12.1.7) Utilizando operadores Lógicos Like e Between
[voltar](#ancora) 

* Selecioando os funcionários que tem no endereço o conjunto de caracteres **Houston**
```
SELECT concat(Fname, ' ', Lname) AS Complete_name, Dname AS Department_Name, Address FROM employee, departament
    WHERE (Dno = Dnumber AND Address like '%Houston%');
```
* Selecioando os funcionários que tem no endereço o conjunto de caracteres **Houston**
```
SELECT concat(Fname, ' ', Lname) AS Complete_name, Address FROM employee
    WHERE (Address like '%Houston%');
```
* Selecionando os funcionários que tem no final do seu endereço o conjunto de caracteres **TX**
```
SELECT concat(Fname, ' ', Lname) AS Complete_name, Dname AS Department_Name, Address FROM employee, departament
    WHERE (Dno = Dnumber AND Address like '%TX');
```
* Selecionando os nomes do funcionários que tem salário entre 30000 e 40000
```
SELECT Fname, Lname FROM employee WHERE (Salary > 30000 AND Salary < 40000);
```
* Selecionando os nomes do funcionários que tem salário entre 30000 e 40000 (Utilizando o **BETWEEN**)
```
SELECT Fname, Lname FROM employee WHERE (Salary BETWEEN 20000 AND 40000);
```

----------------------------------------------------------------------------------------------
<a id="ancora5"></a>
## 3.12.1.8) Exemplos de mais operadores lógicos
[voltar](#ancora) 

* Selecionando a data de nascimento e endereço de um funcionário a partir de uma condição
```
SELECT Bdate, Address FROM employee WHERE Fname='John' AND Minit='B' AND Lname='Smith';
```
* Selecionando todos funcionários das áreas de **Research** e **Administration**
```
SELECT * FROM departament WHERE Dname = 'Research' OR Dname = 'Administration';
```
* Selecionando os funcionários da área de **Reserach**
```
SELECT Fname, Lname FROM employee, departament WHERE Dname = 'Research' AND Dnumber=Dno;
```
* Selecionando o nome completo dos funcionários da área de **Reserach**
```
SELECT concat(Fname, ' ', Lname) as Complete_name FROM employee, departament WHERE Dname = 'Research' AND Dnumber=Dno;
```

----------------------------------------------------------------------------------------------
<a id="ancora6"></a>
## 3.12.1.10) Vendo na prática como funcionam as operações matemáticas com SQL
[voltar](#ancora) 

* Criando um novo banco de dados
```
CREATE DATABASE IF NOT EXISTS teste;
```
* Acessando esse novo banco de dados criado
```
USE teste;
```
* Criando a tabela **R** caso não já exista
```
CREATE TABLE IF NOT EXISTS R(
    A CHAR(2)
);
```
* Criando a tabela **S** caso não já exista
```
CREATE TABLE IF NOT EXISTS S(
    A CHAR(2)
);
```
* Inserindo dados na tabela **R**
```
INSERT INTO R VALUES ('a1'), ('a2'), ('a2'), ('a3');
```
* Inserindo dados na tabela **S**
```
INSERT INTO S VALUES ('a1'), ('a1'), ('a2'), ('a3'), ('a4'), ('a5');
```
* Selecionando tudo da tabela **R**
```
SELECT * FROM R;
```
* Selecionando tudo da tabela **S**
```
SELECT * FROM S;
```
* Selecionando as excessões entre as duas tabelas (except)
```
SELECT * FROM S WHERE A NOT IN (SELECT A FROM R);
```
* Selecionando a união entre as duas tabelas
``` 
SELECT R.A FROM R UNION SELECT S.A FROM S;
```
* Selecionando a união entre as duas tabelas
``` 
SELECT R.A FROM R UNION ALL SELECT S.A FROM S;
```
* Selecionando a interseção entre as duas tabelas (intersect)
```
SELECT R.A FROM R WHERE R.A IN (SELECT S.A FROM S);
```
* Selecionando a interseção entre as duas tabelas (intersect) eliminando as duplicidades
```
SELECT DISTINCT R.A FROM R WHERE R.A IN (SELECT S.A FROM S);
```

----------------------------------------------------------------------------------------------
<a id="ancora7"></a>
## 3.12.1.13) Criando subqueries para recuperar informações no banco de dados
[voltar](#ancora) 

* Acessando o banco de dados criado
```
USE company_constraints;
```

* Criando subqueries para recuperar informações no banco de dados
```
SELECT DISTINCT Pnumber FROM project
    WHERE Pnumber IN
        (SELECT DISTINCT Pno FROM works_on, employee WHERE Essn=Ssn AND Lname='Smith')
        OR
        (SELECT Pnumber FROM project, departament, employee WHERE Mgr_ssn=Ssn AND Lname='Smith' AND Dnum=Dnumber);
```

----------------------------------------------------------------------------------------------
<a id="ancora8"></a>
## 3.12.1.14) Segundo exemplo de utilização de Subqueries SQL
[voltar](#ancora) 

* Criando subqueries para recuperar informações no banco de dados
```
SELECT DISTINCT * FROM works_on
    WHERE (Pno, Hours) IN (SELECT Pno, Hours FROM works_on WHERE Essn=123456789);
```

----------------------------------------------------------------------------------------------
<a id="ancora9"></a>
## 3.12.1.15) Utilizando Exists, Unique e comparação com conjuntos explícitos em Queries SQL
[voltar](#ancora) 

* Selecionando os funcionários que possuem dependentes
```
SELECT e.Fname, e.Lname FROM employee AS e
    WHERE EXISTS (SELECT * FROM dependent AS d WHERE e.Ssn=d.Essn and Relationship='Daughter');
```
* Selecionando os funcionários que não possuem dependentes
```
SELECT e.Fname, e.Lname FROM employee AS e
    WHERE NOT EXISTS (SELECT * FROM dependent AS d WHERE e.Ssn=d.Essn and Relationship='Daughter');
```
* Selecionando quais funcionários são gerentes e tem dependentes
```
SELECT e.Fname, e.Lname FROM employee AS e, departament d
    WHERE (e.Ssn=d.Mgr_ssn) AND EXISTS (SELECT * FROM dependent as d WHERE e.Ssn=d.Essn);
```
* Selecionando os funcionários que tem mais de um dependente
```
SELECT Fname, Lname FROM employee
    WHERE (SELECT count(*) FROM dependent WHERE Ssn=Essn)>=1;
```
* Selecionando quais os ID dos funcionários que estão em mais de um projeto
```
SELECT DISTINCT Essn, Pno FROM works_on WHERE Pno IN (1,2,3);
```