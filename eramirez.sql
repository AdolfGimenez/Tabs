--numerador de procesos
SELECT * FROM GXSEGDTA.TSGNUM WHERE SGNUMOBJ IN('TCLTPC');

--ANDE
-- TCLSER (servicio)
INSERT INTO GXFINDTA.TCLSER (SERCODI,SERDESC,SERFEAC,SERUSAC,SERESTA)
VALUES ('PAGSER    ','PAGO DE SERVICIOS                                                               ','2020-03-01 13:43:00.000','U99BERNAL ','A');
select * from gxfindta.tclser

-- TCLPRE (Prestaciones)
INSERT INTO GXFINDTA.TCLPRE (SERCODI,PRECODI,PREDESC,PREESTA,PRECOTRX,PREFEAC,PREUSAC,PREFPGO,PREMATRX,PREDISP,PRECLEA,PREMARC,PREPROD)
VALUES ('PAGSER    ','ANDE','PAGO FACTURAS -ANDE                                                             ','A','530002','2020-04-14 15:53:00.000','U99FLARA  ','TA','530002','ATM  ','TRA','   ','   ');
select * from gxfindta.tclpre;

-- TCLCPC (cabecera de procesos)
INSERT INTO GXFINDTA.TCLCPC (CPCFEC,PRCCOD,CPCPARM,CPCSECU,CPCEST,CPCUSUA,CPCHORA,CPCFEAC,CPCUSAC,CPCHOFI,CPCOBS,CPCDESC)
VALUES ('20210309','PCLR007     ','PAGSER    ',18,'P','U99FLARA  ','2021-03-12 09:29:25.000','2021-03-12 09:06:42.000','U99FLARA  ','0001-01-01 00:00:00.000','                                                                                                    ','CARGA DE MOVIMIENTOS                    ');
select * from gxfindta.tclcpc where cpcfec = '20210419' order by cpcsecu;
update gxfindta.tclcpc set cpcest = 'C' where cpcfec = '20210503';

select * from gxfindta.tclcpc where cpcfec = '20210503';

select * from gxfindta.tclcpc where cpcfec = '20210309' order by cpcsecu asc;
select * from gxfindta.tclcsp where cpcfec = '20210309' order by prccod asc;
-- TCLCSP (detalle de procesos)
INSERT INTO GXFINDTA.TCLCSP (CPCFEC,PRCCOD,CPCPARM,CSPCOD,CSPSECU,CSPDESC,CSPPARM,CSPEST,CSPMAIL,CSPUSUA,CSPHORA,CSPFEAC,CSPUSAC,CSPHOFI,CSPOBS)
VALUES ('20210309','PCLR007     ','PAGSER    ','PCLR085     ',1,'COMISIONAMIENTO ANDE                    ','ANDE      ','P','PRODUCCIONTIC@BEPSA.COM.PY                                                                          ','U99ELIANA ','2021-03-12 09:29:25.000','2021-03-12 09:06:42.000','U99ELIANA ','0001-01-01 00:00:00.000','                                                                                                    ');
select * from gxfindta.tclcsp where cpcfec = '20210503';


-- TCLPRC (procesos)
INSERT INTO GXFINDTA.TCLPRC (PRCCOD,PRCPARM,PRCNIV,PRCDESC,PRCSUB,PRCORD,PRCFREC,PRCMAIL,PRCFEAC,PRCUSAC)
VALUES ('PCLR007     ','PAGSER    ',18,'CARGA DE MOVIMIENTOS                    ',0,1,'D','PRODUCCIONTIC@BEPSA.COM.PY                                                                          ','0001-01-01 00:00:00.000','U99FLARA  ');
select * from gxfindta.tclprc;

INSERT INTO GXFINDTA.TCLPRC (PRCCOD,PRCPARM,PRCNIV,PRCDESC,PRCSUB,PRCORD,PRCFREC,PRCMAIL,PRCFEAC,PRCUSAC)
VALUES ('PCLR085     ','ANDE      ',18,'CARGA DE MOVIMIENTOS                    ',1,1,'D','PRODUCCIONTIC@BEPSA.COM.PY                                                                          ','0001-01-01 00:00:00.000','U99FLARA  ');



