select CRTFHCORTE as FECHA_CORTE, substr(DECNROTRJ, 1, 6) as BIN, DECNROTRJ AS TARJETA, DECIDMARCA AS MARCA, DECIDPRODU AS PRODUCTO, DECNOMPLA AS NOMBRE, DECTPUTRJ as TIPO from gxtrjdta.tcadec
where CRTFHCORTE between '2021-06-01 00:08:31' and '2022-01-05 23:08:31' AND PRCIDPROCE IN ('PABM010','PABM005', 'PABM041') and DECTPNOV ='A' and DECTPGEN= 'E' and DECIDMARCA ='MST'
order by CRTFHCORTE