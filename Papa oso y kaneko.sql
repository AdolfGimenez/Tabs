-- DRCONBEP
-- Corregiro COD.COMERCIO LIDCOM, lcomcr comercio
select * from libdebito.drconbep where lcautr in (
'436282', '975694', '562562', 
'135600', '095477', '260244', 
'023219', '264494') 
and lfectr>='20211027'
and lidcom='2300569'

update libdebito.drconbep set LIDCOM='1001177', codeno='FARMACIA KANEKO SUC'
where lcautr in (
'436282', '975694', '562562', 
'135600', '095477', '260244', 
'023219', '264494') 
and lfectr>='20211027'
and lidcom='2300569'

-- Opmovi
-- corregir opcomer

select * from  gxopera.opmovi where 
OPCODAUT in ('436282', '975694', '562562', 
'135600', '095477', '260244', 
'023219', '264494')
and OPFEREA>='20211001'
and opcomer='2300569'

update gxopera.opmovi set OPCOMER='1001177'
where 
OPCODAUT in ('436282', '975694', '562562', 
'135600', '095477', '260244', 
'023219', '264494')
and OPFEREA>='20211001'
and opcomer='2300569'

----------------------------------------
--OPRECLE
--002
-- DESCONTAR MONTO Y CANTIDAD PAPA OSO
-- DESCONTAR MONTO Y CANTIDAD PAPA OSO 002 EN ESTE CASO ELIMINAR
select * from gxopera.oprecle where RECOMER='2300569' and refech in('20211101') and reenti='002'
DELETE gxopera.oprecle where RECOMER='2300569' and refech in('20211101') and reenti='002'

--INSERTAR MONTO Y CANTIDAD A KANEKO 002 20211101
select * from gxopera.oprecle where RECOMER='1001177' and refech in('20211101') and reenti='002'
INSERT INTO GXOPERA.OPRECLE
(
  REFECH,
  REENTI,
  REMOVI,
  RECOMER,
  RETARTIP,
  REENEMI,
  READMIN,
  RECANT,
  REMONTO,
  REUSER,
  REFPROC,
  REPRUSR,
  REPRFEC
)
VALUES
(
  '20211101',
  '002',
  'COP',
  '1001177',
  'DEB',
  '002',
  '999',
  1,
  64809,
  'QCOMUNICA ',
  '02/11/21',
  '          ',
  '        '
);

-- DESCONTAR MONTO Y CANTIDAD PAPA OSO
select * from gxopera.oprecle where RECOMER='2300569' and refech in('20211101') and reenti='540'

update gxopera.oprecle set recant=recant-1, remonto=remonto-27580
where RECOMER='2300569' and refech in('20211101') and reenti='540'

--INSERTAR MONTO Y CANTIDAD A KANEKO 540 20211101
select * from gxopera.oprecle where RECOMER='1001177' and refech in('20211101') and reenti='540'
INSERT INTO GXOPERA.OPRECLE
(
  REFECH,
  REENTI,
  REMOVI,
  RECOMER,
  RETARTIP,
  REENEMI,
  READMIN,
  RECANT,
  REMONTO,
  REUSER,
  REFPROC,
  REPRUSR,
  REPRFEC
)
VALUES
(
  '20211101',
  '540',
  'COP',
  '1001177',
  'CRE',
  '540',
  '999',
  1,
  27580,
  'U99OVELAR ',
  '02/11/21',
  '          ',
  '        '
);

-- DESCONTAR MONTO Y CANTIDAD PAPA OSO 530 20211101 -- VER PORQUEE HAY DEB Y CRE

select * from gxopera.oprecle where RECOMER='2300569' and refech in('20211101') and reenti='530'
DELETE gxopera.oprecle where RECOMER='2300569' and refech in('20211101') and reenti='530' and RETARTIP='CRE'

update gxopera.oprecle set recant=recant-1, remonto=remonto-68454
where RECOMER='2300569' and refech in('20211101') and reenti='530' and RETARTIP='DEB'

--INSERTAR MONTO Y CANTIDAD A KANEKO 530 20211101

select * from gxopera.oprecle where RECOMER='1001177' and refech in('20211101') and reenti='530'

INSERT INTO GXOPERA.OPRECLE
(
  REFECH,
  REENTI,
  REMOVI,
  RECOMER,
  RETARTIP,
  REENEMI,
  READMIN,
  RECANT,
  REMONTO,
  REUSER,
  REFPROC,
  REPRUSR,
  REPRFEC
)
VALUES
(
  '20211101',
  '530',
  'COP',
  '1001177',
  'DEB',
  '530',
  '999',
  1,
  68454,
  'U99OVELAR ',
  '02/11/21',
  '          ',
  '        '
);

INSERT INTO GXOPERA.OPRECLE
(
  REFECH,
  REENTI,
  REMOVI,
  RECOMER,
  RETARTIP,
  REENEMI,
  READMIN,
  RECANT,
  REMONTO,
  REUSER,
  REFPROC,
  REPRUSR,
  REPRFEC
)
VALUES
(
  '20211101',
  '530',
  'COP',
  '1001177',
  'CRE',
  '530',
  '999',
  1,
  28456,
  'U99OVELAR ',
  '02/11/21',
  '          ',
  '        '
);

