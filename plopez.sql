select count(*) from yapi.mpe0016;
select count(*) from gxbdbps.mpe0016
--
select count(*)from yapi.mpe0017;
select count(*) from gxbdbps.mpe0017
--
select count(*) from yapi.mpe0018;
select count(*) from gxbdbps.mpe0018
--
select count(*) from yapi.mpe0019;
select count(*) from gxbdbps.mpe0019
--count(*)
select count(*) from yapi.mpe0028
--count(*)
select count(*) from yapi.mpe0036
--count(*)
select count(*) from yapi.mpe0040
--count(*)
select count(*) from yapi.mpe0041
--count(*)
select count(*) from yapi.mpe0052
--count(*)
select count(*) from yapi.mpe0053
--count(*)
select count(*) from yapi.mpe0056
--count(*)
select count(*) from yapi.mpe0057
--count(*)
select count(*) from yapi.mpe0059
--count(*)
select count(*) from yapi.mpe0075
--count(*)
select count(*) from yapi.mpe0076
--count(*)
select count(*) from yapi.mpe0087
--count(*)
select count(*) from yapi.mpe0088
--count(*)
select count(*) from yapi.mpe0089
--count(*)
select count(*) from yapi.mpe0090
--count(*)
select count(*) from yapi.mpe0091
--count(*)
select count(*) from yapi.mpe0093
--count(*)
select count(*) from yapi.mpe0094
--count(*)
select count(*) from yapi.mpe0095
--count(*)
select count(*) from yapi.mpe0096
--count(*)
select count(*) from yapi.mpe0098


select * from libdebito.drconbep where lnrtar in ('5429270000000126','5429270000000191') and lfectr >= '20200526' and lcretr = '00';

select  a.mtnumta, a.apcodco, a.apcodau, a.apimpor, a.apfecom, a.apferea, a.cmcodig, a.apcancu, a.apnumct, a.APSTATS,
 b.*  from gxbdbps.tautpaf as a inner join gxbdbps.tmctaaf as b on  a.APNUMCT = b.mcnumct
where a.mtnumta in ('5429270000000126' , '5429270000000191') and a.apferea = 20200526 AND APCANCU = 1

                          
IPMARN,                                     
IPMORV,                                     
IPMFEC,                                     
IPMFNAME,                                   
IPMICA,                                     
IPMCONF,                                    
CAST(IFNULL( (SELECT u.IPMDEV               
         FROM GXBDBPS.IPMDTAE u             
         WHERE (u.IPMARN,u.IPMICA,u.IPMDELN)=
               (c.IPMARN,c.IPMICA, 2) LIMIT 1) ,' ')
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
                (c.IPMARN,c.IPMICA, 51) LIMIT 1),'0')    
      AS CHAR(3)) "LMONUS"                       
 FROM GXBDBPS.IPMDTA c                           
 WHERE IPMCONF IN (0, 1)
 
--AND                     
--     c.IPMFNC = 200 AND ipmfec <= 20200526
 --   AND          
--    IPMMSGSENT = 'I'                      
--    FOR READ ONLY ;

select * from libdebito.drconbep where

SELECT mcnumct, mcdisco, MCAUTPE, MCLIMCO, MCLIMCU MCNUMCT, MCSAFAC, MCSALFI,
MCAPCOC, MCDISCU, MCCUOPE, mcadepe FROM gxbdbps.tmctaaf WHERE MCNUMCT = 21060000102 OR MCNUMCT= 21060000177

--busqueda de movimientos en TMOVIAF
select MTNUMTA,CMCODIG,MVEMISO,MVNUMCT,MVCLASE,MVAFINI,MVTIPOT,MVFEREA,MVHORA,MVIMPO2,MVDISPO,MVNOVED,MVCODCO,MVNOMCO from gxbdbps.tmoviaf where mtnumta = '5429270000000126';
select  MTNUMTA,CMCODIG,MVEMISO,MVNUMCT,MVCLASE,MVAFINI,MVTIPOT,MVFEREA,MVHORA,MVIMPO2,MVDISPO,MVNOVED,MVCODCO,MVNOMCO from gxbdbps.tmoviaf where mtnumta = '5429270000000191'

--movimientos en MOVISA
select * from gxbdbps.movisa where movnrotar = '5429270000000126';
select * from gxbdbps.movisa where movnrotar = '5429270000000191'

--movimientos en tcuotaf
select * from gxbdbps.tcuotaf where mtnumta = '5429270000000126';
select * from gxbdbps.tcuotaf where mtnumta = '5429270000000191'

--movimientos en tcuo1af
select * from gxbdbps.tcuo1af where mtnumta = '5429270000000126';
select * from gxbdbps.tcuo1af where mtnumta = '5429270000000191'


SELECT * FROM GXBDBPS.TAFINAF WHERE BIBINES = '542927'

--movimientos en el tautpaf
select * from gxbdbps.tautpaf where mtnumta = '5429270000000126' and apferea = '20200526';
select * from gxbdbps.tautpaf where mtnumta = '5429270000000191' and apferea = '20200526'

select * from gxbdbps.MCT464FHDR

select * from visa.VIEWTRXCON

select * from visa.VIStrnDTA

select * from visa.VISCTLDTA

Select * from gxbdbps.mct464fhdr

--redmine #7162 - Actualizacion de Tabla MCT464EREC, del proceso con la nueva estructura y manejo de datos multimoneda.

DROP TABLE GXBDBPS.MCT464EREC;


CREATE TABLE GXBDBPS.MCT464EREC (
 T464FHRId  Numeric(11)     NOT NULL,
  T464SHId   Numeric(2)     NOT NULL,
  T464ERECId Numeric(11)     NOT NULL,
  T464EREMTI CHAR(4)     NOT NULL,
  T464ERSwSr Numeric(9),
  T464ERPrTp CHAR(1),
  T464ERPrId Numeric(4),
  T464ERTrFc Numeric(6),
  T464ERTrHo Numeric(6),
  T464ERPnLn Numeric(2),
  T464ERPAN  CHAR(19),
  T464ERPrCo Numeric(6),
  T464ERTrNu Numeric(6),
  T464ERMCC  Numeric(4),
  T464ERPOSE Numeric(3),
  T464ERRfNu CHAR(12),
  T464ERAcId Numeric(10),
  T464ERTnId CHAR(10),
  T464ERRsCo Numeric(2),
  T464ERBran CHAR(3),
  T464ERAdRs CHAR(7),
  T464ERInCu CHAR(4),
  T464ERAuCo Numeric(6),
  T464ERCoTr Numeric(3),
  T464ERCoDc Numeric(1),
  T464ERCmAm Numeric(12),
  T464ERCmDC CHAR(1),
  T464ERChBk Numeric(12),
  T464ERChDC CHAR(1),
  T464ERFeLo Numeric(8),
  T464ERFeDC CHAR(1),
  T464ERCoLq Numeric(3),
  T464ERCuDc Numeric(1),
  T464ERTsCv Numeric(8),
  T464ERToAm Numeric(12),
  T464ERToDC CHAR(1),
  T464ERInFe Numeric(10),
  T464ERIFDC CHAR(1),
  T464ERFil1 CHAR(7),
  T464ERRcAm Numeric(12),
  T464ERRcDC CHAR(1),
  T464ERRcSt Numeric(12),
  T464ERRADC CHAR(1),
  T464EROrDt Numeric(6),
  T464ERInPs Numeric(1),
  T464ERFil2 CHAR(1),
  T464ERCoBr CHAR(1),
  T464ErCoIn CHAR(1),
  T464ERISA  CHAR(1),
  T464ERTcNu Numeric(6),
  T464ERFil3 CHAR(1),
      PRIMARY KEY ( T464FHRId,T464SHId,T464ERECId ));

