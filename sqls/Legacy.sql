--para vaciar tabla de instructivo que arroja error al querer procesar ya que está cargado. Tare #56082
SELECT * FROM GXOPERA.TRXINST WHERE INSFECARGA>='20240319' AND INSEMISO='057';--SE FILTRA POR EL BANCO EN CUESTION
--DELETE FROM GXOPERA.TRXINST T WHERE INSFECARGA>='20240115' AND INSEMISO='064';
SELECT * FROM GXBDBPS.GENTIAF G --WHERE ENEMISO='064';
----------------------------------------------------------------------------------------------
SELECT * FROM GXOPERA.TRXINST where insPGENTID = '20377';
DELETE FROM GXOPERA.TRXINST where insPGENTID= '20377';
----------------------------------------------------------------------------------------------
SELECT * FROM GXOPERA.FLICOM WHERE LINRO ='20377';--WHERE LICOMER = '1302527' and LIFECHD='20220908';
delete FROM GXOPERA.FLICOM WHERE LINRO ='20377';  --where LICOMER = '1302527' and LIFECHD='20220908';
----------------------------------------------------------------------------------------------
SELECT * FROM GXOPERA.FLICOM1 WHERE LINROINS ='20377'; --WHERE LICOMER = '1302527' and LIFECHD='20220908';
delete from GXOPERA.FLICOM1 WHERE LINROINS ='20377';--WHERE LICOMER = '1302527' and LIFECHD='20220908';
----------------------------------------------------------------------------------------------
SELECT sum(INSFACTOT) FROM GXOPERA.TRXINST where insPGENTID = '20377';
SELECT sum(LIMONTO) FROM GXOPERA.FLICOM1 WHERE LINROINS ='20377';
-- si es bnf tambien ver
SELECT * FROM GXOPERA.OPAGO0P; --where PGUSER='U99KATERIN' PGCOME in('0702938','6900334')
SELECT * FROM GXOPERA.OPAGO1P; --where PGCOMER in('0701172','0701857','0702620','0702629','0702802')
--DELETE FROM GXOPERA.OPAGO1P;--WHERE PGCODMV IN ('459','959') AND PGIDUSR='U99TANIAA';
SELECT * FROM libdebito.OPAGO2P;-- where DTPGIDUSR='U99KATERIN', AND PGCOMER in('0703722', '8603396')
SELECT * FROM GXOPERA.OPAGO3p;
SELECT * FROM GXOPERA.OPAGO3tc;
SELECT * FROM GXOPERA.OPAGO1PHIS WHERE PGIDUSR='U99TANIAA' AND PGCOMER='4500187';
SELECT * FROM GXOPERA.COPAEN2PHS WHERE BNFIDUSR='U99KATERIN';
--------------ELIMINACION DE REGISTRO POR VENTA DE MINUTOS
SELECT * FROM GXOPERA.FCTACOM WHERE CTAUSER='U99KATERIN' and CTANROBOL ='1008231' AND CTAFECHA='20230910' AND CTANRAS='12569';
--and CTAMONTO='581000';

DELETE FROM GXOPERA.FCTACOM WHERE CTAUSER='U99KATERIN' and CTANROBOL ='60323' --AND CTAFECHA='20221223' AND CTANRAS='12569';
and CTAMONTO='581000';
------CAMBIO DE COD. MOVIMIENTO Y MENSAJE DE REINTEGROS / CAMBIO DE COD. MOVIMIENTO #37549
select * from GXBDBPS.tdmov where MOVFECTR>='20220913' and MOVIMPORTE='62500.00';
select * from gxbdbps.tmoviaf where --MVIDUSR='U99IVANE' AND
MVFEPRO='20220913' and MVIMPO2='62500.00' and MTNUMTA ='5148480000000733' AND MVSECUE IN ('902100191570','902100191569');--and CMCODIG='099' AND MVEMISO='021'

UPDATE gxbdbps.tmoviaf SET CMCODIG='016', MVNOMCO='DEBITO SALDO A FACTURAR' WHERE MVFEPRO='20220913' and MVIMPO2='62500.00' and MTNUMTA ='5148480000000733' AND MVSECUE IN ('902100191570','902100191569');

