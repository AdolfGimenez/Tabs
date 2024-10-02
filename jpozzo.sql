SELECT LIDCOM, LFECTR, LHORTR, LIMPGS, LNRTAR, LERRNB     
FROM LIBDEBITO.DRCONBEP13 WHERE LNRTAR='4882340010029101'


select * from gxbdbps.tswaut WHERE AUTRRNBEP in (
'020900058180',
'020900058183',
'020900058185',
'020900058188',
'020900058191',
'020900058194',
'020900058197') AND AUTROLBEP = 'ISA'



SELECT * FROM VISA.VISTRNDTA WHERE VIRRNBEPSA in (
'020900058180',
'020900058183',
'020900058185',
'020900058188',
'020900058191',
'020900058194',
'020900058197')

SELECT * FROM VISA.VISCTLDTA WHERE V037 in (
'020900058180',
'020900058183',
'020900058185',
'020900058188',
'020900058191',
'020900058194',
'020900058197')

SELECT                                              
IPMARN,                                             
IPMORV,                                             
IPMFEC,                                             
IPMFNAME,                                           
IPMICA,                                             
IPMCONF,                                            
CAST(IFNULL( (SELECT u.IPMDEV                       
         FROM GXBDBPS.IPMDTAE u                     
         WHERE (u.IPMARN,u.IPMICA,u.IPMDELN)=       
               (c.IPMARN,c.IPMICA, 2)   LIMIT 1),' ')
     AS CHAR(16)) "LNRTAR",                         
CAST(IFNULL( (SELECT u.IPMDEV                       
         FROM GXBDBPS.IPMDTAE u                      
         WHERE (u.IPMARN,u.IPMICA,u.IPMDELN)=        
               (c.IPMARN,c.IPMICA, 2)   LIMIT 1),' ')
     AS CHAR(16)) "LNRTAR",                          
CAST(IFNULL( (SELECT u.IPMDEV                        
         FROM GXBDBPS.IPMDTAE u                      
         WHERE (u.IPMARN,u.IPMICA,u.IPMDELN)=        
               (c.IPMARN,c.IPMICA, 37) LIMIT 1),' ')
     AS CHAR(12)) "LRRN",                            
CAST(IFNULL( (SELECT u.IPMDEV                        
         FROM GXBDBPS.IPMDTAE u                      
         WHERE (u.IPMARN,u.IPMICA,u.IPMDELN)=        
               (c.IPMARN,c.IPMICA, 38) LIMIT 1),' ')
     AS CHAR(6))  "LCAUTR",                          
CAST(IFNULL( (SELECT u.IPMDEV                        
          FROM GXBDBPS.IPMDTAE u                     
          WHERE (u.IPMARN,u.IPMICA,u.IPMDELN)=       
                (c.IPMARN,c.IPMICA, 4) LIMIT 1),' ')
      AS CHAR(17)) "LIMPGS",                         
 CAST(IFNULL( (SELECT u.IPMDEV                       
          FROM GXBDBPS.IPMDTAE u                     
          WHERE (u.IPMARN,u.IPMICA,u.IPMDELN)=       
                (c.IPMARN,c.IPMICA, 49) LIMIT 1),' ')
      AS CHAR(3)) "LMONTR",                          
 CAST(IFNULL( (SELECT u.IPMDEV                       
         FROM GXBDBPS.IPMDTAE u                    
         WHERE (u.IPMARN,u.IPMICA,u.IPMDELN)=      
               (c.IPMARN,c.IPMICA, 12) LIMIT 1),' ')
     AS CHAR(6)) "LFECTR",                         
CAST(IFNULL( (SELECT u.IPMDEV                      
         FROM GXBDBPS.IPMDTAE u                    
         WHERE (u.IPMARN,u.IPMICA,u.IPMDELN)=      
               (c.IPMARN,c.IPMICA, 6)  LIMIT 1),'0')
     AS CHAR(17)) "LIMPUS",                        
CAST(IFNULL( (SELECT u.IPMDEV                      
          FROM GXBDBPS.IPMDTAE u                     
          WHERE (u.IPMARN,u.IPMICA,u.IPMDELN)=       
                (c.IPMARN,c.IPMICA, 51) LIMIT 1 ),'0')
      AS CHAR(3)) "LMONUS"                           
 FROM GXBDBPS.IPMDTA c                               
 WHERE IPMCONF IN (0, 1) AND                         
       IPMFNC = 200 AND                              
       IPMICA = 19832 AND                  
       IPMMSGSENT = 'I'                             
       FOR READ ONLY

----
CREATE OR REPLACE FUNCTION LIBDEBITO.FBINES ( 
	instr VARCHAR(19) ) 
	RETURNS VARCHAR(1000)   
	LANGUAGE SQL 
	SPECIFIC LIBDEBITO.FBINES 
    SET OPTION  ALWBLK = *ALLREAD , 
	ALWCPYDTA = *OPTIMIZE , 
	COMMIT = *NONE , 
	DBGVIEW = *SOURCE , 
	DECRESULT = (31, 31, 00) , 
	DFTRDBCOL = LIBDEBITO , 
	DYNDFTCOL = *NO , 
	DYNUSRPRF = *USER , 
	SQLCURRULE = *STD , 
	SRTSEQ = *HEX   
	RETURN 
WITH BINES (pos , res, tipoprod) AS 
(VALUES(19, CAST('' AS VARCHAR (19)), CAST ('' AS CHAR(1000)) )

  UNION ALL 
SELECT pos -1 , SUBSTR(instr, 1, pos), 
IFNULL ( ( 
SELECT CAST (l5.BINNROBIN                      CONCAT   
             l5.BINDSBIN                       CONCAT   
             l5.BINNMCORTO                     CONCAT   
             l5.BINIDMARCA                     CONCAT   
             l5.BINIDPRODU                     CONCAT   
             l5.BINIDTUTRJ                     CONCAT   
             l5.BINAMBUSO                      CONCAT   
             DIGITS(DEC(l5.BINLONGBIN, 2, 0))  CONCAT   
             DIGITS(DEC(l5.BINLONGTRJ, 2, 0))  CONCAT   
             DIGITS(DEC(l5.BINULTNROT, 18, 0)) CONCAT   
             l5.BINPROCBPS                     CONCAT   
             l5.BINCVV                         CONCAT   
             l5.BINCVV2                        CONCAT   
             l5.BINESTBIN                      CONCAT   
             l5.BINESBINSW AS CHAR (1000) ) tipoprod 
FROM GXTRJDTA.TDGBIN l5 
WHERE l5.BINNROBIN = TRIM(SUBSTR (instr, 1, pos)) 
LIMIT 1 ) , ' ' ) 
FROM BINES 
WHERE POS >= 0 
) 
SELECT tipoprod 
FROM BINES 
WHERE SUBSTR(tipoprod, 1, 2) <> '' 
LIMIT 1


