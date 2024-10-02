select * from gxopera.opmovi where opfecom = '20210219'
and substr(optarj,1,6)= '703020' and opcomer in (select cocomer from gxbdbps.comaeaf where enemiso = '002');

select * from gxopera.opmovi where opfecom = '20210219' and opcomer = '0700814';

select opferea FECHA_REAL, optarj TARJETA, opnoref REFERENCIA, opfecom FECHA_COMERCIAL, opcomer COMERCIO, opmonto MONTO, opcomi COMISION 
from gxopera.opmovi where opfecom = '20210219' and opcomer = '0700814';

select * from gxopera.tclsec where SECCOBCO = '061';
--gnb 061
	select * from contabilid.tatgene where TGALFA = 'BA';
	
select * from gxopera.oplicre where OPCRECBA = '021';

--#13954, Modificaciones varias en instructivos de acreditacion
TCLRTC,TCLRTD,TCLMOV;
select * from gxfindta.tclrtc where rtcidreten in (
select rtcidreten from gxfindta.tclrtd where rtdfchcob = '20210317') and rtccomerc = '0701665';

select * from gxfindta.tclrtc where RTCCOMERC = '0302342';
select * from gxfindta.tclrtd where rtcidreten = '397';

select * from gxfindta.tclmov where movidmov IN('16212520');
select * from javierlib.tclmov where movidmov IN('13412497');

select * from libdebito.drconbep where lerrnb in(
'107147006556',   
'107647746627');
select * from gxopera.flicom where LIFECHD = '20210317' and LICOMER = '0703978';
select * from gxopera.flicom1 where LIFECHD = '20210317' and LICOMER = '0703978';

select * from gxopera.opmovi where opcomer = '0703978' and OPFECOM = '20210317';

select * from libdebito.drconbep;

select * from gxopera.flicom where LIFECHD = '20210317' and LICOMER = '0701629';
select * from gxopera.flicom1 where LIFECHD = '20210317' and LICOMER = '0701629';

select * from gxfindta.tclmov where movidmov in (
select rtcidmov from gxfindta.tclrtc where rtcidreten in (
select rtcidreten from gxfindta.tclrtd where rtdfchcob between '20210317' and '20210317'));





select sum(opmonto-opcomi) from gxopera.opmovi where OPCOMER = '0302342' and opfecom = '20210412' and substr(optarj,1,6)= '703002';


select * from gxopera.opmovi where OPCOMER = '0701629' and opfecom = '20210317' and substr(optarj,1,6)= '703002';

select cocomer, CODENO, enemiso from gxbdbps.comaeaf where cocomer in (
'0700711',
'0300237',
'0703795',
'0301766',
'0701614',
'0703978',
'0702077',
'0701665',
'0701629')

select * from gxopera.tclsec where SECCOBCO = '083';

select * from contabilid.tatgene where TGALFA = 'BA' and tgenti in ('055', '057', '062');


select * from gxfindta.tclmov where movfpro between '20210301' and '20210318';

Select count(*) from gxopera.flicom1 where lifechd = '20210317'; Total 3.120 registros;

select * from gxfindta.tclrtc where rtcfchpro between '20210401' and '20210408';

select * from libclea.tswaut where auttrxfchf < '20210401';
select * from gxfindta.tclrtd where rtdfchcob between '20210401' and '20210408';
select * from gxfindta.tclmov where MOVFPRO between '20210401' and '20210408';            



select * from gxfindta.TCLRTC A, GXBDBPS.COMAEAF C, gxfindta.TCLRTD B
where A.rtcidreten = B.rtcidreten AND RTCESTADO IN('P','C') AND RTDFCHCOB = '20210317'
LIMIT 1000;

select * from gxfindta.tclrtc where 

select * from libdebito.drconbep;

select lfectr from libprod.drconbe60
where lfectr > '20210400'
group by lfectr;

