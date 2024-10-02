/*DIFERENCIAS BNF 20180201*/
/*Compensaciones BNF - 30/01/2018*/
Select lfcotr,sum(limpgs)Monto, eneadm from libdebito.drconbeP where  lfcotr = '20171228' and lesttr = 'A' and lcretr = '00' and substr(lidtra,1,1) = 'T' 
and lcodtr in ('011000','012000') and eneadm = '002' and lenemi = '002' GROUP BY eneadm, lfcotr order by lfcotr; --Tarjeta BNF en Cajeros BNF

--Tarjeta BNF en Otras Entidades
Select lfcotr,lenemi,sum(limpgs)Monto from libdebito.drconbep where  lfcotr = '20180130' and lesttr = 'A' and lcretr = '00' and substr(lidtra,1,1) = 'T' 
and lcodtr in ('011000','012000') and eneadm <> '002' and lenemi = '002' and limpgs > 0 GROUP BY lenemi, lfcotr order by lfcotr; 

Select LERRNB , lfcotr,lcodtr,lcored,substr(lidtra,1,1),sum(limpgs)Monto from libdebito.drconbep where  lfcotr = '20180130' and lesttr = 'A' and lcretr = '00' and substr(lidtra,1,1) <> 'T' 
 and lenemi = '002' and eneadm <> '002' and limpgs > 0 GROUP BY LERRNB,lenemi,lcodtr, lfcotr, lcored,substr(lidtra,1,1)  -- Transacciones POS y M-pos (geopagos)
UNION
Select LERRNB, lfcotr,lcodtr,lcored,substr(lidtra,1,1),sum(limpgs)Monto from libdebito.drconbep where  lfcotr = '20180130' and lesttr = 'A' and lcretr = '00' and substr(lidtra,1,1) = 'T' 
 and lenemi = '002' and limpgs > 0 and lcodtr in ('901020','902020','530002') GROUP BY LERRNB, lenemi,lcodtr, lfcotr, lcored,substr(lidtra,1,1) order by lcored, lcodtr; --Transacciones Operadoras/ANDE en ATM



/*CABAL*/
SELECT  COUNT(*) CANTIDAD, SUM(LIMPGS) IMPORTE --LFECTR FECHAR,LHORTR HORA, LCODTR CODTRX, SUBSTR(LIDTRA,1,1) DISPOSITIVO, LCRETR RETORNO, LESTTR ESTADO, lcodbc marca, LIMPGS IMPORTE, LCAUTR AUTORIZ, LERRNB REFERENCIA,LIDCOM COMERCIO, LBINPR BIN
from libdebito.drconbep where lfectr between '20171226' and '20180125' AND LCODBC = 'CAB' and  SUBSTR(LIDTRA,1,1) in ('P') AND LCRETR <> '03' 
/*and lidcom <> '0100001'*/ GROUP BY LCODTR,LCRETR, LESTTR
ORDER BY 2  ASC

/*Detalle para Tesorería*/ --CABAL
Select lfectr, lfcotr,lidcom, substr(lidtra,1,1) Origen,lenemi, eneadm, lnrtar, limpgs , lcautr autorizacion
from libdebito.drconbep where  lfCOtr BETWEEN  '20180101' AND '20180124' and lesttr = 'A' and lcretr = '00' 
and lcodtr in ('011000','012000','013000','000052','015000','567101') and  lenemi = '512'
and substr(lidtra,1,1) = 'T'
and SUBSTR(lnrtar, 1, 6)not in ('589657', '604219') --and eneadm = '018'
order by 4,1

/*Transacciones para compensar por entidad*/

Select  COUNT(*),
--lfcotr,lidcom, substr(lidtra,1,1) Origen,lenemi, eneadm, count(*),
 sum(limpgs) 
from libdebito.drconbep where  lfCOtr BETWEEN  '20181021' AND '20181021' and lesttr = 'A' and lcretr = '00' 
and lcodtr in ('011000','012000','013000','000052','015000','567101') and  lenemi = '305' and SUBSTR(lnrtar, 1, 6)not in ('589657', '604219') and substr(lidtra,1,1) = 'T' --and eneadm = '018'
group by lfcotr, lidcom, substr(lidtra,1,1), lenemi, eneadm
order by  eneadm,lfcotr

/*Debe coincidir con select anterior*/
Select *-- sum(recant), SUM(REMONTO) 
from gxopera.oprecle where reenemi = '305' and refech >= '20180101'

SELECT *  from gxopera.oprecle WHERE RECOMER IN ('9099166', '9099133', '9002223', '9099133') AND REFECH IN ('20180115', '20180122', '20180124') AND REENEMI = '888' 
 
select sum(recant),SUM(REMONTO)--, 



/*GLORIA*/
SELECT LIDCOM COMERCIO,LCOMTR DENOMINACION, LFECTR FREAL, LHORTR HORA, LIMPGS IMPORTE, LCAUTR AUTORIZ, LCRETR RETORNO, LESTTR ESTADO, LERRNB REFERENCIA, LCOTEL TELEF
FROM LIBDEBITO.DRCONBEP WHERE LIDCOM = '0701434' AND  LFECTR = '20180102' AND LESTTR = 'R'

/*AND LCODTR = '380000' */ AND LIDCOM = '0701434'

select */* sum(lineto)*/
from gxopera.flicom1 where licomer = '9002342'  and LIFECREDI='20191021'; --AND LIMONTO = '-200000'

SELECT  SUM(OPMONTO),COUNT(*),OPCODTRN
FROM GXOPERA.OPMOVI WHERE /*OPCOMER = '0701434' and */OPLIQDE = '20180827' and opferea<'20190827' AND OPCODTRN IN ('902020','524000','514000','901020')  AND oprador IN ('981') --AND OPMONTO > '0'
GROUP BY OPCODTRN;


00001	00002	OPCODTRN
4560001	21	524000
3406550	288	514000
8522042	60	902020
19984595	1295	901020



GROUP BY OPCOMER
899484
/******************************************/
/*Transacciones en cajeros BNF*/
Select LFECTR FECHA, LENEMI,ENTBINA DESCR, SUM(LIMPGS)
--lfectr,sum(limpgs)Monto, eneadm 
from libdebito.drconbep
INNER JOIN GXOPERA.OPENTID1 ON LENEMI = ENTCODI where  lfcotr = '20180502' and lesttr = 'A' and lcretr = '00' and substr(lidtra,1,1) = 'T' 
and lcodtr in ('011000','012000','013000','015000','567101','567102', /*'902020', '901020',*/ '000052') and eneadm = '002' AND LENEMI NOT IN ( '002', '510', '500', '347', '512')
 GROUP BY LFECTR, LENEMI, ENTBINA; -- eneadm, lfectr order by lfectr;
 


SELECT * FROM GXOPERA.OPENTID WHERE REENTI = '002'
/*Transacciones en cajeros BNF*/
Select -- SUM(LIMPGS)
lfectr,sum(limpgs)Monto, eneadm , LBINPR
from libdebito.drconbep where  lfcotr = '20180102' and lesttr = 'A' and lcretr = '00' and substr(lidtra,1,1) = 'T' 
and lcodtr in ('011000','012000','013000','015000','567101','567102') and eneadm = '002' AND LENEMI NOT IN ('508', '510', '512','002')
GROUP BY eneadm, lfectr, LBINPR order by lfectr;


/*Transacciones de Tarjetas BNF en Otras Entidades*/
Select sum(limpgs)Mont
--lfectr,ENEADM, sum(limpgs)Monto, lenemi 
from libdebito.drconbep where  lfCOtr = '20171228' and lesttr = 'A' and lcretr = '00' and substr(lidtra,1,1) = 'T'
and lcodtr in ('011000','012000') 
and lenemi = '002' and  eneadm <> '002' 
GROUP BY  lfectr, ENEADM, lenemi order by  lfectr;

/*CREDITO BNF*/ NUESTRA TARJETAS EN OTRAS ENTIDADES

Select sum(limpgs)
-- ENEADM, ENTBINA, sum(limpgs)Monto
--lfectr,sum(limpgs)Monto, lenemi 
from libdebito.drconbep INNER JOIN GXOPERA.OPENTID1 ON LENEMI = ENTCODI
 where  lfCOtr = '20171228' and lesttr = 'A' and lcretr = '00' and substr(lidtra,1,1) = 'T' --AND  Substr(lnrtaR,1,9) = '627431002'
and lcodtr in ('011000','012000','013000' ) 
and LENEMI IN ('500', '510', '512')
and  eneadm = '002' 
GROUP BY  ENEADM , ENTBINA





/********************************************************************************************************************/
VERIFICACION DE ANULACION DE INSTRUCTIVO - ITAU
select  * --sum(lineto)
from gxopera.flicom1 where licomer = '6900002' and lifecredi = '20180129'

select  * --sum(lineto)
from gxopera.flicom where licomer = '6900002' and lifechd = '20180126'

select  * --sum(lineto)
from gxopera.flicomanu where licomer = '6900002' and lifechd = '20180126'


select * from gxopera.factura where 
facuser='U99GLORIA' AND FACTNRO=10030015423

select * from contabilid.ccasi19 where  ascous='U99GLORIA' and asfech=190620 and asncom=10030015423

ficlien = '6900002' and factotal = '100000' 
and facfech >= '20180122'

Select * from gxopera.opago1p where  pgfepro = '20180126' and pgimpor = '100000'

where pgentid='004'

select * from libdebito.drconbep where lidcom = '6900002' and asfech='190620'


--Cabecera de Complementario
Select * from gxopera.comples  
where cocomer ='6900002' and complefecom='20180126'


delete from gxopera.comples  
where cocomer ='9099131' and complefecom='20171201'

Select * from gxopera.comples  
where cocomer ='6900002' and complefecom='20171201'

  --Detalle Complementario 
select * from gxopera.complesDetalle
where  cocomer='9099133' and complefepro='20180124' 
and compleaut='586574'

select * from gxopera.complesDetalle
where complefepro='20180124' AND COCOMER = '9099133'

/*
delete from gxopera.complesDetalle
where complefepro='20180119' AND COCOMER = '9099131'*/
 --resumen por entidad
Select * from gxopera.oprecle where removi in  ('XDA','ADP','ADV') and readmin='581'   and refech ='20190715'
and recomer ='9099133'
/*
delete from gxopera.oprecle where removi = 'XDA'  
and recomer ='9099131' and refech ='20171130'*/

Select * from gxopera.oprecle where removi = 'XDA'  
and refech ='20171130' AND REUSER = 'U99ODULIA'
--delete from gxopera.oprecle where removi = 'XDA'  and refech ='20170726'

--Tabla acreditación procesado por el Clearing
Select * from gxopera.opago1p where pgfepro = '20180126' and 
where pgentid='004'

update gxopera.opago1p set pgfecre='20180125'
where pgentid='004'

Select * from gxopera.opago1phis   --Tabla acreditación procesado por el Clearing
where pgfecom >= '20180101'
PGFETRN='20180126' and pgimpor = '100000'
AND pgidusr='U99OVELAR'
pgentid='002'

select * from gxopera.opago1p
select * from gxopera.opago1p
where pgfetrn= '20180119' and pgentid='005'

--delete from gxopera.opago1p
where pgfetrn ='20180119' and pgentid='005'

20171130

--delete from gxopera.oprecle where removi = 'XDA'  and refech ='20180119'
--delete from gxopera.opago1p where pgentid='002' and pgidusr='U99CORDERO'
--delete from gxopera.comples where cocomer ='9099131' and complefecom='20180119'
--delete from gxopera.complesDetalle where complefepro='20170727'

select * from gxopera.oprecle where refech ='20191021' and reenti='305'


/*Transacciones en cajeros BNF*/
Select lfcotr,sum(limpgs)Monto, lenemi,eneadm,substr(leca62,1,4) 
select sum(limpgs)
from libdebito.drconbep where  lfcotr = '20191021' and lesttr = 'A' and lcretr = '00' and substr(lidtra,1,1) = 'T' 
and lcodtr in ('011000','012000','015000','567101','567102') and eneadm = '002' and lenemi='107' 
--group by lcodtr
GROUP BY lenemi,eneadm,lfcotr,substr(leca62,1,4) order by lfcotr;

/*Transacciones de Tarjetas BNF en Otras Entidades*/
Select lfectr,sum(limpgs)Monto, lenemi from libdebito.drconbep where  lfcotr = '20191021' and lesttr = 'A' and lcretr = '00' and substr(lidtra,1,1) = 'T' 
and lenemi = '002' and  eneadm <> '002' GROUP BY  lfectr, lenemi order by  lfectr;

Select * from contabilid.SJSBJAN 

select * from libdebito.drconbep where lbinpr = '484145'  and lexpir = '2002' and lnrtar = '4841459999990327' --bill
select * from gxbdbps.tmtaraf where mtnumta = '6274311580000302'
SELECT * FROM  gxbdbps.drmaeaf where akenti = '158' and akacnb = '1580000302'
/*MOVILIZATE*/
select corucn nrodoc, '1' as TIPO, CORAZO NOMBRE_CLIENTE, CODENO NOMBRE_FANTASIA, COCOMER CODIGO, '0' tipoestablecimiento,
  '' nombreesta, coteln telefono, coceln celular, 
 coemail correo, codire1 direccion, codire2 barrio  , lodescor cuidad, 'PARAGUAY' PAIS, GLOCALIZAC LATITUD, COCONCOM CONTACTOCOME, COPROPTE1 TELCONTAC, COPROPCE1 CELULAR, RPRENAME VENDEDOR
from gxbdbps.comaeaf a
inner join gxbdbps.cozonaf d -- ZONA 
on a.zonacodi = d.zonacodi
inner join gxbdbps.colocaf e -- LOCALIDAD
on a.LOCODI = e.LOCODI
LEFT JOIN geodinel.geocomae ON COCOMER = GCOCOMER 
LEFT JOIN GXBDBPS.CORPRAF ON RPRECOD = RPRECODI

SELECT * FROM GXBDBPS.CORPRAF



/*cabal*/
SELECT LFECTR FECHAR,LHORTR HORA, LCODTR CODTRX, SUBSTR(LIDTRA,1,1) DISPOSITIVO, LCRETR RETORNO, LESTTR ESTADO, lcodbc marca, LIMPGS IMPORTE, LCAUTR AUTORIZ, LERRNB REFERENCIA,LIDCOM COMERCIO, LBINPR BIN
from libdebito.drconbep where lfectr between '20180101' and '20180131' AND LENEMI = '512' a
ORDER BY LFECTR ASC
--AND SUBSTR(LIDTRA,1,1) = 'T'
group by lcodbc

/*VER TRX DE PRUEBA*/
SELECT LFECTR FECHAR,LHORTR HORA, LCODTR CODTRX, SUBSTR(LIDTRA,1,1) DISPOSITIVO, LCRETR RETORNO, LESTTR ESTADO, lcodbc marca, LIMPGS IMPORTE, LCAUTR AUTORIZ, LERRNB REFERENCIA,LIDCOM COMERCIO, LNRTAR TARJETA
from libdebito.drconbep where lfectr between '20180201' and '20180201'  AND LIDCOM = '0100001'
ORDER BY LHORTR ASC
--AND SUBSTR(LIDTRA,1,1) = 'T'
group by lcodbc

/*TRANSACCIONES CICO*/
SELECT * FROM LIBDEBITO.DRCONBEP 
where lfectr >= '20180101' and lcodtr IN ('370000', '380000', '390000')

select * from gxweb.depcico where DEPCOM = '1000414' depfech = '20180108' --- TABLA MOVIMIENTO DE DEPOSITO
select * from libdebito.bst015 where TRIM(BS15CODCOM) = '4900039' --- TABLA DE LOS COMERCIOS, SE REGISTRAN LOS LÍMITES
select *  from gxopera.opmovi where OPCOMER = '0701052' and opcodtrn in ('370000','380000','390000') AND OPCOMER = '1000414' AND OPFEREA = '20180201'--TRANSACCION DE MOVIMIENTOS DEL COMERCIO
select * from libdebito.bst021 where trim(bs21codcom) = '4900039' AND BS21FECPRO = '20180201'--RESUMEN DE MOVIMIENTOS DEL COMERCIO
SELECT * FROM GXOPERA.RCTACICO WHERE CICOMER = '4900039'
SELECT * FROM GXBDBPS.COMAEAF where cofactu = '0701052'

SELECT * FROM GXBDBPS.COMAEAF where cofactu = '1001210'

select *  from gxopera.opmovi where opcomer in (SELECT cocomer FROM GXBDBPS.COMAEAF where cofactu = '0701052') and opcodtrn in ('370000','380000','390000')

select * from libdebito.drconbep where lidcom = '0701052' and lcodtr in ('370000','380000','390000')

select  TRIM(BS15CODCOM) CODIGO, CODENO COMERCIO,  BS15MONLIM LINEA, (BS15MONLIM-BS15MONSAL) disponible, BS15MONSAL DEPOSITAR, max(depfecha) ultimodep, max(opferea) ultimomov
from libdebito.bst015 INNER JOIN GXBDBPS.COMAEAF ON TRIM(BS15CODCOM) = cofactu
inner join gxweb.depcico on TRIM(BS15CODCOM)= depcom 
inner join  gxopera.opmovi on cocomer = TRIM(BS15CODCOM)
where TRIM(BS15CODCOM) in (SELECT cocomer FROM GXBDBPS.COMAEAF where cofactu = cocomer)
and opcodtrn in ('370000','380000','390000')
group by TRIM(BS15CODCOM), CODENO, BS15MONLIM, BS15MONSAL


select * from gxbdbps.COAFMAF where afcomer = '7200027'
select * from gxbdbps.COAFTAF where AFTIDESC LIKE '%DIAL%' = '1315'

/*COMERCIOS CON POS SPECTRA - JULIO GONZALEZ*/
select count(*)CANTIDAD,  AFTIDESC--, afticodi  -- 'ACTIVO' estado,  AFCOMER CODIGO, AFCODI CODACTIVOFIJO,CODENO DENOMINACION, codire1 direccion, LODESC LOCALIDAD,coteln telefono, AFAPPVER version, x.aftidesc descrip
from gxbdbps.COAFMAF d  INNER JOIN GXBDBPS.COMAEAF A ON AFCOMER = A.COCOMER
inner join gxbdbps.COAFTAF x on  d.afticodi = x.afticodi
inner join gxbdbps.colocaf c on a.locodi = c.locodi
WHERE (x.afticodi) IN (  '1215', '1216', '1217', '1315', '1403') 
AND SUBSTR(AFCOMER,1,2) NOT IN ( '01', '95') and costat = '0'
GROUP BY   AFTIDESC--AFCOMER, AFCODI, CODENO, codire1,LODESC, coteln, AFAPPVER

/*este es*/
SELECT  AFTIDESC DESCRIPCION, cocomer codigocomer, count(lcautr) canttrx 
FROM LIBDEBITO.DRCONBEP 
INNER JOIN GXBDBPS.COMAEAF A ON substr(digits(lidcom), 6, 7) = A.COCOMER
INNER JOIN GXBDBPS.COAFMAF D ON AFCOMER = A.COCOMER
inner join gxbdbps.COAFTAF x on  d.afticodi = x.afticodi
WHERE lfectr  between '20180501' and  '20180530' --AND LIDCOM = '3700088' 
AND (x.afticodi) IN (  '1215', '1216', '1217', '1315', '1403') AND COCOMER <> '0100001'
AND SUBSTR(COCOMER,1,2) NOT IN ( '95') and costat = '0' --AND LIDCOM = '0700623'
and lcretr = '00'
GROUP BY  AFTIDESC, cocomer

SELECT * FROM gxbdbps.COAFTAF WHERE afticodi IN (  '1215', '1216', '1217', '1315', '1403')

SELECT AFCOMER, COUNT(AFCODI) CANTIDAD , (SELECT SUM(TDACANT) FROM GXOPERA.TDAVISTAS WHERE TDACOME = AFCOMER AND TDAANHO = '2018' AND TDAMES = '05' AND TDACORE = '00' AND TDAESTA = 'A') CANTIDAD
FROM GXBDBPS.COAFMAF WHERE afticodi IN (  '1215', '1216', '1217', '1315', '1403')
AND SUBSTR(AFCOMER,1,2)  NOT IN ( '95') --and costat = '0'
GROUP BY AFCOMER


