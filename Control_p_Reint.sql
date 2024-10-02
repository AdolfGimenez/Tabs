--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*DETALLES DE ACREDITACIONES Y CABECERA ES TCLTSB*/
Select * from gxfindta.tcltsd where TSBIDOP=1586760
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--sql para verificaciÃ³n de transmisiones
Select tsbdeop, tsbesta, tsbdeme, count(*) cantidad, sum(tsbimpo)Importe
from gxfindta.tcltsb where date(tsbfege) >='2022-10-05' and tsbtpop='04' --not in ('AC','RE')
group by tsbdeop,tsbesta, tsbdeme 
04--debito a comercio
02 --debito a entidades
03 --reversa contracargo
01 --pago a comercio
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*************************VERIFICA SI ES CORRECTO LA FORMA DE PAGO******************************************************
--Descripcion : algunos movientos registran formas de pago incorrectas
SELECT A.*,
       CASE
         WHEN B.TSBIDOP IS NULL THEN 'NO'
         ELSE 'SI'
       END AS EXISTE_EN_TCLTSB FROM (SELECT MOVRRNBEP,MOVPGON,
             CASE
               WHEN SECCOTRX IS NULL THEN 'BATCH'
               ELSE 'ONLINE'
             END AS VERIFICACION,
             Substr(A.MOVNTAR,1,6) AS BIN,
             SUBSTR(A.MOVCODEM,1,4) AS EMISOR_ID,MOVDESEM AS EMISOR_DES,MOVCDBCC AS BANCO_COMERCIO_ID,MOVDSBCC AS BANCO_COMERCIO_DESC
      FROM (SELECT A.MOVRRNBEP,A.SERCODI,A.PRECODI,A.MOVPGON,A.MOVFCRE,b.PRECOTRX,A.MOVICA,A.MOVCODEM,C.ENCENTANT,A.MOVCDBCC,A.MOVNTAR,A.MOVDESEM,A.MOVDSBCC
            FROM GXFINDTA.TCLMOV AS A
              INNER JOIN gxfindta.tclpre AS B ON A.SERCODI = B.SERCODI AND A.PRECODI = B.PRECODI
              INNER JOIN GXTRJDTA.TCOENC AS C ON C.ENCENTROL = A.MOVCDBCC
            WHERE MOVRRNBEP IN ('230109781500')) AS A
        LEFT JOIN gxopera.TCLSEC AS B
               ON A.PRECOTRX = B.SECCOTRX AND Substr (SECENBIN,1,6) = Substr (A.MOVNTAR,1,6) AND ENCENTANT = SECCOBCO AND SUBSTR (A.MOVCODEM,1,4) = SUBSTR (B.SECCEMN,1,4)) AS A LEFT JOIN GXFINDTA.TCLTSB AS B ON B.TSBNREF = A.MOVRRNBEP;
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*Trx en linea - Faltantes*/
select opidliq, opnroref, substr(opcampoa,41,8) FECOMERCIAL, substr(opcampoa,17,8) feconfirma,movfpro fecomercial,movcomer COMERCIO, movdeno DENOMINACION, movcdbcc CODBCO, MOVDSBCC BANCO, MOVCODEM codEMI, movdesem emisor, SUBSTR(movntar,1,6) biN, movrrnbep referencia, opimpor nETO, opstat, opmensaj, opstatob, opmensob
from gxopera.opliqui left join gxfindta.tclmov on substr(char(opnroref),1,15) = movrrnbep --and MOVPGON = 'O'
where substr(opcampoa,41,8) = '20220914'  and OPCODBCO = '057'  --and opstat = '00' and OPSTATOB = '00'
and substr(char(opnroref),1,15) not in(select tsbnref from gxfindta.TCLTSB)
and substr(char(opnroref),1,15) in (select opnoref from gxopera.opmovi)
and movidmov not in (Select movidmov from gxfindta.tclrtd)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT * --SUM(OPIMPOR)
       FROM gxopera.opliqui
