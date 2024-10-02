select * from libdebito.drconbep where lfectr='20201011' and lcodtr in ('370000', '380000', '390000')

select * from libdebito.drconbep where lfectr='20201220' order by lhortr

	select * from libdebito.drconbep where lfectr between '20201014' and '20201015' and limpgs='0.00' and lenemi in ('002', '317', '321', '324', '325', '326', '327', '328', '329', '330', '331', '347')
	
SELECT * FROM GXFINDTA.TCLTSB WHERE TSBESTA = 'RE'

	select * from libdebito.drconbep where lfectr = '20201213' and loritr='A' order by lhortr desc 


select * from libdebito.drconbep where lfectr='20201022' and lcodtr in ('370000', '380000', '390000') and limpgs='120000' and lcotel='0986272556'

	select * from gxopera.opliqui where opfecliq='20201030' and opncomer in ('6900263', '8600337')
	
select * from libdebito.drconbep where lfectr='20201111' and lbinpr='456976' and limpgs>'0' and lcomtr like '%FUTURO%'

select * from visa.vistrndta where VIPANNMBR='4569760000000467'

select * from visa.visctldta where V002='4569760000000467'

select * from  GXBDBPS.SWTDEST where destid='175'



INSERT INTO GXBDBPS.SWTDEST
(
DESTID,
DESTPEK,
DESTPGM,
DESTLIB,
DESTFMT,
DESTCOMRE,
DESTXLATE,
DESTCOD
)
VALUES
(
'175',
' ',
'CNXRG400 ',
'LIBDEBITO ',
'QDATO ',
'N',
'N',
'*BEPSA '
);

select * from libdebito.drconbep where leca62='T360' AND lfectr='20201207' and lcodtr='902020'    
select * from libdebito.drconbep where leca62='T360' AND lfectr='20201210' and lcodtr='902020' 

select * from gxopera.opmovi  where opferea='20201210' and opcodaut='549266'

select * from gxbdbps.tdbinemb where TDENTID='1020'



select S* from libdebito.BDBNFENV0H where lfcotr='20201217' and lesTtr='R'

select substr(lidtra,1,4) atm,count(*),sum(limpgs),lesttr
from LIBDEBITO.BDBNFENV0P where substr(lidtra,1,1)='T' and eneadm <>'000'
group by substr(lidtra,1,4),lesttr
order by substr(lidtra,1,4) asc


select * from gxbdbps.tmtaraf where enemiso='021' and MTSTATS='1'


select * from gxbdbps.tmtaraf where enemiso='021' and MTSTATS='1' and mtreten<>'N'

update gxbdbps.tmtaraf set mtreten='N' where enemiso='021' and MTSTATS='1' and mtreten<>'N'


select * from gxopera.opmovi  where opferea='20201207' and opcodaut='549266'

update gxopera.opmovi set OPCELU='0992549266'
where opferea='20201207' and opcodaut='549266'

select * from gxopera.opmovi  where opferea='20201210' and opcodaut='549266'

update gxopera.opmovi set OPCELU='0992549266'
where opferea='20201210' and opcodaut='549266'


update gxopera.opmovi set OPCELU='0992549266'
where opferea='20201207' and opcodaut='549266'

update gxopera.opmovi set OPCELU='0992549266'
where opferea='20201210' and opcodaut='549266'



select * from libdebito.drconbep where LERRNB='024096367698'
delete libdebito.drconbep where LERRNB='024096367698'

delete libdebito.drconbep where LERRNB='024096367698'


select * from gxbdbps.tdmov where MOVLERRNB='024096367698'

delete gxbdbps.tdmov where MOVLERRNB='024096367698'


select * from libdebito.drconbep where lfectr='20201215' and loritr='A' and limpgs='1500000' and lhortr between '173500' and '174000' and lcautr='709091'

--
