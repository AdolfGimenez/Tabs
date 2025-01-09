-------asientos
SELECT * FROM FACTURACIONBEPSA.CLIENTE C WHERE clienteid='1204822';
SELECT * FROM FACTURACIONBEPSA.PARAMETROS P;
SELECT * FROM FACTURACIONBEPSA.RUTACOMERCIAL R;
-------------
SELECT * FROM FACTURACIONBEPSA.SECUSER S WHERE SECUSERIBMAD IN ('U99MHUGO', 'U99LIZ', 'U99VANESSA', 'U99LILIANB', 'U99CARLA', 'U99EDITH');
SELECT * FROM FACTURACIONBEPSA.FACVENTADET F;
SELECT * FROM FACTURACIONBEPSA.timbradocomprobantecaja T;--CAMBIAR NRO FACTURA.
---correosm
INSERT INTO asientos.email_users (email,email_description,status,modulo) VALUES
     ('mathias.lovera@clt.com.py','Correo de Mathias','1','Asientos'),
     ('jlaran@bepsa.com.py','Eduardo Larán','1','Asientos'),
     ('bravetti@bepsa.com.py','Blás Ravetti','1','Asientos');
--------------------------------------------------------------
SELECT * FROM FACTURACIONBEPSA.PARAMETROS P WHERE PARMID='asientoPorCurl';
--https://k2basientos.bepsa.com.py/k2b_bepsa/servlet/com.k2b.awsimpbepsagenerarasiento
select * from asientos.asientos.cuenta_cont_proceso_cabe c
where c.servicio_activo = 'SI'
and c.tipo_asiento = 'MST-SWITCH-GS';
--procedimiento que genera asientos a k2b
--asientos.pr_gen_mst_swt_gs
SELECT * FROM asientos.email_users;
----pase 20230721
SELECT * FROM FACTURACIONBEPSA.PARAMETROS P;
SELECT * FROM FACTURACIONBEPSA.SECUSERROLE S;
SELECT * FROM FACTURACIONBEPSA.SECUSERROLE S;
SELECT * FROM FACTURACIONBEPSA.SECROLE S;
SELECT * FROM FACTURACIONBEPSA.SECFUNCTIONALITYROLE S;
SELECT * FROM FACTURACIONBEPSA.SECFUNCTIONALITY S;
--------------------------------------------------------------------------------------------------------
ALTER TABLE facturacionbepsa.parametros ALTER COLUMN parmserial TYPE varchar(40) USING parmserial::varchar;
-------------------------------------------------------------------------------------------------------
--para eliminar clientes en éste orden.
SELECT * from facturacionbepsa.facclisuc c where clienteid = 4478618  and c.tipoclienteid = 'Funcionario';
--DELETE  from facturacionbepsa.facclisuc c where clienteid = 4478618  and c.tipoclienteid = 'Funcionario';

SELECT * from facturacionbepsa.sucursal c where clienteid = 4478618  and c.tipoclienteid = 'Funcionario';
--DELETE from facturacionbepsa.sucursal c where clienteid = 4478618  and c.tipoclienteid = 'Funcionario';

SELECT * from facturacionbepsa.cliente c where clienteid = 1 and c.tipoclienteid = 'Funcionario';
--DELETE from facturacionbepsa.cliente c where clienteid = 1 and c.tipoclienteid = 'Funcionario';
-------------------------------------------------------------------------------------------------------
SELECT * FROM FACTURACIONBEPSA.FACVENTA F WHERE F.FACVENTANUMERO='714';
SELECT * FROM FACTURACIONBEPSA.CLIENTE C WHERE CLIENTEEMAIL LIKE '%carla%';
SELECT * FROM FACTURACIONBEPSA.PARAMETROS P;
update facturacionbepsa.cliente set clienteemail = trim(clienteemail);
update facturacionbepsa.facventa f set facventacliemail = trim(facventacliemail);
update facturacionbepsa.facventa set facventacliemail = trim(facventacliemail);
-------
SELECT * FROM FACTURACIONBEPSA.FACVENTA F;
SELECT * from facturacionbepsa.fn_get_facventa_by_periodo_targetfactid(2023, 8::smallint, 'SeguroMedico');

SELECT *
FROM FACTURACIONBEPSA.FACVENTA F
WHERE F.ESTABLECIMIENTOID = '001' AND F.PUNTOEXPEDICIONID = '003'
ORDER BY F.FACVENTACOMPROBANTESET;

SELECT * from facturacionbepsa.fn_get_periodo_activo_by_ejercicioid(2023);
SELECT * from facturacionbepsa.fn_get_facventa_by_facventanumero(55);
-------
--se pasa de 56 a 201 para punto de expedición 3
select timbradocomprobcajanprox from facturacionbepsa.timbradocomprobantecaja where establecimientoid = '001' and puntoexpedicionid = '003';
--para ver las facturas que quedaron con error
select * from facturacionbepsa.facventa f where establecimientoid = '001' and puntoexpedicionid = '003' and facventanumero >= 201 and facventanumero <= 256;
--para reprocesar las mismas
update facturacionbepsa.facventa set statusid = 'formulario' where establecimientoid = '001'
and puntoexpedicionid = '003' and facventanumero >= 201 and facventanumero <= 256;
--solución al link de la vista del pdf de sirius desde el controlcenter
select * from facturacionbepsa.parametros p where p.parmid = 'siriusServer';

--UPDATE facturacionbepsa.facventa f SET facventafecha = '20230831' WHERE facventafecha = '20230901';
----
SELECT * FROM FACTURACIONBEPSA.TARGETFACT T;--VENTA_ACTIVO_FIJO
select * from facturacionbepsa.tipoasientocontable t;
------------------------------#20230915#--------------------------------------
SELECT * FROM asientos.email_users;
-----##marcas
SELECT * from marcas.transactions where fecha >= '2024-11-14';
select * from marcas.transactions_visa where report_date >='20MAR24';
SELECT * from marcas.mastercard_switch order by mastercard_switch.REPORT_WORK_OF DESC; --where REPORT_WORK_OF >= '02/01/24';
/*tablas marcas
Para SWITCH
delete from marcas.mastercard_switch where report_work_of >= '12/21/24';
Para MST DUAL
delete from marcas.transactions where fecha = '2024-12-21';
Para VISA
delete from marcas.transactions_visa where report_date ='15DEC24';
---MST
refresh materialized view marcas.consolidado_dia;
refresh materialized view marcas.consolidado_dia_gs;
refresh materialized view marcas.consolidado_dia_usd;
refresh materialized view marcas.consolidado_resumen_gs;
refresh materialized view marcas.consolidado_resumen_usd;
refresh materialized view marcas.consolidado_preasiento_gs;
refresh materialized view marcas.consolidado_preasiento_usd; --ojo..cuando subir después de subir archivos.!!
--SWTF
refresh materialized view marcas.mst_switch_consolidado;
refresh materialized view marcas.mst_switch_consolidado_pyg;
refresh materialized view marcas.mst_switch_consolidado_usd;
refresh materialized view marcas.mst_switch_consolidado_diario_pyg;
refresh materialized view marcas.mst_switch_consolidado_diario_usd;
refresh materialized view marcas.mst_switch_consolidado_preasiento;
--VSA
refresh materialized view marcas.visa_consolidado;
refresh materialized view marcas.visa_consolidado_adq;
refresh materialized view marcas.visa_consolidado_adq_pyg;
refresh materialized view marcas.visa_consolidado_adq_pyg_diario;
refresh materialized view marcas.visa_consolidado_adq_usd;
refresh materialized view marcas.visa_consolidado_adq_usd_diario;
refresh materialized view marcas.visa_consolidado_emi;
refresh materialized view marcas.visa_consolidado_emi_pyg;
refresh materialized view marcas.visa_consolidado_emi_pyg_diario_472040004;
refresh materialized view marcas.visa_consolidado_emi_pyg_diario_456976;
refresh materialized view marcas.visa_consolidado_emi_pyg_diario_45943000;
refresh materialized view marcas.visa_consolidado_emi_pyg_diario_488234;
refresh materialized view marcas.visa_consolidado_emi_pyg_diario_total;
refresh materialized view marcas.visa_consolidado_emi_usd;
refresh materialized view marcas.visa_consolidado_emi_usd_diario_472040004;
refresh materialized view marcas.visa_consolidado_emi_usd_diario_456976;
refresh materialized view marcas.visa_consolidado_emi_usd_diario_45943000;
refresh materialized view marcas.visa_consolidado_emi_usd_diario_488234;
refresh materialized view marcas.visa_consolidado_emi_usd_diario_total;
refresh materialized view marcas.visa_consolidado_total_preasiento;*/ --tabla marcas delete y refresh
---------------------------------------------------------------
SELECT * FROM facturacionbepsa.fn_get_secuser_by_username(1);

select * from asientos.asientos.cuenta_cont_proceso_cabe ccpc where ccpc.grupo = 'MMI';
select * from asientos.asientos.cuenta_cont_proceso_cabe ccpc where ccpc.grupo = 'MMI' and ccpc.servicio_activo = 'SI';

select * from asientos.cuenta_cont_proceso_cabe;
SELECT * FROM asientos.datos.CUENTAAUXILIARCONTABLE C;
SElect tipo_asiento, count(tipo_asiento) from asientos.cuenta_cont_proceso_cabe group by tipo_asiento
having count(tipo_asiento) >1;

--comentario--ver
/*--Estas tablas del esquema Asientos deben tener los mismos valores que DESARROLLO
--asiento_diario_ws
--cuenta_cont_imputable
--cuenta_cont_proceso_cabe
--cuenta_cont_proceso_deta
--cuentascombinaciones
--email_users
--entidad_cta_aux
--feriados
--parametros_fechas
--parm_hard_values
--tipos_asiento_k2b
--(salvo el asiento_diario_ws)*/

/*Query para mostrar/eliminar datos de Presientos para una fecha ejemplo: VISA GS - ID: 87*/
select * from asientos.asientos.asiento_diario_ws  where id_cta_cont_cabe = 87 and fecha_mov = '20230801';
--delete from asientos.asiento_diario_ws c where c.id_cta_cont_cabe  = 87--and c.fecha_mov = '20230831'

--##select para verificar asientos concluidos (para extorno) ANTES DE LIMPIAR LAS TABLAS==
select distinct
	asiento.nro_asiento_k2b, asiento.id_cta_cont_cabe, asiento.fecha_mov
from (
	select
		adw.fecha_mov, adw.cuentacontablecodigo, adw.cuentaauxcontablecodigo, adw.tipomovimiento, adw.importemonedaorigen,
		adw.nro_asiento_k2b, adw.estado_proceso, adw.descripcion_estado_proceso, adw.id_cta_cont_cabe
	from asientos.asientos.asiento_diario_ws adw
	where adw.id_cta_cont_cabe in (84,85,86,87,92,93)
	  --and adw.fecha_mov = '20230808' --se puede comentar para sacar todo el historial
) asiento
order by asiento.nro_asiento_k2b;
--usar este query para eliminar los asientos desde pre_asientos; luego de extornar en k2b
delete from asientos.asientos.asiento_diario_ws
       where id_cta_cont_cabe in (84,85,86,87,92,93); --aquí se pueden agregar más condiciones: fecha, asientoK2B, etc.;
SELECT * FROM asientos.asientos.asiento_diario_ws WHERE asiento_diario_ws.NRO_ASIENTO_K2B IN ('79412', '79414', '79415', '79416', '79417');
DELETE FROM asientos.asientos.asiento_diario_ws WHERE asiento_diario_ws.NRO_ASIENTO_K2B='59828';
select * from asientos.pr_det_mst_swt_usd('20230807');

select * from asientos.asientos.pr_pre_asto_mst_swt_usd('20230807');
select * from asientos.asientos.pr_pre_asto_mst_swt_gs('20230807');

SELECT * FROM MARCAS.MST_SWITCH_CONSOLIDADO_PREASIENTO MSCP WHERE FECHA='20230807';
-----------------
SELECT total_adq, total_emis
	FROM marcas.consolidado_resumen_usd
where substring(fecha,1,7)='2023-09'
order by fecha asc;
----
SELECT total_adq, total_emis
	FROM marcas.CONSOLIDADO_RESUMEN_GS CRG
where substring(fecha,1,7)='2023-09'
order by fecha asc;
----
SELECT * FROM FACTURACIONBEPSA.FACVENTADET F WHERE F.FACVENTAID='129809';
------------------------------------------
---- ver actividad de database y matar sesiones
select
	datid, usename, wait_event_type, wait_event, state,	query, datname,	pid, usesysid, usename,	application_name, backend_xmin,
	client_addr, client_hostname, client_port, backend_start, xact_start, query_start, state_change, backend_xid, backend_type
	--,pg_terminate_backend(pg_stat_activity.pid)
from
	pg_stat_activity
where
	datname = 'asientos'
	and pid <> pg_backend_pid()
	--and state <> 'active'
	--AND usename = 'usrclt'
order by state;

SELECT pg_terminate_backend(36803);
--------------------------------
SELECT * FROM FACTURACIONBEPSA.SECFUNCTIONALITY S;
-- funcionalidades (cambiar los ids correspondientes)
INSERT INTO FACTURACIONBEPSA.SECFUNCTIONALITY (SECFUNCTIONALITYKEY, SECFUNCTIONALITYDESCRIPTION, SECFUNCTIONALITYTYPE, SECPARENTFUNCTIONALITYID, SECFUNCTIONALITYACTIVE)
VALUES ('FORMA_PAGO', 'Ventana para administrar Formas de Pago', 4, 0, TRUE);

SELECT * FROM FACTURACIONBEPSA.FACVENTACUOTA F;
SELECT * FROM ASIENTOS.CUENTASCOMBINACIONES C;
REFRESH MATERIALIZED VIEW asientos.asientos.VW_REFERECIAS;
----------------------
drop materialized view MARCAS.consolidado_resumen_gs;
-----
---------------------#facturación PLANILLA CSV#---------------
insert into facturacionbepsa.cliente
      (tipoclienteid, clienteid, clienterazonsocial, clientetipopersona, clienteruc, clientedv, clientedomicilio,
      clidepartamentoid, cliciudadid, clibarrioid, clientegeolocation, clienteemail, clientephone,
      rpbepsaid, tipodocumentoid, clientetipocontrib)
select
      'Comercio' as tipoclienteid,
      tcli.cliclicod as clienteid,
      tcli.clirazsoc as clienterazonsocial,
      case when tso.tsocodigo = 1 then 'PERFI' else 'PERJU' end as clientetipopersona,
      facturacionbepsa.fn_quitar_dv_ruc(tcli.cliruc) as clienteruc,
      facturacionbepsa.fn_calcular_dv(facturacionbepsa.fn_quitar_dv_ruc(tcli.cliruc)) as clientedv,
      tsuc.sucdirecc as clientedomicilio, -- obtener domicilio de la Sucursal 1
      '1' as clidepartamentoid,
      '1' as cliciudadid,
      '1' as clibarrioid,
      tsuc.sucgeoloc as clientegeolocation,
      coalesce (tsuc.succorreo, 'tesoreria@bepsa.com.py') as clienteemail,
      coalesce (tsuc.suctelmo1, 's/Tel') as clientephone,
      '00' as rpbepsaid,
      case when tso.tsocodigo = 1 then 'CEPYA' else 'RUC' end as tipodocumentoid,
      'CONTE' as clientetipocontrib
from
      datos.gxfindta_tcmcli tcli
            inner join DATOS.gxfindta_tcmsuc tsuc on tsuc.cliclicod = tcli.cliclicod
            inner join DATOS.GXFINDTA_TCMTSO tso on tsuc.tsocodigo = tso.tsocodigo
where
      tcli.cliclicod in
            (select distinct tpos.cliclicod
            from datos.gxfindta_tcmtif tpos
            where tpos.tiffecfac between :vFechaIni and :vFechaFin)
      and tsuc.sucsuccod = 1  --datos de la Empresa (Direcciòn y demàs)
      and tcli.clitipcom in ('C')
ON CONFLICT (tipoclienteid, clienteid) DO nothing;
----------------------------------------------------------------------------------------
SELECT * FROM FACTURACIONBEPSA.FACVENTA F WHERE F.FORMAPAGOID ISNULL AND F.FACVENTACONDICION='CRDTO';
SELECT * FROM FACTURACIONBEPSA.FORMAPAGO F;

SELECT * FROM facturacionbepsa.menuitem WHERE MENUITEMCAPTION='Recibo de Cobro Dinámico';

--facturas contado
INSERT INTO FACTURACIONBEPSA.FACVENTACUOTA
(FACVENTAID, FACVENTACUOTAID, FACVENTACUOTADESC, FACVENTACUOTAFECHAVENC, FACVENTACUOTAIMPORTETOTAL,
 FACVENTACUOTAFECHAUPAGO, FACVENTACUOTAIMPORTEUPAGO, FACVENTACUOTARECIBOIDUPAGO, FACVENTACUOTARECIBONROUPAGO,
 FACVENTACUOTANOTAS, FACVENTACUOTAIMPORTESALDO, FACVENTACUOTASTATUS)
SELECT F.FACVENTAID             AS FACVENTAID,
       1                        AS FACVENTACUOTAID,
       'Insertado por sysAdmin' AS FACVENTACUOTADESC,
       F.FACVENTAFECHA          AS FACVENTACUOTAFECHAVENC,
       F.FACVENTATOTALCOMPROBML AS FACVENTACUOTAIMPORTETOTAL,
       F.FACVENTAFECHA          AS FACVENTACUOTAFECHAUPAGO,
       F.FACVENTATOTALCOMPROBML AS FACVENTACUOTAIMPORTEUPAGO,
       0                        AS FACVENTACUOTARECIBOIDUPAGO,
       '000.000.0000000'        AS FACVENTACUOTARECIBONROUPAGO,
       'Insertado por sysAdmin' AS FACVENTACUOTANOTAS,
       0                        AS FACVENTACUOTAIMPORTESALDO,
       'Cancelado'              AS FACVENTACUOTASTATUS
FROM FACTURACIONBEPSA.FACVENTA F
WHERE F.FORMAPAGOID IS NULL
  AND F.FACVENTACONDICION = 'CNTDO';
COMMIT;

UPDATE FACTURACIONBEPSA.FACVENTA
SET FORMAPAGOID         = 'CONTADO',
    FACVENTAFECHAVENCIM = FACVENTAFECHA
WHERE FORMAPAGOID IS NULL
  AND FACVENTACONDICION = 'CNTDO';
COMMIT;
-----------------------------------------
SELECT * FROM FACTURACIONBEPSA.FACVENTA F WHERE F.FACVENTACOMPROBANTESET='001-003-0001008'; --130081
SELECT * FROM FACTURACIONBEPSA.FACVENTACUOTA F WHERE F.FACVENTAID='130081';
--para corregir el saldo
UPDATE FACTURACIONBEPSA.FACVENTACUOTA
SET FACVENTACUOTAIMPORTESALDO = FACVENTACUOTAIMPORTETOTAL
WHERE FACVENTAID IN (SELECT F.FACVENTAID FROM FACTURACIONBEPSA.FACVENTA F WHERE F.FACVENTACONDICION = 'CRDTO' AND F.FORMAPAGOID = 'CREDITO-21D');
-----------------------------------------
SELECT * FROM FACTURACIONBEPSA.CLIENTE C WHERE C.CLIENTERUC='80016096';--RetailFE-Sifen@retail.com.py
------------PARA CAMBIAR FECHA RECIBOS SE CAMBIA esFechaManual Deshabilitada EN LA PARAMETRICA EN NO MIENTRAS
SELECT * FROM FACTURACIONBEPSA.RECCOBRO R;
SELECT * FROM FACTURACIONBEPSA.RECCOBRODET R WHERE R.RECCOBROID='6'; --SE SACA EL NUMERO DE FACTURA --001-003-0000502 --001-003-0000744
SELECT * -- Y SE CAMBIA EN LA FACTURA TAMBIÉN
FROM FACTURACIONBEPSA.FACVENTACUOTA F
WHERE F.FACVENTAID IN (SELECT F2.FACVENTAID FROM FACTURACIONBEPSA.FACVENTA F2 WHERE F2.FACVENTACOMPROBANTESET IN ('001-003-0000502', '001-003-0000744'));
----------------------------------------------
------facturar a mano
--------------facturar de forma manual --comercio  para desa-- timbrado desa= 12560254 --forma de pago= 'Contado'
SELECT FACTURACIONBEPSA.SP_INSERT_FACTVENTA
       ('FAECA', '16410772', '001', '002', 'C-000',
        2024, 03,        'FactComercios', 'PYG', 'Comercio', 'CONTADO',
        'Administrator', '', 'Comercios');
---retail  --80016096-7
SELECT FACTURACIONBEPSA.SP_INSERT_FACTVENTA
       ('FAECA', '16410772', '001', '002', 'C-000',
        2024, 03, 'FactComercios', 'PYG', 'Comercio', 'CONTADO',
        'Administrator', '', 'Retail');

SELECT * FROM asientos.facturacionbepsa.FACVENTA F WHERE F.FACVENTAFECHA='2024-03-27' AND F.CLIENTEID=10937 AND F.STATUSID='preformulario';
SELECT *
FROM ASIENTOS.FACTURACIONBEPSA.FACVENTADET F WHERE F.FACVENTAID=286089;
----control
Select movcodcli, movcodsuc, movcomer, movdeno, MOVTPTA,count(*) CANTIDAD, sum(movimco) COMISION, sum(movivco)IVACOMISION,
sum(movimco+movivco)"COMISION+IVA" from gxfindta.tclmov where movcodcli = 10937 and sercodi = 'COMPRA' AND movfCRE between '20240131' and '20240227'
group by movcodcli, movcodsuc, movcomer, movdeno, MOVTPTA;

---OPERADORAS
SELECT FACTURACIONBEPSA.SP_INSERT_FACTVENTA
       ('FAECA', '16410772', '001', '002', 'C-000',
        2024, 03, 'FactComercios', 'PYG', 'Comercio', 'CONTADO',
        'Administrator', '', 'Operadoras');
-- 10341 = Tigo/Telecel -- 10999 = Nucleo/Personal -- 11728 = Claro/AMX Paraguay

SELECT * FROM asientos.facturacionbepsa.FACVENTA F WHERE F.FACVENTAFECHA='2024-03-21' AND F.STATUSID='preformulario';
------------------------------------------------------
CALL FACTURACIONBEPSA.FN_GET_FACVENTA_ENVIAR_SIRIUS() p_timbradoid := '12560254',
                                p_tipocomprobanteid := 'FAECA',
                                p_establecimientoid := '001',
                                p_puntoexpedicionid := '002',
                                p_timbradocomprobantecajaid := 'C-000',
                                p_ejercicioid := 2024,
                                p_periodoid := 01,
                                p_targetfactid := 'FactComercios',
                                p_rangoinicial := 1,
                                p_rangofinal := 9999999,
                                p_statusid := 'formulario');
----para excel de lo facturado
SELECT F.TARGETFACTID,
       F.FACVENTAID,
       F.FACVENTAFECHA,
       F.FACVENTACOMPROBANTESET,
       F.TIPOCLIENTEID,
       F.CLIENTEID,
       F.SUCURSALID,
       S.SUCURSALCOMERCIOBEPSA,
       F.FACVENTACLIRUC,
       F.FACVENTACLIRAZONSOCIAL,
       F.FACVENTACLIDIRECCION,
       F.FACVENTACLIEMAIL,
       F.FACVENTATOTALCOMPROBML,
       F.FACVENTATOTALEXCML,
       F.FACVENTATOTALGR05ML,
       F.FACVENTATOTALGR10ML,
       F.FACVENTATOTALBASEIMPEXCML,
       F.FACVENTATOTALBASEIMPGR05ML,
       F.FACVENTATOTALBASEIMPGR10ML,
       F.FACVENTATOTALIVAGR05ML,
       F.FACVENTATOTALIVAGR10ML,
       F.FACVENTATOTALIVAGRAVADAML,
       F.STATUSID
FROM FACTURACIONBEPSA.FACVENTA F
         JOIN FACTURACIONBEPSA.CLIENTE C ON F.TIPOCLIENTEID = C.TIPOCLIENTEID
    AND F.CLIENTEID = C.CLIENTEID
         JOIN FACTURACIONBEPSA.SUCURSAL S ON F.TIPOCLIENTEID = S.TIPOCLIENTEID
    AND F.CLIENTEID = S.CLIENTEID
    AND F.SUCURSALID = S.SUCURSALID
WHERE F.TARGETFACTID = 'FactComercios'
  AND F.TIPOCLIENTEID = 'Comercio'
  AND F.STATUSID='preformulario'
  AND F.FACVENTAFECHA = '2024-04-30'
  --AND F.FACVENTACLIRUC LIKE '80016096%'
  AND FACVENTASTATUSLASTFH >= '2024-04-30 08:13:44.722';
---------------------------------------------------------------------
---SUPER REPORTE
SELECT FV.FACVENTAID,
       FV.FACVENTADESC,
       FV.TIPOCLIENTEID,
       FV.CLIENTEID,
       FV.SUCURSALID,
       SUC.SUCURSALCOMERCIOBEPSA,
       FV.FACVENTACLIRUC,
       FV.FACVENTACLIRAZONSOCIAL,
       FV.FACVENTACLIDIRECCION,
       SUC.SUCURSALDENOMINACION,
       SUC.SUCURSALDOMICILIO,
       SUC.SUCURSALEMAIL,
       SUC.SUCURSALPHONE,
       --FV.FACVENTACLIEMAIL,
       FV.FACVENTACLITELEFONO,
       FV.FACVENTATOTALCOMPROBML,
       FV.FACVENTATOTALEXCML,
       FV.FACVENTATOTALGR05ML,
       FV.FACVENTATOTALGR10ML,
       FV.FACVENTATOTALBASEIMPEXCML,
       FV.FACVENTATOTALBASEIMPGR05ML,
       FV.FACVENTATOTALBASEIMPGR10ML,
       FV.FACVENTATOTALIVAGR05ML,
       FV.FACVENTATOTALIVAGR10ML,
       FV.FACVENTATOTALIVAGRAVADAML,
       CLI.CLIENTETIPOPERSONA,
       CLI.CLIENTETIPOCONTRIB,
       CLI.CLIENTERUC,
       CLI.CLIENTEDV,
       FACTURACIONBEPSA.FN_VALIDAR_EMAIL(SUC.SUCURSALEMAIL) AS EMAILVALIDO
FROM FACTURACIONBEPSA.FACVENTA FV
         INNER JOIN FACTURACIONBEPSA.CLIENTE CLI
                    ON CLI.TIPOCLIENTEID = FV.TIPOCLIENTEID AND CLI.CLIENTEID = FV.CLIENTEID
         INNER JOIN FACTURACIONBEPSA.SUCURSAL SUC
                    ON FV.TIPOCLIENTEID = SUC.TIPOCLIENTEID AND FV.CLIENTEID = SUC.CLIENTEID AND FV.SUCURSALID = SUC.SUCURSALID
WHERE FV.TARGETFACTID = 'FactComercios'
  AND FV.TIPOCLIENTEID = 'Comercio'
  AND FV.FACVENTAFECHA = '20240327'
 -- AND FV.FACVENTACLIRUC LIKE '%80016096%'
  --AND STATUSID = 'preformulario'
ORDER BY CLI.CLIENTERUC DESC, CLI.CLIENTETIPOPERSONA DESC;

SELECT T.CLIRUc, T.CLICLICOD, G.SUCSUCCOD, g.SUCCORREO
FROM asientos.datos.GXFINDTA_TCMCLI T join asientos.datos.GXFINDTA_TCMSUC G on T.CLICLICOD = G.CLICLICOD order by 1,2,3 ;

