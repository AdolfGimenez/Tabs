---ver acredtiaciones
----------verificar por estados las acreditaciones
SELECT DATE(TSBFEGE),
       TSBTPOP, TSBBADE, TSBBACR,
       CASE WHEN TSBBACR = 1020 THEN 'CUENTAS INTERNAS' ELSE 'CUENTAS SIPAP' END TIPOTRANSMISION,
       TSBESTA ESTADO, TSBCOME CODIGO, TSBDEME MENSAJE, COUNT(*) CANTIDAD, SUM(TSBIMPO) MONTO
FROM GXFINDTA.TCLTSB
WHERE DATE(TSBFEGE) BETWEEN '2025-05-26' AND '2025-05-26'
  AND TSBBADE = 1020
  --AND TSBTPOP <> '04'
--  AND TSBCOME IN ('000')
GROUP BY DATE(TSBFEGE), TSBTPOP, TSBBADE, TSBBACR, TSBESTA, TSBCOME, TSBDEME
ORDER BY 1;

SELECT DATE(TSBFEGE), TSBDEOP, TSBESTA, TSBCOME RETORNO, TSBDEME RESPUESTA, COUNT(*) CANTIDAD, SUM(TSBIMPO) MONTO
FROM GXFINDTA.TCLTSB
WHERE DATE(TSBFEGE) BETWEEN '2025-05-26' AND '2025-05-26'
--AND TSBBADE = 1020
--AND TSBCOME IN ('000', '999')
--AND TSBESTA IN ('EN', 'PE', 'RE') --AND TSBTPOP=01
GROUP BY DATE(TSBFEGE), TSBDEOP, TSBESTA, TSBCOME, TSBDEME
ORDER BY 3;
-------------------------------------------
/*Resumen Acreditaciones cuentas Internas Continental*/
sELECT DATE(TSBFEAC),tsbtpop, tsbdeop,TSBESTA, TSBCOME,TSBDEME, COUNT(*) CANTIDAD, SUM(TSBIMPO)TOTAL from gxfindta.tcltsb
where DATE(TSBFEAC)between '2024-11-24' and '2024-11-26' and tsbbade = 1020 and tsbbacr = 1020 AND TSBTPOP = '01' AND TSBCOME in ('040','000')-- AND TSBESTA  in ('EN','ER')
GROUP BY DATE(TSBFEAC),tsbtpop, tsbdeop,TSBESTA, TSBCOME,TSBDEME;

/*Resumen Acreditaciones SIPAP*/
sELECT DATE(TSBFEAC),tsbtpop, tsbdeop,TSBESTA, TSBCOME,TSBDEME, COUNT(*) CANTIDAD, SUM(TSBIMPO)TOTAL from gxfindta.tcltsb
where DATE(TSBFEAC)between '2024-11-24' and '2024-11-25' and tsbbade = 1020 and tsbbacr <> 1020 AND TSBTPOP = '01' AND TSBCOME in ('040','000')-- AND TSBESTA  in ('EN','ER')
GROUP BY DATE(TSBFEAC),tsbtpop, tsbdeop,TSBESTA, TSBCOME,TSBDEME;

/*fechas comerciales, proceso y trnasaccionales bepsa*/
SELECT * FROM  LIBDEBITO.EMPRESA0P;
SELECT * from gxfindta.tclfec;--reingenier?a fecha tiene que ser fecant, fecpro, fecsig consecitivos.
--DRCONBEP
select * from LIBDEBITO.DRCONBEP WHERE substr(lerrnb, 1, 4) = '3018' and lfcotr <> 20230118
and lfectr <> 20230117 and lerrnb not in (select opnoref from gxopera.opmovi WHERE OPFECOM = '20230117' AND OPFEREA = '20230118');--31055
/*UPDATE LIBDEBITO.DRCONBEP SET LFCOTR = 20230118, LFECTR = 20230118 where substr(lerrnb, 1, 4) = '3018' and lfcotr <> 20230118
and lfectr <> 20230117 and lerrnb not in (select opnoref from gxopera.opmovi WHERE OPFECOM = '20230117' AND OPFEREA = '20230118')*/
--TSWAUT
select * from gxbdbps.tswaut where substr(AUTRRNBEP, 1, 4) ='3018' and AUTTRXFCHC<> 20230118 and AUTTRXFCHF<> 20230117
and AUTRRNBEP not in (select opnoref from gxopera.opmovi WHERE OPFECOM = '20230117' AND OPFEREA = '20230118');--30320
/*UPDATE GXBDBPS.TSWAUT SET AUTTRXFCHC='20230118', AUTTRXFCHF='20230118' WHERE substr(AUTRRNBEP, 1, 4) ='3018' and AUTTRXFCHC
<> 20230118 and AUTTRXFCHF<> 20230117 and AUTRRNBEP not in (select opnoref from gxopera.opmovi WHERE OPFECOM = '20230117' AND OPFEREA = '20230118')*/
--FLICOM1
select * from gxopera.flicom1 where LIFECHD='20230118' and licodtr<>010001 and LIFECREDI=20230118;--16 se debe corregir la columna LIFECREDI a fecha 20230119
/*UPDATE GXOPERA.FLICOM1 SET LIFECREDI='20230119' WHERE LIFECHD='20230118' and licodtr<>010001 and LIFECREDI=20230118*/
-------------------------------------------------------------------------------------------------------------------------------------
--OPLIQUI
select *  from gxopera.opliqui where substr(opcampoa, 41, 8)='20230118' and substr(opcampoa, 17,8)='20230118';--26
-----------------hOy
Select * from gxfindta.tcltsb where tsbidop in (5262279);
Update gxfindta.tcltsb set tsbesta = 'AC', tsbcome = '002', tsbdeme = 'ACREDITADO', tsbmotivo = 'ERROR NULL 20221004' where tsbidop in (5262279);
-----------------------------------------------------------------------------------------------------------------------------
/*Tareas #41347: SOLICITUD DE CAMBIO DE ESTADO DE INSERTADO A PENDIENTE
Actualiza Estado para reintento de Pendientes*/
Select * from gxfindta.tcltsb where date(tsbfege) >= '2022-11-01' and tsbcome = '091' and tsbidop < 5278339; --138 REGISTROS
Update gxfindta.tcltsb set tsbesta = 'PE', tsbmotivo = 'REINTENTO POR CIERRE' where date(tsbfege) >= '2022-11-01' and tsbcome = '091' and tsbidop < 5278339;

/*Cambia Configuraci?n para Reintento desde la pantalla de transmisiones, corregir el parametro para cuando reintenten de nuevo desde la pantalla por defecto quede con estado PE*/
sELECT * FROM GXFINDTA.TCLPFD WHERE PfdIdGrup = 'ESTADOS' and PFCIDPARM = 'PCLR221';
Update GXFINDTA.TCLPFD set PFDVALCHR1 = 'PE', PFDVALCHR2= '900', PFDDSCIMP1 = 'PENDIENTE DE TRANSMISION' WHERE PfdIdGrup = 'ESTADOS' and PFCIDPARM = 'PCLR221';
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Habilita reintento Credito a Comercios
Select * from gxfindta.tcltsb where tsbfeac >= date('2022-11-08') and tsbtpop = '01' and tsbesta = 'IN';
Update gxfindta.tcltsb set tsbesta ='PE', tsbmotivo = 'HABILITA REINTENTO #40342' where tsbfeac >= date('2022-11-08') and tsbtpop = '01' and tsbesta = 'IN';
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------Cambia estado para el reintento de Pagos SIPAP-----------------/*#35934- Insertado SIPAP pero no enviado*/--------/*Marca Pendiente SIPAP-20220906*/
Select * from gxfindta.tcltsb where tsbbacr <> '1020' and tsbesta = 'IN' and  tsbfege <= '2022-10-05 08:30:00'; --139 registros
Update gxfindta.tcltsb  set tsbesta = 'PE', tsbmotivo = 'SIPAP (IN) NO TRANSMITIDO 20221005' where tsbbacr <> '1020' and tsbesta = 'IN' and  tsbfege <= '2022-10-05 08:30:00';
----con ids especificos
Select * from gxfindta.tcltsb where  tsbesta = 'IN' and tsbidop in (4424531,4438740,4440505,4447272,4447273,4447321,4447381,4443384);
Update gxfindta.tcltsb  set tsbesta = 'PE', tsbmotivo = 'SIPAP (IN) NO TRANSMITIDO 20220826' where tsbesta = 'IN' and tsbidop in (4424531,4438740,4440505,4447272,4447273,4447321,4447381,4443384);
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------/*Marca Pendiente Debitos*//*Envio de debitos masivos */
Select * from gxfindta.tcltsb where tsbtpop = '04' and tsbesta = 'IN' and  tsbfege >= '2022-08-24 16:30:00'; --1.390 registros
Update gxfindta.tcltsb  set tsbesta = 'PE', tsbmotivo = 'DEBITO (IN) NO TRANSMITIDO 20220824' where tsbtpop = '04' and tsbesta = 'IN' and  tsbfege >= '2022-08-24 08:30:00';
----------------------------------------/*
--con id especificos
Select * from gxfindta.tcltsb where tsbtpop = '04' and tsbesta = 'IN' and tsbidop in (4424430,4424938);
Update gxfindta.tcltsb  set tsbesta = 'PE', tsbmotivo = 'DEBITO (IN) NO TRANSMITIDO 20220823' where tsbtpop = '04' and tsbesta = 'IN' and tsbidop in (4424430,4424938);
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------/*Para poner como pendiente los debitos que imputaron hoy
Select * from gxfindta.tcltsb where tsbesta = 'IN' and tsbtpop = '04' and date(tsbfege) = '2022-08-22'; --6 registros
Update gxfindta.tcltsb set tsbesta = 'PE', tsbmotivo = 'DEBITO (IN) NO TRANSMITIDO 20220822' where tsbesta = 'IN' and tsbtpop = '04' and date(tsbfege) = '2022-08-22';
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
Update gxfindta.tcltsb set tsbesta = 'PE', tsbmotivo = 'SIPAP (IN) NO TRANSMITIDO 20220826' where tsbbacr <> '1020' and tsbesta = 'IN' and tsbtpoacr = 'B';
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------/*Para poner como pendiente los debitos que imputaron hoy
Select * from gxfindta.tcltsb where tsbesta = 'IN' and tsbtpop = '04' and date(tsbfege) = '2022-08-22'; --6 registros
Update gxfindta.tcltsb set tsbesta = 'PE', tsbmotivo = 'DEBITO (IN) NO TRANSMITIDO 20220822' where tsbesta = 'IN' and tsbtpop = '04' and date(tsbfege) = '2022-08-22';
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
DELETE FROM gxopera.opago1p where PGIDUSR = 'U99KATERIN' and pgidtrn in ('221018345614','221018345615','221018345616');

/*20221220 - Transacciones afectadas*/
Select * from gxbdbps.tswaut where autrrnbep in
('229307500932','229307500947','229307501132','229307501239','229307501376','229307501452','229307501461','229307501488','229307501592','229307501598','229307501603','229307501616','229307501629','229307501644','229307501740','229307502005'
,'229307502166','229307502427','229307502431','229307502593','229307502939','229307503057','229307503206','229307503472','229307503559','229307503791','229307503924','229307504107','229307504114','229307504182','229307504235');
--Actualiza a Online en tclmov --32 registros
Update gxfindta.tclmov set movpgon = 'O' where movrrnbep in
('229307500932','229307500947','229307501132','229307501239','229307501376','229307501452','229307501461','229307501488','229307501592','229307501598','229307501603','229307501616','229307501629','229307501644','229307501740','229307502005'
,'229307502166','229307502427','229307502431','229307502593','229307502939','229307503057','229307503206','229307503472','229307503559','229307503791','229307503924','229307504107','229307504114','229307504182','229307504235');
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Para el caso que se necesite habilitar la imputaci?n  Actualizar estado para habilitar imputaciones
---error en el tablero de imputacion SE CAMBIA LO QUE ES EJECUCI?N QUE QUED? EN ESTADO S A N
SELECT * FROM GXFINDTA.TCLPFD WHERE PFCIDPARM='PCLR154' AND PFDSECU='2';
SELECT PFCIDPARM,PFDIDGRUP,PFDVALCHR1 FROM GXFINDTA.TCLPFD WHERE PFCIDPARM = 'PCLR154' AND PFDIDGRUP = 'EJECUCION';
UPDATE GXFINDTA.TCLPFD SET PFDVALCHR1 = 'N' WHERE PFCIDPARM = 'PCLR154' AND PFDIDGRUP = 'EJECUCION';
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Corrige el dato de la orden de pago pendiente en transmisiones #39632
Select * from gxfindta.tcltsb where tsbnref = '289100015728';
Update gxfindta.tcltsb set tsbtpop = '01', tsbdeop = 'CREDITO A COMERCIOS', tsbcodswd = 'BCNAPYPA', tsbbade = 1020,
tsbctde = '0102184061', tsbesta = 'PE', tsbmotivo = 'redmine #39632',tsbtpde = 'CC', tsbcodswc = 'FICSPYPA',
tsbbacr = 2080 where tsbnref = '289100015728';
--PARAMETRIZACIONES PARA LA REINGENIERIA  tarea 53786
--tabla de parametrizaciones de cuentas en conti
SELECT * from GXFINDTA.TCLVCT WHERE VCTNOMCLI='%%';
--Entidades Bancarias
Select * from contabilid.tatgene;
--Cambio de Banco Regional a Sudameris
select * from gxtrjdta.tdgenr ;
-- Cambio de codio swift
SELECT * FROM gxopera.CLPARF ;
--Asociar Cod de Banco Regional a Sudameris RI
SELECT * FROM gxtrjdta.TCOENC;
--Correcci?n de Nombre Legacy
SELECT * FROM gxbdbps.GENTIAF ;
-- Correcci?n de Nombres RI
SELECT * FROM gxtrjdta.tdgent;
--PARBCOPAI=5034 = LAMBARE - PARCSWIFT=CLAMPYPAXXXX (050)
Select * from gxtrjdta.tdgent where entcodent = 5034;
Select * from gxtrjdta.tcoenc where ENCENTANT = '050';
Select * from gxtrjdta.tdgenr where entcodent =5034;
-----------
SELECT * FROM GXOPERA.OPENTID O;
SELECT * FROM GXOPERA.OPENTID1 O;
--PARBCOPAI=2080 = FIC DE FINANZAS - PARCSWIFT=FICSPYPAXXXX (097)
--PARBCOPAI=2137 = CEFISA - PARCSWIFT=CRIFPYPEXXXX (098)
/*bancos reing -- clearing*/
Select * from gxtrjdta.tdgent where entcodent = 2137;
Update gxtrjdta.tdgent set ENTCODSWFT='CRIFPYPE' where entcodent = 2137;
/*relacion legacy-reing*/
Select * from gxtrjdta.tcoenc where encentrol = 213704;
INSERT INTO GXTRJDTA.TCOENC (ENCENTACT,ENCENTANT,ENCUSULTUP,ENCFHULTUP,ENCENTROL)
VALUES (2137,'098',current user,current timestamp,213704);
/*entidad rol*/
Select * from gxtrjdta.tdgenr where entcodent =2137;
INSERT INTO GXTRJDTA.TDGENR
(ENTCODENT,ROLIDROL,ENRENTROL,ENRPERPAGO,ENRUSULTUP,ENRFHULTUP,ENRTIPOCON,ENRBCOPAGA)
VALUES (2137,4,213704,' ',current user, current timestamp,'IND',1020);
-----CAMBIO DE BBVA A BNB
/*Corrige BIC GNB*/
Select tsbidop, tsbdeop, tsbbade,  tsbcodswd,tsbbacr, tsbcodswc, tsbctcr, tsbcoco, tsbdene, tsbnref, tsbimpo,tsbesta, tsbdeme from gxfindta.tcltsb where tsbidop >  7338200 and tsbbacr = 1007;
Update gxfindta.tcltsb set TSBCODSWC = 'BGNBPYPX' where tsbidop >  7338200 and tsbbacr = 1007;
--REINGENIERIA
Select * from gxtrjdta.tdgent where entcodent = 1007;
Update gxtrjdta.tdgent set ENTCODSWFT = 'BGNBPYPX'  where entcodent = 1007;
--LEGACY
Select * from gxopera.clparf where PARCODBCO= '064';
Update gxopera.clparf set PARCSWIFT = 'BGNBPYPXXXX' where PARCODBCO= '064';
---ciontabilidad
Select * from contabilid.tatgene where tgalfa = 'BA' and tgcode = 'BB';
Update contabilid.tatgene set tgdesc = 'BANCO GNB' where tgalfa = 'BA' and tgcode = 'BB';
--entidad legacy
Select * from gxbdbps.gentiaf where enemiso = '064';
Update gxbdbps.gentiaf set ENNOMBR = 'BANCO GNB', ENNOMBC = 'GNB', ENNCTC1= 'BGNBPYPXXXX' where enemiso = '064';
/*Configura Banco Pagador para Trx BNF Online*/
Select * from gxtrjdta.tdgenr where entcodent = 1007;
Update gxtrjdta.tdgenr set ENRBCOPAGA = 1002 where entcodent = 1007;
/*cunado rechazo sipap*/ --ARCHIVO CLEARING PARAMETROS
 SELECT * FROM GXOPERA.CLPARF C2;
