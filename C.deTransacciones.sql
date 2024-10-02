			-- TARJETAS  MASTERCARD ADQ CODIGO DE PROCESO LENEMI 530
			select b.mcmti estado_mc, b.mcf044rmsg mensaje,lfectr fecha,lhortr hora, ptiptar TIP_TAR,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4)AS Tarjeta,lcautr as autori,LHISDE RESPONDE,limpgs As importe,lcretr retorno,lesttr ESTAD,b.mcrol rol,lbinpr bin,d.pdescricion descrip_marca,lcodbc MARCA,lenemi entidad,c.txdtrx descrip_trx,substr(leca62,1,4) atm,substr(lerrnb,2,13) refencia,lcodtr cod_trx,lidcom cod_atm
			from libdebito.drconbep inner join mastercard.mastrndta b on lerrnb=MCRRNBEPSA inner join LIBDEBITO.TBCTRA0P c on c.TXCTRX = lcodtr inner join libdebito.tbinproc d on lbinpr=pbin --and lcretr in ('91') --and lnrtar like '601638%'
			--and lbinpr in ('230671','') ---	and lcodtr IN ('000054','011000','012000')
			where lfectr between '20220127' and '20220127' and lenemi in ('530','560','590','570') and lhortr>080000 --and lcretr='91'
			order by lhortr desc;
			

--**************PROCARD*  CODIGO DE PROCESO LENEMI 510*************************02
			select lfectr FECHA,lhortr HORA,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta ,ptiptar TIP_TAR,limpgs MONTO,lesttr ESTADO,lcretr RETORNO,lbinpr Bin,
			pdescricion descrip_tarje,LCODBC MARCA,LENEMI COD_ENTIDAD,LHISDE RESPONDE,LORITR DISPOSITIVO, LNFACT PAIS,lactfj,lerrnb Cod_Ref from libdebito.drconbep inner join libdebito.tbinproc on pbin=lbinpr
			where lfectr between '20220127' and '20220127' and lcretr <> '13'-- and  lcodbc = 'MST'-- and lcodbc='UNI'-- and codmar='BEPS'---and lcretr in '91'--and lnrtar like '451902%'--and lcretr in '60' --and lcodbc='UNI' --AND LHORTR BETWEEN '125000'  and '173000'  --and lnfact > 'PY'-  --and lnrtar like '4569760000073001'
			--and lnrtar like '451902%'  --buscar por terminacion de la tarjeta   	                                                                                                                                                                                       
     and lhortr>080000 	and lenemi in ('510')order by lhortr desc;--	and lcretr in '09' --AND LENEMI='571'--and lhortr between '' and '133400'	
     

				--- VISA EMISOR Y ADQ CODIGO DE PROCESO LENEMI 015 VISA EMISOR BNF.020 VISA EMISOR CONTI.520 ADQ.VISA-----------03
select lfectr fecha_real,lhortr hora,limpgs importe,lcretr retorno,lesttr estado, ptiptar TIP_TAR,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta, pdescricion descrip_tarje,b.virol,b.vif044rmsg mensaje,lcodbc MARCA,lidcom cod_com,lcomtr comercio,lenemi entidad,lnfact as PAIS,
lcodtr cod_trx, coddes Descripcion_DEL_CODIGO,substr(lerrnb,2,13) refencia,b.vipannmbr tarje_visa,leca62 POSATM,substr(lidtra,1,1) Origen
from libdebito.drconbep inner join visa.vistrndta b on lerrnb=virrnbepsa 	inner join libdebito.tbinproc on pbin=lbinpr
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr right join libdebito.tbcret0p on lcretr = codnro right join gxbdbps.gentiaf ON (ENEMISO=LENemi)
where lfectr between '20220127' and '20220127' and codmar='BEPS'  and lhortr>080000 --- and lcretr in ('05','91')-- and lcretr in ('XD')-- and lnrtar like '540926%'-- and lcretr in ('06')
--and lnrtar like '451902%'--and lnrtar ='5226925160026139'buscar por numero de tarjeta lnrtar AS TARJETA
--and b.virrnbepsa='31614959992'buscar por numero de refencia o numero de boleta
and lhortr>080000 order by  lhortr desc;


			 --	-- VISA DINELCO CONTINENTAL CODIGO DE PROCESO LENEM 020 VISA EMISOR CONTINENTAL-----04
