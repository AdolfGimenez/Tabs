----------------------TRX ATM---------------------------------
------------------------TRANSACCIONES ATM-CENTRE -------------------------------------------------------------------------
	select cast(TO_DATE(cast(lfectr as varchar(8)),'YYYYMMDD')as date) AS FECHA,lhortr as HORA,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS TARJETA,lcodbc AS TIPO,leca62 As ATM,lcomtr as NOMBRE_ATM,limpgs as MONTO,lcretr as RETORNO, lesttr as ESTADO,
	(CASE WHEN LPOSEM in ('9010','9020','910','920') THEN 'BANDA MAGNETICA'
WHEN LPOSEM = '0510' THEN 'CHIP'
WHEN LPOSEM = '0710' THEN 'CONTACLESS' else 'VACIO' END) Tipo_lectura
from libdebito.drconbep
	where leca62 = 'T539' --and 'T500'
  --between 'T001' and 'T500'
  --and lfectr='20210317'
	--('T011','T026','T070','T454','T370','T403','T408','T420','T461','T462','T001','T415','T423','T424','T441','T405','T410','T461', 'T210','T115')
	and lfectr between '20220822' and '20220822'
	--and lesttr='R'
	--and lcodbc IN 'Bi'
	--and lnrtar like '%3804'   --para buscar por tarjeta ultimos 4
	--and lnrtar like '6274%'
	--and lhortr between '195000' and  '211900'
	--and lcretr='06'
	--and lcretr <>'00'
	--and lcomtr='ATM SUC.BNF P.J.CABALLERO 4'
	order by lhortr desc
  --order by lidtra asc
---------------------------------------------------------------------


RESUMEN DIARIO


----------------BILLETERAS----------
select cast(TO_DATE(cast(lfectr as varchar(8)),'YYYYMMDD')as date) AS FECHA ,lcodtr COD_TRX,A.TXDTRX DETALLES,count(*) Cantidad ,lcretr Cod_Retorno,lesttr Estad,substr(lidtra,1,1) Origen,coddes Descripcion_COD ,CAST(SUM(limpgs)AS bigint) importe
from libdebito.drconbep
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join libdebito.tbcret0p on lcretr = codnro
WHERE  lfectr= '20220822'
and lcodtr in ('000052','567102', '000072')--and lhortr between '190800' and '193000'   and lcretr in ('96') --and lhortr<0000
and limpgs>1
and  codmar = 'BEPS'
group by lcretr,coddes,lesttr,lcodtr,TXDTRX,LFECTR,substr(lidtra,1,1),lfectr
order by lcodtr,cantidad desc;

 


-------VISA CONTINENTAL
select lenemi EMISOR,ennombr ENTIDAD, COUNT(*) CANTIDAD,substr(lidtra,1,1) Origen,lesttr AS ESTADO, lcretr AS COD_RETORNO, coddes Descripcion_COD,CAST(SUM(limpgs)AS bigint) importe
from libdebito.drconbep 
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join libdebito.tbcret0p on lcretr = codnro
right join gxbdbps.gentiaf ON (ENEMISO=LENemi)
where lfectr='20220822' and   lcodbc = 'VSA' and codmar='VISA'
and lenemi='540'
--and lcretr in '91'
--and lhortr between '080300' and '104700'
GROUP BY lcretr, lcodbc,LENEMI,coddes, lesttr,substr(lidtra,1,1),ennombr
order by substr(lidtra,1,1) desc, lcretr asc, cantidad desc;

 

 

--Monitoreo Adquirencia Mastercard
select cast(TO_DATE(cast(lfectr as varchar(8)),'YYYYMMDD')as date) AS FECHA  , lcodbc AS MARCA,lenemi EMISOR, COUNT(*) CANTIDAD,substr(lidtra,1,1) Origen,lesttr AS ESTADO, lcretr AS COD_RETORNO, coddes Descripcion_COD,CAST(SUM(limpgs)AS bigint) importe
from libdebito.drconbep
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join libdebito.tbcret0p on lcretr = codnro
where lfectr='20220822' and   lcodbc = 'MST' and codmar='MSTC'
and lenemi in ('530','560','570','590')
--and lcretr in '91'
--and lhortr between '080300' and '104700'
GROUP BY Lfectr, lcretr, lcodbc,LENEMI,coddes, lesttr,substr(lidtra,1,1)
order by substr(lidtra,1,1) desc, cantidad desc;

 

 

--Usar este es con las condiciones Visa de Emisor
select cast(TO_DATE(cast(lfectr as varchar(8)),'YYYYMMDD')as date) AS FECHA  , lcodbc AS MARCA,lenemi EMISOR,ennombr ENTIDAD, COUNT(*) CANTIDAD
,lesttr AS ESTADO, lcretr AS COD_RETORNO, coddes Descripcion_COD,CAST(SUM(limpgs)AS bigint) importe
from libdebito.drconbep
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join libdebito.tbcret0p on lcretr = codnro
right join gxbdbps.gentiaf ON (ENEMISO=LENemi) and   lcodbc = 'VSA' and codmar='VISA'
where lfectr='20220822'
and lcodbc='VSA' and  codmar = 'VISA'
and lenemi in ('015','020')
GROUP BY Lfectr, lcretr, lcodbc,LENEMI,coddes, lesttr,ennombr
order by lenemi desc , lcretr asc, cantidad desc;

 


--MST ADQUIRENCIA PROCARD
select cast(TO_DATE(cast(lfectr as varchar(8)),'YYYYMMDD')as date) AS FECHA , lcodbc AS MARCA,lenemi EMISOR, COUNT(*) CANTIDAD,substr(lidtra,1,1) Origen,lesttr AS ESTADO, lcretr AS COD_RETORNO, coddes Descripcion_COD,CAST(SUM(limpgs)AS bigint) as Importe
from libdebito.drconbep
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join libdebito.tbcret0p on lcretr = codnro
where lfectr='20220822' and   lcodbc = 'MST' and codmar='MSTC'
and lenemi in ('510') ---and lnfisc='422745'
GROUP BY Lfectr, lcretr, lcodbc,LENEMI,coddes, lesttr,substr(lidtra,1,1)
order by substr(lidtra,1,1) desc, cantidad desc;

 


--Visa Adquiriente  Procard--########################################################################################
select cast(TO_DATE(cast(lfectr as varchar(8)),'YYYYMMDD')as date) AS FECHA  , lcodbc AS MARCA,lenemi EMISOR, COUNT(*) CANTIDAD,lesttr AS ESTADO, lcretr AS COD_RETORNO, coddes Descripcion_COD,CAST(SUM(limpgs)AS bigint) as Importe
from libdebito.drconbep
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join libdebito.tbcret0p on lcretr = codnro
where lfectr='20220822' and lcodbc='VSA' and codmar='VISA'
and lenemi in ('510')
GROUP BY Lfectr, lcretr, lcodbc,LENEMI,coddes, lesttr
order by lcretr asc, cantidad;

 


--Dinelco Debito Cooperativas	
select cast(TO_DATE(cast(lfectr as varchar(8)),'YYYYMMDD')as date) AS FECHA,lenemi EMISOR,ennombr ENTIDAD, COUNT(*) CANTIDAD,substr(lidtra,1,1) Origen,lesttr AS ESTADO, lcretr AS COD_RETORNO, coddes Descripcion_COD,CAST(SUM(limpgs)AS bigint) importe
from libdebito.drconbep 
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join libdebito.tbcret0p on lcretr = codnro
right join gxbdbps.gentiaf ON (ENEMISO=LENemi)
where lfectr='20220822' and codmar='BEPS' and lcodbc = 'DIN'
AND lenemi IN ('068','070','071','072','073','075','076','077','080','081','083','084','088','089','095','096','100','101','102','103','105','106','107','108','109','110',
'111','113','124','125','136','137','140','141','144','145','153','158','161','163','165','166','167','168','169','170','171','172','173','174','177','303',
'304','305','306','307','309','310','311','312','334','340','342','344')
--and LBINPR in ('703002','703020','703040')--and lcretr in '91'--and lhortr between '080300' and '104700'
GROUP BY Lfectr, lcretr, lcodbc,LENEMI,ennombr,coddes, lesttr,substr(lidtra,1,1)
order by LENEMI ASC,cantidad desc;

 


---RESUMEN TARJETAS DINELCO 703002-703020-703040#############################################################################################################################################################--
select cast(TO_DATE(cast(lfectr as varchar(8)),'YYYYMMDD')as date) AS FECHA , lcodbc AS MARCA,lenemi EMISOR,LBINPR BIN,ENNOMBR entidad, COUNT(*) CANTIDAD,lesttr AS ESTADO,
lcretr AS COD_RETORNO,substr(lidtra,1,1), coddes Descripcion_COD,CAST(SUM(limpgs)AS bigint) as Importe
from libdebito.drconbep
right join libdebito.tbcret0p on lcretr = codnro
INNER JOIN gxbdbps.gentiaf ON (ENEMISO=LENemi)
where lfectr='20220822' and codmar='BEPS'--and   lcodbc = 'DIN' and
and LBINPR in ('703002','703020','703040')--and lhortr between '000000' and '173000'
GROUP BY Lfectr, lcretr,LBINPR, lcodbc,LENEMI,ennombr,coddes, lesttr,substr(lidtra,1,1)
order by LENEMI ASC,cantidad desc;
------------------------------------------------------------------------

BILLETERA


--verificar personal--
select cast(TO_DATE(cast(lfectr as varchar(8)),'YYYYMMDD')as date) AS FECHA,lhortr HORA,lerrnb,lidcom,lcomtr, lcotel,lctade,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,limpgs,lesttr,leca62,lenemi,lcretr from libdebito.drconbep
where lfectr between '20220822' and '20220822' --and lnrtar like '627431571%' 
and lcodtr in '567102'
--and lctade like '%0972129027%'
--and lidcom like '%702506'
--and limpgs like '155900.00'
--and lhortr between '121000' and  '130000'
--and lctade = '0000000982161176'
--and lcotel = '0971655386'
--and lnrtar like '%3895'
--and lctaor like '%971611158' 
--and lhortr between '040600' and  '113000'
--and lcretr = '19'
--and leca62 like 'T388'
--and lidtra like '%T%'
order by lhortr desc;

---------------------TIGO----------------------------------


------------370 carga , 380 retiro, 390 giro----------------
select cast(TO_DATE(cast(lfectr as varchar(8)),'YYYYMMDD')as date) AS FECHA,lhortr,lerrnb,lidcom,lcomtr,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,limpgs,lesttr,lcretr, lcodtr codtrx,lcotel AS NUMERO from libdebito.drconbep
where lfectr between '20220822' and '20220822' and lcodtr in  ('380000','370000','390000') 
--and lcodtr in '380000' 
--and lcomtr <> 'BIGGIE EXPRESS%'
--and lidcom in 1000416
--and lcretr in ('61') 
--and lcotel like '%985285340'
--and lhortr between '145000' and  '145900'
--and lcotel <> '               '
order by lhortr desc ; 


--verificar trx tigo handlerWS-- SIN TARJETA
select cast(TO_DATE(cast(lfectr as varchar(8)),'YYYYMMDD')as date) AS FECHA,lhortr,lerrnb,lidcom,lcomtr,lcotel,lnrtar,limpgs,lesttr,lcretr from libdebito.drconbep
where lfectr between '20220822' and '20220822' and lnrtar like '627431581%' --and lcretr in ('96','91','XD','92','94', '60')
--and lctade = '0000000984250875'
--and lcotel = '09827164974'
--and lidcom like '%1001764'
--and lctade like '%09827164974'
--and lctade like '%338976244' --num referencia
--and lhortr between '145000' and  '145900'
order by lhortr desc ;

--verificar tigo companion-- CON TARJETA
select cast(TO_DATE(cast(lfectr as varchar(8)),'YYYYMMDD')as date) AS FECHA,lhortr,lerrnb,lidcom,lcotel,lcomtr,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,limpgs,lesttr,lcretr from libdebito.drconbep
where lfectr between '202208221' and '20220822' and lnrtar like '627431152%' --and lcretr in ('96','91','XD','92','94', '60')

--and lhortr between '145000' and  '145900'
order by lhortr desc ;


--------------------CLARO---------------------------
--Billeteras Claro
select distinct cast(TO_DATE(cast(lfectr as varchar(8)),'YYYYMMDD')as date) AS FECHA,lerrnb AS REFERENCIA,lhortr AS HORA,lidcom AS CODIGO,lcomtr AS COMERCIO,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,leca62 AS VERSION,limpgs AS MONTO,lesttr AS ESTADO,lcretr AS RETORNO,lcotel AS LINEA_CEL, lenemi
from libdebito.drconbep
where lfectr between '20220822' and '20220822' and lnrtar like '627431591%' --and lidcom='0701608' --and lidcom='0701689' --lhortr between '080700' and '090200'   --and lcretr in ('91','96','19','93','00')--AND substr(lidtra,1,1) = 'T'--and lidcom='0701975' --and lcretr in ('91','96','01','93','00')
--and lctade like '%0985569484%'--0701689--and lcotel='0985569484'
order by lhortr desc
----------------------------------------------------------------------------

POS



