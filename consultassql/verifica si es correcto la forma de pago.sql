--***********************************************************************************************************************
--*************************VERIFICA SI ES CORRECTO LA FORMA DE PAGO******************************************************
--***********************************************************************************************************************
--Descripcion : algunos movientos registran formas de pago incorrectas
Select A.*, CASE WHEN B.TSBIDOP IS NULL  THEN 'NO' ELSE 'SI' END AS EXISTE_EN_TCLTSB  from
   (
    SELECT
             MOVRRNBEP,
             MOVPGON,
             CASE WHEN SECCOTRX IS NULL THEN 'BATCH' ELSE 'ONLINE' END AS VERIFICACION,
             Substr (A.MOVNTAR,1,6) as BIN,
             SUBSTR(A.MOVCODEM,1,4) as EMISOR_ID,
             MOVDESEM AS EMISOR_DES,
             MOVCDBCC AS BANCO_COMERCIO_ID,
             MOVDSBCC AS BANCO_COMERCIO_DESC
    FROM (SELECT A.MOVRRNBEP,
                 A.SERCODI,
                 A.PRECODI,
                 A.MOVPGON,
                 A.MOVFCRE,
                 b.PRECOTRX,
                 A.MOVICA,
                 A.MOVCODEM,
                 C.ENCENTANT,
                 A.MOVCDBCC,
                 A.MOVNTAR,
                 A.MOVDESEM,
                 A.MOVDSBCC
          FROM GXFINDTA.TCLMOV AS A
            INNER JOIN gxfindta.tclpre AS B
                    ON A.SERCODI = B.SERCODI
                   AND A.PRECODI = B.PRECODI
            INNER JOIN GXTRJDTA.TCOENC AS C ON C.ENCENTROL = A.MOVCDBCC
          WHERE MOVRRNBEP IN (
'218272682679',
'218272770983',
'218273100691',
'218500129431',
'218500129427',
'219175986422',
'218875287327',
'218875269640',
'218875327098',
'218875287189',
'218875287305',
'218875269685'
              )
            )
           AS A
      LEFT JOIN gxopera.TCLSEC AS B
             ON A.PRECOTRX = B.SECCOTRX
            AND Substr (SECENBIN,1,6) = Substr (A.MOVNTAR,1,6)
            AND ENCENTANT = SECCOBCO
            AND SUBSTR(A.MOVCODEM,1,4) = SUBSTR(B.SECCEMN,1,4)
            )
AS A      
LEFT JOIN GXFINDTA.TCLTSB AS B  ON B.TSBNREF = A.MOVRRNBEP  ;

--**************************************************************************************************************
--**************************************************************************************************************
-- ARMAR LLAMANDO A PCLR028
   --**Este programa carga en transacciones las operaciones Online
SELECT * FROM
(SELECT CONCAT('CALL PGM(GXFINPGM/PCLR028) PARM',(CONCAT ((CONCAT ((CONCAT ((CONCAT ((CONCAT (CONCAT ('("',OPIDLIQ),'" "')),AUTRRNBEP)),'" "')),AUTTRXFCHC)),'")'))) AS LLAMADO
FROM (SELECT OPIDLIQ,
             AUTTRXFCHC,
             AUTRRNBEP
      FROM GXBDBPS.TSWAUT AS A
        LEFT JOIN GXOPERA.OPLIQUI AS B ON A.AUTRRNBEP = B.OPNROREF
      WHERE AUTRRNBEP IN (
    '218272682679',
'218272770983',
'218875327098'
      )));
--**************************************************************************************************************
--**************************************************************************************************************


select * from gxbdbps.tdmov



SELECT * FROM GXBDBPS.TSWAUT t2 WHERE SUBSTRING(t2.AUTENTROL,1,4)  = '1020' AND t2.AUTCODSER = 'COMPRA' AND t2.AUTENTADM like '1020%'


select * from qgpl.brelac where WHFNAM like '%PAGOSTC%'

select * from qgpl.brelac where whpnam like '%TR200R%'
