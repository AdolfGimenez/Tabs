select * from gxbdbps.tcuo1af WHERE CUCODAU = '713858'

--CASO DE CUOTAS SIN INTERESES CON EL TIO--
--busqueda por codigo de comercio
SELECT * FROM GXBDBPS.TPROCUIN WHERE PMCODIG IN
(SELECT PMCODIG FROM GXBDBPS.Tcopraf where pmcodig in 
(SELECT pmcodig FROM GXBDBPS.TPROMaf where pmbines = '627431' 
and pmemiso = '021' and pmstats = 'A' and pmafini = ''  and 
'20200430' >= pmfchin and '20200430' <= pmfchfi) and cocomer = '0100001')
AND 7 >= PCUCANTD AND 7 <= PCUCANTH 
--busqueda por codigo de comercio
SELECT pmperio FROM GXBDBPS.TPROMAF WHERE PMCODIG IN 
(SELECT PMCODIG FROM GXBDBPS.TPROCUIN WHERE PMCODIG IN
(SELECT PMCODIG FROM GXBDBPS.Tcopraf where pmcodig in 
(SELECT pmcodig FROM GXBDBPS.TPROMaf where pmbines = '627431' 
and pmemiso = '021' and pmstats = 'A'  and 
'20200430' >= pmfchin and '20200430' <= pmfchfi) and cocomer = '0100001')
AND 2 >= PCUCANTD AND 6 <= PCUCANTH) 
--busqueda por rubro comercial
SELECT pmperio FROM GXBDBPS.TPROMAF WHERE PMCODIG IN 
(SELECT PMCODIG FROM GXBDBPS.TPROCUIN WHERE PMCODIG IN
(SELECT PMCODIG FROM GXBDBPS.Trupraf where pmcodig in 
(SELECT pmcodig FROM GXBDBPS.TPROMaf where pmbines = '627431' 
and pmemiso = '002' and pmstats = 'A' and pmafini = ''  and 
'20200226' >= pmfchin and '20200226' <= pmfchfi) and rucodi = '03')
AND 3 >= PCUCANTD AND 3 <= PCUCANTH) 

select * from gxbdbps.tmtaraf


--Redmine #5325 - DUKPT
select lnrtar, lhisde, LFCOTR, LFECTR, LIMPGS, LBINPR, LCOMTR, LCRETR, LESTTR, LECA62 from libdebito.drconbep 
where  lfectr = '20200304' and lbinpr in ('627431', '703002', '703020') 
order by lhortr desc; 

--redmine #5443, Mensaje en boucher POS, dependiendo de la tarjeta(bin, entidad)
SELECT * FROM GXBDBPS.MSGPOSTEXT

select * from libdebito.drconbep where lfectr = '20200428' order by LHORTR asc

select * from libdebito.bst015

select * from libdebito.bst015 where bs15codcom like  '%0100001%'

0981155669
0981895330


--reporte de DETALLES DE COMERCIOS DE BAJA
select * from atmcentre.tbbine0p where qebi10 = '627431002'



--Testing de pruebas con Ingenico

[9:05] Jose Alberto Bagnoli
    select * from libdebito.drconbep where lfectr = '20200709'  order by lhortr desc 
?[9:06] Jose Alberto Bagnoli
    
select * from gxopera.opliqui where opfecliq = '20200504'


select * from gxopera.flicom1 where lifechd = '20200504' and licomer = '0100001'


select * from gxopera.flicom where lifechd = '20200504' and licomer = '0100001'


select * from gxopera.oprecle where recomer = '0100001' and refech = '20200504'
select * from gxopera.opmovi where opferea = '20200504'

--

select * from libdebito.drconbep where lfectr = '20200731' and lcomtr like 'ATM BANCO RIO MATRIZ ENC%' and lhortr > '160000'
select * from gxbdbps.comaeaf where cocomer in('0100001')

select * from gxopera.tclsec

Select * from gxopera.opliqui where opfecliq = '20200708'

select * from gxbdbps.tswaut where autrrnbep = '021300058404'

