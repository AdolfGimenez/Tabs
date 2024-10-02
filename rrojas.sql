--caso de reportes de comisiones para lsanchez

select count (*)from gxopera.opmcatm where cafecha = '20200610'

select cafecha, cacotiz from yapi.opmcatm where cafecha = 20200601
--and '20200630' group by cafecha

delete from gxopera.opmcatm where cafecha between 20201101 and 20201131
n
select cafecha, cacotiz from gxopera.opmcatm group by cafecha 

select count(*), lfectr from libdebito.drconbep where lfectr > '20200101' group by lfectr order by lfectr desc

select cafecha, count (*) from gxopera.opmcatm where cafecha >= 20200101 order by cafecha

select * from gxopera.opmcatm where cafecha between '20200101'

delete from gxopera.opmcatm where cafecha 

select * from gxopera.opmcatm where cafecha between '20200500' and '20200531' order by cafecha desc

delete from gxopera.opmcatm where cafecha between '20200500' and '20200531' order by cafecha desc
select * from libdebito.drconbep where lfectr = '201911'

select * FROM libdebito.drconbep
where LFECTR BETWEEN 20191101 AND 20191130 and lesttr = 'A' and substr(lcodtr, 1, 2) = '01'
and lcodbc = 'DCR' and SUBSTR(DIGITS(lidcom), 6, 2) = '90' and lcretr = '00' and LENEMI <> ENEADM and LBCOCR = '002'
   

--AND LNRTAR = '6274313120000917'
   and lesttr = 'A' and substr(lcodtr, 1, 2) = '01' 
   
/*and ENEADM = '056'*/ and LENEMI <> ENEADM and LBCOCR = '002'

Select * FROM libdebito.drconbep
where LFECTR BETWEEN 20191101 AND 20191130 --AND LENEMI in ('311','307','312')
   and lcodbc = 'DCR' and SUBSTR(DIGITS(lidcom), 6, 2) = '90' and lcretr = '00' --AND LNRTAR = '6274313120000917'
   and lesttr = 'A' and substr(lcodtr, 1, 2) = '01' /*and ENEADM = '056'*/ and LENEMI <> ENEADM and ENEADM = '056' 
   
--prueba de update con rrojas

update libdebito.drconbep set lbcocr ='520' where LFECTR BETWEEN 20191201 AND 20191231 --AND LENEMI in ('311','307','312')
   and lcodbc = 'DCR' and SUBSTR(DIGITS(lidcom), 6, 2) = '90' and lcretr = '00' --AND LNRTAR = '6274313120000917'
   and lesttr = 'A' and substr(lcodtr, 1, 2) = '01' /*and ENEADM = '056'*/ and LENEMI <> ENEADM --and LBCOCR = '002'
   
--Select * FROM .drconbep
--where LFECTR BETWEEN 20191201 AND 20191231 --AND LENEMI in ('311','307','312')
  -- and lcodbc = 'DCR' and SUBSTR(DIGITS(lidcom), 6, 2) = '90' and lcretr = '00' --AND LNRTAR = '6274313120000917'
   --and lesttr = 'A' and substr(lcodtr, 1, 2) = '01' /*and ENEADM = '056'*/ and LENEMI <> ENEADM and LENEMI = '002' 
   
select count (*) from gxopera.opmcatm where cafecha BETWEEN '20191101' AND '20191130'

--delete from gxopera.opmcatm where cafecha BETWEEN '20191201' AND '20191231'

--PARA GENERACION DE JOURNAL EN CASO DE PERDIDA
--STRJRNPF FILE(gxopera.opmcatm) JRN(@journal/QSQJRN) IMAGES(*BOTH) 

select * FROM libdebito.drconbep
where LFECTR BETWEEN 20191201 AND 20191231 --AND LENEMI in ('311','307','312')
   and lcodbc = 'DCR' and SUBSTR(DIGITS(lidcom), 6, 2) = '90' and lcretr = '00' --AND LNRTAR = '6274313120000917'
   and lesttr = 'A' and substr(lcodtr, 1, 2) = '01' /*and ENEADM = '056'*/ /*and LENEMI <> ENEADM */ and enepro = '072' 
 
