-- sentencia DELETE para los asientos a eliminar
select * from contabilid.ccasi22
 where asfech = 221005 and asnras in (115, 121, 123, 317, 319, 323, 326, 459, 322, 325, 321);

delete from contabilid.ccasi22
 where asfech = 221005 and asnras in (115, 121, 123, 317, 319, 323, 326, 459, 322, 325, 321);

-- sentencia UPDATE para los registros que se actualizan el campo LINROASI a cero
select * from gxopera.flicom where lifechd = '20221004' and linroasi in (115, 121, 123, 317, 319, 323, 326, 459, 322, 325, 321) and linroasi > 0;

update gxopera.flicom set linroasi ='0'
where lifechd = '20221004' and linroasi in (115, 121, 123, 317, 319, 323, 326, 459, 322, 325, 321) and linroasi > 0;

SELECT * FROM  CONTABILID.CCASI22 C22;
-----------
-- Tabla de asiento
select * from contabilid.ccasi20 where asfech='201130' and ASCOUS='U99DENISSE' AND ASDESC LIKE '%36618%';
/*-- tablas relacionadas
ccccc20
cctc20
ccmba20*/
select * from contabilid.ccasi21 where  ASIMPO='22000.00';
select * from contabilid.ccasi21 where asnras='12280';
delete FROM contabilid.ccasi21 where asnras='12280';

--select * from yapi.ccasi21hf where asnras='12280';
--update yapi.ccasi21hf set ASNRAS='30500' where asnras='12280';

select max(ASNRAS) from contabilid.ccasi20 where asfech>'201200';
select * from contabilid.ccasi20 where asnras=30500 and asfech>'201200';
select * from contabilid.ccasi20 where asnras='1934' and asfech=201103;

--delete from contabilid.ccasi20 where asnras='1934' and asfech=201103;
select * from contabilid.ccasi20 where   asfech=201201 and ASCOUS='U99DENISSE' AND ASIMPO='7211723.00';
select * from contabilid.ccasi21 where asfech=210127  and ASCOUS='U99HILKA' AND ASIMPO='15220565.00' and asfech=210127;
select * from contabilid.ccasi21 where ASNRAS='2172';
--------------------
--PARA MAYOR
--mayor si o si 15 dijitos==201001002050028 la cuenta
---se corren querys dentro de la bilbioteca WRKADOLFO --BILBIOTECAS DE QMAYOR
--STRQRY==> 2 CAMBIAR==> QMAYOR** *LIB==>
/*Archivo  . . . . . . .   CCASI22
  Biblioteca . . . . .     CONTABILID
Miembro  . . . . . . .   *FIRST
Formato  . . . . . . .   *FIRST  */
------------------------------------------------------------
/*Opc   Opción de definición de consulta
     > Especificar selección de archivos --NORMAL
     > Definir campos de resultado
 --SI ES dEBITO
 Campo        Expresión
 IMPOR_DB    ASIMPO * 1
 IMPOR_CR    ASIMPO * 0
 --SI ES CREDITO
  Campo        Expresión
 IMPOR_DB    ASIMPO * 0
 IMPOR_CR    ASIMPO * 1
     > Seleccionar y ordenar campos --NORMAL
     > Seleccionar registros --==abajo
 AND/OR   Campo            Prueba Valor (Campo, N
        ASFECH            RANGE  220101 221231
 AND    ASCODB            EQ     'DB' --debe y CR en caso de haber
 AND    ASCOCT            EQ     201001002050028 --aca el tipo de cuenta
     > Seleccionar campos de clasificación
       Seleccionar orden de clasificación
       Especificar formato de columnas de informe
       Seleccionar funciones de resumen de informe
       Definir niveles de ruptura de informe
     > Seleccionar tipo y formato de la salida --1 entrar y 3 es en formato de salida archivo, enter
  Archivo. . . . . . . .   MAYOR028       cambiar de acuerdo al nro cuenta solicitado
   Biblioteca . . . . .     adolfollib   cambiar dd acuerdo a donde quiero llevar
 Miembro. . . . . . . .   MAYRG          igual siempre,

 Datos en archivo . . .   5              1=Archivo nuevo para el primer proceso ya sea DB o CR, y leugo
                                         5=Añadir a miembro para agregarle el otro grupo de cuentas o movimeintos
 Para un archivo nuevo:
   Autorización . . . .   *LIBCRTAUT     *LIBCRTAUT, nombre lista autoriz.,
                                         *CHANGE, *ALL, *EXCLUDE, *USE
   Texto  . . . . . . .   MAYOR DE CUENTAS 0028 ---texto descriptivo para mayor comprension
 Imprimir definición. .   N              Y=Sí, N=No*/
---------------------------------------
SELECT * FROM ADOLFOLIB.MAYOR028
WHERE ASFECH BETWEEN 221201 AND 221231
ORDER BY ASCPRV,ASFECH,ASNRAS;
------------------------------
/*para quitar diario de contabilidad via sql de la db2*/
select
    ASFECH FECHA, ASNRAS NUMERO_ASIENTO, ASNRLI NUMERO_LINEA, ASCOCT CUENTA_CONTABLE, CTDESC DESCRIPCION_DE_LA_CUENTA, ASDESC DESCRIPCION_DEL_ASIENTO,
    CASE WHEN ascodb = 'DB' THEN ASIMPO ELSE 0 END IMPORTE_DEBE, CASE WHEN ascodb = 'CR' THEN ASIMPO ELSE 0 END IMPORTE_HABER
