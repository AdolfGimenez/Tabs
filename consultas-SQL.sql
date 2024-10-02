

select * from gxbdbps.tlogsaf where lstipro = 'CLEA' and lsfecha = '20190614'
order by lshora desc


Select * from gxopera.oprecle where refech = '20190614'


select * from gxbdbps.tlogsaf WHERE LSTIPRO ='CIER' AND LSFECHA = '20190614'
order by lshora desc


select * from Libdebito.maedinel


--VER TRANSACCIONES POR INICIO DE HORA RECHAZADAS RROCARD
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr from libdebito.drconbep
where lfectr between '20190803' and '20190803' and lenemi='510' and lhortr > '010000' and lcretr in ('XD','92') 
order by lhortr desc

--VER RECHAZADAS RROCARD POR GRUPO
select lfectr, lcodbc, lcretr, lesttr, COUNT(*) CANTIDAD
from libdebito.drconbep 
where lfectr='20190813'
and lcretr in ('96','63','91','XD','92') 
GROUP BY Lfectr, lcodbc, lcretr, lesttr 

--verificar trx tigo handlerWS-- SIN TARJETA
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr from libdebito.drconbep
where lfectr between '20190805' and '20190805' and lnrtar like '627431581%' --and lcretr in ('96','91','XD','92','94', '60')
order by lhortr desc 

--verificar tigo companion-- CON TARJETA
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr from libdebito.drconbep
where lfectr between '20190803' and '20190803' and lnrtar like '627431152%' order by lhortr desc

-- DINELCO BNF
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr from libdebito.drconbep
where lfectr between '20190812' and '20190812' and lnrtar like '7030%' order by lhortr desc 

--VISA
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr from libdebito.drconbep
where lfectr between '20190801' and '20190801' and lnrtar like '443078%' order by lhortr desc 

--MASTERCARD
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr from libdebito.drconbep
where lfectr between '20190731' and '20190731' and lnrtar like '516400%' order by lhortr desc --

select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr from libdebito.drconbep
where lfectr between '20190706' and '20190706' and lnrtar like '601638%' order by lhortr desc --


--PARA VER UN CÓDIGO DE RETORNO EN ESPECÍFICO
	select lfectr, lhortr, lnrtar, lexpir, lcodbc, lidcom, lcomtr, limpgs, lcretr, lesttr--, leca62
	from libdebito.drconbep 
	where lfectr='20190706'
	--and SUBSTR(LNRTAR,1,6) IN ('703002')
	and lcretr='96' 
	order by lhortr desc 

select ---count (*)
*from libdebito.drconbep
where lfectr between '20190706' and '20190706'
and lcretr='96'
and SUBSTR(LNRTAR,1,6) IN ('443078')
order by lhortr desc

----------------------------------------------------------------------------------------------------------------     
    
--verificar trx por comercio--
select lfectr, lhortr, lnrtar, lidcom, lcomtr, limpgs, lcretr, lesttr from libdebito.drconbep
where lfectr between '20190706' and '20190706' and lidcom='9099248' order by lhortr desc; 

and limpgs = '140000'  and substr(lidtra,1,1) = 'T' and lhortr between '073000' and '080000'

----------------------------------------------------------------------------------------------------------------
--USUARIOS TIGO MONEY
select * from roshkalib.m_usuarios
where numero_celular = '0983214316'

------------------------------------------------------------------------------------------------------------------
---TRX DE UN COMERCIO EN ESPECÍFICO 
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr from libdebito.drconbep
where lfectr between '20190706' and '20190706' and lidcom='0700537' order by lhortr desc 

-------------------------------------------------------------------------------------------------------------------
select lfectr, lhortr, lnrtar, lidcom, lcomtr, limpgs, lcretr, lesttr
from libdebito.drconbep 
where lfectr between '20190706' and '20190706' and lnrtar like '627431581%' order by lhortr desc
------------------------------------------------------------------------------------------------------------------- 

------------------------------------------------------------------------------------------------------------------- 
select lfectr, lhortr, lnrtar, lidcom, lcomtr, limpgs, lcretr, lesttr, substr(leca62,1,2)
from libdebito.drconbep 
where lfectr='20190706'
and substr(leca62,1,2)='XV'
order by lhortr desc
-------------------------------------------------------------------------------------------------------------------
--DINELCO BNF 7030
select lfectr, lhortr, lnrtar, lidcom, lcomtr, limpgs, lesttr, lcretr
from libdebito.drconbep 
where lfectr between '20190803' and '20190803' and lnrtar like '7030%' order by lhortr desc

-------------------------------------------------------------------------------------------------------------------
select lfectr, lhortr, lnrtar, lexpir, lcodbc, lidcom, lcomtr, limpgs, lcretr, lesttr 
from libdebito.drconbep  
where lnrtar='6274311510002725' 
order by lfectr, lhortr desc


-- COOPERATIVA CAPIATA
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr from libdebito.drconbep
where lfectr between '20190706' and '20190706' and lnrtar like '627431107%' order by lhortr desc 

-- COOPERATIVA MBURICAO
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr from libdebito.drconbep
where lfectr between '20190706' and '20190706' and lnrtar like '627431113%' order by lhortr desc 

--verificar personal--
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr from libdebito.drconbep
where lfectr between '20190706' and '20190706' and lnrtar like '627431571%' order by lhortr desc 

--COOPERATIVA YPAKARAI
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr from libdebito.drconbep
where lfectr between '20190706' and '20190706' and lnrtar like '627431103%' order by lhortr desc 

--VER TRANSACCIONES POR INICIO DE HORA RECHAZADAS DE PROCARD
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar, lbinpr, lcodbc, limpgs,lesttr,lcretr from libdebito.drconbep
where lfectr between '20190726' and '20190726' and lenemi='510' --and lnrtar '4430761400004536'--and lcretr in ('09')and lhortr > '63000'--'91','XD','92')-- and lcretr in ('96','91','XD','92') 
order by lhortr desc

--TABLA DE BINES
select * from libdebito.tbinproc
where pbin = '109910'

--VER TRANSACCIONES POR INICIO DE HORA APROBADAS
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lbinpr,lcodbc, lcretr from libdebito.drconbep
where lfectr between '20190706' and '20190706' and lenemi='510' -- and lcretr in ('12') --and lhortr > '60000'
order by lhortr desc

---------------------------------------------venta minutos----------------------------------------------------------------------
select lfectr, lhortr, lnrtar, lexpir, lcodbc, lidcom, lcomtr, limpgs, lcretr, lesttr, LCODTR, TXDTRX,  SUBSTR(LIDTRA,1,1) DISPOSITIVO, LCOTEL TELEFONO, LCORED LINEA
from libdebito.drconbep 
inner join libdebito.tbctra0p on lcodtr = TXCTRX
where lfectr='20190706'
and lcretr='00' and lcodtr in ('901020', '514000') order by lhortr desc 
---------------------------------------------venta minutos----------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------

