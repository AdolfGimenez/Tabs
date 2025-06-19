--para vaciar tabla de instructivo que arroja error al querer procesar ya que est� cargado. Tare #56082
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
----------pantalla de impresi�n de recibos
SELECT * FROM GXOPERA.RECIBOS WHERE RID='140632';--AND RCONCEPT like'%10030021458%';/*AND RFECH='20230106' AND RID='140101';*/ --Can. Fact. N� 10030064913(05/12/22) y Can. Fact. N� 10030080018(06/01/23)#
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
-----para verificaci�n de Descripci�n del t�rmino de pago - documenta y pagoo express  Tarea #55519
select * from gxopera.fcobros WHERE COMRECNRO='1236302';--where COMNRO='10030033873' AND COMRECNRO='1206494';
UPDATE GXOPERA.FCOBROS T SET T.COMPAGO = 'A' WHERE T.COMNRO = 10030007795 AND T.COMRECNRO='1183088';
/* Cheque= C | Efectivo= E | D�bito Bancario= B | Nota= N | Dinelco D�bito= D | Procard D�bito= P | Transf/Deposito= T | Chq/Efec= 2 | Inst D/C= I
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
----rendici�n
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
--TAREA #57432 GENER� INSTRUCITIVO Y NO CARG� LA TOTALIDAD EN TSB
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
/* Listo p/ Generar Recibo= A --DEBER�A DE ESTAR EN TRASMISIONES
   Pendiente Instructivo= P
   Pendiente Recibo= B son los que no est�n en Reing. pero si en el legacy sistema facturaci�n//NO SE FUE O NO SE GENERO
PARA LOS QUE EST�N EN TSB Y ESTABAN ACREDITADOS LISTO=A*/
UPDATE GXOPERA.TRXINST T SET INSTATUS='A' WHERE INSFACLIEN IN (
(select licomer from gxopera.flicom1 where linroins = '19858' and licomer in
(select tsbcoco from gxfindta.tcltsb where tsbtpop = '04' and date(tsbfege) = '2023-08-07' AND TSBESTA='AC')));
/*PARA LOS QUE EST�N EN TSB Y NO ESTABAN ACREDITADOS LISTO=P*/
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
---LA MISMA SE CORT� EL PROCESO DE GENERACI�N DE RECIBOS POR INSTRUCTIVO MASIVO. TODAS ESTAN OK EN EN TRASMISIONES,
--PERO LA MIATD APROX. GENER� RECIBOS Y AFECTO EL SALDO EN FACTURA, LOS OTROS NO POR CORTARSE EL PROCESO DE LA VPN
---------------------------------------------------------------------------------------------------------------------------
--PARA SOLUCIONAR LA MISMA SE DEBE DE INSERTAR EN TRXINST  NUEVAMENTE LAS OPERACIONES Y PONER EN ESTADO A PARA QUE PUEDAN GENERAR RECIBOS.
    --MODELO DE DATOS DE TRXINST CON SUS CAMPOS.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*INSFACTIPO,      INSFACTNRO, INSFACTIMB,  INSFACLIEN, INSFACTOT, INSFACFECH,   INSNROCTA, INSLICODTR, INSTATUS,    INSPGENTID,       INSCOFACTU,        INSEMISO, INSTICTA, INSMONEDA, INSLIFECHD,  INSFECARGA*/
