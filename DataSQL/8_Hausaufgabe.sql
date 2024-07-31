-- Подключитесь к базе данных Students (которая находится на удаленном сервере). 
use Students;

-- Найдите самого старшего студента
select first_name, age
from Students
order by age DESC limit 1;

-- Найдите самого старшего преподавателя
select name, age 
from Teachers
order by age DESC limit 1;

-- Выведите список преподавателей с количеством компетенций у каждого
select T.name, count(TC.competencies_id) as Amount_of_competencies
from Teachers as T
left join Teachers2Competencies as TC
on T.id = TC.teacher_id
group by T.name;


-- Выведите список курсов с количеством студентов в каждом
select 
    c.title as material,
    count(s.id) as count_students
from Students2Courses sc
left join Students s 
    on sc.student_id = s.id 
LEFT join Courses c 
    on sc.course_id = c.id
GROUP by c.title;

-- Выведите список студентов, с количеством курсов, посещаемых каждым студентом. 
-- select S.first_name, count(SC.course.id)
-- from Students as S
-- left join Students2Courses as SC
-- on S.id = SC.Students.id;

select S.first_name, COUNT(SC.course_id) as course_count
from Students as S
left join Students2Courses AS SC 
on S.id = SC.student_id
group by S.first_name;