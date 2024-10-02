----------------BILLETERAS----------
select cast(TO_DATE(cast(lfectr as varchar(8)),'YYYYMMDD')as date) AS FECHA ,lcodtr COD_TRX,A.TXDTRX DETALLES,count(*) Cantidad ,lcretr Cod_Retorno,lesttr Estad,substr(lidtra,1,1) Origen,coddes Descripcion_COD ,CAST(SUM(limpgs)AS bigint) importe
from libdebito.drconbep
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join libdebito.tbcret0p on lcretr = codnro
WHERE  lfectr= '20210526'
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
where lfectr='20210526' and   lcodbc = 'VSA' and codmar='VISA'
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
where lfectr='20210526' and   lcodbc = 'MST' and codmar='MSTC'
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
where lfectr='20210526'
and lcodbc='VSA' and  codmar = 'VISA'
and lenemi in ('015','020')
GROUP BY Lfectr, lcretr, lcodbc,LENEMI,coddes, lesttr,ennombr
order by lenemi desc , lcretr asc, cantidad desc;


--MST ADQUIRENCIA PROCARD
select cast(TO_DATE(cast(lfectr as varchar(8)),'YYYYMMDD')as date) AS FECHA , lcodbc AS MARCA,lenemi EMISOR, COUNT(*) CANTIDAD,substr(lidtra,1,1) Origen,lesttr AS ESTADO, lcretr AS COD_RETORNO, coddes Descripcion_COD,CAST(SUM(limpgs)AS bigint) as Importe
from libdebito.drconbep
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join libdebito.tbcret0p on lcretr = codnro
where lfectr='20210526' and   lcodbc = 'MST' and codmar='MSTC'
and lenemi in ('510') ---and lnfisc='422745'
GROUP BY Lfectr, lcretr, lcodbc,LENEMI,coddes, lesttr,substr(lidtra,1,1)
order by substr(lidtra,1,1) desc, cantidad desc;


--Visa Adquiriente  Procard--########################################################################################
select cast(TO_DATE(cast(lfectr as varchar(8)),'YYYYMMDD')as date) AS FECHA  , lcodbc AS MARCA,lenemi EMISOR, COUNT(*) CANTIDAD,lesttr AS ESTADO, lcretr AS COD_RETORNO, coddes Descripcion_COD,CAST(SUM(limpgs)AS bigint) as Importe
from libdebito.drconbep
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join libdebito.tbcret0p on lcretr = codnro
where lfectr='20210526' and lcodbc='VSA' and codmar='VISA'
and lenemi in ('510')
GROUP BY Lfectr, lcretr, lcodbc,LENEMI,coddes, lesttr
order by lcretr asc, cantidad;


---RESUMEN TARJETAS DINELCO 703002-703020-703040#############################################################################################################################################################--
select cast(TO_DATE(cast(lfectr as varchar(8)),'YYYYMMDD')as date) AS FECHA , lcodbc AS MARCA,lenemi EMISOR,LBINPR BIN,ENNOMBR entidad, COUNT(*) CANTIDAD,lesttr AS ESTADO,
lcretr AS COD_RETORNO,substr(lidtra,1,1), coddes Descripcion_COD,CAST(SUM(limpgs)AS bigint) as Importe
from libdebito.drconbep
right join libdebito.tbcret0p on lcretr = codnro
INNER JOIN gxbdbps.gentiaf ON (ENEMISO=LENemi)
where lfectr='20210526' and codmar='BEPS'--and   lcodbc = 'DIN' and
and LBINPR in ('703002','703020','703040')--and lhortr between '000000' and '173000'
GROUP BY Lfectr, lcretr,LBINPR, lcodbc,LENEMI,ennombr,coddes, lesttr,substr(lidtra,1,1)
order by LENEMI ASC,cantidad desc;