--CRE O INSFACTIO, FACUTURA,   TIMBRADO,    COMERCIO,   FACSALDO,  FECHAFACTURA, ADNUMCTA,   010001,     A,        NR0 INSTRUCTIVO,   COFACTU(COMAEAF),   ENDURO,   ADTICTA,   600,      FEHCAGENERA, FECHA GENERACION RECIBO
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*Listo p/ Generar Recibo= A --DEBER�A DE ESTAR EN TRASMISIONES AC
   Pendiente Instructivo= P
   Pendiente Recibo= B son los que no est�n en Reing. pero si en el legacy sistema facturaci�n*/
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*---NAME         | VALOR P/ INENEMISO
Bco. Itau         |  055
Bco. Continental  |  057
BNF               |  002
Bco. Regional     |  059
Procesadora Pro...|  510
Bco. Visi�n       |  054
Bco. BBVA         |  064   */
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---QUERY USADO PARA ARMAR LA ESTRUCTURA EN CASE A COMERCIOS QUE YA LA CHICA DE COBRANZAS IDENTIFIC� EN LOS FALTANTES.
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
WHERE F.FACSTATUS = 'P' ---A TODOS LOS QUE NO SE GENER� EL RECIBO QUEDAN EN PENDINTE
  AND F.FACLIEN IN (
                    '0201175',
                    '0302888',
                    '0303293')--etc...
  AND FACTNRO IN (
                  '10030077713',
                  '10030078231');--GROUP BY F.FACLIEN; /*etc...-*/
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--O CORRER ESTO PERO ALREVEZ, BUSCA EL INSTRUCTIVO EN CLEARING SI ESTAN TODOS. SER�A CORRER DESDE PLICOM HACIA TRXINST, FCOBROS Y FACTURA
select * from gxopera.flicom1 where linroins = '20340' and licomer in
(select tsbcoco from gxfindta.tcltsb where tsbtpop = '04' and date(tsbfege) ='2023-12-13');--4742
------------------------------------------------------------------------------------------------------------------------
----------------fORMULA DEL EXCEL
/*=CONCATENAR("INSERT INTO GXOPERA.TRXINST (INSFACTIPO, INSFACTNRO, INSFACTIMB, INSFACLIEN, INSFACTOT, INSFACFECH, INSNROCTA, INSLICODTR, INSTATUS, INSPGENTID, INSCOFACTU, INSEMISO, INSTICTA, INSMONEDA, INSLIFECHD, INSFECARGA)
VALUES ('";A5;"','";B5;"','";C5;"','";D5;"','";E5;"','";F5;"','";G5;"','010001', 'A','20340','";H5;"','057','";I5;"','";J5;"','20231213','20231214');")*/
-----------------------------------------------------------IGUAL A LO QUE EST� ABAJO-------------------------------------------------------------
INSERT INTO GXOPERA.TRXINST (INSFACTIPO, INSFACTNRO, INSFACTIMB, INSFACLIEN, INSFACTOT, INSFACFECH, INSNROCTA, INSLICODTR, INSTATUS, INSPGENTID, INSCOFACTU, INSEMISO, INSTICTA, INSMONEDA, INSLIFECHD, INSFECARGA)
VALUES ('CR', '10030079307', '16444256', '0801277', '240000', '20231205', '6321033963', '010001', 'A', '20340', '0801277', '057', '1', '600', '20231213', '20231214');
------------------------------------------------------------------------------------------------------------------------
--se inserta espectacularmente, pero le da clave duplicada, al principio se piensa que es la tabla de auditor�a
SELECT * FROM GXOPERA.AUDFACT A ORDER BY AUDFECH DESC;--AUDITOR�A
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

--SISTEMA DE PRODUCIC�N --KB CLEARING REPUESTO --- PERMISOS
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
-----------------------------------------cta bnf
Select *
--pgidtrn,pgfecom, pgtipo, pgnocta, pgimpor, pgcomer,pgfecre, PGIDUSR,op.PGFEPRO, op.PGHOPRO
from gxopera.opago1p op where op.PGIDUSR='U99KATERIN';
--AND pgcomer = '4500001' and pgidtrn = '240325569872';
SELECT * FROM GXOPERA.OPAGO1PHIS O1P WHERE PGIDUSR='U99KATERIN' ORDER BY PGFECOM DESC --AND PGFECOM >='20250317';
---------------------------------------------
Update gxopera.opago1p set pgnocta = 8191198, pgticta = 0
                       WHERE PGIDTRN=240425585010 AND pgcomer = '4500001';
