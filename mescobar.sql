-- transacciones con tarjeta de coop nemby

select * from libdebito.drconbep where lfectr = '20201027' and LENEMI = '174' order by lhortr desc;

SELECT * FROM GXBDBPS.TSWAUT WHERE AUTTRXFCHF = '20201027' AND AUTRRNBEP IN (select LERRNB from libdebito.drconbep where lfectr = '20201027' and LENEMI = '174');

SELECT * FROM GXBDBPS.TSWAUT WHERE AUTTRXFCHF = '20201027' ORDER BY AUTTRXHORF DESC;

select * from libdebito.drconbep where LENEMI = '174' order by lhortr desc;

select * from gxfindta.tcltsb where;

--PRUEBAS CON ATM
select * from libdebito.drconbep where lfectr = '20210125' and substr(lidtra,1,4) = 'T002' and lhisde = '*COOPÑE' order by lhortr desc;

select lctaor CUENTA_ORIGEN, lctade CTA_DESTINO, lnrtar TARJETA, lfectr FECHA, lhortr HORA, limpgs IMPORTE, lcomtr ATM, lcretr COD_RETORNO, lesttr ESTADO_TRX
from libdebito.drconbep where lfectr = '20210125' and substr(lidtra,1,4) = 'T002' and lhisde = '*COOPÑE' order by lhortr desc;
