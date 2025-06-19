----------bus datos db2 --Query AMQ DB2
SELECT CASE WHEN count(*) > 1000 THEN 'ALERT' ELSE 'OK' END AS bus_status2 , count(*) cant2
FROM GXFINDTA.TBDAUV;--TBDAUV = VISTA / VTBDAUD=TABLA
--Query Portal Postgres
SELECT CASE
           WHEN A."cantidad" >= 1000 THEN 'ALERT'
           ELSE 'OK'
           END "bus_status1" , A."cantidad" "cant1"
FROM (SELECT REPLICACION_ESTADO_REPLICA "estado" , COUNT(*) "cantidad"
      FROM SCH_RPL_ENTIDADEMISORA.REPLICACION_ENTIDAD_EMISORA
      GROUP BY REPLICACION_ESTADO_REPLICA) A
WHERE A."estado" = 'N';
-----------------------------
SELECT * FROM GXFINDTA.TBDAUD T WHERE AUDESTPOG = 'N' ORDER BY AUDTRXFCHC DESC;
SELECT COUNT(*) FROM GXFINDTA.TBDAUD T WHERE AUDESTPOG = 'N' AND AUDTRXFCHC<'20230501' ORDER BY AUDTRXFCHC DESC;
UPDATE  GXFINDTA.TBDAUD SET AUDESTPOG = 'C' WHERE AUDESTPOG = 'N' AND AUDTRXFCHC<'20230501';--CANCELAR PARA QUE BAJE LOS ENCOLADOS
---------------------------------- 51 y 52
SELECT *
FROM PUBLIC.BUSDATOS_TRANSACCIONES
ORDER BY OPERACION_ID DESC;
----------------------------------------
--Para corrobar que si la COLA de DATOS demora en obtener informacion
CALL GXFINPGM.SPFIN003 ( 'AUTSNDDTQ' , 'GXFINDTA' , 120 , VALOR , 5 ) ;
---cola de datos
SELECT CURRENT_MESSAGES FROM QSYS2.DATA_QUEUE_INFO WHERE DATA_QUEUE_LIBRARY = 'GXFINDTA' AND DATA_QUEUE_NAME = 'AUTSNDDTQ';
SELECT COUNT(*)
FROM GXFINDTA.TBDAUV
WHERE OP_RRNBEPSA = '               ';
--tablas
--gxfindta.tbdaud
----------
-----
SELECT count(*), substr(t2.AUDTRXFCHC,1,13) FROM GXFINDTA.TBDAUD t2 WHERE T2.AUDESTPOG IN ('N','F') GROUP BY substr(t2.AUDTRXFCHC,1,13) ;
SELECT count(*), substr(t2.AUDTRXFCHC,1,13) FROM GXFINDTA.TBDAUD t2 WHERE T2.AUDESTPOG IN ('N','F') GROUP BY substr(t2.AUDTRXFCHC,1,13) ;
--Diego podemos cargar un repair para ir excluyendo lo de ayer e iremos marcanando para activar por rango de horarios para encontrar el registro que esta causando el problema
--ESTE ES EL UPDATE A EJECUTAR
UPDATE GXFINDTA.TBDAUD t2 SET t2.AUDESTPOG = 'X' WHERE T2.AUDESTPOG IN ('N','F') AND t2.AUDFCHT,1,13 = '2023-04-26-20.00.00.000000';
------------------------------------------
CALL QSYS2.OVERRIDE_QAQQINI(1, '',  '');
CALL QSYS2.OVERRIDE_QAQQINI(2, 'ALLOW_DDL_CHANGES_WHILE_OPEN', '*YES');
--------------------------
CALL QSYS2.OVERRIDE_QAQQINI(1, '',  '');
CALL QSYS2.OVERRIDE_QAQQINI(2, 'ALLOW_DDL_CHANGES_WHILE_OPEN', '*YES');
ALTER TRIGGER GXBDBPS.INSUPD_AUT_TSWAUT ENABLE;
-----------------------
CALL QSYS2.OVERRIDE_QAQQINI(1, '',  '');
CALL QSYS2.OVERRIDE_QAQQINI(2, 'ALLOW_DDL_CHANGES_WHILE_OPEN', '*YES');
ALTER TRIGGER GXBDBPS.INSUPD_AUT_TSWAUT DISABLE;
-------
CALL QSYS.QCLRDTAQ ( 'AUTSNDDTQ ' , 'GXFINDTA');--no anda
CALL PGM (QCLRDTAQ) PARM('AUTSNDDTQ ''GXFINDTA ');

--tabla de consulta
SELECT * FROM GXFINDTA.TBDCNX T;
---------------------------------------ver entidades para bus
SELECT * FROM sch_rpl_entidademisora.configuracion_entidad_emiadq;