---DESCONTAR MONTO Y CANTIDAD PAPA OSO 581 20211102 

select * from gxopera.oprecle where RECOMER='2300569' and refech in('20211102') and reenti='581'
DELETE gxopera.oprecle where RECOMER='2300569' and refech in('20211102') and reenti='581'

--INSERTAR MONTO Y CANTIDAD A KANEKO 581 20211102
select * from gxopera.oprecle where RECOMER='1001177' and refech in('20211102') and reenti='581'

INSERT INTO GXOPERA.OPRECLE
(
  REFECH,
  REENTI,
  REMOVI,
  RECOMER,
  RETARTIP,
  REENEMI,
  READMIN,
  RECANT,
  REMONTO,
  REUSER,
  REFPROC,
  REPRUSR,
  REPRFEC
)
VALUES
(
  '20211102',
  '581',
  'COP',
  '1001177',
  'DEB',
  '581',
  '999',
  1,
  14306,
  'U99OVELAR ',
  '03/11/21',
  '          ',
  '        '
);

--DESCONTAR MONTO Y CANTIDAD PAPA OSO 540 20211108 
select * from gxopera.oprecle where RECOMER='2300569' and refech in('20211108') and reenti='540'

update gxopera.oprecle set recant=recant-3, remonto=remonto-660581
where RECOMER='2300569' and refech in('20211108') and reenti='540'

--INSERTAR MONTO Y CANTIDAD A KANEKO 5540 20211108
select * from gxopera.oprecle where RECOMER='1001177' and refech in('20211108') and reenti='540'

INSERT INTO GXOPERA.OPRECLE
(
  REFECH,
  REENTI,
  REMOVI,
  RECOMER,
  RETARTIP,
  REENEMI,
  READMIN,
  RECANT,
  REMONTO,
  REUSER,
  REFPROC,
  REPRUSR,
  REPRFEC
)
VALUES
(
  '20211108',
  '540',
  'COP',
  '1001177',
  'CRE',
  '540',
  '999',
  3,
  660581,
  'U99OVELAR ',
  '09/11/21',
  '          ',
  '        '
);

-- FLICOM
-- PAPA OSO
--NADA ACA PROQUE FLICOM 1 TIENE TRX
select * from gxopera.flicom where lifechd in ('20211101') and licomer='2300569' AND LINROFIN='0'
--NADA ACA PROQUE FLICOM 1 TIENE TRX
select * from gxopera.flicom where lifechd in ('20211102') and licomer='2300569' AND LINROFIN='0'
--NADA ACA PROQUE FLICOM 1 TIENE TRX
select * from gxopera.flicom where lifechd in ('20211108') and licomer='2300569' AND LINROFIN='0'

-- KANEKO
select * from gxopera.flicom where lifechd in ('20211101') and licomer='1001177' AND LINROFIN='0'

INSERT INTO GXOPERA.FLICOM
(
  LICOMER,
  LIFECHD,
  LIFECHH,
  LICODTR,
  LINRO,
  LINROASI,
  LIFEPCO,
  LIFECHP,
  LIHORA,
  LIUSER,
  LICOZONA,
  LIPEPAGO,
  LITIDOCU,
  LICODBAN,
  LICTABCO,
  LITIPAGO,
  LINRODOC,
  LITIPCTA,
  LISTATUS,
  LINROFIN
)
VALUES
(
  '1001177',
  '20211101',
  '20211101',
  '000054',
  0,
  0,
  '20010101',
  '20211030',
  '09:46:51  ',
  'QCOMUNICA ',
  'ES',
  '2   ',
  'INS',
  'BG',
  149134000,
  '1 ',
  1179050001,
  0,
  ' ',
  0
);

select * from gxopera.flicom where lifechd in ('20211102') and licomer='1001177' AND LINROFIN='0'
INSERT INTO GXOPERA.FLICOM
(
  LICOMER,
  LIFECHD,
  LIFECHH,
  LICODTR,
  LINRO,
  LINROASI,
  LIFEPCO,
  LIFECHP,
  LIHORA,
  LIUSER,
  LICOZONA,
  LIPEPAGO,
  LITIDOCU,
  LICODBAN,
  LICTABCO,
  LITIPAGO,
  LINRODOC,
  LITIPCTA,
  LISTATUS,
  LINROFIN
)
VALUES
(
  '1001177',
  '20211102',
  '20211102',
  '000054',
  0,
  0,
  '20010101',
  '20211102',
  '09:46:51  ',
  'QCOMUNICA ',
  'ES',
  '2   ',
  'INS',
  'BG',
  149134000,
  '1 ',
  1179050001,
  0,
  ' ',
  0
);


