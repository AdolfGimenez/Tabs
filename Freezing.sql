select lfectr fecha_real , lfcotr fecha_comercial,c.lhortr HORA,SUBSTR(c.lnrtar,1,6) || 'XXXXXX' ||SUBSTR(c.lnrtar,13,4) TARJE,lcuota,
lnrtar tarjeta,lhisde,lenemi emisor,c.lbinpr bin,lsaltr,
c.lesttr ESTADO,c.lcretr COD_RETORNO,c.lcodtr COD_TRX,c.limpgs IMPORTE,--coddes DESCRIP_RET,--lbinpr BIN,--
c.lerrnb REFE_BEPSA, c.lidcom COD_COMER,c.lcomtr LOCAL_COMER,c.LECA62 ATM_POS,c.lactfj cod_act,c.lcautr cod_aut,lnfisc adq

 FROM libdebito.drconbep c
WHERE lfectr BETWEEN '20220315' AND '20220315'
and substr(lidtra,1,1) in ('T')     --cambiar por P para trx pos 
order by lhortr desc

--Pendientes Reimpresion PIN
select * from GXBDBPS.TDEMISnov  where  TDEMISNOV='5' and TDESTNOV='0'

--Se ejecuta: call libdebito/EMBRG001N5       
 

SELECT * FROM LIBDEBITO.DRCONBEP d 
WHERE LFECTR = 20211001 and SUBSTR(LNRTAR, 1, 4) = '6274'
