----------RESUMEN PARA BCP-EMPE----------
SELECT FECHA_OPERACION,
       EMPRE_ORIGEN,
       EMPRE_DESTINO,
       ESTADO,
       COUNT(*)     CANTIDAD,
       SUM(IMPORTE) TOTAL,
       CODIGO_RESPUESTA,
       MENSAJE_ERROR
FROM PUBLIC.TRANSACCION
WHERE FECHA_COMERCIAL BETWEEN '2022-03-16' AND '2022-03-16' --and estado ='Aprobado'
GROUP BY FECHA_OPERACION, EMPRE_ORIGEN, EMPRE_DESTINO, ESTADO, CODIGO_RESPUESTA, MENSAJE_ERROR
ORDER BY FECHA_OPERACION, EMPRE_ORIGEN, EMPRE_DESTINO;

SELECT *
FROM PUBLIC.TRANSACCION;
/*Resumen de transacciones - Conciliador*/
SELECT FECHA_OPERACION,
       EMPRE_ORIGEN,
       EMPRE_DESTINO,
       ESTADO,
       COUNT(*)     CANTIDAD,
       SUM(IMPORTE) TOTAL,
       CODIGO_RESPUESTA,
       MENSAJE_ERROR
FROM PUBLIC.TRANSACCION
WHERE FECHA_COMERCIAL = '2022-09-09'
GROUP BY FECHA_OPERACION, EMPRE_ORIGEN, EMPRE_DESTINO, ESTADO, CODIGO_RESPUESTA, MENSAJE_ERROR
ORDER BY EMPRE_ORIGEN, EMPRE_DESTINO;

/*Resumen de transacciones - Switch*/
SELECT FECHA_CREACION, EMPRE_ORIGEN, EMPRE_DESTINO, ESTADO, COUNT(*) CANTIDAD, SUM(IMPORTE) TOTAL, CODIGO_RESPUESTA, MENSAJE_ERROR
FROM PUBLIC.TRANSACCION
WHERE FECHA_CREACION >= '2025-07-23 21:00:00'
  AND FECHA_CREACION <= '2025-07-23 23:59:59'
GROUP BY FECHA_CREACION, EMPRE_ORIGEN, EMPRE_DESTINO, ESTADO, CODIGO_RESPUESTA, MENSAJE_ERROR
ORDER BY FECHA_CREACION,EMPRE_ORIGEN, EMPRE_DESTINO;

----CONCILIADOR--------
SELECT COUNT(*) CANTIDAD_TRX--, fecha_creacion, fecha_comercial
FROM PUBLIC.TRANSACCION
WHERE FECHA_COMERCIAL = '2024-12-30'
GROUP BY FECHA_CREACION, FECHA_COMERCIAL
ORDER BY FECHA_CREACION ASC;

-------SWICHT----------
SELECT COUNT(*) CANTIDAD_TRX, DATE(FECHA_CREACION)
FROM PUBLIC.TRANSACCION
WHERE FECHA_CREACION >= '2025-05-11 23:59:00'
  AND FECHA_CREACION <= '2025-05-12 23:59:59'
GROUP BY DATE(FECHA_CREACION)
ORDER BY DATE ASC;
---#######################################################################################################################################################################################---
SELECT *
FROM PUBLIC.TRANSACCION
WHERE ID_EMPRE_ORIGEN IN ('446285061');
SELECT ID,
       ID_EMPRE_ORIGEN,
       EMPRE_ORIGEN,
       NUMERO_ORIGEN,
       EMPRE_DESTINO,
       NUMERO_DESTINO,
       IMPORTE,
       FECHA_OPERACION,
       HORA_OPERACION,
       CODIGO_RESPUESTA,
       MENSAJE_ERROR,
       NUMERO_AUTORIZACION,
       FECHA_CREACION,
       FECHA_LIQUIDACION
FROM PUBLIC.TRANSACCION
WHERE EMPRE_DESTINO = '0009'
--where  id in ('100000751539')
    WHERE NUmero_autorizacion IN ('446285061');