----ver trx por hora ATM--
select  lfectr AS FECHA,substr((lhortr + 10000000),3,2) Hora, count(*) Cant,SUBSTR(LIDTRA,1,1) DISPOSITIVO, sum(limpgs) Importe
from libdebito.drconbep where lfectr between '20220822' and '20220822'
and substr(lidtra,1,1) = 'T'
group by lfectr,substr((lhortr + 10000000),3,2),SUBSTR(LIDTRA,1,1) order by substr((lhortr + 10000000),3,2) desc;
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----ver trx por hora Post--
select  lfectr AS FECHA,substr((lhortr + 10000000),3,2) Hora, count(*) Cant,SUBSTR(LIDTRA,1,1) DISPOSITIVO, sum(limpgs) Importe
from libdebito.drconbep where lfectr between '20220822' and '20220822'
and substr(lidtra,1,1) = 'P'
group by lfectr,substr((lhortr + 10000000),3,2),SUBSTR(LIDTRA,1,1) order by substr((lhortr + 10000000),3,2) desc
---------------------------------------------------------------------------------------------------
--********************************************************************************************
--* TRANSACCIONES EN ATM POR CODIGO DE RETORNO                                               *
--********************************************************************************************
select count(*) Cant,lesttr estado,lcretr retorno, sum(limpgs) Importe,substr(lidtra,1,1) Origen
from libdebito.drconbep where lfectr between '20220822' and '20220822'
--and lcodtr in ('000052','567102')
--and lbinpr='703002'
and substr(lidtra,1,1) in ('T')
group by substr(lidtra,1,1),lesttr,lcretr;
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--codigo_trx  014000  ADELANTO CN
--TRAE TODAS LAS TRX DE ATMS--TIEMPO REAL
select lfectr as FECHA,lhortr as HORA,lnrtar AS TARJETA,lcodbc AS MARCA,leca62 As ATM,lidcom as Codigo,lcomtr as NOMBRE_ATM,limpgs as MONTO,lcretr as RETORNO, lesttr as ESTADO,lcodtr as COD_TRX,--, LSALTR AS SALDO
(CASE WHEN LPOSEM in ('9010','9020','910','920') THEN 'BANDA MAGNETICA'
WHEN LPOSEM = '0510' THEN 'CHIP' else 'VACIO' END) Tipo_lectura
from libdebito.drconbep
where substr(lidtra,1,1) in ('P')  
and lfectr between '20220822' and '20220822'-- and LECA62='INGTETRA_J_2_20' and lcretr in ('55')
--and  lnrtar like '703020%' and lcodtr not in  ('011000','012000','013000','015000')    --and lcretr in ('99')--and limpgs='2000000'--and lcodtr='014000' --AND LPOSEM  IN ('0510') AND lcomtr like ('%BNF%')--
--and lidcom='8601304' --and lcretr in ('03')--and lidcom='8601094' --and lcodbc='VSA' --and lcretr in ('58')--and lhortr between '170000' and '183000' --
--and lcodtr='014000'--and limpgs='2000000'---and lhortr --between '060000' and '080000'-- --and limpgs='2000000'
--and lcodbc='MST'
order by lhortr desc;
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----nueva consulta sql JPOS POR COMERCIO -----
SELECT lfectr FECHA,lhortr HORA,/*SUBSTR(lnrtar,1,6) || 'XXXXXX' ||SUBSTR(lnrtar,13,4) TARJE*/lnrtar tarje,lexpir VTO,lbinpr bin,
lbcodb,LENEMI ENTIDAD, lcored ,LCODBC MARCA,/*,pdescricion MARCA*/lcodtr as codigo_Trx,
lesttr ESTADO,lcretr COD_RETORNO,lcodtr COD_TRX,limpgs IMPORTE,lcotel celular,--coddes DESCRIP_RET,--lbinpr BIN,--
lerrnb REFE_BEPSA, lidcom COD_COMER,lcomtr LOCAL_COMER, /*txdtrx DESC_TRX,*/LECA62 version_pos,lactfj cod_act,lcautr cod_aut--LNFISC,LPOSEM,LMCCTR,LNFACT--,lntoke--, enemiso BANCO,tgdesc DESCRIPCION
from libdebito.drconbep --inner join libdebito.tbinproc on lbinpr=pbin
WHERE lfectr BETWEEN '20220822' AND '20220822' --and lcretr in ('06')
and substr(leca62,9,10) like ('%J%')
--and lhortr>120000
and lcodtr='014000' and LECA62='SPT1000_vJ3'
--and lidcom not in ('302179','6000392')
order by lhortr desc;
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--verificar trx por Comercio--
select lfectr AS FECHA , lhortr AS HORA,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS TARJETA, /*PARA ENCRIPTAR TARJETAS*/--
lidcom AS CODIGO, lcomtr  AS COMERCIO,leca62 Version_Pos,lactfj Activo, limpgs AS MONTO, lcretr AS RETORNO, lesttr AS ESTADO from libdebito.drconbep
where lfectr between '20220822' and '20220822' AND lcomtr like ('%BIGGIE%') and lenemi in ('530')
order by lhortr desc;
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--verificar trx por CODIGO DE ACTIVO --
select lfectr AS FECHA , lhortr AS HORA,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS TARJETA, /*PARA ENCRIPTAR TARJETAS*/--
lidcom AS CODIGO, lcomtr  AS COMERCIO,leca62 Version_Pos,lactfj Activo, limpgs AS MONTO, lcretr AS RETORNO, lesttr AS ESTADO from libdebito.drconbep
where lfectr between '20210225' and '20210225' AND lactfj='13711023' 
order by lfectr desc  
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------Ingenico----
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr, lcotel
,LCODBC,LENEMI,LHISDE,LECA62,LORITR,lnrtar,leca62 from libdebito.drconbep
where lfectr between '20220822' and '20220822'
and substr(leca62,1,1)='I'
order by lhortr desc; 
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--                  TRANSACCIONES DE POS JPOS                                          
SELECT lfectr FECHA,lhortr HORA,/*SUBSTR(lnrtar,1,6) || 'XXXXXX' ||SUBSTR(lnrtar,13,4) TARJE*/lnrtar tarje,lexpir VTO,lbinpr bin,lctaor,lctade
lbcodb,LENEMI ENTIDAD, lcored ,LCODBC MARCA,/*,pdescricion MARCA*/
lesttr ESTADO,lcretr COD_RETORNO,lcodtr COD_TRX,limpgs IMPORTE,lcotel celular,--coddes DESCRIP_RET,--lbinpr BIN,--
lerrnb REFE_BEPSA, lidcom COD_COMER,lcomtr LOCAL_COMER, /*txdtrx DESC_TRX,*/LECA62 version_pos,lactfj cod_act,lcautr cod_aut--LNFISC,LPOSEM,LMCCTR,LNFACT--,lntoke--, enemiso BANCO,tgdesc DESCRIPCION
from libdebito.drconbep --inner join libdebito.tbinproc on lbinpr=pbin
WHERE lfectr BETWEEN '20220822' AND '20220822'
and substr(leca62,9,10) like ('%J%')
--and lhortr>120000
--and lhortr between '181500' and '182000'
and lcretr='91'
order by lhortr desc;




BNF
----------------------------------------------
--VER TRANSACCIONES VISA EMISOR BEPSA BNF  
select lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr  as Comercio,lnrtar as TARJETA,--,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,
lbinpr as Bin ,lenemi EMISOR, lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por,leca62 as Version,lerrnb as Referencia,LNFACT AS PAIS,-- LPOSEM AS ENTRADA  ,lbcocr 
CASE
  WHEN LPOSEM ='0710' THEN 'CONTACTLESS'
  WHEN LPOSEM ='0510' THEN 'CHIP'
  WHEN LPOSEM ='0910' THEN 'BANDA'
  WHEN LPOSEM ='0100' THEN 'ECOMMERCE'
  --WHEN LPOSEM ='051' THEN 'DESCONOCIDO1'
  ---WHEN LPOSEM ='510' THEN 'DESCONOCIDO2'
  END AS MODO_ENTRADA
from libdebito.drconbep where lfectr between '20220822' and '20220822' and lnrtar like '488234%' AND LPOSEM  IN ('0100','0510')--traer por Internet y Chip
order by lhortr desc;
---------------------------------------------------------------------------------------------------------------------------------------
--VER TRANSACCIONES VISA BEPSA-BNF
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr  as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,lbcocr ,leca62 AS VERSION,loritr as ATM_POS,lerrnb as Referencia 
from libdebito.drconbep where lfectr between '20220822 ' and '20220822' and lnrtar like '535902%' --and lcretr in ('05')  --and lenemi in ('530')--
--and lcretr in ('96')
--and lbinpr= '488234'
order by lhortr desc;
---------------------------------------------------------------------------------------------------------------------------------------
--DINELCO VISA BNF
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi as emisor,
lbinpr as Bin ,lcodbc as Marca ,limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por,leca62 AS VERSION,loritr as ATM_POS,lerrnb as Referencia 
from libdebito.drconbep
where lfectr between '20220822 ' and '20220822' and  lnrtar like '488234%'  
--and lhortr between '124800' and  '125700' 
order by lhortr desc;
---------------------------------------------------------------------------------------------------------------------------------------
--BANCARD BNF 443078
select lfectr, lhortr, lnrtar, lidcom, lcomtr, limpgs, lesttr, lcretr
from libdebito.drconbep 
where lfectr between '20220822' and '20220822 ' and lnrtar like '443078%' 
--and lcretr in ('96')
order by lhortr desc; 
---------------------------------------------------------------------------------
--DINELCO BNF 7030
select cast(TO_DATE(cast(lfectr as varchar(8)),'YYYYMMDD')as date) AS FECHA,lhortr,lerrnb,lidcom,lcomtr,lexpir,lnrtar,limpgs,lesttr, lcretr, SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta--, lenemi
from libdebito.drconbep
where lfectr between '20220822' and '20220822' and lnrtar like '703002%' --and lcretr in ('96','91','XD','92','94', '60')
--and lnrtar like '627431%'
--and lcretr <> '00'
--and lcretr in ('96','88','92')
--and substr(lidtra,1,1) = 'P' --EN POS
--and lidcom <> '6700014'--mensajes de acreditaciones
--and substr(lidtra,1,1) = 'P' --EN POS
--and lhortr between '091900' and  '231000'
--and lhortr>140000
--and lexpir='2007'
--and lnrtar like '%5005'
--and lidcom = '8099000' --cibersons
--and lnrtar like '4793%' --visa vision
--and lnrtar like '%9003'
--and lnrtar like '589434%'
and lcretr in ('91')
order by lhortr desc 





MST
-- TARJETAS MASTERCARD EMI
select lfectr fecha_real,lhortr hora,substr(lerrnb,2,13) referencia, lnrtar tarje,--b.mcpannmbr tarje_mast,
--SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,
lbinpr bin,d.pdescricion descrip_marca,lcodbc MARCA,lenemi entidad,lcomtr as Comercio,
lesttr estado,lcretr cod_retorno,lcodtr cod_trx,c.txdtrx descrip_trx,limpgs importe,lidcom cod_atm,substr(leca62,1,4) atm,b.mcrol rol,b.mcmti estado_mc,b.mcf044rmsg mensaje
from libdebito.drconbep inner join mastercard.mastrndta b on lerrnb=MCRRNBEPSA inner join LIBDEBITO.TBCTRA0P c on c.TXCTRX = lcodtr
inner join libdebito.tbinproc d on lbinpr=pbin
--and lbinpr in ('542927','230671','530399', '514848')
where lfectr between '20220822' and '20220822' --and lcretr='80'
and mcrol='ISS'
--and mcrol='ISS'
--and lesttr in ('R') --Estado reversado o aprobado
--and lhortr between '065800' and '074000'
--and lcretr in ('30')
--and lnrtar like'516400%' --MST BNF DINELCO
--and lnrtar like'230671%' --MST CONTI EMI
--and lnrtar like'546297%' --MST RIO EMI
--and lcodtr in ('011000','012000')--and b.mcrrnbepsa='010663493281'
--and lerrnb in ('018585048041','018585048733','018585049732','018585051004','018585051941','018585052639','018585054178')
order by lhortr desc;


---- MASTERCARD EMISOR
select lfectr fecha_real,lhortr hora,substr(lerrnb,2,13) referencia, lnrtar tarje,--b.mcpannmbr tarje_mast,
lbinpr bin,d.pdescricion descrip_marca,lcodbc MARCA,lenemi entidad,lcomtr as Comercio,
lesttr estado,lcretr cod_retorno,lcodtr cod_trx,c.txdtrx descrip_trx,limpgs importe,lidcom cod_atm,substr(leca62,1,4) atm,b.mcrol rol,b.mcmti estado_mc,b.mcf044rmsg mensaje
from libdebito.drconbep inner join mastercard.mastrndta b on lerrnb=MCRRNBEPSA inner join LIBDEBITO.TBCTRA0P c on c.TXCTRX = lcodtr
inner join libdebito.tbinproc d on lbinpr=pbin
--and lbinpr in ('542927','230671','530399', '514848')
where lfectr between '20220822' and '20220822' --and lcretr='80'
--and lesttr in ('R') --Estado reversado o aprobado
and mcrol='ISS'
--AND LCRETR IN ('92','05')
--and lesttr in ('R') --Estado reversado o aprobado
--and lhortr between '090600' and '09090'
--and lcodtr in ('011000','012000')--and b.mcrrnbepsa='010663493281'
--and lerrnb in ('018585048041','018585048733','018585049732','018585051004','018585051941','018585052639','018585054178')
order by lhortr desc;




-- TARJETAS MASTERCARD ADQ
		select b.mcmti estado_mc,b.mcf044rmsg mensaje,lfectr fecha,lhortr hora,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lcautr as autori,limpgs As importe,
		lcretr retorno,lesttr ESTAD,b.mcrol rol,lbinpr bin,d.pdescricion descrip_marca,lcodbc MARCA,lenemi entidad,lcomtr as Comercio,c.txdtrx descrip_trx,substr(leca62,1,4) atm,substr(lerrnb,2,13) refencia,lcodtr cod_trx,lidcom cod_atm,lerrnb REFE_BEPSA
		from libdebito.drconbep inner join mastercard.mastrndta b on lerrnb=MCRRNBEPSA inner join LIBDEBITO.TBCTRA0P c on c.TXCTRX = lcodtr
		inner join libdebito.tbinproc d on lbinpr=pbin --and lcretr in '91'
		--and lbinpr in ('601639')--('542927','230671','530399')
		and lcodtr IN ('000054','011000','012000')
		where lfectr between '20220822' and '20220822' and lenemi in ('530','560','590','570') --
		--and pdescricion like '%CONTINENTAL%'--and lhortr>140000--
		--and mcrol='ISS'
	  --and mcrol='ADQ'
		--and lesttr in ('R') --Estado reversado o aprobado
		--and lcretr in ('91','05','96') --
	  --and lhortr between '110500' and '112500'
		--and lnrtar like'230671%' --MST CONTI EMI
		--and lnrtar like'602049%' --MST RIO EMI
		--and lnrtar like'443078%' 
		--and lnrtar like'606257%'
		--AND lerrnb='134110525994'
	--and lhortr between '143000' and '235900'
		order by lhortr desc;
	

-- TARJETAS MASTERCARD ADQ	
select lfectr fecha_real,lhortr hora,substr(lerrnb,2,13) referencia, lnrtar tarje,--b.mcpannmbr tarje_mast,
lbinpr bin,d.pdescricion descrip_marca,lcodbc MARCA,lenemi entidad,lcomtr  as Comercio,
lesttr estado,lcretr cod_retorno,lcodtr cod_trx,c.txdtrx descrip_trx,limpgs importe,lidcom cod_atm,substr(leca62,1,4) atm,b.mcrol rol,b.mcmti estado_mc,b.mcf044rmsg mensaje
from libdebito.drconbep inner join mastercard.mastrndta b on lerrnb=MCRRNBEPSA inner join LIBDEBITO.TBCTRA0P c on c.TXCTRX = lcodtr
inner join libdebito.tbinproc d on lbinpr=pbin
and lbinpr in('516400')
where lfectr between '20220822' and '20220822' --and lcretr='80'
and mcrol='ADQ'
--AND LCRETR IN ('91').
and lnrtar like'606257%' 
--and lhortr between '065800' and '223000'
order by lhortr desc





SELECT VIROL, v.VIMTI , LHISOR , LHORTR , v.VIPANEXPDT , LNRTAR , LERRNB , LIDCOM , LMCCTR , LCOMTR , LIMPGS ,
LCRETR , LESTTR, v.VIF044RCOD , v.VIF044RMSG, v.VIEASCONN FROM LIBDEBITO.DRCONBEP
INNER JOIN VISA.VISTRNDTA v ON
VIRRNBEPSA = LERRNB
WHERE LFECTR = 20220822 AND LCODBC = 'VSA'
AND VIROL = 'ISS'
AND LCRETR = '91'
ORDER BY LHORTR DESC
LIMIT 100
;

---CAMPO 63 MST
SELECT mc002, mc037, mc063, MCFECREAL, MCHORAREAL FROM mastercard.mastrndta a inner join
mastercard.masctldta b on a.MCRRNBEPSA = b.MCRRNBEPSA
WHERE MC039 = '91' AND a.MCFECREAL = 20220822 ;

