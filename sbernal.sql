--redmine #7109 - validacion de mejoras SIPAP
--se valida la carga de las tablas luego del proceso de SIPAP DIARIO -> CARGA DIARIA -> CARGAR REGISTROS (DESIPAP)
select * from gxopera.desipap where dsftrans = '20200608' order by DSHTRANS asc
delete from gxopera.desipap; commit;

select * from gxopera.pdsipap where pdsftrans = '20200608' order by PDSHTRANS asc
delete from gxopera.pdsipap; commit;
--se carga la misma cantidad de registros en las dos tablas

select * from gxopera.recibos where rfech > '20191231';

select * from gxopera.opmovi where opferea > '20200605';

select * from gxbdbps.gempraf;

--consulta en testing
select * from gxopera.opliqui where substr(opcampoa, 41, 8) = '20200608';

--consulta en desarrollo
select * from libprod.opliqui60 where substr(opcampoa, 41, 8) = '20200608';

--TAREA #7806--

INSERT INTO GXFINDTA.TCLSER VALUES ('DEBITOEN', 'DEBITO A ENTIDADES', '2020-03-12 13:40:00.000', 'U9BERNAL', 'A');
INSERT INTO GXFINDTA.TCLPRE VALUES
('DEBITOEN', 'DEEN', 'DEBITO A ENTIDADES', 'A', '010001', '2020-03-12 13:45:00.000', 'U99BERNAL ', 'TA', '010001', 'WEB ', 'IMA', '', '');
INSERT INTO GXFINDTA.TCLSEB VALUES ('DEBITOEN ', 1020, '02', 'DEBITO A ENTIDADES ', 'U99OCAMPOS', '2020-03-12 13:41:00.000');
INSERT INTO GXFINDTA.TCLSCT VALUES ('DEBITOEN', 'DEEN', 1020, 'CC', '0102184061 ', 'U99BERNAL ', '2020-06-12 16:41:44.625');

select * from GXFINDTA.TCLSEB

[14:48] Silvestre Walter Bernal Riquelme
    

SELECT * FROM QSYS2.SYSPROCS WHERE SPECIFIC_NAME LIKE 'NCLPR010'

--  Generar SQL 
--  Versión:                   	V7R2M0 140418 
--  Generado en:              	18/07/20 14:52:35 
--  Base de datos relacional:       	B10E97CR 
--  Opción de estándares:          	DB2 for i 
CREATE PROCEDURE GXSTRPRC.NCLPR010 ( 
	INOUT OPCREID CHAR(18) , 
	INOUT FECHACRE CHAR(8) ) 
	LANGUAGE RPGLE 
	SPECIFIC GXSTRPRC.NCLPR010 
	NOT DETERMINISTIC 
	MODIFIES SQL DATA 
	CALLED ON NULL INPUT 
	EXTERNAL NAME 'LIBDEBITO/NCLPR010' 
	PARAMETER STYLE GENERAL ; 
  
GRANT ALTER , EXECUTE   
ON SPECIFIC PROCEDURE GXSTRPRC.NCLPR010 
TO DESAPRF2 WITH GRANT OPTION ; 
  
GRANT EXECUTE   
ON SPECIFIC PROCEDURE GXSTRPRC.NCLPR010 
TO PUBLIC ;

select * from libprod.opliqui60 where substr (opcampoa,41,8) = '20200723'

select * from silverlib.optade where OPTDFE = '20200723'

select * from libprod.opmovi60 where OPFECOM = '20200723'

select * from libprod.oprecle60 where refech = '20200723'

select * from gxopera.flicom1 where lifechd = '20200723'

delete from gxopera.flicom1 where lifechd = '20200723'

delete from gxopera.flicom where lifechd = '20200723'

delete from gxopera.opliqui where substr (opcampoa,41,8) = '20200723'

delete from gxopera.optade where OPTDFE = '20200723'

delete from gxopera.opmovi where OPFECOM = '20200723'

delete from gxopera.oprecle where refech = '20200723'

select * from gxbdbps.comaeaf where cocomer = '1001484'

select * from gxbdbps.comaeaf where cocomer  = '6900097'

select *  from cierrelib.comaeaf where cocomer  = '6900097'

INSERT INTO GXFINDTA.TCLPRE
VALUES ( 'CONTRAC', 'COCA', 'REVERSAS Y CONTRACARGOS', 'A', '010001', '2020-03-12 13:46:00.000', 'U99BERNAL ',  'TA', '010001', 'POS  ', 'IMA', '', '');

INSERT INTO GXFINDTA.TCLSER VALUES ( 'PAGOCOM', 'PAGO A COMERCIOS', '2020-03-12 13:40:00.000', 'U9BERNAL  ', 'A' );

select opcrecba, count(*) from gxopera.oplicre
 where OPCREFCOM = '20200715' group by opcrecba
 
select * from gxopera.oplicre
 where OPCREFCOM = '20200608'
 
select * from gxopera.flicom where lifechd = '20200715'

select * from libprod.flicom160 where lifechd = '20200715'

select * from gxopera.fcobros

--estado de los alumnos; 1 activo, 0 inactivo
select estado, count(*) from db.alumnos group by estado

--clearing FASE 2
select * from libdebito.drconbep where lfectr = '20200924' ORDER BY LHORTR DESC;

SELECT * FROM gxbdbps.tswaut WHERE AUTTRXFCHC = '20200924' AND AUTRRNBEP = '26800067607'; --AUTCODSER = 'COMPRA' AND AUTCODPRE = 'COMP';

SELECT * FROM gxfindta.TCLTPC WHERE TPCFPRO = '20200909' AND SERCODI = 'COMPRA' AND PRECODI = 'COMP';

SELECT * FROM gxfindta.TCLMOV WHERE MOVFPRO = '20200909' AND SERCODI = 'COMPRA';

SELECT * FROM gxfindta.TCLTSB WHERE DATE(TSBFEGE) = '2020-09-09' order by TSBIDOP desc;

SELECT * FROM gxfindta.TCLTSD WHERE DATE(TSDFEGE) = '2020-09-09' order by TSBIDOP desc;

select * from gxopera.tclsec where SECCOBCO = '064';

select * from gxopera.opliqui where OPFECLIQ = '20200909';

select * from gxopera.CLPARF;

select * from libdebito.drconbep where lfectr = '20200930' and lidcom = '1001776' order by lhortr desc;

select enemiso from gxbdbps.comaeaf where cocomer = '1001776';


INSERT INTO GXOPERA.TCLSEC
(
  SECCOTRX,
  SECCOBCO,
  SECENBCO,
  SECFEAC,
  SECUSAC,
  SECCTABC,
  SECTPCTA,
  SECBCPAD,
  SECBCODE,
  SECBCDEN,
  SECCEMN,
  SECCOEM,
  SECENBIN
)
VALUES
(
  '000054',
  '002',
  'S',
  '20200309',
  'U99ALBERTO',
  '0102184266  ',
  'K',
  20021,
  '057',
  0,
  1002,
  '002',
  '703020   '
);


select * from cierrelib.comaeaf where substr(cocomer, 1,2) in('45', '90')


CREATE INDEX CONTABILID.UCC20FAC
ON CONTABILID.CC20FAC (FAANOF ASC, FAMESF ASC, FADIAF ASC);

CREATE INDEX GXOPERA.UTCLSEC1 ON GXOPERA.TCLSEC (SECCOTRX,  SECENBIN);

CREATE INDEX GXOPERA.UOPENTID1 ON GXOPERA.OPENTID1 (ENTBIN);

select * from libdebito.drconbep where lfcotr = '20200914' and lcretr = '00' and lesttr = 'A'              
and limpgs > 0 and lbinpr in ('703002','627431')           
and lcodtr = '000054' 

