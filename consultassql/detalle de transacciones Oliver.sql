select  tdacome comercio, codeno denominacion, codtodesc dpto,corucn ruc, corazo razon, lodesc localidad,  
ZONADESC ZONA, tdamark marca, sum(tdacant) cantidad, tdaenti, b.enemiso, ennombr descr, tdaesta estado, tdacore retorno, tdatipo dispo, tdacotr codtrx, coddes desc1
from gxopera.tdavistas a
inner join gxbdbps.comaeaf  b on (cocomer = tdacome)
inner join gxbdbps.colocaf c
on b.locodi = c.locodi
inner join libdebito.tbcret0p on codnro = tdacore
INNER JOIN gxbdbps.CODTOAF d
ON (c.CODDTO = d.CODDTO)
inner join gxbdbps.cozonaf F on B.zonacodi = F.zonacodi
left join gxbdbps.gentiaf  x on x.enemiso =tdaenti
where tdaanho =  '2022' and tdames between '05' and '05' and tdadias between '20' and '20'
and corucn <> '80011012-9'
and tdacome <> '0100001' 
and codmar = 'BEPS'
and tdamark in ('VSA','MST')
and tdacore<>'00'
and tdatipo IN ('P', 'G') and tdacotr in ('000054')
group by tdacome, codeno,  corucn, corazo, codtodesc, lodesc, ZONADESC,  tdamark, tdaenti, b.enemiso, tdaesta, tdacore, tdatipo,tdacotr, ennombr , coddes


--DETALLE--
SELECT lfectr FECHA,lidcom COD_COMERCIO,LCOMTR DESC_COMERCIO,COUNT(*) CANT,
LENEMI ENTIDAD, LCODBC MARCA,lesttr ESTADO,lcretr COD_RETORNO,lbinpr BIN,LENEMI EMISOR,/*coddes DESCRIP_RET,*/
lcodtr COD_TRX,substr(leca62, 1, 6) VERSION
from libdebito.drconbep 
--inner JOIN libdebito.tbcret0p ON lcretr = codnro
--inner join libdebito.tbctra0p on lcodtr=txctrx
WHERE lfectr BETWEEN '20191001' AND '20191031' 
and substr(lidtra, 1, 1)='T' 
and lcodtr in ('000052', '011000', '012000','013000','014000')
--and substr(leca62, 1, 2) in ('VX','SP','A ') 
and lidcom<>'0100001' and limpgs>1000
AND LCRETR in ('00')
GROUP BY lfectr,lidcom,LCOMTR,LENEMI,LCODBC,
lesttr,lcretr,/*,coddes,*/lcodtr,substr(leca62, 1, 6),LBINPR,LENEMI

--RESUMEN--
select substr(leca62, 1, 6) VERSION, count(*) CANT
from libdebito.drconbep 
--inner JOIN libdebito.tbcret0p ON lcretr = codnro
--inner join libdebito.tbctra0p on lcodtr=txctrx
WHERE lfectr BETWEEN '20191001' AND '20191031' 
and substr(lidtra, 1, 1)='P' 
and lcodtr in ('000052', '000054', '567102')
and substr(leca62, 1, 2) in ('VX','SP','A ') 
-- AND lesttr='A'
--AND LCRETR<>'00'
and lidcom<>'0100001' and limpgs>1000
GROUP BY substr(leca62, 1, 6)
VX0675	193363
VXEVOC	290496
VX0520	113856
SPT100	549468
