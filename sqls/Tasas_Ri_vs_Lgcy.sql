WITH COMAEXD AS (SELECT TT.SERCODI, CV.CLICLICOD, CV.SUCSUCCOD, C2.*
                 FROM GXBDBPS.COMAEXD C2
                          JOIN      (SELECT C.CLICLICOD, C.SUCSUCCOD, (C.COCOMER) COCOMER
                                     FROM GXFINDTA.TCOCNA C
                                     WHERE SUBSTRING(C.COCOMER, 1, 2) NOT IN ('80', '85', '45', '81', '86')
                                       AND SUBSTRING(C.COCOMER, 1, 2) < '87'
                                       AND (C.CNADENCOM NOT LIKE '%ECOM_B.P-%' AND
                                            C.CNADENCOM NOT LIKE '%LINK-%' AND
                                            C.CNADENCOM NOT LIKE '%D.A-%')
                                     GROUP BY C.CLICLICOD, C.SUCSUCCOD, (C.COCOMER)) CV
                                    ON C2.COCOMER = CV.COCOMER
                          LEFT JOIN GXFINDTA.TCLSER TT ON TT.SERSECU = C2.BPSSRVCOD
                     AND TT.SERCODI != 'WEQR'
                 WHERE C2.BPSSRVCOD IN ('16', '17')
                   AND CCFCHDES = (SELECT MAX(C3.CCFCHDES)
                                   FROM GXBDBPS.COMAEXD C3
                                   WHERE C2.COCOMER = C3.COCOMER
                                     AND C2.BPSSRVCOD = C3.BPSSRVCOD
                                     AND C2.CCMARCA = C3.CCMARCA
                                     AND C2.CCMAROR = C3.CCMAROR
                                     AND C2.CCMARPR = C3.CCMARPR
                                     AND C2.CCTIPTA = C3.CCTIPTA)),
     TCMSTS  AS (SELECT *
                 FROM GXFINDTA.TCMSTS T
                 WHERE T.SERCODI IN ('ECOM', 'DEBAUT')
                   AND T.STSFCHVIG = (SELECT MAX(T2.STSFCHVIG)
                                      FROM GXFINDTA.TCMSTS T2
                                      WHERE T2.CLICLICOD = T.CLICLICOD
                                        AND T2.SUCSUCCOD = T.SUCSUCCOD
                                        AND T2.SERCODI = T.SERCODI
                                        AND T2.STSMON = T.STSMON
                                        AND T2.STSTPUSO = T.STSTPUSO
                                        AND T2.STSORGTRX = T.STSORGTRX
                                        AND T2.STSMARCA = T.STSMARCA
                                        AND T2.STSPROD = T.STSPROD
                                        AND T2.STSTPPLS = T.STSTPPLS
                                        AND T2.PRECODI = T.PRECODI
                                        AND T2.STSDIS = T.STSDIS
                                        AND T2.STSTIPCOM = T.STSTIPCOM)),
     VERSUS  AS (SELECT D.CCMTASA -
                        C.STSVALCOM DIFERENCIA,
                        D.CCMTASA,
                        C.STSVALCOM,
                        D.CLICLICOD,
                        D.SUCSUCCOD,
                        D.CCMARCA   MARCA,
                        D.CCMAROR   AMBITO,
                        D.CCMARPR   PRODUCTO,
                        D.CCTIPTA   TIPO_TARJETA,
                        D.SERCODI
                 FROM COMAEXD D
                          LEFT JOIN TCMSTS C
                                    ON D.CLICLICOD = C.CLICLICOD
                                        AND D.SUCSUCCOD = C.SUCSUCCOD
                                        AND COALESCE(D.SERCODI, 'XXX') = COALESCE(C.SERCODI, 'XXX')
                                        AND COALESCE(D.CCMARCA, 'XXX') = COALESCE(C.STSMARCA, 'XXX')
                                        AND COALESCE(D.CCMAROR, 'XXX') = COALESCE(C.STSORGTRX, 'XXX')
                                        AND COALESCE(D.CCMARPR, 'XXX') = COALESCE(C.STSPROD, 'XXX')
                                        AND COALESCE(D.CCTIPTA, 'XXX') = COALESCE(C.STSTPUSO, 'XXX')
                 WHERE COALESCE(D.CCMTASA, 0) != COALESCE(C.STSVALCOM, 0))
SELECT COCOMER, COUNT(1) CANTIDAD
FROM VERSUS C
         LEFT JOIN (SELECT C.CLICLICOD, C.SUCSUCCOD, (C.COCOMER) COCOMER
                    FROM GXFINDTA.TCOCNA C
                    WHERE SUBSTRING(C.COCOMER, 1, 2) NOT IN ('80', '85', '45', '81', '86')
                      AND SUBSTRING(C.COCOMER, 1, 2) < '87'
                      AND (C.CNADENCOM NOT LIKE '%ECOM_B.P-%' AND
                           C.CNADENCOM NOT LIKE '%LINK-%' AND
                           C.CNADENCOM NOT LIKE '%D.A-%')
                    GROUP BY C.CLICLICOD, C.SUCSUCCOD, (C.COCOMER)) COM
                   ON COM.CLICLICOD = C.CLICLICOD
                       AND COM.SUCSUCCOD = C.SUCSUCCOD
GROUP BY COCOMER
ORDER BY 2 DESC;
----
--ajuste
cl: CALL PGM(GXFINPGM/PCON087) PARM(('0706651'));
cl: CALL PGM(GXFINPGM/PCON087) PARM(('2301286'));
