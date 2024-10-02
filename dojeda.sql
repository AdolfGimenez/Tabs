select lerrnb,lcodtr, lcautr,lcodbc, lenemi, lhortr, lnrtar, lbinpr, lhisor, lhisde,lidtra, eneadm, enepro, lntoke, lposem, limpgs
from libdebito.drconbep where lfcotr = '20200702' and lcodtr = '011000' and lcretr = '00' and lesttr = 'A' and substr(lidtra,1,1) = 'T' and lerrnb in ('018384482283', '002446359135') ;

select * from gxbdbps.tswaut where auttrxfchc = '20200702' /*auttrxcod = '003000'*/ and autrolbep = 'ISS' and autmartar = 'MST' autrrnbep = '018384442492';
select * from gxbdbps.tswaut where auttrxfchc = '20200702' and autrolbep  = 'ADQ' and autbinadq <> '627431'

select lerrnb,lcodtr, lcautr,lcodbc, lenemi, lhortr, lnrtar, lbinpr, lhisor, lhisde,lidtra, eneadm, enepro, lntoke, lposem, limpgs
from libdebito.drconbep where lfcotr = '20200702' and lcodtr = '011000' and lcretr = '00' and lesttr = 'A' and substr(lidtra,1,1) = 'T' and lerrnb = '018384443173';
select * from gxbdbps.tswaut where auttrxfchc = '20200702' and autrolbep  = 'ADQ' and AUTRRNBEP = '018384443173'; --and autbinadq <> '627431' and autcodret = '00' and auttrxestf = 'A' and AUTMARTAR = 'VSA' and autcodpre = 'ADCA'
select * from doloreslib.tdgbin where substr(binnrobin,1,6) = '703002';
select * from gxcledta.tclpre where prematrx = '011000';

select AUTCOMMCC,    AUTSTANMI,    AUTPOSENTM,    AUTMTIMI ,    AUTRRNMI ,    AUTESTREV ,AUTMONTORI,    AUTMONORI,AUTBINADQ,AUTROLBEP, autsercod
 from gxbdbps.tswaut where autrrnbep = '019600057332';
select * from visa.visctldta where virrnbepsa = '019600057332';
select * from visa.vistrndta where virrnbepsa = '019600057332';

select AUTCOMMCC,    AUTSTANMI,    AUTPOSENTM,    AUTMTIMI ,    AUTRRNMI ,    AUTESTREV ,AUTMONTORI,    AUTMONORI,AUTBINADQ,AUTROLBEP, autsercod
 from gxbdbps.tswaut where auttrxfchc = '20200702' and AUTRRNBEP = '018384482283';
 select * /*mcrrnbepsa, MC018,MC011,MC022,mti,MC037,MC004, MCREVFLG,MC049,MC032, MCROL*/ from mastercard.masctldta where mcrrnbepsa = '018384482283';
select mcrrnbepsa, MCPANSVC from mastercard.mastrndta where mcrrnbepsa = '018384482283';

select * from doloreslib.tdgbin where substr(binnrobin,1,6) = '703002';

select * from gxcledta.tclpre where prematrx = '011000';

select * from doloreslib.TDGEMP where proidprodu = 'DIN';

select * from doloreslib.tcoenc where encentant = '074';

------------------------------
------------------------------
------------------------------

select * from libdebito.drconbep where lfectr = '20200714' and lhortr > 151000  and lerrnb= '019600057351'; --   

select * from gxbdbps.tswaut  WHERE  AUTTRXFCHc  = '20200714' and autrrnbep = '019600057351';

select virrnbepsa, v018,V011,V022,mti,V037,V004, VIREVFLG,V049,V032, VIROL from visa.visctldta where virrnbepsa = '019600057351';

select virrnbepsa, VIPANSVC from visa.vistrndta where virrnbepsa = '019600057351';

select * from doloreslib.tdgbin where substr(binnrobin,1,6) = '476134';

select * from gxcledta.tclpre;

select * from libdebito.drconbep a where a.lbinpr = '601638' AND a.LFECTR = '20200601' AND a.lerrnb = '015376713213'; 

select * from gxbdbps.MCT464EREC where T464ERRfNu = '015376713213'
select * from gxbdbps.MCT464fhdr where T464fhrid = 164

select * from libdebito.

select * from libdebito.drconbep05

-------------------------------------
-------------------------------------
-------------------------------------

select * from libdebito.drconbep where lfcotr = '20200703' and lerrnb= '018484885613';


select * from libdebito.drconbep where lfcotr = '20200703' and substr(lidtra,1,1) = 'P' and lcodbc = 'DIN';
select * from libdebito.drconbep where lfcotr = '20200703' and substr(lidtra,1,1) = 'P' and lcodbc = 'DCR';

select * from libdebito.drconbep where lfcotr = '20200703' and substr(lidtra,1,1) = 'P' and lcodbc = 'VSA' and substr(lcodtr,1,1) = '3'


--select * from gxbdbps.tswaut where auttrxfchc = '20200715' and autrolbep = 'ADQ' and autmartar = 'VSA' and auttrxcod = '000054' and autcodret = '00';
select * /*AUTCOMMCC,    AUTSTANMI,    AUTPOSENTM,    AUTMTIMI ,    AUTRRNMI ,    AUTESTREV ,AUTMONTORI,    AUTMONORI,AUTBINADQ,AUTROLBEP, autsercod*/
 from gxbdbps.tswaut where auttrxfchc = '20200703' and AUTRRNBEP = '018484896199' ;
 
select * from doloreslib.tdgbin where substr(binnrobin,1,6) = '502026';
select * from gxcledta.tclpre where PRECOTRX = '304000'; 




select mcrrnbepsa, MC018,MC011,MC022,mti,MC037,MC004, MCREVFLG,MC049,MC032, MCROL from mastercard.masctldta where mcrrnbepsa = '018484896199';
select mcrrnbepsa, MCPANSVC from mastercard.mastrndta where mcrrnbepsa = '018484896199';


select virrnbepsa, v018,V011,V022,mti,V037,V004, VIREVFLG,V049,V032, VIROL from visa.visctldta where virrnbepsa = '019600057351';

select virrnbepsa, VIPANSVC, vifeccom from visa.vistrndta where virrnbepsa = '019600057351';

// Procesadora Emisor y rol Adquirente BEPSA
    if     (substr(&AUTBINADQ,1,6) = '473204' OR substr(&AUTBINADQ,1,6) = '473230' OR substr(&AUTBINADQ,1,6) = '422745' OR substr(&AUTBINADQ,1,5) = '19696' OR  substr(&AUTBINADQ,1,9) = '960023198' or substr(&AUTBINADQ,1,6) = '627431' )
        &AUTPROADQ = 9000   // Procesadora Adquirente cuando el bin adquirente es nuestro
        if  &AUTPROEMI = 9000 and (&MST = 'S' or &VSA = 'S' or &DIN = 'S')
            &AUTROLBEP = 'ISA'
        endif
    endif

select * from doloreslib.tdgbin where substr(binnrobin,1,6) = '476134';

select * from gxcledta.tclpre where PRECOTRX = '000054';

select coenadm, coenpro from gxbdbps.comaeaf where cocomer = '0100001';

select * from doloreslib.tcoenc where encentant = '999';

select * from libdebito.drconbep where lfcotr = '20200714' and substr(lidtra,1,1) <> 'T' and lcretr = '00' and lcodbc = 'VSA'




------------------
------------------
-- Adelanto efectivo en ATM (011000 para Cta ahorro y 012000 para Cta. Cte)
select * from libdebito.drconbep where lfcotr = '20200708' and lcodtr in ('012000') and lbinpr = '703002' and substr(lidtra,1,1) = 'T' and lerrnb = '018985956083' /*and lerrnb = ''*/;

select * from gxbdbps.tswaut where auttrxfchc = '20200708' and autrrnbep = '018985956083';

select * from doloreslib.tdgbin where substr(binnrobin,1,6) = '703002';

select * from gxcledta.tclpre where prematrx in ('012000');

-- Consulta de saldo en ATM - VISA
select * from libdebito.drconbep where lfcotr = '20200708' and substr(lidtra,1,1) = 'T' and substr(lcodtr,1,1) = '3'  and lcodbc = 'VSA' and lbinpr = '488234' and lerrnb = '018985953202';

select AUTCOMMCC,AUTSTANMI,AUTPOSENTM,AUTMTIMI,AUTRRNMI,AUTESTREV,AUTMONTORI,AUTMONORI,AUTBINADQ,AUTROLBEP, AUTAMBBIN, AUTCODPRE, AUTCODSER, AUTESTCLE, AUTMARTAR, AUTPANNRO, AUTPROEMI, 
AUTPROTAR, AUTENTROL, AUTENTADM,AUTENTPRO, AUTDISTIP, AUTTRXCOD, AUTTRXESTF,AUTTRXFCHC,AUTESTCLE
from gxbdbps.tswaut where /*auttrxfchc = '20200708' and*/ autrrnbep = '018985953202';

select virrnbepsa, viPANSVC from visa.vistrndta where virrnbepsa = '018985953202';

select virrnbepsa, v018,V011,V022,mti,V037,V004, VIREVFLG,V049,V032, VIROL from visa.visctldta where virrnbepsa = '018985953202';

select virrnbepsa, VIPANSVC from visa.vistrndta where virrnbepsa = '018985953202';

select * from doloreslib.tdgbin where substr(binnrobin,1,6) = '488234';

select * from gxcledta.tclpre where prematrx in ('300000');


-- Consulta de saldo en POS - VISA
select * from libdebito.drconbep where lfcotr = '20200708' and substr(lidtra,1,1) = 'P' and substr(lcodtr,1,1) = '3'  and lcodbc = 'VSA' and lbinpr = '488234' /*and lerrnb = ''*/;

select AUTCOMMCC,AUTSTANMI,AUTPOSENTM,AUTMTIMI,AUTRRNMI,AUTESTREV,AUTMONTORI,AUTMONORI,AUTBINADQ,AUTROLBEP, AUTAMBBIN, AUTCODPRE, AUTCODSER, AUTESTCLE, AUTMARTAR, AUTPANNRO, AUTPROEMI, 
AUTPROTAR, AUTENTROL, AUTENTADM,AUTENTPRO, AUTDISTIP, AUTTRXCOD, AUTTRXESTF,AUTTRXFCHC,AUTESTCLE
from gxbdbps.tswaut where auttrxfchc = '20200708' and autrrnbep = '018985957303';

select virrnbepsa, MCPANSVC from visa.vistrndta where virrnbepsa = '';

select virrnbepsa, v018,V011,V022,mti,V037,V004, VIREVFLG,V049,V032, VIROL from visa.visctldta where virrnbepsa = '';

select virrnbepsa, VIPANSVC from visa.vistrndta where virrnbepsa = '';

select * from doloreslib.tdgbin where substr(binnrobin,1,6) = '488234';

select * from gxcledta.tclpre where prematrx in ('301000', '304000');

-- Reversa Trx Compra - Dinelco Debito POS 
select * from libdebito.drconbep where lfcotr = '20200708' and lcodtr in ('000054') and lbinpr = '703002' and substr(lidtra,1,1) = 'P' /*and lerrnb = ''*/;

select * from gxbdbps.tswaut where auttrxfchc = '20200708' and autrrnbep = '018985957303';

select * from doloreslib.tdgbin where substr(binnrobin,1,6) = '703002';

select * from gxcledta.tclpre where prematrx in ('000054');

-- Reversa Trx Compra - Dinelco Credito POS 
select * from libdebito.drconbep where lfcotr = '20200708' and lcodtr in ('000054') and lcodbc = 'DCR' and substr(lidtra,1,1) = 'P' and lenemi = '002' and lerrnb = '019085986536';

select AUTRRNBEP,AUTMSGREV,AUTTRXESTF,AUTTRXFCHC,AUTESTCLE
 from gxbdbps.tswaut where auttrxfchc = '20200720' and autrrnbep = '019085989028';

select * from doloreslib.tdgbin where substr(binnrobin,1,9) = '627431002';

select * from gxcledta.tclpre where prematrx in ('000054');


-- Reversa Adelanto efectivo en ATM (011000 para Cta ahorro y 012000 para Cta. Cte)
select * from libdebito.drconbep where lfcotr = '20200708' and lcodtr in ('012000') and lbinpr = '703002' and substr(lidtra,1,1) = 'T' /*and lerrnb = ''*/;

select * from gxbdbps.tswaut where /*substr(autrrnbep,9,4) = '7332' and*/ AUTDISTIP = 'ATM' and AUTMARTAR = 'DIN' and AUTTRXESTF = 'A' and autmontori = '0' and auttiptar = 'C' --and AUTTRXCOD = '011000'--and AUTPROTAR = 'C';--and AUTROLBEP = 'ISS'
select * from gxbdbps.tswaut where autrrnbep = '012570129691'
select * from doloreslib.tdgbin where substr(binnrobin,1,6) = '703002';
select * from libdebito.drconbep where 

select * from gxcledta.tclpre where prematrx in ('012000');

--MASTERCARD
select MC018,MC011,MC022,mti,MC037,MC004, MCREVFLG,MC049,MC032, MCROL from mastercard.masctldta where mcfeccom = '20200709' and mcrrnbepsa = ''

select mcrrnbepsapsa, MCPANSVC from mastercard.mastrndta where mcrrnbepsa = '';

select * from libdebito.drconbep where lfectr = '20200727' and LCAUTR = '000487' order by lhortr --lcodtr = '000000' and substr(leca62,1,1)='T' and substr(lerrnb,9,4)='2492' and lcodbc = 'MST'

select * from gxbdbps.tswaut where auttrxfchc = '20200727' and autrrnbep = '020900058183';

select * from visa.vistrndta where virrnbepsa = '020900058183'--VIFECREAL = '20200727'

select * from visa.visctldta where VIFECREAL = '20200727' and 

select * from gxbdbps.tsworicta;

--TRX CABAL
select * from libdebito.drconbep where lfectr = '20200904' AND LCODBC = 'CAB' order by LHORTR desc;

select * from libdebito.drconbep where LERRNB = '024899684552';
select * from gxbdbps.tswaut wheRE  autrrnbep = '024899684552';

--TRX PANAL
select * from libdebito.drconbep where lfectr = '20200904' AND LCODBC = 'CAB' order by LHORTR desc;

