Select * from gxfindta.tclprc where prcparm in ('DIEF','REPA');
UPDATE gxfindta.tclprc SET PRCCOD = 'PCLR053'  where prcparm in ('DIEF','REPA');

/*Configuración de Tarifario*/

UPDATE GXFINDTA.TCLCOM   SET COMCOM = 0.99
WHERE SERCODI = 'DINEFE' AND   PRECODI = 'DIEF' AND COMTPCO = 'P';


/*Comision por participante - Dinelco Efectivo (Obtiene comision delservicio de comercios GXBDBPS/COMAEXD)*/

sELECT * FROM GXFINDTA.TCLCPP where sercodi = 'DINEFE' and cpptiaf = 'C';
Update GXFINDTA.TCLCPP set cpptico = 'C' where sercodi = 'DINEFE' and cpptiaf = 'C';


/*Comision por participante - Red de Pagos (Obtiene comision del servicio de comercios GXBDBPS/COMAEXD)*/

sELECT * FROM GXFINDTA.TCLCPP where sercodi = 'REDPAG' and cpptiaf = 'C';
Update GXFINDTA.TCLCPP set cpptico = 'C' where sercodi = 'REDPAG' and cpptiaf = 'C';


/*Comision por participante - Red de Pagos (Obtiene Comision Emisor de Tabla ComisionEntidad GXTRJDTA.TDGECO)*/

sELECT * FROM GXFINDTA.TCLCPP where sercodi = 'REDPAG' and cpptiaf = 'D';
Update GXFINDTA.TCLCPP set cpptico = 'E' where sercodi = 'REDPAG' and cpptiaf = 'D';


/*Inserta Comision para la Entidad BNF*/

INSERT INTO GXTRJDTA.TDGECO
(  ENTCODENT, ECOENTROL, DPVIDDISPV, ENSIDSERV, ECOIDPRES, ECOVIGCOMI, ECOTPOCOMI, ECOIVAINCL, ECOVALCOMI, ECOMINCOMI, ECOMAXCOMI, ECOUSULTUP, ECOFHULTUP, ROLIDROL)
VALUES
(1002, 100201, 'POS  ', 'REDPAG    ', 'REPA', '20200710', 'P', 'S', 0.8000, 0.0000, 0.0000, 'MIGRACION ', '2020-07-10 23:55:00.000', 1);

CREATE INDEX GXBDBPS.COMA1L8
   ON GXBDBPS.COMA1AF (COPRCODI ASC, PRCODI ASC);
   


select *from gxbdbps.tlogsaf where lstipro= 'CLEA' and lsfecha= '20200924'
order by lshora desc

select * from gxopera.opago1p

select * from  gxbdbps.tmoviaf where mvfepro='20200928' and mvemiso in ('332','002','347') and cmcodig in('005','007') and mvcodre=0

select * from  gxbdbps.tcuotaf where cucodau in ('876564','846182') and cufecom='20200928'


select * from gxbdbps.thmovaf where hmfepro='20200928' and hmemiso in ('021','312') and hmcodig='005'

update gxbdbps.tmoviaf set mvfepro='20200925' where mvfepro='20200928' and mvferea='20200925' and mvemiso in ('530','332','002','312','347','319') and cmcodig in('005','007') and mvcodre=0 and mvhora<190000

select * from gxbdbps.tcuotaf where cucodau in ('876564','846182') and cufecom='20200928'

update gxbdbps.tcuotaf set cufecom='20200925' where cucodau in ('876564','846182') and cufecom='20200928'

select * from gxbdbps.thmovaf where hmfepro='20200928' and hmemiso in ('021','312') and hmcodig='005'

select * from gxbdbps.thmovaf where hmfepro='20200928' and hmemiso in ('021','312') and hmcodig='005'

select * from gxbdbps.thmovaf where hmfepro='20200928' and hmemiso in ('021','312') and hmcodig='005' and hmhora<190000


select * from gxbdbps.thmovaf where hmfepro='20200928' and hmemiso in ('021','312') and hmcodig='005' and hmhora<190000 

update gxbdbps.thmovaf set hmfepro='20200925' where hmfepro='20200928' and hmemiso in ('021','312') and hmcodig='005' and hmhora<190000 


select * from gxbdcon.gxlofun where siscodi='CL'

select * from gxbdcon.gxloperdet where usucod='777' and siscodi='CL'



INSERT INTO GXTRJDTA.TCOENC (ENCENTACT,ENCENTANT, ENCUSULTUP, ENCFHULTUP, ENCENTROL)
VALUES (1043, '083', 'MIGRACION ', '2020-10-01 19:35:20.011', 104304);