delete from gxbdbps.tlogsaf where lstipro= 'CLEA'  and lsfecha = '20210409';
delete from gxopera.oprecle where  refech ='20210408';
Delete from gxopera.opcomis where opcofer ='20210408';
Delete from gxopera.fctacom where ctafecha = '20210408';
Delete from gxopera.OPTADE WHERE OPTDFEC >= '20210408';
Delete from gxopera.opmovi where opfecom = '20210408';
delete from gxopera.flicom where lifechd = '20210408';
Delete from gxopera.flicom1 where lifechd = '20210408';
Delete from gxopera.opliqui where substr(opcampoa,41,8) = '20210408';
Delete from gxopera.opago0p where pgfcom >= '20210408';
Delete from gxopera.opago1p where pgfecom >= '20210408';
Delete from gxopera.opago3p where bnffecom >= '20210408';
Delete from gxopera.opago3tc where tcfecom >= '20210408';
Delete from gxopera.opago5p where pgfecom5 >= '20210408';

select * from gxbdbps.comaeaf:
select * from gxbdbps.coma1af;
select * from gxbdbps.comaext;
select * from gxbdbps.comaexd;
select * from gxfindta.tclrtc where RTCFCHPRO > '20210401';
select * from gxfindta.tclrtd where RTCFCHPRO > '20210401';
select * from gxfindta.TCLMOV where movfpro > '20210401';

--PRUEBAS CASO CLEARING, RESUMEN DE RETENCIONES
--Vision
select * from gxfindta.tclrtc where RTCCOMERC = '0701305';
select * from gxfindta.tclrtd where rtcidreten = '381';
select * from yapi.tclmov where movidmov = '16063524';


select * from gxopera.flicom where LICOMER = '0701055';
select * from gxopera.flicom1 where LICOMER = '0701055';
select * from gxopera.opmovi where OPCOMER = '0701055';

select * from 

select * from javierlib.drconbep where lfcotr = '20210408' and lidcom = '0701750';
select * from libdebito.drconbep where lcautr in ('286577','196372');
select * from libprod.FLICOM160
where lifechd = '20210408' and licomer = 0800588

--Itau
select * from yapi.comaeaf where cocomer = '0300996'

select c.enemiso,a.rtccomerc,c.CODENO,b.rtcidreten,b.rtdmonamrt from gxfindta.TCLRTC a,gxfindta.TCLRTD b, GXBDBPS.comaeaf c
where rtdfchcob = '20210408' and a.rtcidreten = b.rtcidreten and c.cocomer = a.rtccomerc;

select * from gxopera.flicom where LICOMER = '0703323' and = '20210408';
select * from gxopera.flicom1 where LICOMER = '0703323' and LIFECREDI = '20210413';

select * from 


select * from libdebito.drconbep where lfectr = '20210413' and lhortr > '160000' order by lhortr asc;

select * from gxbdbps.tswaut where auttrxfchc = '20210413' order by  AUTTRXHORF desc;

select * from libclea.tswaut where autcodser = 'CICO';

SELECT * FROM javierlib.TCLMOV where movcomer = '0302342';
WHERE MOVIDMOV = 16212520;

select count(*),lfcotr from libdebito.drconbep
where lfcotr between '20210416' and '20210420'
group by lfcotr;

Select opcrefcom Fecomercial, opcrecba Banco, opcrecrei TipoOpe, sum(opcreimpn) Neto from gxopera.oplicre where opcrefcom = '20210419'
group by opcrefcom, opcrecba, opcrecrei;

select * from gxopera.opmovi where opfecom = '20210419';


select * from gxopera.oplicre
where opcrefcom = '20210419' and opcrecba = 66
and opcrecom  not in (select licomer from gxopera.FLICOM1 where LIFECREDI  = '20210420');

    
select sum(lineto) from gxopera.FLICOM1
-- where ( licodtr = '000054' OR  -- //COMPRAS
-- licodtr = '901020' OR licodtr = '902020' OR licodtr = '514000' OR licodtr = '524000' OR licodtr = '510000' OR licodtr = '520000' OR --//VTA DE MINUTOS
-- licodtr = '013000' OR licodtr = '014000' OR  --    //DINELCO EFECTIVO/RED DE PAGOS
-- licodtr = '010004' OR licodtr = '000056' OR --/*licodtr = '000057' OR*/   //DT
-- licodtr = '210010' OR --  //ROTATIVO
-- licodtr = '010006' OR --   //PAGO PROVEEDORES
-- licodtr = '010005' OR --   //PAGO COMISION
-- licodtr = '000066' )--      //PAGO RETENCION
where licomer = '8602650'-- in ((select COCOMER from  GXBDBPS.comaeaf where enemiso = '066'))
and  LIFECREDI  = '20210420';