/*COMERCIOS CON TRX EN POS DIAL*/
SELECT AFCOMER codigo, CODENO DENOMINACION,COUNT(AFCODI) CANTIDADPOS , (SELECT COUNT(*) FROM LIBDEBITO.DRCONBEP WHERE substr(digits(lidcom), 6, 7) = AFCOMER AND SUBSTR(LFECTR,1,6) between '201803' and '201804'
AND LCRETR =  '00' AND LESTTR = 'A') CANTIDAD
FROM GXBDBPS.COAFMAF INNER JOIN GXBDBPS.COMAEAF ON AFCOMER = COCOMER
WHERE afticodi IN (  '1215', '1216', '1217', '1315', '1403')
AND SUBSTR(AFCOMER,1,2)  NOT IN ( '95') --and costat = '0'
GROUP BY AFCOMER, CODENO


/*SILVER*/
Select lidcom, lcomtr, lactfj ActivoDR, afcodi ActivoAF, m.afticodi TipoActivo, AFTIDESC, count(*) Cantidad from libdebito.drconbep
left  join gxbdbps.coafmaf m on lactfj = afcodi
left join  gxbdbps.coaftaf t on m.afticodi = t.afticodi
where lfectr = '20180504' 
and substr(lidcom,1,2) not in (90,95) AND lidcom <> '0100001'
group by lidcom, lcomtr, lactfj, m.afticodi, aftidesc, afcodi




SELECT SUM(TDACANT) FROM GXOPERA.TDAVISTAS WHERE TDAANHO = '2018' AND TDAMES = '05' AND TDACOME = '8100136' AND TDACORE = '00' AND TDAESTA = 'A'

SELECT DISTINCT LCODTR, COUNT(*) CANTIDAD  FROM LIBDEBITO.drconbep where lfectr between '20180101' and '20180131' 
and SUBSTR(lidcom,1,2) IN ( '81', '86') and lcretr = '00' and lesttr = 'A'
GROUP BY LCODTR

SELECT COUNT(DISTINCT AFCODI) CANTIDAD, AFTIDESC DESCRIPCION, COCOMER COMERCIO
FROM LIBDEBITO.DRCONBEP --COCOMER COMERCIO, COUNT(DISTINCT AFCODI),  AFTIDESC FROM LIBDEBITO.DRCONBEP 
INNER JOIN GXBDBPS.COMAEAF A ON substr(digits(lidcom), 6, 7) = A.COCOMER
INNER JOIN GXBDBPS.COAFMAF D ON AFCOMER = A.COCOMER
inner join gxbdbps.COAFTAF x on  d.afticodi = x.afticodi
WHERE LFECTR = '20180101'
AND (x.afticodi) IN (  '1215', '1216', '1217', '1315', '1403') AND COCOMER <> '0100001'
AND SUBSTR(COCOMER,1,2) NOT IN ( '95') and costat = '0' 
GROUP BY COCOMER, AFTIDESC, cocomer




select sum(cantidad) from (
select   afcomer as comercio, codeno as denominaccion, substr(afappver,1,6) as TIPO ,  COUNT(afappver) AS CANTIDAD, substr(affinst,1,6) mesista
 from  gxbdbps.coafmaf 
inner join gxbdbps.comaeaf on (cocomer = afcomer)
 where substr(afappver, 1,6) in ('VX0520', 'VX0675')
 and  SUBSTR(AFFALTA,1,4)||'-'||SUBSTR(AFFALTA,5,2)||'-'||SUBSTR(AFFALTA,7,2) <=  DATE(CURDATE())
 AND AFSTAT = '0'
 and afcomer <> '0100001'
 GROUP BY AFCOMER, substr(afappver,1,6) , codeno ,substr(affinst,1,6)
 ) as d





/*reporte dolores*/
select substr((digits(lidcom)),6,7), codeno, corazo, codire1, zonacodi, substr(leca62,1,8), b.locodi, lodesc, count(*)
from libdebito.drconbep a inner join gxbdbps.comaeaf b on substr((digits(lidcom)),6,7) = cocomer
inner join gxbdbps.colocaf c on b.locodi = c.locodi
where lfectr >= '20180101' and substr(lidtra,1,1) = 'P' and substr(leca62,1,1) not in ('V','S') and lidcom not in (5400617,8099000,6700014)
group by substr((digits(lidcom)),6,7), codeno, corazo, codire1, zonacodi, substr(leca62,1,8), b.locodi, lodesc

SELECT * FROM  gxbdbps.COAFMAF where substr(afticodi,1,2) = '13' --afcomer = '0200326'
select * from gxbdbps.COAFTAF

select * from libdebito.drconbep where lcodtr = '500030'  lfectr <= '20160101' and 
select * from gxbdbps.cozonaf 
/*SPECTRA POS - VERIFICACION*/
SELECT COUNT(*) CANTIDAD FROM LIBDEBITO.DRCONBEP where substr(lfECtr,1,6) = '201801'
 and lcodtr = '390000' and lcretr = '00' and lesttr = 'A'
 
SELECT  opferea freal, 
FROM GXOPERA.OPMOVI
 WHERE SUBSTR(OPFEREA,1,6) = '201801' AND OPCODTRN = '390000' 
 
WHERE LIDCOM = '0301557' AND  LFECTR BETWEEN '20180101' AND '20180131' AND LCRETR = '00' AND LESTTR = 'A' AND LCODTR = '000054'


select  sum(OPMONTO) D/*A Codigo, B Denominacion, SUM(C) Cantidad, sum(D) Importe*/ --from (
--select opcomer A, codeno B, count(*) C, sum(opmonto) D
from gxopera.opmovi --inner join gxbdbps.comaeaf on opcomer = cocomer
where substr(opferea,1,6) ='201801'
and opcodtrn in ('370000','380000', '390000')
group by opcomer, codeno
union
select SUM(OPMONTO) D /*opcomer A, codeno B, count(*) C, sum(integer((opmonto*100)/105)) D*/
from gxopera.opmovi -- inner join gxbdbps.comaeaf on opcomer = cocomer
where substr(opferea,1,6) = '201801'
and opcodtrn in ('390000')
group by opcomer, codeno) x
group by A,B
/**/
select * --sum(opmonto)-- OPCOMER AS COMERCIO, CORUCN AS RUC,  ZONADESC AS ZONA, OPSTATUS AS ESTADOTRX,  RPRENAME AS REPRESENT , CODENO AS DENOMINACION, OPCODTRN AS TRX,  OPFECOM AS FECHA, OPHOTRN AS HORA, OPMONTO AS IMPORTE,  OPNOREF AS REFERENCIA, OPCELU AS CELULAR, SUBSTR(LCTADE,8,9) AS REFTigo
 from gxopera.opmovi
 INNER JOIN GXBDBPS.COMAEAF A ON (OPCOMER = COCOMER)
 inner join gxbdbps.cozonaf d
on a.zonacodi = d.zonacodi
INNER JOIN gxbdbps.corpraf  ON (RPRECOD = RPRECODI)
INNER JOIN libdebito.drconbep ON (OPCOMER = substr(digits(lidcom), 6, 7) AND OPNOREF = LERRNB AND OPCODAUT = LCAUTR)
  WHERE OPCODTRN IN ('370000', '380000', '390000')
--  AND SUBSTR(OPCOMER,1,2) not IN ('45', '79', '80', '81', '86', '90')
  AND OPSTATUS = 'A'
  AND OPCODRES = '00'
   and substr(opferea, 1,6) = '201801'
--AND SUBSTR(OPFErea,5,2) BETWEEN '01' AND '01'
ORDER BY OPFECOM , OPHOTRN 

/*ANULACION DE CHEQUEES*/

Te paso las sentencias que debemos probar en PRODUCCION
/*CUANDO ELIMINA CREA ESTE REGISTRO*/
SELECT * FROM CONTABILID.CCMBA18 WHERE MBCOSU='01' AND MBTPCO='01'
AND MBCMON='01' AND MBCOBC = '01' AND MBNRCH = '18000000001033419'  

SELECT * FROM CONTABILID.CCMBA18 WHERE MBCOSU='01' AND MBTPCO='01'
AND MBCMON='01' AND MBCOBC = '01' AND MBNRCH = '1033419'  

SELECT * FROM CONTABILID.CCCHEQU WHERE CHNRCH = 1033419

SELECT * FROM CONTABILID.CCASI18 WHERE ASNRAS = 2645

select * from LIBDEBITO.DRCONBEP WHERE LFCOTR='20180129' AND lidcom = '5400617' AND  lcotel = '0985723332'
 AND LERRNB = '734659651386'


select crfege fecha_generacion,count(*) cantidad, crfeej fecha_ejecucion
 from libdebito.tgembhaf where crfege = '20180131' and crcodn = '1' and crbine = '703002'
group by crfege, crfeej


/*SILVER*/
select opcomer A, codeno B, count(*) C, sum(opmonto) importe,sum(integer((opmonto*100)/105)) D
from gxopera.opmovi inner join gxbdbps.comaeaf
on opcomer = cocomer
where substr(opferea,1,6) =201801
and opcodtrn in ('390000')
group by opcomer, codeno

/*EDUARDO SZARAN*/
SELECT COUNT(LCRETR), LCRETR FROM LIBDEBITO.DRCONBEP 
WHERE  LFECTR BETWEEN '20170101' AND '20170131' AND SUBSTR(LIDTRA, 1, 1) = 'T'-- AND LIMPGS > '0.0'
GROUP BY LCRETR
/*VENTA DE MINUTOS - TIGO*/
SELECT lfectr fecha_real, lhortr hora, lcomtr comercio, lcodtr trx, lcautr autorizacion, lerrnb referencia, lcretr retorno, lesttr estado, lcotel telefono, limpgs importe  FROM LIBDEBITO.DRCONBEP 
WHERE  LFECTR = '20180102'   AND SUBSTR(LIDTRA, 1, 1) = 'P'  and lcautr = '246123' AND LIMPGS = '5000' AND SUBSTR(LIDTRA,1,1) = 'P' and lcotel = '0981728588' 


select * from gxbdbps.comaeaf where '201'



/*mirian*/ 
SELECT  * --LICOMER CODIGOCOMER,CORAZO RAZON_SOCIAL,  LINROFAC NROFACTURA,SUBSTR(LIFECHA,1,6) FECHAFACT,  SUM(LIRENTA) RETENCION_RENTA , SUM(LIREIVA) IVA_RENTA
FROM GXOPERA.FLICOM1 
INNER JOIN GXBDBPS.COMAEAF ON (LICOMER = COCOMER)
WHERE SUBSTR(LIFECHA,1,6) = '201801' AND litiptar = 'CRE' --AND LICOMER = '0700227'
AND LIRENTA > 0
GROUP BY LINROFAC,LICOMER , CORAZO, SUBSTR(LIFECHA,1,6)


select COCOMER, COFACTU from gxbdbps.comaeaf where cocomer = '4900039'

select COCOMER, COFACTU from gxbdbps.comaeaf where cofactu = '0100113'
select COCOMER, COFACTU from gxbdbps.comaeaf where cofactu <> COCOMER

/*DEPOSITO CICO POR CUENTA MADRE*/
select  TRIM(BS15CODCOM) CODIGO, CODENO COMERCIO,  BS15MONLIM LINEA, (BS15MONLIM-BS15MONSAL) disponible, BS15MONSAL DEPOSITAR, max(DEPFECH) ultimodep, max(opferea) ultimomov
from libdebito.bst015 INNER JOIN GXBDBPS.COMAEAF ON TRIM(BS15CODCOM) = cofactu
inner join gxweb.depcico on TRIM(BS15CODCOM)= depcom 
inner join  gxopera.opmovi on cocomer = TRIM(BS15CODCOM)
where  TRIM(BS15CODCOM)   in (SELECT cocomer FROM GXBDBPS.COMAEAF where cofactu  = '0701052')
and opcodtrn in ('370000','380000','390000')
group by TRIM(BS15CODCOM), CODENO, BS15MONLIM, BS15MONSAL



select cocomer, codeno, corucn, COFACTU  from gxbdbps.comaeaf where COCOMER = '1000414'

select * from gxopera.opmovi where opcomer = '1000414'
 AND  Opcodtrn in ('370000','380000','390000')
 ORDER BY 1 DESC






/*ORIGINAL*/
SELECT TRIM(BS15CODCOM) cuentam,/* corazo comercio,*/ BS15MONLIM LINEA, (BS15MONLIM-BS15MONSAL) disponible,  BS15MONSAL DEPOSITAR,  max(opferea) ultimomov , max(DEPFECH) ultimodep--,
FROM  libdebito.bst015
INNER JOIN GXBDBPS.COMAEAF ON COFACTU = TRIM(BS15CODCOM) 
INNER JOIN gxopera.opmovi  ON OPCOMER = COCOMER
inner join gxweb.depcico on TRIM(BS15CODCOM)= depcom 
WHERE /* TRIM(BS15CODCOM) = '0701052'
and */ BS15ESTADO = 'A'
and opcodtrn in ('370000','380000','390000')
GROUP BY TRIM(BS15CODCOM), /*corazo,*/ BS15MONLIM, BS15MONSAL

select cocomer, codeno, corucn, COFACTU  from gxbdbps.comaeaf where COFACTU = '0701357'
SELECT * FROM gxweb.depcico WHERE  DEPCOM IN ('0701357') -- deposito
SELECT * from libdebito.bst015  WHERE TRIM(BS15CODCOM) = '0701357'
select * from gxopera.opmovi where opcomer = '0701357'
 AND  Opcodtrn in ('370000','380000','390000')
 ORDER BY 1 DESC

SELECT DISTINCT(CORAZO) FROM GXBDBPS.COMAEAF WHERE CORAZO LIKE '%BIGG%'


select BLCORED AS OPERADOR, COUNT(*)  AS ENE, 0 AS FEB,0 AS MAR, 0 AS ABR, 0 AS MAY, 0 AS JUN, 0 AS JUL, 0 AS AGO, 0 AS SEP, 0 AS OCT, 0 AS NOV, 0 AS DIC 
FROM BEPSABKP.DRCONBKP
INNER JOIN GXBDBPS.COMAEAF
ON (substr(digits(Blidcom), 6, 7) = COCOMER)
where blcodtr in ('901020')
AND SUBSTR(blfectr, 1, 4) = 2018
and substr(blfectr, 5, 2) = '01'
and blidcom not in ('5400617') 
AND BLESTTR = 'A'
AND BLCORED <> ''
and SUBSTR(BLIDTRA,1,1) = 'T'
AND CORUCN NOT IN ( '80011012-9')
group by blcored
--FEBRERO

select BLCODTR, BLCORED AS OPERADOR, COUNT(*)  AS ENE, 0 AS FEB,0 AS MAR, 0 AS ABR, 0 AS MAY, 0 AS JUN, 0 AS JUL, 0 AS AGO, 0 AS SEP, 0 AS OCT, 0 AS NOV, 0 AS DIC 
FROM BEPSABKP.DRCONBKP
INNER JOIN GXBDBPS.COMAEAF
ON (substr(digits(Blidcom), 6, 7) = COCOMER)
where blcodtr in ('901020')
AND SUBSTR(blfectr, 1, 4) = 2018
and substr(blfectr, 5, 2) = '01'
AND BLESTTR = 'A'
AND BLCORED <> ''
and SUBSTR(BLIDTRA,1, 1) = 'T'
group by BLCODTR,blcored


/*avance*/
select TDAMARK AS MARCA, TDACOTR CODT, tdaenti ENTI, SUM(TDACANT)  AS ENE, SUM(TDAIMPO) IMPO1, 0 AS FEB, 0 IMPO2 ,0 AS MAR, 0 IMPO3, 0 AS ABR, 0 IMPO4, 0 AS MAY, 0 IMPO5, 0 AS JUN, 0 IMPO6, 0 AS JUL, 0 IMPO7, 0 AS AGO, 0 IMPO8,0 AS SEP, 0 IMPO9, 0 AS OCT, 0 IMPO10, 0 AS NOV, 0 IMPO11, 0 AS DIC , 0 IMPO12
from gxopera.tdavistas
INNER JOIN GXBDBPS.COMAEAF
ON (TDACOME = COCOMER )
where tdames = '01'
AND TDAANHO =  '2018'
AND CORUCN NOT IN ( '80011012-9')
and tdatipo = 'T'
AND TDACOTR IN  ('011000', '012000', '013000' , '015000', '000052', '567102')
AND TDAESTA = 'A'
AND TDACOME NOT IN ('8100036', '8199999', '8600001', '8099999', '8100001', '8100000', '9002666', '9018046', '9099000')
AND TDAMARK IN ('BIL', 'CAB',  'CRE', 'DCR', 'DEB', 'DIN', 'MST', 'PAN', 'UNI', 'VSA' ) 
GROUP BY  TDAMARK, TDACOTR, tdaenti 

select * from libdebito.drconbep where lfcotr = '20171016' and limpgs = '1494000' and lidcom = '301557'



select * from libdebito.drconbep where lfectr = '20180102' and limpgs = '259000'
select * from libdebito.drconbep where lfectr = '20180102' and limpgs = '378000'
select * from libdebito.binprodu where rgbin  like '%451765%'


/*metrica NATALIA*/
/*AVANCE EN EFECTIVO APROBADAS EN POS - ENTIDADES*/
select TDACOTR CODT,  SUM(TDACANT)  AS CANTIDAD, SUM(TDAIMPO) IMPORTE, (CASE WHEN TDACOTR IN ('013000', '014000') THEN TDAMARK
WHEN TDACOTR IN ('000052') THEN 'BILL TIGO'
WHEN TDACOTR IN ('567102') THEN 'BIL PER' END)
from gxopera.tdavistas
INNER JOIN GXBDBPS.COMAEAF
ON (TDACOME = COCOMER )
where tdames = '01'
AND TDAANHO = '2017'
AND CORUCN NOT IN ( '80011012-9')
and tdatipo = 'P'
AND TDACOTR IN  ( '013000', '000052', '567102', '014000')
AND TDAESTA = 'A'
AND SUBSTR(TDACOME, 1,2)  IN  ('80', '81', '86')
and tdacore = '00'
AND TDACOME NOT IN ('8100036', '8199999', '8600001', '8099999', '8100001', '8100000')
AND TDAMARK IN ('BIL', 'CAB',  'CRE', 'DCR', 'DEB', 'DIN', 'MST', 'PAN', 'UNI', 'VSA' ) 
GROUP BY   TDACOTR, TDAMARK

/*AVANCE EFECTIVO RUTADAS*/
SELECT SUM(CANTIDAD) CANTIDAD, SUM(IMPORTE) IMPORTE, MARCA FROM (
select TDACOTR CODT,  SUM(TDACANT)  AS CANTIDAD, SUM(TDAIMPO) IMPORTE, (CASE WHEN TDACOTR IN ('011000', '012000','013000', '014000') THEN TDAMARK
WHEN TDACOTR IN ('000052') THEN 'BILL TIGO'
WHEN TDACOTR IN ('567102') THEN 'BIL PER'
WHEN TDACOTR IN ('015000') THEN 'TIGO COMPA' END)MARCA
from gxopera.tdavistas
INNER JOIN GXBDBPS.COMAEAF
ON (TDACOME = COCOMER )
where tdames = '01'
AND TDAANHO =  '2018'
AND CORUCN NOT IN ( '80011012-9')
and tdatipo = 'T'
AND TDACOTR IN  ('011000', '012000', '013000' , '015000', '000052', '567102')
AND TDAESTA = 'A'
AND TDACOME NOT IN ('8100036', '8199999', '8600001', '8099999', '8100001', '8100000', '9002666', '9018046', '9099000')
AND TDAMARK IN ('BIL', 'CAB',  'CRE', 'DCR', 'DEB', 'DIN', 'MST', 'PAN', 'UNI', 'VSA' ) 
GROUP BY   TDACOTR, TDAMARK ) AS D
GROUP BY  MARCA



