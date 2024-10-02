select id , fecha_creacion fecha_operacion,empre_origen origen ,empre_destino destino ,importe importe,numero_origen,numero_destino,estado estado_trx,
codigo_respuesta ,mensaje_error msg_retorno from public.transaccion  
where fecha_creacion between  '2021-12-14 00:00:00' and  '2021-12-14 23:59:59'
--and id in ('100000044375','100000044176','100000044090')
--and codigo_respuesta='00'
--and empre_origen='0005'
--and empre_destino='0007'
order by id desc
--and estado=Pendiente'

/*
select id, fecha_creacion,empre_origen,empre_destino,importe,estado,fecha_creacion,codigo_respuesta,mensaje_error from public.transaccion where id in 


select * from public.usuario
select * from public.transaccion where fecha_operacion ='05112020' order by hora_operacion desc
*/
/* para sacar por día */
--select * from public.transaccion where fecha_creacion between '2020-11-04 19:00:00' and '2020-11-05 18:59:59'

SELECT fecha_operacion, empre_origen, empre_destino, estado, count(*) Cantidad, sum(importe) Total, codigo_respuesta, mensaje_error
FROM public.transaccion where fecha_creacion between  '2020-11-17 19:00:00' and  '2020-11-18 18:59:59'
--and codigo_respuesta='0' --and (empre_origen='0007' or empre_destino='0007')
group by fecha_operacion, empre_origen, empre_destino, estado, codigo_respuesta, mensaje_error
order by cantidad,empre_origen, empre_destino;

