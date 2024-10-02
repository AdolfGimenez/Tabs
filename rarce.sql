--redmine testing #4008

--datos de la tarjeta
select *  from gxbdbps.tdemis where tdbinnro='703020'

--and TDCTANRO = '102025857' and TDEMFECALT = '20200121';

select *  from gxbdbps.tdcta where tdbinnro='703020' AND TDCTANRO LIKE '12%'; 
 
select *  from gxbdbps.tdctaad where tdbinnro='703020' AND TDCTANRO LIKE '12%';

select * from gxbdbps.tmctaaf where mcnumct ='2030003582'
select * from gxbdbps.gclieaf where cenumdo='389570'

select * from gxbdbps.GDIREAF
where cenumdo='389570'





select * from gxbdbps.tmtaraf where mttipot =3  and mtstats = '1' and enemiso =


select * from gxbdbps.tmtaraf where MTNUMTA like '6274310211000079' and enemiso = '021' a
update set 



select * from gxbdbps.tmoviaf where mvnumct='162040016964' and MTNUMTA <>'6274311620017563' and mvcodau='279508'

update gxbdbps.tmoviaf set mvnumct='162040019968' where mvnumct='162040016964' and MTNUMTA <>'6274311620017563' and mvcodau='279508'



select * from gxbdbps.tmoviaf where mvnumct='162040019968' and MTNUMTA <>'6274311620017563' and mvcodau in ('279508','124056')



--162040016964

select * from gxbdbps.tmoviaf where mtnumta='5429270000000019'

where MTNUMTA ='6274310020000047'


select * from gxbdbps.tmtaraf     
where mtnumta='6274310211000038'  

select * from gxbdbps.tmtaraf     
where mtnumta='627431021100053' 

delete gxbdbps.tmtaraf     
where mtnumta='627431021100053' 

select * from gxbdbps.TEMBSAF
where bsnumta='6274310211000046'

delete gxbdbps.TEMBSAF
where bsnumta='6274310211000046'

 

select * from libdebito.embnov0p
where crtarj='6274310211000046'

delete libdebito.embnov0p
where crtarj='627431021100053'

select * from gxbdbps.tmtaraf     
where mtnumta='6274310211000038'  


select * from gxbdbps.tmtaraf  where mtnumta like '%62743102%'
delete  gxbdbps.tmctaaf where mcnumct=20112100002


select * from gxbdbps.tmoviaf     
where mtnumta='6274310211000012'  


SELECT * from LIBDEBITO.EMBNOV0P WHERE CRENTI LIKE '021'

delete LIBDEBITO.EMBNOV0P WHERE CRENTI LIKE '021'



--INSERT INTO GXBDBPS.AUTARAF VALUES ('20190408', '021', '501', '6274310211000012', 1017386, 'M', 1, 'HFARIAS', '20190408',  095341, 0, 'Vencimiento de los renovados', '2108', '2108', 0, '001')



select * from gxbdbps.MTDFIC


Select * from gxbdbps.tdcta where tdbinentid='1020'
Select * from gxbdbps.tdcliente where tdbinentid='1020'
select * from gxbdbps.tdcliente where tdbinentid='1040' and tdclinrodoc='86853' or tdclinrodoc='4112593'
Select * from gxbdbps.tdemis where tdbinentid='1020'
Select * from gxbdbps.tdbin
Select * from gxbdbps.tdemisnov where tdbinentid='1020'
select * from gxbdbps.tmtaraf where enemiso='002'

 select b.affecie, b.affevto, a.melinea from gxbdbps.tmensaf a  inner join gxbdbps.tcieraf b on a.enemiso=b.enemiso and a.bibines=b.bibines and a.afafini=b.afafini and A.affecie = B.affecie where a.enemiso='002' and A.affecie like '201909%' and a.bibines = '514849' and a.afafini = '001' order by mesecue




Select * from gxbdbps.tdctaad where tdctanro='120179201'
where tdclinrodoc='86853' or tdclinrodoc='4112593'

select A.mtnumta, A.mvcodre, A.mvferea, A.mvfepro, A.mvcupon, B.cmdescr, A.mvimpo2 from GXBDBPS.tmoviaf A inner join GXBDBPS.tcmovaf B on B.cmcodig = A.cmcodig



select mtnumta, mvcodre, mvferea, mvfepro, mvcupon, mvnomco, mvimpo2 from GXBDBPS.tmoviaf where mvemiso = '" + emisor + "' and mvafini = '" + afinidad + "'

SELECT * FROM gxopera.oplicre WHERE OPCRECOM ='0200624'
and OPCREID='19062500000002'                           

select * from gxbdbps.tdemnotar
select * from gxbdbps.tdbinemb

SELECT *FROM GXBDBPS.MTDFIC 
--where ficcodig=1

delete GXBDBPS.MTDFIC
where ficcodig=7



select * from libdebito.embtrkdeb order by tkfee2




INSERT INTO GXBDBPS.MTDFIC
(
  FICCODIG,
  FICUOFTP,
  FICPOFTP,
  FICOSERV,
  FICOPORT,
  FICUDFTP,
  FICPDFTP,
  FICDSERV,
  FICDPORT,
  FICNOMAR,
  FICRUTAR,
  FICRUTOR,
  FICRUTDE,
  FICNOENT,
  FICNRENT,
  FICNRBIN,
  FICUSENT,
  FICHOPRO
)
VALUES
(
  '5   ',
  'QsQVdtOAW1cpejTzNFTJ2w==      ',
  '2JZhYTFj0HF3FEcaXCGYzQ==      ',
  '10.11.254.218  ',
  '22  ',
  'QsQVdtOAW1cpejTzNFTJ2w==      ',
  '2JZhYTFj0HF3FEcaXCGYzQ==      ',
  '10.11.254.218  ',
  '22  ',
  'CuentaRelacionada',
  '/opt/aplicaciones/CtasRelacionadas_TD/',
  '/Proyectos/CONTI_TC/CuentaRelacionada.txt ',
  '/Proyectos/CONTI_TC/ ',
  'CONTI',
  '1020',
  '703020',
  'USRCONTI',
  '1600'
);


select * from gxbdbps.tdctarel

date

