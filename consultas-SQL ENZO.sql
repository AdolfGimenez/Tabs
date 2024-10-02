--VER TRANSACCIONES POR INICIO DE HORA RECHAZADAS DE PROCARD
select lfectr as Fecha,lhortr as Hora,lerrnb as Referencia,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta, lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno from libdebito.drconbep
where lfectr between '20201023' and '20201023' and lenemi='510'  --and lcretr in ('92','19','88','05','91','57','96','60')
--and lhortr > '63000'--'91','XD','92')
--and lcretr <> '00' and lcretr <> '55' and lcretr <> '51' --rechazos
--and lhortr between '110000' and  '120000'
--and lcretr in ('92', '91') 
--and ,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta '4430761400004536'
order by lhortr desc


	--VER TRANSACCIONES POR INICIO DE HORA RECHAZADAS DE PROCARD
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,
lbinpr as Bin ,lcodbc as Marca ,limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,lbcocr ,leca62 ,loritr as ATM_POS,lerrnb as Referencia 
from libdebito.drconbep 
where lfectr between '20201023' and '20201023' and lbinpr in ('443078','443077') --and lenemi='510' --and lcretr in ('00','XD','19','92')-- and lcretr in ('92','00','05') -- and lhortr > 000700 -- and lcodbc in ('VSA') --
order by lhortr desc 
 
-- DINELCO BNF--4642593614***4259361409097918--4259361409097918
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr from libdebito.drconbep
where lfectr between '20201023' and '20201023' and lnrtar like '703002%' --and lcretr in ('96','91','XD','92','94', '60')
--and lnrtar like '425936%'
order by lhortr desc 

-- Continental
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr from libdebito.drconbep
where lfectr between '20201023' and '20201023' and lnrtar like '703020%' --and lcretr in ('96','91','XD','92','94', '60')
order by lhortr desc 

-----------------------------------------
--VER TRANSACCIONES POR INICIO DE HORA RECHAZADAS DE Cabal
select lfectr as Fecha,lhortr as Hora,lerrnb as Referencia,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta, lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno from libdebito.drconbep
where lfectr between '20201023' and '20201023' and lenemi='512'  --and lcretr in ('92', '88','19','00','05','91','57','96')--and lhortr > '63000'--'91','XD','92')-- and lcretr in ('96','91','XD','92') and ,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta '4430761400004536'
order by lhortr desc

----------------------------------------
--verificar trx tigo handlerWS-- SIN TARJETA
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lcotel,lnrtar,limpgs,lesttr,lcretr from libdebito.drconbep
where lfectr between '20201023' and '20201023' and lnrtar like '627431581%' --and lcretr in ('96','91','XD','92','94', '60')
order by lhortr desc 

--verificar tigo companion-- CON TARJETA
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr from libdebito.drconbep
where lfectr between '20201023' and '20201023' and lnrtar like '627431152%' --and lcretr in ('96','91','XD','92','94', '60')
order by lhortr desc

------------370 carga , 380 retiro, 390 giro----------------
select lfectr,lhortr,lerrnb,lidcom,lcomtr,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,limpgs,lesttr,lcretr, lcodtr codtrx from libdebito.drconbep
where lfectr between '20201023' and '20201023' and lcodtr in  ('380000','370000','390000') 
--and lcomtr like 'BIGGIE EXPRESS%'
--and lcretr in ('61') 
order by lhortr desc   

--VISA
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr ,lcodbc from libdebito.drconbep
where lfectr between '20201023' and '20201023' --and lnrtar like '488234%' 
--and lenemi='510' --VISA Procard
and lcodbc IN 'VSA'
--and lnrtar like '443078%'
--and lnrtar like '%3892'
--and lcretr in ('96','91','00','92','94', '60','88','01','96')
--and lhortr between '110200' and  '131000'
--and lcretr <> '00'
--and lcretr in ('05','91')--,'96','92','94','57', '60')
order by lhortr desc 


--MASTERCARD
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr,lcodbc from libdebito.drconbep
where lfectr between '20201023' and '20201023' --and lnrtar like '601638%' --and lcretr in ('96','91','XD','92','94', '60')
and lcodbc IN 'MST'
--and lcretr in ('96','91','00','92','94', '60','88','01','96')
--and lhortr between '110200' and  '131000'
--and lnrtar like '516400%'
--and lcretr in '05'
--and lcretr <> '00'
--and lcretr in ('05','91')--,'96','92','94','57', '60')
order by lhortr desc 

 -------------------------------------------------------------------------------------------------------------------
--Visa DINELCO
select lfectr,lerrnb , lhortr,lenemi, SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta, lidcom, lcomtr, limpgs, lesttr, lcretr
from libdebito.drconbep 
where lfectr between '20201023' and '20201023' 
--and lnrtar like '425936%'
--and lnrtar like '456976%' 
and lnrtar like '488234%'
--and lnrtar like '092%'
order by lhortr desc

