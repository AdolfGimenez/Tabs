-------------api pagos casos
--verifica
SELECT * FROM GXTRJDTA.TDSDTF t WHERE TFSTPARCH IN ('G', 'M')
ORDER BY DTFFHULTUP DESC LIMIT 10;
--corrige
UPDATE GXTRJDTA.TDSDTF
SET  DTFESTADOL='S'
WHERE SPRIDSEG=4539679 AND TFSTPARCH='G' AND DTFNROLIN=1 AND DTFAGRUP=1 AND DTFSECAGRU=1;

DELETE FROM GXTRJDTA.TDSDTE
WHERE SPRIDSEG=4539679 AND TFSTPARCH='G' AND DTFNROLIN=1 AND DTFAGRUP=0 AND DTFSECAGRU=0 AND DTESECERRO=1;
---verfiica by sexar
WITH ttap AS
(SELECT x.CMEMOVANT secuencia , MEPIDMOV idmov,k.TCADSTCARG cargo, MEPDSCMOV descmov, ENTCODENT entidad, MEPIDCTA cuenta,
LEFT(trim(MEPNROTRJ),6)||'XXXXXX'||right(trim(MEPNROTRJ),4) trj,
MEPIMPORT importe,
MEPFCHPRO fechapro, MEPFHULTUP ,MEPNROCOMP macthid
FROM GXTRJDTA.TMOMEP t JOIN GXTRJDTA.TCOCME x ON x.CMEMOVACT = t.MEPIDMOV
JOIN GXTRJDTA.TDGTCA k ON k.TCAIDTCARG = t.TCAIDTCARG
LEFT JOIN GXBDBPS.TMOVIAF s ON x.CMEMOVANT = s.MVSECUE
WHERE s.MVSECUE IS NULL  and
 t.MEPFCHPRO = '${fechcomer}')
, ttrev AS
(SELECT x.CMEMOVANT secuencia, MEPIDMOV idmov,k.TCADSTCARG cargo, MEPDSCMOV descmov, ENTCODENT entidad, MEPIDCTA cuenta,
LEFT(trim(MEPNROTRJ),6)||'XXXXXX'||right(trim(MEPNROTRJ),4) trj,
MEPIMPORT importe,
MEPFCHPRO fechapro, MEPFHULTUP ,MEPNROCOMP macthid
FROM GXTRJDTA.TMOMEP t JOIN GXTRJDTA.TCOCME x ON x.CMEMOVACT = t.MEPIDMOV
JOIN GXTRJDTA.TDGTCA k ON k.TCAIDTCARG = t.TCAIDTCARG
LEFT JOIN GXBDBPS.TMOVIAF s ON x.CMEMOVANT = s.MVSECUE
WHERE s.MVSECUE IS NULL and
 t.MEPFCHPRO = '${fechcomer}')
SELECT y.SECUENCIA, y.IDMOV, y.CARGO, y.DESCMOV,ENTNMENTID ENTIDAD, y.CUENTA, y.TRJ, y.IMPORTE, y.FECHAPRO, y.MEPFHULTUP, y.MACTHID  FROM ttap y
LEFT JOIN ttrev x ON trim(x.macthid) = trim(y.macthid)
LEFT JOIN GXTRJDTA.tdgent l ON l.ENTCODENT = y.ENTIDAD
--WHERE x.macthid IS NULL
UNION
SELECT x.SECUENCIA, x.IDMOV, x.CARGO, x.DESCMOV,ENTNMENTID ENTIDAD, x.CUENTA, x.TRJ, x.IMPORTE, x.FECHAPRO, x.MEPFHULTUP, x.MACTHID  FROM ttrev x
LEFT JOIN ttap y ON trim(x.macthid) = trim(y.macthid)
LEFT JOIN GXTRJDTA.tdgent l ON l.ENTCODENT = x.ENTIDAD;

