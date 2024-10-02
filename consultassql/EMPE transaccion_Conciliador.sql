SELECT id, empre_origen, empre_destino, numero_destino, importe, moneda, 
       fecha_operacion, hora_operacion, fecha_liquidacion, codigo_respuesta, 
       mensaje_error, numero_autorizacion, tiempo_respuesta, fecha_creacion, 
       fecha_actualizacion, estado_procesado, fecha_comercial, id_empre_origen, 
       comision, id_sumarizacion, estado_sumarizado, tipo, numero_origen, 
       estado, registrado
  FROM transaccion
   where fecha_creacion between  '2021-05-13 19:00:00' and '2021-05-14 18:59:59'  --and estado='Aprobado' 
   --and estado_procesado='Pendiente'
    order by hora_operacion desc;

    
  and estado_sumarizado='Sumarizado' and estado_procesado='Comisionado';


SELECT id, empre_origen, empre_destino, numero_destino, importe, moneda, 
       fecha_operacion, hora_operacion, fecha_liquidacion, codigo_respuesta, 
       mensaje_error, numero_autorizacion, tiempo_respuesta, fecha_creacion, 
       fecha_actualizacion, estado_procesado, fecha_comercial, id_empre_origen, 
       comision, id_sumarizacion, estado_sumarizado, tipo, numero_origen, 
       estado, registrado
  FROM transaccion
    where fecha_creacion between  '2021-04-21 19:00:00' and  '2021-04-22 18:59:59'   --and estado='Aprobado'; ;
 

/*reporte para power bi */
  select count(*) cantidad , date(fecha_creacion),estado,codigo_respuesta,mensaje_error
  from public.transaccion 
  group by date(fecha_creacion),estado,codigo_respuesta,mensaje_error
  order by date(fecha_creacion) asc


select * from public.liquidacion order by id desc
  select * from public.empe


  
SELECT sum(importe), empre_origen,'Enviado'
  FROM transaccion
    where fecha_creacion between  '2021-03-31 19:00:00' and  '2021-04-05 18:59:59' and estado='Aprobado'
    
    group by empre_origen 
union
  
SELECT sum(importe), empre_destino,'Recibido'
  FROM transaccion
    where fecha_creacion between  '2021-03-31 19:00:00' and  '2021-04-05 18:59:59' and estado='Aprobado'
    group by empre_destino
order by 2
   