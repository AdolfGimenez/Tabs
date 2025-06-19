--en este caso no se cargó cocomer en tcmtif y no se cargo en las tablas posteriores
SELECT * FROM asientos.facturacionbepsa.FACVENTADET F WHERE F.FACVENTAID=1135352;

select T2.COCOMER FROM PUBLIC.GXFINDTA_TCMTIF2  T2 WHERE T2.CASCODIGO = 1;

UPDATE DATOS.GXFINDTA_TCMTIF GT SET COCOMER =
(select DISTINCT T2.COCOMER FROM PUBLIC.GXFINDTA_TCMTIF2  T2 WHERE T2.CASCODIGO = 1
AND T2.CLICLICOD = GT.CLICLICOD and T2.SUCSUCCOD=GT.SUCSUCCOD );

select gt.*
from datos.gxfindta_tcmtif gt join facturacionbepsa.sucursal su
on gt.cliclicod =su.clienteid  and gt.sucsuccod =su.sucursalid
where su.sucursalcomerciobepsa  is null
and su.tipoclienteid ='Comercio';

INSERT INTO facturacionbepsa.sucursal
		(tipoclienteid,
		clienteid,
		sucursalid,
		sucursalk2bid,
		sucursaldenominacion,
		sucursaldomicilio,
		sucdepartamentoid,
		succiudadid,
		sucbarrioid,
		sucursalgeolocation,
		sucursalemail,
		sucursalphone,
		zonacomid,
		rutacomid,
		sucursalcomerciobepsa,
		sucursalcanalcobro,
		sucentidadid,
		suctipocuentaid,
		sucursalcuentanro,
		sucursalcuentatit)
	SELECT distinct on (tipoclienteid, clienteid, sucursalid)
	    'Comercio' AS tipoclienteid,
	    tpos.cliclicod AS clienteid,
	    tpos.sucsuccod AS sucursalid,
	    NULL AS sucursalk2bid,
	    TRIM(tsuc.sucdencom) AS sucursaldenominacion,
	    COALESCE(TRIM(tsuc.sucdirecc), 'Sin Información') AS sucursaldomicilio,
	    '1' AS sucdepartamentoid,
	    '1' AS succiudadid,
	    '1' AS sucbarrioid,
	    tsuc.sucgeoloc AS sucursalgeolocation,
	    --COALESCE(TRIM(tsuc.succorreo), 'facturacion@bepsa.com.py') AS sucursalemail,
	    case
		    WHEN facturacionbepsa.fn_validar_email(trim(tsuc.succorreo)) IS NOT NULL THEN
		        CASE
		            WHEN facturacionbepsa.fn_validar_email(trim(tsuc.succorreo)) THEN trim(tsuc.succorreo)
		            ELSE 'facturacion@bepsa.com.py'
		        END
		    ELSE 'facturacion@bepsa.com.py'
		end AS sucursalemail,
	    COALESCE(REPLACE(REPLACE(TRIM(tsuc.suctelmo1), ' ', ''),'-',''), '') AS sucursalphone,
	    '00' AS zonacomid,
	    '00' AS rutacomid,
	    --COALESCE(info.cocomer, '0000000') AS sucursalcomerciobepsa,
		tpos.cocomer sucursalcomerciobepsa,
		CASE
            WHEN a.cotarje = '0'::numeric AND NOT (a.coentdeb IN ( SELECT c.enemiso
               FROM datos.gxbdbps_gentiaf c
              WHERE c.ennombr::text ~~ '%INACTIVO%'::text OR c.ennombr::text ~~ '%BAJA%'::text)) THEN NULL
            WHEN a.coentdeb = '001'::bpchar THEN 'DD'::text
            ELSE (( SELECT f.parmvalue
               		FROM facturacionbepsa.fn_get_parmvalue(a.coentdeb::character varying) f(parmvalue)))::text
        END AS sucursalcanalcobro,
	    COALESCE((SELECT max(gt.encentact) AS max
           FROM datos.gxtrjdta_tcoenc gt
          WHERE gt.encentant::text = iaf.enemiso::text), '0000') AS sucentidadid,
	    CASE
            WHEN a.adticta = '0'::numeric THEN '8'::text
            WHEN a.adticta = '1'::numeric THEN '1'::text
            ELSE '00'::text
        END AS suctipocuentaid,
	    COALESCE(a.coctadeb, '') AS sucursalcuentanro,
	    coalesce(TRIM(pp.dppnya), TRIM(tsuc.sucdencom)) AS sucursalcuentatit
	FROM (SELECT DISTINCT tpos.cliclicod, tpos.sucsuccod, tpos.cocomer as cocomer
	                FROM datos.gxfindta_tcmtif tpos
	                WHERE tpos.tiffecfac BETWEEN  vInicio and vFin) tpos
	    left join datos.gxfindta_tcmsuc tsuc on tsuc.cliclicod = tpos.cliclicod and tsuc.sucsuccod = tpos.sucsuccod
	    INNER JOIN DATOS.GXFINDTA_TCMTSO tso ON tsuc.tsocodigo = tso.tsocodigo
	    LEFT join datos.gxbdbps_comaeaf a  ON a.cocomer = tpos.cocomer::bpchar
	     LEFT JOIN datos.gxbdbps_gentiaf iaf ON a.coentdeb = iaf.enemiso::bpchar
	     LEFT JOIN datos.gxbdbps_tcodpp pp ON pp.cocomer::bpchar = a.cocomer
	ON CONFLICT (tipoclienteid, clienteid, sucursalid)
    DO UPDATE SET
        sucursaldenominacion = excluded.sucursaldenominacion,
        sucursaldomicilio = excluded.sucursaldomicilio,
        sucdepartamentoid = excluded.sucdepartamentoid,
        succiudadid = excluded.succiudadid,
        sucbarrioid = excluded.sucbarrioid,
        sucursalgeolocation = excluded.sucursalgeolocation,
        sucursalemail = excluded.sucursalemail,
        sucursalphone = excluded.sucursalphone,
        zonacomid = excluded.zonacomid,
        rutacomid = excluded.rutacomid,
        sucursalcomerciobepsa = excluded.sucursalcomerciobepsa,
        sucursalcanalcobro = excluded.sucursalcanalcobro,
        sucentidadid = excluded.sucentidadid,
        suctipocuentaid = excluded.suctipocuentaid,
        sucursalcuentanro = excluded.sucursalcuentanro,
        sucursalcuentatit = excluded.sucursalcuentatit;--DO nothing;