update gxbdbps.tmoviaf set MVNOMCO='CREDITO PROMOCION-CONTI DESCUENTOS'
where MVIDUSR='U99IVANE' AND MVFEPRO='20220830' AND MVEMISO='021';
---------------------------------------------------------------------------------------------------------------------------
/*bancos en fcobros*/
SELECT * FROM CONTABILID.TATGENE;
--------cambio de fecha de recibo--/*anulacion de recibo*/
select * from gxopera.fcobros where /*COMNRO='10030075009' AND*/ COMRECNRO in('1249649'); --and COMCOMER='0700202';
SELECT COUNT(*) FROM GXOPERA.FCOBROS F WHERE COMRECNRO BETWEEN '1197116' AND '1201379';
--DELETE FROM GXOPERA.FCOBROS WHERE COMRECNRO='1194770';--obs: para eliminar recibmos hay que ajustar las fact. relacionadas al recibo, poner en P, y ajustar los saldos
update gxopera.fcobros set COMSTATUS='A' /*COMFEREAL='20220913'*/ where COMRECNRO='1197116';
----------pantalla de impresión de recibos
SELECT * FROM GXOPERA.RECIBOS WHERE RID='140632';--AND RCONCEPT like'%10030021458%';/*AND RFECH='20230106' AND RID='140101';*/ --Can. Fact. Nº 10030064913(05/12/22) y Can. Fact. Nº 10030080018(06/01/23)#
select * from gxopera.recibos where RTOTFACT='50000.00' and RFECH='20220919';
select * from gxopera.RECIBO where COMIMPOR='50000.00';
--facturas     /*si se ponde en P hay que ajustar el SALDO == que la FACTURA TOTAL
Select * from GXWEB.factura where FACTNRO = 10030049993 and FACLIEN = '5700136';
update gxopera.factura set FACSTATUS='P', FACSALDO=FACTOTAL where FACTNRO ='10030082959'and faclien='7300018';
        /*ANULADO==A | PENDINETE==P | COBRADO==C | CANCELADO==K | BAJA PENDIENTE==V*/
--para igualar factura y recibo tiene que estar igual el timbrado y el comercio de la factura al recibo
Select * from gxopera.factura where FACTNRO = 10030063372;
select * from gxopera.fcobros where /*COMNRO='10030052266' AND*/ COMRECNRO='1091051';
/*custodio-talonario*/
SELECT * FROM GXOPERA.CUSTOS;--cabezara
SELECT * FROM GXOPERA.CUSTODE WHERE CUSTOREC='140116' AND CUSTOUSRD='U99LUCIA';-- AND CUSTOFCHD='20230306' -- detalle
UPDATE GXOPERA.CUSTODE T SET T.CUSTOEST = 'P',T.CUSTOMOT = 'Pendiente'WHERE CUSTOREC='140114'; --dejar en pendiente para volver a usar
--para pasar a cerrado los custorios de talonarios.
SELECT * FROM GXOPERA.CUSTOS WHERE TALOID='47';
UPDATE GXOPERA.CUSTOS C2 SET CUSTOCAN='1', CUSTODEV='20230504' WHERE CUSTOID='51' AND TALOID=47;
SELECT * FROM GXOPERA.TALONA T WHERE TALODESDE>='138601' AND TALOHASTA='138650';

