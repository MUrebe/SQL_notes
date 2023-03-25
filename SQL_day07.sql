/*
student_info adında bir table oluşturunuz.
student_id(PRIMARY KEY), student_name(UNIQUE), student_age(NOT NULL) ve student_dob adında sütunlar oluşturunuz.
Sütunlara uygun data tipleri ve belirtilen constraint'leri atayınız.
student_age sütunu 0-20 arası dışında değer alamaz.
student_name sütunu küçük harf karakter alamaz.
*/


create table student_info(
student_id smallint primary key,
student_name varchar(20) unique,
student_age smallint not null,
student_dob date,	
constraint student_age_check check(student_age between 0 and 20),	
constraint student_name_upper_case check(student_name = upper(student_name))
);

insert into student_info values(101,'ALI CAN',15,'12.06.2007');

select * from student_info;

insert into student_info values(102,'VELI HAN',19,'5.Aug.04');
insert into student_info values(103,'AYSE TAN',16,'Sep.3.06');
INSERT INTO student_info VALUES(104, 'KEMAL KUZU', 15, null);
INSERT INTO student_info VALUES('105', 'TOM HANKS', 20, '12-Sep-2003');
INSERT INTO student_info VALUES('106', 'ANGELINA ', 10, '12-Sep-2013');
INSERT INTO student_info VALUES('107', 'BRAD PITT', 0, '10-Aug-2021');

--Spesifik iki sütuna veri giriniz:
insert into student_info(student_id , student_age) values(108,17);
insert into student_info(student_id , student_age,student_name) values(109,17,'JOHN WALK');

--student_id değeri 108 olan satırın student_name değerini 'LEO OCEAN' olarak güncelleyin.
update student_info set student_name = 'LEO OCEAN' where student_id = 108;

select * from student_info;

--John Walker, dob sütununu to 11-Dec-1997 değerine değiştirin.
update student_info set student_dob = '11.Dec.1997' where student_name = 'JOHN WALKER';

--105 id'li dob hücresini 11-Apr-1996 değerine ve name hücresini  TOM HANKS değerine güncelle.
UPDATE student_info SET student_dob='11.Apr.1996', student_name='MARK TWAIN' WHERE student_id=105;


--Tüm age değerlerini en yüksek age değerine güncelleyin.
update student_info set student_age = (select max(student_age) from student_info)


--Tüm student_dob değerlerini en düşük student_dob değerine güncelleyin.
update student_info set student_dob = (select min(student_dob) from student_info)


CREATE TABLE workers
(
worker_id SMALLINT,
worker_name VARCHAR(50),
worker_salary SMALLINT,
CONSTRAINT worker_id_pk PRIMARY KEY(worker_id)
);

INSERT INTO workers VALUES(101, 'Ali Can', 12000);
INSERT INTO workers VALUES(102, 'Veli Han', 2000);
INSERT INTO workers VALUES(103, 'Ayse Kan', 7000);
INSERT INTO workers VALUES(104, 'Angie Ocean', 8500);

select * from workers;

--Veli Han'ın salary değerini en yüksek salary değerinin %20 düşüğüne yükseltin.
update workers set worker_salary =  (select max(worker_salary)*0.8 from workers)
where worker_name = 'Veli Han';

(ÖDEV)--Ali Can'ın salary değerini en düşük salary değerinin %30 fazlasına düşürün.


--Ortalama salary değerinden düşük olan salary değerlerini 1000 artırın.
update workers set worker_salary = worker_salary+1000
where worker_salary < (select avg(worker_salary) from workers);


Ödev: --Ortalama salary değerinden düşük salary değerlerine ortalama salary değeri atayın.


CREATE TABLE people
(
ssn INT,
name VARCHAR(50),
address VARCHAR(80)
);
INSERT INTO people VALUES(123456789, 'Mark Star', 'Florida');
INSERT INTO people VALUES(234567890, 'Angie Way', 'Virginia');
INSERT INTO people VALUES(345678901, 'Maryy Tien', 'New Jersey');
INSERT INTO people(ssn, address) VALUES(456789012, 'Michigan');
INSERT INTO people(ssn, address) VALUES(567890123, 'California');
INSERT INTO people(ssn, name) VALUES(567890123, 'California');

select * from people;

--null name değerlerini "To be inserted later" değerine güncelleyin.
update people set name = 'To be inserted later' 
where name is null;


--null address değerlerini "To be inserted later" değerine güncelleyin.
update people set address = 'To be inserted later' where address is null;


--İsimsiz recordları silin.
delete from people where name = 'To be inserted later';


--ssn değeri 123456789'dan büyük ve 345678901'den küçük olan recorları sil.
delete from people where ssn between 123456789 and 345678901;


--name değeri NULL olmayan tüm recordları silin.
delete from people where name is not null;


--address değeri NULL olmayan tüm recordları silin.
delete from people where address is not null;


--address değeri Michigan olmayan recordları siliniz.
delete from people where address <> 'Michigan';


CREATE TABLE workers
(
    id SMALLINT,
    name VARCHAR(50),
    salary SMALLINT,
    CONSTRAINT id4_pk PRIMARY KEY(id)
);
INSERT INTO workers VALUES(10001, 'Ali Can', 12000);
INSERT INTO workers VALUES(10002, 'Veli Han', 2000);
INSERT INTO workers VALUES(10003, 'Mary Star', 7000);
INSERT INTO workers VALUES(10004, 'Angie Ocean', 8500);
INSERT INTO workers VALUES(10005, 'Angie Ocean', null);


select * from workers;

--En düşük ve en büyük salary değerlerine sahip recordları çağırın.
select * from workers where salary in((select min(salary) from workers) , (select max(salary) from workers));

--En düşük salary değerini bulun.
select min(salary) as min_salary from workers;

--Record sayısını(adetini) bulun.
select count(salary) as satir_sayisi from workers;

delete from workers where salary is null;

--Interview Question: En yüksek ikinci salary değerini çağırın.
select salary from workers order by salary desc offset 1 limit 1 ;	

CREATE TABLE employees
(
  id CHAR(9),
  name VARCHAR(50),
  state VARCHAR(50),
  salary SMALLINT,
  company VARCHAR(20)
);
INSERT INTO employees VALUES(123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO employees VALUES(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO employees VALUES(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO employees VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO employees VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT');
INSERT INTO employees VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO employees VALUES(123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM');
SELECT * FROM employees;
CREATE TABLE companies
(
  company_id CHAR(9),
  company VARCHAR(20),
  number_of_employees SMALLINT
);
INSERT INTO companies VALUES(100, 'IBM', 12000);
INSERT INTO companies VALUES(101, 'GOOGLE', 18000);
INSERT INTO companies VALUES(102, 'MICROSOFT', 10000);
INSERT INTO companies VALUES(103, 'APPLE', 21000);
SELECT * FROM companies , employees;


--number_of_employees değeri 15000'den büyük olan name ve company değerlerini çağırın.
select name , company from employees
where company in('GOOGLE','APPLE')

select company from companies where number_of_employees > 15000