--- CASO 3DS | cybersource
SELECT LHORTR, LCRETR, LESTTR, a.*
FROM LIBDEBITO.drconbep a
WHERE LFECTR = 20241016 AND LIDCOM 5500339 AND LHISDE <> 'CYBERS' AND a.LCODBC = 'MST'
ORDER BY rrn(a) DESC;

SELECT LFECTR, LCRETR, LBINPR, COUNT(*)
FROM LIBDEBITO.drconbep a
WHERE LFECTR= 20241025 AND LIDCOM = 5500339 AND LHISDE <> 'CYBERS' AND a.LCODBC = 'MST'
GROUP BY LFECTR, LCRETR, LBINPR
ORDER BY LFECTR, LCRETR, LBINPR ;

---- saldo mov.
SELECT M.MTNUMTA NROTARJETA, M.MVCODRE TIPOTRANSACCION, M.MVFEREA FECHAOPERACION, M.MVFEPRO FECHAPROCESO, M.MVCUPON NROCUPON,
       M.MVNOMCO DESCRIPCION, CASE WHEN M.MVTIPOT = 'C' THEN  M.MVIMPO2*-1 ELSE M.MVIMPO2 END IMPORTEMOVIMIENTO, 0 CANTIDADCUOTAS
FROM GXBDBPS.TMOVIAF M
WHERE M.CMCODIG IN (SELECT MF.CMCODIG FROM GXBDBPS.TCMOVAF MF WHERE MF.CMEXTRA = 'S') AND M.MVCODRE = 0
AND M.mvnumct = ? AND M.MVEMISO IN (select E.ENCENTANT from gxtrjdta.TCOENC E WHERE E.ENCENTACT = ?) AND M.MVAFINI = ? AND M.MVFEPRO > ?

SELECT C.MTNUMTA NROTARJETA, '0' TIPOTRANSACCION, C.CUFEREA FECHAOPERACION, C.CUFECOM FECHAPROCESO, C.CUCODAU NROCUPON,
       C.CUNOMCO DESCRIPCION, C.CUIMPOR IMPORTEMOVIMIENTO, C.CUCANCU  CANTIDADCUOTAS
FROM GXBDBPS.TCUOTAF C
WHERE C.CMCODIG IN (SELECT F.CMCODIG FROM GXBDBPS.TCMOVAF F WHERE F.CMEXTRA = 'S')
AND C.CUNUMCT = ? AND C.CUEMISO IN (select E.ENCENTANT from gxtrjdta.TCOENC E WHERE E.ENCENTACT = ?) AND C.CUAFINI = ? AND C.CUFECOM > ?

SELECT P.MTNUMTA NROTARJETA, P.APSTATS TIPOTRANSACCION, P.APFEREA FECHAOPERACION, P.APFECOM FECHAPROCESO, P.APCODAU NROCUPON,
       P.APNOMCO DESCRIPCION, P.APIMPOR IMPORTEMOVIMIENTO, P.APCANCU CANTIDADCUOTAS
FROM GXBDBPS.TAUTPAF P
WHERE P.CMCODIG IN (SELECT F.CMCODIG FROM GXBDBPS.TCMOVAF F WHERE F.CMEXTRA = 'S') AND P.APSTATS = 'P'
AND P.APNUMCT = ? AND P.APEMISO IN (select E.ENCENTANT from gxtrjdta.TCOENC E WHERE E.ENCENTACT = ?) AND P.APAFINI = ? AND P.APFECOM > ?

---sara saldo mov.
SELECT
    M.MVFEPRO, M.MTNUMTA NROTARJETA, M.MVCODRE TIPOTRANSACCION, M.MVFEREA FECHAOPERACION, M.MVFEPRO FECHAPROCESO, M.MVCUPON NROCUPON,
    M.MVNOMCO DESCRIPCION, CASE WHEN M.MVTIPOT = 'C' THEN  M.MVIMPO2*-1 ELSE M.MVIMPO2 END IMPORTEMOVIMIENTO, 0 CANTIDADCUOTAS
