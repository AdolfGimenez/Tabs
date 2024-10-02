/*TALBAS DE AUDITORIA PCI */

select * from libdebito.drconbep; ok 1
 where tdclinrodoc='2551575'; ok 3
select * from gxbdbps.tdcliente  
select * from gxbdbps.tmoviaf  where mvfepro>'20200101'  and substr(mtnumta,1,1)='2'; ok 4
select * from gxbdbps.tcuotaf  where substr(mtnumta,1,1) in ('2','5','4')  ; ok 5
select * from gxbdbps.ait002  
select * from gxbdbps.tmctaaf  where substr(mcnumta,1,6)  in ('420806','488234','456976','230671') ; borrado
select * from gxbdbps.tmtaraf  where substr(mtnumta,1,6)  in ('420806','488234','456976','230671') ; borrado
select * from gxbdbps.thextraf  where substr(henumta,1,6)  in ('420806','488234','456976','230671') ; borrado
select substr(hmnumta,1,4) bin from gxbdbps.thmovaf where substr(hmnumta,1,6)  in ('420806','488234','456976','230671') ;

select * from libdebito.tgembhaf 
select * from libdebito.embtrkvis    ; borrado
select * from gxbdbps.tdcta                                                                where  substr(tdctatar,1,6)  in ('420806','488234','456976','230671') ;
select * from gxbdbps.tdctaad   ;

select * from gxbdbps.tmovpag  where substr(mpntar,1,6)  in ('420806','488234','456976','230671') ; 

select * from gxtrjdta.ttdemi where substr(eminrotrjd,1,6)  in ('420806','488234','456976','230671') ;
update gxtrjdta.ttdemi set eminrotrjd=(SUBSTR(eminrotrjd,1,6) || 'XXXXXX' ||SUBSTR(eminrotrjd,13,4));
select * from gxbdbps.ait002 ;
aitctrjnro
select * from visa.vistrndta    ;
update visa.vistrndta set vipannmbr=(SUBSTR(vipannmbr,1,6) || 'XXXXXX' ||SUBSTR(vipannmbr,13,4));
select * from visa.visctldta    ;
update visa.visctldta set v002=(SUBSTR(v002,1,6) || 'XXXXXX' ||SUBSTR(v002,13,4));

select * from visa.easissdeb    ;
select (SUBSTR(vislogdta,1,20) || 'XXXXXX' ||SUBSTR(vislogdta,26,29)) from visa.visisslog where substr(vislogdta,1,9) = 'Field 002'   ;
select *  from visa.visisslog where substr(vislogdta,1,9) = 'Field 002'   ;
update visa.visisslog
set vislogdta =(SUBSTR(vislogdta,1,20) || 'XXXXXX' ||SUBSTR(vislogdta,25,29))
where substr(vislogdta,1,9) = 'Field 002'   ;






update gxbdbps.gclieaf set ceapnom='NOMBRE Y APELLIDO' 
select TKEnti Entidad, tkclat Clase, Tkbine BIN, Tkstat Estado, 
TKUses Usuario_proceso,tkfees Fecha_Proceso, tkhoes Hora_proceso,tktrak
from libdebito.EMBTRKDEB
where tkstat='P' and tkfees='20200108'

update libdebito.embtrkdeb set tktrak =''
select TKEnti Entidad, tkclat Clase, Tkbine BIN, Tkstat Estado, 
TKUses Usuario_proceso,tkfees Fecha_Proceso, tkhoes Hora_proceso,tktrak
from libdebito.EMBTRKHST
where tkstat='P' and tkfees='20200108' AITCTRJNRO


select TKEnti Entidad, tkclat Clase, Tkbine BIN, Tkstat Estado, 
TKUses Usuario_proceso,tkfees Fecha_Proceso, tkhoes Hora_proceso ,tktrak
from libdebito.embtrkvis
where tkstat='P' and tkfees='20200108'

enmascarado ficlien
update contabilid.ficlien
set CLNOMB='SIN NOMBRE',           
CLAPEL='SIN APELLIDO' WHERE CLCODO 
in ('PE','TE')

