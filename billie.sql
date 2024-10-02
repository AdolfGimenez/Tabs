" select * from gxopera.flicom           
 where lifechd between '20191210' and '20191231'
 order  by lifechd


--ahhh.... tenes que cerar el campo nro de asiento de flicom, porque si tiene algun numero ya no genera el asiento, porque asume que ya hay un asiento
--el comando que tenes que ejecutar es el siguiente, para cerar dos fechas 
UPDATE GXOPERA.FLICOM SET LINROASI = 0, lifepco = '00000000' WHERE LIFECHD = '20191224'

SELECT * FROM GXOPERA.FLICOM WHERE lifechd between '20191224' and '20191226' ORDER BY LINROASI

--y la otra fecha es 
UPDATE GXOPERA/FLICOM SET LINROASI = 0  WHERE LIFECHD = '20191226' 
--con eso creo que ya estamos para hacer la prueba

CREATE PROCEDURE GXSTRPRC.CC144P ( 
 INOUT USUARIO CHAR(10) ,          
 INOUT BANCO CHAR(3) ,             
 INOUT FECHA CHAR(8) )             
 LANGUAGE CL                       
 SPECIFIC GXSTRPRC.CC144P          
 NOT DETERMINISTIC                 
 MODIFIES SQL DATA                 
 CALLED ON NULL INPUT              
 EXTERNAL NAME 'GXSTRPRC/CC144P'   
 PARAMETER STYLE GENERAL           
 "
 select * from gxopera.opmovi order by OPFECOM asc--where OPFECOM = '20200304'
 
SELECT * FROM CONTABILID.CCASI20 WHERE ASFECH = 200421

--

select * from libclea.gclieaf
select * from gxbdbps.gclieaf

--GXTRJDTA.TTCTRJ
select * from GXTRJDTA.TTCTRJ
------------------------
select * from libclea.TTCTRJ
 
-- GXTRJDTA/TTCTRJ
SELECT * FROM GXTRJDTA.TTDCDb

SELECT * FROM LIBCLEA.TTDCDb

--GXTRJDTA/TTDCAD

SELECT * FROM GXTRJDTA.TTDCAD
SELECT * FROM LIBCLEA.TTDCAD

--GXTRJDTA/TTDEMI
SELECT * FROM GXTRJDTA.TTDEMI

SELECT * FROM LIBCLEA.TTDEMI

--GXTRJDTA/TTCCTA
SELECT * FROM GXTRJDTA.TTCCTA

SELECT * FROM LIBCLEA.TTCCTA

--GXTRJDTA.TDGENP
SELECT * FROM GXTRJDTA.TDGENP

SELECT * FROM LIBCLEA.TDGENP

--GXTRJDTA/TDGPER
SELECT * FROM GXTRJDTA.TDGPER

SELECT * FROM LIBCLEA.TDGPER


--CONTROL DE TABLAS EN GENERAL
SELECT * FROM GXFINDTA.TCLMOV

SELECT * FROM LIBCLEA.TCLMOV

select tdctatar from gxbdbps.tdcta;

select tdctatar from libclea.tdcta;

select tdadhnompla from gxbdbps.tdctaad;

select tdadhnompla from libclea.tdctaad;

select tdtarnum from gxbdbps.tdtarrel;

select tdtarnum from libclea.tdtarrel;

select mtnumta from gxbdbps.tmtaraf;

select mtnumta from libclea.tmtaraf;

select mcnumta from gxbdbps.tmctaaf;

select mcnumta from libclea.tmctaaf;



select * from gxbdbps.tdcta where tdctatar like '%8083'

select * from mastercard.mastrndta;

select * from mastercard.masctldta;

select * from libdebito.drconbep where lfectr = '20200817' and lnrtar like '230671%';

select * from gxbdbps.tdmov where movlerrnb in ('023000062077', '023000062078');

