select * from  libdebito.EMBNOVHSTD  
where crbine='456976'                
and crdocu in ('4552762',  '2943412', '3841290', 
'5580402', '4387627', '4349868', '2955988', 
'5345088', '7527091', '4952851', '6167826', 
'2212818', '2541568', '3331684', '5144036', 
'5757872', '4871208', '4019915', '3601680', 
'5737304', '4468040', '7247579', '5008510', 
'1463271', '3525027', '5637183', '6359768', 
'3523949', '3796508', '5343977', '5081812', 
'5762117', '5421289', '1863413', '6923391', 
'1192823', '4165037', '6576316', '5145508', 
'5282541', '4109901', '4932489', '5010920', 
'7102190', '4218647', '4713633',  '5333974',  
'4940850',  '6045110',  '5001034',  '4882153', 
'2618366', '5378492', '6786683', '5231306', 
'377572', '2491607', '986201', '4144435', 
'3656998', '920391', '4361593', '4019164', 
'2895683', '2455266', '2365232', '1956399', 
'1956399', '7731606', '6222686', '796591', 
'5960600', '6158834', '5100178', '6744829', 
'6568911', '4042066', '4256709', '5092690', 
'4721202', '4204278', '5072655', '5238138', 
'2408934', '4326656', '1036945')
and crfeej='20200916'



delete libdebito.EMBNOVHSTD  
where crbine='456976'                
and crdocu in ('4552762',  '2943412', '3841290', 
'5580402', '4387627', '4349868', '2955988', 
'5345088', '7527091', '4952851', '6167826', 
'2212818', '2541568', '3331684', '5144036', 
'5757872', '4871208', '4019915', '3601680', 
'5737304', '4468040', '7247579', '5008510', 
'1463271', '3525027', '5637183', '6359768', 
'3523949', '3796508', '5343977', '5081812', 
'5762117', '5421289', '1863413', '6923391', 
'1192823', '4165037', '6576316', '5145508', 
'5282541', '4109901', '4932489', '5010920', 
'7102190', '4218647', '4713633',  '5333974',  
'4940850',  '6045110',  '5001034',  '4882153', 
'2618366', '5378492', '6786683', '5231306', 
'377572', '2491607', '986201', '4144435', 
'3656998', '920391', '4361593', '4019164', 
'2895683', '2455266', '2365232', '1956399', 
'1956399', '7731606', '6222686', '796591', 
'5960600', '6158834', '5100178', '6744829', 
'6568911', '4042066', '4256709', '5092690', 
'4721202', '4204278', '5072655', '5238138', 
'2408934', '4326656', '1036945')
and crfeej='20200916'


select * from  libdebito.EMBNOVHSTD  
where crbine='456976'                
and crdocu in ('4908930')



select * from gxbdbps.tmctaaf where mcfefij ='20200831'
update gxbdbps.TMCTAAF set mcpmfij=0, mcfefij ='20200930'
where mcemiso in ('002','317','321','324','325','326','327','328','329','330','331','347','014')
and mcstats='1'



select * from  libdebito.EMBNOVHSTD  
where crbine='456976'                
and crdocu in ('4908930')


select * from  libdebito.embnov0d  where crenti='020' and crcodn='2'

delete libdebito.embnov0d  where crenti='020' and crcodn='2'

select * from gxbdbps.tdentidad
select * from gxbdbps.gentiaf




SELECT
CRENTI, CRSUCU, CRCLAT, CRBINE, CRTARJ, CRDECR, 
CRNROC, CRNCTA, CRNOMB, CRTDOC, cRDOCU, CRVENC, CRNEMP, 
CRDIRE, CRLOCA, CRTELE, CRLCRE, CRCODN, CRUSGE, 
CRHOGE, CRFEGE, CRRETO, 
CRUSEJ, CRHOEJ, CRFEEJ
FROM libdebito.TGEMBHAF
where crbine='703002'  and crfeej='20200923' 
and crhoej='154115'   

delete libdebito.TGEMBHAF
where crbine='703002'  and crfeej='20200923' 
and crhoej='154115'   




select CRENTI, CRSUCU, CRCLAT, CRBINE, tdctatar as crtarj, CRDECR, 
decimal(substr(CRTARJ,7,10)) as CRNROC, 
CRNCTA, CRNOMB, CRDOCU, CRVENC, CRNEMP, 
CRDIRE, CRLOCA, CRTELE, CRLCRE, CRCODN, CRUSGE, 
CRHOGE, 20200923 as CRFEGE, CRRETO, CRUSEJ, CRHOEJ, 0 as CRFEEJ
from LIBDEBITO.TGEMBHAF a 
inner join gxbdbps.tdcta on tdctanro=decimal(substr(CRTARJ,7,10)) 
where   a.crbine in ('703020')
and a.crfEEJ='20200923'
and crhoej>='154100'  

select * from  libdebito.tgembhaf  
where crbine='703020'  and crfeej='20200923' 
and crhoej>='154100'   

select CRENTI, CRSUCU, CRCLAT, CRBINE, tdctatar as crtarj, CRDECR, 
decimal(substr(CRTARJ,7,10)) as CRNROC, 
CRNCTA, CRNOMB, CRDOCU, CRVENC, CRNEMP, 
CRDIRE, CRLOCA, CRTELE, CRLCRE, CRCODN, CRUSGE, 
CRHOGE, 20200923 as CRFEGE, CRRETO, CRUSEJ, CRHOEJ, 0 as CRFEEJ
from LIBDEBITO.TGEMBHAF a 
inner join gxbdbps.tdcta on tdctanro=decimal(substr(CRTARJ,7,10)) 
where   a.crbine in ('703040')
and a.crfEEJ='20200923'
and crhoej>='154100'  

select * from  libdebito.tgembhaf  
where crbine='703040'  and crfeej='20200923' 
and crhoej>='154100'  

      
select * from  libdebito.EMBNOVHSTD  
where crbine='456976'                
and crdocu in ('4519242')


select * from  gxbdbps.tgtclf where enemiso='021'

update gxbdbps.tgtclf set CLFFCH='20200831'
where enemiso='021'


select * from  libdebito.EMBNOVHSTD  
where crbine='456976'                
and crdocu in ('5321300')



select * from  libdebito.EMBNOVHSTD  
where crbine='488234'                
and crdocu in ('696614')

select * from  libdebito.EMBNOVHSTD  
where crbine='488234'       

select * from  libdebito.EMBNOVHSTD  
where crbine='456976'                
and crdocu in ('4005228')



select * from  libdebito.embnov0d  


select * from  libdebito.EMBNOVHSTD  
where crbine='456976' and crtarj='4569760000125058'
and crusge='U99ENRIQUE'


select CRENTI, CRSUCU, CRCLAT, CRBINE, tdctatar as crtarj, CRDECR, 
decimal(substr(CRTARJ,7,10)) as CRNROC, 
CRNCTA, CRNOMB, CRDOCU, CRVENC, CRNEMP, 
CRDIRE, CRLOCA, CRTELE, CRLCRE, CRCODN, CRUSGE, 
CRHOGE, 20200930 as CRFEGE, CRRETO, CRUSEJ, CRHOEJ, 0 as CRFEEJ
from LIBDEBITO.TGEMBHAF a 
inner join gxbdbps.tdcta on tdctanro=decimal(substr(CRTARJ,7,10)) 
where   a.crbine in ('456976')
and a.crfege='20200930'
and a.crhoej>'105223'

select * from libdebito.tgembhaf where crbine='456976'


