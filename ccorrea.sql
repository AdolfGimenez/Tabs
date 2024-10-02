"select * from gxopera.comerprb --en desarrollo

select * from gxopera.comerprb


select * from gxbdbps.cozonaf order by zonacodi


select * from gxbdbps.coafmaf where 

--consulta segun ultimo reporte
select * from gxbdbps.coafmaf where afcomer in ( 
'0302167'
,'0801361'
,'0801362'
,'1002012'
,'1002013'
,'1002014'
,'1002015'
,'3100064'
,'5400617')

select * from gxopera.opmrtrx where OPCODCOM in ('0302167'
,'0801361'
,'0801362'
,'1002012'
,'1002013'
,'1002014'
,'1002015'
,'3100064'
,'5400617')

select * from gxbdbps.coma1af where coprcodi in 
('8100461',
 '8100629',
 '8101237',
 '8101254')
 
select * from gxbdbps.coma1af where coprcodi = '8101203'
 
select * from gxbdbps.coafmaf where afcomer in ( 
'8100461',
 '8100629',
 '8101237',
 '8101254')

select * from gxbdbps.comaeaf where cocomer in ( 
'0200781',
'1001048',
'2100369',
'5400617') 


--se eliminan los codigos de comercios 81 mal relacionados al codigo de compra
delete from gxbdbps.coma1af where cocomer = '8101237' and coprcodi = '8101237';
commit;
delete from gxbdbps.coma1af where cocomer = '8101254' and coprcodi = '8101254';
commit;
delete from gxbdbps.coma1af where cocomer = '8600079' and coprcodi = '8100461';
commit;
delete from gxbdbps.coma1af where cocomer = '8600226' and coprcodi = '8100629';
commit;

-- se consulta códigos 81 asociados como compra
select *  from gxbdbps.coma1af where cocomer = '8101254';
select *  from gxbdbps.coma1af where cocomer = '8101237';

-- se elimina códigos 81 asociados como compra
delete from gxbdbps.coma1af where cocomer = '8101254';

delete from gxbdbps.coma1af where cocomer = '8101237';

-- estado de estos comercios
select * from gxbdbps.comaeaf where cocomer in('1100262','5400617')

select * from gxbdbps.coafmaf where afcomer in('1100262','5400617') 

--para el reporte del mes de enero, se actualizaron cozona, comaeaf y coma1af.

select * from gxopera.opmrtrx where opcodcom in('6500022','6500023','6500024','6500040','6500041','6500051','6500056','6500066','6500067','6500071'
,'6500086','6500091','6500097','6500098','6500119','6500130','6500132','6500137','6500139','6500145','6500147','6500148','6500161','6500162','6500163')

--listado de comercios que no deben aparecer en el reporte, cuyas transacciones no estan aprobadas 

select * from libdebito.DRCONBEp where lidcom in (6500022,6500023,6500024,6500040,6500041,6500051,6500056,6500066,6500067,6500071,6500086,6500091,6500097
,6500098,6500119,6500130,6500132,6500137,6500139,6500145,6500147,6500148,6500161,6500162,6500163) and LFECTR between '20200101' and '20200131'

select * from libdebito.DRCONBEp

select * from gxbdbps.coma1af where COPRCODI in(
'8100461'
,'8100629'
,'8101203'
,'8101237'
,'8101254'
,'8101267')

select * from gxbdbps.coma1af where COPRCODI = '8101203'

select * from gxbdbps.coma1af where cocomer in(
'8100461'
,'8100629'
,'8101203'
,'8101237'
,'8101254'
,'8101267')

select * from gxbdbps.coma1af where cocomer = '8101203'
select * from gxbdbps.coma1af where cocomer in(
'8100461'
,'8100629'
,'8101203'
,'8101267')


delete from gxbdbps.coma1af where cocomer in (
'8100461'
,'8100629'
,'8101203'
,'8101237'
,'8101254'
,'8101267')


select * from gxbdbps.coma1af where cocomer in (
'8100461'
,'8100629'
,'8101203'
,'8101237'
,'8101254'
,'8101267')

select * from gxbdbps.coma1af where cocomer like ('8600%')and coprcodi like ('8100%')

select * from gxbdbps.coma1af where cocomer like ('8100%') and coprcodi like ('8600%')

select * from gxbdbps.coma1af where cocomer like ('8600%')and coprcodi like ('8600%')

select * from gxbdbps.coma1af where cocomer like ('8100%')and coprcodi like ('8100%')


select * from gxbdbps.comaeaf where cocomer in('8101203','8101267')

--se actualiza el codigo de servicio para estos comercios

UPDATE gxbdbps.COMA1AF SET PRCODI = '995'  WHERE COPRCODI = '8101203' AND COCOMER = '0701416' AND   COPRSEC2 = 2 --AND   PRCODI = '520';

UPDATE gxbdbps.COMA1AF SET PRCODI = '995'  WHERE COPRCODI = '8101267' AND COCOMER = '0701971' AND   COPRSEC2 = 3 --AND   PRCODI = '520'; 
 
"
--REDMINE #6054
estado P
entidad, fecha y hora iguales

select * from gxbdbps.tembsaf order by BSFEEMB desc

select * from libdebito.EMBTRKHST where tktrak <> '' and tkenti = '021' --order by tkfee2 desc --and TKFEE2 = '20200412'

select * from libdebito.embtrkdeb where tkenti = '021'

select * from libdebito.embtrkvis where tkenti = '021' and tkstat = '' order by TKFEE2 desc

select * from libdebito.embtrkvis where tkenti = '021' order by TKFEE2 desc

SELECT * FROM LIBDEBITO.EMBTRKVIS WHERE TKSTAT = '' ORDER BY TKFEE2 DESC

--redmine #6259 - Verificación descripción motivos de bajas

select * from cierrelib.CODOCAF where cocomer = '0100001'

delete from gxbdbps.CODOCAF where cocomer = '0700036'

--redmine 6157

--------------------ALTER TABLE COMAEXD -------------------------

