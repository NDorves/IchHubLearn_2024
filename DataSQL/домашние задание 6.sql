
/*1. Подключитесь к базе данных world (которая находится на удаленном сервере). 
use world;
2. Выведите список стран с языками, на которых в них говорят. */
select co.Name, cl.Language
from country as co
inner join countrylanguage as cl
on co.code=cl.CountryCode;

/* 3.Выведите список городов с их населением и названием стран */
select ci.Name,  ci.Population, co.Name
from city as ci
inner join country as co
on ci.CountryCode=co.code;

/*4. Выведите список городов в South Africa*/
select ci.name as 'City in S.Africa'
from city as ci
join country as co
on ci.CountryCode=co.Code
where co.name ='South Africa';

/*5. Выведите список стран с названиями столиц. 
Подсказка: в таблице country есть поле Capital, 
которое содержит номер города из таблицы City. */
select country.Name as 'Country', city.Name as 'Capital'
from country 
join city 
on country.Capital = city.ID;
/*6.Измените запрос 4 таким образом, чтобы выводилось население в столице.  */
select ci.name as 'City in S.Africa', ci.Population
from city as ci
join country as co
on ci.CountryCode=co.Code
where co.name ='South Africa';

/*7.Напишите запрос, который возвращает название столицы United States */
select ci.name, co.name
from city as ci
join country as co
on ci.id= co.capital
where co.name ='United States';

/*8. Используя базу hr_data.sql, вывести имя, фамилию и город сотрудника.*/
use hr;
select e.first_name, e.last_name, l.city
from employees as e
join departments as d
on e.manager_id =d.manager_id
join locations as l
on l.location_id=d.location_id;
/*9. Используя базу hr_data.sql, вывести города и соответствующие городам страны.*/
select l.city, c.country_name
from countries as c
join locations as l
on c.country_id=l.country_id;
