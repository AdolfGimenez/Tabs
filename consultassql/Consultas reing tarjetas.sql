/*reingenieria tarjeta */
SELECT * FROM GXTRJDTA.TCAAEM WHERE CrtFHCorte = '2020-04-26 17:36:20' AND CRTSECUE = 1
--select * from gxtrjdta.tcatnp where tnpnrotrj='70302001250770167'
--archivo temporal para embozado txt
SELECT * FROM GXTRJDTA.TCAaet
/*tabla de plasticos*/
 
/*tabla de lotes*/
select * from gxtrjdta.tstlot

select * from gxtrjdta.tstagr
UPDATE GXTRJDTA.TCACrt SET CRTESTADO = 'C', CRTFHFIN = '2020-04-21 16:50:57' 
WHERE CRTFHCORTE = '2020-04-21-16.48.50.000000' AND CRTSECUE = 1;
UPDATE GXTRJDTA.TCASEC SET SECESTADO = 'C'
 WHERE CRTFHCORTE = '2020-04-21-16.48.50.000000' AND CRTSECUE = 1;


verificar corte 
select * from gxtrjdta.tcadec  order by crtfhcorte desc
select * from gxtrjdta.tcadec where CRTFHCORTE = '2021-06-21 17:27:31' and   
select decnompla, decnrotrj, substr(decnrotrj,13,16) ,count(*) cant from gxtrjdta.tcadec where CRTFHCORTE = '2021-06-21 17:27:31'
 and substr(decnrotrj,13,16) in (
'0558',
'1671',
'6176' 
)
AND DECTPGEN = 'E'
AND PRCIDPROCE IN ('PABM005', 'PABM010', 'PABM014')
group by decnompla, decnrotrj, substr(decnrotrj,13,16)



SELECT * FROM GXTRJDTA.TTCTRJ
SELECT COUNT(*), DECMOERROR FROM GXTRJDTA.TCADEC WHERE CRTFHCORTE ='2020-04-27 21:05:55' and deccodent='1002' and DECTPGEN='P' and crtsecue='1'
group by DECMOERROR


SELECT * FROM GXTRJDTA.TCASEC where crtfhcorte='2021-06-12 15:26:56' order by CRTFHCORTE, crtsecue asc
/*cabecera*/
SELECT * FROM GXTRJDTA.TCACRT order by CRTFHCORTE desc
/*detalle*/
SELECT * FROM GXTRJDTA.TCASEC order by CRTFHCORTE desc
/*detalle de registros procesados*/
select * from GXTRJDTA.TCADEC  where decnrotrj='6274310210000468' 
select * from gxsegdta.tsgusr where sgusrid in ('WALEDUSR','CONTIWSUSR','RIOWSUSR')

decnomarch='DHA163DIN7DEBL001' 70302001263561967

select * from GXTRJDTA.TCADEC where crtfhcorte='2021-06-12 15:26:56' and prcidproce in ('PABM005 ','PABM010')
--and decnrotrj='4569760000081699 '
order by CRTFHCORTE, crtsecue desc  --

/*datos de conexion*/
select * from gxtrjdta.tenecx where ; --+U5nLu4uk5FitY/TRvJdbA==
select * from gxtrjdta.TDSDPS where DPSAgrup in ('DESEMBOZMAGDIRENLAC','CLAEMBOZADODIRENLACE','UBIEMBOZADODIRENLACE','DESEMBOZADODIRENLACE')
select * from gxtrjdta.TDSDPS where DPSAgrup = 'CLAEMBOZADODIRENLACE'
select * from GXTRJDTA
SELECT * FROM GXTRJDTA.TDSPWS WHERE PWSIDWEBS = 'PDSI012' AND PWSUSUHAB ='WALEDUSR';

SELECT * FROM GXTRJDTA.TDSPWS WHERE PWSPROGRAM = 'PDSI012' AND PWSUSUHAB ='WALEDUSR';
SELECT * FROM GXTRJDTA.TDSdws where pwsidwebs='ACTDEBWS'

INSERT INTO GXTRJDTA.TDSDWS (PWSIDWEBS,DWSSECUE,DWSIPSERWS,ENTCODENT,DWSCLIENTE,DWSSUCUR,PWSUSUHAB,DWSUSULTUP,DWSFHULTUP) 
VALUES
  ('ACTDEBWS  ',8,'192.168.168.94 ',1040,0,1,'RIOWSUSR  ','U99FSANTAC','2021-12-21 16:16:47.420');


