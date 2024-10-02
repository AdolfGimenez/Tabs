SELECT PGFECRE,PGCODMV,Sum(PGIMPOR) IMPORTE, pgtipo,pgidusr,pgcomer,pg
--SELECT *  
from gxopera.opago1phis
--where pgidusr='U99NATI'
where pgfecre = '20200626' --and pgimpor=-- 
--PGCOMER='4500003'
group by pgtipo,PGFECRE,PGCODMV,pgidusr,pgcomer
select sum(pgimpor) from gxopera.opago1phis where pgfecre = '20200626' and  pgcomer='4500003'
delete from gxopera.opago1phis where pgfecre = '20191121' --and pgimpor=-- 

SELECT count(*),PGFECRE,PGCODMV,sum(PGIMPOR),pgtipo,pgidusr
from gxopera.opago1phis --where
 pgfecre = '20191111' --AND PGCOMER='4500003'
group by pgtipo,PGFECRE,PGCODMV,pgidusr

select * from gxopera.opago0p
select pgtipo,sum(pgimpo) from gxopera.opago0p --where pgfcre='20191223'
group by pgtipo
select sum(pgimpo),pgcmov  from gxopera.opago0ph
group by pgcmov

SELECT * from gxopera.opago1p
select * from libdebito.copago0p
--delete from libdebito.copago0p
select * from joseeelib.opago0p
--delete from joseeelib.opago0p
select *  from gxopera.opago3p
--delete from gxopera.opago3p
select sum(bnfimpor),bnfidusr from gxopera.opago3p group by bnfidusr
select *  from gxopera.opago1p
group by pgcmov

SELECT * from gxopera.opago1phis where  pgfecre = '20191112' --AND PGCOMER='4500003'
group by pgtipo,PGFECRE,PGCODMV

SELECT PGCODMV,sum(PGIMPOR), pgtipo
--select *
from gxopera.opago1phis where
 pgfecre between  '20191112' and '20191114'-- AND PGCOMER='4500003'
group by pgtipo,PGCODMV

SELECT * FROM GXOPERA.opago1phis where pgfecre = '20191111'

SELECT PGFETRN,sum(pgimpor), pgtipo
from joseeelib.OPAGO1111O where
 pgfecre = '20191111'
group by PGFETRN,pgtipo



SELECT * FROM gxopera.opago1phis
 WHERE pgfecre = '20191111'

COPIAR AL OPAGO1P Y LUEGO BORRAR DEL HISTORICO TODO LO DE LA FECHA 11

select * from GXOPERA.OPAGO0PH where pgfcre='2019-11-12'
141.752.211
242.609.691

1946
SELECT * FROM GXOPERA.OPAGO1P  GROUP BY PGTIPO
SELECT PGIMPOR,PGTIPO,pgidusr FROM yapi.OPAGO1P13  GROUP BY PGTIPO,pgidusr
**************************************************************************************
Trabajo:   BNF_ADELAN     Número de entrada:   000028     Estado:   SCD
**************************************************************************************
COPAEN2PHS => TEMPORAL OPAGO3P =>   Entidades 
--HISTÓRICO
--TOTAL
SELECT * FROM gxopera.COPAEN2PHS where bnfcomer='4500003' bnffecre='20200626' 
--delete FROM gxopera.COPAEN2PHS where bnffecom='20200625'
--DETALLE
SELECT * FROM gxopera.COPAEN2PHS where bnffecom='20200625'
--agrupado
SELECT sum(bnfimpor),bnffecre,count(*) FROM gxopera.COPAEN2PHS
 where bnffecre between '20200629' and '20200629'
 group by bnffecre
SELECT sum(bnfimpor),bnffecre,COUNT(*) cant FROM gxopera.OPAGO3P
 where bnffecre between '20200629' and '20200629'
 group by bnffecre