----CALL
LABEL ON SPECIFIC FUNCTION LIBDEBITO.FBINES 
	IS 'Rucupera reg. GXTRJDTA.TDGBIN según bin ingresado' ;

SELECT * FROM LIBDEBITO.DRCONBEP WHERE LNRTAR IN ('5148480000000030', '2306710001000117')

SELECT * FROM YAPI.TMCTAAF WHERE MCNUMTA LIKE '514848%'

insert into gxbdbps.tmctaaf select * from yapi.tmctaaf

TMCTAAF
SELECT * FROM LIBDEBITO.DRCONBEP WHERE LFECTR BETWEEN '20200727' AND '20200730' 

SELECT COUNT (*) FROM LIBDEBITO.DRCONBEP

delete from libdebito.drconbep where lfectr > '20200626'


SELECT * FROM LIBDEBITO.DRCONBEP WHERE LNRTAR = '5148480000000030' and limpgs = '100' and lfectr = '20200728'


--datos de la cuenta de credito

select * from gxbdbps.tmtaraf where mtnumta like '514848%'

select * from yapi.tmctaaf where mcnumta like '514848%'

SELECT * FROM GXBDBPS.TAUTPAF WHERE MTNUMTA LIKE '5148480000000030'

SELECT * FROM GXBDBPS.MOVISA WHERE MOVUSUARIO = 'U99JAVIER'

SELECT * FROM GXBDBPS.TMOVIAF

--datos de la cuenta de debito
select * from gxbdbps.tdcta where tdctanro = '107733671' and tdctatar = '2306710001000117'

select * from gxbdbps.tdemnotar where nenrotarj = '2306710001000117'

select * from gxbdbps.tdctaad where tdctanro = '107733671' and tdbinnro = '230671'

select * from gxbdbps.tdemis where tdctanro = '107733671' and tdbinnro = '230671'

select * from gxbdbps.tdemisnov where tdctanro = '107733671' and tdbinnro = '230671'

CREATE TRIGGER GXBDBPS.STAXTMCTAF 
	AFTER INSERT OR DELETE OR UPDATE ON GXBDBPS.TMCTAAF 
	REFERENCING OLD AS O 
	NEW AS N 
	FOR EACH ROW 
	MODE DB2SQL 
	SECURED 
	SET OPTION  ALWBLK = *ALLREAD , 
	ALWCPYDTA = *OPTIMIZE , 
	COMMIT = *NONE , 
	DECRESULT = (31, 31, 00) , 
	DYNDFTCOL = *NO , 
	DYNUSRPRF = *USER , 
	SRTSEQ = *HEX   
	BEGIN 
INSERT INTO GXTRJDTA . TCOAUX ( AUXTBL , AUXCLAV , AUXFEHO , AUXACCI , AUXEST ) VALUES ( 
		'TMCTAAF' , 
CASE 
WHEN INSERTING OR UPDATING 
THEN N . MCNUMCT 
WHEN DELETING 
THEN O . MCNUMCT 
END , 
CURRENT_TIMESTAMP , 
CASE 
WHEN INSERTING 
THEN 'I' 
WHEN UPDATING 
THEN 'U' 
WHEN DELETING 
THEN 'D' 
END , 
	'N' 
) ; 
END  ;


[15:11] Jose Pozzo
    SELECT * FROM GXBDBPS.LGCOMENT lg
WHERE DATE(lg.LGFECHOR) = CURRENT DATE   ORDER BY RRN(lg) DESC

select * from libdebito.drconbep where lfectr = '20200811'

SELECT * FROM GXBDBPS.AIT001 WHERE AIID> 2020231000


SELECT * FROM GXBDBPS.AIT011

select count (*) from gxbdbps.ait003 where aiid = '2020236001'

select * from gxbdbps.ait001

select lidcom COD_ATM, lcomtr ATM, lfectr FECHA, limpgs IMPORTE, lerrnb RRN_BEPSA, lcotel TELEFONO, lcodtr COD_TRX from libdebito.drconbep where lfectr = '20200831' and lcotel = '0971123456';


               SELECT
               IPMMSGSENT,
               IPMARN,
               IPMORV,
               IPMFEC,
               IPMFNAME,
               IPMICA,
               IPMCONF,
               CAST(IFNULL( (SELECT u.IPMDEV
                        FROM GXBDBPS.IPMDTAE u
                        WHERE (u.IPMARN,u.IPMICA,u.IPMDELN)=
                              (c.IPMARN,c.IPMICA, 2)   LIMIT 1),' ')
                    AS CHAR(16)) "LNRTAR",
               CAST(IFNULL( (SELECT u.IPMDEV
                        FROM GXBDBPS.IPMDTAE u
                        WHERE (u.IPMARN,u.IPMICA,u.IPMDELN)=
                              (c.IPMARN,c.IPMICA, 37) LIMIT 1),' ')
                    AS CHAR(12)) "LRRN",
               CAST(IFNULL( (SELECT u.IPMDEV
                        FROM GXBDBPS.IPMDTAE u
                        WHERE (u.IPMARN,u.IPMICA,u.IPMDELN)=
                              (c.IPMARN,c.IPMICA, 38) LIMIT 1),' ')
                    AS CHAR(6))  "LCAUTR",
               CAST(IFNULL( (SELECT u.IPMDEV
                        FROM GXBDBPS.IPMDTAE u
                        WHERE (u.IPMARN,u.IPMICA,u.IPMDELN)=
                              (c.IPMARN,c.IPMICA, 4) LIMIT 1),' ')
                    AS CHAR(17)) "LIMPGS",
               CAST(IFNULL( (SELECT u.IPMDEV
                        FROM GXBDBPS.IPMDTAE u
                        WHERE (u.IPMARN,u.IPMICA,u.IPMDELN)=
                              (c.IPMARN,c.IPMICA, 49) LIMIT 1),' ')
                    AS CHAR(3)) "LMONTR",
               CAST(IFNULL( (SELECT u.IPMDEV
                        FROM GXBDBPS.IPMDTAE u
                        WHERE (u.IPMARN,u.IPMICA,u.IPMDELN)=
                              (c.IPMARN,c.IPMICA, 12) LIMIT 1),' ')
                    AS CHAR(6)) "LFECTR",
               CAST(IFNULL( (SELECT u.IPMDEV
                        FROM GXBDBPS.IPMDTAE u
                        WHERE (u.IPMARN,u.IPMICA,u.IPMDELN)=
                              (c.IPMARN,c.IPMICA, 6)  LIMIT 1),'0')
                    AS CHAR(17)) "LIMPUS",
               CAST(IFNULL( (SELECT u.IPMDEV
                        FROM GXBDBPS.IPMDTAE u
                        WHERE (u.IPMARN,u.IPMICA,u.IPMDELN)=
                              (c.IPMARN,c.IPMICA, 51) LIMIT 1 ),'0')
                    AS CHAR(3)) "LMONUS"
               FROM GXBDBPS.IPMDTA c
               WHERE IPMCONF IN (0, 0) AND
                     IPMFNC = 200
                     --IPMICA = :IPMMDTA.IPMICA AND
                     --IPMMSGSENT = 'I'
                     FOR READ ONLY ;
                     
