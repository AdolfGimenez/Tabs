************************************
/*Tabla de Imputaciones Manuales*/
select * from gxbdbps/TMO1MAF  
************************************

*********************************************************************************
/*PARETO*/
Select  c.cocomer A , corucn ruc, RUDESC B, COSTAT C, codeno D,  addescre E, addesdeb F, sum(afmonto) G, zonadesc H, lodesc I, count(afcodi) J, coteln, codire1,
(SELECT SUM(TDACANT) FROM GXOPERA.TDAVISTAS WHERE TDACOME = c.cocomer AND TDAMES = '{?MES}'   AND TDAANHO = '{?ANHO}' AND TDACORE = '00' AND TDATIPO IN ( 'P', 'G') ) K,
(SELECT SUM(TDAIMPO) FROM GXOPERA.TDAVISTAS WHERE TDACOME = c.cocomer AND TDAMES = '{?MES}'  AND TDAANHO =   '{?ANHO}' AND TDACORE = '00' AND TDATIPO IN ( 'P', 'G') ) L,
(SELECT SUM(TDACANT) FROM GXOPERA.TDAVISTAS WHERE TDACOME = c.cocomer AND TDAMES = '{?MES}'   AND TDAANHO =  '{?ANHO}'  AND TDACORE = '00' AND TDATIPO IN ( 'P', 'G') and tdacotr in ('370000','380000', '390000')) CICO,
(SELECT SUM(TDAIMPO) FROM GXOPERA.TDAVISTAS WHERE TDACOME = c.cocomer AND TDAMES = '{?MES}'  AND TDAANHO =   '{?ANHO}'  AND TDACORE = '00' AND TDATIPO IN ( 'P', 'G') and tdacotr in ('370000','380000', '390000')) ICICO
from gxbdbps.comaeaf c left join gxbdbps.coafmaf on  c.cocomer = afcomer
inner join gxbdbps.corubaf on (rucodi = substr(c.cocomer,1,2))
inner join gxbdbps.cozonaf d on c.zonacodi = d.zonacodi
inner join gxbdbps.colocaf e on c.locodi = e.locodi
where substr(c.cocomer,1,2) not in ('45','79','85') and costat in ('00','3') and  cofecalt <= '{?FECHALTA}'   and substr(c.cocomer,1,2) < '90'
and c.cocomer not in ('0100001', '0100002', '6900097', '5400653', '5400655')
group by rudesc , corucn, c.cocomer, COSTAT, addescre, addesdeb, CODENO, zonadesc, lodesc, coteln, codire1
union
Select  c.cocomer A , corucn ruc, RUDESC B, COSTAT C, codeno D,  addescre E, addesdeb F, sum(afmonto) G, zonadesc H, lodesc I, count(afcodi) J,  coteln, codire1,
(SELECT SUM(TDACANT) FROM GXOPERA.TDAVISTAS WHERE TDACOME = c.cocomer AND TDAMES = '{?MES}'   AND TDAANHO = '{?ANHO}' AND TDACORE = '00' AND TDATIPO IN ( 'P', 'G') ) K,
(SELECT SUM(TDAIMPO) FROM GXOPERA.TDAVISTAS WHERE TDACOME = c.cocomer AND TDAMES = '{?MES}'  AND TDAANHO =   '{?ANHO}' AND TDACORE = '00' AND TDATIPO IN ( 'P', 'G') ) L,
(SELECT SUM(TDACANT) FROM GXOPERA.TDAVISTAS WHERE TDACOME = c.cocomer AND TDAMES = '{?MES}'   AND TDAANHO =  '{?ANHO}'  AND TDACORE = '00' AND TDATIPO IN ( 'P', 'G') and tdacotr in ('370000','380000', '390000')) CICO,
(SELECT SUM(TDAIMPO) FROM GXOPERA.TDAVISTAS WHERE TDACOME = c.cocomer AND TDAMES = '{?MES}'  AND TDAANHO =   '{?ANHO}'  AND TDACORE = '00' AND TDATIPO IN ( 'P', 'G') and tdacotr in ('370000','380000', '390000')) ICICO
from gxbdbps.comaeaf c left join gxbdbps.coafmaf on ( c.cocomer = afcomer)
left join gxbdbps.coma1af a on  c.cocomer = a.cocomer
inner join gxbdbps.corubaf on (rucodi = substr(c.cocomer,1,2))
inner join gxbdbps.cozonaf d on c.zonacodi = d.zonacodi
inner join gxbdbps.colocaf e on c.locodi = e.locodi
where substr(c.cocomer,1,2) not in ('45','79','85') and costat in ('00') and  cofecalt <= '{?FECHALTA}' and substr(c.cocomer,1,2) < '90'
and c.cocomer not in ('0100001', '0100002', '6900097', '5400653', '5400655')
and prcodi = '995' /*bivalencia */
and afcomer is null    -- no tiene pos 
group by rudesc , corucn, c.cocomer, COSTAT, addescre, addesdeb, CODENO, zonadesc, lodesc, coteln, codire1
UNION
Select  c.cocomer A ,  corucn ruc, RUDESC B, COSTAT C, codeno D,  addescre E, addesdeb F, sum(afmonto) G, zonadesc H, lodesc I, count(afcodi) J,  coteln, codire1,
(SELECT SUM(TDACANT) FROM GXOPERA.TDAVISTAS WHERE TDACOME = c.cocomer AND TDAMES = '{?MES}'   AND TDAANHO =   '{?ANHO}' AND TDACORE = '00' AND TDATIPO IN ( 'P', 'G') ) K,
 (SELECT SUM(TDAIMPO) FROM GXOPERA.TDAVISTAS WHERE TDACOME = c.cocomer AND TDAMES = '{?MES}'  AND TDAANHO =  '{?ANHO}' AND TDACORE = '00' AND TDATIPO IN ( 'P', 'G') ) L,