SELECT DISTINCT LENEMI FROM LIBDEBITO.DRCONBEP WHERE LCODTR = '015000' AND LCRETR = '00'


 /*TARJETAS CON MOV POR AÑO BNF*/
select -- entcodi as entidad, entbina as Descripcion,
'BANCO NACIONAL DE FOMENTO - DEBITO' AS NOMBRE,COUNT(DISTINCT BLNRTAR) AS ENE, sum(blimpgs) importe
from bepsabkp.drconbkp
where substr(blfectr,1, 4) = '2018'
and substr(blfectr,5,2) = '01' 
and blbinpr = '703002'
and blenemi = '002'
AND BLCRETR = '00' -- aceptadas
AND BLESTTR = 'A' -- aprobadas

select opcomer, opfecom, count(*) cantidad,  sum(opmonto), sum (opmonto - opcomi)
from gxopera.opmovi where opcomer = '6900053' and opfecom = '20180208'
group by opcomer, opfecom 

select * from libdebito.drconbep  where lfcotr = '20180209' and lidcom = '0700624' and lcodtr = '000054' and lcretr = '00' and lesttr = 'A'
SELECT * FROM GXOPERA.OPRECLE WHERE RECOMER = '0700624' AND REFECH = '20180209' AND REMOVI = 'COP'
  --and lcautr in ('621510', '632772')
select SUM(OPMONTO) from gxopera.opmovi where opfECOM = '20180209' AND  OPCODTRN = '000054' AND OPCOMER = '0700624'
and opcodaut in  ('621510', '632772')

select * from gxopera.flicom1 where licomer = '0700624'  and licodtr = '000054' and lifechd = '20180209'

select * from gxbdbps.comaeaf where COCOMER IN ('0200529','2000160','0901383','0301709','1001433','0300320','0901366','0301716','0301714','0301612','0900117','1000327','0200534','0301045','0301760','1800357','0301442','1301619','0200653','0901293','1800377','1100190','1000591','0301165','0200594','2400075','0301601','0301602','2400078','0900898','0301737','1500044','0900462','0301712','0200161','0301713',
'0200604','0301447','0301369','2300140','2700023','0301431','0301793','0301356','0301252','0301787')

select * from gxopera.opliqui where opncomer = '0700368' and substr(opcampoa,1,6) = '703002' and 
opfecliq = '20180209'

select * from gxopera.opago1p where pgfecre = '20180207' and UPPER(PGOBSER) like '%VISA%'

/*operaciones*/
select * --akenti as Entidad, ennombr, akadcd as BIN, akacnb as Nro_Tarjeta, akaicd as Estado, akaqtx as Nombre, akaenb as Documento, akafnb as Vencimiento
from gxbdbps.drmaeaf a inner join gxbdbps.gentiaf b on a.akenti = b.enemiso
where akenti ='110' and akaicd = '00'
and akabda <='201801' and akafnb >='1801'
order by akaicd, akaenb




/**tigo*/

SELECT * --SUM(LINETO) +
FROM GXOPERA.FLICOM1
 WHERE  LICOMER = '6900002' AND LIFECREDI = '20180205'


SELECT * --SUM(LINETO) 
FROM GXOPERA.FLICOM1
 WHERE  LICOMER = '6900002' AND LIFECREDI = '20180206'
/*DIEGO AGUILERA  - TRX DE TIGO */
SELECT * FROM GXOPERA.OPMOVI
 WHERE OPFEREA = '20180201' AND OPRADOR  =  '981' AND OPCODTRN IN ('514000', '524000', '901020', '902020')
 
SELECT *  FROM LIBDEBITO.DRCONBEP WHERE LFECTR = '20180219'  AND LCOTEL = '0983364513'
AND LCODTR IN ('514000', '524000', '901020', '902020') AND LCORED = '981' AND LCRETR = '00' AND LESTTR = 'A'


SELECT 


select * from libdebito.tbinproc WHERE PBIN LIKE '%6016%' 

/*VERIFICAR*/

select DISTINCT(LBINPR) from libdebito.drconbep where lcodbc = 'MST' AND SUBSTR(LBINPR,1,4) = '6016' AND LFECTR = '20180101'

/*MOVILIZATE -  TIGO*/
select 'T'||substr(cocomer,5,3) dispo, corucn nrodoc, '1' as TIPO, CORAZO NOMBRE_CLIENTE, CODENO NOMBRE_FANTASIA, COCOMER CODIGO, '0' tipoestablecimiento,
  '' nombreesta, coteln telefono, coceln celular, 
 coemail correo, codire1 direccion, codire2 barrio  , lodescor cuidad, 'PARAGUAY' PAIS, GLOCALIZAC LATITUD, COCONCOM CONTACTOCOME, COPROPTE1 TELCONTAC, COPROPCE1 CELULAR, RPRENAME VENDEDOR
from gxbdbps.comaeaf a
inner join gxbdbps.cozonaf d -- ZONA 
on a.zonacodi = d.zonacodi
inner join gxbdbps.colocaf e -- LOCALIDAD
on a.LOCODI = e.LOCODI
LEFT JOIN geodinel.geocomae ON COCOMER = GCOCOMER 
LEFT JOIN GXBDBPS.CORPRAF ON RPRECOD = RPRECODI
where costat = '0'
and substr(cocomer,1,2) = '90'


select * from gxbdbps.cozonaf

select  A.RCLAFECH AS FECHAREC, a.cocomer CODIGO , codeno DENOMINACION, codire1 DIRECCION, coteln TELEFONO, rprename TECNICO,a.rclafech FECHA, rclastat ESTADO,
tipedesc ASISTENCIA,rcladesc DESCRIPCION, rprecont CONTACTO, zonadesc zona
from gxbdbps.coasiaf a inner join gxbdbps.comaeaf b
on a.cocomer = b.cocomer
inner join gxbdbps.cozonaf x
on b.zonacodi = x.zonacodi
Inner join gxbdbps.coas1af c
on (a.cocomer=c.cocomer and a.tirclaco = c.tirclaco and a.rclahora = c.rclahora and a.rclafech= c.rclafech)
inner join gxbdbps.corpraf
on rprecodi = rclarpre
inner join gxbdbps.coastaf d
on a.tirclaco = d.tirclaco
where  SUBSTR(A.RCLAFECH,1,4)||'-'||SUBSTR(A.RCLAFECH,5,2)||'-'||SUBSTR(A.RCLAFECH,7,2) = DATE(CURDATE() - 1 days)
and rclastat = 30
and rprename <> '*****'
and SUBSTR(A.RCLAFECH,1,6) >= '201801'
and b.zonacodi in ('01', '03', '10')
union 
select  A.RCLAFECH AS FECHAREC, a.cocomer CODIGO , codeno DENOMINACION, codire1 DIRECCION, coteln TELEFONO, rprename TECNICO,a.rclafech FECHA, rclastat ESTADO,
tipedesc ASISTENCIA,rcladesc DESCRIPCION, rprecont CONTACTO, zonadesc zona
from gxbdbps.coasiaf a inner join gxbdbps.comaeaf b
on a.cocomer = b.cocomer
inner join gxbdbps.cozonaf x
on b.zonacodi = x.zonacodi
Inner join gxbdbps.coas1af c
on (a.cocomer=c.cocomer and a.tirclaco = c.tirclaco and a.rclahora = c.rclahora and a.rclafech= c.rclafech)
inner join gxbdbps.corpraf
on rprecodi = rclarpre
inner join gxbdbps.coastaf d
on a.tirclaco = d.tirclaco
where  SUBSTR(A.RCLAFECH,1,4)||'-'||SUBSTR(A.RCLAFECH,5,2)||'-'||SUBSTR(A.RCLAFECH,7,2) = DATE(CURDATE() - 2 days)
and rclastat = 30
and rprename <> '*****'
and SUBSTR(A.RCLAFECH,1,6) >= '201801'
and b.zonacodi in ('02', '08')


SELECT * FROM gxbdbps.cozonaf
select * from gxbdbps.COMAEAF
select * from gxbdbps.COAFMAF where costat = '0'
/*CODIGO DE ACTIVO - POS VERIFONE - JULIO*/
select afcomer codigo, CODENO DENOMINACION, CODIRE1 DIRECCION, COTELN TELEFONO, LODESC LOCALIDAD, afcodi codactivo, AFAPPVER DESCRIPCION, AFTIDESC TIPO_POS, afstat estado 
from gxbdbps.COAFMAF A INNER JOIN GXBDBPS.COMAEAF B ON COCOMER = AFCOMER
inner join gxbdbps.colocaf c
on B.locodi = c.locodi
inner join gxbdbps.cozonaf d
on B.zonacodi = d.zonacodi
inner join gxbdbps.coaftaf f -- tipo de POS
on A.afticodi = F.afticodi 
where afstat = '0' AND SUBSTR(AFAPPVER,1,2) = 'SP'
and afcomer <> '0100001'
--and afticodi = '1402'


SELECT * FROM gxbdbps.coaftaf
inner join gxbdbps.coaftaf f -- tipo de POS
on f.afticodi = b.afticodi 
TE VOY A AFGREGAR, PERO NO PUEDO HABLAR 
/*VERIFICAR CICO*/
select * from gxweb.depcico where depcom = '0701052'
SELECT * FROM  libdebito.bst015 WHERE TRIM(BS15CODCOM)  = '0701052'
SELECT * FROM gxopera.opmovi WHERE OPCOMER = '0901399' AND OPCODRES = '00' AND OPSTATUS = 'A' AND OPCODTRN IN ('370000', '380000', '390000')
SELECT COCOMER, COFACTU FROM GXBDBPS.COMAEAF WHERE COFACTU = '0901399'

SELECT TRIM(BS15CODCOM) cuentam, corazo comercio,  BS15MONLIM LINEA, BS15MONSAL disponible,   (BS15MONLIM-BS15MONSAL) DEPOSITAR,  max(opferea) ultimomov , max(DEPFECHa) ultimodep--,
FROM  libdebito.bst015
INNER JOIN GXBDBPS.COMAEAF ON COFACTU = TRIM(BS15CODCOM) 
INNER JOIN gxopera.opmovi  ON OPCOMER = COCOMER
LEFT join gxweb.depcico on TRIM(BS15CODCOM)= depcom 
WHERE BS15ESTADO = 'A'
and opcodtrn in ('370000','380000','390000')
GROUP BY TRIM(BS15CODCOM), corazo, BS15MONLIM, BS15MONSAL

SELECT * FROM  gxbdbps.coastaf

/* VERIFICACION - ASISTENCIAS OTROS*/
 select *-- A.RCLAFECH AS FECHAREC, a.cocomer CODIGO , codeno DENOMINACION, codire1 DIRECCION, coteln TELEFONO, rprename TECNICO,a.rclafech FECHA, rclastat ESTADO,
--tipedesc ASISTENCIA,rcladesc DESCRIPCION, rprecont CONTACTO
from gxbdbps.coasiaf a inner join gxbdbps.comaeaf b
on a.cocomer = b.cocomer
Inner join gxbdbps.coas1af c
on (a.cocomer=c.cocomer and a.tirclaco = c.tirclaco and a.rclahora = c.rclahora and a.rclafech= c.rclafech)
inner join gxbdbps.corpraf
on rprecodi = rclarpre
inner join gxbdbps.coastaf d
on a.tirclaco = d.tirclaco
where SUBSTR(A.RCLAFECH,1,6) >= '201801'
-- SUBSTR(A.RCLAFECH,1,4)||'-'||SUBSTR(A.RCLAFECH,5,2)||'-'||SUBSTR(A.RCLAFECH,7,2) <= DATE(CURDATE())
--and tipetipo = 10
and rclastat = 30
and rprename <> '*****'
--and SUBSTR(A.RCLAFECH,1,6) >= '201801'



select lnrtar NroTarjeta, lcautr CodAut, lfectr FchTrx, lhortr Hora, limpgs Importe, coprcodi "Comercio-Procard",lcodbc,
lcomtr Comercio,lcretr CodResp, lesttr Estado, substr(lidtra,1,1) Origen
from libdebito.drconbep inner join gxbdbps.coma1af
on substr(digits(lidcom),6,7) = cocomer
where lfectr >= '20180101'
and lcodbc in ('MST','UNI','CRE','VSA')
AND LCRETR IN ('92') and prcodi = '510'


 SELECT * from  gxbdbps.coafmaf 

select * --  afcomer as comercio, codeno as denominaccion,COUNT(AFCODI) AS CANTIDAD
 from  gxbdbps.coafmaf 
inner join gxbdbps.comaeaf on (cocomer = afcomer)
 where --substr(afappver, 1,2) in ('VX')
-- AND AFSTAT = '0'
 afcomer = '0301557'
 GROUP BY AFCOMER,  codeno
 

select linea  as linea, sum(canttarjetas) as canttarjeta, sum(cantusu) cantusuarios, sum(carteratotal) as cartetato from (

/*CANTIDAD DE TARJETAS COOSOFAN*/
/*CANTIDAD DE TARJETAS*/
select count(distinct(mtnumta)) as canttarjetas--,0 as cantusu, mclimco as linea ,0 as carteratotal
from gxbdbps.tmtaraf a 
inner join  GXBDBPS.tmctaaf b on a.mcnumct = b.mcnumct
 WHERE ENEMISO = 319
and mtstats = '1'
and mtestve <> 'V'
and mtfecre <= '20180131'
--and mtfeemi <= '20180131'
and blcodig = '00'
--and mtestex <> 'E'
--AND MTESTHA <> 'E'
group by mclimco
union
/*CANTIDAD DE USUARIOS*/
select /* -- 0 as canttarjetas,  */count(distinct(cenumdo)) as cantusu--, mclimco as linea , 0 as carteratotal
from gxbdbps.tmtaraf a 
--inner join  GXBDBPS.tmctaaf b on a.mcnumct = b.mcnumct
 WHERE ENEMISO = '319'
and  mtstats = '1'
and mtestve <> 'V'
and blcodig = '00'
and mtfecre <= '20180131'
group by mclimco
union
/*cartera total*/
select  0 as canttarjetas,  0 as cantusu, mclimco as linea , count(*) as carteratotal
from gxbdbps.tmtaraf a 
inner join  GXBDBPS.tmctaaf b on a.mcnumct = b.mcnumct
 WHERE ENEMISO = {?entidad }
--and mclimco = '3000000'
and mtstats = '1'
--and mtestve <> 'V'
--and blcodig = '00'
group by mclimco ) as d 
group by linea



select * from gxbdbps.vidtav
select * FROM gxbdbps.tinfdaf WHERE ENEMISO = '332'

/*DOLORES*/
select tdaanho, tdatipo, count(*) from gxopera.tdavistas where tdaanho in ('2015','2016','2017') group by tdaanho, tdatipo

/*VERIFICACION SILVER */
SELECT  PGCOMER COMERCIO, PGNOCTA NROCTA,  SUM(PGIMPOR) 
from GXOPERA.OPAGO1P WHERE PGFECRE IN ( '20180219')   AND PGCOMER IN ('0700368','0700553','0700208','0700126','0800303') and pgtipo = 'C'
GROUP BY PGCOMER, PGNOCTA; 

SELECT OPCOMER COMERCIO,/* substr(optarj,1,6),*/ SUM(OPMONTO -OPCOMI-OPRENTA-OPREIVA) NETO
FROM GXOPERA.OPMOVI WHERE OPFECOM IN  ('20180216') AND OPCOMER IN ('0700368','0700553','0700208','0700126','0800303')
AND OPCODTRN = '000054' AND SUBSTR(OPTARJ,1,6) = '627431'
GROUP BY  OPCOMER , substr(optarj,1,6);

SELECT OPCOMER COMERCIO, substr(optarj,1,6), SUM(OPMONTO -OPCOMI-OPRENTA-OPREIVA) NETO, OPFECOM fcomercial
FROM GXOPERA.OPMOVI WHERE OPFECOM between  '20180208' and '20180216' AND OPCOMER IN ('0700368','0700553','0700208','0700126','0800303')
AND OPCODTRN = '000054' --AND SUBSTR(OPTARJ,1,6) = '627431'
GROUP BY  OPCOMER, substr(optarj,1,6), OPFECOM


Select  pgcomer, pgimpor, (pgimpor-201014) from gxopera.opago1p where PGFECRE = '20180219' and pgtipo = 'C' and pgcomer = '0700126'
Update gxopera.opago1p set pgimpor= (pgimpor-201014) where PGFECRE = '20180219' and pgtipo = 'C' and pgcomer = '0700126'
Update gxopera.opago1p set pgimpor= (pgimpor-241266) where PGFECRE = '20180219' and pgtipo = 'C' and pgcomer = '0700208'
Update gxopera.opago1p set pgimpor= (pgimpor-431692) where PGFECRE = '20180219' and pgtipo = 'C' and pgcomer = '0700368'
Update gxopera.opago1p set pgimpor= (pgimpor-297986) where PGFECRE = '20180219' and pgtipo = 'C' and pgcomer = '0700553'

Select * from gxopera.opago1p where pgcomer = '4500001' and pgentid = '023'
Update gxopera.opago1p set pgimpor = (pgimpor - 1171958) where pgcomer = '4500001' and pgentid = '023'

/*PARA ODULIA*/ PREPARAR FORMULARIO
select count(*) CANTIDAD,b.tgenti,b.tgdesc from gxbdbps.comaeaf a
inner join contabilid.tatgene b
on a.enemiso=b.tgenti
--where a.costat='0'
group by b.tgenti,b.tgdesc
/*CONSULTA DE SILVER - CLEARING*/
select reenemi , retartip ,sum(remonto) 
from gxopera.oprecle where refech = '20180111' and reenemi NOT in ('500', '777', '002')
and reenemi = '888' 
--and readmin = '018' AND REMOVI = 'ADA'
group by reenemi , retartip
SELECT * FROM LIBDEBITO.BINPRODU WHERE RGMARCA = 'CAB'
SELECT * FROM LIBDEBITO.TBBINE0P WHERE QENTEM = '512'
select * --REFECH FECHA, reenemi , READMIN,  retartip ,sum(remonto) IMPORTE
from gxopera.oprecle where refech >= '20180111' and --reenemi NOT in ('500', '777', '002')
reenemi = '888' 
and readmin = '101'
AND REMOVI = 'ADA'
group by REFECH, reenemi , READMIN, retartip
/*REPAIR CATHERINE - VENTA DE MINUTOS*/
Select * from gxopera.fctacom where ctamonto = '1152000'
Select * from gxopera.fctacom where cocomer in ( '1000766') 
and ctafecha = '20180108' and ctanrobol = '2227094'
--Delete gxopera.fctacom where cocomer = '1000766' and  ctafecha = '20180108' and ctanrobol = '2227094'

select * -- crenti as Entidad,ennombr, crclat, afdescr, crcodn, substr(crtarj,1,6)||'xxxxxx'|| substr(crtarj,13,4) as Tarjeta, crdocu as Documento, crnomb as Nombre, crfege as FechaGeneracion, crlcre as lineaCred
from libdebito.embnovhst a inner join gxbdbps.tafinaf b
on crenti = b.enemiso  --and crclat = afafini
inner join gxbdbps.gentiaf c
on crenti = c.enemiso
where crenti = '121'
and crfege between {?FchD} and {?FchH}



select *--count(MTNUMTA)CANTIDAD, entbina--, COUNT(DISTINCT CENUMDO) CANTUSUARIO, mclimco+mclimcu LINEACREDITO, mcsafac+mcsfnve+mcsalfi+mccuope+mcadepe+mcrefpe SALDO 
from gxbdbps.tmtaraf a
inner join gxbdbps.tmctaaf b on a.mcnumct=b.mcnumct
inner join gxopera.opentid1 on a.enemiso = entcodi
where a.enemiso='319' and mtstats<>'3'
group by  entbina, mclimco+mclimcu, mcsafac+mcsfnve+mcsalfi+mccuope+mcadepe+mcrefpe

select * from gxbdbps.gentiaf
select * from gxopera.opentid1


/*JOSE FLEITAS*/

