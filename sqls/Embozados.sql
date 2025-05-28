select * from gxtrjdta.tcadec where CRTFHCORTE >= '2021-12-20 15:18:31' and PRCIDPROCE IN ('PABM005', 'PABM010', 'PABM014', 'PABM041') and DECNOMPLA like 'ELCIDIA FERNANDEZ G.%';
select * from gxtrjdta.tcadec where CRTFHCORTE >= '2021-12-20 15:18:31' and PRCIDPROCE IN ('PABM005', 'PABM010', 'PABM014', 'PABM041') and DECNOMPLA like '%';
select * from gxtrjdta.tcadec where CRTFHCORTE >= '2021-12-20 15:18:31' and PRCIDPROCE IN ('PABM005', 'PABM010', 'PABM014', 'PABM041') and DECNOMPLA like '%';
select * from gxtrjdta.tcadec where CRTFHCORTE >= '2021-12-20 15:18:31' and PRCIDPROCE IN ('PABM005', 'PABM010', 'PABM014', 'PABM041') and DECNOMPLA like '%';
select * from gxtrjdta.tcadec where CRTFHCORTE >= '2021-12-20 15:18:31' and PRCIDPROCE IN ('PABM005', 'PABM010', 'PABM014', 'PABM041') and DECNOMPLA like '%';
select * from gxtrjdta.tcadec where CRTFHCORTE >= '2021-12-20 15:18:31' and PRCIDPROCE IN ('PABM005', 'PABM010', 'PABM014', 'PABM041') and DECNOMPLA like '%';
select * from gxtrjdta.tcadec where CRTFHCORTE >= '2021-12-20 15:18:31' and PRCIDPROCE IN ('PABM005', 'PABM010', 'PABM014', 'PABM041') and DECNOMPLA like '%';
select * from gxtrjdta.tcadec where CRTFHCORTE >= '2021-12-20 15:18:31' and PRCIDPROCE IN ('PABM005', 'PABM010', 'PABM014', 'PABM041') and DECNOMPLA like '%';
select * from gxtrjdta.tcadec where CRTFHCORTE >= '2021-12-20 15:18:31' and PRCIDPROCE IN ('PABM005', 'PABM010', 'PABM014', 'PABM041') and DECNOMPLA like '%';
select * from gxtrjdta.tcadec where CRTFHCORTE >= '2021-12-20 15:18:31' and PRCIDPROCE IN ('PABM005', 'PABM010', 'PABM014', 'PABM041') and DECNOMPLA like '%';
--\\10.12.254.144\Operaciones\CORTEREINGENIERIA\2023
select * from GXTRJDTA.TTCTRJ WHERE TRJIDMARCA IN('5429270000009242','6274310213030124');
--buscar por nro tarjeta
select * from gxtrjdta.tcadec where decnrotrj='5148480000000782';

select DECNOMARCH, count(*) from gxtrjdta.tcadec where CRTFHCORTE >='2022-10-17 10:00:00' and DECESTADO = 'S' and PRCIDPROCE IN ('PABM005', 'PABM010', 'PABM014', 'PABM041')
group by DECNOMARCH;

--tabla de transmicion de detalle debito y credito
SELECT * FROM GXTRJDTA.TDSDTE WHERE SPRIDSEG = 87866;

----embozado opión 20 legacy
SELECT * FROM GXBDBPS.TDEMISNOV
WHERE TDESTNOV = '0'
AND TDFECHPROC = '00000000';

--para corregir horarios
UPDATE GXTRJDTA.TTDEMI SET EMIFHULTUP = '2022-04-21 11:27:00.000' WHERE EMIPROCABM = 'S' ;
--ver Fechas de corte
select * from gxtrjdta.tcacrt order by CRTFHCORTE desc;

--lista de tarjetas de credito
select * from GXTRJDTA.TTCTRJ where TRJNROTRJ='5148480000000782';

--para verificacion de cuenta y cuarta linea
SELECT * FROM GXTRJDTA.TTDEMI WHERE EMINROTRJD IN ('2306710001567743');
SELECT * FROM GXTRJDTA.TTDCDB WHERE CDBIDCTA IN ('5423962513');

SELECT * FROM GXTRJDTA.TTDCAD WHERE CDBIDCTA= '6906994667  ';--CADNOMPLAS LIKE '%JULIO ESPINOLA%'
--where PERNRODOC='3794955';

--WHERE CDBIDCTA IN ('0121014422')
SELECT * FROM LIBDEBITO.EMBNOV0D;
-- para verificar tarjeta de cliente

