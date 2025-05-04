SELECT * FROM GXBDBPS.COMAEAF WHERE COCOMER='4300009' --CODENO LIKE '%LAMBARE%';
SELECT * FROM GXBDBPS.COMAEAF WHERE CORUCN='80000564-3' AND COSTAT='0';
SELECT * FROM GXWEB.GXLOUSU WHERE USUCORUC='80000564-3';--USUCOD IN ('1806','2009','3430');
SELECT * FROM GXWEB.GXLOUSUDET WHERE USUCOD='2009';
--DELETE FROM GXWEB.GXLOUSUDET WHERE USUCOD='1843';
--INSERT INTO GXWEB.GXLOUSUDET (USUCOD,COCOMER,CORUCN) VALUES (2009,'5800005','80021764-0');
SELECT * FROM GXOPERA.OPMOVI WHERE OPCOMER IN ('0801381') AND OPFECOM BETWEEN '20210424' AND '20210429';
SELECT * FROM GXOPERA.FLICOM WHERE LICOMER='0801381' AND LIFECHD BETWEEN '20210424' AND '20210429';
SELECT * FROM GXOPERA.FLICOM1 WHERE LICOMER='0801381' AND LIFECHD BETWEEN '20210424' AND '20210429';
SELECT * FROM GXOPERA.OPRECLE WHERE RECOMER='0801381' AND REFECH BETWEEN '20210424' AND '20210429';

SELECT * FROM GXWEB.OPMOVI WHERE OPCOMER='0801381' AND OPFECOM BETWEEN '20210424' AND '20210429';
SELECT * FROM GXWEB.FLICOM WHERE LICOMER='0801381' AND LIFECHD BETWEEN '20210424' AND '20210429';
SELECT * FROM GXWEB.FLICOM1 WHERE LICOMER='0801381' AND LIFECHD BETWEEN '20210424' AND '20210429';
SELECT * FROM GXWEB.OPRECLE WHERE RECOMER='0801381' AND REFECH BETWEEN '20210424' AND '20210429';

SELECT * FROM GXWEB.OPMOVI WHERE OPNOREF IN ('111455506987','111956910957','111956880525','111856385481');

INSERT INTO GXWEB.GXLOUSUDET (USUCOD,COCOMER,CORUCN) VALUES (2009,'0701125',NULL);

SELECT * FROM GXWEB.DEPCICO WHERE DEPCOM='0703307' AND DEPNROBOL='151';

SELECT * FROM LIBDEBITO.BST015 WHERE BS15CODCOM LIKE '%1000600%';
SELECT * FROM LIBDEBITO.BST021 WHERE BS21CODCOM like '%1000600%';

SELECT * FROM GXWEB.BST021W WHERE BS21CODCOM like '%1000600%';
UPDATE GXWEB.BST021W SET BS21MONSAL = 37738433.45 WHERE BS21CODPRO = 'CICOMONEY ' AND BS21CODCOM = '     1000600' AND BS21FECPRO = 20211007;
/*Usuarios CICO*/
Select usucodcat ID, usuaidcat CI, usucocomer COMERCIO, usunomcat NOMBRE, usuestcat CATEGORIA, usutelcat TELEFONO,tusrid TipoUsuario, usupasscat Pass,
usuadmcat CODCAJERO , usucoruccat  RUC, usucambpascat NecesitaCambiarPass
from gxweb.usucat;

Select * from GXWEB.drcon180 where Alerrnb='125287925839'
UPDATE GXWEB.drcon180   SET ALFCOTR = 20211006,       ALESTTR = 'A' WHERE ALERRNB = '125287925839';
-------
--usuario sin comercio portal
SELECT a.USUCOD USU_COD, a.USUAID USUARIO, USUNOM NOMBRE, a.TUSRID TIPO,a.USUADM ADMIN,a.USUCORUC RUC, USUUAL USUARIO_ALTA, USUFAL FECHA_ALTA
from gxweb.gxlousu a
where a.TUSRID in ('1','9')
and a.usucod not in (select usucod from gxweb.gxlousudet)
ORDER BY USUFAL DESC;
--------------------------------
SELECT --*
LFCOTR FECHA_CIAL, LFECTR FECHA_REAL, LHORTR HORA, LIDCOM COD_COM, LCOMTR COMERCIO, SUBSTR(LNRTAR,1,6) || '******' ||SUBSTR(LNRTAR,13,4) TARJETA, LCODBC MARCA, LIMPGS IMPORTE, LCUOTA CUOTA, LCRETR RETORNO,
LESTTR ESTADO, LCAUTR AUTORIZACION, LERRNB REFERENCIA, LIDTRA ID_TRX, LCODTR COD_TRX, TXDTRX TIPO_TRX, LECA62 DISPOSITIVO, LACTFJ ACT_FIJO, LCORED RED, LCOTEL LINEA_ORIGEN, LNTOKE LINEA_DESTINO, LCTADE ID_TIGO, LENEMI EMISOR, COMADRE
FROM LIBDEBITO.DRCONBEP
INNER JOIN LIBDEBITO.TBCTRA0P ON (TXCTRX=LCODTR)
INNER JOIN GXBDBPS.COMAEAF ON CAST (COCOMER AS INTEGER) = LIDCOM
WHERE COMADRE='1000600' AND LFECTR='20211008' AND LCODTR IN ('370000','380000','390000')
ORDER BY LFECTR DESC, LHORTR DESC;

select * from gxweb.usucat where USUAIDCAT='4831042';
select * from gxweb.gxlousu where usucod='3383';
select * from gxweb.usucat where USUADMCAT='3383';

select * from libdebito.drconbep where lfectr='20211020' and lcodtr='370000' and  limpgs='150000' and lhortr between '110000' and '111000';

SELECT SUBSTR(COCOMER, 1, 2),COUNT(*) FROM GXWEB.COMAEAF WHERE TRIM(CORUCN) = '80016096-7' AND COSTAT = ' 0' --CODENO LIKE '%RETAIL%';
GROUP BY SUBSTR(COCOMER, 1, 2);
SELECT * FROM GXBDBPS.COMAEAF C2 WHERE COCOMER='4300009';
SELECT * FROM GXWEB.COMAEAF C2 WHERE COCOMER='4300009';
SELECT * FROM GXBDBPS.CORUBAF;

SELECT * FROM GXWEB.COMAEAF C2 WHERE TRIM(CORUCN) = '80022877-4';
SELECT * FROM GXWEB.GXLOUSU WHERE TRIM(USUCORUC) = '80000564-3';
SELECT * FROM GXWEB.GXLOUSU WHERE USUCOD='';
--SELECT * FROM GXWEB.GXLOUSUDET WHERE USUCOD = 1433;
SELECT * FROM GXWEB.GXLOUSUDET WHERE COCOMER='1002363';

SELECT * FROM GXWEB.GXLOUSU G where USUAID LIKE '%49924411%';
SELECT * FROM GXWEB.GXLOPER G WHERE USUCOD='9206';

/*SELECT --FACLIEN,COUNT(*),
* FROM GXOPERA.FACTURA WHERE  FACLIEN IN (SELECT COCOMER FROM GXWEB.COMAEAF WHERE TRIM(CORUCN) = '80016096-7' AND COSTAT = ' 0')
AND facfech BETWEEN '20230101' AND '20230203' AND FACSTATUS = 'C'
GROUP BY FACLIEN*/
SELECT F.* FROM GXWEB.FLICOM1 F1
INNER JOIN GXWEB.FLICOM F ON F1.LICOMER = F.LICOMER AND F1.LIfechH = F.LIfechH AND F1.LIfecHD = F.LIfecHD
AND F1.LICODTR = F.LICODTR
WHERE F1.LICOMER IN (SELECT COCOMER FROM GXWEB.COMAEAF WHERE TRIM(CORUCN) = '80016096-7' AND COSTAT = ' 0')
AND F1.LIFECREDI BETWEEN '20230101' AND '20230203'
AND F.litidocu = 'LIQ' or F.litidocu = 'INS'
AND F1.litiptar = 'CRE' or F1.litiptar = 'DEB' or F1.litiptar = 'EFE'
GROUP BY F.*;

SELECT F.LICOMER,F.LINRO AS FACT_INI, F.LINROFIN AS FACT_FIN FROM GXWEB.FLICOM F
INNER JOIN GXWEB.FLICOM1 F1 ON F1.LICOMER = F.LICOMER AND F1.LIfechH = F.LIfechH AND F1.LIfecHD = F.LIfecHD
AND F1.LICODTR = F.LICODTR
WHERE F1.LICOMER IN (SELECT COCOMER FROM GXWEB.COMAEAF WHERE TRIM(CORUCN) = '80016096-7' AND COSTAT = ' 0')
AND F1.LIFECREDI BETWEEN '20230101' AND '20230203'
AND F.litidocu = 'LIQ' or F.litidocu = 'INS'
AND F1.litiptar = 'CRE' or F1.litiptar = 'DEB' or F1.litiptar = 'EFE'
AND F1.linrofac > 100000000
GROUP BY F.LICOMER,F.LINRO, F.LINROFIN;
----
SELECT LOGUSU,USUNOM,USUMAI,LOGOBJ,USUCORUC,count(*) AS Cantidad
from(
select * FROM GXWEB.LOGCONT l
LEFT JOIN gxweb.gxlousu u ON u.USUAID =l.LogUsu
WHERE year(LOGFCH)=2023 AND month(LOGFCH)=8 AND LOGTIP='LOGGEO' AND LOGOBJ='Comercio') t1
GROUP BY LOGUSU,USUNOM,USUMAI,LOGOBJ,USUCORUC
ORDER BY 3 desc;
------------------------------#SOSKO
SELECT * FROM public.EMPRESAS_CLIENTES EC;
SELECT * FROM public.EMPRESAS_CLIENTES_BEPSA ECB WHERE ECB.DESCRIPCION_BEPSA LIKE '%INVERFIN%';

-------------------------estructura Drcon180
SELECT LCTAOR AS ALCTAOR,LCTADE AS ALCTADE,LNRTAR AS ALNRTAR,
LEXTAR AS ALEXTAR,LEXPIR AS ALEXPIR,LIDCOM AS ALIDCOM,
LHISOR AS ALHISOR,LHISDE AS ALHISDE,LBCOCR AS ALBCOCR,
LCTACR AS ALCTACR,LBCODB AS ALBCODB,LCTADB AS ALCTADB,
LCLEAR AS ALCLEAR,LFCOTR AS ALFCOTR,LFECTR AS ALFECTR,
LHORTR AS ALHORTR,LFECLQ AS ALFECLQ,LFECEN AS ALFECEN,
LMONTR AS ALMONTR,LIMPGS AS ALIMPGS,LIMPDS AS ALIMPDS,
LIMPDF AS ALIMPDF,LSALTR AS ALSALTR,LDISTR AS ALDISTR,
LMARCA AS ALMARCA,LCUOTA AS ALCUOTA,LIDTRA AS ALIDTRA,
LSTANT AS ALSTANT,LTIPTR AS ALTIPTR,LPOSEM AS ALPOSEM,
LBINPR AS ALBINPR,LMCCTR AS ALMCCTR,LCOMTR AS ALCOMTR,
LORITR AS ALORITR,LCODTR AS ALCODTR,LCODBC AS ALCODBC,
LCAUTR AS ALCAUTR,LCRETR AS ALCRETR,LESTTR AS ALESTTR,
LERRNB AS ALERRNB,LEIMP4 AS ALEIMP4,LECA62 AS ALECA62,
LCPACE AS ALCPACE,LENEMI AS ALENEMI,LCORED AS ALCORED,
LCOTEL AS ALCOTEL,LACTFJ AS ALACTFJ,LNFACT AS ALNFACT,
LNFISC AS ALNFISC,ENEADM AS AENEADM,ENEPRO AS AENEPRO,
LCODPR AS ALCODPR,LCOPRO AS ALCOPRO,LCOCOM AS ALCOCOM,
LCOIVA AS ALCOIVA,LCOADQ AS ALCOADQ,LNTOKE AS ALNTOKE
    FROM LIBDEBITO.DRCONBEP D
    WHERE D.LERRNB='330746265568';
------------------------------------------------
--Ver cico
SELECT * FROM GXWEB.DEPCICO D WHERE D.DEPID='7024';
-------
--permisos
select r2.*
from public.roles_x_usuarios r
inner join public.roles r2 on r.rol_id = r2.id
where r.usuario_id = '2adbe61b-cc5c-4fba-9f47-658325e39cd1'
and r.activo is true;

select * from public.permisos_x_roles;

