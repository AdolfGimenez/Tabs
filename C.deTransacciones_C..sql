SELECT * FROM libdebito.SWITCHENT --tabla de configuración de los comserver
s WHERE SENTPUE = 5150 ;
------------------------------------------------------------------------------------------------------------------------------------------
--para ver fecha de cierres
select * from gxbdbps.tcieraf where enemiso='002' and AFFECIE between '20190000' and '20200000'
------------------------------------------------------------------------------------------------------------------------------------------
/*Verificación vigencia*/--renta IVA
SELECT cocomer,
       codeno,
       corazo,
       cofiva vigencia,
       (CASE WHEN coreten = 0 THEN 'TODOS' WHEN coreten = 1 THEN 'RENTA' WHEN coreten = 2 THEN 'IVA' ELSE 'NINGUNO' END) APLICA
FROM gxbdbps.comaeaf
WHERE cocomer = '0801448';
------------------------------------------------------------------------------------------------------------------------------------------
--POS Y ATM
SELECT COUNT(*) --substr(LIDTRA, 5, 6), lcodtr, LNRTAR, trim(lcotel), lctade, lerrnb, lfectr, substr(digits(lhortr),3,8), lcretr, lesttr, limpgs, 'TIGO MONEY', LIDCOM
       FROM libdebito.drconbep
WHERE LIDCOM <> 100001
AND   substr(LIDTRA,1,1) IN ('P','T')
AND   LFCOTR = '20221005' /*and LCODTR = '000052' */ 
AND   LESTTR = 'A'
AND   LCRETR = '00' /*and lenemi = '540'*/;
------------------------------------------------------------------------------------------------------------------------------------------
--POS
SELECT COUNT(*)
--substr(LIDTRA, 5, 6), lcodtr, LNRTAR, trim(lcotel), lctade, lerrnb, lfectr, substr(digits(lhortr),3,8), lcretr, lesttr, limpgs, 'TIGO MONEY', LIDCOM
       FROM libdebito.drconbep
WHERE substr(LIDTRA,1,1) = 'P'
AND   LFCOTR = '20220704' /*and LCODTR = '000052' and eneadm <> '581'*/ 
AND   LESTTR = 'A'
AND   LCRETR = '00' /*and lenemi = '540'*/;
------------------------------------------------------------------------------------------------------------------------------------------
--ATM
SELECT COUNT(*)
--substr(LIDTRA, 5, 6), lcodtr, LNRTAR, trim(lcotel), lctade, lerrnb, lfectr, substr(digits(lhortr),3,8), lcretr, lesttr, limpgs, 'TIGO MONEY', LIDCOM
       FROM libdebito.drconbep
