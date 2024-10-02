SELECT * FROM GXBDBPS.TAFITRA a
LEFT JOIN GXBDBPS.COMAEAF b ON b.cocomer = a.cocomer
WHERE PARENE = '041' AND TRAEST = 'A';
------------------------------------------------------------------------------------------------------------------
-- BEPSA
select *from gxbdbps.tafitra where parene='155' limit 1; -- AND COCOMER='0706581'
delete from gxbdbps.tafitra where parene='155'; --0706582

INSERT INTO GXBDBPS.TAFITRA (PARENE, PARBIN, PARAFINI, COCOMER, TRAEST, TRAFCHALT, TRAUSRALT, TRAFCHMOD, TRAUSRMOD)
VALUES ('155', '627431', '001', '0706582', 'A', '20231215', 'U99ADOLFO', '20231215', NULL);

insert into gxbdbps.tafitra (PARENE, PARBIN, PARAFINI, COCOMER, TRAEST, TRAFCHALT,TRAUSRALT, TRAFCHMOD, TRAUSRMOD)
( select '155','627431','001', cocomer,'A', '20200124','U99JOSEEN','20200619',''
from gxbdbps.comaeaf where substr(cocomer,1,2) in ('02','07','24','28','60') and costat = 0);
------------------------------------------------------------------------------------------------------------------
----AVALON
select *from gxbdbps.tafitra where parene='178';
DELETE from gxbdbps.tafitra where parene='178';

insert into gxbdbps.tafitra (PARENE, PARBIN, PARAFINI, COCOMER, TRAEST, TRAFCHALT,TRAUSRALT, TRAFCHMOD, TRAUSRMOD)
( select '178','627431','001', cocomer,'A', '20210506','U99HERNAN','20210506',''
from gxbdbps.comaeaf where substr(cocomer,1,2) in ('02','07','24','28','60') and costat = 0);
------------------------------------------------------------------------------------------------------------------
--CONTI
select *from gxbdbps.tafitra where parene='021';
DELETE from gxbdbps.tafitra where parene='021';

insert into gxbdbps.tafitra (PARENE, PARBIN, PARAFINI, COCOMER, TRAEST, TRAFCHALT,TRAUSRALT, TRAFCHMOD, TRAUSRMOD)
( select '021','627431','508', cocomer,'A', '20210506','U99HERNAN','20210506',''
from gxbdbps.comaeaf where substr(cocomer,1,2) in ('02','07','24','28','60') and costat = 0);
------------------------------------------------------------------------------------------------------------------
--RIO RETAIL
SELECT * FROM GXBDBPS.TAFITRA T WHERE PARENE='041';

INSERT INTO GXBDBPS.TAFITRA(PARENE, PARBIN, PARAFINI, COCOMER, TRAEST, TRAFCHALT, TRAUSRALT, TRAFCHMOD,TRAUSRMOD)
VALUES('041', '627431', '001', '8606996', 'A', '20231215','U99ADOLFO', '20231215','          ');
--ver saldo.
select mcdisco saldo,mcnumta tarjeta from gxbdbps.tmctaaf where mcnumta='6274311550006321';
SELECT * FROM GXBDBPS.TMCTAAF where mcnumta='6274311550006321';
-----
select *from gxbdbps.tafitra where parene='155';
INSERT INTO GXBDBPS.TAFITRA (PARENE, PARBIN, PARAFINI, COCOMER, TRAEST, TRAFCHALT, TRAUSRALT, TRAFCHMOD, TRAUSRMOD)
VALUES ('155', '627431', '001', '0705869', 'A', '20200124', 'U99ADOLFO', '20200619', '          ');
-----
--RUBROS
SELECT * FROM GXBDBPS.CORUBAF C2 where RUCODI in ('02','07','24','28','60');
SELECT * FROM GXBDBPS.COMAEAF C2 WHERE CORUCN='80016096-7'--RUC RETAIL