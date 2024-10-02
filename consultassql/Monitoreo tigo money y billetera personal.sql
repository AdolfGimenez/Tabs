--detalle de transacciones tigo money y billetera personal
select lfectr fecha_real,lhortr hora ,lnrtar tarj,lerrnb refencia,lesttr estado,lcretr cod_retorno,lcodtr cod_trx,limpgs importe,lidcom cod_atm,lcomtr comercio,
lactfj Activo,leca62 Version,lcotel linea_cel
--select count(*) Cantidad,lcretr Cod_Retorno,lesttr Estado, lbinpr BIN ,limpgs importe,substr(lidtra,1,1) Origen
--select *
from libdebito.drconbep where lfectr between '20200521' and '20200521'
and lenemi in ('571')--,'581')
--and lcodtr in ('000052','567102')
--and lesttr='A'
and lerrnb='014273038159'
--and limpgs>1
--and substr(lidtra,1,1)='T'
--and lcretr in ('19','00')
--and lhortr>150000
order by lhortr desc


/*resumen de transacciones tigo money y billetera personal
000052 Tigo Money, 567102 Billetera personal*/
/*
select lfectr fecha,count(*) Cantidad,lcretr Cod_Retorno,lesttr Estado,lcodtr COD_TRX ,SUM(limpgs) importe,substr(lidtra,1,1) Origen
from libdebito.drconbep where lfectr between '20200422' and '20200422'
and lenemi in ('571','581')
--and lcodtr in ('000052','567102')
--and lesttr='A'
and limpgs>1
group by lfectr,lcretr,lesttr,lcodtr,substr(lidtra,1,1)
order by lcretr,cantidad desc
*/

/*
select * from gxbdbps.comaeaf where cocomer='1000416'
select * from gxbdbps.coafmaf where afcodi='10843809'
select * from gxbdbps.terminal where tertid='10843809'
select * from  gxbdbps.geoadmin
UPDATE GXBDBPS.GEOADMIN SET ADMTCCARP = ''
*/

--select * from libdebito.switchent


