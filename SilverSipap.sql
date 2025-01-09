-----------------hOy
Select * from gxfindta.tcltsb where tsbidop in (4797280)
Update gxfindta.tcltsb set tsbesta = 'AC', tsbcome = '002', tsbdeme = 'ACREDITADO', tsbmotivo = 'ERROR NULL 20221004' where tsbidop = (4810747);
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------/*CAMBIO ESTADO TRX ONLINE
UPDATE GXFINDTA.TCLTSB
   SET TSBESTA = 'AN',
       TSBDEME = 'REDMINE #35367'
WHERE TSBIDOP = 3705684;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------Cambia estado para el reintento de Pagos SIPAP-----------------/*#35934- Insertado SIPAP pero no enviado*/--------/*Marca Pendiente SIPAP-20220906*/
Select * from gxfindta.tcltsb where tsbbacr <> '1020' and tsbesta = 'IN' and  tsbfege <= '2022-10-05 08:30:00'; --139 registros
Update gxfindta.tcltsb  set tsbesta = 'PE', tsbmotivo = 'SIPAP (IN) NO TRANSMITIDO 20221005' where tsbbacr <> '1020' and tsbesta = 'IN' and  tsbfege <= '2022-10-05 08:30:00';
----con ids especificos
Select * from gxfindta.tcltsb where  tsbesta = 'IN' and tsbidop in (4424531,4438740,4440505,4447272,4447273,4447321,4447381,4443384)
Update gxfindta.tcltsb  set tsbesta = 'PE', tsbmotivo = 'SIPAP (IN) NO TRANSMITIDO 20220826' where tsbesta = 'IN' and tsbidop in (4424531,4438740,4440505,4447272,4447273,4447321,4447381,4443384)
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------/*Marca Pendiente Debitos*//*Envio de debitos masivos */
Select * from gxfindta.tcltsb where tsbtpop = '04' and tsbesta = 'IN' and  tsbfege >= '2022-08-24 16:30:00'; --1.390 registros
Update gxfindta.tcltsb  set tsbesta = 'PE', tsbmotivo = 'DEBITO (IN) NO TRANSMITIDO 20220824' where tsbtpop = '04' and tsbesta = 'IN' and  tsbfege >= '2022-08-24 08:30:00';
----------------------------------------/*
con id especificos
Select * from gxfindta.tcltsb where tsbtpop = '04' and tsbesta = 'IN' and tsbidop in (4424430,4424938);
Update gxfindta.tcltsb  set tsbesta = 'PE', tsbmotivo = 'DEBITO (IN) NO TRANSMITIDO 20220823' where tsbtpop = '04' and tsbesta = 'IN' and tsbidop in (4424430,4424938);
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------/*Para poner como pendiente los debitos que imputaron hoy
Select * from gxfindta.tcltsb where tsbesta = 'IN' and tsbtpop = '04' and date(tsbfege) = '2022-08-22'; --6 registros
Update gxfindta.tcltsb??set tsbesta = 'PE', tsbmotivo = 'DEBITO (IN) NO TRANSMITIDO 20220822' where tsbesta = 'IN' and tsbtpop = '04' and date(tsbfege) = '2022-08-22';
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Select * from gxfindta.tcltsb where tsbesta = 'PE'  and tsbfeac >= '2022-08-19 08:30:00';
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------/*/*CUENTAS INTERNAS NO TRANSMITIDAS*/
Select * from gxfindta.tcltsb where tsbbacr = '1020' and tsbesta = 'IN' and  tsbfege <= '2022-09-06 08:00:00'; --3043 REGISTROS
Update gxfindta.tcltsb set tsbesta = 'PE', tsbmotivo = 'INTERNA (IN) NO TRANSMITIDO 20220906' where tsbbacr = '1020' and tsbesta = 'IN' and  tsbfege <= '2022-09-06 08:00:00';
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------/*/*Corrige Nro de Cuenta D?bito (le falto un cero delante y poner en PE)*/
Update gxfindta.tcltsb set tsbctde = '0104913400', tsbesta = 'PE' where tsbmotivo = 'REDMINE NRO 36786' and tsbcome = '008'; --4.725
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------/*/*Marca para Envio Pagos SIPAP (Batch)*/
Select * from gxfindta.tcltsb where tsbbacr <> '1020' and tsbesta = 'IN' and tsbtpoacr = 'B'; --1339 registros
Update gxfindta.tcltsb??set tsbesta = 'PE', tsbmotivo = 'SIPAP (IN) NO TRANSMITIDO 20220826' where tsbbacr <> '1020' and tsbesta = 'IN' and tsbtpoacr = 'B';
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------/*Para poner como pendiente los debitos que imputaron hoy
Select * from gxfindta.tcltsb where tsbesta = 'IN' and tsbtpop = '04' and date(tsbfege) = '2022-08-22'; --6 registros
Update gxfindta.tcltsb??set tsbesta = 'PE', tsbmotivo = 'DEBITO (IN) NO TRANSMITIDO 20220822' where tsbesta = 'IN' and tsbtpop = '04' and date(tsbfege) = '2022-08-22';
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------Para cambiar fecha de CLEaring
UPDATE GXFINDTA.TCLPFC SET PFCVALCHR = 'N' WHERE PFCIDPARM = 'CIERRECLEARING ';

select * from GXFINDTA.TCLPFC WHERE PFCIDPARM = 'CIERRECLEARING ';

UPDATE GXFINDTA.TCLFEC SET FECANT = '20221005',
       FECPRO = '20221006',
       FECSIG = '20221007'
WHERE FECID = '002';
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------DIFERENCIA CLEARING MULTIENTIDADES
Select * from gxopera.opago1p where PGIDUSR = 'U99KATERIN' and pgidtrn in ('221018345614','221018345615','221018345616');
DELETE gxopera.opago1p where PGIDUSR = 'U99KATERIN' and pgidtrn in ('221018345614','221018345615','221018345616');

/*20221220 - Transacciones afectadas*/