(SELECT SUM(TDACANT) FROM GXOPERA.TDAVISTAS WHERE TDACOME = c.cocomer AND TDAMES = '{?MES}'   AND TDAANHO =  '{?ANHO}' AND TDACORE = '00' AND TDATIPO IN ( 'P', 'G') and tdacotr in ('370000','380000', '390000')) CICO,
(SELECT SUM(TDAIMPO) FROM GXOPERA.TDAVISTAS WHERE TDACOME = c.cocomer AND TDAMES =  '{?MES}'   AND TDAANHO =   '{?ANHO}'  AND TDACORE = '00' AND TDATIPO IN ( 'P', 'G') and tdacotr in ('370000','380000', '390000')) ICICO,
inner join gxbdbps.corubaf on (rucodi = substr(c.cocomer,1,2))
inner join gxbdbps.cozonaf d on c.zonacodi = d.zonacodi
inner join gxbdbps.colocaf e on c.locodi = e.locodi
where substr(c.cocomer,1,2) not in ('45','79','85') and costat in ('00') and  cofecalt <= '{?FECHALTA}' and substr(c.cocomer,1,2) < '90'
and c.cocomer not in ('0100001', '0100002', '6900097', '5400653', '5400655')
and c.cocomer not in (select a.cocomer from gxbdbps.coma1af a where prcodi = '995' )
and afcomer is null    -- no tiene pos 
group by rudesc , corucn, c.cocomer, COSTAT , addescre, addesdeb, CODENO, zonadesc, lodesc, coteln, codire1
*********************************************************************************
select * from  gxopera.factura where  FACTNRO = '10030033886' and  facstatus = 'P'
--UPDATE gxopera.factura SET facsaldo = '16975065.00' where  FACTNRO = '10030033886' and  facstatus = 'P'
*********************************************************************************
**VERIFICACION DE FACTURAS**
*********************************************************************************
select *--facstatus estado, a.factipo tipo, a.factnro numerofact, a.factimbr timbrado, fartdesc, factotal 
from gxopera.factura a 
inner join  GXOPERA.FACTURA1 b on a.factipo = b.factipo and a.factnro= b.factnro and a.factimbr = b.factimbr
 WHERE a.FACTNRO = '10030033886'
*********************************************************************************



SELECT* FROM GXBDBPS.COMAEAF  WHERE COCOMER = '8002014'

SELECT * FROM GXOPERA.TDAVISTAS WHERE TDACOME IN ('8002014' , '8002044', '6000086')

SELECT lnrtar tarjeta, lfectr fecha, lhortr hora, lesttr estado, lcretr retorno, lcodtr trx, limpgs monto 
FROM LIBDEBITO.DRCONBEP WHERE lnrtar = '6274311010035431' and lfectr = '20181010'

select *from libdebito.tbcret0p

select * from gxopera.opmovi where opnoref = '827785290061' opcodtrn = 380000 and opferea = '20181008'


select afcodi, afcomer codigo, afstat estado, codeno from gxbdbps.coafmaf
inner join gxbdbps.comaeaf on cocomer = afcomer 
where afstat IN ('60', '0') AND CODENO LIKE '%DEPOSITO%'




select aftidesc modelo, count(afcodi) cantidad from gxbdbps.coafmaf a
inner join gxbdbps.coaftaf b on a.afticodi = b.afticodi
group by aftidesc


select * FROM  GXBDBPS.GENTIAF

/*pedido de yolanda - ccomercios con cuentas blindadas*/
select cocomer codigo, codeno denominacion, corazo razonsocial, coteln telefono, corucn ruc, codire1 direccion, 'SI' AS BLINDADO, 'ACTIVO' AS ESTADO,
A.ENEMISO ENTIDAD, ENNOMBR NOMBREENTIDAD
from gxbdbps.comaeaf A
INNER JOIN GXBDBPS.GENTIAF B ON A.ENEMISO = B.ENEMISO
where cofaxn = '1' 




















Select * from gxopera.opmovi where opferea = '20181003' and opcodtrn in ('370000', '380000', '390000')



/*pareto*/


select TDACOME as Cajero, codeno as Nombre, entdesc as Entidad, concat('T',substr(tdacome,5,3)) as ATM, sum(tdacant) as Cantidad, sum(tdaimpo) as Importe
 from gxopera.tdavistas
 INNER JOIN GXBDBPS.COMAEAF
