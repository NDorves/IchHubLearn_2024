-- Задание 1.
use hr;
select * from hr.employees where job_id = 'IT_PROG';

-- Задание 2.

use hr;
select * from hr.jobs where job_id = 'AD_VP';

-- Задание 3.

use hr;
SELECT * from hr.employees where job_id = 'IT_PROG';
SELECT * from hr.employees where job_id = 'AD_VP';

-- Задание 4.
use hr;
select * from employees where last_name = '%_a';

--  Задание 5. 
use hr;
select * from employees where salary > 10000;
-- Задание 6.
use hr;
select * from employees where salary > 10000 and last_name like 'L_%';

/* Задание 7.
Покажет всю таблицу с зарплатами от минимальной до максимальной.
-- * select *  from employees where salary > 10000 or salary <= 10000;
= all 
Задание 8.
Будет отличаться тем, что покажет все зарплаты, кроме тех что равны 10000
-- select *  from employees where salary > 10000 or salary < 10000;
Задание 9.
Покажет всю таблицу  с зарплатами меньше 5000 и выше 10000 .
select *  from employees where salary > 10000 and salary < 5000;*/






