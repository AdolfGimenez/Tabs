select * from gxopera.factura where factnro='0010030059349' and faclien='4500145'

update gxopera.factura set FACSTATUS='P'
where factnro='0010030059349' and faclien='4500145'

select * from gxopera.factura where factnro='0010030059350' and faclien='4500145'

update gxopera.factura set FACSTATUS='P'
where factnro='0010030059350' and faclien='4500145'



select * from gxopera.recibos where rid>'920000' and RTOTFACT='150000.00' --921468

select * from gxopera.factura where FACTNRO='10030029011' and faclien='1100217'

select * from gxopera.fcobros where COMNRO='10030029011' and COMCOMER='1100217'



SELECT * FROM GXOPERA.FCOBROS WHERE COMRECNRO='920279'


UPDATE GXOPERA.FCOBROS SET COMFECHA = '00000000', COMNROASI = 0, COMNRORND = 0, COMFECRND = '00000000' WHERE COMRECNRO='920279'




SELECT * FROM GXOPERA.FCOBROS WHERE COMCOMER = '0302262' and comnro=10030046478 and COMIMPOR='56269.00'
SELECT * FROM GXOPERA.FCOBROS WHERE COMRECNRO='920279' 



SELECT * FROM GXOPERA.FCOBROS WHERE COMRECNRO='917400' 



SELECT * FROM GXOPERA.FCOBROS where COMRECNRO='920278'

UPDATE GXOPERA.FCOBROS SET COMFECHA = '00000000', COMNROASI = 0, COMNRORND = 0, COMFECRND = '00000000' WHERE COMCOMER = '0302262' and comnro=10030046478 and COMIMPOR='56269.00'


SELECT * FROM contabilid.TATGENE



SELECT comrecnro FROM GXOPERA.FCOBROS order by  comrecnro desc




select * from gxopera.factura where FACTNRO='10030046478' and faclien='0302262'
select * from gxopera.factura1 where FACTNRO='10030046478' and faclien='0302262'

select * from gxopera.custos

select * from gxopera.custode


select * from gxopera.recibos where rto

SELECT PASVALOR1 FROM GXTRJDTA.TDSPAS WHERE PASIDPARSI = 'DIAHABILRV'


SELECT * FROM GXOPERA.FCOBROS
 where comtipo = 'CR'
        and comrectip= 'RD'
        and comrecnro='920278'


SELECT comrecnro FROM GXOPERA.FCOBROS 
where comtipo = 'CR'
        and comrectip= 'RD'



WHERE COMFEREAL='20210304'
 where 
         comrecnro='1'
         
SELECT * FROM GXOPERA.OPLICRE WHERE OPCRECBA=57
SELECT * FROM GXOPERA.OPLICRE WHERE OPCRECBA=61

select TSBCTCR from gxfindta.tcltsb
where TSBCODSWC='BGNBPYPX'

BGNBPYPX       



select * from gxopera.factura where FACTNRO='10030064959' and faclien='0302262'

select * from gxopera.COMVTMP



Select * from gxopera.opliqui where substr(opcampoa,41,8) between '20210201' and '20210228' and opimpor > 0 and opstatob <> '88' and opnroref in (
Select opnroref from gxopera.opliqui where substr(opcampoa,41,8) between '20210201' and '20210228' and opimpor < 0);

Update gxopera.opliqui set opstatob = '88' where substr(opcampoa,41,8) between '20210201' and '20210228' and opimpor > 0 and opstatob <> '88' and opnroref in (
Select opnroref from gxopera.opliqui where substr(opcampoa,41,8) between '20210201' and '20210228' and opimpor < 0);


Select * from gxopera.opliqui where substr(opcampoa,41,8) between '20210201' and '20210228' and opimpor < 0 and opstatob = '';
Update gxopera.opliqui set opstatob = '88' where substr(opcampoa,41,8) between '20210201' and '20210228' and opimpor < 0 and opstatob = '';



select * from gxbdbps.tmctaaf where mcnumdo='2664432'


select * from gxopera.recibos where rid>'920000' and RTOTFACT='150000.00' --921468

select * from gxopera.factura where FACTNRO='10030029011' and faclien='1100217'

select * from gxopera.fcobros where COMNRO='10030058992' and COMCOMER='1100217'
UPDATE GXOPERA.FCOBROS SET COMFECHA = '00000000', COMNROASI = 0, COMNRORND = 0, COMFECRND = '00000000' where COMNRO='10030058992' and COMCOMER='1100217'

select * from gxopera.fcobros where COMNRORND='14747'
update gxopera.fcobros set COMFECRND='20210222'
where COMNRORND='14747'




