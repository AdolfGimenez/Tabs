--50xxx en adelante hasta 5365xxx ingresa via autorizador legacy
--56xxx en adelante autorizador jpts
-----------------------------------------------
SELECT * FROM GXBDBPS.TDENTCOM; --ip de entidades transaccionales
--USUARIO AZ7
SELECT * FROM FEATMSLIB.AUUSR;
--LLAVES
SELECT * FROM FEATMSLIB.AZKRBL;
------------------------------------------------------------------------------------------------------------------------------------------
--Para limpiar cola de datos
CALL PGM(QCLRDTAQ) PARM ('DEB' 'LIBDEBITO');
---limpiar cola de logger
CALL QSYS2.CLEAR_DATA_QUEUE('LOGQ','QUSRTOOLS');
------------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM GXBDBPS.TDENTCOM; --en esta tabla esta la configuraci�n
SELECT * FROM libdebito.SWITCHENT WHERE SENTPUE = 5150 ; --tabla de configuraci�n de los comserver
--CONECTIVIDAD.
--Para verificaci�n de log con BNF y Continental, para ver si hay conectividad entre bepsa y bnf utilizar emisor 1002 y para continental utilizar emisor 1020
select*  from gxbdbps.lgcoment where date(lgfechor)='2023-07-20' and lgentid='1002' order by lgfechor desc;-- Bnf emisor 1002
select*  from gxbdbps.lgcoment where date(lgfechor)='2023-07-19' and lgentid='1020' AND LGMSG like'%320005296130%' order by lgfechor desc;-- Conti emisor 1020
-----------log para ver si reverso o no. si tiene mas de 2 es reversado = 1100000 en la ultima linea
----------------------------------#tabla de excepciones
select * FROM GXSWTDTA.TMIEXC  where EXCBIN = '425678' and EXCCODCOM = '9099257';
select * from gxswtdta.TMITH;
------------------------------------------------------------------------------------------------------------------------------------------
/*tabla de respuestas-retorno de bepsa por marca*/
SELECT * FROM LIBDEBITO.TBCRET0P;
------------------------------------------------------------------------------------------------------------------------------------------
--para lenemi
Select * from gxopera.opentid1;
------------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM GXAUTDTA.TADQMSTEXC; --exepciones MAST
SELECT * FROM GXSWTDTA.TMIEXC t WHERE EXCFCHING='20250507' ; --tabla de exepciones VISA
------------------------------------------------------------------------------------------------------------------------------------------
--para codigo de trx
SELECT * FROM LIBDEBITO.tbctra0p;
-------------------------------------------GENERAL-------------------------------------------------
select lfectr fecha_real , lfcotr fecha_com,lhortr HORA,SUBSTR(lnrtar, 1, 6) || 'XXXXXX' ||SUBSTR(lnrtar, 13, 4) TARJE, lcodbc marca,
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
WHERE lfectr >='20230623'--BETWEEN '20221116' AND '20221116'
--and substr(LIDTRA,1,1) = 'T'
and substr(LIDTRA, 1, 1) = 'P'
--and lerrnb >='308464087952' --referencia
--and lerrnb in ('134110612898','134110612907','134110612917','134110612929')
--and substr(lidtra,1,1)='T' --pos o atm
--and lenemi in ('020','002','040','015','530')
--and lbinpr in ('602049')
--and lactfj ='21980257'
--and lbinpr in ('703002')--,'488234','443078')
--and lcodbc in ('DIN')
--and lbinpr='230671'
--and lcretr in ('92')--,'92')--,'92','91')
--and lenemi='165'
--and lenemi='510'
--and lidcom in ('0302389')
--and lcodtr in ('370000','380000','390000','000052')
--aand lcodtr in ('300000','301000','302000','311000','311100','312000','312100','313000','313100','314001')
--and lbinpr='516400'
--and lhortr >='234000'
--and lnrtar in ('2306710001352989')
order by lhortr desc;
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
where lfectr = '20240110'
--AND LORITR='T' --P
and virol = 'ADQ'--- rol adquirente
--and virol ='ISS'  --- rol emisor
--and codmar='BEPS'
--and lcretr in '81' -- Verificacion por cod de retorno
and lcodbc='VSA'
--and lesttr='A' --estado
--AND substr(vipannmbr, 1,6) = '425678' --Verificacion por bin de VISA CONTI ISS
--AND substr(vipannmbr, 1,6) = '425678'--Verificacion por bin de VISA BNF adq
--and lnrtar like '4998317%' --filtro por bin
and lhortr>='000000'
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
where lfectr= '20221116'
and lhortr >='180000'
--AND B.MCROL='ISS' --rol emisor
AND B.MCROL='ADQ' --rol adquirente
--and lcretr= '05' --por codigo de retorno
order by lhortr desc;
-----------------------------
SELECT * FROM MASTERCARD.TALTRENMS WHERE DATE(FECLOG)='2022-10-08' ORDER BY FECLOG DESC LIMIT 50;
------------------------------------------------------------------------------------------------------------------------------------------
--**************PROCARD*  CODIGO DE PROCESO LENEMI 510 (Procard)*************************02
select lfectr FECHA,lhortr HORA,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta ,ptiptar TIP_TAR,limpgs MONTO,lesttr ESTADO
,lcretr RETORNO,lbinpr Bin, pdescricion descrip_tarje,LCODBC MARCA,LENEMI COD_ENTIDAD,LHISDE RESPONDE,LORITR DISPOSITIVO, LNFACT PAIS
,lactfj,lerrnb Cod_Ref from libdebito.drconbep inner join libdebito.tbinproc on pbin=lbinpr
where lfectr between '20221206' and '20221206'
and lenemi in ('510')
--and lcretr in '91' --filtro por cod de retorno
--and lnrtar like '451902%' --filtro por numero de tarjeta en caso de contar con el numero completo se elimina el like reemplazandolo por un = 'Numero de tarjeta'
order by lhortr desc;
------------------------------------------------------------------------------------------------------------------------------------------
Select * from gxopera.opentid1 where entcodi = ('015');
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
where lfectr between '20221206' and '20221206'
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
where lfectr= '20221206'
and lbinpr like '703002'
--and lnrtar = ' 7030020138977005'
order by lhortr desc ;
------------------------------------------------------------------------------------------------------------------------------------------
---07 DEBITO DEBITO CONTINENTAL  -07
 select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,--lnrtar,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 AS VERSION