-- TCLCPP (participantes)
INSERT INTO GXFINDTA.TCLCPP (SERCODI,PRECODI,PRTCODI,CPPCODI,CPPTIAF,CPPTICO,CPPVACO,CPPFEAC,CPPUSAC,CPPIVA)
VALUES ('PAGSER    ','ANDE','EMIS',2,'C','E',50.0000,'0001-01-01 00:00:00.000','U99BERNAL ','S');

select * from gxfindta.TCLCPP where sercodi = 'DINEFE';

SELECT * FROM GXFINDTA.TCLCOM WHERE

select * from gxtrjdta.tdgent; 
select * from gxtrjdta.TDGECO;
select * from gxtrjdta.TDGENS;


INSERT INTO GXFINDTA.TCLCPP (SERCODI,PRECODI,PRTCODI,CPPCODI,CPPTIAF,CPPTICO,CPPVACO,CPPFEAC,CPPUSAC,CPPIVA)
VALUES ('PAGSER    ','ANDE','BEPS',3,'C','E',50.0000,'0001-01-01 00:00:00.000','U99BERNAL ','S');

INSERT INTO GXFINDTA.TCLCPP (SERCODI,PRECODI,PRTCODI,CPPCODI,CPPTIAF,CPPTICO,CPPVACO,CPPFEAC,CPPUSAC,CPPIVA)
VALUES ('PAGSER    ','ANDE','CLIE',1,'D','F',0.1100,'0001-01-01 00:00:00.000','U99BERNAL ','S');


-- TDGECO 
INSERT INTO GXTRJDTA.TDGECO (ENTCODENT,ECOENTROL,DPVIDDISPV,ENSIDSERV,ECOIDPRES,ECOVIGCOMI,ECOTPOCOMI,ECOIVAINCL,ECOVALCOMI,ECOMINCOMI,ECOMAXCOMI,ECOUSULTUP,ECOFHULTUP,ROLIDROL)
VALUES (1002,100201,'ATM  ','PAGSER    ','ANDE','20210101','P','N',0.5000,0.0000,0.0000,'MIGRACION ','2020-07-10 23:55:00.000',1);


-- TDGENS
INSERT INTO GXTRJDTA.TDGENS (ENTCODENT,ENSIDSERV,ENSESTADO,ENSUSULTUP,ENSFHULTUP)
VALUES (1002,'PAGSER    ','A','MIGRACION ','2020-07-29 18:57:33.603');





--VARIOS
SELECT * FROM GXBDBPS.TSWAUT T WHERE AUTTRXCOD ='530002';
select * from GXFINDTA.tcltpc;
INSERT INTO GXFINDTA.TCLTPC
(
  TPCIDTEM,
  SERCODI,
  PRECODI,
  TPCDISP,
  TPCFPGO,
  TPCFPRO,
  TPCFTRX,
  TPCHTRX,
  TPCCODAU,
  TPCRBPS,
  TPCTPTAR,
  TPCNUTAR,
  TPCEEMI,
  TPCBEMI,
  TPCPREM,
  TPCBIPR,
  TPCEADQ,
  TPCBADQ,
  TPCIMPGS,
  TPCIMPME,
  TPCTRXCOD,
  TPCIMPSA,
  TPCCMCC,
  TPCCODCO,
  TPCMARCA,
  TPCPROD,
  TPCAFIN,
  TPCORIG,
  TPCEADM,
  TPCEPRO,
  TPCCODRE,
  TPCESTRX,
  TPCESCLE,
  TPCPRCLE,
  TPCOPOR,
  TPCOPDE,
  TPCTEOR,
  TPCTEDE,
  TPCFEAC,
  TPCUSAC,
  TPCRRNBEP,
  TPCPAISORI,
  TPCMONORI,
  TPCIDTRX,
  ECCCDERRCC,
  TPCCODCLI,
  TPCCODSUC
)
VALUES
(
  6,
  'COMPRA    ',
  'COMP',
  'POS  ',
  'TA',
  '20200804',
  '20200804',
  '03:46:42',
  '357237',
  'ISA       ',
  'D',
  '7030020106066906   ',
  100201,
  '            ',
  9000,
  '            ',
  9000,
  '            ',
  1000.00,
  1000.00,
  '000054',
  0.00,
  '      ',
  '6000392',
  'DIN',
  '   ',
  0,
  'L',
  900002,
  900003,
  '00',
  'A',
  'C',
  'S',
  0,
  0,
  '               ',
  '               ',
  '20200804',
  'CLEARING  ',
  '021791777599   ',
  600,
  600,
  'PX58585406                              ',
  '  ',
  0,
  0
);



