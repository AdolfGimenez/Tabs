SHOW FULL PROCESSLIST;
SHOW PROCESSLIST;
/*En la columna State tiene que decir = Locked si está bloqueado y en la columna Info muestra la query que está ejecutando-.*/
SELECT *
FROM INFORMATION_SCHEMA.PROCESSLIST;/*--Esto muestra casi lo mismo...*/
SHOW INDEX FROM K2B_PROD.ASIENTOCONTABLE;
/*--muestra los índices creados sobre la tabla que quieras consultar...*/
--
SHOW ENGINE INNODB STATUS;
SHOW ENGINE INNODB STATUS;
--
SELECT NOW();/*ver la hora de la db*/
SET GLOBAL general_log = 1; /*activar log*/
SELECT VERSION();
-- ver version mysql
#para ver tamaño de tablas
/*--**Tamaño de Tablas en la BD**--*/
SELECT T.TABLE_SCHEMA AS BD, T.TABLE_NAME AS TABLA, ROUND((T.DATA_LENGTH + T.INDEX_LENGTH) / 1024 / 1024, 2) AS TAMAÑO_MB,
ROUND((T.DATA_LENGTH + T.INDEX_LENGTH) / 1024 / 1024 / 1024, 2) AS TAMAÑO_GB
FROM INFORMATION_SCHEMA.TABLES T
ORDER BY (T.DATA_LENGTH + T.INDEX_LENGTH) DESC;
#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*Sentencia para actualización de fechas de Activo Fijo K2B*/
UPDATE BIENACTIVOFIJO
SET BIENACTIVOFIJOFECHAACTIVACION = BIENACTIVOFIJOFECHAADQUISICION
WHERE BIENACTIVOFIJOFECHAADQUISICION >= '2021-01-01'
  AND BIENACTIVOFIJOFECHAADQUISICION > BIENACTIVOFIJOFECHAACTIVACION;
#---------------------------------------------------------------------------------------------------------------
/*----UPDATE para corregir configuración módulo de planificación K2B*/
UPDATE ITEMAFECTACIONAFECTABLE
SET ITEMAFECTABLEMODOAFECTACION = 'DIRECTO'
WHERE ITEMAFECTABLEMODOAFECTACION = 'INDIRECTO'
  AND TIPOAFECTACIONCODIGO = 'PRESUPUESTAL';
UPDATE ITEMCOSTORESTRICCION
SET ITEMCOSTORESTITEMAFECTABLEMODO = 'DIRECTO'
WHERE ITEMCOSTORESTITEMAFECTABLEMODO = 'INDIRECTO'
  AND ITEMCOSTORESTTIPOAFECTACIONCOD = 'PRESUPUESTAL';
/*realizamos un cambio con el proveedor Repair-SMD #43969*/
UPDATE ITEMAFECTACIONAFECTABLE
SET ITEMAFECTABLEPRESUPUESTOHABILI = 1
WHERE ITEMAFECTABLEPRESUPUESTOHABILI = 0
  AND TIPOAFECTACIONCODIGO = 'PRESUPUESTAL';
/*para validar una solución a un error de POS*/
SELECT *
FROM MOVIMIENTOSTOCK M,
     MOVIMIENTOSTOCKDETALLE D,
     MOVIMIENTOSTOCKINVENTARIO MI
WHERE MI.MOVSTOCKID = D.MOVSTOCKID
  AND MI.MOVSTOCKDETID = D.MOVSTOCKDETID
  AND D.MOVSTOCKID = M.MOVSTOCKID
  AND MOVSTOCKESTADOPROCESOINGRESO = 'NoCompletado';
/*--Habilitacion de notificaciones por correo: solicitudes de fondos*/
SELECT WFPRCID, WFTASKCOD, WFTASKNAME, WFTASKDSC, WFTASKEMAIL
FROM WFTASK
WHERE WFPRCID = 47
  AND WFTASKCOD IN (22, 29, 184, 204);
UPDATE WFTASK
SET WFTASKEMAIL ='Y'
WHERE WFPRCID = 47
  AND WFTASKCOD IN (22, 29, 184, 204);
/*---Sentencia para actualización de fechas de Activo Fijo K2B*/
UPDATE BIENACTIVOFIJO
SET BIENACTIVOFIJOFECHAACTIVACION = BIENACTIVOFIJOFECHAADQUISICION
WHERE BIENACTIVOFIJOFECHAADQUISICION >= '2021-01-01'
  AND BIENACTIVOFIJOFECHAADQUISICION > BIENACTIVOFIJOFECHAACTIVACION;
/*---Con referencia al problema con el deposito Lo que se debe hacer para solucionar esto es modificar por BD el tipo de depósito*/
UPDATE DEPOSITO
SET TIPODEPOSITOCODIGO = 'TRANSITO'
WHERE DEPOSITOID = 56
  AND DEPOSITONOMBRE LIKE 'Transito%';
/*Y  lo que me pidieron recalcar es : El depósito de tipo Transito sirve para mostrar que el material está en viaje desde CA origen a uno de destino. No se debe permitir cambiar el tipo o eliminar depósitos en Tránsito
Todos los CA deben tener un solo depósito de tipo Tránsito.*/
/*-------------------------------------------------------------------------------------------*/
/*Con este cambio la misma dejará de reservar stock cada vez que se realice un movimiento utilizando la misma.*/
/*1.*/
UPDATE TIPOTRANSACCIONSTOCK
SET TIPOTRNSTKTIPOSTKRESERVACODIGO = NULL
WHERE TIPOTRNSTKCODIGO = 'TRANSFERENCIA';
/*2.*/ UPDATE TIPOTRANSACCIONSTOCK
       SET TIPOTRNSTKRESERVA = 0
       WHERE TIPOTRNSTKCODIGO = 'TRANSFERENCIA';
/*-------------------------------------------------------------------------------------------*/
SET GLOBAL general_log = 1;
SET GLOBAL LOG_OUTPUT = 'TABLE';
SET GLOBAL slow_query_log = 'ON';

SELECT *
FROM MYSQL.GENERAL_LOG GL;
TRUNCATE MYSQL.GENERAL_LOG;

SELECT *
FROM INFORMATION_SCHEMA.TRIGGERS;
#----
SELECT COUNT(1),
       A.ASIENTOPERIODOCIERREID,
       (SELECT PP.PERIODOCODIGO
        FROM PERIODO PP
        WHERE PP.PERIODOID IN (SELECT P.PERIODOID FROM PERIODOCIERRE P WHERE P.PERIODOCIERREID = A.ASIENTOPERIODOCIERREID)) PERIODO_DESCRI
FROM ASIENTOCONTABLE A
WHERE A.ASIENTOFECHA BETWEEN '2023-08-01' AND '2023-08-31'
GROUP BY A.ASIENTOPERIODOCIERREID
UNION
SELECT COUNT(1),
       A.ASIENTOPERIODOCIERREID,
       (SELECT PP.PERIODOCODIGO
        FROM PERIODO PP
        WHERE PP.PERIODOID IN (SELECT P.PERIODOID FROM PERIODOCIERRE P WHERE P.PERIODOCIERREID = A.ASIENTOPERIODOCIERREID)) PERIODO_DESCRI
FROM ASIENTOCONTABLE A
WHERE A.ASIENTOFECHA BETWEEN '2023-09-01' AND '2023-09-30'
GROUP BY A.ASIENTOPERIODOCIERREID
UNION
SELECT COUNT(1),
       A.ASIENTOPERIODOCIERREID,
       (SELECT PP.PERIODOCODIGO
        FROM PERIODO PP
        WHERE PP.PERIODOID IN (SELECT P.PERIODOID FROM PERIODOCIERRE P WHERE P.PERIODOCIERREID = A.ASIENTOPERIODOCIERREID)) PERIODO_DESCRI
FROM ASIENTOCONTABLE A
WHERE A.ASIENTOFECHA BETWEEN '2023-10-01' AND '2023-10-31'
GROUP BY A.ASIENTOPERIODOCIERREID;

#------------------------------------------------------------
SELECT *
FROM BIENACTIVOFIJO B
WHERE BIENACTIVOFIJOPRODUCTOID IN (2756, 3642);
#------------------------------------------------------------
SELECT *
FROM `PERIODOCIERRE`
WHERE PERIODOCIERREID IN (SELECT PERIODOCIERREID FROM `EJERCICIOCONTABLEPERIODOCIERRE` WHERE EJERCICIOCONTABLEID = 4);
#habilita extorno
UPDATE `TIPOTRANSACCION`
SET TIPOTRANSACCIONMODOEJECUCION = 'INTERACTIVA'
WHERE `TIPOTRANSACCIONCODIGO` IN ('CIERRERESULTADOS');
#desabilita extorno
UPDATE `TIPOTRANSACCION`
SET TIPOTRANSACCIONMODOEJECUCION = 'BATCH'
WHERE `TIPOTRANSACCIONCODIGO` IN ('CIERRERESULTADOS');

DELETE
FROM SALDOCONTABLE
WHERE SALDOCONTABLEPERIODOID = 126;
SELECT *
FROM SALDOCONTABLE
WHERE SALDOCONTABLEPERIODOID = 126;

SHOW VARIABLES LIKE '%max_allowed_packet%';

SET GLOBAL max_allowed_packet = 3221225472;

#---query mayor
SELECT T1.`CUENTAAUXCONTABLEID`, T1.`CENTROCOSTOID`, T1.`ITEMPROYECTOID`, T1.`CUENTACONTABLEID`, T8.`ASIENTOEMPID`, T1.`CRITERIOCONTABLECODIGO`, T8.`ASIENTOESTADO`, T9.`TIPOTRANSACCIONMODOEJECUCIONBA` AS TIPOASIENTOMODOEJECUCIONBATCHC, T8.`ASIENTOFECHA`, T1.`MONEDACODIGO`, T5.`CUENTACONTABLECODIGO`, T7.`TIPODOCUMENTOCODIGO`            AS ASIENTODETTIPODOCUMENTOCODIGO, T10.`TIPODOCUMENTOCODIGO`           AS ASIENTOTIPODOCUMENTOCODIGO, T1.`ASIENTODETOBSERVACIONES`, T8.`ASIENTOOBSERVACIONES`, T9.`TIPOTRANSACCIONNOMBRE`          AS TIPOASIENTODESCRIPCION, T1.`ASIENTODETVTOFINANCIERODOCUMEN`, T1.`ASIENTODETFECHAVALOR`, T2.`CUENTAAUXCONTABLEDESCRIPCION`, T4.`ITEMPROYECTONOMBRE`, T3.`CENTROCOSTONOMBRE`, T6.`MONEDASIMBOLO`, T1.`ASIENTODETIMPCALMONEDAORIGEN`, T8.`ASIENTONUMERO`, T8.`TIPOASIENTOCODIGO`              AS TIPOASIENTOCODIGO, T8.`ASIENTOTIPODOCUMENTOID`         AS ASIENTOTIPODOCUMENTOID, T10.`ENTIDADCODIGO`                 AS ASIENTOENTIDADCODIGO, T8.`ASIENTODOCUMENTOID`, T8.`ASIENTODOCUMENTOCODIGOEXTERNO`, T10.`TIPODOCUMENTOINTERNOK2B`       AS ASIENTOTIPODOCUMENTOINTERNOK2B, T1.`ASIENTODETTIPODOCUMENTOID`      AS ASIENTODETTIPODOCUMENTOID, T7.`ENTIDADCODIGO`                  AS ASIENTODETENTIDADCODIGO, T1.`ASIENTODETDOCUMENTOID`, T1.`ASIENTODETDOCUMENTOCODIGOEXTER`, T7.`TIPODOCUMENTOINTERNOK2B`        AS ASIENTODETTIPODOCUMENTOINTERNO, T1.`ASIENTODETIMPORTEMONEDACONSOLI`, T1.`ASIENTODETIMPORTEMONEDAEXTRANJ`, T1.`ASIENTODETTIPOMOVIMIENTO`, T1.`ASIENTODETIMPORTEMONEDALOCAL`, T8.`ASIENTOEXTORNO`, T1.`ASIENTOID`, T1.`ASIENTODETID`
FROM (((((((((`ASIENTOCONTABLEDETALLE` T1 LEFT JOIN `CUENTAAUXILIARCONTABLE` T2 ON T2.`CUENTAAUXCONTABLEID` = T1.`CUENTAAUXCONTABLEID`) LEFT JOIN `CENTROCOSTO` T3 ON T3.`CENTROCOSTOID` = T1.`CENTROCOSTOID`) LEFT JOIN `ITEMPROYECTO` T4 ON T4.`ITEMPROYECTOID` = T1.`ITEMPROYECTOID`) INNER JOIN `CUENTACONTABLE` T5 ON T5.`CUENTACONTABLEID` = T1.`CUENTACONTABLEID`) INNER JOIN `MONEDA` T6 ON T6.`MONEDACODIGO` = T1.`MONEDACODIGO`) LEFT JOIN `TIPODOCUMENTO` T7
         ON T7.`TIPODOCUMENTOID` = T1.`ASIENTODETTIPODOCUMENTOID`) INNER JOIN `ASIENTOCONTABLE` T8 ON T8.`ASIENTOID` = T1.`ASIENTOID`) INNER JOIN `TIPOTRANSACCION` T9 ON T9.`TIPOTRANSACCIONCODIGO` = T8.`TIPOASIENTOCODIGO`) LEFT JOIN `TIPODOCUMENTO` T10 ON T10.`TIPODOCUMENTOID` = T8.`ASIENTOTIPODOCUMENTOID`)
WHERE (T1.`CUENTACONTABLEID` IN (157, 156))
  #AND (T8.`ASIENTOEMPID` = 1)
  AND (T1.`CRITERIOCONTABLECODIGO` = 'DEV')
  AND (T8.`ASIENTOESTADO` = 'ACT')
  AND (T8.`ASIENTOFECHA` >= '2024-09-01')
  AND (T8.`ASIENTOFECHA` <= '2024-09-30')
  AND T8.ASIENTONUMERO = 121782
ORDER BY T8.`ASIENTOFECHA`, T8.`TIPOASIENTOCODIGO`, T8.`ASIENTONUMERO`;

#-------DEPURAR SIMULACRO
TRUNCATE TABLE K2B_PROD.INSTANCIAPROCESO;
#k2b_prod.entidadinstanciadatosadjuntos
#k2b_prod.instanciaproceso;

#Monitorea el uso con:
SHOW ENGINE INNODB STATUS;
#y ajusta si ves que el pool no se utiliza completamente o hay demasiadas lecturas de disco.
#--------------------------------------
#Usa este comando para analizar la eficiencia de la Query Cache:
SHOW STATUS LIKE 'Qcache%';
#Revisa valores como Qcache_hits y Qcache_inserts para ver cuántas consultas se benefician de la caché.
SELECT USER, HOST, PLUGIN
FROM MYSQL.USER
WHERE USER = 'root';

#PERMISO ROOT
GRANT ALL PRIVILEGES ON K2B_PROD_GAM.* TO 'ROOT'@'%';
FLUSH PRIVILEGES;

