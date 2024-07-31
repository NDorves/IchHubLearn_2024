-- 1.вывести список всех сотрудников. 
-- use hr;
-- SELECT *
-- FROM hr.employees--
-- where employee_id; --
-- 2.Найти поле с зарплатой сотрудника.
-- select * from hr.employees where salary;
-- 3.Используя операторы case/when/end, изменить запрос так, 
-- чтобы результатом был только один столбец, назовите его SALARY_GROUP
-- и оно будет принимать значение 1 если зп сотрудника больше 10000 и значение 0, если меньше.
-- select 	employee_id,
--	case 
--		when salary > 1000 then 1
--		else 0
--	end as SALARY_GROUP 
--	from 
--		employees;
-- 4.Ответить одним предложением: почему выводится только один столбец? otvet->  Потому что в подключении исползован только employee_id. 
-- 5. Изменить запрос, так, чтобы вывелось два столбца: имя сотрудника и новое поле SALARY_GROUP. 
-- select 	employee_id,
-- 		first_name,
--	case 
--		when salary > 1000 then 1
--		else 0
--	end as SALARY_GROUP 
--	from employees;

-- 6. Вывести среднюю зарплату для департаментов с номерами 60, 90 и 100 используя составное условие.
-- SELECT 
-- avg
--	(CASE WHEN department_id in(60, 90, 100)
--	THEN salary 
--	ELSE null 
--	END) as avg_dp60_90_100
-- FROM hr.employees
-- 7. Разделить уровни (level) сотрудников на junior < 10000,10000<mid<15000, 
-- select 	first_name,
--			last_name,
 --       case
--			when salary < 10000 then "Junior"
--			when salary >= 10000 and salary < 15000 then "mid"
--            else "senior"
--		end as level
--	from employees;
-- 8.Посмотреть содержимое таблицы jobs. Написать запрос c использованием оператора case/when/end, 
-- который возвращает 2 столбца: job_id, payer_rank, где столбец payer_rank формируется по правилу: 
-- если максимальная зарплата больше 10000, то “high_payer”, если меньше, то “low payer”. --  
-- select job_id,
--	case
--		when max_salary > 10000 then "high_payer"
--		end as payer_rank 
-- from jobs;
 
-- 9. Переписать этот запрос с использованием оператора IF.
 select * from jobs;
 select job_id,
	IF((max_salary) > 10000, "high_payer", "low_payer") AS payer_rank
 from jobs;
 -- 10. Поменять предыдущий запрос так, чтобы выводилось 3 столбца, 
 -- к двум существующим добавьте max_salary и отсортировать результат по убыванию. 
 
select
    job_id,
    case
        when(max_salary) > 10000 then 'high_payer'
        else 'low_payer'
    end as payer_rank,
    MAX(max_salary) as max_salary
from jobs
group by job_id
order by max_salary desc;
 