ON COCOMER = tdacome
INNER JOIN gxopera.opentid
ON tdaadm = reenti
where tdaanho between '2018' and '2018'
and tdames between 09 and 09
and tdadias between 01 and 20
and tdaadm = '085'
and tdaesta = 'A'
and tdacore = '00'
and tdacome like '90%'
and tdacome not in ('9099777','9099888')
group by tdacome, codeno,entdesc
order by Importe desc


/*ORIGINAL - CLIENTES CON CUENTA BCO*/
SELECT cocomer, corazo razonsoc, coentdeb entidebito, b.ennombr descrip, coctadeb nrocuentadeb, coalqpos cobroprocard, cotarje, adnumcta nrocta, tipacodi tipopago, a.enemiso, b.enemiso, ADTICTA TIPOCUENTA
FROM GXBDBPS.COMAeaf a
inner join  gxbdbps.gentiaf b on coentdeb = b.enemiso
where  cotarje = '{?ent}' --DEBITO EN CUENTA: 1- SI
AND  COSTAT = '0'
AND coentdeb = '{?ENTI}'
 

/*MODIFICACION DE NAALIA RAMOS */

SELECT cocomer, corazo razonsoc, corucn ruc, comadre cuentam, COUNT(FACSTATUS) CANTIDAD, SUM(FACTOTAL) TOTALFACT, RPRENAME, coentdeb entidebito, b.ennombr descrip, coctadeb nrocuentadeb, 
coalqpos cobroprocard, cotarje, adnumcta nrocta, tipacodi tipopago, a.enemiso, b.enemiso, ADTICTA TIPOCUENTA
FROM GXBDBPS.COMAeaf a
inner join  gxbdbps.gentiaf b on coentdeb = b.enemiso
left  join gxbdbps.cobcom
 ON (COCOMER = COBCOM)
left JOIN gxbdbps.corpraf
 ON ( RPRECODI=COBCOD)
 INNER JOIN gxopera.factura ON COCOMER = FACLIEN
where  cotarje = '1' --DEBITO EN CUENTA: 1- SI
AND  COSTAT = '0'
AND coentdeb = '001'
AND facstatus = 'P'
AND FACTACBLE = '101031000000015'
AND COCOMER = '0100154'
GROUP BY COCOMER, CORAZO, CORUCN, COMADRE, RPRENAME, COENTDEB,b.ennombr, coctadeb, coalqpos, cotarje, adnumcta, tipacodi, a.enemiso, B.enemiso, ADTICTA
order by cocomer asc
 
select * from gxopera.factura where faclien = '0100154' and facstatus = 'P'





/*---Rechazos Otros Bancos*/
select opcodbco, opncomer Comercio, codeno denominacion,  opmensob Mensaje , count(*) cantidad, SUM(opimpor ) ImporteAcred
from gxopera.opliqui inner join gxbdbps.comaeaf on opncomer = cocomer
 where opfecliq >= '20180508' and opcodbco in (57) 
and opstatob not in ('00','88','77') and opidliq > 18050800019393 and substr(opcampoa,1,6) = '703002' 
group by opcodbco, opncomer, codeno, opmensob
order by opcodbco


select *-- opcodbco, opncomer Comercio, codeno denominacion,  opmensob Mensaje , count(*) cantidad, SUM(opimpor ) ImporteAcred
from gxopera.opliqui inner join gxbdbps.comaeaf on opncomer = cocomer
where opfecliq >= '20180801' and opcodbco in (57) and opnroref = '824182000435'
group by opcodbco, opncomer, codeno, opmensob 








/*PARA JOAQUIN DE FABIO LARA*/
select SUBSTR(mtnumta,1,6)||'XXXXXX'||SUBSTR(mtnumta,13,4) tarjeta, mtnumta,mcnumct cuenta, cenumdo ci,mtcods2 ,sucodig  from gxbdbps.Tmtaraf
--select * from gxbdbps.Tmtaraf
where enemiso = '307' and mcnumct='307030004054'

select * from gxbdbps.thmovaf where hmnumta='6274313070012821'

select * from gxbdbps.coafmaf where afcodi = '02143619'

/*MIGUEL - BAJA DE POS*/
select AFCOMER CODIGO, aftidesc, afcodi activofijo, afstat, (case when afstat = '00' then 'ACTIVO' WHEN
 AFSTAT = '50' THEN  'MANTENIMIENTO' WHEN AFSTAT = '60' THEN 'DEPOSITO' ELSE 'BAJA' END) estado
from gxbdbps.coafmaf a
inner join gxbdbps.coaftaf b on a.afticodi = b.afticodi 
where afcomer IN ( '9500006', '9500002', '9500009', '9500008')



select afcodi, afcomer codigo, afstat estado, codeno from gxbdbps.coafmaf
inner join gxbdbps.comaeaf on cocomer = afcomer 
where afstat IN ('60', '0') AND CODENO LIKE '%DEPOSITO%'




