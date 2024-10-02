----------------------------------------------REPORTE DETALLE DE CONTACTOS DE COMERCIOS----------------------------------------------------------------

select a.COCOMER COD_COMERCIO,CODENO DENOMINACION,CORAZO RAZON_SOCIAL,CORUCN RUC,
codire2 DIR_CORRESPONDENCIA,COTELN TELEFONO,COCELN NRO_CELULAR,copropte1 TELEFONO1,copropte2 TELEFONO2,LODESC LOCALIDAD,COEMAIL MAIL,DIROBS OBSERVACION
from gxbdbps.comaeaf a
left JOIN gxbdbps.COMDIR b  ON b.COCOMER = a.COCOMER
inner join gxbdbps.colocaf k on a.locodi = k.locodi   
INNER JOIN gxbdbps.CODTOAF X ON (k.CODDTO = X.CODDTO)
where substr(a.cocomer,1,2) < '90'

-------------------------***REPORTE DE COMISIONES VENTA MINUTOS/PAGO FACTURA-------------------------------------------------------------------------

select OPFEREA Fecha_Real,CODENO COMERCIO,OPCOMER COD_COMERCIO,OPCELU Nro_Doc,opcodtrn Cod_trx, txdtrx Desc_TRX,OPCODRES Cod_Respuesta,OPSTATUS Estado,
opnoref Nro_Referencia,OPCODAUT Cod_Autorizacion,
SUBSTR(OPIDTRA,1,1) DISPOSITIVO,opmonto Importe,(OPCOMENT + OPIVAENT)Comision_Total
from gxopera.opmovi a
INNER JOIN GXBDBPS.COMAEAF ON (COCOMER = OPCOMER)
inner join libdebito.tbctra0p c on c.txctrx = a.opcodtrn
WHERE OPCODRES= '00' AND OPSTATUS = 'A' AND OPFEREA BETWEEN '{?Desde}' AND '{?Hasta}' and opcodtrn in ('524000','514000') AND OPCOMER='{?Codigo Comercio}'

------------------------------------------------------****REPORTE TARJETAS DE CREDITO CON MOVIMIENTOS*****----------------------------------------
SELECT a.lenemi Cod_Ent , ENNOMBR ENTIDAD, LCODBC MARCA, entbina afinidad ,lnrtar NROTARJ,CRDOCU Nro_Documento, LFECTR FECHAMOV,lhortr HORA, LCODTR COD_TRX, txdtrx Descripcion,LIDCOM COMERCIO,
LCOMTR Nombre_Comercio, LIMPGS Importe, SUBSTR(LIDTRA,1,1) DISPO, LCRETR RETORNO, CODDES DESCRIPCIONRET, LESTTR ESTADO, lfcotr fcomercial, 
lcautr autorizacion,LODESC LOCALIDAD, codtodesc descrpDto,lnfisc COD_ADQUIRENTE,(case when LNFISC in ('443073','472040') THEN 'BANCARD' when LNFISC = '449780' THEN 'BNF' when LNFISC ='461958' THEN 'AUSTRALIA' when LNFISC ='459834' THEN 'MILAN ITALIA' END)DESC_ADQUIRENTE,(CASE WHEN LMonTR = '600' THEN 'GUARANIES' ELSE 'DOLARES' END ) MONEDA,
LPOSEM CODIGO_ENTRADA,(CASE WHEN LPOSEM in ('9010','9020','910','920') THEN 'BANDA MAGNETICA'  WHEN LPOSEM = '0510' THEN 'CHIP' WHEN LPOSEM = '0710' THEN 'CONTACLESS' else ' ' END)DESC_ENTRADA
,LMCCTR COD_COMERCIANTE ,LNFACT PAIS,MAX(CRFEGE)
FROM LIBDEBITO.DRCONBEP a
left join gxBDBps.gentiaf b ON LENEMI =  b.ENEMISO
inner join libdebito.tbctra0p on txctrx = lcodtr
INNER JOIN LIBDEBITO.TBCRET0P ON CODNRO = LCRETR
inner join gxopera.opentid1 on (entcodi = a.lenemi and substr(entbin,1,6) = lbinpr)
inner join libdebito.tgembhaf on crtarj = lnrtar
inner join gxbdbps.comaeaf d on substr(digits(a.lidcom), 6, 7)=d.cocomer 
inner join gxbdbps.colocaf k on d.locodi = k.locodi   --lOCALIDAD
INNER JOIN gxbdbps.CODTOAF X ON (k.CODDTO = X.CODDTO)
WHERE LFECTR BETWEEN  '20190601' AND '20190601'  AND enttipo = 'CRE'
AND CODMAR = 'BEPS'  AND LIDCOM <> '0100001' AND a.lenemi = '002'
GROUP BY a.lenemi, ENNOMBR, LCODBC, entbina, LFECTR,lhortr, LCODTR, txdtrx, LIDCOM, LCOMTR, LIMPGS, LCRETR,
CODDES , LESTTR , lfcotr , lcautr , CRDOCU, lnrtar, LIDTRA, LODESC, codtodesc,LMonTR,LNFISC,LPOSEM ,LMCCTR ,LNFACT

select * from libdebito.drconbep  
WHERE LFECTR BETWEEN  '20190601' AND '20190601' AND lenemi ='002' AND enttipo = 'CRE'

-------------------------------------------------------*****REPORTE TARJETAS DE DEBITO CON MOVIMIENTO***------------------------------------------------
SELECT a.lenemi Cod_Ent , ENNOMBR ENTIDAD, LCODBC MARCA, entbina afinidad , 
SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) NRO_TARJETA, CRDOCU Nro_Doc, LFECTR FECHA_MOV, LCODTR COD_TRX, txdtrx Descripcion,LIDCOM COD_COMERCIO,
LCOMTR NOM_COMERCIO, LIMPGS IMPORTE, SUBSTR(LIDTRA,1,1) DISPO, LCRETR RETORNO, CODDES DESCRIPCION_RET, LESTTR ESTADO, (CASE WHEN lmontr = '600' THEN 'GUARANIES' ELSE 'DOLARES' END ) MONEDA,
(CASE WHEN LPOSEM in ('9010','9020','910','920') THEN 'BANDA MAGNETICA'  WHEN LPOSEM = '0510' THEN 'CHIP' WHEN LPOSEM = '0710' THEN 'CONTACLESS' else 'VACIO' END)MODO_ENTRADA,
 LMCCTR TIPO_DE_COMERCIO ,LNFACT PAIS_DE_TRX,lfcotr fcomercial, lcautr autorizacion,
 (case when LNFISC in ('443073','472040') THEN 'BANCARD' when LNFISC = '449780' THEN 'BNF' when LNFISC ='461958' THEN 'AUSTRALIA' when LNFISC ='459834' THEN 'MILAN ITALIA' END) DESC_ADQUIRENTE,LNFISC ADQUIRENTE,LODESC LOCALIDAD, codtodesc descrp_Dto,MAX(CRFEGE)
FROM LIBDEBITO.DRCONBEP a
left join gxBDBps.gentiaf b ON LENEMI =  b.ENEMISO
inner join libdebito.tbctra0p on txctrx = lcodtr
INNER JOIN LIBDEBITO.TBCRET0P ON CODNRO = LCRETR
inner join gxopera.opentid1 on (entcodi = a.lenemi and substr(entbin,1,6) = lbinpr)
inner join libdebito.tgembhaf on crtarj = lnrtar
inner join gxbdbps.comaeaf d on substr(digits(a.lidcom), 6, 7)=d.cocomer 
inner join gxbdbps.colocaf k on d.locodi = k.locodi   
INNER JOIN gxbdbps.CODTOAF X ON (k.CODDTO = X.CODDTO)
WHERE LFECTR BETWEEN  '20200401' AND '20200401'  AND enttipo = 'DEB'
AND CODMAR = 'BEPS'  
AND LIDCOM <> '0100001' AND a.lenemi ='020'
GROUP BY a.lenemi, ENNOMBR, LCODBC, entbina,lnrtar,CRDOCU, LFECTR, LCODTR, txdtrx, LIDCOM, LCOMTR, LIMPGS,LIDTRA,LCRETR,CODDES , LESTTR ,lmontr,LPOSEM,LMCCTR,LNFACT,
lfcotr , lcautr ,LNFISC ,   LODESC, codtodesc

/*SELECT  LBINPR BIN,LCODBC MARCA, SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) TARJETA,q.CRDOCU CEDULA, 
LFECTR FECHA_REAL, LHORTR HORA, LCODTR COD_TRX, TXDTRX DESC_TRX,q.crnomb NOMBRE_PLASTICO,(CASE WHEN IDMONEDA = '600' THEN 'GUARANIES' ELSE 'DOLARES' END )
 MONEDA,(CASE WHEN LPOSEM in ('9010','9020','910','920') THEN 'BANDA MAGNETICA'  WHEN LPOSEM = '0510' THEN 'CHIP' WHEN LPOSEM = '0710' THEN 'CONTACLESS' else 'VACIO' END)MODO_ENTRADA,LMCCTR TIPO_DE_COMERCIO ,LNFACT PAIS_DE_TRX,
LCOMTR DENOMINCACION, LIDCOM COD_COMERCIO, LIMPGS IMPORTE, LENEMI EMISOR,ennombr DESCRIP_EMISOR,LFCOTR FECHA_COMERCIAL
,SUBSTR(LIDTRA,1,1) DISPOSITIVO, LESTTR ESTADO,LCRETR RESPUESTA,  CODDES DESCRIP_RESP,  LCAUTR AUTORIZACION, LERRNB REFERENCIA,
(case when LNFISC in ('443073','472040') THEN 'BANCARD' when LNFISC = '449780' THEN 'BNF' when LNFISC ='461958' THEN 'AUSTRALIA' when LNFISC ='459834' THEN 'MILAN ITALIA' END) DESC_ADQUIRENTE,LNFISC ADQUIRENTE,COUNT(*)
select * FROM LIBDEBITO.DRCONBEP a
left join gxbdbps.comaeaf  on cocomer =  substr(digits(lidcom), 6, 7)
inner JOIN libdebito.tbcret0p ON lcretr = CODNRO
inner join libdebito.tbctra0p on txctrx = lcodtr
left join gxopera.factura on  faclien = lidcom
right join libdebito.tgembhaf q  on q.crtarj = lnrtar 
INNER join libdebito.TBINPROC  on PBIN = LBINPR
left join gxbdbps.tmtaraf J on J.MTNUMTA = lnrtar  
left JOIN gxbdbps.gentiaf b on b.enemiso = a.lenemi
WHERE LFECTR BETWEEN '20200301' AND '20200312'  and lbinpr = '488234'
and a.lenemi= '015'
Group by LBINPR,lcodbc,lnrtar,q.crdocu,lfectr,lhortr,lcodtr,TXDTRX,q.crnomb,IDMONEDA,LPOSEM,LMCCTR,LNFACT,LIDTRA,LESTTR,LCRETR,CODDES,LCAUTR,LNFISC,LCOMTR,LIDCOM,LIMPGS,LENEMI,ennombr,LFCOTR,LERRNB
HAVING COUNT(*) > 2
order by lfectr*/

-------------------------------------------REPORTE DETALLE POR PRESTACION---------------------------------------------------

