--Buscar bines
-------------------------------------------------------
Select * from libdebito.tbinproc
where pbin='602049'

SELECT * FROM GXBDBPS.tbineaf where BIBINES = '6274310'
select * from libdebito.binprodu where RGBIN='602049'
select * from gxtrjdta.itdgbin where BINNROBIN like '627431%'
-------------------------------------------------------------------------------------
-- Bibliotecas
BIBLIOTECA
Libdebito
GXOPERA
GXBDBPS
GXDEBITO
GXWEB
GXMONI
CONTABILID
DCASH
YAPI
-------------------------------------------------------------------------------------
select * from libdebito.tbinproc - Bin y marca de tarjeta
select * from gxopera.opentid1 - Bin y marca de tarjeta
select * from ATMCENTRE.TBBINE0P- Bin y marca de tarjeta
select * from GXSWTDTA.MPE0041 - Bin adquirente
select * from GXSWTDTA.MPE0091 - Adquirir el identificador del programa de la tarjeta BIN
select * from GXBDBPS.ATDCTAREL - BIN y CUENTA
select * from GXBDBPS.ATDBIN - BIN
select * from GXBDBPS.ATDEMIS - BIN y CUENTA
-------------------------------------------------------------------------------------
select * from gxopera.opentid -- CODIGOS DE ENTIDADES
select * from gxbdbps.tdemis
Select * from gxopera.opmovi --acreditaciones normales
select * from gxopera.opliqui--acreditaciones en linea
select * from libdebito.drconbep --todas las transacciones POS/ATM
select * from gxbdbps.thmovaf
select * from gxbdbps.comaeaf where cocomer IN ('6900281','6900282') --Maestro de comercio(buscar comercios)
SELECT * FROM LIBDEBITO.TBCTRA0P where txctrx in /*('303000','304000','301000','302000')--*/('311000', '311100', '312000' , '312100', '313000', '313100', '314000', '314001')LIKE '%ATM'--CODIGOS DE TRANSACCIONES --MAESTRO TRANSACCIONES
SELECT * FROM LIBDEBITO.TBCRET0P --CODIGOS DE RESPUESTAS --MAESTRO CODIGO DE RETORNO
select * from libdebito.embnovhst -- TARJETAS DE DEBITO 
select * from gxbdbps.tmtaraf -- TARJETAS DE CREDITO
SELECT * FROM GEODINEL.GEOCOMAE --GEOLOCALIZACION DE COMERCIOS 
select * from libdebito.tgembhaf -- Historico DE TARJETAS--
SELECT * FROM LIBDEBITO.TGEMBNOV --- TARJETAS A EMBOZAR---
SELECT * FROM GXBDBPS.COMAEAF WHERE COCOMER= '6900282' -- MAESTRO DE COMERCIOS
SELECT * FROM LIBDEBITO.DRCONBEP -- MAESTRO DE TRANSACCIONES
SELECT * FROM GXBDBPS.GENTIAF    -- TABLA DE ENTIDADES
SELECT * FROM LIBDEBITO.TBCTRA0P -- TABLA DE COD. TRX 
SELECT * FROM LIBDEBITO.TBCRET0P --TABLA DE COD. DE RETORNO
select * from gxbdbps.tbloqaf 	 -- estados de tarjeta DIN 
SELECT * FROM GXBDBPS.COLOCAF    --TABLA DE LOCALIDADES
SELECT * FROM GXBDBPS.COZONAF		 -- CODIGO DE ZONAS
SELECT * FROM gxbdbps.codtoaf		-- TABLA DE DEPARTAMENTOS 
select * from gxopera.opentid1 --- Codigo de las ENTIDADES
select * from libdebito.binprodu ---Tabla de bines
select * FROM visa.VISCTLDTA -- TARJETAS VISA
select * from GXBDBPS.TAFINAF  where afdescr= 'conti'-- 
select * from libdebito.TBINPROC WHERE PBIN ='703020' --BINES DE PROCARD
SELECT * FROM LIBDEBITO.TBBINE0P WHERE QEBIN1 = '703020' --BINES DE BEPSA
SELECT * FROM LIBDEBITO.TC33 WHERE TCBINE = '443078'  BINES 
select * from trxt
SELECT * from LIBDEBITO.OPEMAEHST --HISTORICO DE RECLAMOS BNF
select * from gxbdbps.gengraf where gecodig='BNF'  --BINES BNF(por enemiso)--
select * from gxbdbps.gentiaf --BANCOS--
SELECT * from gxopera.tdavistas --CONTERO DE CANTIDAD TRX
SELECT * FROM gxbdbps.MTDFIC /*ALTAS DE TARJETAS FTP*/ 
select * from GXBDBPS.COAFMAF /*datos pos*/--AFAPPVER
SELECT * from gxbdbps.corubaf /*RUBROS DE COMERCIOS*/
select * from gxbdbps.coma2op /*calculo de comisiones telefonia*/
select * from LIBDEBITO.TBCTRA0P		--Codigos de Transacciones habilitadas
select * from LIBDEBITO.SWITCHENT		--Tabla de conexion entidades COMSRV01
select * from LIBDEBITO.BDCARD0P		- Contiene Nro de Tarjeta de Prueba
select * from GXBDBPS.ATMCCRET			- Codigos de Respuesta
select * from GXFINDTA.TCLRMI 			- Tabla de Categoria de Comercios MCC.
select * from GXFINDTA.TCLIMP			- Tabla de impuestos
select * from GXBDBPS.TMOVIAF           - Tabla de movimientos.
select * from GXBDBPS.TCMOVAF 	    -Tabla Codigos de movimientos 
select * from GXBDBPS.TMCTAAF	    - Tabla de Saldos.
select * from GXBDBPS.IPMDTA			- Tabla de IPM's Mastercard
select * from GXBDBPS.IPMDTAE			- Tabla de IPM's-Detalles Mastercard
select * from COMERPRB 					- Tabla de Comercios de Prueba
select * from BDCARDOP 					- Tabla de Numeros de tarjetas de prueba
select * from ATMCENTRE.LOGATMCENT 		- Archivo de log ATMCENTRE
select * from LIBDEBITO.LOGPOS0P		- Archivo de Log Pos
select * from GXBDBPS.ATMCLOGE 			- Archivo de Log Errores ATMCENTRE
select * from DEBUGATMC 				- Log Debug ATMCENTRE  
select * from GXBDBPS.ATMCTXDEST 		- Archivo de configuracion/operacion para atm s
select * from ATMCENTRE.TBBINE0P 		? Tabla de bines.
select * from ATMCENTRE.ATMCSTSDTA 		- Archivo de Log de ATMCENTRE
select * from GXBDBPS.ATMCCFG 			? Configuración de atm
select * from GXBDBPS.ATMCCRET 			? Códigos de retorno
select * from GXBDBPS.ATMCMSGLOG 		- Log Mensaje ATMC
select * from GXBDBPS.SWTDEST 			- Tabla de Destinos
select * from GXBDBPS.CORUBAF			- Tabla de Rubros.
select * from GXBDBPS.TPRMUTTX 			--Tabla de Reglas/Limites de Transacciones
select * from GXOPERA.CLPARF 			--Tabla de Entidades - Clearing
select * from GXBDBPS.TDENTCOM 			- Tabla de parametros de conexion con Entidad Debito
select * from GXBDBPS.LGCOMENT 			- Log de Mensajeria con Entidad
select * from GXBDPBS.ATMCDTA 			- Tabla de ATM s
select * from GXBDBPS.TDENTIDAD 		- Tabla de entidades.
select * from GXBDBPS.COMAEAF       	- Maestro de Comercios
select * from GXTRJDTA.TDGBIN			- Tabla de Bines (General)
select * from GXBDBPS.TMTARAF			- Maestro Tarjeta Credito Dinelco
select * from TGEMBHAF					- Historico de Embozados
select * from TDBIN 					- Bines de Tarjetas de Debito
select * from TDBINDET					- Tabla Extendida de Bines
select * from GXBDBPS.TMCTAAF			- Tabla de Disponibles.
select * from TDCLIENTE					- Tabla de Clientes Tarjetas de Debito.
select * from TDCTA						- Tabla de numeros de cuenta Debito
select * from TDCTAAD					- Tabla de adherentes Tarj. Debito
select * from GXBDBPS.TDEMNOTAR			- Tabla de Tarjetas de Debito.
select * from TDEMIS					- Tabla de Emisiones
select * from TDTARREL					- Tabla de Ctas Relacionadas
select * from TDCTAREL  				- Tabla de Ctas Relacionadas reingenieria
select * from ATMCENTRE.ATMCSTSDTA 		- Log de ATM Centre)
select * from TSWOTP					- Almacena datos de nro de tarjeta/pin
select * from TTCTRJ  					- Tarjeta Credito (maestro de reingenieria)
select * from TTDEMI  					- Emision (maestro de tarjeta debito reingenieria)
select * from TTDCAD  					- Adherente (reingenieria)
select * from GCLIEAF 					- Datos Cliente Tarjeta de Credito (sistema actual)
select * from TDENTCOM 					- Tabla de Autorizadores de Entidades
select * from VISA.VIMCC				- Tabla de Categoria de Comercios - MCC Visa
select * from VISA.VIPOSEM				- Pos Entry Mode Visa
select * from VISA.VIPOSCOND			- Pos Condition Code Visa
select * from GXBDBPS.VICNTCDE			- Tabla de Paises
select * from GXBDBPS.AITCOT			- Tabla de Cotizaciones
select * from VISA.VISISSLOG			- Log de Mensajes
select * from VISA.VISCTLDTA			- Datos de Transaccion Visa - Emisor
select * from VISA.VISTRNDTA			- Datos de Transaccion Visa - Detalles de Programas
select * from VISA.VISMTADTA			- Codigos de Proceso para Visa
select * from LIBDEBITO.TBEPAD0P		- Tabla de Entidades y cuentas clearing
select * from VISA.VSPCEAS				- Archivo de configuraciones del EAS
select * from MASTERCARD.MASCTLDTA  	- Datos de Transaccion Mastercard -Detalles de Campos
select * from MASTERCARD.MASTRNDTA  	- Datos de Transaccion Mastercard -Detalles de Programas

