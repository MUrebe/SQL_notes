

--INTERSECT: iki sorgu ifadesinin kesisim degerini verir.
--EXCEPT:ILK SORGUDA OLUP IKINCI SORGUDA OLMAYAN DEGERLERI BIZE VERIR

CREATE TABLE isciler 
(
	isim VARCHAR(20), 
	sehir VARCHAR(20), 
	maas int, 
	sirket VARCHAR(20)
);
   
INSERT INTO isciler VALUES('Ahmet Yorgun', 'Istanbul', 6500, 'Honda');
INSERT INTO isciler VALUES('Vural Solgun', 'Istanbul', 5500, 'Toyota');
INSERT INTO isciler VALUES('Murat Oz', 'Ankara', 4500, 'Honda'); 
INSERT INTO isciler VALUES('Murat Oz', 'Istanbul', 4500, 'Honda'); 
INSERT INTO isciler VALUES('Murat Oz', 'Izmir', 7000, 'Ford');
INSERT INTO isciler VALUES('Vural Solgun', 'Ankara', 5500, 'Ford');
INSERT INTO isciler VALUES('Harun Sarsılmaz','Bursa', 5200, 'Honda');

/* -----------------------------------------------------------------------------
 -- SORU1: isim'i 'Murat Oz' olanlarin isim'lerini, sehir'lerini ve
 -- sehir'i 'Istanbul' olmayanların isim'lerini sehir'lerini bulup  
    iki sorgunun kesisimini listeleyiniz 
------------------------------------------------------------------------------*/

select isim , sehir from isciler where isim = 'Murat Oz' 
intersect
select isim , sehir from isciler where sehir != 'Istanbul';


/* -----------------------------------------------------------------------------
 -- SORU2: isim'i 'Murat Oz' olanlarin isim'lerini, sehir'lerini ve
 -- sehir'i 'Istanbul' olmayanların isim'lerini sehir'lerini bulup  
    ilk sorguda olup ikinci sorguda olmayan degerleri listeleyiniz 
------------------------------------------------------------------------------*/
select isim , sehir from isciler where isim = 'Murat Oz' 
except
select isim , sehir from isciler where sehir != 'Istanbul';


/*=====================================EXISTS============================================================

 

Subquery'lerde kullanılır. Mevcut ise getir anlamında kullanılır.

EXISTS veya NOT EXISTS ifadeleri de alt sorgudan getirilen degerlerin içerisinde bir degerin
olması veya olmaması durumunda işlem yapılmasını saglar

========================================================================================================*/


CREATE TABLE mart
(   
urun_id int,    
musteri_isim varchar(50), 
urun_isim varchar(50)
);
INSERT INTO mart VALUES (10, 'Mark', 'Honda');
INSERT INTO mart VALUES (20, 'John', 'Toyota');
INSERT INTO mart VALUES (30, 'Amy', 'Ford');
INSERT INTO mart VALUES (40, 'John', 'Hyundai');


CREATE TABLE nisan 
(   
urun_id int ,
musteri_isim varchar(50), 
urun_isim varchar(50)
);
INSERT INTO nisan VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan VALUES (50, 'Yasar', 'Volvo');

select * from mart

/*
--MART ve NİSAN aylarında aynı urun_id ile satılan ürünlerin urun_id'lerini
  ve aynı zamanda bu ürünleri MART ayında alan musteri_isim 'lerini listeleyen bir sorgu yazınız. 
*/

select urun_id , musteri_isim from mart 
where exists ( select urun_id from nisan where mart.urun_id = nisan.urun_id ); 

/*
--MART ve NİSAN aylarında aynı urun_isim'i ile satılan ürünlerin urun_isim'lerini                  
ve aynı zamanda bu ürünleri NİSAN ayında alan musteri_isim'lerini listeleyen bir sorgu yazınız.
*/

select urun_isim , musteri_isim from nisan
where exists ( select urun_isim from mart where nisan.urun_isim = mart.urun_isim);


