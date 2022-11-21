-- 13-Criando Queries com Funções e Cláusulas de Agrupamentos
-- 13.1-Criando Queries com Funções e Cláusulas de Agrupamentos
-- 13.1.3-Aplicando Ordenação as Consultas de Banco de Dados
USE company_constraints;

SELECT * FROM employee;
SELECT * FROM employee ORDER BY Fname;
SELECT * FROM employee ORDER BY Fname, Lname;

--- nome do departamento, nome do gerente
SELECT DISTINCT d.Dname, concat(e.Fname, ' ', e.Lname) AS Manager, Address
    FROM departament AS d, employee AS e, works_on AS w, project p
    WHERE (d.Dnumber = e.Dno AND e.Ssn = d.Mgr_ssn AND w.Pno = p.Pnumber)
    ORDER BY d.Dname, Manager, Address;

--- recupero todos os empregados e seus projetos em andamento
SELECT DISTINCT d.Dname AS Department, concat(e.Fname, ' ', e.Lname) AS Employee, p.Pname AS Project_Name, Address
    FROM departament AS d, employee e, works_on w, project p
    WHERE (d.Dnumber = e.Dno AND e.Ssn = w.Essn AND w.Pno = p.Pnumber)
    ORDER BY d.Dname, Employee, Address;

SELECT DISTINCT d.Dname AS Department, concat(e.Fname, ' ', e.Lname) AS Employee, p.Pname AS Project_Name, Address
    FROM departament AS d, employee e, works_on w, project p
    WHERE (d.Dnumber = e.Dno AND e.Ssn = w.Essn AND w.Pno = p.Pnumber)
    ORDER BY d.Dname DESC, Employee ASC, Address ASC;


-- 13.1.6-Agrupando registros no Banco de Dados
SELECT count(*) FROM employee;

SELECT count(*) FROM employee, departament
    WHERE Dno = Dnumber and Dname = 'Research';

SELECT Dno, count(*) AS Number_of_employees, round(avg(Salary),2) AS Salary_avg FROM employee
    GROUP BY Dno;

SELECT Pnumber, Pname, count(*)
    FROM project, works_on
    WHERE Pnumber = Pno
    GROUP BY Pnumber, Pname;

SELECT count(DISTINCT Salary) FROM employee;

SELECT sum(Salary) AS Total_sal, max(Salary) AS Max_sal, min(Salary) AS Min_sal, avg(Salary) AS Avg_sal FROM employee;

SELECT sum(Salary) AS Total_sal, max(Salary) AS Max_sal, min(Salary) AS Min_sal, avg(Salary) AS Avg_sal 
    FROM (employee JOIN departament ON Dno = Dnumber)
    WHERE Dname = 'Research';


-- 13.1.7-Explorando cláusulas de agrupamento com SQL
SELECT Pnumber, Pname, count(*) AS Number_of_register, round(avg(Salary),2) AS Avg_Salary
    FROM project, works_on, employee
    WHERE Pnumber = Pno AND Ssn = Essn
    GROUP BY Pnumber, Pname;

SELECT Pnumber, Pname, count(*) AS Number_of_register, round(avg(Salary),2) AS Avg_Salary
    FROM project, works_on, employee
    WHERE Pnumber = Pno AND Ssn = Essn
    GROUP BY Pnumber, Pname
    ORDER BY Pnumber ASC, Avg_Salary DESC;


-- 13.1.9-Aplicando a cláusula HAVING ao Banco de Dados
SELECT Pnumber, Pname, count(*)
    FROM project, works_on
    WHERE Pnumber = Pno
    GROUP BY Pnumber, Pname
    HAVING count(*) > 2;

SELECT Dno, count(*)
    FROM employee
    WHERE Salary > 30000
    GROUP BY Dno
    HAVING count(*) >= 2;

SELECT Dno AS Department, count(*) AS Number_of_employees
    FROM employee
    WHERE Salary > 20000 AND Dno IN (SELECT Dno FROM employee GROUP BY Dno HAVING count(*) >= 2)
    GROUP BY Dno;