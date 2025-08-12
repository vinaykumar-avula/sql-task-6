use vinaykumar
go

create table employes202
    (id int,
	empname varchar(50),
	departmenti_id int,
	salary float)

	create table department202
	(department_id int,
	department_name varchar(50))

	insert into department202 values(1,'sales')
	insert into department202 values(2,'hr')
	insert into department202 values(3,'marketing')
	insert into department202 values(4,'it')

	insert into employes202 values (1,'vinay',1,50000)
	insert into employes202 values (2,'ajay',2,60000)
	insert into employes202 values (3,'uday',3,70000)
	insert into employes202 values (4,'siva',4,80000)
	insert into employes202 values (5,'pavan',5,90000)

	select*from employes202
	select*from department202

	1)scalar subquery

	--find the employee with the highest salary
	select empname,salary from employes202 
	where salary=(select max(salary) from employes202);

	2)correlated subquery


SELECT empname,salary FROM employes202
WHERE salary > (SELECT AVG(salary) FROM employes202)

3)subquery inside in

-- Find employees in the Sales or Marketing department
SELECT empname, departmenti_id
FROM employes202
WHERE departmenti_id IN (SELECT department_id
                         FROM department202
                         WHERE department_name IN ('Sales', 'Marketing'));

4) subquery inside exists

-- Find departments that have at least one employee
SELECT department_name
FROM department202
WHERE EXISTS (SELECT 1
              FROM employes202
              WHERE departmenti_id = department_id);

5)subquery inside=

-- Find the department with department_id = 1
SELECT department_name
FROM department202
WHERE department_id = (SELECT departmenti_id
                       FROM employes202
                       WHERE empname = 'vinay');
