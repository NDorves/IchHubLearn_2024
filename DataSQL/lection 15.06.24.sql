create table goods2 (
good_id int primary key,
title varchar(30),
quantity int check (quantity > 0),
in_stock char(1) check (in_stock in ('y', 'n'))

);
select * from goods2;
describe goods2;
show create table goods2; 

insert into goods2  -- 
( good_id, title, quantity, in_stock)
values (30, 'Buch', 10, 'y');
select * from goods2;

insert into goods2 
(good_id, title, quantity, in_stock)
values (30, 'Buch', 20, 'y');

insert into goods2 
(good_id, title, quantity, in_stock)
values (31, 'Buchbababababababbabucskskskskskskskskskh', 20, 'y'); /* comment .....hhhh*/

insert into goods2 
(good_id, title, quantity, in_stock)
values (31, 'Buch', -20, 'y');

insert into goods2 
(good_id, title, quantity, in_stock)
values (31, 'Buch', 20, 'x');

insert into goods2 
(good_id, title, quantity, in_stock)
values (30, 'Buch', 20, 'y');

Alter table goods2 drop CONSTRAINT `goods2_chk_1`
/* select first_name
from hr.employees
union all 						-- ob'edinenie!
select last_name
from hr.employees;*/

alter table goods2 
add prise int default null
select * from goods2;




 
 