DELETE FROM GXOPERA.CUSTODE WHERE CUSTOUSRD='U99LUCIA' AND CUSTOREC='140371';
SELECT * FROM GXOPERA.CUSTODE WHERE CUSTOREC>='140370';
-----para verificación de Descripción del término de pago - documenta y pagoo express  Tarea #55519
select * from gxopera.fcobros WHERE COMRECNRO='1236302';--where COMNRO='10030033873' AND COMRECNRO='1206494';
UPDATE GXOPERA.FCOBROS T SET T.COMPAGO = 'A' WHERE T.COMNRO = 10030007795 AND T.COMRECNRO='1183088';
/* Cheque= C | Efectivo= E | Débito Bancario= B | Nota= N | Dinelco Débito= D | Procard Débito= P | Transf/Deposito= T | Chq/Efec= 2 | Inst D/C= I
| Giros Tigo= G | BC-Documenta= A | BC-Express= X */
-----------------------------------------------------
SELECT * FROM GXOPERA.FACTURA1;
SELECT * FROM GXOPERA.FACTURA2;
SELECT * FROM GXOPERA.FACTURAAN;
SELECT * FROM GXOPERA.FACTURAJ;
SELECT * FROM GXOPERA.FACTURAL1;
SELECT * FROM GXOPERA.FACTURAZ;
------------------------------------------------------------------------------------------------
----cambio de zona.
select * from GXBDBPS.COMAEAF where COCOMER IN ('8101211','8600618');
UPDATE GXBDBPS.COMAEAF SET ZONACODI ='34' WHERE COCOMER IN ('8101211','8600618');
UPDATE GXBDBPS.COMAEAF SET ZONACODI='03', COCHZONA='03' WHERE COCOMER='0100037';
-------------------------------------------------------------------------------------------------
--marca excedido
select * from gxbdbps.tmtaraf where MCNUMCT='020120500143';
update gxbdbps.tmtaraf set MTESTEX='' where MCNUMCT='020120500143';
-------------------------------------------------------------------------------------------------
----rendición
select * from GXOPERA.FCOBROS where COMNRORND ='24740' AND COMRECNRO IN ('1257247','1257248','1257249','1257250');
--AND COMCOMER IN ('0802083','0802316'); --1206524, 1206527
UPDATE GXOPERA.FCOBROS SET COMFECHA = '00000000', COMNROASI = 0, COMNRORND = 0, COMFECRND = '00000000'
where COMNRORND='20586';


UPDATE GXOPERA.FCOBROS F SET COMFECRND='20231009' WHERE F.COMNRORND='24153';

DELETE FROM GXOPERA.FCOBROS where COMNRORND='22734';
--PARA BANCO DE RENDICION
SELECT * FROM CONTABILID.TATGENE WHERE TGENTI='064';
-------------------------------------------------------------------------------------------------
/*no puede trasaccionar con cico*/
INSERT INTO GXWEB.BST015W
    (BS15CODPRO, BS15CODCOM, BS15ESTADO, BS15MONLIM, BS15FECLIM, BS15MONSAL, BS15PORGIR, BS15USUUPD, BS15FHOUPD)
VALUES ('CICOMONEY ', '0702508', 'A', 0.00, 20221025, 414000.00, 0.05, 'U99KEVINF ', '2022-10-25 11:58:27.000');
--------------------------------
UPDATE GXWEB.BST015W
SET BS15CODCOM ='     0702508'
WHERE BS15CODCOM = '0702508';
------------------------------------------------------------------------------------------------
--modificar el costo de alquiler DE POS
SELECT * FROM GXBDBPS.COAFMAF WHERE AFCOMER='1900404';
    UPDATE GXBDBPS.COAFMAF SET AFMONTO =90909 WHERE AFCOMER = '1900404';
