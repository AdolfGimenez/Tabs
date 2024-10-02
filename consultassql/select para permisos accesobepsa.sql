select * from gxsegdta.tsgusr where sgusrid = 'U99JOSE'      -- Usuarios   
select * from gxsegdta.tsgfun  where sgfunobj in ('WMC001'); -- Funcionalidades       2898
Select * from gxsegdta.tsgrol   where sgsiscod = 25;       -- Cabecera ROL   
Select * from gxsegdta.tsgroldt where sgrolcod  in(356) ;     -- Detalle ROL
Select * from gxsegdta.tsgaru  where  SGUSRCOD = '2011'  and   SGSISCOD IN (33);      -- Relacion usuario - rol
Select * from gxsegdta.tsgsis   WHERE SGSISCOD IN (2,25)  -- Sistemas




select * from gxsegdta.tsgfun where sgfunobj in ('WMC001');


INSERT INTO GXSEGDTA.TSGROLDT (SGROLCOD,SGSISCOD,SGFUNCOD,SGRDTPDIS,SGRDTPUPD,SGRDTPINS,SGRDTPDEL) 
VALUES
  (356,33,2574,'S','S','S','S');
  INSERT INTO GXSEGDTA.TSGROLDT (SGROLCOD,SGSISCOD,SGFUNCOD,SGRDTPDIS,SGRDTPUPD,SGRDTPINS,SGRDTPDEL) 
VALUES
  (356,33,2578,'S','S','S','S');
  
select * from gxtrjdta.tdgbin




select * from GXBDBPS.THMOVAF

select * from libdebito.drconbep


select * from GXBDBPS.TDEMNOTAR



CASE
WHEN QSYS2 . VERIFY_GROUP_FOR_USER ( CURRENT_USER , 'DBA' , 'DESAPRF2' ) = 1
THEN TDEMNOTAR . NENROTARJ
ELSE QSYS2 . SUBSTR ( TDEMNOTAR . NENROTARJ , 1 , 6 ) CONCAT 'XXXXXX' CONCAT QSYS2 . SUBSTR ( TDEMNOTAR . NENROTARJ , 13 , 4 )
END;

