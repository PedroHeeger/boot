-- 14-Agrupando Registros e Tabelas com Join Statement
-- 14.1-Agrupando Registros e Tabelas com Join Statement
-- 14.1.5-Criando Queries com CASE statement
USE company_constraints;

SELECT Fname, Salary, Dno FROM employee;

-- desabilitar o safe mode: edit -> preferences -> SQL Editor -> Safe Updates
UPDATE employee SET Salary =
    CASE WHEN Dno = 5 THEN Salary + 2000
    WHEN Dno = 4 THEN Salary + 1500
    WHEN Dno = 1 THEN Salary + 3000
    ELSE Salary + 0
    END;

SELECT Fname, Salary, Dno FROM employee;


-- 14.1.8-Aplicando JOIN statement ao cenário Employee
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