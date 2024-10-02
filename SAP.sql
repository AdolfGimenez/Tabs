-----------PERSONAL COMPRA MINUTOS - PAGO FACTURA-----------
select lfcotr as FECHA_CIAL, lfectr as FECHA_REAL, lhortr as hora, lcotel as numerolinea, lcodtr as Operacion,
limpgs as importe,SUBSTR(lerrnb,7,12) as Boleta, substr(lidtra,1,1) as Dispo
from libdebito.drconbep 
where LFECTR='20201219'  --SUBSTR(lfECtr,1,4)||'-'||SUBSTR( lfECtr,5,2)||'-'||SUBSTR( lfECtr,7,2) = DATE(CURDATE()-1 days) -- fecha real
and lcored = '971' 
and lcretr = '00' and lesttr = 'A'
and lcodtr  in ( '901020', '902020', '514000', '524000', '510000', '520000')
AND LCOTEL='0972517716'
------------------------------------------------------------
select  OPFEREA FECHAREAL, OPFECOM FECHACOMER, lctade cuentades, opstatus Estado, OPCOMER COMERCIO, OPCODTRN CODTRX, OPMONTO MONTO,
OPCOMI COMISION, OPCOMENT COMENTIDAD, OPENEMI, RUCODI CODRUBRO, RUDESC, entbina
from   GXOPERA.OPMOVI INNER JOIN GXBDBPS.CORUBAF ON substr(opcomer, 1, 2) = RUCODI
inner join gxopera.opentid1 on OPENEMI = entcodi
inner join LIBDEBITO.drconbEp on ( OPENEMI=LENEMI AND  OPCODAUT=LCAUTR   and opnoref = lerrnb )
where   opcodtrn in ('000054', '901020', '902020', '510000', '520000')
AND OPFECOM BETWEEN '20201201' AND '20201231'
--and SUBSTR(opfecom,1,4) =  YEAR(NOW())
--AND SUBSTR(opfecom,5,2) =  MONTH (NOW() -1 MONTH)
AND OPENEMI = '581'

select  OPFEREA FECHAREAL, OPFECOM FECHACOMER, lctade cuentades, opstatus Estado, OPCOMER COMERCIO, OPCODTRN CODTRX, OPMONTO MONTO,
OPCOMI COMISION, OPCOMENT COMENTIDAD, OPENEMI, RUCODI CODRUBRO, RUDESC, entbina
from   GXOPERA.OPMOVI INNER JOIN GXBDBPS.CORUBAF ON substr(opcomer, 1, 2) = RUCODI
inner join gxopera.opentid1 on OPENEMI = entcodi
inner join LIBDEBITO.drconbEp on ( OPENEMI=LENEMI AND  OPCODAUT=LCAUTR   and opnoref = lerrnb )
where   opcodtrn in ('000054', '901020', '902020', '510000', '520000')
AND OPFECOM BETWEEN '20201201' AND '20201231'
--and SUBSTR(opfecom,1,4) =  YEAR(NOW())
--AND SUBSTR(opfecom,5,2) =  MONTH (NOW() -1 MONTH)
AND OPENEMI = '152'

SELECT * FROM ;}
