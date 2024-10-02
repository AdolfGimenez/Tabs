select a.lifecredi,a.licomer,a.lifechd,a.lifechh,a.licodtr,a.lifecha,a.licant,a.limonto,a.litiptar,a.linrofac,
b.linro,b.linrofin,b.litipago,b.litidocu,B.lifepco,B.liuser from gxopera.flicom1 a inner join gxopera.flicom b on a.licomer=b.licomer and a.lifechd=b.lifechd 
and a.lifechh=b.lifechh and a.licodtr=b.licodtr where a.licomer IN ('6900002')
and a.lifecredi between '20191120' and '20191220' and b.litipago in('1','3')
and b.litidocu in ('LIQ','INS') and a.licodtr in ('510000','514000','520000','524000','901020','902020')
and a.limonto > 0 order by a.linrofac,a.licant asc;

select * from gxopera.Factura2

update  gxopera.flicom set linro = 0,linrofin = 0 where lifechh between '20191119' and '20191220' and licomer in('6900002')
and licodtr in ('510000','514000','520000','524000','901020','902020');
----
update  gxopera.flicom1 set linrofac = 0 where lifechh between '20191119' and '20191220' and licomer in('6900002')
and licodtr in ('510000','514000','520000','524000','901020','902020');

CREATE INDEX LIBDEBITO.UFACTENTI6
ON LIBDEBITO.FACTENTI (DISPOSIT DESC,
CODTRA ASC);

CREATE INDEX LIBDEBITO.UFACTENTI7
   ON LIBDEBITO.FACTENTI (DISPOSIT desc);
CREATE INDEX LIBDEBITO.UFACTENTI8
   ON LIBDEBITO.FACTENTI (CODRES asc , CODTRA asc,ESTADO asc ,DISPOSIT asc);
CREATE INDEX LIBDEBITO.UFACTENTI9
   ON LIBDEBITO.FACTENTI (DISPOSIT asc, CODTRA asc,CODRES asc);
CREATE INDEX LIBDEBITO.UFACTENTI10
   ON LIBDEBITO.FACTENTI (LENEMI asc,BIN ASC,IDCOMER asc, BINPRO asc); 
CREATE INDEX LIBDEBITO.UFACTENTI11
   ON LIBDEBITO.FACTENTI (DISPOSIT asc,CODRES asc, CODTRA asc);
CREATE INDEX LIBDEBITO.UFACTENTI12
   ON LIBDEBITO.FACTENTI (LENEMI asc,BIN ASC,IDCOMER asc, BINPRO asc,
   CODTRA asc,CODRES asc);
CREATE INDEX LIBDEBITO.UFACTENTI13
   ON LIBDEBITO.FACTENTI (CODRES asc ,ESTADO ASC);
-- Validacion - PTransaccionRefeAcep - RESUMEN GRAL. DE TRANSACCIONES ACEPTADAS
--Factenti
Select LENEMI,BIN,DISPOSIT,CODTRA,SUM(CANTIDAD) AS CANT from libdebito.Factenti Where  
BIN = '703002'	And IDCOMER NOT IN ('8099000','100001')
And substr(BINPRO,7,3)<>'999'	aND substr(CODTRA,1,5) <> '56000' aND CODRES = '00'
group by LENEMI,BIN,DISPOSIT,CODTRA--,CODRES
order by DISPOSIT DESC,CODTRA ASC
--DRCONBEP
SELECT LENEMI,SUBSTRING(LNRTAR, 1, 6) AS BIN ,SUBSTRING(LIDTRA,1,1),LCODTR,count(*)  FROM 
LIBDEBITO.DRCONBEP WHERE LFECTR BETWEEN 20191217 AND 20200122 AND LCRETR = '00'
--AND LIDTRA LIKE 'T%' 
AND SUBSTRING(LCODTR, 1, 2) NOT IN ('03' ,'58','86','96') AND
SUBSTRING(LNRTAR, 1, 6) IN ('703002')
 GROUP BY LENEMI, SUBSTRING(LNRTAR, 1, 6),SUBSTRING(LIDTRA,1,1),LCODTR
 order by SUBSTRING(LIDTRA,1,1) DESC,LCODTR;

Select * from LIBDEBITO.TBCTRA0P where txctrx = '324000'
------------------------------------------------------- Validacion - PTrxBNFCodigRet
Select LENEMI,CODREs,SUM(CANTIDAD),EStado AS CANT --LENEMI,BIN,DISPOSIT,CODTRA,
from libdebito.Factenti Where  LENEMI = '002' And
BIN = '703002'	And IDCOMER NOT IN ('8099000','100001')
And substr(BINPRO,7,3)<>'999'	aND substr(CODTRA,1,5) <> '56000' 
AND CODRES Not In ('03','58','86','96')
--AND EStado ='Q' AND CODRES = '00'
group by LENEMI,CODRES,EStado
order by /*DISPOSIT DESC,*/CODREs ASC;
--DRCONBEP
SELECT LENEMI,LCRETR,lesttr,count(*)  FROM 
LIBdebito.dRCONBEp WHERE LFECTR BETWEEN 20191217 AND 20200122 --AND LCRETR = '00'
AND LCRETR NOT IN ('03' ,'58','86','96')
AND LIDCOM NOT IN ('100001','8099000')
AND SUBSTRING(LNRTAR, 1, 6) IN ('703002') AND SUBSTRING(LNRTAR, 7, 3) Not IN ('999') 
AND LENEMI = '002' and lesttr not in (' ')
GROUP BY LENEMI, LCRETR,lesttr
Order by LCRETR asc;