WHERE OPNROREF IN ('229908754278',
'230109583912');   
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
sELECT *
FROM gxfindta.tcltsb
WHERE tsbnref IN ('222980038605605');
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM LIBDEBITO.ENTFIL001 WHERE ENTPROGRA LIKE '%BPCLEARING%' AND ENTDATMSG LIKE '%PCLR028CL%' ORDER BY ENTFECGRA DESC LIMIT 100;
SELECT * FROM LIBDEBITO.ENTFIL001 WHERE ENTPROGRA LIKE '%BPCLEARING%' AND ENTDATMSG LIKE '%PCLR028CL%'  AND ENTDATMSG LIKE '%229407620276%' AND date(ENTFECGRA)='2022-10-21';
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ARMAR LLAMANDO A PCLR028  --**Este programa carga en transacciones las operaciones Online
SELECT *
FROM (SELECT CONCAT('CALL PGM(GXFINPGM/PCLR028) PARM',(CONCAT ((CONCAT ((CONCAT ((CONCAT ((CONCAT (CONCAT ('("',OPIDLIQ),'" "')),AUTRRNBEP)),'" "')),AUTTRXFCHC)),'")'))) AS LLAMADO
      FROM (SELECT OPIDLIQ,
                   AUTTRXFCHC,
                   AUTRRNBEP
            FROM GXBDBPS.TSWAUT AS A
              LEFT JOIN GXOPERA.OPLIQUI AS B ON A.AUTRRNBEP = B.OPNROREF
            WHERE AUTRRNBEP IN (
'230109781500')));
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
select * from gxfindta.tclrtc where RTCCOMERC='0704121' --retenciones cabezera
select * from gxfindta.tclrtd where RTCIDRETEN=2003 --re. detalle
select * from gxfindta.tclmov where movrrnbep='289200016356' and movcomer='0200716' and movfpro='20220914' movidmov=60589970
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*Invoca proceso de Replicación del DRCONBEP A TSWAUT */
CALL PGM(GXPGBPS/APAUT011) PARM('20220914' '225796053998')
CALL PGM(GXPGBPS/APAUTCOP) PARM('20220901' '224492046099')
CALL PGM(GXSWTPGM/PA11TST) PARM('20220914')
Parametros: fechaComercial/numeroReferencia
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
 SELECT * --sum(AUTMONTORI)      
       FROM GXBDBPS.TSWAUT
WHERE AUTRRNBEP IN ('227803361180');  
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT * --LFCOTR,LERRNB --SUM(LIMPGS)
       FROM libdebito.drconbep
WHERE LERRNB IN ('225796051679');
Select * from libdebito.drconbep where lfectr = '20220901' and lcautr in('060549','060562','870371') ----solo replica a tswaut el rod adq
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CALL PGM(GXFINPGM/PCLR029) PARM('20220915' '225896416861')
select * from GXFINDTA.TCLMOV where MOVIDMOV = '222987112250'
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT MOVRRNBEP, TPCRRNBEP
FROM GXFINDTA.TCLTPC  AS A
LEFT JOIN GXFINDTA.TCLMOV AS  B ON  B.MOVRRNBEP = A.TPCRRNBEP
where TPCRRNBEP IN ('222085016228','222085024075','222085010967','222084857205','222085018529','222084946056','222084894925')
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
CALL PGM(GXFINPGM/CNXCONTIAC) PARM('4259048')
--Ese procesa directo no espera el reintento Solo intenta enviar 
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
tclmov --verifica si es bathc o online
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
para llegar a tclmov se invoca a PCRL029 --carga en TCLMOV 
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
Apau011 -- Replica los datos deL DRCONBEP hacia el tswaut
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*Del TSWAUT pasa al TCLTPC luego pasa al TCLMOV Para las online Pasan directo 
y eso hace el pclr029 Ahora mismo Para las batch Pasan en el cierre y eso hace el pclr008*/
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT A.LERRNB,
       B.AUTRRNBEP,
       B.AUTTRXFCHC