SELECT * FROM GXOPERA.OPLIQUI WHERE OPFECLIQ = '20180222' /* AND OPSTATOB = '00' */AND OPCODBCO = '64' and substr(opcampoa,1,6) = '703002' AND OPNROCTC = '20006'


/*verificaciones 22/02/2018*/
Select lidcom, lcodtr,lbinpr,sum(limpgs)  from libdebito.drconbep where lbinpr in ('703002','627431') and lcodtr = '000054' and lfcotr = '20180221' and lesttr = 'A' and lcretr = '00' and lidcom = '0700368' group by lidcom, lcodtr, lbinpr;
Select * from gxopera.oprecle where refech = '20180221' and recomer = '0700368';

Select opcomer,openemi, substr(optarj,1,6),sum(opmonto), sum(opmonto-opcomi-opreiva-oprenta) from gxopera.opmovi 
where  opfecom = '20180221' and opcodtrn = '000054' and opcomer = '0700368' group by opcomer,substr(optarj,1,6), openemi;
Select * from gxopera.flicom where licomer = '0700368' and lifechd = '20180221';
Select * from gxopera.flicom1 where licomer = '0700368' and lifechd = '20180221';
Select opncomer,opstat, substr(opcampoa,1,6), count(*),sum(opimpor), sum(opimporb)  from gxopera.opliqui where substr(opcampoa,17,8) = '20180222' and opncomer = '0700368'
group by opncomer, opstat, substr(opcampoa,1,6)



select pgcmov, sum(pgimpo) from gxopera.opago0p group by pgcmov
Select OPCOMER comercio, opfecom, opcodtrn, substr(optarj,1,6),sum(opmonto)Total, sum(opmonto-opcomi)Neto, sum(opcoment)ComEnt, sum(opcombps)ComBPS, sum(opivaent)IvaEnt, sum(opivabps) Ivabps
from gxopera.opmovi where opentid = '002' and opcodtrn in ('000054','014000','901020','902020','510000','520000','530002')
and OPCOMER  in('0701519','0701456','0701147','0701329','0200150')
and opfecom = '20180222' and optiptar = 'DEB' group by OPCOMER,opfecom, opcodtrn, substr(optarj,1,6)
union
Select opfecom, opcodtrn, substr(optarj,1,6),sum(opmonto), sum(opmonto-0), sum(0), sum(0), sum(0), sum(0) from gxopera.opmovi where opentid = '002' 
and opfecom = '20180222' and optiptar = 'DEB' and opcodtrn = '013000' and substr(opcomer,1,2)= '81' group by opfecom, opcodtrn, substr(optarj,1,6)


select * from libdebito.drconbep where lfectr = '20180218' and lnrtar = '6274311010035548'
and lnrtar = '6274311010035514' 

select * from libdebito.tgembhaf where crtarj = '6274311010035548' and 

select * from libdebito.facpaca where comerid = '100001'

select * from gxopera.factura2 where 


/*resumen diario por comercio*/


select   LICOMER AS COMERCIO, codeno as denominacion, CORAZO AS RAZON, LIFECHA AS FECHADEP, LITIPTAR AS REFE, LICANT AS CUPON, LIMONTO AS MONTO, (LICOENT +LICOBPS) AS COMISION, (LIIVAENT+LIIVABPS) AS IVASCOMI,
LIRENTA AS RETRENTA, LIREIVA AS IVARETEN, (LICOENT +LICOBPS+LIRENTA+LIREIVA+LIIVAENT+LIIVABPS) AS TOTDESC, LINETO AS IMPNETO, LIFECREDI AS FECHCRED,  lifechd AS FE
from gxopera.flicom1 
inner join gxbdbps.comaeaf
on (LICOMER = cocomer)
where corucn = '80016096-7'
and LIFECREDI = ''


select * --LNRTAR, lfectr, lhortr hora, LCOMTR , lcotel linea, lidcom comercio,lcodtr codtrx,  lcautr, lerrnb, LCODBC, lcretr, lesttr, limpgs  
from libdebito.drconbep 
where  lfectr = '20180302' and lcretr = 'XD'


 AND LCODTR = '902020'-- AND  LHORTR = '150731'
 AND LCOTEL = '0984291462'  --LIMPGS = '5000' 


SELECT * FROM GXBDBPS.COAFMAF 

SELECT * -- opferea , OPHOTRN , opcelu, opcodaut, opmonto, OPCOMI, OPCOMENT, OPCOMBPS, opcodtrn, opcomer, opcodres, opstatus, opliqde, OPNOREF
 FROM GXOPERA.OPMOVI WHERE  OPFEREA = '20180228'--AND OPNOREF = '804565783204'
-- OPCODAUT = '995651'
AND OPCELU LIKE '%0982214992%'


select * from libdebito.drconbep where lfectr = '20180302' and lenemi = '151'
select * from dcash.dc_cambios

update dcash.dc_cambios set vrelacion = 5538, fecha = ?05/03/17?  where idmoneda = 3 and aidmoneda = 1


/*reporte odulia para tigo*/
SELECT  opferea freal , OPHOTRN hora, substr(optarj,1,6)||'xxxxxx'|| substr(optarj,13,4) as Tarjeta, 
opcelu celular, opcodaut autorizacion, opmonto importe, 'GIRO' transaccion, opcomer codigocom, opcodres retorno, opstatus estado, OPNOREF referencia
 FROM GXOPERA.OPMOVI
 where substr(opferea,1,6) = '201801' and opcodtrn = '390000'
--substr(optarj,1,6)||'xxxxxx'|| substr(optarj,13,4) as Tarjeta










select TDABIN from gxopera.tdavistas where tdaanho = '2018' and tdamark = 'DCR'

select a.cocomer, codeno, codire2, b.locodi, lodesc, zonacodi, count(*)
from gxbdbps.coma2af a inner join gxbdbps.comaeaf b
on a.cocomer = b.cocomer inner join gxbdbps.colocaf c
on b.locodi = c.locodi inner join gxbdbps.coafmaf d
on a.cocomer = afcomer 
where coopstat = 0 and afstat = 0 --cocomer = '5400617' 
group by a.cocomer, codeno, codire2, b.locodi, lodesc, zonacodi



select * from libdebito.drconbep where 




/*VISA EN ATM DEL 2016*/
SELECT SUM(TDACANT) CANTIDAD, SUM(TDAIMPO) IMPORTE FROM GXOPERA.TDAVISTAS WHERE TDAANHO = '2016'
AND TDATIPO = 'T' AND TDAESTA = 'A' AND TDACORE = '00' AND TDAMARK = 'VSA'
/*OTRAS MARCAS EN ATM */
SELECT SUM(TDACANT) CANTIDAD, SUM(TDAIMPO) IMPORTE FROM GXOPERA.TDAVISTAS WHERE TDAANHO = '2016'
AND TDATIPO = 'T' AND TDAESTA = 'A' AND TDACORE = '00' AND TDAMARK <> 'VSA'

/*VISA EN ATM DEL 2017*/
SELECT SUM(TDACANT) CANTIDAD, SUM(TDAIMPO) IMPORTE FROM GXOPERA.TDAVISTAS WHERE TDAANHO = '2017'
AND TDATIPO = 'T' AND TDAESTA = 'A' AND TDACORE = '00' AND TDAMARK = 'VSA'
/*OTRAS MARCAS*/
SELECT SUM(TDACANT) CANTIDAD, SUM(TDAIMPO) IMPORTE FROM GXOPERA.TDAVISTAS WHERE TDAANHO = '2017'
AND TDATIPO = 'T' AND TDAESTA = 'A' AND TDACORE = '00' AND TDAMARK <> 'VSA'

/*VISA EN POS DEL 2016*/
SELECT SUM(TDACANT) CANTIDAD, SUM(TDAIMPO) IMPORTE FROM GXOPERA.TDAVISTAS WHERE TDAANHO = '2016'
AND TDATIPO <> 'T' AND TDAESTA = 'A' AND TDACORE = '00' AND TDAMARK = 'VSA'
/*OTRAS MARCAS EN POS DEL 2016*/
SELECT SUM(TDACANT) CANTIDAD, SUM(TDAIMPO) IMPORTE FROM GXOPERA.TDAVISTAS WHERE TDAANHO = '2016'
AND TDATIPO <> 'T' AND TDAESTA = 'A' AND TDACORE = '00' AND TDAMARK <> 'VSA'

/*VISA EN POS DEL 2017*/
SELECT SUM(TDACANT) CANTIDAD, SUM(TDAIMPO) IMPORTE FROM GXOPERA.TDAVISTAS WHERE TDAANHO = '2017'
AND TDATIPO <> 'T' AND TDAESTA = 'A' AND TDACORE = '00' AND TDAMARK = 'VSA'
/*OTRAS MARCAS EN POS DEL 2017*/
SELECT SUM(TDACANT) CANTIDAD, SUM(TDAIMPO) IMPORTE FROM GXOPERA.TDAVISTAS WHERE TDAANHO = '2017'
AND TDATIPO <> 'T' AND TDAESTA = 'A' AND TDACORE = '00' AND TDAMARK <> 'VSA'


/*2018*/
SELECT SUM(TDACANT) CANTIDAD, SUM(TDAIMPO) IMPORTE FROM GXOPERA.TDAVISTAS WHERE TDAANHO = '2018'
AND TDATIPO = 'T' AND TDAESTA = 'A' AND TDACORE = '00' AND TDAMARK = 'VSA' and tdames between '01' and '02'
/*OTRAS MARCAS EN ATM */
SELECT SUM(TDACANT) CANTIDAD, SUM(TDAIMPO) IMPORTE FROM GXOPERA.TDAVISTAS WHERE TDAANHO = '2018'
AND TDATIPO = 'T' AND TDAESTA = 'A' AND TDACORE = '00' AND TDAMARK <> 'VSA' and tdames between '01' and '02'

/*EN POS DEL 2018*/
SELECT SUM(TDACANT) CANTIDAD, SUM(TDAIMPO) IMPORTE FROM GXOPERA.TDAVISTAS WHERE TDAANHO = '2018'
AND TDATIPO <> 'T' AND TDAESTA = 'A' AND TDACORE = '00' AND TDAMARK = 'VSA' and tdames between '01' and '02'
/*OTRAS MARCAS EN POS */
SELECT SUM(TDACANT) CANTIDAD, SUM(TDAIMPO) IMPORTE FROM GXOPERA.TDAVISTAS WHERE TDAANHO = '2018'
AND TDATIPO <> 'T' AND TDAESTA = 'A' AND TDACORE = '00' AND TDAMARK <> 'VSA' and tdames between '01' and '02'



SELECT COUNT(*) CANTIDAD, SUM(LIMPGS) IMPORTE FROM LIBDEBITO.DRCONBEP 
WHERE SUBSTR(LFECTR,1,6) BETWEEN '201801' AND '201802' AND LESTTR = 'A' AND LCRETR = '60'
AND SUBSTR(LIDTRA,1,1) <> 'T' AND LCODBC = 'VSA' --AND LIDCOM <> '010001' AND LIMPGS > '1000'


SELECT COUNT(*) CANTIDAD FROM LIBDEBITO.DRCONBEP 
WHERE SUBSTR(LFECTR,1,6) BETWEEN '201801' AND '201802' AND LESTTR = 'A' AND LCRETR = '60'
AND SUBSTR(LIDTRA,1,1) = 'T' 


select hmnomco descripcion, hmferea fechareal,HMEMISO, ennombr, (substr(hmnumta,1,6)||'XXXXXX'||substr(hmnumta,13,4 )) as Nro_Tarjetas, cenumdo as Documento, mtnopla as Nombre_Apellido, sum(hmimpo2) as Interes_compensatorio
from gxbdbps.thmovaf a inner join gxbdbps.tmtaraf b on a.hmnumta = b.mtnumta
inner join gxbdbps.gentiaf c on b.enemiso = c.enemiso
where hmemiso = '307' and hmcodig = '150'
and substr(hmfepro,1,4)= '2017'
--and cenumdo in ( '778448', '364476', '699875'	, '614767')
group by hmnomco,hmferea, HMEMISO, ennombr, hmnumta, cenumdo, mtnopla

SELECT * FROM GXOPERA.OPMOVI WHERE OPFEREA = '20180307'



select substr(lfectr,1,6) fecha, COUNT(*) CANTIDAD 
from libdebito.drconbep 
where  SUBSTR(lfectr,5,2) =  MONTH (NOW() - 2 MONTH) /*MES ANTERIOR*/
and SUBSTR(lfectr,1,4) =  YEAR(NOW()-1 year) /*AÑO ACTUAL*/
and lcodbc = 'VSA' AND LCRETR = '00' AND LESTTR = 'A'
AND LCODTR in ('011000', '012000', '013000')  AND SUBSTR(LIDTRA,1,1) = 'T'
and lbinpr = '425936' AND LENEMI IN ('500', '510')
group by substr(lfectr,1,6)


SELECT BINES, TIPOTRX, SUM(C1) CANT1, SUM(I1) IMP1, SUM(C2) CANT2, SUM(I2) IMP2 FROM (
select  tdabin bines, 'EXTRACCIONES' TIPOTRX, sum(tdacant) c1, sum(tdaimpo) I1 , 0 C2, 0 I2 
from gxopera.tdavistas where 
tdaanho = YEAR(NOW()-1 year) 
and tdames = MONTH (NOW() - 2 MONTH) 
and tdamark = 'VSA' AND TDACORE = '00' and  TDAESTA = 'A'
AND TDACOTR IN ('011000', '012000', '013000')
AND TDAENTI IN ('500', '510') and TDATIPO = 'T'   and TDABIN in ('425935','425936', '443076', '443077', '443078')
group by tdabin
UNION
select  tdabin bines, 'CONSULTAS' TIPOTRX, sum(tdacant) c1, sum(tdaimpo) i1, 0 C2, 0 I2  from gxopera.tdavistas where 
tdaanho = YEAR(NOW()-1 year) 
and tdames = MONTH (NOW() - 2 MONTH) 
and tdamark = 'VSA' AND TDACORE = '00' and  TDAESTA = 'A'
AND TDACOTR IN ('311000', '311100', '312000', '312100', '313000', '313100', '314000', '314001' )
AND TDAENTI IN ('500', '510') and TDATIPO = 'T'   and TDABIN in ('425935','425936', '443076', '443077', '443078')
group by tdabin
UNION
/*RECHAZADAS*/
select  tdabin bines, 'EXTRACCIONES' TIPOTRX, 0 C1, 0 I1, sum(tdacant) C2,   sum(tdaimpo) I2
from gxopera.tdavistas where 
tdaanho = YEAR(NOW()-1 year) 
and tdames = MONTH (NOW() - 2 MONTH) 
and tdamark = 'VSA' AND TDACORE <> '00'
AND TDACOTR IN ('011000', '012000', '013000')
AND TDAENTI IN ('500', '510') and TDATIPO = 'T'   and TDABIN in ('425935','425936', '443076', '443077', '443078')
group by tdabin
UNION
select  tdabin bines, 'CONSULTAS' TIPOTRX, 0 c1, 0 i1,  sum(tdacant) C2,   sum(tdaimpo) I2  from gxopera.tdavistas where 
tdaanho = YEAR(NOW()-1 year) 
and tdames = MONTH (NOW() - 2 MONTH) 
and tdamark = 'VSA' AND TDACORE <> '00' 
AND TDACOTR IN ('311000', '311100', '312000', '312100', '313000', '313100', '314000', '314001' )
AND TDAENTI IN ('500', '510') and TDATIPO = 'T'   and TDABIN in ('425935','425936', '443076', '443077', '443078')
group by tdabin ) AS X
GROUP BY BINES, TIPOTRX





/*NESTOR*/

SELECT tdabin, sum(tdacant) C2,   sum(tdaimpo) I2 FROM  gxopera.tdavistas
where  tdaanho = '2017' and tdames = '01' and tdamark = 'VSA' AND TDACORE <> '00'  --and  TDAESTA = 'A'
AND TDACOTR IN ('011000', '012000', '013000')
--and tdacotr in ('311000', '311100', '312000', '312100', '313000', '313100', '314000', '314001')
AND TDAENTI IN ('500', '510') and TDATIPO = 'T'   and TDABIN in ('425935','425936', '443076', '443077', '443078')
group by tdabin










SELECT tdames, tdaanho,BINES, TIPOTRX, SUM(C1) CANT1, SUM(I1) IMP1, SUM(C2) CANT2, SUM(I2) IMP2 FROM (
select tdames, tdaanho, tdabin bines, 'EXTRACCIONES' TIPOTRX, sum(tdacant) c1, sum(tdaimpo) I1 , 0 C2, 0 I2 
from gxopera.tdavistas where 
tdaanho = YEAR(NOW()) 
and tdames = MONTH (NOW() - 1 MONTH) 
and tdamark = 'VSA' AND TDACORE = '00' and  TDAESTA = 'A'
AND TDACOTR IN ('011000', '012000', '013000')
AND TDAENTI IN ('500', '510') and TDATIPO = 'T'   and TDABIN in ('425935','425936', '443076', '443077', '443078')
group by tdames, tdaanho,tdabin
UNION
select tdames, tdaanho, tdabin bines, 'CONSULTAS' TIPOTRX, sum(tdacant) c1, sum(tdaimpo) i1, 0 C2, 0 I2  from gxopera.tdavistas where 
tdaanho = YEAR(NOW()) 
and tdames = MONTH (NOW() - 1 MONTH) 
and tdamark = 'VSA' AND TDACORE = '00' and  TDAESTA = 'A'
AND TDACOTR IN ('311000', '311100', '312000', '312100', '313000', '313100', '314000', '314001' )
AND TDAENTI IN ('500', '510') and TDATIPO = 'T'   and TDABIN in ('425935','425936', '443076', '443077', '443078')
group by tdames, tdaanho, tdabin
UNION
/*RECHAZADAS*/
select tdames, tdaanho, tdabin bines, 'EXTRACCIONES' TIPOTRX, 0 C1, 0 I1, sum(tdacant) C2,   sum(tdaimpo) I2
from gxopera.tdavistas where 
tdaanho = YEAR(NOW()) 
and tdames = MONTH (NOW() - 1 MONTH) 
and tdamark = 'VSA' AND TDACORE <> '00'
AND TDACOTR IN ('011000', '012000', '013000')
AND TDAENTI IN ('500', '510') and TDATIPO = 'T'   and TDABIN in ('425935','425936', '443076', '443077', '443078')
group by tdames, tdaanho,tdabin
UNION
select tdames, tdaanho, tdabin bines, 'CONSULTAS' TIPOTRX, 0 c1, 0 i1,  sum(tdacant) C2,   sum(tdaimpo) I2  from gxopera.tdavistas where 
tdaanho = YEAR(NOW()) 
and tdames = MONTH (NOW() - 1 MONTH) 
and tdamark = 'VSA' AND TDACORE <> '00' 
AND TDACOTR IN ('311000', '311100', '312000', '312100', '313000', '313100', '314000', '314001' )
AND TDAENTI IN ('500', '510') and TDATIPO = 'T'   and TDABIN in ('425935','425936', '443076', '443077', '443078')
group by tdames, tdaanho,tdabin ) AS X
GROUP BY tdames, tdaanho,BINES, TIPOTRX
ORDER BY BINES, TIPOTRX DESC


select * -- lfectr fecha, lhortr hora, lerrnb referencia, lcautr autoriza, lnrtar tarjeta, lhisde destino, 
--lcomtr comercio, limpgs importe, lcretr retorno, lesttr estado, lcodtr tipotrx
from libdebito.drconbep where lfectr >= '20171201' AND LCODTR IN ('524000', '520000', '510000', '514000')
AND LBINPR NOT IN  ('627431', '703002')  AND LCRETR = '00' AND LESTTR = 'A'
 