select sum(opimpor) from gxopera.OPLIQUI
where OPSTATOB <> '88' and OPSTATOB <> '77'  and substr(OPCAMPOA,41,8) = '20210419'
and opncomer = '8602650' --in ((select COCOMER from  GXBDBPS.comaeaf where enemiso = '066'));


select * from  GXBDBPS.comaeaf where cocomer = '8602650';

select sum(LIMONTO) from gxopera.FLICOM1
where licomer in ((select COCOMER from  GXBDBPS.comaeaf where tipacodi = '1' and enemiso = '066'))
and licodtr = '014000'
and  LIFECREDI  = '20210420';

 


select sum(LINETO) from gxopera.FLICOM1
where licomer in ((select COCOMER from  GXBDBPS.comaeaf where tipacodi = '1' and enemiso = '066'))
and licodtr <> '014000'
and  LIFECREDI  = '20210420';

 

select sum(opimpor) from gxopera.OPLIQUI
where OPSTATOB <> '88' and OPSTATOB <> '77'  and substr(OPCAMPOA,41,8) = '20210419'
and opncomer in ((select COCOMER from  GXBDBPS.comaeaf where tipacodi = '1' and enemiso = '066'));

select * from gxopera.FLICOM1
where licomer in ((select COCOMER from  GXBDBPS.comaeaf where tipacodi = '1' and enemiso = '066'))
and licodtr = '014000'
and  LIFECREDI  = '20210420';

 


select * from gxopera.FLICOM1
where licomer in ((select COCOMER from  GXBDBPS.comaeaf where tipacodi = '1' and enemiso = '066'))
and licodtr <> '014000'
and  LIFECREDI  = '20210420';

 

select * from gxopera.OPLIQUI
where OPSTATOB <> '88' and OPSTATOB <> '77'  and substr(OPCAMPOA,41,8) = '20210419'
and opncomer in ((select COCOMER from  GXBDBPS.comaeaf where tipacodi = '1' and enemiso = '066'));

[10:11 a.m.] Dario Ayala
    
select * from gxopera.oplicre
where opcrefcom = '20210419' and opcrecba = 66;

select * from GXBDBPS.comaeaf
where COCOMER = '0301091';

select * from gxopera.FLICOM
where licomer = '0301091';

select * from gxopera.FLICOM1
where licomer = '0301091';

select* from GXBDBPS.comaeaf
where COCOMER = '0800230';

select * from gxopera.opmovi;

select * from gxopera.opmovi where OPSTATUS = 'E';
select * from gxfindta.tclmov where MOVRRNBEP in (
'111756175165',
'111756165490',
'111856541974',
'111856386160',
'111856200991',
'111856266806',
'111856267156',
'111856580179',
'111856533041',
'111856355515',
'111856333132',
'111856336235'
);

select * from gxfindta.tclrtc where  RTCIDMOV in (
'16871989',
'16871995',
'16872134',
'16872139',
'16947600',
'16947834',
'16948144',
'16948151',
'16948147',
'16948160',
'16948919',
'16948927',
'16948953',
'16948955',
'16949354',
'16949364',
'16950930',
'16950947',
'16951061',
'16951083',
'16951734',
'16951806'
);


--CASO ITAU--
--CASO1--
select * from gxfindta.tclrtc where rtccomerc = '0701055';
select * from gxfindta.tclrtd where RTCIDRETEN = '918';
select * from gxopera.opliqui where OPNCOMER = '0701055';
select * from gxopera.opmovi where OPNOREF = '111856325908';
select * from gxfindta.tclmov where MOVIDMOV = '16868562';

