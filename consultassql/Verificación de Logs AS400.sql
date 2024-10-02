select * from gxbdbps.tracelog where date(tracts) = '2019-10-10'  
and time(tracts) between '5:45:00' and '8:26:40' and tracpgm like 'MC%' and tracpgm like 'bin=456976'  and tracid>287987103 -- and tracmsg like '%6274313190029523%'

select * from visa.VISTRNDTA where virrnbepsa in ('929419905591','929419920567','929419920732')
select * from atmcentre.debugatmc where date(debugtimst) = '2019-11-29'

select * from mastercard.debugmc where date(debugtimst)='2019-10-10'
select * from atmcentre.debugatmc where date(debugtimst)='2019-11-29' and debugdata like '%%'
select substring(atmcdata, 94, 16) from atmcentre.logatmcent where  date(atmctimst)='2019-11-29' 
select * from atmcentre.logatmcent where  date(atmctimst)='2019-08-29' 
and substring(atmcdata, 10, 4) = '0210' and  substr(atmcdata, 46,2) = '01'  
group by substring(atmcdata, 94, 16)
atmcdata like '%010000%'

300001 identificacion
300002 personalizacion
302000 autorizacion
010000
select * from gxbdbps.bst014 where bs14fectrn='20191009' and bs14pgm='DRIVERBPS'  and bs14marca in ('703002') and BS14RRN IN ('927117381088')
select * from LIBDEBITO.bst022 where BS22KEYFEC='20190928' AND BS22KEYTRA IN '380000' AND BS22CODCOM='1001668'AND bs22KEYRRN='927117381088'  and bs14marca in ('703040','703020')

select * from libdebito.drconbep where lfectr='20190801' and lcodbc in ('MST')  and lcretr in ('91','92','88','XD')  order by lhortr

select * from libdebito.entfil001 where  ENTDATMSG LIKE '%928218908018%' AND  DATE(ENTFECGRA) 
between '2019-10-09' and '2019-10-09' AND  entprogra  IN ('CNXRPGTIGO') AND SUBSTR(entdatmsg, 1, 4) in ('0420','0430') 
 and entprogra



select LCODBC MARCA,COUNT(*) CANTIDAD from libdebito.drconbep 
where lfectr between '20190801' and '20190827'
 and lcodbc in ('MST','VSA')  and lcretr in ('92','XD')
group by LCODBC 

select LCODBC MARCA,substr(lfectr, 1, 6) FECHA,COUNT(*) CANTIDAD 
 from libdebito.drconbep                                         
where lfectr between '20190101' and '20190829'                   
and lcodbc in ('MST','VSA')  and lcretr in ('92','XD')
and lesttr='A' 
group by LCODBC, substr(lfectr, 1, 6)                            
ORDER BY substr(lfectr, 1, 6) ASC               

select * from gxbdbps.bst014 where bs14rrn='928318946890'
select * from libdebito.tbbine0p where qebi10 like '627431%'


select * from visa.VISTRNDTA as A inner join
visa.visctldta as b on a.VIRRNBEPSA = B.VIRRNBEPSA

SELECT *FROM GXBDBPS.LGCOMENT WHERE LGENTID = '1002'







[?13/?11/?2019 17:53]  Jose Alberto Bagnoli:  
select * from libdebito.drconbep where  lenemi = '121' and lesttr = 'A' and lcretr = '91' and lcautr = ' '  
 

select * from gxbdbps.mtdfic


