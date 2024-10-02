****************************************************************************************************************
****************************************************************************************************************
/*DATOS DE EMBOZADOS TARJETAS DE DEBITO*/
tabla diario
select * from libdebito.EMBNOV0D where crenti='165' and crfege='20191230' and crhoge between '105040' and '110240'
--delete from libdebito.EMBNOV0D where crenti='020' and crfege='20191127' and crhoge between '105040' and '110240'
select * from libdebito.EMBNOV0D where crenti='020' and crfege='20200120'
tabla temporal
select * from libdebito.EMBNOVTMD  where crenti='020'
tabla Historica
select * from libdebito.EMBNOV0dh
****************************************************************************************************************
reproceso visa
****************************************************************************************************************


****************************************************************************************************************
****************************************************************************************************************

select * from libdebito.tgembnov
select * from libdebito.tgembhaf where crtarj='4569760000231252'crenti='5165'
select * from libdebito.embnovhst where crenti='5165'
select * from libdebito.embnovtmp
select count(*) from libdebito.EMBtrkdeb where tkenti='021' and tkfee2='20191230' and tkbine='488234'
update libdebito.embtrkdeb set tkstat='',tkfees='' where tkenti='015' and tkfee2='20191230' and tkbine='488234'
--delete from libdebito.EMBtrkdeb where tkenti='020' and tkfee2='20190821'
select * from libdebito.EMBtrkvis where tkenti='1020'


/*Seleccionar registros*/
credito
select * from libdebito.EMBNOVHST where crbine='627431' and crenti='021' and crusej='U99ENRIQUE' AND CRFEEJ='20220315'

delete from libdebito.EMBNOVHST where crbine='627431' and crenti='021' and crusej='U99ENRIQUE' AND CRFEEJ='20220315'
debito 
select * from libdebito.EMBNOVHSTD  where  crbine ='547697' crenti='173' and  crdocu in ('3794955')
  and crfeej='20210528'--,'4801357') and crfeej='20210601' and crusej='U99JOSEEN'4
delete from libdebito.EMBNOVHSTD  where crenti='015' and  crdocu in ('3175549','4801357')  and crfeej='20210601' and crusej='U99JOSEEN'
--delete  from libdebito.EMBNOVHSTD  where crenti='040' and crfege='20190821'

update yapi.embnov16 set CRUSEJ=0, CRHOEJ=0, CRFEEJ=0  

/*copiar registros*/
TARJETA DE CREDITO EMBRG415
CPYF FROMFILE(YAPI/EMBOZADO07) TOFILE(LIBDEBITO/EMBNOV0P) MBROPT(*ADD) FMTOPT(*MAP *DROP)      
TARJETA DE DEBITO EMBRG410
CPYF FROMFILE(YAPI/EMBOZADO12) TOFILE(LIBDEBITO/EMBNOV0D) MBROPT(*ADD) FMTOPT(*MAP *DROP)

****************************************************************************************************************
****************************************************************************************************************
/*REPROCESO ALTAS DE EMBOZADOS RIO Y CONTINENTAL*/
TDCLIENTED
    and tdclinrodoc='4172753'
--delete from gxbdbps.tdcliented where tdbinentid='1020' and tdclinrodoc='4934283'
select * from gxbdbps.tdcliente where TDPRIMNOM LIKE '%ANDREA%' AND TDPRIMAPE LIKE '%BOGADO%' tdbinentid='1002' and tdfeching='20191230' and tdclinrodoc='4172753'
--delete gxbdbps.tdcliente where tdbinentid='1020' and tdclinrodoc='4934283'
select * from gxbdbps.tdcta where tdbinentid='1002' and tdbinnro='456976' and tdctanro='102026062'
--delete from gxbdbps.tdcta where tdctanro='126515103'
select * from gxbdbps.tdctaad  where tdadhnompla like '%BOGAGO%'  tdbinentid='1020'  and tdbinnro='456976' and tdclinrodoc='4172753' and  tdctanro='102026062' tdctanro='108648076'
--delete from gxbdbps.tdctaad  where  tdctanro='126515103'
select * from gxbdbps.tdemis where  tdbinentid =  ('1020') and tdctanro='3258555'
and  and '20200117' and tdemusalt='USRCONTI' --and tdemfecexp=20211
--and tdbinnro in ('703040')
--and tdctanro='123482804'    and tdemcta='2'  and tdfechemb='20190628' and tdhoraemb=1704
--delete from gxbdbps.tdemis where tdbinentid='1020' and tdfechemb='20190627' and tdhoraemb=1704
select * from gxbdbps.tdemisnov 
where tdbinentid
in ('5165')  and tdbinnro='627431' and tdfechproc='00000000'--and tdemcta>1
and tdfechent='20191127'  and tdctanro='123482804'
SELECT * FROM GXBDBPS.TDEMIS WHERE TDCTANRO='121064449'
--delete from gxbdbps.tdemisnov where tdbinentid='1020' and tdctanro='126515103'
select * from gxbdbps.tdbindet where tdbinentid='1002' where 
select * from yapi.tdbindet where tdbinentid='1020' AND tdavcampo='PREFIJO'
--delete from yapi.tdbindet where tdbinentid='1020' AND tdavcampo='PREFIJO'

select * from gxbdbps.tdemnotar where  NECTANRO='5203511907' nebinnro in ('456976') and nefchexp='202411'

select * from gxbdbps.tdemis where tdbinentid in ('1020','1040') 
and tdemfecalt BETWEEN '20220513' and '20220516' 
and tdbinnro in ('703020','703040')

update gxbdbps.tdemis set tdemest='I', tdestid='15'
--select * from gxbdbps.tdemis
where tdbinentid in ('1020','1040') 
and tdemfecalt 
BETWEEN '20190801' and '20190820' 
and tdbinnro in ('703020','703040')
and tdemcta='1'

SELECT * FROM LIBDEBITO.TGEMBHAF WHERE CRDOCU ='3258555'
select * from gxbdbps.mtdfic
select * from gxbdbps.tdemis where tdbinentid in ('1020') and tdbinnro in ('456976') and    tdusuupd='PCON019' and tdemcta='2' and tdctanro in ('0123025103','0107348302')
select * from gxbdbps.tdemis where tdbinentid in ('1020') and tdbinnro in ('456976') and   tdctanro='102026062'
select * from libdebito.tgembhaf where crtarj='2306710001005660'

select * from gxbdbps.tdcta where tdctatar='4569760000396121'
select * from gxbdbps.tdcta where tdctanro='4403206702'
select * from gxbdbps.tdctaad where tdctanro='4403206702' 
select * from gxbdbps.tswaut

select * from libdebito.tgembhaf where crnomb like '%ALAN%GENEZ%'


SELECT * FROM GXFINDTA.TCMDIS t WHERE   CLICLICOD = 14661 AND SUCSUCCOD = 144;

select * from gxtrjdta.tcadec where decnrotrj='5148480000000782'




select * from gxtrjdta.tdscal where CALANHO='2022'

select * from libdebito.tgembhaf where crnomb like '%CARMEN%AMARILLA%' AND CRDOCU='2849425'