/*PARA FECHA ANTERIOR AL ENVIO*/ 
select * from gxbdbps.TMPNUM where-- numper = '201910'
SUBSTR(numfch,1,4)||'-'||SUBSTR(numfch,5,2)||'-'||SUBSTR(numfch,7,2) = DATE(CURDATE() - 1 days)

--numfch = '20191105' 
and numdsc like '%Actualización de numerales Diario%' 

-----------------------------------------------------------------------------------------------
 
select * FROM libdebito.tbcret0p --MAESTRO DE CODIGOS DE RESPUESTAS
SELECT * FROM GXBDBPS.TCOCAT
SELECT * FROM gxbdbps.comaeaf
SELECT * FROM gxopera.clparf 
SELECT * FROM LIBDEBITO.EMBNOVTMD
 
select * from gxbdbps.tmtaraf -- Extractos Tarjetas de Crédito Banco Continental- Entidad 021- Orden de no impresion
where enemiso='021' and MTSTATS='1' and mtreten<>'N'

SELECT * FROM LIBDEBITO.TBCTRA0P WHERE TXDTRX LIKE '%SALARIO%' --MAESTRO DE CODIGOS DE TRX

SELECT * FROM GXBDBPS.GENTIAF WHERE ENNOMBR LIKE '%VISION%'