--CASO2--
select * from gxfindta.tclrtc where rtccomerc = '0703754';
select * from gxfindta.tclrtd where RTCIDRETEN = '922';
select * from gxopera.opliqui where OPNCOMER = '0703754';
select * from gxopera.opmovi where OPNOREF in ('111756175165','111856386160');
select * from gxfindta.tclmov where MOVIDMOV in ('16872134','16949354');

--CASO3--
select * from gxfindta.tclrtc where rtccomerc = '0701649';
select * from gxfindta.tclrtd where RTCIDRETEN = '921';
select * from gxopera.opliqui where OPNCOMER = '0701649';
select * from gxopera.opmovi where OPNOREF ='111756165490';
select * from gxfindta.tclmov where MOVIDMOV = '16871989';

--CONTINENTAL--
--CASO1--
select * from gxfindta.tclrtc where rtccomerc = '0700561';
select * from gxfindta.tclrtd where RTCIDRETEN = '927';
select * from gxopera.opliqui where OPNCOMER = '0700561';
select * from gxopera.opmovi where OPNOREF  '111856233531';
select * from gxfindta.tclmov where MOVIDMOV = '16950730';

--CASO2--
select * from gxfindta.tclrtc where rtccomerc = '0703933';
select * from gxfindta.tclrtd where RTCIDRETEN = '900' AND RTDFCHCOB = '20210428';
select * from gxopera.opliqui where OPNCOMER = '0703933';
select * from gxopera.opmovi where OPNOREF  '111856233531';
select * from gxfindta.tclmov where MOVIDMOV = '16948911';

'2300367',
'0701649',
'0701684',
'0701893',
'0701903',
'0703754',
'0801550',
'0700561',
'0703933',
'0800230'
) and movidmov in (
select MOVIDMOV from gxfindta.tclmod where MOVCOMER in (
'0701055',
'2300367',
'0701649',
'0701684',
'0701893',
'0701903',
'0703754',
'0801550',
'0700561',
'0703933',
'0800230'));

 0;-- where MOVFPrO = '20210428';
select * from javierlib.tclmovbk limit 10;
select OPIDLIQ, OPNROREF, OPNCOMER, OPIMPORB, OPIMPOR, OPSTATOB, OPMENSOB, OPCAMPOA from gxopera.opliqui where substr(opcampoa,41,8) = '20210428' and opnroref = '111856580179';
select * from gxopera.flicom where = '20210429' and LICODBAN = '55'
select * from gxopera.flicom1 where LIFECHD = '20210428' and LICODBAN
select * from gxopera.opliqui
where substr(OPCAMPOA,41,8) = '20210428' and OPSTATOB = '88';
--select * from gxfindta.tclmov; --where movidmov = '16948853';

UPDATE GXOPERA.OPLIQUI
   SET 
       OPSTATOB = '00'
where   OPSTAT = '00';





--CASO CONTINENTAL
--1--
select * from gxfindta.tclrtc where RTCCOMERC = '0700561';
select * from gxfindta.tclrtd where RTCIDRETEN = '927';
select * from gxopera.flicom where LICOMER = '0700561';
select * from gxopera.flicom1 where LICOMER = '0700561';
select substr(optarj,1,6), sum(opmonto-opcomi) from gxopera.opmovi where OPCOMER = '0700561' group by substr(optarj,1,6);
select * from gxopera.opliqui where OPNCOMER = '0700561' and substr(opcampoa,41,8) = '20210428';
select * from gxopera.opliqui where substr(opcampoa,41,8) = '20210428' and opmensaj like "%REVERSA%";
select * from gxopera.oplicre where OPCREFCOM = '20210428' and OPCRECBA = '55'

--2--
select * from gxfindta.tclrtc where RTCCOMERC = '0703933';
select * from gxfindta.tclrtd where RTCIDRETEN = '900' and rtdfchcob = '20210428';
select * from gxopera.flicom where LICOMER = '0703933';
select * from gxopera.flicom1 where LICOMER = '0703933';
select substr(optarj,1,6), sum(opmonto-opcomi) from gxopera.opmovi where OPCOMER = '0703933' group by substr(optarj,1,6);

