Select * from libdebito.drconbep where lnrtar = '6274310029300101' and substr(lidtra, 1, 2)='PX' order by lfectr desc

Select * from gxbdbps.SECPINOFF where SECOPAN='62743100293001012'



SELECT A.LNRTAR AS TARJETA, A.LFECTR AS FECHA_TRX,
A.LBINPR AS BIN,
A.LCOMTR AS COMERCIO, A.LCODTR AS CODIGO,
A.LERRNB as REFERENCIA,
A.LCAUTR AS COD_AUT, A.LCOTEL AS TELEFONO,
B.CRNOMB AS NOMBRE, B.CRDOCU AS CI, C.COMPMIN,
C.PAGFACT, C.CONSSAL,
C.ACRESAL, C.SMSTRAN, C.FECMODI AS FECHA_MODIF
FROM LIBDEBITO.DRCONBEP A
INNER JOIN libdebito.tgembhaf B
ON LNRTAR = CRTARJ
INNER JOIN gxdebito.TGSVBEP C ON CRDOCU = CLIENTID
WHERE     LCODTR  = '304010' AND LCODBC = 'DIN'
AND LBINPR = '703002' AND LCRETR ='00' AND LESTTR = 'A'
AND LFECTR BETWEEN '20201101' AND '20210128'


SELECT * from gxdebito.TGSVBEP
ORDER BY CLIENTID


SELECT lnrtar as TARJETA, lfectr as FECHA, LBINPR AS BIN,
LCOMTR as COMERCIO, LENEMI AS ENTIDAD
FROM LIBDEBITO.DRCONBEP
WHERE
LBINPR = '703002' AND LCRETR ='00' AND LESTTR = 'A'
AND LFECTR BETWEEN '20201101' AND '20210128'



SELECT * from libdebito.tgembhaf  where CRBINE='703002' and crvenc>='2101'

SELECT * from gxbdbps.gdireaf where cenumdo='2651190'



SELECT a.lnrtar, b.crnomb, max(b.crvenc)
FROM LIBDEBITO.DRCONBEP a inner join libdebito.tgembhaf b
ON a.LNRTAR = b.CRTARJ
WHERE
LBINPR = '703002' AND LCRETR ='00' AND LESTTR = 'A'
AND LFECTR BETWEEN '20201101' AND '20210128'
group by a.lnrtar,  b.crnomb

SELECT *
FROM LIBDEBITO.DRCONBEP INNER JOIN libdebito.tgembhaf
ON LNRTAR = CRTARJ
INNER JOIN gxdebito.TGSVBEP ON CRDOCU = CLIENTID
WHERE     LCODTR  = '304010' AND LCODBC = 'DIN'
AND LBINPR = '703002' AND LCRETR ='00' AND LESTTR = 'A'
AND LFECTR BETWEEN '20201101' AND '20210128'



SELECT B.CRDOCU, a.lnrtar, b.crnomb, c.TDLOCAL, max(b.crvenc)
FROM LIBDEBITO.DRCONBEP a inner join libdebito.tgembhaf b
ON a.LNRTAR = b.CRTARJ   inner join gxbdbps.tdcliented c
on crdocu=TDCLINRODOC
WHERE
LBINPR = '703002' AND LCRETR ='00' AND LESTTR = 'A'
AND LFECTR BETWEEN '20201101' AND '20210128'
group by B.CRDOCU, a.lnrtar,  b.crnomb, c.TDLOCAL

select * from gxbdbps.tdcliented where tdbinentid='1002';

SELECT a.lnrtar, b.crnomb, max(b.crvenc)
FROM LIBDEBITO.DRCONBEP a inner join libdebito.tgembhaf b
ON a.LNRTAR = b.CRTARJ
WHERE
LBINPR = '703002' AND LCRETR ='00' AND LESTTR = 'A'
AND LFECTR BETWEEN '20201101' AND '20210128'
group by a.lnrtar,  b.crnomb;

select * from libdebito.tgembhaf where crenti='002' and crbine='703002'
and crfege between '20190102' and '20200901';

select crdocu as CI, crtarj as TARJETA, crnomb as NOMBRE,
CRSUCU AS SUCURSAL, AIAOTX as LOCALIDAD
from libdebito.tgembhaf
inner join LIBDEBITO.CTAIREP ON CRSUCU = AIAGCD
where crenti='002' and crbine='703002'
and crfege between '20190102' and '20200901' AND CRCODN='2'

--insert en base a un select
INSERT INTO LIBDEBITO.TAUREV
SELECT L.ENRRNB                                                REVRRN,
       '703002'                                                REVBIN,
       '1002'                                                  REVENT,
       CURRENT_DATE                                            REVFECH,
       '114142'                                                REVHORTR,
       '240125'                                                REVFECTR,
       '0420' || L.ENCODO || L.ENTRK2 || ENCTAD || ENCTAC || ENFECC || ENFECR || ENHORR || ENMONE || ENIMPO ||
       ENIMPD || ENTRID || ENSTAN || ENTCC || ENMCCO || ENNAME LREVMSG,
       'P'                                                     REVEST,
       '0420'                                                  REVMTI,
       '  '                                                    REVRET,
       'U99ADOLFO'                                             REVUSAC,
       CURRENT_DATE                                            REVFEAC;




