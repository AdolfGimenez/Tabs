--231290010802051--lote anulado para no pagar
--------------------------------------------------------------------------
select mcdisco saldo,  mcnumta tarjeta,   T.* from gxbdbps.tmctaaf T where mcnumta='6274311550006321';
SELECT * FROM GXBDBPS.TMTARAF T;
----------------------------
SELECT ODLBNM, ODOBNM, ODOBTP, ODOBAT, ODCDAT, ODSIZU * ODBPUN,ODUDAT, O.*
FROM moleda.objetos o
WHERE ODOBAT IN ('PF', 'SAVF') --AND ODLBNM='QGPL'
ORDER BY ODSIZU * ODBPUN DESC;

SELECT substr(DEBUGIPM, 1, 10) , DEBUGIPM FROM MASTERCARD.DEBUGIPM LIMIT 15;
--WHERE substr(DEBUGIPM, 1, 10) between '2023.02.20' and '2023.02.20'

SELECT * FROM MASTERCARD.LOGMAS001
WHERE date( FECLOG ) between
'2023-12-10' and '2023-12-10';

SELECT * FROM MASTERCARD.MIPADQDEB M;
SELECT * FROM VISA.DEBUGVISA;
/*Juan Carlos Rojas
mastercard/DRVMIPRCV
Juan Carlos Rojas
MASTERCARD/DRVMIPSND*/

INSERT INTO LIBDEBITO.TAUREV
SELECT L.ENRRNB                                                REVRRN,
       '703002'                                                REVBIN,
       '1002'                                                  REVENT,
       CURRENT_DATE                                            REVFECH,
       '114142'                                                REVHORTR,
       '240125'                                                REVFECTR,
       '0420' || L.ENCODO || L.ENTRK2 || ENCTAD || ENCTAC || ENFECC || ENFECR || ENHORR || ENMONE || ENIMPO ||
       ENIMPD || ENTRID || ENSTAN || ENTCC || ENMCCO || ENNAME LREVMSG,
       'P'                                                     REVEST,
       '0420'                                                  REVMTI,
       '  '                                                    REVRET,
       'U99ADOLFO'                                             REVUSAC,
       CURRENT_DATE                                            REVFEAC;
----------------------------------------
Select movcodcli, movcodsuc, movcomer, movdeno, MOVTPTA,count(*) CANTIDAD, sum(movimco) COMISION, sum(movivco)IVACOMISION,
sum(movimco+movivco)"COMISION+IVA" from gxfindta.tclmov where movcodcli = 10937 and sercodi = 'COMPRA' AND movfCRE between '20240131' and '20240228'
group by movcodcli, movcodsuc, movcomer, movdeno, MOVTPTA;

SELECT * FROM LIBDEBITO.DRCONBEP D WHERE D.LERRNB='468101778911';
SELECT * FROM GXBDBPS.COMAEAF C2 WHERE C2.CORUCN='80019742-9';

Select movcodcli, movcodsuc, movcomer, movdeno, MOVTPTA,count(*) CANTIDAD, sum(movimco) COMISION, sum(movivco)IVACOMISION,
sum(movimco+movivco)"COMISION+IVA" from gxfindta.tclmov where movcodcli = 10937 and sercodi = 'COMPRA' AND movfCRE between '20240229' and '20240326'
group by movcodcli, movcodsuc, movcomer, movdeno, MOVTPTA;

Select movcodcli, movcodsuc, movcomer, movdeno, MOVTPTA,count(*) CANTIDAD, sum(movimco) COMISION, sum(movivco)IVACOMISION,
sum(movimco+movivco)"COMISION+IVA" from gxfindta.tclmov where --MOVCOMER =6900896 --and sercodi = 'COMPRA'
--AND
    movfCRE between '20240301' and '20240331'
group by movcodcli, movcodsuc, movcomer, movdeno, MOVTPTA;

SELECT * FROM gxfindta.tclmov where MOVCOMER =6900896
AND movfCRE between '20240301' and '20240331';

SELECT T.MOVOPDE, T.*
FROM GXFINDTA.TCLMOV T
WHERE T.MOVOPDE = 700605
  AND T.SERCODI IN ('VTAMIN', 'PAGFAC')
  AND T.MOVFCRE BETWEEN '20231221' AND '20240320';

SELECT T.MOVOPDE, T.*
FROM GXFINDTA.TCLMOV T
WHERE T.MOVIDLT='240020096900042'

SELECT * FROM GXFINDTA.TCLTSB T WHERE T.TSBNREF='240740074500189';

SELECT * FROM GXFINDTA.TCMCLI T WHERE T.CLICLICOD=932725;
---para ver si tiene red de pagos
SELECT b.* FROM GXFINDTA.TCMSUC a
JOIN GXFINDTA.TCMSER b
ON a.CLICLICOD = b.CLICLICOD
AND a.SUCSUCCOD = b.SUCSUCCOD
           AND b.SERHABILI='N'
WHERE b.SERCODI = 'REDPAG' AND a.SUCESTADO = 'A' ORDER BY a.CLICLICOD, a.SUCSUCCOD;

SELECT * FROM GXFINDTA.TCOCNA T WHERE T.CLICLICOD IN (3394);
SELECT * FROM GXFINDTA.TCMSER T WHERE T.CLICLICOD IN (3394) AND T.SERCODI='REDPAG';

SELECT * FROM GXBDBPS.COMAEAF C2 WHERE  C2.CORUCN='80025769-3';
SELECT * FROM GXFINDTA.TCMCLI T WHERE T.CLIRUC='80025769-3';
SELECT * FROM GXFINDTA.TCMSUC T WHERE T.CLICLICOD=11447;

SELECT SUM(T.MOVIMPO), T.MOVCOMER
FROM GXFINDTA.TCLMOV T
WHERE T.MOVCOMER IN ('7800046', '7800045', '7800047')
  AND T.MOVFCRE BETWEEN '20240101' AND '20240131'
GROUP BY T.MOVCOMER;