----------------------Multiclearing. credito y debito.!
--Transferir Credito a Comercios=             COMCL110 le llama al  COMRG110
--Transferir Clearing MULTIENTIDADES=         COMCL144 le llama al  COMRG144
--Verificar Credito Comercios=                COMRG116
/*Paso 1 hacer bk del opago1P a Adolfolib*/
select * from gxopera.opago1p;
/*Paso2 hacer bk del historico en la fecha solicitadoa EN ADOLFOLIB y restaurar al opago1p*/
select sum(pgimpor),  PGCODMV from GXOPERA.OPAGO1PHIS where PGFECOM=20230526  ---siempre tienen que ser iguales.
group by PGCODMV; --Tiene que coincidir con la pantalla que env?an EN PANTALLA!
select * from GXOPERA.OPAGO1PHIS where PGFECOM=20230526;/*PARA BK*/
/*Paso 3 clrnpfm a opago1p*/
/*Paso 4 cpyf de historico al 1p con ADD de opci?n y verificar que coincida con la pantalla nuevamente*/
select sum(pgimpor), PGCODMV from GXOPERA.OPAGO1P where PGFECOM=20230526
group by PGCODMV;
/*Paso 5 eliminar del historico la fecha efectuada para evitar duplicaciones.*/
delete from GXOPERA.OPAGO1PHIS where PGFECOM=20230526;
/*RESTAURAR NUEVAMENTE EL BK DE OPAO1P DE ADOLFOLIB A OPAGO1P*/
------------------------------------------------------------------------------------------------------------------
/*Reproceso Clearing*/
select * from gxopera.OPMOVI where opferea ='20161202' and opuser = 'U99BERNAL';
select * from gxopera.OPCOMIS where opcofec ='20160826';
select * from gxopera.OPSEREX where SEFECO ='20160826';
SELECT * FROM GXOPERA.OPRECLE WHERE REFECH ='20181121' and reuser = 'U99BERNAL';
SELECT * FROM GXOPERA.FCTACOM WHERE ctafecha = '20161013';
SELECT * FROM GXOPERA.FLICOM WHERE  LIFECHD = '20161202' AND LIUSER = 'U99BERNAL';
SELECT * FROM GXOPERA.FLICOM1 WHERE  LIFECHD LIKE '20161202' AND LIFECHH = '20160713';
SELECT * FROM GXOPERA.OPAGO0P WHERE PGFCOM= '2016-12-02'; --Clearing Parte 1 Resumen Transferencias
SELECT * FROM GXOPERA.OPAGO1P; -- Clearing Parte 2 D?bito Cr?dito
SELECT * FROM GXOPERA.OPAGO3P;
SELECT * FROM GXOPERA.OPAGO3TC;
SELECT * FROM GXOPERA.OPAGO5P;
SELECT * FROM GXOPERA.MAILS;
-------------------------------------------------------------------------------------------------------------------
DELETE from gxopera.opmovi where opfecom = '20161202';
Delete from gxopera.opcomis where opcofec ='20161202';
Delete from gxopera.OPSEREX where SEFECO ='20160826';
DELETE FROM GXOPERA.OPRECLE WHERE REFECH = '20161202';
DELETE FROM GXOPERA.FCTACOM WHERE CTAFECHA = '20161202';
DELETE FROM GXOPERA.FLICOM WHERE  LIFECHD = '20161202';
DELETE FROM GXOPERA.FLICOM1 WHERE  LIFECHD ='20161202';
/*DELETE FROM GXOPERA.OPAGO0P;
DELETE FROM GXOPERA.OPAGO1P;
DELETE FROM GXOPERA.OPAGO3P;
DELETE FROM GXOPERA.OPAGO3TC;
DELETE FROM GXOPERA.OPAGO5P;
DELETE from gxopera.mails;*/
-----------------------------------------------------------------------------------
---inconveniente con el clearing red de pagos.! el archivo es cnb en la 55
/*COMCL146    CLP         Clearing de Adelanto de BNF  04/10/2017
       BNF_ADELAN  BEPSA       BCH     0,0  PGM-COMCL146     MSGW */
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
|--AS/400 RPG  |-- BEPSA                 |-- BNF                 |-- CLEARING         |-- HISTORICO          |-- DESCRIPCION                                                               |
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
|--COMRG110    |-- LIBDEBITO/COPAGO0PDM  |-- LIBDEBITO/COPAGO0P  |-- GXOPERA/OPAGO0P  |--                    |-- Total de Acreditaciones del Emisor BNF a Bepsa                            |
|--COMRG144    |-- LIBDEBITO/COPAEN0PDM  |-- LIBDEBITO/COPAEN0P  |-- GXOPERA/OPAGO1P  |-- GXOPERA/OPAGO1PHIS |-- Acreditaciones de Bepsa a Comercios BNF                                   |
|--COMCL146    |-- LIBDEBITO/COPAEN2PDM  |-- LIBDEBITO/COPAEN2P  |-- GXOPERA/OPAGO3P  |-- GXOPERA/COPAEN2PHS |-- Acreditaciones por  BNF a Entidades con cuenta en BNF                     |
|--COMCL146    |-- LIBDEBITO/OPAGO3TCDM  |-- LIBDEBITO/OPAGO3TC  |-- GXOPERA/OPAGO3TC |-- GXOPERA/OPAGO3TCH  |-- Compensaci?n entre entidades con cuenta en BNF                            |
|--COMCL146    |-- LIBDEBITO/OPAGO5PDM   |-- LIBDEBITO/OPAGO5P   |-- GXOPERA/OPAGO5P  |-- GXOPERA/OPAGO5PH   |-- Archivo de pago a Comercios BNF por transacciones de Red de Pagos (CNB)   |
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM GXOPERA.OPAGO3P WHERE BNFFECOM = '20231023';
SELECT * FROM GXOPERA.COPAEN2PHS WHERE BNFFECOM = '20231023';
-----------------------------------------------------------------------------------
SELECT * FROM GXOPERA.OPAGO3TC WHERE TCFECOM = '20230526';
SELECT * FROM GXOPERA.OPAGO3TCH WHERE TCFECOM = '20230526';
-----------------------------------------------------------------------------------
SELECT * FROM GXOPERA.OPAGO5P WHERE PGFECOM5 = '20230526';
SELECT * FROM GXOPERA.OPAGO5PH WHERE PGFECOM5 = '20230526';
-----------------------------------------------------------------------------------
SELECT PGFCOM, PGCMOV COD, PGDESC DESCRIPCION, PGTIPO TIPO, SUM(PGIMPO) IMPORTE
FROM GXOPERA.OPAGO0P
GROUP BY PGFCOM, PGCMOV, PGDESC, PGTIPO
ORDER BY 1;
SELECT * FROM GXOPERA.OPAGO0PH O0P WHERE O0P.PGIDTR='231220526208'
----------------red de pagos bnf
select * from GXOPERA.OPAGO3P;
--DELETE from GXOPERA.OPAGO3P WHERE BNFFEPRO='20230112';
select * from GXOPERA.COPAEN2PHS where BNFFECOM>='20231220' AND BNFIDTRN='231220526208';
--delete FROM GXOPERA.COPAEN2PHS where BNFFECOM='20230124';

select * from ADOLFOLIB.OPAGO3P;
-------------------------------------
select * from GXOPERA.OPAGO3TC;
--DELETE FROM GXOPERA.OPAGO3TC WHERE TCFEPRO='20230112';
select * from GXOPERA.OPAGO3TCH tc where TCFECOM='20231220' AND tc.TCIDTRN='231220526208';
--delete FROM GXOPERA.OPAGO3TCH where TCFECOM='20230314';

select * from ADOLFOLIB.OPAGO3TC;

select * from GXOPERA.OPAGO5P;
--DELETE FROM GXOPERA.OPAGO5P WHERE PGFECOM5='20230112';
select * from GXOPERA.OPAGO5PH where PGFECOM5>='20231220' AND PGIDTRN5='231220526208';
--delete FROM GXOPERA.OPAGO5PH where PGFECOM5='20230124';

select * from ADOLFOLIB.OPAGO5P;
/*CASO NO CARGA OPAGO3P*/
select * from gxopera.opmovi where opfecom = '20230526' and optiptar = 'DEB'
and (OPCOMER LIKE '80%' OR OPCOMER LIKE '90%')
and (OPCODTRN = '011000' or OPCODTRN = '012000' or OPCODTRN = '013000');
---GENEXUS EVO 2 Clearing Repuesto / Prepagbnf2014 volver a correr
--comentar tal cual abajo
/*//Parm(&entidad, &refech);

&entidad = ask('Entidad');==002
&refech  = ask('Fecha');==20230526*/
/*-----------------------------------------------------------------------------------*/
/*para ver los montos creditos y debitos caso bnf de comercio que no est? en el excel pero si en el registro enviado
por ddm tarea http://10.1.254.18/issues/47891*/
/*bk previo antes de cada trabajo*/
select PGTIPO5, sum(pgimpor5) from GXOPERA.OPAGO5PH where PGFECOM5>='20230321'--and PGCOMER5='8605686'
GROUP BY PGTIPO5;
/*verificar monto directo en opmovi*/
SELECT sum(opmonto), count(*) from GXOPERA.opmovi where OPCODTRN='014000' and substr(OPTARJ, 1, 6)='703002' and OPFECOM='20230321';
/*sentencias para regularizar*/
/*se ajusta el monto del totalizador(final de la tabla) tiene que coincidir D con C*/
UPDATE GXOPERA.OPAGO5PH set pgimpor5='42242818' WHERE PGCOMER5='4500001' and PGFECOM5>='20230321'; --esos son los comercios que tienen cuenta en bnf
/*se elimina el comercio que no tiene que estar*/
DELETE from GXOPERA.OPAGO5PH where PGFECOM5>='20230321' and PGCOMER5='8605686';
/*luego se pasa a un axiliar y se vuelve a enviar el agendado*/
/*-----------------------------------------------------------------------------------*/
/*-----inofo-----------*/
--ddms afectados
--LIBDEBITO/COPAEN2PDM -- OPAGO3P
--LIBDEBITO/OPAGO3TCDM --OPAGO3TC
--LIBDEBITO/OPAGO5PDM -- OPAGO5P
/*La conexi?n utiliza el puerto 5246 del sistema local. La conexi?n utiliza la direcci?n IP 10.1.254.233,
puerto 446 del comserver y el ID de usuario BEPSA en el sistema remoto. Ahora se cambi? y se apunta directo a
as_bnf '192.168.0.2' puerto 446*/
---------------------------------------------------------------------------------------------------------------------------
--Para cuando Rolando de BNF reclame diferencia
--DIFERENCIAS ENTRE DETALLE DE MOVIMIENTOS RED DE PAGOS 31/08/2023 Y ARCHIVO DEPOSITADO EN EL SERVIDOR FTP
/*-- Ver control CNB para dividir despues cnb cnb cnb  si pasa  30.000*/
select count(*),
       lfcotr, sum(limpgs) from libdebito.drconbep where lfcotr >='20230320' and lcodtr='014000' and lesttr='A' and lcretr='00' group by lfcotr;
-- BNF SOLICITA EXCEL REPORTE INCOMPLETO DE TRX POR CANT DE LINEAS EN EXCEL GENERADO POR CLEARING
Select substr(OPIDTRA, 5, 4) "Secu", (substr(OPFEREA, 7, 2)||'/'
||substr(OPFEREA, 5, 2)||'/'||substr(OPFEREA, 1, 4)) "F.Real",
substr(OPFECOM, 7, 2)||'/'||substr(OPFECOM, 5, 2)
||'/'||substr(OPFECOM, 1, 4) "F.Comercial",
substr(digits(OPHOTRN), 3, 2)||':'
||substr(digits(OPHOTRN), 5, 2)||':'
||substr(digits(OPHOTRN), 7, 2) as "Hora",
substr(optarj,1,6)||'XXXXXX'
||substr(optarj,13,4) "Nro.Tarjeta",opcomer "Comercio",
opmonto "I.Compra", opcomi "Comisi?n", opcoment "Com.Entidad",
opivaent "IVA s/C.Ent", opcombps "Com.Bepsa",
opivabps "IVA s/C.Bps", opmonto "Neto", opcodaut
"Cod.Aut.", substr(opidtra,1,8) "Origen"
from gxopera.opmovi where opfecom = '20231213'
and substr(opidtra,1,1) <> 'T'
and OPTIPTAR = 'DEB'
and opcodtrn = '014000' -- Adelanto CNB
and SUBSTR(OPCOMER,1,2) = '86'
and opcomer not in ('8604532')
and substr(optarj,1,6) = '703002'
order by opfecom, opcomer, optarj;
------kb clearing repuesto, programa,RAdeEfECNB y PclerCobSerRpt, linea 67 | "+&REFECH+"RdetalAdeEfectivoCNBXLS.xls"
--viejo
Select substr(OPIDTRA, 5, 4) "Secu", (substr(OPFEREA, 7, 2)||'/'
||substr(OPFEREA, 5, 2)||'/'||substr(OPFEREA, 1, 4)) "F.Real",
substr(OPFECOM, 7, 2)||'/'||substr(OPFECOM, 5, 2)
||'/'||substr(OPFECOM, 1, 4) "F.Comercial",
substr(digits(OPHOTRN), 3, 2)||':'
||substr(digits(OPHOTRN), 5, 2)||':'
||substr(digits(OPHOTRN), 7, 2) as "Hora",
substr(optarj,1,6)||'XXXXXX'
||substr(optarj,13,4) "Nro.Tarjeta",opcomer "Comercio",
opmonto "I.Compra", opcomi "Comisi?n", opcoment "Com.Entidad",
opivaent "IVA s/C.Ent", opcombps "Com.Bepsa",
opivabps "IVA s/C.Bps", opmonto "Neto", opcodaut
"Cod.Aut.", substr(opidtra,1,8) "Origen"
from gxopera.opmovi where opfecom = '20231213'
and substr(opidtra,1,1) <> 'T'
and OPTIPTAR = 'DEB'
and opcodtrn = '014000'  -- Adelanto CNB
and SUBSTR(OPCOMER,1,2) = '86'
order by opfecom, opcomer, optarj;
/* formato de la RED DE PAGOS DINELCO.
//------------------------------------------------------------------------------------------------------------------------------------------------------------//
// SECU  | FREAL | FCOMERCIAL | HORA  | TARJETA | COMERCIO | ICOMPRA  | COMISION | COMENTIDAD | IVAENTIDAD | COMBEPSA | IVABPS   | NETO     | CODAUT | ORIGEN //
// Texto | Texto | Texto      | Texto | Texto   | Texto    | Num?rico | Num?rico | Num?rico   | Num?rico   | Num?rico | Num?rico | Num?rico | Texto  | Texto  //
//-----------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*97 al 93 .xls, quitar desimales nombre: 20230324RdetalAdeEfectivoCNBXLS.xls*/
---------------------------------------------------------------------------------------------------------------------------
/*GXFINDTA.TCLCSP
GXFINDTA.TCLCPC
GXFINDTA.TCLTPC
Esos son las tablas que indican el clearing RI. Que llama a los main para la carga de las comisiones
CSP es la cabecera y CPC detalle Osea clearing RI se carga por pantalla, y en ella se va marcando cada proceso que ya se " comisiono" osea,
que todos los servicios estan por separado "La idea es que clearing RI sea un poco m?s independiente y se pueda correr solo el servicio necesario"
Entonces esas son las tablas que carga y deja registro "que y en donde mismo se encuentra el procedimiento de clearing" TCLTPC es la carga
temporalAutorizador carga TSWAUT y de all? se carga el temporal primero "revisiones y control" y luego carga TCLMOV
Todo esto tambien dentro del proceso clearing y estan especificados en las tablas mencionadas anteriormente */
---------------------------------------------------------------------------------------------------------------------------
/*Carga DDM OPAGO5P*/
Select '459', movidlt, '001',  year(current date)||substr(digits(month(current date)), 9, 2)||substr(digits(day(current date)), 9, 2), year(current date)||substr(digits(month(current date)), 9, 2)||substr(digits(day(current date)), 9, 2),
movfecliq, 'C',(case when movtpbcc = 'CC' then 0 else 1 end),movctbcc, sum(movneto),substr(movdeno, 1, 30), substr(movdeno, 1, 30),'', movcomer, year(current date)||substr(digits(month(current date)), 9, 2)||substr(digits(day(current date)), 9, 2), current time, current user
from gxfindta.tclmov a where movfecliq = '20230927' and sercodi = 'REDPAG' and movcdbcc = 100204
group by movidlt, movfecliq, movtpbcc, movctbcc, substr(movdeno, 1, 30), movcomer
union
Select '959', substr(digits(year(current date)), 9, 2)||substr(digits(month(current date)), 9, 2)||substr(digits(day(current date)), 9, 2)||'039000','001',  year(current date)||substr(digits(month(current date)), 9, 2)||substr(digits(day(current date)), 9, 2), year(current date)||substr(digits(month(current date)), 9, 2)||substr(digits(day(current date)), 9, 2),
(Select fecant from gxfindta.tclfec where fecid = '002'), 'D', adticta, adnumcta,(Select sum(movneto) from gxfindta.tclmov where movfecliq = '20230927' and sercodi = 'REDPAG' and movcdbcc = 100204), codeno, codeno, '', cocomer,
year(current date)||substr(digits(month(current date)), 9, 2)||substr(digits(day(current date)), 9, 2),current time, current user
from gxbdbps.comaeaf
where cocomer = '4500001';
-------------------------------------------------------------------------
/*Generaci?n de Debito a Emisores con cuenta en COntinental*/
sELECT MVFEPRO, CMCODIG, SUM(MVIMPO2)FROM GXBDBPS.TMOVIAF WHERE MVEMISO = '021' AND mvfepro = '20221129' and mvcodre = 0 and
CMCODIG IN ( '005','010','020','040','042','091') GROUP BY MVFEPRO, CMCODIG
UNION
SELECT CUFECOM, CMCODIG, SUM(CUIMPOR) FROM GXBDBPS.TCUOTAF WHERE CUEMISO = '021' AND CUFECOM = '20221129' AND
CMCODIG IN ('006','007') GROUP BY  CUFECOM, CMCODIG;