-- No hace falta porque ya hay registro
select * from gxopera.flicom where lifechd in ('20211108') and licomer='1001177' AND LINROFIN='0'

-- FLICOM1

select * from gxopera.flicom1 where lifechd in ('20211101') and licomer='2300569'  and lifecha='20211029' and LITIPTAR='CRE' AND LINROFAC='0'
update gxopera.flicom1 set LICANT=LICANT-1, LIMONTO=LIMONTO-28456, LICOBPS=LICOBPS-854, LIIVABPS=LIIVABPS-85, LIRENTA=LIRENTA-285, LIREIVA=LIREIVA-259, lineto=lineto-26973
where lifechd in ('20211101') and licomer='2300569' and lifecha='20211029' and LITIPTAR='CRE' AND LINROFAC='0'

select * from gxopera.flicom1 where lifechd in ('20211101') and licomer='2300569' and lifecha='20211030' and LITIPTAR='CRE' AND LINROFAC='0'
update gxopera.flicom1 set LICANT=LICANT-1, LIMONTO=LIMONTO-27580, LICOBPS=LICOBPS-827, LIIVABPS=LIIVABPS-83, lineto=lineto-26670
where lifechd in ('20211101') and licomer='2300569' and lifecha='20211030' and LITIPTAR='CRE' AND LINROFAC='0'

select * from gxopera.flicom1 where lifechd in ('20211101') and licomer='2300569' and lifecha='20211030' and LITIPTAR='DEB' AND LINROFAC='0'
update gxopera.flicom1 set LICANT=LICANT-1, LIMONTO=LIMONTO-64809, LICOent=LICOent-972, LICOBPS=LICOBPS-972,LIIVAent=LIIVAent-97 ,LIIVABPS=LIIVABPS-97, lineto=lineto-62671
where lifechd in ('20211101') and licomer='2300569' and lifecha='20211030' and LITIPTAR='DEB' AND LINROFAC='0'

select * from gxopera.flicom1 where lifechd in ('20211101') and licomer='2300569' and lifecha='20211101' and LITIPTAR='DEB' AND LINROFAC='0'
update gxopera.flicom1 set LICANT=LICANT-1, LIMONTO=LIMONTO-68454, LICOBPS=LICOBPS-2054 ,LIIVABPS=LIIVABPS-205, lineto=lineto-66195
where lifechd in ('20211101') and licomer='2300569' and lifecha='20211101' and LITIPTAR='DEB' AND LINROFAC='0'

select * from gxopera.flicom1 where lifechd in ('20211102') and licomer='2300569' and lifecha='20211102' and LITIPTAR='DEB' AND LINROFAC='0'
update gxopera.flicom1 set LICANT=LICANT-1, LIMONTO=LIMONTO-14306, LICOent=LICOent-258, LICOBPS=LICOBPS-172, LIivaent=LIivaent-26 ,LIIVABPS=LIIVABPS-17, lineto=lineto-13833
where lifechd in ('20211102') and licomer='2300569' and lifecha='20211102' and LITIPTAR='DEB' AND LINROFAC='0'
 
select * from gxopera.flicom1 where lifechd in ('20211108') and licomer='2300569' and lifecha='20211105' and LITIPTAR='CRE' AND LINROFAC='0'
DELETE gxopera.flicom1 where lifechd in ('20211108') and licomer='2300569' and lifecha='20211105' and LITIPTAR='CRE' AND LINROFAC='0'


select * from gxopera.flicom1 where lifechd in ('20211101') and licomer='1001177' AND LINROFAC='0'
--Insert1
INSERT INTO GXOPERA.FLICOM1
(
  LICOMER,
  LIFECHD,
  LIFECHH,
  LICODTR,
  LIFECHA,
  LITIPTAR,
  LICANT,
  LIMONTO,
  LICOENT,
  LIIVAENT,
  LICOBPS,
  LIIVABPS,
  LIRENTA,
  LIREIVA,
  LINETO,
  LINROINS,
  LIFECREDI,
  LINROFAC
)
VALUES
(
  '1001177',
  '20211101',
  '20211101',
  '000054',
  '20211029',
  'CRE',
  1,
  28456.00,
  0.00,
  854.00,
  0.00,
  85.00,
  285.00,
  259.00,
  26973.00,
  0,
  '20211102',
  0
);

-- insert 2
INSERT INTO GXOPERA.FLICOM1
(
  LICOMER,
  LIFECHD,
  LIFECHH,
  LICODTR,
  LIFECHA,
  LITIPTAR,
  LICANT,
  LIMONTO,
  LICOENT,
  LIIVAENT,
  LICOBPS,
  LIIVABPS,
  LIRENTA,
  LIREIVA,
  LINETO,
  LINROINS,
  LIFECREDI,
  LINROFAC
)
VALUES
(
  '1001177',
  '20211101',
  '20211101',
  '000054',
  '20211030',
  'CRE',
  1,
  27580.00,
  0.00,
  827.00,
  0.00,
  83.00,
  0.00,
  0.00,
  26670.00,
  0,
  '20211102',
  0
);

