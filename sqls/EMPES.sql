----------RESUMEN PARA BCP-EMPE----------
SELECT fecha_operacion, empre_origen, empre_destino, estado, count(*) Cantidad, sum(importe) Total, codigo_respuesta,
       mensaje_error
  FROM public.transaccion
 where fecha_comercial BETWEEN '2022-03-16' and '2022-03-16' --and estado ='Aprobado'
 group by fecha_operacion, empre_origen, empre_destino, estado, codigo_respuesta, mensaje_error
 order by fecha_operacion, empre_origen, empre_destino;

SELECT *
  FROM PUBLIC.TRANSACCION;
/*Resumen de transacciones - Conciliador*/
SELECT fecha_operacion, empre_origen, empre_destino, estado, count(*) Cantidad, sum(importe) Total, codigo_respuesta,
       mensaje_error
  FROM public.transaccion
 where fecha_comercial = '2022-09-09'
 group by fecha_operacion, empre_origen, empre_destino, estado, codigo_respuesta, mensaje_error
 order by empre_origen, empre_destino;

/*Resumen de transacciones - Switch*/
SELECT empre_origen, empre_destino, estado, count(*) Cantidad, sum(importe) Total, codigo_respuesta, mensaje_error
  FROM public.transaccion
 where fecha_creacion >= '2022-04-07 00:00:00'
   and fecha_creacion <= '2022-04-10 18:59:59'
 group by empre_origen, empre_destino, estado, codigo_respuesta, mensaje_error
 order by empre_origen, empre_destino;

----CONCILIADOR--------
SELECT count(*) Cantidad_trx--, fecha_creacion, fecha_comercial
  FROM public.transaccion
 where fecha_comercial = '2024-12-30'
 group by fecha_creacion, fecha_comercial
 order by fecha_creacion asc;

-------SWICHT----------
SELECT count(*) Cantidad_trx, date(fecha_creacion)
  FROM PUBLIC.TRANSACCION
 where fecha_creacion >= '2020-12-24 19:00:00'
   and fecha_creacion <= '2020-12-28 18:59:59'
 group by date(fecha_creacion)
 order by date asc;
---#######################################################################################################################################################################################---
select *
  from public.transaccion
 where id_empre_origen in ('446285061');
select id, id_empre_origen, empre_origen, numero_origen, empre_destino, numero_destino, importe, fecha_operacion,
       hora_operacion, codigo_respuesta, mensaje_error, numero_autorizacion, fecha_creacion, fecha_liquidacion
  from public.transaccion
 where empre_destino = '0009'
--where  id in ('100000751539')
     WHERE NUmero_autorizacion in ('446285061');
--where fecha_operacion='25052021' and importe='50000' and hora_operacion between '083000' and '084000' and empre_origen='0007' and empre_destino='0005'

--where empre_origen='0005' and empre_destino='0008' and codigo_respuesta='13'

SELECT *
  FROM parametros_configuracion
 WHERE codigo = 'TS';

select fecha_operacion fecha, hora_operacion hora, id, id_empre_origen, empre_origen, numero_origen, empre_destino,
       numero_destino, importe, codigo_respuesta, estado, numero_autorizacion, mensaje_error, fecha_creacion
  FROM PUBLIC.TRANSACCION
 where numero_origen like '%982201781'
   and numero_destino like '%991348592' --and fecha_creacion like '2021-06-21%'
--WHERE fecha_operacion='14092021'
 order by fecha_operacion desc, hora_operacion desc;


SELECT * from PUBLIC.empe;

SELECT * from parametros_configuracion;

SELECT * FROM public.transaccion
         WHERE DATE(FECHA_CREACION ) ='2023-03-27' and NUMERO_ORIGEN='00000000595985334460';
where id IN ('100002959365','100002959373');
--where id='100001227662'
 --where importe = '200000'
where fecha_operacion = '25032023'
and numero_destino ='00000000595975655251'
and numero_origen='00000000595994779318'
--and empre_origen='0005' and empre_destino='0008'
--where fecha_operacion='28032022'
 order by hora_operacion desc;
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
  * FROM public.transaccion
 where empre_destino = '0007'
   and fecha_comercial = '2023-03-27'
   and estado_procesado = 'Comisionado'
 group by empre_destino;

SELECT empre_origen, sum(importe)--substr(fecha_operacion,5,4)||substr(fecha_operacion,3,2)||substr(fecha_operacion,1,2), hora_operacion, numero_autorizacion,'D',substr(fecha_operacion,1,4)||substr(fecha_operacion,6,2)||substr(fecha_operacion,9,2),'06','06',importe, '600', empre_destino, empre_origen, id, estado_procesado
  FROM public.transaccion
 where empre_origen = '0007'
   and fecha_comercial = '2023-03-27'
   and estado_procesado = 'Comisionado'
 group by empre_origen
 union