select lfectr fecha_real,lhortr hora,substr(lerrnb,2,13) refencia,b.vipannmbr tarje_visa,b.virol,b.vif044rmsg mensaje,lcodbc MARCA,lenemi entidad,
lesttr estado,lcretr cod_retorno,substr(lidtra,1,1) Origen,lcodtr cod_trx,limpgs importe,lidcom cod_comercio,lcomtr comercio,leca62 POSATM,substr(lidtra,1,1) Origen
from libdebito.drconbep inner join visa.vistrndta b on lerrnb=virrnbepsa inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr right join libdebito.tbcret0p on lcretr = codnro
right join gxbdbps.gentiaf ON (ENEMISO=LENemi) where lfectr between '20220127' and '20220127' and lcodbc = 'VSA' and codmar='VISA'
--and lcretr in ('F1')-- and lnrtar like '456976%4906'-- and lhortr>080000--- and lnrtar like '434512%'
--and virol = 'ADQ'
AND substr(vipannmbr, 1,6) = '456976' and lhortr>080000  --and lcretr in ('92')--VISA CONTI
--AND substr(vipannmbr, 1,6) = '488234' and lhortr>080000-- VISA BNF
order by lhortr desc;
	
			 --	-- VISA DINELCO EMISOR CODIGO DE PROCESO LENEMI 015 VISA EMISOR BNF-----05	
select lfectr fecha_real,lhortr hora,substr(lerrnb,2,13) refencia,b.vipannmbr tarje_visa,b.virol,b.vif044rmsg mensaje,lcodbc MARCA,lenemi entidad,
lesttr estado,lcretr cod_retorno,substr(lidtra,1,1) Origen,lcodtr cod_trx,limpgs importe,lidcom cod_comercio,lcomtr comercio,leca62 POSATM,substr(lidtra,1,1) Origen
from libdebito.drconbep inner join visa.vistrndta b on lerrnb=virrnbepsa inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr right join libdebito.tbcret0p on lcretr = codnro
right join gxbdbps.gentiaf ON (ENEMISO=LENemi) where lfectr between '20220127' and '20220127' and lcodbc = 'VSA' and codmar='VISA'
--and lcretr in ('F1')-- and lnrtar like '456976%4906'-- and lhortr>080000--- and lnrtar like '434512%'
--and virol = 'ADQ'
AND substr(vipannmbr, 1,6) = '488234' and lhortr>080000   --and lcretr in ('92')--VISA CONTI
--AND substr(vipannmbr, 1,6) = '488234' and lhortr>080000-- VISA BNF
order by lhortr desc;
----------------------------------DEBITO DINELCO BNF CODIGO **************************************************06 
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,--lnrtar,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 AS VERSION ,loritr as ATM_POS,lerrnb as Referencia ,LENEMI COD_ENTIDAD
from libdebito.drconbep where lfectr between '20220127' and '20220127' and lnrtar like '703002%' and lhortr>080000--and lhortr>080000
 order by lhortr desc ;
 
---07 DEBITO DINELCO BNF CODIGO DEBITO CONTINENTAL  -07
 select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,--lnrtar,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 AS VERSION ,loritr as ATM_POS,lerrnb as Referencia ,LENEMI COD_ENTIDAD,lnrtar AS Tarjeta
from libdebito.drconbep where lfectr between '20220127' and '20220127'-- and lerrnb ='031514847957'-- and lnrtar like '4569760000073001'  --and lcretr in ('12')  
and lnrtar like '703020%' and lhortr>080000 -- and lhortr>204000
order by lhortr desc ;


			--   DEBITO DINELCO BNF CODIGO DEBITO CONTINENTAL-----08 
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,--lnrtar,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 AS VERSION ,loritr as ATM_POS,lerrnb as Referencia ,LENEMI COD_ENTIDAD
from libdebito.drconbep where lfectr between '20220127' and '20220127'-- and lerrnb ='031514847957'-- and lnrtar like '4569760000073001'  --and lcretr in ('12')  
and lnrtar like '703040%' and lhortr>080000 -- and lhortr>204000
order by lhortr desc 	;
				
-- DINELCO MTS WALEN  09
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,SUBSTR(LIDTRA,1,1) DISPOSITIVO,lenemi as emisor,
lbinpr as Bin ,lcodbc as Marca ,limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por,LNFACT AS PAIS,leca62 AS VERSION,loritr as ATM_POS,lerrnb as Referencia
from libdebito.drconbep
where lfectr between '20220127' and '20220127' and  lnrtar like '547697%' and lcodbc='MST'  order by lhortr desc;--and substr(lidtra,1,1) = 'P'  AND lcomtr like ('%LANDAU%')--and lcretr in ('06')--and codmar='VISA'-- --and lesttr='R' --%'488234%'--
--and lhortr between '000001' and '074200' ----488234%

---MASTERCARD DINELCO CONTINENTAL-----10
		select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,lnrtar AS Tarjeta,--lnrtar,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 AS VERSION ,loritr as ATM_POS,lerrnb as Referencia ,LENEMI COD_ENTIDAD