---------------CICO TIGO
select lfectr,lhortr,lerrnb,lidcom,lcomtr,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,limpgs,lesttr,lcretr, lcodtr codtrx from libdebito.drconbep
where lfectr between '20201023' and '20201023' and lcodtr in  ('380000','370000','390000') 
order by lhortr desc  

-------------------------------------------------------------------------------------------------------------------
--verificar personal--
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,leca62,lcretr from libdebito.drconbep
where lfectr between '20201023' and '20201023' and lnrtar like '627431571%' order by lhortr desc 


---------------------------------------------------------------------------------------------------------------
select ---count (*)
*from libdebito.drconbep
where lfectr between '20201023' and '20201023'
and lcretr='55'
and SUBSTR(LNRTAR,1,6) IN ('443078')
order by lhortr desc
----------------------------------------------------------------------------------------------------------------      
--verificar trx por comercio--
select lfectr, lhortr, lnrtar, lidcom, lcomtr, limpgs, lcretr, lesttr from libdebito.drconbep
where lfectr between '20201023' and '20201023' and lidcom='9099248' order by lhortr desc; and limpgs = '140000'  and substr(lidtra,1,1) = 'T' and lhortr between '073000' and '080000'
----------------------------------------------------------------------------------------------------------------
--USUARIOS TIGO MONEY
select * from roshkalib.m_usuarios
where numero_celular = '0981343156'

------------------------------------------------------------------------------------------------------------------
---TRX DE UN COMERCIO EN ESPECÍFICO 
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr from libdebito.drconbep
where lfectr between '20200304' and '20200304' and lidcom='1001598' order by lhortr desc 
-------------------------------------------------------------------------------------------------------------------
select lfectr, lhortr, lnrtar, lidcom, lcomtr, limpgs, lcretr, lesttr
from libdebito.drconbep 
where lfectr between '20201023' and '20201023' and lnrtar like '627431581%' order by lhortr desc
------------------------------------------------------------------------------------------------------------------- 
--PARA VER UN CÓDIGO DE RETORNO EN ESPECÍFICO
select lfectr, lhortr, lnrtar, lexpir, lcodbc, lidcom, lcomtr, limpgs, lcretr, lesttr
from libdebito.drconbep 
where lfectr='20201023'
--and SUBSTR(LNRTAR,1,6) IN ('703002')
and lcretr='xd' 
order by lhortr desc 
------------------------------------------------------------------------------------------------------------------- 
select lfectr, lhortr, lnrtar, lidcom, lcomtr, limpgs, lcretr, lesttr, substr(leca62,1,2)
from libdebito.drconbep 
where lfectr='20190213'
and substr(leca62,1,2)='XV'
order by lhortr desc

-------------------------------------------------------------------------------------------------------------------
select lfectr, lhortr, lnrtar, lexpir, lcodbc, lidcom, lcomtr, limpgs, lcretr, lesttr 
from libdebito.drconbep  
where lnrtar='0981343156'
and lfectr between '20191107' and '20191107' 
order by lfectr, lhortr desc
-------------------------------------------------------------------------------------------------------------------
-- COOPERATIVA CAPIATA
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr from libdebito.drconbep
where lfectr between '20201023' and '20201023' and lnrtar like '627431107%' order by lhortr desc 
-------------------------------------------------------------------------------------------------------------------
-- COOPERATIVA MBURICAO
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr from libdebito.drconbep
where lfectr between '20201023' and '20201023' and lnrtar like '627431113%' order by lhortr desc 
-------------------------------------------------------------------------------------------------------------------
--COOPERATIVA YPAKARAI
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr from libdebito.drconbep
where lfectr between '20201023' and '20201023' and lnrtar like '627431103%' order by lhortr desc 
-------------------------------------------------------------------------------------------------------------------
--VER TRANSACCIONES POR INICIO DE HORA RECHAZADAS DE PROCARD
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar, lbinpr, lcodbc, limpgs,lesttr,lcretr from libdebito.drconbep
where lfectr between '20191113' and '20191113' and lenemi='510' --and lcretr in ('60')--and lhortr > '63000'--'91','XD','92')-- and lcretr in ('96','91','XD','92') order by lhortr desc
order by lhortr desc 
-----------------------------------------------------------------------------------------------------------------
--COOPERATIVA YPAKARAI
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr from libdebito.drconbep
where lfectr between '20201023' and '20201023'-- and lnrtar like '62743100%' 
and lenemi= '310'
order by lhortr desc 
-------------------------------------------------------------------------------------------------------------------
--VER TRANSACCIONES POR INICIO DE HORA RECHAZADAS DE PROCARD por hora
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar, lbinpr, lcodbc, limpgs,lesttr,lcretr from libdebito.drconbep
where lfectr between '20191113' and '20191113' and lenemi='510'-- and lcretr in ('XD','92')--and lhortr > '100000' and lcretr > '130000'
--and lhortr between '205000' and  '2119000'
order by lhortr desc
-------------------------------------------------------------------------------------------------------------------
--TABLA DE BINES
select * from libdebito.tbinproc
where pbin = '109910'
------------------------------------------------------------------------------------------------------------------
--VER TRANSACCIONES POR INICIO DE HORA APROBADAS
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lbinpr,lcodbc, lcretr from libdebito.drconbep
where lfectr between '20201023' and '20201023' and lenemi='510' -- and lcretr in ('12') --and lhortr > '60000'
order by lhortr desc