select * from gxfindta.tcltpc where TPCFPRO = '20210503' where SERCODI = 'PAGSER';
select * from gxsegdta.tsgnum;


SELECT * FROM gxbdbps.TSWAUT WHERE AUTTRXCOD ='530002' and AUTTRXFCHC = '20210309';
select * from gxbdbps.tswaut where autcodser = 'PAGSER' and AUTTRXFCHC = '20210309';
SELECT * FROM gxbdbps.TSWAUT WHERE AUTTRXFCHC = '20210309' and autcodser = 'CICO';
SELECT * FROM gxbdbps.TSWAUT where autcodser = 'PAGSER' and auttrxfchc = '20210309';

--PARA PODER REINICIAR EL PROCESO DE NUEVO CLEARING
update gxbdbps.tswaut set autcodser = 'PAGSER' where autcodser = 'PAGFAC' and auttrxfchc = '20210309';
update gxbdbps.tswaut set auttrxfchc = '20210419' where auttrxfchc = '20210413';
update gxbdbps.TSWAUT set autestcle = 'P' WHERE AUTTRXFCHC = '20210518';
delete FROM GXFINDTA.TCLCSP WHERE CPCFEC = '20210518';
delete FROM GXFINDTA.TCLCPC WHERE CPCFEC = '20210518';
DELETE from gxfindta.tclmov;
DELETE from gxfindta.tclmod;
delete from gxfindta.ccasi21;
delete from contabilid.ccasien;
delete from gxfindta.tcltpc where TPCFPRO = '20210518';


SELECT COUNT(*) FROM gxfindta.tcltpc where TPCFPRO = '20210503';
SELECT COUNT(*) FROM gxfindta.tclmov;
select * from gxtrjdta.tdgeco;

select * from gxfindta.tclpfd; --parametros del clearing detalle
select * from gxfindta.tclpfc; --parametros del clearing cabecera

--control de datos cargados #13955 ANDE
SELECT * FROM gxbdbps.TSWAUT where autcodser = 'PAGSER' and auttrxfchc = '20210309' and auttrxestf = 'A' and autcodret = '00'; --transacciones ANDE aprobadas
--busqueda en el TCLMOV
select * from gxfindta.tclmov where MOVRRNBEP in (
SELECT autrrnbep FROM gxbdbps.TSWAUT where autcodser = 'PAGSER' and auttrxfchc = '20210309' 
and auttrxestf = 'A' and autcodret = '00'); --transacciones ANDE aprobadas);
--busqueda en el TCLMOD
select * from gxfindta.tclmod where MOVIDMOV in (
select MOVIDMOV from gxfindta.tclmov where MOVRRNBEP in (
SELECT autrrnbep FROM gxbdbps.TSWAUT where autcodser = 'PAGSER' and auttrxfchc = '20210309' 
and auttrxestf = 'A' and autcodret = '00')); --transacciones ANDE aprobadas);


--relacion de entidad con servicio para realizar distribucion de la comision recibida
select * from gxtrjdta.tdgeco;


--SACANDO PRESENTACION DE DATOS
select 
entcodent COD_ENTIDAD, dpviddispv DISPOSITIVO, ensidserv SERVICIO, 
ecoidpres PRESTACION, ecovalcomi VALOR_COMISION 
from gxtrjdta.tdgeco;


