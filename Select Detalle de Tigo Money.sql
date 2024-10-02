select lfectr fecha_real,lhortr hora ,lnrtar tarj,lerrnb refencia,lesttr estado,lcretr cod_retorno,lcodtr cod_trx,limpgs importe,lidcom cod_atm,lcomtr comercio,
lactfj Activo,leca62 Version,lcotel linea_cel,lcored portabilidad,lctade,lidtra
--select count(*) Cantidad,lcretr Cod_Retorno,lesttr Estado, lbinpr BIN ,limpgs importe,substr(lidtra,1,1) Origen,substr(leca62,1,2) POS
--select count(*) Cantidad, lcretr,substr(leca62,1,2) POS
--select *
from libdebito.drconbep where lfectr between '20200618' and '20200618'
--and lenemi in ('571')--,'581')
and lcodtr in /*('567102'),*/('000052') 
--and lesttr in ('A','Q','R')
and lcretr in ('91','96','93')
--and limpgs>1
--and lcotel='0976571406'
--and lbinpr='703002'
--and lidcom='0200283'
and lerrnb in ('017080412917','017080414030')
--and substr(leca62,1,2) in ('VX','SP','I%')
--and substr(lidtra,1,1)='T'
--and lerrnb='010463195894'
--and lhortr>120000
--and lidcom='0701617'
--and lerrnb='010363162874'
--group by lcretr,substr(leca62,1,2)
--AND LCTADE LIKE '%0971954315%'
--and lctade like '%000971279348%'
and lhortr>124500
--group by lcretr,lesttr,lbinpr,limpgs,substr(lidtra,1,1),substr(leca62,1,2)
order by lhortr desc

/*VARIAS*/
/*
select * from libdebito.tbcret0p
select * from libdebito.linporta where lnumer='972762579'
select * from gxbdbps.bst014 where bs14rrn='010062942768'
select * from libdebito.SWITCHENT where sentnom like '%JAVRG042%'
select * from libdebito.billperso where bilperpro=''

delete from libdebito.billperso where bilperpro=''
update libdebito.billperso set bilperimp=1
update libdebito.billperso set bilperpro=''
*/

--select * from LIBDEBITO.entfil001 where EntPROGRA = 'JAVRG042P' and entdatmsg like('%010463250064%') 
--select * from LIBDEBITO.entfil001 where EntPROGRA = 'JAVRG042P' and entdatmsg like('%010463286346%')

--select * from LIBDEBITO.entfil001 where EntPROGRA = 'JAVRG042P' 

select substr(lctade,5,15) Referencia_Tigo, lfectr Fecha_Trx, lhortr Hora_Trx, limpgs Importe, lerrnb Referencia_Bepsa, lidtra Id_Trx,lcodtr cod_trx, lcretr COD_RESP, lesttr Estado,lcotel LINEA
from libdebito.drconbep where lfectr = '20200415' and lcodtr = '000052'
ORDER BY LHORTR DESC

select substr(lctade,5,15) Referencia_Tigo, lfectr Fecha_Trx, lhortr Hora_Trx, limpgs Importe, lerrnb Referencia_Bepsa, lidtra Id_Trx,lcodtr cod_trx, lcretr COD_RESP, lesttr Estado,lcotel LINEA
from libdebito.drconbep where lfectr = '20200415' and lcodtr = '000052' AND lcretr ='00' AND lesttr='D'
ORDER BY LHORTR DESC


SELECT * FROM LIBDEBITO.DRCONBEP WHERE LFECTR = '20200618' AND LNRTAR LIKE '488234%' AND LECA62 = 'T888'
