--caso conta web
--- CANTIDAD EN MST EN OPMCATM
SELECT * --CAMARCA, CAPROCE,SUM(CACANAD) CANTIDAD
from gxopera.OPMCATM
WHERE SUBSTR(CAFECHA,1,6) = '202105' 
AND CACODad = '002'
--AND CAMARCA = 'DIN' 
--AND CAPROCE = '530' 
--and CATARJE = '7020'
AND CAENEMI <> '002' 
group by CAMARCA,CAPROCE

--- CANTIDAD EN MST EN DRCONBEP
Select *--LCODBC,LBCOCR,COUNT(*)
from libdebito.drconbep
where lfectr between '20210501' and '20210531' 
and lcodbc = 'DIN' and LBCOCR = '020' 
and ENEADM = '087'
and SUBSTR(DIGITS(lidcom), 6, 2) = '90' and lcretr = '00' and LENEMI <> ENEPRO
and lesttr = 'A' and substr(lcodtr, 1, 2) = '01'
GROUP BY LCODBC,LBCOCR;

select * from gxopera.opentid

--POR FECHA EN drconbep
Select lfectr,count(*)--ENEADM, 'ADM', LCODBC, LBCOCR, /*LIDCOM, LBINPR,*/ SUBSTR(LCODTR, 1, 2),/* ENEPRO,*/ LENEMI, count(*), SUM(LIMPGS)
from virgililib.drconbep
where lfectr between '20210201' and '20210229' and lcodbc = 'MST' and LBCOCR = '530' and ENEADM = '087'
and SUBSTR(DIGITS(lidcom), 6, 2) = '90' and lcretr = '00' and LENEMI <> ENEPRO
and lesttr = 'A' and substr(lcodtr, 1, 2) = '01' --and ENEADM = '002'
GROUP BY lfectr--,ENEADM, LCODBC, LBCOCR,/* LIDCOM, LBINPR,*/ SUBSTR(LCODTR, 1, 2), /*ENEPRO,*/ LENEMI

-- por COMERCIO, BIN Y OTROS EN drconbep
Select LBINPR,LIDCOM,lcodbc,LBCOCR,LBCOCR,LENEMI,SUM(LIMPGS) IMPORTE, COUNT(*)
from virgililib.drconbep
where lfectr between '20210201' and '20210229' and lcodbc IN ('MST') and LBCOCR = '530' and ENEADM = '087'
and SUBSTR(DIGITS(lidcom), 6, 2) = '90' and lcretr = '00' and LENEMI <> ENEPRO
and lesttr = 'A' and substr(lcodtr, 1, 2) = '01' --and ENEADM = '002'
GROUP BY LBINPR,LIDCOM,lcodbc,LBCOCR,LBCOCR,LENEMI
ORDER BY LBINPR,LIDCOM,lcodbc,LBCOCR,LBCOCR,LENEMI;

-- por COMERCIO, BIN Y OTROS EN opmcatm
SELECT CATARJE AS BIN,CACOMER,CAENEMI,CAPROCE,CACODAD, SUM(CACANAD) AS CANTIDAD
from virgililib.OPMCATM
WHERE CAFECHA = '20210201' 
AND CACODAD = '087'
AND CAMARCA = 'MST' 
AND CAPROCE = '530' 
AND CAENEMI <> '087'
group by  CATARJE,CACOMER,CAENEMI,CAPROCE,CACODAD
ORDER BY CATARJE,CACOMER,CAENEMI,CAPROCE,CACODAD;
--CAFECHA;

-- DIFERENCIA DE LA FECHA 20210201
-- PARA EL COMERCIO 9099416
SELECT *
--LENEMI,LBCOCR,ENEADM,ENEPRO,LBINPR,LIDCOM,LCODPR,LERRNB
from virgililib.drconbep
where lfectr between '20210201' and '20210229' and lcodbc = 'MST' and LBCOCR = '530' and ENEADM = '087'
and SUBSTR(DIGITS(lidcom), 6, 2) = '90' 
--and lcretr = '00' 
and LENEMI <> ENEPRO
--and lesttr = 'A' 
and substr(lcodtr, 1, 2) = '01' 
--AND LENEMI = '530'
 AND LIDCOM IN (9099416)
-- (9099482,9099416,9099475,9099414,9099472,9099416,9099416)
AND LBINPR IN (530772)
--GROUP BY LENEMI,LBCOCR,ENEADM,ENEPRO,LBINPR,LIDCOM,LCODPR,LERRNB
ORDER BY LENEMI,LBCOCR,ENEADM,ENEPRO,LBINPR,LIDCOM,LCODPR,LERRNB;

