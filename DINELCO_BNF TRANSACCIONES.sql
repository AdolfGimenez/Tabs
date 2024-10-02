
--BNF DINELCO- 01
select lcotel, lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio, --SUBSTR --lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,
lnrtar, lbinpr as Bin , lcodbc as Marca , limpgs as Monto, lcodtr cod_trx, lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 AS VERSION ,loritr as ATM_POS,lerrnb as Referencia , LSALTR AS SALDO_TARJETA,LENEMI COD_ENTIDAD from libdebito.drconbep
where lfectr between '20211210' and '20211210' and lnrtar like '703002%'
--and lcodtr=324000
order by lhortr desc;


--este sql es para varificar trx con dinelco bnf si ingresan 00 son aprobadas

-- VISA DE BNF - 05 604266
select lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,
lcretr as Retorno,lhisde as Respondido_Por ,leca62 AS VERSION ,loritr as ATM_POS,lerrnb as Referencia , LSALTR AS SALDO_TARJETA,LENEMI COD_ENTIDAD from libdebito.drconbep
 where lfectr between '20211220' and '20211222' and lnrtar like '488234%' order by lhortr desc;

--y este para visa bnf