select * from libdebito.drconbep where lfcotr = '20200709' and  lerrnb = ''

select * from gxbdbps.tcodpp where cocomer = '0100001'

Select * from gxopera.opliqui where opfecliq = '20200709' and ophorliq > '070000';--and opcodbco = '64'
Select autentrol, auttrxhorf,autestcle, autestrev, auttrxestf, autrrnbep, autcodser, autdistip, autcodpre, autcodret, autbinemi, autmontdes, autmoncom from gxbdbps.tswaut where auttrxfchc = '20200709' and auttrxhorf > '07:00:00';
SELECT SERCODI, TPCDISP, TPCFTRX, TPCHTRX, TPCIMPGS, TPCRRNBEP, TPCCODRE, TPCESTRX, TPCESCLE FROM GXFINDTA.TCLTPC WHERE tpcfpro = '20200709' and tpchtrx > '00:000:05'; --temporal
SELECT * FROM GXFINDTA.TCLMOD WHERE MOVIDMOV > 1274293; --mov detalle
SELECT MOVIDMOV, MOVFTRX, MOVHTRX, MOVESTA, MOVCODIS, MOVFPRO, MOVCOAU, MOVNTAR, MOVRRNBEP, MOVIMPO FROM GXFINDTA.TCLMOV WHERE MOVFPRO = '20200709' order by MOVHTRX; --mov cabecera
SELECT * FROM GXFINDTA.TCLTSB WHERE TSBFEGE > '2020-07-09 00:00:00'; --tabla de transmisiones
Select cocomer, codeno, enemiso, adnumcta from gxbdbps.comaeaf where cocomer = '0100001'


--verificación de tablas del autorizador con Dolores y Alberto

select * from libdebito.drconbep where lfcotr = '20200525' /*and lcodtr = '000000' */ and lerrnb in ( '014373181934', '014373181923','014373181898')

--verificacion de trx visa, rol emisor
select * from libdebito.drconbep where lfcotr = '20200706' AND lerrnb in ('014373182202','014373182203');
Select * from gxbdbps.tswaut where auttrxfchc = '20200701' and auttrxhorf > '07:00:00' and autrrnbep in ('014373182202','014373182203');
select * from visa.visctldta where virrnbepsa in ('014373182202','014373182203');
select * from visa.vistrndta where vifeccom = '20200701' virrnbepsa in ('014373182202','014373182203');
select * from doloreslib.tdgbin where BINNROBIN  = '488234';

--verificacion de trx mastercard, rol adquirente
select * from libdebito.drconbep where lfcotr = '20200525' AND lerrnb = '014373181923';
Select * from gxbdbps.tswaut where auttrxfchc = '20200709' and auttrxhorf > '07:00:00' and autrrnbep = '014373181923';
select * from mastercard.masctldta where mcrrnbepsa = '014373181923';
select * from mastarcard.mastrndta where mcrrnbepsa = '014373181923';

--mastercard emisor
select * from libdebito.drconbep where lfcotr = '20200525' AND lerrnb = '014673363112';
Select * from gxbdbps.tswaut where auttrxfchc = '20200525' and auttrxhorf > '07:00:00' and autrrnbep = '014673363112';
select * from mastercard.masctldta where mcrrnbepsa = '014673363112';
select * from mastarcard.mastrndta where mcrrnbepsa = '014673363112';



select * from doloreslib.visctldta where  virrnbepsa = '014673413265'

select * from visa.vistrndta where  virrnbepsa = '014673413265'

select * from doloreslib.tdgbin where binusualta = 'MIGRACION'

select * from doloreslib.tdgbin where BINNROBIN  = '488234'

select * from gxfindta.tclpre

select * from GXTRJDTA.TDGDPV --tabla de dispositivos

select * from libdebito.drconbep where lfcotr = '20200525' /*and lcodtr = '000000' */ and lerrnb in ( '014373181934', '014373181923','014373181898')