Select * from gxbdbps.tswaut where autrrnbep in
('229307500932','229307500947','229307501132','229307501239','229307501376','229307501452','229307501461','229307501488'
,'229307501592','229307501598','229307501603','229307501616','229307501629','229307501644','229307501740','229307502005'
,'229307502166','229307502427','229307502431','229307502593','229307502939','229307503057','229307503206','229307503472'
,'229307503559','229307503791','229307503924','229307504107','229307504114','229307504182','229307504235');
--Actualiza a Online en tclmov --32 registros

Update gxfindta.tclmov set movpgon = 'O' where movrrnbep in
('229307500932','229307500947','229307501132','229307501239','229307501376','229307501452','229307501461','229307501488'
,'229307501592','229307501598','229307501603','229307501616','229307501629','229307501644','229307501740','229307502005'
,'229307502166','229307502427','229307502431','229307502593','229307502939','229307503057','229307503206','229307503472'
,'229307503559','229307503791','229307503924','229307504107','229307504114','229307504182','229307504235');
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Para el caso que se necesite habilitar la imputacion
SELECT PFCIDPARM,PFDIDGRUP,PFDVALCHR1 FROM GXFINDTA.TCLPFD WHERE PFCIDPARM = 'PCLR154' AND PFDIDGRUP = 'EJECUCION';
UPDATE GXFINDTA.TCLPFD SET PFDVALCHR1 = 'N' WHERE PFCIDPARM = 'PCLR154' AND PFDIDGRUP = 'EJECUCION';
SELECT * FROM GXFINDTA.TCLPFD T WHERE PFCIDPARM = 'PCLR154' AND PFDIDGRUP = 'EJECUCION';
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Corrige el dato de la orden de pago pendiente en transmisiones #39632
Select * from gxfindta.tcltsb where tsbnref = '289100015728';
Update gxfindta.tcltsb set tsbtpop = '01', tsbdeop = 'CREDITO A COMERCIOS', tsbcodswd = 'BCNAPYPA', tsbbade = 1020,
tsbctde = '0102184061', tsbesta = 'PE', tsbmotivo = 'redmine #39632',tsbtpde = 'CC', tsbcodswc = 'FICSPYPA',
tsbbacr = 2080 where tsbnref = '289100015728';
--PARAMETRIZACIONES PARA LA REINGENIERIA
--PARBCOPAI=5034 = LAMBARE - PARCSWIFT=CLAMPYPAXXXX (050)

Select * from gxtrjdta.tdgent where entcodent = 5034;
Update gxtrjdta.tdgent set ENTCODSWFT='CLAMPYPA' where entcodent = 5034;

Select * from gxtrjdta.tcoenc where ENCENTANT = '050';
INSERT INTO GXTRJDTA.TCOENC (ENCENTACT,ENCENTANT,ENCUSULTUP,ENCFHULTUP,ENCENTROL)
VALUES (5034,'050',current user,current timestamp,503404);

Select * from gxtrjdta.tdgenr where entcodent =5034;
INSERT INTO GXTRJDTA.TDGENR
(ENTCODENT,ROLIDROL,ENRENTROL,ENRPERPAGO,ENRUSULTUP,ENRFHULTUP,ENRTIPOCON,ENRBCOPAGA)
VALUES (5034,4,503404,' ',current user, current timestamp,'IND',1020);
--PARBCOPAI=2080 = FIC DE FINANZAS - PARCSWIFT=FICSPYPAXXXX (097)

Select * from gxtrjdta.tdgent where entcodent = 2080;
Update gxtrjdta.tdgent set ENTCODSWFT='FICSPYPA' where entcodent = 2080;

Select * from gxtrjdta.tcoenc where ENCENTANT = '097';
INSERT INTO GXTRJDTA.TCOENC (ENCENTACT,ENCENTANT,ENCUSULTUP,ENCFHULTUP,ENCENTROL)
VALUES (2080,'097',current user,current timestamp,208004);

Select * from gxtrjdta.tdgenr where entcodent =2080;
INSERT INTO GXTRJDTA.TDGENR
(ENTCODENT,ROLIDROL,ENRENTROL,ENRPERPAGO,ENRUSULTUP,ENRFHULTUP,ENRTIPOCON,ENRBCOPAGA)
VALUES (2080,4,208004,' ',current user, current timestamp,'IND',1020);
--PARBCOPAI=2137 = CEFISA - PARCSWIFT=CRIFPYPEXXXX (098)

Select * from gxtrjdta.tdgent where entcodent = 2137;
Update gxtrjdta.tdgent set ENTCODSWFT='CRIFPYPE' where entcodent = 2137;

Select * from gxtrjdta.tcoenc where encentrol = 213704;
INSERT INTO GXTRJDTA.TCOENC (ENCENTACT,ENCENTANT,ENCUSULTUP,ENCFHULTUP,ENCENTROL)
VALUES (2137,'098',current user,current timestamp,213704);

Select * from gxtrjdta.tdgenr where entcodent =2137;
INSERT INTO GXTRJDTA.TDGENR
(ENTCODENT,ROLIDROL,ENRENTROL,ENRPERPAGO,ENRUSULTUP,ENRFHULTUP,ENRTIPOCON,ENRBCOPAGA)
VALUES (2137,4,213704,' ',current user, current timestamp,'IND',1020);
--------------------------