SELECT * FROM gxbdbps.TSWAUT where auttrxfchc = '20210309' and auttrxestf = 'A' and autcodret = '00';
SELECT 
autbinemi BIN_EMISOR, autcodaut COD_AUTORIZACION, autcodpre PRESTACION, autcodser SERVICIO,
substr(autentadm,1,4) ENTIDAD_ADM, autestcle ESTADO_CLEARING, autmartar MARCA_TARJETA,autmontdes IMPORTE_TRX, autmoncom MONTO_COMISION,
auttrxestf ESTADO, autcodret COD_RETORNO, auttrxfchc FECHA_COMERCIAL  
FROM gxbdbps.TSWAUT where autcodser = 'PAGSER' and auttrxfchc = '20210309' and auttrxestf = 'A' and autcodret = '00';

--busqueda en el TCLMOV
select * from gxfindta.tclmov where MOVRRNBEP in (
SELECT autrrnbep FROM gxbdbps.TSWAUT where autcodser = 'PAGSER' and auttrxfchc = '20210309' 
and auttrxestf = 'A' and autcodret = '00'); --transacciones ANDE aprobadas);

select 
movidmov ID_MOVIMIENTO, sercodi SERVICIO, precodi PRESTACION, movesta ESTADO, movcodis DISPOSITIVO,
movfpro FECHA_PROCESO, movfcre FECHA_CREDITO, substr(movcodem,1,4) COD_EMISOR, movdesem EMISOR,
movcoco COMISION_BRUTO, movivco COMISION_IVA, movimco COMISION_NETO  
from gxfindta.tclmov where MOVRRNBEP in (
SELECT autrrnbep FROM gxbdbps.TSWAUT where autcodser = 'PAGSER' and auttrxfchc = '20210309' 
and auttrxestf = 'A' and autcodret = '00'); --transacciones ANDE aprobadas);
--busqueda en el TCLMOD
select * from gxfindta.tclmod where MOVIDMOV in (
select MOVIDMOV from gxfindta.tclmov where MOVRRNBEP in (
SELECT autrrnbep FROM gxbdbps.TSWAUT where autcodser = 'PAGSER' and auttrxfchc = '20210309' 
and auttrxestf = 'A' and autcodret = '00')); --transacciones ANDE aprobadas);

select 
movidmov ID_MOVIMIENTO, modfpro FECHA_PROCESO, modtppa TIPO_PARTICIPANTE, modtpaf DEBIDO_CREDITO, modvaco PORCENTAJE, modcomi COMISION, modcoiv IVA
from gxfindta.tclmod where MOVIDMOV in (
select MOVIDMOV from gxfindta.tclmov where MOVRRNBEP in (
SELECT autrrnbep FROM gxbdbps.TSWAUT where autcodser = 'PAGSER' and auttrxfchc = '20210309' 
and auttrxestf = 'A' and autcodret = '00')); --transacciones ANDE aprobadas);


--consultas caso comisiones, #14227
select * from gxbdbps.comaeaf where cocomer = '0700161';
select * from gxbdbps.comaexd where cocomer = '0700161';
select * from gxtrjdta.tdgeco where ecoidpres = 'COMP';
select * from gxbdbps.tswaut where AUTRRNBEP = '106846502852';
select * from gxbdbps.tswaut where auttrxfchc = '20210309' and AUTMARTAR <> 'DIN' and autcodret = '00' and auttrxestf = 'A' and autrolbep <> 'SWT' and autforpag = 'TA' and autcodcomb = '0700161';
select * from gxfindta.tclcpp;
select * from gxfindta.tclecc;
select * from gxtrjdta.TDGEnS;
select * from gxtrjdta.tdgbin where BINNROBIN = '672534';

select * from gxfindta.tcltpc where TPCFPRO = '20210309' and sercodi = 'COMPRA' and precodi = 'COMP' and tpcmarca <> 'DIN' and tpcrbps <> 'SWT' AND TPCESCLE = 'C';