SELECT mc002, mc037, mc063, MCFECREAL, MCHORAREAL FROM mastercard.mastrndta a inner join
mastercard.masctldta b on a.MCRRNBEPSA = b.MCRRNBEPSA
WHERE MC039 = '91' AND a.MCFECREAL = 20220822 ;


-- ver problemas con intermitencias de trx codigo 91

SELECT m.MCROL AS "ROL" , m.MCFLD037 AS "DE037", LHORTR AS "HORA" ,
LNRTAR AS "DE002" , LIDCOM AS "DE042", LMCCTR AS "DE018" ,
LCOMTR AS "DE043", LIMPGS AS "DE004" ,
LCRETR AS "DE039" ,
m.MCF044RCOD AS "Cod Retorno" , trim(m.MCF044RMSG) AS "Retorno",
Trim(m.MCMIPCONN) AS "Conexion", a.CMIPID,
CMIPDIRRMT AS "IP" , CMIPPRTRMT AS "Puerto"
FROM LIBDEBITO.DRCONBEP
INNER JOIN MASTERCARD.MASTRNDTA m ON
m.MCRRNBEPSA = LERRNB
INNER JOIN GXBDBPS.MIPCDTA a ON
m.MCMIPCONN = a.CMIPCONNOM
WHERE LFECTR = 20220822 AND LCODBC = 'MST'
AND m.MCROL = 'ADQ'
and lcretr='91'
--and lhortr between '155400' and '180300'
ORDER BY LHORTR DESC


-- ver problemas con intermitencias de trx codigo 91
--2 kg
--adquirente dual
--adquierenete sms

--2kh
--adquirente dual 1
--adquierenete sms 1

SELECT m.MCROL AS "ROL" , m.MCFLD037 AS "DE037", LHORTR AS "HORA" ,
LNRTAR AS "DE002" , LIDCOM AS "DE042", LMCCTR AS "DE018" ,
LCOMTR AS "DE043", LIMPGS AS "DE004" ,
LCRETR AS "DE039" ,
m.MCF044RCOD AS "Cod Retorno" , trim(m.MCF044RMSG) AS "Retorno",
Trim(m.MCMIPCONN) AS "Conexion", a.CMIPID,
CMIPDIRRMT AS "IP" , CMIPPRTRMT AS "Puerto"
FROM LIBDEBITO.DRCONBEP
INNER JOIN MASTERCARD.MASTRNDTA m ON
m.MCRRNBEPSA = LERRNB
INNER JOIN GXBDBPS.MIPCDTA a ON
m.MCMIPCONN = a.CMIPCONNOM
WHERE LFECTR = 20220822 AND LCODBC = 'MST'
AND m.MCROL = 'ADQ'
and lcretr='91'
and lhortr between '155400' and '180300'
ORDER BY LHORTR DESC



-- TARJETAS MASTERCARD CONTI RIO
select b.mcmti estado_mc,b.mcf044rmsg mensaje,lfectr fecha,lhortr hora,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lcautr as autori,limpgs As importe,
lcretr retorno,lesttr ESTAD,b.mcrol rol,lbinpr bin,d.pdescricion descrip_marca,lcodbc MARCA,lenemi entidad,c.txdtrx descrip_trx,substr(leca62,1,4) atm,substr(lerrnb,2,13) refencia,lcodtr cod_trx,lidcom cod_atm
from libdebito.drconbep inner join mastercard.mastrndta b on lerrnb=MCRRNBEPSA inner join LIBDEBITO.TBCTRA0P c on c.TXCTRX = lcodtr
inner join libdebito.tbinproc d on lbinpr=pbin --and lcretr in '91'
--and lbinpr in ('601639')--('542927','230671','530399')
and lcodtr IN ('000054','011000','012000')where lfectr between '20220822' and '20220822' --and lenemi in ('530','560','590','570') --
--and pdescricion like '%CONTINENTAL%'--and lhortr>140000--
--and mcrol='ISS'
--and mcrol='ADQ'
--and lcretr in ('05','91') --
--and lhortr between '165000' and '221600'
--and lnrtar like'230671%' --MST CONTI EMI
--and lnrtar like'546297%' --MST RIO EMI
--AND lerrnb='134110525994'
--and lhortr between '060000' and '235900'
order by lhortr desc;








VSA GRAL
---SELECT DE VISA GENERAL 
	select lfectr fecha_real,lhortr hora,substr(lerrnb,2,13) refencia,lnrtar tarje_trx,b.vipannmbr tarje_visa,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS TARJETA,lcodbc MARCA,lenemi entidad,
	lesttr estado,lcretr cod_retorno,lcodtr cod_trx,limpgs importe,lidcom cod_comercio,LORITR dispositivo,
	lcomtr comercio,b.virol,b.vif044rmsg mensaje
	from libdebito.drconbep inner join visa.vistrndta b on lerrnb=virrnbepsa
	where lfectr between '20220822' and '20220822'  
	--and virol='ISS'--and lhortr between '060000' and '070000' SD
	--and virol='ADQ'
	--and lcretr in ('82','91')
	--and lhortr between '110200' and '121200'
	--and virol='ISA'---ROL EMISOR
	--and lesttr='R'
	--and lnrtar ='4882340010063886'  
	--and lnrtar like '443078%'
	--and b.virrnbepsa='016278880939'
	order by lhortr desc;
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------control glonal
select lfectr Fecha, lhortr Hora, lcodbc Marca, lenemi Emisor, lbinpr Bin,lerrnb Num_Fef, SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS TARJETA
,pdescricion Marca_tarjeta,lcretr Retorno,lesttr Estado,limpgs Monto,coddes Descripcion_COD,lnfact Pais, loritr Dispositivo,LCOMTR comercio, lcodtr Cod_trx, leca62, lidcom
from libdebito.drconbep
left join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
left join libdebito.tbcret0p on lcretr = codnro
left join libdebito.tbinproc on pbin=lbinpr
right join visa.vistrndta b on lerrnb=virrnbepsa
where lfectr in '20220822'
and codmar='BEPS'
--And lenemi IN ('020','015')--('530','560','590','570')
And lcodbc='VSA'
--and lcodbc='VSA'
--AND LBINPR='456976'
--and lnrtar='%610'
--and lesttr='R'
--and virol='ISS'
--and lenemi in ('015','020') --VSA EMISOR
--and lnfisc='456976'
--and lenemi in ('500') --VSA ADQ
--and lbinpr='456976' --VSA BNF--
--and lbinpr in ('542116','601638') --VSA BEPS
--AND LNRTAR LIKE '488234%'
--And LBINPR in '443078'
--and lenemi='510'
--AND LNFACT <> 'PY'
--and coDmar='VSA'
--and lcodbc='MST'
--AND CODMAR IN ('VISA','UNI','CRE','MST')
--and lcretr IN ('00')--('65','05')
--and loritr <>'P'
order by lhortr desc;
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--DEBITO VISA-CONTINENTAL 
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi as emisor,
lbinpr as Bin ,lcodbc as Marca ,limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por,leca62 AS VERSION,loritr as ATM_POS,lerrnb as Referencia 
from libdebito.drconbep
where lfectr between '20220822' and '20220822' and  lnrtar like '456976%' 
--and lcretr in ('04')
order by lhortr desc;
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--VISA EMISOR 
SELECT lfectr FECHA,lfcotr fecha_com,lhortr HORA,/*SUBSTR(lnrtar,1,6) || 'XXXXXX' ||SUBSTR(lnrtar,13,4) */
lnrtar TARJE,LENEMI ENTIDAD, LCODBC MARCA,lhisde Destino,/*,pdescricion MARCA*/
lesttr ESTADO,lcretr COD_RETORNO,--coddes DESCRIP_RET,
lbinpr BIN,--,pdescricion MARCA_ENTIDAD,
lerrnb REFE_BEPSA, lidcom COD_COMER,lcomtr LOCAL_COMER,limpgs IMPORTE,LNFACT AS PAIS, LPOSEM AS ENTRADA,
lcodtr COD_TRX,leca62 Version_Pos,LNFISC cod_adq_bepsa
from libdebito.drconbep
WHERE lfectr BETWEEN '20220822' AND '20220822' and lenemi in ('015','020') 
--and lcretr in ('05')--and lhortr between '700500' and '090000' -- ----and substr(lidtra,1,1) = 'T'--and lhortr between '140500' and '142200'
and lcodbc='VSA'
--and virol='ISS'
--and lnfisc='488234'
--and lnrtar ='4882340010063886'
--and lcretr in ('05') 
order by lhortr desc;
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--VISA ADQUIRENTE--
SELECT lfectr FECHA,lfcotr fecha_com,lhortr HORA,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS TARJETA,/*SUBSTR(lnrtar,1,6) || 'XXXXXX' ||SUBSTR(lnrtar,13,4) */
lnrtar TARJE,LENEMI ENTIDAD, LCODBC MARCA,lhisde Destino,/*,pdescricion MARCA*/
lesttr ESTADO,lcretr COD_RETORNO,--coddes DESCRIP_RET,	
lbinpr BIN,--,pdescricion MARCA_ENTIDAD,
lerrnb REFE_BEPSA, lidcom COD_COMER,lcomtr LOCAL_COMER,limpgs IMPORTE,LNFACT AS PAIS, LPOSEM AS ENTRADA,
lcodtr COD_TRX,leca62 Version_Pos,LNFISC cod_adq_bepsa,LORITR dispositivo
from libdebito.drconbep
WHERE lfectr BETWEEN '20220822' AND '20220822' 
--and lcretr in ('19')
--and lhortr between '060000' and '170000'-- and lcretr in ('19','91') --and substr(lidtra,1,1) = 'T'--
and lcodbc='VSA'
--and virol='ADQ'
--and lnrtar ='443078%' 
--and lnfisc='422745' and lenemi in ('500','540')  
--and lcretr in ('19','96','05')
order by lhortr desc;
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--TRX VISA POR GRUPO 
select lfectr AS FECHA , lcodbc AS MARCA,lenemi EMISOR, lcretr AS RETORNO, lesttr AS ESTADO, COUNT(*) CANTIDAD
from libdebito.drconbep
where lfectr='20220822' 
--and lhortr between '000000' and  '011000'
and lcodbc='VSA'  --and lcretr in ('04','14','00')
--and lnfisc='422745'  --and lnrtar in ('456976%') --and lenemi in ('015','020','500')
GROUP BY Lfectr, lcodbc,LENEMI, lesttr , lcretr
order by CANTIDAD desc;
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--TRX VISA EMISOR POR GRUPO 
select lfectr AS FECHA , lcodbc AS MARCA,lenemi EMISOR, COUNT(*) CANTIDAD,lesttr AS ESTADO, lcretr AS COD_RETORNO, coddes Descripcion_COD
from libdebito.drconbep
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join libdebito.tbcret0p on lcretr = codnro
where lfectr='20220822' and lcodbc='VSA' and lenemi in ('015','020')
GROUP BY Lfectr, lcretr, lcodbc,LENEMI,coddes, lesttr
order by lcretr asc, cantidad desc;

-----COMERCIOS CON ADQUIERENCIA VISA---------------------------------------------------------------------------------------------------------
select lfectr fecha_real,lhortr hora,substr(lerrnb,2,13) refencia,lbinpr,b.vipannmbr tarje_visa,
lcodbc MARCA,lenemi entidad,lesttr estado,lcretr cod_retorno,lcodtr cod_trx,limpgs importe,lidcom cod_comercio,
    lcomtr comercio,b.virol,lidtra, b.vif044rmsg mensaje,lnfisc,vimti,lposem
from libdebito.drconbep inner join visa.vistrndta b on lerrnb=virrnbepsa
where lfectr between '20220822' and '20220822'
--and b.vipannmbr='4510020102633362 '
--and substr(leca62,1,1)='P'
--and lenemi='540'
--and virol ='ADQ'
--and vimti='120'
--and lcretr='06'
--and lerrnb='035500918706'
--and lesttr='R'
and lidcom in ('0302389', '0200819', '0200878', '0200907', '6000581', '2300587', '5700007', '5700011', '6000557', '6000672', '0702858', '0700762', '1001721', '1000203', '3100065', '3100066',
'3100061', '0704292', '0704293', '0704294', '0704295', '0704296', '0704297', '0704298', '0703886', '1302417', '0704108', '0704243', '6000562', '6000561', '6000560', '6000559',
'6000558', '6000556', '6000174', '2200038', '1002354', '1002353', '1002239', '1002164', '1002094', '1002093', '1002087', '1002026', '1002025', '1002010', '1001996', '1001938',
'1001859', '1001831', '1001742', '1001692', '1001668', '1001642', '1001598', '1001546', '1001518', '1001459', '1001254', '1001237', '1001236', '1001235', '1001234', '1001233',
'1001170', '1001166', '1001074', '1001014', '1000972', '1000907', '1000839', '1000631', '1000581', '1000553', '1000417', '1000416', '1000415', '1000414', '0801494', '0704313',
'0703797', '0703678', '0703677', '0703493', '0702656', '0702069', '0701946', '0701841', '0701724', '0700368', '0200916', '0200905', '0200904', '0704355', '1002374', '4800169', '1400673',
'0704319', '0704320', '0704235', '0704246', '1800448', '0302339', '0703385', '0702330', '2100610', '0703398', '0801611', '1302226', '1400660', '1100301', '5900007', '0704299', '0801641', '0703346', '0703518',
'1900359', '1002274', '0703160', '1302222', '0703992', '0701288', '0801558', '0302409', '0302395', '0703511', '1302428', '2300599', '0702251', '0703572', '4800161', '0704165', '1900373', '0704210',
'0801635', '0704100', '0704227', '0801645', '1302439', '1302434', '1302221', '0801495', '0302367', '1002309', '1100308', '0301585', '0704202', '0801627', '6000669', '2300597', '0703506', '6000654',
'1400658', '0703212', '0302127', '6000633', '1002101', '6000657', '0704301', '0704160', '1302219', '0302406', '0703200', '0704173', '6000443', '0704233', '0703223', '6000666', '4900125',
'1302435', '0702440', '0702965', '0801576', '1002311', '0703421', '6900401', '0703577', '1302429', '0302267', '0703152', '0702970', '0704113', '0801612', '6000668', '0901749', '0703095', '0801648',
'0703430', '0801636', '0703752', '0901757', '0801569', '0702035', '6000649', '0704263', '0702665', '0801426', '0701722', '0703570', '1400615', '0704076', '0702338', '4900122', '0704239', '0302414',
'1302225', '1400656', '0302396', '0901730', '7200098', '0703917', '0801638', '3100068', '0704143', '1302220', '0702432', '0704188', '1800460', '0702461', '0704211', '1302423', '1302281',
'0302272', '1002177', '0302383', '0704133', '0302402', '0703246', '0704137', '0704189', '0801521', '0703999', '0703801', '7200099', '6000655', '1302418', '0302416', '0704252', '0302408', '0703292',
'0801624', '0704251', '2100611', '7200095', '0704086', '0703813', '0704104', '1302411', '0302412', '0703755', '1002310', '0703316', '1302300', '0704225', '4900124', '0702216', '6000651', '0700983',
'3700237', '1002040', '0704237', '1302421', '0704220', '1400659', '0702435', '0901748', '0704198', '4900129', '0702416', '0302410', '7200084', '0700696', '2300590', '1302260', '0801622', '0703055', '1302392',
'0704236', '1302425', '1302416', '0703197', '0801646', '1002328', '0702217', '5700028', '0702309', '0702106', '1302227', '0704052', '0704245', '1002235', '1002312', '1302375', '0703921', '0703949',
'0703865', '5200040', '1302292', '0801656', '0703557', '0801514', '0703571', '0704021', '0200917', '5700031', '4800164', '0701286', '0704260', '0703157', '0704300', '0801652', '0704067', '0703101',
'1200199', '0702694', '0704038', '0704084', '0702570', '0801637', '0702956', '0703222', '0704132', '0703288', '0703507', '1302444', '0702157', '1302374', '0801639', '2100607', '0302404', '0704261',
'0801559', '0702407', '0703567', '0704290', '0801431', '1400614', '0302387', '0302401', '1302218', '1002286',
'0702392', '0704088', '6000573', '1302315', '1302405', '0703707', '2300589', '0901743', '1002283', '1002266', '1302179', '1302424', '0703901', '0702185', '1302414',
'0704281', '0703151', '0702434', '0302415', '7300034', '6900397', '0704123', '0801649', '6000658', '4800170', '0704216', '0704259', '0703833', '1002170',
'0801632', '0702992', '2100614', '0800619', '6000644', '1002064', '0704221', '0704155', '0703907', '1302419', '0703973', '0704207', '0703798', '0801653', '3100067',
'0702270', '0702450', '1002299', '0801554', '0901751')
order by lhortr desc;

