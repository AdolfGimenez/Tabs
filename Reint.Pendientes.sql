--Transacciones en linea--
--resumen--
SELECT COUNT(*) Cantidad, SUM(opimpor) Importe,opmensaj Mensaje,opcodbco Banco FROM gxopera.opliqui WHERE opfecliq >= '20220221'AND   substr (opcampoa,1,6) = '703002' AND 
opstat NOT IN ('00','77','88')GROUP BY opmensaj,opcodbco ORDER BY banco DESC, cantidad DESC
--detalle--
SELECT *FROM gxopera.opliqui WHERE opfecliq >= '20220221' AND substr(opcampoa,1,6) = '703002' AND opstat NOT IN ('00','77','88')--and opcodbco <> 64
ORDER BY opcanrei DESC
--reporte--
SELECT a.opncomer cod_comercio,b.codeno denominacion,b.corucn ruc,b.enemiso banco_pagador,c.pardescri descripcion_banco,COUNT(*) cantidad_trx,SUM(a.opimpor) monto_total,b.coteln telefono,b.coemail mail 
FROM gxopera.opliqui a INNER JOIN gxbdbps.comaeaf b ON a.opncomer = b.cocomer INNER JOIN gxopera.clparf c ON b.enemiso = c.parcodbco WHERE opfecliq >= '20220221' AND substr(opcampoa,1,6) = '703002' AND opstat NOT IN ('00','77','88') 
GROUP BY a.opncomer,b.codeno,b.corucn,b.coteln,b.coemail,c.pardescri,b.enemiso
------------------------------------------------------------------------------------------------------------------------------------------
------------------------------#REINTENTO PAGO A COMERCIOS EN LINEA CON CUENTA EN BNF#
--Ingresar a as400 e ingresar el comando
addlible gxweb *last , edtlibl
--call para AS
SBMJOB CMD(CALL PGM(LIBDEBITO/NCLPR0055) PARM('000022090107396725')) JOB(CLER_BNF) USER(BEPSAUSR)
------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------#PARA VERIFICAR Y PROCESAR EL REINTENTO BBVA#
--Ingresar a as400 e ingresar el comando
addlible gxweb *last , edtlibl
--Call para AS
SBMJOB CMD(CALL PGM(LIBDEBITO/NCLPR0066) PARM('000021120305740181')) JOB(CLER_BBVA) USER(BEPSAUSR)
------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------#REINTENTO PAGO A COMERCIOS EN LINEA CON CUENTA EN CONTINENTAL#
--Ingresar a as400 e ingresar el comando
addlible gxweb *last, edtlibl
--Call para AS
SBMJOB CMD(CALL PGM(LIBDEBITO/NCLR001) PARM('000022013106110883')) JOB(CLER_CONTI) USER(BEPSAUSR)  
--Call Auxtiliars
SBMJOB CMD(CALL PGM(LIBDEBITO/NCLR001.2) PARM('000022013006096232')) JOB(CLER_CONTI) USER(BEPSAUSR)
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
SBMJOB CMD(CALL PGM(LIBDEBITO/NCLPR0077) PARM('000021010904084031')) JOB(CLER_RIO) USER(QCOMUNICA)
------------------------------------------------------------------------------------------------------------------------------------------
-- REINTENTO MASIVO CONTINENTAL
SBMJOB CMD(CALL PGM(LIBDEBITO/NCLR001) PARM('00010')) JOB(CLER_CONTI) USER(QCOMUNICA) ===> PARAMETRO CANTIDAD REGISTRO A PROCESAR ANTES DEL DELAY
------------------------------------------------------------------------------------------------------------------------------------------
-- Verificación en OPLIQUI
Select * from gxopera.opliqui where opnroref in ('224492238701','224492241451');
-- Verificación en transmisiones
Select * from gxfindta.tcltsb where tsbnref in ('203229429514',
'204532951311',);
------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------#Para reprocesar trasmisiones (Pero se debe verificar primero si no se utilizo en un recupero de retención)
--Ingresar a as400 e ingresar el comando
addlible gxweb *last, edtlibl
--Call para AS
  CALL PGM(GXFINPGM/PCLR028) PARM(Idopliqui referencia fechaComercial)
CALL PGM(GXFINPGM/PCLR028) PARM('22012906087410 ' '202927496550 ' '20220131')
------------------------------------------------------------------------------------------------------------------------------------------
---FILTRO POR MENSAJE 96
select * from gxopera.opliqui where OPFECLIQ >='20220101' and opstat not in ('00','77','88') and opstatob not in ('00','77','88')
and OPSTAT like '00%' 
or OPSTATOB like '96%' 
order by opidliq desc
------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------#Emisor BNF en BNF
select * from gxopera.opliqui where substr(opcampoa,1,6) = '703002' and opcodbco = 002 and OPFECLIQ >='20220101' and opstat in ('00','77','88') and opstatob not in ('00','77','88')
------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------#Emisor BNF en Continental
select * from gxopera.opliqui where substr(opcampoa,1,6) = '703002' and opcodbco = 057 and OPFECLIQ >='20220101' and opstat in ('00','77','88') and opstatob not in ('00','77','88')
------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------#Emisor BNF en BBVA
select * from gxopera.opliqui where substr(opcampoa,1,6) = '703002' and opcodbco = 064 and OPFECLIQ >='20220101' and opstat in ('00','77','88') and opstatob not in ('00','77','88')
------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------#Otros Bancos
select * from gxopera.opliqui where substr(opcampoa,1,6) = '703002' and opcodbco not in ('074','057', '064','002') and OPFECLIQ >='20220101' and opstat in ('00','77','88') and opstatob not in ('00','77','88')
------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------#Para Verificar los reprocesos hechos#
SELECT *FROM gxopera.opliqui WHERE opfecliq >= '20220101' AND substr(opcampoa,1,6) = '703002' AND OPIDLIQ IN (
'22011306010371',
'22011706034033',
'22021406203466',
'22021406203467')
order by OPIDLIQ desc

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