,loritr as ATM_POS,lerrnb as Referencia ,LENEMI COD_ENTIDAD,lnrtar AS Tarjeta
from libdebito.drconbep
where lfectr= '20221206'
and lnrtar like '703020%'
order by lhortr desc;
------------------------------------------------------------------------------------------------------------------------------------------
-- DEBITO DINELCO BCO RIO-----08
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,--lnrtar,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 AS VERSION
,loritr as ATM_POS,lerrnb as Referencia ,LENEMI COD_ENTIDAD
from libdebito.drconbep
where lfectr= '20221206'
and lnrtar like '703040%'
order by lhortr desc;
------------------------------------------------------------------------------------------------------------------------------------------
-- DINELCO MTS WALEN  09
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta
,SUBSTR(LIDTRA,1,1) DISPOSITIVO,lenemi as emisor, lbinpr as Bin ,lcodbc as Marca ,limpgs as Monto,lesttr as Estado,lcretr as Retorno
,lhisde as Respondido_Por,LNFACT AS PAIS,leca62 AS VERSION,loritr as ATM_POS,lerrnb as Referencia
from libdebito.drconbep
where lfectr between '20221206' and '20221206'
and  lnrtar like '547697%'
--and lcodbc=''
--and substr(lidtra,1,1) = 'P'
--AND lcomtr like ('%LANDAU%')
--and lcretr in ('06')
--and lcodmar='VISA'
-- --and lesttr='R'
order by lhortr desc;
------------------------------------------------------------------------------------------------------------------------------------------
----DINELCO PROVAVOTY	and lenemi='166'
select lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,--lnrtar,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 AS VERSION
,loritr as ATM_POS,lerrnb as Referencia ,LENEMI COD_ENTIDAD
from libdebito.drconbep
where lfectr= '20221206'
and lenemi='166'
order by lhortr desc;
------------------------------------------------------------------------------------------------------------------------------------------
---- PANAL CABAR PROCESADA POR PROCARD-----
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,--lnrtar,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por
,leca62 AS VERSION ,loritr as ATM_POS,lerrnb as Referencia
from libdebito.drconbep
where lfectr= '20221206'
and LCODBC in ('CAB','PAN')
order by lhortr desc;
------------------------------------------------------------------------------------------------------------------------------------------
---DINELCO DEBITO CAPIATA and lenemi='107'
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,--lnrtar,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por
,leca62 AS VERSION ,loritr as ATM_POS,lerrnb as Referencia
from libdebito.drconbep
where lfectr= '20221206'
and lenemi='107'
order by lhortr desc;
------------------------------------------------------------------------------------------------------------------------------------------
---DINELCO DEBITO a NEMBY and lenemi='110'
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,--lnrtar,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 AS VERSION
,loritr as ATM_POS,lerrnb as Referencia
from libdebito.drconbep
where lfectr= '20221206'
and lenemi='110'
order by lhortr desc;
------------------------------------------------------------------------------------------------------------------------------------------
--********************************TRANSACCIONES POR JTPS**********************************************************
SELECT lfectr FECHA,lhortr HORA,/*SUBSTR(lnrtar,1,6) || 'XXXXXX' ||SUBSTR(lnrtar,13,4) TARJE*/lnrtar tarje,lexpir VTO,lbinpr bin,lctaor,lctade
lbcodb,LENEMI ENTIDAD, lcored ,LCODBC MARCA,/*,pdescricion MARCA*/
lesttr ESTADO,lcretr COD_RETORNO,LENEMI COD_ENTIDAD,lcodtr COD_TRX,limpgs IMPORTE,lcotel celular,--coddes DESCRIP_RET,--lbinpr BIN,--
lerrnb REFE_BEPSA, lidcom COD_COMER,lcomtr LOCAL_COMER, /*txdtrx DESC_TRX,*/LECA62 version_pos,lactfj cod_act,lcautr cod_aut
--LNFISC,LPOSEM,LMCCTR,LNFACT--,lntoke--, enemiso BANCO,tgdesc DESCRIPCION
from libdebito.drconbep
--inner join libdebito.tbinproc on lbinpr=pbin
WHERE lfectr= '20221206'
and substr(leca62,9,10) like ('%J%')
order by lhortr desc;
------------------------------------------------------------------------------------------------------------------------------------------
---CODIGOS DE PROCESADORES DE LAS COOPERATIVAS-- EN CASO DE RECHAZO EXTRAER POR CODIGO DE LENEMI
 select LIDCOM as COD_COMERCIO, LFECTR as FECHA_REAL, LHORTR as HORA, LCAUTR as COD_AUTORIZ, LCRETR as COD_RESP, LESTTR as RESPUESTA, lcodbc as Marca
, SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta, LIMPGS as MONTO, LCOMTR as COMERCIO, LORITR Dispositivo, LCODTR as CODIGO_TRX,
lhisde as Respondido_Por , lenemi Cod_entidad,ennombr ENTIDAD
from libdebito.drconbep
left join gxbdbps.gentiaf ON (ENEMISO=LENemi)
where lfectr='20221206'
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
where lfectr='20221206'
--and lcodtr='000052'---Tigo Money
--and lcodtr='567102'--Bill Personal
--and lenemi='591'--Bill Claro
and lnrtar like '6274311520%'--Tigo Card
--and lcodtr in ('370000','380000','390000')--Cico
--and lnrtar like '627431581%'-- Tigo sin tarjetas
and limpgs>1
and  codmar = 'BEPS'
order by lhortr desc;
------------------------------------------------------------------------------------------------------------------------------------------
--transacciones desde la red de infonet con nuestras tarjetas.
select lfectr fecha_real , lfcotr fecha_com,lhortr HORA,SUBSTR(lnrtar,1,6) || 'XXXXXX' ||SUBSTR(lnrtar,13,4) TARJE,lnrtar,lhisde,
lenemi emisor,lbinpr bin,lposem,lcotel celular,
lesttr ESTADO,lcretr COD_RET,lcodtr COD_TRX,limpgs IMPORTE,--coddes DESCRIP_RET,--lbinpr BIN,--
lerrnb REFE_BEPSA, lidcom COD_COMER,lcomtr LOCAL_COMER,LECA62 ATM_POS,lactfj cod_act,lcautr cod_aut,lnfisc adq,ldistr,lnfisc
FROM libdebito.drconbep
WHERE lfectr BETWEEN '20221206' AND '20221206'
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
order by lhortr desc;
--ah� est�n comentados los bines que son nuestros las MC  , Marca y clase ,las de Visa ya saben cuales son 456976 y 488234
------------------------------------------------------------------------------------------------------------------------------------------
--MST que le filtras por los Bines.
--Julio Cesar Caba�as
select b.mcmti estado_mc,b.mcf044rmsg mensaje,lfectr fecha,lhortr hora,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lcautr as autori,limpgs As importe,
lcretr retorno,lesttr ESTAD,b.mcrol rol,lbinpr bin,d.pdescricion descrip_marca,lcodbc MARCA,lenemi entidad,c.txdtrx descrip_trx,substr(leca62,1,4) atm,substr(lerrnb,2,13) refencia,lcodtr cod_trx,lidcom cod_atm
from libdebito.drconbep inner join mastercard.mastrndta b on lerrnb=MCRRNBEPSA inner join LIBDEBITO.TBCTRA0P c on c.TXCTRX = lcodtr
inner join libdebito.tbinproc d on lbinpr=pbin --and lcretr in '91'
--and lbinpr in ('601639')--('542927','230671','530399')
and lcodtr IN ('000054','011000','012000')where lfectr between '20221206' and '20221206' and lenemi in ('530','560','590','570') --
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
select lfectr,lnrtar, lhortr, lidcom, lcomtr, limpgs, lesttr, lcretr,lerrnb AS REFERENCIA,A.TXDTRX DETALLES,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta---lcotel AS LINEA_CEL,
from libdebito.drconbep
left join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
where lfectr between '20221206' and '20221206 ' and lnrtar like '488234%'
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
WHERE LFECTR = 20221206 AND LCODBC = 'VSA'
AND VIROL = 'ADQ'
AND LCRETR = '19'
ORDER BY LHORTR DESC
LIMIT 100;
------------------------------------------------------------------------------------------------------------------------------------------
-----select para ayudarte con campos 63------------
SELECT MC037 REFERENCIA , MC063 CAMPO_63 FROM MASTERCARD.MASCTLDTA m WHERE mc037 in('209146717688','209146717627','209146689998','209146680429');
------------------------------------------------------------------------------------------------------------------------------------------
--------ENTIDADES POR LENEMI----
select lerrnb,lfectr fecha,lhortr hora,lidcom cod_comer,lcomtr comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS TARJETA, lcotel numero --lnrtar
,limpgs,lesttr,lcretr
,LCODBC marca,lbinpr bin,LORITR dispositivo,lenemi from libdebito.drconbep
where lfectr between '20221206' and '20221206'
--and lcodtr='000052'---Tigo Money
--and lenemi='166'--PORAVOTY
and lenemi='174'
order by lhortr desc;
------------------------------------------------------------------------------------------------------------------------------------------
--TABLA DE BINES
select * from libdebito.tbinproc
where pbin = '109910';
------------------------------------------------------------------------------------------------------------------------------------------
---------------370 carga , 380 retiro, 390 giro
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr, lcodtr codtrx from libdebito.drconbep
where lfectr between '20221206' and '20221206' and lcodtr in  ('370000','380000','390000')
order by lhortr desc;
------------------------------------------------------------------------------------------------------------------------------------------
------------------------TRANSACCIONES ATM-CENTRE -------------------------------------------------------------------------
select lfectr as FECHA,lhortr as HORA,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS TARJETA,leca62 As ATM,lcomtr as NOMBRE_ATM,limpgs as MONTO,lcretr as RETORNO, lesttr as ESTADO from libdebito.drconbep
where substr(lidtra,1,4) in
('T011','T026','T070','T278','T370','T403','T408','T420','T461','T462','T001','T415','T423','T424','T441','T405','T410')
and lfectr='20221206'
order by lhortr desc;
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*********************************************************************** R.Diario--***********************************************************************
------------------------------------------------Monitoreo Adquirencia Mastercard
select cast(TO_DATE(cast(lfectr as varchar(8)),'YYYYMMDD')as date) AS FECHA , lcodbc AS MARCA,lenemi EMISOR, COUNT(*) CANTIDAD,substr(lidtra,1,1) Origen,lesttr AS ESTADO, lcretr AS COD_RETORNO, coddes Descripcion_COD,CAST(SUM(limpgs)AS bigint) importe
from libdebito.drconbep
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join libdebito.tbcret0p on lcretr = codnro
where lfectr='20221206' and   lcodbc = 'MST' and codmar='MSTC'
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
where lfectr='20221206' and   lcodbc = 'VSA' and codmar='VISA'
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
where lfectr='20221206'
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
where lfectr='20221206' and   lcodbc = 'MST' and codmar='MSTC'
and lenemi in ('510') ---and lnfisc='422745'
GROUP BY Lfectr, lcretr, lcodbc,LENEMI,coddes, lesttr,substr(lidtra,1,1)
order by substr(lidtra,1,1) desc , lcretr asc, cantidad desc;
------------------------------------------------------------------------------------------------------------------------------------------
--Visa Adquiriente  Procard--########################################################################################
select cast(TO_DATE(cast(lfectr as varchar(8)),'YYYYMMDD')as date) AS FECHA , lcodbc AS MARCA,lenemi EMISOR, COUNT(*) CANTIDAD,lesttr AS ESTADO, lcretr AS COD_RETORNO, coddes Descripcion_COD,CAST(SUM(limpgs)AS bigint) as Importe
from libdebito.drconbep
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join libdebito.tbcret0p on lcretr = codnro
where lfectr='20221206' and lcodbc='VSA' and codmar='VISA'
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
where lfectr='20221206' and codmar='BEPS'--and   lcodbc = 'DIN' and
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
where lfectr='20221206' and codmar='BEPS' and lcodbc = 'DIN'
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
WHERE  lfectr= '20221206'
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
where lfectr='20221206' --and   lcodbc = 'MST' and codmar='MSTC'
and lenemi in ('530','560','570','590')
and substr(lidtra,1,1)='P'
--and lcretr in '91'
--and lhortr between '080300' and '104700'
GROUP BY Lfectr, lcretr, lcodbc,LENEMI,lcomtr
ORDER BY cantidad desc, lcretr asc;
------------------------------------------------------------------------------------------------------------------------------------------
--verificar trx por Comercio--POR JPOS
select lfectr AS FECHA , lhortr AS HORA,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS TARJETA, /*PARA ENCRIPTAR TARJETAS*/--
lidcom AS CODIGO, lcomtr  AS COMERCIO,leca62 Version_Pos,lactfj Activo, limpgs AS MONTO, lcretr AS RETORNO, lesttr AS ESTADO from libdebito.drconbep
where lfectr between '20221206' and '20221206' and substr(lidtra,1,1)='P' and lidcom='0701264' -- and lenemi in ('530','560','570','590')  --AND lcomtr like ('%CITYM%')--FORTIS MAYORISTA SUC MARIANO  ---
order by lhortr desc;
------------------------------------------------------------------------------------------------------------------------------------------
SELECT lfectr FECHA,lhortr HORA,/*SUBSTR(lnrtar,1,6) || 'XXXXXX' ||SUBSTR(lnrtar,13,4) TARJE*/lnrtar tarje,lexpir VTO,lbinpr bin,
lbcodb,LENEMI ENTIDAD, lcored ,LCODBC MARCA,/*,pdescricion MARCA*/lcodtr as codigo_Trx,
lesttr ESTADO,lcretr COD_RETORNO,lcodtr COD_TRX,limpgs IMPORTE,lcotel celular,--coddes DESCRIP_RET,--lbinpr BIN,--
lerrnb REFE_BEPSA, lidcom COD_COMER,lcomtr LOCAL_COMER, /*txdtrx DESC_TRX,*/LECA62 version_pos,lactfj cod_act,lcautr cod_aut--LNFISC,LPOSEM,LMCCTR,LNFACT--,lntoke--, enemiso BANCO,tgdesc DESCRIPCION
from libdebito.drconbep --inner join libdebito.tbinproc on lbinpr=pbin
WHERE lfectr BETWEEN '20221206' AND '20221206' --and lcretr in ('06')
and substr(leca62,9,10) like ('%J%')
--and lhortr>120000
and lcodtr='014000' and LECA62='SPT1000_vJ3'
--and lidcom not in ('302179','6000392')
order by lhortr desc;
------------------------------------------------------------------------------------------------------------------------------------------
--RECHAZO POR BINES
select lfectr AS FECHA , lcodbc AS MARCA,lenemi EMISOR,LBINPR BIN,ENNOMBR entidad, COUNT(*) CANTIDAD,lesttr AS ESTADO,
lcretr AS COD_RETORNO, coddes Descripcion_COD,CAST(SUM(limpgs)AS bigint) as Importe
from libdebito.drconbep
right join libdebito.tbcret0p on lcretr = codnro
INNER JOIN gxbdbps.gentiaf ON (ENEMISO=LENemi)
where lfectr between '20221206' and '20221206' and codmar='BEPS'--and   lcodbc = 'DIN' and
--and LBINPR in ('703002','703020','703040')--
and lcretr in ('55','00')--and lhortr between '080300' and '104700'
GROUP BY Lfectr, lcretr,LBINPR, lcodbc,LENEMI,ennombr,coddes, lesttr
order by LENEMI ASC,cantidad desc;
------------------------------------------------------------------------------------------------------------------------------------------
--RECHAZO POR BINES
select lfectr FECHA,lhortr HORA,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,limpgs MONTO,lesttr ESTADO,lcretr RETORNO,coddes Descripcion_COD,lbinpr Bin, pdescricion descrip_tarje,
LCODBC MARCA,LENEMI COD_ENTIDAD,LHISDE EMISOR,LORITR DISPOSITIVO, LNFACT PAIS,lactfj,lerrnb as Referencia ,lcautr as autorizacion,leca62 POSATM
from libdebito.drconbep
inner join libdebito.tbinproc on pbin=lbinpr
right join libdebito.tbcret0p on lcretr = codnro
INNER JOIN gxbdbps.gentiaf ON (ENEMISO=LENemi)
where lfectr = '20221206'  and codmar='BEPS' --and lhortr < '230000'
--and LBINPR in ('703002','703020','703040')--
and lcretr in ('55','00') order by lhortr;
------------------------------------------------------------------------------------------------------------------------------------------
--***********----RECHAZO APARTADO POR BINES MASTERCARD MASTERCARD MASTERCARD MASTERCARD
select COUNT(*) CANTIDAD,lbinpr AS BIN ,d.pdescricion descrip_marca, lcodbc AS MARCA, lcretr AS CODIGO, coddes Descripcion_DEL_CODIGO
from libdebito.drconbep
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join libdebito.tbcret0p on lcretr = codnro
inner join mastercard.mastrndta b on lerrnb=MCRRNBEPSA inner join LIBDEBITO.TBCTRA0P c on c.TXCTRX = lcodtr
inner join libdebito.tbinproc d on lbinpr=pbin
where lfectr='20221206' and lcodbc = 'MST' and codmar='MSTC' and lbinpr LIKE ('546297%')
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
WHERE lfectr BETWEEN '20230218' AND '20230218'
--and lerrnb in ('215264221997') --referencia
and substr(lidtra,1,1) in ('P') --P pos o T atm
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
order by lhortr desc;
------------------------------------------------------------------------------------------------------------------------------------------
--este es el uso generalmente para ver las transacciones jpts
------------------------------------------------------------------------------------------------------------------------------------------
select lfectr fecha_real,lhortr HORA,lnrtar,--SUBSTR(lnrtar,1,6) || 'XXXXXX' ||SUBSTR(lnrtar,13,4) TARJE,
lenemi emisor,lbinpr bin,lposem,lcotel celular,
lesttr ESTADO,lcretr COD_RET,lcodtr COD_TRX,limpgs IMPORTE,lsaltr,--coddes DESCRIP_RET,--lbinpr BIN,--
lerrnb REFE_BEPSA, lidcom COD_COMER,lcomtr LOCAL_COMER,LECA62 ATM_POS,lactfj cod_act,lcautr cod_aut,lnfisc adq,ldistr,lnfisc,lidtra
FROM libdebito.drconbep
WHERE lfectr BETWEEN '20221206' AND '20221206'
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
order by lhortr desc;
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
 order by lhortr desc;