UPDATE GXTRJDTA.TTCTRJ SET TRJFECEMB = '00000000', TRJFECREC = '00000000', TRJFECPIN = '00000000',
 TRJPROCABM = 'S', TRJFHULTUP = '2020-04-21-16.48.50.000000' WHERE TRJNROTRJ in('70302001076280722', '5303990000000104');        

SELECT count(*),(eminrotrjd) FROM GXTRJDTA.TTDEmi where 
group by eminrotrjd 
 WHERE EMINROTRJD in('2306710000013170', '2306710000014170');
select * from GXTRJDTA.TTDEmi where eminrotrjd='5476970000000170' and emifecemi='20200602' and substr(EMINROTRJD,1,6) in('703020')
select * from gxtrjdta.tdgafi where entcodent='1040'
select * from gxtrjdta.tdgent where entcodent='5038'
******************************************************************************************************************
******************************************************************************************************************
TARJETA DE DEBITO - para re-procesar
******************************************************************************************************************
******************************************************************************************************************
UPDATE GXTRJDTA.TTDEmi set EMIFECEMB = '00000000', EMIFECREC = '00000000', EMIFECPIN = '00000000',
emivencida='N', EMIPROCABM = 'S'  ,emifhultup='2020-10-22 17:10:00'
WHERE emifecemi='20201022'
-- and  EMIPROCABM = 'S' --emifecemi='20201008' and eminrotrjd='4569760000081699'--substr(EMINROTRJD,1,6) in('456976') 
******************************************************************************************************************
TARJETA DE DEBITO - para seleccionar reproceso
******************************************************************************************************************
select * from GXTRJDTA.TTDEmi where  EMIPROCABM = 'S'
and EMIFECEMB = '00000000' and  EMIFECREC = '00000000' and  EMIFECPIN = '00000000' and cdbcodent='1020' 
and cdbidcta in ('101394852','6622207613')
select * from gxtrjdta.ttdcad where cdbidcta in ('101394852','6622207613')
--and emivencida='N' and emifecemi='20210614'
select * from gxbdbps.tdcta where tdctanro in ('101394852','6622207613')
1020	101394852	456976	2	1	4569760000141352   	A	2	600	0
1020	6622207613	456976	1	66	4569760000069389   	A	9	600	0

select * from libdebito.embnov0p
select * from gxbdbps.tdctaad  where tdctanro in ('101394852','6622207613')
1020	456976	6622207613	0	CIP	2351389        	AURELIO NUNEZ G.          	U99IVANA  	20200813	1020006222076136   
1020	456976	101394852	0	CIP	3190463        	CINTHIA BARRETO C.        	U99IVANA  	20201012	1020001013948528   



select cdbidcta from GXTRJDTA.TTDEmi where 
cdbidcta in (Select cdbidcta from gxtrjdta.ttdcad)
and  EMIPROCABM = 'S'
and EMIFECEMB = '00000000' and  EMIFECREC = '00000000' and  EMIFECPIN = '00000000' and cdbcodent='1020'


select * from 
******************************************************************************************************************
TARJETA DE CREDITO  - para re-procesar
******************************************************************************************************************
SELECT * FROM GXTRJDTA.TTCTRJ WHERE TRJFECEMI='20220617' and trjcodent='4005'
and TRJFECEMB = '20201014' and  TRJFECREC = '00000000' and  TRJFECPIN='00000000' AND TRJVENCIDA='N' and  TRJPROCABM = 'S'


emifecemi='20201014'   eminrotrjd='4569760000081699' and  and substr(EMINROTRJD,1,6) in('456976')

******************************************************************************************************************
SELECT * FROM gxbdbps.TDEMISNOV WHERE TDESTNOV = 0 AND TDFECHPROC = '00000000' and tdbinentid='1040'
select auxtbl,auxclav,count(*)
from gxtrjdta.tcoaux where auxtbl='TDEMIS' and auxest='N'
group by auxtbl,auxclav

select count(*) from GXTRJDTA.TTDEmi 40882 => 41080=> 41079
 
select * from GXTRJDTA.TTDEmi where  EMIFHULTUP = '2020-05-22 18:12:15' 
emifecemi='20201016' EMIPROCABM = 'S' AND EMIMOTINAC='A' emifecemi='20201001'
  select substr(eminrotrjd,1,6)bin , count(*) cant,emifecemi from GXTRJDTA.TTDEmi where emifecemi='20200618' and  EMIPROCABM = 'S' AND EMIMOTINAC='A'
  group by substr(eminrotrjd,1,6) ,emifecemi
