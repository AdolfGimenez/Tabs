---------------------------------------------------------------------------------------------------------------------------
----------------------------localidad reingenieria
select * from GXFINDTA.TCMRCI where RCINOMCIU like '%SAN ALBERTO%'

select * from GXTRJDTA.TDGCIU WHERE CIUDSCIUD  like '%SAN ALBERTO%'

select * from GXFINDTA.TCOCIU WHERE CIUDESCRI like '%SAN ALBERTO%' 
----------------------------------------------------------------------------------------------------------------
INSERT INTO GXFINDTA.TCMRCI
( RDECODDEP, RCICODCIU, RCICIUERP, RCINOMCIU, RCIUSULTUP, RCIFHULTUP)
VALUES
( 15, 9, '259', 'POZO COLORADO', 'U99ROJAS' , '2022-08-01 11:35:20.000');
----------------------------------------------------------------------------------------------------------------
INSERT INTO GXTRJDTA.TDGCIU
( CIUIDCIUD, DEPIDDEPT, CIUDSCIUD, CIUUSULTUP, CIUFHULTUP)
VALUES
( 9, 15, 'POZO COLORADO', 'MIGRACION ', '2020-04-23 18:00:00.000');
----------------------------------------------------------------------------------------------------------------
INSERT INTO GXFINDTA.TCOCIU
( DEPCOD, CIUCODNUE, CIUCODACT, CIUDESCRI, CIUUSULTUP, CIUFHULTUP)
VALUES
( 15, 9, '195', 'POZO COLORADO', 'U99ROJAS', '2022-08-01 11:42:07.000');
----------------------------------------------------------------------------------------------------------------
----------------------------Tareas #37073 ALQUILER DE POS - SETIEMBRE
/*Elimina facturas generadas de manera incorrecta*/
Select * from gxopera.factura where FACFECH = '20220902' and factimbr = '15662553' and factnro between 10030031025 and 10030036040;
Delete gxopera.factura where FACFECH = '20220902' and factimbr = '15662553' and factnro between 10030031025 and 10030036040;
/*No se generaron detalles relacionadas*/
Select * from gxopera.factura1 where factimbr = '15662553' and factnro between 10030031025 and 10030036040;
/*El numerador de facturas no fue actualizado en el rango afectado*/
Select * from gxopera.factura2 where FACTURA2TIMBRADO = '15662553' and FACTURA2TIPO = 'NOR';
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------tablas de comercios reing.
SELECT * FROM GXFINDTA.TCMCLI t2 WHERE CLIRUC = '932416-0';
SELECT * FROM GXFINDTA.TCMCLI t2 WHERE CLIDENCOM LIKE '%PETROCHA%'; -- tabla cliente reing.
SELECT * FROM GXFINDTA.TCMCLI t2 WHERE CLICLICOD = 15168;
SELECT * FROM GXFINDTA.TCMSUC t WHERE CLICLICOD = 2905   SUCDENCOM LIKE '%BIGGIE%';--CLICLICOD = 925; --tabla de sucursales relacion con tabla de cliente.
SELECT * FROM GXFINDTA.TCMSUC t WHERE CLICLICOD = 6268;
SELECT * FROM GXFINDTA.TCOCNA t WHERE COCOMER = '8000002';---tabla de relación actual y reing.
select * from gxfindta.tcocna where cliclicod = 17979
SELECT * FROM GXFINDTA.TCOCNA WHERE CNADENCOM LIKE '%BANCO RIO%';
SELECT * FROM gxfindta.TCMSUC t WHERE SUCFECALT = '20220914';
WHERE CLICLICOD=13110 AND SUCSUCCOD=1 AND COCOMER='8602540';
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
select * from cliente where ClienteCodigo ='10937-1';
SELECT CLICLICOD, CLIRUC, CLIDENCOM, CLIRAZSOC FROM GXFINDTA.TCMCLI WHERE CLICLICOD = 126 ORDER BY CLICLICOD  FOR FETCH ONLY
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----- Logs alta sucursal
SELECT b.SPRIDSEG, b.SDPSECUE, b.SDPDSPROCE , b.SDPFH FROM GXTRJDTA.TDSSPR a INNER JOIN GXTRJDTA.TDSSDP b
ON a.SPRIDSEG = b.SPRIDSEG
WHERE a.PRCIDPROCE = 'PCM026'
ORDER BY a.SPRFECHA DESC ;

SELECT * FROM gxtrjdta.TDSPrc WHERE PRCIDPROCE = 'PCM026'; -- PROCESOS
SELECT * FROM gxtrjdta.TDSSPR WHERE PRCIDPROCE = 'PCM026'  ORDER BY SPRIDSEG desc;-- CABECERA LOG
SELECT * FROM GXTRJDTA.TDSSDP WHERE SPRIDSEG  = 2069629; -- DETALLE LOG
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*Cambio de cuenta*/ --ADNUMCTA=cuenta credito
select * from gxbdbps.comaeaf where COCOMER ='8000002' and 
and ADNUMCTA = '0626103507'

update gxbdbps.comaeaf set ADNUMCTA ='0626103507' where COCOMER ='0703051'
and ADNUMCTA = '10082480006'

SELECT * FROM  GXFINDTA.tcmliq where CLICLICOD ='13535'

update GXFINDTA.tcmliq set LIQNROCUE ='6328722116' where CLICLICOD ='13535'

SELECT * FROM GXFINDTA.TCOCNA t WHERE COCOMER = '0701588';---tabla de relación actual y reing.
----sistema actual
SELECT * FROM gxbdbps.comaeaf c WHERE c.COCOMER in ('0801697', '0801698', '0802106');