select * from gxfindta.TCLPFD
SELECT * FROM GXFINDTA.TCLTSB;

select * from gxfindta.tclrtc;

update gxfindta.tcltsb set TSBESTA = 'AC' where TSBESTA = 'ER'


--ACREDITACION - RESUMEN DE ESTADO
select TSBMONSIG,tsbtpop TipoOp, tsbdeop operacion, tsbesta Estado,tsbcome Codigo, tsbdeme Mensaje, count(*) Cantidad, sum(TSBIMPO) AS Total 
from gxfindta.tcltsb 
where tsbfeac >= '2021-03-09 00:00:00' and tsbfeac <= '2021-05-10 23:59:59' and tsbcoco <> '0100001' 
group by TSBMONSIG,tsbtpop, tsbdeop, tsbcome, tsbesta, tsbdeme 
order by  tsbtpop,tsbesta, tsbcome;
--Resumen SIPAP
select (case when tsbtpoacr = 'O' then 'Online' else 'Batch' end)Tipo, count(*) Cantidad, sum(tsbimpo) Importe, tsbdeop operacion, 
(case when tsbesta='AC' then 'Acreditado' when tsbesta='EN' then 'Enviado' when tsbesta='RE' then 'Rechazado' when tsbesta='RV' then 'Reversado' when tsbesta='PE' then 'Pendiente' when tsbesta='ER' then 'Error'  end) Estado,
tsbcome Codigo, tsbdeme Mensaje,tsbcodswc Destino, entnmentid NombreBanco
from gxfindta.tcltsb inner join gxtrjdta.tdgent on tsbbacr = entcodent
where   tsbcodswd <> tsbcodswc /*and tsbesta not in ('AC')*/ AND  tsbfeac >= '2021-03-08 00:00:00' and tsbfeac <= '2021-03-08 23:59:59'  and tsbesta='RV' 
group by tsbtpoacr, tsbdeop, tsbesta, tsbcome,tsbdeme, tsbcodswc, entnmentid  order by  8, 4, 5,1;

INSERT INTO GXTRJDTA.TDSPAS (PASIDPARSI,PASDSPARSI,PASVALOR1,PASDSVAL1,PASVALOR2,PASDSVAL2,PASUSULTUP,PASFHULTUP)
VALUES
  ('TIPOOPE             ','TIPO DE OPERACIONES           ','                                                                                                    ','                              ','                                                                                                    ','                              ','U99DAYALA ','2021-02-19 08:33:36.000');

INSERT INTO GXTRJDTA.TDSDPS (PASIDPARSI,DPSAGRUP,DPSSECUE,DPSDVALOR1,DPSDSVAL1,DPSDVALOR2,DPSDSVAL2,DPSUSULTUP,DPSFHULTUP)
VALUES
  ('TIPOOP              ','OPERACIONES         ',1,'CREDITO A COMERCIOS                                                                                 ','01                            ','01                                                                                                  ','                              ','U99DAYALA ','2021-02-19 08:33:36.000'),
  ('TIPOOP              ','OPERACIONES         ',2,'DEBITO A ENTIDADES                                                                                  ','02                            ','02                                                                                                  ','                              ','U99DAYALA ','2021-02-19 08:33:36.000'),
  ('TIPOOP              ','OPERACIONES         ',3,'REVERSAS Y CONTRACARGOS                                                                             ','03                            ','03                                                                                                  ','                              ','U99DAYALA ','2021-02-19 08:33:36.000'),
  ('TIPOOP              ','OPERACIONES         ',4,'TRANSFERENCIA INTERNA DEBITO                                                                        ','04                            ','04                                                                                                  ','                              ','U99DAYALA ','2021-02-19 08:33:36.000');



select * from gxopera.oplicre where OPCRECOM in (
'0701417',
'0702145',
'0702294',
'0702827',
'0703089',
'0701930',
'0702014');

select opcrefcom Fecomercial, opcrecba Banco, opcrecrei TipoOpe, sum(opcreimpn) Neto from gxopera.oplicre 
where opcrefcom = '20210518'
group by opcrefcom, opcrecba, opcrecrei;