******************************************************************************************************************
******************************************************************************************************************

SELECT * FROM GXTRJDTA.TCADEC t WHERE CRTFHCORTE = '2021-06-16 22:16:00';
SELECT * FROM GXTRJDTA.TCADEC t WHERE decnrotrj='4569760000008215'
select * from libdebito.embnov0dh

--tarjetas de debito
select * from GXTRJDTA.TTDEmi where cdbidcta=2923624525
 substr(eminrotrjd,1,6)='456976'emifecemi='20201008'
where TRJFECEMB = '00000000' and  TRJFECREC = '00000000' and  TRJFECPIN = '00000000' and  TRJPROCABM = 'S', TRJFHULTUP = '2020-04-25-10.04.00.000000'

select * from GXTRJDTA.TTCTRJ -- tarjetas de credito

SELECT * FROM GXSEGDTA.tsgusr where sgusrcod in ('2942','2011')
SELECT * FROM GXSEGDTA.TSGUSR 
SELECT * FROM gxsegdta.TSGARU where sgusrcod in ('2942'),'2011') 203,
INSERT INTO GXSEGDTA.TSGARU (SGROLCOD,SGSISCOD,SGUSRCOD,SGARUEXP,SGARUUSMO,SGARUFCHMO) 
VALUES
  (203,21,2011,'N','          ','0001-01-01 00:00:00.000');

SELECT * FROM GXSEGDTA.TSGUSR t WHERE SGUSRCOD = 2942
SELECT * FROM gxsegdta.TSGARU WHERE sgusrcod = 2942
SELECT * FROM GXSEGDTA.TSGROLDT where sgrolcod = 190



SELECT * FROM GXSEGDTA.TSGROLDT where sgrolcod = 98
SELECT T4.SGSISDESC, T.SGROLCOD,T.SGROLDESC, T2.SGFUNDES, T2.SGFUNOBJ FROM GXSEGDTA.TSGROL t, GXSEGDTA.TSGFUN t2, GXSEGDTA.TSGROLDT t3, GXSEGDTA.TSGSIS t4
WHERE T3.SGFUNCOD = T2.SGFUNCOD AND T3.SGROLCOD = T.SGROLCOD AND T4.SGSISCOD = T.SGSISCOD AND T4.SGSISCOD = 21 AND T.SGROLCOD NOT IN (190, 191);




select * from     GXSEGDTA.TSGFUN where SGFUNCOD='2514'


INSERT INTO GXSEGDTA.TSGFUN
(SGFUNCOD, SGSISCOD, SGFUNDES, SGFUNOBJ, SGFUNPAD, SGFUNORD, SGFUNVIS, SGFUNFILT, SGFUNTOBJ, SGFUNUSMO, SGFUNFCHMO, SGFUNCPAD, SGFUNURLOB, SGFUNTIPO)
VALUES(2514, 21, 'UPDATE PANTALLA DE TRANSMISION                    ', 'TCLTSBWWUPD         ', 'N', 0, 'N', 'N', 'W', 'U99OCAMPOS', '2020-07-29 21:32:38.000', 0, 'http://localhost:8080/accesobepsa/servlet/seguridad.', 'I');
INSERT INTO GXSEGDTA.TSGROLDT
(SGROLCOD, SGSISCOD, SGFUNCOD, SGRDTPDIS, SGRDTPUPD, SGRDTPINS, SGRDTPDEL)
VALUES(190, 21, 2514, 'S', 'S', 'S', 'S');
INSERT INTO GXSEGDTA.TSGFUN
(SGFUNCOD, SGSISCOD, SGFUNDES, SGFUNOBJ, SGFUNPAD, SGFUNORD, SGFUNVIS, SGFUNFILT, SGFUNTOBJ, SGFUNUSMO, SGFUNFCHMO, SGFUNCPAD, SGFUNURLOB, SGFUNTIPO)
VALUES(2436, 21, 'BOTON UPDATE DE TEMPORAL                          ', 'TCLTPCWWUPD         ', 'N', 0, 'N', 'S', 'W', 'U99IRALA  ', '2020-07-22 22:09:04.000', 0, 'http://localhost:8080/accesobepsa/servlet/seguridad.', 'I');
INSERT INTO GXSEGDTA.TSGROLDT
(SGROLCOD, SGSISCOD, SGFUNCOD, SGRDTPDIS, SGRDTPUPD, SGRDTPINS, SGRDTPDEL)
VALUES(190, 21, 2436, 'S', 'S', 'S', 'S');
********************************************************************************************************
select * from gxtrjdta.t
INSERT INTO GXTRJDTA.TCOENC (ENCENTACT,ENCENTANT,ENCUSULTUP,ENCFHULTUP,ENCENTROL) VALUES (7004,'571','MIGRACION ','2020-08-05-12.16.00.000000',700401);
INSERT INTO GXTRJDTA.TCOENC (ENCENTACT,ENCENTANT,ENCUSULTUP,ENCFHULTUP,ENCENTROL) VALUES (7004,'571','MIGRACION ','2020-08-05-12.16.00.000000',700402);
INSERT INTO GXTRJDTA.TCOENC (ENCENTACT,ENCENTANT,ENCUSULTUP,ENCFHULTUP,ENCENTROL) VALUES (7004,'571','MIGRACION ','2020-08-05-12.16.00.000000',700403);
INSERT INTO GXTRJDTA.TCOENC (ENCENTACT,ENCENTANT,ENCUSULTUP,ENCFHULTUP,ENCENTROL) VALUES (7004,'571','MIGRACION ','2020-08-05-12.16.00.000000',700404);
INSERT INTO GXTRJDTA.TCOENC (ENCENTACT,ENCENTANT,ENCUSULTUP,ENCFHULTUP,ENCENTROL) VALUES (7007,'091','MIGRACION ','2020-08-05-12.16.00.000000',0);

