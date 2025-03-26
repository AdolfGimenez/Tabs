-- configuraciones para sincronizar pos
SELECT * FROM GXBDBPS.COMMS c WHERE c.COMMID in ('03','02');
/*
 ip de desarrrollo: 10.251.251.251
 ip de produccion: 10.251.251.250

 Ip de inicializacion de desarrrollo 10.251.251.251 puerto 9980
 Ip de inicializacion de Produccion  10.251.251.250 puerto 9980 */

-- 3G desarrollo As400 Desarrollo

UPDATE GXBDBPS.COMMS set
COMMPRIVAL = '10.251.251.251',
COMMPRITCP = '11004',
COMMSECVAL = '10.251.251.251',
COMMSECTCP = '11004'
WHERE COMMID = '02';

-- 3G  desarrollo Mockup(dummy) sin validaciones.
UPDATE GXBDBPS.COMMS set
COMMPRIVAL = '10.251.251.251',
COMMPRITCP = '12504',
COMMSECVAL = '10.251.251.251',
COMMSECTCP = '12504'
WHERE COMMID = '02';

-- LAN/WIFI DESARROLLO aprobación mockup
UPDATE GXBDBPS.COMMS set
COMMPRIVAL = '10.251.251.251',
COMMPRITCP = '12504',
COMMSECVAL = '10.251.251.251',
COMMSECTCP = '12504'
WHERE COMMID = '03';

====================para testing As400=====================
--Testing  QA AS400 Testing
UPDATE GXBDBPS.COMMS
   SET COMMPRIVAL = '10.251.251.253',
       COMMPRITCP = '18004',
       COMMSECVAL = '10.251.251.253',
       COMMSECTCP = '18004'
WHERE COMMID = '02  ';


--QA normal jpts QA pero que apunta a As400 Desarrollo
UPDATE GXBDBPS.COMMS
   SET COMMPRIVAL = '10.251.251.253',
       COMMPRITCP = '11004',
       COMMSECVAL = '10.251.251.253',
       COMMSECTCP = '11004'
WHERE COMMID = '02  ';

--PRODUCCION pero a StandAlone que apunta a QA As400
UPDATE GXBDBPS.COMMS
   SET COMMPRIVAL = '10.251.251.250',
       COMMPRITCP = '12004',
       COMMSECVAL = '10.251.251.250',
       COMMSECTCP = '12004'
WHERE COMMID = '02  ';

--==================== PRODUCCION As400=====================
--SE USA EN CALLE
--PRODUCCION
UPDATE GXBDBPS.COMMS
   SET COMMPRIVAL = '10.251.251.250',
       COMMPRITCP = '11004',
       COMMSECVAL = '10.251.251.250',
       COMMSECTCP = '11004'
WHERE COMMID = '02  ';

select * from gxbdbps.comms;

--codigo para administracion de pos
--835486

SELECT * FROM GXBDBPS.TERMINAL T WHERE T.TERTID;
------------------------------------------------------
SELECT MAX(TERID) FROM GXBDBPS.TERMINAL t;
SELECT * FROM GXBDBPS.TERMINAL t2  WHERE T2.TERID =210;

INSERT INTO GXBDBPS.TERMINAL
(TERID, TERTID, TERENABLED, TERMERNAME, TERMERADD, TERMERADD2, TERMERADDT, TERRECNUM, TERTRXSEQ, TERADMIN, TERPRINTEN, TERFKNET, TERTPDU, TERNII, TERMERNUM, TERTRANUM, TERMAXTRAN, TERDISOPT, TERNAME, TERCIELOTE)
VALUES('210','35887451', 0, 'COMERCIO PRUEBA BEPSA', 'Dir1', 'Dir2', '80011012-9', 1, 1, '83548602', 0, 1, '0', '023', '000000000100001', 1, 9999, '1111111111000000', '', '0000');

SELECT * FROM GXBDBPS.COAFMAF c  WHERE  AFCODI ='44479047';-- AFCOMER ='44479047' AND AFCODI ='35887451';

