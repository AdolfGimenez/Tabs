--- VISA EMISOR Y ADQ
select lfectr fecha_real,lhortr hora,substr(lerrnb,2,13) refencia
,b.vipannmbr tarje_visa,b.virol,b.vif044rmsg mensaje,lcodbc MARCA,lenemi entidad,
lesttr estado,lcretr cod_retorno,lcodtr cod_trx,limpgs importe,lidcom cod_comercio,
lcomtr comercio,leca62 POSATM,substr(lidtra,1,1) Origen
from libdebito.drconbep 
right join visa.vistrndta b on lerrnb=virrnbepsa
right join libdebito.tbcret0p on lcretr = codnro 
right join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr 
where lfectr in '20220310'
--and virol = 'ADQ'--- rol adquirente
--and virol='ISS'  --- rol emisor
and codmar='BEPS'
--and lcretr in '19' -- Verificacion por cod de retorno
and lcodbc='VSA'
--AND substr(vipannmbr, 1,6) = '456976' --Verificacion por bin de VISA CONTI ISS
--AND substr(vipannmbr, 1,6) = '488234'--Verificacion por bin de VISA BNF adq
order by lhortr desc
-- TARJETAS  MASTERCARD POR ROL EMISOR Y ADQ
select b.mcmti estado_mc, b.mcf044rmsg mensaje,lfectr fecha,lhortr hora, ptiptar TIP_TAR,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4)AS Tarjeta
,lcautr as autori,LHISDE RESPONDE,limpgs As importe,lcretr retorno,lesttr ESTAD,b.mcrol rol,lbinpr bin,d.pdescricion descrip_marca,lcodbc MARCA
,lenemi entidad,c.txdtrx descrip_trx,substr(leca62,1,4) atm,substr(lerrnb,2,13) refencia,lcodtr cod_trx,lidcom cod_atm
from libdebito.drconbep 
inner join mastercard.mastrndta b on lerrnb=MCRRNBEPSA 
inner join LIBDEBITO.TBCTRA0P c on c.TXCTRX = lcodtr 
inner join libdebito.tbinproc d on lbinpr=pbin 
where lfectr= '20220310'
--AND B.MCROL='ISS' --rol emisor
--AND B.MCROL='ADQ' --rol adquirente
order by lhortr desc;
--**************PROCARD*  CODIGO DE PROCESO LENEMI 510 (Procard)*************************02
select lfectr FECHA,lhortr HORA,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta ,ptiptar TIP_TAR,limpgs MONTO,lesttr ESTADO
,lcretr RETORNO,lbinpr Bin, pdescricion descrip_tarje,LCODBC MARCA,LENEMI COD_ENTIDAD,LHISDE RESPONDE,LORITR DISPOSITIVO, LNFACT PAIS
,lactfj,lerrnb Cod_Ref from libdebito.drconbep inner join libdebito.tbinproc on pbin=lbinpr
where lfectr between '20220310' and '20220310'
and lenemi in ('510')
---and lcretr in '91' --filtro por cod de retorno
--and lnrtar like '451902%' --filtro por numero de tarjeta en caso de contar con el numero completo se elimina el like reemplazandolo por un = 'Numero de tarjeta'
order by lhortr desc;
--- VISA EMISOR Y ADQ CODIGO DE PROCESO LENEMI 015 VISA EMISOR BNF.020 VISA EMISOR CONTI.520 ADQ.VISA-----------03
select lfectr fecha_real,lhortr hora,limpgs importe,lcretr retorno,lesttr estado, ptiptar TIP_TAR,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,
 pdescricion descrip_tarje,b.virol,b.vif044rmsg mensaje,lcodbc MARCA,lidcom cod_com,lcomtr comercio,lenemi entidad,lnfact as PAIS,
