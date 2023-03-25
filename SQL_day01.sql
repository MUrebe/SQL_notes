/*
  SQL KOMUTLARI GRUPLARA AYRILIR :

  1.(Data Definition Language - DDL) Veri Tanimlama Dili
  CREATE: Tablo oluşturur.
  DROP: Tabloyu siler.
  ALTER: Tabloyu günceller.
  
  2.(Data Manipulation Language - DML) Veri Kullanma Dili
  INSERT:Tabloya veri ekler
  DELETE:Tablodaki verileri siler
  UPDATE:Tablodaki verileri günceller

  3.(Data Query Language - DQL) Veri Sorgulama Dili
  SELECT: Tablodaki verileri listeler. 
*/

--talebeler isminde bir tablo olusturalim


create table talebeler(
ogrenci_tc char(11),
ogrenci_isim varchar(20),
not_ortalamasi real,
kayit_tarihi date	
);

select * from talebeler;

insert 	into talebeler values('12345678901','Ahmet',95.2,'2020-02-14');
insert 	into talebeler values('12345678932','Mehhmet',92.6,'2021-05-16');
insert 	into talebeler values('12345678953','Kemal',90.9,'2022-02-27');

select * from talebeler;


drop table talebeler;


create table ogretmenler(
ogretmen_ismi varchar(15),
bransi varchar(25),
mezuniyet_derecesi varchar(20),
telefon_numarasi char(11),
maas int 
);

insert into ogretmenler values('Ali','Matematik','Lisans','12345678901',15000);
insert into ogretmenler values('Mustafa','Yazilim','Senior','05433152835',540000);
insert into ogretmenler values('Erdem','Edebiyat','Lisans','21452363474',13000);
insert into ogretmenler values('Hasim','Tarih','Yuksek Lisans','12325368901',20000);

insert into ogretmenler values('Kubra','Felsefe','Lisans','12325548901',30000);

insert into ogretmenler values('Burak','Ingilizce','Yuksek Lisans','123853059012',35000);


select * from ogretmenler;

drop table ogretmenler;

/*=====================================SELECT=======================================================


select * from tablo_adi ==> * Tüm sutunlardaki verileri listeler



DQL Grubundan ==> SELECT komutu ile 'Tablodaki İstedigimiz Sütundaki Verileri Listeleyebiliriz'


Syntax:
-------


select sutun_adi from tablo_adi; ==> Sadece belirtilen sutundaki verileri listeler


========================================================================================================*/

create table ogrenciler(
id int,
isim varchar(40),
adres varchar(100),
sinav_notu int
);





insert into ogrenciler values(120, 'Ali Can', 'Ankara', 75);
insert into ogrenciler values(121, 'Veli Mert', 'Trabzon', 85);
insert into ogrenciler values(122, 'Ayşe Tan', 'Bursa', 65);
insert into ogrenciler values(123, 'Derya Soylu', 'Istanbul', 95);
insert into ogrenciler values(124, 'Yavuz Bal', 'Ankara', 85);
insert into ogrenciler values(125, 'Emre Gül', 'Hatay', 90);
insert into ogrenciler values(126, 'Harun Reşit', 'Isparta', 100);

--SORU1: ogrenciler tablosunun tum sutunlarındaki verileri listeleyiniz
select * from ogrenciler;

--SORU2: ogrenciler tablosundaki 'isim' sutunundaki verileri listeleyiniz
select isim from ogrenciler;

--SORU3: ogrenciler tablosundaki 'adres' sutunundaki verileri listeleyiniz
select adres from ogrenciler;

--SORU4: ogrenciler tablosundaki 'sinav_notu' sutunundaki verileri listeleyiniz
select sinav_notu from ogrenciler;

--SORU5: ogrenciler tablosundaki 'isim' ve 'sinav_notu' sutunundaki verileri listeleyiniz
select isim , sinav_notu from ogrenciler;	

--SORU6: ogrenciler tablosundaki sinav_notu 80'den büyük olan öğrencilerin tüm bilgilerini listele
select * from ogrenciler where sinav_notu>80;

--SORU7: ogrenciler tablosundaki adres'i 'Ankara' olan ögrencilerin tüm bilgilerini listele
select * from ogrenciler where adres='Ankara';

--SORU8: ogrenciler tablosundaki sinav_notu 85 ve adres'i 'Ankara' olan öğrenci isim'ini listele
select isim from ogrenciler where sinav_notu=85 and adres='Ankara';

--SORU9: ogrenciler tablosundaki sinav_notu 65 veya 85 olan ogrencilerin tüm bilgilerini listele
select * from ogrenciler where sinav_notu=65 or sinav_notu=85;

--SORU10: .ogrenciler tablosundaki sinav_notu 65 veya 85 olmayan ogrencilerin tüm bilgilerini listele
select * from ogrenciler where sinav_notu not in(65,85);