LABEL ON TABLE GXBDBPS.MCT464EREC IS 'Financial/Non-financial Exception Record';
LABEL ON COLUMN GXBDBPS.MCT464EREC (T464ERSWSR TEXT IS 'Original Switch Serial');
LABEL ON COLUMN GXBDBPS.MCT464EREC (T464EREMTI TEXT IS 'Message Type Indicator'); 
LABEL ON COLUMN GXBDBPS.MCT464EREC ( T464ERPrId TEXT IS 'Processor Id');
LABEL ON COLUMN GXBDBPS.MCT464EREC (T464ERTrFc TEXT IS 'Transaction Date');
LABEL ON COLUMN GXBDBPS.MCT464EREC (T464ERTrHo TEXT IS 'Transaction Time');
LABEL ON COLUMN GXBDBPS.MCT464EREC (T464ERPnLn TEXT IS 'Primary Account Length');
LABEL ON COLUMN GXBDBPS.MCT464EREC (T464ERPAN TEXT IS 'Primary Account Number');
LABEL ON COLUMN GXBDBPS.MCT464EREC (T464ERPrCo TEXT IS 'Processing Code');
LABEL ON COLUMN GXBDBPS.MCT464EREC (T464ERTrNu TEXT IS 'Original Trace Number');
LABEL ON COLUMN GXBDBPS.MCT464EREC (T464ERMCC TEXT IS 'Merchant Type');
LABEL ON COLUMN GXBDBPS.MCT464EREC (T464ERPOSE TEXT IS 'POS Entry');
LABEL ON COLUMN GXBDBPS.MCT464EREC (T464ERRfNu TEXT IS 'Reference Number');
LABEL ON COLUMN GXBDBPS.MCT464EREC (T464ERAcId TEXT IS 'Acquirer Institution ID');
LABEL ON COLUMN GXBDBPS.MCT464EREC (T464ERTnId TEXT IS 'Terminal ID');
LABEL ON COLUMN GXBDBPS.MCT464EREC (T464ERRsCo TEXT IS 'Response Code');
LABEL ON COLUMN GXBDBPS.MCT464EREC (T464ERBran TEXT IS 'Brand');
LABEL ON COLUMN GXBDBPS.MCT464EREC (T464ERAdRs TEXT IS 'Advice Reason Code');
LABEL ON COLUMN GXBDBPS.MCT464EREC (T464ERInCu TEXT IS 'Intracurrency Code');
LABEL ON COLUMN GXBDBPS.MCT464EREC (T464ERAuCo TEXT IS 'Authorization ID');
LABEL ON COLUMN GXBDBPS.MCT464EREC (T464ERCoTr TEXT IS 'Currency Transaction');
LABEL ON COLUMN GXBDBPS.MCT464EREC (T464ERCoDc TEXT IS 'Implied Decimal ');
LABEL ON COLUMN GXBDBPS.MCT464EREC (T464ERCmAm TEXT IS 'DRCR Indicator');
LABEL ON COLUMN GXBDBPS.MCT464EREC (T464ERChBk TEXT IS 'Cash Back Amt');
LABEL ON COLUMN GXBDBPS.MCT464EREC (T464ERChDC TEXT IS 'Cash Back indicator DRCR');
LABEL ON COLUMN GXBDBPS.MCT464EREC (T464ERFeLo TEXT IS 'Access Fee Local');
LABEL ON COLUMN GXBDBPS.MCT464EREC ( T464ERFeDC TEXT IS 'Access Fee Local DRCR');
LABEL ON COLUMN GXBDBPS.MCT464EREC (T464ERCoLq TEXT IS 'Currency Code Settlement');
LABEL ON COLUMN GXBDBPS.MCT464EREC (T464ERCuDc TEXT IS 'Rate Conversion');
LABEL ON COLUMN GXBDBPS.MCT464EREC (T464ERToAm TEXT IS 'Completed Amount');
LABEL ON COLUMN GXBDBPS.MCT464EREC (T464ERToDC TEXT IS 'Completed Amount DC');
LABEL ON COLUMN GXBDBPS.MCT464EREC (T464ERInFe TEXT IS 'Interchange Fee');
LABEL ON COLUMN GXBDBPS.MCT464EREC (T464ERIFDC TEXT IS 'Interchange Fee DC');
LABEL ON COLUMN GXBDBPS.MCT464EREC (T464ERFil1 TEXT IS 'Filler');
LABEL ON COLUMN GXBDBPS.MCT464EREC (T464ERRcAm TEXT IS 'Replacement Amount Local');
LABEL ON COLUMN GXBDBPS.MCT464EREC (T464ERRcDC TEXT IS 'Replacement Amount Indicador DC');
LABEL ON COLUMN GXBDBPS.MCT464EREC (T464ERRcSt TEXT IS 'Replacement Amt Settlement');
LABEL ON COLUMN GXBDBPS.MCT464EREC (T464ERRADC TEXT IS 'Replacement Amt Sttl DC');
LABEL ON COLUMN GXBDBPS.MCT464EREC (T464EROrDt TEXT IS 'Original Settlement Date');
LABEL ON COLUMN GXBDBPS.MCT464EREC (T464ERInPs TEXT IS 'Positive ID Indicator');
LABEL ON COLUMN GXBDBPS.MCT464EREC (T464ERFil2 TEXT IS 'Future Service Filler');
LABEL ON COLUMN GXBDBPS.MCT464EREC (T464ERCoBr TEXT IS 'Cross Border Indicator');
LABEL ON COLUMN GXBDBPS.MCT464EREC (T464ErCoIn TEXT IS 'Cross Border Currency Indicador');
LABEL ON COLUMN GXBDBPS.MCT464EREC (T464ERISA TEXT IS 'ISA Fee Indicator');
LABEL ON COLUMN GXBDBPS.MCT464EREC (T464ERTcNu TEXT IS 'Trace Number Adjustment');
LABEL ON COLUMN GXBDBPS.MCT464EREC (T464ERFil3 TEXT IS 'Filler');


select * from mastercard.T464014922

--redmine #

select count (*) from gxbdbps.nut007

select count (*) from yapi.nut007


[14:38] Perla Lopez
en un archivo que se llama GXBDBPS/NUT999

[14:41] Perla Lopez
CARGA DESPUES DEL PRIMER PASO SON AIT001, AIT002, AIT003

[14:43] Perla Lopez
AIE002

[14:44] Perla Lopez
QMAINPGM

  VISA  