-----SELECT * FROM CCORREA.COMAEXD1  -- COPIA DE COMAEXD 05/12/2019 

--ALTER TABLA COMAEXD     05/12/2019 
DROP TABLE GXBDBPS.COMAEXD;

CREATE TABLE GXBDBPS.COMAEXD
(
 --  CCCODSEC   DECIMAL(4)     NOT NULL,
   CCFCHDES   CHAR(8)        NOT NULL,
   COCOMER    CHAR(7)        NOT NULL,
   BPSSRVCOD  DECIMAL(3)     NOT NULL,
   CCOPERA    CHAR(3)        NOT NULL,
   CCMARCA    CHAR(3)        NOT NULL,
   CCMAROR    CHAR(1)        NOT NULL,
   CCMARPR    CHAR(3)        NOT NULL,
--   CECOMDEB   DECIMAL(7,4)   NOT NULL,
 --  CECOMCRE   DECIMAL(7,4)   NOT NULL,
   CCTIPTA    CHAR(1)        NOT NULL,     
   CCMTASA    DECIMAL(7,4),  
   CCESTADO   CHAR(1),
   CCUSRA     CHAR(10),
   CCFECA     CHAR(8),
   CCUSRM     CHAR(10),
   CCFECM     CHAR(8)        

);

ALTER TABLE GXBDBPS.COMAEXD
   ADD CONSTRAINT GXBDBPS.pk_comaexd
   PRIMARY KEY (CCFCHDES, COCOMER, BPSSRVCOD,CCOPERA, CCMARCA, CCMAROR, CCMARPR, CCTIPTA);

ALTER TABLE GXBDBPS.COMAEXD
  ADD CONSTRAINT GXBDBPS.ICOMAEXD1 FOREIGN KEY (COCOMER,BPSSRVCOD)
  REFERENCES GXBDBPS.COMAEXT (COCOMER,BPSSRVCOD)
  ON UPDATE RESTRICT
  ON DELETE RESTRICT;

/*COMMENT ON TABLE CCORREA.COMAEXD IS 'Detalle extension comaeaf';
COMMENT ON COLUMN CCORREA.COMAEXD.CCFCHDES IS 'Fecha Desde Vigencia';
COMMENT ON COLUMN CCORREA.COMAEXD.COCOMER IS 'Codigo del Comercio';
COMMENT ON COLUMN CCORREA.COMAEXD.BPSSRVCOD IS 'Codigo Servicio Bepsa';
COMMENT ON COLUMN CCORREA.COMAEXD.CCMARCA IS 'Marca Id';
--COMMENT ON COLUMN CCORREA.COMAEXD.CECOMDEB IS '% Comision Debito';
--COMMENT ON COLUMN CCORREA.COMAEXD.CECOMCRE IS '% Comision Credito';
COMMENT ON COLUMN CCORREA.COMAEXD.CCESTADO IS 'Estado';
COMMENT ON COLUMN CCORREA.COMAEXD.CCUSRA IS 'Usuario Alta';
COMMENT ON COLUMN CCORREA.COMAEXD.CCFECA IS 'Fecha Alta';
COMMENT ON COLUMN CCORREA.COMAEXD.CCUSRM IS 'Usuario Modif.';
COMMENT ON COLUMN CCORREA.COMAEXD.CCFECM IS 'Fecha Modif.';
COMMENT ON COLUMN CCORREA.COMAEXD.CCMAROR IS 'Marca Producto';
COMMENT ON COLUMN CCORREA.COMAEXD.CCMARPR IS 'Producto marca';
COMMENT ON COLUMN CCORREA.COMAEXD.CCMTASA IS '% Tasa marca';*/

COMMIT;



------------------- FIN ALTER COMAEXD -------------------------

------------------- ALTER TCoCat ------------------------------

DROP TABLE GXBDBPS.TCoCat 

SELECT * FROM GXBDBPS.TCoCat

CREATE TABLE GXBDBPS.TCoCat 
(

--	 CatCodCom  CHAR(7) NOT NULL,
	 CatCodRuc  CHAR(15) NOT NULL,
   CatRazSoc  CHAR(50),
   CatCodRub  CHAR(2),
	 CatCodMar	CHAR(3),
   CatCodMcc  CHAR(6),     
   CatCodCat  CHAR(1),
	 CatCodMid  CHAR(6), 
   CatCodCid  CHAR(6), 
   CatFchAlt  CHAR(8),
   CatUsuAlt  CHAR(10),
   CatFchMod  CHAR(8),
   CatUsuMod  CHAR(10)

);

ALTER TABLE GXBDBPS.TCoCat
   ADD CONSTRAINT  GXBDBPS.pk_tcocat
   PRIMARY KEY (CatCodRuc);

COMMIT;

------------------- FIN ALTER TCoCat -------------------------

------------------- ALTER TCotpm     --------------------------
DROP TABLE GXBDBPS.TCoTPM 

SELECT * FROM GXBDBPS.TCoTPM

CREATE TABLE GXBDBPS.TCoTPM 
(

	TPMCODMAR CHAR (3) NOT NULL,
	TPMPROMAR CHAR (3) NOT NULL, 
	TPMPROBEP CHAR (3),
	TPMPRODSC CHAR (30),
	TPMTIPPRO CHAR (1), 
	TPMFCHALT CHAR(8),
	TPMUSUALT CHAR(10),
	TPMFCHMOD CHAR(8),
	TPMUSUMOD CHAR(10)	

);

ALTER TABLE GXBDBPS.TCoTPM
   ADD CONSTRAINT GXBDBPS.pk_tcotpm 
   PRIMARY KEY (TPMCODMAR, TPMPROMAR);


COMMIT;

-------------------- FIN ALTER ---------------------------

-------------------- ALTER TCoMTM ------------------------
DROP TABLE GXBDBPS.TCoMTM 

SELECT * FROM GXBDBPS.TCoMTM