-- insert 3
INSERT INTO GXOPERA.FLICOM1
(
  LICOMER,
  LIFECHD,
  LIFECHH,
  LICODTR,
  LIFECHA,
  LITIPTAR,
  LICANT,
  LIMONTO,
  LICOENT,
  LIIVAENT,
  LICOBPS,
  LIIVABPS,
  LIRENTA,
  LIREIVA,
  LINETO,
  LINROINS,
  LIFECREDI,
  LINROFAC
)
VALUES
(
  '1001177',
  '20211101',
  '20211101',
  '000054',
  '20211030',
  'DEB',
  1,
  64809.00,
  972.00,
  972.00,
  97.00,
  97.00,
  0.00,
  0.00,
  62671.00,
  0,
  '20211102',
  0
);

-- insert 4
INSERT INTO GXOPERA.FLICOM1
(
  LICOMER,
  LIFECHD,
  LIFECHH,
  LICODTR,
  LIFECHA,
  LITIPTAR,
  LICANT,
  LIMONTO,
  LICOENT,
  LIIVAENT,
  LICOBPS,
  LIIVABPS,
  LIRENTA,
  LIREIVA,
  LINETO,
  LINROINS,
  LIFECREDI,
  LINROFAC
)
VALUES
(
  '1001177',
  '20211101',
  '20211101',
  '000054',
  '20211101',
  'DEB',
  1,
  68454.00,
  0.00,
  2054.00,
  0.00,
  205.00,
  0.00,
  0.00,
  66195.00,
  0,
  '20211102',
  0
);

select * from gxopera.flicom1 where lifechd in ('20211102') and licomer='1001177' AND LINROFAC='0'

INSERT INTO GXOPERA.FLICOM1
(
  LICOMER,
  LIFECHD,
  LIFECHH,
  LICODTR,
  LIFECHA,
  LITIPTAR,
  LICANT,
  LIMONTO,
  LICOENT,
  LIIVAENT,
  LICOBPS,
  LIIVABPS,
  LIRENTA,
  LIREIVA,
  LINETO,
  LINROINS,
  LIFECREDI,
  LINROFAC
)
VALUES
(
  '1001177',
  '20211102',
  '20211102',
  '000054',
  '20211102',
  'DEB',
  1,
  14306.00,
  258.00,
  172.00,
  26.00,
  17.00,
  0.00,
  0.00,
  13833.00,
  0,
  '20211103',
  0
);

select * from gxopera.flicom1 where lifechd in ('20211108') and licomer='1001177' AND LINROFAC='0'
INSERT INTO GXOPERA.FLICOM1
(
  LICOMER,
  LIFECHD,
  LIFECHH,
  LICODTR,
  LIFECHA,
  LITIPTAR,
  LICANT,
  LIMONTO,
  LICOENT,
  LIIVAENT,
  LICOBPS,
  LIIVABPS,
  LIRENTA,
  LIREIVA,
  LINETO,
  LINROINS,
  LIFECREDI,
  LINROFAC
)
VALUES
(
  '1001177',
  '20211108',
  '20211108',
  '000054',
  '20211105',
  'CRE',
  3,
  660581.00,
  0.00,
  0.00,
  19817.00,
  1983.00,
  4785.00,
  4350.00,
  629646.00,
  0,
  '20211109',
  0
);
-------------------------------------------------------------

-- Verificaciones


select count(*), sum(limpgs), lenemi, ENEADM, lcodtr, lfcotr from libdebito.drconbep where lcautr in (
'436282', '975694', '135600', '095477', 
'260244', '023219', '264494') 
and lfectr>='20211027'
and lidcom='2300569'
group by lenemi, eneadm, lcodtr, lfcotr

-- hasta aca hice sr


select * from gxopera.opmovi  where OPCODAUT in ('436282', '975694', 
'562562', '135600', '095477', 
'260244', '023219', '264494') 
and OPCOMER='2300569'
and OPFEREA>='20211001'
group by OPFECOM, opcomer, optiptar, opferea, openemi

select OPFECOM, OPCOMER, optiptar, opferea,  openemi, count(*) AS CANTIDAD, sum(opmonto) AS MONTO, SUM(OPCOMENT) AS COMI_ENT, 
SUM(OPCOMBPS) AS COMI_BEPSA, SUM(OPIVAENT) AS IVA_ENT, SUM(OPIVABPS) AS IVA_BPS, SUM(oprenta) AS RENTA, 
SUM(opreiva) AS IVARENTA, sum(opmonto-opcomi-oprenta-opreiva) as NETOOO from gxopera.opmovi where OPCODAUT in ( '436282', '975694', 
'562562', '135600', '095477', 
'260244', '023219', '264494') 
and OPCOMER='2300569'
and OPFEREA>='20211001'
group by OPFECOM, opcomer, optiptar, opferea, openemi

-----------------------------------

select * from gxfindta.tcltsb where TSBNREF='130399988937'

-- COD COMERCIO LIDCOM, lcomcr comercio