--select *from visa.vistrndta  where virrnbepsa = '20220822095504'

--select *from libdebito.drconbep where lerrnb = '20220822095504'


--VSA EMISOR POR BIN
select lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,lenemi as emisor,lnrtar,--,,--lnrtar,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta
lbinpr as Bin ,lcodbc as Marca ,limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as 20220601 AS VERSION,loritr as ATM_POS,lerrnb as Referencia
from libdebito.drconbep
where lfectr between '20220822' and '20220822' 
--and lnrtar like '488234%' -- VSA BNF
--and lnrtar like '456976%'-- VSA CONTI
--and lhortr between '063000' and '190000'
--and lcretr in ('05')
--and lesttr='R'
order by lhortr desc;

-- -- VISA DINELCO CONTINENTAL CODIGO DE PROCESO LENEM 020 VISA EMISOR CONTINENTAL-----04
select lfectr fecha_real,lhortr hora,substr(lerrnb,2,13) refencia,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,b.virol,b.vif044rmsg mensaje,lcodbc MARCA,lenemi entidad,
lesttr estado,lcretr cod_retorno,substr(lidtra,1,1) Origen,lcodtr cod_trx,limpgs importe,lidcom cod_comercio,lcomtr comercio,leca62 POSATM,substr(lidtra,1,1) Origen
from libdebito.drconbep inner join visa.vistrndta b on lerrnb=virrnbepsa inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr right join libdebito.tbcret0p on lcretr = codnro
right join gxbdbps.gentiaf ON (ENEMISO=LENemi) where lfectr between '20220822' and '20220822' and lcodbc = 'VSA' and codmar='VISA'
--and lcretr in ('F1')-- and lnrtar like '456976%4906'-- and lhortr>143000--- and lnrtar like '434512%'
--and virol = 'ADQ'
and lenemi in ('015','020')-- and lesttr in ('R')
--AND substr(vipannmbr, 1,6) = '456976' --and lhortr>143000 --
--and lcretr in ('91')--VISA CONTI
-- AND substr(vipannmbr, 1,6) = '488234' and lhortr>143000-- VISA BNF
order by lhortr desc;








CONTI & RIO
-----------------CONTI Y RIO-------------------------
--7ta pestaña Tarjetas Dinelco Rio y Conti  
-- Banco Continental
select cast(TO_DATE(cast(lfectr as varchar(8)),'YYYYMMDD')as date) AS FECHA,lhortr,lerrnb,lidcom,lcomtr,lexpir,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS TARJETA,limpgs,lesttr, lcretr--, lenemi
from libdebito.drconbep
where lfectr between '20220822' and '20220822' 
--and lnrtar like '703040%' --and lcretr in ('96','91','XD','92','94', '60')
and lnrtar like '703020%'
--and lnrtar like '%7030200102437667'
--and lidcom like '%0703403'
--and lnrtar like '%7667'
order by lhortr desc ;


-- Banco RIO
select cast(TO_DATE(cast(lfectr as varchar(8)),'YYYYMMDD')as date) AS FECHA,lhortr,lerrnb,lidcom,lcomtr,lexpir,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS TARJETA,limpgs,lesttr, lcretr--, lenemi
from libdebito.drconbep
where lfectr between '20220822' and '20220822' 
--and lnrtar like '703040%' --and lcretr in ('96','91','XD','92','94', '60')
and lnrtar like '703040%'
--and lnrtar like '%7030200102437667'
--and lidcom like '%0703403'
--and lnrtar like '%7667'
order by lhortr desc ;







PROCARD
----------------PROCARD------------------------
--11va pestaña Procard
--VER TRANSACCIONES POR INICIO DE HORA RECHAZADAS DE PROCARD
select cast(TO_DATE(cast(lfectr as varchar(8)),'YYYYMMDD')as date) AS FECHA,lhortr as Hora,lerrnb as Referencia,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lcodtr, lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lenemi as Emisor, lcretr as Retorno from libdebito.drconbep
where lfectr between '20220822' and '20220822' and lenemi='510'  --and lcretr in ('92','19','88','05','91','57','96','60')
--and substr(lidtra,1,1) = 'P' --EN POS
and lnrtar like '589434%'
--and lcodbc='UNI'
--and lcodbc='VSA'
--and lhortr > '63000'--'91','XD','92')
--and lcretr <> '00' and lcretr <> '55' and lcretr <> '51' --rechazos
--and lcretr in ('91','09')
--and lcretr like 'R3'
--AND lcodtr like '304000' 
--and lhortr between '000000' and  '011000'
--and ,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta '4430761400004536'
order by lhortr desc





TRX POR HORA
----ver trx ATM por hora--
select  lfectr AS FECHA,substr((lhortr + 10000000),3,2) Hora, count(*) Cant,SUBSTR(LIDTRA,1,1) DISPOSITIVO, sum(limpgs) Importe
from libdebito.drconbep where lfectr between '20220822' and '20220822'
and substr(lidtra,1,1) = 'T' --and lhortr between '080000' and '160000' and lcretr in ('55')
group by lfectr,substr((lhortr + 10000000),3,2),SUBSTR(LIDTRA,1,1) order by substr((lhortr + 10000000),3,2) desc;

 

	 	
 ----ver trx POS por hora--
select  lfectr AS FECHA,substr((lhortr + 10000000),3,2) Hora, count(*) Cant,SUBSTR(LIDTRA,1,1) DISPOSITIVO, sum(limpgs) Importe
from libdebito.drconbep where lfectr between '20220822' and '20220822'
and substr(lidtra,1,1) = 'P' --and lhortr between '080000' and '160000' and lcretr in ('55')
group by lfectr,substr((lhortr + 10000000),3,2),SUBSTR(LIDTRA,1,1) order by substr((lhortr + 10000000),3,2) desc;





ENTIDADES.
--------ENTIDADES POR LENEMI----
select lerrnb,lfectr fecha,lhortr hora,lidcom cod_comer,lcomtr comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS TARJETA, lcotel numero --lnrtar
,limpgs,lesttr,lcretr
,LCODBC marca,lbinpr bin,LORITR dispositivo,lenemi from libdebito.drconbep
where lfectr between '20220822' and '20220822'
--and lcodtr='000052'---Tigo Money
and lenemi='165'--PORAVOTY
--and lenemi='107'
--and lbinpr in ('601638','103839','542116')
--and lcodbc='CAB'
--and lidcom='8099000'
--and lhortr > '194400'
--AND LHORTR '134900' --between '130000' and '134900'
--And lenemi IN ('530','560','590','570') --and lcodbc='MST'
--and lenemi in ('015','020') --VSA EMISOR
--and lnfisc='422745' and lenemi in ('500') --VSA ADQ
--and lbinpr like '606257%' --VSA BNF
--and lbinpr like '488234%' --VSA BEPSA
--And LBINPR in '456976'
--and lnrtar like '600691%'--VISA BEPSA
--and lnrtar like '703002%'--DINELCO BNF
--and lnrtar like '703020%'--DINELCO CONTINENTAL
--AND LNRTAR LIKE '627431%'
--and lnrtar like '703040%'--DINELCO RIO
--and lnrtar like '443078%'--VISA BNF-and lnrtar like '627431%'--COOP. MBURICAO
--and lenemi='110'
--and lnrtar like '627431110%'--COOP. ÑEMBY
--and lnrtar like '627431571%'--PERSONAL	
--and lnrtar like '627431103%'--COOP. YPACARAI
--where lnrtar like '70302001077778476%'
--and lidcom in '1000581'
--and loritr in 'A'
--AND LCRETR IN ('91','96')
--AND LCRETR = '88'
--and lesttr IN ('R','D')
--and lnrtar like '6274310038228001'
order by lhortr desc;
----------------------------------------------------------------------------------------------------------------------------------------------------
-- COOPERATIVA CAPIATA
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr from libdebito.drconbep
where lfectr between '20220822' and '20220822' and lnrtar like '627431107%' order by lhortr desc;
----------------------------------------------------------------------------------------------------------------------------------------------------
-- COOPERATIVA MBURICAO
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr from libdebito.drconbep
where lfectr between '20220822' and '20220822' and lnrtar like '627431113%' order by lhortr desc;  
----------------------------------------------------------------------------------------------------------------------------------------------------
--COOPERATIVA YPAKARAI
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr from libdebito.drconbep
where lfectr between '20220822' and '20220822' and lnrtar like '627431103%' order by lhortr desc; 
----------------------------------------------------------------------------------------------------------------------------------------------------
--COOPERATIVA CABAL
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS TARJETA,limpgs,lesttr,lbinpr,lcodbc, lcretr from libdebito.drconbep
where lfectr between '20220822' and '20220822' and lenemi='512'  --and lcretr in ('XD','92','63') --and lhortr > '200000'
order by lhortr desc;
----------------------------------------------------------------------------------------------------------------------------------------------------
---- PANAL
select lfectr,lhortr,lerrnb,lidcom,lcomtr,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,limpgs,lesttr,lcodbc,lcretr from libdebito.drconbep
where lfectr between '20220822' and '20220822' and lnrtar  like '602049%'  and lhortr > '0000000'
order by lhortr desc;
----------------------------------------------------------------------------------------------------------------------------------------------------
--COOPERATIVA Nemby
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220822' and '20220822' and lnrtar like '627431110%'  and lenemi='110' 
order by lhortr desc; 
---------------------------------------------------------------------------------------------------------------------------------------
--COOOSOFAN
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220822' and '20220822' and lnrtar like '627431121%' --and lenemi='107' --and lnrtar like '627431110%'  and lenemi='110' 
order by lhortr desc;
---------------------------------------------------------------------------------------------------------------------------------------
--CREDIVIL--
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220822' and '20220822' and lnrtar like '627431101%' ----and lnrtar like '627431101%' --and lenemi='107' --and lnrtar like '627431110%'  and lenemi='110' 
order by lhortr desc;
---------------------------------------------------------------------------------------------------------------------------------------
--MBURICAO--
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220822' and '20220822' and lnrtar like '627431113%' ----and lnrtar like '627431101%' --and lenemi='107' --and lnrtar like '627431110%'  and lenemi='110' 
order by lhortr desc;
---------------------------------------------------------------------------------------------------------------------------------------
--CREDISIMPLE--
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220822' and '20220822' and lnrtar like '627431162%' ----and lnrtar like '627431101%' --and lenemi='107' --and lnrtar like '627431110%'  and lenemi='110' 
order by lhortr desc;
---------------------------------------------------------------------------------------------------------------------------------------
--COOSOFAN-CREDITO-
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220822' and '20220822' and lnrtar like '627431332%' ----and lnrtar like '627431101%' --and lenemi='107' --and lnrtar like '627431110%'  and lenemi='110' 
order by lhortr desc;
---------------------------------------------------------------------------------------------------------------------------------------
--COOSOFAN-EECTIVO-
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220822' and '20220822' and lnrtar like '627431319%' ----and lnrtar like '627431101%' --and lenemi='107' --and lnrtar like '627431110%'  and lenemi='110' 
order by lhortr desc;

















VARIOS.
-----------VARIOS----------------------------
SELECT * FROM LIBDEBITO.DRCONBEP -- MAESTRO DE TRANSACCIONES
SELECT * FROM GXBDBPS.GENTIAF    -- TABLA DE ENTIDADES
SELECT * FROM LIBDEBITO.TBCTRA0P -- TABLA DE COD. TRX 
SELECT * FROM LIBDEBITO.TBCRET0P --taBLA DE COD DE RETORNO
select * from libdebito.binprodu ---Tabla de bines
select * FROM visa.VISCTLDTA -- TARJETAS VISA
select * from GXBDBPS.TAFINAF  where afdescr= 'conti'-- 
select * from libdebito.TBINPROC BINES DE PROCARD
SELECT * FROM LIBDEBITO.TBBINE0P BINES DE BEPSA
SELECT * FROM LIBDEBITO.TC33  BINES 
select * from gxbdbps.gentiaf --BANCOS-- 








BUSQUEDA.
--Comercios, reversa de giros,etc
select lfectr Feha, lfcotr Fecha_Comer, lhortr Hora, lctaor C_I, lctade, lcotel AS NUMERO, lidcom Cod_Comer,leca62 as Modelo, lcomtr Comercio, limpgs Monto, lcodtr Transaccion, /*LCRETR Retorno,lcodbc,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4)*/lcretr AS ret,lnrtar,lenemi
,lerrnb REFE_BEPSA, lposem as entrada
from libdebito.drconbep
where lfectr between '20220822' and '20220822'
--and lctade like '109953417963' --num referencia
--and lerrnb like '109953417693'
--and substr(lidtra,1,1) = 'P' --EN POS
--and lnrtar like '415784%' --bin
--and lnrtar like '%0071' --ultimos 4 num
--and lidcom <> '6700014'-- quitar mensajes de acreditaciones
--and leca62 like 'VX0675_v10%' --por dispositivo
--and limpgs like '250000' --monto
---and lidcom like '0800949' --cod comercio
--and lcautr like '017517' --cod autori
--and lcomtr like 'SHOPPING CHINA-PJC %' --por nombre
--and lcotel in '0981770811' --telefono
--and lenemi like '107' --emisor
--and lcretr <> '00' --retornos dif a aprobado
--and lhortr between '094000' and  '095900' --por hora
--and lcodtr in  ('370000','380000','390000')  --cico
and lcretr in ('05')
order by lhortr desc

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--verificar trx por Comercio--POR JPOS 
select lfectr AS FECHA , lhortr AS HORA,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS TARJETA, /*PARA ENCRIPTAR TARJETAS*/--
lidcom AS CODIGO, lcomtr  AS COMERCIO,leca62 Version_Pos,lactfj Activo, limpgs AS MONTO, lcretr AS RETORNO, lesttr AS ESTADO, lcotel from libdebito.drconbep
where lfectr between '20220822' and '20220822' and substr(lidtra,1,1)='P' and lidcom='0701981' and lcodtr in ('370000','380000','390000')
--and lhortr between '0000' and '210000'  -- and lenemi in ('530','560','570','590')  --AND lcomtr like ('%CITYM%')--FORTIS MAYORISTA SUC MARIANO  ---
order by lhortr desc;