-- where TPCRRNBEP in(
-- '106946586914',   
-- '106946642857',   
-- '106946617127',   
-- '106946615074',   
-- '106946608451',   
-- '106846511078',   
-- '106946653403',   
-- '106846516606',   
-- '106846518717',   
-- '106946647607',   
-- '106946626034',   
-- '106946593187',   
-- '106946593673',   
-- '106846506461',   
-- '106946631183',   
-- '106946652294',   
-- '106946592897',   
-- '106846519192',   
-- '106846507094',   
-- '106846503001',   
-- '106846507485',   
-- '106846519984',   
-- '106846512635',   
-- '106846504201',   
-- '106846517039',   
-- '106846514586',   
-- '106946563946',   
-- '106846518431',   
-- '106946579903',   
-- '106846506735',   
-- '106846503692',   
-- '106946572965'   
-- );

select * from gxfindta.tclmov where movRRNBEP IN (
select TPCRRNBEP from gxfindta.tcltpc where TPCFPRO = '20210309' and sercodi = 'COMPRA' 
and precodi = 'COMP' and tpcmarca <> 'DIN' and tpcrbps <> 'SWT');

select * from gxfindta.tclmov where MOVRRNBEP in (select autrrnbep from gxbdbps.tswaut 
where auttrxfchc = '20210309' and AUTMARTAR <> 'DIN' and autcodret = '00' and auttrxestf = 'A' 
and autrolbep <> 'SWT' and autforpag = 'TA');

select * from gxtrjdta.tdgent

select * from gxfindta.tclmod where movidmov IN (
select movidmov from gxfindta.tclmov where movRRNBEP IN (
select TPCRRNBEP from gxfindta.tcltpc where TPCFPRO = '20210309' and sercodi = 'COMPRA' 
and precodi = 'COMP' and tpcmarca <> 'DIN' and tpcrbps <> 'SWT' AND TPCESCLE = 'C'));
select * from gxfindta.tclmov where movidmov = '2181344';
select * from gxfindta.tclmod where movidmov = '2181344';

SELECT x.* FROM javierlib.TDGECO x
WHERE ECOIDPRES ='COMP' AND ENTCODENT IN(1020,1017,9004)
ORDER BY x.ENTCODENT;

select * from gxfindta.tclmod where movidmov in (
select movidmov from gxfindta.tclmov where MOVRRNBEP in (
select autrrnbep from gxbdbps.tswaut 
where auttrxfchc = '20210309' and AUTMARTAR <> 'DIN' 
and autcodret = '00' and auttrxestf = 'A' and autrolbep <> 'SWT' 
and autforpag = 'TA')
);

select * from gxfindta.tclmov where movidmov in(
2087709,
2087712,
2087721
);

Select * from gxfindta.tclecc

--pruebas red de pagos
select * from gxbdbps.comaeaf where cocomer = '0700161';
select * from gxbdbps.comaexd where cocomer = '0700161';
select * from gxtrjdta.tdgeco where ecoidpres = 'COMP';
select * from gxbdbps.tswaut where AUTRRNBEP = '106846502852';
select * from gxbdbps.tswaut where auttrxfchc = '20210309' and autcodser = 'REDPAG' and autcodret = '00' and auttrxestf = 'A';
select * from gxfindta.tclcpp;
select * from gxfindta.tclecc;
select * from gxtrjdta.TDGEnS;
select * from gxtrjdta.tdgbin where BINNROBIN = '672534';

select * from gxfindta.tcltpc where TPCFPRO = '20210309' and sercodi = 'REDPAG';

select * from gxfindta.tclmov where MOVRRNBEP in (
select autrrnbep from gxbdbps.tswaut where auttrxfchc = '20210309' and autcodser = 'REDPAG' and autcodret = '00' and auttrxestf = 'A'); 

select * from gxfindta.tclmod where movidmov in (
select movidmov from gxfindta.tclmov where MOVRRNBEP in (
select autrrnbep from gxbdbps.tswaut where auttrxfchc = '20210309' and autcodser = 'REDPAG' and autcodret = '00' and auttrxestf = 'A'));  