select * from gxtrjdta.TEnECx  where ecxbadtous='USRSOCKET'



select * from  libdebito.EMBNOVHSTD  
where crbine='456976'                
and crdocu in ('4519242')

select * from  libdebito.EMBNOVHSTD  
where crbine='456976'                
and crdocu in ('5576274')

select * from  libdebito.embn 


INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '083', 'S', '20200201', 'U99ALBERTO', '0102184061  ', 'K', 20021, '057', 0, 1020, '020', '703002');


select * from  libdebito.EMBNOVHSTD  
where crbine='456976'                
and crdocu in ('5148540', '3521053')
and crfege='20200930'

select * from  gxbdbps.tdbindet  


select * from  libdebito.drconbep where lfectr='20201003' and lhortr>='210000'  and loritr='P' and substr(leca62, 1, 1)='V' ORDER BY LHORTR DESC

select crdocu as CI, crnomb as NOMBRE, crtarj as TARJETA, crfege as FECHA, crcodn as NOVEDAD from  libdebito.tgembhaf where crbine='703002' and crfeej between '20200601'  and '20200630' and crcodn=1


select* from  libdebito.tgembhaf where crbine='703002' and crfege between '20200601'  and '20200630' and crcodn=1

update yapi.temporal set TARJETA=(SUBSTR(TARJETA,1,6) || 'XXXXXX' ||SUBSTR(TARJETA,13,4));

update yapi.temporal4 set TARJETA=(SUBSTR(TARJETA,1,6) || 'XXXXXX' ||SUBSTR(TARJETA,13,4));

select * from yapi.temporal

select * from  gxbdbps.tswotp  


INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '083', 'S', '20201005', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5115, '115', '627431115');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '083', 'S', '20201005', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5165, '165', '627431165');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '083', 'S', '20201005', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5166, '166', '627431166');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '083', 'S', '20201005', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5167, '167', '627431167');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '083', 'S', '20201005', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5169, '169', '627431169');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '083', 'S', '20201005', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5170, '170', '627431170');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '083', 'S', '20201005', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5171, '171', '627431171');
INSERT INTO GXOPERA.TCLSEC VALUES ( '000054',  '083', 'S', '20201005', 'U99HERNAN', '0102184061  ', 'K', 20021, '057', 0, 5174, '174', '627431174');






select * from gxbdbps.tdcta 
where tdbinentid = '1020' 
and tdctanro in ('6504874064')

update gxbdbps.tdcta set tdctatar='4569760000125058'
where tdbinentid = '1020' 
and tdctanro in ('6504874064')


select * from gxbdbps.tdcta 
where tdbinentid = '1020' 
and tdctanro in ('4604668255')

update gxbdbps.tdcta set tdctatar='4569760000129977'
where tdbinentid = '1020' 
and tdctanro in ('4604668255')

select * from gxbdbps.tdcta 
where tdbinentid = '1020' 
and tdctanro in ('2505301651')


update gxbdbps.tdcta set tdctatar='4569760000131536'
where tdbinentid = '1020' 
and tdctanro in ('2505301651')


select * from gxbdbps.tdcta 
where tdbinentid = '1020' 
and tdctanro in ('105261648')

update gxbdbps.tdcta set tdctatar='4569760000133821'
where tdbinentid = '1020' 
and tdctanro in ('105261648')

--Se genera archivo auxiliar y se pasa a embnov0d para embozar de nuevo

select * from  libdebito.EMBNOVHSTD  
where crbine='456976'                
and crdocu in (
'4782178',	'6687799',	'5148540', '6943809')
and crfege>'20200901'

Se genera archivo auxiliar y se pasa a embnov0d para embozar de nuevo

select * from  libdebito.EMBNOV0d

select * from  gxbdbps.tdentidad

SELECT * FROM GXBDBPS.TCODPP WHERE COCOMER IN('0100140','0302065','0200701','0200702','0200812','0702159','2300489','0702093','0702610','8101689','8601126','0702727','0200851','0200885'
,'0200691','0703303','8102171','8601627','4800151','0702681','8102320','8601782','0703220','2300519','8102341','8601804','0702568','0702025','8101373','8600808','0703096','8102228','8601684'
,'0701362','2800051','2800052','0703276','8102331','8601794','2100423','8101919','8601356','2100562','0702569','1002064','0702175','1100268','0703150','8102138','8601592','0901639','0702870'
,'0702819','8101926','8601363','0702172','0703342','8102205','8601661','0701350','0703367','8102226','8601682','0702375','0702914','0703365','1400617','8101936','8601373','0703422','8102317'
,'8601779','0800605','7300041','0703230','8102084','8601529','0702766','0702130','0702882','1000298','1000302','0901571','0200891','0703412','8102311','8601773','0703187','8102167','8601623'
,'0801211','0702137','6000406','2400079','0701518','1200180','0700290','5100081','8101130','1100232','1200133','0702222','0901190','0200476','0801312','0800925','0702291','0701930','0901574'
,'0301238','1301808','1301809','1301810','1301811','1301813','1301814','1301815','1301984','0701321','1301647','1100213','1100248','0701490','0701185','0301745','0301527','0801170','1001497'
,'6900151','6900152','4900035','4900036','0701389','0301816','1400466','0200474','0302028','0302089','0301916','0302048','4000033','0702126','1301983','2100455','0701712','8100812','0702034'
,'8101386','0800948','0801231','1302101','0801374','0200877','1002065')


select * from gxbdbps.tdcta 
where tdbinentid = '1020' 
and tdctanro in ('9008946246')

update gxbdbps.tdcta set tdctatar='4569760000136816'
where tdbinentid = '1020' 
and tdctanro in ('9008946246')

select * from  libdebito.EMBNOVHSTD  
where crbine='456976'                
and crdocu in (
'2469886')
and crfege='20201007'

select * from  libdebito.embnov0d


SELECT * FROM GXBDBPS.TCODPP WHERE COCOMER IN('0702636','8101518','8600954','2300467','0702909','0702958','8102010','8601447','0702800','8101587','8601024','0703200','8102285','8601745','0703374','0703028'
,'0801426','0702753','1302268','8101713','8601150','0302262','8101521','8600957','0901679','1400618','8101850','8601287','0703203','8102056','8601493','0702617','8101833','8601270','0100166','8101062'
,'0702735','0702612','0703023','0901705','0702925','0702185','0801383','0703241','8102091','8601536','0702822','2600204','0701702','0702831','0703044','2100576','0702194','0703161','8102116','8601564'
,'0702340','2100456','0702956','8102053','8601490','0703380','8102242','8601698','0702488','0703431','8102342','8601805','0703400','8102271','8601730','0702354','4900080','0702116','0703544','8102504'
,'8601988','0703022','8101780','8601217','2100561','1002133','8102364','8601835','4900085','8102225','8601681','0701637','0703302','8102169','8601625','0701430','0703160','8102166','8601622','1100217'
,'0702357','8101702','8601139','0801437','0703198','8102251','8601707','0702407','0703357','8102391','8601868','5800063','1002067','8101648','8601085','0702965','8101942','8601379','0702544','1900353'
,'8100975','8600429','0703145','8101994','8601431','0702275','0702147','8101712','8601149','8101136','8600565','0701945','8101209','8600616','0702066','8100755','0801145','8600608','0901400','0702344'
,'6900269','8100797','0702632','8101636','8601073','0901566','0702125','0703122','8101967','8601404','0702676','8101789','8601226','0702416','8101511','8600947','0200903','8102498','8601982','0703153'
,'8102165','8601621','1900359','8101355','8600790','0200902','0703323','8102192','8601648','0702845','0702553','0703542','8102497','8601981','0302306','0703522','8102463','8601946','0703248','8102097'
,'8601542','0702269','0702893','8101747','8601184','0302168','0702949','8102279','8601738','0702550','0702917','8101746','8601183','0703201','7300044','0302178','0801338','6000407','2100579','0801153'
,'0801159','0801160','0801272','0700497','0701717','0701507','0700990','8600126','8100508','0801288','0801289','0301971','0702069','0702656','0703493','8102472','8601956','8102473','8601957','0800984'
,'0801000','0801179','0801180','0801181','0801182','0801319','5500024','8102513','8601997','0302204','0302011','0801130','6000368','0302046','0901677','0702082','8101469','8600906','0702487','0701632'
,'1400584','8100859','0302196','0703281','0702251','8101606','8601043')