SELECT EXTERNAL_NAME,ROUTINE_NAME, a.* FROM QSYS2.SYSPROCS a WHERE ROUTINE_NAME LIKE '%SP_INSERTA_T%';
SELECT EXTERNAL_NAME,ROUTINE_NAME, a.* FROM QSYS2.SYSPROCS a WHERE ROUTINE_NAME LIKE '%SP_UPD_M%';

SELECT * FROM GXBDBPS.TMCTAAF;

SELECT T.SERCODI FROM GXFINDTA.TCLMOV T WHERE T.MOVCODCLI=11422 AND T.MOVFCRE BETWEEN '20240301' AND '20240331' GROUP BY T.SERCODI;

SELECT D.LCAUTR, D.* FROM LIBDEBITO.DRCONBEP D WHERE D.LERRNB LIKE '40830580095%';
SELECT T.MOVCODCLI, T.* FROM GXFINDTA.TCLMOV T WHERE T.MOVRRNBEP='408305800957';--408305800957

SELECT * FROM GXFINDTA.TCLTSB T WHERE T.TSBNREF='240850010302896';

SELECT * FROM GXBDBPS.COMAEAF GC WHERE GC.CORUCN='80072872-6';
SELECT * FROM GXFINDTA.TCMSUC T WHERE T.CLICLICOD=17589;
SELECT * FROM GXTRJDTA.tdgent T WHERE T.ENTCODENT > 7000;

SELECT * FROM LIBDEBITO.DRCONBEP D WHERE D.LNRTAR LIKE '703002%' AND D.LFECTR='20240412';