select * from gx

select * from libclea.tclmov where movrrnbep = '106846503082';

select * from libclea.tclmod where movidmov = '14479385';

--PRUEBAS DINELCO EFECTIVO
select * from gxbdbps.tswaut where auttrxfchc = '20210309' and autcodser = 'DINEFE' and autcodret = '00' and auttrxestf = 'A';

select * from gxfindta.tclmov where MOVRRNBEP in (
select autrrnbep from gxbdbps.tswaut where auttrxfchc = '20210309' and autcodser = 'DINEFE' and autcodret = '00' and auttrxestf = 'A'); 

select * from gxfindta.tclmod where movidmov in (
select movidmov from gxfindta.tclmov where MOVRRNBEP in (
select autrrnbep from gxbdbps.tswaut where auttrxfchc = '20210309' and autcodser = 'DINEFE' and autcodret = '00' and auttrxestf = 'A'));  

--libclea
select * from LIBCLEA.tswaut where auttrxfchc = '20210309' and autcodser = 'REDPAG' and autcodret = '00' and auttrxestf = 'A';

select * from libclea.tclmov where MOVRRNBEP in (
select autrrnbep from libclea.tswaut where auttrxfchc = '20210309' and autcodser = 'REDPAG' and autcodret = '00' and auttrxestf = 'A'); 

select * from libclea.tclmod where movidmov in (
select movidmov from libclea.tclmov where MOVRRNBEP in (
select autrrnbep from libclea.tswaut where auttrxfchc = '20210309' and autcodser = 'REDPAG' and autcodret = '00' and auttrxestf = 'A'));  

--PRUEBAS CICO
select * from gxbdbps.tswaut where auttrxfchc = '20210419' and autcodret = '00' and auttrxestf = 'A';

select * from gxfindta.tclmov where MOVRRNBEP in (
select autrrnbep from gxbdbps.tswaut where auttrxfchc = '20210419' and autcodret = '00' and auttrxestf = 'A'); 

select * from gxfindta.tclmod where movidmov in (
select movidmov from gxfindta.tclmov where MOVRRNBEP in (
select autrrnbep from gxbdbps.tswaut where auttrxfchc = '20210309' and autcodser = 'CICO' AND AUTCODPRE = 'GIRO' and autcodret = '00' and auttrxestf = 'A'));

SELECT * FROM GXFINDTA.TCLMOV WHERE MOVIDMOV = '14437621';
SELECT * FROM GXFINDTA.TCLMOD WHERE MOVIDMOV = '14437621'; 
---------------------------------------------------
---------------------------------------------------
---------------------------------------------------
    -------------------VARIOS------------------
---------------------------------------------------
---------------------------------------------------
select * FROM GXFINDTA.TCLCSP;
select * FROM GXFINDTA.TCLCPC; 
update gxbdbps.tswaut set auttrxfchc = '20210309' where autrrnbep in (
'106846504207',   
'106846506639',   
'106846506702',   
'106846507332',   
'106846507548',   
'106846507547',   
'106846507616',   
'106846507768',   
'106846509448',   
'106846509520'   
);

select * FROM gxbdbps.TSWAUT WHERE AUTTRXFCHC = '20210324'
limit 100
 and autestcle = 'P'-- order by AUTTRXFCHC desc;

select * from libclea.tclmov where movfcre between '20210321' and '20210323';

select * from libclea.tclmod where MODFPRO BETWEEN '20210319' AND '20210323';

select * from gxfindta.tclcpc where CPCFEC = '20210325';
select * from gxfindta.tcltsp
delete from gxfindta.tcltpc where sercodi = 'PAGSER'; --temporal
--ubicacion de los archivos gen
SELECT * FROM GXFINDTA.TClcne where CNEIDCON = 'PTHRPTACD ';

