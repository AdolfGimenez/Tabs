select * from gxbdbps.tmoviaf where mvemiso='319' where 
select mtnumta,mvnumct,cmcodig,mvimpo2,0,mvcodco,0,mvnomco from gxbdbps.tmoviaf where mvemiso='319' 
select mtnumta,mvnumct,mvfepro,cmcodig,mvimpo2,mvcupon,mvcodco,MVCODAU,mvnomco from gxbdbps.tmoviaf where mtnumta='6274311460081943' ---mvemiso='319' 

select * from gxbdbps.tcuotaf where mtnumta='6274313190002249' and cucodau='228029'
select * from gxbdbps.tmtaraf where cenumdo='2523211'   mtnumta='6274313190002249' mtnopla like '%ANDRE%ROMERO%' 
select * from gxbdbps.tmctaaf where  mcnumdo='5307681' mcnumct='319030002244'
select * from gxbdbps.tmtaraf where cenumdo='3315549' where  mcnumct='151040000771'
select * from gxbdbps.thmovaf where hmnumct='151040001134'
6274311510000869
select * from gxbdbps.tmtaraf where 
select a.mtnumta tarjeta,a.mcnumct cuenta,mtnopla titular,cenumdo nro_ci,mtstats ESTADO_cuenta,a.blcodig estado_tarjeta,b.mcdisco disponible_contado,b.mcdiscu disponible_cuota,mtfeemi fecha_emision,mtfebaj fecha_baja
--select sum(b.mcdisco)
from gxbdbps.tmtaraf a inner join gxbdbps.tmctaaf b on a.mcnumct=b.mcnumct
where  mcemiso='151' and a.blcodig='00' --and cenumdo='3794955'

select * from gxbdbps.tmctaaf where mcemiso='151' and mcstats='1'
294 filas retornadas.
update gxbdbps.tmctaaf set mcstats='3' where mcemiso='151' and mcstats='1'
294 filas actualizadas.
select * from gxbdbps.tmtaraf where enemiso='151' and mtstats='1'
327 filas retornadas
update gxbdbps.tmtaraf set mtstats='3' where enemiso='151' and mtstats='1'
327 filas actualizadas

select * from gxbdbps.tmtaraf where mtnumta in ('6274311510004226','6274311510004572')

select mcnumct Cuenta,mcstats Estado,mclimco+mclimcu Linea,mcdisco+mcdiscu Disponible_Tabla,(mclimco - (mcsafac + mcsfnve + (mcsaluc-mcaphvt) + mcapcoc + mcapcoa + mccuopc + mccuopa))+  (mclimcu - (mccuope + mcadepe + mcapcuc + mcapcua + mcrefpe)) "Disponible Segun Formula",
mcsaluc Saldo_UC,mcsafac Facturado,mcsfnve F_No_Vencido,mcsalfi Financiado_Tabla, mcsaluc-mcaphvt Fin_Segun_Formula,
mcsalpm Saldo_PM,Mcsalmo Saldo_Mora,mcpagmi Pago_Minimo,mcdiamo Mora,mcupago Ult_Pago,mcfeupg,mcaphvt Acum_Pago_HVTO,mccodsc Sucursal from gxbdbps.tmctaaf 
where mcemiso='151'
--mcsalfi<0 and
--mcnumdo='3876362' and 
mcemiso in ('002','014','015','317','321','324','325','326','327','328','329','330','331','347') and 
mcstats='1' 
select * from libdebito.tbcret0p where codmar='BEPS'

/*TEMPORAL*/
SELECT a.mvemiso Emisor,a.MTNUMTA tarjeta, a.MVNUMCT cuenta ,
b.cenumdo nro_ci,b.mtnopla titular,a.MVFEPRO fecha_proceso,
a.mvferea fecha_real, a.MVIMPO2 importe,mvcodre cod_respuesta_trx,
a.mvcodco cod_mov,a.mvnomco descripcion,a.mvcodau cod_aut,
a.mvnoved novedad,a.mvdispo DISPOSITIVO,a.mvidusr USUARIO
FROM gxbdbps.tmoviaf a
 inner join gxbdbps.tmtaraf b on a.mtnumta=b.mtnumta
WHERE a.mvemiso in ('151')
--('117','118','120','151','155','159','159','160','601','603','606')
and a.mvferea between '20200523' and '20200716'

/*HISTORICO DE MOVIMIENTOS*/ --,'155','117') ORDER BY a.MTNUMTA
SELECT a.hmemiso EMISOR,a.HmNUMTA tarjeta, a.HmNUMCT cuenta ,
 b.cenumdo nro_ci,b.mtnopla titular,a.HmFEPRO fecha_proceso,
 a.Hmferea fecha_real, a.HmIMPO2 importe,
hmcodre Cod_respuesta_trx,a.hmtipot mov_C_D,a.Hmcodco cod_mov,
a.Hmnomco descripcion,a.Hmcodau cod_aut,
a.Hmnoved novedad,a.Hmdispo DISPOSITIVO,a.Hmidusr USUARIO
FROM gxbdbps.thmovaf a 
inner join gxbdbps.tmtaraf b on a.hmnumta=b.mtnumta
WHERE a.hmemiso in '151'-- and b.cenumdo in ('1883250','2523211')
--and a.hmnumta='6274311510001156'
and a.hmfepro between '20180601' and '20181201' ORDER BY a.hmNUMTA
/*HISTORICO DE MOVIMIENTOS*/
SELECT * FROM gxbdbps.thmovaf
WHERE hmemiso='319' ORDER BY hMNUMTA


select * from gxbdbps.tatgene
select *
--mtnumta tarjeta,cunumct cuenta,cucodau cod_autorizacion,cufecom fecha,cuimpor importe,cucancu cant_cuotas,custats estado
from gxbdbps.tcuotaf where cuemiso='319' and cufecom>='20191024'

select * from gxbdbps.nut003


select * from gxbdbps.nut008 where mtBINID in ('400552','420806','456976'); 
select * from gxbdbps.tbineaf where enemiso='162'
update gxbdbps.tbineaf set biuncta = 1960 where enemiso = '162' and bibines = '627431'
select * from gxbdbps.tmctaaf where mcemiso='319' and mcnumct='319030047694' order by mcnumct desc
select * from gxbdbps.tmtaraf where enemiso='319' and mcnumct='319030047694' order by mcnumct desc


select * from gxbdbps.tmctaaf where mcemiso='021' and mcnumct='020120500003' order by mcnumct desc
1 fila retornada
update gxbdbps.tmctaaf set mcsafac=0,mcdisco=0 where mcnumct=020120500003
1 fila actualizada
update gxbdbps.tmctaaf set mcdisco = mclimco - (mcsafac + mcsfnve + mcsalfi + mcapcoc + mcapcoa + mccuopc + mccuopa+mcrefpe) where mcnumct=020120500003
1 fila actualizada

select * from gxbdbps.tmtaraf where enemiso='021' and mcnumct='020120500003' order by mcnumct desc

select * from gxbdbps.tmtaraf where enemiso='021' and mcnumct='020120500003' order by mcnumct desc  


selec * from gxbdbps.thmovaf where 



