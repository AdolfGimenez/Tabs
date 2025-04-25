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

SELECT * FROM POCODI_HIST.PUBLIC.BUSDATOS_TRANSACCIONES BT WHERE BT.OPERACION_RRNBEPSA in
('570101647143', '570202074247', '570202074843', '570603337461', '570703772545');
SELECT * FROM POCODI_HIST.PUBLIC.COMISIONES C WHERE C.RRNBEPSA
IN ('570101647143', '570202074247', '570202074843', '570603337461', '570703772545');