CREATE TABLE GXBDBPS.TCoMTM 
(

	MTMCodRub		CHAR(2)  NOT NULL,
	MTMCodCat		CHAR(1)  NOT NULL,
	MTMCodMcc  	CHAR(6)  NOT NULL,
	MTMCodMar		CHAR(3)  NOT NULL,
	MTMCodPro		CHAR(3)  NOT NULL,
	MTMTipTas   CHAR(1)  NOT NULL,
  MTMPorTas   DECIMAL(7,4),
	MTMCrdPaj   CHAR(1),
	MTMCrdNaj   CHAR(1),
	MTMFchAlt   CHAR(8),
	MTMUsuAlt   CHAR(10),
	MTMFchMod   CHAR(8),
	MTMUsuMod   CHAR(10)

);

ALTER TABLE GXBDBPS.TCoMTM
   ADD CONSTRAINT GXBDBPS.pk_tcomtm
   PRIMARY KEY (MTMCodRub, MTMCodCat, MTMCodMcc, MTMCodMar, MTMCodPro, MTMTipTas);

COMMIT;

---------------------- FIN ALTER ---------------------------

--SELECT * FROM FLARALIB.COMAEAF WHERE CODENO LIKE '%RETAIL%' AND COSTAT = 0
--SELECT * FROM FLARALIB.COMAEAF WHERE CORUCN = '80022106-0'

--SELECT * FROM GXBDBPS.TCOCAT

---------------------------- INSERT TCOCAT( CATEGORIA DE COMERCIOS) ------------------------------------------
INSERT INTO GXBDBPS.TCOCAT( CATCODRUC,CATRAZSOC,CATCODRUB,CATCODMAR,CATCODMCC,CATCODCAT,CATCODMID,CATCODCID,CATFCHALT,CATUSUALT,CATFCHMOD,CATUSUMOD )
VALUES(  '80022106-0','SALEMMA RETAIL S.A','07','MST' , '5411', 'L', '421069', '260154','20200220', 'U99JAVIER','00000000', '');

INSERT INTO GXBDBPS.TCOCAT( CATCODRUC,CATRAZSOC,CATCODRUB,CATCODMAR,CATCODMCC,CATCODCAT,CATCODMID,CATCODCID,CATFCHALT,CATUSUALT,CATFCHMOD,CATUSUMOD )
VALUES(  '80000519-8','TELECEL S.A.E. ','54','MST' , '4814', 'L', '421070', '260155','20200220', 'U99JAVIER','00000000', '');

INSERT INTO GXBDBPS.TCOCAT( CATCODRUC,CATRAZSOC,CATCODRUB,CATCODMAR,CATCODMCC,CATCODCAT,CATCODMID,CATCODCID,CATFCHALT,CATUSUALT,CATFCHMOD,CATUSUMOD )
VALUES(  '80017437-2','NUCLEO S.A     ','54','MST' , '4814', 'M', '421071', '260156','20200220', 'U99JAVIER','00000000', '');

INSERT INTO GXBDBPS.TCOCAT( CATCODRUC,CATRAZSOC,CATCODRUB,CATCODMAR,CATCODMCC,CATCODCAT,CATCODMID,CATCODCID,CATFCHALT,CATUSUALT,CATFCHMOD,CATUSUMOD )
VALUES(  '80031970-2','TUPI S.A.R.G    ','13','MST' , '5311', 'L', '421072', '260157','20200220', 'U99JAVIER','00000000', '');

COMMIT;
--------------INSERT MARCA ---------------------------------
DROP TABLE GXBDBPS.TCOMAR;

SELECT * FROM GXBDBPS.TCOMAR

CREATE TABLE GXBDBPS.TCOMAR
(
   MARID          CHAR(3) NOT NULL,
   MARNOM         CHAR(30),
   MAROBS         CHAR(100),
   MARUSRAUD      CHAR(10),
   MARFCHAUD      CHAR(8)       
);

ALTER TABLE GXBDBPS.TCOMAR
   ADD CONSTRAINT GXBDBPS.pk_tcomar      
   PRIMARY KEY (MARID);

COMMIT;


----------------------------------------------------
--------------------- INSEERT MARCA PRODUCTO ----------------
DROP TABLE GXBDBPS.TCOMPR;

SELECT * FROM GXBDBPS.TCOMPR

CREATE TABLE GXBDBPS.TCOMPR
(
   MARID         CHAR(3)         NOT NULL,
   MPRPROID      CHAR(3)         NOT NULL,
   MPRTPOID      CHAR(1)         NOT NULL,
   MPRNOMPR      CHAR(30),
   MPRUSRUA      CHAR(10),
   MPRFHCUA      CHAR(8)       
);

ALTER TABLE GXBDBPS.TCOMPR
   ADD CONSTRAINT GXBDBPS.pk_tcompr
   PRIMARY KEY (MARID, MPRPROID,MPRTPOID);

ALTER TABLE GXBDBPS.TCOMPR
  ADD CONSTRAINT GXBDBPS.ITCOMPR1 FOREIGN KEY (MARID)
  REFERENCES GXBDBPS.TCOMAR (MARID)
  ON UPDATE RESTRICT
  ON DELETE RESTRICT;

COMMIT;


--select * from ccorrea.TCoCat
--select * from ccorrea.TCotpm
--select * from ccorrea.TCoMTM
--select * from gxbdbps.Comaexd
--select * from ccorrea.TCOMAR 
--select * from ccorrea.TCOMPR

 



/* Alterar la tabla GXOPERA.SERVBPS */

SELECT * FROM GXOPERA.SERVBPS

ALTER TABLE GXOPERA.SERVBPS ADD COLUMN BPSSRVCLE
 CHARACTER (10)
  CCSID 284 NOT NULL NOT HIDDEN;
  
select * from gxbdbps.tcomtm where MTMCODRUB = '07'