------------------------------------------------------------------------------------------------------------------------------------------
-- CABAL / PANAL
------------------------------------------------------------------------------------------------------------------------------------------
select LIDCOM as COD_COMERCIO, LFECTR as FECHA_REAL, LFCOTR as FECHA_COMERCIAL, LHORTR as HORA, LNRTAR AS TARJETA, LBINPR AS BIN, LIMPGS as MONTO,
LIDTRA, LCOMTR as COMERCIO, LORITR, LCODTR as CODIGO_TRX, LCODBC, LCAUTR as COD_AUTORIZ, LCRETR as COD_RESP, LESTTR as RESPUESTA, LERRNB, LECA62
from libdebito.drconbep where lfectr='20220706' and lhortr>='190000'
AND LENEMI IN ('512' , '508')
order by lhortr desc;
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
order by LENEMI ASC,cantidad desc;
---------------------------------------------venta minutos----------------------------------------------------------------------
select lfectr, lhortr, lnrtar, lexpir, lcodbc, lidcom, lcomtr, limpgs, lcretr, lesttr, LCODTR, TXDTRX,  SUBSTR(LIDTRA,1,1) DISPOSITIVO, LCOTEL TELEFONO, LCORED LINEA
from libdebito.drconbep
inner join libdebito.tbctra0p on lcodtr = TXCTRX
where lfectr='20220425'
and lcretr='00' and lcodtr in ('901020', '514000') order by lhortr desc ;
-------------------------------------------------------------------------------------------------------------------
-----pasos de incoming
SELECT *FROM GXBDBPS.NUT999 where dbgusrid = 'U99RODRI' AND DBGCLA LIKE '2022089%';

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
and movpgon = 'B' and movruc = '80016096-7' AND SERCODI = 'REDPAG';
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
      AND LIMPGS > 0 AND LENEMI = '510' AND lbinpr='456976';
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------bnf
SELECT LNRTAR, limpgs, LERRNB, LFECTR, LHORTR, lcretr, LCOMTR, LIDCOM, vimti, VIF044RCOD, VIF044RMSG
FROM LIBDEBITO.DRCONBEP
INNER JOIN VISA.VISTRNDTA v ON
LERRNB = VIRRNBEPSA
WHERE LFECTR BETWEEN 20220923 AND 20220924
      AND LCRETR = '76' AND VIF044RCOD= '9076' AND LESTTR = 'A'
      AND LIMPGS > 0 AND LENEMI = '510' AND lbinpr='488234';
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------log para ver si reverso o no. si tiene mas de 2 es reversado = 1100000 en la ultima linea
select * from gxbdbps.lgcoment where LGMSG like'%320005296130%';
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
------------------------------
SELECT m.MCROL , m.MCMTI, m.MCFLD037  LHISOR , LHORTR , LNRTAR , LCODTR , LERRNB , LIDTRA , LIDCOM , LMCCTR , LCOMTR , LIMPGS,
LCRETR , LESTTR, m.MCF044RCOD  , trim(m.MCF044RMSG), m.MCMIPCONN  FROM LIBDEBITO.DRCONBEP
INNER JOIN MASTERCARD.MASTRNDTA m  ON m.MCRRNBEPSA  = LERRNB
--INNER JOIN MASTERCARD.MASCTLDTA m2 ON m.MCFLD037 = m2.MCFLD037
WHERE LFECTR = 20221008 AND LCODBC = 'MST'
AND m.MCROL  = 'ADQ' -- ISS --EMISOR
--AND LERRNB = '228004013512'
ORDER BY LHORTR DESC LIMIT 100;
--------------------------------------------------
---VER COMPO063 select pedrozo
SELECT mc002, mc037, mc063, MCFECREAL, MCHORAREAL FROM mastercard.mastrndta a inner join
mastercard.masctldta b on a.MCRRNBEPSA = b.MCRRNBEPSA
WHERE MC039 = '91' AND a.MCFECREAL = 20221102;
-------------------------------------------------------
-- TARJETAS MASTERCARD ADQ CODIGO DE PROCESO LENEMI 530
select b.mcmti estado_mc,MCMIPCONN,MCMSGTYPE, b.mcf044rmsg mensaje,lfectr fecha,lhortr hora,ptiptar TIP_TAR,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4)AS Tarjeta,
lcautr as autori,LHISDE RESPONDE,limpgs As importe,lcretr retorno,lesttr ESTAD,b.mcrol rol,lbinpr bin,d.pdescricion descrip_marca,lcodbc MARCA,lenemi entidad,
c.txdtrx descrip_trx,substr(leca62,1,4) atm,substr(lerrnb,2,13) refencia,lcodtr cod_trx,lidcom cod_atm from libdebito.drconbep inner join mastercard.mastrndta b on lerrnb=MCRRNBEPSA
inner join LIBDEBITO.TBCTRA0P c on c.TXCTRX = lcodtr inner join libdebito.tbinproc d on lbinpr=pbin --and lcretr in ('55')-- and lnrtar like '516400%'
--and lnrtar like '230671%' --and lbinpr in ('542116','601638') and lcodtr IN ('000054','011000','012000')
where lfectr between '20221102' and '20221102' and lenemi in ('530','560','590','570')and lhortr>143000-- and mcrol = 'ADQ'
--and lcretr in ('91')
order by lhortr desc;
--------------------------------------------------------
--Log de Mastercard Trazabilidad
SELECT * FROM mastercard.TAUTRZ t WHERE date(LOGFECHA) = '2022-10-30' AND time(LOGFECHA) > '21:00:00';
------------------------------------------------------------------------------------------------------------------------
---prepgas
select lfectr fecha_REAL,lfcotr fecha_comer,lhortr hora,lidcom cod_comer,lcomtr comercio,lnrtar tarjeta--SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS TARJETA
, lbinpr BIN
,limpgs monto,lesttr estado,lcretr retorno
,LCODBC marca,lbinpr bin,LORITR dispositivo,lenemi, lerrnb Num_Fef,ennombr ENTIDAD, LCOTEL NUMERO, lcodtr
from libdebito.drconbep
right join gxbdbps.gentiaf ON (ENEMISO=LENemi)
where lfectr = '20221217'
--and lcretr in ('91')
and lnrtar like '627431%'
and lcodbc ='DEB'
AND LORITR='A'
--AND LENEMI='164'
order by lhortr desc;
------------------------------------------------------------------------------------------------------------------------
select --*
lfectr fecha,substr((lhortr + 10000000), 3, 2) Hora, count(*) Cant, sum(limpgs) Importe,substr(lidtra, 1, 1) Origen --por hora por y atm
from libdebito.drconbep
where lfectr between '20241113' and '20241113'
--LFCOTR = '20221005' AND LIDCOM <> 100001 AND   LESTTR = 'A' AND   LCRETR = '00' --para contar trx pos y atm
and substr(lidtra, 1, 1) in ('T','P')
group by lfectr,substr((lhortr + 10000000), 3, 2) ,substr(lidtra, 1, 1), lfectr
order by substr((lhortr + 10000000), 3, 2) desc;
------------------------------------------------------------------------------------------------------------------------
---german
/*VERSUS DE TRX APROBADAS Y RECHAZADAS POR BIN Y DISPOSITIVO (BY= German Valentino)*/
select t1.*,t2.*,CAST(CAST(t2.cant AS float)/t1.cant AS decimal(10,2)) AS ratio
FROM (
select lfectr fecha,substr((lhortr + 10000000),3,3) Hora, LBINPR ,count(*) Cant, sum(limpgs) Importe,substr(lidtra,1,1) Origen
from libdebito.drconbep where lfectr between '20230217' and '20230217'
--and lcodtr in ('000052','567102')
--and lbinpr='703002'
and substr(lidtra,1,1) in ('T','P')
AND LESTTR ='A'
AND LCRETR ='00'
group by lfectr,substr((lhortr + 10000000),3,3) ,substr(lidtra,1,1), lfectr,LBINPR
--order by substr((lhortr + 10000000),3,2) DESC
) AS t1
LEFT JOIN (
select lfectr fecha,substr((lhortr + 10000000),3,3) Hora, LBINPR ,count(*) Cant, sum(limpgs) Importe,substr(lidtra,1,1) Origen
from libdebito.drconbep where lfectr between '20230217' and '20230217'
--and lcodtr in ('000052','567102')
--and lbinpr='703002'
and substr(lidtra,1,1) in ('T','P')
AND (LESTTR <>'A'
or (LCRETR <>'00' and LCRETR<>'51'))
group by lfectr,substr((lhortr + 10000000),3,3) ,substr(lidtra,1,1), lfectr,LBINPR
--order by substr((lhortr + 10000000),3,2) DESC
) AS t2 ON t2.fecha=t1.fecha AND t1.hora=t2.hora AND t1.lbinpr=t2.lbinpr
WHERE t1.LBINPR IN ('456976','488234','230671','530399','514848','542927','547697','546297','230729')
order by 2 desc
WITH UR;
-----------------------------------------------------------------ofuscdos en el drconbep
SELECT LBINPR, LIMPGS, LFECTR, LACTFJ, d.* FROM LIBDEBITO.DRCONBEP D WHERE LERRNB='303648260563';
SELECT * from LIBDEBITO.logpos0p WHERE ENV512 LIKE '%308865648665%';
---buscar tarjetas ofuscadas        --004=IMPORTE/002=BIN O TARJETA.00"con_decimales"/013=fecha--mmdd/041=codigopos-activo
SELECT * FROM LIBDEBITO.log2078t WHERE LOG2078 like '%0026274310001055897%' and log2078 like '%004000007575800%' and log2078 like '%0130205%' and log2078 like '%04119898784%';
-----------------------------------------------------------------
--tabla paises
select * from gxbdbps.NUT012;
-----------------------------------------------------------------
--tabla monedas
select * from gxbdbps.NUT013;
-----------------------------------------------------------------
----------upd para campos nulos
UPDATE LIBDEBITO.DRCONBEP
seT LPROPI = 0, LPAGOP = 0, LCAMPO04 = 0,LCAMPO49 = 0, LCAMPO05 = 0, LCAMPO50 = 0,LCOMPO06 = 0, LCAMPO51=0, LCAMPO03 = 0,
LCAMPO22 = 0,LCAMPO19 = 0, LPUNTGEN = 0,LCODPROM=0, LIDBEPSA = 0
WHERE lfcotr = '20230321';
-----------------------------------------------------------------
/*COMERCIO CON GOURMET*/
SELECT c.COCOMER AS Comercio, c.CODENO AS Descripcion, t.TRAEST AS Estado, c.CODIRE1 AS Direccion, l.lodesc AS Localidad
 FROM GXBDBPS.TAFITRA t
 JOIN GXBDBPS.COMAEAF C ON t.COCOMER = c.COCOMER
 JOIN gxbdbps.COLOCAF l ON l.LOCODI = c.LOCODI