select SUM(LIMPGS) FROM libdebito.drconbep where lcautr in (
'817674', '436282', '975694', 
'562562', '135600', '095477', 
'260244', '023219', '264494') 
and lfectr>='20211001'
and lidcom='2300569'


select OPFECOM, OPCOMER, optiptar, opferea,  sum(opmonto-opcomi-oprenta-opreiva) from gxopera.opmovi  where OPCODAUT in ('817674', '436282', '975694', 
'562562', '135600', '095477', 
'260244', '023219', '264494') 
and OPCOMER='2300569'
and OPFEREA>='20211001'
group by OPFECOM, opcomer, optiptar, opferea

--opcomer

corregir

select * from gxopera.flicom where lifechd in ('20211101', '20211102',  '20211108', '20211027') and licomer='2300569'
-- comercio

select * from gxopera.flicom1 where lifechd in ('20211101', '20211102',  '20211108', '20211027') and licomer='2300569'





SELECT * FROM GXOPERA.OPLIQUI WHERE OPNROREF IN ('129997675805', 
'130299402477', 
'130399918939', 
'130399988937', 
'130500624187', 
'130600942093', 
'130901945440', 
'130901951870', 
'130901978575') 

select * from gxbdbps.comaeaf where cocomer in('2300569', '1001177')

OSO - 057 2300569 CONTI
KANEKO 061 1001177 GNB

SELECT * FROM GXOPERA.CLPARF




select lcautr FROM libdebito.drconbep where lcautr in (
'817674', '436282', '975694', 
'562562', '135600', '095477', 
'260244', '023219', '264494') 
and lfectr>='20211001'
and lidcom='2300569'

--817674




436282
975694
562562
135600
095477
260244
023219
264494


-- DRCONBEP
-- Corregiro COD.COMERCIO LIDCOM, lcomcr comercio
select * from libdebito.drconbep where lcautr in (
'436282', '975694', '562562', 
'135600', '095477', '260244', 
'023219', '264494') 
and lfectr>='20211027'
and lidcom='2300569'

update libdebito.drconbep set LIDCOM='1001177', LCOMTR='FARMACIA KANEKO SUC'
where lcautr in (
'436282', '975694', '562562', 
'135600', '095477', '260244', 
'023219', '264494') 
and lfectr>='20211027'
and lidcom='2300569'

-- Opmovi
-- corregir opcomer

select * from  gxopera.opmovi where 
OPCODAUT in ('436282', '975694', '562562', 
'135600', '095477', '260244', 
'023219', '264494')
and OPFEREA>='20211001'
and opcomer='2300569'

update gxopera.opmovi set OPCOMER='1001177'
where 
OPCODAUT in ('436282', '975694', '562562', 
'135600', '095477', '260244', 
'023219', '264494')
and OPFEREA>='20211001'
and opcomer='2300569'

----------------------------------------
--OPRECLE
--002
-- DESCONTAR MONTO Y CANTIDAD PAPA OSO
-- DESCONTAR MONTO Y CANTIDAD PAPA OSO 002 EN ESTE CASO ELIMINAR
select * from gxopera.oprecle where RECOMER='2300569' and refech in('20211101') and reenti='002'
DELETE gxopera.oprecle where RECOMER='2300569' and refech in('20211101') and reenti='002'

--INSERTAR MONTO Y CANTIDAD A KANEKO 002 20211101
select * from gxopera.oprecle where RECOMER='1001177' and refech in('20211101') and reenti='002'
INSERT INTO GXOPERA.OPRECLE
(
  REFECH,
  REENTI,
  REMOVI,
  RECOMER,
  RETARTIP,
  REENEMI,
  READMIN,
  RECANT,
  REMONTO,
  REUSER,
  REFPROC,
  REPRUSR,
  REPRFEC
)
VALUES
(
  '20211101',
  '002',
  'COP',
  '1001177',
  'DEB',
  '002',
  '999',
  1,
  64809,
  'QCOMUNICA ',
  '02/11/21',
  '          ',
  '        '
);

-- DESCONTAR MONTO Y CANTIDAD PAPA OSO
select * from gxopera.oprecle where RECOMER='2300569' and refech in('20211101') and reenti='540'

update gxopera.oprecle set recant=recant-1, remonto=remonto-27580
where RECOMER='2300569' and refech in('20211101') and reenti='540'

--INSERTAR MONTO Y CANTIDAD A KANEKO 540 20211101
select * from gxopera.oprecle where RECOMER='1001177' and refech in('20211101') and reenti='540'
INSERT INTO GXOPERA.OPRECLE
(
  REFECH,
  REENTI,
  REMOVI,
  RECOMER,
  RETARTIP,
  REENEMI,
  READMIN,
  RECANT,
  REMONTO,
  REUSER,
  REFPROC,
  REPRUSR,
  REPRFEC
)
VALUES
(
  '20211101',
  '540',
  'COP',
  '1001177',
  'CRE',
  '540',
  '999',
  1,
  27580,
  'U99OVELAR ',
  '02/11/21',
  '          ',
  '        '
);