Select enepro FROM libdebito.drconbep where LFECTR BETWEEN 20191201 AND 20191231 --AND LENEMI in ('311','307','312')
   and lcodbc = 'DCR' and SUBSTR(DIGITS(lidcom), 6, 2) = '90' and lcretr = '00' --AND LNRTAR = '6274313120000917'
   and lesttr = 'A' and substr(lcodtr, 1, 2) = '01' /*and ENEADM = '056'*/ and LENEMI <> enepro and eneadm <> enepro and LBCOCR = '002' group by enepro
   
SELECT * FROM LIBDEBITO.DRCONBEP WHERE LFECTR > '20200601' and 

select * from libdebito.TBEPAD0p where REENT='070'

select * from gxopera.opmcatm where cafecha in 
('20191202', '20191203', '20191204', '20191205', '20191206', '20191209', 
'20191211', '20191212', '20191213', '20191214', '20191218', '20191221', 
'20191223', '20191224', '20191226', '20191227', '20191229')

select count (*) from gxopera.opmcatm where cafecha = '20200122'

delete from gxopera.opmcatm where cafecha = '20200113'

select * from gxopera.flicom where LIUSER ='U99JAVIER' and LINRO ='13796'

select * from gxopera.flicom where LIUSER ='U99JAVIER' 

select * from gxopera.flicom where LINRO ='13798'

select * from gxopera.flicom1 where LIFECHA>'20191100' and LINROINS<>'0'





DELETE from gxopera.flicom1 where LINROINS ='13798'

--borrar tablas del reporte de vision banco, pruebas con rrojas
DELETE from gxopera.flicom where LIUSER ='U99JAVIER'

delete from gxopera.flicom1 where LIFECHA>'20191100' and LINROINS<>'0'

delete from gxopera.opmcatm where cafecha in 
('20191202', '20191203', '20191204', '20191205', '20191206', '20191209', 
'20191211', '20191212', '20191213', '20191214', '20191218', '20191221', 
'20191223', '20191224', '20191226', '20191227', '20191229')

--caso de comisiones ATM para Laura Sanchez

select * from libdebito.drconbep where lidtra like 'T%' and lfectr >= '20200101' and LBINPR = '627431' and lbcocr <> '520'
update libdebito.drconbep set lbcocr = '520', lbcodb = '520' where lidtra like 'T%' and lfectr >= '20200101' and LBINPR = '627431' and lbcocr <> '520'
7097
select * from libdebito.drconbep where lidtra like 'T%' and lfectr between '20191201' and '20191231' and LBINPR = '627431' and lbcocr <> '520'
update libdebito.drconbep set lbcocr = '520', lbcodb = '520' where lidtra like 'T%' and lfectr between '20191201' and '20191231' and LBINPR = '627431' and lbcocr <> '520'
16086
select * from libdebito.drconbep where lidtra like 'T%' and lfectr between '20191101' and '20191131' and LBINPR = '627431' and lbcocr <> '520'
update libdebito.drconbep set lbcocr = '520', lbcodb = '520' where lidtra like 'T%' and lfectr between '20191101' and '20191131' and LBINPR = '627431' and lbcocr <> '520'
13424
select * from libdebito.drconbep where lidtra like 'T%' and lfectr between '20191001' and '20191031' and LBINPR = '627431' and lbcocr <> '520'
update libdebito.drconbep set lbcocr = '520', lbcodb = '520' where lidtra like 'T%' and lfectr between '20191001' and '20191031' and LBINPR = '627431' and lbcocr <> '520'
16237

--para consultar generaciones de reporte por fecha, y eliminar por fecha en caso de necesidad
delete from gxopera.opmcatm where cafecha between '20200101' and '20200131'
--verificacion de opmcatmt en libreria de prueba de ruben rojas
select cafecha, count (*) from rrojaslib.opmcatmt  where cafecha between  '20200201' and '20200231' group by cafecha

--verificacion de opmcatm en libreria gxopera de tesging
select cafecha, count (*) from gxopera.opmcatm where cafecha between '20200201' and '20200231' group by cafecha

select * from gxopera.opmcatm where cafecha = '20200101'


--redmine 4309 - Liquidaciones de Establecimientos a Comerciales - AC - TESTING

--linro es numero de factura

select * from gxopera.flicom where LIFECHP between 20200101 and 20200131 and LICOZONA = 'BE' and licomer = '1300395'

UPDATE  gxopera.flicom set LINRO = 0 , LINROFIN = 0 where LIFECHP between 20200101 and 20200131 and LICOZONA = 'BE' and licomer = '1000680' 
 
