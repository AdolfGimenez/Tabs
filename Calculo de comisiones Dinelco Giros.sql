/* TABLAS CON DATOS SENSIBLES DE NRO DE TARJETA*/
select * from GXBDBPS.gclieaf
select * from GXBDBPS.tdcliente
select * from GXBDBPS.tdemis
select * from gxbdbps.tmoviaf
select * from gxbdbps.tcuotaf
select * from gxbdbps.tcuo1af
select * from gxbdbps.AIT002
select * from LIBDEBITO.TGEMBHAF

/* TABLAS DE DINELCO GIROS*/
select * from dcash.dc_0014 /*agentes*/

select * from dcash.dc_bancos /*bancos*/ 
select * from dcash.dc_0012 /*comercios*/campo cmrid cod comercio
select * from dcash.dc_0016 /*movimientos*/
select * from dcash.dc_agentes /*agentes*/
select * from dcash.dc_0014 where agtcmrid='23'/*movimientos*/
/*PAGOS REALIZADOS POR COMERCIO*/
select endfeccom FECHA_ENVIO, agtnomape AGENTE,CMRRAZSOC AGENTE_ENTIDAD, ENDFEPAG FECHA_PAGO,ENDCODOPE COD_REFERENCIA,endimp MONTO_GIRO,endmontot TOTAL_COMISION_coniva,(ENDMONTOT*0.3) COMISION_COMERCIO
from dcash.dc_0016 
inner join dcash.dc_0014  on endagtpgo=agtid inner join  dcash.dc_0012 on cmrid=agtcmrid
where agtcmrid='23' and endfeccom between '20180101' and '20190902'
/*GIROS REALIZADOS POR COMERCIO*/
select --sum(endimp),
* from dcash.dc_0016 
inner join dcash.dc_0014  on endagtid=agtid inner join  dcash.dc_0012 on cmrid=agtcmrid
where agtcmrid='22' 

select * from gxopera.mails
/*CLIENTES CON SU PROFESION*/
select * from dcash.DC_0011 a left join dcash.dc_0010 b on a.pfsid=b.pfsid

select dcash.dc_001
select * from dcash.dc_0016


select * from dcash.dc_0016 WHERE endcodope='D60029221269249'
1 fila retornada
UPDATE DCASH.DC_0016 SET ENDEST='E' WHERE endcodope='D60029221269249'



select * from dcash.DC_0001 pais
select * from dcash.DC_0002 localidad
select * from dcash.DC_0003 departamentos
select * from dcash.DC_0004 departamentos
select * from dcash.DC_0005 bancos
select * from dcash.DC_0006 tipo de documento
select * from dcash.DC_0007 tipo de monedas
select * from dcash.DC_0008 cotizacion
select * from dcash.DC_0009 perfiles
select * from dcash.DC_0010 profesion
select * from dcash.DC_0011 clientes
select * from dcash.DC_0012
select * from dcash.DC_0013
select * from dcash.DC_0014
select * from dcash.DC_0015
select * from dcash.DC_0016
select * from dcash.DC_0017
select * from dcash.DC_0018
select * from dcash.DC_0019
select * from dcash.DC_0020




