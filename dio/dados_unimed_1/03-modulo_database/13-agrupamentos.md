* **Plataforma**: [DIO (Digital Inovation One)](/dio/)
* **Bootcamp**: [Geração Tech Unimed-BH - Ciência de Dados: Básico; 126 Hrs](/dio/dados_unimed_1/)
* **Módulo_Bootcamp**: [3) Bancos de Dados SQL e NoSQL (17)](/dio/dados_unimed_1/03-modulo_database/)

# 3.13) Curso: Criando Queries com Funções e Cláusulas de Agrupamentos (2)
## Objetivos
Aprender comandos básicos em SQL no MySQL Workbench.
## Tecnologias
* Linguagem de Consulta: SQL
* Ambiente de Desenvolvimento: VS Code; Docker; Arquivo **.env**
* Banco de dados: MySQL; MySQL Workbench

<a id="ancora"></a>
## Índice
* 3.13.1) Criando Queries com Funções e Cláusulas de Agrupamentos (10)
    * 3.13.1.1) ORDER BY: Clásulas de ordenação com SQL
    * 3.13.1.2) Ordenação com SQL utilizando expressões
    * 3.13.1.3) Aplicando Ordenação as Consultas de Banco de Dados
    * 3.13.1.4) Funções de agregação com SQL
    * 3.13.1.5) GROUP BY: Clásulas de agrupamento com SQL
    * [3.13.1.6) Agrupando registros no Banco de Dados](#ancora2)
    * [3.13.1.7) Explorando cláusulas de agrupamento com SQL](#ancora3)
    * 3.13.1.8) Entendendo o HAVING Statement
    * [3.13.1.9) Aplicando a cláusula HAVING ao Banco de Dados](#ancora4)
    * 3.13.1.10) Review: Reforçando a diferença entre ORDER BY e GROUP BY
* 3.13.2) Materiais de apoio e Questionário (2)
    * 3.13.2.1) Materiais de apoio
    * 3.13.2.2) Certifique seu conhecimento

----------------------------------------------------------------------------------------------
<a id="ancora1"></a>
## 3.11.1.4) Primeiro Contato com SQL e MySQL
[voltar](#ancora) 

* Acessando o banco de dados do cenário de company
```
USE company_constraints;
```
* Selecionando tudo da tabela **employee**
```
SELECT * FROM employee;
```
* Selecionando tudo da tabela **employee** ordenado pelo nome
```
SELECT * FROM employee ORDER BY Fname;
```
* Selecionando tudo da tabela **employee** ordenado pelo nome e depois pelo sobrenome
```
SELECT * FROM employee ORDER BY Fname, Lname;
```
* Selecionando o nome do departamento, nome do gerente, o endereço e ordenando
```
SELECT DISTINCT d.Dname, concat(e.Fname, ' ', e.Lname) AS Manager, Address
    FROM departament AS d, employee AS e, works_on AS w, project p
    WHERE (d.Dnumber = e.Dno AND e.Ssn = d.Mgr_ssn AND w.Pno = p.Pnumber)
    ORDER BY d.Dname, Manager, Address;
```
* Recuperando todos os empregados e seus projetos em andamento
```
SELECT DISTINCT d.Dname AS Department, concat(e.Fname, ' ', e.Lname) AS Employee, p.Pname AS Project_Name, Address
    FROM departament AS d, employee e, works_on w, project p
    WHERE (d.Dnumber = e.Dno AND e.Ssn = w.Essn AND w.Pno = p.Pnumber)
    ORDER BY d.Dname, Employee, Address;
```
* Selecionando ???
```
SELECT DISTINCT d.Dname AS Department, concat(e.Fname, ' ', e.Lname) AS Employee, p.Pname AS Project_Name, Address
    FROM departament AS d, employee e, works_on w, project p
    WHERE (d.Dnumber = e.Dno AND e.Ssn = w.Essn AND w.Pno = p.Pnumber)
    ORDER BY d.Dname DESC, Employee ASC, Address ASC;
```

----------------------------------------------------------------------------------------------
<a id="ancora2"></a>
## 3.13.1.6) Agrupando registros no Banco de Dados
[voltar](#ancora) 

* Contando o número de funcionários
```
SELECT count(*) FROM employee;
```
* Contando o número de funcionários do departamento de **Research**
```
SELECT count(*) FROM employee, departament
    WHERE Dno = Dnumber and Dname = 'Research';
```
* Calculando a média salarial de cada departamento
```
SELECT Dno, count(*) AS Number_of_employees, round(avg(Salary),2) AS Salary_avg FROM employee
    GROUP BY Dno;
```
* Contando o número de projetos
```
SELECT Pnumber, Pname, count(*)
    FROM project, works_on
    WHERE Pnumber = Pno
    GROUP BY Pnumber, Pname;
```
* Contando o número de salários distintos dos funcionários
```
SELECT count(DISTINCT Salary) FROM employee;
```
* Calculando a soma dos salários, o salário maxímo, mínimo e a média salarial dos funcionários
```
SELECT sum(Salary) AS Total_sal, max(Salary) AS Max_sal, min(Salary) AS Min_sal, avg(Salary) AS Avg_sal FROM employee;
```
* Calculando a soma dos salários, o salário maxímo, mínimo e a média salarial dos funcionários do departamento de **Research**
```
SELECT sum(Salary) AS Total_sal, max(Salary) AS Max_sal, min(Salary) AS Min_sal, avg(Salary) AS Avg_sal 
    FROM (employee JOIN departament ON Dno = Dnumber)
    WHERE Dname = 'Research';
```

----------------------------------------------------------------------------------------------
<a id="ancora3"></a>
## 3.13.1.7) Explorando cláusulas de agrupamento com SQL
[voltar](#ancora) 

* Calculando a quantidade de projetos e a média salarial dos funcionários desses projetos
```
SELECT Pnumber, Pname, count(*) AS Number_of_register, round(avg(Salary),2) AS Avg_Salary
    FROM project, works_on, employee
    WHERE Pnumber = Pno AND Ssn = Essn
    GROUP BY Pnumber, Pname;
```
* Calculando a quantidade de projetos e a média salarial dos funcionários desses projetos e ordenando
```
SELECT Pnumber, Pname, count(*) AS Number_of_register, round(avg(Salary),2) AS Avg_Salary
    FROM project, works_on, employee
    WHERE Pnumber = Pno AND Ssn = Essn
    GROUP BY Pnumber, Pname
    ORDER BY Pnumber ASC, Avg_Salary DESC;
```

----------------------------------------------------------------------------------------------
<a id="ancora4"></a>
## 3.13.1.9) Aplicando a cláusula HAVING ao Banco de Dados
[voltar](#ancora) 

* Selecionando os projetos que tenham mais de 2 ???
```
SELECT Pnumber, Pname, count(*)
    FROM project, works_on
    WHERE Pnumber = Pno
    GROUP BY Pnumber, Pname
    HAVING count(*) > 2;
```
* Selecionando a quantidade de funcionários por departamento maior que 2 que tem salário maior 30.000
```
SELECT Dno, count(*)
    FROM employee
    WHERE Salary > 30000
    GROUP BY Dno
    HAVING count(*) >= 2;
```
* Selecionando a quantidade de funcionários por departamento maior que 2 que tem salário maior 30.000
```
SELECT Dno AS Department, count(*) AS Number_of_employees
    FROM employee
    WHERE Salary > 20000 AND Dno IN (SELECT Dno FROM employee GROUP BY Dno HAVING count(*) >= 2)
    GROUP BY Dno;
```