-----
-----
-----
select * from libprod.drconbe60  where lfcotr = '20200918' and lcretr = '00' and lesttr = 'A'              
and limpgs > 0;

select * from libprod.oprecle60 where refech = '20200918';

select substr(optarj,1,6), sum(opmonto-opcomi), opcomer, openemi from gxopera.opmovi where opfecom = '20210105' and opcomer = '1001052'  group by substr(optarj,1,6), opcomer, openemi;
select substr(optarj,1,6), sum(opmonto-opcomi), openemi from gxopera.opmovi where opfecom = '20210105' and OPENEMI = '065' group by substr(optarj,1,6), openemi;
select substr(opcampoa,1,6), sum(opimpor)  from gxopera.opliqui where substr(opcampoa,41,8)  = '20210105' and opncomer = '1001052' group by substr(opcampoa,1,6);
select * from gxopera.flicom1 where licomer = '1001052' and lifechd = '20210105';
select * from gxopera.flicom where licomer = '1001052' and lifechd = '20210105';
select * from gxopera.tclsec where SECCOBCO = '065';
delete from gxopera.tclsec;

select * from gxopera.opmovi where opfecom = '20210105'
select * from gxopera.clparf;

select * from gxbdbps.gentiaf; -- entidades para el precierre


select substr(opcampoa,1,6), sum(opimpor) from gxopera.opliqui where opcodbco=55 and substr(opcampoa,41,8)='20201008' group by substr(opcampoa,1,6);

SELECT * FROM GXTRJDTA.TDGENT WHERE ENTCODENT = '069';

SELECT * FROM gxopera.opmovi where OPFECOM = '20210105' and OPCODTRN = '000054' and OPENEMI = '062'; --and substr(optarj,1,6) <> '627431' and  (OPENEMI <> '530' and OPENEMI <> '540');
select * from gxopera.opentid1 where substr(ENTBIN,1,6) = '627431' and ENTTIPO = 'CRE';

(SELECT substr(optarj,1,6) FROM gxopera.opmovi where OPFECOM = '20200924' and OPCODTRN = '000054' and OPTIPTAR = 'CRE' and substr(optarj,1,6) <> '627431' and  OPENEMI = '777');

select * from libdebito.tbbine0p where QENTEM = '510' AND QEBIN1 IN 
(SELECT substr(optarj,1,6) FROM gxopera.opmovi where OPFECOM = '20200924' and OPCODTRN = '000054' and OPTIPTAR = 'CRE' and substr(optarj,1,6) <> '627431' and  OPENEMI = '777');



select lbinpr, count(*) from libprod.drconbe60 where lfectr = '20200924' and lenemi = '' group by lbinpr

INSERT INTO GXOPERA.CLPARF
(
  PARCODBCO,
  PARDESCRI,
  PARBCOPAI,
  PARCSWIFT,
  PARNROCT1,
  PARTIPCT1,
  PARMONED1,
  PARNROCT2,
  PARTIPCT2,
  PARMONED2,
  PARLIBRE1
)
VALUES
(
  '201',
  'FINANCIERA EL COMERCIO                  ',
  '2007',
  'COMAPYPAXXX     ',
  20045,
  'CC',
  '600',
  0,
  '  ',
  '   ',
  '                            '
);

select * from gxopera.oplicre where OPCRECOM = '0300237'



SELECT * FROM GXBDBPS.COMAEAF WHERE COCOMER = '0100037'

select * from libprod.flicom60 where lifechd = '20200918';

select * from gxopera.flicom1 where licomer = '0200623' and lifechd = '20200918';

select * from gxopera.opliqui where opncomer = '0100122';

--migrabando oplicre

INSERT INTO GXOPERA.TCLSEC
(
  SECCOTRX,
  SECCOBCO,
  SECENBCO,
  SECFEAC,
  SECUSAC,
  SECCTABC,
  SECTPCTA,
  SECBCPAD,
  SECBCODE,
  SECBCDEN,
  SECCEMN,
  SECCOEM,
  SECENBIN
)
VALUES
(
  '000054',
  '083',
  'S',
  '20200309',
  'U99ALBERTO',
  '0102184061  ',
  'K',
  20021,
  '057',
  0,
  1020,
  '020',
  '703020   '
);

INSERT INTO GXOPERA.TCLSEC
(
  SECCOTRX,
  SECCOBCO,
  SECENBCO,
  SECFEAC,
  SECUSAC,
  SECCTABC,
  SECTPCTA,
  SECBCPAD,
  SECBCODE,
  SECBCDEN,
  SECCEMN,
  SECCOEM,
  SECENBIN
)
VALUES
(
  '000054',
  '083',
  'S',
  '20200309',
  'U99ALBERTO',
  '0102184061  ',
  'K',
  20021,
  '057',
  0,
  1002,
  '165',
  '627431   '
);
INSERT INTO GXOPERA.TCLSEC
(
  SECCOTRX,
  SECCOBCO,
  SECENBCO,
  SECFEAC,
  SECUSAC,
  SECCTABC,
  SECTPCTA,
  SECBCPAD,
  SECBCODE,
  SECBCDEN,
  SECCEMN,
  SECCOEM,
  SECENBIN
)
VALUES
(
  '000054',
  '057',
  'S',
  '20200309',
  'U99ALBERTO',
  '0102184061  ',
  'K',
  20021,
  '057',
  0,
  1020,
  '020',
  '703020   '
);

Select * from gxbdbps.tlogsaf where lstipro= 'CLEA'  and lsfecha = '20210319';
delete from gxbdbps.tlogsaf where lstipro= 'CLEA'  and lsfecha = '20210319';
/*LImpia tablas para reproceso Clearing*/
Select * from gxopera.oprecle where  refech ='20210219';
delete from gxopera.oprecle where  refech ='20210317';

Select readmin,removi,reenemi,sum(recant), sum (remonto) from gxopera.oprecle where REENEMI = '015' and refech ='20200924' group by readmin,removi,reenemi;
--Delete from gxopera.oprecle where refech ='20200924'
Select * from gxopera.opcomis where opcofer ='20201116'
Delete from gxopera.opcomis where opcofer ='20210317';
Select * from gxopera.OPSEREX
--Delete from gxopera.OPSEREX
Select * from gxopera.fctacom where ctafecha = '20201116'
Delete from gxopera.fctacom where ctafecha = '20210317';
--
Select * from gxopera.OPTADE WHERE OPTDFEC >= '20201116'
Delete from gxopera.OPTADE WHERE OPTDFEC >= '20210317';
--
Select * from gxopera.opmovi where opfecom = '20201116'
Delete from gxopera.opmovi where opfecom = '20210317'

Select * from gxopera.flicom where lifechd = '20201116'
Delete from gxopera.flicom where lifechd = '20210317'

Select * from gxopera.flicom1 where lifechd = '20201116'
Delete from gxopera.flicom1 where lifechd = '20210317'

Select * from libprod.opliqui60 where substr(opcampoa,41,8)= '20210317';
Select * from yapi.opliqui where substr(opcampoa,41,8) = '20210317';
Delete from gxopera.opliqui where substr(opcampoa,41,8) = '20210317'

Select * from gxopera.opago0p where pgfcom >= '20201217'
Delete from gxopera.opago0p where pgfcom >= '20210317'

Select * from gxopera.opago1p where pgfecom >= '20201116'
Delete from gxopera.opago1p where pgfecom >= '20210317';
--
Select * from gxopera.opago3p where bnffecom >= '20201116';
Delete from gxopera.opago3p where bnffecom >= '20210317';
--
Select * from gxopera.opago3tc where tcfecom >= '20201116'
Delete from gxopera.opago3tc where tcfecom >= '20210317';
--
Select * from gxopera.opago5p where pgfecom5 >= '20201116';
Delete from gxopera.opago5p where pgfecom5 >= '20210317';
--
select * from gxopera.oplicre where OPCREREF >= '2';
delete from gxopera.oplicre where OPCREREF >= '20210317';