FROM LIBDEBITO.DRCONBEP AS A
  LEFT JOIN GXBDBPS.TSWAUT AS B ON A.LERRNB = B.AUTRRNBEP
WHERE LERRNB IN ('222085016228','222085024075','222085010967','222084857205','222085018529','222084946056');
--------------------------------------------------------------------------------------------------------------------------------------------------
SELECT *
FROM GXFINDTA.TCLTPC
WHERE TPCRRNBEP IN ('222085016228','222085024075','222085010967','222084857205','222085018529','222084946056','222084894925');
--------------------------------------------------------------------------------------------------------------------------------------------------
--Justamente Will izo esas verificaciones, y faltaría en el TCLMOV

SELECT MOVRRNBEP,
       TPCRRNBEP,
       TPCESCLEFROM GXFINDTA.TCLTPC  AS A LEFT JOIN GXFINDTA.TCLMOV AS  B ON  B.MOVRRNBEP = A.TPCRRNBEP WHERE TPCRRNBEP IN ('222085016228','222085024075','222085010967','222084857205')
--------------------------------------------------------------------------------------------------------------------------------------------------
/*Hay que procesar esa fecha 
para que le tome a estas transacciones 
Que hay que procesar Aldo Ayala, el cierre o correr un programa?
El cierre
consulta es el Proceso Cierre bancario o a que te referis con cierre 
al cierre del día 
se tendria que cambia la fecha del sistema para simular la fecha 05/08
luego cambiar el estado de los procesos
pero ahora esta pendiente el proceso de fecha 08/08*/
--------------------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM GXFINDTA.TCLFEC WHERE FECID = '002'
--------------------------------------------------------------------------------------------------------------------------------------------------
SELECT DISTINCT (SERCODI)
FROM GXFINDTA.TCLTPC
WHERE TPCRRNBEP IN ('222085016228','222085024075','222085010967','222084857205','222085018529','222084946056')
--------------------------------------------------------------------------------------------------------------------------------------------------
/*Como todos son compras se pone como pendiente el cierre de compras 
Buenas hay posibilidad de hacerlo hoy ?*/
--------------------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM GXFINDTA.TCLCSP WHERE CPCPARM = 'COMPRA' AND CPCFEC = '20220805'
--------------------------------------------------------------------------------------------------------------------------------------------------
/*1 - CAMBIAS TLCFEC 
2 - PONER COMO PENDIENTE EN TCLCSP 
3 - PEDIRLE AL USUARIO QUE CORRA EL CIERRE 
4 - VOLVER EL TCLFEC A LA FECHA ACTUAL */
--------------------------------------------------------------------------------------------------------------------------------------------------
/*Aldo Ayala1 - CAMBIAS TLCFEC
en que tabla esta este campo*/
--------------------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM GXFINDTA.TCLFEC WHERE FECID = '002'
--------------------------------------------------------------------------------------------------------------------------------------------------
/*aqui cual cambio 
el de proceso o el siguiente 
es la Fecha de proceso */
--------------------------------------------------------------------------------------------------------------------------------------------------
/*ACTUALIZA PRODUCTO*/
Update libdebito.drconbep A
set LCPACE = (select B.AUTPROTAR from gxbdbps.tswaut B
where B.AUTTIPTAR = 'D' AND  lcpace=' ' AND A.LERRNB = B.AUTRRNBEP AND B.AUTMARTAR IN ('VSA','MST') AND B.AUTTRXFCHC = '20220817' AND B.AUTTRXESTF = 'A' AND B.AUTCODRET = '00')
where exists (select c.autambbin from gxbdbps.tswaut C
where C.AUTTIPTAR = 'D' and lcpace=' ' AND A.LERRNB = C.AUTRRNBEP AND C.AUTMARTAR IN ('VSA','MST') AND C.AUTTRXFCHC = '20220817' AND C.AUTTRXESTF = 'A' AND C.AUTCODRET = '00');
UPDATE libdebito.drconbep successful
--------------------------------------------------------------------------------------------------------------------------------------------------
/*aCTUALIZA AMBITO*/
Update libdebito.drconbep A
set lmarca = (select B.autambbin from gxbdbps.tswaut B
where B.AUTTIPTAR = 'D' AND A.LTIPTR = 'C' AND A.LERRNB = B.AUTRRNBEP AND B.AUTMARTAR IN ('VSA','MST') AND B.AUTTRXFCHC = '20220817' AND B.AUTTRXESTF = 'A' AND B.AUTCODRET = '00')
where exists (select c.autambbin from gxbdbps.tswaut C
where C.AUTTIPTAR = 'D' AND A.LTIPTR = 'C' AND A.LERRNB = C.AUTRRNBEP AND C.AUTMARTAR IN ('VSA','MST') AND C.AUTTRXFCHC = '20220817' AND C.AUTTRXESTF = 'A' AND C.AUTCODRET = '00');
--------------------------------------------------------------------------------------------------------------------------------------------------
/*ACTUALIZA TIPO TARJETA*/
Update libdebito.drconbep A
set LTIPTR = (select B.AUTTIPTAR from gxbdbps.tswaut B
where B.AUTTIPTAR = 'D' AND A.LTIPTR = 'C' AND A.LERRNB = B.AUTRRNBEP AND B.AUTMARTAR IN ('VSA','MST') AND B.AUTTRXFCHC = '20220817' AND B.AUTTRXESTF = 'A' AND B.AUTCODRET = '00')
where exists (select c.autambbin from gxbdbps.tswaut C
where C.AUTTIPTAR = 'D' AND A.LTIPTR = 'C' AND A.LERRNB = C.AUTRRNBEP AND C.AUTMARTAR IN ('VSA','MST') AND C.AUTTRXFCHC = '20220817' AND C.AUTTRXESTF = 'A' AND C.AUTCODRET = '00');
--------------------------------------------------------------------------------------------------------------------------------------------------
sELECT A.AUTRRNBEP,A.AUTAMBBIN,A.AUTTIPTAR, A.AUTMARTAR, A.AUTPROTAR,B.LMARCA, B.LTIPTR, B.LCODBC, B.LCPACE,B.LENEMI
FROM GXBDBPS.TSWAUT A INNER JOIN LIBDEBITO.DRCONBEP B ON A.AUTRRNBEP = B.LERRNB WHERE A.AUTTIPTAR = 'D'
AND B.Lcpace=''  AND A.AUTMARTAR IN ('VSA','MST') AND A.AUTTRXFCHC between '20220901' and '20220927' AND A.AUTTRXESTF = 'A' AND A.AUTCODRET = '00';
--------------------------------------------------------------------------------------------------------------------------------------------------
 ---------------------CONSULTAS PARA VERIFICAR TRANSACCIONES EN OPMOVI-----------------------------------------
