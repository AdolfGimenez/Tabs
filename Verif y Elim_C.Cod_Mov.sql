----------------------------------------------------------------------------------------------
SELECT * FROM GXOPERA.TRXINST where insPGENTID = '18483   ';
DELETE GXOPERA.TRXINST where insPGENTID= '18483   ';
----------------------------------------------------------------------------------------------
SELECT * FROM GXOPERA.FLICOM WHERE LINRO ='18483   '; --WHERE LICOMER = '1302527' and LIFECHD='20220908';
delete GXOPERA.FLICOM WHERE LINRO ='18483   ';  --where LICOMER = '1302527' and LIFECHD='20220908';
----------------------------------------------------------------------------------------------
SELECT * FROM GXOPERA.FLICOM1 WHERE LINROINS ='18483     '; --WHERE LICOMER = '1302527' and LIFECHD='20220908'; 
delete GXOPERA.FLICOM1 WHERE LINROINS ='18483   ';--WHERE LICOMER = '1302527' and LIFECHD='20220908';  
----------------------------------------------------------------------------------------------
SELECT sum(INSFACTOT) FROM GXOPERA.TRXINST where insPGENTID = '18483   ';
SELECT sum(LIMONTO) FROM GXOPERA.FLICOM1 WHERE LINROINS ='18483   ';

-- si es bnf tambien ver
SELECT * FROM GXOPERA.OPAGO0P; --where PGUSER='U99KATERIN' PGCOME in('0702938','6900334')
SELECT * FROM GXOPERA.OPAGO1P;  --where PGCOMER in('0701172','0701857','0702620','0702629','0702802')
SELECT * FROM libdebito.OPAGO2P;-- where DTPGIDUSR='U99KATERIN', AND PGCOMER in('0703722', '8603396')
SELECT * FROM GXOPERA.OPAGO3p;
SELECT * FROM GXOPERA.OPAGO3tc;

--------------ELIMINACION DE REGISTRO POR VENTA DE MINUTOS

SELECT * FROM GXOPERA.FCTACOM WHERE CTAUSER='U99KATERIN' AND CTAFECHA='20220909' and CTANROBOL = '909224'
and CTAMONTO='7840517'
and CTANROBOL='208222' and CTAMONTO='979000'

DELETE GXOPERA.FCTACOM WHERE CTAUSER='U99KATERIN' AND CTAFECHA='20220909' and CTANROBOL = '909224'
and CTAMONTO='7840517'
and CTANROBOL='208222' and CTAMONTO='979000'
**********************************************************************************************
------CAMBIO DE COD. MOVIMIENTO Y MENSAJE DE REINTEGROS / CAMBIO DE COD. MOVIMIENTO #37549
select * from GXBDBPS.tdmov where MOVFECTR>='20220913' and MOVIMPORTE='62500.00'

select * from gxbdbps.tmoviaf where --MVIDUSR='U99IVANE' AND 
MVFEPRO='20220913' and MVIMPO2='62500.00' and MTNUMTA ='5148480000000733' AND MVSECUE IN ('902100191570','902100191569') --and CMCODIG='099' AND MVEMISO='021'

UPDATE gxbdbps.tmoviaf SET CMCODIG='016', MVNOMCO='DEBITO SALDO A FACTURAR' WHERE MVFEPRO='20220913' and MVIMPO2='62500.00' and MTNUMTA ='5148480000000733' AND MVSECUE IN ('902100191570','902100191569')

update gxbdbps.tmoviaf set MVNOMCO='CREDITO PROMOCION-CONTI DESCUENTOS' 
where MVIDUSR='U99IVANE' AND MVFEPRO='20220830' AND MVEMISO='021'
**********************************************************************************************
--------cambio de fecha de recibo
select * from gxopera.fcobros where COMRECNRO='0138623'

update gxopera.fcobros set COMSTATUS='P', COMFEREAL='20220913'
where COMRECNRO='0138623'
select * from gxopera.RECIBO where COMIMPOR='50000.00'

select * from gxopera.recibos where RTOTFACT='50000.00' and RFECH='20220919'

Select * from gxopera.fcobros where COMUSER = 'U99TANYA' and COMIMPOR = '50000.00'

Select * from gxopera.factura where FACTNRO = 10030033479 and FACLIEN = '0301756'

UPDATE GXOPERA.FACTURA
SET FACSTATUS = 'C'
WHERE FACTIPO = 'CR'
ANDFACTNRO = 10030033479
ANDFACTIMBR = '15662553  ';

select * from gxopera.fcobros where COMRECNRO='1077256'

UPDATE gxopera.fcobros
SET COMSTATUS = 'P'
WHERE COMRECNRO = '1077256'

select * from gxopera.fcobros where COMRECNRO='1077256'

update gxopera.fcobros  set COMSTATUS='P'
 where COMRECNRO='1077256'

update  gxopera.CUSTODE set CUSTOEST='P', CUSTOMOT=''
 where CUSTOREC='138623'

UPDATE GXOPERA.FCOBROS
SET COMSTATUS = 'P'
WHERE COMTIPO = 'CR'
ANDCOMNRO = 10030033479
ANDCOMTIMBR = '15662553  '
ANDCOMSECU = 7;

SELECT * FROM FACTURA1.GXOPERA;
SELECT * FROM FACTURA2.GXOPERA;
SELECT * FROM FACTURAAN.GXOPERA;	
SELECT * FROM FACTURAJ.GXOPERA;
SELECT * FROM FACTURAL1.GXOPERA;
SELECT * FROM FACTURAZ.GXOPERA;
------------------------------------------------------------------------------------------------
----cambio de zona.
select *from GXBDBPS.COMAEAF where ZONACODI =' 34' and COCOMER = '0701052';

UPDATE GXBDBPS.COMAEAF
SET ZONACODI =' 34' WHERE COCOMER = '0701052';
-------------------------------------------------------------------------------------------------