delete FROM GXFINDTA.TCLCSP WHERE CPCFEC = '20210309'; CSPCOD IN ('PCLR008', 'PCLR013', 'PCLR015', 'PCLR053', 'PCLR054') AND ; -- DEtalle de Proceso
delete FROM GXFINDTA.TCLCPC WHERE CPCFEC = '20210309'; AND PRCCOD IN ('PCLR007', 'PCLR011'); -- Cabecera de Procesos
SELECT * FROM GXFINDTA.TCLFEC; -- FECHA PROCESO
SELECT * FROM GXFINDTA.TCLPRC; --tabla de procesos
select * from gxfindta.tclmov where movfcre ='20210310'
select * from gxfindta.tclmod; 

select * from gxfindta.tclimp

select * from gxfindta.tclmov where MOVRRNBEP in ('019085971898');
select * from gxfindta.tclmod where MOVIDMOV = '1752252';

select * from gxtrjdta.tdgeco;

'019085971898',   
'019085972069',   
'019286448485',   
'021600058471',   
'021600058489',   
'021600058556',   
'021600058584',   
'028300069670',   
'028407431170',   
'028407437158',   
'028900070723',   
'029000070848',   
'030000072726',   
'030100073096',   
'030210716752',   
'030400074020',   
'030400074023',   
'030512761866',   
'030713427263',   
'030713428028',   
'032400077399',   
'032400077437',   
'032500077699',   
'033117594763',   
'033217936963',   
'033218110427',   
'033318331748',   
'033318510632',   
'033500078568',   
'033500078571',   
'033500078584',   
'033500078587',   
'033500078629',   
'033700079004',   
'033700079014',   
'033700079086',   
'034200079801',   
'035100081943',   
'035100081947',   
'035100081952',   
'035100081961',   
'035323855410',   
'035323875683',   
'035424540402',   
'035625202146',   
'035625245217',   
'035625275403',   
'035625304453',   
'103300087584',   
'103300087587',   
'104200121026')

delete FROM GXFINDTA.TCLCSP WHERE CPCFEC = '20210324';
delete FROM GXFINDTA.TCLCPC WHERE CPCFEC = '20210324';

update GXFINDTA.TCLCPC set cpcest = 'C' WHERE CPCFEC = '20210324';

UPDATE GXFINDTA.TCLcpc SET CSPEST = 'C' WHERE CPCFEC = '20210324';

select * from gxfindta.tclcsp

update gxfindta.tclcsp set cpcfec = '20210324' where cpcfec = '20210309';
update gxfindta.tclcpc set cpcfec = '20210324' where cpcfec = '20210309';
select * from gxfindta.tclcpc 

select * from gxfindta.tclmov where movfcre = '20210309';

select * from libdebito.drconbep where lfectr = '20210330' order by lhortr desc;

select count(*) from gxfindta.tclmov where movfpro = '20210309'      
and movpgon = 'B' and sercodi = 'COMPRA' and movcdbce = 100201;

select * from gxfindta.tclser;

select count(*), movidlt from gxfindta.tclmov where MOVCODIS = 'POS' and movpgon = 'B' group by movidlt;

select * from gxfindta.tclmov where sercodi = 'CICO'

select sercodi, tpcescle, tpcprcle, ECCCDERRCC from gxfindta.tcltpc group by ECCCDERRCC, sercodi, tpcescle, tpcprcle;

INSERT INTO GXFINDTA.TCLPFC (PFCIDPARM, PFCDSPARM, PFCUSULSUP, PFCFECLSUP)
VALUES
('COMERCIOSERVPRESTA','COMERCIO X SERVICIO/PRESTACION','U99LUIS',{ts '2021-03-17 08:33:36.654000'});

