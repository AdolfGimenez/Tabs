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

SELECT * FROM GXWEB.OPMOVI WHERE OPNOREF IN ('111455506987','111956910957','111956880525','111856385481')

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
SELECT * FROM public.ROLES_X_USUARIOS RXU WHERE RXU.USUARIO_ID='03c8162a-6b45-4339-9484-4d2e8dacd24d';

--permiso fabi
--INSERT INTO public.roles_x_usuarios (id, rol_id, usuario_id, insertado_el, modificado_el, activo, insertado_por, modificado_por) VALUES (4910, 125, '03c8162a-6b45-4339-9484-4d2e8dacd24d', '2024-03-18 17:00:28.110074', '2024-03-18 17:00:28.110074', true, '6bb47ab6-0ea7-48e8-b5b2-76438104f674', null);

INSERT INTO
    public.roles_x_usuarios (rol_id, usuario_id, insertado_el, modificado_el, activo, insertado_por, modificado_por) VALUES ( 1, 'bdaf16f0-d93c-4414-978a-ae1e8fd3b981', '2023-07-22 14:47:44.997312', '2023-07-22 14:47:44.997312', true, null, null);
--AUTH_DB
SELECT * FROM EQWEDI_AUTH_DB.PUBLIC.USUARIOS U WHERE U.NRO_DOCUMENTO='3319151'
U.CORREO LIKE 'vayala@bepsa.com.py';

SELECT t.* FROM public.refresh_tokens t WHERE t.USUARIO_ID='8b3e942c-abc7-45a9-9f53-c240e4020352';
SELECT * FROM public.GRUPOS_ACCESOS_APIS_X_USUARIOS GAAXU WHERE GAAXU.USUARIO_ID='feafa23e-c9ef-43cd-bb91-fd5328344806';
--POCODI_DB
SELECT * FROM public.PERSONAS_FISICAS PF where upper(apellido) = 'BENITEZ'; --PF.NRO_DOCUMENTO='3319151'
SELECT * FROM public.USUARIOS U WHERE U.PERSONA_FISICA_ID IN (962);

SELECT * FROM public.SOCKET_CLIENTS SC WHERE SC.USUARIO_ID='8b3e942c-abc7-45a9-9f53-c240e4020352';
SELECT * FROM correos_principales_usuarios WHERE USUARIO_ID='8b3e942c-abc7-45a9-9f53-c240e4020352';
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
  AND BUSDATOS_TRANSACCIONES.OPERACION_FECH_TRANS BETWEEN '2024-09-01 00:00:00.000' AND '2024-10-07 23:59:59.999' -- Ejemplo de fecha
  AND BUSDATOS_TRANSACCIONES.OPERACION_COD_COMERCIO = '11735'                                                     -- Ejemplo de código de comercio
--AND busdatos_transacciones.OPERACION_RRNBEPSA='427384150745'
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

SELECT BT.OPERACION_FECH_PROC_TRANSACCIO, BT.* FROM public.BUSDATOS_TRANSACCIONES BT WHERE BT.OPERACION_RRNBEPSA='427384150745';

SELECT * FROM public.COMERCIOS C WHERE C.NOMBRE LIKE '%MONITAL%';
------casos de suscription key _*****_
SELECT * FROM public.COMERCIOS C WHERE C.NOMBRE LIKE '%MONITAL%';
SELECT * FROM public.EMPRESAS_CLIENTES EC WHERE EC.PAGO_DIGITAL_SUSCRIPCION_KEY ISNULL;
UPDATE public.EMPRESAS_CLIENTES EC SET PAGO_DIGITAL_SUSCRIPCION_KEY='_*****_' WHERE EC.PAGO_DIGITAL_SUSCRIPCION_KEY ISNULL;

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
WHERE ECB.COD_CLIENTE_BEPSA IN ('11654');

SELECT * FROM public.SUCURSALES_BEPSA_DB2 S WHERE S.CLIENTE_BEPSA_ID=722;

--sucursales y comercios
SELECT *
FROM SUCURSALES S
         INNER JOIN COMERCIOS C ON S.COMERCIO_ID = C.ID
         INNER JOIN EMPRESAS_CLIENTES EC ON C.EMPRESA_CLIENTE_ID = EC.ID
         INNER JOIN EMPRESAS_CLIENTES_BEPSA ECB ON EC.EMPRESA_CLIENTE_BEPSA_ID = ECB.ID
WHERE ECB.COD_CLIENTE_BEPSA IN ('12300')
ORDER BY SUCURSAL_BEPSA_DB2_ID;
----ver empresa
SELECT ECB.COD_CLIENTE_BEPSA, EC.*
FROM EMPRESAS_CLIENTES EC
         INNER JOIN PERSONAS P ON EC.PERSONA_ID = P.ID
--inner join personas_fisicas p1 on p1.persona_id = p.id
         INNER JOIN PERSONAS_JURIDICAS P1 ON P1.PERSONA_ID = P.ID
         INNER JOIN PUBLIC.EMPRESAS_CLIENTES_BEPSA ECB ON ECB.ID = EC.EMPRESA_CLIENTE_BEPSA_ID
WHERE P1.RUC_NORMALIZADO IN ('80050172-1');
-------------VER COMERCIOS
SELECT * FROM public.COMERCIOS C WHERE C.EMPRESA_CLIENTE_ID=749;
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

-----------------
--AGREGAR SUPSCRIPCION | AUT
SELECT * FROM public.EMPRESAS_CLIENTES EC WHERE EC.NOMBRE LIKE '%Sere%';
SELECT * FROM public.EMPRESAS_CLIENTES EC WHERE EC.ID_INTERNO='12300';