SELECT substr(lidtra,1,4) Cajero,count(*) cantidad,sum(limpgs),lesttr estado
FROM LIBDEBITO.BDBNFENV0P WHERE LFCOTR='20220210' and lcretr='00' and lesttr='A' and ENEADM ='002' and substr(lidtra,1,4) in ('T022')
group by substr(lidtra,1,4),lesttr

SELECT sum(limpgs)
FROM LIBDEBITO.BDBNFENV0P WHERE LFCOTR='20220210' and lcretr='00' and lesttr='A' and ENEADM ='002'  and substr(lidtra,1,4) in ('T022')
group by substr(lidtra,1,4),lesttr

SELECT substr(lidtra,1,4) Cajero,count(*) cantidad,sum(limpgs),lesttr estado
FROM LIBDEBITO.BDBNFENV0H WHERE LFCOTR='20220210' and lcretr='00' and lesttr='A' and ENEADM ='002' and substr(lidtra,1,4) in ('T022')
group by substr(lidtra,1,4),lesttr
---------------------------------------------------------------------------------------------*
select lfectr fecha, lhortr hora, lctade id_tigo, SUBSTR(LIDTRA,1,4) origen, lerrnb referencia, lnrtar tarjeta, integer(limpgs) monto, lcretr codigo_retorno, lesttr estado, lcotel movil 
FROM LIBDEBITO.DRCONBEP where LERRNB in('206540047825', '206540078359', '206540078993')
select * from gxopera.opmovi where opnoref in('206540047825', '206540078359', '206540078993')
-------------------------------------------------------------------------------------------------*
SELECT --*
LFCOTR FECHA_CIAL, LFECTR FECHA_REAL, LHORTR HORA, LIDCOM COD_COM, LCOMTR COMERCIO, SUBSTR(LNRTAR,1,6) || '******' ||SUBSTR(LNRTAR,13,4) TARJETA, LCODBC MARCA, integer(LIMPGS) IMPORTE, LCUOTA CUOTA, LCRETR RETORNO,
LESTTR ESTADO, LCAUTR AUTORIZACION, LERRNB REFERENCIA, LIDTRA ID_TRX, LCODTR COD_TRX, TXDTRX TIPO_TRX, LECA62 DISPOSITIVO, LACTFJ ACT_FIJO, LCORED RED, LCOTEL LINEA_ORIGEN, LNTOKE LINEA_DESTINO, LCTADE ID_TIGO, LENEMI EMISOR, LSALTR, LDISTR ,LNRTAR
FROM LIBDEBITO.DRCONBE
INNER JOIN LIBDEBITO.TBCTRA0P ON (TXCTRX=LCODTR)
--WHERE LFECTR='20211029' AND LCODBC = 'MST'--LENEMI='581' AND LNRTAR LIKE '%745'
--WHERE LACTFJ = '19981494' AND LCRETR='00' AND LESTTR='A' AND LIMPGS > '1000'
--WHERE LBINPR like '456976%' AND lFECTR = '20211011' --AND LIDTRA LIKE 'T%'--AND LCRETR = '96' -- --AND LCRETR <> '00' --AND LENEMI <>'020'
--AND LIMPGS='547420' AND LHORTR BETWEEN '114236' AND '114236'-- --AND LIMPGS = '50000' LCOTEL LIKE '%984497711%'--LCODBC NOT IN ('VSA','MST','CRE','DCR','CAB')--AND--AND LCOTEL='0984497711'
--WHERE LFCOTR BETWEEN '20210923' AND '20210923' AND LENEMI= '176' --LBINPR='703002' AND LCRETR = '96'-- IN ('96','92','99','88','93') --AND LHORTR BETWEEN '100000' AND '110000'
--WHERE LECA62='T436' AND LFECTR='20210729'
--WHERE LCUOTA NOT IN ('','0','01') AND LCODBC = 'VSA' AND SUBSTR(LIDTRA,1,1)='T' AND LFECTR > '20210101'
--WHERE LERRNB IN ('128094615790')--('123783084722','123783023274')
WHERE
--LCODTR IN ('304000','300000','311000','312000','311000','302000','301000','012000','013000','011000','000054','304000','300000','000055')--LIDCOM='0801683'
--AND
LFCOTR BETWEEN '20220210' AND '20220210' and SUBSTR(LIDTRA,1,4)= 'T103'  ---and LBINPR='502026'
AND LCRETR='00' AND LESTTR in('A','R', 'Q') AND LCODTR IN ('011000', '012000', '013000', '000052','567101', '567102', '015000')
--and eneadm = 002 
 and lcretr = '00'
-- and eneadm = '002' --LCODBC IN ('PAN','CAB')
--AND LIMPGS > '1000'
--WHERE LNRTAR='4569760000151435' --AND LIDCOM LIKE '%Amzn%'
--WHERE LNRTAR='4569760000200968' AND LIDTRA LIKE 'T%' AND LCRETR='00' AND LESTTR = 'R'
ORDER BY LFECTR DESC, LHORTR DESC;