/*Transacciones Aprobadas - Reversadas Online*/
WITH tt AS
(SELECT UPPER(MOVDESAM) ambito, MOVDSBCC BANCO_PAGADOR, c.TSBESTA ESTADO1, c.TSBCOME RETORNO, c.TSBDEME DESCRI_RETORNO,
   MOVRUC ruc,
   MOVRAZO RAZON_SOCIAL,
   MOVFCRE fecha_liquidacion,
   MOVHTRX hora,
   MOVFPRO fecha_proceso,
   MOVFTRX fechatrx,
   MOVRRNBEP nrotransaccion,
   (CASE WHEN MOVTPTA = 'D' THEN 'DEBITO' WHEN MOVTPTA = 'C' THEN 'CREDITO' WHEN MOVTPTA = 'E' THEN 'EFECTIVO' END) tipotarjeta,
   MOVCOAU autorizacion,
   MOVDESEM emisor,
   SUBSTR(MOVNTAR,1,6)||'XXXXXX'||SUBSTR(MOVNTAR,13,4) tarjeta,
   MOVMARC marca,
   1 cuotas,
   '600' moneda,
   MOVCOAM origen,
   MOVCOMER codsucursal,
   MOVDENO sucursal,
   a.SERCODI tipo,
      A.PRECODI PREAUT,
   MOVCODPR procesadora,
   MOVCODIS dispositivo,
   MOVESTA estado,
   MOVIDLT nroresumen,
   movimpo importe,
   CASE WHEN MOVNETO <> c.TSBIMPO THEN (OPCOMENT + OPCOMBPS) ELSE MOVIMCO END comision,
   CASE WHEN MOVNETO <> c.TSBIMPO THEN (OPIVAENT + OPIVABPS) ELSE MOVIVCO END ivacomision,
   MOVRENT renta,
   MOVIVREN ivarenta,
   CASE WHEN MOVNETO <> c.TSBIMPO THEN (OPMONTO - OPCOMENT - OPCOMBPS - OPIVAENT - OPIVABPS - OPRENTA - OPREIVA) ELSE MOVNETO END NETO,
   MOVNETO AS neto_tclmov,
   c.TSBIMPO importe_transmisiones,
   MOVCDBCC codbanco,
   MOVCTBCC ctabanco,
   MOVCOCO porcencomision,
   date(tsbfeac) fechaacreditacion,
   (CASE WHEN MOVPGON = 'O' THEN 'LINEA' WHEN MOVPGON = 'B' THEN 'LOTE' ELSE 'PENDIENTE' END) tipooperacion,
   TSBNREF ref_extracto,
   TSBNREF ref_bepsa--,'QUERY_1' AS returnn
FROM GXFINDTA.TCLMOV a
INNER JOIN GXOPERA.OPMOVI b ON MOVRRNBEP = OPNOREF AND CASE WHEN OPSTATUS = 'E' THEN 'R' ELSE OPSTATUS END = MOVESTA
LEFT JOIN GXFINDTA.TCLTSB c ON MOVRRNBEP = TSBNREF AND CASE WHEN TSBTPOP = '03' THEN 'R' WHEN TSBTPOP = '01' THEN 'A' END = MOVESTA
wHERE MOVFPRO between '20230101' AND '20231231'
  and  MOVPGON = 'O'
  AND MOVRUC= '80094255-8'
  AND c.TSBNREF IS NOT null
UNION
/*QR*/
  SELECT UPPER(MOVDESAM) ambito,MOVDSBCC BANCO_PAGADOR,x.TSBESTA ESTADO1, x.TSBCOME RETORNO, x.TSBDEME DESCRI_RETORNO,MOVRUC ruc,MOVRAZO RAZON_SOCIAL,MOVFCRE fecha_liquidacion, MOVHTRX hora, MOVFPRO fecha_proceso,
   MOVFTRX fechatrx,
   MOVRRNBEP nrotransaccion,
  (CASE WHEN MOVTPTA = 'D' THEN 'DEBITO' WHEN MOVTPTA = 'C' THEN 'CREDITO' WHEN MOVTPTA = 'E' THEN 'EFECTIVO' END) tipotarjeta,
   MOVCOAU autorizacion,
   MOVDESEM emisor,
   SUBSTR(MOVNTAR,1,6)||'XXXXXX'||SUBSTR(MOVNTAR,13,4) tarjeta,
   MOVMARC marca,
   1 cuotas,
   '600' moneda,
   MOVCOAM origen,
   MOVCOMER codsucursal,
   MOVDENO sucursal,
   a.SERCODI tipo,
   A.PRECODI PREAUT,
   MOVCODPR procesadora,
   MOVCODIS dispositivo,
   MOVESTA estado,
   MOVIDLT nroresumen,
   (CASE WHEN a.SERCODI = 'COMPRA' THEN MOVNETO ELSE movimpo END) importe,
   (CASE WHEN a.SERCODI = 'COMPRA' THEN 0 ELSE movimco END) comision,
   (CASE WHEN a.SERCODI = 'COMPRA' THEN 0 ELSE MOVIVCO END) ivacomision,
   MOVRENT renta,
   MOVIVREN ivarenta,
   MOVNETO NETO,
   MOVNETO AS neto_tclmov,
   COALESCE (g.TSBIMPO,x.TSBIMPO ) importe_transmisiones,
   MOVCDBCC codbanco,
   MOVCTBCC ctabanco,
   MOVCOCO porcencomision,
   COALESCE (date(g.tsbfeac),date(x.tsbfeac) ) fechaacreditacion,
   'LOTE' tipooperacion,
   COALESCE (OPCREREF,x.TSBNREF) ref_extracto,
   MOVIDLT ref_bepsa--,'QUERY_4' AS returnn
FROM GXFINDTA.TCLMOV a
INNER JOIN GXOPERA.OPMOVI b ON MOVRRNBEP = OPNOREF AND MOVFPRO = OPFECOM
LEFT JOIN GXOPERA.OPLICRE c ON MOVFPRO = OPCREFCOM AND MOVCOMER = OPCRECOM
LEFT JOIN GXFINDTA.TCLTSB g ON OPCREREF = g.TSBNREF
LEFT JOIN GXFINDTA.TCLTSB x ON MOVIDLT = x.TSBNREF
WHERE MOVFPRO between '20230101' AND '20231231'
  and MOVPGON = 'B'
  AND MOVRUC = '80094255-8'
  AND a.SERCODI = 'COMPRA'
  AND a.PRECODI = 'COQR'
UNION
/*Transacciones Aprobadas Batch <> Red de pagos*/
SELECT UPPER(MOVDESAM) ambito,	MOVDSBCC BANCO_PAGADOR,x.TSBESTA ESTADO1, x.TSBCOME RETORNO, x.TSBDEME DESCRI_RETORNO,MOVRUC ruc,MOVRAZO RAZON_SOCIAL,
	    MOVFCRE fecha_liquidacion,
	  MOVHTRX hora, MOVFPRO fecha_proceso,
       MOVFTRX fechatrx,
       MOVRRNBEP nrotransaccion,
       (CASE WHEN MOVTPTA = 'D' THEN 'DEBITO' WHEN MOVTPTA = 'C' THEN 'CREDITO' WHEN MOVTPTA = 'E' THEN 'EFECTIVO' END)  tipotarjeta,
       MOVCOAU autorizacion,
       MOVDESEM emisor,
       SUBSTR(MOVNTAR,1,6)||'XXXXXX'||SUBSTR(MOVNTAR,13,4) tarjeta,
       MOVMARC marca,
       1 cuotas,
       '600' moneda,
       MOVCOAM origen,
       MOVCOMER codsucursal,
       MOVDENO sucursal,
       a.SERCODI tipo,
          A.PRECODI PREAUT,
       MOVCODPR procesadora,
       MOVCODIS dispositivo,
       MOVESTA estado,
       MOVIDLT nroresumen,
       (CASE WHEN a.SERCODI = 'DINEFE' THEN MOVNETO ELSE movimpo END) importe,
       (CASE WHEN a.SERCODI = 'DINEFE' THEN 0 ELSE movimco END) comision,
       (CASE WHEN a.SERCODI = 'DINEFE' THEN 0 ELSE MOVIVCO END) ivacomision,
       MOVRENT renta,
       MOVIVREN ivarenta,
       MOVNETO NETO,
       MOVNETO AS neto_tclmov,
       COALESCE (g.TSBIMPO, x.TSBIMPO ) importe_transmisiones,
       MOVCDBCC codbanco, MOVCTBCC ctabanco,
       MOVCOCO porcencomision,
   COALESCE (date(g.tsbfeac),date(x.tsbfeac) ) fechaacreditacion,
   'LOTE' tipooperacion,
   COALESCE (OPCREREF,x.TSBNREF) ref_extracto,
       MOVIDLT ref_bepsa--,'QUERY_3' AS returnn
    FROM GXFINDTA.TCLMOV a
    LEFT JOIN GXOPERA.OPLICRE c ON MOVFPRO = OPCREFCOM AND MOVCOMER = OPCRECOM
    LEFT JOIN GXFINDTA.TCLTSB g ON OPCREREF = g.TSBNREF
    LEFT JOIN GXFINDTA.TCLTSB x ON MOVIDLT = x.TSBNREF
WHERE MOVFPRO between '20230101' AND '20231231'
      AND MOVPGON = 'B'
      AND MOVRUC = '80094255-8'
      AND a.SERCODI = 'DINEFE'
UNION
/*Transacciones Aprobadas Batch = Red de pagos*/
  SELECT UPPER(MOVDESAM) ambito,MOVDSBCC BANCO_PAGADOR,x.TSBESTA ESTADO1, x.TSBCOME RETORNO, x.TSBDEME DESCRI_RETORNO,MOVRUC ruc,MOVRAZO RAZON_SOCIAL,MOVFCRE fecha_liquidacion, MOVHTRX hora, MOVFPRO fecha_proceso,
   MOVFTRX fechatrx,
   MOVRRNBEP nrotransaccion,
  (CASE WHEN MOVTPTA = 'D' THEN 'DEBITO' WHEN MOVTPTA = 'C' THEN 'CREDITO' WHEN MOVTPTA = 'E' THEN 'EFECTIVO' END) tipotarjeta,
   MOVCOAU autorizacion,
   MOVDESEM emisor,
   SUBSTR(MOVNTAR,1,6)||'XXXXXX'||SUBSTR(MOVNTAR,13,4) tarjeta,
   MOVMARC marca,
   1 cuotas,
   '600' moneda,
   MOVCOAM origen,
   MOVCOMER codsucursal,
   MOVDENO sucursal,
   a.SERCODI tipo,
      A.PRECODI PREAUT,
   MOVCODPR procesadora,
   MOVCODIS dispositivo,
   MOVESTA estado,
   MOVIDLT nroresumen,
   (CASE WHEN a.SERCODI = 'REDPAG' THEN MOVNETO ELSE movimpo END) importe,
   (CASE WHEN a.SERCODI = 'REDPAG' THEN 0 ELSE movimco END) comision,
   (CASE WHEN a.SERCODI = 'REDPAG' THEN 0 ELSE MOVIVCO END) ivacomision,
   MOVRENT renta,
   MOVIVREN ivarenta,
   MOVNETO NETO,
   MOVNETO AS neto_tclmov,
   COALESCE (g.TSBIMPO,x.TSBIMPO ) importe_transmisiones,
   MOVCDBCC codbanco,
   MOVCTBCC ctabanco,
   MOVCOCO porcencomision,
   COALESCE (date(g.tsbfeac),date(x.tsbfeac) ) fechaacreditacion,
   'LOTE' tipooperacion,
   COALESCE (OPCREREF,x.TSBNREF) ref_extracto,
   MOVIDLT ref_bepsa--,'QUERY_4' AS returnn
FROM GXFINDTA.TCLMOV a
INNER JOIN GXOPERA.OPMOVI b ON MOVRRNBEP = OPNOREF AND MOVFPRO = OPFECOM
LEFT JOIN GXOPERA.OPLICRE c ON MOVFPRO = OPCREFCOM AND MOVCOMER = OPCRECOM
LEFT JOIN GXFINDTA.TCLTSB g ON OPCREREF = g.TSBNREF
LEFT JOIN GXFINDTA.TCLTSB x ON MOVIDLT = x.TSBNREF
WHERE MOVFPRO between '20230101' AND '20231231'
  and MOVPGON = 'B'
  AND MOVRUC = '80094255-8'
  AND a.SERCODI = 'REDPAG'
UNION
/*Transacciones Aprobadas Batch = Creditos*/
 SELECT UPPER(MOVDESAM) ambito,MOVDSBCC BANCO_PAGADOR,x.TSBESTA ESTADO1, x.TSBCOME RETORNO, x.TSBDEME DESCRI_RETORNO,MOVRUC ruc,MOVRAZO RAZON_SOCIAL,MOVFCRE fecha_liquidacion,MOVHTRX hora, MOVFPRO fecha_proceso,
   MOVFTRX fechatrx,
   MOVRRNBEP nrotransaccion,
   (CASE WHEN MOVTPTA = 'D' THEN 'DEBITO' WHEN MOVTPTA = 'C' THEN 'CREDITO' WHEN MOVTPTA = 'E' THEN 'EFECTIVO' END) tipotarjeta,
   MOVCOAU autorizacion,
   MOVDESEM emisor,
   SUBSTR(MOVNTAR,1,6)||'XXXXXX'||SUBSTR(MOVNTAR,13,4) tarjeta,
   MOVMARC marca,
   1 cuotas,
   '600' moneda,
   MOVCOAM origen,
   MOVCOMER codsucursal,
   MOVDENO sucursal,
   a.SERCODI tipo,
      A.PRECODI PREAUT,
   MOVCODPR procesadora,
   MOVCODIS dispositivo,
   MOVESTA estado,
   MOVIDLT nroresumen,
   movimpo importe,
   movimco comision,
   MOVIVCO ivacomision,
   MOVRENT renta,
   MOVIVREN ivarenta,
   --(OPMONTO - (CASE WHEN trim(a.SERCODI) = 'COMPRA' THEN  (OPCOMENT + OPCOMBPS) ELSE 0 END) - (CASE WHEN trim(a.SERCODI) = 'COMPRA' THEN  (OPIVAENT + OPIVABPS) ELSE 0 END) - OPRENTA - OPREIVA) NETO,
   MOVNETO AS NETO,
   MOVNETO AS neto_tclmov,
   COALESCE (g.TSBIMPO, x.TSBIMPO) importe_transmisiones,
   MOVCDBCC codbanco,
   MOVCTBCC ctabanco,
   MOVCOCO porcencomision,
   COALESCE (date(g.tsbfeac),date(x.tsbfeac) ) fechaacreditacion,
   'LOTE' tipooperacion,
   COALESCE (OPCREREF,x.TSBNREF) ref_extracto,
   MOVIDLT ref_bepsa--,'QUERY_5' AS returnn
FROM GXFINDTA.TCLMOV a
LEFT JOIN LIBDEBITO.DRCONBEP d ON d.LERRNB = a.MOVRRNBEP
LEFT JOIN GXOPERA.OPLICRE c ON MOVFPRO = OPCREFCOM AND MOVCOMER = OPCRECOM
LEFT JOIN GXFINDTA.TCLTSB g ON OPCREREF = g.TSBNREF
LEFT JOIN GXFINDTA.TCLTSB x ON MOVIDLT = x.TSBNREF
WHERE MOVFPRO between '20230101' AND '20231231'
  and MOVPGON = 'B'
  AND MOVRUC = '80094255-8'
  AND a.SERCODI = 'COMPRA')