INSERT INTO GXOPERA.SERVBPS
(
  BPSSRVCOD,
  BPSSRVDSC,
  BPSFCHALT,
  BPSUSUALT,
  BPSFCHMOD,
  BPSUSUMOD,
  BPSHABINH,
  BPSSRVCLE
)
VALUES
(
  9,
  'PAGO DE FACTURAS                                                                ',
  '20200213',
  'U99CORREA ',
  '00000000',
  '          ',
  'S',
  '          '
);

UPDATE GXOPERA.SERVBPS
   SET BPSSRVDSC = 'COMPRAS                                                                         ',
       BPSFCHALT = '20190517',
       BPSUSUALT = 'U99ANTONIO',
       BPSFCHMOD = '00000000',
       BPSUSUMOD = '          ',
       BPSHABINH = 'S',
       BPSSRVCLE = 'COMPRA    '
WHERE BPSSRVCOD = 1;

comaext

comaexd

select * from gxbdbps.corubaf

select * from gxbdbps.comaexd where cocomer = '0800088'


select * from gxbdbps.comaext

select * from gxbdbps.


select * from gxbdbps.taggene

select * from contabilid.tatgene where TGENTI = '001'

select ADDESDEB, ADDESCRE from gxbdbps.comaeaf where COCOMER = '0800088'

select * from gxbdbps.comaeaf where cocomer like '080%'

	select  a.cocomer, a.codeno, codire1, lodesc, coteln, RPRENAME, COSTAT,COFULMOD, COMODID,  CODOCID , 
(CASE 
  WHEN CODOCID = 13 THEN 'PROBLEMAS DE ACREDITACION'
	WHEN CODOCID = 14 THEN 'POR MORA'
	WHEN CODOCID = 15 THEN 'ERROR EN ALTA - RUBRO'
	WHEN CODOCID = 16 THEN 'CAMBIO DE RAZON SOCIAL'
	WHEN CODOCID = 17 THEN 'CIERRE DEL LOCAL'
	WHEN CODOCID = 18 THEN 'SIN MOVIMIENTO '
	WHEN CODOCID = 19 THEN 'PREVENCION DE FRAUDE '
	WHEN CODOCID = 20 THEN 'PROBLEMAS DE TRX    '
	WHEN CODOCID = 21 THEN 'PROBLEMAS DE POS '
	WHEN CODOCID = 22 THEN 'FIN DE EVENTO'
	WHEN CODOCID = 23 THEN 'CAIDA DE NEGOCIACION'
	WHEN CODOCID = 24 THEN 'CAMPAÑA DE COMERCIOS SUSPENDIDOS'
	WHEN CODOCID = 35 THEN 'INFORMCONF'
	WHEN CODOCID = 44 THEN 'PROBLEMAS DE POS (CARGADOR)'
	WHEN CODOCID = 45 THEN 'PROBLEMAS DE POS (SENAL)'
	WHEN CODOCID = 46 THEN 'PROBLEMAS DE POS (BATERIA)'
	WHEN CODOCID = 47 THEN 'FACTURAS PENDIENTES'
	WHEN CODOCID = 48 THEN 'POCO MOVIMIENTO CON TARJETAS DINELCO'
	WHEN CODOCID = 49 THEN 'POCO MOVIMIENTO CON TODAS LAS TARJETAS'
	WHEN CODOCID = 50 THEN 'REFACCION'
	WHEN CODOCID = 51 THEN 'BAJA TEMPORAL POR PANDEMIA' 
	END ) DESCR   
	from gxbdbps.comaeaf a inner join gxopera.meses on (substr(a.cofulmod,5,2) = mes)
	inner join gxbdbps.colocaf c
	on a.locodi = c.locodi
	INNER JOIN gxbdbps.corpraf S
	ON A.RPRECOD = S.RPRECODI
inner join gxbdbps.CODOCAF D on  a.cocomer = D.COCOMER
where substr(cofulmod,1,4) =  '2020'
and substr(cofulmod,5,2) between  '1'  and  '12'
AND substr(cofulmod,7,2) between '1' and '30'
and substr(a.cocomer,1,2) not in ('90', '80', '81', '79')
and costat = '90'
AND CODOCID BETWEEN '13' AND '51'


select * from gxbdbps.CODOCAF

SELECT RUDESCRE, RUDESDEB FROM GXBDBPS.CORUBAF WHERE RUCODI = '86'

ALTER TABLE GXOPERA.SERVBPS ADD COLUMN BPSSRVCLE CHARACTER (10)

select * from gxbdbps.tcodpp where COCOMER = '0100037'



-- SE AGREGA CAMPO PARA CUENTA TERCERO
ALTER TABLE GXBDBPS.TCODPP ADD COLUMN DPPCTER CHARACTER (1);

--SE CONSIDERA TODOS LOS REGISTROS EXISTEN COMO CUENTA TERCERO (S)
UPDATE GXBDBPS.TCODPP SET DPPCTER = 'S'; 
UPDATE GXBDBPS.TCODPP
   SET DPPCTER = 'S'
WHERE DPPRID = '66';

select cocomer, adnumcta from gxbdbps.comaeaf where enemiso = '057' and COSTAT = '0'



select * from cierrelib.comaeaf where comadre = '0900117'

select * from cierrelib.coafmaf where afcomer = '0900117'

select * from cierrelib.coafmaf where afcomer in (
'0300573',
'0300893',
'0900114',
'0900115',
'0900116',
'0900117',
'0301077',
'2000112',
'2000113',
'2000133',
'2000138',
'2000162',
'0301469',
'2000205')
and afticodi = '1402'

SELECT * FROM CIERRELIB.TFUNCAF where  fcid = 'BLC'

SELECT * FROM CIERRELIB.TFUN1AF where FCVALOR = 'U99JAVIER' and FCID = 'MAA'

INSERT INTO CIERRELIB.TFUN1AF
(
  FCID,
  FCTIPAU,
  FCVALOR
)
VALUES
(
  'BLC',
  '001',
  'U99JAVIER '
);




----------------
---------------
---------------
select * from gxbdbps.tcodpp

select * from libdebito.drconbep where lfectr = '20200821' order by lhortr desc

