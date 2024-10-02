select lfectr fecha_real , lfcotr fecha_com,lhortr HORA,SUBSTR(lnrtar,1,6) || 'XXXXXX' ||SUBSTR(lnrtar,13,4) TARJE,
lenemi emisor,lbinpr bin,lcuota,
lesttr ESTADO,lcretr COD_RET,lcodtr COD_TRX,limpgs IMPORTE,--coddes DESCRIP_RET,--lbinpr BIN,--
lerrnb REFE_BEPSA, lidcom COD_COMER,lcomtr LOCAL_COMER,LECA62 ATM_POS,lactfj cod_act,lcautr cod_aut,lnfisc adq
--SELECT SUBSTR(LFECTR,1,4)||'-'||SUBSTR(LFECTR,5,2)||'-'||SUBSTR(LFECTR,7,2) fecha
/*
select distinct(lactfj) id_terminal,SUBSTR(LFECTR,1,4)||'-'||SUBSTR(LFECTR,5,2)||'-'||SUBSTR(LFECTR,7,2),lfectr fecha,lidcom cod_comercio,lcomtr descripcion,
count(*)cantidad_trx,lesttr estado, lcretr cod_respuesta,substr(leca62,1,1) modelo_pos
*/
--select sum (limpgs) importe,count(*) cantidad,lcodbc VISA, LENEMI ADQ_CONTI
-- *
FROM libdebito.drconbep
--INNER JOIN GXBDBPS.COMAEAF a ON substr(digits(c.lidcom), 6, 7) = a.cocomer
--select * from libdebito.drconbep
--inner join gxbdbps.cozonaf b on a.zonacodi=b.zonacodi
WHERE lfectr BETWEEN '20220211' AND '20220211'
--and lerrnb in ('134812081568') --referencia
--and lerrnb in ('134110612898','134110612907','134110612917','134110612929')
--and substr(lidtra,1,1)='P' --pos o atm
--and lenemi in ('020','002','040','015','530')
and lbinpr in ('457572')
--and lbinpr in ('456976','488234','443078')
--and lcodbc in ('MST')
--and lbinpr='230671'
--and lcretr in ('57')--,'92')--,'92','91')
-- and lenemi='152'
--and lenemi='510'
--and lidcom in ('0302389')
--and lcodtr in ('370000','380000','390000','000052')
--aand lcodtr in ('300000','301000','302000','311000','311100','312000','312100','313000','313100','314001')
--and lbinpr='516400'
--and lhortr >'100000'
--and lnrtar in ('542116320714685')
order by lhortr desc

--para verificar transacciones si cae la red

select * from libdebito.drconbep where LFECTR ='20220211' and LBINPR = '703002' and LHORTR>='160000' order by lhortr desc

select * from libdebito.drconbep where LFECTR ='20220211' and LBINPR = '703002' and LHORTR>='160000' order by lhortr desc

select * from libdebito.drconbep where lfectr>='20211216' and LBINPR='703002' and lhortr>='150000' order by lhortr desc