select * from libdebito.drconbep
where lfectr between '20180602' and '20180602' and lidcom='0700138' order by lhortr desc 
-------------------------------------------------------------------------------------------------------------------
select lfectr, lhortr, lnrtar, lidcom, lcomtr, limpgs, lcretr, lesttr
from libdebito.drconbep 
where lfectr between '20190728' and '20190728' and lnrtar like '627431581%' order by lhortr desc
------------------------------------------------------------------------------------------------------------------- 
select lfectr, lhortr, lnrtar, lexpir, lcodbc, lidcom, lcomtr, limpgs, lcretr, lesttr
from libdebito.drconbep 
where lfectr='20180818'
and lcretr='XD' order by lhortr desc 
------------------------------------------------------------------------------------------------------------------- 
select lfectr, lhortr, lnrtar, lidcom, lcomtr, limpgs, lcretr, lesttr, substr(leca62,1,2)
from libdebito.drconbep 
where lfectr='20201023'
and substr(leca62,1,2)='SP'
order by lhortr desc
------------------------------------------------------------------------------------------------------------------
--verificar trx tigo money--
select lfectr, lhortr, lnrtar, lexpir, lcodbc, lidcom, lcomtr, limpgs, lcretr, lesttr
from libdebito.drconbep 
where lfectr between '20201023' and '20201023'
--and lcretr='XD'
and SUBSTR(LNRTAR,1,6) IN ('589657')
order by lhortr desc 	
------------------------------------------------------------------------------------------------------------------
--verificar trx tigo moneyNOO--
select * from libdebito.drconbep
where lfectr between '20181215' and '20181215' and lnrtar like '627431581%' order by lhortr desc 	
-----------------------------------------------------------------------------------------------------------------
--verificar trx tigo handlerWS--
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr from libdebito.drconbep
where lfectr between '20201023' and '20201023' and lnrtar like '627431581%' order by lhortr desc 
-----------------------------------------------------------------------------------------------------------------
--verificar tigo companion--
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr from libdebito.drconbep
where lfectr between '20201023' and '20201023' and lnrtar like '627431152%' order by lhortr desc

 ------------------------Verificar XD--------------------------------------------------------------------------------- 
select lfectr, lhortr, lnrtar, lexpir, lcodbc, lidcom, lcomtr, limpgs, lcretr, lesttr
from libdebito.drconbep 
where lfectr='20201023'
and lcretr='XD' order by lhortr desc 


-------------------------------
--RECHAZOS Y CONTADOR CABAL 
select lfectr AS FECHA , lcodbc AS MARCA,lcretr AS RETORNO, loritr as ATM_POS,lexpir, lesttr AS ESTADO, COUNT(*) CANTIDAD
from libdebito.drconbep 
where lfectr='20201023'  --and lcodbc in 'MST' and lesttr = 'A'
and lcodbc IN 'VSA'
and lcretr ='05' and lhortr between '192300' and '204700' 
--and lcretr in ('92','19')--,'88','00')
GROUP BY Lfectr, lcodbc, lesttr , lcretr,loritr 

---------------------------------------------------------------------------------------------------------------------------
select lfectr AS FECHA , lcodbc AS MARCA, lbinpr as Bin, lcretr AS RETORNO, lesttr AS ESTADO, COUNT(*) CANTIDAD
from libdebito.drconbep 
where lfectr='20191216' and lhortr between '144000' and '181600' 
and lcretr in ('01','91') --and lbinpr in ('443078','443077')
and lnrtar like '627431152%'
and lnrtar like '627431581%'
GROUP BY Lfectr, lcodbc, lesttr , lcretr, lbinpr 

---------------------------------------------------------
 
--Bucador de Consultas--
select LECA62 NO_ATM, LCOMTR NOMBRE, COUNT(LECA62) CANT_TX
from libdebito.drconbep
where lfectr = '20201023'
  and substr(LECA62,1,1)='T'
  and substr(lhortr,1,2) = HOUR(CURRENT_TIME)
            and lcodtr = '301000'-- Consulta de Saldo
GROUP BY LECA62, LCOMTR
ORDER BY CANT_TX DESC 