select * from gxfindtA.TCLCSP where cpcfec='20201007';

delete gxfindtA.TCLCSP where cpcfec='20201007';


select * from GXFINDTA.TCLCPC where cpcfec='20201007';


delete GXFINDTA.TCLCPC where cpcfec='20201007';


UPDATE GXSEGDTA.TSGNUM SET SGNUMACT = 0, SGNUMUNT = 0, SGNUMPRG = 'PDSI001' WHERE SGNUMOBJ = 'TDSSPR';

select * from gxtrjdta.TDSPRC where PRCIDPROCE = 'PCON014';


o	UPDATE GXTRJDTA.TDSPrc SET PrcGenLog = 'N';

SELECT * FROM GXFINDTA.TCLTSB WHERE	TSBESTA = 'RE' AND TSBFEAC >= '2020-10-07 18:14:00' AND TSBFEAC <= '2020-10-07 18:37:00';


select * from  libdebito.EMBNOVHSTD  
where crbine='456976'                
and crdocu in (
'3484393', '7883095')



select * from gxweb.gxlofun order by siscodi


select * from mastercard.masctldta where mcrol='ADQ' AND MC032='019696 ' AND MC018='5651' AND MC038 IN ('379675','675490','675503')


select * from gxbdcon.gxlofun where siscodi='TC' and funnom='ipmdtatep' 821

select * from gxbdcon.gxlofun where siscodi='TC' and funnom='wwipmdtatep'

select * from gxbdcon.gxlofun where siscodi='TC' and funnom='wwipmdtate' 817


select * from gxbdcon.gxlofun where siscodi='TC' and funnom='wwipmdtatep'
select * from gxbdcon.gxlofun where siscodi='TC' and funnom='ipmdtateipmdtatepwc'

select * from GXFINDTA.tcltsb where TSBESTA = 'EN'

4654842 


select * from  libdebito.EMBNOVHSTD  
where crbine='456976'                
and crdocu in (
'4654842')




SELECT
CRENTI, CRSUCU, CRCLAT, CRBINE, CRTARJ, CRDECR, 
CRNROC, CRNCTA, CRNOMB, CRTDOC, CRDOCU, CRVENC, CRNEMP, 
CRDIRE, CRLOCA, CRTELE, CRLCRE, CRCODN, CRUSGE, 
CRHOGE, CRFEGE, CRRETO, 
CRUSEJ, CRHOEJ, CRFEEJ
FROM libdebito.TGEMBHAF 
where   crenti='002'
 and crbine='703002' and crfeej='20201013'
 and crcodn='1'
 and crhoej<'153320'
 
delete
libdebito.TGEMBHAF 
where   crenti='002'
 and crbine='703002' and crfeej='20201013'
 and crcodn='1'
 and crhoej<'153320'
 
 

select crdocu as CI, crnomb as NOMBRE, 
crtarj as TARJETA, crfeej 
as FECHA_EJECUCION, crcodn as COD_NOVEDAD 
from  libdebito.TGEMBHAF 
where   crenti='002'
and crbine='703002'
and crfeej='20200818'
and crcodn='2'

update yapi.temporal5 
set 
TARJETA=(SUBSTR(TARJETA, 1, 6) || 'XXXXXX' ||SUBSTR(TARJETA, 13, 4))

select * from  libdebito.EMBNOVHSTD  
where crbine='456976'                
and crdocu in (
'4505978', '4600070')

select * from  libdebito.EMBNOVHSTD  
where crbine='456976'                
and crdocu in (
'5040048')


select * from GXFINDTA.TCLTSB 
where TSBESTA = 'RE' and TSBCOME = '098'

select * from gxbdbps.tmtaraf 

update yapi.tmtaraf set 
MtNUMTA=
(SUBSTR(MtNUMTA,1,6) || 'XXXXXX' ||SUBSTR(MtNUMTA,13,4));


select * from gxbdbps.tdemis
select * from gxbdbps.drmaeaf where akenti in ('103', '113') and akaicd <>'90'

update gxbdbps.drmaeaf set akaicd='90'
where akenti in ('103', '113')



select * from  gxfindta.TCLCPP
where SERCODI in ('VTAMIN', 'PAGFAC')
and precodi in ('VTTA', 'PFTA')


select * from  libdebito.EMBNOVHSTD  
where crbine='456976'                
and crdocu in (
'2326684', '3832110')


2326684 Mirtha Graciela centurion
3832110 Arved Ivan Muller Galeano

select * from  libdebito.EMBNOVHSTD  
where crbine='456976'                
and crdocu in (
'3439872')

SELECT
CRENTI, CRSUCU, CRCLAT, CRBINE, CRTARJ, CRDECR, 
CRNROC, CRNCTA, CRNOMB, CRTDOC, cRDOCU, CRVENC, CRNEMP, 
CRDIRE, CRLOCA, CRTELE, CRLCRE, cRCODN, CRUSGE, 
CRHOGE, CRFEGE, CRRETO, 
CRUSEJ, CRHOEJ, CRFEEJ
FROM libdebito.TGEMBHAF
where crbine='703002'  and crfeej='20201022' and crenti='002'
and crhoej<'154514'   

delete libdebito.TGEMBHAF
where crbine='703002'  and crfeej='20201022' and crenti='002'
and crhoej<'154514'   



SELECT
*
FROM libdebito.TGEMBHAF
where crenti in ('107', '168', '319')  and crfeej='20201022' 
and crhoej<'154622'   

delete libdebito.TGEMBHAF
where crenti in ('107', '168', '319')  and crfeej='20201022' 
and crhoej<'154622'   




SELECT
CRENTI, CRSUCU, CRCLAT, CRBINE, CRTARJ, CRDECR, 
CRNROC, CRNCTA, CRNOMB, CRTDOC, cRDOCU, CRVENC, CRNEMP, 
CRDIRE, CRLOCA, CRTELE, CRLCRE, cRCODN, CRUSGE, 
CRHOGE, CRFEGE, CRRETO, 
CRUSEJ, CRHOEJ, CRFEEJ
FROM libdebito.TGEMBHAF
where crenti in ('999')  and crfeej='20201022' 

select * from GXSWTDTA.TSWTPSW    




select * from  libdebito.EMBNOVHSTD   where crenti ='020' and crfeej='20201023' ----


select * from  libdebito.EMBNOVHSTD  
where crbine='456976'                
and crdocu in (
'4168642')


select * from libdebito.drconbep where lfectr='20201027' 
and LECA62 LIKE '%J%' order by lhortr desc


