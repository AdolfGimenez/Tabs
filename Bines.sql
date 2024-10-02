
select COUNT(*) CANTIDAD,lcodbc marca,lcretr retorno, lbinpr bin from libdebito.drconbep where lfectr between '20220706' and '20220707'
--and lnrtar like '627431155%' 
and lcretr in ('55') and lhortr >='230000' --and '085400'
GROUP BY lcretr,lcodbc,lbinpr;

select COUNT(*) CANTIDAD,lcodbc marca,lcretr retorno, lbinpr bin from libdebito.drconbep where lfectr between '20220706' and '20220707'
--and lnrtar like '627431155%'
and lcretr in ('55') --and lhortr between '230000' and '085400'
GROUP BY lcretr,lcodbc,lbinpr;

select * from libdebito.binprodu where RGBIN='602049'

select lfectr AS FECHA , lcodbc AS MARCA,lenemi EMISOR,LBINPR BIN,ENNOMBR entidad, COUNT(*) CANTIDAD,lesttr AS ESTADO,
lcretr AS COD_RETORNO, coddes Descripcion_COD,CAST(SUM(limpgs)AS bigint) as Importe
from libdebito.drconbep
right join libdebito.tbcret0p on lcretr = codnro
INNER JOIN gxbdbps.gentiaf ON (ENEMISO=LENemi)
where lfectr between '20220707' and '20220707' and codmar='BEPS'--and   lcodbc = 'DIN' and
--and LBINPR in ('703002','703020','703040')--
and lcretr in ('55','00')--and lhortr between '080300' and '104700'
GROUP BY Lfectr, lcretr,LBINPR, lcodbc,LENEMI,ennombr,coddes, lesttr
order by LENEMI ASC,cantidad desc