-- DESCONTAR MONTO Y CANTIDAD PAPA OSO 530 20211101 -- VER PORQUEE HAY DEB Y CRE

select * from gxopera.oprecle where RECOMER='2300569' and refech in('20211101') and reenti='530'
DELETE gxopera.oprecle where RECOMER='2300569' and refech in('20211101') and reenti='530' and RETARTIP='CRE'

update gxopera.oprecle set recant=recant-1, remonto=remonto-68454
where RECOMER='2300569' and refech in('20211101') and reenti='530' and RETARTIP='DEB'

--INSERTAR MONTO Y CANTIDAD A KANEKO 530 20211101

select * from gxopera.oprecle where RECOMER='1001177' and refech in('20211101') and reenti='530'

INSERT INTO GXOPERA.OPRECLE
(
  REFECH,
  REENTI,
  REMOVI,
  RECOMER,
  RETARTIP,
  REENEMI,
  READMIN,
  RECANT,
  REMONTO,
  REUSER,
  REFPROC,
  REPRUSR,
  REPRFEC
)
VALUES
(
  '20211101',
  '530',
  'COP',
  '1001177',
  'DEB',
  '530',
  '999',
  1,
  68454,
  'U99OVELAR ',
  '02/11/21',
  '          ',
  '        '
);

INSERT INTO GXOPERA.OPRECLE
(
  REFECH,
  REENTI,
  REMOVI,
  RECOMER,
  RETARTIP,
  REENEMI,
  READMIN,
  RECANT,
  REMONTO,
  REUSER,
  REFPROC,
  REPRUSR,
  REPRFEC
)
VALUES
(
  '20211101',
  '530',
  'COP',
  '1001177',
  'CRE',
  '530',
  '999',
  1,
  28456,
  'U99OVELAR ',
  '02/11/21',
  '          ',
  '        '
);

---DESCONTAR MONTO Y CANTIDAD PAPA OSO 581 20211102 

select * from gxopera.oprecle where RECOMER='2300569' and refech in('20211102') and reenti='581'
DELETE gxopera.oprecle where RECOMER='2300569' and refech in('20211102') and reenti='581'

--INSERTAR MONTO Y CANTIDAD A KANEKO 581 20211102
select * from gxopera.oprecle where RECOMER='1001177' and refech in('20211102') and reenti='581'

INSERT INTO GXOPERA.OPRECLE
(
  REFECH,
  REENTI,
  REMOVI,
  RECOMER,
  RETARTIP,
  REENEMI,
  READMIN,
  RECANT,
  REMONTO,
  REUSER,
  REFPROC,
  REPRUSR,
  REPRFEC
)
VALUES
(
  '20211102',
  '581',
  'COP',
  '1001177',
  'DEB',
  '581',
  '999',
  1,
  14306,
  'U99OVELAR ',
  '03/11/21',
  '          ',
  '        '
);

--DESCONTAR MONTO Y CANTIDAD PAPA OSO 540 20211108 
select * from gxopera.oprecle where RECOMER='2300569' and refech in('20211108') and reenti='540'

update gxopera.oprecle set recant=recant-3, remonto=remonto-660581
where RECOMER='2300569' and refech in('20211108') and reenti='540'

--INSERTAR MONTO Y CANTIDAD A KANEKO 5540 20211108
select * from gxopera.oprecle where RECOMER='1001177' and refech in('20211108') and reenti='540'

INSERT INTO GXOPERA.OPRECLE
(
  REFECH,
  REENTI,
  REMOVI,
  RECOMER,
  RETARTIP,
  REENEMI,
  READMIN,
  RECANT,
  REMONTO,
  REUSER,
  REFPROC,
  REPRUSR,
  REPRFEC
)
VALUES
(
  '20211108',
  '540',
  'COP',
  '1001177',
  'CRE',
  '540',
  '999',
  3,
  660581,
  'U99OVELAR ',
  '09/11/21',
  '          ',
  '        '
);

-- FLICOM
-- PAPA OSO
--NADA ACA PROQUE FLICOM 1 TIENE TRX
select * from gxopera.flicom where lifechd in ('20211101') and licomer='2300569' AND LINROFIN='0'
--NADA ACA PROQUE FLICOM 1 TIENE TRX
select * from gxopera.flicom where lifechd in ('20211102') and licomer='2300569' AND LINROFIN='0'
--NADA ACA PROQUE FLICOM 1 TIENE TRX
select * from gxopera.flicom where lifechd in ('20211108') and licomer='2300569' AND LINROFIN='0'

-- KANEKO
select * from gxopera.flicom where lifechd in ('20211101') and licomer='1001177' AND LINROFIN='0'