select * from libdebito.drconbep where lfectr>'20201000' and lbinpr in ('488234', '456976')
and LBCODB='510' order by lfectr desc




-- compras emisor cod resp 05, rechaza de procard y directamemnte jpts y comsrv 05 transaccion procesor

update yapi.drconbephf 
set 
LNRTAR=(SUBSTR(LNRTAR,1,6) || '999999' ||SUBSTR(LNRTAR,13,4))




select * from  libdebito.EMBNOVHSTD  
where crbine='456976'                
and crdocu in (
'4179840', '1779992')

SELECT
CRENTI, CRSUCU, CRCLAT, CRBINE, CRTARJ, CRDECR, 
CRNROC, CRNCTA, CRNOMB, CRDOCU, CRVENC, CRNEMP, 
CRDIRE, CRLOCA, CRTELE, CRLCRE, CRCODN, CRUSGE, 
CRHOGE,  20201102 as CRFEGE, CRRETO, 
'' as CRUSEJ, 0 as CRHOEJ, 0 as CRFEEJ
FROM libdebito.TGEMBHAF
where  
crusej='U99ENRIQUE'
and crfeej='20201102'
and crenti='319'


select * from libdebito.embtrkhst where tkusej='U99ENRIQUE' and TKFEE2='20201102' and tkenti='307'


SELECT
*
FROM libdebito.TGEMBHAF
where  
crusej='U99ENRIQUE'
and crfeej='20201102'
and crenti='307'


SELECT
CRENTI, CRSUCU, CRCLAT, CRBINE, CRTARJ, CRDECR, 
CRNROC, CRNCTA, CRNOMB, CRDOCU, CRVENC, CRNEMP, 
CRDIRE, CRLOCA, CRTELE, CRLCRE, CRCODN, CRUSGE, 
CRHOGE,  20201102 as CRFEGE, CRRETO, 
'' as CRUSEJ, 0 as CRHOEJ, 0 as CRFEEJ
FROM libdebito.TGEMBHAF
where  
crusej='U99ENRIQUE'
and crfeej='20201102'
and crenti='307'

select * from  libdebito.EMBNOV0p


select * from  libdebito.EMBNOVHSTD  
where crbine='456976'                
and crdocu in (
'5591339')



5591339 


select aflcmin, aflcmax, aflicre, aflccuo from  gxbdbps.tafinaf  where enemiso='175'

select * from  libdebito.EMBNOVHSTD  
where crbine='456976'                
and crdocu in ('621670', '4644299', '5248479', '1310828', 
'5917685', '4879191', '4573287', '2961308', '3984802', 
'3827956', '663559', '6317463', '2335747', '1647156', 
'123686390', '6610406', '6591620', '5052698', 
'6998812', '2244600', '1450941', '1343407', 
'4499522', '5708829', '1303681', '3931951', '5394306', 
'4748788', '2171821', '4571042', '3234708', '5973418', 
'2496443', '6299061', '1908701', '2192705', '2361762', 
'3017479', '3784529', '4663993', '1616334', '5800171', 
'7499066', '4418712', '4296781', '5621783', '1041179', 
'4544030', '2177008', '5773572', '5770450', '6278000', 
'3174265')
and crfeej='20201104'

delete libdebito.EMBNOVHSTD  
where crbine='456976'                
and crdocu in ('621670', '4644299', '5248479', '1310828', 
'5917685', '4879191', '4573287', '2961308', '3984802', 
'3827956', '663559', '6317463', '2335747', '1647156', 
'123686390', '6610406', '6591620', '5052698', 
'6998812', '2244600', '1450941', '1343407', 
'4499522', '5708829', '1303681', '3931951', '5394306', 
'4748788', '2171821', '4571042', '3234708', '5973418', 
'2496443', '6299061', '1908701', '2192705', '2361762', 
'3017479', '3784529', '4663993', '1616334', '5800171', 
'7499066', '4418712', '4296781', '5621783', '1041179', 
'4544030', '2177008', '5773572', '5770450', '6278000', 
'3174265')
and crfeej='20201104'


select * from  libdebito.EMBNOVHSTD  
where crbine='456976'                
and crdocu in ('621670', '4644299', '5248479', '1310828', 
'5917685', '4879191', '4573287', '2961308', '3984802', 
'3827956', '663559', '6317463', '2335747', '1647156', 
'123686390', '6610406', '6591620', '5052698', 
'6998812', '2244600', '1450941', '1343407', 
'4499522', '5708829', '1303681', '3931951', '5394306', 
'4748788', '2171821', '4571042', '3234708', '5973418', 
'2496443', '6299061', '1908701', '2192705', '2361762', 
'3017479', '3784529', '4663993', '1616334', '5800171', 
'7499066', '4418712', '4296781', '5621783', '1041179', 
'4544030', '2177008', '5773572', '5770450', '6278000', 
'3174265')
and crfeej='20201105'


delete libdebito.EMBNOVHSTD  
where crbine='456976'                
and crdocu in ('621670', '4644299', '5248479', '1310828', 
'5917685', '4879191', '4573287', '2961308', '3984802', 
'3827956', '663559', '6317463', '2335747', '1647156', 
'123686390', '6610406', '6591620', '5052698', 
'6998812', '2244600', '1450941', '1343407', 
'4499522', '5708829', '1303681', '3931951', '5394306', 
'4748788', '2171821', '4571042', '3234708', '5973418', 
'2496443', '6299061', '1908701', '2192705', '2361762', 
'3017479', '3784529', '4663993', '1616334', '5800171', 
'7499066', '4418712', '4296781', '5621783', '1041179', 
'4544030', '2177008', '5773572', '5770450', '6278000', 
'3174265')
and crfeej='20201103'




select * from  libdebito.EMBNOVHSTD  
where crbine='456976'                

and crfeej='20201104'

and crdocu not in ('621670', '4644299', '5248479', '1310828', 
'5917685', '4879191', '4573287', '2961308', '3984802', 
'3827956', '663559', '6317463', '2335747', '1647156', 
'123686390', '6610406', '6591620', '5052698', 
'6998812', '2244600', '1450941', '1343407', 
'4499522', '5708829', '1303681', '3931951', '5394306', 
'4748788', '2171821', '4571042', '3234708', '5973418', 
'2496443', '6299061', '1908701', '2192705', '2361762', 
'3017479', '3784529', '4663993', '1616334', '5800171', 
'7499066', '4418712', '4296781', '5621783', '1041179', 
'4544030', '2177008', '5773572', '5770450', '6278000', 
'3174265')
and crhoej<'172144'


delete  libdebito.EMBNOVHSTD  
where crbine='456976'                

and crfeej='20201104'

and crdocu not in ('621670', '4644299', '5248479', '1310828', 
'5917685', '4879191', '4573287', '2961308', '3984802', 
'3827956', '663559', '6317463', '2335747', '1647156', 
'123686390', '6610406', '6591620', '5052698', 
'6998812', '2244600', '1450941', '1343407', 
'4499522', '5708829', '1303681', '3931951', '5394306', 
'4748788', '2171821', '4571042', '3234708', '5973418', 
'2496443', '6299061', '1908701', '2192705', '2361762', 
'3017479', '3784529', '4663993', '1616334', '5800171', 
'7499066', '4418712', '4296781', '5621783', '1041179', 
'4544030', '2177008', '5773572', '5770450', '6278000', 
'3174265')
and crhoej<'172144'



select * from  libdebito.EMBNOVHSTD  
where crbine='456976'                

and crfeej='20201105'

