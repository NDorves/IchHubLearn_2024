select str_to_day('2024-07-10', '%Y%m%d') as my_date;
SELECT STR_TO_DATE('2017-03-13T14:39:01.123','%Y-%m-%dT%H:%i:%s.%f') as dttm;
select date_format(NOW(), '%Y%m%d | %H%i%s.%f');
select datediff('','');
select timestampdiff('min','max'); -- differenz
select timestampdiff(month, 'min','max'); -- differenz in vollen monaten/jahren
select timestampdiff(day,'24-07-10 ','24-07-12'); -- differenz
select timestampdiff(minute, '24-07-10 ','24-07-12 11:25:12'); -- differenz in minuten
select timestampdiff(week, '24-07-10 ','24-07-12 11:25:12'); -- differenz in nedeli
select hair_date > now() + interval 1 week;
select hair_date + interval 1 day;
select now() - interval 1 week; -- tekuwee vrenja/minus/interval 1/ nedelja
select now() - interval 1 Month;
select now() - interval 1 year;

select date_add('24-07-10 ',interval 6 month);-- pribavljaet
select date_sub('24-07-10 ',interval 6 month); -- otnimaet
select subdate('24-07-10 ',interval 6 month);  -- otnimaet
select weekday('24-07-10 '); -- poluchaem nomer dnja nedeli
select last_day('24-07-10 '); -- ukaz poslednij den mesjaza
select extract(day from '24-07-10 '); -- iyvlekaem den iz daty
select extract(year from '24-07-10 '); -- iyvlekaem god iz daty
select extract(week from '24-07-10 '); -- iyvlekaem nedelja iz daty
select extract(quarter from '24-07-10 '); -- iyvlekaem kvartal iz daty


select jear(now()) - year('23-04-25 14:15:38');
select timestampdiff(year, '23-04-25 14:15:38', now()); -- poluchaem rayniyu v godach, den royhdenija chel uchityvaja  visokosnost' godaob DR uyhe byl

select *  				-- HAVING
from base64
where __ between __ and -- pervichnyj filtr
group by
order by
having; -- vtorichnyj filtr

/** OT UCHITELJA
select str_to_date('21,2020,07', '%d,%Y,%m') as my_date;


select date_format(now(), '%d-%Y-%m :) %H:%i:%s.%f');

select datediff('2024-07-12', '2023-12-25');


select timestampdiff(MINUTE, '2023-12-25 00:00:00', '2024-07-12 11:25:35');


select now() + INTERVAL 12 DAY;

select now() + INTERVAL 4 HOUR;

select now() - INTERVAL 4 MONTH;

select now() - INTERVAL 2 YEAR;


select date_add('2024-07-12', INTERVAL 6 MONTH);

select date_sub('2024-07-12', INTERVAL 3 DAY);
select subdate('2024-07-12', INTERVAL 1 MONTH);

select weekday('2024-07-12');


select last_day('2024-07-12');

select EXTRACT(QUARTER from '2024-07-12');

select date_column + INTERVAL 1 day
from table;

select year(now()) - year('2003-04-25 14:15:38');

select floor(datediff(NOW(), '2003-04-25 14:15:38') / 365);

select timestampdiff(YEAR, '2003-04-25 14:15:38', now());


SELECT *											-- HAVING
FROM employees
WHERE hire_date > NOW() - INTERVAL 1 YEAR;

select job_id, department_id, count(employee_id) as emp_count
from employees
where department_id between 50 and 90 -- первичный фильтр
group by department_id
having emp_count > 1; -- вторичный фильтр





/* */