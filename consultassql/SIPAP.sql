/*Transacciones ONLINE CONTI/BBVA SIPAP archivo BEPSPYPA-FECHA-01.swf*/
Select-- COUNT(*), SUM(OPIMPOR)
--substr(opcampoa,41,8), 
substr(opcampoa,17,8), opcodbco, sum(opimpor) 
from gxopera.opliqui where substr(opcampoa,1,6) = '703002' and opcodbco in (57,64) and opstatOB = '00'
and substr(opcampoa,17,8) >= '20211220' AND substr(opcampoa,17,8) <= '20211220' and opimpor > 0  -- FECHA DEL DIA
group by /*substr(opcampoa,41,8),*/substr(opcampoa,17,8), opcodbco
order by /*substr(opcampoa,41,8),*/substr(opcampoa,17,8), opcodbco;


/*Transacciones ATM - DEBITO BEPSPYPA-FECHA-02.swf*/
Select openemi,OPADMIN,OPFECOM, OPTIPTAR,SUM(OPMONTO-OPCOMI-OPRENTA-OPREIVA) from GXOPERA.OPMOVI
WHERE  OPFECOM BETWEEN '20211220' AND  '20211220' -- FECHA COMERCIAL
AND OPCODTRN IN( '011000', '012000', '013000') 
AND SUBSTR(OPIDTRA, 1, 1) = 'T'  AND OPTIPTAR = 'DEB'
AND OPENEMI IN ('002' ,'500', '777','020')
AND OPADMIN IN( '074' , '018' , '201','020','002')
GROUP BY openemi,OPFECOM, OPTIPTAR, OPADMIN 
ORDER BY openemi,OPFECOM, OPTIPTAR, OPADMIN
--rESUMEN sipap (OPMOVI VS MT971)  FALTA VERIFICAR BNF
Select 'EMISOR', OPENEMI, OPADMIN,SUM(OPMONTO) from gxopera.OPMOVI where OPFECOM = '20211220' AND OPENEMI IN('040','020', '002') 
AND OPTIPTAR = 'DEB' AND OPADMIN IN ('002','087','074') AND OPCODTRN IN ('011000','012000','013000') 
AND SUBSTR(OPTARJ,1,6) IN ('703002','703020','703040')
GROUP BY OPENEMI, OPADMIN
UNION
Select OPENEMI,OPADMIN,SUM(OPMONTO), SUBSTR(OPTARJ,1,6) from gxopera.OPMOVI where OPFECOM = '20211217' AND OPENEMI IN('040','020', '002') 
AND OPTIPTAR = 'DEB' AND OPADMIN IN ('002','087','074') AND OPCODTRN IN ('011000','012000','013000')
GROUP BY OPADMIN, OPENEMI, SUBSTR(OPTARJ,1,6)

sELECT DSENTCRE, DSENTDEB, SUM(DSMONTO) FROM GXOPERA.DESIPAP WHERE DSAGRUP = '02' GROUP BY DSENTCRE, DSENTDEB

------PARA CONTROLAR DINELCO CONTI
SELECT OPTDENT,SUM(OPTDTOT) IMPORTE 
FROM GXOPERA.OPTADE WHERE OPTDFEC = '20211220' AND OPTDENT IN ('002', '018', '074')
GROUP BY OPTDENT 
/*Transacciones ATM CREDITO BEPSPYPA-FECHA-03.swf*/
Select OPADMIN,OPFECOM, OPTIPTAR,SUM(OPMONTO-OPCOMI-OPRENTA-OPREIVA) from GXOPERA.OPMOVI
WHERE  OPFECOM BETWEEN '20211220' AND  '20211220' -- FECHA COMERCIAL
AND OPCODTRN IN( '011000', '012000', '013000') 
AND SUBSTR(OPIDTRA, 1, 1) = 'T'  AND OPTIPTAR = 'CRE'
AND OPENTID IN ('002' ,'500', '777')
AND OPADMIN IN( '074' , '018' , '201')
GROUP BY OPFECOM, OPTIPTAR, OPADMIN 
ORDER BY OPFECOM, OPTIPTAR, OPADMIN



/*VERIFICACIONES*/ este es para verificar el MT971 001
Select /*sum(opimpor) , COUNT(*),*/substr(opcampoa,41,8) COMERCIAL, substr(opcampoa,17,8) FREAL, opcodbco, sum(opimpor) 
from gxopera.opliqui where substr(opcampoa,1,6) = '703002' and opcodbco in (57,64) and opstatOB = '00'
and substr(opcampoa,17,8) >= '20211221'   AND substr(opcampoa,17,8) <= '20211221' --and opimpor > 0 AND OPFECLIQ > '20180726'
group by Substr(opcampoa,41,8),substr(opcampoa,17,8), opcodbco
order by substr(opcampoa,41,8),substr(opcampoa,17,8), opcodbco;

{1:F01BEPSPYPAAXAD}{2:I971BCPAPYPRXXXXN}{3:{113:0004}}{4:
:20:20180801/001
:25:BNFAPYPA
:62F:D180802PYG193573417,
:25:BBVAPYPA
:62F:C180802PYG65779890,
:25:BCNAPYPA
:62F:C180802PYG127793527,
-}


/*VERIFICACION SIPAP*/
Select /*substr(opcampoa,41,8)FComercial ,*/  substr(opcampoa,17,8) FCredito, 
opcodbco Banco, sum(opimpor) 
from GXOPERA.opliqui
where substr(opcampoa,17,8) = '20211220' -- fecha de hoy 
and opcodbco in (57,64) 
group by /*substr(opcampoa,41,8) ,*/ substr(opcampoa,17,8), opcodbco


SELECT * FROM GXOPERA.CLPARF /*CODIGOS SWIFT CON BANCOS */


/*consolidado bcp SIPAP*/

[?19/?10/?2018 15:09]  Carlos Miguel Barrios Rodas:  
/*PARA ENVIAR*/
select count(*) cantidad ,pdscotr, sum(pdsmonto)bruto, sum(pdsNETO)neto ,pdsagrup 
from gxopera.pdsipap where  substr(pdsfecha, 1,6)='201808' group by pdscotr, pdsagrup 


select pgtipo,pgidusr,pgcomer,pgnocta,pgdescr,pgobser,sum(pgimpor) importe from gxopera.opago1phis
where pgfecom='20211220'
and pgcomer in ('4500001','4500005','4500079','4500085','4500092','4500104','4500105','4500117','4500163')
 group by pgtipo,pgidusr,pgcomer,pgdescr,pgobser,pgimpor,pgnocta
 
select * from gxopera.opago1phis
Select lfcotr Fecha_comercial, count(*) Cantidad_trx_PosyATM 
from libdebito.drconbep where LIDCOM <> 100001 and substr(LIDTRA, 1, 1) in ('P', 'T')
and lfcotr between '20210101' and '20211220'
--and LFCOTR in ('20211220','20211213','20211206','20211129')
and LESTTR = 'A' AND LCRETR = '00'
group by lfcotr