/*========================================= JOIN İSLEMLERİ ===================================================
 
  
    Join islemleri: iki tabloyu birlestirmek için kullanılır.

    3 Cesit Join islemi kullanilabilmektedir.
    
    1) INNER JOIN: Tablolardaki ortak olan verileri listeler.
    2) LEFT JOIN:  ilk tabloda olan tum verileri listeler.
    3) RIGHT JOIN: ikinci tabloda olan tum verileri listeler.

       FULL JOIN: her iki tablodaki verilerin tamamını listeler (Left Join + Union + Right Join)

 	Syntax
    -----------
    SELECT sutun1,sutun2... FROM tablo1_adi    
           
    ....JOIN tablo2_adi 
        
    ON tablo1_adi.ortak_sutun = tablo2_adi.ortak_sutun;

===================================================================================================================*/   

create table qa_dersler
(
ders_id int,
ders_ismi varchar(30),
ders_saati varchar(30)
);

insert into qa_dersler values (101, 'Core Java', 40);
insert into qa_dersler values (102, 'Selenium', 30);
insert into qa_dersler values (103, 'API', 15);
insert into qa_dersler values (104, 'SQL', 10);
insert into qa_dersler values (105, 'SDLC', 10);
insert into qa_dersler values (106, 'LAMDA', 12);

select * from qa_dersler


create table developer_dersler
(
ders_id int,
ders_ismi varchar(30),
ders_saati varchar(30)
);

insert into developer_dersler values (101, 'Core Java', 40);
insert into developer_dersler values (103, 'API', 15);
insert into developer_dersler values (104, 'SQL', 10);
insert into developer_dersler values (105, 'SDLC', 10);
insert into developer_dersler values (106, 'LAMDA', 12);
insert into developer_dersler values (107, 'Spring Framework', 20);
insert into developer_dersler values (108, 'Micro Services', 12);

select A.ders_id , A.ders_ismi , A.ders_saati from qa_dersler as A
left join developer_dersler as B
on A.ders_id = B.ders_id


select A.ders_id , A.ders_ismi , A.ders_saati from qa_dersler as A
right join developer_dersler as B
on A.ders_id = B.ders_id

--SORU2: join kullanarak developer_dersler'ini listeleyiniz
select A.ders_id , A.ders_ismi , A.ders_saati from developer_dersler as A 
left join qa_dersler as B 
on A.ders_id = B.ders_id

--SORU3: join kullanarak ortak dersleri listeleyiniz 
select A.ders_id , A.ders_ismi , A.ders_saati from qa_dersler as A
inner join developer_dersler as B
on A.ders_id = B.ders_id


--SORU4: join kullanarak qa_dersleri ve developer_dersleri tablosundaki verilerin tamamını listeleyiniz
select A.ders_id , A.ders_ismi , A.ders_saati from qa_dersler as A
left join developer_dersler as B
on A.ders_id = B.ders_id

union

select B.ders_id , B.ders_ismi , B.ders_saati from qa_dersler as A
right join developer_dersler as B
on A.ders_id = B.ders_id

create table filmler
(film_id int,
film_name varchar(30),
category varchar(30)
);

insert into filmler values (100, 'Eyvah Eyvah', 'Komedi');
insert into filmler values (200, 'Kurtlar Vadisi', 'Aksiyon');
insert into filmler values (300, 'Eltilerin Savasi', 'Komedi');
insert into filmler values (400, 'Aile Arasinda', 'Komedi');
insert into filmler values (500, 'GORA', 'Bilim Kurgu');
insert into filmler values (600, 'Organize Isler', 'Komedi');
insert into filmler values (700, 'Babam ve Oglum', 'Dram');

select * from filmler

create table aktorler
(id int,
actor_name varchar(30),
film_id int
);

insert into aktorler values (1, 'Ata Demirer', 100);
insert into aktorler values (2, 'Necati Sasmaz', 200);
insert into aktorler values (3, 'Gupse Ozay', 300);
insert into aktorler values (4, 'Engin Gunaydin', 400);
insert into aktorler values (5, 'Cem Yilmaz', 500);

-- SORU1: Tüm film_name'leri, tüm category'lerini ve filmlerde oynayan actor_name'leri listeleyiniz.
select A.film_name , A.category , B.actor_name from filmler as A
left join aktorler as B
on A.film_id = B.film_id	

-- SORU2: Tüm actor_name'leri ve film_name'lerini listeleyiniz.
select A.film_name , B.actor_name from filmler as A
left join aktorler as B
on A.film_id = B.film_id