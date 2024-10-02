--VER TRANSACCIONES POR INICIO DE HORA RECHAZADAS RROCARD
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr from libdebito.drconbep
where lfectr between '20220328' and '20220328' and lenemi='510' and lhortr > '90000'-- and lcretr in ('96','91','XD','92','94', '60') 
order by lhortr desc

--verificar trx tigo handlerWS-- SIN TARJETA
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr from libdebito.drconbep
where lfectr between '20220328' and '20220328' and lnrtar like '627431581%' --and lcretr in ('96','91','XD','92','94', '60')
order by lhortr desc 

--verificar tigo companion-- CON TARJETA
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr from libdebito.drconbep
where lfectr between '20220328' and '20220328' and lnrtar like '627431152%' order by lhortr desc 

-- DINELCO BNF
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr from libdebito.drconbep
where lfectr between '20220328' and '20220328' and lnrtar like '7030%'-- and lcretr='16'
 order by lhortr desc 

--VISA
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr from libdebito.drconbep
where lfectr between '20220328' and '20220328' and lnrtar like '443078%' order by lhortr desc;

select * from libdebito.drconbep

--MASTERCARD
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr from libdebito.drconbep
where lfectr between '20220328' and '20220328' and lnrtar like '516400%' order by lhortr desc --

select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr from libdebito.drconbep
where lfectr between '20220328' and '20220328' and lnrtar like '601638%' order by lhortr desc --

select ---count (*)
*from libdebito.drconbep
where lfectr between '20220328' and '20220328'
and lcretr='91'
and SUBSTR(LNRTAR,1,6) IN ('443078')
order by lhortr desc

----------------------------------------------------------------------------------------------------------------     
    
--verificar trx por comercio--
select lfectr, lhortr, lnrtar, lidcom, lcomtr, limpgs, lcretr, lesttr from libdebito.drconbep
where lfectr between '20181107' and '20181107' and lidcom='9099248' order by lhortr desc; 

and limpgs = '140000'  and substr(lidtra,1,1) = 'T' and lhortr between '073000' and '080000'

----------------------------------------------------------------------------------------------------------------
--USUARIOS TIGO MONEY
select * from roshkalib.m_usuarios
where numero_celular = '0983214316'

------------------------------------------------------------------------------------------------------------------
---TRX DE UN COMERCIO EN ESPECÍFICO 
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr from libdebito.drconbep
where lfectr between '20220328' and '20220328' and lidcom='0700537' order by lhortr desc 

-------------------------------------------------------------------------------------------------------------------
select lfectr, lhortr, lnrtar, lidcom, lcomtr, limpgs, lcretr, lesttr
from libdebito.drconbep 
where lfectr between '20181210' and '20181210' and lnrtar like '627431581%' order by lhortr desc
------------------------------------------------------------------------------------------------------------------- 
--PARA VER UN CÓDIGO DE RETORNO EN ESPECÍFICO
select lfectr, lhortr, lnrtar, lexpir, lcodbc, lidcom, lcomtr, limpgs, lcretr, lesttr
from libdebito.drconbep 
where lfectr='20220328'
--and SUBSTR(LNRTAR,1,6) IN ('703002')
and lcretr='96' 
order by lhortr desc 
------------------------------------------------------------------------------------------------------------------- 
select lfectr, lhortr, lnrtar, lidcom, lcomtr, limpgs, lcretr, lesttr, substr(leca62,1,2)
from libdebito.drconbep 
where lfectr='20220328'
and substr(leca62,1,2)='XV'
order by lhortr desc
-------------------------------------------------------------------------------------------------------------------
--DINELCO BNF 7030
select lfectr, lhortr, lnrtar, lidcom, lcomtr, limpgs, lesttr, lcretr
from libdebito.drconbep 
where lfectr between '20220328' and '20220328' and lnrtar like '7030%' order by lhortr desc

-------------------------------------------------------------------------------------------------------------------
select lfectr, lhortr, lnrtar, lexpir, lcodbc, lidcom, lcomtr, limpgs, lcretr, lesttr 
from libdebito.drconbep  
where lnrtar='6274311510002725' 
order by lfectr, lhortr desc


-- COOPERATIVA CAPIATA
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr from libdebito.drconbep
where lfectr between '20220328' and '20220328' and lnrtar like '627431107%' order by lhortr desc 

-- COOPERATIVA MBURICAO
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr from libdebito.drconbep
where lfectr between '20220328' and '20220328' and lnrtar like '627431113%' order by lhortr desc 

--verificar personal--
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr from libdebito.drconbep
where lfectr between '20220328' and '20220328' and lnrtar like '627431571%' order by lhortr desc 

--COOPERATIVA YPAKARAI
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr from libdebito.drconbep
where lfectr between '20220328' and '20220328' and lnrtar like '627431103%' order by lhortr desc 

--VER TRANSACCIONES POR INICIO DE HORA RECHAZADAS DE PROCARD
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar, lbinpr, lcodbc, limpgs,lesttr,lcretr from libdebito.drconbep
where lfectr between '20220328' and '20220328' and lenemi='510' --and lnrtar '4430761400004536'--and lcretr in ('09')and lhortr > '63000'--'91','XD','92')-- and lcretr in ('96','91','XD','92') 
order by lhortr desc

--TABLA DE BINES
select * from libdebito.tbinproc
where pbin = '109910'

--VER TRANSACCIONES POR INICIO DE HORA APROBADAS
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lbinpr,lcodbc, lcretr from libdebito.drconbep
where lfectr between '20220328' and '20220328' and lenemi='510'-- and lcretr in ('12') --and lhortr > '60000'
order by lhortr desc

---------------370 carga , 380 retiro, 390 giro
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr, lcodtr codtrx from libdebito.drconbep
where lfectr between '20220328' and '20220328' and lcodtr in  ('370000','380000','390000') 
order by lhortr desc
--------------------------------------------------------------------------------------------------------------------------
------------------------TRANSACCIONES ATM-CENTRE -------------------------------------------------------------------------
select lfectr as FECHA,lhortr as HORA,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS TARJETA,leca62 As ATM,lcomtr as NOMBRE_ATM,limpgs as MONTO,lcretr as RETORNO, lesttr as ESTADO from libdebito.drconbep
where substr(lidtra,1,4) in
('T011','T026','T070','T278','T370','T403','T408','T420','T461','T462','T001','T415','T423','T424','T441','T405','T410')
and lfectr='20220328'
order by lhortr desc
---------------------------------------------------------------------------------------------------------------------------