----------------------TRX ATM---------------------------------
------------------------TRANSACCIONES ATM-CENTRE -------------------------------------------------------------------------
	select cast(TO_DATE(cast(lfectr as varchar(8)),'YYYYMMDD')as date) AS FECHA,lhortr as HORA,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS TARJETA,lcodbc AS TIPO,leca62 As ATM,lcomtr as NOMBRE_ATM,limpgs as MONTO,lcretr as RETORNO, lesttr as ESTADO,  
	(CASE WHEN LPOSEM in ('9010','9020','910','920') THEN 'BANDA MAGNETICA'
WHEN LPOSEM = '0510' THEN 'CHIP'
WHEN LPOSEM = '0710' THEN 'CONTACLESS' else 'VACIO' END) Tipo_lectura
from libdebito.drconbep
	where leca62 = 'T458' --and 'T500'
  --between 'T001' and 'T500'
  --and lfectr='20210317'
	--('T011','T026','T070','T454','T370','T403','T408','T420','T461','T462','T001','T415','T423','T424','T441','T405','T410','T461', 'T210','T115')
	and lfectr between '20210526' and '20210526'
	--and lesttr='R'
	--and lcodbc IN 'Bi'
	--and lnrtar like '%8603'   --para buscar por tarjeta ultimos 4
	--and lnrtar like '6274%'
	--and lhortr between '195000' and  '211900'
	--and lcretr='00'
	--and lcretr <>'00'
	--and lcomtr='ATM SUC.BNF P.J.CABALLERO 4'
	order by lhortr desc
  --order by lidtra asc


--verificar personal--
select cast(TO_DATE(cast(lfectr as varchar(8)),'YYYYMMDD')as date) AS FECHA,lhortr HORA,lerrnb,lidcom,lcomtr, lcotel,lctade,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,limpgs,lesttr,leca62,lenemi,lcretr from libdebito.drconbep
where lfectr between '20210526' and '20210526' --and lnrtar like '627431571%' 
and lcodtr in '567102'
--and lctade like '%0972129027%'
--and lidcom like '%702506'
--and limpgs like '155900.00'
--and lhortr between '121000' and  '130000'
--and lctade = '0000000982161176'
--and lcotel = '0971655386'
--and lnrtar like '%685095%'
--and lctaor like '%971611158' 
--and lhortr between '110000' and  '113000'
--and lcretr = '19'
--and leca62 like 'T388'
--and lidtra like '%T%'
order by lhortr desc;






---------------------TIGO----------------------------------


------------370 carga , 380 retiro, 390 giro----------------
select cast(TO_DATE(cast(lfectr as varchar(8)),'YYYYMMDD')as date) AS FECHA,lhortr,lerrnb,lidcom,lcomtr,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,limpgs,lesttr,lcretr, lcodtr codtrx,lcotel AS NUMERO from libdebito.drconbep
where lfectr between '20210526' and '20210526' and lcodtr in  ('380000','370000','390000') 
--and lcodtr in '380000' 
--and lcomtr <> 'BIGGIE EXPRESS%'
--and lidcom in 1000416
--and lcretr in ('61') 
--and lcotel like '%985285340'
--and lcotel <> '               '
order by lhortr desc ; 


--verificar trx tigo handlerWS-- SIN TARJETA
select cast(TO_DATE(cast(lfectr as varchar(8)),'YYYYMMDD')as date) AS FECHA,lhortr,lerrnb,lidcom,lcomtr,lcotel,lnrtar,limpgs,lesttr,lcretr from libdebito.drconbep
where lfectr between '20210526' and '20210526' and lnrtar like '627431581%' --and lcretr in ('96','91','XD','92','94', '60')
--and lctade = '0000000984250875'
--and lcotel = '09827164974'
--and lidcom like '%1001764'
--and lctade like '%09827164974'
--and lctade like '%338976244' --num referencia
order by lhortr desc ;

--verificar tigo companion-- CON TARJETA
select cast(TO_DATE(cast(lfectr as varchar(8)),'YYYYMMDD')as date) AS FECHA,lhortr,lerrnb,lidcom,lcomtr,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,limpgs,lesttr,lcretr from libdebito.drconbep
where lfectr between '20210526' and '20210526' and lnrtar like '627431152%' --and lcretr in ('96','91','XD','92','94', '60')
order by lhortr desc ;