UPDATE gxopera.flicom1 set linrofac = 0 where LIFECREDI between 20200101 and 20200131 and licomer = '1000680'
 
SELECT * FROM  gxopera.flicom2 WHERE LIFACFED between 20191101 and 20191130

-- CLRPFM FILE(GXOPERA/FLICOM2) para borrar 

select * from gxopera.flicom2
commit;

Select * from gxopera.flicom where LIFECHP between 20200101 and 20200131 and LICOZONA = '02' and licomer = '1300395' 
Select * from gxopera.flicom1 where LIFECREDI between 20200101 and 20200131 and licomer = '1300395' 

select * from gxopera.trxcobro where TRXCOME1 = '0301123' and TRXFECOB  = 20191107

select * from gxopera.trxcomer where trxcomer = '0301123' and trxfech = 20200120

select * from gxopera.opmovi where OPCODAUT = '196974'

--387, cod com 1000680, fecha 12/11/2019
--260, cod com 0700154, fecha 12/11/2019


--gxopera.trxcobro
--gxopera.txrcomer
--gxopera.opmovi

Select * from gxopera.opmovi where OPCOMER = '1300395'  and OPCODAUT in ('196974')

select * from gxbdbps.comaeaf where cocomer = '1300395'

--1300395

--TRXNETO 186631.00

Select * from  gxopera.trxcomer where TRXCOMER = '1300395' and TRXFECH = 20200120 ; --Comercio:0301123 - 

20191107
Select * from gxopera.trxcobro where trxcome1 = '1300395' 


Select * from gxopera.opmovi where OPCOMER = '1000650'  and OPCODAUT in ('964929','1000650')

update libdebito.drconbep set LBCOCR = '002' where lfectr >= 20200100 and LBINPR in ('703002','804999') and LBCOCR = '520'


 
select /*lbinpr,LIDCOM,LCODTR,*/lbinpr,PTIPPROC,PMARCTAR,PTIPTAR,COUNT(*)  from libdebito.drconbep left join gxweb.tbinproc on PBIN = lbinpr 
   where lfectr between '20200101' and '20200131' and ENEADM = '087'  and LBCOCR in ('500' , '510') and lcodbc = 'VSA' --and LBCOCR = '500'
   and SUBSTR(DIGITS(lidcom), 6, 2) = '90' and lcretr = '00' and LENEMI <> ENEADM
   and lesttr = 'A' and substr(lcodtr, 1, 2) = '01'
   group by	/*lbinpr,LIDCOM,LCODTR,*/lbinpr,PTIPPROC,PMARCTAR,PTIPTAR--,LIMPGS  
   

Select * from libdebito.tbinproc where PBIN in ('434511','456976','488234')
Select * from gxweb.tbinproc where PBIN in ('434511','456976','488234')

UPDATE gxopera.flicom set LINRO = 0 , LINROFIN = 0 where LIFECHP between 20191101 and 20191130 and LICOZONA = 'BE' and licomer in ('1000650','0701213','0700871','1001849');

UPDATE gxopera.flicom1 set linrofac = 0 where LIFECREDI between 20191101 and 20191130 and licomer in ('1000650','0701213','0700871','1001849'); 


select * from gxopera.opmmarc

select * from gxopera.opmtari

Select *  from gxopera.tfamfr 
 

CREATE INDEX GXOPERA.flico1L8 ON GXOPERA.flicom1 (licomer,licodtr,lifecredi,linrofac,litiptar)
CREATE INDEX GXOPERA.UTRXCOBRO1 ON GXOPERA.TRXCOBRO (TRXCOME1, TRXFECOB)
CREATE INDEX GXOPERA.OPMVL15 ON gxopera.opmovi (OPCOMER,OPCODAUT,OPSTATUS)

select * from gxopera.flicom1

[?18/?02/?2020 10:52]  Ruben Rojas:  

update libdebito.drconbep set LBCOCR = '002' where lfectr >= 20200100 and LBINPR in ('703002','804999') and LBCOCR = '520'

select * from libdebito.drconbep where lfectr >= 20200100 and LBINPR in ('703002','804999') and LBCOCR = '520'
 
select lfectr, count (*) from libdebito.drconbep where lfectr >= 20200100 group by lfectr

select * from libdebito.drconbep where lfectr >= 20200100 and LBINPR in ('627431') and LBCOCR = '002'

--redmine http://redmine2.bepsa.com.py/issues/5293