select * from gxbdbps.tautpaf where APCANCU > 1;

SELECT * --INTO :IPMMDTA
FROM GXBDBPS.IPMMDTA           
WHERE IPMICAT = 'ISSUER';

UPDATE GXBDBPS.IPMDTA SET           
IPMCONF =0 WHERE IPMICA = 19832 with nc

SELECT * FROM IPMMDTA
WHERE IPMICAT = 'ISSUER'
LIMIT 1;

--MOVIMIENTOS DE LA TARJETA
SELECT RRN(r) ,r.*
FROM LIBDEBITO.DRCONBEP r
WHERE
r.LCAUTR = '002367'

--REGISTRO A PROCESAR
SELECT *
FROM LIBDEBITO.DRCONBEP
WHERE LNRTAR ='5148480000000030' AND
SUBSTR(LFECTR, 3, 6)= '200715' AND
LCAUTR = '002367'
LIMIT 1;

SELECT * --INTO :TAUTPAF
FROM GXBDBPS.TAUTPAF
WHERE MTNUMTA = '5148480000000030'
AND APCODAU = '002367'


UPDATE GXBDBPS.TAUTPAF SET APCANCU = '2',  APIMPOR = 2100,  APCODAU = '002367' WHERE MTNUMTA = '5148480000000030'

UPDATE GXBDBPS.TAUTPAF
   SET APIMPOR = 2100.00,
       APCANCU = 2AND 
WHERE MTNUMTA = '5148480000000030';


SELECT * FROM gxbdbps.TMTARAF WHERE substr(MTNUMTA,1,6) = '514848'; --llevar a tresting

SELECT * FROM GXBDBPS.TBINEAF WHERE BIBINES = '703040'; --llevar a testing

select * from gxbdbps.tbineaf where BITIPO = 'C'; 

select * from libdebito.fbines;

select * from gxbdbps.tafinaf where BIBINES = '514848' and ENEMISO = '020' and AFAFINI = '' --llevar a testing

 SELECT * FROM GXTRJDTA.TDGBIN 
 WHERE BINNROBIN LIKE '514848%';

with javier as (
SELECT
 IPMMSGSENT,
 IPMCONF,
 IPMARN,
 IPMORV,
 IPMFEC,
 IPMFNAME,
 IPMICA,
 IPMCONF,
 CAST(IFNULL( (SELECT u.IPMDEV
 FROM GXBDBPS.IPMDTAE u
 WHERE (u.IPMARN,u.IPMICA,u.IPMDELN)=
 (c.IPMARN,c.IPMICA, 2) LIMIT 1),' ')
 AS CHAR(16)) "LNRTAR",
 CAST(IFNULL( (SELECT u.IPMDEV
 FROM GXBDBPS.IPMDTAE u
 WHERE (u.IPMARN,u.IPMICA,u.IPMDELN)=
 (c.IPMARN,c.IPMICA, 37) LIMIT 1),' ')
 AS CHAR(12)) "LRRN",
 CAST(IFNULL( (SELECT u.IPMDEV
 FROM GXBDBPS.IPMDTAE u
 WHERE (u.IPMARN,u.IPMICA,u.IPMDELN)=
 (c.IPMARN,c.IPMICA, 38) LIMIT 1),' ')
 AS CHAR(6)) "LCAUTR",
 CAST(IFNULL( (SELECT u.IPMDEV
 FROM GXBDBPS.IPMDTAE u
 WHERE (u.IPMARN,u.IPMICA,u.IPMDELN)=
 (c.IPMARN,c.IPMICA, 4) LIMIT 1),' ')
 AS CHAR(17)) "LIMPGS",
 CAST(IFNULL( (SELECT u.IPMDEV
 FROM GXBDBPS.IPMDTAE u
 WHERE (u.IPMARN,u.IPMICA,u.IPMDELN)=
 (c.IPMARN,c.IPMICA, 49) LIMIT 1),' ')
 AS CHAR(3)) "LMONTR",
 CAST(IFNULL( (SELECT u.IPMDEV
 FROM GXBDBPS.IPMDTAE u
 WHERE (u.IPMARN,u.IPMICA,u.IPMDELN)=
 (c.IPMARN,c.IPMICA, 12) LIMIT 1),' ')
 AS CHAR(6)) "LFECTR",
 CAST(IFNULL( (SELECT u.IPMDEV
 FROM GXBDBPS.IPMDTAE u
 WHERE (u.IPMARN,u.IPMICA,u.IPMDELN)=
 (c.IPMARN,c.IPMICA, 6) LIMIT 1),'0')
 AS CHAR(17)) "LIMPUS",
 CAST(IFNULL( (SELECT u.IPMDEV
 FROM GXBDBPS.IPMDTAE u
 WHERE (u.IPMARN,u.IPMICA,u.IPMDELN)=
 (c.IPMARN,c.IPMICA, 51) LIMIT 1 ),'0')
 AS CHAR(3)) "LMONUS"
 FROM GXBDBPS.IPMDTA c
 WHERE
 IPMCONF IN (0, 0)
 AND
 IPMFNC = 200
 AND
 IPMICA = 19832 --:IPMMDTA.IPMICA
 AND
 IPMMSGSENT = 'I')
 --FOR READ ONLY;
 select * from javier where lcautr = '002367';
 
select * from gxbdbps.ipmdta where IPMARN = '12306110198197869515527'
 

select * from gxbdbps.TCUOTAF where mtnumta like '514848%';

select * from gxbdbps.TCUO1AF where mtnumta like '514848%';

delete from gxbdbps.TCUOTAF where mtnumta like '514848%';

select * from gxbdbps.TCUO1AF where mtnumta like '514848%';

call



INSERT INTO GXTRJDTA.TDGBIN
(
  BINNROBIN,
  BINDSBIN,
  BINNMCORTO,
  BINIDMARCA,
  BINIDPRODU,
  BINIDTUTRJ,
  BINAMBUSO,
  BINLONGBIN,
  BINLONGTRJ,
  BINULTNROT,
  BINPROCBPS,
  BINCVV,
  BINCVV2,
  BINESTBIN,
  BINESBINSW,
  BINUSUALTA,
  BINFECALTA,
  BINUSULTUP,
  BINFHULTUP,
  BINCODENT,
  BINCODAFI,
  BINMADRE,
  PAIIDPAIS,
  BINCODPRO
)
VALUES
(
  '514848      ',
  'MASTERCARD BLACK                                            ',
  '                              ',
  'MST',
  'BLK',
  'C ',
  'I',
  6,
  16,
  0,
  'S',
  'S',
  'N',
  'A',
  'A',
  'MIGRACION ',
  '20200402',
  '          ',
  '0001-01-01 00:00:00.000',
  1020,
  0,
  'S',
  600,
  9000
);

