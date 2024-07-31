use 310524ptm_Dorves;
create database if not exists Taxi_Dorves;
use Taxi_Dorves;

create table if not exists
feedback (
id int primary key,
feedback_id varchar(10),
rate decimal(1,0)

);

create table if not exists
client (
id int primary key,
first_name varchar(70),
last_name varchar(70),
telefon_Nr varchar(70),
email varchar(70));

create table if not exists
car_park (
id int primary key,
auto_id varchar(50),
model varchar(50),
color varchar(50),
car_class varchar(50),
red_class varchar(50),
reg_number varchar(50),
rade_id int,
foreign key(rade_id) references rade(id)
);

create table if not exists
driver (
id int primary key,
first_name varchar(50),
last_name varchar(50)
);
create table if not exists
rade (
id int primary key,
rade_id varchar(50),
nigth_rade varchar(25),
day_rade varchar(25)
);
create table if not exists
rade_coef (
id int primary key,
coef int(10)
);

create table if not exists
work_shift (
id int primary key,
morning_sh varchar(50),
day_sh varchar(50),
night_sh varchar(50),
tarif varchar(50),
driver_id int,
foreign key(driver_id) references driver(id),
car_id int,
foreign key(auto_id) references car_park(id)

);


create table if not exists
feedback_type (
id int primary key,
feedbackTyp_id int(10),
fedb_type varchar(10)

);

create table if not exists
feedbacktofeedback_type (
primary key(feedback_id,  feedbackTyp_id),
foreign key(feedbackTyp_id)  references feedback_type(id),
foreign key(feedback_id)  references feedback(id));

create table if not exists
TaxiOrders (
id int primary key, 
first_name varchar(70),
last_name varchar(70),
telefon_Nr varchar(70),
email varchar(70),
feedback_id int unique,
foreign key (feedback_id) references feedback(id),
rade_id int,
foreign key(rade_id) references rade(id),
client_id int,
foreign key(client_id) references client(id), 
driver_id int,
foreign key(driver_id) references driver(id)

);