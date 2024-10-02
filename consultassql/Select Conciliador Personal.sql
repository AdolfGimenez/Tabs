select substr(lerrnb,2,14) referencia ,lfectr fecha,lhortr hora,limpgs importe,lcretr retorno,lesttr estado
from libdebito.drconbep
WHERE lfcotr BETWEEN '20200810' AND '20200810'
--and lcretr in ('00')
and lesttr in ('A','R')
and lcodtr='567102'
--and lhortr>=190000
and lerrnb in (
'022393127235','022393127018','022393126572','022393126090','022393124666','022393124573',
'022393124472','022393124238','022393123926','022393123632','022393121055','022393120974',
'022393120789','022393120589','022393120185','022393119868',
'022393119611','022393119222','022393119141','022393119109','022393119080')

order by lhortr desc



--select * from gxbdbps.ATMCTXDEST where atmcid='T0200475'

--select * from gxbdbps.bst014

select * from gxbdbps.comaeaf where cocomer='0800432'


/*Reintentos 10/08/2020*/
Update gxfindta.tcltsb set tsbesta = 'PE', tsbctcr = '2901376406' where tsbcoco = '0700493' and tsbcome = '008' AND tsbcodswd = tsbcodswc; --NO EXISTE  CUENTA (104 REGISTROS)
Update gxfindta.tcltsb set tsbesta = 'PE' where tsbcome = '015' AND tsbcodswd = tsbcodswc AND TSBTPOP = '02'; --Cuenta no Catastrada (3 REGISTROS)