-- REPORTES DE TRANSA DE RECLAMOS BNF.
select *--RFENTI as entidad ,  concat(concat(concat(substr(RFECTR , 7 , 2 ) ,'/') ,concat(substr(RFECTR , 5 , 2 ),'/' )),(substr(RFECTR , 1 , 4 ) )) as fecha1 , RNRTAR as Num_Tar,  RCTAOR, RIDCOM ,  RMONTR,  RIMPGS as importe,  RIDTRA as Atm_Trx,  RESTTR,  REFLAG,   RCOME1 as Cod_resp,   concat(concat(concat(substr(RFEREC , 7 , 2 ) ,'/') ,concat(substr(RFEREC , 5 , 2 ),'/' )),(substr(RFEREC , 1 , 4 ) ))as fecha2 , RIDREC as Usuario_recla,  concat(concat(concat(substr(RFEPRO , 7 , 2 ) ,'/') ,concat(substr(RFEPRO , 5 , 2 ),'/' )),(substr(RFEPRO , 1 , 4 ) ))as fecha3,  RIDPRO as Usuario_Proce,   RERRNB
from LIBDEBITO.OPEMAEHST
where    RFECTR between  {?Fechd} and {?Fechh}



SELECT 

SELECT * FROM LIBDEBITO.TBCTRA0P WHERE TXDTRX LIKE '%CABAL%' OR TXDTRX LIKE '%PANAL%'





/*OTROS SERVICIOS*/
SELECT -- BIN, MARCA,  'OTRO SERVICIO' TIPO, 
SUM(CANTIDAD) CANTIDAD, SUM(IMPORTE) IMPORTE
FROM LIBDEBITO.FACTENTI 
where fecha between  '20180919' and  '20181019'  and substr(codtra,1,2)  <> '31' and lenemi = '510'
AND DISPOSIT = 'T' and codres not in ('00', '03')
 AND BIN NOT IN ('425935', '425936', '443076')
group by BIN, MARCA

---Rechazos Otros Bancos
select opidliq ID, opnroref Referencia,opcodbco, opncomer Comercio, codeno denominacion, opfecliq FchLiq, (case when optctacr = 'K' then 'Cta_Cte.' else 'Caj_Ahorro' end ),opnrctcr CtaCredito,opcampoB IdTrx, opimporb ImporteTrx, opimpor ImporteAcred,opstatob CodResp, opmensob Mensaje from gxopera.opliqui inner join gxbdbps.comaeaf on opncomer = cocomer
 where opfecliq >= '20180508' and opcodbco in (57) 
and opstatob not in ('00','88','77') and opidliq > 18050800019393 and substr(opcampoa,1,6) = '703002' 
order by opcodbco




select   AFCOMER CODIGO, AFCODI CODACTIVOFIJO,CODENO DENOMINACION, codire1 direccion, LODESC LOCALIDAD,coteln telefono, AFAPPVER version, x.aftidesc descrip
from gxbdbps.COAFMAF d  INNER JOIN GXBDBPS.COMAEAF A ON AFCOMER = A.COCOMER
inner join gxbdbps.COAFTAF x on  d.afticodi = x.afticodi
inner join gxbdbps.colocaf c on a.locodi = c.locodi
WHERE  AFCOMER NOT IN ( '0100001', '9500009', '9500006', '9500005', '9500002') and costat = '00' and afstat = '00'

/*PEDIDO DE EDGAR CABALLERO*/
select   AFCOMER CODIGO, AFCODI CODACTIVOFIJO,CODENO DENOMINACION, codire1 direccion, LODESC LOCALIDAD,coteln telefono, AFAPPVER version, x.aftidesc descrip,w.zonadesc ZONA
from gxbdbps.COAFMAF d  INNER JOIN GXBDBPS.COMAEAF A ON AFCOMER = A.COCOMER
inner join gxbdbps.COAFTAF x on  d.afticodi = x.afticodi
inner join gxbdbps.colocaf c on a.locodi = c.locodi
inner join gxbdbps.cozonaf w on a.zonacodi=w.zonacodi
WHERE  AFCOMER NOT IN ( '0100001', '9500009', '9500006', '9500005', '9500002') and costat = '00' and afstat = '00'

select * from gxbdbps.cozonaf
select * from gxbdbps.comaeaf where codeno LIKE '%GOD%'

/* TRANSACCIONES CICO COMERCIO BIGGIE*/

/*INSTRUCTIVOS POR RANGO BANCO REGIONAL */
select * from gxopera.trxinst where insfecarga='20181206' and insemiso='059'
select * from gxopera.flicom a where a.lifechd='20181206' and a.licodban='BR' and a.liuser='U99BRENDA'
delete from gxopera.flicom a where a.lifechd='20181206' and a.licodban='BR' and a.liuser='U99BRENDA'
select * from gxopera.flicom1 where lifechd='20181206' and linroins='12813'
--delete from gxopera.flicom1 where lifechd='20181206' and linroins='12813'
select sum(insfactot) from gxopera.trxinst where insfecarga='20181206' and insemiso='059'
--delete from gxopera.trxinst where insfecarga='20181206' and insemiso='059'
select * from gxopera.opentid
select sum(a.remonto),a.reenti,b.ENTDESC 
from gxopera.oprecle a inner join gxopera.opentid b on a.reenti=b.reenti where refech='20181227' and retartip='DEB'
group by a.reenti,b.ENTDESC

select * from gxopera.oprecle where refech='20181227'

/*VERIFICACION DE DATOS DE TARJETA BANCO CONTINENTAL */
--TABLA DE AUDITORIA
SELECT * FROM gxbdbps.atdemis WHERE AECTA ='126356196' 
/*VERIFICACION DE DATOS DE TARJETA BANCO CONTINENTAL */

