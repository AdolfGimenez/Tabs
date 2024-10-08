/*BORRADO DE USUARIOS DE PRUEBAS*/
--DELETE FROM GXSEGDTA.TSGUSR t WHERE SGUSRCOD IN (1, 2, 3, 7, 11, 25, 27, 30, 34, 
37, 42, 91, 92, 2005,2008, 2009, 2015, 2024, 2029, 2034, 2878, 2882);
/*BORRADO DE RELACION DE USUARIOS DE PRUEBAS*/
--DELETE FROM GXSEGDTA.TSGARU t WHERE SGUSRCOD IN (1, 2, 3, 7, 11, 25, 27, 30, 34, 
37, 42, 91, 92, 2005,2008, 2009, 2015, 2024, 2029, 2034, 2878, 2882);
/*INSERTAR ROL DE INICIO A LOS USUARIOS*/
INSERT INTO GXSEGDTA.TSGARU (SGROLCOD,SGSISCOD,SGUSRCOD,SGARUEXP,SGARUUSMO,SGARUFCHMO) VALUES (
91,2,2917,'N','          ','0001-01-01 00:00:00.000');
INSERT INTO GXSEGDTA.TSGARU (SGROLCOD,SGSISCOD,SGUSRCOD,SGARUEXP,SGARUUSMO,SGARUFCHMO) VALUES (
91,2,2921,'N','          ','0001-01-01 00:00:00.000');
INSERT INTO GXSEGDTA.TSGARU (SGROLCOD,SGSISCOD,SGUSRCOD,SGARUEXP,SGARUUSMO,SGARUFCHMO) VALUES (
91,2,2011,'N','          ','0001-01-01 00:00:00.000');
INSERT INTO GXSEGDTA.TSGARU (SGROLCOD,SGSISCOD,SGUSRCOD,SGARUEXP,SGARUUSMO,SGARUFCHMO) VALUES (
91,2,2917,'N','          ','0001-01-01 00:00:00.000');
INSERT INTO GXSEGDTA.TSGARU (SGROLCOD,SGSISCOD,SGUSRCOD,SGARUEXP,SGARUUSMO,SGARUFCHMO) VALUES (
91,2,2921,'N','          ','0001-01-01 00:00:00.000');
INSERT INTO GXSEGDTA.TSGARU (SGROLCOD,SGSISCOD,SGUSRCOD,SGARUEXP,SGARUUSMO,SGARUFCHMO) VALUES (
91,2,2925,'N','          ','0001-01-01 00:00:00.000');
INSERT INTO GXSEGDTA.TSGARU (SGROLCOD,SGSISCOD,SGUSRCOD,SGARUEXP,SGARUUSMO,SGARUFCHMO) VALUES (
91,2,2929,'N','          ','0001-01-01 00:00:00.000');
INSERT INTO GXSEGDTA.TSGARU (SGROLCOD,SGSISCOD,SGUSRCOD,SGARUEXP,SGARUUSMO,SGARUFCHMO) VALUES (
91,2,2933,'N','          ','0001-01-01 00:00:00.000');
INSERT INTO GXSEGDTA.TSGARU (SGROLCOD,SGSISCOD,SGUSRCOD,SGARUEXP,SGARUUSMO,SGARUFCHMO) VALUES (
91,2,2937,'N','          ','0001-01-01 00:00:00.000');
INSERT INTO GXSEGDTA.TSGARU (SGROLCOD,SGSISCOD,SGUSRCOD,SGARUEXP,SGARUUSMO,SGARUFCHMO) VALUES (
91,2,2913,'N','          ','0001-01-01 00:00:00.000');
INSERT INTO GXSEGDTA.TSGARU (SGROLCOD,SGSISCOD,SGUSRCOD,SGARUEXP,SGARUUSMO,SGARUFCHMO) VALUES (
91,2,2909,'N','          ','0001-01-01 00:00:00.000');
INSERT INTO GXSEGDTA.TSGARU (SGROLCOD,SGSISCOD,SGUSRCOD,SGARUEXP,SGARUUSMO,SGARUFCHMO) VALUES (
91,2,2892,'N','          ','0001-01-01 00:00:00.000');
INSERT INTO GXSEGDTA.TSGARU (SGROLCOD,SGSISCOD,SGUSRCOD,SGARUEXP,SGARUUSMO,SGARUFCHMO) VALUES (
91,2,2905,'N','          ','0001-01-01 00:00:00.000');
INSERT INTO GXSEGDTA.TSGARU (SGROLCOD,SGSISCOD,SGUSRCOD,SGARUEXP,SGARUUSMO,SGARUFCHMO) VALUES (
91,2,2901,'N','          ','0001-01-01 00:00:00.000');
INSERT INTO GXSEGDTA.TSGARU (SGROLCOD,SGSISCOD,SGUSRCOD,SGARUEXP,SGARUUSMO,SGARUFCHMO) VALUES (
91,2,2896,'N','          ','0001-01-01 00:00:00.000');
INSERT INTO GXSEGDTA.TSGARU (SGROLCOD,SGSISCOD,SGUSRCOD,SGARUEXP,SGARUUSMO,SGARUFCHMO) VALUES (
91,2,2941,'N','          ','0001-01-01 00:00:00.000');
--****************
--Inserta Funciones
--Validar si existe registro
SELECT *
FROM GXSEGDTA.TSGFUN
WHERE SGFUNCOD IN (2514, 2436, 2440) AND SGSISCOD=21;
--Insert de funciones si no existe, verificar �ltimo ID
INSERT INTO GXSEGDTA.TSGFUN
(SGFUNCOD, SGSISCOD, SGFUNDES, SGFUNOBJ, SGFUNPAD, SGFUNORD, SGFUNVIS, SGFUNFILT, SGFUNTOBJ, SGFUNUSMO, SGFUNFCHMO, SGFUNCPAD, SGFUNURLOB, SGFUNTIPO)
VALUES(2436, 21, 'BOTON UPDATE DE TEMPORAL                          ', 'TCLTPCWWUPD         ', 'N', 0, 'N', 'S', 'W', 'U99IRALA  ', '2020-07-22 22:09:04.000', 0, 'http://localhost:8080/accesobepsa/servlet/seguridad.', 'I');
INSERT INTO GXSEGDTA.TSGFUN
(SGFUNCOD, SGSISCOD, SGFUNDES, SGFUNOBJ, SGFUNPAD, SGFUNORD, SGFUNVIS, SGFUNFILT, SGFUNTOBJ, SGFUNUSMO, SGFUNFCHMO, SGFUNCPAD, SGFUNURLOB, SGFUNTIPO)
VALUES(2440, 21, 'BOTON DISPLAY DE TEMPORAL                         ', 'TCLTPCWWDSP         ', 'N', 0, 'N', 'S', 'W', 'U99IRALA  ', '2020-07-22 22:09:23.000', 0, 'http://localhost:8080/accesobepsa/servlet/seguridad.', 'I');
INSERT INTO GXSEGDTA.TSGFUN
(SGFUNCOD, SGSISCOD, SGFUNDES, SGFUNOBJ, SGFUNPAD, SGFUNORD, SGFUNVIS, SGFUNFILT, SGFUNTOBJ, SGFUNUSMO, SGFUNFCHMO, SGFUNCPAD, SGFUNURLOB, SGFUNTIPO)
VALUES(2514, 21, 'UPDATE PANTALLA DE TRANSMISION                    ', 'TCLTSBWWUPD         ', 'N', 0, 'N', 'N', 'W', 'U99OCAMPOS', '2020-07-29 21:32:38.000', 0, 'http://localhost:8080/accesobepsa/servlet/seguridad.', 'I');
--##Asigna funciones a roles###
--Inserta roles a area COmercial
INSERT INTO GXSEGDTA.TSGROLDT--UPD Temporal
(SGROLCOD, SGSISCOD, SGFUNCOD, SGRDTPDIS, SGRDTPUPD, SGRDTPINS, SGRDTPDEL)
VALUES(160, 21, 2436, 'S', 'S', 'S', 'S');
INSERT INTO GXSEGDTA.TSGROLDT--UPD Transmisiones
(SGROLCOD, SGSISCOD, SGFUNCOD, SGRDTPDIS, SGRDTPUPD, SGRDTPINS, SGRDTPDEL)
VALUES(160, 21, 2514, 'S', 'S', 'S', 'S');
INSERT INTO GXSEGDTA.TSGROLDT--DSP Temporal
(SGROLCOD, SGSISCOD, SGFUNCOD, SGRDTPDIS, SGRDTPUPD, SGRDTPINS, SGRDTPDEL)
VALUES(160, 21, 2440, 'S', 'S', 'S', 'S');
--Inserta roles a area COntabilidad
INSERT INTO GXSEGDTA.TSGROLDT--UPD Transmisiones
(SGROLCOD, SGSISCOD, SGFUNCOD, SGRDTPDIS, SGRDTPUPD, SGRDTPINS, SGRDTPDEL)
VALUES(145, 21, 2514, 'N', 'N', 'N', 'N');
--Inserta roles a area de Operaciones
INSERT INTO GXSEGDTA.TSGROLDT--UPD Temporal
(SGROLCOD, SGSISCOD, SGFUNCOD, SGRDTPDIS, SGRDTPUPD, SGRDTPINS, SGRDTPDEL)
VALUES(188, 21, 2436, 'N', 'N', 'N', 'N');
INSERT INTO GXSEGDTA.TSGROLDT --DSP Temporal
(SGROLCOD, SGSISCOD, SGFUNCOD, SGRDTPDIS, SGRDTPUPD, SGRDTPINS, SGRDTPDEL)
VALUES(188, 21, 2440, 'S', 'S', 'S', 'S');
--Inserta roles a area de Operaciones supervisor
INSERT INTO GXSEGDTA.TSGROLDT--UPD Temporal
(SGROLCOD, SGSISCOD, SGFUNCOD, SGRDTPDIS, SGRDTPUPD, SGRDTPINS, SGRDTPDEL)
VALUES(173, 21, 2436, 'S', 'S', 'S', 'S');
INSERT INTO GXSEGDTA.TSGROLDT --DSP Temporal
(SGROLCOD, SGSISCOD, SGFUNCOD, SGRDTPDIS, SGRDTPUPD, SGRDTPINS, SGRDTPDEL)
VALUES(173, 21, 2440, 'S', 'S', 'S', 'S');
--Inserta roles a area de Productos
INSERT INTO GXSEGDTA.TSGROLDT--UPD Temporal
(SGROLCOD, SGSISCOD, SGFUNCOD, SGRDTPDIS, SGRDTPUPD, SGRDTPINS, SGRDTPDEL)
VALUES(213, 21, 2436, 'S', 'S', 'S', 'S');
INSERT INTO GXSEGDTA.TSGROLDT--DSP Temporal
(SGROLCOD, SGSISCOD, SGFUNCOD, SGRDTPDIS, SGRDTPUPD, SGRDTPINS, SGRDTPDEL)
VALUES(213, 21, 2440, 'S', 'S', 'S', 'S');
--Inserta roles a area SAE
INSERT INTO GXSEGDTA.TSGROLDT-- UPD Temporal
(SGROLCOD, SGSISCOD, SGFUNCOD, SGRDTPDIS, SGRDTPUPD, SGRDTPINS, SGRDTPDEL)
VALUES(153, 21, 2436, 'S', 'S', 'S', 'S');
INSERT INTO GXSEGDTA.TSGROLDT-- DSP Temporal
(SGROLCOD, SGSISCOD, SGFUNCOD, SGRDTPDIS, SGRDTPUPD, SGRDTPINS, SGRDTPDEL)
VALUES(153, 21, 2440, 'S', 'S', 'S', 'S');
--Inserta roles de area tesoreria
INSERT INTO GXSEGDTA.TSGROLDT-- UPD Transmisiones
(SGROLCOD, SGSISCOD, SGFUNCOD, SGRDTPDIS, SGRDTPUPD, SGRDTPINS, SGRDTPDEL)
VALUES(124, 21, 2514, 'S', 'S', 'S', 'S');
--Ver Usuario de Luz
--##Insert Usuario nuevo###
SELECT *FROM GXSEGDTA.TSGUSR t --Copiar user de Luz Florentin, tomar ultimo ID + 1
--insertar nuevo usuario
INSERT INTO GXSEGDTA.TSGUSR
(SGUSRCOD, SGUSRNOM, SGUSRID, SGUSREST, SGDTOCOD, SGARECOD, SGSECCOD, SGUSRMAIL, SGTUSCOD, SGUSRADM, SGGENCOD, SGGCOCOD, SGUSRFCHUA, SGUSRUSMO, SGUSRFCHMO, SGUSRDOC)
VALUES(ID Rodrigo Gaona, 'RODRIGO GAONA                                 ', 'U99RODRIGO', 'A', 1, 1, 1, 'cocampos@bepsa.com.py', 1, '          ', 2, 144, '00000000', 'U99OCAMPOS', '2020-04-23 09:39:52.000', '3333333             ');
--Actualizar numerador
SELECT * FROM GXSEGDTA.TSGNUM t WHERE SGNUMOBJ = 'TSGUSR'
UPDATE GXSEGDTA.TSGNUM 
SET SGNUMACT = "ID Rodrigo Gaona"
WHERE SGNUMOBJ = 'TSGUSR'
--Insertar roles para usuario nuevo
INSERT INTO GXSEGDTA.TSGARU
(SGROLCOD, SGSISCOD, SGUSRCOD, SGARUEXP, SGARUUSMO, SGARUFCHMO)
VALUES(287, 1, JOSE ENCISO, 'N', '          ', '0001-01-01 00:00:00.000');
INSERT INTO GXSEGDTA.TSGARU
(SGROLCOD, SGSISCOD, SGUSRCOD, SGARUEXP, SGARUUSMO, SGARUFCHMO)
VALUES(203, 21, ID Rodrigo Gaona, 'N', '          ', '0001-01-01 00:00:00.000');