--redmine #7844 - Testing - Ajustes en transacciones de extracción en cuotas en atm
select lerrnb REF_NRO, lnrtar TARJETA, lcodbc MARCA, lhisde DESTINO_TRX, lidcom COD_COM, lfectr FECHA_TRX, lhortr HORA_TRX, limpgs IMPORTE, lcuota CANT_CUOTAS, lcomtr ATM, lcretr COD_TRX, lesttr ESTADO_TRX  from libdebito.drconbep where substr(lerrnb,9,4) in ('7833') and lfectr = '20200720';
select lerrnb REF_NRO, lnrtar TARJETA, lcodbc MARCA, lhisde DESTINO_TRX, lidcom COD_COM, lfectr FECHA_TRX, lhortr HORA_TRX, limpgs IMPORTE, lcuota CANT_CUOTAS, lcomtr ATM, lcretr COD_TRX, lesttr ESTADO_TRX  from libdebito.drconbep where substr(lerrnb,9,4) in ('7836') and lfectr = '20200720';
select lerrnb REF_NRO, lnrtar TARJETA, lcodbc MARCA, lhisde DESTINO_TRX, lidcom COD_COM, lfectr FECHA_TRX, lhortr HORA_TRX, limpgs IMPORTE, lcuota CANT_CUOTAS, lcomtr ATM, lcretr COD_TRX, lesttr ESTADO_TRX  from libdebito.drconbep where substr(lerrnb,9,4) in ('7839') and lfectr = '20200720';
--join libdebito.tbcretop b where a.lcretr = b.codnro
select * from libdebito.drconbep where substr(lerrnb,9,4) = '7833' and lfectr = '20200720'
--codigos de respuesta
select * from LIBDEBITO.TBCRET0P where codnro = '51'

--AND lcodbc = 'MST' and lbinpr = '230729' and  lerrnb in ( '014673363112')


---#7981 - DRCONINSER

select * from libdebito.drconbep where lfectr = '20200803' and lhortr > '083000' and lcomtr = 'ATM BANCO RIO MATRIZ ENC.' order by lhortr desc


select * from gxbdbps.tswaut where auttrxfchc = '20200803' and auttrxhorf > '08:30:00' and autrrnbep IN (
'021600058673',
'021600058671',
'021600058668',
'021600058666',
'021600058664',
'021600058600',
'021600058597',
'021600058592',
'021600058590',
'021600058587',
'021600058584',
'021600058581',
'021600058578',
'021600058574',
'021600058571',
'021600058568',
'021600058564',
'021600058561',
'021600058556',
'021600058553',
'021600058550',
'021600058547',
'021600058544',
'021600058539',
'021600058534',
'021600058531',
'021600058524',
'021600058521',
'021600058516',
'021600058513',
'021600058510',
'021600058507',
'021600058505',
'021600058502',
'021600058500',
'021600058497',
'021600058492',
'021600058489',
'021600058486',
'021600058483',
'021600058480',
'021600058477',
'021600058474',
'021600058471',
'021600058468',
'021600058465',
'021600058463',
'021600058462',
'021600058461',
'021600058458',
'021600058455',
'021600058452',
'021600058449',
'021600058446',
'021600058443',
'021600058440',
'021600058437')

-----------------
-billetera claro-
-----------------
SELECT *
FROM libprod.drconbe60
WHERE lfcotr = '20200825'
/*and lerrnb in
('023800064221',
'023800064218',
'023800064215',
'023800064212')*/
--and lcotel = '0986000000'
and LBINPR in ('627431', '703002', '703040')
and lcodtr = '000054'
and lcretr = '00'
ORDER BY lhortr DESC;

select * from gxbdbps.comaeaf;

select * from gxbdbps.tswaut where AUTRRNBEP = '023900064481';

select * from javierlib.tswautvm where AUTTRXFCHC in ('20200904', '20200907') order by AUTTRXHORF desc;

select * from javierlib.DRCONBEPVM where lfectr in ('20200904', '20200907', '20200908') and lbinpr = '516400' and lcodtr = '301000' order by lhortr asc;

select * from javierlib.drconbep;

select * from javierlib.tswaut;


select * from javierlib.drconbep;