--SELECT * FROM USUARIOS U WHERE correo LIKE 'fanazco@%';
SELECT * FROM PERMISOS P; --id IN (74, 75);
SELECT * FROM public.PERMISOS_X_ROLES PXR WHERE PXR.PERMISO_ID IN (74, 75);
--rol_id IN (39, 122, 125, 1, 123, 77, 113, 6, 106)
SELECT * FROM public.ROLES_X_USUARIOS RXU WHERE RXU.ROL_ID IN (39, 122, 125, 1, 123, 77, 113, 6, 106);
SELECT * FROM ROLES R WHERE R.ID IN (39, 122, 125, 1, 123, 77, 113, 6, 106) AND R.CODIGO_SERVICIO='PC_CLI';

SELECT PF.* FROM public.USUARIOS U
    INNER JOIN PUBLIC.PERSONAS_FISICAS PF ON PF.ID = U.PERSONA_FISICA_ID
    WHERE U.id IN ('7a0d60bc-f813-4ac4-9649-876286e501b1', '6a702510-e0cc-4738-8d6d-a60bde263ba5', 'b9bca512-5ef9-4ff7-a164-aaaa8d56c9b9', '7d96fc24-a0bb-4dc5-a293-53a40474a299', '0212dc4c-118c-411e-b55b-6301af8f5fe4', '5633f877-c20a-4b3a-b3fc-af2edcacad96');

SELECT * FROM public.USUARIOS U WHERE U.CODIGO_SERVICIO='PC_CLI';

/*si esa columna tiene el valor PC_CLI es porque es roles de los comercios
si tiene el valor PC_BKF es porq es de bepsa
y si tiene el valor PC_CLI fijate en la columna de al lado llamada empresa_cliente_id que seria el id de la empresa a la que pertenece el rol
y si queres el nombre de la empresa busca en empresas_clientes*/
SELECT PF.PERSONA_ID, PF.NOMBRE, PF.APELLIDO, PF.NRO_DOCUMENTO, ECB.COD_CLIENTE_BEPSA, ECB.DESCRIPCION_BEPSA,
EC.CORREO_COMERCIO, PF.ACTIVO
FROM PUBLIC.ROLES_X_USUARIOS RXU
         INNER JOIN PUBLIC.USUARIOS U ON U.ID = RXU.USUARIO_ID
         INNER JOIN PUBLIC.PERSONAS_FISICAS PF ON PF.ID = U.PERSONA_FISICA_ID
         INNER JOIN PUBLIC.ROLES R ON R.ID = RXU.ROL_ID
         INNER JOIN PUBLIC.EMPRESAS_CLIENTES EC ON EC.ID = R.EMPRESA_CLIENTE_ID
         INNER JOIN PUBLIC.EMPRESAS_CLIENTES_BEPSA ECB ON ECB.ID = EC.EMPRESA_CLIENTE_BEPSA_ID
WHERE RXU.ROL_ID IN (39, 122, 125, 1, 123, 77, 113, 6, 106)
  AND R.CODIGO_SERVICIO = 'PC_CLI';
--------
-----REPORTE DE ROLES
SELECT RXU.USUARIO_ID, R.NOMBRE, P.NOMBRE_NORMALIZADO,
       ECB.COD_CLIENTE_BEPSA, S.NOMBRE  SUCURSAL, C.NOMBRE  COMERCIO, GE.NOMBRE G_EMPRESARIAL
FROM PUBLIC.ROLES R
         LEFT JOIN PUBLIC.ROLES_X_USUARIOS RXU ON R.ID = RXU.ROL_ID
         LEFT JOIN PUBLIC.USUARIOS_X_COMERCIOS UXC ON RXU.USUARIO_ID = UXC.USUARIO_ID
         LEFT JOIN PUBLIC.USUARIOS_X_EMPRESAS UXE ON RXU.USUARIO_ID = UXE.USUARIO_ID
         LEFT JOIN PUBLIC.USUARIOS_X_SUCURSALES UXS ON RXU.USUARIO_ID = UXS.USUARIO_ID
         LEFT JOIN PUBLIC.USUARIOS_X_GRUPOS_EMPRESARIALES UXGE ON RXU.USUARIO_ID = UXGE.USUARIO_ID
         LEFT JOIN PUBLIC.EMPRESAS_CLIENTES EC ON EC.ID = R.EMPRESA_CLIENTE_ID
         LEFT JOIN PUBLIC.SUCURSALES S ON S.ID = UXS.SUCURSAL_ID
         LEFT JOIN PUBLIC.COMERCIOS C ON (C.ID = S.COMERCIO_ID OR C.ID = UXC.COMERCIO_ID)
         LEFT JOIN PUBLIC.GRUPOS_EMPRESARIALES GE ON UXGE.GRUPO_EMPRESARIAL_ID = GE.ID
         LEFT JOIN PUBLIC.PERSONAS P ON EC.PERSONA_ID = P.ID
         LEFT JOIN PUBLIC.EMPRESAS_CLIENTES_BEPSA ECB ON EC.EMPRESA_CLIENTE_BEPSA_ID = ECB.ID
WHERE R.NOMBRE ILIKE '%admin%';
---------------------------------------------------
SELECT * FROM public.EMPRESAS_CLIENTES EC WHERE id IN (4, 19, 187);
SELECT * FROM public.EMPRESAS_CLIENTES_BEPSA ECB WHERE ECB.COD_CLIENTE_BEPSA IN ('12730','12733');

SELECT * FROM public.ROLES R;
SELECT * FROM public.ROLES_X_USUARIOS RXU WHERE RXU.USUARIO_ID='998cc56c-994a-4941-bfd4-7368db5e4f92';

--permiso fabi
--INSERT INTO public.roles_x_usuarios (id, rol_id, usuario_id, insertado_el, modificado_el, activo, insertado_por, modificado_por) VALUES (4910, 125, '03c8162a-6b45-4339-9484-4d2e8dacd24d', '2024-03-18 17:00:28.110074', '2024-03-18 17:00:28.110074', true, '6bb47ab6-0ea7-48e8-b5b2-76438104f674', null);

INSERT INTO
    public.roles_x_usuarios (rol_id, usuario_id, insertado_el, modificado_el, activo, insertado_por, modificado_por) VALUES ( 1, 'bdaf16f0-d93c-4414-978a-ae1e8fd3b981', '2023-07-22 14:47:44.997312', '2023-07-22 14:47:44.997312', true, null, null);
--AUTH_DB
SELECT * FROM EQWEDI_AUTH_DB.PUBLIC.USUARIOS U WHERE U.NRO_DOCUMENTO='4085675';
--U.CORREO LIKE 'cecilia.caballero@bepsa.com.py';

Correo anterior: dreamstravelpy@gmail.com
Correo a ser modificado: dreamstravelpy.ventas@gmail.com
dreamstravelpy@gmail.com

SELECT t.* FROM EQWEDI_AUTH_DB.public.refresh_tokens t WHERE t.USUARIO_ID='8b3e942c-abc7-45a9-9f53-c240e4020352';
SELECT * FROM EQWEDI_AUTH_DB.public.GRUPOS_ACCESOS_APIS_X_USUARIOS GAAXU WHERE GAAXU.USUARIO_ID='feafa23e-c9ef-43cd-bb91-fd5328344806';
--POCODI_DB
SELECT * FROM public.PERSONAS_FISICAS PF where upper(apellido) = 'BENITEZ'; --PF.NRO_DOCUMENTO='3319151'
SELECT * FROM public.USUARIOS U WHERE U.PERSONA_FISICA_ID IN (962);

SELECT * FROM public.SOCKET_CLIENTS SC WHERE SC.USUARIO_ID='8b3e942c-abc7-45a9-9f53-c240e4020352';
SELECT * FROM POCODI_DB.public.correos_principales_usuarios WHERE USUARIO_ID='c7d15354-506e-40d1-9118-165aee5f94f9';
SELECT * FROM public.ROLES_X_USUARIOS RXU WHERE RXU.USUARIO_ID='8b3e942c-abc7-45a9-9f53-c240e4020352';
SELECT * FROM public.USUARIOS_NIVELES_ACCESO UNA WHERE UNA.USUARIO_ID='8b3e942c-abc7-45a9-9f53-c240e4020352';
SELECT * FROM public.USUARIOS_X_EMPRESAS UXE WHERE UXE.USUARIO_ID='8b3e942c-abc7-45a9-9f53-c240e4020352';
SELECT * FROM public.USUARIOS_X_GRUPOS_EMPRESARIALES UXGE WHERE UXGE.USUARIO_ID='8b3e942c-abc7-45a9-9f53-c240e4020352';

SELECT * FROM POCODI_DB.PUBLIC.USUARIOS U WHERE U.ID='d042062f-590f-4982-866b-24e6e97e8f69';
SELECT * FROM public.USUARIOS U WHERE U.ID='7a0d60bc-f813-4ac4-9649-876286e501b1';

SELECT * FROM public.CORREOS_PRINCIPALES_USUARIOS CPU WHERE CPU.USUARIO_ID='d042062f-590f-4982-866b-24e6e97e8f69';
SELECT * FROM PUBLIC.CORREOS_PERSONAS_FISICAS CPF;
SELECT * FROM PUBLIC.PERSONAS_FISICAS PF ;
SELECT * FROM public.ROLES R WHERE R.NOMBRE ILIKE '%admin%';

-----REPORTES--Y--transacciones
SELECT * FROM busdatos_transacciones T --WHERE busdatos_transacciones.OPERACION_RRNBEPSA='466206130451';
WHERE T.operacion_cod_comercio='11735'
AND T.OPERACION_RRNBEPSA='427384150745';

