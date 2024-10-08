/*CONSULTAS PARA MASTERCARD*/
                                                       
select * from mastercard.masctldta 
where date (mcrevdatt) between  '2022-07-07' and '2022-07-07'
--substr(mc002,1,6)='514848'
 --mcfld037='130521027468'
--and mc002 like  ('5557886010082061 %')
--and mc043 like '%LATAM%'
order by mcrevdatt desc

5557886010082061
select  mcrol,mcmti,MCFLD037,mcpannmbr TARJE ,mcfeccom,mcfecreal,mchorareal,mcimporte,MCF044RMSG
from mastercard.mastrndta 
where 
mcfecreal='20220705' 
and  mcrol in ('ADQ')
--and substr(mc002,1,6) ='546297'
--and mcrrnbepsa='204833760127'
--and mcpannmbr='5557886010082061'
--and substr(mcpannmbr,1,6)='514848'
AND MCMTI='430'
GROUP BY mcrol,mcmti,MCFLD037,mcpannmbr,mcfeccom,mcfecreal,mchorareal,mcimporte,MCF044RMSG
order by mchorareal desc

select * from gxbdbps.lgcoment where lgentid='1020' and date(lgfechor)='2022-03-19'--  and lgentid='1020' 
and lgmsg like '%07842650868%'
order by lgfechor desc



select * from gxopera.opliqui 


select * from gxbdbps.cardranges where binlo='552289'
select mcrol,mcmti,mcrrnbepsa,mcmovseq,mcpannmbr,mcfecreal,mchorareal,mcdistip,mccomcod,mcf044rmsg from mastercard.mastrndta where mcfecreal='20200615' and mccomcod='302179'

************************************************************************************************
*                               /*CONSULTAS PARA MASTERCARD PARA EVENTOS*/                     *
************************************************************************************************
--select * from gxtrjdta.tdgbin
SELECT lfectr FECHA,lhortr HORA,/*SUBSTR(lnrtar,1,6) || 'XXXXXX' ||SUBSTR(lnrtar,13,4) TARJE*/lnrtar tarje,lexpir VTO,lbinpr bin,
lcodbc,LENEMI ENTIDAD, LCODBC MARCA,/*,pdescricion MARCA*/
SELECT lfectr FECHA,lhortr HORA, lntoke, LCODBC MARCA,/*,pdescricion MARCA
lesttr ESTADO,lcretr COD_RETORNO,lcodtr COD_TRX,--coddes DESCRIP_RET,--lbinpr BIN,--
bindsbin MARCA_ENTIDAD,
lerrnb REFE_BEPSA, lidcom COD_COMER,lcomtr LOCAL_COMER,limpgs IMPORTE,/*txdtrx DESC_TRX,*/


************************************************************************************************
*                               /*CONSULTAS PARA MASTERCARD eventos*/                           *
************************************************************************************************
SELECT lfectr FECHA,COUNT(*) CANTIDAD, LCODBC MARCA, sum(limpgs) monto,lcretr cod_respuesta,substr(lidtra,1,1) dispositivo
from libdebito.drconbep inner join gxtrjdta.tdgbin on lbinpr=binnrobin
WHERE lfectr BETWEEN '20220705' AND '20220705'
and lcretr in ('91')--,'00')--,'92','91','96')--,'96','19') 
--and lesttr ='A'
and lcodbc in ('MST') 
--and eneadm='087'
--and lenemi='002'
GROUP BY Lfectr ,LCODBC,lcretr,substr(lidtra,1,1)
order by monto desc

select * from libdebito.drconbep where 
************************************************************************************************
*                               /*CONSULTAS PARA MASTERCARD EMISOR*/                           *
************************************************************************************************
  select lfectr fecha_real,lhortr hora,substr(lerrnb,2,13) refencia,lnrtar tarje_trx,b.mcpannmbr tarje_mast,lctaor tarjeta2_lc,lcodbc MARCA,lenemi entidad,
  lesttr estado,lcretr cod_retorno,lcodtr cod_trx,limpgs importe,lidcom cod_comercio,mcmsgtype,
  lcomtr comercio,b.mcrol rol,b.mcf044rmsg mensaje,lcautr
  from libdebito.drconbep 
  inner join mastercard.mastrndta b on lerrnb=MCRRNBEPSA
  --left join libdebito.tgembhaf c on b.mcpannmbr=c.crtarj
  --and lbinpr in ('542927','230671','530399','547697') 
  where lfectr between '20220111' and '20220111' --and b.mcrrnbepsa='010663493281'
  --and lbinpr='545289'
  --and lerrnb='031815272820'
  --and lcretr='XD'
  --and lnrtar='5421161011118346'
  AND mcrol='ISS'
  --and lcodbc='MST' 
  --and substr(lidtra,1,1)='T'
  order by lhortr desc

