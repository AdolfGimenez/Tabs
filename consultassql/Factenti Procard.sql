/*El reporte RESUMEN DE EXTRACCION POR MARCA? realiza un join con la tabla tbinproc y el select que realiza es el siguiente.*/
select sum(cantidad) CANTIDAD, PBIN BIN from libdebito.factenti a
inner join LIBDEBITO.TBINPROC b on bin=pbin
where marca='MST' and lenemi='510' and disposit='T' and substr(CODTRA,1,2) <> '31' and CODRES = '00' 
and BIN <> '425935' and BIN <> '425936' and BIN <> '443076' and estado='A' and ptipproc='BAN' and ptiptar='DEB'
GROUP BY PBIN
/*El Reporte ?DETALLE DE TRANSACCIONES POR MARCA y BIN? no tiene en cuenta la tabla tbinproc y lista todas las transacciones de la tabla Factenti.*/
select sum(cantidad) CANTIDAD, marca MARCA  from libdebito.factenti where lenemi='510'  and BIN <> '425935'-- and marca='MST'
and BIN <> '425936' and BIN <> '443076' and disposit='T' and substr(CODTRA,1,2) <> '31' and codres='00' and estado='A'
GROUP BY MARCA