SELECT FECHATRX,HORA,
CASE WHEN TIPOOPERACION = 'LINEA' THEN FECHATRX ELSE FECHA_LIQUIDACION END FELIQUIDACION,
CODSUCURSAL comercio, SUCURSAL denominacion, RAZON_SOCIAL, RUC, TARJETA,TIPOTARJETA, ambito,EMISOR, IMPORTE, COMISION, IVACOMISION, RENTA, IVARENTA, NETO,
FECHAACREDITACION, TIPOOPERACION, ESTADO1 estado, RETORNO, DESCRI_RETORNO,TIPO, PREAUT AS DESCRIPCION,
NROTRANSACCION referencia, REF_EXTRACTO lote,AUTORIZACION, CTABANCO AS CTA_COMERCIO, SUBSTRING(CODBANCO, 1, 4) COD_BANCO, BANCO_PAGADOR
FROM tt;
---DESCRIPCION COMPRAS POR QR

/*Verificaci�n de Facturas Comercios CLaro (No Operadora)*/
SELECT SUBSTR(MOVFCRE, 1, 6)  PERIODO,
       MOVCODCLI,
       MOVCODSUC,
       MOVCOMER,
       MOVDENO,
       MOVTPTA,
       COUNT(*)               CANTIDAD,
       SUM(MOVIMPO)           TOTAL_IMPORTE,
       SUM(MOVIMCO)           COMISION,
       SUM(MOVIVCO)           IVA_COMISION,
       SUM(MOVIMCO + MOVIVCO) "COMISION+IVA",
       SUM(MOVNETO)           TOTAL_NETO
