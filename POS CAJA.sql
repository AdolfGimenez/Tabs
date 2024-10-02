--DRCONBEP
select * from libdebito.drconbep where lfectr = '20210623' AND LIDCOM = '0100001'  and LACTFJ = '00100001'order by lhortr desc;


select lnrtar TARJETA, lcodbc MARCA, lerrnb REFERENCIA,
lidcom COD, lcomtr COMERCIO, lhisor ORIGEN, lhisde DESTINO, lfectr FECHA, lhortr HORA, 
limpgs IMPORTE, lcretr COD_RETORNO, lesttr ESTADO_TRX, lcodtr COD_TRX
from libdebito.drconbep 
where lfectr = '20210623' AND LIDCOM = '0100001'  and LACTFJ = '00100001'
AND LIDCOM = '0100001' 
and lhortr >= '94400' 
and lhortr <= '114400'
and lactfj = '43333369';




--TSWAUT
select autmontdes from gxbdbps.tswaut
LIMIT 1;
 where AUTRRNBEP in (
select  lerrnb 
from libdebito.drconbep 
where lfectr = '20210203' 
AND LIDCOM = '0100001' 
and lhortr >= '94400' 
and lhortr <= '114400'
and lactfj = '43333369');

select autcodcomb COD, autcomraz COMERCIO, autcodser SERVICIO,  autcodpre PRESTACION, 
autdistip TIPO_DISPOSITIVO, autpannro TARJETA, autmartar MARCA, 
autprotar PROD_MARCA, autrolbep ROL, autrrnbep REFERENCIA,
auttrxfchf FECHA, auttrxhorf HORA, auttrxcod COD_TRX
from gxbdbps.tswaut where AUTRRNBEP in (
select  lerrnb 
from libdebito.drconbep 
where lfectr = '20210203' 
AND LIDCOM = '0100001' 
and lhortr >= '94400' 
and lhortr <= '114400'
and lactfj = '43333369');


--TRANSACCIONES DE LA MARCA
select * from visa.vistrndta where VIRRNBEPSA in (
select  lerrnb 
from libdebito.drconbep 
where lfectr = '20210203' 
AND LIDCOM = '0100001' 
and lhortr >= '94400' 
and lhortr <= '114400'
and lactfj = '43333369'
);

--codigos de respuesta
select * from LIBDEBITO.TBCRET0P;

--CODIGOS DE TRANSACCION CON DESCRIPCION
select * from libdebito.TBCTRA0P where TXCTRX = '013000';

select * from gxfindta.tclmrt;

select * from cierrelib.tmpnum;

select * from gxswtdta.tmifnm;


