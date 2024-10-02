Select   d.COCOMER AS COMERCIO,  'T'||CAJLNO AS ATM, cajloc as NOMBREATM, TIMESTAMP(CONCAT(BITAFECH,' '||bitahora),'AAAA-MM-DD HH:MM:SS') AS FECHAHORAINI,bitafalt fecha_fin,bitahopr hora_fin,BITAIDPE AS OPERADOR,A.FALCODI CODFALLA, FALDESC AS FALLA, 
BITAdesc ESTADO--, STATDESC ESTADODESC
from gxmoni.mobita  A
INNER JOIN GXMONI.MOFALLA B ON B.FALCODI = A.FALCODI
INNER JOIN gxmoni.mostat ON  STATCODI = BITASTAT
inner join gxbdbps.comaeaf D on substr(A.cocomer,5,3) = substr(D.cocomer,5,3)
inner join featmslib.adcaj on substr(A.cocomer,5,3) = cajlno 
where  A.falcodi in ('9')-- (1, 2, 3, 7, 8, 10, 11, 12, 13, 14, 16, 23, 24, 25, 33, 34, 35, 36, 37, 38, 41, 42, 45, 46, 51, 54, 76, 78, 79, 80, 82, 84, 85, 86, 87, 88, 89, 90, 97, 99)
and  SUBSTR(d.COCOMER,1,2) = '90' -- SOLO ATM 
and d.costat = '0'
AND BITASTAT = 1 -- no esta solucionado
AND COENADM   = '002'
and BITAFECH>='20190101'


Select 
d.COCOMER AS COMERCIO,  'T'||CAJLNO AS ATM,
cajloc as NOMBREATM,
TIMESTAMP((substr(BITAFECH,1,4)||'-'||substr(BITAFECH,5,2)||'-'||substr(BITAFECH,7,2)||' '||bitahora)) AS FECHAHORAINI,
timestamp((substr(bitafalt,1,4)||'-'||substr(bitafalt,5,2)||'-'||substr(bitafalt,7,2)||' '||bitahopr)) AS FECHAHORAFin,
BITAIDPE AS OPERADOR,
A.FALCODI CODFALLA,
 FALDESC AS FALLA, 
BITAdesc ESTADO--, STATDESC ESTADODESC 
from gxmoni.mobita  A
INNER JOIN GXMONI.MOFALLA B ON B.FALCODI = A.FALCODI
INNER JOIN gxmoni.mostat ON  STATCODI = BITASTAT
inner join gxbdbps.comaeaf D on substr(A.cocomer,5,3) = substr(D.cocomer,5,3)
inner join featmslib.adcaj on substr(A.cocomer,5,3) = cajlno 
where  A.falcodi in ('9')-- (1, 2, 3, 7, 8, 10, 11, 12, 13, 14, 16, 23, 24, 25, 33, 34, 35, 36, 37, 38, 41, 42, 45, 46, 51, 54, 76, 78, 79, 80, 82, 84, 85, 86, 87, 88, 89, 90, 97, 99)
and  SUBSTR(d.COCOMER,1,2) = '90' -- SOLO ATM 
and d.costat = '0'
AND BITASTAT = 1 -- no esta solucionado
AND COENADM   = '002'
and BITAFECH>='20190101'
group by d.COCOMER,cajloc,BITAIDPE,BITAdesc,'T'||CAJLNO,bitahora,bitafech,bitahopr,bitafalt,a.falcodi,FALDESC



Select 
d.COCOMER AS COMERCIO,  'T'||CAJLNO AS ATM,
cajloc as NOMBREATM,
TIMESTAMP((substr(BITAFECH,1,4)||'-'||substr(BITAFECH,5,2)||'-'||substr(BITAFECH,7,2)||' '||bitahora)) AS FECHAHORAINI,
timestamp((substr(bitafalt,1,4)||'-'||substr(bitafalt,5,2)||'-'||substr(bitafalt,7,2)||' '||bitahopr)) AS FECHAHORAFin,
timestampdiff(4,((substr(BITAFECH,1,4)||'-'||substr(BITAFECH,5,2)||'-'||substr(BITAFECH,7,2)||' '||bitahora)) || '-' || (substr(bitafalt,1,4)||'-'||substr(bitafalt,5,2)||'-'||substr(bitafalt,7,2)||' '||bitahopr)) as resta,
BITAIDPE AS OPERADOR,
A.FALCODI CODFALLA,
 FALDESC AS FALLA, 
BITAdesc ESTADO--, STATDESC ESTADODESC 
from gxmoni.mobita  A
INNER JOIN GXMONI.MOFALLA B ON B.FALCODI = A.FALCODI
INNER JOIN gxmoni.mostat ON  STATCODI = BITASTAT
inner join gxbdbps.comaeaf D on substr(A.cocomer,5,3) = substr(D.cocomer,5,3)
inner join featmslib.adcaj on substr(A.cocomer,5,3) = cajlno 
where  A.falcodi in ('9')-- (1, 2, 3, 7, 8, 10, 11, 12, 13, 14, 16, 23, 24, 25, 33, 34, 35, 36, 37, 38, 41, 42, 45, 46, 51, 54, 76, 78, 79, 80, 82, 84, 85, 86, 87, 88, 89, 90, 97, 99)
and  SUBSTR(d.COCOMER,1,2) = '90' -- SOLO ATM 
and d.costat = '0'
AND BITASTAT = 1 -- no esta solucionado
AND COENADM   = '002'
and BITAFECH>='20190101'
group by d.COCOMER,cajloc,BITAIDPE,BITAdesc,'T'||CAJLNO,bitahora,bitafech,bitahopr,bitafalt,a.falcodi,FALDESC

                                                                     
