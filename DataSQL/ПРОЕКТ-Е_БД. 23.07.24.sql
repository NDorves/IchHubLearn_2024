/*Проектирование базы данных
 это итеративный процесс, который  начинается с 
понимания доменной области, данные о которой 
нужно хранить. Он включает в себя работу различных 
специалистов, таких как доменные эксперты, 
специалисты по продукту, инженеры и специалисты 
по базам данных.*/
/*Один к одному (1:1)  Сущности Паспорт и Человек. У одного человека связан с одним паспортом и один
 паспорт связан с одним человеком. Не может у человека быть больше одного
 паспорта и один паспорт не может принадлежать нескольким людям.*/
 -- Создание таблицы "Человек"
CREATE TABLE IF NOT EXISTS Person (  -- ODERR (CREATE TABLE)
 id INT PRIMARY KEY,
 first_name VARCHAR(255),
 last_name VARCHAR(255),  -- Другие поля человека могут быть добавлены по необходимости
 );
 
 -- Создание таблицы "Паспорт"
CREATE TABLE IF NOT EXISTS Passport (
 id INT PRIMARY KEY,
 passport_number VARCHAR(20),
 issued_by VARCHAR(255),
 issue_year INT,
 user_id INT UNIQUE,
 FOREIGN KEY (user_id) REFERENCES Person(id)– user_id в таблице Passport
 ссылается на id в таблице Person.-- Другие поля паспорта могут быть добавлены по необходимости
 );


/*Один ко многим (1:M)  Примером в данном случае может являться Класс и Ученик. Ученик может быть
 только в одном классе, однако в одном классе может быть множество учеников.
 Еще одним примером отношения "один ко многим" может быть связь между
 Компанией и Сотрудниками. Допустим, у вас есть компания, и каждый сотрудник
 этой компании привязан к определенной компании. Однако у одной компании может
 быть много сотрудников.*/
 
 -- Создание таблицы "Teacher"
 CREATE TABLE IF NOT EXISTS Teacher (
 id INT PRIMARY KEY,
 first_name VARCHAR(255),
 last_name VARCHAR(255)-- Другие поля учителя могут быть добавлены по необходимости
 );
 
 -- Создание таблицы "Class"
CREATE TABLE IF NOT EXISTS Class (
 id INT PRIMARY KEY,
class_number VARCHAR(10),
 teacher_id INT,
 FOREIGN KEY (teacher_id) REFERENCES Teacher(id)-- Другие поля класса могут быть добавлены по необходимости
 );
 
 -- Создание таблицы "Student"
 CREATE TABLE IF NOT EXISTS  Student (
 id INT PRIMARY KEY, -- число, первичный ключ
 first_name VARCHAR(255), -- Буквы
 last_name VARCHAR(255), -- Буквы
 class_id INT, -- число
 FOREIGN KEY (class_id) REFERENCES Class(id)-- Вторичный ключ. Другие поля ученика могут быть добавлены по необходимости
 );
 
 

/*Много ко многим (M:M)  Примером в данном случае может являться Магазин и Покупатель. Покупатель
 может ходить в несколько магазинов, а в магазин могут ходить сразу несколько
 покупателей*/
 
 -- Создание таблицы "Stores"
CREATE TABLE IF NOT EXISTS Stores (
 id INT PRIMARY KEY, -- число, первичный ключ
 address VARCHAR(255),
 name VARCHAR(255)-- Другие поля магазина могут быть добавлены по необходимости
 );
 
 -- Создание таблицы "Customers"
CREATE TABLE IF NOT EXISTS Customers (
 id INT PRIMARY KEY,
 first_name VARCHAR(255), -- текст
 last_name VARCHAR(255)-- Другие поля магазина могут быть добавлены по необходимости
 );
 
 -- Создание таблицы связи "StoreCustomerRelation"
CREATE TABLE IF NOT EXISTS StoreCustomerRelation ( -- промежуточная таблица Stores(id) и 
 store_id INT,
 customer_id INT,
 PRIMARY KEY (store_id, customer_id),
 FOREIGN KEY (store_id) REFERENCES Stores(id),
 FOREIGN KEY (customer_id) REFERENCES Customers(id)
 );
 
-- PRAKTIKA --

/*Используя любой удобный редактор,например Jamboard, построить ER-диаграмму службы такси и обозначить типы связей между ними..*/

 
 