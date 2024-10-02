
select * from libdebito.drconbep where lidcom ='05400617' and lfectr = '20220418' --and lerrnb = '135012994509'

--BNF DINELCO- 01
select lcotel, lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio, --SUBSTR --lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,
lnrtar, lbinpr as Bin , lcodbc as Marca , limpgs as Monto, lcodtr cod_trx, lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 AS VERSION ,loritr as ATM_POS,lerrnb as Referencia ,
LSALTR AS SALDO_TARJETA,LENEMI COD_ENTIDAD from libdebito.drconbep where lfectr between '20220418' and '20220418' and lnrtar like '703002%' 
--and lcodtr=324000 
order by lhortr desc;

select lfectr between '20220418' and '20220418' and lcodtr='567102' order by lhortr desc;

select lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,l
hisde as Respondido_Por ,leca62 AS VERSION ,loritr as ATM_POS,lerrnb as Referencia , LSALTR AS SALDO_TARJETA,LENEMI COD_ENTIDAD from libdebito.drconbep 
where lfectr --and cod_trx '65' 
between '20220418' and '20220418' and lnrtar like '546297%' order by lhortr desc;

select lcotel, lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio, --SUBSTR --lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,
lnrtar, lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 AS VERSION ,loritr as ATM_POS,lerrnb as Referencia , LSALTR AS SALDO_TARJETA,LENEMI COD_ENTIDAD from libdebito.drconbep 
where lfectr between '20220418' and '20220418' and lerrnb ='134912667375'--lnrtar like '703002%' 
order by lhortr desc;

select lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,
lhisde as Respondido_Por ,leca62 AS VERSION ,loritr as ATM_POS,lerrnb as Referencia , LSALTR AS SALDO_TARJETA,LENEMI COD_ENTIDAD from libdebito.drconbep 
where lfectr --and cod_trx '65' 
between '20220418' and '20220418' and lnrtar like '703002%' order by lhortr desc;

--Dinelco Continental
select lcotel, lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio, --SUBSTR --lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,
lnrtar, lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 AS VERSION ,loritr as ATM_POS,lerrnb as Referencia , LSALTR AS SALDO_TARJETA,LENEMI COD_ENTIDAD
 from libdebito.drconbep where lfectr between '20220418' and '20220418' and lnrtar like '703020%' order by lhortr desc;

--Visa Continental
select lcotel, lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio, --SUBSTR --lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,
lnrtar, lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 AS VERSION ,loritr as ATM_POS,lerrnb as Referencia , LSALTR 
AS SALDO_TARJETA,LENEMI COD_ENTIDAD from libdebito.drconbep where lfectr between '20220418' and '20220418' and lnrtar like '456976%' order by lhortr desc;

--MasterCard Continental
select lcotel, lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio, --SUBSTR --lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,
lnrtar, lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,lhisde as Respondido_Por ,leca62 AS VERSION ,loritr as ATM_POS,lerrnb as Referencia , LSALTR AS SALDO_TARJETA,
LENEMI COD_ENTIDAD from libdebito.drconbep where lfectr between '20220418' and '20220418' and lnrtar like '230671%' order by lhortr desc;

--ADQ MST 01 - 02
select lfectr FECHA,lhortr HORA,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lcautr as autorizacion,limpgs MONTO,lesttr ESTADO,lcretr RETORNO,lbinpr Bin, pdescricion descrip_tarje,
LCODBC MARCA,LENEMI COD_ENTIDAD,LHISDE EMISOR,LORITR DISPOSITIVO, LNFACT PAIS,lactfj,lerrnb as Referencia ,leca62 POSATM from libdebito.drconbep inner join libdebito.tbinproc on pbin=lbinpr 
where lfectr in '20220418' and lenemi in ('530','560','590','570')order by lhortr desc;

--TRX PROCARD - 03
select lfectr FECHA,lhortr HORA,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,limpgs MONTO,lesttr ESTADO,lcretr RETORNO,lbinpr Bin, pdescricion descrip_tarje,LCODBC MARCA,LENEMI COD_ENTIDAD,LHISDE EMISOR,
LORITR DISPOSITIVO, LNFACT PAIS,lactfj from libdebito.drconbep inner join libdebito.tbinproc on pbin=lbinpr where lfectr in '20220418' and lenemi in ('510')order by lhortr desc;