-----------------------------
--TAREA #57432 GENERÓ INSTRUCITIVO Y NO CARGÓ LA TOTALIDAD EN TSB
select * from gxopera.flicom1 where linroins = '20340' and licomer in
(select tsbcoco from gxfindta.tcltsb where tsbtpop = '04' and date(tsbfege) ='2023-12-13');--4742
/*cambio de estado del instructivo*/
select sum(INSFACTOT) from gxopera.trxinst where inspgentid = '19896' AND INSTATUS='A' AND INSFACLIEN
IN ((select licomer from gxopera.flicom1 where linroins = '19896' and licomer NOT IN
(select tsbcoco from gxfindta.tcltsb where tsbtpop = '04' and date(tsbfege) = '2023-08-18')));
-----
select SUM(INSFACTOT) from gxopera.trxinst where inspgentid = '19896' AND INSTATUS='A' AND INSFACLIEN
NOT IN (select tsbcoco from gxfindta.tcltsb where tsbtpop = '04' and date(tsbfege) = '2023-08-18');
/*A LOS QUE NO SE FUERON EN TSB SE LE PONE PENDIENTE=B*/
UPDATE GXOPERA.TRXINST T SET INSTATUS='B'where inspgentid = '19896' AND INSTATUS='A' AND INSFACLIEN
IN ((select licomer from gxopera.flicom1 where linroins = '19896' and licomer NOT IN
(select tsbcoco from gxfindta.tcltsb where tsbtpop = '04' and date(tsbfege) = '2023-08-18')));
/* Listo p/ Generar Recibo= A --DEBERÍA DE ESTAR EN TRASMISIONES
   Pendiente Instructivo= P
   Pendiente Recibo= B son los que no están en Reing. pero si en el legacy sistema facturación//NO SE FUE O NO SE GENERO
PARA LOS QUE ESTÁN EN TSB Y ESTABAN ACREDITADOS LISTO=A*/
UPDATE GXOPERA.TRXINST T SET INSTATUS='A' WHERE INSFACLIEN IN (
(select licomer from gxopera.flicom1 where linroins = '19858' and licomer in
(select tsbcoco from gxfindta.tcltsb where tsbtpop = '04' and date(tsbfege) = '2023-08-07' AND TSBESTA='AC')));
/*PARA LOS QUE ESTÁN EN TSB Y NO ESTABAN ACREDITADOS LISTO=P*/
UPDATE GXOPERA.TRXINST T SET INSTATUS='B' WHERE INSFACLIEN IN (
(select licomer from gxopera.flicom1 where linroins = '19858' and licomer in
(select tsbcoco from gxfindta.tcltsb where tsbtpop = '04' and date(tsbfege) = '2023-08-07' AND TSBESTA<>'AC')));
--PARA VER LO QUE FALTA
select INSTATUS, SUM(INSFACTOT) from gxopera.trxinst where inspgentid = '19858'
GROUP BY INSTATUS;
-----------------------------
/*Aplicar la siguiente tasa en DATOS 1 y DATOS 4 en SITC90 Aplica para Dinelco, Locales, Intracountry e Internacional)
*CREDITO: 2,70 DEBITO: 2,70 Tarea#55580*/
/*datos 4*/
UPDATE GXBDBPS.COMAEXD
   SET CCMTASA = 2.70
WHERE CCFCHDES = '20230731' AND   COCOMER = '1003244' AND   BPSSRVCOD = 1;
/*datos 1*/
UPDATE GXBDBPS.COMAEAF
SET ADDESDEB=2.70, ADDESCRE=2.70
WHERE COCOMER in (select COCOMER from gxbdbps.comaeaf where corucn = '80022877-4' and Costat <> 90);
/*RECLAMOS LUZ*/
select * from gxbdbps.TMOVMAF;
select * from gxbdbps.TMO1MAF where CMCODIG='529' and MDUSRDT='U99GARAY';
select * from gxbdbps.TMO1MAF where CMCODIG='529' and MDUSRDT='U99GARAY' AND MDFEREA='20230823';
select * from gxbdbps.TMO1MAF where  MDUSRDT='U99SUSANA';
-------
--FECHA DE INICIO DE FACTURACION Tarea#61443
UPDATE GXBDBPS.COAFMAF
SET AFFEFACT='20231001'
WHERE AFCOMER IN ('0700139','0700161','0700204','0700445','0700623','0700871','0701213','0701772','0703626','0703627','0703628','0703629',
'0703630','0703631','0703632','0706248','0706249');
--TABLA DE COTIZACIONES
SELECT * FROM GXBDBPS.AITCOT A WHERE A.COTFEC>='20231113';
-------------------------
---CASO http://10.1.254.18/issues/66800
---LA MISMA SE CORTÓ EL PROCESO DE GENERACIÓN DE RECIBOS POR INSTRUCTIVO MASIVO. TODAS ESTAN OK EN EN TRASMISIONES,
--PERO LA MIATD APROX. GENERÓ RECIBOS Y AFECTO EL SALDO EN FACTURA, LOS OTROS NO POR CORTARSE EL PROCESO DE LA VPN
---------------------------------------------------------------------------------------------------------------------------
--PARA SOLUCIONAR LA MISMA SE DEBE DE INSERTAR EN TRXINST  NUEVAMENTE LAS OPERACIONES Y PONER EN ESTADO A PARA QUE PUEDAN GENERAR RECIBOS.
    --MODELO DE DATOS DE TRXINST CON SUS CAMPOS.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*INSFACTIPO,      INSFACTNRO, INSFACTIMB,  INSFACLIEN, INSFACTOT, INSFACFECH,   INSNROCTA, INSLICODTR, INSTATUS,    INSPGENTID,       INSCOFACTU,        INSEMISO, INSTICTA, INSMONEDA, INSLIFECHD,  INSFECARGA*/