INSERT INTO GXFINDTA.TCLPFD (PFCIDPARM, PFDIDGRUP, PFDSECU, PFDVALCHR1, PFDUSULSUP, PFDFECLSUP)
VALUES
('COMERCIOSERVPRESTA','PAGFAC700405', 1, '6900001', 'U99LUIS',{ts '2021-03-17 08:33:36.654000'}),
('COMERCIOSERVPRESTA','VTAMIN700405', 2, '6900001', 'U99LUIS',{ts '2021-03-17 08:33:36.654000'}),
('COMERCIOSERVPRESTA','PAGFAC700105', 3, '6900002', 'U99LUIS',{ts '2021-03-17 08:33:36.654000'}),
('COMERCIOSERVPRESTA','VTAMIN700105', 4, '6900002', 'U99LUIS',{ts '2021-03-17 08:33:36.654000'}),
('COMERCIOSERVPRESTA','PAGFAC700605', 5, '6900042', 'U99LUIS',{ts '2021-03-17 08:33:36.654000'}),
('COMERCIOSERVPRESTA','VTAMIN700605', 6, '6900042', 'U99LUIS',{ts '2021-03-17 08:33:36.654000'}),
('COMERCIOSERVPRESTA','CICOCAIN ', 7, '6900097', 'U99LUIS',{ts '2021-03-17 08:33:36.654000'}),
('COMERCIOSERVPRESTA','CICOGIRO ', 8, '6900097', 'U99LUIS',{ts '2021-03-17 08:33:36.654000'});

vINSERT INTO gxbdbps.AIT001
(
AIID,     
AIFCHPRO,
AIFILID,  
AITST,    
AIEST,    
AIUSRAUD,
AIFHAUD,  
AIFHPRO,  
AICNTLIN,
AICNTTC,  
AICNTTCPEN,
AICNTTCERR,
AITPO,
AIMTID,   
AICNTTCPRO,
AITRNFHINI,
AITRNFHFIN,
AICNTBCH  ,
AIOBS,    
AICNTME1
)
SELECT
a.AIID,
a.AIFCHPRO,    
a.AIFILID ,  
a.AITST,     
a.AIEST ,    
a.AIUSRAUD,  
a.AIFHAUD,   
 a.AIFHPRO,
a.AICNTLIN,  
a.AICNTTC,   
a.AICNTTCPEN,
a.AICNTTCERR,
a.AITPO,     
a.AIMTID,    
a.AICNTTCPRO,
a.AITRNFHINI,
a.AITRNFHFIN,
a.AICNTBCH,  
a.AIOBS,    
a.AICNTME1  
FROM gxswtdta.AIT001 a
WITH NC ;

select * from gxopera.opmovi where OPENEMI = '020';

DELETE FROM GXFINDTA.TCLPRC WHERE PRCCOD = 'PCLR085     ' AND   PRCPARM = 'ANDE      ' AND   PRCNIV = 18;
DELETE FROM GXFINDTA.TCLPRC WHERE PRCCOD = 'PCLR007     ' AND   PRCPARM = 'PAGSER    ' AND   PRCNIV = 18;

INSERT INTO GXFINDTA.TCLPRC
(
  PRCCOD,
  PRCPARM,
  PRCNIV,
  PRCDESC,
  PRCSUB,
  PRCORD,
  PRCFREC,
  PRCMAIL,
  PRCFEAC,
  PRCUSAC
)
VALUES
(
  'PCLR007     ',
  'PAGSER    ',
  14,
  'CARGA DE MOVIMIENTOS                    ',
  0,
  1,
  'D',
  'PRODUCCIONTIC@BEPSA.COM.PY                                                                          ',
  '0001-01-01 00:00:00.000',
  'U99FLARA  '
);

INSERT INTO GXFINDTA.TCLPRC
(
  PRCCOD,
  PRCPARM,
  PRCNIV,
  PRCDESC,
  PRCSUB,
  PRCORD,
  PRCFREC,
  PRCMAIL,
  PRCFEAC,
  PRCUSAC
)
VALUES
(
  'PCLR085     ',
  'ANDE      ',
  14,
  'CARGA DE MOVIMIENTOS                    ',
  1,
  1,
  'D',
  'PRODUCCIONTIC@BEPSA.COM.PY                                                                          ',
  '0001-01-01 00:00:00.000',
  'U99FLARA  '
);

--16473, dias transcurridos de retencion
select * from gxfindta.tclrtc;

update gxfindta.tclrtc set RTCDIATRCA = '0' where RTCDIATRCA > 0;



select * from libdebito.drconbep where lfectr = '20210630' order by lhortr desc;