------------------------------------------------------- Validacion - PTrxBNFCodResumen
-- Factenti - Aprobadas
Select LENEMI,DISPOSIT,SUM(CANTIDAD) as CANT --LENEMI,BIN,DISPOSIT,CODTRA,
from libdebito.Factenti Where  LENEMI = '002' And
BIN = '703002'	And IDCOMER NOT IN ('8099000','100001')
And substr(BINPRO,7,3)<>'999'	aND substr(CODTRA,1,5) <> '56000'
AND CODRES in ('00') 
group by LENEMI,DISPOSIT
order by /*DISPOSIT DESC,*/DISPOSIT DESC;
-- Factenti - RECHAZADAS
Select LENEMI,DISPOSIT,SUM(CANTIDAD) as CANT --LENEMI,BIN,DISPOSIT,CODTRA,
from libdebito.Factenti Where  LENEMI = '002' And
BIN = '703002'	And IDCOMER NOT IN ('8099000','100001')
And substr(BINPRO,7,3)<>'999'	aND substr(CODTRA,1,5) <> '56000' 
AND CODRES Not in ('00','03' ,'58','86','96')
group by LENEMI,DISPOSIT
order by DISPOSIT DESC;
-- Drconbep - Aceptada
SELECT LENEMI,SUBSTRING(LIDTRA,1,1),count(*)  FROM 
LIBPROD.DRCONBE60 WHERE LFECTR BETWEEN 20191217 AND 20200122 --AND LCRETR = '00'
AND LCRETR IN ('00')
AND LIDCOM NOT IN ('100001','8099000')
AND SUBSTRING(LNRTAR, 1, 6) IN ('703002') AND SUBSTRING(LNRTAR, 7, 3) Not IN ('999') 
AND LENEMI = '002'
GROUP BY LENEMI,SUBSTRING(LIDTRA,1,1)--,lesttr
Order by SUBSTRING(LIDTRA,1,1) desc;
-- Drconbep - Rechazadas
SELECT LENEMI,SUBSTRING(LIDTRA,1,1),count(*)  FROM 
LIBPROD.DRCONBE60 WHERE LFECTR BETWEEN 20191217 AND 20200122 --AND LCRETR = '00'
AND LCRETR Not IN ('00','03' ,'58','86','96')
AND LIDCOM NOT IN ('100001','8099000')
AND SUBSTRING(LNRTAR, 1, 6) IN ('703002') 
AND SUBSTRING(LNRTAR, 7, 3) Not IN ('999') AND LENEMI = '002' and substr(lcodtr,1,5) <> '56000'
GROUP BY LENEMI,SUBSTRING(LIDTRA,1,1)--,lesttr
Order by SUBSTRING(LIDTRA,1,1) desc;
------------------------------------------------------- Validacion - PTransaccionRefeRechEnti
Select LENEMI,DISPOSIT,CODTRA,SUM(CANTIDAD) as CANT 
from libdebito.Factenti Where  LENEMI = '002' And
BIN = '627431'	And IDCOMER NOT IN ('8099000','100001')
And substr(BINPRO,7,3)<>'999'	aND substr(CODTRA,1,5) <> '56000'
AND CODRES Not In ('00','03','58','86','96')
group by LENEMI,DISPOSIT,CODTRA
order by DISPOSIT,CODTRA;
-- DRCONBEP 
SELECT LENEMI,substr(lidtra, 1, 1),lcodtr,count(*)  FROM 
LIBPROD.DRCONBE60 WHERE LFECTR BETWEEN 20191217 AND 20200122 --AND LCRETR = '00'
AND LCRETR Not IN ('00','03' ,'58','86','96')
AND LIDCOM NOT IN ('100001','8099000')
AND SUBSTRING(LNRTAR, 1, 6) IN ('627431') 
AND SUBSTRING(LNRTAR, 7, 3) Not IN ('999') AND LENEMI = '002' 
and substr(lcodtr,1,5) <> '56000'
GROUP BY LENEMI,substr(lidtra, 1, 1),lcodtr--,lesttr
Order by substr(lidtra, 1, 1),lcodtr desc;
------------------------------------------------------- Validacion - PTransaccionRefeAcepEnti
Select LENEMI,DISPOSIT,CODTRA,SUM(CANTIDAD) as CANT 
from libdebito.Factenti Where  LENEMI = '002' And
BIN = '627431'	And IDCOMER NOT IN ('8099000','100001')
And substr(BINPRO,7,3)<>'999'	aND substr(CODTRA,1,5) <> '56000'
--AND CODRES Not In ('00','03','58','86','96')
AND CODRES In ('00')
group by LENEMI,DISPOSIT,CODTRA
order by DISPOSIT,CODTRA;
-- DRCONBEP
SELECT LENEMI,substr(lidtra, 1, 1),lcodtr,count(*)  FROM 
LIBPROD.DRCONBE60 WHERE LFECTR BETWEEN 20191217 AND 20200122 --AND LCRETR = '00'
AND LCRETR  IN ('00')--,'03' ,'58','86','96')
AND LIDCOM NOT IN ('100001','8099000')
AND SUBSTRING(LNRTAR, 1, 6) IN ('627431') 
AND SUBSTRING(LNRTAR, 7, 3) Not IN ('999') AND LENEMI = '002' 
and substr(lcodtr,1,5) <> '56000'
GROUP BY LENEMI,substr(lidtra, 1, 1),lcodtr--,lesttr
Order by substr(lidtra, 1, 1),lcodtr desc;

