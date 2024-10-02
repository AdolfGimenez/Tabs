"select * from gxbdcon.gxloperdet where usucod = '777' and SISCODI='FA'!"
select EMVAID, EANAME, EATDOL, EADDOL, EATERMCAP, TACONLINE, PINENABLE, TERRIMADAT from gxbdbps.emvaids;

select * from libdebito.drconbep where lfectr = '20200911' and LERRNB in ('025500066403',
'025500066402') order by lhortr desc;

select * from gxbdbps.tswaut where AUTRRNBEP = '025500066403'


SELECT * FROM GXBDBPS.COMMS;


select * from libprod.drconbe60 where LERRNB like '%32800077987%'

select * from libprod.drconbe60 where LERRNB in (
'032916825852',
'032916879006'
);

select lidcom COD_COM, lcomtr COMERCIO, lfectr FECHA_TRX, lhortr HORA_TRX, limpgs IMPORTE, 
substr(lidtra,1,1) POS_ATM, lcretr COD_RETORNO, lesttr EST_TRX, lerrnb NRO_REF, lcodtr COD_TRX,
lcored RED, lcotel NRO_TELEFONO,
case
	when substr(lidtra,1,1) = 'P' then 'POS' 
	when substr(lidtra,1,1) = 'T' then 'ATM' 
	else 'Other'
end 
CANAL
 from libprod.drconbe60 where LERRNB in (
'032916825852',
'032916879006'
);

select (substr (lidtra,1,1), 'T', 'ATM', 'P', 'POS') from libdebito.drconbep where LERRNB in (
'032916855829',
'032916850215'
);



select lcored RED,
case
	when lcored = '971' then 'PERSONAL'
	when lcored = '981' then 'TIGO'
	else 'Other'
end
from libdebito.drconbep;

select lidtra TERMINAL,
case
	when substr(lidtra,1,1) = 'P' then 'POS' 
	when substr(lidtra,1,1) = 'T' then 'ATM' 
	else 'Other'
end
from libdebito.drconbep;
-------
-------
-------
SELECT lcored, DECODE(lcored, '971', 'PERSONAL',
                             '981', 'TIGO',
                             CAST(NULL AS VARCHAR(1)), 'Unknown',
                             'Other')
FROM libdebito.drconbep;
------
------
------

select * from libprod.drconbe60 where lcodtr = '567102' and LCORED = '971' and lcotel <> '' and lhisde = '*PERSON' and lfectr between '20201121' and '20201123'

select * from libdebito.drconbep where lcodtr = '567102'
and LCORED = '971' and lcotel <> '' 
and lhisde = '*PERSON' and lfectr = '20201124';

select lidtra, lerrnb, DECODE(substr(lidtra,1,1), 'P', 'POS', 'T', 'ATM', 'NA') as TIPO_TERMINAL from libdebito.drconbep

SELECT * FROM TABLE (sysproc.env_get_inst_info()) as INSTANCEINFO

--12614 - Pruebas Ingenico V1.2.3

select * from libdebito.drconbep where lfectr = '20210222' and leca62 = 'INGTETRA_1_2_30' order by lhortr desc;

select lnrtar TARJETA, lidcom COMERCIO, lhisor ORIGEN, lhisde DESTINO, 
lfectr FECHA_TRX, limpgs IMPORTE, loritr ORIGEN, lcodtr COD_TRX, lcretr COD_RETORNO, lesttr ESTADO, 
lerrnb RRN, lcotel NUMERO
from libdebito.drconbep where lfectr = '20210222' and leca62 = 'INGTETRA_1_2_30' order by lhortr desc;

select * from gxbdbps.comms;

select * from gxbdbps.lgcoment order by lgfechor desc;

select * from gxbdbps.tdgbin where binnrobin = '627431';

select lnrtar TARJETA, lidcom COMERCIO, lhisor ORIGEN, lhisde DESTINO, lfectr FECHA_TRX, limpgs IMPORTE, loritr ORIGEN, lcodtr COD_TRX, lcretr COD_RETORNO, lesttr ESTADO, lerrnb RRN
from libdebito.drconbep where lfectr = '20210224' and lbinpr = '589434' order by lhortr desc

