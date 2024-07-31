use Students;
use hr;
/*1.Подключитесь к базе данных Students (которая находится на удаленном сервере).
 
2. Найдите самого старшего студента*/
select first_name, max(age) as Student_max_age
from Students;
/*3. Найдите самого старшего преподавателя*/
select name, max(age) as Teacher_max_age
from Teachers;

/* 4.Выведите список преподавателей с количеством компетенций у каждого*/
select T.name, TC.competencies_id
from Teachers as T
join Teachers2Competencies as TC
on T.id = TC.teacher_id;

/* 5. Выведите список курсов с количеством студентов в каждом*/
select c.title, S.student_id
from Courses as c
inner join Students2Courses as S
on S.course_id = c.id;

/*Выведите список студентов, с количеством Courses, посещаемых каждым студентом.*/
select s.first_name, s.last_name, count(sc.course_id)
from Students as s
inner join Students2Courses as sc
on s.id = sc.student_id
group by s.first_name;

