create table students(
id smallint, 
isim varchar(20),
adres varchar(80),
note smallint	
);

select * from students;

insert into  students values(120,'Ali Can','Ankara','65');
insert into  students values(121,'Veli Han','Trabzon','75');
insert into  students values(122,'Ahmet','Istanbul','90');
insert into  students values(123,'Mary Star','Izmir',85);
insert into  students values(124,'Terry Star','Ankara',95);
insert into  students values(125,'Harry Otar','Bursa',70);
insert into  students values(126,'Sally Young','Van',100);

--soru 1 : students tablosundaki id ve isim sutunlarini cagiriniz
select id,isim from students;

--soru 2 : notu 85 uzeri olanlarin tum bilgilerini cagiriniz
select * from students 
where note>85;

--soru 3 : adresi ankara olan ogrencilerin ismini cagiriniz
select isim from students
where adres='Ankara';

--soru 4 : olan ogrencilerin cagiriniz
select isim from students
where note>85 and adres='Ankara';

select adres from students 
where id<122 or id>125;

select adres from students 
where id not between 122 and 125;

delete from students;

delete from students 
where adres='Bursa';

delete from students 
where isim = 'Ali Can' or isim = 'Veli Han';

delete from students
where isim in('Ali Can','Veli Han');

select * from students;


