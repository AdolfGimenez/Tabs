SELECT fecha,   MARCA, TDATIPO, SUM(DUDOSAS) AS DUDODAS, SUM(APROBADAS) AS APROBADAS, SUM(COD88) AS COD88, SUM(COD92) AS COD92, SUM(COD96) AS COD96, sum(cod60) as Cod60, SUM(COD91) AS COD91, SUM(COD99) AS COD99, SUM(COD05) AS COD05, b, SUM(CODxd) AS CODxd, SUM(COD19) COD19, SUM(COD57) COD57 FROM (
SELECT DATE(CURDATE()) fecha, lcodbc as marca, substr(lidtra,1,1) as TDATIPO,  0 AS DUDOSAS, count(*) AS APROBADAS, 0 AS COD88, 0 AS COD92, 0 AS COD96, 0 AS COD60, 0 AS COD91, 0 AS COD99, 0 as COD05, lbinpr b, 0 as CODXD, 0 AS COD19, 0 AS COD57
FROM LIBDEBITO.DRCONBEP
INNER JOIN  libdebito.tbcret0p
ON (lcretr = CODNRO)
WHERE  SUBSTR(LFECTR,1,4)||'-'||SUBSTR(LFECTR,5,2)||'-'||SUBSTR(LFECTR,7,2) = DATE(CURDATE())
AND   lcretr = '00'
and lesttr = 'A'
and limpgs > '1000'
AND LBINPR IN ('425935', '425936' , '443076',  '443077', '443078', '516400')
and CODMAR = 'BEPS'
GROUP BY DATE(CURDATE()),lcodbc, substr(lidtra,1,1), lbinpr
union 
SELECT DATE(CURDATE()) fecha, lcodbc as marca, substr(lidtra,1,1) as TDATIPO,   count(*) AS DUDOSAS, 0 AS APROBADAS, 0 AS COD88, 0 AS COD92, 0 AS COD96, 0 AS COD60, 0 AS COD91, 0 AS COD99,  0 as COD05, lbinpr b,  0 as CODXD, 0 AS COD19, 0 AS COD57
FROM LIBDEBITO.DRCONBEP
INNER JOIN  libdebito.tbcret0p
ON (lcretr = CODNRO)
WHERE  SUBSTR(LFECTR,1,4)||'-'||SUBSTR(LFECTR,5,2)||'-'||SUBSTR(LFECTR,7,2) = DATE(CURDATE())
AND  lcretr = '00'
and lesttr = 'D'
and limpgs > '1000'
AND LBINPR IN ('425935', '425936' , '443076',  '443077', '443078', '516400')
and CODMAR = 'BEPS'
GROUP BY  DATE(CURDATE()),lcodbc, substr(lidtra,1,1), lbinpr
UNION 
SELECT DATE(CURDATE()) fecha, lcodbc as marca, substr(lidtra,1,1) as TDATIPO,   0 AS DUDOSAS, 0 AS APROBADAS, count(*) AS COD88, 0 AS COD92, 0 AS COD96, 0 AS COD60, 0 AS COD91, 0 AS COD99,  0 as COD05, lbinpr b,  0 as CODXD, 0 AS COD19, 0 AS COD57
FROM LIBDEBITO.DRCONBEP
INNER JOIN  libdebito.tbcret0p
ON (lcretr = CODNRO)
WHERE  SUBSTR(LFECTR,1,4)||'-'||SUBSTR(LFECTR,5,2)||'-'||SUBSTR(LFECTR,7,2) = DATE(CURDATE())
AND  lcretr = '88'
and limpgs > '1000'
AND LBINPR IN ('425935', '425936' , '443076',  '443077', '443078', '516400')
and CODMAR = 'BEPS'
GROUP BY  DATE(CURDATE()),lcodbc, substr(lidtra,1,1), lbinpr
UNION
SELECT DATE(CURDATE()) fecha,  lcodbc as marca, substr(lidtra,1,1) as TDATIPO,   0 AS DUDOSAS, 0 AS APROBADAS, 0 AS COD88, count(*) AS COD92, 0 AS COD96, 0 AS COD60, 0 AS COD91, 0 AS COD99,  0 as COD05, lbinpr b,  0 as CODXD, 0 AS COD19, 0 AS COD57
FROM LIBDEBITO.DRCONBEP
INNER JOIN  libdebito.tbcret0p
ON (lcretr = CODNRO)
WHERE  SUBSTR(LFECTR,1,4)||'-'||SUBSTR(LFECTR,5,2)||'-'||SUBSTR(LFECTR,7,2) = DATE(CURDATE())
AND  lcretr = '92'
and limpgs > '1000'
and CODMAR = 'BEPS'
AND LBINPR IN ('425935', '425936' , '443076',  '443077', '443078', '516400')
GROUP BY  DATE(CURDATE()),lcodbc, substr(lidtra,1,1), lbinpr
UNION
SELECT DATE(CURDATE()) fecha, lcodbc as marca, substr(lidtra,1,1) as TDATIPO,   0 AS DUDOSAS, 0 AS APROBADAS, 0 AS COD88, 0 AS COD92, count(*) AS COD96, 0 AS COD60, 0 AS COD91, 0 AS COD99,  0 as COD05, lbinpr b,  0 as CODXD, 0 AS COD19, 0 AS COD57
FROM LIBDEBITO.DRCONBEP
INNER JOIN  libdebito.tbcret0p
ON (lcretr = CODNRO)
WHERE  SUBSTR(LFECTR,1,4)||'-'||SUBSTR(LFECTR,5,2)||'-'||SUBSTR(LFECTR,7,2) = DATE(CURDATE())
AND   lcretr = '96'
and limpgs > '1000'
and CODMAR = 'BEPS'
AND LBINPR IN ('425935', '425936' , '443076',  '443077', '443078', '516400')
GROUP BY  DATE(CURDATE()),lcodbc, substr(lidtra,1,1), lbinpr
union
SELECT DATE(CURDATE()) fecha, lcodbc as marca, substr(lidtra,1,1) as TDATIPO,   0 AS DUDOSAS, 0 AS APROBADAS, 0 AS COD88, 0 AS COD92, 0 AS COD96, count(*) AS COD60, 0 AS COD91, 0 AS COD99,  0 as COD05, lbinpr b,  0 as CODXD, 0 AS COD19, 0 AS COD57
FROM LIBDEBITO.DRCONBEP
INNER JOIN  libdebito.tbcret0p
ON (lcretr = CODNRO)
WHERE  SUBSTR(LFECTR,1,4)||'-'||SUBSTR(LFECTR,5,2)||'-'||SUBSTR(LFECTR,7,2) = DATE(CURDATE())
AND   lcretr = '60'
and limpgs > '1000'
and CODMAR = 'BEPS'
AND LBINPR IN ('425935', '425936' , '443076',  '443077', '443078', '516400')
GROUP BY  DATE(CURDATE()),lcodbc, substr(lidtra,1,1), lbinpr
UNION
SELECT DATE(CURDATE()) fecha, lcodbc as marca, substr(lidtra,1,1) as TDATIPO,   0 AS DUDOSAS, 0 AS APROBADAS, 0 AS COD88, 0 AS COD92, 0 AS COD96, 0 AS COD60, count(*) AS COD91, 0 AS COD99,  0 as COD05, lbinpr b,  0 as CODXD, 0 AS COD19, 0 AS COD57
FROM LIBDEBITO.DRCONBEP
INNER JOIN  libdebito.tbcret0p
ON (lcretr = CODNRO)
WHERE  SUBSTR(LFECTR,1,4)||'-'||SUBSTR(LFECTR,5,2)||'-'||SUBSTR(LFECTR,7,2) = DATE(CURDATE())
AND   lcretr = '91'
and limpgs > '1000'
and CODMAR = 'BEPS'
AND LBINPR IN ('425935', '425936' , '443076',  '443077', '443078', '516400')
GROUP BY  DATE(CURDATE()),lcodbc, substr(lidtra,1,1), lbinpr
UNION
SELECT DATE(CURDATE()) fecha, lcodbc as marca, substr(lidtra,1,1) as TDATIPO,   0 AS DUDOSAS, 0 AS APROBADAS, 0 AS COD88, 0 AS COD92, 0 AS COD96, 0 AS COD60, 0  AS COD91, count(*) AS COD99,  0 as COD05, lbinpr b,  0 as CODXD, 0 AS COD19, 0 AS COD57
FROM LIBDEBITO.DRCONBEP
INNER JOIN  libdebito.tbcret0p
ON (lcretr = CODNRO)
WHERE  SUBSTR(LFECTR,1,4)||'-'||SUBSTR(LFECTR,5,2)||'-'||SUBSTR(LFECTR,7,2) = DATE(CURDATE())
AND   lcretr = '99'
and limpgs > '1000'
AND LBINPR IN ('425935', '425936' , '443076',  '443077', '443078', '516400')
and CODMAR = 'BEPS'
GROUP BY  DATE(CURDATE()),lcodbc, substr(lidtra,1,1), lbinpr
UNION
SELECT DATE(CURDATE()) fecha, lcodbc as marca, substr(lidtra,1,1) as TDATIPO,   0 AS DUDOSAS, 0 AS APROBADAS, 0 AS COD88, 0 AS COD92, 0 AS COD96, 0 AS COD60, 0  AS COD91, 0 AS COD99,   count(*) as COD05, lbinpr b,  0 as CODXD, 0 AS COD19, 0 AS COD57
FROM LIBDEBITO.DRCONBEP
INNER JOIN  libdebito.tbcret0p
ON (lcretr = CODNRO)
WHERE  SUBSTR(LFECTR,1,4)||'-'||SUBSTR(LFECTR,5,2)||'-'||SUBSTR(LFECTR,7,2) = DATE(CURDATE())
AND   lcretr = '05'
and limpgs > '1000'
and CODMAR = 'BEPS'
AND LBINPR IN ('425935', '425936' , '443076',  '443077', '443078', '516400')
GROUP BY  DATE(CURDATE()),lcodbc, substr(lidtra,1,1), lbinpr
UNION
SELECT DATE(CURDATE()) fecha, lcodbc as marca, substr(lidtra,1,1) as TDATIPO,   0 AS DUDOSAS, 0 AS APROBADAS, 0 AS COD88, 0 AS COD92, 0 AS COD96, 0 AS COD60, 0  AS COD91, 0 AS COD99,   0  as COD05, lbinpr b,  count(*) as CODXD, 0 AS COD19, 0 AS COD57
FROM LIBDEBITO.DRCONBEP
INNER JOIN  libdebito.tbcret0p
ON (lcretr = CODNRO)
WHERE  SUBSTR(LFECTR,1,4)||'-'||SUBSTR(LFECTR,5,2)||'-'||SUBSTR(LFECTR,7,2) = DATE(CURDATE())
AND   lcretr = 'XD'
and limpgs > '1000'
and CODMAR = 'BEPS'
AND LBINPR IN ('425935', '425936' , '443076',  '443077', '443078', '516400')
GROUP BY  DATE(CURDATE()),lcodbc, substr(lidtra,1,1), lbinpr
UNION
SELECT DATE(CURDATE()) fecha, lcodbc as marca, substr(lidtra,1,1) as TDATIPO,   0 AS DUDOSAS, 0 AS APROBADAS, 0 AS COD88, 0 AS COD92, 0 AS COD96, 0 AS COD60, 0  AS COD91, 0 AS COD99,   0  as COD05, lbinpr b,  0 as CODXD, count(*) AS COD19, 0 AS COD57
FROM LIBDEBITO.DRCONBEP
INNER JOIN  libdebito.tbcret0p
ON (lcretr = CODNRO)
WHERE  SUBSTR(LFECTR,1,4)||'-'||SUBSTR(LFECTR,5,2)||'-'||SUBSTR(LFECTR,7,2) = DATE(CURDATE())
AND   lcretr = '19'
and limpgs > '1000'
and CODMAR = 'BEPS'
AND LBINPR IN ('425935', '425936' , '443076',  '443077', '443078', '516400')
GROUP BY  DATE(CURDATE()),lcodbc, substr(lidtra,1,1), lbinpr
UNION
SELECT DATE(CURDATE()) fecha, lcodbc as marca, substr(lidtra,1,1) as TDATIPO,   0 AS DUDOSAS, 0 AS APROBADAS, 0 AS COD88, 0 AS COD92, 0 AS COD96, 0 AS COD60, 0  AS COD91, 0 AS COD99,   0  as COD05, lbinpr b, 0 as CODXD, 0 AS COD19,  count(*) AS COD57
FROM LIBDEBITO.DRCONBEP
INNER JOIN  libdebito.tbcret0p
ON (lcretr = CODNRO)
WHERE  SUBSTR(LFECTR,1,4)||'-'||SUBSTR(LFECTR,5,2)||'-'||SUBSTR(LFECTR,7,2) = DATE(CURDATE())
AND   lcretr = '57'
and limpgs > '1000'
and CODMAR = 'BEPS'
AND LBINPR IN ('425935', '425936' , '443076',  '443077', '443078', '516400')
GROUP BY  DATE(CURDATE()),lcodbc, substr(lidtra,1,1), lbinpr
) AS D 
GROUP BY fecha ,  TDATIPO, MARCA, b