--------------------------
--#7543 - Mejoras Incoming VISA
--------------------------
// Cambio de estructura tabla EPTBLMDTA
//------------------------------------------------------------------------- 
ALTER TABLE GXBDBPS.EPTBLMDTA ADD EPTBLTYFIL CHAR(1) NOT NULL     DEFAULT ''
ADD EPTBLOVRDF CHAR(10)
ADD EPTBLTYFIL CHAR(1)     NOT NULL     DEFAULT ''
COMMENT ON COLUMN EPTBLMDTA.EPTBLOVRDF IS 'Nombre Tabla OVRDBF'
COMMENT ON COLUMN EPTBLMDTA.EPTBLTYFIL IS 'Transaccional S/N'

SELECT * FROM GXBDBPS.EPTBLMDTA
//------------------------------------------------------------------------
// Cambio de estructura tabla IPMFCTL
//------------------------------------------------------------------------ 
ALTER TABLE GXBDBPS.IPMFCTL
ADD IPMFFecPro DATE                                  
ADD IPMEstEje CHAR(1) 
ADD IPMUsuUpd CHAR(10)
COMMENT ON COLUMN IPMFCTL.IPMFFecPro  IS 'Fecha Proceso'
COMMENT ON COLUMN IPMFCTL.IPMEstEje IS 'Estado Ejecución'
COMMENT ON COLUMN IPMFCTL.IPMEstEje IS 'Usuario Ult. Actualización'

SELECT * FROM GXBDBPS.IPMFCTL
//------------------------------------------------------------------------- 
// Cambio de estructura tabla IPMFMDTA
//------------------------------------------------------------------------- 
ALTER TABLE GXBDBPS.IPMFMDTA
ADD IPMFTpCall CHAR(1)     NOT NULL     DEFAULT 'S'
ADD IPMFHoPla TIMESTAMP
ADD IPMFDiPla CHAR(10)
ADD IPMFTipEje CHAR(1)     NOT NULL     DEFAULT 'P'
ALTER TABLE IPMFMDTA
COMMENT ON COLUMN IPMFMDTA.IPMFTpCall IS 'Interactivo/Submitido'
COMMENT ON COLUMN IPMFMDTA.IPMFHoPla IS 'Hora planificación Proceso'
COMMENT ON COLUMN IPMFMDTA.IPMFDiPla IS 'Dia planificación Proceso'
COMMENT ON COLUMN IPMFMDTA.IPMFTipEje IS 'Tipo Ejecución'

SELECT * FROM GXBDBPS.IPMFMDTA
//------------------------------------------------------------------------ 
//  INDICES 
//------------------------------------------------------------------------
CREATE INDEX GXBDBPS.IPMFCTL01
ON GXBDBPS.IPMFCTL (IPMFCSTS, IPMFDWNL, IPMFCMEMB);
LABEL ON INDEX GXBDBPS.IPMFCTL01
IS 'GXBDBPS.IPMFCTL (IPMFCSTS,IPMFDWNL,IPMFCMEMB)';
CREATE INDEX GXBDBPS.IPMFMDTA01
ON GXBDBPS.IPMFMDTA (IPMFMMEMB ASC,IPMFMPRF ASC,IPMFMPGM ASC);
LABEL ON INDEX GXBDBPS.IPMFMDTA01
IS 'IPMFMDTA (IPMFMMEMB,IPMFMPRF,IPMFMPGM)';
CREATE INDEX GXBDBPS.IPMFMDTA02
ON GXBDBPS.IPMFMDTA (IPMFACT ASC) UNIT ANY KEEP IN MEMORY NO;
LABEL ON INDEX GXBDBPS.IPMFMDTA02 IS 'IPMFMDTA (IPMFACT)';
CREATE INDEX GXBDBPS.IPMFMDTA03
    ON GXBDBPS.IPMFMDTA (IPMFMMEMB ASC, IPMFMPRF ASC, IPMFMLIB ASC);
LABEL ON INDEX GXBDBPS.IPMFMDTA03
IS 'IPMFMDTA (IPMFMMEMB,IPMFMPRF,IPMFMLIB)';   
//--------------------------------------------------------------------------
// SQLs para inicializar atributos nuevos
//---------------------------------------------------------------------------
UPDATE GXBDBPS.IPMFCTL a SET (a.IPMFDWNL,a.IPMFCSTS,a.IPMESTEJE )=('S', 'PRC', 'S')  
UPDATE GXBDBPS.BULKDTA SET BULKXMTSTS = 'R'  

select * from gxbdbps.ait002

select * from gxbdbps.ipmdta where ipmfec = '20200724' and ipmmti = '1740';

select * from libdebito.drconbep where lfectr = '20201012' and lenemi = '174' order by lhortr desc;

select * from gxopera.OPMOVI where OPFECOM between '20200901' and '20200905'


INSERT INTO GXOPERA.CLPARF(  PARCODBCO,  PARDESCRI,  PARBCOPAI,  PARCSWIFT,  PARNROCT1,  PARTIPCT1,  PARMONED1,  PARNROCT2,  PARTIPCT2,  PARMONED2,  PARLIBRE1)
VALUES(  '061',  'BANCO GNB',  '1004',  'BGNBPYPXXXX',  1004,  'CC',  '600',  0,  '  ',  '   ',  '                                                  ');




select * from gxbdbps.ipmdtae where ipmfname = 'T112031401' and ipmica = '19696' and ipmmti = '1740';

select * from libdebito.drconbep where LCAUTR = '002690';

select * from gxbdbps.tswaut where AUTRRNBEP = '031114383113';

Select * from gxsegdta.tsgfun where SGSISCOD = 33 and sgfunobj in (
'IPMDTA            ',
'IPMDTAView  ',
'IPMDTAWW           ',   
'IPMDTAEWC  ',
'IPMDTAGeneral  ',
'IPMDTAT            ', 
'IPMDTATGeneral  ',
'IPMDTATView  ',
'IPMDTATWW        ',     
'IPMDTATWWDLT  ',
'IPMDTATWWINS  ',
'IPMDTATWWUPD  ',
'IPMDTATE  ',
'IPMDTATEGeneral  ',
'IPMDTATEIPMDTATEPWC  ',
'IPMDTATEPrompt  ',
'IPMDTATEView  ',
'IPMDTATEWC  ',
'IPMDTATEWW  ',
'IPMDTATEWWDLT  ',
'IPMDTATEWWINS  ',
'IPMDTATEWWUPD  ',
'MCT464SHDRGENERAL  ',
'MCT464SHDRVIEW  ',
'MCT464SHDRWW  ',
'MCT464SHDR  ',
'IPMFCTL         ',    
'IPMFCTLGeneral  ',
'IPMFCTLPrompt  ',
'IPMFCTLView  ',
'IPMFCTLWW        '     
)

order by SGFUNCOD;--3998

Select * from gxsegdta.tsgfun where SGFUNdes like 'MATRIZ%' OR SGFUNOBJ like '%TMIFCO%'; --3130

--EXTRACTO ENTIDAD
INSERT INTO GXSEGDTA.TSGFUN VALUES(4003, 33, 'CONCEPTO FACTURA',
'TMIFCO', 'N', 0, 'N', 'S', 'T', 'U99JAVIER',
'2020-12-18 09:05:51', 3134,
'http://localhost:8080/accesobepsa/servlet/seguridad.', 'I');
--PROCESAR EXTR. ENT
INSERT INTO GXSEGDTA.TSGFUN VALUES(4004, 33, 'CONCEPTO FACTURA',
'TMIFCOWW', 'N', 0, 'S', 'S', 'W', 'U99JAVIER',
'2020-12-18 09:05:51', 3134,
'http://localhost:8080/accesobepsa/servlet/seguridad.', 'I');