SELECT DISTINCT T.CLIRUc, g.SUCCORREO
FROM asientos.datos.GXFINDTA_TCMCLI T join asientos.datos.GXFINDTA_TCMSUC G on T.CLICLICOD = G.CLICLICOD
WHERE g.SUCCORREO is NOT NULL;
----------------------------------------------------------------------
----para liquidacion en excel
SELECT --C.MOVRRNBEP                                                                                                        REFERENCIA,
       C.MOVCODCLI                                                                                                        CLIENTE,
       C.MOVCODSUC                                                                                                        SUCURSAL,
       C.MOVCOMER                                                                                                         CODIGO_COMERCIO,
       C.MOVDENO                                                                                                          DENOMINACION,
       (SELECT STRING_AGG(F.FACVENTACOMPROBANTESET, ', ')
        FROM FACTURACIONBEPSA.FACVENTA F
        WHERE F.CLIENTEID = C.MOVCODCLI
          AND F.SUCURSALID = C.MOVCODSUC
          AND F.STATUSID LIKE '%APROBADO%'
          AND F.TARGETFACTID = 'FactComercios'
          AND F.PERIODOID = '12'
          AND F.EJERCICIOID = '2024')                                                                                      COMPROBANTE,
       (SELECT T.SUCDIRECC FROM DATOS.GXFINDTA_TCMSUC T WHERE T.CLICLICOD = C.MOVCODCLI AND T.SUCSUCCOD = C.MOVCODSUC)     DIRECCION_SUC,
       C.MOVFTRX                                                                                                           FECHA_TRX,
       C.MOVFPRO                                                                                                           FECHA_PROCESO,
       C.MOVFCRE                                                                                                           FECHA_ACREDITACION,
       C.MOVTPTA                                                                                                           TIPO_TARJ,
       COUNT(1)                                                                                                            CANTIDAD_TRX,
       SUM(C.MOVIMPO)                                                                                                      IMPORTE,
       SUM(C.MOVIMCO)                                                                                                      IMPORTECOMISION,
       SUM(C.MOVIVCO)                                                                                                      IVAIMPORTECOMISION,
       SUM(C.MOVRENT)                                                                                                      IMPORTERENTA,
       SUM(C.MOVIVREN)                                                                                                     IMPORTEIVARENTA,
       SUM(C.MOVNETO)                                                                                                      IMPORTENETO
FROM FACTURACIONBEPSA.TCLMOV_TMP_COMERCIOS_202412_FACTCOMERCIOS C
--WHERE movopde = 700405 --para operadoras
WHERE C.MOVCODCLI IN (SELECT C.CLICLICOD FROM DATOS.GXFINDTA_TCMCLI C WHERE C.CLIRUC LIKE '%80097276%')
--AND C.MOVCODSUC=2 -- NOT IN ('1', '8')
GROUP BY C.MOVCODCLI, C.MOVCODSUC, C.MOVCOMER, C.MOVDENO, C.MOVFTRX, C.MOVFPRO, C.MOVFCRE, C.MOVTPTA --,C.MOVRRNBEP
ORDER BY C.MOVCODCLI, C.MOVCODSUC, C.MOVFTRX, C.MOVFPRO, C.MOVFCRE;
-------------------------
SELECT * FROM asientos.facturacionbepsa.CLIENTE C WHERE  C.CLIENTERUC='80097276';
SELECT * FROM asientos.facturacionbepsa.SUCURSAL S WHERE S.CLIENTEID=11373;
------------------------- reporte modelo pdf
SELECT C.movrrnbep                                                                                                         Id_Transac,
       C.MOVFTRX                                                                                                           FECHA_TRANS,
       C.MOVFPRO                                                                                                           FECHA_PROCESO,
       C.MOVFCRE                                                                                                           FECHA_ACREDIT,
       C.MOVTPTA                                                                                                           TIPO_TARJ,
       SUM(C.MOVIMPO)                                                                                                      IMPORTE_TRANSAC,
       SUM(C.MOVIMCO)                                                                                                      IMPORTE_COMISION,
       SUM(C.MOVIVCO)                                                                                                      IVA_COMISION,
       SUM(c.MOVIVCO+C.MOVIMCO)                                                                                            TOTAL_COMISION,
       SUM(C.MOVRENT)                                                                                                      IMPORTE_RENTA,
       SUM(C.MOVIVREN)                                                                                                     IVA_RENTA,
       sum(C.MOVIMCO+C.MOVIVCO+C.MOVRENT+C.MOVIVREN)                                                                      TOTAL_DESCUENTO,
       SUM(C.MOVNETO)                                                                                                      IMPORTE_NETO
FROM asientos.datos.GXFINDTA_TCLMOV C
--FROM FACTURACIONBEPSA.tclmov_tmp_comercios_202403_factcomercios C
--from FACTURACIONBEPSA.tclmov_tmp_operadoras_202403_factcomercios c
--FROM FACTURACIONBEPSA.tclmov_tmp_comercios_202403_factcomercios C
--FROM FACTURACIONBEPSA.tclmov_tmp_retail_202402_factcomercios C
--FROM TRUSTED_ZONE.GXFINDTA_TCLMOV_COMPLEMENTO C --COMPLEMENTO
--FROM FACTURACIONBEPSA.tclmov_tmp_comercios_202313_factcomercios C
--FROM FACTURACIONBEPSA.tclmov_tmp_comercios_202312_factcomercios c
--FROM FACTURACIONBEPSA.TCLMOV_TMP_COMERCIOS_202401_FACTCOMERCIOS C
--WHERE movopde=700605 --para operadoras
WHERE --C.MOVCODCLI IN (SELECT C.CLICLICOD FROM DATOS.GXFINDTA_TCMCLI C WHERE C.CLIRUC LIKE '%80030572%')
--AND C.MOVCODSUC=14 --NOT IN ('1', '8')
MOVFCRE BETWEEN '20240101' AND '20240131' AND MOVCODCLI = '11728'
GROUP BY c.movrrnbep, C.MOVFTRX, C.MOVFPRO, C.MOVFCRE, C.MOVTPTA
ORDER BY C.MOVFTRX, C.MOVFPRO, C.MOVFCRE;
-------------------------------------------------------------------------------------
SELECT * FROM GXTRJDTA.tdgent T WHERE T.ENTCODENT > 7000;
SELECT * FROM DATOS.GXFINDTA_TCMCLI T WHERE T.CLIRUC IN ('80063756-9','80063729-1');

SELECT T.MOVOPDE, T.*
FROM TRUSTED_ZONE.GXFINDTA_TCLMOV T
WHERE-- T.MOVIDLT='240020096900042'
 T.MOVOPDE = 700605
  AND T.SERCODI IN ('VTAMIN', 'PAGFAC')
  AND T.MOVFCRE BETWEEN '20240321' AND '20240420';

--('700405' --personal -- , '700105' -- tigo pre-paga -- , '700605' -- claro)
-- 10341 = Tigo/Telecel -- 10999 = Nucleo/Personal -- 11728 = Claro/AMX Paraguay
SELECT * FROM FACTURACIONBEPSA.tclmov_tmp_operadoras_202403_factcomercios c;
---------------------------------------------------------------------------
--monitoreo
SELECT --*
    F.TARGETFACTID,
    F.TIPOCLIENTEID,
    F.STATUSID, count(F.FACVENTANUMERO)
FROM FACTURACIONBEPSA.FACVENTA F
where F.TARGETFACTID = 'FACTALQPOS'
AND F.TIPOCLIENTEID = 'Comercio'
AND F.FACVENTAFECHA = '2024-04-10'
GROUP BY F.TARGETFACTID,
    F.TIPOCLIENTEID,
    F.STATUSID;

SELECT * FROM FACTURACIONBEPSA.FACVENTA F WHERE F.TARGETFACTID = 'FACTALQPOS'
AND F.TIPOCLIENTEID = 'Comercio'
AND F.FACVENTAFECHA = '2024-04-10' AND F.STATUSID='DE_RECHAZADO';
SELECT * FROM asientos.facturacionbepsa.FACVENTASTATUS F WHERE F.facventaid IN (363860, 363874, 365731, 366224, 363505, 363507, 363620, 363634, 363690, 363715, 363862, 363885, 363899, 363925, 363960, 363979, 364231, 364117, 364524, 364548, 364310, 364872, 364436, 365101, 365058, 365216, 365217, 365383, 365667, 365687, 366067, 366116, 366152, 363720, 363841, 365455);

SELECT F.CLIENTEID, F.* FROM asientos.facturacionbepsa.FACVENTA F WHERE facventaid IN (363505, 363507, 363620, 363634, 363690, 363715, 363720, 363841, 363860, 363925, 363960, 363979, 364117, 364231, 364310, 364436, 364524, 364548, 364872, 365058, 365101, 365216, 365217, 365383, 365455, 365667, 365687, 365731, 366067, 366116, 366152, 366224);

SELECT * FROM asientos.facturacionbepsa.CLIENTE C WHERE clienteid IN (20049, 20058, 20164, 20184, 20259, 20286, 20293, 20435, 20458, 20546, 20588, 20612, 20762, 20896, 20961, 21093, 21192, 21221, 21447, 21627, 21667, 21783, 21784, 21943, 22013, 22235, 22261, 22325, 22852, 22929, 22982, 23141); --IN (22740, 20058, 20184, 20164, 20293, 20435, 20546, 20605, 20612, 20896, 20762, 20961, 21093, 21192, 21667, 22261, 22263, 22235, 22325, 22494, 22599, 22655, 22852, 20049, 21221, 22677, 22013, 22982);
SELECT * FROM asientos.facturacionbepsa.SUCURSAL S WHERE S.CLIENTEID=7172;
-------------------------------------------------------------------------------
SELECT F.FACVENTANUMERO,
       F2.FACVENTASTATUSNOTAS,
       F.STATUSID,
       F.CLIENTEID,
       F.SUCURSALID,
       C.CLIENTETIPOPERSONA,
       F.FACVENTACLIRUC,
       C.TIPODOCUMENTOID,
       C.CLIENTETIPOCONTRIB,
       F.*
FROM ASIENTOS.FACTURACIONBEPSA.FACVENTA F
         INNER JOIN FACTURACIONBEPSA.FACVENTASTATUS F2 ON F.FACVENTAID = F2.FACVENTAID
         INNER JOIN FACTURACIONBEPSA.CLIENTE C ON F.CLIENTEID = C.CLIENTEID
WHERE F.STATUSID = 'DE_RECHAZADO'
  AND F.FACVENTAFECHA = '2024-04-30'
  AND F.TARGETFACTID = 'FactComercios' --F.FACVENTAID IN (191991,193412,193548,188631,195627,188837,189037,193268,188689)
  AND F2.FACVENTASTATUSITEM = 5;

SELECT F.FACVENTACLIEMAIL, F.CLIENTEID, F.SUCURSALID, F.*
FROM ASIENTOS.FACTURACIONBEPSA.FACVENTA F
WHERE F.STATUSID='formulario' AND F.TARGETFACTID='FactComercios';


--478775
SELECT
    FROM FACTURACIONBEPSA.FACVENTADET F
WHERE F.FACVENTAID IN (SELECT F2.FACVENTAID
                       FROM FACTURACIONBEPSA.FACVENTA F2
                       WHERE F2.TARGETFACTID = 'FactComercios'
                         AND F2.FACVENTAFECHA = '2024-04-30');
----------------------------------------------------
SELECT F.*
FROM FACTURACIONBEPSA.FACVENTA F
         INNER JOIN FACTURACIONBEPSA.FACVENTADET F2
                    ON F.FACVENTAID = F2.FACVENTAID
WHERE F.TARGETFACTID IN ('FactComercios')
  AND F.TIPOCLIENTEID = 'Comercio'
  AND F2.SERVPRESTID IN (SELECT INFO FROM FACTURACIONBEPSA.FN_OBTENER_PARMVALUE('desc_serv_prest', 'C') AS INFO);
----------------------------------------------------
SELECT * FROM facturacionbepsa.fn_get_info_retenciones_set(:p_tipocomprobanteid, :p_timbrado, :p_establecimientoid, :p_puntoexpedicionid, :p_timbradocomprobcajaid, :p_ejercicioid, :p_periodoid, :p_targetfactid, :p_monedaid, :p_tipoclienteid, :p_facventacondicion, :p_secusername);

--tabla donde se descargan las retenciones
SELECT F.FACVENTAID, F2.FACVENTACOMPROBANTESET, F2.FACVENTADESC, F2.FACVENTACLIRUC, F2.CLIENTEID, F2.SUCURSALID,
c.clienterazonsocial, c.CLIENTESTATUSSET stautsRUC,f.facventartsetprocesamientocorr, F.facventartsetmensajeprocesamie
FROM facturacionbepsa.FACVENTARTSET F
         inner join facturacionbepsa.FACVENTA F2 on F.facventaid=F2.FACVENTAID
        INNER JOIN asientos.facturacionbepsa.CLIENTE  c on F2.clienteid = c.clienteid
WHERE F.FACVENTARTSETLOTEID='a3874a2e-cf26-4435-9cf0-17aab9c0ea84' AND F.FACVENTARTSETPROCESAMIENTOCORR='false';
--query para ver lo que envía a la set O VER LO QUE ENVÍA.
SELECT * FROM FACTURACIONBEPSA.FN_GET_INFO_RETENCIONES_SET
('FAECA', '16410772', '001', '002',
'C-000', 2024, 12, 'FactComercios', 'PYG',
'Comercio', 'CNTDO', 'Administrator');

--SERVICIO PRESTACIÓN
SELECT * FROM FACTURACIONBEPSA.SERVPREST S;
SELECT * FROM FACTURACIONBEPSA.PARAMETROS P;

select * from facturacionbepsa.fn_obtener_parmvalue('desc_serv_prest','C');
select info from facturacionbepsa.fn_obtener_parmvalue('desc_serv_prest','C') as info;

SELECT F.FACVENTAID, F.FACVENTACLIDIRECCION, F.CLIENTEID, F.SUCURSALID, F.*
FROM FACTURACIONBEPSA.FACVENTA F
WHERE F.FACVENTAID IN (SELECT * FROM facturacionbepsa.sp_insert_cliente('Comercios');
SELECT * FROM facturacionbepsa.sp_insert_sucursal('Comercios');
SELECT * FROM facturacionbepsa.sp_insert_clifactsuc('Comercios');
                       130630, 130633, 130634, 130635, 130636, 130637);
SELECT * FROM FACTURACIONBEPSA.SUCURSAL S WHERE S.TIPOCLIENTEID='Comercio' AND S.CLIENTEID='553';

SELECT * FROM DATOS.GXFINDTA_TCMSUC T WHERE T.CLICLICOD='553';

---modelo de asientos
SELECT * FROM facturacionbepsa.tipoasientocontable t;--cabezera
SELECT * FROM facturacionbepsa.tipoasientocontabledet t;--det

SELECT * FROM ASIENTOS.ASIENTOS.pr_det_facturacion_ventas_gs_94('20231128');
------------------------------------------

--facturacionbepsa.sp_generate_tclmov_month_tmp -- principal
--facturacionbepsa.sp_generate_tclmov_month_tmp_master
-----
SELECT * FROM FACTURACIONBEPSA.ENTFINANCIERA E;

REFRESH MATERIALIZED VIEW facturacionbepsa.info_ctas_bancarias_ti;

--FROM CONCILIACION.BANCO_CUENTA BC

SELECT * from ASIENTOS.pr_ver_facturacion_ventas_gs_94('20231220');
SELECT * from ASIENTOS.pr_ver_facturacion_ventas_gs_94_det('20231220');
SELECT * FROM FACTURACIONBEPSA.TIPOASIENTOCONTABLE;
SELECT * FROM FACTURACIONBEPSA.TIPOASIENTOCONTABLEDET T WHERE tipoasientocontabledetctaaux='@VTA-CLI-SUC-GS';

UPDATE FACTURACIONBEPSA.TIPOASIENTOCONTABLEDET T SET tipoasientocontabledetctaaux=' ' WHERE tipoasientocontabledetctaaux='null';


SELECT *
FROM FACTURACIONBEPSA.TIPOASIENTOCONTABLEDET T WHERE T.TIPOASIENTOCONTABLEID IN
(
SELECT DISTINCT F.TIPOASIENTOCONTABLEID
FROM FACTURACIONBEPSA.FACVENTA F
WHERE F.FACVENTAFECHA = '2023-12-20'
)
AND T.TIPOCOMPROBANTEID = 'FAECA';

--1.1.3.1.3.08

SELECT * FROM ASIENTOS.asientos.pr_det_facturacion_ventas_gs_94('20231220');
SELECT * FROM ASIENTOS.asientos.pr_ver_facturacion_ventas_gs_94('20231220');

SELECT *
FROM FACTURACIONBEPSA.PARAMETROS P
WHERE P.PARMID = 'tipoAsientoKeyPhrase';

SELECT F.TARGETFACTID, F.TIPOCLIENTEID, F.TIPOASIENTOCONTABLEID, F.STATUSID, F.MONEDAID, F.FACVENTAID, F.FACVENTATOTALBASEIMPCOMPROBML, F.FACVENTATOTALBASEIMPEXCML, F.FACVENTATOTALBASEIMPGR05ML, F.FACVENTATOTALBASEIMPGR10ML, F.FACVENTATOTALCOMPROBML
FROM FACTURACIONBEPSA.FACVENTA F
WHERE F.STATUSID = 'DTE_APROBADO'
AND F.FACVENTAFECHA = '2023-12-20';

SELECT *
FROM asientos.facturacionbepsa.TIPOASIENTOCONTABLEDET T
WHERE T.TIPOCOMPROBANTEID = 'FAECA'
AND T.TARGETFACTID = 'FACTEMPES'
AND T.TIPOASIENTOCONTABLEID = 'FactComercio';

SELECT T.*
FROM (SELECT F.TIPOCOMPROBANTEID, F.TARGETFACTID, F.TIPOASIENTOCONTABLEID, COUNT(F.TARGETFACTID)
      FROM ASIENTOS.FACTURACIONBEPSA.FACVENTA F
      WHERE F.FACVENTAFECHA = '2023-12-20'
      GROUP BY F.TIPOCOMPROBANTEID, F.TARGETFACTID, F.TIPOASIENTOCONTABLEID) tabla
INNER JOIN asientos.facturacionbepsa.TIPOASIENTOCONTABLEDET T
    ON T.TIPOCOMPROBANTEID = TABLA.TIPOCOMPROBANTEID AND t.TARGETFACTID = TABLA.TARGETFACTID AND t.TIPOASIENTOCONTABLEID = TABLA.TIPOASIENTOCONTABLEID
WHERE T.TIPOASIENTOCONTABLEID = 'MONIATM';

SELECT *
FROM asientos.asientos.ASIENTO_DIARIO_WS ADW
WHERE ADW.ID_CTA_CONT_CABE = 94;


select *
from facturacionbepsa.periodotargetfactcycle p
where p.periodoid = 12;

SELECT FACTURACIONBEPSA.SP_GENERATE_TCLMOV_MONTH_TMP(
               ARRAY ['2023-11-21', '2023-12-20'],
               ARRAY ['2023-11-21', '2023-12-20'],
               ARRAY ['2023-11-21', '2023-12-20'],
               'Operadoras'
       );

call facturacionbepsa.sp_generate_tclmov_month_tmp_master('Operadoras');
call facturacionbepsa.sp_generate_tclmov_month_tmp_detail('Operadoras');
SELECT * FROM facturacionbepsa.sp_generate_tclmov_month_transactional(2023::integer, 12::integer, 'FactComercios'::character varying, 'Operadoras'::character varying);

SELECT DISTINCT TTO202312F.movcodcli, TTO202312F.MOVCODSUC FROM FACTURACIONBEPSA.TCLMOV_TMP_OPERADORAS_202312_FACTCOMERCIOS TTO202312F;

SELECT * FROM facturacionbepsa.facventa f WHERE f.FACVENTACOMPROBANTESET='001-003-0001193';
SELECT * FROM FACTURACIONBEPSA.CLIENTE C WHERE C.CLIENTEID='26800';
SELECT * FROM facturacionbepsa.facventacuota f WHERE f.facventaid = 129834;
SELECT * FROM facturacionbepsa.facventacuota f WHERE facventacuotastatus='Activo';

UPDATE FACTURACIONBEPSA.FACVENTACUOTA F
SET FACVENTACUOTAIMPORTESALDO=FACVENTACUOTAIMPORTETOTAL
WHERE F.FACVENTACUOTAIMPORTESALDO IS NULL
  AND FACVENTACUOTASTATUS = 'Activo';
----------
select ss.*
from facturacionbepsa.sucursal ss
where ss.tipoclienteid = 'Funcionario'
and ss.sucursalcanalcobro is not null;

select ss.*
from facturacionbepsa.sucursal ss
where ss.tipoclienteid like '%Funcionario%'
and ss.sucursalcanalcobro IN ('DD', 'DA', 'DB');

SELECT *
FROM FACTURACIONBEPSA.sucursal
WHERE sucursal.TIPOCLIENTEID = 'Funcionario'
AND sucursal.SUCURSALDENOMINACION LIKE '%RODRIGUEZ%';

SELECT * FROM facturacionbepsa.fn_get_all_facventa_cuotas_pend(p_fecha date, p_canalid character varying);
-----------------------------------------------------------------------------------------------------------------------------------------------

SELECT *
FROM FACTURACIONBEPSA.TIPOASIENTOCONTABLE T
WHERE T.TIPOCOMPROBANTEID = 'RECIBO';

SELECT *
FROM asientos.facturacionbepsa.TIPOASIENTOCONTABLEDET T
INNER JOIN FACTURACIONBEPSA.RECCOBRO R ON T.TARGETFACTID = R.TARGETFACTID AND R.TIPOCOMPROBANTEID = T.TIPOCOMPROBANTEID AND R.TIPOASIENTOCONTABLEID = T.TIPOASIENTOCONTABLEID
ORDER BY t.TIPOCOMPROBANTEID, t.TARGETFACTID, t.TIPOASIENTOCONTABLEID;

SELECT R.RECCOBROFECHA
FROM asientos.facturacionbepsa.RECCOBRO R
WHERE R.MONEDAID = 'PYG';

SELECT *
FROM asientos.pr_det_recibo_cobro_gs_128('20231213');

SELECT *
FROM asientos.ASIENTOS.pr_det_facturacion_ventas_gs_94('20231222');

SELECT *
FROM asientos.facturacionbepsa.TIPOASIENTOCONTABLEDET T
WHERE T.TIPOCOMPROBANTEID = 'RECIBO' AND T.TARGETFACTID = 'RecuperoBNF';


select *
FROM asientos.asientos.CUENTA_CONT_PROCESO_CABE CCPC
WHERE CCPC.ID_CTA_CONT_CABE IN (94,128);

ALTER TABLE asientos.cuenta_cont_proceso_cabe ALTER COLUMN id_cta_cont_cabe ADD GENERATED ALWAYS AS IDENTITY (INCREMENT BY 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 129 CACHE 1 NO CYCLE);

SELECT *
FROM asientos.asientos.ASIENTO_DIARIO_WS ADW
WHERE ADW.NRO_ASIENTO_K2B IN ('69105', '69106', '69107', '69108', '69109');

SELECT *
FROM asientos.facturacionbepsa.FACVENTASTATUS F
WHERE F.FACVENTAASIENTONUMERO > 0;
---------------------------------

SELECT *
FROM asientos.facturacionbepsa.TIPOASIENTOCONTABLEDET T
INNER JOIN FACTURACIONBEPSA.FACVENTA F ON T.TIPOCOMPROBANTEID = F.TIPOCOMPROBANTEID AND T.TARGETFACTID = F.TARGETFACTID AND T.TIPOASIENTOCONTABLEID = F.TIPOASIENTOCONTABLEID
WHERE F.FACVENTAFECHA = '2023-12-22'
AND F.MONEDAID = 'PYG'
AND F.STATUSID = 'DTE_APROBADO'
AND coalesce (facturacionbepsa.fn_obtener_facventa_asiento(f.facventaid), 0) = 0;


WHERE f.statusid IN ('DTE_APROBADO')
        AND coalesce (facturacionbepsa.fn_obtener_facventa_asiento(f.facventaid), 0) = 0
        AND f.tipocomprobanteid = 'FAECA'
        AND t.tipoasientocontableactivo = 'SI'
        AND t.tipoasientocontablenroproceso = '94'	--:p_tipoasientocontablenroproceso
        and f.monedaid = 'PYG'
        AND to_char(f.facventafecha,'YYYYMMDD') = p_fecha_fact
---------------------------------------------------
SELECT
	*
FROM
	facturacionbepsa.tipoasientocontabledet t
WHERE
	t.tipocomprobanteid = 'RECIBO'
	--AND t.targetfactid = 'PROCENTI'
	AND t.tipoasientocontableid = 'DB.AUTOMATICO GNB';

SELECT * FROM facturacionbepsa.fn_get_tipoasientocontabledet_by_tipocomprobante_tipoasientoid('RECIBO', 'DB.AUTOMATICO GNB');
----------------------------------------------------------------------------------------------------
SELECT * from  facturacionbepsa.sp_insert_cliente('');

 SELECT * from  facturacionbepsa.sp_insert_sucursal('');

SELECT * from facturacionbepsa.sp_insert_clifactsuc('');

SELECT facturacionbepsa.fn_fpos_planillacsv(:vfechaini, :vfechafin, :tipoproducto);

select *
from facturacionbepsa.sucursal s
where facturacionbepsa.fn_validar_email(s.sucursalemail) = false ;

--verificación de facturas de Retail
--80016096-7
--80000519-8 TELECEL
--80017437-2 NUCLEO S.A.

--para numerar
SELECT * FROM facturacionbepsa.fn_enumerar_facturas('16410772','FAECA','001','002','C-000',2023,12,'FactComercios','Administrator');

---valida email
select *
from facturacionbepsa.sucursal s
where facturacionbepsa.fn_validar_email(s.SUCURSALEMAIL) = false ;


SELECT *
FROM asientos.facturacionbepsa.CLIENTE C
WHERE C.CLIENTERUC::numeric >= 80000000
AND (C.CLIENTETIPOPERSONA = 'PERFI' and C.CLIENTETIPOCONTRIB = 'CONTE'AND tipodocumentoid='RUC');

UPDATE asientos.facturacionbepsa.CLIENTE C
SET CLIENTETIPOPERSONA = 'PERJU', TIPODOCUMENTOID = 'RUC'
WHERE CLIENTERUC::numeric >= 80000000;
-------------------------

SELECT *
FROM asientos.facturacionbepsa.FACVENTA F
WHERE F.TARGETFACTID = 'FactComercios' AND F.TIPOCLIENTEID = 'Comercio' AND F.FACVENTAFECHA = '2023-12-31';

/*UPDATE asientos.facturacionbepsa.FACVENTA F
SET FACVENTAFECHA = '2023-12-31'
WHERE F.TARGETFACTID = 'FactComercios' AND F.TIPOCLIENTEID = 'Comercio' AND F.FACVENTAFECHA = '2024-01-02';*/

/*UPDATE asientos.facturacionbepsa.FACVENTA F
SET facventadesc = replace(facventadesc, '20240102', '20231231')
WHERE F.TARGETFACTID = 'FactComercios' AND F.TIPOCLIENTEID = 'Comercio' AND F.FACVENTAFECHA = '2023-12-31';*/

SELECT * FROM asientos.asientos.CUENTASCOMBINACIONES C;

SELECT * FROM asientos.datos.CUENTAAUXILIARCONTABLE C;

SELECT F.STATUSID, count(F.FACVENTAID)
FROM asientos.facturacionbepsa.FACVENTA F
WHERE F.TARGETFACTID = 'FactComercios' AND F.TIPOCLIENTEID = 'Comercio' AND F.FACVENTAFECHA = '2023-12-31'
GROUP BY F.STATUSID;

