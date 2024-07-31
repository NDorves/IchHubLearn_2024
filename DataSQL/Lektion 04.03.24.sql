/* 1.Создайте SQL запрос, который позволяет вывести информацию о населении стран в двух столбцах:
 'CountryCode' и 'Население', где 'Население' представляет собой 
 суммарное количество жителей всех городов в каждой стране.*/
 select
CountryCode,
SUM(Population)
From city 
group by CountryCode;
/*2.Отобразите результат аналогично заданию 1, однако вместо 'CountryCode' включите названия стран. 
Для этого примените операцию JOIN между таблицами 'city' и 'country', 
используя условие соединения 'city.CountryCode = country.Code'. */
select ct.name,
 sum(c.population) as country_population
 from city as c
 inner join country as ct
 on c.CountryCode = ct.Code 
 group by countryCode;
 /*3.Предоставьте список стран, указав количество используемых языков в каждой из них,
 выводя отчёт в формате (CountryCode, COUNT(Language)).  */
 select *
from country;

select *
from countrylanguage;

select
CountryCode,
count(Language) as count_lng
from countrylanguage
group by CountryCode
order by count_lng desc;

select
cn.Name,
cl.CountryCode,
count(cl.Language) as count_lng
from countrylanguage as cl
join country as cn
on cl.CountryCode = cn.Code
group by CountryCode
order by count_lng desc;

select
cn.Name,
cl.CountryCode, count(cl.Language) as count_lng
from countrylanguage as cl
join country as cn
on cl.CountryCode = cn.Code
where cl.IsOfficial=1
group by CountryCode
order by count_lng desc
;

/*5. Выведите количество сотрудников, работающих в отделах Marketing и IT, 
используя операцию JOIN между таблицами "employees" и "departments" по полю "department_id"*/
select d.department_name, count(e.employee_id)
from hr.employees as e
join hr.departments as d
on e.department_id=d.department_id
where d.department_name in ('Marketing', 'IT')
group by d.department_name;
/*6. Посчитайте сумму зарплат сотрудников, работающих в IT*/
select sum(salary) as total_inkome
from employees
where department_id=(select department_id from departments where department_name = 'IT');

-- ili

select sum(salary) as total_income, d.department_name
from departments as d
join employees as e
on d.department_id=e.department_id
where department_name= 'IT';

use Students;


/* 7. Выведите имена студентов и id курса, которые они проходят*/
select * from Students;
select * from Courses;
select * from Students2Courses;

select S.first_name, SC.course_id
from Students as S
inner join Students2Courses as SC
on SC.student_id=S.id;

/*8.Измените запрос в задании 1 так, чтобы выводились имена студентов и названия курсов, которые они проходят */
select S.first_name, C.title
from Students as S
inner join Students2Courses as SC
on SC.student_id=S.id
inner join Courses as C
on C.id=SC.course_id;