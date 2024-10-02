----------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------# Resumen por RECHAZO-----------------------------------------------------------
select lfectr AS FECHA, lcodbc AS MARCA, lcretr as RETORNO, lesttr as ESTADO, COUNT(*) CANTIDAD
from libdebito.drconbep  
where lfectr='20220704' and lnrtar like '627431107%' and lhortr > '000000' 
GROUP BY Lfectr, lcodbc, lcretr, lesttr
---------------------------------------------------------------------------------------------------------------------------------------------------------------------- 
              -----------------------------------------------------#COOPERATIVAS POR SU LENEMI#-----------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#56	COOPERATIVA AREGUA LTDA
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' and lenemi='530' and lbinpr ='627439' --and lnrtar like '627431162%'
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#68	COOPERSANJUBA LTDA.
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' --and lenemi='107' --and lnrtar like '627431162%'
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#100	COOP. STMA TRINIDAD LTDA.
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' --and lenemi='107' --and lnrtar like '627431162%'
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#101	COOPERATIVA CREDIVILL LTDA.
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' --and lenemi='107' --and lnrtar like '627431162%' 
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#102	COOP. BARREREÑA - CASTIL
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' --and lenemi='107' --and lnrtar like '627431162%'
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#103	COOP. YPACARAI LTDA.
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' --and lenemi='107' --and lnrtar like '627431162%'
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#105	COOPEC LTDA.(D)
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' --and lenemi='107' --and lnrtar like '627431162%'
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#106	COOP. FNDO DE LA MORA LTDA.(D)
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' --and lenemi='107' --and lnrtar like '627431162%'
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#107	COOPERATIVA CAPIATA LTDA.
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220101' and '20220704' --and lenemi='348' --and lnrtar like '627431162%'
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#108	COOP. NUEVA BURDEOS
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' --and lenemi='107' --and lnrtar like '627431162%'
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#109	COOP. VILLETA LTDA. (DEBITO)
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' --and lenemi='107' --and lnrtar like '627431162%'
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#110	COOP. ÑEMBY LTDA (DEBITO)
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' --and lenemi='107' --and lnrtar like '627431162%'
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#111	COOP. 26 DE ABRIL LTDA PREPAGA
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' --and lenemi='107' --and lnrtar like '627431162%'
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#113	COOP. MBURICAO LTDA.
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' --and lenemi='107' --and lnrtar like '627431162%' 
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#303	COOP. FERNANDO DE LA MORA LTDA
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' --and lenemi='107' --and lnrtar like '627431162%'
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#304	COOPERATIVA ITA LTDA.
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' --and lenemi='107' --and lnrtar like '627431162%'
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#305	COOPERATIVA CAPIATA LTDA
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' --and lenemi='107' --and lnrtar like '627431162%'
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#306	COOP. VIRGEN DE LA CANDELARIA
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' --and lenemi='107' --and lnrtar like '627431162%' 
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#307	COOPEC LTDA.(C)
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' --and lenemi='107' --and lnrtar like '627431162%' 
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#309	COOP. VILLETA LTDA.(CREDIT0)
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' --and lenemi='107' --and lnrtar like '627431162%'
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#310	COOP. 1º PDTE. LTDA.
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' --and lenemi='107' --and lnrtar like '627431162%' 
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#311	COOPERATIVA ÑEMBY LTDA.(C)
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' --and lenemi='107' --and lnrtar like '627431162%'
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#312	COOPERATIVA 26 DE ABRIL LTDA
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' --and lenemi='107' --and lnrtar like '627431162%' 
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#70	COOPERATIVA 8 DE MARZO
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' --and lenemi='107' --and lnrtar like '627431162%'
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#71	COOPERATIVA SANTO TOMAS
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' --and lenemi='107' --and lnrtar like '627431162%'
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#72	COOPERATIVA COOMECIPAR
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' --and lenemi='107' --and lnrtar like '627431162%'
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#73	COOPERATIVA YAGUARON
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' --and lenemi='107' --and lnrtar like '627431162%'
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#75	COOPERATIVA REDUCTO LTDA.-
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' --and lenemi='107' --and lnrtar like '627431162%' 
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#76	COOPERATIVA J.A. SALDIVAR LTDA
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' --and lenemi='107' --and lnrtar like '627431162%' 
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#77	COOP.SAN JOSE DE LOS ARROYOS
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' --and lenemi='107' --and lnrtar like '627431162%'
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#124	COOPERSAM LTDA-DEBITO-CENCOPAN
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' --and lenemi='107' --and lnrtar like '627431162%' 
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#125	COOPERSAM LTDA-PREPAG-CENCOPAN
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' --and lenemi='107' --and lnrtar like '627431162%' 
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#334	COOPERSAM LTDA.-CREDITO-CENCOP
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' --and lenemi='107' --and lnrtar like '627431162%'
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#136	COOPECEN LTDA. DEBITO
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' --and lenemi='107' --and lnrtar like '627431162%'
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#137	COOPECEN LTDA. PREPAGA
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' --and lenemi='107' --and lnrtar like '627431162%' 
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#340	COOPECEN LTDA. CREDITO
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' --and lenemi='107' --and lnrtar like '627431162%'
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#140	COOPEJAS LTDA. DEBITO-CENCOPAN
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' and lnrtar like '627431162%' ----and lnrtar like '627431101%' --and lenemi='107' --and lnrtar like '627431110%'  and lenemi='110' 
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#141	COOPEJAS LTDA. PREPAGA-CENCOP
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' --and lenemi='107' --and lnrtar like '627431162%'
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#342	COOPEJAS LTDA. CREDITO-CENCOP
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' --and lenemi='107' --and lnrtar like '627431162%'
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#144	COOP. REDUCTO LTDA DEB.CENCOPA
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' --and lenemi='107' --and lnrtar like '627431162%'
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#145	COOP REDUCTO LTDA PREPAGA CENC
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' --and lenemi='107' --and lnrtar like '627431162%' 
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#344	COOP REDUCTO LTDA CREDITO CEN
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' --and lenemi='107' --and lnrtar like '627431162%' 
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#80	COOPERATIVA 7 DE AGOSTO-SALARI
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' --and lenemi='107' --and lnrtar like '627431162%' 
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#153	COOP. 7 DE AGOSTO SALARIO
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' --and lenemi='107' --and lnrtar like '627431162%'
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#81	COOPERATIVA YOAYU LTDA.
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' --and lenemi='107' --and lnrtar like '627431162%'
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#158	COOP. VILLA MORRA LTDA DEBITO
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' --and lenemi='107' --and lnrtar like '627431162%'
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#83	BANCOOP
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' --and lenemi='107' --and lnrtar like '627431162%' 
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#84	COOP. 19 DE MARZO PREPAGA
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' --and lenemi='107' --and lnrtar like '627431162%'
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#161	COOP. 19 DE MARZO PREPAGA
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' --and lenemi='107' --and lnrtar like '627431162%'
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#163	COOPERATIVA COTAS LTDA.
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' --and lenemi='107' --and lnrtar like '627431162%'
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#88	COOPERATIVA MERCADO 4 LTDA.
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' --and lenemi='107' --and lnrtar like '627431162%'
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#165	COOPERATIVA MERCADO N°4 LTDA.
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' --and lenemi='107' --and lnrtar like '627431162%' 
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#166	COOPERATIVA PORAVO TY LTDA
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' --and lenemi='107' --and lnrtar like '627431162%'
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#167	COOPERATIVA ÑANEMBA-E LTDA.
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' --and lenemi='107' --and lnrtar like '627431162%'
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#169	COOPERATIVA JUDICIAL LTDA.
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' and lenemi='169' --and lnrtar like '627431162%' 
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#170	COOP. PRIMER PRESIDENTE LTDA.
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' --and lenemi='107' --and lnrtar like '627431162%' 
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------# 168	COOP. JUDICIAL LTDA PRE-PAGA
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' --and lenemi='107' --and lnrtar like '627431162%' 
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#172	COOPERATIVA TUPI LTDA.
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' --and lenemi='107' --and lnrtar like '627431162%' 
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#171	COOP. REDUCTO LTDA.
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' --and lenemi='107' --and lnrtar like '627431162%'
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#173	COOPERATIVA SAN LORENZO LTDA.
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' --and lenemi='107' --and lnrtar like '627431162%'
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#174	COOP. ÑEMBY LTDA.
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' --and lenemi='107' --and lnrtar like '627431162%' 
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#89	COOPEXSANJO LTDA.
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' --and lenemi='107' --and lnrtar like '627431162%'
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#95	COOPERATIVA PARAVOTY LTDA
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' --and lenemi='107' --and lnrtar like '627431162%' 
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#177	COOPERATIVA GUA-I LTDA.
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' --and lenemi='107' --and lnrtar like '627431162%'
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#96	COOPERATIVA AYACAPE LTDA
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' --and lenemi='107' --and lnrtar like '627431162%'
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#115	COPAFI              
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' --and lenemi='107' --and lnrtar like '627431162%'
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#308	COOSOFAN LTDA.               
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' --and lenemi='107' --and lnrtar like '627431162%'
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#319	COOSOFAN LTDA.-EFECTIVO             
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' --and lenemi='107' --and lnrtar like '627431162%'
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#121	DEBITO COOSOFAN LTDA.             
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' --and lenemi='107' --and lnrtar like '627431162%'
order by lhortr desc
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------#332	COOSOFAN LTDA - CREDITO             
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi EMISOR,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 as ATM ,loritr as ATM_POS,lerrnb as Referencia ,lbcocr
from libdebito.drconbep
where lfectr between '20220704' and '20220704' --and lenemi='107' --and lnrtar like '627431162%'
order by lhortr desc