------------------------------------------------------
---DISCREPANCIOA DE SALDOS | Autorizaciones pendientes vs retenido en cuentas de los clientes condicionados por Continental.
SELECT COALESCE((SELECT SUM(APIMPOR) FROM GXBDBPS.TAUTPAF A WHERE AUT.APNUMCT = A.APNUMCT AND A.APSTATS = 'P' AND CMCODIG = '005' AND A.APCANCU = 1), 0) AS CONT_005,
       COALESCE((SELECT SUM(APIMPOR) FROM GXBDBPS.TAUTPAF A WHERE AUT.APNUMCT = A.APNUMCT AND A.APSTATS = 'P' AND CMCODIG = '006' AND A.APCANCU > 1), 0) AS CUOTA_006,
       COALESCE((SELECT SUM(APIMPOR) FROM GXBDBPS.TAUTPAF A WHERE AUT.APNUMCT = A.APNUMCT AND A.APSTATS = 'P' AND CMCODIG = '007' AND A.APCANCU > 1), 0) AS CUOTA_007,
       COALESCE((SELECT SUM(APIMPOR) FROM GXBDBPS.TAUTPAF A WHERE AUT.APNUMCT = A.APNUMCT AND A.APSTATS = 'P' AND CMCODIG = '010' AND A.APCANCU = 1), 0) AS CONT_010,
       T.MCAPCOC, T.MCAPCUC, T.MCAPCUA, T.MCAPCOA, T.MCNUMCT, 'NUEVO', CURRENT TIMESTAMP
FROM GXBDBPS.TMCTAAF T
         LEFT JOIN GXBDBPS.TAUTPAF AUT ON AUT.APNUMCT = T.MCNUMCT
WHERE MCEMISO IN ('021') AND MCSTATS = '1'
  AND ((COALESCE((SELECT SUM(APIMPOR) FROM GXBDBPS.TAUTPAF A WHERE AUT.APNUMCT = A.APNUMCT AND A.APSTATS = 'P' AND CMCODIG = '005' AND A.APCANCU = 1), 0) != T.MCAPCOC) OR
       (COALESCE((SELECT SUM(APIMPOR) FROM GXBDBPS.TAUTPAF A WHERE AUT.APNUMCT = A.APNUMCT AND A.APSTATS = 'P' AND CMCODIG = '006' AND A.APCANCU > 1), 0) != T.MCAPCUC) OR
       (COALESCE((SELECT SUM(APIMPOR) FROM GXBDBPS.TAUTPAF A WHERE AUT.APNUMCT = A.APNUMCT AND A.APSTATS = 'P' AND CMCODIG = '007' AND A.APCANCU > 1), 0) != T.MCAPCUA) OR
       (COALESCE((SELECT SUM(APIMPOR) FROM GXBDBPS.TAUTPAF A WHERE AUT.APNUMCT = A.APNUMCT AND A.APSTATS = 'P' AND CMCODIG = '010' AND A.APCANCU = 1), 0) != T.MCAPCOA))
GROUP BY COALESCE((SELECT SUM(APIMPOR) FROM GXBDBPS.TAUTPAF A WHERE AUT.APNUMCT = A.APNUMCT AND A.APSTATS = 'P' AND CMCODIG = '005' AND A.APCANCU = 1), 0),
         COALESCE((SELECT SUM(APIMPOR) FROM GXBDBPS.TAUTPAF A WHERE AUT.APNUMCT = A.APNUMCT AND A.APSTATS = 'P' AND CMCODIG = '006' AND A.APCANCU > 1), 0),
         COALESCE((SELECT SUM(APIMPOR) FROM GXBDBPS.TAUTPAF A WHERE AUT.APNUMCT = A.APNUMCT AND A.APSTATS = 'P' AND CMCODIG = '007' AND A.APCANCU > 1), 0),
         COALESCE((SELECT SUM(APIMPOR) FROM GXBDBPS.TAUTPAF A WHERE AUT.APNUMCT = A.APNUMCT AND A.APSTATS = 'P' AND CMCODIG = '010' AND A.APCANCU = 1), 0),
T.MCAPCOC, T.MCAPCUC, T.MCAPCUA, T.MCAPCOA, T.MCNUMCT;
----------
----COMERCIOS_WEB
SELECT * GXBDCON.GXLOFUN;
SELECT * FROM GXDEBITO.JRNCOMAEAF J;
SELECT * FROM GXDEBITO.JRNCOMAEXD J;