-----nueva consulta sql JPOS POR COMERCIO -----
SELECT lfectr FECHA,lhortr HORA,lnrtar TARJE,SUBSTR(lnrtar,1,6) || 'XXXXXX' ||SUBSTR(lnrtar,13,4) TARJE,lbinpr bin,--lexpir VTO,
LENEMI ENTIDAD,LCODBC MARCA,/*,pdescricion MARCA*/lcodtr as codigo_Trx,lhisde as Respondido_Por,
lesttr ESTADO,lcretr COD_RETORNO,lcodtr COD_TRX,limpgs IMPORTE,--coddes DESCRIP_RET,--lbinpr BIN,--
lerrnb REFE_BEPSA, lidcom COD_COMER,lcomtr LOCAL_COMER, /*txdtrx DESC_TRX,*/LECA62 version_pos,lactfj cod_act,lcautr cod_aut,
(CASE WHEN LPOSEM in ('9010','9020','910','920') THEN 'BANDA MAGNETICA'
WHEN LPOSEM = '0510' THEN 'CHIP' else 'VACIO' END) Tipo_lectura --LNFISC,LPOSEM,LMCCTR,LNFACT--,lntoke--, enemiso BANCO,tgdesc DESCRIPCION
from libdebito.drconbep --inner join libdebito.tbinproc on lbinpr=pbin
WHERE lfectr BETWEEN '20220822' AND '20220822' --AND lcomtr like('%ATM BNF CENTRO DE SERVICIOS%') --and limpgs =('47785')--
--and lidcom='0801562' --and lenemi='512' --and lcodbc in 'CAB'-and lidcom='0700534's6 mundimark
AND lcomtr like ('%PRATT%')--and lcretr in ('06')
--and limpgs='0701689'
---and lnrtar like '%2857'   --para buscar por tarjeta ultimos 4
--and lnrtar like '703002%'
--and substr(leca62,9,10) --and lhortr>120000--and lcodtr='014000' and LECA62='SPT1000_vJ3'--and lidcom not in ('302179','6000392')
order by lhortr desc




----Busqueda por Nº TARJETA
select lfectr as fecha ,lhortr as hora,lerrnb as referencia ,lidcom as codigo,lcomtr as comercio,SUBSTR(LIDTRA,1,1) DISPOSITIVO,LECA62 version_pos,lactfj cod_act,lcautr cod_aut,--SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta
lnrtar,limpgs as monto,lesttr as estado,lcretr as retorno,lhisde as Respondido_Por,lsaltr as Saldo
from libdebito.drconbep
where lfectr between '20220701'AND '20220822'
and lnrtar like '4569760000257109'
--and lnrtar like '627431%'
--and lnrtar like '%2489'
order by lfectr desc

--TRAE TODAS LAS TRX DE ATMS--TIEMPO REAL
--TRAE TODAS LAS TRX DE ATMS POS --TIEMPO REAL
select lfectr as FECHA,lhortr as HORA,lnrtar,lcodbc AS MARCA,lcodtr as COD_TRX,lhisde as Respondido_Por ,--SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS TARJETA
leca62 As ATM,lidcom as Codigo,lcomtr as NOMBRE_ATM,limpgs as MONTO,lcretr as RETORNO, lesttr as ESTADO,lerrnb as Referencia, --, LSALTR AS SALDO
(CASE WHEN LPOSEM in ('9010','9020','910','920') THEN 'BANDA MAGNETICA'
WHEN LPOSEM = '0510' THEN 'CHIP' else 'VACIO' END) Tipo_lectura
from libdebito.drconbep
where substr(lidtra,1,1) in ('P','T') --AND lcomtr like ('%orqueta%')---and lnrtar like '20220322%'
and lfectr between '20220822' and '20220822' --and lcodbc='DEB' --and lcretr in ('63')-- and LECA62='INGTETRA_J_2_20' ---- and LCODBC='VSA'
--and lcretr in ('83')--
--and lnrtar like '456976%7109' --and lcodtr not in ('011000','012000','013000','015000') --and lcretr in ('99')----and limpgs='2000000'--and lcodtr='014000' --AND LPOSEM IN ('0510') AND lcomtr like ('%BNF%')--
--and lidcom='8601304' --and lcetr in ('03')--and lidcom='8601094' --and lcodbc='VSA' --and lcretr in ('58')--and lhortr between '170000' and '183000' --
--and lcodtr='014000'--es CNB--a
--and limpgs='597000'------and lhortr between '170000' and '180000'-- --and limpgs='2000000'--and lcodbc='MST'
order by lhortr


--CONSULTA DE ENTIDAD POR EL BIN
select * from libdebito.tbinproc
where pbin like '456976'

--Consulta campo 63 trx
SELECT MC037 REFERENCIA , MC063 CAMPO_63 FROM MASTERCARD.MASCTLDTA m WHERE mc037 in('16767962919')

SELECT mc002, mc037, mc063, MCFECREAL, MCHORAREAL FROM mastercard.mastrndta a inner join
mastercard.masctldta b on a.MCRRNBEPSA = b.MCRRNBEPSA
WHERE MC039 = '91' AND a.MCFECREAL = 20220617 ;
--and mc002 like '516400%'

select * from libdebito.drconbep where lfectr='20220822' and lhortr>='001500' and substr(LIDTRA,1, 1)='P' order by lhortr desc

-- CONSULTAS PARA CAMBIO DE FECHA COMERCIAL
-- TRANSACCIONES DRCONBEP
select LIDCOM as COD_COMERCIO, LFECTR as FECHA_REAL, LFCOTR as FECHA_COMERCIAL, LHORTR as HORA, LNRTAR AS TARJETA, LBINPR AS BIN, LIMPGS as MONTO, 
LIDTRA, LCOMTR as COMERCIO, LORITR, LCODTR as CODIGO_TRX, LCODBC, LCAUTR as COD_AUTORIZ, LCRETR as COD_RESP, LESTTR as RESPUESTA, LERRNB, LECA62 
from libdebito.drconbep where lfectr='20220706' and lhortr>='190000'
 order by lhortr desc


-- TRANSACCIONES DS CONTI
select LIDCOM as COD_COMERCIO, LFECTR as FECHA_REAL, LFCOTR as FECHA_COMERCIAL, LHORTR as HORA, LNRTAR AS TARJETA, LBINPR AS BIN, LIMPGS as MONTO, 
LIDTRA, LCOMTR as COMERCIO, LORITR, LCODTR as CODIGO_TRX, LCODBC, LCAUTR as COD_AUTORIZ, LCRETR as COD_RESP, LESTTR as RESPUESTA, LERRNB, LECA62 
from libdebito.drconbep where lfectr='20220706' and lhortr>='190000'
AND LACTFJ IN ('21980761' , '21980763' , '19898844' , '13710097' , '13755406' , '19898745' , '13725452' , '13710097' , '24080072' , '46050312' , 
'19899744' , '24078181' , '24123482' , '14280622' , '14629265' , '14048071' , '14048406' , '14036881' , '14049188' , '14049191' , '14048873' , 
'14048194' , '14049466' , '14030479' , '14050014' , '14030548' , '14032383' , '14046867' , '14048618' , '14047739' , '14047885' , '14048870' , 
'14048401' , '14039166' , '14030635' , '14038239' , '14030557' , '13753425' , '14644015' , '19899843' , '19899936' , '21980768' , '19898774' , '21980770')
 order by lhortr desc


-- CABAL / PANAL
select LIDCOM as COD_COMERCIO, LFECTR as FECHA_REAL, LFCOTR as FECHA_COMERCIAL, LHORTR as HORA, LNRTAR AS TARJETA, LBINPR AS BIN, LIMPGS as MONTO, 
LIDTRA, LCOMTR as COMERCIO, LORITR, LCODTR as CODIGO_TRX, LCODBC, LCAUTR as COD_AUTORIZ, LCRETR as COD_RESP, LESTTR as RESPUESTA, LERRNB, LECA62 
from libdebito.drconbep where lfectr='20220706' and lhortr>='190000'
AND LENEMI IN ('512' , '508')
order by lhortr desc











VARIOS SELECT.
select lfectr fecha_real,lhortr hora,limpgs importe,lcretr retorno,ptiptar TIP_TAR,lesttr estado,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta, pdescricion descrip_tarje,
b.virol,b.vif044rmsg mensaje,lcodbc MARCA,lidcom cod_com,lcomtr comercio,lenemi entidad,lnfact as PAIS,lcodtr cod_trx, coddes Descripcion_DEL_CODIGO,substr(lerrnb,2,13) refencia,
b.vipannmbr tarje_visa,leca62 POSATM,substr(lidtra,1,1) Origen from libdebito.drconbep inner join visa.vistrndta b on lerrnb=virrnbepsa inner join libdebito.tbinproc on pbin=lbinpr
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr right join libdebito.tbcret0p on lcretr = codnro right join gxbdbps.gentiaf ON (ENEMISO=LENemi)
where lfectr between '20220822' and '20220822' and codmar='BEPS' and virol = 'ADQ' and lcretr in ('91','65','05')-- and lcretr in ('XD')-- and lnrtar like '540926%'-- and lcretr in ('06')
--and lnrtar like '451902%'--and lnrtar ='5226925160026139'buscar por numero de tarjeta lnrtar AS TARJETA
--and b.virrnbepsa='31614959992'buscar por numero de refencia o numero de boleta
--and lhortr between '155400' and '181100'
order by lhortr desc;


/* SELECT PARA FILTRAR TRANSACCIONES DE NUESTRAS TARJETAS QUE NOS PASA BANCARD PARA AUTORIZAR*/
select lfectr fecha_real,lhortr HORA,SUBSTR(lnrtar,1,6) || 'XXXXXX' ||SUBSTR(lnrtar,13,4) TARJE,
lenemi emisor,lbinpr bin,lposem,lcotel celular,
lesttr ESTADO,lcretr COD_RET,lcodtr COD_TRX,limpgs IMPORTE,lsaltr,--coddes DESCRIP_RET,--lbinpr BIN,--
lerrnb REFE_BEPSA, lidcom COD_COMER,lcomtr LOCAL_COMER,LECA62 ATM_POS,lactfj cod_act,lcautr cod_aut,lnfisc adq,ldistr,lnfisc
FROM libdebito.drconbep
WHERE lfectr BETWEEN '20220822' AND '20220822'
--and lbinpr in ('230671','456976') opcional para filtras.
and lnfisc in ('472040','443073','443073')--,'','','') --bin adquirente infonet pos atm
order by lhortr desc













BINES IMPORTANTES.
---NUEVOS BIENES BNF,RIO,WALEN Y CONTINENTAL
--MC BLACK CREDITO CONTI
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi as emisor,
lbinpr as Bin ,lcodbc as Marca ,limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por,leca62 AS VERSION,loritr as ATM_POS,lerrnb as Referencia 
from libdebito.drconbep
where lfectr between '20220822' and '20220822' and  lnrtar like '514848%'   --and lcretr in ('00','05')
order by lhortr desc;

--MC PREPAGA CREDITO CONTI
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi as emisor,
lbinpr as Bin ,lcodbc as Marca ,limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por,leca62 AS VERSION,loritr as ATM_POS,lerrnb as Referencia 
from libdebito.drconbep
where lfectr between '20220822' and '20220822' and  lnrtar like '230729%'   --and lcretr in ('00','05')
order by lhortr desc;

--MC GOLD CREDITO CONTI
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi as emisor,
lbinpr as Bin ,lcodbc as Marca ,limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por,leca62 AS VERSION,loritr as ATM_POS,lerrnb as Referencia 
from libdebito.drconbep
where lfectr between '20220822' and '20220822' and  lnrtar like '530399%'   --and lcretr in ('00','05')
order by lhortr desc;

--MC CLASICA CREDITO CONTI
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi as emisor,
lbinpr as Bin ,lcodbc as Marca ,limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por,leca62 AS VERSION,loritr as ATM_POS,lerrnb as Referencia 
from libdebito.drconbep
where lfectr between '20220822' and '20220822' and  lnrtar like '542927%'   --and lcretr in ('00','05')
order by lhortr desc;

--MC DEBITO CONTI
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi as emisor,
lbinpr as Bin ,lcodbc as Marca ,limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por,leca62 AS VERSION,loritr as ATM_POS,lerrnb as Referencia 
from libdebito.drconbep
where lfectr between '20220822' and '20220822' and  lnrtar like '230671%'   --and lcretr in ('00','05')
order by lhortr desc;


--VISA DEBITO CONTI
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi as emisor,
lbinpr as Bin ,lcodbc as Marca ,limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por,leca62 AS VERSION,loritr as ATM_POS,lerrnb as Referencia 
from libdebito.drconbep
where lfectr between '20220822' and '20220822' and  lnrtar like '456976%'   --and lcretr in ('00','05')
order by lhortr desc;


--MC DEBITO RIO 
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi as emisor,
lbinpr as Bin ,lcodbc as Marca ,limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por,leca62 AS VERSION,loritr as ATM_POS,lerrnb as Referencia 
from libdebito.drconbep
where lfectr between '20220822' and '20220822' and  lnrtar like '546297%'   --and lcretr in ('00','05')
order by lhortr desc;
 
--VISA DEBITO BNF 
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi as emisor,
lbinpr as Bin ,lcodbc as Marca ,limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por,leca62 AS VERSION,loritr as ATM_POS,lerrnb as Referencia 
from libdebito.drconbep
where lfectr between '20220822' and '20220822' and  lnrtar like '488234%'   --and lcretr in ('00','05')
order by lhortr desc;

--MC PREPAGA WALEN 
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi as emisor,
lbinpr as Bin ,lcodbc as Marca ,limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por,leca62 AS VERSION,loritr as ATM_POS,lerrnb as Referencia 
from libdebito.drconbep
where lfectr between '20220822' and '20220822' and  lnrtar like '547697%'   --and lcretr in ('00','05')
order by lhortr desc;

















SALDO.
---CONSULTA DE SALDO EN TARJETAS GOURMET  
	select mcdisco saldo,mcnumta tarjeta from gxbdbps.tmctaaf      
	--where mcnumta='6274311550003765'
	--where mcnumta='6274311550003260'--Marvin
	--where mcnumta='6274311550004433'--Axel
	--where mcnumta='6274311550005109'--Santi
	--where mcnumta='6274311550004623'--Grabiel
	--where mcnumta='6274311550003385'

----------------------------------------------------------------
SELECT * FROM LIBDEBITO.DRCONBEP -- MAESTRO DE TRANSACCIONES
SELECT * FROM GXBDBPS.GENTIAF    -- TABLA DE ENTIDADES
SELECT * FROM LIBDEBITO.TBCTRA0P -- TABLA DE COD. TRX
SELECT * FROM LIBDEBITO.TBCRET0P --taBLA DE COD DE RETORNO
select * from libdebito.binprodu ---Tabla de bines
select * FROM visa.VISCTLDTA -- TARJETAS VISA