----****TEMPORAL****-----
select * from gxopera.OPAGO3P
_________________________________
OPAGO3TCH => TEMPORAL OPAGO3TC   *
__________________________________
--detalle 
select * from GXOPERA.OPAGO3TCH where tcfecom='20200625' and  tccomer='4500003'
--delete  from GXOPERA.OPAGO3TCH where tcfecom='20200626'
select * from GXOPERA.OPAGO3TC where tcfecom='20200625'
select sum(tcimpor) from GXOPERA.OPAGO3TC where tcfecom='20200625' and  tctipo='C'
delete from GXOPERA.OPAGO3TC where tcfecom='20200625' and  tctipo='C'
--agrupado 

select tccodmv, TCTIPO, COUNT(*) cant_registros,sum(tcimpor)  importe
from gxopera.OPAGO3TCH where tcfecom='20200625'
group by tccodmv,tCTIPO
359	C	34	4623230000.00
859	D	15	638740000.00

select tccodmv, tcentid, TCTIPO, COUNT(*),sum(tcimpor), TCOBSER from GXOPERA.OPAGO3TCH where tcfecom='20200626'
group by tccodmv,tcentid, TCTIPO, TCOBSER
ORDER BY TCTIPO, TCENTID

select tccodmv, tcentid, TCTIPO, COUNT(*),sum(tcimpor),
TCOBSER from gxopera.OPAGO3TCH where tcfecom='20200730'
group by tccodmv,tcentid, TCTIPO, TCOBSER
ORDER BY TCTIPO, TCENTID

select * from yapi.OPAGO3phf
select * from yapi.OPAGO3TCHF
SELECT * FROM YAPI.OPAGO3TCHF A inner JOIN yapi.OPAGO3TC B ON A.TCENTID=B.TCENTID WHERE b.tcfecom='20200626'
select tccodmv, sum(tcimpor)  from GXOPERA.OPAGO3TC where tcfecom='20200626'
group by tccodmv
select tccodmv, sum(tcimpor)  from GXOPERA.OPAGO3TC where tcfecom='20200626'
group by tccodmv

select tccodmv, sum(tcimpor)  from yapi.OPAGO3TChf where tcfecom='20200626'
group by tccodmv
__________________________________
OPAGO5PH => TEMPORAL OPAGO5P=> CNB pago a comercios por movimientos CNB
__________________________________
--detalle 
select * from GXOPERA.OPAGO5PH where pgfecom5='20200730'
--delete from GXOPERA.OPAGO5PH where pgfecom5='20200626'
select * from GXOPERA.OPAGO5p where pgfecom5='20200730'
--agrupado
select pgcodmov5, COUNT(*), sum(pgimpor5)  from GXOPERA.OPAGO5PH where pgfecom5='20200626'
group by pgcodmov5
select pgcodmov5, COUNT(*), sum(pgimpor5)  from GXOPERA.OPAGO5P where pgfecom5='20200626'
group by pgcodmov5
**************************************************************************************
**************************************************************************************

SELECT * FROM GXOPERA.OPAGO3P
SELECT * FROM LIBDEBITO.COPAEN0P
UPDATE  GXOPERA.OPAGO3P SET BNFTIPO='D', BNFCODMV='959'
**************************************************************************************
**************************************************************************************
Multiclearing pago a Comercios
select * from libdebito.copago0p
select * from libdebito.COPAGO0P where pgcmov='1' group by pgcmov,pgenti
select pgenti,sum(pgimpo),pgcmov from libdebito.COPAGO0P group by pgcmov,pgenti

**************************************************************************************
**************************************************************************************
SELECT * FROM yapi.OPAGO1P13
SELECT pgfetrn,pgfecre,SUM(PGIMPOR),PGTIPO,pgidusr FROM gxopera.OPAGO1phis where pgfecre='20191112'
GROUP BY PGTIPO,pgfecre,pgfetrn,pgidusr
SELECT * FROM YAPI.OPAGO1P11O
SELECT * FROM YAPI.OPAGO1PREV
SELECT SUM(PGIMPOR),PGTIPO FROM YAPI.OPAGO1PREV
GROUP BY PGTIPO
/*
************para cambiar de Credito a Debito y de Debito a Credito***************
UPDATE gxopera.opago1p SET PGCODMV = '959'
WHERE pgfecre = '20191111' AND PGTIPO = 'C' 

UPDATE gxopera.opago1p SET PGCODMV = '459'
WHERE pgfecre = '20191111' AND PGTIPO = 'D' 

UPDATE gxopera.opago1p SET PGTIPO = 'C'
WHERE pgfecre = '20191111' AND  PGCODMV = '459'

UPDATE gxopera.opago1p SET PGTIPO = 'D'
WHERE pgfecre = '20191111' AND  PGCODMV = '959'
*/
select * from yapi.OPAGO3P13 where bnfnrocta=8191198


