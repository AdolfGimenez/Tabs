**********************************************************************************************************
VALIDACIONES TRANSACCIONALES NEW CLEARING
**********************************************************************************************************
select * FROM GXbdbps.TCODPP
/*CALL PGM(GXfinPGM/PCLR029CL) PARM('021791777397   ' '20200804')*/
--tabla de movimientos temporal--
select * FROM  gxfindta.TCLtpc;
--delete  FROM  gxfindta.TCLtpc where tpcidtem='7'
select * FROM  gxfindta.TCLSCT
--tabla de movimientos--
select * FROM  gxfindta.TCLmov where movftrx='20200806' 
--delete from gxfindta.TCLmov where movidmov='3'
--tabla de movimientos detalle COMISIONES--
select * FROM  gxfindta.TCLmod
--tabla de movimientos acreditaciones llamado por el CALL PGM(GXfinPGM/PCLR028CL) PARM('20080403316219    ' '021791777397   ' '20200804')--
select * from gxopera.opliqui where
 opfecliq='20200806' and opcodbco='064' 
and substr(opcampoa,1,6)='703002'  and opnroref ='21992530963'
and opstatob='00' and OPMENSOB='OK'  

order by ophorliq asc
 in (
select tsbnref from gxfindta.TCLTSB where tsbbacr='1007')


select * from gxopera.opliqui
where opfecliq='20200806' and opcodbco='064'  and substr(opcampoa,1,6)='703002' and  opstatob='91' and opstatob='91'
update gxopera.opliqui set opstat='91', opstatob='91'
where opfecliq='20200806' and opcodbco='064'  and substr(opcampoa,1,6)='703002' and  opstatob='00' and opmensaj='OK'  and opnroref ='21992530963'
26.910.920.00
 opnroref='021992433261'
select * FROM  gxfindta.TCLTSB where  tsbcome='000'  and tsbidop>406  
--delete FROM  gxfindta.TCLTSB where tsbidop='11'
select * FROM  gxfindta.TCLTSB order by tsbidop desc  where tsbnref ='021992530963'
--delete from gxfindta.TCLTSB where tsbnref ='021791777599'

select * from gxfindta.tclfec
EMCODI	EMNOMB	EMNOCO	EMFEP1	EMFEP2	EMFEP3	EMFECH	EMHORA	EMUSER
000	Bepsa del Paraguay                      	Bepsa del Paraguay  	2020-08-06	2020-08-07	2020-08-10	5082020	185959	BEPSA     

select * from libdebito.empresa0p
select * from gxbdbps.comaeaf where cocomer='0302179'
MASTERCARD ADQUIRENCIA-PRUEBA
select * FROM  GXBDBPS.TSWAUT 
WHERE AUTTRXFCHf='20200807'  and autbinemi='703002'  --and autcodret='00' and autcodser='COMPRA'-- and autentrol='100201' and autbinemi='703002'    and autcodcomb='0302179' AND AUTRRNBEP='021791777397'
order by auttrxhori desc
**********************************************************************************************************
**********************************************************************************************************



/*
UPDATE GXFINDTA.TCLTSB
   SET TSBBACR = 1020,
       TSBCTCR = '0102184266',
       TSBCOCO = '0302179',
       TSBNRODOC = '80011012-9',
       TSBCODSWC = 'BCNAPYPA',
       TSBDOCCOM = '80011012-9'
WHERE TSBCOCO ='6000392' AND TSBNREF = '021791777394'
*/

select * from gxopera.opliqui where opnroref='021791777397'


021791777599

**********************************************************************************************************
DATOS DE CONEXIONES
**********************************************************************************************************
select  *FROM  GXTRJDTA.TDSPWS
select  *FROM  GXTRJDTA.TDSDWS
where pwsidwebs='TOKENCONWS'
pwsusutokn
INSERT INTO GXTRJDTA.TDSDWS (PWSIDWEBS,DWSSECUE,DWSIPSERWS,ENTCODENT,DWSCLIENTE,DWSSUCUR,PWSUSUHAB,DWSUSULTUP,DWSFHULTUP) 
VALUES
  ('RcpSipapWS',2,'10.254.90.2    ',9999,0,1,'CONTIWSUSR','CONTIUSR  ','2020-08-03 00:00:00.000');


select * FROM  gxtrjdta.tenecx 
SERVICIO DE PRODUCCION
servicios.bancontinental.com.py
SERVICIO DE DESARROLLO
api-dev.bancontinental.com.py
**********************************************************************************************************
**********************************************************************************************************
select * FROM  gxfindta.TCLcne
select * FROM  gxfindta.TCLSEB
select * FROM gxfindta.tcltpc
select * FROM gxfindta.tclmov
**********************************************************************************************************
**********************************************************************************************************