#movimiento stock
SELECT T1.`MOVSTOCKTIPOMOVIMIENTO`, T1.`MOVSTOCKCENTROALMACENAJEID`, T1.`MOVSTOCKEMPRESAID`, T1.`MOVSTOCKFECHA`, T1.`MOVSTOCKPERSONAID`          AS MOVSTOCKPERSONAID, T1.`MOVSTOCKESTADOPROCESOINGRESO`, T1.`MOVSTOCKFECHAVALOR`, T2.`PERSONANOMBRE`              AS MOVSTOCKPERSONANOMBRE, T3.`TIPOTRANSACCIONNOMBRE`      AS MOVSTOCKTIPOTRNSTKNOMBRE, T1.`MOVSTOCKCODIGO`, T1.`MOVSTOCKID`, T1.`MOVSTOCKTIPOTRNSTKCODIGO`   AS MOVSTOCKTIPOTRNSTKCODIGO, T4.`TIPODOCUMENTONOMBRE`        AS MOVSTOCKTIPODOCUMENTOREFNOMBRE, T1.`MOVSTOCKTIPODOCUMENTOREFID` AS MOVSTOCKTIPODOCUMENTOREFID, T1.`MOVSTOCKDOCUMENTOREFID`, T1.`MOVSTOCKDOCUMENTOREFNUMEROEXTE`
FROM (((`MOVIMIENTOSTOCK` T1 LEFT JOIN `PERSONA` T2 ON T2.`PERSONAID` = T1.`MOVSTOCKPERSONAID`)
    INNER JOIN `TIPOTRANSACCION` T3 ON T3.`TIPOTRANSACCIONCODIGO` = T1.`MOVSTOCKTIPOTRNSTKCODIGO`)
    LEFT JOIN `TIPODOCUMENTO` T4 ON T4.`TIPODOCUMENTOID` = T1.`MOVSTOCKTIPODOCUMENTOREFID`)
WHERE (T1.`MOVSTOCKCENTROALMACENAJEID` = 42 AND T1.`MOVSTOCKEMPRESAID` = 1)
  AND (T1.`MOVSTOCKFECHAVALOR` <= '2024-12-30')
  AND (T1.`MOVSTOCKFECHAVALOR` >= '2024-11-30')
ORDER BY T1.`MOVSTOCKCODIGO`;

#--------------------------
SELECT *
FROM K2B_PROD.BIENACTIVOFIJO B
WHERE BIENACTIVOFIJONUMEROSERIE LIKE '%PEND%';
#------------------------------------------------
#orden stock
SELECT O.ORDENSTKFECHAVALOR, O.ORDENSTKFECHAESTIMADA, O.ORDENSTKFECHASOLICITUD, O.*
FROM K2B_PROD.ORDENSTOCK O
WHERE O.ORDENSTKCODIGO = 33820;
#movimiento sotock salida y entrada
SELECT M.MOVSTOCKFECHA, M.MOVSTOCKFECHAVALOR, M.*
FROM K2B_PROD.MOVIMIENTOSTOCK M
WHERE M.MOVSTOCKCODIGO = 158217;
#Datos AF
SELECT B.BIENACTIVOFIJOIMPORTEMONEDALOC, B.BIENACTIVOFIJOFECHAADQUISICION, B.*
FROM K2B_PROD.BIENACTIVOFIJO B
WHERE B.BIENACTIVOFIJOCODIGO #= 'AF-000438';
          IN ('AF-031517', 'AF-031518', 'AF-031519', 'AF-031531',
              'AF-034133', 'AF-034140', 'AF-040028', 'AF-040029', 'AF-040702');
#mov activo fijo
SELECT M.MOVACTIVOFIJOFECHAVALOR, M.MOVACTIVOFIJOFECHA, M.*
FROM K2B_PROD.MOVIMIENTOACTIVOFIJO M
WHERE M.MOVACTIVOFIJOCODIGO = 158217;

SELECT *
FROM K2B_PROD.BIENACTIVOFIJO
WHERE BIENACTIVOFIJOCODIGO = 'AF-036900';
#pantalla bien activo fijo.!
SELECT T1.`INVACTIVOFIJOID`, T1.`INVACTIVOFIJOBIENID`            AS INVACTIVOFIJOBIENID, T2.`BIENACTIVOFIJOCODIGO`           AS INVACTIVOFIJOBIENCODIGO, T2.`BIENACTIVOFIJONUMEROSERIE`      AS INVACTIVOFIJOBIENNUMEROSERIE, T2.`BIENACTIVOFIJODESCRIPCION`      AS INVACTIVOFIJOBIENDESCRIPCION, T2.`BIENACTIVOFIJOCONCEPTOEGREID`   AS INVACTIVOFIJOBIENCONCEPTOEGREI, T1.`INVACTIVOFIJOPRODUCTOID`        AS INVACTIVOFIJOPRODUCTOID, T3.`PRODUCTOCODIGO`                 AS INVACTIVOFIJOPRODUCTOCODIGO, T3.`PRODUCTODESCRIPCION`            AS INVACTIVOFIJOPRODUCTODESCRIPCI, T3.`PRODUCTOCODIGODESCRIPCION`      AS INVACTIVOFIJOPRODUCTOCODIGODES, T1.`INVACTIVOFIJOESTADOCONSCODIGO`, T1.`INVACTIVOFIJOBIENESCOMPUESTO`, T1.`INVACTIVOFIJOTIPOBIEN`, T1.`INVACTIVOFIJOTIPOANEXO`, T2.`BIENACTIVOFIJOGRUPO`            AS INVACTIVOFIJOBIENGRUPO, T1.`INVACTIVOFIJOBIENCOMPID`        AS INVACTIVOFIJOBIENCOMPID, T4.`BIENACTIVOFIJOCODIGO`           AS INVACTIVOFIJOBIENCOMPCODIGO, T4.`BIENACTIVOFIJONUMEROSERIE`      AS INVACTIVOFIJOBIENCOMPNUMEROSER, T4.`BIENACTIVOFIJODESCRIPCION`      AS INVACTIVOFIJOBIENCOMPDESCRIPCI, T4.`BIENACTIVOFIJOMOTIVOID`         AS INVACTIVOFIJOBIENCOMPMOTIVOID, T1.`INVACTIVOFIJOEMPRESAID`         AS INVACTIVOFIJOEMPRESAID, T5.`EMPRESANOMBRE`                  AS INVACTIVOFIJOEMPRESANOMBRE, T5.`EMPRESACODIGONOMBRE`            AS INVACTIVOFIJOEMPRESACODIGONOMB, T1.`INVACTIVOFIJOTIPOUBICACION`, T1.`INVACTIVOFIJOPERSONAID`         AS INVACTIVOFIJOPERSONAID, T1.`INVACTIVOFIJOROLCODIGO`, T6.`PERSONANOMBRE`                  AS INVACTIVOFIJOPERSONANOMBRE, T1.`INVACTIVOFIJOPERSONARESPID`     AS INVACTIVOFIJOPERSONARESPID, T7.`PERSONANOMBRE`                  AS INVACTIVOFIJOPERSONARESPNOMBRE, T1.`INVACTIVOFIJOPERSONAJURIDICAID` AS INVACTIVOFIJOPERSONAJURIDICAID, T8.`PERSONANOMBRE`                  AS INVACTIVOFIJOPERSONAJURIDICANO, T1.`INVACTIVOFIJODIRECCIONID`       AS INVACTIVOFIJODIRECCIONID, T9.`DIRECCIONDESCRIPCION`           AS INVACTIVOFIJODIRECCIONDESCRIPC, T1.`INVACTIVOFIJOLUGARFISICOID`     AS INVACTIVOFIJOLUGARFISICOID, T10.`LUGARFISICONOMBRE`             AS INVACTIVOFIJOLUGARFISICONOMBRE, T10.`LUGARFISICOCODIGONOMBRE`       AS INVACTIVOFIJOLUGARFISICOCODNOM, T1.`INVACTIVOFIJOSECTORID`          AS INVACTIVOFIJOSECTORID, T11.`SECTORNOMBRE`                  AS INVACTIVOFIJOSECTORNOMBRE, T11.`SECTORCODIGONOMBRE`            AS INVACTIVOFIJOSECTORCODIGONOMBR, T11.`SECTORENTRANSITO`              AS INVACTIVOFIJOSECTORENTRANSITO, T1.`INVACTIVOFIJOCENTROALMACENAJEI` AS INVACTIVOFIJOCENTROALMACENAJEI, T12.`CENTROALMACENAJENOMBRE`        AS INVACTIVOFIJOCENTROALMACENAJEN, T1.`INVACTIVOFIJOFECHAINICIORESGUA`, T1.`INVACTIVOFIJOFECHAFINRESGUARDO`, T1.`INVACTIVOFIJOPERIODOID`         AS INVACTIVOFIJOPERIODOID, T13.`PERIODODESCRIPCION`            AS INVACTIVOFIJOPERIODODESCRIPCIO, T1.`INVACTIVOFIJOAFECTACIONCOSTOID`
FROM ((((((((((((`INVENTARIOACTIVOFIJO` T1 INNER JOIN `BIENACTIVOFIJO` T2 ON T2.`BIENACTIVOFIJOID` = T1.`INVACTIVOFIJOBIENID`)
    LEFT JOIN `PRODUCTO` T3 ON T3.`PRODUCTOID` = T1.`INVACTIVOFIJOPRODUCTOID`)
    LEFT JOIN `BIENACTIVOFIJO` T4 ON T4.`BIENACTIVOFIJOID` = T1.`INVACTIVOFIJOBIENCOMPID`)
    INNER JOIN `EMPRESA` T5 ON T5.`EMPRESAID` = T1.`INVACTIVOFIJOEMPRESAID`)
    LEFT JOIN `PERSONA` T6 ON T6.`PERSONAID` = T1.`INVACTIVOFIJOPERSONAID`)
    LEFT JOIN `PERSONA` T7 ON T7.`PERSONAID` = T1.`INVACTIVOFIJOPERSONARESPID`)
    LEFT JOIN `PERSONA` T8 ON T8.`PERSONAID` = T1.`INVACTIVOFIJOPERSONAJURIDICAID`)
    LEFT JOIN `DIRECCION` T9 ON T9.`DIRECCIONID` = T1.`INVACTIVOFIJODIRECCIONID`)
    LEFT JOIN `LUGARFISICO` T10 ON T10.`LUGARFISICOID` = T1.`INVACTIVOFIJOLUGARFISICOID`)
    LEFT JOIN `SECTOR` T11 ON T11.`LUGARFISICOID` = T1.`INVACTIVOFIJOLUGARFISICOID` AND T11.`SECTORID` = T1.`INVACTIVOFIJOSECTORID`)
    LEFT JOIN `CENTROALMACENAJE` T12 ON T12.`CENTROALMACENAJEID` = T1.`INVACTIVOFIJOCENTROALMACENAJEI`)
    INNER JOIN `PERIODO` T13 ON T13.`PERIODOID` = T1.`INVACTIVOFIJOPERIODOID`)
WHERE T1.`INVACTIVOFIJOID` = 2684912
ORDER BY T1.`INVACTIVOFIJOID`;

SELECT * from k2b_prod.CENTROALMACENAJE C;
SELECT * FROM k2b_prod.INVENTARIOACTIVOFIJO I WHERE I.INVACTIVOFIJOROLCODIGO='';
select * from acuerdo where acuerdoid = 41;


SELECT * FROM k2b_prod.BIENACTIVOCRITERIO B WHERE Empresaid = 1
AND CriterioVariacionActivoCodigo = 'CRITERIOCONTABLE'
AND BienActivoFijoId in (30330,30332,30333);

#criteriovariacionactivoempresanexo
SELECT * FROM k2b_prod.CRITERIOVARIACIONACTIVOEMPRESA C;

#---criteriocontable
SELECT T3.`PLANCLASEVARIACIONACTIVODESCRI`, T1.`CLASEACTIVOCRITERIOTIPORECUPER`,T1.`CLASEACTIVOCRITERIOPORCENTAJER`,
T1.`CLASEACTIVOCRITERIOINICIOPROCE`, T1.`CRITERIOVARIACIONACTIVOCODIGO`,T2.`PLANCLASEVARIACIONACTIVOCODIGO`,
T2.`CLASEVARIACIONACTIVODESCRIPCIO`,T2.`CLASEVARIACIONACTIVOCODIGO`,T1.`CLASEVARIACIONACTIVOID`,T1.`EMPRESAID`
FROM ((`CLASEACTIVOCRITERIO` T1
    INNER JOIN `CLASEVARIACIONACTIVO` T2 ON T2.`CLASEVARIACIONACTIVOID` = T1.`CLASEVARIACIONACTIVOID`)
    INNER JOIN `PLANCLASESVARIACIONACTIVO` T3 ON T3.`PLANCLASEVARIACIONACTIVOCODIGO` = T2.`PLANCLASEVARIACIONACTIVOCODIGO`)
WHERE (T1.`CRITERIOVARIACIONACTIVOCODIGO` = 'CRITERIOCONTABLE' AND T1.`EMPRESAID` = 1)
ORDER BY T2.`CLASEVARIACIONACTIVOCODIGO`
LIMIT 0, 6;

SELECT *  FROM k2b_prod.CLASEACTIVOCRITERIO P;
SELECT * FROM k2b_prod.CLASEVARIACIONACTIVO C WHERE ClaseVariacionActivoId IN (38, 39, 40, 43, 45, 47, 41, 42);
#---------------------------
SELECT * FROM k2b_prod.ALOAD A WHERE A.ALDATETIME >= '2025-05-30 00:01:00';