-- VISA EMISOR Y ADQ - 04
select lfectr fecha_real,lhortr hora,limpgs importe,lesttr estado,lcretr retorno,b.vipannmbr tarje_visa,b.virol,b.vif044rmsg mensaje,lcodbc MARCA,lenemi entidad,lcodtr cod_trx,lidcom cod_comercio,substr(lerrnb,2,13) refencia,
lcomtr comercio,leca62 POSATM,substr(lidtra,1,1) Origen from libdebito.drconbep inner join visa.vistrndta b on lerrnb=virrnbepsa where lfectr between '20220418' and '20220418' order by lhortr desc;

-- VISA DE BNF - 05 604266
select lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,
lhisde as Respondido_Por ,leca62 AS VERSION ,loritr as ATM_POS,lerrnb as Referencia , LSALTR AS SALDO_TARJETA,LENEMI COD_ENTIDAD from libdebito.drconbep where lfectr between '20220418' and '20220418' and lnrtar like '488234%' order by lhortr desc;
 
-- VISA DE CONTINENTAL - 06
select lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,
lhisde as Respondido_Por ,leca62 AS VERSION ,loritr as ATM_POS,lerrnb as Referencia , LSALTR AS SALDO_TARJETA,LENEMI COD_ENTIDAD from libdebito.drconbep where lfectr between '20220418' and '20220418' and lnrtar like '443078%' order by lhortr desc;

--COOPERATIVA POVAROTY - 07
select lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,
lhisde as Respondido_Por ,leca62 AS VERSION ,loritr as ATM_POS,lerrnb as Referencia ,LENEMI COD_ENTIDAD from libdebito.drconbep where lfectr between '20220418' and '20220418' and lenemi='166' order by lhortr desc;

select lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,
lhisde as Respondido_Por ,leca62 AS VERSION ,loritr as ATM_POS,lerrnb as Referencia ,LENEMI COD_ENTIDAD from libdebito.drconbep where lfectr between '20220418' and '20220418' and lenemi='166' order by lhortr desc;

-- COOPERATIVA CAPIATA - 08
select lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,
lhisde as Respondido_Por ,leca62 AS VERSION ,loritr as ATM_POS,lerrnb as Referencia ,LENEMI COD_ENTIDAD from libdebito.drconbep where lfectr between '20220418' and '20220418' and lenemi='107' order by lhortr desc;

-- COOPERATIVA ÑEMBY - 09
select lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,
lhisde as Respondido_Por ,leca62 AS VERSION ,loritr as ATM_POS,lerrnb as Referencia ,LENEMI COD_ENTIDAD from libdebito.drconbep where lfectr between '20220418' and '20220418' and lenemi='174' order by lhortr desc;

--TARJETA DINELCO BNF 703002 - 10
select lfectr AS FECHA,lhortr AS HORA,lidcom AS COD_COMERCIO,lcomtr AS COMERCIO,lnrtar AS Tarjeta,limpgs AS IMPORTE,lesttr AS ESTADO,lcretr as RETORNO,lerrnb Cod_Ref,loritr as ORIGEN from libdebito.drconbep 
where lfectr between '20220418' and '20220418' and lnrtar like '703002%' order by lhortr desc ;

-- BANCO RIO - 11
select lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,
lcretr as Retorno,lhisde as Respondido_Por ,leca62 AS VERSION ,loritr as ATM_POS,lerrnb as Referencia ,LENEMI COD_ENTIDAD from libdebito.drconbep where lfectr between '20220418' and '20220418' and lnrtar like '703040%' order by lhortr desc;

-- TARJETA JPOS 11 - 12
SELECT lfectr FECHA,lhortr HORA,lbcodb,LENEMI ENTIDAD, lcored ,LCODBC MARCA,lesttr ESTADO,lcretr COD_RETORNO,LENEMI COD_ENTIDAD,lcodtr COD_TRX,limpgs IMPORTE,lcotel celular,lerrnb REFE_BEPSA, 
lidcom COD_COMER,lcomtr LOCAL_COMER,LECA62 version_pos,lactfj cod_act,lcautr cod_aut from libdebito.drconbep WHERE lfectr BETWEEN '20220418' AND '20220418' and substr(leca62,9,10) like ('%J%')order by lhortr desc;

