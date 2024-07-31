/*Подключитесь к базе данных hr (которая находится на удаленном сервере). 
USE hr;*/
USE hr;
/*2. Выведите количество сотрудников в базе*/
select count(job_id) 
from hr.employees;
/*3. Выведите количество департаментов (отделов) в базе */
select count(department_name)
from hr.departments;

/*4. Подключитесь к базе данных World (которая находится на удаленном сервере). */
use world;
/*5. Выведите среднее население в городах Индии (таблица City, код Индии - IND)
*/
select avg(Population) as avg_Population
from city
where CountryCode = 'IND';
/*6. Выведите минимальное население в индийском городе и максимальное.*/
select min(Population) as min_Population,
max(Population)
from city
where CountryCode = 'IND';
/*7. Выведите самую большую площадь территории.*/
select max(SurfaceArea)
from country;
/*8. Выведите среднюю продолжительность жизни по странам. */
select avg(LifeExpectancy) as avg_Life
from country;
/*9. Найдите самый населенный город (подсказка: использовать подзапросы)*/
SELECT Name, MAX(Population) 
FROM city
WHERE Population = (SELECT MAX(Population) FROM city)
group by name;
