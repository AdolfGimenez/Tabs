-- COMPROBACION DE DOCUMENTOS CON ESTADO ACTIVO
SELECT *
FROM SIFEN.DOCUMENTOELECTRONICO D
WHERE D.FECMODIFTIPOESTADO::DATE >= '2024-01-03';  --Filtra los documentos procesados y firmados por fecha

SELECT D.IDDE, D.* FROM SIFEN.DOCUMENTOELECTRONICO D WHERE D.IDTIPOESTADODEULTIMO = 7;   --Cantidad de documentos en estado DE_ACTIVO
SELECT * FROM SIFEN.DOCUMENTOELECTRONICO D WHERE D.IDENTIFICADORDE = '0180011012900100200000012202307041543030465' ;

SELECT count(D.IDDE) FROM SIFEN.DOCUMENTOELECTRONICO D WHERE D.IDTIPOESTADODEULTIMO = 1 AND D.FECFIRMA::DATE >= '2024-01-06';       --El idtipoestadoultimo 7 es DE_ACTIVO, si es 1 es DTE_APROBADO y 3 es DE_RECHAZADO
SELECT * FROM SIFEN.DOCUMENTOELECTRONICO D WHERE D.IDDE IN (
473538
) ;

SELECT * FROM SIFEN.TIPOESTADODE T ;
SELECT * FROM SIFEN.LOTEDETALLEEVENTO L WHERE L.IDDE = 542647
order BY IDDE, FECHORAEVENTO;                                                       --Historico por el que pasa un DE. De aqu? se puede sacar el lote

SELECT * FROM SIFEN.DOCUMENTOELECTRONICO D WHERE D.IDDE='510160'--D.IDTIPOESTADODEULTIMO=7;--D.IDDE = 443395 ;
SELECT * FROM SIFEN.LOTEDETALLEEVENTORESPMENSAJE L WHERE L.MENSAJE ILIKE '%RUC del emisor%' ;
SELECT --DISTINCT(L.IDLOTE)
                   * FROM SIFEN.LOTEDETALLEEVENTO L WHERE L.IDDE IN (
486066,480804,479095,486227,479185,481087,486352,481381,481431,483783,486538,482218,482691,482784,484588,484888,
490076,487536,485802,487710,488441,489229,491864,492306,492575);
---CASO DE_ACTIVO- MUDANZA SILVANA --REPROCESO
SELECT * FROM SIFEN.DOCUMENTOELECTRONICO D WHERE D.IDTIPOESTADODEULTIMO=7;--D.IDDE = 443395 ;--SE CONSULTA ESTADO 7 QUE ES IGUAL A ACTIVO
--vemos si cumplen con los 5 procesos o mas de recepci?n, kude, notifiacion, envi?. si est? solo con 4 registros x cada idde no se fue.
SELECT /*DISTINCT(L.IDLOTE)*/ * FROM SIFEN.LOTEDETALLEEVENTO L
 WHERE L.IDDE IN (496005,510314,510658,510704,510913);--AND DATE(fechoraevento)>='2024-01-23';

SELECT /*DISTINCT(L.IDLOTE)*/ * FROM SIFEN.LOTEDETALLEEVENTO L
 WHERE L.IDDE IN (496005,510314,510658,510704,510913);
-----------------------
SELECT * FROM  SIFEN.LOTE L  WHERE L.IDLOTE='32867';
--WHERE DATE(fecalta)='2024-01-31'; --32749 NEW  IDE
--SE CREA NUEVO LOTE
INSERT INTO SIFEN.LOTE (IDEMPRESA, IDLOTE, IDTIPODOCUMENTOELECTRONICO, FECALTA, FECFIN, ACTIVO, OBS, IDTIPOLOTE, IDTIPOEVENTO, AUD_FECALTA, AUD_FECMODIF, AUD_IDUSUARIOALTA, AUD_IDUSUARIOMODIF)
VALUES (2::INTEGER, DEFAULT, 1::INTEGER, '2024-01-31 11:10:20.000000'::TIMESTAMP, NULL::TIMESTAMP, FALSE::DO_BOO_ACTIVO, 'Creado al momento de insertar el lotedetalleevento.'::TEXT, 1::INTEGER, 1::INTEGER, NULL::TIMESTAMP, NULL::TIMESTAMP, NULL::INTEGER, NULL::INTEGER);
------------
--se copia el nuevo lote a todos los idde para el env?o,
UPDATE SIFEN.LOTEDETALLEEVENTO SET idlote=32749
                               WHERE IDDE IN (515977,515984,515991);
---
--LUEGO SE CAMBIA A TRUE PARA EL POSTERIOR ENVIO | cada 3 minutos corre
-----
SELECT D.* FROM SIFEN.DOCUMENTOELECTRONICO D
JOIN SIFEN.LOTEDETALLEEVENTO L ON D.IDEMPRESA = L.IDEMPRESA AND D.IDDE = L.IDDE
WHERE IDTIPOESTADODEULTIMO = 3;-- L.IDLOTE = 29586 AND D.IDTIPOESTADODEULTIMO = 3 ;

--para ver cdc
SELECT D.* FROM SIFEN.DOCUMENTOELECTRONICO D WHERE D.IDTIPOESTADODEULTIMO=3 AND date(FECMODIFTIPOESTADO)='2024-02-29';
--cdc = identificadorde+dv
01800110129001003004214422024022914399192849
01800110129001003004214522024022915793174170
01800110129001003004214622024022918950502784
01800110129001003004215022024022913448178171
01800110129001003004214322024022919554394122
01800110129001003004214722024022915807380341
01800110129001003004214822024022915276912364
01800110129001003004215122024022917428862399
01800110129001003004215422024022912179672317

select * FROM sirius.sifen.LOTEDETALLEEVENTO L WHERE L.IDDE IN (543569, 543570, 543571, 543572, 543573, 543574, 543576, 543577, 543580);

INSERT INTO SIFEN.LOTEDETALLEEVENTO (IDEMPRESA, IDLOTE, IDDE, IDLOTEDETALLEEVENTO, IDTIPOEVENTO, IDTIPOESTADOEVENTO, IDTIPOESTADODE, FECHORAEVENTO, OBS, ERRSQLSTATE, ERRSTACKTRACE, AUD_FECALTA, AUD_FECMODIF, AUD_IDUSUARIOALTA, AUD_IDUSUARIOMODIF)
VALUES (2::INTEGER, 33846::BIGINT, 543580::BIGINT, DEFAULT, 4::INTEGER, 1::INTEGER, 1::INTEGER, '2024-03-06 08:49:34.736000'::TIMESTAMP, 'CAMBIADO POR DB'::TEXT, NULL::VARCHAR(5), NULL::TEXT, NULL::TIMESTAMP, NULL::TIMESTAMP, NULL::INTEGER, NULL::INTEGER);

SELECT *
FROM sirius.sifen.DOCUMENTOELECTRONICO D 42.299;

SELECT * FROM SIFEN.LOTEDETALLEEVENTORESPMENSAJE L WHERE L.IDDE IN (
456817,
456818,
456820,
456821,
456822,
456823,
456824
) ;          --Mensaje retornado por SIFEN (se usa para verificar el motivo de rechazo)

SELECT * FROM SIFEN.LOTEEVENTORESP L WHERE L.IDLOTE = 29586 ;

SELECT * FROM SIFEN.LOTEEVENTORESP L WHERE L.IDLOTE IN (29553,29516,29488,29578,29514,29775,29143,29522,29571,29586,29547,29545,29555,29501) ;--El estado del lote asociado a los DE

SELECT * FROM SIFEN.GENERALDERECEPTOR G WHERE G.IDDE = 6.614 ;                      --Datos que corresponden al receptor
SELECT * FROM SIFEN.DOCUMENTOELECTRONICO WHERE documentoelectronico.IDTIPOESTADODEULTIMO=7;
SELECT * FROM SIFEN.DOCUMENTOELECTRONICO D WHERE D.IDDE IN (515970,515971,515974,515972,515973,515975,515976,515979,515977,515978,515980,515981,515984,515982,515983,515985,515986,515989,515987,515988,515990,515991,515994,515992,515993,515995,515996,515999,515997,515998,516000,516001,516004,516002,516003,516005,516006,516009,516007,516008,516010,516011,516014,516012,516013,516015,524432,524433,524434,524435,524438,524436,524437,524439,524440,524443,524441,524442,524444,524445,524448,524446,524447,524449,524450,524453,524451,524452,524454,524455,524458,524456,524457,524460);
SELECT DISTINCT l.idlote FROM SIFEN.LOTEDETALLEEVENTO L WHERE L.IDDE IN (515970,515971,515974,515972,515973,515975,515976,515979,515977,515978,515980,515981,515984,515982,515983,515985,515986,515989,515987,515988,515990,515991,515994,515992,515993,515995,515996,515999,515997,515998,516000,516001,516004,516002,516003,516005,516006,516009,516007,516008,516010,516011,516014,516012,516013,516015,524432,524433,524434,524435,524438,524436,524437,524439,524440,524443,524441,524442,524444,524445,524448,524446,524447,524449,524450,524453,524451,524452,524454,524455,524458,524456,524457,524460);
SELECT * FROM SIFEN.LOTEEVENTO L WHERE L.IDLOTE IN(33196,33200,33197,33198,33199);
SELECT * FROM sirius.sifen.LOTEEVENTORESP L WHERE L.IDLOTE IN(33196,33200,33197,33198,33199);
SELECT T.* FROM SIFEN.TIMBRADO T
         INNER JOIN SIFEN.DOCUMENTOELECTRONICO D ON T.IDDE = D.IDDE                          --Se verifica por  nro de documento
