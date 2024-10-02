---masivo
SELECT * --sum(TSBIMPO)
FROM GXFINDTA.TCLTSB
WHERE DATE (TSBFEGE) = '2022-11-22'
AND TSBCOME ='040'
AND TSBTPOP='01'
AND TSBDEME = 'ID DE TRANSFERENCIA EXISTENTE ';
----------------------------------------------------------------------------------------------------------------------------
SELECT TSBCOME,
TSBDEME
 FROM GXFINDTA.TCLTSB
WHERE DATE(TSBFEGE) = '2022-08-13'
GROUP BY TSBCOME,TSBDEME;
----------------------------------------------------------------------------------------------------------------------------
--Aldo Ayala
SELECT PFDVALCHR1 AS TSBCOME FROM  GXFINDTA.ITCLPFD WHERE PFDIDGRUP = 'RTNDTLITEM';
----------------------------------------------------------------------------------------------------------------------------
----tabla de codigos retorno trasmisiones
SELECT * FROM GXFINDTA.TDSCOE where COEEINDES LIKE '%ERROR%';
Select coecodent,coecodein, COEEINDES, COEESTADO from gxfindta.tdscoe where COECODENT = 1020;
----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------Pasar a AnuladO
----------------------------------------------------------------------------------------------------------------------------
/*Se anula como se solicita*/
UPDATE gxfindta.tcltsb
   SET tsbesta = 'AN',
       tsbdeme = 'ANULADO',
       tsbmotivo = 'P.MANUALMENTE-#'
WHERE tsbnref IN ();
-----------------------------------------------------------------------------------
-------verificar por fechas
SELECT DATE (TSBFEGE),TSBESTA,TSBDEME,count(*)
FROM gxfindta.TCLTSB
WHERE DATE (TSBFEGE) >= '2022-07-27'
and TSBCOME = '040'
Group by DATE (TSBFEGE),TSBESTA,TSBDEME;
----------------------------------------------------------------------------------------------------------------------------
--lsito si es gnb por paquete de 25
--updates para pasar a pendientes y que se reintenten
UPDATE gxfindta.tcltsb
   SET tsbesta = 'PE',
       tsbmotivo = 'REINTENTO NROR #35953 - 20220808'
WHERE DATE (TSBFEGE) in( '2022-08-06', '2022-08-07')
AND TSBCOME = '040' 
AND TSBDEME = 'ID DE TRANSFERENCIA EXISTENTE ';
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/**Para DATOS NO CORRESP. A LA CTA.*/
-------------------------------
UPDATE GXFINDTA.TCLTSB
   SET TSBESTA = 'RV',
       TSBCOME = '033',
       TSBDEME = 'DATOS NO CORRESPONDEN A CTA',
       TSBMOTIVO = 'REDMINE#';
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/**Para ENVIADO A BCP*/
-------------------------------
UPDATE GXFINDTA.TCLTSB
   SET TSBESTA = 'EN',
       TSBCOME = '001',
       TSBDEME = 'ENVIADO A BCP',
       TSBMOTIVO = 'REDMINE#';
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/**Para OTROS*/
-------------------------------
UPDATE GXFINDTA.TCLTSB
   SET TSBESTA = 'RV',
       TSBCOME = '035',
       TSBDEME = 'OTROS',
       TSBMOTIVO = 'REDMINE#';
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/**Para POLITICA INTERNA*/
-------------------------------
UPDATE GXFINDTA.TCLTSB
   SET TSBESTA = 'RV',
       TSBCOME = '146',
       TSBDEME = 'POLITICA INTERNA',
       TSBMOTIVO = 'REDMINE#';
---------------------------------
UPDATE GXFINDTA.TCLTSB
   SET TSBESTA = 'RV',
       TSBCOME = '036',
       TSBDEME = 'POLITICA INTERNA',
       TSBMOTIVO = 'REDMINE#';
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/**Para ACREDITADOS*/
-------------------------------
UPDATE GXFINDTA.TCLTSB
   SET TSBESTA   = 'AC',
       TSBCOME   = '002',
       TSBDEME   = 'ACREDITADO',
       TSBMOTIVO = 'REDMINE#';
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/**Para ENVIADO A BCP*/
-------------------------------
UPDATE GXFINDTA.TCLTSB
   SET TSBESTA = 'EN',
       TSBCOME = '001',
       TSBDEME = 'ENVIADO A BCP',
       TSBMOTIVO = 'REDMINE#';
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/**Para ERROR INTERNO*/
-------------------------------
UPDATE GXFINDTA.TCLTSB
   SET TSBESTA = 'ER',
       TSBCOME = '099',
       TSBDEME = 'ERROR INTERNO',
       TSBMOTIVO = 'REDMINE#';
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/**Para ERROR TIMEOUT BENEFICIARIO*/
-------------------------------
UPDATE GXFINDTA.TCLTSB
   SET TSBESTA = 'ER',
       TSBCOME = '202',
       TSBDEME = 'TIME OUT BANCO DESTINO',
       TSBMOTIVO = 'REDMINE#';
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/**Para POLITICA INTERNA*/
-------------------------------
UPDATE GXFINDTA.TCLTSB
   SET TSBESTA = 'RV',
       TSBCOME = '146',
       TSBDEME = 'POLITICA INTERNA',
       TSBMOTIVO = 'REDMINE#';
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
UPDATE GXFINDTA.TCLTSB
   SET TSBESTA = 'EN',
       TSBCOME = '001',
       TSBDEME = 'ENVIADO A BCP',
       TSBMOTIVO = 'REDMINE#';