--------------------------------------------------------------
-------limpiar datos para volver a ejecutar el clearing-------
--------------------------------------------------------------
delete from gxbdbps.tlogsaf where lstipro= 'CLEA'  and lsfecha between '20210812' and '20210813';
delete from gxopera.oprecle where  refech ='20210811';
Delete from gxopera.opcomis where opcofer ='20210811';
Delete from gxopera.fctacom where ctafecha ='20210811';
Delete from gxopera.OPTADE WHERE OPTDFEC >= '20210811';
Delete from gxopera.opmovi where opfecom ='20210811';
delete from gxopera.flicom where lifechd ='20210811';
Delete from gxopera.flicom1 where lifechd ='20210811';
Delete from gxopera.opliqui where substr(opcampoa,41,8) ='20210811';
Delete from gxopera.opago0p where pgfcom >= '20210811';
Delete from gxopera.opago1p where pgfecom >= '20210811';
Delete from gxopera.opago3p where bnffecom >='20210811';
Delete from gxopera.opago3tc where tcfecom >='20210811';
Delete from gxopera.opago5p where pgfecom5 >= '20210811';
--select * from gxbdbps.tlogsaf where lstipro= 'CLEA'  and lsfecha = '20210721';
delete from gxopera.oplicre;

delete from gxfindta.tclmov where movfpro between '20210810' and '20210812';
--------------------------------------------------------------
-------verificar datos para volver a ejecutar el clearing-------
--------------------------------------------------------------
	select * from gxbdbps.tlogsaf where lstipro= 'CLEA'  and lsfecha between '202107' and '20210719';
	select * from gxopera.oprecle where  refech ='20210806';
	select * from gxopera.opcomis where opcofer ='20210806';
	select * from gxopera.fctacom where ctafecha ='20210806';
	select * from gxopera.OPTADE WHERE OPTDFEC >= '20210806';
	select * from javierlib.opmovi where opfecom ='20210806';
	select * from gxopera.flicom where lifechd = '20210806';
	select * from javierlib.flicom1 where lifechd = '20210803';
	select * from gxopera.opliqui where substr(opcampoa,41,8) ='20210806';
	select * from gxopera.opago0p where pgfcom >= '20210806';
	select * from gxopera.opago1p where pgfecom >= '20210806';
	select * from gxopera.opago3p where bnffecom >='20210806';
	select * from gxopera.opago3tc where tcfecom >='20210806';
	select * from gxopera.opago5p where pgfecom5 >= '20210806';
	select * from gxopera.oplicre;

	select * from gxopera.flicom where lifechd between '20210625' and '20210726';
	select * from javierlib.flicom1 where lifechd = '20210716';


select * from gxtrjdta.tdgenr limit 0;
select * from saravlib.tdgenr limit 0;

SELECT * FROM YAPI.FLICOM;


select * from gxfindta.tclrtc where rtcfchpro between '20210422' and '20210429';

select * from gxfindta.tclrtd where rtdfchcob between '20210422' and '20210429';

select * from gxfindta.tclmov where movfpro between '20210422' and '20210429';

select * from gxbdbps.comaeaf;

select * from gxbdbps.coma1af;

select * from gxbdbps.comaext;

select * from gxbdbps.comaexd;

select * from libdebito.drconbep
where lfcotr between '20210427' and '20210527';




SELECT * FROM GXOPERA.FLICOM WHERE LIFECHD = '20201119';

SELECT * FROM GXOPERA.FLICOM1 WHERE LIFECHD = '20201119';

SELECT * FROM GXOPERA.OPRECLE WHERE REFECH = '20201119';

SELECT * from GXOPERA.OPMOVI WHERE OPFECOM = '20201217';

select * from gxopera.opago0p where pgcmov = 1

SELECT * FROM GXOPERA.OPLIQUI WHERE SUBSTR(OPCAMPOA,41,8) = '20201217';

SELECT * FROM GXOPERA.OPCOMIS WHERE OPCOFER = '20201119';

SELECT * FROM GXBDBPS.COMAEAF;

SELECT * FROM GXBDBPS.COMA1AF;

SELECT * FROM GXBDBPS.TMOVIAF WHERE  MVFEPRO = '20201119';

select * from gxbdbps.thmovaf where HMFEPRO = '20201119';

select * from gxopera.opentcle;


select substr(optarj,1,6), sum(opmonto-opcomi), opcomer, openemi from gxopera.opmovi where opfecom = '20200924' and opcomer = '0700764'  group by substr(optarj,1,6), opcomer, openemi;
select substr(opcampoa,1,6), sum(opimpor)  from gxopera.opliqui where substr(opcampoa,41,8)  = '20200924' and opncomer = '0700764' group by substr(opcampoa,1,6);
select * from gxopera.flicom1 where licomer = '0700764' and lifechd = '20200924';
select * from gxopera.flicom where licomer = '0700764' and lifechd = '20200924';

Select * from libdebito.drconbep where lfcotr = '20200925' and lcodtr = '000054' and substr(lidtra,1,1) = 'P'
 and lesttr = 'A' and lcretr = '00' and  lenemi = '332'
 and lerrnb not in (Select opnoref from gxopera.opmovi where opfecom = '20200925' and opcodtrn = '000054' and substr(opidtra,1,1) <> 'T');
 

Select openemi, opcodtrn, count(*), sum(opmonto) from gxopera.opmovi where opfecom = '20200925' and opcodtrn = '000054' and substr(opidtra,1,1) <> 'T' and openemi in ('571','581','591') group by openemi, opcodtrn;

Select * from gxopera.opmovi where opfecom = '20200925' and OPCODAUT = '308275'; --opcodtrn = '000054' and openemi in ('021', '002', '347', '312', '319', '332') group by openemi;

select * from gxbdbps.thmovaf where hmfepro='20200925' and hmemiso in ('002') and hmcodig='005';

select * from gxbdbps.tmoviaf where mvfepro='20200925' and mvemiso = '002' and cmcodig in('005','007') and mvcodre=0;

Select lenemi, count(*), sum(limpgs) from libdebito.drconbep where lfcotr = '20200925' and lcodtr in ('000054','000052','000072','567102') and substr(lidtra,1,1) = 'P'
and lesttr = 'A' and lcretr = '00' and lenemi not in ('508','510','512')
and lerrnb not in (Select opnoref from gxopera.opmovi where opfecom = '20200925' and opcodtrn = '000054' and substr(opidtra,1,1) <> 'T')
group by lenemi;

select * from gxbdbps.tlogsaf where lsfecha = '20200928' and lstipro = 'CLEA' order by lshora desc;

select * from yapi.tcuotaf where cufecom = '20200925';

select * from yapi.tcuotaf where cucodau in ('876564','846182') and cufecom='20200925';

select t2cobc, t2tpco from contabilid.tat2cta where t2tpco = '20' group by t2cobc, t2tpco;


select enemiso from gxbdbps.comaeaf where cocomer  = '1001776';

select * from gxopera.PDSIPAP where PDSFTRANS > '20191131';

select * from gxopera.opmovi where PDSFEPRO > '20191131';

select * from gxbdbps.TMCTAAF;

select * from gxbdbps.tmtaraf;

select * from libdebito.drconbep where lfectr between '20191231' and '20200132';

select * from gxopera.opmovi where OPFEREA between '20191231' and '20200132';

SELECT COUNT(*),SUM(PDSMONTO) FROM GXOPERA.PDSIPAP WHERE PDSFTRANS >= '20200101' AND PDSFTRANS <= '20200131' AND PDSAGRUP = '01';