#panatalla bien activo fijo desde inventario
SELECT `BienActivoFijoId`, `BienActivoFijoGrupo` FROM `BienActivoFijo` WHERE `BienActivoFijoId` = 312 ORDER BY `BienActivoFijoId`;
SELECT T1.`InvActivoFijoBienId`, T2.`PeriodoFechaFin` AS InvActivoFijoPeriodoFechaFin, T2.`PeriodoFechaInicio` AS InvActivoFijoPeriodoFechaInici, T1.`InvActivoFijoId`, T1.`InvActivoFijoEmpresaId`, T1.`InvActivoFijoPeriodoId` AS InvActivoFijoPeriodoId FROM (`InventarioActivoFijo` T1 INNER JOIN `Periodo` T2 ON T2.`PeriodoId` = T1.`InvActivoFijoPeriodoId`) WHERE (T1.`InvActivoFijoBienId` = 312) ORDER BY T1.`InvActivoFijoBienId`, T2.`PeriodoFechaInicio` DESC;
SELECT T1.`PeriodoCierreEmpresaId`, T1.`PropositoPeriodoCodigo`, T1.`PeriodoCierreEstado`, T1.`PeriodoId`, T2.`PeriodoFechaInicio`, T1.`PeriodoCierreId` FROM (`PeriodoCierre` T1 LEFT JOIN `Periodo` T2 ON T2.`PeriodoId` = T1.`PeriodoId`) WHERE (T1.`PeriodoCierreEmpresaId` = 1) AND (T1.`PropositoPeriodoCodigo` = 'CIERREACTIVOFIJO') AND (T1.`PeriodoCierreEstado` = 'AB') ORDER BY T1.`PeriodoCierreEmpresaId`, T2.`PeriodoFechaInicio` DESC  LIMIT 1;
SELECT T1.`InvActivoFijoId`, T1.`InvActivoFijoBienId` AS InvActivoFijoBienId, T2.`BienActivoFijoCodigo` AS InvActivoFijoBienCodigo, T2.`BienActivoFijoNumeroSerie` AS InvActivoFijoBienNumeroSerie, T2.`BienActivoFijoDescripcion` AS InvActivoFijoBienDescripcion, T2.`BienActivoFijoConceptoEgreId` AS InvActivoFijoBienConceptoEgreI, T1.`InvActivoFijoProductoId` AS InvActivoFijoProductoId, T3.`ProductoCodigo` AS InvActivoFijoProductoCodigo, T3.`ProductoDescripcion` AS InvActivoFijoProductoDescripci, T3.`ProductoCodigoDescripcion` AS InvActivoFijoProductoCodigoDes, T1.`InvActivoFijoEstadoConsCodigo`, T1.`InvActivoFijoBienEsCompuesto`, T1.`InvActivoFijoTipoBien`, T1.`InvActivoFijoTipoAnexo`, T2.`BienActivoFijoGrupo` AS InvActivoFijoBienGrupo, T1.`InvActivoFijoBienCompId` AS InvActivoFijoBienCompId, T4.`BienActivoFijoCodigo` AS InvActivoFijoBienCompCodigo, T4.`BienActivoFijoNumeroSerie` AS InvActivoFijoBienCompNumeroSer, T4.`BienActivoFijoDescripcion` AS InvActivoFijoBienCompDescripci, T4.`BienActivoFijoMotivoId` AS InvActivoFijoBienCompMotivoId, T1.`InvActivoFijoEmpresaId` AS InvActivoFijoEmpresaId, T5.`EmpresaNombre` AS InvActivoFijoEmpresaNombre, T5.`EmpresaCodigoNombre` AS InvActivoFijoEmpresaCodigoNomb, T1.`InvActivoFijoTipoUbicacion`, T1.`InvActivoFijoPersonaId` AS InvActivoFijoPersonaId, T1.`InvActivoFijoRolCodigo`, T6.`PersonaNombre` AS InvActivoFijoPersonaNombre, T1.`InvActivoFijoPersonaRespId` AS InvActivoFijoPersonaRespId, T7.`PersonaNombre` AS InvActivoFijoPersonaRespNombre, T1.`InvActivoFijoPersonaJuridicaId` AS InvActivoFijoPersonaJuridicaId, T8.`PersonaNombre` AS InvActivoFijoPersonaJuridicaNo, T1.`InvActivoFijoDireccionId` AS InvActivoFijoDireccionId, T9.`DireccionDescripcion` AS InvActivoFijoDireccionDescripc, T1.`InvActivoFijoLugarFisicoId` AS InvActivoFijoLugarFisicoId, T10.`LugarFisicoNombre` AS InvActivoFijoLugarFisicoNombre, T10.`LugarFisicoCodigoNombre` AS InvActivoFijoLugarFisicoCodNom, T1.`InvActivoFijoSectorId` AS InvActivoFijoSectorId, T11.`SectorNombre` AS InvActivoFijoSectorNombre, T11.`SectorCodigoNombre` AS InvActivoFijoSectorCodigoNombr, T11.`SectorEnTransito` AS InvActivoFijoSectorEnTransito, T1.`InvActivoFijoCentroAlmacenajeI` AS InvActivoFijoCentroAlmacenajeI, T12.`CentroAlmacenajeNombre` AS InvActivoFijoCentroAlmacenajeN, T1.`InvActivoFijoFechaInicioResgua`, T1.`InvActivoFijoFechaFinResguardo`, T1.`InvActivoFijoPeriodoId` AS InvActivoFijoPeriodoId, T13.`PeriodoDescripcion` AS InvActivoFijoPeriodoDescripcio, T1.`InvActivoFijoAfectacionCostoId` FROM ((((((((((((`InventarioActivoFijo` T1 INNER JOIN `BienActivoFijo` T2 ON T2.`BienActivoFijoId` = T1.`InvActivoFijoBienId`) LEFT JOIN `Producto` T3 ON T3.`ProductoId` = T1.`InvActivoFijoProductoId`) LEFT JOIN `BienActivoFijo` T4 ON T4.`BienActivoFijoId` = T1.`InvActivoFijoBienCompId`) INNER JOIN `Empresa` T5 ON T5.`EmpresaId` = T1.`InvActivoFijoEmpresaId`) LEFT JOIN `Persona` T6 ON T6.`PersonaId` = T1.`InvActivoFijoPersonaId`) LEFT JOIN `Persona` T7 ON T7.`PersonaId` = T1.`InvActivoFijoPersonaRespId`) LEFT JOIN `Persona` T8 ON T8.`PersonaId` = T1.`InvActivoFijoPersonaJuridicaId`) LEFT JOIN `Direccion` T9 ON T9.`DireccionId` = T1.`InvActivoFijoDireccionId`) LEFT JOIN `LugarFisico` T10 ON T10.`LugarFisicoId` = T1.`InvActivoFijoLugarFisicoId`) LEFT JOIN `Sector` T11 ON T11.`LugarFisicoId` = T1.`InvActivoFijoLugarFisicoId` AND T11.`SectorId` = T1.`InvActivoFijoSectorId`) LEFT JOIN `CentroAlmacenaje` T12 ON T12.`CentroAlmacenajeId` = T1.`InvActivoFijoCentroAlmacenajeI`) INNER JOIN `Periodo` T13 ON T13.`PeriodoId` = T1.`InvActivoFijoPeriodoId`) WHERE T1.`InvActivoFijoId` = 2831787 ORDER BY T1.`InvActivoFijoId`;
SELECT T1.`TipoTrnActivoFijoValidaRecepci`, T2.`TipoTransaccionModoEjecucion` AS TipoTrnActivoFijoModoEjecucion, T2.`TipoTransaccionRequiereAutoriz` AS TipoTrnActivoFijoRequiereAutor, T1.`TipoTrnActivoFijoTipoMovimient`, T1.`TipoTrnActivoFijoCodigo` AS TipoTrnActivoFijoCodigo FROM (`TipoTransaccionActivoFijo` T1 INNER JOIN `TipoTransaccion` T2 ON T2.`TipoTransaccionCodigo` = T1.`TipoTrnActivoFijoCodigo`) WHERE (T1.`TipoTrnActivoFijoTipoMovimient` = 'AjusteValorRevaluado') AND (T2.`TipoTransaccionRequiereAutoriz` = 0) AND (T2.`TipoTransaccionModoEjecucion` = 'INTERACTIVA') AND (T1.`TipoTrnActivoFijoValidaRecepci` = 0) ORDER BY T1.`TipoTrnActivoFijoCodigo`;
SELECT T1.`BienActivoFijoMonedaCodigo` AS BienActivoFijoMonedaCodigo, T1.`BienActivoFijoProveedorId` AS BienActivoFijoProveedorId, T1.`BienActivoFijoEstadoConsCodigo` AS BienActivoFijoEstadoConsCodigo, T1.`BienActivoFijoGrupo`, T1.`BienActivoFijoObservacion`, T6.`ConceptoActivoFijoDescripcion` AS BienActivoFijoConceptoIngDescr, T1.`BienActivoFijoFechaBaja`, T1.`BienActivoFijoEstado`, T4.`EstadoConsBienActivoFijoDescri` AS BienActivoFijoEstadoConsDescri, T1.`BienActivoFijoFechaVtoGarantia`, T1.`BienActivoFijoFechaActivacion`, T1.`BienActivoFijoFechaComienzoUso`, T1.`BienActivoFijoFechaAdquisicion`, T1.`BienActivoFijoFechaIngreso`, T7.`ConceptoActivoFijoDescripcion` AS BienActivoFijoConceptoEgreDesc, T1.`BienActivoFijoNumeroFacturaCmp`, T3.`PersonaJuridicaNombreComercial` AS BienActivoFijoProveedorNombreC, T8.`PaisNombre` AS BienActivoFijoPaisOrigenNombre, T1.`BienActivoFijoModelo`, T1.`BienActivoFijoMarca`, T1.`BienActivoFijoImporteMonedaLoc`, T2.`MonedaSimbolo` AS BienActivoFijoMonedaSimbolo, T1.`BienActivoFijoImporteMonedaOri`, T5.`EmpresaNombre` AS BienActivoFijoEmpresaNombre, T9.`ItemSerialCodigo` AS BienActivoFijoSerialCodigo, T10.`ProductoDescripcion` AS BienActivoFijoProductoDescripc, T1.`BienActivoFijoDescripcion`, T9.`ItemSerialCodigoBarras` AS BienActivoFijoSerialCodigoBarr, T1.`BienActivoFijoNumeroSerie`, T1.`BienActivoFijoCodigo`, T1.`BienActivoFijoEmpresaId` AS BienActivoFijoEmpresaId, T1.`BienActivoFijoConceptoIngId` AS BienActivoFijoConceptoIngId, T1.`BienActivoFijoConceptoEgreId` AS BienActivoFijoConceptoEgreId, T1.`BienActivoFijoPaisOrigenCodigo` AS BienActivoFijoPaisOrigenCodigo, T1.`BienActivoFijoSerialId` AS BienActivoFijoSerialId, T1.`BienActivoFijoProductoId` AS BienActivoFijoProductoId, T1.`BienActivoFijoId` FROM (((((((((`BienActivoFijo` T1 LEFT JOIN `Moneda` T2 ON T2.`MonedaCodigo` = T1.`BienActivoFijoMonedaCodigo`) LEFT JOIN `PersonaJuridica` T3 ON T3.`PersonaJuridicaId` = T1.`BienActivoFijoProveedorId`) INNER JOIN `EstadoConsBienActivoFijo` T4 ON T4.`EstadoConsBienActivoFijoCodigo` = T1.`BienActivoFijoEstadoConsCodigo`) INNER JOIN `Empresa` T5 ON T5.`EmpresaId` = T1.`BienActivoFijoEmpresaId`) LEFT JOIN `ConceptoActivoFijo` T6 ON T6.`ConceptoActivoFijoId` = T1.`BienActivoFijoConceptoIngId`) LEFT JOIN `ConceptoActivoFijo` T7 ON T7.`ConceptoActivoFijoId` = T1.`BienActivoFijoConceptoEgreId`) LEFT JOIN `Pais` T8 ON T8.`PaisCodigo` = T1.`BienActivoFijoPaisOrigenCodigo`) LEFT JOIN `ItemStockSerial` T9 ON T9.`ItemSerialId` = T1.`BienActivoFijoSerialId`) LEFT JOIN `Producto` T10 ON T10.`ProductoId` = T1.`BienActivoFijoProductoId`) WHERE T1.`BienActivoFijoId` = 312 ORDER BY T1.`BienActivoFijoId`;
SELECT T1.`TipoTrnActivoFijoValidaRecepci`, T2.`TipoTransaccionModoEjecucion` AS TipoTrnActivoFijoModoEjecucion, T2.`TipoTransaccionRequiereAutoriz` AS TipoTrnActivoFijoRequiereAutor, T1.`TipoTrnActivoFijoTipoMovimient`, T1.`TipoTrnActivoFijoCodigo` AS TipoTrnActivoFijoCodigo FROM (`TipoTransaccionActivoFijo` T1 INNER JOIN `TipoTransaccion` T2 ON T2.`TipoTransaccionCodigo` = T1.`TipoTrnActivoFijoCodigo`) WHERE (T1.`TipoTrnActivoFijoTipoMovimient` = 'AjusteValorRevaluado') AND (T2.`TipoTransaccionRequiereAutoriz` = 0) AND (T2.`TipoTransaccionModoEjecucion` = 'INTERACTIVA') AND (T1.`TipoTrnActivoFijoValidaRecepci` = 0) ORDER BY T1.`TipoTrnActivoFijoCodigo`;
#--resguardo
SELECT T1.`PeriodoCierreId`, T1.`PeriodoId`, T2.`PeriodoDescripcion`, T1.`PeriodoCierreEmpresaId`, T1.`PropositoPeriodoCodigo`, T1.`PeriodoCierreEstado`, T1.`PeriodoCierreDimGenerica` FROM (`PeriodoCierre` T1 LEFT JOIN `Periodo` T2 ON T2.`PeriodoId` = T1.`PeriodoId`) WHERE (T1.`PeriodoCierreEstado` <> 'PEND') AND (T1.`PeriodoCierreEmpresaId` = 1) AND (T1.`PropositoPeriodoCodigo` = 'CIERREACTIVOFIJO') AND (T1.`PeriodoCierreDimGenerica` = 'OPERATIVA');
SELECT COUNT(*) FROM ((((((((((`InventarioActivoFijo` T1 LEFT JOIN `Direccion` T6 ON T6.`DireccionId` = T1.`InvActivoFijoDireccionId`) INNER JOIN `EstadoConsBienActivoFijo` T11 ON T11.`EstadoConsBienActivoFijoCodigo` = T1.`InvActivoFijoEstadoConsCodigo`) LEFT JOIN `CentroAlmacenaje` T10 ON T10.`CentroAlmacenajeId` = T1.`InvActivoFijoCentroAlmacenajeI`) LEFT JOIN `Persona` T9 ON T9.`PersonaId` = T1.`InvActivoFijoPersonaJuridicaId`) LEFT JOIN `LugarFisico` T4 ON T4.`LugarFisicoId` = T1.`InvActivoFijoLugarFisicoId`) LEFT JOIN `Sector` T5 ON T5.`LugarFisicoId` = T1.`InvActivoFijoLugarFisicoId` AND T5.`SectorId` = T1.`InvActivoFijoSectorId`) LEFT JOIN `Persona` T8 ON T8.`PersonaId` = T1.`InvActivoFijoPersonaRespId`) LEFT JOIN `Persona` T7 ON T7.`PersonaId` = T1.`InvActivoFijoPersonaId`) INNER JOIN `Empresa` T3 ON T3.`EmpresaId` = T1.`InvActivoFijoEmpresaId`) INNER JOIN `Periodo` T2 ON T2.`PeriodoId` = T1.`InvActivoFijoPeriodoId`) WHERE (T1.`InvActivoFijoBienId` = 312);
SELECT  T1.`InvActivoFijoBienId`, T1.`InvActivoFijoTipoUbicacion`, T1.`InvActivoFijoDireccionId` AS InvActivoFijoDireccionId, T1.`InvActivoFijoEstadoConsCodigo` AS InvActivoFijoEstadoConsCodigo, T11.`PeriodoFechaFin` AS InvActivoFijoPeriodoFechaFin, T1.`InvActivoFijoId`, T3.`EstadoConsBienActivoFijoDescri` AS InvActivoFijoEstadoConsDescrip, T1.`InvActivoFijoFechaInicioResgua`, T4.`CentroAlmacenajeNombre` AS InvActivoFijoCentroAlmacenajeN, T1.`InvActivoFijoCentroAlmacenajeI` AS InvActivoFijoCentroAlmacenajeI, T2.`DireccionDescripcion` AS InvActivoFijoDireccionDescripc, T5.`PersonaNombre` AS InvActivoFijoPersonaJuridicaNo, T1.`InvActivoFijoPersonaJuridicaId` AS InvActivoFijoPersonaJuridicaId, T7.`SectorNombre` AS InvActivoFijoSectorNombre, T1.`InvActivoFijoSectorId` AS InvActivoFijoSectorId, T6.`LugarFisicoNombre` AS InvActivoFijoLugarFisicoNombre, T1.`InvActivoFijoLugarFisicoId` AS InvActivoFijoLugarFisicoId, T8.`PersonaNombre` AS InvActivoFijoPersonaRespNombre, T1.`InvActivoFijoPersonaRespId` AS InvActivoFijoPersonaRespId, T9.`PersonaNombre` AS InvActivoFijoPersonaNombre, T1.`InvActivoFijoPersonaId` AS InvActivoFijoPersonaId, T10.`EmpresaNombre` AS InvActivoFijoEmpresaNombre, T1.`InvActivoFijoEmpresaId` AS InvActivoFijoEmpresaId, T11.`PeriodoDescripcion` AS InvActivoFijoPeriodoDescripcio, T1.`InvActivoFijoPeriodoId` AS InvActivoFijoPeriodoId FROM ((((((((((`InventarioActivoFijo` T1 LEFT JOIN `Direccion` T2 ON T2.`DireccionId` = T1.`InvActivoFijoDireccionId`) INNER JOIN `EstadoConsBienActivoFijo` T3 ON T3.`EstadoConsBienActivoFijoCodigo` = T1.`InvActivoFijoEstadoConsCodigo`) LEFT JOIN `CentroAlmacenaje` T4 ON T4.`CentroAlmacenajeId` = T1.`InvActivoFijoCentroAlmacenajeI`) LEFT JOIN `Persona` T5 ON T5.`PersonaId` = T1.`InvActivoFijoPersonaJuridicaId`) LEFT JOIN `LugarFisico` T6 ON T6.`LugarFisicoId` = T1.`InvActivoFijoLugarFisicoId`) LEFT JOIN `Sector` T7 ON T7.`LugarFisicoId` = T1.`InvActivoFijoLugarFisicoId` AND T7.`SectorId` = T1.`InvActivoFijoSectorId`) LEFT JOIN `Persona` T8 ON T8.`PersonaId` = T1.`InvActivoFijoPersonaRespId`) LEFT JOIN `Persona` T9 ON T9.`PersonaId` = T1.`InvActivoFijoPersonaId`) INNER JOIN `Empresa` T10 ON T10.`EmpresaId` = T1.`InvActivoFijoEmpresaId`) INNER JOIN `Periodo` T11 ON T11.`PeriodoId` = T1.`InvActivoFijoPeriodoId`) WHERE (T1.`InvActivoFijoBienId` = 312) ORDER BY T1.`InvActivoFijoBienId`, T11.`PeriodoFechaFin` DESC LIMIT 0, 21;