SELECT * FROM GXBDBPS.TAFITRA WHERE COCOMER='0703744' --TABLA DE COMERCIOS ASOCIADOS A LA TARJETA GOURMET 627431155

SELECT * FROM LIBDEBITO.TBINPROC WHERE PBIN LIKE '456979%'

SELECT * FROM LIBDEBITO.TBBINE0P WHERE QEBI10 like '456979%'

SELECT * FROM ATMCENTRE.TBBINE0P WHERE QEBI10 like '627431%'

SELECT * FROM GXTRJDTA.TDGBIN WHERE BINNROBIN LIKE '456976%'

select * from gxopera.tclsec -- pago en linea de comercios con enemiso 146 pago comercios

-----------------------------------------------------------------------------------------------
CASOS INSTRUCTIVOS
select * from gxopera.trxinst
select * from gxopera.factura where faclien ='0301557' --CABECERA
select * from gxopera.factura1 where factnro = '10030019793' --DETALLE
select * from gxopera.opago1p
select * from gxopera.fcobros
select * from gxopera.flicom  WHERE LICOMER = '0200450' AND LIFECHD = '20191031'--CABECERA
select * from gxopera.flicom1 WHERE LICOMER = '0301556' AND LIFECREDI = '20191101' 


INFO CUENTAS RIO/CONTI
select * from gxbdbps.tdemis
select * from gxbdbps.tdemisnov

