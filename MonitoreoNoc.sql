--RESUMEN PARA EL GRUPALES DE NOC Y INFRA PASAR ESTE POR WASAP 
------------------------------------------****************INFORME---WASAP************************************--------------------------------------
--monitoreo de transacciones debito dinelco 
select lfectr AS FECHA , lcodbc AS MARCA,lenemi EMISOR,LBINPR BIN,ENNOMBR entidad, COUNT(*) CANTIDAD,lesttr AS ESTADO,
lcretr AS COD_RETORNO, coddes Descripcion_COD,CAST(SUM(limpgs)AS bigint) as Importe
from libdebito.drconbep
right join libdebito.tbcret0p on lcretr = codnro
INNER JOIN gxbdbps.gentiaf ON (ENEMISO=LENemi)
where lfectr='20200113' and codmar='BEPS'--and   lcodbc = 'DIN' and
and LBINPR in ('703002','703020','703040')--and lcretr in '91'--and lhortr between '080300' and '104700'
GROUP BY Lfectr, lcretr,LBINPR, lcodbc,LENEMI,ennombr,coddes, lesttr
order by LENEMI ASC,cantidad desc

 

--Visa de Emisor por grupo
select lfectr AS FECHA , lcodbc AS MARCA,lenemi EMISOR, COUNT(*) CANTIDAD,lesttr AS ESTADO, lcretr AS COD_RETORNO, coddes Descripcion_COD,CAST(SUM(limpgs)AS  bigint) Importe
from libdebito.drconbep
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join libdebito.tbcret0p on lcretr = codnro
where lfectr='20210129' and lcodbc='VSA' and lenemi in ('015','020')
GROUP BY Lfectr, lcretr, lcodbc,LENEMI,coddes, lesttr
order by lcretr asc, cantidad desc

 

--Visa Adquiriente --CON ATMS CON EMV ACTIVO por grupo
select lfectr AS FECHA , lcodbc AS MARCA,lenemi EMISOR, COUNT(*) CANTIDAD,lesttr AS ESTADO, lcretr AS COD_RETORNO, coddes Descripcion_COD,CAST(SUM(limpgs)AS  bigint) Importe
from libdebito.drconbep
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join libdebito.tbcret0p on lcretr = codnro
where lfectr='20210123' and lcodbc='VSA'
and lnfisc='422745' and lenemi in ('500') and codmar='VISA'
GROUP BY Lfectr, lcretr, lcodbc,LENEMI,coddes, lesttr
order by lcretr asc, cantidad desc

 

--Visa Adquiriente  Procard--########################################################################################
select lfectr AS FECHA , lcodbc AS MARCA,lenemi EMISOR, COUNT(*) CANTIDAD,lesttr AS ESTADO, lcretr AS COD_RETORNO, coddes Descripcion_COD,CAST(SUM(limpgs)AS  bigint) Importe
from libdebito.drconbep
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join libdebito.tbcret0p on lcretr = codnro
where lfectr='20210123' and lcodbc='VSA' and codmar='VISA' --and lcretr in ('05')
and lenemi in ('510')
GROUP BY Lfectr, lcretr, lcodbc,LENEMI,coddes, lesttr
order by lcretr asc, cantidad desc

 

--Visa ADQ Continental--por grupo
select lenemi emisor, ennombr ENTIDAD,lcretr cod_retorno,count(*) cantidad,CAST(SUM(limpgs)AS  bigint) Importe
from libdebito.drconbep INNER JOIN gxbdbps.gentiaf ON (ENEMISO=LENemi)
WHERE lfectr BETWEEN '20210127' AND '20210127'
and lenemi='540'
group by lenemi,lcretr,ennombr
ORDER BY CANTIDAD DESC

 

--ADQ MST CON IMPORTE
select lfectr AS FECHA , lcodbc AS MARCA,lenemi EMISOR, COUNT(*) CANTIDAD,substr(lidtra,1,1) Origen,lesttr AS ESTADO, lcretr AS COD_RETORNO, coddes Descripcion_COD,CAST(SUM(limpgs)AS bigint) as Importe
from libdebito.drconbep
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join libdebito.tbcret0p on lcretr = codnro
where lfectr='20210127' and   lcodbc = 'MST' and codmar='MSTC'
and lenemi in ('530','560','570','590')--and lcretr in '91'--and lhortr between '080300' and '104700'
GROUP BY Lfectr, lcretr, lcodbc,LENEMI,coddes, lesttr,substr(lidtra,1,1)
order by substr(lidtra,1,1) desc, cantidad desc

 

