select count(*) from libdebito.BDBNFENV0P
select * from libdebito.maedinel

select * from gxbdbps.tlogsaf
select lssecue SECUENCIA,lstipro PROCESO, LSIDPRO FEHCA_PROCESO, LSFECHA FECHA_EJECUCION,LSHORA HORA, LSPROG PROGRAMA, LSDESCR DESCRICION
select * from gxbdbps.tlogsaf where lstipro='CLEA' and lsfecha='20211221' ORDER BY LSHORA DESC

select * from gxopera.mails

select * from gxopera.opmovi where opfecom
select sum(opmonto) from gxopera.opmovi where opfecom='20191223' and opcodtrn='014000'
select sum(opmonto) from gxopera.opmovi where opfecom='20191223' and opcodtrn='014000'


select * from gxopera.opago0p group by pgtipo