INSERT INTO GXBDBPS.MTDFIC
(
  FICCODIG,
  FICUOFTP,
  FICPOFTP,
  FICOSERV,
  FICOPORT,
  FICUDFTP,
  FICPDFTP,
  FICDSERV,
  FICDPORT,
  FICNOMAR,
  FICRUTAR,
  FICRUTOR,
  FICRUTDE,
  FICNOENT,
  FICNRENT,
  FICNRBIN,
  FICUSENT,
  FICHOPRO
)
VALUES
(
  '5',
  'OM3vF6mwJaBMWeu3yENHzQ==',
  'c1OhzIY+XJaBvm8sjO1E9A==',
  '               ',
  '    ',
  '                              ',
  '                              ',
  '               ',
  '    ',
  '                              ',
  '                                                                                ',
  '                                                                                ',
  '                                                                                ',
  'Continental                                       ',
  '021 ',
  '      ',
  '               ',
  '1650'
);




INSERT INTO GXBDBPS.MTDFIC
(
  FICCODIG,
  FICUOFTP,
  FICPOFTP,
  FICOSERV,
  FICOPORT,
  FICUDFTP,
  FICPDFTP,
  FICDSERV,
  FICDPORT,
  FICNOMAR,
  FICRUTAR,
  FICRUTOR,
  FICRUTDE,
  FICNOENT,
  FICNRENT,
  FICNRBIN,
  FICUSENT,
  FICHOPRO
)
VALUES
(
  '6',
  'iUhyHu3SqG89T4Y+a4LWZQ==',
  'YJzhC/81hGbQVbGXmM2StA==',
  '10.1.254.116',
  '22',
  'QoyhlFCOh5SeleWSzEwogQ==',
  'UIi8QcVrYR4zfY2Le/Kfow==',
  '10.1.254.116',
  '22',
  'ctarel',
  '/bepsa/apps/CtasRelacionadas_TD/',
  '/home/jail/home/bco_continental/CTAREL_TD/ctarel.txt',
  '/home/jail/home/bco_continental/CTAREL_TD/',
  'Continental',
  '1020',
  '703020',
  'USRCONTI',
  '1650'
);


INSERT INTO GXBDBPS.MTDFIC
(
  FICCODIG,
  FICUOFTP,
  FICPOFTP,
  FICOSERV,
  FICOPORT,
  FICUDFTP,
  FICPDFTP,
  FICDSERV,
  FICDPORT,
  FICNOMAR,
  FICRUTAR,
  FICRUTOR,
  FICRUTDE,
  FICNOENT,
  FICNRENT,
  FICNRBIN,
  FICUSENT,
  FICHOPRO
)
VALUES
(
  '7',
  'iUhyHu3SqG89T4Y+a4LWZQ==',
  'YJzhC/81hGbQVbGXmM2StA==',
  '10.1.254.116',
  '22  ',
  'QoyhlFCOh5SeleWSzEwogQ==',
  'UIi8QcVrYR4zfY2Le/Kfow==',
  '10.1.254.116   ',
  '22  ',
  'td_alta_bin08contibepsa',
  '/bepsa/apps/AltasDC_TD/                                                         ',
  '/home/jail/home/bco_continental/ALTAS_TD/td_alta_bin08contibepsa.txt',
  '/home/jail/home/produccion/Altas_Conti_Deb/                                     ',
  'Continental                                       ',
  '1020',
  '456976',
  'USRCONTIVISA',
  '1650'
);


select * from gxbdbps.tdbindet
where tdbinnro='456976'

select * from gxbdbps.tdatrval





INSERT INTO GXBDBPS.TDATRVAL
(
  TDAVCAMPO,
  TDAVVALOR,
  TDAVDESC
)
VALUES
(
  'NROTARENT           ',
  'SI                                      ',
  'La entidad se encarga de enviarnos el número de tarjeta SI/NO'
);

select * from gxbdbps.tdemnotar


INSERT INTO GXBDBPS.MTDFIC
(
  FICCODIG,
  FICUOFTP,
  FICPOFTP,
  FICOSERV,
  FICOPORT,
  FICUDFTP,
  FICPDFTP,
  FICDSERV,
  FICDPORT,
  FICNOMAR,
  FICRUTAR,
  FICRUTOR,
  FICRUTDE,
  FICNOENT,
  FICNRENT,
  FICNRBIN,
  FICUSENT,
  FICHOPRO
)
VALUES
(
  '6   ',
  'QsQVdtOAW1cpejTzNFTJ2w==      ',
  '2JZhYTFj0HF3FEcaXCGYzQ==      ',
  '10.11.254.218   ',
  '22  ',
  'QsQVdtOAW1cpejTzNFTJ2w==      ',
  '2JZhYTFj0HF3FEcaXCGYzQ==      ',
  '10.11.254.218   ',
  '22  ',
  'td_alta_contibepsa            ',
  '/opt/aplicaciones/AltasDC_TD/                                                ',
  '/Proyectos/CONTI_TC/td_alta_contibepsa.txt                 ',
  '/Proyectos/CONTI_TC/                                     ',
  'Continental                                       ',
  '1020',
  '703020',
  'USRCONTI       ',
  '0950'
);


SELECT * FROM GXBDBPS.TGTCLF


932945

SELECT * FROM GXBDBPS.GCLIEAF where cenumdo='5064677'
WHERE CENUMDO='021'


SELECT * FROM GXBDBPS.tmtaraf   
             WHERE ENEMISO='021'
             
SELECT * FROM GXBDBPS.TMCTAAF
WHERE MCNUMDO='932945'


SELECT * FROM GXBDBPS.TDEMIS
WHERE TDCTANRO='127271016'



select * from gxbdbps.tafinaf where enemiso='021'

select * from Gxbdbps.codtoaf

select * from Gxbdbps.colocaf

select * from Gxbdbps.gsucuaf where enemiso = '021'
select * from Gxbdbps.gsaldaf where enemiso = '021'


select * from Gxbdbps.tectaaf where enemiso = '022' and ecidusr = '4422886'
select * from Gxbdbps.tmanencta where mceene = '021' and mecpid = '4422886'


select * from Gxbdbps.tmctaaf WHERE mcemiso = '021' and mcnumdo = '3794254'
select * from Gxbdbps.auctaaf where acemiso = '021' and acnumct = 21400000010

select * from Gxbdbps.tmtaraf WHERE mtnumta = '5429270200000116'
select * from Gxbdbps.aucliaf where alemiso = '021' and alnumdo = '3794254'
select * from Gxbdbps.Gdireaf where enemiso = '021' and cenumdo = '3794254'
select * from Gxbdbps.audiraf where aeemiso = '021' and aenumdo = '3794254'
select * from gxbdbps.tgtclf where clfcci = '3794254'

select * from Gxbdbps.tmmota   
select * from Gxbdbps.tdmota 

select * from flaralib.tmmota   
select * from Gxbdbps.tdmota 
                                