ACRE SQL


/*Banco BNF*/
Select opidliq,substr(opcampoa,41,8)FechaComercial, opfecliq fecha, ophorliq hora, opnroref referencia,opncomer comercio, codeno denominacion, corucn ruc, corazo social, a.enemiso banco, pardescri desbanco, adnumcta cuenta, substr(parcswift,1,8) swift, opimpor Importe, opmensaj Mensaje, opcodbco Banco, opstat EstadoBNF, opstatob estadobco
from gxopera.opliqui inner join gxbdbps.comaeaf a on opncomer = cocomer inner join gxopera.clparf on a.enemiso = parcodbco
where opfecliq >= '20220822' and substr(opcampoa,1,6) = '703002' and enemiso = '002' --and opnroref ='201023243640'
and opstat not in ('00','77','88','99') and opstatob not in ('00','77','88')
order by opidliq;
/*Banco Continental*/
Select opidliq,substr(opcampoa,41,8)FechaComercial, opfecliq fecha, ophorliq hora, opnroref referencia,opncomer comercio, codeno denominacion, corucn ruc, corazo social, a.enemiso banco, pardescri desbanco, adnumcta cuenta, substr(parcswift,1,8) swift, opimpor Importe, opmensaj Mensaje, opcodbco Banco, opstat EstadoBNF, opstatob estadobco
from gxopera.opliqui inner join gxbdbps.comaeaf a on opncomer = cocomer inner join gxopera.clparf on a.enemiso = parcodbco
where opfecliq >= '20220822' and substr(opcampoa,1,6) = '703002' and enemiso = '057' --and opnroref = 21120705760624
and opstat not in ('00','77','88') and opstatob not in ('00','77','88')
order by opidliq;
/*Banco BBVA*/
Select opidliq,substr(opcampoa,41,8)FechaComercial, opfecliq fecha, ophorliq hora, opnroref referencia,opncomer comercio, codeno denominacion, corucn ruc, corazo social, a.enemiso banco, pardescri desbanco, adnumcta cuenta, substr(parcswift,1,8) swift, opimpor Importe, opmensaj Mensaje, opcodbco Banco, opstat EstadoBNF, opstatob estadobco
from gxopera.opliqui inner join gxbdbps.comaeaf a on opncomer = cocomer inner join gxopera.clparf on a.enemiso = parcodbco
where opfecliq >= '20220822	' and substr(opcampoa,1,6) = '703002' and enemiso = '064'
--and opstat not in ('00','77','88') and opstatob not in ('00','77','88') --and opnroref = 21120605754485
order by opidliq;
/*Otros Bancos*/
Select opidliq,substr(opcampoa,41,8)FechaComercial, opfecliq fecha, ophorliq hora, opnroref referencia,opncomer comercio, codeno denominacion, corucn ruc, corazo social, a.enemiso banco, pardescri desbanco, adnumcta cuenta, substr(parcswift,1,8) swift, opimpor Importe, opmensaj Mensaje, opcodbco Banco, opstat EstadoBNF, opstatob estadobco
from gxopera.opliqui inner join gxbdbps.comaeaf a on opncomer = cocomer inner join gxopera.clparf on a.enemiso = parcodbco
where opfecliq >= '20220822' and substr(opcampoa,1,6) = '703002' and enemiso not in ('057', '064','002')
and opstat not in ('00','77','88') and opstatob not in ('00','77','88') --and opnroref = 21120605754609
order by opidliq;



  select lfectr AS FECHA,lhortr AS HORA,lidcom AS COD_COMERCIO,lcomtr AS COMERCIO,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,limpgs AS IMPORTE,lesttr AS ESTADO,lcretr as RETORNO,lhisde as Respondido_Por,lerrnb Cod_Ref,lcotel celular,loritr as ORIGEN,lcodtr Transaccion from libdebito.drconbep
  where lfectr between '20220822' and '20220822' -- and limpgs>5163000
	and lcodtr in  ('014000') --and lhortr>163000 -- and lerrnb like '%389191146'--and lcomtr like 'FARMAOLIVA%'-- and lctade like '%0982194340%'
	and lcretr = '58' order by lhortr desc  ;









SELECT DE RECHAZO.
----CONTADOR RECHAZO PERSONAL**********--------------
select cast(TO_DATE(cast(lfectr as varchar(8)),'YYYYMMDD')as date) AS FECHA,A.TXDTRX DETALLES,count(*) Cantidad ,lcretr Cod_Retorno,substr(lidtra,1,1) Origen,coddes Descripcion_COD
from libdebito.drconbep inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr right join libdebito.tbcret0p on lcretr = codnro
WHERE lfectr= '20220822' and lcodtr in ('567102', '000072') and lhortr between '143000' and '155700' and lcretr in ('84','19','92') --and lhortr<0000
and limpgs>1 and codmar = 'BEPS'
group by lcretr,coddes,lesttr,lcodtr,TXDTRX,LFECTR,substr(lidtra,1,1),lfectr
order by lcodtr, lcretr asc,cantidad desc;



--RECHAZOS BNF PROCARD-HORA Y CONTADOR
select lfectr AS FECHA , lcodbc AS MARCA , lcretr AS RETORNO, COUNT(*) CANTIDAD
from libdebito.drconbep
where lfectr='20220822' and lenemi='510'and lhortr between '080700' and '081500' --and codmar ='VSA'
--- and lnrtar like '589434%' and lesttr in ('R')
and lcretr in ('92')
and lcodbc in ('MST','VSA','CRE','UNI')
GROUP BY Lfectr, lcodbc, lesttr , lcretr



--contador de rechazo en visa emisor DINELCO BNF 488234
select lfectr fecha_real,count(*) cantidad
,lbinpr bin,pdescricion descrip_marca,lcodbc MARCA,lcretr cod_retorno from libdebito.drconbep
right join libdebito.tbcret0p on lcretr = codnro
inner join libdebito.tbinproc on pbin=lbinpr
WHERE LFECTR IN '20220822'
AND LHORTR between '144500' and '150300'
and lbinpr like ('488234%')---and lenemi in ('530','560','590','570')--
and lcretr in ('91','77')
--and codmar='VISA'
group by lfectr,LBINPR,PDESCRICION,LCODBC,LCRETR
order by CANTIDAD desc



------VISA DEBITO CONTINENTAL
select lfectr fecha_real,count(*) cantidad,lbinpr bin,pdescricion descrip_marca,lcodbc MARCA,lcretr cod_retorno, lesttr from libdebito.drconbep
right join libdebito.tbcret0p on lcretr = codnro inner join libdebito.tbinproc on pbin=lbinpr WHERE LFECTR IN '20220822' and codmar='VISA'
AND LHORTR between '000000' and '222000' and lbinpr like ('456976%')--VISA DEBITO CONTINENTAL
and lcretr in ('92') --and lbinpr like ('488234%')--VISA DEBITO BNF
--and lesttr in ('R')
group by lfectr,LBINPR,PDESCRICION,LCODBC,LCRETR,lesttr
order by CANTIDAD desc



----RECHAZO MASTERCARD APARTADO POR BINES
select lfectr AS FECHA , lcodbc AS MARCA, lcretr AS RETORNO, COUNT(*) CANTIDAD,LBINPR,d.pdescricion descrip_marca
from libdebito.drconbep inner join mastercard.mastrndta b on lerrnb=MCRRNBEPSA inner join LIBDEBITO.TBCTRA0P c on c.TXCTRX = lcodtr inner join libdebito.tbinproc d on lbinpr=pbin
where lfectr='20220822' -- and lenemi='172' -- and lenemi='530'
--and lnrtar like '601639%' --and lenemi='166'
--and lnrtar like '542116%'
and lnrtar like '601637%'
and lcretr in ('91','96') and lcodbc in ('MST')
--and substr(lidtra,1,1) = 'P'--and lesttr='R'
GROUP BY Lfectr, lcodbc, lcretr,LBINPR,PDESCRICION




--************CONTADORES RECHAZO MASTERCARD POR CODIGO DE RETORNO*************************************
select lcodbc AS MARCA,lenemi EMISOR, COUNT(*) CANTIDAD, lcretr AS CODIGO, coddes Descripcion_DEL_CODIGO
from libdebito.drconbep
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join libdebito.tbcret0p on lcretr = codnro
inner join mastercard.mastrndta b on lerrnb=MCRRNBEPSA inner join LIBDEBITO.TBCTRA0P c on c.TXCTRX = lcodtr
inner join libdebito.tbinproc d on lbinpr=pbin
where lfectr='20220822' and lcodbc = 'MST' and codmar='MSTC'
and lcodtr IN ('000054','011000','012000')
and lcretr in ('91')
and lhortr between '102000' and '120000'
--20220822 -- and substr(lidtra,1,1)= 'T'
GROUP BY Lfectr, lcretr, lcodbc,LENEMI,coddes
order by lcretr asc, cantidad desc;

--RECHAZOS CONTARJETAS DINELCO 703002
select lfectr AS FECHA , lcodbc AS MARCA,lcretr AS RETORNO, loritr as ATM_POS, COUNT(*) CANTIDAD
from libdebito.drconbep --inner join libdebito.tbinproc on pbin=lbinpr
where lfectr='20220822'
and lenemi='170'--and lbinpr LIKE ('703002%') AND LHORTR BETWEEN '171300' and '180300'
--and lcretr in ('50','92','88','96')--'88','00','96','14','04',
and lcretr in ('91')
GROUP BY Lfectr, lcodbc, lcretr,loritr--,lbinpr
ORDER BY LCRETR DESC




--CONTADOR PARA RECHAZO 99 CIERRE MENSUAL
select lfectr AS FECHA , lcodbc AS MARCA,lcretr AS RETORNO, loritr as ATM_POS, COUNT(*) CANTIDAD
from libdebito.drconbep --inner join libdebito.tbinproc on pbin=lbinpr
where lfectr='20220822' and lbinpr LIKE ('703002%') --AND LHORTR BETWEEN '201600' and '220000'
and lcretr in ('99')--'88','00','96','14','04',
GROUP BY Lfectr, lcodbc, lcretr,loritr--,lbinpr
ORDER BY LCRETR DESC





--RECHAZO DE VISA
select COUNT(*) CANTIDAD, lcodbc AS MARCA,lcretr AS RETORNO, lbinpr as bin
from libdebito.drconbep
where lfectr='20220412' and lcretr in ('91')
and lnrtar like '499831%' --and lcodtr='00072'
--and lenemi='165'
and lhortr between '060400' and '174000'
GROUP BY lcodbc ,lcretr, lbinpr



--RECHAZOS Y CONTADOR PARA BINES
select lcodbc AS MARCA,lcretr AS RETORNO, COUNT(*) CANTIDAD
from libdebito.drconbep
where lfectr='20220822' and lnrtar like '499831%' AND LHORTR BETWEEN '174000' and '182800'
and lcretr in ('91','80')--'88','00','96','14','04',
GROUP BY lnrtar ,Lfectr, lcodbc , lcretr
ORDER BY LCRETR DESC



--********USAR ESTE PARA BILLETERAS TIGO Y CICO*********************
select COUNT(*) CANTIDAD,lcretr RESPUESTA,A.TXDTRX DETALLES from libdebito.drconbep inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
--right join libdebito.tbcret0p on lcretr = codnro
--and lenemi in ('571','581','582')
---and lcodbc in ('TCO', 'TCI', 'TGI','BIL') --and lcodtr in ('000052')
where lcodtr in ('370000','390000')
and lfectr between '20211119'and '20211123' --and lhortr between '000000' and '170000'
and lcretr in ('91')
--and limpgs>1
--and codmar = 'BEPS'
GROUP BY lbinpr,lcretr,TXDTRX



---CONTADORES PARA RECHAZO VISA GENERAL POR DESCRIPCION DEL CODIGO
select lcodbc AS MARCA,lenemi EMISOR, COUNT(*) CANTIDAD, lcretr AS CODIGO,lesttr AS EST, coddes Descripcion_DEL_CODIGO
from libdebito.drconbep
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join libdebito.tbcret0p on lcretr = codnro
right join gxbdbps.gentiaf ON (ENEMISO=LENemi)
where lfectr='20220822' and lhortr between '160400' and '161800' and lcodbc = 'VSA' and codmar='VISA' --and codmar='BEPS'
and lenemi in ('540','015','020','510','500') and lcretr in ('92','81')--- and lesttr = 'R'
GROUP BY lcretr, lcodbc,LENEMI,coddes, lesttr,ennombr,lesttr
order by lesttr desc, lcretr asc, cantidad desc;



----ver trx por hora--
select lfectr AS FECHA,substr((lhortr + 10000000),3,2) Hora, count(*) Cant,SUBSTR(LIDTRA,1,1) DISPOSITIVO, sum(limpgs) Importe
from libdebito.drconbep where lfectr between '20220822' and '20220822'
and substr(lidtra,1,1) = 'P'
group by lfectr,substr((lhortr + 10000000),3,2),SUBSTR(LIDTRA,1,1) order by substr((lhortr + 10000000),3,2) desc

---VERIFICAR POR CODIGO DE ENTIDAD and lenemi='161' --REEMPLAZAR CODIGO DE ENTIDAD
select lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,--lnrtar,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 AS VERSION ,loritr as ATM_POS,lerrnb as Referencia , lenemi
from libdebito.drconbep where lfectr between '20210210' and '20220822'-- and lerrnb ='031514847957'-- --and lcretr in ('12')
and lenemi='107'
--and lnrtar like '4345591063373546' --and lnrtar like '456976%'-- and lhortr>204000
order by lfectr desc, lhortr desc ;



---TRANSACCIONES RECHAZADAS EN VISA
select COUNT(*) CANTIDAD,lcodbc AS MARCA,lcretr AS RETORNO, coddes Descripcion_COD--,coddes Descripcion_COD
from libdebito.drconbep inner join visa.vistrndta b on lerrnb=virrnbepsa inner join libdebito.tbinproc on pbin=lbinpr
right join libdebito.tbcret0p on lcretr = codnro
right join gxbdbps.gentiaf ON (ENEMISO=LENemi)
where lfectr between '20211011' and '20211011' and lcretr in ('05','91') and lcodbc = 'VSA' and codmar='VISA'-- and lnrtar like '540926%'-- and lcretr in ('06')
--and lnrtar like '443078%'--and lnrtar ='5226925160026139'buscar por numero de tarjeta lnrtar AS TARJETA
--and b.virrnbepsa='31614959992'buscar por numero de refencia o numero de boleta
and lhortr between '141300' and '182200'
GROUP BY Lfectr, lcodbc, lcretr,coddes
order by CANTIDAD desc;



--- consulta por referencia-- codigo de comercio y por tarjeta
select lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,lnrtar AS Tarjeta,
lbinpr as Bin , lcodbc as Marca,lnfact as PAIS , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 AS VERSION ,loritr as ATM_POS,lerrnb as Referencia,lnfact as PAIS
from libdebito.drconbep where lfectr between '20220822' and '20220822' and lerrnb like '%121880147014' ---and lidcom = '6900281'-- and lnrtar like '4345591063373546'
--and lcretr in ('96')
order by lfectr desc