--CONTROL DE ARCHIVOS LIBCLEA--
ccasi20 -no, son datos internos-
select * from libclea.CCASI20;
select * from contabilid.CCASI20;
CCMBA20 -no, son datos internos-
select * from libclea.CCMBA20;
select * from contabilid.CCMBA20;
COMA2OP-no-
select * from libclea.COMA2OP;
select * from gxbdbps.COMA2OP;
GCLIEAF-CEFENAC,CEAPECA-
select * from libclea.GCLIEAF;
select * from gxbdbps.GCLIEAF;
GDIREAF -CEDIREC, CETELEF
select * from libclea.GDIREAF;
select * from gxbdbps.GDIREAF;
GSUCUAF -SUNOMBR-
select * from libclea.GSUCUAF;
select * from gxbdbps.GSUCUAF;
GXASI20-no, son datos internos-
select * from libclea.GXASI20;
select * from gxfindta.ccasi20;
GXMBA20-no, son datos internos-
select * from libclea.GXMBA20;
select * from gxfindta.ccasi20;
OPLICRE -pendiente-
select * from libclea.OPLICRE;
select * from gxopera.OPLICRE;
OPTADE -pediente-
select * from libclea.OPTADE;
select * from gxopera.OPTADE;
TCLHTM -pendiente-
select * from libclea.TCLHTM;
select * from gxfindta.TCLHTM;
TCLMOD -no, datos de uso interno-  
select * from libclea.TCLMOD;
select * from gxfindta.TCLMOD; 
-------------------------------
------------------------------
TCLMOV -MOVNTAR, MOVDESEM, MOVDSBCE, MOVCTBCE, MOVDENO, MOVRAZO, MOVRUC, MOVDSBCC, MOVCTBCC, no se paso para verificar-
select * from libclea.TCLMOv;
select * from gxfindta.TCLMOv; 
-----------------------------
----------------------------
TCLTPC -TPCNUTAR, no se paso para verificar- 
select * from libclea.TCLTPC;
select * from gxfindta.TCLTPC;
TCLTSB -TSBCTDE, TSBCTCR, TSBDENE, no se paso para verificar-
select * from libclea.TCLTSB;
select * from gxfindta.TCLTSB;
TCLTSD  -TSDCTDE, TSDCTCR, no se paso-
select * from libclea.TCLTSD;
select * from gxfindta.TCLTSD;
TCOAUX -no, no esta en el listado-
select * from libclea.TCOAUX;
select * from gxtrjdta.TCOAUX;
TCOECS -no, no esta en el listado-
select * from libclea.TCOECS;
select * from gxtrjdta.TCOECS;
TDCLIENTE -ok-
select * from libclea.TDCLIENTE;
select * from gxbdbps.TDCLIENTE;
TDCLIENTED -TDEMAIL, TDTEL, TDCLINRODOC, no esta en el listado-
select * from libclea.TDCLIENTEd;
select * from gxbdbps.TDCLIENTEd;
TDCTA -TDCTANRO, no esta en el listado-
select * from libclea.TDCTA;
select * from gxbdbps.TDCTA;    
TDCTAAD  -TDCTANRO, TDCLINRODOC, no esta en el listado-
select * from libclea.TDCTAAD;
select * from gxbdbps.TDCTAAD;   
TDCTAREL -TDCTANRO, TDCLINRODOC, TDADHTARIN, no listado-
select * from libclea.TDCTAREL;
select * from gxbdbps.TDCTAREL; 
TDEMIS -TDCTANRO, no listado-
select * from libclea.TDEMIS;
select * from gxbdbps.TDEMIS; 
TDEMISNOV -TDCTANRO, no listado-
select * from libclea.TDEMISNOV;
select * from gxbdbps.TDEMISNOV; 
TDEMNOTAR -NECTANRO, no listado-
select * from libclea.TDEMNOTAR;
select * from gxbdbps.TDEMNOTAR; 
TDGENP -PERNRODOC, ENPFECNAC, ENPTELEF, no listado-
select * from libclea.TDGENP;
select * from gxtrjdta.TDGENP;
TDGESC -ESCNMSUCU, no listado-
select * from libclea.TDGESC;
select * from gxtrjdta.TDGESC;
TDGPER  -PERNRODOC, PERFECNAC, PERTELEF, no listado-
select * from libclea.TDGPER;
select * from gxtrjdta.TDGPER;
TDTARREL -OK-
select * from libclea.TDTARREL;
select * from gxbdbps.TDTARREL; 
TMCTAAF  -MCNUMCT, MCNUMDO, no listado-
select * from libclea.TMCTAAF;
select * from gxbdbps.TMCTAAF; 
TMTARAF  MCNUMCT, CENUMDO, no listado
select * from libclea.TMTARAF;
select * from gxbdbps.TMTARAF; 
-------------------------------
-------------------------------
TSWAUT -AUTCOMRAZ, AUTPANNRO, no listado-
select * from libclea.TSWAUT;
select * from gxbdbps.TSWAUT;  
TTCCTA -CTANRODOC, no listado-
select * from libclea.TTCCTA;
select * from gxtrjdta.TTCCTA;
TTCCTD -CTDVALOR1, CTDDSREFER, no listado-
select * from libclea.TTCCTD;
select * from gxtrjdta.TTCCTD;
TTCTRJ -TRJNRODOC, no listado-
select * from libclea.TTCTRJ;
select * from gxtrjdta.TTCTRJ; 
TTDCAD -PERNRODOC, no listado-
select * from libclea.TTDCAD;
select * from gxtrjdta.TTDCAD; 
TTDCDB -ok-
select * from libclea.TTDCDB;
select * from gxtrjdta.TTDCDB;
TTDCRE -ok-
select * from libclea.TTDCRE;
select * from gxtrjdta.TTDCRE;
TTDEMI 
select * from libclea.TTDEMI;
select * from gxtrjdta.TTDEMI;