select sum(pgimpor5),pgtipo5 from gxopera.opago5p group by pgtipo5



**************************************************************************************
Trabajo:   ENVIO_BNF  05    CONTABILIDAD BNF julio  1507  paula 1641
**************************************************************************************
113643
SELECT count(*) FROM LIBDEBITO.BDBNFENV0P where substr(lidtra,1,1)='T' and eneadm='002' 45478
SELECT * FROM LIBDEBITO.BDBNFENV0P
select * from LIBDEBITO.BDBNFENV0H where lfcotr='20201123' 
delete from LIBDEBITO.BDBNFENV0H where lfcotr='20201123' 
delete from LIBDEBITO.BDBNFENV0H where lfcotr='20201123' 
delete LIBDEBITO.BDBNFENV0P where  eneadm<>'002' and substr(lidtra,1,1) in ('A','P')

SELECT substr(lidtra,1,4) Cajero,count(*) cantidad,sum(limpgs),lesttr estado
 FROM LIBDEBITO.BDBNFENV0P WHERE LFCOTR='20201123' and lcretr='00' and lesttr='A' and ENEADM ='002'
group by substr(lidtra,1,4),lesttr



SELECT substr(lidtra,1,4) Cajero,count(*) cantidad,sum(limpgs),lesttr estado
 FROM LIBDEBITO.BDBNFENV0H WHERE LFCOTR='20201123' and lcretr='00' and lesttr='A'--and ENEADM ='002'
group by substr(lidtra,1,4),lesttr



CPYF FROMFILE(YAPI/BNF0170611) TOFILE(LIBDEBITO/BDBNFENV0H) MBROPT(*ADD) FMTOPT(*MAP *DROP)
CPYF FROMFILE(LIBDEBITO/BDBNFENV0P) TOFILE(LIBDEBITO/BDBNFENV0H) MBROPT(*ADD)  

SBMJOB CMD(SBMJOB CMD(CPYF FROMFILE(LIBDEBITO/BDBNFENV0P) TOFILE(LIBDEBITO/BDBNFENVDM) MBROPT(*REPLACE)) USER(BEPSA)) USER(BEPSA)                         

select * from libdebito.tbctra0p
select lfectr fecha_real,lhortr hora,lnrtar tarje,limpgs importe,lcodtr trx_cod,txdtrx trx_descrip
--select *
from LIBDEBITO.BDBNFENV0H 
inner join libdebito.tbctra0p on lcodtr=txctrx 
where lfectr>='20160101' and substr(lfectr,1,4)='2016' and lnrtar in ('7030020054384210','7030020048810502','7030020052835105')
and lcodtr in ('902020','901020')


**************************************************************************************
Trabajo:   BNF_ADELAN     CONTABILIDAD BNF julio  1507  paula 1641
**************************************************************************************



SELECT COUNT(*), OPCRECBA, opcrecrei,sum(opcreimpn)
FROM GXOPERA.OPLICRE WHERE OPCREFCOM = '20201123'
GROUP BY OPCRECBA,opcrecrei




CREATE INDEX GXOPERA.UOPLIQUI2 ON GXOPERA.OPLIQUI (
      OPNCOMER,
      OPCAMPOA,
      OPSTATOB);


CREATE INDEX GXBDBPS.UCOMAEAF1 ON GXBDBPS.COMAEAF(
      ENEMISO ASC,
      TIPACODI ASC,
      COCOMER ASC);
      

select * from gxtrjdta.tenecx