WHERE T.NRODELDOCUMENTO IN (42299);, 34941, 34945, 35335, 35336, 35337, 35338, 35339, 35437, 35439, 35441, 35442, 35711, 36030, 36031, 36034, 36102, 36105, 36106, 36434, 36435, 36520, 36602, 36605, 36712, 36713, 36780, 36858, 36859, 36860, 37031, 37032, 34940, 36436, 34946, 35093, 35333, 35704, 35705, 36020, 36026, 36027, 36035, 34938, 34939, 34943, 34944, 36101, 34947, 34948, 35280, 35331, 35332, 35334, 35436, 35438, 35703, 35707, 35708, 35709, 35712, 36028, 36032, 36033, 36036, 36100, 36103, 36104, 36107, 36437, 36438, 36515, 36519, 36521, 36601, 36603, 36604, 36606, 36779, 36862, 36863, 36867, 36993, 36995, 36996, 36432, 36439, 36518, 36522, 36523, 36600, 36609, 36610, 36611, 36710, 36711, 36857, 36861, 36865, 36866, 36991, 36992, 36994, 36997, 37033, 35077, 35078, 35091, 35092, 35443, 35706, 35710, 35440, 36017, 36018, 36019, 36025, 36099, 36433, 35340, 36516, 36517, 36599, 36608, 36607, 36709, 36856, 36864, 36998, 36029, 34942);
SELECT * FROM sirius.sifen.LOTEDETALLEEVENTO L WHERE L.IDDE=543716;
SELECT * FROM sirius.sifen.DOCUMENTOELECTRONICO D WHERE idde IN (551079, 559595); --idde IN (543716, 543717, 543718, 543719, 543720, 543721, 543722, 543723, 543724, 543725, 543726, 543727, 543856, 543857, 543870, 543871, 543872, 544059, 544110, 544111, 544112, 544113, 544114, 544115, 544116, 544117, 544118, 544119, 544215, 544216, 544217, 544218, 544219, 544220, 544221, 544222, 544482, 544483, 544484, 544485, 544486, 544487, 544488, 544489, 544490, 544491, 544796, 544797, 544798, 544799, 544804, 544805, 544806, 544807, 544808, 544809, 544810, 544811, 544812, 544813, 544814, 544815, 544878, 544879, 544880, 544881, 544882, 544883, 544884, 544885, 544886, 545211, 545212, 545213, 545214, 545215, 545216, 545217, 545218, 545294, 545295, 545296, 545297, 545298, 545299, 545300, 545301, 545302, 545378, 545379, 545380, 545381, 545382, 545383, 545384, 545385, 545386, 545387, 545388, 545389, 545390, 545488, 545489, 545490, 545491, 545492, 545558, 545559, 545635, 545636, 545637, 545638, 545639, 545640, 545641, 545642, 545643, 545644, 545645, 545646, 545770, 545771, 545772, 545773, 545774, 545775, 545776, 545777, 545810, 545811, 545812);

SELECT *  FROM sifen.fn_cp_lote_proceso_linea('SECDO', 'PROC') ;
SELECT * FROM SIFEN.GENERALDERECEPTOR G WHERE G.IDDE='478996';

--Esto nos retorna SIFEN, los documentos que figuran en este select a?n se encuentra en procesamiento. Como les dije ayer, esto depende de la SET
--Dale NO hay problemas Sil muchas gracias

--Pero tambi?n tenes documentos encolados que no se fueron a la SET. Recomiento esperar, que estos que a?n se estan procesando retorne todo
--Y as? identificar a los que se quedaron encolados
----dale dale est? bien estamos entonces.! Respondeme el correo porfa para la evidencia

--Okis, me desconecto. Quedo atenta, chau
/*

SELECT D.* FROM SIFEN.DOCUMENTOELECTRONICO D
JOIN SIFEN.LOTEDETALLEEVENTO L ON D.IDEMPRESA = L.IDEMPRESA AND D.IDDE = L.IDDE
WHERE L.IDLOTE = 29586 AND D.IDTIPOESTADODEULTIMO = 7 ;
*/
/* <?xml version="1.0" encoding="UTF-8"?><env:Envelope xmlns:env="http://www.w3.org/2003/05/soap-envelope"><env:Header/><env:Body><ns2:rResEnviConsLoteDe xmlns:ns2="http://ekuatia.set.gov.py/sifen/xsd"><ns2:dFecProc>2024-01-04T10:16:01-03:00</ns2:dFecProc><ns2:dCodResLot>0361</ns2:dCodResLot><ns2:dMsgResLot>Lote {115491378516530549} en procesamiento</ns2:dMsgResLot></ns2:rResEnviConsLoteDe></env:Body></env:Envelope>*/
--Usuarios
SELECT *
FROM BASE.USUARIO U;

--{"codEmpresa":"BEPSA","codSucursal":"001","codCaja":"003","codTipoDocumentoElectronico":"FAECA","nroTimbrado":16410772,"nroDocumento":743}};

SELECT * FROM sirius.SIFEN.TIMBRADO T WHERE T.NRODELDOCUMENTO= '743';

select * FROM sirius.sifen.EMPRESASUCURSALCAJA E WHERE E.IDCAJA = 13;


--SIRIUS
select spv.idempresa, spv.idsisparam, sp."key", spv.value from base.sis_param_value spv
join base.sis_param sp on sp.idsisparam = spv.idsisparam
where idempresa = 2;

--TRIGER PARA CAMBIAR NOMBRE DE FANTASIA, DISBLED PARA HABILITAR PARA CAMBIAR Y LUEGO ENABLED
ALTER TABLE sifen.empresa DISABLE TRIGGER tiu_sifen_valid_empresa;

select * from sifen.empresatimbrado e ;
--tipo de documento:
--1==factura
--5==N credito
SELECT * FROM SIFEN.EMPRESASUCURSALCAJA E; -- SE CREA UNA CAJA NUEVA
INSERT INTO SIFEN.EMPRESASUCURSALCAJA (IDEMPRESA, IDSUCURSAL, IDCAJA, DESCRIPCION, CODIGO, AUD_FECALTA, AUD_FECMODIF, AUD_IDUSUARIOALTA, AUD_IDUSUARIOMODIF)
VALUES (2::INTEGER, 1::INTEGER, 2::INTEGER, 'CAJA 2'::VARCHAR, 'CAJA2'::VARCHAR(5), NULL::TIMESTAMP, NULL::TIMESTAMP, NULL::INTEGER, NULL::INTEGER);

SELECT * FROM SIFEN.EMPRESATIMBRADO E; -- PARA FACTUARA ELECTRONICA
UPDATE SIFEN.EMPRESATIMBRADO
SET PUNTOEXPEDICION = 2::NUMERIC(3)
WHERE IDEMPRESA = 2::INTEGER
  AND IDSUCURSAL = 1::INTEGER
  AND IDCAJA = 1::INTEGER
  AND IDTIPODOCUMENTOELECTRONICO = 1::INTEGER
  AND IDEMPRESATIMBRADO = 1::INTEGER;