Select OPFEREA FECHA_REAL,OPCOMER COMERCIO,SUBSTR(optarj,1,6)
,OPENEMI ENTIDAD,ENTBINA DESC_ENTI,SUBSTR(OPIDTRA,1,1) DISPOSITIVO,OPTIPTAR,OPCODTRN COD_TRX,
txdtrx DESCRIPCION,OPMONTO MONTO,OPCODRES COD_RES,SUBSTR(OPSTATUS,1,1) ESTADO--,(case when substr(opcomer,1,2) = '81' then 'DINELCO EFECTIVO' ELSE 'RED DE PAGOS' END) SERVICIO
from gxopera.opmovi A
INNER join libdebito.tbctra0p b on b.txctrx = a.opcodtrn 
LEFT JOIN LIBDEBITO.DRCONBEP C ON LCAUTR = OPCODAUT AND  LERRNB = OPNOREF AND LFECTR = OPFEREA AND LCODBC = OPTIPTAR  
LEFT JOIN gxopera.opentid1 D ON SUBSTR(ENTBIN,1,6)= substr(optarj,1,6) AND ENTCODI = OPENEMI
WHERE OPFEREA BETWEEN '20190701' AND '20190731' and substr(opidtra,1,1)= 'T'  AND SUBSTR(OPSTATUS,1,1)= 'D'--IN ('A','D','R') --AND OPCODRES = '00'--AND  substr(opcomer,1,2) IN ('81','86') 
 

 
-----------------------------------**REPORTE AGRUPADO POR PRESTACION**----------------------------------------------------------------
Select substr(optarj,1,6) BIN,OPTIPTAR, opcodtrn Cod_TRX, txdtrx DESCRIPCION, substr(opidtra,1,1) DISPOSITIVO, count(*) CANTIDAD, sum(opmonto)MONTO 
from gxopera.opmovi 
inner join libdebito.tbctra0p on opcodtrn = txctrx
where opferea between '20190701' and '20190731' and substr(opidtra,1,1)= 'T'
group by substr(optarj,1,6),OPTIPTAR, opcodtrn, substr(opidtra,1,1), txdtrx 

 ---------------------------------------------------------**REPORTE POR VISITA DE TECNICOS-**--------------------------------------------------------------------------------
SELECT cocomer codigo, codeno nombre, codire1 direccion, coteln telefono,  lodesc localidad, corucn ruc, lhortr hora, lfectr fecha, 
(select count(*) from gxbdbps.coafmaf where afcomer = cocomer   ) cantidadPos, count(*) cantidadtrx, (case when COCONEX='1' then 'DIAL' WHEN COCONEX = '2' THEN 'LAN' 
WHEN COCONEX = '3' THEN 'DIAL' ELSE 'XXXX' END) tipo_conex, crnomb tecnico, SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) AS TARJETA, lactfj activof
FROM LIBDEBITO.DRCONBEP a
left join gxbdbps.comaeaf b on cocomer =  substr(digits(lidcom), 6, 7)
LEFT  join LIBDEBITO.TGEMBHAF  on crtarj = lnrtar
left join gxbdbps.colocaf c on b.locodi = c.locodi
WHERE LFECTR >= '20190721' AND LFECTR <= '20190820' 
AND LNRTAR IN ('7030029999997294', '6274319999994274',
 '7030029999997229',	'6274319999994191',
 '7030029999996890', '6274319999993946',
'7030029999997211', 
'7030029999996775',	'6274319999993813',
 '7030029999997286',	'6274319999994266' ,'7030029999996387',
'6274319999993433', '7030029999997336',	'6274319999994332', '7030029999997393', '6274319999994282')
GROUP BY COCOMER, CODENO, CODIRE1, COTELN, LODESC, CORUCN, LHORTR, LFECTR, COCONEX,crnomb,LNRTAR, lactfj 
 

	----------------------REPORTE RESUMEN DIARIO POR COMERCIO/ POR ESTABLECIMIENTOS--------------------------------------------------------------

select   LICOMER AS COMERCIO,CORUCN AS RUC,  codeno as denominacion, CORAZO AS RAZON, LIFECHA AS FECHADEP, LITIPTAR AS REFE, LICANT AS CUPON, LIMONTO AS MONTO, (LICOENT +LICOBPS) AS COMISION, (LIIVAENT+LIIVABPS) AS IVASCOMI,
LIRENTA AS RETRENTA, LIREIVA AS IVARETEN, (LICOENT +LICOBPS+LIRENTA+LIREIVA+LIIVAENT+LIIVABPS) AS TOTDESC, LINETO AS IMPNETO,
 LIFECREDI AS FECHCRED,ENNOMBR AS EMISOR_BANCO, ADNUMCTA AS CUENTA
from gxopera.flicom1 A
inner join gxbdbps.comaeaf B on LICOMER = cocomer 
INNER JOIN GXBDBPS.GENTIAF C ON B.ENEMISO = C.ENEMISO
where COCOMER---corucn = '80019219-2'and 
LIFECREDI >=  '20190701' and  LIFECREDI <='20190702'
and substr(LICOMER,1,2) <> '81'
union

/*PARA DINELCO EFECTIVO*/
select   LICOMER AS COMERCIO,CORUCN AS RUC, codeno as denominacion, CORAZO AS RAZON, LIFECHA AS FECHADEP, LITIPTAR AS REFE, LICANT AS CUPON, LINETO AS MONTO, 0 AS COMISION, 0 AS IVASCOMI,
0 AS RETRENTA, 0 AS IVARETEN, 0 AS TOTDESC, LINETO AS IMPNETO, LIFECREDI AS FECHCRED, ENNOMBR AS EMISOR_BANCO, ADNUMCTA AS CUENTA
from gxopera.flicom1 A
inner join gxbdbps.comaeaf B on (LICOMER = cocomer)
INNER JOIN GXBDBPS.GENTIAF C ON B.ENEMISO = C.ENEMISO
where corucn = '80019219-2' and 
LIFECREDI >=  '20190601' and  LIFECREDI <='20190931'
and substr(LICOMER,1,2) = '81'


------------REPORTE DE TRX - RECLAMOS BNF-------------------------------------------------------------------------------
select RFENTI as entidad ,  concat(concat(concat(substr(RFECTR , 7 , 2 ) ,'/') ,concat(substr(RFECTR , 5 , 2 ),'/' )),
(substr(RFECTR , 1 , 4 ) )) as fecha1 ,RNRTAR as Num_Tar, crdocu as ci, RIDCOM as id_comercio , codeno as nombre_com, RIMPGS as importe,
substr(RIDTRA,1,4) as Dispo_Trx, LCAUTR AS AUTORIZACION, substr(RIDTRA,5,2)AS secuencia1,substr(RIDTRA,7,5) AS secuencia2,RESTTR as estado_trx,  
REFLAG,  RCOME1 as Cod_resp,concat(concat(concat(substr(RFEREC , 7 , 2 ) ,'/') ,
concat(substr(RFEREC , 5 , 2 ),'/' )),(substr(RFEREC , 1 , 4 ) ))as fecha2       , RIDREC as Usuario_recla,  concat(concat(concat(substr(RFEPRO , 7 , 2 ) ,'/') ,
concat(substr(RFEPRO , 5 , 2 ),'/' )),(substr(RFEPRO , 1 , 4 ) ))as fecha3,  RIDPRO as Usuario_Proce,   RERRNB as referencia--, max(crvenc)as venc 
 from LIBDEBITO.OPEMAEHST A
inner join gxbdbps.comaeaf B on ridcom = cocomer
left JOIN libdebito.tgembhaf C ON  RNRTAR = CRTARJ 
LEFT join libdebito.drconbep D ON  LERRNB = RERRNB 
where RFEPRO between '20200' AND '20191031' 
group by  rfenti,codeno, rfectr,rnrtar,crdocu,ridcom,rmontr,rimpgs,ridtra,resttr,reflag,rcome1,rferec,ridrec,rfepro,ridpro,rerrnb, LCAUTR

select * from LIBDEBITO.OPEMAEHST

------------------/*TRX DINELCO EFECTIVO - FECHA REAL*/-----------------------------------------------------------------------------------

Select OPFEREA F_REAL, OPFECOM F_COMERCIAL, SUBSTR(OPTARJ,1,6)||'XXXXXX'||SUBSTR(OPTARJ,13,4) TARJETA,optiptar TIPOTAR, OPNOREF REFERENCIA, OPCODAUT AUTORIZ, OPCODTRN TIPOTRX, opcomer Comercio ,
opentid ENTIDAD,ENTDESC Descrip_Entidad,OPCODRES RETORNO, OPSTATUS ESTADO, opmonto Monto_COMI, (OPMONTO - OPCOMI) MONTO_SIN_COMI,OPCOMI COMISION, OPCOMENT COMI_ENTID, 
OPIVAENT IVA_ENT, OPCOMBPS COMI_BEPSA, OPIVABPS IVA_BEPSA, linrofac NroFactura 
from gxopera.opmovi
inner join gxbdbps.comaeaf on opentid = coenadm and substr(cocomer,1,2) = '45'
inner join gxopera.opentid on opentid = reenti
inner join gxopera.flicom1 on licomer = cocomer and optiptar = litiptar and opcodtrn = licodtr
where OPFEREA >= '20190801' and OPFEREA <= '20190831' and substr(OPCOMER,1,2) = '81'
and lifechd BETWEEN '20190801' and '20190831'
group by OPFEREA,OPFECOM, OPTARJ,OPNOREF,OPCODAUT, OPCODTRN,OPCODRES,OPSTATUS, opmonto, OPCOMI, OPCOMENT,OPCOMBPS, OPIVAENT, OPIVABPS,opcomer,opentid,ENTDESC,linrofac,optiptar
order by opcomer

------------/* TRANSACCIONES DE BINES CONTINENTAL*/-------------------------------------------------------
SELECT LBINPR BIN,LCODBC MARCA, SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) TARJETA, LFECTR FECHA_REAL,  LCODTR COD_TRX, TXDTRX DESC_TRX,
 LIDCOM COMERCIO, codeno denominacion, CORUCN RUC, CORAZO RAZON_SOCIAL, LIMPGS IMPORTE, 
SUBSTR(LIDTRA,1,1) DISPOSITIVO, LESTTR ESTADO,LCRETR RESPUESTA,  CODDES DESCRIPCIONRET,  LCAUTR AUTORIZACION
FROM LIBDEBITO.DRCONBEP
inner join gxbdbps.comaeaf a on cocomer =  substr(digits(lidcom), 6, 7)
INNER JOIN libdebito.tbcret0p ON lcretr = CODNRO
inner join libdebito.tbctra0p on txctrx = lcodtr
WHERE LFECTR BETWEEN '20191001' AND '20191001' AND LBINPR IN('422410','527607','423027','589657','604286','545288','545289', '510795', '601639') 
and codmar = 'BEPS'
ORDER BY LFECTR,LHORTR DESC 

----------------------------/* DETALLE DE TRANSACCIONES BNF*/-----------------------------------------
SELECT lenemi Emisor,LCODBC MARCA, SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) TARJETA,LBINPR BIN,ptiptar TIPO,  'LOCAL' TIPO_TARJ,LERRNB NRO_REFERENCIA, LFECTR FECHA_REAL, LFCOTR FECHA_COMER, 
LCODTR COD_TRX, TXDTRX DESC_TRX,LIDCOM COMERCIO, CORAZO RAZON_SOCIAL, LIMPGS IMPORTE, SUBSTR(LIDTRA,1,1) DISPOSITIVO, LESTTR ESTADO,LCRETR RESPUESTA/*,  CODDES DESCRIPCIONRET--, OPTIPTAR TIPO --codeno denominacion, CORUCN RUC */
FROM LIBDEBITO.DRCONBEP
left join libdebito.TBINPROC  on PBIN = LBINPR 
inner join gxbdbps.comaeaf a on cocomer =  substr(digits(lidcom), 6, 7)
INNER JOIN libdebito.tbcret0p ON lcretr = CODNRO
inner join libdebito.tbctra0p on txctrx = lcodtr
WHERE LFECTR BETWEEN '20191101' AND '20191101'
---and lbinpr in ('703002', '627431','516000','516419','530955','517732','510212', '420806','488234','861600','861601', '425935', '425936' , '443076',  '443077', '443078', '516400')
and CODMAR = 'BEPS' AND LENEMI IN ('002', '510')
and SUBSTR(LIDTRA,1,1) IN ('P')
union 
SELECT lenemi Emisor,LCODBC MARCA, SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) TARJETA,LBINPR BIN,ptiptar TIPO,  'INTERNACIONAL' TIPO, LERRNB NRO_REFERENCIA, LFECTR FECHA_REAL, LFCOTR FECHA_COMER, 
LCODTR COD_TRX, TXDTRX DESC_TRX,LIDCOM COMERCIO, CORAZO RAZON_SOCIAL, LIMPGS IMPORTE, SUBSTR(LIDTRA,1,1) DISPOSITIVO, LESTTR ESTADO,LCRETR RESPUESTA/*,  CODDES DESCRIPCIONRET--, OPTIPTAR TIPO --codeno denominacion, CORUCN RUC */
FROM LIBDEBITO.DRCONBEP
left join libdebito.TBINPROC  on PBIN = LBINPR 
inner join gxbdbps.comaeaf a on cocomer =  substr(digits(lidcom), 6, 7)
INNER JOIN libdebito.tbcret0p ON lcretr = CODNRO
inner join libdebito.tbctra0p on txctrx = lcodtr
WHERE LFECTR BETWEEN '20191101' AND '20191101'
and CODMAR = 'BEPS' AND LENEMI IN ('510')
and SUBSTR(LIDTRA,1,1) IN ('P')
AND LBINPR NOT IN (SELECT PBIN FROM LIBDEBITO.TBINPROC WHERE  PBIN = LBINPR) 


 
-------/* REPORTE AUTOMATICO DE LUNES BENNET(3dias)- ZARA*/-------------------------
select   LICOMER AS COMERCIO, codeno as denominacion, CORAZO AS RAZON, LIFECHA AS FECHADEP, LITIPTAR AS REFE, LICANT AS CUPON, LIMONTO AS MONTO, (LICOENT +LICOBPS) 
AS COMISION, (LIIVAENT+LIIVABPS) AS IVASCOMI,
LIRENTA AS RETRENTA, LIREIVA AS IVARETEN, (LICOENT +LICOBPS+LIRENTA+LIREIVA+LIIVAENT+LIIVABPS) AS TOTDESC, LINETO AS IMPNETO, LIFECREDI AS FECHCRED
from gxopera.flicom1 
inner join gxbdbps.comaeaf on (LICOMER = cocomer)
where corucn = '80089402-2' 
and substr(LIFECREDI,1,4) = YEAR(NOW())
and substr(LIFECREDI,5,2) =  MONTH (now())
AND substr(LIFECREDI,7,2) between day(now()- 3 days) and  day (now())
--/* REPORTE AUTOMATICO DIARIO BENNETT - ZARA*/------------------------------------------------------