select * from libdebito.drconbep where LERRNB = '024899684552';
select * from gxbdbps.tswaut wheRE  autrrnbep = '024899684552';

--TRX CREDICARD
select * from libdebito.drconbep where lfectr = '20200904' AND LCODBC = 'CAB' order by LHORTR desc;

select * from libdebito.drconbep where LERRNB = '024899684552';
select * from gxbdbps.tswaut wheRE   autrrnbep = '024899684552';

--TRX UNICA
select * from libdebito.drconbep where lfectr = '20200904' AND LCODBC = 'UNI' order by LHORTR desc;

select * from libdebito.drconbep where LERRNB = '024899684184';
select * from gxbdbps.tswaut wheRE  autrrnbep = '024899684184';

--TRX CREDICARD
select * from libdebito.drconbep where lfectr = '20200904' AND LCODBC = 'BIL' order by LHORTR desc;

select * from libdebito.drconbep where LERRNB = '024899678917';
select * from gxbdbps.tswaut wheRE  autrrnbep = '024899678917';

--ADELANTO BILL PERSONAL ATM, ADELANTO BILLETERA TIGO

select * from libdebito.drconbep where lfectr in ('20200904', '20200907') AND LCODBC = 'DCR' AND LCODTR = '000054' order by LHORTR desc;

select * from libdebito.drconbep where LERRNB = '024899655163';
select * from gxbdbps.tswaut wheRE  autrrnbep = '024899687359';

select * from gxfindta.TCLPRE where precodi = 'ADCC';
SELECT * FROM GXTRJDTA.TDGBIN WHERE SUBSTR (BINNROBIN,1,9) = '627431332' --AND BINIDMARCA = 'DIN' AND BINIDPRODU = 'CLA'

select * from libdebito.drconbep where lfcotr = '20200914' and lcretr = '00' and lesttr = 'A'              
and limpgs > 0 and lbinpr in ('703002','627431')           
and lcodtr = '000054'


--Redmine 
select * from javierlib.drconbepvm where lfectr in ('20200904', '20200908') and lhortr > 093500 order by LHORTR desc;
select * from JAVIERLIB.tswaut where auttrxfchc in ('20200904', '20200908') and autrrnbep = '025200065404';
-- Trx Mastercard
--select * from mastercard.mastrndta where mcrrnbepsa = '025100065355';
--select * from mastercard.masctldta where mcrrnbepsa = '025100065355';
--select * from mastercard.masctldta where mc037 = '025100065355';
--TRX VISA
select * from .VISTRNDTA where VIFECREAL in ('20200908');
select * from VISA.VISCTLDTA where vimsgdatt = '2020-08%'
select * from VISA.VISCTLDTA where V037 = '025200065404';

select * from gxbdbps.coma3af where cocomer = '0100001'


INSERT INTO GXFINDTA.TCLPRE
(
  SERCODI,
  PRECODI,
  PREDESC,
  PREESTA,
  PRECOTRX,
  PREFEAC,
  PREUSAC,
  PREFPGO,
  PREMATRX,
  PREDISP,
  PRECLEA,
  PREMARC,
  PREPROD
)
VALUES
(
  'COMPRA    ',
  'CPMO',
  'COMPRA MOTO                                                                     ',
  'A',
  '000000',
  '2020-04-14 15:55:00.000',
  'U99BERNAL ',
  'TA',
  '000000',
  'MOTO ',
  'TRA',
  '   ',
  '   '
);



select *
from libdebito.drconbep  where lfcotr = '20200914' and lcodbc = 'MST' and lcretr = '00' and lenemi = '530'
and substr(lidtra,1,1)= 'P';

select * from libdebito.drconbep where lfcotr = '20200914' and  lcodbc = 'MST' and lcretr = '00' and lenemi = '530' AND SUBSTR(LNRTAR,1,) = '230'--and lerrnb = '025500788694';

select * from gxbdbps.tswaut where AUTRRNBEP = '025500787577';

select * from libdebito.drconbep where LERRNB = '025500787577';

select a.mcrol, mc037, a.mcrrnbepsa, mc032 from mastercard.mastrndta a inner join mastercard.masctldta b on a.mcrrnbepsa = b.mcrrnbepsa 
where mcfeccom = '20200914' and /*a.mcrol = 'ISS';*/a.mcrrnbepsa = '025801007932';


select * from gxbdbps.viadqenti;   
Validaciones
- ROL ADQ Adquirente/ ISA OnUS (Adq/Iss)
- Bines Adquirentes
 19696 --> POS   
 960023198   --> ATM
- Codigo Entidad (Lenemi) 530

 

- LCODBC --> Marca tarjeta
- LCPACE --> producto
- LMARCA --> Ambito de uso transaccional (L/R/I)
- LTIPTR --> Tipo tarjeta

--VALIDACION EN EL TDGBIN PARA BINES DE TRANSACCION



select * from libdebito.drconbep where lfectr = '20200917' order by lhortr desc;

select * from visa.vistrndta where VIRRNBEPSA = '026100066859';

select * from visa.visctldta where VIRRNBEPSA = '026100066857';

select * from javierlib.drconbe80

select * from gxopera.flicom

select * from gxopera.flicom1

select * from gxopera.opmovi where opfecom = '20200914';

select reenemi, sum (remonto) from gxopera.oprecle where refech = '20200914' and READMIN = '056' and REENEMI in ('115', '530', '540') group by reenemi

select * from gxopera.opliqui where substr(opcampoa,41,8) = '20200914'

UPDATE GXOPERA.OPLIQUI
   SET 
       opcampoa= substr(opcampoa,1,40) || '20200914'
WHERE substr(opcampoa,41,8) = '20200915';

select * from libdebito.drconbep where lbinpr = '703040' and lfcotr = '20200914' and lcodtr in ('901020', '902020')

select * from libdebito.drconbep where lbinpr in ('488234','456976','703040') and lcodtr in ('901020', '902020') and lcretr = '00' and lesttr = 'A'

select * from gxopera.opentid where reenti = '020';
--Venta minutos, pago facturas, bines 703040, redmine #8652 y 8270, 20200914RCleDebCONTI-DEB, 
select * from gxopera.opmovi where substr(optarj,1,6) in ('488234','456976','703040') and opcodtrn in ('901020', '902020') and opfecom = '20200914';
select * from gxopera.opentid1 where reenti in ('021', '020');
--Validación de Mejoras Adquirencia MST, redmine #8961, 20200914RCleCreMCINTERNAC, 20200914Rdetall4COMPRAS-530CRE
select * from gxopera.opmovi where opfecom = '20200917'and openemi = '530' and opcodtrn = '000054';

select * from gxbdbps.comaexd where cocomer = '0302179';

select * from libdebito.drconbep where lerrnb = '025801007932';

select * from gxopera.tfamrel where FARELENTIP = '056';

select * from gxopera.opentcle where entcod = '115';

update libdebito.drconbep set 
lfcotr = '20200914' 
where lbinpr in ('488234','456976','703040') and lcodtr in ('901020', '902020') and lcretr = '00' and lesttr = 'A';

select lnrtar,lerrnb,lfcotr, lcodbc, lmarca,lcpace,ltiptr,lenemi,lcodtr,leca62, LBINPR,LNTOKE,lnfisc,autrolbep,lidtra,autmartar,autprotar,AUTAMBBIN,autbinadq, auttiptar
from libdebito.drconbep inner join  gxbdbps.tswaut  on lerrnb = autrrnbep where lfcotr = '20200914' and lcodbc = 'MST' and lcretr = '00' and lenemi = '530'
--and substr(lidtra,1,1)= 'P';


select * from libprod.drconbe60 where lfcotr = '20200914'

Select opferea, opfecom,openemi, optarj,optiptar, opcodaut, opcodtrn, opmonto Monto, opcomi Comision, opcoment ComiEntidad, opcombps ComiBepsa, opivaent IvaEntidad, opivabps IvaBepsa, oprenta Renta, opreiva IvaRenta
from gxopera.opmovi where openemi = '530' and opcodtrn = '000054' and opfecom = '20200917';


select * from libdebito.drconbep where lfectr = '20200923' and lbinpr = '488234' order by lhortr desc;
select * from visa.vistrndta where VIRRNBEPSA in (
'026700067435',
'026700067432');

select * from visa.visctldta where VIRRNBEPSA in (
'026700067435',
'026700067432');

select * from gxbdbps.tswaut where AUTRRNBEP in (
'026700067435',
'026700067432');

select * from gxfindta.TCLPRE where precodi in ('ADCC', 'CSAT');.

Select lfcotr, lidcom, lenemi, lnrtar, lerrnb,limpgs, lcodbc, lmarca, lcpace, ltiptr, lcodtr, LBINPr from libdebito.drconbep
where lfcotr = '20200917'  and lcodbc = 'MST' and lcretr = '00' and lenemi = '530' and
substr(lidtra,1,1)= 'P';

Select * from gxbdbps.comaexd where cocomer = '0302179' and BPSSRVCOD = 1 AND ccmarca = 'MST' and ccmaror = 'R';

select I45_AIID, count(*) from VISA.AITINC45 group by I45_AIID;
select * from VISA.AITINC45;

delete from VISA.AITINC45;

select * from gxswtdta.tdmserv;
select * from gxswtdta.tdmenser;
select * from gxswtdta.tdmacbnf;
select * from gxswtdta.TDMPRSRV;
select * from gxswtdta.TDMTXSRV;
select * from gxswtdta.TDMAUD;
select * from gxswtdta.TDMAUDDT;

select * from gxtrjdta.TDGPER; --(persona) 
select * from gxtrjdta.TDGENP where pernrodoc = '3330452'; --(entidad/persona)
select * from gxtrjdta.TTDEMI where CDBIDCTA = '102026651'   ;
select * from gxtrjdta.TTCTRJ where trjnrodoc = '3330452';
select * from gxtrjdta.TTDCAD where pernrodoc = '3330452';
select * from libdebito.tgembhaf where crdocu = '3256456'
select * from gxtrjdta.TDGAFI where entcodent = 1002;

select * from gxsegdta.tsgnum where sgnumobj = 'TDMSERV';

INSERT INTO GXSEGDTA.TSGNUM
( SGNUMCOD, SGNUMOBJ, SGNUMINI, SGNUMACT, SGNUMSET, SGNUMDESC, SGNUMPRG, SGNUMUNT)
VALUES
( 108, 'TDMSERV ', 1, 4, 'N', 'SERVICIOS DM ',;

' ',
0
);

select * from gxsegdta.tsgfun   where   SGSISCOD = 33  AND sgfunobj IN ( 'TDMPRSRV','TDMPRSRVWW');


select * from libdebito.TBCTRA0P where txctrx not in(
select lcodtr from libdebito.drconbep where lfectr  = '20201119' and lcomtr = 'ATM BANCO CONTINENTAL'
);

select a.lcodtr, b.txdtrx from libdebito.drconbep as a, libdebito.TBCTRA0P as b where a.lfectr  = '20201119' and a.lcomtr = 'ATM BANCO CONTINENTAL' and a.lcodtr not in (
select txsrvcod from gxswtdta.TDMTXSRV
) and a.lcodtr = b.txctrx;

select 
select * from libdebito.TBCTRA0P
------------------------
--11644, Dinelco Movil--
------------------------
select * from gxbdbps.nut999 WHERE DBGOBJID = 'APMD016' order by 1 desc

select * from gxswtdta.TDMTEMP;

	select * from gxdebito.TGSVBEP

-- Indice UTGSVBEP1    
CREATE INDEX gxdebito.UTGSVBEP1
	   ON gxdebito.TGSVBEP  (CONSSAL DESC,  COMPMIN DESC, PAGFACT DESC ) ;
	   
/* Estableciendo el texto de etiqueta  */
LABEL ON INDEX gxdebito.UTGSVBEP1 IS 'Índice CONSSAL, COMPMIN , PAGFACT  ';

---------------------
--Modulo comisiones--
---------------------
DROP TABLE GXBDCON.TCOMPAG;

CREATE TABLE GXBDCON.TCOMPAG
(
   PAGID      DECIMAL(7)    NOT NULL,
   PAGORD     DECIMAL(8)    NOT NULL,
   PAGFCHP    CHAR(8)       NOT NULL,
   PAGFCHFAC  CHAR(8)       NOT NULL,
   PAGCOM     CHAR(11)      NOT NULL,
   PAGFACNRO  CHAR(20)      NOT NULL,
   PAGTIMB    CHAR(20)      NOT NULL,
   PAGDESC    CHAR(50)      NOT NULL,
   PAGIMP     DECIMAL(13)   NOT NULL,
   PAGEST     CHAR(1)       NOT NULL,
   PAGFCHPP   CHAR(8)       NOT NULL,
   PAGBCO     CHAR(3)       NOT NULL,
   PAGBCOID   CHAR(2)       NOT NULL,
   PAGCTA     CHAR(20)      NOT NULL,
   PAGTIPCTA  DECIMAL(2)    NOT NULL,
   PAGUSRPP   CHAR(10)      NOT NULL,
   PAGUSRPG   CHAR(10)      NOT NULL,
   PAGOBS     CHAR(50)      NOT NULL,
   PAGTIPGO   CHAR(1)       NOT NULL,
   PAGTIPCOM  CHAR(1)       NOT NULL
);

ALTER TABLE GXBDCON.TCOMPAG
   ADD CONSTRAINT Q_GXBDCON_TCOMPAG_PAGID_00001
   PRIMARY KEY (PAGID);
   
select count(*) from javierlib.DRCONBEPBK where lfectr > '20201200'

select *
from gxsegdta.tsgfun a inner join gxsegdta.tsgroldt b
on a.sgfuncod = b.sgfuncod inner join gxsegdta.tsgrol c
on b.sgrolcod = c.sgrolcod
 where a.sgsiscod = '33';
 
 --script de eliminacion 
-- Select * from gxsegdta.tsgroldt where sgsiscod = 33 and sgfuncod in (4025,4029,3365);
delete from gxsegdta.tsgroldt where sgsiscod = 33 and sgfuncod in (4025,4029,3365);

 

-- select * from gxsegdta.tsgfun   where sgsiscod = 33 and sgfuncod in (4025,4029);
delete from gxsegdta.tsgfun   where sgsiscod = 33 and sgfuncod in (4025,4029);

 

select * from gxsegdta.tsgfun   where sgsiscod = 33 and sgfuncod = 2808;
-- update gxsegdta.tsgfun set SGFUNDES = 'MASTERCARD' where sgsiscod = 33 and sgfuncod = 2808;

 