and crdocu not in ('621670', '4644299', '5248479', '1310828', 
'5917685', '4879191', '4573287', '2961308', '3984802', 
'3827956', '663559', '6317463', '2335747', '1647156', 
'123686390', '6610406', '6591620', '5052698', 
'6998812', '2244600', '1450941', '1343407', 
'4499522', '5708829', '1303681', '3931951', '5394306', 
'4748788', '2171821', '4571042', '3234708', '5973418', 
'2496443', '6299061', '1908701', '2192705', '2361762', 
'3017479', '3784529', '4663993', '1616334', '5800171', 
'7499066', '4418712', '4296781', '5621783', '1041179', 
'4544030', '2177008', '5773572', '5770450', '6278000', 
'3174265')



delete libdebito.EMBNOVHSTD  
where crbine='456976'                

and crfeej='20201105'

and crdocu not in ('621670', '4644299', '5248479', '1310828', 
'5917685', '4879191', '4573287', '2961308', '3984802', 
'3827956', '663559', '6317463', '2335747', '1647156', 
'123686390', '6610406', '6591620', '5052698', 
'6998812', '2244600', '1450941', '1343407', 
'4499522', '5708829', '1303681', '3931951', '5394306', 
'4748788', '2171821', '4571042', '3234708', '5973418', 
'2496443', '6299061', '1908701', '2192705', '2361762', 
'3017479', '3784529', '4663993', '1616334', '5800171', 
'7499066', '4418712', '4296781', '5621783', '1041179', 
'4544030', '2177008', '5773572', '5770450', '6278000', 
'3174265')





select * from  libdebito.EMBNOVHSTD  
where crbine='456976'                
and crdocu in (
'4933669', 
'5625542', 
'5460606', 
'5327504', 
'787495')
and crhoej<'141333'

delete  libdebito.EMBNOVHSTD  
where crbine='456976'                
and crdocu in (
'4933669', 
'5625542', 
'5460606', 
'5327504', 
'787495')
and crhoej<'141333'


4461284 4882-3400-0000-7010-000 CINDY NU#EZ

select * from  libdebito.EMBNOVHSTD  
where crbine='488234'                
and crdocu in (
'4461284')
and crfeej='20201103'

select * from  gxopera.opmcatm  where cafecha >'20201000'

delete gxopera.opmcatm  where cafecha >'20201000'

delete libdebito.EMBNOVHSTD  
where crbine='488234'                
and crdocu in (
'4461284')
and crfeej='20201103'



select * from  libdebito.EMBNOVHSTD  
where crbine='488234'                
and crdocu in (
'2384554', 
'4189527', 
'5007074', 
'5544421')
and crfeej='20201102'

delete libdebito.EMBNOVHSTD  
where crbine='488234'                
and crdocu in (
'2384554', 
'4189527', 
'5007074', 
'5544421')
and crfeej='20201102'

select * from  libdebito.EMBNOVHSTD  
where crbine='456976'                
and crdocu in (
'4194014', 
'4011856', 
'6693091', 
'1157751')
and crfeej='20201106'

delete libdebito.EMBNOVHSTD  
where crbine='456976'                
and crdocu in (
'4194014', 
'4011856', 
'6693091', 
'1157751')
and crfeej='20201106'


select CRENTI, CRSUCU, CRCLAT, CRBINE, tdctatar as crtarj, CRDECR, 
decimal(substr(CRTARJ,7,10)) as CRNROC, 
CRNCTA, CRNOMB, CRDOCU, CRVENC, CRNEMP, 
CRDIRE, CRLOCA, CRTELE, CRLCRE, CRCODN, CRUSGE, 
CRHOGE, 20201109 as CRFEGE, CRRETO, CRUSEJ, CRHOEJ,  0 as CRFEEJ
from LIBDEBITO.TGEMBHAF a 
inner join gxbdbps.tdcta on tdctanro=decimal(substr(CRTARJ,7,10)) 
where   a.crbine in ('703020')
and a.crfege='20201109'



select * from  libdebito.EMBNOVHSTD  
where crbine='456976'                
and crdocu in (
'6221272')


select * from  gxopera.OPAGO3tc


UPDATE GXBDBPS.TMCTAAF   SET MCADEPE = 0
WHERE MCNUMCT = 319030030674;


update GXBDBPS.tmctaaf
	set mcdiscu = mclimcu - (mccuope + mcadepe + mcapcuc + mcapcua)
	WHERE MCNUMCT = 319030030674;
	


update GXBDBPS.tmctaaf
	set mcdisco=mclimco - (mcsafac + mcsfnve + mcsalfi + mcapcoc + mcapcoa + mccuopc + mccuopa)
	WHERE MCNUMCT = 319030030674;

select * from  libdebito.EMBNOVHSTD  
where crbine='456976'                
and crdocu in (
'8716547') and crtarj='4569760000165534'



select * from  libdebito.EMBNOVHSTD  
where crbine='456976' 
and crdocu in('VE12162504')               
and crfege='20201110'



select *
from LIBDEBITO.TGEMBHAF 

where   crbine in ('703040')
and crfege='20201109'



select * from  libdebito.EMBNOVHSTD  
where crbine='456976' 
and crdocu in('4342464', 
'6067935', 
'3790412', 
'5339273', 
'7145780')         
and CRFEEJ='20201112'

delete  libdebito.EMBNOVHSTD  
where crbine='456976' 
and crdocu in('4342464', 
'6067935', 
'3790412', 
'5339273', 
'7145780')         
and CRFEEJ='20201112'


SELECT * FROM libdebito.TGEMBHAF
where CRCLAT='VSA'
and crdocu in('4342464', 
'6067935', 
'3790412', 
'5339273', 
'7145780')        
and crenti='020'
and CRFEEJ='20201112'

delete libdebito.TGEMBHAF
where CRCLAT='VSA'
and crdocu in('4342464', 
'6067935', 
'3790412', 
'5339273', 
'7145780')        
and crenti='020'
and CRFEEJ='20201112'


select * from  libdebito.EMBNOVHSTD  
where crbine='230671' 
and crdocu in('3601351')  

      
SELECT * FROM libdebito.TGEMBHAF
where --CRCLAT='VSA'
--and 
crdocu in('3601351')
and crbine='230671'
and crenti='020'
and CRFEEJ='20201112'

select * from libdebito.TBINPROC where pbin='542927'

select * from  libdebito.EMBNOVHSTD  
where crbine='488234'                
and crdocu in (
'592902', 
'1275875', 
'2631223', 
'4240854')
and crfeej in ('20201113', '20201116') 	

delete libdebito.EMBNOVHSTD  
where crbine='488234'                
and crdocu in (
'592902', 
'1275875', 
'2631223', 
'4240854')
and crfeej in ('20201113', '20201116') 	



SELECT * FROM libdebito.TGEMBHAF
where 
crdocu in('94829', '179603', 
'889025', '1072216', 
'1140838', '2704301')
and CRFEEJ='20201113'

delete libdebito.TGEMBHAF
where 
crdocu in('94829', '179603', 
'889025', '1072216', 
'1140838', '2704301')
and CRFEEJ='20201113'





SELECT * FROM libdebito.tgembnov
where 
crdocu in('94829', '179603', 
'889025', '1072216', 
'1140838', '2704301')
and CRFEEJ='20201113'



delete libdebito.TGEMBHAF
where crbine='488234'                
and crdocu in (
'592902', 
'1275875', 
'2631223', 
'4240854')
and crfeej in ('20201113', '20201116') 	