--AUDITORIA FACT. ENTIDAD
INSERT INTO GXSEGDTA.TSGFUN VALUES(4001, 33, 'AUDITORIA FACT. ENTIDAD',
'TMIFCT', 'N', 0, 'N', 'S', 'T', 'U99JAVIER',
'2020-12-18 09:05:51', 3134,
'http://localhost:8080/accesobepsa/servlet/seguridad.', 'I');

--AUDITORIA FACT. ENTIDAD WORK WITH
INSERT INTO GXSEGDTA.TSGFUN VALUES(4002, 33, 'AUDITORIA FACT. ENTIDAD',
'TMIFCTWW', 'N', 0, 'S', 'S', 'W', 'U99JAVIER',
'2020-12-18 09:05:51', 3134,
'http://localhost:8080/accesobepsa/servlet/seguridad.', 'I');

--WORK WITH EXTRACTO ENTIDAD
INSERT INTO GXSEGDTA.TSGFUN VALUES(3999, 33, 'EXTRACTO ENTIDAD',
'TMIEFHWW', 'N', 0, 'S', 'S', 'W', 'U99JAVIER',
'2020-12-18 09:05:51', 3134,
'http://localhost:8080/accesobepsa/servlet/seguridad.', 'I');

--AGREGAR PERMISO EN EL ROL
INSERT INTO GXSEGDTA.TSGFUN VALUES(3999, 33, 'EXTRACTO ENTIDAD',
'TMIEFHWW', 'N', 0, 'S', 'S', 'W', 'U99JAVIER',
'2020-12-18 09:05:51', 3134,
'http://localhost:8080/accesobepsa/servlet/seguridad.', 'I');

--CONSULTA ROL
INSERT INTO GXSEGDTA.TSGROLDT VALUES(278, 33, 4013, 'S', 'S', 'S',
'S');

SELECT  * FROM  GXSEGDTA.TSGROLDT

SELECT * FROM GXSEGDTA.TSGROL WHERE SGROLCOD = '278';

CREATE PROCEDURE APMI016 (INOUT CHAR(8), INOUT CHAR(8)) EXTERNAL  
LANGUAGE RPG GENERAL;

SELECT * FROM GXSWTDTA.TMIEFH; --CABECERA EXTRACTO ENTIDAD

SELECT * FROM GXSWTDTA.TMIEFD; --DETALLE EXTRACTO ENTIDAD

SELECT * FROM GXSWTDTA.tmifhd WHERE FHDFECJUL = 2020350;

delete from GXSWTDTA.tmifhd WHERE FHDFECJUL = 2020350;

SELECT * FROM GXSWTDTA.tmifNM WHERE FNMFECJUL = 2020350;

delete from GXSWTDTA.tmifNM WHERE FNMFECJUL = 2020350;

delete from GXSWTDTA.tmifDT

SELECT * FROM GXSWTDTA.tmifDT WHERE FDTRRNBEP LIKE '%34721858794%'--WHERE FNMMONID = 600 AND FNMDETID = 1 AND FDTCONID = 11000 AND FNMMARPRD = 'CIR' AND FDTCONTPO = 'FI' AND FHDRID = '2020314001';wr--FDTORIREF LIKE '%0314%';

SELECT * FROM GXSWTDTA.tmifEE WHERE FNMMONID = 840 AND FNMDETID = 1 AND FHDRID = '2020314003';--FDTORIREF LIKE '%0314%';

delete from GXSWTDTA.tmifEE

UPDATE GXSWTDTA.ipmdtae SET IPMDEV = INSERT(CAST(SUBSTR(IPMDEV, 1, 16) AS CHAR(16)), 7, 6, '999999')
WHERE IPMDELN=2;

select * from FNMMONDES 

SELECT tw.AUTPANNRO,
tw.AUTRRNBEP fdtrrnbep ,
tw.AUTTRXCOD fdtracod ,
tw.AUTCODCOMB fdtcodcom ,
tw.AUTCOMRAZ fdtcomdes ,
tw.AUTCOMMCC fdtmcc ,
tw.AUTPROADQ fdtadqid ,
tw.AUTMONTORI fdtmtoorig ,
tw.AUTMONCOM fdtcomcom ,
tw.AUTMONTCOT fdtcotiza
FROM GXBDBPS.TSWAUT tw
WHERE
--tw.AUTPANNRO ='2306710001000182' AND
tw.AUTCODAUT ='002459' AND
tw.AUTTRXFCHF='20200910';


SELECT COUNT(*), OPCRECBA FROM GXOPERA.OPLICRE WHERE OPCREFCOM = '20201123' GROUP BY OPCRECBA;

select * from qsys2.procedures where procname = 'APMI003' and proc_location = 'U99JAVIER/APMI003' order by procname;

drop procedure U99JAVIER.APMI003 where procname = 'APMI003' and proc_location = 'U99JAVIER/APMI003' order by procname;

DROP PROCEDURE U99JAVIER.APMI003;

CREATE PROCEDURE APMI003 (INOUT CHAR(8), INOUT CHAR(8)) EXTERNAL NAME APMI003 LANGUAGE RPG GENERAL

--  Generar SQL 
--  Versión:                   	V7R2M0 140418 
--  Generado en:              	25/11/20 13:49:17 
--  Base de datos relacional:       	E10E97CR 
--  Opción de estándares:          	DB2 for i 
CREATE PROCEDURE gxswtpgm.APMI003 ( 
	INOUT CHAR(8) , 
	INOUT CHAR(8) ) 
	LANGUAGE RPG 
	SPECIFIC gxswtpgm.APMI003 
	NOT DETERMINISTIC 
	MODIFIES SQL DATA 
	CALLED ON NULL INPUT 
	EXTERNAL NAME gxswtpgm.APMI003 
	PARAMETER STYLE GENERAL ;
	