select * from gxsegdta.tsgfun   where sgsiscod = 33 and sgfuncod in (2896,2876,2860,2856);
-- update gxsegdta.tsgfun set SGFUNVIS = 'N', SGFUNCPAD = 0 where sgsiscod = 33 and sgfuncod in (2896,2876,2860,2856);

Select * from gxsegdta.tsgroldt where sgsiscod = 33 and sgfuncod in (2920,2924,2928,2932,3300,3645,3649,3653,3308,3357,3113);
-- delete from gxsegdta.tsgroldt where sgsiscod = 33 and sgfuncod in (2920,2924,2928,2932,3300,3645,3649,3653,3308,3357,3113);
    
--INSERTAR PERMISOS EN EL ROL DE PRODUCCION
Insertar datos es
ABUACDTAWWDLT DATOS DE TARJETAS A SER CATASTRADAS - DLT
ABUACDTAWWINS DATOS DE TARJETAS A SER CATASTRADAS - INS
ABUACDTAWWUPD DATOS DE TARJETAS A SER CATASTRADAS - UPD

CMIPDTAWWDLT MAS CONEXION CON EL MIP DLT
CMIPDTAWWUPD MAS CONEXION CON EL MIP UPD
GCMSRDTAWWDLT GCMS REPORT DLT
GCMSRDTAWWINS GCMS REPORT INS
GCMSRDTAWWUPD GCMS REPORT UPD;

--  Generar SQL 
--  Versión:                   	V7R2M0 140418 
--  Generado en:              	01/02/21 14:21:54 
--  Base de datos relacional:       	B10E97CR 
--  Opción de estándares:          	DB2 for i 
CREATE VIEW GXSWTDTA.IAUPRCCDE ( 
--  SQL1506   30   Clave o atributo para IAUPRCCDE de GXSWTDTA ignorado. 
	CMCODIG , 
	PRCDACCTF , 
	PRCDACCTT , 
	PRCDDESC , 
	PRCDFINTR , 
	PRCDINITR , 
	PRCDNOVED , 
	PRCDOPETYP , 
	PRCDTRNEXT , 
	PRCDTRNTYP ) 
	AS 
	SELECT 
	CMCODIG , 
	PRCDACCTF , 
	PRCDACCTT , 
	PRCDDESC , 
	PRCDFINTR , 
	PRCDINITR , 
	PRCDNOVED , 
	PRCDOPETYP , 
	PRCDTRNEXT , 
	PRCDTRNTYP   
	FROM GXSWTDTA.AUPRCCDE 
	  
	RCDFMT GXPRCCDE   ; 
  
LABEL ON COLUMN GXSWTDTA.IAUPRCCDE 
( CMCODIG IS 'Codigo              de                  Movimiento' , 
	PRCDACCTF IS 'Account             from' , 
	PRCDACCTT IS 'Account             To' , 
	PRCDDESC IS 'Descripcion' , 
	PRCDFINTR IS 'Final               Trans.' , 
	PRCDINITR IS 'Inicio              Trans.' , 
	PRCDNOVED IS 'Novedad' , 
	PRCDOPETYP IS 'Categoria           Operacion' , 
	PRCDTRNEXT IS 'Transaction         Extension' , 
	PRCDTRNTYP IS 'Transaction         Type' ) ; 
  
LABEL ON COLUMN GXSWTDTA.IAUPRCCDE 
( CMCODIG TEXT IS 'Codigo de Movimiento' , 
	PRCDACCTF TEXT IS 'Account from' , 
	PRCDACCTT TEXT IS 'Account To' , 
	PRCDDESC TEXT IS 'Descripcion' , 
	PRCDFINTR TEXT IS 'Final Trans.' , 
	PRCDINITR TEXT IS 'Inicio Trans.' , 
	PRCDNOVED TEXT IS 'Novedad' , 
	PRCDOPETYP TEXT IS 'Categoria Operacion' , 
	PRCDTRNEXT TEXT IS 'Transaction Extension' , 
	PRCDTRNTYP TEXT IS 'Transaction Type' ) ; 


--  Generar SQL 
--  Versión:                   	V7R2M0 140418 
--  Generado en:              	01/02/21 14:22:04 
--  Base de datos relacional:       	B10E97CR 
--  Opción de estándares:          	DB2 for i 
CREATE VIEW GXSWTDTA.IAUPRCCDEL ( 
--  SQL1506   30   Clave o atributo para IAUPRCCDEL de GXSWTDTA ignorado. 
	LIMPER , 
	LIMPTRN , 
	LIMPTRNS , 
	LIMQTY , 
	PRCDACCTF , 
	PRCDACCTT , 
	PRCDTRNEXT , 
	PRCDTRNTYP ) 
	AS 
	SELECT 
	LIMPER , 
	LIMPTRN , 
	LIMPTRNS , 
	LIMQTY , 
	PRCDACCTF , 
	PRCDACCTT , 
	PRCDTRNEXT , 
	PRCDTRNTYP   
	FROM GXSWTDTA.AUPRCCDEL 
	  
	RCDFMT GXPRCCDEL  ; 
  
LABEL ON COLUMN GXSWTDTA.IAUPRCCDEL 
( LIMPER IS 'Periodo' , 
	LIMPTRN IS 'Limite              por                 Operacion' , 
	LIMPTRNS IS 'Sumatoria           Total' , 
	LIMQTY IS 'Cantidad            de                  Transacciones' , 
	PRCDACCTF IS 'Account             from' , 
	PRCDACCTT IS 'Account             To' , 
	PRCDTRNEXT IS 'Transaction         Extension' , 
	PRCDTRNTYP IS 'Transaction         Type' ) ; 
  
LABEL ON COLUMN GXSWTDTA.IAUPRCCDEL 
( LIMPER TEXT IS 'Periodo' , 
	LIMPTRN TEXT IS 'Limite por Operacion' , 
	LIMPTRNS TEXT IS 'Sumatoria Total' , 
	LIMQTY TEXT IS 'Cantidad de Transacciones' , 
	PRCDACCTF TEXT IS 'Account from' , 
	PRCDACCTT TEXT IS 'Account To' , 
	PRCDTRNEXT TEXT IS 'Transaction Extension' , 
	PRCDTRNTYP TEXT IS 'Transaction Type' ) ; 
	
--  Generar SQL 
--  Versión:                   	V7R2M0 140418 
--  Generado en:              	01/02/21 14:22:15 
--  Base de datos relacional:       	B10E97CR 
--  Opción de estándares:          	DB2 for i 
CREATE VIEW GXSWTDTA.IAUPRCCDE1 ( 
--  SQL1506   30   Clave o atributo para IAUPRCCDE1 de GXSWTDTA ignorado. 
	CMCODIG , 
	PRCDACCTF , 
	PRCDACCTT , 
	PRCDDESC , 
	PRCDFINTR , 
	PRCDINITR , 
	PRCDNOVED , 
	PRCDOPETYP , 
	PRCDTRNEXT , 
	PRCDTRNTYP ) 
	AS 
	SELECT 
	CMCODIG , 
	PRCDACCTF , 
	PRCDACCTT , 
	PRCDDESC , 
	PRCDFINTR , 
	PRCDINITR , 
	PRCDNOVED , 
	PRCDOPETYP , 
	PRCDTRNEXT , 
	PRCDTRNTYP   
	FROM GXSWTDTA.AUPRCCDE 
	  
	RCDFMT GXPRCCDE   ; 
  
LABEL ON COLUMN GXSWTDTA.IAUPRCCDE1 
( CMCODIG IS 'Codigo              de                  Movimiento' , 
	PRCDACCTF IS 'Account             from' , 
	PRCDACCTT IS 'Account             To' , 
	PRCDDESC IS 'Descripcion' , 
	PRCDFINTR IS 'Final               Trans.' , 
	PRCDINITR IS 'Inicio              Trans.' , 
	PRCDNOVED IS 'Novedad' , 
	PRCDOPETYP IS 'Categoria           Operacion' , 
	PRCDTRNEXT IS 'Transaction         Extension' , 
	PRCDTRNTYP IS 'Transaction         Type' ) ; 
  
LABEL ON COLUMN GXSWTDTA.IAUPRCCDE1 
( CMCODIG TEXT IS 'Codigo de Movimiento' , 
	PRCDACCTF TEXT IS 'Account from' , 
	PRCDACCTT TEXT IS 'Account To' , 
	PRCDDESC TEXT IS 'Descripcion' , 
	PRCDFINTR TEXT IS 'Final Trans.' , 
	PRCDINITR TEXT IS 'Inicio Trans.' , 
	PRCDNOVED TEXT IS 'Novedad' , 
	PRCDOPETYP TEXT IS 'Categoria Operacion' , 
	PRCDTRNEXT TEXT IS 'Transaction Extension' , 
	PRCDTRNTYP TEXT IS 'Transaction Type' ) ; 
	
--  Generar SQL 
--  Versión:                   	V7R2M0 140418 
--  Generado en:              	01/02/21 14:24:23 
--  Base de datos relacional:       	B10E97CR 
--  Opción de estándares:          	DB2 for i 
CREATE VIEW GXSWTDTA.IVIADQENTI ( 
--  SQL1506   30   Clave o atributo para IVIADQENTI de GXSWTDTA ignorado. 
	ADQENTADQ , 
	ADQENTD , 
	ADQENTDEF , 
	ADQENTI , 
	ADQENTKEY , 
	ADQENTKEYC , 
	ADQENTPCR , 
	ADQENTSTAT , 
	ADQMAR , 
	ADQPROCID , 
	TDCANALID ) 
	AS 
	SELECT 
	ADQENTADQ , 
	ADQENTD , 
	ADQENTDEF , 
	ADQENTI , 
	ADQENTKEY , 
	ADQENTKEYC , 
	ADQENTPCR , 
	ADQENTSTAT , 
	ADQMAR , 
	ADQPROCID , 
	TDCANALID   
	FROM GXSWTDTA.VIADQENTI 
	  
	RCDFMT GXIADQENTI ; 
  
LABEL ON COLUMN GXSWTDTA.IVIADQENTI 
( TDCANALID IS 'Id                  de                  Canal' ) ; 
  
33LABEL ON COLUMN GXSWTDTA.IVIADQENTI 
( ADQENTADQ TEXT IS 'ADQENTADQ' , 
	ADQENTD TEXT IS 'ADQENTD' , 
	ADQENTDEF TEXT IS 'ADQENTDEF' , 
	ADQENTI TEXT IS 'ADQENTI' , 
	ADQENTKEY TEXT IS 'ADQENTKEY' , 
	ADQENTKEYC TEXT IS 'ADQENTKEYC' , 
	ADQENTPCR TEXT IS 'ADQENTPCR' , 
	ADQENTSTAT TEXT IS 'ADQENTSTAT' , 
	ADQMAR TEXT IS 'ADQMAR' , 
	ADQPROCID TEXT IS 'ADQPROCID' , 
	TDCANALID TEXT IS 'Id de Canal' ) ; 



select * from libdebito.drconbep where lfectr  = '20210218' order by lhortr desc;

--modulo comisiones #11687
select * from contabilid.tat2cta;
select * from gxopera.factura where FACTNRO > '20210201';
select * from gxopera.factura1 where ;
select * from gxopera.flicom where licomer = '4500006' ald lifechd = '';
select * from gxopera.flicom1 where LIFECHD = '20210218';
select * from gxbdbps.comaeaf;
select * from gxbdbps.coma1af;
select * from contabilid.cclfact;

--archivos solicitados
select * from yapi.tat2cta;
select * from yapi.factura where facfech > '20210201';
select * from yapi.factura1;
select * from yapi.flicom where LIFECHD > '20210201';
select * from yapi.flicom1 where LIFECHD > '20210201';
select * from yapi.comaeaf;
select * from yapi.coma1af;
select * from yapi.cclfact;

select * from contabilid.CCLFACT  where LFSITU = '2'  and LFTPDO = 'CR';

select * from gxbdcon.tcompag;


--#16138 - correcciones en carga del TSWAUT

INSERT INTO libdebito.drconbep
(
  LCTAOR,
  LCTADE,
  LNRTAR,
  LEXTAR,
  LEXPIR,
  LIDCOM,
  LHISOR,
  LHISDE,
  LBCOCR,
  LCTACR,
  LBCODB,
  LCTADB,
  LCLEAR,
  LFCOTR,
  LFECTR,
  LHORTR,
  LFECLQ,
  LFECEN,
  LMONTR,
  LIMPGS,
  LIMPDS,
  LIMPDF,
  LSALTR,
  LDISTR,
  LMARCA,
  LCUOTA,
  LIDTRA,
  LSTANT,
  LTIPTR,
  LPOSEM,
  LBINPR,
  LMCCTR,
  LCOMTR,
  LORITR,
  LCODTR,
  LCODBC,
  LCAUTR,
  LCRETR,
  LESTTR,
  LERRNB,
  LEIMP4,
  LECA62,
  LCPACE,
  LENEMI,
  LCORED,
  LCOTEL,
  LACTFJ,
  LNFACT,
  LNFISC,
  ENEADM,
  ENEPRO,
  LCODPR,
  LCOPRO,
  LCOCOM,
  LCOIVA,
  LCOADQ,
  LNTOKE
)
VALUES
(
  '0000000000000000',
  '0000000000000000',
  '0000000000000000',
  '   ',
  '0000',
  5400617,
  '*WEBBPS',
  '*PROCAR',
  '520',
  '                ',
  '520',
  '                ',
  ' ',
  20210518,
  20210517,
  203230,
  0,
  20210517,
  '600',
  35000.00,
  0.00,
  0.00,
  0.00,
  0.00,
  ' ',
  '  ',
  'PX230585        ',
  230052,
  'C',
  '    ',
  '627431',
  '    ',
  'RED DE COBROS Y PAGOS S.A.    ',
  'P',
  '524000',
  '   ',
  '230052',
  '00',
  'A',
  '113761230052',
  '     0983862311',
  '               ',
  '    ',
  '520',
  '981',
  '0983862311     ',
  '*WEBBPS   ',
  'PY        ',
  '       598703',
  '999',
  '999',
  '   ',
  0.00,
  0.0000,
  0.0000,
  0.0000,
  '230000000052         '
);

