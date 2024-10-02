SELECT LNRTAR,COUNT (*) cantidad,sum(limpgs)Importe,LFECTR FECHA_REAL,lfcotr fecha_Comercial,lidcom COD_COMERCIO, LCOMTR DENOMINACION, LODESC LOCALIDAD, codtodesc Departamento,LCODBC MARCA,lbinpr BIN,a.LENEMI ENTIDAD,
( case when lenemi  = '530' THEN 'MASTERCARD INTERNACIONAL '  when lenemi  = '560' THEN 'MASTERCARD LOCAL BANCARD'  when lenemi  = '570' THEN 'MASTERCARD LOCAL PROCARD'  when lenemi  = '580' THEN 'MASTERCARD LOCAL BEPSA' when lenemi  = '590' THEN 'MASTERCARD LOCAL OTROS'  end)Descrip_Entidad,LCODTR CODTRX, txdtrx descripcion,LCRETR RETORNO, CODDES DESCRIPCIONRET,LESTTR ESTADO,SUBSTR(LIDTRA,1,1) DISPO
,(CASE
  WHEN LPOSEM ='0710' THEN 'CTLS'
  WHEN LPOSEM ='0510' THEN 'CHIP'
  WHEN LPOSEM in ('9010','9020','910','920' )THEN 'BANDA'
  WHEN LPOSEM ='0100' THEN 'ECOMMERCE'  else 'OTROS' END) MODO_eNTRADA

FROM LIBDEBITO.DRCONBEP a
inner join libdebito.tbctra0p on txctrx = lcodtr
INNER JOIN LIBDEBITO.TBCRET0P ON CODNRO = LCRETR
inner join gxbdbps.comaeaf d on substr(digits(a.lidcom), 6, 7)=d.cocomer 
inner join gxbdbps.colocaf k on d.locodi = k.locodi   
INNER JOIN gxbdbps.CODTOAF X ON (k.CODDTO = X.CODDTO)
WHERE LFECTR BETWEEN  '{?DESDE}' AND '{?HASTA }'  and substr(lidtra,1,1) = 'T' 
AND LCODBC= 'MST' 
AND CODMAR = 'BEPS'  
AND LENEMI IN ('530','560','570','580','590') 
AND LIDCOM <> '100001'
GROUP BY  lidcom , LCOMTR , LODESC , codtodesc ,LCODBC ,lbinpr ,a.LENEMI ,limpgs,
LCODTR , txdtrx ,LCRETR , CODDES ,LESTTR,SUBSTR(LIDTRA,1,1) ,LFECTR,lfcotr,LNRTAR,LPOSEM
order by LFECTR