-- OPMCATM PARA EL CLIENTE 9099416
SELECT * from virgililib.OPMCATM
WHERE CAFECHA = '20210201' 
AND CACODAD = '087'
AND CAMARCA = 'MST' 
AND CAPROCE = '530' 
AND CAENEMI <> '087'
AND CACOMER IN (9099414,9099416,9099416,9099416,9099472,9099475,9099482)
--= 9099416
--AND CATARJE = 530772
--group by  CATARJE,CACOMER,CAENEMI,CAPROCE,CACODAD
ORDER BY CATARJE,CACOMER,CAENEMI,CAPROCE,CACODAD;

SELECT CAFECHA,CACOMER, CAPROCE, CATARJE,CAIMPOR,COUNT(*) from virgililib.OPMCATM
WHERE CAFECHA = '20210201' 
AND CACODAD = '087'
AND CAMARCA = 'MST' 
AND CAPROCE = '530' 
AND CAENEMI <> '087'
AND CACOMER = 9099416
AND CATARJE = 530772
GROUP BY CAFECHA,CACOMER, CAPROCE, CATARJE,CAIMPOR
ORDER BY CAFECHA,CACOMER, CAPROCE, CATARJE,CAIMPOR;









Select ENEADM/*, 'ADM'*/, LCODBC, LBCOCR, LIDCOM, LBINPR,               
    SUBSTR(LCODTR, 1, 2), ENEPRO, LENEMI, count(*) CANTIDAD, SUM(LIMPGS) IMPORTE  
from VIRGILILIB.DRCONBEP where SUBSTR(lfectr,1,6) = '202102'  
  --and lcodbc = 'VSA' and LBCOCR IN ('540','015')    
and lcodbc = 'MST' and LBCOCR IN ('530')   
and SUBSTR(DIGITS(lidcom), 6, 2) = '90' and lcretr = '00'        
and lesttr = 'A' and substr(lcodtr, 1, 2) = '01'                 
and ENEADM = '087'                                            
and LENEMI <> ENEADM 
--AND LIDCOM IN (9099416) --AND LBINPR IN (530772)                                            
GROUP BY ENEADM, LCODBC, LBCOCR, LIDCOM, LBINPR, SUBSTR(LCODTR, 1,2), 
       ENEPRO, LENEMI                                               
 UNION                                                                
 Select ENEADM/*, 'PRO'*/, LCODBC, LBCOCR, LIDCOM, LBINPR,                
        SUBSTR(LCODTR, 1, 2), ENEPRO, LENEMI, count(*), SUM(LIMPGS)   
   from VIRGILILIB.DRCONBEP                                            
  where SUBSTR(lfectr,1,6) = '202102' and lcodbc = 'MST' and LBCOCR = '530'     
    and SUBSTR(DIGITS(lidcom), 6, 2) = '90' and lcretr = '00'         
    and lesttr = 'A' and substr(lcodtr, 1, 2) = '01'                  
    and ENEPRO = '087'                                           
    and LENEMI <> ENEPRO  
AND LIDCOM IN (9099416)
AND LBINPR IN (530772)                                                                          
  GROUP BY ENEADM, LCODBC, LBCOCR, LIDCOM, LBINPR, SUBSTR(LCODTR, 1,2),  
        ENEPRO, LENEMI
        
SELECT * FROM GXOPERA.OPMMARC WHERE MACOBC IN ('MST', 'DEB');
select * from virgililib.tbinproc where PBIN = '530772';
select * from virgililib.comaeaf where cocomer in ('9099482','9099416','9099475','9099414','9099472','9099416','9099416')
select * from virgililib.opmtari where TAMARCA = 'VSA' AND TAENPRO = '500';
select * from virgililib.opentid;
select * from virgililib.opentid1;

select * from virgililib.tbbine0p where qebi10 like '%5%'--30%'--772%';

Select ltiptr/*,lcodbc*/, count(*) from virgililib.drconbep
--where lcretr = '00' and lesttr = 'A' and lcodbc = 'MST'
group by  ltiptr/*,lcodbc*/;

Select ltiptr,lcodbc, count(*) from virgililib.drconbep
where lcretr = '00' and lesttr = 'A' --and lcodbc = 'MST'
and substr(LIDTRA,1,1) = 'T'
group by  ltiptr,lcodbc;

Select * from virgililib.drconbep
where lcretr = '00' and lesttr = 'A' and lcodbc = 'MST' 
--and ltiptr = ' ' 
and LIDCOM in ('9099482','9099416','9099475','9099414','9099472','9099416','9099416')
and LBINPR in ('525615','530772','531364','535601','670342','671080','671081')
and substr(LIDTRA,1,1) = 'T' ;