ver titular 
2306710001000208
select * from libdebito.tgembhaf where crbine='230671' and crtarj=''
************************************************************************************************
*                               /*CONSULTAS PARA MASTERCARD ADQUIRENTE*/                       *
************************************************************************************************
select lfectr fecha_real,lhortr hora,substr(lerrnb,1,13) refencia,lnrtar tarje_trx,b.mcpannmbr tarje_mast,lctaor tarjeta2_lc,lcodbc MARCA,lenemi entidad,
lesttr estado,lcretr cod_retorno,lcodtr cod_trx,limpgs importe,lidcom cod_comercio,mcmsgtype,
lcomtr comercio,b.mcrol rol,b.mcf044rmsg mensaje,lcautr
from libdebito.drconbep inner join mastercard.mastrndta b on lerrnb=MCRRNBEPSA
--and lbinpr in ('542927','230671','530399') 
where lfectr between '20220706' and '20220706' --and b.mcrrnbepsa='010663493281'
--and lbinpr='545289'
--and lbinpr='601637'
--and lerrnb='100430740199'
and lcretr='91'
AND mcrol='ADQ' 
--and substr(lidtra,1,1)='T'
--and b.mcpannmbr in ('5155901237799490','5447313236148265','5201328358438365')
--and lcautr in ('013776 ','265964 ','471266')
order by lhortr desc

************************************************************************************************
*                       /*CASOS DE RECLAMOS DE OPERACIONES*/                                   *
************************************************************************************************
select lfectr fecha_real,lhortr hora,substr(lerrnb,1,13) refencia,lnrtar tarje_trx,lbinpr bin, bindsbin Marca_tarjeta,lcodbc MARCA,lenemi entidad,
lesttr estado,lcretr cod_retorno,lcodtr cod_trx,limpgs importe,lidcom cod_comercio,lcomtr comercio_ATM,leca62 atm
from libdebito.drconbep inner join gxtrjdta.tdgbin on lbinpr=substr(binnrobin,1,6) 
where lfectr between '20220706' and '20220706'
and lcodbc='MST'
and lcretr='91'
--and lhortr between '070000' and '140000'
and binidmarca='MST'
--and substr(lnrtar,1,6)='545289'
order by lhortr desc

select * from gxtrjdta.tdgbin


************************************************************************************************
select * from libdebito.tbinproc where pbin='516400'
select * from libdebito.tbcret0p where codnro='30'
************************************************************************************************
select codtran
from
(
select lcodtr as codtran from libdebito.drconbep where LFECTR = '20200913' and lidtra like 'T%'
group by lcodtr
) as A where a.codtran not in (select txctrx from libdebito.tbctra0p)

************************************************************************************************
*                                    /*VISA ADQUIRENTE*/                                       *
************************************************************************************************
select lfectr fecha_real,lhortr hora,substr(lerrnb,2,13) refencia,lnrtar tarje_trx,--b.vipannmbr tarje_visa,
lcodbc MARCA,lenemi entidad,lesttr estado,lcretr cod_retorno,lcodtr cod_trx,limpgs importe,lidcom cod_comercio,
lcomtr comercio,b.virol,lidtra, b.vif044rmsg mensaje,lnfisc,vimti,lposem
from libdebito.drconbep inner join visa.vistrndta b on lerrnb=virrnbepsa 
where lfectr between '20211004' and '20211004' 
--and b.vipannmbr='4569760000000012'
--and substr(leca62,1,1)='T'
and virol ='ADQ'-- and vimti='120'
--and lcretr='62'
--and lerrnb='030512397931'
order by lhortr desc

************************************************************************************************
*                                    /*VISA EMISOR*/                                       *
************************************************************************************************
select lfectr fecha_real,lhortr hora,substr(lerrnb,2,13) refencia,lnrtar tarje_trx,--b.vipannmbr tarje_visa,
lcodbc MARCA,lenemi entidad,lesttr estado,lcretr cod_retorno,lcodtr cod_trx,limpgs importe,lidcom cod_comercio,
lcomtr comercio,b.virol,lidtra, b.vif044rmsg mensaje,lnfisc,vimti,lposem
from libdebito.drconbep inner join visa.vistrndta b on lerrnb=virrnbepsa 
where lfectr between '20211004' and '20211004' 
--and b.vipannmbr='4569760000000012'
--and substr(leca62,1,1)='T'
and virol ='ISS'-- and vimti='120'
--and lcretr='62'
--and lerrnb='031614938396'
order by lhortr desc