--query de reporte movimiento PANZA
SELECT BUSDATOS_TRANSACCIONES.OPERACION_ID,
       BUSDATOS_TRANSACCIONES.OPERACION_FECH_INSERCION,
       BUSDATOS_TRANSACCIONES.OPERACION_HOR_INSERCION,
       BUSDATOS_TRANSACCIONES.OPERACION_RRNBEPSA,
       BUSDATOS_TRANSACCIONES.OPERACION_EST_REVERSA,
       BUSDATOS_TRANSACCIONES.OPERACION_FECH_TRANS,
       BUSDATOS_TRANSACCIONES.OPERACION_COD_COMERCIO,
       BUSDATOS_TRANSACCIONES.OPERACION_DENOM_COMERCIAL,
       BUSDATOS_TRANSACCIONES.OPERACION_COD_SUCURSAL,
       BUSDATOS_TRANSACCIONES.OPERACION_DESC_SUCURSAL,
       BUSDATOS_TRANSACCIONES.OPERACION_COD_AUTENTICACION,
       BUSDATOS_TRANSACCIONES.OPERACION_COD_ENTIDAD_ROL,
       CAST(SUBSTRING(BUSDATOS_TRANSACCIONES.OPERACION_NUM_TARJETA FROM 1 FOR 6) || '******' ||
            SUBSTRING(BUSDATOS_TRANSACCIONES.OPERACION_NUM_TARJETA FROM LENGTH(BUSDATOS_TRANSACCIONES.OPERACION_NUM_TARJETA) - 4 FOR 4)
           AS BPCHAR(19))                                                                            AS OPERACION_NUM_TARJETA,
       CAST(SUBSTRING(BUSDATOS_TRANSACCIONES.OPERACION_NUM_TARJETA_ENMASCAR FROM 1 FOR 6) || '******' ||
            SUBSTRING(BUSDATOS_TRANSACCIONES.OPERACION_NUM_TARJETA_ENMASCAR FROM LENGTH(BUSDATOS_TRANSACCIONES.OPERACION_NUM_TARJETA_ENMASCAR) - 4 FOR 4)
           AS BPCHAR(19))                                                                            AS OPERACION_NUM_TARJETA_ENMASCAR,
       BUSDATOS_TRANSACCIONES.OPERACION_TIP_USO_TARJETA,
       BUSDATOS_TRANSACCIONES.OPERACION_CANT_CUOTAS,
       BUSDATOS_TRANSACCIONES.OPERACION_COD_MONEDA_ORIGEN,
       BUSDATOS_TRANSACCIONES.OPERACION_DESC_MONEDA_ORIGEN,
       BUSDATOS_TRANSACCIONES.OPERACION_COD_MONEDA_DESTINO,
       BUSDATOS_TRANSACCIONES.OPERACION_DESC_MONEDA_DESTINO,
       BUSDATOS_TRANSACCIONES.OPERACION_MONT_ORIGEN,
       BUSDATOS_TRANSACCIONES.OPERACION_MONT_DESTINO,
       CASE
           WHEN BUSDATOS_TRANSACCIONES.OPERACION_COD_MONEDA_ORIGEN = 600
               THEN BUSDATOS_TRANSACCIONES.OPERACION_MONT_ORIGEN
           ELSE BUSDATOS_TRANSACCIONES.OPERACION_MONT_DESTINO
           END                                                                                       AS OPERACION_MONTO_GS,
       BUSDATOS_TRANSACCIONES.OPERACION_AMBITO_TRANSACCION,
       BUSDATOS_TRANSACCIONES.OPERACION_CTA_UTDA_OPERACION,
       BUSDATOS_TRANSACCIONES.OPERACION_TIP_DISPOSITIVO,
       BUSDATOS_TRANSACCIONES.OPERACION_DESC_DISPOSITIVO,
       BUSDATOS_TRANSACCIONES.OPERACION_COD_PAIS_ORIGEN,
       BUSDATOS_TRANSACCIONES.OPERACION_DESC_PAIS_ORIGEN,
       BUSDATOS_TRANSACCIONES.OPERACION_COD_PAIS_DESTINO,
       BUSDATOS_TRANSACCIONES.OPERACION_DESC_PAIS_DESTINO,
       BUSDATOS_TRANSACCIONES.OPERACION_VENC_TARJETA,
       BUSDATOS_TRANSACCIONES.OPERACION_COD_SERVICIO,
       BUSDATOS_TRANSACCIONES.OPERACION_DESC_SERVICIO,
       BUSDATOS_TRANSACCIONES.OPERACION_COD_PRESTACION,
       BUSDATOS_TRANSACCIONES.OPERACION_DESC_PRESTACION,
       BUSDATOS_TRANSACCIONES.OPERACION_COD_MARC_TARJETA,
       BUSDATOS_TRANSACCIONES.OPERACION_DESC_MARC_TARJETA,
       BUSDATOS_TRANSACCIONES.OPERACION_COD_PROD_TARJETA,
       BUSDATOS_TRANSACCIONES.OPERACION_DESC_PROD_TARJETA,
       BUSDATOS_TRANSACCIONES.OPERACION_COD_AFINIDAD,
       BUSDATOS_TRANSACCIONES.OPERACION_DESC_AFINIDAD,
       BUSDATOS_TRANSACCIONES.OPERACION_COD_RETORNO,
       BUSDATOS_TRANSACCIONES.OPERACION_DESC_RETORNO,
       BUSDATOS_TRANSACCIONES.OPERACION_CAT_COMERC_MCC,
       BUSDATOS_TRANSACCIONES.OPERACION_DESC_MCC,
       BUSDATOS_TRANSACCIONES.OPERACION_COD_TRANSACCION,
       BUSDATOS_TRANSACCIONES.OPERACION_DESC_TRANSACCION,
       BUSDATOS_TRANSACCIONES.OPERACION_FECH_PROC_TRANSACCIO,
       BUSDATOS_TRANSACCIONES.OPERACION_FORM_PAGO,
       BUSDATOS_TRANSACCIONES.OPERACION_DESC_FORM_PAGO,
       BUSDATOS_TRANSACCIONES.OPERACION_ESTAC_DEST_DS,
       BUSDATOS_TRANSACCIONES.OPERACION_ESTAC_ORIGEN_SS,
       BUSDATOS_TRANSACCIONES.OPERACION_MOD_ENTRADA,
       BUSDATOS_TRANSACCIONES.OPERACION_DESC_MOD_ENTRADA,
       BUSDATOS_TRANSACCIONES.OPERACION_SALD_ACTUAL,
       BUSDATOS_TRANSACCIONES.OPERACION_SALD_DISP,
       BUSDATOS_TRANSACCIONES.OPERACION_EST_IN_TRANSACCION,
       BUSDATOS_TRANSACCIONES.OPERACION_IDENT_CAJERO_ATM,
       BUSDATOS_TRANSACCIONES.OPERACION_ENTI_ADMI_ATM,
       BUSDATOS_TRANSACCIONES.OPERACION_ENT_PROPIETA_ATM,
       BUSDATOS_TRANSACCIONES.OPERACION_OPERA_ORIGEN,
       BUSDATOS_TRANSACCIONES.OPERACION_TELEF_ORIGEN,
       BUSDATOS_TRANSACCIONES.OPERACION_OPER_DESTINO,
       BUSDATOS_TRANSACCIONES.OPERACION_TELEF_DESTINO,
       BUSDATOS_TRANSACCIONES.OPERACION_MONT_COTIZACION,
       BUSDATOS_TRANSACCIONES.OPERACION_ENT_TRANSF_ORIGEN,
       BUSDATOS_TRANSACCIONES.OPERACION_DESC_ENTI_ORIGEN_TR,
       BUSDATOS_TRANSACCIONES.OPERACION_ENT_TRANSFE_DESTINO,
       BUSDATOS_TRANSACCIONES.OPERACION_DESC_ENTI_DESTINO_TR,
       BUSDATOS_TRANSACCIONES.OPERACION_CTA_TRANSFE_ORIGEN,
       BUSDATOS_TRANSACCIONES.OPERACION_CTA_TRANSFE_DESTINO,
       BUSDATOS_TRANSACCIONES.OPERACION_NUM_ADHERENTE,
       BUSDATOS_TRANSACCIONES.OPERACION_ID_PROMOCION,
       BUSDATOS_TRANSACCIONES.OPERACION_PROCE_EMISOR,
       BUSDATOS_TRANSACCIONES.OPERACION_DESC_PROCE_EMISOR,
       BUSDATOS_TRANSACCIONES.OPERACION_PROCE_ADQUIRIENTE,
       BUSDATOS_TRANSACCIONES.OPERACION_DESC_PROCE_ADQUIRIEN,
       BUSDATOS_TRANSACCIONES.OPERACION_PTOS_TRANSACCION,
       BUSDATOS_TRANSACCIONES.OPERACION_ESTADO_REPLICA,
       BUSDATOS_TRANSACCIONES.OPERACION_JSON,
       BUSDATOS_TRANSACCIONES.OPERACION_EST_FN_TRANSACCION,
       CASE
           WHEN OPERACION_EST_FN_TRANSACCION = 'A' AND OPERACION_COD_RETORNO = '00' THEN 'A'
           WHEN OPERACION_EST_FN_TRANSACCION = 'A' AND OPERACION_COD_RETORNO <> '00' THEN 'R'
           WHEN OPERACION_EST_FN_TRANSACCION = 'D' THEN 'R'
           WHEN OPERACION_EST_FN_TRANSACCION = 'R' THEN 'X'
           END                                                                                       AS ESTADO_TRANSACCION,
       COMISIONES.ID                                                                                 AS COMISIONES_ID,
       COMISIONES.RRNBEPSA,
       CASE WHEN COMISIONES.TIPO_AFECTACION = 'COBRAR' THEN COMISIONES.COMISION ELSE 0 END           AS COMISION_A_COBRAR,
       CASE WHEN COMISIONES.TIPO_AFECTACION = 'COBRAR' THEN COMISIONES.IVA_COMISION ELSE 0 END       AS IVA_COMISION_A_COBRAR,
       CASE WHEN COMISIONES.TIPO_AFECTACION = 'COBRAR' THEN COMISIONES.RENTA ELSE 0 END              AS RENTA_COMISION_A_COBRAR,
       CASE WHEN COMISIONES.TIPO_AFECTACION = 'COBRAR' THEN COMISIONES.IVA_RENTA ELSE 0 END          AS IVA_RENTA_COMISION_A_COBRAR,
       CASE WHEN COMISIONES.TIPO_AFECTACION = 'COBRAR' THEN COMISIONES.NETO ELSE 0 END               AS NETO_COMISION_A_COBRAR,
       CASE WHEN COMISIONES.TIPO_AFECTACION = 'PAGAR' THEN COMISIONES.COMISION ELSE 0 END            AS COMISION_A_PAGAR,
       CASE WHEN COMISIONES.TIPO_AFECTACION = 'PAGAR' THEN COMISIONES.IVA_COMISION ELSE 0 END        AS IVA_COMISION_A_PAGAR,
       CASE WHEN COMISIONES.TIPO_AFECTACION = 'PAGAR' THEN COMISIONES.RENTA ELSE 0 END               AS RENTA_COMISION_A_PAGAR,
       CASE WHEN COMISIONES.TIPO_AFECTACION = 'PAGAR' THEN COMISIONES.IVA_RENTA ELSE 0 END           AS IVA_RENTA_COMISION_A_PAGAR,
       CASE WHEN COMISIONES.TIPO_AFECTACION = 'PAGAR' THEN COMISIONES.NETO ELSE 0 END                AS NETO_COMISION_A_PAGAR,
       CAST(DATE(TO_TIMESTAMP(CAST(COMISIONES.FEC_LIQ AS VARCHAR), 'YYYYMMDD')) AS VARCHAR)          AS FEC_LIQ,
       CAST(DATE(TO_TIMESTAMP(CAST(COMISIONES.FEC_ACREDITACION AS VARCHAR), 'YYYYMMDD')) AS VARCHAR) AS FEC_ACREDITACION,
       --public.COMISIONES.FEC_ACREDITACION,
       COMISIONES.EMISOR,
       COMISIONES.TIPO_AFECTACION,
       COUNT(*) OVER ()                                                                              AS COUNTER
FROM BUSDATOS_TRANSACCIONES
         LEFT JOIN
     COMISIONES ON COMISIONES.RRNBEPSA = TRIM(BUSDATOS_TRANSACCIONES.OPERACION_RRNBEPSA)
WHERE BUSDATOS_TRANSACCIONES.OPERACION_EST_FN_TRANSACCION <> 'Q'
  -- Aquí se aplican las condiciones dinámicas basadas en `params.where`:
  AND BUSDATOS_TRANSACCIONES.OPERACION_FECH_TRANS BETWEEN '2025-03-21 00:00:00.000' AND '2025-03-24 23:59:59.999' -- Ejemplo de fecha
  AND BUSDATOS_TRANSACCIONES.OPERACION_COD_COMERCIO = '16351'   -- Ejemplo de código de comercio
AND busdatos_transacciones.OPERACION_RRNBEPSA='508163979775'
-- Más condiciones dinámicas...
ORDER BY BUSDATOS_TRANSACCIONES.OPERACION_FECH_TRANS DESC;