select * from Gxbdbps.auctaaf where acemiso = '021' and acnumct = 21060000078
select * from gxbdbps.TCCCTAF where kcnumct = '21060000078'

select * from Gxbdbps.tectaaf where enemiso = '021' and ecidusr = '3809278'
select * from Gxbdbps.tmanencta where mceene = '021' and mecpid = '3809278'

select * from Gxbdbps.autaraf where atemiso = '021' and atnumta ='5429270200000116'


select * from Gxbdbps.tcuenocob where cnccue = 21060000078
select * from Gxbdbps.tctaexcar where ceccta = 21060000078





select * from GXBDBPS.prmerr 


select * from dcash.DC_0014 

select * from gxbdcon.gxlousu where usuaid='U99HERNAN'

select * from  GXBDBPS.MTDFIC

INSERT INTO GXBDBPS.MTDFIC
(
  FICCODIG,
  FICUOFTP,
  FICPOFTP,
  FICOSERV,
  FICOPORT,
  FICUDFTP,
  FICPDFTP,
  FICDSERV,
  FICDPORT,
  FICNOMAR,
  FICRUTAR,
  FICRUTOR,
  FICRUTDE,
  FICNOENT,
  FICNRENT,
  FICNRBIN,
  FICUSENT,
  FICHOPRO
)
VALUES
(
  '8   ',
  'vBBDVCzXbeB6vdkzCP69jQ==      ',
  'gjaWEvDHi6CGhK6vXRjNvA==      ',
  '',
  '  ',
  '     ',
  '   ',
  '   ',
  ' ',
  '             ',
  '',
  '        ',
  '                       ',
  'Rio                                               ',
  '1040',
  '',
  '     ',
  ''
);

 SELECT TDBINENTID, TDBINNRO FROM GXBDBPS.TDBIN WHERE TDBINNRO ='SELECT TDBINENTID, TDBINNRO FROM GXBDBPS.TDBIN WHERE TDBINNRO ='1040''


SELECT TDBINENTID, TDBINNRO FROM GXBDBPS.TDBIN WHERE TDBINNRO ='703040'


CREATE TABLE GXBDBPS.JALERR
(
ALERRIDENT DECIMAL NOT NULL,
ALERRCUENT CHAR NOT NULL,
ALERRENTID CHAR,
ALERRNOBIN CHAR,
ALERRDESCR CHAR NOT NULL,
ALERRFECHA CHAR,
ALERRHORAP CHAR
);

ALTER TABLE GXBDBPS.JALERR
ADD CONSTRAINT GXBDBPS.JALERR_PK
PRIMARY KEY (ALERRIDENT);
COMMENT ON TABLE GXBDBPS.JALERR IS 'Tabla con descripcion de errores en las alta de Tarjetas de Debito';
COMMENT ON COLUMN GXBDBPS.JALERR.ALERRIDENT IS 'Secuencia de insercion';
COMMENT ON COLUMN GXBDBPS.JALERR.ALERRCUENT IS 'Numero de cuenta';
COMMENT ON COLUMN GXBDBPS.JALERR.ALERRENTID IS 'Numero de Entidad procesada';
COMMENT ON COLUMN GXBDBPS.JALERR.ALERRNOBIN IS 'Numero de Bin de la Entidad';
COMMENT ON COLUMN GXBDBPS.JALERR.ALERRDESCR IS 'Descripcion del error al procesar el alta';
COMMENT ON COLUMN GXBDBPS.JALERR.ALERRFECHA IS 'Fecha de error de la insercion';
COMMENT ON COLUMN GXBDBPS.JALERR.ALERRHORAP IS 'Hora de error de la insercion';
GRANT SELECT, INDEX, UPDATE, INSERT, DELETE, REFERENCES, ALTER ON GXBDBPS.JALERR TO PUBLIC;

select * from GXBDBPS.JALERR

select * from gxbdbps.mtd


CREATE TABLE GXBDBPS.JALERR
(
   ALERRIDENT DECIMAL(9)   NOT NULL,
   ALERRCUENT CHAR(12)    NOT NULL,
   ALERRENTID CHAR(4),
   ALERRNOBIN CHAR(6),
   ALERRDESCR CHAR(999)	NOT NULL,
   ALERRFECHA CHAR(8),
   ALERRHORAP CHAR(8) 
);


select * from GXBDBPS.JALERR

ALTER TABLE GXBDBPS.JALERR
   ADD CONSTRAINT GXBDBPS.JALERR_PK
   PRIMARY KEY (ALERRIDENT);
COMMENT ON TABLE GXBDBPS.JALERR IS 'Tabla con descripcion de errores en las alta de Tarjetas de Debito';
COMMENT ON COLUMN GXBDBPS.JALERR.ALERRIDENT IS 'Secuencia de insercion';
COMMENT ON COLUMN GXBDBPS.JALERR.ALERRCUENT IS 'Numero de cuenta';
COMMENT ON COLUMN GXBDBPS.JALERR.ALERRENTID IS 'Numero de Entidad procesada';
COMMENT ON COLUMN GXBDBPS.JALERR.ALERRNOBIN IS 'Numero de Bin de la Entidad';
COMMENT ON COLUMN GXBDBPS.JALERR.ALERRDESCR IS 'Descripcion del error al procesar el alta';
COMMENT ON COLUMN GXBDBPS.JALERR.ALERRFECHA IS 'Fecha de error de la insercion';
COMMENT ON COLUMN GXBDBPS.JALERR.ALERRHORAP IS 'Hora de error de la insercion';
GRANT SELECT, INDEX, UPDATE, INSERT, DELETE, REFERENCES, ALTER ON GXBDBPS.JALERR TO PUBLIC;
COMMIT;


select * from GXBDBPS.MTDFIC


SELECT * FROM libdebito.embtrkdeb WHERE TKENTI ='020' and
tkbine='456976' and      


update libdebito.embtrkdeb set tkstat=''
WHERE TKENTI ='020' and
TKFEE2='20191017'     
and    tkbine='456976'         q

select    * from

libdebito.embtrkdeb 
WHERE TKENTI ='165' and
TKFEE2='20191017'     
and    tkbine='456976'                  



select * from gxbdbps.tdcta where tdbinnro='456976' tdctatar='4569760001000059'

select * from gxbdbps.tclasaf

select * from gxbdbps.tdbindet where tdbinnro='456976'

delete gxbdbps.conctatar where conumcta ='20112100017'

select * from gxbdbps.tmmota order by motafec

select * from gxbdbps.conctatar

