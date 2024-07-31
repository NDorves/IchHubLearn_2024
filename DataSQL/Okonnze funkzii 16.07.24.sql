use hr;
select * from CUSTOMERS
use shop;

select
ORDER_ID,
ODATE,
AMT,
sum(AMT) over() as total_amount,
round(AMT / sum(AMT) over(), 3) as percentage_range
from ORDERS;
/* Оконные функции в MySQL предоставляют возможность выполнять вычисления на
 основе определенного "окна" или набора строк, связанных с текущей строкой.
 Эти функции обеспечивают более гибкий и мощный способ агрегирования данных в
 сравнении с обычными агрегатными функциями. Оконные функции используются в комбинации с ключевыми словами OVER для
 указания окна данных.*/
select * from CUSTOMERS;

select
CITY,
avg(RATING) over (PARTITION BY CITY) as average_rating
from CUSTOMERS;
/* PARTITION BY- это часть выражения OVER в оконных функциях SQL, которая
 позволяет разделить результаты запроса на логические группы или "партиции" для
 дальнейшего применения оконных функций к каждой из этих групп независимо друг
 от друга*/
select
CITY,
avg(RATING) as average_rating
from CUSTOMERS
group by CITY;
use shop;
/*1. Вывести информацию о каждом заказе и максимальную сумму заказа в том же месяце для каждой строки.*/
select * from shop;
select ORDER_ID, AMT, ODATE, max(AMT) over(partition by extract(month from ODATE)) as max_sum
from ORDERS;
/*2. Для более полного понимания практической значимости прошлого запроса, добавим подсчет относительного вклада каждого заказа в общий объем продаж месяца.
*/
-- with Y-m

select 
ORDER_ID,
amt,
ODATE,
DATE_FORMAT(ODATE, '%Y-%m') as my,
max(AMT) OVER(PARTITION BY DATE_FORMAT(ODATE, '%Y-%m')) as max_sum,
AMT / max(AMT) OVER(PARTITION BY DATE_FORMAT(ODATE, '%Y-%m')) * 100 as ord_prctg
from ORDERS 
order by max_sum DESC;

 
/*3. Вывести список продавцов с указанием общей суммы их продаж. Отсортировать продавцов по убыванию суммы продаж.*/

select s.SNAME, s.SELL_ID, 
if(o.AMT is null, 0, o.AMT) as AMT,
if(sum(o.AMT) over (partition by o.SELL_ID) is null, 0, sum(o.AMT) over (partition by o.SELL_ID)) as ord_sam
from SELLERS as s
left join ORDERS as o
on s.SELL_ID=o.SELL_ID 
order by ord_sam desc;


/* Ранжирующие функции в SQL выполняют нумерацию и ранжирование значений для
 каждой строки в рамках определенного окна данных. Такие функции полезны, когда
 требуется назначить порядковый номер или ранг элементам данных в запросе.
 Разберем наиболее популярные ранжирующие функции*/
 //* RANK
 Присваивает ранг каждой строке в окне данных.Если есть одинаковые
 значения, им присваивается одинаковый ранг, пропуская следующий.
 Пример использования:*/
/*RANk */
select * ,
rank() over(order by CUST_ID desc) as rank_id -- over delit na logicheskie gruppy, rank sortiruet po gruppam
from ORDERS;
/* Присваивает ранг каждой строке в окне данных. В отличие от RANK , не
 пропускает следующий ранг для одинаковых значений.*/
 
/*DENS_RANK()*/ -- schitaet rangi po porjadku


select * ,
rank() over(order by CUST_ID, SELL_ID desc) as rank_id, 
dense_rank() over(order by CUST_ID desc) as rank_id 
from ORDERS;
/* NTILE(n) delit znachenija na logicheskie gruppy */

/* NTILE(n):
 Разделяет данные на n групп и присваивает каждой строке номер группы.*/
 
select * ,
rank() over(order by CUST_ID, SELL_ID desc) as rank_id, -- 
dense_rank() over(order by CUST_ID desc) as rank_id ,
NTILE(3) over(order by CUST_ID desc) as logic_group_id
from ORDERS;

select
*
from (
select
*,
rank() over (ORDER BY CUST_ID, SELL_ID DESC) as rank_id,
dense_rank() over (ORDER BY CUST_ID DESC) as dense_rank_id,
NTILE(3) over (ORDER BY CUST_ID DESC) as logic_group_id
from ORDERS
) as t1
group by logic_group_id;

use hr;
/*4.  произведите ранжирование департаментов по средней зарплате.*/
select * 
from (
select d.department_name, avg(e.salary) as avg_salary, 
dense_rank() over(order by avg(e.salary)desc) as dep_rank
from departments as d
inner join employees as e
on d.department_id=e.department_id
group by d.department_name) as T1
where dep_rank < 5;

/*5. Выведите топ-3 сотрудников с наивысшей зарплатой в каждом департаменте.*/
select * from (
select department_id,  first_name, salary,
dense_rank() over(partition by department_id order by salary desc)as sel_rank
from employees) as T1
where sel_rank <= 3
o- <agregate_func(column) OVER (logic group partition <column> order by <column> (asc \ desc))>
select department_id, count(employee_id) as emp_count
from employees
group by department_id;

select
department_id,
count(employee_id) over (partition by department_id) as emp_count
from employees;

-- <agregate_func(column)> OVER (logic group partition <column> order by <column> (asc \ desc))
rder by department_id; 
--