SELECT
CRENTI, CRSUCU, CRCLAT, CRBINE, CRTARJ, CRDECR, 
CRNROC, CRNCTA, CRNOMB, CRTDOC, CRDOCU, CRVENC, CRNEMP, 
CRDIRE, CRLOCA, CRTELE, CRLCRE, CRCODN, CRUSGE, 
CRHOGE, CRFEGE, CRRETO, 
CRUSEJ, CRHOEJ, CRFEEJ
FROM libdebito.TGEMBHAF
where CRUSEJ='U99WALTER' AND        
CRFEEJ='20201120'
and             
CRENTI in (                        
'002')               
and CRCODN<>'2'
and crhoej<'150000'

delete libdebito.TGEMBHAF
where CRUSEJ='U99WALTER' AND        
CRFEEJ='20201120'
and             
CRENTI in (                        
'002')               
and CRCODN<>'2'
and crhoej<'150000'



select CRENTI, CRSUCU, CRCLAT, CRBINE, tdctatar as crtarj, CRDECR, 
decimal(substr(CRTARJ,7,10)) as CRNROC, 
CRNCTA, CRNOMB, CRDOCU, CRVENC, CRNEMP, 
CRDIRE, CRLOCA, CRTELE, CRLCRE, CRCODN, CRUSGE, 
CRHOGE,  20201120 CRFEGE, CRRETO, '' as CRUSEJ, CRHOEJ, 0 as CRFEEJ
from LIBDEBITO.TGEMBHAF a 
inner join gxbdbps.tdcta on tdctanro=decimal(substr(CRTARJ,7,10)) 
where    a.crfeej='20201120'
and a.crhoej<'150223'

delete LIBDEBITO.TGEMBHAF
where crfeej='20201120' and
crenti in('115', '165', '172')
and crhoej<'150223'



SELECT
CRENTI, CRSUCU, CRCLAT, 
CRBINE, CRTARJ, CRDECR, 
CRNROC, CRNCTA, CRNOMB, 
cRDOCU, CRVENC, CRNEMP, 
CRDIRE, CRLOCA, CRTELE, 
CRLCRE, CRCODN, CRUSGE, 
CRHOGE, 20201120 CRFEGE, CRRETO, 
'' as CRUSEJ, CRHOEJ, 0 as CRFEEJ
FROM libdebito.TGEMBHAF
where CRUSEJ='U99WALTER' AND                 
CRFEEJ='20201120' and                         
CRENTI in ('107', '153', '164', '168')
and crhoej<'160000'

delete libdebito.TGEMBHAF
where CRUSEJ='U99WALTER' AND                 
CRFEEJ='20201120' and                         
CRENTI in ('107', '153', '164', '168')
and crhoej<'160000'

select * from libdebito.embnov0d

delete libdebito.embnov0d


select * from  libdebito.EMBNOVHSTD  
where crbine='456976' 
and crdocu in('1905773')         


select * from  libdebito.EMBNOVHSTD  
where crbine='230729'                
and crdocu in (
'3989223')


SELECT
CRENTI, CRSUCU, CRCLAT, CRBINE, CRTARJ, CRDECR, 
CRNROC, CRNCTA, CRNOMB, CRDOCU, CRVENC, CRNEMP, 
CRDIRE, CRLOCA, CRTELE, CRLCRE, CRCODN, CRUSGE, 
CRHOGE, 20201130 as CRFEGE, CRRETO, 
'' as CRUSEJ, CRHOEJ, 0 CRFEEJ
FROM libdebito.TGEMBHAF
where   
CRFEEJ>='20201130'
and             
crdocu='3989223'               
and CRCODN<>'5'

delete libdebito.TGEMBHAF
where   
CRFEEJ>'20201130'
and             
crdocu='3989223'               
and CRCODN<>'5'



select * from GXTRJDTA.TENECX

UPDATE GXTRJDTA.TENECX
SET ECXHORADES = '08:30:00'
WHERE ECXCODENT = 9000
AND ECXIDCONEX = 'AS400CLEARING';


select * from  libdebito.EMBNOVHSTD  
where crbine='456976'                
and crdocu in (
'6358803')

and crfeej in ('20201201')


630.620 488234******1600 ELODIA MARTINEZ
941.742 488234******4685 DIONICIO CACERES


6358803 4569-7600-0000-9657-000 ALFREDO VELAZQUEZ
6358803 


select * from  libdebito.EMBNOVHSTD  
where crbine='456976'                
and crfeej='20201203'
and crhoej<'110000'


delete  libdebito.tgembhaf  
where crbine='456976'                
and crfeej='20201203'
and crhoej<'110000'

select * from  libdebito.EMBNOVHSTD  
where crbine='488234'                
and crdocu in (
'630620', '941742')



select * from  libdebito.EMBNOVHSTD  
where crbine='456976'                
and crfeej='20201203'
and crdocu not in ('6358803')


select * from  libdebito.EMBNOVHSTD  
where crbine='456976'                
and crfeej='20201203'
and crdocu in ('779826', '5527196', '5052791', '2085170', '4652573', '7615944', '4310022',         
'5577717', '2448654', '5881643', '656311', '2066864', '2443180', '2471228',         
'5475049', '5483418',  '6028045',   '4952112',  '5548440',          
'4888977',   '5453048', 
'7322173',         
'6076235',         
'3424381',         
'7168193',         
'4862136',         
'2255233',         
'5834351',         
'2430149',         
'329847',         
'6658217',         
'7062418',         
'6797943',         
'2884362',         
'6090680',         
'3663543',         
'4549754',         
'918846',         
'6252683',         
'491526',         
'1483379',         
'4332991',         
'5126109',         
'4079443',         
'4617327',         
'2047846',         
'1483379',         
'3558211',         
'4816711',         
'4826017',         
'4727146',         
'819872',         
'7527000',         
'4271446',         
'2196252',         
'625618',         
'2264069',         
'5550433',         
'7601527',         
'1305415',         
'7105315',         
'650185 ',         
'1380999',         
'5745755',         
'6916167',         
'4328182',         
'6057638',         
'5371572',         
'3441516',         
'3778992',         
'4893941',         
'5705517',         
'4906631',         
'4873396',         
'3433352',         
'4990552',         
'3933226',         
'1696768',         
'1390704',         
'2680727',         
'837015 ',         
'3882737',         
'1758811',         
'738525 ',         
'7398827',         
'3504766',         
'2046148',         
'2044958',         
'1071478',         
'2264651',         
'6200914',         
'5408253',         
'501426',         
'5576745',         
'6079727',         
'4784565',         
'2942420',         
'4702887',         
'3544847',         
'5158572',         
'4775319',         
'2217966',         
'2202645',         
'4262943',         
'5488603',         
'7680214',         
'3682330',         
'6505257',         
'4874267',         
'6031875',         
'4340409',         
'4682526',         
'4783340',         
'5585802',         
'6807852',         
'6269577',         
'6550806',         
'4297051',         
'4439633',         
'6856568',         
'6108159',         
'4937785',         
'5389332',         
'4658564',         
'4455533',         
'4235817',         
'4675689',         
'3809446',         
'6343934',         
'5231267',         
'4227926',         
'3998123',         
'3988216',         
'7084751',         
'4873848',         
'6209889',         
'4842969',         
'3633174',         
'4615252',         
'3993177',         
'4297547',         
'4275488',         
'5921032',         
'5111415',         
'4723288',         
'4204020',         
'4173408',         
'920070',         
'6576390',         
'2323428',         
'696015',         
'3801612',         
'4942080',         
'5190966',         
'7692180',         
'5474898',         
'4456309',         
'4432399',         
'4525946',         
'5450740',         
'4843261',         
'6741570',         
'3734859',         
'4197453',         
'4108662',         
'6142075',         
'4822224',         
'6603946',         
'1434536',         
'3681623',         
'6891249',         
'6550514',         
'5127900',         
'6922554',         
'4012398',         
'5830998',         
'4957618',         
'7189249',         
'4175155',         
'4822749',         
'4997270',         
'3689922',         
'1399098',         
'4981134',         
'4182480',         
'4755937',         
'5684535',         
'4779235',         
'4877846',         
'855899')   


