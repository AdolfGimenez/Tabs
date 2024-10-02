-- Tabla de asiento
select * from contabilid.ccasi20 where asfech='201130' and ASCOUS='U99DENISSE' AND ASDESC LIKE '%36618%'

-- tablas relacionadas
ccccc20
cctc20
ccmba20

select * from contabilid.ccasi21 where  ASIMPO='22000.00'

select * from contabilid.ccasi21 where asnras='12280'

delete contabilid.ccasi21 where asnras='12280'


select * from yapi.ccasi21hf where asnras='12280'

update yapi.ccasi21hf set ASNRAS='30500'
where asnras='12280'


select max(ASNRAS) from contabilid.ccasi20 where asfech>'201200'

select * from contabilid.ccasi20 where asnras=30500 and asfech>'201200'

select * from contabilid.ccasi20 
where asnras='1934' and asfech=201103

delete contabilid.ccasi20 where asnras='1934' and asfech=201103


select * from contabilid.ccasi20 
where   asfech=201201 and ASCOUS='U99DENISSE' AND ASIMPO='7211723.00'

select * from contabilid.ccasi21
where asfech=210127  and ASCOUS='U99HILKA' AND ASIMPO='15220565.00' and asfech=210127 


select * from contabilid.ccasi21
where ASNRAS='2172'

select * from gxopera.trxinst


SELECT * FROM GXOPERA.FLICOM WHERE LINRO='15387';

delete GXOPERA.FLICOM WHERE LINRO='15387';

SELECT * FROM GXOPERA.FLICOM1 WHERE LINROINS='15387';

delete GXOPERA.FLICOM1 WHERE LINROINS='15387';


-- ayuda para altas


select * from gxbdbps.tdemis where TDBINNRO='627431' and tdbinentid='5110'




select * from gxbdbps.tdemisnov WHERE TDFECHENT='20210304' order by lfectr desc

select * from gxbdbps.DRMAEAF where akenti='110' and AKAQTX like '%ELISA HIDALGO%'

SELECT * FROM LIBDEBITO.EMBDEB0P

SELECT * FROM LIBDEBITO.EMBNOVDIA



select * from gxweb.opliqui
where substr(opcampoa, 41, 8) between '20210701' and '20210731'
and opimpor > 0 and opstatob <> '88' and opnroref
in (Select opnroref from GXWEB.opliqui
where substr(opcampoa, 41, 8) between '20210701'
and '20210731' and opimpor < 0)



select * from gxweb.opliqui
where substr(opcampoa, 41, 8) between '20210701' and '20210731'
and opimpor < 0 and opstatob = ''


select * from GXFINDTA.TCLPFC

