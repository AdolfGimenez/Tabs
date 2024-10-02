/*resumen de transacciones tigo money y billetera personal
000052 Tigo Money, 567102 Billetera personal*/

select lfcotr fecha,count(*) Cantidad,lcretr Cod_Retorno,lesttr Estado,lcodtr COD_TRX ,txdtrx Descrip_trx , SUM(limpgs) importe,substr(lidtra,1,1) Origen
from libdebito.drconbep inner join libdebito.tbctra0p on lcodtr=txctrx where lfcotr between '20200604' and '20200604'
--and lenemi in ('571','581')
and lcodtr in /*('000052',*/('567102')
and substr(lidtra,1,1)='P'
and lesttr='A' and lcretr='00'
--and limpgs>1
group by lfcotr,lcretr,lesttr,lcodtr,txdtrx,substr(lidtra,1,1)
order by cantidad desc

----------------------------------------------------TIGO-----------------------------------------------
SELECT * FROM LIBDEBITO.DRCONBEP 
WHERE LCODTR='000052' AND SUBSTR(LIDTRA,1,1)='P' AND LFECTR='20200417' --LESTTR='A' AND LCRETR='00' AND 
ORDER BY LHORTR DESC
----------------------------------------------------PERSONAL-------------------------------------------
SELECT * FROM LIBDEBITO.DRCONBEP 
WHERE LCODTR='567102' AND SUBSTR(LIDTRA,1,1)='P' AND LFECTR='20200610' --AND LESTTR='Q' AND LCRETR=' ' 
ORDER BY LHORTR DESC
SELECT
LFCOTR FECHA_CIAL, LFECTR FECHA_TRX, LHORTR HORA, substr(lnrtar,1,6)||'XXXXXX'|| substr(lnrtar,13,4) TARJETA ,LBINPR BIN,LENEMI EMISOR, LCODBC MARCA, LIDCOM COMERCIO,LCOMTR NOMBRE, LIMPGS IMPORTE, 
LIDTRA ID_TRX, LCODTR COD_TRX, LCAUTR AUTORIZACION, LCRETR RESPUESTA, LESTTR ESTADO, LERRNB REFERENCIA, LECA62 DISPOSITIVO,LACTFJ ACT_FIJO, LCOTEL,LCORED,LNTOKE,LSALTR,LDISTR
FROM LIBDEBITO.DRCONBEP
--WHERE LNRTAR='6274311510001073'
WHERE LCODTR='567102' AND SUBSTR(LIDTRA,1,1)='P' AND LFECTR='20200610' AND LCRETR='PE' 
ORDER BY LFECTR DESC, LHORTR DESC
select * from libdebito.drconbep where lerrnb = '011365864381';
select * from gxopera.opmovi where opnoref = '011365864381';
select * from gxopera.opliqui where  opnroref = '011365864381';

		SELECT LCRETR RESPUESTA, COUNT(*) CANTIDAD, LENEMI EMISOR
		FROM LIBDEBITO.DRCONBEP
		--INNER JOIN LIBDEBITO.TBCRET0P
		--ON (CODNRO=LCRETR)
		WHERE LCODTR='567102' AND SUBSTR(LIDTRA,1,1)='P' AND LFECTR='20200611'
		GROUP BY LENEMI, LCRETR
		ORDER BY LCRETR ASC, LENEMI ASC
		