SELECT * FROM CONCILIACION.EXTRACTOS_NO_CONCILIADOS ENC;

SELECT * FROM CONCILIACION.EXTRACTOS_INFORME EI;

SELECT *
FROM asientos.facturacionbepsa.FACVENTA F
WHERE F.TARGETFACTID = 'FactComercios' AND F.TIPOCLIENTEID = 'Comercio' AND F.FACVENTAFECHA = '2023-12-31' AND F.STATUSID='DTE_APROBADO';

--Este documento se quedo en cola 001-002-11606
--Este documento se quedo en cola 001-002-10632

SELECT * FROM asientos.facturacionbepsa.FACVENTADET F WHERE F.FACVENTAID='135600';

SELECT * FROM asientos.facturacionbepsa.CLIENTE C WHERE C.CLIENTEID='10736';

SELECT * FROM DATOS.GXFINDTA_TCMCLI T WHERE T.CLICLICOD='10736';
SELECT * FROM asientos.datos.GXFINDTA_TCMSUC T WHERE T.CLICLICOD='10736';
---------------------------------------------------------
SELECT * from facturacionbepsa.sp_insert_factventa;

select facturacionbepsa.fn_quitar_dv_ruc('80016096-7');


-- select sobre RUC (CERO) en factventa
    --> cliente
-- update cliente con ruc(cero) a partir de facVenta c/ RUC(cero)
-- clonar factura con ruc(CERO) --> preformulario
    --> verificar: correo, telefono, ruc

SELECT *
FROM asientos.datos.GXFINDTA_TCMCLI T;


SELECT *
FROM asientos.facturacionbepsa.CLIENTE C
INNER JOIN asientos.facturacionbepsa.FACVENTA F
    ON C.TIPOCLIENTEID = f.TIPOCLIENTEID and C.CLIENTEID = F.CLIENTEID
WHERE F.TARGETFACTID = 'FactComercios'
    and F.TIPOCLIENTEID = 'Comercio'
    AND F.FACVENTAFECHA = '2023-12-31'
    and F.FACVENTACLIRUC = '0-0';


--fn_calcular_dv
--fn_quitar_dv_ruc
------para arreglar el ruc
    insert into facturacionbepsa.cliente
        (tipoclienteid, clienteid, clienterazonsocial, clientetipopersona, clienteruc, clientedv, clientedomicilio,
        clidepartamentoid, cliciudadid, clibarrioid, clientegeolocation, clienteemail, clientephone,
        tipodocumentoid, clientetipocontrib, rpbepsaid)
    select distinct on (tipoclienteid, clienteid)
        'Comercio' as tipoclienteid,
        tcli.cliclicod as clienteid,
        trim(tcli.clirazsoc) as clienterazonsocial,
        case when tso.tsocodigo = 1 then 'PERFI' else 'PERJU' end as clientetipopersona,
        facturacionbepsa.fn_quitar_dv_ruc(tcli.cliruc) as clienteruc,
        facturacionbepsa.fn_calcular_dv(facturacionbepsa.fn_quitar_dv_ruc(tcli.cliruc)) as clientedv,
        trim(tsuc.sucdirecc) as clientedomicilio, -- obtener domicilio de la Sucursal 1
        '1' as clidepartamentoid,
        '1' as cliciudadid,
        '1' as clibarrioid,
        trim(tsuc.sucgeoloc) as clientegeolocation,
        --coalesce (trim(tsuc.succorreo), 'tesoreria@bepsa.com.py') as clienteemail,
	    case
		    WHEN facturacionbepsa.fn_validar_email(trim(tsuc.succorreo)) IS NOT NULL THEN
		        CASE
		            WHEN facturacionbepsa.fn_validar_email(trim(tsuc.succorreo)) THEN trim(tsuc.succorreo)
		            ELSE 'tesoreria@bepsa.com.py'
		        END
		    ELSE trim('tesoreria@bepsa.com.py')
		end as clienteemail,
        coalesce (replace(replace(trim(tsuc.suctelmo1),' ', ''),'-',''), '') as clientephone,
        case when tso.tsocodigo = 1 then 'CEPYA' else 'RUC' end as tipodocumentoid,
        'CONTE' as clientetipocontrib,
        '00' as rpbepsaid
    from
        datos.gxfindta_tcmcli tcli
            inner join DATOS.gxfindta_tcmsuc tsuc on tsuc.cliclicod = tcli.cliclicod
            inner join DATOS.GXFINDTA_TCMTSO tso on tsuc.tsocodigo = tso.tsocodigo
    where
        tsuc.sucsuccod = 1
        /*AND TCLI.CLICLICOD IN (SELECT F.CLIENTEID
                                FROM asientos.facturacionbepsa.FACVENTA F
                                WHERE F.TARGETFACTID = 'FactComercios'
                                and F.TIPOCLIENTEID = 'Comercio'
                                AND F.FACVENTAFECHA = '2023-12-31'
                                and F.FACVENTACLIRUC = '0-0')*/
    ON CONFLICT (tipoclienteid, clienteid)
    DO UPDATE SET
        clienterazonsocial = excluded.clienterazonsocial,
        clientetipopersona = excluded.clientetipopersona,
        clienteruc = excluded.clienteruc,
        clientedv = excluded.clientedv,
        clientedomicilio = excluded.clientedomicilio,
        --clidepartamentoid = excluded.clidepartamentoid,
        --cliciudadid = excluded.cliciudadid,
        --clibarrioid = excluded.clibarrioid,
        --clientegeolocation = excluded.clientegeolocation,
        --clienteemail = excluded.clienteemail,
        clientephone = excluded.clientephone,
        --tipodocumentoid = excluded.tipodocumentoid,
        --clientetipocontrib = excluded.clientetipocontrib,
        rpbepsaid = excluded.rpbepsaid;


SELECT *
FROM asientos.facturacionbepsa.CLIENTE C
WHERE C.CLIENTERUC <> '0';
    /*C.CLIENTEID IN (SELECT F.CLIENTEID
                                FROM asientos.facturacionbepsa.FACVENTA F
                                WHERE F.TARGETFACTID = 'FactComercios'
                                and F.TIPOCLIENTEID = 'Comercio'
                                AND F.FACVENTAFECHA = '2023-12-31'
                                and F.FACVENTACLIRUC = '0-0');*/


SELECT *
FROM asientos.facturacionbepsa.CLIENTE C
WHERE C.CLIENTEID IN (
SELECT F.CLIENTEID
FROM asientos.facturacionbepsa.FACVENTA F
WHERE F.TARGETFACTID = 'FactComercios' AND F.TIPOCLIENTEID = 'Comercio' AND F.FACVENTAFECHA = '2023-12-31' AND F.STATUSID='formulario');


SELECT *
FROM asientos.facturacionbepsa.CLIENTE C
WHERE C.CLIENTERAZONSOCIAL LIKE '%DURANONA%'
OR C.CLIENTERAZONSOCIAL LIKE '%COOPEC%';

SELECT F.FACVENTAID, C.CLIENTEPHONE, C.CLIENTEEMAIL, F.FACVENTACLIEMAIL, F.FACVENTADESC, F.FACVENTAFECHA, F.TARGETFACTID, C.TIPOCLIENTEID, C.CLIENTEID, C.CLIENTERAZONSOCIAL, C.CLIENTERUC,  F.FACVENTACOMPROBANTESET, F.FACVENTACLIRUC, F.STATUSID, C.CLIENTETIPOCONTRIB, C.CLIENTETIPOPERSONA, C.TIPODOCUMENTOID, F.ESTABLECIMIENTOID, F.PUNTOEXPEDICIONID
FROM asientos.facturacionbepsa.FACVENTA F
INNER JOIN FACTURACIONBEPSA.CLIENTE C ON F.TIPOCLIENTEID = C.TIPOCLIENTEID AND C.CLIENTEID = F.CLIENTEID
WHERE F.TARGETFACTID = 'FactComercios'
and F.TIPOCLIENTEID = 'Comercio'
AND F.FACVENTAFECHA = '2023-12-31'
--and F.FACVENTACLIRUC = '0-0'
AND F.STATUSID = 'formulario';



SELECT F.FACVENTAID, F.FACVENTACOMPROBANTESET, F.FACVENTAFECHA,  C.TIPOCLIENTEID, C.CLIENTEID, C.CLIENTETIPOCONTRIB, C.CLIENTERUC, C.CLIENTEDV, C.CLIENTETIPOPERSONA, C.TIPODOCUMENTOID, C.CLIENTEEMAIL
FROM asientos.facturacionbepsa.FACVENTA F
INNER JOIN FACTURACIONBEPSA.CLIENTE C ON F.TIPOCLIENTEID = C.TIPOCLIENTEID AND C.CLIENTEID = F.CLIENTEID
WHERE F.TARGETFACTID = 'FactComercios' AND F.TIPOCLIENTEID = 'Comercio' AND F.FACVENTAFECHA = '2023-12-31' AND F.STATUSID='formulario';


SELECT F.FACVENTAID, fv.facventastatusfh, FV.facventastatusid, FV.facventastatusnotas, MAX(FV.FACVENTASTATUSITEM) AS MaxFACVENTASTATUSITEM
FROM asientos.facturacionbepsa.FACVENTA F
INNER JOIN asientos.facturacionbepsa.FACVENTASTATUS FV ON F.FACVENTAID = FV.FACVENTAID -- Reemplaza NombreDeTuTabla con el nombre de la tabla que contiene FACVENTASTATUSITEM
WHERE F.TARGETFACTID = 'FactComercios'
    AND F.TIPOCLIENTEID = 'Comercio'
    AND F.FACVENTAFECHA = '2023-12-31'
    AND F.STATUSID = 'DE_RECHAZADO'
    AND FV.FACVENTASTATUSID = 'DE_RECHAZADO'
GROUP BY F.FACVENTAID, fv.facventastatusfh, FV.facventastatusid, FV.facventastatusnotas;



SELECT *
FROM asientos.facturacionbepsa.CLIENTE C
WHERE C.TIPOCLIENTEID = 'Comercio'
AND C.CLIENTEID IN (SELECT F.CLIENTEID
                    FROM asientos.facturacionbepsa.FACVENTA F
                    WHERE F.TARGETFACTID = 'FactComercios' AND F.TIPOCLIENTEID = 'Comercio' AND F.FACVENTAFECHA = '2023-12-31' AND F.STATUSID='preformulario'
                    AND C.TIPOCLIENTEID = 'Comercio');


SELECT F.FACVENTAID, F.FACVENTACOMPROBANTESET, F.FACVENTAFECHA,  C.TIPOCLIENTEID, C.CLIENTEID, C.CLIENTETIPOCONTRIB, C.CLIENTERUC, C.CLIENTEDV, C.CLIENTETIPOPERSONA, C.TIPODOCUMENTOID
FROM asientos.facturacionbepsa.FACVENTA F
INNER JOIN FACTURACIONBEPSA.CLIENTE C ON F.TIPOCLIENTEID = C.TIPOCLIENTEID AND C.CLIENTEID = F.CLIENTEID
WHERE F.TARGETFACTID = 'FactComercios' AND F.TIPOCLIENTEID = 'Comercio' AND F.FACVENTAFECHA = '2023-12-31' AND F.STATUSID='formulario';

--DELETE FROM CONCILIACION.EXTRACTOS_CONCILIADOS EC;
--extracto conti función
select * from conciliacion.f_get_saldo_extracto_conti('01-491340-00', '20231201');

select em.montocredito, em.montodebito,em.fechacontable
		from conciliacion.extracto_cabecera ec
		inner join conciliacion.extracto_movimiento em on em.idcabecera = ec.id
		where ec.numero_cuenta like concat('%',right (replace(:v_cuenta_aux,'-',''),5),'%')
		and  extract(month from ec.fechainicial::date) = extract(month from :v_fecha::date)
		and  extract(year from ec.fechainicial::date) = extract(year from :v_fecha::date);
--ver path xml
SELECT F.FACVENTAID, F.FACVENTANUMERO, F.FACVENTASIRIUSXMLPATH
FROM FACTURACIONBEPSA.FACVENTA F
WHERE F.STATUSID = 'DE_ACTIVO';


select *
FROM asientos.facturacionbepsa.FACVENTARTSET F
WHERE F.FACVENTARTSETLOTEID = '7aa1c246-56ec-4bba-9a78-189498051929';

DELETE
FROM asientos.facturacionbepsa.FACVENTARTSET
WHERE FACVENTARTSETLOTEID = '7aa1c246-56ec-4bba-9a78-189498051929';

SELECT *
FROM asientos.facturacionbepsa.FACVENTA F
ORDER BY FACVENTAID DESC;


SELECT 145275 AS numero;

SELECT CONCAT('9', LPAD(trim(145275::text), 17, '0'))::bigint AS numero;

SELECT * from facturacionbepsa.fn_get_info_retenciones_set(:p_tipocomprobanteid, :p_timbrado, :p_establecimientoid, :p_puntoexpedicionid, :p_timbradocomprobcajaid, :p_ejercicioid, :p_periodoid, :p_targetfactid, :p_monedaid, :p_tipoclienteid, :p_facventacondicion, :p_secusername);

SELECT *
FROM asientos.facturacionbepsa.SERVPREST S;


SELECT *
FROM asientos.facturacionbepsa.PARAMETROS P
WHERE P.PARMID = 'desc_serv_prest';


SELECT *
FROM (SELECT
          --f.facventaid::bigint AS id,
          CONCAT('9', LPAD(TRIM(F.FACVENTAID::TEXT), 17, '0'))::BIGINT        AS ID,
          TO_CHAR(CURRENT_TIMESTAMP, 'YYYY-MM-DD HH24:MI:SS')::TEXT           AS ATRIBUTOS_FECHAHORACREACION,
          'OTC'::TEXT                                                         AS ATRIBUTOS_PROCESO,
          FACTURACIONBEPSA.FN_OBTENER_PARMVALUE('empresaRUCsinDV', '1')::TEXT AS INFORMANTE_RUC,                      --sin DV
          '001'::TEXT                                                         AS INFORMANTE_CODIGOESTABLECIMIENTO,
          '11898126'::TEXT                                                    AS INFORMANTE_TIMBRADOCOMPROBANTE,
          '007'::TEXT                                                         AS INFORMANTE_PUNTOEXPEDICIONCOMPROBANTE,
          '2016-12-05'::TEXT                                                  AS INFORMANTE_INICIOVIGENCIACOMPROBANTE,
          'contribuyente'::TEXT                                               AS INFORMADO_SITUACION,
          C.CLIENTERUC::TEXT                                                  AS INFORMADO_RUC,
          C.CLIENTEDV::TEXT                                                   AS INFORMADO_DV,
          C.CLIENTERAZONSOCIAL::TEXT                                          AS INFORMADO_NOMBRE,
          --c.clientedomicilio::text AS informado_domicilio,
          F.FACVENTACLIDIRECCION::TEXT                                        AS INFORMADO_DOMICILIO,
          F.FACVENTACOMPROBANTESET::TEXT                                      AS TRANSACCION_FACTURACOMISION,
          F.TIMBRADOID::TEXT                                                  AS TRANSACCION_TIMBRADOFACTURACOMISION, --  '10024759'
          TO_CHAR(F.FACVENTAFECHA, 'YYYY-MM-DD')::TEXT                        AS TRANSACCION_FECHAFACTURACOMISION,
          ROUND(FVD.FACVENTADETPRECIOML / 1.1, 0)::NUMERIC                    AS TRANSACCION_MONTOCOMISION,
          ROUND(FVD.FACVENTADETPRECIOML / 11, 0)::NUMERIC                     AS TRANSACCION_IVACOMISION,
          --to_char(CURRENT_DATE,'YYYY-MM-DD') AS retencion_fecha,
          TO_CHAR(F.FACVENTAFECHA, 'YYYY-MM-DD')                              AS RETENCION_FECHA,
          FVD.FACVENTADETCANT::NUMERIC                                        AS RETENCION_CANTIDADTRANSACCIONES,
          F.MONEDAID::TEXT                                                    AS RETENCION_MONEDA,
          FVD.FACVENTADETPRECIOML::NUMERIC                                    AS RETENCION_MONTOBRUTO,
          TRUE                                                                AS RETENCION_RETENCIONIVA,
          'IVA.1'::TEXT                                                       AS RETENCION_CONCEPTOIVA,
          0.90909::NUMERIC                                                    AS RETENCION_IVAPORCENTAJE,
          F.FACVENTARETENSETIVA::NUMERIC                                      AS RETENCION_IVATOTAL,
          TRUE                                                                AS RETENCION_RETENCIONRENTA,
          'RENTA_EMPRESARIAL_REGISTRADO.1'::TEXT                              AS RETENCION_CONCEPTORENTA,
          1::NUMERIC                                                          AS RETENCION_RENTAPORCENTAJE,
          F.FACVENTARETENSETMONTO::NUMERIC                                    AS RETENCION_RENTATOTAL,
          (F.FACVENTARETENSETMONTO + F.FACVENTARETENSETIVA)::NUMERIC          AS RETENCION_RETENCIONTOTAL
      FROM FACTURACIONBEPSA.FACVENTA F
               INNER JOIN FACTURACIONBEPSA.CLIENTE C ON C.TIPOCLIENTEID = F.TIPOCLIENTEID AND C.CLIENTEID = F.CLIENTEID
               INNER JOIN FACTURACIONBEPSA.FACVENTADET FVD ON FVD.FACVENTAID = F.FACVENTAID
               LEFT JOIN FACTURACIONBEPSA.FACVENTARTSET FVS ON F.FACVENTAID = FVS.FACVENTAID AND FVS.FACVENTARTSETPROCESAMIENTOCORR = TRUE
      WHERE F.EJERCICIOID = :p_ejercicioid
        AND F.PERIODOID = :p_periodoid
        AND F.TIPOCOMPROBANTEID = :p_tipocomprobanteid
        AND F.TIMBRADOID = :p_timbrado
        AND F.ESTABLECIMIENTOID = :p_establecimientoid
        AND F.PUNTOEXPEDICIONID = :p_puntoexpedicionid
        AND F.TIMBRADOCOMPROBCAJAID = :p_timbradocomprobcajaid
        AND F.TARGETFACTID = :p_targetfactid
        AND F.MONEDAID = :p_monedaid
        AND F.TIPOCLIENTEID = :p_tipoclienteid
        AND F.FACVENTACONDICION = :p_facventacondicion
        AND C.TIPOCLIENTEID = :p_tipoclienteid
        AND F.STATUSID IN ('DTE_APROBADO')
        AND -- DTE_APROBADO
          FVD.SERVPRESTID IN (SELECT * FROM FACTURACIONBEPSA.FN_OBTENER_PARMVALUE('desc_serv_prest', 'C') AS INFO)
        AND (F.FACVENTARETENSETMONTO + F.FACVENTARETENSETIVA) > 0
        AND FVS.FACVENTAID IS NULL
      ORDER BY F.FACVENTAID) AS tabla
WHERE TABLA.retencion_ivatotal < TABLA.retencion_montobruto;





SELECT
    F.FACVENTAID,
    F.TARGETFACTID,
    F.TIPOCLIENTEID,
    F.CLIENTEID,
    F.SUCURSALID,
    F.FACVENTACOMPROBANTESET,
    F.FACVENTATOTALCOMPROBML,
    F.FACVENTATOTALIVAGR10ML,
    F.FACVENTARETENSETIVA,
    F.FACVENTARETENSETMONTO,
    F.FACVENTARETENSETNETO
FROM asientos.facturacionbepsa.FACVENTA F
WHERE F.FACVENTACOMPROBANTESET = '001-002-0000708';

SELECT
    F.FACVENTAID,
    F.TARGETFACTID,
    F.TIPOCLIENTEID,
    F.CLIENTEID,
    F.SUCURSALID,
    F.FACVENTACOMPROBANTESET,
    F.FACVENTATOTALCOMPROBML,
    F.FACVENTATOTALIVAGR10ML,
    F.FACVENTARETENSETIVA,
    F.FACVENTARETENSETMONTO,
    F2.FACVENTADETPRECIOML,
    F2.FACVENTADETSTOTALGR10ML
FROM asientos.facturacionbepsa.FACVENTA F
INNER JOIN FACTURACIONBEPSA.FACVENTADET F2 ON F.FACVENTAID = F2.FACVENTAID
WHERE F.FACVENTACOMPROBANTESET = '001-002-0000708'
AND F2.SERVPRESTID = 'Com.Op.TC';


#,clienteid,sucursalid
1,10937,227

SELECT
    RETAIL.MOVRRNBEP,
    RETAIL.MOVCODCLI,
    RETAIL.MOVCODSUC,
    RETAIL.MOVFPRO,
    RETAIL.MOVTPTA,
    RETAIL.MOVIMPO,
    RETAIL.MOVIMCO,
    RETAIL.MOVIVCO,
    (RETAIL.MOVIMCO + RETAIL.MOVIVCO) AS TOTAL,
    RETAIL.MOVIVREN,
    RETAIL.MOVRENT,
    RETAIL.MOVNETO
FROM asientos.facturacionbepsa.TCLMOV_TMP_RETAIL_202312_FACTCOMERCIOS retail
WHERE retail.MOVCODCLI = 10937
AND retail.MOVCODSUC = 227
AND retail.MOVTPTA = 'C';
--AND (retail.movimco + retail.movivco) < RETAIL. movivren ;

--001-002-0001512
--3023 - 1

SELECT
    RETAIL.MOVRRNBEP,
    RETAIL.MOVCODCLI,
    RETAIL.MOVCODSUC,
    RETAIL.MOVFPRO,
    RETAIL.MOVTPTA,
    RETAIL.MOVIMPO,
    RETAIL.MOVIMCO,
    RETAIL.MOVIVCO,
    (RETAIL.MOVIMCO + RETAIL.MOVIVCO) AS TOTAL,
    RETAIL.MOVIVREN,
    RETAIL.MOVRENT,
    RETAIL.MOVNETO
FROM asientos.TRUSTED_ZONE.GXFINDTA_TCLMOV retail
WHERE retail.MOVCODCLI = 3023
AND retail.MOVCODSUC = 1
AND retail.MOVTPTA = 'C'
AND RETAIL.MOVFPRO BETWEEN '20231201' AND '20231231';
--AND (retail.movimco + retail.movivco) < RETAIL. movivren ;

SELECT *
    /*RETAIL.MOVRRNBEP,
    RETAIL.MOVCODCLI,
    RETAIL.MOVCODSUC,
    RETAIL.MOVFPRO,
    RETAIL.MOVTPTA,
    RETAIL.MOVIMPO,
    RETAIL.MOVIMCO,
    RETAIL.MOVIVCO,
    (RETAIL.MOVIMCO + RETAIL.MOVIVCO) AS TOTAL,
    RETAIL.MOVIVREN,
    RETAIL.MOVRENT,
    RETAIL.MOVNETO*/
FROM asientos.DATOS.GXFINDTA_TCLMOV retail
WHERE retail.MOVCODCLI = 10937
AND retail.MOVCODSUC = 227
  AND retail.MOVRRNBEP='333455902976'
AND retail.MOVTPTA = 'C';

SELECT * FROM DATOS.GXOPERA_OPMOVI GO WHERE GO.OPNOREF='333455902976';


--10937
SELECT MOVCODCLI, count(1)
FROM  FACTURACIONBEPSA.tclmov_tmp_retail_202312_factcomercios
GROUP BY MOVCODCLI;

SELECT MOVCODCLI, count(1)
FROM  FACTURACIONBEPSA.tclmov_tmp_comercios_202312_factcomercios
WHERE MOVCODCLI = 10937
GROUP BY MOVCODCLI;

SELECT *
FROM asientos.facturacionbepsa.FACVENTA F
WHERE F.TARGETFACTID = 'FactComercios'
AND F.TIPOCLIENTEID = 'Comercio'
AND F.FACVENTAFECHA = '2023-12-31'
AND F.CLIENTEID = 10937;


SELECT F.FACVENTACOMPROBANTESET, count(1) AS cant
FROM asientos.facturacionbepsa.FACVENTA F
    INNER JOIN FACTURACIONBEPSA.FACVENTADET F2 ON F.FACVENTAID = F2.FACVENTAID
WHERE F.TARGETFACTID = 'FactComercios'
AND F.TIPOCLIENTEID = 'Comercio'
AND F.FACVENTAFECHA = '2023-12-31'
AND F.CLIENTEID = 10937
AND F2.SERVPRESTID = 'Com.Op.TC'
AND F.FACVENTANUMERO BETWEEN 578 AND 722
GROUP BY F.FACVENTACOMPROBANTESET;
--288 -242


-- listado de las facturas duplicadas --> 145 (nota de credito)
-- (plazo) enviamos retenciones; se rechazaron 242; 145 de esas 242 se cancelaron con NCR, por duplicación; entonces: sólo enviamos las restantes?
    -- 242/2 = 121
    -- (145-1=144) - 121 = 23
-- error: El valor de iva total no puede superar al valor del monto bruto (retail) --> datos

--9147 aceptadas
--242 rechazadas (calculado)
--9389

SELECT *
FROM asientos.facturacionbepsa.FACVENTA F
WHERE F.TARGETFACTID = 'FactComercios'
AND F.TIPOCLIENTEID = 'Comercio'
AND F.FACVENTAFECHA = '2023-12-31'
AND F.CLIENTEID = 10937
order BY FACVENTATOTALCOMPROBML desc, FACVENTANUMERO;
--------------------------
--700af902-16c1-4e3f-a1d0-c3b4acd55ef0

SELECT *
FROM asientos.facturacionbepsa.FACVENTASTATUS F
WHERE F.FACVENTAID IN (
    SELECT fv.FACVENTAID FROM asientos.facturacionbepsa.FACVENTA fv
                         WHERE fv.TARGETFACTID = 'FactComercios' AND fv.TIPOCLIENTEID = 'Comercio' and fv.FACVENTAFECHA = '2023-12-31' AND fv.STATUSID = 'DE_RECHAZADO'
    )
AND F.FACVENTASTATUSID = 'DE_RECHAZADO';

SELECT fv.FACVENTAID
FROM asientos.facturacionbepsa.FACVENTA fv
WHERE fv.TARGETFACTID = 'FactComercios' AND fv.TIPOCLIENTEID = 'Comercio' and fv.FACVENTAFECHA = '2023-12-31' AND fv.STATUSID = 'DE_RECHAZADO';

--31 rechazados
SELECT fv.STATUSID, count(fv.FACVENTAID)
FROM asientos.facturacionbepsa.FACVENTA fv
WHERE fv.TARGETFACTID = 'FactComercios' AND fv.TIPOCLIENTEID = 'Comercio' and fv.FACVENTAFECHA = '2023-12-31'
AND fv.FACVENTAID IN (144027,
143741,
143549,
143366,
143109,
142892,
142847,
142367,
142178,
142133,
141997,
141094,
140039,
139600,
139556,
137458,
137183,
137048,
136333,
136048,
135552,
135266,
134777,
134723,
134556,
134499,
133776,
133468,
133375,
132851,
132231
)
GROUP BY fv.STATUSID;


SELECT *
FROM asientos.facturacionbepsa.CLIENTE C
INNER JOIN FACTURACIONBEPSA.FACVENTA F ON C.TIPOCLIENTEID = F.TIPOCLIENTEID AND C.CLIENTEID = F.CLIENTEID
WHERE f.TARGETFACTID = 'FactComercios' AND f.TIPOCLIENTEID = 'Comercio' and f.FACVENTAFECHA = '2023-12-31' AND F.STATUSID = 'preformulario';


SELECT C.TIPOCLIENTEID, C.CLIENTEID, C.CLIENTETIPOPERSONA, C.TIPODOCUMENTOID, C.CLIENTETIPOCONTRIB, C.CLIENTERUC, C.CLIENTEDV
FROM asientos.facturacionbepsa.CLIENTE C;