--group by  ltiptr,lcodbc;

select * from virgililib.tbinproc where PBIN = '530772';
select * from virgililib.comaeaf where cocomer = '2800026';
/*
 for each order BINNROBIN
        where BINNROBIN  = &BIN
        where BINIDMARCA = &AUTMARTAR
        &Encontro = 'S'
        &AUTBINEMI = BINNROBIN
        &AUTTIPTAR = substr(BINIDTUTRJ,1,1)
        &AUTPROTAR = BINIDPRODU
//        &AUTMARTAR = BINIDMARCA
        &AUTPROEMI = BINCODPRO
        &BINCODENT = BINCODENT        
        &PAISTARJ  = TDGBINPAIIDPAIS
        exit
    endfor
*/
5307722901047272
select * from gxtrjdta.tdgbin where trim(BINNROBIN) LIKE  '530772%'--772';
select * from gxbdbps.tswaut where AUTRRNBEP = '103237616864   ';
select * from gxtrjdta.tdgbin where BINIDMARCA = 'MST';-- AND 

SELECT CAFECHA,CACOMER, CAPROCE, CATARJE,CAIMPOR,COUNT(*) from gxopera.OPMCATM
WHERE CAFECHA = '20210201' 
AND CACODAD = '087'
AND CAMARCA = 'MST' 
AND CAPROCE = '530' 
AND CAENEMI <> '087'
--AND CACOMER = 9099416
AND CATARJE = 530772
GROUP BY CAFECHA,CACOMER, CAPROCE, CATARJE,CAIMPOR
ORDER BY CAFECHA,CACOMER, CAPROCE, CATARJE,CAIMPOR;

select * from libdebito.tbinproc where PBIN = '530772';

SELECT *
--LENEMI,LBCOCR,ENEADM,ENEPRO,LBINPR,LIDCOM,LCODPR,LERRNB
from virgililib.drconbep
where lfectr between '20210201' and '20210229' and lcodbc IN ('MST') 
and LBCOCR = '530' and ENEADM = '087'
and SUBSTR(DIGITS(lidcom), 6, 2) = '90' 
and lcretr = '00' and LENEMI <> ENEPRO and lesttr = 'A' 
and substr(lcodtr, 1, 2) = '01' 
--AND LENEMI = '530'
-- AND LIDCOM IN (9099416)
-- (9099482,9099416,9099475,9099414,9099472,9099416,9099416)
--AND LBINPR IN (530772)
--GROUP BY LENEMI,LBCOCR,ENEADM,ENEPRO,LBINPR,LIDCOM,LCODPR,LERRNB
ORDER BY LENEMI,LBCOCR,ENEADM,ENEPRO,LBINPR,LIDCOM,LCODPR,LERRNB;

--- TODO EL MES DE FEBRERO
SELECT CAFECHA,CACOMER, CAPROCE, CATARJE,CAIMPOR,COUNT(*) as CANTIDAD from VIRGILILIB.OPMCATM
WHERE SUBSTR(CAFECHA,1,6) = '202102'--'20210201' 
AND CACODAD = '087'
AND CAMARCA IN ('MST')
AND CAPROCE = '530' 
AND CAENEMI <> '087'
--AND CANTIDAD > 1
--AND CACOMER = 9099416
--AND CATARJE = 530772
GROUP BY CAFECHA,CACOMER, CAPROCE, CATARJE,CAIMPOR
ORDER BY CAFECHA,CACOMER, CAPROCE, CATARJE,CAIMPOR;


select * from gxopera.opentid where trim(ENTDESC) like '%VISA%'


select * from gxopera.tfamrel

select * from virgililib.opmcatmmv where cafecha = '20210524';


SELECT A.CACODAD,A.CAMARCA,A.CAPROCE,SUM(A.CACANAD) AS CANTADM_PRUEBA
from GXOPERA.OPMCATM A
WHERE A.CAFECHA BETWEEN '20210524' AND '20210524'
GROUP BY A.CACODAD,A.CAMARCA,A.CAPROCE
ORDER BY A.CACODAD,A.CAMARCA,A.CAPROCE
union
SELECT A.CACODAD,A.CAMARCA,A.CAPROCE,SUM(A.CACANAD) AS CANTADM_PRUEBA
from virgililib.OPMCATMmv A
WHERE A.CAFECHA BETWEEN '20210524' AND '20210524'
GROUP BY A.CACODAD,A.CAMARCA,A.CAPROCE
ORDER BY A.CACODAD,A.CAMARCA,A.CAPROCE
