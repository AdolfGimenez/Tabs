/*TABLA DE MAESTROS DE COMERCIOS*/
select * from gxbdbps.comaeaf where cocomer='1001757'
/*TABLA DE MAESTROS DE POS Y COMERCIOS*/ --se ve cuantos pos tiene un comercio
select * from gxbdbps.coafmaf where afcomer='1001757'


--Consulta de transacciones (37000-Carga),(38000-Giro),(39000-Retiro)
select lfectr FECHA, lhortr HORA, lctaor C_I, lctade REFERENCIA, lcotel ENVIA, lidcom Cod_Comer, lcomtr Comercio, limpgs Monto, lcodtr Transaccion, LCRETR Retorno from libdebito.drconbep
where lfectr between '20201201' and '20201201'
--and lctade like '%332978600'
and lcotel in '0983946597' --AND lhortr ='141830'
--and lctade in ''
--AND LCOTEL = ''
and lcodtr in  ('370000','380000','390000') 
order by lhortr desc 

select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr,lcotel, lcodtr codtrx from libdebito.drconbep
where lfectr between '20201201' and '20201201'
and lcotel in '0982670644' 
and lcodtr in  ('370000','380000','390000') 
order by lhortr desc 

		 		    select lfectr AS FECHA , lhortr AS HORA,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS TARJETA, /*PARA ENCRIPTAR TARJETAS*/--
				lidcom AS CODIGO, lcomtr  AS COMERCIO,leca62 Version_Pos,lactfj Activo, limpgs AS MONTO, lcretr AS RETORNO, lesttr AS ESTADO,lcotel CELULAR,substr(lidtra,1,1) Origen,A.TXDTRX DETALLES from libdebito.drconbep
				inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
				where lfectr between '20201129' and '20201129' 
				and lidcom='2100590' --and limpgs =('34505')--and lenemi in ('530','560','570','590')--FORTIS MAYORISTA SUC MARIANO
				order by lhortr desc   

	---TRX DE UN COMERCIO EN ESPECÍFICO 
	select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr,lctade,lcotel,LCTAOR
	from libdebito.drconbep
	where lfectr between '20201201' and '20201201' 
	--and lctade like '%348128587'
	and lidcom='0703684'
--	AND LIMPGS = 458000
---AND LCOTEL = '0985689450'
	order by lhortr desc 

	 