SELECT MVFEPRO , COUNT(*), SUM(MVIMPO2) AS Total, CMCODIG FROM GXBDBPS.TMOVIAF t WHERE MVEMISO= '183' AND MVCODRE =0
AND MVFEPRO = '20221104'AND MVCODCO>'0100030' and MVCODCO < '9200000'
AND CMCODIG in('005' , '010' ,'020' , '040', '042', '091')GROUP BY MVFEPRO,MVEMISO, CMCODIG ;
--- arroja un valor en fecha comercial 20221107 - 93.614.477 gs
SELECT * FROM GXBDBPS.TMOVIAF t WHERE MVEMISO= '183'AND MVCODCO>'0100030' and MVCODCO < '9200000'AND MVCODRE =0
AND MVFEPRO = '20221104' --AND MVCODSC <> '000' ---
AND CMCODIG in('005' , '010' ,'020' , '040', '042', '091'); --replica del de arriba

SELECT * FROM GXBDBPS.TCUOTAF t --transacciones a cuotas
WHERE CUFECOM = '20221104'
AND CUEMISO = '183'AND CUCODCO>'0100030' AND CUCODCO < '9200000'
AND CMCODIG IN('006', '007')
AND CUSTATS <> 'R'; --para este NO arroja resultados en esa fecha comercial

SELECT * FROM GXBDBPS.THMOVAF t--- HISTORICO DE MOVIMIENTOS
WHERE HMFEPRO = '20221104'AND HMCODRE = 0 AND HMEMISO= '183'AND HMCODCO>'0100030' and HMCODCO< '9200000'
AND HMCODIG IN ('005' , '010' ,'020' , '040', '042', '091') ; --REPLICA DEL DE ABAJO

SELECT HMFEPRO , COUNT(*), SUM(HMIMPO2) AS TOTAL FROM GXBDBPS.THMOVAF t--- HISTORICO DE MOVIMIENTOS
WHERE HMFEPRO = '20221104'
AND HMCODRE = 0AND HMEMISO= '183'AND HMCODCO>'0100030' and HMCODCO< '9200000'
AND HMCODIG IN ('005' , '010' ,'020' , '040', '042', '091')
GROUP BY HMFEPRO , HMEMISO ; ---NO se encuentran transacciones en el hist?rico, todas las trx est?n en TMOVIAF

--Para verificar lo que se carg? en transmisiones, filtrar por el cocomer y fecha proc
Select *;
--deletefrom gxfindta.tclimb where imbfch = '20221104' AND IMBIDOP= 223080074500189; --Imputaciones de pago
--Select *
--deletefrom gxopera.oplicre where opcrefcom = '20221104' AND OPCRECOM= '4500189';
--------------------------------------------------------------------------------------------------------------
--Seg?n lo acordado, se provee los querys necesarios para el repair y para la generaci?n del reporte.
/*##PAGO RETAIL CADA 48 HS. POR ACREDITACIONES BATCH##*/

--Repair(Ejecutar el 26/11/2022 luego del proceso New Clearing)

/*RETIENE IMPUTACIONES*/
Select * from gxfindta.tclimb where IMBCLI =10937 and imbfch = '20221125' and imbests = 'PE';
Update gxfindta.tclimb set imbests = 'IR', imbobs = 'IMPUTACION RETENIDA' where IMBCLI =10937 and imbfch = '20221125' and imbests = 'PE';

/*Query para generaci?n de reporte luego de ejecuci?n del repair*/
Select IMBIDOP nro_lote, imblot lote_impu, imbtip tipo_ope, imbser servicio, imbpre prestacion, imbbco bco_comercio, imbbpa bco_pagador, substr(IMBIDOP,9,7) comercio,
imbcli cliente,imbsuc sucursal, sucdencom denominancion,imbfch fecha_proceso, imbimpn neto,  imbests estado, imbobs mensaje
from gxfindta.tclimb  inner join GXFINDTA.tcmsuc on imbcli = cliclicod and imbsuc = sucsuccod where imbfch >= '20221125' and IMBCLI =10937;
--Repair(Ejecutar el 29/11/2022 luego del proceso New Clearing)

/*HABILITA IMPUTACI?N*/
Select * from gxfindta.tclimb where IMBCLI =10937 and imbfch = '20221125' and imbests = 'IR';
Update gxfindta.tclimb set imbests = 'PE', imbobs = 'PENDIENTE DE IMPUTACION' where IMBCLI =10937 and imbfch = '20221125' and imbests = 'IR';

/*RETIENE IMPUTACIONES*/
Select * from gxfindta.tclimb where IMBCLI =10937 and imbfch = '20221128' and imbests = 'PE';
Update gxfindta.tclimb set imbests = 'IR', imbobs = 'IMPUTACION RETENIDA' where IMBCLI =10937 and imbfch = '20221128' and imbests = 'PE';

/*Query para generaci?n de reporte luego de ejecuci?n del repair*/
Select IMBIDOP nro_lote, imblot lote_impu, imbtip tipo_ope, imbser servicio, imbpre prestacion, imbbco bco_comercio, imbbpa bco_pagador, substr(IMBIDOP,9,7) comercio,
imbcli cliente,imbsuc sucursal, sucdencom denominancion,imbfch fecha_proceso, imbimpn neto,  imbests estado, imbobs mensaje
from gxfindta.tclimb  inner join GXFINDTA.tcmsuc on imbcli = cliclicod and imbsuc = sucsuccod where imbfch >= '20221125' and IMBCLI =10937;
--Repair(Ejecutar el 30/11/2022 luego del proceso New Clearing)

/*HABILITA IMPUTACI?N*/
Select * from gxfindta.tclimb where IMBCLI =10937 and imbfch = '20221128' and imbests = 'IR';
Update gxfindta.tclimb set imbests = 'PE', imbobs = 'PENDIENTE DE IMPUTACION' where IMBCLI =10937 and imbfch = '20221128' and imbests = 'IR';

/*RETIENE IMPUTACIONES*/
Select * from gxfindta.tclimb where IMBCLI =10937 and imbfch = '20221129' and imbests = 'PE';
Update gxfindta.tclimb set imbests = 'IR', imbobs = 'IMPUTACION RETENIDA' where IMBCLI =10937 and imbfch = '20221129' and imbests = 'PE';

/*Query para generaci?n de reporte luego de ejecuci?n del repair*/
Select IMBIDOP nro_lote, imblot lote_impu, imbtip tipo_ope, imbser servicio, imbpre prestacion, imbbco bco_comercio, imbbpa bco_pagador, substr(IMBIDOP,9,7) comercio,
imbcli cliente,imbsuc sucursal, sucdencom denominancion,imbfch fecha_proceso, imbimpn neto,  imbests estado, imbobs mensaje
from gxfindta.tclimb  inner join GXFINDTA.tcmsuc on imbcli = cliclicod and imbsuc = sucsuccod where imbfch >= '20221128' and IMBCLI =10937;
--Esta misma l?gica se debe mantener para los d?as posteriores, hasta que se tenga una modificaci?n de las aplicaciones propiamente

--tabla para ver el CIERRE
select * from gxbdbps.tlogsaf where LSFECHA = '20230325' AND LSTIPRO = 'CIER' order by LSHORA desc;---VERIFICAR LOGS PRODUCCION
--tabla para ver el clearing
select * from gxbdbps.tlogsaf where lstipro= 'CLEA' and lsfecha= '20220119' order by lshora desc;
------------------------------------
---cambiar fecha para que lo tome cuponamiento
update GXBDBPS.tswaut
set AUTFECINC = '2023-01-03 00:00:00.000'
where AUTFECINC = '2022-12-30 00:00:00.000';
------------------------------------
select * from GXBDBPS.gferiaf WHERE FEFERIA='20230227';---Tabla de feriados
select * from gxtrjdta.tdscal where CALFECHA>'20230000';--tablas de dias de reing.
SELECT * FROM PUBLIC.FERIADO WHERE FECHA>='2023-03-28'; --EMPES
----------------------------------------------------------------------------------------------
--codigo 86 and 81
Select opferea, opfecom, opliqde, sum(opmonto) from gxopera.opmovi where opcomer = '8600240' and opliqde = '20221202' group by opferea, opfecom, opliqde; --detalle de movimiento
Select * from gxopera.flicom1 where licomer = '8600240' and lifechd = '20221202'; --Liquidaci?n
Select * from gxopera.opago5ph where pgcomer5 = '8600240' and pgfecom5 = '20221202'; -- orden de pago en BNF
-----------------------------------------------------------------------------------------------
--no llego a correr instructivo y se vac?a
SELECT --SUM(INSFACTOT)
* FROM GXOPERA.TRXINST where INSFECARGA = '20230112' AND INSTATUS='P';
DELETE FROM GXOPERA.TRXINST where INSFECARGA = '20230112' AND INSTATUS='P';
----------------------------------------------------------------------------------------------
-------------------------/*caso tigo-tigo money*/-------------------------------------------------------
SELECT sum(LIMPGS), LFECTR, LFCOTR, LENEMI, LCODTR, substr(LIDTRA, 1,1) FROM LIBDEBITO.DRCONBEP --WHERE
GROUP BY LFECTR, LFCOTR, LENEMI, LCODTR, substr(LIDTRA, 1,1);
-----------------------------------------------------------------------------------------------------
SELECT sum(OPMONTO), COUNT(*), OPFECOM, OPFEREA, OPCODTRN, OPENEMI FROM GXOPERA.OPMOVI WHERE OPFECOM ='20230117' AND OPENEMI IN (152, 581) AND OPADMIN<>581
GROUP BY OPFECOM, OPFEREA, OPCODTRN, OPENEMI;
-----------------------------------------------------------------------------------------------------
SELECT sum(OPMONTO), COUNT(*), OPFECOM, OPFEREA, OPCODTRN, OPENEMI, OPSTATUS FROM GXOPERA.OPMOVI WHERE OPNOREF;
SELECT * FROM LIBDEBITO.DRCONBEP WHERE LFECTR='20230118' AND LFCOTR='20230118' AND LENEMI='581'
/*SELECT sum(LIMPGS), COUNT(*), LFECTR, LFCOTR, LENEMI, LCODTR, substr(LIDTRA, 1,1) FROM LIBDEBITO.DRCONBEP WHERE LFECTR>='20230117'*/AND LERRNB IN
('301841125145',
'301841125165');--GROUP BY LFECTR, LFCOTR, LENEMI, LCODTR, substr(LIDTRA, 1,1);
GROUP BY OPFECOM, OPFEREA, OPCODTRN, OPENEMI,OPSTATUS;
-----------------------------------------------------------------------------------------------------
 --DWAREBNF --  PROMOBNF = ENVIO ARCHIVO DATAWARE PARA EL BANCO