------------------------TRANSACCIONES ATM-CENTRE -------------------------------------------------------------------------
	select lfectr as FECHA,lhortr as HORA,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS TARJETA,lcodbc AS TIPO,leca62 As ATM,lcomtr as NOMBRE_ATM,limpgs as MONTO,lcretr as RETORNO, lesttr as ESTADO from libdebito.drconbep
	where leca62 = 'T323' --and 'T500'
	--between 'T001' and 'T500'
	and lfectr='20201023'
	--('T011','T026','T070','T454','T370','T403','T408','T420','T461','T462','T001','T415','T423','T424','T441','T405','T410','T461', 'T210','T115')
	--and lfectr between '20200127' and '20201023'
	--and lesttr='R'
	--and lcodbc IN 'Bi'
	--and lnrtar like '%9203'   --para buscar por tarjeta ultimos 4
	--and lnrtar like '6274%'
	--and lhortr between '195000' and  '211900'
	--and lcretr='00'
	--and lcretr <>'00'
	--and lcomtr='ATM SUC.BNF P.J.CABALLERO 4'
	order by lhortr desc
	--order by lidtra asc

	 
------------------------Revertidas ATM-CENTRE -------------------------------------------------------------------------
	select lfectr as FECHA,lhortr as HORA,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS TARJETA,lcotel Nume_Tell, lcodbc AS TIPO,leca62 As ATM,lcomtr as NOMBRE_ATM,limpgs as MONTO,lcretr as RETORNO, lesttr as ESTADO from libdebito.drconbep
	--where substr(lidtra,1,4) --in 'T099' 
	where leca62 between 'T001' and 'T521'
	--('T011','T026','T070','T454','T370','T403','T408','T420','T461','T462','T001','T415','T423','T424','T441','T405','T410','T461', 'T210','T115')
	--and lfectr='20201023'
	and lfectr between '20201023' and '20201023'
	--and lcodbc IN 'BIL'
	--and lesttr='R'
	--and lcretr<>'00'
	--and lcodbc IN 'Bi'
	--and lnrtar like '%7994'   --para buscar por tarjeta ultimos 4
	--and lnrtar like '4568%'
	and lhortr between '000000' and  '031000'
	--and lcretr in ('55')
	order by lhortr desc
	--order by lidtra asc

------------------------TRANSACCIONES Contraloría -------------------------------------------------------------------------
	select lfectr as FECHA,lhortr as HORA,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS TARJETA,lcodbc AS TIPO,leca62 As ATM,lcomtr as NOMBRE_ATM,limpgs as MONTO,lcretr as RETORNO, lesttr as ESTADO from libdebito.drconbep
	where substr(lidtra,1,4) in 'T362' --and 'T500'
	and lfectr='20201023'
	--and lnrtar like '%2249'   --para buscar por tarjeta ultimos 4
	order by lhortr desc
	--------------------------
	
--Consulta de transacciones (37000-Carga),(38000-Giro),(39000-Retiro)
select lfectr Feha, lfcotr Fecha_Comer, lhortr Hora, lctaor C_I, lctade Num_Ref
, lcotel Nume_Tell, lidcom Cod_Comer, lcomtr Comercio, limpgs Monto
, lcodtr Transaccion, LCRETR Retorno from libdebito.drconbep
where lfectr between '20201023' and '20201023'
--and lctade like '%335754493' --num referencia
and lidcom='0700445'
--and lcotel in '0981524130' --telefono
--and lctade in ''
--and lcodtr in  ('370000','380000','390000') 
order by lhortr desc


********************************************************************
select pidstat, count(pidstat) from gxbdbps.atmcpid
group by pidstat 
--STRSQL
--RUNQRY *N AIT003
--WRKOBJLCK OBJ(GXBDBPS/AIT001) OBJTYPE(*FILE) 

****************************************************************


--detalle de transacciones tigo money y billetera personal
select lfectr fecha_real,lhortr hora ,lnrtar tarj,lerrnb refencia,lesttr estado,lcretr cod_retorno,lcodtr cod_trx,limpgs importe,lidcom cod_atm,lcomtr comercio,
lactfj Activo,leca62 Version,lcotel linea_cel
--select count(*) Cantidad,lcretr Cod_Retorno,lesttr Estado, lbinpr BIN ,limpgs importe,substr(lidtra,1,1) Origen
--select *
from libdebito.drconbep where lfectr between '20200411' and '20200411'
and lenemi in ('571','581')
--and lcodtr in ('000052','567102')
--and lesttr='A'
and limpgs>1
order by lhortr desc


/*resumen de transacciones tigo money y billetera personal
000052 Tigo Money, 567102 Billetera personal*/
select count(*) Cantidad,lcretr Cod_Retorno,lesttr Estado,lcodtr COD_TRX ,SUM(limpgs) importe,substr(lidtra,1,1) Origen
from libdebito.drconbep where lfectr between '20201023' and '20201023'
--and lenemi in ('571','581')
--and lcodtr in ('000052','567102')
--and lesttr='A'
and limpgs>1
group by lcretr,lesttr,lcodtr,substr(lidtra,1,1)
order by cantidad desc