select * from gxtrjdta.tcadec where DECNOMPLA LIKE 'ADOLFO GIMENEZ%';
--para verificar cantidad de tarjetetas mast o visa
select CRTFHCORTE as FECHA_CORTE, substr(DECNROTRJ, 1, 6) as BIN, DECNROTRJ AS TARJETA, DECIDMARCA AS MARCA, DECIDPRODU AS PRODUCTO, DECNOMPLA AS NOMBRE, DECTPUTRJ as TIPO from gxtrjdta.tcadec
where CRTFHCORTE between '2022-01-01 00:00:00' and '2022-03-23 23:08:31' AND PRCIDPROCE IN ('PABM010','PABM005', 'PABM041') and DECTPNOV ='A' and DECTPGEN= 'E' and DECIDMARCA ='DIN'
order by CRTFHCORTE;
-------------------------------------------------------------------------------------------------------
--ver transmisiones para corte debito
-------------------------------------------------------------------------------------------------------
SELECT * FROM GXTRJDTA.TTDEMI WHERE EMIPROCABM = 'S';
-------------------------------------------------------------------------------------------------------
--ver transmisiones para corte credito
-------------------------------------------------------------------------------------------------------
SELECT * FROM GXTRJDTA.TTCTRJ WHERE TRJPROCABM = 'S';
-------------------------------------------------------------------------------------------------------
--cortar transmisiones para corte credito
-------------------------------------------------------------------------------------------------------
UPDATE GXTRJDTA.TTCTRJ SET TRJPROCABM = 'N' WHERE TRJPROCABM = 'S';
-------------------------------------------------------------------------------------------------------
--cortar transmisiones para corte debito
-------------------------------------------------------------------------------------------------------
UPDATE GXTRJDTA.TTDEMI SET EMIPROCABM = 'N' WHERE EMIPROCABM = 'S';
-------------------------------------------------------------------------------------------------------
--ver ABM
SELECT * FROM GXTRJDTA.TDSTFS WHERE TFSTPARCH IN ('P', 'C', 'T', 'E', 'D', 'R', 'B', 'I') AND TFSFHTRANS >= '2022-05-17 15:31:00';
--actual ver entidades o algo as? jaja
SELECT * FROM GXBDBPS.TDEMIS WHERE TDEMFECALT = '20220426' AND TDBINENTID <> 1040 AND TDBINENTID <> 1020;
-------------------------------------------------------------------------------------------------------
--Correccion de tipo de platico para que genere bien el reproceso de cr?dito
-------------------------------------------------------------------------------------------------------
UPDATE GXTRJDTA.TTCTRJ SET TRJTPPLA='L' WHERE TRJNROTRJ IN('5476970000002632');
-------------------------------------------------------------------------------------------------------
------para cambiar hora debito
-------------------------------------------------------------------------------------------------------
--EMIFHULTUP = '2022-06-23 11:30:46.000';
-------------------------------------------------------------------------------------------------------
------para cambiar hora credito
-------------------------------------------------------------------------------------------------------
--TRJFHULTUP = '2022-06-23 11:06:49.000';
-------------------------------------------------------------------------------------------------------
call pgm(libdebito/EMBRG310);
-------------------------------------------------------------------------------------------------------
SELECT * FROM GXTRJDTA.TCOAUX WHERE AUXFEHO >= '2022-10-24 08:00:00.000' AND AUXEST = 'N';
-------------------------------------------------------------------------------------------------------
--Select para cambiar estado de proceso de  E (ejecucion) a C (culminado)
UPDATE GXTRJDTA.TCACRT
SET CRTESTADO='C'
WHERE CRTFHCORTE='2022-11-22 16:16:37.000' AND CRTSECUE=2;
----
SELECT * FROM GXBDBPS.tdemis WHERE TDCTANRO IN ('2120014172');
/*este es reeeeey
numero de cuenta y listo
*/
--CVV CON ERROR
SELECT * FROM GXTRJDTA.TCATCV t ORDER BY CATCVFCHG DESC;
------------
SELECT CRTFHCORTE, CRTSECUE, PRCIDPROCE, DECNROTRJ, DECNRODET, DECNROCTA, DECCODENT, DECCODAFI, DECIDMARCA, DECIDPRODU, DECTPPLA, DECVENCI, DECVENCEMB, DECNOMPLA, DECESTADO, DECMOERROR, DECNOMARCH, DECUSULTUP, DECFHULTUP, DECTPUTRJ, DECTPNOV, DECTPGEN, DECADHERE, DECNROEMI, DECIDCTA, DECIDSUCU, DECNRODOC, DECORDEMB, DECCUARTLI
FROM GXTRJDTA.TCADEC WHERE CRTFHCORTE='2023-02-20 11:28:21.000' AND CRTSECUE=1 AND PRCIDPROCE='PABM005' AND DECNROTRJ='4224102254000017' AND DECNRODET=1;