--Favor procesar la modificacion de limite de 0 a 1 para la afinidad 508 a pedido de la entidad
UPDATE GXTRJDTA.TDGALC
    SET ALCIMPOMAX=1
    WHERE ENTCODENT=1020 AND AFICODAFI=508 AND MONIDMONED=600 AND ALCTIPOLC=1;

--carga de datos para enrutamiento del nuevo BIN de Mastercard
INSERT INTO ATMCENTRE.TBBINE0P (QENTEM,QEBI10, QENSUC, QNOMBE, QEBIN1, QNOMBS, QNOMPR,QECDRT, QENRO, QEPGM, QELIB,
QEICF, QEPUER, QECTAC,QECTAD, QECSTS, QEDBCR, QTPBIN, QDISPO, QOPCOM, QOPATM, QTPENT, QMARCA, QEUSER, QIDUSB )
SELECT
QENTEM ,'527607',QENSUC,'MASTERCARD PRIVILEGIO','527607','MASTERCARD PRIVILEGIO',
'MASTERCARD CREDITO',QECDRT, QENRO, QEPGM, QELIB, QEICF, QEPUER, QECTAC,
QECTAD, QECSTS, QEDBCR, QTPBIN, QDISPO, QOPCOM, QOPATM, QTPENT,QMARCA, QEUSER,'MIGRACION'
FROM ATMCENTRE.tbbine0p where QEBI10 = '530399' ;

INSERT INTO LIBDEBITO.TBBINE0P (QENTEM,QEBI10, QENSUC, QNOMBE, QEBIN1, QNOMBS, QNOMPR,QECDRT, QENRO, QEPGM,
QELIB, QEICF, QEPUER,QECTAC,QECTAD,QECSTS, QEDBCR, QTPBIN, QDISPO, QOPCOM, QOPATM, QTPENT,QMARCA, QEUSER, QIDUSB)
SELECT
QENTEM ,'527607',QENSUC,'MASTERCARD PRIVILEGIO','527607','MASTERCARD PRIVILEGIO',
'MASTERCARD CREDITO',QECDRT, QENRO, QEPGM, QELIB, QEICF, QEPUER, QECTAC,
QECTAD, QECSTS, QEDBCR, QTPBIN, QDISPO, QOPCOM, QOPATM, QTPENT,QMARCA, QEUSER,'MIGRACION'
FROM libdebito.tbbine0p where QEBI10 = '530399' ;

--ver fecha de retencion legacy
SELECT C2.COFIVA, C2.* FROM GXBDBPS.COMAEAF C2 WHERE C2.CORUCN='80002491-5';
SELECT * FROM GXFINDTA.TCOCNA T WHERE T.COCOMER IN ('4300052','4300054');
--reing
SELECT * FROM GXFINDTA.TCMIMP T WHERE T.CLICLICOD=21772;

select * from gxopera.opago1phis where pgfecom = '20250124' and pgcomer = '6500090';
SELECT * FROM gxopera.OPAGO1PHIS WHERE pgfecom = '20250124' AND PGIDUSR= 'U99ESTHER';

----tasas legacy
SELECT * FROM GXBDBPS.COMAEXD C2 WHERE C2.COCOMER='0702003';
SELECT * FROM GXBDBPS.COMAEAF C2 WHERE C2.COCOMER='0702003';
--tasas reing.
SELECT * FROM GXFINDTA.TCMSTS T WHERE T.CLICLICOD=11707;
--tasas legacy
SELECT * FROM GXBDBPS.COMAEXD C2 WHERE C2.COCOMER='0801914' AND BPSSRVCOD='1' AND C2.CCMARCA='MST' AND C2.CCMAROR='I'
AND C2.CCTIPTA='C';