---query de reporte movimientos | portal LOG SISTEMA
SELECT "busdatos_transacciones"."operacion_id",
       "busdatos_transacciones"."operacion_fech_insercion",
       "busdatos_transacciones"."operacion_hor_insercion",
       "busdatos_transacciones"."operacion_rrnbepsa",
       "busdatos_transacciones"."operacion_est_reversa",
       "busdatos_transacciones"."operacion_fech_trans",
       "busdatos_transacciones"."operacion_cod_comercio",
       "busdatos_transacciones"."operacion_denom_comercial",
       "busdatos_transacciones"."operacion_cod_sucursal",
       "busdatos_transacciones"."operacion_desc_sucursal",
       "busdatos_transacciones"."operacion_cod_autenticacion",
       "busdatos_transacciones"."operacion_cod_entidad_rol",
       CAST(SUBSTRING(BUSDATOS_TRANSACCIONES.OPERACION_NUM_TARJETA FROM 1 FOR 6) || '******' || SUBSTRING(BUSDATOS_TRANSACCIONES.OPERACION_NUM_TARJETA FROM LENGTH(BUSDATOS_TRANSACCIONES.OPERACION_NUM_TARJETA) - 4 FOR 4) AS BPCHAR(19))                            AS OPERACION_NUM_TARJETA,
       CAST(SUBSTRING(BUSDATOS_TRANSACCIONES.OPERACION_NUM_TARJETA_ENMASCAR FROM 1 FOR 6) || '******' || SUBSTRING(BUSDATOS_TRANSACCIONES.OPERACION_NUM_TARJETA_ENMASCAR FROM LENGTH(BUSDATOS_TRANSACCIONES.OPERACION_NUM_TARJETA_ENMASCAR) - 4 FOR 4) AS BPCHAR(19)) AS OPERACION_NUM_TARJETA_ENMASCAR,
       CASE
           WHEN BUSDATOS_TRANSACCIONES.OPERACION_TIP_USO_TARJETA = 'C' THEN 'CREDITO'
           WHEN BUSDATOS_TRANSACCIONES.OPERACION_TIP_USO_TARJETA = 'D' THEN 'DEBITO'
           WHEN BUSDATOS_TRANSACCIONES.OPERACION_TIP_USO_TARJETA = 'E' THEN 'BILLETERA'
           END                                                                                                                                                                                                                                                        AS OPERACION_TIP_USO_TARJETA,
       "busdatos_transacciones"."operacion_cant_cuotas",
       "busdatos_transacciones"."operacion_cod_moneda_origen",
       "busdatos_transacciones"."operacion_desc_moneda_origen",
       "busdatos_transacciones"."operacion_cod_moneda_destino",
       "busdatos_transacciones"."operacion_desc_moneda_destino",
       "busdatos_transacciones"."operacion_mont_origen",
       "busdatos_transacciones"."operacion_mont_destino",
       CASE
           WHEN BUSDATOS_TRANSACCIONES.OPERACION_COD_MONEDA_ORIGEN = 600 THEN BUSDATOS_TRANSACCIONES.OPERACION_MONT_ORIGEN
           WHEN BUSDATOS_TRANSACCIONES.OPERACION_COD_MONEDA_ORIGEN <> 600 THEN BUSDATOS_TRANSACCIONES.OPERACION_MONT_DESTINO
           END                                                                                                                                                                                                                                                           OPERACION_MONTO_GS,
       "busdatos_transacciones"."operacion_ambito_transaccion",
       "busdatos_transacciones"."operacion_cta_utda_operacion",
       "busdatos_transacciones"."operacion_tip_dispositivo",
       "busdatos_transacciones"."operacion_desc_dispositivo",
       "busdatos_transacciones"."operacion_cod_pais_origen",
       "busdatos_transacciones"."operacion_desc_pais_origen",
       "busdatos_transacciones"."operacion_cod_pais_destino",
       "busdatos_transacciones"."operacion_desc_pais_destino",
       "busdatos_transacciones"."operacion_venc_tarjeta",
       "busdatos_transacciones"."operacion_cod_servicio",
       "busdatos_transacciones"."operacion_desc_servicio",
       "busdatos_transacciones"."operacion_cod_prestacion",
       "busdatos_transacciones"."operacion_desc_prestacion",
       "busdatos_transacciones"."operacion_cod_marc_tarjeta",
       "busdatos_transacciones"."operacion_desc_marc_tarjeta",
       "busdatos_transacciones"."operacion_cod_prod_tarjeta",
       "busdatos_transacciones"."operacion_desc_prod_tarjeta",
       "busdatos_transacciones"."operacion_cod_afinidad",
       "busdatos_transacciones"."operacion_desc_afinidad",
       "busdatos_transacciones"."operacion_cod_retorno",
       "busdatos_transacciones"."operacion_desc_retorno",
       "busdatos_transacciones"."operacion_cat_comerc_mcc",
       "busdatos_transacciones"."operacion_desc_mcc",
       "busdatos_transacciones"."operacion_cod_transaccion",
       "busdatos_transacciones"."operacion_desc_transaccion",
       "busdatos_transacciones"."operacion_fech_proc_transaccio",
       "busdatos_transacciones"."operacion_form_pago",
       CASE
           WHEN BUSDATOS_TRANSACCIONES.OPERACION_FORM_PAGO = 'TA' THEN 'TARJETA'
           WHEN BUSDATOS_TRANSACCIONES.OPERACION_FORM_PAGO = 'EF' THEN 'BILLETERA'
           END                                                                                                                                                                                                                                                        AS OPERACION_DESC_FORM_PAGO,
       "busdatos_transacciones"."operacion_estac_dest_ds",
       "busdatos_transacciones"."operacion_estac_origen_ss",
       "busdatos_transacciones"."operacion_mod_entrada",
       "busdatos_transacciones"."operacion_desc_mod_entrada",
       "busdatos_transacciones"."operacion_sald_actual",
       "busdatos_transacciones"."operacion_sald_disp",
       "busdatos_transacciones"."operacion_est_in_transaccion",
       "busdatos_transacciones"."operacion_ident_cajero_atm",
       "busdatos_transacciones"."operacion_enti_admi_atm",
       "busdatos_transacciones"."operacion_ent_propieta_atm",
       "busdatos_transacciones"."operacion_opera_origen",
       "busdatos_transacciones"."operacion_telef_origen",
       "busdatos_transacciones"."operacion_oper_destino",
       "busdatos_transacciones"."operacion_telef_destino",
       "busdatos_transacciones"."operacion_mont_cotizacion",
       "busdatos_transacciones"."operacion_ent_transf_origen",
       "busdatos_transacciones"."operacion_desc_enti_origen_tr",
       "busdatos_transacciones"."operacion_ent_transfe_destino",
       "busdatos_transacciones"."operacion_desc_enti_destino_tr",
       "busdatos_transacciones"."operacion_cta_transfe_origen",
       "busdatos_transacciones"."operacion_cta_transfe_destino",
       "busdatos_transacciones"."operacion_num_adherente",
       "busdatos_transacciones"."operacion_id_promocion",
       "busdatos_transacciones"."operacion_proce_emisor",
       "busdatos_transacciones"."operacion_desc_proce_emisor",
       "busdatos_transacciones"."operacion_proce_adquiriente",
       "busdatos_transacciones"."operacion_desc_proce_adquirien",
       "busdatos_transacciones"."operacion_ptos_transaccion",
       "busdatos_transacciones"."operacion_estado_replica",
       "busdatos_transacciones"."operacion_json",
       "busdatos_transacciones"."operacion_est_fn_transaccion",
       CASE
           WHEN OPERACION_EST_FN_TRANSACCION = 'A' AND OPERACION_COD_RETORNO = '00' THEN 'A'
           WHEN OPERACION_EST_FN_TRANSACCION = 'A' AND OPERACION_COD_RETORNO <> '00' THEN 'R'
           WHEN OPERACION_EST_FN_TRANSACCION = 'D' THEN 'R'
           WHEN OPERACION_EST_FN_TRANSACCION = 'R' THEN 'X'
           END                                                                                                                                                                                                                                                           ESTADO_TRANSACCION,
       "comisiones"."id"                                                                                                                                                                                                                                              AS "comisiones_id",
       "comisiones"."rrnbepsa",
       CASE WHEN COMISIONES.TIPO_AFECTACION = 'COBRAR' THEN COMISIONES.COMISION ELSE 0 END                                                                                                                                                                               COMISION_A_COBRAR,
       CASE WHEN COMISIONES.TIPO_AFECTACION = 'COBRAR' THEN COMISIONES.IVA_COMISION ELSE 0 END                                                                                                                                                                           IVA_COMISION_A_COBRAR,
       CASE WHEN COMISIONES.TIPO_AFECTACION = 'COBRAR' THEN COMISIONES.RENTA ELSE 0 END                                                                                                                                                                                  RENTA_COMISION_A_COBRAR,
       CASE WHEN COMISIONES.TIPO_AFECTACION = 'COBRAR' THEN COMISIONES.IVA_RENTA ELSE 0 END                                                                                                                                                                              IVA_RENTA_COMISION_A_COBRAR,
       CASE WHEN COMISIONES.TIPO_AFECTACION = 'COBRAR' THEN COMISIONES.NETO ELSE 0 END                                                                                                                                                                                   NETO_COMISION_A_COBRAR,
       CASE WHEN COMISIONES.TIPO_AFECTACION = 'PAGAR' THEN COMISIONES.COMISION ELSE 0 END                                                                                                                                                                                COMISION_A_PAGAR,
       CASE WHEN COMISIONES.TIPO_AFECTACION = 'PAGAR' THEN COMISIONES.IVA_COMISION ELSE 0 END                                                                                                                                                                            IVA_COMISION_A_PAGAR,
       CASE WHEN COMISIONES.TIPO_AFECTACION = 'PAGAR' THEN COMISIONES.RENTA ELSE 0 END                                                                                                                                                                                   RENTA_COMISION_A_PAGAR,
       CASE WHEN COMISIONES.TIPO_AFECTACION = 'PAGAR' THEN COMISIONES.IVA_RENTA ELSE 0 END                                                                                                                                                                               IVA_RENTA_COMISION_A_PAGAR,
       CASE WHEN COMISIONES.TIPO_AFECTACION = 'PAGAR' THEN COMISIONES.NETO ELSE 0 END                                                                                                                                                                                    NETO_COMISION_A_PAGAR,
       --(TO_DATE(COMISIONES.fec_liq::VARCHAR(8),'YYYYMMDD'))::TEXT fec_liq,
       CAST(DATE(TO_TIMESTAMP(CAST(COMISIONES.FEC_LIQ AS VARCHAR), 'YYYYMMDD')) AS VARCHAR)                                                                                                                                                                              FEC_LIQ,
       CAST(DATE(TO_TIMESTAMP(CAST(COMISIONES.FEC_ACREDITACION AS VARCHAR), 'YYYYMMDD')) AS VARCHAR)                                                                                                                                                                     FEC_ACREDITACION,
       "comisiones"."emisor",
       "comisiones"."tipo_afectacion",
       CASE
           WHEN COMISIONES.TIPO_AFECTACION = 'COBRAR' THEN BUSDATOS_TRANSACCIONES.OPERACION_MONT_ORIGEN + (COMISIONES.COMISION + COMISIONES.IVA_COMISION + COMISIONES.RENTA + COMISIONES.IVA_RENTA)
           WHEN COMISIONES.TIPO_AFECTACION = 'PAGAR' THEN BUSDATOS_TRANSACCIONES.OPERACION_MONT_ORIGEN - (COMISIONES.COMISION + COMISIONES.IVA_COMISION + COMISIONES.RENTA + COMISIONES.IVA_RENTA)
           ELSE 0
           END                                                                                                                                                                                                                                                        AS MONTO_NETO,
       CASE
           WHEN COMISIONES.TIPO_OPERACION = 'BATCH' THEN 'EN LOTE'
           WHEN COMISIONES.TIPO_OPERACION = 'ONLINE' THEN 'EN LINEA'
           ELSE NULL
           END                                                                                                                                                                                                                                                           TIPO_OPERACION
FROM "busdatos_transacciones"
         LEFT JOIN "comisiones" ON "comisiones"."rrnbepsa" = TRIM(BUSDATOS_TRANSACCIONES.OPERACION_RRNBEPSA)
WHERE "busdatos_transacciones"."operacion_est_fn_transaccion" <> 'Q'
  AND "busdatos_transacciones"."operacion_fech_trans" BETWEEN '2024-09-20  00:00:00.000' AND '2024-10-10 23:59:59.999'
  AND ("busdatos_transacciones"."operacion_cod_comercio", "busdatos_transacciones"."operacion_cod_sucursal") IN ((11735, 35))
  AND "busdatos_transacciones"."operacion_est_fn_transaccion" = 'A'
  AND "busdatos_transacciones"."operacion_cod_retorno" = '00'
ORDER BY "busdatos_transacciones"."operacion_fech_trans" DESC;

SELECT * FROM comisiones w WHERE w.CLICLICOD=11735 AND w.RRNBEPSA='427384150745';

SELECT BT.OPERACION_FECH_PROC_TRANSACCIO, BT.* FROM public.BUSDATOS_TRANSACCIONES BT WHERE BT.OPERACION_RRNBEPSA='507862150881';

SELECT * FROM public.COMERCIOS C WHERE C.NOMBRE LIKE '%MONITAL%';
------casos de suscription key _*****_
SELECT * FROM public.COMERCIOS C WHERE C.NOMBRE LIKE '%BEPSA%';
SELECT * FROM public.EMPRESAS_CLIENTES EC WHERE EC.PAGO_DIGITAL_SUSCRIPCION_KEY ISNULL;
UPDATE public.EMPRESAS_CLIENTES EC SET PAGO_DIGITAL_SUSCRIPCION_KEY='_*****_' WHERE EC.PAGO_DIGITAL_SUSCRIPCION_KEY ISNULL;
SELECT * FROM public.EMPRESAS_CLIENTES EC WHERE EC.EMPRESA_CLIENTE_BEPSA_ID=10736;
SELECT * FROM public.EMPRESAS_CLIENTES_BEPSA ECB WHERE descripcion_bepsa LIKE '%AUTOMOTOR%'--ECB.COD_CLIENTE_BEPSA='10736';
-----casos de comercios ya existen y como lleva de la db2 al portal
---query de obtención desde db2 al portal
/*const getByCliCodSucCod = async(params:{
    comsuc?:string,
})=> {
    let where = " WHERE a.SUCESTADO NOT IN ('B') ";
    if(params.comsuc) {
        where += ` AND (a.CLICLICOD, a.SUCSUCCOD) in (VALUES ${params.comsuc})`;
    }
    const query = `*/
        SELECT (
            SELECT T.COCOMER FROM GXFINDTA.TCOCNA T
            WHERE T.CLICLICOD = a.CLICLICOD AND T.SUCSUCCOD = a.SUCSUCCOD
            AND SUBSTR(T.COCOMER,0,3) NOT IN ('45')
            ORDER BY SUBSTR(T.COCOMER,0,3)
            LIMIT 1
        ) AS COCOMER,
        (SELECT C.COMADRE
            FROM GXWEB.COMAEAF C
            WHERE C.COCOMER = (SELECT T.COCOMER
            FROM GXFINDTA.TCOCNA T
            WHERE T.CLICLICOD = a.CLICLICOD AND T.SUCSUCCOD = a.SUCSUCCOD
            AND SUBSTR(T.COCOMER,0,3) NOT IN ('45')
            ORDER BY SUBSTR(T.COCOMER,0,3)
            LIMIT 1)) AS COMADRE,
        a.*, b.*
        FROM GXFINDTA.TCMSUC a
        INNER JOIN GXFINDTA.TCMCLI b ON a.CLICLICOD = b.CLICLICOD
        ${where}
        ORDER BY a.CLICLICOD, a.SUCSUCCOD`;
/*
    const queryCounter = `*/
        SELECT COUNT(*) as TOTAL
        FROM GXFINDTA.TCMSUC a
        INNER JOIN GXFINDTA.TCMCLI b ON a.CLICLICOD = b.CLICLICOD