--limpiar las facturas generadas por liquidaciones AC
UPDATE  gxopera.flicom set LINRO = 0 , LINROFIN = 0 where LIFECHP between 20191101 and 20191130 and LICOZONA = 'ES' and LICOMER = '0700390'
UPDATE gxopera.flicom1 set linrofac = 0 where LIFECREDI between 20191101 and 20191130 and licomer = '0700390'

--consultas de las tablas a operar
Select * from gxopera.flicom1 where LIFECREDI between 20191101 and 20191130 and licomer = '0700390'
select * from gxopera.flicom where LIFECHP between 20191101 and 20191130 and LICOZONA = 'ES' and LICOMER = '0700390' 

--comercio de prueba 0700390


--redmine 5557, INSTRUCTIVO MANUAL UNIFICADO
select * from gxopera.flicom where licomer = '0100066' ORDER BY lifechd desc

select * from gxopera.flicom1 where licomer = '0100066' ORDER BY lifechd desc

select * from libdebito.empresa0p

select * from gxbdbps.gempraf

select * from contabilid.ccasi20 where ASCOUS = 'U99JAVIER' and ASCPRV = '0100066'

Select * from gxbdbps.comaeaf where cocomer = '0100037'
Select * from gxweb.comaeaf where cocomer = '0100037'
Select * from contabilid.tatgene
--liuser = 'U99JAVIER' ORDER BY lifechd desc-- lifechp = '20200318' and liuser = 'u99javier'

select lidcom,lcomtr, lcretr, lesttr,/* COUNT(*) CANTIDAD,*/ sum(limpgs) as SUMA
from libdebito.drconbep 
where lfectr between '20191201' and '20200228'
and lcretr = '00' 
and lesttr= 'A'
GROUP BY lidcom, lcomtr, lcretr, lesttr
order by lidcom asc

select lidcom,lcomtr, lcretr, lesttr,/* COUNT(*) CANTIDAD,*/ sum(limpgs) as SUMA
from libdebito.drconbep 
where lfectr between '20191201' and '20200228'
and lcretr = '00' 
and lesttr= 'A'
GROUP BY lidcom, lcomtr, lcretr, lesttr, limpgs
order by lidcom asc 


--redmine #5634 - Verificación en el sistema de facturación confirmación de recibos

select * from gxopera.trxinst where INSEMISO = '054'

delete from gxopera.trxinst  where INSEMISO = '054'

select * from gxopera.flicom where liuser = 'U99JAVIER' group by linro

delete from gxopera.flicom where liuser = 'U99JAVIER'

select * from gxopera.flicom1 where LIFECREDI = '20200506'

delete from gxopera.flicom1 where LIFECREDI = '20200506'
13906,
13905,
13904,
13903,
13902,
13899,
13898,
13798
)

delete from gxopera.flicom1 where linroins = '13898'

delete from gxopera.flicom1 where linroins = '13907'

select * from gxopera.factura where FACSTATUS = 'P' where 

select * from gxbdbps.comaeaf where enemiso = '021' --cocomer = '0100037'

select * from gxopera.factura where faclien = '2100469' order by facfech

update gxopera.factura set FACSTATUS = 'P' where FACSTATUS = 'A'

--redmine #6051, ATMCENTRE modificaciones para Impresion de lineas adicionales Banco Continental

select * from gxbdbps.lgcoment where lgentid = '1020' order by LGFECHOR desc

--redmine , CAMBIO DE DIRECCION

select * from gxopera.factura where facstatus = 'P' faclien = '2100469' and factnro = '10030007107' and factimbr = '14020631'
factipo = 'CR' and FACSTATUS = 'P' and FACSALDO > 0

SELECT * FROM gxtrjdta.tenecx

Select * from gxopera.Factura where FACTIPO = 'CR' and FACSTATUS = 'P' and FACSALDO > 0 and FACVENC < 20161231
10010027894

select * from contabilid.ccasi20

delete from contabilid.ccasi20

select * from gxopera.factura where factnro = '10010027894'
0700489
Select * from gxopera.Factura where FACTIPO = 'CR' and FACSTATUS = 'P' and FACSALDO > 0 and FACVENC < 20161231

select * from gxopera.recibos where rid = '882335'--cocomer = '8600157'


select * from gxopera.factura where faclien = '8600157' order by factotal 10030008347

select * from gxopera.factura1 where factnro = '10030008347'
--where rid = '882222'                                           

