use world;
 /*1.Вывести количество городов для каждой страны. Результат должен содержать CountryCode, CityCount (количество городов в стране). */
 
select CountryCode, 
count(Name) over(partition by countryCode) as  CityCount
from city; 

/* Поменяйте запрос с использованием джойнов так, чтобы выводилось название страны вместо CountryCode. */
select co.Name, count(ci.Name) over(partition by ci.countryCode) as  CityCount
from city as ci
join country as co
on ci.CountryCode=co.Code; 

/*2. Используя оконные функции, вывести список стран с продолжительностью жизнью и средней продолжительностью жизни. */
select code, 
LifeExpectancy, 
avg(LifeExpectancy) over ()as AVG_LifeExsp 
from country;

/* 3. Используя ранжирующие функции, вывести страны по убыванию продолжительности жизни.*/
select code, LifeExpectancy,  
dense_rank() over(order by LifeExpectancy desc) as rank_poup
from country
;

/*4. Используя ранжирующие функции, вывести третью страну с самой высокой продолжительностью жизни.*/
select *from (
select code, LifeExpectancy,  
dense_rank() over(order by LifeExpectancy desc) as rank_poup
from country) as t1
where rank_poup=3
;
