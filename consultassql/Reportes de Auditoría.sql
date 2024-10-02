Acreditaciones de comercios con enemiso=146
Select opfecom Fecha_Comercial, opcomer cod_comercio, codeno Denominacion,adnumcta Cuenta,
 sum(opmonto-opcomi)Importe from gxopera.opmovi
inner join gxbdbps.comaeaf on opcomer = cocomer
where opfecom between '2018' and '20180831' and enemiso= '151'
group by opfecom, opcomer, codeno, adnumcta
order by opfecom,opcomer,adnumcta,codeno
select * from  gxbdbps.comaeaf where adnumcta='6274311460003558'
--select cocomer,adnumcta,codeno from  gxbdbps.comaeaf where enemiso='146' adnumcta='6274311460003558'

Utilización y saldo
SELECT a.mvemiso Emisor,a.MTNUMTA tarjeta, a.MVNUMCT cuenta ,
b.cenumdo nro_ci,c.cocomer,c.codeno,b.mtnopla titular,
a.mvfepro fecha_real,a.mvtipot Tipo_mov_C_D,a.cmcodig cod_mov,a.MVIMPO2 importe,mvcodre cod_respuesta_trx,
a.mvcodco cod_comercio,substr(a.mvdispo,1,2) dispositivo,a.mvnomco descripcion,a.mvidusr usuario
FROM gxbdbps.tmoviaf a
inner join gxbdbps.tmtaraf b on a.mtnumta=b.mtnumta
inner join gxbdbps.comaeaf c on a.mtnumta=c.adnumcta
WHERE a.mvemiso in ('146')
and substr(cocomer,1,2) not in ('81','86')
and mvnoved not in ('*CONS/ATM') --AND --MVIDUSR NOT IN 'U99OVELAR'
and a.mvfepro between '20150101' and '20151231' and mvcodre=00
order by a.mtnumta,a.mvnumct,a.mvfepro



