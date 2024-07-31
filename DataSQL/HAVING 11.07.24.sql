/*1. выведите номера отделов и количество сотрудников в каждом отделе, где сотрудников больше 10*/
use hr;
select department_id, count(*) as count_employee
from employees
group by department_id
having count_employee > 10;

/*2. aus 1. statt department_id --> department_name*/ 
select d.department_name, count(*) as count_employee
from employees as e
inner join departments as d
on e.department_id=d.department_id
group by d.department_name
having count_employee > 10
;
/*3. найти максимальную зарплату в каждом департаменте. Вывести department_id и max_salary.*/
select d.department_name, max(e.salary) as max_Salary
from departments as d
inner join employees as e
on d.department_id=e.department_id
group by d.department_name;

/*4. Найти сотрудников, у которых наибольшая зарплата в их департаменте.*/
select e.first_name, e.last_name, e.job_id, e.salary, dep_salary.max_salary as by_dep, hire_date
from employees as e
inner join ( 

select department_id, max(salary) as max_salary
from employees as e
group by department_id
) as dep_salary
on e.department_id=dep_salary.department_id
where e.salary = dep_salary.max_salary
order by e.salary desc;
-- oder
select d.department_name, e.first_name, e.last_name, e.job_id, max(e.salary), e.hire_date
from employees as e
join departments as d
on d.department_id=e.department_id
group by d.department_name;


/*5. Найти департамент с наибольшим кол-вом сотрудников. */
SELECT												-- ossnovnoj zapros
*
FROM departments d
WHERE department_id in 
(
SELECT e.department_id
from employees e
group by department_id
having COUNT(department_id) = 
(
SELECT max(cnt_emp) 									-- 2 ZAPROS
FROM 
(
SELECT department_id, count(employee_id) as cnt_emp    	-- 1 ZAPROS
from employees e
group by department_id
order by cnt_emp desc )as tb1));

-- oder 
select d.department_id, d.department_name, count(e.employee_id) as count_emp, d.manager_id
from departments as d
inner join employees as e
on d.department_id=e.department_id
group by d.department_id
order by count_emp desc
limit 1; 

/*6. Найти департаменты, в которых больше 10 сотрудников*/
select t1.department_id, t1.department_name, t1.manager_id, t2.count_of_emp
from departments as t1
join (
	select department_id, count(employee_id) as count_of_emp
    from employees
    group by department_id
    having count_of_emp > 10

) as t2
on t1.department_id= t2.department_id;