INSERT INTO libdebito.drconbep
(
  LCTAOR,
  LCTADE,
  LNRTAR,
  LEXTAR,
  LEXPIR,
  LIDCOM,
  LHISOR,
  LHISDE,
  LBCOCR,
  LCTACR,
  LBCODB,
  LCTADB,
  LCLEAR,
  LFCOTR,
  LFECTR,
  LHORTR,
  LFECLQ,
  LFECEN,
  LMONTR,
  LIMPGS,
  LIMPDS,
  LIMPDF,
  LSALTR,
  LDISTR,
  LMARCA,
  LCUOTA,
  LIDTRA,
  LSTANT,
  LTIPTR,
  LPOSEM,
  LBINPR,
  LMCCTR,
  LCOMTR,
  LORITR,
  LCODTR,
  LCODBC,
  LCAUTR,
  LCRETR,
  LESTTR,
  LERRNB,
  LEIMP4,
  LECA62,
  LCPACE,
  LENEMI,
  LCORED,
  LCOTEL,
  LACTFJ,
  LNFACT,
  LNFISC,
  ENEADM,
  ENEPRO,
  LCODPR,
  LCOPRO,
  LCOCOM,
  LCOIVA,
  LCOADQ,
  LNTOKE
)
VALUES
(
  '0000000000000000',
  '0000000000000000',
  '0000000000000000',
  '   ',
  '0000',
  5400617,
  '*WEBBPS',
  '*PROCAR',
  '520',
  '                ',
  '520',
  '                ',
  ' ',
  20210518,
  20210518,
  73518,
  0,
  20210518,
  '600',
  140000.00,
  0.00,
  0.00,
  0.00,
  0.00,
  ' ',
  '  ',
  'PX518353        ',
  243833,
  'C',
  '    ',
  '627431',
  '    ',
  'RED DE COBROS Y PAGOS S.A.    ',
  'P',
  '524000',
  '   ',
  '243833',
  '00',
  'A',
  '113861243833',
  '     0982534212',
  '               ',
  '    ',
  '520',
  '981',
  '0982534212     ',
  '*WEBBPS   ',
  'PY        ',
  '       649491',
  '999',
  '999',
  '   ',
  0.00,
  0.0000,
  0.0000,
  0.0000,
  '243000000833         '
);

INSERT INTO libdebito.drconbep
(
  LCTAOR,
  LCTADE,
  LNRTAR,
  LEXTAR,
  LEXPIR,
  LIDCOM,
  LHISOR,
  LHISDE,
  LBCOCR,
  LCTACR,
  LBCODB,
  LCTADB,
  LCLEAR,
  LFCOTR,
  LFECTR,
  LHORTR,
  LFECLQ,
  LFECEN,
  LMONTR,
  LIMPGS,
  LIMPDS,
  LIMPDF,
  LSALTR,
  LDISTR,
  LMARCA,
  LCUOTA,
  LIDTRA,
  LSTANT,
  LTIPTR,
  LPOSEM,
  LBINPR,
  LMCCTR,
  LCOMTR,
  LORITR,
  LCODTR,
  LCODBC,
  LCAUTR,
  LCRETR,
  LESTTR,
  LERRNB,
  LEIMP4,
  LECA62,
  LCPACE,
  LENEMI,
  LCORED,
  LCOTEL,
  LACTFJ,
  LNFACT,
  LNFISC,
  ENEADM,
  ENEPRO,
  LCODPR,
  LCOPRO,
  LCOCOM,
  LCOIVA,
  LCOADQ,
  LNTOKE
)
VALUES
(
  '0000000000000000',
  '0000000000000000',
  '0000000000000000',
  '   ',
  '0000',
  5400617,
  '*WEBBPS',
  '*PROCAR',
  '520',
  '                ',
  '520',
  '                ',
  ' ',
  20210518,
  20210518,
  74232,
  0,
  20210518,
  '600',
  30000.00,
  0.00,
  0.00,
  0.00,
  0.00,
  ' ',
  '  ',
  'PX232070        ',
  244360,
  'C',
  '    ',
  '627431',
  '    ',
  'RED DE COBROS Y PAGOS S.A.    ',
  'P',
  '524000',
  '   ',
  '244360',
  '00',
  'A',
  '113861244360',
  '     0985975442',
  '               ',
  '    ',
  '520',
  '981',
  '0985975442     ',
  '*WEBBPS   ',
  'PY        ',
  '       652100',
  '999',
  '999',
  '   ',
  0.00,
  0.0000,
  0.0000,
  0.0000,
  '244000000360         '
);

INSERT INTO libdebito.drconbep
(
  LCTAOR,
  LCTADE,
  LNRTAR,
  LEXTAR,
  LEXPIR,
  LIDCOM,
  LHISOR,
  LHISDE,
  LBCOCR,
  LCTACR,
  LBCODB,
  LCTADB,
  LCLEAR,
  LFCOTR,
  LFECTR,
  LHORTR,
  LFECLQ,
  LFECEN,
  LMONTR,
  LIMPGS,
  LIMPDS,
  LIMPDF,
  LSALTR,
  LDISTR,
  LMARCA,
  LCUOTA,
  LIDTRA,
  LSTANT,
  LTIPTR,
  LPOSEM,
  LBINPR,
  LMCCTR,
  LCOMTR,
  LORITR,
  LCODTR,
  LCODBC,
  LCAUTR,
  LCRETR,
  LESTTR,
  LERRNB,
  LEIMP4,
  LECA62,
  LCPACE,
  LENEMI,
  LCORED,
  LCOTEL,
  LACTFJ,
  LNFACT,
  LNFISC,
  ENEADM,
  ENEPRO,
  LCODPR,
  LCOPRO,
  LCOCOM,
  LCOIVA,
  LCOADQ,
  LNTOKE
)
VALUES
(
  '0000000000000000',
  '0000000000000000',
  '0000000000000000',
  '   ',
  '0000',
  5400617,
  '*WEBBPS',
  '*PROCAR',
  '520',
  '                ',
  '520',
  '                ',
  ' ',
  20210518,
  20210518,
  75626,
  0,
  20210518,
  '600',
  37500.00,
  0.00,
  0.00,
  0.00,
  0.00,
  ' ',
  '  ',
  'PX626573        ',
  245551,
  'C',
  '    ',
  '627431',
  '    ',
  'RED DE COBROS Y PAGOS S.A.    ',
  'P',
  '524000',
  '   ',
  '245551',
  '00',
  'A',
  '113861245551',
  '     0982711251',
  '               ',
  '    ',
  '520',
  '981',
  '0982711251     ',
  '*WEBBPS   ',
  'PY        ',
  '       631806',
  '999',
  '999',
  '   ',
  0.00,
  0.0000,
  0.0000,
  0.0000,
  '245000000551         '
);

INSERT INTO libdebito.drconbep
(
  LCTAOR,
  LCTADE,
  LNRTAR,
  LEXTAR,
  LEXPIR,
  LIDCOM,
  LHISOR,
  LHISDE,
  LBCOCR,
  LCTACR,
  LBCODB,
  LCTADB,
  LCLEAR,
  LFCOTR,
  LFECTR,
  LHORTR,
  LFECLQ,
  LFECEN,
  LMONTR,
  LIMPGS,
  LIMPDS,
  LIMPDF,
  LSALTR,
  LDISTR,
  LMARCA,
  LCUOTA,
  LIDTRA,
  LSTANT,
  LTIPTR,
  LPOSEM,
  LBINPR,
  LMCCTR,
  LCOMTR,
  LORITR,
  LCODTR,
  LCODBC,
  LCAUTR,
  LCRETR,
  LESTTR,
  LERRNB,
  LEIMP4,
  LECA62,
  LCPACE,
  LENEMI,
  LCORED,
  LCOTEL,
  LACTFJ,
  LNFACT,
  LNFISC,
  ENEADM,
  ENEPRO,
  LCODPR,
  LCOPRO,
  LCOCOM,
  LCOIVA,
  LCOADQ,
  LNTOKE
)
VALUES
(
  '0000000000000000',
  '0000000000000000',
  '0000000000000000',
  '   ',
  '0000',
  5400617,
  '*WEBBPS',
  '*PROCAR',
  '520',
  '                ',
  '520',
  '                ',
  ' ',
  20210518,
  20210518,
  80617,
  0,
  20210518,
  '600',
  56000.00,
  0.00,
  0.00,
  0.00,
  0.00,
  ' ',
  '  ',
  'PX617760        ',
  246631,
  'C',
  '    ',
  '627431',
  '    ',
  'RED DE COBROS Y PAGOS S.A.    ',
  'P',
  '524000',
  '   ',
  '246631',
  '00',
  'A',
  '113861246631',
  '     0984697889',
  '               ',
  '    ',
  '520',
  '981',
  '0984697889     ',
  '*WEBBPS   ',
  'PY        ',
  '       645113',
  '999',
  '999',
  '   ',
  0.00,
  0.0000,
  0.0000,
  0.0000,
  '246000000631         '
);

INSERT INTO libdebito.drconbep
(
  LCTAOR,
  LCTADE,
  LNRTAR,
  LEXTAR,
  LEXPIR,
  LIDCOM,
  LHISOR,
  LHISDE,
  LBCOCR,
  LCTACR,
  LBCODB,
  LCTADB,
  LCLEAR,
  LFCOTR,
  LFECTR,
  LHORTR,
  LFECLQ,
  LFECEN,
  LMONTR,
  LIMPGS,
  LIMPDS,
  LIMPDF,
  LSALTR,
  LDISTR,
  LMARCA,
  LCUOTA,
  LIDTRA,
  LSTANT,
  LTIPTR,
  LPOSEM,
  LBINPR,
  LMCCTR,
  LCOMTR,
  LORITR,
  LCODTR,
  LCODBC,
  LCAUTR,
  LCRETR,
  LESTTR,
  LERRNB,
  LEIMP4,
  LECA62,
  LCPACE,
  LENEMI,
  LCORED,
  LCOTEL,
  LACTFJ,
  LNFACT,
  LNFISC,
  ENEADM,
  ENEPRO,
  LCODPR,
  LCOPRO,
  LCOCOM,
  LCOIVA,
  LCOADQ,
  LNTOKE
)
VALUES
(
  '0000000000000000',
  '0000000000000000',
  '0000000000000000',
  '   ',
  '0000',
  5400617,
  '*WEBBPS',
  '*PROCAR',
  '520',
  '                ',
  '520',
  '                ',
  ' ',
  20210518,
  20210518,
  81557,
  0,
  20210518,
  '600',
  55000.00,
  0.00,
  0.00,
  0.00,
  0.00,
  ' ',
  '  ',
  'PX557951        ',
  247596,
  'C',
  '    ',
  '627431',
  '    ',
  'RED DE COBROS Y PAGOS S.A.    ',
  'P',
  '524000',
  '   ',
  '247596',
  '00',
  'A',
  '113861247596',
  '     0981661040',
  '               ',
  '    ',
  '520',
  '981',
  '0981661040     ',
  '*WEBBPS   ',
  'PY        ',
  '       659267',
  '999',
  '999',
  '   ',
  0.00,
  0.0000,
  0.0000,
  0.0000,
  '247000000596         '
);

INSERT INTO libdebito.drconbep
(
  LCTAOR,
  LCTADE,
  LNRTAR,
  LEXTAR,
  LEXPIR,
  LIDCOM,
  LHISOR,
  LHISDE,
  LBCOCR,
  LCTACR,
  LBCODB,
  LCTADB,
  LCLEAR,
  LFCOTR,
  LFECTR,
  LHORTR,
  LFECLQ,
  LFECEN,
  LMONTR,
  LIMPGS,
  LIMPDS,
  LIMPDF,
  LSALTR,
  LDISTR,
  LMARCA,
  LCUOTA,
  LIDTRA,
  LSTANT,
  LTIPTR,
  LPOSEM,
  LBINPR,
  LMCCTR,
  LCOMTR,
  LORITR,
  LCODTR,
  LCODBC,
  LCAUTR,
  LCRETR,
  LESTTR,
  LERRNB,
  LEIMP4,
  LECA62,
  LCPACE,
  LENEMI,
  LCORED,
  LCOTEL,
  LACTFJ,
  LNFACT,
  LNFISC,
  ENEADM,
  ENEPRO,
  LCODPR,
  LCOPRO,
  LCOCOM,
  LCOIVA,
  LCOADQ,
  LNTOKE
)
VALUES
(
  '0000000000000000',
  '0000000000000000',
  '0000000000000000',
  '   ',
  '0000',
  5400617,
  '*WEBBPS',
  '*PROCAR',
  '520',
  '                ',
  '520',
  '                ',
  ' ',
  20210518,
  20210518,
  82142,
  0,
  20210518,
  '600',
  50000.00,
  0.00,
  0.00,
  0.00,
  0.00,
  ' ',
  '  ',
  'PX142429        ',
  248251,
  'C',
  '    ',
  '627431',
  '    ',
  'RED DE COBROS Y PAGOS S.A.    ',
  'P',
  '524000',
  '   ',
  '840493',
  '00',
  'A',
  '113861248251',
  '     0971840493',
  '               ',
  '    ',
  '520',
  '971',
  '0971840493     ',
  '*WEBBPS   ',
  'PY        ',
  '       659266',
  '999',
  '999',
  '   ',
  0.00,
  0.0000,
  0.0000,
  0.0000,
  '248000000251         '
);