select * FROM k2b_prod.INVENTARIOACTIVOFIJO I WHERE `INVACTIVOFIJOBIENID` = 312;
SELECT * FROM k2b_prod.BIENACTIVOFIJO B WHERE B.BIENACTIVOFIJOCODIGO='AF-000307';

#inventario de stock detallado

#item stock detallado

SELECT `K2BRPPGridName`, `K2BRPPPgmName`, `K2BRPPUserCode`, `K2BRPPTenantCode`, `K2BRPPRows`, `K2BRowsPerPageId` FROM `RowsPerPage` WHERE `K2BRPPTenantCode` = '' and `K2BRPPUserCode` = 'KDOSBUSER' and `K2BRPPPgmName` = 'HWWInventarioStockItem' and `K2BRPPGridName` = 'Grid' ORDER BY `K2BRPPTenantCode`, `K2BRPPUserCode`, `K2BRPPPgmName`, `K2BRPPGridName`  LIMIT 1
SELECT `CentroAlmacenajeId`, `CentroAlmacenajeEmpresaId` FROM `CentroAlmacenaje` WHERE `CentroAlmacenajeId` = 1 ORDER BY `CentroAlmacenajeId`
SELECT T1.`PeriodoCierreId`, T1.`PeriodoCierreEmpresaId`, T1.`PropositoPeriodoCodigo`, T1.`PeriodoCierreEstado`, T1.`PeriodoId`, T2.`PeriodoFechaFin` FROM (`PeriodoCierre` T1 LEFT JOIN `Periodo` T2 ON T2.`PeriodoId` = T1.`PeriodoId`) WHERE (T1.`PeriodoCierreEstado` <> 'PEND') AND (T1.`PeriodoCierreEmpresaId` = 1) AND (T1.`PropositoPeriodoCodigo` = 'CIERREALMACEN') ORDER BY T2.`PeriodoFechaFin` DESC  LIMIT 1
SELECT `CentroAlmacenajeId`, `CentroAlmacenajeGrupoProductoC` FROM `CentroAlmacenaje` WHERE `CentroAlmacenajeId` = 1 ORDER BY `CentroAlmacenajeId`
SELECT T1.`EmpresaId`, T2.`EmpresaNombre`, T1.`CentroAlmacenajeId`, T1.`CentroAlmacenajeEmpresaNexoHab` FROM (`CentroAlmacenajeEmpresaNexo` T1 INNER JOIN `Empresa` T2 ON T2.`EmpresaId` = T1.`EmpresaId`) WHERE (T1.`CentroAlmacenajeId` = 1) AND (T1.`CentroAlmacenajeEmpresaNexoHab` = 1) ORDER BY T2.`EmpresaNombre`
SELECT T1.`PeriodoCierreId`, T1.`PeriodoId`, T2.`PeriodoDescripcion`, T1.`PeriodoCierreEmpresaId`, T1.`PropositoPeriodoCodigo`, T1.`PeriodoCierreEstado` FROM (`PeriodoCierre` T1 LEFT JOIN `Periodo` T2 ON T2.`PeriodoId` = T1.`PeriodoId`) WHERE (( T1.`PeriodoCierreEmpresaId` = 1 or (1 = 0))) AND (T1.`PeriodoCierreEstado` <> 'PEND') AND (T1.`PropositoPeriodoCodigo` = 'CIERREALMACEN')

SELECT T1.`PeriodoCierreId`, T1.`PeriodoId`, T2.`PeriodoDescripcion`, T1.`PeriodoCierreEmpresaId`, T1.`PropositoPeriodoCodigo`, T1.`PeriodoCierreEstado` FROM (`PeriodoCierre` T1 LEFT JOIN `Periodo` T2 ON T2.`PeriodoId` = T1.`PeriodoId`) WHERE (( T1.`PeriodoCierreEmpresaId` = 1 or (1 = 0))) AND (T1.`PeriodoCierreEstado` <> 'PEND') AND (T1.`PropositoPeriodoCodigo` = 'CIERREALMACEN')
SELECT T1.`EmpresaId`, T1.`CentroAlmacenajeEmpresaNexoHab`, T1.`CentroAlmacenajeId`, T2.`EmpresaNombre` FROM (`CentroAlmacenajeEmpresaNexo` T1 INNER JOIN `Empresa` T2 ON T2.`EmpresaId` = T1.`EmpresaId`) WHERE (T1.`CentroAlmacenajeId` = 1 and T1.`EmpresaId` = 1) AND (T1.`CentroAlmacenajeEmpresaNexoHab` = 1) ORDER BY T1.`CentroAlmacenajeId`, T1.`EmpresaId`  LIMIT 1
SELECT T1.`PeriodoCierreId`, T1.`PeriodoId`, T1.`PeriodoCierreEstado`, T1.`PropositoPeriodoCodigo`, T1.`PeriodoCierreEmpresaId`, T2.`PeriodoDescripcion` FROM (`PeriodoCierre` T1 LEFT JOIN `Periodo` T2 ON T2.`PeriodoId` = T1.`PeriodoId`) WHERE (T1.`PeriodoId` = 148) AND (( T1.`PeriodoCierreEmpresaId` = 1 or (1 = 0))) AND (T1.`PeriodoCierreEstado` <> 'PEND') AND (T1.`PropositoPeriodoCodigo` = 'CIERREALMACEN') ORDER BY T1.`PeriodoId`  LIMIT 1
SELECT COUNT(*) FROM (((((((((((((`InventarioStockItem` T1 INNER JOIN `Producto` T6 ON T6.`ProductoId` = T1.`InvItemProductoId`) LEFT JOIN `Unidad` T7 ON T7.`UnidadCodigo` = T6.`ProductoUnidadStockCodigo`) LEFT JOIN `Categoria` T11 ON T11.`CategoriaId` = T6.`ProductoCategoriaId`) LEFT JOIN `Unidad` T8 ON T8.`UnidadCodigo` = T6.`ProductoUnidadStock1Codigo`) LEFT JOIN `Unidad` T9 ON T9.`UnidadCodigo` = T6.`ProductoUnidadStock2Codigo`) LEFT JOIN `Unidad` T10 ON T10.`UnidadCodigo` = T6.`ProductoUnidadStock3Codigo`) INNER JOIN `Deposito` T3 ON T3.`DepositoId` = T1.`InvItemDepositoId`) LEFT JOIN `DepositoUbicacion` T4 ON T4.`DepositoId` = T1.`InvItemDepositoId` AND T4.`DepositoUbicacionId` = T1.`InvItemDepositoUbicacionId`) LEFT JOIN `Contenedor` T5 ON T5.`ContenedorId` = T1.`InvItemContenedorId`) INNER JOIN `TipoStock` T13 ON T13.`TipoStockCodigo` = T1.`InvItemTipoStockCodigo`) LEFT JOIN `LoteStock` T12 ON T12.`LoteStockId` = T1.`InvItemLoteId`) LEFT JOIN `ItemStockSerial` T14 ON T14.`ItemSerialId` = T1.`InvItemItemSerialId`) INNER JOIN `Empresa` T2 ON T2.`EmpresaId` = T1.`InvItemEmpresaDisponibleId`) WHERE (T1.`InvItemCentroAlmacenajeId` = 1) and (T1.`InvItemCantidadUniStock` > 0 or T1.`InvItemCantidadUniStock1` > 0 or T1.`InvItemCantidadUniStock2` > 0 or T1.`InvItemCantidadUniStock3` > 0) and (T1.`InvItemEmpresaDisponibleId` = 1) and (T1.`InvItemPeriodoId` = 148) and (T1.`InvItemCentroAlmacenajeId` = 1)
SELECT  T2.`ProductoUnidadStockCodigo` AS InvItemProductoUnidadStockCodi, T2.`ProductoCategoriaId` AS InvItemProductoCategoriaId, T1.`InvItemProductoId` AS InvItemProductoId, T1.`InvItemDepositoId` AS InvItemDepositoId, T1.`InvItemDepositoUbicacionId` AS InvItemDepositoUbicacionId, T1.`InvItemContenedorId` AS InvItemContenedorId, T1.`InvItemTipoStockCodigo` AS InvItemTipoStockCodigo, T1.`InvItemLoteId` AS InvItemLoteId, T1.`InvItemItemSerialId` AS InvItemItemSerialId, T2.`ProductoUnidadStock1Codigo` AS InvItemProductoUnidadStock1Cod, T2.`ProductoUnidadStock2Codigo` AS InvItemProductoUnidadStock2Cod, T2.`ProductoUnidadStock3Codigo` AS InvItemProductoUnidadStock3Cod, T1.`InvItemCentroAlmacenajeId`, T4.`CategoriaPath` AS InvItemProductoCategoriaPath, T1.`InvItemPeriodoId`, T1.`InvItemEmpresaDisponibleId` AS InvItemEmpresaDisponibleId, T7.`UnidadSimbolo` AS InvItemProductoUnidadStock3Sim, T1.`InvItemCantidadUniStock3`, T6.`UnidadSimbolo` AS InvItemProductoUnidadStock2Sim, T1.`InvItemCantidadUniStock2`, T5.`UnidadSimbolo` AS InvItemProductoUnidadStock1Sim, T1.`InvItemCantidadUniStock1`, T3.`UnidadSimbolo` AS InvItemProductoUnidadStockSimb, T1.`InvItemCantidadUniStock`, T13.`ItemSerialCodigo` AS InvItemItemSerialCodigo, T12.`LoteStockDescripcion` AS InvItemLoteDescripcion, T11.`TipoStockDescripcion` AS InvItemTipoStockDescripcion, T10.`ContenedorDescripcion` AS InvItemContenedorDescripcion, T9.`DepositoUbicacionDescripcion` AS InvItemDepositoUbicacionDescri, T8.`DepositoNombre` AS InvItemDepositoNombre, T14.`EmpresaCodigoNombre` AS InvItemEmpresaDisponibleCodigo, T2.`ProductoCodigoDescripcion` AS InvItemProductoCodigoDescripci, T1.`InvItemId` FROM (((((((((((((`InventarioStockItem` T1 INNER JOIN `Producto` T2 ON T2.`ProductoId` = T1.`InvItemProductoId`) LEFT JOIN `Unidad` T3 ON T3.`UnidadCodigo` = T2.`ProductoUnidadStockCodigo`) LEFT JOIN `Categoria` T4 ON T4.`CategoriaId` = T2.`ProductoCategoriaId`) LEFT JOIN `Unidad` T5 ON T5.`UnidadCodigo` = T2.`ProductoUnidadStock1Codigo`) LEFT JOIN `Unidad` T6 ON T6.`UnidadCodigo` = T2.`ProductoUnidadStock2Codigo`) LEFT JOIN `Unidad` T7 ON T7.`UnidadCodigo` = T2.`ProductoUnidadStock3Codigo`) INNER JOIN `Deposito` T8 ON T8.`DepositoId` = T1.`InvItemDepositoId`) LEFT JOIN `DepositoUbicacion` T9 ON T9.`DepositoId` = T1.`InvItemDepositoId` AND T9.`DepositoUbicacionId` = T1.`InvItemDepositoUbicacionId`) LEFT JOIN `Contenedor` T10 ON T10.`ContenedorId` = T1.`InvItemContenedorId`) INNER JOIN `TipoStock` T11 ON T11.`TipoStockCodigo` = T1.`InvItemTipoStockCodigo`) LEFT JOIN `LoteStock` T12 ON T12.`LoteStockId` = T1.`InvItemLoteId`) LEFT JOIN `ItemStockSerial` T13 ON T13.`ItemSerialId` = T1.`InvItemItemSerialId`) INNER JOIN `Empresa` T14 ON T14.`EmpresaId` = T1.`InvItemEmpresaDisponibleId`) WHERE (T1.`InvItemCentroAlmacenajeId` = 1) and (T1.`InvItemCantidadUniStock` > 0 or T1.`InvItemCantidadUniStock1` > 0 or T1.`InvItemCantidadUniStock2` > 0 or T1.`InvItemCantidadUniStock3` > 0) and (T1.`InvItemEmpresaDisponibleId` = 1) and (T1.`InvItemPeriodoId` = 148) and (T1.`InvItemCentroAlmacenajeId` = 1) ORDER BY T2.`ProductoCodigoDescripcion` LIMIT 0, 101