SELECT * FROM GXFINDTA.TCOCNA T WHERE T.COCOMER='0801914';
---tasas reing.
SELECT * FROM GXFINDTA.TCMSTS T WHERE T.CLICLICOD=3762 AND T.SUCSUCCOD=2 AND T.SERCODI='COMPRA' AND STSTPUSO='C'
AND STSMARCA='MST' AND T.STSORGTRX='I';
---verifica en tclmov tipo y marca
SELECT T.MOVMARC, T.MOVTPTA, T.MOVCOAM, T.SERCODI, T.PRECODI, T.MOVPROD, T.*
FROM GXFINDTA.TCLMOV T
WHERE T.MOVCOMER = '0801914' AND T.MOVIMPO = '300000' AND T.MOVFPRO = '20250516';
---------------
---archivo tn70 fehca 04/03/2025
SELECT
    b.TN70FECPRO AS "Fec Inc",a.TN70ARN AS ARN, a.TN70MTI AS MTI, a.TN70CODFUN AS FNC,
    SUBSTR(a.TN70TRJNRO, 1, 6) AS BIN, a.TN70TRJNRO AS TARJETA, a.TN70PRGCMS AS PROD, a.TN70MCC AS MCC,
    a.TN70CARPGM AS CARD_PROG, a.TN70RRNBEP AS RRN, a.TN70FHTRX AS FCH_TRX, SUBSTR(a.TN70FHTRX, 1, 6) AS FEC_TRA,
    SUBSTR(a.TN70FHTRX, 7, 12) AS HORA, a.TN70CODCOM AS COD,a.TN70COMNOM AS COMERCIO,a.TN70MTOTRX AS "Mto Trx",
    a.TN70IMPCON AS "Imp Conc",a.TN70TASCON AS "Tas Conv",a.TN70TRXFEE AS "Fee Liq",a.TN70FETRCO AS "Fee Conc",
    a.TN70IRD AS IRD,a.TN70STLFCH AS "Fec Sttl"
FROM GXSWTDTA.MCTN70D a
join GXSWTDTA.MCTN70H b ON a.TN70FILIDH = b.TN70FILIDH
WHERE a.TN70FILIDH IN ('2025063001');

---tn70
SELECT TN70ARN ARN, TN70MTI MTI, TN70CODFUN FNC, SUBSTR(TN70TRJNRO, 1 , 6) BIN, TN70TRJNRO TARJETA,
TN70PRGCMS PROD, TN70MCC MCC, TN70CARPGM CARD_PROG, TN70RRNBEP RRN, TN70FHTRX FCH_TRX,SUBSTR(TN70FHTRX, 1, 6) FEC_TRA,
SUBSTR(TN70FHTRX, 7, 12) HORA, TN70CODCOM COD, TN70COMNOM COMERCIO
FROM GXSWTDTA.MCTN70D WHERE TN70FILIDH  IN (2025073001, 2025073002);
SELECT * FROM  GXSWTDTA.MCTN70H M70H;
SELECT * FROM  GXSWTDTA.MCTN70D WHERE  TN70RRNBEP ='507260099802'  AND TN70FILIDH  IN (2025073001, 2025073002);
-------------------------------------------------------------------
--Reproceso Monitor plus
--prueba para ver si les llega borrar unas cuantas rrn y espera que confirmen
delete FROM VISA.NRT_RRN_EX
       where NRTLOGFECH='2025-03-13'
AND RRN_EXT IN ('507259804699', '507259804692', '507259804684', '507259804696', '507259804683', '507259804694', '507259804705', '507259804720', '507259804702', '507259804708', '507259804721', '507259804713', '507259804710', '507259804703', '507259804712');

--ver trx monplus a enviar y enviados
---ver los pendientes excluyendo los eliminados mas arriba
SELECT * FROM VISA.NRT_RRN_EX WHERE NRTLOGFECH='2025-06-11' AND  NRTLOGHORA BETWEEN '12:05:29' AND  '12:38:55' AND
RRN_EXT NOT IN ('507259804699', '507259804692', '507259804684', '507259804696', '507259804683', '507259804694',
'507259804705', '507259804720', '507259804702', '507259804708', '507259804721', '507259804713', '507259804710', '507259804703', '507259804712');

