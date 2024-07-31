/* 1. Найти количество сотрудников у каждого менеджера. Вывести manager_id и employees_cnt
select manager_id, count(employee_id)  as employees_cnt
from employees
group by manager_id;

select manager_id, count(employee_id) over(partition by manager_id)   as employees_cnt
from employees
;

/*2. Работаем с базой World. Выведите седьмой по густонаселенности город. 
Подсказка: использовать функцию rank() и оконные функции.*/
use world;
select  * from
(select CountryCode, Name, Population,
dense_rank() over(order by Population desc) as rank_poup
from city) t1
where rank_poup = 7;

use world;
select * from
(select
CountryCode,
Name,
Population,
DENSE_RANK() OVER (order by Population desc) as rank_pop
from city) t1
where rank_pop=7;

/* 3. Напишите запрос для определения разницы в продолжительности жизни между текущей 
страной и страной с самой высокой продолжительностью жизни.*/
SELECT Name, LifeExpectancy, 
max(LifeExpectancy) over() as max_LifeExpectancy, 
LifeExpectancy - max(LifeExpectancy) over() as Life_Exp_dif,
max(LifeExpectancy)over() - LifeExpectancy  as Life_Exp_dif_2,
round(LifeExpectancy / max(LifeExpectancy) over() * 100, 3) as Life_Exp_dif_PROZ  -- 3 Symbol nach koma
FROM world.country
;
/*4. Выполните ранжирование стран по средней численности населения*/
select Co.Code, avg(Ci.Population) ,
dense_rank () over (order by avg(Ci.Population) DESC)
from country as Co
inner join city as Ci
on Ci.CountryCode = Co.Code
group by Co.Code;

select co.Code, if (ci.Population is null, 0, avg(ci.Population)), 
dense_rank() over(order by avg(ci.Population)desc)
from country as co
inner join city as ci
on ci.CountryCode = co.Code
group by co.Code
limit 5
;

/*5. На основании предыдущего запроса выведите топ 5 стран по средней численности населения (Используйте LIMIT)*/
select Co.Code, if(Ci.Population is null, 0, avg(Ci.Population)) as Population,
dense_rank () over (order by avg(Ci.Population) desc)
from country as Co
left join city as Ci
on Ci.CountryCode = Co.Code
group by Co.Code
limit 5;

/* 6.  На основании предыдущего запроса выведите топ 5 стран по 
средней численности населения (используйте вложенный запрос*/
 
select * from (
	select Co.Code, if(Ci.Population is null, 0, avg(Ci.Population)) as Population,
	dense_rank () over (order by avg(Ci.Population) desc) as rank_pop
	from country as Co
	left join city as Ci
	on Ci.CountryCode = Co.Code
	group by Co.Code
) as t1 where rank_pop <= 5;


/*7. Напишите запрос для определения доли населения города от общей численности населения страны и проведите 
ранжирование городов в пределах каждой страны*/
select Name, 
CountryCode, 
sum(Population) over(partition by(CountryCode))as contry_pop,
round(Population / sum(Population) over(partition by(CountryCode))* 100, 3) as pop_perc,
dense_rank()over(partition by CountryCode order by Population desc) as pop_rank
from city

;

/*8. Написать SQL-запрос для выбора городов, занимающих первое место по населению 
в своих странах и превышающих среднее население по всем городам.*/
select * from (
select Name, CountryCode, Population,
dense_rank() over(partition by CountryCode order by Population desc) as city_rank,
round(avg(Population) over(), 2) as avg_pop
from city) as T1
where  city_rank=1 and Population > avg_pop
;

/*9. Выведите список форм правления (GovernmentForm) c количеством стран, где есть эта форма правления. */
select  Name, Continent, Region, GovernmentForm, 
if(LifeExpectancy is null, 0, LifeExpectancy)as LifeExpectancy,
count(Code) over(partition by GovernmentForm)as country_count
from country
order by GovernmentForm
;

/*10. Выведите второго по зарплате сотрудника в каждом департаменте.*/
use hr;
select * from ( 
select e.first_name, d.department_name,
dense_rank() over(partition by e.department_id order by salary desc)as rank_s
from employees as e
left join departments as d
on e.department_id=d.department_id) T1
where rank_s = 2
;