--CRE O INSFACTIO, FACUTURA,   TIMBRADO,    COMERCIO,   FACSALDO,  FECHAFACTURA, ADNUMCTA,   010001,     A,        NR0 INSTRUCTIVO,   COFACTU(COMAEAF),   ENDURO,   ADTICTA,   600,      FEHCAGENERA, FECHA GENERACION RECIBO
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*Listo p/ Generar Recibo= A --DEBERÍA DE ESTAR EN TRASMISIONES AC
   Pendiente Instructivo= P
   Pendiente Recibo= B son los que no están en Reing. pero si en el legacy sistema facturación*/
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*---NAME         | VALOR P/ INENEMISO
Bco. Itau         |  055
Bco. Continental  |  057
BNF               |  002
Bco. Regional     |  059
Procesadora Pro...|  510
Bco. Visión       |  054
Bco. BBVA         |  064   */
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---QUERY USADO PARA ARMAR LA ESTRUCTURA EN CASE A COMERCIOS QUE YA LA CHICA DE COBRANZAS IDENTIFICÓ EN LOS FALTANTES.
SELECT F.FACTIPO,
       F.FACTNRO,
       F.FACTIMBR,
       F.FACLIEN,
       F.FACSALDO,
       F.FACFECH,
       C2.ADNUMCTA,
       C2.COFACTU,
       C2.ADTICTA,
       F.IDMONEDA
FROM GXOPERA.FACTURA F
         INNER JOIN GXBDBPS.COMAEAF C2 ON C2.COCOMER = F.FACLIEN
WHERE F.FACSTATUS = 'P' ---A TODOS LOS QUE NO SE GENERÓ EL RECIBO QUEDAN EN PENDINTE
  AND F.FACLIEN IN (
                    '0201175',
                    '0302888',
                    '0303293')--etc...
  AND FACTNRO IN (
                  '10030077713',
                  '10030078231');--GROUP BY F.FACLIEN; /*etc...-*/
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--O CORRER ESTO PERO ALREVEZ, BUSCA EL INSTRUCTIVO EN CLEARING SI ESTAN TODOS. SERÍA CORRER DESDE PLICOM HACIA TRXINST, FCOBROS Y FACTURA
select * from gxopera.flicom1 where linroins = '20340' and licomer in
(select tsbcoco from gxfindta.tcltsb where tsbtpop = '04' and date(tsbfege) ='2023-12-13');--4742
------------------------------------------------------------------------------------------------------------------------
----------------fORMULA DEL EXCEL
/*=CONCATENAR("INSERT INTO GXOPERA.TRXINST (INSFACTIPO, INSFACTNRO, INSFACTIMB, INSFACLIEN, INSFACTOT, INSFACFECH, INSNROCTA, INSLICODTR, INSTATUS, INSPGENTID, INSCOFACTU, INSEMISO, INSTICTA, INSMONEDA, INSLIFECHD, INSFECARGA)
VALUES ('";A5;"','";B5;"','";C5;"','";D5;"','";E5;"','";F5;"','";G5;"','010001', 'A','20340','";H5;"','057','";I5;"','";J5;"','20231213','20231214');")*/
-----------------------------------------------------------IGUAL A LO QUE ESTÁ ABAJO-------------------------------------------------------------
INSERT INTO GXOPERA.TRXINST (INSFACTIPO, INSFACTNRO, INSFACTIMB, INSFACLIEN, INSFACTOT, INSFACFECH, INSNROCTA, INSLICODTR, INSTATUS, INSPGENTID, INSCOFACTU, INSEMISO, INSTICTA, INSMONEDA, INSLIFECHD, INSFECARGA)
VALUES ('CR', '10030079307', '16444256', '0801277', '240000', '20231205', '6321033963', '010001', 'A', '20340', '0801277', '057', '1', '600', '20231213', '20231214');
------------------------------------------------------------------------------------------------------------------------
--se inserta espectacularmente, pero le da clave duplicada, al principio se piensa que es la tabla de auditoría
SELECT * FROM GXOPERA.AUDFACT A ORDER BY AUDFECH DESC;--AUDITORÍA
----pero es la tabla historico de instrutivo.. Delete masivo por dicho nro de instructivo
DELETE FROM GXOPERA.INSTHIS I WHERE I.HISLINNRO='20340';
--------------------------------------------------------- opa --------------------------------------------------------------
--tabla mcc
SELECT * FROM GXBDBPS.NUT011 n;
---permisos legacy
SELECT * FROM gxbdcon.GXLOUSU WHERE USUAID LIKE '%U99BENITEZ%'; -- Usuario para SITC_EVO      FUNCOD= 1045--U99SARAV   FUNCOD=4063--U99CODAS
SELECT * FROM GXBDCON.GXLOSIS WHERE SISCODI = 'TC';
SELECT * FROM GXBDCON.GXLOPER WHERE SISCODI = 'TC' AND USUCOD = 859;
SELECT * FROM GXBDCON.GXLOFUN WHERE SISCODI = 'TC' AND FUNNOM LIKE '%regaut%';
SELECT * FROM GXBDCON.GXLOPERDET WHERE USUCOD = 561;--AND FUNCOD IN(496);
SELECT * FROM GXBDCON.GXLOPERDET WHERE USUCOD = 859;--AND FUNCOD IN(496);
SELECT * FROM GXBDCON.GXLOPERDET WHERE USUCOD = 561 AND FUNCOD NOT IN (SELECT FUNCOD FROM GXBDCON.GXLOPERDET WHERE USUCOD = 859);--AND FUNCOD IN(496);
SELECT * FROM GXBDBPS.GENTIAF g WHERE ENEMISO = 189;

