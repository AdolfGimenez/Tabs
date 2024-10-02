--update para JPOS 

UPDATE GXBDBPS.COMMS
   SET COMMPRIVAL = '10.251.251.250',
       COMMPRITCP = '11001',
       COMMSECVAL = '10.251.251.250',
       COMMSECTCP = '11001'
WHERE COMMID = '02  ';


select * from gxbdbps.comms where commid='02'

 

UPDATE GXBDBPS.TERMINAL SET TERDISOPT = '1111111110000000' WHERE tertid = '14631262';

 

UPDATE GXBDBPS.COMMS
   SET COMMPRIVAL = '10.251.251.250',
       COMMPRITCP = '5010',
       COMMSECVAL = '10.251.251.250',
       COMMSECTCP = '5010'
WHERE COMMID = '02  ';



	select * from libdebito.drconbep where lfectr = '20201213' and leca62 like '%J%'  order by lhortr desc 
	
select * from libdebito.tbcret0p
	

	
	select * from libdebito.drconbep where lfectr = '20201030' 
	and leca62 like '%J%' order by lhortr desc 
	
select * from gxbdbps.comaeaf where cocomer='870740'
select * from libdebito.drconbep where lfectr = '20201030'  and
LACTFJ='14625052'
	

	
select * from gxbdcon.gxlofun where siscodi='TC' order by funcod

select * from gxbdbps.comms where commid='02'

    
--update para JPOS 


UPDATE GXBDBPS.COMMS
   SET COMMPRIVAL = '10.251.251.250',
       COMMPRITCP = '11001',
       COMMSECVAL = '10.251.251.250',
       COMMSECTCP = '11001'
WHERE COMMID = '02  ';


select * from gxbdbps.comms where commid='02'


UPDATE GXBDBPS.TERMINAL SET TERDISOPT = '1111111110000000' WHERE tertid = '14631262';


UPDATE GXBDBPS.COMMS
   SET COMMPRIVAL = '10.251.251.250',
       COMMPRITCP = '5010',
       COMMSECVAL = '10.251.251.250',
       COMMSECTCP = '5010'
WHERE COMMID = '02  ';

-- MAS SENTENCIAS

SELECT lfectr FECHA,lhortr HORA,/*SUBSTR(lnrtar,1,6) || 'XXXXXX' ||SUBSTR(lnrtar,13,4) TARJE*/lnrtar tarje,lexpir VTO,lbinpr bin,
lbcodb,LENEMI ENTIDAD, lcored ,LCODBC MARCA,/*,pdescricion MARCA*/
lesttr ESTADO,lcretr COD_RETORNO,lcuota cuota,lcodtr COD_TRX,limpgs IMPORTE,lcotel celular,--coddes DESCRIP_RET,--lbinpr BIN,--
lerrnb REFE_BEPSA, lidcom COD_COMER,lcomtr LOCAL_COMER, /*txdtrx DESC_TRX,*/LECA62 version_pos,lactfj cod_act,lcautr cod_aut,lidtra--LNFISC,LPOSEM,LMCCTR,LNFACT--,lntoke--, enemiso BANCO,tgdesc DESCRIPCION
from libdebito.drconbep --inner join libdebito.tbinproc on lbinpr=pbin
WHERE lfectr BETWEEN '20201126' AND '20201126'
and substr(leca62,9,10) like ('%J%')  
--and lnrtar =''
--and lhortr>120000
--and lesttr='A' 
--AND LCRETR='06'
--and lcodbc in ('VSA','MST')
--and limpgs>1
--and lcretr='55'
--and lerrnb='031314548333'
--and lidcom='0701689'
--AND SUBSTR(LECA62,1,2)='SP'
--and lcautr ='065389'
--and lactfj='02218065' 
--and lcotel like '%0971954315%'
order by lhortr desc


--select * from libdebito.tbcret0p where coddes like '%TARJETA%'
/*TRANSACCION POR MODELO DE POS */
/*
SELECT LFECTR FECHA, COUNT(*) CANTIDAD,SUBSTR(LECA62,1,2) MOD_POS
FROM LIBDEBITO.DRCONBEP 
WHERE LFECTR BETWEEN '20201110' AND '20201118'
--and substr(leca62,9,10) like ('%J%')  
AND LIDCOM ='0800610'
GROUP BY LFECTR,SUBSTR(LECA62,1,2) 
ORDER BY CANTIDAD DESC
*/


/*TRANSACCION POR TIPO DE POS */
/*
SELECT LFECTR FECHA, COUNT(*) CANTIDAD,SUBSTR(LECA62,1,2) MOD_POS,LACTFJ  activo
FROM LIBDEBITO.DRCONBEP 
WHERE LFECTR between '20201030' and '20201117'
and substr(leca62,9,10) like ('%J%')  
GROUP BY LFECTR,SUBSTR(LECA62,1,2) ,LACTFJ
ORDER BY CANTIDAD DESC
*/

 
select * FROM LIBDEBITO.DRCONBEP
WHERE LECA62='T295' AND LFcoTR='20201127'

and LCODTR IN('011000', '012000', '013000') OR //ADELANTOS
			LCODTR='304000' OR LCODTR='304010' OR LCODTR='311000' OR LCODTR='311100' OR LCODTR='312000' OR LCODTR='321000' OR //CONSULTAS
			LCODTR='401010' OR LCODTR='401020' OR LCODTR='401032' OR LCODTR='402010' OR LCODTR='402020' OR LCODTR='403032' OR //OTROS
			LCODTR='510000' OR LCODTR='520000' OR LCODTR='901020' OR LCODTR='902020' OR //COMPRA DE MINUTOS Y PAGO DE FACTURAS
			LCODTR='000052' OR LCODTR='015000' OR//TIGO MONEY - TIGO COMPANION 
			LCODTR='567101' OR LCODTR='567102'OR//PERSONAL -ENVIO  -BILLETERA
			
[8:17] Jose Pozzo
    

SELECT y.IPMFNAME, CAST(y.IPMDEV AS CHAR(19)) TARJETA,
(SELECT
CAST(z.IPMDEV AS CHAR(5)) FROM GXBDBPS.IPMDTAE z
WHERE z.IPMARN = y.IPMARN AND z.IPMDELN = 26 LIMIT 1) MMC,

(SELECT SUBSTR(w.IPMPDSV, 1 , 12) FROM GXBDBPS.IPMDTAEP w
WHERE w.IPMARN = y.IPMARN AND w.IPMDELN = 48 AND IPMPDSID = 158 LIMIT 1) IRD
FROM GXBDBPS.IPMDTAE y WHERE y.IPMFNAME LIKE 'R1110346%' AND y.IPMDELN = 2


select * from GXFINDTA.tcltsb where TSBESTA = 'RE' and TSBCOME = '040'






