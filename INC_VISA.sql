Select count(*)Cantidad, sum(opimpor) Importe, opmensaj Mensaje, opcodbco Banco from gxopera.opliqui
where opfecliq >= '20211130' and substr(opcampoa,1,6) = '703002'
and opstat not in ('00','77','88')
group by opmensaj, opcodbco
order by banco desc,cantidad desc


--detalle--

Select *
from gxopera.opliqui where opfecliq >= '20211130' and substr(opcampoa,1,6) = '703002'
and opstat not in ('00','77','88') --and opcodbco <> 64
order by opcanrei desc

--reporte
select a.opncomer cod_comercio,b.codeno denominacion,b.corucn ruc, b.enemiso banco_pagador,c.pardescri descripcion_banco,
count(*) cantidad_trx,sum(a.opimpor) monto_total,b.coteln telefono,b.coemail mail
from gxopera.opliqui a
inner join gxbdbps.comaeaf b on a.opncomer=b.cocomer
inner join gxopera.clparf c on b.enemiso=c.parcodbco
where opfecliq >= '20211130' and substr(opcampoa,1,6) = '703002'
and opstat not in ('00','77','88')
group by a.opncomer,b.codeno,b.corucn,b.coteln,b.coemail,c.pardescri,b.enemiso
