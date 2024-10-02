/* SELECT PARA FILTRAR TRANSACCIONES DE NUESTRAS TARJETAS QUE NOS PASA BANCARD PARA AUTORIZAR*/
select lfectr fecha_real,lhortr HORA,SUBSTR(lnrtar,1,6) || 'XXXXXX' ||SUBSTR(lnrtar,13,4) TARJE,
lenemi emisor,lbinpr bin,lposem,lcotel celular,
lesttr ESTADO,lcretr COD_RET,lcodtr COD_TRX,limpgs IMPORTE,lsaltr,--coddes DESCRIP_RET,--lbinpr BIN,--
lerrnb REFE_BEPSA, lidcom COD_COMER,lcomtr LOCAL_COMER,LECA62 ATM_POS,lactfj cod_act,lcautr cod_aut,lnfisc adq,ldistr,lnfisc
FROM libdebito.drconbep
WHERE lfectr BETWEEN '20220927' AND '20220927'
--and lbinpr in ('230671','456976') opcional para filtras.
and lnfisc in ('472040','443073','443073')--,'','','') --bin adquirente  infonet pos atm
order by lhortr desc
