--TRX On-US Fase 2 Mastercard #12143
--drconbep
select * from libdebito.drconbep where lfectr = '20210222' and lbinpr = '514848' and leca62='T002' order by lhortr desc;

select lctaor CUENTA_OR, lctade CUENTA_DE, lnrtar NUMERO_TARJETA, lbinpr BIN, lcodbc MARCA, lfectr FECHA_TRX, lhortr HORA, limpgs IMPORTE, lsaltr SALDO_TRX, lcuota CUOTAS,
lcodtr COD_TRX, lcautr COD_AUTORIZACION, lcretr COR_RETORNO, lesttr ESTADO_TRX, lerrnb RRN, lcotel NUMERO_TELEFONO 
 from libdebito.drconbep where lfectr = '20210222' and lbinpr = '514848' and leca62='T002' order by lhortr desc;

--tswaut
select * from gxbdbps.tswaut where AUTRRNBEP in (
select LERRNB from libdebito.drconbep where lfectr = '20210222' and lbinpr = '514848' and leca62='T002' order by lhortr desc
);

select  autbinadq BIN_ADQ, autbinemi BIN_EMISOR, autcantcuo CUOTAS, autcodser SERVICIO, autcodpre PRESTACION, autdistip DISPOSITIVO,
autmartar MARCA, autprotar PRODUCTO, autmontdes IMPORTE, autmtimi MTI, autpannro TARJETA, autrolbep ROL, autrrnbep RRN, autteldes TELEFONO,
auttrxcod COD_TRX, auttrxestf ESTADO_TRX, autestrev REVERSADO_S_N
from gxbdbps.tswaut where AUTRRNBEP in (
select LERRNB from libdebito.drconbep where lfectr = '20210222' 
and lbinpr = '514848' and leca62='T002');

SELECT * FROM MASTERCARD.MASCTLDTA WHERE MCRRNBEPSA IN(
select LERRNB from libdebito.drconbep where lfectr = '20210322' 
and lbinpr = '514848' and leca62='T002'
);

SELECT * FROM MASTERCARD.MASTRNDTA WHERE MCRRNBEPSA IN(
select LERRNB from libdebito.drconbep where lfectr = '20210322' 
and lbinpr = '514848' and leca62='T002'
);

select tsbidop ID, tsbcoco, tsbdene, tsbnref REFERENCIA, tsbtpop CODIGO, tsbdeop OPERACION, TSBCTDE, TSBCTCR, tsbdeme MENSAJE,
tsbfege FECHAINSERT, tsbfeac FECHAUPDATE,  TSBCODSWC
 from gxfindta.tcltsb where substr (TSBCODSWC,1,4)= 'BGNB';

--ULTIMAS PRUEBAS DEL 24 Y 25

select * from libdebito.drconbep where lbinpr = '514848' and leca62='T002' and lfectr in ('20210224','20210225');

select lctaor CUENTA_OR, lctade CUENTA_DE, lnrtar NUMERO_TARJETA, lbinpr BIN, lcodbc MARCA, lfectr FECHA_TRX, lhortr HORA, limpgs IMPORTE, lsaltr SALDO_TRX, lcuota CUOTAS,
lcodtr COD_TRX, lcautr COD_AUTORIZACION, lcretr COR_RETORNO, lesttr ESTADO_TRX, lerrnb RRN, lcotel NUMERO_TELEFONO, lenemi ENTIDAD 
from libdebito.drconbep where lbinpr = '514848' and lfectr = '20210406';

SELECT autbinadq BIN_ADQ, autbinemi BIN_EMISOR, autcantcuo CUOTAS, autcodser SERVICIO, autcodpre PRESTACION, autdistip DISPOSITIVO,
autmartar MARCA, autprotar PRODUCTO, autmontdes IMPORTE, autmtimi MTI, autpannro TARJETA, autrolbep ROL, autrrnbep RRN, autteldes TELEFONO,
auttrxcod COD_TRX, auttrxestf ESTADO_TRX, autestrev REVERSADO_S_N, AUTTRXHORF HORA, AUTTRXFCHC FECHA
FROM GXBDBPS.TSWAUT WHERE AUTRRNBEP IN (
select LERRNB from libdebito.drconbep where lbinpr = '514848' and leca62='T002' and lfectr = '20210406');


--TRANSACCIONES INGRESADAS CON ROL SWT
select TXCTRX COD_TRX, TXDTRX DESCRIPCION from libdebito.TBCTRA0P WHERE TXCTRX IN (
SELECT AUTTRXCOD FROM GXBDBPS.TSWAUT WHERE AUTRRNBEP IN (
select LERRNB from libdebito.drconbep where lbinpr = '514848' and leca62='T002' and lfectr in ('20210406') AND AUTROLBEP = 'SWT'));

--TRANSACCIONES INGRESADAS CON ROL ISA
select TXCTRX COD_TRX, TXDTRX DESCRIPCION from libdebito.TBCTRA0P WHERE TXCTRX IN (
SELECT AUTTRXCOD FROM GXBDBPS.TSWAUT WHERE AUTRRNBEP IN (
select LERRNB from libdebito.drconbep where lbinpr = '514848' and leca62='T002' and lfectr in ('20210406') AND AUTROLBEP = 'ISA'));

select * from gxtrjdta.tdgbin where binnrobin = '514848';

select lerrnb, lfcotr,lcodtr,lcodbc, lenemi, autrolbep, lcretr, lesttr from libdebito.drconbep 
inner join gxbdbps.tswaut on lerrnb = autrrnbep where lfectr = '20210406' and lbinpr = '514848';