WHERE substr(LIDTRA,1,1) = 'T'
AND   LFCOTR = '20220704' /*and LCODTR = '000052' and eneadm <> '581'*/ 
AND   LESTTR = 'A'
AND   LCRETR = '00' /*and lenemi = '540'*/;
------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------#tabla de excepciones
select * FROM GXSWTDTA.TMIEXC  where EXCBIN = '425678' and EXCCODCOM = '9099257'
select * from gxswtdta.TMITH
------------------------------------------------------------------------------------------------------------------------------------------
--tabla de respuestas de bepsa por marca--
SELECT *FROM libdebito.tbcret0p  
------------------------------------------------------------------------------------------------------------------------------------------
--log que va a la entidad
select * from gxbdbps.lgcoment where lgmsg like '%229607999366%';
select * from gxbdbps.lgcoment;
------------------------------------------------------------------------------------------------------------------------------------------
select * from visa.vistrndta where virrnbepsa;
--mensajeria iso8583
------------------------------------------------------------------------------------------------------------------------------------------ 
--tabla de maestro de transacciones
SELECT *FROM libdebito.tbctra0p WHERE TXDTRX LIKE '%Y LO QUE QUIERE CONSULTAR%'
------------------------------------------------------------------------------------------------------------------------------------------
--select para verificación de log con BNF y Continental, para ver si hay conectividad entre bepsa y bnf utilizar emisor 1002 y para continental utilizar emisor 1020
select * from gxbdbps.lgcoment where date(lgfechor)='2022-04-26' and lgentid='1002' order by lgfechor desc
------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------# Resumen por RECHAZO-------------------------------------------------
--para ver fecha de cierres
select * from gxbdbps.tcieraf where enemiso='002' and AFFECIE between '20190000' and '20200000'select lfectr AS FECHA, lcodbc AS MARCA, lcretr as RETORNO, lesttr as ESTADO, COUNT(*) CANTIDAD
from libdebito.drconbep  
where lfectr='20220810' and lnrtar like '627431107%' and lhortr > '000000' 
GROUP BY Lfectr, lcodbc, lcretr, lesttr
------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------J.Enciso-------------------------------------------------
select lfectr fecha_real , lfcotr fecha_com,lhortr HORA,SUBSTR(lnrtar,1,6) || 'XXXXXX' ||SUBSTR(lnrtar,13,4) TARJE, lcodbc marca,
lenemi emisor,lbinpr bin,lcuota,
lesttr ESTADO,lcretr COD_RET,lcodtr COD_TRX,limpgs IMPORTE,--coddes DESCRIP_RET,--lbinpr BIN,--
lerrnb REFE_BEPSA, lidcom COD_COMER,lcomtr LOCAL_COMER,LECA62 ATM_POS,lactfj cod_act,lcautr cod_aut,lnfisc adq
--SELECT SUBSTR(LFECTR,1,4)||'-'||SUBSTR(LFECTR,5,2)||'-'||SUBSTR(LFECTR,7,2) fecha
/*
select distinct(lactfj) id_terminal,SUBSTR(LFECTR,1,4)||'-'||SUBSTR(LFECTR,5,2)||'-'||SUBSTR(LFECTR,7,2),lfectr fecha,lidcom cod_comercio,lcomtr descripcion,
count(*)cantidad_trx,lesttr estado, lcretr cod_respuesta,substr(leca62,1,1) modelo_pos
*/
--select sum (limpgs) importe,count(*) cantidad,lcodbc VISA, LENEMI ADQ_CONTI
-- *
FROM libdebito.drconbep
--INNER JOIN GXBDBPS.COMAEAF a ON substr(digits(c.lidcom), 6, 7) = a.cocomer
--select * from libdebito.drconbep
--inner join gxbdbps.cozonaf b on a.zonacodi=b.zonacodi
WHERE lfectr BETWEEN '20221008' AND '20221008'
--and lerrnb in ('221600159233') --referencia
--and lerrnb in ('134110612898','134110612907','134110612917','134110612929')
--and substr(lidtra,1,1)='T' --pos o atm
--and lenemi in ('020','002','040','015','530')
--and lbinpr in ('602049')
--and lactfj ='21980257'
--and lbinpr in ('456976','488234','443078')
and lcodbc in ('MST')
--and lbinpr='230671'
--and lcretr in ('91')--,'92')--,'92','91')
-- and lenemi='152'
--and lenemi='510'
--and lidcom in ('0302389')
--and lcodtr in ('370000','380000','390000','000052')
--aand lcodtr in ('300000','301000','302000','311000','311100','312000','312100','313000','313100','314001')
--and lbinpr='516400'
--and lhortr >'100000'
--and lnrtar in ('2306710001352989')
order by lhortr desc;
-----------------------------------------------------------------------------------------------------------------------------------------
select * from visa.vistrndta where VIFECREAL='20220924' 
-----------------------------------------------------------------------------------------------------------------------------------------
select * from gxbdbps.tswaut where AUTRRNBEP in ('220300147147');
------------------------------------------------------------------------------------------------------------------------------------------
-----------log para ver si reverso o no. si tiene mas de 2 es reversado = 1100000 en la ultima linea  
select * from gxbdbps.lgcoment where LGMSG like'%27803298446%'
--where LGENTID='1020' and date(LGFECHOR) >='2022-10-05' order by LGFECHOR desc 
------------------------------------------------------------------------------------------------------------------------------------------------------
--pago parcial visa
SELECT VIROL, v037, VIRRNBEPSA, v060, date(VIREVDATT), v002, v004, DEC(SUBSTRING(v054, 9)), v039, v042, v043  FROM visa.visctldta aWHERE V039 = '10' AND date(VIREVDATT) BETWEEN '2021-11-15' AND  '2022-07-28' ;
------------------------------------------------------------------------------------------------------------------------------------------
--- VISA EMISOR Y ADQ
select lfectr fecha_real,lhortr hora,substr(lerrnb,2,13) refencia
,b.vipannmbr tarje_visa,b.virol,b.vif044rmsg mensaje,lcodbc MARCA,lenemi entidad,
lesttr estado,lcretr cod_retorno,lcodtr cod_trx,limpgs importe,lidcom cod_comercio,
lcomtr comercio,leca62 POSATM,substr(lidtra,1,1) Origen
from libdebito.drconbep 
right join visa.vistrndta b on lerrnb=virrnbepsa
right join libdebito.tbcret0p on lcretr = codnro 
right join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr 
where lfectr in '20221005'
--and virol = 'ADQ'--- rol adquirente
and virol='ISS'  --- rol emisor
and codmar='BEPS'
--and lcretr in '81' -- Verificacion por cod de retorno
and lcodbc='VSA'
--and lesttr='A' --estado
--AND substr(vipannmbr, 1,6) = '425678' --Verificacion por bin de VISA CONTI ISS
--AND substr(vipannmbr, 1,6) = '425678'--Verificacion por bin de VISA BNF adq
--and lnrtar like '4998317%' --filtro por bin
--and lhortr>='150000'
order by lhortr desc;
----------------------------------------------------------------------------------------------------------------
------VISA EMISOR CONTINENTAL BIN 456976------
select lfectr fecha_real,lhortr hora,substr(lerrnb,2,13) refencia,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,b.vipannmbr tarje_visa,b.virol,b.vif044rmsg mensaje,lcodbc MARCA,lenemi entidad,
lesttr estado,lcretr cod_retorno,substr(lidtra,1,1) Origen,lcodtr cod_trx,limpgs importe,lidcom cod_comercio,lcomtr comercio,leca62 POSATM,substr(lidtra,1,1) Origen
from libdebito.drconbep inner join visa.vistrndta b on lerrnb=virrnbepsa inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr right join libdebito.tbcret0p on lcretr = codnro
right join gxbdbps.gentiaf ON (ENEMISO=LENemi) where lfectr between '20220924' and '20220924' and lcodbc = 'VSA' and codmar='VISA'
--and lhortr between '181300' and '230000'
--and lcretr in ('F1')-- 
and lnrtar like '456976%'
-- and lhortr>143000
-- and lnrtar like '434512%'
--and virol = 'ADQ'
AND substr(vipannmbr, 1,6) = '456976'-- and lhortr>143000 --
and lcretr in ('76')--VISA CONTI
--AND substr(vipannmbr, 1,6) = '488234' and lhortr>143000-- VISA BNF
order by lhortr desc;
-------
--VISA CONTI EMISOR
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,lenemi as emisor,lnrtar,--SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,
lbinpr as Bin ,lcodbc as Marca ,limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por,leca62 AS VERSION,loritr as ATM_POS,lerrnb as Referencia 
from libdebito.drconbep
where lfectr between '20220924' and '20220924' and  lnrtar like '456976%' 
and lhortr between '195600' and '223000'
and lcretr in ('91','05')
order by lhortr desc;
------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------LOg
SELECT * FROM HSTTRNPROC.TRNPRCDEB WHERE DATE(PRCDEBTIM) >= '2022-06-20' ORDER BY PRCDEBTIM DESC;
------------------------------------------------------------------------------------------------------------------------------------------
---TARJETAS  MASTERCARD POR ROL EMISOR Y ADQ
select b.mcmti estado_mc, b.mcf044rmsg mensaje,lfectr fecha,lhortr hora, ptiptar TIP_TAR,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4)AS Tarjeta
,lcautr as autori,LHISDE RESPONDE,limpgs As importe,lcretr retorno,lesttr ESTAD,b.mcrol rol,lbinpr bin,d.pdescricion descrip_marca,lcodbc MARCA
,lenemi entidad,c.txdtrx descrip_trx,substr(leca62,1,4) atm,substr(lerrnb,2,13) refencia,lcodtr cod_trx,lidcom cod_atm
from libdebito.drconbep 
inner join mastercard.mastrndta b on lerrnb=MCRRNBEPSA 
inner join LIBDEBITO.TBCTRA0P c on c.TXCTRX = lcodtr 
inner join libdebito.tbinproc d on lbinpr=pbin 
where lfectr= '20221008'
--and lhortr >='060000'
--AND B.MCROL='ISS' --rol emisor
AND B.MCROL='ADQ' --rol adquirente
--and lcretr= '91' --por codigo de retorno
order by lhortr desc;
-----------------------------
SELECT * FROM MASTERCARD.TALTRENMS WHERE DATE(FECLOG)='2022-10-08' ORDER BY FECLOG DESC LIMIT 50;
------------------------------------------------------------------------------------------------------------------------------------------
--**************PROCARD*  CODIGO DE PROCESO LENEMI 510 (Procard)*************************02
select lfectr FECHA,lhortr HORA,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta ,ptiptar TIP_TAR,limpgs MONTO,lesttr ESTADO
,lcretr RETORNO,lbinpr Bin, pdescricion descrip_tarje,LCODBC MARCA,LENEMI COD_ENTIDAD,LHISDE RESPONDE,LORITR DISPOSITIVO, LNFACT PAIS
,lactfj,lerrnb Cod_Ref from libdebito.drconbep inner join libdebito.tbinproc on pbin=lbinpr
where lfectr between '20220810' and '20220810' 
and lenemi in ('510')
--and lcretr in '91' --filtro por cod de retorno
--and lnrtar like '451902%' --filtro por numero de tarjeta en caso de contar con el numero completo se elimina el like reemplazandolo por un = 'Numero de tarjeta'
order by lhortr desc;
------------------------------------------------------------------------------------------------------------------------------------------
Select * from gxopera.opentid1 where entcodi = ('015')                         
------------------------------------------------------------------------------------------------------------------------------------------                                                                                                                                                            
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
where lfectr= '20220'  
and codmar='BEPS'  
--and lcretr in ('05','91')--filtro por cod de retorno
--and lnrtar ='5226925160026139'---buscar por numero de tarjeta lnrtar AS TARJETA
--and b.virrnbepsa='31614959992'---buscar por numero de refencia o numero de boleta
order by  lhortr desc;
------------------------------------------------------------------------------------------------------------------------------------------
---- VISA DINELCO CONTINENTAL CODIGO DE PROCESO LENEM 020 VISA EMISOR CONTINENTAL-----04
select lfectr fecha_real,lhortr hora,substr(lerrnb,2,13) refencia,b.vipannmbr tarje_visa,b.virol,b.vif044rmsg mensaje,lcodbc MARCA,lenemi entidad,
lesttr estado,lcretr cod_retorno,substr(lidtra,1,1) Origen,lcodtr cod_trx,limpgs importe,lidcom cod_comercio,lcomtr comercio,leca62 POSATM,substr(lidtra,1,1) Origen
from libdebito.drconbep 
inner join visa.vistrndta b on lerrnb=virrnbepsa 
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr 
right join libdebito.tbcret0p on lcretr = codnro
right join gxbdbps.gentiaf ON (ENEMISO=LENemi) 
where lfectr= '20220714'  
and lcodbc = 'VSA' 
and codmar='VISA'
-- and lnrtar like '456976%4906'
--and virol = 'ADQ'
--AND substr(vipannmbr, 1,6) = '456976' --VISA CONTI
--AND substr(vipannmbr, 1,6) = '488234'-- VISA BNF
order by lhortr desc;	
------------------------------------------------------------------------------------------------------------------------------------------
----VISA DINELCO EMISOR CODIGO DE PROCESO LENEMI 015 VISA EMISOR BNF-----05	
select lfectr fecha_real,lhortr hora,substr(lerrnb,2,13) refencia,b.vipannmbr tarje_visa,b.virol,b.vif044rmsg mensaje,lcodbc MARCA,lenemi entidad,
lesttr estado,lcretr cod_retorno,substr(lidtra,1,1) Origen,lcodtr cod_trx,limpgs importe,lidcom cod_comercio,lcomtr comercio,leca62 POSATM,substr(lidtra,1,1) Origen
from libdebito.drconbep 
inner join visa.vistrndta b on lerrnb=virrnbepsa 
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr 
right join libdebito.tbcret0p on lcretr = codnro
right join gxbdbps.gentiaf ON (ENEMISO=LENemi) 
where lfectr between '20220810' and '20220810' 
and lcodbc = 'VSA' 
and codmar='VISA'
--and virol = 'ADQ'
AND substr(vipannmbr, 1,6) = '488234'  -- VISA BNF
order by lhortr desc;
------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------DEBITO DINELCO BNF **************************************************06 
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,--lnrtar,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 AS VERSION 
,loritr as ATM_POS,lerrnb as Referencia ,LENEMI COD_ENTIDAD
from libdebito.drconbep 
where lfectr= '20220810'
and lbinpr like '703002' 
--and lnrtar = ' 7030020138977005'
order by lhortr desc ; 
------------------------------------------------------------------------------------------------------------------------------------------
---07 DEBITO DEBITO CONTINENTAL  -07
 select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,--lnrtar,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 AS VERSION 
