***************************** Query 1 **********************************
INSERT INTO GXTRJDTA.TDSPWS
VALUES
(
  'ABMCREDWS', --- NOMBRE DEL SERVICIO
  'WS DE ABM DE TARJETAS DE CREDITO',
  'http://        ',
  '10.1.254.12',  ---  IP PRODUCCIÓN DEL SERVIDOR
  '                                                            ',
  8080,  ---   PUERTO PRODUCIÓN
  '/AbmCredWS/webresources/     ', --- URL APP PRODUCIÓN
  'AbmCred001        ', --- URL APP PRODUCIÓN
  1000,
  0,
  'A',
  CURRENT USER,  --- USUARIO ACTUALIZACION DEL REGISTRO
  CURRENT TIMESTAMP,
  ' ',
  0,
  '          ',
  '',
  0,
  0
);

select * from gxtrjdta.TDSPWS
************************************************************************
***************************** Query 2 **********************************
Ejecutar Query por cada Entidad a dar de Alta para la utilización del WS - Editar ENTIDAD y USUARIO HABILITADO DEL SERVICIO con
los datos de las Entidades
  select * from GXTRJDTA.TDSDWS
INSERT INTO GXTRJDTA.TDSDWS
VALUES
(
  'ABMCREDWS',
  1, ---- SECUENCIAL, DEBE IR EL ULTIMO REGISTRO MÁS 1
  '10.12.12.12',  --- IP SERVIDOR PRODUCCIÓN --
  1020,  --- ENTIDAD
  0,
  1, --- SUCURSAL DE LA ENTIDAD
  'CONTIWSUSR', ---USUARIO HABILITADO DEL SERVICIO
  CURRENT USER, --- USUARIO ACTUALIZACION DEL REGISTRO
  CURRENT TIMESTAMP
);
INSERT INTO GXTRJDTA.TDSDWS
VALUES
(
  'ABMCREDWS',
  2, ---- SECUENCIAL, DEBE IR EL ULTIMO REGISTRO MÁS 1
  '10.4.3.89',  --- IP SERVIDOR PRODUCCIÓN --
  4005,  --- ENTIDAD
  0,
  1, --- SUCURSAL DE LA ENTIDAD
  'WALEDWUSR', ---USUARIO HABILITADO DEL SERVICIO
  CURRENT USER, --- USUARIO ACTUALIZACION DEL REGISTRO
  CURRENT TIMESTAMP
);
************************************************************************
***************************** Query 3 **********************************
Ejecutar Query por cada Entidad a dar de Alta - Editar CODIGO ENTIDAD UTILIZADO POR LA ENTIDAD  con el Codigo de la Entidad
select * from GXTRJDTA.TENECX
INSERT INTO GXTRJDTA.TENECX
(ECXCODENT, ECXIDCONEX, ECXDSCCONE, 
ECXBADTOIP, ECXBADTOUS, ECXBADTPAS, ECXSERVPRO,
 ECXSERVPO, ECXSERVIP, ECXSERVUS, ECXSERVPAS, 
ECXUSULTUP, ECXFHULTUP, ECXFRECUEN, ECXHORADES,
 ECXHORAHAS, ECXURLCONE, ECXDRIVER, 
ECXBABIBLD, ECXUSUPROC, ECXDIAHAB, 
ECXTIMEOUT, ECXDOMINIO)
VALUES
(
  1020, --- CODIGO ENTIDAD UTILIZADO POR LA ENTIDAD  --
  'AS400', --- IDENTIFICADOR DE CONEXION
  'Datos de conexion Usuario WS',
  '10.254.254.250',  ---- IP AS400 PRODUCCIÓN
  'CONTIWSUSR', ------ USUARIO AS400 PRODUCCIÓN SEGUN ENTIDAD --
  '4I52DViOqZe0nLZVW3N/Ow==', --- PASS CIFRADO CON BepCypherUI --
  '               ',
  '               ',
  '               ',
  '          ',
  '',
  CURRENT USER, --- USUARIO ACTUALIZACION --
  CURRENT TIMESTAMP,
  ' ',
  '        ',
  '        ',
  'jdbc:as400://10.254.254.250/;naming=system;errors=full;',  ---- MODIFICAR IP POR LA DE PRODUCCIÓN
  'com.ibm.as400.access.AS400JDBCDriver                        ',
  'gxfindta,gxopera,gxtrjdta,gxsegdta', --- BIBLIOTECAS UTILIZADAS EN EL SERVICIO SEPARADOS POR ,---
  '          ',
  ' ',
  0,
  '                                                            '
);
select * from GXTRJDTA.TENECX
select * from gxtrjbps.
INSERT INTO GXTRJDTA.TENECX
(ECXCODENT, ECXIDCONEX, ECXDSCCONE, 
ECXBADTOIP, ECXBADTOUS, ECXBADTPAS, ECXSERVPRO,
 ECXSERVPO, ECXSERVIP, ECXSERVUS, ECXSERVPAS, 
ECXUSULTUP, ECXFHULTUP, ECXFRECUEN, ECXHORADES,
 ECXHORAHAS, ECXURLCONE, ECXDRIVER, 
ECXBABIBLD, ECXUSUPROC, ECXDIAHAB, 
ECXTIMEOUT, ECXDOMINIO)
VALUES
(
  4005, --- CODIGO ENTIDAD UTILIZADO POR LA ENTIDAD  --
  'AS400', --- IDENTIFICADOR DE CONEXION
  'Datos de conexion Usuario WS',
  '10.254.254.250',  ---- IP AS400 PRODUCCIÓN
  'WALEDWUSR', ------ USUARIO AS400 PRODUCCIÓN SEGUN ENTIDAD --
  '4I52DViOqZe0nLZVW3N/Ow==', --- PASS CIFRADO CON BepCypherUI --
  '               ',
  '               ',
  '               ',
  '          ',
  '',
  CURRENT USER, --- USUARIO ACTUALIZACION --
  CURRENT TIMESTAMP,
  ' ',
  '        ',
  '        ',
  'jdbc:as400://10.254.254.250/;naming=system;errors=full;',  ---- MODIFICAR IP POR LA DE PRODUCCIÓN
  'com.ibm.as400.access.AS400JDBCDriver                        ',
  'gxfindta,gxopera,gxtrjdta,gxsegdta', --- BIBLIOTECAS UTILIZADAS EN EL SERVICIO SEPARADOS POR ,---
  '          ',
  ' ',
  0,
  '                                                            '
);