--TRANSACCIONES PERSONAL 12 - 13
select lfectr AS FECHA,lhortr AS HORA,lidcom AS COD_COMERCIO,lcomtr AS COMERCIO,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,limpgs AS IMPORTE,lesttr AS ESTADO,lcretr as RETORNO,
lhisde as Respondido_Por,lerrnb Cod_Ref,loritr as ORIGEN, LCOTEL from libdebito.drconbep where lfectr between '20220418' and '20220418' and lcodtr='567102' order by lhortr desc;

--BILLETERA TIGO13 - 14
select lfectr AS FECHA,lhortr AS HORA,lidcom AS COD_COMERCIO,lcomtr AS COMERCIO,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,limpgs AS IMPORTE,lesttr AS ESTADO,lcretr as RETORNO,
lhisde as Respondido_Por,lerrnb Cod_Ref,loritr as ORIGEN,lcotel celular from libdebito.drconbep where lfectr between '20220418' and '20220418' and lnrtar like '627431581%' order by lhortr desc;

--- BILLETERA TIGO MONEY 14 - 15
select lfectr AS FECHA,lhortr AS HORA,lidcom AS COD_COMERCIO,lcomtr AS COMERCIO,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,limpgs AS IMPORTE,lesttr AS ESTADO,lcretr as RETORNO,
lhisde as Respondido_Por,lerrnb Cod_Ref,loritr as ORIGEN from libdebito.drconbep where lfectr between '20220418' and '20220418' and lnrtar like '627431152%' order by lhortr desc;

---TARJETA TIGO CICO RETIRO CARGA Y GIROS - 16
select lfectr AS FECHA,lhortr AS HORA,lidcom AS COD_COMERCIO,lcomtr AS COMERCIO,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,limpgs AS IMPORTE,lesttr AS ESTADO,lcretr as RETORNO,
lhisde as Respondido_Por,lerrnb Cod_Ref,lcotel celular,loritr as ORIGEN,lcodtr Transaccion from libdebito.drconbep where lfectr between '20220418' and '20220418' and lcodtr in ('380000','370000','390000')order by lhortr desc;

--Basa
select lfectr as Fecha,lhortr as Hora,lidcom as Codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lbinpr as Bin , lcodbc as Marca , limpgs as Monto,lesttr as Estado,lcretr as Retorno,
lhisde as Respondido_Por ,leca62 AS VERSION ,loritr as ATM_POS,lerrnb as Referencia , LSALTR AS SALDO_TARJETA,LENEMI COD_ENTIDAD from libdebito.drconbep where lfectr between '20220418' and '20220418' and lnrtar like '606257%' order by lhortr desc;


select* from libdebito.tbctra0p
select* from libdebito.drconbep
Select SYSDATETIME() as [SYSDATETIME]


-- TARJETAS MASTERCARD
select b.mcmti estado_mc, b.mcf044rmsg mensaje,lfectr fecha,lhortr hora,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta,lcautr as autori,limpgs As importe,
lcretr retorno,lesttr ESTAD,b.mcrol rol,lbinpr bin,d.pdescricion descrip_marca,lcodbc MARCA,lenemi entidad,c.txdtrx descrip_trx,substr(leca62,1,4) atm,substr(lerrnb,2,13) refencia,lcodtr cod_trx,lidcom cod_atm
from libdebito.drconbep inner join mastercard.mastrndta b on lerrnb=MCRRNBEPSA inner join LIBDEBITO.TBCTRA0P c on c.TXCTRX = lcodtr
inner join libdebito.tbinproc d on lbinpr=pbin --and lcretr in '91'
--and lbinpr in ('601639')--('542927','230671','530399')
and lcodtr IN ('000054','011000','012000')where lfectr between '20220418' and '20220418' and lenemi in ('530','560','590','570') --
--and pdescricion like '%CONTINENTAL%'--and lhortr>140000--
--and lcretr='91' --
--and lhortr between '165000' and '221600'
--and lnrtar like'230671%'--AND lerrnb='134110525994'--and lhortr between '160000' and '235900'
order by lhortr desc;

---BILLETERA CLARO - 17
select lfectr Fecha,lhortr Hora,lenemi Emisor,lerrnb Cod_Ref,lnrtar N_Cu,lidcom Cod_Comercio,lcomtr Comercio,lactfj Activo,(limpgs) importe,lcretr Retorno,lesttr Estado,substr(lidtra,1,1) Origen,A.TXDTRX DETALLES,lctaor numero 
from libdebito.drconbep inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr right join libdebito.tbcret0p on lcretr = codnro where lfectr in '20220418' and Lenemi='591' and codmar = 'BEPS' order by lhortr desc;