--CALL PGM(LIBDEBITO/PROMOBNF)
  /*  CPYF  FROMFILE(GXDEBITO/PROMOBNF) TOFILE(GXDEBITO/PROMOBNFDM) MBROPT(*REPLACE) CRTFILE(*NO) FROMFILE(LIBDEBITO/MOVDINEL)
TOFILE(LIBDEBITO/MOVDINEDDM) MBROPT(*ADD) CRTFILE(*YES) */
SELECT * FROM GXDEBITO.PROMOBNF;
SELECT * FROM LIBDEBITO.MOVDINEL;
-----------------------------------------------------------------------------------------------------
--caso clearing
---VER SI CARGA OPMOVI
select count(*) from gxopera.opmovi
where opfecom='20230327';
---VER LO QUE HAY QUE TIEN QUE CARAR
select count(*) from libdebito.drconbep
where lfcotr='20230327' and LCRETR='00'
and LESTTR='A' and lcodtr IN
('000054', '011000', '012000', '013000', '014000', '000052','370000', '380000', '390000','011000','012000','013000',
'015000','000054','000052','567101','567102','000072','530004','340000','000048','000049','000050','710000');
------------------------------------------------------
--tarea http://redmine2.bepsa.com.py/issues/45684
/*parar cerrar clearing*/
UPDATE GXFINDTA.TCLPFC SET PFCVALCHR = 'N'WHERE PFCIDPARM = 'CIERRECLEARING';
/*para reprocesar clearing batch reing*/
SELECT * FROM GXFINDTA.TCLFEC WHERE fecid = 2;
UPDATE GXFINDTA.TCLFEC SET FECANT = '20230207', FECPRO = '20230208', FECSIG = '20230209' WHERE FECID = '002';
-------------------------------------------------------------------------------------------------------------------
/*parar cerrar clearing*/
UPDATE GXFINDTA.TCLPFC SET PFCVALCHR = 'N'WHERE PFCIDPARM = 'CIERRECLEARING';
/*para reprocesar clearing batch reing*/
SELECT * FROM GXFINDTA.TCLFEC WHERE fecid = 2;
UPDATE GXFINDTA.TCLFEC SET FECANT = '20230207', FECPRO = '20230208', FECSIG = '20230209' WHERE FECID = '002';
-------------------------------------------------------------------------------------------------------------------
SELECT * FROM GXFINDTA.TCLCPC WHERE CPCFEC ='20230207';
-------------------------------------------------------------------------------------------------------------------
UPDATE GXFINDTA.TCLCPC SET CPCEST = 'P',CPCOBS = '', CPCDESC = ''
WHERE CPCFEC = '20230208' AND   PRCCOD = 'PCLR001     ' AND   CPCPARM = 'ATM       ';
-------------------------------------------------------------------------------------------------------------------
UPDATE GXFINDTA.TCLCPC SET CPCEST = 'P', CPCOBS = '', CPCDESC = ''
WHERE CPCFEC = '20230208' AND   PRCCOD = 'PCLR007     ' AND   CPCPARM = 'ADELANTO  ';
-------------------------------------------------------------------------------------------------------------------
SELECT * FROM GXFINDTA.TCLCSP WHERE CPCFEC ='20230206';
-------------------------------------------------------------------------------------------------------------------
UPDATE GXFINDTA.TCLCSP SET CSPEST = 'P', CSPOBS = ''
WHERE CPCFEC = '20230208' AND   PRCCOD = 'PCLR001     ' AND   CPCPARM = 'ATM       ' AND   CSPCOD = 'PCLR003     'AND   CSPSECU = 1;
-------------------------------------------------------------------------------------------------------------------
UPDATE GXFINDTA.TCLCSP SET CSPEST = 'P', CSPOBS = ''
WHERE CPCFEC = '20230208' AND   PRCCOD = 'PCLR007     ' AND   CPCPARM = 'ADELANTO  ' AND   CSPCOD = 'PCLR167     'AND   CSPSECU = 1;
-------------------------------------------------------------------------------------------------------------------
UPDATE GXFINDTA.TCLCSP SET CSPEST = 'P', CSPOBS = ''
WHERE CPCFEC = '20230208' AND   PRCCOD = 'PCLR007     ' AND   CPCPARM = 'ADELANTO  ' AND   CSPCOD = 'PCLR167     ' AND   CSPSECU = 2;
-------------------------------------------------------------------------------------------------------------------
UPDATE GXFINDTA.TCLCSP SET CSPEST = 'P', CSPOBS = ''
WHERE CPCFEC = '20230208' AND   PRCCOD = 'PCLR007     ' AND   CPCPARM = 'ADELANTO  ' AND   CSPCOD = 'PCLR167     ' AND   CSPSECU = 3;
-------------------------------------------------------------------------------------------------------------------
UPDATE GXFINDTA.TCLCSP SET CSPEST = 'P',CSPOBS = ''
WHERE CPCFEC = '20230208' AND   PRCCOD = 'PCLR007     ' AND   CPCPARM = 'ADELANTO  ' AND   CSPCOD = 'PCLR167     ' AND   CSPSECU = 4;
-------------------------------------------------------------------------------------------------------------------
UPDATE GXFINDTA.TCLCSP SET CSPEST = 'P', CSPOBS = ''
WHERE CPCFEC = '20230208' AND   PRCCOD = 'PCLR007     ' AND   CPCPARM = 'ADELANTO  ' AND   CSPCOD = 'PCLR167     ' AND   CSPSECU = 5;
-------------------------------------------------------------------------------------------------------------------
UPDATE GXFINDTA.TCLCSP SET CSPEST = 'P', CSPOBS = ''
WHERE CPCFEC = '20230208' AND   PRCCOD = 'PCLR007     ' AND   CPCPARM = 'ADELANTO  ' AND   CSPCOD = 'PCLR167     ' AND   CSPSECU = 6;
-------------------------------------------------------------------------------------------------------------------
UPDATE GXFINDTA.TCLCSP SET CSPEST = 'P', CSPOBS = ''
WHERE CPCFEC = '20230208' AND   PRCCOD = 'PCLR007     ' AND   CPCPARM = 'ADELANTO  ' AND   CSPCOD = 'PCLR167     ' AND   CSPSECU = 7;
-------------------------------------------------------------------------------------------------------------------
UPDATE GXFINDTA.TCLCSP SET CSPEST = 'P', CSPOBS = ''
WHERE CPCFEC = '20230208' AND   PRCCOD = 'PCLR007     ' AND   CPCPARM = 'ADELANTO  ' AND   CSPCOD = 'PCLR167     ' AND   CSPSECU = 8;
-------------------------------------------------------------------------------------------------------------------
/*para poner en error para marcar hasta donde procesar*/
UPDATE GXFINDTA.TCLCPC SET CPCEST='C' WHERE (CPCFEC='20230206' AND PRCCOD='PCLR007     ' AND CPCPARM='VTAMIN    ' AND CPCSECU=13 );
UPDATE GXFINDTA.TCLCSP SET CSPEST='C' WHERE (CPCFEC='20230206' AND PRCCOD='PCLR007     ' AND CPCPARM='VTAMIN    ' AND CSPCOD='PCLR015     ' AND CSPSECU=1 AND CSPPARM='VTEP      ');
-------------------------------------------------------------------------------------------------------------------
---------------------------------------703020 - 703020 COMPRA
Select opnroref from gxopera.opliqui where opcodbco = 57 and substr(opcampoa,1,6) = '703002' and substr(opcampoa,41,8) = '20230207' and opstat = '00' AND OPSTATOB='00'
except
Select tsbnref from gxfindta.tcltsb where tsbfpro = '20230207';

-----------------------------------------------------------------------------------------------
SELECT LERRNB, LFECTR FROM LIBDEBITO.DRCONBEP WHERE LFECTR>='20230101' AND LCRETR='00' AND LESTTR='A' AND LBINPR='703020' AND LCODTR='000054'
EXCEPT
SELECT OPNOREF, OPFEREA FROM GXOPERA.OPMOVI WHERE OPFEREA>='20230101'; --AND substr(OPCAMPOA, 1, 6 )='703020'--contra opliqui, opfechliq

SELECT OPNCOMER FROM GXOPERA.OPLIQUI WHERE OPNROREF IN ('303748535330','303548126900');

----OPLIQUI QUE NO EST?N EN TCLTSB
Select * from gxopera.opliqui where opcodbco = 57 and substr(opcampoa,1,6) = '703002' and substr(opcampoa,41,8) = '20230206' and opstat = '00' --and opstatob = '00'?
and opnroref not in (Select tsbnref from gxfindta.tcltsb where tsbfpro = '20230206');
------------------------------
/* NUMERO DE CUENTA NULO- se elimina del tablero la CUENTA D?BITO*/
Select * from gxfindta.tcltsb where tsbcoco = '0705590'and tsbtpop = '01' and tsbbacr = 1007 and tsbesta <> 'AC' and tsbtpoacr = 'O'
and tsbctde = ''; --92 REGISTROS
Update gxfindta.tcltsb set tsbctde = '0102184061', tsbesta = 'PE', tsbmotivo = 'REDMINE #47207' where tsbcoco = '0705590'
and tsbtpop = '01' and tsbbacr = 1007 and tsbesta <> 'AC' and tsbtpoacr = 'O';
---------------------------------
/*Imputaci?n indebida comercios BBVA*/
Select * from gxfindta.tcltsb where tsbnref in ('301139503566','301139512151','301139528759','301139543782','301139569892');
-----------------------------------
/* Para verificar los codigos de transaccion del anterior con los servicios (000054 = 'COMPRA')*/
SELECT * FROM GXFINDTA.TCLPRE;
Select txctrx, txdtrx from libdebito.tbctra0p; -- Legacy
Select prematrx, sercodi, precodi, predesc from gxfindta.tclpre where preclea = 'TRA';--Reingenieria
--para lenemi
Select * from gxopera.opentid1;
-----------------------------------
---para traer la cuenta B o Online
SELECT * FROM gxfindta.TCLSCT t WHERE t.SERCODI = 'DEBITOEN' AND t.PRECODI = 'DEEN' AND t.SCTCOBA = 1020 and T.SCTCTAP = 1;
--0104913400    --siempre que sea batch y para en linea 0102184061
-------------
/*objetos para bepsainfo*/
select * from GXBDCON.GXLOFUN where SISCODI='BI';
-----------------------------------------------
/*-- Actualizar fecha de GEMPRAF antes del clearing
UPDATE GXBDBPS.GEMPRAF
SET EMFESIG='20230329',EMFEPRO='20230328',EMFEANT='20230327'
WHERE EMCODIG='001';
-- Actualizar fecha de GEMPRAF despues del clearing
UPDATE GXBDBPS.GEMPRAF
SET EMFESIG='20230328',EMFEPRO='20230327',EMFEANT='20230324'
WHERE EMCODIG='001';
------------------------------------------------------*/
-- Tabla donde se registran los procesos que ser?n ejecutados durante el cierre
SELECT * FROM gxfindta.tclcpc t WHERE t.CPCFEC = '20230601';

-- Tabla  donde se registran los subprocesos que ser?n ejecutados durante el cierre
SELECT * FROM gxfindta.TCLCSP t WHERE t.CPCFEC = '20230531';
--cuando empieza el proceso del cierre vas a encontrar datos en esa tabla con el campo CPEST = 'P', luego va actualizando a 'C' a medida que se vaya completando..
--Movimientos de TC sin valor de renta e ivarenta para rol ISA -- tarea 50628
SELECT
    o3.*,
    (opmonto-opcoment-opcombps-opivaent-opivabps-oprenta-opreiva) neto_opmovi,
    t.MOVNETO ,
    (t.MOVNETO - (opmonto-opcoment-opcombps-opivaent-opivabps-oprenta-opreiva)) diferencia
FROM
    GXOPERA.OPMOVI o3
LEFT JOIN GXFINDTA.TCLMOV t ON
    o3.OPNOREF = t.MOVRRNBEP
WHERE
    o3.OPNOREF IN (
    SELECT
        adq.OPNOREF
    FROM
        GXOPERA.OPMOVI adq
    INNER JOIN GXOPERA.OPMOVI emi ON
        adq.OPNOREF = emi.OPNOREF
    WHERE
        SUBSTRING(adq.OPCOMER , 1, 2) <> '69'
            AND SUBSTRING(emi.OPCOMER , 1, 2) = '69'
                AND adq.OPRENTA = 0
                AND adq.OPREIVA = 0
                AND emi.OPRENTA > 0
                AND emi.OPREIVA > 0
                AND adq.OPFECOM >= '20230426');
/*Validaci?n de retenciones que se volvieron a pagar en linea*/
Select a.movidmov,movrrnbep, movftrx, movneto, rtdnrortam, RTDMONAMRT,RTDMONMOV,tsbnref, tsbimpo, tsbdeme, tsbfege
from gxfindta.tclmov a left join gxfindta.tclrtd b on a.movidmov = b.movidmov
left join gxfindta.tcltsb on movrrnbep = tsbnref where a.movidmov in (
Select movidmov from gxfindta.tclrtd where  RTDFCHCOB = '20230410');
--##### OJO PARA LIQUIDACIONES SIEMPRE FILTRAR DESDE EL ULTIMO D?A DEL MES ANTERIOR Y EL PENULTIMO D?A DEL MES ACUTAL###
/*Verificaci?n de liquidaci?n Vs Declaraci?n impositiva tarea 51915, se agega una linea mas con fecha 29 en la cabezera y en detalle(flicom1)
se cambia la fecha de una de las trx del 26 para que salga con la otra factura lo que corresponde*/
Select * from gxopera.flicom where licomer = '0801505' and lifechd > '20221220';
Select * from gxopera.flicom1 where licomer = '0801505' and lifechd > '20221220';
Select a.*,(licoent+licobps), (liivaent+liivabps) from gxopera.flicom1 a where linrofac in ('10020003914','10020015071') and substr(lifecredi, 1, 6) = '202306';
Select * from contabilid.CCLFACT where lfsitu = 2 and lftpdo = 'LI' and lfcocl = '0802241' and lfnrfa in ('10020070059'),'10020015071');
-- tiene que ser igual al campo LFIMGR las suma de=LICOENT+LICOBPS e igual a LFIMIM=LIIVAENT+LIIVABPS
-------------------------------
/*Validaci?n de retenciones que se volvieron a pagar en linea*/
Select a.movidmov,movrrnbep, movftrx, movneto, rtdnrortam, RTDMONAMRT,RTDMONMOV,tsbnref, tsbimpo, tsbdeme, tsbfege
from gxfindta.tclmov a left join gxfindta.tclrtd b on a.movidmov = b.movidmov
left join gxfindta.tcltsb on movrrnbep = tsbnref where a.movidmov in (
Select movidmov from gxfindta.tclrtd where  RTDFCHCOB = '20230410');
--------------
/*Cambio de Par?metros Continental - configuraci?n del servicio de pago a comercios - disminuir la cantidad de trx a 180 por minuto - tarea 54537*/
SELECT * FROM GXFINDTA.TCLPFD WHERE PFCIDPARM = 'SOCKET_CLEARING' and pfdidgrup = 'REINTENTO';
Update GXFINDTA.TCLPFD set PFDVALCHR2 = '0 */3 * * * *', PFDVALIMP2 = 180, PFDVALFEC2 = '1', PFDVALIMP1 = 300000
WHERE PFCIDPARM = 'SOCKET_CLEARING' and pfdidgrup = 'REINTENTO';
/*Cambio de Par?metros Continental - Aumenta cantidad de Hilos*/
SELECT * FROM GXFINDTA.TCLPFD WHERE PFCIDPARM = 'SOCKET_CLEARING' and pfdidgrup = 'REINTENTO';
Update GXFINDTA.TCLPFD set  PFDVALFEC2 = '3' WHERE PFCIDPARM = 'SOCKET_CLEARING' and pfdidgrup = 'REINTENTO';
/*Cambio de Par?metros Continental - Aumenta cantidad de Hilos*/
SELECT * FROM GXFINDTA.TCLPFD WHERE PFCIDPARM = 'SOCKET_CLEARING' and pfdidgrup = 'REINTENTO';
Update GXFINDTA.TCLPFD set  PFDVALIMP2 = 536 WHERE PFCIDPARM = 'SOCKET_CLEARING' and pfdidgrup = 'REINTENTO';
------
/*An?lsis CICO - 20230728*/
Select cofactu, BS15CODCOM,count(*), sum(opmonto),BS15MONSAL from gxopera.opmovi inner join gxbdbps.comaeaf on opcomer = cocomer inner join libdebito.bst015 on substr(BS15CODCOM,6,7) = cofactu and BS15CODPRO = 'CICOMONEY'
where opfecom between '20230329' and '20230726' and opcodtrn in ('370000','380000','390000')
group by  cofactu, BS15CODCOM, BS15MONSAL;
/*Resumen Anual CICO - Opmovi/Deposito/Otros*/
Select '1-MOVIMIENTO' Operacion,  substr(opferea,1,4) periodo, opcodtrn transaccion, a.cofactu CtaMadre,b.codeno, count(*) cantidad, 0 saldOperativo,
(Case when opcodtrn = '370000' then sum(opmonto) else 0 end )carga, (Case when opcodtrn = '390000' then sum(opmonto) else 0 end ) giro, (Case when opcodtrn = '380000' then sum(opmonto) else 0 end ) retiro, 0 deposito, 0 INSTMANUAL
from gxopera.opmovi inner join gxbdbps.comaeaf a on opcomer= a.cocomer inner join gxbdbps.comaeaf b on a.cofactu = b.cocomer
where a.cofactu = '1000414' and substr(opferea,1,4) ='2023'  and opcodtrn in ('370000','380000','390000')
group by substr(opferea,1,4), opcodtrn, a.cofactu, b.codeno
union
Select '2-DEPOSITO' , substr(depfecha,1,4), 'DEPO', depcom, codeno,count(*),0, 0 , 0, 0 , sum(depmonto), 0
from gxweb.depcico inner join gxbdbps.comaeaf on depcom = cocomer
where depcom = '1000414' and substr(depfecha,1,4) = '2023' and depestado in ('P','L') AND depforpag <> 'IMA'
group by substr(depfecha,1,4), depcom, codeno
UNION
Select  '3-INSTMANUAL', substr(depfecha,1,4),  'IMA', depcom, codeno,count(*),0, 0 , 0, 0 , 0, sum(depmonto)
from gxweb.depcico inner join gxbdbps.comaeaf on depcom = cocomer
where depcom = '1000414' and substr(depfecha,1,4)='2023' and depestado in ('P','L') AND depforpag = 'IMA'
group by substr(depfecha,1,4), depcom, codeno
UNION
Select '4-SALDO', BS15CODPRO,saldoperativo,BS15CODCOM,codeno,0, BS15MONSAL,0,0,0,0,0
from libdebito.bst015 inner join gxbdbps.comaeaf on substr(BS15CODCOM,6,7)= cocomer
where BS15CODCOM like '%1000414%'
order by 4,3,1;
/*=======================================*/
SELECT
    RETID ID_RETENCION,RETFECH FECHA_HORA,RETPROC PROCESO,RETRUCBPS RUC_BEPSA,RETCODEST COD_ESTABLECIMIENTO,RETTIMCOM TIMBRADO,RETPUNEXP PUNTO_EXPEDICION,RETINIVIG INICIO_VIGENCIA_COMPROVANTE,RETSITUA SITUACION_INFORMADO,
    RETRUC RUC_INFOMADO,RETDIGVER DIGITO_VERIFICADOR,RETCODCOM CODIGO_COM,RETCOMNOM NOMBRE_COM,RETCOMDIR DIRECCION_COM,RETFACCOM NRO_FACTURA,RETTIMB TIMBRADO,RETFECFAC FECHA_FACTURA,RETMONTO TOTAL,RETIVA IVA,RETFECHA FECHA_RETENCION,
    RETCANTRAS CANT_TRANSACCIONES,RETMONEDA MONEDA,RETMONBRU MONTO_BURTO,RETCONCEPIVA CONCEPTO_IVA,RETIVAPORC PORCENTAJE_IVA,RETTOTIVA TOTAL_IVA,RETCONCEPREN CONCEPTO_RETENCION,RETRENPORC PORCENTAJE_RENTA,RETTOTREN TOTAL_RENTA,
    RETTOTAL RETENCION_TOTAL,RETUSUPROC USUARIO,RETLOTE LOTE,RETENVIA ENVIADO_SET,RETFECPROC FECHA_PROCESO,RETNROCOMPRO NRO_COMPROBANTE,RETNROCONTROL NRO_CONTROL,RETMENSAJE MENSAJE_PROCESAMIENTO,RETPROCESADO PROCESAMIENTO_SET,RETFECHEM