INSERT INTO GXBDBPS.MTDFIC
(
  FICCODIG,
  FICUOFTP,
  FICPOFTP,
  FICOSERV,
  FICOPORT,
  FICUDFTP,
  FICPDFTP,
  FICDSERV,
  FICDPORT,
  FICNOMAR,
  FICRUTAR,
  FICRUTOR,
  FICRUTDE,
  FICNOENT,
  FICNRENT,
  FICNRBIN,
  FICUSENT,
  FICHOPRO
)
VALUES
(
  '12  ',
  'iUhyHu3SqG89T4Y+a4LWZQ==      ',
  'YJzhC/81hGbQVbGXmM2StA==      ',
  '10.1.254.116   ',
  '22  ',
  'QoyhlFCOh5SeleWSzEwogQ==      ',
  'UIi8QcVrYR4zfY2Le/Kfow==      ',
  '10.1.254.116   ',
  '22  ',
  'td_alta_visaconti             ',
  '/bepsa/apps/AltasDC_TD/                                                         ',
  '/home/jail/home/bco_continental/ALTAS_TD/td_alta_visaconti.txt                  ',
  '/home/jail/home/produccion/Altas_Conti_Deb/                                     ',
  'Continental                                       ',
  '1020',
  '456976',
  'USRCONTI       ',
  '0945'
);

//SE ASOCIA LA NUEVA TARJETA A LA CUENTA SI ES PRINCIPAL	 
select * from gxbdbps.tdemis where tdbinentid =  ('1020') 
and tdemfecalt BETWEEN '20191127' and '20191127' and tdempinoff='456DA212FC29A93B'


-----------Transmisiones------------
select * from Gxbdbps.tmmota   
select * from Gxbdbps.tdmota order by motasec desc

------------Nro de cuenta-------------
select * from gxbdbps.tmctaaf where mcemiso = '021'
select * from Gxbdbps.tmctaaf where mcemiso = '021' and mcnumct = 20112100003
select * from Gxbdbps.tmctaaf where mcnumdo = '20112100007'

------------Nro de tarjeta-------------
select * from gxbdbps.tmtaraf where enemiso = '021' and mtnumta = 6274310211987654  --tarjeta no existe en la prueba
select * from gxbdbps.tmtaraf where enemiso = '021' and mttipot like 3 and mtnumta = 6274310211000038
select * from Gxbdbps.tmtaraf where enemiso = '021' and mtnumta like '%0095%'
select * from Gxbdbps.tmtaraf where enemiso = '021' and mtnumta = 6274310210000261
select * from Gxbdbps.tmtaraf where enemiso = '021' and bibines = 627431 and mcnumct = 21030000543    like '%0079%'
select * from Gxbdbps.tmtaraf where enemiso = '021' and mcnumct = 21030000109
select mtnumta from Gxbdbps.tmtaraf where mtnumta = 6274310211000020

----------duracion de vencimiento por afinidad-------------------
SELECT * FROM FLARALIB.TAFINAF WHERE BIBINES LIKE '627431' AND ENEMISO LIKE '021' AND AFAFINI LIKE '001'
SELECT AFDURAC FROM FLARALIB.TAFINAF WHERE BIBINES LIKE '627431' AND ENEMISO LIKE '021' AND AFAFINI LIKE '001'


-----------tabla de control de horarios ---------
SELECT * FROM GXBDBPS.MTDFIC
SELECT * FROM GXBDBPS.MTDFIC
SELECT * FROM GXBDBPS.MTDFIC WHERE FICNOMAR LIKE '%CuentaRelacionada%'
SELECT FICHOPRO FROM GXBDBPS.MTDFIC WHERE FICNOENT like '%Continental%' AND FICNRENT = '021'

--------tabla de embozado----------
SELECT * FROM LIBDEBITO.EMBNOV0P 
 
--para pruebas de regrabacion de tarjeta
select * from gxbdbps.tmtaraf where enemiso = '021' and mtnumta = 6274310210000260  --tarjeta no existe en la prueba, se crea para el efecto
select * from gxbdbps.tmtaraf where enemiso = '021' and mtnumta = 6274310211000012
select * from Gxbdbps.tmctaaf where mcemiso = '021' and mcnumct = 20112100001

--para prueba de tarjeta adicional
select * from gxbdbps.tmtaraf where enemiso = '021' and mtnumta = 6274310210000261  --tarjeta no existe en la prueba, se crea para el efecto
select * from gxbdbps.tmtaraf where enemiso = '021' and mttipot like 3 and mtnumta = 6274310211000038
select * from Gxbdbps.tmctaaf where mcemiso = '021' and mcnumct = 20112100003

select * from libdebito.drcondeb



------caso de continental credito ws, activacion de tarjetas------------------
select * from GXBDBPS.tmtaraf where enemiso = '021' and mtnumta = '6274310211000046' 

--verificar en tmoviaf si existe pago 

--Auditoria Tmtaraf--
select * from GXBDBPS.autaraf where atemiso = '021' and atafini = '501' and atnumta = '6274310211000046' 
-- Cuentas --
select * from gxbdbps.tmctaaf where mcemiso = '021' and  mcnumct = '20150500001'  
--Datos de embosado--  
select * from gxbdbps.tembsaf where bsemiso = '021' and bsnumta = '2307290000000037' 


select * from gxbdbps.tmtaraf where enemiso = '021' and MTNUMTA = '2307290000099999'
 
--Datos de tafinaf--
select * from gxbdbps.tafinaf where enemiso = '021' and afafini = '501' and afcobem = '002'
select afcuemp, afcurep, afcurgp, afcupip from gxbdbps.tafinaf where enemiso = '021' and afafini = '501' and afcobem = '002' --Cuotas T principal --
select afcuema, afcurea, afcurga, afcupia from gxbdbps.tafinaf where enemiso = '021' and afafini = '501' and afcobem = '002' --Cuotas T adicional-- 
select afcoemp, afcorep, afcorgp, afcopip from gxbdbps.tafinaf where enemiso = '021' and afafini = '501' and afcobem = '002' --Importe T principal --
select afcoema, afcorea, afcurga, afcorga from gxbdbps.tafinaf where enemiso = '021' and afafini = '501' and afcobem = '002' --Importe T adicional -- 
--Detalle y cabecera de cuotas--
select * from gxbdbps.tcuotaf --(cabecera)-- 
select * from gxbdbps.tcuotaf where cmcodig in ('050', '060', '070', '080') and cuidusr ='USERWS' and cuferea ='20191119' and  mtnumta = '6274310211000095' in ('6274310211000153', '6274310210000617', '6274310211000204', '6274310210000633') = '6274310211000095'
select * from	gxbdbps.tcuo1af --(detalle)--
select * from	gxbdbps.tcuo1af where cmcodig in ('050', '060', '070', '080') and cuidusr ='USERWS' and mtnumta= '6274310211000095' in ('6274310211000153', '6274310210000617', '6274310211000204', '6274310210000633') = '6274310211000095' 
--Tmoviaf para una sola cuota--
select * from gxbdbps.tmoviaf where cmcodig in ('050', '060', '070', '080') 
select * from gxbdbps.tmoviaf where MVSECUE = '004544213546'

