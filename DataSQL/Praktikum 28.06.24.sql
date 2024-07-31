use shop;
/* ZD 1.Выведите имена всех продавцов. Предусмотрите также в выборке имена их боссов, 
сформировав атрибут boss_name.
 В выборке должно присутствовать два атрибута — sname, boss_name.*/
select p.name, b.name as boss_name
from SELLERS as p
left join SELLERS as b
on p.boss_id=b.sell_id;
/*select p.SNAME, b.SNAME as boss_name
from SELLERS p
left join SELLERS b 
on p.BOSS_ID=b.SELL_ID ;*/
/*2. Выведите имена покупателей, которые совершили покупку 
на сумму больше 1000 условных единиц. В выборке должно присутствовать
 два атрибута — cname, amt.*/ 
select 
c.cname,
o.amt
from CUSTOMERS c
inner join ORDERS o
on c.CUST_ID=o.CUST_ID
WHERE o.AMT> 1000;
-- select * from orders;
/*2. Выведите имена покупателей, которые сделали заказ.
Предусмотрите в выборке также имена продавцов.
Примечание: покупатели и продавцы должны быть из разных городов.
В выборке должно присутствовать два атрибута — cname, sname.*/
select CS.CNAME, S.SNAME , 
CS.CITY, S.CITY
from CUSTOMERS as CS
inner join ORDERS as O
on CS.CUST_ID= O.CUST_ID
inner join SELLERS as S
on S.SELL_ID= O.SELL_ID
where S.city <> CS.CITY ;

/*3. Напишите запрос, который вернет выборку full join, используя таблицы 
CUSTOMERS и ORDERS (по ключу CUST_ID). В выборке должно присутствовать 
два атрибута — cname, order_id.*/

select CS.cname, O.order_ID
from CUSTOMERS as CS
left join ORDERS as O
on CS.CUST_ID=O.CUST_ID
union 
select CS.cname, O.order_ID
from CUSTOMERS as CS
right join ORDERS as O
on CS.CUST_ID=O.CUST_ID;
/*4.Для каждого сотрудника выведите разницу между комиссионными его
 босса и его собственными. Если у сотрудника босса нет, выведите NULL.
Вывести : sname, difference. */
select sp.sname,
sb.comm - sp.comm as difference
from SELLERS as sp
left join SELLERS as sb
on sp.BOSS_ID=sb.SELL_ID;
select * from SELLERS;

/*5.Выведите пары покупателей и обслуживших их продавцов из одного города.
Вывести: sname, cname, city */
select sname, cname, c.city
from CUSTOMERS as c
join ORDERS as o
on c.CUST_ID=o.CUST_ID
join SELLERS as s
on o.SELL_id =s.SELL_id