from libdebito.drconbep where lfectr between '20220127' and '20220127'-- and lesttr in ('R') -- and lcretr in ('05')  -- and lerrnb ='031514847957'-- and lnrtar like '4569760000073001'  --and lcretr in ('12')  
	and lnrtar like '230671%' --and lhortr>204000  -- 443078%7901
order by lhortr desc 	

----DINELCO PROVAVOTY	and lenemi='166'			 
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,--lnrtar,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 AS VERSION ,loritr as ATM_POS,lerrnb as Referencia ,LENEMI COD_ENTIDAD
from libdebito.drconbep where lfectr between '20220127' and '20220127'-- and lerrnb ='031514847957'-- and lnrtar like '4569760000073001'  --and lcretr in ('12')  
and lenemi='166' --and lnrtar like '456976%'-- and lhortr>2
order by lhortr desc;
														-- PANAL CABAR PROCESADA POR PROCARD----- 
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,--lnrtar,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 AS VERSION ,loritr as ATM_POS,lerrnb as Referencia 
from libdebito.drconbep  where lfectr between '20220127' and '20220127' -- and  codmar = 'PROCARD'--and lerrnb ='031514847957'-- and lnrtar like '4569760000073001'  --and lcretr in ('12')  
and lenemi='512'  --and lnrtar like '456976%'-- and lhortr>204000
order by lhortr desc;

					
---DINELCO DEBITO CAPIATA and lenemi='107'
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,--lnrtar,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 AS VERSION ,loritr as ATM_POS,lerrnb as Referencia 
from libdebito.drconbep where lfectr between '20220127' and '20220127'-- and lerrnb ='031514847957'-- and lnrtar like '4569760000073001'  --and lcretr in ('12')  
and lenemi='107'  --and lnrtar like '456976%'-- and lhortr>204000
order by lhortr desc 	;

---DINELCO DEBITO ÑEMBY and lenemi='110'
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,--lnrtar,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 AS VERSION ,loritr as ATM_POS,lerrnb as Referencia 
from libdebito.drconbep where lfectr between '20220127' and '20220127'-- and lerrnb ='031514847957'-- and lnrtar like '4569760000073001'  --and lcretr in ('12')  
and lenemi='110'  --and lnrtar like '456976%'-- and lhortr>204000
order by lhortr desc 	;
                                       
--********************************TRANSACCIONES POR JTPS**********************************************************
SELECT lfectr FECHA,lhortr HORA,/*SUBSTR(lnrtar,1,6) || 'XXXXXX' ||SUBSTR(lnrtar,13,4) TARJE*/lnrtar tarje,lexpir VTO,lbinpr bin,lctaor,lctade
lbcodb,LENEMI ENTIDAD, lcored ,LCODBC MARCA,/*,pdescricion MARCA*/
lesttr ESTADO,lcretr COD_RETORNO,LENEMI COD_ENTIDAD,lcodtr COD_TRX,limpgs IMPORTE,lcotel celular,--coddes DESCRIP_RET,--lbinpr BIN,--
lerrnb REFE_BEPSA, lidcom COD_COMER,lcomtr LOCAL_COMER, /*txdtrx DESC_TRX,*/LECA62 version_pos,lactfj cod_act,lcautr cod_aut--LNFISC,LPOSEM,LMCCTR,LNFACT--,lntoke--, enemiso BANCO,tgdesc DESCRIPCION
from libdebito.drconbep --inner join libdebito.tbinproc on lbinpr=pbin
WHERE lfectr BETWEEN '20220127' AND '20220127'
and substr(leca62,9,10) like ('%J%') and lhortr>080000
order by lhortr desc;

---CODIGOS DE PROCESADORES DE LAS COOPERATIVAS-- EN CASO DE RECHAZO EXTRAER POR CODIGO DE LENEMI 
  select LIDCOM as COD_COMERCIO, LFECTR as FECHA_REAL, LHORTR as HORA, LCAUTR as COD_AUTORIZ, LCRETR as COD_RESP, LESTTR as RESPUESTA, lcodbc as Marca, SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta, LIMPGS as MONTO, LCOMTR as COMERCIO, LORITR, LCODTR as CODIGO_TRX, LCODBC, LERRNB, LECA62,lhisde as Respondido_Por , lenemi
from libdebito.drconbep where lfectr='20220127' and lenemi in ('068','070','071','072','073','075','076','077','080','081','083','084','088','089','095','096','100','101','102','103','105','106','107','108','109','110',
'111','113','124','125','136','137','140','141','144','145','153','158','161','163','165','166','167','168','169','170','171','172','173','174','177','303',
'304','305','306','307','309','310','311','312','334','340','342','344')
 order by lhortr desc;
 