select   LICOMER AS COMERCIO, codeno as denominacion, CORAZO AS RAZON, LIFECHA AS FECHADEP, LITIPTAR AS REFE, LICANT AS CUPON, LIMONTO AS MONTO, (LICOENT +LICOBPS) 
AS COMISION, (LIIVAENT+LIIVABPS) AS IVASCOMI,
LIRENTA AS RETRENTA, LIREIVA AS IVARETEN, (LICOENT +LICOBPS+LIRENTA+LIREIVA+LIIVAENT+LIIVABPS) AS TOTDESC, LINETO AS IMPNETO, LIFECREDI AS FECHCRED
from gxopera.flicom1 
inner join gxbdbps.comaeaf on (LICOMER = cocomer)
where corucn = '80089402-2'
and substr(LIFECREDI,1,4) = YEAR(NOW())
and substr(LIFECREDI,5,2) =  MONTH (now())
AND substr(LIFECREDI,7,2) between day(now()- 1 days) and  day (now())

--------/* REPORTE AUTOMATICO DE LUNES BONA VISTA - ZARA*/-------------------------
select   LICOMER AS COMERCIO, codeno as denominacion, CORAZO AS RAZON, LIFECHA AS FECHADEP, LITIPTAR AS REFE, LICANT AS CUPON, LIMONTO AS MONTO, (LICOENT +LICOBPS) AS COMISION, (LIIVAENT+LIIVABPS) AS IVASCOMI,
LIRENTA AS RETRENTA, LIREIVA AS IVARETEN, (LICOENT +LICOBPS+LIRENTA+LIREIVA+LIIVAENT+LIIVABPS) AS TOTDESC, LINETO AS IMPNETO, LIFECREDI AS FECHCRED
from gxopera.flicom1 
inner join gxbdbps.comaeaf
on (LICOMER = cocomer)
where corucn = '80089348-4'
and substr(LIFECREDI,1,4) = YEAR(NOW())
and substr(LIFECREDI,5,2) =  MONTH (now())
AND substr(LIFECREDI,7,2) between day(now()- 3 days) and  day (now())


----------------/* REPORTE AUTOMATICO DIARIO BONA VISTA - ZARA*/------------------------------------------------------

select   LICOMER AS COMERCIO, codeno as denominacion, CORAZO AS RAZON, LIFECHA AS FECHADEP, LITIPTAR AS REFE, LICANT AS CUPON, LIMONTO AS MONTO, (LICOENT +LICOBPS) AS COMISION, (LIIVAENT+LIIVABPS) AS IVASCOMI,
LIRENTA AS RETRENTA, LIREIVA AS IVARETEN, (LICOENT +LICOBPS+LIRENTA+LIREIVA+LIIVAENT+LIIVABPS) AS TOTDESC, LINETO AS IMPNETO, LIFECREDI AS FECHCRED
from gxopera.flicom1 
inner join gxbdbps.comaeaf
on (LICOMER = cocomer)
where corucn = '80089348-4'
and substr(LIFECREDI,1,4) = YEAR(NOW())
and substr(LIFECREDI,5,2) =  MONTH (now())
AND substr(LIFECREDI,7,2) between day(now()- 1 days) and  day (now())

/**/
select tdaenti as Entidad, ennombr, tdacome as Codigo_Comercio, codeno, sum(tdacant) as Cantidad, sum(tdaimpo) as Importe
from gxopera.tdavistas a inner join gxbdbps.gentiaf b on a.tdaenti = b.enemiso
inner join gxbdbps.comaeaf c on a.tdacome = c.COCOMER
where tdaanho = '2019' and tdames = '10'
and tdaenti = '332'
and tdacotr = '000054'
and tdaesta = 'A' and tdacore = '00'
group by tdaenti, ennombr, tdacome, codeno
order by tdacome

-------------/* RESUMEN CANTIDAD Y total de MOVIMIENTOS*/-------------------------------
select 'T'||SUBSTR(TDACOME,5,3) CAJERO, CODENO DESCRIPCION,sum(tdacant) CANTIDAD, SUM(TDAIMPO) TOTALMOV, TDACOTR 
from gxopera.tdavistas
INNER JOIN GXBDBPS.COMAEAF ON TDACOME = COCOMER
where tdaanho||tdames||tdadias between  '20191001' and '20191031'
and tdacore = '00' AND TDACOTR BETWEEN  '000052' AND '000052'
AND SUBSTR(TDACOME,1,2) = '90'
GROUP BY TDACOME, CODENO, TDACOTR


--------------------------------/*REPORTE DE TMPNUM*/-----------------------------------------------------------
select mcnumct,numper,numfch,numtip,numtra,numfic,nummor,numpun,numsfi,numsfc,numsfn,numsmo,numdmo,numpag,numdsc 
from gxbdbps.TMPNUM 
where numfch between '20191018' and '20191018' and mcnumct = '2030000190'



---------------------------------/*REPORTE DE ACEDITACIONES*/--------------------------------------------------
select LICOMER AS COMERCIO, codeno as denominacion, CORUCN AS RUC, linrofac as nrofactura,FARTDESC AS DESCRIP,LIMONTO AS MONTO,LICOENT AS COMI_ENTI,LIIVAENT AS IVA_ENTI,LICOBPS AS COMIBPS,
LIIVABPS AS IVA_BPS, LIRENTA AS RENTA, LIREIVA AS REN_IVA,  LINETO AS NETO, LIFECREDI AS FECHCRED, ENNOMBR AS EMISOR_BANCO, ADNUMCTA AS CUENTA , TXDTRX AS CONCEPTO
from gxopera.flicom1 A
inner join gxbdbps.comaeaf B on (LICOMER = cocomer)
INNER JOIN GXBDBPS.GENTIAF C ON B.ENEMISO = C.ENEMISO
inner join LIBDEBITO.TBCTRA0P D on (licodtr = txctrx)
left join gxopera.factura1 E ON  E.FACTNRO = A.LINROFAC --and E.factipo = A.litiPtar and E.faRtcodi= A.licodtr
where corucn = '4690406-9' and LIFECREDI >=  '20080101' and  LIFECREDI <='20191130' --AND LICODTR IN ('010001','210010')
AND SUBSTR(licomer,1,2) <>'81'
UNION
select LICOMER AS COMERCIO, codeno as denominacion, CORUCN AS RUC, linrofac as nrofactura,LIMONTO AS MONTO,LICOENT AS COMI_ENTI,LIIVAENT AS IVA_ENTI,LICOBPS AS COMIBPS,
LIIVABPS AS IVA_BPS, LIRENTA AS RENTA, LIREIVA AS REN_IVA,  LINETO AS NETO, LIFECREDI AS FECHCRED, ENNOMBR AS EMISOR_BANCO, ADNUMCTA AS CUENTA , TXDTRX AS CONCEPTO
from gxopera.flicom1 A
inner join gxbdbps.comaeaf B on (LICOMER = cocomer)
INNER JOIN GXBDBPS.GENTIAF C ON B.ENEMISO = C.ENEMISO
inner join LIBDEBITO.TBCTRA0P D on (licodtr = txctrx)
--inner join gxopera.factura1 E ON  E.FACTNRO = A.LINROFAC --and E.factipo = A.litiPtar --and E.faRtcodi= A.licodtr
where corucn = '4690406-9' and LIFECREDI >=  '20080101' and  LIFECREDI <='20191130' --AND LICODTR IN ('010001','210010')
AND SUBSTR(licomer,1,2)='81'

SELECT * FROM libdebito.drconbep WHERE LIDCOM = '0100001' AND LBINPR = '703020'
/*Select FACFECH, F.FACTNRO, FACSTATUS ESTADO, FACLIEN CODIGO,  F.FACTIPO TIPO,FARTCODI, FARTDESC, FARTCANT CANTIDAD, FARTGRAB, FARTIVA, (FARTGRAB+FARTIVA) CON_IVA
 from gxopera.factura F
 LEFT JOIN CONTABILID.FICLIEN ON CLCOCL = FACLIEN AND FACDOCU = CLCODO
 INNER JOIN GXOPERA.FACTURA1 X ON F.FACTIPO = X.FACTIPO AND F.FACTNRO = X.FACTNRO AND F.FACTIMBR = X.FACTIMBR
 WHERE FACFECH BETWEEN  '{?desde}' AND '{?HASTA}'   AND IDMONEDA = '{?MONEDA}'  and CLRUCO = '{?RUC}' AND FACSTATUS  = '{?ESTADO}' */
 


------------------/*REPORTE DE CUADRO DE COMPENSACION */--------------------------------------------------
select opfecom Fecha_Comercial,ophotrn, opcomer Comercio,opnoref REFERENCIA,codeno Nombre_Comercio,
opmonto Monto,OPCODTRN COD_TRX,txdtrx Tipo_Trx , oprador OPERADOR_TELF
from  gxopera.opmovi a
inner join gxbdbps.comaeaf  b on (cocomer = opcomer)
inner join LIBDEBITO.TBCTRA0P c on (txctrx = opcodtrn)
where opfecom BETWEEN '20190916' and  '20190916' AND opentid = '162' AND OPCODTRN  NOT IN ( '011000', '013000')
AND SUBSTR(opcomer,1,2)<>'81'

UNION
select opfecom Fecha_Comercial, ophotrn,opcomer Comercio,opnoref REFERENCIA, codeno Nombre_Comercio,
opmonto Monto,OPCODTRN COD_TRX,txdtrx Tipo_Trx , OPRADOR OPERADOR_TELF
from  gxopera.opmovi a
inner join gxbdbps.comaeaf  b on (cocomer = opcomer)
inner join LIBDEBITO.TBCTRA0P c on (txctrx = opcodtrn)
where opfecom BETWEEN '20190916' and  '20190916' and opentid = '162' and SUBSTR(opcomer,1,2)='81' 


SELECT * from  gxopera.opmovi WHERE OPCOMER = '8100744' AND opfecom BETWEEN '20190916' and  '20190916' --OPNOREF = '925616146631'                            


-------------/* REPORTE DE EMBOZADOS - DETALLE */-------

