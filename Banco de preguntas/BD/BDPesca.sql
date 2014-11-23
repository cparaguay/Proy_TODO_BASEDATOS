--BASE DE DATOS PESCA
-------------------------------------
 
SET LANGUAGE SPANISH

if db_id('BDPesca') is not null
	begin
		use master
		drop database BDPesca
	end

create database BDPesca

go
use BDPesca
go
create table TB_BARCO (
COD_BAR char(3) not null,
NOM_BAR varchar(30) not null,
FEC_COM smalldatetime,
TIP_BAR char (1),
CAPACIDAD char (3)
)
create table TB_EMPLEADO (
COD_EMP char(3) not null,
NOM_EMP varchar(30) not null,
APE_PAT varchar (50) not null,
APE_MAT varchar(50) not null,
FEC_NAC smalldatetime,
FEC_ING smalldatetime not null,
DNI char (8)not null,
EST_CIV char (1),
HAB_BAS money not null,
COD_BAR char (3)not null
)
create table TB_ESPECIES(
COD_ESP char (3) not null,
NOM_ESP varchar (20) not null,
TIP_ESP char(1) not null,
PRE_ESP decimal
)
create table TB_FAENAS (
NUM_FAE char (3) not null,
FEC_INI smalldatetime not null,
FEC_FIN smalldatetime not null,
ZON_MAR char (1),
COD_BAR char (3) not null
)
create table TB_INGREDIENTES(
COD_PRO char(3) not null ,
COD_ESP char(3) not null ,
CAN_NEC char (3)
)
create table TB_PRODUCTO (
COD_PRO char(3) not null,
DES_PRO varchar (40),
TIP_PRO char (1) not null,
UNI_MED char (4),
PRE_PRO MONEY
)
create table TB_RECOLECCION(
NUM_FAE char(3) not null,
COD_ESP char(3)not null,
CAN_REC char (4)
)


alter table TB_BARCO add primary key (COD_BAR)
alter table TB_EMPLEADO add primary key (COD_EMP)
alter table TB_FAENAS add primary key (NUM_FAE)
alter table TB_ESPECIES add primary key (COD_ESP)
alter table TB_PRODUCTO add primary key (COD_PRO)
alter table TB_RECOLECCION add primary key (NUM_FAE,COD_ESP)
alter table TB_INGREDIENTES add primary key (COD_PRO,COD_ESP)

alter table TB_INGREDIENTES
                      add FOREIGN key (COD_PRO)
                               references TB_PRODUCTO
alter table TB_INGREDIENTES
                      add FOREIGN key (COD_ESP)
                               references TB_ESPECIES
alter table TB_RECOLECCION
                      add FOREIGN key (NUM_FAE)
                               references TB_FAENAS
alter table TB_RECOLECCION
                      add FOREIGN key (COD_ESP)
                               references TB_ESPECIES
alter table TB_EMPLEADO
                      add foreign key (COD_BAR)
                               references TB_BARCO
alter table TB_FAENAS
                      add foreign key (COD_BAR)
                               references TB_BARCO
GO