INSERT INTO GXTRJDTA.TDGBIN
(
  BINNROBIN,
  BINDSBIN,
  BINNMCORTO,
  BINIDMARCA,
  BINIDPRODU,
  BINIDTUTRJ,
  BINAMBUSO,
  BINLONGBIN,
  BINLONGTRJ,
  BINULTNROT,
  BINPROCBPS,
  BINCVV,
  BINCVV2,
  BINESTBIN,
  BINESBINSW,
  BINUSUALTA,
  BINFECALTA,
  BINUSULTUP,
  BINFHULTUP,
  BINCODENT,
  BINCODAFI,
  BINMADRE,
  PAIIDPAIS,
  BINCODPRO
)
VALUES
(
  '514848000   ',
  'MASTERCARD BLACK CONTINENTAL                                ',
  '020MSTCR16                    ',
  'MST',
  'BLK',
  'C ',
  'I',
  9,
  16,
  514848000000009,
  'S',
  'S',
  'S',
  'A',
  'A',
  'MIGRACION ',
  '20200402',
  '          ',
  '0001-01-01 00:00:00.000',
  1020,
  0,
  'N',
  600,
  9000
);

--------
--------
--------

INSERT INTO GXBDBPS.TMTARAF
(
  MTNUMTA,
  MTULTSC,
  BLCODIG,
  MTSTATS,
  ENEMISO,
  SUCODIG,
  CETIPOD,
  CENUMDO,
  BIBINES,
  AFAFINI,
  MCNUMCT,
  MTTIPOT,
  MTCLVIP,
  MTNOPLA,
  MTEMPRE,
  MTFECRE,
  MTFEEMI,
  MTFEBAJ,
  MTFEVEN,
  MTFEVE2,
  MTMBOLE,
  MTMRECU,
  MTFEREC,
  MTNOVED,
  MTCODS2,
  MTNUTAA,
  MTRETEN,
  MTRENOV,
  MTCOBRA,
  MTFEPED,
  MTUSPED,
  MTUSEMI,
  MTESTVE,
  MTESTEX,
  MTESTBL,
  MTESTMO,
  MTESTHA,
  MTFEBLQ
)
VALUES
(
  '5148480000000030',
  0,
  '00',
  '1',
  '020',
  '001',
  'C',
  '1009637        ',
  '514848',
  '001',
  2030000026,
  '1',
  ' ',
  'Titular Tarjeta     ',
  '                              ',
  '20190205',
  '00000000',
  '00000000',
  2504,
  0,
  ' ',
  ' ',
  '00000000',
  ' ',
  '001',
  '                ',
  'E',
  'S',
  'S',
  '20190205',
  'U99FLARA  ',
  '          ',
  ' ',
  ' ',
  ' ',
  ' ',
  ' ',
  '00000000'
);

select * from GXBDBPS.EPTBLMDTA

SELECT
CAST(SUBSTR(t.RECDATA, 244, 3) AS CHAR(3)) "Idtbla"
FROM MASTERCARD.T068SAL t
INNER JOIN GXBDBPS.EPTBLMDTA p1
ON( p1.EPTBLLOAD='S' AND
p1.EPTBLEID =(CAST(SUBSTR(
t.RECDATA,
20, 8) AS CHAR(8)))
)
WHERE IDTBL = '000' AND
SUBSTR(RECDATA, 20, 8) LIKE 'IP%T%'
ORDER BY 1;

	SELECT
	                CAST(SUBSTR(t.RECDATA, 244, 3) AS CHAR(3)) "Idtbla",
	                p1.EPTBLEID,
	                p1.EPTBLSYS,
	                p1.EPTBLWHERE,
	                p1.EPTBLORDER,
	                p1.EPTBLLOAD,
	                CAST(IFNULL(p1.EPTBLOVRDF, ' ') AS CHAR(10)),
	                p1.EPTBLTYFIL,
	                p2.IDTBL,
	                p2.RECDATA,
	                p3.EPTBLEID,
	                p3.EPTBLSYS,
	                p3.EPFLDSEC,
	                p3.EPFLDNME,
	                p3.EPFLDTYP,
	                p3.EPMSGPOSI,
	                p3.EPMSGLEN,
	                p3.EPMXLAT,
	                p3.EPMXLATD,
	                p3.EPMXLATH,
	                p3.EPMPAD,
	                p3.EPMPADC,
	                p3.EPFLDISK 
	                FROM  MASTERCARD.T068SAL t
	                INNER JOIN GXBDBPS.EPTBLMDTA p1
	                           ON( p1.EPTBLLOAD='S' AND
	                               p1.EPTBLEID =(CAST(SUBSTR(
	                                                  t.RECDATA,
	                                                  20, 8) AS CHAR(8)))
	                             )
	                INNER JOIN MASTERCARD.T068SAL p2
	                           ON(p2.IDTBL=
	                              (CAST(SUBSTR(t.RECDATA, 244, 3) AS CHAR(3)))
	                             )
	                INNER JOIN GXBDBPS.EPTBLMDTAD p3
	                           ON(p3.EPTBLSYS =p1.EPTBLSYS)
	                WHERE t.IDTBL = '000' AND
	                      SUBSTR(t.RECDATA, 20, 8) LIKE 'IP%T%' AND
	                      CAST(SUBSTR(t.RECDATA, 244, 3) AS CHAR(3))='037' /*and p1.EPTBLSYS <> 'MASISSDTA'*/
	                 ORDER BY CAST(SUBSTR(t.RECDATA, 244, 3) AS CHAR(3)),
	                         p2.RECDATA;

select * from mastercard.t067029101;

select * FROM MASTERCARD.T068SAL;

select count(*) FROM MASTERCARD.T068SAL;

select * from gxbdbps.MPE0053;

select count(*) from gxbdbps.MPE0040;

select * from GXBDBPS.EPTBLMDTAD;

select count(*) from gxbdbps.IPMIRDDTA;

select * from GXBDBPS.EPTBLMDTA;




SELECT C.EPTBLSYS AS TABLA, SUBSTRING(B.RECDATA, 20, 9) AS NOMBREINTERNO,
COUNT(*)  AS CANTIDADESPERADA FROM MASTERCARD.T068SAL AS A
INNER JOIN MASTERCARD.T068SAL AS B ON A.IDTBL = SUBSTRING(B.RECDATA, 244, 3)
INNER JOIN GXBDBPS.EPTBLMDTA AS C ON SUBSTRING(B.RECDATA, 20, 9) = C.EPTBLEID
WHERE A.IDTBL <> '000' AND B.IDTBL = '000'
GROUP BY A.IDTBL, SUBSTRING(B.RECDATA, 20, 9), C.EPTBLSYS;

select count(*) from gxbdbps.MPE0053;

select count(*) from gxbdbps.MASISSDTA;