--se agrega una linea nueva
INSERT INTO SIFEN.EMPRESATIMBRADO (IDEMPRESA, IDSUCURSAL, IDCAJA, IDTIPODOCUMENTOELECTRONICO, IDEMPRESATIMBRADO, NUMEROTIMBRADO, ESTABLECIMIENTO, MASCARAESTABLECIMIENTO, PUNTOEXPEDICION, MASCARAPUNTOEXPEDICION, MASCARANROFACTURA, MASCARASEPARADOR, INIVIGENCIA, FINVIGENCIA, ACTIVO, AUD_FECALTA, AUD_FECMODIF, AUD_IDUSUARIOALTA, AUD_IDUSUARIOMODIF)
VALUES (2::INTEGER, 1::INTEGER, 2::INTEGER, 1::INTEGER, 1::INTEGER, 12560254::NUMERIC(8), 1::NUMERIC(3), '##0'::VARCHAR(10), 3::NUMERIC(3), '##0'::VARCHAR(10), '######0'::VARCHAR(20), '-'::VARCHAR(1), '2022-12-22'::DATE, NULL::DATE, TRUE::DO_BOO_ACTIVO, NULL::TIMESTAMP, NULL::TIMESTAMP, NULL::INTEGER, NULL::INTEGER);
--timbrado
UPDATE SIFEN.EMPRESATIMBRADO
SET NUMEROTIMBRADO = 16410772::NUMERIC(8)
WHERE IDEMPRESA = 2::INTEGER
  AND IDSUCURSAL = 1::INTEGER
  AND IDCAJA = 1::INTEGER
  AND IDTIPODOCUMENTOELECTRONICO = 2::INTEGER
  AND IDEMPRESATIMBRADO = 2::INTEGER;
--vigencia
UPDATE SIFEN.EMPRESATIMBRADO
SET INIVIGENCIA = '2023-05-17'::DATE
WHERE IDEMPRESA = 2::INTEGER
  AND IDSUCURSAL = 1::INTEGER
  AND IDCAJA = 1::INTEGER
  AND IDTIPODOCUMENTOELECTRONICO = 7::INTEGER
  AND IDEMPRESATIMBRADO = 4::INTEGER;
select * from sifen.tipoactividadeconomica t   ;
select * from sifen.empresatipoactividadeconomica e;
select * from sifen.documentoelectronico d ; --PARA IDDTO 3201069
SELECT * FROM INTEGRACION.DTO D WHERE IDDTO='3201069';
select * from base.usuario u;
UPDATE BASE.USUARIO
SET CORREO = 'producciontic@bepsa.com.py'::VARCHAR(100)
WHERE IDUSUARIO = 5638::INTEGER;
-----------------------------------------------------------------------------
SELECT * FROM BASE.USUARIO U;

/*para vaciar la DB siempre en el esquema SIFEN
delete from sifen.autofacturaelectronica where idempresa >0 and idde >0;
delete from sifen.pagocheque ;
delete from sifen.condicionoperacionpagocontado where idempresa >0 and idde >0;
delete from sifen.condicionoperacionpagocreditocuota where idempresa >0 and idde >0;
delete from sifen.condicionoperacionpagocredito where idempresa >0 and idde >0;
delete from sifen.condicionoperacion where idempresa >0 and idde >0;
delete from sifen.documentoasociado where idempresa >0 and idde >0;
delete from sifen.documentoelectronicofueradefirma  where idempresa >0 and idde >0;
delete from sifen.itemoperaciondescuento  where idempresa >0 and idde >0;
delete from sifen.itemoperacionprecio  where idempresa >0 and idde >0;
delete from sifen.itemoperacioniva  where idempresa >0 and idde >0;
delete from sifen.itemoperacionrastreomercaderia ;
delete from sifen.itemoperacion  where idempresa >0 and idde >0;
delete from sifen.complementocomercialgeneral ;
delete from sifen.complementocomercialseguropoliza ;
delete from sifen.complementocomercialseguro ;
delete from sifen.especificodecomprapublica ;
delete from sifen.complementocomercial ;
delete from sifen.especificodecampo  where idempresa >0 and idde >0;
delete from sifen.notacredebelectronica  where idempresa >0 and idde >0;
delete from sifen.transportemercaderialocalentrega  where idempresa >0 and idde >0;
delete from sifen.transportemercaderialocalsalida  where idempresa >0 and idde >0;
delete from sifen.transportemercaderiatransportista  where idempresa >0 and idde >0;
delete from sifen.transportemercaderiatransportista  where idempresa >0 and idde >0;
delete from sifen.transportemercaderiavehiculotraslado  where idempresa >0 and idde >0;
delete from sifen.transportemercaderia  where idempresa >0 and idde >0;
delete from sifen.notaremisionelectronica  where idempresa >0 and idde >0;
delete from sifen.especificode  where idempresa >0 and idde >0;
delete from sifen.generaldeemisor  where idempresa >0 and idde >0;
delete from sifen.generaldereceptor  where idempresa >0 and idde >0;
delete from sifen.operacioncomercial  where idempresa >0 and idde >0;
delete from sifen.generalde  where idempresa >0 and idde >0;
delete from sifen.loteeventoresp  where idempresa >0 and idlote  >0;
delete from sifen.lotedetalleeventorespmensaje  where idempresa >0 and idde >0 and idlote  >0;
delete from sifen.lotedetalleeventoresp  where idempresa >0 and idde >0 and idlote  >0;
delete from sifen.lotedetalleevento  where idempresa >0 and idde >0 and idlote  >0;
delete from sifen.operacionde  where idempresa >0 and idde >0 ;
delete from sifen.timbrado  where idempresa >0 and idde >0 ;
delete from sifen.documentoelectronicototal  where idempresa >0 and idde >0 ;
delete from sifen.documentoelectronicoevento  where idempresa >0 and idde >0 ;
delete from sifen.documentoelectronico  where idempresa>0 and idde >0;
delete from integracion.dto ;
delete from sifen.loteevento ;
delete from sifen.lote;
delete from sifen.tablaerrores; */
SELECT * FROM SIFEN.LOTE L;
CREATE OR REPLACE FUNCTION integracion.fn_ife_lista_estadode_por_dto(piddto bigint, ptipointerface character varying)
 RETURNS TABLE(idempresasirius integer, iddesirius bigint, cdc character varying, dv_cdc smallint, cod_tipo_estado_de character varying, fec_act_tipoestado_de timestamp without time zone, fec_emision timestamp without time zone, cod_tipo_documento_erp character varying, cod_empresa character varying, cod_sucursal character varying, cod_caja character varying, nro_timbrado numeric, serie_timbrado character varying, nro_documento numeric, nro_documento_fiscal character varying, mensaje character varying)
 LANGUAGE plpgsql
AS $function$
DECLARE