--where fecha_operacion='25052021' and importe='50000' and hora_operacion between '083000' and '084000' and empre_origen='0007' and empre_destino='0005'

--where empre_origen='0005' and empre_destino='0008' and codigo_respuesta='13'

SELECT *
FROM PARAMETROS_CONFIGURACION
WHERE CODIGO = 'TS';

SELECT FECHA_OPERACION FECHA,
       HORA_OPERACION  HORA,
       ID,
       ID_EMPRE_ORIGEN,
       EMPRE_ORIGEN,
       NUMERO_ORIGEN,
       EMPRE_DESTINO,
       NUMERO_DESTINO,
       IMPORTE,
       CODIGO_RESPUESTA,
       ESTADO,
       NUMERO_AUTORIZACION,
       MENSAJE_ERROR,
       FECHA_CREACION
FROM PUBLIC.TRANSACCION
WHERE NUMERO_ORIGEN LIKE '%982201781'
  AND NUMERO_DESTINO LIKE '%991348592' --and fecha_creacion like '2021-06-21%'
--WHERE fecha_operacion='14092021'
ORDER BY FECHA_OPERACION DESC, HORA_OPERACION DESC;


SELECT *
FROM PUBLIC.EMPE;

SELECT *
FROM PARAMETROS_CONFIGURACION;

SELECT *
FROM PUBLIC.TRANSACCION
WHERE DATE(FECHA_CREACION) = '2023-03-27'
  AND NUMERO_ORIGEN = '00000000595985334460';
WHERE id IN ('100002959365','100002959373');
--where id='100001227662'
 --where importe = '200000'
WHERE fecha_operacion = '25032023'
AND numero_destino ='00000000595975655251'
AND numero_origen='00000000595994779318'
--and empre_origen='0005' and empre_destino='0008'
--where fecha_operacion='28032022'
 ORDER BY hora_operacion DESC;
/*
0005	TIGO	    http://vproxy-osb12.telecel.net.py/osb/Interoperabilidad/METODO/V1?wsdl
0007	PERSONAL	http://10.150.16.10/bepsa-wrapper-ejb/BepsaWrapper?wsdl
0008	CLARO	    http://10.106.13.11/EmpeWebService/services/SwitchClaro?wsdl
0009	ZIMPLE	    http://10.0.200.37:8080/mibi/zimple-ws/ZimpleService?wsdl
0010	WALLY	    https://interop.netelparaguay.com.py/wally-ws/WallyService?wsdl	*/
--------------------------------------------------------------------------------------------------
--comisionado en conciliacion
SELECT /*empre_destino, sum(importe)*/--substr(fecha_operacion,5,4)||substr(fecha_operacion,3,2)||substr(fecha_operacion,1,2),
-- hora_operacion, numero_autorizacion,'D',substr(fecha_operacion,1,4)||substr(fecha_operacion,6,2)||substr(fecha_operacion,9,2),'06','06',importe, '600', empre_destino, empre_origen, id, estado_procesado
*
FROM PUBLIC.TRANSACCION
WHERE EMPRE_DESTINO = '0007'
  AND FECHA_COMERCIAL = '2023-03-27'
  AND ESTADO_PROCESADO = 'Comisionado'
GROUP BY EMPRE_DESTINO;

SELECT EMPRE_ORIGEN, SUM(IMPORTE)--substr(fecha_operacion,5,4)||substr(fecha_operacion,3,2)||substr(fecha_operacion,1,2), hora_operacion, numero_autorizacion,'D',substr(fecha_operacion,1,4)||substr(fecha_operacion,6,2)||substr(fecha_operacion,9,2),'06','06',importe, '600', empre_destino, empre_origen, id, estado_procesado
FROM PUBLIC.TRANSACCION
WHERE EMPRE_ORIGEN = '0007'
  AND FECHA_COMERCIAL = '2023-03-27'
  AND ESTADO_PROCESADO = 'Comisionado'
