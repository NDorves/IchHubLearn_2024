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
