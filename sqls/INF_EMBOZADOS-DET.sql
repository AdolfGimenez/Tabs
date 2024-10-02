select SUBSTR(crtarj,1,6)||'XXXXXX'||SUBSTR(crtarj,13,4) TARJETA,  CRDOCU CEDULA, CRENTI ENTIDAD, ENTBINA DESCRIP,crclat afinidad, enttipo tipo, crfege fechage,crcodn CODIGO,(case when crcodn = 1 then 'ALTAS'
when crcodn = 2 then 'REGRABACIÓN CC-NRO Y VTO.'
when crcodn = 3 then 'REGRABACIÓN SC-NRO Y VTO.'
when crcodn = 4 then 'RENOVACIÓN POR VTO.'
when crcodn = 5 then 'IMPRESION DE PIN.'
when crcodn = 6 then 'RENOVACIÓN ESP CCN/CVTO.'
when crcodn = 7 then 'RENOVACIÓN ESP SCN/CVTO.'
end )detalles
from libdebito.tgembhaf
left join gxopera.opentid1 on crenti = entcodi and crbine = substr(entbin, 1,6)
where  substr(crfeej,1,4) = '{?anho}'
and  substr(crfeej,5,2) between  '{?MESD}' and  '{?MESH}'