SELECT c.ADNUMCTA, c.COCOMER, c.CODENO FROM gxbdbps.comaeaf c WHERE c.COCOMER in ('0801697', '0801698', '0802106');
UPDATE gxbdbps.comaeaf SET ADNUMCTA ='6328722116' WHERE COCOMER in ('0701635', '8102689', '8602178');
--------------------------------------------------------------------------------------------------------------------------------------------------------
----cambio de cuenta reing. c.debito
SELECT * FROM GXFINDTA.TCLSCT WHERE SERCODI = 'INSMANCRE'
update GXFINDTA.TCLSCT set SCTNRCT ='0101015664' where SERCODI='INSMANCRE'

SELECT * FROM GXFINDTA.TCLTSB --WHERE SERCODI = 'INSMANCRE'
WHERE TSBIDOP IN ('4665177','4665455')

UPDATE GXFINDTA.TCLTSB
   SET TSBCTDE = '0101015664',
       TSBESTA = 'PE'
WHERE TSBIDOP IN ('4665177','4665455')
--------------------------------------------------------------------------------------------------------------------------------------------------------
---cambio de estado de instructivo
SELECT * FROM GXFINDTA.TCLIMC WHERE IMCIDIMC = 7; --cabezera
UPDATE GXFINDTA.TCLIMC SET IMCEST ='P' WHERE IMCIDIMC = 7;

SELECT * FROM GXFINDTA.TCLIMD WHERE IMCIDIMC = 7; ----detalle el 4 es porque esta duplicado la REFERENCING en tcltsb
UPDATE GXFINDTA.TCLIMD SET IMDTRARET =0 WHERE IMCIDIMC = 7;
tclsci
tcoenc--codigo de banco actual
tdgenr--nuemro de cuenta segun el rol
tclcst--servicio-'insmancre'
--fabiana fretes.
--------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
--CAMBIO DE TIPO DE CUENTA
SELECT * FROM  GXFINDTA.tcmliq where CLICLICOD ='13520'

update GXFINDTA.tcmliq set LIQTIPCUE ='CA' where CLICLICOD ='13520'

----------------------
select * from cliente where ClienteCodigo='29-3'
select * from persona where PersonaDocumento='1005399-9'
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--permisos reing
SELECT * FROM GXSEGDTA.TSGUSR where SGUSRID = 'U99ADOLFO'
SELECT * FROM GXSEGDTA.TSGUSR where SGUSRID = 'U99COHENE'
SELECT * FROM GXSEGDTA.TSGARU WHERE SGUSRCOD IN (3826);
SELECT * FROM GXSEGDTA.TSGARU WHERE SGUSRCOD IN (3168);
  
DELETE FROM GXSEGDTA.TSGARU
WHERE SGROLCOD=87 AND SGSISCOD=1 AND SGUSRCOD=3880;

---http://localhost:8080/accesobepsa/servlet/seguridad.

UPDATE GXSEGDTA.TSGFUN
SET SGFUNURLOB=''
WHERE SGFUNCOD=3880 AND SGSISCOD=1;

SELECT * FROM GXSEGDTA.TSGUSR where SGUSRCOD IN (3826, 2942);
select * from gxsegdta.tsgsis where SGSISCOD = '1'

SELECT * FROM GXSEGDTA.TSGARU WHERE SGUSRCOD IN (3826, 2942);

SELECT * FROM GXSEGDTA.TSGROL WHERE SGROLCOD IN (203);

SELECT * FROM GXSEGDTA.TSGROLDT WHERE SGROLCOD = '87' AND SGFUNCOD IN ('1001', '3880')
select * from GXSEGDTA.TSGFUN where SGFUNOBJ like '%WABM004%';
SELECT * FROM GXSEGDTA.TSGARU WHERE SGROLCOD = '87'
SELECT * FROM GXSEGDTA.TSGREX WHERE SGREXUSR IN ('3826','2942')

select * from gxsegdta.tsggen
select * from gxsegdta.tsgusr where SGUSRCOD='3826'
select * from gxsegdta.tsgusre
DELETE FROM GXSEGDTA.TSGFUN
WHERE SGFUNCOD=5273 AND SGSISCOD=1;

INSERT INTO GXSEGDTA.TSGFUN
(SGFUNCOD, SGSISCOD, SGFUNDES, SGFUNOBJ, SGFUNPAD, SGFUNORD, SGFUNVIS, SGFUNFILT, SGFUNTOBJ, SGFUNUSMO, SGFUNFCHMO, SGFUNCPAD, SGFUNURLOB, SGFUNTIPO)VALUES(5273, 1, 'LISTADO DE CORTE                                  ', 'WABM004             ', 'N', 0, 'S', 'S', 'W', 'U99HERNAN ', '2021-06-12 12:06:06.991', 1000, 'http://portal.bepsa.com.py/accesobepsa/servlet/seguridad.', 'I');
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---k2b
select WFTaskEMail, WFTaskName, WFPrcId from wftask where WFTaskEMail = 'Y' 
select * from wftask where WFTaskName like '%Orden de Compra%'
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------portal
SELECT *FROM PORTAL.TPLROL
SELECT *FROM PORTAL.TPLFNC
SELECT *FROM PORTAL.TPLOBJF 
SELECT *FROM PORTAL.TPLURL  
SELECT *FROM PORTAL.TPLFNR 
SELECT *FROM PORTAL.TPLROL Where ROLNOM ='ADMINISTRADOR'
SELECT *FROM PORTAL.TPLFNC
SELECT *FROM PORTAL.TPLOBJF 
SELECT *FROM PORTAL.TPLURL WHERE USERID = 'ADMINISTRA'
SELECT *FROM PORTAL.TPLFNR WHERE ROLID =1
SELECT *FROM LOGIN.TPLMEN WHERE MENUITEMID BETWEEN 1 AND 17
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
