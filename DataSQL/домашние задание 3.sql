create table weather (
city varchar(30),
 forecast_date date,
 temperature integer 
 );
 
select * from weather;

insert into weather
(city, forecast_date, temperature)
values ('Берлин', '2023-08-29', '30');
insert into weather
(city, forecast_date, temperature)
values('Minden', '2023-03-13', '15'),
('Pupkin', '2023-09-29', '26'),
('Warschaw', '2023-01-30', '5');
select * from weather;

update weather
set temperature = '26' where city = 'Берлин';
update weather
set city = 'Paris' where temperature > '25';

alter table weather
add column min_temp integer;
update weather
set min_temp = '0';
 