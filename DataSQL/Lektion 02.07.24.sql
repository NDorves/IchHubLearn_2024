use hr;
select * from hr.employees
limit 1000;
-- Funkcija COUNT
select count(*) 
from hr.employees;

use hr;
select count(employee_id) 
from hr.employees;
-- Funkcija  SUM
select sum(salary) from hr.employees;

-- Funkcija  MIN i MAX
select min(salary) from hr.employees;
select max(salary) from hr.employees;
-- Funkcija AVG
select avg(salary) from hr.employees;
-- identichno
select sum(salary) / count(salary) from hr.employees;
-- Podsapros
select *
from hr.employees
where salary>6465; -- > prostoereshenie

select *
from hr.employees
where salary>(
	select avg(salary)
	from hr.employees);
    
--  Найти имя и фамилию сотрудника с самой высокой зарплатой    
select first_name, last_name
 from hr.employees
 where salary =(select max(salary) from hr.employees);
 
		-- Используя базу hr_data.sql, найти самую высокую зарплату. 
        
select max(salary) as max_salary 
from hr.employees;
-- Найти имя и фамилию сотрудника с самой высокой зарплатой.
select count(last_name)
from hr.employees;

select employees.first_name, employees.last_name
from hr.employees
where salary = (select max(salary) from hr.employees);

-- Найти среднюю зарплату по компании.
select avg(salary) as avg_salary
from hr.employees;
-- Найти сотрудников, у которых зарплата меньше средней зарплаты по компании.
select *
from hr.employees
where salary < (select avg(salary) from hr.employees);

-- Найти количество департаментов, в которых никто не работает.
select count(*) as sum 
from hr.departments as d 
right join hr.employees as e
on d.department_id=e.department_id
where d.department_id is null;

-- Найти среднюю зарплату в департаменте с id 90.
select department_id, round(avg(salary), 2)  as avg_salary
from hr.employees
where department_id = 90;
/*Найти самую большую зарплату среди сотрудников, 
работающих в департаментах с id 70 и 80.*/
select department_id, max(salary)  as max_salary
from hr.employees
where department_id in (70, 80);

select max(salary)  as max_salary
from hr.employees
where department_id = 80;
-- gruppirovka GROUP BY

select department_id,
count(employees) as count_of_employees
from hr.employees as e
inner join departments as d
on e.department_id=d.department_id
group by department_name;

-- Vybrat skolko sotrudnikov rabotajut na kayhdoj dolzhnosti
select job_id,
count(employee_id) as count_of_employees
from hr.employees
group by job_id;
-- vyvesti srenjuju, min i max yarplatu vseh sotrudnikov.
select d.department_name,
avg(salary)as avg_salary,
max(salary)as max_salary,
min(salary)as min_salary
from hr.employees as e
inner join hr.departments as d
on d.department_id=e.department_id
group by d.department_name;






    

 