--  Generar SQL 
--  Versión:                   	V7R2M0 140418 
--  Generado en:              	25/11/20 15:23:38 
--  Base de datos relacional:       	B10E97CR 
--  Opción de estándares:          	DB2 for i 
CREATE VIEW GXSWTDTA.UTMIFDT1 ( 
--  SQL1506   30   Clave o atributo para UTMIFDT1 de GXSWTDTA ignorado. 
	FHDRID , 
	FNMMONID , 
	FNMDETID , 
	FDTNROLIN , 
	FDTBIN , 
	FDTPAN , 
	FDTCTATC , 
	FDTCTATD , 
	FDTTPOUSO , 
	FDTAMBPAN , 
	FDTEMIPAN , 
	FDTRRNBEP , 
	FDTFECTRX , 
	FDTRACOD , 
	FDTARNMAR , 
	FDTCONID , 
	FDTCODAUT , 
	FDTCODCOM , 
	FDTCOMDES , 
	FDTMCC , 
	FDTADQID , 
	FDTMONORIG , 
	FDTMTOORIG , 
	FDTFEETRX , 
	FDTFEEAFE , 
	FDTMTOLIQ , 
	FDTMTOAFE , 
	FDTCOMCOM , 
	FDTORITRX , 
	FDTROLTIP , 
	FDTCOTIZA , 
	FDTORIREV , 
	FDTARNORG , 
	FDTFECINC , 
	FDTFECOUT , 
	FDTESTCONC , 
	FDTCONSAP , 
	FDTCONENT , 
	FDTFACENT , 
	FDTFAENTID , 
	FDTFHOUPD , 
	FDTUSUUPD , 
	FDTORIREF , 
	FDTORITPO , 
	FDTCICNRO , 
	FDTCONTPO , 
	FNMMARPRD , 
	FDTROLID ) 
	AS 
	SELECT 
	FHDRID , 
	FNMMONID , 
	FNMDETID , 
	FDTNROLIN , 
	FDTBIN , 
	FDTPAN , 
	FDTCTATC , 
	FDTCTATD , 
	FDTTPOUSO , 
	FDTAMBPAN , 
	FDTEMIPAN , 
	FDTRRNBEP , 
	FDTFECTRX , 
	FDTRACOD , 
	FDTARNMAR , 
	FDTCONID , 
	FDTCODAUT , 
	FDTCODCOM , 
	FDTCOMDES , 
	FDTMCC , 
	FDTADQID , 
	FDTMONORIG , 
	FDTMTOORIG , 
	FDTFEETRX , 
	FDTFEEAFE , 
	FDTMTOLIQ , 
	FDTMTOAFE , 
	FDTCOMCOM , 
	FDTORITRX , 
	FDTROLTIP , 
	FDTCOTIZA , 
	FDTORIREV , 
	FDTARNORG , 
	FDTFECINC , 
	FDTFECOUT , 
	FDTESTCONC , 
	FDTCONSAP , 
	FDTCONENT , 
	FDTFACENT , 
	FDTFAENTID , 
	FDTFHOUPD , 
	FDTUSUUPD , 
	FDTORIREF , 
	FDTORITPO , 
	FDTCICNRO , 
	FDTCONTPO , 
	FNMMARPRD , 
	FDTROLID   
	FROM GXSWTDTA.TMIFDT 
	  
	RCDFMT GXTMIFDT   ; 
  
LABEL ON COLUMN GXSWTDTA.UTMIFDT1 
( FHDRID IS 'MI Header Record    Id. ' , 
	FNMMONID IS 'MI Nivel Mon Id.' , 
	FNMDETID IS 'MI Nivel Mon Id.    Detalle ' , 
	FDTNROLIN IS 'MI Detalle          Transacciones Nro   Línea ' , 
	FDTBIN IS 'MI Detalle Trans.   BIN ' , 
	FDTPAN IS 'MI Detalle Trans.   Tarjeta ' , 
	FDTCTATC IS 'MI Detalle Trans.   Cuenta TC ' , 
	FDTCTATD IS 'MI Detalle Trans.   Cuenta TD ' , 
	FDTTPOUSO IS 'MI Detalle Trans.   Tipo Uso Tarjeta ' , 
	FDTAMBPAN IS 'MI Detalle Trans.   Ambito Tarjeta ' , 
	FDTEMIPAN IS 'MI Detalle Trans.   Emisor Tarjeta ' , 
	FDTRRNBEP IS 'MI Detalle Trans.   RRN Bepsa ' , 
	FDTFECTRX IS 'MI Detalle Trans.   Fecha Transaccion ' , 
	FDTRACOD IS 'MI Detalle Trans.   Código Transaccion ' , 
	FDTARNMAR IS 'MI Detalle Trans.   ARN Marca ' , 
	FDTCONID IS 'MI Detalle Trans.   Concepto Marca ' , 
	FDTCODAUT IS 'MI Detalle Trans.   Codigo              Autorización ' , 
	FDTCODCOM IS 'MI Detalle Trans.   Codigo Comercio ' , 
	FDTCOMDES IS 'MI Detalle Trans.   Descrición          Comercio ' , 
	FDTMCC IS 'MI Detalle Trans.   MCC ' , 
	FDTADQID IS 'MI Detalle Trans.   Adquirente ' , 
	FDTMONORIG IS 'MI Detalle Trans.   Moneda Origen ' , 
	FDTMTOORIG IS 'MI Detalle Trans.   Moneda Origen ' , 
	FDTFEETRX IS 'MI Detalle Trans.   Fee Transaccion ' , 
	FDTFEEAFE IS 'MI Detalle Trans.   Tipo Afect Fee ' , 
	FDTMTOLIQ IS 'MI Detalle Trans.   Monto Liquidación ' , 
	FDTMTOAFE IS 'MI Detalle Trans.   Tipo Afect Mto Liq ' , 
	FDTCOMCOM IS 'MI Detalle Trans.   Comisión Comercio ' , 
	FDTORITRX IS 'MI Detalle Trans.   Origen Transacción ' , 
	FDTROLTIP IS 'MI Detalle Trans.   Tipo Rol ' , 
	FDTCOTIZA IS 'MI Detalle Trans.   Cotización ' , 
	FDTORIREV IS 'MI Detalle Trans.   Orig/Rev ' , 
	FDTARNORG IS 'MI Detalle Trans.   ARN Orig ' , 
	FDTFECINC IS 'MI Detalle Trans.   Fecha Incoming ' , 
	FDTFECOUT IS 'MI Detalle Trans.   Fecha Outgoing ' , 
	FDTESTCONC IS 'MI Detalle Trans.   Estado              Conciliación ' , 
	FDTCONSAP IS 'MI Detalle Trans.   Concilia SAP ' , 
	FDTCONENT IS 'MI Detalle Trans.   Conciliación        Entidad ' , 
	FDTFACENT IS 'MI Detalle Trans.   Facturado Entidad ' , 
	FDTFAENTID IS 'MI Detalle Trans.   Identificador       Auditoria Factura ' , 
	FDTFHOUPD IS 'MI Detalle Trans.   FH Ult              Actualización ' , 
	FDTUSUUPD IS 'MI Detalle Trans.   Usuario ' , 
	FDTORIREF IS 'MI Detalle Trans.   Origen Referencia ' , 
	FDTORITPO IS 'MI Detalle Trans.   Tipo Origen ' , 
	FDTCICNRO IS 'MI Detalle Trans.   Ciclo Liq Marca ' , 
	FDTCONTPO IS 'MI Detalle Trans.   Concepto Tipo ' , 
	FNMMARPRD IS 'MI Nivel Mon Marca  Producto ' , 
	FDTROLID IS 'Mi Det Mi Detalle   Rol Id. ' ) ; 
  