INSERT INTO libdebito.drconbep
(
  LCTAOR,
  LCTADE,
  LNRTAR,
  LEXTAR,
  LEXPIR,
  LIDCOM,
  LHISOR,
  LHISDE,
  LBCOCR,
  LCTACR,
  LBCODB,
  LCTADB,
  LCLEAR,
  LFCOTR,
  LFECTR,
  LHORTR,
  LFECLQ,
  LFECEN,
  LMONTR,
  LIMPGS,
  LIMPDS,
  LIMPDF,
  LSALTR,
  LDISTR,
  LMARCA,
  LCUOTA,
  LIDTRA,
  LSTANT,
  LTIPTR,
  LPOSEM,
  LBINPR,
  LMCCTR,
  LCOMTR,
  LORITR,
  LCODTR,
  LCODBC,
  LCAUTR,
  LCRETR,
  LESTTR,
  LERRNB,
  LEIMP4,
  LECA62,
  LCPACE,
  LENEMI,
  LCORED,
  LCOTEL,
  LACTFJ,
  LNFACT,
  LNFISC,
  ENEADM,
  ENEPRO,
  LCODPR,
  LCOPRO,
  LCOCOM,
  LCOIVA,
  LCOADQ,
  LNTOKE
)
VALUES
(
  '0000000000000000',
  '0000000000000000',
  '0000000000000000',
  '   ',
  '0000',
  5400617,
  '*WEBBPS',
  '*PROCAR',
  '520',
  '                ',
  '520',
  '                ',
  ' ',
  20210518,
  20210518,
  83745,
  0,
  20210518,
  '600',
  85000.00,
  0.00,
  0.00,
  0.00,
  0.00,
  ' ',
  '  ',
  'PX745741        ',
  250339,
  'C',
  '    ',
  '627431',
  '    ',
  'RED DE COBROS Y PAGOS S.A.    ',
  'P',
  '524000',
  '   ',
  '250339',
  '00',
  'A',
  '113861250339',
  '     0983232632',
  '               ',
  '    ',
  '520',
  '981',
  '0983232632     ',
  '*WEBBPS   ',
  'PY        ',
  '       645113',
  '999',
  '999',
  '   ',
  0.00,
  0.0000,
  0.0000,
  0.0000,
  '250000000339         '
);

INSERT INTO libdebito.drconbep
(
  LCTAOR,
  LCTADE,
  LNRTAR,
  LEXTAR,
  LEXPIR,
  LIDCOM,
  LHISOR,
  LHISDE,
  LBCOCR,
  LCTACR,
  LBCODB,
  LCTADB,
  LCLEAR,
  LFCOTR,
  LFECTR,
  LHORTR,
  LFECLQ,
  LFECEN,
  LMONTR,
  LIMPGS,
  LIMPDS,
  LIMPDF,
  LSALTR,
  LDISTR,
  LMARCA,
  LCUOTA,
  LIDTRA,
  LSTANT,
  LTIPTR,
  LPOSEM,
  LBINPR,
  LMCCTR,
  LCOMTR,
  LORITR,
  LCODTR,
  LCODBC,
  LCAUTR,
  LCRETR,
  LESTTR,
  LERRNB,
  LEIMP4,
  LECA62,
  LCPACE,
  LENEMI,
  LCORED,
  LCOTEL,
  LACTFJ,
  LNFACT,
  LNFISC,
  ENEADM,
  ENEPRO,
  LCODPR,
  LCOPRO,
  LCOCOM,
  LCOIVA,
  LCOADQ,
  LNTOKE
)
VALUES
(
  '0000000000000000',
  '0000000000000000',
  '0000000000000000',
  '   ',
  '0000',
  5400617,
  '*WEBBPS',
  '*PROCAR',
  '520',
  '                ',
  '520',
  '                ',
  ' ',
  20210518,
  20210518,
  83810,
  0,
  20210518,
  '600',
  95480.00,
  0.00,
  0.00,
  0.00,
  0.00,
  ' ',
  '  ',
  'PX810583        ',
  250392,
  'C',
  '    ',
  '627431',
  '    ',
  'RED DE COBROS Y PAGOS S.A.    ',
  'P',
  '524000',
  '   ',
  '543742',
  '00',
  'A',
  '113861250392',
  '     0981543742',
  '               ',
  '    ',
  '520',
  '971',
  '0981543742     ',
  '*WEBBPS   ',
  'PY        ',
  '       649168',
  '999',
  '999',
  '   ',
  0.00,
  0.0000,
  0.0000,
  0.0000,
  '250000000392         '
);

INSERT INTO libdebito.drconbep
(
  LCTAOR,
  LCTADE,
  LNRTAR,
  LEXTAR,
  LEXPIR,
  LIDCOM,
  LHISOR,
  LHISDE,
  LBCOCR,
  LCTACR,
  LBCODB,
  LCTADB,
  LCLEAR,
  LFCOTR,
  LFECTR,
  LHORTR,
  LFECLQ,
  LFECEN,
  LMONTR,
  LIMPGS,
  LIMPDS,
  LIMPDF,
  LSALTR,
  LDISTR,
  LMARCA,
  LCUOTA,
  LIDTRA,
  LSTANT,
  LTIPTR,
  LPOSEM,
  LBINPR,
  LMCCTR,
  LCOMTR,
  LORITR,
  LCODTR,
  LCODBC,
  LCAUTR,
  LCRETR,
  LESTTR,
  LERRNB,
  LEIMP4,
  LECA62,
  LCPACE,
  LENEMI,
  LCORED,
  LCOTEL,
  LACTFJ,
  LNFACT,
  LNFISC,
  ENEADM,
  ENEPRO,
  LCODPR,
  LCOPRO,
  LCOCOM,
  LCOIVA,
  LCOADQ,
  LNTOKE
)
VALUES
(
  '0000000000000000',
  '0000000000000000',
  '0000000000000000',
  '   ',
  '0000',
  5400617,
  '*WEBBPS',
  '*PROCAR',
  '520',
  '                ',
  '520',
  '                ',
  ' ',
  20210518,
  20210518,
  83841,
  0,
  20210518,
  '600',
  50000.00,
  0.00,
  0.00,
  0.00,
  0.00,
  ' ',
  '  ',
  'PX841252        ',
  250448,
  'C',
  '    ',
  '627431',
  '    ',
  'RED DE COBROS Y PAGOS S.A.    ',
  'P',
  '524000',
  '   ',
  '250448',
  '00',
  'A',
  '113861250448',
  '     0982636996',
  '               ',
  '    ',
  '520',
  '981',
  '0982636996     ',
  '*WEBBPS   ',
  'PY        ',
  '       661883',
  '999',
  '999',
  '   ',
  0.00,
  0.0000,
  0.0000,
  0.0000,
  '250000000448         '
);

INSERT INTO libdebito.drconbep
(
  LCTAOR,
  LCTADE,
  LNRTAR,
  LEXTAR,
  LEXPIR,
  LIDCOM,
  LHISOR,
  LHISDE,
  LBCOCR,
  LCTACR,
  LBCODB,
  LCTADB,
  LCLEAR,
  LFCOTR,
  LFECTR,
  LHORTR,
  LFECLQ,
  LFECEN,
  LMONTR,
  LIMPGS,
  LIMPDS,
  LIMPDF,
  LSALTR,
  LDISTR,
  LMARCA,
  LCUOTA,
  LIDTRA,
  LSTANT,
  LTIPTR,
  LPOSEM,
  LBINPR,
  LMCCTR,
  LCOMTR,
  LORITR,
  LCODTR,
  LCODBC,
  LCAUTR,
  LCRETR,
  LESTTR,
  LERRNB,
  LEIMP4,
  LECA62,
  LCPACE,
  LENEMI,
  LCORED,
  LCOTEL,
  LACTFJ,
  LNFACT,
  LNFISC,
  ENEADM,
  ENEPRO,
  LCODPR,
  LCOPRO,
  LCOCOM,
  LCOIVA,
  LCOADQ,
  LNTOKE
)
VALUES
(
  '0000000000000000',
  '0000000000000000',
  '0000000000000000',
  '   ',
  '0000',
  5400617,
  '*WEBBPS',
  '*PROCAR',
  '520',
  '                ',
  '520',
  '                ',
  ' ',
  20210518,
  20210518,
  84005,
  0,
  20210518,
  '600',
  276940.00,
  0.00,
  0.00,
  0.00,
  0.00,
  ' ',
  '  ',
  'PX005025        ',
  250633,
  'C',
  '    ',
  '627431',
  '    ',
  'RED DE COBROS Y PAGOS S.A.    ',
  'P',
  '524000',
  '   ',
  '303660',
  '00',
  'A',
  '113861250633',
  '     0981303660',
  '               ',
  '    ',
  '520',
  '971',
  '0981303660     ',
  '*WEBBPS   ',
  'PY        ',
  '       645113',
  '999',
  '999',
  '   ',
  0.00,
  0.0000,
  0.0000,
  0.0000,
  '250000000633         '
);

INSERT INTO libdebito.drconbep
(
  LCTAOR,
  LCTADE,
  LNRTAR,
  LEXTAR,
  LEXPIR,
  LIDCOM,
  LHISOR,
  LHISDE,
  LBCOCR,
  LCTACR,
  LBCODB,
  LCTADB,
  LCLEAR,
  LFCOTR,
  LFECTR,
  LHORTR,
  LFECLQ,
  LFECEN,
  LMONTR,
  LIMPGS,
  LIMPDS,
  LIMPDF,
  LSALTR,
  LDISTR,
  LMARCA,
  LCUOTA,
  LIDTRA,
  LSTANT,
  LTIPTR,
  LPOSEM,
  LBINPR,
  LMCCTR,
  LCOMTR,
  LORITR,
  LCODTR,
  LCODBC,
  LCAUTR,
  LCRETR,
  LESTTR,
  LERRNB,
  LEIMP4,
  LECA62,
  LCPACE,
  LENEMI,
  LCORED,
  LCOTEL,
  LACTFJ,
  LNFACT,
  LNFISC,
  ENEADM,
  ENEPRO,
  LCODPR,
  LCOPRO,
  LCOCOM,
  LCOIVA,
  LCOADQ,
  LNTOKE
)
VALUES
(
  '0000000000000000',
  '0000000000000000',
  '0000000000000000',
  '   ',
  '0000',
  5400617,
  '*WEBBPS',
  '*PROCAR',
  '520',
  '                ',
  '520',
  '                ',
  ' ',
  20210518,
  20210518,
  84911,
  0,
  20210518,
  '600',
  80000.00,
  0.00,
  0.00,
  0.00,
  0.00,
  ' ',
  '  ',
  'PX911731        ',
  251765,
  'C',
  '    ',
  '627431',
  '    ',
  'RED DE COBROS Y PAGOS S.A.    ',
  'P',
  '524000',
  '   ',
  '251765',
  '00',
  'A',
  '113861251765',
  '     0981309501',
  '               ',
  '    ',
  '520',
  '981',
  '0981309501     ',
  '*WEBBPS   ',
  'PY        ',
  '       668141',
  '999',
  '999',
  '   ',
  0.00,
  0.0000,
  0.0000,
  0.0000,
  '251000000765         '
);

INSERT INTO libdebito.drconbep
(
  LCTAOR,
  LCTADE,
  LNRTAR,
  LEXTAR,
  LEXPIR,
  LIDCOM,
  LHISOR,
  LHISDE,
  LBCOCR,
  LCTACR,
  LBCODB,
  LCTADB,
  LCLEAR,
  LFCOTR,
  LFECTR,
  LHORTR,
  LFECLQ,
  LFECEN,
  LMONTR,
  LIMPGS,
  LIMPDS,
  LIMPDF,
  LSALTR,
  LDISTR,
  LMARCA,
  LCUOTA,
  LIDTRA,
  LSTANT,
  LTIPTR,
  LPOSEM,
  LBINPR,
  LMCCTR,
  LCOMTR,
  LORITR,
  LCODTR,
  LCODBC,
  LCAUTR,
  LCRETR,
  LESTTR,
  LERRNB,
  LEIMP4,
  LECA62,
  LCPACE,
  LENEMI,
  LCORED,
  LCOTEL,
  LACTFJ,
  LNFACT,
  LNFISC,
  ENEADM,
  ENEPRO,
  LCODPR,
  LCOPRO,
  LCOCOM,
  LCOIVA,
  LCOADQ,
  LNTOKE
)
VALUES
(
  '0000000000000000',
  '0000000000000000',
  '0000000000000000',
  '   ',
  '0000',
  5400617,
  '*WEBBPS',
  '*PROCAR',
  '520',
  '                ',
  '520',
  '                ',
  ' ',
  20210518,
  20210518,
  85723,
  0,
  20210518,
  '600',
  75000.00,
  0.00,
  0.00,
  0.00,
  0.00,
  ' ',
  '  ',
  'PX723242        ',
  252950,
  'C',
  '    ',
  '627431',
  '    ',
  'RED DE COBROS Y PAGOS S.A.    ',
  'P',
  '524000',
  '   ',
  '252950',
  '00',
  'A',
  '113861252950',
  '     0984145173',
  '               ',
  '    ',
  '520',
  '981',
  '0984145173     ',
  '*WEBBPS   ',
  'PY        ',
  '       665875',
  '999',
  '999',
  '   ',
  0.00,
  0.0000,
  0.0000,
  0.0000,
  '252000000950         '
);

INSERT INTO libdebito.drconbep
(
  LCTAOR,
  LCTADE,
  LNRTAR,
  LEXTAR,
  LEXPIR,
  LIDCOM,
  LHISOR,
  LHISDE,
  LBCOCR,
  LCTACR,
  LBCODB,
  LCTADB,
  LCLEAR,
  LFCOTR,
  LFECTR,
  LHORTR,
  LFECLQ,
  LFECEN,
  LMONTR,
  LIMPGS,
  LIMPDS,
  LIMPDF,
  LSALTR,
  LDISTR,
  LMARCA,
  LCUOTA,
  LIDTRA,
  LSTANT,
  LTIPTR,
  LPOSEM,
  LBINPR,
  LMCCTR,
  LCOMTR,
  LORITR,
  LCODTR,
  LCODBC,
  LCAUTR,
  LCRETR,
  LESTTR,
  LERRNB,
  LEIMP4,
  LECA62,
  LCPACE,
  LENEMI,
  LCORED,
  LCOTEL,
  LACTFJ,
  LNFACT,
  LNFISC,
  ENEADM,
  ENEPRO,
  LCODPR,
  LCOPRO,
  LCOCOM,
  LCOIVA,
  LCOADQ,
  LNTOKE
)
VALUES
(
  '0000000000000000',
  '0000000000000000',
  '0000000000000000',
  '   ',
  '0000',
  5400617,
  '*WEBBPS',
  '*PROCAR',
  '520',
  '                ',
  '520',
  '                ',
  ' ',
  20210518,
  20210518,
  85903,
  0,
  20210518,
  '600',
  185000.00,
  0.00,
  0.00,
  0.00,
  0.00,
  ' ',
  '  ',
  'PX903585        ',
  253213,
  'C',
  '    ',
  '627431',
  '    ',
  'RED DE COBROS Y PAGOS S.A.    ',
  'P',
  '524000',
  '   ',
  '253213',
  '00',
  'A',
  '113861253213',
  '     0984668249',
  '               ',
  '    ',
  '520',
  '981',
  '0984668249     ',
  '*WEBBPS   ',
  'PY        ',
  '       669522',
  '999',
  '999',
  '   ',
  0.00,
  0.0000,
  0.0000,
  0.0000,
  '253000000213         '
);