---REPROCESAR MON PLUS EN EL DÍA
SELECT * FROM VISA.NRT_RRN_EX WHERE NRTLOGFECH='2025-03-13' AND  NRTLOGHORA BETWEEN '13:02:46' AND  '13:28:06';
delete FROM VISA.NRT_RRN_EX WHERE NRTLOGFECH='2025-03-13' AND  NRTLOGHORA BETWEEN '13:02:46' AND  '13:28:06';
------------------------------------------------
------------PROCESO ARCHVIO EPIN
--VER LA FECHA JULIANA
select * from MARCAS.VW_TRANSACCIONES_VISA;
---VERIFICAR QUE ACTUALIZO EL PROCESO EN EL CAMPO PFDVALCHR1 A LA FECHA DE HOY,
--QUIERE DE DECIR QUE EL JOB CORRIO.
---VERRIFICAR EN EL POSTGRES MARCAS.TRANS_VISA SI NO HAY REGISTROS EL PENTAHO NO HIZO ALGO
select * from GXFINDTA.TCLPFD  WHERE PFCIDPARM='CONFIGVISA' AND PFDIDGRUP ='FECHAEPIN';
--
----PARA VER CONFIGURACIÓN DE RENTA IVA RENTA
--REING
--PARA QUITAR VERN PANTALLA REING: https://portal.bepsa.com.py/accesobepsa/servlet/finanzas.tcmsucww
--lupita = https://portal.bepsa.com.py/accesobepsa/servlet/finanzas.tcmsucview?1,3,  e impuestos
SELECT T.* FROM GXFINDTA.TCMIMP T WHERE T.CLICLICOD=26929 AND T.SUCSUCCOD IN (12,10,16,17,24,18);
--legacy
SELECT CORETEN, COFRENT, COFIVA, C2.* FROM GXBDBPS.COMAEAF C2 WHERE C2.COCOMER=5500423;
-------------------
--query replace para hsm
UPDATE QUSRTOOLS.FMTDEBHSM
SET FMTHSMDDTA = REPLACE(FMTHSMDDTA, 'PAYSHIELD 9000', 'PAYSHIELD 10000')
WHERE FMTHSMDDTA LIKE '%PAYSHIELD 9000%';

SELECT
    REPLACE(FMTHSMDDTA, 'PAYSHIELD 9000', 'PAYSHIELD 10000') AS columna_modificada
FROM QUSRTOOLS.FMTDEBHSM
WHERE FMTHSMDDTA LIKE '%PAYSHIELD 9000%';

--cuantificar los comercios que se encuentren con inconsistencia de datos entre ambos sistemas (RI y LEGACY).
--Errores #92475 inconsistencia en debito en cuenta reing vs legacy
--debito en cuenta = cotarje = 0 NO | 1 SI
SELECT * FROM GXBDBPS.COMAEAF C2 WHERE COENTDEB<>'001' AND cotarje=0
AND SUBSTR(COCOMER, 1 , 2) NOT IN (45, 90) AND COSTAT<>90;

SELECT * FROM GXFINDTA.TCMSUC T; --SUCCNLPG
--reporte
SELECT CASE
           WHEN SUCCNLPG = 'DD' THEN 'DEBITO_DINELCO'
           WHEN SUCCNLPG = 'DB' THEN 'DEBITO_BANCARIO'
           WHEN SUCCNLPG = 'PE' THEN 'PAGO_EFECTIVO'
           ELSE 'SIN_DEFINIR' END RI_DB, 'NO' DE_EN_CUENTA_LEGACY,
     TC.COCOMER COMERCIO_LEGACY, T.CLICLICOD CLIENTE_RI, T.SUCSUCCOD SUCURSAL_RI, T.SUCDENCOM DENOMINACION --T.*
FROM GXFINDTA.TCMSUC T
         INNER JOIN GXFINDTA.TCOCNA TC ON TC.CLICLICOD = T.CLICLICOD AND TC.SUCSUCCOD = T.SUCSUCCOD