SELECT count(*), sum(OPMONTO) FROM gxopera.OPMOVI WHERE OPFEREA >= 20200101 and OPFEREA <= 20200131
 AND  OPCODTRN = '000054' AND OPENEMI IN('581','571') AND OPCODRES = '00' and OPSTATUS = 'A';

SELECT * FROM GXOPERA.PDSIPAP


 SELECT LFCOTR,LENEMI, LCODTR, COUNT(*),SUM(LIMPGS) FROM LIBDEBITO.DRCONBEP WHERE LFCOTR = '20201006' AND LBINPR <> '627431' AND LCRETR = '00' AND LESTTR = 'A'
 AND LIMPGS > 0 AND SUBSTR(LIDTRA,1,1) <> 'T' AND LCODTR = '000054'
 GROUP BY LFCOTR,LENEMI, LCODTR;
 
 SELECT LFCOTR,LENEMI, LCODTR, COUNT(*),SUM(LIMPGS) FROM LIBDEBITO.DRCONBEP WHERE LFCOTR = '20201006' AND LCRETR = '00' AND LESTTR = 'A'
 AND LIMPGS > 0 AND SUBSTR(LIDTRA,1,1) <> 'T' AND LCODTR in ('000052','567102','000072','000054')
 GROUP BY LFCOTR,LENEMI, LCODTR;

 SELECT refech, reenemi, removi, retartip, SUM(RECANT), SUM(REMONTO) FROM gxopera.OPRECLE WHERE REFECH = '20201006' AND REMOVI = 'COP'
--AND REENEMI IN (Select entcodi from gxopera.opentid1 where substr(entbin,1,6) <> '627431' and enttipo = 'DEB')
 GROUP BY REFECH,REENEMI, REMOVI, RETARTIP;
 
 Select opcomer,substr(optarj,1,6), count(*), sum(opmonto-opcomi-oprenta-opreiva), openemi from gxopera.opmovi where opfecom = '20201110' /*and substr(optarj,1,6)= '703020'*/ and opcomer in
 (Select cocomer from gxbdbps.comaeaf where enemiso = '061' and costat = '0') group by opcomer, substr(optarj,1,6), openemi;
 
	 Select opcomer,substr(optarj,1,6), count(*), sum(opmonto-opcomi-oprenta-opreiva), openemi from gxopera.opmovi where opfecom = '20201109' /*and substr(optarj,1,6)= '703020'*/ 
	 and opcomer = '0701292' group by opcomer, substr(optarj,1,6), openemi;
	select substr(opcampoa,1,6), sum(OPIMPOR), opcodbco from gxopera.opliqui where  OPCODBCO = '059' and opstat = '00' and substr(opcampoa,41,8) = '20201109' and OPNCOMER = '0701292' group by substr(opcampoa,1,6), opcodbco;
	Select * from gxopera.flicom where lifechd = '20201110' and licomer = '0700495';
	 Select * from gxopera.flicom1 where lifechd = '20201110' and  LICOMER = '0701292';
 
Select * from gxopera.flicom WHERE LICODBAN = 'BF' AND LIFECHD = '20201104';

 select * from gxopera.tclsec where SECCOBCO = '055'; 

select * from gxopera.oplicre where OPCRECBA = '055';

select cocomer, enemiso from gxbdbps.comaeaf where COcomer in (select licomer from gxopera.flicom where LIFECHD = '20201008' and LICODBAN = 'IB') group by cocomer, enemiso;

select * from gxopera.flicom where LIFECHD = '20201008' and LICODBAN = 'IB';

select * from contabilid.tatgene where TGALFA = 'BA' AND TGENTI='021'; --enemiso correr precierre

--TABLA DE ENTIDADES
select * from gxbdbps.gentiaf;
--094 PJ
select * from gxopera.flicom1 where licomer in (select cocomer from gxbdbps.comaeaf where enemiso = '094')

select enemiso from gxbdbps.cocomer 
	
select * from libdebito.drconbep where LFECTR = '20201019' order by lhortr desc;
	
select * from gxopera.opentid where REENTI = '520';

select reenti COD_ENT, entdesc DESCRIPCION from gxopera.opentid where REENTI = '166';

select * from gxopera.opentid1 where REENTI = '172';

select * from gxopera.tclsec; 

select * from gxopera.oprecle where reenemi = '162' and refech = '20201109';

select * from gxopera.flicom;

select * from gxopera.clparf;

select count(*) from gxopera.oplicre;

 Select opcomer,substr(optarj,1,6), count(*), sum(opmonto-opcomi-oprenta-opreiva) from gxopera.opmovi where opfecom = '20201007' /*and substr(optarj,1,6)= '703020'*/ and opcomer in
 (Select cocomer from gxbdbps.comaeaf where enemiso = '018' and costat = '0') group by opcomer, substr(optarj,1,6);
Select * from gxopera.flicom where lifechd = '20201007' and licomer = '0800939';
 Select * from gxopera.flicom1 where lifechd = '20201007' and  LICOMER = '0800939';

SELECT * FROM JAVIERLIB.OPMOVI;

select * from libdebito.drconbep where LIDCOM = '1001776' and lfectr = '20201014' order by


--MIGRACION GRUPO 3
/*Otros Emisores TD en Comercios  GNB*/
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '061', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 1002, '002', '703002');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '061', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 1020, '020', '703020');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '061', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5115, '115', '627431115');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '061', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5165, '165', '627431165');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '061', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5166, '166', '627431166');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '061', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5167, '167', '627431167');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '061', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5169, '169', '627431169');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '061', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5170, '170', '627431170');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '061', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5171, '171', '627431171');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '061', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5172, '172', '627431172');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '061', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5174, '174', '627431174');
/*Otros Emisores TD en Comercios  Sudameris*/
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '065', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 1002, '002', '703002');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '065', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 1020, '020', '703020');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '065', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5115, '115', '627431115');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '065', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5165, '165', '627431165');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '065', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5166, '166', '627431166');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '065', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5167, '167', '627431167');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '065', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5169, '169', '627431169');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '065', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5170, '170', '627431170');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '065', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5171, '171', '627431171');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '065', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5172, '172', '627431172');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '065', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5174, '174', '627431174');
/*Otros Emisores TD en Comercios  Itau*/
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '055', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 1002, '002', '703002');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '055', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 1020, '020', '703020');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '055', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5115, '115', '627431115');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '055', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5165, '165', '627431165');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '055', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5166, '166', '627431166');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '055', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5167, '167', '627431167');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '055', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5169, '169', '627431169');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '055', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5170, '170', '627431170');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '055', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5171, '171', '627431171');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '055', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5172, '172', '627431172');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '055', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5174, '174', '627431174');


select * from GXSEGDTA.TSGNUM

INSERT INTO GXSEGDTA.TSGNUM 
(SGNUMCOD, SGNUMOBJ, SGNUMINI, SGNUMACT, SGNUMSET, SGNUMDESC, SGNUMPRG, SGNUMUNT)
VALUES
( 105, 'TCLRTC', 1, 0, 'N', 'RETENCIONES CABECERA',  '', 0);

select * from GXFINDTA.UTCLRTC;
INSERT INTO GXOPERA.TCLSEC
(
  SECCOTRX,
  SECCOBCO,
  SECENBCO,
  SECFEAC,
  SECUSAC,
  SECCTABC,
  SECTPCTA,
  SECBCPAD,
  SECBCODE,
  SECBCDEN,
  SECCEMN,
  SECCOEM,
  SECENBIN
)
VALUES
(
  '000054',
  '057',
  'S',
  '20201005',
  'U99HERNAN ',
  '0102184061  ',
  'K',
  20021,
  '057',
  0,
  5174,
  '174',
  '627431174'
);