--------------------CLARO---------------------------
--Billeteras Claro
select distinct cast(TO_DATE(cast(lfectr as varchar(8)),'YYYYMMDD')as date) AS FECHA,lerrnb AS REFERENCIA,lhortr AS HORA,lidcom AS CODIGO,lcomtr AS COMERCIO,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,leca62 AS VERSION,limpgs AS MONTO,lesttr AS ESTADO,lcretr AS RETORNO,lcotel AS LINEA_CEL, lenemi
from libdebito.drconbep
where lfectr between '20210526' and '20210526' and lnrtar like '627431591%' --and lidcom='0701608' --and lidcom='0701689' --lhortr between '080700' and '090200'   --and lcretr in ('91','96','19','93','00')--AND substr(lidtra,1,1) = 'T'--and lidcom='0701975' --and lcretr in ('91','96','01','93','00')
--and lctade like '%0985569484%'--0701689--and lcotel='0985569484'
order by lhortr desc






-------------------CONTI Y RIO-------------------------
--7ta pestaÃ±a Tarjetas Dinelco Rio y Conti  
-- Banco Continental
select cast(TO_DATE(cast(lfectr as varchar(8)),'YYYYMMDD')as date) AS FECHA,lhortr,lerrnb,lidcom,lcomtr,lexpir,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS TARJETA,limpgs,lesttr, lcretr--, lenemi
from libdebito.drconbep
where lfectr between '20210526' and '20210526' 
--and lnrtar like '703040%' --and lcretr in ('96','91','XD','92','94', '60')
and lnrtar like '703020%'
--and lnrtar like '%7030200102437667'
--and lidcom like '%0703403'
--and lnrtar like '%7667'
order by lhortr desc ;


-- Banco RIO
select cast(TO_DATE(cast(lfectr as varchar(8)),'YYYYMMDD')as date) AS FECHA,lhortr,lerrnb,lidcom,lcomtr,lexpir,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS TARJETA,limpgs,lesttr, lcretr--, lenemi
from libdebito.drconbep
where lfectr between '20210526' and '20210526' 
--and lnrtar like '703040%' --and lcretr in ('96','91','XD','92','94', '60')
and lnrtar like '703040%'
--and lidcom like '%0703403'
order by lhortr desc ;





--------------------TARJETA DINELCO------------------
--8va pestaÃ±a Tarjeta Dinelco 703020
-- DINELCO BNF--4642593614***4259361409097918--4259361409097918
select cast(TO_DATE(cast(lfectr as varchar(8)),'YYYYMMDD')as date) AS FECHA,lhortr,lerrnb,lidcom,lcomtr,lexpir,lnrtar,limpgs,lesttr, lcretr--, lenemi
from libdebito.drconbep
where lfectr between '20210526' and '20210526' and lnrtar like '703002%' --and lcretr in ('96','91','XD','92','94', '60')
--and lnrtar like '627431%'
--and lcretr <> '00'
--and lcretr in '96'
--and substr(lidtra,1,1) = 'P' --EN POS
and lidcom <> '6700014'--mensajes de acreditaciones
--and substr(lidtra,1,1) = 'P' --EN POS
--and lhortr between '180000' and  '231000'
and lhortr>140000
--and lexpir='2007'
--and lnrtar like '%0609'
--and lidcom = '8099000' --cibersons
--and lnrtar like '4793%' --visa vision
--and lnrtar like '456976%'
--and lnrtar like '589434%'
order by lhortr desc 






-------------DEBITO CONTINENTAL---------------
--9na pestaÃ±a Tarjetas Conti
--Debito Continental
select cast(TO_DATE(cast(lfectr as varchar(8)),'YYYYMMDD')as date) AS FECHA,lerrnb as Refe_BEPSA, lhortr as Hora,lenemi as Emisor, SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta, lidcom, lcodtr,  lcomtr as Comercio, limpgs as Monto, lesttr, lcretr as COD_RET,lhisde as Respondido_Por
from libdebito.drconbep 
where lfectr between '20210526' and '20210526' 
and lnrtar like '456976%'
--and lnrtar like '443078%'
--and substr(lidtra,1,1) = 'P' --EN POS
--and lenemi in ('015','020')
--and lenemi like '510'
--and lnrtar like '415784%'
--and lcodbc='VSA' and lenemi in ('540')
--and lcretr ='05'-- and lhortr between '192300' and '204700' 
--and lnrtar like '703020%'
--and lnrtar like '%2845'
--and lcretr in ('04')
--and lhortr > 140000
--and lhortr between '000000' and  '011000'
--and lnrtar like '092%'
order by lhortr desc;









