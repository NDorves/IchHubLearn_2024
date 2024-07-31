use 310524ptm_Dorves;
/* 4. Далее работаем на локальном сервере. Создать новую таблицу citizen, которая содержит 
 следующие поля: уникальное автоинкрементное, номер соц страхования, имя, фамилию и емейл. */
create table citizen (
id int unique auto_increment,
SOC_security_number varchar(30), 
first_name varchar(30), 
last_name varchar (30), 
e_mail varchar (30));
describe citizen;
/*5. На вашем локальном сервере в любой базе создать таблицу
 без ограничений (любую, можно взять с урока).  */
 
 create table probe (
id int,
last_name varchar(20),
first_name varchar (20), 
name_id varchar(20),
quantity int,
price int,
discount int, 
bought int, 
sold int);
describe testtable;
select * from probe;
insert into probe (
id, 
last_name, 
first_name, 
name_id, 
quantity, 
price, 
discount,
 bought, 
 sold)
 values (1, 'Alena', 'Apina', 'croks', '20', '19.90', '0.9', '100', '15'),
 (2, 'Alla', 'Rapina', 'croks', '30', '19.90', '0.9', '100', '10'),
 (3, 'Irena', 'Lapina', 'croks', '10', '19.90', '0.9', '100', '1'),
 (1, 'alena', 'Apina', 'croks', '20', '19.90', '0.9', '100', '15');
 describe probe;
  /*6. Добавить в таблицу 5 значений. Добавить 3 человека с одинаковыми именами и 2 человека без lastname*/
 
 insert into probe (
id, 
last_name, 
first_name, 
name_id, 
quantity, 
price, 
discount,
 bought, 
 sold)
 values (1, 'Alena', 'Apina', 'croks', '20', '19.90', '0.9', '100', '15'),
 (2, 'Alla', '', 'croks', '30', '19.90', '0.9', '100', '10'),
 (3, 'Irena', '', 'croks', '10', '19.90', '0.9', '100', '1');
 select * from probe;
/*7. Использовать оператор alter table … modify , 
чтобы добавить ограничение not null на поле firstname и lastname. */
alter table probe
modify first_name  varchar(20) not null,
modify last_name  varchar(20) not null;

/*8. Добавить ограничение unique для пары firstname\ lastname */
alter table probe
 add constraint uniq_name unique(last_name, first_name);
 /*9. Удалить таблицу из базы и пересоздать ее, 
 модифицировав запрос add table так, 
 чтобы он учитывал ограничения (см примеры из класса).*/
 drop table if exists probe;
 create table probe (
id int,
last_name varchar(20)unique not null,
first_name varchar (20)unique not null, 
name_id varchar(20),
quantity int,
price int,
discount int, 
bought int, 
sold int);
/*10. Добавить правильные и неправильные данные (нарушающие и не нарушающие ограничения). */
insert into probe (
id, 
last_name, 
first_name, 
name_id, 
quantity, 
price, 
discount,
 bought, 
 sold)
 values (1, 'Alena', 'Apina', 'croks', '20', '19.90', '0.9', '100', '15'),
 (2, 'Alla', 'Rapina', 'croks', '30', '19.90', '0.9', '100', '10'),
 (3, 'Irena', 'Lapina', 'croks', '10', '19.90', '0.9', '100', '1'),
 (1, 'Alena', 'Apina', 'croks', '20', '19.90', '0.9', '100', '15'),
 (1, 'Alena', 'Apina', 'croks', '20', '19.90', '0.9', '100', '15'),
 (2, 'Alla', '', 'croks', '30', '19.90', '0.9', '100', '10'),
 (3, 'Irena', '', 'croks', '10', '19.90', '0.9', '100', '1');
