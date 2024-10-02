/*CONSULTAS PARA MASTERCARD ADQUIRENTE*/                     
select lfectr fecha_real,lhortr hora,substr(lerrnb,2,13) refencia,lerrnb, b.mcpannmbr tarje_mast,lcodbc MARCA,lenemi entidad,
lesttr estado,lcretr cod_retorno,lcodtr cod_trx,limpgs importe,mcmsgtype,MCMIPCONN,--lidcom cod_comercio,
lcomtr comercio,b.mcrol rol,b.mcf044rmsg mensaje,lcautr
from libdebito.drconbep inner join mastercard.mastrndta b on lerrnb=MCRRNBEPSA
--and lbinpr in ('542927','230671','530399') 
where lfectr between '20221121' and '20221121' --and b.mcrrnbepsa='010663493281'
--and lbinpr='230671'
--and lbinpr='601637'
--and lerrnb='217970906625'
--and lcretr in ('91','06')--,'91')
AND mcrol='ADQ' 
--and substr(lidtra,1,1)='P'
---and b.mcpannmbr in ('6230671000137948')--,'5447313236148265','5201328358438365')
--and lcautr in ('013776 ','265964 ','471266')
--and lcretr in ('12','05','57')
--and lcodtr in ('014000')--,'011000','012000')
--and lhortr>190000
--and lcomtr like '%ATM%SUC.%BNF%ITACURUBI%'
--and mcmipconn='MIP ADQUIRENTE SMS 1'
order by lhortr desc



SELECT m.MCROL AS "ROL" , m.MCFLD037 AS "DE037", LHORTR AS "HORA" ,
LNRTAR AS "DE002" , LIDCOM AS "DE042", LMCCTR AS "DE018" ,
LCOMTR AS "DE043", LIMPGS AS "DE004" ,
LCRETR AS "DE039" ,
m.MCF044RCOD AS "Cod Retorno" , trim(m.MCF044RMSG) AS "Retorno",
Trim(m.MCMIPCONN) AS "Conexion", a.CMIPID,
CMIPDIRRMT AS "IP" , CMIPPRTRMT AS "Puerto"
FROM LIBDEBITO.DRCONBEP
INNER JOIN MASTERCARD.MASTRNDTA m ON
m.MCRRNBEPSA = LERRNB
INNER JOIN GXBDBPS.MIPCDTA a ON
m.MCMIPCONN = a.CMIPCONNOM
WHERE LFECTR = 20220706 AND LCODBC = 'MST'
AND m.MCROL = 'ADQ'
and lcretr='91'
and lhortr between '170000' and '200000'
ORDER BY LHORTR DESC

---VER COMPO063 select pedrozo
SELECT mc002, mc037, mc063, MCFECREAL, MCHORAREAL FROM mastercard.mastrndta a inner join
mastercard.masctldta b on a.MCRRNBEPSA = b.MCRRNBEPSA
WHERE MC039 = '91' AND a.MCFECREAL = 20221102;



select * from gxbdbps.lgcoment where date(lgfechor)='2022-03-19'  order by lgfechor desc  and lgmsg like '%207742563304%'
--SELECT * FROM MASTERCARD.SMSADQDEB

--SELECT * FROM mastercard.MIPADQLOG WHERE date(DRVLOGFECH ) = '2022-04-30';



select * from gxbdbps.tmoviaf where mvferea=20220126
--and mvhora>200000
and mvnomco like ('%PRACTI-PAGO%')
--and mvemiso in ('354')--,'','')






select * from libdebito.drconbep where lnrtar='5476970000002400'
select * from gxbdbps.tswaut where autrrnbep in 
(
'217569804332',
'217569808427',
'217569808433',
'217670058530',
'217870206620',
'218574381013',
'218774937916',
'218774938883',
'218774949314',
'218774944900')



select * from gxbdbps.mipcdta