select * from gxbdbps.tmovpag
--where mtnumta = '6274310211000012' in ( '6274310210000716', '6274310210000625', '6274310210000641') ('6274310211000153', '6274310210000617', '6274310211000204', '6274310210000633') = '6274310211000095' 
--Datos de MOvimientos--
select * from gxbdbps.tcmovaf
SELECT CMDESCR FROM Gxbdbps.TCMOVAF WHERE CMCODIG in ('050', '060', '070', '080')  


----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------
--Pruebas de alta--
--NO ELIMINAR-- 
select * from Gxbdbps.tbineaf where enemiso='020' and bibines = '627431' 
select * from Gxbdbps.tafinaf where enemiso='021' and bibines = '627431'

--Datos del cliente--
select * from Gxbdbps.gclieaf where enemiso = '041' and cenumdo = '4842196'    2233445          '0000000017873-4'   6666666   9158580
select * from flaralib.gclieaf where enemiso = '021' and cenumdo in ('99900056', '2288719')
select * from gxbdbps.gclieaf where enemiso = '021' and cenumdo in ('99900056', '2288719')
select * from flaralib.aucliaf where alemiso = '021' and alnumdo = '000000002288719'
SELECT * FROM GXBDBPS.GCLIEAF WHERE ENEMISO = '021' AND CETIPOD = 'C' AND CENUMDO = '5094711'
select cenumdo, cenomb1, cenomb2, ceapel1, ceapel2, cenumru, cesexo, ceecivi, cefenac, mocodig, cetipoc, cenumdc, ceempre, prcodig, cetipov, cesalar, ceultsc, ceapeca, ceapnom, cefeing, cehorin, ceusrin, cenumd2, cesocio from gxbdbps.gclieaf where enemiso = '021' and cetipod = 'C' and cenumdo = '8855661'

--Direcciones del cliente--
select * from gxbdbps.Gdireaf where enemiso = '041' and cenumdo = '4842196'
select * from flaralib.Gdireaf where enemiso = '021' and cenumdo = '99900056'
select * from Gxbdbps.audiraf where aeemiso = '021'  and aenumdo = '6666666'
select * from Gxbdbps.audiraf where aeemiso = '021'  and aesecue = 6 and aenumdo = '6666666'
--Calificacion BNF--
select * from gxbdbps.tgtclf where clfcci = '4842196'	
select * from flaralib.tgtclf where clfcci = '6666661'	
TGTCLF
update Gxbdbps.tgtclf set clfnom = (select trim(cenomb1) || ' ' || trim(cenomb2) from Gxbdbps.gclieaf where enemiso = '021' and cenumdo = '4436424'), clfape = (select trim(ceapel1) || ' ' || trim(ceapel2) from Gxbdbps.gclieaf where enemiso = '021' and cenumdo = '4436424') where clfcci = '4436424' and clffch = '20190831'
update Gxbdbps.tgtclf set clfnom = (select trim(cenomb1) || ' ' || trim(cenomb1) from Gxbdbps.gclieaf where enemiso = '021' and cenumdo = '833884'), clfape = (select trim(ceapel1) || ' ' || trim(ceapel1) from Gxbdbps.gclieaf where enemiso = '021' and cenumdo = '833884') where clfcci = '833884' and clffch = '20190831'
update Gxbdbps.tgtclf set clfnom = (select trim(cenomb1) || ' ' || trim(cenomb1) from Gxbdbps.gclieaf where enemiso = '021' and cenumdo = '1568730'), clfape = (select trim(ceapel1) || ' ' || trim(ceapel1) from Gxbdbps.gclieaf where enemiso = '021' and cenumdo = '1568730') where clfcci = '1568730' and clffch = '20190831'
update flaralib.tgtclf set clfnom = (select trim(cenomb1) || ' ' || trim(cenomb2) from flaralib.gclieaf where enemiso = '021' and cenumdo = '4436424'), clfape = (select trim(ceapel1) || ' ' || trim(ceapel2) from flaralib.gclieaf where enemiso = '021' and cenumdo = '4436424') where clfcci = '4436424' and clffch = '20190831'
update Gxbdbps.tgtclf set clfnom = (select trim(cenomb1) || ' ' || trim(cenomb1) from Gxbdbps.gclieaf where enemiso = '021' and cenumdo = '3519445'), clfape = (select trim(ceapel1) || ' ' || trim(ceapel1) from Gxbdbps.gclieaf where enemiso = '021' and cenumdo = '3519445') where clfcci = '3519445' and clffch = '20190831'
update Gxbdbps.tgtclf set clfnom = (select trim(cenomb1) || ' ' || trim(cenomb1) from Gxbdbps.gclieaf where enemiso = '021' and cenumdo = '3390568'), clfape = (select trim(ceapel1) || ' ' || trim(ceapel1) from Gxbdbps.gclieaf where enemiso = '021' and cenumdo = '3390568') where clfcci = '3390568' and clffch = '20190831'
932945 			20112100001
--Datos de la cuenta
select * from Gxbdbps.tmctaaf WHERE mcemiso = '041' and mcnumct = '3'    
select * from gxbdbps.tmctaaf WHERE mcemiso = '021' and mcnumct in (20112100007, 20112100008,20112100009, 20112100010, 20112100015)
select * from flaralib.tmctaaf WHERE mcemiso = '021'MCTIPOC ='0'  and mcnumdo = '2288719'
select * from Gxbdbps.tmctaaf WHERE mcemiso = '021' and mcnumdo = '4842196'
select * from Gxbdbps.auctaaf where acemiso = '021' and acnumct = 21400000010
--Tasa personalizada de interes-
select * from gxbdbps.TCCCTAF where kcnumct = '21400000010'
--Oficial de la Cuenta y promotor de la cuenta--
select * from gxbdbps.tectaaf where enemiso = '021' and ecidusr = '4422886'
select max(eccodig) from Gxbdbps.tectaaf where enemiso = '021'
select * from gxbdbps.tmanencta where mceene = '021' and mecpid = '4422886'
--Numeros de control--
select * from GXBDBPS.CONCTATAR
select * from GXBDBPS.CONCTATAR where conemiso = '041' and conumcon = '23'
insert into Gxbdbps.conctatar values('021400000010', '7', '', '', 'R', '200')