GROUP BY EMPRE_ORIGEN
UNION
SELECT EMPRE_DESTINO, SUM(IMPORTE)--substr(fecha_operacion,5,4)||substr(fecha_operacion,3,2)||substr(fecha_operacion,1,2), hora_operacion, numero_autorizacion,'D',substr(fecha_operacion,1,4)||substr(fecha_operacion,6,2)||substr(fecha_operacion,9,2),'06','06',importe, '600', empre_destino, empre_origen, id, estado_procesado
FROM PUBLIC.TRANSACCION
WHERE EMPRE_DESTINO = '0007'
  AND FECHA_COMERCIAL = '2023-03-27'
  AND ESTADO_PROCESADO = 'Comisionado'
GROUP BY EMPRE_DESTINO;

---detalle conciliaci�n
SELECT SUBSTR(FECHA_OPERACION, 5, 4) || SUBSTR(FECHA_OPERACION, 3, 2) || SUBSTR(FECHA_OPERACION, 1, 2) FECHA
     , HORA_OPERACION                                                                                  HORA
     , NUMERO_AUTORIZACION                                                                             AUTORIZACION
     , 'D'                                                                                             TIPO
     , '20230327'                                                                                      FECHA_COMERCIAL
     , '06'                                                                                            OPERACION
     , '06'                                                                                            CLASE
     , IMPORTE
     , '600'                                                                                           MONEDA
     , EMPRE_DESTINO                                                                                   DESTINO
     , SUBSTR(EMPRE_ORIGEN, 2, 3)                                                                      ORIGEN
     , ID
     , ESTADO_PROCESADO
FROM PUBLIC.TRANSACCION
WHERE FECHA_COMERCIAL = '2023-03-27'
  AND ESTADO_PROCESADO = 'Comisionado'
ORDER BY ID;

SELECT *
FROM PUBLIC.TRANSACCION
WHERE FECHA_OPERACION = '07102024'
  AND EMPRE_ORIGEN = '0008';

SELECT *
FROM PUBLIC.TRANSACCION
WHERE FECHA_OPERACION = '12102023'
  AND HORA_OPERACION >= '231000'
  AND EMPRE_DESTINO = '0008';

SELECT *
FROM PUBLIC.USUARIO U;
SELECT *
FROM PUBLIC.ROL R;
SELECT *
FROM PUBLIC.ROL_PERMISO RP;
SELECT *
FROM PUBLIC.PERMISO P;

SELECT *
FROM EMPE E;

SELECT *
FROM PUBLIC.TRANSACCION T
WHERE T.FECHA_OPERACION >= '21112023'
  AND T.IMPORTE = '100000';


SELECT *
FROM PUBLIC.PARAMETROS_CONFIGURACION PC;
---------------

SELECT *
FROM PUBLIC.TRANSACCION T
WHERE T.FECHA_OPERACION = '' WHERE t.fecha_comercial IN ('2024-02-12','2024-02-13','2024-02-14','2024-02-15','2024-02-16');


SELECT *
FROM PUBLIC.TRANSACCION T
WHERE T.FECHA_COMERCIAL = '2024-09-24'
  AND ESTADO = 'Aprobado';
--rollback
UPDATE PUBLIC.TRANSACCION
SET ESTADO_PROCESADO  = 'Pendiente',
    ID_SUMARIZACION   = NULL,
    COMISION          = 0,
    ESTADO_SUMARIZADO = NULL
WHERE ESTADO = 'Aprobado'
  AND FECHA_COMERCIAL >= '2025-02-01';
--- AND FECHA_COMERCIAL = TO_DATE((SELECT PC.VALOR FROM PARAMETROS_CONFIGURACION PC WHERE PC.NOMBRE = 'FC_ANTERIOR'), 'DD-MM-YYYY')

--TRUNCATE TABLE public.LIQUIDACION;