-----------------VISA DINELCO----------------
--10ma pestaÃ±a Visa Dinelco
--Visa DINELCO
select cast(TO_DATE(cast(lfectr as varchar(8)),'YYYYMMDD')as date) AS FECHA,lerrnb , lhortr,lenemi,lctaor, SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta, lidcom, lcodtr,  lcomtr, limpgs, lesttr, lcretr
from libdebito.drconbep 
where lfectr between '20210526' and '20210526' 
and lnrtar like '488234%'
--and lcretr ='05' and lhortr between '192300' and '204700' 
--and lnrtar like '443077%'
--and lnrtar like '627431%' 
--and lnrtar like '%4810'
--and lnrtar like '422411%' --627431 bin credivill
--and lcretr in ('91')
--and lhortr between '000000' and  '011000'
--and lnrtar like '092%'
order by lhortr desc






----------------PROCARD------------------------
--11va pestaÃ±a Procard
--VER TRANSACCIONES POR INICIO DE HORA RECHAZADAS DE PROCARD
select cast(TO_DATE(cast(lfectr as varchar(8)),'YYYYMMDD')as date) AS FECHA,lhortr as Hora,lerrnb as Referencia,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lcodtr, lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lenemi as Emisor, lcretr as Retorno from libdebito.drconbep
where lfectr between '20210526' and '20210526' and lenemi='510'  --and lcretr in ('92','19','88','05','91','57','96','60')
--and substr(lidtra,1,1) = 'P' --EN POS
--and lnrtar like '499831%'
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





---------------------VSA EMISOR--------------
--12ava pestaÃ±a VISA Emisor
--Debito Continental
select cast(TO_DATE(cast(lfectr as varchar(8)),'YYYYMMDD')as date) AS FECHA,lerrnb as Refe_BEPSA, lhortr as Hora,lenemi as Emisor, SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,b.virol, lidcom,b.vif044rmsg mensaje,lcodbc MARCA, lcodtr,  lcomtr as Comercio, limpgs as Monto, lesttr, lcretr as COD_RET
from libdebito.drconbep inner join visa.vistrndta b on lerrnb=virrnbepsa
where lfectr between '20210526' and '20210526' 
--and lcodbc='VSA' --and codmar='VISA'
--and lnrtar like '456976%'
--and substr(lidtra,1,1) = 'P' --EN POS
--and lnrtar like '488234%'
--and lenemi in ('015','020','540')
--and lenemi like '510'
--and lnrtar like '415784%'
--and lcodbc='VSA' and lenemi in ('540')3
--and lcretr ='05' and lhortr between '192300' and '204700' 
--and lnrtar like '703020%'
--and lnrtar like '%2845'
--and lcretr in ('04')
--and lhortr between '000000' and  '011000'
--and lnrtar like '092%'
--and virol = 'ADQ'
--AND substr(vipannmbr, 1,6) = '456976' --VISA CONTI
--AND substr(vipannmbr, 1,6) = '488234'-- VISA BNF
and lhortr>140000
order by lhortr desc;




--- VISA EMISOR Y ADQ
/* select lfectr fecha_real,lhortr hora,substr(lerrnb,2,13) refencia,lnrtar tarje_trx,b.vipannmbr tarje_visa,b.virol,b.vif044rmsg mensaje,lcodbc MARCA,lenemi entidad,
lesttr estado,lcretr cod_retorno,lcodtr cod_trx,limpgs importe,lidcom cod_comercio,
lcomtr comercio,leca62 POSATM,substr(lidtra,1,1) Origen
from libdebito.drconbep inner join visa.vistrndta b on lerrnb=virrnbepsa
where lfectr between '20210526' and '20210526 '
--and virol = 'ADQ'
--AND substr(vipannmbr, 1,6) = '456976' --VISA CONTI
--AND substr(vipannmbr, 1,6) = '488234'-- VISA BNF
order by lhortr desc*/