SELECT T1.`PeriodoCierreId`, T1.`PeriodoId`, T2.`PeriodoDescripcion`, T1.`PeriodoCierreEmpresaId`, T1.`PropositoPeriodoCodigo`, T1.`PeriodoCierreEstado` FROM (`PeriodoCierre` T1 LEFT JOIN `Periodo` T2 ON T2.`PeriodoId` = T1.`PeriodoId`) WHERE (( T1.`PeriodoCierreEmpresaId` = 1 or (1 = 0))) AND (T1.`PeriodoCierreEstado` <> 'PEND') AND (T1.`PropositoPeriodoCodigo` = 'CIERREALMACEN')
SELECT T1.`EmpresaId`, T1.`CentroAlmacenajeEmpresaNexoHab`, T1.`CentroAlmacenajeId`, T2.`EmpresaNombre` FROM (`CentroAlmacenajeEmpresaNexo` T1 INNER JOIN `Empresa` T2 ON T2.`EmpresaId` = T1.`EmpresaId`) WHERE (T1.`CentroAlmacenajeId` = 1 and T1.`EmpresaId` = 1) AND (T1.`CentroAlmacenajeEmpresaNexoHab` = 1) ORDER BY T1.`CentroAlmacenajeId`, T1.`EmpresaId`  LIMIT 1
SELECT T1.`PeriodoCierreId`, T1.`PeriodoId`, T1.`PeriodoCierreEstado`, T1.`PropositoPeriodoCodigo`, T1.`PeriodoCierreEmpresaId`, T2.`PeriodoDescripcion` FROM (`PeriodoCierre` T1 LEFT JOIN `Periodo` T2 ON T2.`PeriodoId` = T1.`PeriodoId`) WHERE (T1.`PeriodoId` = 148) AND (( T1.`PeriodoCierreEmpresaId` = 1 or (1 = 0))) AND (T1.`PeriodoCierreEstado` <> 'PEND') AND (T1.`PropositoPeriodoCodigo` = 'CIERREALMACEN') ORDER BY T1.`PeriodoId`  LIMIT 1
SELECT COUNT(*) FROM (((((((((((((`InventarioStockItem` T1 INNER JOIN `Producto` T6 ON T6.`ProductoId` = T1.`InvItemProductoId`) LEFT JOIN `Unidad` T7 ON T7.`UnidadCodigo` = T6.`ProductoUnidadStockCodigo`) LEFT JOIN `Categoria` T11 ON T11.`CategoriaId` = T6.`ProductoCategoriaId`) LEFT JOIN `Unidad` T8 ON T8.`UnidadCodigo` = T6.`ProductoUnidadStock1Codigo`) LEFT JOIN `Unidad` T9 ON T9.`UnidadCodigo` = T6.`ProductoUnidadStock2Codigo`) LEFT JOIN `Unidad` T10 ON T10.`UnidadCodigo` = T6.`ProductoUnidadStock3Codigo`) INNER JOIN `Deposito` T3 ON T3.`DepositoId` = T1.`InvItemDepositoId`) LEFT JOIN `DepositoUbicacion` T4 ON T4.`DepositoId` = T1.`InvItemDepositoId` AND T4.`DepositoUbicacionId` = T1.`InvItemDepositoUbicacionId`) LEFT JOIN `Contenedor` T5 ON T5.`ContenedorId` = T1.`InvItemContenedorId`) INNER JOIN `TipoStock` T13 ON T13.`TipoStockCodigo` = T1.`InvItemTipoStockCodigo`) LEFT JOIN `LoteStock` T12 ON T12.`LoteStockId` = T1.`InvItemLoteId`) LEFT JOIN `ItemStockSerial` T14 ON T14.`ItemSerialId` = T1.`InvItemItemSerialId`) INNER JOIN `Empresa` T2 ON T2.`EmpresaId` = T1.`InvItemEmpresaDisponibleId`) WHERE (T1.`InvItemCentroAlmacenajeId` = 1) and (T1.`InvItemCantidadUniStock` > 0 or T1.`InvItemCantidadUniStock1` > 0 or T1.`InvItemCantidadUniStock2` > 0 or T1.`InvItemCantidadUniStock3` > 0) and (T1.`InvItemEmpresaDisponibleId` = 1) and (T1.`InvItemPeriodoId` = 148) and (T1.`InvItemCentroAlmacenajeId` = 1) and (T6.`ProductoCodigoDescripcion` like CONCAT(CONCAT('%', '002920%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'), '%') or T2.`EmpresaCodigoNombre` like CONCAT(CONCAT('%', '002920%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'), '%') or T3.`DepositoNombre` like CONCAT(CONCAT('%', '002920%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'), '%') or T4.`DepositoUbicacionDescripcion` like CONCAT(CONCAT('%', '002920%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'), '%') or T5.`ContenedorDescripcion` like CONCAT(CONCAT('%', '002920%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'), '%') or T13.`TipoStockDescripcion` like CONCAT(CONCAT('%', '002920%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'), '%') or T12.`LoteStockDescripcion` like CONCAT(CONCAT('%', '002920%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'), '%') or T14.`ItemSerialCodigo` like CONCAT(CONCAT('%', '002920%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'), '%') or T11.`CategoriaPath` like CONCAT(CONCAT('%', '002920%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'), '%'))
SELECT  T2.`ProductoUnidadStockCodigo` AS InvItemProductoUnidadStockCodi, T2.`ProductoCategoriaId` AS InvItemProductoCategoriaId, T1.`InvItemProductoId` AS InvItemProductoId, T1.`InvItemDepositoId` AS InvItemDepositoId, T1.`InvItemDepositoUbicacionId` AS InvItemDepositoUbicacionId, T1.`InvItemContenedorId` AS InvItemContenedorId, T1.`InvItemTipoStockCodigo` AS InvItemTipoStockCodigo, T1.`InvItemLoteId` AS InvItemLoteId, T1.`InvItemItemSerialId` AS InvItemItemSerialId, T2.`ProductoUnidadStock1Codigo` AS InvItemProductoUnidadStock1Cod, T2.`ProductoUnidadStock2Codigo` AS InvItemProductoUnidadStock2Cod, T2.`ProductoUnidadStock3Codigo` AS InvItemProductoUnidadStock3Cod, T1.`InvItemCentroAlmacenajeId`, T4.`CategoriaPath` AS InvItemProductoCategoriaPath, T1.`InvItemPeriodoId`, T1.`InvItemEmpresaDisponibleId` AS InvItemEmpresaDisponibleId, T7.`UnidadSimbolo` AS InvItemProductoUnidadStock3Sim, T1.`InvItemCantidadUniStock3`, T6.`UnidadSimbolo` AS InvItemProductoUnidadStock2Sim, T1.`InvItemCantidadUniStock2`, T5.`UnidadSimbolo` AS InvItemProductoUnidadStock1Sim, T1.`InvItemCantidadUniStock1`, T3.`UnidadSimbolo` AS InvItemProductoUnidadStockSimb, T1.`InvItemCantidadUniStock`, T13.`ItemSerialCodigo` AS InvItemItemSerialCodigo, T12.`LoteStockDescripcion` AS InvItemLoteDescripcion, T11.`TipoStockDescripcion` AS InvItemTipoStockDescripcion, T10.`ContenedorDescripcion` AS InvItemContenedorDescripcion, T9.`DepositoUbicacionDescripcion` AS InvItemDepositoUbicacionDescri, T8.`DepositoNombre` AS InvItemDepositoNombre, T14.`EmpresaCodigoNombre` AS InvItemEmpresaDisponibleCodigo, T2.`ProductoCodigoDescripcion` AS InvItemProductoCodigoDescripci, T1.`InvItemId` FROM (((((((((((((`InventarioStockItem` T1 INNER JOIN `Producto` T2 ON T2.`ProductoId` = T1.`InvItemProductoId`) LEFT JOIN `Unidad` T3 ON T3.`UnidadCodigo` = T2.`ProductoUnidadStockCodigo`) LEFT JOIN `Categoria` T4 ON T4.`CategoriaId` = T2.`ProductoCategoriaId`) LEFT JOIN `Unidad` T5 ON T5.`UnidadCodigo` = T2.`ProductoUnidadStock1Codigo`) LEFT JOIN `Unidad` T6 ON T6.`UnidadCodigo` = T2.`ProductoUnidadStock2Codigo`) LEFT JOIN `Unidad` T7 ON T7.`UnidadCodigo` = T2.`ProductoUnidadStock3Codigo`) INNER JOIN `Deposito` T8 ON T8.`DepositoId` = T1.`InvItemDepositoId`) LEFT JOIN `DepositoUbicacion` T9 ON T9.`DepositoId` = T1.`InvItemDepositoId` AND T9.`DepositoUbicacionId` = T1.`InvItemDepositoUbicacionId`) LEFT JOIN `Contenedor` T10 ON T10.`ContenedorId` = T1.`InvItemContenedorId`) INNER JOIN `TipoStock` T11 ON T11.`TipoStockCodigo` = T1.`InvItemTipoStockCodigo`) LEFT JOIN `LoteStock` T12 ON T12.`LoteStockId` = T1.`InvItemLoteId`) LEFT JOIN `ItemStockSerial` T13 ON T13.`ItemSerialId` = T1.`InvItemItemSerialId`) INNER JOIN `Empresa` T14 ON T14.`EmpresaId` = T1.`InvItemEmpresaDisponibleId`) WHERE (T1.`InvItemCentroAlmacenajeId` = 1) and (T1.`InvItemCantidadUniStock` > 0 or T1.`InvItemCantidadUniStock1` > 0 or T1.`InvItemCantidadUniStock2` > 0 or T1.`InvItemCantidadUniStock3` > 0) and (T1.`InvItemEmpresaDisponibleId` = 1) and (T1.`InvItemPeriodoId` = 148) and (T1.`InvItemCentroAlmacenajeId` = 1) and (T2.`ProductoCodigoDescripcion` like CONCAT(CONCAT('%', '002920%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'), '%') or T14.`EmpresaCodigoNombre` like CONCAT(CONCAT('%', '002920%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'), '%') or T8.`DepositoNombre` like CONCAT(CONCAT('%', '002920%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'), '%') or T9.`DepositoUbicacionDescripcion` like CONCAT(CONCAT('%', '002920%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'), '%') or T10.`ContenedorDescripcion` like CONCAT(CONCAT('%', '002920%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'), '%') or T11.`TipoStockDescripcion` like CONCAT(CONCAT('%', '002920%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'), '%') or T12.`LoteStockDescripcion` like CONCAT(CONCAT('%', '002920%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'), '%') or T13.`ItemSerialCodigo` like CONCAT(CONCAT('%', '002920%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'), '%') or T4.`CategoriaPath` like CONCAT(CONCAT('%', '002920%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'), '%')) ORDER BY T2.`ProductoCodigoDescripcion` LIMIT 0, 101

SELECT T1.`PeriodoCierreId`, T1.`PeriodoId`, T2.`PeriodoDescripcion`, T1.`PeriodoCierreEmpresaId`, T1.`PropositoPeriodoCodigo`, T1.`PeriodoCierreEstado` FROM (`PeriodoCierre` T1 LEFT JOIN `Periodo` T2 ON T2.`PeriodoId` = T1.`PeriodoId`) WHERE (( T1.`PeriodoCierreEmpresaId` = 1 or (1 = 0))) AND (T1.`PeriodoCierreEstado` <> 'PEND') AND (T1.`PropositoPeriodoCodigo` = 'CIERREALMACEN')
SELECT T1.`EmpresaId`, T1.`CentroAlmacenajeEmpresaNexoHab`, T1.`CentroAlmacenajeId`, T2.`EmpresaNombre` FROM (`CentroAlmacenajeEmpresaNexo` T1 INNER JOIN `Empresa` T2 ON T2.`EmpresaId` = T1.`EmpresaId`) WHERE (T1.`CentroAlmacenajeId` = 1 and T1.`EmpresaId` = 1) AND (T1.`CentroAlmacenajeEmpresaNexoHab` = 1) ORDER BY T1.`CentroAlmacenajeId`, T1.`EmpresaId`  LIMIT 1
SELECT T1.`PeriodoCierreId`, T1.`PeriodoId`, T1.`PeriodoCierreEstado`, T1.`PropositoPeriodoCodigo`, T1.`PeriodoCierreEmpresaId`, T2.`PeriodoDescripcion` FROM (`PeriodoCierre` T1 LEFT JOIN `Periodo` T2 ON T2.`PeriodoId` = T1.`PeriodoId`) WHERE (T1.`PeriodoId` = 148) AND (( T1.`PeriodoCierreEmpresaId` = 1 or (1 = 0))) AND (T1.`PeriodoCierreEstado` <> 'PEND') AND (T1.`PropositoPeriodoCodigo` = 'CIERREALMACEN') ORDER BY T1.`PeriodoId`  LIMIT 1
SELECT COUNT(*) FROM (((((((((((((`InventarioStockItem` T1 INNER JOIN `Producto` T6 ON T6.`ProductoId` = T1.`InvItemProductoId`) LEFT JOIN `Unidad` T7 ON T7.`UnidadCodigo` = T6.`ProductoUnidadStockCodigo`) LEFT JOIN `Categoria` T11 ON T11.`CategoriaId` = T6.`ProductoCategoriaId`) LEFT JOIN `Unidad` T8 ON T8.`UnidadCodigo` = T6.`ProductoUnidadStock1Codigo`) LEFT JOIN `Unidad` T9 ON T9.`UnidadCodigo` = T6.`ProductoUnidadStock2Codigo`) LEFT JOIN `Unidad` T10 ON T10.`UnidadCodigo` = T6.`ProductoUnidadStock3Codigo`) INNER JOIN `Deposito` T3 ON T3.`DepositoId` = T1.`InvItemDepositoId`) LEFT JOIN `DepositoUbicacion` T4 ON T4.`DepositoId` = T1.`InvItemDepositoId` AND T4.`DepositoUbicacionId` = T1.`InvItemDepositoUbicacionId`) LEFT JOIN `Contenedor` T5 ON T5.`ContenedorId` = T1.`InvItemContenedorId`) INNER JOIN `TipoStock` T13 ON T13.`TipoStockCodigo` = T1.`InvItemTipoStockCodigo`) LEFT JOIN `LoteStock` T12 ON T12.`LoteStockId` = T1.`InvItemLoteId`) LEFT JOIN `ItemStockSerial` T14 ON T14.`ItemSerialId` = T1.`InvItemItemSerialId`) INNER JOIN `Empresa` T2 ON T2.`EmpresaId` = T1.`InvItemEmpresaDisponibleId`) WHERE (T1.`InvItemCentroAlmacenajeId` = 1) and (T1.`InvItemCantidadUniStock` > 0 or T1.`InvItemCantidadUniStock1` > 0 or T1.`InvItemCantidadUniStock2` > 0 or T1.`InvItemCantidadUniStock3` > 0) and (T1.`InvItemEmpresaDisponibleId` = 1) and (T1.`InvItemPeriodoId` = 148) and (T1.`InvItemCentroAlmacenajeId` = 1) and (T6.`ProductoCodigoDescripcion` like CONCAT(CONCAT('%', '002920%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'), '%') or T2.`EmpresaCodigoNombre` like CONCAT(CONCAT('%', '002920%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'), '%') or T3.`DepositoNombre` like CONCAT(CONCAT('%', '002920%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'), '%') or T4.`DepositoUbicacionDescripcion` like CONCAT(CONCAT('%', '002920%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'), '%') or T5.`ContenedorDescripcion` like CONCAT(CONCAT('%', '002920%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'), '%') or T13.`TipoStockDescripcion` like CONCAT(CONCAT('%', '002920%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'), '%') or T12.`LoteStockDescripcion` like CONCAT(CONCAT('%', '002920%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'), '%') or T14.`ItemSerialCodigo` like CONCAT(CONCAT('%', '002920%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'), '%') or T11.`CategoriaPath` like CONCAT(CONCAT('%', '002920%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'), '%'))
SELECT  T2.`ProductoUnidadStockCodigo` AS InvItemProductoUnidadStockCodi, T2.`ProductoCategoriaId` AS InvItemProductoCategoriaId, T1.`InvItemProductoId` AS InvItemProductoId, T1.`InvItemDepositoId` AS InvItemDepositoId, T1.`InvItemDepositoUbicacionId` AS InvItemDepositoUbicacionId, T1.`InvItemContenedorId` AS InvItemContenedorId, T1.`InvItemTipoStockCodigo` AS InvItemTipoStockCodigo, T1.`InvItemLoteId` AS InvItemLoteId, T1.`InvItemItemSerialId` AS InvItemItemSerialId, T2.`ProductoUnidadStock1Codigo` AS InvItemProductoUnidadStock1Cod, T2.`ProductoUnidadStock2Codigo` AS InvItemProductoUnidadStock2Cod, T2.`ProductoUnidadStock3Codigo` AS InvItemProductoUnidadStock3Cod, T1.`InvItemCentroAlmacenajeId`, T4.`CategoriaPath` AS InvItemProductoCategoriaPath, T1.`InvItemPeriodoId`, T1.`InvItemEmpresaDisponibleId` AS InvItemEmpresaDisponibleId, T7.`UnidadSimbolo` AS InvItemProductoUnidadStock3Sim, T1.`InvItemCantidadUniStock3`, T6.`UnidadSimbolo` AS InvItemProductoUnidadStock2Sim, T1.`InvItemCantidadUniStock2`, T5.`UnidadSimbolo` AS InvItemProductoUnidadStock1Sim, T1.`InvItemCantidadUniStock1`, T3.`UnidadSimbolo` AS InvItemProductoUnidadStockSimb, T1.`InvItemCantidadUniStock`, T13.`ItemSerialCodigo` AS InvItemItemSerialCodigo, T12.`LoteStockDescripcion` AS InvItemLoteDescripcion, T11.`TipoStockDescripcion` AS InvItemTipoStockDescripcion, T10.`ContenedorDescripcion` AS InvItemContenedorDescripcion, T9.`DepositoUbicacionDescripcion` AS InvItemDepositoUbicacionDescri, T8.`DepositoNombre` AS InvItemDepositoNombre, T14.`EmpresaCodigoNombre` AS InvItemEmpresaDisponibleCodigo, T2.`ProductoCodigoDescripcion` AS InvItemProductoCodigoDescripci, T1.`InvItemId` FROM (((((((((((((`InventarioStockItem` T1 INNER JOIN `Producto` T2 ON T2.`ProductoId` = T1.`InvItemProductoId`) LEFT JOIN `Unidad` T3 ON T3.`UnidadCodigo` = T2.`ProductoUnidadStockCodigo`) LEFT JOIN `Categoria` T4 ON T4.`CategoriaId` = T2.`ProductoCategoriaId`) LEFT JOIN `Unidad` T5 ON T5.`UnidadCodigo` = T2.`ProductoUnidadStock1Codigo`) LEFT JOIN `Unidad` T6 ON T6.`UnidadCodigo` = T2.`ProductoUnidadStock2Codigo`) LEFT JOIN `Unidad` T7 ON T7.`UnidadCodigo` = T2.`ProductoUnidadStock3Codigo`) INNER JOIN `Deposito` T8 ON T8.`DepositoId` = T1.`InvItemDepositoId`) LEFT JOIN `DepositoUbicacion` T9 ON T9.`DepositoId` = T1.`InvItemDepositoId` AND T9.`DepositoUbicacionId` = T1.`InvItemDepositoUbicacionId`) LEFT JOIN `Contenedor` T10 ON T10.`ContenedorId` = T1.`InvItemContenedorId`) INNER JOIN `TipoStock` T11 ON T11.`TipoStockCodigo` = T1.`InvItemTipoStockCodigo`) LEFT JOIN `LoteStock` T12 ON T12.`LoteStockId` = T1.`InvItemLoteId`) LEFT JOIN `ItemStockSerial` T13 ON T13.`ItemSerialId` = T1.`InvItemItemSerialId`) INNER JOIN `Empresa` T14 ON T14.`EmpresaId` = T1.`InvItemEmpresaDisponibleId`) WHERE (T1.`InvItemCentroAlmacenajeId` = 1) and (T1.`InvItemCantidadUniStock` > 0 or T1.`InvItemCantidadUniStock1` > 0 or T1.`InvItemCantidadUniStock2` > 0 or T1.`InvItemCantidadUniStock3` > 0) and (T1.`InvItemEmpresaDisponibleId` = 1) and (T1.`InvItemPeriodoId` = 148) and (T1.`InvItemCentroAlmacenajeId` = 1) and (T2.`ProductoCodigoDescripcion` like CONCAT(CONCAT('%', '002920%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'), '%') or T14.`EmpresaCodigoNombre` like CONCAT(CONCAT('%', '002920%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'), '%') or T8.`DepositoNombre` like CONCAT(CONCAT('%', '002920%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'), '%') or T9.`DepositoUbicacionDescripcion` like CONCAT(CONCAT('%', '002920%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'), '%') or T10.`ContenedorDescripcion` like CONCAT(CONCAT('%', '002920%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'), '%') or T11.`TipoStockDescripcion` like CONCAT(CONCAT('%', '002920%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'), '%') or T12.`LoteStockDescripcion` like CONCAT(CONCAT('%', '002920%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'), '%') or T13.`ItemSerialCodigo` like CONCAT(CONCAT('%', '002920%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'), '%') or T4.`CategoriaPath` like CONCAT(CONCAT('%', '002920%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'), '%')) ORDER BY T2.`ProductoCodigoDescripcion` LIMIT 0, 101