************************************************************************
***************************** Query 4 **********************************
SELECT * FROM GXTRJDTA.TDSPRC
INSERT INTO GXTRJDTA.TDSPRC(PRCIDPROCE,MODIDMODUL,PRCDSPROCE,  
PRCESTADO,PRCUSULTUP,PRCFHULTUP,  PRCGENLOG)
VALUES(
  'ABMCREDWS',  --- NOMBRE DEL SERVICIO
  'CA',
  'WEB SERVICE DE ABM CREDITO ',  ---DESCRIPCION DEL SERVICIO
  'A',  -- ESTADO DEL SERVICIO
  CURRENT USER,  --- USUARIO ACTUALIZACION
  CURRENT TIMESTAMP,
  'N'
);
************************************************************************
************************************************************************
SKJVTRJ001_Queries.txt
--VERIFICAR EL SIGUIENTE DATO
--SELECT * FROM GXTRJDTA.TENECX WHERE ECXCODENT = 9000 AND ECXIDCONEX = 'AS400CLEARING';
--EN CASO DE NO EXISTIR AÚN EJECUTAR EL SIGUIENTE INSERT
***************************** Query 1 **********************************
SELECT * FROM GXTRJDTA.TENECX
EXISTE LUEGO 
INSERT INTO GXTRJDTA.TENECX (ECXCODENT,ECXIDCONEX,ECXDSCCONE,ECXBADTOIP,ECXBADTOUS,
ECXBADTPAS,ECXSERVPRO,ECXSERVPO,ECXSERVIP,ECXSERVUS,ECXSERVPAS,ECXUSULTUP,ECXFHULTUP,
ECXFRECUEN,ECXDIAHAB,ECXHORADES,ECXHORAHAS,ECXURLCONE,ECXDRIVER,ECXBABIBLD,ECXUSUPROC,
ECXTIMEOUT,ECXDOMINIO,ECXTPCONEX,ECXCODCLI,ECXCODSUC) 
VALUES 
(9000, --- CODIGO ENTIDAD UTILIZADO POR LA ENTIDAD --
'AS400CLEARING', -- IDENTIFICADOR DE CONEXION --
'Datos de conexion a AS400',
'10.254.254.250', ---- IP AS400 PRODUCCIÓN
'XXXXX', ------ USUARIO AS400 GENERICO BEPSA  --
'XXXXXX', --- PASS CIFRADO CON BepCypherUI --
'               ',
'               ',
'               ',
'          ',
'',
'USERSOCKET', --- NOMBRE USUARIO A SER UTILIZADO
CURRENT TIMESTAMP,
' ',
'S',
'08:30:00',
'17:40:00',
'jdbc:as400://10.12.254.68/;naming=system;errors=full;', ---- MODIFICAR IP POR LA DE PRODUCCIÓN
'com.ibm.as400.access.AS400JDBCDriver',
'gxfindta,gxopera,gxtrjdta',
'ABD',
40000,
' ',
' ',
0,
0);
***************************** Query 2 **********************************
Ejecutar Query por cada Entidad a ser dada de Alta, editar CODIGO ENTIDAD UTILIZADO POR LA ENTIDAD, IP DE SERVIDOR SFTP,
USUARIO DE SERVIDOR SFTP, CONTRASEÑA CIFRADO CON BepCypherUI DE SERVIDOR SFTP por los correspondientes a la Entidad
FALTA
INSERT INTO GXTRJDTA.TENECX
(ECXCODENT, ECXIDCONEX, ECXDSCCONE, ECXBADTOIP, ECXBADTOUS, ECXBADTPAS, ECXSERVPRO, ECXSERVPO,
  ECXSERVIP,ECXSERVUS,ECXSERVPAS,ECXUSULTUP,ECXFHULTUP,ECXFRECUEN,ECXDIAHAB,ECXHORADES,
  ECXHORAHAS,ECXURLCONE,ECXDRIVER,ECXBABIBLD,ECXUSUPROC,ECXTIMEOUT,ECXDOMINIO,ECXTPCONEX,
  ECXCODCLI,ECXCODSUC)