select * from gxbdbps.tswaut where AUTRRNBEP = '023400062426'



select * from cierrelib.corubaf

select * from cierrelib.comaeaf where substr(cocomer, 1,2)='07' --cocomer = '0702360'

SELECT * FROM gxfindta.TCLVCT where vctnrocta = '2527845301'

select * from GXBDBPS.comaeaf where enemiso = '057' AND COCOMER  = '0703427'

SELECT A.COCOMER, A.ADNUMCTA, A.ENEMISO, B.COCOMER,B.DPPTDC, B.DPPNDC, B.DPPNYA FROM cierrelib.COMAEAF AS A INNER JOIN
gxbdbps.TCODPP AS B ON A.COCOMER = B.COCOMER AND A.ENEMISO = '057' 

select * from gxbdbps.tcodpp where cocomer = '0100064';

SELECT * FROM yapi.TATGENE WHERE TGALFA = 'BA' AND TGENTI = '062'
  
select * from gxbdbps.gcontrp
UPDATE gxbdbps.GCONTRP
   SET COTIPC = '*NORMAL '
WHERE COCODI = '001';

UPDATE LIBDEBITO.DRCONBEP 
SET  lfcotr = '20200825'
WHERE lfcotr <> '20200825'

select * from libdebito.drconbep where lfectr = '20200825';

select * from gxopera.opliqui where OPFECLIQ = '20200825'

select * from gxopera.opmovi where opferea = '20200825' and opcomer= '1001776'

select openemi, sum(opmonto), sum(opcomi), sum(opmonto-opcomi) from gxopera.opmovi where opferea = '20200825' and opcomer= '1001776' group by openemi

select opferea FECHA, opcomer COMERCIO, opcodtrn COD_TRX, opcodres COD_RESP, opstatus EST_TRX, opmonto MONTO_TRX, opcomi COMISION_TRX, opcelu NUM_BILL,
opentid ENTIDAD, oprador OPERADOR_TRX from gxopera.opmovi where opferea = '20200825' and opcomer= '1001776'

select * from gxopera.oprecle where refech = '20200825'

select * from gxopera.flicom where lifechd = '20200825'

select * from gxopera.flicom1 where lifechd = '20200825'

select * from libdebito.drconbep where lcotel = '0991631648';

update libdebito.drconbep
set lidcom = '1001776'
where lidcom = '100001'
and lcotel = '0991631648';

select * from libdebito.drconbep where lcotel = '0991631648';

select enemiso from gxbdbps.comaeaf where cocomer = '1001776'