INSERT INTO GXOPERA.FLICOM
(
  LICOMER,
  LIFECHD,
  LIFECHH,
  LICODTR,
  LINRO,
  LINROASI,
  LIFEPCO,
  LIFECHP,
  LIHORA,
  LIUSER,
  LICOZONA,
  LIPEPAGO,
  LITIDOCU,
  LICODBAN,
  LICTABCO,
  LITIPAGO,
  LINRODOC,
  LITIPCTA,
  LISTATUS,
  LINROFIN
)
VALUES
(
  '1001177',
  '20211101',
  '20211101',
  '000054',
  0,
  0,
  '20010101',
  '20211030',
  '09:46:51  ',
  'QCOMUNICA ',
  'ES',
  '2   ',
  'INS',
  'BG',
  149134000,
  '1 ',
  1179050001,
  0,
  ' ',
  0
);

select * from gxopera.flicom where lifechd in ('20211102') and licomer='1001177' AND LINROFIN='0'
INSERT INTO GXOPERA.FLICOM
(
  LICOMER,
  LIFECHD,
  LIFECHH,
  LICODTR,
  LINRO,
  LINROASI,
  LIFEPCO,
  LIFECHP,
  LIHORA,
  LIUSER,
  LICOZONA,
  LIPEPAGO,
  LITIDOCU,
  LICODBAN,
  LICTABCO,
  LITIPAGO,
  LINRODOC,
  LITIPCTA,
  LISTATUS,
  LINROFIN
)
VALUES
(
  '1001177',
  '20211102',
  '20211102',
  '000054',
  0,
  0,
  '20010101',
  '20211102',
  '09:46:51  ',
  'QCOMUNICA ',
  'ES',
  '2   ',
  'INS',
  'BG',
  149134000,
  '1 ',
  1179050001,
  0,
  ' ',
  0
);

-- No hace falta porque ya hay registro
select * from gxopera.flicom where lifechd in ('20211108') and licomer='1001177' AND LINROFIN='0'

-- FLICOM1

select * from gxopera.flicom1 where lifechd in ('20211101') and licomer='2300569'  and lifecha='20211029' and LITIPTAR='CRE' AND LINROFAC='0'
update gxopera.flicom1 set LICANT=LICANT-1, LIMONTO=LIMONTO-28456, LICOBPS=LICOBPS-854, LIIVABPS=LIIVABPS-85, LIRENTA=LIRENTA-285, LIREIVA=LIREIVA-259, lineto=lineto-26973
where lifechd in ('20211101') and licomer='2300569' and lifecha='20211029' and LITIPTAR='CRE' AND LINROFAC='0'

select * from gxopera.flicom1 where lifechd in ('20211101') and licomer='2300569' and lifecha='20211030' and LITIPTAR='CRE' AND LINROFAC='0'
update gxopera.flicom1 set LICANT=LICANT-1, LIMONTO=LIMONTO-27580, LICOBPS=LICOBPS-827, LIIVABPS=LIIVABPS-83, lineto=lineto-26670
where lifechd in ('20211101') and licomer='2300569' and lifecha='20211030' and LITIPTAR='CRE' AND LINROFAC='0'

select * from gxopera.flicom1 where lifechd in ('20211101') and licomer='2300569' and lifecha='20211030' and LITIPTAR='DEB' AND LINROFAC='0'
update gxopera.flicom1 set LICANT=LICANT-1, LIMONTO=LIMONTO-64809, LICOent=LICOent-972, LICOBPS=LICOBPS-972,LIIVAent=LIIVAent-97 ,LIIVABPS=LIIVABPS-97, lineto=lineto-62671
where lifechd in ('20211101') and licomer='2300569' and lifecha='20211030' and LITIPTAR='DEB' AND LINROFAC='0'

select * from gxopera.flicom1 where lifechd in ('20211101') and licomer='2300569' and lifecha='20211101' and LITIPTAR='DEB' AND LINROFAC='0'
update gxopera.flicom1 set LICANT=LICANT-1, LIMONTO=LIMONTO-68454, LICOBPS=LICOBPS-2054 ,LIIVABPS=LIIVABPS-205, lineto=lineto-66195
where lifechd in ('20211101') and licomer='2300569' and lifecha='20211101' and LITIPTAR='DEB' AND LINROFAC='0'

select * from gxopera.flicom1 where lifechd in ('20211102') and licomer='2300569' and lifecha='20211102' and LITIPTAR='DEB' AND LINROFAC='0'
update gxopera.flicom1 set LICANT=LICANT-1, LIMONTO=LIMONTO-14306, LICOent=LICOent-258, LICOBPS=LICOBPS-172, LIivaent=LIivaent-26 ,LIIVABPS=LIIVABPS-17, lineto=lineto-13833
where lifechd in ('20211102') and licomer='2300569' and lifecha='20211102' and LITIPTAR='DEB' AND LINROFAC='0'

select * from gxopera.flicom1 where lifechd in ('20211108') and licomer='2300569' and lifecha='20211105' and LITIPTAR='CRE' AND LINROFAC='0'
DELETE gxopera.flicom1 where lifechd in ('20211108') and licomer='2300569' and lifecha='20211105' and LITIPTAR='CRE' AND LINROFAC='0'