UPDATE GXTRJDTA.TCOENC SET ENCENTACT = 7001 WHERE ENCENTACT = 9000 AND ENCENTANT = 582;

UPDATE GXTRJDTA.TCOENC SET ENCENTACT = 7001 WHERE ENCENTACT = 9000 AND ENCENTANT = 583;

INSERT INTO GXTRJDTA.TDGENT (ENTCODENT,ENTNMENTID,ENTNCENTID,ENTTPENTID,ENTESTADO,ENTDURACTC,ENTDURACTD,ENTFACTURA,ENTCARTERA,ENTESTINTC,ENTESTINTD,ENTCNTURGE,ENTCODCOM,ENTGENAUTC,ENTGENAUTD,ENTGENCTA,ENTGENPINC,ENTGENPIND,ENTIMPUE,ENTACCIONI,ENTUSULTUP,ENTFHULTUP,ENTCONCAMV,ENTPRECTA,ENTDOCORDC,ENTDOCORDD,ENTULTNCTA,ENTTIPOCIE,ENTCODSWFT) VALUES (
7007,'FHJ S.A.','FHJ S.A.','EMP','A',48,48,'S','N','I','I',15,'4500153','S','S','S','B','B','N','N','MIGRACION ','2020-03-26 15:18:20.001','N',7007,'S','S',0,'  ','        ');


select * from gxtrjdta.TDSDPS where pasidparsi='ACTUALIZACIONKBTRJ'
select * from gxtrjdta.TDSPrc
select * from gxtrjdta.TDSSPR where date(sprfhini)='2020-08-06' and prcidproce='PCON014'
select auxtbl,count(*) from gxtrjdta.tcoaux where auxest='N'
group by auxtbl


select * from gxbdbps.tmtaraf where mtnumta='6274313320013744'
select * from gxtrjdta.tcoenc where encentant='332'

select * from gxtrjdta.tcoaux where auxest='N'
select 

select auxtbl,count(*) from gxtrjdta.tcoaux where auxest='N'
group by auxtbl

select * from GXFINDTA.TCLFEC
UPDATE GXFINDTA.TCLFEC SET FECANT = '20200806', FECPRO = '20200807', FECSIG = '20200810' WHERE FECID IN ('001','003')


select * from gxtrjdta.tdgbin where binnrobin='457572'


SELECT * FROM gxbdbps.TDEMISNOV WHERE TDESTNOV = 0 AND TDFECHPROC = '00000000'

UPDATE GXTRJDTA.TDGBIN
SET BINCVV2='S'
WHERE BINIDTUTRJ = 'C' AND BINIDMARCA = 'DIN';