--SISTEMA DE PRODUCICÓN --KB CLEARING REPUESTO --- PERMISOS
SELECT *FROM GXBDCON.Gxlousu WHERE USUAID IN ('U99ADOLFO','U99HERNAN');--usuario
SELECT *FROM GXBDCON.Gxlosis; --sistema
SELECT *FROM GXBDCON.Gxlofun; --funcionalidad
SELECT *FROM GXBDCON.Gxloper WHERE USUCOD='1675';--usuario sistema
SELECT *FROM GXBDCON.Gxloperdet WHERE USUCOD='394'; --permisos habilitados
------------------------------------------------------------------------------------------------------------------------------------
----------------------------Tareas #37073 ALQUILER DE POS - SETIEMBRE
/*Elimina facturas generadas de manera incorrecta*/
Select * from gxopera.factura where FACFECH = '20220902' and factimbr = '15662553' and factnro between 10030031025 and 10030036040;
Delete FROM gxopera.factura where FACFECH = '20220902' and factimbr = '15662553' and factnro between 10030031025 and 10030036040;
/*No se generaron detalles relacionadas*/
Select * from gxopera.factura1 where factimbr = '15662553' and factnro between 10030031025 and 10030036040;
/*El numerador de facturas no fue actualizado en el rango afectado*/
Select * from gxopera.factura2 where FACTURA2TIMBRADO = '15662553' and FACTURA2TIPO = 'NOR';
------------------------------------------------------------------------------------------------------------------------------------
---Contabilidad rrhh
select * from CONTABILID.SJ90LIQ WHERE LINOMB LIKE '%OTILIA%';
------------------------------------------------------------------------------------------------------------------------------------
-----resumen de comisiones
select  substr(opferea, 1, 6), opcomer comercio,  codeno as denominacion, sum(opcoment + OPIVAENT) total
from gxopera.opmovi inner join gxbdbps.comaeaf on (opcomer = cocomer)
where CORUCN='80025401-5' and substr(opcomer, 1, 2) IN ('81', '86') and substr(opferea, 1, 4) = '2024' and substr(opferea, 5, 2) between '02' and '02'
group by substr(opferea, 1, 6), opcomer, codeno;
SELECT * FROM gxopera.opmovi;