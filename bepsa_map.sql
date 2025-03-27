select  a.cocomer as comercio, (CASE WHEN prcodi = '510' THEN coprcodi END ) PROCARD, (CASE WHEN PRCODI = '512' THEN coprcodi END ) CABAL,
(CASE WHEN PRCODI = '508' THEN coprcodi  END ) PANAL,  RUCODI CODRUBRO, RUDESC RUBRO, codeno as NOMBRE, codire1 as Direccion, COTELN TELEFONO,A.LOCODI CODILOCAL,lodesc as Localidad,
 C.CODDTO CODPTO, CODTODESC DEPARTAMENTO, corazo razonsoc, a.zonacodi codigozona, zonadesc descrip_zona, CORUCN RUC, COSTAT CODIGOESTADO,(CASE WHEN COSTAT = '0' THEN 'ACTIVO' 
 WHEN COSTAT = '90' THEN 'BAJA ' WHEN COSTAT = '01' THEN 'OTROS' END) ESTADO, tipacodi cod_tipo, (case when tipacodi = 1 then 'ACREDITACION EN CUENTA ' WHEN TIPACODI = '2' then 'CHEQUE '
 WHEN TIPACODI = '3' then 'TARJETA PREPAGA' WHEN TIPACODI = '0' then 'OTROS'  end) tipopago, a.ENEMISO COD_BANCO, ennombr DESCRIP, a.pecodi codigopago, pedesc pagodescr,
( SELECT  COUNT(AFCODI)  FROM GXBDBPS.COAFMAF H WHERE  H.AFCOMER = A.COCOMER ) pos,
  sum(afmonto) alquiler, cofecalt as fechalta, cofrent fsuspend, coreact freactiv, cofeaniv fbaja, (case when cotarje = '0' then 'NO' else 'SI' end) DEB_DINELCO,
   (case when coalqpos = '3' then  'SI' else 'NO' end) DEB_PROCARD,  COFACTU CTA_FACT,
  COMADRE CTA_MADRE, (CASE WHEN PRCODI = '995' THEN COPRCODI END) BIVALENCIA, ADDESCRE PORC_ADCRE, ADDESDEB PORC_ADDEB,  COFULMOD ULTMODIF, bs15codpro servicio,bs15feclim fhabilita,  (CASE WHEN TIADCODI = 'P' THEN 'POS' WHEN TIADCODI = 'V' THEN  'VOZ' WHEN TIADCODI = 'M' THEN  'D-POS MOVIL' END )TIPO_ADHE
from  GXBDBPS.COMAEAF a
left join gxbdbps.coma1af t 
on a.cocomer = t.cocomer 
left join gxbdbps.colocaf c
on a.locodi = c.locodi
left JOIN gxbdbps.CODTOAF X
ON (C.CODDTO = X.CODDTO)
left JOIN gxbdbps.CORUBAF ON RUCODI = SUBSTR(A.COCOMER,1,2)
left join gxbdbps.cozonaf e on e.zonacodi = a.zonacodi
left JOIN gxbdbps.gentiaf l ON a.ENEMISO = l.enemiso --cod_banco
left join gxbdbps.copepaf f
on (a.pecodi = f.pecodi)
left join gxbdbps.coafmaf o on ( a.cocomer = o.afcomer)
left join gxweb.bst015w on (LTRIM(BS15CODCOM) = a.COCOMER)
where  substr(a.cocomer,1,2) < '90' and costat in ('0', '01') 
and a.cocomer not in ('0200234',
'0701034','4500001','4500003','4500006','4500009','4500012','4500016','4500017','4500018','4500019','4500021','4500022','4500024','4500027','4500032','4500033','4500035',
'4500039','4500040','4500041','4500042','4500043','4500049','4500051','4500057','4500064','4500065','4500067','4500068','4500069','4500071','4500072','4500074','4500076',
'4500080','4500081','4500084','4500085','4500088','4500092','4500094','4500097','4500099','4500100','4500101','4500102','4500105','4500107','4500109','4500110','4500111',
'4500113','4500114','4500115','4500116','4500117','4500118','4500119','4500120','4500121','4500122','4500123','4500124','4500125','5400492','5400493','6500009','8100149',
'8100282','8600442','0100001','1400538','5400041','5400042','5400324','5400326','5400653','5400655','6900001','6900002','6900042','6900097','6900158','6900159',
'6900281','6900282','8099999','8100000','8199999','8600319','4500004','4500005','4500008','4500010','4500011','4500013','4500014','4500020','4500034','4500036','4500044',
'4500045','4500048','4500054','4500056','4500058','4500060','4500063','4500066','4500070','4500077','4500079','4500086','4500087','4500089','4500090','4500091','4500093',
'4500095','4500098','4500103','4500104','4500106','4500112','8000002','8002014','8002017','8002021','8002029','8002034','8002044','8002065','8002073','8002101','8099000',
'8500001','8500002','8500006', '5400617')
group by   a.cocomer, prcodi,coprcodi, RUCODI, RUDESC, codeno, codire1, COTELN, A.LOCODI, lodesc, C.CODDTO, CODTODESC, corazo, a.zonacodi, zonadesc, CORUCN, COSTAT, bs15feclim,
tipacodi, a.ENEMISO, ennombr,  a.pecodi, pedesc, cofecalt,cofrent, coreact,cofeaniv, COFULMOD,  cotarje,  COFACTU, COMADRE, ADDESCRE, ADDESDEB, TIADCODI, COPRCODI, COALQPOS, bs15codpro