FROM GXOPERA.RETCOM R
    WHERE RETCODCOM='0703738'; --RETENCIONES QUE SE PRESENTO.

SELECT
    LFCOSU SUCURSAL,LFCMON MONEDA,LFCOBC BANCO,LFNRCH NRO_CHEQUE_DOCUMENT,LFSECU SECUENCIA,LFFEMO FECHA_MOVIM,LFCPBI COMPROBANTE_TICKETS_INI,LFCPBF COMPROBANTE_TICKETS_FIN,LFTPDO TIPO_DOCUMENT,LFNRFA NRO_FACTURA,LFFEFA FECHA_FACTURA_DOCUMENT,
    LFCODO TPO_DOCUMENTO,LFCOCL NRO_CLIENTE,LFTITU CONCEPTO,LFRUCO REG_UNICO_CONTRIBUYENT,LFDIGV DIGITO_VERIFICADOR,LFIMGR MONTO_GRAVADAS,LFIMIM MONTO_IMPUESTOS,LFIMEX MONTO_EXENTAS,LFIMRE MONTO_RETENCION,
    LFSITU SITUAC_1_ACT_2_PAS,LFTIMB NRO_TIMBRADO,LFFVEN F_VTO_TIMBRADO,LFTIPO TIPO_1_FISICO_2_JURIDICO_3_EX,LFCOUS COD_USUARIO,LFFESI FECHA_SISTEMA,LFHOSI HORA_SISTEMA
FROM CONTABILID.CCLFACT C2
    WHERE LFCOCL='0703738';--concepto de venta si lfsitu =2 venta / 1=compra

SELECT
    OPFEREA FEHCAREAL,OPIDTRA IDTRX,SUBSTR(OPTARJ, 1, 6)||'XXXXXX'||SUBSTR(OPTARJ, 13, 4) tarjeta,OPHOTRN HORA,OPNOREF REFERENCIA,OPFECOM F_CHOMERCIAL,OPCOMER COMERCIO,OPCODAUT CODG_AUTORIZACION,OPCODTRN CODG_TRANSACCION,OPCODRES CODG_RESPUESTA,
    OPSTATUS EESTADO,OPMONTO MONTO,OPCOMI COMISION,OPCOMENT COMISION_ENTIDAD,OPCOMBPS COMISION_BEPSA,OPIVAENT IVA_ENTIDAD,OPIVABPS IVA_BEPSA,OPCELU CELULAR,OPENTID ENTIDAD,OPADMIN ENTIDAD_ADM,OPENEMI ENTIDAD_EMISORA,OPTIPTAR TIPO_TARJETA,
    OPUSER USUARIO,OPLIQHA FECHA_LIQ_HASTA,OPNROAS NRO_ASIENTO,OPFECAS FEHCA_ASIENTO,OPLIQDE FEHCA_LIQ_DESDE,OPRENTA RENTA,OPREIVA RENTA_IVA,OPRADOR Operador_Telefonia
FROM GXOPERA.OPMOVI O
    WHERE OPCOMER='0703738';

SELECT
    LCTAOR Cta_Origen,LCTADE Cta_Destino,LNRTAR Numero_Tarjeta,LEXTAR Extension_Tarjeta,LEXPIR Vencimiento_Tarjeta,LIDCOM Codigo_Comercio_BEPSA,LHISOR Historico_Origen,LHISDE Historico_Destino,LBCOCR Banco_Credito_Emisor,LCTACR Cuenta_Banco_Credito,
    LBCODB Banco_Debito, LCTADB Cta_Banco_Debito,LCLEAR Afecta_Cta_Clearing,LFCOTR Fecha_Comercial,LFECTR Fecha_Transaccion,LHORTR Hora_Transacci?n,LFECLQ Fecha_Liq_BEPSA,LFECEN Fecha_Liq_ENTIDAD,LMONTR Moneda_Transacci?n,LIMPGS Importe_Guaranies,
    LIMPDS Importe,LIMPDF Importe_Diferente,LSALTR Saldo_Actual,LDISTR Saldo_Disponible,LMARCA Marca,LCUOTA Cantidad_Cuotas,LIDTRA Identif_Transacci?n,LSTANT STANTransacci?n,LTIPTR Tipo_Transacci?n,LPOSEM POS_EntryMode,LBINPR Bin,LMCCTR Merchant_Category,
    LCOMTR Descripci?n_Despachador,LORITR Origen_Transacci?n,LCODTR Codigo_Transacci?nISO,LCODBC Codigo_Transacci?nBanco,LCAUTR Codigo_Autorizaci?n,LCRETR Codigo_Respuesta,LESTTR Estado,LERRNB Referencia,LEIMP4 Importe_4_SMS,LECA62 CampoISOVisa,
    LCPACE Codigo,LENEMI Entida_Emisora,LCORED Codigo_Red,LCOTEL NumeroTelefono,LACTFJ CodigoActivoFijo,LNFACT NumeroFactura,LNFISC Nro_Legislacion_Fiscal,ENEADM Entidad_Administradora,ENEPRO Entidad_Propietaria,LCODPR Codigo_Procesador,
    LCOPRO Comision_Producto,LCOCOM Comision_Comercio,LCOIVA Porcentaje_IVA,LCOADQ Porcentaje_Adquirencia,LNTOKE Token_PAN,LCVVPRES CVV_Presente,LPINPRES PIN_Presente,LTIPOPER Tipo_Operacion,LPROPI Campo_Propina,LPAGOP Campo_Pago_parcial,LCAMPO04 Campo_4_ISO,
    LCAMPO49 Moneda_Campo4,LCAMPO05 Campo_5_ISO,LCAMPO50 Moneda_Campo5,LCOMPO06 Campo_6_ISO,LCAMPO51 Moneda_Campo6,LCAMPO37 Campo37_RRN,LROL Tipo_Rol,LCAMPO03 Codigo_Proceso,LCAMPO22 POS_Entry_Mode,LCAMPO42 Cod_Com_Original,LCAMPO32 Codigo_Adquirente,
    LCAMPO19 Codigo_Pais_Adqu,LFORPAG FormadePago,LPUNTGEN CantidaddePuntos,LCODPROM CodigoPromocion,LCAMPO44 CampoExtendido,LIDBEPSA RRN_Id_Registro
FROM LIBDEBITO.DRCONBEP D
    WHERE LIDCOM='0703738';

SELECT
    lfectr fecha, lhortr hora, lfcotr fecha_comercial, lidcom comercio, lcomtr denominacion, ltiptr tipo_tarjeta, lenemi emisor, substr(lnrtar, 1, 6)||'XXXXXX'||substr(lnrtar, 12) tarjeta, lcuota nro_cuota, lcodbc marca, limpgs monto, lesttr estado, lcretr retorno
FROM LIBDEBITO.DRCONBEP D
    WHERE D.LIDCOM='0703738' AND D.LCRETR<>'00';--no aprobadas en drconbep

/*desde tomcat 9 para contra la SET -- Retenciones SET*/
  -- wget https://marangatu.set.gov.py/eset-restful/retencionesMasivas/probarConectividad
--------------------------------------------------------------
/*Actualizaci?n de formato de cuenta para pagos en dolares*/
Select * from gxfindta.tcllod where LOCFPRO = '20230818' and loccoco = '4500123' and LODMONORI = 840;
Update gxfindta.tcllod set LODNRCT = '0119000470' where LOCFPRO = '20230818' and loccoco = '4500123' and LODMONORI = 840;
----------------------------
/*Habilita reintento para casos de ID TRANSFERENCIA EXISTENTE*/
SELECT * FROM GXFINDTA.TCLPFD WHERE PFCIDPARM = 'RNTACCPRTD' and pfdidgrup = 'RTNDTLITEM' AND PFDSECU >= 14;
INSERT INTO GXFINDTA.TCLPFD
(PFCIDPARM,PFDIDGRUP,PFDSECU,PFDVALCHR1,PFDDSCCHR1,PFDVALCHR2,PFDDSCCHR2,PFDVALIMP1,PFDDSCIMP1,PFDVALIMP2,PFDDSCIMP2,PFDVALFEC1,PFDDSCFEC1,PFDVALFEC2,PFDDSCFEC2,PFDUSULSUP,PFDFECLSUP)
VALUES
('RNTACCPRTD', 'RTNDTLITEM', 15, '040', '', '' , '' , 0.00, '0', 0.00, '0', '15/09/23', '15/09/23', '15/09/23','15/09/23',current user,current timestamp);
--#ANULAR FACTURAS DE LIQUIDACIONES DE COMERCIOS PARA VOLVER A PROCESAR
/*#64653 - Anulaci?n de Facturaci?n Octubre 2023*/
Select * from gxopera.flicom where licodtr = '000054' and lifechd between '20230928' and '20231030' and linro >= 10020069272;
Update gxopera.flicom set linro = 0, linrofin = 0 where licodtr = '000054' and lifechd between '20230928' and '20231030' and linro >= 10020069272;

Select min(linrofac), max(linrofac)from gxopera.flicom1 where licodtr = '000054' and lifechd between '20230928' and '20231030' and linrofac >= 10020069272;
Update gxopera.flicom1 set linrofac = 0 where licodtr = '000054' and lifechd between '20230928' and '20231030' and linrofac >= 10020069272;

Select * from gxopera.factura2 where factura2timbrado = '16444256' and factura2tipo = 'LIQ';
update gxopera.factura2 set factura2nro = 10020069271 where factura2timbrado = '16444256' and factura2tipo = 'LIQ';

Select * from gxopera.flicom2 where lifacnro >= 10020069272 and lifacfed >= '20230929';
Delete from gxopera.flicom2 where lifacnro >= 10020069272 and lifacfed >= '20230929';
-----
---elimiar de retenciones y pagar
/*Actualiza Importe Neto en Imputaciones*/
Select * from gxfindta.tclimb where imbfch = '20231101' and imbidop = 233050010701125;
Update gxfindta.tclimb set imbimpn = imbimpn+39389 where imbfch = '20231101' and imbidop = 233050010701125;
/*Anula el registro del m?dulo de Retenciones*/
Select * from gxfindta.tclrtc where rtccomerc = '0701125' and rtcidreten = 6314;
Update gxfindta.tclrtc set rtcestado = 'A', rtcobser = '329339858745 Retencion a pedido de contracargos - Anulaci?n #'  where rtccomerc = '0701125' and rtcidreten = 6314;
/*Elimina el cobro aplicado sobre la retenci?n*/
Select * from gxfindta.tclrtd where rtcidreten = 6314;
Delete from gxfindta.tclrtd where rtcidreten = 6314;
----------##--CASOS PREPAGA
SELECT * FROM GXFINDTA.TCLTSB T WHERE T.TSBCOCO='8607001' AND T.TSBFPRO>='20230901';
--VER PRINCIPAL E HISTORICO PARA SEGURAR
SELECT * FROM GXBDBPS.TMOVIAF T WHERE T.MVFEPRO>='20230928' AND T.MTNUMTA='6274311460228767';
SELECT * FROM GXBDBPS.THMOVAF TH WHERE TH.HMFEPRO>='20231026' AND TH.HMNUMTA='6274311460228767' AND TH.HMIDUSR='SKJVFIN001';
---IDENTIFICAR EL ID Y REINTENTAR EN CASO QUE NO EST?N EN LAS TABLAS DE MOVIMIENTOS..!! Validar con los logs Bepsa/prepagas del 12
Select * from gxfindta.tcltsb where tsbidop =8857363;
Update gxfindta.tcltsb set tsbesta = 'ER', tsbcome = '999', tsbdeme = 'ERROR INTERNO', TSBMOTIVO = '#64489' where tsbidop = 8857363;
/*INSTRUCTIVOS MANUALES REINGE.*/
SELECT * FROM GXFINDTA.TCLIMC T WHERE IMCIDIMC IN (557), 538, 539);
SELECT * FROM GXFINDTA.TCLIMD T WHERE IMCIDIMC IN (557), 538, 539);
SELECT * FROM GXFINDTA.TCLTSB T WHERE T.SERCODI='INSMANCRE' AND DATE (T.TSBFEGE)='2023-10-17' AND T.TSBCOCO='8600294';
--SE REINTENTA
update gxfindta.tclimc
set IMCEST = 'P' where imcidimc in (537,538,539);
-----------------------------------------------------
--SISTEMA DE PRODUCIC?N --KB CLEARING REPUESTO --- PERMISOS
SELECT *FROM GXBDCON.Gxlousu WHERE USUAID IN ('U99ADOLFO','U99HERNAN');--usuario
SELECT *FROM GXBDCON.Gxlosis; --sistema
SELECT *FROM GXBDCON.Gxlofun; --funcionalidad
SELECT *FROM GXBDCON.Gxloper WHERE USUCOD='1675';--usuario sistema
SELECT *FROM GXBDCON.Gxloperdet WHERE USUCOD='394'; --permisos habilitados
---------------------------------------------------------
---PARA VER SERVICIO SOCKET
SELECT * FROM GXTRJDTA.TEnECx where ECXCODENT = 1040 and ECXIDCONEX = 'AS400' and ECXBADTOUS = 'RIOWSUSR';
--tabla titual
SELECT * FROM GXBDBPS.TCODPP T WHERE T.COCOMER IN ('1003130','1000478');
------------------------------------------------------------
/*Configuraci?n de Comercios para D?bito*/
SELECT A.COCOMER,
       CODENO,
       CLICLICOD,
       SUCSUCCOD,
       COENTDEB BANCO,
       (CASE WHEN PARDESCRI IS NULL THEN 'BEPSA DEL PARAGUAY' WHEN COENTDEB <> '' THEN PARDESCRI ELSE 'NO-DEFINIDO' END) ENTIDAD,
       COCTADEB NROCUENTA,
       (CASE WHEN COTARJE = 1 AND COENTDEB = '001' AND COENTDEB <> '' THEN 'DEBITO-DINELCO' WHEN COTARJE = 1 AND COENTDEB <> '001' AND COENTDEB <> '' THEN 'DEBITO-BANCARIO' WHEN COTARJE = 0 AND COENTDEB <> '001' AND COENTDEB <> '' THEN 'DEBITO-ARCHIVO' ELSE 'NO-DEFINIDO ' END) CANAL
FROM GXBDBPS.COMAEAF A
         LEFT JOIN GXOPERA.CLPARF ON COENTDEB = PARCODBCO
         LEFT JOIN GXFINDTA.TCOCNA B ON A.COCOMER = B.COCOMER
WHERE COSTAT = 0
  AND SUBSTR(A.COCOMER, 1, 2) NOT IN ('80', '85', '45')
  AND SUBSTR(A.COCOMER, 1, 2) < '87';
------------------------------------------------------------------------------------------------------------------
-----personal
-- como se genera en el legacy y como se tendr?a que generar la orden de pago ---especf. Personal venta minutos... cambiar operadora para otras lienas
SELECT opcodtrn,sum(OPMONTO-OPCOMI) from GXOPERA.opmovi where opliqde ='20231219' AND  OPRADOR='971' AND OPCODTRN IN ('901020','514000') group by opcodtrn
union
SELECT opcodtrn,sum(OPMONTO-OPCOMI) from GXOPERA.opmovi where opliqde ='20231219' AND  OPRADOR='971' AND OPCODTRN IN ('902020','524000') group by opcodtrn;
SELECT * from GXOPERA.FLICOM WHERE LIFECHD= '20231221' AND LICOMER='6900001';
SELECT * from GXOPERA.FLICOM1 WHERE LIFECHD= '20231221' AND LICOMER='6900001';
SELECT * FROM GXFINDTA.TCLIMB WHERE  imbfch = '20231220 ' and substr(IMBIDOP,9,7) ='6900001';
SELECT * FROM GXFINDTA.TCLIMB WHERE  imbfch >= '20231215' and substr(IMBIDOP,9,7) ='6900001';
----------------------------------------------------------------------------------------------
/*Eliminar relaci?n 061 y banco 1007*/
Select * from gxtrjdta.tcoenc where encentant = '061' and encentrol = 100404;
--Delete from gxtrjdta.tcoenc where encentant = '061' and encentrol = 100404;
Select * from gxtrjdta.tcoenc where encentant = '064' and encentact = 1007;
--Delete from gxtrjdta.tcoenc where encentant = '064' and encentact = 1007;
Select * from gxtrjdta.tcoenc where encentant = '061' and encentrol = 100401;
--Update gxtrjdta.tcoenc set encentant = '064' where encentant = '061' and encentrol = 100401;
Select * from gxtrjdta.tdgenr where entcodent = 1007;
--Delete from gxtrjdta.tdgenr where entcodent = 1007;
Select * from gxtrjdta.tdgenr where entcodent = 1004 and rolidrol = 4;
--Update gxtrjdta.tdgenr set enrbcopaga = 1007, enrtipocon = 'DIR' where entcodent = 1004 and rolidrol = 4;