/*resumen de transacciones tigo money y billetera personal ver si sube.
000052 Tigo Money, 567102 Billetera personal*/
select count(*) Cantidad,lcretr Cod_Retorno,lesttr Estado,lcodtr COD_TRX ,SUM(limpgs) importe,substr(lidtra,1,1) Origen
from libdebito.drconbep where lfectr between '20201023' and '20201023'
and lenemi in ('571','581')
--and lcodtr in ('000052','567102')
and lesttr='A'
and limpgs>1
and substr(lidtra,1,1)='P' --descomentar  solo si quieren saber de pos
group by lcretr,lesttr,lcodtr,substr(lidtra,1,1)
order by cantidad desc 

--*************************************
select lfectr fecha,count(*) Cantidad,lcretr Cod_Retorno,lesttr Estado,lcodtr COD_TRX ,SUM(limpgs) importe,substr(lidtra,1,1) Origen
from libdebito.drconbep where lfectr between '20201023' and '20201023'
--and lenemi in ('571','581')
and lcodbc IN 'VSA'
and lcretr ='05' and lhortr between '192300' and '204700' 
--and lcodtr in ('000052','567102')
--and lesttr='A'
and limpgs>1
group by lfectr,lcretr,lesttr,lcodtr,substr(lidtra,1,1)
order by cantidad desc
--------------------------------------------------
--Visa Emisor
SELECT lfectr FECHA,lfcotr fecha_com,lhortr HORA,/*SUBSTR(lnrtar,1,6) || 'XXXXXX' ||SUBSTR(lnrtar,13,4) */
lnrtar TARJE,LENEMI ENTIDAD, LCODBC MARCA,lhisde Destino,/*,pdescricion MARCA*/
lesttr ESTADO,lcretr COD_RETORNO,--coddes DESCRIP_RET,
lbinpr BIN,--,pdescricion MARCA_ENTIDAD,
lerrnb REFE_BEPSA, lidcom COD_COMER,lcomtr LOCAL_COMER,limpgs IMPORTE,LNFACT AS PAIS, LPOSEM AS ENTRADA,
lcodtr COD_TRX,leca62 Version_Pos,LNFISC cod_adq_bepsa
from libdebito.drconbep
WHERE lfectr BETWEEN '20201023' AND '20201023' --and lhortr between '200500' and '210000' --and lenemi in ('015','020') --and lcretr in ('00','05','91')--and substr(lidtra,1,1) = 'T'--and lhortr between '140500' and '142200'
and lcodbc='VSA'
and lnfisc='422745'
order by lhortr desc

 


--Visa Adquiriente--
SELECT lfectr FECHA,lfcotr fecha_com,lhortr HORA,/*SUBSTR(lnrtar,1,6) || 'XXXXXX' ||SUBSTR(lnrtar,13,4) */
lnrtar TARJE,LENEMI ENTIDAD, LCODBC MARCA,lhisde Destino,/*,pdescricion MARCA*/
lesttr ESTADO,lcretr COD_RETORNO,--coddes DESCRIP_RET,    
lbinpr BIN,--,pdescricion MARCA_ENTIDAD,
lerrnb REFE_BEPSA, lidcom COD_COMER,lcomtr LOCAL_COMER,limpgs IMPORTE,LNFACT AS PAIS, LPOSEM AS ENTRADA,
lcodtr COD_TRX,leca62 Version_Pos,LNFISC cod_adq_bepsa
from libdebito.drconbep
WHERE lfectr BETWEEN '20201023' AND '20201023' --and lhortr between '200500' and '210000' and lcretr in ('05','91') --and substr(lidtra,1,1) = 'T'--
and lcodbc='VSA'
and lnfisc='422745' and lenemi in ('500')
order by lhortr desc
--

 

--VISA POR GRUPO 
select lfectr AS FECHA , lcodbc AS MARCA,lenemi EMISOR, lcretr AS RETORNO, lesttr AS ESTADO, COUNT(*) CANTIDAD
from libdebito.drconbep
where lfectr='20201023' 
--and lhortr between '000000' and  '011000'
and lcodbc='VSA'  and lcretr in ('04','14','00')
and lnfisc='422745'  --and lnrtar in ('456976%') --and lenemi in ('015','020','500')
GROUP BY Lfectr, lcodbc,LENEMI, lesttr , lcretr
order by lcretr desc
--
--Monitoreo Adquirencia Mastercard sin bines usar este 
select lfectr AS FECHA ,lhortr AS HORA, lcodbc AS MARCA,lenemi EMISOR,lesttr AS ESTADO, lcretr AS COD_RETORNO,leca62 As ATM,lcomtr as NOMBRE_ATM, coddes Descripcion_COD
from libdebito.drconbep
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join libdebito.tbcret0p on lcretr = codnro
where lfectr='20201023' and   lcodbc = 'MST' and codmar='MSTC'
and lenemi in ('530','560','570','590')
order by lhortr desc

 