WHERE t.PARENE = 155 AND t.PARAFINI = '001' AND t.PARBIN = '627431' AND c.CODENO LIKE '%PUNTO%';
--ACTIVO FIJO
SELECT LFECTR fecha, LHORTR hora, LBINPR bin, LACTFJ ACTIVO, lcretr retorno, aftidesc, lhisde comercio , C.*
from libdebito.drconbep a
inner JOIN GXBDBPS.COAFMAF b ON (AFCODI=LACTFJ)
RIGHT JOIN  gxbdbps.coaftaf c ON (B.AFTICODI=C.AFTICODI)
--WHERE LFECTR='20231006'
AND LACTFJ='14049984';
-----------------------------------
SELECT * FROM LIBDEBITO.LOG1002
WHERE ENRRNB IN (SELECT LERRNB FROM LIBDEBITO.DRCONBEP a
	WHERE a.LBINPR like'%703002%'
	AND a.LFECTR = 20231012
	AND a.LHORTR >=043400 AND a.LERRNB='328537365454')
	--AND a.LHORTR <=194200)
ORDER BY ENRRNB;
------------------
values DAYOFYEAR(CURRENT_DATE);--PARA VER LA FECHA JULIANA DEL DIA;
-------------------------
--cargar codigo de trx
call tbmrg606
-------------------------------------
-------------------------% de trx por hora
SELECT cod,case  WHEN x.CRETDDESC IS NULL
THEN CONCAT('FECHA OPERACION : ----> ',VARCHAR_FORMAT(DATE(NOW()), 'DD-MM-YYYY'))  ELSE x.CRETDDESC END AS DESCRIP ,  CANTIDAD,
CASE WHEN x.CRETDDESC IS NULL THEN '100%' ELSE PORC END AS Porcen  FROM
(
SELECT V.COD, V.CANTIDAD, CONCAT(varchar_format(cast(
(cast(v.cantidad AS decimal(10, 3)) / cast(t.total AS decimal(10,3)) * 100)
AS Decimal(5, 3)), '990.99'), ' %')
AS PORC FROM
(
SELECT IFNULL(X.COD, 'TOTAL') AS COD,
SUM(X.CANTIDAD) AS CANTIDAD
FROM
(
SELECT d.LCRETR AS COD, count(*) AS CANTIDAD
FROM LIBDEBITO.DRCONBEP D
WHERE D.LFECTR = VARCHAR_FORMAT(DATE(NOW()), 'YYYYMMDD')
-- WHERE D.LFECTR ='20240222'
AND D.LNRTAR LIKE '703002%'
AND d.LERRNB IN (SELECT l.ENRRNB FROM LIBDEBITO.LOG1002 l GROUP BY l.ENRRNB  )
GROUP BY d.LCRETR
) X GROUP BY ROLLUP (X.COD)
) V
CROSS JOIN
(SELECT count(*) AS TOTAL
FROM LIBDEBITO.DRCONBEP D
WHERE D.LFECTR = VARCHAR_FORMAT(DATE(NOW()), 'YYYYMMDD')
-- WHERE D.LFECTR ='20240222'
AND D.LNRTAR LIKE '703002%'
AND d.LERRNB IN (SELECT l.ENRRNB FROM LIBDEBITO.LOG1002 l GROUP BY l.ENRRNB  )
) T
) left JOIN GXBDBPS.ATMCCRET x
  ON COD = x.CRETH
  ORDER BY porcen desc;