*******************************************************************************************************************
*******************************************************************************************************************
--Extracciones ATM por marca
select sum(cantidad) from libdebito.factenti a
left join LIBDEBITO.TBINPROC b on bin=pbin
where lenemi='510' and disposit='T' and substr(CODTRA,1,2) <> '31'-- and CODRES = '00' 
and BIN <> '425935' and BIN <> '425936' and BIN <> '443076' and estado='A' and ptipproc='PRO' and marca='CRE' 
 
SELECT LCODBC , COUNT(*) CANTIDAD
FROM LIBDEBITO.DRCONBEP WHERE LFECTR BETWEEN '20181219' AND '20190119'
AND lenemi='510' and SUBSTR(LIDTRA,1,1)='T' AND  LCRETR <> '03' 
and substr(LCODTR,1,2) ='31'
and LbinPR <> '425935' and LbinPR <> '425936'  and LbinPR <> '443076' 
GROUP BY LCODBC 
 
OTROS SERVICIOS

SELECT SUM(CANTIDAD) 
from libdebito.factenti where  LENEMI = '510'
and DISPOSIT = 'T'
and  SUBSTR(CODTRA,1,2) <> '31' 
and BIN <> '425935' and BIN <> '425936' and BIN <> '443076'
and CODRES <> '00' and CODRES <> '03' 
GROUP BY MARCA 
*******************************************************************************************************************
*******************************************************************************************************************
/*CONSULTA DE RETENCIONES POR PERIODO*/
SELECT  LICOMER CODIGOCOMER,CORAZO RAZON_SOCIAL, LINROFAC NROFACTURA, SUM(LIMONTO) IMPORTE , SUM(LIRENTA) RETENCION_RENTA , SUM(LIREIVA) IVA_RENTA
FROM GXopera.FLICOM1 
INNER JOIN GXBDBPS.COMAEAF ON (LICOMER = COCOMER)
WHERE SUBSTR(LIFECREDI,1,6)= '201903'  AND litiptar = 'CRE'
AND (LIRENTA > 0 or lireiva > 0)
GROUP BY LINROFAC,LICOMER,CORAZO

select * from gxopera.retcom where retfecha='2019-03-31'


select * from 

|

select * from gxbdbps.tmtaraf where mttipot='3' and mtstats='1' and enemiso='307' 



select costat,cocomer,codeno from gxbdbps.comaeaf where cocomer in (
'1000415',
'1000417',
'1000839',
'1001234',
'1001237',
'1001598',
'1001598',
'1001598',
'1001598',
'1001598',
'1001642',
'1001692',
'1001692',
'1001742',
'1000972',
'1001014',
'1001170',
'1001598')

select *
from libdebito.bst015 a 
inner join on gxbdbps.comaeaf b on a.cocomer=(ltrim(b.bscodcom))
where ltrim(a.bs15codcom) in (
'1000415',
'1000417',
'1000839',
'1001234',
'1001237',
'1001598',
'1001642',
'1001692',
'1001742',
'1000972',
'1001014',
'1001170')
group by bs15codpro,bs15codcom,a.codeno,bs15estado,bs15usuupd,bs15fhoupd 

/**/
select lfectr,lhortr,lidcom,lcomtr,limpgs,lcretr,lesttr,lenemi
from libdebito.drconbep where lidcom='0800118' and lfectr> '20181025' and '20181028'
select * from gxopera.flicom1 where licomer='6000239' and lifecredi='20181029'
select *
from gxopera.opmovi where opcomer='6000239' and opfecom='20181026'
group by openemi
select * from contabilid.tatgene where tgenti='059'
select * from gxbdbps.comaeaf where cocomer='6000239'corazo like '%PUERTO ALTO%'
select lfectr,lfcotr,lhortr,lidcom,lcomtr,limpgs,lcretr,lesttr,lenemi
from libdebito.drconbep where lCOMTR LIKE 'BR%'  and lfcotr= '20181026' and '20181028'


El rincon de las papaps.
select lfectr,lfcotr,lhortr,lidcom,lcomtr,limpgs,lcretr,lesttr,lenemi
from libdebito.drconbep where lidcom='0300998' and lfectr> '20181025' 
select * from gxopera.flicom where licomer='0200283' and lifechd='20181029'
select * from gxopera.flicom1 where licomer='0200283' and lifecredi='20181030'
select sum(opmonto-opcomi),openemi 
from gxopera.opmovi where opcomer='0200283' and opfecom='20181030'
group by openemi
select * from contabilid.tatgene where tgenti='059'
select * from gxbdbps.comaeaf where cocomer='6000239'corazo like '%PUERTO ALTO%'
select lfectr,lfcotr,lhortr,lidcom,lcomtr,limpgs,lcretr,lesttr,lenemi
from libdebito.drconbep where lCOMTR LIKE 'BR%'  and lfcotr= '20181026' and '20181028'



