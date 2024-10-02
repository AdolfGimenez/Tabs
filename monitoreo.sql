--VER TRANSACCIONES VISA EMISOR BEPSA BNF  
select lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr  as Comercio,lnrtar as TARJETA,--,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,
lbinpr as Bin ,lenemi EMISOR, lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por,leca62 as Version,lerrnb as Referencia,LNFACT AS PAIS,-- LPOSEM AS ENTRADA  ,lbcocr 
CASE
  WHEN LPOSEM ='0710' THEN 'CONTACTLESS'
  WHEN LPOSEM ='0510' THEN 'CHIP'
  WHEN LPOSEM ='0910' THEN 'BANDA'
  WHEN LPOSEM ='0100' THEN 'ECOMMERCE'
  --WHEN LPOSEM ='051' THEN 'DESCONOCIDO1'
  ---WHEN LPOSEM ='510' THEN 'DESCONOCIDO2'
  END AS MODO_ENTRADA
from libdebito.drconbep where lfectr between '20220310' and '20220310A$unc10n#2019' and lnrtar like '488234%' AND LPOSEM  IN ('0100','0510')--traer por Internet y Chip
order by lhortr desc;
---------------------------------------------------------------------------------------------------------------------------------------
--VER TRANSACCIONES VISA BEPSA-BNF
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr  as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,
lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,lbcocr ,leca62 AS VERSION,loritr as ATM_POS,lerrnb as Referencia 
from libdebito.drconbep where lfectr between '20220310' and '20220310' and lnrtar like '589434%'
--and lcretr in ('48') 
  --and lenemi in ('530')--
--and lbinpr= '488234'
order by lhortr desc;
---------------------------------------------------------------------------------------------------------------------------------------
--DINELCO VISA BNF
select  lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lenemi as emisor,
lbinpr as Bin ,lcodbc as Marca ,limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por,leca62 AS VERSION,loritr as ATM_POS,lerrnb as Referencia 
from libdebito.drconbep
where lfectr between '20220310' and '20220310' and  lnrtar like '488234%'   
order by lhortr desc;
---------------------------------------------------------------------------------------------------------------------------------------
--DINELCO BNF 7030
select lfectr, lhortr, lnrtar, lidcom, lcomtr, limpgs, lesttr, lcretr
from libdebito.drconbep 
where lfectr between '20220310' and '20220310' and lnrtar like '703002%' 
--and lcretr in ('96')
order by lhortr desc; 

--Dinelco Continental
select lcotel, lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio, --SUBSTR --lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,
lnrtar, lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 AS VERSION ,loritr as ATM_POS,lerrnb as Referencia , LSALTR AS SALDO_TARJETA,LENEMI COD_ENTIDAD from libdebito.drconbep where lfectr between '20220310' and '20220310' and lnrtar like '703020%' order by lhortr desc;

--Visa Continental
select lcotel, lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio, --SUBSTR --lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,
lnrtar, lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 AS VERSION ,loritr as ATM_POS,lerrnb as Referencia , LSALTR 
AS SALDO_TARJETA,LENEMI COD_ENTIDAD from libdebito.drconbep where lfectr between '20220310' and '20220310' and lnrtar like '456976%' order by lhortr desc;

--MasterCard Continental
select lcotel, lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio, --SUBSTR --lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,
lnrtar, lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 AS VERSION ,loritr as ATM_POS,lerrnb as Referencia , LSALTR AS SALDO_TARJETA,LENEMI COD_ENTIDAD from libdebito.drconbep where lfectr between '20220310' and '20220310' and lnrtar like '230671%' order by lhortr desc;

--ADQ MST 01 - 02
select lfectr FECHA,lhortr HORA,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lcautr as autorizacion,limpgs MONTO,lesttr ESTADO,lcretr RETORNO,lbinpr Bin, pdescricion descrip_tarje,LCODBC MARCA,LENEMI COD_ENTIDAD,LHISDE EMISOR,LORITR DISPOSITIVO, LNFACT PAIS,lactfj,lerrnb as Referencia ,leca62 POSATM from libdebito.drconbep inner join libdebito.tbinproc on pbin=lbinpr where lfectr in '20220310' and lenemi in ('530','560','590','570')order by lhortr desc;

--TRX PROCARD - 03
select lfectr FECHA,lhortr HORA,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,limpgs MONTO,lesttr ESTADO,lcretr RETORNO,lbinpr Bin, pdescricion descrip_tarje,LCODBC MARCA,LENEMI COD_ENTIDAD,LHISDE EMISOR,LORITR DISPOSITIVO, LNFACT PAIS,lactfj from libdebito.drconbep inner join libdebito.tbinproc on pbin=lbinpr where lfectr in '20220310' and lenemi in ('510')order by lhortr desc;

-- VISA EMISOR Y ADQ - 04
select lfectr fecha_real,lhortr hora,limpgs importe,lesttr estado,lcretr retorno,b.vipannmbr tarje_visa,b.virol,b.vif044rmsg mensaje,lcodbc MARCA,lenemi entidad,lcodtr cod_trx,lidcom cod_comercio,substr(lerrnb,2,13) refencia,lcomtr comercio,leca62 POSATM,substr(lidtra,1,1) Origen from libdebito.drconbep inner join visa.vistrndta b on lerrnb=virrnbepsa where lfectr between '20220310' and '20220310' order by lhortr desc;

