SELECT lfectr FECHA,lhortr HORA,/*SUBSTR(lnrtar,1,6) || 'XXXXXX' ||SUBSTR(lnrtar,13,4) TARJE*/lnrtar tarje,lexpir VTO,lbinpr bin,
lbcodb,LENEMI ENTIDAD, LCODBC MARCA,/*,pdescricion MARCA*/lcampo22,lcampo44,
--SELECT lfectr FECHA,lhortr HORA, lntoke, LCODBC MARCA,/*,pdescricion MARCA
lesttr ESTADO,lcretr COD_RETORNO,lcodtr COD_TRX,--coddes DESCRIP_RET,--lbinpr BIN,--,pdescricion MARCA_ENTIDAD,
lerrnb REFE_BEPSA, lidcom COD_COMER,lcomtr LOCAL_COMER,limpgs IMPORTE,/*txdtrx DESC_TRX,*/LECA62,lactfj,lcotel--LNFISC,LPOSEM,LMCCTR,LNFACT--,lntoke--, enemiso BANCO,tgdesc DESCRIPCION
---select count(*) CANT,lcretr COD_RET,pdescricion MARCA,substr(lidtra,1,1) DISPOSITIVO
--select distinct(SUBSTR(lnrtar,1,6)||'XXXX'||SUBSTR(lnrtar,10,16)) TARJ,count(*) CANT_TRX,lfectr FECHA,lctaor CTA_ORI,lcretr COD_RET
--select *--FROM libdebito.drconbep  --select * from libdebito.
--select lfectr FECHA,count(*) CANTIDAD,lnrtar TARJETA,lcretr COD_RETORNO,LCODBC Marca,substr(lidtra,1,4) DISPOSITIVO--pdescricion MARCA--,--lbinpr 
--select count(*) CANTIDAD,lfectr FECHA,lcretr COD_RETORNO,LCODBC MARCA,lbcodb,LBINPR BIN,substr(leca62,1,4) DISPOSITIVO,LCOMTR CAJERO--,--lbinpr 
--Select lerrnb,lnrtar,lbinpr,lcodbc
--select sum(limpgs) IMPORTE,lidcom COD_COMERCIO,lcomtr DESCRIPCION
--select *
from libdebito.drconbep --inner join gxbdbps.tmtaraf on lnrtar=mtnumta
--select * from libdebito.tbctra0p --tabla de transacciones
--select * from libdebito.tbcret0p --tabla de cod de retorno
--LEFT JOIN libdebito.tbcret0p ON lcretr = codnro
--inner join libdebito.tbctra0p on lcodtr=txctrx
--inner join gxbdbps.comaeaf on substr(digits(lidcom), 6, 7)= cocomer
--left join contabilid.tatgene on tgenti = enemiso
WHERE lfectr BETWEEN '20231001' AND '20231019'

--and lenemi='530'
order by lhortr desc

/*
select count(*) CANTIDAD,substr(lidtra,1,1) Dispo,lcodtr Cod_Trx,TXDTRX Descrip_Trx 
from libdebito.drconbep --inner join gxbdbps.tmtaraf on lnrtar=mtnumta
inner join libdebito.tbctra0p on lcodtr=txctrx
--inner join gxbdbps.comaeaf on substr(digits(lidcom), 6, 7)= cocomer
--left join contabilid.tatgene on tgenti = enemiso
WHERE lfectr BETWEEN '20200218' AND '20200218'
--and substr(lidtra,1,1)='T'
and lcretr in ('91','96','92','88')
group by substr(lidtra,1,1),lcodtr,txdtrx
*/

/*
select count(*) CANTIDAD,substr(lidtra,1,1) Dispositivo
from libdebito.drconbep --inner join gxbdbps.tmtaraf on lnrtar=mtnumta
inner join libdebito.tbctra0p on lcodtr=txctrx
--inner join gxbdbps.comaeaf on substr(digits(lidcom), 6, 7)= cocomer
--left join contabilid.tatgene on tgenti = enemiso
WHERE lfectr BETWEEN '20200218' AND '20200218'
--and substr(lidtra,1,1)='T'
and lcretr in ('91','96','92','88')
group by substr(lidtra,1,1)
*/
/*
select count(*) CANTIDAD,lfectr fecha,substr(lhortr,1,4) hora_min
from libdebito.drconbep --inner join gxbdbps.tmtaraf on lnrtar=mtnumta
inner join libdebito.tbctra0p on lcodtr=txctrx
WHERE lfectr BETWEEN '20200101' AND '20200131'
--and lhortr between '190000' and '200000'
and lcretr in ('96')--,'93')--,'92')-- and lesttr='A'
AND LBINPR='703002'
group by lfectr,substr(lhortr,1,4)
*/

/*
select cocomer,codeno,adnumcta,enemiso,tipacodi,pecodi,coobse,comadre,cofactu,coctadeb from gxbdbps.comaeaf where enemiso='057' and costat='0'
*/
--select * from gxbdbps.atmctxdest

--select * from atmcentre.tbbine0p
/*
select * from libdebito.tbinproc where pbin in (
'514848',
'530399',
'542927',
'230671',
'230729')
*/

--select * from gxbdbps.tgtclf where enemiso='021'

--select * from gxbdbps.comaeaf where codeno like '%CASINO%'
/*
select *
-- substr(atfecom,1,6)
from gxbdbps.autaraf where --substr(atfecom,1,6)='202001'
--group by atfecom
atnumta='6274313320013249'
*/
/*select * from libdebito.bst015 where bs15codcom like '%0100001%'*/

--1000416
--select * from gxbdbps.coafmaf where afcodi='53724375'
--select * from gxbdbps.terminal where tertid='53724375'
--select * from gxbdbps.comms
--UPDATE GXBDBPS.COMMS SET COMMTOCONN = '70' 
--select * from gxbdbps.comaeaf where cocomer in ('6900281','6900282')

/*
select * from gxopera.revcico
*/


--select * from libdebito.tgembhaf  where crenti ='002'

select * from GXBDBPS.TPRMUTTX where PRTXBINE like '230671%' AND PRTXCANL='TM' AND PRTXTARC LIKE '%1307452523%'
SELECT * FROM GXBDBPS.TDEMNOTAR  WHERE NENROTARJ='2306710002130814'


SELECT * FROM  MASTERCARD.MASLOG001