select * from visa.viposem
select * from gxbdbps.tdemis where tdctanro='1000006'
select * from gxtrjdta.tdgbin where binnrobin='415784'

select lfectr fecha_real,lhortr hora,substr(lerrnb,2,13) refencia,lnrtar tarje_trx,b.vipannmbr tarje_visa,lctaor,
lcodbc MARCA,lenemi entidad,lesttr estado,
lcretr cod_retorno,lcodtr cod_trx,limpgs importe,--lidcom cod_comercio,
lcomtr comercio,b.virol,b.vif044rmsg mensaje,VITDCUENTA cuenta,lexpir Vto
from libdebito.drconbep inner join visa.vistrndta b on lerrnb=virrnbepsa 
where lfectr between '20200925' and '20200925' 
--and b.virol='ISA' 
--and lnrtar ='4569760000000087'
--and lbinpr in ('456976')
--and b.virrnbepsa='016278880939'
--and lhortr>140000
--and vipannmbr='4882340010000060'
order by lhortr desc

********************************************************************************************************************************************************
select * from visa.vistrndta where vifeccom='20200924'  and substr(vipannmbr,1,6)='488234'--and virrnbepsa='026802148524'
and virol='ISA'
and vipannmbr='4882340010000060' order by vihorareal DESC
********************************************************************************************************************************************************

************************************************************************************************
*                               Verificación envio de outgoing                                 *
************************************************************************************************
select A.*, B.* FROM MASTERCARD.MASCTLDTA AS A INNER JOIN MASTERCARD.MASTRNDTA AS B ON A.MCRRNBEPSA = B.MCRRNBEPSA AND A.MTI = B.MCMTI   
INNER JOIN LIBDEBITO.DRCONBEP AS C ON A.MCRRNBEPSA = C.LERRNB AND  
A.MC038 = C.LCAUTR AND B.MCIMPORTE = C.LIMPGS AND                    
B.MCFECCOM between '20201014' and '20201016'
WHERE MC039 = '00' AND A.MTI = 0110 AND B.MCROL = 'ADQ' AND          
B.MASIPMPRC <>'N' AND B.MCIMPORTE > 0 AND                            
C.LFCOTR between '20201014' and '20201016'


select * from mastercard.masctldta where masfinpmfil='R111029034'
select * from gxbdbps.tdcliente

/*VERIFICACION DE TRANSACCCIONES VISA Y MASTERCARD*/
select * from gxbdbps.lgcoment where date(lgfechor)='2020-09-24' and lgmsg like ('%026802148524%')
select * from gxbdbps.secpinoff where secopan='4882340010000060'

************************************************************************************************
*                       /*CASOS DE RECLAMOS DE OPERACIONES*/                                   *
************************************************************************************************
select lfectr fecha_real,lhortr hora,substr(lerrnb,1,13) refencia,lnrtar tarje_trx,lbinpr bin, bindsbin Marca_tarjeta,lcodbc MARCA,lenemi entidad,
lesttr estado,lcretr cod_retorno,lcodtr cod_trx,limpgs importe,lidcom cod_comercio,lcomtr comercio_ATM,leca62 atm,count(*)
from libdebito.drconbep 
inner join gxtrjdta.tdgbin on lbinpr=substr(binnrobin,1,6) 
where lfectr between '20220705' and '20220705'
and lcodbc='MST' and lcretr in ('91','96')
--and lhortr between '163700' and '205000'
--and lbinpr='230671'
group by  lfectr ,lhortr ,substr(lerrnb,1,13) ,lnrtar ,lbinpr , bindsbin ,lcodbc ,lenemi ,
lesttr ,lcretr ,lcodtr ,limpgs ,lidcom ,lcomtr ,leca62
order by lhortr desc

/*
************************************************************************************************
/*VERIFICACION DE proceso agendado MAIPIRDCAR - PARAMETROS DE MASTERCARD                       *
************************************************************************************************

select * from gxbdbps.ipmfctl where ipmesteje='N'
update gxbdbps.ipmfctl set ipmffecpro='20200816' where ipmesteje='N'
*/


INSERT INTO VISA.VIPOSEM (POSEMPANE,POSEMPINE,POSEMFILL,POSEMDES) 
VALUES
  (10,0,0,'                                        ');
  INSERT INTO VISA.VIPOSEM (POSEMPANE,POSEMPINE,POSEMFILL,POSEMDES) 