SELECT `EmpresaId`, `EmpresaNombre` FROM `Empresa` WHERE `EmpresaId` = 1 ORDER BY `EmpresaId`;
SELECT `UsuarioCodigo`, `UsuarioPersonaId` FROM `Usuario` WHERE `UsuarioCodigo` = 'KDOSBUSER' ORDER BY `UsuarioCodigo`;
SELECT T1.`PersonaFisicaId` AS PersonaFisicaId, T1.`PersonaFisicaPrimerNombre`, T1.`PersonaFisicaPrimerApellido`, T2.`PersonaImagen` FROM (`PersonaFisica` T1 INNER JOIN `Persona` T2 ON T2.`PersonaId` = T1.`PersonaFisicaId`) WHERE T1.`PersonaFisicaId` = 3398 ORDER BY T1.`PersonaFisicaId`
SELECT T1.`ItemSerialProductoId` AS ItemSerialProductoId, T1.`ItemSerialId`, T1.`ItemSerialCodigo`, T2.`ProductoDescripcion` AS ItemSerialProductoDescripcion FROM (`ItemStockSerial` T1 INNER JOIN `Producto` T2 ON T2.`ProductoId` = T1.`ItemSerialProductoId`) WHERE T1.`ItemSerialId` = 307 ORDER BY T1.`ItemSerialId`  LIMIT 1
SELECT `K2BRPPGridName`, `K2BRPPPgmName`, `K2BRPPUserCode`, `K2BRPPTenantCode`, `K2BRPPRows`, `K2BRowsPerPageId` FROM `RowsPerPage` WHERE `K2BRPPTenantCode` = '' and `K2BRPPUserCode` = 'KDOSBUSER' and `K2BRPPPgmName` = 'HItemStockSerialInventarioStockItemWC' and `K2BRPPGridName` = 'Grid' ORDER BY `K2BRPPTenantCode`, `K2BRPPUserCode`, `K2BRPPPgmName`, `K2BRPPGridName`  LIMIT 1
SELECT `UnidadCodigo`, `UnidadSimbolo`, `UnidadDescripcion` FROM `Unidad` WHERE `UnidadCodigo` = 'UAF' ORDER BY `UnidadCodigo`
SELECT COUNT(*) FROM ((((((((((`InventarioStockItem` T1 INNER JOIN `Producto` T6 ON T6.`ProductoId` = T1.`InvItemProductoId`) LEFT JOIN `Unidad` T7 ON T7.`UnidadCodigo` = T6.`ProductoUnidadStockCodigo`) LEFT JOIN `LoteStock` T8 ON T8.`LoteStockId` = T1.`InvItemLoteId`) LEFT JOIN `Producto` T9 ON T9.`ProductoId` = T8.`LoteStockProductoId`) INNER JOIN `Periodo` T11 ON T11.`PeriodoId` = T1.`InvItemPeriodoId`) INNER JOIN `CentroAlmacenaje` T5 ON T5.`CentroAlmacenajeId` = T1.`InvItemCentroAlmacenajeId`) INNER JOIN `Deposito` T2 ON T2.`DepositoId` = T1.`InvItemDepositoId`) LEFT JOIN `DepositoUbicacion` T3 ON T3.`DepositoId` = T1.`InvItemDepositoId` AND T3.`DepositoUbicacionId` = T1.`InvItemDepositoUbicacionId`) LEFT JOIN `Contenedor` T4 ON T4.`ContenedorId` = T1.`InvItemContenedorId`) INNER JOIN `TipoStock` T10 ON T10.`TipoStockCodigo` = T1.`InvItemTipoStockCodigo`) WHERE (T1.`InvItemItemSerialId` = 307);
SELECT  T1.`InvItemProductoId` AS InvItemProductoId, T2.`ProductoUnidadStockCodigo` AS InvItemProductoUnidadStockCodi, T1.`InvItemLoteId` AS InvItemLoteId, T4.`LoteStockProductoId` AS LoteStockProductoId, T6.`PeriodoFechaFin` AS InvItemPeriodoFechaFin, T5.`ProductoUnidadStockCodigo`, T1.`InvItemPeriodoId` AS InvItemPeriodoId, T1.`InvItemCentroAlmacenajeId` AS InvItemCentroAlmacenajeId, T1.`InvItemDepositoId` AS InvItemDepositoId, T1.`InvItemDepositoUbicacionId` AS InvItemDepositoUbicacionId, T1.`InvItemContenedorId` AS InvItemContenedorId, T1.`InvItemTipoStockCodigo` AS InvItemTipoStockCodigo, T1.`InvItemItemSerialId`, T3.`UnidadSimbolo` AS InvItemProductoUnidadStockSimb, T1.`InvItemCantidadUniStock`, T11.`TipoStockDescripcion` AS InvItemTipoStockDescripcion, T10.`ContenedorDescripcion` AS InvItemContenedorDescripcion, T9.`DepositoUbicacionDescripcion` AS InvItemDepositoUbicacionDescri, T8.`DepositoNombre` AS InvItemDepositoNombre, T7.`CentroAlmacenajeNombre` AS InvItemCentroAlmacenajeNombre, T6.`PeriodoDescripcion` AS InvItemPeriodoDescripcion, T1.`InvItemId` FROM ((((((((((`InventarioStockItem` T1 INNER JOIN `Producto` T2 ON T2.`ProductoId` = T1.`InvItemProductoId`) LEFT JOIN `Unidad` T3 ON T3.`UnidadCodigo` = T2.`ProductoUnidadStockCodigo`) LEFT JOIN `LoteStock` T4 ON T4.`LoteStockId` = T1.`InvItemLoteId`) LEFT JOIN `Producto` T5 ON T5.`ProductoId` = T4.`LoteStockProductoId`) INNER JOIN `Periodo` T6 ON T6.`PeriodoId` = T1.`InvItemPeriodoId`) INNER JOIN `CentroAlmacenaje` T7 ON T7.`CentroAlmacenajeId` = T1.`InvItemCentroAlmacenajeId`) INNER JOIN `Deposito` T8 ON T8.`DepositoId` = T1.`InvItemDepositoId`) LEFT JOIN `DepositoUbicacion` T9 ON T9.`DepositoId` = T1.`InvItemDepositoId` AND T9.`DepositoUbicacionId` = T1.`InvItemDepositoUbicacionId`) LEFT JOIN `Contenedor` T10 ON T10.`ContenedorId` = T1.`InvItemContenedorId`) INNER JOIN `TipoStock` T11 ON T11.`TipoStockCodigo` = T1.`InvItemTipoStockCodigo`) WHERE (T1.`InvItemItemSerialId` = 307) ORDER BY T6.`PeriodoFechaFin` DESC LIMIT 0, 51;

#63
SELECT * FROM k2b_prod.INVENTARIOSTOCKITEM I WHERE I.INVITEMITEMSERIALID=307 AND I.INVITEMPERIODOID IN (125, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 143, 144, 145, 146);
SELECT * FROM k2b_prod.PERIODO P WHERE P.PERIODOID IN (125, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 143, 144, 145, 146); #P.PERIODOID IN (98, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 143, 144, 145, 146);
SELECT * FROM k2b_prod.DEPOSITO D; # = 176

#movimientos
SELECT  T1.`MovActivoFijoItemId`, T1.`MovActivoFijoItemBienId`, T3.`MovActivoFijoTipoTransaccionCo` AS MovActivoFijoTipoTransaccionCo, T6.`MovActivoFijoInvPersonaId` AS MovActivoFijoInvPersonaId, T6.`MovActivoFijoInvPersonaRespId` AS MovActivoFijoInvPersonaRespId, T6.`MovActivoFijoInvLugarFisicoId` AS MovActivoFijoInvLugarFisicoId, T6.`MovActivoFijoInvSectorId` AS MovActivoFijoInvSectorId, T6.`MovActivoFijoInvPerJuridicaId` AS MovActivoFijoInvPerJuridicaId, T6.`MovActivoFijoInvDireccionId` AS MovActivoFijoInvDireccionId, T6.`MovActivoFijoInvCentroAlmId` AS MovActivoFijoInvCentroAlmId, T1.`MovActivoFijoItemEstadoConsCod` AS MovActivoFijoItemEstadoConsCod, T6.`MovActivoFijoInvTipoUbicacion`, T13.`CentroAlmacenajeNombre` AS MovActivoFijoInvCentroAlmNombr, T1.`MovActivoFijoItemFechaValor`, T3.`MovActivoFijoEstado`, T2.`EstadoConsBienActivoFijoDescri` AS MovActivoFijoItemEstadoConsDes, T12.`DireccionDescripcion` AS MovActivoFijoInvDireccionDescr, T11.`PersonaNombre` AS MovActivoFijoInvPerJuridicaNom, T10.`SectorNombre` AS MovActivoFijoInvSectorNombre, T9.`LugarFisicoNombre` AS MovActivoFijoInvLugarFisicoNom, T8.`PersonaNombre` AS MovActivoFijoInvPersonaRespNom, T6.`MovActivoFijoInvTipoMov`, T7.`PersonaNombre` AS MovActivoFijoInvPersonaNombre, T4.`TipoTrnActivoFijoTipoMovimient` AS MovActivoFijoTipoTrnTipoMovimi, T5.`TipoTransaccionNombre` AS MovActivoFijoTipoTransaccionNo, T3.`MovActivoFijoEmpresaId`, T3.`MovActivoFijoFechaValor`, T1.`MovActivoFijoInvId`, T1.`MovActivoFijoDetId`, T3.`MovActivoFijoCodigo`, T1.`MovActivoFijoId` FROM ((((((((((((`MovimientoActivoFijoItem` T1 INNER JOIN `EstadoConsBienActivoFijo` T2 ON T2.`EstadoConsBienActivoFijoCodigo` = T1.`MovActivoFijoItemEstadoConsCod`) INNER JOIN `MovimientoActivoFijo` T3 ON T3.`MovActivoFijoId` = T1.`MovActivoFijoId`) INNER JOIN `TipoTransaccionActivoFijo` T4 ON T4.`TipoTrnActivoFijoCodigo` = T3.`MovActivoFijoTipoTransaccionCo`) INNER JOIN `TipoTransaccion` T5 ON T5.`TipoTransaccionCodigo` = T3.`MovActivoFijoTipoTransaccionCo`) INNER JOIN `MovimientoActivoFijoInventario` T6 ON T6.`MovActivoFijoId` = T1.`MovActivoFijoId` AND T6.`MovActivoFijoDetId` = T1.`MovActivoFijoDetId` AND T6.`MovActivoFijoInvId` = T1.`MovActivoFijoInvId`) LEFT JOIN `Persona` T7 ON T7.`PersonaId` = T6.`MovActivoFijoInvPersonaId`) LEFT JOIN `Persona` T8 ON T8.`PersonaId` = T6.`MovActivoFijoInvPersonaRespId`) LEFT JOIN `LugarFisico` T9 ON T9.`LugarFisicoId` = T6.`MovActivoFijoInvLugarFisicoId`) LEFT JOIN `Sector` T10 ON T10.`LugarFisicoId` = T6.`MovActivoFijoInvLugarFisicoId` AND T10.`SectorId` = T6.`MovActivoFijoInvSectorId`) LEFT JOIN `Persona` T11 ON T11.`PersonaId` = T6.`MovActivoFijoInvPerJuridicaId`) LEFT JOIN `Direccion` T12 ON T12.`DireccionId` = T6.`MovActivoFijoInvDireccionId`) LEFT JOIN `CentroAlmacenaje` T13 ON T13.`CentroAlmacenajeId` = T6.`MovActivoFijoInvCentroAlmId`) WHERE (T1.`MovActivoFijoItemBienId` = 312) ORDER BY T1.`MovActivoFijoItemFechaValor` DESC, T1.`MovActivoFijoId` DESC, T6.`MovActivoFijoInvTipoMov` LIMIT 0, 51;

SELECT * from MOVIMIENTOACTIVOFIJOITEM T1 WHERE T1.MOVACTIVOFIJOITEMBIENID = 312;

UPDATE K2B_PROD.MOVIMIENTOACTIVOFIJOITEM T
SET T.MOVACTIVOFIJOITEMFECHAVALOR = '2023-12-31'
WHERE T.MOVACTIVOFIJOID = 164187 AND T.MOVACTIVOFIJODETID = 1 AND T.MOVACTIVOFIJOINVID = 5 AND T.MOVACTIVOFIJOITEMID = 1;

#----movimiento actiov fijo
SELECT * FROM k2b_prod.INVENTARIOSTOCKITEM I WHERE I.INVITEMID=30328;
SELECT * FROM k2b_prod.INVENTARIOSTOCKPRODUCTO I;
SELECT * FROM k2b_prod.DEPOSITO D;