***********************************************************************************************************
***********************************************************************************************************
enmascarado tdcliente/tdcliented
STRJRNPF FILE(yapi/tdcliente) JRN(@journal/QSQJRN) IMAGES(*BOTH)
select * from yapi.tdcliente
update yapi.tdcliente 
set tdprimnom='SIN NOMBRE1',tdsegnom='SIN NOMBRE2', TDPRIMAPE='SIN APELLIDO1',TDSEGAPE='SIN APELLIDO2', tdnomape='NOMBRE TARJETAHABIENTE'


select * from gxbdbps.gclieaf   ;
update gxbdbps.gclieaf set CENOMB1='NOMBRE1',  CENOMB2='NOMBRE2', CEAPEL1='APELLIDO1', CEAPEL2='APELLIDO2'

select * from gxbdbps.tdcliente ;
update gxbdbps.tdcliente set TDPRIMNOM='NOMBRE1', TDSEGNOM='NOMBRE2', TDPRIMAPE='APELLIDO1', TDSEGAPE='APELLIDO2', TDNOMAPE='APELLIDO1, NOMBRE1'

select * from gxbdbps.tmoviaf   ;
update gxbdbps.tmoviaf set mtnumta=(SUBSTR(mtnumta,1,6) || 'XXXXXX' ||SUBSTR(mtnumta,13,4));


select * from gxbdbps.tcuotaf 
update gxbdbps.tcuotaf set mtnumta=(SUBSTR(mtnumta,1,6) || 'XXXXXX' ||SUBSTR(mtnumta,13,4));

select * from gxbdbps.ait002    ;
update gxbdbps.ait002  set AITCTRJNRO=(SUBSTR(AITCTRJNRO,1,6) || 'XXXXXX' ||SUBSTR(AITCTRJNRO,13,4));

select * from visa.vistrndta    ;
update visa.vistrndta set VIPANNMBR=(SUBSTR(VIPANNMBR,1,6) || 'XXXXXX' ||SUBSTR(VIPANNMBR,13,4));

select * from visa.visctldta    ;
update visa.visctldta set V002=(SUBSTR(V002,1,6) || 'XXXXXX' ||SUBSTR(V002,13,4));

select * from visa.easissdeb    ;
select * from visa.visisslog    ;

select * from gxbdbps.tmctaaf   ;
update gxbdbps.tmctaaf set MCNUMTA=(SUBSTR(MCNUMTA,1,6) || 'XXXXXX' ||SUBSTR(MCNUMTA,13,4));

select * from gxbdbps.tmtaraf   ;
update gxbdbps.tmctaaf set MTNUMTA(SUBSTR(MTNUMTA,1,6) || 'XXXXXX' ||SUBSTR(MTNUMTA,13,4));

select * from gxbdbps.thextraf  ;
update gxbdbps.thextraf  set HENUMTA(SUBSTR(HENUMTA,1,6) || 'XXXXXX' ||SUBSTR(HENUMTA,13,4));

select * from gxbdbps.thmovaf   ;

select * from libdebito.tgembhaf;
update libdebito.tgembhaf set CRTARJ=(SUBSTR(CRTARJ,1,6) || 'XXXXXX' ||SUBSTR(CRTARJ,13,4));

select * from LIBDEBITO.embtrkvis    ;
UPDATE LIBDEBITO.embtrkvis SET TKTRAK=''	

select * from LIBDEBITO.embtrkDEB    ;
UPDATE LIBDEBITO.embtrkDEB SET TKTRAK=''	

select * from gxbdbps.tdcta 
update gxbdbps.tdcta set tdctatar=(SUBSTR(tdctatar,1,6) || 'XXXXXX' ||SUBSTR(tdctatar,13,4));

select * from gxbdbps.tdctaad   ;
update from gxbdbps.tdctaad set TDADHNOMPLA='NOMBRE APELLIDO'

select * from gxbdbps.tdemnotar ;
UPDATE gxbdbps.tdemnotar set NENROTARJ=(SUBSTR(NENROTARJ,1,6) || 'XXXXXX' ||SUBSTR(NENROTARJ,13,4)), NROTARJCTA=(SUBSTR(NROTARJCTA,1,6) || 'XXXXXX' ||SUBSTR(NROTARJCTA,13,4))

select * from gxbdbps.tmovpag   ;
update gxbdbps.tmovpag set MPNTAR=(SUBSTR(MPNTAR,1,6) || 'XXXXXX' ||SUBSTR(MPNTAR,13,4));


