use 310524ptm_Dorves;
-- Tabelle erstellen:
create table Customers  (
customer_id integer not null auto_increment primary key,
first_name varchar(30),
last_name varchar(30),
street_Nr varchar(40),
post_code varchar(10),
city varchar(40),
country varchar(40),
e_mail varchar(40),
registration_date date);
-- Tabelle erstellen:
describe Customers;
Create Table Orders (
customer_id int,
order_creation_date date,
item_id int,
description varchar(100),
link_to_photo varchar(50),
price numeric(8,2)
);
-- Tabelle anschauen:
describe Orders;
-- Daten in Tabelle 'Customers' einfügen:
insert into Customers
(first_name, last_name, street, post_code, city, country, e_mail, registration_date)
values('Nelja', 'Dorves', 'Poststr_13', 'L-32547', 'Musterstadt', 'Musterland', 'coco@mail.de', '2024-06-19'),
('Vasja', 'Pupkin', 'Postweg 12', '55555', 'Muenchen', 'Germany', 'tutu@mail.de', '2024-06-19');
select * from Customers;
-- Daten in Tabelle 'Orders' einfügen:
insert into Orders 
(customer_id, order_creation_date, item_id , link_to_photo, price)
values (1, '2024-06-19', '101', 'www.amazon', 100);
describe Orders;
insert into Customers
(first_name, last_name, street, post_code, city, country, e_mail, registration_date)
values('Alex', 'Simonov', 'Poststr_13', 'L-32547', 'Minden', 'Germany', 'coco@mail.de', '2024-06-17'),
('Ivanna', 'Krock', 'Postweg 12', '81644', 'Muenchen', 'Germany', 'tutu@mail.de', '2024-06-19');
select * from Customers;
insert into Customers
(first_name, last_name, street, post_code, city, country, e_mail, registration_date)
values('Rafael', 'Derksen', 'Schulstr 13', '32325', 'Loehne', 'Germany', 'soro@mail.de', '2024-06-16'),
('Ilona', 'Dick', 'Tuper str. 12', '81645', 'Murnau', 'Germany', 'peti@mail.de', '2024-06-15');

insert into Orders 
(customer_id, order_creation_date, item_id , link_to_photo, price)
values (1, '2024-06-19', '101', 'www.amazon', 100),
(5, '2024-05-25', '15', 'www.amayzon', 11),
(7, '2024-05-25', '23', 'www.amayzon', 20),
(3, '2024-05-25', '11', 'www.amayzon', 12),
(4, '2024-05-25', '25', 'www.amayzon', 120),
(6, '2024-05-25', '15', 'www.amayzon', 110),
(8, '2024-05-25', '5', 'www.amayzon', 121),
(9, '2024-05-25', '2', 'www.amayzon', 140),
(10, '2024-05-25', '125', 'www.amayzon', 20),
(12, '2024-05-25', '2', 'www.amayzon', 10);
/*4.К таблице Customer добавить поле last_modified, которое содержит дату последнего 
изменения данных заказчика. Установить его значение в now.*/
select * from Customers;
alter table Customers
add last_modified timestamp default current_timestamp on update  current_timestamp;

/*Добавить к таблице Order поле discounter_price, которое содержит скидочную 
стоимость заказа. Выставить значение этого поля для всех заказов на 10% меньше, 
чем оригинальная стоимость заказа.
*/
alter table Orders
add discounter_price int default 0;
update Orders
SET discounter_price = price * 0.9;
select * from Orders;
/*Добавить в таблицы тестовые данные: как минимум 3 заказчика по 2-3 заказа у 
каждого.
*/
insert into Orders 
(customer_id, order_creation_date, item_id , link_to_photo, price, discounter_price)
values (13, '2024-06-22', '10', 'www.amazon', 152, price* 0.9),
(14, '2024-05-27', '20', 'www.amayzon', 113, price* 0.9),
(15, '2024-05-26', '22', 'www.amayzon', 10, price* 0.9);

insert into Customers
(first_name, last_name, street, post_code, city, country, e_mail, registration_date)
values('Sofia', 'Didimonov', 'Boststr_13', '32374', 'Porta', 'Germany', 'soco@mail.de', '2024-06-18'),
('Irna', 'Strock', 'Bustweg 12', '81644', 'Hille', 'Germany', 'putu@mail.de', '2024-06-15'),
('Aaron', 'Strock', 'Bustweg 12', '81644', 'Hille', 'Germany', 'putu@mail.de', '2024-06-15'); 
 
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
