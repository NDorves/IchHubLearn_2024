
-- 1. Подключиться к базе данных hr
use hr;
/* 2. Вывести список region_id, total_countries, где total_countries - количество стран в таблице. 
Подсказка: работаем с таблицей countries, использовать оконную функцию over() и суммировать count(country_id).*/
select region_id, 
count(country_id) over() as  total_countries
from countries
;

/* 3. Изменить запрос 2 таким образом, чтобы для каждого region_id выводилось количество стран в этом регионе. 
Подсказка: добавить partition by region_id в over().*/
select region_id, 
count(country_id) over(partition by region_id) as  total_countries
from countries
;

/* 4. Работа с таблицей departments. Написать запрос, который выводит location_id, 
department_name, dept_total, где dept_total - количество департаментов в location_id.*/
select l.location_id, d.department_name, count(d.department_id) over(partition by location_id) as dept_total
from departments as d
join locations as l
on d.location_id=l.location_id
;


/* 5. Изменить запрос 3 таким образом, чтобы выводились названия городов соответствующих location_id. */
select l.location_id, l.city, d.department_name, count(d.department_id) over(partition by location_id) as dept_total
from departments as d
join locations as l
on d.location_id=l.location_id
;

/* 6. Работа с таблицей employees. Вывести manager_id, last_name, total_manager_salary, 
где total_manager_salary - общая зарплата подчиненных каждого менеджера (manager_id). */
select d.manager_id, e.last_name,
(
select   
 sum(e.salary) over (partition by employee_id)) as total_manager_salary
from employees as e
join departments as d
on d.manager_id=e.manager_id
-- group by employee_id
;
select sum(salary) over(partition by employee_id)
from manager_id -- employees;