LABEL ON COLUMN GXSWTDTA.UTMIFDT1 
( FHDRID TEXT IS 'MI Header Record  Id.' , 
	FNMMONID TEXT IS 'MI Nivel Mon Id.' , 
	FNMDETID TEXT IS 'MI Nivel Mon Id.  Detalle' , 
	FDTNROLIN TEXT IS 'MI Detalle  Transacciones Nro  Línea' , 
	FDTBIN TEXT IS 'MI Detalle Trans.  BIN' , 
	FDTPAN TEXT IS 'MI Detalle Trans.  Tarjeta' , 
	FDTCTATC TEXT IS 'MI Detalle Trans.  Cuenta TC' , 
	FDTCTATD TEXT IS 'MI Detalle Trans.  Cuenta TD' , 
	FDTTPOUSO TEXT IS 'MI Detalle Trans.  Tipo Uso Tarjeta' , 
	FDTAMBPAN TEXT IS 'MI Detalle Trans.  Ambito Tarjeta' , 
	FDTEMIPAN TEXT IS 'MI Detalle Trans.  Emisor Tarjeta' , 
	FDTRRNBEP TEXT IS 'MI Detalle Trans.  RRN Bepsa' , 
	FDTFECTRX TEXT IS 'MI Detalle Trans.  Fecha Transaccion' , 
	FDTRACOD TEXT IS 'MI Detalle Trans.  Código Transaccion' , 
	FDTARNMAR TEXT IS 'MI Detalle Trans.  ARN Marca' , 
	FDTCONID TEXT IS 'MI Detalle Trans.  Concepto Marca' , 
	FDTCODAUT TEXT IS 'MI Detalle Trans.  Codigo  Autorización' , 
	FDTCODCOM TEXT IS 'MI Detalle Trans.  Codigo Comercio' , 
	FDTCOMDES TEXT IS 'MI Detalle Trans.  Descrición  Comercio' , 
	FDTMCC TEXT IS 'MI Detalle Trans.  MCC' , 
	FDTADQID TEXT IS 'MI Detalle Trans.  Adquirente' , 
	FDTMONORIG TEXT IS 'MI Detalle Trans.  Moneda Origen' , 
	FDTMTOORIG TEXT IS 'MI Detalle Trans.  Moneda Origen' , 
	FDTFEETRX TEXT IS 'MI Detalle Trans.  Fee Transaccion' , 
	FDTFEEAFE TEXT IS 'MI Detalle Trans.  Tipo Afect Fee' , 
	FDTMTOLIQ TEXT IS 'MI Detalle Trans.  Monto Liquidación' , 
	FDTMTOAFE TEXT IS 'MI Detalle Trans.  Tipo Afect Mto Liq' , 
	FDTCOMCOM TEXT IS 'MI Detalle Trans.  Comisión Comercio' , 
	FDTORITRX TEXT IS 'MI Detalle Trans.  Origen Transacción' , 
	FDTROLTIP TEXT IS 'MI Detalle Trans.  Tipo Rol' , 
	FDTCOTIZA TEXT IS 'MI Detalle Trans.  Cotización' , 
	FDTORIREV TEXT IS 'MI Detalle Trans.  Orig/Rev' , 
	FDTARNORG TEXT IS 'MI Detalle Trans.  ARN Orig' , 
	FDTFECINC TEXT IS 'MI Detalle Trans.  Fecha Incoming' , 
	FDTFECOUT TEXT IS 'MI Detalle Trans.  Fecha Outgoing' , 
	FDTESTCONC TEXT IS 'MI Detalle Trans.  Estado  Conciliación' , 
	FDTCONSAP TEXT IS 'MI Detalle Trans.  Concilia SAP' , 
	FDTCONENT TEXT IS 'MI Detalle Trans.  Conciliación  Entidad' , 
	FDTFACENT TEXT IS 'MI Detalle Trans.  Facturado Entidad' , 
	FDTFAENTID TEXT IS 'MI Detalle Trans.  Identificador  Auditoria Factur' , 
	FDTFHOUPD TEXT IS 'MI Detalle Trans.  FH Ult  Actualización' , 
	FDTUSUUPD TEXT IS 'MI Detalle Trans.  Usuario' , 
	FDTORIREF TEXT IS 'MI Detalle Trans.  Origen Referencia' , 
	FDTORITPO TEXT IS 'MI Detalle Trans.  Tipo Origen' , 
	FDTCICNRO TEXT IS 'MI Detalle Trans.  Ciclo Liq Marca' , 
	FDTCONTPO TEXT IS 'MI Detalle Trans.  Concepto Tipo' , 
	FNMMARPRD TEXT IS 'MI Nivel Mon Marca  Producto' , 
	FDTROLID TEXT IS 'Mi Det Mi Detalle  Rol Id.' ) ; 
  
GRANT ALTER , DELETE , INSERT , REFERENCES , SELECT , UPDATE   
ON GXSWTDTA.UTMIFDT1 TO DESAPRF2 WITH GRANT OPTION ; 
  
GRANT SELECT   
ON GXSWTDTA.UTMIFDT1 TO PUBLIC ;

Select * from libdebito.drconbel7 where LERRNB = '031314585092' AND LCAUTR='031249' AND LFCOTR = 20201109;

select * from gxswtdta.tmifdt where FDTRRNBEP  LIKE '%34721941093%'; --fdtconENT = 'S' and fhdrid like '2020350%';

select * from gxswtdta.tmiEFD WHERE EFDRRNTRX LIKE '%34721941093%';

UPDATE GXSWTDTA.TMIFDT
   SET fdtconsap = 'P'
WHERE fdtconsap = 'S';

SELECT * FROM QTEMP.TMIFnmQ;

select * from libdebito.drconbep
where LERRNB in (
'034922039942',  
'034922087093',  
'034922177952',  
'034922163186',  
'034922075528',  
'034922162188',  
'034922203794'   
);

2020select * from gxswtdta.ITMIFNM3;

SELECT FDTFECTRX, FDTCONENT FROM gxswtdta.tmifdt WHERE FDTRRNBEP =
'034721941093';

SELECT * FROM gxswtdta.tmiEFD WHERE EFDRRNTRX LIKE '%34721941093';

INSERT INTO GXSEGDTA.TSGNUM ( SGNUMCOD, SGNUMOBJ, SGNUMINI, SGNUMACT, SGNUMSET, SGNUMDESC, SGNUMPRG, SGNUMUNT)
VALUES 
(  118,  'TMIFCT',  1,  0,  'N',  'Matriz MI Facturación Entidades','',  0); -- Reemplazar 118 por sgnumcod + 1  obtenido

INSERT INTO GXSEGDTA.TSGNUM (  SGNUMCOD, SGNUMOBJ, SGNUMINI, SGNUMACT, SGNUMSET, SGNUMDESC, SGNUMPRG, SGNUMUNT)
VALUES 
(  119,  'TMIFCO',  1,  0,  'N',  'Matriz MI Concepto Factura','',  0); -- Reemplazar 119 por sgnumcod + 1  obtenido

UPDATE GXSWTDTA.TMIFDT SET FDTRRNBEP = '034721941093', FDTFECTRX =
'20201213', FDTCONENT = 'P' WHERE FDTRRNBEP = '034821992904';

SELECT * FROM GXSWTDTA.TMIFDT WHERE FDTRRNBEP = '034721941093';

select * from gxswtdta.mct464erec where T464FHRID = 328;

--PRUEBAS DE GENERACION DEL DATA ELEMENT 25

select * from gxbdbps.ipmfctl where ipmfcname = 'T112104402';

--ipmdta generado
select * from gxbdbps.ipmdta where IPMFNAME = 'T112104402';

select * from gxbdbps.ipmdtae where IPMFNAME = 'T112104402';