*****************************************************************************************************************************************************************************************
Select * from libdebito.drconbep where lfcotr > '20220501' and lcodtr = '013000' and substr(lidtra,1,1) = 'P' and substr(lidcom,1,2) <> '81' and substr(lnrtar,1,6) ='703020';
SELECT *FROM GXOPERA.OPMOVI WHERE opnoref= '222400166867';
SELECT *FROM GXOPERA.OPMOVI WHERE OPCOMER= '0703692' and opfecom = '20220812';
SELECT openemi,substr(opidtra,1,1),opcodtrn,sum(opmonto-opcomi-oprenta-opreiva) FROM GXOPERA.OPMOVI WHERE OPCOMER= '0703692' and opfecom = '20220812' group by openemi,substr(opidtra,1,1),opcodtrn;
select cocomer,enemiso from gxbdbps.comaeaf where cocomer = '0703692';
select * from gxfindta.tcltsb where tsbcoco = '0703692' and date(tsbfege) >= '2022-08-12';
select * from GXFINDTA.TCLMOV where --movcomer='0700234' and MOVFTRX='20221028' and 
MOVRRNBEP='229507844333'
select * from gxopera.tclsec
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------Consulta para traer trx que no generaron comision---------------------------
Select * from libdebito.drconbep where lfcotr > '20220501' and lcodtr = '013000'
 and substr(lidtra,1,1) = 'P' and substr(lidcom,1,2) <> '81' and substr(lnrtar,1,6) ='703020';
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------Consulta para anlisis de pago por comercio, sacamos un codigo comercio para analizar-----------------------------------------
SELECT *FROM GXOPERA.OPMOVI WHERE opnoref= '230109781500';
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------Consulta por comercio, se listan los movimientos----------------------
SELECT *FROM GXOPERA.OPMOVI WHERE OPCOMER= '0700234' and opfecom = '20221028';
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------Se listan las transacciones por OPENEMI y OPCODTRN para identificar las trx que se pagan en linea que son las siguientes:
SELECT openemi,substr(opidtra,1,1),opcodtrn,sum(opmonto-opcomi-oprenta-opreiva) FROM GXOPERA.OPMOVI WHERE OPCOMER= '0700234' and opfecom = '20221028' group by openemi,substr(opidtra,1,1),opcodtrn;
/*002 pago en batch
020 pago en batch No acreditado al comercio
020 pago en batch
101 pago en linea	
153 pago en linea
571 pago en linea
581 pago en linea*/
select * FROM GXOPERA.OPMOVI 
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------se identifica en banco Pagador por el codigo-------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
select cocomer,enemiso from gxbdbps.comaeaf where cocomer = '0703692';
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------CONSULTA LA TABLA DE PAGOS EN LINEAL Y BATCH  y se identifica con la tabla TSBTPOACR---------------------------------