--TRX POR ATM
select lfectr as FECHA,lhortr as HORA,lcodbc as Marca,--lnrtar,--lnrtar,lerrnb as Referencia,
SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS TARJETA,---lerrnb as Referencia,
leca62 As ATM,lcomtr as NOMBRE_ATM,limpgs as MONTO,lcretr as RETORNO, lesttr as ESTADO,--coddes Descripcion_COD,lhisde as Respondido_Por,---lcodtr as COD_TRX,LSALTR AS SALDO,
(CASE WHEN LPOSEM in ('9010','9020','910','920') THEN 'BANDA MAGNETICA'
WHEN LPOSEM = '0510' THEN 'CHIP' else 'VACIO' END) Tipo_lectura
from libdebito.drconbep
--right join libdebito.tbcret0p on lcretr = codnro
where substr(lidtra,1,4) in   
('T475')
and lfectr between '20220418' and '20220418'
order by lhortr desc;

---CONSULTA DE SALDO EN TARJETAS GOURMET
select mcdisco saldo,mcnumta tarjeta from gxbdbps.tmctaaf where mcnumta='6274311550003328'

---Lenemi 540
select lenemi EMISOR,ennombr ENTIDAD, COUNT(*) CANTIDAD,substr(lidtra,1,1) Origen,lesttr AS ESTADO, 
lcretr AS COD_RETORNO, coddes Descripcion_COD,CAST(SUM(limpgs)AS bigint) importe from libdebito.drconbep 
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr 
right join libdebito.tbcret0p on lcretr = codnro 
right join gxbdbps.gentiaf ON (ENEMISO=LENemi) 
where lfectr='20220418' 
--and   lcodbc = 'VSA' and codmar='VISA' 
and lenemi='508' 
GROUP BY lcretr, lcodbc,LENEMI,coddes, lesttr,substr(lidtra,1,1),ennombr 
order by substr(lidtra,1,1) desc, lcretr asc, cantidad desc;

---Lenemi 015 y 020 Visa de Emisor---
select cast(TO_DATE(cast(lfectr as varchar(8)),'YYYYMMDD')as date) AS FECHA, lcodbc AS MARCA,lenemi EMISOR,ennombr ENTIDAD, COUNT(*) CANTIDAD ,lesttr AS ESTADO, lcretr AS COD_RETORNO, coddes Descripcion_COD,CAST(SUM(limpgs)AS bigint) importe 
from libdebito.drconbep inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr right join libdebito.tbcret0p on lcretr = codnro right join gxbdbps.gentiaf ON (ENEMISO=LENemi) and   lcodbc = 'VSA' and codmar='VISA' where lfectr='20220418' 
and lcodbc='VSA' and  codmar = 'VISA' and lenemi in ('015','020') GROUP BY Lfectr, lcretr, lcodbc,LENEMI,coddes, lesttr,ennombr order by lenemi desc , lcretr asc, cantidad desc;

--RECHAZOS BIN MST CONTADOR
select COUNT(*) CANTIDAD,lcretr RETORNO, coddes Descripcion_COD,lbinpr bin,lcodbc AS MARCA,pdescricion Marca_tarjeta --,loritr dispositivo 
from libdebito.drconbep
left join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
left join libdebito.tbcret0p on lcretr = codnro
left join libdebito.tbinproc on pbin=lbinpr
where lfectr='20220418'
and lcodbc='VSA'
and lbinpr in '425936' --('443078','488234')
and lhortr >'20220418'
and codmar='BEPS'
--and LHORTR BETWEEN '055400' AND '060700'
AND LCRETR in ('05')
--and lbinpr in ('601638','542116')
--and lcodtr='000052'
GROUP BY lcodbc,lbinpr,lcretr,CODDES,pdescricion;

---Rechazos bin VISA
select COUNT(*) CANTIDAD,lcretr RETORNO, coddes Descripcion_COD,lbinpr bin,lcodbc AS MARCA,pdescricion Marca_tarjeta --,loritr dispositivo
from libdebito.drconbep
left join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
left join libdebito.tbcret0p on lcretr = codnro
left join libdebito.tbinproc on pbin=lbinpr
where lfectr='20220418'
and lcodbc='VSA'
and lbinpr in '425936' --('443078','488234')
and lhortr >'20220418'
and codmar='BEPS'
--and LHORTR BETWEEN '055400' AND '060700'
AND LCRETR in ('91','05')
--and lbinpr in ('601638', '542116')
--and lcodtr='000052'
GROUP BY lcodbc,lbinpr,lcretr,CODDES,pdescricion;