----MST ADQUIRENCIA PROCARD
select lfectr AS FECHA , lcodbc AS MARCA,lenemi EMISOR, COUNT(*) CANTIDAD,substr(lidtra,1,1) Origen,lesttr AS ESTADO, lcretr AS COD_RETORNO, coddes Descripcion_COD,CAST(SUM(limpgs)AS bigint) as Importe
from libdebito.drconbep
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join libdebito.tbcret0p on lcretr = codnro
where lfectr='20210127' and   lcodbc = 'MST' and codmar='MSTC'
and lenemi in ('510') ---and lnfisc='422745'
GROUP BY Lfectr, lcretr, lcodbc,LENEMI,coddes, lesttr,substr(lidtra,1,1)
order by substr(lidtra,1,1) desc, cantidad desc

 

---BILLETERAS ---USAR ESTE PARA EL INFORME POR WASAP#############################################################################################################################################################--
select count(*) Cantidad ,lcretr Cod_Retorno,coddes Descripcion_COD ,LFECTR FECHA_REAL,lesttr Estado,lcodtr COD_TRX ,CAST(SUM(limpgs)AS bigint) importe,substr(lidtra,1,1) Origen
,A.TXDTRX DETALLES
from libdebito.drconbep
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join libdebito.tbcret0p on lcretr = codnro
WHERE  lfectr= '20210127'
and lcodtr in ('000052','567102','000072')
and limpgs>1
and  codmar = 'BEPS'--and lenemi='581' 
group by lcretr,coddes,lesttr,lcodtr,TXDTRX,LFECTR,substr(lidtra,1,1),lfectr
order by lcodtr,cantidad desc 

 

    
--VISA
select lfectr as fecha,lhortr as hora,lerrnb as referencia,lidcom as codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta, pdescricion as Marca_tarjeta,limpgs as monto,lesttr as estado,
lcretr as retorno,lenemi,lcodbc as marca,coddes Descripcion_COD from libdebito.drconbep
--inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr--right join libdebito.tbcret0p on lcretr = codnro
inner join libdebito.tbinproc on pbin=lbinpr
right join libdebito.tbcret0p on lcretr = codnro
where lfectr between '20210127' and '20210127'
and lbinpr='488234'
-- and lenemi in ('530','560','570','590') --and lerrnb='034821957956' --lnrtar like '627431%' --and lcretr in ('96','91','XD','92','94', '60')
--and lhortr between '100600' and '150000'--and lenemi in ('570')--and lcodbc IN 'MST'--and lnrtar like '230671%'--and pdescricion like '%MASTERCARD BNF DEBITO BC%'
--and pdescricion like 'Maestro - Banco Ita%'                            
--and lcretr in ('96','91','00','92','94', '60','88','01','96')--and lhortr between '080200' and  '101000'
--and lnrtar like '516400%'--and lnrtar like '601638%'--and lnrtar like '425936%'--and lcretr in '91'--20210123--and lcretr in ('91')--,'96','92','94','57', '60')
order by lhortr desc


--NUEVO SELECT DE VISA usr de adecion  y adc adquiriente 
select lfectr fecha_real,lhortr hora,substr(lerrnb,2,13) refencia,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS TARJETA,--b.vipannmbr tarje_visa,
lcodbc MARCA,lenemi entidad,
lesttr estado,lcretr cod_retorno,lcodtr cod_trx,limpgs importe,lidcom cod_comercio,
lcomtr comercio,b.virol,b.vif044rmsg mensaje
from libdebito.drconbep inner join visa.vistrndta b on lerrnb=virrnbepsa
where lfectr between '20210127' and '20210127' 
and virol='ISS'
-- and lhortr between '070000' and '170000' 
--and lnrtar ='4882340010063886'--and b.virrnbepsa='016278880939'
--and lcretr='05'
order by lhortr desc




--DINELCO VISA BNF
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi as emisor,
lbinpr as Bin ,lcodbc as Marca ,limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por,leca62 AS VERSION,loritr as ATM_POS,lerrnb as Referencia 
from libdebito.drconbep
where lfectr between '20210127' and '20210127' and  lnrtar like '488234%'   
order by lhortr desc