----RPA-----
factura factura1 recibos fcobros

select * from gxopera.trxinst where insemiso = '002'

select * from gxopera.trxinst where INSFACLIEN = '0701335'
delete from gxopera.trxinst 

select * from gxopera.flicom
delete from gxopera.flicom

select * from gxopera.flicom1
delete from gxopera.flicom1

select * from gxopera.recibos where rfech > '20191231'
delete from gxopera.recibos

select * from gxopera.fcobros
delete from gxopera.fcobros

delete from gxopera.factura
delete from gxopera.factura1

select * from contabilid.ccasi19 order by ASFECH desc
select * from javierlib.ccasi19
select * from contabilid.ccasi20 order by ASFECH desc


select * from gxopera.opmmarc where macocr = '520'

SELECT * FROM GXOPERA.OPMTARI WHERE TAMARCA = 'DIN' AND TAENPRO='520' AND TAENADM = '002'

 Select ENEADM, 'ADM', LCODBC, LBCOCR, LIDCOM, LBINPR, Lfectr   ,      
        SUBSTR(LCODTR, 1, 2), ENEPRO, LENEMI, COUNT(*), SUM(LIMPGS)
   from LIBDEBITO.DRCONBEP                                        
  where Lfectr = '20200603'  and SUBSTR(DIGITS(lidcom), 6, 2) = '90'   --(Lfectr between '20200601' and '20200630')
    and LCODBC = 'DIN' and LBCOCR = '520'                     
    and lcretr = '00' and lesttr = 'A' --and LBINPR in (425935,425936,443076)     
    and substr(lcodtr, 1, 2) = '01' --and ENEADM = :w1ENADM         
  GROUP BY ENEADM, LCODBC, LBCOCR, LIDCOM, LBINPR, lfectr,           
        SUBSTR(LCODTR, 1, 2), ENEPRO, LENEMI
        
select * from gxopera.opmcatm where cafecha > '' and caproce = '520' and camarca = 'DIN'	--and catarje in (425935,425936,443076)

delete from gxopera.opmcatm where cafecha = '20200603'

UPDATE CIERRELIB.GCONTRP
   SET COTIPC = '*NORMAL '
WHERE COCODI = '001';

select * from libdebito.drconbep where (lfectr between '20200530' and '20200531')

select * from libdebito.drconbep where lfectr = '20200531'

select count (*) from yapi.drconbepjn where (lfectr between '20200530' and '20200531')

--PARA REPORTE 

SELECT factipo TIPO, factnro NRO_FACT, faclien COD_COM, facgraba GRABADA, facexenta EXENTA, faciva IVA, factotal TOTAL, facfech FECHA, facvenc VENCIMIENTO, facnroasi ASIENTO_NRO
FROM gxopera.Factura
WHERE FACTIPO = 'CR'
AND   FACSTATUS = 'P'
AND   FACSALDO > 0
AND   FACVENC < 20161231
and factacble = '101031000000005'
and faclien = '0200255'
--and factnro = '10010009869'

select * from gxbdbps.auprctd

select * from gxopera.factura where facclien = ''facstatus = 'P'

select * from gxweb.opliqui where OPSTATOB <> '' and OPFECLIQ > '20200600' and OPNCOMER = '0700161' --and OPCODBCO = '55'

select * from gxweb.opentid order by reenti


select * from gxopera.factura where facfech = '20200402' and faclien = '8100744' 

select * from javierlib.facturabk where facfech = '20200402' and faclien = '8100744' 


select * from gxbdbps.ait003 where aitcid = '05' where aitcrfhaud like '%2020-06-26%'


select * from libdebito.drconbep where lfectr = '20200715' order by lhortr desc

select * from gxopera.facrend
Select * from gxopera.Tfamrel where FARELENTIP = '305'
7341
13252


select COMNRORND from gxopera.fcobros

select 

select * from gxopera.opmtari where 

Select * from gxopera.opmtari where TAENADM = '089'

select * from gxopera.tfamrel

Select * from gxopera.opmcatm where cafecha between 20200601 and 20200601 and CACODAD ='305' and CAENEMI = '107'

select * from gxopera.opentid

Select * from gxopera.opmcatm where cafecha between 20200601 and 20200630 and CACODAD ='305' and CAENEMI = '107'

select cafecha, cacotiz from yapi.opmcatm where cafecha = 20200604
--and '20200630' group by cafecha

