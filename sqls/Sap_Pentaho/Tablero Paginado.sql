--http://redmine2.bepsa.com.py/issues/92896
--Solicito tablero paginado, segun estas sentencias.
--Tablero 1

SELECT MCNUMCT, MCEMISO , MCDISCO , MCLIMCO , MCSAFAC , MCSFNVE , MCSALFI , MCAPCOC , MCAPCOA , MCAPCUC , MCAPCUA, MCAUTPE FROM GXBDBPS.TMCTAAF
WHERE (MCAPCOC + MCAPCOA + MCAPCUC + MCAPCUA) <> MCAUTPE ORDER BY MCEMISO;

SELECT MCNUMCT, MCEMISO , MCDISCO , MCLIMCO , MCSAFAC , MCSFNVE , MCSALFI , MCAPCOC , MCAPCOA , MCAPCUC ,MCAPCUA , MCAUTPE FROM GXBDBPS.TMCTAAF
WHERE MCAUTPE < 0;

SELECT MCNUMCT, MCEMISO , MCDISCO , MCLIMCO , MCSAFAC , MCSFNVE , MCSALFI , MCAPCOC , MCAPCOA , MCAPCUC ,MCAPCUA , MCAUTPE FROM GXBDBPS.TMCTAAF
WHERE MCAPCOC < 0;

SELECT MCNUMCT, MCEMISO , MCDISCO , MCLIMCO , MCSAFAC , MCSFNVE , MCSALFI , MCAPCOC , MCAPCOA , MCAPCUC ,MCAPCUA , MCAUTPE FROM GXBDBPS.TMCTAAF
WHERE MCAPCOA < 0 ;

SELECT MCNUMCT, MCEMISO , MCDISCO , MCLIMCO , MCSAFAC , MCSFNVE , MCSALFI , MCAPCOC , MCAPCOA , MCAPCUC ,MCAPCUA , MCAUTPE FROM GXBDBPS.TMCTAAF
WHERE MCAPCUC < 0 ;

SELECT MCNUMCT, MCEMISO , MCDISCO , MCLIMCO , MCSAFAC , MCSFNVE , MCSALFI , MCAPCOC , MCAPCOA , MCAPCUC, MCAPCUA, MCAUTPE FROM GXBDBPS.TMCTAAF
WHERE MCAPCUA < 0 ;

--Tablero 2
SELECT
      COALESCE((SELECT SUM(APIMPOR) FROM GXBDBPS.TAUTPAF A WHERE AUT.APNUMCT = A.APNUMCT AND A.APSTATS='P' AND CMCODIG='005' AND A.APCANCU=1),0) AS CONT_005,
      COALESCE((SELECT SUM(APIMPOR) FROM GXBDBPS.TAUTPAF A WHERE AUT.APNUMCT = A.APNUMCT AND A.APSTATS='P' AND CMCODIG='006' AND A.APCANCU>1),0) AS CUOTA_006,
      COALESCE((SELECT SUM(APIMPOR) FROM GXBDBPS.TAUTPAF A WHERE AUT.APNUMCT = A.APNUMCT AND A.APSTATS='P' AND CMCODIG='007' AND A.APCANCU>1),0) AS CUOTA_007,
      COALESCE((SELECT SUM(APIMPOR) FROM GXBDBPS.TAUTPAF A WHERE AUT.APNUMCT = A.APNUMCT AND A.APSTATS='P' AND CMCODIG='010' AND A.APCANCU=1),0) AS CONT_010,
      T.MCAPCOC,T.MCAPCUC ,T.MCAPCUA, T.MCAPCOA,T.MCNUMCT ,'NUEVO', CURRENT TIMESTAMP
     from  GXBDBPS.TMCTAAF t
     left join GXBDBPS.tautpaf aut on AUT.APNUMCT = T.MCNUMCT
     WHERE mcemiso IN ('021') AND MCSTATS  = '1'
    AND ((COALESCE((SELECT SUM(APIMPOR) FROM GXBDBPS.TAUTPAF A WHERE AUT.APNUMCT = A.APNUMCT AND A.APSTATS='P' AND CMCODIG='005' AND A.APCANCU=1),0) !=T.MCAPCOC) OR
     (COALESCE((SELECT SUM(APIMPOR) FROM GXBDBPS.TAUTPAF A WHERE AUT.APNUMCT = A.APNUMCT AND A.APSTATS='P' AND CMCODIG='006' AND A.APCANCU>1),0) !=T.MCAPCUC) OR
     (COALESCE((SELECT SUM(APIMPOR) FROM GXBDBPS.TAUTPAF A WHERE AUT.APNUMCT = A.APNUMCT AND A.APSTATS='P' AND CMCODIG='007' AND A.APCANCU>1),0) !=T.MCAPCUA) OR
     (COALESCE((SELECT SUM(APIMPOR) FROM GXBDBPS.TAUTPAF A WHERE AUT.APNUMCT = A.APNUMCT AND A.APSTATS='P' AND CMCODIG='010' AND A.APCANCU=1),0) !=T.MCAPCOA)
     ) GROUP BY
           COALESCE((SELECT SUM(APIMPOR) FROM GXBDBPS.TAUTPAF A WHERE AUT.APNUMCT = A.APNUMCT AND A.APSTATS='P' AND CMCODIG='005' AND A.APCANCU=1),0) ,
              COALESCE((SELECT SUM(APIMPOR) FROM GXBDBPS.TAUTPAF A WHERE AUT.APNUMCT = A.APNUMCT AND A.APSTATS='P' AND CMCODIG='006' AND A.APCANCU>1),0) ,
                  COALESCE((SELECT SUM(APIMPOR) FROM GXBDBPS.TAUTPAF A WHERE AUT.APNUMCT = A.APNUMCT AND A.APSTATS='P' AND CMCODIG='007' AND A.APCANCU>1),0),
                      COALESCE((SELECT SUM(APIMPOR) FROM GXBDBPS.TAUTPAF A WHERE AUT.APNUMCT = A.APNUMCT AND A.APSTATS='P' AND CMCODIG='010' AND A.APCANCU=1),0),
                        T.MCAPCOC,T.MCAPCUC ,T.MCAPCUA, T.MCAPCOA,T.MCNUMCT;