select * from GXBDBPS.EPTBLMDTA;

SELECT count(*) FROM GXBDBPS.MASISSDTA A WHERE NOT EXISTS(SELECT 1 FROM
yapi.MASISSDTAZ Z WHERE (Z.ISSBINRLOW,
Z.ISSBINRHIG,Z.ISSGCMS,Z.ISSCPI )= (A.ISSBINRLOW, A.ISSBINRHIG,
A.ISSGCMS,A.ISSCPI));

SELECT

CAST(SUBSTR(t.RECDATA, 244, 3) AS CHAR(3)) "Idtbla",
 p1.EPTBLEID,
 p1.EPTBLSYS,
 p1.EPTBLWHERE,
 p1.EPTBLORDER,
 p1.EPTBLLOAD,
 CAST(IFNULL(p1.EPTBLOVRDF, ' ') AS CHAR(10)),
 p1.EPTBLTYFIL,
 p2.IDTBL,
 p2.RECDATA,
 p3.EPTBLEID,
 p3.EPTBLSYS,
 p3.EPFLDSEC,
 p3.EPFLDNME,
 p3.EPFLDTYP,
 p3.EPMSGPOSI,
 p3.EPMSGLEN,
 p3.EPMXLAT,
 p3.EPMXLATD,
 p3.EPMXLATH,
 p3.EPMPAD,
 p3.EPMPADC,
 p3.EPFLDISK
FROM MASTERCARD.T068SAL t
INNER JOIN GXBDBPS.EPTBLMDTA p1
ON( p1.EPTBLLOAD='S' AND
p1.EPTBLEID =(CAST(SUBSTR(
t.RECDATA,
20, 8) AS CHAR(8)))
)
INNER JOIN MASTERCARD.T068SAL p2
ON(p2.IDTBL=
(CAST(SUBSTR(t.RECDATA, 244, 3) AS CHAR(3)))
)
INNER JOIN GXBDBPS.EPTBLMDTAD p3
ON(p3.EPTBLSYS =p1.EPTBLSYS)
WHERE t.IDTBL = '000' AND
SUBSTR(t.RECDATA, 20, 8) LIKE 'IP%T%' AND
CAST(SUBSTR(t.RECDATA, 244, 3) AS CHAR(3))='054' --AND p1.EPTBLSYS <>'MASISSDTA'
--AND SUBSTRING(p2.RECDATA, 8, 1) IN('A', 'I') AND SUBSTR(p2.RECDATA, 31, 3) <> 'CIR';

select count(*) from GXBDBPS.MPE0096;




select * from gxbdbps.tracelog order by tracts desc;

SELECT * FROM CONTABILID.CCASI20;

select RRN(r), r.* from GXBDBPS.TPRMUTTX r;

INSERT INTO GXBDBPS.TPRMUTTX
(
  PRTXENEM,
  PRTXBINE,
  PRTXAFIN,
  PRTXPAIS,
  PRTXCANL,
  PRTXTXCT,
  PRTXTARC,
  PRTXADHE,
  PRTXDTRX,
  PRTXPER,
  PRTXCANT,
  PRTXMOTO,
  PRTXMOTX,
  PRTXFECD,
  PRTXFECH,
  PRTXCODR,
  PRTXUSRA,
  PRTXFECA,
  PRTXHORA,
  PRTXUSRM,
  PRTXFECM,
  PRTXHORM,
  PRTXCODRCT,
  PRTXCODRXT,
  PRTXCONT,
  PRTXOBS
)
VALUES
(
  '9999',
  '456976',
  '999',
  600,
  'TM',
  '011000',
  '9999999999999999999',
  99,
  '                              ',
  1,
  4,
  1000000.00,
  250000.00,
  '00000000',
  '00000000',
  61,
  'U99JOAQUIN  ',
  '20190911',
  '16:24:52',
  'U99JOAQUIN  ',
  '20200406',
  '09:50:57',
  65,
  61,
  9,
  'PRUEBA ON US CON POZZO'
);

--#10977 - Ajustes de PGM RPG Nativo

select 'old' , count(*) as "o" from gxbdbps.IPMDTA union all
select 'new' , count(*) as "d" from gxswtdta.IPMDTA;			ok

select 'old' , count(*) as "o" from gxbdbps.IPMDTAE union all
select 'new' , count(*) as "d" from gxswtdta.IPMDTAE;			ok

select 'old' , count(*) as "o" from gxbdbps.IPMIRD union all
select 'new' , count(*) as "d" from gxswtdta.IPMIRD;			ok

select 'old' , count(*) as "o" from gxbdbps.IPMPDSM union all
select 'new' , count(*) as "d" from gxswtdta.IPMPDSM;			ok

select 'old' , count(*) as "o" from gxbdbps.IPMDTATE union all
select 'new' , count(*) as "d" from gxswtdta.IPMDTATE;			ok

select 'old' , count(*) as "o" from gxbdbps.IPMDTATEP union all
select 'new' , count(*) as "d" from gxswtdta.IPMDTATEP;			ok

select 'old' , count(*) as "o" from gxbdbps.IPMDTAT union all
select 'new' , count(*) as "d" from gxswtdta.IPMDTAT;			ok

select 'old' , count(*) as "o" from gxbdbps.IPMMTIFNC union all
select 'new' , count(*) as "d" from gxswtdta.IPMMTIFNC;			ok

select 'old' , count(*) as "o" from gxbdbps.IPMDEM union all
select 'new' , count(*) as "d" from gxswtdta.IPMDEM;			ok

select 'old' , count(*) as "o" from gxbdbps.IPMMSG union all
select 'new' , count(*) as "d" from gxswtdta.IPMMSG;			ok

select 'old' , count(*) as "o" from gxbdbps.IPMFMDTA union all
select 'new' , count(*) as "d" from gxswtdta.IPMFMDTA;			FALTA

select 'old' , count(*) as "o" from gxbdbps.MCT464FRDR    union all
select 'new' , count(*) as "d" from gxswtdta.MCT464FRDR   ;	    FALTA

select 'old' , count(*) as "o" from gxbdbps.IPMMDEP union all
select 'new' , count(*) as "d" from gxswtdta.IPMMDEP;	    FALTA

select 'old' , count(*) as "o" from gxbdbps.IPMMTIFNC union all
select 'new' , count(*) as "d" from gxswtdta.IPMMTIFNC;	    ok

select 'old' , count(*) as "o" from gxbdbps.IPMPDSM union all
select 'new' , count(*) as "d" from gxswtdta.IPMPDSM;	    	ok

select 'old' , count(*) as "o" from gxbdbps.IPMDTAT union all
select 'new' , count(*) as "d" from gxswtdta.IPMDTAT;	    	ok

select 'old' , count(*) as "o" from gxbdbps.IPMDTATEP union all
select 'new' , count(*) as "d" from gxswtdta.IPMDTATEP;	    	FALTA

