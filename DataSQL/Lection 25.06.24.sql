use   ;
/*select first_name
from hr.employees
union all 			-- Zeilen verbinden mit doublage.
select last_name
from hr.employees;*/

create table goods2 ( 			-- Tabelle erstellung
id Int primary key,				-- zeilen erstellung
title varchar(30),			-- varchar - begrenzt anzal zeilen im text
quantity int check (quantity >0),	-- Zahlen diffenieren
in_stock char(1) check (In_stock IN ('y', 'n')) 
);

select * from goods2;
describe goods2;
show create table goods2;
insert into goods2 (
id, 
title,
quantity,
in_stock)
values (30, `pen`, 45, `y`);

select * from goods2;

insert into goods2 (`id`,
			 `title`, `quantity`, `in_stock`) 
     values (30, 'Pensil', 50, 'Y');
     
insert into goods2 (`id`,
			 `title`, `quantity`, `in_stock`) 
     values (31, 'Pensil123456789012345678901234567890', 50, 'Y');
     
insert into goods2 (`id`,
			 `title`, `quantity`, `in_stock`) 
     values (31, 'Pensil', -50, 'Y');
            
insert into goods2 (`id`,
			 `title`,`quantity`, `in_stock`) 
     values (31, 'Pensil', 50, 'X');
     
show create table goods2;

alter table goods2
drop constraint `goods2_chk_1`;     

-- create table table1 as
/*select first_name
from hr.employees
union all 			
select last_name
from hr.employees;
alter table goods2
add price int default 0;
select * from goods2; */
alter table goods2
add prise int default 0;

insert into goods2 (
id, 
title,
quantity,
in_stock,
price)

values (32, 'book', 60, 'y', 150), -- Eintrag daten in spalten
(33, 'folder', 70, 'y', 20),
(34, 'paper', 75, 'y', 150),
(35, 'magazine', 80, 'y', 92),
(36, 'notebook', 85, 'y', 73),
(37, 'book', 60, 'y', 150);

select name from goods
union all					-- ob'edinenie stolbzow name & title
select title from goods2;

select * from goods;
insert into goods2 (
good_id, 
title,
quantity,
in_stock,
prise)
values (38, 'Велосипед', 20, 'y', 200);
select name from goods
union 
select title from goods2;
select id, name, quantity, in_stock, null as prise
from goods
union all
select * from goods2;

delete from goods2 where id = 1;



