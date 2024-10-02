
select * from gxtrjdta.tcadec where CRTFHCORTE >= '2021-12-20 15:18:31' and PRCIDPROCE IN ('PABM005', 'PABM010', 'PABM014', 'PABM041') and DECNOMPLA like '%'
select * from gxtrjdta.tcadec where CRTFHCORTE >= '2021-12-20 15:18:31' and PRCIDPROCE IN ('PABM005', 'PABM010', 'PABM014', 'PABM041') and DECNOMPLA like '%'
select * from gxtrjdta.tcadec where CRTFHCORTE >= '2021-12-20 15:18:31' and PRCIDPROCE IN ('PABM005', 'PABM010', 'PABM014', 'PABM041') and DECNOMPLA like '%'
select * from gxtrjdta.tcadec where CRTFHCORTE >= '2021-12-20 15:18:31' and PRCIDPROCE IN ('PABM005', 'PABM010', 'PABM014', 'PABM041') and DECNOMPLA like '%'
select * from gxtrjdta.tcadec where CRTFHCORTE >= '2021-12-20 15:18:31' and PRCIDPROCE IN ('PABM005', 'PABM010', 'PABM014', 'PABM041') and DECNOMPLA like '%'
select * from gxtrjdta.tcadec where CRTFHCORTE >= '2021-12-20 15:18:31' and PRCIDPROCE IN ('PABM005', 'PABM010', 'PABM014', 'PABM041') and DECNOMPLA like '%'
select * from gxtrjdta.tcadec where CRTFHCORTE >= '2021-12-20 15:18:31' and PRCIDPROCE IN ('PABM005', 'PABM010', 'PABM014', 'PABM041') and DECNOMPLA like '%'
select * from gxtrjdta.tcadec where CRTFHCORTE >= '2021-12-20 15:18:31' and PRCIDPROCE IN ('PABM005', 'PABM010', 'PABM014', 'PABM041') and DECNOMPLA like '%'
select * from gxtrjdta.tcadec where CRTFHCORTE >= '2021-12-20 15:18:31' and PRCIDPROCE IN ('PABM005', 'PABM010', 'PABM014', 'PABM041') and DECNOMPLA like '%'
select * from gxtrjdta.tcadec where CRTFHCORTE >= '2021-12-20 15:18:31' and PRCIDPROCE IN ('PABM005', 'PABM010', 'PABM014', 'PABM041') and DECNOMPLA like '%'
select * from gxtrjdta.tcadec where CRTFHCORTE >= '2021-12-20 15:18:31' and PRCIDPROCE IN ('PABM005', 'PABM010', 'PABM014', 'PABM041') and DECNOMPLA like '%'
select * from gxtrjdta.tcadec where CRTFHCORTE >= '2021-12-20 15:18:31' and PRCIDPROCE IN ('PABM005', 'PABM010', 'PABM014', 'PABM041') and DECNOMPLA like '%'
select * from gxtrjdta.tcadec where CRTFHCORTE >= '2021-12-20 15:18:31' and PRCIDPROCE IN ('PABM005', 'PABM010', 'PABM014', 'PABM041') and DECNOMPLA like '%'
select * from gxtrjdta.tcadec where CRTFHCORTE >= '2021-12-20 15:18:31' and PRCIDPROCE IN ('PABM005', 'PABM010', 'PABM014', 'PABM041') and DECNOMPLA like '%'
select * from gxtrjdta.tcadec where CRTFHCORTE >= '2021-12-20 15:18:31' and PRCIDPROCE IN ('PABM005', 'PABM010', 'PABM014', 'PABM041') and DECNOMPLA like '%'
select * from gxtrjdta.tcadec where CRTFHCORTE >= '2021-12-20 15:18:31' and PRCIDPROCE IN ('PABM005', 'PABM010', 'PABM014', 'PABM041') and DECNOMPLA like '%'

DHA111VSACLAL002         

--buscar por nro tarjeta
select * from gxtrjdta.tcadec where decnrotrj='2306710001190215'

select DECNOMARCH, count(*) from gxtrjdta.tcadec where CRTFHCORTE >= '2022-04-21 16:00:00' and DECESTADO = 'S' and PRCIDPROCE IN ('PABM005', 'PABM010', 'PABM014', 'PABM041')
group by DECNOMARCH

DHA111MSTCLAL013    	17
 
--para corregir horarios
UPDATE GXTRJDTA.TTDEMI SET EMIFHULTUP = '2022-04-21 11:27:00.000' WHERE EMIPROCABM = 'S' ;
--ver Fechas de corte
select * from gxtrjdta.tcacrt order by CRTFHCORTE desc;
--lista de tarjetas de credito
select * from GXTRJDTA.TTCTRJ;
--para verificacion de cuenta y cuarta linea
SELECT * FROM GXTRJDTA.TTDEMI WHERE EMINROTRJD IN ('4569760000658405');
SELECT * FROM GXTRJDTA.TTDCDB WHERE CDBIDCTA IN ('0107947913  ');

SELECT * FROM LIBDEBITO.EMBNOV0D

-- para verificar tarjeta de cliente

select * from gxtrjdta.tcadec where DECNOMPLA LIKE 'ADOLFO GIMENEZ%'
--para verificar cantidad de tarjetetas mast o visa
select CRTFHCORTE as FECHA_CORTE, substr(DECNROTRJ, 1, 6) as BIN, DECNROTRJ AS TARJETA, DECIDMARCA AS MARCA, DECIDPRODU AS PRODUCTO, DECNOMPLA AS NOMBRE, DECTPUTRJ as TIPO from gxtrjdta.tcadec
where CRTFHCORTE between '2022-01-01 00:00:00' and '2022-03-23 23:08:31' AND PRCIDPROCE IN ('PABM010','PABM005', 'PABM041') and DECTPNOV ='A' and DECTPGEN= 'E' and DECIDMARCA ='DIN'
order by CRTFHCORTE

--tablpoas de emision de entidades
SELECT * FROM GXTRJDTA.TTCTRJ -- tabla tarjeta credito
SELECT * FROM GXTRJDTA.TIDEMI -- tabla tarjeta de debito
SELECT * FROM GXTRJDTA.TTDCAD -- tabla adherente
SELECT * FROM GXTRJDTA.TTDCDB -- tabla cuentas
SELECT * FROM GXBDBPS.TEMBSAF -- tabla de activacion de tarjetas
SELECT * FROM GXTRJDTA.TDGENP -- Entidad Persona
SELECT * FROM GXTRJDTA.TDGPER -- tabla de Persona
SELECT * FROM GXTRJDTA.TDSDTF -- Detalle de transmisiones
SELECT * FROM GXTRJDTA.TDSTFS -- tabla de cabecera de transmisiones
SELECT * FROM GXTRJDTA.TDSSPR -- tabla de trasmisiones pendientes
SELECT * FROM GXTRJDTA.TDSTFS -- tabla de transmisiones
SELECT * FROM GXTRJDTA.TDSSPR -- tabla de tarjeta de debito
select * from GXTRJDTA.TTCTRJ;--tabla de tarjeta de credito
select * from gxtrjdta.tcadec --tabla de corte reing.
Select * from libdebito.tgembhaf -- tabla de corte actual
select * from gxtrjdta.tcaaem -- tabla para ver lo depositado al chip centre

--ver transmisiones para corte debito
SELECT * FROM GXTRJDTA.TTDEMI WHERE EMIPROCABM = 'S';
--ver transmisiones para corte credito
SELECT * FROM GXTRJDTA.TTCTRJ WHERE TRJPROCABM = 'S';