select * from yapi.tclrtc where RTCIDRETEN in (
'828',
'1057',
'611',
'608',
'679',
'669',
'611',
'846',
'749',
'773',
'503',
'560',
'560',
'695',
'648',
'1056');

select enemiso from gxbdbps.comaeaf where cocomer = '0701930';



select * from nestorlib.tclrtd where RTDFCHCOB = '20210518';


delete from gxbdbps.tlogsaf where lstipro= 'CLEA'  and lsfecha between '20210506' and '20210507';
delete from gxopera.oprecle where  refech ='20210428';
Delete from gxopera.opcomis where opcofer ='20210428';
Delete from gxopera.fctacom where ctafecha = '20210428';
Delete from gxopera.OPTADE WHERE OPTDFEC >= '20210428';
Delete from gxopera.opmovi where opfecom = '20210428';
delete from gxopera.flicom where lifechd = '20210428';
Delete from gxopera.flicom1 where lifechd = '20210428';
Delete from gxopera.opliqui where substr(opcampoa,41,8) = '20210428';
Delete from gxopera.opago0p where pgfcom >= '20210428';
Delete from gxopera.opago1p where pgfecom >= '20210428';
Delete from gxopera.opago3p where bnffecom >= '20210428';
Delete from gxopera.opago3tc where tcfecom >= '20210428';
Delete from gxopera.opago5p where pgfecom5 >= '20210428';
select * from gxbdbps.tlogsaf where lstipro= 'CLEA'  and lsfecha = '20210428';
delete from gxopera.oplicre;

select * from libdebito.drconbep where lerrnb in (
'114662546266', 
'114762927432', 
'114762682066');

update libdebito.drconbep set LCODTR = '000000' where LCODTR = '000054' and LERRNB in (
'114662546266', 
'114762927432', 
'114762682066');

select *  from gxopera.opmovi where opfecom = '20210527' and optiptar = 'CRE' and OPCODTRN = '000054';

select cocomer from gxbdbps.comaeaf where enemiso = '094';

INSERT INTO CONTABILID.TATGENE (TGALFA,TGCODE,TGDESC,TGRESU,TGINDI,TGENTI) 
VALUES  ('BA','PJ','PARAGUAYO JAPONESA                      ','FPJ       ',' ','094');

select * from CONTABILID.TATGENE;

INSERT INTO CONTABILID.TAT2CTA (T2COBC,T2CMON,T2COSU,T2TPCO,T2COCT,T2CTCT,T2MONC,T2CHEI,T2CHEF,T2CHEU,T2CLEA) 
VALUES  ('PJ',1,'01','21',101012001000050,149134000,1,0,0,0,'C');

select * from CONTABILID.TAT2CTA where t2cobc = 'PJ';

INSERT INTO GXOPERA.CLPARF (PARCODBCO,PARDESCRI,PARBCOPAI,PARCSWIFT,PARNROCT1,PARTIPCT1,PARMONED1,PARNROCT2,PARTIPCT2,PARMONED2,PARLIBRE1) 
VALUES  ('094','FINANCIERA PARAGUAYO JAPONESA ','2013','FIPJPYPAXXX',2013,'CC','600',0,'  ','   ','');

3)	Bancos

INSERT INTO GXOPERA.TCLSEC (SECCOTRX,SECCOBCO,SECENBCO,SECFEAC,SECUSAC,SECCTABC,SECTPCTA,SECBCPAD,SECBCODE,SECBCDEN,SECCEMN,SECCOEM,SECENBIN) 
VALUES
  ('000054','094','S','20201005','U99HERNAN ','0102184061  ','K',20021,'057',0,5115,'115','627431115'),
  ('000054','094','S','20201005','U99HERNAN ','0102184061  ','K',20021,'057',0,5165,'165','627431165'),
  ('000054','094','S','20201005','U99HERNAN ','0102184061  ','K',20021,'057',0,5166,'166','627431166'),
  ('000054','094','S','20201005','U99HERNAN ','0102184061  ','K',20021,'057',0,5167,'167','627431167'),
  ('000054','094','S','20201005','U99HERNAN ','0102184061  ','K',20021,'057',0,5169,'169','627431169'),
  ('000054','094','S','20201005','U99HERNAN ','0102184061  ','K',20021,'057',0,5170,'170','627431170'),
  ('000054','094','S','20201005','U99HERNAN ','0102184061  ','K',20021,'057',0,5171,'171','627431171'),
  ('000054','094','S','20201005','U99HERNAN ','0102184061  ','K',20021,'057',0,5174,'174','627431174'),
  ('000054','094','S','20201001','U99HERNAN ','0102184061  ','K',20021,'057',0,1002,'002','703002   '),
  ('000054','094','S','20201001','U99HERNAN ','0102184061  ','K',20021,'057',0,1020,'020','703020   ');
  