INSERT INTO libdebito.drconbep
(
  LCTAOR,
  LCTADE,
  LNRTAR,
  LEXTAR,
  LEXPIR,
  LIDCOM,
  LHISOR,
  LHISDE,
  LBCOCR,
  LCTACR,
  LBCODB,
  LCTADB,
  LCLEAR,
  LFCOTR,
  LFECTR,
  LHORTR,
  LFECLQ,
  LFECEN,
  LMONTR,
  LIMPGS,
  LIMPDS,
  LIMPDF,
  LSALTR,
  LDISTR,
  LMARCA,
  LCUOTA,
  LIDTRA,
  LSTANT,
  LTIPTR,
  LPOSEM,
  LBINPR,
  LMCCTR,
  LCOMTR,
  LORITR,
  LCODTR,
  LCODBC,
  LCAUTR,
  LCRETR,
  LESTTR,
  LERRNB,
  LEIMP4,
  LECA62,
  LCPACE,
  LENEMI,
  LCORED,
  LCOTEL,
  LACTFJ,
  LNFACT,
  LNFISC,
  ENEADM,
  ENEPRO,
  LCODPR,
  LCOPRO,
  LCOCOM,
  LCOIVA,
  LCOADQ,
  LNTOKE
)
VALUES
(
  '0000000000000000',
  '0000000000000000',
  '0000000000000000',
  '   ',
  '0000',
  5400617,
  '*WEBBPS',
  '*PROCAR',
  '520',
  '                ',
  '520',
  '                ',
  ' ',
  20210518,
  20210518,
  90009,
  0,
  20210518,
  '600',
  80000.00,
  0.00,
  0.00,
  0.00,
  0.00,
  ' ',
  '  ',
  'PX009189        ',
  253398,
  'C',
  '    ',
  '627431',
  '    ',
  'RED DE COBROS Y PAGOS S.A.    ',
  'P',
  '524000',
  '   ',
  '253398',
  '00',
  'A',
  '113861253398',
  '     0982396552',
  '               ',
  '    ',
  '520',
  '981',
  '0982396552     ',
  '*WEBBPS   ',
  'PY        ',
  '       671031',
  '999',
  '999',
  '   ',
  0.00,
  0.0000,
  0.0000,
  0.0000,
  '253000000398         '
);

INSERT INTO libdebito.drconbep
(
  LCTAOR,
  LCTADE,
  LNRTAR,
  LEXTAR,
  LEXPIR,
  LIDCOM,
  LHISOR,
  LHISDE,
  LBCOCR,
  LCTACR,
  LBCODB,
  LCTADB,
  LCLEAR,
  LFCOTR,
  LFECTR,
  LHORTR,
  LFECLQ,
  LFECEN,
  LMONTR,
  LIMPGS,
  LIMPDS,
  LIMPDF,
  LSALTR,
  LDISTR,
  LMARCA,
  LCUOTA,
  LIDTRA,
  LSTANT,
  LTIPTR,
  LPOSEM,
  LBINPR,
  LMCCTR,
  LCOMTR,
  LORITR,
  LCODTR,
  LCODBC,
  LCAUTR,
  LCRETR,
  LESTTR,
  LERRNB,
  LEIMP4,
  LECA62,
  LCPACE,
  LENEMI,
  LCORED,
  LCOTEL,
  LACTFJ,
  LNFACT,
  LNFISC,
  ENEADM,
  ENEPRO,
  LCODPR,
  LCOPRO,
  LCOCOM,
  LCOIVA,
  LCOADQ,
  LNTOKE
)
VALUES
(
  '0000000000000000',
  '0000000000000000',
  '0000000000000000',
  '   ',
  '0000',
  5400617,
  '*WEBBPS',
  '*PROCAR',
  '520',
  '                ',
  '520',
  '                ',
  ' ',
  20210518,
  20210518,
  90058,
  0,
  20210518,
  '600',
  90000.00,
  0.00,
  0.00,
  0.00,
  0.00,
  ' ',
  '  ',
  'PX058995        ',
  253528,
  'C',
  '    ',
  '627431',
  '    ',
  'RED DE COBROS Y PAGOS S.A.    ',
  'P',
  '524000',
  '   ',
  '253528',
  '00',
  'A',
  '113861253528',
  '     0986152599',
  '               ',
  '    ',
  '520',
  '981',
  '0986152599     ',
  '*WEBBPS   ',
  'PY        ',
  '       670706',
  '999',
  '999',
  '   ',
  0.00,
  0.0000,
  0.0000,
  0.0000,
  '253000000528         '
);

INSERT INTO libdebito.drconbep
(
  LCTAOR,
  LCTADE,
  LNRTAR,
  LEXTAR,
  LEXPIR,
  LIDCOM,
  LHISOR,
  LHISDE,
  LBCOCR,
  LCTACR,
  LBCODB,
  LCTADB,
  LCLEAR,
  LFCOTR,
  LFECTR,
  LHORTR,
  LFECLQ,
  LFECEN,
  LMONTR,
  LIMPGS,
  LIMPDS,
  LIMPDF,
  LSALTR,
  LDISTR,
  LMARCA,
  LCUOTA,
  LIDTRA,
  LSTANT,
  LTIPTR,
  LPOSEM,
  LBINPR,
  LMCCTR,
  LCOMTR,
  LORITR,
  LCODTR,
  LCODBC,
  LCAUTR,
  LCRETR,
  LESTTR,
  LERRNB,
  LEIMP4,
  LECA62,
  LCPACE,
  LENEMI,
  LCORED,
  LCOTEL,
  LACTFJ,
  LNFACT,
  LNFISC,
  ENEADM,
  ENEPRO,
  LCODPR,
  LCOPRO,
  LCOCOM,
  LCOIVA,
  LCOADQ,
  LNTOKE
)
VALUES
(
  '0000000000000000',
  '0000000000000000',
  '0000000000000000',
  '   ',
  '0000',
  5400617,
  '*WEBBPS',
  '*PROCAR',
  '520',
  '                ',
  '520',
  '                ',
  ' ',
  20210518,
  20210518,
  90236,
  0,
  20210518,
  '600',
  38000.00,
  0.00,
  0.00,
  0.00,
  0.00,
  ' ',
  '  ',
  'PX236970        ',
  253759,
  'C',
  '    ',
  '627431',
  '    ',
  'RED DE COBROS Y PAGOS S.A.    ',
  'P',
  '524000',
  '   ',
  '253759',
  '00',
  'A',
  '113861253759',
  '     0986580360',
  '               ',
  '    ',
  '520',
  '981',
  '0986580360     ',
  '*WEBBPS   ',
  'PY        ',
  '       671030',
  '999',
  '999',
  '   ',
  0.00,
  0.0000,
  0.0000,
  0.0000,
  '253000000759         '
);

INSERT INTO libdebito.drconbep
(
  LCTAOR,
  LCTADE,
  LNRTAR,
  LEXTAR,
  LEXPIR,
  LIDCOM,
  LHISOR,
  LHISDE,
  LBCOCR,
  LCTACR,
  LBCODB,
  LCTADB,
  LCLEAR,
  LFCOTR,
  LFECTR,
  LHORTR,
  LFECLQ,
  LFECEN,
  LMONTR,
  LIMPGS,
  LIMPDS,
  LIMPDF,
  LSALTR,
  LDISTR,
  LMARCA,
  LCUOTA,
  LIDTRA,
  LSTANT,
  LTIPTR,
  LPOSEM,
  LBINPR,
  LMCCTR,
  LCOMTR,
  LORITR,
  LCODTR,
  LCODBC,
  LCAUTR,
  LCRETR,
  LESTTR,
  LERRNB,
  LEIMP4,
  LECA62,
  LCPACE,
  LENEMI,
  LCORED,
  LCOTEL,
  LACTFJ,
  LNFACT,
  LNFISC,
  ENEADM,
  ENEPRO,
  LCODPR,
  LCOPRO,
  LCOCOM,
  LCOIVA,
  LCOADQ,
  LNTOKE
)
VALUES
(
  '0000000000000000',
  '0000000000000000',
  '0000000000000000',
  '   ',
  '0000',
  5400617,
  '*WEBBPS',
  '*PROCAR',
  '520',
  '                ',
  '520',
  '                ',
  ' ',
  20210518,
  20210518,
  90447,
  0,
  20210518,
  '600',
  75000.00,
  0.00,
  0.00,
  0.00,
  0.00,
  ' ',
  '  ',
  'PX447080        ',
  254084,
  'C',
  '    ',
  '627431',
  '    ',
  'RED DE COBROS Y PAGOS S.A.    ',
  'P',
  '524000',
  '   ',
  '254084',
  '00',
  'A',
  '113861254084',
  '     0981963426',
  '               ',
  '    ',
  '520',
  '981',
  '0981963426     ',
  '*WEBBPS   ',
  'PY        ',
  '       672741',
  '999',
  '999',
  '   ',
  0.00,
  0.0000,
  0.0000,
  0.0000,
  '254000000084         '
);

INSERT INTO libdebito.drconbep
(
  LCTAOR,
  LCTADE,
  LNRTAR,
  LEXTAR,
  LEXPIR,
  LIDCOM,
  LHISOR,
  LHISDE,
  LBCOCR,
  LCTACR,
  LBCODB,
  LCTADB,
  LCLEAR,
  LFCOTR,
  LFECTR,
  LHORTR,
  LFECLQ,
  LFECEN,
  LMONTR,
  LIMPGS,
  LIMPDS,
  LIMPDF,
  LSALTR,
  LDISTR,
  LMARCA,
  LCUOTA,
  LIDTRA,
  LSTANT,
  LTIPTR,
  LPOSEM,
  LBINPR,
  LMCCTR,
  LCOMTR,
  LORITR,
  LCODTR,
  LCODBC,
  LCAUTR,
  LCRETR,
  LESTTR,
  LERRNB,
  LEIMP4,
  LECA62,
  LCPACE,
  LENEMI,
  LCORED,
  LCOTEL,
  LACTFJ,
  LNFACT,
  LNFISC,
  ENEADM,
  ENEPRO,
  LCODPR,
  LCOPRO,
  LCOCOM,
  LCOIVA,
  LCOADQ,
  LNTOKE
)
VALUES
(
  '0000000000000000',
  '0000000000000000',
  '0000000000000000',
  '   ',
  '0000',
  5400617,
  '*WEBBPS',
  '*PROCAR',
  '520',
  '                ',
  '520',
  '                ',
  ' ',
  20210518,
  20210518,
  90815,
  0,
  20210518,
  '600',
  45000.00,
  0.00,
  0.00,
  0.00,
  0.00,
  ' ',
  '  ',
  'PX815091        ',
  254621,
  'C',
  '    ',
  '627431',
  '    ',
  'RED DE COBROS Y PAGOS S.A.    ',
  'P',
  '524000',
  '   ',
  '254621',
  '00',
  'A',
  '113861254621',
  '     0983930661',
  '               ',
  '    ',
  '520',
  '981',
  '0983930661     ',
  '*WEBBPS   ',
  'PY        ',
  '       672741',
  '999',
  '999',
  '   ',
  0.00,
  0.0000,
  0.0000,
  0.0000,
  '254000000621         '
);

INSERT INTO libdebito.drconbep
(
  LCTAOR,
  LCTADE,
  LNRTAR,
  LEXTAR,
  LEXPIR,
  LIDCOM,
  LHISOR,
  LHISDE,
  LBCOCR,
  LCTACR,
  LBCODB,
  LCTADB,
  LCLEAR,
  LFCOTR,
  LFECTR,
  LHORTR,
  LFECLQ,
  LFECEN,
  LMONTR,
  LIMPGS,
  LIMPDS,
  LIMPDF,
  LSALTR,
  LDISTR,
  LMARCA,
  LCUOTA,
  LIDTRA,
  LSTANT,
  LTIPTR,
  LPOSEM,
  LBINPR,
  LMCCTR,
  LCOMTR,
  LORITR,
  LCODTR,
  LCODBC,
  LCAUTR,
  LCRETR,
  LESTTR,
  LERRNB,
  LEIMP4,
  LECA62,
  LCPACE,
  LENEMI,
  LCORED,
  LCOTEL,
  LACTFJ,
  LNFACT,
  LNFISC,
  ENEADM,
  ENEPRO,
  LCODPR,
  LCOPRO,
  LCOCOM,
  LCOIVA,
  LCOADQ,
  LNTOKE
)
VALUES
(
  '0000000000000000',
  '0000000000000000',
  '0000000000000000',
  '   ',
  '0000',
  5400617,
  '*WEBBPS',
  '*PROCAR',
  '520',
  '                ',
  '520',
  '                ',
  ' ',
  20210518,
  20210518,
  90957,
  0,
  20210518,
  '600',
  80000.00,
  0.00,
  0.00,
  0.00,
  0.00,
  ' ',
  '  ',
  'PX957520        ',
  254896,
  'C',
  '    ',
  '627431',
  '    ',
  'RED DE COBROS Y PAGOS S.A.    ',
  'P',
  '524000',
  '   ',
  '978079',
  '00',
  'A',
  '113861254896',
  '     0975978079',
  '               ',
  '    ',
  '520',
  '971',
  '0975978079     ',
  '*WEBBPS   ',
  'PY        ',
  '       670596',
  '999',
  '999',
  '   ',
  0.00,
  0.0000,
  0.0000,
  0.0000,
  '254000000896         '
);