INSERT INTO sch_rpl_entidademisora.configuracion_entidad_emiadq
(configuracion_id, configuracion_cod_entidad_destino, configuracion_destino, configuracion_tipo, configuracion_estado, configuracion_fecha_alta, configuracion_fecha_modi)
VALUES(3, 1040, 'RIO', 'ENTIDAD', 'A', '2024-02-26', NULL);


select bt.*, e.*
from sch_rpl_entidademisora.replicacion_entidad_emisora e, public.busdatos_transacciones bt
where e.replicacion_operacion_id = bt.operacion_id
and e.replicacion_estado_replica = 'N';


---- ver actividad de database y matar sesiones
select
	datid, usename, wait_event_type, wait_event, state,	query, datname,	pid, usesysid, usename,	application_name, backend_xmin,
	client_addr, client_hostname, client_port, backend_start, xact_start, query_start, state_change, backend_xid, backend_type
	--,pg_terminate_backend(pg_stat_activity.pid)
from
	pg_stat_activity
where
	datname = 'portalbus'
	and pid <> pg_backend_pid()
	--and state <> 'active'
	--AND usename = 'usrclt'
order by state;

SELECT pg_terminate_backend(36803);
---SECUENCIA BUS DATOS
SELECT *
FROM PUBLIC.OPERACION_ID;
-----
--tabla bus d CONFIGURACIÓN
SELECT * FROM GXFINDTA.CONFIGURACION_ENTIDAD_EMIADQ CEE;
---SECUENCIA BUS DATOS
SELECT NEXT VALUE FOR gxfindta.generic_seq AS next_value FROM SYSIBM.SYSDUMMY1;

SELECT BT.OPERACION_COD_COMERCIO, BT.OPERACION_COD_SUCURSAL, BT.* FROM POCODI_HIST.PUBLIC.BUSDATOS_TRANSACCIONES BT WHERE BT.OPERACION_RRNBEPSA IN ( '512182244533',
'512182277221',
'512182277862',
'512182344794',
'512182393823',
'512182431588',
'512182499010',
'512182503307',
'512282836864',
'512283030051',
'512283056871',
'512383299804',
'512383386690',
'512483857745');
SELECT * FROM POCODI_HIST.PUBLIC.COMISIONES C WHERE C.RRNBEPSA
IN ('570101647143', '570202074247', '570202074843', '570603337461', '570703772545');


