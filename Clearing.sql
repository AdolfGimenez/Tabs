/*LImpia tablas para reproceso Clearing*/
Select * from gxopera.oprecle where refech ='20190808'
--Delete from gxopera.oprecle where refech ='20190808'
Select * from gxopera.opcomis where opcofer ='20180409'
--Delete from gxopera.opcomis where opcofer ='20190808'
Select * from gxopera.OPSEREX
--Delete from gxopera.OPSEREX
Select * from gxopera.fctacom where ctafecha = '20190808'
--Delete from gxopera.fctacom where ctafecha = '20190808'
Select * from gxopera.OPTADE WHERE OPTDFEC >= '20190808'
--Delete from gxopera.OPTADE WHERE OPTDFEC >= '20190808'
Select * from gxopera.opmovi where opfecom = '20190808'
Select opcomer,opcodtrn, count(*), sum(opmonto), sum(opcomi), sum(opmonto-opcomi) from gxopera.opmovi where opfecom = '20180410' group by opcomer, opcodtrn
--Delete from gxopera.opmovi where opfecom = '20190808'
Select * from gxopera.flicom where lifechd = '20190808'
--Delete from gxopera.flicom where lifechd = '20190808'
Select * from gxopera.flicom1 where lifechd = '20190808'
--Delete from gxopera.flicom1 where lifechd = '20190808'
Select * from gxopera.opliqui 
where substr(opcampoa,41,8) = '20180410'
--Delete from gxopera.opliqui where substr(opcampoa,41,8) = '20190808'
Select * from gxopera.opago0p where pgfcom >= '20200924'
--Delete from gxopera.opago0p where pgfcom >= '20190808'
Select * from gxopera.opago1p where pgfecom >= '20200924'
--Delete from gxopera.opago1p where pgfecom >= '20190808'


Select * from gxopera.opago3p where bnffecom >= '20200924'
--Delete from gxopera.opago3p where bnffecom >= '20200924'
Select * from gxopera.opago3tc where tcfecom >= '20200924'
--Delete from gxopera.opago3tc where tcfecom >= '20190808'
--Delete from gxopera.opago3tc where tcfecom >= '20200924'
Select * from gxopera.opago5p where pgfecom5 >= '20200924'
--Delete from gxopera.opago5p where pgfecom5 >= '20190808'


select * from gxopera.flicom where lifechd='20200924'
order by licomer

delete gxopera.flicom where lifechd='20200924'

select * from gxopera.flicom1 where lifechd='20200924'
order by licomer

delete gxopera.flicom1 where lifechd='20200924'

delete gxopera.oprecle  
where refech='20200924'   

select * from gxopera.OPMOVI
where opfecom='20200924'      

delete gxopera.OPMOVI
where opfecom='20200924'    

select * from gxopera.opcomis  
where OPCOFEC='20200924'   

delete gxopera.opcomis  
where OPCOFEC='20200924'       
      
   

 



select SUM(RECANT), SUM(REMONTO) from hernanlib.oprecle 
select SUM(RECANT), SUM(REMONTO) from yapi.oprecle where reuser not in 'U99OVELAR'


select * from hernanlib.opmovi
select * from yapi.opmovi WHERE OPUSER Not in 'U99OVELAR'

select * from hernanlib.opcomis 
select * from yapi.opcomis 
 


select * from hernanlib.opliqui
select * from yapi.opliqui


select * from hernanlib.opcomis 
select * from yapi.opcomis 

select * from gxbdbps.tctpar


Update libdebito.drconbep set lfcotr = '20200928' where lfcotr = '20200925' and lcodtr in ('000052','000072','567102') and substr(lidtra,1,1) = 'P' 
and lesttr = 'A' and lcretr = '00' and  lenemi in ('571','581','591')
and lerrnb not in (Select opnoref from gxopera.opmovi where opfecom = '20200925' and opcodtrn = '000054' and substr(opidtra,1,1) <> 'T');


Update libdebito.drconbep set lfcotr = '20200928' where lfcotr = '20200925' and lcodtr = '000054' and substr(lidtra,1,1) = 'P' 
and lesttr = 'A' and lcretr = '00' and  lenemi = '530'
and lerrnb not in (Select opnoref from gxopera.opmovi where opfecom = '20200925' and opcodtrn = '000054' and substr(opidtra,1,1) <> 'T');

--tmoviaf 15 trx
select * from gxbdbps.tmoviaf where mvfepro='20200925' and mvemiso in ('332','002','347') and cmcodig in('005','007') and mvcodre=0
update gxbdbps.tmoviaf set mvfepro='20200928' where mvfepro='20200925' and mvemiso in ('332','002','347') and cmcodig in('005','007') and mvcodre=0
--tcuotaf 2 trx
select * from gxbdbps.tcuotaf where cucodau in ('876564','846182') and cufecom='20200925'
update gxbdbps.tcuotaf set cufecom='20200928' where cucodau in ('876564','846182') and cufecom='20200925'
--thmovaf 2trx
select * from gxbdbps.thmovaf where hmfepro='20200925' and hmemiso in ('021','312') and hmcodig='005'
update gxbdbps.thmovaf set hmfepro='20200928' where hmfepro='20200925' and hmemiso in ('021','312') and hmcodig='005'

select * from gxbdbps.tmoviaf where mvfepro='20200925' and mvemiso in ('332','002','347') and cmcodig in('005','007') and mvcodre=0


select * from gxbdbps.tcuotaf where cucodau in ('876564','846182') and cufecom='20200925'


select * from gxbdbps.thmovaf where hmfepro='20200925' and hmemiso in ('021','312') and hmcodig='005'

select *from gxbdbps.tlogsaf where lstipro= 'CLEA' and lsfecha= '20201021'
order by lshora desc

select opcrecba, count(*) from gxopera.oplicre
 where opcrefcom='20201020'
 group by opcrecba
 

select *from gxbdbps.tlogsaf where lstipro= 'CLEA' and lsfecha= '20201215'
order by lshora desc

select * from GXBDBPS.GUSERAF  WHERE USIDUSR='U99OVELAR'


 
 select counT(*) from gxopera.OPMOVI


