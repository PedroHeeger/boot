-- 12-Explorando Queries com SQL
-- 12.1-Explorando Queries com SQL
-- 12.1.2-Manipulando o BD com comandos de DDL
CREATE DATABASE IF NOT EXISTS manipulation;

CREATE TABLE IF NOT EXISTS bankAccounts(
    Id_account INT AUTO_INCREMENT PRIMARY KEY,
    Ag_num INT NOT NULL,
    Ac_num INT NOT NULL,
    Saldo FLOAT,
    CONSTRAINT identification_account_constraint UNIQUE (Ag_num, Ac_num)
);

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

ALTER TABLE bankAccounts ADD LimiteCredito FLOAT NOT NULL DEFAULT 500.00;
DESC bankAccounts;

ALTER TABLE bankAccounts ADD email VARCHAR(60);
DESC bankAccounts;
ALTER TABLE bankAccounts DROP email;
DESC bankAccounts;
ALTER TABLE bankClient ADD UFF CHAR(2) NOT NULL DEFAULT 'RJ';

INSERT INTO bankAccounts (Ag_num, Ac_num, Saldo) VALUES (156, 264358, 0);
INSERT INTO bankClient (ClietAccount, CPF, RG, Nome, Endereço, Renda_mensal) VALUES (1, 12345678913, 123456789, 'Fulano', 'Rua de Lá', 6500.6);
SELECT * FROM bankClient;

UPDATE bankClient SET UFF='MG' WHERE Nome='Fulano';


-- 12.1.4-Submetendo Queries SQL com Expressões ao Banco de dados
USE company_constraints;
-- recolhendo o valor do INSS (11%):
SELECT Fname, Lname, Salary, round(Salary*0.011,2) AS INSS FROM employee;

--- definir um aumento de salário para os gerentes que trabalham no projeto associado ao ProdutoX:
SELECT concat(Fname, ' ', Lname) AS Complete_name, Salary, round(Salary*1.1,2) AS increased_salary
    FROM employee e, works_on AS w, project AS p
    WHERE (e.Ssn = w.Essn AND w.Pno = p.Pnumber AND p.Pname='ProductX');

--- definindo alias para legibilidade de consulta:
SELECT concat(e.Fname, ' ', e.Lname) AS Employee_name, e.Address FROM employee e, departament d
    WHERE d.Dname = 'Research' AND d.Dnumber = e.Dno;


-- 12.1.6-Mais Expressões e Operações de Conjuntos
--- recuperando informações dos departamentos presentes em Stafford
SELECT Dname AS Department_Name, Mgr_ssn AS Manager, Address FROM departament d, dept_locations l, employee e
    WHERE d.Dnumber = l.Dnumber AND l.Dlocation = 'Stafford';

--- recuperando todos os gerentes que trabalham em Stafford
SELECT Dname AS Department_Name, concat(Fname, ' ', Lname) AS Manager  FROM departament d, dept_locations l, employee e
    WHERE d.Dnumber = l.Dnumber AND l.Dlocation = 'Stafford' AND Mgr_ssn = e.Ssn;

--- recuperando todos os gerentes, departamentos e seus nomes
SELECT Dname AS Department_Name, concat(Fname, ' ', Lname) AS Manager, Dlocation FROM departament d, dept_locations l, employee e
    WHERE d.Dnumber = l.Dnumber AND Mgr_ssn = e.Ssn;

--- recuperando informações dos departamentos presentes em Stafford
SELECT Pnumber, Dnum, Lname, Address, Bdate, p.Plocation FROM departament d, project p, employee e
    WHERE d.Dnumber = p.Dnum AND p.Plocation = 'Stafford' AND Mgr_ssn = e.Ssn;


-- 12.1.7-Utilizando operadores Lógicos Like e Between
SELECT concat(Fname, ' ', Lname) AS Complete_name, Dname AS Department_Name, Address FROM employee, departament
    WHERE (Dno = Dnumber AND Address like '%Houston%');