/*      ${where}`;

    const empresasClientes = await Promise.all([
        queryDB(query),
        queryDB(queryCounter)
    ]);
    return {
        lista: empresasClientes[0],
        total: empresasClientes[1][0]?.TOTAL
    };
};
*/-------------------------
--sucursales_bepsa
SELECT *
FROM SUCURSALES_BEPSA_DB2 SBD
         INNER JOIN EMPRESAS_CLIENTES_BEPSA ECB ON SBD.CLIENTE_BEPSA_ID = ECB.ID
         INNER JOIN EMPRESAS_CLIENTES EC ON EC.EMPRESA_CLIENTE_BEPSA_ID = ECB.ID
WHERE ECB.COD_CLIENTE_BEPSA IN ('10736');

SELECT * FROM public.SUCURSALES_BEPSA_DB2 S WHERE S.CLIENTE_BEPSA_ID=7151;
SELECT * FROM public.SUCURSALES S WHERE S.COMERCIO_ID=7168;
--sucursales y comercios
SELECT *
FROM SUCURSALES S
         INNER JOIN COMERCIOS C ON S.COMERCIO_ID = C.ID
         INNER JOIN EMPRESAS_CLIENTES EC ON C.EMPRESA_CLIENTE_ID = EC.ID
         INNER JOIN EMPRESAS_CLIENTES_BEPSA ECB ON EC.EMPRESA_CLIENTE_BEPSA_ID = ECB.ID
WHERE ECB.COD_CLIENTE_BEPSA IN ('10736')
ORDER BY SUCURSAL_BEPSA_DB2_ID;
----ver empresa
SELECT ECB.COD_CLIENTE_BEPSA, EC.*
FROM EMPRESAS_CLIENTES EC
         INNER JOIN PERSONAS P ON EC.PERSONA_ID = P.ID
--inner join personas_fisicas p1 on p1.persona_id = p.id
         INNER JOIN PERSONAS_JURIDICAS P1 ON P1.PERSONA_ID = P.ID
         INNER JOIN PUBLIC.EMPRESAS_CLIENTES_BEPSA ECB ON ECB.ID = EC.EMPRESA_CLIENTE_BEPSA_ID
WHERE P1.RUC_NORMALIZADO IN ('80011012-9');
-------------VER COMERCIOS
SELECT * FROM public.COMERCIOS C WHERE C.EMPRESA_CLIENTE_ID=8175;
SELECT * FROM public.EMPRESAS_CLIENTES EC;

SELECT * FROM public.USUARIOS U WHERE U.NRO_DOCUMENTO LIKE '%80050172%';
SELECT * FROM pagos_digitales_db.public.COMERCIOS C
WHERE C.NOMBRE LIKE '%PARQUE%';
SELECT * FROM pocodi_db.public.EMPRESAS_CLIENTES_BEPSA WHERE DESCRIPCION_BEPSA LIKE '%PARQUE%';
SELECT * FROM public.COMERCIOS C WHERE C.NOMBRE LIKE '%%';
SELECT * FROM COMERCIOS C WHERE C.NOMBRE LIKE '%Sere%';
SELECT * FROM RECURSOS R WHERE R.ID=195;
SELECT * FROM public.INTERFACES_X_RECURSOS IXR WHERE IXR.RECURSO_ID=195;
SELECT * FROM public.INTERFACES_X_PERMISOS IXP WHERE IXP.INTERFAZ_ID=41;
SELECT * FROM public.PERMISOS P WHERE P.ID=48;
----ver permisos pocodi
SELECT R.* FROM public.USUARIOS U
INNER JOIN PUBLIC.ROLES_X_USUARIOS RXU ON U.ID = RXU.USUARIO_ID
INNER JOIN PUBLIC.ROLES R ON R.ID = RXU.ROL_ID
INNER JOIN PUBLIC.CORREOS_PRINCIPALES_USUARIOS CPU ON U.ID = CPU.USUARIO_ID
WHERE CPU.CORREO='adolfogimenez1093@gmail.com';

SELECT * FROM public.METODOS_HTTP MH;

SELECT OPERACION_COD_COMERCIO, BT.* FROM BUSDATOS_TRANSACCIONES BT WHERE BT.OPERACION_FORM_PAGO='QR'
AND BT.OPERACION_COD_COMERCIO=14656;

---- ver actividad de database y matar sesiones
select
	datid, usename, wait_event_type, wait_event, state,	query, datname,	pid, usesysid, usename,	application_name, backend_xmin,
	client_addr, client_hostname, client_port, backend_start, xact_start, query_start, state_change, backend_xid, backend_type
	--,pg_terminate_backend(pg_stat_activity.pid)
from
	pg_stat_activity
where
	datname = 'pocodi_db'
	and pid <> pg_backend_pid()
	--and state <> 'active'
	--AND usename = 'usrclt'
order by state;

SELECT pg_terminate_backend(36803);
--------------------------------------------------
--para ver si esta configurado comercio en p_digital
SELECT
    C.EMPRESA_CLIENTE_ID, C.ID_INTERNO, C.EMPRESA_CLIENTE_ID_INTERNO, C.NOMBRE, C.CYBERSOURCE_MERCHANT_ID
    FROM PUBLIC.COMERCIOS C
    WHERE C.ID_INTERNO IN ('6901892', '6901888', '6901929','6901786');
----QUUERY PANTALLA MIS MOVIMIENTOS
select "bt"."operacion_id", "bt"."operacion_fech_insercion", "bt"."operacion_hor_insercion", "bt"."operacion_rrnbepsa", "bt"."operacion_est_reversa", "bt"."operacion_fech_trans", "bt"."operacion_cod_comercio", "bt"."operacion_denom_comercial", "bt"."operacion_cod_sucursal", "bt"."operacion_desc_sucursal", "bt"."operacion_cod_autenticacion", "bt"."operacion_cod_entidad_rol", "bt"."operacion_num_tarjeta", "bt"."operacion_num_tarjeta_enmascar", "bt"."operacion_tip_uso_tarjeta", "bt"."operacion_cant_cuotas", "bt"."operacion_cod_moneda_origen", "bt"."operacion_desc_moneda_origen", "bt"."operacion_cod_moneda_destino", "bt"."operacion_desc_moneda_destino", "bt"."operacion_mont_origen", "bt"."operacion_mont_destino", "bt"."operacion_cod_moneda_origen", "bt"."operacion_mont_origen", "bt"."operacion_mont_destino", "bt"."operacion_ambito_transaccion", "bt"."operacion_cta_utda_operacion", "bt"."operacion_tip_dispositivo", "bt"."operacion_desc_dispositivo", "bt"."operacion_cod_pais_origen", "bt"."operacion_desc_pais_origen", "bt"."operacion_cod_pais_destino", "bt"."operacion_desc_pais_destino", "bt"."operacion_venc_tarjeta", "bt"."operacion_cod_servicio", "bt"."operacion_desc_servicio", "bt"."operacion_cod_prestacion", "bt"."operacion_desc_prestacion", "bt"."operacion_cod_marc_tarjeta", "bt"."operacion_desc_marc_tarjeta", "bt"."operacion_cod_prod_tarjeta", "bt"."operacion_desc_prod_tarjeta", "bt"."operacion_cod_afinidad", "bt"."operacion_desc_afinidad", "bt"."operacion_cod_retorno", "bt"."operacion_desc_retorno", "bt"."operacion_cat_comerc_mcc", "bt"."operacion_desc_mcc", "bt"."operacion_cod_transaccion", "bt"."operacion_desc_transaccion", "bt"."operacion_fech_proc_transaccio", "bt"."operacion_form_pago", "bt"."operacion_desc_form_pago", "bt"."operacion_estac_origen_ss", "bt"."operacion_estac_dest_ds", "bt"."operacion_mod_entrada", "bt"."operacion_desc_mod_entrada", "bt"."operacion_sald_actual", "bt"."operacion_sald_disp", "bt"."operacion_est_in_transaccion", "bt"."operacion_ident_cajero_atm", "bt"."operacion_enti_admi_atm", "bt"."operacion_ent_propieta_atm", "bt"."operacion_opera_origen", "bt"."operacion_telef_origen", "bt"."operacion_oper_destino", "bt"."operacion_telef_destino", "bt"."operacion_mont_cotizacion", "bt"."operacion_ent_transf_origen", "bt"."operacion_desc_enti_origen_tr", "bt"."operacion_ent_transfe_destino", "bt"."operacion_desc_enti_destino_tr", "bt"."operacion_cta_transfe_origen", "bt"."operacion_cta_transfe_destino", "bt"."operacion_num_adherente", "bt"."operacion_id_promocion", "bt"."operacion_proce_emisor", "bt"."operacion_desc_proce_emisor", "bt"."operacion_proce_adquiriente", "bt"."operacion_desc_proce_adquirien", "bt"."operacion_ptos_transaccion", "bt"."operacion_estado_replica", "bt"."operacion_json", "bt"."operacion_est_fn_transaccion", "bt"."operacion_cod_retorno",
cast(substring(bt.operacion_num_tarjeta FROM 1 FOR 6) || '******' || substring(bt.operacion_num_tarjeta FROM LENGTH(bt.operacion_num_tarjeta ) - 4 FOR 4) as bpchar(19)) as operacion_num_tarjeta,
cast(substring(bt.operacion_num_tarjeta_enmascar FROM 1 FOR 6) || '******' || substring(bt.operacion_num_tarjeta_enmascar FROM LENGTH(bt.operacion_num_tarjeta_enmascar ) - 4 FOR 4) as bpchar(19)) as operacion_num_tarjeta_enmascar,
CASE WHEN bt.operacion_cod_moneda_origen = 600 THEN bt.operacion_mont_origen WHEN bt.operacion_cod_moneda_origen <> 600 THEN bt.operacion_mont_destino END operacion_monto_gs,
CASE WHEN bt.operacion_est_fn_transaccion = 'A' AND bt.operacion_cod_retorno = '00' THEN 'A' WHEN bt.operacion_est_fn_transaccion = 'A' AND bt.operacion_cod_retorno <> '00' THEN 'R' WHEN bt.operacion_est_fn_transaccion = 'D' THEN 'R' WHEN bt.operacion_est_fn_transaccion = 'R' THEN 'X' END estado_transaccion, COUNT(*) OVER () AS counter
from "busdatos_transacciones" as "bt"
where "bt"."operacion_est_fn_transaccion" <> 'Q' and "bt"."operacion_est_fn_transaccion" = 'A' and "bt"."operacion_cod_retorno" = '00' and "bt"."operacion_fech_trans"
between '2024-10-22  00:00:00.000' and '2024-10-22 23:59:59.999'
and ("bt"."operacion_cod_comercio", "bt"."operacion_cod_sucursal") in ((11113, 6), (11113, 8), (10937, 1), (10937, 2), (10937, 3), (10937, 16), (10937, 18), (10937, 4), (10937, 8), (11113, 5), (10937, 5), (11113, 1001), (10937, 226), (10937, 1001), (11113, 3), (11113, 9), (11113, 2), (10937, 17), (11113, 10), (10937, 6), (11113, 7), (10937, 7), (10937, 224), (10937, 21), (10937, 23), (10937, 26), (10937, 78), (10937, 189), (10937, 15), (10937, 168), (10937, 228), (10937, 186), (10937, 10), (10937, 80), (10937, 229), (10937, 25), (11113, 3), (11113, 94), (10937, 186), (11113, 13), (11113, 4), (10736, 1), (11113, 145), (10937, 48), (11113, 11), (11113, 1), (10937, 43), (10937, 14), (10937, 19), (10736, 4), (11735, 35), (10879, 17))
order by "bt"."operacion_fech_trans" asc;
---QUUERY PANTALLA MIS MOVIMIENTOS PANZA
select "bt"."operacion_id", "bt"."operacion_fech_insercion", "bt"."operacion_hor_insercion", "bt"."operacion_rrnbepsa", "bt"."operacion_est_reversa", "bt"."operacion_fech_trans", "bt"."operacion_cod_comercio", "bt"."operacion_denom_comercial", "bt"."operacion_cod_sucursal", "bt"."operacion_desc_sucursal", "bt"."operacion_cod_autenticacion", "bt"."operacion_cod_entidad_rol", "bt"."operacion_num_tarjeta", "bt"."operacion_num_tarjeta_enmascar", "bt"."operacion_tip_uso_tarjeta", "bt"."operacion_cant_cuotas", "bt"."operacion_cod_moneda_origen", "bt"."operacion_desc_moneda_origen", "bt"."operacion_cod_moneda_destino", "bt"."operacion_desc_moneda_destino", "bt"."operacion_mont_origen", "bt"."operacion_mont_destino", "bt"."operacion_cod_moneda_origen", "bt"."operacion_mont_origen", "bt"."operacion_mont_destino", "bt"."operacion_ambito_transaccion", "bt"."operacion_cta_utda_operacion", "bt"."operacion_tip_dispositivo", "bt"."operacion_desc_dispositivo", "bt"."operacion_cod_pais_origen", "bt"."operacion_desc_pais_origen", "bt"."operacion_cod_pais_destino", "bt"."operacion_desc_pais_destino", "bt"."operacion_venc_tarjeta", "bt"."operacion_cod_servicio", "bt"."operacion_desc_servicio", "bt"."operacion_cod_prestacion", "bt"."operacion_desc_prestacion", "bt"."operacion_cod_marc_tarjeta", "bt"."operacion_desc_marc_tarjeta", "bt"."operacion_cod_prod_tarjeta", "bt"."operacion_desc_prod_tarjeta", "bt"."operacion_cod_afinidad", "bt"."operacion_desc_afinidad", "bt"."operacion_cod_retorno", "bt"."operacion_desc_retorno", "bt"."operacion_cat_comerc_mcc", "bt"."operacion_desc_mcc", "bt"."operacion_cod_transaccion", "bt"."operacion_desc_transaccion", "bt"."operacion_fech_proc_transaccio", "bt"."operacion_form_pago", "bt"."operacion_desc_form_pago", "bt"."operacion_estac_origen_ss", "bt"."operacion_estac_dest_ds", "bt"."operacion_mod_entrada", "bt"."operacion_desc_mod_entrada", "bt"."operacion_sald_actual", "bt"."operacion_sald_disp", "bt"."operacion_est_in_transaccion", "bt"."operacion_ident_cajero_atm", "bt"."operacion_enti_admi_atm", "bt"."operacion_ent_propieta_atm", "bt"."operacion_opera_origen", "bt"."operacion_telef_origen", "bt"."operacion_oper_destino", "bt"."operacion_telef_destino", "bt"."operacion_mont_cotizacion", "bt"."operacion_ent_transf_origen", "bt"."operacion_desc_enti_origen_tr", "bt"."operacion_ent_transfe_destino", "bt"."operacion_desc_enti_destino_tr", "bt"."operacion_cta_transfe_origen", "bt"."operacion_cta_transfe_destino", "bt"."operacion_num_adherente", "bt"."operacion_id_promocion", "bt"."operacion_proce_emisor", "bt"."operacion_desc_proce_emisor", "bt"."operacion_proce_adquiriente", "bt"."operacion_desc_proce_adquirien", "bt"."operacion_ptos_transaccion", "bt"."operacion_estado_replica", "bt"."operacion_json", "bt"."operacion_est_fn_transaccion", "bt"."operacion_cod_retorno", cast(substring(bt.operacion_num_tarjeta FROM 1 FOR 6) || '******' || substring(bt.operacion_num_tarjeta FROM LENGTH(bt.operacion_num_tarjeta ) - 4 FOR 4) as bpchar(19)) as operacion_num_tarjeta, cast(substring(bt.operacion_num_tarjeta_enmascar FROM 1 FOR 6) || '******' || substring(bt.operacion_num_tarjeta_enmascar FROM LENGTH(bt.operacion_num_tarjeta_enmascar ) - 4 FOR 4) as bpchar(19)) as operacion_num_tarjeta_enmascar, CASE
WHEN bt.operacion_cod_moneda_origen = 600 THEN bt.operacion_mont_origen
WHEN bt.operacion_cod_moneda_origen <> 600 THEN bt.operacion_mont_destino
END operacion_monto_gs, CASE
WHEN bt.operacion_est_fn_transaccion = 'A' AND bt.operacion_cod_retorno = '00' THEN 'A'
WHEN bt.operacion_est_fn_transaccion = 'A' AND bt.operacion_cod_retorno <> '00' THEN 'R'
WHEN bt.operacion_est_fn_transaccion = 'D' THEN 'R'
WHEN bt.operacion_est_fn_transaccion = 'R' THEN 'X'
END estado_transaccion, COUNT(*) OVER () AS counter from "busdatos_transacciones" as "bt" where "bt"."operacion_est_fn_transaccion" <>
'Q' and "bt"."operacion_est_fn_transaccion" = 'A' and "bt"."operacion_cod_retorno" = '00' and "bt"."operacion_fech_trans" between '2025-03-22  00:00:00.000' and '2025-03-24 23:59:59.999' and "bt"."operacion_rrnbepsa" = '508163979775' order by "bt"."operacion_fech_trans" asc limit 5
-----------------
--obtiene cliente por cliclicod
SELECT (SELECT T.COCOMER FROM GXFINDTA.TCOCNA T
WHERE T.CLICLICOD = A.CLICLICOD AND T.SUCSUCCOD = A.SUCSUCCOD AND SUBSTR(T.COCOMER, 0, 3) NOT IN ('45')
ORDER BY SUBSTR(T.COCOMER, 0, 3) LIMIT 1) COCOMER, A.*, B.*
FROM GXFINDTA.TCMSUC A
         INNER JOIN GXFINDTA.TCMCLI B ON A.CLICLICOD = B.CLICLICOD