INSERT INTO libdebito.drconbep
(
  LCTAOR,
  LCTADE,
  LNRTAR,
  LEXTAR,
  LEXPIR,
  LIDCOM,
  LHISOR,
  LHISDE,
  LBCOCR,
  LCTACR,
  LBCODB,
  LCTADB,
  LCLEAR,
  LFCOTR,
  LFECTR,
  LHORTR,
  LFECLQ,
  LFECEN,
  LMONTR,
  LIMPGS,
  LIMPDS,
  LIMPDF,
  LSALTR,
  LDISTR,
  LMARCA,
  LCUOTA,
  LIDTRA,
  LSTANT,
  LTIPTR,
  LPOSEM,
  LBINPR,
  LMCCTR,
  LCOMTR,
  LORITR,
  LCODTR,
  LCODBC,
  LCAUTR,
  LCRETR,
  LESTTR,
  LERRNB,
  LEIMP4,
  LECA62,
  LCPACE,
  LENEMI,
  LCORED,
  LCOTEL,
  LACTFJ,
  LNFACT,
  LNFISC,
  ENEADM,
  ENEPRO,
  LCODPR,
  LCOPRO,
  LCOCOM,
  LCOIVA,
  LCOADQ,
  LNTOKE
)
VALUES
(
  '0000000000000000',
  '0000000000000000',
  '0000000000000000',
  '   ',
  '0000',
  5400617,
  '*WEBBPS',
  '*PROCAR',
  '520',
  '                ',
  '520',
  '                ',
  ' ',
  20210518,
  20210518,
  91741,
  0,
  20210518,
  '600',
  80000.00,
  0.00,
  0.00,
  0.00,
  0.00,
  ' ',
  '  ',
  'PX741980        ',
  256095,
  'C',
  '    ',
  '627431',
  '    ',
  'RED DE COBROS Y PAGOS S.A.    ',
  'P',
  '524000',
  '   ',
  '256095',
  '00',
  'A',
  '113861256095',
  '     0982212540',
  '               ',
  '    ',
  '520',
  '981',
  '0982212540     ',
  '*WEBBPS   ',
  'PY        ',
  '       672740',
  '999',
  '999',
  '   ',
  0.00,
  0.0000,
  0.0000,
  0.0000,
  '256000000095         '
);

INSERT INTO libdebito.drconbep
(
  LCTAOR,
  LCTADE,
  LNRTAR,
  LEXTAR,
  LEXPIR,
  LIDCOM,
  LHISOR,
  LHISDE,
  LBCOCR,
  LCTACR,
  LBCODB,
  LCTADB,
  LCLEAR,
  LFCOTR,
  LFECTR,
  LHORTR,
  LFECLQ,
  LFECEN,
  LMONTR,
  LIMPGS,
  LIMPDS,
  LIMPDF,
  LSALTR,
  LDISTR,
  LMARCA,
  LCUOTA,
  LIDTRA,
  LSTANT,
  LTIPTR,
  LPOSEM,
  LBINPR,
  LMCCTR,
  LCOMTR,
  LORITR,
  LCODTR,
  LCODBC,
  LCAUTR,
  LCRETR,
  LESTTR,
  LERRNB,
  LEIMP4,
  LECA62,
  LCPACE,
  LENEMI,
  LCORED,
  LCOTEL,
  LACTFJ,
  LNFACT,
  LNFISC,
  ENEADM,
  ENEPRO,
  LCODPR,
  LCOPRO,
  LCOCOM,
  LCOIVA,
  LCOADQ,
  LNTOKE
)
VALUES
(
  '0000000000000000',
  '0000000000000000',
  '0000000000000000',
  '   ',
  '0000',
  5400617,
  '*WEBBPS',
  '*PROCAR',
  '520',
  '                ',
  '520',
  '                ',
  ' ',
  20210518,
  20210518,
  92841,
  0,
  20210518,
  '600',
  160000.00,
  0.00,
  0.00,
  0.00,
  0.00,
  ' ',
  '  ',
  'PX841881        ',
  257819,
  'C',
  '    ',
  '627431',
  '    ',
  'RED DE COBROS Y PAGOS S.A.    ',
  'P',
  '524000',
  '   ',
  '547389',
  '00',
  'A',
  '113861257819',
  '     0973547389',
  '               ',
  '    ',
  '520',
  '971',
  '0973547389     ',
  '*WEBBPS   ',
  'PY        ',
  '       681178',
  '999',
  '999',
  '   ',
  0.00,
  0.0000,
  0.0000,
  0.0000,
  '257000000819         '
);

INSERT INTO libdebito.drconbep
(
  LCTAOR,
  LCTADE,
  LNRTAR,
  LEXTAR,
  LEXPIR,
  LIDCOM,
  LHISOR,
  LHISDE,
  LBCOCR,
  LCTACR,
  LBCODB,
  LCTADB,
  LCLEAR,
  LFCOTR,
  LFECTR,
  LHORTR,
  LFECLQ,
  LFECEN,
  LMONTR,
  LIMPGS,
  LIMPDS,
  LIMPDF,
  LSALTR,
  LDISTR,
  LMARCA,
  LCUOTA,
  LIDTRA,
  LSTANT,
  LTIPTR,
  LPOSEM,
  LBINPR,
  LMCCTR,
  LCOMTR,
  LORITR,
  LCODTR,
  LCODBC,
  LCAUTR,
  LCRETR,
  LESTTR,
  LERRNB,
  LEIMP4,
  LECA62,
  LCPACE,
  LENEMI,
  LCORED,
  LCOTEL,
  LACTFJ,
  LNFACT,
  LNFISC,
  ENEADM,
  ENEPRO,
  LCODPR,
  LCOPRO,
  LCOCOM,
  LCOIVA,
  LCOADQ,
  LNTOKE
)
VALUES
(
  '0000000000000000',
  '0000000000000000',
  '0000000000000000',
  '   ',
  '0000',
  5400617,
  '*WEBBPS',
  '*PROCAR',
  '520',
  '                ',
  '520',
  '                ',
  ' ',
  20210518,
  20210518,
  94409,
  0,
  20210518,
  '600',
  75000.00,
  0.00,
  0.00,
  0.00,
  0.00,
  ' ',
  '  ',
  'PX409934        ',
  260511,
  'C',
  '    ',
  '627431',
  '    ',
  'RED DE COBROS Y PAGOS S.A.    ',
  'P',
  '524000',
  '   ',
  '260511',
  '00',
  'A',
  '113861260511',
  '     0983710316',
  '               ',
  '    ',
  '520',
  '981',
  '0983710316     ',
  '*WEBBPS   ',
  'PY        ',
  '       681178',
  '999',
  '999',
  '   ',
  0.00,
  0.0000,
  0.0000,
  0.0000,
  '260000000511         '
);

INSERT INTO libdebito.drconbep
(
  LCTAOR,
  LCTADE,
  LNRTAR,
  LEXTAR,
  LEXPIR,
  LIDCOM,
  LHISOR,
  LHISDE,
  LBCOCR,
  LCTACR,
  LBCODB,
  LCTADB,
  LCLEAR,
  LFCOTR,
  LFECTR,
  LHORTR,
  LFECLQ,
  LFECEN,
  LMONTR,
  LIMPGS,
  LIMPDS,
  LIMPDF,
  LSALTR,
  LDISTR,
  LMARCA,
  LCUOTA,
  LIDTRA,
  LSTANT,
  LTIPTR,
  LPOSEM,
  LBINPR,
  LMCCTR,
  LCOMTR,
  LORITR,
  LCODTR,
  LCODBC,
  LCAUTR,
  LCRETR,
  LESTTR,
  LERRNB,
  LEIMP4,
  LECA62,
  LCPACE,
  LENEMI,
  LCORED,
  LCOTEL,
  LACTFJ,
  LNFACT,
  LNFISC,
  ENEADM,
  ENEPRO,
  LCODPR,
  LCOPRO,
  LCOCOM,
  LCOIVA,
  LCOADQ,
  LNTOKE
)
VALUES
(
  '0000000000000000',
  '0000000000000000',
  '0000000000000000',
  '   ',
  '0000',
  5400617,
  '*WEBBPS',
  '*PROCAR',
  '520',
  '                ',
  '520',
  '                ',
  ' ',
  20210518,
  20210518,
  94501,
  0,
  20210518,
  '600',
  110000.00,
  0.00,
  0.00,
  0.00,
  0.00,
  ' ',
  '  ',
  'PX501774        ',
  260645,
  'C',
  '    ',
  '627431',
  '    ',
  'RED DE COBROS Y PAGOS S.A.    ',
  'P',
  '524000',
  '   ',
  '260645',
  '00',
  'A',
  '113861260645',
  '     0985106209',
  '               ',
  '    ',
  '520',
  '981',
  '0985106209     ',
  '*WEBBPS   ',
  'PY        ',
  '       681500',
  '999',
  '999',
  '   ',
  0.00,
  0.0000,
  0.0000,
  0.0000,
  '260000000645         '
);

INSERT INTO libdebito.drconbep
(
  LCTAOR,
  LCTADE,
  LNRTAR,
  LEXTAR,
  LEXPIR,
  LIDCOM,
  LHISOR,
  LHISDE,
  LBCOCR,
  LCTACR,
  LBCODB,
  LCTADB,
  LCLEAR,
  LFCOTR,
  LFECTR,
  LHORTR,
  LFECLQ,
  LFECEN,
  LMONTR,
  LIMPGS,
  LIMPDS,
  LIMPDF,
  LSALTR,
  LDISTR,
  LMARCA,
  LCUOTA,
  LIDTRA,
  LSTANT,
  LTIPTR,
  LPOSEM,
  LBINPR,
  LMCCTR,
  LCOMTR,
  LORITR,
  LCODTR,
  LCODBC,
  LCAUTR,
  LCRETR,
  LESTTR,
  LERRNB,
  LEIMP4,
  LECA62,
  LCPACE,
  LENEMI,
  LCORED,
  LCOTEL,
  LACTFJ,
  LNFACT,
  LNFISC,
  ENEADM,
  ENEPRO,
  LCODPR,
  LCOPRO,
  LCOCOM,
  LCOIVA,
  LCOADQ,
  LNTOKE
)
VALUES
(
  '0000000000000000',
  '0000000000000000',
  '0000000000000000',
  '   ',
  '0000',
  5400617,
  '*WEBBPS',
  '*PROCAR',
  '520',
  '                ',
  '520',
  '                ',
  ' ',
  20210518,
  20210518,
  94751,
  0,
  20210518,
  '600',
  33000.00,
  0.00,
  0.00,
  0.00,
  0.00,
  ' ',
  '  ',
  'PX751643        ',
  261137,
  'C',
  '    ',
  '627431',
  '    ',
  'RED DE COBROS Y PAGOS S.A.    ',
  'P',
  '524000',
  '   ',
  '570021',
  '00',
  'A',
  '113861261137',
  '     0973570021',
  '               ',
  '    ',
  '520',
  '971',
  '0973570021     ',
  '*WEBBPS   ',
  'PY        ',
  '       668100',
  '999',
  '999',
  '   ',
  0.00,
  0.0000,
  0.0000,
  0.0000,
  '261000000137         '
);

INSERT INTO libdebito.drconbep
(
  LCTAOR,
  LCTADE,
  LNRTAR,
  LEXTAR,
  LEXPIR,
  LIDCOM,
  LHISOR,
  LHISDE,
  LBCOCR,
  LCTACR,
  LBCODB,
  LCTADB,
  LCLEAR,
  LFCOTR,
  LFECTR,
  LHORTR,
  LFECLQ,
  LFECEN,
  LMONTR,
  LIMPGS,
  LIMPDS,
  LIMPDF,
  LSALTR,
  LDISTR,
  LMARCA,
  LCUOTA,
  LIDTRA,
  LSTANT,
  LTIPTR,
  LPOSEM,
  LBINPR,
  LMCCTR,
  LCOMTR,
  LORITR,
  LCODTR,
  LCODBC,
  LCAUTR,
  LCRETR,
  LESTTR,
  LERRNB,
  LEIMP4,
  LECA62,
  LCPACE,
  LENEMI,
  LCORED,
  LCOTEL,
  LACTFJ,
  LNFACT,
  LNFISC,
  ENEADM,
  ENEPRO,
  LCODPR,
  LCOPRO,
  LCOCOM,
  LCOIVA,
  LCOADQ,
  LNTOKE
)
VALUES
(
  '0986417655000000',
  '0000000000000000',
  '0000000000000000',
  '   ',
  '0000',
  1000766,
  'InG/Hyp',
  '*PROCAR',
  '520',
  '                ',
  '520',
  '                ',
  ' ',
  20210518,
  20210518,
  145305,
  0,
  20210518,
  '600',
  5000.00,
  0.00,
  0.00,
  0.00,
  0.00,
  ' ',
  '  ',
  'PX03372732      ',
  307970,
  'C',
  ' 011',
  '627431',
  '    ',
  'FARMAZETA                     ',
  'P',
  '514000',
  '   ',
  '307970',
  '00',
  'A',
  '113861307970',
  '     0986417655',
  'INGTETRA_J_2_30',
  '    ',
  '520',
  '981',
  '0986417655     ',
  '14722732  ',
  'PY        ',
  '       640802',
  '999',
  '999',
  '   ',
  0.00,
  0.0000,
  0.0000,
  0.0000,
  '307000000970         '
);

INSERT INTO libdebito.drconbep
(
  LCTAOR,
  LCTADE,
  LNRTAR,
  LEXTAR,
  LEXPIR,
  LIDCOM,
  LHISOR,
  LHISDE,
  LBCOCR,
  LCTACR,
  LBCODB,
  LCTADB,
  LCLEAR,
  LFCOTR,
  LFECTR,
  LHORTR,
  LFECLQ,
  LFECEN,
  LMONTR,
  LIMPGS,
  LIMPDS,
  LIMPDF,
  LSALTR,
  LDISTR,
  LMARCA,
  LCUOTA,
  LIDTRA,
  LSTANT,
  LTIPTR,
  LPOSEM,
  LBINPR,
  LMCCTR,
  LCOMTR,
  LORITR,
  LCODTR,
  LCODBC,
  LCAUTR,
  LCRETR,
  LESTTR,
  LERRNB,
  LEIMP4,
  LECA62,
  LCPACE,
  LENEMI,
  LCORED,
  LCOTEL,
  LACTFJ,
  LNFACT,
  LNFISC,
  ENEADM,
  ENEPRO,
  LCODPR,
  LCOPRO,
  LCOCOM,
  LCOIVA,
  LCOADQ,
  LNTOKE
)
VALUES
(
  '0000000000000000',
  '0000000000000000',
  '0000000000000000',
  '   ',
  '0000',
  5400617,
  '*WEBBPS',
  '*PROCAR',
  '520',
  '                ',
  '520',
  '                ',
  ' ',
  20210518,
  20210518,
  83810,
  0,
  20210518,
  '600',
  95480.00,
  0.00,
  0.00,
  0.00,
  0.00,
  ' ',
  '  ',
  'PX810583        ',
  250392,
  'C',
  '    ',
  '627431',
  '    ',
  'RED DE COBROS Y PAGOS S.A.    ',
  'P',
  '524000',
  '   ',
  '543742',
  '00',
  'A',
  '113861250392',
  '     0981543742',
  '               ',
  '    ',
  '520',
  '971',
  '0981543742     ',
  '*WEBBPS   ',
  'PY        ',
  '       649168',
  '999',
  '999',
  '   ',
  0.00,
  0.0000,
  0.0000,
  0.0000,
  '250000000392         '
);