SELECT EMPRE_DESTINO, sum(importe)--substr(fecha_operacion,5,4)||substr(fecha_operacion,3,2)||substr(fecha_operacion,1,2), hora_operacion, numero_autorizacion,'D',substr(fecha_operacion,1,4)||substr(fecha_operacion,6,2)||substr(fecha_operacion,9,2),'06','06',importe, '600', empre_destino, empre_origen, id, estado_procesado
  FROM public.transaccion
 where EMPRE_DESTINO = '0007'
   and fecha_comercial = '2023-03-27'
   and estado_procesado = 'Comisionado'
 group by EMPRE_DESTINO;

---detalle conciliaci�n
SELECT substr(fecha_operacion,5,4)||substr(fecha_operacion,3,2)||substr(fecha_operacion,1,2) fecha
, hora_operacion hora,numero_autorizacion autorizacion,'D' tipo, '20230327' fecha_comercial
,'06' operacion,'06' clase,importe, '600' moneda, empre_destino destino, substr(empre_origen,2,3) origen, id, estado_procesado
FROM public.transaccion where fecha_comercial = '2023-03-27' and estado_procesado = 'Comisionado' order by id;

SELECT *
FROM PUBLIC.TRANSACCION WHERE FECHA_OPERACION='07102024' AND EMPRE_ORIGEN='0008';

SELECT *
FROM PUBLIC.TRANSACCION WHERE FECHA_OPERACION='12102023' AND hora_operacion>='231000' AND EMPRE_DESTINO='0008';

SELECT * FROM PUBLIC.USUARIO U;
SELECT * FROM PUBLIC.ROL R;
SELECT * FROM PUBLIC.ROL_PERMISO RP;
SELECT * FROM PUBLIC.PERMISO P;

SELECT *
FROM EMPE E;

SELECT *
FROM PUBLIC.TRANSACCION T WHERE T.FECHA_OPERACION>='21112023' AND T.IMPORTE='100000';


SELECT * FROM PUBLIC.PARAMETROS_CONFIGURACION PC;
---------------

select * from public.transaccion t WHERE t.FECHA_OPERACION=''
where t.fecha_comercial in ('2024-02-12','2024-02-13','2024-02-14','2024-02-15','2024-02-16');


select * FROM PUBLIC.TRANSACCION T WHERE T.FECHA_COMERCIAL='2024-09-24' and ESTADO = 'Aprobado';
--rollback
UPDATE public.TRANSACCION
SET ESTADO_PROCESADO  = 'Pendiente', ID_SUMARIZACION   = NULL , COMISION = 0 , ESTADO_SUMARIZADO = NULL
WHERE ESTADO = 'Aprobado' AND FECHA_COMERCIAL>='2025-02-01';
 --- AND FECHA_COMERCIAL = TO_DATE((SELECT PC.VALOR FROM PARAMETROS_CONFIGURACION PC WHERE PC.NOMBRE = 'FC_ANTERIOR'), 'DD-MM-YYYY')

--TRUNCATE TABLE public.LIQUIDACION;

DELETE
FROM LIQUIDACION
WHERE FECHA_COMERCIAL >= '2025-01-17';
--where fecha_comercial = TO_DATE((SELECT pc.valor FROM parametros_configuracion pc WHERE pc.nombre = 'FC_ANTERIOR'), 'DD-MM-YYYY')

SELECT * FROM public.PARAMETROS_CONFIGURACION PC;

SELECT * FROM public.LIQUIDACION L order by fecha_comercial desc;

SELECT * FROM public.COMISION C;
CREATE TABLE conciliador.PUBLIC.BK_EMPES AS (
SELECT * FROM public.EMPE E);

SELECT * FROM public.EMPE E;
SELECT * FROM public.PARAMETROS_CONFIGURACION PC WHERE PC.CODIGO LIKE 'MAIL%'
-------------
SELECT COUNT(*) FROM PUBLIC.TRANSACCION T where T.FECHA_COMERCIAL='2025-02-10';
SELECT * FROM switch.public.TRANSACCION T WHERE DATE(fecha_creacion) ='2024-12-29';

SELECT * FROM public.USUARIO U; --WHERE U.ID(63);
SELECT * FROM public.ROL R;
SELECT * FROM public.ROL_PERMISO RP;

SELECT SUM(T.IMPORTE)
FROM PUBLIC.TRANSACCION T
WHERE T.FECHA_COMERCIAL = '2025-01-20'
  AND T.EMPRE_ORIGEN = '0005'
  AND T.ESTADO = 'Rechazado';


SELECT count(*) FROM public.LIQUIDACION L WHERE fecha_comercial ='2025-01-30';

SELECT * FROM public.TRANSACCION T WHERE T.NUMERO_AUTORIZACION='792717695'; --100005526957
SELECT * FROM public.TRANSACCION T WHERE T.CODIGO_RESPUESTA<>'0';
------------------------------
--caso cambio de horario
--Switch
select (t.fecha_creacion + interval '1 hour') fecha_creacion,
TO_CHAR((t.fecha_creacion + interval '1 hour'),'DDMMYYYY') fecha_operacion,
TO_CHAR((t.fecha_creacion + interval '1 hour'),'hh24miss') hora_operacion,
TO_CHAR((t.fecha_creacion + interval '1 hour'),'DDMMYYYY') fecha_liquidacion,
(t.fecha_actualizacion + interval '1 hour') fecha_actualizacion,
(t.fecha_envio + interval '1 hour') fecha_envio,
t.*
from public.transaccion t
where t.id between 100005662530 and 100005667165
order by t.id;