--Visa de Emisor por grupo
select lfectr AS FECHA , lcodbc AS MARCA,lenemi EMISOR, COUNT(*) CANTIDAD,lesttr AS ESTADO, lcretr AS COD_RETORNO, coddes Descripcion_COD
from libdebito.drconbep
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join libdebito.tbcret0p on lcretr = codnro
where lfectr='20201023' and lcodbc='VSA' and lenemi in ('015','020')
GROUP BY Lfectr, lcretr, lcodbc,LENEMI,coddes, lesttr
order by lcretr asc, cantidad desc

 

--Visa Adquiriente --CON ATMS CON EMV ACTIVO por grupo
select lfectr AS FECHA , lcodbc AS MARCA,lenemi EMISOR, COUNT(*) CANTIDAD,lesttr AS ESTADO, lcretr AS COD_RETORNO, coddes Descripcion_COD
from libdebito.drconbep
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join libdebito.tbcret0p on lcretr = codnro
where lfectr='20201023' and lcodbc='VSA'
and lnfisc='422745' and lenemi in ('500')
GROUP BY Lfectr, lcretr, lcodbc,LENEMI,coddes, lesttr
order by lcretr asc, cantidad desc

 

--Adquirencia Mastercard por grupo
select lfectr AS FECHA , lcodbc AS MARCA,lenemi EMISOR, COUNT(*) CANTIDAD,lesttr AS ESTADO, lcretr AS COD_RETORNO, coddes Descripcion_COD
from libdebito.drconbep
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join libdebito.tbcret0p on lcretr = codnro
where lfectr='20201023' and   lcodbc = 'MST' and codmar='MSTC'
and lenemi in ('530','560','570','590')
--and lenemi='510'
GROUP BY Lfectr, lcretr, lcodbc,LENEMI,coddes, lesttr
order by lcretr asc, cantidad desc

 

--Visa ADQ Continental--por grupo
select lenemi emisor, ennombr ENTIDAD,lcretr cod_retorno,count(*) cantidad,sum(limpgs)
from libdebito.drconbep INNER JOIN gxbdbps.gentiaf ON (ENEMISO=LENemi)
WHERE lfectr BETWEEN '20201023' AND '20201023'
and lenemi='540'
group by lenemi,lcretr,ennombr
ORDER BY CANTIDAD DESC
--

 

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

 


--NUEVO SELECT DE VISA usr de adecion  y adc adquiriente 
select lfectr fecha_real,lhortr hora,substr(lerrnb,2,13) refencia,lnrtar tarje_trx,b.vipannmbr tarje_visa,lcodbc MARCA,lenemi entidad,
lesttr estado,lcretr cod_retorno,lcodtr cod_trx,limpgs importe,lidcom cod_comercio,
lcomtr comercio,b.virol,b.vif044rmsg mensaje
from libdebito.drconbep inner join visa.vistrndta b on lerrnb=virrnbepsa
where lfectr between '20201023' and '20201023'  --and lhortr between '160000' and '170000' 
--and lnrtar ='4882340010063886'
--and b.virrnbepsa='016278880939'
order by lhortr desc

 

-- Transaccion con Chip Y Banda
SELECT lfectr FECHA,lfcotr fecha_com,lhortr HORA,
lnrtar TARJE,LENEMI ENTIDAD, LCODBC MARCA,
lesttr ESTADO,lcretr COD_RETORNO,
lerrnb REFE_BEPSA, lidcom COD_COMER,substr(leca62,1,4) ATM,lcomtr LOCAL_COMER,limpgs IMPORTE,
lcodtr COD_TRX,lnfisc COD_ADQ_BPS,
(CASE WHEN LPOSEM in ('9010','9020','910','920') THEN 'BANDA MAGNETICA'
WHEN LPOSEM = '0510' THEN 'CHIP'
WHEN LPOSEM = '0710' THEN 'CONTACLESS' else 'VACIO' END) Tipo_lectura
from libdebito.drconbep
WHERE lfectr BETWEEN '20201023' AND '20201023'
and lcodbc='VSA'
and substr(lidtra,1,1) = 'T'
--and substr(lidtra,1,4) in ('T234') --por ATM
order by lhortr desc