WHERE A.SUCESTADO NOT IN ('B') AND A.CLICLICOD LIKE '24625' AND A.SUCSUCCOD NOT IN ('1')
LIMIT 10 OFFSET 0;
------------------------------------------------------------
--AGREGAR SUPSCRIPCION | AUT
SELECT * FROM public.EMPRESAS_CLIENTES EC WHERE EC.NOMBRE LIKE '%Sere%';
SELECT * FROM public.EMPRESAS_CLIENTES EC WHERE EC.ID_INTERNO='12300';


SELECT * FROM public.USUARIOS U WHERE nro_documento='1448578';
---USUARIO SIN NIVEL DE ACCESO | EMPRESA || QUITAR EL USER ID DESDE EL F12 DEL NAVEGADOR
SELECT * FROM pocodi_db.public.USUARIOS U WHERE U.ID='648745fb-3022-4210-aafb-61905ded7a90';
SELECT * FROM public.USUARIOS_NIVELES_ACCESO UNA WHERE UNA.USUARIO_ID='648745fb-3022-4210-aafb-61905ded7a90';

INSERT INTO PUBLIC.USUARIOS_NIVELES_ACCESO ( USUARIO_ID, NIVEL_ACCESO_ID, INSERTADO_EL)
VALUES ( '648745fb-3022-4210-aafb-61905ded7a90', 2, CURRENT_TIMESTAMP);
--------------- onboarding --------------
select * from onboarding_access_registration oar; --WHERE OAR.USER_NAME ISNULL ;
select * from onboarding_access_registration_detail oard;
DELETE FROM ONBOARDING_ACCESS_REGISTRATION O WHERE O.USER_NAME ISNULL;
delete from onboarding_access_registration where user_email = 'contabilidad@resortyacht.com.py';

--onboarding con nro ruc
SELECT OAR.*, CASE WHEN PF.RUC_NORMALIZADO IS NULL THEN PJ.RUC_NORMALIZADO ELSE PF.RUC_NORMALIZADO END AS RUC
FROM ONBOARDING_ACCESS_REGISTRATION OAR
         JOIN EMPRESAS_CLIENTES EC ON EC.ID = OAR.EMPRESA_ID
         JOIN PERSONAS P ON P.ID = EC.PERSONA_ID
         LEFT JOIN PERSONAS_FISICAS PF ON P.ID = PF.PERSONA_ID
         LEFT JOIN PERSONAS_JURIDICAS PJ ON P.ID = PJ.PERSONA_ID;

GRANT SELECT , INSERT, UPDATE, DELETE ON
    TABLE onboarding_access_registration, onboarding_access_registration_detail TO 'user';

---DB2 query para validar datos de usuario Para lo de onboarding
SELECT b.CLIRUC RUC, b.CLIRAZSOC RAZON_SOCIAL, C.COCOMER, a.CLICLICOD, a.SUCSUCCOD SUCURSAL, a.SUCDENCOM DENOMINACION,
		a.SUCDIRECC DIRECCION, a.SUCCORREO CORREO, (CASE WHEN D.SERCODI = '' THEN 'PRINCIPAL' ELSE D.SERCODI END) SERVICIO,
		(CASE WHEN D.SERCODI = '' THEN 'CUENTA_PRINCIPAL' ELSE SERDESC END)DESC_SERVICIO, D.LIQENTCOD COD_BANCO, F.ENTNCENTID DESC_BANCO,D.LIQNROCUE NRO_CUENTA
		FROM GXFINDTA.TCMSUC a
		INNER JOIN GXFINDTA.TCMCLI b ON a.CLICLICOD = b.CLICLICOD
		INNER JOIN GXFINDTA.TCOCNA C ON a.CLICLICOD = C.CLICLICOD  AND a.SUCSUCCOD = C.SUCSUCCOD
		INNER JOIN GXFINDTA.TCMLIQ D ON a.CLICLICOD = D.CLICLICOD AND a.SUCSUCCOD = D.SUCSUCCOD
		LEFT JOIN GXFINDTA.TCLSER E ON D.SERCODI = E.SERCODI
		INNER JOIN GXTRJDTA.TDGENT F ON D.LIQENTCOD = F.ENTCODENT
		WHERE b.CLIRUC LIKE '%80011012-9%'
		AND SUBSTR(C.COCOMER,1,2) NOT IN ('45''81','86','95') AND D.SERCODI = '' AND a.SUCMATRIZ = 'S' LIMIT 1;
-------------------
select cl.* from cliente_linkdepagos cl
join comprobantes_transacciones ct on ct.cliente_id = cl.id
where ct.rrn in ('431902925844', '431902953142', '431902974427', '431902990028', '431902996489');

select  ct.*, cl.*
from comprobantes_transacciones ct
left join cliente_linkdepagos cl on cl.id  = ct.cliente_id
where ct.id in(440,505,520,522,528);

--- para ver cod comercio asociado a dinelco_mf | pago digital db
select * from comercios c where cybersource_merchant_id like '%dinelco_690120800001%';

select c.nombre as nombre_comercio, c.id, c.id_interno, c.empresa_cliente_id_interno, c.empresa_cliente_id,
con.tag, con.valor
from configuraciones con
inner join comercios c on con.comercio_id::uuid = c.id::uuid
where c.id_interno in ('6901787', '6901588');


select * from public.ordenes_pago op
where op.rrn_retorno in ('490506234785','490506234761')
and op.authorization_id in('697966','697906');

--checkout_plataform
select * from merchants m
join cybersource_merchant_info cmi
on cmi.id = m.cs_merchant_id;

  -- pk mPT6c9lr6EELMKJVB/bp+MSFr+Dg3ylw7ezWVLeu63s=
-- pvk  2a5b73fe-9ae6-4d1c-9a9f-24d4aef80a30

SELECT * FROM public.MERCHANTS M WHERE M.ID=3;
SELECT * FROM public.CYBERSOURCE_MERCHANT_INFO CMI WHERE CMI.ID=5;
--base pago digital
select * from tarjetas t join medios_pago mp on t.medio_pago_id = mp.id
where t.nro_tarjeta_enmascarado like '4224%' and t.nro_tarjeta_enmascarado like '%7487';

select * FROM public.OPERADORAS_BILLETERA OB;

select context from payment_credit pc where realm = 'masfazzil' and registered::date = '2024-12-02';

select * from public.comercios c  where
(c.id::uuid = 'add7d09e-fb2c-4029-81b1-38660c9e7123'::uuid or
c.empresa_cliente_id::uuid  = 'add7d09e-fb2c-4029-81b1-38660c9e7123'::uuid);

select * from comercios c where c.cybersource_merchant_id = 'dinelco_mf_001969000015';