--Datos del Codeudor--
select * from doloreslib.gclieaf where enemiso = '021' and cenumdo = '5522443'
select * from Gxbdbps.aucliaf where alemiso = '021' and alnumdo = '5522443' 
--Direcciones del Codeudor--
select * from Gxbdbps.Gdireaf where enemiso = '021' and cenumdo = '5522443'
select * from Gxbdbps.audiraf where aeemiso = '021' and aenumdo = '5522443'
--Datos de la tarjeta--
select * from Gxbdbps.tmtaraf where  mcnumct = '021400000010'
select * from GXBDBPS.tmtaraf where enemiso = '041' and cenumdo = '2288719' 
select * from flaralib.tmtaraf where enemiso = '002' and cenumdo = '334455'																and bibines = '627431' and mcnumct = 021080000082        20112075066    20112075067     20112075068
select * from Gxbdbps.tmtaraf where enemiso = '041' and mtnumta in (9999999990000004 )
select * from Gxbdbps.autaraf where  atnumta = '6274310210000013'  in (6274310210000047, 6274310210000054, 6274310210000112, 6274310210000062, 6274310210000120)
SELECT MTNUMTA, MTRETEN, SUCODIG FROM GXBDBPS.TMTARAF WHERE ENEMISO = '021' AND MCNUMCT = 20112100003 AND AFAFINI = '501'     AND MTSTATS
select * from Gxbdbps.autaraf where atemiso = '021' and atnumta in ('6274310211000038', '6274310211000053') 
select * from Gxbdbps.autaraf

select * from 
-- sucursales --
select * from flaralib.gsucuaf where enemiso = '021'
select * from flaralib.gsaldaf where enemiso = '021'
select mtnumta, mttipot, mtstats, mtestha, afafini, sucodig, mtfeemi from Gxbdbps.tmtaraf where mcnumct = 201120006 and mtestbl <> 'B'
--Codeudores con la tarjeta--
select * from Gxbdbps.tcodeaf
--Tabla de excepciones--
select * from Gxbdbps.tcuenocob where cnccue = 021080000082
select * from Gxbdbps.tctaexcar where ceccta = 021080000082
--Departamento, Ciudad, zona 
select * from Gxbdbps.codtoaf
select * from Gxbdbps.colocaf

--Tafinaf, datos por afinidad
select * from gxbdbps.tafinaf where enemiso = '041' and bibines = '627431' and afafini = '001'

select kftasa from Gxbdbps.tcconaf where enemiso = '021'
-- Tabla de errores --
select * from GXBDBPS.prmerr 

--Transmisiones--
select * from GXBDBPS.tmmota 					where motaent = '041' 
select * from GXBDBPS.tdmota ORDER BY MOTASEC DESC			where motaent = '021' 

--Tabla de usuarios-- 
SELECT * FROM GXBDBPS.MTDFIC


select * from gxbdbps.conctatar

ALTER TABLE GXBDBPS.CONCTATAR ADD CONEMISO CHAR(3);
COMMENT ON COLUMN GXBDBPS.CONCTATAR.CONEMISO IS 'Codigo de entidad emisora';


select A.affecie, A.affevto, B.melinea from GXBDBPS.tcieraf A inner join GXBDBPS.tmensaf B on B.affecie = A.affecie where A.enemiso = '021' and A.bibines = '627431' and A.afafini = '506' and A.affecie like '%';

SELECT * from LIBDEBITO.EMBNOV0P WHERE CRENTI LIKE '021'

select * grom gxbdbps.mtdfi

INSERT INTO GXBDBPS.PRMERR
(
  ERRORID,
  ERRORDSC
)
VALUES
(
  179,
  'Vencimiento de la tarjeta incorrecto                                                                '
);

INSERT INTO GXBDBPS.PRMERR
(
  ERRORID,
  ERRORDSC
)
VALUES
(
  180,
  'Pago ya realizado                                                                                   '
);

INSERT INTO GXBDBPS.PRMERR
(
  ERRORID,
  ERRORDSC
)
VALUES
(
  181,
  'Error al procesar el pago                                                                           '
);

INSERT INTO GXBDBPS.PRMERR
(
  ERRORID,
  ERRORDSC
)
VALUES
(
  182,
  'No existe movimiento que cumpla con los parametros recibidos                                        '
);

INSERT INTO GXBDBPS.PRMERR
(
  ERRORID,
  ERRORDSC
)
VALUES
(
  183,
  'Error al procesar movimiento especial                                                               '
);

INSERT INTO GXBDBPS.PRMERR
(
  ERRORID,
  ERRORDSC
)
VALUES
(
  184,
  'Codigo de moneda incorrecto                                                                         '
);

INSERT INTO GXBDBPS.PRMERR
(
  ERRORID,
  ERRORDSC
)
VALUES
(
  185,
  'Importe de movimiento incorrecto                                                                    '
);

INSERT INTO GXBDBPS.PRMERR
(
  ERRORID,
  ERRORDSC
)
VALUES
(
  186,
  'Id tipo de cargo incorrecto                                                                         '
);

INSERT INTO GXBDBPS.PRMERR
(
  ERRORID,
  ERRORDSC
)
VALUES
(
  187,
  'Id tipo de saldo incorrecto                                                                         '
);

INSERT INTO GXBDBPS.PRMERR
(
  ERRORID,
  ERRORDSC
)
VALUES
(
  188,
  'Tipo de movimiento incorrecto                                                                       '
);

INSERT INTO GXBDBPS.PRMERR
(
  ERRORID,
  ERRORDSC
)
VALUES
(
  189,
  'Valor financia movimiento incorrecto                                                                '
);

INSERT INTO GXBDBPS.PRMERR
(
  ERRORID,
  ERRORDSC
)
VALUES
(
  190,
  'Forma Cálculo IVA incorrecto                                                                        '
);

INSERT INTO GXBDBPS.PRMERR
(
  ERRORID,
  ERRORDSC
)
VALUES
(
  191,
  'Id impuesto incorrecto                                                                              '
);

INSERT INTO GXBDBPS.PRMERR
(
  ERRORID,
  ERRORDSC
)
VALUES
(
  192,
  'Importe de pago incorrecto                                                                          '
);