-- VISA DE BNF - 05 604266
select lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 AS VERSION ,loritr as ATM_POS,lerrnb as Referencia , LSALTR AS SALDO_TARJETA,LENEMI COD_ENTIDAD from libdebito.drconbep where lfectr between '20220310' and '20220310' and lnrtar like '488234%' order by lhortr desc;
 
-- VISA DE CONTINENTAL - 06
select lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 AS VERSION ,loritr as ATM_POS,lerrnb as Referencia , LSALTR AS SALDO_TARJETA,LENEMI COD_ENTIDAD from libdebito.drconbep where lfectr between '20220310' and '20220310' and lnrtar like '443078%' order by lhortr desc;

-- COOPERATIVA CAPIATA
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr from libdebito.drconbep
where lfectr between '20220310' and '20220310' and lnrtar like '627431107%' order by lhortr desc;

-- COOPERATIVA MBURICAO
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr from libdebito.drconbep
where lfectr between '20191031' and '20191031' and lnrtar like '627431113%' order by lhortr desc;  

--COOPERATIVA CABAL
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lbinpr,lcodbc, lcretr from libdebito.drconbep
where lfectr between '20220310' and '20220310' and lenemi='512'  --and lcretr in ('XD','92','63') --and lhortr > '200000'
order by lhortr desc;

---- PANAL
select lfectr,lhortr,lerrnb,lidcom,lcomtr,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,limpgs,lesttr,lcodbc,lcretr from libdebito.drconbep
where lfectr between '20220310' and '20220310' and lnrtar  like '602049%'  and lhortr > '0000000'
order by lhortr desc;

-- COOPERATIVA ÑEMBY - 09
select lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 AS VERSION ,loritr as ATM_POS,lerrnb as Referencia ,LENEMI COD_ENTIDAD from libdebito.drconbep where lfectr between '20220310' and '20220310' and lenemi='174' order by lhortr desc;

--TARJETA DINELCO BNF 703002 - 10
select lfectr AS FECHA,lhortr AS HORA,lidcom AS COD_COMERCIO,lcomtr AS COMERCIO,lnrtar AS Tarjeta,limpgs AS IMPORTE,lesttr AS ESTADO,lcretr as RETORNO,lerrnb Cod_Ref,loritr as ORIGEN from libdebito.drconbep where lfectr between '20220310' and '20220310' and lnrtar like '703002%' order by lhortr desc ;

-- BANCO RIO - 11
select lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 AS VERSION ,loritr as ATM_POS,lerrnb as Referencia ,LENEMI COD_ENTIDAD from libdebito.drconbep where lfectr between '20220310' and '20220310' and lnrtar like '703040%' order by lhortr desc;

-- TARJETA JPOS 11 - 12
SELECT lfectr FECHA,lhortr HORA,lbcodb,LENEMI ENTIDAD, lcored ,LCODBC MARCA,lesttr ESTADO,lcretr COD_RETORNO,LENEMI COD_ENTIDAD,lcodtr COD_TRX,limpgs IMPORTE,lcotel celular,lerrnb REFE_BEPSA, lidcom COD_COMER,lcomtr LOCAL_COMER,LECA62 version_pos,lactfj cod_act,lcautr cod_aut from libdebito.drconbep WHERE lfectr BETWEEN '20220310' AND '20220310' and substr(leca62,9,10) like ('%J%')order by lhortr desc;

--TRANSACCIONES PERSONAL 12 - 13
select lfectr AS FECHA,lhortr AS HORA,lidcom AS COD_COMERCIO,lcomtr AS COMERCIO,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,limpgs AS IMPORTE,lesttr AS ESTADO,lcretr as RETORNO,lhisde as Respondido_Por,lerrnb Cod_Ref,loritr as ORIGEN, LCOTEL from libdebito.drconbep where lfectr between '20220310' and '20220310' and lcodtr='567102' order by lhortr desc;

--BILLETERA TIGO13 - 14
select lfectr AS FECHA,lhortr AS HORA,lidcom AS COD_COMERCIO,lcomtr AS COMERCIO,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,limpgs AS IMPORTE,lesttr AS ESTADO,lcretr as RETORNO,lhisde as Respondido_Por,lerrnb Cod_Ref,loritr as ORIGEN,lcotel celular from libdebito.drconbep where lfectr between '20220310' and '20220310' and lnrtar like '627431581%' order by lhortr desc;

--- BILLETERA TIGO MONEY 14 - 15
select lfectr AS FECHA,lhortr AS HORA,lidcom AS COD_COMERCIO,lcomtr AS COMERCIO,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,limpgs AS IMPORTE,lesttr AS ESTADO,lcretr as RETORNO,lhisde as Respondido_Por,lerrnb Cod_Ref,loritr as ORIGEN from libdebito.drconbep where lfectr between '20220310' and '20220310' and lnrtar like '627431152%' order by lhortr desc;

---TARJETA TIGO CICO RETIRO CARGA Y GIROS - 16
select lfectr AS FECHA,lhortr AS HORA,lidcom AS COD_COMERCIO,lcomtr AS COMERCIO,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,limpgs AS IMPORTE,lesttr AS ESTADO,lcretr as RETORNO,lhisde as Respondido_Por,lerrnb Cod_Ref,lcotel celular,loritr as ORIGEN,lcodtr Transaccion from libdebito.drconbep where lfectr between '20220310' and '20220310' and lcodtr in ('380000','370000','390000')order by lhortr desc;