VALUES
  (10,2,0,'                                        ');

delete from visa.viposem where posempane in ('10')
SELECT * FROM GXBDBPS.COMAEAF WHERE COCOMER='0302179'




************************************************************************************************
*                       /*RECHAZOS AGRUPADOR POR COMERCIOS*/                                   *
************************************************************************************************
--ADQ MST COMERCIO Resumen
select lfectr AS FECHA , lcodbc AS MARCA,lenemi EMISOR, COUNT(*) CANTIDAD, lcretr AS COD_RETORNO,lcomtr COMERCIO
from libdebito.drconbep
where lfectr='20201224' and   lcodbc = 'MST' --and codmar='MSTC'
and lenemi in ('530','560','570','590')
--and substr(lidtra,1,1)='P'
and lcretr in '91'
and lhortr between '100000' and '140000'
GROUP BY Lfectr, lcretr, lcodbc,LENEMI,lcomtr
ORDER BY cantidad desc, lcretr asc



************************************************************************************************
*                       /*RECHAZOS AGRUPADOR POR BIN */                                        *
************************************************************************************************
select lfectr fecha_real,lbinpr bin, bindsbin Marca_tarjeta,lcodbc MARCA,lcretr cod_retorno,count(*) Cantidad
from libdebito.drconbep inner join gxtrjdta.tdgbin on lbinpr=substr(binnrobin,1,6) 
where lfectr between '20220705' and '20220705'
and lcodbc='MST' and lcretr='91'
and lhortr between '165000' and '204800'
and lbinpr in (
/*'545289',
'527607',
'522415',
'510795',
'545288',
'422410',
'422411',
'423027')
*/

GROUP BY lfectr,lbinpr, bindsbin,lcodbc,lcretr


select * from gxtrjdta.tdgbin where binnrobin like ('522415%')

select * from libdebito.tbbine0p where QEBI10 ='230671'

--MASTERCARD
select lfectr as fecha,lhortr as hora,lerrnb as referencia,lidcom as codigo,lcomtr as Comercio,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS Tarjeta, 
pdescricion as Marca_tarjeta,limpgs as monto,lesttr as estado,
lcretr as retorno,lenemi,lcodbc as marca,coddes Descripcion_COD from libdebito.drconbep
--inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
--right join libdebito.tbcret0p on lcretr = codnro
inner join libdebito.tbinproc on pbin=lbinpr
right join libdebito.tbcret0p on lcretr = codnro
where lfectr between '20201224' and '20201224' and lenemi in ('530','560','570','590') 
--and lerrnb='034821957956' --lnrtar like '627431%' --and lcretr in ('96','91','XD','92','94', '60')
and lhortr between '100600' and '140000'
--and lenemi in ('570')
--and lcodbc IN 'MST'
--and lnrtar like '230671%'
and pdescricion like '%MASTERCARD BNF DEBITO BC%'
--and lcretr in ('96','91','00','92','94', '60','88','01','96')
--and lhortr between '080200' and  '101000'
--and lnrtar like '516400%'
--and lnrtar like '601638%'
--and lnrtar like '425936%'--and lcretr in '91'--20201224
--and lcretr in ('91')--,'96','92','94','57', '60')
and codmar='MSTC'
order by lhortr desc

select * from libdebito.tbinproc



select * from libdebito.embnovhst where 


select * from qsys2.systables where TABLE_TYPE IN ('T', 'P')

select * from qsys2.systables  where TABLE_NAME = 'DRCONBEP'




SELECT job_name, authorization_name, sysibm.client_ipaddr FROM TABLE(QSYS2.ACTIVE_JOB_INFO(JOB_NAME_FILTER =>'QZDAS*', DETAILED_INFO =>'ALL'));


SELECT job_name, authorization_name, sysibm.client_ipaddr, Client_Ip_Address FROM TABLE(QSYS2.ACTIVE_JOB_INFO(JOB_NAME_FILTER =>'QZDAS*', DETAILED_INFO =>'ALL'));




select * from 



select mcfecreal fecha,mchorareal hora ,mcpannmbr TARJE ,MCFLD037,mcimporte monto
from mastercard.mastrndta 
where 
mcfecreal='20220705' 
and  mcrol in ('ADQ')
--and substr(mc002,1,6) ='546297'
--and mcrrnbepsa='204833760127'
--and mcpannmbr='5557886010082061'
--and substr(mcpannmbr,1,6)='514848'
AND MCMTI='430'
GROUP BY  mcfecreal ,mchorareal  ,mcpannmbr  ,MCFLD037,mcimporte 
order by mchorareal desc