select * from javierlib.tswaut;
--caso de transacciones con tarjeta unica
select * from libdebito.drconbep where lfectr = '20201015' and lcodbc = 'UNI' order by lhortr desc;
select * from libdebito.TBBINE0P where qebin1 = '600691'; 

--caso de transacciones rechazadas con billetera personal
select * from libdebito.drconbep where lfectr = '20201015' and lhisde = '*PERSON' order by lhortr desc;

--caso de fee por transacciones en ATM, POS con tarjeta Visa Debito Conti

select * from libdebito.drconbep where lfectr = '20210224' and lbinpr = '456976' order by lhortr desc;

select lctaor CUENTA_ORIGEN, lctade CUENTA_DESTINO, lnrtar TARJETA, lcodbc MARCA, lfectr FECHA_TRX, limpgs IMPORTE, limpds DESCUENTO, lsaltr SALDO, lcomtr COMERCIO, lcodtr COD_TRX, lcretr COD_RETORNO,
lesttr ESTADO_TRX, lerrnb RRN from libdebito.drconbep where lfectr = '20210224'  and lbinpr = '456976' order by lhortr desc;

select autcodser SERVICIO, autcodpre PRESTACION, autcodcomb COD_COMERCIO, autcomraz COMERCIO, autdistip DIPOSITIVO,  autmartar MARCA, autprotar PRODUCTO, 
autpannro TARETA, autrrnbep RRN, autcodret COD_RETORNO, auttrxestf ESTADO_TRX, auttrxcod COD_TRX
from gxbdbps.tswaut where AUTRRNBEP in (
'105500139907',
'105500139872',
'105500139869',
'105500139866',
'105500139862'
);

select * from visa.vistrndta where VIRRNBEPSA in (
'105500139907',
'105500139872',
'105500139869',
'105500139866',
'105500139862'
);

select * from visa.visctldta where VIRRNBEPSA in (
'105500139907',
'105500139872',
'105500139869',
'105500139866',
'105500139862'
);

select * from gxbdbps.comms;

select lgfechor FECHA, lgmsg MENSAJE from gxbdbps.lgcoment order by lgfechor desc;

--caso sara

select * from libdebito.TBCTRA0P

select * from gxbdbps.tmctaaf where mcnumct = '20110600954'; 

select * from gxbdbps.tmtaraf where mtnumta IN ('6274310213009623');

select * from gxbdbps.tmoviaf where mvfepro = '20210617' order by mvsecue desc;--MVNUMCT = '20110600954';

select * from libdebito.drconbep where lerrnb = '116800166500';

SELECT * FROM GXBDBPS.TMOVIAF WHERE MTNUMTA IN ('6274310211000152', '5476970000000081') AND MVFEVAL = '20210617';

cnxrg400 --procesa

--casos archivos deb, 
TLOGSAF    GXBDBPS  
TDCTAAD    GXBDBPS  
TDCTA      GXBDBPS  
TDEMNOTAR  GXBDBPS  
TDEMIS     GXBDBPS  
TDEMISNOV  GXBDBPS  
DRCONBEP   LIBDEBITO
DRCONBEL03 LIBDEBITO
DRCONBEP   LIBDEBITO

SELECT * FROM GXTRJDTA.TTDCDB t WHERE CDBIDCTA IN ('2120515415', '0123753003');
SELECT * FROM GXTRJDTA.TTDEMI t WHERE CDBIDCTA IN ('2120515415', '0123753003');

SELECT * FROM GXTRJDTA.TTCCTA t WHERE CTAIDCTA =' 2120515415';
SELECT * FROM GXTRJDTA.TTDCDB t WHERE CDBIDCTA IN ('2120515415', '0123753003');
SELECT * FROM GXTRJDTA.TTDEMI t WHERE CDBIDCTA IN ('2120515415', '0123753003');
SELECT * FROM GXTRJDTA.TTDCAD t WHERE CDBIDCTA IN ('2120515415', '0123753003');
SELECT * FROM GXTRJDTA.TTDCRE t WHERE CDBIDCTA IN ('2120515415', '0123753003');