DELETE
FROM LIQUIDACION
WHERE FECHA_COMERCIAL >= '2025-01-17';
--where fecha_comercial = TO_DATE((SELECT pc.valor FROM parametros_configuracion pc WHERE pc.nombre = 'FC_ANTERIOR'), 'DD-MM-YYYY')

SELECT *
FROM PUBLIC.PARAMETROS_CONFIGURACION PC;

SELECT *
FROM PUBLIC.LIQUIDACION L
ORDER BY FECHA_COMERCIAL DESC;

SELECT *
FROM PUBLIC.COMISION C;
CREATE TABLE CONCILIADOR.PUBLIC.BK_EMPES AS (SELECT *
                                             FROM PUBLIC.EMPE E);

SELECT *
FROM PUBLIC.EMPE E;
SELECT *
FROM PUBLIC.PARAMETROS_CONFIGURACION PC
WHERE PC.CODIGO LIKE 'MAIL%'
-------------
SELECT COUNT(*)
FROM PUBLIC.TRANSACCION T
WHERE T.FECHA_COMERCIAL = '2025-02-10';
SELECT *
FROM SWITCH.PUBLIC.TRANSACCION T
WHERE DATE(FECHA_CREACION) = '2024-12-29';

SELECT *
FROM PUBLIC.USUARIO U; --WHERE U.ID(63);
SELECT *
FROM PUBLIC.ROL R;
SELECT *
FROM PUBLIC.ROL_PERMISO RP;

SELECT SUM(T.IMPORTE)
FROM PUBLIC.TRANSACCION T
WHERE T.FECHA_COMERCIAL = '2025-01-20'
  AND T.EMPRE_ORIGEN = '0005'
  AND T.ESTADO = 'Rechazado';


SELECT COUNT(*)
FROM PUBLIC.LIQUIDACION L
WHERE FECHA_COMERCIAL = '2025-01-30';

SELECT *
FROM PUBLIC.TRANSACCION T
WHERE T.NUMERO_AUTORIZACION = '792717695'; --100005526957
SELECT *
FROM PUBLIC.TRANSACCION T
WHERE T.CODIGO_RESPUESTA <> '0';
------------------------------
--caso cambio de horario
--Switch
SELECT (T.FECHA_CREACION + INTERVAL '1 hour')                      FECHA_CREACION,
       TO_CHAR((T.FECHA_CREACION + INTERVAL '1 hour'), 'DDMMYYYY') FECHA_OPERACION,
       TO_CHAR((T.FECHA_CREACION + INTERVAL '1 hour'), 'hh24miss') HORA_OPERACION,
       TO_CHAR((T.FECHA_CREACION + INTERVAL '1 hour'), 'DDMMYYYY') FECHA_LIQUIDACION,
       (T.FECHA_ACTUALIZACION + INTERVAL '1 hour')                 FECHA_ACTUALIZACION,
       (T.FECHA_ENVIO + INTERVAL '1 hour')                         FECHA_ENVIO,
       T.*
FROM PUBLIC.TRANSACCION T
WHERE T.ID BETWEEN 100005662530 AND 100005667165
ORDER BY T.ID;

UPDATE PUBLIC.TRANSACCION
SET FECHA_OPERACION     = TO_CHAR((FECHA_CREACION + INTERVAL '1 hour'), 'DDMMYYYY'),
    HORA_OPERACION      = TO_CHAR((FECHA_CREACION + INTERVAL '1 hour'), 'hh24miss'),
    FECHA_LIQUIDACION   = TO_CHAR((FECHA_CREACION + INTERVAL '1 hour'), 'DDMMYYYY'),
    FECHA_CREACION      = (FECHA_CREACION + INTERVAL '1 hour'),
    FECHA_ACTUALIZACION = (FECHA_ACTUALIZACION + INTERVAL '1 hour'),
    FECHA_ENVIO         = (FECHA_ENVIO + INTERVAL '1 hour')
WHERE ID BETWEEN 100005662530 AND 100005667165;