-------------ADQ MST-----------------------
--13va pestaÃ±a ADQ MST
--MASTERCARD
select cast(TO_DATE(cast(lfectr as varchar(8)),'YYYYMMDD')as date) AS FECHA,lhortr, lerrnb,lidcom,lcomtr,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,pdescricion as Marca_tarjeta,limpgs,lesttr,lcretr,lenemi,lcodbc, lhisde as Respondido_Por 
from libdebito.drconbep
--inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
--right join libdebito.tbcret0p on lcretr = codnro
inner join libdebito.tbinproc on pbin=lbinpr
where lfectr between '20210526' and '20210526' and lenemi in ('530','560','570','590') --and lnrtar like '627431%' --and lcretr in ('96','91','XD','92','94', '60')
--and lenemi in ('570')
--and lcodbc IN 'MST'
--and lnrtar like '230671%'
--and pdescricion like '%ITAU%'
--and lcretr in ('96','91','00','92','94', '60','88','01','96')
--and lhortr between '080200' and  '101000'
--and lnrtar like '516400%'
--and lnrtar like '601638%' 
--and lnrtar like '606257%' -- banco basa
--and lnrtar like '601637%' -- banco sudameris
--and lcretr in '91'
--and lcretr in ('91','96')--,'96','92','94','57', '60')
order by lhortr desc  








---------------------MST EMISOR-----------------------
--14va pestaÃ±a MST Emisor
select cast(TO_DATE(cast(lfectr as varchar(8)),'YYYYMMDD')as date) AS FECHA ,lhortr hora,substr(lerrnb,2,13) referencia, lnrtar tarje,--b.mcpannmbr tarje_mast,
lbinpr bin,d.pdescricion descrip_marca,lcodbc MARCA,lenemi entidad,lcomtr  as Comercio,
lesttr estado,lcretr cod_retorno,lcodtr cod_trx,c.txdtrx descrip_trx,limpgs importe,lidcom cod_atm,substr(leca62,1,4) atm,b.mcrol rol,b.mcmti estado_mc,b.mcf044rmsg mensaje
from libdebito.drconbep inner join mastercard.mastrndta b on lerrnb=MCRRNBEPSA inner join LIBDEBITO.TBCTRA0P c on c.TXCTRX = lcodtr
inner join libdebito.tbinproc d on lbinpr=pbin
--and lbinpr in ('542927','230671','530399', '514848')
where lfectr between '20210526' and '20210526' --and lcretr='80'
and mcrol='ISS'
--and lhortr between '110000' and '122800'
--and lcodtr in ('011000','012000')--and b.mcrrnbepsa='010663493281'
--and lerrnb in ('018585048041','018585048733','018585049732','018585051004','018585051941','018585052639','018585054178')
order by lhortr desc


------------------------JPOS------------------
SELECT cast(TO_DATE(cast(lfectr as varchar(8)),'YYYYMMDD')as date) AS FECHA,lhortr HORA,/*SUBSTR(lnrtar,1,6) || 'XXXXXX' ||SUBSTR(lnrtar,13,4) TARJE*/lnrtar tarje,lexpir VTO,lbinpr bin,lctaor,lctade
lbcodb,LENEMI ENTIDAD, lcored ,LCODBC MARCA,/*,pdescricion MARCA*/
lesttr ESTADO,lcretr COD_RETORNO,lcodtr COD_TRX,limpgs IMPORTE,lcotel celular,--coddes DESCRIP_RET,--lbinpr BIN,--
lerrnb REFE_BEPSA, lidcom COD_COMER,lcomtr LOCAL_COMER, /*txdtrx DESC_TRX,*/LECA62 version_pos,lactfj cod_act,lcautr cod_aut--LNFISC,LPOSEM,LMCCTR,LNFACT--,lntoke--, enemiso BANCO,tgdesc DESCRIPCION
from libdebito.drconbep --inner join libdebito.tbinproc on lbinpr=pbin
WHERE lfectr BETWEEN '20210526' AND '20210526'
and substr(leca62,9,10) like ('%J%')
--and lhortr>140000
--and lnrtar like '703002%'
and lbinpr like '627431'
--and lcretr like '57'
--and lnrtar like '456976%'
order by lhortr desc