VALUES
(
  1020, --- CODIGO ENTIDAD UTILIZADO POR LA ENTIDAD --
  'CONFTPABM', -- IDENTIFICADOR DE CONEXION --
  'Datos de conexion a servidor SFTP', -- DESCRIPCION DE REGISTRO -- 
  '               ',
  '          ',
  '',
  'SFTP           ', -- TIPO DE CONEXION --
  '22             ', -- PUERTO DE SERVIDOR SFTP --
  '10.1.254.116', -- IP DE SERVIDOR SFTP --
  'contiabm',  -- USUARIO DE SERVIDOR SFTP --
  'KSOrA0q14qeDMELxlFjYzg==', -- CONTRASEÑA CIFRADO CON BepCypherUI DE SERVIDOR SFTP --
  CURRENT USER, --- USUARIO ACTUALIZACION --
  CURRENT TIMESTAMP,
  ' ',
  ' ',
  '        ',
  '        ',
  '                                                                                                                                                                                                                                                          ',
  ' ',
  '                                                                                                                                                                                                        ',
  '          ',
  0,
  ' ',
  ' ',
  0,
  0
);


INSERT INTO GXTRJDTA.TENECX
(ECXCODENT, ECXIDCONEX, ECXDSCCONE, ECXBADTOIP, ECXBADTOUS, ECXBADTPAS, ECXSERVPRO, ECXSERVPO,
  ECXSERVIP,ECXSERVUS,ECXSERVPAS,ECXUSULTUP,ECXFHULTUP,ECXFRECUEN,ECXDIAHAB,ECXHORADES,
  ECXHORAHAS,ECXURLCONE,ECXDRIVER,ECXBABIBLD,ECXUSUPROC,ECXTIMEOUT,ECXDOMINIO,ECXTPCONEX,
  ECXCODCLI,ECXCODSUC)