select 'old' , count(*) as "o" from gxbdbps.IPMDTATE union all
select 'new' , count(*) as "d" from gxswtdta.IPMDTATE;	    	FALTA

select 'old' , count(*) as "o" from gxbdbps.IPMTQR4 union all
select 'new' , count(*) as "d" from gxswtdta.IPMTQR4;	    	ok

select 'old' , count(*) as "o" from gxbdbps.IPMTQR4E union all
select 'new' , count(*) as "d" from gxswtdta.IPMTQR4E;	    	FALTA

select 'old' , count(*) as "o" from gxbdbps.IPMFCTL union all
select 'new' , count(*) as "d" from gxswtdta.IPMFCTL;         FALTA

select 'old' , count(*) as "o" from gxbdbps.IPMFMDTA union all
select 'new' , count(*) as "d" from gxswtdta.IPMFMDTA;         FALTA

select 'old' , count(*) as "o" from gxbdbps.IPMFMDTA union all
select 'new' , count(*) as "d" from gxswtdta.IPMFMDTA;         FALTA

select 'old' , count(*) as "o" from gxbdbps.IPMIRDDTA union all
select 'new' , count(*) as "d" from gxswtdta.IPMIRDDTA;

select * from GXBDBPS.IPMDTATep WHERE IPMFNAME = 'T113033396';
DELETE from GXBDBPS.IPMDTAT WHERE IPMFNAME = 'T113033396';
select * from GXBDBPS.IPMDTATE;
select * from GXBDBPS.IPMDTATEP WHERE IPMFNAME= 'T113033396';

DELETE from GXBDBPS.IPMDTAT WHERE IPMFNAME= 'T113033396';

VALUES DAYOFYEAR (CURRENT_DATE)

VALUES
CAST(VARCHAR_FORMAT(CURRENT TIMESTAMP,
'YYYYDDD')
AS CHAR(7))

VALUES TO_DATE('2021121','YYYYDDD');
AS CHAR(7))

VALUES TO_DATE ('2020333', 'YYYYDDD');

select * from gxbdbps.ipmfctl where IPMFCNAME= 'T113033396';

INSERT INTO GXBDBPS.IPMFCTL
(
  IPMFCNAME,
  IPMFCINS,
  IPMFCSTS,
  IPMFCULTP,
  IPMFDWNL,
  IPMFUPDWN,
  IPMFCMEMB,
  BULKID,
  IPMFBRECQ,
  IPMFFECPRO,
  IPMESTEJE,
  IPMUSUUPD
)
VALUES
(
  'T113033396',
  '20201128',
  'PRC',
  '2020-12-11 13:01:10.405',
  'S',
  'DWL',
  'ICA19696  ',
  'T1130782433396                  ',
  21,
  '20201128',
  'S',
  'MASTRUSR  '
);

SELECT LNRTAR,
LIDTRA, LMCCTR,
DIGITS(LFECTR) "LFECTR", DIGITS(DEC(LHORTR, 6, 0)) "LHORTR" , "LERRNB", LENEMI,
DIGITS(LFECTR) CONCAT DIGITS(DEC(LHORTR, 6, 0)) CONCAT LERRNB "ACFIRRN",
CASE WHEN SUBSTR(LIDTRA, 1, 1) = 'P' THEN 'POS'
     WHEN SUBSTR(LIDTRA, 1, 1) = 'T' THEN 'ATM'
     ELSE 'OTR' END
-- *    
--FROM LIBPROD.DRCONBE60

select * from mastercard.mastrndta             
where                                
MCRRNBEPSA in ( '100430829030' , 
              '100430831576' )   
              
 SELECT c.lfcotr, A.*, B.* FROM MASTERCARD.MASCTLDTA AS A  
        INNER JOIN MASTERCARD.MASTRNDTA AS B         
        ON A.MCRRNBEPSA = B.MCRRNBEPSA AND           
        A.MTI = B.MCMTI AND                          
        A.MCROL = B.MCROL                            
        INNER JOIN LIBDEBITO.DRCONBEP AS C           
        ON A.MCRRNBEPSA = C.LERRNB AND               
        A.MC038 = C.LCAUTR AND                       
        B.MCIMPORTE = C.LIMPGS AND                   
        B.MCFECCOM = CHAR(C.LFCOTR)                  
 WHERE MC039 = '00' AND                              
        A.MTI = 0110 AND                             
        A.MCROL = 'ADQ' AND
        B.MCROL = 'ADQ' AND  
B.MASIPMPRC <>'S' AND
B.MCIMPORTE > 0 
AND C.LFCOTR <= 20210105


SELECT * FROM GXBDBPS.IPMDTAE   WHERE IPMDELN = 40
-----

FROM LIBDEBITO.DRCONBEP
WHERE LERRNB IN(
'034821954006',
'034821954051',
'034821954032',
'034821953975',
'034821953995',
'034821954066',
'034821954161',
'034821954226',
'034821954091',
'034821954105',
'034821954117',
'034821954128',
'034821954042',
'034821954145',
'034821954424'
)
WITH NC;

SELECT * FROM LIBDEBITO.DRCONBEP WHERE LERRNB IN (
'034821954006',
'034821954051',
'034821954032',
'034821953975',
'034821953995',
'034821954066',
'034821954161',
'034821954226',
'034821954091',
'034821954105',
'034821954117',
'034821954128',
'034821954042',
'034821954145',
'034821954424'
);
select * from gxbdbps.tswaut where AUTRRNBEP IN (
'034821954006',
'034821954051',
'034821954032',
'034821953975',
'034821953995',
'034821954066',
'034821954161',
'034821954226',
'034821954091',
'034821954105',
'034821954117',
'034821954128',
'034821954042',
'034821954145',
'034821954424'
);
SELECT A.*, B.*                    
FROM VISTRNDTA AS A                
INNER JOIN VISCTLDTA AS B          
ON A.VIRRNBEPSA = B.VIRRNBEPSA AND 
   A.VIFLD037 = B.VIFLD037 AND     
   A.VIMTI = B.MTI                 
WHERE A.VIRRNBEPSA = ;      

select fi87530, fi87513, FI87546, fi87633, fi87545, FI87516, FI87531, FI87518, FI87567, FI87595, FI87580, FI87535 from VISA.ACFIRECD
where fi87595 in (
'034821954042',
'034821954091',
'034821954117',
'034821954128',
'034821954161',
'034821954226',
'034821954424'
);

select fi87530, fi87513, FI87546, fi87633, fi87545, FI87516, FI87531, FI87518, FI87567, FI87595, FI87580, FI87535 from VISA.ACFIRECD;

select 
AUTREDENT,
AUTREDSAL,
AUTROLBEP,
AUTMARTAR,
AUTBINADQ,
AUTBINEMI
from gxbdbps.tswaut where autrrnbep = '034821954226' ; 473204      

SELECT * FROM GXBDBPS.VIADQENTI LNFISC;