update public.transaccion
set fecha_operacion = TO_CHAR((fecha_creacion + interval '1 hour'),'DDMMYYYY'),
    hora_operacion = TO_CHAR((fecha_creacion + interval '1 hour'),'hh24miss'),
    fecha_liquidacion = TO_CHAR((fecha_creacion + interval '1 hour'),'DDMMYYYY'),
    fecha_creacion = (fecha_creacion + interval '1 hour'),
    fecha_actualizacion = (fecha_actualizacion + interval '1 hour'),
    fecha_envio = (fecha_envio + interval '1 hour')
where id between 100005662530 and 100005667165;

--Para verificar cantidades en el switch
SELECT count(*) Cantidad_trx, date(fecha_creacion)
FROM public.transaccion
where fecha_creacion >= '2025-03-24 19:00:00' /* fecha anterior*/
  and fecha_creacion < '2025-03-25 19:00:00' ---fecha actual
group by date(fecha_creacion)
order by date asc;

--Conciliador
update public.transaccion
set fecha_operacion = TO_CHAR((fecha_creacion + interval '1 hour'),'DDMMYYYY'),
    hora_operacion = TO_CHAR((fecha_creacion + interval '1 hour'),'hh24miss'),
    fecha_liquidacion = TO_CHAR((fecha_creacion + interval '1 hour'),'DDMMYYYY'),
    fecha_creacion = (fecha_creacion + interval '1 hour'),
    fecha_actualizacion = (fecha_actualizacion + interval '1 hour')
where id between 100005662530 and 100005667165;

SELECT id, t.*
FROM public.transaccion t
where fecha_creacion >= '2025-03-24 19:00:00'
  and fecha_creacion < '2025-03-25 19:00:00'
  and fecha_comercial = '2025-03-25'
order by 1;

----query noc para ver casos del cierre
---------------Conciliador---------------
--Verificacion de trx en conciliador
SELECT count(*) Cantidad_trx, date(fecha_creacion)
FROM public.transaccion
where fecha_comercial = '2025-03-24'  --fecha actual
group by date(fecha_creacion)
order by date asc;


--Para buscar las transacciones de diferencia entre conciliador y switch
select * from public.transaccion
where fecha_comercial = '2025-03-25'  --proximo dia habil
and fecha_creacion >= '2025-03-24 18:00:00'  --fecha actual
and fecha_creacion <= '2025-03-24 19:00:00' ; --fecha actual

-----VER ESTADO SUMARIZADO-----
select *from public.transaccion
where fecha_comercial = '2025-03-24'  --fecha actual
and estado = 'Aprobado';
--and estado_sumarizado ='Sumarizado'

-----CONTADOR DE TRX-----
SELECT count(*) Cantidad_trx
FROM public.transaccion
where fecha_comercial = '2025-03-24';

------PARA VERIFICAR LOS CORREOS A LOS CUALES VAN LOS INFORMES-----
select *from public.empe;

-----CONTROL DE CORREO-----
select empre_origen,nombre, sum(importe)monto_enviado from public.transaccion
inner join public.empe on codigo = empre_origen
where fecha_comercial = '2025-03-24' and estado = 'Aprobado'
group by empre_origen,nombre;
select empre_destino ,nombre , sum(importe)monto_recibido from public.transaccion
inner join public.empe on codigo = empre_destino
where fecha_comercial = '2025-03-24' and estado = 'Aprobado'
group by empre_destino,nombre;
----------- NO APROBADAS
select empre_origen,nombre, sum(importe)monto_enviado from public.transaccion
inner join public.empe on codigo = empre_origen
where fecha_comercial = '2025-03-24' and estado = 'Rechazado' ---Rechazado
group by empre_origen,nombre;
select empre_destino ,nombre , sum(importe)monto_recibido from public.transaccion
inner join public.empe on codigo = empre_destino
where fecha_comercial = '2025-03-24' and estado = 'Rechazado'
group by empre_destino,nombre;

select  * from public.empe;

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

SELECT t.* FROM public.transaccion t WHERE t.fecha_comercial = '2025-03-25'


SELECT T.*
FROM PUBLIC.TRANSACCION T
WHERE T.ID IN ( '100005667237','100005667238' );

-- Switch
--HOTFIX

SELECT t.* INTO public.transaccion_bk_20250324

SELECT * FROM public.transaccion t
WHERE t.fecha_creacion BETWEEN '2025-03-24 19:00:00.000' AND '2025-03-25 18:59:59.999'
AND id NOT IN
('100005669326','100005669327','100005669328','100005669329','100005669330','100005669331','100005669332',
 '100005669333','100005667193');
--la difrencia
(
'100005667237'
'100005667238'
)
