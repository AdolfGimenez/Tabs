/*El socket transmite la transacci?n si Conti tiene de su lado con estado RE (rechazado) o RV (reversado)*/
---------------------------------------------------------------------------------------------------------------
--para ver permisos con exclude
Select * from QSYS2.OBJECT_PRIVILEGES WHERE SYSTEM_OBJECT_SCHEMA = 'QGPL' and object_authority ='*EXCLUDE';
/*DETALLES DE ACREDITACIONES Y CABECERA ES TCLTSB*/
Select * from gxfindta.tcltsd where TSBIDOP=1586760;
SELECT ENEMISO FROM GXBDBPS.COMAEAF WHERE COCOMER='0301557';--ver banco credito
SELECT * FROM GXOPERA.CLPARF WHERE PARCODBCO='064';--ver que banco es por codigo del comaeaf --064-vision
SELECT * FROM gxfindta.tclsct;--tabla de cuenta por banco
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--sql para verificación de transmisiones
SELECT TSBDEOP, TSBESTA, TSBDEME, COUNT(*) CANTIDAD, SUM(TSBIMPO) IMPORTE --substr(TSBFEGE, 1, 10 )
FROM GXFINDTA.TCLTSB
WHERE DATE(TSBFEGE) >= '2024-04-19'
  --AND TIME(TSBFEGE) >= '19:00:00'--and tsbtpop='04' --not in ('AC','RE')