FROM GXBDBPS.TMOVIAF M
WHERE M.CMCODIG IN (SELECT MF.CMCODIG FROM GXBDBPS.TCMOVAF MF WHERE MF.CMEXTRA = 'S') AND M.MVCODRE = 0
AND M.mvnumct = 155040004295 AND M.MVEMISO IN (select E.ENCENTANT from gxtrjdta.TCOENC E WHERE E.ENCENTACT = 9000)
  AND M.MVAFINI = '001' AND M.MVFEPRO > '20240619';

--verifica fecha cierre de la gourmet
SELECT MAX(AFFECIE) AS FECHA
FROM GXBDBPS.TCIERAF X
WHERE X.ENEMISO IN (SELECT A.ENCENTANT FROM GXTRJDTA.TCOENC A WHERE A.ENCENTACT = 9000)
  AND X.AFAFINI = '001' AND X.BIBINES = '627431'
  AND TO_DATE(X.AFFECIE, 'YYYYMMDD') < current_date;

---pruebas .war_ inserts
INSERT INTO GXTRJDTA.TDSDWS (PWSIDWEBS,    DWSSECUE, DWSIPSERWS, ENTCODENT, DWSCLIENTE, DWSSUCUR, PWSUSUHAB, DWSUSULTUP,   DWSFHULTUP       )
VALUES  ('ABMCREDWS ', 7,        'IP',       1020,      0,          1,        'USUARIO', CURRENT USER, CURRENT TIMESTAMP),
        ('ABMDEBWS  ', 3,        'IP',       1020,      0,          1,        'USUARIO', CURRENT USER, CURRENT TIMESTAMP),
        ('ACCTACREWS', 5,        'IP',       1020,      0,          1,        'USUARIO', CURRENT USER, CURRENT TIMESTAMP),
        ('ACTARCREWS', 5,        'IP',       1020,      0,          1,        'USUARIO', CURRENT USER, CURRENT TIMESTAMP),
        ('CONFECPRO ', 2,        'IP',       9000,      0,          0,        'USUARIO', CURRENT USER, CURRENT TIMESTAMP),
        ('FIDCONSAL ', 5,        'IP',       1020,      0,          0,        'USUARIO', CURRENT USER, CURRENT TIMESTAMP),
        ('MOVESPWS  ', 10,       'IP',       1040,      0,          1,        'USUARIO', CURRENT USER, CURRENT TIMESTAMP),
        ('PAGOSWS   ', 5,        'IP',       1020,      0,          1,        'USUARIO', CURRENT USER, CURRENT TIMESTAMP),
        ('RcpSipapWS', 4,        'IP',       1020,      0,          1,        'USUARIO', CURRENT USER, CURRENT TIMESTAMP),
        ('RNVANTCRD ', 2,        'IP',       1020,      0,          1,        'USUARIO', CURRENT USER, CURRENT TIMESTAMP),
        ('TARJREGCRE', 3,        'IP',       1020,      0,          1,        'USUARIO', CURRENT USER, CURRENT TIMESTAMP),
        ('TARJREIDEB', 3,        'IP',       1020,      0,          1,        'USUARIO', CURRENT USER, CURRENT TIMESTAMP),
        ('WSJVTRJ004', 4,        'IP',       1020,      0,          1,        'USUARIO', CURRENT USER, CURRENT TIMESTAMP),
        ('WSJVTRJ007', 3,        'IP',       1020,      0,          1,        'USUARIO', CURRENT USER, CURRENT TIMESTAMP),
        ('WSJVTRJ008', 4,        'IP',       1020,      0,          1,        'USUARIO', CURRENT USER, CURRENT TIMESTAMP),
        ('WSJVTRJ010', 3,        'IP',       1020,      0,          1,        'USUARIO', CURRENT USER, CURRENT TIMESTAMP);