UPDATE asientos.facturacionbepsa.CLIENTE C
SET CLIENTETIPOPERSONA = 'PERJU', CLIENTETIPOCONTRIB = 'CONTE'
WHERE C.TIPODOCUMENTOID = 'RUC';

SELECT *
FROM asientos.facturacionbepsa.FACVENTA F
WHERE f.TARGETFACTID = 'FactComercios' AND f.TIPOCLIENTEID = 'Comercio' and f.FACVENTAFECHA = '2023-12-31'
ORDER BY f.FACVENTAID desc;


--7aa1c246-56ec-4bba-9a78-189498051929 (adenis)

--facturacionbepsa.fn_actualizar_facventa_retencion
--700af902-16c1-4e3f-a1d0-c3b4acd55ef0

select count(*)
FROM asientos.facturacionbepsa.FACVENTARTSET F
WHERE F.FACVENTAID IN (SELECT facventaid
from asientos.TESTING.RETBEPSA R);

INSERT INTO facturacionbepsa.facventartset
    (facventaid,
     facventartsetregid,
     facventartsetid,
     facventartsetfechaemision,
     facventartsetnumerocontrol,
     facventartsetnumerocomprobante,
     facventartsetcadenacontrol,
     facventartsetfechaproceso,
     facventartsetprocesamientocorr,
     facventartsetmensajeprocesamie,
     facventartsetloteid)
SELECT
    r.FACVENTAID,
    1,
    r.FACVENTAID,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    FALSE,
    NULL,
    '700af902-16c1-4e3f-a1d0-c3b4acd55ef0'
from asientos.TESTING.RETBEPSA R;

select *
FROM asientos.facturacionbepsa.FACVENTA F
WHERE F.TARGETFACTID = 'FactComercios' AND F.TIPOCLIENTEID = 'Comercio' AND F.FACVENTAFECHA = '2023-12-31' AND F.STATUSID = 'DTE_APROBADO';

F.FACVENTAID NOT IN (SELECT F2.FACVENTAID
                           FROM asientos.facturacionbepsa.FACVENTARTSET F2)



SELECT F.STATUSID, count(F.FACVENTAID)
FROM asientos.facturacionbepsa.CLIENTE C
INNER JOIN FACTURACIONBEPSA.FACVENTA F ON C.TIPOCLIENTEID = F.TIPOCLIENTEID AND C.CLIENTEID = F.CLIENTEID
WHERE f.TARGETFACTID = 'FactComercios' AND f.TIPOCLIENTEID = 'Comercio' and f.FACVENTAFECHA = '2023-12-31'
GROUP BY F.STATUSID;



	--para control de facVentaID
SELECT * from facturacionbepsa.fn_obtener_parmvalue('setRetencionesEventos', 'cambiarValorFacVentaID');
SELECT * from coalesce(facturacionbepsa.fn_obtener_parmvalue('setRetencionesEventos', 'valorInicialFacVentaID'), '');
SELECT * from facturacionbepsa.fn_obtener_parmvalue('setRetencionesEventos', 'longitudFacVentaID');

SELECT 18 - LENTH(trim(coalesce('9', '')));

--900000000000132084
SELECT right(900000000000132084::text, 18 - LENTH(trim(coalesce('9', '')))::integer)::bigint;

SELECT *
FROM asientos.facturacionbepsa.FACVENTARTSET F
WHERE F.FACVENTAID = 132084;



SELECT *
FROM asientos.TESTING.BEPSARETENCION202312 B;

UPDATE facturacionbepsa.FACVENTARTSET
SET
    FACVENTARTSETFECHAEMISION = '2023-12-31',
    FACVENTARTSETFECHAPROCESO = '2024-01-04'
FROM asientos.TESTING.bepsaretencion202312
WHERE facturacionbepsa.FACVENTARTSET.facventaid = TESTING.bepsaretencion202312.facventaid
AND trim(facturacionbepsa.FACVENTARTSET.FACVENTARTSETLOTEID) = '700af902-16c1-4e3f-a1d0-c3b4acd55ef0'
AND facturacionbepsa.FACVENTARTSET.FACVENTARTSETPROCESAMIENTOCORR = true;


SELECT *
FROM asientos.facturacionbepsa.FACVENTARTSET F
    INNER JOIN asientos.facturacionbepsa.FACVENTA Fv ON FV.FACVENTAID = F.FACVENTAID
WHERE F.FACVENTARTSETPROCESAMIENTOCORR = false
AND FV.TARGETFACTID = 'FactComercios' and FV.TIPOCLIENTEID = 'Comercio' AND FV.FACVENTAFECHA = '2023-12-31' AND FV.STATUSID = 'DTE_APROBADO';


SELECT *
FROM asientos.facturacionbepsa.FACVENTADET Fd
INNER JOIN FACTURACIONBEPSA.FACVENTA fv ON Fv.FACVENTAID = Fd.FACVENTAID
WHERE FV.TARGETFACTID = 'FactComercios' and FV.TIPOCLIENTEID = 'Comercio' AND FV.FACVENTAFECHA = '2023-12-31';

UPDATE FACTURACIONBEPSA.facventadet
SET
    FACVENTADETMOVIMCO = (
    SELECT sum(MOVIMCO)
    FROM FACTURACIONBEPSA.tclmov_tmp_totmen_retail_202312_factcomercios
    INNER JOIN FACTURACIONBEPSA.facventa
      ON movcodcli = facventa.clienteid
        AND movcodsuc = facventa.sucursalid
        AND movtpta = CASE
          WHEN facventadet.servprestid = 'Com.Op.TD' THEN 'D'
          WHEN facventadet.servprestid = 'Com.Op.TC' THEN 'C'
          WHEN facventadet.servprestid = 'Com.Op.EF' THEN 'E' END
  ),
  facventadetmovimpo = (
    SELECT sum(movimpo)
    FROM FACTURACIONBEPSA.tclmov_tmp_totmen_retail_202312_factcomercios
    INNER JOIN FACTURACIONBEPSA.facventa
      ON movcodcli = facventa.clienteid
        AND movcodsuc = facventa.sucursalid
        AND movtpta = CASE
          WHEN facventadet.servprestid = 'Com.Op.TD' THEN 'D'
          WHEN facventadet.servprestid = 'Com.Op.TC' THEN 'C'
          WHEN facventadet.servprestid = 'Com.Op.EF' THEN 'E' END
  ),
  facventadetmovivco = (
    SELECT sum(movivco)
    FROM FACTURACIONBEPSA.tclmov_tmp_totmen_retail_202312_factcomercios
    INNER JOIN FACTURACIONBEPSA.facventa
      ON movcodcli = facventa.clienteid
        AND movcodsuc = facventa.sucursalid
        AND movtpta = CASE
          WHEN facventadet.servprestid = 'Com.Op.TD' THEN 'D'
          WHEN facventadet.servprestid = 'Com.Op.TC' THEN 'C'
          WHEN facventadet.servprestid = 'Com.Op.EF' THEN 'E' END
  ),
  facventadetmovivren = (
    SELECT sum(movivren)
    FROM FACTURACIONBEPSA.tclmov_tmp_totmen_retail_202312_factcomercios
    INNER JOIN FACTURACIONBEPSA.facventa
      ON movcodcli = facventa.clienteid
        AND movcodsuc = facventa.sucursalid
        AND movtpta = CASE
          WHEN facventadet.servprestid = 'Com.Op.TD' THEN 'D'
          WHEN facventadet.servprestid = 'Com.Op.TC' THEN 'C'
          WHEN facventadet.servprestid = 'Com.Op.EF' THEN 'E' END
  ),
  facventadetmovneto = (
    SELECT sum(movneto)
    FROM FACTURACIONBEPSA.tclmov_tmp_totmen_retail_202312_factcomercios
    INNER JOIN FACTURACIONBEPSA.facventa
      ON movcodcli = facventa.clienteid
        AND movcodsuc = facventa.sucursalid
        AND movtpta = CASE
          WHEN facventadet.servprestid = 'Com.Op.TD' THEN 'D'
          WHEN facventadet.servprestid = 'Com.Op.TC' THEN 'C'
          WHEN facventadet.servprestid = 'Com.Op.EF' THEN 'E' END
  ),
  facventadetmovrent = (
    SELECT sum(movrent)
    FROM FACTURACIONBEPSA.tclmov_tmp_totmen_retail_202312_factcomercios
    INNER JOIN FACTURACIONBEPSA.facventa
      ON movcodcli = facventa.clienteid
        AND movcodsuc = facventa.sucursalid
        AND movtpta = CASE
          WHEN facventadet.servprestid = 'Com.Op.TD' THEN 'D'
          WHEN facventadet.servprestid = 'Com.Op.TC' THEN 'C'
          WHEN facventadet.servprestid = 'Com.Op.EF' THEN 'E' END
  )
WHERE
  facventadet.facventaid IN (
    SELECT FACTURACIONBEPSA.facventa.facventaid
    FROM FACTURACIONBEPSA.facventa
    WHERE targetfactid = 'FactComercios'
      AND tipoclienteid = 'Comercio'
      AND facventafecha = '2023-12-31'
  );


SELECT * FROM facturacionbepsa.fn_get_info_retenciones_set(:p_tipocomprobanteid, :p_timbrado, :p_establecimientoid, :p_puntoexpedicionid, :p_timbradocomprobcajaid, :p_ejercicioid, :p_periodoid, :p_targetfactid, :p_monedaid, :p_tipoclienteid, :p_facventacondicion, :p_secusername);


SELECT T.MOVCODCLI, T.MOVCODSUC, T.MOVTPTA, movimpo, movimco, movivco, movrent, movivren, movneto
FROM asientos.TRUSTED_ZONE.GXFINDTA_TCLMOV T
WHERE T.MOVFPRO = '20231219';


UPDATE FACTURACIONBEPSA.facventadet
SET
  facventadetmovimpo = (
    SELECT sum(movimpo)
    FROM FACTURACIONBEPSA.tclmov_tmp_totmen_retail_202312_factcomercios
    INNER JOIN FACTURACIONBEPSA.facventa
      ON movcodcli = facventa.clienteid
        AND movcodsuc = facventa.sucursalid
        AND movtpta = CASE
          WHEN facventadet.servprestid = 'Com.Op.TD' THEN 'D'
          WHEN facventadet.servprestid = 'Com.Op.TC' THEN 'C'
          WHEN facventadet.servprestid = 'Com.Op.EF' THEN 'E' END
  )
WHERE
  facventadet.facventaid IN (
    SELECT FACTURACIONBEPSA.facventa.facventaid
    FROM FACTURACIONBEPSA.facventa
    WHERE targetfactid = 'FactComercios'
      AND tipoclienteid = 'Comercio'
      AND facventafecha = '2023-12-31'
  );


SELECT *
FROM FACTURACIONBEPSA.FACVENTA F
INNER JOIN FACTURACIONBEPSA.tclmov_tmp_totmen_retail_202312_factcomercios tclmov ON TCLMOV.movcodcli = F.CLIENTEID AND TCLMOV.movcodsuc = F.SUCURSALID
WHERE F.TIPOCLIENTEID = 'Comercio' AND F.TARGETFACTID = 'FactComercios' AND F.FACVENTAFECHA = '2023-12-31';


SELECT count(*)
FROM FACTURACIONBEPSA.tclmov_tmp_totmen_retail_202312_factcomercios;

-------------alq pos facturación
CREATE MATERIALIZED VIEW facturacionbepsa.fpos_info_facturacion_mensual
TABLESPACE pg_default
AS SELECT fn_fpos_planillacsv."Cliente" AS cliente,
    fn_fpos_planillacsv."Sucursal" AS sucursal,
    fn_fpos_planillacsv."Producto" AS producto,
    fn_fpos_planillacsv."Descripcion" AS descripcion,
    fn_fpos_planillacsv."Cantidad" AS cantidad,
    fn_fpos_planillacsv."PrecioUnitario" AS preciounitario
   FROM facturacionbepsa.fn_fpos_planillacsv('20240131'::text, '20240131'::text, 'S'::text) fn_fpos_planillacsv("Cliente", "Sucursal", "Producto", "Descripcion", "Cantidad", "PrecioUnitario")

-----------------------------------------genera factura
    --CREAMOS FORMA DE PAGO.Y PERIODO TARGET FACTALQPOS
--CREDITO-1D
CALL facturacionbepsa.insertar_facturas_pos(:p_tipocomprobanteid, :p_timbrado, :p_establecimientoid,
                                            :p_puntoexpedicionid, :p_timbradocomprobcajaid, :p_ejercicioid,
                                            :p_periodoid, :p_targetfactid, :p_monedaid, :p_tipoclienteid,
                                            :p_formapagoid, :p_secusername);

SELECT * FROM FACTURACIONBEPSA.FORMAPAGO F;

--para numerar
SELECT * FROM facturacionbepsa.fn_enumerar_facturas('16410772','FAECA','001','003',
                                                    'C-000',2024,01,'FACTALQPOS','Administrator');
--verificamos info clientes
--los ruc > 80000000 --> PERJU, COMTE, RUC
--los ruc < 80000000 --> PERFI, COMTE, RUC
--los ruc < 80000000 --> PERFI, NCONT, CEPYA

SELECT C.TIPOCLIENTEID, C.CLIENTEID, C.CLIENTETIPOPERSONA, C.CLIENTETIPOCONTRIB, C.TIPODOCUMENTOID, C.CLIENTERUC, C.CLIENTEDV, C.CLIENTERAZONSOCIAL, C.CLIENTEEMAIL, C.CLIENTEPHONE, C.CLIENTEDOMICILIO
FROM asientos.facturacionbepsa.CLIENTE C
WHERE --C.CLIENTERUC::bigint < 80000000
    FACTURACIONBEPSA.fn_validar_email(C.CLIENTEEMAIL) = false
ORDER BY C.CLIENTERUC desc;

UPDATE asientos.facturacionbepsa.CLIENTE C
SET CLIENTETIPOPERSONA = 'PERJU',
    CLIENTETIPOCONTRIB = 'CONTE',
    TIPODOCUMENTOID = 'RUC'
WHERE C.CLIENTERUC::BIGINT > 80000000;

UPDATE asientos.facturacionbepsa.CLIENTE C
SET CLIENTETIPOPERSONA = 'PERFI'
WHERE C.CLIENTERUC::BIGINT < 80000000;

UPDATE asientos.facturacionbepsa.CLIENTE C
SET TIPODOCUMENTOID = 'RUC'
WHERE C.CLIENTERUC::BIGINT < 80000000
AND C.CLIENTETIPOCONTRIB = 'CONTE'
and C.CLIENTETIPOPERSONA = 'PERFI';

UPDATE asientos.facturacionbepsa.CLIENTE C
SET CLIENTEEMAIL = 'facturacion@bepsa.com.py'
WHERE CLIENTEEMAIL = 'tesoreria@bepsa.com.py';

UPDATE asientos.facturacionbepsa.CLIENTE C
SET CLIENTEEMAIL = lower(trim(CLIENTEEMAIL)),
    CLIENTERAZONSOCIAL = trim(CLIENTERAZONSOCIAL),
    CLIENTEPHONE = trim(CLIENTEPHONE),
    CLIENTEDOMICILIO = trim(CLIENTEDOMICILIO);


UPDATE asientos.facturacionbepsa.CLIENTE C
SET CLIENTEDV = FACTURACIONBEPSA.fn_calcular_dv(C.CLIENTERUC);

UPDATE asientos.facturacionbepsa.SUCURSAL S
SET SUCURSALEMAIL = lower(trim(SUCURSALEMAIL)),
    SUCURSALDENOMINACION = trim(SUCURSALDENOMINACION),
    SUCURSALPHONE = trim(SUCURSALPHONE),
    SUCURSALDOMICILIO = trim(SUCURSALDOMICILIO);

SELECT *
FROM FACTURACIONBEPSA.FACVENTA F
where F.TARGETFACTID = 'FactComercios'
AND F.TIPOCLIENTEID = 'Comercio'
AND F.FACVENTAFECHA = '2024-04-30' AND
    facventacliruc='80016096-7';


SELECT * FROM asientos.facturacionbepsa.CLIENTE C WHERE C.CLIENTERUC='80024500';
SELECT * FROM asientos.facturacionbepsa.SUCURSAL S WHERE sucursalemail LIKE '%tesoreria%';--S.CLIENTEID=11362;

SELECT * FROM asientos.facturacionbepsa.FACVENTADET F WHERE F.FACVENTAID IN (174982,174988,174977);

SELECT * FROM FACTURACIONBEPSA.FACVENTA F WHERE F.FACVENTACOMPROBANTESET='001-002-0669805';
--where F.TARGETFACTID = 'FACTALQPOS' AND F.TIPOCLIENTEID = 'Comercio' AND F.FACVENTAFECHA = '2024-01-24' AND F.STATUSID='DTE_APROBADO';
-----------------------------------------
---VER MOTIVO
SELECT FS.FACVENTAID,
       FV.FACVENTACOMPROBANTESET,
       FV.FACVENTAFECHA,
       C.CLIENTEID,
       C.CLIENTETIPOPERSONA,
       C.CLIENTETIPOCONTRIB,
       C.TIPODOCUMENTOID,
       FV.FACVENTACLIRUC,
       FV.FACVENTATOTALCOMPROBML,
       FV.FACVENTACLIRAZONSOCIAL,
       FV.FACVENTACLIEMAIL,
       FS.FACVENTASTATUSID,
       FS.FACVENTASTATUSNOTAS,
       FS.FACVENTASTATUSITEM
FROM ASIENTOS.FACTURACIONBEPSA.FACVENTASTATUS FS
         INNER JOIN ASIENTOS.FACTURACIONBEPSA.FACVENTA FV
                    ON FV.FACVENTAID = FS.FACVENTAID
         INNER JOIN ASIENTOS.FACTURACIONBEPSA.CLIENTE C
                    ON C.TIPOCLIENTEID = FV.TIPOCLIENTEID AND C.CLIENTEID = FV.CLIENTEID
WHERE FV.TARGETFACTID = 'FACTALQPOS'
  AND FV.TIPOCLIENTEID = 'Comercio'
  AND FV.FACVENTAFECHA = '2024-01-10'
  AND FV.STATUSID = 'DE_RECHAZADO'
  AND FS.FACVENTASTATUSID = 'DE_ERROR'
  AND FS.FACVENTASTATUSITEM = (SELECT MAX(FS2.FACVENTASTATUSITEM)
                               FROM ASIENTOS.FACTURACIONBEPSA.FACVENTASTATUS FS2
                               WHERE FS2.FACVENTAID = FS.FACVENTAID);

-------REPRTE MENSUAL
--SELECT * from FACTURACIONBEPSA.tclmov_tmp_{ciclo}_{ejercicio}{periodo}_factcomercios
SELECT * FROM facturacionbepsa.fn_reporte_trx_mensual(:name_table, :idcliente, :id_suc_desde, :id_suc_hasta);

/*name_table sería el nombre de la vista materializada, con el esquema, por ejemplo:
facturacionbepsa.tclmov_tmp_Retail_202311_factcomercios*/

SELECT facventa.FACVENTACOMPROBANTESET, tmp.MOVRUC, tmp.MOVCOMER, tmp.MOVCODCLI, tmp.MOVCODSUC, tmp.SERCODI, tmp.MOVCODIS, tmp.MOVTPTA tipo_tarjeta, tmp.MOVNTAR,
       MOVNETO, MOVIMCO, MOVRETE, MOVIVCO, TMP.*
FROM FACTURACIONBEPSA.tclmov_tmp_comercios_202312_factcomercios tmp
INNER JOIN FACTURACIONBEPSA.facventa ON facventa.FACVENTACLIRUC = tmp.MOVIVCO-- AND facventa.FACVENTACLICOMERCIO = tmp.MOVCODCLI
WHERE Tmp.MOVRUC='80001870-2';
SELECT * FROM FACTURACIONBEPSA.TIPOASIENTOCONTABLEDET T;
--------------------------------------------------------------------
SELECT * FROM CONCILIACION.EXTRACTOS_INFORME EI WHERE EI.FECHA_INFORME='20231204' AND EI.ASIENTO='SI' AND EI.NUMERO_ASIENTO_K2B='67472';

SELECT *
FROM CONCILIACION.EXTRACTO_MOVIMIENTO EM
WHERE EM.IDCABECERA IN (SELECT EC.ID
                        FROM CONCILIACION.EXTRACTO_CABECERA EC
                        WHERE EC.NUMERO_CUENTA = 'XXXXX42606'
                          AND EC.FECHAINICIAL IN (TO_CHAR('20231204':: DATE, 'DD/MM/YYYY')))
  AND TO_CHAR(EM.FECHACONTABLE::DATE, 'YYYYMMDD') IN ('20231204');

SELECT SUM(IMPORTE_TRNX)                                   MONTO_TCL,
       ADMINISTRADOR                                    AS ADMINISTRADOR_COD,
       FECHA_PROC                                       AS FECHA_TCLMOV,
       CONCILIACION.F_GET_CODENT_ANTIGUO(ADMINISTRADOR) AS CODENT

FROM ASIENTOS.PR_TRX_ADELANTO_CLEARING_PAGO_48HS_97('20231201')
WHERE TIPOIMPORTE = '-1'
  AND CUENTACONTABLE = '1.1.1.2.1.01'
  AND CUENTAAUXILIAR = '01-218426-06'
  AND TIPO_ACREDITACION = 'B'
GROUP BY ADMINISTRADOR,
         FECHA_PROC;
---PROCEDIMIENTO TRX DEL ASIENTO
SELECT *
FROM ASIENTOS.PR_TRX_ADELANTO_CLEARING_PAGO_48HS_97('20231201')
WHERE TIPOIMPORTE = '-1'
  AND CUENTACONTABLE = '1.1.1.2.1.01'
  AND CUENTAAUXILIAR = '01-218426-06'
  AND TIPO_ACREDITACION = 'B';
--DETALLE DEL ASIENTO
select * from asientos.pr_trx_adelanto_clearing_pago_48hs_97('20231201')
WHERE RRNBEPSA IN ('333556775607','333556776486');

--------------------------------------------------------------
SELECT * FROM asientos.facturacionbepsa.CLIENTE C WHERE C.CLIENTEID='20184';--C.CLIENTERAZONSOCIAL LIKE '%BIGGIE%'; --danyreyescolman@hotmail.com  | 13.110
SELECT * FROM asientos.facturacionbepsa.SUCURSAL S WHERE S.CLIENTEID='21690';

SELECT * FROM asientos.facturacionbepsa.FACVENTASTATUS F WHERE F.FACVENTASTATUSNOTAS LIKE '%PKI%';


SELECT * FROM FACTURACIONBEPSA.FACVENTASTATUS F WHERE F.FACVENTAID='153430';

--DETALLE DEL ASIENTO
select * from asientos.pr_trx_adelanto_clearing_pago_48hs_97('20231201') WHERE RRNBEPSA IN ('333556775607','333556776486');

---verificacion de cuenta contable en asiento
select  ambito, rol_bepsa, tipo_tarjeta, dispositivo, marca, 'H', servicio, '', emisor, administrador from asientos.pr_trx_adelanto_clearing_pago_48hs_97('20231201') gd
WHERE RRNBEPSA IN ('333556775607','333556776486')
and tipoimporte = '-1';

--obtiene cuenta contable
SELECT *
FROM ASIENTOS.F_GET_CTA_CONTABLE_CLR_ADELANTO(41, 'R', 'ADQ', 'D', 'ATM', 'VSA', 'H', 'ADELANTO', '', 950101, 516702, 0, 0, '', 0, 0);

SELECT * FROM TRUSTED_ZONE.GXFINDTA_TCLMOV T WHERE T.MOVRRNBEP IN ('333556775607','333556776486');

----VERIFICACION DE EXTRACTO BANCARIO P/CONCILIACION
with extracto_mensual as (
select em.montocredito, em.montodebito,em.fechacontable
        from conciliacion.extracto_cabecera ec
        inner join conciliacion.extracto_movimiento em on em.idcabecera = ec.id
        where ec.numero_cuenta like concat('%',right (replace(:v_cuenta_aux,'-',''),5),'%')
        and  extract(month from ec.fechainicial::date) = extract(month from :v_fecha::date)
        and  extract(year from ec.fechainicial::date) = extract(year from :v_fecha::date)
)
    select ant.saldomesanterior, mov.totalMovimiento, (mov.totalMovimiento + ant.saldomesanterior) as saldo
    from
        (select sum(em.montocredito) - sum(montodebito) totalMovimiento
        from  extracto_mensual em
        where em.fechacontable::DATE <= :v_fecha::DATE) mov
        ,
        (select ec.saldomesanterior
        from conciliacion.extracto_cabecera ec
        where ec.numero_cuenta like concat('%',right (replace(:v_cuenta_aux,'-',''),5),'%')  --'01-491340-00'
        and  :v_fecha::date between ec.fechainicial::date and ec.fechafin::date) ant;
--------------------PARA VER EXTRACTO POR CUENTA Y FECHA
SELECT *
FROM CONCILIACION.EXTRACTO_MOVIMIENTO EM
WHERE EM.IDCABECERA IN (SELECT EC.ID
                        FROM CONCILIACION.EXTRACTO_CABECERA EC
                        WHERE EC.NUMERO_CUENTA = 'XXXXX42606'
                          AND EC.FECHAINICIAL IN (TO_CHAR(:v_fecha:: DATE, 'DD/MM/YYYY')))
  AND TO_CHAR(EM.FECHACONTABLE::DATE, 'YYYYMMDD') IN (:v_fecha);

SELECT MAX(EC.ID) FROM CONCILIACION.EXTRACTO_CABECERA EC; --WHERE EM.ID='4382644'; --4.334
--17.491.711
seleCT * FROM asientos.CONCILIACION.EXTRACTO_CABECERA_ID_SEQ;
ALTER SEQUENCE conciliacion.EXTRACTO_CABECERA_ID_SEQ
	RESTART 4335;
--Detail: Ya existe la llave (id)=(4382644).
select * from conciliacion.extractos_no_conciliados
where cuenta = '01-218426-06'
and conciliado = 'SI'
and usuario_modificacion is not null
order by fecha_extracto desc;


SELECT * FROM FACTURACIONBEPSA.TIPOASIENTOCONTABLEDET T WHERE T.TIPOCOMPROBANTEID='FAECA' AND T.TIPOASIENTOCONTABLEID='COMIPESA';
AND T.TIPOASIENTOCONTABLEDETDESC LIKE '%CLIENTE%';

SELECT * FROM asientos.facturacionbepsa.FACVENTA F WHERE F.FACVENTAID='159751';
SELECT * FROM asientos.facturacionbepsa.FACVENTASTATUS F WHERE F.FACVENTAID='159751';

SELECT * FROM asientos.asientos.ASIENTO_DIARIO_WS ADW WHERE ADW.FECHA_MOV>='20231201';

SELECT CANAL, COUNT(*) FROM FACTURACIONBEPSA.info_ctas_bancarias_ti WHERE info_ctas_bancarias_ti.CANAL IN ('DEBITO-DINELCO', 'DEBITO-BANCARIO')
GROUP BY CANAL;


---TABLA DE INTERCAMBIO DEBITOS...
SELECT * FROM FACTURACIONBEPSA.DEBRET D;


SELECT FV.FACVENTAID,
       FV.TARGETFACTID,
       FV.TIPOCLIENTEID,
       FV.CLIENTEID,
       FV.SUCURSALID,
       SUC.SUCURSALCOMERCIOBEPSA AS CODCOMERCIO,
       SUC.SUCURSALCANALCOBRO,
       FV.FACVENTACOMPROBANTESET,
       FV.FACVENTAFECHA,
       FV.FACVENTACONDICION,
       FC.FACVENTACUOTAID,
       FC.FACVENTACUOTAIMPORTETOTAL,
       FC.FACVENTACUOTAFECHAUPAGO,
       FC.FACVENTACUOTAIMPORTEUPAGO,
       FC.FACVENTACUOTARECIBONROUPAGO