from contabilid.ccasi22
  left JOIN contabilid.ccctc22 ON ctcoct = ascoct
    where asfech between 221201 and 221231 --and ascodb IN ('DB') --DB=Bebe | CR=haber
    ORDER by asfech, asnras, asnrli;
/*mayor
GO CC100M
3 -OPCION INFORME
11 -LIBRO MAYOR
AÑO=22

CCASI22--MOVIEMIENTOS POR ASIENTOS
CCCCC22--CUENTA CORRIENTE
CCCTC22--PLAN DE CUENTAS
CCMBA22--ARCHIVO BANCARIO*/
-------cambiar a numerico o moneda los importes..
---------------------------
----BALANCE ANALITICO
SELECT CTCOCT, CTDE12, CTCR12, CTDESC FROM CONTABILID.CCCTC22 WHERE CTCOCT IN (101012000000000, 201001000000000);

UPDATE CONTABILID.CCCTC22
SET CTDE12 = CTDE12 + 1312297794
WHERE CTCOCT = 101012000000000;

UPDATE CONTABILID.CCCTC22
SET CTCR12 = CTCR12 + 1312297794
WHERE CTCOCT = 201001000000000;
-----------------------------------------------
--EN el archivo GE05PRO es para ver el programa y que nivel tiene.
-- En el archivo GE04NIV es para poner tu usuario con el nivel encontrado en el archivo anterior (ge05pro)

SELECT G.NISIST FROM CONTABILID.GE04NIV G  GROUP BY G.NISIST--WHERE G.NICOUS='U99LETICIA';
--PERMISOS
--GE04NIV--
select * from  CONTABILID.GE04NIV where nicous='U99LILIAN';

select * from contabilid.ge04niv where nisist='CX'
and ninive='G3';

INSERT INTO CONTABILID.GE04NIV (NICOUS, NISIST, NINIVE)
VALUES('U99ADOLFO', 'CX', 'G3');
INSERT INTO CONTABILID.GE04NIV (NICOUS, NISIST)
VALUES('U99CARMEN', 'SJ');

--GE03ACC--EXCLUSIVO CONTABILIDAD
select * from contabilid.ge03acc where accous='U99LILIAN';

INSERT INTO CONTABILID.GE03ACC (ACCOUS, ACPROG, ACOPER)
VALUES('U99LILIAN', 'CC302R', '0');

select * from contabilid.tatacus where tacous='U99LETICIA';
select * from contabilid.tatacus where tasucu='01' and taarea='03';

INSERT INTO CONTABILID.TATACUS (TACOUS, TASUCU, TAAREA, TADEPA)
VALUES('U99CARMEN', '01', '03', 0);
--E05PRO--
select * from contabilid.ge05pro
where prprog in ('CC122R', 'CC123R', 'CC125R', 'CC126R', 'CC129R', 'CC152R');

INSERT INTO CONTABILID.GE04NIV (NICOUS, NISIST, NINIVE) VALUES ('U99ADOLFO', 'CC', 'CO');
INSERT INTO CONTABILID.GE04NIV (NICOUS, NISIST, NINIVE) VALUES ('U99ADOLFO', 'CC', 'CT');
INSERT INTO CONTABILID.GE04NIV (NICOUS, NISIST, NINIVE) VALUES ('U99ADOLFO', 'CC', 'DB');
INSERT INTO CONTABILID.GE04NIV (NICOUS, NISIST, NINIVE) VALUES ('U99ADOLFO', 'CC', 'FA');
INSERT INTO CONTABILID.GE04NIV (NICOUS, NISIST, NINIVE) VALUES ('U99ADOLFO', 'CC', 'GE');
INSERT INTO CONTABILID.GE04NIV (NICOUS, NISIST, NINIVE) VALUES ('U99ADOLFO', 'CC', 'G1');
INSERT INTO CONTABILID.GE04NIV (NICOUS, NISIST, NINIVE) VALUES ('U99ADOLFO', 'CC', 'G2');
INSERT INTO CONTABILID.GE04NIV (NICOUS, NISIST, NINIVE) VALUES ('U99ADOLFO', 'CC', 'G3');
INSERT INTO CONTABILID.GE04NIV (NICOUS, NISIST, NINIVE) VALUES ('U99ADOLFO', 'CC', 'G4');
INSERT INTO CONTABILID.GE04NIV (NICOUS, NISIST, NINIVE) VALUES ('U99ADOLFO', 'CC', 'G5');
INSERT INTO CONTABILID.GE04NIV (NICOUS, NISIST, NINIVE) VALUES ('U99ADOLFO', 'CC', 'G9');
INSERT INTO CONTABILID.GE04NIV (NICOUS, NISIST, NINIVE) VALUES ('U99ADOLFO', 'CC', 'IG');
INSERT INTO CONTABILID.GE04NIV (NICOUS, NISIST, NINIVE) VALUES ('U99ADOLFO', 'CC', 'LI');
INSERT INTO CONTABILID.GE04NIV (NICOUS, NISIST, NINIVE) VALUES ('U99ADOLFO', 'SJ', 'G3');