FROM GXFINDTA.TCLMOV
WHERE MOVFCRE BETWEEN '20240101' AND '20240131'
--WHERE MOVFPRO >= '20240101'
  AND MOVCODCLI = '11728'
GROUP BY SUBSTR(MOVFCRE, 1, 6), MOVCODCLI, MOVCODSUC, MOVCOMER, MOVDENO, MOVTPTA;

SELECT * FROM LIBDEBITO.DRCONBEP D WHERE D.LERRNB='406297740546';
SELECT * FROM GXFINDTA.TCLMOV T WHERE T.MOVIDLT='241020010707106';
SELECT * FROM GXFINDTA.TCLMOV T WHERE T.MOVRRNBEP='470209678447';

SELECT C.movrrnbep                                                                                                        Id_Transac,
       C.MOVFTRX                                                                                                          FECHA_TRANS,
       C.MOVFPRO                                                                                                          FECHA_PROCESO,
       C.MOVFCRE                                                                                                          FECHA_ACREDIT,
       C.MOVTPTA                                                                                                          TIPO_TARJ,
       SUM(C.MOVIMPO)                                                                                                     IMPORTE_TRANSAC,
       SUM(C.MOVIMCO)                                                                                                     IMPORTE_COMISION,
       SUM(C.MOVIVCO)                                                                                                     IVA_COMISION,
       SUM(c.MOVIVCO+C.MOVIMCO)                                                                                           TOTAL_COMISION,
       SUM(C.MOVRENT)                                                                                                     IMPORTE_RENTA,
       SUM(C.MOVIVREN)                                                                                                    IVA_RENTA,
       sum(C.MOVIMCO+C.MOVIVCO+C.MOVRENT+C.MOVIVREN)                                                                      TOTAL_DESCUENTO,
       SUM(C.MOVNETO)                                                                                                     IMPORTE_NETO,
        C.MOVCOMER
FROM GXFINDTA.TCLMOV C
--FROM FACTURACIONBEPSA.tclmov_tmp_comercios_202403_factcomercios C
--from FACTURACIONBEPSA.tclmov_tmp_operadoras_202403_factcomercios c
--FROM FACTURACIONBEPSA.tclmov_tmp_comercios_202403_factcomercios C
--FROM FACTURACIONBEPSA.tclmov_tmp_retail_202402_factcomercios C
--FROM TRUSTED_ZONE.GXFINDTA_TCLMOV_COMPLEMENTO C --COMPLEMENTO
--FROM FACTURACIONBEPSA.tclmov_tmp_comercios_202313_factcomercios C
--FROM FACTURACIONBEPSA.tclmov_tmp_comercios_202312_factcomercios c
--FROM FACTURACIONBEPSA.TCLMOV_TMP_COMERCIOS_202401_FACTCOMERCIOS C
--WHERE movopde=700605 --para operadoras
WHERE --C.MOVCODCLI IN (SELECT C.CLICLICOD FROM DATOS.GXFINDTA_TCMCLI C WHERE C.CLIRUC LIKE '%80030572%')
--AND C.MOVCODSUC=14 --NOT IN ('1', '8')
C.MOVFTRX BETWEEN '20240131' AND '20240128' AND MOVCODCLI = '21772'
--AND movcomer='5400327' --5400325  5400327
AND C.MOVCODSUC=18
GROUP BY c.movrrnbep, C.MOVFTRX, C.MOVFPRO, C.MOVFCRE, C.MOVTPTA, C.MOVCOMER
ORDER BY C.MOVFTRX, C.MOVFPRO, C.MOVFCRE;
--claro '20240301','20240331'
/*7800046- Diferencia Gs 89.661 || 17689,2 | 440612 | 530273 = 89.661 ref = 403083685997, 403083952019
7800045- Diferencia Gs 14.131   || 17689,1 | 610159 | 675399 = 4.224 ref. = 403083956625
7800047- Diferencia Gs 220.297  || 17689,3 | 2372347 | 2522860 = 150.513 ref. = 403084004726, 403083534024, 403083947691, 403083906977
*/

--incluir para facturar en abril --muni asu suc 18
SELECT *
FROM GXFINDTA.TCLMOV T
WHERE T.MOVRRNBEP IN ('405291941916', '405492608416', '405894948216');

SELECT * FROM GXFINDTA.TCLTSB T WHERE T.TSBIDOP=11133429;


SELECT T.MOVOPDE, T.*
FROM GXFINDTA.TCLMOV T
WHERE-- T.MOVIDLT='240020096900042'
 T.MOVOPDE = 700105
  AND T.SERCODI IN ('VTAMIN', 'PAGFAC')
  AND T.MOVFCRE BETWEEN '20240321' AND '20240420';

--('700405' --personal -- , '700105' -- tigo pre-paga -- , '700605' -- claro)

SELECT MOVOPOR OPERADORA, SUM(MOVIMPO) IMPORTE, SUM(MOVIMCO + MOVIVCO) "IVA+COMISION", SUM(MOVIMCO) COMISION, SUM(MOVIVCO) IVA_COMISION, SUM(MOVNETO) NETO
FROM GXFINDTA.TCLMOV
WHERE MOVOPOR IN ('700405', '700105', '700605')
  AND MOVFCRE BETWEEN '20240321' AND '20240420'
  AND (SERCODI IN ('PAGFAC', 'VTAMIN') AND PRECODI IN ('PFEW', 'PFTA', 'VTEP', 'VTEW', 'VTTA')
    AND MOVCODIS IN ('ATM', 'WEB', 'POS')) --('ATM', 'WEB', 'POS')
  AND MOVIVCO > 0
