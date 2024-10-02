SELECT lfectr FECHA,lhortr HORA,/*SUBSTR(lnrtar,1,6) || 'XXXXXX' ||SUBSTR(lnrtar,13,4) lnrtar TARJE,*/lbinpr bin,
LENEMI ENTIDAD, LCODBC MARCA,lhisde Destino,/*,pdescricion MARCA*/
--SELECT lfectr FECHA,lhortr HORA, lntoke, LCODBC MARCA,/*,pdescricion MARCA*/
lesttr ESTADO,lcretr COD_RETORNO,--coddes DESCRIP_RET,--lbinpr BIN,--,pdescricion MARCA_ENTIDAD,
lerrnb REFE_BEPSA, lidcom COD_COMER,lcomtr LOCAL_COMER,lsaltr,limpgs IMPORTE,lcodtr COD_TRX,/*txdtrx DESC_TRX,*/lcotel telefono,leca62 Version_Pos--LNFISC,LPOSEM,LMCCTR,LNFACT--,lntoke--, enemiso BANCO,tgdesc DESCRIPCION
from libdebito.drconbep
WHERE lfectr BETWEEN '20231016' AND '20231016'
--and lbinpr in ('456976')
--and leca62='SPT1000_v26'
--and lidcom='8100551'
--000000000301670
--and lcretr in ('91')
--and lcodtr='567102'
--and lhortr>19000
--and substr(leca62,1,1)='I'
--and substr(lidtra,1,1)='T'
--and lbinpr='703020'
--and lhortr >'233000'
--and lenemi='530'
--and lerrnb='014273078573'
order by lhortr desc
--10:14 a 1121

--select * from libdebito.tbctra0p

--select * from libdebito.SWITCHENT



--select * from gxbdbps.atdemis where aebin='488234' and aeope='UPD' AND AEFECHA='20200316' AND AEUSUARIO='USRBNF'


--select * from atmcentre.tbbine0p where qebi10='703002'

/*
select * from gxbdbps.comaeaf where codeno like '%FARMA%TOTAL%'
select * from gxbdbps.coafmaf where afcomer='0302179'
select * from gxbdbps.coafmaf where afcodi='13755406'
*/



/*
pedido de laura
select substr(lfectr,1,6) FECHA,LBINPR BIN,COUNT(*) CANTIDAD,LENEMI EMISOR, LCODBC MARCA
 from libdebito.drconbep
where lfectr between '20200301' and '20200312'
and lesttr='A' and substr(lidtra,1,1)='P'
and lbinpr in (
'403777','404026','406163','406164','415689','417995','425678','428189','432239',
'434194','442605','443076','448713','451865','451866','459437','472242','472243',
'474793','483958','491338','491339')
group by substr(lfectr,1,6),LBINPR,LENEMI, LCODBC
order by lbinpr asc
*/

/*
select count(*),lidcom,lcomtr,leca62,lactfj from libdebito.drconbep where lfectr between '20200101' and '20200519'
and substr(leca62,1,2)='SP'
group by lidcom,lcomtr,leca62,lactfj
*/
/*
select count(*) from gxbdbps.tafitra
delete from gxbdbps.tafitra
1875 eliminados.

insert into gxbdbps.tafitra (PARENE, PARBIN, PARAFINI, COCOMER, TRAEST, TRAFCHALT,TRAUSRALT, TRAFCHMOD, TRAUSRMOD)
( select '155','627431','001', cocomer,'A', '20200124','U99DOLORES','00000000',''
from gxbdbps.comaeaf where substr(cocomer,1,2) in ('02','07','24','28','60') and costat = 0)

1943 registros insertados.
select * from libdebito.switchent
*/





t