VERIFICAR TRX DEL PORTAL
SELECT * FROM gxweb.DRCON180 WHERE ALIDCOM = '6900282' AND ALFECTR BETWEEN  '20200210' AND '20200213' and alnrtar like '%5590'

LIQUIDACIONES
select * from gxopera.opliqui 

DATOS DE ATMS
select * from libdebito.tbatms0p

TABLA TDAVISTAS

select substr(lfectr, 1, 4),substr(lfectr, 5, 2), substr(lfectr, 7, 2),lbcocr,lcodbc,lidcom,lbinpr,lenemi,lcodtr, lhisde,lhisor,eneadm,enepro,         
substr(lidtra, 1, 1),lesttr, lcretr,count(*), sum(limpgs)                               
from    libprod.drconbe60                          
WHERE LCTAOR <> '9999999999999999' and substr(digits(lidcom), 6, 7) not in ('9099888','9099999','9099999')                    
 and substr(lfectr,1,6) = '202003' --:fechahoy    
group by lfectr,substr(lfectr, 1, 4), substr(lfectr, 5, 2), substr(lfectr, 7, 2),                  
lbcocr,lcodbc,lidcom,                                        
 lbinpr,lenemi,lcodtr,lhisde,lhisor,                          
eneadm,enepro,substr(lidtra, 1, 1),lesttr, lcretr  

 -------Busqueda de cuenta de comercio---------------------------------------------------

select --opidliq Nro_Liquidacion, opnroref Nro_Referencia, opncomer Nro_Comercio, opfecliq Nro_Liquidacion, ophorliq Hora_Liq, opcodbco Cod_Banco, opnroctd Nro_CuentaDebito, 
--opnroctc Nro_CuentaCredito, opimporb Importe, opstat Estado, opmensaj Mensaje, opfecacr FechaCargo 
 * from gxopera.opliqui where opncomer ='0200450' and opfecliq = '20191030'
  -------------------------------------------------------------------------------------------------------

--TABLAS VARIAS REINGENIERÍA

select * from gxtrjdta.TDGENT
select * from gxtrjdta.TCOEAC
select * from gxtrjdta.TCOENC
select * from gxtrjdta.TDGENM
select * from gxtrjdta.TDGEMD
select * from gxtrjdta.TDGEMP
select * from gxtrjdta.TDGENR
select * from gxtrjdta.TDGENS
select * from gxtrjdta.TDGAFI
select * from gxtrjdta.TDGADF
select * from gxtrjdta.TDGALC
select * from gxtrjdta.TDGAMC
select * from gxtrjdta.TDGATI
select * from gxtrjdta.TDGBIN
select * from gxtrjdta.TDGMAR
select * from gxtrjdta.TDGMPR
select * from gxtrjdta.TDGPRO
select * from gxtrjdta.TCAFUE
select * from gxtrjdta.TCASCO
select * from gxtrjdta.TCASFU
select * from gxtrjdta.TCAREC