,loritr as ATM_POS,lerrnb as Referencia ,LENEMI COD_ENTIDAD,lnrtar AS Tarjeta
from libdebito.drconbep 
where lfectr= '20220810' 
and lnrtar like '703020%' 
order by lhortr desc 
------------------------------------------------------------------------------------------------------------------------------------------
-- DEBITO DINELCO BCO RIO-----08 
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,--lnrtar,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 AS VERSION 
,loritr as ATM_POS,lerrnb as Referencia ,LENEMI COD_ENTIDAD
from libdebito.drconbep 
where lfectr= '20220810'
and lnrtar like '703040%' 
order by lhortr desc 	
------------------------------------------------------------------------------------------------------------------------------------------			
-- DINELCO MTS WALEN  09
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta
,SUBSTR(LIDTRA,1,1) DISPOSITIVO,lenemi as emisor, lbinpr as Bin ,lcodbc as Marca ,limpgs as Monto,lesttr as Estado,lcretr as Retorno
,lhisde as Respondido_Por,LNFACT AS PAIS,leca62 AS VERSION,loritr as ATM_POS,lerrnb as Referencia
from libdebito.drconbep
where lfectr between '20220810' and '20220810' 
and  lnrtar like '547697%' 
--and lcodbc=''  
--and substr(lidtra,1,1) = 'P'  
--AND lcomtr like ('%LANDAU%')
--and lcretr in ('06')
--and lcodmar='VISA'
-- --and lesttr='R' 
order by lhortr desc
------------------------------------------------------------------------------------------------------------------------------------------
select * from libdebito.drconbep
------------------------------------------------------------------------------------------------------------------------------------------
----DINELCO PROVAVOTY	and lenemi='166'			 
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,--lnrtar,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 AS VERSION 
,loritr as ATM_POS,lerrnb as Referencia ,LENEMI COD_ENTIDAD
from libdebito.drconbep 
where lfectr= '20220810' 
and lenemi='166' 
order by lhortr desc;
------------------------------------------------------------------------------------------------------------------------------------------
---- PANAL CABAR PROCESADA POR PROCARD----- 
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,--lnrtar,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por 
,leca62 AS VERSION ,loritr as ATM_POS,lerrnb as Referencia 
from libdebito.drconbep  
where lfectr= '20220810' 
and LCODBC in ('CAB','PAN')
order by lhortr desc;
------------------------------------------------------------------------------------------------------------------------------------------
---DINELCO DEBITO CAPIATA and lenemi='107'
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,--lnrtar,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por 
,leca62 AS VERSION ,loritr as ATM_POS,lerrnb as Referencia 
from libdebito.drconbep 
where lfectr= '20220810'
and lenemi='107'  
order by lhortr desc 
------------------------------------------------------------------------------------------------------------------------------------------	
---DINELCO DEBITO a NEMBY and lenemi='110'
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,--lnrtar,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 AS VERSION 
,loritr as ATM_POS,lerrnb as Referencia 
from libdebito.drconbep 
where lfectr= '20220810'  
and lenemi='110'  
order by lhortr desc 
------------------------------------------------------------------------------------------------------------------------------------------                               
--********************************TRANSACCIONES POR JTPS**********************************************************
SELECT lfectr FECHA,lhortr HORA,/*SUBSTR(lnrtar,1,6) || 'XXXXXX' ||SUBSTR(lnrtar,13,4) TARJE*/lnrtar tarje,lexpir VTO,lbinpr bin,lctaor,lctade
lbcodb,LENEMI ENTIDAD, lcored ,LCODBC MARCA,/*,pdescricion MARCA*/
lesttr ESTADO,lcretr COD_RETORNO,LENEMI COD_ENTIDAD,lcodtr COD_TRX,limpgs IMPORTE,lcotel celular,--coddes DESCRIP_RET,--lbinpr BIN,--
lerrnb REFE_BEPSA, lidcom COD_COMER,lcomtr LOCAL_COMER, /*txdtrx DESC_TRX,*/LECA62 version_pos,lactfj cod_act,lcautr cod_aut
--LNFISC,LPOSEM,LMCCTR,LNFACT--,lntoke--, enemiso BANCO,tgdesc DESCRIPCION
from libdebito.drconbep 
--inner join libdebito.tbinproc on lbinpr=pbin
WHERE lfectr= '20220810'
and substr(leca62,9,10) like ('%J%') 
order by lhortr desc;
------------------------------------------------------------------------------------------------------------------------------------------
---CODIGOS DE PROCESADORES DE LAS COOPERATIVAS-- EN CASO DE RECHAZO EXTRAER POR CODIGO DE LENEMI 
 select LIDCOM as COD_COMERCIO, LFECTR as FECHA_REAL, LHORTR as HORA, LCAUTR as COD_AUTORIZ, LCRETR as COD_RESP, LESTTR as RESPUESTA, lcodbc as Marca
, SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta, LIMPGS as MONTO, LCOMTR as COMERCIO, LORITR Dispositivo, LCODTR as CODIGO_TRX,
lhisde as Respondido_Por , lenemi Cod_entidad,ennombr ENTIDAD
from libdebito.drconbep 
left join gxbdbps.gentiaf ON (ENEMISO=LENemi)
where lfectr='20220810' 
and lenemi in ('068','070','071','072','073','075','076','077','080','081','083','084','088','089','095','096','100','101'
,'102','103','105','106','107','108','109','110','111','113','124','125','136','137','140','141','144','145','153','158','161','163','165','166'
,'167','168','169','170','171','172','173','174','177','303','304','305','306','307','309','310','311','312','334','340','342','344')
 order by lhortr desc;