select * from gxopera.flicom1 where lifechd in ('20211101') and licomer='1001177' AND LINROFAC='0'
--Insert1
INSERT INTO GXOPERA.FLICOM1
(
  LICOMER,
  LIFECHD,
  LIFECHH,
  LICODTR,
  LIFECHA,
  LITIPTAR,
  LICANT,
  LIMONTO,
  LICOENT,
  LIIVAENT,
  LICOBPS,
  LIIVABPS,
  LIRENTA,
  LIREIVA,
  LINETO,
  LINROINS,
  LIFECREDI,
  LINROFAC
)
VALUES
(
  '1001177',
  '20211101',
  '20211101',
  '000054',
  '20211029',
  'CRE',
  1,
  28456.00,
  0.00,
  854.00,
  0.00,
  85.00,
  285.00,
  259.00,
  26973.00,
  0,
  '20211102',
  0
);

-- insert 2
INSERT INTO GXOPERA.FLICOM1
(
  LICOMER,
  LIFECHD,
  LIFECHH,
  LICODTR,
  LIFECHA,
  LITIPTAR,
  LICANT,
  LIMONTO,
  LICOENT,
  LIIVAENT,
  LICOBPS,
  LIIVABPS,
  LIRENTA,
  LIREIVA,
  LINETO,
  LINROINS,
  LIFECREDI,
  LINROFAC
)
VALUES
(
  '1001177',
  '20211101',
  '20211101',
  '000054',
  '20211030',
  'CRE',
  1,
  27580.00,
  0.00,
  827.00,
  0.00,
  83.00,
  0.00,
  0.00,
  26670.00,
  0,
  '20211102',
  0
);

-- insert 3
INSERT INTO GXOPERA.FLICOM1
(
  LICOMER,
  LIFECHD,
  LIFECHH,
  LICODTR,
  LIFECHA,
  LITIPTAR,
  LICANT,
  LIMONTO,
  LICOENT,
  LIIVAENT,
  LICOBPS,
  LIIVABPS,
  LIRENTA,
  LIREIVA,
  LINETO,
  LINROINS,
  LIFECREDI,
  LINROFAC
)
VALUES
(
  '1001177',
  '20211101',
  '20211101',
  '000054',
  '20211030',
  'DEB',
  1,
  64809.00,
  972.00,
  972.00,
  97.00,
  97.00,
  0.00,
  0.00,
  62671.00,
  0,
  '20211102',
  0
);

-- insert 4
INSERT INTO GXOPERA.FLICOM1
(
  LICOMER,
  LIFECHD,
  LIFECHH,
  LICODTR,
  LIFECHA,
  LITIPTAR,
  LICANT,
  LIMONTO,
  LICOENT,
  LIIVAENT,
  LICOBPS,
  LIIVABPS,
  LIRENTA,
  LIREIVA,
  LINETO,
  LINROINS,
  LIFECREDI,
  LINROFAC
)
VALUES
(
  '1001177',
  '20211101',
  '20211101',
  '000054',
  '20211101',
  'DEB',
  1,
  68454.00,
  0.00,
  2054.00,
  0.00,
  205.00,
  0.00,
  0.00,
  66195.00,
  0,
  '20211102',
  0
);

select * from gxopera.flicom1 where lifechd in ('20211102') and licomer='1001177' AND LINROFAC='0'

INSERT INTO GXOPERA.FLICOM1
(
  LICOMER,
  LIFECHD,
  LIFECHH,
  LICODTR,
  LIFECHA,
  LITIPTAR,
  LICANT,
  LIMONTO,
  LICOENT,
  LIIVAENT,
  LICOBPS,
  LIIVABPS,
  LIRENTA,
  LIREIVA,
  LINETO,
  LINROINS,
  LIFECREDI,
  LINROFAC
)
VALUES
(
  '1001177',
  '20211102',
  '20211102',
  '000054',
  '20211102',
  'DEB',
  1,
  14306.00,
  258.00,
  172.00,
  26.00,
  17.00,
  0.00,
  0.00,
  13833.00,
  0,
  '20211103',
  0
);

select * from gxopera.flicom1 where lifechd in ('20211108') and licomer='1001177' AND LINROFAC='0'
INSERT INTO GXOPERA.FLICOM1
(
  LICOMER,
  LIFECHD,
  LIFECHH,
  LICODTR,
  LIFECHA,
  LITIPTAR,
  LICANT,
  LIMONTO,
  LICOENT,
  LIIVAENT,
  LICOBPS,
  LIIVABPS,
  LIRENTA,
  LIREIVA,
  LINETO,
  LINROINS,
  LIFECREDI,
  LINROFAC
)
VALUES
(
  '1001177',
  '20211108',
  '20211108',
  '000054',
  '20211105',
  'CRE',
  3,
  660581.00,
  0.00,
  0.00,
  19817.00,
  1983.00,
  4785.00,
  4350.00,
  629646.00,
  0,
  '20211109',
  0
);


