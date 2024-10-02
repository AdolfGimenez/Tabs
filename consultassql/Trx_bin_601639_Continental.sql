SELECT lfectr FECHA,lhortr HORA,lnrtar TARJETA,lbinpr BIN ,LENEMI ENTIDAD, LCODBC MARCA,
lesttr ESTADO,lcretr COD_RETORNO,coddes DESCRIP_RET,
lerrnb REFERENCIA_BEPSA, lidcom COD_COMERCIO,lcomtr LOCAL_COMERCIO,lcautr COD_AUT, limpgs IMPORTE,lcodtr COD_TRX,txdtrx DESC_TRX
from libdebito.drconbep 
inner JOIN libdebito.tbcret0p ON lcretr = codnro
inner join libdebito.tbctra0p on lcodtr=txctrx
wHERE lfectr BETWEEN '20190608' AND '20191022' 
and substr(lidtra,1,1)='T'
and lcretr<>'00' and lesttr='A'
and lbinpr='601639'
and lcodbc in ('MST','VSA')
order by lfectr,lhortr desc