INSERT INTO TB_BARCO values ('B01','POPEYE','12-12-2005',1,120)
INSERT INTO TB_BARCO values ('B02','MARINA','12-10-2004',2,200)
INSERT INTO TB_BARCO values ('B03','EL SALMON I','2-11-1996',2,300)
INSERT INTO TB_BARCO values ('B04','EL SALMON II','03-03-2009',1,350)
INSERT INTO TB_BARCO values ('B05','LA CHALANA','11-10-2009',1,220)
INSERT INTO TB_BARCO values ('B06','KIMBARA','11-10-2009',2,120)
INSERT INTO TB_BARCO values ('B07','EL VIEJO LOBO','11-12-1995',2,100)
INSERT INTO TB_BARCO values ('B08','KIKIN I','4-02-1992',3,120)
INSERT INTO TB_BARCO values ('B09','SILVESTRE I','5-02-2010',3,150)
INSERT INTO TB_BARCO values ('B10','ROCKY','10-12-1995',2,200)
INSERT INTO TB_BARCO values ('B11','ROCKY II','8-12-2010',3,200)
INSERT INTO TB_BARCO values ('B12','SAN NICOLAS','10-01-2010',1,120)
INSERT INTO TB_BARCO values ('B13','LOBITOS','10-01-2011',2,160)
INSERT INTO TB_BARCO values ('B14','EL ZORRO','09-05-2009',3,230)
INSERT INTO TB_BARCO values ('B15','TROPICANA','3-06-2010',1,130)
GO
SELECT*FROM TB_BARCO
GO
INSERT INTO TB_EMPLEADO values ('E01','ALVARO','DIAZ','SOLANO','7-01-1970','12-05-1996','98846655','S',1200,'B01')
INSERT INTO TB_EMPLEADO values ('E02','ARMANDO','PEREZ','SORIANO','01-02-1971','12-05-1994','09982363','S',400,'B02')
INSERT INTO TB_EMPLEADO values ('E03','PEDRO','ADRIANZEN','LARA','7-03-1967','12-01-1995','09984646','S',650,'B08')
INSERT INTO TB_EMPLEADO values ('E04','LUIS','SOLANO','PAREDEZ','04-02-1969','11-08-1995','88474747','S',560,'B03')
INSERT INTO TB_EMPLEADO values ('E05','ISAC','LEON','ARIAS','02-12-1959','4-05-2011','08864918','C',250,'B04')
INSERT INTO TB_EMPLEADO values ('E06','JULIAN','SOLIS','PAUCAR','12-11-1970','2-10-1993','08865916','S',800,'B05')
INSERT INTO TB_EMPLEADO values ('E07','EDUARDO','RAMIREZ','RUIZ','01-02-1978','12-10-2009','08799001','C',550,'B04')
INSERT INTO TB_EMPLEADO values ('E08','JOSE LUIS','LEON','CORCUERA','04-04-1970','12-04-1991','08766901','S',1300,'B01')
INSERT INTO TB_EMPLEADO values ('E09','EDUARDO','CRUZADO','COCA','3-07-1959','12-10-1995','28817127','C',1500,'B03')
INSERT INTO TB_EMPLEADO values ('E10','GUILLERMO','VEGA','QUIJANDRIA','5-01-1979','11-04-1995','09993911','C',1400,'B04')
INSERT INTO TB_EMPLEADO values ('E11','MARIO','MONTOYA','LEON','4-06-1975','02-12-1996','08864512','S',800,'B10')
INSERT INTO TB_EMPLEADO values ('E12','ALBERTO','ISOLA','CASTILLO','02-10-1966','02-05-1990','00292992','C',2300,'B03')
INSERT INTO TB_EMPLEADO values ('E13','FELIPE','CABEL','LOPEZ','4-01-1969','1-06-1994','05959959','S',2500,'B03')
INSERT INTO TB_EMPLEADO values ('E14','JOSE','PEREDA','REY','6-05-1971','02-01-2010','08876663','C',550,'B01')
INSERT INTO TB_EMPLEADO values ('E15','YOLANDA','CABEL','DE LEON','03-02-1974','1-01-1995','03456287','C',2300,'B08')
INSERT INTO TB_EMPLEADO values ('E16','LUIS','CASTRO','PRADO','2-08-1972','03-06-1992','08864551','C',1500,'B03')
INSERT INTO TB_EMPLEADO values ('E17','JUAN','GOMEZ','LAOS','03-02-1974','05-10-1994','08867677','S',450,'B02')
INSERT INTO TB_EMPLEADO values ('E18','PEDRO','RUIZ','CESPEDES','8-09-1980','10-01-2001','09975665','C',560,'B11')
INSERT INTO TB_EMPLEADO values ('E19','RUBEN','SALAS','GARCIA','02-11-1977','12-10-1996','08876662','S',950,'B03')
INSERT INTO TB_EMPLEADO values ('E20','RAFAEL','SOLANO','PEREZ','7-10-1970','3-10-2010','07766531','C',800,'B05')
GO
SELECT*FROM TB_EMPLEADO
GO