delete from gxopera.opmcatm where cafecha between 20200601 and 20200631

select * from gxopera.factura where facstatus = 'P' and faclien = '1301516'

select * from gxopera.tclsec where seccobco = '083'

select ENEMISO from gxbdbps.comaeaf where cocomer = '0100001'

select * from gxopera.fcobros where comnrornd = '13265'

select * from contabilid.tatgene

select * from libdebito.drconbep where lfectr = '20200804'

select A.*, B.* FROM MASTERCARD.MASCTLDTA AS A INNER
JOIN MASTERCARD.MASTRNDTA AS B ON
A.MCRRNBEPSA = B.MCRRNBEPSA AND A.MTI = B.MCMTI
INNER JOIN LIBDEBITO.DRCONBEP AS C ON A.MCRRNBEPSA = C.LERRNB AND
A.MC038 = C.LCAUTR AND B.MCIMPORTE = C.LIMPGS AND
B.MCFECCOM between '20200924' and '20200925'
WHERE MC039 = '00' AND A.MTI = 0110 AND B.MCROL = 'ADQ'
AND B.MCIMPORTE > 0 AND C.LFCOTR between '20200924' and '20200928'
AND B.MASIPMPRC <>'N'

2020-09-28-10.55.01.211000GetTcpAddr() Valor del sAddress :10.126.150.55                                                          
 2020-09-28-10.55.01.214000 MIPCOMMCTL - agregaLista() hace Spawn del Programa  :DRVIPMCNV MASTERCARDÖj ðå Lib: MASTERCARDÖj ðå    
 2020-09-28-10.55.01.254000 MIPCOMMCTL - agregaLista() hace Spawn del Programa  :A         A         Öj ðå Lib: A         Öj ðå    
 2020-09-28-10.55.01.255000 MIPCOMMCTL - agregaLista() hace Spawn del Programa  :A         A         Öj ðå Lib: A         Öj ðå    
 2020-09-28-10.55.01.257000 preparaSenales() Ingreso a Rutina de Prendido de Se?ales                                               
 2020-09-28-10.55.01.262000 DRVIPMCNV - Programa Activo                                                                            
 2020-09-28-10.55.08.224000DRVIPMCNV() Lectura del Dtaq : 60 Mensaje -> : 00401R1190782427222                         0000000000000
 2020-09-28-10.55.08.225000DRVIPMCNV() Mensaje a Enviar - Long : 62 Mensaje -> :   00401R1190782427222                         0000
 2020-09-28-10.55.08.284000DRVIPMCNV() Mensaje Recibido - Long : 11 Mensaje -> :   9980100    0000000000000000000000000000000000000

SELECT * FROM GXOPERA.FLICOM WHERE LIFECHD = '20200925';

SELECT * FROM GXOPERA.FLICOM1 WHERE LIFECHD = '20200925';

SELECT * FROM GXOPERA.OPRECLE WHERE REFECH = '20200925';

SELECT * from GXOPERA.OPMOVI WHERE OPFECOM = '20200925';

SELECT * FROM GXOPERA.OPLIQUI WHERE SUBSTR(OPCAMPOA,)

select * from contabilid.ccasi20 where asfesi = 281020;

select * from gxopera.fctacom where ctauser = 'U99JAVIER';

select * from gxtrjdta.tcoenc where encentant in ('066','054','059');

SELECT * FROM GXOPERA.CLPARF where parcodbco in ('066','054','059')

select * from gxopera.tafinaf;

CREATE INDEX GXBDBPS.UCOMAEAF2 
	ON GXBDBPS.COMAEAF ( COENPRO ASC , COSTAT ASC , COCOMER ASC )   
	;
	
CREATE INDEX GXBDBPS.UCOMAEAF3 
	ON GXBDBPS.COMAEAF ( ENEMISO ASC , TIPACODI ASC , COCOMER ASC )   
	;
	
CREATE INDEX GXBDBPS.UCODTOAF1 
	ON GXBDBPS.CODTOAF ( CODTODESC ASC , CODDTO ASC )   
	;

select * from gxopera.tdavistas where TDAANHO = '2021' and tdames = '01';

select * from libdebito.drconbep where lfectr between '20210101' and '20210131'

select * from gxopera.OPMRTRX;

SELECT * FROM GXFINDTA.TCLMOV WHERE MOVFTRX BETWEEN '20210201' AND '20210212'
