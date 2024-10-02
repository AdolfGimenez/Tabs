SELECT LIDCOM COMERCIO, codeno denominacion, codtodesc departamento, lodesc localidad,COENADM COD_ADM, G.ENNOMBR DESCR_ADM,LCODBC MARCA,
LBINPR BIN, count(*) cantidad, sum(limpgs) IMporte, lenemi entidad, F.ennombr desc_entidad, LCODTR COD_TRX, 
TXDTRX DESC_TRX, LFECTR FECHA_REAL, lfcotr FECHA_COMERCIAL, 
CODDES DESCRIPCIONRET, LESTTR ESTADO,LCRETR REtorno,   SUBSTR(LIDTRA,1,1) DISPOSITIVO
FROM LIBDEBITO.DRCONBEP 
inner join gxbdbps.comaeaf a on cocomer =  substr(digits(lidcom), 6, 7)
INNER JOIN libdebito.tbcret0p ON lcretr = CODNRO
inner join libdebito.tbctra0p on txctrx = lcodtr
inner join gxbdbps.colocaf c on a.locodi = c.locodi
INNER JOIN gxbdbps.CODTOAF X ON (C.CODDTO = X.CODDTO)
left join gxbdbps.gentiaf f on lenemi = f.enemiso
left join gxbdbps.gentiaf G on COENADM = G.enemiso
WHERE LFECTR BETWEEN '{?DESDE}' AND '{?HASTA}' 
and codmar = 'BEPS' 
and SUBSTR(LIDTRA,1,1)= 'T'
group by lidcom, codeno, codtodesc, lodesc,COENADM, LCODBC, LBINPR, lenemi, F.ennombr,LCODTR, TXDTRX, 
CODDES,LESTTR, LCRETR, SUBSTR(LIDTRA,1,1), G.ENNOMBR,lfectr,lfcotr 