------------------------------------------------------------------------------------------------------------------------------------------ 
--verificar trx Billeteras
select lfectr Fecha,lhortr Hora,lenemi Emisor
, SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS TARJETA,lidcom Cod_Comercio
,lcomtr Comercio,(limpgs) importe,lcretr Retorno
,lesttr Estado,substr(lidtra,1,1) Origen,lctade referencia_linea,lerrnb Cod_Ref
,A.TXDTRX DETALLES,lcotel numero,lcodtr Cod_Trx,lactfj Activo_Pos,lenemi,lctaor, lcodtr, codmar
from libdebito.drconbep
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join libdebito.tbcret0p on lcretr = codnro
where lfectr='20220810'
--and lcodtr='000052'---Tigo Money 
--and lcodtr='567102'--Bill Personal
--and lenemi='591'--Bill Claro
and lnrtar like '6274311520%'--Tigo Card
--and lcodtr in ('370000','380000','390000')--Cico
--and lnrtar like '627431581%'-- Tigo sin tarjetas
and limpgs>1
and  codmar = 'BEPS'
order by lhortr desc
------------------------------------------------------------------------------------------------------------------------------------------
--transacciones desde la red de infonet con nuestras tarjetas.
select lfectr fecha_real , lfcotr fecha_com,lhortr HORA,SUBSTR(lnrtar,1,6) || 'XXXXXX' ||SUBSTR(lnrtar,13,4) TARJE,lnrtar,lhisde,
lenemi emisor,lbinpr bin,lposem,lcotel celular,
lesttr ESTADO,lcretr COD_RET,lcodtr COD_TRX,limpgs IMPORTE,--coddes DESCRIP_RET,--lbinpr BIN,--
lerrnb REFE_BEPSA, lidcom COD_COMER,lcomtr LOCAL_COMER,LECA62 ATM_POS,lactfj cod_act,lcautr cod_aut,lnfisc adq,ldistr,lnfisc
FROM libdebito.drconbep
WHERE lfectr BETWEEN '20220810' AND '20220810'
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
------------------------------------------------------------------------------------------------------------------------------------------
--MST que le filtras por los Bines.
--Julio Cesar Cabañas
select b.mcmti estado_mc,b.mcf044rmsg mensaje,lfectr fecha,lhortr hora,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lcautr as autori,limpgs As importe,
lcretr retorno,lesttr ESTAD,b.mcrol rol,lbinpr bin,d.pdescricion descrip_marca,lcodbc MARCA,lenemi entidad,c.txdtrx descrip_trx,substr(leca62,1,4) atm,substr(lerrnb,2,13) refencia,lcodtr cod_trx,lidcom cod_atm
from libdebito.drconbep inner join mastercard.mastrndta b on lerrnb=MCRRNBEPSA inner join LIBDEBITO.TBCTRA0P c on c.TXCTRX = lcodtr
inner join libdebito.tbinproc d on lbinpr=pbin --and lcretr in '91'
--and lbinpr in ('601639')--('542927','230671','530399')
and lcodtr IN ('000054','011000','012000')where lfectr between '20220810' and '20220810' and lenemi in ('530','560','590','570') --
--and pdescricion like '%CONTINENTAL%'--and lhortr>140000--
--and mcrol='ISS'
--and mcrol='ADQ'
--and lcretr='91' --
--and lhortr between '165000' and '221600'
--and lnrtar like'230671%'
and lnrtar like'546297%'
--AND lerrnb='134110525994'
--and lhortr between '160000' and '235900'
order by lhortr desc;
------------------------------------------------------------------------------------------------------------------------------------------
[10:29] Armando Daniel Rios
select lfectr,lnrtar, lhortr, lidcom, lcomtr, limpgs, lesttr, lcretr,lerrnb AS REFERENCIA,A.TXDTRX DETALLES,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta---lcotel AS LINEA_CEL,
from libdebito.drconbep
left join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
where lfectr between '20220810' and '20220810 ' and lnrtar like '488234%'
and lhortr between '110900' and '111300'
--and lhortr between '101000' and '102500'
--and lenemi='540'---Guai
--and lcretr in ('92','05')
order by lhortr desc;
------------------------------------------------------------------------------------------------------------------------------------------
--la transaccion original enviada a la marca tuvo como respuesta el valor 91, con esa respuesta se intenta reenviar la reversa por timeout
--cuando la transaccion de reversa no recibe una respuesta favorable se vuelve a intentar, se hacen hasta 3 intentos.
SELECT VIROL, v.VIMTI , LHISOR , LHORTR , v.VIPANEXPDT , LNRTAR , LERRNB , LIDCOM , LMCCTR , LCOMTR , LIMPGS ,
LCRETR , LESTTR, v.VIF044RCOD , v.VIF044RMSG, v.VIEASCONN FROM LIBDEBITO.DRCONBEP
INNER JOIN VISA.VISTRNDTA v ON
VIRRNBEPSA = LERRNB
WHERE LFECTR = 20220810 AND LCODBC = 'VSA'
AND VIROL = 'ADQ'
AND LCRETR = '19'
ORDER BY LHORTR DESC
LIMIT 100
------------------------------------------------------------------------------------------------------------------------------------------
-----select para ayudarte con campos 63------------
SELECT MC037 REFERENCIA , MC063 CAMPO_63 FROM MASTERCARD.MASCTLDTA m WHERE mc037 in('209146717688','209146717627','209146689998','209146680429')
------------------------------------------------------------------------------------------------------------------------------------------
--------ENTIDADES POR LENEMI----
select lerrnb,lfectr fecha,lhortr hora,lidcom cod_comer,lcomtr comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS TARJETA, lcotel numero --lnrtar
,limpgs,lesttr,lcretr
,LCODBC marca,lbinpr bin,LORITR dispositivo,lenemi from libdebito.drconbep
where lfectr between '20220810' and '20220810'
--and lcodtr='000052'---Tigo Money
--and lenemi='166'--PORAVOTY
and lenemi='174'
order by lhortr desc;
------------------------------------------------------------------------------------------------------------------------------------------
--TABLA DE BINES
select * from libdebito.tbinproc
where pbin = '109910'
------------------------------------------------------------------------------------------------------------------------------------------
---------------370 carga , 380 retiro, 390 giro
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr, lcodtr codtrx from libdebito.drconbep
where lfectr between '20220810' and '20220810' and lcodtr in  ('370000','380000','390000') 
order by lhortr desc
------------------------------------------------------------------------------------------------------------------------------------------
------------------------TRANSACCIONES ATM-CENTRE -------------------------------------------------------------------------
select lfectr as FECHA,lhortr as HORA,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS TARJETA,leca62 As ATM,lcomtr as NOMBRE_ATM,limpgs as MONTO,lcretr as RETORNO, lesttr as ESTADO from libdebito.drconbep
where substr(lidtra,1,4) in
('T011','T026','T070','T278','T370','T403','T408','T420','T461','T462','T001','T415','T423','T424','T441','T405','T410')
and lfectr='20220810'
order by lhortr desc
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*********************************************************************** R.Diario--*********************************************************************** 
------------------------------------------------Monitoreo Adquirencia Mastercard
select cast(TO_DATE(cast(lfectr as varchar(8)),'YYYYMMDD')as date) AS FECHA , lcodbc AS MARCA,lenemi EMISOR, COUNT(*) CANTIDAD,substr(lidtra,1,1) Origen,lesttr AS ESTADO, lcretr AS COD_RETORNO, coddes Descripcion_COD,CAST(SUM(limpgs)AS bigint) importe
from libdebito.drconbep
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join libdebito.tbcret0p on lcretr = codnro
where lfectr='20220810' and   lcodbc = 'MST' and codmar='MSTC'
and lenemi in ('530','560','570','590')
--and lcretr in '91'
--and lhortr between '080300' and '104700'
GROUP BY Lfectr, lcretr, lcodbc,LENEMI,coddes, lesttr,substr(lidtra,1,1)
order by substr(lidtra,1,1) desc, lcretr asc, cantidad desc;
------------------------------------------------------------------------------------------------------------------------------------------
--ADQ.VISA  CONTINENTAL---------
select lenemi EMISOR,ennombr ENTIDAD, COUNT(*) CANTIDAD,substr(lidtra,1,1) Origen,lesttr AS ESTADO, lcretr AS COD_RETORNO, coddes Descripcion_COD,CAST(SUM(limpgs)AS bigint) importe
from libdebito.drconbep 
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join libdebito.tbcret0p on lcretr = codnro
right join gxbdbps.gentiaf ON (ENEMISO=LENemi)
where lfectr='20220810' and   lcodbc = 'VSA' and codmar='VISA'
and lenemi='540'
GROUP BY lcretr, lcodbc,LENEMI,coddes, lesttr,substr(lidtra,1,1),ennombr
order by substr(lidtra,1,1) desc, lcretr asc, cantidad desc;
------------------------------------------------------------------------------------------------------------------------------------------
-- Visa de Emisor
select cast(TO_DATE(cast(lfectr as varchar(8)),'YYYYMMDD')as date) AS FECHA, lcodbc AS MARCA,lenemi EMISOR,ennombr ENTIDAD, COUNT(*) CANTIDAD
,lesttr AS ESTADO, lcretr AS COD_RETORNO, coddes Descripcion_COD,CAST(SUM(limpgs)AS bigint) importe
from libdebito.drconbep
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join libdebito.tbcret0p on lcretr = codnro
right join gxbdbps.gentiaf ON (ENEMISO=LENemi) and   lcodbc = 'VSA' and codmar='VISA'
where lfectr='20220810'
and lcodbc='VSA' and  codmar = 'VISA'
and lenemi in ('015','020')
GROUP BY Lfectr, lcretr, lcodbc,LENEMI,coddes, lesttr,ennombr
order by lenemi desc , lcretr asc, cantidad desc;
------------------------------------------------------------------------------------------------------------------------------------------
--MST ADQUIRENCIA PROCARD
select cast(TO_DATE(cast(lfectr as varchar(8)),'YYYYMMDD')as date) AS FECHA , lcodbc AS MARCA,lenemi EMISOR, COUNT(*) CANTIDAD,substr(lidtra,1,1) Origen,lesttr AS ESTADO, lcretr AS COD_RETORNO, coddes Descripcion_COD,CAST(SUM(limpgs)AS bigint) as Importe
from libdebito.drconbep
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join libdebito.tbcret0p on lcretr = codnro
where lfectr='20220810' and   lcodbc = 'MST' and codmar='MSTC'
and lenemi in ('510') ---and lnfisc='422745'
GROUP BY Lfectr, lcretr, lcodbc,LENEMI,coddes, lesttr,substr(lidtra,1,1)
order by substr(lidtra,1,1) desc , lcretr asc, cantidad desc;
------------------------------------------------------------------------------------------------------------------------------------------
--Visa Adquiriente  Procard--########################################################################################
select cast(TO_DATE(cast(lfectr as varchar(8)),'YYYYMMDD')as date) AS FECHA , lcodbc AS MARCA,lenemi EMISOR, COUNT(*) CANTIDAD,lesttr AS ESTADO, lcretr AS COD_RETORNO, coddes Descripcion_COD,CAST(SUM(limpgs)AS bigint) as Importe
from libdebito.drconbep
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join libdebito.tbcret0p on lcretr = codnro
where lfectr='20220810' and lcodbc='VSA' and codmar='VISA'
and lenemi in ('510')
GROUP BY Lfectr, lcretr, lcodbc,LENEMI,coddes, lesttr
order by lcretr asc, cantidad;
------------------------------------------------------------------------------------------------------------------------------------------
---RESUMEN TARJETAS DINELCO 703002-703020-703040#############################################################################################################################################################--
select cast(TO_DATE(cast(lfectr as varchar(8)),'YYYYMMDD')as date) AS FECHA , lcodbc AS MARCA,lenemi EMISOR,LBINPR BIN,ENNOMBR entidad, COUNT(*) CANTIDAD,lesttr AS ESTADO,
lcretr AS COD_RETORNO,substr(lidtra,1,1), coddes Descripcion_COD,CAST(SUM(limpgs)AS bigint) as Importe
from libdebito.drconbep
right join libdebito.tbcret0p on lcretr = codnro
INNER JOIN gxbdbps.gentiaf ON (ENEMISO=LENemi)
where lfectr='20220810' and codmar='BEPS'--and   lcodbc = 'DIN' and
and LBINPR in ('703002','703020','703040')--and lhortr between '000000' and '173000'
GROUP BY Lfectr, lcretr,LBINPR, lcodbc,LENEMI,ennombr,coddes, lesttr,substr(lidtra,1,1)
order by LENEMI ASC, lcretr asc, cantidad desc;
------------------------------------------------------------------------------------------------------------------------------------------
--Dinelco Debito Cooperativas
select cast(TO_DATE(cast(lfectr as varchar(8)),'YYYYMMDD')as date) AS FECHA,lenemi EMISOR,ennombr ENTIDAD, COUNT(*) CANTIDAD,substr(lidtra,1,1) Origen,lesttr AS ESTADO, lcretr AS COD_RETORNO, coddes Descripcion_COD,CAST(SUM(limpgs)AS bigint) importe
from libdebito.drconbep 
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join libdebito.tbcret0p on lcretr = codnro
right join gxbdbps.gentiaf ON (ENEMISO=LENemi)
where lfectr='20220810' and codmar='BEPS' and lcodbc = 'DIN'
AND lenemi IN ('068','070','071','072','073','075','076','077','080','081','083','084','088','089','095','096','100','101','102','103','105','106','107','108','109','110',
'111','113','124','125','136','137','140','141','144','145','153','158','161','163','165','166','167','168','169','170','171','172','173','174','177','303',
'304','305','306','307','309','310','311','312','334','340','342','344')
--and LBINPR in ('703002','703020','703040')--and lcretr in '91'--and lhortr between '080300' and '104700'
GROUP BY Lfectr, lcretr, lcodbc,LENEMI,ennombr,coddes, lesttr,substr(lidtra,1,1)
order by LENEMI ASC,cantidad desc;
------------------------------------------------------------------------------------------------------------------------------------------
--RESUMEN DE BILLETERAS
select cast(TO_DATE(cast(lfectr as varchar(8)),'YYYYMMDD')as date) AS FECHA,lcodtr COD_TRX,A.TXDTRX DETALLES,count(*) Cantidad ,lcretr Cod_Retorno,lesttr Estad,substr(lidtra,1,1) Origen,coddes Descripcion_COD ,CAST(SUM(limpgs)AS bigint) importe
from libdebito.drconbep
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join libdebito.tbcret0p on lcretr = codnro
WHERE  lfectr= '20220810'
and lcodtr in ('000052','567102', '000072')
--and lhortr between '190800' and '193000'   and lcretr in ('96') --and lhortr<0000
and limpgs>1
and  codmar = 'BEPS'
group by lcretr,coddes,lesttr,lcodtr,TXDTRX,LFECTR,substr(lidtra,1,1),lfectr
order by lcodtr, lcretr asc,cantidad desc;
------------------------------------------------------------------------------------------------------------------------------------------
--ADQ MST COMERCIO Resumen
select lfectr AS FECHA , lcodbc AS MARCA,lenemi EMISOR, COUNT(*) CANTIDAD, lcretr AS COD_RETORNO,lcomtr COMERCIO
from libdebito.drconbep
where lfectr='20220810' --and   lcodbc = 'MST' and codmar='MSTC'
and lenemi in ('530','560','570','590')
and substr(lidtra,1,1)='P'
--and lcretr in '91'
--and lhortr between '080300' and '104700'
GROUP BY Lfectr, lcretr, lcodbc,LENEMI,lcomtr
ORDER BY cantidad desc, lcretr asc
------------------------------------------------------------------------------------------------------------------------------------------
--verificar trx por Comercio--POR JPOS 
select lfectr AS FECHA , lhortr AS HORA,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS TARJETA, /*PARA ENCRIPTAR TARJETAS*/--
lidcom AS CODIGO, lcomtr  AS COMERCIO,leca62 Version_Pos,lactfj Activo, limpgs AS MONTO, lcretr AS RETORNO, lesttr AS ESTADO from libdebito.drconbep
where lfectr between '20220810' and '20220810' and substr(lidtra,1,1)='P' and lidcom='0701264' -- and lenemi in ('530','560','570','590')  --AND lcomtr like ('%CITYM%')--FORTIS MAYORISTA SUC MARIANO  ---
order by lhortr desc
------------------------------------------------------------------------------------------------------------------------------------------
SELECT lfectr FECHA,lhortr HORA,/*SUBSTR(lnrtar,1,6) || 'XXXXXX' ||SUBSTR(lnrtar,13,4) TARJE*/lnrtar tarje,lexpir VTO,lbinpr bin,
lbcodb,LENEMI ENTIDAD, lcored ,LCODBC MARCA,/*,pdescricion MARCA*/lcodtr as codigo_Trx,
lesttr ESTADO,lcretr COD_RETORNO,lcodtr COD_TRX,limpgs IMPORTE,lcotel celular,--coddes DESCRIP_RET,--lbinpr BIN,--
lerrnb REFE_BEPSA, lidcom COD_COMER,lcomtr LOCAL_COMER, /*txdtrx DESC_TRX,*/LECA62 version_pos,lactfj cod_act,lcautr cod_aut--LNFISC,LPOSEM,LMCCTR,LNFACT--,lntoke--, enemiso BANCO,tgdesc DESCRIPCION
from libdebito.drconbep --inner join libdebito.tbinproc on lbinpr=pbin
WHERE lfectr BETWEEN '20220810' AND '20220810' --and lcretr in ('06')
and substr(leca62,9,10) like ('%J%')
--and lhortr>120000
and lcodtr='014000' and LECA62='SPT1000_vJ3'
--and lidcom not in ('302179','6000392')
order by lhortr desc
------------------------------------------------------------------------------------------------------------------------------------------
--RECHAZO POR BINES
select lfectr AS FECHA , lcodbc AS MARCA,lenemi EMISOR,LBINPR BIN,ENNOMBR entidad, COUNT(*) CANTIDAD,lesttr AS ESTADO,
lcretr AS COD_RETORNO, coddes Descripcion_COD,CAST(SUM(limpgs)AS bigint) as Importe
from libdebito.drconbep
right join libdebito.tbcret0p on lcretr = codnro
INNER JOIN gxbdbps.gentiaf ON (ENEMISO=LENemi)
where lfectr between '20220810' and '20220810' and codmar='BEPS'--and   lcodbc = 'DIN' and
--and LBINPR in ('703002','703020','703040')--
and lcretr in ('55','00')--and lhortr between '080300' and '104700'
GROUP BY Lfectr, lcretr,LBINPR, lcodbc,LENEMI,ennombr,coddes, lesttr
order by LENEMI ASC,cantidad desc
------------------------------------------------------------------------------------------------------------------------------------------
--RECHAZO POR BINES
select lfectr FECHA,lhortr HORA,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,limpgs MONTO,lesttr ESTADO,lcretr RETORNO,coddes Descripcion_COD,lbinpr Bin, pdescricion descrip_tarje,
LCODBC MARCA,LENEMI COD_ENTIDAD,LHISDE EMISOR,LORITR DISPOSITIVO, LNFACT PAIS,lactfj,lerrnb as Referencia ,lcautr as autorizacion,leca62 POSATM
from libdebito.drconbep
inner join libdebito.tbinproc on pbin=lbinpr
right join libdebito.tbcret0p on lcretr = codnro
INNER JOIN gxbdbps.gentiaf ON (ENEMISO=LENemi)
where lfectr = '20220810'  and codmar='BEPS' --and lhortr < '230000'
--and LBINPR in ('703002','703020','703040')--
and lcretr in ('55','00') order by lhortr
------------------------------------------------------------------------------------------------------------------------------------------
--***********----RECHAZO APARTADO POR BINES MASTERCARD MASTERCARD MASTERCARD MASTERCARD
select COUNT(*) CANTIDAD,lbinpr AS BIN ,d.pdescricion descrip_marca, lcodbc AS MARCA, lcretr AS CODIGO, coddes Descripcion_DEL_CODIGO
from libdebito.drconbep
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join libdebito.tbcret0p on lcretr = codnro
inner join mastercard.mastrndta b on lerrnb=MCRRNBEPSA inner join LIBDEBITO.TBCTRA0P c on c.TXCTRX = lcodtr
inner join libdebito.tbinproc d on lbinpr=pbin
where lfectr='20220810' and lcodbc = 'MST' and codmar='MSTC' and lbinpr LIKE ('546297%')
And lcodtr IN ('000054','011000','012000')
and lcretr in ('91','92','05')
and lhortr between '170000' and '224500' -- and substr(lidtra,1,1)= 'T'
GROUP BY lbinpr,pdescricion, lcretr, lcodbc,LENEMI,coddes
order by lcretr asc, cantidad desc;
------------------------------------------------------------------------------------------------------------------------------------------
----jpts
------------------------------------------------------------------------------------------------------------------------------------------
select lfectr fecha_real,lhortr HORA,lnrtar,--SUBSTR(lnrtar,1,6) || 'XXXXXX' ||SUBSTR(lnrtar,13,4) TARJE,
lenemi emisor,lbinpr bin,lposem,lcotel celular,
lesttr ESTADO,lcretr COD_RET,lcodtr COD_TRX,limpgs IMPORTE,lsaltr,--coddes DESCRIP_RET,--lbinpr BIN,--
lerrnb REFE_BEPSA, lidcom COD_COMER,lcomtr LOCAL_COMER,LECA62 ATM_POS,lactfj cod_act,lcautr cod_aut,lnfisc adq,ldistr,lnfisc,lidtra
FROM libdebito.drconbep
WHERE lfectr BETWEEN '20220810' AND '20220810'
--and lerrnb in ('215264221997') --referencia
--and substr(lidtra,1,1) in ('T') --P pos o T atm
--and lcodtr in ('000052')
--and lbinpr in ('230671')--,'456976')
/*and lbinpr in(
'230671', --mastercard debito
'530399', --mc oro conti
'514848', --mc black
'542927', --mc clasica
'547697', -- mc waled
'546297', --mc debito rio
'230729') --mc prepaga conti
*/
order by lhortr desc
------------------------------------------------------------------------------------------------------------------------------------------
--este es el uso generalmente para ver las transacciones jpts
------------------------------------------------------------------------------------------------------------------------------------------
select lfectr fecha_real,lhortr HORA,lnrtar,--SUBSTR(lnrtar,1,6) || 'XXXXXX' ||SUBSTR(lnrtar,13,4) TARJE,
lenemi emisor,lbinpr bin,lposem,lcotel celular,
lesttr ESTADO,lcretr COD_RET,lcodtr COD_TRX,limpgs IMPORTE,lsaltr,--coddes DESCRIP_RET,--lbinpr BIN,--
lerrnb REFE_BEPSA, lidcom COD_COMER,lcomtr LOCAL_COMER,LECA62 ATM_POS,lactfj cod_act,lcautr cod_aut,lnfisc adq,ldistr,lnfisc,lidtra
FROM libdebito.drconbep
WHERE lfectr BETWEEN '20220810' AND '20220810'
--and lerrnb in ('215264221997') --referencia
and substr(lidtra,1,1) in ('T') --P pos o T atm
--and lcodtr in ('000052')
--and lbinpr in ('230671')--,'456976')
/*and lbinpr in(
'230671', --mastercard debito
'530399', --mc oro conti
'514848', --mc black
'542927', --mc clasica
'547697', -- mc waled
'546297', --mc debito rio
'230729') --mc prepaga conti
*/
order by lhortr desc
------------------------------------------------------------------------------------------------------------------------------------------
-- CONSULTAS PARA CAMBIO DE FECHA COMERCIAL
------------------------------------------------------------------------------------------------------------------------------------------
-- TRANSACCIONES DRCONBEP
------------------------------------------------------------------------------------------------------------------------------------------
select LIDCOM as COD_COMERCIO, LFECTR as FECHA_REAL, LFCOTR as FECHA_COMERCIAL, LHORTR as HORA, LNRTAR AS TARJETA, LBINPR AS BIN, LIMPGS as MONTO, 
LIDTRA, LCOMTR as COMERCIO, LORITR, LCODTR as CODIGO_TRX, LCODBC, LCAUTR as COD_AUTORIZ, LCRETR as COD_RESP, LESTTR as RESPUESTA, LERRNB, LECA62 
from libdebito.drconbep where lfectr='20220706' and lhortr>='190000' and lcretr='55'
 order by lhortr desc
 