--Para verificar cantidades en el switch
SELECT COUNT(*) CANTIDAD_TRX, DATE(FECHA_CREACION)
FROM PUBLIC.TRANSACCION
WHERE FECHA_CREACION >= '2025-03-24 19:00:00' /* fecha anterior*/
  AND FECHA_CREACION < '2025-03-25 19:00:00' ---fecha actual
GROUP BY DATE(FECHA_CREACION)
ORDER BY DATE ASC;

--Conciliador
UPDATE PUBLIC.TRANSACCION
SET FECHA_OPERACION     = TO_CHAR((FECHA_CREACION + INTERVAL '1 hour'), 'DDMMYYYY'),
    HORA_OPERACION      = TO_CHAR((FECHA_CREACION + INTERVAL '1 hour'), 'hh24miss'),
    FECHA_LIQUIDACION   = TO_CHAR((FECHA_CREACION + INTERVAL '1 hour'), 'DDMMYYYY'),
    FECHA_CREACION      = (FECHA_CREACION + INTERVAL '1 hour'),
    FECHA_ACTUALIZACION = (FECHA_ACTUALIZACION + INTERVAL '1 hour')
WHERE ID BETWEEN 100005662530 AND 100005667165;

SELECT ID, T.*
FROM PUBLIC.TRANSACCION T
WHERE FECHA_CREACION >= '2025-03-24 19:00:00'
  AND FECHA_CREACION < '2025-03-25 19:00:00'
  AND FECHA_COMERCIAL = '2025-03-25'
ORDER BY 1;

----query noc para ver casos del cierre
---------------Conciliador---------------
--Verificacion de trx en conciliador
SELECT COUNT(*) CANTIDAD_TRX, DATE(FECHA_CREACION)
FROM PUBLIC.TRANSACCION
WHERE FECHA_COMERCIAL = '2025-03-24' --fecha actual
GROUP BY DATE(FECHA_CREACION)
ORDER BY DATE ASC;


--Para buscar las transacciones de diferencia entre conciliador y switch
SELECT *
FROM PUBLIC.TRANSACCION
WHERE FECHA_COMERCIAL = '2025-03-25'          --proximo dia habil
  AND FECHA_CREACION >= '2025-03-24 18:00:00' --fecha actual
  AND FECHA_CREACION <= '2025-03-24 19:00:00';
--fecha actual

-----VER ESTADO SUMARIZADO-----
SELECT *
FROM PUBLIC.TRANSACCION
WHERE FECHA_COMERCIAL = '2025-03-24' --fecha actual
  AND ESTADO = 'Aprobado';
--and estado_sumarizado ='Sumarizado'

-----CONTADOR DE TRX-----
SELECT COUNT(*) CANTIDAD_TRX
FROM PUBLIC.TRANSACCION
WHERE FECHA_COMERCIAL = '2025-03-24';

------PARA VERIFICAR LOS CORREOS A LOS CUALES VAN LOS INFORMES-----
SELECT *
FROM PUBLIC.EMPE;

-----CONTROL DE CORREO-----
SELECT EMPRE_ORIGEN, NOMBRE, SUM(IMPORTE) MONTO_ENVIADO
FROM PUBLIC.TRANSACCION
         INNER JOIN PUBLIC.EMPE ON CODIGO = EMPRE_ORIGEN
WHERE FECHA_COMERCIAL = '2025-03-10'
  AND ESTADO = 'Aprobado'
GROUP BY EMPRE_ORIGEN, NOMBRE;
SELECT EMPRE_DESTINO, NOMBRE, SUM(IMPORTE) MONTO_RECIBIDO
FROM PUBLIC.TRANSACCION
         INNER JOIN PUBLIC.EMPE ON CODIGO = EMPRE_DESTINO
WHERE FECHA_COMERCIAL = '2025-03-24'
  AND ESTADO = 'Aprobado'
