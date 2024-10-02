--RETENCIONES

select * from gxopera.retcom where RETPROCESADO='0' and RETID<='70090'

update  gxopera.retcom  set RETPROCESADO='1'
where RETPROCESADO='0' and RETID<='70090'