select * from gxopera.opentid where entdesc like (

select * from gxopera.opentcle

INSERT INTO GXOPERA.OPENTCLE
(
  ENTCOD,
  ENTCLA,
  ENTBCO,
  ENTTCTA,
  ENTNCTA,
  ENTOTR,
  ENTTIP
)
VALUES
(
  '540',
  'D',
  '020',
  0,
  '                    ',
  '                                                  ',
  'L'
);


select * from libdebito.drconbep where lfectr = '20200825' and lidcom = '1001776' and lcotel like '099%'

Selec


select * from gxbdcon.gxlofun where funcod = '2155'

select * from gxbdcon.gxlofun where funcod = '2155'

select * from gxbdcon.gxloper where usucod = '777' and siscodi = 'TC'

select * from gxbdcon.gxloperdet where usucod = '777' and siscodi = 'TC' and funcod = '2155'

select * from cierrelib.comaeaf where substr(cocomer, 1,2) in('45', '90') and enemiso = '057'

select * from 

values dayofyear(current_date);

select * from gxopera.OPMOVI where OPFEREA between '20200101' and '20200131'

SELECT SUM(MCSALFI) FROM gxbdbps.TMCTAAF WHERE MCNUMTA IN(SELECT DISTINCT OPTARJ FROM gxoper.OPMOVI WHERE OPFEREA >= 20191230 and OPFEREA <= 20200131 AND OPENTID IN('002','020','040') AND OPTIPTAR = 'CRE' AND OPCODTRN IN('011000', '012000','013000')
AND OPCODRES = '00' and OPSTATUS = 'A'  AND OPMONTO > 0 AND  OPENTID = '002' and OPADMIN IN('074', '018', '201'))

select * from GXBDBPS.ADCONT ORDER BY ACID DESC;

--redmine 9479  -ajuste de datos de comisiones
--- SOLICTAR DATOS ACTUALIZADOS DE COMAEAF,COMA1AF,COMAEXT,COMAEXD----

------------------------------- VERIFICACIONES --------------------------------------

----------------------- PARA VERIFICAR DATOS ACTUALIZADOS DE COMAEXT -----------------------------------
--OK CONTROLADO
--filtra los comercios que estaban mal, con datos incorrectos
SELECT * FROM GXBDBPS.COMAEXT WHERE CECTABAN = '' AND SUBSTR(COCOMER,1,2) <> '45' AND BPSSRVCOD IN( 1,2,3,4,5,9); --datos modificados
SELECT * FROM javierlib.COMAEXT WHERE CECTABAN = '' AND SUBSTR(COCOMER,1,2) <> '45' AND BPSSRVCOD IN( 1,2,3,4,5,9); --datos originales

select * from gxopera.servbps;

SELECT C.COCOMER,C.adticta,C.ADNUMCTA,C.rprecod,S.COCOMER,S.CECODBAN,S.CETIPCTA,S.CECTABAN,S.RPRECODI,S.CEUSRM
FROM GXBDBPS.COMAEAF AS C INNER JOIN GXBDBPS.COMAEXT AS S
ON C.COCOMER = S.COCOMER  
AND S.BPSSRVCOD IN( 1,2,3,4,5,9)
AND S.CEUSRM = 'MIGRACION'; ---AND CETIPCTA = 'C';

SELECT COCOMER,ENEMISO FROM GXBDBPS.COMAEAF WHERE COCOMER in 
('0100170',
'0200890',
'0302271',
'0302284');
SELECT * FROM CONTABILID.TATGENE WHERE TGENTI in('055', '054', '057');
--------------------------------------------------------------------------------------------------------

----------------------- PARA VERIFICAR DATO ACTUALIZADO EN COMAEXD ------------------------------------

SELECT * FROM GXBDBPS.COMAEXD WHERE CCMTASA = 0 AND CCTIPTA = 'D' AND BPSSRVCOD IN( 1,2,3,4,5,9) AND SUBSTR(COCOMER,1,2) <> '45';
SELECT * FROM javierlib.COMAEXD WHERE CCMTASA = 0 AND CCTIPTA = 'D' AND BPSSRVCOD IN( 1,2,3,4,5,9) AND SUBSTR(COCOMER,1,2) <> '45';

--6900306 en gxbdbps PENDIENTE A VERIFICAR

--OK control de igualar tasas de inserciones manuales anteriores a la mejora TASAS/COMERCIOS
--credito
SELECT C.COCOMER, C.ADDESCRE,S.COCOMER,S.CCMTASA,S.CCUSRM FROM GXBDBPS.COMAEAF AS C INNER JOIN GXBDBPS.COMAEXD AS S
ON C.COCOMER = S.COCOMER AND S.CCTIPTA = 'C' 
AND SUBSTR(S.COCOMER,1,2) <> '45'
AND S.CCUSRM = 'MIGRACION';
--debito
SELECT C.COCOMER, C.ADDESDEB,S.COCOMER,S.CCMTASA,S.CCUSRM FROM GXBDBPS.COMAEAF AS C INNER JOIN GXBDBPS.COMAEXD AS S
ON C.COCOMER = S.COCOMER AND S.CCTIPTA = 'D' 
AND SUBSTR(S.COCOMER,1,2) <> '45'
AND S.CCUSRM = 'MIGRACION';


--AND S.BPSSRVCOD = 1
--AND S.CCMARCA = 'DIN'
--AND S.CCMTASA = 0 
-------------------------------------------------------------------------------------------------------

---------------------- INSERT NUEVOS-------------------------------------------------------------------
------------------ VERIFICAR COMERCIOS FALTANTES ---------------------------

--OK control de asignación de servicios y tasas predeterminadas en servbps para comercios que no tienen cod servicio asignado
SELECT COCOMER,costat,COFECALT,COFULMOD FROM GXBDBPS.COMAEAF WHERE NOT COCOMER IN(SELECT COCOMER FROM GXBDBPS.COMAEXT WHERE BPSSRVCOD = 1) AND COSTAT in(1,0)
AND NOT SUBSTR(COCOMER,1,2)IN('45','65') AND SUBSTR(COCOMER,1,2)<= '78';

SELECT COCOMER,costat,COFECALT,COFULMOD FROM javierlib.COMAEAF WHERE NOT COCOMER IN(SELECT COCOMER FROM javierlib.COMAEXT WHERE BPSSRVCOD = 1) AND COSTAT in(1,0)
AND NOT SUBSTR(COCOMER,1,2)IN('45','65') AND SUBSTR(COCOMER,1,2)<= '78';

SELECT * FROM GXBDBPS.COMAEXT WHERE CEUSRA = 'MIGRACION' and CEFECA = '20201022' and BPSSRVCOD = '1';
SELECT * FROM javierlib.COMAEXT WHERE CEUSRA = 'MIGRACION' and CEFECA = '20201022' and BPSSRVCOD = '1';

SELECT * FROM GXBDBPS.COMAEXD WHERE CCUSRA = 'MIGRACION' and CCFECA = '20201022' and BPSSRVCOD = '1';
SELECT * FROM javierlib.COMAEXD WHERE CCUSRA = 'MIGRACION' and CCFECA = '20201022' and BPSSRVCOD = '1';

--credito
SELECT C.COCOMER, C.ADDESCRE,S.COCOMER,S.CCMTASA,S.CCUSRM, S.BPSSRVCOD, S.CCMARCA FROM GXBDBPS.COMAEAF AS C INNER JOIN GXBDBPS.COMAEXD AS S
ON C.COCOMER = S.COCOMER AND S.CCTIPTA = 'C' 
AND SUBSTR(S.COCOMER,1,2) <> '45'
AND S.CCUSRA = 'MIGRACION' AND S.CCFECA = '20201022' AND S.BPSSRVCOD = '1' AND S.CCMARCA = 'DIN';
--debito
SELECT C.COCOMER, C.ADDESDEB,S.COCOMER,S.CCMTASA,S.CCUSRM,  S.BPSSRVCOD, S.CCMARCA FROM GXBDBPS.COMAEAF AS C INNER JOIN GXBDBPS.COMAEXD AS S
ON C.COCOMER = S.COCOMER AND S.CCTIPTA = 'D' 
AND SUBSTR(S.COCOMER,1,2) <> '45'
AND S.CCUSRA = 'MIGRACION'AND S.CCFECA = '20201022' AND S.BPSSRVCOD = '1' AND S.CCMARCA = 'DIN';


----


SELECT C.COCOMER, C.ADDESCRE,S.COCOMER,S.CCMTASA,S.CCUSRM, S.BPSSRVCOD, S.CCMARCA FROM GXBDBPS.COMAEAF AS C INNER JOIN GXBDBPS.COMAEXD AS S
ON C.COCOMER = S.COCOMER AND S.CCTIPTA = 'C' 
AND SUBSTR(S.COCOMER,1,2) <> '45'
AND S.CCUSRA = 'MIGRACION' AND S.CCFECA = '20201022' AND S.BPSSRVCOD = '1' AND S.CCMARCA = 'DIN';
--debito
SELECT C.COCOMER, C.ADDESDEB,S.COCOMER,S.CCMTASA,S.CCUSRM,  S.BPSSRVCOD, S.CCMARCA FROM GXBDBPS.COMAEAF AS C INNER JOIN GXBDBPS.COMAEXD AS S
ON C.COCOMER = S.COCOMER AND S.CCTIPTA = 'D' 
AND SUBSTR(S.COCOMER,1,2) <> '45'
AND S.CCUSRA = 'MIGRACION'AND S.CCFECA = '20201022' AND S.BPSSRVCOD = '1' AND S.CCMARCA = 'DIN';

select * from gxbdbps.comaexd where BPSSRVCOD = '1' and CCMTASA = 0 AND SUBSTR(COCOMER,1,2) <>'45';
select * from gxbdbps.comaeaf where cocomer = '6900306';
---------------------------------------------------------------------------------------------------------

---------------------- DINELCO EFECTIVO A INSERTAR--------------------------

 

SELECT COCOMER,COPRCODI FROM GXBDBPS.COMA1AF WHERE COCOMER IN( SELECT COCOMER FROM GXBDBPS.COMAEAF WHERE NOT COCOMER IN(SELECT COCOMER FROM GXBDBPS.COMAEXT WHERE BPSSRVCOD = 2) AND COSTAT in(1,0)
AND NOT SUBSTR(COCOMER,1,2)IN('45','65') AND SUBSTR(COCOMER,1,2)<= '78' )
AND PRCODI = '995';

SELECT COCOMER,COPRCODI FROM JAVIERLIB.COMA1AF WHERE COCOMER IN( SELECT COCOMER FROM JAVIERLIB.COMAEAF WHERE NOT COCOMER IN(SELECT COCOMER FROM JAVIERLIB.COMAEXT WHERE BPSSRVCOD = 2) AND COSTAT in(1,0)
AND NOT SUBSTR(COCOMER,1,2)IN('45','65') AND SUBSTR(COCOMER,1,2)<= '78' )
AND PRCODI = '995';

SELECT * FROM GXBDBPS.COMAEXT WHERE BPSSRVCOD = '2' AND CEUSRA = 'MIGRACION' and CEFECA = '20201022';

SELECT * FROM CONTABILID.TATGENE WHERE TGCODE = 'BF';

--credito
SELECT C.COCOMER, C.ADDESCRE,S.COCOMER,S.CCMTASA,S.CCUSRM,  S.BPSSRVCOD, S.CCMARCA FROM GXBDBPS.COMAEAF AS C INNER JOIN GXBDBPS.COMAEXD AS S
ON C.COCOMER = S.COCOMER AND S.CCTIPTA = 'C' 
AND SUBSTR(S.COCOMER,1,2) <> '45'
AND S.CCUSRA = 'MIGRACION' AND S.CCFECA = '20201022' AND S.BPSSRVCOD = '2' and C.COCOMER in (
'0302278',
'0302303',
'0700992',
'0701675',
'0701962');
--debito
SELECT C.COCOMER, C.ADDESDEB,S.COCOMER,S.CCMTASA,S.CCUSRM,  S.BPSSRVCOD, S.CCMARCA FROM GXBDBPS.COMAEAF AS C INNER JOIN GXBDBPS.COMAEXD AS S
ON C.COCOMER = S.COCOMER AND S.CCTIPTA = 'D' 
AND SUBSTR(S.COCOMER,1,2) <> '45'
AND S.CCUSRA = 'MIGRACION' AND S.CCFECA = '20201022' AND S.BPSSRVCOD = '2' and C.COCOMER in (
'0302278',
'0302303',
'0700992',
'0701675',
'0701962');


select * from gxbdbps.comaeaf where cocomer in(
select cocomer from gxbdbps.coma1af where COCOMER in (
'0302278',
'0302303',
'0700992',
'0701675',
'0701962'
) and prcodi = '995');

SELECT * FROM GXBDBPS.COMAEXT WHERE BPSSRVCOD = '2' AND CEUSRA = 'MIGRACION' and CEFECA = '20201022';
-----------------------------------------------------------------

 

------------------ RED DE PAGOS A INSERTAR  ----------------------------------

 SELECT COCOMER,COPRCODI FROM GXBDBPS.COMA1AF WHERE COCOMER IN( SELECT COCOMER FROM GXBDBPS.COMAEAF WHERE NOT COCOMER IN(SELECT COCOMER FROM GXBDBPS.COMAEXT WHERE BPSSRVCOD = 2) AND COSTAT in(1,0)
AND NOT SUBSTR(COCOMER,1,2)IN('45','65') AND SUBSTR(COCOMER,1,2)<= '78' )
AND PRCODI = '994';

SELECT COCOMER,COPRCODI FROM JAVIERLIB.COMA1AF WHERE COCOMER IN( SELECT COCOMER FROM JAVIERLIB.COMAEAF WHERE NOT COCOMER IN(SELECT COCOMER FROM JAVIERLIB.COMAEXT WHERE BPSSRVCOD = 2) AND COSTAT in(1,0)
AND NOT SUBSTR(COCOMER,1,2)IN('45','65') AND SUBSTR(COCOMER,1,2)<= '78' )
AND PRCODI = '994';

SELECT * FROM GXBDBPS.COMAEXT WHERE BPSSRVCOD = '3' AND CEUSRA = 'MIGRACION' and CEFECA = '20201022';

SELECT * FROM CONTABILID.TATGENE WHERE TGCODE = 'BF';

--credito
SELECT C.COCOMER, C.ADDESCRE,S.COCOMER,S.CCMTASA,S.CCUSRM,  S.BPSSRVCOD, S.CCMARCA FROM GXBDBPS.COMAEAF AS C INNER JOIN GXBDBPS.COMAEXD AS S
ON C.COCOMER = S.COCOMER AND S.CCTIPTA = 'C' 
AND SUBSTR(S.COCOMER,1,2) <> '45'
AND S.CCUSRA = 'MIGRACION' AND S.CCFECA = '20201022' AND S.BPSSRVCOD = '3' and C.COCOMER in (
'0302278',
'0302303',
'0700992',
'0701675',
'0701962');
--debito
SELECT C.COCOMER, C.ADDESDEB,S.COCOMER,S.CCMTASA,S.CCUSRM,  S.BPSSRVCOD, S.CCMARCA FROM GXBDBPS.COMAEAF AS C INNER JOIN GXBDBPS.COMAEXD AS S
ON C.COCOMER = S.COCOMER AND S.CCTIPTA = 'D' 
AND SUBSTR(S.COCOMER,1,2) <> '45'
AND S.CCUSRA = 'MIGRACION' AND S.CCFECA = '20201022' AND S.BPSSRVCOD = '3' and C.COCOMER in (
'0302278',
'0302303',
'0700992',
'0701675',
'0701962');


select * from gxbdbps.comaeaf where cocomer in(
select COPRCODI from gxbdbps.coma1af where COCOMER in (
'0302278',
'0302303',
'0700992',
'0701675',
'0701962'
) and prcodi = '994');

SELECT * FROM GXBDBPS.COMAEXT WHERE BPSSRVCOD = '3' AND CEUSRA = 'MIGRACION' and CEFECA = '20201022';

SELECT COCOMER,COPRCODI FROM GXBDBPS.COMA1AF WHERE COCOMER IN( SELECT COCOMER FROM CCORREA.COMAEAF WHERE NOT COCOMER IN(SELECT COCOMER FROM GXBDBPS.COMAEXT WHERE BPSSRVCOD = 1) AND COSTAT in(1,0)
AND NOT SUBSTR(COCOMER,1,2)IN('45','65') AND SUBSTR(COCOMER,1,2)<= '78' )
AND PRCODI = '994';

 

------------------------------------------------------------------
------------------------------------------------------------------

------------------------------------------- SELECT PARA PREPARAR LA PLANILLA ---------------------------------------------
 ------------------------ PARA AJUSTES EN LAS TABLAS -----------------------------
 SELECT * FROM gxbdbps.COMAEXT WHERE CECTABAN = '' AND SUBSTR(COCOMER,1,2) <> '45' AND BPSSRVCOD IN( 1,2,3,4,5,9); --- CABECERA
 
SELECT * FROM gxbdbps.COMAEXD WHERE CCMTASA = 0 AND BPSSRVCOD IN( 1,2,3,4,5,9) AND SUBSTR(COCOMER,1,2) <> '45' ;  ---- DETALLE
 ---------------------------------------------------------------------------------
 
-------------------------------------------INSERT SERVICIO COMPRA -----------------------------------------------------------
 SELECT COCOMER,CODENO,costat,COFECALT FROM gxbdbps.COMAEAF WHERE NOT COCOMER IN(SELECT COCOMER FROM GXBDBPS.COMAEXT WHERE BPSSRVCOD = 1) AND COSTAT in(1,0)
 AND NOT SUBSTR(COCOMER,1,2)IN('45','65') AND SUBSTR(COCOMER,1,2)<= '78' 
 -----------------------------------------------------------------------------------------------------------------------------
 
------------------------------------------ INSERT SERVICIO DINELCO EFECTIVO -------------------------------------------------
 

 SELECT COCOMER,COPRCODI FROM GXBDBPS.COMA1AF WHERE COCOMER IN( SELECT COCOMER FROM GXBDBPS.COMAEAF WHERE NOT COCOMER IN(SELECT COCOMER 
 FROM GXBDBPS.COMAEXT WHERE BPSSRVCOD = 2) 
 AND COSTAT in(1,0)
 AND NOT SUBSTR(COCOMER,1,2)IN('45','65') AND SUBSTR(COCOMER,1,2)<= '78' )
 AND PRCODI = '995'
 
-----------------------------------------------------------------------------------------------------------------------------
 
---------------------------------------- INSERT SERVICIO RED DE PAGOS -------------------------------------------------------
 SELECT COCOMER,COPRCODI FROM GXBDBPS.COMA1AF WHERE COCOMER IN( SELECT COCOMER FROM GXBDBPS.COMAEAF WHERE NOT COCOMER IN(SELECT COCOMER 
 FROM GXBDBPS.COMAEXT WHERE BPSSRVCOD = 3) 
 AND COSTAT in(1,0)
 AND NOT SUBSTR(COCOMER,1,2)IN('45','65') AND SUBSTR(COCOMER,1,2)<= '78' )
 AND PRCODI = '994'
 
----------------------------------------------------------------------------------------------------------------------------
select * from libdebito.DRCONBEP where lfetr between '20201101' and '20201115';
select * from gxbdbps.COMAEAF;
select * from gxbdbps.COMA1AF;
select * from gxopera.OPMTARI;
select * from gxopera.OPENTID;
select * from gxopera.OPENTID1;
select * from gxopera.OPMMARC;
select * from libdebito.TBINPROC;

select * from;

select * from gxbdbps.comaeaf;
select * from gxbdbps.Coaftaf;
select * from gxbdbps.coafmaf;


select * from gxswtdta.TSWTPSW;

select * from gxopera.OPMRTRX;

select * from gxopera.tdavistas WHERE TDAANHO = '2021' and TDAMES = '01' and TDADIAS = '01';

--#14177 - Verificacion Reporte Pareto
SELECT * FROM GXBDBPS.TGREPREC;
SELECT * FROM GXBDBPS.TGREPRECTARJ;
SELECT * FROM CCORREA.DRCONBEP;

select lfectr, count (lfectr) from libdebito.drconbep group by lfectr order by lfectr;
select lfectr, count (lfectr) from javierlib.drconbep group by lfectr order by lfectr;

SELECT * FROM libdebito.DRCONBEP WHERE LIDCOM = '200274'--AND LFECTR >= '20200805'
AND LNRTAR IN(SELECT DISTINCT TARJNUM FROM GXBDBPS.TGREPRECTARJ)
ORDER BY LIDCOM ASC, LFECTR DESC, LNRTAR ASC;

SELECT COCOMER,COFEULVI,COMODID,COFULMOD FROM gxbdbps.COMAEAF WHERE COCOMER = '0200704';

SELECT COCOMER,COFEULVI,COMODID,COFULMOD FROM gxbdbps.COMAEAF WHERE COCOMER = '0200362';