select SUBSTR(crtarj,1,6)||'XXXXXX'||SUBSTR(crtarj,13,4) TARJETA,  CRDOCU CEDULA,CRNOMB NOMBRE_Y_APELLIDO, CRENTI ENTIDAD, ENTBINA DESCRIP,crclat afinidad, enttipo tipo, crfege fechage,crcodn CODIGO,(case when crcodn = 1 then 'ALTAS'
when crcodn = 2 then 'REGRABACIÓN CC-NRO Y VTO.'
when crcodn = 3 then 'REGRABACIÓN SC-NRO Y VTO.'
when crcodn = 4 then 'RENOVACIÓN POR VTO.'
when crcodn = 5 then 'IMPRESION DE PIN.'
when crcodn = 6 then 'RENOVACIÓN ESP CCN/CVTO.'
when crcodn = 7 then 'RENOVACIÓN ESP SCN/CVTO.'
end )detalles
from libdebito.tgembhaf
left join gxopera.opentid1 on crenti = entcodi and crbine = substr(entbin, 1,6)
where  substr(crfeej,1,4) = '2019'
and  substr(crfeej,5,2) between  '11' and  '11'

--------------------------*****DETALLE DE TRX - ENTIDADES**----

select OPFEREA F_REAL, OPHOTRN HORA, OPFECOM F_COMERCIAL,  SUBSTR(OPTARJ,1,6) || 'XXXXXX' ||SUBSTR(OPTARJ,13,4) TARJETA, OPNOREF REFERENCIA, OPCODAUT AUTORIZACION, OPCOMER COMERCIO,
OPCODTRN TIPOTRX, OPCODRES RETORNO, OPSTATUS ESTADO, OPADMIN ADMIN, OPENEMI EMISOR, OPTIPTAR TIPO_TARJ,opmonto monto,substr(opidtra,1,1) DISPOSITIVO, CODENO DESCRIPCION
from gxopera.opmovi
INNER JOIN GXBDBPS.COMAEAF ON COCOMER = OPCOMER

where opfecom BETWEEN '20191101'  AND '20191101' and openemi BETWEEN '300' AND '400'





---*************   TRANSACCIONES EN ATM - CONSULTA  *********--- 


SELECT MARCA, SUM(ENE) ENE, SUM(FEB) FEB, SUM(MAR) MAR, SUM(ABR) ABR, SUM(MAY) MAY , SUM(JUN) JUN,  SUM(JUL) JUL, SUM(AGO) AGO, SUM(SEP) SEP, SUM(OCT) OCT,  SUM(NOV) NOV, SUM(DIC) DIC 
FROM (
select TDAMARK AS MARCA, SUM(TDACANT)  AS ENE, SUM(0) AS FEB,SUM(0) AS MAR, SUM(0) AS ABR, SUM(0) AS MAY, SUM(0) AS JUN, SUM(0) AS JUL, SUM(0) AS AGO, SUM(0) AS SEP, SUM(0) AS OCT, SUM(0) AS NOV, SUM(0) AS DIC  
from gxopera.tdavistas
INNER JOIN GXBDBPS.COMAEAF
ON (TDACOME = COCOMER )
where tdames = '01'
AND TDAANHO = '2019'
and tdatipo = 'T'
--AND CORUCN NOT IN ( '80011012-9')
AND TDACOTR IN  ('311000', '311100', '312000' , '312100', '313000', '313100', '314000', '314001','303000','304000','301000','302000')
AND TDAESTA = 'A'
AND TDAMARK IN ('BIL', 'CAB',  'CRE', 'DCR', 'DEB', 'DIN', 'MST', 'PAN', 'UNI', 'VSA' ) 
GROUP BY  TDAMARK 

UNION 
select TDAMARK AS MARCA, SUM(0)  AS ENE, SUM(TDACANT) AS FEB,SUM(0) AS MAR, SUM(0) AS ABR, SUM(0) AS MAY, SUM(0) AS JUN, SUM(0) AS JUL, SUM(0) AS AGO, SUM(0) AS SEP, SUM(0) AS OCT, SUM(0) AS NOV, SUM(0) AS DIC  from gxopera.tdavistas
INNER JOIN GXBDBPS.COMAEAF
ON (TDACOME = COCOMER )
where tdames = '02'
AND TDAANHO =  '2019'
and tdatipo = 'T'
--AND CORUCN NOT IN ( '80011012-9')
AND TDACOTR IN  ('311000', '311100', '312000' , '312100', '313000', '313100', '314000', '314001','303000','304000','301000','302000')
AND TDAESTA = 'A'
AND TDAMARK IN ('BIL', 'CAB',  'CRE', 'DCR', 'DEB', 'DIN', 'MST', 'PAN', 'UNI', 'VSA' ) 
GROUP BY  TDAMARK 
UNION
select TDAMARK AS MARCA, SUM(0)  AS ENE, SUM(0) AS FEB,SUM(TDACANT) AS MAR, SUM(0) AS ABR, SUM(0) AS MAY, SUM(0) AS JUN, SUM(0) AS JUL, SUM(0) AS AGO, SUM(0) AS SEP, SUM(0) AS OCT, SUM(0) AS NOV, SUM(0) AS DIC  from gxopera.tdavistas
INNER JOIN GXBDBPS.COMAEAF
ON (TDACOME = COCOMER )
where tdames = '03'
AND TDAANHO =   '2019'
and tdatipo = 'T'
--AND CORUCN NOT IN ( '80011012-9')
AND TDACOTR IN  ('311000', '311100', '312000' , '312100', '313000', '313100', '314000', '314001','303000','304000','301000','302000')
AND TDAESTA = 'A'
AND TDAMARK IN ('BIL', 'CAB',  'CRE', 'DCR', 'DEB', 'DIN', 'MST', 'PAN', 'UNI', 'VSA' ) 
GROUP BY  TDAMARK
UNION 
select TDAMARK AS MARCA, SUM(0)  AS ENE, SUM(0) AS FEB,SUM(0) AS MAR, SUM(TDACANT) AS ABR, SUM(0) AS MAY, SUM(0) AS JUN, SUM(0) AS JUL, SUM(0) AS AGO, SUM(0) AS SEP, SUM(0) AS OCT, SUM(0) AS NOV, SUM(0) AS DIC  from gxopera.tdavistas
INNER JOIN GXBDBPS.COMAEAF
ON (TDACOME = COCOMER )
where tdames = '04'
AND TDAANHO =  '2019'
and tdatipo = 'T'
--AND CORUCN NOT IN ( '80011012-9')
AND TDACOTR IN  ('311000', '311100', '312000' , '312100', '313000', '313100', '314000', '314001','303000','304000','301000','302000')
AND TDAESTA = 'A'
AND TDAMARK IN ('BIL', 'CAB',  'CRE', 'DCR', 'DEB', 'DIN', 'MST', 'PAN', 'UNI', 'VSA' ) 
GROUP BY  TDAMARK
UNION 
select TDAMARK AS MARCA, SUM(0)  AS ENE, SUM(0) AS FEB,SUM(0) AS MAR, SUM(0) AS ABR, SUM(TDACANT) AS MAY, SUM(0) AS JUN,  SUM(0) AS JUL,SUM(0) AS AGO, SUM(0) AS SEP, SUM(0) AS OCT, SUM(0) AS NOV, SUM(0) AS DIC  from gxopera.tdavistas
INNER JOIN GXBDBPS.COMAEAF
ON (TDACOME = COCOMER )
where tdames = '05'
AND TDAANHO =   '2019'
and tdatipo = 'T'
--AND CORUCN NOT IN ( '80011012-9')
AND TDACOTR IN  ('311000', '311100', '312000' , '312100', '313000', '313100', '314000', '314001','303000','304000','301000','302000')
AND TDAESTA = 'A'
AND TDAMARK IN ('BIL', 'CAB',  'CRE', 'DCR', 'DEB', 'DIN', 'MST', 'PAN', 'UNI', 'VSA' ) 
GROUP BY  TDAMARK
UNION
select TDAMARK AS MARCA, SUM(0)  AS ENE, SUM(0) AS FEB,SUM(0) AS MAR, SUM(0) AS ABR, SUM(0) AS MAY, SUM(TDACANT) AS JUN, SUM(0) AS JUL, SUM(0) AS AGO, SUM(0) AS SEP, SUM(0) AS OCT, SUM(0) AS NOV, SUM(0) AS DIC  from gxopera.tdavistas
INNER JOIN GXBDBPS.COMAEAF
ON (TDACOME = COCOMER )
where tdames = '06'
AND TDAANHO =  '2019'
and tdatipo = 'T'
--AND CORUCN NOT IN ( '80011012-9')
AND TDACOTR IN  ('311000', '311100', '312000' , '312100', '313000', '313100', '314000', '314001','303000','304000','301000','302000')
AND TDAESTA = 'A'
AND TDAMARK IN ('BIL', 'CAB',  'CRE', 'DCR', 'DEB', 'DIN', 'MST', 'PAN', 'UNI', 'VSA' ) 
GROUP BY  TDAMARK
UNION 
select TDAMARK AS MARCA, SUM(0)  AS ENE, SUM(0) AS FEB,SUM(0) AS MAR, SUM(0) AS ABR, SUM(0) AS MAY, SUM(0) AS JUN, SUM(TDACANT) AS JUL, SUM(0) AS AGO, SUM(0) AS SEP, SUM(0) AS OCT, SUM(0) AS NOV, SUM(0) AS DIC  from gxopera.tdavistas
INNER JOIN GXBDBPS.COMAEAF
ON (TDACOME = COCOMER )
where tdames = '07'
AND TDAANHO =  '2019'
and tdatipo = 'T'
--AND CORUCN NOT IN ( '80011012-9')
AND TDACOTR IN  ('311000', '311100', '312000' , '312100', '313000', '313100', '314000', '314001','303000','304000','301000','302000')
AND TDAESTA = 'A'
AND TDAMARK IN ('BIL', 'CAB',  'CRE', 'DCR', 'DEB', 'DIN', 'MST', 'PAN', 'UNI', 'VSA' ) 
GROUP BY  TDAMARK
UNION 
select TDAMARK AS MARCA, SUM(0)  AS ENE, SUM(0) AS FEB,SUM(0) AS MAR, SUM(0) AS ABR, SUM(0) AS MAY, SUM(0) AS JUN, SUM(0) AS JUL, SUM(TDACANT) AS AGO, SUM(0) AS SEP, SUM(0) AS OCT, SUM(0) AS NOV, SUM(0) AS DIC  from gxopera.tdavistas 
INNER JOIN GXBDBPS.COMAEAF
ON (TDACOME = COCOMER )
where tdames = '08'
AND TDAANHO =  '2019'
and tdatipo = 'T'
--AND CORUCN NOT IN ( '80011012-9')
AND TDACOTR IN  ('311000', '311100', '312000' , '312100', '313000', '313100', '314000', '314001','303000','304000','301000','302000')
AND TDAESTA = 'A'
AND TDAMARK IN ('BIL', 'CAB',  'CRE', 'DCR', 'DEB', 'DIN', 'MST', 'PAN', 'UNI', 'VSA' ) 
GROUP BY  TDAMARK
UNION 
select TDAMARK AS MARCA, SUM(0)  AS ENE, SUM(0) AS FEB,SUM(0) AS MAR, SUM(0) AS ABR, SUM(0) AS MAY, SUM(0) AS JUN,SUM(0) AS JUL, SUM(0) AS AGO, SUM(TDACANT) AS SEP, SUM(0) AS OCT, SUM(0) AS NOV, SUM(0) AS DIC  from gxopera.tdavistas
INNER JOIN GXBDBPS.COMAEAF
ON (TDACOME = COCOMER )
where tdames = '09'
AND TDAANHO =  '2019'
and tdatipo = 'T'
--AND CORUCN NOT IN ( '80011012-9')
AND TDACOTR IN  ('311000', '311100', '312000' , '312100', '313000', '313100', '314000', '314001','303000','304000','301000','302000')
AND TDAESTA = 'A'
AND TDAMARK IN ('BIL', 'CAB',  'CRE', 'DCR', 'DEB', 'DIN', 'MST', 'PAN', 'UNI', 'VSA' ) 
GROUP BY  TDAMARK
UNION 
select TDAMARK AS MARCA, SUM(0)  AS ENE, SUM(0) AS FEB,SUM(0) AS MAR, SUM(0) AS ABR, SUM(0) AS MAY, SUM(0) AS JUN,SUM(0) AS JUL, SUM(0) AS AGO, SUM(0) AS SEP, SUM(TDACANT) AS OCT, SUM(0) AS NOV, SUM(0) AS DIC  from gxopera.tdavistas
INNER JOIN GXBDBPS.COMAEAF
ON (TDACOME = COCOMER )
where tdames = '10'
AND TDAANHO =  '2019'
and tdatipo = 'T'
--AND CORUCN NOT IN ( '80011012-9')
AND TDACOTR IN  ('311000', '311100', '312000' , '312100', '313000', '313100', '314000', '314001','303000','304000','301000','302000')
AND TDAESTA = 'A'
AND TDAMARK IN ('BIL', 'CAB',  'CRE', 'DCR', 'DEB', 'DIN', 'MST', 'PAN', 'UNI', 'VSA' ) 
GROUP BY  TDAMARK
UNION 
select TDAMARK AS MARCA, SUM(0)  AS ENE, SUM(0) AS FEB,SUM(0) AS MAR, SUM(0) AS ABR, SUM(0) AS MAY, SUM(0) AS JUN, SUM(0) AS JUL, SUM(0) AS AGO, SUM(0) AS SEP, SUM(0) AS OCT, SUM(TDACANT) AS NOV, SUM(0) AS DIC  from gxopera.tdavistas
INNER JOIN GXBDBPS.COMAEAF
ON (TDACOME = COCOMER )
where tdames = '11'
AND TDAANHO =  '2019'
and tdatipo = 'T'
--AND CORUCN NOT IN ( '80011012-9')
AND TDACOTR IN  ('311000', '311100', '312000' , '312100', '313000', '313100', '314000', '314001','303000','304000','301000','302000')
AND TDAESTA = 'A'
AND TDAMARK IN ('BIL', 'CAB',  'CRE', 'DCR', 'DEB', 'DIN', 'MST', 'PAN', 'UNI', 'VSA' ) 
GROUP BY  TDAMARK
UNION 
select TDAMARK AS MARCA, SUM(0)  AS ENE, SUM(0) AS FEB,SUM(0) AS MAR, SUM(0) AS ABR, SUM(0) AS MAY, SUM(0) AS JUN, SUM(0) AS JUL, SUM(0) AS AGO, SUM(0) AS SEP, SUM(0) AS OCT, SUM(0) AS NOV, SUM(TDACANT) AS DIC  from gxopera.tdavistas
INNER JOIN GXBDBPS.COMAEAF
ON (TDACOME = COCOMER )
where tdames = '12'
AND TDAANHO =  '2019'
and tdatipo = 'T'
--AND CORUCN NOT IN ( '80011012-9')
AND TDACOTR IN  ('311000', '311100', '312000' , '312100', '313000', '313100', '314000', '314001','303000','304000','301000','302000')
AND TDAESTA = 'A'
AND TDAMARK IN ('BIL', 'CAB',  'CRE', 'DCR', 'DEB', 'DIN', 'MST', 'PAN', 'UNI', 'VSA' ) 
GROUP BY  TDAMARK ) AS A
GROUP BY MARCA
SELECT * FROM gxopera.tdavistas WHERE  TDAANHO =  '2019' and tdames = '01' and tdatipo = 'T' and
 TDACOTR IN ('311000', '311100', '312000' , '312100', '313000', '313100', '314000', '314001','303000','304000','301000','302000')