SELECT LNFISC FROM LIBDEBITO.DRCONBEP WHERE LERRNB = '034821954226';


                 SELECT
                  w.AUTREDENT,
                  w.AUTREDSAL,
                  w.AUTROLBEP,
                  w.AUTMARTAR,
                  w.AUTBINADQ,
                  HEX(w.AUTBINADQ),
                  w.AUTBINEMI,
--                   w.*
                  w.AUTDISTIP
                  FROM GXBDBPS.TSWAUT w
                  WHERE w.AUTRRNBEP='034821954042' OR
                        w.AUTRRNBEP='034900081636';
                        
select * from libclea.tswaut where AUTRRNBEP in (
'035022493795',
'111436151220',
'035022493411',
'035022757729',
'035022656061',
'035022759159',
'035022501025',
'035022679146',
'104007151220',
'104628151220',
'035022501010'
);

select * from libprod.drconbe60 where LERRNB in (
'035022493795',
'111436151220',
'035022493411',
'035022757729',
'035022656061',
'035022759159',
'035022501025',
'035022679146',
'104007151220',
'104628151220',
'035022501010'
);

SELECT 
A.*, B.*, C.* 
FROM MASTERCARD.MASCTLDTA AS A  
        INNER JOIN MASTERCARD.MASTRNDTA AS B         
        ON A.MCRRNBEPSA = B.MCRRNBEPSA AND           
        A.MTI = B.MCMTI AND                          
        A.MCROL = B.MCROL                            
        INNER JOIN LIBDEBITO.DRCONBEP AS C           
        ON A.MCRRNBEPSA = C.LERRNB AND               
        A.MC038 = C.LCAUTR AND                       
        B.MCIMPORTE = C.LIMPGS AND                   
        B.MCFECCOM = CHAR(C.LFCOTR)                  
 WHERE MC039 = '00' AND                              
        A.MTI = 0110 AND                             
        A.MCROL = 'ADQ' AND
        B.MCROL = 'ADQ' AND  
B.MASIPMPRC <>'S' AND
B.MCIMPORTE > 0;

select * from mastercard.masctldta where mti = '110' and timestamp MCREVDATT >= '2021-01-05'

select * from mastercard.masctldta where date(MCREVDATT) between '2020-11-30' and '2021-01-06';

select * from mastercard.mastrndta where mcfeccom between '20201131' and '20201231';

SELECT * FROM GXBDBPS.IPMDTAe   WHERE IPMDELN = 40;
---------------------------
--limite por dueño de ATM--
---------------------------

select * from GXBDBPS.TPRMUTTX where ptrxcanl = 'MO' and  /*prtxbine = '456976' AND PRTXCANL = 'TM' and*/ rrn(t) = '59';

--configuracion de la transaccion
select * from GXBDBPS.TPRMUTTX t where prtxbine = '456976' AND PRTXCANL = 'TM' and prtxtxct = '012000'

--log de los movimientos realizados
select * from gxbdbps.logrules where logenti = '1020' and logfecha = '2021-01-06' and logimpor < '1000000' order by loghora desc;

select logrrn RRN_TRX, logfecha FECHA, loghora HORA, logbin BIN, logimpor IMPORTE, logrespu RESPUESTA, logmsg MENSAJE 
from gxbdbps.logrules 
where logenti = '1020' 
and logfecha = '2021-01-06' 
and logimpor < '1000000' 
order by loghora desc;

--consulta de la transaccion en el drconbep
select * from libdebito.drconbep where lfectr = '20210106' 
and LERRNB in(
'100600084190',
'100600084187',
'100600084184',
'100600084181',
'100600084178',
'100600084174',
'100600084171',
'100600084168',
'100600084165')

--  order by lhortr desc;

SELECT * FROM GXBDBPS.TSWAUT WHERE AUTTRXFCHC = '20210106';

select * from libdebito.TBCTRA0P WHERE TXCTRX = '012000';

--para restaurar registros de movimientos, cantidad e importe calculado en los limites transaccionales
select * from gxbdbps.tdmov where tdbinentid = '1020' and tdbinnro = '456976' and movfectr = '20210106' and movlcomtr = 'ATM BANCO CONTINENTAL';

select movlerrnb RRN_TRX, movfectr FECHA, tdbinnro BIN, movcomer COD_ATM, movimporte IMPORTE, movlcretr COD_RETORNO, movlesttr ESTADO_TRX from gxbdbps.tdmov 
where tdbinentid = '1020' 
and tdbinnro = '456976' 
and movfectr = '20210106' 
and movlcomtr = 'ATM BANCO CONTINENTAL';

SELECT COUNT(*) as movcount,COALESCE(SUM(m.MOVIMPORTE), 0) as movsum 
FROM GXBDBPS.TDMOV m WHERE m.TDCANALID='TM' AND m.MOVLCODTR='012000' 
AND m.TDBINNRO='456976' AND m.TDBINENTID='1020' AND m.TDCTANRO=6601774266 
AND  m.TDADHCTA = 0 AND  m.MOVLCRETR = '00' AND m.MOVFECTR >=20210106 
AND m.MOVFECTR <=20210106 AND m.MOVLESTTR = 'A' LIMIT 1   

INSERT INTO GXBDBPS.TPRMUTTX
(
  PRTXENEM,
  PRTXBINE,
  PRTXAFIN,
  PRTXPAIS,
  PRTXCANL,
  PRTXTXCT,
  PRTXTARC,
  PRTXADHE,
  PRTXDTRX,
  PRTXPER,
  PRTXCANT,
  PRTXMOTO,
  PRTXMOTX,
  PRTXFECD,
  PRTXFECH,
  PRTXCODR,
  PRTXUSRA,
  PRTXFECA,
  PRTXHORA,
  PRTXUSRM,
  PRTXFECM,
  PRTXHORM,
  PRTXCODRCT,
  PRTXCODRXT,
  PRTXCONT,
  PRTXOBS
)
VALUES
(
  '1020',
  '230671',
  '999',
  999,
  'TM',
  '999999',
  '9999999999999999999',
  99,
  '                              ',
  3,
  999,
  8000000.00,
  2000000.00,
  '00000000',
  '00000000',
  61,
  'U99JOAQUIN  ',
  '20190911',
  '16:24:52',
  'U99JOAQUIN  ',
  '20200406',
  '09:50:57',
  65,
  61,
  62,
  'Límite de Red para Extracciones en ATM ON-US'
);

--trx on-us mastercard

select * from libdebito.drconbep where lfectr = '20210113' and lcomtr = 'ATM BANCO CONTINENTAL' and LERRNB = '101300084951'order by lhortr desc;