SELECT concat(Fname, ' ', Lname) AS Complete_name, Address FROM employee
    WHERE (Address like '%Houston%');

SELECT concat(Fname, ' ', Lname) AS Complete_name, Dname AS Department_Name, Address FROM employee, departament
    WHERE (Dno = Dnumber AND Address like '%TX');

SELECT Fname, Lname FROM employee WHERE (Salary > 30000 AND Salary < 40000);
SELECT Fname, Lname FROM employee WHERE (Salary BETWEEN 20000 AND 40000);

-- 12.1.8-Exemplos de mais operadores lógicos
SELECT Bdate, Address FROM employee WHERE Fname='John' AND Minit='B' AND Lname='Smith';
SELECT * FROM departament WHERE Dname = 'Research' OR Dname = 'Administration';

SELECT Fname, Lname FROM employee, departament WHERE Dname = 'Research' AND Dnumber=Dno;
SELECT concat(Fname, ' ', Lname) as Complete_name FROM employee, departament WHERE Dname = 'Research' AND Dnumber=Dno;


-- 12.1.10-Vendo na prática como funcionam as operações matemáticas com SQL
CREATE DATABASE IF NOT EXISTS teste;
USE teste;

CREATE TABLE IF NOT EXISTS R(
    A CHAR(2)
);
CREATE TABLE IF NOT EXISTS S(
    A CHAR(2)
);

INSERT INTO R VALUES ('a1'), ('a2'), ('a2'), ('a3');
INSERT INTO S VALUES ('a1'), ('a1'), ('a2'), ('a3'), ('a4'), ('a5');
SELECT * FROM R;
SELECT * FROM S;

--- except
SELECT * FROM S WHERE A NOT IN (SELECT A FROM R);
--- 
SELECT R.A FROM R UNION SELECT S.A FROM S;
SELECT R.A FROM R UNION ALL SELECT S.A FROM S;
--- intersect
SELECT R.A FROM R WHERE R.A IN (SELECT S.A FROM S);
SELECT DISTINCT R.A FROM R WHERE R.A IN (SELECT S.A FROM S);


-- 12.1.13-Criando subqueries para recuperar informações no banco de dados
USE company_constraints;
SELECT DISTINCT Pnumber FROM project
    WHERE Pnumber IN
        (SELECT DISTINCT Pno FROM works_on, employee WHERE Essn=Ssn AND Lname='Smith')
        OR
        (SELECT Pnumber FROM project, departament, employee WHERE Mgr_ssn=Ssn AND Lname='Smith' AND Dnum=Dnumber);

-- 12.1.14-Segundo exemplo de utilização de Subqueries SQL
SELECT DISTINCT * FROM works_on
    WHERE (Pno, Hours) IN (SELECT Pno, Hours FROM works_on WHERE Essn=123456789);

-- 12.1.15-Utilizando Exists, Unique e comparação com conjuntos explícitos em Queries SQL
--- quais employees possuem dependentes?
SELECT e.Fname, e.Lname FROM employee AS e
    WHERE EXISTS (SELECT * FROM dependent AS d WHERE e.Ssn=d.Essn and Relationship='Daughter');

--- quais employees não possuem dependentes?
SELECT e.Fname, e.Lname FROM employee AS e
    WHERE NOT EXISTS (SELECT * FROM dependent AS d WHERE e.Ssn=d.Essn and Relationship='Daughter');

--- quais os employees que são gerentes e tem dependentes?
SELECT e.Fname, e.Lname FROM employee AS e, departament d
    WHERE (e.Ssn=d.Mgr_ssn) AND EXISTS (SELECT * FROM dependent as d WHERE e.Ssn=d.Essn);

--- quais os employees que tem mais de um dependente?
SELECT Fname, Lname FROM employee
    WHERE (SELECT count(*) FROM dependent WHERE Ssn=Essn)>=1;

--- quais os ID dos employees que estão em mais de um projeto?
SELECT DISTINCT Essn, Pno FROM works_on WHERE Pno IN (1,2,3);