select count(*) cantidad from libdebito.drconbep 
where substr(lfectr,1,6) >= '201712'  and substr(lfectr,1,6) <= '201802'
AND LCODTR IN ('524000', '520000', '510000', '514000')  and 
/*REPORTE ELIZABETH DELGADO*/
select OPCOMER CODIGOCOMER, CODENO DENOMINACION, OPFEREA FECHAREAL, OPMONTO IMPORTE, OPCOMENT COMIENTIDAD,OPCOMBPS COMBPSA, 'COMPRA DE MINUTOS/SIN TARJETA' AS TRX
from gxopera.opmovi INNER JOIN GXBDBPS.COMAEAF ON (OPCOMER=COCOMER )
where  SUBSTR(opferea,1,6)  = '201802'--between '201801' and '201801' 
and  opcodtrn  in ('514000', '524000') and opcodres = '00' and opstatus = 'A' AND OPCOMER = '0800378'
UNION
select OPCOMER CODIGOCOMER, CODENO DENOMINACION, OPFEREA FECHAREAL, OPMONTO IMPORTE, OPCOMENT COMIENTIDAD,OPCOMBPS COMBPSA, 'PAGO DE FACTURA' AS TRX
from gxopera.opmovi INNER JOIN GXBDBPS.COMAEAF ON (OPCOMER=COCOMER )
where  SUBSTR(opferea,1,6)  = '201802'
and  opcodtrn  in ('524000') and opcodres = '00' and opstatus = 'A' AND OPCOMER = '0800378' 

/*VERIFICAICON - VENTA MIN*/
select COUNT(*) CANTI,SUM(OPMONTO) IMPORTE, OPCODTRN
--OPCOMER CODIGOCOMER, CODENO DENOMINACION, OPFEREA FECHAREAL, SUM(OPMONTO) IMPORTE, OPCOMENT COMIENTIDAD,OPCOMBPS COMBPSA, 'COMPRA DE MINUTOS' AS TRX
 from gxopera.opmovi-- INNER JOIN GXBDBPS.COMAEAF ON (OPCOMER=COCOMER )
 where  SUBSTR(opfeREA,1,6)  = '201802'--between '201801' and '201801' 
and  opcodtrn  in ('514000', '524000')  and opcodres = '00' and opstatus = 'A'  
AND OPCOMER = '0800378'
GROUP BY OPCODTRN







select distinct(tdaanho) from gxopera.tdavistas where tdaanho >= '2000'
select distinct(substr(lfectr,1,4)) from libdebito.drconbep  where substr(lfectr,1,4) >= '2000'

Select TDACANT as cont1, TDAIMPO, TDACORE   
from gxopera.tdavistas INNER JOIN gxopera.meses on tdames = mes
WHERE TDAANHO =  '2018'
and tdamark  = 'BIL' and tdaenti = '571' and tdacotr = '567101' --PERSONAL ENVIO
and TDAMES BETWEEN '01' and '03'
and tdaMARK <> '   'and tdamark not in ('AUD','*ND')
and tdacore <> '92' and tdacore <> '00'
 AND TDATIPO = 'T'
AND tdaimpo >= 0
Group by TDACORE, TDAIMPO, TDACORE 


SELECT count(*), lcretr FROM LIBDEBITO.DRCONBEP WHERE LCRETR <> '00' AND LCODTR = '567101' AND LFECTR >= '20180101'
group by lcretr
6274315715676020
6274315715676020

select * from gxbdbps.corpraf
/*ACTIVACIONES DE POS - YOLANDA*/
select  affinst fechainsta, afcomer codigocomer,afcodi codactivo, /*costat estado,*/ x.aftidesc tipoactivof ,  rprename RRCC, /*codeno denominacion,*/afmonto montoalq , AFFEFACT fechaFACTURA
from gxbdbps.coafmaf  d inner join gxbdbps.comaeaf f on afcomer=cocomer
inner join gxbdbps.COAFTAF x on  d.afticodi = x.afticodi
inner join gxbdbps.corpraf on f.rprecod = rprecodi
where affinst between '20180101' and '20180131'
order by affinst


/*REPORTE LAURA SANCHEZ*/
SELECT lfectr freal, substr(lidtra,1,1) Dispo, lcodbc tipo, lbinpr bin, lcodtr codtrx, lesttr estado, lcretr retorno, COUNT(*) CANTIDAD, sum(limpgs) importe 
FROM LIBDEBITO.DRCONBEP 
WHERE LFECTR BETWEEN '20180201' AND '20180228' 
AND  LCRETR = '00' AND LBINPR = '703002' AND LENEMI = '002' --AND LCODTR = '000054'
GROUP BY lfectr, substr(lidtra,1,1), lcodbc, lbinpr,  LCODTR, lesttr, lcretr
order by lfectr

/*REPAIRS MIRIAN*/
SELECT * FROM GXBDBPS.COMAEAF WHERE CORUCN = '80081566-1' and costat = '0'

SELECT * FROM LIBDEBITO.DRCONBEP WHERE LIDCOM IN ('1301255', '1301256') 


select * from  libdebito.TBCTRA0P




select * -- a.enemiso CODIGO,entbina ENTIDAD, count(MTNUMTA)CANTIDAD, COUNT(DISTINCT CENUMDO) CANTUSUARIO, mclimco+mclimcu LINEACREDITO, mcsafac+mcsfnve+mcsalfi+mccuope+mcadepe+mcrefpe SALDO 
from gxbdbps.tmtaraf a
inner join gxbdbps.tmctaaf b on a.mcnumct=b.mcnumct
inner join gxopera.opentid1 on a.enemiso = entcodi
where a.enemiso= '319'
and mtstats<>'3'
and mtfecre <= '20180228'
group by a.enemiso,entbina,  mclimco+mclimcu, mcsafac+mcsfnve+mcsalfi+mccuope+mcadepe+mcrefpe





SELECT LIDCOM CODCOMERCIO, LCOMTR COMERCIO, LNRTAR TARJETA, lfectr freal, substr(lidtra,1,1) Dispo, lcodbc tipo, lbinpr bin, lcodtr codtrx, txdtrx desc, lesttr estado, lcretr retorno, COUNT(*) CANTIDAD, sum(limpgs) importe 
FROM LIBDEBITO.DRCONBEP 
inner join  libdebito.TBCTRA0P on lcodtr  = txctrx
WHERE LFECTR BETWEEN '20180201' AND '20180228'
AND  LCRETR = '00' AND LBINPR = '703002' AND LENEMI = '002' AND LCODTR = '013000' and lesttr = 'Q'
GROUP BY LIDCOM, LCOMTR, LNRTAR, lfectr, substr(lidtra,1,1), lcodbc, lbinpr,  LCODTR, txdtrx, lesttr, lcretr
order by lfectr


select LENEMI ENTIDAD, SUM(LIMPGS) from libdebito.drconbep where lfectr = '20171206' 
and lidcom = '8100177' and lcretr = '00' and lesttr= 'A'
GROUP BY LENEMI


select * from gxopera.opmovi where opferea  between '20180201'  and '2018022' and opcodtrn = '000054'

select * --TDAMARK AS MARCA, TDACOTR CODT, tdaenti ENTI, SUM(TDACANT)  AS ENE, SUM(TDAIMPO) IMPO1, 0 AS FEB, 0 IMPO2 ,0 AS MAR, 0 IMPO3, 0 AS ABR, 0 IMPO4, 0 AS MAY, 0 IMPO5, 0 AS JUN, 0 IMPO6, 0 AS JUL, 0 IMPO7, 0 AS AGO, 0 IMPO8,0 AS SEP, 0 IMPO9, 0 AS OCT, 0 IMPO10, 0 AS NOV, 0 IMPO11, 0 AS DIC , 0 IMPO12
from gxopera.tdavistas
INNER JOIN GXBDBPS.COMAEAF
ON (TDACOME = COCOMER )
where tdames = '02'
AND TDAANHO =  '2018'
AND CORUCN NOT IN ( '80011012-9')
and tdatipo = 'G'
AND TDACOTR IN  ('000054')
AND SUBSTR(TDACOME, 1,2) NOT IN  ('45', '80', '81', '86')
AND TDAESTA = 'A'
AND TDAMARK IN ('DEB' ) 
GROUP BY  TDAMARK, TDACOTR, tdaenti 

select * from libdebito.
 SELECT * FROM LIBDEBITO.log2014drc WHERE LIDCOM IN ('1301255','1301256')
SELECT  * FROM 	YAPI.LOG2014DRC  WHERE LIDCOM IN ('1301255','1301256')
SELECT * FROM  YAPI.LOG2015DRC WHERE LIDCOM IN ('1301255','1301256')

select * from gxopera.tdavistas where tdacome in ('1301255','1301256')
 
select DISTINCT substr(lfectr,1,4) from libdebito.drconbep where substr(lfectr,1,4) >= '2010'

select OPCOMER AS COMERCIO, CORUCN AS RUC,  ZONADESC AS ZONA, OPSTATUS AS ESTADOTRX,  RPRENAME AS REPRESENT , CODENO AS DENOMINACION, OPCODTRN AS TRX,  OPFECOM AS FECHA, OPHOTRN AS HORA, OPMONTO AS IMPORTE,  OPNOREF AS REFERENCIA, OPCELU AS CELULAR, SUBSTR(LCTADE,8,9) AS REFTigo
 from gxopera.opmovi
 INNER JOIN GXBDBPS.COMAEAF A ON (OPCOMER = COCOMER)
 inner join gxbdbps.cozonaf d
on a.zonacodi = d.zonacodi
INNER JOIN gxbdbps.corpraf  ON (RPRECOD = RPRECODI)
INNER JOIN libdebito.drconbep ON (OPCOMER = substr(digits(lidcom), 6, 7) AND OPNOREF = LERRNB AND OPCODAUT = LCAUTR)
  WHERE OPCODTRN IN ('370000', '380000', '390000')
  AND SUBSTR(OPCOMER,1,2) not IN ('45', '79', '80', '81', '86', '90')
  AND OPSTATUS = 'A'
  AND OPCODRES = '00'
  and  SUBSTR(LCTADE,8,9)  = '219888334'
   and substr(opferea, 1,4) = '2018'
AND SUBSTR(OPFErea,5,2) BETWEEN '02' AND '02'
ORDER BY OPFECOM , OPHOTRN 


select lctaor origen, lctade reftigo, lnrtar tarjeta, lidcom codigocome, lcomtr comercio, lcodtr trx, lcodbc marca, lcretr retorno, lesttr estado, lerrnb refbepsa, lfectr fecha, limpgs importe
 from libdebito.drconbep where lfectr 
between '20180201' and '20180216' and lcodtr = '390000' -- and LCTADE like '%222087558%'
and lhortr = '135006'


select * from gxopera.opmovi where opcodtrn = '390000' and opferea = '20180216' and opcomer = '1001074'


SELECT  BS15USUUPD USUARIO, afticodi as tipo,BS15FECLIM AS FECHALIM, BS15CODCOM AS CODIGO, CODENO AS DENOMINACION, CORAZO AS RAZONSOCIAL, CODIRE1 AS DIRECCION, LODESC, COTELN AS TELEFONO,  CORUCN AS NRORUC, RPRENAME AS REPRESENT , ZONADESC 
FROM LIBDEBITO.BST015
INNER JOIN GXBDBPS.COMAEAF A ON LTRIM(BS15CODCOM) = COCOMER
inner join gxbdbps.colocaf c
on A.locodi = C.locodi
INNER JOIN gxbdbps.corpraf  ON (RPRECOD = RPRECODI)
inner join gxbdbps.cozonaf d
on a.zonacodi = d.zonacodi
inner join gxbdbps.coafmaf on (afcomer = cocomer )
WHERE SUBSTR(BS15FECLIM, 1,4) = 2017
AND COCOMER <> '0100001'
AND SUBSTR(BS15FECLIM, 5,2) BETWEEN 01 AND 12
AND SUBSTR(COCOMER,1,2) NOT IN ('45', '79', '80', '81', '86', '90')


/*agregar tipo de adhesion*/
select  substr(cofecalt, 7, 2)||'/'||substr(cofecalt, 5, 2)||'/'||substr(cofecalt, 3, 2) FECHA
,A.COCOMER  CODIGO,CODENO DENOMINACION, CORAZO RAZON_SOCIAL, CODIRE1 DIRECCION,LODESC LOCALIDAD, CORUCN RUC,
 COTELN TELEFONO, RPRENAME REPRESENTANTE, TIADCODI TIPO, ZONADESC ZONA, E.ACOBS DESCRIPCION
from    GXBDBPS.COMAEAF A
        INNER JOIN GXBDBPS.COLOCAF b ON A.LOCODI = B.LOCODI
        INNER JOIN GXBDBPS.CORPRAF c ON A.RPRECOD = C.RPRECODI
        INNER JOIN GXBDBPS.COZONAF d ON A.ZONACODI = D.ZONACODI
        LEFT JOIN GXBDBPS.ADCONT E  ON A.COCOMER =  E.COCOMER
where   substr(cofecalt , 1 , 4) =  2018
    and substr(cofecalt , 5 , 2) between 01 and  01
        and A.cocomer not like  '90%'
order by COFECALT, A.COCOMER

select * from GXBDBPS.ADCONT
select * from gxbdbps.coafmaf where afcomer = '1001653'
select * from gxbdbps.comaeaf where cocomer = '1001653'


select * from libdebito.drconbep where lfectr in ('20180326', '20180327') and lcretr in ('91','92') and lcodbc = 'VSA'

SELECT * FROM GXOPERA.TDAVISTAS WHERE  tdatipo = 'D'

select  c.coddto, codtodesc,  tdamark, tdacotr, b.tdatipo TIPO,  sum(tdacant) as cant, sum(tdaimpo) as Importe
FROM GXBDBPS.comaeaf a inner join gxopera.tdavistas b
on cocomer = tdacome
inner join gxbdbps.colocaf c
on a. locodi = c.locodi
inner join gxbdbps.codtoaf e
on c.coddto = e.coddto
where b.tdacore  = '00'
AND b.tdatipo IN ( 'P', 'G', 'V', 'D')
and substr(b.tdacome,1,2) not in ('90')
AND tdacotr IN ('000052','000054', '567102')
AND TDABIN IN ('703002', '627431')
and b.tdaanho = '2018'
and b.tdames between '01' and '01'
group by c.coddto, codtodesc,  tdamark, tdacotr, b.tdatipo


select * from gxopera.flicom where  linro = '12196' and licomer = '8100151'
delete  from gxopera.flicom where  linro = '12196' and licomer = '8100151'

select * from gxopera.flicom1 where licomer = '8100151' AND LIFECREDI = '20180402' 
delete from gxopera.flicom1 where licomer = '8100151' AND LIFECREDI = '20180402' 
select sum(lineto) from gxopera.flicom1 where linroins = '12196' and licomer <> '8100151'

select * from gxopera.opago1phis where pgfecre = '20180402' and pgcomer = '8100177' and pgidtrn = '180328731017'
delete from  gxopera.opago1p where pgfecre = '20180402' and pgcomer = '8100151' and pgidtrn = '180328731017'


select *
from gxopera.opago1phis where pgfecre = '20180402'  and pgentid = '002' and pgtipo = 'D'
group by pgtipo--and pgcomer = '8100151'  --and pgidtrn = '180328731017'



/*REPORTES GERENCIALES*/
SELECT  'APROBADAS' AS RETORNO, TDAANHO, TDAMES, TDAMARK,TDABIN, SUM(TDACANT) CANTIDAD, SUM(TDAIMPO) IMPORTE 
FROM GXOPERA.TDAVISTAS WHERE TDAANHO = '2018' AND TDAMES = '02' 
AND TDACOTR  IN ('011000','012000', '013000', '014000') AND TDACORE = '00'
AND TDABIN IN ('627431', '703002') AND TDATIPO IN ('T', 'P') -- AND TDAMARK IN ('DEB', 'DIN')
GROUP BY TDAANHO, TDAMES, TDAMARK, TDABIN
UNION 
SELECT 'RECHAZADAS' AS RETORNO, TDAANHO, TDAMES, TDAMARK,TDABIN, SUM(TDACANT) CANTIDAD, SUM(TDAIMPO) IMPORTE 
FROM GXOPERA.TDAVISTAS WHERE TDAANHO = '2018' AND TDAMES = '02' 
AND TDACOTR  IN ('011000','012000', '013000', '014000') AND TDACORE <> '00'
AND TDABIN IN ('627431', '703002') AND TDATIPO IN ('T', 'P') -- AND TDAMARK IN ('DEB', 'DIN')
GROUP BY TDAANHO, TDAMES, TDAMARK, TDABIN


SELECT mclimco+mclimcu LINEACREDITO FROM GXBDBPS.TMTARAF
inner join gxbdbps.tmctaaf b on a.mcnumct=b.mcnumct

from gxbdbps.tmtaraf a
SELECT * FROM gxbdbps.tmctaaf b on a.mcnumct=b.mcnumct



select partiptar, a.enemiso, ennombr, count(*),  SUM(mclimco+mclimcu) LINEACREDITO
from gxbdbps.tmtaraf a inner join gxbdbps.tafipar b
on (a.enemiso = parene and afafini = parafini)
inner join gxbdbps.tmctaaf D on a.mcnumct=D.mcnumct
inner join gxbdbps.gentiaf c
on a.enemiso = c.enemiso
where partiptar in ('CR','PP')
and mtstats = '1'
and blcodig = '00'
and substr(mtfeemi,1,6) <= '201804'
and mtfeven >=substr(('201804'),3,4)
and a.enemiso not in ('151','155','153')
group by partiptar, a.enemiso, ennombr
union
select 'BS', a.enemiso, ennombr,count(*)
from gxbdbps.tmtaraf a inner join gxbdbps.tafipar b
on (a.enemiso = parene and afafini = parafini)
inner join gxbdbps.gentiaf c
on a.enemiso = c.enemiso
where partiptar in ('CR','PP')
and mtstats = '1'
and blcodig = '00'
and substr(mtfeemi,1,6) <= '{?Fch}'
and mtfeven >=substr(('{?Fch}'),3,4)
and a.enemiso in ('151','155','153')
group by 'BS', a.enemiso, ennombr




/***********************/
select partiptar, a.enemiso, ennombr,count(*),  SUM(mclimco+mclimcu) LINEACREDITO, SUM(mcsafac+mcsfnve+mcsalfi+mccuope+mcadepe+mcrefpe) SALDO
from gxbdbps.tmtaraf a inner join gxbdbps.tafipar b
on (a.enemiso = parene and afafini = parafini)
inner join gxbdbps.gentiaf c
on a.enemiso = c.enemiso
inner join gxbdbps.tmctaaf D on a.mcnumct=D.mcnumct
where partiptar in ('CR','PP')
and mtstats = '1'
and blcodig = '00'
and substr(mtfeemi,1,6) <= '201804'
and mtfeven >=substr(('201804'),3,4)
and a.enemiso not in ('151','155','153')
group by partiptar, a.enemiso, ennombr
union
select 'BS', a.enemiso, ennombr,count(*),   SUM(mclimco+mclimcu) LINEACREDITO
from gxbdbps.tmtaraf a inner join gxbdbps.tafipar b
on (a.enemiso = parene and afafini = parafini)
inner join gxbdbps.gentiaf c
on a.enemiso = c.enemiso
inner join gxbdbps.tmctaaf D on a.mcnumct=D.mcnumct
where partiptar in ('CR','PP')
and mtstats = '1'
and blcodig = '00'
and substr(mtfeemi,1,6) <= '201804'
and mtfeven >=substr(('201804'),3,4)
and a.enemiso in ('151','155','153')
group by 'BS', a.enemiso, ennombr
UNION
select 'TD',AKENTI, ennombr,count(*), 0 AS LINEACREDITO
from gxbdbps.drmaeaf a inner join gxbdbps.tafipar b
on (akenti = parene )
inner join gxbdbps.gentiaf c
on akenti = c.enemiso
inner join gxbdbps.tmctaaf D on a.mcnumct=D.mcnumct
where  akaicd = '00'
and substr(akaeda,1,6) <= '201804'
and akafnb >=substr(('201804'),3,4)
group by 'TD', AKENTI, ennombr


