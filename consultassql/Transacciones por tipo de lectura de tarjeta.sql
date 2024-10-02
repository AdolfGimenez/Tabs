SELECT lfectr FECHA,lfcotr fecha_com,lhortr HORA,
lbinpr bin,LENEMI ENTIDAD, LCODBC MARCA,
lesttr ESTADO,lsaltr,lcretr COD_RETORNO,
lerrnb REFE_BEPSA, lidcom COD_COMER,lcomtr LOCAL_COMER,limpgs IMPORTE,substr(leca62,1,4) ATM,
lcodtr COD_TRX,lnfisc COD_ADQ_BPS,
(CASE WHEN LPOSEM in ('9010','9020','910','920','901',' 901',' 021') THEN 'BANDA MAGNETICA'  
WHEN LPOSEM in  ('0510',' 051',' 510') THEN 'CHIP'
WHEN LPOSEM in ('0710',' 071') THEN 'CONTACLESS' else 'VACIO' END) Tipo_lectura,lposem
from libdebito.drconbep
WHERE lfectr BETWEEN '20220315' AND '20220315'
--and lcodbc='MST'
--and lbinpr='589433'
and lcretr='00'
and substr(lidtra,1,1)='P'
and lnrtar='5462970000002026'
--and lerrnb='031815255478'
--and lbinpr='542116'
--and lcodtr='000054'
--and substr(leca62,9,10) like ('%J%')  
order by lhortr desc