-- Tablas new clearing

SELECT * FROM GXFINDTA.TCLMOV WHERE MOVFPRO ='20210924';
SELECT * FROM GXFINDTA.TCLHTM WHERE HTMFPRO ='20210924';
SELECT * FROM GXFINDTA.TCLMOD WHERE MODFPRO ='20210924';
SELECT * FROM GXBDBPS.TSWAUT WHERE AUTTRXFCHC ='20210924'AND AUTESTCLE='P';
SELECT * FROM GXFINDTA.TCLCSP WHERE CPCFEC='20210924';
SELECT * FROM GXFINDTA.TCLCPC WHERE CPCFEC='20210924';
SELECT * FROM GXFINDTA.TCLTPC WHERE TPCFPRO='20210915';

--TABLAS VISA

select * from gxbdbps.VISAMSG
select * from gxbdbps.VISAMSGD
select * from gxbdbps.VISAMSGDE
select * from gxbdbps.VISAMSGEX
select * from gxbdbps.VISAMSGEXD
select * from gxbdbps.IVISAMSGD1
select * from gxbdbps.VISADQPCD
select * from gxbdbps.VISADQPATT
select * from gxbdbps.VIADQENTI


select * from visa.VSPCEAS


select * from gxbdbps.atmctxdest 

--TABLAS VENCIMIENTO


select * from libdebito.tgembhaf where CRBINE='703002'
 and crenti='002' and CRVENC>'2000'
 

select COUNT(*) from libdebito.tgembhaf where CRBINE='703002'   
 and crenti='002' and CRVENC IN('2101', '2102', '2103', '2104', 
'2105', '2106', '2107', '2108', '2109', '2110', '2111', '2112')        

select * from libdebito.tgembhaf where CRBINE='703002'   
 and crenti='002' and CRVENC IN('2201', '2202', '2203', '2204', 
'2205', '2206', '2207', '2208', '2209', '2210', '2211', '2212')  
order by crvenc     

--SEGURIDAD TABLAS
-- usuarios
select * from gxbdbps.GUSERAF
-- opciones y niveles
select * from gxbdbps.GTRANAF
-- opciones habilitadas para usuarios
select * from gxbdbps.GUSTRAF
-- Grupos para usuarios
select * from gxbdbps.GGRUPAF
-- Grupo-entidad
select * from gxbdbps.GENGRAF
-- Entidad - Sucursal
select * from gxbdbps.GSUCUAF
-- Permisos especiales
select * from gxbdbps.tfuncaf
-- Usuario/Permisos especiales
select * from gxbdbps.TFUN1AF where FCVALOR='U99GABRI'


select * from gxbdbps.GUSTRAF where TRCODIG='T111'

select * from gxbdbps.guseraf where USIDUSR='U99ARTURO'

select * from gxbdbps.gusTRAF where USIDUSR='U99ARTURO'