---VERIFICACION DE BILLETERA PERSONAL
									 			select lfectr AS FECHA,lhortr AS HORA,lidcom AS COD_COMERCIO,lcomtr AS COMERCIO,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,limpgs AS IMPORTE,lesttr AS ESTADO,lcretr as RETORNO,lhisde as Respondido_Por,lerrnb Cod_Ref,loritr as ORIGEN, LCOTEL from libdebito.drconbep
										where lfectr between '20220127' and '20220127' and lcodtr='567102' -- and lcretr in ('19','84')
										and lhortr>080000 
										order by lhortr desc ;--and lerrnb in '389191146' 


---verificar trx tigo handlerWS--Sin Tarjeta
											select lfectr AS FECHA,lhortr AS HORA,lidcom AS COD_COMERCIO,lcomtr AS COMERCIO,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,limpgs AS IMPORTE,lesttr AS ESTADO,lcretr as RETORNO,lhisde as Respondido_Por,lerrnb Cod_Ref,loritr as ORIGEN,lcotel celular from libdebito.drconbep
											where lfectr between '20220127' and '20220127' and lhortr>080000  -- AND LCOTEL = '0983364546'-- 	and lcretr in ('91','96','01','93','00')-- and lcotel in '0982168509' 
							  			and lnrtar like '627431581%'-- and lhortr>080000 --and lcretr = '01' --	and lcodtr='000052'
													--and lerrnb in '389191146'	-- --AND LCOTEL = '0983955011' --NUMERO DE TELEFONO					
												--- and limpgs>0800000 MAYOR A UN MONTO
										 	order by lhortr desc;
															
--verificar tigo companion-- CON TARJETA
											select lfectr AS FECHA,lhortr AS HORA,lidcom AS COD_COMERCIO,lcomtr AS COMERCIO,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,limpgs AS IMPORTE,lesttr AS ESTADO,lcretr as RETORNO,lhisde as Respondido_Por,lerrnb Cod_Ref,loritr as ORIGEN from libdebito.drconbep
											where lfectr between '20220127' and '20220127' and lhortr>080000  --and lcotel in '0982168509' 
											and lnrtar like '627431152%'--AND LCOTEL = '0986724065' 
													--and lcretr = '93'	--	and lenemi='581'		--	AND LCOTEL = '0986797630'--	and limpgs>0800000
											order by lhortr desc;

---------------CICO TIGO 370 carga , 380 retiro, 390 giro DE BILLETERAS
											 select lfectr AS FECHA,lhortr AS HORA,lidcom AS COD_COMERCIO,lcomtr AS COMERCIO,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,limpgs AS IMPORTE,lesttr AS ESTADO,lcretr as RETORNO,lhisde as Respondido_Por,lerrnb Cod_Ref,lcotel celular,loritr as ORIGEN,lcodtr Transaccion from libdebito.drconbep
											 where lfectr between '20220127' and '20220127' 
											 and lcodtr in  ('380000','370000','390000') and lhortr>080000 -- and lerrnb like '%389191146'
															--and lcomtr like 'FARMAOLIVA%'-- and lctade like '%0982194340%'
															 	--and lcretr = '93'-- and limpgs>5080000
											 order by lhortr desc  ;

---ADQ. VISA CONTINENTAL
select lfectr fecha_real,lhortr hora,substr(lerrnb,2,13) refencia,lbinpr,b.vipannmbr tarje_visa,
lcodbc MARCA,lenemi entidad,lesttr estado,lcretr cod_retorno,lcodtr cod_trx,limpgs importe,lidcom cod_comercio,
    lcomtr comercio,b.virol,lidtra, b.vif044rmsg mensaje,lnfisc,vimti,lposem
from libdebito.drconbep inner join visa.vistrndta b on lerrnb=virrnbepsa
where lfectr between '20220127' and '20220127' and lhortr>110000 
--and b.vipannmbr='4510020102633362 '
--and substr(leca62,1,1)='P' --and lenemi='540' --and virol ='ADQ'  --and vimti='120' --and lcretr='06' --and lerrnb='035500918706'
--and lesttr='R'
order by lhortr desc;


	select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,--lnrtar,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 AS VERSION ,loritr as ATM_POS,lerrnb as Referencia 
from libdebito.drconbep where lfectr between '20220127' and '20220127'-- and lerrnb ='031514847957'--   --and lcretr in ('12')  
and lenemi='540' 
---and lnrtar like '4345591063373546'  --and lnrtar like '456976%'-- and lhortr>204000
order by lhortr desc 	;


