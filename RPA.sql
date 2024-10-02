----RPA-----
factura factura1 recibos fcobros

select * from gxopera.trxinst where insemiso = '002'

select * from gxopera.trxinst where INSFACLIEN = '0701335'
delete from gxopera.trxinst

select * from gxopera.flicom
delete from gxopera.flicom

select * from gxopera.flicom1
delete from gxopera.flicom1

select * from gxopera.recibos where rfech >= '20201109'
delete from gxopera.recibos

select * from gxopera.fcobros
delete from gxopera.fcobros

delete from gxopera.factura
delete from gxopera.factura1

select * from contabilid.ccasi19 order by ASFECH desc;
select * from javierlib.ccasi19;
select * from contabilid.ccasi20 order by ASFECH desc;

Select * from gxopera.Factura where FACSTATUS = 'P' and FACSALDO > 0 and FACVENC < 20201111;

select * from libdebito.drconbep where lfcotr = '';

select * from libprod.drconbe60 where lfcotr = '20201109' and limpgs > 0 and substr(lidtra,1,1) = 'P';

select * from libdebito.drconbep where lfcotr = '20201109' and limpgs > 0 and substr(lidtra,1,1) = 'P';

UPDATE GXOPERA.FACTURA
   SET facnroasi = '0'
WHERE facnroasi <> '0';

update gxopera.flicom set LINROASI = '0' where linroasi <> '0'

select * from gxopera.fcobros where comfereal = '20210203';

delete from gxopera.fcobros where comfereal = '20210203';

delete from gxopera.trxinst;

select * from gxopera.fcobros;

select * from contabilid.GE05PRO where prprog = 'CC303R';

SELECT * FROM CONTABILID.GE04NIV WHERE NICOUS = 'U99RPA';

SELECT * FROM CONTABILID.GE03ACC WHERE ACCOUS = 'U99NATI';

UPDATE CONTABILID.GE03ACC SET ACCOUS = 'U99RPA' WHERE ACCOUS = 'U99NATI'

select * from contabilid.TATACUS where tacous = 'U99RPA';

UPDATE contabilid.TATACUS SET tacous = 'U99RPA' WHERE tacous = 'U99NATI';

SELECT * FROM CONTABILID.TATSLAD; --DEPARTAMENTO

SELECT * FROM CONTABILID.TATSEDE; --SECCION

SELECT * FROM CONTABILID.TATEMPR; --DATOS BEPSA

SELECT * FROM CONTABILID.TATMONE; --MONEDA

SELECT * FROM CONTABILID.TATWTIC;

SELECT * FROM CONTABILID.TATGENE; --ENTIDADES

SELECT * FROM CONTABILID.TAT2LTC;

SELECT * FROM CONTABILID.CC21FAD WHERE ;

SELECT * FROM CONTABILID.CC20L01;

SELECT * FROM CONTABILID.CC20FAC;

SELECT * FROM CONTABILID.TAT7PAG;


