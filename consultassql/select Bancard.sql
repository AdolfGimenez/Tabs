SELECT lfectr FECHA,lhortr HORA
/*lnrtar TARJ SUBSTR(lnrtar,1,6) || 'XXXXXX' ||SUBSTR(lnrtar,13,4) TARJE,pdescricion MARCA*/,lcretr COD_RET,
lesttr ESTADO,lbinpr BIN,pdescricion MARCA_ENTIDAD,--lerrnb REFERENCIA_BEPSA,
/*lidcom COD_COMERCIO,lcomtr COMERCIO,*/limpgs IMPORTE,lcodtr COD_TRX
--select count(*) CANT,lcretr COD_RET,lbinpr BIN,pdescricion MARCA,substr(lidtra,1,1) Origen
--select distinct(SUBSTR(lnrtar,1,6)||'XXXX'||SUBSTR(lnrtar,10,16)) TARJ,count(*) CANT_TRX,lfectr FECHA,lctaor CTA_ORI,lcretr COD_RET
--select *--FROM libdebito.drconbep  --select * from libdebito.tbcret0p 
--inner JOIN libdebito.tbcret0p ON lcretr = codnro
--select count(*) CANTIDAD,lcretr COD_RETORNO,LCODBC Marca, LBINPR BIN,pdescricion MARCA--,substr(lidtra,1,1) DISPOSITIVO--lbinpr 
--select distinct(lcretr)
from libdebito.drconbep
inner join libdebito.tbinproc on lbinpr=pbin
WHERE lfectr BETWEEN '20190819' AND '20190819'
--and lcodtr in ('390000')
--and substr(leca62,1,4)='T403' 
--and lactfj='T002'
--and lidcom='0100001'
and lcretr in ('05','00')
--and lbinpr IN ('459327','433828','458189','406699','601638')
--GROUP BY LFECTR,LCRETR,LBINPR,leca62,lcomtr
--group by lcretr,lbinpr,pdescricion,substr(lidtra,1,1)
--and lcodtr='567102' --and lcodtr in ('514000','902020','524000','901020')
--and lcodtr in ('000054')--,'380000','390000','000052') --and lerrnb IN ('920010737051','920010737376','920010737929','920010740420')
--and lerrnb='919510527178' --and lenemi='317' --and lcored='971'--and lcuota>'01'
--and lcretr ='05'--and lesttr='R' --
--and lcodbc IN ('CAB')
and lcodbc IN ('VSA','MST')
--and lhortr> '104400' --and lcretr in ('00')-- and lesttr='D'--and lhortr>'185000'--and lcautr='178457'--and lnrtar in ('7030204607543259','7030204607536061')
--and lnrtar='7030020106066906'
--group by lcretr ,LCODBC,LBINPR,pdescricion
order by lfectr,lhortr desc