GROUP BY TSBDEOP, TSBESTA, TSBDEME;
/*04 debito a comercio
02 debito a entidades
03 reversa contracargo
01 pago a comercio - credito a comercios*/
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
            WHERE MOVRRNBEP IN ('305553843124','305553851498', '305554468804','305755154184','305755153135')) AS A
        LEFT JOIN gxopera.TCLSEC AS B
               ON A.PRECOTRX = B.SECCOTRX AND Substr (SECENBIN,1,6) = Substr (A.MOVNTAR,1,6) AND ENCENTANT = SECCOBCO AND SUBSTR (A.MOVCODEM,1,4) = SUBSTR (B.SECCEMN,1,4)) AS A LEFT JOIN GXFINDTA.TCLTSB AS B ON B.TSBNREF = A.MOVRRNBEP;
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*Trx en linea - Faltantes*/
select opidliq, opnroref, substr(opcampoa,41,8) FECOMERCIAL, substr(opcampoa,17,8) feconfirma,movfpro fecomercial,movcomer COMERCIO, movdeno DENOMINACION, movcdbcc CODBCO, MOVDSBCC BANCO, MOVCODEM codEMI, movdesem emisor, SUBSTR(movntar,1,6) biN, movrrnbep referencia, opimpor nETO, opstat, opmensaj, opstatob, opmensob
from gxopera.opliqui left join gxfindta.tclmov on substr(char(opnroref),1,15) = movrrnbep --and MOVPGON = 'O'
where substr(opcampoa,41,8) = '20220914'  and OPCODBCO = '057'  --and opstat = '00' and OPSTATOB = '00'
and substr(char(opnroref),1,15) not in(select tsbnref from gxfindta.TCLTSB)
and substr(char(opnroref),1,15) in (select opnoref from gxopera.opmovi)
and movidmov not in (Select movidmov from gxfindta.tclrtd);
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT * --SUM(OPIMPOR)
 FROM gxopera.opliqui WHERE OPNROREF IN ('461108406531');
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
--para ver si armo el pclr
SELECT * FROM LIBDEBITO.ENTFIL001 WHERE ENTPROGRA LIKE '%BPCLEARING%' AND ENTDATMSG LIKE '%PCLR028CL%' ORDER BY ENTFECGRA DESC LIMIT 100;
SELECT * FROM LIBDEBITO.ENTFIL001 WHERE ENTPROGRA LIKE '%BPCLEARING%' AND --ENTDATMSG LIKE '%PCLR028CL%'  AND
ENTDATMSG LIKE '%303648405318%';--AND date(ENTFECGRA)='2022-10-21';
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ARMAR LLAMANDO A PCLR028  --**Este programa carga en transacciones las operaciones Online
SELECT *
FROM (SELECT CONCAT('CL: CALL PGM(GXFINPGM/PCLR028) PARM',(CONCAT ((CONCAT ((CONCAT ((CONCAT ((CONCAT (CONCAT ('(''',OPIDLIQ),''' ''')),AUTRRNBEP)),''' ''')),AUTTRXFCHC)),''');'))) AS LLAMADO
      FROM (SELECT OPIDLIQ,AUTTRXFCHC,AUTRRNBEP
            FROM GXBDBPS.TSWAUT AS A
              LEFT JOIN GXOPERA.OPLIQUI AS B ON A.AUTRRNBEP = B.OPNROREF
            WHERE AUTRRNBEP IN ('508767287302', '508767287415')));
------------------------------------------------------------------------------------------------------------------------------------
CL: CALL PGM(GXFINPGM/PCLR028) PARM('22081707308003' '222987112331  ' '20220912');--para masivo.!
/*pero trx con la 703002 en comercios que pagamos via Continental (itau, vision, sudameris, etc) debe llegar hasta transmisiones
solo llega hasta opliqui si el banco del comercio son RIO, BBVA, Tarjeta Prepaga, BNF*/
--------------------------------------------------------------------------------------------------------------------------------------------------
---ver si est? para pagar / pago a comercio...
SELECT DISTINCT t.AUTPANNRO, t.AUTCODCOMB, t.AUTBINEMI, TRIM(t.AUTRRNBEP) referencia,t.AUTMARTAR, t.AUTTIPTAR, t.AUTPROTAR, t.AUTTRXFCHF, t.AUTTRXFCHC,t.AUTDISTIP, t.AUTMARTAR,
t.AUTTIPTAR, t.AUTTRXESTF, t.AUTCODRET, d.LESTTR, d.LCRETR, t.AUTCOMRAZ, t.AUTMONTDES, t.AUTESTCLE, t.AUTCODSER , t.AUTCODPRE,b.ECCDSERRCC, o.OPENEMI, t2.MOVPGON ,
o.OPNOREF, (opmonto-opcomi-oprenta-opreiva) neto ,t2.MOVRRNBEP,t2.MOVIDLT,  t2.MOVNETO, o2.OPIDLIQ, o2.OPCODBCO,o3.OPCREREF oplicre_ref,t3.IMBIDOP im_id, dd.RTDMONAMRT retencion,
CASE WHEN dd.RTDMONAMRT = (opmonto-opcomi-oprenta-opreiva) THEN 'NO PAGAR'
     WHEN (opmonto-opcomi-oprenta-opreiva) > dd.RTDMONAMRT THEN 'RETENCION PARCIAL'
     WHEN COALESCE(dd.RTDMONAMRT,0) = 0 THEN 'SIN RETENCION'
     ELSE 'OTER' END STATUS_RET, s.TSBIMPO ,
case when (select count(1) from GXOPERA.TCLSEC s where d.lenemi = s.seccoem and substring(d.lnrtar, 1, 6) = substring(s.SECENBIN, 1, 6) and d.lcodtr = s.SECCOTRX) > 0 then 'ONLINE' else 'BATCH' end tipo_op,
s.TSBDEME --,t4.*
--FROM LIBDEBITO.DRCONBEP d
FROM GXBDBPS.TSWAUT t
LEFT JOIN GXBDBPS.COMAEAF c ON t.AUTCODCOMB = c.COCOMER
LEFT JOIN GXFINDTA.TCLMOV t2 ON t.AUTRRNBEP = t2.MOVRRNBEP
LEFT JOIN GXFINDTA.TCLTSB s ON t2.MOVIDLT = s.TSBNREF OR t.AUTRRNBEP = s.TSBNREF
left JOIN GXOPERA.OPMOVI o ON t.AUTRRNBEP = o.OPNOREF AND o.OPSTATUS = 'A'
LEFT JOIN GXOPERA.OPLIQUI o2 ON o2.OPNROREF = t.AUTRRNBEP
LEFT JOIN gxopera.OPLICRE o3 ON o3.OPCREID = t2.MOVIDLT
LEFT JOIN GXFINDTA.TCLIMB t3 ON t3.IMBLOT = t2.MOVIDLT
LEFT JOIN GXFINDTA.TCLTPC t4 ON t.AUTRRNBEP = t4.TPCRRNBEP
left JOIN GXFINDTA.TCLECC b ON t4.ECCCDERRCC = b.ECCCDERRCC
LEFT JOIN LIBDEBITO.DRCONBEP d ON d.LERRNB = t.AUTRRNBEP
LEFT JOIN GXFINDTA.TCLRTD dd ON dd.MOVIDMOV = t2.MOVIDMOV
WHERE t.AUTTRXFCHC BETWEEN '20230601' AND '20230607' --AND c.CORUCN = '80016096-7'
--t.AUTRRNBEP IN ('309870351600')
AND t.AUTDISTIP = 'POS'
AND t.AUTTRXESTF = 'A' AND t.AUTCODRET = '00' AND d.LESTTR = 'A' AND d.LCRETR = '00' --AND t.AUTESTCLE = 'P'
AND t.AUTMONTDES > 0 AND TRIM(t.AUTMARTAR) NOT in ('CAB' , 'PAN')
AND t.AUTCODCOMB NOT IN ('6900282','6900296','6900281','0100001') AND trim(t.AUTCODSER) NOT IN ('DEPOATM','CONSULTA','TRANSFER', 'CAMPIN', 'CIERRE') AND TRIM(AUTCODPRE) NOT IN ('COPU')
AND (t2.MOVRRNBEP IS NULL or o.OPNOREF IS NULL) WITH UR;
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
Select a.rtcidreten id, e.movrrnbep RefTrx, rtccomerc comercio,d.movrazo, d.movrrnbep referencia, rtcmonto Importe,
rtcsdoret Saldo,mrtdsmotre Motivo,(Case When rtcestado = 'A' then 'ANULADO' When rtcestado = 'N' then 'NUEVO' When
rtcestado = 'P' then 'PARCIAL' When rtcestado = 'C' then 'CANCELADO' END) Estado,rtcfchcanc fechacancelacion,
rtcfchpro FechaAlta, rtcusultup Usuario, rtdnrortam idcobro, rtdmonamrt amortizacion, rtdfchcob fecharetencion,
rtcobser Observacion---.*,c.*
from gxfindta.tclrtc a
inner join gxfindta.tclmrt b on a.mrtidmotre = b. mrtidmotre
inner join gxfindta.tclrtd c on a.rtcidreten = c.rtcidreten
left join gxfindta.tclmov d on c.movidmov = d.movidmov
left join gxfindta.tclmov e on a.rtcidmov = e.movidmov
WHERE  d.movrrnbep IN ('303548126900');
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
select * from gxfindta.tclrtc where RTCCOMERC='0700154'; --retenciones cabezera
select * from gxfindta.tclrtd where RTCIDRETEN=1587; --re. detalle
select * from gxfindta.tclmov where movrrnbep='225796057706' and movcomer='0200716' and movfpro='20220914' AND movidmov=60589970;
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*Invoca proceso de Replicaci?n del DRCONBEP A TSWAUT */
CALL PGM(GXPGBPS/APAUT011) PARM('20230206' '303648262705');
CL: CALL PGM(GXPGBPS/APAUT011) PARM('20220915' '2000096372781'); --referencia y fecha LFCOTR del drconbep
CALL PGM(GXPGBPS/PAUTCOP) PARM('20220708' '218975644886')
=CONCATENAR("CL: CALL PGM(GXPGBPS/APAUT011) PARM('20220915' '";M926;"');")
CALL PGM(GXPGBPS/APAUTCOP) PARM('20220901' '224492046099');
CALL PGM(GXSWTPGM/PA11TST) PARM('20220914');
--Parametros: fechaComercial/numeroReferencia
SELECT * FROM GXBDBPS.NUT999 WHERE DbgTblId = 'TSWAUT' AND DBGCLA = '20221122' AND DBGAGR <> '1' AND DBGMSG NOT LIKE '%4%'; --- los que NO pasaron
SELECT * FROM GXBDBPS.NUT999 WHERE DbgTblId = 'TSWAUT' AND DBGCLA = '20221122' AND DBGMSG  LIKE '%4%';-- los que si pasaron
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT * --sum(AUTMONTORI)
       FROM GXBDBPS.TSWAUT
WHERE AUTRRNBEP IN ('226697985449',
'286800002242');
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT * --LFCOTR,LERRNB --SUM(LIMPGS)
FROM libdebito.drconbep
WHERE LERRNB IN ('301941528312');
Select * from libdebito.drconbep where lfectr = '20220901' and lcautr in('060549','060562','870371');---solo replica a tswaut el rod adq
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CALL PGM(GXFINPGM/PCLR029) PARM('311373830422' '20230424');--fecha de proceso, estado clearing tiene que estar en P en tswaut para que ande
select * from GXFINDTA.TCLMOV where MOVIDMOV = '233420941204'; --AUTRRNBEP AUTTRXFCHC
--para las TC para regularizar opmovi cambiar fecha de incoming en el tswaut
UPDATE GXBDBPS.TSWAUT SET AUTFECINC= '2023-01-23 00:00:00.000' WHERE AUTRRNBEP ='301841123366';
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT MOVRRNBEP, TPCRRNBEP
FROM GXFINDTA.TCLTPC  AS A
LEFT JOIN GXFINDTA.TCLMOV AS  B ON  B.MOVRRNBEP = A.TPCRRNBEP
where TPCRRNBEP IN ('222085016228','222085024075','222085010967','222084857205','222085018529','222084946056','222084894925');
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
--Justamente Will izo esas verificaciones, y faltar?a en el TCLMOV
SELECT MOVRRNBEP,
       TPCRRNBEP,
       TPCESCLE FROM GXFINDTA.TCLTPC AS A LEFT JOIN GXFINDTA.TCLMOV AS B ON B.MOVRRNBEP = A.TPCRRNBEP WHERE TPCRRNBEP IN ('222085016228','222085024075','222085010967','222084857205');
--------------------------------------------------------------------------------------------------------------------------------------------------
/*Hay que procesar esa fecha
para que le tome a estas transacciones
Que hay que procesar Aldo Ayala, el cierre o correr un programa?
El cierre
consulta es el Proceso Cierre bancario o a que te referis con cierre
al cierre del d?a
se tendria que cambia la fecha del sistema para simular la fecha 05/08
luego cambiar el estado de los procesos
pero ahora esta pendiente el proceso de fecha 08/08*/
--------------------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM GXFINDTA.TCLFEC WHERE FECID = '002';
--------------------------------------------------------------------------------------------------------------------------------------------------
SELECT DISTINCT (SERCODI)
FROM GXFINDTA.TCLTPC
WHERE TPCRRNBEP IN ('222085016228','222085024075','222085010967','222084857205','222085018529','222084946056');
--------------------------------------------------------------------------------------------------------------------------------------------------
/*Como todos son compras se pone como pendiente el cierre de compras
Buenas hay posibilidad de hacerlo hoy ?*/
--------------------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM GXFINDTA.TCLCSP WHERE CPCPARM = 'COMPRA' AND CPCFEC = '20220805';
--------------------------------------------------------------------------------------------------------------------------------------------------
/*1 - CAMBIAS TLCFEC
2 - PONER COMO PENDIENTE EN TCLCSP
3 - PEDIRLE AL USUARIO QUE CORRA EL CIERRE
4 - VOLVER EL TCLFEC A LA FECHA ACTUAL */
--------------------------------------------------------------------------------------------------------------------------------------------------
/*Aldo Ayala1 - CAMBIAS TLCFEC
en que tabla esta este campo*/
--------------------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM GXFINDTA.TCLFEC WHERE FECID = '002';
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
--UPDATE libdebito.drconbep successful;
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
MOVRRNBEP='229507844333';
select * from gxopera.tclsec;
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------Consulta para traer trx que no generaron comision---------------------------
Select * from libdebito.drconbep where lfcotr > '20220501' and lcodtr = '013000'
 and substr(lidtra,1,1) = 'P' and substr(lidcom,1,2) <> '81' and substr(lnrtar,1,6) ='703020';
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------Consulta para anlisis de pago por comercio, sacamos un codigo comercio para analizar-----------------------------------------
SELECT *FROM GXOPERA.OPMOVI WHERE opnoref IN ('226697985449',
'286800002242');
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
select * FROM GXOPERA.OPMOVI;
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------se identifica en banco Pagador por el codigo-------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
select cocomer,enemiso from gxbdbps.comaeaf where cocomer = '0703692';
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------CONSULTA LA TABLA DE PAGOS EN LINEAL Y BATCH  y se identifica con la tabla TSBTPOACR---------------------------------
select * from gxfindta.tcltsb where tsbcoco = '0703692' and date(tsbfege) >= '2022-08-12';
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
select * FROM MASTERCARD.TALTRENMS WHERE DATO LIKE '%20220812%';
SELECT * FROM  VISA.TALTRENVS WHERE DATO LIKE '%20220812%';
------------------------------------------------------------------------------------------------------------------------------------------------
----YAPPROD
-- trx en linea QUE SE DEBEN HACER POR YAPPROD PARA 703002
SELECT * FROM LIBDEBITO.DRCONBEP WHERE LERRNB='461108406531';
--ESTRUCTURAVIEJA
Select
LCTAOR, LCTADE, LNRTAR, LEXTAR, LEXPIR, LIDCOM, LHISOR, LHISDE,
LBCOCR, LCTACR, LBCODB, LCTADB, LCLEAR, LFCOTR, LFECTR, LHORTR,
LFECLQ, LFECEN, LMONTR, LIMPGS, LIMPDS, LIMPDF, LSALTR, LDISTR,
LMARCA, LCUOTA, LIDTRA, LSTANT, LTIPTR, LPOSEM, LBINPR, LMCCTR,
LCOMTR,LORITR, LCODTR, LCODBC, LCAUTR, LCRETR, LESTTR, LERRNB,
LEIMP4, LECA62, LCPACE, LENEMI, LCORED, LCOTEL, LACTFJ, LNFACT,
LNFISC, ENEADM,ENEPRO, LCODPR, LCOPRO, LCOCOM, LCOIVA, LCOADQ,
LNTOKE from libdebito.drconbep where lerrnb ='408205461678';
-- se guarda en adolfolib.auxiliar
SELECT * FROM ADOLFOLIB.YAPIJOEL;
--SE AGREGA FECHA DEL DIA DE LA EJECUCI?N Y SE HACE EL UPDATE EN LA AS400
update ADOLFOLIB.AUXILIAR set lfectr='20240417', lfcotr='20240417'; --y lfecotr

SELECT * FROM LIBDEBITO.PRUEBCLR;
/*CLRPFM FILE(LIBDEBITO/PRUEBCLR) limpiar
CPYF FROMFILE(ADOLFOLIB/AUXILIAR) TOFILE(LIBDEBITO/PRUEBCLR) MBROPT(*REPLACE) copiar*/

SBMJOB CMD(CALL PGM(LIBDEBITO/YAPPROD) PARM('20230424' '20230424')) JOB(REINTENTO) JOBQ(QBATCH) USER(QCOMUNICA)
------cambiar fecha tswaut
UPDATE GXBDBPS.TSWAUT SET auttrxfchc = '20240112', autestcle = 'P' WHERE AUTRRNBEP='461108406531';
--y tclmov fecha y tipo de pago Y VER OPMOVI
SELECT MOVRRNBEP, movfpro, movpgon FROM GXFINDTA.TCLMOV WHERE MOVRRNBEP='229407621726';
UPDATE GXFINDTA.TCLMOV  SET movfpro= '20230130', movpgon = 'O' WHERE MOVRRNBEP='229407621726';
---
SELECT * FROM GXFINDTA.TCLTSB WHERE TSBNREF IN ('');
--IMPORTANTE
-- si, cambia tambien para igualar , tswaut (auttrxfchc = '20230130', autestcle = 'P'), tclmov (posiblemente vas a cambiar Online (movfpro= '20230130', movpgon = 'O')
--asegurate nomas que no se duplique en tclmov
----------------------------------------------------------------------------------------------------
/*
01| |InicializaVariables
02| |VerificaVISA
03| |VerificaMST
04| |Main
05| |VerificaBinAdq
06| |VerificaDobleRegistroMI
07| |DatosMoneda-Pais
08| |MarcaTarjeta
09| |Obtiene Datos ClienteSucursal
10| |VerificaComercioProcesadora
11| |VerificaRelacionEntidad
12| |VerDispositivo
13| |Armarfecha-hora'
14| |'BuscaDatosMI'
15| |DatosDebito'
16| |'DatosCredito'
17| |RecuperaPromosPuntos
18| |'Inserta'
19| |'Datos2daTrx'
20| |'DatosBin'
21| |VerificaMarcaEfectivo
22| |VerificaServicio
*/
CALL PGM(GXFINPGM/PCLR029) PARM('310572161333' '20230417'); --carga tclmov
CALL PGM(GXFINPGM/PCLR184) PARM('461108406531' '20240112' ''); --carga todas las tablas de las 703020
--parm(in:&AUTRRNBEP, in:&FECPRO, out: &RETORNO); PONER EN P ESTADO DE CLEARING y cambiar la fecha comercial en tswaut a la fecha real en la cual se procesa
SELECT AUTRRNBEP, AUTTRXFCHC, AUTESTCLE, T.* FROM GXBDBPS.TSWAUT T WHERE AUTRRNBEP IN ('461108406531');--AUTRRNBEP AUTTRXFCHC
Update libdebito.drconbep set lfcotr = '20230309'
where lerrnb in
--PARA TENER EN CUENTA, SI ESTA EN TCLMOV TENER EN CUENTA FEPROCESO Y FCREDITO IGUALAR--hoy y ma?ana tiene que ser siempre que sea fecha comercial
SELECT MOVFPRO, MOVFCRE, M.* FROM GXFINDTA.TCLMOV M WHERE MOVRRNBEP IN ('360700074898','360700075046','360500073376');
SELECT MOVRRNBEP, MOVFCRE, MOVFPRO, MOVIDLT, MOVPGON FROM GXFINDTA.TCLMOV WHERE MOVRRNBEP='363600093290';
--------------------------------------------------------carga tclmov
SELECT * FROM GXOPERA.OPMOVI WHERE OPNOREF IN ('290600024714'); -- A MONITOREAR
--PARA CARGAR OPMOVI EN CASO QUE YA CARGE REING. TRAE DEL TCLMOV, HACE LA CONVIVENCIA ENTRE REING Y ACTUAL.
--PSIT008  Parm(&MOVRRNBEP,&MOVESTA,&Retorno);
CALL PGM(GXPGBPS/PSIT008) PARM('290600024714' 'A' '');
---para eso tambi?n hay que tener en cuenta que sea online ya que solo las trx online.
SELECT distinct (movpgon) FROM GXFINDTA.TCLMOV WHERE MOVRRNBEP IN ('290600024714');
-------------------------------------------------------------------------------carga apau
CALL PGM(GXPGBPS/PA11TST) PARM('20230206');--LFCOTR  fecha comercial compa
SELECT * FROM GXBDBPS.NUT999 WHERE DBGOBJID = '361100077330';---log apau
------para ver si corresponde a tswaut
--MST
SELECT
p.MC037,
p.MCRRNBEPSA,
CASE WHEN p.MC037 =p.MCRRNBEPSA THEN 'Entra' ELSE 'No entra' END AS Ingresa,
p.*
FROM  MASTERCARD.MASCTLDTA p
WHERE  MCRRNBEPSA in('312880769148');
--VISA
SELECT
p.V037,
p.VIRRNBEPSA,
CASE WHEN p.V037 =p.VIRRNBEPSA THEN 'Entra' ELSE 'No entra' END AS Ingresa,
p.*
FROM  VISA.VISCTLDTA p
WHERE  VIRRNBEPSA in('303648259872');
--que no este en drconbep
SELECT
p.MC037,
p.MCRRNBEPSA,
CASE WHEN p.MC037 =p.MCRRNBEPSA THEN 'Entra' ELSE 'No entra' END AS Ingresa,
p.*
FROM  MASTERCARD.MASCTLDTA p
WHERE  MCRRNBEPSA in(SELECT LERRNB FROM LIBDEBITO.DRCONBEP A WHERE LFCOTR = 20230313 AND LERRNB NOT IN (SELECT AUTRRNBEP FROM GXBDBPS.TSWAUT T WHERE AUTTRXFCHC = 20230313));

SELECT /*LESTTR, LERRNB, LFCOTR,*/ count(*) FROM LIBDEBITO.DRCONBEP A WHERE LFCOTR = 20230523 /*:EMFEPRO */
AND LERRNB NOT IN (SELECT AUTRRNBEP FROM GXBDBPS.TSWAUT T WHERE AUTTRXFCHC = 20230523 /*:EMFEPRO */);
-----------------------------------------------------------------------------------
--verificacion de pago por ruc
SELECT t.AUTPANNRO, t.AUTBINEMI, t.AUTRRNBEP,t.AUTMARTAR,t.AUTPROTAR, t.AUTTRXFCHF, t.AUTTRXFCHC, t.AUTTRXESTF, t.AUTCODRET, t.AUTCOMRAZ, t.AUTMONTDES, t.AUTESTCLE,
o.OPNOREF, (opmonto-opcomi-oprenta-opreiva) neto ,t2.MOVRRNBEP,t2.MOVIDLT,  t2.MOVNETO,  s.TSBIMPO
FROM GXBDBPS.TSWAUT t INNER JOIN GXBDBPS.COMAEAF c ON t.AUTCODCOMB = c.COCOMER
LEFT JOIN GXFINDTA.TCLMOV t2 ON t.AUTRRNBEP = t2.MOVRRNBEP
LEFT JOIN GXFINDTA.TCLTSB s ON t2.MOVIDLT = s.TSBNREF
left JOIN GXOPERA.OPMOVI o ON t.AUTRRNBEP = o.OPNOREF
WHERE t.AUTTRXFCHF BETWEEN '20221128' AND '20230112' AND c.CORUCN = '80016096-7'
AND t.AUTTRXESTF = 'A' AND t.AUTCODRET = '00' --AND t.AUTESTCLE = 'P'
AND t.AUTMONTDES > 0 AND TRIM(t.AUTMARTAR) NOT in ('CAB' , 'PAN')
AND (o.OPNOREF IS NULL OR t2.MOVRRNBEP IS NULL OR s.TSBIMPO IS null);
-------------------------------------------------------------------------------------
--Les paso el dato base de lo que tiene que cargar en opmovi
select count(*) from libdebito.drconbep where lfcotr='20221031' and LCRETR='00' and LESTTR='A' and lcodtr in('000054', '011000', '012000', '013000', '014000', '000052','370000', '380000', '390000');
--mas o menos estos numeros
select count(*) from gxopera.opmovi where opfecom='20221031';
--* primero count para ver trx segun fecha comercial
--* segundo para ver cuanto esta cargando
select count(*) from libdebito.drconbep where lfcotr='20221031' and LCRETR='00' and LESTTR='A' and lcodtr in ('000054', '011000', '012000', '013000', '014000', '000052',     '370000', '380000', '390000');
--siempre este es aproximado tardo muhco el proceso porque habia mas de 400 mil trx que cargar el ultimo por ejemplo solo 193 mil y asi  para que tengas en cuenta esta corriendo credito
------------------------------
-------------------caso no cuponamiento-----------------------------
SELECT * FROM GXBDBPS.TSWAUT WHERE AUTRRNBEP IN ('235732861641');--NO SE CUPONA, SE VERIFICA ESAS 2 TABLAS Y SE CAMBIA F. INC PARA QUE LO PROCESE EN EL CLEARING CUPONAMIENTO DE LA NOCHE
SELECT * FROM GXBDBPS.TMOVIAF WHERE MVSECUE='235732861641'; -- DE ACA A OPMOVI Y LUEGO NORMAL. LAS CREIDTOS SON BATCH, SE LE SUMA CON SUS MOVIMIENTOS DEL D?A
SELECT * FROM GXBDBPS.THMOVAF WHERE HMSECUE='235732861641';
--llamado para convivencia
CALL PGM(GXFINPGM/PCLR166) PARM(('20230522') ('') (''));--carga tclcup desde tswaut
CALL PGM(GXFINPGM/PCLR182) PARM(('20230522') ('') (''));---PROCESA TRX CONTADO
CALL PGM(GXFINPGM/PCLR218) PARM(('20230522') ('') (''));--PROCESA TRX EN CUOTAS
---PARA VER CAMPOS NULOS EN LA TABLA YA QUE DI? ERROR EN INDICE DEL TMTARAF
Select * from gxbdbps.tmtaraf where substr(mtnumta,1,6) = '545289' and cenumdo is null;
--cuponamiento
Select * from gxfindta.tclcup where cupfeccom ='20230203';
---ver si hay campos nulos
SELECT * FROM GXBDBPS.TMTARAF WHERE MTNUMTA IN (Select cupntar from gxfindta.tclcup where cupfeccom ='20230203');
--------------------------------------------------------------------
-----------------cuando no est? en flicom hay que ver ?sto.
SELECT * FROM GXBDBPS.COMAEAF WHERE COCOMER='8606100'; --hay que cambiar el banco de comercio (enemiso) y verificar la cuenta, ademas del tipo de acreditaci?n (tipacodi)deberia ser acreditaci?n en cuenta.
------------------------------------------------------------------------------------------------
CALL PGM(GXFINPGM/PCLR182) parm('20230206' '' '');
------------------------------------------------------------------------------------------------
/*Verifiacion de transacciones con error*/
Select tpcrrnbep,sercodi, precodi, tpcdisp, tpcfpro, tpccodco, tpcmarca, tpcprod, tpcorig, TPCIMPGS,tpcescle, a.ecccderrcc, B.ECCDSERRCC
from gxfindta.tcltpc A INNER JOIN gxfindta.tclecc B ON A.ECCCDERRCC = B.ECCCDERRCC where tpcrrnbep = '313081323059';
/*CASO ACREDITACI?N*/
select * from gxbdbps.tmoviaf where MVFEVAL>='20220101' and MVIDUSR='U99RODRI';
select * from gxbdbps.tmoviaf where MVFEVAL>='20220101' and MVIDUSR='U99JCESAR';

SELECT * FROM GXTRJDTA.TMOMEP WHERE MEPFCHAFE>='20230101' AND MEPUSULTUP='U99RODRI';

SELECT * FROM GXBDBPS.AIT002 WHERE AITCTRJNRO='4224102223077245';--visa-SI ES 27 CREA EL MOVIMIENTO DEL UN INCOMING
SELECT * FROM GXBDBPS.NUT999 WHERE DBGUSRID='U99RODRI' AND DBGFH>='2023-02-21 00:07:05' AND DBGOBJID LIKE '%AEI002%'
AND DBGMSG LIKE '%4224102223077245%'; -- PARA VER SI CONINCIDE CON LA HORA DE AFECTACI?N

SELECT * FROM GXBDBPS.IPMDTAE WHERE IPMFNAME LIKE '%T11230%' AND IPMDELN='3';

SELECT * FROM GXTRJDTA.LGTMCUENTAF;--ANTES Y DESPUES DE TMCUENTAF

Select autfecinc, auttrxfchc, auttrxfchf, auttrxhorf, autrrnbep, autrrnmi,AUTENTROL, autproemi,autmartar, autprotar, autmonori moneda_origen,autmontori monto_origen,autmondes moneda_destino,autmontdes monto_Autorizado, autimpinco Monto_incoming, autcotinco cotiz_incoming, autcodcli, autcodsuc, autcodcomb, autcomraz, autentadm, autentpro, autproemi,autbinemi, autproadq,autcodser, autcodpre, auttrxcod, autdistip,autambbin,autrolbep,auttiptar,
autbinemi, substr(autpannro,1,6)||'XXXXXX'||substr(autpannro,13) tarjeta, auttrxestf, autcodret, AUTESTDES, autestcle, autestcup
from gxbdbps.tswaut where substr(autpannro,1,6) = '422410' and autfecinc = '2023-02-21' and autmontdes<> autimpinco;
-----------------------------------------------------------------
SELECT b.* FROM LIBDEBITO.DRCONBEP d
INNER JOIN GXOPERA.OPMOVI b ON d.LIDCOM = CAST (OPCOMER AS integer) AND LCAUTR = OPCODAUT AND SUBSTRING(LNRTAR,1,16 )= SUBSTRING(OPTARJ,1,16)
WHERE SUBSTR(OPNOREF,1,2) = '96' AND d.LERRNB = NRO_REFERENCIA;
-----------------------------------------------------------------
/*inset opliqui*/
/*aammdd y secuencua*/ --opcampoa en px se trae de opmovi del campo OPIDTRA
SELECT MAX(OPIDLIQ) FROM GXOPERA.OPLIQUI O WHERE OPFECLIQ='20230406';--202303138665291
SELECT * FROM GXOPERA.OPLIQUI O WHERE OPFECLIQ='20230313';--202303138665291
SELECT * FROM GXOPERA.OPLIQUI WHERE OPNCOMER='0705483' AND OPFECLIQ='20230310';
-----------------------------------------------------------------
-- --ver bin
SELECT * FROM GXTRJDTA.TDGBIN WHERE BINNROBIN LIKE '%542116%';
-----------------------------------------------------------------
-- /*trx de opmovi opliqui a tcltsb no pagados*/
select s.*, o.OPSTATUS,TSBTPOP, TSBDEOP,TSBDENE, TSBCTDE, TSBTPDE,t.TSBESTA, TSBESTA, TSBCOME, TSBDEME,
o2.OPSTAT, o2.OPMENSAJ,o2.OPSTATOB, o2.OPMENSOB, o3.OPSTAT, o3.OPMENSAJ,o3.OPSTATOB, o3.OPMENSOB
from gxopera.opmovi s LEFT JOIN GXOPERA.OPMOVI o ON s.OPNOREF = o.OPNOREF AND o.OPSTATUS = 'E'
INNER JOIN GXFINDTA.TCLTSB t ON s.OPNOREF = t.TSBNREF
left JOIN GXOPERA.OPLIQUI o2 ON s.OPNOREF = o2.OPNROREF AND o2.OPSTAT ='00'
LEFT JOIN GXOPERA.OPLIQUI o3 ON s.OPNOREF = o3.OPNROREF AND o3.OPSTAT <> '00'
where s.OPSTATUS = 'A' and date(t.TSBFEGE) BETWEEN '2023-03-01' AND '2023-05-12' AND TSBESTA= 'IN';
-----------------------------------------------------------------
/*Verificaci?n vigencia*/--renta IVA
SELECT cocomer,
       codeno,
       corazo,
       cofiva vigencia,
       (CASE WHEN coreten = 0 THEN 'TODOS' WHEN coreten = 1 THEN 'RENTA' WHEN coreten = 2 THEN 'IVA' ELSE 'NINGUNO' END) APLICA
FROM gxbdbps.comaeaf
WHERE cocomer = '0801448';
------------------------------------------------------------------
/*ACREDITACIONES EN DOLARES habilitar con 1 para que tome el pago en trasmisiones*/
SELECT * FROM GXFINDTA.TCLIMB T WHERE MONID='840';
SELECT * FROM GXFINDTA.TCLTSB T WHERE TSBNREF='231870064500123';
SELECT * FROM gxfindta.tclsct WHERE SERCODI = 'PAGOENT';
UPDATE GXFINDTA.TCLSCT T
SET T.SCTCTAP = 1
WHERE T.SERCODI LIKE 'PAGOENT   ' AND T.PRECODI LIKE 'PAEN' AND T.SCTCOBA = 1020 AND T.SCTMARC LIKE 'DIN' AND T.SCTTPAC LIKE 'B' AND T.SCTMONE = 840 AND T.SCTTPCT LIKE 'CC' AND T.SCTNRCT LIKE '0113194474';
-----
/*cambio de fecha para new clearing
001,Proceso Trx(Actualiza 23:45 hs)
002,Proceso Batch (Actualiza al fin)
003,Corte SIPAP (Actualizar 19 hs)
004,Proceso OutGoing MC                     */
Select * from GXFINDTA.tclfec where fecid = '002';-- Fechas Procesos
Update GXFINDTA.tclfec set fecant = '20230724', fecpro = '20230725', fecsig = '20230726' where fecid = '002';
-----
Select * from gxfindta.tclret; --retenciones RI
Select * from gxfindta.TCLRTC T;
Select * from gxfindta.tclrtd;
---legacy
Select * from gxopera.retcom where date(retfech) = '2023-08-31';
/*Detalle Transaccional BNF del 20231101 al 20231214 | conciliaciones bnf | copago0p*/
Select opferea freal, ophotrn hora, opfecom fcomercial, opcodtrn transaccion, openemi emisor, opadmin admin, substr(optarj,1,6)||'XXXXXX'||substr(optarj,12) tarjeta, opmonto monto, opcodaut, substr(OPIDTRA,1,4) dispo,opnoref referencia,
opcoment comibanco, opivaent ivabanco, opcombps comibepsa, opivabps ivabepsa,(opmonto-opcomi)neto, (case when litipago = 3 AND LICODBAN = '01' then 'BATCH' when litipago = 1 AND LICODBAN = 'IT' then 'BATCH' When litipago = 1 and substr(opidtra,1,1) = 'W' then 'BATCH' ELSE 'ONLINE' END) TIPO, (case when litipago = 1 then TGENTI ELSE '146' END) ENTIDAD from gxopera.opmovi
LEFT join gxopera.flicom b on opcomer = licomer and opfecom = lifechd and opcodtrn= licodtr
LEFT join contabilid.tatgene on licodban=tgcode and tgalfa = 'BA'
where OPFECOM >='20231101' and OPENTID = '002' and OPTIPTAR = 'DEB' and OPCODTRN ='000054'
union
Select opferea freal, ophotrn hora, opfecom fcomercial, opcodtrn transaccion, openemi emisor, opadmin admin, substr(optarj,1,6)||'XXXXXX'||substr(optarj,12) tarjeta, opmonto monto, opcodaut, substr(OPIDTRA,1,4) dispo,opnoref referencia,
opcoment comibanco, opivaent ivabanco, opcombps comibepsa, opivabps ivabepsa, opmonto neto,'BATCH' TIPO, '999' ENTIDAD from gxopera.opmovi
where OPFECOM >='20231101' and OPENTID = '002' and OPTIPTAR = 'DEB' and OPCODTRN ='013000' and substr(opidtra,1,1) <> 'T'
union
Select opferea freal, ophotrn hora, opfecom fcomercial, opcodtrn transaccion, openemi emisor, opadmin admin, substr(optarj,1,6)||'XXXXXX'||substr(optarj,12) tarjeta, opmonto monto, opcodaut, substr(OPIDTRA,1,4) dispo,opnoref referencia,
opcoment comibanco, opivaent ivabanco, opcombps comibepsa, opivabps ivabepsa,(opmonto-opcomi)neto, 'BATCH' TIPO, '999' ENTIDAD from gxopera.opmovi
where OPFECOM >='20231101' and OPENTID = '002' and OPTIPTAR = 'DEB' and OPCODTRN in ('901020','902020')
union
Select opferea freal, ophotrn hora, opfecom fcomercial, opcodtrn transaccion, openemi emisor, opadmin admin, substr(optarj,1,6)||'XXXXXX'||substr(optarj,12) tarjeta, opmonto monto, opcodaut, substr(OPIDTRA,1,4) dispo,opnoref referencia,
opcoment comibanco, opivaent ivabanco, opcombps comibepsa, opivabps ivabepsa,(opmonto-opcomi)neto, 'BATCH' TIPO, '999' ENTIDAD
from gxopera.opmovi
where OPFECOM >='20231101' and OPENTID = '002' and OPTIPTAR = 'DEB' and OPCODTRN ='014000' and substr(opidtra,1,1) <> 'T'
UNION
Select opferea freal, ophotrn hora, opfecom fcomercial, opcodtrn transaccion, openemi emisor, opadmin admin, substr(optarj,1,6)||'XXXXXX'||substr(optarj,12) tarjeta, opmonto monto, opcodaut, substr(OPIDTRA,1,4) dispo,opnoref referencia,
opcoment comibanco, opivaent ivabanco, opcombps comibepsa, opivabps ivabepsa,(opmonto-opcomi)neto, 'BATCH' TIPO, '999' ENTIDAD
from gxopera.opmovi a
where OPFECOM >= '20231101'    and OPENTID   = '002'    and OPTIPTAR  = 'DEB'    and OPCODTRN in ('530002')
--------------------------
--RETENCION SERVICIOS DIGITALES MES DE DICIEMBRE 2024 | Tareas #86926
---cantidad 5 para tarjetas de debito
    INSERT INTO GXFINDTA.TCLSET (SETRRNBEP,SETIMPCOD,SETCODMCC,SETMARCA,SETTIPTAR,SETPROTAR,SETCODSER,SETCODPRE,SETMONTO,SETRZNPRV,SETCTZAUT,
    SETLImpIn,SETMBRUTO,SETMOVPAI,SETMVCOPA,SETMVDSPA,SETMDAORI,SETCODEM,SETCICLIE,SETNOMPLA,SETRETSTA,SETUSUAC,SETFECPRO,SETFECAC,SETMRETEN,SETIMPIVA,SETIMPREN)

    SELECT A.AUTRRNBEP,'5',A.AUTCOMMCC, A.AUTMARTAR,A.AUTTIPTAR,A.AUTPROTAR, A.AUTCODSER, A.AUTCODPRE, A.AUTMONTORI, A.AUTCOMRAZ, A.AUTMONTCOT, A.AUTMONTDES, A.AUTMONTDES, A.AUTPAISORI, B.PAIISOALF2, B.PAIDSPAIS, A.AUTMONORI, A.AUTENTROL,C.PERNRODOC,C.CADNOMPLAS,'P',CURRENT USER,A.AUTTRXFCHF, A.AUTTRXFCHF,ROUND(A.AUTMONTDES*0.1),ROUND(A.AUTMONTDES*0.1),0
    FROM GXBDBPS.TSWAUT A INNER JOIN GXTRJDTA.TDGPAI B ON B.PAIIDPAIS = A.AUTPAISORI   INNER JOIN GXTRJDTA.TTDCAD C
    ON C.CDBIDCTA = A.AUTCTAOPE  AND C.CADADHERE = A.AUTPANADH   AND C.CDBCODENT = SUBSTR (A.AUTENTROL,1,4)
    WHERE A.AUTCOMMCC IN ('4814','4816','4899','5734','5735','5815','5816','5817','5818','5968','7311','7372','7399','7829','7994','7995','8220','8244','8249','8299')
    AND   A.AUTPAISORI <> 600
    AND   A.AUTTIPTAR IN ('D')
    AND   A.AUTTRXESTF = 'A'
    AND   A.AUTCODRET = '00' AND SUBSTR(A.AUTIDTRX,1,2) NOT IN ('PX')
    AND   A.AUTTRXFCHF BETWEEN '20241130' AND '20241231'
    AND   A.AUTMONTDES > 0
    AND AUTCOMRAZ NOT LIKE '%DLOCAL%'
    AND   A.AUTRRNBEP NOT IN (SELECT SETRRNBEP FROM GXFINDTA.TCLSET);

/*433912718825
434817036115
435924907560
436226453657
436628122842*/

----cantidad 0 para tarjeta de credito

INSERT INTO GXFINDTA.TCLSET (SETRRNBEP,SETIMPCOD,SETCODMCC,SETMARCA,SETTIPTAR,SETPROTAR,SETCODSER,SETCODPRE,SETMONTO,SETRZNPRV,SETCTZAUT,
SETLImpIn,SETMBRUTO,SETMOVPAI,SETMVCOPA,SETMVDSPA,SETMDAORI,SETCODEM,SETCICLIE,SETNOMPLA,SETRETSTA,SETUSUAC,SETFECPRO,SETFECAC,SETMRETEN,SETIMPIVA,SETIMPREN)

SELECT A.AUTRRNBEP,'5', A.AUTCOMMCC, A.AUTMARTAR, A.AUTTIPTAR, A.AUTPROTAR, A.AUTCODSER, A.AUTCODPRE, A.AUTMONTORI, A.AUTCOMRAZ, A.AUTMONTCOT,A.AUTMONTDES, A.AUTMONTDES, A.AUTPAISORI,  B.PAIISOALF2,  B.PAIDSPAIS,
    A.AUTMONORI, A.AUTENTROL, C.TRJNRODOC, C.TRJNOMPLAS, 'P',  CURRENT USER,   A.AUTTRXFCHF,
    '20'||SUBSTRING(CAST (date(A.AUTFECINC + 1 days) AS char(10)),7,2)||SUBSTRING(CAST (date(A.AUTFECINC + 1 days) AS char(10)),4,2)||SUBSTRING(CAST (date(A.AUTFECINC + 1 days) AS char(10)),1,2) SETFECPRO,
    ROUND(A.AUTIMPINCO*0.1), ROUND(A.AUTIMPINCO*0.1), 0
FROM GXBDBPS.TSWAUT A INNER JOIN GXTRJDTA.TDGPAI B  ON B.PAIIDPAIS = A.AUTPAISORI INNER JOIN GXTRJDTA.TTCTRJ C ON C.TRJNROTRJ = A.AUTPANNRO
WHERE A.AUTCOMMCC  IN ( '4814''4816','4899','5734','5735','5815','5816','5817','5818','5968','7311','7372','7399','7829','7994','7995','8220','8244','8249','8299')
    AND A.AUTPAISORI <> 600
    AND A.AUTPAISORI <> 0
    AND A.AUTTIPTAR IN('C')
    AND A.AUTTRXESTF = 'A'
    AND A.AUTCODRET = '00'
    AND A.AUTTRXFCHF BETWEEN '20241130' AND '20241231'
    AND A.AUTMONTDES > 0
    AND A.AUTCOMRAZ NOT LIKE '%DLOCAL%'
    AND A.AUTFECINC >= '2024-11-01 00:00:00.000'
    AND A.AUTFECINC < '2024-11-30 00:00:00.000'
    AND A.AUTRRNBEP not IN(SELECT SETRRNBEP FROM GXFINDTA.TCLSET);

---Regularización Compensación Cooperativa Universitario 20250205   Tareas #89225
---diferencia bnf
--Se adjunta la sentencia para regularizar compensación de transacciones BNF en cajero de Coop. Universitaria correspondiente a la fecha 20250206.

INSERT INTO GXOPERA.OPAGO3P
(BNFCODMV, BNFIDTRN, BNFCODENT, BNFFETRN, BNFFECRE, BNFFECOM, BNFTIPO, BNFTICTA, BNFNROCTA, BNFIMPOR, BNFDESCR, BNFOBSER, BNFCODRE, BNFCOMER, BNFFEPRO, BNFHOPRO, BNFIDUSR)
VALUES (459, '250206061002', '392', 20250206, 20250207, 20250206, 'C', 0, 8191198, 2200000.00, 'Acred.a la Cta.Nro.8191198-UNI', 'Acred.a la Cta.Nro.8191198-UNI ATM     ', '  ', '4500226     ', 20250206, 12154, 'U99ZARATE ');

----reintento por naut en vez de los nclr para todos
cl: CALL PGM(GXAUTPGM/NAUT033) PARM('1002' 'DIN' '000025010313709808' '000000436628391066' '000054' '000000700534' 'A');
--siempre sera
--ssiempre din
--id opliqui
--referencia
--cod trx
--cod comercio
--A
------------------------------------------------------
---PCLR243 CARGA, OPLIQUI, TCLMOV, TCLMOD Y TCLTSB ONLINE
SELECT 'CL: CALL PGM(GXFINPGM/PCLR243) PARM(''' || AUTRRNBEP || ''' ''' || AUTTRXFCHC  || ''' '''' '''' '''' '''');'
FROM GXBDBPS.TSWAUT
WHERE AUTRRNBEP IN ('506457049270   ', '506557227642   ', '506557448785   ');
