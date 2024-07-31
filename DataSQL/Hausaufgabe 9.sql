-- 1. Вывести текущую дату и время.
SELECT date_format(now(), '%Y_%m_%d  Teim: %H - %i - %s') as date_teim;
-- 2. Вывести текущий год и месяц
select date_format(now(), '%Y_%m') as date;

-- 3. Вывести текущее время
select date_format(now(), '%H : %i : %s')as Teim;
-- 4. Вывести название текущего дня недели
select dayname('2024_07_09') as date;

-- 5. Вывести номер текущего месяца
select month('2024_07_09') as month;
-- 6. Вывести номер дня в дате “2020-03-18”
select dayofweek("2020-03-18");

/*7. Подключиться к базе данных shop (которая находится на удаленном сервере)*/
use shop;
/*8. Определить какие из покупок были совершены апреле (4-й месяц)*/
select ODATE, ORDER_ID  
from ORDERS
where ODATE in ('2022-04-10');

/*9. Определить количество покупок в 2022-м году*/
select count(AMT), ODATE  
from ORDERS
where ODATE between str_to_date('2022-01-01', '%Y-%m-%d')  and str_to_date('2022-12-31', '%Y-%m-%d')
group by ODATE;


/*10. Определить, сколько покупок было совершено в каждый день. 
 Отсортировать строки в порядке возрастания количества покупок.
 Вывести два поля - дату и количество покупок*/
select  dayofyear(ODATE) as day, count(ORDER_ID) as Cou_ord
from ORDERS
group by ODATE
order by Cou_ord ASC; 

/*11 Определить среднюю стоимость покупок в апреле*/

SELECT ODATE, avg(ORDER_ID) AS avg_ORDERS
FROM ORDERS 
WHERE monthname(Odate) = 'april'
GROUP BY ODATE
;