select * from gxopera.tclsec where SECCOBCO = '083' and SECCOEM = '174';

select enemiso from gxbdbps.comaeaf where cocomer = '0100001';

select * from contabilid.tatgene where TGALFA = 'BA';

select * from gxopera.tfamrel

select * from libdebito.drconbep where lfectr = '20210122' order by lhortr desc

 

select * from gxfindta.TCLSEB 

select * from gxfindta.TCLSer

select * from gxfindta.TCLPRE


-----
-----
CREATE INDEX gxopera.UFACTURA2 
   ON gxopera.factura (faclien, factacble, factipo, facstatus, facfech);
   
CREATE INDEX GXOPERA.FLICO1L8
   ON GXOPERA.FLICOM1 (LICOMER ASC, LICODTR ASC, LIFECREDI ASC, LINROFAC ASC, LITIPTAR ASC);
   

select * from gxfindta.tcltsb where SERCODI = 'COBROFAC' and TSBIDOP >= '162949';

select 

select * from gxsegdta.TSGNUM where SGNUMACT = '27368';

	Select * from qsys2.procedures where procname like '%PCLR%';
select * from gxopera.flicom where LIFECHD = '20201019';

select * from gxsegdta.tsgnum where sgnumobj = 'TCLTSB'

SELECT * FROM gxtrjdta.TDSDWS;
 SELECT * FROM GXTRJDTA.TDSPWS;
 select * from gxtrjdta.tenecx;

select * from gxbdbps.comaeaf where cocomer = '0301255';

select * from gxopera.factura where facstatus = 'P' and FACLIEN in (select cocomer from gxbdbps.comaeaf where COENTDEB = '057');

SELECT * FROM GXFINDTA.TCLCNE;

select * from javierlib.comaeaf;

UPDATE gxbdbps.COMAEAF
   SET 
       COCTADEB = ADNUMCTA
WHERE COCOMER > '1';

select count(*) from gxbdbps.comaeaf;
select count(*) from gxbdbps.comaeaf where COCTADEB = ADNUMCTA;

select * from gxopera.tclsec where SECCOBCO = '055';

select * from gxopera.flicom where LIFECHD = '20210105';

select * from libprod.flicom60 where LIFECHD = '20210105';

select * from libprod.flicom160 where LIFECHD = '20210105';

select reenemi, sum (remonto) from gxopera.oprecle where REFECH = '20201109' and reenemi in ('021', '162', '168', '164') group by reenemi;

select * from gxopera.opentcle where entcod in ('021', '162', '168', '164')

select * from libprod.opmovi60 where OPFECOM = '20201104';

select * from libprod.OPLIQUI60 where substr(OPCAMPOA, 41, 8) = '20210105';

select * from gxopera.opcomis where OPCOFEC = '20201104';


SELECT * FROM GXOPERA.CLPARF where parcodbco in ('066','054','059');

/*Otros Emisores TD en Comercios  Familiar*/
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '066', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 1002, '002', '703002');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '066', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 1020, '020', '703020');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '066', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5115, '115', '627431115');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '066', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5165, '165', '627431165');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '066', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5166, '166', '627431166');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '066', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5167, '167', '627431167');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '066', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5169, '169', '627431169');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '066', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5170, '170', '627431170');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '066', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5171, '171', '627431171');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '066', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5172, '172', '627431172');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '066', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5174, '174', '627431174');

/*Otros Emisores TD en Comercios  Vision*/
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '054', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 1002, '002', '703002');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '054', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 1020, '020', '703020');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '054', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5115, '115', '627431115');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '054', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5165, '165', '627431165');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '054', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5166, '166', '627431166');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '054', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5167, '167', '627431167');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '054', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5169, '169', '627431169');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '054', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5170, '170', '627431170');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '054', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5171, '171', '627431171');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '054', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5172, '172', '627431172');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '054', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5174, '174', '627431174');
/*Otros Emisores TD en Comercios  Regional*/
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '059', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 1002, '002', '703002');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '059', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 1020, '020', '703020');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '059', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5115, '115', '627431115');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '059', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5165, '165', '627431165');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '059', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5166, '166', '627431166');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '059', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5167, '167', '627431167');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '059', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5169, '169', '627431169');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '059', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5170, '170', '627431170');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '059', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5171, '171', '627431171');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '059', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5172, '172', '627431172');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '059', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5174, '174', '627431174');


SELECT * FROM GXOPERA.CLPARF where parcodbco in ('066','054','059')


Select * from gxopera.opmovi where opfecom = '20201109' and opcomer in ( '2300391', '0800952', '0300959');

update libdebito.EMBTRKDEB set tkuses='',tkfees='',tkstat='' where tkfee2='20201002' and tkhoej=200132;



--PRUEBAS DEL MODULO DE RETENCIONES
select * from gxopera.tclsec where SECCOBCO = '083'
select * from gxbdbps.comms where commid = '02';
select * from gxbdbps.comaeaf where cocomer = '0100001'

select * from libdebito.drconbep where substr(leca62,1,2) = 'SP' and lidcom = '0100001'

select * from gxopera.tfamrel;
select * from javierlib.tfamrel;

--MOVIMIENTOS
	select * from libdebito.drconbep where LIDCOM = '0100001' and lfectr = '20210215' order by lhortr desc;-- and LERRNB = '102500086389';

select * from gxbdbps.tswaut where AUTTRXFCHF = '20210215' order by AUTTRXHORF desc;

select * from gxopera.opliqui where substr (OPCAMPOA,41,8) >= '20210203' order by OPHORLIQ desc;

--Select * from GXFINDTA.tclMRT; -- Motivo Retención

 Select * from GXFINDTA.tclRTC where rtccomerc = '0100001' order by RTCFHULTUP desc ; -- Retenciones Cabecera
 Select * from GXFINDTA.tclRTD ORDER BY RTCIDRETEN DESC; -- Retenciones Detalle
 Select * from gxfindta.tcltsb where  tsbfeac >= '2021-02-15 08:30:00' order by TSBIDOP desc;
 
select * from gxfindta.tclmov where MOVFTRX = '20210215' order by MOVIDMOV desc;

select enemiso from gxbdbps.comaeaf where cocomer = '0100001';

select * from gxsegdta.TSGNUM; 

select * from libdebito.drconbep where lcomtr = 'PUNTO FARMA 126'

select * from cierrelib.gsaldaf where enemiso = '021' and afafini = '507'

select * from cierrelib.tmtaraf where enemiso = '021' and afafini = '507'

/*Otros Emisores TD en Comercios  Interfisa*/
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '018', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 1002, '002', '703002');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '018', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 1020, '020', '703020');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '018', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5115, '115', '627431115');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '018', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5165, '165', '627431165');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '018', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5166, '166', '627431166');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '018', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5167, '167', '627431167');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '018', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5169, '169', '627431169');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '018', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5170, '170', '627431170');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '018', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5171, '171', '627431171');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '018', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5172, '172', '627431172');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '018', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5174, '174', '627431174');

/*Otros Emisores TD en Comercios  Argentina*/
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '060', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 1002, '002', '703002');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '060', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 1020, '020', '703020');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '060', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5115, '115', '627431115');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '060', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5165, '165', '627431165');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '060', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5166, '166', '627431166');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '060', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5167, '167', '627431167');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '060', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5169, '169', '627431169');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '060', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5170, '170', '627431170');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '060', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5171, '171', '627431171');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '060', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5172, '172', '627431172');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '060', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5174, '174', '627431174');

/*Otros Emisores TD en Comercios  Amambay*/
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '062', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 1002, '002', '703002');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '062', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 1020, '020', '703020');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '062', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5115, '115', '627431115');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '062', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5165, '165', '627431165');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '062', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5166, '166', '627431166');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '062', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5167, '167', '627431167');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '062', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5169, '169', '627431169');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '062', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5170, '170', '627431170');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '062', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5171, '171', '627431171');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '062', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5172, '172', '627431172');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '062', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5174, '174', '627431174');

