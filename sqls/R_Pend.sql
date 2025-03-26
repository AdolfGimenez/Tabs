--Transacciones en linea--
--resumen--
SELECT COUNT(*) Cantidad, SUM(opimpor) Importe,opmensaj Mensaje,opcodbco Banco FROM gxopera.opliqui WHERE opfecliq >= '20220221'AND   substr (opcampoa,1,6) = '703002' AND
opstat NOT IN ('00','77','88')GROUP BY opmensaj,opcodbco ORDER BY banco DESC, cantidad DESC;
--detalle--
SELECT *FROM gxopera.opliqui WHERE opfecliq >= '20220221' AND substr(opcampoa,1,6) = '703002' AND opstat NOT IN ('00','77','88')--and opcodbco <> 64
ORDER BY opcanrei DESC;
--reporte--
SELECT a.opncomer cod_comercio,b.codeno denominacion,b.corucn ruc,b.enemiso banco_pagador,c.pardescri descripcion_banco,COUNT(*) cantidad_trx,SUM(a.opimpor) monto_total,b.coteln telefono,b.coemail mail
FROM gxopera.opliqui a INNER JOIN gxbdbps.comaeaf b ON a.opncomer = b.cocomer INNER JOIN gxopera.clparf c ON b.enemiso = c.parcodbco WHERE opfecliq >= '20220221' AND substr(opcampoa,1,6) = '703002' AND opstat NOT IN ('00','77','88')
GROUP BY a.opncomer,b.codeno,b.corucn,b.coteln,b.coemail,c.pardescri,b.enemiso;
------------------------------------------------------------------------------------------------------------------------------------------
------------------------------#REINTENTO PAGO A COMERCIOS EN LINEA CON CUENTA EN BNF#
--Ingresar a as400 e ingresar el comando
addlible gxweb *last , edtlibl
--call para AS
SBMJOB CMD(CALL PGM(LIBDEBITO/NCLPR0055) PARM('000023022108511693')) JOB(CLER_BNF) USER(BEPSAUSR)
------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------#PARA VERIFICAR Y PROCESAR EL REINTENTO BBVA GNB#
--Ingresar a as400 e ingresar el comando
addlible gxweb *last , edtlibl
--Call para AS
SBMJOB CMD(CALL PGM(LIBDEBITO/NCLPR0066) PARM('000021120305740181')) JOB(CLER_BBVA) USER(BEPSAUSR)
SELECT 'SBMJOB CMD(CALL PGM(LIBDEBITO/NCLPR0066) PARM(''' || '0000' || OPIDLIQ || ''')) JOB(CLER_BBVA) USER(BEPSAUSR)'
FROM GXOPERA.OPLIQUi
WHERE OPNROREF IN (504748121394, 504748135634, 504748177112, 504748196791, 504748201376, 504748211927, 504748225910);
------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------#REINTENTO PAGO A COMERCIOS EN LINEA CON CUENTA EN CONTINENTAL#
--Ingresar a as400 e ingresar el comando
addlible gxweb *last, edtlibl
--Call para AS
SBMJOB CMD(CALL PGM(LIBDEBITO/NCLR001) PARM('000023022108511693')) JOB(CLER_CONTI) USER(BEPSAUSR)
--Call Auxtiliars
SBMJOB CMD(CALL PGM(LIBDEBITO/NCLR001.2) PARM('000023022108511693')) JOB(CLER_CONTI) USER(BEPSAUSR)
SELECT 'SBMJOB CMD(CALL PGM(LIBDEBITO/NCLR001) PARM(''' || '0000' || OPIDLIQ || ''')) JOB(CLER_CONTI) USER(BEPSAUSR)'
FROM GXOPERA.OPLIQUi
WHERE OPNROREF IN (500229202968, 500229203039, 500229203185, 500229203233, 500229203337, 500229203338, 500229203357, 500229203423, 500229203476, 500229203483, 500229203629, 500229203838, 500329440866, 500329665111, 500329665114, 500329665132, 500329665159, 500329665226, 500329665461, 500329665514, 500329665525, 500329665526, 500329665559, 500329665584, 500329665721, 500329665723, 500329665754, 500329665789, 500329665890, 500329665927, 500329666034, 500329666122, 500329666304, 500329666351, 500329666376, 500329666400, 500329666410, 500329666449, 500329666608, 502236393493);
------------------------------------------------------------------------------------------------------------------------------------------
------------------------------#REINTENTO PAGO A COMERCIOS EN LINEA CON CUENTA EN OTROS BANCOS VIA CONTINENTAL#
--Ingresar a as400 e ingresar el comando
addlible gxweb *last, edtlibl
--Call para AS
SBMJOB CMD(CALL PGM(LIBDEBITO/NCLR001) PARM('000021120605756017')) JOB(CLER_CONTI) USER(BEPSAUSR)
------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------#REINTENTO INDIVIDUAL BANCO RIO#
--Ingresar a as400 e ingresar el comando
addlible gxweb *last, edtlibl
--Call para AS
SBMJOB CMD(CALL PGM(LIBDEBITO/NCLPR0077) PARM('000022102407714978')) JOB(CLER_RIO) USER(QCOMUNICA)
------------------------------------------------------------------------------------------------------------------------------------------
-- REINTENTO MASIVO CONTINENTAL
SBMJOB CMD(CALL PGM(LIBDEBITO/NCLR001) PARM('00010')) JOB(CLER_CONTI) USER(QCOMUNICA) ===> PARAMETRO CANTIDAD REGISTRO A PROCESAR ANTES DEL DELAY
------------------------------------------------------------------------------------------------------------------------------------------
-- Verificaci?n en OPLIQUI
Select * from gxopera.opliqui where opnroref in ('224492238701','224492241451');
-- Verificaci?n en transmisiones
Select * from gxfindta.tcltsb where tsbnref in ('203229429514',
'204532951311');
------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------#Para reprocesar trasmisiones (Pero se debe verificar primero si no se utilizo en un recupero de retenci?n)
--Ingresar a as400 e ingresar el comando
addlible gxweb *last, edtlibl
--Call para AS
CL: CALL PGM(GXFINPGM/PCLR028) PARM(Idopliqui referencia fechaComercial);
CL: CALL PGM(GXFINPGM/PCLR028) PARM('22012906087410 ' '202927496550 ' '20220131');
------------------------------------------------------------------------------------------------------------------------------------------
---FILTRO POR MENSAJE 96
select * from gxopera.opliqui where OPFECLIQ >='20220101' and opstat not in ('00','77','88') and opstatob not in ('00','77','88')
and OPSTAT like '00%'
or OPSTATOB like '96%'
order by opidliq desc;
------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------#Emisor BNF en BNF
select * from gxopera.opliqui where substr(opcampoa,1,6) = '703002' and opcodbco = 002 and OPFECLIQ >='20220101' and opstat in ('00','77','88') and opstatob not in ('00','77','88');
------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------#Emisor BNF en Continental
select * from gxopera.opliqui where substr(opcampoa,1,6) = '703002' and opcodbco = 057 and OPFECLIQ >='20220101' and opstat in ('00','77','88') and opstatob not in ('00','77','88');
------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------#Emisor BNF en BBVA
select * from gxopera.opliqui where substr(opcampoa,1,6) = '703002' and opcodbco = 064 and OPFECLIQ >='20220101' and opstat in ('00','77','88') and opstatob not in ('00','77','88');
------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------#Otros Bancos
select * from gxopera.opliqui where substr(opcampoa,1,6) = '703002' and opcodbco not in ('074','057', '064','002') and OPFECLIQ >='20220101' and opstat in ('00','77','88') and opstatob not in ('00','77','88');
------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------#Para Verificar los reprocesos hechos#
SELECT *FROM gxopera.opliqui WHERE opfecliq >= '20220101' AND substr(opcampoa,1,6) = '703002' AND OPIDLIQ IN (
'22011306010371',
'22011706034033',
'22021406203466',
'22021406203467')
order by OPIDLIQ desc;
------------------------------------------------------------------------------------------------------------------------------------------
/* ---------------------------------#Banco BNF
Select opidliq,substr(opcampoa,41,8)FechaComercial, opfecliq fecha, ophorliq hora, opnroref referencia,opncomer comercio, codeno denominacion, corucn ruc, corazo social, a.enemiso banco, pardescri desbanco, adnumcta cuenta, substr(parcswift,1,8) swift, opimpor Importe, opmensaj Mensaje, opcodbco Banco, opstat EstadoBNF, opstatob estadobco
from gxopera.opliqui inner join gxbdbps.comaeaf a on opncomer = cocomer inner join gxopera.clparf on a.enemiso = parcodbco
where opfecliq >= '20220101' and substr(opcampoa,1,6) = '703002' and enemiso = '002' --and opnroref ='201023243640'
and opstat not in ('00','77', '88') and opstatob not in ('00','77','88')
order by opidliq

--------------------------------#Banco Continental--
Select opidliq,substr(opcampoa,41,8)FechaComercial, opfecliq fecha, ophorliq hora, opnroref referencia,opncomer comercio, codeno denominacion, corucn ruc, corazo social, a.enemiso banco, pardescri desbanco, adnumcta cuenta, substr(parcswift,1,8) swift, opimpor Importe, opmensaj Mensaje, opcodbco Banco, opstat EstadoBNF, opstatob estadobco
from gxopera.opliqui inner join gxbdbps.comaeaf a on opncomer = cocomer inner join gxopera.clparf on a.enemiso = parcodbco
where opfecliq >= '20220101' and substr(opcampoa,1,6) = '703002' and enemiso = '057' --and opnroref = 21120705760624
and opstat not in ('00','77','88') and opstatob not in ('00','77','88')
order by opidliq

--------------------------------#Banco Continental BNF
Select opidliq,substr(opcampoa,41,8)FechaComercial, opfecliq fecha, ophorliq hora, opnroref referencia,opncomer comercio, codeno denominacion, corucn ruc, corazo social, a.enemiso banco, pardescri desbanco, adnumcta cuenta, substr(parcswift,1,8) swift, opimpor Importe, opmensaj Mensaje, opcodbco Banco, opstat EstadoBNF, opstatob estadobco
from gxopera.opliqui inner join gxbdbps.comaeaf a on opncomer = cocomer inner join gxopera.clparf on a.enemiso = parcodbco
where opfecliq >= '20220101' and substr(opcampoa,1,6) = '703002' and enemiso = '002' --and opnroref = 21120705760624
and opstat not in ('00','77','88') and opstatob not in ('00','77','88') and opimpor = '33558'
order by opidliq

--------------------------------#Banco BBVA
Select opidliq,substr(opcampoa,41,8)FechaComercial, opfecliq fecha, ophorliq hora, opnroref referencia,opncomer comercio, codeno denominacion, corucn ruc, corazo social, a.enemiso banco, pardescri desbanco, adnumcta cuenta, substr(parcswift,1,8) swift, opimpor Importe, opmensaj Mensaje, opcodbco Banco, opstat EstadoBNF, opstatob estadobco
from gxopera.opliqui inner join gxbdbps.comaeaf a on opncomer = cocomer inner join gxopera.clparf on a.enemiso = parcodbco
where opfecliq >= '20220101' and substr(opcampoa,1,6) = '703002' and enemiso = '064'
and opstat not in ('00','77','88') and opstatob not in ('00','77','88') --and opimpor = '33558' --and opnroref = 21120605754485
order by opidliq

--------------------------------#Otros Bancos
Select opidliq,substr(opcampoa,41,8)FechaComercial, opfecliq fecha, ophorliq hora, opnroref referencia,opncomer comercio,codeno denominacion, corucn ruc, corazo social, a.enemiso banco, pardescri desbanco, adnumcta cuenta, substr(parcswift,1,8) swift, opimpor Importe, opmensaj Mensaje, opcodbco Banco, opstat EstadoBNF, opstatob estadobco
from gxopera.opliqui inner join gxbdbps.comaeaf a on opncomer = cocomer inner join gxopera.clparf on a.enemiso = parcodbco
where opfecliq >= '20220101' and substr(opcampoa,1,6) = '703002' and enemiso not in ('074','057', '064','002')
and opstat not in ('00','77','88') and opstatob not in ('00','77','88') --and opimpor = '33558'--and opnroref = 21120605754609
order by opidliq

select * from gxopera.opliqui
select * from gxopera.clparf
select * from gxbdbps.comaeaf where enemiso = '002'*/
--------------------------------------
/*call pgm*/
-- replicacion de trx en linea al tclmov
--update GXBDBPS.TSWAUT SET AUTESTCLE='P' WHERE AUTRRNBEP ='309268187565';
-- parametros (nro_referencia, fecha_comercial = AUTTRXFCHC)
CL: CALL PGM(GXFINPGM/PCLR029) PARM('419149549199' '20240709'); -- tener en cuenta que en el tswaut el campo AUTESTCLE='P'

-- pagar una trx en linea 703002 de un comercio cuyo banco es Conti
-- paramtros (id_opliqui, referencia, fecha_comercial)
CL: CALL PGM(GXFINPGM/PCLR028) PARM('23040208782085' '309268187565' '20230403');
SELECT * from LIBDEBITO.logpos0p WHERE ENV512 LIKE '%308865624777%';

CL: CALL PGM(GXPGBPS/APAUT011) PARM('20220915' '2000096372781'); --referencia y fecha LFCOTR del drconbep

CL: CALL PGM(GXFINPGM/PCLR184) PARM('360900075984' '20230215' '');
--carga todas las tablas de las 703020
--parm(in:&AUTRRNBEP, in:&FECPRO, out: &RETORNO);
-- PONER EN P ESTADO DE CLEARING y cambiar la fecha comercial en tswaut y drconbep a la fecha real en la cual se procesa

SELECT AUTRRNBEP, AUTTRXFCHC, AUTESTCLE, T.* FROM GXBDBPS.TSWAUT T WHERE AUTRRNBEP IN ('303648369594');
--AUTRRNBEP AUTTRXFCHCUpdate libdebito.drconbep set lfcotr = '20230309'where lerrnb in
--PARA TENER EN CUENTA, SI ESTA EN TCLMOV TENER EN CUENTA FEPROCESO Y FCREDITO IGUALAR--hoy y mañana tiene que ser siempre que sea fecha comercial

-- journalizar tabla
STRJRNPF FILE(WILLIANLIB/MIGRA_TARJ) JRN(@JOURNAL/QSQJRN)

ver bloqueos
WRKOBJLCK OBJ(LIBDATO/MIGRA_TARJ) OBJTYPE(*FILE)
/********************************/
SELECT * FROM LIBDEBITO.DRCONBEP WHERE LERRNB='301841123554';

SELECT * FROM ADOLFOLIB.AUXILIAR;

update ADOLFOLIB.AUXILIAR set lfectr=lfcotr='20221118';

SELECT * FROM LIBDEBITO.PRUEBCLR;
CLRPFM FILE(LIBDEBITO/PRUEBCLR)
CPYF FROMFILE(ADOLFOLIB/AUXILIAR) TOFILE(LIBDEBITO/PRUEBCLR) MBROPT(*REPLACE)

SBMJOB CMD(CALL PGM(LIBDEBITO/YAPPROD) PARM('20230215' '20230215')) JOB(REINTENTO) JOBQ(QBATCH) USER(QCOMUNICA)
SBMJOB CMD(CALL PGM(LIBDEBITO/YAPPROD) PARM('20230404' '20230404')) JOB(REINTENTO) JOBQ(QBATCH) USER(QCOMUNICA)

select * from libdebito.drconbep where lerrnb = '303648262705';

--REGULARIZACION DE TRX ONLINE QUE NO ESTAN CARGADAS EN OPMOVI (NO DEBE ESTAR CARGADO OPLIQUI)
CL: CALL PGM(GXPGBPS/PSIT008) PARM(&MOVRRNBEP &MOVESTA &Retorno);
--EX:CL: CALL PGM(GXPGBPS/PSIT008) PARM('465201160141' 'A' '');


--REGULARIZACION DE TRX VISION ONLINE QR - CUANDO SE QUEDA SOLO EN TSWAUT (FALTA TCLMOV-OPMOVI-TRANSMISIONES-ETC.)
CL: CALL PG(GXFINPGM/PCLR240) PARM(RRN FECHA);
--EX CL:CALL PG(GXFINPGM/PCLR240) PARM('RRN' 'FECHA');
parm(in:&AUTRRNBEP, in:&FECPRO, out: &IDTRANSMISION, out: &MONTONETO, out:&RETORNO, out:&DESCRETORNO);
---
--87577 Según verificaciones se pudo ver que BNF no fondeo la cuenta continental por ende la trx quedo con error y no se proceso la acreditación
CALL PGM(GXAUTPGM/NAUT033) PARM('1002' 'DIN' '000024122013586731' '000000435522857494' '000054' '000000800743' 'A');
CALL PGM(GXFINPGM/PCLR028) PARM('24122013586731' '435522857494' '20241220');

--actualiza opcampoa para opliqui
Update gxopera.opliqui SET OPCAMPOA = substr(OPCAMPOA, 1 , 16)||'20250320'||SUBSTR(OPCAMPOA, 25 )
WHERE OPNROREF IN  ('504748082755')