/*Actualiza enemiso a 064 de comaeaf*/
Select * from gxbdbps.comaeaf where enemiso = '061' and costat = 0; --10 registros
--Update gxbdbps.comaeaf set enemiso = '064' where enemiso = '061' and costat = 0;

--/*Actualiza Banco COmercio RI*/
Select * from gxfindta.tcmliq where liqentcod = 1007; -- 1.514 registros
--Update gxfindta.tcmliq set liqentcod = 1004 where liqentcod = 1007;
---------totalizador y controles para ACreditaciones O/B y diferencia de pagos-----------------
--------------------------------------------------------------------------
SELECT opfecom,   opliqde,   substr(OPTARJ, 1, 6),   openemi,   count(*),   sum(OPMONTO - OPCOMI - OPRENTA-OPREIVA)
FROM GXOPERA.OPMOVI WHERE OPLIQDE='20230508' AND OPCOMER='0703127' AND OPSTATUS='A'
GROUP BY opfecom,   opliqde,  substr(OPTARJ, 1, 6),   OPENEMI;
--------------------------------------
SELECT * FROM GXFINDTA.TCLMOV T WHERE MOVRRNBEP IN ('365904230951', '305955700366',  '305956204417',  '305956468205',  '305956509441',  '305956578024');
SELECT * FROM GXOPERA.OPMOVI O WHERE OPCOMER='0100195' AND OPLIQDE='20230228' AND OPTIPTAR='DEB';
--ver liquidaciones
SELECT * FROM GXOPERA.FLICOM1 WHERE LIFECHD='20230228' AND LICOMER='0100195';
SELECT * FROM GXOPERA.FLICOM1 WHERE LIFECREDI='20230302' AND LICOMER='0100195';
--
SELECT * FROM GXFINDTA.TCLIMB T WHERE IMBFCHC='20230302' and substr(IMBIDOP, 9, 7)=0100195;
-----------------------
--total flicon1 - opliqui total para bathc    P/ OPLIQUI /*MOVCDBCC 1002 /* no bbva,  rio,  bnf*/
SELECT * FROM GXOPERA.OPLICRE WHERE OPCRECOM='0301557' AND OPCREFCOM='20221228';
SELECT * FROM GXOPERA.OPLIQUI WHERE OPNCOMER='0100195' AND substr(OPCAMPOA, 41, 8)='20230228';
SELECT * FROM GXFINDTA.TCLMOV WHERE MOVIDLT='223570010301557';
-----
SELECT * FROM GXFINDTA.TCOCNA T WHERE T.COCOMER='6200010';

SELECT * FROM GXOPERA.FLICOM1 F WHERE F.LICOMER='0303006' AND F.LIFECHD BETWEEN '20230928' AND '20231105';
SELECT * FROM GXWEB.FLICOM F WHERE F.LICOMER='0303006' AND F.LIFECHD BETWEEN '20230928' AND '20231105';

SELECT SUM(LINETO), F.LITIPTAR, F.LIFECHA, F.LIFECREDI FROM GXOPERA.FLICOM1 F WHERE F.LICOMER='0303006' AND F.LIFECHD BETWEEN '20230928' AND '20231105'
GROUP BY  F.LITIPTAR, F.LIFECHA, F.LIFECREDI;
-----------------------------------
Select imbbco, entncentid, sum(imbimpn)Monto  from gxfindta.tclimb
inner join gxtrjdta.tdgent on imbbco = entcodent
where imbfch = '20231121' and imbbpa = 1020 and imbbco <> 1020
group by imbbco, entncentid;
----------------------------------
---tigo money para csv
SELECT 'PX' || SUBSTR(DIGITS(LSTANT), 3, 2),
       SUBSTR(DIGITS(LSTANT), 5, 2) || SUBSTR(LACTFJ, 5),
       LCODTR,
       LNRTAR,
       TRIM(LCOTEL),
       LCTADE,
       LERRNB,
       LFECTR,
       SUBSTR(DIGITS(LHORTR), 3, 8),
       LCRETR,
       LESTTR,
       LIMPGS,
       'TIGO MONEY',
       LIDCOM
FROM LIBDEBITO.DRCONBEP
WHERE LIDCOM <> 100001
  AND LFCOTR = '20240417'
  AND LCODTR = '000052'
  AND LESTTR = 'A'
  AND LCRETR = '00'
  AND LIDTRA = '';
/*Tigo Money completo*/
Select 'PX'||SUBSTR(DIGITS(LSTANT),3,2),SUBSTR(DIGITS(LSTANT),5,2)||SUBSTR(LACTFJ,5), lcodtr, LNRTAR, trim(lcotel), lctade, lerrnb, lfectr, substr(digits(lhortr),3,8), lcretr, lesttr, limpgs, 'TIGO MONEY', LIDCOM
from libdebito.drconbep where LIDCOM <> 100001 and substr(LIDTRA, 1, 1) <> 'T' and LFCOTR = '20240515' and LCODTR = '000052' and LESTTR = 'A' AND LCRETR = '00'
union
Select substr(LIDTRA, 1, 4), substr(LIDTRA, 5, 6), lcodtr, LNRTAR, trim(lcotel), lctade, lerrnb, lfectr, substr(digits(lhortr),3,8), lcretr, lesttr, limpgs, 'TIGO MONEY', LIDCOM
from libdebito.drconbep where substr(LIDTRA, 1, 1) = 'T' and LFCOTR = '20240415' and LCODTR = '000052' and eneadm <> '581' and LESTTR = 'A' AND LCRETR = '00';
-------------------------------
--sentencias para agregar los datos bancarios en el detalle transaccional
Select
    movidmov,movfpro,movcomer, movdeno, movcodcli, movcodsuc,movidlt,movcodem, movdesem, movntar,sercodi,
    precodi, movfpgo, movcdbcc, movdsbcc, movctbcc, movbcab,movncbcab, movdsbcc,movpgon, movimpo, movneto
from gxfindta.tclmov
where movfpro = '20241014' and movcomer = '8615919';;
UPDATE GXFINDTA.TCLMOV
SET MOVCDBCC  = 102004,
    MOVDSBCC  = 'CONTINENTAL',
    MOVBCAB   = 1020,
    MOVNCBCAB = 'CONTINENTAL',
    MOVCTBCC  = '3405632669'
WHERE MOVIDLT = '242880038615919';
----
---reporte solo de pagos a bnf que no estan en trasmisiones
SELECT
    T.MOVIDLT  LOTE, T.SERCODI  SERVICIO, T.MOVFPRO  FECHA_PROCESO, T.MOVFCRE  FECHA_CREDITO, T.MOVFTRX  FECHA_TRX,
    T.MOVESTA  ESTADO, T.MOVCODIS DISPOSITIVO, T.MOVFPGO  FOMRA_PAGO, T.MOVNETO  NETO, T.MOVCOMER COMERCIO,
    T.MOVCDBCC BANCO_COMERCIO, T.MOVDENO  DENOMNINACION, T.MOVRAZO  RAZON_SOCIAL, T.MOVRUC   RUC, T.MOVMARC  MARCA,
    T.MOVCDBCC COD_BANCO_COM, T.MOVDSBCC BANCO, T.MOVCTBCC CUENTA, T.MOVAFIN  AFINIDAD, T.MOVPGON  TIPO_ACRE
FROM GXFINDTA.TCLMOV T
WHERE T.MOVCOMER = '0802484' AND T.MOVCDBCC ='100204'
  AND T.MOVFCRE BETWEEN '20240901' AND '20240930';
------------------------------------------------------------
--------eliminar tclmov de factruación | recalcula comisión------------
--DELETE FROM GXFINDTA.TCLMOD t WHERE t.MOVIDMOV  in (149220464, 149220464, 149223312, 149763840, 150118148, 150251831, 150253395, 150399157);
--DELETE FROM GXFINDTA.TCLMOV t WHERE t.MOVIDMOV in T.MOVRRNBEP IN ('419751364016', '419951984110', '419149687734','419851644862', '420052401155', '419952092097', '419149549199');
--UPDATE GXBDBPS.TSWAUT t SET t.AUTESTCLE = 'P' WHERE T.AUTRRNBEP in ('419751364016', '419951984110', '419149687734','419851644862', '420052401155', '419952092097' '419149549199');
--UPDATE GXFINDTA.TCLMOV t SET t.MOVFECLIQ = '20240709' WHERE MOVIDMOV IN (171397431, 171397536, 171397537, 171397538, 171397539, 171397540, 171397541);
/*cargamos tclmov
  CL: CALL PGM(GXFINPGM/PCLR029) PARM('419149549199' '20240709'); */
-------------------------------------------------------------------
/*Corrección de Fecha de liquidación para compensacion de Operadoras (616 registros) */
Select movftrx, movfpro, movfecliq, sercodi, precodi, movimpo, movneto
from gxfindta.tclmov where MOVFECLIQ = '20240930' AND SERCODI in ('CICO','VTAMIN','PAGFAC');
Update gxfindta.tclmov set movfecliq = '20241011' where MOVFECLIQ = '20240930' AND SERCODI in ('CICO','VTAMIN','PAGFAC');
-------DE BNF A BNF
SELECT * FROM GXOPERA.OPAGO3P O1P;
SELECT * FROM GXOPERA.COPAEN2PHIS C2P;
SELECT * FROM GXOPERA.OPAGO1PHIS O1P WHERE O1P.PGCOMER='0802484' AND O1P.PGFETRN BETWEEN '20240901' AND '20240930';
--RED DE PAGOS
SELECT * FROM GXOPERA.OPAGO5PH O5P WHERE O5P.PGCOMER5='COD_COMER_86';
----------
--Favor si me podrian ayudar con la generacion del archivo para la entidad 7014 DET-ENT-7014
-- para que se le pueda depositar en su sftp.
--Se adjunta sentencia para parametrización de generación de reportes por el Nuevo Clearing para la entidad PROGRESAR CORPORATION S.A.
INSERT INTO GXFINDTA.TCLREP
(REPIDREP, RECCDEN, REPTPRE, REPTPPA, REPNOAR, REPNOPC, REPDESC, REPUSAC, REPFEAC, REPFEGE, REPTPEX, REPESTA, REPPRIO, REPRLEN, REPMONID)
VALUES(4, 7014, 'ENT', 'EMIS', 'DET-TRN-ENT', 'PCLR062', 'DETALLE DE TRX ENTIDAD', CURRENT USER, CURRENT TIMESTAMP, 'D', '.pdf', 'A', 1, 1, 600);

--REPROCESO TRX ONLINE NUEVO
--BK
Select * from gxfindta.tclmov where movrrnbep = '502135917375';
Select * from gxfindta.tclhtm where htmrrnbep = '502135917375';
SELECT * FROM gxfindta.TCLMOD t WHERE t.MOVIDMOV = 184618188;
--DELETE
DELETE from gxfindta.tclmov where movrrnbep = '502135917375';
DELETE from gxfindta.tclhtm where htmrrnbep = '502135917375';
DELETE FROM gxfindta.TCLMOD t WHERE t.MOVIDMOV = 184618188;
--UPDATE PARA DEJAR PENDIENTE DE REPROCESO
UPDATE gxbdbps.TSWAUT
SET AUTESTCLE = 'P'
WHERE AUTRRNBEP = '502135917375';
-- Call PCLR237 PROCESA CLEARING ONLINE
CL: CALL PGM(GXFINPGM/PCLR237) PARM('502135917375' '20250121' '' '' );
SELECT * FROM GXOPERA.OPLIQUI O WHERE O.OPNROREF  IN ('502135917375');
CALL PGM(GXFINPGM/PCLR028) PARM('IDOPLIQUI' '502135917375' '20250121');
SELECT  * FROM GXFINDTA.TCLTSB T WHERE T.TSBNREF='502135917375';

--anular retención manual
SELECT * FROM GXFINDTA.TCLRTC T WHERE T.RTCCOMERC='0201277';
SELECT * FROM GXFINDTA.TCLRTD T WHERE T.RTCIDRETEN=653268;

--REINTENTAR POR SERVICIO DE CONSULTA
Select * from gxfindta.tcltsb where date(tsbfege) in ('2024-08-23','2024-08-24') and tsbbade = 1020 and tsbcome ='000';
Update gxfindta.tcltsb set tsbesta = 'PE', tsbmotivo = 'EVENTO 20240823' where date(tsbfege) in ('2024-08-23','2024-08-24') and tsbbade = 1020 and tsbcome ='000';

Select date(tsbfege), tsbdeop,tsbesta,tsbcome retorno, tsbdeme respuesta, count(*) cantidad, sum(tsbimpo)Monto from gxfindta.tcltsb where date(tsbfege) >= '2024-08-23' and tsbbade = 1020 and tsbcome in ('000','999')
group by date(tsbfege), tsbdeop, tsbesta,tsbcome, tsbdeme
order by 3;

--Tareas #89344: RECLAMA ACREDITACIONES - 8602888 - DESPENSA ANA LIZ
---redepagos todos en batch, en este caso se le pago en 2 partes porque eran tarjetas != a BNF y una = BNF con Banco comercio BNF
SELECT * FROM gxfindta.tclmov T WHERE T.MOVCOMER=8602888 AND T.MOVFPRO='20250205';
SELECT SUM(T.MOVNETO) FROM gxfindta.tclmov T WHERE T.MOVCOMER=8602888 AND T.MOVFPRO='20250205';
-- por ende los que no son tarjeta BNF pero banco debtio y comercio bnf va a opago1p
SELECT * FROM GXOPERA.OPAGO1PHIS O1P WHERE O1P.PGCOMER='8602888' AND O1P.PGFECOM='20250205';
--y las que si son BNF a BNF comercio y pagador BNF en opago5p
SELECT * FROM GXOPERA.OPAGO5PH O5P WHERE O5P.PGCOMER5=8602888 AND O5P.PGFECOM5='20250205';
--en este caso historico porque ya fue de fecha pasada.
-------log clearing legacy
SELECT * FROM gxfindta.tcllgc WHERE LGFECHA = '20250225';
---reing
SELECT * FROM GXFINDTA.TCLCPC WHERE CPCFEC ='20241219';
SELECT * FROM GXFINDTA.TCLCSP WHERE CPCFEC ='20241219';
-----
--Consulta Casos
SELECT tsbfpro, tsbbade, tsbcodswc,tsbbacr, tsbdeop, tsbdeme,tsbtpoacr,COUNT(*) cantidad, sum(tsbimpo) total FROM gxfindta.tcltsb
WHERE date(tsbfege)>'2024-01-01' AND tsbesta <> 'AN' AND tsbtpop = ''
GROUP BY tsbfpro,tsbbade, tsbcodswc,tsbbacr, tsbdeop, tsbdeme, tsbtpoacr;

--regularizaciones Banco RIO
UPDATE gxfindta.TCLTSB T
SET t.TSBTPOP = '01', t.TSBDEOP = 'CREDITO A COMERCIOS',t.SERCODI = 'COMPRA', t.PRECODI = 'COMP', t.TSBMOTIVO = 'Corrección Redmine #90493'
    t.TSBBADE = 1040, t.TSBCTDE  = '0823482804', t.TSBTPDE = 'CC', t.TSBMONE = 600, t.TSBMONSIG = 'PYG'