----------------------RCHXxBIN--------------------
-------- /*RECHAZOS AGRUPADOR POR BIN */ ---------------      
                            
select cast(TO_DATE(cast(lfectr as varchar(8)),'YYYYMMDD')as date) AS FECHA,lbinpr bin, bindsbin Marca_tarjeta,lcodbc MARCA,lcretr cod_retorno,count(*) Cantidad
from libdebito.drconbep inner join gxtrjdta.tdgbin on lbinpr=substr(binnrobin,1,6)
where lfectr between '20210526' and '20210526'
and lcodbc='MST' and lcretr='91'
and lhortr between '140000' and '230000'
GROUP BY lfectr,lbinpr, bindsbin,lcodbc,lcretr;







------------------ TRX X HORA--------------------------

--TRX x Hora
select substr((lhortr + 10000000),3,2) Hora, count(*) Cant, sum(limpgs) Importe
from libdebito.drconbep where lfectr between '20210526' and '20210526'
--and lcodtr in ('567102')
--and substr(lidtra,1,1) = 'T' --EN ATM
--and substr(lidtra,1,1) = 'P' --EN POS
group by substr((lhortr + 10000000),3,2) order by substr((lhortr + 10000000),3,2) desc


-----------------------COMERCIOS-------------------------

select cast(TO_DATE(cast(lfectr as varchar(8)),'YYYYMMDD')as date) AS FECHA, lfcotr Fecha_Comer,lbinpr bin, lhortr Hora, lctaor C_I, lctade, lcotel AS NUMERO, lidcom Cod_Comer,leca62 as Modelo, lcomtr Comercio, limpgs Monto, lcodtr Transaccion, LCRETR Retorno,lcodbc,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS TARJETA,lnrtar from libdebito.drconbep
where lfectr between '20210526' and '20210526'
--and lctade like '%371856833' --num referencia
and lbinpr like '484899%'
--and substr(lidtra,1,1) = 'P' --EN POS
--and lcodtr in '014000'
--and leca62 like 'VX0675_v10%'
--and leca62 <> 'VXEVOCV%'
--and limpgs like '250000'
--and lidcom like '%700199'
--and lcautr like '017517' --cod autori
--and lcomtr like 'SUPERSEIS%'
--and lnrtar like '7030020133368011'
--and lcotel in '0991364279' --telefono
--and lcomtr like 'BIGGIE%'
--and lctade in ''
--and lcodtr in  ('370000','380000','390000') 
order by lhortr desc





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

 ---CONSULTA DE SALDO EN TARJETAS GOURMET -- ROLANDO  
select mcdisco saldo,mcnumta tarjeta from gxbdbps.tmctaaf 
where mcnumta='6274311550003435'

---CONSULTA DE SALDO EN TARJETAS GOURMET -- ENZO
select mcdisco saldo,mcnumta tarjeta from gxbdbps.tmctaaf       
where mcnumta='6274311550002635'

---CONSULTA DE SALDO EN TARJETAS GOURMET -- ARMA
select mcdisco saldo,mcnumta tarjeta from gxbdbps.tmctaaf       
where mcnumta='6274311550003021'

select * from gxbdbps.tmctaaf 

SELECT *
FROM INFORMATION_SCHEMA.TABLES

SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE gxbdbps.tmctaaf = ''


show databases;



declare hortr datetime
Set hortr=GETDATE()
Select CONVERT(varchar,hortr,8) as [hh:mm:ss]


cast( {Lhortr} as time)

cast(TO_TIME(cast(lhortr as datetime(8)),'hh:mm:ss')as time) AS HORA