--REDMINE 
             --adicionales con enmascarado
GXTRJDTA.TATADD --ruben rojas, detalle
SELECT * FROM GXTRJDTA.TATADD;
SELECT * FROM LIBDATO.TATADD;
GXTRJDTA.TATDKB
SELECT * FROM GXTRJDTA.TATDKB;
SELECT * FROM LIBDATO.TATDKB;
GXTRJDTA.TATADC
SELECT * FROM GXTRJDTA.TATADC;
SELECT * FROM LIBDATO.TATADC;
               --adicionales sin enmascarar
GXTRJDTA.TATAuD --ruben rojas, cabecera
SELECT * FROM GXTRJDTA.TATAuD;
SELECT * FROM LIBDATO.TATAuD;
GXTRJDTA.TATKBT
SELECT * FROM GXTRJDTA.TATKBT;
SELECT * FROM LIBDATO.TATKBT;
GXTRJDTA.TATAuC
SELECT * FROM GXTRJDTA.TATAuC;
SELECT * FROM LIBDATO.TATAuC;
GXTRJDTA.TDGADF --mariano virgili
SELECT * FROM GXTRJDTA.TDGADF;
SELECT * FROM LIBDATO.TDGADF;
GXTRJDTA.TDGALC --mariano virgili
SELECT * FROM GXTRJDTA.TDGALC;
SELECT * FROM LIBDATO.TDGALC;
GXBDBPS.TAFINAF
SELECT * FROM GXTRJDTA.TAFINAF;
SELECT * FROM LIBDATO.TAFINAF;

SELECT * FROM GXBDBPS.TMTARAF



U99JAVIER
select * from libdebito.drconbep where lfectr = '20200602';

--para ver los permisos de menu en as-400, por usuario
SELECT * FROM mnulib.MNDETA0P WHERE DEusER = 'U99RPA';

UPDATE MNULIB.MNDETA0P
   SET DEUSER = 'U99RPA   '
WHERE DEUSER = 'U99NATI   ';

--------------------------------------------------------------------
--------------------------------------------------------------------
---Ajuste en la generación de asientos - Migración de GNB a CONTI---
--------------------------------------------------------------------
--------------------------------------------------------------------
select * from javierlib.flicombk;

--asientos--
select * from gxopera.flicom where LICODBAN = 'BC' and LIFECHD = '20201215';

select * from gxopera.opmovi where opliqde = '20210114'


UPDATE GXOPERA.FLICOM
   SET 
       LINROASI = 0