BEGIN
	-- Tabla temporal p/cargar lista a verificar
    CREATE TEMPORARY TABLE __checkDE (
    	idsequence SERIAL,
	  	iddto BIGINT,
		idempresasirius INTEGER,
		iddesirius BIGINT,
		cdc VARCHAR,
		dv_cdc INTEGER,
        codempresa VARCHAR,
		codsucursal VARCHAR,
		codcaja VARCHAR,
		codtipodocumentoelectronico_erp VARCHAR,
		serie VARCHAR,
		nrotimbrado BIGINT,
		nrodocumento BIGINT)
    ON COMMIT DROP;

	-- Json carga en la tabla.
	INSERT INTO __checkDE(iddto, idempresasirius, iddesirius,
						  cdc, dv_cdc, codempresa, codsucursal, codcaja,
						  codtipodocumentoelectronico_erp, serie,
						  nrotimbrado, nrodocumento)
	SELECT q.iddto,
		   q.idempresasirius,
		   q.iddesirius,
		   q.cdc,
           q.dv_cdc,
		   q.codempresa,
		   q.codsucursal,
		   q.codcaja,
		   q.codtipodocumentoelectronico_erp,
		   q.serie,
		   q.nrotimbrado,
		   q.nrodocumento
      FROM integracion.fn_j_00_obtener_lista_svde(pIdDto, pTipoInterface) q
    ORDER BY 2, 3, 4, 5, 6, 7, 8, 9, 10, 11;

    -- Cada DE a verificar debe enviar un solo filtro de Clave, es decir
    -- Se puede buscar solo por Clave-Interna o solo por Clave-Sifen.
    IF EXISTS(SELECT *
    			FROM __checkDE chk
		 	  WHERE ((chk.idempresasirius IS NOT NULL AND (chk.cdc IS NOT NULL OR chk.nrotimbrado IS NOT NULL))
                      OR
                     (chk.cdc IS NOT NULL AND (chk.idempresasirius IS NOT NULL OR chk.nrotimbrado IS NOT NULL))
                      OR
                     (chk.nrotimbrado IS NOT NULL AND (chk.cdc IS NOT NULL OR chk.idempresasirius IS NOT NULL))
                    )) THEN
		SELECT base.fn_errorsifen_launcher(NULL::TEXT, -- la funci?n coloca SQLState "Error de Primer Nivel"
										   'Solo debe enviar informaci?n de DE por una de las claves (p/la b?squeda) que son: Interna, Sifen, Timbrado; no debe incluir varios.'::VARCHAR,
										   NULL::VARCHAR);
	END IF;


	RETURN QUERY
    	-- Filtro por Clave-Interna
        SELECT COALESCE(de.idempresa, chk.idempresasirius) AS idempresasirius,
        	   COALESCE(de.idde, chk.iddesirius) AS iddesirius,
        	   de.identificadorde AS cdc,
        	   de.dv AS dv_cdc,
        	   tede.codigo AS cod_tipo_estado_de,
               de.fecmodiftipoestado AS fec_act_tipoestado_de,
               gde.fechoraemisionde AS fec_emision,
               tde.codigo AS cod_tipo_documento_erp,
               em.codigo AS cod_empresa,
               emsu.codigo AS cod_sucursal,
               emsuca.codigo AS cod_caja,
			   etim.numerotimbrado::NUMERIC AS nro_timbrado,
    	   	   tim.serietimbrado AS serie_timbrado,
               tim.nrodeldocumento AS nro_documento,
           	   (LPAD(etim.establecimiento::TEXT, LENGTH(etim.mascaraestablecimiento), '0') ||
           			etim.mascaraseparador ||
               		LPAD(etim.puntoexpedicion::TEXT, LENGTH(etim.mascarapuntoexpedicion), '0') ||
            		etim.mascaraseparador ||
           			LPAD(tim.nrodeldocumento::TEXT, LENGTH(etim.mascaranrofactura), '0')
               )::VARCHAR AS nro_documento_fiscal,
               lresp.mensaje as mensaje
          FROM __checkDE chk
          	   INNER JOIN sifen.documentoelectronico de ON chk.idempresasirius = de.idempresa
													   AND chk.iddesirius = de.idde
          	   INNER JOIN sifen.generalde gde ON de.idempresa = gde.idempresa
               								 AND de.idde = gde.idde
			   INNER JOIN sifen.timbrado tim ON de.idempresa = tim.idempresa
               							    AND de.idde = tim.idde
			   INNER JOIN sifen.empresatimbrado etim ON tim.idempresa = etim.idempresa
               									    AND tim.idsucursal = etim.idsucursal
                                                    AND tim.idcaja = etim.idcaja
                                                    AND tim.idtipodocumentoelectronico = etim.idtipodocumentoelectronico
                                                    AND tim.idempresatimbrado = etim.idempresatimbrado
               INNER JOIN base.empresa em ON etim.idempresa = em.idempresa
               INNER JOIN sifen.empresasucursal emsu ON etim.idempresa = emsu.idempresa
               									    AND etim.idsucursal = emsu.idsucursal
               INNER JOIN sifen.empresasucursalcaja emsuca ON etim.idempresa = emsuca.idempresa
               											  AND etim.idsucursal = emsuca.idsucursal
                                                          AND etim.idcaja = emsuca.idcaja
			   INNER JOIN sifen.tipodocumentoelectronico tde ON tim.idempresa = tde.idempresa
           												    AND tim.idtipodocumentoelectronico = tde.idtipodocumentoelectronico
			   INNER JOIN sifen.tipoestadode tede ON de.idtipoestadodeultimo = tede.idtipoestadode
			   inner join sifen.lotedetalleevento l on de.idempresa = l.idempresa
			   					    and de.idde = l.idde
                                                           and de.idtipoevento = l.idtipoevento
			   left join sifen.lotedetalleeventorespmensaje lresp on l.idempresa = lresp.idempresa
			   											    	 and l.idde = lresp.idde
			   											    	 and l.idlote = lresp.idlote
		 WHERE -- B?squeda por Clave-Interna
         	   chk.idempresasirius IS NOT NULL
           AND chk.iddesirius IS NOT NULL

           	   -- Busqueda por Clave-Sifen
           AND chk.cdc IS NULL
           AND chk.dv_cdc IS NULL

           	   -- Busqueda por Clave-Timbrado
           AND chk.codempresa IS NULL
           AND chk.nrotimbrado IS NULL

         	   -- SDEDO = DE Anulado (Anulado en Sirius, jam?s se envi? a Sifen)
           AND tede.codigo IS NOT NULL

		UNION ALL

        -- Filtro por Clave-Sifen
	    SELECT de.idempresa AS idempresasirius,
        	   de.idde AS iddesirius,
        	   de.identificadorde AS cdc,
        	   de.dv AS dv_cdc,
        	   COALESCE(tede.codigo, '') AS cod_tipo_estado_de,
               de.fecmodiftipoestado AS fec_act_tipoestado_de,
               gde.fechoraemisionde AS fec_emision,
               tde.codigo AS cod_tipo_documento_erp,
               em.codigo AS cod_empresa,
               emsu.codigo AS cod_sucursal,
               emsuca.codigo AS cod_caja,
			   etim.numerotimbrado AS nro_timbrado,
    	   	   tim.serietimbrado AS serie_timbrado,
               tim.nrodeldocumento AS nro_documento,
           	   (LPAD(etim.establecimiento::TEXT, LENGTH(etim.mascaraestablecimiento), '0') ||
           			etim.mascaraseparador ||
               		LPAD(etim.puntoexpedicion::TEXT, LENGTH(etim.mascarapuntoexpedicion), '0') ||
            		etim.mascaraseparador ||
           			LPAD(tim.nrodeldocumento::TEXT, LENGTH(etim.mascaranrofactura), '0')
               )::VARCHAR AS nro_documento_fiscal,
               lresp.mensaje as mensaje
          FROM __checkDE chk
          	   INNER JOIN sifen.documentoelectronico de ON de.identificadorde = chk.cdc
               						  				   AND de.dv = chk.dv_cdc
          	   INNER JOIN sifen.generalde gde ON de.idempresa = gde.idempresa
               								 AND de.idde = gde.idde
			   INNER JOIN sifen.timbrado tim ON de.idempresa = tim.idempresa
               							    AND de.idde = tim.idde
			   INNER JOIN sifen.empresatimbrado etim ON tim.idempresa = etim.idempresa
               									    AND tim.idsucursal = etim.idsucursal
                                                    AND tim.idcaja = etim.idcaja
                                                    AND tim.idtipodocumentoelectronico = etim.idtipodocumentoelectronico
                                                    AND tim.idempresatimbrado = etim.idempresatimbrado
               INNER JOIN base.empresa em ON etim.idempresa = em.idempresa
               INNER JOIN sifen.empresasucursal emsu ON etim.idempresa = emsu.idempresa
               									    AND etim.idsucursal = emsu.idsucursal
               INNER JOIN sifen.empresasucursalcaja emsuca ON etim.idempresa = emsuca.idempresa
               											  AND etim.idsucursal = emsuca.idsucursal
                                                          AND etim.idcaja = emsuca.idcaja
			   INNER JOIN sifen.tipodocumentoelectronico tde ON tim.idempresa = tde.idempresa
           												    AND tim.idtipodocumentoelectronico = tde.idtipodocumentoelectronico
			   INNER JOIN sifen.tipoestadode tede ON de.idtipoestadodeultimo = tede.idtipoestadode
			   inner join sifen.lotedetalleevento l on de.idempresa = l.idempresa
			   					     and de.idde = l.idde
                                                             and de.idtipoevento = l.idtipoevento
			   left join sifen.lotedetalleeventorespmensaje lresp on l.idempresa = lresp.idempresa
			   							    and l.idde = lresp.idde
			   							    and l.idlote = lresp.idlote
		 WHERE -- B?squeda por Clave-Interna
         	   chk.idempresasirius IS NULL
           AND chk.iddesirius IS NULL

           	   -- Busqueda por Clave-Sifen
           AND chk.cdc IS NOT NULL
           AND chk.dv_cdc IS NOT NULL

           	   -- Busqueda por Clave-Timbrado
           AND chk.codempresa IS NULL
           AND chk.nrotimbrado IS NULL

         	   -- SDEDO = DE Anulado (Anulado en Sirius, jam?s se envi? a Sifen)
           AND tede.codigo IS NOT NULL

		UNION ALL

        -- Filtro por Timbrado
        SELECT de.idempresa AS idempresasirius,
        	   de.idde AS iddesirius,
        	   de.identificadorde AS cdc,
        	   de.dv AS dv_cdc,
        	   COALESCE(tede.codigo, '') AS cod_tipo_estado_de,
               de.fecmodiftipoestado AS fec_act_tipoestado_de,
               gde.fechoraemisionde AS fec_emision,
               q.codtipodocumento AS cod_tipo_documento_erp,
               q.codempresa AS cod_empresa,
               q.codsucursal AS cod_sucursal,
               q.codcaja AS cod_caja,
			   etim.numerotimbrado AS nro_timbrado,
    	   	   tim.serietimbrado AS serie_timbrado,
        	   tim.nrodeldocumento AS nro_documento,
           	   COALESCE(
               	(LPAD(etim.establecimiento::TEXT, LENGTH(etim.mascaraestablecimiento), '0') ||
           	   	 	etim.mascaraseparador ||
               		LPAD(etim.puntoexpedicion::TEXT, LENGTH(etim.mascarapuntoexpedicion), '0') ||
               		etim.mascaraseparador ||
           	   		LPAD(tim.nrodeldocumento::TEXT, LENGTH(etim.mascaranrofactura), '0')
                ), tim.nrodeldocumento::VARCHAR)::VARCHAR AS nro_documento_fiscal,
                lresp.mensaje as mensaje
	      FROM sifen.documentoelectronico de
			   INNER JOIN sifen.generalde gde ON de.idempresa = gde.idempresa
           								 	 AND de.idde = gde.idde
               INNER JOIN sifen.timbrado tim ON de.idempresa = tim.idempresa
                						    AND de.idde = tim.idde
               INNER JOIN sifen.tipoestadode tede ON de.idtipoestadodeultimo = tede.idtipoestadode
			   INNER JOIN sifen.empresatimbrado etim ON etim.idempresa = tim.idempresa
												    AND etim.idsucursal = tim.idsucursal
                                           		    AND etim.idcaja = tim.idcaja
                                           		    AND etim.idtipodocumentoelectronico = tim.idtipodocumentoelectronico
												    AND etim.idempresatimbrado = tim.idempresatimbrado
			   INNER JOIN (SELECT em.idempresa,
               					  em.codigo AS codempresa,
								  emsu.idsucursal,
                                  emsu.codigo AS codsucursal,
								  emsuca.idcaja,
                                  emsuca.codigo as codcaja,
								  tde.idtipodocumentoelectronico,
                                  tde.codigo AS codtipodocumento,
                                  chk.nrotimbrado,
								  chk.serie,
								  chk.nrodocumento
							 FROM __checkDE chk
								  INNER JOIN base.empresa em ON chk.codempresa = em.codigo
								  INNER JOIN sifen.empresasucursal emsu ON em.idempresa = emsu.idempresa
																	   AND chk.codsucursal = emsu.codigo
								  INNER JOIN sifen.empresasucursalcaja emsuca ON em.idempresa = emsuca.idempresa
																		     AND emsu.idsucursal = emsuca.idsucursal
																		     AND chk.codcaja = emsuca.codigo
								  INNER JOIN sifen.tipodocumentoelectronico tde ON em.idempresa = tde.idempresa
																			   AND chk.codtipodocumentoelectronico_erp = tde.codigo
				 		    WHERE -- B?squeda por Clave-Interna
								  chk.idempresasirius IS NULL
							  AND chk.iddesirius IS NULL

								  -- Busqueda por Clave-Sifen
							  AND chk.cdc IS NULL
							  AND chk.dv_cdc IS NULL

								  -- Busqueda por Clave-Timbrado
							  AND chk.codempresa IS NOT NULL
							  AND chk.nrotimbrado IS NOT NULL) q ON etim.idempresa = q.idempresa
															    AND etim.idsucursal = q.idsucursal
															    AND etim.idcaja = q.idcaja
															    AND etim.idtipodocumentoelectronico = q.idtipodocumentoelectronico
		                       inner join sifen.lotedetalleevento l on de.idempresa = l.idempresa
			   							   and de.idde = l.idde
                                                                         and de.idtipoevento = l.idtipoevento
			   left join sifen.lotedetalleeventorespmensaje lresp on l.idempresa = lresp.idempresa
			   											    	 and l.idde = lresp.idde
			   											    	 and l.idlote = lresp.idlote
		 WHERE etim.numerotimbrado = q.nrotimbrado
           AND ((tim.serietimbrado IS NULL AND q.serie IS NULL)
                 OR
                (tim.serietimbrado = q.serie))
           AND tim.nrodeldocumento = q.nrodocumento
           AND etim.numerotimbrado = q.nrotimbrado
           and tim.idde = (select max (idde) from sifen.timbrado where
                    ((serietimbrado IS NULL AND q.serie IS NULL) OR (serietimbrado = q.serie))
                    AND nrodeldocumento = q.nrodocumento
                    AND idempresa = q.idempresa AND idsucursal = q.idsucursal
                    AND idcaja = q.idcaja AND idtipodocumentoelectronico = q.idtipodocumentoelectronico)


			   -- SDEDO = DE Anulado (Anulado en Sirius, jam?s se envi? a Sifen)
		   AND tede.codigo IS NOT NULL
		ORDER BY 1, 8, 9, 13, 14, 15 limit 1;