INSERT INTO TB_ESPECIES values ('S01','ATUN',1,500)
INSERT INTO TB_ESPECIES values ('S02','CORVINA',1,800)
INSERT INTO TB_ESPECIES values ('S03','BALLENA AZUL',2,450)
INSERT INTO TB_ESPECIES values ('S04','PEZ ESPADA',2,200)
INSERT INTO TB_ESPECIES values ('S05','ANCHOVETA',2,650)
INSERT INTO TB_ESPECIES values ('S06','BACALAO',1,120)
INSERT INTO TB_ESPECIES values ('S07','BALLENA',2,50)
INSERT INTO TB_ESPECIES values ('S08','PEZ GATO',1,60)
INSERT INTO TB_ESPECIES values ('S09','CANGREJOS',1,20)
INSERT INTO TB_ESPECIES values ('S10','PEJESAPO',1,35)
INSERT INTO TB_ESPECIES values ('S11','JUREL',1,60)
INSERT INTO TB_ESPECIES values ('S12','ANCHOVETA',2,500)
INSERT INTO TB_ESPECIES values ('S13','COJINOVA',1,250)
INSERT INTO TB_ESPECIES values ('S14','MERO',1,500)
INSERT INTO TB_ESPECIES values ('S15','BONITO',1,100)
INSERT INTO TB_ESPECIES values ('S16','SARDINA',1,300)

select*from TB_ESPECIES
GO

INSERT INTO TB_FAENAS values ('F01','1-10-2009','8-10-2009','N','B03')
INSERT INTO TB_FAENAS values ('F02','2-05-2010','9-05-2010','N','B05')
INSERT INTO TB_FAENAS values ('F03','2-10-2009','5-10-2009','N','B04')
INSERT INTO TB_FAENAS values ('F04','10-01-1995','11-02-1995','S','B04')
INSERT INTO TB_FAENAS values ('F05','1-10-1996','4-10-1996','S','B03')
INSERT INTO TB_FAENAS values ('F06','2-11-2009','5-11-2009','S','B06')
INSERT INTO TB_FAENAS values ('F07','5-02-2009','8-02-2009','E','B09')
INSERT INTO TB_FAENAS values ('F08','4-03-2009','7-03-2009','S','B10')
INSERT INTO TB_FAENAS values ('F09','1-05-2009','5-05-2009','S','B03')
INSERT INTO TB_FAENAS values ('F10','1-01-2010','2-01-2010','N','B07')
INSERT INTO TB_FAENAS values ('F11','12-10-2010','4-11-2010','O','B09')
INSERT INTO TB_FAENAS values ('F12','5-10-2010','7-10-2010','O','B14')
INSERT INTO TB_FAENAS values ('F13','01-02-2011','05-02-2011','E','B12')
INSERT INTO TB_FAENAS values ('F14','01-10-2011','05-10-2011','E','B02')
INSERT INTO TB_FAENAS values ('F15','2-05-2011','4-05-2011','S','B08')
INSERT INTO TB_FAENAS values ('F16','2-06-2011','9-06-2011','S','B12')
INSERT INTO TB_FAENAS values ('F17','03-02-2011','05-03-2011','E','B05')
INSERT INTO TB_FAENAS values ('F18','1-06-2011','4-06-2011','E','B03')
INSERT INTO TB_FAENAS values ('F19','8-05-2011','21-05-2011','N','B05')
INSERT INTO TB_FAENAS values ('F20','3-09-2011','5-09-2011','O','B04')

SELECT*FROM TB_FAENAS
GO

INSERT INTO TB_PRODUCTO values ('P01','CONSERVA DE ATUN','C','CJA',100)
INSERT INTO TB_PRODUCTO values ('P02','COCKTAIL DE MARISCOS','C','CJA',50)
INSERT INTO TB_PRODUCTO values ('P03','ACEITE DE PESCADO','Q','LTR',50)
INSERT INTO TB_PRODUCTO values ('P04','FILETE DE ATUN','C','CJA',12)
INSERT INTO TB_PRODUCTO values ('P05','ABONO NATURAL X1','Q','TM',200)
INSERT INTO TB_PRODUCTO values ('P06','ACEITE ESPECIAL','Q','CJA',25)
INSERT INTO TB_PRODUCTO values ('P07','ABONO TIPO 3','Q','SAC',80)
INSERT INTO TB_PRODUCTO values ('P08','SARDINA GRATED','C','CAJ',90)
INSERT INTO TB_PRODUCTO values ('P09','ATUN EN GRATED','C','CAJ',80)
INSERT INTO TB_PRODUCTO values ('P10','ACEITE TIPO Z','Q','TM',450)

