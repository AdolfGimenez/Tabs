/*CONSULTAS PARA VISA ADQ*/   
 select lfectr fecha_real,lhortr hora,substr(lerrnb,2,13) refencia,lbinpr bines,b.vipannmbr tarje_trx,virol rol_visa,
  lcodbc MARCA,lenemi entidad,lesttr estado,lcretr cod_retorno,lcodtr cod_trx, tp.TXDTRX Tipo_Transaccion,limpgs importe,lidcom cod_comercio,b.vif044rmsg mensaje,
  lcomtr comercio,substr(lidtra,1,1) Dispositivo,lnfisc bin_adquirente,vimti mti,lposem metodo_entrada
  --select count(*) cantidad, lcretr cod_retorno,lesttr estado, lfectr fecha_real, lcodbc marca
  from libdebito.drconbep 
  inner join visa.vistrndta b on lerrnb=virrnbepsa
  inner join LIBDEBITO.TBCTRA0P tp ON LCODTR = tp.TXCTRX 
  where lfectr between '20221110' and '20221110' 
--and b.vipannmbr='4224112204226992'
--and substr(lidtra,1,1)='T'
--and substr(lidtra,1,1)='T'
--and lenemi='540'
  and virol ='ADQ' --and vimti='120'
--and lcretr in ('57','19')--,'65','91','96','05')
--and lcretr in ('10')--,'65','05')
--and lbinpr in ('422411')
--and lbinpr in ('488234','456976')
  --and lnfisc in ('472040')--,'','','') --bin adq infonet pos
  --and lnfisc in ('443073')--,'','','') --bin adq infonet atm
  --and lnfisc in ('490786')--,'','','') --bin adq infonet ecommerce
  --and lnfisc in ('486358','434944')--,'','','') --bin adq procard pos
--and lerrnb='213258545507'
  --and lesttr='R'
  --and lhortr between  '164200' and '202400'
  --and vif044rmsg=''
  --and lcodtr in ('011000','012000','013000','014000','000054')
  --and lcomtr like '%Vienesa%'
  --group by lfectr,lcretr,lesttr, lcodbc 
and lhortr >144800
order by lhortr desc
  


SELECT
LFECTR AS "Fecha" ,
LHORTR AS "Hora" ,
LNRTAR AS "Nro Tarjeta" ,
LERRNB AS "Nro. Referencia" ,
LIDCOM AS "Cod. Comercio" ,
LCOMTR AS "Nombre Comercio",
LMCCTR AS "MCC Comercio",
tp.TXDTRX AS "Tipo Transaccion",
LIMPGS AS "Importe" ,
LCRETR AS "Codigo Respuesta"
FROM LIBDEBITO.DRCONBEP
INNER JOIN VISA.VISTRNDTA v ON VIRRNBEPSA = LERRNB
INNER JOIN LIBDEBITO.TBCTRA0P tp ON LCODTR = tp.TXCTRX
WHERE LFECTR = 20220325
AND LCODBC = 'VSA'
AND VIROL = 'ADQ'
AND LCRETR = '57'
AND LBINPR IN ('443078', '425936', '443077')
ORDER BY LFECTR ,LHORTR DESC
;
SELECT MC037 REFERENCIA , MC063 CAMPO_63 FROM MASTERCARD.MASCTLDTA m
WHERE mc037 in('209146717688','209146717627','209146689998','209146680429')

select * from visa.VISctlDTA as A
inner join visa.vistrndta as B on A.VIRRNBEPSA = b.VIRRNBEPSA
where 
vifecreal= '20220426' 
and a.virol='ISA'
and vitdenti='1020'
--and a.virrnbepsa='128495364027'
order by vihorareal desc
--select * from gxbdbps.viadqenti


--SELECT * FROM GXBDBPS.TAUTPAF WHERE APFEREA BETWEEN 20210801 AND 20211010;



select * from gxbdbps.coma1af
where cocomer='0100001'

select * from contabilid.ccasi22




UPDATE GXTRJDTA.TDSSPR
SET PRCIDPROCE='ABMDEBWS ', SPRFHINI='2022-03-17 12:18:50.910', SPRCNTREGP=0, SPRFHFIN='2022-03-17 12:18:25.000', SPRFECHA='20220317', SPRESTADO='C', SPRUSUARIO='RIOWSUSR ', SPRDIRIP='192.168.168.94 ', SPRCNTINVO=22, SPRCODENT=1040, SPRCLIENTE=0, SPRSUCUR=0
WHERE SPRIDSEG=10494;

select * from libdebito.tdctaad where crtarj='4761340000000035'

SELECT * FROM visa.VISCAUDTA WHERE CAVTIPOTRN ='ECOMMERCE '

Tomar un nro RRNN , del campo CAVRRN

select * from gxswtdta.tmiexc where   substr(excnrotar,12,5) like '%4309%'


select * from gxbdbps.tswaut where autpannro='4532117174518929'



SELECT VIROL, v037, VIRRNBEPSA, v060, date(VIREVDATT), v002, v004, DEC(SUBSTRING(v054, 9))
, v039, v042, v043  FROM visa.visctldta a
WHERE V039 = '10' AND date(VIREVDATT) BETWEEN '2021-11-15' AND  '2022-07-28' ;


select * from gxbdcon.gxloperdet



SELECT A.*, B.* FROM gxbdbps.TSWAUT AS A        
    INNER JOIN libdebito.DRCONBEP AS B            
    ON A.AUTRRNBEP = B.LERRNB           
    WHERE A.AUTTRXESTF <> B.LESTTR AND  
          B.LFCOTR = '20220803' AND       
          B.LCRETR = '00';              



select * from libdebito.tbcret0p

select * from libdebito.embnov0p
