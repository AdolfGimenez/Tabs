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
SELECT * FROM USUARIOS U WHERE correo LIKE 'fanazco@%';
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

SELECT
    pf.PERSONA_ID, PF.NOMBRE, PF.APELLIDO, PF.NRO_DOCUMENTO, ECB.COD_CLIENTE_BEPSA, ECB.DESCRIPCION_BEPSA, EC.CORREO_COMERCIO, PF.ACTIVO
FROM public.ROLES_X_USUARIOS RXU
        INNER JOIN public.USUARIOS U on u.id = rxu.usuario_id
        INNER JOIN PUBLIC.PERSONAS_FISICAS PF ON PF.ID = U.PERSONA_FISICA_ID
        INNER JOIN PUBLIC.ROLES R ON R.ID = RXU.ROL_ID
        INNER JOIN PUBLIC.EMPRESAS_CLIENTES EC ON EC.ID = R.EMPRESA_CLIENTE_ID
        INNER JOIN PUBLIC.EMPRESAS_CLIENTES_BEPSA ECB ON ECB.ID = EC.EMPRESA_CLIENTE_BEPSA_ID
WHERE RXU.ROL_ID IN (39, 122, 125, 1, 123, 77, 113, 6, 106) AND R.CODIGO_SERVICIO='PC_CLI';

SELECT * FROM public.EMPRESAS_CLIENTES EC WHERE id IN (4, 19, 187);
SELECT * FROM public.EMPRESAS_CLIENTES_BEPSA ECB WHERE ECB.COD_CLIENTE_BEPSA IN ('12730','12733');

SELECT * FROM public.ROLES R;
SELECT * FROM public.ROLES_X_USUARIOS RXU WHERE RXU.USUARIO_ID='03c8162a-6b45-4339-9484-4d2e8dacd24d';

--permiso fabi
--INSERT INTO public.roles_x_usuarios (id, rol_id, usuario_id, insertado_el, modificado_el, activo, insertado_por, modificado_por) VALUES (4910, 125, '03c8162a-6b45-4339-9484-4d2e8dacd24d', '2024-03-18 17:00:28.110074', '2024-03-18 17:00:28.110074', true, '6bb47ab6-0ea7-48e8-b5b2-76438104f674', null);

INSERT INTO
    public.roles_x_usuarios (rol_id, usuario_id, insertado_el, modificado_el, activo, insertado_por, modificado_por) VALUES ( 1, 'bdaf16f0-d93c-4414-978a-ae1e8fd3b981', '2023-07-22 14:47:44.997312', '2023-07-22 14:47:44.997312', true, null, null);

SELECT * FROM EQWEDI_AUTH_DB.PUBLIC.USUARIOS U WHERE U.CORREO LIKE '%contabilidad.baldone@gmail.com%';

SELECT * FROM POCODI_DB.PUBLIC.USUARIOS U WHERE U.ID='7a0d60bc-f813-4ac4-9649-876286e501b1';
SELECT CPF.* FROM public.USUARIOS U
         WHERE U.ID='7a0d60bc-f813-4ac4-9649-876286e501b1';

SELECT * FROM public.CORREOS_PRINCIPALES_USUARIOS CPU WHERE CPU.USUARIO_ID='7b2c14ad-3824-461b-b3df-1067ede848e5';
SELECT * FROM PUBLIC.CORREOS_PERSONAS_FISICAS CPF;
SELECT * FROM PUBLIC.PERSONAS_FISICAS PF ;
SELECT * FROM public.ROLES R WHERE R.NOMBRE ILIKE '%admin%';

SELECT RXU.USUARIO_ID, R.NOMBRE, P.NOMBRE_NORMALIZADO, ECB.COD_CLIENTE_BEPSA, S.NOMBRE SUCURSAL, C.NOMBRE COMERCIO, GE.NOMBRE G_EMPRESARIAL
    FROM public.ROLES R
    LEFT JOIN PUBLIC.ROLES_X_USUARIOS RXU ON R.ID = RXU.ROL_ID
    LEFT JOIN PUBLIC.USUARIOS_X_COMERCIOS UXC oN RXU.USUARIO_ID = UXC.USUARIO_ID
    LEFT JOIN PUBLIC.USUARIOS_X_EMPRESAS UXE oN RXU.USUARIO_ID = UXE.USUARIO_ID
    LEFT JOIN public.USUARIOS_X_SUCURSALES UXS oN RXU.USUARIO_ID = UXS.USUARIO_ID
    LEFT JOIN PUBLIC.USUARIOS_X_GRUPOS_EMPRESARIALES UXGE ON RXU.USUARIO_ID = UXGE.USUARIO_ID
    LEFT JOIN PUBLIC.EMPRESAS_CLIENTES EC ON EC.ID = R.EMPRESA_CLIENTE_ID
    LEFT JOIN public.SUCURSALES S ON S.ID = UXS.SUCURSAL_ID
    LEFT JOIN PUBLIC.COMERCIOS C ON (C.ID = S.COMERCIO_ID OR C.ID = UXC.COMERCIO_ID)
    LEFT JOIN PUBLIC.GRUPOS_EMPRESARIALES GE ON UXGE.GRUPO_EMPRESARIAL_ID = GE.ID
    LEFT JOIN public.PERSONAS P ON EC.PERSONA_ID = P.ID
    LEFT JOIN public.EMPRESAS_CLIENTES_BEPSA ECB ON EC.EMPRESA_CLIENTE_BEPSA_ID = ECB.ID
WHERE R.NOMBRE ILIKE '%admin%';
--transacciones
SELECT * FROM busdatos_transacciones WHERE busdatos_transacciones.OPERACION_RRNBEPSA='466206130451';