- LIBDEBITO.TBCTRA0P		- Codigos de Transacciones habilitadas
- LIBDEBITO.SWITCHENT		- Tabla de conexion entidades COMSRV01
- LIBDEBITO.BDCARD0P		- Contiene Nro de Tarjeta de Prueba
- GXBDBPS.ATMCCRET			- Codigos de Respuesta
- GXFINDTA.TCLRMI 			- Tabla de Categoria de Comercios MCC.
- GXFINDTA.TCLIMP			- Tabla de impuestos
- GXBDBPS.TMOVIAF           - Tabla de movimientos.
- GXBDBPS.TCMOVAF 	    -Tabla Codigos de movimientos 
- GXBDBPS.TMCTAAF	    - Tabla de Saldos.
- GXBDBPS.IPMDTA			- Tabla de IPM's Mastercard
- GXBDBPS.IPMDTAE			- Tabla de IPM's-Detalles Mastercard
- COMERPRB 					- Tabla de Comercios de Prueba
- BDCARDOP 					- Tabla de Numeros de tarjetas de prueba
- ATMCENTRE.LOGATMCENT 		- Archivo de log ATMCENTRE
- LIBDEBITO.LOGPOS0P		- Archivo de Log Pos
- GXBDBPS.ATMCLOGE 			- Archivo de Log Errores ATMCENTRE
- DEBUGATMC 				- Log Debug ATMCENTRE  
- GXBDBPS.ATMCTXDEST 		- Archivo de configuracion/operacion para atm's
- ATMCENTRE.TBBINE0P 		– Tabla de bines.
- ATMCENTRE.ATMCSTSDTA 		- Archivo de Log de ATMCENTRE
- GXBDBPS.ATMCCFG 			– Configuración de atm
- GXBDBPS.ATMCCRET 			– Códigos de retorno
- GXBDBPS.ATMCMSGLOG 		- Log Mensaje ATMC
- GXBDBPS.SWTDEST 			- Tabla de Destinos
- GXBDBPS.CORUBAF			- Tabla de Rubros.
- GXBDBPS.TPRMUTTX 			- Tabla de Reglas/Limites de Transacciones
- GXOPERA.CLPARF 			- Tabla de Entidades - Clearing
- GXBDBPS.TDENTCOM 			- Tabla de parametros de conexion con Entidad Debito
- GXBDBPS.LGCOMENT 			- Log de Mensajeria con Entidad
- GXBDPBS.ATMCDTA 			- Tabla de ATM's
- GXBDBPS.TDENTIDAD 		- Tabla de entidades.
- GXBDBPS.COMAEAF       	- Maestro de Comercios
- GXTRJDTA.TDGBIN			- Tabla de Bines (General)
- GXBDBPS.TMTARAF			- Maestro Tarjeta Credito Dinelco
- TGEMBHAF					- Historico de Embozados
- TDBIN 					- Bines de Tarjetas de Debito
- TDBINDET					- Tabla Extendida de Bines
- GXBDBPS.TMCTAAF			- Tabla de Disponibles.
- TDCLIENTE					- Tabla de Clientes Tarjetas de Debito.
- TDCTA						- Tabla de numeros de cuenta Debito
- TDCTAAD					- Tabla de adherentes Tarj. Debito
- GXBDBPS.TDEMNOTAR			- Tabla de Tarjetas de Debito.
- TDEMIS					- Tabla de Emisiones
- TDTARREL					- Tabla de Ctas Relacionadas
- TDCTAREL  				- Tabla de Ctas Relacionadas reingenieria
- ATMCENTRE.ATMCSTSDTA 		- Log de ATM Centre)
- TSWOTP					- Almacena datos de nro de tarjeta/pin
- TTCTRJ  					- Tarjeta Credito (maestro de reingenieria)
- TTDEMI  					- Emision (maestro de tarjeta debito reingenieria)
- TTDCAD  					- Adherente (reingenieria)
- GCLIEAF 					- Datos Cliente Tarjeta de Credito (sistema actual)
- TDENTCOM 					- Tabla de Autorizadores de Entidades
- VISA.VIMCC				- Tabla de Categoria de Comercios - MCC Visa
- VISA.VIPOSEM				- Pos Entry Mode Visa
- VISA.VIPOSCOND			- Pos Condition Code Visa
- GXBDBPS.VICNTCDE			- Tabla de Paises
- GXBDBPS.AITCOT			- Tabla de Cotizaciones
- VISA.VISISSLOG			- Log de Mensajes
- VISA.VISCTLDTA			- Datos de Transaccion Visa - Emisor
- VISA.VISTRNDTA			- Datos de Transaccion Visa - Detalles de Programas
- VISA.VISMTADTA			- Codigos de Proceso para Visa
- LIBDEBITO.TBEPAD0P		- Tabla de Entidades y cuentas clearing
- VISA.VSPCEAS				- Archivo de configuraciones del EAS

- MASTERCARD.MASCTLDTA  	- Datos de Transaccion Mastercard -Detalles de Campos
- MASTERCARD.MASTRNDTA  	- Datos de Transaccion Mastercard -Detalles de Programas



