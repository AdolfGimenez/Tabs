--Tabla de Autorizaciones
select COUNT(*) from gxbdbps.tswaut where  AUTTRXFCHC='20210113' AND AUTESTCLE  <>'N';--
select * from gxbdbps.tswaut where  AUTTRXFCHC='20210113'; --and AUTCODSER='PAGFAC' AND AUTCODPRE='PFTA';

update gxbdbps.tswaut set AUTESTCLE = 'P' where  AUTTRXFCHC='20210113' AND AUTESTCLE = 'C' ;--//and AUTCODSER='PAGFAC' AND AUTCODPRE='PFTA'

--Tabla de fecha
select * from GXFINDTA.TCLFEC;
--UPDATE GXFINDTA.TCLFEC SET FECANT = '20200903',FECPRO = '20210113',FECSIG = '20200907' WHERE FECID = '002';

--Tablas de procesos
select * from GXFINDTA.TCLCSP where cpcfec='20210113'; --detalle
delete from GXFINDTA.tclcsp where cpcfec='20210113';
select * from GXFINDTA.TCLCPC where cpcfec='20210113'; --Cabecera
delete from GXFINDTA.TCLCPC where cpcfec='20210113';

--Tabla Temporal
select * FROM GXFINDTA.TCLTPC WHERE TPCFPRO='20210113';
DELETE FROM GXFINDTA.TCLTPC WHERE TPCFPRO='20210113';

--Tabla Movimientos PARA HACER CONTROL CON FABIO

SELECT  * from GXFINDTA.TCLMOV WHERE MOVFPRO  ='20210113' AND SERCODI = 'REDPAG '; 
delete from GXFINDTA.TCLMOV WHERE MOVFPRO  ='20210113' --AND SERCODI = 'REDPAG '; 


SELECT  * from GXFINDTA.TCLMOVWHERE    MOVFPRO='20210113'; 
DELETE  GXFINDTA.TCLMOd;



--Cabecera
select * from GXFINDTA.tclmod where movidmov in (3842739,3842741) --detalle

SELECT * FROM GXFINDTA.CCASI21;

SELECT * FROM  GXTRJDTA.TDGECO WHERE ENSIDSERV='COMPRA'; SET ECOIVAINCL='N'

  GXTRJDTA.TDGECO WHERE ENTCODENT=1020; SET ECOVALCOMI=0.73

SELECT * FROM gxfindta.tclprc where prcparm in ('CAIN','CAOU','GIRO');  SET PRCCOD = 'PCLR054'



select T.ecccderrcc ,E.ECCDSERRCC ,T.TPCESCLE, count(*)FROM
GXFINDTA.TCLTPC T INNER JOIN GXFINDTA.tclecc E
ON T.ecccderrcc = E.ecccderrcc
where T.TPCFPRO='20210113' group by
 T.ecccderrcc, T.TPCESCLE,E.ECCDSERRCC ;

/*
las transacciones que son evaluadas no tienen esos errores, pero para controlar los asientos no debe hacer ningun error
calculo de renta, controlar
red de pagos, Dinelco Efectivo

Comisionamiento, detalle de comision, controlar
Cico
Compras
Dinelco Efectivo (Detalle de Comisionamiento)

10135 - Dinelco Efectivo
el monto neto salia mal porque calculaba mal la renta
para coosofan no debe calcular comision Dinelco Efectivo
*/

--# 10135, Dinelco Efectivo
--Consulta de Datos de la ejecucion en Produccion

--AJUSTE EN LA DISTRIBUCION DE LA COMISION EN EL SERVICIO COMPRA
select * from libclea.TCLMOV where SERCODI = 'COMPRA' and MOVFPRO = '20210113' AND MOVCODEM = '102001' and MOVRRNBEP in (
'101232829364',   
'101232829427',  
'101232829438')   

-- and MOVRRNBEP in (
-- '101332890073',
-- '101332890183',
-- '101332890767',
-- '101332890781',
-- '101332890836',
-- '101332890874');

-- 10900324
-- 10900325
-- 10900326
-- 10900327
-- 10900328

select * from libclea.TCLMOd where MOVIDMOV in (
10798324,
10798328,
10798329)

select * from gxtrjdta.tdgeco where ecoentrol = '102001';

select * from gxfindta.TCLCPP where sercodi = 'COMPRA';




SELECT * FROM LIBPROD.OPMOVI60 WHERE OPNOREF IN(
'101232835889',
'101232839468',
'101332862681',
'101332868968',
'101332870876');
REDPAG
--Consulta de datos en la ejecucion de la mejora en Testing
1751641
1751642
1751643
1751644
1751645
select * from gxfindta.TCLMOV where SERCODI = 'DINEFE' and MOVFPRO = '20210113' and MOVRRNBEP in (
'101232835889',
'101232839468',
'101332862681',
'101332868968',
'101332870876');
select * from gxfindta.TCLMOd where MOVIDMOV in (
1751641,
1751642,
1751643,
1751644,
1751645 );

SELECT * FROM gxopera.OPMOVI WHERE OPNOREF IN(
'101232835889',
'101232839468',
'101332862681',
'101332868968',
'101332870876');

--para coosofan no debe calcular comision Dinelco Efectivo
--DATOS DE PRODUCCION
select * from gxbdbps.comaeaf where cocomer = '8100177';

select * from libclea.tclmov where movcomer = '8100177' and movfpro = '20210113' and SERCODI = 'DINEFE';

select * from libclea.TCLMOd where MOVIDMOV in (
10900362,
10900400,
10900434
 );
 
--DATOS DE TESTING
select * from GXFINDTA.tclmov where movcomer = '8100177' and movfpro = '20210113' and SERCODI = 'DINEFE';