FROM FACTURACIONBEPSA.FACVENTA FV
         INNER JOIN FACTURACIONBEPSA.SUCURSAL SUC
                    ON SUC.TIPOCLIENTEID = FV.TIPOCLIENTEID AND SUC.CLIENTEID = FV.CLIENTEID AND SUC.SUCURSALID = FV.SUCURSALID
         INNER JOIN FACTURACIONBEPSA.FACVENTACUOTA FC
                    ON FC.FACVENTAID = FV.FACVENTAID
WHERE FC.FACVENTACUOTAFECHAVENC <= NOW()
  AND FV.FACVENTACONDICION NOT IN ('CNTDO') AND SUC.SUCURSALCANALCOBRO IN('DB','DD');


SELECT FV.FACVENTAID,
       FV.TARGETFACTID,
       FV.TIPOCLIENTEID,
       FV.CLIENTEID,
       FV.SUCURSALID,
       SUC.SUCURSALCOMERCIOBEPSA AS CODCOMERCIO,
       SUC.SUCURSALCANALCOBRO,
       FV.FACVENTACOMPROBANTESET,
       FV.FACVENTAFECHA,
       FV.FACVENTACONDICION,
       FC.FACVENTACUOTAID,
       FC.FACVENTACUOTAIMPORTETOTAL,
       FC.FACVENTACUOTAFECHAUPAGO,
       FC.FACVENTACUOTAIMPORTEUPAGO,
       FC.FACVENTACUOTARECIBONROUPAGO,
       INFO.CANAL
FROM FACTURACIONBEPSA.FACVENTA FV
         INNER JOIN FACTURACIONBEPSA.SUCURSAL SUC ON SUC.TIPOCLIENTEID = FV.TIPOCLIENTEID AND SUC.CLIENTEID = FV.CLIENTEID AND SUC.SUCURSALID = FV.SUCURSALID
         INNER JOIN FACTURACIONBEPSA.FACVENTACUOTA FC ON FC.FACVENTAID = FV.FACVENTAID
         LEFT JOIN (SELECT CTI.COCOMER,
                           CTI.CODENO,
                           CTI.CLICLICOD,
                           CTI.SUCSUCCOD,
                           CTI.CANAL,
                           SUC.TIPOCLIENTEID,
                           SUC.CLIENTEID,
                           SUC.SUCURSALID,
                           SUC.SUCURSALDENOMINACION,
                           SUC.SUCURSALCOMERCIOBEPSA
                    FROM FACTURACIONBEPSA.INFO_CTAS_BANCARIAS_TI CTI
                             INNER JOIN FACTURACIONBEPSA.SUCURSAL SUC ON SUC.CLIENTEID = CTI.CLICLICOD AND SUC.SUCURSALID = CTI.SUCSUCCOD AND SUC.TIPOCLIENTEID = 'Comercio'
                    WHERE CTI.CANAL IN ('DEBITO-DINELCO', 'DEBITO-BANCARIO')) AS INFO ON FV.CLIENTEID = INFO.CLIENTEID AND FV.SUCURSALID = INFO.SUCURSALID AND FV.TIPOCLIENTEID = 'Comercio'
WHERE FC.FACVENTACUOTAFECHAVENC <= NOW()
  AND FV.FACVENTACONDICION NOT IN ('CNTDO');

-----------------debitos automaticos recibo.--------------------------------
select * from asientos.pr_trx_pos_clearing_pago_dinelco_continental_pyg_54_v2(:v_fecha) WHERE RRNBEPSA='333556409474';

SELECT * FROM TRUSTED_ZONE.GXFINDTA_TCLMOV T WHERE T.MOVRRNBEP='333556409474';

SELECT * FROM FACTURACIONBEPSA.DEBRET D WHERE D.DEBRETREGID='23604';
SELECT * FROM FACTURACIONBEPSA.FACVENTA F WHERE F.FACVENTACOMPROBANTESET='001-003-0016003';

SELECT * FROM asientos.facturacionbepsa.FACVENTACUOTA F WHERE F.FACVENTAID='159524';

/*UPDATE FACTURACIONBEPSA.FACVENTA F
SET FACVENTACOTIZVENTA='0',
    FACVENTACOTIZCOMPRA='0'
WHERE F.TARGETFACTID = 'FACTALQPOS'
  AND F.TIPOCLIENTEID = 'Comercio'
  AND F.MONEDAID = 'PYG';*/

SELECT *
FROM FACTURACIONBEPSA.DEBRET D
WHERE D.DEBRETREGCANALID = 'DD'
  AND DEBRETREGFECHAPETICION >= '2024-01-10'
  AND DEBRETREGESTADO != 'PE'
ORDER BY DEBRETREGESTADO DESC;

SELECT debretregestado, count(*) FROM FACTURACIONBEPSA.DEBRET D WHERE D.DEBRETREGCANALID='DD'
GROUP BY debretregestado;

SELECT * FROM facturacionbepsa.fn_get_debret_all_status_co('DB' );
---------------------------------seccion de asientos
SELECT * FROM asientos.facturacionbepsa.TIPOASIENTOCONTABLEDET T WHERE T.TIPOCOMPROBANTEID='NCECA';
SELECT * FROM asientos.facturacionbepsa.TIPOASIENTOCONTABLEDET T WHERE T.TIPOCOMPROBANTEID='FAECA';
SELECT *
FROM ASIENTOS.PR_VER_FACTURACION_NCREDITO_GS_130('20231215');

SELECT N.NCREDITOFECHA,
       N.TARGETFACTID,
       N.TIPOASIENTOCONTABLEID,
       COUNT(N.NCREDITOID)
FROM FACTURACIONBEPSA.NCREDITO N
GROUP BY N.NCREDITOFECHA,
         N.TARGETFACTID,
         N.TIPOASIENTOCONTABLEID
ORDER BY N.NCREDITOFECHA,
         N.TARGETFACTID,
         N.TIPOASIENTOCONTABLEID;

SELECT *
FROM (SELECT N.NCREDITOFECHA,
             N.TARGETFACTID,
             N.TIPOASIENTOCONTABLEID,
             COUNT(N.NCREDITOID)
      FROM FACTURACIONBEPSA.NCREDITO N
      GROUP BY N.NCREDITOFECHA,
               N.TARGETFACTID,
               N.TIPOASIENTOCONTABLEID
      ORDER BY N.NCREDITOFECHA,
               N.TARGETFACTID,
               N.TIPOASIENTOCONTABLEID) TABLA
         INNER JOIN FACTURACIONBEPSA.TIPOASIENTOCONTABLEDET T
                    ON T.TIPOCOMPROBANTEID = 'NCECA' AND T.TARGETFACTID = TABLA.TARGETFACTID
ORDER BY TABLA.NCREDITOFECHA DESC;

SELECT * FROM asientos.ASIENTOS.ASIENTO_DIARIO_WS ADW WHERE ADW.ID_CTA_CONT_CABE='130';
SELECT * FROM asientos.ASIENTOS.CUENTA_CONT_PROCESO_CABE CCPC WHERE CCPC.ID_CTA_CONT_CABE='130';


SELECT * FROM asientos.ASIENTOS.ASIENTO_DIARIO_WS ADW WHERE ADW.ID_CTA_CONT_CABE='94';
--DELETE FROM asientos.ASIENTOS.ASIENTO_DIARIO_WS ADW WHERE ADW.ID_CTA_CONT_CABE='94' AND ADW.fecha_mov='20231128' AND ADW.NRO_ASIENTO_K2B IN ('68428','68427');

SELECT * FROM asientos.facturacionbepsa.NCREDITOSTATUS N WHERE N.NCREDITOASIENTONUMERO IS NOT NULL;
---DETALLE A COBRAR RECIBOS
SELECT * FROM FACTURACIONBEPSA.fn_get_debret_all_status_co('DB');
------------------------------------------------------
SELECT * FROM asientos.CUENTA_CONT_PROCESO_CABE CCPC WHERE CCPC.ID_CTA_CONT_CABE='94';

SELECT F.FACVENTASIRIUSID, f.* FROM asientos.facturacionbepsa.FACVENTA F WHERE F.FACVENTAID='173822'; 492812
SELECT * FROM FACTURACIONBEPSA.FACVENTASTATUS F WHERE F.FACVENTAID='173822';

SELECT * FROM asientos.CUENTA_CONT_PROCESO_CABE CCPC
 WHERE CCPC.ID_CTA_CONT_CABE='93';

SELECT * FROM ASIENTOS.asientos.pr_gen_mst_swt_gs('20240101');

SELECT F.FACVENTASIRIUSID, f.FACVENTANUMERO, F.* FROM asientos.facturacionbepsa.FACVENTA F WHERE F.FACVENTAID IN (
'173833','173832','173763','173762','173761','173759','173758','173757','173756','173755','173754','173753',
'173751','173750','173749','173748','173744','173743','173815','173796','173827','173826');

--insert para asiento por curl
INSERT INTO FACTURACIONBEPSA.PARAMETROS (PARMID, PARMSERIAL, PARMDESC, PARMDATATYPE, PARMVALUE, PARMACTIVO, PARMNOTES, PARAMDTUPD)
VALUES ('asientoPorCurl', '94', 'FAECA-VENTAS-PYG', 'numeric', '94', 'SI', '', '2024-01-22 08:24:03.884');

--asiento proceso desde click procesar
SELECT * FROM FACTURACIONBEPSA.TIPOASIENTOCONTABLE T WHERE T.TIPOCOMPROBANTEID='FAECA';
SELECT * FROM asientos.facturacionbepsa.TARGETFACT T;
SELECT  T2.*
FROM  FACTURACIONBEPSA.FACVENTA F INNER JOIN asientos.facturacionbepsa.TIPOASIENTOCONTABLE T
    ON F.TIPOCOMPROBANTEID = T.TIPOCOMPROBANTEID AND F.TARGETFACTID = T.TARGETFACTID AND F.TIPOASIENTOCONTABLEID = T.TIPOASIENTOCONTABLEID
INNER JOIN FACTURACIONBEPSA.TIPOASIENTOCONTABLEDET T2
    ON T.TIPOCOMPROBANTEID = T2.TIPOCOMPROBANTEID AND T.TARGETFACTID = T2.TARGETFACTID AND T.TIPOASIENTOCONTABLEID = T2.TIPOASIENTOCONTABLEID
         WHERE F.STATUSID='DTE_APROBADO' AND F.FACVENTAFECHA='2024-01-06';

SELECT * FROM ASIENTOS.ASIENTOS.pr_det_facturacion_ventas_gs_94('20240106');
SELECT * FROM facturacionbepsa.targetfact t3;
SELECT * FROM asientos.ASIENTOS.ASIENTO_DIARIO_WS ADW WHERE ADW.ID_CTA_CONT_CABE='94';
SELECT * FROM asientos.asientos.get_distinct_entidades('20240106', '94');
SELECT * FROM asientos.fn_get_by_entidad_asiento_ws('20240106', 'entidad', '94');

select ec.numero_cuenta , ec.fechainicial , count(1)
from conciliacion.extracto_cabecera ec
group by ec.numero_cuenta , ec.fechainicial
having count(1) > 1;

----FACTURA ALQUILER DE POS
CALL facturacionbepsa.insertar_facturas_pos(:p_tipocomprobanteid, :p_timbrado, :p_establecimientoid, :p_puntoexpedicionid, :p_timbradocomprobcajaid, :p_ejercicioid, :p_periodoid, :p_targetfactid, :p_monedaid, :p_tipoclienteid, :p_formapagoid, :p_secusername);

CALL facturacionbepsa.insertar_facturas_pos(
        'FAECA', '16410772', '001', '003', 'C-000',
        2024, 02, 'FACTALQPOS', 'PYG', 'Comercio', 'CREDITO-1D', 'Administrator');

SELECT * FROM FACTURACIONBEPSA.TIPOASIENTOCONTABLE T WHERE T.TIPOCOMPROBANTEID='FAECA' AND T.TARGETFACTID='FACTALQPOS';
--(TIPOCOMPROBANTEID, TARGETFACTID, TIPOASIENTOCONTABLEID) REFERENCES TIPOASIENTOCONTABLE,

CALL facturacionbepsa.insertar_facturas_pos(
'FAECA', '16410772', '001', '002', 'C-000', 2023, 12,
        'FactComercios', 'PYG', 'Comercio', 'CONTADO', 'Administrator', '', 'Comercios');

SELECT * FROM asientos.facturacionbepsa.FACVENTA F WHERE F.CLIENTEID IN (293)
AND F.FACVENTAFECHA='2024-02-08';

DELETE FROM FACTURACIONBEPSA.FACVENTADET F2 WHERE FACVENTAID IN (SELECT F.FACVENTAID FROM asientos.facturacionbepsa.FACVENTA F WHERE F.STATUSID='preformulario'
AND F.FACVENTAFECHA='2024-02-08');--(SELECT count(*) FROM FACTURACIONBEPSA.FACVENTA F WHERE F.FACVENTAFECHA='2024-02-08' and F.TARGETFACTID='FACTALQPOS');

DELETE FROM FACTURACIONBEPSA.FACVENTA F WHERE FACVENTAID IN (SELECT F.FACVENTAID FROM asientos.facturacionbepsa.FACVENTA F WHERE F.STATUSID='preformulario'
AND F.FACVENTAFECHA='2024-02-08');

DELETE FROM asientos.facturacionbepsa.FACVENTACUOTA F2 WHERE F2.FACVENTAID IN (SELECT F.FACVENTAID FROM asientos.facturacionbepsa.FACVENTA F WHERE F.STATUSID='preformulario'
AND F.FACVENTAFECHA='2024-02-08');--IN (SELECT F.FACVENTAID FROM FACTURACIONBEPSA.FACVENTA F WHERE F.FACVENTAFECHA='2024-02-08' and F.TARGETFACTID='FACTALQPOS');

DELETE FROM asientos.facturacionbepsa.FACVENTASTATUS F3 WHERE F3.FACVENTAID in (SELECT F.FACVENTAID FROM asientos.facturacionbepsa.FACVENTA F WHERE F.STATUSID='preformulario'
AND F.FACVENTAFECHA='2024-02-08'); --(SELECT F.FACVENTAID FROM FACTURACIONBEPSA.FACVENTA F WHERE F.FACVENTAFECHA='2024-02-08' and F.TARGETFACTID='FACTALQPOS');
ib
SELECT * FROM asientos.facturacionbepsa.FACVENTA F WHERE F.FACVENTAID='209064';
SELECT * FROM asientos.facturacionbepsa.FACVENTADET F WHERE F.FACVENTAID=209064;
SELECT * FROM asientos.facturacionbepsa.FACVENTACUOTA F WHERE F.FACVENTAID=209064;

SELECT * FROM asientos.facturacionbepsa.FACVENTA F WHERE F.FACVENTAFECHA='2024-02-08' AND F.TARGETFACTID='FACTAQLPOS';
SELECT * FROM asientos.facturacionbepsa.FORMAPAGO F;

SELECT  * from facturacionbepsa.fn_get_cliente_actualizacion_masiva();


CALL facturacionbepsa.insertar_facturas_pos(:p_tipocomprobanteid, :p_timbrado, :p_establecimientoid, :p_puntoexpedicionid, :p_timbradocomprobcajaid, :p_ejercicioid, :p_periodoid, :p_targetfactid, :p_monedaid, :p_tipoclienteid, :p_formapagoid, :p_secusername);
CALL facturacionbepsa.insertar_facturas_pos('FAECA', '12560254', '001', '003', 'C-000', 2024, 01, 'FACTALQPOS', 'PYG', 'Comercio', 'Credito1D', 'Administrator');


REFRESH MATERIALIZED
    VIEW FACTURACIONBEPSA.FPOS_INFO_FACTURACION_MENSUAL;


SELECT SUM(IMPORTE_TRNX)                                   MONTO_TCL,
       ADMINISTRADOR                                    AS ADMINISTRADOR_COD,
       FECHA_PROC                                       AS FECHA_TCLMOV,
       CONCILIACION.F_GET_CODENT_ANTIGUO(ADMINISTRADOR) AS CODENT
FROM ASIENTOS.PR_TRX_ADELANTO_CLEARING_PAGO_48HS_97('20240115')
WHERE TIPOIMPORTE = '-1'
  AND CUENTACONTABLE = '1.1.1.2.1.01'
  AND CUENTAAUXILIAR = '01-218426-06'
  AND TIPO_ACREDITACION = 'B'
GROUP BY ADMINISTRADOR,
         FECHA_PROC;

SELECT *
FROM ASIENTOS.PR_TRX_ADELANTO_CLEARING_PAGO_48HS_97('20240115') WHERE RRNBEPSA='401377305035'
WHERE TIPOIMPORTE = '-1'
  AND CUENTACONTABLE = '1.1.1.2.1.01'
  AND CUENTAAUXILIAR = '01-218426-06'
  AND TIPO_ACREDITACION = 'B'
  AND ADMINISTRADOR = 503202;


SELECT * FROM asientos.facturacionbepsa.PERIODO P;
INSERT INTO FACTURACIONBEPSA.PERIODO (EJERCICIOID, PERIODOID, PERIODODESC, PERIODOACTIVO, PERIODOFDESDE, PERIODOFHASTA, PERIODONOTAS)
VALUES (2023::INTEGER, 13::SMALLINT, 'Periodo Diciembre Complementario'::VARCHAR(300), 'SI'::VARCHAR(2), '2023-12-01'::DATE, '2023-12-31'::DATE, 'Complemento'::VARCHAR(5242880));

SELECT * FROM asientos.facturacionbepsa.PERIODOTARGETFACT P;
INSERT INTO FACTURACIONBEPSA.PERIODOTARGETFACT (EJERCICIOID, PERIODOID, TARGETFACTID, TARGETPERDESC, TARGETPERFDESDE, TARGETPERFHASTA, TARGETPERACTIVO, TARGETPERNOTAS, TARGETPERTABLENAME, TARGETFACTSTATUSID, TARGETFACTRETENCLOTEID)
VALUES (2023::INTEGER, 13::SMALLINT, 'FactComercios'::VARCHAR(20), 'FactComercios_2023_13'::VARCHAR(300), '2023-12-01'::DATE, '2023-12-31'::DATE, 'SI'::VARCHAR(2), 'complemento'::VARCHAR(5242880), NULL::VARCHAR(100), NULL::VARCHAR(40), NULL::CHAR(36));

SELECT * FROM asientos.facturacionbepsa.PERIODOTARGETFACTCYCLE P;
INSERT INTO FACTURACIONBEPSA.PERIODOTARGETFACTCYCLE (EJERCICIOID, PERIODOID, TARGETFACTID, TARGETFACTCYCLEID, TARGETFACTCYCLEDESC, TARGETFACTCYCLEFDESDE, TARGETFACTCYCLEFHASTA, TARGETFACTCYCLEACTIVO, TARGETFACTCYCLENOTAS, TARGETFACTCYCLETABLENAME)
VALUES (2023::INTEGER, 13::SMALLINT, 'FactComercios'::VARCHAR(20), 'Comercios'::VARCHAR(40), 'Ciclo Comercios'::VARCHAR(300), '2023-12-01'::DATE, '2023-12-31'::DATE, 'SI'::VARCHAR(2), 'complemento'::VARCHAR(5242880), NULL::VARCHAR(100));

INSERT INTO FACTURACIONBEPSA.PERIODOTARGETFACTCYCLE (EJERCICIOID, PERIODOID, TARGETFACTID, TARGETFACTCYCLEID, TARGETFACTCYCLEDESC, TARGETFACTCYCLEFDESDE, TARGETFACTCYCLEFHASTA, TARGETFACTCYCLEACTIVO, TARGETFACTCYCLENOTAS, TARGETFACTCYCLETABLENAME)
VALUES (2023::INTEGER, 13::SMALLINT, 'FactComercios'::VARCHAR(20), 'Retail'::VARCHAR(40), 'Ciclo Comercios'::VARCHAR(300), '2023-12-01'::DATE, '2023-12-31'::DATE, 'SI'::VARCHAR(2), 'complemento'::VARCHAR(5242880), NULL::VARCHAR(100));

SELECT * FROM asientos.facturacionbepsa.PERIODOTARGETFACTCYCLE P WHERE P.PERIODOID=13;
CREATE TABLE TRUSTED_ZONE.GXFINDTA_TCLMOV_COMPLEMENTO AS
SELECT * FROM TRUSTED_ZONE.GXFINDTA_TCLMOV_COMERTRX_PEND TCP
UNION--COMERCIOS
SELECT * FROM TRUSTED_ZONE.GXFINDTA_TCLMOV_RETAILTRX_PEND TRP;--RETAIL

--NEW
SELECT * FROM TRUSTED_ZONE.GXFINDTA_TCLMOV_COMPLEMENTO;

SELECT FACTURACIONBEPSA.SP_INSERT_FACTVENTA
       ('FAECA', '16410772', '001', '002', 'C-000',
        2023, 13,        'FactComercios', 'PYG', 'Comercio', 'CONTADO',
        'Administrator', '', 'Comercios');

SELECT FACTURACIONBEPSA.SP_INSERT_FACTVENTA
       ('FAECA', '16410772', '001', '002', 'C-000',
        2023, 13,        'FactComercios', 'PYG', 'Comercio', 'CONTADO',
        'Administrator', '', 'Retail');
---13234 + 7657 =   20891
SELECT *
FROM ASIENTOS.FACTURACIONBEPSA.FACVENTA F
WHERE F.STATUSID = 'preformulario'
  AND F.TARGETFACTID = 'FactComercios'
  AND F.TIPOCLIENTEID = 'Comercio'
  AND F.FACVENTAFECHA = '2024-04-30';

UPDATE  ASIENTOS.FACTURACIONBEPSA.FACVENTA F
SET FACVENTAFECHA='2024-04-30'
WHERE F.STATUSID = 'preformulario'
  AND F.TARGETFACTID = 'FactComercios'
  AND F.TIPOCLIENTEID = 'Comercio'
  AND F.FACVENTAFECHA = '2024-02-02';
-----------------------------------------------------------------------------------
SELECT * FROM asientos.facturacionbepsa.PERIODOTARGETFACT P WHERE P.EJERCICIOID=2024 AND P.PERIODOID=2;--AND P.TARGETFACTID='FACTALQPOS';

SELECT * FROM asientos.facturacionbepsa.PERIODOTARGETFACTCYCLE P WHERE P.EJERCICIOID=2024 AND P.PERIODOID=02;

INSERT INTO FACTURACIONBEPSA.PERIODOTARGETFACT (EJERCICIOID, PERIODOID, TARGETFACTID, TARGETPERDESC, TARGETPERFDESDE, TARGETPERFHASTA, TARGETPERACTIVO, TARGETPERNOTAS, TARGETPERTABLENAME, TARGETFACTSTATUSID, TARGETFACTRETENCLOTEID)
VALUES (2024, 2, 'FACTEMPES', 'COMISION EMPES', '2024-04-01', '2024-04-30', 'SI', '', NULL, NULL, NULL);


SELECT * FROM asientos.ASIENTO_DIARIO_WS ADW WHERE ADW.NRO_ASIENTO_K2B='74521'; --ADW.ID_CTA_CONT_CABE=109
SELECT * FROM asientos.ASIENTO_DIARIO_WS ADW WHERE ADW.NRO_ASIENTO_K2B='74239';
SELECT * FROM asientos.asientos.CUENTA_CONT_PROCESO_CABE CCPC WHERE CCPC.ID_CTA_CONT_CABE=109;

select * from asientos.asientos.asiento_diario_ws adw where id_cta_cont_cabe IN (109, 116, 110, 108, 107, 98, 115, 99, 106, 97, 129)
                                                        and fecha_movimiento >= '2023-12-28';

SELECT * FROM FACTURACIONBEPSA.RECCOBRO R WHERE establecimientoid='001' AND puntoexpedicionid='500';

SELECT * FROM asientos.facturacionbepsa.RECCOBRO R WHERE R.RECCOBROID IN('29130','29131'); -- 001-500-0140797
SELECT * FROM FACTURACIONBEPSA.RECCOBRODET R WHERE R.RECCOBROID IN('29130','29131');

select * from facturacionbepsa.fn_validacion_general('facventa', 246350,'modificar');
SELECT * FROM asientos.asientos.CUENTA_CONT_PROCESO_CABE CCPC WHERE CCPC.ID_CTA_CONT_CABE=94;

SELECT * FROM asientos.asientos.pr_gen_adelanto_clearing_pago_batch();


select sum(r2.reccobrodetfacventacuotaimp) as total, r.*
from facturacionbepsa.reccobro r,
   facturacionbepsa.reccobrodet r2,
   facturacionbepsa.sucursal s
where
    r.reccobroid = r2.reccobroid
	and r.tipoclienteid = s.tipoclienteid
	and r.clienteid = s.clienteid
	and r.sucursalid = s.sucursalid
    and r.reccobrofecha = '2024-02-20'
    and s.sucentidadid = '1017'
group by r.reccobroid;

SELECT * FROM asientos.facturacionbepsa.CLIENTE C WHERE C.CLIENTERUC='995128';
SELECT * FROM asientos.datos.GXFINDTA_TCOCNA T WHERE T.CLICLICOD=14630;

SELECT * FROM DATOS.GXFINDTA_TCLMOV T WHERE T.MOVIDMOV='119804054';
------------cantidad a facturar para operadoras
SELECT MOVOPOR OPERADORA, SUM(MOVIMPO) IMPORTE, SUM(MOVIMCO + MOVIVCO) "IVA+COMISION", SUM(MOVIMCO) COMISION, SUM(MOVIVCO) IVA_COMISION, SUM(MOVNETO) NETO
FROM GXFINDTA.TCLMOV
WHERE MOVOPOR IN ('700405', '700105', '700605')
  AND MOVFCRE BETWEEN '20240121' AND '20240220'
  AND (SERCODI IN ('PAGFAC', 'VTAMIN') AND PRECODI IN ('PFEW', 'PFTA', 'VTEP', 'VTEW', 'VTTA')
    AND MOVCODIS IN ('ATM', 'WEB', 'POS')) --('ATM', 'WEB', 'POS')
  AND MOVIVCO > 0
GROUP BY MOVOPOR;

--------------reporte muenusal query backend-------------------------
SELECT ROW_NUMBER() OVER () AS ITEM,
       TRNX_ID,
       CLIENTE,
       SUCURSAL,
       FCH_PRC,
       FCH_TRX,
       FCHCRE,
       TIPOTARJETA,
       TRNXS,
       IMP_TRNX,
       IMP_COMISION,
       IMP_IVA_COMIS,
       IMP_RENTA,
       IMP_IVA_RENTA,
       TOTAL_DESCUENTO,
       IMP_NETO,
       COMERCIOBEPSA,
       IMP_TOTAL_COMISION
FROM
    FACTURACIONBEPSA.FN_REPORTE_TRX_MENSUAL('facturacionbepsa.tclmov_tmp_comercio_202402_factcomercios', '17315', '1', '1');

SELECT --*
    F.TARGETFACTID,
    F.TIPOCLIENTEID,
    F.STATUSID, count(F.FACVENTANUMERO)
FROM FACTURACIONBEPSA.FACVENTA F
where F.TARGETFACTID = 'FactComercios'
AND F.TIPOCLIENTEID = 'Comercio'
AND F.FACVENTAFECHA = '2024-02-29'
GROUP BY F.TARGETFACTID,
    F.TIPOCLIENTEID,
    F.STATUSID;