Update gxfindta.tcltsb set tsbesta = 'PE', tsbbacr = 1043, tsbcodswc = 'BCOPPYPA' where tsbbacr = 83;

select * from libdebito.drconbep where lfcotr='20201012' and lcodtr in ('370000', '380000', '390000')


Select lfcotr Fcomercial,lenemi emisor, count(*) cantidad, sum(limpgs)importe from libdebito.drconbep 
where lfcotr > '20200301' and lcodtr in ('000052','000072','567102') and substr(lidtra,1,1) = 'P' and lesttr='A' and lcretr='00' group by lfcotr, lenemi

select [4:07] Willian Reinaldo Arce Zarate
    select *from gxbdbps.tlogsaf where lstipro= 'CLEA' and lsfecha= '20201013'
order by lshora desc

Select lenemi Emisor, count(*) Cantidad, sum(limpgs)Monto FROM libprod.DRCONBE60 WHERE LFCOTR = '20201020' AND LENEMI IN ('581','571','591')AND LCRETR = '00' AND LESTTR = 'A'
AND LIMPGS > 0 and lcodtr in ('000052','567102','000072','000054') and SUBSTR(LIDTRA,1,1) <> 'T' group by lenemi;


select * from gxfindta.tcltsb where tsbidop = 223006;
Update gxfindta.tcltsb set tsbbacr = 1020, tsbctcr = '4604447832', tsbtpcr = 'CC', tsbdene = 'FARMACIA KANEKO', tsbidtpdoc = 'RUC', tsbnrodoc = '80052579-5', tsbdoccom = '80052579-5'
where tsbidop = 223006;


select * from gxopera.trxinst where insemiso='064' 

delete gxopera.trxinst where insemiso='064' 

select * from gxopera.trxinst where insemiso='002' 

delete gxopera.trxinst where insemiso='002' 

Select * from contabilid.tatgene where tgalfa = 'BA'


select tsbidop, tsbcoco, tsbdene, tsbbacr, tsbctcr, tsbtpcr, tsbdene, tsbidtpdoc, tsbnrodoc, tsbdoccom from gxfindta.tcltsb where tsbidop = 204663;
Update gxfindta.tcltsb set tsbesta = 'PE', tsbbacr = 1020, tsbctcr = '0501847067', tsbtpcr = 'CC', tsbdene = 'PUNTO FARMA CASA CENTRAL', tsbidtpdoc = 'RUC', tsbnrodoc = '80022877-4', tsbdoccom = '80022877-4'
where tsbidop = 204663;




Select cocomer, codeno, corazo, adnumcta from gxbdbps.comaeaf where cocomer = '0700939';
Update gxbdbps.comaeaf set adnumcta = '2400307363' where cocomer = '0700939';

Select * from gxfindta.tcltsb where tsbcoco = '0700939' and tsbesta <> 'AC';
Update gxfindta.tcltsb set tsbctcr = '2400307363', tsbidtpdoc = 'RUC', tsbnrodoc = '928808-2', tsbesta = 'PE', tsbmotivo = 'CORRECCION TIPO DOC, DOC Y CTA.' where tsbcoco = '0700939' and tsbesta <> 'AC';


Select * from gxbdbps.mtdfic 

Select * from GXFINDTA.tcltsb

Select * from gxbdbps.tdcta where tdctanro='1424188911'

select * from gxbdbps.tdbinemb where tdcodemb = 'VSD001' and TDENTID='1020'


Update gxfindta.tcltsb set tsbesta = 'PE', tsbbacr = 1020, tsbctcr = '5228968314', tsbtpcr = 'CA', tsbdene = 'UNO-D', tsbidtpdoc = 'RUC', tsbnrodoc = '80022282-2', tsbdoccom = '80022282-2'
where tsbidop = 254250;


select opcomer, sum(opmonto-opcomi), opfecom from gxopera.opmovi where opcomer='0302223'
and opfecom>'20201100'
group by opcomer, opfecom


select * from gxopera.opmovi where opcomer='0302223'
and opfecom='20201109'


select * from gxopera.opmovi where opcomer='0302223'
and li='20201109'
group by opcomer, opfecom

select * from gxopera.flicom1 where licomer='0302223' and lifechd='20201117'

select * from gxopera.OPAGO0PH

select * from gxopera.factura where faclien='4500006' and FACTNRO='10030046952'

update gxopera.factura set FACSTATUS='P'
where faclien='4500006' and FACTNRO='10030046952'



select * from gxopera.factura1 where faclien='4500006'

UPDATE GXFINDTA.TCLTSB
SET TSBESTA = 'PE',
TSBMOTIVO = 'CASO TIME OUT SOCKET'
WHERE TSBESTA = 'RE' and TSBCOME = '998'