Select * from libdebito.drconbep where lcretr='55' and lfectr='20220706' and lhortr>='190000' and
------------------------------------------------------------------------------------------------------------------------------------------
-- TRANSACCIONES DS CONTI
------------------------------------------------------------------------------------------------------------------------------------------
select LIDCOM as COD_COMERCIO, LFECTR as FECHA_REAL, LFCOTR as FECHA_COMERCIAL, LHORTR as HORA, LNRTAR AS TARJETA, LBINPR AS BIN, LIMPGS as MONTO, 
LIDTRA, LCOMTR as COMERCIO, LORITR, LCODTR as CODIGO_TRX, LCODBC, LCAUTR as COD_AUTORIZ, LCRETR as COD_RESP, LESTTR as RESPUESTA, LERRNB, LECA62 
from libdebito.drconbep where lfectr='20220706' and lhortr>='190000'
AND LACTFJ IN ('21980761' , '21980763' , '19898844' , '13710097' , '13755406' , '19898745' , '13725452' , '13710097' , '24080072' , '46050312' , 
'19899744' , '24078181' , '24123482' , '14280622' , '14629265' , '14048071' , '14048406' , '14036881' , '14049188' , '14049191' , '14048873' , 
'14048194' , '14049466' , '14030479' , '14050014' , '14030548' , '14032383' , '14046867' , '14048618' , '14047739' , '14047885' , '14048870' , 
'14048401' , '14039166' , '14030635' , '14038239' , '14030557' , '13753425' , '14644015' , '19899843' , '19899936' , '21980768' , '19898774' , '21980770')
 order by lhortr desc