select * from gxbdbps.ipmdtaep where IPMFNAME = 'T112104402';

--  Generar SQL 
--  Versión:                   	V7R2M0 140418 
--  Generado en:              	11/03/21 10:47:14 
--  Base de datos relacional:       	E10E97CR 
--  Opción de estándares:          	DB2 for i 
CREATE VIEW GXBDBPS.IPMMDEP1 ( 
--  SQL1506   30   Clave o atributo para IPMMDEP1 de GXSWTDTA ignorado. 
	IPMMTI , 
	IPMFNC , 
	IPMORV , 
	IPMDELN , 
	IPMPDSID ) 
	AS 
	SELECT 
	IPMMTI , 
	IPMFNC , 
	IPMORV , 
	IPMDELN , 
	IPMPDSID   
	FROM GXBDBPS.IPMMDEP 
	  
	RCDFMT IPMMDEP  ; 
  
LABEL ON COLUMN GXSWTDTA.IPMMDEP1 
( IPMMTI IS 'MTI                 de                  Mensajes' , 
	IPMFNC IS 'Funcion Id de       Mensaje ' , 
	IPMORV IS 'Original/Reversion' , 
	IPMDELN IS 'Data                Element             Id' , 
	IPMPDSID IS 'PDS                 Id' ) ; 
  
LABEL ON COLUMN GXSWTDTA.IPMMDEP1 
( IPMMTI TEXT IS 'MTI de Mensajes' , 
	IPMFNC TEXT IS 'Funcion Id de  Mensaje' , 
	IPMORV TEXT IS 'Original/Reversion' , 
	IPMDELN TEXT IS 'Data Element Id' , 
	IPMPDSID TEXT IS 'PDS Id' ) ; 
  
GRANT REFERENCES ( IPMDELN , IPMFNC , IPMMTI , IPMORV , IPMPDSID ) , UPDATE ( IPMDELN , IPMFNC , IPMMTI , IPMORV , IPMPDSID )   
ON GXSWTDTA.IPMMDEP1 TO DBA WITH GRANT OPTION ; 
  
GRANT ALTER , DELETE , INSERT , REFERENCES , SELECT , UPDATE   
ON GXSWTDTA.IPMMDEP1 TO QDFTOWN WITH GRANT OPTION ; 
  
GRANT REFERENCES ( IPMDELN , IPMFNC , IPMMTI , IPMORV , IPMPDSID ) , UPDATE ( IPMDELN , IPMFNC , IPMMTI , IPMORV , IPMPDSID )   
ON GXSWTDTA.IPMMDEP1 TO USRRGNSWT WITH GRANT OPTION ; 
  
GRANT REFERENCES ( IPMDELN , IPMFNC , IPMMTI , IPMORV , IPMPDSID ) , UPDATE ( IPMDELN , IPMFNC , IPMMTI , IPMORV , IPMPDSID )   
ON GXSWTDTA.IPMMDEP1 TO U99ARIEL WITH GRANT OPTION ; 
  
GRANT REFERENCES ( IPMDELN , IPMFNC , IPMMTI , IPMORV , IPMPDSID ) , UPDATE ( IPMDELN , IPMFNC , IPMMTI , IPMORV , IPMPDSID )   
ON GXSWTDTA.IPMMDEP1 TO U99HERNAN WITH GRANT OPTION ; 
  
GRANT REFERENCES ( IPMDELN , IPMFNC , IPMMTI , IPMORV , IPMPDSID ) , UPDATE ( IPMDELN , IPMFNC , IPMMTI , IPMORV , IPMPDSID )   
ON GXSWTDTA.IPMMDEP1 TO U99JAVIER WITH GRANT OPTION ; 
  
GRANT REFERENCES ( IPMDELN , IPMFNC , IPMMTI , IPMORV , IPMPDSID ) , UPDATE ( IPMDELN , IPMFNC , IPMMTI , IPMORV , IPMPDSID )   
ON GXSWTDTA.IPMMDEP1 TO U99MABEL WITH GRANT OPTION ; 
  
GRANT REFERENCES ( IPMDELN , IPMFNC , IPMMTI , IPMORV , IPMPDSID ) , UPDATE ( IPMDELN , IPMFNC , IPMMTI , IPMORV , IPMPDSID )   
ON GXSWTDTA.IPMMDEP1 TO U99SARAV WITH GRANT OPTION ; 
  
GRANT REFERENCES ( IPMDELN , IPMFNC , IPMMTI , IPMORV , IPMPDSID ) , UPDATE ( IPMDELN , IPMFNC , IPMMTI , IPMORV , IPMPDSID )   
ON GXSWTDTA.IPMMDEP1 TO U99VERA WITH GRANT OPTION ;

SELECT * FROM GXBDBPS.IPMDTAEP;

SELECT * FROM GXBDBPS.IPMMDEP;

select * from gxbdbps.ipmdtaep;

--cambios reporte de outgoing, #14377
select * from gxswtdta.ipmdta where IPMFNAME in ( 'R111108511', 'R111108512');

select * from gxswtdta.ipmdtat where IPMARN = '12306119283282188433144';

select * from gxswtdta.ipmfctl where SUBSTR(IPMFCNAME, 1, 4) like 'R111%';

select * from gxswtdta.ipmdtat where IPMFNAME = 'T113108306';

select * from gxswtdta.ipmdtate where IPMFNAME = 'T113108306';

SELECT * FROM GXBDBPS.GENTIAF;
SELECT * FROM GXBDBPS.GXRELGRU where usuaid = 'U99JAVIER';
SELECT * FROM GXBDBPS.TDCODENT;
select * from gxbdbps.nut003;
select * from gxbdbps.debgengraf;
select * from gxbdbps.mientsre;

Select * from gxbdbps.ait003 where substr(AITCRLin,59,6) = 'V2110 ' and substr(AITCRLin,17,10) = '9000524039'; --> Conti                  
Select * from gxbdbps.ait003 where substr(AITCRLin,59,6) = 'V2110 ' and substr(AITCRLin,17,10) = '9000530350'; --> BNF


INSERT INTO GXBDBPS.NUT003
(
  ENTID,
  EBINMTID,
  EBINID,
  EBINPMTID,
  EBINUSRAUD,
  EBINFHAUD
)
VALUES
(
  '002',
  'VSA',
  '700935',
  'CLA',
  'U99JAVIER   ',
  '2021-03-15 08:50:00.000'
);

INSERT INTO GXBDBPS.NUT003
(
  ENTID,
  EBINMTID,
  EBINID,
  EBINPMTID,
  EBINUSRAUD,
  EBINFHAUD
)
VALUES
(
  '020',
  'VSA',
  '700935',
  'CLA',
  'U99JAVIER  ',
  '2021-04-23 08:50:00.000'
);

select * from cierrelib.tmtaraf where enemiso = '176';

select * from gxbdbps.tdgenti;

select * from gxswtdta.nut999 where dbgusrid = 'PMC002';

select * from libclea.tclmov;

select strsq from libclea.tclmov
where movfcre > '20210427'
group by movfcre;

values DAYOFYEAR(CURRENT_date);

select * from gxbdbps.ait001 where AIID = '2021159001';
select * from gxbdbps.ait002 where aiid = '2021159001';
select * from gxbdbps.ait003 where aiid = '2021159001'; group by aitcid;