lcodtr cod_trx, coddes Descripcion_DEL_CODIGO,substr(lerrnb,2,13) refencia,b.vipannmbr tarje_visa,leca62 POSATM,substr(lidtra,1,1) Origen
from libdebito.drconbep 
inner join visa.vistrndta b on lerrnb=virrnbepsa    
inner join libdebito.tbinproc on pbin=lbinpr
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr 
right join libdebito.tbcret0p on lcretr = codnro 
right join gxbdbps.gentiaf ON (ENEMISO=LENemi)
where lfectr= '20220310'
and codmar='BEPS'
--- and lcretr in ('05','91')--filtro por cod de retorno
--and lnrtar ='5226925160026139'---buscar por numero de tarjeta lnrtar AS TARJETA
--and b.virrnbepsa='31614959992'---buscar por numero de refencia o numero de boleta
order by  lhortr desc;
---- VISA DINELCO CONTINENTAL CODIGO DE PROCESO LENEM 020 VISA EMISOR CONTINENTAL-----04
select lfectr fecha_real,lhortr hora,substr(lerrnb,2,13) refencia,b.vipannmbr tarje_visa,b.virol,b.vif044rmsg mensaje,lcodbc MARCA,lenemi entidad,
lesttr estado,lcretr cod_retorno,substr(lidtra,1,1) Origen,lcodtr cod_trx,limpgs importe,lidcom cod_comercio,lcomtr comercio,leca62 POSATM,substr(lidtra,1,1) Origen
from libdebito.drconbep 
inner join visa.vistrndta b on lerrnb=virrnbepsa 
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr 
right join libdebito.tbcret0p on lcretr = codnro
right join gxbdbps.gentiaf ON (ENEMISO=LENemi)
where lfectr= '20220310'
and lcodbc = 'VSA'
and codmar='VISA'
-- and lnrtar like '456976%4906'
--and virol = 'ADQ'
--AND substr(vipannmbr, 1,6) = '456976' --VISA CONTI
--AND substr(vipannmbr, 1,6) = '488234'-- VISA BNF
order by lhortr desc;
----VISA DINELCO EMISOR CODIGO DE PROCESO LENEMI 015 VISA EMISOR BNF-----05 
select lfectr fecha_real,lhortr hora,substr(lerrnb,2,13) refencia,b.vipannmbr tarje_visa,b.virol,b.vif044rmsg mensaje,lcodbc MARCA,lenemi entidad,
lesttr estado,lcretr cod_retorno,substr(lidtra,1,1) Origen,lcodtr cod_trx,limpgs importe,lidcom cod_comercio,lcomtr comercio,leca62 POSATM,substr(lidtra,1,1) Origen
from libdebito.drconbep 
inner join visa.vistrndta b on lerrnb=virrnbepsa 
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr 
right join libdebito.tbcret0p on lcretr = codnro
right join gxbdbps.gentiaf ON (ENEMISO=LENemi)
where lfectr between '20220310' and '20220310'
and lcodbc = 'VSA'
and codmar='VISA'
--and virol = 'ADQ'
AND substr(vipannmbr, 1,6) = '488234'  -- VISA BNF
order by lhortr desc;
----------------------------------DEBITO DINELCO BNF **************************************************06 
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,--lnrtar,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 AS VERSION 
,loritr as ATM_POS,lerrnb as Referencia ,LENEMI COD_ENTIDAD
from libdebito.drconbep 
where lfectr= '20220310'
and lbinpr like '703002'
order by lhortr desc ;
---07 DEBITO DEBITO CONTINENTAL  -07
 select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,--lnrtar,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 AS VERSION 
,loritr as ATM_POS,lerrnb as Referencia ,LENEMI COD_ENTIDAD,lnrtar AS Tarjeta
from libdebito.drconbep 
where lfectr= '20220310'
and lnrtar like '703020%'
order by lhortr desc
-- DEBITO DINELCO BCO RIO-----08 
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,--lnrtar,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 AS VERSION 
,loritr as ATM_POS,lerrnb as Referencia ,LENEMI COD_ENTIDAD
from libdebito.drconbep 
where lfectr= '20220310'
and lnrtar like '703040%'
order by lhortr desc
-- DINELCO MTS WALEN  09
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta
,SUBSTR(LIDTRA,1,1) DISPOSITIVO,lenemi as emisor, lbinpr as Bin ,lcodbc as Marca ,limpgs as Monto,lesttr as Estado,lcretr as Retorno
,lhisde as Respondido_Por,LNFACT AS PAIS,leca62 AS VERSION,loritr as ATM_POS,lerrnb as Referencia
from libdebito.drconbep
where lfectr between '20220310' and '20220310'
and  lnrtar like '547697%'
and lcodbc='MST'
--and substr(lidtra,1,1) = 'P'  
--AND lcomtr like ('%LANDAU%')
--and lcretr in ('06')
and codmar='VISA'
-- --and lesttr='R' 
order by lhortr desc
select * from libdebito.drconbep
----DINELCO PROVAVOTY   and lenemi='166'             
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,--lnrtar,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 AS VERSION 
,loritr as ATM_POS,lerrnb as Referencia ,LENEMI COD_ENTIDAD
from libdebito.drconbep 
where lfectr= '20220310'
and lenemi='166'
order by lhortr desc;
---- PANAL CABAR PROCESADA POR PROCARD----- 
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,--lnrtar,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por 
,leca62 AS VERSION ,loritr as ATM_POS,lerrnb as Referencia 
from libdebito.drconbep  
where lfectr= '20220310'
and LCODBC in ('CAB','PAN')
order by lhortr desc;
---DINELCO DEBITO CAPIATA and lenemi='107'
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,--lnrtar,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por 
,leca62 AS VERSION ,loritr as ATM_POS,lerrnb as Referencia 
from libdebito.drconbep 
where lfectr= '20220310'
and lenemi='107'
order by lhortr desc
---DINELCO DEBITO ÃEMBY and lenemi='110'
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,--lnrtar,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 AS VERSION 
,loritr as ATM_POS,lerrnb as Referencia 
from libdebito.drconbep 
where lfectr= '20220310'
and lenemi='110'
order by lhortr desc
--********************************TRANSACCIONES POR JTPS**********************************************************
SELECT lfectr FECHA,lhortr HORA,/*SUBSTR(lnrtar,1,6) || 'XXXXXX' ||SUBSTR(lnrtar,13,4) TARJE*/lnrtar tarje,lexpir VTO,lbinpr bin,lctaor,lctade
lbcodb,LENEMI ENTIDAD, lcored ,LCODBC MARCA,/*,pdescricion MARCA*/
lesttr ESTADO,lcretr COD_RETORNO,LENEMI COD_ENTIDAD,lcodtr COD_TRX,limpgs IMPORTE,lcotel celular,--coddes DESCRIP_RET,--lbinpr BIN,--
lerrnb REFE_BEPSA, lidcom COD_COMER,lcomtr LOCAL_COMER, /*txdtrx DESC_TRX,*/LECA62 version_pos,lactfj cod_act,lcautr cod_aut
--LNFISC,LPOSEM,LMCCTR,LNFACT--,lntoke--, enemiso BANCO,tgdesc DESCRIPCION
from libdebito.drconbep 
--inner join libdebito.tbinproc on lbinpr=pbin
WHERE lfectr= '20220310'
and substr(leca62,9,10) like ('%J%')
order by lhortr desc;
---CODIGOS DE PROCESADORES DE LAS COOPERATIVAS-- EN CASO DE RECHAZO EXTRAER POR CODIGO DE LENEMI 
 select LIDCOM as COD_COMERCIO, LFECTR as FECHA_REAL, LHORTR as HORA, LCAUTR as COD_AUTORIZ, LCRETR as COD_RESP, LESTTR as RESPUESTA, lcodbc as Marca
, SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta, LIMPGS as MONTO, LCOMTR as COMERCIO, LORITR Dispositivo, LCODTR as CODIGO_TRX,
lhisde as Respondido_Por , lenemi Cod_entidad,ennombr ENTIDAD
from libdebito.drconbep 
left join gxbdbps.gentiaf ON (ENEMISO=LENemi)
where lfectr='20220310'
and lenemi in ('068','070','071','072','073','075','076','077','080','081','083','084','088','089','095','096','100','101'
,'102','103','105','106','107','108','109','110','111','113','124','125','136','137','140','141','144','145','153','158','161','163','165','166'
,'167','168','169','170','171','172','173','174','177','303','304','305','306','307','309','310','311','312','334','340','342','344')
 order by lhortr desc;
--verificar trx Billeteras
select lfectr Fecha,lhortr Hora,lenemi Emisor
, SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS TARJETA,lidcom Cod_Comercio
,lcomtr Comercio,(limpgs) importe,lcretr Retorno
,lesttr Estado,substr(lidtra,1,1) Origen,lctade referencia_linea,lerrnb Cod_Ref
,A.TXDTRX DETALLES,lcotel numero,lcodtr Cod_Trx,lactfj Activo_Pos,lenemi,lctaor, lcodtr, codmar
from libdebito.drconbep
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join libdebito.tbcret0p on lcretr = codnro
where lfectr='20220304'
--and lcodtr='000052'---Tigo Money 
and lcodtr='567102'--Bill Personal
--and lenemi='591'--Bill Claro
--and lnrtar like '6274311520%'--Tigo Card
--and lcodtr in ('370000','380000','390000')--Cico
--and lnrtar like '627431581%'-- Tigo sin tarjetas
and limpgs>1
and  codmar = 'BEPS'
order by lhortr desc
--transacciones desde la red de infonet con nuestras tarjetas.
select lfectr fecha_real , lfcotr fecha_com,lhortr HORA,SUBSTR(lnrtar,1,6) || 'XXXXXX' ||SUBSTR(lnrtar,13,4) TARJE,lnrtar,lhisde,
lenemi emisor,lbinpr bin,lposem,lcotel celular,
lesttr ESTADO,lcretr COD_RET,lcodtr COD_TRX,limpgs IMPORTE,--coddes DESCRIP_RET,--lbinpr BIN,--
lerrnb REFE_BEPSA, lidcom COD_COMER,lcomtr LOCAL_COMER,LECA62 ATM_POS,lactfj cod_act,lcautr cod_aut,lnfisc adq,ldistr,lnfisc
FROM libdebito.drconbep
WHERE lfectr BETWEEN '20220310' AND '20220310'
/*and lbinpr in(
'230671', --mastercard debito
'530399', --mc oro conti
'514848', --mc black
'542927', --mc clasica
'547697', -- mc waled
'546297', --mc debito rio
'230729') --mc prepaga conti
*/
and lnfisc in ('472040','443073')--,'','','') --bin adq infonet pos
and lcodbc in ('MST','VSA')--,'CAB')
order by lhortr desc
--ahí están comentados los bines que son nuestros las MC  , Marca y clase ,las de Visa ya saben cuales son 456976 y 488234
/*Bancos*/
Select * from contabilid.tatgene where tgalfa = 'BA';
Select * from gxopera.clparf;
Select * from gxtrjdta.tdgbin --Bines
Select * from gxtrjdta.tdgbin where BINNROBIN = ' '
Select * from gxtrjdta.tdgent --Entidades
select * FROM GXBDBPS.COMAEAF -- comercios