select * from gxsegdta.sgsiscod

[11:38] Edgar Irala
INSERT INTO TSGROL (SGROLCOD, SGSISCOD, SGROLDESC, SGROLUSMO, SGROLFCHMO) VALUES(287, 1, 'OPERACIONES OPERATIVO TJ �������������������������', CURRENT USER, CURRENT TIMESTAMP);

INSERT INTO TSGROL (SGROLCOD, SGSISCOD, SGROLDESC, SGROLUSMO, SGROLFCHMO) VALUES(293, 1, 'OPERACIONES SUPERVISOR TJ ������������������������', CURRENT USER, CURRENT TIMESTAMP);

select * from gxsegdta.tsgrol where sgrolcod in ('287','293')
select * from gxsegdta.TSGARU where sgusrcod='2945'
select * from gxsegdta.TSGUSR where sgusrnom like '%KARINA%'
select * from gxsegdta.TSGFUN where sgfuncod in (
2603,
2607,
2611,
2615,
2620,
2633,
2637,
2641,
2645,
2649,
2657,
2661,
2666,
2670,
2675,
2680,
2684,
2690,
2695,
2699,
2703,
3117,
3121)

SGROLCOD	SGSISCOD	SGUSRCOD	SGARUEXP	SGARUUSMO	SGARUFCHMO	SGARUENTRJ
87	1	2011	N	          	0001-01-01 00:00:00	 
91	2	2011	N	          	0001-01-01 00:00:00	 
203	21	2011	N	          	0001-01-01 00:00:00	 
356	33	2011	N	          	0001-01-01 00:00:00	 


INSERT INTO GXSEGDTA.TSGARU (SGROLCOD,SGSISCOD,SGUSRCOD,SGARUEXP,SGARUUSMO,SGARUFCHMO,SGARUENTRJ) 
VALUES
  (293,1,2011,'N','          ','0001-01-01 00:00:00.000',' ');



SELECT * FROM GXTRJDTA.tdgagc

select * from contabilid.sjdpers where dpcode='PE' and  dpcoem='158'
select * from contabilid.sj 
