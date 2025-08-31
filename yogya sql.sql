--DDL (Data Definition Language)

create table employees
( emp_id int primary key,name varchar(50),age int,department varchar(50),salary decimal(10,2),hire_date date);

-- DML 

insert into employees (emp_id, name, age, department, salary, hire_date)
values 
    ( 1 ,'Alice', 30, 'HR', 60000, '2022-05-10'),
	
    ( 2 , 'Steve', 20, 'Finance', 10000, '2022-05-13'),

    ( 3, 'Bob', 35, 'IT', 20000, '2022-05-11'),

    ( 4, 'Charlie', 28, 'Marketing', 50000, '2022-06-01'),

    ( 5, 'David', 40, 'HR', 70000, '2022-06-15'),

    ( 6, 'Eva', 25, 'Finance', 12000, '2022-07-01'),

    ( 7, 'Frank', 32, 'IT', 25000, '2022-07-10'),

    ( 8, 'Grace', 22, 'Marketing', 45000, '2022-08-01'),

    ( 9, 'Hank', 29, 'Sales', 30000, '2022-08-15'),

    ( 10, 'Ivy', 33, 'Sales', 35000, '2022-09-01'),

    ( 11, 'Abhi', 35, 'Games', 55000, '2022-09-09');

	truncate table Employees;

-- DQL (Data Query Language)

select * from employees
order by 1;

--query the data with different conditions

--Q1: retrieve the records of employees working in IT.

select * from employees
where department = 'IT';

--Q2: retrieve the records of employees NOT working in IT.

select * from employees
where department != 'IT';

-- Using Alias name

select 
	emp_id,
	name as emp_name
from employees;

--Arithmetic Expression in Query

--Q3: Retrieve records of employees with their annual salary.

select 
	emp_id, 
	name, 
	salary as monthly_salary, 
	salary * 12 as Annual_Salary
from employees;

--Q4: retrieve the records of employees working in IT and salary greater than 20000.

select * from employees
where department = 'IT' 
and salary > 20000;

--Q5: retrieve the records of employees working in IT or salary greater than 20000.

select * from employees
where department = 'IT' 
or salary > 20000;

-- Querying the Data

select * from employees order by 1 asc;

select * from employees where department = 'Marketing';

select * from employees where department != 'Marketing';

-- Using Alias name 

select
	emp_id,
	name as emp_name
from employees;

-- Arithmetic Expressions in Query

select 
	emp_id,
	name,
	salary as monthly_salary,
	salary * 12 as annual_salary
from employees;

--Q: Retrieve employees name, their monthly salary, and a 10% bonus fo the salary.

select 
	name,
	salary as monthly_salary,
	salary * 0.10 as bonus
from employees;

--FIltering the data with Where Clause

--Q: Retrieve employees in IT dept with a salary greater than 20000.

select * from employees where department = 'IT' and salary > 20000;

--Q: Retrieve employees in IT dept or salary greater than 20000.

select * from employees where department = 'IT' or salary > 20000;

--Q: salary BETWEEN 30000 and 60000

select * from employees where salary BETWEEN 30000 and 60000;

selec

--Using 'IN' in Where condition

select * from employees where department IN ('IT','Finance');

--NOT IN

select * from employees where department NOT IN ('IT','Finance');

-- Using LIKE 

--%<letter> ending of the word
--%<letter>% anywhere in the word
--<letter>% Starting of the word

select 
	name,
	department,
	salary
from employees
where name like '%e%';

select 
	name,
	department,
	salary
from employees
where name like 'G%';

select 
	name,
	department,
	salary
from employees
where name like '%e';

--NOT Like

select 
	name,
	department,
	salary
from employees
where name not like '%e%';

-- Sorting data

select * from employees 
order by emp_id asc;

select * from employees 
order by emp_id desc;

--Sorting with multiple columns

select * from employees
order by department asc, salary desc;

select * from employees
order by department desc, salary asc;


select 
	emp_id as employees_id
from employees
where employees_id > 5;

select * from departments;

-- Joins

-- 1) inner join: Returns only rows where there is a match in both tables

-- SYNTAX
-- select * from <table_1>
-- inner join <table_2> ON table_2.col = table_1.col

create table department (dpt_id int primary key, dept_name Varchar(50)UNIQUE NOT NULL);

 insert into department (dpt_id, dept_name)
 Values
(1, 'HR'),
(2, 'Finance'),
(3, 'IT'),
(4, 'marketing'),
(5, 'sales'),
(6, 'Operations'),
(7, 'Legal'),
(8, 'Support'),
(9, 'Engineering'),
(10, 'Research');


select* from department
select * from employees

inner join department on department.dept_name = employees.department
order by emp_id;

(1, 'HR'),
(2, 'Finance'),
(3, 'IT'),
(4, 'marketing'),
(5, 'sales'),
(6, 'Operations'),
(7, 'Legal'),
(8, 'Support'),
(9, 'Engineering'),
(10, 'Research');

select * from employees a
inner join department b on b.dept_name = a.department
order by emp_id;

select * from employees  
	employees.emp_id,
	employees.name,
	employees.department,
	departments.dept_id
from employees
inner join department on department.dept_name = employees.department
order by emp_id;

select 
	a.emp_id,
	a.name,
	a.department,
	b.dept_id
from employees a
inner join departments b on b.dept_name = a.department
order by emp_id;

-- left join 

select 
	a.emp_id,
	a.name,
	a.department,
	b.dept_id,
	b.dept_name
	
select * from employees a
left join department b on b.dept_name = a.department
order by emp_id;

-- Right join

select 
	a.emp_id,
	a.name,
	a.department,
	b.dept_id,
	b.dept_name
select *from employees a
right join department b on b.dept_name = a.department
order by emp_id;

-- Full Outer join

select 
	a.emp_id,
	a.name,
	a.department,
	b.dept_id,
	b.dept_name
select *from employees a
full outer join department b on b.dept_name = a.department
order by emp_id;

--Aggregating and grouping 

-- COUNT, SUM, AVG, MAX, MIN

--Count
--from table Employees
select * from employees;

select count (*) from employees;
select count (emp_id) from employees;
select count (department) from employees;
select count ( distinct department) from employees;


--from table department
select *  from department;
select distinct (department)from department;

--Sum

Select sum (salary) as Total_salary from employees;

select avg (salary) as avg_salary from employees;

select Round (avg(salary),2) as avg_salary from employees;
select Round (avg(salary),0) as avg_salary from employees;
select Round (avg(salary),3) as avg_salary from employees;

select max (salary) as max_salary from employees;

select max (age) as max_age from employees;
select min (salary) as min_salary from employees;

select min (age) as min_age from employees

select * from employees;

-- Grouping
--group by

select department from employees
group by department;

select department, count (*) from employees
group by department;

select department, count (name) from employees
group by department;

select Hire_date,count (name)
from employees group by hire_date, name 
order by hire_date;

select
department,sum(salary) as total_salary
from employees group by department; 

select
department, avg(salary) as avg_salary
from employees group by department;

-- just removed decimal
select
department, Round (avg(salary),2) as avg_salary
from employees group by department;

--min
select department, min (salary)
from employees group by department;

select department, min (age)
from employees group by department;

-- max
 select department, max (salary)
from employees group by department;

select department, max (age)
from employees group by department;

select department,
count (*) as employees,
sum (salary) as total_salary,
Round (avg (salary),2) as avg_salary,
max (salary)as max_salary,
min (salary)as min_salary,
max (age) as min_age,
min(age)as min_age
from employees
group by department;