GROUP BY EMPRE_DESTINO, NOMBRE;
----------- NO APROBADAS
SELECT EMPRE_ORIGEN, NOMBRE, SUM(IMPORTE) MONTO_ENVIADO
FROM PUBLIC.TRANSACCION
         INNER JOIN PUBLIC.EMPE ON CODIGO = EMPRE_ORIGEN
WHERE FECHA_COMERCIAL = '2025-06-10' --and estado = 'Rechazado' ---Rechazado
GROUP BY EMPRE_ORIGEN, NOMBRE;
SELECT EMPRE_DESTINO, NOMBRE, SUM(IMPORTE) MONTO_RECIBIDO
FROM PUBLIC.TRANSACCION
         INNER JOIN PUBLIC.EMPE ON CODIGO = EMPRE_DESTINO
WHERE FECHA_COMERCIAL = '2025-03-24'
  AND ESTADO = 'Rechazado'
GROUP BY EMPRE_DESTINO, NOMBRE;

SELECT *
FROM PUBLIC.EMPE;

/*----Para igualar las trx con las se switch
Update public.transaccion
set fecha_comercial = '2025-03-24' --fecha actual
where fecha_comercial = '2025-03-25'  --proximo dia habil
and fecha_creacion >= '2025-03-24 18:00:00'  --fecha actual
and fecha_creacion <= '2025-03-24 19:00:00'  --fecha actual

--------Switch-------------
--Para verificar cantidades en el switch
SELECT count(*) Cantidad_trx, date(fecha_creacion)
FROM public.transaccion
where fecha_creacion >= '2025-03-21 19:00:00' /* fecha anterior*/ and fecha_creacion <= '2025-03-24 19:00:00' ---fecha actual
group by date(fecha_creacion)
order by date asc;*/
-------------------------------------------------
--caso diferencia Conciliador
--HOTFIX

SELECT T.*
FROM PUBLIC.TRANSACCION T
WHERE T.FECHA_COMERCIAL = '2025-03-25';


SELECT T.*
FROM PUBLIC.TRANSACCION T
WHERE T.ID IN ('100005667237', '100005667238');

-- Switch
--HOTFIX

SELECT T.*
INTO PUBLIC.TRANSACCION_BK_20250324;

SELECT *
FROM PUBLIC.TRANSACCION T
WHERE T.FECHA_CREACION BETWEEN '2025-03-24 19:00:00.000' AND '2025-03-25 18:59:59.999'
  AND ID NOT IN
      ('100005669326', '100005669327', '100005669328', '100005669329', '100005669330', '100005669331', '100005669332',
       '100005669333', '100005667193');
--la difrencia
/*(
'100005667237'
'100005667238'
)*/

SELECT T.ID,
       T.EMPRE_ORIGEN,
       T.EMPRE_DESTINO,
       T.NUMERO_DESTINO,
       T.IMPORTE,
       T.MONEDA,
       T.FECHA_OPERACION,
       T.HORA_OPERACION,
       T.FECHA_LIQUIDACION,
       T.CODIGO_RESPUESTA,
       T.MENSAJE_ERROR,
       T.NUMERO_AUTORIZACION,
       T.TIEMPO_RESPUESTA,
       T.FECHA_CREACION,
       T.FECHA_ACTUALIZACION,
       T.ESTADO_PROCESADO,
       T.FECHA_COMERCIAL,
       T.ID_EMPRE_ORIGEN,
       T.COMISION,
       T.ID_SUMARIZACION,
       T.ESTADO_SUMARIZADO,
       T.TIPO,
       T.ESTADO,
       T.NUMERO_ORIGEN,
       E1.NOMBRE AS EMPRE_ORIGEN_NOMBRE,
       E2.NOMBRE AS EMPRE_DESTINO_NOMBRE
FROM TRANSACCION T
         INNER JOIN EMPE E1 ON T.EMPRE_ORIGEN = E1.CODIGO
         INNER JOIN EMPE E2 ON T.EMPRE_DESTINO = E2.CODIGO
WHERE T.ID IN ('100005846958','100005846803','100005846466','100005846880','100005847103','100005845709')