delete libdebito.EMBNOVHSTD  
where crbine='456976'                
and crfeej='20201203'
and crdocu in ('779826', '5527196', '5052791', '2085170', '4652573', '7615944', '4310022',         
'5577717', '2448654', '5881643', '656311', '2066864', '2443180', '2471228',         
'5475049', '5483418',  '6028045',   '4952112',  '5548440',          
'4888977',   '5453048', 
'7322173',         
'6076235',         
'3424381',         
'7168193',         
'4862136',         
'2255233',         
'5834351',         
'2430149',         
'329847',         
'6658217',         
'7062418',         
'6797943',         
'2884362',         
'6090680',         
'3663543',         
'4549754',         
'918846',         
'6252683',         
'491526',         
'1483379',         
'4332991',         
'5126109',         
'4079443',         
'4617327',         
'2047846',         
'1483379',         
'3558211',         
'4816711',         
'4826017',         
'4727146',         
'819872',         
'7527000',         
'4271446',         
'2196252',         
'625618',         
'2264069',         
'5550433',         
'7601527',         
'1305415',         
'7105315',         
'650185 ',         
'1380999',         
'5745755',         
'6916167',         
'4328182',         
'6057638',         
'5371572',         
'3441516',         
'3778992',         
'4893941',         
'5705517',         
'4906631',         
'4873396',         
'3433352',         
'4990552',         
'3933226',         
'1696768',         
'1390704',         
'2680727',         
'837015 ',         
'3882737',         
'1758811',         
'738525 ',         
'7398827',         
'3504766',         
'2046148',         
'2044958',         
'1071478',         
'2264651',         
'6200914',         
'5408253',         
'501426',         
'5576745',         
'6079727',         
'4784565',         
'2942420',         
'4702887',         
'3544847',         
'5158572',         
'4775319',         
'2217966',         
'2202645',         
'4262943',         
'5488603',         
'7680214',         
'3682330',         
'6505257',         
'4874267',         
'6031875',         
'4340409',         
'4682526',         
'4783340',         
'5585802',         
'6807852',         
'6269577',         
'6550806',         
'4297051',         
'4439633',         
'6856568',         
'6108159',         
'4937785',         
'5389332',         
'4658564',         
'4455533',         
'4235817',         
'4675689',         
'3809446',         
'6343934',         
'5231267',         
'4227926',         
'3998123',         
'3988216',         
'7084751',         
'4873848',         
'6209889',         
'4842969',         
'3633174',         
'4615252',         
'3993177',         
'4297547',         
'4275488',         
'5921032',         
'5111415',         
'4723288',         
'4204020',         
'4173408',         
'920070',         
'6576390',         
'2323428',         
'696015',         
'3801612',         
'4942080',         
'5190966',         
'7692180',         
'5474898',         
'4456309',         
'4432399',         
'4525946',         
'5450740',         
'4843261',         
'6741570',         
'3734859',         
'4197453',         
'4108662',         
'6142075',         
'4822224',         
'6603946',         
'1434536',         
'3681623',         
'6891249',         
'6550514',         
'5127900',         
'6922554',         
'4012398',         
'5830998',         
'4957618',         
'7189249',         
'4175155',         
'4822749',         
'4997270',         
'3689922',         
'1399098',         
'4981134',         
'4182480',         
'4755937',         
'5684535',         
'4779235',         
'4877846',         
'855899')      



delete libdebito.EMBNOVHSTD  
where crbine='456976'                
and crfeej='20201202'
and crdocu not in ('6358803')


select * from  libdebito.tgembhaf
where crbine='488234'                
and crdocu in (
'630620', '941742')
order by crfeej


select * from  libdebito.embnovhstd
where crbine='488234'                
and crdocu in (
'630620', '941742')
order by crfeej



select * from  libdebito.tgembhaf  
where crbine='456976'                
and crfeej='20201203'
and crdocu in ('779826', '5527196', '5052791', '2085170', '4652573', '7615944', '4310022',         
'5577717', '2448654', '5881643', '656311', '2066864', '2443180', '2471228',         
'5475049', '5483418',  '6028045',   '4952112',  '5548440',          
'4888977',   '5453048', 
'7322173',         
'6076235',         
'3424381',         
'7168193',         
'4862136',         
'2255233',         
'5834351',         
'2430149',         
'329847',         
'6658217',         
'7062418',         
'6797943',         
'2884362',         
'6090680',         
'3663543',         
'4549754',         
'918846',         
'6252683',         
'491526',         
'1483379',         
'4332991',         
'5126109',         
'4079443',         
'4617327',         
'2047846',         
'1483379',         
'3558211',         
'4816711',         
'4826017',         
'4727146',         
'819872',         
'7527000',         
'4271446',         
'2196252',         
'625618',         
'2264069',         
'5550433',         
'7601527',         
'1305415',         
'7105315',         
'650185 ',         
'1380999',         
'5745755',         
'6916167',         
'4328182',         
'6057638',         
'5371572',         
'3441516',         
'3778992',         
'4893941',         
'5705517',         
'4906631',         
'4873396',         
'3433352',         
'4990552',         
'3933226',         
'1696768',         
'1390704',         
'2680727',         
'837015 ',         
'3882737',         
'1758811',         
'738525 ',         
'7398827',         
'3504766',         
'2046148',         
'2044958',         
'1071478',         
'2264651',         
'6200914',         
'5408253',         
'501426',         
'5576745',         
'6079727',         
'4784565',         
'2942420',         
'4702887',         
'3544847',         
'5158572',         
'4775319',         
'2217966',         
'2202645',         
'4262943',         
'5488603',         
'7680214',         
'3682330',         
'6505257',         
'4874267',         
'6031875',         
'4340409',         
'4682526',         
'4783340',         
'5585802',         
'6807852',         
'6269577',         
'6550806',         
'4297051',         
'4439633',         
'6856568',         
'6108159',         
'4937785',         
'5389332',         
'4658564',         
'4455533',         
'4235817',         
'4675689',         
'3809446',         
'6343934',         
'5231267',         
'4227926',         
'3998123',         
'3988216',         
'7084751',         
'4873848',         
'6209889',         
'4842969',         
'3633174',         
'4615252',         
'3993177',         
'4297547',         
'4275488',         
'5921032',         
'5111415',         
'4723288',         
'4204020',         
'4173408',         
'920070',         
'6576390',         
'2323428',         
'696015',         
'3801612',         
'4942080',         
'5190966',         
'7692180',         
'5474898',         
'4456309',         
'4432399',         
'4525946',         
'5450740',         
'4843261',         
'6741570',         
'3734859',         
'4197453',         
'4108662',         
'6142075',         
'4822224',         
'6603946',         
'1434536',         
'3681623',         
'6891249',         
'6550514',         
'5127900',         
'6922554',         
'4012398',         
'5830998',         
'4957618',         
'7189249',         
'4175155',         
'4822749',         
'4997270',         
'3689922',         
'1399098',         
'4981134',         
'4182480',         
'4755937',         
'5684535',         
'4779235',         
'4877846',         
'855899')   