------
---VERIFICA TRX DE DRCONBEP QUE NO CARGO A TSWAUT
SELECT  COUNT(*) --D.LERRNB ,d.*, t.AUTRRNBEP
FROM LIBDEBITO.DRCONBEP d LEFT JOIN GXBDBPS.TSWAUT t ON d.LERRNB = t.AUTRRNBEP
WHERE LFECTR = 20250202 AND LERRNB LIKE '5033%' AND d.LROL != 'ISS' --AND D.LHORTR < 151500
AND T.AUTRRNBEP IS NULL;

---Verificación de Trx con retorno 61 en adelantos en ATM
SELECT * FROM GXBDBPS.TMTARAF WHERE MTNUMTA = '4224102252107681';
--PASO 2:VERIFICAR CUENTA, CUANTO YA EXTRAJO Y SU LÍMITE
SELECT MCLIMCO , MCADTCO, MCADTCU, MCADEPE , MCDISCO , MCDISCU, t.* FROM GXBDBPS.TMCTAAF t WHERE MCNUMCT = 20300522821;
--PASO 3:VERIFICAR POR AFINIDAD, ENTIDAD Y BIN DE LA TC--CUANTO ES SU MONTO MÍNIMO Y SU MÁXIMO % ADELANTO
SELECT AFEXTMI MONTO_MIN_ADEL,AFPORAD PORCENTAJE_ADEL,ENEMISO ENTIDAD,BIBINES BIN ,AFAFINI||' '||AFDESCR AFINIDAD,t.*FROM GXBDBPS.TAFINAF t
WHERE ENEMISO IN ( '021') AND afafini = '037' AND BIBINES = '422410';
-------------------------------------------------------------------------
SELECT * FROM GXBDBPS.TMTARAF WHERE MTNUMTA = '6274310212442411';
--PASO 2:VERIFICAR CUENTA, CUANTO YA EXTRAJO Y SU LÍMITE
SELECT MCLIMCO,MCADTCO,MCADTCU,MCADEPE,MCDISCO,MCDISCU, t.* FROM GXBDBPS.TMCTAAF t WHERE MCNUMCT = 20110583098;
--PASO 3: VERIFICAR POR AFINIDAD, ENTIDAD Y BIN DE LA TC--CUANTO ES SU MONTO MÍNIMO Y SU MÁXIMO % ADELANTO
SELECT AFEXTMI MONTO_MIN_ADEL,AFPORAD PORCENTAJE_ADEL,ENEMISO ENTIDAD,BIBINES BIN,AFAFINI||' '||AFDESCR AFINIDAD, t.*FROM GXBDBPS.TAFINAF t
WHERE ENEMISO IN ( '021') AND afafini = '505' AND BIBINES = '627431';