select "empresas_clientes"."id", "empresas_clientes_bepsa"."cod_cliente_bepsa",
"personas"."tipo_persona", "empresas_clientes_bepsa"."descripcion_bepsa", CASE
                                WHEN personas.tipo_persona = 'F' THEN personas_fisicas.nro_documento
                                WHEN personas.tipo_persona = 'J' THEN personas_juridicas.nro_documento END AS nro_documento, CASE
                                WHEN personas.tipo_persona = 'F' THEN personas_fisicas.dv_ruc
                                WHEN personas.tipo_persona = 'J' THEN personas_juridicas.dv_ruc END AS dv_ruc, CASE
                                WHEN personas.tipo_persona = 'F' THEN personas_fisicas.ruc_normalizado
                                WHEN personas.tipo_persona = 'J' THEN personas_juridicas.ruc_normalizado END AS ruc_normalizado,
                                "personas"."nombre_normalizado",
                                "grupos_empresariales"."id" as "grupo_empresarial_id",
                                "empresas_clientes"."correo_comercio",
                                "empresas_clientes"."logo_comercio",
                                "grupos_empresariales"."nombre" as "grupos_empresariales_nombre",
                                "empresas_clientes"."activo", "empresas_clientes"."insertado_el",
                                COUNT(*) OVER () AS counter
                                from "empresas_clientes"
                                inner join "empresas_clientes_bepsa" on "empresas_clientes"."empresa_cliente_bepsa_id" = "empresas_clientes_bepsa"."id"
                                inner join "personas" on "empresas_clientes"."persona_id" = "personas"."id"
                                left outer join "grupos_empresariales" on "personas"."grupo_empresarial_id" = "grupos_empresariales"."id"
                                left join "personas_juridicas" on "personas_juridicas"."persona_id" = "personas"."id"
                                left join "personas_fisicas" on "personas_fisicas"."persona_id" = "personas"."id"
                        where "personas_juridicas"."eliminado" = false
                        and "empresas_clientes"."id" in
                        (select "empresa_id" from "usuarios_x_empresas" where "usuarios_x_empresas"."usuario_id" = 'e7623368-b552-4c3c-9acc-aceef70abbea' and "usuarios_x_empresas"."activo"
= true)
-- and "empresas_clientes"."id" = '600';
and personas_juridicas.ruc_normalizado = '5866335-5' or personas_fisicas.ruc_normalizado = '5866335-5';

--este query sera que podes darme el valor porfa?
select "empresas_clientes"."id", "empresas_clientes_bepsa"."cod_cliente_bepsa",
"personas"."tipo_persona", "empresas_clientes_bepsa"."descripcion_bepsa", CASE
                                WHEN personas.tipo_persona = 'F' THEN personas_fisicas.nro_documento
                                WHEN personas.tipo_persona = 'J' THEN personas_juridicas.nro_documento END AS nro_documento, CASE
                                WHEN personas.tipo_persona = 'F' THEN personas_fisicas.dv_ruc
                                WHEN personas.tipo_persona = 'J' THEN personas_juridicas.dv_ruc END AS dv_ruc, CASE
                                WHEN personas.tipo_persona = 'F' THEN personas_fisicas.ruc_normalizado
                                WHEN personas.tipo_persona = 'J' THEN personas_juridicas.ruc_normalizado END AS ruc_normalizado,
                                "personas"."nombre_normalizado",
                                "grupos_empresariales"."id" as "grupo_empresarial_id",
                                "empresas_clientes"."correo_comercio",
                                "empresas_clientes"."logo_comercio",
                                "grupos_empresariales"."nombre" as "grupos_empresariales_nombre",
                                "empresas_clientes"."activo", "empresas_clientes"."insertado_el",
                                COUNT(*) OVER () AS counter
                                from "empresas_clientes"
                                inner join "empresas_clientes_bepsa" on "empresas_clientes"."empresa_cliente_bepsa_id" = "empresas_clientes_bepsa"."id"
                                inner join "personas" on "empresas_clientes"."persona_id" = "personas"."id"
                                left outer join "grupos_empresariales" on "personas"."grupo_empresarial_id" = "grupos_empresariales"."id"
                                left join "personas_juridicas" on "personas_juridicas"."persona_id" = "personas"."id"
                                left join "personas_fisicas" on "personas_fisicas"."persona_id" = "personas"."id"
                        where "personas_juridicas"."eliminado" = false
                        and "empresas_clientes"."id" in
                        (select "empresa_id" from "usuarios_x_empresas" where "usuarios_x_empresas"."usuario_id" = 'be136356-5b5b-4b73-a7f6-53486a743b42' and "usuarios_x_empresas"."activo"
= true)
;

select "empresa_id" from "usuarios_x_empresas" where "usuarios_x_empresas"."usuario_id" = 'e7623368-b552-4c3c-9acc-aceef70abbea' and "usuarios_x_empresas"."activo"
= true


select * from configuraciones co where co.comercio_id = '9c605d1c-7951-4741-a698-e67dda38eaf7';

select * from comercios c where c.id = '9c605d1c-7951-4741-a698-e67dda38eaf7';


-- VERIFICACION para 3ds

--- BASE pago_digital
select * from comercios c
join configuraciones n on c.id::uuid = n.comercio_id::uuid
where c.cybersource_merchant_id = 'dinelco_002703100001';

--- BASE checkout
select * from merchants m join
cybersource_merchant_info cmi on cmi.id = m.cs_merchant_id
where cmi.cs_id = 'dinelco_002703100001';


select "usuarios"."id" as "id", "personas_fisicas"."nombre", "personas_fisicas"."apellido", "personas_fisicas"."es_contribuyente",
"personas_fisicas"."dv_ruc", "personas_fisicas"."ruc_normalizado", "personas_fisicas"."nro_documento", "personas_fisicas"."tipo_documento_id",
"tipos_documentos"."nombre" as "tipos_documentos_nombre", "correos_principales_usuarios"."correo", "usuarios"."activo", "usuarios"."insertado_el",
"usuarios"."codigo_servicio", "niveles_acceso"."id" as "nivel_acceso_id", "niveles_acceso"."nombre" as "nivel_acceso_nombre",
COUNT(*) OVER() as counter
from "usuarios"
inner join "personas_fisicas" on "usuarios"."persona_fisica_id" = "personas_fisicas"."id"
inner join "tipos_documentos" on "personas_fisicas"."tipo_documento_id" = "tipos_documentos"."id"
left join "correos_principales_usuarios" on "usuarios"."id" = "correos_principales_usuarios"."usuario_id"
left join "usuarios_niveles_acceso" on "usuarios_niveles_acceso"."usuario_id" = "usuarios"."id"
left join "niveles_acceso" on "usuarios_niveles_acceso"."nivel_acceso_id" = "niveles_acceso"."id"
where "personas_fisicas"."eliminado" = false and "personas_fisicas"."nro_documento" = '430990'
order by "usuarios"."id" DESC limit 20;

---- PAGO DIGITAL DB -----
select * from comercios c
join configuraciones n on c.id::uuid = n.comercio_id::uuid
where c.cybersource_merchant_id = 'dinelco_link_001694800003';

---- DINELCO CHECKOUT DB -----
select * from merchants m join
cybersource_merchant_info cmi on cmi.id = m.cs_merchant_id
where cmi.cs_id = 'dinelco_link_001694800003';

SELECT * FROM public.BUSDATOS_TRANSACCIONES BT WHERE BT.OPERACION_RRNBEPSA ='561708285183';


select * FROM PUBLIC.SUSCRIPCIONES;

SELECT * FROM EQWEDI_AUTH_DB.PUBLIC.EMPRESAS_CLIENTES EC WHERE EC.NOMBRE LIKE '%GRO%';

/*Razón Social: Hilagro S.A.
RUC: 80030229-0
Razón Social: Transagro S.A.
RUC: 80024300-5*/

---link de pagos para cambiar es en este secret de pagos digitales bk
--FORM_TOKEN_EXPIRATION_IN_MINUTES=1440

------------------
SELECT * FROM public.PERSONAS_JURIDICAS PF WHERE PF.RUC_NORMALIZADO='80024300-5';
SELECT * FROM public.EMPRESAS_CLIENTES EC WHERE EC.PERSONA_ID=10629;
SELECT * FROM public.USUARIOS_X_EMPRESAS UXE WHERE UXE.EMPRESA_ID=13337;


SELECT * FROM public.USUARIOS U WHERE U.CORREO LIKE '%@cadenareal.com%';
select * from personas_fisicas pf where pf.nro_documento = '1646858';
update personas_fisicas set nombre = 'FEDERICO AGUSTIN', apellido = 'BENITEZ RIVAS' where nro_documento = '1904373';

select * from tarjetas t where t.nro_tarjeta_enmascarado like '627431%%0011';

---ELIMINAR USUARIOS
SELECT * FROM public.PERSONAS_FISICAS PF WHERE PF.NRO_DOCUMENTO='3519140';
SELECT * FROM pocodi_db.public.USUARIOS U WHERE U.PERSONA_FISICA_ID=4804;
SELECT * FROM public.CORREOS_PRINCIPALES_USUARIOS CPU WHERE CPU.USUARIO_ID='69982b45-ff03-4698-8381-f0782c6d9c81';
SELECT * FROM public.ROLES_X_USUARIOS RXU WHERE RXU.USUARIO_ID='69982b45-ff03-4698-8381-f0782c6d9c81';
SELECT * FROM usuarios_niveles_acceso UNA WHERE UNA.USUARIO_ID='69982b45-ff03-4698-8381-f0782c6d9c81';
SELECT * FROM public.USUARIOS_X_EMPRESAS UXE WHERE UXE.USUARIO_ID='69982b45-ff03-4698-8381-f0782c6d9c81';

SELECT * FROM public.USUARIOS U WHERE U.ID='69982b45-ff03-4698-8381-f0782c6d9c81';
SELECT * FROM public.CONTADOR_LOGIN_FALLIDOS CLF WHERE CLF.USUARIO_ID='69982b45-ff03-4698-8381-f0782c6d9c81';
SELECT * FROM public.GRUPOS_ACCESOS_APIS_X_USUARIOS GAAXU WHERE GAAXU.USUARIO_ID='69982b45-ff03-4698-8381-f0782c6d9c81';
SELECT * FROM public.REFRESH_TOKENS RT WHERE RT.USUARIO_ID='69982b45-ff03-4698-8381-f0782c6d9c81';
SELECT * FROM public.SEGURIDADES S WHERE S.USUARIO_ID='69982b45-ff03-4698-8381-f0782c6d9c81';

select BT.operacion_est_fn_transaccion, BT.* from BUSDATOS_TRANSACCIONES BT WHERE BT.OPERACION_RRNBEPSA='562109384003';

SELECT * FROM pagos_digitales_db.public.ORDENES_PAGO OP WHERE OP.REFERENCIA='50161700000000000';
SELECT * FROM  public.COMERCIOS C WHERE C.CYBERSOURCE_MERCHANT_ID='dinelco_690120800001';

SELECT * FROM BUSDATOS_TRANSACCIONES BT WHERE BT.OPERACION_RRNBEPSA IN ('502840199848');

select * from merchants m join cybersource_merchant_info cmi
on m.cs_merchant_id = cmi.id;

select * from comercios c  where id = '3b211228-bf03-43f4-b12b-8d08d6edaeba';

SELECT * FROM ordenes_pago op WHERE --OP.estado = 'FALLIDO'
                                 fecha_estado >= '2025-01-29 08:02:09.945204'
                                 --and op.RRN_RETORNO = '503011958871'
                                 and OP.RESPUESTA_JSON LIKE '%"responseCode":"1830"%';

select estado  from ordenes_pago op group by estado;


select * from ordenes_pago op where op.rrn_retorno = '503011732040';

select valor, TAG from configuraciones where comercio_id='ba54b6c5-09e0-4de9-8ad9-df4e26d74743';

SELECT  * FROM public.COMERCIOS C WHERE nombre='MASFAZZIL';
---query de detalle liquidacion
--1 paso
SELECT "f"."facventaid",
       "f"."facventacomprobanteset",
       "f"."facclienteid",
       "f"."facsucursalid",
       "f"."periodoid",
       "f"."ejercicioid",
       "f"."facventasiriuspdfpath",
       "f"."facventafecha",
       "p"."targetperfdesde",
       "p"."targetperfhasta"
FROM "facturacionbepsa"."facventa" AS "f"
         LEFT JOIN "facturacionbepsa"."periodotargetfact" AS "p" ON "p"."targetfactid" = "f"."targetfactid" AND "p"."periodoid" = "f"."periodoid" AND "p"."ejercicioid" = "f"."ejercicioid"
WHERE "f"."facventaid" = '826712'
  AND "f"."targetfactid" = 'FactComercios'
  AND "f"."statusid" = 'DTE_APROBADO'
LIMIT 1;

--2 paso
SELECT "c"."movfecliq"                                     AS "fecha_deposito",
       ROW_NUMBER() OVER ()                                AS NUMERO,
       "c"."movtpta"                                       AS "referencia",
       COUNT(C.MOVRRNBEP)                                  AS CUPONES,
       SUM(C.MOVIMPO)                                      AS IMPORTE,
       SUM(C.MOVIMCO)                                      AS COM_PROC,
       SUM(C.MOVIVCO)                                      AS IVA_S_COM,
       SUM(C.MOVRENT)                                      AS RENTA,
       SUM(C.MOVIVREN)                                     AS IVA_RENTA,
       SUM(C.MOVIMCO + C.MOVIVCO + C.MOVRENT + C.MOVIVREN) AS DESCUENTO,
       SUM(C.MOVNETO)                                      AS IMPORTE_NETO,
       SUM(C.MOVNETO)                                      AS IMPORTE_CREDITO,
       "c"."movcodcli"                                     AS "cliente",
       "c"."movcodsuc"                                     AS "sucursal",
       "c"."movcomer"                                      AS "codigo_comercio",
       "c"."movfcre"                                       AS "fecha_acreditacion"