SELECT * FROM asientos.facturacionbepsa.FACVENTA F WHERE F.FACCLIENTEID= 17396 AND F.TARGETFACTID='FactComercios' AND F.FACVENTAFECHA='2024-02-29';
SELECT * FROM asientos.facturacionbepsa.FACVENTADET F WHERE facventaid IN (256528, 256529, 256527);  ---178.703,00
SELECT * FROM asientos.facturacionbepsa.FACVENTARTSET F WHERE facventaid IN (256528, 256527, 256529);

SELECT F.STATUSID, count(*) FROM asientos.facturacionbepsa.FACVENTA F WHERE statusid IN ('DTE_CANCELADO', 'DTE_APROBADO') AND
F.FACVENTATOTALCOMPROBML=FACVENTATOTALCOMPROBML AND F.CLIENTEID=F.CLIENTEID AND F.FACVENTAFECHA='2024-02-29' AND F.TARGETFACTID='FactComercios'
GROUP BY F.STATUSID;

SELECT F.*,
       (SELECT SUM(FACVENTARETENSETMONTO) FROM ASIENTOS.FACTURACIONBEPSA.FACVENTA F WHERE F.CLIENTEID = 17396 AND F.SUCURSALID = 1 AND F.STATUSID <> 'DTE_APROBADO' AND F.FACVENTAFECHA = '2024-02-29' AND F.TARGETFACTID = 'FactComercios'),
       (SELECT SUM(FACVENTARETENSETIVA) FROM ASIENTOS.FACTURACIONBEPSA.FACVENTA F WHERE F.CLIENTEID = 17396 AND F.SUCURSALID = 1 AND F.STATUSID <> 'DTE_APROBADO' AND F.FACVENTAFECHA = '2024-02-29' AND F.TARGETFACTID = 'FactComercios'),
       (SELECT SUM(FACVENTARETENSETIVA + FACVENTARETENSETMONTO) FROM ASIENTOS.FACTURACIONBEPSA.FACVENTA F WHERE F.CLIENTEID = 17396 AND F.SUCURSALID = 1 AND F.STATUSID <> 'DTE_APROBADO' AND F.FACVENTAFECHA = '2024-02-29' AND F.TARGETFACTID = 'FactComercios')
FROM ASIENTOS.FACTURACIONBEPSA.FACVENTA F
WHERE F.CLIENTEID = 17396
  AND F.SUCURSALID = 1
  AND F.STATUSID = 'DTE_APROBADO'
  AND F.FACVENTAFECHA = '2024-02-29'
  AND F.TARGETFACTID = 'FactComercios';

SELECT T.MOVTPTA, SUM(MOVIMPO), SUM(MOVNETO), SUM(T.MOVRENT), SUM(T.MOVIVREN)
FROM TRUSTED_ZONE.GXFINDTA_TCLMOV T WHERE T.MOVCODCLI=17396 AND T.MOVCODSUC=1 AND T.MOVFCRE BETWEEN '2024-02-01' AND '2024-02-29'
GROUP BY T.MOVTPTA;

/*Renta:
Se debe calcular el 1% sobre el importe de la transacción.
IVA Renta:
Se debe calcular el 0,90909% sobre el importe de la transacción.*/

DO
$$
DECLARE
	rec RECORD;
	rt_setmonto NUMERIC;
	rt_setiva NUMERIC;
	rt_setneto NUMERIC;
BEGIN
	FOR rec IN
		SELECT
			F.*
		FROM
			ASIENTOS.FACTURACIONBEPSA.FACVENTA F
		WHERE
			F.STATUSID = 'DTE_APROBADO'
			AND F.FACVENTAFECHA = '2024-02-29'
			AND F.TARGETFACTID = 'FactComercios'
		LIMIT 100
	LOOP
		rt_setmonto := (SELECT SUM(f.FACVENTARETENSETMONTO) FROM ASIENTOS.FACTURACIONBEPSA.FACVENTA F WHERE F.CLIENTEID = rec.clienteid AND F.SUCURSALID = rec.sucursalid AND F.STATUSID <> 'DTE_APROBADO' AND F.FACVENTAFECHA = '2024-02-29' AND F.TARGETFACTID = 'FactComercios');
		rt_setiva := (SELECT SUM(f.FACVENTARETENSETIVA) FROM ASIENTOS.FACTURACIONBEPSA.FACVENTA F WHERE F.CLIENTEID = rec.clienteid  AND F.SUCURSALID = rec.sucursalid AND F.STATUSID <> 'DTE_APROBADO' AND F.FACVENTAFECHA = '2024-02-29' AND F.TARGETFACTID = 'FactComercios');
		rt_setneto := (SELECT SUM(f.FACVENTARETENSETIVA + f.FACVENTARETENSETMONTO)  FROM ASIENTOS.FACTURACIONBEPSA.FACVENTA F WHERE F.CLIENTEID = rec.clienteid  AND F.SUCURSALID = rec.sucursalid AND F.STATUSID <> 'DTE_APROBADO' AND F.FACVENTAFECHA = '2024-02-29' AND F.TARGETFACTID = 'FactComercios');
		RAISE NOTICE 'facventaid: %			setmonto: %		setiva: %		setneto: %', rec.facventaid,rt_setmonto, rt_setiva, rt_setneto;
	END LOOP;
END;

$$;

SELECT *
FROM asientos.facturacionbepsa.FACVENTARTSET F WHERE facventartsetfechaemision='2024-03-02'
                                                AND F.FACVENTARTSETLOTEID='d2001d6e-1393-4562-a230-7f1f330cbedc';

SELECT * FROM asientos.facturacionbepsa.fn_get_info_retenciones_filter();

SELECT * FROM facturacionbepsa.parametros p WHERE p.parmserial = 'digitosRedondeo';---redondeo

SELECT * FROM facturacionbepsa.fn_actualizar_facventa_retencion();

  --RTSET_ENVIADO
UPDATE asientos.facturacionbepsa.FACVENTA SET STATUSID='DTE_APROBADO'
    WHERE STATUSID='RTSET_ENVIADO';

/*WHERE FACVENTAID IN (
SELECT * FROM asientos.facturacionbepsa.FACVENTA F
INNER JOIN FACTURACIONBEPSA.FACVENTARTSET F2 ON F.FACVENTAID = F2.FACVENTAID
WHERE
    F.FACVENTAID=F2.FACVENTAID --AND F2.FACVENTARTSETLOTEID='d2001d6e-1393-4562-a230-7f1f330cbedc'
AND F.STATUSID='DTE_APROBADO');*/


SELECT * FROM asientos.facturacionbepsa.FACVENTARTSET F WHERE F.FACVENTARTSETLOTEID='900000000000260309';


SELECT *
FROM FACTURACIONBEPSA.FN_GET_INFO_RETENCIONES_SET('FAECA', '16410772', '001', '002',
                                                'C-000', 2024, 02, 'FactComercios', 'PYG',
                                                'Comercio', 'CNTDO', 'Administrator');

SELECT * FROM asientos.facturacionbepsa.FACVENTA F WHERE F.FACVENTACOMPROBANTESET='001-002-0034974';
SELECT * FROM asientos.facturacionbepsa.FACVENTADET F2 WHERE F2.FACVENTAID=260309;

SELECT * FROM asientos.facturacionbepsa.FACVENTA F WHERE F.CLIENTEID=4699 AND F.SUCURSALID=1;--F.FACVENTACOMPROBANTESET='001-002-0048293';
SELECT * FROM asientos.facturacionbepsa.FACVENTADET F2 WHERE F2.FACVENTAID IN (261000, 248273);

-------------------------------QUERY para las facturas clonadas que no llevo ruc y los campos de retenciones COCINADO----------------------------
select a.clienteid, a.sucursalid, a.facclienteid, a.facsucursalid , a.facventaclirazonsocial, a.facventanumero,a.facventafecha,
a.statusid aprob_estatus, a.facventaid aprob_ventaid, a.facventacliruc aprob_ruc, a.facventaretensetmonto aprob_retenmonto, a.facventaretensetiva aprob_reteniva, a.facventaretensetneto aprob_reteneto,
x.statusid rech_status, x.facventaid rech_ventaid, x.facventacliruc rech_ruc, x.facventaretensetmonto rech_retenmonto, x.facventaretensetiva rech_reteniva, x.facventaretensetneto rech_reteneto
from asientos.facturacionbepsa.FACVENTA a
join asientos.facturacionbepsa.FACVENTA x on a.sucursalid = x.sucursalid
and a.facclienteid = x.facclienteid and a.facventatotalcomprobml = x.facventatotalcomprobml
and a.TARGETFACTID = x.TARGETFACTID --and a.facventanumero = x.facventanumero
and a.facventafecha = x.facventafecha
where a.statusid = 'DTE_APROBADO' and x.statusid != 'DTE_APROBADO' and a.facventafecha = '2024-02-29' and a.TARGETFACTID = 'FactComercios'
and (x.facventaretensetmonto > 0 and x.facventaretensetiva > 0 and x.facventaretensetneto > 0);
--------------------------------------- update para la misma------------------------------------------------------------------------------------
update asientos.facturacionbepsa.FACVENTA f set facventacliruc = tt.rech_ruc, facventaretensetmonto = tt.rech_retenmonto,
facventaretensetiva = tt.rech_reteniva, facventaretensetneto = tt.rech_reteneto
from (select a.clienteid, a.sucursalid, a.facclienteid, a.facsucursalid , a.facventaclirazonsocial, a.facventanumero,a.facventafecha,
a.statusid aprob_estatus, a.facventaid aprob_ventaid, a.facventacliruc aprob_ruc, a.facventaretensetmonto aprob_retenmonto, a.facventaretensetiva aprob_reteniva, a.facventaretensetneto aprob_reteneto,
x.statusid rech_status, x.facventaid rech_ventaid, x.facventacliruc rech_ruc, x.facventaretensetmonto rech_retenmonto, x.facventaretensetiva rech_reteniva, x.facventaretensetneto rech_reteneto
from asientos.facturacionbepsa.FACVENTA a
join asientos.facturacionbepsa.FACVENTA x on a.sucursalid = x.sucursalid
and a.facclienteid = x.facclienteid and a.facventatotalcomprobml = x.facventatotalcomprobml
and a.TARGETFACTID = x.TARGETFACTID --and a.facventanumero = x.facventanumero
and a.facventafecha = x.facventafecha
where a.statusid = 'DTE_APROBADO' and x.statusid != 'DTE_APROBADO' and a.facventafecha = '2024-02-29' and a.TARGETFACTID = 'FactComercios'
and (x.facventaretensetmonto > 0 and x.facventaretensetiva > 0 and x.facventaretensetneto > 0)) tt
where f.clienteid = tt.clienteid and f.sucursalid = tt.sucursalid and f.facclienteid=tt.facclienteid and f.facsucursalid = tt.facsucursalid
and f.facventanumero = tt.facventanumero and f.facventafecha = '2024-02-29'
and f.statusid = 'DTE_APROBADO';
----------------------------------------query para alerta de correo------------------------------------------
SELECT c.cocomer comercio,t.cliclicod cliente, t.sucsuccod sucursal, c.codeno denominacion, c.corucn ruc, c.corazo razonsocial,
CASE WHEN C.COSTAT = 0 THEN 'ACTIVO' WHEN c.costat = 90 THEN 'BAJA'
     WHEN C.COSTAT = 1 THEN 'CONF_COMITE' END estadocomercio, trim(c.COEMAIL) maillegacy, trim(t.SUCCORREO) mailreing,
CASE
    WHEN lower(trim(c.COEMAIL)) = '' OR lower(trim(c.COEMAIL)) IS NULL OR lower(trim(t.SUCCORREO)) = '' OR lower(trim(t.SUCCORREO)) IS NULL THEN 'SIN_CORREO'
    WHEN lower(trim(c.COEMAIL)) != lower(trim(t.SUCCORREO)) THEN 'DIFERENCIA_LEG_VS_REING'
    WHEN NOT REGEXP_LIKE(LOWER(trim(C.COEMAIL)),'^[^@]+@[^@]+\.[a-zA-Z]{2,}$')
            OR NOT REGEXP_LIKE(LOWER(trim(t.SUCCORREO)),'^[^@]+@[^@]+\.[a-zA-Z]{2,}$') THEN 'ERROR_FORMATO'
    ELSE 'OK'
    END STATUSCORREO
FROM DATOS.GXBDBPS_COMAEAF c JOIN (
SELECT t.COCOMER,t.cliclicod, t.sucsuccod,  g_1.SUCCORREO FROM DATOS.GXFINDTA_TCMCLI T
JOIN DATOS.GXFINDTA_TCMSUC g_1 ON T.cliclicod = g_1.cliclicod
JOIN GXFINDTA.TCOCNA t ON t.CLICLICOD = g_1.CLICLICOD AND t.SUCSUCCOD =g_1.SUCSUCCOD and substr(t.cocomer,1,2) NOT IN ('80','81','85','45','86')
and substr(t.cocomer,1,2) < '87') t ON t.cocomer = c.cocomer
WHERE CASE
    WHEN lower(trim(c.COEMAIL)) = '' OR lower(trim(c.COEMAIL)) IS NULL OR lower(trim(t.SUCCORREO)) = '' OR lower(trim(t.SUCCORREO)) IS NULL THEN 'SIN_CORREO'
    WHEN lower(trim(c.COEMAIL)) != lower(trim(t.SUCCORREO)) THEN 'DIFERENCIA_LEG_VS_REING'
    WHEN NOT REGEXP_LIKE(LOWER(trim(C.COEMAIL)),'^[^@]+@[^@]+\.[a-zA-Z]{2,}$')
            OR NOT REGEXP_LIKE(LOWER(trim(t.SUCCORREO)),'^[^@]+@[^@]+\.[a-zA-Z]{2,}$') THEN 'ERROR_FORMATO'
    ELSE 'OK'
    END != 'OK' AND C.COSTAT != 90;
----------------------------------
--http://10.1.254.18/issues/70722
/*seleccion de factura detalle afectados para correccion*/
SELECT detapro.facventaid, detapro.facventadetitem,
detapro.facventadetmovimpo apfacventadetmovimpo, detapro.facventadetmovimco apfacventadetmovimco, detapro.facventadetmovivco apfacventadetmovivco, detapro.facventadetmovrent apfacventadetmovrent, detapro.facventadetmovivren apfacventadetmovivren, detapro.facventadetmovneto apfacventadetmovneto,
detrech.facventadetmovimpo rechfacventadetmovimpo, detrech.facventadetmovimco rechfacventadetmovimco, detrech.facventadetmovivco rechfacventadetmovivco, detrech.facventadetmovrent rechfacventadetmovrent, detrech.facventadetmovivren rechfacventadetmovivren, detrech.facventadetmovneto rechfacventadetmovneto
FROM asientos.facturacionbepsa.FACVENTADET detapro
join (select a.clienteid, a.sucursalid, a.facclienteid, a.facsucursalid , a.facventaclirazonsocial, a.facventanumero,a.facventafecha,
a.statusid aprob_estatus, a.facventaid aprob_ventaid, a.facventacliruc aprob_ruc, a.facventaretensetmonto aprob_retenmonto, a.facventaretensetiva aprob_reteniva, a.facventaretensetneto aprob_reteneto,
x.statusid rech_status, x.facventaid rech_ventaid, x.facventacliruc rech_ruc, x.facventaretensetmonto rech_retenmonto, x.facventaretensetiva rech_reteniva, x.facventaretensetneto rech_reteneto
from asientos.facturacionbepsa.FACVENTA a
join asientos.facturacionbepsa.FACVENTA x on a.sucursalid = x.sucursalid
and a.facclienteid = x.facclienteid and a.facventatotalcomprobml = x.facventatotalcomprobml
and a.TARGETFACTID = x.TARGETFACTID --and a.facventanumero = x.facventanumero
and a.facventafecha = x.facventafecha
where a.statusid = 'DTE_APROBADO' and x.statusid != 'DTE_APROBADO' and a.facventafecha = '2024-02-29' and a.TARGETFACTID = 'FactComercios'
and (x.facventaretensetmonto > 0 and x.facventaretensetiva > 0 and x.facventaretensetneto > 0)) tt
on detapro.facventaid = tt.aprob_ventaid
join asientos.facturacionbepsa.FACVENTADET detrech
on detrech.facventaid = tt.rech_ventaid and detapro.facventadetitem = detrech.facventadetitem
where tt.aprob_estatus = 'DTE_APROBADO';
-------------------------------------------------------------
/*repair de facturacion detalle*/
update asientos.facturacionbepsa.FACVENTADET d set facventadetmovimpo= x.rechfacventadetmovimpo,
facventadetmovimco = x.rechfacventadetmovimco , facventadetmovivco = x.rechfacventadetmovivco ,
facventadetmovrent = x.rechfacventadetmovrent, facventadetmovivren = x.rechfacventadetmovivren,
facventadetmovneto = x.rechfacventadetmovneto
from (SELECT detapro.facventaid, detapro.facventadetitem,
detapro.facventadetmovimpo apfacventadetmovimpo, detapro.facventadetmovimco apfacventadetmovimco, detapro.facventadetmovivco apfacventadetmovivco, detapro.facventadetmovrent apfacventadetmovrent, detapro.facventadetmovivren apfacventadetmovivren, detapro.facventadetmovneto apfacventadetmovneto,
detrech.facventadetmovimpo rechfacventadetmovimpo, detrech.facventadetmovimco rechfacventadetmovimco, detrech.facventadetmovivco rechfacventadetmovivco, detrech.facventadetmovrent rechfacventadetmovrent, detrech.facventadetmovivren rechfacventadetmovivren, detrech.facventadetmovneto rechfacventadetmovneto
FROM asientos.facturacionbepsa.FACVENTADET detapro
join (select a.clienteid, a.sucursalid, a.facclienteid, a.facsucursalid , a.facventaclirazonsocial, a.facventanumero,a.facventafecha,
a.statusid aprob_estatus, a.facventaid aprob_ventaid, a.facventacliruc aprob_ruc, a.facventaretensetmonto aprob_retenmonto, a.facventaretensetiva aprob_reteniva, a.facventaretensetneto aprob_reteneto,
x.statusid rech_status, x.facventaid rech_ventaid, x.facventacliruc rech_ruc, x.facventaretensetmonto rech_retenmonto, x.facventaretensetiva rech_reteniva, x.facventaretensetneto rech_reteneto
from asientos.facturacionbepsa.FACVENTA a
join asientos.facturacionbepsa.FACVENTA x on a.sucursalid = x.sucursalid
and a.facclienteid = x.facclienteid and a.facventatotalcomprobml = x.facventatotalcomprobml
and a.TARGETFACTID = x.TARGETFACTID --and a.facventanumero = x.facventanumero
and a.facventafecha = x.facventafecha
where a.statusid = 'DTE_APROBADO' and x.statusid != 'DTE_APROBADO' and a.facventafecha = '2024-02-29' and a.TARGETFACTID = 'FactComercios'
and (x.facventaretensetmonto > 0 and x.facventaretensetiva > 0 and x.facventaretensetneto > 0)) tt
on detapro.facventaid = tt.aprob_ventaid
join asientos.facturacionbepsa.FACVENTADET detrech
on detrech.facventaid = tt.rech_ventaid and detapro.facventadetitem = detrech.facventadetitem
where tt.aprob_estatus = 'DTE_APROBADO') x
where x.facventaid = d.facventaid and x.facventadetitem = d.facventadetitem;

----bk del detalle----
create TABLE PUBLIC.facventadetbkp AS SELECT * FROM asientos.facturacionbepsa.FACVENTADET F;

-----segundo envio
DELETE FROM asientos.facturacionbepsa.FACVENTARTSET F WHERE F.FACVENTARTSETLOTEID='c31fc1a9-8902-4bc5-8bde-433338eb9bcc';---
---bk del lote
CREATE TABLE FACVENTARTSETbk as SELECT * FROM asientos.facturacionbepsa.FACVENTARTSET F WHERE F.FACVENTARTSETLOTEID='c31fc1a9-8902-4bc5-8bde-433338eb9bcc';
SELECT * FROM FACVENTARTSETbk;
--cambio de estado
SELECT * FROM asientos.facturacionbepsa.FACVENTA F
INNER JOIN FACTURACIONBEPSA.FACVENTARTSET F2 ON F.FACVENTAID = F2.FACVENTAID
WHERE F2.FACVENTARTSETLOTEID='d2001d6e-1393-4562-a230-7f1f330cbedc';

  --RTSET_ENVIADO
UPDATE asientos.facturacionbepsa.FACVENTA SET STATUSID='RTSET_ENVIADO'
WHERE FACVENTAID IN (
SELECT F.FACVENTAID FROM asientos.facturacionbepsa.FACVENTA F
INNER JOIN FACTURACIONBEPSA.FACVENTARTSET F2 ON F.FACVENTAID = F2.FACVENTAID
WHERE
    F.FACVENTAID=F2.FACVENTAID AND F2.FACVENTARTSETLOTEID='d2001d6e-1393-4562-a230-7f1f330cbedc'
AND F.STATUSID='DTE_APROBADO');

UPDATE asientos.facturacionbepsa.FACVENTA SET STATUSID='DTE_APROBADO'  WHERE STATUSID='RTSET_ENVIADO';

SELECT G.CLICLICOD, T.CLICNTSUC, T.CLIDENCOM, T.CLIRAZSOC, T.CLIRUC, G.SUCCORREO  FROM asientos.datos.GXFINDTA_TCMCLI T
INNER JOIN DATOS.GXFINDTA_TCMSUC G ON T.CLICLICOD = G.CLICLICOD;

SELECT * FROM asientos.facturacionbepsa.PERIODOTARGETFACTCYCLE P WHERE targetfactid='FactComercios' AND targetfactcycleid='Retail';

SELECT
    fset.facventartsetloteid,
    fv.facventaid,
    fv.facventadesc,
    c.clienterazonsocial,
    c.clienteruc,
    c.clientedv,
    c.clientetipocontrib,
    c.clientetipopersona
FROM
    facturacionbepsa.facventartset fset
INNER JOIN facturacionbepsa.facventa fv ON
    fset.facventaid = fv.facventaid
INNER JOIN facturacionbepsa.cliente c ON
    fv.tipoclienteid = c.tipoclienteid
    AND fv.clienteid = c.clienteid
WHERE
    fset.facventartsetprocesamientocorr = TRUE
    AND fv.ejercicioid = 2023
    AND fv.periodoid = 12;
    --AND fset.facventartsetloteid = :facventartsetloteid
   -- AND c.clientetipocontrib = 'NCONT'


    (SELECT REPLACE(FACTURACIONBEPSA.FN_OBTENER_PARMVALUE('parmFechaMV'::CHARACTER VARYING, '5'::CHARACTER VARYING)::TEXT, '-'::TEXT, ''::TEXT) AS FECHA5,
                           REPLACE(FACTURACIONBEPSA.FN_OBTENER_PARMVALUE('parmFechaMV'::CHARACTER VARYING, '6'::CHARACTER VARYING)::TEXT, '-'::TEXT, ''::TEXT) AS FECHA6);


truncate table conciliacion.extractos_no_conciliados;

--obtiene los datos de los movimientos no conciliados de la cuenta 601
select cuenta, referencia_extracto, descripcion_extracto, fecha_extracto, debe, haber, fecha_tclmov, nombre_asiento, numero_asiento_k2b, conciliado, asiento, fecha_hora_insercion, usuario_modificacion, fecha_hora_modificacion, id_referencias, nro_tarjeta, observacion, diferencia, fecha_informe, cod_transacc_ext, hora
 from conciliacion.extractos_no_conciliados enc where cuenta = '01-218406-01' and fecha_extracto < '2024-01-11';

 --obtiene los datos del resultado generado de la conciliacion de la cuenta 606
TRUNCATE  TABLE conciliacion.extractos_informe;
----------------------------------------------------------------
INSERT INTO FACTURACIONBEPSA.FACCLISUC (TARGETFACTID, TIPOCLIENTEID, CLIENTEID, SUCURSALID, FACCLIENTEID, FACSUCURSALID, FACCLISUCACTIVO, FACCLISUCNOTAS)
VALUES ('LEGACY', 'Comercio', 21029, 1, 21029, 1, 'SI', 'Carga masiva');

---------------------para hacer nota de credito masivo----------------------
SELECT * FROM FACTURACIONBEPSA.sp_ncredito_insert_nvo(); --en vase a este...
SELECT * FROM asientos.facturacionbepsa.TIPOASIENTOCONTABLE T WHERE T.TARGETFACTID='FactComercios' AND T.TIPOCOMPROBANTEID='NCECA';
DO $$
DECLARE
    v_facventaid integer;
    v_timbradoid character varying;
    v_tipocomprobanteid character varying;
    v_detalles facturacionbepsa.detail_ncred_type[];
   r record;
  detalle record;
BEGIN
    FOR r IN
        SELECT
            c.facventaid, c.timbradoid, 'NCECA' AS tipocomprobanteid, c.establecimientoid, '001' AS puntoexpedicionid, c.timbradocomprobcajaid,
            c.ejercicioid, c.periodoid, c.targetfactid, c.clienteid, c.sucursalid, c.monedaid, c.facventacondicion, c.facventatotalexcml,
            c.facventatotalgr05ml, c.facventatotalgr10ml,'NCrComercio' as tipoasientocontableid, c.tipoclienteid, 'Administrator' AS secusername,
            c.facventacotizcompra, c.facventacotizventa
        FROM
            facturacionbepsa.facventa c
        WHERE
            c.facventaid IN (262960, 262961, 262962, 262963, 262964, 262965, 262966, 262967, 262968, 262969, 262970, 262971, 262972, 262974, 262975, 262977,
                             262978, 262979, 262980, 262981, 262982, 262984, 262985, 262986, 262987, 262988, 262989, 262990, 262991, 262992, 262993, 262994,
                             262995, 262996, 262997, 262998, 262999, 263000, 263001, 263002, 263003, 263005, 263006, 263007, 263008, 263009, 263010, 263011,
                             263012, 263013, 263014, 263015, 263016, 263017, 263018, 263019, 263020, 263021, 263022, 263023, 263024, 263025, 263026, 263027,
                             263028, 263029, 263030, 263031, 263032, 263033, 263037, 263038, 263039, 263040, 263041, 263042, 263043, 263044, 263045, 263046,
                             263047, 263048, 263049, 263050, 263051, 263052, 263053, 263054, 263055, 263056, 263057, 263058, 263059, 263060, 263061, 263062,
                             263063, 263064, 263067, 263068, 263069, 263070, 263071, 263072, 263073, 263074, 263075, 263076, 263077, 263078, 263079, 263080,
                             263081, 263082, 263083, 263084, 263085, 263086, 263087, 263088, 263089, 263095, 263096, 263097, 263098, 263100, 263106, 263108,
                             263112, 263114, 263285, 263286, 263287, 263288, 260309, 263034, 262983, 263004, 263035, 263036, 263065, 263066, 263093, 263094,
                             263289, 260411, 260412, 260425, 260426, 260427)
    LOOP
        v_facventaid := r.facventaid;
        v_timbradoid := r.timbradoid;
        v_tipocomprobanteid := r.tipocomprobanteid;

        -- Inicializar el array de detalles
        v_detalles := ARRAY[]::facturacionbepsa.detail_ncred_type[];

        -- Obtener los detalles de la factura
        FOR detalle IN
            SELECT
                c.facventadetitem, c.servprestid, c.facventadetcant, c.facventadetprecioml, c.facventadetstotalexcml,
                c.facventadetstotalgr05ml, c.facventadetstotalgr10ml, c.facventadetservprestdesc
            FROM
                facturacionbepsa.facventadet c
            WHERE
                c.facventaid = v_facventaid
        LOOP
            -- Agregar cada detalle al array de detalles
            v_detalles := v_detalles || ARRAY[ROW(detalle.facventadetitem, detalle.servprestid, detalle.facventadetcant,
                                        detalle.facventadetprecioml, detalle.facventadetstotalexcml, detalle.facventadetstotalgr05ml,
                                        detalle.facventadetstotalgr10ml, detalle.facventadetservprestdesc)::facturacionbepsa.detail_ncred_type];
        END LOOP;
        call facturacionbepsa.sp_ncredito_insert_nvo(
            v_facventaid::integer, v_timbradoid::varchar,
            v_tipocomprobanteid::varchar,
            r.establecimientoid::varchar, r.puntoexpedicionid::varchar,
            r.timbradocomprobcajaid::varchar,r.ejercicioid::integer,
            r.periodoid::integer, r.targetfactid::varchar,
            r.clienteid::integer,
            r.sucursalid::integer, r.monedaid::varchar, r.facventacondicion::varchar,
            r.facventatotalexcml::numeric,r.facventatotalgr05ml::numeric,
            r.facventatotalgr10ml::numeric, r.tipoasientocontableid::varchar,
            r.tipoclienteid::varchar, r.secusername::varchar,
            r.facventacotizcompra::numeric,
            r.facventacotizventa::numeric, v_detalles::facturacionbepsa.detail_ncred_type[]
        );
    END LOOP;