----------------------------------------------------------------------------------------------------------------------
--Sentencias para cambiar a CUENTA INACTIVA
----------------------------------------------------------------------------------------------------------------------
UPDATE GXFINDTA.TCLTSB
   SET TSBESTA = 'RE',
       TSBCOME = '009',
       TSBDEME = 'CUENTA INACTIVA',
       TSBMOTIVO = 'REDMINE#';
----------------------------------------------------------------------------------------------------------------------
--Sentencias para cambiar a MONTO SUPERA LIMITE CTA BASICA
----------------------------------------------------------------------------------------------------------------------
UPDATE GXFINDTA.TCLTSB
   SET TSBESTA = 'RE',
       TSBCOME = '027',
       TSBDEME = 'MONTO SUPERA LIMITE CTA BASICA',
       TSBMOTIVO = 'REDMINE#3';
----------------------------------------------------------------------------------------------------------------------
UPDATE GXFINDTA.TCLTSB
   SET TSBESTA = 'RV',
       TSBCOME = '120',
       TSBDEME = 'NUMERO DE CUENTA INVALIDA',
       TSBMOTIVO = 'REDMINE#';
----------------------------------------------------------------------------------------------------------------------
UPDATE GXFINDTA.TCLTSB
   SET TSBESTA   = 'RE',
       TSBCOME   = '014',
       TSBDEME   = 'SIN SALDO DISPONIBLE - ORD',
       TSBMOTIVO = 'REDMINE#'
WHERE TSBIDOP;
----------------------------------------------------------------------------------------------------------------------
UPDATE GXFINDTA.TCLTSB
   SET TSBESTA   = 'RV',
       TSBCOME   = '147',
       TSBDEME   = 'TIPO O DOCUMENTO INVALIDO',
       TSBMOTIVO = 'REDMINE#'
WHERE TSBIDOP;
----------------------------------------------------------------------------------------------------------------------
UPDATE GXFINDTA.TCLTSB
   SET TSBESTA   = 'RV',
       TSBCOME   = '126',
       TSBDEME   = 'CUENTA ACREEDOR CERRADA',
       TSBMOTIVO = 'REDMINE#'
WHERE TSBIDOP;
----------------------------------------------------------------------------------------------------------------------
UPDATE GXFINDTA.TCLTSB
   SET TSBESTA   = 'RV',
       TSBCOME   = '122',
       TSBDEME   = 'CUENTA ACREEDOR INVALIDA',
       TSBMOTIVO = 'REDMINE#';
----------------------------------------------------------------------------------------------------------------------
UPDATE GXFINDTA.TCLTSB
   SET TSBESTA   = 'RE',
       TSBCOME   = '030',
       TSBDEME   = 'DOC/TIPO NO COINCIDE CON BCP',
       TSBMOTIVO = 'REDMINE#';
----------------------------------------------------------------------------------------------------------------------
UPDATE GXFINDTA.TCLTSB
   SET TSBESTA   = 'RE',
       TSBCOME   = '119',
       TSBDEME   = 'SISTEMA EN CIERRE',
       TSBMOTIVO = 'REDMINE#';
----------------------------------------------------------------------------------------------------------------------
UPDATE GXFINDTA.TCLTSB
   SET TSBESTA   = 'RV',
       TSBCOME   = '123',
       TSBDEME   = 'CUENTA CERRADA',
       TSBMOTIVO = 'REDMINE#';
----------------------------------------------------------------------------------------------------------------------
UPDATE GXFINDTA.TCLTSB
   SET TSBESTA   = 'RV',
       TSBCOME   = '141',
       TSBDEME   = 'RAZON NO ESPECIFICADA PROP',
       TSBMOTIVO = 'REDMINE#';
----------------------------------------------------------------------------------------------------------------------
UPDATE GXFINDTA.TCLTSB
   SET TSBESTA   = 'RV',
       TSBCOME   = '142',
       TSBDEME   = 'OPERACION PROHIBIDA TIPO CTA',
       TSBMOTIVO = 'REDMINE#';
----------------------------------------------------------------------------------------------------------------------
UPDATE GXFINDTA.TCLTSB
   SET TSBESTA   = 'RV',
       TSBCOME   = '125',
       TSBDEME   = 'CUENTA BLOQUEADA',
       TSBMOTIVO = 'REDMINE#';