INSERT INTO GXBDBPS.COAFMAF
(AFCODI, AFCOMER, AFTICODI, AFSTAT, AFREFE, AFFINST, AFFULMO, AFFUMA, AFSERN, AFOBSE, AFFMODI, AFIDUSAL, AFIDUSMD, AFRPRCOD, AFMONTO, AFFEFACT, AFFALTA, MOCODIG, AFFFICONT, AFREPP, AFCLAVE1, AFCLAVE2, AFNROCHIP, AFAPPVER)
VALUES('35887451  ', '0100001', '1702', 0, '          ', '20201214', '00000000', '00000000', '                              ', '                                                                                ', '20211014', 'U99LILIANA', 'U99BOBADI ', '00', 1.00, '00000000', '20201214', '600', '00000000', '      ', '                ', '                ', '               ', '                    ');

/*--Fabiola Amarilla
Tengo pos que vinieron con 7 dígitos entonces lo que se hizo fue agregar un cero delante para que sean 8 dígitos por ejemplo el 02287572
El caso es que si le asignamos al codigo 0100001(prueba bepsa) el pos transacciona sin problema pero si le asigno un codigo de comercio por ejemplo
el 0200819 no funciona no se donde podemos buscar no hay alguna tabla que esta validando el cero?
solo que es extraño que funcione con el de prueba y no con el de otro comercio
creo que hay una tabla de terminales en comercios web o en esta tabla gxbdbps.Terminal  */

SELECT * FROM GXBDBPS.TERMINAL t2  WHERE T2.TERTID='02287572';  ---02287572; --ver terminal

SELECT * FROM GXBDBPS.COMAEAF C2 WHERE C2.COCOMER='0200819'; --0200819; --relación activo comercio
--COMERCIO VS ACTIVO
SELECT * FROM GXBDBPS.COAFMAF C2 WHERE C2.AFCODI='02287572';

SELECT LENGTH(RTRIM(C2.AFCODI)), C2.AFCODI, C2.AFCOMER --ver activos con 7 dijitos.
FROM GXBDBPS.COAFMAF C2
WHERE C2.AFSTAT = '0'
  AND SUBSTR(C2.AFCOMER, 1, 1) NOT IN ('9')
GROUP BY C2.AFCODI, C2.AFCOMER;

SELECT D.LACTFJ, D.* FROM LIBDEBITO.DRCONBEP D WHERE  D.LACTFJ='02287572';
SELECT D.LACTFJ, D.* FROM LIBDEBITO.DRCONBEP D WHERE  D.LFECTR='20231109' AND D.LCODBC='DIN';

SELECT F2.CORAZO, M2.* FROM GXBDBPS.COMAEAF F2, GXBDBPS.COAFMAF M2 WHERE M2.AFCOMER = F2.COCOMER AND F2.CORAZO LIKE '%RETAIL%';

-----------------------------------------------------------
/*Fabiola Amarilla
Estamos probando transacciones en POS con el reloj garmin que tiene Edu, el punto es que aparentemente el pos esta encontrando algunos puntos donde
no reconoce o "se confunde" con las transacciones que son por mas de Gs. 100.000 nos solicitaron poder realizar un ajuste en la tabla de EMV
creo que es con relacion al inicializador.
Se debe modificar la tabla gxbdbps.emvaids ...
hacer una update en el campo EACDCVMLI, ---Ese campo controlla El limite de trx para dispositivos
Diferentes a los pos aparentemente.         */  --HACE BK PRIMERO Y LUEGO VOLVER ATRAS SI HACE FALTA..
/*mensaje del proveedor
Con respecto al SMART WACTH el XML de configuración del POS tiene el siguiente límite:
<clessCDCVMLimit>0000100001</clessCDCVMLimit>
<ctlessCVMLimit>0000100001</ctlessCVMLimit>*/

SELECT * FROM GXBDBPS.emvaids;
update gxbdbps.emvaids set EACDCVMLI=99999999 where EACDCVMLI='0000100001';

SELECT EACDCVMLI, C.* FROM WRKADOLFO.emvaids C; --where EACDCVMLI='0000100001';
SELECT EACDCVMLI, E.* FROM gxbdbps.emvaids E; --where EACDCVMLI='100001';
----------------------------------
--reing
SELECT * FROM GXFINDTA.TCMDIS T WHERE T.CLICLICOD=27810 AND T.SUCSUCCOD=2;
SELECT * FROM GXFINDTA.TCMALP T WHERE ALPCODAF='44479047';