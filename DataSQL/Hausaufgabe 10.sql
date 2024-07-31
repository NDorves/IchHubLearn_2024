-- 1. Подключиться к базе данных world
use world;
/* 2. Вывести население в каждой стране. Результат содержит два поля: 
 CountryCode, sum(Population). Запрос по таблице city.*/
 select
 CountryCode, sum(Population)
 from city
 group by CountryCode;
 
/*3. Изменить запрос выше так, чтобы выводились только страны с населением более 3 млн человек.*/
select
 CountryCode, sum(Population)
 from city
 group by CountryCode
having sum(Population) > 3000000;
/*4. Сколько всего записей в результате?
232 rows
/* 5.Поменять запрос выше так, чтобы в результате вместо кода страны выводилось ее название. 
(Подсказка: нужен join таблиц city и country по полю CountryCode)*/
select co.name, sum(ci.Population)
 from city as ci
 join country as co
 on ci.CountryCode=co.Code
 group by co.name;
 
/* 6 Вывести количество городов в каждой стране (CountryCode, ). 
(Подсказка: запрос по таблице city и группировка по CountryCode)*/
select count(ci.name) as amount_of_cities, ci.CountryCode
from city as ci
join country as co
on ci.CountryCode=co.code
group by ci.CountryCode;

/* 7. Поменять запрос так, чтобы вместо кодов стран, было названия стран. */
select count(ci.id) as amount_of_cities, co.name
from city as ci
join country as co
on ci.CountryCode=co.code
group by ci.CountryCode;
/* 8. Поменять запрос так, чтобы выводилось среднее количество городов в стране.
Подсказка: разделите задачу на несколько подзадач. 
 Например, сначала вывести код страны и количество городов в каждой стране.  
 Затем сделать join получившегося результата с запросом, 
 где высчитывается среднее от количества городов. 
 Потом добавить join, который добавит имена стран, вместо кода. */
/*1. сначала вывести код страны и количество городов в каждой стране*/ 
-- Поменять запрос так, чтобы выводилось среднее
-- количество городов в стране. Подсказка: разделите -- среднее кол-во городов относительно всех стран 
-- задачу на несколько подзадач. Например, сначала
-- вывести код страны и количество городов в каждой
-- стране. Затем сделать join получившегося результата
-- с запросом, где высчитывается среднее от количества
-- городов. Потом добавить

 select * from city;

-- step 1 (получаем код страны + кол-во городов в ней)
select CountryCode, count(Name) as city_count
from city
group by CountryCode;

-- step 2 (получаем среднее значение по кол-ву городов во всех странах) промежуточное, верное
select floor(avg(cc.city_count)) as average_cities
from (
select CountryCode, count(Name) as city_count
from city
group by CountryCode
) as cc;

-- step 3 (Объединяем доп таблицу стран(нужно только имя) + группировка по названию страны) - решение странное, выдаёт обычный подсчёт кол-ва городов в стране, не среднее
select c.Name, avg(cc.city_count)
from (
select CountryCode, count(Name) as city_count
from city
group by CountryCode
) as cc
inner join country as c
on cc.CountryCode = c.Code
group by c.Name;

-- step 3 вид сбоку (Объединяем доп таблицу стран(нужно только имя) + группировка по названию страны) - решение странное, выдаёт обычный подсчёт кол-ва городов в стране, не среднее
select c.Name as country_name, floor(avg(cc.city_count)) as average_cities
from country as c
join (
select CountryCode, count(Name) as city_count
from city
group by CountryCode
) as cc On c.Code = cc. CountryCode
group by c.Code;
 

 