select * from gxopera.tclsec;
--codigos de trx 
select * from libdebito.TBCTRA0P where txctrx = '000054';

select * from libdebito.drconbep where lidcom in (
'4500159',
'6500170',
'6500171',
'6500172',
'6500173',
'6500174',
'6500175',
'6500176',
'6500177',
'6500178',
'8102656',
'8102657',
'8102658',
'8102659',
'8102660',
'8102661',
'8102662',
'8102664',
'8102665',
'8602144',
'8602145',
'8602147',
'8602148',
'8602149',
'8602150',
'8602151',
'8602153',
'8602154');

update libdebito.drconbep set lenemi = '094' where lenemi <> '094' and lidcom in (
'4500159',
'6500170',
'6500171',
'6500172',
'6500173',
'6500174',
'6500175',
'6500176',
'6500177',
'6500178',
'8102656',
'8102657',
'8102658',
'8102659',
'8102660',
'8102661',
'8102662',
'8102664',
'8102665',
'8602144',
'8602145',
'8602147',
'8602148',
'8602149',
'8602150',
'8602151',
'8602153',
'8602154');


select enemiso from javierlib.comaeaf where cocomer in (
'4500159',
'6500170',
'6500171',
'6500172',
'6500173',
'6500174',
'6500175',
'6500176',
'6500177',
'6500178',
'8102656',
'8102657',
'8102658',
'8102659',
'8102660',
'8102661',
'8102662',
'8102664',
'8102665',
'8602144',
'8602145',
'8602147',
'8602148',
'8602149',
'8602150',
'8602151',
'8602153',
'8602154');

select opadmin from gxopera.opmovi where opfecom = '20210527' group by opadmin;

select * from contabilid.tatgene where TGALFA = 'BA' and tgenti in (select opadmin from gxopera.opmovi where opfecom = '20210527');

select * from gxopera.flicom1 where licomer = '8602150';

select * from gxopera.flicom1 where LICOMER in(
'8601571',
'8601660',
'8601781',
'8601896',
'8601900',
'8602111',
'8602366',
'8602559',
'8602673',
'8602744');

select enemiso, cocomer from gxbdbps.comaeaf where cocomer in (
select licomer from gxopera.flicom1 where LICODTR = '014000') group by enemiso, cocomer;

select * from CONTABILID.TATGENE where tgalfa = 'BA' and tgenti = '066';


select * from gxopera.opmovi where OPCOMER = '8602150';

select * from gxopera.opmovi where OPCOMER in(
'8601571',
'8601660',
'8601781',
'8601896',
'8601900',
'8602111',
'8602366',
'8602559',
'8602673',
'8602744');

select * from libdebito.drconbep where lfcotr = '20210527' and lcodtr = '000054' and lidcom in (
select cocomer from gxbdbps.comaeaf where enemiso = '066');

--lidcom = '8602150'

select * from libdebito.TBCTRA0P where TXCTRX = '014000';

	select * from gxtrjdta.tdspas;

	select * from GXTRJDTA.TDSDPS;

select * from gxfindta.tcltsb;

select * from gxfindta.TCLPFD

select * from gxfindta.TCLPFC
where PFCIDPARM = 'TIPOOPERACION' and PFDIDGRUP = 'OPERACION';

select * from libdebito.drconbep where leca62 like 'VXEVO%' and lerrnb = '111655827954'
