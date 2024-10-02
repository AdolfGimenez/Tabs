---------------------------TABLAS QUE CARGAN EN EL PASO 1 - PASO 2--------------------------
SELECT *FROM GXBDBPS.NUT999
SELECT * FROM GXBDBPS.AIT001 WHERE AIID = '20220304'; ---CABECERA

--UPDATE GXBDBPS.AIT001 SET AIEST = 'PEN' WHERE AIID = '2022027001'

--VERIFICAR EN PARAMETRO(VISA) LA MARQUITA DE S poner en N
--Y PONER EN ESTADO PEN si esta EN PRO.
SELECT count(*) FROM GXBDBPS.AIT002 WHERE AIID = '20220304' and aitcest = 'PEN' ---<> 'PRO';

SELECT count(*) FROM GXBDBPS.AIT003 WHERE AIID = '2022027001';

--Proceso Paso 2 
SELECT *FROM GXBDBPS.NUT999 where dbgusrid = 'U99RODRI' AND DBGCLA LIKE '2022084%'

Select count(*)Cantidad, sum(opimpor) Importe, opmensaj Mensaje, opcodbco Banco from gxopera.opliqui
where opfecliq >= '20211130' and substr(opcampoa,1,6) = '703002'
and opstat not in ('00','77','88')
group by opmensaj, opcodbco
order by banco desc,cantidad desc

--detalle--

Select *
from gxopera.opliqui where opfecliq >= '20211130' and substr(opcampoa,1,6) = '703002'
and opstat not in ('00','77','88') --and opcodbco <> 64
order by opcanrei desc

--reporte
select a.opncomer cod_comercio,b.codeno denominacion,b.corucn ruc, b.enemiso banco_pagador,c.pardescri descripcion_banco,
count(*) cantidad_trx,sum(a.opimpor) monto_total,b.coteln telefono,b.coemail mail
from gxopera.opliqui a
inner join gxbdbps.comaeaf b on a.opncomer=b.cocomer
inner join gxopera.clparf c on b.enemiso=c.parcodbco
where opfecliq >= '20211130' and substr(opcampoa,1,6) = '703002'
and opstat not in ('00','77','88')
group by a.opncomer,b.codeno,b.corucn,b.coteln,b.coemail,c.pardescri,b.enemiso

----para ver tiempos----
SELECT *FROM GXBDBPS.NUT999 where dbgusrid = 'U99RODRI' AND DBGCLA LIKE '2022089%'