SELECT  T1.`InvActivoFijoBienId`, T1.`InvActivoFijoTipoUbicacion`, T1.`InvActivoFijoDireccionId` AS InvActivoFijoDireccionId, T1.`InvActivoFijoEstadoConsCodigo` AS InvActivoFijoEstadoConsCodigo, T11.`PeriodoFechaFin` AS InvActivoFijoPeriodoFechaFin, T1.`InvActivoFijoId`, T3.`EstadoConsBienActivoFijoDescri` AS InvActivoFijoEstadoConsDescrip, T1.`InvActivoFijoFechaInicioResgua`, T4.`CentroAlmacenajeNombre` AS InvActivoFijoCentroAlmacenajeN, T1.`InvActivoFijoCentroAlmacenajeI` AS InvActivoFijoCentroAlmacenajeI, T2.`DireccionDescripcion` AS InvActivoFijoDireccionDescripc, T5.`PersonaNombre` AS InvActivoFijoPersonaJuridicaNo, T1.`InvActivoFijoPersonaJuridicaId` AS InvActivoFijoPersonaJuridicaId, T7.`SectorNombre` AS InvActivoFijoSectorNombre, T1.`InvActivoFijoSectorId` AS InvActivoFijoSectorId, T6.`LugarFisicoNombre` AS InvActivoFijoLugarFisicoNombre, T1.`InvActivoFijoLugarFisicoId` AS InvActivoFijoLugarFisicoId, T8.`PersonaNombre` AS InvActivoFijoPersonaRespNombre, T1.`InvActivoFijoPersonaRespId` AS InvActivoFijoPersonaRespId, T9.`PersonaNombre` AS InvActivoFijoPersonaNombre, T1.`InvActivoFijoPersonaId` AS InvActivoFijoPersonaId, T10.`EmpresaNombre` AS InvActivoFijoEmpresaNombre, T1.`InvActivoFijoEmpresaId` AS InvActivoFijoEmpresaId, T11.`PeriodoDescripcion` AS InvActivoFijoPeriodoDescripcio, T1.`InvActivoFijoPeriodoId` AS InvActivoFijoPeriodoId FROM ((((((((((`InventarioActivoFijo` T1 LEFT JOIN `Direccion` T2 ON T2.`DireccionId` = T1.`InvActivoFijoDireccionId`) INNER JOIN `EstadoConsBienActivoFijo` T3 ON T3.`EstadoConsBienActivoFijoCodigo` = T1.`InvActivoFijoEstadoConsCodigo`) LEFT JOIN `CentroAlmacenaje` T4 ON T4.`CentroAlmacenajeId` = T1.`InvActivoFijoCentroAlmacenajeI`) LEFT JOIN `Persona` T5 ON T5.`PersonaId` = T1.`InvActivoFijoPersonaJuridicaId`) LEFT JOIN `LugarFisico` T6 ON T6.`LugarFisicoId` = T1.`InvActivoFijoLugarFisicoId`) LEFT JOIN `Sector` T7 ON T7.`LugarFisicoId` = T1.`InvActivoFijoLugarFisicoId` AND T7.`SectorId` = T1.`InvActivoFijoSectorId`) LEFT JOIN `Persona` T8 ON T8.`PersonaId` = T1.`InvActivoFijoPersonaRespId`) LEFT JOIN `Persona` T9 ON T9.`PersonaId` = T1.`InvActivoFijoPersonaId`) INNER JOIN `Empresa` T10 ON T10.`EmpresaId` = T1.`InvActivoFijoEmpresaId`) INNER JOIN `Periodo` T11 ON T11.`PeriodoId` = T1.`InvActivoFijoPeriodoId`) WHERE (T1.`InvActivoFijoBienId` = 44947) ORDER BY T1.`InvActivoFijoBienId`, T11.`PeriodoFechaFin` DESC LIMIT 0, 101;
SELECT  T1.`InvActivoFijoBienId`, T1.`InvActivoFijoTipoUbicacion`, T1.`InvActivoFijoDireccionId` AS InvActivoFijoDireccionId, T1.`InvActivoFijoEstadoConsCodigo` AS InvActivoFijoEstadoConsCodigo, T11.`PeriodoFechaFin` AS InvActivoFijoPeriodoFechaFin, T1.`InvActivoFijoId`, T3.`EstadoConsBienActivoFijoDescri` AS InvActivoFijoEstadoConsDescrip, T1.`InvActivoFijoFechaInicioResgua`, T4.`CentroAlmacenajeNombre` AS InvActivoFijoCentroAlmacenajeN, T1.`InvActivoFijoCentroAlmacenajeI` AS InvActivoFijoCentroAlmacenajeI, T2.`DireccionDescripcion` AS InvActivoFijoDireccionDescripc, T5.`PersonaNombre` AS InvActivoFijoPersonaJuridicaNo, T1.`InvActivoFijoPersonaJuridicaId` AS InvActivoFijoPersonaJuridicaId, T7.`SectorNombre` AS InvActivoFijoSectorNombre, T1.`InvActivoFijoSectorId` AS InvActivoFijoSectorId, T6.`LugarFisicoNombre` AS InvActivoFijoLugarFisicoNombre, T1.`InvActivoFijoLugarFisicoId` AS InvActivoFijoLugarFisicoId, T8.`PersonaNombre` AS InvActivoFijoPersonaRespNombre, T1.`InvActivoFijoPersonaRespId` AS InvActivoFijoPersonaRespId, T9.`PersonaNombre` AS InvActivoFijoPersonaNombre, T1.`InvActivoFijoPersonaId` AS InvActivoFijoPersonaId, T10.`EmpresaNombre` AS InvActivoFijoEmpresaNombre, T1.`InvActivoFijoEmpresaId` AS InvActivoFijoEmpresaId, T11.`PeriodoDescripcion` AS InvActivoFijoPeriodoDescripcio, T1.`InvActivoFijoPeriodoId` AS InvActivoFijoPeriodoId FROM ((((((((((`InventarioActivoFijo` T1 LEFT JOIN `Direccion` T2 ON T2.`DireccionId` = T1.`InvActivoFijoDireccionId`) INNER JOIN `EstadoConsBienActivoFijo` T3 ON T3.`EstadoConsBienActivoFijoCodigo` = T1.`InvActivoFijoEstadoConsCodigo`) LEFT JOIN `CentroAlmacenaje` T4 ON T4.`CentroAlmacenajeId` = T1.`InvActivoFijoCentroAlmacenajeI`) LEFT JOIN `Persona` T5 ON T5.`PersonaId` = T1.`InvActivoFijoPersonaJuridicaId`) LEFT JOIN `LugarFisico` T6 ON T6.`LugarFisicoId` = T1.`InvActivoFijoLugarFisicoId`) LEFT JOIN `Sector` T7 ON T7.`LugarFisicoId` = T1.`InvActivoFijoLugarFisicoId` AND T7.`SectorId` = T1.`InvActivoFijoSectorId`) LEFT JOIN `Persona` T8 ON T8.`PersonaId` = T1.`InvActivoFijoPersonaRespId`) LEFT JOIN `Persona` T9 ON T9.`PersonaId` = T1.`InvActivoFijoPersonaId`) INNER JOIN `Empresa` T10 ON T10.`EmpresaId` = T1.`InvActivoFijoEmpresaId`) INNER JOIN `Periodo` T11 ON T11.`PeriodoId` = T1.`InvActivoFijoPeriodoId`) WHERE (T1.`InvActivoFijoBienId` = 44947) ORDER BY T1.`InvActivoFijoBienId`, T11.`PeriodoFechaFin` DESC LIMIT 0, 21;

select * FROM k2b_prod.INVENTARIOACTIVOFIJO I WHERE `INVACTIVOFIJOBIENID` =44947;
SELECT  * FROM k2b_prod.MOVIMIENTOACTIVOFIJO M WHERE M.MOVACTIVOFIJOID=157428;
#--PANTALLA MOVIMEINTO ACTIVO FIJO
SELECT T2.`MOVACTIVOFIJOTIPOTRANSACCIONCO` AS MOVACTIVOFIJOTIPOTRANSACCIONCO, T3.`TIPOTRNACTIVOFIJOVALIDARECEPCI` AS MOVACTIVOFIJOTIPOTRNVALIDARECE, T4.`MOVACTIVOFIJOINVTIPOMOV`, T1.`MOVACTIVOFIJOITEMID`, T1.`MOVACTIVOFIJOINVID`, T1.`MOVACTIVOFIJODETID`, T1.`MOVACTIVOFIJOID`, T2.`MOVACTIVOFIJOESTADO`, T1.`MOVACTIVOFIJOITEMESTADOENTREGA` FROM (((`MOVIMIENTOACTIVOFIJOITEM` T1 INNER JOIN `MOVIMIENTOACTIVOFIJO` T2 ON T2.`MOVACTIVOFIJOID` = T1.`MOVACTIVOFIJOID`) INNER JOIN `TIPOTRANSACCIONACTIVOFIJO` T3 ON T3.`TIPOTRNACTIVOFIJOCODIGO` = T2.`MOVACTIVOFIJOTIPOTRANSACCIONCO`) INNER JOIN `MOVIMIENTOACTIVOFIJOINVENTARIO` T4 ON T4.`MOVACTIVOFIJOID` = T1.`MOVACTIVOFIJOID` AND T4.`MOVACTIVOFIJODETID` = T1.`MOVACTIVOFIJODETID` AND T4.`MOVACTIVOFIJOINVID` = T1.`MOVACTIVOFIJOINVID`) WHERE (T1.`MOVACTIVOFIJOID` = 157428) AND (T4.`MOVACTIVOFIJOINVTIPOMOV` = 'Alta')   AND (T3.`TIPOTRNACTIVOFIJOVALIDARECEPCI` = 1)   AND (T1.`MOVACTIVOFIJODETID` = 1) ORDER BY T1.`MOVACTIVOFIJOID`;

SELECT * FROM k2b_prod.MOVIMIENTOACTIVOFIJOITEM M WHERE M.MOVACTIVOFIJOID=157428;
SELECT  * FROM k2b_prod.MOVIMIENTOACTIVOFIJO M WHERE M.MOVACTIVOFIJOID=157428;

SELECT *
FROM k2b_prod.BIENACTIVOFIJO B
WHERE B.BIENACTIVOFIJOID IN (30333);
#--WHERE B.BIENACTIVOFIJOCODIGO='AF-026155';

SELECT M.* FROM k2b_prod.MOVIMIENTOACTIVOFIJO M WHERE M.MOVACTIVOFIJOCODIGO IN (160314,162978);
SELECT M.* FROM k2b_prod.MOVIMIENTOACTIVOFIJO M WHERE M.MOVACTIVOFIJOCODIGO IN (151750);
#resguardo
select * FROM k2b_prod.INVENTARIOACTIVOFIJO I WHERE
                                                  INVACTIVOFIJOBIENID =30333;
SELECT * FROM k2b_prod.PERIODO P;

SELECT * FROM k2b_prod.MOVIMIENTOACTIVOFIJODETALLE M WHERE M.MOVACTIVOFIJOID IN (27722, 27723, 27725, 27726, 27727, 27728, 27729, 27730, 27731, 27733, 27734, 27735, 27738, 27742, 27744, 27748, 27752, 27753, 27754, 27756, 27757, 27758, 27759, 27761)

SELECT T1.`INVACTIVOFIJOID`,
       T1.`INVACTIVOFIJOBIENID`            AS INVACTIVOFIJOBIENID,
       T2.`BIENACTIVOFIJOCODIGO`           AS INVACTIVOFIJOBIENCODIGO,
       T2.`BIENACTIVOFIJONUMEROSERIE`      AS INVACTIVOFIJOBIENNUMEROSERIE,
       T2.`BIENACTIVOFIJODESCRIPCION`      AS INVACTIVOFIJOBIENDESCRIPCION,
       T2.`BIENACTIVOFIJOCONCEPTOEGREID`   AS INVACTIVOFIJOBIENCONCEPTOEGREI,
       T1.`INVACTIVOFIJOPRODUCTOID`        AS INVACTIVOFIJOPRODUCTOID,
       T3.`PRODUCTOCODIGO`                 AS INVACTIVOFIJOPRODUCTOCODIGO,
       T3.`PRODUCTODESCRIPCION`            AS INVACTIVOFIJOPRODUCTODESCRIPCI,
       T3.`PRODUCTOCODIGODESCRIPCION`      AS INVACTIVOFIJOPRODUCTOCODIGODES,
       T1.`INVACTIVOFIJOESTADOCONSCODIGO`,
       T1.`INVACTIVOFIJOBIENESCOMPUESTO`,
       T1.`INVACTIVOFIJOTIPOBIEN`,
       T1.`INVACTIVOFIJOTIPOANEXO`,
       T2.`BIENACTIVOFIJOGRUPO`            AS INVACTIVOFIJOBIENGRUPO,
       T1.`INVACTIVOFIJOBIENCOMPID`        AS INVACTIVOFIJOBIENCOMPID,
       T4.`BIENACTIVOFIJOCODIGO`           AS INVACTIVOFIJOBIENCOMPCODIGO,
       T4.`BIENACTIVOFIJONUMEROSERIE`      AS INVACTIVOFIJOBIENCOMPNUMEROSER,
       T4.`BIENACTIVOFIJODESCRIPCION`      AS INVACTIVOFIJOBIENCOMPDESCRIPCI,
       T4.`BIENACTIVOFIJOMOTIVOID`         AS INVACTIVOFIJOBIENCOMPMOTIVOID,
       T1.`INVACTIVOFIJOEMPRESAID`         AS INVACTIVOFIJOEMPRESAID,
       T5.`EMPRESANOMBRE`                  AS INVACTIVOFIJOEMPRESANOMBRE,
       T5.`EMPRESACODIGONOMBRE`            AS INVACTIVOFIJOEMPRESACODIGONOMB,
       T1.`INVACTIVOFIJOTIPOUBICACION`,
       T1.`INVACTIVOFIJOPERSONAID`         AS INVACTIVOFIJOPERSONAID,
       T1.`INVACTIVOFIJOROLCODIGO`,
       T6.`PERSONANOMBRE`                  AS INVACTIVOFIJOPERSONANOMBRE,
       T1.`INVACTIVOFIJOPERSONARESPID`     AS INVACTIVOFIJOPERSONARESPID,
       T7.`PERSONANOMBRE`                  AS INVACTIVOFIJOPERSONARESPNOMBRE,
       T1.`INVACTIVOFIJOPERSONAJURIDICAID` AS INVACTIVOFIJOPERSONAJURIDICAID,
       T8.`PERSONANOMBRE`                  AS INVACTIVOFIJOPERSONAJURIDICANO,
       T1.`INVACTIVOFIJODIRECCIONID`       AS INVACTIVOFIJODIRECCIONID,
       T9.`DIRECCIONDESCRIPCION`           AS INVACTIVOFIJODIRECCIONDESCRIPC,
       T1.`INVACTIVOFIJOLUGARFISICOID`     AS INVACTIVOFIJOLUGARFISICOID,
       T10.`LUGARFISICONOMBRE`             AS INVACTIVOFIJOLUGARFISICONOMBRE,
       T10.`LUGARFISICOCODIGONOMBRE`       AS INVACTIVOFIJOLUGARFISICOCODNOM,
       T1.`INVACTIVOFIJOSECTORID`          AS INVACTIVOFIJOSECTORID,
       T11.`SECTORNOMBRE`                  AS INVACTIVOFIJOSECTORNOMBRE,
       T11.`SECTORCODIGONOMBRE`            AS INVACTIVOFIJOSECTORCODIGONOMBR,
       T11.`SECTORENTRANSITO`              AS INVACTIVOFIJOSECTORENTRANSITO,
       T1.`INVACTIVOFIJOCENTROALMACENAJEI` AS INVACTIVOFIJOCENTROALMACENAJEI,
       T12.`CENTROALMACENAJENOMBRE`        AS INVACTIVOFIJOCENTROALMACENAJEN,
       T1.`INVACTIVOFIJOFECHAINICIORESGUA`,
       T1.`INVACTIVOFIJOFECHAFINRESGUARDO`,
       T1.`INVACTIVOFIJOPERIODOID`         AS INVACTIVOFIJOPERIODOID,
       T13.`PERIODODESCRIPCION`            AS INVACTIVOFIJOPERIODODESCRIPCIO,
       T1.`INVACTIVOFIJOAFECTACIONCOSTOID`