select * from gxopera.tclsec
select * from gxsegdta.tsgusr where sgusrcod in (2, 7, 11, 25, 27, 30, 34, 37, 42, 92, 2005, 2008, 2015)

delete from gxsegdta.tsgusr where sgusrcod in (1) 2, 7, 11, 25, 27, 30, 34, 37, 42, 92, 2005, 2008, 2015)


INSERT INTO GXSEGDTA.TSGUSR
(SGUSRCOD, SGUSRNOM, SGUSRID, SGUSREST, SGDTOCOD, SGARECOD, SGSECCOD, SGUSRMAIL, SGTUSCOD, SGUSRADM, SGGENCOD, SGGCOCOD, SGUSRFCHUA, SGUSRUSMO, SGUSRFCHMO, SGUSRDOC)
VALUES(2043, 'CONTIWSUSR                                        ', 'CONTIWSUSR', 'A', 1, 9, 0, 'conti@conti.com.py', 2, '          ', 38, 182, '00000000', 'U99OCAMPOS', '2020-06-05 10:08:43.000', '                    ');


INSERT INTO GXSEGDTA.TSGARU
(SGROLCOD, SGSISCOD, SGUSRCOD, SGARUEXP, SGARUUSMO, SGARUFCHMO)
VALUES(190, 21, 2043, 'N', '          ', '0001-01-01 00:00:00.000');
 
d













INSERT INTO GXFINDTA.TCLTSB
(
  TSBIDOP,  TSBTPOP,  TSBDEOP,  TSBBADE,  TSBCTDE,  TSBTPDE,  TSBBACR,
  TSBCTCR,  TSBTPCR,  TSBCOCO,  TSBDENE,  TSBNREF,  TSBIMPO,  TSBMONE,
  TSBESTA,  TSBCOME,  TSBDEME,  TSBUSUA,  TSBFEAC,  SERCODI,  PRECODI,
  TSBFEGE,  TSBIDTPDOC,  TSBNRODOC,  TSBMOTIVO,  TSBTPOACR,  TSBFECCON,
  TSBCONSN,  TSBMONSIG,  TSBCODSWD,  TSBCODSWC,  TSBDOCCOM
)
VALUES
(
  12,  '03',  'REVERSAS Y CONTRACARGOS',  1020,  '0102184061          ',
  'CC',  1020,  '0102184266          ',  'CA',  '0302179   ',
  'MASTERCARD ADQUIRENCIA-PRUEBA',  '021791777397   ',  966.00,  600,
  'PE',  '000',  'LISTO PARA ENVIO',  'USRENTIDAD',  '2020-08-04 11:21:55.378',
  'CONTRAC',  'COCA',  '2020-08-04 11:21:43.000',  'RUC',  '80011012-9     ',
  '                                        ',  'O',  '00000000',  'N',  'PYG ',
  'BCNAPYPA       ',  'BCNAPYPA       ',  '80011012-9     ');
 
INSERT INTO GXFINDTA.TCLTSB
(
  TSBIDOP,  TSBTPOP,  TSBDEOP,  TSBBADE,  TSBCTDE,  TSBTPDE,  TSBBACR,
  TSBCTCR,  TSBTPCR,  TSBCOCO,  TSBDENE,  TSBNREF,  TSBIMPO,  TSBMONE,
  TSBESTA,  TSBCOME,  TSBDEME,  TSBUSUA,  TSBFEAC,  SERCODI,  PRECODI,
  TSBFEGE,  TSBIDTPDOC,  TSBNRODOC,  TSBMOTIVO,  TSBTPOACR,  TSBFECCON,
  TSBCONSN,  TSBMONSIG,  TSBCODSWD,  TSBCODSWC,  TSBDOCCOM
)
VALUES
(
  13,  '03',  'REVERSAS Y CONTRACARGOS',  1020,  '0102184061          ',
  'CC',  1020,  '0102184266          ',  'CA',  '0302179   ',
  'MASTERCARD ADQUIRENCIA-PRUEBA',  '021791777599   ',  966.00,  600,
  'PE',  '000',  'LISTO PARA ENVIO',  'USRENTIDAD',  '2020-08-04 11:21:55.378',
  'CONTRAC',  'COCA',  '2020-08-04 11:21:43.000',  'RUC',  '80011012-9     ',
  '                                        ',  'O',  '00000000',  'N',  'PYG ',
  'BCNAPYPA       ',  'BCNAPYPA       ',  '80011012-9     ');