--consulta de transacciones en el DRCONBEP
select LERRNB RRN, lnrtar TARJETA, lbinpr BIN, lbcocr BANCO_CREDITO, lbcodb BANCO_DEBITO, lexpir FECHA_EXP, lidcom COD_COM, lcomtr COMERCIO, lfectr FECHA_TRX, lhortr HORA_TRX, limpgs IMPORTE,
case
	when lcodtr = '012000' then 'RETIRO EFECTIVO ATM'
	when lcodtr = '902020' then 'PAGO DE FACTURA'
	when lcodtr = '302000' then 'CONSULTA DE SALDO ATM'
	when lcodtr = '901020' then 'COMPRA DE MINUTOS'
	when lcodtr = '402000' then 'TRANSFERENCIA A CUENTA'
	when lcodtr = '300002' then 'AUTENTICACION DE USUARIO'
	when lcodtr = '500000' then 'DINELCO MOVIL'
end
TIPO_TRX,
lcotel NUMERO,
case
	when lcretr = '00' then 'TRANSACCION APROBADA'
	when lcretr = '12' then 'TRANSACCION INVALIDA'	
	when lcretr = '55' then 'PIN INCORRECTO'
end
CODIGO_RETORNO, lcautr COD_AUT	
	
from libdebito.drconbep where lfectr = '20210115' and lcomtr = 'ATM BANCO CONTINENTAL' and lbinpr = '230671' order by lhortr desc;

--consulta de las transacciones en el TSWAUT
select * from gxbdbps.tswaut where AUTRRNBEP in (select LERRNB from libdebito.drconbep where lfectr = '20210112' and lcomtr = 'ATM BANCO CONTINENTAL' and lbinpr = '230671')

select * from gxbdbps.tswaut where AUTRRNBEP = '101300084951'

select AUTRRNBEP RRN, autpannro PAN_TARJETA, autbinemi BIN, autcodaut COD_AUT, autcodser SERVICIO, autcomraz COMERCIO, autdistip TIPO_DISP, autestrev REVERSADO_S_N,
autrolbep ROL, auttrxcod COD_TRX, 
case
 when auttrxestf = 'A' then 'APROBADO'
 when auttrxestf = 'R' then 'REVERSADO' 
end
ESTADO_TRX, 
auttrxfchc FECHA_TRX
from gxbdbps.tswaut where AUTRRNBEP in (select LERRNB from libdebito.drconbep where lfectr = '20210115' and lcomtr = 'ATM BANCO CONTINENTAL' and lbinpr = '230671')

select autbinadq BIN_ADQ, autbinemi BIN_EMIS, autcodaut COD_AUT, autcodser COD_SERVICIO,  from gxbdbps.tswaut 
where AUTRRNBEP in (select LERRNB from libdebito.drconbep where lfectr = '20210112' and lcomtr = 'ATM BANCO CONTINENTAL' and lbinpr = '230671')

--consulta de transacciones en MASCTLDTA
select * from mastercard.masctldta where mc043 like 'ATM BANCO CONTINENTAL      %' 
and MC037 = '101300084951'--in 
(select LERRNB from libdebito.drconbep where lfectr = '20210113' and lcomtr = 'ATM BANCO CONTINENTAL' and lbinpr = '230671')

--consulta de transacciones en MASTRNDTA
select * from mastercard.mastrndta where mcrol = 'ISA' 
and MCRRNBEPSA in (select LERRNB from libdebito.drconbep where lfectr = '20210115' and lcomtr = 'ATM BANCO CONTINENTAL' and lbinpr = '230671')

select mcrol ROL, mcrrnbepsa RRN, mcpannmbr TARJETA, mcfecreal FECHA, mcimporte IMPORTE  from mastercard.mastrndta where mcrol = 'ISA' 
and MCRRNBEPSA in (select LERRNB from libdebito.drconbep where lfectr = '20210114' and lcomtr = 'ATM BANCO CONTINENTAL' and lbinpr = '230671')

select * from mastercard.masctldta where mc043 like 'ATM BANCO CONTINENTAL      %' 
and MC037 in (select LERRNB from libdebito.drconbep where lfectr = '20210113' and lcomtr = 'ATM BANCO CONTINENTAL' and lbinpr = '230671')
select txctrx, txdtrx from libdebito.TBCTRA0P 
WHERE TXCTRX in (select lcodtr from libdebito.drconbep where lfectr = '20210113' and lcomtr = 'ATM BANCO CONTINENTAL' order by lhortr desc);

//
SELECT *
FROM libdebito.tbcret0p
WHERE CODNRO IN (select lcretr from libdebito.drconbep where lfectr = '20210113' and lcomtr = 'ATM BANCO CONTINENTAL' order by lhortr desc);

select lidcom COD_COM, lcomtr COMERCIO, lfectr FECHA_TRX, lhortr HORA_TRX, limpgs IMPORTE,
substr(lidtra,1,1) POS_ATM, lcretr COD_RETORNO, lesttr EST_TRX, lerrnb NRO_REF, lcodtr COD_TRX,
lcored RED, lcotel NRO_TELEFONO,
case
    when substr(lidtra,1,1) = 'P' then 'POS'
    when substr(lidtra,1,1) = 'T' then 'ATM'
    else 'Other'
end
CANAL
 from libprod.drconbe60 where LERRNB in (
'032916825852',
'032916879006'


-- and LERRNB in (
-- '101200084777',
-- '101200084760');
adelanto OK
consulta OK
pago de servicios ANDE error de criptograma con ambas tarjetas
pago de servicios tigo compra minutos OK
pago de servicios tigo pago de facturas OK
transferencia a cuenta OK
dinelco movil OK
cambio de pin NO RESPONDE, TIEMPO EXCEDIDO



select * from libdebito.drconbep where lfectr = '20210112' and lcomtr = 'CIBERSONS' order by lhortr desc; --and lcomtr = 'ATM BANCO CONTINENTAL' and LERRNB in (
'101200084777',
'101200084760');

select * from gxbdbps.tswaut where autrrnbep = '101200084715';


SELECT * FROM GXSEGDTA.TSGSIS t WHERE SGSISCOD IN (1, 2, 21, 33);

select * from libdebito.drconbep where lbinpr = '456976' and lcodtr = '304000';

[Ayer 4:58 p.m.] Jose Pozzo.
    SELECT LERRNB, lbcocr, lbcodb, lcodtr, LCAUTR FROM libdebito.drconbep WHERE lfectr
= '20210112' and lcomtr LIKE                                      
  'ATM BANCO CONTINENTAL%' ORDER BY LHORTR  ;      
  
select * from libdebito.TBCTRA0P WHERE TXCTRX = '302000'; --PEDIR A PRODUCCION                

select * from GXOPERA.tfamrel;

select * from gxopera.opentcle;

select * from gxopera.oprecle;

select * from gxbdbps.ait001 where aiid = '2021029001';

select count(*) from gxbdbps.ait003 where AIID  = '2021029001';

select * from libclea.tswaut where AUTRRNBEP = '18182550589';

select * from gxbdbps.ait001

select * from libdebito.drconbep where lfectr = '20210201'

select * from gxbdbps.ait001;
select * from gxbdbps.ait002;
select * from gxbdbps.ait003;