------------------------------------------------------- Validacion - PTrxEntiCodMovi2
Select LENEMI,CODRES,CODTRA,ESTADO,SUM(CANTIDAD) as CANT 
from libdebito.Factenti Where  LENEMI = '002' And
BIN = '627431'	And IDCOMER NOT IN ('100001') --'8099000'
And substr(BINPRO,7,3)<>'999'	aND substr(CODTRA,1,5) <> '56000'
AND CODRES Not In ('03','58','86','96')
group by LENEMI,CODRES,CODTRA,ESTADO
order by CODRES,CODTRA;

------------------------------------------------------- Validacion - PTrxEntiCodResumen
--Aprob
Select LENEMI,DISPOSIT,SUM(CANTIDAD) as CANT 
from libdebito.Factenti Where  LENEMI = '002' And
BIN = '627431'	And IDCOMER NOT IN ('100001') --'8099000'
And substr(BINPRO,7,3)<>'999'	aND substr(CODTRA,1,5) <> '56000'
AND CODRES In ('00')
group by LENEMI,DISPOSIT
order by LENEMI,DISPOSIT;
--Rech
Select LENEMI,DISPOSIT,SUM(CANTIDAD) as CANT 
from libdebito.Factenti Where  LENEMI = '002' And
BIN = '627431'	And IDCOMER NOT IN ('100001') --'8099000'
And substr(BINPRO,7,3)<>'999'	aND substr(CODTRA,1,5) <> '56000'
AND CODRES Not In ('00','03','58','86','96')
group by LENEMI,DISPOSIT
order by LENEMI,DISPOSIT;
------------------------------------------------------- Validacion - PTransaccionRefeRech - RESUMEN GRAL. DE TRANSACCIONES RECHAZADAS
-- Factenti
Select LENEMI,DISPOSIT,CODTRA,SUM(CANTIDAD) as CANT 
from libdebito.Factenti Where CODRES Not In ('00','03','58','86','96')
and IDCOMER Not In ('100001','8099000')
And LENEMI = '002'
And Bin in ('703002')
And substr(BINPRO,7,3) Not in ('999')
group by LENEMI,DISPOSIT,CODTRA
order by DISPOSIT DESC ,CODTRA ASC;
-- DRCONBEP
SELECT LENEMI,substr(lidtra, 1, 1),lcodtr,count(*)  FROM 
LIBPROD.DRCONBE60 WHERE LFECTR BETWEEN 20191217 AND 20200122 
AND LCRETR  NOT IN ('00','03' ,'58','86','96')
AND LIDCOM NOT IN ('100001','8099000')
AND SUBSTRING(LNRTAR, 1, 6) IN ('703002') 
AND SUBSTRING(LNRTAR, 7, 3) Not IN ('999') 
AND LENEMI = '002' 
GROUP BY LENEMI,substr(lidtra, 1, 1),lcodtr--,lesttr
Order by substr(lidtra, 1, 1) desc,lcodtr asc;



UPDATE LIBDEBITO.FACTENTI SET LENEMI = '510', LBCOCR = '510' WHERE LENEMI = '500' AND LBCOCR = '500' AND DISPOSIT = 'T' 
AND ESTADO = 'A' AND (SUBSTR(CODTRA,1,2) <> '31' and SUBSTR(CODTRA,1,2) <> '30') and BIN IN (SELECT PBIN FROM LIBDEBITO.TBINPROC where PTIPPROC = 'PRO' AND PMARCTAR = 'VSA') 
and BIN IN ('425935','42936','443076');

select * from gxopera. where lifechd like '20200309' --and liuser = 'u99javier'


--tabla para recuperar numeros de cuentas contables, para pruebas
select * from GXOPERA.FPLACTA


select * from gxopera.factura where factnro = '10030039811' and facvenc = '20200402'

select * from gxopera.factura where facvenc = '20200401'

select * from gxopera.factura where factnro = '10030039813' --and facvenc = '20200402'


--redmine 5287, Validar doc. para el Sistema de Tarjeta - #632

select * from gxweb.gxlousu where usucod = 2873

select * from gxweb.gxloper where usucod = 2873

select * from gxweb.gxloperdet where usucod = 2873

--testing 5623, TARJETA DE DEBITO AGRUPADO POR ESTADO
select sum(akaicd) as Cantidad from
GXBDBPS.DRMAEAF                                           
where  AKAICD <> '' and AKAICD <> 'º0' and AKENTI = '107' 
and AKAICD not in ( select ESCODI from GXDEBITO.TGESTAAF) 
group by  akaicd

--testing 5608, REPORTE DE USUARIOS POR ROL

