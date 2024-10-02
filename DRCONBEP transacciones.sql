-- DRCONBEP con datos importantes
select LIDCOM as COD_COMERCIO, LFECTR as FECHA_REAL, LHORTR as HORA, LNRTAR AS TARJETA, LBINPR AS BIN, LIMPGS as MONTO, 
LIDTRA, LCOMTR as COMERCIO, LORITR, LCODTR as CODIGO_TRX, LCODBC, LCAUTR as COD_AUTORIZ, LCRETR as COD_RESP, LESTTR as RESPUESTA, LERRNB, LECA62 
from libdebito.drconbep where lfectr='20220608' and loritr='P'
 order by lhortr desc

-- MST
select LIDCOM as COD_COMERCIO, LFECTR as FECHA_REAL, LHORTR as HORA, LIMPGS as MONTO, 
LIDTRA, LCOMTR as COMERCIO, LORITR, LCODTR as CODIGO_TRX, LCODBC, LCAUTR as COD_AUTORIZ, LCRETR as COD_RESP, LESTTR as RESPUESTA, LERRNB, LECA62 
from libdebito.drconbep where lfectr='20220608'
and  LCODBC='MST' and LCRETR='81' order by lhortr desc

-- DRCONBEP con datos importantes BILLETERA 

select LIDCOM as COD_COMERCIO, LFECTR as FECHA_REAL, LHORTR as HORA, LNRTAR AS TARJETA, LBINPR AS BIN, LIMPGS as MONTO, 
LIDTRA, LCOMTR as COMERCIO, LORITR, LCODTR as CODIGO_TRX, LCODBC, LCAUTR as COD_AUTORIZ, LCRETR as COD_RESP, LESTTR as RESPUESTA, LERRNB, LECA62 
from libdebito.drconbep where lfectr='20220608' AND LCODBC='BIL' 
 order by lhortr desc

-- DRCONBEP con datos importantes BILLETERA CLARO

select LIDCOM as COD_COMERCIO, LFECTR as FECHA_REAL, LHORTR as HORA, LNRTAR AS TARJETA, LBINPR AS BIN, LIMPGS as MONTO, 
LIDTRA, LCOMTR as COMERCIO, LORITR, LCODTR as CODIGO_TRX, LCODBC, LCAUTR as COD_AUTORIZ, LCRETR as COD_RESP, LESTTR as RESPUESTA, LERRNB, LECA62 
from libdebito.drconbep where lfectr='20220608' AND LCODBC='BIL' AND LCODTR='301072'
 order by lhortr desc

-- CODIGOS DE RESPUESTA

select * FROM libdebito.tbcret0p ORDER BY CODMAR, CODNRO

    --Usar este es con las condiciones Visa Adquiriente----este pasa por los ATMS CON EMV
select lfectr AS FECHA , lcodbc AS MARCA,lenemi EMISOR, COUNT(*) CANTIDAD,lesttr AS ESTADO, lcretr AS COD_RETORNO, coddes Descripcion_COD
from libdebito.drconbep
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
 right join libdebito.tbcret0p on lcretr = codnro
  where lfectr='20220608'
  and lcodbc='VSA'
  and lnfisc='422745'
  and lenemi in ('500')
  GROUP BY Lfectr, lcretr, lcodbc,LENEMI,coddes, lesttr order by lcretr asc, cantidad desc

    
--Usar este es con las condiciones Visa de Emisor  
select lfectr AS FECHA , lcodbc AS MARCA,lenemi EMISOR, COUNT(*) CANTIDAD,lesttr AS ESTADO, lcretr AS COD_RETORNO, coddes Descripcion_COD 
from libdebito.drconbep 
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr 
right join libdebito.tbcret0p on lcretr = codnro 
where lfectr='20201115' 
and lcodbc='VSA' 
and lenemi in ('015','020') 
GROUP BY Lfectr, lcretr, lcodbc,LENEMI,coddes, lesttr order by lcretr asc, cantidad desc

--Usar este es con las condiciones Visa de CONTI ADQ  
select lfectr AS FECHA , lcodbc AS MARCA,lenemi EMISOR, COUNT(*) CANTIDAD,lesttr AS ESTADO, lcretr AS COD_RETORNO, coddes Descripcion_COD 
from libdebito.drconbep 
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr 
right join libdebito.tbcret0p on lcretr = codnro 
where lfectr='20220608' 
and lcodbc='VSA' 
and lenemi ='540'
GROUP BY Lfectr, lcretr, lcodbc,LENEMI,coddes, lesttr order by lcretr asc, cantidad desc

    --adquirencia mastercard de Jose--
select lfectr AS FECHA , lcodbc AS MARCA,lenemi EMISOR,lbinpr as Bin, lcretr AS RETORNO, lesttr AS ESTADO, COUNT(*) CANTIDAD
from libdebito.drconbep
where lfectr='20220608' --and lhortr between '114000' and '121000' --and lcretr in ('91')
and lenemi in ('530','560','590')
--and lenemi='510'
GROUP BY Lfectr, lcodbc,LENEMI,lbinpr, lesttr , lcretr

select cocomer, codeno, corazo from gxbdbps.comaeaf where cocomer in ('6500169','6500168','0702115','0301343','6900263','0703598','1302192','4900023')