INSERT INTO libdebito.drconbep
(
  LCTAOR,
  LCTADE,
  LNRTAR,
  LEXTAR,
  LEXPIR,
  LIDCOM,
  LHISOR,
  LHISDE,
  LBCOCR,
  LCTACR,
  LBCODB,
  LCTADB,
  LCLEAR,
  LFCOTR,
  LFECTR,
  LHORTR,
  LFECLQ,
  LFECEN,
  LMONTR,
  LIMPGS,
  LIMPDS,
  LIMPDF,
  LSALTR,
  LDISTR,
  LMARCA,
  LCUOTA,
  LIDTRA,
  LSTANT,
  LTIPTR,
  LPOSEM,
  LBINPR,
  LMCCTR,
  LCOMTR,
  LORITR,
  LCODTR,
  LCODBC,
  LCAUTR,
  LCRETR,
  LESTTR,
  LERRNB,
  LEIMP4,
  LECA62,
  LCPACE,
  LENEMI,
  LCORED,
  LCOTEL,
  LACTFJ,
  LNFACT,
  LNFISC,
  ENEADM,
  ENEPRO,
  LCODPR,
  LCOPRO,
  LCOCOM,
  LCOIVA,
  LCOADQ,
  LNTOKE
)
VALUES
(
  '0000000000000000',
  '0000000000000000',
  '0000000000000000',
  '   ',
  '0000',
  5400617,
  '*WEBBPS',
  '*PROCAR',
  '520',
  '                ',
  '520',
  '                ',
  ' ',
  20210518,
  20210518,
  83841,
  0,
  20210518,
  '600',
  50000.00,
  0.00,
  0.00,
  0.00,
  0.00,
  ' ',
  '  ',
  'PX841252        ',
  250448,
  'C',
  '    ',
  '627431',
  '    ',
  'RED DE COBROS Y PAGOS S.A.    ',
  'P',
  '524000',
  '   ',
  '250448',
  '00',
  'A',
  '113861250448',
  '     0982636996',
  '               ',
  '    ',
  '520',
  '981',
  '0982636996     ',
  '*WEBBPS   ',
  'PY        ',
  '       661883',
  '999',
  '999',
  '   ',
  0.00,
  0.0000,
  0.0000,
  0.0000,
  '250000000448         '
);

INSERT INTO libdebito.drconbep
(
  LCTAOR,
  LCTADE,
  LNRTAR,
  LEXTAR,
  LEXPIR,
  LIDCOM,
  LHISOR,
  LHISDE,
  LBCOCR,
  LCTACR,
  LBCODB,
  LCTADB,
  LCLEAR,
  LFCOTR,
  LFECTR,
  LHORTR,
  LFECLQ,
  LFECEN,
  LMONTR,
  LIMPGS,
  LIMPDS,
  LIMPDF,
  LSALTR,
  LDISTR,
  LMARCA,
  LCUOTA,
  LIDTRA,
  LSTANT,
  LTIPTR,
  LPOSEM,
  LBINPR,
  LMCCTR,
  LCOMTR,
  LORITR,
  LCODTR,
  LCODBC,
  LCAUTR,
  LCRETR,
  LESTTR,
  LERRNB,
  LEIMP4,
  LECA62,
  LCPACE,
  LENEMI,
  LCORED,
  LCOTEL,
  LACTFJ,
  LNFACT,
  LNFISC,
  ENEADM,
  ENEPRO,
  LCODPR,
  LCOPRO,
  LCOCOM,
  LCOIVA,
  LCOADQ,
  LNTOKE
)
VALUES
(
  '0000000000000000',
  '0000000000000000',
  '0000000000000000',
  '   ',
  '0000',
  5400617,
  '*WEBBPS',
  '*PROCAR',
  '520',
  '                ',
  '520',
  '                ',
  ' ',
  20210518,
  20210518,
  84005,
  0,
  20210518,
  '600',
  276940.00,
  0.00,
  0.00,
  0.00,
  0.00,
  ' ',
  '  ',
  'PX005025        ',
  250633,
  'C',
  '    ',
  '627431',
  '    ',
  'RED DE COBROS Y PAGOS S.A.    ',
  'P',
  '524000',
  '   ',
  '303660',
  '00',
  'A',
  '113861250633',
  '     0981303660',
  '               ',
  '    ',
  '520',
  '971',
  '0981303660     ',
  '*WEBBPS   ',
  'PY        ',
  '       645113',
  '999',
  '999',
  '   ',
  0.00,
  0.0000,
  0.0000,
  0.0000,
  '250000000633         '
);

INSERT INTO libdebito.drconbep
(
  LCTAOR,
  LCTADE,
  LNRTAR,
  LEXTAR,
  LEXPIR,
  LIDCOM,
  LHISOR,
  LHISDE,
  LBCOCR,
  LCTACR,
  LBCODB,
  LCTADB,
  LCLEAR,
  LFCOTR,
  LFECTR,
  LHORTR,
  LFECLQ,
  LFECEN,
  LMONTR,
  LIMPGS,
  LIMPDS,
  LIMPDF,
  LSALTR,
  LDISTR,
  LMARCA,
  LCUOTA,
  LIDTRA,
  LSTANT,
  LTIPTR,
  LPOSEM,
  LBINPR,
  LMCCTR,
  LCOMTR,
  LORITR,
  LCODTR,
  LCODBC,
  LCAUTR,
  LCRETR,
  LESTTR,
  LERRNB,
  LEIMP4,
  LECA62,
  LCPACE,
  LENEMI,
  LCORED,
  LCOTEL,
  LACTFJ,
  LNFACT,
  LNFISC,
  ENEADM,
  ENEPRO,
  LCODPR,
  LCOPRO,
  LCOCOM,
  LCOIVA,
  LCOADQ,
  LNTOKE
)
VALUES
(
  '0000000000000000',
  '0000000000000000',
  '0000000000000000',
  '   ',
  '0000',
  5400617,
  '*WEBBPS',
  '*PROCAR',
  '520',
  '                ',
  '520',
  '                ',
  ' ',
  20210518,
  20210518,
  84911,
  0,
  20210518,
  '600',
  80000.00,
  0.00,
  0.00,
  0.00,
  0.00,
  ' ',
  '  ',
  'PX911731        ',
  251765,
  'C',
  '    ',
  '627431',
  '    ',
  'RED DE COBROS Y PAGOS S.A.    ',
  'P',
  '524000',
  '   ',
  '251765',
  '00',
  'A',
  '113861251765',
  '     0981309501',
  '               ',
  '    ',
  '520',
  '981',
  '0981309501     ',
  '*WEBBPS   ',
  'PY        ',
  '       668141',
  '999',
  '999',
  '   ',
  0.00,
  0.0000,
  0.0000,
  0.0000,
  '251000000765         '
);

SELECT * FROM libdebito.drconbep WHERE L ='113861251765';
113861251765 ok

select * from libdebito.drconbep where lcodtr in ('514000','524000') and lfcotr = '20210518';

select AUTTRXCOD, AUTRRNBEP,AUTMARTAR,AUTPROTAR,AUTOPEORI,AUTTELDES from gxbdbps.tswaut where autrrnbep IN ( 
'113761230052',
'113861243833',
'113861244360',
'113861245551',
'113861246631',
'113861247596',
'113861248251',
'113861250339',
'113861250392',
'113861250448',
'113861250633',
'113861251765',
'113861252950',
'113861253213',
'113861253398',
'113861253528',
'113861253759',
'113861254084',
'113861254621',
'113861254896',
'113861256095',
'113861257819',
'113861260511',
'113861260645',
'113861261137',
'113861307970',
'113861250392',
'113861250448',
'113861250633',
'113861251765');  

select AUTRRNBEP,AUTMARTAR,AUTPROTAR,AUTOPEORI,AUTTELDES from libclea.tswaut where AUTRRNBEP in ('113861251765'); 

SELECT * FROM gxbdbps.TSWAUT WHERE AUTTRXCOD in ('514000','524000') AND AUTTRXCOD = '20210518';

SELECT * FROM gxbdbps.tswaut a,  LIBDEBITO.DRCONBEP d WHERE a.AUTRRNBEP = d.LERRNB AND a.AUTTRXCOD in ('514000','524000') AND a.AUTTRXFCHC = '20210518'
AND a.AUTRRNBEP IN ( 
'113761230052',
'113861243833',
'113861244360',
'113861245551',
'113861246631',
'113861247596',
'113861248251',
'113861250339',
'113861250392',
'113861250448',
'113861250633',
'113861251765',
'113861252950',
'113861253213',
'113861253398',
'113861253528',
'113861253759',
'113861254084',
'113861254621',
'113861254896',
'113861256095',
'113861257819',
'113861260511',
'113861260645',
'113861261137',
'113861307970',
'113861250392',
'113861250448',
'113861250633',
'113861251765');

select * from libdebito.drconbep where lerrnb = '113761230052'

select * from gxbdbps.tswaut where autrrnbep IN ( 
'113761230052',
'113861243833',
'113861244360',
'113861245551',
'113861246631',
'113861247596',
'113861248251',
'113861250339',
'113861250392',
'113861250448',
'113861250633',
'113861251765',
'113861252950',
'113861253213',
'113861253398',
'113861253528',
'113861253759',
'113861254084',
'113861254621',
'113861254896',
'113861256095',
'113861257819',
'113861260511',
'113861260645',
'113861261137',
'113861307970',
'113861250392',
'113861250448',
'113861250633',
'113861251765');

select * from libdebito.drconbep where LERRNB in ('113861261137', '113861307970');

select * from  GXTRJDTA.TDGEMP WHERE PROIDPRODU IN ('VTM', 'PGF');

SELECT * FROM libclea.tswaut where AUTRRNBEP in ('113861251765');

select

select * from mastercard.masctldta where mcrrnbepsa in ( '106144918596','105441699922');

select * from libdebito.drconbep where lerrnb in ( '106144918596','105441699922');

SELECT LIFECHD FROM JAVIERLIB.flicom GROUP BY lifechd

select * from mastercard.masctldta where mcrrnbepsa in ( '106144918596','105441699922');
select * from libdebito.drconbep where lerrnb in ( '106144918596','105441699922');

select * from gxbdbps.tswaut where AUTRRNBEP in ( '106144918596', '105441699922');

select auttrxfchc, count(*) from javierlib.tswautbk group by auttrxfchc order by auttrxfchc desc;

select * from gxfindta.tclmov where MOVRRNBEP in ( 
'113761230052',
'113861243833',
'113861244360',
'113861245551',
'113861246631',
'113861247596',
'113861248251',
'113861250339',
'113861250392',
'113861250448',
'113861250633',
'113861251765',
'113861252950',
'113861253213',
'113861253398',
'113861253528',
'113861253759',
'113861254084',
'113861254621',
'113861254896',
'113861256095',
'113861257819',
'113861260511',
'113861260645',
'113861261137',
'113861307970',
'113861250392',
'113861250448',
'113861250633',
'113861251765');

select * from gxfindta.tclmov where MOVRRNBEP in ( '106144918596', '105441699922');

select AUTTRXCOD, AUTRRNBEP,AUTMARTAR,AUTPROTAR,AUTOPEORI,AUTTELDES from gxbdbps.tswaut where autrrnbep IN ( '106144918596', '105441699922');
select * from gxbdbps.tswaut where autrrnbep IN ( '106144918596', '105441699922');
select * from gxfindta.tclmov where MOVRRNBEP in ( '106144918596', '105441699922');

select * from libdebito.drconbep where lbinpr = '703020' and lfcotr = '20210527' --  lerrnb IN ( '106144918596', '105441699922');


--#16599 - Testing - Datos tarjetas (VISA Adq POS)
Revision pruebas trx
SBMJOB CMD(CALL PGM(GXPGBPS/APAUT011) PARM('&FchComercial' 'REferencia'))

Query para verificar:

select lerrnb,lfcotr, LMARCA,	LCPACE,	LTIPTR  from libdebito.drconbep where lenemi = '540' and lcretr = '00' and substr(lidtra,1,1) = 'P'
and lerrnb in  ('115500164763','115500164773','115500164771');
select *  from gxbdbps.tswaut where autrrnbep in ('115500164763','115500164773','115500164771');
select AUTRRNBEP RRN,AUTTRXFCHC FECHA_COMERCIAL,AUTMARTAR MARCA,AUTPROTAR PRODUCTO,AUTAMBBIN AMBITO_USO,AUTTIPTAR TIPO_TARJETA
from gxbdbps.tswaut where autrrnbep in ('105441618012');
-- Para ejecutar proceso de carga
SBMJOB CMD(CALL PGM(GXPGBPS/APAUT011) PARM('20210604' '115500164763'))
SBMJOB CMD(CALL PGM(GXPGBPS/APAUT011) PARM('20210604' '115500164773'))
SBMJOB CMD(CALL PGM(GXPGBPS/APAUT011) PARM('20210604' '115500164771'))

Copiar dato a testing:

select * from libdebito.drconbep 
where lenemi = '540' and lcretr = '00' 
and substr(lidtra, 1, 1) = 'P'
and lfcotr > '20201231'
and LBINPR in (
493000,
434559);
and lerrnb in  ('116100165730','116100165731','116100165854');

443078; debito
443077;
425936; credito
425935;

488234; debito
425936; credito procard
443076;
443078; debito bancard bnf
493000;
434559; credito 
select * from gxbdbps.tswaut where AUTRRNBEP = '115800164838';

select * from visa.visctldta 

where virrnbepsa in ('116100165730','116100165731','116100165854');


select * from visa.visctldta
where virrnbepsa in (
select lerrnb from libdebito.drconbep 
where lenemi = '540' and lcretr = '00' 
and substr(lidtra, 1, 1) = 'P'
and lfcotr > '20210531');

select * from libdebito.drconbep where lerrnb in (
'115500164763',
'115500164771',
'115500164773');

select * from gxbdbps.guseraf;
select * from gxbdbps.gustraf;