SELECT "bt"."operacion_id", "bt"."operacion_fech_insercion", "bt"."operacion_hor_insercion", "bt"."operacion_rrnbepsa", "bt"."operacion_est_reversa", "bt"."operacion_fech_trans", "bt"."operacion_cod_comercio", "bt"."operacion_denom_comercial", "bt"."operacion_cod_sucursal", "bt"."operacion_desc_sucursal", "bt"."operacion_cod_autenticacion", "bt"."operacion_cod_entidad_rol", "bt"."operacion_num_tarjeta", "bt"."operacion_num_tarjeta_enmascar", "bt"."operacion_tip_uso_tarjeta", "bt"."operacion_cant_cuotas", "bt"."operacion_cod_moneda_origen", "bt"."operacion_desc_moneda_origen", "bt"."operacion_cod_moneda_destino", "bt"."operacion_desc_moneda_destino", "bt"."operacion_mont_origen", "bt"."operacion_mont_destino", "bt"."operacion_cod_moneda_origen", "bt"."operacion_mont_origen", "bt"."operacion_mont_destino", "bt"."operacion_ambito_transaccion", "bt"."operacion_cta_utda_operacion", "bt"."operacion_tip_dispositivo", "bt"."operacion_desc_dispositivo", "bt"."operacion_cod_pais_origen", "bt"."operacion_desc_pais_origen", "bt"."operacion_cod_pais_destino", "bt"."operacion_desc_pais_destino", "bt"."operacion_venc_tarjeta", "bt"."operacion_cod_servicio", "bt"."operacion_desc_servicio", "bt"."operacion_cod_prestacion", "bt"."operacion_desc_prestacion", "bt"."operacion_cod_marc_tarjeta", "bt"."operacion_desc_marc_tarjeta", "bt"."operacion_cod_prod_tarjeta", "bt"."operacion_desc_prod_tarjeta", "bt"."operacion_cod_afinidad", "bt"."operacion_desc_afinidad", "bt"."operacion_cod_retorno", "bt"."operacion_desc_retorno", "bt"."operacion_cat_comerc_mcc", "bt"."operacion_desc_mcc", "bt"."operacion_cod_transaccion", "bt"."operacion_desc_transaccion", "bt"."operacion_fech_proc_transaccio", "bt"."operacion_form_pago", "bt"."operacion_desc_form_pago", "bt"."operacion_estac_origen_ss", "bt"."operacion_estac_dest_ds", "bt"."operacion_mod_entrada", "bt"."operacion_desc_mod_entrada", "bt"."operacion_sald_actual", "bt"."operacion_sald_disp", "bt"."operacion_est_in_transaccion", "bt"."operacion_ident_cajero_atm", "bt"."operacion_enti_admi_atm", "bt"."operacion_ent_propieta_atm", "bt"."operacion_opera_origen", "bt"."operacion_telef_origen", "bt"."operacion_oper_destino", "bt"."operacion_telef_destino", "bt"."operacion_mont_cotizacion", "bt"."operacion_ent_transf_origen", "bt"."operacion_desc_enti_origen_tr", "bt"."operacion_ent_transfe_destino", "bt"."operacion_desc_enti_destino_tr", "bt"."operacion_cta_transfe_origen", "bt"."operacion_cta_transfe_destino", "bt"."operacion_num_adherente", "bt"."operacion_id_promocion", "bt"."operacion_proce_emisor", "bt"."operacion_desc_proce_emisor", "bt"."operacion_proce_adquiriente", "bt"."operacion_desc_proce_adquirien", "bt"."operacion_ptos_transaccion", "bt"."operacion_estado_replica", "bt"."operacion_json", "bt"."operacion_est_fn_transaccion", "bt"."operacion_cod_retorno",
       CAST(SUBSTRING(BT.OPERACION_NUM_TARJETA FROM 1 FOR 6) || '******' || SUBSTRING(BT.OPERACION_NUM_TARJETA FROM LENGTH(BT.OPERACION_NUM_TARJETA) - 4 FOR 4) AS BPCHAR(19))                            AS OPERACION_NUM_TARJETA,
       CAST(SUBSTRING(BT.OPERACION_NUM_TARJETA_ENMASCAR FROM 1 FOR 6) || '******' || SUBSTRING(BT.OPERACION_NUM_TARJETA_ENMASCAR FROM LENGTH(BT.OPERACION_NUM_TARJETA_ENMASCAR) - 4 FOR 4) AS BPCHAR(19)) AS OPERACION_NUM_TARJETA_ENMASCAR,
       CASE
           WHEN BT.OPERACION_COD_MONEDA_ORIGEN = 600 THEN BT.OPERACION_MONT_ORIGEN
           WHEN BT.OPERACION_COD_MONEDA_ORIGEN <> 600 THEN BT.OPERACION_MONT_DESTINO
           END                                                                                                                                                                                               OPERACION_MONTO_GS,
       CASE
           WHEN BT.OPERACION_EST_FN_TRANSACCION = 'A' AND BT.OPERACION_COD_RETORNO = '00' THEN 'A'
           WHEN BT.OPERACION_EST_FN_TRANSACCION = 'A' AND BT.OPERACION_COD_RETORNO <> '00' THEN 'R'
           WHEN BT.OPERACION_EST_FN_TRANSACCION = 'D' THEN 'R'
           WHEN BT.OPERACION_EST_FN_TRANSACCION = 'R' THEN 'X'
           END                                                                                                                                                                                               ESTADO_TRANSACCION,
       COUNT(*) OVER ()                                                                                                                                                                                   AS COUNTER
FROM "busdatos_transacciones" AS "bt"
WHERE "bt"."operacion_est_fn_transaccion" <> 'Q'
  /*AND "bt"."operacion_est_fn_transaccion" = 'A'
  AND "bt"."operacion_cod_retorno" = '00'*/
  AND "bt"."operacion_fech_trans" BETWEEN '2025-04-29  00:00:00.000' AND '2025-04-29 23:59:59.999'
  AND ("bt"."operacion_cod_comercio", "bt"."operacion_cod_sucursal") IN ((11282, 682)/*, (10937, 2), (10937, 3), (10937, 16), (10937, 18), (10937, 4), (10937, 8), (10937, 5), (10937, 226), (10937, 1001), (10937, 17), (10937, 6), (10937, 7), (10937, 224), (10937, 21), (10937, 23), (10937, 26), (10937, 78), (10937, 189), (10937, 15), (10937, 168), (10937, 228), (10937, 186), (10937, 10),
(10937,80), (10937, 229), (10937, 25), (10937, 186), (10937, 48), (10937, 43), (10937, 14), (10937, 19), (10937, 131), (10937, 24), (10937, 238), (10937, 111), (10937, 83)*/)
ORDER BY "bt"."operacion_fech_trans" ASC
LIMIT 5;


select * from comprobantes_transacciones ct where rrn = '516199727797';