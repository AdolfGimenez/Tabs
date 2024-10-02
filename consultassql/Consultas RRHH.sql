Select SBCOCA, sbcode, SUM(SBSAAS) PSuperior from contabilid.sjsbmes  where SBAAMM = '201908' and SUBSTR(sbcoca,1,2) in(Select tgcode 
from contabilid.tatgene where tgalfa = 'CC' and tgindi = '1')GROUP BY SBCOCA, SBCODE;  -- PERSONAL SUPERIOR sin descontar ips
Select sum(sbsaas),SUM(sbsaba-sbboni)Personal from contabilid.sjsbmes  where SBAAMM = '201908' and sbcode = 'PE' and sbcoct <> 'CT';  -- Personal
Select SUM(SBSAAS)ServiciosPersonales from contabilid.sjsbmes  where SBAAMM = '202012' and sbcoct = 'CT'; --Servicios Personales sin descuento
Select SUM(SBboni)Bonificacion from contabilid.sjsbmes  where SBAAMM = '202012';  -- Bonificación Familiar 
Select sum(sbhex1),sum(sbex50), sum(sbhex2), sum(sbex10)from contabilid.sjsbmes  where SBAAMM = '201908'  and sbcode = 'TE';  --Horas Extras
Select SUM(SBSAAS), SUM(SBSADE) Descuento, SUM(SBSAAS-SBSADE)SueldoaPagar from contabilid.sjsbmes  where SBAAMM = '201908' and sbcode = 'PE'; --sueldos a pagar
Select MOCODE, mocomo,trdesc,SUM(MOIMPO) from contabilid.sjmovim inner join contabilid.tatraem on mocomo = trcomo where MOAAMM = '201908' GROUP BY MOCODE, mocomo, trdesc --Total por TIpo de movimiento

Select * from contabilid.sjsbmes  where SBAAMM = '202012' and  sbcoem='158';

delete  from contabilid.sjsbmes where SBAAMM = '202012' and  sbcoem='158';

select * from contabilid.ficlien where clcodo='PE' and clcocl='342'
select *  from contabilid.sjdpers inner join contabilid.ficlien on  dpcoem=clcocl where clcodo='PE' and clcocl='342'


select clcocl cod_pe,clnomb nombre,clapel apellido,dpfeie fecha_ingreso, dpsaip from contabilid.sjdpers 
inner join contabilid.ficlien on  dpcoem=clcocl where clcodo='PE' --and dparea='05'-- and clcocl='342'
--and CLNOMB like '%AZUCENA%'
--AND CLAPEL LIKE'%ROJAS%'
order by clcocl desc


SELECT * FROM gxswtdta.TMITHD WHERE THNROTAR like  '%4569760000229587%' 


select * from gxbdbps.comaeaf where cocomer='1001851'

select * from gxbdbps.tmensaf where enemiso='354'


select * from gxopera.opliqui where opfecliq between '20211001' and '20211101' and opncomer='1001851'

select * from gxfindta.tcltsb where tsbcoco='1001851'


select * from libdebito.drconbep where lfectr between '20210101' and '20211101' and lidcom='0703668'


select * from joseeelib.tmctaaf where mcemiso='354' and MCAFINI='001' and MCFUVTO='20211105'

update gxbdbps.tmctaaf set MCFUVTO='20211105' where mcemiso='354' and MCAFINI='001' and MCFUVTO='20211102'


UPDATE contabilid.ccmba21 SET MBSITU = 'A'
 WHERE substr(digits(mbfech), 3, 2) = '11' and mbsitu <> 'A'
 

SELECT * FROM contabilid.ccmba21 WHERE substr(digits(mbfech), 3, 2) = '11' and mbsitu <> 'A'


SELECT * FROM CONTABILID.CCASI22 ORDER BY ASFECH DESC