/*Otros Emisores TD en Comercios  Atlas*/
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '069', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 1002, '002', '703002');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '069', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 1020, '020', '703020');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '069', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5115, '115', '627431115');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '069', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5165, '165', '627431165');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '069', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5166, '166', '627431166');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '069', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5167, '167', '627431167');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '069', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5169, '169', '627431169');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '069', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5170, '170', '627431170');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '069', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5171, '171', '627431171');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '069', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5172, '172', '627431172');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '069', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5174, '174', '627431174');

/*Otros Emisores TD en Comercios  Atlas*/
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '201', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 1002, '002', '703002');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '201', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 1020, '020', '703020');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '201', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5115, '115', '627431115');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '201', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5165, '165', '627431165');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '201', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5166, '166', '627431166');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '201', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5167, '167', '627431167');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '201', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5169, '169', '627431169');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '201', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5170, '170', '627431170');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '201', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5171, '171', '627431171');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '201', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5172, '172', '627431172');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '201', 'S', '20201007', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5174, '174', '627431174');


select * from gxopera.mails;

select * from gxsegdta.tsgfun   where  sgfunobj like '%TDM%' 
and sgfuncod = '2707'  --2771,2775., 2783, 2787, 2791

Select * from gxsegdta.tsgusr where sgusrid in ('U99JAVIER');

Select * from gxsegdta.tsgaru   WHERE SGUSRCOD = 2986;

select * from gxsegdta.tsgroldt where sgrolcod = '356' and sgfuncod in (
2771,2775, 2783, 2787, 2791);

delete from gxswtdta.TDMPRSRV;
delete from gxswtdta.tdmacbnf;

DELETE FROM GXSWTDTA.tdmenser;

select * from gxtrjdta.TTCTRJ where trjcodent = 5166;

select * from gxtrjdta.TTCTRJ where trjnrodoc = '4842196';

SELECT * FROM GXSWTDTA.tdmtxsrv;

INSERT INTO GXSWTDTA.TDMTXSRV
(
  SERVID,
  TXSRVCOD,
  TXSRVFCH,
  TXSRVUSM
)
VALUES
(
  1,
  '901020',
  '0001-01-01 00:00:00.000',
  '          '
);

INSERT INTO GXSWTDTA.TDMTXSRV
(
  SERVID,
  TXSRVCOD,
  TXSRVFCH,
  TXSRVUSM
)
VALUES
(
  1,
  '902020',
  '0001-01-01 00:00:00.000',
  '          '
);

select * from gxdebito.TGSVBEP WHERE  SMSTRAN = 'S' or ACRESAL = 'S' -- Datos de clientes adheridos

select * from libdebito.tgembhaf where crdocu in ( '3330452','100001') and crvenc >= 2011 and crbine = 703002;

select * from cierrelib.gsaldaf where enemiso = '021' and afafini = '507';

select MVCODSC, MVAFINI from cierrelib.tmoviaf a inner join cierrelib.tmtaraf b on
a.mtnumta = b.mtnumta where mvemiso = '021' group by mvcodsc, mvafini;

select * from gxopera.opmovi where OPCOMER IN
(select cocomer from gxbdbps.comaeaf where enemiso = '083') and opliqha = '20210105';

select * from gxopera.flicom where LICODBAN = 'IB' and LIFECHD = '20210114';

select * from gxopera.opmovi where opliqde = '20210114'


UPDATE GXOPERA.FLICOM
   SET 
       LINROASI = 0
WHERE licodban  = 'IF'


select * from contabilid.ccasi21

    
SELECT * FROM CONTABILID.TAT2CTA WHERE T2TPCO= '21' AND T2COBC= 'AT';

SELECT * FROM CONTABILID.TAT2CTA WHERE T2TPCO= '21' AND T2COBC= 'IB';

SELECT * FROM CONTABILID.TAT2CTA WHERE T2TPCO= '21' AND T2COBC= 'IF';

INSERT INTO CONTABILID.TAT2CTA
(
  T2COBC,
  T2CMON,
  T2COSU,
  T2TPCO,
  T2COCT,
  T2CTCT,
  T2MONC,
  T2CHEI,
  T2CHEF,
  T2CHEU,
  T2CLEA
)
VALUES
(
  'AT',
  1,
  '01',
  '21',
  101012001000097,
  121840601,
  1,
  0,
  0,
  0,
  ' '
);



INSERT INTO CONTABILID.TAT2CTA
(
  T2COBC,
  T2CMON,
  T2COSU,
  T2TPCO,
  T2COCT,
  T2CTCT,
  T2MONC,
  T2CHEI,
  T2CHEF,
  T2CHEU,
  T2CLEA
)
VALUES
(
  'I',
  1,
  '01',
  '21',
  101012001000050,
  149134000,
  1,
  0,
  0,
  0,
  'C'
);

select * from gxopera.TCLSEC


--  Generar SQL 
--  Versión:                   	V7R2M0 140418 
--  Generado en:              	18/01/21 10:58:03 
--  Base de datos relacional:       	B10E97CR 
--  Opción de estándares:          	DB2 for i 
CREATE VIEW CONTABILID.CCASIL0321 ( 
--  SQL1506   30   Clave o atributo para CCASIL0321 de CONTABILID ignorado. 
	ASCOSU , 
	ASTPCO , 
	ASCMON , 
	ASFECH , 
	ASNRAS , 
	ASNRLI , 
	ASCOCT , 
	ASCODE , 
	ASCPRV , 
	ASAREA , 
	ASCDEP , 
	ASDESC , 
	ASCODB , 
	ASIMPO , 
	ASTCOM , 
	ASNCOM , 
	ASCOBC , 
	ASNRCH , 
	ASSITU , 
	ASGRAB , 
	ASINDA , 
	ASCOUS , 
	ASFESI , 
	ASHOSI ) 
	AS 
	SELECT 
	ASCOSU , 
	ASTPCO , 
	ASCMON , 
	ASFECH , 
	ASNRAS , 
	ASNRLI , 
	ASCOCT , 
	ASCODE , 
	ASCPRV , 
	ASAREA , 
	ASCDEP , 
	ASDESC , 
	ASCODB , 
	ASIMPO , 
	ASTCOM , 
	ASNCOM , 
	ASCOBC , 
	ASNRCH , 
	ASSITU , 
	ASGRAB , 
	ASINDA , 
	ASCOUS , 
	ASFESI , 
	ASHOSI   
	FROM CONTABILID.CCASI2121 
	  
	RCDFMT ASREG      ; 
  
LABEL ON TABLE CONTABILID.CCASIL0321 
	IS 'A.L. ASIENTO POR SUC/CONT/T.DOC./CHEQUE' ; 
  
LABEL ON COLUMN CONTABILID.CCASIL0321 
( ASCOSU IS 'COD. SUCURSAL' , 
	ASTPCO IS 'TPO. CONTABILIDAD' , 
	ASCMON IS 'COD. MONEDA' , 
	ASFECH IS 'FECHA' , 
	ASNRAS IS 'NRO. ASIENTO' , 
	ASNRLI IS 'NRO. LINEA' , 
	ASCOCT IS 'COD. CUENTA' , 
	ASCODE IS 'TPO. DOC. CTA.CTE.' , 
	ASCPRV IS 'COD. CTA. CTE.' , 
	ASAREA IS 'COD. AREA' , 
	ASCDEP IS 'COD. DEPARTAMENTO' , 
	ASDESC IS 'DESCRIPCION' , 
	ASCODB IS 'DB/CR' , 
	ASIMPO IS 'IMPORTE' , 
	ASTCOM IS 'TPO. DE COMPROBANTE' , 
	ASNCOM IS 'NRO. DE COMPROBANTE' , 
	ASCOBC IS 'COD. DE BANCO' , 
	ASNRCH IS 'NRO. CHEQUE/DOC.' , 
	ASSITU IS 'MARCA DE ACTUALIZ.' , 
	ASGRAB IS 'MARCA DE MOV.BANC.' , 
	ASINDA IS 'MARCA DE ACT.FIJO' , 
	ASCOUS IS 'USUARIO' , 
	ASFESI IS 'FECHA SISTEMA' , 
	ASHOSI IS 'HORA SISTEMA' ) ; 
  