select * from  libdebito.tgembhaf  
where crbine='456976'                
and crfeej='20201203'
and crhoej<'110000'

delete libdebito.tgembhaf  
where crbine='456976'                
and crfeej='20201203'
and crhoej<'110000'

select * from libdebito.EMBNOVHSTD  
where crbine='456976'                
and crdocu in ('6200914')

select * from libdebito.EMBNOVHSTD  
where crbine='456976'                
and crdocu in ('6200914')

select * from libdebito.embnovhstd  
where crbine='456976'                
and crdocu in ('6200914')


select CRENTI, CRSUCU, CRCLAT, CRBINE, tdctatar as crtarj, CRDECR, 
decimal(substr(CRTARJ,7,10)) as CRNROC, 
CRNCTA, CRNOMB, CRDOCU, CRVENC, CRNEMP, 
CRDIRE, CRLOCA, CRTELE, CRLCRE, CRCODN, CRUSGE, 
CRHOGE,   20201203 as CRFEGE, CRRETO, '' as CRUSEJ, 
CRHOEJ, 20201203 as CRFEEJ
from LIBDEBITO.TGEMBHAF a 
inner join gxbdbps.tdcta on tdctanro=decimal(substr(CRTARJ,7,10)) 
where   a.crbine in ('703020')
and a.crdocu='748129'
and a.crfege='20201203'


select CRENTI, CRSUCU, CRCLAT, CRBINE, tdctatar as crtarj, CRDECR, 
decimal(substr(CRTARJ,7,10)) as CRNROC, 
CRNCTA, CRNOMB, CRDOCU, CRVENC, CRNEMP, 
CRDIRE, CRLOCA, CRTELE, CRLCRE, CRCODN, CRUSGE, 
CRHOGE, CRFEGE, CRRETO, CRUSEJ, 
CRHOEJ, CRFEEJ
from LIBDEBITO.TGEMBHAF a 
inner join gxbdbps.tdcta on tdctanro=decimal(substr(CRTARJ,7,10)) 
where   a.crbine in ('703020')
and a.crdocu='748129'
and a.crfege='20201203'


select *
from LIBDEBITO.TGEMBHAF 

where  crbine in ('703020')
and crdocu='748129'


select *
from LIBDEBITO.TGEMBHAF 

where  crbine in ('703020')
and crdocu='748129'

select CRENTI, CRSUCU, CRCLAT, CRBINE, tdctatar as crtarj, CRDECR, 
decimal(substr(CRTARJ, 7, 10)) as CRNROC, 
CRNCTA, CRNOMB, CRDOCU, CRVENC, CRNEMP, 
CRDIRE, CRLOCA, CRTELE, CRLCRE, CRCODN, CRUSGE, 
CRHOGE, 20201202 as CRFEGE, 
CRRETO, '' as CRUSEJ, CRHOEJ, 0 as CRFEEJ
from LIBDEBITO.TGEMBHAF a 
inner join gxbdbps.tdcta on tdctanro=decimal(substr(CRTARJ, 7, 10)) 
where   a.crenti in ('170')
and a.crfege='20201202'
and a.crhoej>'105223'


select *
from LIBDEBITO.embtrkvis where tkfee2>'20200000' order by tkfee2


select * from libdebito.embnovhstd  
where crbine='456976'                
and crfeej ='20201204'
and crusge='U99IVANA'


delete libdebito.tgembhaf  
where crbine='456976'                
and crfeej ='20201204'
and crusge='U99IVANA'



select * from libdebito.embtrkdeb  
where tkbine='456976'                
and tkenti ='020'
and tkusej='U99IVANA'
AND tkstat=''


select * from libdebito.embnovhstd  
where crbine='456976'                
and crdocu ='4908229'
and crusge='U99IVANA'
4.908.229



select * from libdebito.tgembhaf  
where crbine='456976'                
and crdocu in ('5578207', 
'4342561', 
'7353938', 
'4009055', 
'6229235', 
'4331160', 
'5640754', 
'3457509', 
'3926978', 
'2006082', 
'4513427', 
'4743729', 
'5256584', 
'4074102', 
'5387238') 


select * from libdebito.embnovhstd  
where crbine='456976'                
and crdocu ='3992228'
and crusge='U99IVANA'

3992228 



select * from libdebito.embnovhstd  
where crbine='456976'                
and crdocu in ('5115387', '4266946')


and crusge='U99IVANA'

          
          
select * from yapi.controlusu  

Select * from gxfindta.tcltsb where tsbcoco = '4400020'; --27 registros
Update gxfindta.tcltsb set tsbesta = 'AN', tsbmotivo = 'PAGADO VIA BNF 26/11/2020' where tsbcoco = '4400020';



select * from libdebito.embnovhstd  
where crbine='542927'                



SELECT
CRENTI, CRSUCU, CRCLAT, CRBINE, CRTARJ, CRDECR, 
CRNROC, CRNCTA, CRNOMB, CRDOCU, CRVENC, CRNEMP, 
CRDIRE, CRLOCA, CRTELE, CRLCRE, CRCODN, CRUSGE, 
CRHOGE, 20201209 as CRFEGE, CRRETO, 
'' as CRUSEJ, 0 as CRHOEJ, 0 as CRFEEJ
FROM libdebito.TGEMBHAF
where  
crdocu='2855792'
and crbine='530399'
and crfeej='20201209'


select * from libdebito.embnovhstd  
where crbine='456976'  
and crfeej='20201209'
and crhoej>'90046'
and crnroc='6207514626'

select * from libdebito.embnov0p

delete libdebito.embnov0p where crenti='107'


select * from libdebito.embnovhstd  
where crbine='456976'  
and crdocu in ('3631362', '4923395')


select * from libdebito.embnovhstd  
where crbine='456976'  
and crdocu in ('4923395')

Update gxfindta.tcltsb set tsbesta = 'PE', tsbbacr = 1020, tsbctcr = '4021945312', tsbtpcr = 'CA', tsbdene = 'CASA DE LA OFERTAS SUC 2', tsbidtpdoc = 'RUC', tsbnrodoc = '80089419-7', tsbdoccom = '80089419-7'
where tsbidop = 292433;


select * from libdebito.embnov0d
where crenti='174' 

 select * from libdebito.tgembhaf
where crnomb like '%LIZA C.%' 


and crdocu in ('2349978', '4351075')


 select * from libdebito.tgembhaf
 where crenti='174'
 and crtarj='6274311570530000'
 
Update gxfindta.tcltsb set tsbesta = 'PE', tsbmotivo = 'PARA REPROCESO, CTA SIN SALDO' where TSBFEGE>= '2020-12-15 18:55:00' and TSBESTA <>'AC' and TSBCOME='014'


select * from gxbdbps.tmtaraf where enemiso='021' and MTSTATS='1' and mtreten<>'N'

update gxbdbps.tmtaraf set mtreten='N' where enemiso='021' and MTSTATS='1' and mtreten<>'N'

select * from gxbdbps.tmtaraf where enemiso='021' and MTSTATS='1' and mtreten='E'

select * from gxbdbps.tmctaaf where mcemiso='021'
and mcnumct='20120500013'

select * from cierrelib.tcieraf where enemiso='021'

--



