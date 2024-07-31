/*select t1.id, t1.name, t2.age	-- komanda INNER JOIN
from Table_1 t1
join Table_2 t2
on t1.id =t2.id	8/	-- ob'edinenie polej c odinakovym znacheniem.

/*select t3.id, t3.lastname, t.4
from Table_3 t3
join Tabe_4 t4
on t3.id = t4.id*/
use hr;
/*Используя базу hr_data.sql, вывести имя и фамилию сотрудника и название его департамента*/
select 	
t1.first_name,
t1.last_name,
t2.department_name,
t1.department_id
from hr.employees t1
inner join hr.departments t2
	on t1.department_id = t2.department_id and t2.department_name in('IT', 'Treasury', 'IT Support');
-- where t2.department_name = 'IT' or t2.department_name = 'Treasury' or t2.department_name = 'IT Support'; -- vtoroj variant reschenija

/*Вывести имя и фамилию сотрудника и имя и фамилию его менеджера. */
select e.first_name, e.last_name, m.first_name, m.last_name
from employees e
join employees m
on e.manager_id = m.employees_id;

/*Вывести job_id тех сотрудников, которые зарабатывают больше своего менеджера*/
select e.job_id
from employees e
join employees m
on e.manager_id = m.employee_id and e.salary > m.salary;
/*Вывести имя, фамилию и город сотрудников, которые работают в Seattle или Toronto*/
select 
t1.first_name,
t1.last_name,
t2.city_name
from hr.employees t1
join hr.departments t3 
on t1.department_id = t3.department_id
join locations t2 on location_id = t3.location_id and t2.city in ('Seattle','Toronto');

/*Выведите названия департаментов, в которых менеджеры зарабатывают больше 10000*/

select distinct d.department_name 
from hr.departments as d
join hr.employees as e 
on d.manager_id = e.manager_id where e.salary > 10000;

select distinct d.department_name 
from hr.departments as d
join hr.employees as e 
on d.manager_id = e.manager_id and e.salary > 10000;

/*Вывести имя, фамилию, название департамента и название должности сотрудника.
*/
select 
e.first_name,
e.last_name,
e.job_id,
j.job_title,
d.department_name
from hr.employees as e
join departments as d
on e.department_id = d.department_id 
join jobs j
on e.job_id = j.job_id;
 
/*Вывести имя, фамилию и зарплату тех сотрудников, 
которые работают в городах Oxford и 
San Francisco*/
select 
e.first_name,
e.last_name,
e.salary
from hr.employees as e
join hr.departments as d
on e.department_id = d.department_id 
join hr.locations as l
on l.location_id = d.location_id 
where l.city in ('Oxford', 'San Francisco');

select 
e.first_name,
e.last_name,
e.salary
from hr.employees as e
join hr.departments as d
on e.department_id = d.department_id 
join hr.locations as l
on l.location_id = d.location_id 
and l.city in ('Oxford', 'San Francisco');

/*Используя данные из схемы HR выведите имя и фамилию сотрудника
 и название его департамента (hr.departments).*/
select 
e.first_name,
e.last_name,
d.department_name
from hr.employees as e
left join hr.departments as d
on e.department_id = d.department_id;
use hr;


select *  from employees where salary > 10000 or salary <= 10000;

