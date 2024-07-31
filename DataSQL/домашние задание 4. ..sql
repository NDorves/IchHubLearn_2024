/*домашние задание 4
1. Вывести все заказы, отсортированные по убыванию по стоимости*/
select * from Orders
order by discounter_price DESC;

/*2. Вывести всех заказчиков, у которых почта зарегистриварована на mail.de*/
select * from Customers 
where e_mail like'mail.ko';

/*3. Вывести заказы, добавив дополнительный вычисляемый столбец status, 
который вычисляется по стоимости заказа и имеет три значения: low, middle, high.*/
select * , 
case
when discounter_price < 100 then 'low'
when discounter_price = 100 <= 500 then 'middle'
else 'high'
end as status 
from Orders;

/*4. Вывести заказчиков по убыванию рейтинга.*/
select * from Orders
order by status DESC;

/*5. Вывести всех заказчиков из города на ваш выбор. "Hille" */
select * from Customers
where city = 'Hille'

/*6. Написать запрос, который вернет самый часто продаваемый товар.*/

SELECT description, COUNT(*) as item_id
FROM Orders
GROUP BY description,
ORDER BY item_id DESC
LIMIT 1;


/*7. Вывести список заказов с максимальной скидкой*/
SELECT *, 
(price - discounter_price) as discounter_price
FROM Orders
ORDER BY discounter_price DESC;
select * from Orders;
/*8. Ответьте в 1 предложении: как вы определите скидку? 
 differenz between price and discounter_price */
 
 /*9. Ответьте в 1 предложении: может ли это быть разница между нормальной ценой и скидочной ценой? 
 Ответ: да.*/
 
 /*10 Написать запрос, который выведет все заказы с дополнительным столбцом 
 процент_скидки, который содержит разницу в процентах между нормальной и скидочной ценой?*/
 
SELECT *, 
((price - discounter_price) / price) * 100 
as 'процент_скидки'
FROM Orders;