END $$;

SELECT * FROM asientos.facturacionbepsa.NCREDITO N WHERE N.CLIENTEID=10937 AND N.STATUSID='preformulario';
--------- para hacer nota de credito masivo POR LA DIFERENCIA --------------
SELECT * FROM PUBLIC.FACVENTADIFERENCIA F;
DO $$
DECLARE
    v_facventaid integer;
    v_timbradoid character varying;
    v_tipocomprobanteid character varying;
    v_detalles facturacionbepsa.detail_ncred_type[];
   r record;
  detalle record;
BEGIN
    FOR r IN
        SELECT
            c.facventaid, c.timbradoid, 'NCECA' AS tipocomprobanteid, c.establecimientoid, '001' AS puntoexpedicionid, c.timbradocomprobcajaid,
            c.ejercicioid, c.periodoid, c.targetfactid, c.clienteid, c.sucursalid, c.monedaid, c.facventacondicion, c.facventatotalexcml,
            c.facventatotalgr05ml, c.facventatotalgr10ml,'FACTALQPOS' as tipoasientocontableid, c.tipoclienteid, 'Administrator' AS secusername,
            c.facventacotizcompra, c.facventacotizventa, fd.DIFERENCIA AS diferencia, c.facventacomprobanteset
        FROM
            facturacionbepsa.facventa c
        INNER JOIN PUBLIC.FACVENTADIFERENCIA fd  ON fd.facventaid = c.facventaid
    LOOP
        v_facventaid := r.facventaid;
        v_timbradoid := r.timbradoid;
        v_tipocomprobanteid := r.tipocomprobanteid;

        -- Inicializar el array de detalles
        v_detalles := ARRAY[]::facturacionbepsa.detail_ncred_type[];

        -- Obtener los detalles de la factura
        FOR detalle IN
            SELECT
                c.facventadetitem, c.servprestid,  c.facventadetstotalexcml, c.facventadetstotalgr05ml, c.facventadetservprestdesc
            FROM
                facturacionbepsa.facventadet c
            WHERE
                c.facventaid = v_facventaid
        LOOP
            -- Agregar cada detalle al array de detalles
            v_detalles := v_detalles || ARRAY[ROW(detalle.facventadetitem, detalle.servprestid, 1,
                                        r.diferencia, detalle.facventadetstotalexcml, detalle.facventadetstotalgr05ml,
                                        r.diferencia, 'NC ALQUILER DE POS MARZO FACTURA Nº ' || r.facventacomprobanteset)::facturacionbepsa.detail_ncred_type];
        END LOOP;

        RAISE NOTICE 'Cabecera: %', r;
        RAISE NOTICE 'Detalle: %', v_detalles;
        call facturacionbepsa.sp_ncredito_insert_nvo(
            v_facventaid::integer, v_timbradoid::varchar,
            v_tipocomprobanteid::varchar,
            r.establecimientoid::varchar, r.puntoexpedicionid::varchar,
            r.timbradocomprobcajaid::varchar,r.ejercicioid::integer,
            r.periodoid::integer, r.targetfactid::varchar,
            r.clienteid::integer,
            r.sucursalid::integer, r.monedaid::varchar, r.facventacondicion::varchar,
            r.facventatotalexcml::numeric,r.facventatotalgr05ml::numeric,
            r.diferencia::numeric, r.tipoasientocontableid::varchar,
            r.tipoclienteid::varchar, r.secusername::varchar,
            r.facventacotizcompra::numeric,
            r.facventacotizventa::numeric, v_detalles::facturacionbepsa.detail_ncred_type[]
        );
    END LOOP;

END $$;

SELECT * FROM asientos.facturacionbepsa.NCREDITO N WHERE N.NCREDITOFECHA='2024-03-21';
SELECT * FROM asientos.facturacionbepsa.NCREDITOSTATUS N WHERE ncreditoid IN (1888, 1897, 1898, 1890, 1849, 1853, 1869, 1895, 1896, 1903, 1959, 1848, 1850, 1847, 1855, 1852, 1854, 1857, 1861, 1864, 1889, 1891, 1880, 1884, 1885, 1910, 1915, 1906, 1909, 1974, 1994, 2052, 2095);
SELECT --*
    F.TARGETFACTID,
    F.TIPOCLIENTEID,
    F.STATUSID, count(F.NCREDITONUMERO)
FROM FACTURACIONBEPSA.ncredito F
where F.TARGETFACTID = 'FACTALQPOS'
AND F.TIPOCLIENTEID = 'Comercio'
AND F.NCREDITOFECHA = '2024-03-21'
GROUP BY F.TARGETFACTID,
    F.TIPOCLIENTEID,
    F.STATUSID;
----------------------------------------------------------------------
SELECT F.STATUSID, concat(F.FACVENTASIRIUSPDFPATH) FROM asientos.facturacionbepsa.FACVENTA F WHERE F.FACVENTAFECHA='2024-02-29'
AND F.TARGETFACTID='FactComercios' AND F.FACVENTACLIRUC='80008431-4' AND F.STATUSID='DTE_APROBADO';

SELECT CONCAT('http://fdigital.bepsa.com.py/', SUBSTRING(facventasiriuspdfpath, 9,  48)) AS pfd_sirius, f.*
FROM asientos.facturacionbepsa.FACVENTA F WHERE F.FACVENTAFECHA='2024-03-27'
AND F.TARGETFACTID='FactComercios' AND F.FACVENTACLIRUC='80016096-7' AND F.STATUSID='DTE_APROBADO';

http://fdigital.bepsa.com.py/KuDE/2024/03/20240327/FE/FE_001-002-0051960.pdf

http://fdigital.bepsa.com.py/kude/2024/03/20240327/FE/FE_001-002-0062485.pdf -- ok

http://fdigital.bepsa.com.py/KuDE/2024/03/20240327/FE/FE_001-002-0062460.pdf --db
---reporte masivo kude
SELECT * FROM facturacionbepsa.fn_get_datos_reporte_request();

SELECT
	    f.ejercicioid,
	    f.periodoid,
	    f.targetfactid,
	    f.clienteid,
	    f.sucursalid AS "sucursal_desde",
	    f.sucursalid AS "sucursal_hasta"
	FROM
	    facturacionbepsa.facventa f--,
	    --facturacionbepsa.periodotargetfactcycle p
	WHERE
	   /* p.ejercicioid = f.ejercicioid
	    AND p.periodoid = f.periodoid
	    AND p.targetfactid = f.targetfactid*/
	    --AND
	    f.ejercicioid = 2024
	    AND f.periodoid = 03
	    AND f.targetfactid = 'FACTALQPOS'
	    --AND p.targetfactcycleid = p_targetfactcycleid
	    --AND f.tipoclienteid = 'Comercio' -- verificar
	ORDER BY
	    f.clienteid, f.sucursalid;
---luego de el de arriba el backend le llama a este
SELECT * FROM facturacionbepsa.fn_get_facventa_reporte();
--reporte mensual
select * from facturacionbepsa.fn_get_numerofactura_from_report();


---quey para comparar lo facturado y lo que tenía que ser (retail)
SELECT FACCLIENTEID,
       FACSUCURSALID,
       SUM(F.FACVENTATOTALCOMPROBML)       FACTURADO,
       (SELECT SUM(T.MOVIMCO + T.MOVIVCO)
        FROM FACTURACIONBEPSA.TCLMOV_TMP_RETAIL_202402_FACTCOMERCIOS T
        WHERE T.MOVCODCLI = F.FACCLIENTEID
          AND T.MOVCODSUC = FACSUCURSALID) A_FACTURAR
FROM FACTURACIONBEPSA.FACVENTA F
WHERE F.FACCLIENTEID = 10937
  AND F.TARGETFACTID = 'FactComercios'
  AND F.PERIODOID = '2'
  AND F.EJERCICIOID = '2024'
  AND F.FACVENTAID NOT IN (SELECT N.NCREDITOID FROM FACTURACIONBEPSA.NCREDITO N)
  AND F.STATUSID = 'DTE_APROBADO'
GROUP BY FACCLIENTEID, FACSUCURSALID;

SELECT fecha_mov, movcodem, cuentaauxcontablecodigo, personapaisdocumentocodigo, personatipodocumentocodigo, personadocumento, centrocostocodigo, itemproyectocodigo, cuentacontablecodigo, monedacodigo, tipomovimiento, importemonedaorigen, importemonedalocal, importemonedaextranjera, importemonedaconsolidacion, fecha_hora_proceso, estado_proceso, descripcion_estado_proceso, linea_asiento, tipo_asiento, nro_asiento_interno, id_cta_cont_cabe, nro_asiento_k2b, txt_cambios_app, cotizacion, asiento_k2b_ext_numero, asiento_k2b_ext_fecha
FROM asientos.asiento_diario_ws adw
where adw.fecha_mov::date between '20231228'::date and '20240223'::date
and adw.id_cta_cont_cabe in(99,115,100,108,109,98,107,97,116,129);

SELECT * FROM asientos.sp_update_cuenta_cont_proceso_cabe();

ALTER TABLE asientos.asientos.asiento_diario_ws ALTER COLUMN id DROP IDENTITY;

ALTER TABLE  asientos.asientos.asiento_diario_ws ALTER COLUMN id
    ADD GENERATED ALWAYS AS IDENTITY (INCREMENT BY 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 3369438 CACHE 1 NO CYCLE);

SELECT N.STATUSID, n.* FROM asientos.facturacionbepsa.NCREDITO N WHERE N.NCREDITOID IN (1654, 1655, 1656, 1657, 1658, 1659, 1660, 1661, 1662, 1663, 1664, 1665, 1666, 1667, 1668, 1669, 1670, 1671, 1672, 1673, 1674, 1675, 1676, 1677, 1678, 1679, 1680, 1681, 1682, 1683);

--genera detalle facturas
SELECT * from facturacionbepsa.insertar_facturas_pos_det();


SELECT * FROM asientos.facturacionbepsa.RECCOBRO R WHERE R.RECCOBROID=53997;

--CONSUTA DE PANTALLA RECIBO
SELECT *
FROM FACTURACIONBEPSA.FN_GET_RECCOBRO_BY_EJERCICIOS_PERIODOS_TARGETS('2024', '3', 'CARGINT', '001', NULL, '16410772', NULL, NULL, NULL, NULL, '2024-03-19', '2024-03-19', NULL, NULL, NULL);

SELECT * FROM FACTURACIONBEPSA.NCREDITO N WHERE N.NCREDITOCOMPROBANTESET='001-001-0000135';

SELECT
    f.facventaid,
    f.facventadesc,
    sum(fd.facventadetstotalgr10ml) AS facventatotalgr10ml,
    round(sum(fd.facventadetstotalgr10ml) / 11,2) AS facventatotalivagr10ml_calculado,
    f.facventatotalivagr10ml AS facventatotalivagr10ml_actual,
    f.facventatotalivagr10ml  - round(sum(fd.facventadetstotalgr10ml) / 11,2) AS diferencia,
f.FACVENTATOTALIVAGRAVADAML
FROM
    facturacionbepsa.facventa f ,
    facturacionbepsa.facventadet fd
WHERE
    f.facventaid = fd.facventaid
    AND f.monedaid = 'USD'
    AND f.facventafecha = '2024-03-16'
GROUP BY
    f.facventaid,
    f.facventadesc;

SELECT * FROM FACTURACIONBEPSA.sp_fac_venta_insert_nvo();

SELECT F.FACVENTATOTALIVAGR10ML, f.FACVENTATOTALIVAGRAVADAML, f.* FROM asientos.facturacionbepsa.FACVENTA F WHERE F.FACVENTAID IN ('285784', '285785', '285786');

seleCT * FROM asientos.facturacionbepsa.FACVENTA F WHERE F.TARGETFACTID='FACTALQPOS'
AND F.FACVENTACLIRUC='80048992-6' AND F.FACVENTAFECHA='2024-03-08';

SELECT * FROM  asientos.facturacionbepsa.FACVENTA F WHERE F.FACVENTACLIRUC='80016096-7' ;
SELECT * FROM asientos.facturacionbepsa.NCREDITO N WHERE N.CLIENTEID=10937 AND N.NCREDITOFECHA='2024-03-20';

---control recibo
SELECT R.*
FROM FACTURACIONBEPSA.RECCOBRODET R
WHERE R.RECCOBROID IN (SELECT R.RECCOBROID
                       FROM FACTURACIONBEPSA.RECCOBROSTATUS R
                       WHERE R.RECCOBROSTATUSUSERID = 17446
                         AND RECCOBROSTATUSID = 'preformulario'
                         AND DATE(RECCOBROSTATUSFH) = '2024-03-25');

SELECT * FROM FACTURACIONBEPSA.FACVENTA F WHERE F.FACVENTAFECHA='2024-03-20' AND F.FACVENTACLIRUC='80016096-7';
SELECT * FROM asientos.facturacionbepsa.NCREDITO N WHERE N.NCREDITOFECHA='2024-03-20' AND N.NCREDITOCLIRUC='80016096';


SELECT * FROM asientos.facturacionbepsa.FACVENTA F WHERE F.CLIENTEID=11728 AND F.STATUSID='DTE_APROBADO' AND F.TARGETFACTID='FactComercios';

SELECT * FROM TRUSTED_ZONE.gxfindta_tclmov where MOVCOMER='6900896' --MAZFACIL
AND movfCRE between '20240101' and '20240331';

UPDATE TRUSTED_ZONE.GXFINDTA_TCLMOV T SET movfcre='20240301'
                                       WHERE T.MOVIDMOV IN (119898303, 120054225, 120223948, 120223959, 120567102, 120567103, 120567104, 120567097, 120933163, 120933164, 120933162, 121480596, 121480597, 121480602, 121480603, 121480604, 121691466, 121691467, 121691468, 121817713, 121946521, 121946522, 122339690, 122525982, 122643632, 122643633, 122643647, 124861290, 124861278, 124861279, 124861280, 124861281, 124861282, 124861283, 124861284, 124861285, 124861286, 124861287, 124861288, 124861289, 124861291, 124861292, 124861293, 124861294, 124861295, 124861296, 124861297, 124861298, 124861299, 124861300, 124861301, 124861302, 124861303, 124861304, 124861305, 124861306, 124861307, 124861308, 124861309, 124861310, 124861311, 124861312, 124861313, 124861314, 124861315, 124861316, 124861317, 124861318, 124861319, 124861320, 124861321, 124861322, 124861323, 125865780, 125865781, 125865782, 125865783, 125865786, 125865787, 125865788, 125865789, 125865790, 125865791, 125865793, 125865794, 125865795, 125865796, 125865797, 125865798, 125865799, 126076993, 126076994, 126077004, 126077005, 126077006, 126077007, 126077008, 126199381, 126199382, 126199393, 126199394, 126199397, 126199398, 126321107, 126321108, 126321109, 126321110, 126321111, 126321153, 126321154, 126321155, 126321156, 126455007, 126455008, 126455009, 126455010, 126455011, 126455012, 126455013, 126455014, 126455015, 126455016, 126455017, 126455066, 127052458, 127052459, 127052460, 127052461, 127052463, 127163476, 127163477, 127292420, 127292422, 127292423, 127292424, 127292425, 127292426, 127292427, 127292428, 127778487, 127778488, 127778489, 127778490, 127778491, 127778492, 127778493, 127778494, 127778495, 127778496, 127778540, 127778541, 127778544, 127778593, 128347846, 128347847, 128347848, 128347849, 128347850, 128347851, 128347852, 128347853, 128347854, 128347855, 128347856, 128347857, 128347858, 128347859, 128347860, 128347861, 128347862, 128347863, 128347864, 128347865, 128347866, 128347867, 128347868, 128347869, 128347870, 128347871, 128347872, 128347873, 128347874, 128347875, 128347877, 128347878, 128347879, 128347880, 128347881, 128347882, 128347883, 128347884, 128347885, 128347886, 128347887, 128347942, 128348058, 128348082, 118869252);
SELECT * FROM TRUSTED_ZONE.gxfindta_tclmov where MOVCOMER='5000053' --glacial
AND --movfCRE between '20240101' and '20240331';
movidmov IN (119453261, 120567098, 121480606, 124498623, 125291123, 125865792);

SELECT * FROM asientos.facturacionbepsa.NCREDITO N WHERE N.NCREDITOCOMPROBANTESET='001-001-0001779';

--001-003-0053178;
SELECT * FROM asientos.facturacionbepsa.CLIENTE C WHERE C.CLIENTEPHONE LIKE '%|%';
SELECT * FROM asientos.facturacionbepsa.SUCURSAL S WHERE S.SUCURSALPHONE LIKE '%%';

UPDATE asientos.facturacionbepsa.SUCURSAL set SUCURSALEMAIL ='clientespetrosurg3@hotmail.com' WHERE CLIENTEID=17315;

--factcomercios 2024-03-27
--13.575
SELECT * FROM asientos.facturacionbepsa.CLIENTE C;

SELECT * FROM asientos.facturacionbepsa.FACVENTA F WHERE F.FACVENTAID=313926;
--313930

SELECT  FROM asientos.facturacionbepsa.NCREDITO N WHERE N.NCREDITOCOMPROBANTESET IN
('001-001-0001781','001-001-0001782','001-001-0001783');

SELECT * FROM asientos.facturacionbepsa.FACVENTA F WHERE F.FACVENTACLIRUC='80088694-1' AND F.FACVENTAFECHA='2024-03-27';

-- nombre de tabla
select p.targetfactcycletablename, p.*
from facturacionbepsa.periodotargetfactcycle p
where p.ejercicioid = 2024
and p.periodoid = 02
and p.targetfactid = 'FactComercios'
and p.targetfactcycleid = 'Operadoras';

-- reporte mensual (usando nombre de tabla)
select
    row_number() over () as item,
    trnx_id,
    cliente,
    sucursal,
    fch_prc,
    fch_trx,
    fchcre,
    tipotarjeta,
    trnxs,
    imp_trnx,
    imp_comision,
    imp_iva_comis,
    imp_renta,
    imp_iva_renta,
    total_descuento,
    imp_neto,
    comerciobepsa,
    imp_total_comision
from
    FACTURACIONBEPSA.fn_reporte_trx_mensual ('facturacionbepsa.tclmov_tmp_operadoras_202401_factcomercios', 11728, 2, 2);

SELECT T.MOVOPDE, T.*
FROM TRUSTED_ZONE.GXFINDTA_TCLMOV T
WHERE T.MOVIDLT='240020096900042'
  AND T.MOVOPDE = 700605
  AND T.SERCODI IN ('VTAMIN', 'PAGFAC')
  AND T.MOVFCRE BETWEEN '20231221' AND '20240320';

--refresh materialized view facturacionbepsa.fpos_info_facturacion_mensual;
CALL facturacionbepsa.insertar_facturas_pos(
        'FAECA', '16410772', '001', '003', 'C-000',
        2024, 04, 'FACTALQPOS', 'PYG', 'Comercio', 'CREDITO-1D', 'Administrator', current_date);

SELECT F.FACVENTACOMPROBANTESET, F.CLIENTEID, F.SUCURSALID, F.FACVENTATOTALCOMPROBML, f.*
FROM asientos.facturacionbepsa.FACVENTA F
         WHERE F.FACVENTACLIRUC='80013080-4' AND F.TARGETFACTID='FactComercios'
         AND F.EJERCICIOID=2024 AND F.PERIODOID=01;

SELECT
    F.FACVENTACOMPROBANTESET, F.CLIENTEID, F.SUCURSALID, F.FACVENTATOTALCOMPROBML, f.*
FROM ASIENTOS.FACTURACIONBEPSA.FACVENTA F
WHERE F.FACVENTACLIRUC = '80030572-8'
  AND F.TARGETFACTID = 'FactComercios'
  AND F.PERIODOID = 03
  AND F.EJERCICIOID = 2024;

SELECT F.FACVENTACOMPROBANTESET, F.CLIENTEID, F.SUCURSALID, F.FACVENTATOTALCOMPROBML, f.*
FROM asientos.facturacionbepsa.FACVENTA F
         WHERE F.CLIENTEID=21772 AND F.SUCURSALID=18
         AND F.TARGETFACTID='FactComercios'
         AND F.EJERCICIOID=2024;

SELECT * FROM asientos.facturacionbepsa.PERIODOTARGETFACTCYCLE P WHERE P.EJERCICIOID=2024 AND P.PERIODOID=02;
DROP TABLE PUBLIC.SOLICITUDES;
CREATE TABLE PUBLIC.SOLICITUDES AS
SELECT * FROM asientos.facturacionbepsa.FACVENTA F WHERE F.FACVENTAFECHA='2024-04-19' AND clienteid IN (11728, 17689);

---query para factura manual
SELECT
    det.cliente AS "Cliente",
    det.sucursal AS "Sucursal",
    det.tipotarjeta AS "Producto", -- tabla.tipotarjeta
    ( SELECT sp.servprestdesc || '(' || sum(det.cantReg) || ' Transac.)' FROM facturacionbepsa.servprest sp WHERE sp.servprestid = det.tipotarjeta) AS "Descripcion",  -- (select sp.servprestdesc || ''('' || sum(tabla.cantReg) || '' Transac.)'' from facturacionbepsa.servprest sp where sp.servprestid = tabla.tipotarjeta) as facventadetservprestdesc,
    1 AS "Cantidad",-- 		1 as facVentaDetCant,
    sum(det.movimco + det.movivco) AS "PrecioUnitario" -- sum(tabla.movimco + tabla.movivco) as facVentaDetPrecioML,
FROM
    (
        SELECT
            tmov.movfpro AS fecha,
            tmov.movftrx,
            tmov.movfcre,
            tmov.movfecliq,
            tmov.movcodcli AS cliente,
            tmov.movcodsuc AS sucursal,
            tmov.movtpta,
            facturacionbepsa.fn_desc_servprest (tmov.movtpta) AS tipotarjeta,
            count(tmov.movfpro) AS cantreg,
            sum(tmov.movimpo) AS movimpo,
            sum(tmov.movimco) AS movimco,
            sum(tmov.movivco) AS movivco,
            sum(tmov.movrent) AS movrent,
            sum(tmov.movneto) AS movneto,
            sum(tmov.movivren) AS movivren
        FROM
            PUBLIC.facturacomple tmov
        GROUP BY
            tmov.movfpro,
            tmov.movftrx,
            tmov.movfcre,
            tmov.movfecliq,
            tmov.movcodcli,
            tmov.movcodsuc,
            tmov.movtpta
    ) det
GROUP BY
    det.cliente,
    det.sucursal,
    det.tipotarjeta|;


SELECT C.movrrnbep                                                                                                        Id_Transac,
       C.MOVFTRX                                                                                                          FECHA_TRANS,
       C.MOVFPRO                                                                                                          FECHA_PROCESO,
       C.MOVFCRE                                                                                                          FECHA_ACREDIT,
       C.MOVTPTA                                                                                                          TIPO_TARJ,
       SUM(C.MOVIMPO)                                                                                                     IMPORTE_TRANSAC,
       SUM(C.MOVIMCO)                                                                                                     IMPORTE_COMISION,
       SUM(C.MOVIVCO)                                                                                                     IVA_COMISION,
       SUM(c.MOVIVCO+C.MOVIMCO)                                                                                           TOTAL_COMISION,
       SUM(C.MOVRENT)                                                                                                     IMPORTE_RENTA,
       SUM(C.MOVIVREN)                                                                                                    IMPORTE_IVA,
       sum(C.MOVIMCO+C.MOVIVCO+C.MOVRENT+C.MOVIVREN)                                                                      TOTAL_DESCUENTO,
       SUM(C.MOVNETO)                                                                                                     IMPORTE_NETO,
        C.MOVCOMER
FROM FACTURACIONBEPSA.tclmov_tmp_comercios_202313_factcomercios C
--FROM FACTURACIONBEPSA.tclmov_tmp_comercios_202403_factcomercios C
--from FACTURACIONBEPSA.tclmov_tmp_operadoras_202403_factcomercios c
--FROM FACTURACIONBEPSA.tclmov_tmp_comercios_202403_factcomercios C
--FROM FACTURACIONBEPSA.tclmov_tmp_retail_202402_factcomercios C
--FROM TRUSTED_ZONE.GXFINDTA_TCLMOV_COMPLEMENTO C --COMPLEMENTO
--FROM FACTURACIONBEPSA.tclmov_tmp_comercios_202313_factcomercios C
--FROM FACTURACIONBEPSA.tclmov_tmp_comercios_202312_factcomercios c
--FROM FACTURACIONBEPSA.TCLMOV_TMP_COMERCIOS_202401_FACTCOMERCIOS C
--WHERE movopde=700605 --para operadoras
WHERE --C.MOVCODCLI IN (SELECT C.CLICLICOD FROM DATOS.GXFINDTA_TCMCLI C WHERE C.CLIRUC LIKE '%80030572%')
--AND C.MOVCODSUC=14 --NOT IN ('1', '8')
--C.MOVFTRX BETWEEN '20240131' AND '20240128' AND
MOVCODCLI = '11284'
--AND movcomer='5400327' --5400325  5400327
--AND C.MOVCODSUC=3
GROUP BY c.movrrnbep, C.MOVFTRX, C.MOVFPRO, C.MOVFCRE, C.MOVTPTA, C.MOVCOMER
ORDER BY C.MOVFTRX, C.MOVFPRO, C.MOVFCRE;
--anulacion masiva recibos
select
    facturacionbepsa.fn_anular_recibo(r.timbradoid,
    r.tipocomprobanteid,
    r.establecimientoid,
    r.puntoexpedicionid,
    r.timbradocomprobcajaid,
    r.ejercicioid,
    r.periodoid,
    r.targetfactid,
    'Administrator',
    r.reccobronumero,
    r.reccobronumero) as oo,
    r.timbradoid,
    r.tipocomprobanteid,
    r.establecimientoid,
    r.puntoexpedicionid,
    r.timbradocomprobcajaid,
    r.ejercicioid,
    r.periodoid,
    r.targetfactid,
    user,
    r.reccobronumero,
    r.reccobronumero
FROM
    facturacionbepsa.reccobro r