FROM ((((((((((((`INVENTARIOACTIVOFIJO` T1 INNER JOIN `BIENACTIVOFIJO` T2 ON T2.`BIENACTIVOFIJOID` = T1.`INVACTIVOFIJOBIENID`) LEFT JOIN `PRODUCTO` T3 ON T3.`PRODUCTOID` = T1.`INVACTIVOFIJOPRODUCTOID`) LEFT JOIN `BIENACTIVOFIJO` T4 ON T4.`BIENACTIVOFIJOID` = T1.`INVACTIVOFIJOBIENCOMPID`) INNER JOIN `EMPRESA` T5 ON T5.`EMPRESAID` = T1.`INVACTIVOFIJOEMPRESAID`) LEFT JOIN `PERSONA` T6 ON T6.`PERSONAID` = T1.`INVACTIVOFIJOPERSONAID`) LEFT JOIN `PERSONA` T7
            ON T7.`PERSONAID` = T1.`INVACTIVOFIJOPERSONARESPID`) LEFT JOIN `PERSONA` T8 ON T8.`PERSONAID` = T1.`INVACTIVOFIJOPERSONAJURIDICAID`) LEFT JOIN `DIRECCION` T9 ON T9.`DIRECCIONID` = T1.`INVACTIVOFIJODIRECCIONID`) LEFT JOIN `LUGARFISICO` T10 ON T10.`LUGARFISICOID` = T1.`INVACTIVOFIJOLUGARFISICOID`) LEFT JOIN `SECTOR` T11 ON T11.`LUGARFISICOID` = T1.`INVACTIVOFIJOLUGARFISICOID` AND T11.`SECTORID` = T1.`INVACTIVOFIJOSECTORID`) LEFT JOIN `CENTROALMACENAJE` T12
       ON T12.`CENTROALMACENAJEID` = T1.`INVACTIVOFIJOCENTROALMACENAJEI`) INNER JOIN `PERIODO` T13 ON T13.`PERIODOID` = T1.`INVACTIVOFIJOPERIODOID`)
WHERE T1.`INVACTIVOFIJOID` = 382330
ORDER BY T1.`INVACTIVOFIJOID`;

SELECT * FROM k2b_prod.MOVIMIENTOSTOCK M WHERE M.MOVSTOCKID=74761;
SELECT * FROM k2b_prod.INVENTARIOSTOCKITEM I WHERE I.INVITEMITEMSERIALID=30328;
SELECT * FROM k2b_prod.ITEMSTOCKSERIAL I WHERE I.ITEMSERIALID=30328
#BK
INSERT INTO k2b_prod.inventariostockitem (InvItemId, InvItemEmpresaDisponibleId, InvItemRolDisponibleCodigo, InvItemDepositoId, InvItemDepositoUbicacionId, InvItemContenedorId, InvItemPersonaAdministradorId, InvItemRolAdministradorCodigo, InvItemCantidadUniStock, InvItemCentroAlmacenajeId, InvItemProductoId, InvItemRolPropietarioCodigo, InvItemEmpresaPropietarioId, InvItemLoteId, InvItemTipoStockCodigo, InvItemPeriodoId, InvItemItemSerialId, InvItemPersonaDisponibleId, InvItemPersonaPropietarioId, InvItemCantidadUniStock1, InvItemCantidadUniStock2, InvItemCantidadUniStock3) VALUES (1264287, 1, 'EMPRESA', 176, null, null, 1, 'EMPRESA', 1.00000, 63, 3635, 'EMPRESA', 1, null, 'DISPONIBLE', 125, 30328, 1, 1, 0.00000, 0.00000, 0.00000);

SELECT * FROM k2b_prod.BIENACTIVOFIJO WHERE bienactivofijo.BIENACTIVOFIJOCODIGO='AF-028052';
SELECT * FROM k2b_prod.ORDENSTOCK O WHERE O.ORDENSTKID=36398;

SELECT * FROM k2b_prod.MOVIMIENTOACTIVOFIJODETALLE M;
SELECT * FROM k2b_prod.MOVIMIENTOACTIVOFIJO M;
SELECT * FROM k2b_prod.MOVIMIENTOACTIVOFIJOINVENTARIO m WHERE m.MOVACTIVOFIJOID=166299;
SELECT * FROM k2b_prod.MOVIMIENTOACTIVOFIJOITEM M WHERE m.MOVACTIVOFIJOID=166299;
SELECT  * FROM k2b_prod.MOVIMIENTOACTIVOFIJOITEM M WHERE m.MovActivoFijoItemNumeroSerie=002346;

INSERT INTO k2b_prod.movimientoactivofijoitem (MovActivoFijoId, MovActivoFijoDetId, MovActivoFijoInvId, MovActivoFijoItemId, MovActivoFijoItemBienId, MovActivoFijoItemNumeroSerie, MovActivoFijoItemDescripcion, MovActivoFijoItemFechaAdquisic, MovActivoFijoItemMarca, MovActivoFijoItemModelo, MovActivoFijoItemFechaComienzo, MovActivoFijoItemFechaVtoGaran, MovActivoFijoItemFechaInicioRe, MovActivoFijoItemFechaFinResgu, MovActivoFijoItemObservaciones, MovActivoFijoItemMotivoId, MovActivoFijoItemPaisOrigenCod, MovActivoFijoItemSerialId, MovActivoFijoItemProveedorId, MovActivoFijoItemNumeroFactura, MovActivoFijoItemUltimaLineaSe, MovActivoFijoItemFechaValor, MovActivoFijoItemFechaIngreso, MovActivoFijoItemEstado, MovActivoFijoItemEstadoConsCod, MovActivoFijoItemBienCompId, MovActivoFijoItemTipoBien, MovActivoFijoItemTipoAnexo, MovActivoFijoItemConcIngId, MovActivoFijoItemConcEgreId, MovActivoFijoItemEstadoEntrega) VALUES (29883, 1, 1, 1, 30333, '002346', 'AUTOMOVIL CHAPA: BGE 604 VOLKSWAGEN GOL SS BLANCO VARIOS S/N: 9BWAB45U7BT267239', '2016-02-23', '', '', '1000-01-01', '1000-01-01', '1000-01-01', '1000-01-01', 'Hasta el 2019 se depreciaba al mes siguiente', null, null, 30328, null, '', 1, '2020-12-01', '1000-01-01 00:00:00', 'Ejecutado', 'BUENO', null, 'PRINCIPAL', '', null, null, 'Pendiente');
INSERT INTO k2b_prod.movimientoactivofijoitem (MovActivoFijoId, MovActivoFijoDetId, MovActivoFijoInvId, MovActivoFijoItemId, MovActivoFijoItemBienId, MovActivoFijoItemNumeroSerie, MovActivoFijoItemDescripcion, MovActivoFijoItemFechaAdquisic, MovActivoFijoItemMarca, MovActivoFijoItemModelo, MovActivoFijoItemFechaComienzo, MovActivoFijoItemFechaVtoGaran, MovActivoFijoItemFechaInicioRe, MovActivoFijoItemFechaFinResgu, MovActivoFijoItemObservaciones, MovActivoFijoItemMotivoId, MovActivoFijoItemPaisOrigenCod, MovActivoFijoItemSerialId, MovActivoFijoItemProveedorId, MovActivoFijoItemNumeroFactura, MovActivoFijoItemUltimaLineaSe, MovActivoFijoItemFechaValor, MovActivoFijoItemFechaIngreso, MovActivoFijoItemEstado, MovActivoFijoItemEstadoConsCod, MovActivoFijoItemBienCompId, MovActivoFijoItemTipoBien, MovActivoFijoItemTipoAnexo, MovActivoFijoItemConcIngId, MovActivoFijoItemConcEgreId, MovActivoFijoItemEstadoEntrega) VALUES (164456, 5, 2, 1, 30333, '002346', 'AUTOMOVIL CHAPA: BGE 604 VOLKSWAGEN GOL SS BLANCO VARIOS S/N: 9BWAB45U7BT267239', '2023-12-01', '', '', '2023-12-01', '1000-01-01', '2023-12-01', '1000-01-01', '', null, null, 30328, null, '', 0, '2023-12-01', '1000-01-01 00:00:00', 'Ejecutado', 'BUENO', null, 'PRINCIPAL', '', null, null, 'Validado');
INSERT INTO k2b_prod.movimientoactivofijoitem (MovActivoFijoId, MovActivoFijoDetId, MovActivoFijoInvId, MovActivoFijoItemId, MovActivoFijoItemBienId, MovActivoFijoItemNumeroSerie, MovActivoFijoItemDescripcion, MovActivoFijoItemFechaAdquisic, MovActivoFijoItemMarca, MovActivoFijoItemModelo, MovActivoFijoItemFechaComienzo, MovActivoFijoItemFechaVtoGaran, MovActivoFijoItemFechaInicioRe, MovActivoFijoItemFechaFinResgu, MovActivoFijoItemObservaciones, MovActivoFijoItemMotivoId, MovActivoFijoItemPaisOrigenCod, MovActivoFijoItemSerialId, MovActivoFijoItemProveedorId, MovActivoFijoItemNumeroFactura, MovActivoFijoItemUltimaLineaSe, MovActivoFijoItemFechaValor, MovActivoFijoItemFechaIngreso, MovActivoFijoItemEstado, MovActivoFijoItemEstadoConsCod, MovActivoFijoItemBienCompId, MovActivoFijoItemTipoBien, MovActivoFijoItemTipoAnexo, MovActivoFijoItemConcIngId, MovActivoFijoItemConcEgreId, MovActivoFijoItemEstadoEntrega) VALUES (164456, 5, 3, 2, 30333, '002346', 'AUTOMOVIL CHAPA: BGE 604 VOLKSWAGEN GOL SS BLANCO VARIOS S/N: 9BWAB45U7BT267239', '2023-12-01', '', '', '2023-12-01', '1000-01-01', '2023-12-01', '1000-01-01', '', null, null, 30328, null, '', 0, '2023-12-01', '1000-01-01 00:00:00', 'Ejecutado', 'BUENO', null, 'PRINCIPAL', '', null, null, 'Validado');
INSERT INTO k2b_prod.movimientoactivofijoitem (MovActivoFijoId, MovActivoFijoDetId, MovActivoFijoInvId, MovActivoFijoItemId, MovActivoFijoItemBienId, MovActivoFijoItemNumeroSerie, MovActivoFijoItemDescripcion, MovActivoFijoItemFechaAdquisic, MovActivoFijoItemMarca, MovActivoFijoItemModelo, MovActivoFijoItemFechaComienzo, MovActivoFijoItemFechaVtoGaran, MovActivoFijoItemFechaInicioRe, MovActivoFijoItemFechaFinResgu, MovActivoFijoItemObservaciones, MovActivoFijoItemMotivoId, MovActivoFijoItemPaisOrigenCod, MovActivoFijoItemSerialId, MovActivoFijoItemProveedorId, MovActivoFijoItemNumeroFactura, MovActivoFijoItemUltimaLineaSe, MovActivoFijoItemFechaValor, MovActivoFijoItemFechaIngreso, MovActivoFijoItemEstado, MovActivoFijoItemEstadoConsCod, MovActivoFijoItemBienCompId, MovActivoFijoItemTipoBien, MovActivoFijoItemTipoAnexo, MovActivoFijoItemConcIngId, MovActivoFijoItemConcEgreId, MovActivoFijoItemEstadoEntrega) VALUES (166299, 1, 1, 1, 30333, '002346', '', '1000-01-01', '', '', '1000-01-01', '1000-01-01', '1000-01-01', '1000-01-01', '', null, null, 30328, null, '', 0, '2023-12-01', '1000-01-01 00:00:00', 'Ejecutado', 'BUENO', null, 'PRINCIPAL', '', null, null, 'Validado');
INSERT INTO k2b_prod.movimientoactivofijoitem (MovActivoFijoId, MovActivoFijoDetId, MovActivoFijoInvId, MovActivoFijoItemId, MovActivoFijoItemBienId, MovActivoFijoItemNumeroSerie, MovActivoFijoItemDescripcion, MovActivoFijoItemFechaAdquisic, MovActivoFijoItemMarca, MovActivoFijoItemModelo, MovActivoFijoItemFechaComienzo, MovActivoFijoItemFechaVtoGaran, MovActivoFijoItemFechaInicioRe, MovActivoFijoItemFechaFinResgu, MovActivoFijoItemObservaciones, MovActivoFijoItemMotivoId, MovActivoFijoItemPaisOrigenCod, MovActivoFijoItemSerialId, MovActivoFijoItemProveedorId, MovActivoFijoItemNumeroFactura, MovActivoFijoItemUltimaLineaSe, MovActivoFijoItemFechaValor, MovActivoFijoItemFechaIngreso, MovActivoFijoItemEstado, MovActivoFijoItemEstadoConsCod, MovActivoFijoItemBienCompId, MovActivoFijoItemTipoBien, MovActivoFijoItemTipoAnexo, MovActivoFijoItemConcIngId, MovActivoFijoItemConcEgreId, MovActivoFijoItemEstadoEntrega) VALUES (166299, 1, 2, 1, 30333, '002346', '', '1000-01-01', '', '', '1000-01-01', '1000-01-01', '1000-01-01', '1000-01-01', '', null, null, 30328, null, '', 0, '2023-12-01', '1000-01-01 00:00:00', 'Ejecutado', 'BUENO', null, 'PRINCIPAL', '', null, null, 'Validado');
INSERT INTO k2b_prod.movimientoactivofijoitem (MovActivoFijoId, MovActivoFijoDetId, MovActivoFijoInvId, MovActivoFijoItemId, MovActivoFijoItemBienId, MovActivoFijoItemNumeroSerie, MovActivoFijoItemDescripcion, MovActivoFijoItemFechaAdquisic, MovActivoFijoItemMarca, MovActivoFijoItemModelo, MovActivoFijoItemFechaComienzo, MovActivoFijoItemFechaVtoGaran, MovActivoFijoItemFechaInicioRe, MovActivoFijoItemFechaFinResgu, MovActivoFijoItemObservaciones, MovActivoFijoItemMotivoId, MovActivoFijoItemPaisOrigenCod, MovActivoFijoItemSerialId, MovActivoFijoItemProveedorId, MovActivoFijoItemNumeroFactura, MovActivoFijoItemUltimaLineaSe, MovActivoFijoItemFechaValor, MovActivoFijoItemFechaIngreso, MovActivoFijoItemEstado, MovActivoFijoItemEstadoConsCod, MovActivoFijoItemBienCompId, MovActivoFijoItemTipoBien, MovActivoFijoItemTipoAnexo, MovActivoFijoItemConcIngId, MovActivoFijoItemConcEgreId, MovActivoFijoItemEstadoEntrega) VALUES (173199, 1, 1, 1, 30333, '002346', 'AUTOMOVIL CHAPA: BGE 604 VOLKSWAGEN GOL SS BLANCO VARIOS S/N: 9BWAB45U7BT267239', '2016-02-23', '', '', '1000-01-01', '1000-01-01', '1000-01-01', '1000-01-01', 'Hasta el 2019 se depreciaba al mes siguiente', null, null, 30328, null, '', 0, '2023-12-31', '1000-01-01 00:00:00', 'Pendiente', 'BUENO', null, 'PRINCIPAL', '', null, null, 'Pendiente');

SELECT * FROM k2b_prod.INVENTARIOACTIVOFIJO I;

SELECT  *FROM k2b_prod.ITEMSTOCKSERIAL I WHERE I.ITEMSERIALID=30328;


SELECT B.BIENACTIVOFIJOIMPORTEMONEDALOC, B.BIENACTIVOFIJOIMPORTEMONEDAORI, B.BIENACTIVOFIJOIMPORTEMONEDAPRO,
       B.BIENACTIVOFIJOMONEDACODIGO, B.*
FROM K2B_PROD.BIENACTIVOFIJO B
WHERE B.BIENACTIVOFIJOCODIGO IN ('AF-027247');
#----------------------------ERROR INGRESA LINEA UBIACIÓN

SELECT * FROM k2b_prod.MOVIMIENTOSTOCK M WHERE M.MOVSTOCKID=71023;
SELECT * FROM