WHERE licodban  <> '';


select asfech FECHA, asnras ASIENTO, ascoct CUENTA, ASCPRV COMERCIO, asdesc DESCRIPCION, asimpo IMPORTE, ascobc COD_BANCO from contabilid.ccasi20 where asdesc like '% - PAG%'

select ASCPRV COMERCIO, asfech FECHA, asnras ASIENTO, ascoct CUENTA, asdesc DESCRIPCION, asimpo IMPORTE, ascobc COD_BANCO from contabilid.ccasi20 where asnras = '155'

select * from contabilid.ccasi20 where asdesc like '% - PAG%'

select count(*), ascobc from contabilid.ccasi20 where asdesc like '% - PAG%' group by ascobc;

152 y 153, BC
154 y 155, IB
    
SELECT * FROM CONTABILID.TAT2CTA WHERE T2TPCO= '21' AND T2COBC= 'IB';

SELECT * FROM contabilid.TAT2CTA WHERE T2TPCO= '21' AND T2COBC in 
('AT', 'IF', 'BC', 'IB');

[12/01 12:19 p.m.] Graciela Vera
    SELECT * FROM GXSEGDTA.TSGSIS t WHERE SGSISCOD IN (1, 2, 21, 33);
    
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
  'IF',
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
  'IF',
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
  'IB',
  1,
  '01',
  '21',
  101012001000097,
  121840601,
  1,
  0,
  0,
  111499882939,
  ' '
);


--#mejora asientos contaweb

select lifechd from gxopera.flicom group by lifechd

select * from GXOPERA.flicom where lifechd in ('20210119', '20210120')

UPDATE GXOPERA.FLICOM
   SET LINROASI = 0
WHERE lifechd in ('20210119', '20210120');

SELECT * FROM CONTABILID.TAT2CTA WHERE T2COBC = 'BA' AND T2TPCO = '21';

SELECT * FROM CONTABILID.CCASI21 WHERE ASFECH = '210120';

SELECT * FROM GXOPERA.OPLIQUI WHERE SUBSTR(OPCAMPOA,41,8) = '20210119';

SELECT * FROM GXOPERA.OPMOVI WHERE OPFECOM = '20210119';

--OPCION 1, CARGA TEMPORAL
SELECT sum(pgcomp) FROM LIBDEBITO.COCONT0P WHERE PGENTI = '168' AND PGCOME = '0801447';
--eliminar fecha de debito para el usuario de generacion de asientos, borrar para volver a ejecutar la carga del temporal.	
select * from libdebito.CO02FCOM;

SELECT sum(opmonto-opcomi) FROM GXOPERA.OPMOVI WHERE OPFECOM = '20210128' AND OPCOMER in(
SELECT ASCPRV FROM CONTABILID.CCASI21 WHERE ASFECH = '210128' AND ASNRAS = '153');

--OPCION 4, GENERAR ASIENTOS, COMPRA TARJ DEBITO
--53 AL 88, ASIENTOS PRUEBA 1
SELECT * FROM CONTABILID.CCASI21 WHERE ASFECH = '210128' AND ASDESC LIKE '%JUDICIAL%' and ASNRAS = '153';

select auttrxfchc from libclea.tswaut where auttrxfchc > '20210101' group by auttrxfchc;

select * from gxfindta.tclrtc;

select * from gxbdbps.gengraf;
select * from gxbdbps.ggrupaf;
select * from gxbdbps.GTRANAF;
select * from gxbdbps.GENTIAF;
select * from gxbdbps.GSUCUAF;
select * from gxbdbps.GUSERAF;


select * from gxbdbps.tgrupaf;
select * from gxbdbps.TGENTI0P;
select * from gxbdbps.GXRELGRU where usuaid = 'U99JAVIER';
select * from gxbdbps.debgengraf;

select * from gxbdbps.tmtaraf where MCNUMCT = '40050000078';
select * from gxbdbps.tmctaaf where MCNUMCT = '40050000078';

SELECT * FROM GXBDBPS.GUSERAF WHERE USIDUSR = 'U99JAVIER';