/*Cod 0701027 supermercado na nica 1.075.451.*/
select lfectr,lfcotr,lhortr,lidcom,lcomtr,limpgs,lcretr,lesttr,lenemi
from libdebito.drconbep where lidcom='0701027' and lfectr> '20181025' 
select * from gxopera.flicom where licomer='0701027' and lifechd='20181029'
select * from gxopera.flicom1 where licomer='0701027' and lifecredi='20181030'
select sum(opmonto-opcomi),openemi 
from gxopera.opmovi where opcomer='0701027' and opfecom='20181029'
group by openemi
select * from contabilid.tatgene where tgenti='059'
select * from gxbdbps.comaeaf where cocomer='0701027'corazo like '%PUERTO ALTO%'
select lfectr,lfcotr,lhortr,lidcom,lcomtr,limpgs,lcretr,lesttr,lenemi
from libdebito.drconbep where lCOMTR LIKE 'BR%'  and lfcotr= '20181026' and '20181028'



/*Cod 0701149 supermercado villa bonita 159.816*/
select lfectr,lfcotr,lhortr,lidcom,lcomtr,lnrtar,lenemi,limpgs,lcretr,lesttr,lenemi
from libdebito.drconbep where lidcom='7200064' and lfectr= '20181217' 
select *--sum(opmonto-opcomi)NETO,OPCOMI,opmonto,openemi 
from gxopera.opmovi where opcomer='7200064' and opfecom>='20181214'
group by opfecom,openemi,opcomi,opmonto
select * from gxopera.opliqui where opnroref='835191472984'
from gxopera.opmovi where opcomer='7200064' and opfecom>='20181214'
select * from gxopera.flicom where licomer='7200064' and lifechd>='20181201'
select * from gxopera.flicom1 where licomer='7200064' and lifecredi>='20181214'
select * from contabilid.tatgene where tgenti='054'
select * from gxbdbps.comaeaf where cocomer='0701148' --corazo like '%PUERTO ALTO%'
sELECT enemiso, ennombc, ennctc1, ennctd1 FROM GXBDBPS.GENTIAF where 
select * from gxbdbps.comaeaf where codeno like '%BAR%LEO%' cocomer='7200064'
select * from gxopera.opentid where entdesc like '%BA%'
select * from gxbdbps.gentiaf
select * from gxopera.CLPARF
select REFECH,  from gxopera.oprecle where reenemi='020' and refech='20181029' and readmin in ('','')

select * from libdebito.tbbine0p

select lfectr,lfcotr,lhortr,lidcom,lcomtr,limpgs,lbinpr,lcretr,lesttr,lenemi
--select count(*), lfectr fecha_real

select RFENTI as entidad ,  concat(concat(concat(substr(RFECTR , 7 , 2 ) ,'/') ,
concat(substr(RFECTR , 5 , 2 ),'/' )),(substr(RFECTR , 1 , 4 ) )) as fecha1 , 
RNRTAR as Num_Tar,  RCTAOR, RIDCOM ,  RMONTR,  RIMPGS as importe,  RIDTRA as Atm_Trx,  
RESTTR,  REFLAG,   RCOME1 as Cod_resp,   concat(concat(concat(substr(RFEREC , 7 , 2 ) ,'/')
,concat(substr(RFEREC , 5 , 2 ),'/' )),(substr(RFEREC , 1 , 4 ) ))as fecha2 ,
RIDREC as Usuario_recla,  concat(concat(concat(substr(RFEPRO , 7 , 2 ) ,'/') ,
concat(substr(RFEPRO , 5 , 2 ),'/' )),(substr(RFEPRO , 1 , 4 ) ))as fecha3,
RIDPRO as Usuario_Proce,   RERRNB
from LIBDEBITO.OPEMAEHST
where    RFECTR between  '20181107' and '20181107'




select opidliq ID, opnroref Referencia,opcodbco, opncomer Comercio, codeno denominacion, opfecliq FchLiq,
 (case when optctacr = 'K' then 'Cta_Cte.' else 'Caj_Ahorro' end ),opnrctcr CtaCredito,opcampoB IdTrx, opimporb ImporteTrx, opimpor ImporteAcred,opstatob CodResp, opmensob Mensaje 
 from gxopera.opliqui inner join gxbdbps.comaeaf on opncomer = cocomer where opncomer='0200371' and opstatob not in ('00','88','77')  
 
select count(*) from libdebito.drconbep where lfectr between '20180101' and '20180930' and substr(lidtra,1,1)='T'

select * from gxbdbps.comaeaf where cocomer='0301403'
select * from gxbdbps.comaeaf where comadre='0301403'

select * from libdebito.drconbep
where lfectr >'20181001' and lidcom in('0301403','0301831') and lcodtr in ('370000','380000','390000') and lcretr='R'
select * from gxopera.opmovi
where opferea >'20180901' and opcomer in('0301403','0301831') and opcodtrn in ('370000','380000','390000') and opnoref ='826583682829' and opmonto<0 and opcodres='R'



/*CASO INTERFISA DIFERENCIA DE ACREDITACIONES*/
/*TOTAL POR  EMISOR*/
select sum(remonto) MONTO, reenemi EMISOR from gxopera.oprecle
where refech='20181031' and readmin='018' and removi='ADA' group by 
/*TOTAL POR  NRO DE ATM*/
select sum(remonto) MONTO, 	recomer EMISOR from gxopera.oprecle
where refech='20181031' and readmin='018' and removi='ADA' group by recomer