GROUP BY MOVOPOR;

SELECT *
FROM GXOPERA.OPMOVI O
         INNER JOIN GXFINDTA.TCLMOV T ON T.MOVRRNBEP = O.OPNOREF
         INNER JOIN GXFINDTA.TCLMOD T2 ON T.MOVIDMOV = T2.MOVIDMOV
WHERE O.OPIDTRA = '';

SELECT * FROM GXOPERA.OPMOVI O WHERE O.OPNOREF IN ('470209678447','470209703489');
SELECT * FROM GXWEB.OPMOVI O WHERE O.OPNOREF='470209678447';

SELECT O.OPNOREF,
    SUM(CASE WHEN MODTPPA = 'COME' THEN MODCOMI + MODCOIV ELSE 0 END) OPCOMI,
    SUM(CASE WHEN MODTPPA = 'EMIS' THEN MODCOMI ELSE 0 END) OPCOMENT,
    SUM(CASE WHEN MODTPPA IN ('BAPA', 'BEPS') THEN MODCOMI ELSE 0 END) OPCOMBPS,
    SUM(CASE WHEN MODTPPA = 'EMIS' THEN MODCOIV ELSE 0 END) OPIVAENT,
    SUM(CASE WHEN MODTPPA IN ('BAPA', 'BEPS') THEN MODCOIV ELSE 0 END) OPIVABPS
FROM GXOPERA.OPMOVI O
INNER JOIN GXFINDTA.TCLMOV T ON O.OPNOREF=T.MOVRRNBEP
INNER JOIN GXFINDTA.TCLMOD T2 ON T2.MOVIDMOV=T.MOVIDMOV
WHERE O.OPCODTRN='000054' AND O.OPIDTRA=''
GROUP BY O.OPNOREF;
--WHERE T.MOVRRNBEP IN ('470209678447');
-----update hapore
UPDATE GXOPERA.OPMOVI O
SET O.OPCOMI   = (SELECT SUM(CASE WHEN MODTPPA = 'COME' THEN MODCOMI + MODCOIV ELSE 0 END)
                  FROM GXOPERA.OPMOVI O2
                           INNER JOIN GXFINDTA.TCLMOV T ON O2.OPNOREF = T.MOVRRNBEP
                           INNER JOIN GXFINDTA.TCLMOD T2 ON T2.MOVIDMOV = T.MOVIDMOV
                  WHERE O2.OPNOREF = O.OPNOREF
                    AND O2.OPCODTRN = '000054'
                    AND O2.OPIDTRA = ''),
    O.OPCOMENT = (SELECT SUM(CASE WHEN MODTPPA = 'EMIS' THEN MODCOMI ELSE 0 END)
                  FROM GXOPERA.OPMOVI O2
                           INNER JOIN GXFINDTA.TCLMOV T ON O2.OPNOREF = T.MOVRRNBEP
                           INNER JOIN GXFINDTA.TCLMOD T2 ON T2.MOVIDMOV = T.MOVIDMOV
                  WHERE O2.OPNOREF = O.OPNOREF
                    AND O2.OPCODTRN = '000054'
                    AND O2.OPIDTRA = ''),
    O.OPCOMBPS = (SELECT SUM(CASE WHEN MODTPPA IN ('BAPA', 'BEPS') THEN MODCOMI ELSE 0 END)
                  FROM GXOPERA.OPMOVI O2
                           INNER JOIN GXFINDTA.TCLMOV T ON O2.OPNOREF = T.MOVRRNBEP
                           INNER JOIN GXFINDTA.TCLMOD T2 ON T2.MOVIDMOV = T.MOVIDMOV
                  WHERE O2.OPNOREF = O.OPNOREF
                    AND O2.OPCODTRN = '000054'
                    AND O2.OPIDTRA = ''),
    O.OPIVAENT = (SELECT SUM(CASE WHEN MODTPPA = 'EMIS' THEN MODCOIV ELSE 0 END)
                  FROM GXOPERA.OPMOVI O2
                           INNER JOIN GXFINDTA.TCLMOV T ON O2.OPNOREF = T.MOVRRNBEP
                           INNER JOIN GXFINDTA.TCLMOD T2 ON T2.MOVIDMOV = T.MOVIDMOV
                  WHERE O2.OPNOREF = O.OPNOREF
                    AND O2.OPCODTRN = '000054'
                    AND O2.OPIDTRA = ''),
    O.OPIVABPS = (SELECT SUM(CASE WHEN MODTPPA IN ('BAPA', 'BEPS') THEN MODCOIV ELSE 0 END)
                  FROM GXOPERA.OPMOVI O2
                           INNER JOIN GXFINDTA.TCLMOV T ON O2.OPNOREF = T.MOVRRNBEP
                           INNER JOIN GXFINDTA.TCLMOD T2 ON T2.MOVIDMOV = T.MOVIDMOV
                  WHERE O2.OPNOREF = O.OPNOREF
                    AND O2.OPCODTRN = '000054'
                    AND O2.OPIDTRA = '')
WHERE O.OPCODTRN = '000054'
  AND O.OPIDTRA = '';