select * from gxfindta.tclmod where MOVIDMOV in (
1751679,
1751717,
1751751);

select enemiso from gxbdbps.comaeaf where cocomer = '0100001';

--#10136, Red de Pagos, Ajuste de comisionamiento en el Monto Neto

PRODUCCION
select * from libclea.TCLMOV where SERCODI = 'REDPAG' and MOVFPRO = '20210113';

select * from libclea.TCLMOd where MOVIDMOV in (
10900473,
10900474,
10900475,
10900476,
10900477)

TESTING

select * from gxfindta.TCLMOV where SERCODI = 'REDPAG' and MOVFPRO = '20210113';

select * from GXFINDTA.TCLMOd where MOVIDMOV in (
1751790,
1751791,
1751792,
1751793,
1751794)


SELECT * FROM gxopera.OPMOVI WHERE OPNOREF IN(
'101232829203',
'101232829860',
'101232830415',
'101232830610',
'101232830611');

SELECT * FROM G
CICO
/*Servicio: CICO - GIROS - POS*/
TESTING
Select '1-EXISTE-OPMOVI' ORIGEN,OPFECOM feproceso,substr(opidtra,1,1)dispositivo, opcodtrn servicio, OPSTATUS,COUNT(*) cantidad, 'OK' ESTADO, sum(opmonto) monto,round(sum(((opmonto*100)/105)*0.01)) Comision, sum(opmonto - round(((opmonto*100)/105)*0.01)) Neto, 'OK' observaciones
from gxopera.opmovi where opfecom = '20210113' and opcodtrn IN ('390000') and substr(opidtra,1,1) = 'P'
group by OPFECOM,substr(opidtra,1,1), opcodtrn, OPSTATUS
union
Select '2-EXISTE-TCLMOV' ORIGEN, MOVFPRO, MOVCODIS,precodi, MOVESTA, COUNT(*) CANTIDAD, 'OK', sum(int(movimpo)) MONTO,sum(MOVIMCO+MOVIVCO) COMISION, round(SUM(MOVNETO)), '1 Reversa no Replicada, Comision y Neto +5% '
from gxfindta.tclmov where movfpro = '20210113' and precodi in ('GIRO') and movcodis= 'POS'
GROUP BY MOVFPRO, MOVCODIS, PRECODI, MOVESTA
ORDER BY 1;

DESARROLLO
Select '1-EXISTE-OPMOVI' ORIGEN,OPFECOM feproceso,substr(opidtra,1,1)dispositivo, opcodtrn servicio, OPSTATUS,COUNT(*) cantidad, 'OK' ESTADO, sum(opmonto) monto,round(sum(((opmonto*100)/105)*0.01)) Comision, sum(opmonto - round(((opmonto*100)/105)*0.01)) Neto, 'OK' observaciones
from libprod.opmovi60 where opfecom = '20210113' and opcodtrn IN ('390000') and substr(opidtra,1,1) = 'P'
group by OPFECOM,substr(opidtra,1,1), opcodtrn, OPSTATUS
union
Select '2-EXISTE-TCLMOV' ORIGEN, MOVFPRO, MOVCODIS,precodi, MOVESTA, COUNT(*) CANTIDAD, 'OK', sum(int(movimpo)) MONTO,sum(MOVIMCO+MOVIVCO) COMISION, round(SUM(MOVNETO)), '1 Reversa no Replicada, Comision y Neto +5% '
from libclea.tclmov where movfpro = '20210113' and precodi in ('GIRO') and movcodis= 'POS'
GROUP BY MOVFPRO, MOVCODIS, PRECODI, MOVESTA
ORDER BY 1;

select * from gxfindta.TCLMOV where SERCODI = 'CICO' and MOVFPRO = '20210113' and PRECODI = 'GIRO';

select * from gxfindta.TCLMOD where MOVIDMOV in (select movidmov from gxfindta.TCLMOV where SERCODI = 'CICO' and MOVFPRO = '20210113' and PRECODI = 'GIRO');

select sum (MODCOMI) from gxfindta.TCLMOD where MOVIDMOV in (select movidmov from gxfindta.TCLMOV where SERCODI = 'CICO' and MOVFPRO = '20210113' and PRECODI = 'GIRO')
and modtppa = 'CLIE';

select sum(movimpo), sum (movim) from gxfindta.TCLMOV where SERCODI = 'CICO' and MOVFPRO = '20210113' and PRECODI = 'GIRO';

select * from gxopera.opmovi where OPCODTRN = '390000' and OPFECOM = '20210113';


SELECT sum(CTDE01+CTDE02+CTDE03+CTDE04+CTDE05+CTDE06+CTDE07+CTDE08+CTDE09)-sum(CTcr01+CTcr02+CTcr03+CTcr04+CTcr05+CTcr06+CTcr07+CTcr08+CTCR09) FROM CONTABILID.CCCTC20 WHERE CTCOCT = '101012001000035';

--DEBE
SELECT sum(asimpo) FROM CONTABILID.CCASI20 WHERE ASCOCT = '101012001000035' AND ASFECH BETWEEN '201001' and '201231' and ascodb = 'CR';
--HABER
SELECT sum(asimpo) FROM CONTABILID.CCASI20 WHERE ASCOCT = '101012001000035' AND ASFECH BETWEEN '201001' and '201031' and ascodb = 'DB';

78622385137 debito setiembre
75904815419 credito setiembre

--PARA PODER SACAR EL SALDO ANTERIOR
SELECT * FROM CONTABILID.CCCCC20 


select * from libprod.opliqui60 where opstat = '88'

select * from gxopera.tfamrel where 