------BNF CONTADORES de rechazos 703002 por hora
select COUNT(*) CANTIDAD,lcodbc marca,lcretr retorno from libdebito.drconbep where lfectr='20220418'and lnrtar like '443078%' and lcretr in ('19') and lhortr between '141000' and '145900' GROUP BY lcretr,lcodbc;

select COUNT(*) CANTIDAD,lcodbc marca,lcretr retorno from libdebito.drconbep where lfectr='20211127'and lnrtar like  '627431152%' and lcretr in ('91') and lhortr between '000000' and '230000' GROUP BY lcretr,lcodbc;

select COUNT(*) CANTIDAD,lcodbc marca,lcretr retorno from libdebito.drconbep where lfectr='20211127'and lcodtr in ('000052','567102', '000072') and lcretr in ('91') and lhortr between '000000' and '230000' GROUP BY lcretr,lcodbc;

--Monitoreo Adquirencia Mastercard
select lcodbc AS MARCA, COUNT(*) CANTIDAD, lcretr AS COD_RETORNO, coddes Descripcion_COD --,lbinpr as Bin
from libdebito.drconbep
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join libdebito.tbcret0p on lcretr = codnro
where lfectr='20220418'
and lcodbc IN ('MST')
--and lnrtar like '606257%'
and codmar='MSTC'
--and codmar IN ('MST')
and lenemi in ('530','540','560','570','590')
and lcretr in ('91')
and lhortr between '084000' and '085500'
GROUP BY Lfectr, lcretr,lcodbc,coddes --,lbinpr
order by Lfectr,lcretr asc, cantidad desc;


--USAR ESTE PARA BILLETERAS TIGO Y CICO
select COUNT(*) CANTIDAD,lcretr RESPUESTA,A.TXDTRX DETALLES
from libdebito.drconbep
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
--right join libdebito.tbcret0p on lcretr = codnro--and lenemi in ('571','581','582')---
--and lcodtr in ('000052')
where lcodtr in ('000052','567102','370000','380000','390000') AND lcodbc in ('TCO', 'TCI', 'TGI','BIL')-- and lcodtr in ('370000', '380000', '390000') --lnrtar like '627431152%' --and --
and lfectr='20220418' and lhortr between '20220418' and '112000' and lcretr in ('93','92','91','96')--and limpgs>1--and codmar = 'BEPS'
GROUP BY lbinpr,lcretr,TXDTRX
order by lhortr desc;

--------SQL BINES A MONITOREAR----
select lfectr fecha,lhortr hora,lidcom cod_comer,lcomtr comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS TARJETA
,limpgs monto,lesttr estado
,lcretr retorno,LCODBC marca
,lbinpr bin,LORITR dispositivo
,lenemi
from libdebito.drconbep
where lfectr in '20220418'
--and loritr='P'
and lcodbc='PAN'
--and lesttr='R'
--AND LCRETR='00'
--and lnrtar='%610'
--and lcomtr LIKE 'CHARL%'
--AND LNRTAR='7030400123726007'
--and lhortr > '025100'
--and loritr='P'
--AND LENEMI='510'
--and lidcom='0703002'
--and lerrnb='109953341963'
--and lcodtr='000052'
--and loritr='A'
--and lcodtr='567102'
--AND LCODBC LIKE '%COOPM4%'
--AND LENEMI='177'
--AND LERRNB='112057873094'
--and lcodtr in ('370000','380000','390000')
--and lbinpr='456976'
--and lesttr='R'
--and lhortr>'053000'
--and lbinpr in '499831' --('456976','458189','422410','425936')
--and lcretr in '05'
--and lcretr='51'
--and lbinpr in '703002'--- ('703002','443078','488234')
--AND LCODBC='VSA'
order by lhortr desc;


--------SQL BINES A MONITOREAR----
select lfectr fecha,lhortr hora,lidcom cod_comer,lcomtr comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS TARJETA
,limpgs monto,lesttr estado,lcretr retorno
,LCODBC marca,lbinpr bin,LORITR dispositivo,lenemi,ennombr ENTIDAD
from libdebito.drconbep
right join gxbdbps.gentiaf ON (ENEMISO=LENemi)
where lfectr in '20220418'
--and lbinpr like '627431%'
and lenemi='170'
order by lhortr desc;