--CONTADOR PARA RECHAZO COOPERATIVAS
select COUNT(*) CANTIDAD , ennombr ENTIDAD,lcretr AS RETORNO,coddes DescripcionDELCODIGO
from libdebito.drconbep right join libdebito.tbcret0p on lcretr = codnro inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join gxbdbps.gentiaf ON (ENEMISO=LENemi)--inner join libdebito.tbinproc on pbin=lbinpr
where lfectr between '20211112' and '20211125' and lenemi='170' --and lbinpr LIKE ('703002%') -- and lenemi='177'-----AND LHORTR BETWEEN '121700' and '130100'
and lcretr in ('96') and limpgs>1 and codmar = 'BEPS'--'88','00','96','14','04',
GROUP BY Lfectr, ennombr, lcretr,coddes--,lbinpr
ORDER BY LCRETR DESC

--RECHAZO VISA CONTINENTAL
select cast(TO_DATE(cast(lfectr as varchar(8)),'YYYYMMDD')as date) AS FECHA, lcodbc AS MARCA,lenemi EMISOR,ennombr ENTIDAD, COUNT(*) CANTIDAD
,lesttr AS ESTADO, lcretr AS COD_RETORNO, coddes Descripcion_COD,CAST(SUM(limpgs)AS bigint) importe
from libdebito.drconbep
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join libdebito.tbcret0p on lcretr = codnro
right join gxbdbps.gentiaf ON (ENEMISO=LENemi)
and lcodbc in ('VSA','DIN') and codmar='VISA'
where lfectr='20220317'
and lcretr in ('77','92','96')
and lhortr between '165000' and '175000'
GROUP BY Lfectr, lcretr, lcodbc,LENEMI,coddes, lesttr,ennombr
order by lenemi desc , lcretr asc, cantidad desc;



--RECHAZO VISA CONTINENTAL LADO PROCARD
select cast(TO_DATE(cast(lfectr as varchar(8)),'YYYYMMDD')as date) AS FECHA, lcodbc AS MARCA,lenemi EMISOR,ennombr ENTIDAD, COUNT(*) CANTIDAD
,lesttr AS ESTADO, lcretr AS COD_RETORNO, coddes Descripcion_COD,CAST(SUM(limpgs)AS bigint) importe
from libdebito.drconbep
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join libdebito.tbcret0p on lcretr = codnro
right join gxbdbps.gentiaf ON (ENEMISO=LENemi)
and lcodbc in ('VSA','DIN') --and codmar='VISA'
where lfectr='20220317'
and lcretr in ('77')
and lhortr between '165000' and '175000'
GROUP BY Lfectr, lcretr, lcodbc,LENEMI,coddes, lesttr,ennombr
order by lenemi desc , lcretr asc, cantidad desc

--CON CONTADORES CORREGIDO----
select lfectr AS FECHA,COUNT(*) CANTIDAD,lbinpr as bin, lcodbc AS MARCA,lcretr AS RETORNO, coddes Descripcion_COD
from libdebito.drconbep
right join libdebito.tbcret0p on lcretr = codnro
INNER JOIN gxbdbps.gentiaf ON (ENEMISO=LENemi)
where lfectr in ('20220822')
and lnrtar like '703002%'
and lcretr in ('96','88')
--and lhortr between '080400' and '230000'
GROUP BY lfectr,lbinpr,lcodbc,lcretr,coddes


--RECHAZO POR BINES VISA
select COUNT(*) CANTIDAD ,lcretr AS RETORNO,coddes DescripcionDELCODIGO
from libdebito.drconbep right join libdebito.tbcret0p on lcretr = codnro
where lfectr between '20220822' and '20220822'
--and lbinpr LIKE ('456976%')
and lbinpr LIKE ('488234%')
AND LHORTR BETWEEN '173000' and '200600'
and lcretr in ('91','92','76') and limpgs>1 and codmar = 'BEPS'
GROUP BY Lfectr, lcretr,coddes
ORDER BY LCRETR DESC


--RECHAZO APARTADO POR BINES MASTERCARD MASTERCARD MASTERCARD MASTERCARD
select COUNT(*) CANTIDAD,lbinpr AS BIN ,d.pdescricion descrip_marca, lcodbc AS MARCA, lcretr AS CODIGO, coddes Descripcion_DEL_CODIGO
from libdebito.drconbep
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join libdebito.tbcret0p on lcretr = codnro
inner join mastercard.mastrndta b on lerrnb=MCRRNBEPSA inner join LIBDEBITO.TBCTRA0P c on c.TXCTRX = lcodtr
inner join libdebito.tbinproc d on lbinpr=pbin
where lfectr='20220822' and lcodbc = 'MST' and codmar='MSTC' and lbinpr LIKE ('546297%')
And lcodtr IN ('000054','011000','012000')
and lcretr in ('91','92','05')
and lhortr between '170000' and '224500' -- and substr(lidtra,1,1)= 'T'
GROUP BY lbinpr,pdescricion, lcretr, lcodbc,LENEMI,coddes
order by lcretr asc, cantidad desc;









BINES A MONITOREAR.
--------SQL BINES A MONITOREAR----
select lfectr fecha,lhortr hora,lidcom cod_comer,lcomtr comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS TARJETA
,limpgs monto,lesttr estado,lcretr retorno
,LCODBC marca,lbinpr bin,LORITR dispositivo,lenemi, lerrnb Num_Fef,ennombr ENTIDAD
from libdebito.drconbep
right join gxbdbps.gentiaf ON (ENEMISO=LENemi)
where lfectr in '20220822'
--and lhortr > '220000'
--and lcodbc='VSA'
--AND ENNOMBR LIKE '%TIGO%'
--and lenemi in ('015','020')
--and lcomtr= 'China'
--and lcodbc='VSA'
--and lcretr= '92'
--and lenemi='620'
--and lenemi='166'
--and lbinpr in '499831'
--and LCODBC in ('CAB','PAN')
--and loritr='P'
--and lcodbc='PAN'
--and lesttr='R'
--AND LCRETR='55'
--and lnrtar='%610'
--and lcomtr LIKE 'CHARL%'
--AND LNRTAR='4569760000247597'
--and lhortr > '025100'
--and loritr='P'
--AND LENEMI IN '510'
--and lidcom='0703020'
--and lerrnb='109953341963'
--and lcodtr='000052'
and loritr='P'
--and lcodtr='567102'
--AND LCODBC LIKE 'PORA%'
--AND LENEMI='177'
--AND LERRNB='112057873094'
--and lcodtr in ('370000','380000','390000')
--and lbinpr='703002'
--and lesttr='R'
--and lhortr>'053000'
--and lbinpr in '703020' --('443078','516400','488234')
--and lcretr in '92'
and lcretr in '91'
--and lbinpr like '60%'--- ('703002','443078','488234')
--AND LCODBC='VSA'
order by lhortr desc







CONECTIVIDAD.
-- Para verificación de log con BNF y Continental, para ver si hay conectividad entre bepsa y bnf utilizar emisor 1002 y para continental utilizar emisor 1020

	select*  from gxbdbps.lgcoment where date(lgfechor)='2022-08-22' and lgentid='1002' order by lgfechor desc -- Bnf emisor 1002
	
	select*  from gxbdbps.lgcoment where date(lgfechor)='2022-08-22	' and lgentid='1020' order by lgfechor desc -- Conti emisor 1020


   


SELECT DE RECHAZO.
----CONTADOR RECHAZO PERSONAL**********--------------

select cast(TO_DATE(cast(lfectr as varchar(8)),'YYYYMMDD')as date) AS FECHA,A.TXDTRX DETALLES,count(*) Cantidad ,lcretr Cod_Retorno,substr(lidtra,1,1) Origen,coddes Descripcion_COD 
from libdebito.drconbep inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr right join libdebito.tbcret0p on lcretr = codnro
WHERE  lfectr= '20220822' and lcodtr in ('567102', '000072') and lhortr between '183000' and '200200'   and lcretr in ('84','19') --and lhortr<0000
and limpgs>1 and  codmar = 'BEPS'
group by lcretr,coddes,lesttr,lcodtr,TXDTRX,LFECTR,substr(lidtra,1,1),lfectr
order by lcodtr, lcretr asc,cantidad desc;


--RECHAZOS BNF PROCARD-HORA Y CONTADOR
				select lfectr AS FECHA , lcodbc AS MARCA , lcretr AS RETORNO, COUNT(*) CANTIDAD
				from libdebito.drconbep 
				where lfectr='20220822' and lenemi='510'and lhortr between '172100' and '190000' --and codmar ='VSA'
				---	and lnrtar like '589434%' and lesttr in ('R')
				and lcretr in ('91','05') 
					 and lcodbc in ('MST','VSA','CRE','UNI')
				GROUP BY Lfectr, lcodbc, lesttr , lcretr
				

--contador de rechazo en visa emisor DINELCO BNF 488234
    select lfectr fecha_real,count(*) cantidad
,lbinpr bin,pdescricion descrip_marca,lcodbc MARCA,lcretr cod_retorno from libdebito.drconbep
right join libdebito.tbcret0p on lcretr = codnro
inner join libdebito.tbinproc on pbin=lbinpr
WHERE LFECTR IN '20220822'
AND LHORTR between '172600' and '175800'
and lbinpr like ('488234%')---and lenemi in ('530','560','590','570')--  
and lcretr in ('92','77','91')
--and codmar='VISA'
group by lfectr,LBINPR,PDESCRICION,LCODBC,LCRETR
order by CANTIDAD desc

------VISA DEBITO CONTINENTAL                           
 select lfectr fecha,count(*) cantidad,lbinpr bin,pdescricion descrip_marca,lcodbc MARCA,lcretr cod_retorno, lesttr from libdebito.drconbep
right join libdebito.tbcret0p on lcretr = codnro inner join libdebito.tbinproc on pbin=lbinpr WHERE LFECTR IN '20220822'--- and codmar='VISA'
where lfectr='20220822' and lnrtar like '703002%'--VISA DEBITO CONTINENTAL
and lcretr in ('96')-- and lbinpr like ('488234%')--VISA DEBITO BNF
--and lesttr in ('R')
 and lhortr between '172800' and '175800'
group by lfectr,LBINPR,PDESCRICION,LCODBC,LCRETR,lesttr
order by CANTIDAD desc

----RECHAZO MASTERCARD APARTADO POR BINES
    select lfectr AS FECHA , lcodbc AS MARCA, lcretr AS RETORNO, COUNT(*) CANTIDAD,LBINPR,d.pdescricion descrip_marca
from libdebito.drconbep inner join mastercard.mastrndta b on lerrnb=MCRRNBEPSA inner join LIBDEBITO.TBCTRA0P c on c.TXCTRX = lcodtr	inner join libdebito.tbinproc d on lbinpr=pbin 
where lfectr='20220822' and lhortr between '183000' and '202000'-- and lenemi='172' -- and lenemi='530'
--and lnrtar like '627431%' and lenemi='166'
and lcretr in ('91') and lcodbc in ('MST')
--and substr(lidtra,1,1) = 'P'--and lesttr='R'
GROUP BY Lfectr, lcodbc, lcretr,LBINPR,PDESCRICION


--************CONTADORES RECHAZO MASTERCARD POR CODIGO DE RETORNO*************************************
select cast(TO_DATE(cast(lfectr as varchar(8)),'YYYYMMDD')as date) FECHA, lcodbc AS MARCA, COUNT(*) CANTIDAD, lcretr AS CODIGO, coddes Descripcion_DEL_CODIGO
from libdebito.drconbep
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join libdebito.tbcret0p on lcretr = codnro
inner join mastercard.mastrndta b on lerrnb=MCRRNBEPSA inner join LIBDEBITO.TBCTRA0P c on c.TXCTRX = lcodtr
inner join libdebito.tbinproc d on lbinpr=pbin
where lfectr='20220822' and   lcodbc = 'MST' and codmar='MSTC' --and lbinpr LIKE ('542116%')
and mcrol='ADQ' 
And lcodtr IN ('000054','011000','012000')
and lcretr in ('91')and lhortr between '180000' and '2140000'  -- and substr(lidtra,1,1)= 'T'
GROUP BY  Lfectr, lcretr, lcodbc,LENEMI,coddes
order by lcretr asc, cantidad desc;

 --************CONTADORES RECHAZO MASTERCARD POR EN*************************************
select cast(TO_DATE(cast(lfectr as varchar(8)),'YYYYMMDD')as date) FECHA,lbinpr AS BIN ,d.pdescricion descrip_marca, lcodbc AS MARCA, COUNT(*) CANTIDAD, lcretr AS CODIGO, coddes Descripcion_DEL_CODIGO
from libdebito.drconbep
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join libdebito.tbcret0p on lcretr = codnro
inner join mastercard.mastrndta b on lerrnb=MCRRNBEPSA inner join LIBDEBITO.TBCTRA0P c on c.TXCTRX = lcodtr
inner join libdebito.tbinproc d on lbinpr=pbin
where lfectr='20220822' and   lcodbc = 'MST' and codmar='MSTC' and lbinpr LIKE ('230671%') 
And lcodtr IN ('000054','011000','012000')
and lcretr in ('91','92')
and lhortr between '165200' and '165900'  -- and substr(lidtra,1,1)= 'T'
GROUP BY  Lfectr,lbinpr,pdescricion, lcretr, lcodbc,LENEMI,coddes
order by lcretr asc, cantidad desc;


--RECHAZOS CONTARJETAS DINELCO 703002 
select lfectr AS FECHA , COUNT(*) CANTIDAD, lcodbc AS MARCA,lcretr AS RETORNO , lhisde AS REPONDE--loritr as ATM_POS
from libdebito.drconbep	--inner join libdebito.tbinproc on pbin=lbinpr
where lfectr='20220822'   and lbinpr LIKE ('703002%')--and lenemi='174'
 AND LHORTR BETWEEN '172600'  and '175800' 
and lcretr in ('96','88','92')--'88','00','96','14','04',
GROUP BY Lfectr, lcodbc, lcretr,lhisde--,lbinpr---loritr
ORDER BY LCRETR DESC


--CONTADOR PARA RECHAZO 99 CIERRE MENSUAL
select lfectr AS FECHA , lcodbc AS MARCA,lcretr AS RETORNO, loritr as ATM_POS, COUNT(*) CANTIDAD
from libdebito.drconbep	--inner join libdebito.tbinproc on pbin=lbinpr
where lfectr='20220822' and lbinpr LIKE ('703002%') AND LHORTR BETWEEN '180200'  and '182300' 
and lcretr in ('91')--'88','00','96','14','04',
GROUP BY Lfectr, lcodbc, lcretr,loritr--,lbinpr
ORDER BY LCRETR DESC



