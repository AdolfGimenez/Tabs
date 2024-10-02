--RESUMEN PARA EL GRUPALES DE NOC  PASAR ESTE POR WASAP 
------------------------------------------****************INFORME---WASAP************************************--------------------------------------
--monitoreo de transacciones debito dinelco 
select lfectr AS FECHA , lcodbc AS MARCA,lenemi EMISOR,LBINPR BIN,ENNOMBR entidad, COUNT(*) CANTIDAD,lesttr AS ESTADO,
lcretr AS COD_RETORNO, coddes Descripcion_COD,CAST(SUM(limpgs)AS bigint) as Importe
from libdebito.drconbep
right join libdebito.tbcret0p on lcretr = codnro
INNER JOIN gxbdbps.gentiaf ON (ENEMISO=LENemi)
where lfectr='20210508' and codmar='BEPS'--and   lcodbc = 'DIN' and
and LBINPR in ('703002','703020','703040')--and lcretr in '91'--and lhortr between '080300' and '104700'
GROUP BY Lfectr, lcretr,LBINPR, lcodbc,LENEMI,ennombr,coddes, lesttr
order by LENEMI ASC,cantidad desc

--Visa de Emisor por grupo
select lfectr AS FECHA , lcodbc AS MARCA,lenemi EMISOR, COUNT(*) CANTIDAD,lesttr AS ESTADO, lcretr AS COD_RETORNO, coddes Descripcion_COD,CAST(SUM(limpgs)AS  bigint) Importe
from libdebito.drconbep
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join libdebito.tbcret0p on lcretr = codnro
where lfectr='20210508' and lcodbc='VSA' and lenemi in ('015','020')
GROUP BY Lfectr, lcretr, lcodbc,LENEMI,coddes, lesttr
order by lcretr asc, cantidad desc

--Visa Adquiriente 
select lfectr AS FECHA , lcodbc AS MARCA,lenemi EMISOR, COUNT(*) CANTIDAD,lesttr AS ESTADO, lcretr AS COD_RETORNO, coddes Descripcion_COD,CAST(SUM(limpgs)AS  bigint) Importe
from libdebito.drconbep
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join libdebito.tbcret0p on lcretr = codnro
where lfectr='20210508' and lcodbc='VSA'
and lnfisc='422745' and lenemi in ('500') and codmar='VISA'
GROUP BY Lfectr, lcretr, lcodbc,LENEMI,coddes, lesttr
order by lcretr asc, cantidad desc

--Visa Adquiriente  Procard--
select lfectr AS FECHA , lcodbc AS MARCA,lenemi EMISOR, COUNT(*) CANTIDAD,lesttr AS ESTADO, lcretr AS COD_RETORNO, coddes Descripcion_COD,CAST(SUM(limpgs)AS  bigint) Importe
from libdebito.drconbep
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join libdebito.tbcret0p on lcretr = codnro
where lfectr='20210508' and lcodbc='VSA' and codmar='VISA' --and lcretr in ('05')
and lenemi in ('510')
GROUP BY Lfectr, lcretr, lcodbc,LENEMI,coddes, lesttr
order by lcretr asc, cantidad desc

--Visa ADQ Continental--por grupo
select lenemi emisor, ennombr ENTIDAD,lcretr cod_retorno,count(*) cantidad,CAST(SUM(limpgs)AS  bigint) Importe
from libdebito.drconbep INNER JOIN gxbdbps.gentiaf ON (ENEMISO=LENemi)
WHERE lfectr BETWEEN '20210508' AND '20210508'
and lenemi='540'
group by lenemi,lcretr,ennombr
ORDER BY CANTIDAD DESC

--ADQ MST CON IMPORTE
select lfectr AS FECHA , lcodbc AS MARCA,lenemi EMISOR, COUNT(*) CANTIDAD,substr(lidtra,1,1) Origen,lesttr AS ESTADO, lcretr AS COD_RETORNO, coddes Descripcion_COD,CAST(SUM(limpgs)AS bigint) as Importe
from libdebito.drconbep
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join libdebito.tbcret0p on lcretr = codnro
where lfectr='20210508' and   lcodbc = 'MST' and codmar='MSTC'
and lenemi in ('530','560','570','590')--and lcretr in '91'--and lhortr between '080300' and '104700'
GROUP BY Lfectr, lcretr, lcodbc,LENEMI,coddes, lesttr,substr(lidtra,1,1)
order by substr(lidtra,1,1) desc, cantidad desc

----MST ADQUIRENCIA PROCARD
select lfectr AS FECHA , lcodbc AS MARCA,lenemi EMISOR, COUNT(*) CANTIDAD,substr(lidtra,1,1) Origen,lesttr AS ESTADO, lcretr AS COD_RETORNO, coddes Descripcion_COD,CAST(SUM(limpgs)AS bigint) as Importe
from libdebito.drconbep
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join libdebito.tbcret0p on lcretr = codnro
where lfectr='20210508' and   lcodbc = 'MST' and codmar='MSTC'
and lenemi in ('510') ---and lnfisc='422745'
GROUP BY Lfectr, lcretr, lcodbc,LENEMI,coddes, lesttr,substr(lidtra,1,1)
order by substr(lidtra,1,1) desc, cantidad desc

---BILLETERAS ---USAR ESTE PARA EL INFORME POR WASAP#############################################################################################################################################################--
select count(*) Cantidad ,lcretr Cod_Retorno,coddes Descripcion_COD ,LFECTR FECHA_REAL,lesttr Estado,lcodtr COD_TRX ,CAST(SUM(limpgs)AS bigint) importe,substr(lidtra,1,1) Origen
,A.TXDTRX DETALLES
from libdebito.drconbep
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join libdebito.tbcret0p on lcretr = codnro
WHERE  lfectr= '20210508'
and lcodtr in ('000052','567102','000072')
and limpgs>1
and  codmar = 'BEPS'--and lenemi='581' 
group by lcretr,coddes,lesttr,lcodtr,TXDTRX,LFECTR,substr(lidtra,1,1),lfectr
order by lcodtr,cantidad desc 
