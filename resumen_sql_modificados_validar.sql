--Usar este es con las condiciones Visa de Emisor
select lfectr AS FECHA , lcodbc AS MARCA,lenemi EMISOR,ennombr ENTIDAD, COUNT(*) CANTIDAD
,lesttr AS ESTADO, lcretr AS COD_RETORNO, coddes Descripcion_COD,CAST(SUM(limpgs)AS bigint) importe
from libdebito.drconbep
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join libdebito.tbcret0p on lcretr = codnro
right join gxbdbps.gentiaf ON (ENEMISO=LENemi) and   lcodbc = 'VSA' and codmar='VISA'
where lfectr='20210513'
and lcodbc='VSA' and  codmar = 'VISA'
and lenemi in ('015','020')
GROUP BY Lfectr, lcretr, lcodbc,LENEMI,coddes, lesttr,ennombr
order by lenemi desc , lcretr asc, cantidad desc;

--ADQ.VISA  CONTINENTAL         
select lenemi EMISOR,ennombr ENTIDAD, COUNT(*) CANTIDAD,substr(lidtra,1,1) Origen, lcretr AS COD_RETORNO, coddes Descripcion_COD,CAST(SUM(limpgs)AS bigint) importe
from libdebito.drconbep
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join libdebito.tbcret0p on lcretr = codnro
right join gxbdbps.gentiaf ON (ENEMISO=LENemi) and   lcodbc = 'VSA' and codmar='VISA'
where lfectr='20210513' --and   lcodbc = 'MST' and codmar='MSTC'
and lenemi='540'
--and lcretr in '91'
--and lhortr between '080300' and '104700'
GROUP BY lcretr, lcodbc,LENEMI,coddes,substr(lidtra,1,1),ennombr
order by cantidad desc;
 