--CONTADOR PARA RECHAZO  COOPERATIVAS 
select  COUNT(*) CANTIDAD , ennombr ENTIDAD,lcretr AS RETORNO,coddes DescripcionDELCODIGO
from libdebito.drconbep	right join libdebito.tbcret0p on lcretr = codnro  inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join gxbdbps.gentiaf ON (ENEMISO=LENemi)--inner join libdebito.tbinproc on pbin=lbinpr
where lfectr between '20200723' and '20220822' and lbinpr LIKE ('703002%')-- and lenemi='170' --and lbinpr LIKE ('703002%') -- and lenemi='177'-----AND LHORTR BETWEEN '121700'  and '130100' 
and lcretr in ('96') and limpgs>1 and codmar = 'BEPS'--'88','00','96','14','04',
GROUP BY Lfectr, ennombr, lcretr,coddes--,lbinpr
ORDER BY LCRETR DESC



--RECHAZO DE VISA
select COUNT(*) CANTIDAD, lcodbc AS MARCA,lcretr AS RETORNO, lbinpr as bin
from libdebito.drconbep
where lfectr between '20220822' and '20220822' and lcretr in ('91')
--and lnrtar like '%' --and lcodtr='00072'
and lenemi='174'
and lhortr between '161000' and '220000'
GROUP BY lcodbc ,lcretr, lbinpr

--RECHAZOS Y CONTADOR  PARA BINES
select lcodbc AS MARCA,lcretr AS RETORNO, COUNT(*) CANTIDAD
from libdebito.drconbep 
where lfectr='20220822' and lnrtar like '703020%' --AND LHORTR BETWEEN '174000'  and '182800' 
and lcretr in ('91','96')--'88','00','96','14','04',
GROUP BY lnrtar ,Lfectr, lcodbc , lcretr 
ORDER BY LCRETR DESC

--********USAR ESTE PARA BILLETERAS TIGO Y CICO*********************
select COUNT(*) CANTIDAD,lcretr RESPUESTA,A.TXDTRX DETALLES from libdebito.drconbep inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
--right join libdebito.tbcret0p on lcretr = codnro
--and lenemi in ('571','581','582')
and lcodbc in ('TCO', 'TCI', 'TGI','BIL') --and lcodtr in ('000052')
--where lcodtr in  ('370000','390000')
and lfectr='20220822' and lhortr between '080000' and '120000'  and lcretr in ('91')
--and limpgs>1
--and  codmar = 'BEPS'
GROUP BY lbinpr,lcretr,TXDTRX

---CONTADORES PARA RECHAZO VISA GENERAL POR DESCRIPCION DEL CODIGO
select lcodbc AS MARCA,lenemi EMISOR, COUNT(*) CANTIDAD, lcretr AS CODIGO,lesttr AS EST, coddes Descripcion_DEL_CODIGO
from libdebito.drconbep 
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join libdebito.tbcret0p on lcretr = codnro
right join gxbdbps.gentiaf ON (ENEMISO=LENemi)
where lfectr='20220822' and lhortr between '180000' and '180700' and   lcodbc = 'VSA' and codmar='VISA'-- and codmar='BEPS'
and lenemi in ('540','015','020','510','500')  --
and lcretr in ('19','76')--and lesttr = 'R'
GROUP BY lcretr, lcodbc,LENEMI,coddes, lesttr,ennombr,lesttr
order by lesttr desc, lcretr asc, cantidad desc;


---TRANSACCIONES RECHAZADAS EN VISA
select COUNT(*) CANTIDAD,lcodbc AS MARCA,lcretr AS RETORNO, coddes Descripcion_COD--,coddes Descripcion_COD
from libdebito.drconbep inner join visa.vistrndta b on lerrnb=virrnbepsa inner join libdebito.tbinproc on pbin=lbinpr
right join libdebito.tbcret0p on lcretr = codnro
right join gxbdbps.gentiaf ON (ENEMISO=LENemi)
where lfectr between '20211104' and '20211104' and lcretr in ('91','7')  and   lcodbc = 'VSA' and codmar='VISA'-- and lnrtar like '540926%'-- and lcretr in ('06')
and lnrtar like '488234%'--and lnrtar ='5226925160026139'buscar por numero de tarjeta lnrtar AS TARJETA
--and b.virrnbepsa='31614959992'buscar por numero de refencia o numero de boleta
 and lhortr between '172800' and '175800'
GROUP BY Lfectr, lcodbc, lcretr,coddes
order by  CANTIDAD desc;

 ----ver trx por hora--
select  lfectr AS FECHA,substr((lhortr + 10000000),3,2) Hora, count(*) Cant,SUBSTR(LIDTRA,1,1) DISPOSITIVO, sum(limpgs) Importe
from libdebito.drconbep where lfectr between '20220822' and '20220822'
and substr(lidtra,1,1) = 'P'
group by lfectr,substr((lhortr + 10000000),3,2),SUBSTR(LIDTRA,1,1) order by substr((lhortr + 10000000),3,2) desc
 


--contador de rechazo en visa emisor conti 456976
    select lfectr FECHA,count(*) cantidad,lbinpr bin,lcretr CODIGO,pdescricion DESCRIPCION_DEL_CODIGO,lcodbc MARCA from libdebito.drconbep
right join libdebito.tbcret0p on lcretr = codnro
inner join libdebito.tbinproc on pbin=lbinpr
WHERE LFECTR IN '20220822'
AND LHORTR between '165200' and '165900'
and lbinpr like ('456976%')---and lenemi in ('530','560','590','570')--  
and lcretr in ('92')
 and lcodbc = 'VSA' and codmar='VISA'
group by lfectr,LBINPR,PDESCRICION,LCODBC,LCRETR
order by CANTIDAD desc;


--CONTADOR PARA COOPERATIVA GUA-I
select lfectr AS FECHA , COUNT(*) CANTIDAD , lcodbc AS MARCA,lcretr AS RETORNO,coddes DescripcionDELCODIGO
from libdebito.drconbep	right join libdebito.tbcret0p on lcretr = codnro --inner join libdebito.tbinproc on pbin=lbinpr
where lfectr between '20220822' and '20220822' and lenemi='177'--and lbinpr LIKE ('703020%') ---AND LHORTR BETWEEN '121700'  and '130100' 
and lcretr in ('91') and limpgs>1 and codmar = 'BEPS'--'88','00','96','14','04',
GROUP BY Lfectr, lcodbc, lcretr,loritr,coddes--,lbinpr
ORDER BY LCRETR DESC


--CONTADOR PARA RECHAZO  COOPERATIVAS 
select  COUNT(*) CANTIDAD , ennombr ENTIDAD,lcretr AS RETORNO,coddes DescripcionDELCODIGO
from libdebito.drconbep	right join libdebito.tbcret0p on lcretr = codnro  inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join gxbdbps.gentiaf ON (ENEMISO=LENemi)--inner join libdebito.tbinproc on pbin=lbinpr
where lfectr between '20220822' and '20220822'  and lenemi='170' --and lbinpr LIKE ('703002%') -- and lenemi='177'-----AND LHORTR BETWEEN '121700'  and '130100' 
and lcretr in ('96') and limpgs>1 and codmar = 'BEPS'--'88','00','96','14','04',
GROUP BY Lfectr, ennombr, lcretr,coddes--,lbinpr
ORDER BY LCRETR DESC



----CONTADOR RECHAZO PERSONAL**********--------------
select cast(TO_DATE(cast(lfectr as varchar(8)),'YYYYMMDD')as date) AS FECHA,A.TXDTRX DETALLES,count(*) Cantidad ,lcretr Cod_Retorno,substr(lidtra,1,1) Origen,coddes Descripcion_COD
from libdebito.drconbep inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr right join libdebito.tbcret0p on lcretr = codnro
WHERE lfectr= '20220822' and lcodtr in ('567102', '000072') and lhortr between '151800' and '223000' and lcretr in ('92','19') --and lhortr<0000
and limpgs>1 and codmar = 'BEPS'
group by lcretr,coddes,lesttr,lcodtr,TXDTRX,LFECTR,substr(lidtra,1,1),lfectr
order by lcodtr, lcretr asc,cantidad desc;


select cast(TO_DATE(cast(lfectr as varchar(8)),'YYYYMMDD')as date) AS FECHA,lcodtr COD_TRX,A.TXDTRX DETALLES,count(*) Cantidad ,lcretr Cod_Retorno,lesttr Estad,substr(lidtra,1,1) Origen,coddes Descripcion_COD ,CAST(SUM(limpgs)AS bigint) importe
from libdebito.drconbep
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join libdebito.tbcret0p on lcretr = codnro
WHERE  lfectr= '20220822'
and lcodtr in ('000052','567102', '000072')--and lhortr between '190800' and '193000'  
and lcretr in ('91','19') --and lhortr<0000
and limpgs>1
and  codmar = 'BEPS'
group by lcretr,coddes,lesttr,lcodtr,TXDTRX,LFECTR,substr(lidtra,1,1),lfectr
order by lcodtr, lcretr asc,cantidad desc;

--RECHAZO DE LA COOPERATIVA  MERCADO 4
select COUNT(*) CANTIDAD,lcretr AS RETORNO, lbinpr as bin
from libdebito.drconbep
where lfectr between '20220822' and '20220822' and lcretr in ('96')
--and lnrtar like '%' --and lcodtr='00072'
and lenemi='165'
and lhortr between '060000' and '220000'
GROUP BY lcodbc ,lcretr, lbinpr



--Dinelco Debito Cooperativas
select cast(TO_DATE(cast(lfectr as varchar(8)),'YYYYMMDD')as date) AS FECHA,ennombr ENTIDAD, COUNT(*) CANTIDAD, lcretr AS COD_RETORNO, coddes DescripcIONDELCODIGO
from libdebito.drconbep 
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join libdebito.tbcret0p on lcretr = codnro
right join gxbdbps.gentiaf ON (ENEMISO=LENemi)
where lfectr='20220822' and codmar='BEPS' --and lcodbc = 'DIN'
AND lenemi IN ('177')  and lcretr in ('91') --and lhortr between '060000' and '153100'
--and LBINPR in ('703002','703020','703040')--and lcretr in '91'--and lhortr between '080300' and '104700'
GROUP BY Lfectr, lcretr,LENEMI,ennombr,coddes, lesttr
order by LENEMI ASC,cantidad desc;


--contador de rechazo en visa emisor conti 456976
    select lfectr FECHA,count(*) cantidad,lbinpr bin,lcretr CODIGO,pdescricion DESCRIPCION_DEL_CODIGO,lcodbc MARCA from libdebito.drconbep
right join libdebito.tbcret0p on lcretr = codnro
inner join libdebito.tbinproc on pbin=lbinpr
WHERE LFECTR IN '20220822'
AND LHORTR between '193000' and '194500'
--and lbinpr like ('499831%')---and lenemi in ('530','560','590','570')--  
and lcretr in ('05')
 and lcodbc = 'VSA' and codmar='VISA'
group by lfectr,LBINPR,PDESCRICION,LCODBC,LCRETR
order by CANTIDAD desc;



--contador de rechazo en visa emisor conti 456976
    select lfectr FECHA,count(*) cantidad,lbinpr bin,lcretr CODIGO,pdescricion DESCRIPCION_DEL_CODIGO,lcodbc MARCA from libdebito.drconbep
right join libdebito.tbcret0p on lcretr = codnro
inner join libdebito.tbinproc on pbin=lbinpr
WHERE LFECTR IN '20220822'
AND LHORTR between '193000' and '194500'
and lbinpr like ('499831%')---and lenemi in ('530','560','590','570')--  
and lcretr in ('91')
 and lcodbc = 'VSA' and codmar='VISA'
group by lfectr,LBINPR,PDESCRICION,LCODBC,LCRETR
order by CANTIDAD desc;




--CONTADOR PARA RECHAZO  COOPERATIVAS 
select  COUNT(*) CANTIDAD , ennombr ENTIDAD,lcretr AS RETORNO,coddes DescripcionDELCODIGO
from libdebito.drconbep	right join libdebito.tbcret0p on lcretr = codnro  inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join gxbdbps.gentiaf ON (ENEMISO=LENemi)--inner join libdebito.tbinproc on pbin=lbinpr
where lfectr between '20220822' and '20220822' AND LHORTR BETWEEN '172600'  and '175800'    and lenemi='174'-----AND LHORTR BETWEEN '121700'  and '130100' 
and lcretr in ('96') and limpgs>1 and codmar = 'BEPS'--'88','00','96','14','04',
GROUP BY Lfectr, ennombr, lcretr,coddes--,lbinpr
ORDER BY LCRETR DESC


----Contador de rehazo en Linea
Select count(*)Cantidad, sum(opimpor) Importe, opmensaj Mensaje, opcodbco Banco from gxopera.opliqui
where opfecliq >= '20220822' and substr(opcampoa,1,6) = '703002'
and opstat not in ('00','77','88') and opcodbco <> 64
group by opmensaj, opcodbco
order by banco desc;


--ADQ.VISA  CONTINENTAL---------
select lenemi EMISOR,ennombr ENTIDAD, COUNT(*) CANTIDAD,substr(lidtra,1,1) Origen,lesttr AS ESTADO, lcretr AS COD_RETORNO, coddes Descripcion_COD,CAST(SUM(limpgs)AS bigint) importe
from libdebito.drconbep 
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr right join libdebito.tbcret0p on lcretr = codnro
right join gxbdbps.gentiaf ON (ENEMISO=LENemi)
where lfectr='20220822' and   lcodbc = 'VSA' and codmar='VISA'  AND LHORTR BETWEEN '214000'  and '214400'  
and lenemi ='540'		and lcretr ='19'
GROUP BY lcretr, lcodbc,LENEMI,coddes, lesttr,substr(lidtra,1,1),ennombr
order by substr(lidtra,1,1) desc, lcretr asc, cantidad desc;




--RESUMEN DE BILLETERAS
select cast(TO_DATE(cast(lfectr as varchar(8)),'YYYYMMDD')as date) AS FECHA,lcodtr COD_TRX,A.TXDTRX DETALLES,count(*) Cantidad ,lcretr Cod_Retorno,lesttr Estad,substr(lidtra,1,1) Origen,coddes Descripcion_COD ,CAST(SUM(limpgs)AS bigint) importe
from libdebito.drconbep
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join libdebito.tbcret0p on lcretr = codnro
WHERE  lfectr= '20220822' AND LHORTR between '154500' and '233200'
and lcodtr in ('567102')
--and lnrtar like '627431581%'--and lhortr between '190800' and '193000'  
 and lcretr in ('92','19') --and lhortr<0000
and limpgs>1
and  codmar = 'BEPS'
group by lcretr,coddes,lesttr,lcodtr,TXDTRX,LFECTR,substr(lidtra,1,1),lfectr
order by lcodtr, lcretr asc,cantidad desc;

---MST ADQUIRENTE
************************************************************************************************
*                               /*CONSULTAS PARA MASTERCARD eventos*/                           *
************************************************************************************************
SELECT lfectr FECHA,COUNT(*) CANTIDAD, LCODBC MARCA, sum(limpgs) monto,lcretr cod_respuesta,substr(lidtra,1,1) dispositivo
from libdebito.drconbep inner join gxtrjdta.tdgbin on lbinpr=binnrobin
WHERE lfectr BETWEEN '20220822' AND '20220822'
and lcretr in ('91','05','96')--,'92','91','96')--,'96','19')
--and lesttr ='A'
and lcodbc in ('MST')
--and eneadm='087'
--and lenemi='002'
GROUP BY Lfectr ,LCODBC,lcretr,substr(lidtra,1,1)
order by monto desc