END;
$function$
;

SELECT * FROM sifen.fn_cp_obetner_ultimo_evento_de(2,29054,443036);
SELECT DTO.* FROM SIFEN.DOCUMENTOELECTRONICO D
JOIN INTEGRACION.DTO Dto ON D.IDDTO = DTO.IDDTO
WHERE D.IDDE=443103;

SELECT * FROM SIFEN.DOCUMENTOELECTRONICO D WHERE IDDE IN (443145,443146,
443147,443148,443149,443150,443151,443152,443153,443154,443155,443156,443157);

SELECT * FROM SIFEN.DOCUMENTOELECTRONICO D WHERE IDDE=443158;
SELECT * FROM SIFEN.DOCUMENTOELECTRONICO D WHERE IDTIPOESTADODEULTIMO=8;
SELECT * FROM INTEGRACION.DTO D WHERE IDDTO=3323550;
SELECT * FROM SIFEN.LOTEDETALLEEVENTO L WHERE IDDE IN (443145,443146,
443147,443148,443149,443150,443151,443152,443153,443154,443155,443156,443157);


SELECT * FROM SIFEN.LOTEDETALLEEVENTO L WHERE IDDE IN (443212,
443210);


select * FROM SIFEN.DOCUMENTOELECTRONICO D WHERE D.IDEMPRESA = 2 AND D.IDDE= 443158
select * FROM SIFEN.TIMBRADO T WHERE IDDE = 443158
select * from SIFEN.EMPRESASUCURSALCAJA E
/*
,,*/
select spv.idempresa, spv.idsisparam, sp.idsisparam, sp."key", spv.value
from base.sis_param_value spv
join base.sis_param sp
	 on sp.idsisparam = spv.idsisparam
where idempresa = 2;

SELECT * FROM BASE.USUARIO U;
SELECT * FROM BASE.USUARIOEMPRESA U;
SELECT * FROM BASE.USUARIOEMPRESAROL U;
SELECT * FROM BASE.CREDENCIAL C;

SELECT DISTINCT D.IDDE, E.ESTABLECIMIENTO, E.PUNTOEXPEDICION, T.NRODELDOCUMENTO, D.IDENTIFICADORDE, D.DV, E.NUMEROTIMBRADO, TED.DESCRIPCION
            FROM sifen.doc
                umentoelectronico d
                INNER JOIN sifen.timbrado t ON d.idde = t.idde AND
            			           d.idempresa = t.idempresa
                INNER JOIN sifen.tipodocumentoelectronico ti ON t.idempresa = ti.idempresa AND
              						    t.idtipodocumentoelectronico = ti.idtipodocumentoelectronico
                INNER JOIN sifen.empresasucursalcaja c ON t.idempresa = c.idempresa AND
                                                          t.idsucursal = c.idsucursal AND
                                                          t.idcaja = c.idcaja
                INNER JOIN sifen.empresasucursal s ON c.idempresa = s.idempresa AND
            					  c.idsucursal = s.idsucursal
                INNER JOIN sifen.EMPRESATIMBRADO E ON E.IDCAJA = C.IDCAJA
                                                 AND E.IDSUCURSAL = C.IDSUCURSAL
                                                 AND E.IDEMPRESA=C.IDEMPRESA
            INNER JOIN SIFEN.TIPOESTADODE TED ON TED.IDTIPOESTADODE = D.IDTIPOESTADODEULTIMO
ORDER BY T.NRODELDOCUMENTO;


SELECT s.CODIGO, E2.CODIGO, E.ESTABLECIMIENTO, E.PUNTOEXPEDICION FROM SIFEN.EMPRESATIMBRADO E
JOIN SIFEN.EMPRESASUCURSAL S ON S.IDEMPRESA=E.IDEMPRESA
                             AND S.IDSUCURSAL=E.IDSUCURSAL
JOIN SIFEN.EMPRESASUCURSALCAJA E2 ON E2.IDEMPRESA=E.IDEMPRESA
                                AND E2.IDSUCURSAL=E.IDSUCURSAL
                                AND E2.IDCAJA=E.IDCAJA
WHERE E.ACTIVO=true;

