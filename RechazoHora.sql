-- VERIFICA LOS CODIGOS DE RECHAZOS POR  BIN, TIPO DE TRANSACCION Y CODIGO DE PROCESADORAS = LENEMI
SELECT lfectr AS FECHA, lhortr as HORA,lbinpr AS Bin, lhisde AS REPONDE,lcodbc AS MARCA,substr(lidtra,1,1) Origen,A.TXDTRX DETALLES, lbcodb AS LENEMI,lcretr AS RET,lesttr AS EST,lcodtr AS CO_TRX,lcomtr AS COMERCIO,limpgs AS MONTO,lcautr AS AUTO,lerrnb AS REFERENCIA,leca62 AS EQUIPO,lactfj AS ACTIVO,lnfact AS PAIS
FROM libdebito.drconbep 	inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr WHERE lfectr BETWEEN '20211204' AND '20211204'  and lhortr>080000   --and lnrtar like '434559%'
and lcretr in ('91','92','96','93','77','76') order by lhortr desc;


---EN CASO DE VERIFICAR TARJETAS VISA CONTI O BNF DAR AVISO A ENCISO
SELECT lfectr AS FECHA, lhortr as HORA,lbinpr AS Bin, lhisor AS EMISOR, lhisde AS REPONDE,lcodbc AS MARCA, lbcodb AS LENEMI,loritr AS P_A,lcretr AS RET,lesttr AS EST,lcodtr AS CO_TRX,lcomtr AS COMERCIO,limpgs AS MONTO,lcautr AS AUTO,lerrnb AS REFERENCIA,leca62 AS EQUIPO,lenemi AS LENEMI,lactfj AS ACTIVO,lnfact AS PAIS
FROM libdebito.drconbep WHERE lfectr BETWEEN '20211204' AND '20211204' and lhortr>080000   --and lnrtar like '434559%'
and lcretr in ('81','06')--  and lhor9tr>080000  --and lnrtar like '456976%'
order by lhortr desc;

------- ESTADISTICAS DE RECHAZO POR HORA EN POS------
select  lfectr AS FECHA,substr((lhortr + 10000000),3,2) Hora, count(*) Cantidad, lcretr AS RETORNO,SUBSTR(LIDTRA,1,1) DISPOSITIVO, sum(limpgs) Importe
from libdebito.drconbep where lfectr between '20211204' and '20211204'
and substr(lidtra,1,1) = 'P' and lcretr IN ('91','92','96','77','76') and lhortr>080000
group by lcretr,lfectr,substr((lhortr + 10000000),3,2) ,SUBSTR(LIDTRA,1,1) order by substr((lhortr + 10000000),3,2) desc, SUBSTR(LIDTRA,1,1);

------- ESTADISTICAS DE RECHAZO POR HORA EN CAJEROS------
select  lfectr AS FECHA,substr((lhortr + 10000000),3,2) Hora, count(*) Cantidad, lcretr AS RETORNO,SUBSTR(LIDTRA,1,1) DISPOSITIVO, sum(limpgs) Importe
from libdebito.drconbep where lfectr between '20211204' and '20211204'
and substr(lidtra,1,1) = 'T' and lcretr IN ('91','92','96','77','76') and lhortr>080000
group by lcretr,lfectr,substr((lhortr + 10000000),3,2) ,SUBSTR(LIDTRA,1,1) order by substr((lhortr + 10000000),3,2) desc, SUBSTR(LIDTRA,1,1);


------- ESTADISTICAS DE PIN INCORRECTO EN CASO DE EXCESO DE CANTIDAD CON RESPECTO A LAS ANTERIORES REGISTROS VERIFICAR VOLUMEN EN POS KIBANA Y VERIFICAR MENSAJE EN LA AS400------
select  lfectr AS FECHA,substr((lhortr + 10000000),3,2) Hora, count(*) Cantidad, lcretr AS RETORNO,SUBSTR(LIDTRA,1,1) DISPOSITIVO, sum(limpgs) Importe
from libdebito.drconbep where lfectr between '20211204' and '20211204'
and substr(lidtra,1,1) = 'P' and lcretr IN ('55') and lhortr>080000
group by lcretr,lfectr,substr((lhortr + 10000000),3,2) ,SUBSTR(LIDTRA,1,1) order by substr((lhortr + 10000000),3,2) desc, SUBSTR(LIDTRA,1,1);

---ACREDITACIONES EN LINEA EN CASO DE RECHAZO 92 VERIFICAR EL DRIVER EN LA 234 ACRECOMERCIO DAR AVISO A ENCISO
Select *
from gxopera.opliqui where opfecliq >= '20211204' and substr(opcampoa,1,6) = '703002'
and opstat not in ('00','77','88') and opcodbco <> 64 order by ophorliq desc;

----Contador de rehazo en Linea
Select count(*)Cantidad, sum(opimpor) Importe, opmensaj Mensaje, opcodbco Banco from gxopera.opliqui
where opfecliq >= '20211130' and substr(opcampoa,1,6) = '703002'
and opstat not in ('00','77','88') and opcodbco <> 64
group by opmensaj, opcodbco
order by banco desc;