Biblioteca	Modulo	Descripción	Acceso	Comentario
GXFINPGM	NCLP013R	Reversa transacciones CICO	UTSWAUT4	Nativo RPG
GXFINPGM	PCLROO1	Procedimiento para carga de temporal	ITSWAUT	Genexus
GXFINPGM	PCLROO1	Procedimiento para carga de temporal	UTSWAUT2	Genexus
GXFINPGM	PCLRO28	Carga Acreditaciones	UTSWAUT3	Genexus
GXFINPGM	PCLRO29	Comisiiones Trx en Línea	UTSWAUT3	Genexus
GXFINPGM	PCLRO50	Rollback Proceso Batch	UTSWAUT3	Genexus
GXFINPGM	PCLRO84	Control datos de muestra para reversar 	ITSWAUT	Genexus
GXFINPGM	PCLR148	Carga TCLSET s/ parametros	ITSWAUT	Genexus
GXFINPGM	PCLR184	Comisionamiento en Linea	UTSWAUT3	Genexus
GXFINPGM	PCLR191	Carga temporal archivo PCLR192	UTSWAUT1	Genexus
GXFINPGM	PCLR134	Calcula impuestos digitales		Genexus
GXPGBPS	PAUT002	Proceso de reversa de transacciones en TSWAUT y DRCONBEP		
GXPGBPS	PAUT008	Proceso de actualizacion de reversa de Trx		
GXPGBPS	PAUT009	 Asignacion estado final Trx segun dato recibido por parametro.		


GXSWTPGM	MI00102A	V3.VISA ADQ. Proceso carga de Matriz-> MI00102T	UTSWAUT4
GXSWTPGM	MI00103A	V3.VISA ADQ. Proceso carga de Matriz-> MI00103T	UTSWAUT4
GXSWTPGM	MI00103B	V2.VISA ADQ. Proceso carga de Matriz-> MI00103T	UTSWAUT4
MASTERCARD	MCAIE002	V.14 20220822 - Separar Afec.Saldo/TSWAUT/TMOVIAF	TSWAUT
MASTERCARD	MCAIE003	V.3  20220822 - Inserta TMOVIAF y Afecta.Saldo	TSWAUT
MASTERCARD	MCAIE004	V.11 20220715 - Adelanto - SaldoPenContado	TSWAUT
MASTERCARD	MI00001	Nivel 1 - Cabecera de la Matriz  -TMIFHD	TSWAUT
MASTERCARD	MI00002	Proceso Carga Liq. Tarjetas Mensaje Dual	TSWAUT
VISA	NFNPR006	V2.20210802 Agrega movimientos desde Incoming	TSWAUT
VISA	AIE002	V3 20220811 INC.Graba Regist. In en AIT001, 2 y 3	TSWAUT
GXSWTPGM	APMI019	Obtiene datos TSWAUT	UTSWAUT