WHERE COCOMER IN (SELECT COCOMER
                  FROM GXBDBPS.COMAEAF C2
                  WHERE COENTDEB <> '001'
                    AND COTARJE = 0
                    AND SUBSTR(COCOMER, 1, 2) NOT IN (45, 90)
                    AND COSTAT <> 90);


----CONCILIADOR PERSONAL | JOB PENTAHO j_env_sftp_personal - Deposito TRX Personal SFTP
SELECT LERRNB COMPROBANTE , SUBSTR(LCTADE, 3, 14) FECHAHORA, CASE WHEN SUBSTR(LIDTRA, 1, 1) = 'T' THEN '28' ELSE '29'
END IDSERVICIO , LIMPGS MONTO
FROM LIBDEBITO.DRCONBEP D
WHERE LCODTR = '567102'
  AND LESTTR = 'A'
  AND LCRETR = '00'
  AND LFECTR = '20250422'
  --AND D.LERRNB = '571204985777'--'511276564945'
  AND SUBSTR(LIDTRA, 1, 1) IN ('P', 'A', 'W');
-------
---cereo de deuda total - coopec - tarea #92841
SELECT * FROM GXBDBPS.TMCTAAF WHERE MCNUMCT IN( 307030006539,307030000912);

UPDATE GXBDBPS.TMCTAAF
SET MCSALFI=0,    MCSAFAC=0,    MCNUMFI=0,    MCNUMMO=0,    MCNUMPU=0,    MCNUMCO =0,    MCNUMCA=0,    MCSALUC=0,
    MCSFNVE=0
WHERE MCNUMCT IN (307030006539, 307030000912);

--reclaculo disponible
update GXBDBPS.tmctaaf set mcdisco = mclimco - (mcsafac + mcsfnve + mcsalfi + mcapcoc + mcapcoa + mccuopc + mccuopa)
WHERE MCNUMCT IN(307030006539,307030000912);;

update GXBDBPS.tmctaaf set mcdiscu = mclimcu - (mccuope + mcadepe + mcapcuc + mcapcua + mcrefpe)
where MCNUMCT IN(307030006539,307030000912);

UPDATE GXBDBPS.TMCTAAF     SET MCADEPE=0     WHERE MCNUMCT=307030000912;
--------------------------------------------------------------------
-- DEBPINES
SELECT SUBSTR(TRIM(t.GITBIN),1,6)||-- bin,
LPAD(TRIM(CAST(t.GITNCU AS VARCHAR(10))),10,'0')||-- cuenta,
t.GITDVE||-- dig_verif,
LPAD(CAST(t.GITACU AS VARCHAR(2)),2,'0')||-- adherente,
LPAD(CAST(t.GITNEM AS VARCHAR(2)),2,'0')||-- emision,
SUBSTR(t.GITFEX,1,4)||'/'||RIGHT(t.GITFEX,2)||-- venci,
SUBSTR(t.GITFAL,7,2)||'/'||SUBSTR(t.GITFAL,5,2)||'/'||SUBSTR(t.GITFAL,3,2)||' 00:00:00'||-- fec_alta,
RPAD(TRIM(t.GITPLA),26,' ')||-- nom_pla,
TRIM(t.GITOPI)-- pin
FROM GXBDBPS.TTGITD t
WHERE t.GITFEC = '${fecomer}'
  AND t.GITFEM = '${fecomer}'
  AND t.GITENT = '${ARCEMIS}'
ORDER BY t.GITNTA ASC;

-------------
--zona que esta mal cargada
select ZONACODI,c.*
from gxbdbps.comaeaf c
WHERE LENGTH(TRIM(c.ZONACODI)) = 1
AND c.COSTAT < 90;

select t.ZONCODIGO ,c.ZONACODI ,C.COCOMER
from gxbdbps.comaeaf c
LEFT JOIN GXFINDTA.TCOCNA R ON c.COCOMER = r.COCOMER
LEFT JOIN GXFINDTA.TCMSUC t  ON t.CLICLICOD = r.CLICLICOD
AND t.SUCSUCCOD = r.SUCSUCCOD
WHERE /*LENGTH(TRIM(c.ZONACODI)) = 1
AND */c.COSTAT < 90;
