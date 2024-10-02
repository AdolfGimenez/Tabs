select  tdacome comercio, codeno denominacion, codtodesc dpto,corucn ruc, corazo razon, lodesc localidad,  ZONADESC ZONA, tdamark marca, 
sum(tdacant) cantidad, sum(tdaimpo) importe, tdaenti, b.enemiso, ennombr descr, tdaesta estado, tdacore retorno, coddes desc1, tdacotr codtrx,TXDTRX DESCRIP_TRX, tdatipo dispo
from gxopera.tdavistas a
inner join gxbdbps.comaeaf  b on (cocomer = tdacome)
inner join gxbdbps.colocaf c on b.locodi = c.locodi
inner join libdebito.tbcret0p on codnro = tdacore
inner join LIBDEBITO.TBCTRA0P on TXCTRX = tdacotr
INNER JOIN gxbdbps.CODTOAF d ON (c.CODDTO = d.CODDTO)
inner join gxbdbps.cozonaf F on B.zonacodi = F.zonacodi
left join gxbdbps.gentiaf  x on x.enemiso =tdaenti
where tdaanho =  '{?anho}' and tdames between '{?MESD}' and '{?MESH}' and tdadias between '{?DIAD}' and '{?DIAH}'
and corucn <> '80011012-9'
and tdacome <> '0100001' 
and codmar = 'BEPS'
and tdatipo IN ('T') --and tdacotr in ('011000', '012000', '013000', '015000', '000052','567102'  )
group by tdacome, codeno,  corucn, corazo, codtodesc, lodesc, ZONADESC,  tdamark, tdaenti, b.enemiso, tdaesta, tdacore, tdatipo,tdacotr, ennombr , coddes,TXDTRX