select * from gxopera.oprecle where refech='20181029' and readmin='018' and removi='ADA' 
select sum(remonto) from gxopera.oprecle where refech='20181029' and readmin='018' and removi='ADA' 
select sum(opmonto) from gxopera.opmovi where opferea='20181031' and opadmin='018' 
 
/*FACTURACION A PROCARD BINES PROCARD MASTERCARD Y VISA*/
select count(*),pbin  from libdebito.factenti where lenemi<>'510' and  bin <>(select pbin from libdebito.tbinproc)
/*El reporte ?RESUMEN DE EXTRACCION POR MARCA? realiza un join con la tabla tbinproc y el select que realiza es el siguiente.*/
select sum(cantidad) from libdebito.factenti a
inner join LIBDEBITO.TBINPROC b on bin=pbin
where marca='MST' and lenemi='510' and disposit='T' and substr(CODTRA,1,2) <> '31' and CODRES = '00' 
and BIN <> '425935' and BIN <> '425936' and BIN <> '443076' and estado='A' and ptipproc='BAN' and ptiptar='DEB'
/*El Reporte ?DETALLE DE TRANSACCIONES POR MARCA y BIN? no tiene en cuenta la tabla tbinproc y lista todas las transacciones de la tabla Factenti.*/
select sum(cantidad) from libdebito.factenti where lenemi='510' and marca='MST' and BIN <> '425935' 
and BIN <> '425936' and BIN <> '443076' and disposit='T' and substr(CODTRA,1,2) <> '31' and codres='00' and estado='A'



SELECT *  FROM gxopera.opago1phis WHERE PGFECRE ='20181120' and pgidusr='U99NATI'
a inner join libdebito.binprodu b on a.lbinpr =b.rgbin
b.rgenti MARCA_TARJ,

select lfectr LFECTR, lerrnb REFERENCIA,lbinpr BIN ,lnrtar NRO_TARJ,lcomtr COMERCIO,lidcom COD_COMERCIO,limpgs IMPORTE,lcodtr COD_TRX,lesttr ESTADO,lcretr COD_retorno,lactfj Activo,lcotel,lcored,leimp4,lcautr
from libdebito.drconbep  where
lfectr between '20181012' and '20181015' and lcodtr in ('524000','901020') and lerrnb like '%85893747'

select * from  libdebito.drconbep  where lfectr between '20181014' and '20181014' and lcodtr in ('524000','901020') and 

select * from libdebito.tbctra0p
select * from libdebito.tbcret0p

select * from gxbdbps.comaeaf where comadre='1000414'

select * from gxweb.gxlousu where  usuaid like '%JOSEEN%'
select * from gxweb.gxlousudet where usucod='584' usuaid like '%JOSEEN%'

select * from gxweb.gxlousudet where usucod='393'cocomer='1000414'

select * from gxweb.gxlousu where usucod in('1929','1930','393','1694','1786','1787','224','414','1880','1686')

select * from 

select * from libdebito.CO01CUEN

/*DRCONBEP*/
select lfectr FECHA_REAL,lfcotr FECHA_COMERCIAL,lidcom COD_COMERCIO,lerrnb REFERENCIA,lcomtr DESCRIP_COMERCIO,limpgs IMPORTE,LNRTAR TARJETA,lcretr COD_RETORNO,
lesttr ESTADO,lenemi ENTIDAD,lcodtr COD_TRX,lcored,leimp4,lcotel
from libdebito.drconbep 
where lfectr between '20181204' and '20181204' and lenemi='020' and substr()
and lerrnb like '%805735%' 
and lcodtr  in ('370000','380000','390000')

-- and substr(lidtra,1,1)='P'-- and lidcom='0100001'  --lbinpr='479348' 
--and lcretr='13'
order by lhortr
--and lerrnb='831088047647'
and lcretr='15'
and lenemi='510'
and lcodbc in ('MST','VSA')
and lbinpr='479348'
group by lfectr


select * from libdebito.tbcret0p

 order by lhortr DESC


select * from gxbdbps.tmtaraf where 
CENUMDO='1420320' mtnopla like '%VICTOR%FLEITAS%'

select * from gxbdbps.DRMAEAF where AKENTI='121' AND 
AKAENB='1420320' 

select * from libdebito.tgembhaf where crenti='121' and crsucu='00' and crdocu='1420320'

select * from libdebito.drconbep where lnrtar='6274311210011596'








select * from gxopera.mails where titulo like '%Error%Itau%' and cuerpo like '%OPTICA%'
select * from gxopera.mails where titulo like '%Error%'
DELETE  from gxopera.mails where titulo like '%Error%'


select * from gxopera.trxinst where insemiso='002'
select * from gxopera.trxinst where insemiso='055'
SELECT * FROM CONTABILID.TATGENE WHERE TGALFA='BA'


select PGFECOM,SUM(PGIMPOR)IMPORTE,PGTIPO,PGIDUSR,PGCOMER,B.CODENO from gxopera.opago1phis 
INNER JOIN GXBDBPS.COMAEAF B ON PGCOMER=COCOMER where pgfecre='20181126' and pgidusr='U99NATI'
GROUP BY PGFECOM,PGIDUSR,PGCOMER,PGTIPO,B.CODENO
select * from gxopera.opago1phis where pgfecre between '20181203' and '20181206' and pgnocta like '%218366%'
29786923.00
select * from contabilid.sjdpers
Select * from gxbdbps.tmtaraf

