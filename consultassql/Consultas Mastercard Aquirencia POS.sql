/*select A.*, B.* FROM MASTERCARD.MASCTLDTA AS A INNER JOIN MASTERCARD 
.MASTRNDTA AS B ON A.MCRRNBEPSA = B.MCRRNBEPSA AND A.MTI = B.MCMTI   
INNER JOIN LIBDEBITO.DRCONBEP AS C ON A.MCRRNBEPSA = C.LERRNB AND    
A.MC038 = C.LCAUTR AND B.MCIMPORTE = C.LIMPGS AND                    
B.MCFECCOM =  '20200429'                                         
WHERE MC039 = '00' AND A.MTI = 0110 AND B.MCROL = 'ADQ' AND          
B.MASIPMPRC <>'S' AND B.MCIMPORTE > 0 AND                            
C.LFCOTR = '20200429'


select A.*, B.* FROM MASTERCARD.MASCTLDTA AS A INNER JOIN MASTERCARD 
.MASTRNDTA AS B ON A.MCRRNBEPSA = B.MCRRNBEPSA AND A.MTI = B.MCMTI   
INNER JOIN LIBDEBITO.DRCONBEP AS C ON A.MCRRNBEPSA = C.LERRNB AND    
A.MC038 = C.LCAUTR AND B.MCIMPORTE = C.LIMPGS AND                    
B.MCFECCOM =  '20200429'                                         
WHERE MC039 = '00' AND A.MTI = 0110 AND B.MCROL = 'ADQ' AND          
B.MASIPMPRC ='S' AND B.MCIMPORTE > 0 AND                            
C.LFCOTR = '20200429'
*/



select * from gxbdbps.lgcoment where date(lgfechor)='2022-05-01' and  lgentid='1020' order by lgfechor desc and lgmsg like '%12155725300%';
select *from visa.VISISSLOG where date(vislogdatt)='2021-07-30' and vislogdta  like '%Field 037  ->015075035288%' 
select *from visa.VISISSLOG where date(vislogdatt)='2020-05-29' and vislogrrn ='1676566' and vislogdta  like '%Field 037  ->015075035288%' 
*/

VISA
select * from VISA.VIStrnDTA where  vipannmbr like '%4882340010048861%'
select * from VISA.VISCTLDTA where substr(V002,1,6)='456976' and VIrrnbepsa='015577275171'
MASTERCARD

select * from MASTERCARD.MASCTLDTA where date(mcrevdatt)='2022-06-18' and mcrevcod='91'
-- and substr(MC002,1,6)='230671'
and MCrrnbepsa='134110517683'


SELECT mc002, mc037, mc063, MCFECREAL, MCHORAREAL FROM mastercard.mastrndta a inner join
mastercard.masctldta b on a.MCRRNBEPSA = b.MCRRNBEPSA
WHERE MC039 = '91' AND a.MCFECREAL = 20220618 ;

SELECT mc002, mc037, mc063, MCFECREAL, MCHORAREAL FROM mastercard.mastrndta a inner join
mastercard.masctldta b on a.MCRRNBEPSA = b.MCRRNBEPSA
WHERE MC039 = '91' AND a.MCFECREAL = 20220618 ;


select * from MASTERCARD.MAStrnDTA where mcfecreal='20220218' --and MCPANNMBR like '%2306710001000182%'
and mcf044rcod in '9091'
--and mcfld037 in ('134110612898','134110612907','134110612917','134110612929')
and substr(mcpannmbr,1,6) ='230671'--0001027904%' 
order by mchorareal  desc 





--Detalle 
select mcfecreal fecha_real, mchorareal hora_py_gmt_4, mcrol rol, mcmti mti,mcpannmbr tarjet, mcfld037 referencia_037, mcmovseq mc_seq,  mcica ica,mcimporte monto, mcmsgtype msgtype, 
mcmipconn mipconn, mcf044rcod,mcf044rmsg  from MASTERCARD.MAStrnDTA 
where mcfecreal='20220216'
--and mcf044rcod in '9091'
--and mchorareal>192400
--and mcfld037='134310802816'
and mcpannmbr like '%2306710001035543%' 
--and substr(mcpannmbr,1,6)  in ('558549','558548') 
order by mchorareal desc




SELECT CMIPDTQCMD, a.* FROM GXBDBPS.MIPCDTA a WHERE cmipdtqcmd like
'%MIPRCVDTA%'

--agrupado 
select count(*), mcf044rcod,mcf044rmsg from MASTERCARD.MAStrnDTA
where mcfecreal='20211209'
--and mcf044rcod in '9091'
and mchorareal between 192400 and 195900
group by mcf044rcod,mcf044rmsg


 order by mcfecreal desc  MCrrnbepsa='017480961743' --reversa 420 430
substr(MC002,1,6)='601639' and 
--log de verificacion de transacciones con el Transaction Procesor--
select * from hsttrnproc.trnprcdeb where date(prcdebtim)='2020-06-22' order by prcdebtim desc

select * from gxbdbps.lgcoment where date(lgfechor)='2022-02-16'  and lgmsg like '%2887721564%'
 order by lgfechor desc
*/


/*
select * from VISA.VISCTLDTA where substr(V002,1,6)='488234' and VIrrnbepsa IN (
'003045807115','003447612461','003246965524','003548151865','005952552240','006053465648',
'006354815206','006955960313','007056150043','007156393180','007256660616','007256650768',
'007256649774','008558473324','008759082564','008759041273','009060467570','008859754434',
'010863909962','011967525189','011867399514','012068314549','012068313650','012068311679',
'012068311539','012068307746','012068234502','012068135213','012068133950','012068133177',
'012068132475','012068129915','012067951704','011967881993','012168925379','012168925198',
'012168923216','012168922353','012168921483','012168868375')
*/

/*
select * from gxbdbps.lgcoment where lgentid='1020' and lgmsg like '%02125169581%'
*/





SELECT * FROM LIBDEBITO.LOGPOS0P lp
 WHERE ENV512 LIKE '%5462970000000038%';


Select tsbdeop, tsbesta, tsbdeme, count(*) cantidad, sum(tsbimpo)Importe
from gxfindta.tcltsb where date(tsbfege) >='2022-08-17' --and tsbesta not in ('AC','RE')
group by tsbdeop,tsbesta, tsbdeme
