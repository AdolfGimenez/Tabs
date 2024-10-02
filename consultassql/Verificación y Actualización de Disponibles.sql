/*PARA VERIFICACION LUEGO DEL CIERRE DE TARJETAS*/
select a.mcnumct "Cuenta",b.mtnumta Tarjeta, b.mtnopla Titular, mcstats "Estado", mclimco+mclimcu "Linea", mcdisco+mcdiscu "Disponible Tabla", 
(mclimco - (mcsafac + mcsfnve + mcsalfi + mcapcoc + mcapcoa + mccuopc + mccuopa))+  (mclimcu - (mccuope + mcadepe + mcapcuc + mcapcua + mcrefpe)) "Disponible Real"
from gxbdbps.tmctaaf a LEFT join gxbdbps.tmtaraf b on a.mcnumct=b.mcnumct
  where mcstats='1'
/*Actualizar saldo financiado*/
select * from gxbdbps.tmctaaf where mcnumct='347030001817'
1 fila actualizada
update gxbdbps.tmctaaf set mcsalfi=3004089 where mcnumct='347030001817'
1 fila actualizada
/*Disponible contado*/
update gxbdbps.tmctaaf set mcdisco = mclimco - (mcsafac + mcsfnve + mcsalfi + mcapcoc + mcapcoa + mccuopc + mccuopa) where mcnumct='347030001817'
1 fila actualizada
/*Disponible cuotas*/
update gxbdbps.tmctaaf set mcdiscu = mclimcu - (mccuope + mcadepe + mcapcuc + mcapcua + mcrefpe) where mcnumct='347030001817'
1 fila actualizada


select * from gxbdbps.mtdfic


--REPORTE DE MOVIMIENTOS CIERRE ACTUAL----
select a.mvferea,a.mvhora,b.MTNUMTA,b.mtnopla,b.cenumdo,mvnumct,mvnomco,mvcodco,mvnoved,mvimpo2,mvcodau,mvdispo,mvcodre,mvcupon
from gxbdbps.tmoviaf a inner join gxbdbps.tmtaraf b on a.mtnumta=b.mtnumta where mvemiso='151'

--REPORTE DE MOVIMIENTOS DE HISTORICO----
select a.hmferea,a.hmhora,a.hmNUMTA,b.mtnopla,b.cenumdo,hmnumct,hmnomco,hmcodco,HMnoved,HMimpo2,HMcodau,HMdispo,HMcodre,HMcupon 
from gxbdbps.tHmovaf a inner join gxbdbps.tmtaraf b on a.HMnumta=b.mtnumta where hmemiso='151' and hmferea between '20190901' and '20191112'

Select pgidtrn,pgidtrn,pgfetrn, pgfecre from yapi.opago1p11o where pgfecre = '20191111' /*Primer envio*/
Select pgidtrn,pgidtrn,pgfetrn, pgfecre from yapi.opago1p112 where pgfecre = '20191111' /*Segundo envio*/ 
 
select mcnumct,mcnumta,mcdisco,mcsuspe from gxbdbps.tmctaaf  where mcemiso='021' and mcnumdo=3519445


select * from gxbdbps.tmctaaf  where mcemiso='021'