------------------------------------------------------------------------------------------------------------------------------------------
-- CABAL / PANAL
------------------------------------------------------------------------------------------------------------------------------------------
select LIDCOM as COD_COMERCIO, LFECTR as FECHA_REAL, LFCOTR as FECHA_COMERCIAL, LHORTR as HORA, LNRTAR AS TARJETA, LBINPR AS BIN, LIMPGS as MONTO, 
LIDTRA, LCOMTR as COMERCIO, LORITR, LCODTR as CODIGO_TRX, LCODBC, LCAUTR as COD_AUTORIZ, LCRETR as COD_RESP, LESTTR as RESPUESTA, LERRNB, LECA62 
from libdebito.drconbep where lfectr='20220706' and lhortr>='190000'
AND LENEMI IN ('512' , '508')
order by lhortr desc
------------------------------------------------------------------------------------------------------------------------------------------
select COUNT(*) CANTIDAD,lcodbc marca,lcretr retorno, lbinpr bin from libdebito.drconbep where lfectr between '20220706' and '20220707'
--and lnrtar like '627431155%' 
and lcretr in ('55') and lhortr >='230000' --and '085400'
GROUP BY lcretr,lcodbc,lbinpr;
------------------------------------------------------------------------------------------------------------------------------------------
select COUNT(*) CANTIDAD,lcodbc marca,lcretr retorno, lbinpr bin from libdebito.drconbep where lfectr between '20220706' and '20220707'
--and lnrtar like '627431155%'
and lcretr in ('55') --and lhortr between '230000' and '085400'
GROUP BY lcretr,lcodbc,lbinpr;
------------------------------------------------------------------------------------------------------------------------------------------
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

---------------------------------------------venta minutos----------------------------------------------------------------------
select lfectr, lhortr, lnrtar, lexpir, lcodbc, lidcom, lcomtr, limpgs, lcretr, lesttr, LCODTR, TXDTRX,  SUBSTR(LIDTRA,1,1) DISPOSITIVO, LCOTEL TELEFONO, LCORED LINEA
from libdebito.drconbep 
inner join libdebito.tbctra0p on lcodtr = TXCTRX
where lfectr='20220425'
and lcretr='00' and lcodtr in ('901020', '514000') order by lhortr desc 
-------------------------------------------------------------------------------------------------------------------
-----pasos de incoming
SELECT *FROM GXBDBPS.NUT999 where dbgusrid = 'U99RODRI' AND DBGCLA LIKE '2022089%'

