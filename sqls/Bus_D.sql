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
SELECT CURRENT_MESSAGES FROM QSYS2.DATA_QUEUE_INFOWHERE DATA_QUEUE_LIBRARY = 'GXFINDTA' AND DATA_QUEUE_NAME = 'AUTSNDDTQ';
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