select * from gxweb.gxlousu where TUSRID = 

select * from gxweb.tipusr

SELECT * FROM GXBDBPS.TMOVIAF WHERE MVSECUE > '007944213597' AND CMCODIG = '185' AND MVEMISO = '021'

DELETE FROM GXBDBPS.TMOVIAF WHERE MVSECUE = '007944213597'

select * from libdebito.drconbep

--testing 5623, validar doc. para el sistema bepsa info

--para verificar bines en sistema
select akadcd,count(*) from gxbdbps.drmaeaf where akenti = '107' group by akadcd

select * from gxbdbps.tdbin-- where tdbinpro = '607431'

select * from gxbdbps.drmaeaf where akenti = '107' and akadcd  = '607431' and akaqtx = 'FIDELINA ZARZA'

select * from gxbdbps.drmaeaf where akenti = '107' and akaqtx = 'FIDELINA ZARZA'

--DATOS ORIGINALES DE LA TARJERA--
UPDATE GXBDBPS.DRMAEAF
   SET AKAGCD = '00',
       AKAICD = '01',
       AKAQTX = 'FIDELINA ZARZA      ',
       AKAFNB = 1909,
       AKARTX = '    ',
       AKAGNB = 999999,
       AKAHCD = '001 ',
       AKAENB = 4544308,
       AKABDA = '20140916',
       AKACDA = '00010101',
       AKADDA = '00010101',
       AKAEDA = '20060106',
       AKA5TX = '121',
       AKAQCD = '0',
       AKNOM1 = 'FIDELINA       ',
       AKNOM2 = '               ',
       AKAPE1 = 'ZARZA DIAZ     ',
       AKAPE2 = '               ',
       AKDIRE = 'SAN ANTONIA BARRIO ACHUCARRO  ',
       AKTELE = '0971373068     ',
       AKENTE = '   '
WHERE AKENTI = '107'
AND   AKADCD = '607431'
AND   AKACNB = 1070000004;

drconbep

--redmine 

select MARCA,sum(cantidad),SUBSTR(CODTRA,1,2) As COD_TRA from libdebito.factenti 
where LENEMI = '510'
and DISPOSIT = 'T' 
and (SUBSTR(CODTRA,1,2) = '31' or  SUBSTR(CODTRA,1,2) = '30')
and BIN not in ('425935','425936','443076')
and CODRES <> '03' 
group by  MARCA,SUBSTR(CODTRA,1,2); -- 25.432

OTROS SERVICIOS
select MARCA,sum(cantidad),SUBSTR(CODTRA,1,2) from libdebito.factenti  where  LENEMI IN ('510')
  AND DISPOSIT = 'T'
  AND SUBSTR(CODTRA,1,2) NOT IN('31' ,'30')
  AND BIN <> '425935' and BIN <> '425936' and BIN <> '443076'
  AND CODRES <> '00' and CODRES <> '03'
  group by  MARCA,SUBSTR(CODTRA,1,2); -- 29.906
  
SELECT * FROM LIBDEBITO.TDCRET0P
  
    SELECT count(*) FROM libdebito.DRCONBEP where lfectr between 20200301 and 20200331;
    

    SELECT count(*) FROM yapi.DRCONBEP where lfectr between 20200301 and 20200331;

--redmine #6250 y #6037, ENVIO DE RETENCIONES FACTURACION EVO2
--crear campo en retcom
ALTER TABLE gxopera.RETCOM ADD COLUMN RETFECHEM CHAR(10)

select * from gxopera.flicom wher

select * from gxopera.retcom where retfech like '%2020-03-31%'

SELECT * FROM GXOPERA.FACTURA2

select * from gxopera.retcom

delete from gxopera.retcom where retfech like '%2020-03-31%'

--redmine #6233 - Validar doc. para la auditoria de las tablas y envio de correo como notificacion

select * from virgililib.tstaud

--creacion de la tabla en ambiente de testing
CREATE TABLE gxbdbps.TSTAUD
(
   AUDID       DECIMAL(10)    NOT NULL  , --GENERATED BY DEFAULT AS IDENTITY ( START WITH 1, INCREMENT BY 1 )
   AUDTABLA    VARCHAR(50)    NOT NULL,
   AUDTABLADE  VARCHAR(70)    NOT NULL,
   AUDFECHA    CHAR(8)        NOT NULL,
   AUDHORA     CHAR(8)        NOT NULL,
   AUDSTATU    CHAR(3)        NOT NULL,
   AUDTPCLA    CHAR(1)        NOT NULL,
   AUDCLAV1    VARCHAR(50)    NOT NULL,
   AUDCLAV2    VARCHAR(50)    NOT NULL,
   AUDCLAV3    VARCHAR(50)    NOT NULL,
   AUDCLAV4    VARCHAR(50)    NOT NULL,
   AUDCLAV5    VARCHAR(50)    NOT NULL,
   AUDCLAV6    VARCHAR(50)    NOT NULL,
   AUDCLAV7    VARCHAR(50)    NOT NULL,
   AUDCLAV8    VARCHAR(50)    NOT NULL,
   AUDCAMOD    VARCHAR(20)    NOT NULL,
   AUDCAMODDE  VARCHAR(50)    NOT NULL,
   AUDVALAN    VARCHAR(250)   NOT NULL,
   AUDVALAC    VARCHAR(250)   NOT NULL,
   AUDUSER     VARCHAR(10)    NOT NULL
);