SELECT*FROM TB_PRODUCTO
GO

INSERT INTO TB_INGREDIENTES values ('P01','S04',10)
INSERT INTO TB_INGREDIENTES values ('P01','S08',5)
INSERT INTO TB_INGREDIENTES values ('P02','S02',5)
INSERT INTO TB_INGREDIENTES values ('P02','S09',10)
INSERT INTO TB_INGREDIENTES values ('P03','S07',20)
INSERT INTO TB_INGREDIENTES values ('P04','S01',100)
INSERT INTO TB_INGREDIENTES values ('P05','S05',120)
INSERT INTO TB_INGREDIENTES values ('P05','S07',30)
INSERT INTO TB_INGREDIENTES values ('P06','S02',25)
INSERT INTO TB_INGREDIENTES values ('P06','S08',10)
INSERT INTO TB_INGREDIENTES values ('P06','S12',25)
INSERT INTO TB_INGREDIENTES values ('P07','S03',40)
INSERT INTO TB_INGREDIENTES values ('P07','S12',50)
INSERT INTO TB_INGREDIENTES values ('P08','S16',60)
INSERT INTO TB_INGREDIENTES values ('P09','S01',60)
INSERT INTO TB_INGREDIENTES values ('P10','S03',45)
INSERT INTO TB_INGREDIENTES values ('P10','S12',50)

SELECT*FROM TB_INGREDIENTES
GO

INSERT INTO TB_RECOLECCION values ('F01','S03',120)
INSERT INTO TB_RECOLECCION values ('F01','S05',300)
INSERT INTO TB_RECOLECCION values ('F01','S07',20)
INSERT INTO TB_RECOLECCION values ('F01','S08',50)
INSERT INTO TB_RECOLECCION values ('F02','S01',450)
INSERT INTO TB_RECOLECCION values ('F02','S02',50)
INSERT INTO TB_RECOLECCION values ('F03','S02',100)
INSERT INTO TB_RECOLECCION values ('F03','S07',150)
INSERT INTO TB_RECOLECCION values ('F04','S05',100)
INSERT INTO TB_RECOLECCION values ('F05','S01',250)
INSERT INTO TB_RECOLECCION values ('F05','S06',20)
INSERT INTO TB_RECOLECCION values ('F06','S11',230)
INSERT INTO TB_RECOLECCION values ('F06','S12',120)
INSERT INTO TB_RECOLECCION values ('F07','S03',20)
INSERT INTO TB_RECOLECCION values ('F07','S06',450)
INSERT INTO TB_RECOLECCION values ('F08','S04',50)
INSERT INTO TB_RECOLECCION values ('F09','S06',210)
INSERT INTO TB_RECOLECCION values ('F09','S07',40)
INSERT INTO TB_RECOLECCION values ('F09','S08',45)
INSERT INTO TB_RECOLECCION values ('F09','S12',25)
INSERT INTO TB_RECOLECCION values ('F10','S03',120)
INSERT INTO TB_RECOLECCION values ('F11','S06',230)
INSERT INTO TB_RECOLECCION values ('F11','S08',120)
INSERT INTO TB_RECOLECCION values ('F12','S06',50)
INSERT INTO TB_RECOLECCION values ('F12','S07',45)
INSERT INTO TB_RECOLECCION values ('F13','S03',50)
INSERT INTO TB_RECOLECCION values ('F13','S12',40)
INSERT INTO TB_RECOLECCION values ('F13','S14',150)
INSERT INTO TB_RECOLECCION values ('F14','S05',50)
INSERT INTO TB_RECOLECCION values ('F14','S07',25)
INSERT INTO TB_RECOLECCION values ('F14','S09',65)
INSERT INTO TB_RECOLECCION values ('F15','S12',150)
INSERT INTO TB_RECOLECCION values ('F15','S13',65)
INSERT INTO TB_RECOLECCION values ('F15','S14',70)

SELECT*FROM TB_RECOLECCION
GO