INSERT INTO GXBDBPS.PRMERR
(
  ERRORID,
  ERRORDSC
)
VALUES
(
  193,
  'Vencimiento de la tarjeta no puede ser menor a lo establecido por la afinidad de la entidad         '
);

INSERT INTO GXBDBPS.PRMERR
(
  ERRORID,
  ERRORDSC
)
VALUES
(
  194,
  'Motivo Retención invalido                                                                           '
);

INSERT INTO GXBDBPS.PRMERR
(
  ERRORID,
  ERRORDSC
)
VALUES
(
  195,
  'Error al procesar la solicitud                                                                      '
);
select * from GXBDBPS.PRMERR

--redmine testing #5468, PARA ESTAS PRUEBAS EL ENEMISO PUEDE SER 021 O 002

select * from gxbdbps.tmtaraf where enemiso = '021'

-- 1.- consultar en el  tmtaraf el numero de tarjeta
select * from gxbdbps.tmtaraf where enemiso = '021' and MTNUMTA like '6274310210000013' 
select * from gxbdbps.tmtaraf where enemiso = '021' and MTNUMTA like '6274310211000038'
select * from gxbdbps.tmtaraf where enemiso = '021' and MTNUMTA like '6274310211000046'
select * from gxbdbps.tmtaraf where enemiso = '021' and MTNUMTA like '6274310211000079'

select * from gxbdbps.tmtaraf where enemiso = '021'

--2.- consultar el numero de cuenta asociado al numer100000o de tarjeta
select * from gxbdbps.tmctaaf where mcemiso = '021' and  mcnumct = '21040000060'
select * from gxbdbps.tmctaaf where mcemiso = '021' and  mcnumct = '20112100003'
select * from gxbdbps.tmctaaf where mcemiso = '021' and  mcnumct = '20112100004'
select * from gxbdbps.tmctaaf where mcemiso = '021' and  mcnumct = '20112100005'

--tmoviaf
select * from gxbdbps.tmoviaf where MVNUMCT = '20150500001' order by MVHORA desc

--tabla que utiliza el proceso para poder generarse debidamente
select *  from gxbdbps.tcmovaf order by CMCODIG

--prueba2
select * from gxbdbps.tmtaraf where enemiso = '021' and MTNUMTA like '6274310211000038'
select * from gxbdbps.tmtaraf where enemiso = '021' and MTNUMTA like '6274310211000020'

select * from gxbdbps.tmctaaf where mcemiso = '021' and  mcnumct = '20112100003'
select * from gxbdbps.tmctaaf where mcemiso = '021' and  mcnumct = '20112100007'

--prueba 3
select * from gxbdbps.tmtaraf where enemiso = '021' and MTNUMTA like '6274310211000053'
select * from gxbdbps.tmtaraf where enemiso = '021' and MTNUMTA like '6274310211000020'
select * from gxbdbps.tmtaraf where enemiso = '021' and MTNUMTA like '6274310211000012'

select * from gxbdbps.tmctaaf where mcemiso = '021' and  mcnumct = '20112100003'
select * from gxbdbps.tmctaaf where mcemiso = '021' and  mcnumct = '20112100002'
select * from gxbdbps.tmctaaf where mcemiso = '021' and  mcnumct = '20112100001'

--pruebas con 002
--PRUEBA1
select * from gxbdbps.tmtaraf where enemiso = '021' and MTNUMTA like '6274310211000038'

select * from gxbdbps.tmctaaf where mcemiso = '021' and  mcnumct = '20112100003'

select * from gxbdbps.tmoviaf where MVNUMCT = '20112100003' order by MVHORA desc

--prueba 2
select * from gxbdbps.tmtaraf where enemiso = '021' and MTNUMTA like '6274310211000012'
select * from gxbdbps.tmtaraf where enemiso = '021' and MTNUMTA like '6274310211000038'

select * from gxbdbps.tmctaaf where mcemiso = '021' and  mcnumct = '20112100001'
select * from gxbdbps.tmctaaf where mcemiso = '021' and  mcnumct = '20112100003'
----------------------------------------------------------------------------
----------------------------------------------------------------------------
----------------------------------------------------------------------------
--redmine #5857, Corrección de WS de Bloqueo/Desbloqueo de TC Continental
----------------------------------------------------------------------------
----------------------------------------------------------------------------
----------------------------------------------------------------------------
--para consultar numero de tarjeta de entidad Continental
select * from gxbdbps.tmtaraf where enemiso = '021' and MTNUMTA = '2307290000000029'

--verificar los campos BLCODIG (codigo de bloqueo) y MTESTBL (estado del bloqueo de la tarjeta)
--tarjeta 1 2307290000000029, orig. codigo 00, estado vacio
	--1 bloqueo, codigo 5 OK (aplicado el bloqueo, datos datjeta ok, auditoria ok)
	--2 bloqueo, codigo 3 ok (no aplica cambios)
	--3 desbloqueo ok (aplicado el desbloqueo, datos datjeta ok, auditoria ok)
	--4 bloqueo, codigo 3, accion Keysensitive (bloqueo, BLOQUEO)
		--cuando se envia la accion BLOQUEO, la tarjeta cambia a estado bloqueado, pero cuando se envia la accion bloqueado en minusculas, la tarjeta vuelve a desbloquearse
	--5 bloqueo, codigo 00
		--cuando la tarjeta recibe un codigo de motivo para bloqueo distinta a las opciones prefijadas, la tarjeta igual se bloquea, y el campo BLCODIG cambia a 04 para estos casos.
	--6 bloqueo, codigo 9 OK (aplicado el bloqueo, datos datjeta ok, auditoria ok)
	--PRUEBAS 27/03/2020
--tarjeta 2 2307290000000011, ORIG. CODIGO 05, ESTADO B
	--1 desbloqueo ok (aplicado el desbloqueo, datos datjeta ok, auditoria ok) se probaron las acciones de minusculas y mayusculas, resultando exitosas
	--2 bloqueo ok (aplicado el desbloqueo, datos datjeta ok, auditoria ok) ok con las correcciones de recepcion de datos keysensitive

--CONSULTAR DATOS DE TARJETA
select BLCODIG, MTESTBL from gxbdbps.tmtaraf where enemiso = '021' and mtnumta  = '2307290000000029'

--AUDITORIA DE CAMBIOS EN LA TARJETA
select * from gxbdbps.autaraf where atemiso = '021' and atnumta = '2307290000000029' ORDER BY ATNUMSE ASC