--VER TRANSACCIONES VISA BEPSA-CONTI
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,--SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,--lnrtar,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 AS VERSION ,loritr as ATM_POS,lerrnb as Referencia 
from libdebito.drconbep where lfectr between '20210127' and '20210127' and lnrtar like '456976%' --and  lhisde like'%PROCAR%'--and lcretr in ('05')--emisor --and lcretr in ('12') 
--and lbinpr= '488234'
order by lhortr desc 



--Monitoreo Adquirencia Mastercard sin bines usar este 
select lfectr AS FECHA ,lhortr AS HORA, lcodbc AS MARCA,lerrnb AS REFERENCIA,lbinpr as BIN,lenemi EMISOR,lesttr AS ESTADO, lcretr AS COD_RETORNO,leca62 As ATM,lcomtr as NOMBRE_ATM, coddes Descripcion_COD
from libdebito.drconbep
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join libdebito.tbcret0p on lcretr = codnro
where lfectr='20210127' and   lcodbc = 'MST' and codmar='MSTC' --and lbinpr='502026' --and lerrnb='034821971708'--and lerrnb = '027404348374'
and lenemi in ('530','560','570','590') --AND LCRETR IN ('00') --,'96','01', '93' )
order by lhortr desc


---- mc emisor
select lfectr fecha_real,lhortr hora,substr(lerrnb,2,13) referencia, lnrtar tarje,--b.mcpannmbr tarje_mast,
lbinpr bin,d.pdescricion descrip_marca,lcodbc MARCA,lenemi entidad,lcomtr  as Comercio,
lesttr estado,lcretr cod_retorno,LNFACT AS PAIS,lcodtr cod_trx,c.txdtrx descrip_trx,limpgs importe,lidcom cod_atm,substr(leca62,1,4) atm,b.mcrol rol,b.mcmti estado_mc,b.mcf044rmsg mensaje
from libdebito.drconbep inner join mastercard.mastrndta b on lerrnb=MCRRNBEPSA inner join LIBDEBITO.TBCTRA0P c on c.TXCTRX = lcodtr
inner join libdebito.tbinproc d on lbinpr=pbin
and lbinpr in ('542927','230671','530399', '514848')
where lfectr between '20210127' and '20210127' --and lcretr='80'
--and mcrol='ISS'--and lhortr between '110000' and '122800'
--and lcodtr in ('011000','012000')--and b.mcrrnbepsa='010663493281'
--and lerrnb in ('018585048041','018585048733','018585049732','018585051004','018585051941','018585052639','018585054178')
order by lhortr desc


-- DINELCO BNF--
select lfectr,lhortr,lerrnb,lidcom,lcomtr,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,limpgs,lesttr,lcretr from libdebito.drconbep
where lfectr between '20210127' and '20210127' and  lnrtar like '703002%'-- and lhortr between '120700' and '180000'--and lcretr in ('00','96') and lhortr > '0000000'--like '443078%'  and lenemi='510'
order by lhortr desc


-- CONTI--
select lfectr,lhortr,lerrnb,lidcom,lcomtr,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,limpgs,lesttr,lcretr, lcodtr as codretor from libdebito.drconbep
where lfectr between '20210127' and '20210127' and  lnrtar like '703020%'  and lhortr between '000700' and '190000'--and lcretr in ('99') and lcodtr not in  ('011000','012000','013000','015000')--and lhortr > '0000000'--like '443078%'  and lenemi='510'
order by lhortr desc


-- RIO--
select lfectr,lhortr,lerrnb,lidcom,lcomtr,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,limpgs,lesttr,lcretr, lcodtr as codretor from libdebito.drconbep
where lfectr between '20210127' and '20210127' and  lnrtar like '703040%'  and lhortr between '000700' and '190000'--and lcretr in ('99') and lcodtr not in  ('011000','012000','013000','015000')--and lhortr > '0000000'--like '443078%'  and lenemi='510'
order by lhortr desc


--CONSULTA SALDO TARJETA---
select mcdisco saldo,mcnumta tarjeta from gxbdbps.tmctaaf
where mcnumta='6274311550000654'
--'6274311170002429'