------------------------------------------------------------------
Select movftrx fechatrx,  movrrnbep nrotransaccion, (CASE WHEN movtpta = 'D' THEN 'DEBITO' ELSE 'CREDITO' END)  tipotarjeta, movcoau Autorizacion, movdesem Emisor, substr(movntar,1,6)||'XXXXXX'||substr(movntar,13,4) tarjeta,
movmarc marca, 1 cuotas, '600' moneda,  movcoam origen, movcomer codsucursal, movdeno sucursal, a.sercodi tipo, movcodpr procesadora,
movcodis dispositivo, movesta estado, movidlt nroresumen, movimpo importe, (OPCOMENT+OPCOMBPS) COMISION, (OPIVAENT+OPIVABPS) IVACOMISION, OPRENTA RENTA, OPREIVA IVARENTA, (OPMONTO-OPCOMENT-OPCOMBPS-OPIVAENT-OPIVABPS-OPRENTA-OPREIVA) NETO,
MOVCDBCC CODBANCO, movctbcc CTABANCO, MOVCOCO PORCENCOMISION, substr(cast(varchar(tsbfeac) as char(10)),1,4)||substr(cast(varchar(tsbfeac) as char(10)),6,2)||substr(cast(varchar(tsbfeac) as char(10)),9,2) fechaacreditacion, (CASE WHEN MOVPGON= 'O'  THEN 'LINEA' WHEN  MOVPGON= 'B' THEN 'LOTE' ELSE 'PENDIENTE' END) TIPOOPERACION, tsbnref REF_EXTRACTO, tsbnref ref_bepsa
from gxfindta.tclmov a
inner join gxopera.opmovi b on movrrnbep = opnoref and MOVFPRO = OPFECOM and opstatus = 'A'
left join gxfindta.tcltsb c on movrrnbep = tsbnref and tsbtpop = '01'
WHERE MOVFPRO IN (SELECT FECANT FROM gxfindta.TCLFEC WHERE FECID= '001')
and movpgon = 'O' and MOVRUC = '80052468-3' and movesta = 'A'
UNION
/*Transacciones Reversadas Online*/
Select movftrx fechatrx,  movrrnbep nrotransaccion, (CASE WHEN movtpta = 'D' THEN 'DEBITO' ELSE 'CREDITO' END)  tipotarjeta, movcoau Autorizacion, movdesem Emisor, substr(movntar,1,6)||'XXXXXX'||substr(movntar,13,4) tarjeta,
movmarc marca, 1 cuotas, '600' moneda,  movcoam origen, movcomer codsucursal, movdeno sucursal, a.sercodi tipo, movcodpr procesadora,
movcodis dispositivo, movesta estado, movidlt nroresumen, movimpo importe, (OPCOMENT+OPCOMBPS) COMISION, (OPIVAENT+OPIVABPS) IVACOMISION, OPRENTA RENTA, OPREIVA IVARENTA, (OPMONTO-OPCOMENT-OPCOMBPS-OPIVAENT-OPIVABPS-OPRENTA-OPREIVA) NETO,
MOVCDBCC CODBANCO, movctbcc CTABANCO, MOVCOCO PORCENCOMISION, substr(cast(varchar(tsbfeac) as char(10)),1,4)||substr(cast(varchar(tsbfeac) as char(10)),6,2)||substr(cast(varchar(tsbfeac) as char(10)),9,2) fechaacreditacion, (CASE WHEN MOVPGON= 'O'  THEN 'LINEA' WHEN  MOVPGON= 'B' THEN 'LOTE' ELSE 'PENDIENTE' END) TIPOOPERACION, tsbnref REF_EXTRACTO, tsbnref ref_bepsa
from gxfindta.tclmov a
inner join gxopera.opmovi b on movrrnbep = opnoref and MOVFPRO = OPFECOM and opstatus = 'E'
left join gxfindta.tcltsb c on movrrnbep = tsbnref and tsbtpop = '03'
WHERE MOVFPRO IN (SELECT FECANT FROM gxfindta.TCLFEC WHERE FECID= '001')
and movpgon = 'O' and MOVRUC = '80052468-3' and movesta = 'R'
UNION
/*Transacciones Aprobadas Batch <> Red de pagos*/
Select movftrx fechatrx,  movrrnbep nrotransaccion, (CASE WHEN movtpta = 'D' THEN 'DEBITO' ELSE 'CREDITO' END)  tipotarjeta, movcoau Autorizacion, movdesem Emisor, substr(movntar,1,6)||'XXXXXX'||substr(movntar,13,4) tarjeta,
movmarc marca, 1 cuotas, '600' moneda,  movcoam origen, movcomer codsucursal, movdeno sucursal, a.sercodi tipo, movcodpr procesadora,
movcodis dispositivo, movesta estado, movidlt nroresumen,(Case when sercodi = 'DINEFE' THEN (OPMONTO-OPCOMENT-OPCOMBPS-OPIVAENT-OPIVABPS-OPRENTA-OPREIVA) ELSE movimpo END) importe, (CASE WHEN sercodi = 'DINEFE' THEN 0 ELSE (OPCOMENT+OPCOMBPS)END) COMISION,
(CASE WHEN sercodi = 'DINEFE' THEN 0 ELSE (OPIVAENT+OPIVABPS)END) IVACOMISION, OPRENTA RENTA, OPREIVA IVARENTA, (OPMONTO-OPCOMENT-OPCOMBPS-OPIVAENT-OPIVABPS-OPRENTA-OPREIVA) NETO,
MOVCDBCC CODBANCO, movctbcc CTABANCO, MOVCOCO PORCENCOMISION, movfcre fechaacreditacion, 'LOTE' TIPOOPERACION, opcreref REF_EXTRACTO, MOVIDLT ref_bepsa
from gxfindta.tclmov a
inner join gxopera.opmovi b on movrrnbep = opnoref and MOVFPRO = OPFECOM
left join gxopera.oplicre c on movfpro = opcrefcom and movcomer = opcrecom
WHERE MOVFPRO IN (SELECT FECANT FROM gxfindta.TCLFEC WHERE FECID= '001')
and movpgon = 'B' and MOVRUC = '80052468-3' AND SERCODI <> 'REDPAG'
UNION
/*Transacciones Aprobadas Batch = Red de pagos*/
Select movftrx fechatrx,  movrrnbep nrotransaccion, (CASE WHEN movtpta = 'D' THEN 'DEBITO' ELSE 'CREDITO' END)  tipotarjeta, movcoau Autorizacion, movdesem Emisor, substr(movntar,1,6)||'XXXXXX'||substr(movntar,13,4) tarjeta,
movmarc marca, 1 cuotas, '600' moneda,  movcoam origen, movcomer codsucursal, movdeno sucursal, a.sercodi tipo, movcodpr procesadora,
movcodis dispositivo, movesta estado, movidlt nroresumen,  (Case when sercodi = 'REDPAG' THEN OPMONTO  ELSE movimpo END) importe, (CASE WHEN sercodi = 'REDPAG' THEN 0 ELSE (OPCOMENT+OPCOMBPS)END) COMISION, (CASE WHEN sercodi = 'REDPAG' THEN 0 ELSE (OPIVAENT+OPIVABPS)END) IVACOMISION, OPRENTA RENTA, OPREIVA IVARENTA, OPMONTO NETO,
MOVCDBCC CODBANCO, movctbcc CTABANCO, MOVCOCO PORCENCOMISION, movfcre fechaacreditacion, 'LOTE' TIPOOPERACION, opcreref REF_EXTRACTO, MOVIDLT ref_bepsa
from gxfindta.tclmov a
inner join gxopera.opmovi b on movrrnbep = opnoref and MOVFPRO = OPFECOM
left join gxopera.oplicre c on movfpro = opcrefcom and movcomer = opcrecom
WHERE MOVFPRO IN (SELECT FECANT FROM gxfindta.TCLFEC WHERE FECID= '001')
and movpgon = 'B' and MOVRUC = '80052468-3' AND SERCODI = 'REDPAG';

