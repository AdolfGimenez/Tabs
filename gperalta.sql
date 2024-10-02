select * from gxbdbps.tdcliente where tdclinrodoc in ('3567643');
select * from gxbdbps.tdcliented where  tdclinrodoc in ('3567643');
select * from gxbdbps.tdemnotar where nenrotarj = '627431000000000'
select * from gxbdbps.tdemisnov WHERE tdctanro in ('0000001570530000');
select * from gxbdbps.tdemis where tdctanro in ('1000022001');
select * from gxbdbps.tdctaad where tdctanro in ('0000001570530000');
select * from gxbdbps.tdcta where tdctanro in ('0000001570530000');
select * from gxbdbps.atdemis where aecta in ('0000001570530000');


select * from libdebito.drconbep where lfectr = '20210317' and lenemi = '177';

select * from gxbdbps.tdmov where movlerrnb in(
select lerrnb from libdebito.drconbep where lbinpr = '627431' and lfectr = '20210222' and lenemi = '174');

select * from gxbdbps.tdmov 
where movlerrnb in (
105300139492,
105300139703,
105300139705,
105300139491,
105300139673,
105300139493,
105300139707,
105300139702,
105300139495,
105300139669,
105300139498);

select * from libdebito.drconbep 
where lerrnb in (
'105300139492',
'105300139703',
'105300139705',
'105300139491',
'105300139673',
'105300139493',
'105300139707',
'105300139702',
'105300139495',
'105300139669',
'105300139498')

[12:36 p.m.] Gabriela Peralta
    
SELECT * FROM LIBDEBITO.DRCONBEP WHERE LFECTR= 20210222 AND LHISOR= 'InG/Hyp' AND LHISDE= '*SITC'   AND LEXTAR= '0' AND LCODBC= 'DIN' ORDER BY LHORTR DESC;
?[12:39 p.m.] Gabriela Peralta
    
select * from gxbdbps.tdmov where tdbinentid = '5177' and movfectr = '20210309';

select * from libdebito.drconbep where lfectr = '20210309'

select * from libprod.drconbe60 where lfcotr = '20210219' and lbinpr = '703020' and lcretr = '00' and lesttr = 'A' and lidcom = '801174';

select * from libdebito.drconbep where lfectr = '20210309' and lenemi = '177' order by lhortr desc;

select * from gxbdbps.tdmov where MOVLERRNB in (
select lerrnb from libdebito.drconbep where lfectr = '20210309' and lenemi = '177')
order by movhortr desc;

select * from gxbdbps.tdemis where TDEMCTA like '%1000022001%'
