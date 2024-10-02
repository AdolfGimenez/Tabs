select * from libdebito.drconbep where leca62 = 'T001'and lfectr between '2021' order by lfectr desc;

select * from libdebito.drconbep where lfectr = '20210315' and lcodbc = 'MST' order by lhortr desc;

select * from gxweb.opmovi where opferea between '20201101' and '20210315';

select * from gxweb.drcon180 
where alfectr between '20201101' and '20210315'

select * from libdebito.drconbep where lfectr = '20210316' order by lhortr desc;

Select ENTCODENT as Banco_Comercio, ENRBCOPAGA Banco_Pagador from gxtrjdta.TDGENR;