-----TIGO CON TARJETA-----
select lfectr Fecha,lhortr Hora,lenemi Emisor
, SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS TARJETA,lidcom Cod_Comercio
,lcomtr Comercio,(limpgs) importe,lcretr Retorno
,lesttr Estado,substr(lidtra,1,1) Origen,lctade referencia_linea,lerrnb Cod_Ref
,A.TXDTRX DETALLES,lcotel numero,lcodtr Cod_Trx,lactfj Activo_Pos,lenemi,lctaor, lcodtr, codmar
from libdebito.drconbep
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join libdebito.tbcret0p on lcretr = codnro
where lfectr='20250217'
and lnrtar like '627431152%'--Tigo Card
--and lhortr > '150300'
--And lenemi='591'
--and lhortr>113000
--and lesttr= 'P'
--AND LCRETR in ('91','93')
--and lcretr= '91'
--and lesttr= 'A'
--and limpgs>1
AND loritr ='A'
and codmar = 'BEPS'
order by lhortr desc;
-----
--para ver cola de datos
SELECT DATA_QUEUE_LIBRARY, DATA_QUEUE_NAME , MAXIMUM_MESSAGE_LENGTH, CURRENT_MESSAGES
FROM QSYS2.DATA_QUEUE_INFO WHERE DATA_QUEUE_NAME LIKE '%ACFIREC%';

---bin 3ds
SELECT * FROM GXTRJDTA.TAB_3DS_BINES_URL_ENT;
-- SENTENCIAS PARA OCT DE VISA
SELECT * FROM GXBDBPS.AUPRCTD; --codgio operacion que viene de la marca
--relacion cod. operacion inforet con la marca
select * FROM GXBDBPS.AUPRCCDE; --todos los coigo de operación
--valores
SELECT * FROM GXBDBPS.AUTDTRANS A;
--
--verfiicación de transacciones cuotizadas para cybersource con MST
select
    a.c33id as ID,x.C33DAPR,x.C33FINA,x.C33DTPR , a.trdacco as Accion_Code, a.TRDPUDA FechaTrx ,a.TRDRRNBEP as RRN_BEP, a.trdtxid as Trx_ID, b.RADPUID as ID_Compra,
    a.trdrrn as MI_RRN, a.TRDMSID as MSG_ID, a.TRDSTS as Estado, b.RADPEM as Pos_Entry_Mode,
    b.RADPSCC as Pos_Cnd_Cod, a.trdacnu as PAN,    a.trdexda as Vence,    a.trdauda as Aut_MMAA,
    a.trdauam as Mto_Auto, a.trdacc as Moneda_Auto, a.trdtaa as Total_Auto, Cast(a.trdsoam as numeric(12)) as Mto_Source,
    a.trdscc as Moneda_Sour, b.radauco as Aut_CodAut, b.radcaid as Marca,
    b.radcai as Comercio, c.edamena as Nombre, c.edamcc as MCC, c.EDAMCOCD as Pais,
    v.ADAMIPF as aggregatorId, v.ADASMID as SubmerchanId, v.ADAISOID as SalesOrganizationID_MST
