SELECT * FROM hr.employees;

SELECT STR_TO_DATE('25,07,2020', '%d,%m,%Y');

SELECT STR_TO_DATE('2013-03-17T14:25:39.123', '%Y-%m-%dT%H:%i:%s.%f');

SELECT DATE_FORMAT(NOW(), '%Y_%m_%d | %H - %i - %s');

select now();


SELECT DATEDIFF('2023-02-19', '2023-01-01');

SELECT TIMESTAMPDIFF(MONTH, '2003-02-01', '2003-05-01');
SELECT TIMESTAMPDIFF(MONTH, '2003-02-18', '2003-05-01');

SELECT TIMESTAMPDIFF(MINUTE,'2003-02-01','2003-05-01 12:05:55');
-- Используя базу данных hr, написать запрос, который отображает сотрудников, нанятых в 2005 году.
SELECT * FROM hr.employees
where hire_date between
'2005-01-01' and 
'2005-12-31';

SELECT * FROM hr.employees
where hire_date between
str_to_date('01-2005-01','%d-%Y-%m')  and 
str_to_date('31-2005-12','%d-%Y-%m');

/*2. 
Написать запрос, который отображает среднюю AMT (сумма заказа) в 2022 году */
use shop;

SELECT avg(AMT) as avg_amount,  ODATE
from ORDERS
WHERE ODATE between str_to_date('2022-01-01', '%Y-%m-%d')  and str_to_date('2022-12-31', '%Y-%m-%d');
-- date_format(ODATE, '%Y') = 2022;
-- INTERVAL
-- HOUR;

SELECT *
-- FROM table
WHERE datetime_column > NOW() - INTERVAL 1 WEEK;

SELECT DATE_ADD('2001-01-01', INTERVAL 6 MONTH);

SELECT DATE_ADD('2020-01-01', INTERVAL -1 YEAR) AS date_add;

SELECT SUBDATE('2020-01-01', INTERVAL 6 MONTH) AS sub_date;
SELECT DATE_SUB('2020-01-01', INTERVAL 6 MONTH) AS date_SUB;

SELECT '2020-01-01' - INTERVAL 1 YEAR;


-- SELECT STR_TO_DATE(column_name, '%Y-%m-%d'), -- ...
-- FROM ...
 -- ...;
-- Weekday;
select weekday('2024-07-09'); -- pokay den' nedeli

select LAST_DAY(now()); -- poslednij den' mesjaca
-- EXTRACT po kotor mozhno vernut| sec, min ,chasy, dni, nedeli, mesjaac, god...alter
select extract(week From '2024-07-09'); -- pokaz nomer tekuwej nedeli

use hr;
-- Определите месяц, в который чаще всего принимают на работу
select 
EXTRACT(MONTH from hire_date) as month1,
count(*) as cnt
from
employees e
group by month1
ORDER by cnt desc
limit 1;

-- Выведите количество заказов по месяцам (номер месяца - количество заказов в этом месяце)
use shop;

select  extract(MONTH from ODATE) as mon_nam, count(ORDER_ID) as count_orders
from ORDERS
group by mon_nam;
-- oder
select  monthname(ODATE) as mon_nam, count(ORDER_ID) as count_orders -- vyvodit po nazvaniju mesjaca.
from ORDERS
group by mon_nam;

-- Выведите список заказов в марте
select *
from ORDERS
where extract(month from Odate) - 3;
-- oder
select *
from ORDERS
where monthname(Odate) = 'March';
-- Определить какие из покупок были совершены в интервале от 10 апреля 2022 до 10 мая 2022 года
select *
from ORDERS
where ODATE between '2022-04-10'and '2022-05-10';
-- oder
select * ,monthname(ODATE) as mont_name -- ukazyvaet nazvanie mesjaca
from ORDERS
where ODATE between '2022-04-10'and '2022-05-10';

/*Напишите SQL-запрос для анализа покупок, совершенных в июне, 
и определите количество покупок для каждого продавца. 
Результат запроса должен содержать идентификатор продавца и количество покупок, сделанных им в июне.*/
select SELL_ID, count(ORDER_ID) as orders_count
from ORDERS
where month(ODATE) = 6
group by SELL_ID;
-- oder
select SELL_ID, count(ORDER_ID) as orders_count, monthname(ODATE) as month_name
from ORDERS
where month(ODATE) = 6
group by SELL_ID;
/*Напишите SQL-запрос для анализа средней стоимости покупок, совершенных в марте, 
и определите, какие продавцы имеют самую высокую и самую низкую среднюю стоимость 
покупок в этом месяце. Обязательно выведите имя продавца.*/
 
select s.sname, 
round(avg(o.amt), 2) as avg_amt, 
min(o.amt) as min_amt, 
max(o.amt) as max_amt
from ORDERS as o
join SELLERS as s
on o.sell_id = s.sell_id
where month(o.odate) = 3
group by s.sname;

/*Напишите SQL-запрос для анализа покупок, совершенных во вторник, и предоставьте информацию 
о каждом заказе, включая сумму, дату, имя покупателя и имя продавца. 
*/
select o.ODATE, o.AMT, s.SNAME,c.CNAME
from ORDERS as o
join SELLERS as s
on o.SELL_ID=s.SELL_ID
join CUSTOMERS as c
on o.CUST_ID=c.CUST_ID
where weekday(o.ODATE) = 1;

/*Определить, сколько покупок было совершено в каждый месяц. 
Отсортировать строки в порядке возрастания количества покупок. 
Вывести два поля - номер месяца и количество покупок*/
select 
extract(MONTH from ODATE) as nam_man,
count(ORDER_ID) as c
from ORDERS 
group by nam_man
order by c;
