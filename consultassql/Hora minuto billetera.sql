
/*HORA*/

--567101','567102
select lfectr fecha,substr((lhortr + 10000000),3,2) Hora, count(*) Cant, sum(limpgs) Importe,substr(lidtra,1,1) Origen
from libdebito.drconbep where lfectr between '20221130' and '20221130'
--and lcodtr in ('000052','567102') 
--and lbinpr='703002'
and substr(lidtra,1,1) in ('T','P')
group by lfectr,substr((lhortr + 10000000),3,2) ,substr(lidtra,1,1), lfectr 
order by substr((lhortr + 10000000),3,2) desc


/*HORA_Minuto*/
select lfectr fecha,substr((lhortr + 10000000),3,4) Hora, count(*) Cant, sum(limpgs) Importe--,substr(lidtra,1,1) Origen
from libdebito.drconbep where lfectr between '20221129' and '20221129'
--and lcodtr in ('000052','567102') 
--and lbinpr='703002'
--and substr(lidtra,1,1) in ('P','T')
group by lfectr,substr((lhortr + 10000000),3,4) --,substr(lidtra,1,1)
order by substr((lhortr + 10000000),3,4) desc



select substr((lhortr + 10000000),3,4) Hora, count(*) Cant,lesttr estado,lcretr retorno, sum(limpgs) Importe,substr(lidtra,1,1) Origen
from libdebito.drconbep where lfectr between '202' and '20201230'
--and lcodtr in ('000052','567102') 
--and lbinpr='703002'
and substr(lidtra,1,1) in ('P')
group by substr((lhortr + 10000000),3,4) ,substr(lidtra,1,1),lesttr,lcretr
order by substr((lhortr + 10000000),3,4) desc




/*HORA_MINUTO*/
select  fecha, avg(Cant),max (Cant)
from (
select lfectr fecha, substr((lhortr + 10000000),3,6) Hora_Min_Seg, count(*) Cant
from libdebito.drconbep 
where lfectr between '20221129' and '20221129'
and substr(lidtra,1,1) in ('P','T')
--and lhortr between '120000' and '180000'
--and lcodtr='567102'
--and substr((lhortr + 10000000),3,4) between 13 and 14
--and lenemi in ('020','002')
--and lcodbc in ('VSA','MST')
group by lfectr, substr((lhortr + 10000000),3,6)
) t
group by fecha
order by lfectr asc, cant desc



select * from atmcentre.tbbine0p
/*POR DÍA*/

select lfectr fechareal, count(*) cantidad
from libdebito.drconbep 
where lfectr between '20210601' and '20220117'
and substr(lidtra,1,1) in ('P','T')
--and lhortr between '120000' and '180000'
--and lcodtr='567102'
--and substr((lhortr + 10000000),3,4) between 13 and 14
--and lenemi in ('020','002')
and lcretr in ('03')
and lcodbc in ('CAB','PAN')
group by lfectr
order by lfectr desc


and lcodtr in ('000054','0110000','0120000','0140000')
*/
/*
136 0520
586 0430
572 0331
389 0229
497 0131
*/

/*
select count(*) cantidad,substr(hmnumta,1,6) bin,hmfepro fecha_pago ,hmimpo2
from gxbdbps.thmovaf  where hmemiso='021'  and hmnumta='6274310212000268' and  hmnoved='*PAGOTC'
 group by substr(hmnumta,1,6),hmfepro,hmimpo2
order by hmfepro desc

select * from gxbdbps.tmoviaf  where mvemiso='002' and mvnoved='*PAGOTC' order by mvfepro desc

*/
/*
********************************************************************************************
* TRANSACCIONES EN ATM POR CODIGO DE RETORNO                                               *
********************************************************************************************
select count(*) Cant,lcodbc marca ,lesttr estado,lcretr cod_retorno,coddes descripcion, lcretr cod_retorno, lesttr estado, sum(limpgs) Importe,substr(lidtra,1,1) Origen
from libdebito.drconbep inner join libdebito.tbcret0p on lcretr=codnro where lfectr between '20210402' and '20210402'
--and lcodtr in ('000052','567102') 
--and lbinpr='703002'
and substr(lidtra,1,1) in ('T')
group by lcodbc,substr(lidtra,1,1),lesttr,lcretr,coddes,lcretr,lesttr
order by cant desc



select * from libdebito.tbcret0p


select * from gxbdbps.tmoviaf where mvfeval='20210527'

*/


/*
sELECT * FROM GXFINDTA.TCLTSB WHERE  
tsbnref in ('123482610374','123482612804','123482598519','123482639400')


select * from gxbdbps.viadqenti


select * from yapi.drconbepau where jocode='R' and joentt='PT'

select * from gxbdbps.tmensaf

*/

select lfectr fecha,substr((lhortr + 1000000000),3,2) Hora, count(*) Cant
from libdebito.drconbep where lfectr between '20220512' and '20220512'
--and lcodtr in ('000052','567102') 
--and lbinpr='703002'
and substr(lidtra,1,1) in ('P','T')
and lcodbc in ('VSA','MST') and lenemi in ('040','020','002')
group by lfectr,substr((lhortr + 1000000000),3,2)
order by substr((lhortr + 1000000000),3,2) desc



select * from gxbdbps.tdemis



SELECT JOB_NAME, COUNT(*) AS ROWS_UPDATING   FROM QSYS2.RECORD_LOCK_INFO   WHERE   
     SYSTEM_TABLE_SCHEMA = 'LIBDEBITO' AND         LOCK_STATE = 'UPDATE'   GROUP BY JOB_NAME   ORDER BY ROWS_UPDATING DESC

SELECT JOB_NAME, COUNT(*) AS ROWS_UPDATING   FROM QSYS2.RECORD_LOCK_INFO   WHERE SYSTEM_TABLE_NAME = 'SALES' AND
         SYSTEM_TABLE_SCHEMA = 'TOYSTORE' AND         LOCK_STATE = 'UPDATE'   GROUP BY JOB_NAME   ORDER BY ROWS_UPDATING DESC



select lfectr fecha, count(*) Cant, sum(limpgs) Importe,substr(lidtra,1,1) Origen
from libdebito.drconbep where lfectr between '20220930' and '20221013'
--and lcodtr in ('000052','567102') 
--and lbinpr='703002'
and substr(lidtra,1,1) in ('P')
group by lfectr,substr(lidtra,1,1), lfectr
order by 1 desc 
order by substr((lhortr + 10000000),3,2) desc



select * from libdebito.drconbep


