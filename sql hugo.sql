 select * from  libdebito.tbcret0p

----------------------------------------ATM CENTRE -------------------------------------------------------
													select lfectr as FECHA,lhortr as HORA,lnrtar AS TARJETA,leca62 As ATM,lcomtr as NOMBRE_ATM,limpgs as MONTO,lcretr as RETORNO, lesttr as ESTADO, LSALTR AS SALDO_TARJETA 
													from libdebito.drconbep
													where substr(lidtra,1,4) in
													('T321')
													and lfectr = '20201009'order by lhortr desc
																
 													--------VERIFICA POR BIN FE TARJETA-----****************OJOOO**************************************************************************************************************************
															select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr,LECA62, LSALTR AS SALDO_TARJETA,lcodbc from libdebito.drconbep
															where lfectr between '20201009' and '20201009' and lnrtar like '488234%'  order by lhortr desc --
													-----------*****************************************************************************************************************************************************************************************	

											-- VERIFICA POR BIN FE TARJETA-----
											select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr,lcodbc from libdebito.drconbep
											where lfectr between '20201009' and '20201009' and lnrtar like '456976%'  order by lhortr desc --and lcretr in ('50')
											
											--PROCARD VISA MASTERCARD
											select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lbinpr,lcodbc, lcretr,loritr,lerrnb,LCTADE from libdebito.drconbep
									   	where lfectr between '20201009' and '20201009' and lenemi='510' -- and lhortr between '202100' and '205300'--and lcretr in ('XD') --and lhortr > '203000'
											order by lhortr desc
	
											-- VERIFICA POR BIN FE TARJETA VISA CONTINENTAL-----
											select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr,lcodbc from libdebito.drconbep
											where lfectr between '20201009' and '20201009' and lnrtar like '502026%' order by lhortr desc --
															
														-- VERIFICA POR BIN FE TARJETA-----
											select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr,lcodbc,lenemi from libdebito.drconbep
											where lfectr between '20201009' and '20201009' and lnrtar like '443078%' order by lhortr desc --
														
											-- VERIFICA POR BIN FE TARJETA-----
											select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr,lcodbc from libdebito.drconbep
											where lfectr between '20201009' and '20201009' and lnrtar like '703002%' order by lhortr desc --
																		
														-- VERIFICA POR BIN FE TARJETA-----
											select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr,lcodbc from libdebito.drconbep
											where lfectr between '20201009' and '20201009' and lnrtar like '601637%' order by lhortr desc --
											
																-- VERIFICA POR BIN FE TARJETA-----
											select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr,lcodbc from libdebito.drconbep
											where lfectr between '20201009' and '20201009' and lnrtar like '601638%' order by lhortr desc --
											
																					-- VERIFICA POR BIN FE TARJETA-----
											select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr,lcodbc from libdebito.drconbep
											where lfectr between '20201009' and '20201009' and lnrtar like '601639%' order by lhortr desc --
																							
SELECT lfectr FECHA,lhortr HORA,SUBSTR(lnrtar,1,6) || 'XXXXXX' ||SUBSTR(lnrtar,13,4) TARJE,lnrtar,lbinpr,LENEMI ENTIDAD, LCODBC MARCA,/*,pdescricion MARCA*/
lesttr ESTADO,lcretr COD_RETORNO,--coddes DESCRIP_RET,--lbinpr BIN,--,pdescricion MARCA_ENTIDAD,
lerrnb REFERENCIA_BEPSA, lidcom COD_COMERCIO,lcomtr LOCAL_COMERCIO,lcautr COD_AUT,limpgs IMPORTE,lcodtr COD_TRX,LACTFJ,/*txdtrx DESC_TRX,*/leca62 VERSION--,lntoke--, enemiso BANCO,tgdesc DESCRIPCION
from libdebito.drconbep 
WHERE lfectr BETWEEN '20201009' AND '20201009' 
and lcretr='05' and SUBSTR(lnrtar,1,6)like '443078'
and substr(leca62,1,1) in ('T') --and lhortr > '211000' and lhortr < '235959'
--and lhortr > '115000' --and lcretr = '00' and substr (lcodtr,1,1) <> '3'
--orderb by leca62 desc
order by lfectr desc ,lhortr desc



SELECT*FROM libdebito.drconbep 

--Bucador de Consultas--
					select LECA62 NO_ATM, LCOMTR NOMBRE, COUNT(LECA62) CANT_TX
					from libdebito.drconbep
					where lfectr = '20201009'
					  and substr(LECA62,1,1)='T'
					--	and substr(lhortr,1,2) = HOUR(CURRENT_TIME)
						and lcodtr = '301000'-- Consulta de Saldo

					GROUP BY LECA62, LCOMTR
					ORDER BY CANT_TX DESC 
					
	--RECHAZOS BNF PROCARD-HORA Y CONTADOR
				select lfectr AS FECHA, lcodbc AS MARCA ,lcretr AS RETORNO, COUNT(*) CANTIDAD
				from libdebito.drconbep 
				where lfectr='20201009' and lenemi='510' and lhortr between '195000' and '201400'
				and lcretr in ('92','96','91')  and lcodbc in ('MST','VSA','CRE','UNI')
				GROUP BY Lfectr, lcodbc, lesttr , lcretr
				

				select lfectr AS FECHA, lcodbc AS MARCA ,lcretr AS RETORNO, COUNT(*) CANTIDAD 
				from libdebito.drconbep 
				where lfectr='20201009'  and lenemi in ('530','560','590','570') and lhortr between '195000' and '201400'
				and lcretr in ('92','19','91')  and lcodbc in ('MST','VSA','CRE','UNI')
				GROUP BY Lfectr, lcodbc, lesttr , lcretr
				

--RECHAZOS BNF PROCARD-HORA Y CONTADOR
				select lfectr AS FECHA, lcodbc AS MARCA ,lcretr AS RETORNO, COUNT(*) CANTIDAD
				from libdebito.drconbep 
				where lfectr='20201009' and lhortr between '164537' and '173800'
				and lcretr in ('92','96','91')  and lcodbc in ('MST','VSA','CRE','UNI')
				GROUP BY Lfectr, lcodbc, lesttr , lcretr
				