select * from gxfindta.tclpre where PREMATRX in ('920000');
    SELECT autbinadq BIN_ADQ, autbinemi BIN_EMISOR, autcantcuo CUOTAS, autcodser SERVICIO, autcodpre PRESTACION, autdistip DISPOSITIVO,
autmartar MARCA, autprotar PRODUCTO, autmontdes IMPORTE, autmtimi MTI,AUTCODRET , autpannro TARJETA, autrolbep ROL, autrrnbep RRN, autteldes TELEFONO,
auttrxcod COD_TRX, auttrxestf ESTADO_TRX, autestrev REVERSADO_S_N, AUTTRXFCHI,AUTTRXHORI
FROM GXBDBPS.TSWAUT WHERE AUTRRNBEP IN (
select LERRNB from libdebito.drconbep where lbinpr = '514848' and leca62='T002' and lfectr = '20210406') order by AUTTRXFCHI,AUTTRXHORI;


select * from gxfindta.ccasi21 order by asnras asc;
select * from contabilid.ccasi21;

select * from libdebito.TBCTRA0P where TXCTRX = '014000';

SELECT * FROM LIBDEBITO.DRCONBEP WHERE LFECTR = '20210505' ORDER BY LHORTR DESC;

select * from gxbdbps.tswaut where auttrxfchc = '20210505';


--15993

 SELECT * FROM  gxswtdta.IPMDTA WHERE ipmfname='12306111119117561640229';
 SELECT * FROM  gxswtdta.IPMDTA WHERE IPMARN='12306111138134609273035';
 SELECT * FROM  gxbdbps.IPMDTA WHERE IPMARN='12306111138134609273035';

select * from gxswtdta.ipmfctl where ipmfcname like 'R119%';  

select * from gxbdbps.ipmfctl where ipmfcname in ('R111113807','R111114425');      	 	          
select * from gxswtdta.ipmfctl where ipmfcname in ('R111113807','R119114425');

update gxbdbps.ipmdta set IPMFNAME = 'R111114425' where IPMFNAME = 'R119114425';
update gxbdbps.ipmdtae set IPMFNAME = 'R111114425' where IPMFNAME = 'R119114425';
update gxbdbps.ipmdtaep set IPMFNAME = 'R111114425' where IPMFNAME = 'R119114425';

select * From gxswtdta.ipmfctl where ipmfcins = '20210518';
SELECT * From GXSWtDTA.IPMDTA WHERE IPMFNAME in ('R111114425', 'R111113807');

select * From gxswtdta.ipmfctl where ipmfcins = '20210518' and ipmfcname like 'R111%' AND IPMfcmemb = 'ICA19696'
SELECT * From GXSWtDTA.IPMDTA WHERE IPMFNAME = 'R111114425' AND IPMFEC = '20210518' AND IPMICA= '19696' AND IPMMSGSENT = 'R'

select * from gxbdbps.nut999;

select * from gxswtdta.nut99;




***
*** Consideraciones para el Test de MAIP111RG
***

1. Pasar los programas:
   * PGM(MASTERCARD/MAIPR111CT)  " en produccion es el MAIPR111CR, pero para Test usar MAIPR111CT
     porque este programa/comando, podria enviar a MASTERCARD el OutGoing como Produccion
     con lo que implicaria un Problema

     PGM(MAIP111H) PARM(&TIPOREG)    /* GENERA EL ARCHIVO HEADER      */            
     PGM(MAIP111FN) PARM(&BULKFILEN) /* GENERA EL NOMBRE DEL BULKFILE */       
     PGM(MAIP111TRG) PARM(&TIPOREG)  /* GENERA EL TRAILER             */                   
     PGM(MAIP111RG) PARM(&BULKFILEN) /* GENERA EL ARCHIVO IPM         */   <=== Programa Modificado
 
2. Verificar el Data Ara, que indica si esta para Produccion o Testing
     WRKDTAARA MASTERCARD/MASENV 
     opcion 5, ver el contenido
     Debe ser 'T' , si no es... cambiarlo a 'T' ... es fundamental para el Testing 

3. Obtener de produccion los archivos
     R111xxxxxx y su Correspondiente T113xxxx

4. Obtener de Produccion los Archivos
   GXBDBPS/IPMDTA, IPMDTAE, IPMDTAEP.
   GXBDBPS/IPMDTAT, IPMDTATE, IPMDTATEP.   

5. Cambian el campo de la tabla IPMDTAT, IPMMSGREP = 'S' del IPMFNAME = 'T113XXXXX', para que reprocese 
   y pueda pasar los registros a IPMDTA, E y EP.
   UPDATE GXBDBPS/IPMDTAT SET IPMMSGREP = 'S' WHERE SUBSTR( IPMFNAME, 1)='T113xxxxx' and IPMMTI = 1240   ;

6. Ejecutar el programa MASTERCARD/MAIPR111CT

7. Verificar la tabla IPMDTA, con algun ARN que estaba en ambos OutGoing. (R111xxxx y T113xxxx)
   SELECT * FROM  GXBDBPS.IPMDTA WHERE IPMARN='12306111119117561640229'; 
   resultado:
   19696	12306111119117561640229	1240	200	20210429	O	R111111970	O	0
   19696	12306111119117561640229	1240	200	20210429	R	R119113133	O	0    <== el registro incorporado por MAIP111RG


*****

 SELECT * FROM  GXBDBPS.IPMDTA WHERE IPMARN='12306111119117561640229';