VALUES
(
  4005, --- CODIGO ENTIDAD UTILIZADO POR LA ENTIDAD --
  'CONFTPABM', -- IDENTIFICADOR DE CONEXION --
  'Datos de conexion a servidor SFTP', -- DESCRIPCION DE REGISTRO -- 
  '               ',
  '          ',
  '',
  'SFTP           ', -- TIPO DE CONEXION --
  '22             ', -- PUERTO DE SERVIDOR SFTP --
  '10.1.254.116', -- IP DE SERVIDOR SFTP --
  'WALED',  -- USUARIO DE SERVIDOR SFTP --
  '2/2tBgFnZRnnxDzW8lHS6g==', -- CONTRASEÑA CIFRADO CON BepCypherUI DE SERVIDOR SFTP --
  CURRENT USER, --- USUARIO ACTUALIZACION --
  CURRENT TIMESTAMP,
  ' ',
  ' ',
  '        ',
  '        ',
  '                                                                                                                                                                                                                                                          ',
  ' ',
  '                                                                                                                                                                                                        ',
  '          ',
  0,
  ' ',
  ' ',
  0,
  0
);

************************************************************************
************************************************************************
***************************** Query 3 **********************************
Ejecutar Query por cada Entidad a dar de Alta, editar los campos según datos de la Entidad
select * from GXTRJDTA.TDSPAS
INSERT INTO GXTRJDTA.TDSPAS
(  PASIDPARSI,  PASDSPARSI,  PASVALOR1,  PASDSVAL1,  PASVALOR2,
  PASDSVAL2,  PASUSULTUP,  PASFHULTUP)
VALUES
(
  'RUTAABM1020', -- DEBE IR EL NOMBRE IDENTIFICADOR DE REGISTRO (RUTAABM) CONCATENADO EL CODIGO DE ENTIDAD EJEMPLO: RUTAABM1020
  'RUTA DE ARCHIVO ABM CREDITO',
  '/opt/aplicaciones/Tarjetas/archivos/Continental/', -- RUTA DE ORIGEN DE ARCHIVO, reemplazar Entidad por el nombre de la entidad
  ' ',
  '/home/jail/home/bco_continental/WSABM', -- RUTA DESTINO DE ARCHIVO -- Ruta donde se va a depositar el Archivo de respuesta al sftp de la Entidad
  '                              ',
  CURRENT USER,
  CURRENT TIMESTAMP
);
INSERT INTO GXTRJDTA.TDSPAS
(  PASIDPARSI,  PASDSPARSI,  PASVALOR1,  PASDSVAL1,  PASVALOR2,
  PASDSVAL2,  PASUSULTUP,  PASFHULTUP)
VALUES
(
  'RUTAABM4005', -- DEBE IR EL NOMBRE IDENTIFICADOR DE REGISTRO (RUTAABM) CONCATENADO EL CODIGO DE ENTIDAD EJEMPLO: RUTAABM1020
  'RUTA DE ARCHIVO ABM CREDITO',
  '/opt/aplicaciones/Tarjetas/archivos/Waled/', -- RUTA DE ORIGEN DE ARCHIVO, reemplazar Entidad por el nombre de la entidad
  ' ',
  '/home/jail/home/waled/WSABM', -- RUTA DESTINO DE ARCHIVO -- Ruta donde se va a depositar el Archivo de respuesta al sftp de la Entidad
  '                              ',
  CURRENT USER,
  CURRENT TIMESTAMP
);
************************************************************************


SELECT * FROM GXTRJDTA.TDSPWS WHERE PWSIDWEBS in ('PENT001', 'PSEG046', 'PABM001', 'PDSI004', 'PDSI006', 'PDGE013', 'PTCR003', 'PTCR004'); 
SELECT * FROM GXTRJDTA.TDSPRC WHERE PRCIDPROCE IN ('PENT001', 'PDGE013');
select * from gxtrjdta.TDSDPS WHERE PASIDPARSI = 'CorLimHr1' AND DPSAGRUP in ('Lim01','Lim02')
select * from gxtrjdta.TDSDPS WHERE PASIDPARSI = 'WSLIMHR' AND DPSAGRUP = 'ABMCREDWS' 

SELECT * /*DPSDValor1, DPSDValor2*/ FROM GXTRJDTA.TDSDPS t where PaSIdParSi = 'CORPARM' and DPSAgrup = 'CLAEMBOZADODIRENLACE';