LABEL ON COLUMN CONTABILID.CCASIL0321 
( ASCOSU TEXT IS ' 2A  COD. SUCURSAL' , 
	ASTPCO TEXT IS ' 2A  COD. TIPO CONTABILIDAD' , 
	ASCMON TEXT IS ' 2S0 COD. MONEDA' , 
	ASFECH TEXT IS ' 6S0 FECHA DEL ASIENTO' , 
	ASNRAS TEXT IS ' 9P0 NUMERO DE ASIENTO' , 
	ASNRLI TEXT IS ' 5S0 NUMERO DE LINEA' , 
	ASCOCT TEXT IS '15P0 CODIGO DE CUENTA' , 
	ASCODE TEXT IS ' 2A  COD. TIPO DOCUMENTO' , 
	ASCPRV TEXT IS '11P0 EMPLEADO/CLIENTE' , 
	ASAREA TEXT IS ' 2A  COD.DE AREA' , 
	ASCDEP TEXT IS ' 3P0 COD.DEPARTAMENTO' , 
	ASDESC TEXT IS '80A  DESCRIPCION DEL ASIENTO' , 
	ASCODB TEXT IS ' 2A COD DEBITO/CREDITO' , 
	ASIMPO TEXT IS '13P2 IMPORTE DEL ASIENTO' , 
	ASTCOM TEXT IS ' 2A  COD. TIPO COMPROBANTE' , 
	ASNCOM TEXT IS '13S0 NUMERO DE COMPROBANTE' , 
	ASCOBC TEXT IS ' 2A  COD. BANCO' , 
	ASNRCH TEXT IS '17P0 NRO. CHEQUE/DOCUMENTO' , 
	ASSITU TEXT IS ' 1A  ACTUALIZADO/NO ACTUALIZ' , 
	ASGRAB TEXT IS ' 1A  MARCA MOVI. BANCARIO' , 
	ASINDA TEXT IS ' 1A  MARCA DE ACTIVO FIJO' , 
	ASCOUS TEXT IS '10A  COD. USUARIO' , 
	ASFESI TEXT IS '6S0  FECHA SISTEMA' , 
	ASHOSI TEXT IS '6P0  HORA SISTEMA' ) ; 
  
GRANT ALTER , DELETE , INSERT , REFERENCES , SELECT , UPDATE   
ON CONTABILID.CCASIL0321 TO DESAPRF2 WITH GRANT OPTION ; 
  
GRANT SELECT   
ON CONTABILID.CCASIL0321 TO PUBLIC ;

select lidcom COMERCIO, lfectr FECHA, limpgs IMPORTE, lbinpr BIN, lcodbc MARCA, lcretr COD_RET, lesttr ESTADO_TRX, lcodtr COD_TRX, lerrnb RRN
from libdebito.drconbep where LERRNB in '101500085186';

select *
from gxbdbps.tswaut where AUTRRNBEP in '101500085187';

select autbinemi BIN, autcodaut COD_AUT, autdistip POS, autmartar MARCA, autmontori MONTO, autmtimi MTI, autrolbep ROL, autrrnbep RRN, auttrxestf ESTADO_TRX, auttrxfchf FECHA 
from gxbdbps.tswaut where AUTRRNBEP in '101500085186';

select * from visa.visctldta where VIRRNBEPSA in '101500085186';

select * from visa.vistrndta where VIRRNBEPSA in '101500085186';

SELECT * FROM LIBDEBITO.DRCONBEP WHERE lidcom = '6900282' and lfectr = '20210115'

select * from yapi.tfamrel;

select * from gxopera.opmovi where OPFECOM = '20210122';

select * from libprod.drconbe60 where LFECTR ;

select * from gxbdbps.comaeaf where cocomer = '0800540'

--061, 0703460

SELECT * FROM GXFINDTA.TCLMOV WHERE ;

--

select * from gxfindta.tcltsb order by TSBIDOP desc;

select * from gxopera.flicom where LICOMER = '5500049';

select * from gxopera.flicom1 where LICOMER = '5500049';

select openemi, substr(optarj,1,6), sum(opmonto-opcomi-oprenta-opreiva), opstatus from gxopera.opmovi where opcomer = '5500049' and opfecom = '20210317' 
group by openemi, substr(optarj,1,6), opstatus

select * from gxopera.opmovi where opcomer = '5500049' and opfecom = '20210317' 
group by openemi, substr(optarj,1,6), opstatus;

select openemi, substr(optarj,1,6), sum(opmonto-opcomi-oprenta-opreiva), opstatus from libprod.opmovi60 where opcomer = '5500049' and opfecom = '20210317' 
group by openemi, substr(optarj,1,6), opstatus

select * from libprod.opmovi60 where opcomer = '5500049' and opfecom = '20210317' 
group by openemi, substr(optarj,1,6), opstatus

select * from gxopera.opliqui where OPNROREF = '107647697723';

select * from gxfindta.tclmov where mov = '20210317';

select * from gxbdbps.comaext;

select * from gxtrjdta.tdgenr

update gxtrjdta.TDGENR set ENRBCOPAGA = null where ENRBCOPAGA = 0;


select * from gxfindta.tclrtc where RTCCOMERC = '0700561';

select * from gxfindta.tclrtd where rtcidreten = '927';

select * from gxopera.flicom where LICOMER = '0700561';

select * from gxopera.flicom where LICOMER = '0700561';

select * from gxopera.opliqui where opncomer = '0700561';

select sum(opimpor) from gxopera.opliqui where opncomer = '0700561';

select * from gxfindta.tclmov;

select * from gxopera.opmovi
Where OPFECOM = '20210527'
and OPENEMI = '020'
and OPTIPTAR = 'CRE';

select * from libclea.tcltsb where date(TSBFEGE) = '2021-05-07';

select * from gxfindta.tcltsb where date(TSBFEGE) = '2021-05-10';
delete from gxfindta.tcltsb where date(TSBFEGE) = '2021-05-10';

Select * from gxfindta.TCLSCT;
INSERT INTO GXFINDTA.TCLSCT
VALUES ( 'DINEFE', 'DIEF', 1020, 'CC', '0104913400          ', 'U99BERNAL ', '2021-05-07 08:41:44.000');
INSERT INTO GXFINDTA.TCLSCT
VALUES ( 'REDPAG', 'REPA', 1020, 'CC', '0104913400          ', 'U99BERNAL ', '2021-05-07 08:41:44.000');
INSERT INTO GXFINDTA.TCLSCT
VALUES ( 'VTAMIN', 'VTEP', 1020, 'CC', '0104913400          ', 'U99BERNAL ', '2021-05-07 08:41:44.000');
INSERT INTO GXFINDTA.TCLSCT
VALUES ( 'PAGFAC', 'PFEP', 1020, 'CC', '0104913400          ', 'U99BERNAL ', '2021-05-07 08:41:44.000');
INSERT INTO GXFINDTA.TCLSCT
VALUES ( 'CICO', 'CIGI', 1020, 'CC', '0104913400          ', 'U99BERNAL ', '2021-05-07 08:41:44.000');
INSERT INTO GXFINDTA.TCLSCT
(
  SERCODI,
  PRECODI,
  SCTCOBA,
  SCTTPCT,
  SCTNRCT,
  SCTUSAC,
  SCTFEAC
)
VALUES
(
  'COMPRA    ',
  'COMP',
  1020,
  'CC',
  '0102184061          ',
  'U99BERNAL ',
  '2020-06-12 16:41:44.625'
);