FROM "facturacionbepsa"."tclmov_tmp_retail_202411_factcomercios" AS "c"
WHERE "c"."movcodcli" = '10937'
  AND "c"."movcodsuc" = '21'
GROUP BY "c"."movfecliq", "c"."movtpta", "c"."movcodcli", "c"."movcodsuc", "c"."movcomer", "c"."movfcre";
--------casos cybersource
/*los que inician con dinelco_00111111 -> su main id es: dinelco_checkout
los que inician con dinelco_link_0011111 -> su main id es: dinelco_link
los que inician con dinelco_mf_0011111 -> su main id es: dinelco_mf
los que inician con dinelco_da_0011111 - > su main id es: dinelco_debitoauto
dinelco_0012300xxxxx (codigo de cliente de documenta), corresponde al main id dinelco_documeta*/

SELECT * FROM CHECKOUT_PLATFORM.public.MERCHANTS M;
SELECT * FROM CHECKOUT_PLATFORM.public.CYBERSOURCE_MERCHANT_INFO CMI WHERE CMI.CS_ID='dinelco_002844100001';

SELECT *
FROM CHECKOUT_PLATFORM.PUBLIC.MERCHANTS M
         INNER JOIN PUBLIC.CYBERSOURCE_MERCHANT_INFO CMI ON M.CS_MERCHANT_ID = CMI.ID;

SELECT * FROM PAGOS_DIGITALES_DB.public.COMERCIOS C WHERE C.CYBERSOURCE_MERCHANT_ID IN ('dinelco_002844100001');
SELECT * FROM PAGOS_DIGITALES_DB.PUBLIC.COMERCIOS C WHERE C.ID_INTERNO IN ('6900159', '6900293', '8104121', '8603622', '6900682', '6900683', '6900684', '6900696', '8300003', '5400658', '5400659', '2900004', '2900005', '2900006', '2900007', '1600028', '4800224', '4800225', '6900849', '3800031', '5800120', '5100125', '6100119', '4800226', '1600029', '4800227', '4800228', '6900850', '3800032', '5800122', '5100126', '6100120', '4800229', '1600030', '4800231', '4800232', '6900862', '3800033', '5800123', '5100127', '6100121', '4800233', '8613994', '8613995', '8613996', '8613997', '8613998', '8613999', '8614000', '8614001', '8614002', '8614003', '8614004', '8614005', '8614006', '8614007', '8614008', '6901688', '8622192', '6901689', '8622193', '6901690', '8622194', '6901691', '8622195', '6901692', '8622196', '6901693', '6901694', '6901695', '6901696', '6901697', '6901848', '8623325', '6901859', '8623427', '6901860', '8623428', '6901861', '8623429', '6901862', '8623430', '6901863', '8623431', '6901864', '8623432', '6901865', '8623433', '6901866', '8112883', '8623434', '6901867', '8112884', '8623435', '6901868', '8112885', '8623436', '6901869', '8112886', '8623437', '6901870', '8112887', '8623438', '6901871', '8112888', '8623439', '6901872', '8112889', '8623440', '6901873', '8112890', '8623441', '6901874', '8112891', '8623442', '6901875', '8623443', '6901876', '8623444', '6901877', '8623445', '6901878', '8623446', '6901879', '8623447', '6901880', '8623448', '6901881', '8623449', '6901882', '8623450', '6901883', '8623451', '6901884', '8623452', '6901885', '8112892', '8623453', '6901900', '8623681', '6901901', '8623682', '6901902', '8113045', '8623683', '6901903', '8623687', '6901904', '8623689', '6901906', '8113058', '8623698', '6901907', '8113059', '8623699', '6901908', '8113060', '8623700', '6901909', '8113061', '8623701', '6901910', '8623702', '6901911', '8113062', '8623703', '6901912', '8623706', '6901913', '8623709', '6901914', '8623710', '6901915', '8623711', '6901916', '8623714', '6901917', '8623720', '6901918', '8623721', '6901919', '8623723', '6901968', '8113446', '8624245', '6901992', '8624675', '6901993', '8624676', '6901994', '8113788', '8624677', '6901995', '8624678', '6901996', '8624679', '6901997', '8624680', '6901998', '8113789', '8624681', '6901999', '8624682', '6902000', '8624683', '6902001', '8624684', '6902003', '8624728', '6902004', '8624729', '6902005', '8624734', '6902006', '8624736', '6902007', '8624737', '6902010', '8624807', '6902011', '8624810', '6902012', '8624815', '6902013', '8624816', '6902014', '6902015', '8624817', '6902016', '8624818', '6902017', '8624819', '6902018', '8624820', '6902023', '8624904', '6902039', '6902040', '6902041', '6902042', '6902067', '6902073', '6902075', '6902100', '6902113', '6902114', '6902115', '6902116', '6902117')
SELECT * FROM EMPRESAS_CLIENTES EC WHERE EC.ID=749;
SELECT * FROM EMPRESAS_CLIENTES_BEPSA ECB WHERE ECB.ID=749;
SELECT * FROM public.EMPRESAS_CLIENTES EC WHERE EC.ID_INTERNO='12300';
SELECT * FROM public.COMERCIOS C WHERE C.EMPRESA_CLIENTE_ID IN ('bc7711b5-9338-46e5-a8ea-395f47458f14', '87523d23-97ae-46f4-b222-79494fce94d4')

---hallar v1 BASE DE DATOS PAGO DIGITAL
select c.id as v1Id, c.* from PAGOS_DIGITALES_DB.public.comercios c where c.cybersource_merchant_id  = 'dinelco_002692900046';

--inactivar activar comercio 3ds
SELECT * from public.COMERCIOS C WHERE C.ID_INTERNO='5500339';
--se busca el idinterno y con su id en merchands
SELECT * FROM public.MERCHANTS M WHERE M.V1_ID='91e96aae-c7fb-423b-9360-18c8e1a99639';

select operacion_fech_trans, * from busdatos_transacciones bt where bt.operacion_rrnbepsa in ('503643911066', '565503562473');

select * from sucursales_bepsa_db2 sbd where sbd.cocomer_pago_digital like '%5700268%';
-- update sucursales_bepsa_db2 set cocomer_pago_digital = '5700268' where cocomer_pago_digital like '%5700268%';

select * from payer_auth_results par join merchants m ON m.id = par.merchat_id where m.v1_id = 'ef0c8ca9-b573-42b7-a306-d7271f166465' and par.created_at > '2025-03-12'

select * from comercios c where nombre like '%EPEM%';
select * from comercios c where nombre like '%MF%';
select * from ordenes_pago op where op.COMERCIO_ID = 'fc348bf4-043d-42ff-b06f-5f3a677066c0' AND op.ESTADO='NUEVO';
---reporte solicitudes de acceso
SELECT OAR.USER_NAME NOMBRE, OAR.USER_LASTNAME APELLIDO, OAR.DOCUMENT_NUMBER DOCUMENTO, OAR.USER_CELLPHONE TELEFONO,
OAR.USER_EMAIL CORREO, OAR.COMPANY_RUC RUC, ECB.DESCRIPCION_BEPSA RAZON_SOCIAL, OAR.REQUEST_STATUS ESTADO, OAR.CREATED_AT FEHCA_HORA_SOLICITUD
       FROM public.ONBOARDING_ACCESS_REGISTRATION OAR
INNER JOIN PUBLIC.EMPRESAS_CLIENTES EC ON EC.ID = OAR.EMPRESA_ID
INNER JOIN PUBLIC.EMPRESAS_CLIENTES_BEPSA ECB ON ECB.ID = EC.EMPRESA_CLIENTE_BEPSA_ID;

SELECT * FROM public.ONBOARDING_ACCESS_REGISTRATION OAR;

-- LISTAR TRX PARA ADELNATO
select bt.operacion_fech_proc_transaccio::text as operacion_fech_proc_transaccio, "bt"."operacion_fech_insercion",
"bt"."operacion_fech_trans", trim(bt.operacion_rrnbepsa) as operacion_rrnbepsa, "bt"."operacion_cod_comercio",
"bt"."operacion_denom_comercial", "bt"."operacion_cod_sucursal", "bt"."operacion_desc_sucursal",
"bt"."operacion_cod_marc_tarjeta", "bt"."operacion_cod_servicio", "bt"."operacion_tip_uso_tarjeta",
"bt"."operacion_est_reversa", "bt"."operacion_cod_retorno", "bt"."operacion_est_fn_transaccion", *
from "busdatos_transacciones" as "bt"
where
"bt"."operacion_est_reversa" = 'N'
and "bt"."operacion_tip_uso_tarjeta" = 'C'
and "bt"."operacion_cod_servicio" = 'COMPRA'
and "bt"."operacion_cod_retorno" = '00'
and "bt"."operacion_est_fn_transaccion" = 'A'
and "bt"."operacion_cod_comercio" = '52'
and "bt".operacion_fech_proc_transaccio >= current_date
and "bt"."operacion_cod_sucursal" = '1'
-- and "bt"."operacion_rrnbepsa" in ('501132556975', '501132742637', '501132549982', '501132574572');
-- and "bt"."operacion_rrnbepsa" not in ('501132556975', '501132742637') -- rrns que esten en la tabla advance_accreditations con misma fecha de proceso
order by "operacion_fech_trans" ASC limit 5;


SELECT * FROM public.BUSDATOS_TRANSACCIONES BT WHERE BT.OPERACION_RRNBEPSA
IN ('508164120109', '508163898611', '508163941024', '508164005264', '508163917629', '508163928827', '508163949701', '508163966188', '508163941823', '508163821027', '508164040912', '508163975302', '508163902790', '508163914643', '508164234089', '508163926148', '508163939247', '508164127670', '508163986868', '508163977923', '508164215554', '508163973533', '508163979775', '508164140192', '508163969039', '508164134961', '568104038181')
;

select * from empresas_clientes ec
join empresas_clientes_bepsa ecb on ecb.id = ec.empresa_cliente_bepsa_id
join comercios c on c.empresa_cliente_id = ec.id
join sucursales s on s.comercio_id = c.id
join sucursales_bepsa_db2 sbd on sbd.id = s.sucursal_bepsa_db2_id
where ecb.cod_cliente_bepsa = '24625';

select * from ordenes_pago where referencia = 'COMPANIA-ADMINISTRADORA-DE-RIESGOS-SA-CARSA-CI-4840284-CUOTA-10225-1';
select * from ordenes_pago where referencia ilike '%COMPANIA-ADMINISTRADORA-DE-RIESGOS-SA-CARSA-CI%';

SELECT * FROM public.COMERCIOS C WHERE C.EMPRESA_CLIENTE_ID_INTERNO='16948';  --WHERE C.CYBERSOURCE_MERCHANT_ID IN ('dinelco_001694800004','dinelco_link_001694800001');

alter table auditoria disable trigger tbu_auditoria_modificado_el;

SELECT * FROM public.COMERCIOS C WHERE DATE(C.MODIFICADO_EL)='2025-04-03';
SELECT * FROM public.COMERCIOS C WHERE C.EMPRESA_CLIENTE_ID_INTERNO='10937' AND C.ID='e71e4abf-68d8-41c9-881f-d80659be3c5f';

--query para obtener comercio
SELECT "id", "id_interno", "empresa_cliente_id", "empresa_cliente_id_interno", "activo", "nombre",
       "cybersource_merchant_id", "cs_main_merchant_id"
FROM "comercios"
WHERE "activo" <> FALSE
AND "empresa_cliente_id_interno" = '16948' ; --limit 1;


select
	datid, usename, wait_event_type, wait_event, state,	query, datname,	pid, usesysid, usename,	application_name, backend_xmin,
	client_addr, client_hostname, client_port, backend_start, xact_start, query_start, state_change, backend_xid, backend_type
	--,pg_terminate_backend(pg_stat_activity.pid)
from
	pg_stat_activity
where
	datname = 'pocodi_db'
	and pid <> pg_backend_pid()
	--and state <> 'active'
	--AND usename = 'usr_portal'
order by state;
SELECT pg_terminate_backend(1030354);

select op.*, '|--|' separator, c.* from ordenes_pago op
join comercios c on c.id::uuid = op.comercio_id::uuid
where op.fecha_estado > '2025-03-30'
and c.id_interno in ('5500396','6901752','5500339');


SELECT * FROM PAGOS_DIGITALES_DB.PUBLIC.COMERCIOS C WHERE C.EMPRESA_CLIENTE_ID_INTERNO='10736';--dinelco_checkout

select  c.nombre, c.id_interno,  s.*
FROM public.suscripciones s, public.empresas_clientes c
where s.empresa_cliente_id = c.id;

Delete from usuarios where id = 'dd837269-1ace-4754-a5f2-256b698bf293';