Select movfpro,movftrx fechatrx,  movrrnbep nrotransaccion, (CASE WHEN movtpta = 'D' THEN 'DEBITO' ELSE 'CREDITO' END)  tipotarjeta, movcoau Autorizacion, movdesem Emisor, substr(movntar,1,6)||'XXXXXX'||substr(movntar,13,4) tarjeta, 
movmarc marca, 1 cuotas, '600' moneda,  movcoam origen, movcomer codsucursal, movdeno sucursal, a.sercodi tipo, movcodpr procesadora, 
movcodis dispositivo, movesta estado, movidlt nroresumen, movimpo importe, (OPCOMENT+OPCOMBPS) COMISION, (OPIVAENT+OPIVABPS) IVACOMISION, OPRENTA RENTA, OPREIVA IVARENTA, (OPMONTO-OPCOMENT-OPCOMBPS-OPIVAENT-OPIVABPS-OPRENTA-OPREIVA) NETO,
MOVCDBCC CODBANCO, movctbcc CTABANCO, MOVCOCO PORCENCOMISION, substr(cast(varchar(tsbfeac) as char(10)),1,4)||substr(cast(varchar(tsbfeac) as char(10)),6,2)||substr(cast(varchar(tsbfeac) as char(10)),9,2) fechaacreditacion, (CASE WHEN MOVPGON= 'O'  THEN 'LINEA' WHEN  MOVPGON= 'B' THEN 'LOTE' ELSE 'PENDIENTE' END) TIPOOPERACION, tsbnref REF_EXTRACTO, tsbnref ref_bepsa 
from gxfindta.tclmov a
inner join gxopera.opmovi b on movrrnbep = opnoref and MOVFPRO = OPFECOM and opstatus = 'A'
left join gxfindta.tcltsb c on movrrnbep = tsbnref and tsbtpop = '01'
--WHERE SUBSTR(movfpro,1,4)||'-'||SUBSTR(movfpro,5,2)||'-'||SUBSTR(movfpro,7,2) = DATE(CURDATE()- 1 days) 
where movfpro BETWEEN '20210910' AND '20210910'
and movpgon = 'O' and movruc = '80016096-7' and movesta = 'A'
UNION
/*Transacciones Reversadas Online*/
Select movfpro,movftrx fechatrx,  movrrnbep nrotransaccion, (CASE WHEN movtpta = 'D' THEN 'DEBITO' ELSE 'CREDITO' END)  tipotarjeta, movcoau Autorizacion, movdesem Emisor, substr(movntar,1,6)||'XXXXXX'||substr(movntar,13,4) tarjeta, 
movmarc marca, 1 cuotas, '600' moneda,  movcoam origen, movcomer codsucursal, movdeno sucursal, a.sercodi tipo, movcodpr procesadora, 
movcodis dispositivo, movesta estado, movidlt nroresumen, movimpo importe, (OPCOMENT+OPCOMBPS) COMISION, (OPIVAENT+OPIVABPS) IVACOMISION, OPRENTA RENTA, OPREIVA IVARENTA, (OPMONTO-OPCOMENT-OPCOMBPS-OPIVAENT-OPIVABPS-OPRENTA-OPREIVA) NETO,
MOVCDBCC CODBANCO, movctbcc CTABANCO, MOVCOCO PORCENCOMISION, substr(cast(varchar(tsbfeac) as char(10)),1,4)||substr(cast(varchar(tsbfeac) as char(10)),6,2)||substr(cast(varchar(tsbfeac) as char(10)),9,2) fechaacreditacion, (CASE WHEN MOVPGON= 'O'  THEN 'LINEA' WHEN  MOVPGON= 'B' THEN 'LOTE' ELSE 'PENDIENTE' END) TIPOOPERACION, tsbnref REF_EXTRACTO, tsbnref ref_bepsa 
from gxfindta.tclmov a
inner join gxopera.opmovi b on movrrnbep = opnoref and MOVFPRO = OPFECOM and opstatus = 'E'
left join gxfindta.tcltsb c on movrrnbep = tsbnref and tsbtpop = '03'
--WHERE SUBSTR(movfpro,1,4)||'-'||SUBSTR(movfpro,5,2)||'-'||SUBSTR(movfpro,7,2) = DATE(CURDATE()- 1 days) 
where movfpro BETWEEN  '20210910' AND '20210910'
and movpgon = 'O' and movruc = '80016096-7' and movesta = 'R'

UNION
/*Transacciones Aprobadas Batch <> Red de pagos*/
Select movfpro,movftrx fechatrx,  movrrnbep nrotransaccion, (CASE WHEN movtpta = 'D' THEN 'DEBITO' ELSE 'CREDITO' END)  tipotarjeta, movcoau Autorizacion, movdesem Emisor, substr(movntar,1,6)||'XXXXXX'||substr(movntar,13,4) tarjeta,
movmarc marca, 1 cuotas, '600' moneda,  movcoam origen, movcomer codsucursal, movdeno sucursal, a.sercodi tipo, movcodpr procesadora,
movcodis dispositivo, movesta estado, movidlt nroresumen,(Case when sercodi = 'DINEFE' THEN (OPMONTO-OPCOMENT-OPCOMBPS-OPIVAENT-OPIVABPS-OPRENTA-OPREIVA) ELSE movimpo END) importe, (CASE WHEN sercodi = 'DINEFE' THEN 0 ELSE (OPCOMENT+OPCOMBPS)END) COMISION,
(CASE WHEN sercodi = 'DINEFE' THEN 0 ELSE (OPIVAENT+OPIVABPS)END) IVACOMISION, OPRENTA RENTA, OPREIVA IVARENTA, (OPMONTO-OPCOMENT-OPCOMBPS-OPIVAENT-OPIVABPS-OPRENTA-OPREIVA) NETO,
MOVCDBCC CODBANCO, movctbcc CTABANCO, MOVCOCO PORCENCOMISION, movfcre fechaacreditacion, 'LOTE' TIPOOPERACION, opcreref REF_EXTRACTO, MOVIDLT ref_bepsa
from gxfindta.tclmov a
inner join gxopera.opmovi b on movrrnbep = opnoref and MOVFPRO = OPFECOM
left join gxopera.oplicre c on movfpro = opcrefcom and movcomer = opcrecom
--WHERE SUBSTR(movfpro,1,4)||'-'||SUBSTR(movfpro,5,2)||'-'||SUBSTR(movfpro,7,2) = DATE(CURDATE()- 1 days)
where movfpro BETWEEN  '20210910' AND '20210910'
and movpgon = 'B' and movruc = '80016096-7' AND SERCODI <> 'REDPAG'
UNION
/*Transacciones Aprobadas Batch = Red de pagos*/
Select movfpro,movftrx fechatrx,  movrrnbep nrotransaccion, (CASE WHEN movtpta = 'D' THEN 'DEBITO' ELSE 'CREDITO' END)  tipotarjeta, movcoau Autorizacion, movdesem Emisor, substr(movntar,1,6)||'XXXXXX'||substr(movntar,13,4) tarjeta,
movmarc marca, 1 cuotas, '600' moneda,  movcoam origen, movcomer codsucursal, movdeno sucursal, a.sercodi tipo, movcodpr procesadora,
movcodis dispositivo, movesta estado, movidlt nroresumen,  (Case when sercodi = 'REDPAG' THEN OPMONTO  ELSE movimpo END) importe, (CASE WHEN sercodi = 'REDPAG' THEN 0 ELSE (OPCOMENT+OPCOMBPS)END) COMISION, (CASE WHEN sercodi = 'REDPAG' THEN 0 ELSE (OPIVAENT+OPIVABPS)END) IVACOMISION, OPRENTA RENTA, OPREIVA IVARENTA, OPMONTO NETO,
MOVCDBCC CODBANCO, movctbcc CTABANCO, MOVCOCO PORCENCOMISION, movfcre fechaacreditacion, 'LOTE' TIPOOPERACION, opcreref REF_EXTRACTO, MOVIDLT ref_bepsa
from gxfindta.tclmov a
inner join gxopera.opmovi b on movrrnbep = opnoref and MOVFPRO = OPFECOM
left join gxopera.oplicre c on movfpro = opcrefcom and movcomer = opcrecom
--WHERE SUBSTR(movfpro,1,4)||'-'||SUBSTR(movfpro,5,2)||'-'||SUBSTR(movfpro,7,2) = DATE(CURDATE()- 1 days)
where movfpro BETWEEN   '20210910' AND '20210910'
and movpgon = 'B' and movruc = '80016096-7' AND SERCODI = 'REDPAG'
----------------------------------------------------------------------------------------------------------------     
    
--verificar trx por comercio--
select lfectr, lhortr, lnrtar, lidcom, lcomtr, limpgs, lcretr, lesttr from libdebito.drconbep
where lfectr between '20220425' and '20220425' and lidcom='9099248' order by lhortr desc; 

and limpgs = '140000'  and substr(lidtra,1,1) = 'T' and lhortr between '073000' and '080000'

----------------------------------------------------------------------------------------------------------------
--USUARIOS TIGO MONEY
select * from roshkalib.m_usuarios
where numero_celular = '0983214316'
----------------------------------------------------------------------------------------------------------------
------mastercar con cuenta debito y diferencia.
SELECT m.MCROL , m.MCFLD037, m.MCRRNBEPSA , m2.MCRRNBEPSA , MCPANNMBR , MCIMPORTE, m2.mc004, m2.mc049, MCIMPORTE - m2.MC004  AS "Diferencia"
, (SELECT NECTANRO  FROM
GXBDBPS.TDEMNOTAR  t WHERE TRIM(NENROTARJ) = TRIM(MCPANNMBR) LIMIT 1 )
FROM MASTERCARD.MASTRNDTA m
INNER JOIN MASTERCARD.MASCTLDTA m2 ON
m.MCRRNBEPSA = m2.MCRRNBEPSA
WHERE
MCFECREAL = 20220727 AND
m.MCROL ='ISS' AND
m2.MC049 = 600 AND
MCIMPORTE > 0 AND
 SUBSTRING(m.MCPANNMBR ,1, 6) IN ('230671', '546297') AND
