select * from gxopera.opmovi where opfecom='20201030' and opcodtrn='014000'

select substr(opidtra,7,10) secue,opferea Fecha_real,opfecom Fecha_comercial,
substr(digits(ophotrn),3,2)||':'||substr(digits(ophotrn),5,2)||':'||substr(digits(ophotrn),7,2) HORA
,SUBSTR(optarj,1,6) || 'XXXXXX' ||SUBSTR(optarj,13,4) TARJETA,OPCOMER COMERCIO, 
opmonto icompra,opcomi comision,opcoment com_entidad,opivaent iva_s_c_ent,opcombps com_bepsa,opivabps iva_s_c_bps,opmonto neto,opcodtrn cod_autorizacion,substr(opidtra,1,2)||substr(opidtra,5,8) origen
from gxopera.opmovi where opfecom='20201105' and opcodtrn='014000'
order by opferea,ophotrn