INSERT INTO GXBDBPS.TCMOVAF
(
  CMCODIG,
  CMDESCR,
  CMTIPOM,
  CMGEIVA,
  CMTIPOE,
  CMSEAFE,
  CMSAFAC,
  CMSFNVE,
  CMSALFI,
  CMDISCO,
  CMDISCU,
  CMAUTPE,
  CMAPAGO,
  CMFEUCO,
  CMFEUCA,
  CMFINAN,
  CMCUOPE,
  CMADEPE,
  CMREFPE,
  CMFINSU,
  CMCUOTA,
  CMOPRDR,
  CMEXTRA,
  CMTVAFI,
  CMPREVI,
  CMAUTPD,
  CMOPESP,
  CMCUOCL,
  CMESCRG,
  CMESCOM,
  CMOCULT,
  CMPIVA
)
VALUES
(
  '170',
  'AJUSTE AL PAGO MINIMO                   ',
  'D',
  'N',
  'A',
  'U',
  'N',
  'N',
  'N',
  'N',
  'N',
  'N',
  'N',
  'S',
  'N',
  'N',
  'N',
  'N',
  'N',
  'N',
  'N',
  '      ',
  'N',
  'N',
  'N',
  '   ',
  '   ',
  '   ',
  'N',
  'N',
  'S',
  10.00000
);
INSERT INTO GXBDBPS.TCMOVAF
(
  CMCODIG,
  CMDESCR,
  CMTIPOM,
  CMGEIVA,
  CMTIPOE,
  CMSEAFE,
  CMSAFAC,
  CMSFNVE,
  CMSALFI,
  CMDISCO,
  CMDISCU,
  CMAUTPE,
  CMAPAGO,
  CMFEUCO,
  CMFEUCA,
  CMFINAN,
  CMCUOPE,
  CMADEPE,
  CMREFPE,
  CMFINSU,
  CMCUOTA,
  CMOPRDR,
  CMEXTRA,
  CMTVAFI,
  CMPREVI,
  CMAUTPD,
  CMOPESP,
  CMCUOCL,
  CMESCRG,
  CMESCOM,
  CMOCULT,
  CMPIVA
)
VALUES
(
  '171',
  'AJUSTE AL PAGO MINIMO                   ',
  'C',
  'N',
  'A',
  'U',
  'N',
  'N',
  'N',
  'N',
  'N',
  'N',
  'N',
  'S',
  'N',
  'N',
  'N',
  'N',
  'N',
  'N',
  'N',
  '      ',
  'N',
  'N',
  'N',
  '   ',
  '   ',
  '   ',
  'N',
  'N',
  'S',
  10.00000
);

--testing #6044 - Web Service Rest Datos financieros TC

--consultar datos de tarjeta en BD

select * from gxbdbps.tmtaraf where enemiso = '021'


select * from gxbdbps.tmtaraf where enemiso = '021' and MTNUMTA like '2307290000000151'

select * from gxbdbps.tmctaaf where mcemiso = '021' and  mcnumct = '21080000074'

select * from gxbdbps.tmoviaf where MVNUMCT = '20112100003' order by MVHORA desc


--boca de cobranza

-- CABECERA FACTURA--
SELECT * FROM GXOPERA.FACTURA where facsaldo > 0 and faclien = '0100103' and facstatus = 'P' and factnro = '10030001305'*/

select * from gxopera.factura where factnro = '10030001968' and facstatus = 'P' --faclien = '0100001'--FACSTATUS ='P' and FACLIEN ='5600053' and FACUSER='U99ROJAS'
-- DETALLE FACTURA--
SELECT * FROM GXOPERA.FACTURA1 WHERE FACTNRO = 10030001968
-- TABLA DE RECIBOS --

SELECT * FROM GXOPERA.FCOBROS where comcomer = '0901445' order by comfereal
-- TABLA DE COMERCIOS --
-
SELECT * FROM GXBDBPS.COMAEAF where cocomer = '4500125' --where CORUCN = '6087231-4'

select * from gxbdbps.gclieaf where 

SELECT * FROM GXOPERA.FACTURA WHERE FACTNRO = '10030018963' AND FACSTATUS = 'P'


--bloqueo - desbloqueo tarjetas de debito Continental

select * from gxbdbps.tdemis where tdctanro = '102701661'

select * from gxbdbps.tdcta where TDBINNRO = '703020'-- tdctanro = '102025857'

--pruebas realizadas
--usuario incorrecto, vacío OK
--codigo de entidad incorrecto o vacío, ERROR ok
--BIN vacío o incorrecto OK
--nroCta vacio o incorrecto, OK
--cod bloqueo inexistente, 96 ERROR AL PROCESAR LA SOLICITUD, OK


--redmine #6495 - Extracto en Linea

--validacion de usuario cod 05 OK
--


--TCREDITO
select * from gxbdbps.tmtaraf where MTNUMTA = '4569760000000343'--enemiso <> '021' AND MCNUMCT = '20110500027' --and MTNUMTA like '2307290000000011'

select * from gxbdbps.tmctaaf where mcemiso = '021'  AND MCTIPCB <> 'C'--and  mcnumct = '20140500001'

select * from gxbdbps.tmoviaf where MVNUMCT = '20112100003' order by MVHORA desc

--TDEBITO
select * from gxbdbps.tdemis where tdctanro = '102701661'

select * from gxbdbps.tdcta where tdctatar = '4569760000001408' --where TDBINNRO = '703020'-- tdctanro = '102025857'

--IMPACTA EN LAS TABLAS

select * from gxbdbps.mtdfic

select FICOSERV, FICCODIG,FICOSERV,FICOPORT,FICNOMAR,FICRUTAR,FICRUTOR,FICRUTDE,FICNOENT,FICNRENT,FICNRBIN,FICUSENT,FICHOPRO from gxbdbps.mtdfic where FICNRBIN = '703040'

select * from gxbdbps.tdemis order by TDFECHEMB 
select * from gxbdbps.tdemisnov order by TDFECHPROC
select * from gxbdbps.tdemnotar where NROTARJCTA = '4569760000002711'
select * from gxbdbps.tdctaad where TDADHTARIN = '4569760000002711'
select * from gxbdbps.tdcta where TDCTATAR = '4569760000002711'
select TDBINENTID,TDCLITIPDOC,TDCLINRODOC,TDPRIMNOM,TDSEGNOM,TDPRIMAPE,TDSEGAPE,TDNOMAPE,TDGENERO,PRCODIG,TDFECHING,TDHORAING,TDUSUING from gxbdbps.tdcliente where TDBINENTID = '1040' order by TDFECHING

SELECT * FROM visa.VIEWTRXCON

select * from gxopera.factura where facstatus = 'P'

select * from GXBDBPS.MTDFIC