select * from gxbdbps.tstaud

CREATE INDEX bxbdbps.UTSTAUD3					
   ON bxbdbps.TSTAUD (AUDFECHA	DESC,AUDUSER	DESC,AUDTABLA	DESC,AUDCLAV1	DESC,AUDCLAV2	DESC);
   
select * from bxbdbps.UTSTAUD3

select * from gxbdbps.STMPM

select * from gxbdbps.tsthco

select * from cierrelib.gustraf where 

select * from gxdbcon.gxlofun

UPDATE CIERRELIB.GCONTRP
   SET COTIPC = '*NORMAL '
WHERE COCODI = '001';

select AUDTABLADE MODULO, AUDFECHA FECHA, AUDHORA HORA, AUDCAMODDE CAMPO_MODIF, AUDVALAN ANTERIOR, AUDVALAC ACTUALIZADO, AUDUSER USUARIO from gxbdbps.tstaud where audfecha = '20200811' order by audhora desc



select * from gxbdcon.gxlousu where usucod = '777'

select * from cierrelib.gtranaf

CREATE INDEX GXOPERA.UFACTURA1 ON GXOPERA.Factura (FACTIPO, FACSTATUS, FACSALDO , FACVENC )

INSERT INTO cierrelib.GTRANAF
(
  TRCODIG,
  TRDESCR,
  TRNOMBR,
  TRTIPOP,
  TRNIVEL,
  TRTIPOT,
  TRPARAM
)
VALUES
(
  'C903',
  'CONSULTA AUDITORIA            ',
  'WWSTC001  ',
  1,
  50,
  'T',
  '                    '
);

"insert into roshkalib/M_UBICACIONES " +
            "(CODIGO_UBICACION, DENOMINACION, DIRECCION, TELEFONO, LOCALIDAD, ESTADO_COMERCIO, GEOLOCALIZACION, LATITUD, LONGITUD,"+
            "RUBRO_ID, FECHA_INICIO_PROMO, FECHA_FIN_PROMO, DESCRIPCION_PROMO)" +
            "VALUES ('"+&gcocomer+"','"+&gCODENO+"','"+&gcodire1+"','"+&gcoteln+"','"+&gLOCODI+"',"+str(&gcostat)+",'"+&GLOCALIZAC+"',"+&lati+","+&longi+",'"+substr(&gcocomer,1,2)+"','"+&fechar1+"','"+&fechar2+"','"+trim(&GPROMO)+"')"


select * from gxbdbps.tcodpp;

select * from gxweb.drcon180 where ALIDCOM = '0701092' and ALFECTR between '20200901' and '20200930';

select lcodtr from libprod.drconbe60 where LERRNB = '026802229927';

select * from libprod.drconbe60 where lcodtr <> '000072' and lcodbc = 'BIL' and lenemi = '591';

select lidcom COMERCIO, lfectr FECHA_TRX, lhortr HORA_TRX, limpgs IMPORTE, lcodtr COD_TRX, lcodbc PRODUCTO, lcautr COD_AUT, lerrnb NUM_REF_TRX, lcotel NUMERO_TEL, lcretr COD_RETORNO, lesttr ESTADO_TRX from libprod.drconbe60 where lcodtr = '000072' and lcodbc = 'BIL' and lenemi = '591' and lfectr between '20200915' and '20200925'
and lidcom = '0701092' and lcretr = '00' and lesttr = 'A';

UPDATE GXWEB.FLICOM1
   SET LINROFAC = 10020050867
WHERE LICOMER = '0701542' AND   LIFECHD = '20201125'
AND   LIFECHH = '20201125' AND   LICODTR = '000054'
AND   LIFECHA = '20201124' AND   LITIPTAR = 'DEB'
AND   LICANT = 1 AND   LIMONTO = 45100.00
AND   LICOENT = 302.00 AND   LIIVAENT = 30.00
AND   LICOBPS = 149.00 AND   LIIVABPS = 15.00
AND   LIRENTA = 0.00 AND   LIREIVA = 0.00
AND   LINETO = 44604.00 AND   LINROINS = 0
AND   LIFECREDI = '20201126' AND   LINROFAC = 0;

-------------------------
-------------------------
--CASO URGENTE CONTAWEB--
-------------------------
-------------------------
select lfcotr from virgililib.DRCONBEP group by lfcotr;
select * from libdebito.tbinproc where pbin = '530772';

SELECT * from gxopera.OPMCATM
WHERE CAFECHA between '20210201' and '20210230'
AND CACODAD = '087'
AND CAMARCA = 'MST'
AND CAPROCE = '530'
AND CAENEMI <> '087'
AND CACOMER IN (9099414,9099416,9099416,9099416,9099472,9099475,9099482)
--= 9099416
--AND CATARJE = 530772
--group by CATARJE,CACOMER,CAENEMI,CAPROCE,CACODAD
ORDER BY CATARJE,CACOMER,CAENEMI,CAPROCE,CACODAD;

--proceso RPG que es agendado para cargar datos en OPMCATM
ncop010r