select * from gxfindta.tcltsb where tsbcoco = '0703692' and date(tsbfege) >= '2022-08-12';
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Reporte de T. de Trasmisiones.
SELECT TSBIDOP AS Envio_Id,
       TSBTPOP AS Operacion_Tipo,
       TSBDEOP AS Operacion_Descripcion,
       TSBCODSWD AS Cod_Switch_Debito,
       TSBBADE AS Entidad_Debito,
       TSBCTDE AS Entidad_Cuenta_Debito,
       TSBTPDE AS Cuenta_Tipo_Debito,
       TSBCODSWC AS Cod_Switch_Credito,
       TSBBACR AS Entidad_Credito,
       TSBCTCR AS Entidad_Cuenta_Credito,
       TSBTPCR AS Cuenta_Tipo_Credito,
       TSBCOCO AS Codigo_Negocio,
       TSBDENE AS Denominacion_Negocio,
       TSBNREF AS Nro_Referencia_Lote,
       TSBIMPO AS Importe,
       TSBMONE AS Moneda_Id,
       TSBMONSIG AS Moneda_Sigla,
       TSBFEGE AS Fecha_de_Generacion,
       TSBESTA AS Operacion_Estado,
       TSBCOME AS Codigo_Retorno,
       TSBDEME AS Mensaje,
       TSBUSUA AS Usuario_Actualizacion,
       TSBFEAC AS Fecha_Actualizacion,
       SERCODI AS Codigo_Servicio,
       PRECODI AS Codigo_Prestacion,
       TSBIDTPDOC AS Tipo_Documento_Titular,
       TSBNRODOC AS Nro_Documento_Titular,
       TSBDOCCOM AS Nro_Documento_Comercio,
       TSBMOTIVO AS Motivo_Reenvio,
       TSBTPOACR AS Tipo_Acreditacion,
       TSBFECCON AS Fecha_Conciliacion,
       TSBCONSN AS Conciliado_S_N
FROM GXFINDTA.TCLTSB
WHERE TSBFEGE >= '2021-12-20 00:00:00'
AND   TSBFEGE <= '2021-12-31 00:00:00'
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