--------*********---/////TRANSACCIONES POR BIN DE TARJETA/////-------------------

SELECT  LBINPR BIN,LCODBC MARCA, SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) TARJETA,q.CRDOCU CEDULA, 
LFECTR FECHA_REAL, LHORTR HORA, LCODTR COD_TRX, TXDTRX DESC_TRX,q.crnomb NOMBRE_PLASTICO,(CASE WHEN IDMONEDA = '600' THEN 'GUARANIES' ELSE 'DOLARES' END )
 MONEDA,(CASE WHEN LPOSEM in ('9010','9020','910','920') THEN 'BANDA MAGNETICA'  WHEN LPOSEM = '0510' THEN 'CHIP' WHEN LPOSEM = '0710' THEN 'CONTACLESS' else 'VACIO' END)MODO_ENTRADA,LMCCTR TIPO_DE_COMERCIO ,LNFACT PAIS_DE_TRX,
LCOMTR DENOMINCACION, LIDCOM COD_COMERCIO, LIMPGS IMPORTE, LENEMI EMISOR,ennombr DESCRIP_EMISOR,LFCOTR FECHA_COMERCIAL
,SUBSTR(LIDTRA,1,1) DISPOSITIVO, LESTTR ESTADO,LCRETR RESPUESTA,  CODDES DESCRIP_RESP,  LCAUTR AUTORIZACION, LERRNB REFERENCIA,
(case when LNFISC in ('443073','472040') THEN 'BANCARD' when LNFISC = '449780' THEN 'BNF' when LNFISC ='461958' THEN 'AUSTRALIA' when LNFISC ='459834' THEN 'MILAN ITALIA' END) DESC_ADQUIRENTE,LNFISC ADQUIRENTE,COUNT(*)
FROM LIBDEBITO.DRCONBEP a
left join gxbdbps.comaeaf  on cocomer =  substr(digits(lidcom), 6, 7)
inner JOIN libdebito.tbcret0p ON lcretr = CODNRO
inner join libdebito.tbctra0p on txctrx = lcodtr
left join gxopera.factura on  faclien = lidcom
right join libdebito.tgembhaf q  on q.crtarj = lnrtar 
INNER join libdebito.TBINPROC  on PBIN = LBINPR
left join gxbdbps.tmtaraf J on J.MTNUMTA = lnrtar  
left JOIN gxbdbps.gentiaf b on b.enemiso = a.lenemi
WHERE LFECTR BETWEEN '20200301' AND '20200312'  and lbinpr = '488234'
and a.lenemi= '015'
Group by LBINPR,lcodbc,lnrtar,q.crdocu,lfectr,lhortr,lcodtr,TXDTRX,q.crnomb,IDMONEDA,LPOSEM,LMCCTR,LNFACT,LIDTRA,LESTTR,LCRETR,CODDES,LCAUTR,LNFISC,LCOMTR,LIDCOM,LIMPGS,LENEMI,ennombr,LFCOTR,LERRNB
HAVING COUNT(*) > 2
order by lfectr

-------------******COMISIONES POR COMERCIO POR TIPO DE TRX*******---------------------

select TXDTRX DESC,opcodtrn COD_TRX,opcomer COMERCIO,CORUCN RUC,corazo, CODENO DENOMINACION,substr(opferea,1,8) FECHA, 
sum(opmonto) monto, sum(opcomi) comision,  sum(opcoment) com_entidad, sum(opcombps) com_Bepsa, sum(opivaent) ivaent, sum(opivabps) ivabepsa ,
(CASE WHEN optiptar = 'CRE' THEN sum(opmonto*0.01) ELSE '' END) RETENCION_RENTA , 
(CASE WHEN optiptar = 'CRE' THEN sum(opmonto*0.0090909) ELSE '' END) IVA_RENTA,optiptar tipo
from gxopera.opmovi  
inner join gxbdbps.comaeaf on (opcomer = cocomer)
INNER JOIN LIBDEBITO.TBCTRA0P ON opcodtrn = TXCTRX 
where opcomer = '1000205' and substr(opferea,1,8) between '20200201' and '20200229'
and opcodreS = '00' and opstatus = 'A' and opcodtrn IN ( '370000','380000','390000') ---AND OPTIPTAR = 'CRE'
and substr(opcomer,1,2) <> '90' 
group by TXDTRX, opcodtrn, opcomer,CORUCN,corazo,CODENO, substr(opferea,1,8),optiptar
order by substr(opferea,1,8) asc

/************REPORTE GENERAL DE COMISIONES DE COMERCIOS */------------------


SELECT  COCOMER, CODENO, RUC, OPFEREA, SUM(Monto) Monto, SUM(Cantidad) Cantidad, SUM(Comision) Comision, 
SUM(ComiComercio) ComiComercio, SUM(Comibepsa) Comibepsa, SUM(IvaComiComer) IvaComiComer, SUM(IvaComiBepsa) IvaComiBepsa --FROM (

--Select COCOMER, CODENO, CORUCN RUC,opferea,opcodtrn,(case when opcodtrn = '390000' then sum(opmonto*100/105) else sum(opmonto) end) Monto,count(*) Cantidad, 
--(case when opcodtrn = '390000' THEN sum(((opmonto*100)/105)*0.009) else sum(opmonto *0.009) End) Comision, 
--(case when opcodtrn = '390000' THEN sum(((opmonto*100)/105)*0.007)/1.1 else sum(opmonto *0.007)/1.1 End) ComiComercio,
--(case when opcodtrn = '390000' THEN sum(((opmonto*100)/105)*0.002)/1.1 else sum(opmonto *0.002)/1.1 End) Comibepsa,
--(round(round((case when opcodtrn = '390000' THEN sum(((opmonto*100)/105)*0.007) else sum(opmonto *0.007) End))/11)) IvaComiComer,
--(round(round((case when opcodtrn = '390000' THEN sum(((opmonto*100)/105)*0.002) else sum(opmonto *0.002) End))/11)) IvaComiBepsa
from gxopera.opmovi 
inner join gxbdbps.comaeaf on cocomer = opcomer
where opferea BETWEEN  '20200201' AND '20200229'  and opcodres = '00' AND opstatus = 'A' 
and  substr(opcomer,1,2) <> '90'
group by COCOMER, CODENO, CORUCN, opferea, opcodtrn ) AS D

GROUP BY COCOMER, CODENO, RUC, OPFEREA

-----------*******COMISIONES POR RUBRO COMERCIAL Y TIPO DE TARJETA********-----------------

SELECT openemi emisor, optiptar tipo, RUCODI, rudesc RUBRO,SUM(OPMONTO) venta_total, SUM(OPCOMI) comision, 
SUM(OPCOMENT) comi_entidad,SUM(OPIVAENT) iva_enti,
SUM(OPCOMBPS) comi_bepsa,   SUM(OPIVABPS) IVABEPSA,  
(CASE WHEN optiptar = 'CRE' THEN sum(opmonto*0.01) ELSE '' END) RETENCION_RENTA , 
(CASE WHEN optiptar = 'CRE' THEN sum(opmonto*0.0090909) ELSE '' END) IVA_RENTA
FROM GXOPERA.OPMOVI 
INNER JOIN GXBDBPS.COMAEAF ON OPCOMER = COCOMER
inner join gxbdbps.corubaf on (substr(cocomer,1,2)= rucodi) AND SUBSTR(OPIDTRA,1,1) <> 'T'
WHERE OPFECOM BETWEEN  '20200101' AND '20200131' 
and opcodtrn in ('000054', '901020', '902020', '510000', '520000') 
group by openemi,optiptar,rucodi, rudescE

--------------******REPORTE POR BIN 601639 ***---------

sELECT  LFECTR FECHA_REAL,LFCOTR FECHA_COMERCIAL,LHORTR HORA,LENEMI CODIGO,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) TARJETA,LERRNB REFERENCIA,LCAUTR COD_AUTORIZACION,LIDCOM COD_COMERCIO,LCOMTR NOMBRE_COMERCIO,
LIMPGS IMPORTE,LCODTR COD_TRX,LCRETR COD_RESPUESTA,LESTTR ESTADO,SUBSTR(LIDTRA,1,4)ATM
FROM LIBDEBITO.DRCONBEP 
WHERE LFECTR BETWEEN '20200101' AND '20200131'  and lbinpr = '601639' AND SUBSTR(LIDTRA,1,1) = 'T' --and lidcom <> '6900282'
ORDER  BY LFECTR,LHORTR



----------------------*****REPORTE CON /SIN MOVIMIENTOS CICO*****----------------------------

select count (*), lidcom,lcomtr  
--select * 
from LIBDEBITO.DRCONBEP
 --INNER JOIN GXBDBPS.COMAEAF ON (lidcom = COCOMER)
  WHERE LCODTR IN ('370000', '380000', '390000')
  AND SUBSTR(lidcom,1,2)  IN ('45', '79', '80', '81', '86', '90')
AND LFECTR BETWEEN '20200101' AND '20200131' and  limpgs > '1000'
ORDER BY lidcom-- , OPHOTRN 
/*24355*/

