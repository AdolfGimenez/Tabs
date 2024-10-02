select lfectr,
substr(lerrnb,3,10) id_corto,
lerrnb id_largo,
eneadm||' - '||
(select entdesc from gxopera.opentid where reenti=eneadm) entidad,
lbcocr,
limpgs monto,
(select bnfcred from libprod.bnfextrac where bnfcref=substr(lerrnb,3,10)) bnf_monto,
(select bnfdesc from libprod.bnfextrac where bnfcref=substr(lerrnb,3,10)) bnf_detalle,
(select bnffech from libprod.bnfextrac where bnfcref=substr(lerrnb,3,10)) fecha_bnf,
(select bnfcref from libprod.bnfextrac where bnfcref=substr(lerrnb,3,10)) bnf_ref
from libprod.trx01
where lfectr between '20201101' and '20210131'
and lenemi = '015'
and lesttr = 'A'
and lcretr = '00'
and lcodtr IN ('011000','012000')
and lcodbc = 'VSA'


select * from libprod.trx01 where lerrnb='102936487018'

select * from libprod.bnfextrac


SELECT count(1) FROM GXBDBPS.THMOVAF t;

CPYF FROMFILE(YAPI/REVOT_9643) TOFILE(GXBDBPS/IPMDTAT) MBROPT(*ADD)                   
CPYF FROMFILE(YAPI/REVOU_9643) TOFILE(GXBDBPS/IPMDTATE) MBROPT(*ADD)                    
CPYF FROMFILE(YAPI/REVOP_9643) TOFILE(GXBDBPS/IPMDTATEP) MBROPT(*ADD) 

SELECT * FROM YAPI.REVOT_9643
select * from GXBDBPS.IPMDTAT WHERE ipmmsgrep='S' and ipmmti='1240'  IPMFNAME='R111105559'
select * from GXBDBPS.IPMDTATE where IPMFNAME='R111105559'
select * from GXBDBPS.IPMDTATEP where IPMFNAME='R111105559'





    
select c.* /*OPCOMER AS COMERCIO, CORUCN AS RUC,  ZONADESC AS ZONA, OPSTATUS AS ESTADOTRX, 
       RPRENAME AS REPRESENT , CODENO AS DENOMINACION, OPCODTRN AS TRX,  OPFErea AS Freal, opfecom fcomercial, 
       OPHOTRN AS HORA, OPMONTO AS IMPORTE,  OPNOREF AS REFERENCIA, OPCELU AS CELULAR, SUBSTR(LCTADE,8,9) AS REFTigo*/
from gxopera.opmovi c 
INNER JOIN GXBDBPS.COMAEAF A ON (OPCOMER = COCOMER)
inner join gxbdbps.cozonaf d
on a.zonacodi = d.zonacodi
INNER JOIN gxbdbps.corpraf  ON (RPRECOD = RPRECODI)
INNER JOIN libdebito.drconbep ON (OPCOMER = substr(digits(lidcom), 6, 7) AND OPNOREF = LERRNB AND OPCODAUT = LCAUTR)
  WHERE OPCODTRN IN ('370000', '380000', '390000')
  AND SUBSTR(OPCOMER,1,2) not IN ('45', '79', '1000', '81', '86', '90')
  AND OPSTATUS = 'A'
  AND OPCODRES = '00'
   and opferea BETWEEN '20210101' AND '20210331'
ORDER BY OPFECOM , OPHOTRN
-- REPORTE-- --124241


select * from gxbdbps.comaeaf where SUBSTR(cocomer,1,2)  IN ('80')--, '79', '80', '81', '86', '90')

select count(*) from libdebito.drconbep 
  WHERE lcodtr IN ('370000', '380000', '390000')
  AND SUBSTR(lidcom,1,2) not IN ('45', '79', '80', '81', '86', '90')
  AND lesttr = 'A'
  AND lcretr = '00'
   and lfectr BETWEEN '20210101' AND '20210331'
--123745

select * from gxtrjdta.tcocca