--caso de reportes de comisiones para lsanchez

select count (*)from gxopera.opmcatm where cafecha = '20200610'

select cafecha, cacotiz from yapi.opmcatm where cafecha = 20200601
--and '20200630' group by cafecha

delete from gxopera.opmcatm where cafecha between 20201101 and 20201131

select count(*) from gxopera.opmcatm where cafecha = '20210201'
n
select cafecha, cacotiz from gxopera.opmcatm group by cafecha 

select count(*), lfectr from libdebito.drconbep where lfectr > '20200101' group by lfectr order by lfectr desc

select cafecha, count (*) from gxopera.opmcatm where cafecha >= 20200101 order by cafecha

select * from gxopera.opmcatm where cafecha between '20200101'

delete from gxopera.opmcatm where cafecha;

[14:09] Mariano Virgili Franco
    
SELECT CAFECHA,CACOMER, CAPROCE, CATARJE,CAIMPOR,COUNT(*) from gxopera.OPMCATM
WHERE CAFECHA = '20210201'
AND CACODAD = '087'
AND CAMARCA = 'MST'
AND CAPROCE = '530'
AND CAENEMI <> '087'
AND CACOMER = 9099416
--AND CATARJE = 530772
GROUP BY CAFECHA,CACOMER, CAPROCE, CATARJE,CAIMPOR
ORDER BY CAFECHA,CACOMER, CAPROCE, CATARJE,CAIMPOR;

SELECT * from gxopera.OPMCATM
WHERE CAFECHA = '20210201'
AND CACODAD = '087'
AND CAMARCA = 'MST'
AND CAPROCE = '530'
AND CAENEMI <> '087'
--AND CACOMER IN (9099414,9099416,9099416,9099416,9099472,9099475,9099482)
AND CACOMER = 9099416
AND CATARJE = 530772
--group by CATARJE,CACOMER,CAENEMI,CAPROCE,CACODAD
ORDER BY CATARJE,CACOMER,CAENEMI,CAPROCE,CACODAD;


--#ayuda caso portal
select * from GXWEB.GXLOUSU WHERE USUAID = '4842196';