--TRX x Hora
select substr((lhortr + 10000000),3,2) Hora, count(*) Cant, sum(limpgs) Importe
from libdebito.drconbep where lfectr between '20220418' and '20220418'
--and lcodtr in ('567102')
and substr(lidtra,1,1) = 'T' --EN ATM
--and substr(lidtra,1,1) = 'P' --EN POS
group by substr((lhortr + 10000000),3,2) order by substr((lhortr + 10000000),3,2) desc

--VER TRANSACCIONES POR INICIO DE HORA RECHAZADAS RROCARD
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr from libdebito.drconbep
where lfectr between '20220127' and '20220127' and lenemi='510' and lhortr > '90000'-- and lcretr in ('96','91','XD','92','94', '60') 
order by lhortr desc

--verificar trx tigo handlerWS-- SIN TARJETA
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr from libdebito.drconbep
where lfectr between '20220127' and '20220127' and lnrtar like '627431581%' --and lcretr in ('96','91','XD','92','94', '60')
order by lhortr desc 

--verificar tigo companion-- CON TARJETA
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr from libdebito.drconbep
where lfectr between '20220127' and '20220127' and lnrtar like '627431152%' order by lhortr desc 

-- DINELCO BNF
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr from libdebito.drconbep
where lfectr between '20220127' and '20220127' and lnrtar like '7030%'-- and lcretr='16'
 order by lhortr desc 

--VISA
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr from libdebito.drconbep
where lfectr between '20220127' and '20220127' and lnrtar like '443078%' order by lhortr desc 

--MASTERCARD
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr from libdebito.drconbep
where lfectr between '20220127' and '20220127' and lnrtar like '516400%' order by lhortr desc --

select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr from libdebito.drconbep
where lfectr between '20220127' and '20220127' and lnrtar like '601638%' order by lhortr desc --

select ---count (*)
*from libdebito.drconbep
where lfectr between '20220127' and '20220127'
and lcretr='55'
and SUBSTR(LNRTAR,1,6) IN ('443078')
order by lhortr desc

----------------------------------------------------------------------------------------------------------------     
    
--verificar trx por comercio--
select lfectr, lhortr, lnrtar, lidcom, lcomtr, limpgs, lcretr, lesttr from libdebito.drconbep
where lfectr between '20181107' and '20181107' and lidcom='9099248'-- order by lhortr desc
and limpgs = '140000'  and substr(lidtra,1,1) = 'T' and lhortr between '073000' and '080000'

----------------------------------------------------------------------------------------------------------------
--USUARIOS TIGO MONEY
select * from roshkalib.m_usuarios
where numero_celular = '0983214316'

------------------------------------------------------------------------------------------------------------------
---TRX DE UN COMERCIO EN ESPECÍFICO 
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr from libdebito.drconbep
where lfectr between '20220127' and '20220127' and lidcom='0700537' order by lhortr desc 

-------------------------------------------------------------------------------------------------------------------
select lfectr, lhortr, lnrtar, lidcom, lcomtr, limpgs, lcretr, lesttr
from libdebito.drconbep 
where lfectr between '20181210' and '20181210' and lnrtar like '627431581%' order by lhortr desc
------------------------------------------------------------------------------------------------------------------- 
--PARA VER UN CÓDIGO DE RETORNO EN ESPECÍFICO
select lfectr, lhortr, lnrtar, lexpir, lcodbc, lidcom, lcomtr, limpgs, lcretr, lesttr
from libdebito.drconbep 
where lfectr='20220127'
--and SUBSTR(LNRTAR,1,6) IN ('703002')
and lcretr='96' 
order by lhortr desc 
------------------------------------------------------------------------------------------------------------------- 
select lfectr, lhortr, lnrtar, lidcom, lcomtr, limpgs, lcretr, lesttr, substr(leca62,1,2)
from libdebito.drconbep 
where lfectr='20220127'
and substr(leca62,1,2)='XV'
order by lhortr desc
-------------------------------------------------------------------------------------------------------------------
--DINELCO BNF 7030
select lfectr, lhortr, lnrtar, lidcom, lcomtr, limpgs, lesttr, lcretr
from libdebito.drconbep 
where lfectr between '20220127' and '20220127' and lnrtar like '7030%' order by lhortr desc