--    ,d.gddgti as DE63
,d.P1T5NOI as Cuotas
from cyberlib.cp01t0 a , cyberlib.cp01t1 b, cyberlib.cp01t4 c, cyberlib.tmtc33 x, --cyberlib.cp01t8 e
--  ,cyberlib.cp01t5 d --  cyberlib.cp01t7 d
cyberlib.cp01t6 v,
cyberlib.CP01T5 d
Where a.c33id = x.c33id and
a.c33id = b.c33id and b.c33id = c.c33id
and a.trdsec  = b.trdsec and b.trdsec = c.trdsec
and v.C33ID = a.c33id and v.TRDSEC = a.trdsec
AND d.C33ID = a.C33ID  AND d.TRDSEC = a.TRDSEC
--and RRN_BEP = '' --order by a.c33id desc;
--AND A.c33id >= 43--(6,7,8,9,10,11,12,13,14,15,16,17,18,19,20)
--and TRX_ID = '304183666253674'
--and TRDRRN in ('505815194883')
--AND  TRDRRNBEP in ('435522705850')
--and RADPUID = '7309180099256329103979'
--and RADREID in ('7309180099256329103979')
--and C33FINA = '2024268_04.txt'
--AND trdauam = '000000000150'
--and trdacnu like '%5303990001025654%'
--AND SUBSTRING(TRDACNU, 1, 6) = '542927' AND SUBSTRING(TRDACNU, 13, 4) = '8839'
--and radauco = '436324'
--and DSUTRI= '50183038325'
--AND TRDACNU = '5303990001025654'
--and TRDSTS = 'C'
AND b.RADCAID = 'MC'
AND a.TRDSTS = 'P'
--AND substring(a.TRDRRN ,1 , 1) = '4' AND substring(a.TRDRRNBEP , 1, 1) = '5'
--AND RIGHT(d.P1T5NOI, 2) > '01'
AND date(C33DTPR) >= '2025-04-29'
order by a.c33id desc;

--registros en cuotas
SELECT mc112, m.MC048 , m.MCROL ,   MCRRNBEPSA , MC037, MC038, MC039 , MC061 , MCREVDATT, MCREVFLG , MCREVCOD ,  m.*
FROM MASTERCARD.MASCTLDTA m WHERE MC037 IN ('511915967952', '511919327277', '511919129350', '511920885317');

--registros contados
SELECT mc112, m.MC048 , m.MCROL ,   MCRRNBEPSA , MC037, MC038, MC039 , MC061 , MCREVDATT, MCREVFLG , MCREVCOD ,  m.*
FROM MASTERCARD.MASCTLDTA m WHERE MC037 IN ('511918509529', '511918372452', '511918618194');

----PARA RUTEAR 703020 POR LEGACY tAREA #92138
--desactivar jpts con los secrests cambiando valores del jpts.config.properties
/*continental_atm_terminal_id_list
continental_pos_terminal_id_list ambos a NONE*/
--Para: POS Ejecutar script para cambiar la parametrización para que apunte al nuevo programa.
UPDATE libdebito.TBBINE0P SET QEPGM = 'MOVETRNDTA'
WHERE QEBIN1 = '703020';  --vALOR ACTUAL = CNXRPGCAUT

--Para ATM Ejecutar script para cambiar la parametrización para que apunte al nuevo programa.
UPDATE  atmcentre.TBBINE0P SET QEPGM = 'DEBAUTENTI'
WHERE QEBIN1 ='703020';  --vALOR ACTUAL = CNXRPGAUTA
--BK E EN SU MOMENTO
SELECT QEBIN1 ,QEPGM  FROM WRKADOLFO.ATMCENTRE_TBBINE0P
WHERE QEBIN1 = '703020';
SELECT QEBIN1 ,QEPGM  FROM WRKADOLFO.libdebito_TBBINE0P
WHERE QEBIN1 = '703020';
---LOG DEL MISMO
SELECT * FROM libdebito.lgdinelco L;

--Diferencias en transacciónes QR PIX PAYPY - QR EXPIRADO
--SQL para encontrar todas las transacciones de QR PIX que tuvieron un pago pero se reversó luego de que se haya procesado el pago al comercio.
SELECT T2.MOVRRNBEP, T2.MOVESTA, T.*
FROM JPTSAPI.TRANLOG T
         INNER JOIN GXFINDTA.TCLMOV T2 ON T.DS_RRN = T2.MOVRRNBEP
WHERE T.TRANSACTION_TOKEN IN (SELECT T2.TRANSACTION_TOKEN FROM JPTSAPI.TRANLOG T2 WHERE T2.TRANSACTION_TOKEN IN
(SELECT T1.TRANSACTION_TOKEN FROM JPTSAPI.TRANLOG T1 WHERE T1.SSPCODE = '540063' AND T1.ITC LIKE '200.%') AND T2.SS = 'SS-REST')
AND T.ITC LIKE '400.%' AND T2.MOVFPRO BETWEEN '20250516' AND '20250519' AND T2.MOVFTRX BETWEEN '20250516' AND '20250518';

--api push
CALL GXTRJPGM.SP_FIND_CARD_DETAILS('5182647','422410','9334','750025961');
--query del sp
SELECT * FROM (
SELECT TTC . TRJNROTRJ , TTC . TRJCODENT , TTC . TRJIDTPDOC ,
TTC . TRJNRODOC , TTC . CTAIDCTA , TTC . TRJNOMPLAS , TTC . TRJVALHAS
FROM GXTRJDTA . TTCTRJ TTC
WHERE TTC . TRJNRODOC = '5182647'
AND SUBSTR ( TTC . TRJNROTRJ , 1 , 6 ) = '422410'
AND SUBSTR ( TTC . TRJNROTRJ , 13 , 4 ) = '9334'
AND TTC . CTAIDCTA = '750025961'
AND TTC . TRJNROTRJ NOT LIKE '%X%'
UNION ALL
SELECT TTC . EMINROTRJD AS TRJNROTRJ , TTC . CDBCODENT AS TRJCODENT ,
AD . TDOIDTPDOC AS TRJIDTPDOC , AD . PERNRODOC AS TRJNRODOC ,
TTC . CDBIDCTA AS CTAIDCTA , AD . CADNOMPLAS AS TRJNOMPLAS ,
TTC . EMIVENCEMB AS TRJVALHAS
FROM GXTRJDTA . TTDEMI TTC
JOIN GXTRJDTA . TTDCAD AD ON TTC . CDBIDCTA = AD . CDBIDCTA
WHERE AD . PERNRODOC = '5182647'
AND SUBSTR ( TTC . EMINROTRJD , 1 , 6 ) = '422410'
AND SUBSTR ( TTC . EMINROTRJD , 13 , 4 ) = '9334'
AND TTC . CDBIDCTA = '750025961'
AND TTC . EMINROTRJD NOT LIKE '%X%');