SELECT  TRX,fecha, lidcom,lcomtr, SUM(DUDOSAS) AS DUDODAS, SUM(APROBADAS) AS APROBADAS, SUM(COD88) AS COD88, SUM(COD92) AS COD92 FROM (
SELECT LCODTR AS TRX,DATE(CURDATE() - 1 days) fecha, lcodbc as marca, substr(lidtra,1,1) as TDATIPO,  0 AS DUDOSAS, count(*) AS APROBADAS
FROM LIBDEBITO.DRCONBEP
WHERE  SUBSTR(LFECTR,1,4)||'-'||SUBSTR(LFECTR,5,2)||'-'||SUBSTR(LFECTR,7,2) = DATE(CURDATE() - 1 days)
AND   lcretr = '00'
and lesttr = 'A'
and limpgs > '1000'
GROUP BY  LCODTR , DATE(CURDATE() - 1 days),lcodbc, substr(lidtra,1,1))

select count(*), opcomer,codeno from gxopera.opmovi
inner join gxbdbps.comaeaf on opcomer = cocomer
where  substr(opcomer,1,2) not IN ('45', '79', '80', '81', '86', '90') and  opferea between '20200201' and '20200229' 
and opcodtrn in ('370000','380000','39000')


select A Codigo, B Denominacion, SUM(C) Cantidad, sum(importe), sum(D) Importe from (
select opcomer A, codeno B, count(*) C,sum(opmonto) importe, sum(opmonto) D
from gxopera.opmovi 
inner join gxbdbps.comaeaf on opcomer = cocomer
where opferea BETWEEN '20200201' AND '20200229'
and opcodtrn in ('370000','380000')  and opcodres = '00' and opstatus = 'A'
group by opcomer, codeno
union
select opcomer A, codeno B, count(*) C, sum(opmonto) importe,sum(integer((opmonto*100)/105)) D
from gxopera.opmovi
inner join gxbdbps.comaeaf on opcomer = cocomer
where opferea BETWEEN  '20200201' AND '20200229'
and opcodtrn in ('390000')  and opcodres = '00' and opstatus = 'A'
group by opcomer, codeno) x
group by A,B

-------------********MOVIMIENTO POR ADM EN ATM******-----------------------

SELECT LIDCOM COMERCIO, codeno denominacion, codtodesc departamento, lodesc localidad, LCODBC MARCA,
LBINPR BIN, count(*) cantidad, sum(limpgs) IMporte, lenemi entidad, F.ennombr desc_entidad, LCODTR COD_TRX, 
TXDTRX DESC_TRX, LFECTR FECHA_REAL,  
CODDES DESCRIPCIONRET, LESTTR ESTADO,LCRETR REtorno,   SUBSTR(LIDTRA,1,1) DISPOSITIVO, G.ENNOMBR
FROM LIBDEBITO.DRCONBEP 
inner join gxbdbps.comaeaf a on cocomer =  substr(digits(lidcom), 6, 7)
INNER JOIN libdebito.tbcret0p ON lcretr = CODNRO
inner join libdebito.tbctra0p on txctrx = lcodtr
inner join gxbdbps.colocaf c on a.locodi = c.locodi
INNER JOIN gxbdbps.CODTOAF X ON (C.CODDTO = X.CODDTO)
left join gxbdbps.gentiaf f on lenemi = f.enemiso
left join gxbdbps.gentiaf G on COENADM = G.enemiso
WHERE LFECTR BETWEEN '20200201' AND '20200229'  --AND LBINPR =''--IN ('230671','542927')
and codmar = 'BEPS' --and lcretr = '00' and LESTTR= 'A'
AND COENADM = '002'
group by lidcom, codeno, codtodesc, lodesc, LCODBC, LBINPR, lenemi, F.ennombr,LCODTR, TXDTRX, 
CODDES,LESTTR, LCRETR, SUBSTR(LIDTRA,1,1), G.ENNOMBR,lfectr

--------------****REPORTE TRANSACCIONES APROBADAS POR MARCA******----------------------

SELECT LFECTR FECHA_REAL,LHORTR HORA,LFCOTR FECHA_COMERCIAL/*,LIFECREDI FECHA_CREDITO*/,LCODBC MARCA,PTIPTAR TIPOTARJ,LBINPR BIN,LERRNB REFERENCIA,
SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) TARJETA,LIMPGS IMPORTE,LCAUTR AUTORIZACION,LIDCOM COD_COMER, LCOMTR NOMBRE_COMER,  LCODTR COD_TRX, TXDTRX DESCRIP_TRX,
LENEMI ENTIDAD, ENNOMBR DESCRIP_ENTI, LCRETR RETORNO,LESTTR ESTADO
--SELECT COUNT(*) 
FROM LIBDEBITO.DRCONBEP A
--WHERE LFECTR BETWEEN '20200201' AND '20200229' AND SUBSTR(LIDTRA,1,1) = 'P'  AND lcretr = '00' AND LESTTR <> 'Q' and lcodbc = 'VSA' /*AND CODMAR = 'BEPS'*/ and lidcom  <> '0100001'
INNER JOIN gxopera.flicom1 B ON /*LICOMER = LIDCOM  and */limonto = limpgs AND LIFECHA = LFECTR AND LITIPTAR = PTIPTAR 
left JOIN LIBDEBITO.TBINPROC C ON  PBIN = LBINPR
INNER JOIN GXBDBPS.GENTIAF D ON ENEMISO = LENEMI
INNER JOIN LIBDEBITO.TBCTRA0P E ON LCODTR = TXCTRX
INNER JOIN LIBDEBITO.TBCRET0P F ON LCRETR = CODNRO
WHERE LFECTR BETWEEN '20200201' AND '20200229'
AND SUBSTR(LIDTRA,1,1) = 'P'  AND lcretr = '00' AND LESTTR <> 'Q' and lcodbc = 'VSA' AND CODMAR = 'BEPS' and lidcom  <> '0100001'
group by LFECTR ,LHORTR ,LFCOTR /*,LIFECREDI*/,LCODBC,PTIPTAR,LBINPR,LERRNB,lnrtar,LIMPGS,LCAUTR,LIDCOM , LCOMTR ,LENEMI , ENNOMBR , 
LCODTR , TXDTRX, LCRETR , LESTTR

SELECT * FROM  LIBDEBITO.DRCONBEP
SELECT * FROM gxopera.flicom1
//90857//90872

A:APP
P:POS
T:ATM
G:EMPOS
M:TELEFONO


-------------****REPORTE DE DEBITO CON MOVIMIENTO POR ENTIDAD****-------------------------

SELECT a.lenemi Cod_Ent /*, entbina ENTIDAD*/, LCODBC MARCA, entbina afinidad , lnrtar NROTARJ, LFECTR FECHAMOV,lhortr HORA, LCODTR CODTRX, txdtrx descripcion,LIDCOM,
LCOMTR, LIMPGS, SUBSTR(LIDTRA,1,1) DISPO, LCRETR RETORNO, CODDES DESCRIPCIONRET, LESTTR ESTADO, lfcotr fcomercial, 
lcautr autorizacion, CRDOCU,LODESC LOCALIDAD, codtodesc descrpDto,lnfisc COD_ADQUIRENTE,(case when LNFISC in ('443073','472040') THEN 'BANCARD' when LNFISC = '449780' THEN 'BNF' when LNFISC ='461958' THEN 'AUSTRALIA' when LNFISC ='459834' THEN 'MILAN ITALIA' END)DESC_ADQUIRENTE,(CASE WHEN LMonTR = '600' THEN 'GUARANIES' ELSE 'DOLARES' END ) MONEDA,
LPOSEM CODIGO_ENTRADA,(CASE WHEN LPOSEM in ('9010','9020','910','920') THEN 'BANDA MAGNETICA'  WHEN LPOSEM = '0510' THEN 'CHIP' WHEN LPOSEM = '0710' THEN 'CONTACLESS' else ' ' END)DESC_ENTRADA
,LMCCTR COD_COMERCIANTE ,LNFACT PAIS,MAX(CRFEGE)
FROM LIBDEBITO.DRCONBEP a
--INNER join gxBDBps.gentiaf b ON LENEMI =  b.ENEMISO and lbinpr
inner join libdebito.tbctra0p on txctrx = lcodtr
INNER JOIN LIBDEBITO.TBCRET0P ON CODNRO = LCRETR
inner join gxopera.opentid1 on entcodi = lenemi and substr(entbin,1,6) = lbinpr 
inner join libdebito.tgembhaf on crtarj = lnrtar
inner join gxbdbps.comaeaf d on substr(digits(a.lidcom), 6, 7)=d.cocomer 
inner join gxbdbps.colocaf k on d.locodi = k.locodi   
INNER JOIN gxbdbps.CODTOAF X ON (k.CODDTO = X.CODDTO)
WHERE LFECTR BETWEEN  '20200312' AND '20200312'  AND enttipo = 'DEB' AND CODMAR = 'BEPS' AND LENEMI = '020' AND LIDCOM <> '100001'
GROUP BY a.lenemi,/* ENNOMBR, */LCODBC, entbina, LFECTR,lhortr, LCODTR, txdtrx, LIDCOM, LCOMTR, LIMPGS, LCRETR,
CODDES , LESTTR , lfcotr , lcautr , CRDOCU, lnrtar, LIDTRA, LODESC, codtodesc,LMonTR,LNFISC,LPOSEM ,LMCCTR ,LNFACT


********\\\\\REPORTE DE POS INGENICO\\\\*********************

SELECT  lfectr fechareal, LHORTR HORA,cocomer codigo_comer, codeno descr_comer, count(*) cant_trx, 
lenemi, lcodbc marca, lesttr estado, lcretr retorno, CODDES DESC_RETOR, LCODTR TIPO_TRX, TXDTRX  DESC_TRX,
LECA62 VERSION 
FROM LIBDEBITO.DRCONBEP 
inner join GXBDBPS.COMAEAF ON substr(digits(lidcom), 6, 7) = COCOMER
inner JOIN libdebito.tbctra0p b ON lcodtr = b.txctrx
INNER JOIN LIBDEBITO.TBCRET0P ON CODNRO = LCRETR
where lfectr between '20200522'  and  '20200522'
--and lcodtr in  ('000052', '000054', '567102','380000','390000','37000','304000','013000')
AND codmar = 'BEPS'
--and lidcom <> '0100001'
and substr(lidtra,1,1) = 'P' and leca62 LIKE  'INGTETRA%'
GROUP BY LFECTR,LHORTR, COCOMER, CODENO, LENEMI, LCODBC, LESTTR, LCRETR, CODDES, LCODTR, TXDTRX, LECA62

*******************\\CREDITO GOBIERNO- FECHA REAL\\*************** *************
select count(*) Cantidad ,lcretr Cod_Retorno,coddes Descripcion_COD ,LFECTR FECHA_REAL,lesttr Estado,lcodtr COD_TRX ,SUM(limpgs) importe,substr(lidtra,1,1) Origen
,TXDTRX DETALLES
from libdebito.drconbep
inner join LIBDEBITO.TBCTRA0P A on TXCTRX = lcodtr
right join libdebito.tbcret0p on lcretr = codnro
WHERE  SUBSTR(LFECTR,1,4)||'-'||SUBSTR(LFECTR,5,2)||'-'||SUBSTR(LFECTR,7,2) = DATE(CURDATE())
and lcodtr in ('000052','567102')
and limpgs>1
and lesttr in ('A','R','Q') and  codmar = 'BEPS' 
group by lcretr,coddes,lesttr,lcodtr,TXDTRX,LFECTR,substr(lidtra,1,1),DATE(CURDATE()) 
order by lcodtr,cantidad desc  



*******************\\CREDITO GOBIERNO- FECHA ANTERIOR\\*************** ********************

select count(*) Cantidad ,lcretr Cod_Retorno,coddes Descripcion_COD ,LFECTR FECHA_REAL, lesttr Estado,lcodtr COD_TRX ,SUM(limpgs) importe,substr(lidtra,1,1) Origen
,A.TXDTRX DETALLES
from libdebito.drconbep
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join libdebito.tbcret0p on lcretr = codnro
WHERE  SUBSTR(LFECTR,1,4)||'-'||SUBSTR(LFECTR,5,2)||'-'||SUBSTR(LFECTR,7,2) = DATE(CURDATE()- 1 days)
and lcodtr in ('000052','567102')
and limpgs>1
and lesttr in ('A','R','Q') and  codmar = 'BEPS' 
group by lcretr,coddes,lesttr,lcodtr,TXDTRX,LFECTR,substr(lidtra,1,1),DATE(CURDATE()- 1 days) 
order by lcodtr,cantidad desc


