select * from gxfindta.tcltsb;

select * from gxopera.oplicre;

select * from gxfindta.tclmov where MOVOPDE <> '0' and SERCODI in ('CICO');

select * from libclea.tclmov where SERCODI in ('ADELANTO') and movfpro = '20210511';

select * from GXFINDTA.tclmov where SERCODI in ('ADELANTO') AND MOVFPRO = '20210503';

select * from gxfindta.tcl


select * from gxfindta.tclser;

select * from libdebito.drconbep where lerrnb = '';

select count(auttrxfchc), auttrxfchc from gxbdbps.tswaut
where auttrxfchc > '20210401'
group by auttrxfchc


SELECT * FROM GXFINDTA.TCLCNE;

