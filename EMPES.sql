----------RESUMEN PARA BCP-EMPE----------
SELECT fecha_operacion, empre_origen, empre_destino, estado, count(*) Cantidad, sum(importe) Total, codigo_respuesta, mensaje_error
FROM public.transaccion where fecha_comercial BETWEEN '2022-03-16' and '2022-03-16' --and estado ='Aprobado'
group by fecha_operacion, empre_origen, empre_destino, estado, codigo_respuesta, mensaje_error
order by fecha_operacion, empre_origen, empre_destino;

SELECT * FROM PUBLIC.TRANSACCION
/*Resumen de transacciones - Conciliador*/
SELECT fecha_operacion, empre_origen, empre_destino, estado, count(*) Cantidad, sum(importe) Total, codigo_respuesta, mensaje_error
    FROM public.transaccion where fecha_comercial = '2022-09-09'
    group by fecha_operacion, empre_origen, empre_destino, estado, codigo_respuesta, mensaje_error
    order by empre_origen, empre_destino;

	/*Resumen de transacciones - Switch*/
SELECT  empre_origen, empre_destino, estado, count(*) Cantidad, sum(importe) Total, codigo_respuesta, mensaje_error
    FROM public.transaccion where fecha_creacion >= '2022-04-07 00:00:00' and fecha_creacion <= '2022-04-10 18:59:59'
    group by empre_origen, empre_destino, estado, codigo_respuesta, mensaje_error
    order by empre_origen, empre_destino;

----CONCILIADOR--------
SELECT count(*) Cantidad_trx, fecha_creacion ,fecha_comercial
FROM public.transaccion
where fecha_comercial = '2020-12-28'
group by fecha_creacion,fecha_comercial
order by fecha_creacion asc;

-------SWICHT----------
SELECT count(*) Cantidad_trx, date(fecha_creacion)
FROM public.transaccion
where fecha_creacion >= '2020-12-24 19:00:00' and fecha_creacion <= '2020-12-28 18:59:59'
group by date(fecha_creacion)
order by date asc;


---#######################################################################################################################################################################################---

select * from public.transaccion where id_empre_origen in ('446285061')
select id, id_empre_origen, empre_origen, numero_origen, empre_destino, numero_destino, importe, fecha_operacion, hora_operacion, codigo_respuesta, mensaje_error, numero_autorizacion, fecha_creacion, fecha_liquidacion
from public.transaccion where empre_destino='0009'
--where  id in ('100000751539')
WHERE NUmero_autorizacion in ('446285061');
--where fecha_operacion='25052021' and importe='50000' and hora_operacion between '083000' and '084000' and empre_origen='0007' and empre_destino='0005'

--where empre_origen='0005' and empre_destino='0008' and codigo_respuesta='13'

SELECT * FROM parametros_configuracion WHERE codigo = 'TS';

select
fecha_operacion fecha, hora_operacion hora, id, id_empre_origen, empre_origen, numero_origen, empre_destino, numero_destino, importe, codigo_respuesta, estado, numero_autorizacion, mensaje_error, fecha_creacion
FROM PUBLIC.TRANSACCION
where numero_origen like '%982201781' and numero_destino like '%991348592' --and fecha_creacion like '2021-06-21%'
--WHERE fecha_operacion='14092021'
order by fecha_operacion desc, hora_operacion desc

SELECT * FROM PUBLIC.TRANSACCION WHERE numero_origen like '%595976961938' and importe='50000' --and numero_destino like '%595972645786'
SELECT * FROM PUBLIC.TRANSACCION WHERE date(fecha_creacion)= '2021-11-05';
SELECT * FROM PUBLIC.TRANSACCION WHERE numero_autorizacion in ('163780119','445503386438');


select * from public.EMPE E;
SELECT * FROM public.PARAMETROS_CONFIGURACION PC;

SELECT *
FROM public.transaccion
--where id='100001420742'
--where id='100001227662'
where importe='200000'
and fecha_operacion = '24042022'
and numero_destino like '%82880579'
--and empre_origen='0005' and empre_destino='0008'
--where fecha_operacion='28032022'
order by hora_operacion desc;
--and numero_destino='00000000595984988669'



/*  "0010"	"WALLY"
    "0009"	"ZIMPLE"
    "0005"	"TIGO"
    "0007"	"PERSONAL"
    "0008"	"CLARO"*/