/*original*/
SELECT * -- substr(FAC.FACFECH, 1, 4) a ,concat(concat(concat(substr(fac.facvenc,7,2),'/'),concat(substr(fac.facvenc,5,2),'/')),substr(fac.facvenc,1,4)) as vence , sum(FAC.FACSALDO) c
FROM GXOPERA.FACTURA FAC
INNER JOIN GXBDBPS.COMAEAF ON FAC.FACLIEN = COCOMER
WHERE FAC.FACFECH <=   '20180331'
    AND (FAC.FACTACBLE = '101031000000005' or FAC.FACTACBLE = '101031000000015' or FAC.FACTACBLE = '101031000000025')
    and FAC.FACTIPO = 'CR'
    and FAC.FACSTATUS = 'P'
   AND FAC.factnro <> 0 
   AND COSTAT ='0'  --estado= 0 (Activo) = 90 (baja) = 30 (Suspendido)
group by substr(FAC.FACFECH, 1, 4) ,concat(concat(concat(substr(fac.facvenc,7,2),'/'),concat(substr(fac.facvenc,5,2),'/')),substr(fac.facvenc,1,4)) 
/*FACTUTAS PENDIENTES DE COBRO POR TRAMOS */
SELECT * --fartdesc,FAC.FACTACBLE,FAC.FACLIEN,substr(FAC.FACFECH, 1, 8) a ,concat(concat(concat(substr(fac.facvenc,7,2),'/'),concat(substr(fac.facvenc,5,2),'/')),substr(fac.facvenc,1,4)) as vence , sum(FAC.FACSALDO) c
FROM GXOPERA.FACTURA FAC
INNER JOIN GXBDBPS.COMAEAF ON FAC.FACLIEN = COCOMER
INNER JOIN GXOPERA.FACTURA1  F1 ON (F1.factnro = FAC.factnro AND F1.FACTIMBR = FAC.FACTIMBR AND F1.FARTCODI= 1 and F1.FACTIPO = 'CR')
WHERE FAC.FACFECH <=  '20180331'
    AND (FAC.FACTACBLE = '101031000000005' or FAC.FACTACBLE = '101031000000015' or FAC.FACTACBLE = '101031000000025')
    and FAC.FACTIPO = 'CR'
    and FAC.FACSTATUS = 'P'
   AND FAC.factnro <> 0 
 and fac.faclien <> '4500006'
   AND COSTAT ='0'  --estado= 0 (Activo) = 90 (baja) = 30 (Suspendido)
group by fartdesc,FAC.FACTACBLE,FAC.FACLIEN, substr(FAC.FACFECH, 1, 8) ,concat(concat(concat(substr(fac.facvenc,7,2),'/'),concat(substr(fac.facvenc,5,2),'/')),substr(fac.facvenc,1,4)) 

/********************/
SELECT  substr(FAC.FACFECH, 1, 8) a ,concat(concat(concat(substr(fac.facvenc,7,2),'/'),concat(substr(fac.facvenc,5,2),'/')),substr(fac.facvenc,1,4)) as vence , sum(FAC.facsaldo) c
FROM GXOPERA.FACTURA FAC
INNER JOIN GXBDBPS.COMAEAF ON FAC.FACLIEN = COCOMER
INNER JOIN GXOPERA.FACTURA1  F1 ON (F1.factnro = FAC.factnro AND F1.FACTIMBR = FAC.FACTIMBR AND F1.FARTCODI= 1 and F1.FACTIPO = 'CR')
WHERE FAC.FACFECH <=   '20180331'
    AND (FAC.FACTACBLE = '101031000000005' or FAC.FACTACBLE = '101031000000015' or FAC.FACTACBLE = '101031000000025')
    and FAC.FACTIPO = 'CR'
    and FAC.FACSTATUS = 'P'
   AND FAC.factnro <> 0 
   AND COSTAT ='0'  --estado= 0 (Activo) = 90 (baja) = 30 (Suspendido)
group by substr(FAC.FACFECH, 1, 8) ,concat(concat(concat(substr(fac.facvenc,7,2),'/'),concat(substr(fac.facvenc,5,2),'/')),substr(fac.facvenc,1,4)) 

SELECT fartdesc descripcion,FAC.FACTACBLE,FAC.FACFECH,FAC.FACLIEN, substr(FAC.FACFECH, 1, 4) a ,concat(concat(concat(substr(fac.facvenc,7,2),'/'),concat(substr(fac.facvenc,5,2),'/')),substr(fac.facvenc,1,4)) as vence , sum(FAC.FACSALDO) c
FROM GXOPERA.FACTURA FAC
INNER JOIN GXBDBPS.COMAEAF ON FAC.FACLIEN = COCOMER
INNER JOIN GXOPERA.FACTURA1  F1 ON (F1.factnro = FAC.factnro AND F1.FACTIMBR = FAC.FACTIMBR AND F1.FARTCODI= 1 and F1.FACTIPO = 'CR')
WHERE FAC.FACFECH <=  '20180331'
    AND (FAC.FACTACBLE = '101031000000005' or FAC.FACTACBLE = '101031000000015' or FAC.FACTACBLE = '101031000000025')
    and FAC.FACTIPO = 'CR'
    and FAC.FACSTATUS = 'P'
   AND FAC.factnro <> 0 
   AND COSTAT ='0'  --estado= 0 (Activo) = 90 (baja) = 30 (Suspendido)
group by fartdesc, FAC.FACTACBLE,FAC.FACFECH, FAC.FACLIEN, substr(FAC.FACFECH, 1, 4) ,concat(concat(concat(substr(fac.facvenc,7,2),'/'),concat(substr(fac.facvenc,5,2),'/')),substr(fac.facvenc,1,4)) 

/*FACTURACION Y COBRANZA*/
select a,mesnombre,sum(b) "cobranza",sum(c) "Factura", (sum(c)-sum(b)) "Saldo"
from(
select  substr(COMFEREAL, 1, 4) a,   sum(COMIMPOR) b, sum(0)c, mes,mesnombre
             from    gxopera.fcobros
             inner join
             ( select  a.factnro FNRO, a.factimbr FTIMBRE, a.factotal FIMP, a.facsaldo FSAL, a.facstatus FSTAT, facfech FECH
               from    gxopera.factura a  inner join gxopera.factura1 b
               on a.factipo =  b.factipo and a.factnro = b.factnro and a.factimbr = b.factimbr
               where   /*a.facfech >= '20140101'/*::FechaDesde  and ::FechaHasta*/
               and */b.fartcodi = 1 and a.factipo = 'CR' and a.facstatus <> 'A' and a.faclien <> '4500006' ) FAC
               on comnro = fac.fnro and comtimbr = FAC.FTIMBRE
               INNER JOIN GXOPERA.MESES ON SUBSTR(COMFEREAL,5,2) = MES
             where   comstatus <> 'A'
             and comfereal between {?FechaDesde} and {?FechaHasta}/*<= ::FechaHasta */
          group by substr(COMFEREAL, 1, 4),mes,mesnombre
union
SELECT substr(FAC.FACFECH, 1, 4) a , sum(0) b, sum(FAC.FACTOTAL) c ,mes, mesnombre
FROM GXOPERA.FACTURA FAC
INNER JOIN GXOPERA.FACTURA1  F1 ON (F1.factnro = FAC.factnro AND F1.FACTIMBR = FAC.FACTIMBR AND F1.FARTCODI= 1 and F1.FACTIPO = 'CR')
INNER JOIN GXOPERA.MESES ON SUBSTR(FACFECH,5,2) = MES
WHERE FAC.FACFECH >= {?FechaDesde}
and FAC.FACFECH <= {?FechaHasta}
    and FAC.FACTIPO = 'CR'
and fac.faclien <> '4500006'
    and FAC.FACSTATUS <> 'A'
group by substr(FAC.FACFECH, 1, 4),mesnombre,mes
) ab
group by a, mes,mesnombre
order by a,mes

/*COBRANZA POR TRAMOS*/
select  comrecnro,concat(concat(concat(substr(COMFEREAL,7,2),'/'),concat(substr(COMFEREAL,5,2),'/')),substr(COMFEREAL,1,4)) as fcobro,fechafac AS ffactura,   sum(COMIMPOR) b, sum(0)c, mes,mesnombre
from    gxopera.fcobros
inner join
             ( select a.factnro FNRO, a.factimbr FTIMBRE, a.factotal FIMP, a.facsaldo FSAL, a.facstatus FSTAT, facfech FECH,concat(concat(concat(substr(FACFECH,7,2),'/'),concat(substr(FACFECH,5,2),'/')),substr(FACFECH,1,4)) as fechafac

               from    gxopera.factura a  inner join gxopera.factura1 b
               on a.factipo =  b.factipo and a.factnro = b.factnro and a.factimbr = b.factimbr
               where  b.fartcodi = 1 and a.factipo = 'CR' and a.facstatus <> 'A'  --AND A.FACFECH BETWEEN '{?DESDE}' AND '{?HASTA}' 
 ) FAC
               on comnro = fac.fnro  and comtimbr = FAC.FTIMBRE 
               INNER JOIN GXOPERA.MESES ON SUBSTR(COMFEREAL,5,2) = MES
where   comstatus <> 'A' and  comimpor >0 
and comcomer <> '4500006'
and COMFEREAL between  {?DESDE} AND {?HASTA}
group by comrecnro, concat(concat(concat(substr(COMFEREAL,7,2),'/'),concat(substr(COMFEREAL,5,2),'/')),substr(COMFEREAL,1,4)),fechafac, mes,mesnombre




select * from libdebito.drconbep where lfectr = '20180216' and lidcom = '1001074' and limpgs = '52500' and lcodtr = '390000'

--update libdebito.drconbep  set lcretr = '00', lesttr = 'A',  LFECTR = '20180403', LFCOTR = '20180403' 
--where lfectr = '20180216' and lidcom = '1001074' and limpgs = '52500' and lcodtr = '390000' AND LERRNB = '804765876476'


/*ASISTENCIA TECNICA MENSUAL*/
select x as fecha,  sum(procesadas) as Procesadas, sum(pendientes) as Pendientes, sum(anuladas) as Anuladas from ( 
SELECT * --REPRNAME --SUBSTR(A.RCLAFECH,1,6) x, count(*) as procesadas, 0 as pendientes, 0 anuladas 
FROM gxbdbps.coasiaf a  
inner join gxbdbps.coastaf b on a.tirclaco = b.tirclaco
inner join gxbdbps.coas1af c on (a.cocomer = c.cocomer and  a.tirclaco = c.tirclaco and a.rclahora = c.rclahora and a.rclafech = c.rclafech )
inner join gxbdbps.corpraf d on (   c.rclarpre = d.rprecodi)
WHERE  a.rclastat = '10' -- estado cerrado 
and rpretipo = '20' -- tipo de representantes (tecnicos)
and SUBSTR(A.RCLAFECH,1,4) =  YEAR(NOW())
GROUP BY SUBSTR(A.RCLAFECH,1,6)
union
SELECT SUBSTR(A.RCLAFECH,1,6) x, 0 as procesadas, count(*) as pendientes, 0 anuladas 
FROM gxbdbps.coasiaf a  
inner join gxbdbps.coastaf b on a.tirclaco = b.tirclaco
inner join gxbdbps.coas1af c on (a.cocomer = c.cocomer and  a.tirclaco = c.tirclaco and a.rclahora = c.rclahora and a.rclafech = c.rclafech )
inner join gxbdbps.corpraf d on (   c.rclarpre = d.rprecodi)
WHERE  a.rclastat = '30' -- estado cerrado 
and rpretipo = '10' -- tipo de representantes (tecnicos)

and SUBSTR(A.RCLAFECH,1,4) =  YEAR(NOW())
GROUP BY SUBSTR(A.RCLAFECH,1,6)
union
SELECT SUBSTR(A.RCLAFECH,1,6) x, 0 as procesadas, 0 as pendientes, count(*) anuladas 
FROM gxbdbps.coasiaf a  
inner join gxbdbps.coastaf b on a.tirclaco = b.tirclaco
inner join gxbdbps.coas1af c on (a.cocomer = c.cocomer and  a.tirclaco = c.tirclaco and a.rclahora = c.rclahora and a.rclafech = c.rclafech )
inner join gxbdbps.corpraf d on (   c.rclarpre = d.rprecodi)
WHERE  a.rclastat = '99' -- estado cerrado 
and rpretipo = '10' -- tipo de representantes (tecnicos)
and SUBSTR(A.RCLAFECH,1,4) =  YEAR(NOW())
GROUP BY SUBSTR(A.RCLAFECH,1,6) ) as c 
Group by  x

 5.147.954 DE FECHA 19/03/2018

Select * from gxopera.fctacom where  ctafecha = '20180319' and ctanrobol = '190320185'
--Delete gxopera.fctacom where cocomer = '5400617' and  ctafecha = '20180319' and ctanrobol = '190320185'

select * from libdebito.drconbep where lfectr = '20180319' and limpgs = '5147954'
select * from gxopera.meses
/*MASTERCARD - PEDIDO DE FRANCO*/
select lidcom, rudesc rubro, SUBSTR(LNRTAR,1,6)||'XXXXXX'||SUBSTR(LNRTAR,13,4) AS TARJETA, LIMPGS IMPORTE, SUBSTR(LFECTR,5,2) MES, mesnombre
from libdebito.drconbep 
inner join gxbdbps.corubaf on SUBSTR(DIGITS(LIDCOM), 6, 2)  = rucodi
INNER JOIN gxopera.meses ON MES = SUBSTR(LFECTR,5,2)
where  substr(lfectr,1,4) = '2017' and lcodbc = 'MST' AND LCRETR = '00' AND LESTTR = 'A'-- AND LCODTR = '000054'
and substr(lidtra,1,1) = 'T' and lidcom <> '100001'

select 
select * from gxbdbps.corubaf
/*********************************************************/
SELECT * --LENEMI, SUM(LIMPGS) 
FROM LIBDEBITO.DRCONBEP
WHERE LFECTR = '20171228' AND ENEADM = '581' AND SUBSTR(LIDTRA,1,1) = 'T'
AND LENEMI NOT IN ('152', '581', '510', '500') AND LCRETR = '00' AND LESTTR = 'A' AND LCODTR IN ('011000', '012000', '013000')
GROUP BY LENEMI

select 0||cast(lidcom as char(7)) from libdebito.drconbep where lidcom = '9002202' and lfectr = '20180405'



SELECT LIDCOM, DIGITS(LIDCOM), SUBSTR(DIGITS(LIDCOM), 6, 7) FROM libdebito.DRCONBEP WHERE LIDCOM > 1                                       





/*RETENCION DE LIQUIDACIONES*/
SELECT * -- LICOMER CODIGOCOMER,CORAZO RAZON_SOCIAL,  LINROFAC NROFACTURA,SUBSTR(LIFECHA,1,6) FECHAFACT,  SUM(LIRENTA) RETENCION_RENTA , SUM(LIREIVA) IVA_RENTA, lifechd f_trx, lifecredi f_acred
FROM GXOPERA.FLICOM1 
INNER JOIN GXBDBPS.COMAEAF ON (LICOMER = COCOMER)
WHERE SUBSTR(lifecredi,1,6) = '201803' AND litiptar = 'CRE' --AND LICOMER = '0700227'
and SUBSTR(lifechd,1,6) = '201803'
AND LIRENTA > 0
GROUP BY LINROFAC,LICOMER , CORAZO, SUBSTR(LIFECHA,1,6)

/*DETALLE DE RETENCION - RETAIL  NO SE TOCO NADA*/
select * --RETTIMCOM AS TIMBRADO,retcodcom as codigocom, retcomdir as direccion, RETCOMNOM AS LOCAL, RETNROCOMPRO AS NRORETENCION, retfecha as fechareten,  retfaccom as Comprob_Venta, retfecfac as FechaCompr, RETTOTREN AS RETRENTA ,  RETTOTIVA AS IVARENTA , RETTOTAL AS RETTOTAL, RETMENSAJE AS MENSAJE
from gxopera.retcom
where retfecfac between '{?FECHAD}' and '{?FECHAH}'
and  retruc = '80016096'

/*RESUMEN DIARIO POR COMERCIO*/
select   LICOMER AS COMERCIO, codeno as denominacion, CORAZO AS RAZON, LIFECHA AS FECHADEP, LITIPTAR AS REFE, LICANT AS CUPON, LIMONTO AS MONTO, (LICOENT +LICOBPS) AS COMISION, (LIIVAENT+LIIVABPS) AS IVASCOMI,
LIRENTA AS RETRENTA, LIREIVA AS IVARETEN, (LICOENT +LICOBPS+LIRENTA+LIREIVA+LIIVAENT+LIIVABPS) AS TOTDESC, LINETO AS IMPNETO, LIFECREDI AS FECHCRED,  lifechd AS FE
from gxopera.flicom1 
inner join gxbdbps.comaeaf
on (LICOMER = cocomer)
where corucn = '80016096-7'
and SUBSTR(lifechd,1,4)||'-'||SUBSTR(lifechd,5,2)||'-'||SUBSTR(lifechd,7,2) =  DATE(CURDATE() - 1 days) 


/*COMPENSACIONES TIGO*/
SELECT * FROM GXBDBPS.COMAEAF WHERE codeno LIKE  '%ATM SHOPP.VILLA MORRA 1%'
1--Otras marcas en TIGO  (TigoMoney)
Select sum(limpgs)Monto
--lfectr FECHAR, sum(limpgs)Monto, ENEADM
from libdebito.drconbep where /* lfectr BETWEEN '20180' AND '20180331' and */ lfcotr = '20180402' and lesttr = 'A' and lcretr = '00' and substr(lidtra,1,1) = 'T' 
and lcodtr in ('011000','012000','013000','000052','015000','567101','567102')   and  eneadm = '581' and lenemi not in ('581')
GROUP BY LFECTR, ENEADM

2--TIGO EN OTRAS ENTIDADES- TIGO MONEY 
Select sum(limpgs)Monto
--LFECTR ,sum(limpgs)Monto , LENEMI
from libdebito.drconbep where /* lfECtr = '20180328'  AND */LFCOTR = '20180402' and lesttr = 'A' and lcretr = '00'  and substr(lidtra,1,1) = 'T' 
and lcodtr in ('011000','012000','013000','000052','015000','567101','567102') 
and  eneadm <> '581' 
and lenemi  in ('581')
GROUP BY LFECTR, LENEMI

3--ADELANTOS ATM TIGO PREPAGA
Select sum(limpgs)Monto
--LFECTR ,sum(limpgs)Monto , LENEMI
from libdebito.drconbep where /* lfECtr = '20180328'  AND */LFCOTR = '20180402' and lesttr = 'A' and lcretr = '00'  and substr(lidtra,1,1) = 'T' 
and lcodtr in ('011000','012000','013000','000052','015000','567101','567102') 
and lenemi  in ('152')
GROUP BY LFECTR, LENEMI

4--COMPRAS EN POS TIGO MONEY 
Select sum(limpgs)Monto
--LFECTR ,sum(limpgs)Monto , LENEMI, SUBSTR(lidtra,1,1)
from libdebito.drconbep where /* lfECtr = '20171228'  AND*/ LFCOTR = '20180402' and lesttr = 'A' and lcretr = '00'  and substr(lidtra,1,1) = 'P' 
--and lcodtr in ('000054') 
--and  eneadm <> '581' 
and lenemi  in ('581')
GROUP BY LFECTR, LENEMI, SUBSTR(lidtra,1,1)

5--compras en otros dispositivos - prepaga
Select --sum(limpgs)Monto
LFECTR ,sum(limpgs)Monto , LENEMI, SUBSTR(lidtra,1,1)
from libdebito.drconbep where  LFCOTR = '20180402' and lesttr = 'A' and lcretr = '00'  and substr(lidtra,1,1) = 'P' 
and lenemi  in ('152')
GROUP BY LFECTR, LENEMI, SUBSTR(lidtra,1,1)


select * from gxopera.opmovi where opcomer = '2100486' and opferea = '20180328' and opmonto = '180000'


