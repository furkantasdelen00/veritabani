create database school_library;

use school_library;
create table uyeler(
uyeNo int not null primary key identity(1,1),
cinsiyet nvarchar(2) not null,
UyeAdi nvarchar(50) not null,
UyeSoyadi nvarchar(50) not null,
Eposta nvarchar(100) not null,
Telefon int
);
use school_library;
create table adresler(
adresNo int not null Primary Key identity(1,1),
sehir nvarchar(50),
mahalle nvarchar(100),
binaNo int,
cadde nvarchar(200),
ulke nvarchar(50),
postaKodu int
);
create table kutuphane(
kutuphaneNo int not null identity(1,1) PRIMARY KEY,
kutuphaneIsmi nvarchar(150),
aciklama nvarchar(500),
adresNo int constraint FK_adresler_kutuphane 
FOREIGN KEY(adresNo) references adresler(adresNo)
);
select * from kutuphane

ALTER TABLE UYELER ADD adresNo int 
constraint FK_uyeler_adres
FOREIGN KEY (adresNo)
references ADRESLER (adresNo);

create table kitaplar(
ISBN nvarchar(50) not null PRIMARY KEY,
kitapAdi nvarchar(100),
sayfaSayisi int,
yayinTarihi datetime
);

create table emanet(
emanetNo int not null identity(1,1) PRIMARY KEY,
emanetTarihi datetime,
teslimTarihi datetime,
uyeNo int constraint FK_uye_emanet 
FOREIGN KEY(uyeNo) references uyeler(uyeNo),

kutuphaneNo int constraint FK_kutuphane_emanet 
FOREIGN KEY(kutuphaneNo) references kutuphane(kutuphaneNo),

ISBN nvarchar(50) constraint FK_kitap_emanet 
FOREIGN KEY(ISBN) references kitaplar(ISBN)
);
create table katagoriler(
katagoriNo int  not null PRIMARY KEY,
katagoriAdi nvarchar(50),
);

create table yazarlar(
yazarNo int  not null PRIMARY KEY,
yazarAdi nvarchar(50),
yazarSoyadı nvarchar(50),
);

create table bulunur(
katagoriNo int constraint FK_katagoriler_bulunur
FOREIGN KEY(katagoriNo) references katagoriler(katagoriNo),

ISBN nvarchar(50) constraint FK_ISBN_bulunur
FOREIGN KEY(ISBN) references kitaplar(ISBN),
);

create table bulunur2(
miktar int,
kutuphaneNo int constraint FK_kutuphane_bulunur2
FOREIGN KEY(kutuphaneNo) references kutuphane(kutuphaneNo),

ISBN nvarchar(50) constraint FK_ISBN_bulunur2
FOREIGN KEY(ISBN) references kitaplar(ISBN),
);

create table yazar(
yazarNo int constraint FK_yazarlar_yazar
FOREIGN KEY(yazarNo ) references yazarlar(yazarNo ),

ISBN nvarchar(50) constraint FK_ISBN_yazar
FOREIGN KEY(ISBN) references kitaplar(ISBN),
);