SELECT * FROM BASE.USUARIO U; --aud_fecalta

SELECT U.IDUSUARIO, U.USERNAME, U.CORREO, E.IDCAJA, E.CODIGO, E.AUD_FECMODIF FROM SIFEN.EMPRESASUCURSALCAJA E
INNER JOIN BASE.USUARIO U ON E.AUD_IDUSUARIOMODIF=U.IDUSUARIO;

SELECT * FROM SIFEN.EMPRESASUCURSALCAJA E;
SELECT * FROM SIFEN.TIMBRADO T WHERE IDCAJA=3;
SELECT * FROM SIFEN.DOCUMENTOELECTRONICO D WHERE IDDE =442937;

/*para cuando no logueo la pantalla de usuarios*/
--error colum "aud_fecalta" does not exist
ALTER TABLE base.persona ADD COLUMN aud_fecalta timestamp;
ALTER TABLE base.persona ADD COLUMN aud_fecmodif timestamp;
ALTER TABLE base.persona ADD COLUMN aud_idusuarioalta int4;
ALTER TABLE base.persona ADD COLUMN aud_idusuariomodif int4;
ALTER TABLE sifen.tipomotivoemision ADD COLUMN aud_fecalta timestamp;
ALTER TABLE sifen.tipomotivoemision ADD COLUMN aud_fecmodif timestamp;
ALTER TABLE sifen.tipomotivoemision ADD COLUMN aud_idusuarioalta int4;
ALTER TABLE sifen.tipomotivoemision ADD COLUMN aud_idusuariomodif int4;

SELECT * FROM SIFEN.DOCUMENTOELECTRONICO D;
SELECT * FROM SIFEN.CIUDAD;
SELECT * FROM SIFEN.DISTRITO D;
SELECT * FROM SIFEN.DEPARTAMENTO D;

--CONSTRAINT idx_uq_departamento_codigosifen
--alter table sifen.departamento drop CONSTRAINT idx_uq_departamento_codigo;
--ALTER TABLE sifen.departamento ADD CONSTRAINT idx_uq_departamento_codigosifen UNIQUE (idempresa, codigosifen);

ALTER TABLE sifen.operacioncomercial ALTER COLUMN idtipotransaccion DROP NOT NULL;
---------------------------
SELECT * FROM SIFEN.TIMBRADO T WHERE T.NRODELDOCUMENTO = 932 ;
SELECT * FROM INTEGRACION.DTO D WHERE D.IDDTO = 3327728 ;
SELECT * FROM SIFEN.DOCUMENTOELECTRONICO D WHERE D.IDDE = 444112 ;
SELECT * FROM SIFEN.LOTEDETALLEEVENTO L WHERE L.IDDE = 444112 ;
SELECT * FROM SIFEN.LOTEEVENTORESP L WHERE L.IDLOTE = 29163 ;
SELECT * FROM SIFEN.LOTEDETALLEEVENTO L WHERE L.IDLOTE = 29163 ;

SELECT D.* FROM SIFEN.DOCUMENTOELECTRONICO D
JOIN SIFEN.TIMBRADO T ON T.IDEMPRESA = D.IDEMPRESA
                     AND t.IDDE = d.IDDE
WHERE T.NRODELDOCUMENTO = 1013;

SELECT * FROM SIFEN.GENERALDERECEPTOR G WHERE G.IDDE = 444201 ;
SELECT * FROM SIFEN.LOTEDETALLEEVENTO L WHERE IDDE = 444201 ;

SELECT * FROM SIFEN.DOCUMENTOELECTRONICO D
JOIN SIFEN.TIMBRADO T on T.IDEMPRESA = d.IDEMPRESA
                     AND t.IDDE = d.IDDE
WHERE T.NRODELDOCUMENTO = 13 ;

SELECT * FROM SIFEN.TIPODOCUMENTOELECTRONICO T ;
SELECT * FROM INTEGRACION.DTO D WHERE D.IDDTO = 3329779 ;

-
SELECT * FROM TRUSTED_ZONE.GXFINDTA_TCLMOV GT WHERE GT.MOVDSBCE='0105425669';

select
	datid, usename, wait_event_type, wait_event, state,	query, datname,	pid, usesysid, usename,	application_name, backend_xmin,
	client_addr, client_hostname, client_port, backend_start, xact_start, query_start, state_change, backend_xid, backend_type
	--pg_terminate_backend(pg_stat_activity.pid)
from
	pg_stat_activity
where
	datname = 'asientos'
	and pid <> pg_backend_pid()
	--and state = 'active'
	--AND usename = 'usrclt'
order by state;
------------------------------------------------------------
select * from base.usuario ;
select * from base.usuarioempresarol u where idusuario = 5646;
select * from base.credencial c where idusuario = 5646 and idrol = 3;
SELECT * FROM BASE.PERSONA P;

ALTER TABLE base.persona ADD COLUMN aud_fecalta timestamp;
ALTER TABLE base.persona ADD COLUMN aud_fecmodif timestamp;
ALTER TABLE base.persona ADD COLUMN aud_idusuarioalta int4;
ALTER TABLE base.persona ADD COLUMN aud_idusuariomodif int4;
-----------------------------
-----reprocesar xml.! paso quitar los idde =7
select * from sifen.documentoelectronico d where d.IDDE=542736 d.IDTIPOESTADODEULTIMO=7;--idde IN (510204,510211,510217,510222,510227,510246,510250,510260,510272,510283,510300,510307,510313,510314,510330,510332,510339,510350,510358,510363,510365,510367,510392,510403,
--510404,510471,510476,510503,510513,510411,510412,510413,510438,510447);
--p.2 para reproceso firmado
UPDATE sifen.documentoelectronico SET FECFIRMA = NULL , DIGESTVALUEFIRMA= NULL,SIGNATUREVALUE= NULL, CERTIFICADOX509= NULL, XMLFIRMADO= NULL, IDTIPOESTADODEULTIMO='7'
WHERE idde IN (542736, 542610, 542647, 542648, 542611, 542612, 542615, 542613, 542614, 542616, 542617, 542620, 542618, 542619, 542621, 542622, 542625, 542623, 542624, 542626, 542627, 542630, 542628, 542629, 542631, 542632, 542635, 542633, 542634, 542636, 542637, 542640, 542638, 542639, 542641, 542642, 542645, 542643, 542644, 542646, 542740, 542742, 542741, 542649, 542650, 542653, 542651, 542652, 542654, 542655, 542658, 542656, 542657, 542659, 542660, 542663, 542661, 542662, 542664, 542665, 542668, 542666, 542667, 542669, 542670, 542671, 542672, 542673, 542675, 542674, 542676, 542677, 542678, 542680, 542679, 542681, 542682, 542683, 542686, 542684, 542685, 542687, 542688, 542691, 542689, 542690, 542692, 542693, 542696, 542694, 542695, 542697, 542698, 542701, 542699, 542700, 542702, 542703, 542706, 542704, 542705, 542707, 542708, 542709, 542710, 542711, 542713, 542712, 542714, 542715, 542716, 542718, 542717, 542719, 542720, 542721, 542724, 542722, 542723, 542725, 542726, 542729, 542727, 542728, 542730, 542731, 542733, 542732, 542734, 542735, 542737, 542738, 542743, 542739, 542744, 542745, 542746, 542747, 542748, 542749, 542751, 542750);

/*WHERE idde IN (510204,510211,510217,510222,510227,510246,510250,510260,510272,510283,510300,510307,510313,510314,510330,510332,510339,510350,510358,510363,510365,510367,510392,510403,
510404,510471,510476,510503,510513,510411,510412,510413,510438,510447);*/

select * from sifen.lotedetalleevento l --where idde = 326047;
WHERE idde IN (542736, 542610, 542647, 542648, 542611, 542612, 542615, 542613, 542614, 542616, 542617, 542620, 542618, 542619, 542621, 542622, 542625, 542623, 542624, 542626, 542627, 542630, 542628, 542629, 542631, 542632, 542635, 542633, 542634, 542636, 542637, 542640, 542638, 542639, 542641, 542642, 542645, 542643, 542644, 542646, 542740, 542742, 542741, 542649, 542650, 542653, 542651, 542652, 542654, 542655, 542658, 542656, 542657, 542659, 542660, 542663, 542661, 542662, 542664, 542665, 542668, 542666, 542667, 542669, 542670, 542671, 542672, 542673, 542675, 542674, 542676, 542677, 542678, 542680, 542679, 542681, 542682, 542683, 542686, 542684, 542685, 542687, 542688, 542691, 542689, 542690, 542692, 542693, 542696, 542694, 542695, 542697, 542698, 542701, 542699, 542700, 542702, 542703, 542706, 542704, 542705, 542707, 542708, 542709, 542710, 542711, 542713, 542712, 542714, 542715, 542716, 542718, 542717, 542719, 542720, 542721, 542724, 542722, 542723, 542725, 542726, 542729, 542727, 542728, 542730, 542731, 542733, 542732, 542734, 542735, 542737, 542738, 542743, 542739, 542744, 542745, 542746, 542747, 542748, 542749, 542751, 542750);