select * from gxtrjdta.ttdcdb where cdbidcta in ('101394852','6622207613')
select * from gxtrjdta.ttdcad
where cdbidcta in (
'6212871677',  
'6212871463',  
'6212871276',  
'6212871061',  
'1602100509',  
'1602100304',  
'4602100102',  
'4602099908',  
'4602099702',  
'4612870857',  
'4612870679',  
'4612870465',  
'4612870269',  
'4612870063',  
'4612869869',  
'4612869663',  
'4612869477',  
'4612869262',  
'4612869075',  
'4102099501',  
'4102099306',  
'4402099107',  
'4402098901',  
'4402098705',  
'4402098509',  
'4402098304',  
'4402098108',  
'4402097902',  
'4402097706',  
'4402097501',  
'3602097305',  
'3602097109',  
'9302096903',  
'102096708',   
'102096502',   
'102096307',   
'102096101',   
'121121477',   
'121121299',   
'121121075',   
'121120897',   
'121120691',   
'121120371',   
'2902094708',  
'2902094502',  
'2902094307',  
'2902094101',  
'2902093905',  
'2902093709',  
'2902093503',  
'2902093308',  
'5202093102',  
'5202092906',  
'5202092701',  
'5202092504',  
'5202092309',  
'5202092103',  
'5202091907',  
'5202091701',  
'5202091505',  
'5202091301',  
'702085304',   
'702085108',   
'702084902',   
'702084706',   
'5302084503',  
'6622207613' , 
'101394852')

select * from gxbdbps.terminal where tertid = '13756041'
select * from gxbdbps.coafmaf where afcodi='13756041'
13756041  	9500006	1701	80	          						20201119	U99BOBADI 	U99ENZOG  	00	1.00		20200513	600	00000000	      	                	                	               	                    



UPDATE GXTRJDTA.TTDEMI
SET EMITPPLA='B'
WHERE CDBIDCTA='126356196' AND CADADHERE=0 AND CDBCODENT=1020 AND EMINROEMI=1;



UPDATE GXTRJDTA.TDGBIN
SET BINCVV2='S'

select * from GXTRJDTA.TDGBIN
WHERE BINIDTUTRJ = 'C' AND BINIDMARCA = 'DIN';

SELECT * FROM GXTRJDTA.TDSDWS;

SELECT * FROM GXTRJDTA.TDSPWS;
SELECT * FROM GXTRJDTA.TDSDPS t WHERE PASIDPARSI = 'WSLIMHR';
delete from GXTRJDTA.TDSDPS where dpsagrup='WSJVTRJ002'



select * from libdebito.tgembhaf where crenti='020' and crclat='VSA' and crfege='20210615' and crusej='U99ENRIQUE'

INSERT INTO GXTRJDTA.TDSDWS (PWSIDWEBS,DWSSECUE,DWSIPSERWS,ENTCODENT,DWSCLIENTE,DWSSUCUR,PWSUSUHAB,DWSUSULTUP,DWSFHULTUP) 
VALUES
  ('ABMCREDWS ',3,'10.254.90.3',4005,0,1,'WALEDUSR  ','U99JOSEEN ','2021-06-11 14:21:22.928');


select * from GXTRJDTA.TDSDWS
select * from 




UPDATE GXTRJDTA.TDSTfs SET TFSCERROR = 0, TFSSERROR = 0, TFSPROCE = 0, TFSESTADO = 'N' WHERE SPRIDSEG = 4 AND TFSTPARCH = 'C';
UPDATE GXTRJDTA.TDSDTf SET DTFESTADOL = 'N' WHERE SPRIDSEG = 4 AND TFSTPARCH = 'C';
UPDATE GXTRJDTA.TDSTfs SET TFSCERROR = 0, TFSSERROR = 0, TFSPROCE = 0, TFSESTADO = 'P' WHERE SPRIDSEG = 1 AND TFSTPARCH = 'C';
UPDATE GXTRJDTA.TDSDTf SET DTFESTADOL = 'S' WHERE SPRIDSEG = 1 AND TFSTPARCH = 'C';


SELECT * FROM GXTRJDTA.TDSCAL WHERE CALFECHA = 'AAAAMMDD'



select * from gxbdbps.tdemis where tdbinentid in ('1020') and tdbinnro in ('456976') and   tdctanro='102026062'

SELECT A.SPRIDSEG , B.TFSESTADO,PRCIDPROCE FROM GXTRJDTA.TDSSPr A INNER JOIN GXTRJDTA.TDSTFS B ON A.SPRIDSEG = B.SPRIDSEG AND (TfsEstado ='C' or TfsEstado = 'N')
WHERE a.PRCIDPROCE IN ('ABMCREDWS')


UPDATE GXTRJDTA.TDSSPR SET SPRESTADO ='C' WHERE SPRIDSEG =57255


SELECT * FROM GXTRJDTA.TDSSPr WHERE PRCIDPROCE = 'ABMCREDWS' AND SPRUSUARIO ='WALEDUSR' ORDER BY SPRIDSEG DESC