SELECT * FROM LIBDEBITO.DRCONBEP D WHERE D.LERRNB='428588798138';

SELECT * FROM GXFINDTA.TCMTIF GT WHERE GT.CLICLICOD=10879;
SELECT * FROM
GXBDBPS.AUTARAF WHERE ATFEREA >='20241014';

SELECT * FROM LIBDEBITO.LINPORTA t WHERE LNUMER='971873921';
--0971873921
--0 985710199
SELECT /*USUCODCAT ID, USUAIDCAT CI, USUCOCOMER COMERCIO, USUNOMCAT NOMBRE, USUESTCAT CATEGORIA,
USUTELCAT TELEFONO, TUSRID TIPOUSUARIO, USUPASSCAT PASS, USUADMCAT CODCAJERO,
USUCORUCCAT RUC, USUCAMBPASCAT NECESITACAMBIARPASS*/ *
FROM GXWEB.USUCAT L
WHERE l.USUTELCAT = '0971873921';
SELECT * FROM GXBDBPS.COMAEAF C2 WHERE C2.COCOMER='4300051';
SELECT * FROM GXBDBPS.COMAEXD C2 WHERE C2.COCOMER='4300051';

SELECT * FROM GXFINDTA.TCLMOV T WHERE T.MOVRRNBEP='419952092097';

    DELETE  FROM VISA.NRT_RRN_EX c where NRTLOGFECH='2024-10-07'
AND NRTLOGHORA BETWEEN '00:14:34' AND  '02:03:33';


    SELECT DATA_QUEUE_LIBRARY, DATA_QUEUE_NAME , MAXIMUM_MESSAGE_LENGTH, CURRENT_MESSAGES
FROM QSYS2.DATA_QUEUE_INFO WHERE DATA_QUEUE_NAME LIKE '%ACFIREC%';

SELECT d.DEPID, d.DEPFECH, d.DEPMONTO, d.DEPFORPAG, d.DEPNROBOL, d.DEPCOM, d.DEPCITIT, d.DEPNOMTITU, d.DEPUSUID, d.DEPUSU,
      d.DEPFECHA, d.DEPHORA, d.DEPESTADO, d.DEPUSUCONF, d.DEPFECHCONF, d.DEPPRODUC, d.DEPBANCO, d.DEPNROASI, d.DEPCTABCO, CLICLICOD, SUCSUCCOD, CNACTAMAD
FROM GXWEB.DEPCICO d
--LEFT JOIN GXFINDTA.TCOCNA tc ON TRIM(d.DEPCOM) = TRIM(tc.COCOMER)
      WHERE d.DEPID = 7982
LEFT JOIN GXFINDTA.TCOCNA tc ON TRIM(d.DEPCOM) = TRIM(tc.COCOMER)
      LIMIT 1;

SELECT COUNT(*)  FROM VISA.LOGCNV02A
       WHERE DATE (FECHA)<= '2024-10-01';

SELECT * FROM GXFINDTA.TCLTSB T WHERE TSBIDOP IN (10992284, 13775615);
SELECT * FROM GXFINDTA.TCLTSB T WHERE TSBIDOP IN (13762526,12753117);
SELECT * FROM GXFINDTA.TCLTSB T WHERE TSBIDOP IN (11449669,13549000);
SELECT * FROM GXFINDTA.TCLTSB T WHERE TSBIDOP IN (12753145,13714404);
SELECT * FROM GXFINDTA.TCLTSB T WHERE TSBIDOP IN (11277458,13659495);
SELECT * FROM GXFINDTA.TCLTSB T WHERE TSBIDOP IN (12753172,13720648);
SELECT * FROM GXFINDTA.TCLTSB T WHERE --T.TSBNREF='422763945761';
DATE (TSBFEGE)>='2024-10-01' AND TSBTPOACR='O' AND TSBCOCO='0800833';

DELETE  FROM VISA.NRT_RRN_EX c where NRTLOGFECH='2024-10-21'
AND NRTLOGHORA BETWEEN '00:14:47' AND  '08:03:05' ;

-
SELECT DATA_QUEUE_LIBRARY, DATA_QUEUE_NAME , MAXIMUM_MESSAGE_LENGTH, CURRENT_MESSAGES
FROM QSYS2.DATA_QUEUE_INFO WHERE DATA_QUEUE_NAME LIKE '%ACFIREC%';

----COMERCIOS_WEB
SELECT * GXBDCON.GXLOFUN;
SELECT * FROM GXDEBITO.JRNCOMAEAF J;
SELECT * FROM GXDEBITO.JRNCOMAEXD J;

SELECT * FROM QUSRTOOLS.HSMMSGRETC;


SELECT  COUNT(*)
FROM GXBDBPS.TSWAUT WHERE AUTTRXFCHC='20241016';


