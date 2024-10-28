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
-----------------------------------------
Select *
--pgidtrn,pgfecom, pgtipo, pgnocta, pgimpor, pgcomer,pgfecre, PGIDUSR,op.PGFEPRO, op.PGHOPRO
from gxopera.opago1p op where op.PGIDUSR='U99KATERIN';
--AND pgcomer = '4500001' and pgidtrn = '240325569872';
---------------------------------------------
Update gxopera.opago1p set pgnocta = 8191198, pgticta = 0
                       WHERE PGIDTRN=240425585010 AND pgcomer = '4500001';
------------------------------------------------------
--Mov 021/176
WITH MOV AS
(SELECT
	T1 . MVSECUE MOVNREF ,  --30-NRO REF,
	T1 . MVEMISO MOVENT ,  --1-ENTIDAD,
	T1 . MVFEPRO MOVFECC ,  --20- FEC COMERCIAL,
	T1 . MVAFINI MOVAFI ,  --2-AFINIDAD,
	T1 . MVNUMCT MOVCTA ,  --3-CUENTA,
	T2 . MCNUMDO MOVDOC ,  -- 4-CEDULA DE IDENTIDAD
	T1 . MTNUMTA MOVNUMTA ,  --5-NRO DE TARJETA,
	T1 . MVTIPTA MOVTIPTA ,  --6-TIPO DE TC,
	T1 . MVCODSC MOVSUC ,  --7-SUC DE LA TC,
--	COALESCE ( T3 . CESEXO , 'M' ) MOVSEX,  -- 8- SEX DEL CLIENTE
( CASE
WHEN T3 . CESEXO = '' OR T3 . CESEXO IS NULL THEN
'M'
ELSE
T3 . CESEXO
END ) MOVSEX ,
	T1 . CMCODIG MOVCODM ,  --9-COD MOV
	T4 . CMDESCR MOVDESM ,  --10-DESCRIP MOV,
	T4 . CMTIPOM MOVTIPOM ,  --11- TIPO MOV,
	T4 . CMSAFAC MOVASALF ,  --12-AFECTA A SALDO A F,
	T4 . CMSFNVE MOVASFNV ,  --13-AFECTA SALDO FNV,
	T4 . CMSALFI MOVSALFI ,  --14-AFECTA SALDO FI,
	T4 . CMCUOPE MOVACUP ,  --15-AFECTA CUOTAS PEND,
	T4 . CMADEPE MOVACUAP ,  --16-AFECTA CUOTA ADELANTO PEND,
	T4 . CMREFPE MOVACURP ,  --17- AFECTA CUOTA DE REF PEND,
	T4 . CMAPAGO MOVACUMP ,  --18-AFECTA ACUM PAGOS,
	T1 . MVFEREA MOVFECR ,  --19-FEC REAL,
	( CASE DAYOFWEEK ( DATE ( SUBSTRING ( CHAR ( T1 . MVFEREA ) , 1 , 4 ) || '-' || SUBSTRING ( CHAR ( T1 . MVFEREA ) , 5 , 2 ) || '-' || SUBSTRING ( CHAR ( T1 . MVFEREA ) , 7 , 2 ) ) )
			WHEN 1 THEN 'Domingo'
			WHEN 2 THEN 'Lunes'
			WHEN 3 THEN 'Martes'
			WHEN 4 THEN 'Miercoles'
			WHEN 5 THEN 'Jueves'
			WHEN 6 THEN 'Viernes'
			WHEN 7 THEN 'Sabado'
		END ) MOVDIAS ,  --21Dia de la semana
	T1 . MVIMPO2 MOVIMPO ,  --22-IMPORTE SIN DECIMALES,
	T1 . MVCODCO MOVCODC ,  --23- COD COMERCIO,
	REPLACE ( ( REPLACE ( ( REPLACE ( ( REPLACE ( ( REPLACE ( ( REPLACE ( ( REPLACE ( T1 . MVNOMCO , 'Ñ' , 'N' ) ) , '*' , ' ' ) ) , '?' , ' ' ) ) , ',' , ' ' ) ) , '"' , ' ' ) ) , '''' , ' ' ) ) , ';' , ' ' ) MOVDESC ,  --24-DESCRIP COMERCI
--O
	COALESCE ( T5 . RUDESC , 'TODOS' ) MOVRUB ,  --25-RUBRO,
	COALESCE ( T7 . LODESC , 'TODOS' ) MOVLOCC ,  --26-LOCALIDAD COM,
	COALESCE ( T6 . CORUCN , ' ' ) MOVRUCC ,  --27-RUC COMER,
	COALESCE ( T1 . MVMECAC , ' ' ) MOVMCC ,  --28-MCC,
	'000' MOVCANCU ,  --29-CANT CUOTAS,
	T1 . MVCODAU MOVCODAU ,  --31-COD AUTORIZACION,
	T1 . MVIDUSR MOVUSU ,  --32- USU QUE IMPUTO,
	COALESCE ( T8 . MEPIDPROMO , '0' ) MOVPROMO ,  --33-ID PROMO,
	T1 . MVCUPON MOVCUPON ,  --34-COD CUPON,
	CASE
		WHEN T8 . MEPNROCOMP <> ''
			THEN T8 . MEPNROCOMP
		ELSE
			T1 . MVSECUE
	END MOVCOMPG ,  --35-COMPROBANTE PAGO APIS
	'T' MOVTIP
	FROM ( ( ( ( ( ( ( GXBDBPS . TMOVIAF T1
	INNER JOIN GXBDBPS . TMCTAAF T2 ON T1 . MVNUMCT = T2 . MCNUMCT )
	LEFT JOIN GXBDBPS . GCLIEAF T3 ON T2 . MCTIPOD = T3 . CETIPOD AND T2 . MCNUMDO = T3 . CENUMDO AND T1 . MVEMISO = T3 . ENEMISO )
	INNER JOIN GXBDBPS . TCMOVAF T4 ON T1 . CMCODIG = T4 . CMCODIG )
	LEFT JOIN GXBDBPS . CORUBAF T5 ON SUBSTRING ( T1 . MVCODCO , 1 , 2 ) = T5 . RUCODI )
	LEFT JOIN GXBDBPS . COMAEAF T6 ON T1 . MVCODCO = T6 . COCOMER )
	LEFT JOIN GXBDBPS . COLOCAF T7 ON T6 . LOCODI = T7 . LOCODI )
	LEFT JOIN GXTRJDTA . TMOMEP T8 ON T8 . MEPIDCTA = T1 . MVNUMCT AND T8 . MEPIDMOVCL = T1 . MVCUPON AND T1 . MVCUPON <> 0 AND T8 . MEPFCHPRO = T1 . MVFEPRO )
	WHERE T1 . MVCODRE = 0 AND T1 . MVEMISO IN ('021','176') AND T1 . MVFEPRO >= '20230101'
	AND T1.CMCODIG = '579'--NOT IN ( '123' , '103' , '104' , '124' , '105' , '125' , '106' , '126' , '107' , '127' , '011' ) AND ( T1 . CMCODIG < '900' )
UNION ALL
SELECT
	T1 . CUMVSEC MOVNREF ,  --30-NRO REF,
	T1 . CUEMISO MOVENT ,  --1-ENTIDAD,
	T1 . CUFECOM MOVFECC ,  --20- FEC COMERCIAL,
	T1 . CUAFINI MOVAFI ,  --2-AFINIDAD,
	T1 . CUNUMCT MOVCTA ,  --3-CUENTA,
	T2 . MCNUMDO MOVDOC ,  -- 4-CEDULA DE IDENTIDAD
	T1 . MTNUMTA MOVNUMTA ,  --5-NRO DE TARJETA,
	T3 . MTTIPOT MOVTIPTA ,  --6-TIPO DE TC,
	T1 . CUCODSC MOVSUC ,  --7-SUC DE LA TC,
--	COALESCE ( T4 . CESEXO , 'M' ) MOVSEX ,  -- 8- SEX DEL CLIENTE
( CASE
WHEN T4 . CESEXO = '' OR T4 . CESEXO IS NULL THEN
'M'
ELSE
T4 . CESEXO
END ) MOVSEX ,
	T1 . CMCODIG MOVCODM ,  --9-COD MOV,
	T5 . CMDESCR MOVDESM ,  --10-DESCRIP MOV,
	T5 . CMTIPOM MOVTIPOM ,  --11- TIPO MOV,
	T5 . CMSAFAC MOVASALF ,  --12-AFECTA A SALDO A F,
	T5 . CMSFNVE MOVASFNV ,  --13-AFECTA SALDO FNV,
	T5 . CMSALFI MOVSALFI ,  --14-AFECTA SALDO FI,
	T5 . CMCUOPE MOVACUP ,  --15-AFECTA CUOTAS PEND,
	T5 . CMADEPE MOVACUAP ,  --16-AFECTA CUOTA ADELANTO PEND,
	T5 . CMREFPE MOVACURP ,  --17- AFECTA CUOTA DE REF PEND,
	T5 . CMAPAGO MOVACUMP ,  --18-AFECTA ACUM PAGOS,
	T1 . CUFEREA MOVFECR ,  --19-FEC REAL,
	CASE DAYOFWEEK ( DATE ( SUBSTRING ( CHAR ( T1 . CUFEREA ) , 1 , 4 ) || '-' || SUBSTRING ( CHAR ( T1 . CUFEREA ) , 5 , 2 ) || '-' || SUBSTRING ( CHAR ( T1 . CUFEREA ) , 7 , 2 ) ) )
		WHEN 1 THEN 'Domingo'
		WHEN 2 THEN 'Lunes'
		WHEN 3 THEN 'Martes'
		WHEN 4 THEN 'Miercoles'
		WHEN 5 THEN 'Jueves'
		WHEN 6 THEN 'Viernes'
		WHEN 7 THEN 'Sabado'
	END MOVDIAS ,  --21Dia de la semana
	T1 . CUIMPOR MOVIMPO ,  --22-IMPORTE SIN DECIMALES,
	T1 . CUCODCO MOVCODC ,  --23- COD COMERCIO,
	REPLACE ( ( REPLACE ( ( REPLACE ( ( REPLACE ( ( REPLACE ( ( REPLACE ( ( REPLACE ( T1 . CUNOMCO , 'Ã?' , 'N' ) ) , '*' , ' ' ) ) , '?' , ' ' ) ) , ',' , ' ' ) ) , '"' , ' ' ) ) , '''' , ' ' ) ) , ';' , ' ' ) MOVDESC ,  --24-DESCRIP COMERC --IO
	COALESCE ( T6 . RUDESC , 'TODOS' ) MOVRUB ,  --25-RUBRO,
	COALESCE ( T8 . LODESC , 'TODOS' ) MOVLOCC ,  --26-LOCALIDAD COM,
	COALESCE ( T7 . CORUCN , ' ' ) MOVRUCC ,  --27-RUC COMER,
	COALESCE ( T6 . RUMCC , ' ' ) MOVMCC ,  --28-MCC,
	T1 . CUCANCU MOVCANCU ,  --29-CANT CUOTAS,
	T1 . CUCODAU MOVCODAU ,  --31-COD AUTORIZACION,
	T1 . CUIDUSR MOVUSU ,  --32- USU QUE IMPUTO,
	COALESCE ( T9 . CUPIDPRO , '0' ) MOVPROMO ,  --34-ID-PROMO
	COALESCE ( T9 . CUPCODI , '0' ) MOVCUPON ,  --NRO CUPON
	T1 . CUMVSEC MOVCOMPG ,  --35-COMPROBANTE PIN APIS
	'C' MOVTIP
	FROM GXBDBPS . TCUOTAF T1
	INNER JOIN GXBDBPS . TMCTAAF T2 ON T1 . CUNUMCT = T2 . MCNUMCT
	INNER JOIN GXBDBPS . TMTARAF T3 ON T1 . MTNUMTA = T3 . MTNUMTA
	LEFT JOIN GXBDBPS . GCLIEAF T4 ON T2 . MCTIPOD = T4 . CETIPOD AND T2 . MCNUMDO = T4 . CENUMDO AND T1 . CUEMISO = T4 . ENEMISO
	INNER JOIN GXBDBPS . TCMOVAF T5 ON T1 . CMCODIG = T5 . CMCODIG
	LEFT JOIN GXBDBPS . CORUBAF T6 ON SUBSTRING ( T1 . CUCODCO , 1 , 2 ) = T6 . RUCODI
	LEFT JOIN GXBDBPS . COMAEAF T7 ON T1 . CUCODCO = T7 . COCOMER
	LEFT JOIN GXBDBPS . COLOCAF T8 ON T7 . LOCODI = T8 . LOCODI
	LEFT JOIN GXFINDTA . TCLCUP T9 ON T9 . CUPNTAR = T1 . MTNUMTA AND T9 . CUPRRNMI = T1 . CUMVSEC AND T9 . CUPCOAU = T1 . CUCODAU AND T9 . CUPCOCO = T1 . CUCODCO	WHERE T1 . CUSTATS <> 'R'
	AND T1 . CUEMISO IN ('021','176') AND T1 . CUFECOM >= '20230101'	 AND
	T1 . CMCODIG = '579' --NOT IN ( '123' , '103' , '104' , '124' , '105' , '125' , '106' , '126' , '107' , '127' , '011' , '159' ) AND T1 . CMCODIG < '900'
UNION ALL
	SELECT
	T1 . HMSECUE MOVNREF ,  --30-NRO REF,
	T1 . HMEMISO MOVENT ,  --1-ENTIDAD,
	T1 . HMFEPRO MOVFECC ,  --20- FEC COMERCIAL,
	T1 . HMAFINI MOVAFI ,  --2-AFINIDAD,
	T1 . HMNUMCT MOVCTA ,  --3-CUENTA,
	T2 . MCNUMDO MOVDOC ,  -- 4-CEDULA DE IDENTIDAD
	T1 . HMNUMTA MOVNUMTA ,  --5-NRO DE TARJETA,
	T1 . HMTIPTA MOVTIPTA ,  --6-TIPO DE TC,
	T1 . HMCODSC MOVSUC ,  --7-SUC DE LA TC,
--	COALESCE ( T3 . CESEXO , 'M' ) MOVSEX ,  -- 8- SEX DEL CLIENTE
( CASE
WHEN T3 . CESEXO = '' OR T3 . CESEXO IS NULL THEN
'M'
ELSE
T3 . CESEXO
END ) MOVSEX ,
	T1 . HMCODIG MOVCODM ,  --9-COD MOV
	T4 . CMDESCR MOVDESM ,  --10-DESCRIP MOV,
	T4 . CMTIPOM MOVTIPOM ,  --11- TIPO MOV,
	T4 . CMSAFAC MOVASALF ,  --12-AFECTA A SALDO A F,
	T4 . CMSFNVE MOVASFNV ,  --13-AFECTA SALDO FNV,
	T4 . CMSALFI MOVSALFI ,  --14-AFECTA SALDO FI,
	T4 . CMCUOPE MOVACUP ,  --15-AFECTA CUOTAS PEND,
	T4 . CMADEPE MOVACUAP ,  --16-AFECTA CUOTA ADELANTO PEND,
	T4 . CMREFPE MOVACURP ,  --17- AFECTA CUOTA DE REF PEND,
	T4 . CMAPAGO MOVACUMP ,  --18-AFECTA ACUM PAGOS,
	T1 . HMFEREA MOVFECR ,  --19-FEC REAL,
	( CASE DAYOFWEEK ( DATE ( SUBSTRING ( CHAR ( T1 . HMFEREA ) , 1 , 4 ) || '-' || SUBSTRING ( CHAR ( T1 . HMFEREA ) , 5 , 2 ) || '-' || SUBSTRING ( CHAR ( T1 . HMFEREA ) , 7 , 2 ) ) )
			WHEN 1 THEN 'Domingo'
			WHEN 2 THEN 'Lunes'
			WHEN 3 THEN 'Martes'
			WHEN 4 THEN 'Miercoles'
			WHEN 5 THEN 'Jueves'
			WHEN 6 THEN 'Viernes'
			WHEN 7 THEN 'Sabado'
		END ) MOVDIAS ,  --21Dia de la semana
	T1 . HMIMPO2 MOVIMPO ,  --22-IMPORTE SIN DECIMALES,
	T1 . HMCODCO MOVCODC ,  --23- COD COMERCIO,
	REPLACE ( ( REPLACE ( ( REPLACE ( ( REPLACE ( ( REPLACE ( ( REPLACE ( ( REPLACE ( T1 . HMNOMCO , 'Ã?' , 'N' ) ) , '*' , ' ' ) ) , '?' , ' ' ) ) , ',' , ' ' ) ) , '"' , ' ' ) ) , '''' , ' ' ) ) , ';' , ' ' ) MOVDESC ,  --24-DESCRIP COMERC
	COALESCE ( T5 . RUDESC , 'TODOS' ) MOVRUB ,  --25-RUBRO,
	COALESCE ( T7 . LODESC , 'TODOS' ) MOVLOCC ,  --26-LOCALIDAD COM,
	COALESCE ( T6 . CORUCN , ' ' ) MOVRUCC ,  --27-RUC COMER,
	COALESCE ( T1 . HMMECAC , ' ' ) MOVMCC ,  --28-MCC,
	'000' MOVCANCU ,  --29-CANT CUOTAS,
	T1 . HMCODAU MOVCODAU ,  --31-COD AUTORIZACION,
	T1 . HMIDUSR MOVUSU ,  --32- USU QUE IMPUTO,
	COALESCE ( T8 . MEPIDPROMO , '0' ) MOVPROMO ,  --33-ID PROMO,
	T1 . HMCUPON MOVCUPON ,  --34-COD CUPON,
	CASE
		WHEN T8 . MEPNROCOMP <> ''
			THEN T8 . MEPNROCOMP
		ELSE
			T1 . HMSECUE
	END MOVCOMPG ,  --35-COMPROBANTE PAGO APIS
	'H' MOVTIP --, t1.hmidusr usuario
	FROM GXBDBPS . THMOVAF T1
	INNER JOIN GXBDBPS . TMCTAAF T2 ON T1 . HMNUMCT = T2 . MCNUMCT
	LEFT JOIN GXBDBPS . GCLIEAF T3 ON T2 . MCTIPOD = T3 . CETIPOD AND T2 . MCNUMDO = T3 . CENUMDO AND T1 . HMEMISO = T3 . ENEMISO
	INNER JOIN GXBDBPS . TCMOVAF T4 ON T1 . HMCODIG = T4 . CMCODIG
	LEFT JOIN GXBDBPS . CORUBAF T5 ON SUBSTRING ( T1 . HMCODCO , 1 , 2 ) = T5 . RUCODI
	LEFT JOIN GXBDBPS . COMAEAF T6 ON T1 . HMCODCO = T6 . COCOMER
	LEFT JOIN GXBDBPS . COLOCAF T7 ON T6 . LOCODI = T7 . LOCODI
	LEFT JOIN GXTRJDTA . TMOMEP T8 ON T8 . MEPIDCTA = T1 . HMNUMCT AND T8 . MEPIDMOVCL = T1 . HMCUPON AND T1 . HMCUPON <> 0 AND T8 . MEPFCHPRO = T1 . HMFEPRO
	WHERE T1 . HMCODRE = 0 AND T1 . HMEMISO IN ('021','176') AND T1 . HMFEPRO >= '20230101'
	AND T1 . HMCODIG = '579') --NOT IN ( '123' , '103' , '104' , '124' , '105' , '125' , '106' , '126' , '107' , '127' , '011' ) AND T1 . HMCODIG < '900' ) )
SELECT MOVNREF REFERENCIA, MOVENT ENTIDAD, MOVFECC FECHACOMERCIAL, MOVAFI AFINIDAD, MOVCTA CUENTA, MOVDOC CEDULAIDENTIDAD, LEFT(MOVNUMTA,6)||'XXXXXX'||right(MOVNUMTA,4) TARJETA,
MOVTIPTA TIPOTC, MOVSUC SUCURSALTC, MOVSEX SEXO, MOVCODM CODMOV, MOVDESM DESCRIPMOV, MOVTIPOM TIPOMOV, MOVASALF AFECTASALDOAF, MOVASFNV AFECTSALDOFNV,
MOVSALFI AFECTSALDOFI, MOVACUP AFECTCUOTPEND, MOVACUAP AFECTCUOTAADELPEND, MOVACURP AFECTCUOTAREFPEND, MOVACUMP AFECTACUMPAG, MOVFECR FECHREAL, MOVDIAS DIASEMANA,
MOVIMPO IMPORTE, MOVCODC CODCOMERCIO, MOVDESC DESCCOMER, MOVRUB RUBRO, MOVLOCC LOCALIDAD, MOVRUCC RUCCOMER, MOVMCC MCC, MOVCANCU CANTCUOTAS,
MOVCODAU CODAUTORIZACION, MOVUSU USUARIOIMPUTO, MOVPROMO IDPROMO, MOVCUPON CODCUPON, MOVCOMPG COMPROBANTPAGOAPI, MOVTIP
FROM MOV;
---------------