WHERE
    r.reccobroid IN (68485,68533,68535,68536,68538,68569,68590,68620,68629,68635,68321,68663,68734,68736,68738,68739,68741,68743,68771,68773,68775,68777,68781,68782,68785,68787,68328,68791,68793,68806,68848,68855,68857,68859,68891,68922,69054,68953,68955,68331,68334,68339,68957,68959,68961,68963,68985,68987,69003,69008,69021,69022,69063,69093,69095,69097,69099,69104,69121,69128,68347,68349,68356,68358,68359,68361,69135,69149,69151,69153,69155,69156,69163,69169,69187,69208,69210,69214,69226,69228,69229,69247,69249,69251,69253,69254,69296,69298,69300,69315,69321,69322,69324,69465,68372,68375,69477,69479,69490,69491,69492,69494,69499,69519,69522,69536,69538,69545,69584,69598,69609,69610,69611,69612,69614,69622,69629,68378,68379,68382,68385,68387,69632,69633,69634,69635,69643,69645,69646,69647,69648,69649,69656,69657,69658,69659,69660,69661,69671,69672,69676,69678,69501,69680,69682,69683,69684,69693,69694,69700,69704,69706,69707,69708,69709,68401,69712,69713,69717,69718,69719,69724,69739,69740,69744,69746,69747,69748,69749,69750,69751,69761,69762,69763,69764,69765,69767,69768,69769,69772,69773,69774,69775,69776,69778,69787,69789,69790,69791,69792,68408,68410,68413,68416,68418,68421,68423,68425,69800,69801,69802,69803,69804,69816,69817,69830,69831,69833,69842,69843,69844,69845,69846,69858,69859,69862,69863,69866,69867,69868,69869,69873,69878,69884,69885,68436,68441,68452,68455,68462);

------ validador para conti 34000 con valores negativos
--- diff_carrilla
select * from conciliacion.dif_carilla('1.1.1.2.1.01', '01-491340-00', :fecha, 'continental');
-- diff_extractos
select * from conciliacion.fn_ctl_conci_extr('01-491340-00','XXXXX34000' ,:fecha);
--- diff_asientos
with datos as ( select asiento_nro_conci nro, max(case when tipo_asineto_conf_des = '' then asiento_obs_k2b else tipo_asineto_conf_des end)  tipo_des,
max(tipo_asiento_conf) tipo, max(importe_k2b) k2b,
sum(case when asiento_fecha_k2b is null then (total_debe_conci * -1) else total_debe_conci end
+
case when asiento_fecha_k2b is null then ( total_haber_conci * -1) else total_haber_conci end) inf   -- select *
from conciliacion.fn_clt_conci_astos('01-491340-00',:fecha)  --order by asiento_nro_conci
group by asiento_nro_conci) --asiento_nro_k2b)
select tipo,tipo_des,nro,k2b, inf, k2b - inf as diff from datos;
--- detalle ctl asientos
select *  from conciliacion.fn_clt_conci_astos('01-491340-00',:fecha);
----------------------------
SELECT * FROM asientos.facturacionbepsa.FACVENTA F WHERE F.FACVENTACOMPROBANTESET='001-003-0045873';

SELECT * FROM asientos.facturacionbepsa.NCREDITO N WHERE N.NCREDITOCOMPROBANTESET='001-001-0001819';

select * from asientos.tclmov_asientos_trx where asiento_k2b_numero = '89300';

SELECT * from facturacionbepsa.fn_insert_reccobro();

SELECT * FROM asientos.facturacionbepsa.FACVENTA F WHERE F.FACVENTACOMPROBANTESET='001-003-0095538' AND F.TARGETFACTID='FACTALQPOS';
SELECT * FROM asientos.facturacionbepsa.NCREDITO N WHERE N.NCREDITOCOMPROBANTESET='001-001-0005135';

CREATE TABLE PUBLIC.SOLICITUDESs AS
    (SELECT * FROM asientos.facturacionbepsa.FACVENTA F
WHERE F.EJERCICIOID=2024 and F.PERIODOID=10 AND F.STATUSID='DTE_APROBADO'); --==16282
-----update pdf y xml nulos
UPDATE ASIENTOS.FACTURACIONBEPSA.FACVENTA
SET FACVENTASIRIUSPDFPATH = '/opt/fe/KuDE/' ||
                            SUBSTRING(FACVENTAFECHA::TEXT FROM 1 FOR 4) || '/' || -- Año (primeros 4 caracteres)
                            SUBSTRING(FACVENTAFECHA::TEXT FROM 6 FOR 2) || '/' || -- Mes (del sexto al séptimo carácter)
                            TO_CHAR(FACVENTAFECHA, 'YYYYMMDD') || '/FE/FE_' || -- Fecha completa en formato yyyymmdd
                            FACVENTACOMPROBANTESET || '.pdf',
    FACVENTASIRIUSXMLPATH= '/opt/fe/XML-Firmado/' ||
                           SUBSTRING(FACVENTAFECHA::TEXT FROM 1 FOR 4) || '/' || -- Año (primeros 4 caracteres)
                           SUBSTRING(FACVENTAFECHA::TEXT FROM 6 FOR 2) || '/' || -- Mes (del sexto al séptimo carácter)
                           TO_CHAR(FACVENTAFECHA, 'YYYYMMDD') || '/FE/FE_' || -- Día (del noveno al décimo carácter)
                           FACVENTACOMPROBANTESET || '.xml'
WHERE --STATUSID = 'DTE_APROBADO'
  --AND TARGETFACTID = 'FACTALQPOS'
    FACVENTAFECHA >= '2025-01-01'
  AND FACVENTASIRIUSPDFPATH IS NULL;

DROP TABLE
PUBLIC.SOLICITUDESs;

SELECT --*
    F.TARGETFACTID,
    F.TIPOCLIENTEID,
    F.STATUSID, count(F.FACVENTANUMERO),
F.FACVENTAFECHA
FROM FACTURACIONBEPSA.FACVENTA F
where f.EJERCICIOID=2024 and F.PERIODOID=10 AND F.STATUSID='DTE_APROBADO'
GROUP BY F.TARGETFACTID,
    F.TIPOCLIENTEID,
    F.FACVENTAFECHA,
    F.STATUSID;

SELECT * FROM asientos.facturacionbepsa.FACVENTA F WHERE F.FACVENTACOMPROBANTESET='001-003-0045675';
SELECT * FROM asientos.facturacionbepsa.FACVENTACUOTA F WHERE F.FACVENTAID='277142';

SELECT GT.MOVCOMER,
       GT.MOVCODCLI,
       GT.MOVCODSUC,
       CASE WHEN TA.TIPOIMPORTE = '1' THEN 'DEBE' WHEN TA.TIPOIMPORTE = '-1' THEN 'HABER' ELSE 'null' END AS TIPOIMPORTE,
       SUM(MOVIVREN)                                                                                         RETENSION_TOTAL,
       TA.ID_CTA_CONT_CABE,
       CCPC.TIPO_ASIENTO,
       TA.ASIENTO_K2B_NUMERO,
       TA.FECHA_MOV sum(importe_neto)g
FROM ASIENTOS.TCLMOV_ASIENTOS_TRX TA
    LEFT JOIN TRUSTED_ZONE.GXFINDTA_TCLMOV GT ON TA.MOVIDMOV = GT.MOVIDMOV
    INNER JOIN ASIENTOS.CUENTA_CONT_PROCESO_CABE CCPC ON CCPC.ID_CTA_CONT_CABE = TA.ID_CTA_CONT_CABE
WHERE TA.ID_CTA_CONT_CABE in (107, 123, 133, 114, 110)  AND TA.FECHA_MOV BETWEEN '20240731' AND '20240831'  AND TA.TIPOIMPORTE = '-1'  AND CUENTACONTABLE = '2.1.1.3.1.07' ;--IN ('2.1.1.3.1.08')--,'2.1.1.3.1.07')
GROUP BY GT.MOVCOMER, GT.MOVCODCLI, GT.MOVCODSUC, TA.ID_CTA_CONT_CABE, TA.TIPOIMPORTE, CCPC.TIPO_ASIENTO, TA.ASIENTO_K2B_NUMERO, TA.FECHA_MOV ;


SELECT * FROM asientos.asientos.CUENTA_CONT_PROCESO_CABE CCPC WHERE
ID_CTA_CONT_CABE in (107, 123, 133, 114, 110);


SELECT * FROM  ASIENTOS.TCLMOV_ASIENTOS_TRX TA WHERE TA.ASIENTO_K2B_NUMERO='121782' AND
TA.FECHA_MOV BETWEEN '20240830' AND '20240903'
AND CUENTACONTABLE IN ('2.1.1.3.1.08','2.1.1.3.1.07');

SELECT * FROM asientos.pr_gen_pos_clearing_pago_dinelco_continental_pyg_batch();

SELECT  * FROM asientos.asiento_diario_ws  A where A.NRO_ASIENTO_K2B='121782';

select *
from facturacionbepsa.parametros pa
where pa.parmid= 'debitoRetencion'
and pa.parmserial ='debitoDinelco';

SELECT * FROM asientos.asientos.EMAIL_USERS EU;

SELECT *
FROM ASIENTOS.FACTURACIONBEPSA.FACVENTA F
WHERE F.TARGETFACTID = 'FACTALQPOS'
  AND F.EJERCICIOID = 2024
  AND F.PERIODOID IN (08, 09, 10)
  AND F.FACVENTACLIRUC = '80014868-1';

SELECT * FROM
             asientos.facturacionbepsa.RECCOBRO R WHERE R.TARGETFACTID='FACTALQPOS' AND R.CLIENTEID=10879
AND R.PERIODOID IN (07,08,09,10);

SELECT * FROM asientos.facturacionbepsa.FACVENTA F where F.FACVENTACLIRUC='80068100-2' and F.EJERCICIOID=2024;


SELECT "f"."facventaid",
       "f"."facventacomprobanteset",
       "f"."facclienteid",
       "f"."facsucursalid",
       "f"."periodoid",
       "f"."ejercicioid",
       "f"."facventasiriuspdfpath",
        "n"."ncreditoid",
       COUNT(*) OVER () AS COUNTER
FROM "facturacionbepsa"."facventa" AS "f"
        LEFT JOIN "facturacionbepsa"."ncredito" AS "n" ON "n"."ncreditofventacomprobset" = "f"."facventacomprobanteset" AND "f"."facventaid" = "n"."ncreditofventaid"
WHERE "f"."targetfactid" = 'FACTALQPOS'
  AND "f"."statusid" = 'DTE_APROBADO'
  AND  F.FACCLIENTEID=10879--F.FACCLIENTEID || '-' || F.FACSUCURSALID IN ('10879-17')
  AND "f"."facventafecha" BETWEEN 'SAT JUN 01 2024 00:00:00' AND 'Thu Oct 31 2024 00:00:00'
ORDER BY "facventaid" ASC
LIMIT 10;


SELECT * FROM asientos.datos.GXFINDTA_TCMTIF GT WHERE GT.CLICLICOD=10879;
----recibos a generar
SELECT
        a.debretregid,a.debretregcanalid,a.debretregfechapeticion,f.facventafecha,a.debrettimbradoid,a.debrettipoclienteid,
        a.debretclienteid,a.debretsucursalid,a.debretcomprobset,a.debretmotivoid,a.debretmonedaid,a.debretcomprobimporte,
        a.debretnotas,a.debretcobroid,a.debretcobroloteid,a.debretcobroimporte,
    	TO_CHAR(a.debretcobrofechahora, 'YYYY-MM-DD HH:MI:SS')::timestamp AS debretcobrofechahora,a.debretregestado,
    	a.debretcomprobcuotaid,a.debretreccobroid,a.debretreccobrocomprob,a.debretreccobrofecha,a.debretprocsofechahora,
    	a.debretreccobrodetid,a.debretclienterazonsocial,a.debretsucursaldenominacion,a.debretentfinancieraid,
    	a.debretentfinancieradesc
    FROM
        (SELECT *
         FROM facturacionbepsa.debret d
         WHERE
             d.debretcobrofechahora >= asientos.f_get_diahabil_atras(current_date)
             AND d.debretregcanalid = p_canalid AND d.debretcobroimporte IS NOT NULL
             AND d.debretreccobroid IS NULL AND d.debretregestado IN ('CO', 'RP')) a
    INNER JOIN facturacionbepsa.facventa f ON f.timbradoid = a.debrettimbradoid
AND f.facventacomprobanteset = a.debretcomprobset;

---ERROR == existe un proceso en ejecución para este banco
select *
from facturacionbepsa.parametros pa
where pa.parmid ='debitoAutomaticoArchivo'
and pa.parmserial ='itau'; --actualizar parmvalue a no según el tipo de Banco
----------------------------------------------------------------------------
--para borrar facturas
DELETE
FROM FACTURACIONBEPSA.FACVENTADET VD
WHERE EXISTS (SELECT 1
              FROM FACTURACIONBEPSA.FACVENTA F
              WHERE F.FACVENTAFECHA = '2024-10-23'
                AND F.TARGETFACTID = 'FactComercios'
                AND F.STATUSID = 'preformulario'
                AND F.FACVENTAID = VD.FACVENTAID);
DELETE
FROM FACTURACIONBEPSA.FACVENTASTATUS EE
WHERE EXISTS (SELECT 1
              FROM FACTURACIONBEPSA.FACVENTA F
              WHERE F.FACVENTAFECHA = '2024-10-23'
                AND F.TARGETFACTID = 'FactComercios'
                AND F.STATUSID = 'preformulario'
                AND F.FACVENTAID = EE.FACVENTAID);
DELETE
FROM FACTURACIONBEPSA.FACVENTACUOTA CC
WHERE EXISTS (SELECT 1
              FROM FACTURACIONBEPSA.FACVENTA F
              WHERE F.FACVENTAFECHA = '2024-10-23'
                AND F.TARGETFACTID = 'FactComercios'
                AND F.STATUSID = 'preformulario'
                AND F.FACVENTAID = CC.FACVENTAID);
DELETE
FROM FACTURACIONBEPSA.FACVENTA F
WHERE F.FACVENTAFECHA = '2024-10-23'
  AND F.TARGETFACTID = 'FactComercios'
  AND F.STATUSID = 'preformulario';

DELETE FROM FACTURACIONBEPSA.FACVENTA_ERRORES FE;
------------------------------------------------------

SELECT --*
    F.TARGETFACTID,
    F.TIPOCLIENTEID,
    F.STATUSID, count(F.FACVENTANUMERO)
FROM FACTURACIONBEPSA.FACVENTA F
where F.TARGETFACTID = 'FactComercios'
AND F.TIPOCLIENTEID = 'Comercio'
AND F.FACVENTAFECHA = '2024-10-31'
GROUP BY F.TARGETFACTID,
    F.TIPOCLIENTEID,
    F.STATUSID;

DROP TABLE PUBLIC.SOLICITUDES;
SELECT * FROM PUBLIC.SOLICITUDES S; ---WHERE S.FACVENTACLIRUC IN ('80077406-0')--,'80030535-3')
CREATE TABLE PUBLIC.SOLICITUDES AS (
SELECT * FROM ASIENTOS.FACTURACIONBEPSA.FACVENTA F
WHERE F.TARGETFACTID = 'FactComercios' AND F.TIPOCLIENTEID = 'Comercio'
  AND F.STATUSID = 'DTE_APROBADO' AND F.PERIODOID = 12 AND F.FACVENTACLIRUC='80016742-2');

--UPDATE public.SOLICITUDES S SET FACVENTACLIEMAIL='lidia.valenzuela@biggie.com.py'
SELECT * FROM asientos.facturacionbepsa.PERIODOTARGETFACTCYCLE P WHERE P.PERIODOID=10 AND P.TARGETFACTID='FactComercios'
AND P.EJERCICIOID=2024;
SELECT * FROM asientos.facturacionbepsa.FACVENTA F
WHERE F.FACVENTAFECHA='2024-11-06' AND F.STATUSID='DE_ERROR';

SELECT * FROM asientos.facturacionbepsa.FACVENTASTATUS F WHERE F.FACVENTAID=811805;
SELECT * FROM asientos.facturacionbepsa.SUCURSAL C WHERE C.CLIENTEID=7172;
--target's
SELECT * from FACTURACIONBEPSA.PERIODOTARGETFACT T WHERE T.EJERCICIOID=2024 AND T.PERIODOID=10;

SELECT * FROM asientos.facturacionbepsa.FACVENTA F WHERE F.FACVENTACOMPROBANTESET='001-003-0045675';
SELECT * FROM asientos.facturacionbepsa.FACVENTACUOTA F WHERE F.FACVENTAID=277142
SELECT * FROM asientos.facturacionbepsa.RECCOBRO R WHERE R.EJERCICIOID=2024 AND R.PERIODOID=05;
SELECT * FROM asientos.facturacionbepsa.RECCOBRODET R;

select * from
facturacionbepsa.fn_get_reccobro_by_ejercicios_periodos_targets
('2024', '5', 'FACTALQPOS', '001', '500', null, null, null, null, null, '2024-05-01', '2024-05-31', null, null, null,null, null, null, null);

SELECT * FROM FACTURACIONBEPSA.FACVENTA F WHERE F.FACVENTACLIRUC='80019742-9' AND F.PERIODOID=10;
---gemera liq. comercios
SELECT * FROM facturacionbepsa.fn_get_facturas_a_generar();
-----CALCULO DE IMPORTES PARA FACTURAS
--RETAIL
SELECT
	tmov.movcodcli AS cliente, tmov.movcodsuc AS sucursal, tmov.movrazo, tmov.movruc,
	tmov.movidtpdoc, tmov.movdeno, tmov.movfpro AS fecha, tmov.movftrx AS movftrx, tmov.movfcre AS movfcre,
	tmov.movfecliq AS movfecliq, COUNT(tmov.movfpro) AS cantReg, SUM(tmov.movimpo) AS movimpo, SUM(tmov.movimco) AS movimco,
	SUM(tmov.movivco) AS movivco, SUM(tmov.movrent) AS movrent, SUM(tmov.movneto) AS movneto, SUM(tmov.movivren) AS movivren
		  FROM trusted_zone.gxfindta_tclmov tmov
			WHERE
			  tmov.movfcre BETWEEN '' AND ''
			    AND (tmov.sercodi = 'COMPRA'
			      OR (tmov.sercodi in ('DEBAUT', 'ECOM')
			      	  AND tmov.PRECODI in ( 'PREC', 'BTNP')
			      	  AND tmov.movcodis = 'WEB'
			      	  AND tmov.movruc != '80050172-1')
			      OR (tmov.sercodi = 'PUNTOS' AND tmov.PRECODI = 'CAPU'))
			   and trim(tmov.movruc) = '80016096-7'
			   AND (tmov.movivco + tmov.movimco) <> 0
			GROUP BY
				tmov.movcodcli,tmov.movcodsuc,tmov.movrazo,tmov.movruc,tmov.movidtpdoc,tmov.movdeno,tmov.movfpro,tmov.movftrx,
tmov.movfcre,tmov.movfecliq;
---COMERCIOS
SELECT
    tmov.movcodcli AS cliente, tmov.movcodsuc AS sucursal, tmov.movrazo, tmov.movruc,
    tmov.movidtpdoc, tmov.movdeno, tmov.movfpro AS fecha, tmov.movftrx AS movftrx, tmov.movfcre AS movfcre,
    tmov.movfecliq AS movfecliq, COUNT(tmov.movfpro) AS cantReg, SUM(tmov.movimpo) AS movimpo, SUM(tmov.movimco) AS movimco,
	SUM(tmov.movivco) AS movivco, SUM(tmov.movrent) AS movrent, SUM(tmov.movneto) AS movneto, SUM(tmov.movivren) AS movivren
		  FROM trusted_zone.gxfindta_tclmov tmov
			WHERE
			  tmov.movfcre BETWEEN '20240928' AND '20241031'
			    AND (tmov.sercodi = 'COMPRA'
			      OR (tmov.sercodi in ('DEBAUT', 'ECOM')
			      	  AND tmov.PRECODI in ( 'PREC', 'BTNP')
			      	  AND tmov.movcodis = 'WEB'
			      	  AND tmov.movruc != '80050172-1')
			      OR (tmov.sercodi = 'PUNTOS' AND tmov.PRECODI = 'CAPU'))
			   and trim(tmov.movruc) != '80016096-7'
			  and tmov.MOVCODCLI=11282   and tmov.MOVCODSUC=293
			   AND (tmov.movivco + tmov.movimco) <> 0
			GROUP BY
			    tmov.movcodcli, tmov.movcodsuc, tmov.movrazo, tmov.movruc, tmov.movidtpdoc, tmov.movdeno, tmov.movfpro, tmov.movftrx,
tmov.movfcre, tmov.movfecliq;

SELECT * FROM asientos.facturacionbepsa.FACVENTA F WHERE F.FACVENTACOMPROBANTESET IN ('001-002-0197284', '001-002-0197456');


-- borrar los movimientos de noviembre
WITH CABECERAS AS (SELECT ID
                   FROM CONCILIACION.EXTRACTO_CABECERA
                   WHERE FECHAINICIAL::DATE BETWEEN '2024-11-01' AND '2024-11-30')
SELECT *
FROM CONCILIACION.EXTRACTO_MOVIMIENTO --verificar antes de borrar
--DELETE FROM conciliacion.extracto_movimiento
WHERE IDCABECERA IN (SELECT ID FROM CABECERAS);
-- borrar las cabeceras de noviembre
WITH CABECERAS AS (SELECT ID
                   FROM CONCILIACION.EXTRACTO_CABECERA
                   WHERE FECHAINICIAL::DATE BETWEEN '2024-11-01' AND '2024-11-30')
SELECT *
FROM CONCILIACION.EXTRACTO_CABECERA --verificar antes de borrar
--DELETE FROM conciliacion.extracto_cabecera
WHERE ID IN (SELECT ID FROM CABECERAS);

----ver diferencias entre facturas y sus detalles
SELECT F.FACVENTACOMPROBANTESET FACTURA,
       F.SUCURSALID AS SUCURSAL,
       F.FACVENTATOTALCOMPROBML TOTAL_FACTURA,
       COALESCE(T."COMISION+IVA", 0) AS "COMISION+IVA",
       CASE
           WHEN F.FACVENTATOTALCOMPROBML != COALESCE(T."COMISION+IVA", 0) THEN 'POSITIVO'
           ELSE 'NEGATIVO' END          AS DIFERENCIA
FROM ASIENTOS.FACTURACIONBEPSA.FACVENTA F
         LEFT JOIN (SELECT MOVCODCLI, MOVCODSUC, SUM(MOVIMCO + MOVIVCO) AS "COMISION+IVA"
                    FROM FACTURACIONBEPSA.TCLMOV_TMP_COMERCIOS_202410_FACTCOMERCIOS
                    WHERE MOVCODCLI = 11282
                    GROUP BY MOVCODCLI, MOVCODSUC) T
                   ON F.CLIENTEID = T.MOVCODCLI AND F.SUCURSALID = T.MOVCODSUC
WHERE F.PERIODOID = 10
  AND F.EJERCICIOID = 2024 AND F.CLIENTEID = 11282
  AND F.TARGETFACTID='FactComercios' AND F.STATUSID = 'DTE_APROBADO'
order BY F.SUCURSALID ASC;
--agregar diferencia con tclmov
--tratar de quitar count por cantidad de trx entre tclmov y la vista
--Y DIFERENCIA ENTRE SERVICIOS Y PRESTACIONS EN IMPORTES O CANTIDAD
---------
SELECT
    F.SUCURSALID AS SUCURSAL,
    COALESCE(D.TRX_FACVENTADET, 0) AS TRX_FACVENTADET,
    COALESCE(T.TRX_COMERCIO, 0) AS TRX_COMERCIO,
    F.FACVENTATOTALCOMPROBML,
    COALESCE(T."COMISION+IVA", 0) AS "COMISION+IVA",
    CASE
        WHEN F.FACVENTATOTALCOMPROBML != COALESCE(T."COMISION+IVA", 0) THEN 'DIFERENCIA_MONTO'
        ELSE 'MONTO_IGUAL'
    END AS RESULTADO_MONTO,
    CASE
        WHEN COALESCE(D.TRX_FACVENTADET, 0) != COALESCE(T.TRX_COMERCIO, 0) THEN 'DIFERENCIA_TRX'
        ELSE 'TRX_IGUAL'
    END AS RESULTADO_TRX
FROM
    ASIENTOS.FACTURACIONBEPSA.FACVENTA F
LEFT JOIN (
    SELECT
        MOVCODCLI,
        MOVCODSUC,
        COUNT(*) AS TRX_COMERCIO,
        SUM(MOVIMCO + MOVIVCO) AS "COMISION+IVA"
    FROM
        FACTURACIONBEPSA.TCLMOV_TMP_COMERCIOS_202410_FACTCOMERCIOS
    WHERE
        MOVCODCLI = 11282
    GROUP BY
        MOVCODCLI, MOVCODSUC
) T
ON
    F.CLIENTEID = T.MOVCODCLI AND F.SUCURSALID = T.MOVCODSUC
LEFT JOIN (
    SELECT
        FACVENTAID,
        SUM(
            CAST(
                REGEXP_REPLACE(FACVENTADETSERVPRESTDESC, '.*\\((\\d+)\\).*', '\\1')
                AS INT
            )
        ) AS TRX_FACVENTADET
    FROM
        ASIENTOS.FACTURACIONBEPSA.FACVENTADET
    WHERE
        FACVENTADETSERVPRESTDESC ~ '\\(\\d+\\)' -- Filtrar solo filas con números entre paréntesis
    GROUP BY
        FACVENTAID
) D
ON
    F.FACVENTAID = D.FACVENTAID
WHERE
    F.PERIODOID = 10
    AND F.EJERCICIOID = 2024
    AND F.CLIENTEID = 11282
    AND F.TARGETFACTID = 'FactComercios'
    AND F.STATUSID = 'DTE_APROBADO'
GROUP BY
    F.SUCURSALID, D.TRX_FACVENTADET, T.TRX_COMERCIO, T."COMISION+IVA", F.FACVENTATOTALCOMPROBML;



SELECT * FROM asientos.facturacionbepsa.FACVENTADET F;
------
SELECT * FROM conciliacion.extracto_movimiento where idcabecera = 18064;
----ver tickets pendientes
select *
from conciliacion.ticket_solicitud ts
where to_char(ts.fechahorasolicitud ,'YYYY-MM-DD')='2024-12-07'
--and ts.estado ='Pendiente'
order by ts.id  desc;

--ver procedimientos
SELECT PP.*, PA.NSPNAME
FROM PG_CATALOG.PG_PROC PP JOIN PG_CATALOG.PG_NAMESPACE PA
              ON PP.PRONAMESPACE = PA."oid"
WHERE UPPER(PP.PROSRC) LIKE '%INSERT%FACTURACIONBEPSA.CLIENTE%';

select * FROM asientos.facturacionbepsa.FACVENTA F
         WHERE F.PERIODOID=09 AND F.CLIENTEID=10836 AND F.SUCURSALID=2;

SELECT * FROM sp_conc_conti_406_01


SELECT * FROM asientos.facturacionbepsa.FACVENTA F WHERE tipoclienteid='Funcionario'
and F.CLIENTEID=2749;
--F.FACVENTACLIRUC='4483116-1'


SELECT * FROM asientos.asientos.ASIENTO_DIARIO_WS ADW WHERE ADW.NRO_ASIENTO_K2B='147654';

SELECT * FROM asientos.facturacionbepsa.FACVENTA F WHERE F.FACVENTAFECHA='2024-12-31' AND F.STATUSID='DE_RECHAZADO';
SELECT * FROM asientos.facturacionbepsa.CLIENTE C WHERE C.CLIENTEID=27143;
SELECT * FROM asientos.facturacionbepsa.SUCURSAL S WHERE S.CLIENTEID=27143;


call marcas.sp_asiento_visa_aux_insert_fecha('2025-01-01');


CREATE TABLE PUBLIC.SOLICITUDES AS (
SELECT * FROM asientos.facturacionbepsa.FACVENTA F WHERE EJERCICIOID=2024
AND F.FACVENTACLIRUC='80022202-4' AND F.STATUSID='DTE_APROBADO');