SELECT  BS15USUUPD USUARIO, afticodi as tipo,BS15FECLIM AS FECHALIM, cocomer AS CODIGO,  CODENO AS DENOMINACION, CORAZO AS RAZONSOCIAL, CODIRE1 AS DIRECCION, LODESC, COTELN AS TELEFONO,  CORUCN AS NRORUC, RPRENAME AS REPRESENT , ZONADESC 
FROM LIBDEBITO.BST015
INNER JOIN gxbdbps.COMAEAF A ON LTRIM(BS15CODCOM) = COFACTU
inner join gxbdbps.colocaf c
on A.locodi = C.locodi
INNER JOIN gxbdbps.corpraf  ON (RPRECOD = RPRECODI)
inner join gxbdbps.cozonaf d
on a.zonacodi = d.zonacodi
inner join gxbdbps.coafmaf on (afcomer = cocomer )
WHERE SUBSTR(BS15FECLIM, 1,4) = '2018'
AND COCOMER <> '0100001'
AND SUBSTR(BS15FECLIM, 5,2) BETWEEN '03' AND '03'
AND SUBSTR(COCOMER,1,2) NOT IN ('45', '79', '80', '81', '86', '90')




-- REPORTE PARA SOLEDAD DELOSANTOS
-- RECIBOS EMITIDOS PARA DEBITOS -- GUARANIES
SELECT  * --COCOMER "Cód. cOMERCIO", CORAZO "Razón Social", COMFEREAL FECHACOB,COMRECNRO "Rec. Nro.", sum(comimpor) "Importe", comnro factcob, COMONEDA MONEDA, COMSTATUS
FROM    GXBDBPS.COMAEAF A
        INNER JOIN GXOPERA.FCOBROS C ON A.COCOMER = COMCTAMA
WHERE   substr(COMFEREAL,1,4) = 2018 and substr(COMFEREAL,5,2) = 04
AND COMSTATUS <> 'A'
AND COMONEDA = '600'
--AND COCOMER = '4500006'
AND COMTIPO = 'CR'
GROUP BY COCOMER, CORAZO, COMFEREAL, COMRECNRO, COMRECNRO, comnro, COMONEDA, COMSTATUS

-- RECIBOS EMITIDOS PARA DEBITOS -- DOLARES
SELECT COCOMER "Cód. cOMERCIO", CORAZO "Razón Social", COMFEREAL FECHACOB,COMRECNRO "Rec. Nro.", sum(comimpor) "Importe", comnro factcob, COMONEDA MONEDA, COMSTATUS
FROM    GXBDBPS.COMAEAF A
        INNER JOIN GXOPERA.FCOBROS C ON A.COCOMER = COCOMER
        INNER JOIN 
WHERE   substr(COMFEREAL,1,4) = 2018 and substr(COMFEREAL,5,2) = 04
AND COMSTATUS <> 'A'
AND COMONEDA <> '840'
AND COCOMER IN ( '0901588', '7100017','4500006')
AND COMTIPO = 'CR'
GROUP BY COCOMER, CORAZO, COMFEREAL, COMRECNRO, COMRECNRO, comnro, COMONEDA, COMSTATUS


omnro = fac.fnro  and comtimbr = FAC.FTIMBRE 

select * from GXOPERA.FCOBROS WHERE  COMSTATUS <> 'A' AND COMONEDA <> '840' AND COMTIPO = 'CR' AND substr(COMFEREAL,1,6) = '201804' AND COMCOMER = '0701191'



/*este estaba*/ 1698
SELECT COCOMER "COD.COMERCIO", CORAZO "Razón Social", COMFEREAL FECHACOB,COMRECNRO "Rec. Nro.", sum(comimpor) "Importe", comnro factcob, COMONEDA MONEDA, COMSTATUS
FROM    GXBDBPS.COMAEAF A
        INNER JOIN GXOPERA.FCOBROS C ON A.COCOMER = COMCTAMA
WHERE   COMFEREAL BETWEEN '20180401' AND '20180416'
AND COMSTATUS <> 'A'
AND COMONEDA = '600'
AND COMTIPO = 'CR'
AND comrectip = 'RD'
GROUP BY COCOMER, CORAZO, COMFEREAL, COMRECNRO, COMRECNRO, comnro, COMONEDA, COMSTATUS
ORDER BY COMFEREAL, COMRECNRO

/*ESTE ES PARA COBRANZAS*/
select  comcomer CODIGO, CORAZO RAZON_SOCIAL, comtipo as tipo, comnro as nrofACT, comimpor as importe, comfereal as fCOBRO, COMRECTIP TIPORD, COMRECNRO NRORECIBO, COMONEDA TIPOMONEDA
from    gxopera.fcobros
inner join
             ( select a.factnro FNRO, a.factimbr FTIMBRE, a.factotal FIMP, a.facsaldo FSAL, a.facstatus FSTAT, facfech FECH
               from    gxopera.factura a  inner join gxopera.factura1 b
               on a.factipo =  b.factipo and a.factnro = b.factnro and a.factimbr = b.factimbr
               where   a.factipo = 'CR'  AND A.FACFECH BETWEEN '20180401' AND '20180413' and  a.facstatus = 'C') FAC
               on comnro = fac.fnro  and comtimbr = FAC.FTIMBRE 
							 INNER JOIN GXBDBPS.COMAEAF ON COMCOMER = COCOMER
--and comcomer IN ( '0901588', '7100017','4500006', '0901588', '4500003', '0701191')
AND COMRECTIP = 'RD'
and COMFEREAL between  '20180401' AND '20180413'
group by COMCOMER, CORAZO, comtipo, comnro, comimpor, comfereal, COMRECTIP, COMRECNRO, COMONEDA
ORDER BY COMFEREAL, COMRECNRO

/*para laura retenciones del historico*/
select retfech fecha,retcodcom codigocomer, retcomnom razon_social, retfaccom nrofactura, rettotren retencionrenta, rettotiva iva_renta
from gxopera.retcomhst where substr(retfech,1,7) = '2017-12' 

SELECT  LICOMER CODIGOCOMER,CORAZO RAZON_SOCIAL, LINROFAC NROFACTURA, SUM(LIRENTA) RETENCION_RENTA , SUM(LIREIVA) IVA_RENTA
FROM gxopera.FLICOM1 
INNER JOIN GXBDBPS.COMAEAF ON (LICOMER = COCOMER)
WHERE SUBSTR(LIFECREDI,1,6)= '201803'  AND litiptar = 'CRE'
AND (LIRENTA > 0 or lireiva > 0)
GROUP BY LINROFAC,LICOMER,CORAZO



/*PARETO*/
Select  c.cocomer A , RUDESC B, COSTAT C, codeno D,  /*addescre E, addesdeb F, sum(afmonto) G, zonadesc H, lodesc I, */count(aFcodi)  cantP,/* coteln , codire1 ,*/
(SELECT SUM(TDACANT) FROM GXOPERA.TDAVISTAS WHERE TDACOME = c.cocomer AND TDAMES = '03'   AND TDAANHO =  '2018' AND TDACORE = '00' AND TDATIPO IN ('P','G') ) cANTRX,
(SELECT SUM(TDAIMPO) FROM GXOPERA.TDAVISTAS WHERE TDACOME = c.cocomer AND TDAMES = '03'  AND TDAANHO =  '2018' AND TDACORE = '00' AND TDATIPO IN ( 'P', 'G') ) L
-- (SELECT SUM(TDACANT) FROM GXOPERA.TDAVISTAS WHERE TDACOME = c.cocomer AND TDAMES = '03'   AND TDAANHO =  '2018' AND TDACORE = '00' AND TDATIPO IN ( 'P', 'G') AND tdacotr in ('524000') and tdamark in (' ')) PF, 
-- (SELECT SUM(TDAIMPO) FROM GXOPERA.TDAVISTAS WHERE TDACOME = c.cocomer AND TDAMES = '03'   AND TDAANHO =  '2018' AND TDACORE = '00' AND TDATIPO IN ( 'P', 'G') AND tdacotr in ('524000') and tdamark in (' ')) IPF,
-- (SELECT SUM(TDACANT) FROM GXOPERA.TDAVISTAS WHERE TDACOME = c.cocomer AND TDAMES = '03'   AND TDAANHO =  '2018' AND TDACORE = '00' AND TDATIPO IN ( 'P', 'G') AND tdacotr in ('514000') and tdamark in (' ')) VM, 
-- (SELECT SUM(TDAIMPO) FROM GXOPERA.TDAVISTAS WHERE TDACOME = c.cocomer AND TDAMES = '03'   AND TDAANHO =  '2018' AND TDACORE = '00' AND TDATIPO IN ( 'P', 'G') AND tdacotr in ('514000') and tdamark in (' ')) IVM,  
-- (SELECT SUM(TDACANT) FROM GXOPERA.TDAVISTAS WHERE TDACOME = c.cocomer AND TDAMES = '03'   AND TDAANHO =  '2018' AND TDACORE = '00' AND TDATIPO IN ( 'P', 'G') and tdacotr in ('567102', '567101') and tdamark in ('BIL')) BPER,
-- (SELECT SUM(TDAIMPO) FROM GXOPERA.TDAVISTAS WHERE TDACOME = c.cocomer AND TDAMES = '03'   AND TDAANHO =  '2018' AND TDACORE = '00' AND TDATIPO IN ( 'P', 'G') and tdacotr in ('567102', '567101') and tdamark in ('BIL')) IBPER,
-- (SELECT SUM(TDACANT) FROM GXOPERA.TDAVISTAS WHERE TDACOME = c.cocomer AND TDAMES = '03'   AND TDAANHO =  '2018' AND TDACORE = '00' AND TDATIPO IN ( 'P', 'G') and tdacotr  in ('000052') and tdamark in ('BIL')) BTIG,
-- (SELECT SUM(TDAIMPO) FROM GXOPERA.TDAVISTAS WHERE TDACOME = c.cocomer AND TDAMES = '03'   AND TDAANHO =  '2018' AND TDACORE = '00' AND TDATIPO IN ( 'P', 'G') and tdacotr  in ('000052') and tdamark in ('BIL')) IBTIG,
-- (SELECT SUM(TDACANT) FROM GXOPERA.TDAVISTAS WHERE TDACOME = c.cocomer AND TDAMES = '03'   AND TDAANHO =  '2018' AND TDACORE = '00' AND TDATIPO IN ( 'P', 'G') and tdamark in ('UNI','CAB','PAN','CRE')) OTROS,
-- (SELECT SUM(TDAimpo) FROM GXOPERA.TDAVISTAS WHERE TDACOME = c.cocomer AND TDAMES = '03'   AND TDAANHO =  '2018' AND TDACORE = '00' AND TDATIPO IN ( 'P', 'G') and tdamark in ('UNI','CAB','PAN','CRE')) IOTROS,
-- (SELECT SUM(TDACANT) FROM GXOPERA.TDAVISTAS WHERE TDACOME = c.cocomer AND TDAMES = '03'   AND TDAANHO =  '2018' AND TDACORE = '00' AND TDATIPO IN ( 'P', 'G') and tdacotr not in ('324000') and tdamark in ('DIN','DEB','DCR')) DINEL,
-- (SELECT SUM(TDAIMPO) FROM GXOPERA.TDAVISTAS WHERE TDACOME = c.cocomer AND TDAMES = '03'   AND TDAANHO =  '2018' AND TDACORE = '00' AND TDATIPO IN ( 'P', 'G') and tdacotr not in ('324000') and tdamark in ('DIN','DEB','DCR')) IDINEL,
-- (SELECT SUM(TDACANT) FROM GXOPERA.TDAVISTAS WHERE TDACOME = c.cocomer AND TDAMES = '03'   AND TDAANHO =  '2018' AND TDACORE = '00' AND TDATIPO IN ( 'P', 'G') and tdacotr in ('370000','380000', '390000')) CICO,
-- (SELECT SUM(TDAIMPO) FROM GXOPERA.TDAVISTAS WHERE TDACOME = c.cocomer AND TDAMES = '03'   AND TDAANHO =  '2018' AND TDACORE = '00' AND TDATIPO IN ( 'P', 'G') and tdacotr in ('370000','380000', '390000')) ICICO,
-- (SELECT SUM(TDACANT) FROM GXOPERA.TDAVISTAS WHERE TDACOME = c.cocomer AND TDAMES = '03'   AND TDAANHO =  '2018' AND TDACORE = '00' AND TDATIPO IN ( 'P', 'G') and tdamark in ('VSA')) TVISA,
-- (SELECT SUM(TDAIMPO) FROM GXOPERA.TDAVISTAS WHERE TDACOME = c.cocomer AND TDAMES = '03'   AND TDAANHO =  '2018' AND TDACORE = '00' AND TDATIPO IN ( 'P', 'G') and tdamark in ('VSA')) IVISA,
-- (SELECT SUM(TDACANT) FROM GXOPERA.TDAVISTAS WHERE TDACOME = c.cocomer AND TDAMES = '03'   AND TDAANHO =  '2018' AND TDACORE = '00' AND TDATIPO IN ( 'P', 'G') and tdamark in ('MST')) TMST,
-- (SELECT SUM(TDAIMPO) FROM GXOPERA.TDAVISTAS WHERE TDACOME = c.cocomer AND TDAMES = '03'   AND TDAANHO =  '2018' AND TDACORE = '00' AND TDATIPO IN ( 'P', 'G') and tdamark in ('MST')) IMST
from gxbdbps.comaeaf c left join gxbdbps.coafmaf on  c.cocomer = afcomer
inner join gxbdbps.corubaf on (rucodi = substr(c.cocomer,1,2))
inner join gxbdbps.cozonaf d on c.zonacodi = d.zonacodi
inner join gxbdbps.colocaf e on c.locodi = e.locodi
where substr(c.cocomer,1,2) not in ('45','79','80','81','85','86') and costat in ('0','3') and  cofecalt <= '20180401'   and substr(c.cocomer,1,2) < '90'
and c.cocomer not in ('0100001', '0100002', '6900097', '5400653', '5400655')
group by rudesc , c.cocomer, COSTAT, /*addescre, addesdeb, */CODENO-- zonadesc, lodesc, coteln , codire1 --, AFcodi
SELECT * 
FROM GXOPERA.TDAVISTAS WHERE TDAENTI = '581' AND TDAANHO = '2018' AND TDAMES = '03' AND TDACORE = '00' AND TDATIPO IN ( 'P', 'G')
/*PARETO COMERCIOS POR MARCA*/
8194400
SELECT TDABIN, tdaenti entidad, SUM(TDACANT), SUM(TDAIMPO) IMPORTE 
FROM GXOPERA.TDAVISTAS WHERE TDACOME = '0200096' AND TDAMES = '03'   AND TDAANHO =   '2018'
 AND TDACORE = '00' AND TDATIPO IN ( 'P', 'G') and tdacotr not in ('324000') and tdamark in ('DIN','DEB','DCR') 
GROUP BY TDABIN, tdaenti
 /*OPMOVI- PARETO DINELCO*/ 
 116829000
SELECT * --SUBSTR(OPTARJ,1,6) BIN, substr(optarj,7,3) entidad, COUNT(*) CANTIDAD,SUM(OPMONTO)
FROM GXOPERA.OPMOVI WHERE OPCOMER = '0200096' AND SUBSTR(OPFEREA,1,6) = '201803'
   AND OPCODRES = '00' AND SUBSTR(opidtra,1,1) IN ('P', 'G') AND OPCODTRN <> '324000' 
 GROUP BY SUBSTR(OPTARJ,1,6) , substr(optarj,7,3)

/*ESTE ES*/ 
select COCOMER, CODENO DENOMINACION, COUNT(AFCODI) CANTPOS, 
 (SELECT SUM(OPMONTO) FROM GXOPERA.OPMOVI WHERE OPCOMER = COCOMER AND SUBSTR(OPFEREA,1,6) = '201803' AND OPCODRES = '00' AND SUBSTR(opidtra,1,1) IN ('P', 'G') AND OPCODTRN <> '324000' ) IMPDINELCO,