select * from sifen.lotedetalleeventoresp l where idde IN (510204,510211,510217,510222,510227,510246,510250,510260,510272,510283,510300,510307,510313,510314,510330,510332,510339,510350,510358,510363,510365,510367,510392,510403,
510404,510471,510476,510503,510513,510411,510412,510413,510438,510447);


select * from sifen.documentoelectronicofueradefirma d where idde = 326047;

select * from sifen.loteeventoresp l where idlote = 27306 ;

--rechazado 3=rechazo
select * from sifen.documentoelectronico d WHERE d.IDTIPOESTADODEULTIMO=7 AND DATE(fecmodiftipoestado)>='2024-01-24';

select * from sifen.lotedetalleeventorespmensaje l where idde IN (510204,510211,510217,510222,510227,510246,510250,510260,510272,510283,510300,510307,510313,510314,510330,510332,510339,510350,510358,510363,510365,510367,510392,510403,
510404,510471,510476,510503,510513,510411,510412,510413,510438,510447, 510463,510474,510507,510519,510945,510941,510943,510953,
511002,511007,511016,511017,511021,511027,511035,511047,511052,511063,510168,510172);

select * from sifen.documentoelectronico d where idde IN (510463,510474,510507,510519,510945,510941,510943,510953,
511002,511007,511016,511017,511021,511027,511035,511047,511052,511063,510168,510172);

UPDATE sifen.documentoelectronico SET FECFIRMA = NULL , DIGESTVALUEFIRMA= NULL,SIGNATUREVALUE= NULL, CERTIFICADOX509= NULL, XMLFIRMADO= NULL, IDTIPOESTADODEULTIMO='7'
WHERE idde IN (510463,510474,510507,510519,510945,510941,510943,510953,
511002,511007,511016,511017,511021,511027,511035,511047,511052,511063,510168,510172);

DELETE  from sifen.lotedetalleeventorespmensaje l where idde IN (510463,510474,510507,510519,510945,510941,510943,510953,
511002,511007,511016,511017,511021,511027,511035,511047,511052,511063,510168,510172);

DELETE  from sifen.lotedetalleeventoresp l where idde IN (510463,510474,510507,510519,510945,510941,510943,510953,
511002,511007,511016,511017,511021,511027,511035,511047,511052,511063,510168,510172);

select * from sifen.lotedetalleevento l where idde IN (510463,510474,510507,510519,510945,510941,510943,510953,
511002,511007,511016,511017,511021,511027,511035,511047,511052,511063,510168,510172);
--paso3
DELETE FROM sifen.lotedetalleevento l WHERE idde IN (542736, 542610, 542647, 542648, 542611, 542612, 542615, 542613, 542614, 542616, 542617, 542620, 542618, 542619, 542621, 542622, 542625, 542623, 542624, 542626, 542627, 542630, 542628, 542629, 542631, 542632, 542635, 542633, 542634, 542636, 542637, 542640, 542638, 542639, 542641, 542642, 542645, 542643, 542644, 542646, 542740, 542742, 542741, 542649, 542650, 542653, 542651, 542652, 542654, 542655, 542658, 542656, 542657, 542659, 542660, 542663, 542661, 542662, 542664, 542665, 542668, 542666, 542667, 542669, 542670, 542671, 542672, 542673, 542675, 542674, 542676, 542677, 542678, 542680, 542679, 542681, 542682, 542683, 542686, 542684, 542685, 542687, 542688, 542691, 542689, 542690, 542692, 542693, 542696, 542694, 542695, 542697, 542698, 542701, 542699, 542700, 542702, 542703, 542706, 542704, 542705, 542707, 542708, 542709, 542710, 542711, 542713, 542712, 542714, 542715, 542716, 542718, 542717, 542719, 542720, 542721, 542724, 542722, 542723, 542725, 542726, 542729, 542727, 542728, 542730, 542731, 542733, 542732, 542734, 542735, 542737, 542738, 542743, 542739, 542744, 542745, 542746, 542747, 542748, 542749, 542751, 542750)
AND idtipoevento IN (11,12,13,3,4);
--paso4
DELETE  from sifen.documentoelectronicofueradefirma d WHERE idde IN (542736, 542610, 542647, 542648, 542611, 542612, 542615, 542613, 542614, 542616, 542617, 542620, 542618, 542619, 542621, 542622, 542625, 542623, 542624, 542626, 542627, 542630, 542628, 542629, 542631, 542632, 542635, 542633, 542634, 542636, 542637, 542640, 542638, 542639, 542641, 542642, 542645, 542643, 542644, 542646, 542740, 542742, 542741, 542649, 542650, 542653, 542651, 542652, 542654, 542655, 542658, 542656, 542657, 542659, 542660, 542663, 542661, 542662, 542664, 542665, 542668, 542666, 542667, 542669, 542670, 542671, 542672, 542673, 542675, 542674, 542676, 542677, 542678, 542680, 542679, 542681, 542682, 542683, 542686, 542684, 542685, 542687, 542688, 542691, 542689, 542690, 542692, 542693, 542696, 542694, 542695, 542697, 542698, 542701, 542699, 542700, 542702, 542703, 542706, 542704, 542705, 542707, 542708, 542709, 542710, 542711, 542713, 542712, 542714, 542715, 542716, 542718, 542717, 542719, 542720, 542721, 542724, 542722, 542723, 542725, 542726, 542729, 542727, 542728, 542730, 542731, 542733, 542732, 542734, 542735, 542737, 542738, 542743, 542739, 542744, 542745, 542746, 542747, 542748, 542749, 542751, 542750);
--P5
SELECT DISTINCT(L.IDLOTE) FROM SIFEN.LOTEDETALLEEVENTO L  WHERE idde IN (542736, 542610, 542647, 542648, 542611, 542612, 542615, 542613, 542614, 542616, 542617, 542620, 542618, 542619, 542621, 542622, 542625, 542623, 542624, 542626, 542627, 542630, 542628, 542629, 542631, 542632, 542635, 542633, 542634, 542636, 542637, 542640, 542638, 542639, 542641, 542642, 542645, 542643, 542644, 542646, 542740, 542742, 542741, 542649, 542650, 542653, 542651, 542652, 542654, 542655, 542658, 542656, 542657, 542659, 542660, 542663, 542661, 542662, 542664, 542665, 542668, 542666, 542667, 542669, 542670, 542671, 542672, 542673, 542675, 542674, 542676, 542677, 542678, 542680, 542679, 542681, 542682, 542683, 542686, 542684, 542685, 542687, 542688, 542691, 542689, 542690, 542692, 542693, 542696, 542694, 542695, 542697, 542698, 542701, 542699, 542700, 542702, 542703, 542706, 542704, 542705, 542707, 542708, 542709, 542710, 542711, 542713, 542712, 542714, 542715, 542716, 542718, 542717, 542719, 542720, 542721, 542724, 542722, 542723, 542725, 542726, 542729, 542727, 542728, 542730, 542731, 542733, 542732, 542734, 542735, 542737, 542738, 542743, 542739, 542744, 542745, 542746, 542747, 542748, 542749, 542751, 542750);
--P6 Y SE ELIMINA
SELECT * FROM SIFEN.LOTEEVENTORESP L  WHERE idlote IN (33735, 33739, 33732, 33742, 33731, 33741, 33733, 33734, 33743, 33736, 33737, 33740, 33730, 33738, 33744);

select * from sifen.lote where lote.IDLOTE=32826;--DATE(fecalta)='2024-01-26' ;
--creamos lote
INSERT INTO SIFEN.LOTE (IDEMPRESA, IDLOTE, IDTIPODOCUMENTOELECTRONICO, FECALTA, FECFIN, ACTIVO, OBS, IDTIPOLOTE, IDTIPOEVENTO, AUD_FECALTA, AUD_FECMODIF, AUD_IDUSUARIOALTA, AUD_IDUSUARIOMODIF)
VALUES (2::INTEGER, DEFAULT, 1::INTEGER, '2024-02-19 15:45:00.846000'::TIMESTAMP, NULL::TIMESTAMP, FALSE::DO_BOO_ACTIVO, 'Creado al momento de insertar el lotedetalleevento.'::TEXT, 1::INTEGER, 1::INTEGER, NULL::TIMESTAMP, NULL::TIMESTAMP, NULL::INTEGER, NULL::INTEGER);