/*CONSULTAS PARA MASTERCARD  EMISOR MASTRNDTA*/
/* reversion en progreso -reversiones automaticas* timeout en respuesta generada por atm */
select lfectr fecha_real,lhortr hora,substr(lerrnb,2,13) referencia, lnrtar tarje,--b.mcpannmbr tarje_mast,
lbinpr bin,d.pdescricion descrip_marca,lcodbc MARCA,lenemi entidad,
lesttr estado,lcretr cod_retorno,lcodtr cod_trx,c.txdtrx descrip_trx,limpgs importe,lidcom cod_atm,substr(leca62,1,4) atm,b.mcrol rol,b.mcmti estado_mc,b.mcf044rmsg mensaje
from libdebito.drconbep inner join mastercard.mastrndta b on lerrnb=MCRRNBEPSA inner join LIBDEBITO.TBCTRA0P c on c.TXCTRX = lcodtr
inner join libdebito.tbinproc d on lbinpr=pbin
--and lbinpr in ('542927','230671','530399')
where lfectr between '20201023' and '20201023' --and lcretr='80'
and mcrol='ISS'
--and lhortr between '110000' and '122800'
--and lcodtr in ('011000','012000')--and b.mcrrnbepsa='010663493281'
--and lerrnb in ('018585048041','018585048733','018585049732','018585051004','018585051941','018585052639','018585054178')
order by lhortr desc

--TRX x Hora
select substr((lhortr + 10000000),3,2) Hora, count(*) Cant, sum(limpgs) Importe
from libdebito.drconbep where lfectr between '20201023' and '20201023'
--and lcodtr in ('567102')
--and substr(lidtra,1,1) = 'T' --EN ATM
and substr(lidtra,1,1) = 'P' --EN POS
group by substr((lhortr + 10000000),3,2) order by substr((lhortr + 10000000),3,2) desc


--ADQ MST EN FORTIS
SELECT lfectr FECHA,lfcotr fecha_com,lhortr HORA,lnrtar TARJE,
LENEMI ENTIDAD, LCODBC MARCA,lhisde Destino,
--SELECT lfectr FECHA,lhortr HORA, lntoke, LCODBC MARCA,pdescricion MARCA*/
lesttr ESTADO,lcretr COD_RETORNO,limpgs IMPORTE, lcomtr ATM_COMER,--pdescricion MARCA_tarjeta,
lcautr cod_autorizacion,lerrnb REFE_BEPSA,lidcom COD_COMER,
lcodtr COD_TRX,lactfj ATM_Pos,lcotel,lcored,lcpace,LNFISC,LPOSEM,LMCCTR,LNFACT,lctaor, LNFISC--,lntoke--, enemiso BANCO,tgdesc DESCRIPCION
--select lfectr fecha_real,lcretr cod_retorno,count(*)cantidad,lbinpr bin
--select lfectr fecxha,substr(lidcom,5,7) cajero,count(*) cant,lesttr retorno,lcretr estado,lbinpr bin
--select count(*)
from libdebito.drconbep-- inner join libdebito.tbinproc on lbinpr=pbin
WHERE lfectr BETWEEN '20201023' AND '20201023'
--and lidcom='0702069'
and lcomtr like 'FORTIS%'
and lenemi='530'
and substr(lidtra,1,1)='P'
order by lhortr desc


------------Comercios, reversa de giros,etc
select lfectr Feha, lfcotr Fecha_Comer, lhortr Hora, lctaor C_I, lctade, lcotel AS NUMERO, lidcom Cod_Comer,leca62 as Modelo, lcomtr Comercio, limpgs Monto, lcodtr Transaccion, LCRETR Retorno,lcodbc,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS TARJETA,lnrtar from libdebito.drconbep
where lfectr between '20201023' and '20201023'
--and lctade like '%371856833' --num referencia
--and substr(lidtra,1,1) = 'P' --EN POS
--and lcodtr in '014000'
--and leca62 like 'VX0675_v10%'
--and leca62 <> 'VXEVOCV%'
--and limpgs like '250000'
--and lidcom like '%700199'
--and lcautr like '017517' --cod autori
--and lcomtr like 'SUPERSEIS%'
and lnrtar like '7030020133368011'
--and lcotel in '0991364279' --telefono
--and lcomtr like 'BIGGIE%'
--and lctade in ''
--and lcodtr in  ('370000','380000','390000') 
order by lhortr desc


--TRX Internacionales
select lfectr as Fecha,lhortr as Hora,lcomtr  as Comercio,lnrtar AS Tarjeta,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,loritr as ATM_POS,lcretr as Retorno ,lerrnb as Referencia,LNFACT AS PAIS,-- LPOSEM AS ENTRADA
CASE
  WHEN LPOSEM ='0710' THEN 'CONTACTLESS'
  WHEN LPOSEM ='0510' THEN 'CHIP'
  WHEN LPOSEM ='0910' THEN 'BANDA'
  WHEN LPOSEM ='0100' THEN 'INTERNET'
  WHEN LPOSEM ='051' THEN 'VER_BANDA'
  WHEN LPOSEM ='510' THEN 'VER_BANDA2'
  END AS MODO_ENTRADA
