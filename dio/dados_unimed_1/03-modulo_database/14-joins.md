* **Plataforma**: [DIO (Digital Inovation One)](/dio/)
* **Bootcamp**: [Geração Tech Unimed-BH - Ciência de Dados: Básico; 126 Hrs](/dio/dados_unimed_1/)
* **Módulo_Bootcamp**: [3) Bancos de Dados SQL e NoSQL (17)](/dio/dados_unimed_1/03-modulo_database/)

# 3.14) Curso: Agrupando Registros e Tabelas com Join Statement (2)
## Objetivos
Aprender comandos básicos em SQL no MySQL Workbench.
## Tecnologias
* Linguagem de Consulta: SQL
* Ambiente de Desenvolvimento: VS Code; Docker; Arquivo **.env**
* Banco de dados: MySQL; MySQL Workbench

<a id="ancora"></a>
## Índice
* 3.14.1) Agrupando Registros e Tabelas com Join Statement (19)
    * 3.14.1.1) Apresentação inicial do curso
    * 3.14.1.2) CASE statement
    * [3.14.1.3) Agrupamentos com CASE](#ancora1)
    * 3.14.1.4) O caso zero/null trick
    * 3.14.1.5) Criando Queries com CASE statement
    * 3.14.1.6) Entendendo Queries de múltiplas tabelas com JOIN
    * 3.14.1.7) Queries com INNER JOIN
    * [3.14.1.8) Aplicando JOIN statement ao cenário Employee](#ancora2)
    * 3.14.1.9) Agrupamento com mais de duas tabelas e JOIN
    * 3.14.1.10) Criando uma Query SQL com JOIN entre três tabelas
    * 3.14.1.11) A ordem importa em queries JOIN?
    * 3.14.1.12) Nested (Subqueries) com JOIN Statement
    * 3.14.1.13) Self JOIN: Mesma tabela em uma Query JOIN
    * 3.14.1.14) Comparando condições de Junção e Filtros
    * 3.14.1.15) Como utilizar o OUTER Join Statement ?
    * 3.14.1.16) Quando aplicar o LEFT JOIN ou OUTER JOIN
    * 3.14.1.17) Entendendo melhor os tipos de JOINs
    * 3.14.1.18) Explorando ainda mais NATURAL JOIN
    * 3.14.1.19) Referências para estudo
* 3.14.2) Materiais de apoio e Questionário (2)
    * 3.14.2.1) Materiais de apoio
    * 3.14.2.2) Certifique seu conhecimento

----------------------------------------------------------------------------------------------
<a id="ancora1"></a>
## 3.14.1.3) Agrupamentos com CASE
[voltar](#ancora) 

* Acessando o banco de dados do cenário de company
```
USE company_constraints;
```
* Selecionando o nome, salário e ??
```
SELECT Fname, Salary, Dno FROM employee;
```
* Desabilitando o safe mode: edit -> preferences -> SQL Editor -> Safe Updates
* Atualizando a tabela **employee** adicionando uma condição **CASE**
```
UPDATE employee SET Salary =
    CASE WHEN Dno = 5 THEN Salary + 2000
    WHEN Dno = 4 THEN Salary + 1500
    WHEN Dno = 1 THEN Salary + 3000
    ELSE Salary + 0
    END;
```
* Selecionando o nome, salário e ??
```
SELECT Fname, Salary, Dno FROM employee;
```

----------------------------------------------------------------------------------------------
<a id="ancora1"></a>
## 3.14.1.8) Aplicando JOIN statement ao cenário Employee
[voltar](#ancora) 


--- JOIN ON -> INNER JOIN ON
SELECT * FROM employee, works_on WHERE Ssn = Essn;
SELECT * FROM employee JOIN works_on ON Ssn = Essn;

SELECT count(*) FROM employee JOIN departament ON Ssn = Mgr_ssn;
SELECT count(*) FROM employee INNER JOIN departament ON Ssn = Mgr_ssn;

SELECT Fname, Lname, Address
    FROM (employee JOIN departament ON Dno = Dnumber)
    WHERE Dname = 'Research';

SELECT Dname AS Department, Dept_create_date AS StartDate, Dlocation AS Location
    FROM departament JOIN dept_locations USING(Dnumber)
    ORDER BY StartDate;

SELECT e.Fname, e.Lname, d.Name 
    FROM employee e JOIN departament d ON e.dept_id = d.dept_id;

--- CROSS JOIN / JOIN SEM ON - produto cartesiano
SELECT * FROM employee JOIN works_on;
SELECT count(*) FROM employee CROSS JOIN dependent;
SELECT count(*) FROM employee JOIN dependent;


-- 14.10-Criando uma Query SQL com JOIN entre três tabelas
SELECT concat(Fname, ' ', Lname) AS Complete_name, Dno AS DeptNumber, Pname AS ProjectName, 
    Pno AS ProjectNumber, Plocation AS Location FROM employee 
    INNER JOIN works_on ON Ssn = Essn
    INNER JOIN project ON Pno = Pnumber
    WHERE Pname LIKE 'Product%' 
    ORDER BY Pnumber;

--- department, dept_location, employee
SELECT Dnumber, Dname, concat(Fname, ' ', Lname) AS Complete_name, Salary, round(Salary*0.05,2) AS Bonus
    FROM departament
    INNER JOIN dept_locations USING(Dnumber)
    INNER JOIN employee ON Ssn = Mgr_ssn
    GROUP BY Dnumber
    HAVING count(*) > 1;

SELECT Dnumber, Dname, concat(Fname, ' ', Lname) AS Complete_name, Salary, round(Salary*0.05,2) AS Bonus
    FROM departament
    INNER JOIN dept_locations USING(Dnumber)
    INNER JOIN (dependent INNER JOIN employee ON Ssn = Essn) ON Ssn = Mgr_ssn
    GROUP BY Dnumber;


-- 14.1.16-Quando aplicar o LEFT JOIN ou OUTER JOIN
SELECT * FROM employee INNER JOIN dependent ON Ssn = Essn;

SELECT * FROM employee LEFT JOIN dependent ON Ssn = Essn;
SELECT * FROM employee LEFT OUTER JOIN dependent ON Ssn = Essn;

SELECT * FROM employee RIGHT JOIN dependent ON Ssn = Essn;
SELECT * FROM employee RIGHT OUTER JOIN dependent ON Ssn = Essn;