select * from sifen.lotedetalleevento l where idde IN (510463,510474,510507,510519,510945,510941,510943,510953,
511002,511007,511016,511017,511021,511027,511035,511047,511052,511063,510168,510172);

UPDATE sifen.lotedetalleevento l SET idlote= 33745 where idde IN (542610, 542611, 542612, 542615, 542613, 542614, 542616, 542617, 542620, 542618, 542619, 542621, 542622, 542625, 542623, 542624, 542626, 542627, 542629, 542631, 542632, 542635, 542630, 542628, 542636, 542640, 542633, 542634, 542637, 542638, 542639, 542641);

---SE CAMBIA A ESTADO 7 ATODO EL LOTE
UPDATE sifen.documentoelectronico SET idtipoestadodeultimo = 7::integer WHERE idempresa = 2::integer AND idde = 510313::bigint
---SE FIRMA MANUAL Y LUEGO DE ACTIVA EL LOTE
UPDATE SIFEN.LOTE
SET ACTIVO = TRUE::DO_BOO_ACTIVO
WHERE IDEMPRESA = 2::INTEGER
  AND IDLOTE = 32826::BIGINT;



select spv.idempresa, spv.idsisparam, sp.idsisparam, sp."key", spv.value
from base.sis_param_value spv
join base.sis_param sp
	 on sp.idsisparam = spv.idsisparam
where idempresa = 2 ;

SELECT *
FROM BASE.SIS_PARAM_VALUE WHERE sis_param_value.IDSISPARAM=49;

SELECT * FROM sirius.sifen.DOCUMENTOELECTRONICO D WHERE idde IN (542610, 542611, 542612, 542613, 542614, 542615, 542616, 542617, 542618, 542619, 542620, 542621, 542622, 542623, 542624, 542625, 542626, 542627, 542628, 542629, 542630, 542631, 542632, 542633, 542634, 542635, 542636, 542637, 542638, 542639, 542640, 542641);
         --WHERE date(fecmodiftipoestado)>='2024-02-15';

SELECT * FROM sirius.sifen.LOTEDETALLEEVENTO L WHERE idde IN (542610, 542612, 542613, 542614, 542619, 542617, 542618, 542624, 542622, 542623, 542629, 542627, 542628, 542634, 542632, 542633, 542639, 542637, 542638, 542734, 542615, 542630, 542631, 542640, 542616, 542620, 542621, 542625, 542626, 542635, 542636, 542641, 542611);

SELECT * FROM sirius.sifen.LOTEEVENTORESP L WHERE idlote IN (33731, 33730);

SELECT * FROM sirius.sifen.LOTEDETALLEEVENTO  L WHERE idlote IN (33731, 33730);
SELECT * FROM sirius.sifen.LOTEDETALLEEVENTORESPMENSAJE L WHERE idde IN (542610, 542611, 542612, 542613, 542614, 542615, 542616, 542617, 542618, 542619, 542620, 542621, 542622, 542623, 542624, 542625, 542626, 542627, 542628, 542629, 542630, 542631, 542632, 542633, 542634, 542635, 542636, 542637, 542638, 542639, 542640, 542641);
SELECT * FROM sirius.sifen.LOTEDETALLEEVENTORESP L WHERE idde IN (542610, 542611, 542612, 542613, 542614, 542615, 542616, 542617, 542618, 542619, 542620, 542621, 542622, 542623, 542624, 542625, 542626, 542627, 542628, 542629, 542630, 542631, 542632, 542633, 542634, 542635, 542636, 542637, 542638, 542639, 542640, 542641);
DELETE FROM sirius.sifen.LOTEDETALLEEVENTO  L WHERE idlote IN (33731, 33730) AND L.IDTIPOEVENTO IN (3,4);

UPDATE SIFEN.DOCUMENTOELECTRONICO D SET IDTIPOESTADODEULTIMO=7 WHERE idde IN (542610, 542611, 542612, 542613, 542614, 542615, 542616, 542617, 542618, 542619, 542620, 542621, 542622, 542623, 542624, 542625, 542626, 542627, 542628, 542629, 542630, 542631, 542632, 542633, 542634, 542635, 542636, 542637, 542638, 542639, 542640, 542641);
--DELETE
SELECT * FROM sirius.sifen.LOTEEVENTORESP L WHERE idlote IN (33731, 33730);
SELECT * FROM SIFEN.LOTE L WHERE L.FECALTA='2024-02-19 15:45:00.846000'; --33745

UPDATE sifen.lotedetalleevento l SET idlote= 33745 where idde IN (542610, 542611, 542612, 542615, 542613, 542614, 542616, 542617, 542620, 542618, 542619, 542621, 542622, 542625, 542623, 542624, 542626, 542627, 542629, 542631, 542632, 542635, 542630, 542628, 542636, 542640, 542633, 542634, 542637, 542638, 542639, 542641);


"documentoAsociadoList": [
            {
                "nroConstancia": null,
                "codTipoConstancia": null,
                "cdcDTEReferenciado": "01800501721001001000012222023082311710923021",
                "fecEmisionDocImpreso": null,
                "nroControlConstancia": null,
                "nroTimbradoDocImpreso": null,
                "nroDocumentoDocImpreso": null,
                "codTipoDocumentoImpreso": null,
                "nroComprobanteRetencion": null,


SELECT D.* FROM SIFEN.DOCUMENTOELECTRONICO D
INNER JOIN SIFEN.TIMBRADO T ON D.IDEMPRESA=T.IDEMPRESA AND D.IDDE=T.IDDE
WHERE T.NRODELDOCUMENTO IN (200190, 200188, 200217, 200222, 200221, 200224, 200227, 200230, 200204, 200215, 200220, 200219, 200229, 200186, 200195, 200194, 200223, 200200, 200197, 200206, 200216, 200212, 200211, 200218, 200203, 200225, 200209, 200226, 200205, 200214, 200208, 200232, 200189, 200185, 200207, 200228, 200198, 200199, 200191, 200184, 200192, 200187, 200193, 200196, 200202, 200201, 200210, 200213, 200233, 200231);

SELECT D.* FROM SIFEN.DOCUMENTOELECTRONICO D WHERE idde IN (822714, 822729, 822741, 822748, 822716, 822733, 822749, 822720, 822737, 822753, 822728, 822742, 822715, 822724, 822735, 822747, 822759, 822718, 822732, 822710, 822725, 822739, 822755, 822734, 822745, 822756, 822713, 822719, 822743, 822711, 822726, 822754, 822717, 822730, 822751, 822723, 822750, 822721, 822736, 822752, 822712, 822727, 822731, 822746, 822758, 822722, 822740, 822757, 822738, 822744)
INNER JOIN SIFEN.TIMBRADO T ON D.IDEMPRESA=T.IDEMPRESA AND D.IDDE=T.IDDE
WHERE T.NRODELDOCUMENTO=199656

SELECT * FROM SIFEN.LOTEDETALLEEVENTO L WHERE L.IDDE=571975;
SELECT * FROM SIFEN.DOCUMENTOASOCIADO D WHERE idde IN (572606, 572631, 572642);--01800110129001003005317822024031514550275631
SELECT * FROM sirius.sifen.DOCUMENTOELECTRONICO D WHERE D.IDENTIFICADORDE LIKE '%0010020047240%';--IN ('0180011012900100200472402202402291980188045', '0180011012900100200472372202402291624197041', '0180011012900100200472392202402291720407855');

SELECT * FROM sirius.sifen.LOTEDETALLEEVENTO L WHERE L.IDDE IN (556019,556020,556017) ORDER BY IDDE, FECHORAEVENTO;
SELECT * FROM sirius.sifen.LOTEDETALLEEVENTORESPMENSAJE L WHERE L.IDDE IN (556019,556020,556017);
SELECT * FROM sirius.sifen.LOTEDETALLEEVENTORESP L WHERE L.IDDE IN (556019,556020,556017);


INSERT INTO
    sifen.lotedetalleevento
    (idempresa, idlote, idde, idtipoevento, idtipoestadoevento, idtipoestadode, fechoraevento, obs, errsqlstate, errstacktrace, aud_fecalta, aud_fecmodif, aud_idusuarioalta, aud_idusuariomodif)
VALUES (2, 34151, 556019, 4, 1, 1, '2024-04-04 10:30:03.908894', 'cambio por DB. Rechazo falso SIFEN', null, null, null, null, null, null);

SELECT * FROM
             sirius.sifen.DOCUMENTOELECTRONICO D WHERE D.IDENTIFICADORDE='0180011012900100201360652202406281673992945'