select * from gxfindta.tclrtc where rtccomerc = '0701055';
select * from gxfindta.tclrtd where RTCIDRETEN = '918';
select * from gxfindta.tclmov; --where movidmov = '16948853';

Select * from gxbdbps.ait003 where substr(AITCRLin,59,6) = 'V2110 ';

Select * from gxbdbps.ait003 where substr(AITCRLin,59,6) = 'V2110 ' and substr(AITCRLin,17,10) = '9000530354';
---------------------------------------------------
---------------------------------------------------
--Tareas #15985 - QA y Testing - Reporte de Outgoing
---------------------------------------------------
---------------------------------------------------

select * from gxswtdta.IPMDTA where ipmfec > '20210430';
select * from gxswtdta.IPMDTAE WHERE ipmfec > '20210430'; 
select * from gxswtdta.IPMDTAEP WHERE ipmfec > '20210430'; ok
select * from gxswtdta.IPMDTAT WHERE ipmfec > '20210430'; ok
select * from gxswtdta.IPMDTATE WHERE SUBSTR(IPMFNAME,4,3) > '120'; ok
select * from gxswtdta.IPMDTATEP WHERE SUBSTR(IPMFNAME,4,3) > '120'; ok
select * from gxswtdta.IPMFCTL WHERE IPMFCINS > '20210430'; ok


select * from yapi.ipmdta limit 1;
select * from gxswtdta.ipmdta limit 1;

update gxswtdta.ipmdta set ipmconf = '0' where ipmconf <> '0';

select * from gxbdbps.ipmdtat where substr(IPMFNAME,1,4) ='T113';

select * from gxbdbps.tswaut where AUTRRNBEP in  ('115500164763','115500164773','115500164771');

select txctrx, txdtrx from libdebito.TBCTRA0P where txctrx in (
select lcodtr from libdebito.drconbep where lfectr = '20210630')
group by txctrx, txdtrx;

--17328 - MATRIZ VISA
select * from gxbdbps.IPMDTA; 
select * from gxbdbps.IPMDTAE; 
select * from gxbdbps.IPMDTAEP; 
select * from gxbdbps.MCT464FHDR; 
select * from gxbdbps.MCT464SHDR; 
select * from gxbdbps.MCT464FRDR; 
select * from gxbdbps.MCT464STRL;
select * from gxbdbps.AIT001;            
select * from gxbdbps.AIT002;             
select * from gxbdbps.AIT003;

select * from gxswtdta.IPMDTA;
select * from gxswtdta.IPMDTAE
select * from gxswtdta.IPMDTAEP
select * from gxswtdta.MCT464FHDR
select * from gxswtdta.MCT464SHDR
select * from gxswtdta.MCT464FRDR
select * from gxswtdta.MCT464STRL;
select * from gxswtdta.AIT001 where AIFCHPRO betwee           
select * from gxswtdta.AIT002        
select * from gxswtdta.AIT003 where aiid = '2021057001'order by AITCID desc ;

select * from gxbdbps.tswaut where AUTTRXFCHC in ('20210225', '20210226') and AUTMARTAR = 'VSA';

select * from gxswtdta.AIT002 limit 2;
select * from javierlib.AIT002 limit 2;

update gxswtdta.ipmdta set ipmconf = '1';

select auttrxfchc from gxbdbps.tswaut group by auttrxfchc

select count(*) from javierlib.tswautbk group by auttrxfchc

select * from gxbdbps.tcodpp where cocomer = '0100001';



--reporte outgoing mastercard
--1.- Identificar registros T113 de rechazos a reenviar
select * from gxbdbps.IPMDTAT where ipmfname = 'T113118186' and IPMMTI = '1240';

--se procesan solamente los R113 que cuentan con el campo IPMMSGREG = S
update gxbdbps.IPMDTAT set IPMMSGREP = 'S' where ipmfname = 'T113118186' and IPMMTI = '1240';

--Estado del ARN enviado para procesar, verificar ARN de IPMDTAT
select * from gxbdbps.ipmdtat where ipmarn = '12306111180177692964397';

--Identificar en Data element 123, que contiene el numero de R119 que se reenvia a la marca
select * from gxbdbps.IPMDTATE where ipmfname = 'T113118186' and IPMMTI = '1240' and IPMDELN = 123 and IPMARN = '12306111180177692964397';

--se agrega en el IPMDTA el log del R119 reenviado
select * from gxbdbps.ipmdta where ipmfname = 'R119118928';

select * from gxbdbps.IPMDTAE where IPMMTI = '1240' and IPMDELN = 123 and IPMARN = '12306111180176692404099';

--MATRIZ VISA

select * from gxswtdta.tmifhd limit 1;
select * from gxswtdta.tmifnm limit 1;
select * from gxswtdta.tmifee limit 1;
select * from gxswtdta.tmifdt limit 1;

select * from gxswtdta.iait001 where aiid = '2021057001';
select * from gxswtdta.uait0022
Where AIId = '2021057001'
		and AITCMonId = 600
		and AITCId = '05' 

select * from gxswtdta.iait001 where aiid = '2021057001';
select * from gxswtdta.iait003 where aiid = '2021057001';

select * from gxswtdta.tmifdt;

select * from gxswtdta.TMICON;

select * from gxswtdta.tmifhd where FHDRID = '2021057001'; --cabecera
select * from gxswtdta.tmifnm where FHDRID in ('2021056001');
select * from gxswtdta.tmifee;
select * from gxswtdta.tmifdt;
select * from gxswtdta.tmipro;
select * from gxbdbps.tswaut where AUTTRXFCHI = '20210225' and AUTMARTAR = 'VSA';
select * from libdebito.drconbep where LFECTR = '20210225';
select * from gxbdbps.tdgbin;

select * from gxtrjdta.tdgmon;
select * from gxtrjdta.tdgbin;
select * from gxtrjdta.tdgmar;


DELETE from gxswtdta.tmifhd; 
DELETE from gxswtdta.tmifnm; 
DELETE from gxswtdta.tmifee;
DELETE from gxswtdta.tmifdt;

select * from gxswtdta.tmipro WHERE PRCFECPRO = '20210227';

values dayofyear(date('2021-02-26'));

select * from gxswtdta.itmifhd;

select * from gxswtdta.mientsre;

select * from gxswtdta.iait003
where AIId = '2021057001'
		and AITCId = '05'
		and AITCRId = '1';
		
select * from gxswtdta.ait002
where AITCID in ('05', '07', '25', '27')
and substr (aiid,1,7) = '2021057';

update gxswtdta.ait002 set AITCMONID = 600
where AITCMONID = 0 and AITCPAIID = 'PY' 
and substr (aiid,1,7) = '2021057'
and AITCID in ('05', '07', '25', '27');

select * from gxswtdta.tmifhd
Where FHDMarId = 'VSA'
		and FHDUsuario = 'APMI020';
		
select * from gxswtdta.utmifnm1
Where FnmMarId = 'VSA'
		and FnmUsuario = 'APMI020';
		
select * from gxswtdta.itmifdt
where FDTMONORIG = '600'
and FHDRID = '2021057001'
and FNMDETID like '%1';