SELECT * FROM GXWEB.GXLOUSUDET WHERE USUCOD = '2875';
INSERT INTO GXWEB.GXLOUSUDET (USUCOD,COCOMER,CORUCN) 
VALUES
(  2875,'1001091',' '),
(  2875,'1001092',' '),
(  2875,'1001098',' '),
(  2875,'1001104',' '),
(  2875,'1001105',' '),
(  2875,'1001106',' '),
(  2875,'1001107',' '),
(  2875,'1001108',' '),
(  2875,'1001109',' '),
(  2875,'1001110',' '),
(  2875,'1001111',' '),
(  2875,'1001112',' '),
(  2875,'1001113',' '),
(  2875,'1001114',' '),
(  2875,'1001130',' '),
(  2875,'1001131',' '),
(  2875,'1001132',' '),
(  2875,'1001134',' '),
(  2875,'1001135',' '),
(  2875,'1001136',' '),
(  2875,'1001151',' '),
(  2875,'1001152',' '),
(  2875,'1001153',' '),
(  2875,'1001175',' '),
(  2875,'1001178',' '),
(  2875,'1001179',' '),
(  2875,'1001180',' '),
(  2875,'1001181',' '),
(  2875,'1001182',' '),
(  2875,'1001183',' '),
(  2875,'1001189',' '),
(  2875,'1001190',' '),
(  2875,'1001206',' '),
(  2875,'1001207',' '),
(  2875,'1001208',' '),
(  2875,'1001209',' '),
(  2875,'1001215',' '),
(  2875,'1001216',' '),
(  2875,'1001217',' '),
(  2875,'1001232',' '),
(  2875,'1001276',' '),
(  2875,'1001277',' '),
(  2875,'1001278',' '),
(  2875,'1001279',' '),
(  2875,'1001280',' '),
(  2875,'1001282',' '),
(  2875,'1001283',' '),
(  2875,'1001284',' '),
(  2875,'1001285',' '),
(  2875,'1001286',' '),
(  2875,'1001287',' '),
(  2875,'1001311',' '),
(  2875,'1001312',' '),
(  2875,'1001365',' '),
(  2875,'1001366',' '),
(  2875,'1001367',' '),
(  2875,'1001368',' '),
(  2875,'1001369',' '),
(  2875,'1001370',' '),
(  2875,'1001371',' '),
(  2875,'1001372',' '),
(  2875,'1001383',' '),
(  2875,'1001384',' '),
(  2875,'1001385',' '),
(  2875,'1001386',' '),
(  2875,'1001387',' '),
(  2875,'1001394',' '),
(  2875,'1001395',' '),
(  2875,'1001396',' '),
(  2875,'1001397',' '),
(  2875,'1001398',' '),
(  2875,'1001399',' '),
(  2875,'1001400',' '),
(  2875,'1001401',' '),
(  2875,'1001419',' '),
(  2875,'1001420',' '),
(  2875,'1001421',' '),
(  2875,'1001422',' '),
(  2875,'1001423',' '),
(  2875,'1001436',' '),
(  2875,'1001437',' '),
(  2875,'1001438',' '),
(  2875,'1001439',' '),
(  2875,'1001443',' '),
(  2875,'1001444',' '),
(  2875,'1001445',' '),
(  2875,'1001449',' '),
(  2875,'1001450',' '),
(  2875,'1001457',' '),
(  2875,'1001477',' '),
(  2875,'1001478',' '),
(  2875,'1001489',' '),
(  2875,'1001490',' '),
(  2875,'1001491',' '),
(  2875,'1001492',' '),
(  2875,'1001493',' '),
(  2875,'1001508',' '),
(  2875,'1001509',' '),
(  2875,'1001510',' '),
(  2875,'1001511',' '),
(  2875,'1001512',' '),
(  2875,'1001531',' '),
(  2875,'1001532',' '),
(  2875,'1001547',' '),
(  2875,'1001551',' '),
(  2875,'1001552',' '),
(  2875,'1001556',' '),
(  2875,'1001557',' '),
(  2875,'1001558',' '),
(  2875,'1001559',' '),
(  2875,'1001583',' '),
(  2875,'1001584',' '),
(  2875,'1001585',' '),
(  2875,'1001586',' '),
(  2875,'1001600',' '),
(  2875,'1001601',' '),
(  2875,'1001602',' '),
(  2875,'1001619',' '),
(  2875,'1001628',' '),
(  2875,'1001630',' '),
(  2875,'1001631',' '),
(  2875,'1001632',' '),
(  2875,'1001645',' '),
(  2875,'1001646',' '),
(  2875,'1001647',' '),
(  2875,'1001648',' '),
(  2875,'1001649',' '),
(  2875,'1001650',' '),
(  2875,'1001651',' '),
(  2875,'1001652',' '),
(  2875,'1001675',' '),
(  2875,'1001676',' '),
(  2875,'1001677',' '),
(  2875,'1001678',' '),
(  2875,'1001679',' '),
(  2875,'1001680',' '),
(  2875,'1001681',' '),
(  2875,'1001682',' '),
(  2875,'1001683',' '),
(  2875,'1001684',' '),
(  2875,'1001685',' '),
(  2875,'1001686',' '),
(  2875,'1001687',' '),
(  2875,'1001695',' '),
(  2875,'1001697',' '),
(  2875,'1001698',' '),
(  2875,'1001700',' '),
(  2875,'1001707',' '),
(  2875,'1001721',' '),
(  2875,'1001722',' '),
(  2875,'1001727',' '),
(  2875,'1001728',' '),
(  2875,'1001729',' '),
(  2875,'1001730',' '),
(  2875,'1001731',' '),
(  2875,'1001732',' '),
(  2875,'1001733',' '),
(  2875,'1001734',' '),
(  2875,'1001735',' '),
(  2875,'1001736',' '),
(  2875,'1001750',' '),
(  2875,'1001751',' '),
(  2875,'1001752',' '),
(  2875,'1001753',' '),
(  2875,'1001754',' '),
(  2875,'1001755',' '),
(  2875,'1001756',' '),
(  2875,'1001757',' '),
(  2875,'1001758',' '),
(  2875,'1001759',' '),
(  2875,'1001760',' '),
(  2875,'1001763',' '),
(  2875,'1001764',' '),
(  2875,'1001765',' '),
(  2875,'1001766',' '),
(  2875,'1001767',' '),
(  2875,'1001768',' '),
(  2875,'1001769',' '),
(  2875,'1001770',' '),
(  2875,'1001771',' '),
(  2875,'1001772',' '),
(  2875,'1001773',' '),
(  2875,'1001774',' '),
(  2875,'1001775',' '),
(  2875,'1001776',' '),
(  2875,'1001777',' '),
(  2875,'1001799',' '),
(  2875,'1001800',' '),
(  2875,'1001801',' '),
(  2875,'1001802',' '),
(  2875,'1001803',' '),
(  2875,'1001804',' '),
(  2875,'1001805',' '),
(  2875,'1001814',' '),
(  2875,'1001815',' '),
(  2875,'1001816',' '),
(  2875,'1001817',' '),
(  2875,'1001818',' '),
(  2875,'1001819',' '),
(  2875,'1001820',' '),
(  2875,'1001821',' '),
(  2875,'1001822',' '),
(  2875,'1001851',' '),
(  2875,'1001852',' '),
(  2875,'1001853',' '),
(  2875,'1001854',' '),
(  2875,'1001855',' '),
(  2875,'1001856',' '),
(  2875,'1001874',' '),
(  2875,'1001875',' '),
(  2875,'1001876',' '),
(  2875,'1001877',' '),
(  2875,'1001878',' '),
(  2875,'1001928',' '),
(  2875,'1001929',' '),
(  2875,'1001930',' '),
(  2875,'1001931',' '),
(  2875,'1001932',' '),
(  2875,'1001942',' '),
(  2875,'1001943',' '),
(  2875,'1001944',' '),
(  2875,'1001945',' '),
(  2875,'1001946',' '),
(  2875,'1001947',' '),
(  2875,'1001948',' '),
(  2875,'1001949',' '),
(  2875,'1001950',' '),
(  2875,'1001961',' '),
(  2875,'1001962',' '),
(  2875,'1001963',' '),
(  2875,'1001964',' '),
(  2875,'1001965',' '),
(  2875,'1001966',' '),
(  2875,'1001967',' '),
(  2875,'1001968',' '),
(  2875,'1001969',' '),
(  2875,'1001998',' '),
(  2875,'1001999',' '),
(  2875,'1002000',' '),
(  2875,'1002001',' '),
(  2875,'1002002',' '),
(  2875,'1002003',' '),
(  2875,'1002004',' '),
(  2875,'1002005',' '),
(  2875,'1002006',' '),
(  2875,'1002007',' '),
(  2875,'1002028',' '),
(  2875,'1002029',' '),
(  2875,'1002030',' '),
(  2875,'1002031',' '),
(  2875,'1002032',' '),
(  2875,'1002033',' '),
(  2875,'1002070',' '),
(  2875,'1002071',' '),
(  2875,'1002072',' '),
(  2875,'1002073',' '),
(  2875,'1002074',' '),
(  2875,'1002075',' '),
(  2875,'1002076',' '),
(  2875,'1002077',' '),
(  2875,'1002078',' '),
(  2875,'1002079',' '),
(  2875,'1002122',' '),
(  2875,'1002123',' '),
(  2875,'1002124',' '),
(  2875,'1002125',' '),
(  2875,'1002126',' '),
(  2875,'1002127',' '),
(  2875,'1002128',' '),
(  2875,'1002129',' '),
(  2875,'1002130',' '),
(  2875,'1002131',' '),
(  2875,'1002154',' '),
(  2875,'1002155',' '),
(  2875,'1002156',' '),
(  2875,'1002157',' '),
(  2875,'1000210',' '),
(  2875,'1000211',' '),
(  2875,'1000224',' '),
(  2875,'1000383',' '),
(  2875,'1000539',' '),
(  2875,'1000572',' '),
(  2875,'1000680',' '),
(  2875,'1000681',' '),
(  2875,'1000682',' '),
(  2875,'1000683',' '),
(  2875,'1000684',' '),
(  2875,'1000685',' '),
(  2875,'1000717',' '),
(  2875,'1000718',' '),
(  2875,'1000737',' '),
(  2875,'1000738',' '),
(  2875,'1000739',' '),
(  2875,'1000790',' '),
(  2875,'1000791',' '),
(  2875,'1000808',' '),
(  2875,'1000816',' '),
(  2875,'1000819',' '),
(  2875,'1000835',' '),
(  2875,'1000836',' '),
(  2875,'1000837',' '),
(  2875,'1000848',' '),
(  2875,'1000856',' '),
(  2875,'1000857',' '),
(  2875,'1000861',' '),
(  2875,'1000866',' '),
(  2875,'1000867',' '),
(  2875,'1000873',' '),
(  2875,'1000896',' '),
(  2875,'1000916',' '),
(  2875,'1000941',' '),
(  2875,'1000953',' '),
(  2875,'1000964',' '),
(  2875,'1000965',' '),
(  2875,'1000966',' '),
(  2875,'1000967',' '),
(  2875,'1000969',' '),
(  2875,'1000987',' '),
(  2875,'1000993',' '),
(  2875,'1000995',' '),
(  2875,'1000998',' '),
(  2875,'1001001',' '),
(  2875,'1001002',' '),
(  2875,'1001003',' '),
(  2875,'1001004',' '),
(  2875,'1001005',' '),
(  2875,'1001017',' '),
(  2875,'1001018',' '),
(  2875,'1001019',' '),
(  2875,'1001020',' '),
(  2875,'1001024',' '),
(  2875,'1001032',' '),
(  2875,'1001033',' '),
(  2875,'1001034',' '),
(  2875,'1001035',' '),
(  2875,'1001036',' '),
(  2875,'1001039',' '),
(  2875,'1001053',' '),
(  2875,'1001054',' '),
(  2875,'1001061',' '),
(  2875,'1001062',' '),
(  2875,'1001070',' '),
(  2875,'1001071',' '),
(  2875,'1001076',' '),
(  2875,'1001077',' '),
(  2875,'1001090',' '),
(  2875,'1002158',' '),
(  2875,'1002159',' '),
(  2875,'1002160',' '),
(  2875,'1002161',' '),
(  2875,'1002187',' '),
(  2875,'1002188',' '),
(  2875,'1002189',' '),
(  2875,'1002190',' '),
(  2875,'1002191',' '),
(  2875,'1002192',' '),
(  2875,'1002193',' '),
(  2875,'1002194',' '),
(  2875,'1002195',' '),
(  2875,'1002196',' '),
(  2875,'1002197',' '),
(  2875,'1002237',' '),
(  2875,'1002238',' '),
(  2875,'1002240',' '),
(  2875,'1002241',' '),
(  2875,'1002242',' '),
(  2875,'1002243',' '),
(  2875,'1002244',' '),
(  2875,'1002245',' '),
(  2875,'1002246',' '),
(  2875,'1002247',' '),
(  2875,'1002248',' '),
(  2875,'1002249',' '),
(  2875,'1002250',' '),
(  2875,'1002251',' '),
(  2875,'8101218',' '),
(  2875,'8101219',' '),
(  2875,'8600652',' '),
(  2875,'8600653',' ');