(SELECT SUM(OPCOMBPS) FROM GXOPERA.OPMOVI WHERE OPCOMER = COCOMER AND SUBSTR(OPFEREA,1,6) = '201803' AND OPCODRES = '00' AND SUBSTR(opidtra,1,1) IN ('P', 'G') AND OPCODTRN <> '324000') COMIBEPS,
(SELECT SUM(OPMONTO) FROM GXOPERA.OPMOVI WHERE OPCOMER = COCOMER AND SUBSTR(OPFEREA,1,6) = '201803' AND OPCODRES = '00' AND SUBSTR(opidtra,1,1) IN ('P', 'G') AND OPCODTRN = '514000' )IVTAMIN,
(SELECT SUM(OPCOMBPS) FROM GXOPERA.OPMOVI WHERE OPCOMER = COCOMER AND SUBSTR(OPFEREA,1,6) = '201803' AND OPCODRES = '00' AND SUBSTR(opidtra,1,1) IN ('P', 'G') AND OPCODTRN = '514000' ) CVTAMIN, 
(SELECT SUM(OPMONTO) FROM GXOPERA.OPMOVI WHERE OPCOMER = COCOMER AND SUBSTR(OPFEREA,1,6) = '201803' AND OPCODRES = '00' AND SUBSTR(opidtra,1,1) IN ('P', 'G') AND OPCODTRN = '524000' )IPAGOFAC,
(SELECT SUM(OPCOMBPS) FROM GXOPERA.OPMOVI WHERE OPCOMER = COCOMER AND SUBSTR(OPFEREA,1,6) = '201803' AND OPCODRES = '00' AND SUBSTR(opidtra,1,1) IN ('P', 'G') AND OPCODTRN = '524000' ) CPAGOFAC, 
(SELECT SUM(OPMONTO) FROM GXOPERA.OPMOVI WHERE OPCOMER = COCOMER AND SUBSTR(OPFEREA,1,6) = '201803' AND OPCODRES = '00' AND SUBSTR(opidtra,1,1) IN ('P', 'G') AND OPCODTRN in ('370000','380000', '390000') )ICICO,
(SELECT SUM(OPCOMBPS) FROM GXOPERA.OPMOVI WHERE OPCOMER = COCOMER AND SUBSTR(OPFEREA,1,6) = '201803' AND OPCODRES = '00' AND SUBSTR(opidtra,1,1) IN ('P', 'G') AND OPCODTRN in ('370000','380000', '390000') ) CCICO, 
(SELECT SUM(OPMONTO) FROM GXOPERA.OPMOVI WHERE OPCOMER = COCOMER AND SUBSTR(OPFEREA,1,6) = '201803' AND OPCODRES = '00' AND SUBSTR(opidtra,1,1) IN ('P', 'G') AND OPCODTRN in ('000054') AND OPENTID = '581' AND OPRADOR = '981' and OPTIPTAR = 'DEB' )IBILLT,
(SELECT SUM(OPCOMBPS) FROM GXOPERA.OPMOVI WHERE OPCOMER = COCOMER AND SUBSTR(OPFEREA,1,6) = '201803' AND OPCODRES = '00' AND SUBSTR(opidtra,1,1) IN ('P', 'G') AND OPCODTRN in ('000054') AND OPENTID = '581' AND OPRADOR = '981' and OPTIPTAR = 'DEB') CBILLT,
(SELECT SUM(OPMONTO) FROM GXOPERA.OPMOVI WHERE OPCOMER = COCOMER AND SUBSTR(OPFEREA,1,6) = '201803' AND OPCODRES = '00' AND SUBSTR(opidtra,1,1) IN ('P', 'G') AND OPCODTRN in ('000054') AND OPENTID = '571' AND OPRADOR = '971' and OPTIPTAR = 'DEB' )IBILLP,
(SELECT SUM(OPCOMBPS) FROM GXOPERA.OPMOVI WHERE OPCOMER = COCOMER AND SUBSTR(OPFEREA,1,6) = '201803' AND OPCODRES = '00' AND SUBSTR(opidtra,1,1) IN ('P', 'G') AND OPCODTRN in ('000054') AND OPENTID = '571' AND OPRADOR = '971' and OPTIPTAR = 'DEB') P
from GXBDBPS.COMAEAF  left join gxbdbps.coafmaf on  cocomer = afcomer
WHERE substr(cocomer,1,2) not in ('45','79','80','81','85','86') and costat in ('0','3') and  cofecalt <= '20180401'   and substr(cocomer,1,2) < '90'
and cocomer not in ('0100001', '0100002', '6900097', '5400653', '5400655')
GROUP BY COCOMER, CODENO
union
select a.COCOMER, CODENO DENOMINACION, COUNT(AFCODI) CANTPOS ,
(SELECT SUM(OPMONTO) FROM GXOPERA.OPMOVI WHERE OPCOMER = a.COCOMER AND SUBSTR(OPFEREA,1,6) = '201803' AND OPCODRES = '00' AND SUBSTR(opidtra,1,1) IN ('P', 'G')  ) IMPDINELCO,
(SELECT SUM(OPCOMBPS) FROM GXOPERA.OPMOVI WHERE OPCOMER = a.COCOMER AND SUBSTR(OPFEREA,1,6) = '201803' AND OPCODRES = '00' AND SUBSTR(opidtra,1,1) IN ('P', 'G')) COMIBEPS,
(SELECT SUM(OPMONTO) FROM GXOPERA.OPMOVI WHERE OPCOMER = a.COCOMER AND SUBSTR(OPFEREA,1,6) = '201803' AND OPCODRES = '00' AND SUBSTR(opidtra,1,1) IN ('P', 'G') AND OPCODTRN = '514000' )IVTAMIN,
(SELECT SUM(OPCOMBPS) FROM GXOPERA.OPMOVI WHERE OPCOMER = a.COCOMER AND SUBSTR(OPFEREA,1,6) = '201803' AND OPCODRES = '00' AND SUBSTR(opidtra,1,1) IN ('P', 'G') AND OPCODTRN = '514000' ) CVTAMIN, 
(SELECT SUM(OPMONTO) FROM GXOPERA.OPMOVI WHERE OPCOMER = a.COCOMER AND SUBSTR(OPFEREA,1,6) = '201803' AND OPCODRES = '00' AND SUBSTR(opidtra,1,1) IN ('P', 'G') AND OPCODTRN = '524000' )IPAGOFAC,
(SELECT SUM(OPCOMBPS) FROM GXOPERA.OPMOVI WHERE OPCOMER = a.COCOMER AND SUBSTR(OPFEREA,1,6) = '201803' AND OPCODRES = '00' AND SUBSTR(opidtra,1,1) IN ('P', 'G') AND OPCODTRN = '524000' ) CPAGOFAC, 
(SELECT SUM(OPMONTO) FROM GXOPERA.OPMOVI WHERE OPCOMER = a.COCOMER AND SUBSTR(OPFEREA,1,6) = '201803' AND OPCODRES = '00' AND SUBSTR(opidtra,1,1) IN ('P', 'G') AND OPCODTRN in ('370000','380000', '390000') )ICICO,
(SELECT SUM(OPCOMBPS) FROM GXOPERA.OPMOVI WHERE OPCOMER = a.COCOMER AND SUBSTR(OPFEREA,1,6) = '201803' AND OPCODRES = '00' AND SUBSTR(opidtra,1,1) IN ('P', 'G') AND OPCODTRN in ('370000','380000', '390000') ) CCICO, 
(SELECT SUM(OPMONTO) FROM GXOPERA.OPMOVI WHERE OPCOMER = a.COCOMER AND SUBSTR(OPFEREA,1,6) = '201803' AND OPCODRES = '00' AND SUBSTR(opidtra,1,1) IN ('P', 'G') AND OPCODTRN in ('000054') AND OPENTID = '581' AND OPRADOR = '981' and OPTIPTAR = 'DEB' )IBILLT,
(SELECT SUM(OPCOMBPS) FROM GXOPERA.OPMOVI WHERE OPCOMER = a.COCOMER AND SUBSTR(OPFEREA,1,6) = '201803' AND OPCODRES = '00' AND SUBSTR(opidtra,1,1) IN ('P', 'G') AND OPCODTRN in ('000054') AND OPENTID = '581' AND OPRADOR = '981' and OPTIPTAR = 'DEB') CBILLT,
(SELECT SUM(OPMONTO) FROM GXOPERA.OPMOVI WHERE OPCOMER = a.COCOMER AND SUBSTR(OPFEREA,1,6) = '201803' AND OPCODRES = '00' AND SUBSTR(opidtra,1,1) IN ('P', 'G') AND OPCODTRN in ('000054') AND OPENTID = '571' AND OPRADOR = '971' and OPTIPTAR = 'DEB' )IBILLP,
(SELECT SUM(OPCOMBPS) FROM GXOPERA.OPMOVI WHERE OPCOMER = a.COCOMER AND SUBSTR(OPFEREA,1,6) = '201803' AND OPCODRES = '00' AND SUBSTR(opidtra,1,1) IN ('P', 'G') AND OPCODTRN in ('000054') AND OPENTID = '571' AND OPRADOR = '971' and OPTIPTAR = 'DEB') P
from GXBDBPS.COMAEAF a left join gxbdbps.coafmaf on  a.cocomer = afcomer
left join gxbdbps.coma1af c on  a.cocomer = c.cocomer
where substr(a.cocomer,1,2) not in ('45','79','80','81','85','86') and costat in ('0') and  cofecalt <= '20180409' and substr(a.cocomer,1,2) < '90'
and a.cocomer not in ('0100001', '0100002', '6900097', '5400653', '5400655')
and prcodi = '995' /*bivalencia */
and afcomer is null    -- no tiene pos 
GROUP BY a.COCOMER, CODENO
union
select COCOMER, CODENO DENOMINACION, COUNT(AFCODI) CANTPOS ,
(SELECT SUM(OPMONTO) FROM GXOPERA.OPMOVI WHERE OPCOMER = COCOMER AND SUBSTR(OPFEREA,1,6) = '201803' AND OPCODRES = '00' AND SUBSTR(opidtra,1,1) IN ('P', 'G') ) IMPDINELCO,
(SELECT SUM(OPCOMBPS) FROM GXOPERA.OPMOVI WHERE OPCOMER = COCOMER AND SUBSTR(OPFEREA,1,6) = '201803' AND OPCODRES = '00' AND SUBSTR(opidtra,1,1) IN ('P', 'G')) COMIBEPS,
(SELECT SUM(OPMONTO) FROM GXOPERA.OPMOVI WHERE OPCOMER = COCOMER AND SUBSTR(OPFEREA,1,6) = '201803' AND OPCODRES = '00' AND SUBSTR(opidtra,1,1) IN ('P', 'G') AND OPCODTRN = '514000' )IVTAMIN,
(SELECT SUM(OPCOMBPS) FROM GXOPERA.OPMOVI WHERE OPCOMER = COCOMER AND SUBSTR(OPFEREA,1,6) = '201803' AND OPCODRES = '00' AND SUBSTR(opidtra,1,1) IN ('P', 'G') AND OPCODTRN = '514000' ) CVTAMIN, 
(SELECT SUM(OPMONTO) FROM GXOPERA.OPMOVI WHERE OPCOMER = COCOMER AND SUBSTR(OPFEREA,1,6) = '201803' AND OPCODRES = '00' AND SUBSTR(opidtra,1,1) IN ('P', 'G') AND OPCODTRN = '524000' )IPAGOFAC,
(SELECT SUM(OPCOMBPS) FROM GXOPERA.OPMOVI WHERE OPCOMER = COCOMER AND SUBSTR(OPFEREA,1,6) = '201803' AND OPCODRES = '00' AND SUBSTR(opidtra,1,1) IN ('P', 'G') AND OPCODTRN = '524000' ) CPAGOFAC, 
(SELECT SUM(OPMONTO) FROM GXOPERA.OPMOVI WHERE OPCOMER = COCOMER AND SUBSTR(OPFEREA,1,6) = '201803' AND OPCODRES = '00' AND SUBSTR(opidtra,1,1) IN ('P', 'G') AND OPCODTRN in ('370000','380000', '390000') )ICICO,
(SELECT SUM(OPCOMBPS) FROM GXOPERA.OPMOVI WHERE OPCOMER = COCOMER AND SUBSTR(OPFEREA,1,6) = '201803' AND OPCODRES = '00' AND SUBSTR(opidtra,1,1) IN ('P', 'G') AND OPCODTRN in ('370000','380000', '390000') ) CCICO, 
(SELECT SUM(OPMONTO) FROM GXOPERA.OPMOVI WHERE OPCOMER = COCOMER AND SUBSTR(OPFEREA,1,6) = '201803' AND OPCODRES = '00' AND SUBSTR(opidtra,1,1) IN ('P', 'G') AND OPCODTRN in ('000054') AND OPENTID = '581' AND OPRADOR = '981' and OPTIPTAR = 'DEB' )IBILLT,
(SELECT SUM(OPCOMBPS) FROM GXOPERA.OPMOVI WHERE OPCOMER = COCOMER AND SUBSTR(OPFEREA,1,6) = '201803' AND OPCODRES = '00' AND SUBSTR(opidtra,1,1) IN ('P', 'G') AND OPCODTRN in ('000054') AND OPENTID = '581' AND OPRADOR = '981' and OPTIPTAR = 'DEB') CBILLT,
(SELECT SUM(OPMONTO) FROM GXOPERA.OPMOVI WHERE OPCOMER = COCOMER AND SUBSTR(OPFEREA,1,6) = '201803' AND OPCODRES = '00' AND SUBSTR(opidtra,1,1) IN ('P', 'G') AND OPCODTRN in ('000054') AND OPENTID = '571' AND OPRADOR = '971' and OPTIPTAR = 'DEB' )IBILLP,
(SELECT SUM(OPCOMBPS) FROM GXOPERA.OPMOVI WHERE OPCOMER = COCOMER AND SUBSTR(OPFEREA,1,6) = '201803' AND OPCODRES = '00' AND SUBSTR(opidtra,1,1) IN ('P', 'G') AND OPCODTRN in ('000054') AND OPENTID = '571' AND OPRADOR = '971' and OPTIPTAR = 'DEB') P
from GXBDBPS.COMAEAF  left join gxbdbps.coafmaf on  cocomer = afcomer
where substr(cocomer,1,2) not in ('45','79','80','81','85','86') and costat in ('0') and  cofecalt <= '20180409' and substr(cocomer,1,2) < '90'
and cocomer not in ('0100001', '0100002', '6900097', '5400653', '5400655')
and cocomer not in (select cocomer from gxbdbps.coma1af a where prcodi = '995' )
and afcomer is null    -- no tiene pos 
GROUP BY COCOMER, CODENO






select * from libdebito.drconbep where lfectr = '20180418' and lcretr = '81' 
SELECT * FROM GXOPERA.FCOBROS 


/*RECIBOS DE DINERO ANULADO*/
select distinct(cocomer) codigo, corazo razons, COMRECNRO nrorecibo, COMFEREAL FECHA
from gxopera.fcobros 
inner join GXBDBPS.COMAEAF  ON COCOMER = COMCTAMA
where  COMFEREAL BETWEEN '20180301' AND '20180331' 
and comstatus = 'A' AND COMRECTIP = 'RD' and COMTIPO = 'CR'
and comoneda = '600'








select SUBSTR(LIDTRA,1,1) TIPO, COUNT(*) CANTIDAD, lcodtr codtrx, lcodbc marca, 'DINELCO DEB' TIPO 
from libdebito.drconbep where lfECtr between '20180401' and '20180401' and  lcodtr = '000054' and lcretr = '00'
 AND LESTTR = 'A' AND LCODBC = 'DEB' and lenemi <> '152'
GROUP BY SUBSTR(LIDTRA,1,1), lcodtr, lcodbc
/*-----------------------------------------------------------------------------------------------------------*/
select SUBSTR(LIDTRA,1,1) TIPO, COUNT(*) CANTIDAD, lcodtr codtrx, lcodbc marca, 'TIGO COMPANION' TIPO 
from libdebito.drconbep where lfCOtr between '20180401' and '20180410' and  lcodtr = '000054' and lcretr = '00'
 AND LESTTR = 'A' AND LCODBC = 'DEB' and lenemi = '152'
GROUP BY SUBSTR(LIDTRA,1,1), lcodtr, lcodbc
/*----------------------------------------------------------------------------------------------------------*/
select SUBSTR(LIDTRA,1,1) TIPO, COUNT(*) CANTIDAD, lcodtr codtrx, lcodbc marca, 'BILLETERA TIGO ' TIPO 
from libdebito.drconbep where lfCOtr between '20180401' and '20180410' and  lcodtr = '000052' and lcretr = '00'
 AND LESTTR = 'A' AND LCODBC = 'BIL' and lenemi = '581'
GROUP BY SUBSTR(LIDTRA,1,1), lcodtr, lcodbc
/*----------------------------------------------------------------------------------------------------------*/
select SUBSTR(LIDTRA,1,1) TIPO, COUNT(*) CANTIDAD, lcodtr codtrx, lcodbc marca, 'BILLETERA PERSONAL ' TIPO 
from libdebito.drconbep where lfCOtr between '20180401' and '20180410' and  lcodtr = '567102' and lcretr = '00'
 AND LESTTR = 'A' AND LCODBC = 'BIL' and lenemi = '571'
GROUP BY SUBSTR(LIDTRA,1,1), lcodtr, lcodbc

/*envio msg*/
select * from gxdebito.tgenvmsgh where am1cip = '2447498'




--select * from gxopera.fcobros WHERE COMCOMER = '0301621'

select  faclien, FACTOTAL TOTALFACTURA, FACFECH FECHAFACTURA, FACVENC VENCIMIENTO 
from gxopera.factura  
where faclien = '0301621' AND FACSTATUS = 'P' 



select * from gxbdbps.tlogsaf where lstipro = 'CLEA' and lsfecha = '20180518'

--inner join gxopera.fcobros on (factipo = comtipo and factnro = comnro and factimbr = comtimbr)

/*comercios con cobradores asignados*/
select  * --comstatus estado, comcomer comercio, corazo razonsocial, comrecnro NroRecibo, comfecha fechaCobro, comimpor importe, ((comimpor * 1.5)/100) comision, RPRENAME,  rprecodi--, facvenc vencimiento--, facfech fechafactu
from gxopera.fcobros
--inner join gxopera.factura on (factipo = comtipo and factnro = comnro and factimbr = comtimbr)
inner join GXBDBPS.COMAEAF
on (comcomer = cocomer)
inner join gxbdbps.cobcom
ON (COMCOMER = COBCOM)
INNER JOIN gxbdbps.corpraf
ON ( RPRECODI=COBCOD)
where --facfech between 20170101  and 20180531
comfereal between 20170101  and 20180531
and cobtip = 'C'
and costat = '0' -- comercios activos
AND COBSTATUS = 'A'
and comrecnro > 0
-- and facstatus = 'P'
--and  rprecodi = 65
AND COMRECTIP = 'RD'
and cocomer = '0301621'




select * from  libdebito.tbcret0p where codmar = 'BEPS'

select 
lcretr retorno, coddes descripcion,  count(*) cantidad 
from libdebito.drconbep 
inner join libdebito.tbcret0p on codnro = lcretr
where lfectr BETWEEN '20180401' AND '20180431'
and substr(lidtra,1,1) = 'T' AND LCRETR  <> '00' 
and codmar = 'BEPS'
group by lcretr, coddes



select * from gxbdbps.comaeaf where costat = '0' and coemail <>  ''


select * from contabilid.tat2cta
where t2cobc = 'VI' AND T2TPCO = '18'
SELECT * FROM GXOPERA.FLICOM WHERE LIFECHD = '20180814' AND LICODBAN = 'VI' 



select a.reenti,a.reenemi,removi, entdesc,sum(remonto),sum(recant) 
SELECT SUM(RECANT)
from gxopera.oprecle  a
inner join gxopera.opentid b on b.reenti =  a.reenemi
where REMOVI in ( 'ADA') 
and reenemi NOT IN ('581','152')
and READMIN = '581' 
AND REFECH = '20190715'
group by a.reenti,a.reenemi,entdesc,removi

/*DRCONBEP*/
SELECT LERRNB--*--SUM(LIMPGS) 
FROM LIBDEBITO.DRCONBEP a 
inner join gxbdbps.comaeaf b on substr(digits(a.lidcom), 6, 7)=b.cocomer 
where lfcotr= '20190715' and substr(cocomer,1,2)='90' and coenadm= '581' and coenpro='581' and costat='0' 
and lcodtr in ('011000','013000','012000','567102')and lcretr='00' and lesttr='A' and limpgs=200000
and lerrnb='919510527178'
except 
select opnoref from gxopera.opmovi where opfecom='20190715'
and substr(opcomer,1,2)='90' and opadmin= '581' and opcodtrn in ('011000','013000','012000','567102')
and openemi not in ('152','581') and opmonto=200000



SELECT *--*--SUM(LIMPGS) 
FROM LIBDEBITO.DRCONBEP a 
inner join gxbdbps.comaeaf b on substr(digits(a.lidcom), 6, 7)=b.cocomer 
where lfcotr> '20190712' and lenemi='353' 
and lerrnb='919510527178'


select  * from gxopera.opago1phis where pgfecre='20190805'
group by pgfecre,pgtipo


select * from gxopera.opago5ph where pgfecre5=''

select * from dcash.dc_cambios


SELECT LIMONTO MONTO,LICOMER COMERCIO FROM GXOPERA.FLICOM1 
SELECT LIMONTO MONTO,LICOMER COMERCIO FROM GXOPERA.FLICOM1 
WHERE LIFECHd>='20190826' AND LICOMER IN (SELECT substr(digits(lidcom), 6, 7) FROM ARNALDOLIB.PRUEBCLR) AND LICODTR='000054'
except 
SELECT LIMPGS MONTO, LIDCOM COMERCIO FROM ARNALDOLIB.PRUEBCLR--  GROUP BY LIDCOM ORDER BY LIDCOM 
SELECT SUM(LIMPGS) MONTO, LIDCOM COMERCIO FROM ARNALDOLIB.PRUEBCLR--  GROUP BY LIDCOM ORDER BY LIDCOM 
SELECT count(*),lidcom FROM ARNALDOLIB.PRUEBCLR  GROUP BY LIDCOM ORDER BY LIDCOM 

SELECT sum(LIMONTO) MONTO,LICOMER COMERCIO FROM GXOPERA.FLICOM1 
WHERE LIFECHd>='20190826' AND LICOMER IN (SELECT substr(digits(lidcom), 6, 7) FROM ARNALDOLIB.PRUEBCLR) AND LICODTR='000054'
GROUP BY licomer
except
SELECT sum(LIMPGS) MONTO, LIDCOM COMERCIO FROM ARNALDOLIB.PRUEBCLR GROUP BY LIDCOM


select * from arnaldolib.pruebclr 
where lidcom in (
'700720','700857',
'700861','701529',
'800672','800712',
'801016','801035',
'801123','1001166')


except 

 in
select * from gxopera.opliqui where opnroref in( 
select lerrnb  from arnaldolib.pruebclr) AND OPIMPORB<0 AND OPCODBCO IN (2)
and opnroref='923313722452'
select * from gxopera.fmoneda1
select * from gxopera.flicom

select * from LIBDEBITO.pruebclr WHERE LERRNB = '923313722452'
DELETE from LIBDEBITO.pruebclr WHERE LERRNB = '923313722452'
select * from gxopera.fmoned
update arnaldolib.pruebclr  set lfectr='20190826'

select * from libdebito.tc33 where tcbine='488234'

/*Acreditaciones por VtaMinutos y Pago de Facturas en ITAU 28/08/19(por fecha real)*/
Select /*opferea,opcodtrn, count(*)Cantidad, opliqde, sum(opmonto-opcomi)Neto*/ * from silverlib.opmovisil where opferea < '20190826' and oprador = '981' and opcodtrn in ('514000','524000','901020','902020') 
and opliqde = '20190826'
group by opferea,opcodtrn, opliqde;
Select * from silverlib.flicom1sil where licomer = '6900002' and lifecredi = '20190827';

/*Acreditaciones por  VtaMinutos y Pago de Facturas en ITAU 28/08/19 (por fecha real)*/
Select opferea, opcodtrn, count(*)Cantidad, sum(opmonto-opcomi)Neto, opliqde from silverlib.opmovisil where opferea < '20190827' and oprador = '981' and opcodtrn in ('514000','524000','901020','902020') 
and opliqde = '20190827'
group by opferea,opcodtrn, opliqde;
Select * from silverlib.flicom1sil where licomer = '6900002' and lifecredi = '20190828';