---------------------------------------------------------------------------*
--Verificar rechazos con visa 443078
SELECT a.lenemi Cod_Ent , LCODBC MARCA, entbina afinidad , substr(lnrtar,1,6)||'XXXXXX'||substr(lnrtar,13)NROTARJ, LFECTR FECHAMOV,lhortr HORA, LCODTR CODTRX, txdtrx descripcion,LIDCOM CODIGO,
LCOMTR COMERCIO, LIMPGS IMPORTE, SUBSTR(LIDTRA,1,1) DISPO, LCRETR RETORNO, CODDES DESCRIPCIONRET, LESTTR ESTADO, lfcotr fcomercial,
lcautr autorizacion,LERRNB REFERENCIA,LCUOTA CUOTA, CRDOCU,LODESC LOCALIDAD, codtodesc DPto,lnfisc COD_ADQ,(case when LNFISC in ('443073','472040') THEN 'BANCARD' when LNFISC = '449780' THEN 'BNF' when LNFISC ='461958' THEN 'AUSTRALIA' when LNFISC ='459834' THEN 'MILAN ITALIA' END)DESC_ADQUIRENTE,
LPOSEM CODIGO_ENTRADA,(CASE WHEN LPOSEM in ('9010','9020','910','920') THEN 'BANDA MAGNETICA' WHEN LPOSEM = '0510' THEN 'CHIP' WHEN LPOSEM = '0710' THEN 'CONTACLESS' else ' ' END)DESC_ENTRADA
,LMCCTR COD_COMERCIANTE ,LNFACT PAIS
FROM LIBDEBITO.DRCONBEP a
--INNER join gxBDBps.gentiaf b ON LENEMI = b.ENEMISO and lbinpr
inner join libdebito.tbctra0p on txctrx = lcodtr
INNER JOIN LIBDEBITO.TBCRET0P ON CODNRO = LCRETR
LEFT join gxopera.opentid1 on entcodi = lenemi and substr(entbin,1,6) = lbinpr
LEFT join libdebito.tgembhaf on crtarj = lnrtar AND CRENTI = A.LENEMI
inner join gxbdbps.comaeaf d on substr(digits(a.lidcom), 6, 7)=d.cocomer
inner join gxbdbps.colocaf k on d.locodi = k.locodi
INNER JOIN gxbdbps.CODTOAF X ON (k.CODDTO = X.CODDTO)
WHERE LFECTR BETWEEN '20211201' AND '20220120'
AND CODMAR = 'BEPS' AND LENEMI = '040' AND LIDCOM <> '100001' AND LBINPR= '546297'
GROUP BY a.lenemi,LCODBC, entbina, LFECTR,lhortr, LCODTR, txdtrx, LIDCOM, LCOMTR,LCUOTA, LIMPGS, LCRETR,
CODDES , LESTTR , lfcotr , lcautr ,LERRNB, CRDOCU, lnrtar, LIDTRA, LODESC, codtodesc,LMonTR,LNFISC,LPOSEM ,LMCCTR ,LNFACT
ORDER BY LFECTR , lhortr DESC



--Verificar rechazon con visa 443078
select lnrtar TARJETA,LERRNB REFERENCIA,LFECTR FECHA,LIMPGS IMPORTE,LCRETR RETORNO,CODDES DESCRIPCIONRET,SUBSTR(LIDTRA,1,1) DISPO
from LIBDEBITO.DRCONBEP
inner join libdebito.tbctra0p on txctrx = lcodtr
INNER JOIN LIBDEBITO.TBCRET0P ON CODNRO = LCRETR
WHERE LFECTR BETWEEN '20220129' AND '20220129' AND LBINPR= '443078' AND LCRETR in ('19','92','91')


select lnrtar TARJETA,LERRNB REFERENCIA,LFECTR FECHA,LIMPGS IMPORTE,LCRETR RETORNO, CODDES DESCRIPCIONRET,SUBSTR(LIDTRA,1,1) DISPO
from LIBDEBITO.DRCONBEP
--inner join libdebito.tbctra0p on txctrx = lcodtr
right JOIN LIBDEBITO.TBCRET0P ON CODNRO = LCRETR
WHERE LFECTR BETWEEN '20220204' AND '20220204' AND LBINPR= '443078' AND LCRETR in ('19','92','91') AND CODMAR = 'VISA'


select * from public.transaccion where id_empre_origen in ('100001227662')
select id, id_empre_origen, empre_origen, numero_origen, empre_destino, numero_destino, importe, fecha_operacion, hora_operacion, codigo_respuesta, mensaje_error, numero_autorizacion, fecha_creacion, fecha_liquidacion
from public.transaccion 
where 
--numero_autorizacion in ('432723317','432723251');
where fecha_operacion='04022022' and importe='12000' and hora_operacion between '104800' and '104900' and empre_origen='0005' and empre_destino='0007'
where id in ('100001227662')
where empre_origen='0005' and empre_destino='0008' and codigo_respuesta='13'

select * from GXBDBPS.BST014 WHERE id IN ('445686586667')
select id, id_empre_origen, empre_origen, numero_origen, empre_destino, numero_destino, importe, fecha_operacion, hora_operacion, codigo_respuesta, mensaje_error, numero_autorizacion, fecha_creacion, fecha_liquidacion
where fecha_operacion='08022022' and importe='70000' and hora_operacion between '104800' and '104900' and empre_origen='0005' and empre_destino='0008'
--where id in ('100001227662') and codigo_respuesta='00'


select * from public.transaccion where id_empre_origen in ('431475151')
select id, id_empre_origen, empre_origen, numero_origen, empre_destino, numero_destino, importe, fecha_operacion, hora_operacion, codigo_respuesta, mensaje_error, numero_autorizacion, fecha_creacion, fecha_liquidacion
from public.transaccion 
where 
numero_autorizacion in ('432723317','432723251');
--where fecha_operacion='25052021' and importe='50000' and hora_operacion between '083000' and '084000' and empre_origen='0007' and empre_destino='0005'
--where id in ('100000030540')
--where empre_origen='0005' and empre_destino='0008' and codigo_respuesta='13' 