************************* REPORTE TRX VISA - BNF ***************************

select 'VISA BNF' AS TIPO,  sum(tdacant) as cantidad, sum(tdaimpo) as importe, 'EN ATM BNF' DESCRIP, 'RUTEO TRANSACCIONAL - SWITCH' A
from gxopera.tdavistas 
inner join LIBDEBITO.TBCTRA0P on Tdacotr = txctrx
inner join libdebito.tbcret0p on Tdacore = codnro
where tdaanho||tdames||tdadias between '20200222' and '20200321'
and tdatipo = 'T' and tdamark = 'VSA'
and tdabin not in (select pbin from LIBDEBITO.TBINPROC where ptipproc = 'PRO' and PMARCTAR = 'VSA') 
and codmar = 'BEPS' AND TDABIN  IN ('443077','443078') 
AND tdaadm = '002'
UNION
select 'VISA BNF' AS TIPO,  sum(tdacant) as cantidad, sum(tdaimpo) as importe, 'EN OTROS ATM'  DESCRIP, 'RUTEO TRANSACCIONAL - SWITCH' A
from gxopera.tdavistas 
inner join LIBDEBITO.TBCTRA0P on Tdacotr = txctrx
inner join libdebito.tbcret0p on Tdacore = codnro
where tdaanho||tdames||tdadias between '20200222' and '20200321'
and tdatipo = 'T' and tdamark = 'VSA'
and tdabin not in (select pbin from LIBDEBITO.TBINPROC where ptipproc = 'PRO' and PMARCTAR = 'VSA') 
and codmar = 'BEPS' AND TDABIN  IN ('443077','443078') 
AND tdaadm <> '002'
UNION
select 'VISA O/ENTIDADES' AS TIPO,  sum(tdacant) as cantidad, sum(tdaimpo) as importe, 'EN OTROS ATM' DESCRIP, 'RUTEO TRANSACCIONAL - SWITCH' A
from gxopera.tdavistas 
inner join LIBDEBITO.TBCTRA0P on Tdacotr = txctrx
inner join libdebito.tbcret0p on Tdacore = codnro
where tdaanho||tdames||tdadias between '20200222' and '20200321'
and tdatipo = 'T' and tdamark = 'VSA'
and tdabin not in (select pbin from LIBDEBITO.TBINPROC where ptipproc = 'PRO' and PMARCTAR = 'VSA')
and codmar = 'BEPS' AND TDABIN NOT IN ('443077','443078','425935','425936', '443076') AND tdaadm <> '002'
UNION
select 'VISA O/ENTIDADES' AS TIPO,  sum(tdacant) as cantidad, sum(tdaimpo) as importe, 'EN ATM BNF' DESCRIP, 'RUTEO TRANSACCIONAL - SWITCH' A
from gxopera.tdavistas 
inner join LIBDEBITO.TBCTRA0P on Tdacotr = txctrx
inner join libdebito.tbcret0p on Tdacore = codnro
where tdaanho||tdames||tdadias between '20200222' and '20200321'
and tdatipo = 'T' and tdamark = 'VSA'
and tdabin not in (select pbin from LIBDEBITO.TBINPROC where ptipproc = 'PRO' and PMARCTAR = 'VSA')
and codmar = 'BEPS' AND TDABIN NOT IN ('443077','443078','425935','425936', '443076') AND tdaadm = '002'
UNION
/*nuevo -  solo avances*/
select 'VISA O/ENTIDADES' AS TIPO,  sum(tdacant) as cantidad, sum(tdaimpo) as importe,  'EN ATM BNF' DESCRIP, 'COMISIONES' A
from gxopera.tdavistas
inner join LIBDEBITO.TBCTRA0P on Tdacotr = txctrx
inner join libdebito.tbcret0p on Tdacore = codnro
where tdaanho||tdames||tdadias between '20200222' and '20200321'
and tdacotr in ('011000', '012000','013000')
and tdacore = '00' AND TDAESTA = 'A'
and tdatipo = 'T' and tdamark = 'VSA'
and tdabin not in (select pbin from LIBDEBITO.TBINPROC where ptipproc = 'PRO' and PMARCTAR = 'VSA')
and codmar = 'BEPS' AND TDABIN NOT IN ('443077','443078','425935','425936', '443076') AND tdaadm = '002'
UNION
select 'VISA O/ENTIDADES' AS TIPO,  sum(tdacant) as cantidad, sum(tdaimpo) as importe,  'EN OTROS ATM' DESCRIP, 'COMISIONES' A
from gxopera.tdavistas
inner join LIBDEBITO.TBCTRA0P on Tdacotr = txctrx
inner join libdebito.tbcret0p on Tdacore = codnro
where tdaanho||tdames||tdadias between '20200222' and '20200321'
and tdacotr in ('011000', '012000','013000')
and tdacore = '00' AND TDAESTA = 'A'
and tdatipo = 'T' and tdamark = 'VSA'
and tdabin not in (select pbin from LIBDEBITO.TBINPROC where ptipproc = 'PRO' and PMARCTAR = 'VSA')
and codmar = 'BEPS' AND TDABIN NOT IN ('443077','443078','425935','425936', '443076') AND tdaadm <> '002'
union
select 'VISA BNF' AS TIPO,  sum(tdacant) as cantidad,sum(tdaimpo) as importe, 'EN OTROS ATM'  DESCRIP, 'COMISIONES' A
from gxopera.tdavistas 
inner join LIBDEBITO.TBCTRA0P on Tdacotr = txctrx
inner join libdebito.tbcret0p on Tdacore = codnro
where tdaanho||tdames||tdadias between  '20200222' and '20200321'
and tdatipo = 'T' and tdamark = 'VSA'
and tdacore = '00' AND TDAESTA = 'A'
and tdacotr in ('011000', '012000','013000')
and tdabin not in (select pbin from LIBDEBITO.TBINPROC where ptipproc = 'PRO' and PMARCTAR = 'VSA') 
and codmar = 'BEPS' AND TDABIN  IN ('443077','443078') 
AND tdaadm <> '002'


SELECT * from gxopera.tdavistas 
**********************REPORTE  CONTROL DE TRX POS INGENICO****************************************************

SELECT --SUM (TDACANT) 
* from gxopera.tdavistas 
--INNER join libdebito.drconbep on lidcom = tdacome 
--INNER JOIN LIBDEBITO.TBCRET0P ON CODNRO = TDACORE 
where  tdacome = '1001074' ANd tdaanho = '2020' and tdames BETWEEN '04' AND '04' AND TDADIAS BETWEEN '10' AND '10' 
--and tdacotr in ('000054','304000','901020','902020','013000','524000') 
--AND tdamark  = 'VSA' 
and tdacore <> '00'
--AND tdaimpo >= 0 --AND CODMAR = 'BEPS'
AND TDATIPO = 'P' and SUBSTR(leca62,1,1) = 'I'


select * from libdebito.drconbep 
--inner join libdebito.drconbep on lidcom = tdacome
  where 
  --LCODBC = 'VSA' AND 
  --leca62 = 'INGTETRA_1_0_00' AND 
  lidcom = '1001074' --
  AND LCRETR <> '00' --and lesttr in ('A','R','Q') 
and lfectr between '20200410' and '20200410' and lcodtr IN ('000054','304000','370000','380000','390000','901020','902020','013000','524000')


select  MARCA , SUM(aprova1)  APROBADAS, SUM(apro2)  IMPORTE1 , SUM(cont1) RECHAZADAS ,SUM(CONT2) IMPORTE
from(
Select tdamark, tdaenti,  SUM(TDACANT) as aprova1 , sum(tdaimpo) as apro2, 0 cont1, 0 CONT2, ( case when tdamark  = '*ND' THEN 'DINELCO'
             when tdamark  = 'AUD' THEN 'AUDITORIA'
             when tdamark  = ' '   THEN 'SIN TARJETA'
             when tdamark  = 'CAB' THEN 'CABAL'
             when tdamark  = 'CRE' THEN 'CREDICARD'
             when tdamark  = 'DIN' THEN 'DINELCO BNF'
             when tdamark  = 'MST' THEN 'MASTERCARD'
             when tdamark  = 'PAN' THEN 'PANAL'
             when tdamark  = 'PIN' THEN 'VENTA MINUTOS(PIN)'
             when tdamark  = 'UNI' THEN 'UNICA'
             when tdamark  = 'VSA' THEN 'VISA'
             --when tdamark  = 'VSA' and tdaenti <> '015' THEN 'VISA CREDITO'
             when tdamark  = '999' THEN 'NO DEFINIDO'
             when (tdamark  = 'DCR' and tdaenti  = '152') OR (tdamark  = 'DEB' and tdaenti  = '152') THEN 'TIGO COMPANION'
             when tdamark  = 'DCR' and tdaenti <> '152' THEN 'DINELCO CREDITO'
             when tdamark  = 'DEB' and tdaenti <> '152' THEN 'DINELCO DEBITO'
             WHEN  tdamark  IN ('TCO','TCI','TGI') THEN 'CICO'
             when tdamark  = 'BIL' and tdaenti = '581' THEN 'TIGO MONEY'
             when tdamark  = 'BIL' and tdaenti = '571' /*and tdacotr = '567101' */ THEN 'PERSONAL ENVIO'
             when tdamark  = 'BIL' and tdaenti = '571' /* --and tdacotr = '567102' */ THEN 'PERSONAL BILLETERA'
           END)MARCA
from gxopera.tdavistas
 --INNER JOIN GXBDBPS.COMAEAF ON TDACOME = COCOMER
left join libdebito.drconbep on lidcom = tdacome and lcodbc = tdamark and lcodtr = tdacotr and lbinpr = tdabin
INNER JOIN LIBDEBITO.TBCRET0P ON CODNRO = TDACORE
WHERE tdaanho||tdames||tdadias between  '20200410' and '20200410'
and tdamark not in ('AUD','*ND')
and tdacore = '00'
AND tdaimpo >= 0 AND TDACOME= '1001074'
AND TDATIPO = 'P'
and tdacotr in ('000054','304000','370000','380000','390000','901020','902020','013000','524000')
--and corucn not in ('80011012-9')
AND  SUBSTR(leca62,1,1) = 'I' AND CODMAR = 'BEPS'
and (select count(afcodi) from gxbdbps.coafmaf where  afcomer = TDACOME ) > 0 

Group by tdamark,tdaenti
union 
Select tdamark , tdaenti ,0 aprova1, 0 apro2, SUM(TDACANT) as cont1  , sum(tdaimpo) AS CONT2, ( case when tdamark  = '*ND' THEN 'DINELCO'
             when tdamark  = 'AUD' THEN 'AUDITORIA'
             when tdamark  = ' '   THEN 'SIN TARJETA'
             when tdamark  = 'CAB' THEN 'CABAL'
             when tdamark  = 'CRE' THEN 'CREDICARD'
             when tdamark  = 'DIN' THEN 'DINELCO BNF'
             when tdamark  = 'MST' THEN 'MASTERCARD'
             when tdamark  = 'PAN' THEN 'PANAL'
             when tdamark  = 'PIN' THEN 'VENTA MINUTOS(PIN)'
             when tdamark  = 'UNI' THEN 'UNICA'
               when tdamark  = 'VSA'  THEN 'VISA'
             --when tdamark  = 'VSA' and tdaenti <> '015' THEN 'VISA CREDITO'
             when tdamark  = '999' THEN 'NO DEFINIDO'
             when (tdamark  = 'DCR' and tdaenti  = '152') OR (tdamark  = 'DEB' and tdaenti  = '152') THEN 'TIGO COMPANION'
             when tdamark  = 'DCR' and tdaenti <> '152' THEN 'DINELCO CREDITO'
             when tdamark  = 'DEB' and tdaenti <> '152' THEN 'DINELCO DEBITO'
              WHEN  tdamark  IN ('TCO','TCI','TGI') THEN 'CICO'
             when tdamark  = 'BIL' and tdaenti = '581' THEN 'TIGO MONEY'
             when tdamark  = 'BIL' and tdaenti = '571' /* and tdacotr = '567101' */ THEN 'PERSONAL ENVIO' 
             when tdamark  = 'BIL' and tdaenti = '571' /* and tdacotr = '567102' */ THEN 'PERSONAL BILLETERA' 
                        END)MARCA
from gxopera.tdavistas 
--INNER JOIN GXBDBPS.COMAEAF ON TDACOME = COCOMER
left join libdebito.drconbep on lidcom = tdacome and lcodbc = tdamark and lcodtr = tdacotr and lbinpr = tdabin
INNER JOIN LIBDEBITO.TBCRET0P ON CODNRO = TDACORE
WHERE tdaanho||tdames||tdadias between  '20200410' and '20200410'
and tdamark not in ('AUD','*ND')
and tdacore <> '00'
AND TDATIPO = 'P'
AND tdaimpo >= 0 AND TDACOME= '1001074'
and tdacotr in ('000054','304000','370000','380000','390000','901020','902020','013000','524000')
--and corucn not in ('80011012-9')
and (select count(afcodi) from gxbdbps.coafmaf where  afcomer = TDACOME ) > 0  and SUBSTR(leca62,1,1) = 'I' AND CODMAR = 'BEPS'
Group by tdamark,tdaenti
)a
GROUP BY MARCA
order by MARCA