WHERE date(tsbfege)>'2024-01-01' AND tsbesta <> 'AN' AND tsbbacr =1040  AND tsbtpop = '';
--regularizaciones GNB
UPDATE gxfindta.TCLTSB T
SET t.TSBTPOP = '01', t.TSBDEOP = 'CREDITO A COMERCIOS', t.TSBCODSWD = 'BNFAPYPA',t.SERCODI = 'COMPRA', t.PRECODI = 'COMP', t.TSBMOTIVO = 'Corrección Redmine #90493'
    t.TSBBADE = 1002, t.TSBCTDE  = '101285211', t.TSBTPDE = 'CC', t.TSBMONE = 600, t.TSBMONSIG = 'PYG'
WHERE date(tsbfege)>'2024-01-01' AND tsbesta <> 'AN' AND tsbbacr =1004  AND tsbtpop = '';
--regularizaciones Otros Bancos via COntinental
UPDATE gxfindta.TCLTSB T
SET t.TSBTPOP = '01', t.TSBDEOP = 'CREDITO A COMERCIOS', t.TSBCODSWD = 'BNFAPYPA',t.SERCODI = 'COMPRA', t.PRECODI = 'COMP', t.TSBMOTIVO = 'Corrección Redmine #90493'
    t.TSBBADE = 1020, TSBCTDE  = '0102184061', t.TSBTPDE = 'CC', t.TSBMONE = 600, t.TSBMONSIG = 'PYG'
WHERE date(tsbfege)>'2024-01-01' AND tsbesta <> 'AN' AND tsbbacr NOT IN (1004,1040)  AND tsbtpop = '';
----
---detalle para bnf de errores de comprobantes
SELECT /*SUBSTR(O.OPCAMPOA, 1, 6) BIN, COUNT (*)*/
O.OPNROREF REFERERENCIA, O.OPNCOMER COMERCIO, O.OPFECLIQ FECHA, O.OPHORLIQ HORA, O.OPCODBCO BANCO, O.OPNROCTC CUENTA_CREDITO,
O.OPIMPORB IMPORTE_B, O.OPIMPOR NETO, O.OPCAMPOB COMPROBANTE, O.OPSTAT STATUS, O.OPMENSAJ MENSAJE
FROM GXOPERA.OPLIQUI O WHERE O.OPSTAT='99' AND O.OPMENSAJ LIKE '%63 - Error, comprobante no existe%'
AND OPFECLIQ >='20250101' AND SUBSTR(O.OPCAMPOA, 1, 6)='703002';

--actualiza opcampoa para opliqui
Update gxopera.opliqui SET OPCAMPOA = substr(OPCAMPOA, 1 , 16)||'20250319'||SUBSTR(OPCAMPOA, 25 )
WHERE OPNROREF (500329666377, 500329666514);
--
---QUERY DE PROCEDIMIENTO GXFINPGM TASA ADEPAG
SELECT T1 . SERHABILI , -- Asignamos el valor a SERHABILI
            T2 . STSVALCOM , -- Asignamos el valor a STSVALCOM
            T2 . STSCOMMAX -- Asignamos el valor a STSCOMMAX
            FROM GXFINDTA . TCMSER T1
            LEFT JOIN GXFINDTA . TCMSTS T2 ON T1 . CLICLICOD = T2 . CLICLICOD AND T1 . SUCSUCCOD = T2
                . SUCSUCCOD AND T1 . SERCODI = T2 . SERCODI
            WHERE T1 . CLICLICOD = 22476 AND T1 . SUCSUCCOD = 2 AND T1 . SERCODI =
                'ADEPAG' -- Filtro específico por el valor 'ADECOM'
            AND T1 . SERHABILI = 'S' ;
---INSERTA TASAS REING,
INSERT INTO GXFINDTA.TCMSTS
(CLICLICOD, SUCSUCCOD, SERCODI, STSSECUE, STSMON, STSFCHVIG, STSTPUSO, STSORGTRX, STSMARCA, STSPROD, STSTPPLS, PRECODI, STSDIS, STSTIPCOM, STSVALCOM, STSCOMMIN, STSCOMMAX, STSCOMFIJ, STSFCHALT, STSUSUALT, STSFCHMOD, STSUSUMOD)
VALUES(22476, 2, 'ADEPAG', 1, 600, '20250101', 'D', 'L', '', '', ' ', '    ', '     ', 'P', 1.0000, 1.00, 6.00, 0.00, CURRENT_TIMESTAMP, '          ', CURRENT_TIMESTAMP, 'PRUEBA ');
---este es con limiet de adlenato campo STSCOMMAX
INSERT INTO GXFINDTA.TCMSTS
(CLICLICOD,SUCSUCCOD,SERCODI,STSSECUE,STSMON,STSFCHVIG,STSTPUSO,STSORGTRX,STSMARCA,STSPROD,STSTPPLS,PRECODI,STSDIS,STSTIPCOM,STSVALCOM,STSCOMMIN,STSCOMMAX,STSCOMFIJ,STSFCHALT,STSUSUALT,STSFCHMOD,STSUSUMOD)
VALUES (22476,2,'ADEPAG    ',1,600,'20250101','D','L','DIN','   ',' ','    ','     ','P',1.0000,1.00,1000000,0.00,CURRENT TIMESTAMP,CURRENT USER,CURRENT TIMESTAMP,CURRENT USER);

---INSERTA TASA LEGACY PARA PIX
SELECT * FROM GXBDBPS.COMAEXD C2 WHERE C2.COCOMER='5500449'
AND C2.CCMARCA='DIN' AND C2.CCMAROR='I';

INSERT INTO GXBDBPS.COMAEXD (CCFCHDES, COCOMER, BPSSRVCOD, CCOPERA, CCMARCA, CCMAROR, CCMARPR, CCTIPTA, CCMTASA, CCESTADO, CCUSRA, CCFECA, CCUSRM, CCFECM)
VALUES ('20241031', '1003955', 1, '   ', 'DIN', 'I', '   ', 'D', 0.0001, 'A', 'MIGRACION ', '20241031', 'U99SUSANA ', '20230602');
---adelanto pagos
SELECT * FROM gxfindta.tcmsts WHERE sercodi = 'ADEPAG';
UPDATE gxfindta.tcmsts SET STSMARCA = 'DIN' WHERE sercodi = 'ADEPAG';
----------------------------------------------------
---opmovi sin comisiones
SELECT O.OPNOREF,
    SUM(CASE WHEN MODTPPA = 'COME' THEN MODCOMI + MODCOIV ELSE 0 END) OPCOMI,
    SUM(CASE WHEN MODTPPA = 'EMIS' THEN MODCOMI ELSE 0 END) OPCOMENT,
    SUM(CASE WHEN MODTPPA IN ('BAPA', 'BEPS') THEN MODCOMI ELSE 0 END) OPCOMBPS,
    SUM(CASE WHEN MODTPPA = 'EMIS' THEN MODCOIV ELSE 0 END) OPIVAENT,
    SUM(CASE WHEN MODTPPA IN ('BAPA', 'BEPS') THEN MODCOIV ELSE 0 END) OPIVABPS
FROM GXOPERA.OPMOVI O
INNER JOIN GXFINDTA.TCLMOV T ON O.OPNOREF=T.MOVRRNBEP
INNER JOIN GXFINDTA.TCLMOD T2 ON T2.MOVIDMOV=T.MOVIDMOV
WHERE O.OPCODTRN='000054' AND O.OPIDTRA=''
GROUP BY O.OPNOREF;
--WHERE T.MOVRRNBEP IN ('470209678447');
-----update hapore trayendo desde tclmov
UPDATE GXOPERA.OPMOVI O
SET O.OPCOMI   = (SELECT SUM(CASE WHEN MODTPPA = 'COME' THEN MODCOMI + MODCOIV ELSE 0 END)
                  FROM GXOPERA.OPMOVI O2
                           INNER JOIN GXFINDTA.TCLMOV T ON O2.OPNOREF = T.MOVRRNBEP
                           INNER JOIN GXFINDTA.TCLMOD T2 ON T2.MOVIDMOV = T.MOVIDMOV
                  WHERE O2.OPNOREF = O.OPNOREF
                    AND O2.OPCODTRN = '000054'
                    AND O2.OPIDTRA = ''),
    O.OPCOMENT = (SELECT SUM(CASE WHEN MODTPPA = 'EMIS' THEN MODCOMI ELSE 0 END)
                  FROM GXOPERA.OPMOVI O2
                           INNER JOIN GXFINDTA.TCLMOV T ON O2.OPNOREF = T.MOVRRNBEP
                           INNER JOIN GXFINDTA.TCLMOD T2 ON T2.MOVIDMOV = T.MOVIDMOV
                  WHERE O2.OPNOREF = O.OPNOREF
                    AND O2.OPCODTRN = '000054'
                    AND O2.OPIDTRA = ''),
    O.OPCOMBPS = (SELECT SUM(CASE WHEN MODTPPA IN ('BAPA', 'BEPS') THEN MODCOMI ELSE 0 END)
                  FROM GXOPERA.OPMOVI O2
                           INNER JOIN GXFINDTA.TCLMOV T ON O2.OPNOREF = T.MOVRRNBEP
                           INNER JOIN GXFINDTA.TCLMOD T2 ON T2.MOVIDMOV = T.MOVIDMOV
                  WHERE O2.OPNOREF = O.OPNOREF
                    AND O2.OPCODTRN = '000054'
                    AND O2.OPIDTRA = ''),
    O.OPIVAENT = (SELECT SUM(CASE WHEN MODTPPA = 'EMIS' THEN MODCOIV ELSE 0 END)
                  FROM GXOPERA.OPMOVI O2
                           INNER JOIN GXFINDTA.TCLMOV T ON O2.OPNOREF = T.MOVRRNBEP
                           INNER JOIN GXFINDTA.TCLMOD T2 ON T2.MOVIDMOV = T.MOVIDMOV
                  WHERE O2.OPNOREF = O.OPNOREF
                    AND O2.OPCODTRN = '000054'
                    AND O2.OPIDTRA = ''),
    O.OPIVABPS = (SELECT SUM(CASE WHEN MODTPPA IN ('BAPA', 'BEPS') THEN MODCOIV ELSE 0 END)
                  FROM GXOPERA.OPMOVI O2
                           INNER JOIN GXFINDTA.TCLMOV T ON O2.OPNOREF = T.MOVRRNBEP
                           INNER JOIN GXFINDTA.TCLMOD T2 ON T2.MOVIDMOV = T.MOVIDMOV
                  WHERE O2.OPNOREF = O.OPNOREF
                    AND O2.OPCODTRN = '000054'
                    AND O2.OPIDTRA = '')
WHERE O.OPCODTRN = '000054'
  AND O.OPIDTRA = '';
------------------------------------------------------------------
--TABLA SERVICIO/PRESTACION, SIGNIFICADO DE 0000054 ETC...
SELECT * FROM GXFINDTA.TCLPRE T;
--------------------------------------------------
 --CONTROLA 703002 PARA TRX EN LINEA
SELECT *  FROM GXOPERA.OPLIQUI O WHERE O.OPFECLIQ>='20250101' AND O.OPSTAT NOT IN ('00', '88', '77')
AND SUBSTR(O.OPCAMPOA, 1, 6)=703002 AND O.OPCODBCO NOT IN ('74', '146','189');--PARA CONTI QUITAR 74 Y 64 ENTRA EN NOT IN

--responde bnf y se actualiza opcambpob, y también se ajusta las cuentas para poder procesar los nclr
--siempre que opcodbco = 057 opnroctc = 20021 y optictac = 'K'
 --k: cuenta corriente, A: caja de ahorro
UPDATE gxopera.opliqui SET opnroctc = 20021, opnrctcr = 102184061 WHERE opnroref IN
('500229203894', '500229203867', '500229204081', '500229203903', '500229203996', '500229204118', '500229204273', '500229204351',
'500229204367', '500229204413', '500229204419', '500831505149');

--reporte para comprobante no existe
SELECT
    O.OPNROREF REFERENCIA, O.OPNCOMER COMERCIO, O.OPFECLIQ FEHCA, O.OPHORLIQ HORA, O.OPNROCTC CUENTA_CREDITO,
    O.OPCODBCO BANCO, O.OPIMPORB IMPORTE_BRUTO, O.OPIMPOR  NETO, O.OPCAMPOB COMPROBANTE, O.OPSTAT STATUS,
    O.OPMENSAJ MENSAJE
FROM GXOPERA.OPLIQUI O
WHERE O.OPSTAT = '99' AND SUBSTR(O.OPCAMPOA, 1, 6) = 703002
  AND O.OPFECLIQ >= '20250101' AND O.OPMENSAJ LIKE '63 -%';
---------------------------------------------------------------------------
---REPORTE verifica PIX COMISION 0 NETO 0
SELECT T.MOVCOMER, T.MOVDENO, COUNT(*) CANTIDAD, SUM(T.MOVIMPO), T.SERCODI, T.PRECODI, T.MOVFPRO
FROM GXFINDTA.TCLMOV T WHERE T.SERCODI='COMPRA' AND T.PRECODI='PXQR' AND T.MOVNETO='0' --AND T.MOVIDLT LIKE '25084001%'
GROUP BY T.MOVCOMER, T.MOVDENO, T.SERCODI, T.PRECODI, T.MOVFPRO;

---reporte shirley
SELECT O.OPFECLIQ FECHA, O.OPIMPORB BRUTO, O.OPIMPOR  NETO, O.OPNROREF REFERENCIA, O.OPNCOMER COD_COM,
       C2.CODENO  DENOMINACION, C2.CORAZO  RAZON_SOCIAL, O.OPMENSAJ MENSAJE
FROM GXOPERA.OPLIQUI O
         INNER JOIN GXBDBPS.COMAEAF C2 ON C2.COCOMER = O.OPNCOMER
WHERE O.OPFECLIQ >= '20250101'
  AND O.OPSTAT NOT IN ('00', '88', '77')
  AND SUBSTR(O.OPCAMPOA, 1, 6) = 703002
  AND O.OPCODBCO NOT IN ('74', '146', '189')
  AND OPNROREF NOT IN (510072611349, 508565903305);

--VERIFICA EN TRASMISIONES - SI ES LO QUE PAGA HOY FECHA 25 SE BUSCA POR 24
SELECT * FROM GXFINDTA.TCLTSB T WHERE T.TSBFPRO='20250324' AND T.TSBCOCO IN ('5500159', '5500092');
SELECT * FROM GXFINDTA.TCLTSB T WHERE T.TSBFPRO='20250324' AND T.TSBCOCO IN  ('1002356', '1001730', '1000995', '1003242', '1003771');

SELECT *
FROM GXFINDTA.TCLMOV T WHERE T.SERCODI='COMPRA' AND T.PRECODI='PXQR' AND T.MOVNETO='0';
--reportecito para enviar
SELECT
    T.MOVCOMER, T.MOVDENO, T.MOVFPRO, T.MOVFECLIQ, T.MOVIMPO, T.MOVNETO, T.MOVRRNBEP, T.MOVIDLT, T.SERCODI, T.PRECODI