from libdebito.drconbep where lfectr between '20201023' and '20201023' --and lnrtar like '488234%' --AND LPOSEM  IN ('0100','0510')--traer por Internet y Chip
and lcodbc IN ('VSA'/*,'MST'*/)
--AND LPOSEM  IN ('0100','0510','0910','0710')
AND LNFACT <> 'PY' --AND LNFACT <> '0000000000' 
--AND LNFACT <> '  ' 
--and lhortr between '184600' and '234700'
--and lbinpr= '488234'
order by lhortr desc


--ADQ MST Resumen
select lfectr AS FECHA , lcodbc AS MARCA,lenemi EMISOR, COUNT(*) CANTIDAD,substr(lidtra,1,1) Origen,lesttr AS ESTADO, lcretr AS COD_RETORNO, coddes Descripcion_COD,CAST(SUM(limpgs)AS bigint) as Importe
from libdebito.drconbep
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join libdebito.tbcret0p on lcretr = codnro
where lfectr='20201023' and   lcodbc = 'MST' and codmar='MSTC'
and lenemi in ('530','560','570','590')
--and lcretr in '91'
--and lhortr between '080300' and '104700'
GROUP BY Lfectr, lcretr, lcodbc,LENEMI,coddes, lesttr,substr(lidtra,1,1)
order by substr(lidtra,1,1) desc, cantidad desc

--Visa ADQ Continental--
select lenemi emisor, ennombr ENTIDAD,lcretr cod_retorno,count(*) cantidad,cast(sum(limpgs)as int) Importe
from libdebito.drconbep INNER JOIN gxbdbps.gentiaf ON (ENEMISO=LENemi)
WHERE lfectr BETWEEN '20201023' AND '20201023'
and lenemi='540'
group by lenemi,lcretr,ennombr
ORDER BY COD_RETORNO ASC

--Usar este es con las condiciones Visa de Emisor 
select lfectr AS FECHA , lcodbc AS MARCA,lenemi EMISOR, COUNT(*) CANTIDAD,lesttr AS ESTADO, lcretr AS COD_RETORNO, coddes Descripcion_COD
from libdebito.drconbep
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join libdebito.tbcret0p on lcretr = codnro
where lfectr='20201023' and lcodbc='VSA' and lenemi in ('015','020')
and  codmar = 'VISA'
GROUP BY Lfectr, lcretr, lcodbc,LENEMI,coddes, lesttr
order by lcretr asc, cantidad desc

--trx x hora
select substr((lhortr + 10000000),3,2) Hora, count(*) Cant, sum(limpgs) Importe
from libdebito.drconbep where lfectr between '20201023' and '20201023'
--and lcodtr in ('567102')
and substr(lidtra,1,1) = 'T' --EN ATM
--and substr(lidtra,1,1) = 'P' --EN POS
group by substr((lhortr + 10000000),3,2) order by substr((lhortr + 10000000),3,2) desc

--claro--
select lfectr,lhortr,lerrnb,lidcom,lcomtr, lcotel,lctade,lnrtar,limpgs,lesttr,leca62,lcretr from libdebito.drconbep
where lfectr between '20201023' and '20201023' --and lnrtar like '627431571%' 
and lcodtr='000072'
--and lctade like '%0972129027%'
--and lidcom like '%702506'
--and lhortr between '121000' and  '130000'
--and lcotel = '0971655386'
--and lnrtar like '%685095%'
--and lctaor like '%971611158' 
order by lhortr desc



/*CONSULTAS PARA MASTERCARD  EMISOR MASTRNDTA*/
/* reversion en progreso -reversiones automaticas* timeout en respuesta generada por atm */
/*
select lfectr fecha_real,lhortr hora,substr(lerrnb,2,13) referencia, lnrtar tarje,--b.mcpannmbr tarje_mast,
lbinpr bin,d.pdescricion descrip_marca,lcodbc MARCA,lenemi entidad,lcomtr  as Comercio,
lesttr estado,lcretr cod_retorno,lcodtr cod_trx,c.txdtrx descrip_trx,limpgs importe,lidcom cod_atm,substr(leca62,1,4) atm,b.mcrol rol,b.mcmti estado_mc,b.mcf044rmsg mensaje
from libdebito.drconbep inner join mastercard.mastrndta b on lerrnb=MCRRNBEPSA inner join LIBDEBITO.TBCTRA0P c on c.TXCTRX = lcodtr
inner join libdebito.tbinproc d on lbinpr=pbin
--and lbinpr in ('542927','230671','530399')
where lfectr between '20201023' and '20201023' --and lcretr='80'
and mcrol='ISS'
--and lhortr between '110000' and '122800'
--and lcodtr in ('011000','012000')--and b.mcrrnbepsa='010663493281'
--and lerrnb in ('018585048041','018585048733','018585049732','018585051004','018585051941','018585052639','018585054178')
order by lhortr desc
*/

--COOPERATIVA Nemby
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20201023' and '20201023' and lnrtar like '627431110%'  and lenemi='110' 
order by lhortr desc