--------------------------------
- LIBDEBITO.TBCTRA0P		- Codigos de Transacciones habilitadas
- LIBDEBITO.SWITCHENT		- Tabla de conexion entidades COMSRV01
- LIBDEBITO.BDCARD0P		- Contiene Nro de Tarjeta de Prueba
- GXBDBPS.ATMCCRET			- Codigos de Respuesta
- GXFINDTA.TCLRMI 			- Tabla de Categoria de Comercios MCC.
- GXFINDTA.TCLIMP			- Tabla de impuestos
- GXBDBPS.TMOVIAF           - Tabla de movimientos.
- GXBDBPS.TCMOVAF 	    -Tabla Codigos de movimientos 
- GXBDBPS.TMCTAAF	    - Tabla de Saldos.
- GXBDBPS.IPMDTA			- Tabla de IPM's Mastercard
- GXBDBPS.IPMDTAE			- Tabla de IPM's-Detalles Mastercard
- COMERPRB 					- Tabla de Comercios de Prueba
- BDCARDOP 					- Tabla de Numeros de tarjetas de prueba
- ATMCENTRE.LOGATMCENT 		- Archivo de log ATMCENTRE
- LIBDEBITO.LOGPOS0P		- Archivo de Log Pos
- GXBDBPS.ATMCLOGE 			- Archivo de Log Errores ATMCENTRE
- DEBUGATMC 				- Log Debug ATMCENTRE  
- GXBDBPS.ATMCTXDEST 		- Archivo de configuracion/operacion para atm's
- ATMCENTRE.TBBINE0P 		– Tabla de bines.
- ATMCENTRE.ATMCSTSDTA 		- Archivo de Log de ATMCENTRE
- GXBDBPS.ATMCCFG 			– Configuración de atm
- GXBDBPS.ATMCCRET 			– Códigos de retorno
- GXBDBPS.ATMCMSGLOG 		- Log Mensaje ATMC
- GXBDBPS.SWTDEST 			- Tabla de Destinos
- GXBDBPS.CORUBAF			- Tabla de Rubros.
- GXBDBPS.TPRMUTTX 			- Tabla de Reglas/Limites de Transacciones
- GXOPERA.CLPARF 			- Tabla de Entidades - Clearing
- GXBDBPS.TDENTCOM 			- Tabla de parametros de conexion con Entidad Debito
- GXBDBPS.LGCOMENT 			- Log de Mensajeria con Entidad
- GXBDPBS.ATMCDTA 			- Tabla de ATM's
- GXBDBPS.TDENTIDAD 		- Tabla de entidades.
- GXBDBPS.COMAEAF       	- Maestro de Comercios
- GXTRJDTA.TDGBIN			- Tabla de Bines (General)
- GXBDBPS.TMTARAF			- Maestro Tarjeta Credito Dinelco
- TGEMBHAF					- Historico de Embozados
- TDBIN 					- Bines de Tarjetas de Debito
- TDBINDET					- Tabla Extendida de Bines
- GXBDBPS.TMCTAAF			- Tabla de Disponibles.
- TDCLIENTE					- Tabla de Clientes Tarjetas de Debito.
- TDCTA						- Tabla de numeros de cuenta Debito
- TDCTAAD					- Tabla de adherentes Tarj. Debito
- GXBDBPS.TDEMNOTAR			- Tabla de Tarjetas de Debito.
- TDEMIS					- Tabla de Emisiones
- TDTARREL					- Tabla de Ctas Relacionadas
- TDCTAREL  				- Tabla de Ctas Relacionadas reingenieria
- ATMCENTRE.ATMCSTSDTA 		- Log de ATM Centre)
- TSWOTP					- Almacena datos de nro de tarjeta/pin
- TTCTRJ  					- Tarjeta Credito (maestro de reingenieria)
- TTDEMI  					- Emision (maestro de tarjeta debito reingenieria)
- TTDCAD  					- Adherente (reingenieria)
- GCLIEAF 					- Datos Cliente Tarjeta de Credito (sistema actual)
- TDENTCOM 					- Tabla de Autorizadores de Entidades
- VISA.VIMCC				- Tabla de Categoria de Comercios - MCC Visa
- VISA.VIPOSEM				- Pos Entry Mode Visa
- VISA.VIPOSCOND			- Pos Condition Code Visa
- GXBDBPS.VICNTCDE			- Tabla de Paises
- GXBDBPS.AITCOT			- Tabla de Cotizaciones
- VISA.VISISSLOG			- Log de Mensajes
- VISA.VISCTLDTA			- Datos de Transaccion Visa - Emisor
- VISA.VISTRNDTA			- Datos de Transaccion Visa - Detalles de Programas
- VISA.VISMTADTA			- Codigos de Proceso para Visa
- LIBDEBITO.TBEPAD0P		- Tabla de Entidades y cuentas clearing
- VISA.VSPCEAS				- Archivo de configuraciones del EAS

- MASTERCARD.MASCTLDTA  	- Datos de Transaccion Mastercard -Detalles de Campos
- MASTERCARD.MASTRNDTA  	- Datos de Transaccion Mastercard -Detalles de Programas