-------------------------------------------------------------------------------------------------------------------
select lfectr, lhortr, lnrtar, lexpir, lcodbc, lidcom, lcomtr, limpgs, lcretr, lesttr 
from libdebito.drconbep  
where lnrtar='6274311510002725' 
order by lfectr, lhortr desc


-- COOPERATIVA CAPIATA
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr from libdebito.drconbep
where lfectr between '20220127' and '20220127' and lnrtar like '627431107%' order by lhortr desc 

-- COOPERATIVA MBURICAO
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr from libdebito.drconbep
where lfectr between '20220127' and '20220127' and lnrtar like '627431113%' order by lhortr desc 

--verificar personal--
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr from libdebito.drconbep
where lfectr between '20220127' and '20220127' and lnrtar like '627431571%' order by lhortr desc 

--COOPERATIVA YPAKARAI
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr from libdebito.drconbep
where lfectr between '20220127' and '20220127' and lnrtar like '627431103%' order by lhortr desc 

--VER TRANSACCIONES POR INICIO DE HORA RECHAZADAS DE PROCARD
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar, lbinpr, lcodbc, limpgs,lesttr,lcretr from libdebito.drconbep
where lfectr between '20220127' and '20220127' and lenemi='510' --and lnrtar '4430761400004536'--and lcretr in ('09')and lhortr > '63000'--'91','XD','92')-- and lcretr in ('96','91','XD','92') 
order by lhortr desc

--TABLA DE BINES
select * from libdebito.tbinproc
where pbin = '109910'

--VER TRANSACCIONES POR INICIO DE HORA APROBADAS
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lbinpr,lcodbc, lcretr from libdebito.drconbep
where lfectr between '20220127' and '20220127' and lenemi='510'-- and lcretr in ('12') --and lhortr > '60000'
order by lhortr desc

---------------370 carga , 380 retiro, 390 giro
select lfectr,lhortr,lerrnb,lidcom,lcomtr,lnrtar,limpgs,lesttr,lcretr, lcodtr codtrx from libdebito.drconbep
where lfectr between '20220127' and '20220127' and lcodtr in  ('370000','380000','390000') 
order by lhortr desc
--------------------------------------------------------------------------------------------------------------------------
------------------------TRANSACCIONES ATM-CENTRE -------------------------------------------------------------------------
select lfectr as FECHA,lhortr as HORA,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS TARJETA,leca62 As ATM,lcomtr as NOMBRE_ATM,limpgs as MONTO,lcretr as RETORNO, lesttr as ESTADO from libdebito.drconbep
where substr(lidtra,1,4) in
('T011','T026','T070','T278','T370','T403','T408','T420','T461','T462','T001','T415','T423','T424','T441','T405','T410')
and lfectr='20220127'
order by lhortr desc
---------------------------------------------------------------------------------------------------------------------------
--SQL para controlar si ingresan transacciones desde la red de infonet con nuestras tarjetas.

select lfectr fecha_real , lfcotr fecha_com,lhortr HORA,SUBSTR(lnrtar,1,6) || 'XXXXXX' ||SUBSTR(lnrtar,13,4) TARJE,lnrtar,lhisde,
lenemi emisor,lbinpr bin,lposem,lcotel celular,
lesttr ESTADO,lcretr COD_RET,lcodtr COD_TRX,limpgs IMPORTE,--coddes DESCRIP_RET,--lbinpr BIN,--
lerrnb REFE_BEPSA, lidcom COD_COMER,lcomtr LOCAL_COMER,LECA62 ATM_POS,lactfj cod_act,lcautr cod_aut,lnfisc adq,ldistr,lnfisc
FROM libdebito.drconbep
WHERE lfectr BETWEEN '20220304' AND '20220304'
/*and lbinpr in(
'230671', --mastercard debito
'530399', --mc oro conti
'514848', --mc black
'542927', --mc clasica
'547697', -- mc waled
'546297', --mc debito rio
'230729') --mc prepaga conti
*/
and lnfisc in ('472040','443073')--,'','','') --bin adq infonet pos
and lcodbc in ('MST','VSA')--,'CAB')
order by lhortr desc
--tambien para que sepan , ahí están comentados los bines que son nuestros las MC  , Marca y clase ,las de Visa ya saben cuales son 456976 y 488234