select * from GXOPERA.SERVTRAN where st_tran in ('600020','600022','600023')
select * from libdebito.tbctra0p
select * from libdebito.drconbep where lenemi='162' and lfcotr>='20181210' and lcodtr='013000'
************************************************************************************************************
select a.usucod "Cod Usuario",USUNOM "Nombre",USUAID "Usuario",USUMAI "Email",USUCARG "Cargo",
USUCORUC "RUC",TUsrId "ROL",USUEST "Estado",b.COCOMER "Cod. Comercio", CODENO "Denominacion" from gxweb.GXLOUSU a 
inner join gxweb.GXLOUSUDET b on a.usucod=b.usucod 
inner join gxweb.COMAEAF c on b.cocomer=c.cocomer
where TUsrId = 1 or TUsrId = 5  
**************************************************************************************************************************************
select * from gxbdbps.tdcta a inner join gxbdbps.tdctaad b on a.tdctanro=b.tdctanro where tdctatar like '70302001026920%'
select * from  gxbdbps.tdctaad 
**************************************************************************************************************************************
--VERIFICACION DE SALDO CICO 
--COMERCIO ROSALI REGALOS
--SALDO OPERATIVO
select * from libdebito.bst015 where ltrim(bs15codcom)='0301531'
select * from gxweb.bst015w where ltrim(bs15codcom)='0301531'
--TOTAL DE TRX 370000CI+GIROS390000 LE RESTA AL SALDO OPERATIVO, COUT380000 LE SUMA AL SALDO OPERATIVO.
--CICO-CASH IN-CASH OUT RESUMEN DIARIO
select * from libdebito.bst021 where ltrim(bs21codcom)='0301531'
select * from libdebito.bst021 where ltrim(bs21codcom)='0301531'
--CICO Transac. Aprobadas TIGO p/REVERSAR
select * from libdebito.bst022 where ltrim(bs22codcom)='0301531'
select * from gxbdbps.bst010 where ltrim(bs22codcom)='0301531'



select * from featmslib.azlcf
select * from gxbdbps.coafcaf where cocomer='0100037'
select * from gxbdbps.coafmaf where afcomer='0100037'
select * from gxbdbps.comaeaf where comadre ='1000414'
select cocomer,codeno,corazo,corucn,comadre,cofactu,costat from gxweb.comaeaf   where comadre ='1000414'
select * from gxweb.bst015w where ltrim(bs15codcom) in ('1000414','1001642')
select * from gxbdbps.tmtaraf where enemiso='307' and mtnopla like '%ZARACHO%'
select * from gxbdbps.gclieaf where CENUMDO='4062545'
select * from gxbdbpd
select * from gxbdbps.comaeaf where codeno like '%BIGGIE%'
select * from GXOPERA.FCTACOM where cocomer ='5400582' 
select * from contabilid.tatgene where tgalfa='BA'
select * from gxopera.pdsipap
select sum(pdsmonto),pdsftrans,pdsentcre,pdsagrup from gxopera.pdsipap where pdsftrans='20181220'  group by pdsftrans,pdsentcre,pdsagrup



select * from gxopera.comples where complefecom='20181217' and compleadm='085'
delete  from gxopera.comples where complefecom='20181217' and compleadm='085'
select * from gxopera.complesdetalle where complefecom='20181217' and cocomer='9099382' and compleaut='354331'
delete from gxopera.complesdetalle where complefecom='20181217' and cocomer='9099382' and compleaut='354331'
select * from g
select * from gxbdbps.gentiaf where ennombr like '%LAMBA%'
select * from gxopera.OPENTId where entdesc like '%LAMBA%'


select cocomer, codeno,cofecalt from gxbdbps.comaeaf where cocomer='0701818'
select * from gxbdbps.gferiaf
select * from gxbdbps.tentares where entarnro like '420806%'

*/verificacion de instructivos */
select * from gxopera.trxinst where insemiso='059'
select distinct insemiso from gxopera.trxinst

select * from gxopera.factura where factnro='10030001055' and factimbr='13215540' and faclien='0301398'
select * from gxopera.factura1 where factnro='10030001055' and factimbr='13215540'
delete from gxopera.factura where factnro='10030001056' and faclien='0301398'
delete from gxopera.factura1 where factnro='10030001055' and factimbr='13215540'


select * from gxopera.factura where factnro='10030003417' and faclien='0700223' and factimbr='13215540' 
select * from gxopera.factura1 where factnro='10020009777' and factimbr='13215540'

select * from gxweb.factura where factnro='10020009777' and factimbr='13215540'
0010020009777
select * from gxopera.factura2
select * from gxopera.retcom where date(retfech)='2019-03-31'

select * from gxopera.recibos where rid='135137'

select * from gxopera.factura where factnro in(
'10030042669',
'10030038761')
'10030038761',
'10030046638',
'10030042672',
'10030042667',
'10030042666',
'10030046633',
'10030000779',
'10030046632')

