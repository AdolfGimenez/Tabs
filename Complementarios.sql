--complementario
select * from gxopera.comples where cocomer='9002079' COMPLEFECOM='20210219';
select * from gxopera.COMPLESDETALLE C2 where COMPLEFECOM='20210219';

select * from gxopera.oprecle where REUSER='U99MNORMA';-- removi='XDA' AND REFPROC='20210305'
select * from gxopera.copaen2phs where BNFIDUSR='U99MNORMA';--AND REFPROC='20210305'
SELECT * FROM GXOPERA.OPAGO3P C2P WHERE BNFIDUSR='U99MNORMA';

-- complementario
select * from gxopera.comples where COMPLEFECOM='20210219'
select * from gxopera.COMPL00001 where COMPLEFECOM='20210219'

select * from gxopera.oprecle where removi='XDA' AND REFPROC='20210305'

select * from gxopera.copaen2phs where BNFIDUSR='U99RODRIGO' AND REFPROC='20210305'

select * FROM GXTRJDTA.TDGBIN WHERE BINNROBIN LIKE '%547697%'
select * FROM GXTRJDTA.TDGENT ORDER BY ENTCODENT DESC

select * from libdebito.TBBINE0P where QEBI10='627431176'


--Total 3 registros
Update gxopera.oplicre set opcreimpn = 0, OPCRESTAT = '00',  OPCREMEN = 'RECUPERO DE ACRED DUPLICADA FCRE 05/01/2021' where opcrefcom = '20210217' and opcrestat = '91' and opcrecom in
('0800817','1002128','1800312')


--Total 4 registros
Update gxopera.oplicre set opcreimpn = 0, OPCRESTAT = '00',  OPCREMEN = 'RECUPERO DE ACRED DUPLICADA FCRE 05/01/2021' where opcrefcom = '20210317' and opcrestat = '91' and opcrecom in
('0302229','0801281','1002128','1002172')


-- complementario

select * from gxopera.comples where cocomer='9002079' AND COMPLEFECOM='20240311';
select * from gxopera.COMPL00001 where cocomer='9099295'
select * from gxopera.oprecle where removi='XDA' AND REFPROC='20210316' and recomer='9099295'
select * from gxopera.copaen2phs where BNFIDUSR='U99SELENE' AND REFPROC='20210316'



select * from visa.visctldta where date(vimsgdatt) > ('2021-03-17') and substr(v060,1,1) = '9'


select lenemi, count(*)
from libdebito.drconbep where lbinpr = '514848'
group by lenemi


select * from atmcentre.tbbine0p where qebi10 in ('627431162', '627431176')