********************************** TRX PERSONAL *******************************+++

--dudosos
select  substr(lctade,5,15) Celular, lfectr FchTrx, lhortr HoraTrx, limpgs Importe, lerrnb Referencia, lidtra IdTrx, lcretr CodRes, lesttr Estado,lcotel
from libdebito.drconbep
 where SUBSTR(LFECTR,1,4)||'-'||SUBSTR(LFECTR,5,2)||'-'||SUBSTR(LFECTR,7,2) = DATE(CURDATE())
and lcodtr in ( '567101','567102')
and substr(lidtra,1,1) = 'P' and lcretr = '00' and lesttr = 'D'  --and lhortr between 000000 and 090000   
GROUP BY substr(lctade,5,15), lfectr, lhortr , limpgs , lerrnb , lidtra , lcretr , lesttr ,lcotel
UNION 
select substr(lctade,5,15) Celular, lfectr FchTrx, lhortr HoraTrx, limpgs Importe, lerrnb Referencia, lidtra IdTrx, lcretr CodRes, lesttr Estado,lcotel
from libdebito.drconbep 
where SUBSTR(LFECTR,1,4)||'-'||SUBSTR(LFECTR,5,2)||'-'||SUBSTR(LFECTR,7,2) = DATE(CURDATE())
and lcodtr in ( '567101','567102')
and substr(lidtra,1,1) = 'P' and lcretr IN ('92','88','55') --and lhortr between 000000 and 090000  
GROUP BY substr(lctade,5,15), lfectr, lhortr , limpgs , lerrnb , lidtra , lcretr , lesttr ,lcotel--,DATE(CURDATE())
ORDER BY lhortr DESC

*******************************ADQUIRIENCIA MASTERCARD - BEPSA - (POR ENTIDAD)***************************************************************

SELECT lidcom COD_COMERCIO,lhortr, LCOMTR DENOMINACION, LODESC LOCALIDAD, codtodesc Departamento,LCODBC MARCA,lbinpr BIN,a.LENEMI ENTIDAD,
( case when lenemi  = '530' THEN 'MASTERCARD INTERNACIONAL '  when lenemi  = '560' THEN 'MASTERCARD LOCAL BANCARD'  when lenemi  = '570' THEN 'MASTERCARD LOCAL PROCARD'  when lenemi  = '580' THEN 'MASTERCARD LOCAL BEPSA' when lenemi  = '590' THEN 'MASTERCARD LOCAL OTROS'  end)Descrip_Entidad,
LIMPGS IMPORTE,LCODTR CODTRX, txdtrx descripcion,LCRETR RETORNO, CODDES DESCRIPCIONRET,SUBSTR(LIDTRA,1,1) DISPO,LFECTR FECHA_REAL
FROM LIBDEBITO.DRCONBEP a
--INNER join gxBDBps.gentiaf b ON a.LENEMI =  b.ENEMISO 
inner join libdebito.tbctra0p on txctrx = lcodtr
INNER JOIN LIBDEBITO.TBCRET0P ON CODNRO = LCRETR
---INNER join gxopera.opentid1 on entcodi = lenemi and substr(entbin,1,6) = lbinpr 
--inner join libdebito.tgembhaf on crtarj = lnrtar
inner join gxbdbps.comaeaf d on substr(digits(a.lidcom), 6, 7)=d.cocomer 
inner join gxbdbps.colocaf k on d.locodi = k.locodi   
INNER JOIN gxbdbps.CODTOAF X ON (k.CODDTO = X.CODDTO)
WHERE LFECTR BETWEEN  '20200523' AND '20200523'  and substr(lidtra,1,1) = 'T' 
--AND LCODBC= 'MST' 
AND CODMAR = 'BEPS' 
AND LBINPR IN ('502026','601637','601638','601639','606257','606372','535902')
--AND LENEMI IN ('530','560','570','580','590') 
AND LIDCOM <> '100001'
GROUP BY  lidcom , LCOMTR , LODESC , codtodesc ,LCODBC ,lbinpr ,/*CANTIDAD*/a.LENEMI ,LIMPGS ,
LCODTR , txdtrx ,LCRETR , CODDES ,SUBSTR(LIDTRA,1,1) ,LFECTR ,lhortr



SELECT COUNT (*) FROM LIBDEBITO.DRCONBEP 
WHERE LFECTR BETWEEN  '20200424' AND '20200425'  AND LCODBC= 'MST'  AND LENEMI IN ('530','560','570','580','590') AND LIDCOM <> '100001'
3002



























SELECT  'COMPRA EN POS' SERVICIO/*,tdacore respuesta*/,leca62, sum(APRO) AS Aprobada, SUM(RECHA) AS RECHAZADA
 FROM (SELECT  'COMPRA EN POS' SERVICIO/*,tdacore respuesta*/,leca62, sum(TDACANT) AS APRO, 0 RECHA
from gxopera.tdavistas
INNER JOIN libdebito.tbcret0p ON CODNRO = TDACORE
INNER join libdebito.drconbep on lidcom = tdacome
where tdaanho = '2020' and tdames BETWEEN '04' AND '04' AND TDADIAS BETWEEN '01' AND '10' AND tdacore= '00' and leca62 = 'INGTETRA_1_0_00'
and tdacotr in ('000054') AND CODMAR = 'BEPS' 
AND TDATIPO='P' AND TDAESTA= 'A' and tdacome = '1001074' --AND TDACOME not in ('0100001','0100002')
group by  leca62
union
SELECT  'COMPRA EN POS' SERVICIO/*,tdacore respuesta*/, leca62, 0 APRO, SUM(TDACANT) AS RECHA
from gxopera.tdavistas
INNER JOIN libdebito.tbcret0p ON CODNRO = TDACORE
INNER join libdebito.drconbep on lidcom = tdacome 
where tdaanho = '2020' and tdames BETWEEN '04' AND '04' AND TDADIAS BETWEEN '01' AND '10' AND tdacore <> '00' AND leca62 = 'INGTETRA_1_0_00'
and tdacotr in ('000054') AND CODMAR = 'BEPS' 
AND TDATIPO='P' AND --TDAESTA = 'Q' and --
tdacome = '1001074'-- AND TDACOME not in ('0100001','0100002')
group  by leca62
)
group  by  leca62

ORDER BY tdacore

11375


/**/
SELECT  'TIGO COMPANION' ,tdacore respuesta, TDAESTA ESTADO,CODDES DESCRIPCION,sum(tdacant) cantidad, sum(tdaimpo) importe, TDATIPO 
from gxopera.tdavistas
INNER JOIN libdebito.tbcret0p ON CODNRO = TDACORE
where tdaanho = '{?ANHO}' and tdames  BETWEEN '{?MESD}' AND '{?MESH}'   AND TDADIAS BETWEEN '{?DIAD}' AND '{?DIAH}'
and tdacotr in ('000054', '015000') AND CODMAR = 'BEPS' AND TDAMARK = 'DEB' AND TDAENTI = '152'
group by tdacore, CODDES, TDATIPO , TDAESTA 
UNION
SELECT 'CICO' ,tdacore respuesta, TDAESTA ESTADO,CODDES DESCRIPCION,sum(tdacant) cantidad, sum(tdaimpo) importe, TDATIPO 
from gxopera.tdavistas
INNER JOIN libdebito.tbcret0p ON CODNRO = TDACORE
where tdaanho = '{?ANHO}' and tdames  BETWEEN '{?MESD}' AND '{?MESH}'  AND TDADIAS BETWEEN '{?DIAD}' AND '{?DIAH}'
and tdacotr in ('370000', '380000', '390000') AND CODMAR = 'BEPS' --AND TDAMARK = 'DEB' AND TDAENTI = '152'
group by tdacore, CODDES, TDATIPO , TDAESTA 
UNION
/*VENTA MINUTOS -A TM*/
SELECT 'VENTA MIN' ,tdacore respuesta, TDAESTA ESTADO,CODDES DESCRIPCION,sum(tdacant) cantidad, sum(tdaimpo) importe, TDATIPO 
from gxopera.tdavistas
INNER JOIN libdebito.tbcret0p ON CODNRO = TDACORE
where tdaanho = '2018' and tdames  BETWEEN '{?MESD}' AND '{?MESH}'   AND TDATIPO = 'T'
and tdacotr in ('901020') AND CODMAR = 'BEPS'
group by tdacore, CODDES, TDATIPO , TDAESTA 
UNION
SELECT 'PAGOFAC' ,tdacore respuesta,TDAESTA ESTADO, CODDES DESCRIPCION,sum(tdacant) cantidad, sum(tdaimpo) importe, TDATIPO 
from gxopera.tdavistas
INNER JOIN libdebito.tbcret0p ON CODNRO = TDACORE
where tdaanho = '2018' and tdames  BETWEEN '{?MESD}' AND '{?MESH}'  AND TDATIPO = 'T'
and tdacotr in ('902020') AND CODMAR = 'BEPS'
group by tdacore, CODDES, TDATIPO , TDAESTA  



SELECT * FROM  LIBDEBITO.DRCONBEP where lfectr between '20200401'  and  '20200401' and substr(lidtra,1,1) = 'P'

Marca: Todas
- Cod. Retorno: Todos
- Dispositivo: POS INGENICO
- Servicio: Compras (000052, 000054, 567102) Agregar CICO - Red de Pagos - Consulta de saldo - Dinelco Efectivo.
- Ordenado por: Codigo de 

No se incluye: Comercios, y trx de prueba"




/399/
select * from  gxopera.opmovi  WHERE OPFEREA BETWEEN '20200301' AND '20200301' AND OPTARJ = '7030020094889611' 
SELECT * FROM  LIBDEBITO.DRCONBEP WHERE LFECTR BETWEEN  '20200310' AND '20200312'  /*AND enttipo = 'DEB' AND CODMAR = 'BEPS' */ AND LENEMI = '020'
select * from LIBDEBITO.BST015
select * from gxopera.opliqui 
select * from  gxbdbps.tmctaaf
select * from gxbdbps.tlogsaf
select * from gxopera.flicom WHERE LIFECHD BETWEEN '20200201' AND '20200229' and linrofin = '10020055800' and linro= '10020055800' and licomer = '0200162'
-- ------------------------------------------------------------------------------------------------------------------
select * from  gxopera.opmovi where  opcodtrn in ('014000','000054','520000','514000') and opfecom between '20191001' and '20191001'

SELECT count(*),cocomer,codeno FROM gxbdbps.comaeaf 
inner join LIBDEBITO.DRCONBEP on lidcom = cocomer
 WHERE  substr(cocomer,1,2)  not IN ('45', '79', '80', '81', '86', '90') and LFECTR BETWEEN '20200201' AND '20200229'
 order by cocomer

SELECT * FROM LIBDEBITO.DRCONBEP WHERE  LFECTR between '20191001' and '20191030' and  LBINPR= '542927' AND LFECTR > '20190701
/*where lifecredi between '20191031' and '20191101' and licomer = '0301556'*/
select * from libdebito.tbctra0p