INSERT INTO GXFINDTA.TCLSCT
(
  SERCODI,
  PRECODI,
  SCTCOBA,
  SCTTPCT,
  SCTNRCT,
  SCTUSAC,
  SCTFEAC
)
VALUES
(
  'CONTRAC   ',
  'COCA',
  1020,
  'CC',
  '0102184061          ',
  'U99BERNAL ',
  '2020-06-12 16:41:44.625'
);

INSERT INTO GXFINDTA.TCLSCT
(
  SERCODI,
  PRECODI,
  SCTCOBA,
  SCTTPCT,
  SCTNRCT,
  SCTUSAC,
  SCTFEAC
)
VALUES
(
  'DEBITOEN  ',
  'DEEN',
  1020,
  'CC',
  '0102184061          ',
  'U99BERNAL ',
  '2020-06-12 16:41:44.625'
);

INSERT INTO GXFINDTA.TCLSCT
(
  SERCODI,
  PRECODI,
  SCTCOBA,
  SCTTPCT,
  SCTNRCT,
  SCTUSAC,
  SCTFEAC
)
VALUES
(
  'PAGOCOM   ',
  'PACO',
  1020,
  'CC',
  '0104913400          ',
  'U99BERNAL ',
  '2020-06-12 16:41:44.625'
);

INSERT INTO GXFINDTA.TCLSCT
(
  SERCODI,
  PRECODI,
  SCTCOBA,
  SCTTPCT,
  SCTNRCT,
  SCTUSAC,
  SCTFEAC
)
VALUES
(
  'COBROFAC  ',
  'COFA',
  1020,
  'CC',
  '010491340           ',
  'U99MARCELO',
  '2021-02-17 11:22:57.000'
);
INSERT INTO GXFINDTA.TCLSEB
(
  SERCODI,
  SEBCOBA,
  SEBCODI,
  SEBDEOP,
  SEBUSAC,
  SEBFEAC
)
VALUES
(
  'DINEFE    ',
  1020,
  '01',
  'CREDITO A COMERCIOS           ',
  'U99OCAMPOS',
  '2020-03-12 13:41:00.000'
);

INSERT INTO GXFINDTA.TCLSEB
(
  SERCODI,
  SEBCOBA,
  SEBCODI,
  SEBDEOP,
  SEBUSAC,
  SEBFEAC
)
VALUES
(
  'REDPAG    ',
  1020,
  '01',
  'CREDITO A COMERCIOS           ',
  'U99OCAMPOS',
  '2020-03-12 13:41:00.000'
);

select * from GXFINDTA.TCLSEB;

INSERT INTO GXFINDTA.TCLSEB
VALUES ( 'VTAMIN', 1020, '01', 'CREDITO A COMERCIOS           ', 'U99BERNAL', '2021-05-07 08:41:00.000');
INSERT INTO GXFINDTA.TCLSEB
VALUES ( 'PAGFAC', 1020, '01', 'CREDITO A COMERCIOS           ', 'U99BERNAL', '2021-05-07 08:41:00.000');
INSERT INTO GXFINDTA.TCLSEB
VALUES ( 'CICO', 1020, '01', 'CREDITO A COMERCIOS           ', 'U99BERNAL', '2021-05-07 08:41:00.000');
INSERT INTO GXFINDTA.TCLSEB
(
  SERCODI,
  SEBCOBA,
  SEBCODI,
  SEBDEOP,
  SEBUSAC,
  SEBFEAC
)
VALUES
(
  'COMPRA    ',
  1020,
  '01',
  'CREDITO A COMERCIOS           ',
  'U99OCAMPOS',
  '2020-03-12 13:41:00.000'
);

INSERT INTO GXFINDTA.TCLSEB
(
  SERCODI,
  SEBCOBA,
  SEBCODI,
  SEBDEOP,
  SEBUSAC,
  SEBFEAC
)
VALUES
(
  'CONTRAC   ',
  1020,
  '03',
  'REVERSAS Y CONTRACARGOS       ',
  'U99OCAMPOS',
  '2020-03-12 13:41:00.000'
);

INSERT INTO GXFINDTA.TCLSEB
(
  SERCODI,
  SEBCOBA,
  SEBCODI,
  SEBDEOP,
  SEBUSAC,
  SEBFEAC
)
VALUES
(
  'DEBITOEN  ',
  1020,
  '02',
  'DEBITO A ENTIDADES            ',
  'U99OCAMPOS',
  '2020-03-12 13:41:00.000'
);

INSERT INTO GXFINDTA.TCLSEB
(
  SERCODI,
  SEBCOBA,
  SEBCODI,
  SEBDEOP,
  SEBUSAC,
  SEBFEAC
)
VALUES
(
  'PAGOCOM   ',
  1020,
  '01',
  'CREDITO A COMERCIOS           ',
  'U99OCAMPOS',
  '2020-03-12 13:41:00.000'
);

INSERT INTO GXFINDTA.TCLSEB
(
  SERCODI,
  SEBCOBA,
  SEBCODI,
  SEBDEOP,
  SEBUSAC,
  SEBFEAC
)
VALUES
(
  'COBROFAC  ',
  1020,
  '04',
  'TRANSFERENCIA INTERNA DEBITO  ',
  'U99BERNAL ',
  '2020-10-07 08:41:00.000'
);
INSERT INTO GXFINDTA.TCLSEB
(
  SERCODI,
  SEBCOBA,
  SEBCODI,
  SEBDEOP,
  SEBUSAC,
  SEBFEAC
)
VALUES
(
  'DINEFE    ',
  1020,
  '01',
  'CREDITO A COMERCIOS           ',
  'U99OCAMPOS',
  '2020-03-12 13:41:00.000'
);

INSERT INTO GXFINDTA.TCLSEB
(
  SERCODI,
  SEBCOBA,
  SEBCODI,
  SEBDEOP,
  SEBUSAC,
  SEBFEAC
)
VALUES
(
  'REDPAG    ',
  1020,
  '01',
  'CREDITO A COMERCIOS           ',
  'U99OCAMPOS',
  '2020-03-12 13:41:00.000'
);



select * from gxopera.flicom where lifechd = '20210527';

select * from gxopera.oprecle where REFECH = '20210527';

select * from gxopera.opmovi where opfecom = '20210527';

select * from javierlib.opmovi where opfecom = '20210527' and optiptar = 'CRE';

select * from libdebito.drconbep where 

Buenas tardes, favor ubicar en maqtest/javierlib los siguientes archivos:
 - Archivos de Backup para proceso de clearing, de la biblioteca BKCLEARING
 FLICOM, FLICOM1, OPCOMIS, OPLIQUI, OPRECLE, OPMOVI
 - SELECT * FROM LIBDEBITO.DRCONBEP WHERE LFCOTR > '20210714';
 - SELECT * FROM GXBDBPS.TMOVIAF WHERE MVFEREA > '20210714';
 - SELECT * FROM GXBDBPS.THMOVAF WHERE HMFEREA > '20210714';
 - SELECT * FROM GXBDBPS.TCUOTAF WHERE CUFEREA > '20210714';
 
Gracias!

select * from libdebito.drconbep where lcodtr = '000000' and lfcotr = '20210716';

select * from gxbdbps.tswaut where AUTRRNBEP = '113761093409';

select * from libdebito.drconbep where lfectr = '20210722' order by lhortr desc;