FROM GXFINDTA.TCLMOV T WHERE  MOVRRNBEP IN ('493909600293   ', '494100550835   ', '494201035675   ', '494201050869   ', '494401469561   ', '494401481481   ', '494501668003   ', '494602316769   ', '494703231347   ', '494904390703   ', '495004702065   ', '495004760249   ', '495306611237   ', '495407119735   ', '495709026595   ', '496000540985   ', '496000543443   ', '496100577605   ', '496100670397   ', '496100675085   ', '496100677261   ', '496100846011   ', '496201035471   ', '496201037363   ', '496301530387   ', '496301533995   ', '496301843059   ', '496502184141   ', '496502369901   ', '496502565991   ', '496603108287   ', '560103205023   ', '560103278903   ', '560303842823   ', '560303843589   ', '560404326269   ', '560604738273   ', '560705266015   ', '560705335081   ', '560705335997   ', '560805599629   ', '560805602269   ', '560805643627   ', '560905834541   ', '560905970875   ', '561006282639   ', '561106617415   ', '561307046065   ', '561607780489   ', '562009024341   ', '562009194857   ', '562009211637   ', '562109467273   ', '562109488765   ', '562602353645   ', '562602364209   ', '562602530995   ', '562602531811   ', '562702950523   ', '562803285225   ', '562803445987   ', '562903691747   ', '563004035633   ', '563004094855   ', '563305407529   ', '563405865105   ', '563606584493   ', '563606587619   ', '563706689057   ', '563706875181   ', '563706976355   ', '563807094767   ', '563807103255   ', '563907513227   ', '563907660281   ', '563907689095   ', '563907689787   ', '564007866737   ', '564007920169   ', '564007944913   ', '564108094425   ', '564108212169   ', '564108215677   ', '564108289469   ', '564108326685   ', '564208512859   ', '564308727059   ', '564308908241   ', '564409139111   ', '564409190567   ', '564509462521   ', '564509502903   ', '564509504577   ', '564509563451   ', '564609861501   ', '564800334041   ', '564800472351   ', '564800495361   ', '564900534109   ', '564900538093   ', '564900616167   ', '564900732821   ', '564900742467   ', '565000788079   ', '565000807751   ', '565201437691   ', '565202087707   ', '565302696791   ', '565302822123   ', '565403175561   ', '565503661381   ', '565503664851   ', '565503720955   ', '565603826389   ', '565604065705   ', '565604170079   ', '565704340173   ', '565704454223   ', '565704509719   ', '565704592567   ', '565704672443   ', '565704696309   ', '565804901355   ', '565805075613   ', '565805203201   ', '565805240823   ', '565905321341   ', '565905565955   ', '566106624701   ', '566106648191   ', '566106648621   ', '566206830115   ', '566307352049   ', '566507903745   ', '566507987011   ', '566508034905   ', '566508105283   ', '566508161025   ', '566608205145   ', '566708720047   ', '566708742143   ', '566708743599   ', '566809181999   ', '566909399813   ', '566909458895   ', '566909480477   ', '566909534245   ', '567009667965   ', '567009813185   ', '567109979987   ', '567100004817   ', '567100018595   ', '567100067361   ', '567200280645   ', '567200326621   ', '567300568015   ', '567300664761   ', '567300692235   ', '567401007427   ', '567401007921   ', '567501346079   ', '567601461401   ', '567601515189   ', '567601551975   ', '567601608699   ', '567601609323   ', '567601679615   ', '567701740729   ', '567701752805   ', '567701892261   ')
---update para reprocesar | ajsuar el idlt con la fehca juliana
UPDATE GXFINDTA.TCLMOV T SET T.MOVNETO=T.MOVIMPO, T.MOVFPRO='20250328', T.MOVFECLIQ='20250328', T.MOVIDLT=25087001||T.MOVCOMER
  WHERE  T.SERCODI='COMPRA' AND T.PRECODI='PXQR' AND T.MOVNETO='0';
------------------------------------------------
/*Considerando el pedido del Banco RIO, de bajar temporalmente su servicio de Compensaciones a Comercios y Entidades
Se solicita cambiar el banco pagador de Banco RIO a Conti de manera que los comercios puedan seguir recibiendo sus acreditaciones via ACH.*/

SELECT * FROM gxtrjdta.tdgenr WHERE entcodent = 1040 AND rolidrol = 4;
UPDATE gxtrjdta.tdgenr SET enrbcopaga = 1020 WHERE entcodent = 1040 AND rolidrol = 4;
--caso  Venta de Minutos y Pago de Facturas | Tareas #92586
--verifica
SELECT D.LCOTEL , d.* FROM LIBDEBITO.DRCONBEP D WHERE D.LCORED = '0' AND D.LFECTR >= '20250410'
--AND D.LERRNB = '510273291172'
--AND LHISDE not LIKE '%*BNF%'
AND LCOTEL != ''
AND D.LCODTR IN ('902020', '901020')
AND D.LCRETR = '00' AND LESTTR = 'A'; --345
--actualiza
UPDATE LIBDEBITO.DRCONBEP D
SET D.LCORED = IFNULL((SELECT IFNULL(B.LIDOPE, SUBSTR(D.LCOTEL, 1, 3))
                       FROM LIBDEBITO.LINPORTA B
                       WHERE CONCAT('0', TRIM(B.LNUMER)) = TRIM(D.LCOTEL)
                           FETCH FIRST 1 ROW ONLY), SUBSTR(D.LCOTEL, 1, 3))
WHERE LFECTR BETWEEN '20250411' AND '20250421'
  AND D.LCOTEL LIKE '09%'
  AND D.LCORED = 0
  AND D.LCODTR IN ('902020', '901020')
  AND D.LCRETR = '00';
--silver
SELECT A.LCORED, CASE WHEN LCORED = '981' THEN 'TIGO' WHEN LCORED = '971' THEN 'PERSONAL' WHEN LCORED = '991' THEN 'CLARO' ELSE 'ERROR' END OPERADORA, LFECTR, COUNT(*) CANTIDAD
FROM LIBDEBITO.DRCONBEP A
WHERE LFECTR >= '20250410'
  AND LESTTR = 'A'
  AND LCRETR = '00'
  AND LCODTR IN ('901020', '902020')
GROUP BY LCORED, LFECTR;
--Se podria corregir directo en base a lo que ya se cambio
--TIGO
UPDATE libdebito.drconbep SET LCORED = '981'
WHERE lfectr >= '20250411' AND LCORED = '098' AND LESTTR = 'A' AND LCRETR = '00' AND lcodtr IN ('901020','902020');

--PERSONAL
UPDATE libdebito.drconbep SET LCORED = '971'
WHERE lfectr >= '20250411' AND LCORED = '097' AND LESTTR = 'A' AND LCRETR = '00' AND lcodtr IN ('901020','902020');


--silver  Actualiza datos de operadora  TCLMOV Y OPMOVI
--TCLMOV
SELECT MOVFPRO,MOVFECLIQ, MOVOPDE, MOVOPOR,SERCODI, COUNT(*) CANTIDAD, SUM(MOVIMPO), SUM(MOVNETO)
FROM GXFINDTA.TCLMOV A WHERE MOVFpro >= '20250411' AND SERCODI IN ('PAGFAC','VTAMIN')
GROUP BY MOVFPRO,MOVFECLIQ, MOVOPDE,MOVOPOR, SERCODI;
--TIGO - TCLMOV
UPDATE GXFINDTA.TCLMOV SET MOVOPDE= 700105, MOVOPOR = 700105, MOVFECLIQ = '20250422' WHERE MOVRRNBEP IN (
SELECT LERRNB FROM LIBDEBITO.DRCONBEP WHERE lfectr >= '20250411' AND LCORED = '981'
AND LESTTR = 'A' AND LCRETR = '00' AND lcodtr IN ('901020','902020'));
--PERSONAL - TCLMOV
UPDATE GXFINDTA.TCLMOV SET MOVOPDE= 700405, MOVOPOR = 700405, MOVFECLIQ = '20250422' WHERE MOVRRNBEP IN (
SELECT LERRNB FROM LIBDEBITO.DRCONBEP WHERE lfectr >= '20250411' AND LCORED = '971'
AND LESTTR = 'A' AND LCRETR = '00' AND lcodtr IN ('901020','902020'));
--OPMOVI
SELECT * FROM GXOPERA.OPMOVI WHERE OPFECOM >= '20250411' AND OPCODTRN IN ('901020','902020');
--TIGO - OPMOVI
UPDATE GXOPERA.OPMOVI SET OPRADOR = '981' WHERE OPNOREF IN (
SELECT LERRNB FROM LIBDEBITO.DRCONBEP WHERE lfectr >= '20250411' AND LCORED = '981'
AND LESTTR = 'A' AND LCRETR = '00' AND lcodtr IN ('901020','902020'));
--PERSONAL - OPMOVI
UPDATE GXOPERA.OPMOVI SET OPRADOR = '971' WHERE OPNOREF IN (
SELECT LERRNB FROM LIBDEBITO.DRCONBEP WHERE lfectr >= '20250411' AND LCORED = '971'
AND LESTTR = 'A' AND LCRETR = '00' AND lcodtr IN ('901020','902020'));
--Actualiza datos de operadora en TSWAUT
--TSWAUT
SELECT * FROM gxbdbps.tswaut WHERE auttrxfchc >= '20250411' AND autcodser IN ('VTAMIN','PAGFAC')
--TIGO - TSWAUT
UPDATE GXBDBPS.TSWAUT SET AUTOPEORI= 700105, AUTOPEDES = 700105 WHERE AUTRRNBEP IN (
SELECT LERRNB FROM LIBDEBITO.DRCONBEP WHERE lfectr >= '20250411' AND LCORED = '981'
AND LESTTR = 'A' AND LCRETR = '00' AND lcodtr IN ('901020','902020'));
--PERSONAL - TSWAUT
UPDATE GXBDBPS.TSWAUT SET AUTOPEORI= 700405, AUTOPEDES = 700405 WHERE AUTRRNBEP IN (
SELECT LERRNB FROM LIBDEBITO.DRCONBEP WHERE lfectr >= '20250411' AND LCORED = '971'
AND LESTTR = 'A' AND LCRETR = '00' AND lcodtr IN ('901020','902020'));
--IMPUTACIONES
SELECT * FROM gxfindta.tclimb WHERE imbfch = '20250422' AND imbser ='PAGFAC';
UPDATE gxfindta.tclimb SET IMBIDOP = 251110096900002 WHERE imbfch = '20250422' AND imbser ='PAGFAC' AND IMBIDOP = 251110099099598;
UPDATE gxfindta.tclimb SET IMBIDOP = 251110096900001 WHERE imbfch = '20250422' AND imbser ='PAGFAC' AND IMBIDOP = 251110099002214;
--TRANSMISIONES
SELECT * FROM gxfindta.tcltsb WHERE tsbfpro = '20250422' AND sercodi = 'PAGFAC';
UPDATE gxfindta.tcltsb SET tsbesta= 'PE', tsbmotivo = '#92586',  tsbnref = '251110096900001', tsbctcr = '6607654890',
TSBCOCO = '6900001', tsbdene = 'PERSONAL', TSBNRODOC ='80017437-2', TSBDOCCOM = '80017437-2'
WHERE tsbnref ='251110099002214';
UPDATE gxfindta.tcltsb SET tsbesta= 'PE', tsbmotivo = '#92586', tsbnref = '251110096900002', tsbctcr = '1402058400',
TSBCOCO = '6900002', tsbdene = 'TELECEL', TSBNRODOC ='80000519-8', TSBDOCCOM = '80000519-8'
WHERE tsbnref ='251110099099598';

-- TIGO  PAGFAC MOVIMIENTOS (LOTE)
SELECT MOVFPRO,MOVFECLIQ, MOVOPDE, MOVOPOR,SERCODI,movidlt
FROM GXFINDTA.TCLMOV WHERE movfecliq = '20250422' AND movopor = 700105 AND SERCODI = 'PAGFAC' AND SUBSTR(MOVIDLT,1,7) <> '2511200';
UPDATE GXFINDTA.TCLMOV SET MOVIDLT = '251110096900002' WHERE movfecliq = '20250422' AND movopor = 700105 AND SERCODI = 'PAGFAC' AND SUBSTR(MOVIDLT,1,7) <> '2511200';
-- TIGO VTAMIN MOVIMIENTOS (LOTE)
SELECT MOVFPRO,MOVFECLIQ, MOVOPDE, MOVOPOR,SERCODI,movidlt
FROM GXFINDTA.TCLMOV WHERE movfecliq = '20250422' AND movopor = 700105 AND SERCODI = 'VTAMIN' AND SUBSTR(MOVIDLT,1,7) <> '2511200';
UPDATE GXFINDTA.TCLMOV SET MOVIDLT = '251110056900002' WHERE movfecliq = '20250422' AND movopor = 700105 AND SERCODI = 'PAGFAC' AND SUBSTR(MOVIDLT,1,7) <> '2511200';
-- PERSONAL PAGFAC MOVIMIENTOS (LOTE)
SELECT MOVFPRO,MOVFECLIQ, MOVOPDE, MOVOPOR,SERCODI,movidlt
FROM GXFINDTA.TCLMOV WHERE movfecliq = '20250422' AND movopor = 700405 AND SERCODI = 'PAGFAC' AND SUBSTR(MOVIDLT,1,7) <> '2511200';
UPDATE GXFINDTA.TCLMOV SET MOVIDLT = '251110096900001' WHERE movfecliq = '20250422' AND movopor = 700105 AND SERCODI = 'PAGFAC' AND SUBSTR(MOVIDLT,1,7) <> '2511200';
-- PERSONAL VTAMIN MOVIMIENTOS (LOTE)
SELECT MOVFPRO,MOVFECLIQ, MOVOPDE, MOVOPOR,SERCODI,movidlt
FROM GXFINDTA.TCLMOV WHERE movfecliq = '20250422' AND movopor = 700405 AND SERCODI = 'VTAMIN' AND SUBSTR(MOVIDLT,1,7) <> '2511200';
UPDATE GXFINDTA.TCLMOV SET MOVIDLT = '251110056900001' WHERE movfecliq = '20250422' AND movopor = 700105 AND SERCODI = 'PAGFAC' AND SUBSTR(MOVIDLT,1,7) <> '2511200';

--Cabecera de totalizador
SELECT * FROM gxfindta.tclloc WHERE locfpro = '20250422' AND locgrup = 'OPER' AND SERCODI = 'PAGFAC';
UPDATE gxfindta.tclloc SET LOCNINS = '25111009'||LOCCOCO  WHERE locfpro = '20250422' AND locgrup = 'OPER' AND SERCODI = 'PAGFAC';
--Detalle de Totalizador
SELECT * FROM gxfindta.tcllod WHERE locfpro = '20250422' AND locgrup = 'OPER' AND SERCODI = 'PAGFAC';
UPDATE gxfindta.tcllod SET LODNRIN = '25111009'||LOCCOCO  WHERE locfpro = '20250422' AND locgrup = 'OPER' AND SERCODI = 'PAGFAC';

--TIGO
UPDATE GXFINDTA.TCLMOV SET MOVIDLT = '251110056900002' WHERE movfecliq = '20250422' AND movopor = 700105
AND SERCODI = 'VTAMIN' AND SUBSTR(MOVIDLT,1,7) <> '2511200';
UPDATE GXFINDTA.TCLMOV SET MOVIDLT = '251110096900002' WHERE movfecliq = '20250422' AND movopor = 700105
AND SERCODI = 'PAGFAC' AND SUBSTR(MOVIDLT,1,7) <> '2511200';
--PERSONAL
UPDATE GXFINDTA.TCLMOV SET MOVIDLT = '251110096900001' WHERE movfecliq = '20250422' AND movopor = 700405
AND SERCODI = 'PAGFAC' AND SUBSTR(MOVIDLT,1,7) <> '2511200';
UPDATE GXFINDTA.TCLMOV SET MOVIDLT = '251110056900001' WHERE movfecliq = '20250422' AND movopor = 700405
AND SERCODI = 'VTAMIN' AND SUBSTR(MOVIDLT,1,7) <> '2511200';

/*Validar transaccions que quedaron en el temporal*/
Select '3-ERROR-TEMPORAL' ORIGEN,TPCFPRO, TPCDISP, SERCODI, tpcestrx, COUNT(*) Cantidad, A.ecccderrcc, B.ECCDSERRCC error
from gxfindta.tcltpc A INNER JOIN gxfindta.tclecc B ON A.ECCCDERRCC = B.ECCCDERRCC
where tpcfpro = '20250627'
GROUP BY TPCFPRO, TPCDISP, SERCODI, tpcestrx, precodi,A.ECCCDERRCC, B.ECCDSERRCC
ORDER BY 1,5;
--errores temporal del cambo ECCCDERRCC
/*-- Validaciones realizadas
01 - SERVICIO EXISTE
02 - PRESTACION EXISTE
03 - COMERCIO PRUEBA * //comerprb
04 - TARJETA PRUEBA *  //becardoc
05 - FORMA DE PAGO EXISTE
06 - TIPO TARJETA VALIDO
07 - Codigo de Entidad o Entidad-Rol existe
08 - Comercio dado de Baja
09 - Monto invalido
10 - Entidad/Servicio
11 - Entidad/Servicio/Dispositivo
12 - Entidad/Marca
13 - Entidad/Marca/Producto
14 - Bin No existe
15 - Entidad Procesadora No existe
16 - Entidad Emisora no existe
17 - Marca No existe
18 - Entidad Administradora no existe
19 - Producto no existe
20 - Transaccion Dudosa
21 - % Comision no encontrada
22 - Entidad Propietaria no existe
23 - Valor con decimal para moneda guaranies
24 - Procesa Clearing No
25 - Nro de Cuenta no registrado para moneda
26 - Servicio - Prestacion no parametrizado */

---reversados
SELECT MOVRRNBEP, MOVFPRO, MOVFCRE, SERCODI, PRECODI, MOVESTA
FROM GXFINDTA.TCLMOV
WHERE MOVESTA = 'R'
  AND MOVRRNBEP IN
      (SELECT REVNROREF FROM GXFINDTA.TCLREV WHERE REVSERCODI = 'COMPRA' AND REVPRECODI = 'PXQR' AND REVFCHPRO < '20250603');