MCHORAREAL BETWEEN  183000 AND 235959;
----------------------------------------------------------------------------------------------------------------
SELECT m.MCROL , m.MCFLD037, m.MCRRNBEPSA , m2.MCRRNBEPSA , MCPANNMBR , SUBSTRING(m2.mc043,38,3) Pais, MCIMPORTE, m2.mc004, m2.mc049, MCIMPORTE - m2.MC004  AS Diferencia
, (SELECT NECTANRO  FROM
GXBDBPS.TDEMNOTAR  t WHERE TRIM(NENROTARJ) = TRIM(MCPANNMBR) LIMIT 1 )
FROM MASTERCARD.MASTRNDTA m
INNER JOIN MASTERCARD.MASCTLDTA m2 ON
m.MCRRNBEPSA = m2.MCRRNBEPSA
WHERE
MCFECREAL = 20221008 AND
m.MCROL ='ISS' AND
m2.MC049 = 600 AND
SUBSTRING(m2.mc043,38,3) = 'PRY' AND 
MCIMPORTE > 0 AND
 SUBSTRING(m.MCPANNMBR ,1,6) IN ('230671', '546297') AND
MCHORAREAL BETWEEN  183000 AND 235959;
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------evento Visa 20220924
--------------------conti
SELECT LNRTAR, limpgs, LERRNB, LFECTR, LHORTR, lcretr, LCOMTR, LIDCOM, vimti, VIF044RCOD, VIF044RMSG
FROM LIBDEBITO.DRCONBEP
INNER JOIN VISA.VISTRNDTA v ON
LERRNB = VIRRNBEPSA
WHERE LFECTR BETWEEN 20220923 AND 20220924
      AND LCRETR = '76' AND VIF044RCOD= '9076' AND LESTTR = 'A'
      AND LIMPGS > 0 AND LENEMI = '510' AND lbinpr='456976'
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------bnf
SELECT LNRTAR, limpgs, LERRNB, LFECTR, LHORTR, lcretr, LCOMTR, LIDCOM, vimti, VIF044RCOD, VIF044RMSG
FROM LIBDEBITO.DRCONBEP
INNER JOIN VISA.VISTRNDTA v ON
LERRNB = VIRRNBEPSA
WHERE LFECTR BETWEEN 20220923 AND 20220924
      AND LCRETR = '76' AND VIF044RCOD= '9076' AND LESTTR = 'A'
      AND LIMPGS > 0 AND LENEMI = '510' AND lbinpr='488234'
-------------------------------------------------------------------------------------------------------------------------------------------------------------------    
-----------log para ver si reverso o no. si tiene mas de 2 es reversado = 1100000 en la ultima linea  
select * from gxbdbps.lgcoment where LGMSG like'%27803298446%'
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------no reversada
SELECT LNRTAR, limpgs, LERRNB, LFECTR, LHORTR, lcretr, LCOMTR, LIDCOM
FROM LIBDEBITO.DRCONBEP
INNER JOIN VISA.VISTRNDTA v ON
LERRNB = VIRRNBEPSA
INNER JOIN gxbdbps.LGCOMENT B ON
LERRNB = substr(LGMSG, 49, 12)
WHERE LFECTR BETWEEN 20221005 AND 20221005
      AND LCRETR = '76' AND VIF044RCOD= '9076' AND LESTTR = 'A'
      AND LIMPGS > 0 AND LENEMI = '510' AND lbinpr='456976'
GROUP BY LNRTAR, limpgs, LERRNB, LFECTR, LHORTR, lcretr, LCOMTR, LIDCOM
HAVING count(*) < 2
ORDER BY LNRTAR, limpgs, LERRNB, LFECTR, LHORTR, lcretr, LCOMTR, LIDCOM ;
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------reversada
SELECT LNRTAR, limpgs, LERRNB, LFECTR, LHORTR, lcretr, LCOMTR, LIDCOM
FROM LIBDEBITO.DRCONBEP
INNER JOIN VISA.VISTRNDTA v ON
LERRNB = VIRRNBEPSA
INNER JOIN gxbdbps.LGCOMENT B ON
LERRNB = substr(LGMSG, 49, 12)
WHERE LFECTR BETWEEN 20220923 AND 20220924
      AND LCRETR = '76' AND VIF044RCOD= '9076' AND LESTTR = 'A'
      AND LIMPGS > 0 AND LENEMI = '510' AND lbinpr='456976'
GROUP BY LNRTAR, limpgs, LERRNB, LFECTR, LHORTR, lcretr, LCOMTR, LIDCOM
HAVING count(*) >=2
ORDER BY LNRTAR, limpgs, LERRNB, LFECTR, LHORTR, lcretr, LCOMTR, LIDCOM ;
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------con cuentas y ci
SELECT LNRTAR, NECTANRO, TDCLINRODOC, Limpgs, LERRNB, LFECTR, LHORTR, lcretr, LCOMTR, LIDCOM
FROM LIBDEBITO.DRCONBEP
INNER JOIN VISA.VISTRNDTA v ON
LERRNB = VIRRNBEPSA
INNER JOIN gxbdbps.tdemnotar ON
NENROTARJ = LNRTAR
INNER JOIN gxbdbps.TDCTAAD ON
NECTANRO = TDCTANRO AND tdbinnro = '456976'
INNER JOIN gxbdbps.LGCOMENT B ON
LERRNB = substr(LGMSG, 49, 12)
WHERE LFECTR BETWEEN 20220930 AND 20220930  AND LCRETR = '76'
AND VIF044RCOD= '9076' AND LESTTR = 'A' AND LIMPGS > 0
AND LENEMI = '510' AND lbinpr='456976'
AND vimti = 120
--AND VIRRNBEPSA IN ('226798083920', '226798083957' )
GROUP BY LNRTAR, NECTANRO, TDCLINRODOC, Limpgs, LERRNB, LFECTR, LHORTR, lcretr, LCOMTR, LIDCOM
HAVING count(*) < 2
ORDER BY LNRTAR, NECTANRO, TDCLINRODOC, Limpgs, LERRNB, LFECTR, LHORTR, lcretr, LCOMTR, LIDCOM
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT *  FROM LIBDEBITO.DRCONBEP
INNER JOIN GXBDBPS.TDEMNOTAR t ON
t.NENROTARJ = LNRTAR
INNER JOIN GXBDBPS.TDCTAAD t2 ON
t.NECTANRO = t2.TDCTANRO AND tdbinnro = '456976'
WHERE LFECTR = 20220930 AND LBINPR = '456976'  
AND LESTTR = 'A' AND LCRETR ='00' AND LHISOR LIKE '%Vis/Emi%' AND
LIDTRA IN (SELECT LIDTRA FROM LIBDEBITO.DRCONBEP
WHERE LFECTR = 20220930 AND LCRETR='76');

SELECT * FROM VISA.VISTRNDTA WHERE VIFECREAL='20220930' AND VIRRNBEPSA=227300611991;
SEELCT * FROM MASTERCARD.
SELECT * FROM LIBDEBITO.DRCONBEP WHERE LERRNB='227300611991'
------------------------------
[12:57] Armando Daniel Rios
select  lfectr AS FECHA,substr((lhortr + 10000000),3,2) hORA, count(*) Cant,SUBSTR(LIDTRA,1,1) DISPOSITIVO,lcodbc marca, sum(limpgs) Importe
from libdebito.drconbep where lfectr between '20221005' and '20221005'
and substr(lidtra,1,1) = 'T'
and lcodbc = 'MST'group by lcodbc, lfectr,substr((lhortr + 10000000),3,2),SUBSTR(LIDTRA,1,1) order by substr((lhortr + 10000000),3,2)  desc;

[12:58] Armando Daniel Rios
select  lfectr AS FECHA,substr((lhortr + 10000000),3,2) Hora, count(*) Cant,SUBSTR(LIDTRA,1,1) DISPOSITIVO,lcodbc marca, sum(limpgs) Importe
from libdebito.drconbep where lfectr between '20221005' and '20221005'
and substr(lidtra,1,1) = 'P'
and lcodbc = 'VSA'
group by lcodbc, lfectr,substr((lhortr + 10000000),3,2),SUBSTR(LIDTRA,1,1) order by substr((lhortr + 10000000),3,2) desc
---------------------------------------
SELECT m.MCROL , m.MCMTI, m.MCFLD037  LHISOR , LHORTR , LNRTAR , LCODTR , LERRNB , LIDTRA , LIDCOM , LMCCTR , LCOMTR , LIMPGS,
LCRETR , LESTTR, m.MCF044RCOD  , trim(m.MCF044RMSG), m.MCMIPCONN  FROM LIBDEBITO.DRCONBEP
INNER JOIN MASTERCARD.MASTRNDTA m  ON m.MCRRNBEPSA  = LERRNB
--INNER JOIN MASTERCARD.MASCTLDTA m2 ON m.MCFLD037 = m2.MCFLD037
WHERE LFECTR = 20221008 AND LCODBC = 'MST'
AND m.MCROL  = 'ADQ' -- ISS --EMISOR
--AND LERRNB = '228004013512'
ORDER BY LHORTR DESC LIMIT 100;

