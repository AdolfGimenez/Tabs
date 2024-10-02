SELECT substr(fecha_operacion,5,4) ||substr(fecha_operacion,3,2) ||substr(fecha_operacion,1,2),
       hora_operacion,
       numero_autorizacion,
       'D',
       substr(fecha_operacion,1,4) ||substr(fecha_operacion,6,2) ||substr(fecha_operacion,9,2),
       '06',
       '06',
       importe,
       '600',
       empre_destino,
       empre_origen,
       id,
       estado_procesado
FROM public.transaccion
WHERE fecha_comercial = '2020-11-19'
ORDER BY id DESC;
