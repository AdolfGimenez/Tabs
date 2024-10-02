--------------------------------------------------------------------------------------------------------------------------------------
--Por este medio solicito la anulación del complementario por error involuntario ya que se acredito a la cuenta de tigo money y tendria que haber sido acreditada a la de personal. #14994
DELETE FROM GXOPERA.OPAGO3P WHERE BNFCODMV = 459 AND BNFIDTRN = '210414126931';
SELECT * FROM GXOPERA.OPAGO3P;
DELETE FROM GXOPERA.OPRECLE WHERE REFECH = '20210414' AND REENTI = '002' AND REMOVI = 'XDA' AND RECOMER = '9002395' AND RETARTIP = 'DEB' AND REENEMI = 'xxx';

DELETE FROM GXOPERA.COMPLES WHERE COCOMER = '9002395' AND COMPLEFECOM = '20210414';
SELECT * FROM GXOPERA.COMPLESDETALLE WHERE COCOMER='0701728' AND COMPLEAUT='741019'
SELECT * FROM GXOPERA.OPAGO1P O1P;
SELECT * FROM GXOPERA.FLICOM F WHERE F.LIFECHD='20240223' AND F.LIUSER='U99MNNORMA';
DELETE FROM GXOPERA.COMPLESDETALLE WHERE COCOMER = '9002395' AND COMPLEFECOM = '20210414' AND COMPLEFEREA = '20210414' AND COMPLETARJ = '6274xxxxxx2910  ' AND COMPLEAUT = '738564';
--------------------------------------------------------------------------------------------------------------------------------------
--Por este medio solicito la anulación del complementario por error involuntario ya que tipeo mal un numero de tarjeta #15186
DELETE FROM GXOPERA.OPAGO3P WHERE BNFCODMV = 959 AND BNFIDTRN = '210415129287';

DELETE FROM GXOPERA.OPRECLE WHERE REFECH = '20210415' AND REENTI = '018' AND REMOVI = 'XDA' AND RECOMER = '9099295' AND RETARTIP = 'DEB' AND REENEMI = 'xxx';

DELETE FROM GXOPERA.COMPLES WHERE COCOMER = '9099295' AND COMPLEFECOM = '20210415';

DELETE FROM GXOPERA.COMPLESDETALLE WHERE COCOMER = '9099295' AND COMPLEFECOM = '20210415' AND COMPLEFEREA = '20210504' AND COMPLETARJ = '6274xxxxxx2550  ' AND COMPLEAUT = '943300';
DELETE FROM GXOPERA.COMPLESDETALLE WHERE COCOMER = '9099295' AND COMPLEFECOM = '20210415' AND COMPLEFEREA = '20210504' AND COMPLETARJ = '6274xxxxxx2552  ' AND COMPLEAUT = '447900';
--------------------------------------------------------------------------------------------------------------------------------------
--Me podrías ayudar con la anulación de este complementario antes de las 19:00 hs ya que no corresponde que vaya a la cuenta de Bepsa o en todo caso el clearing ya toma para procesar al día siguiente. #27304
select * from gxopera.comples where cocomer='9099121' and COMPLEFECOM='20230915'; --CABEZERA | OJO TENER EN CUENTA ADM Y ENTI
delete FROM gxopera.comples where cocomer='9099121' and COMPLEFECOM='20230915';

select * from gxopera.COMPL00001 where cocomer='9099121' and COMPLEFEPRO='20231211'; --DETALLE
delete FROM gxopera.COMPL00001 where cocomer='9099121' and COMPLEFEPRO='20231211';

select * from gxopera.oprecle where removi='XDA' AND REFPROC='20231211' and recomer='9099121'; --COMIENZA ACA.
delete FROM gxopera.oprecle where removi='XDA' AND REFPROC='20231211' and recomer='9099121';

select * from  GXOPERA.OPAGO1P where pgidusr='U99MNORMA';
delete FROM GXOPERA.OPAGO1P where pgidusr='U99GARAY';
--------------------------------------------------------------------------------------------------------------------------------------
--Me podrias ayudar con la anulacion de este complementario,que debia ser acreditado en la cuenta de Bepsa #28777
select * from gxopera.comples where cocomer='9099317' and COMPLEFECOM='20211222';
delete FROM gxopera.comples where cocomer='9099317' and COMPLEFECOM='20211222';

select * from gxopera.COMPL00001 where cocomer='9099317' and COMPLEFEPRO='20220221';
delete FROM gxopera.COMPL00001  where cocomer='9099317' and COMPLEFEPRO='20220221';

select * from gxopera.oprecle where removi='XDA' AND REFPROC='20220221' and recomer='9099317';
delete FROM gxopera.oprecle where removi='XDA' AND REFPROC='20220221' and recomer='9099317';

select * from  GXOPERA.OPAGO1P where pgidusr='U99GARAY';
delete FROM GXOPERA.OPAGO1P where pgidusr='U99GARAY';
--------------------------------------------------------------------------------------------------------------------------------------
--debitar a BEPSA acreditar a COOPERATIVA 7 DE AGOSTO #27632
select * from gxopera.comples
where cocomer='9002051' and COMPLEFECOM='20200107';
delete FROM gxopera.comples where cocomer='9002051' and COMPLEFECOM='20200107';

select * from gxopera.COMPL00001
where cocomer='9002051' and COMPLEFEPRO='20220131';
delete FROM gxopera.COMPL00001 where cocomer='9002051' and COMPLEFEPRO='20220131';

select * from gxopera.oprecle
where removi='XDA' AND REFPROC='20220131' and recomer='9002051';
delete FROM gxopera.oprecle where removi='XDA' AND REFPROC='20220131' and recomer='9002051';

select * from  GXOPERA.OPAGO3p where BNFIDUSR='U99GARAY';
delete FROM GXOPERA.OPAGO3p where BNFIDUSR='U99GARAY';
--------------------------------------------------------------------------------------------------------------------------------------
--Favor anular el siguiente complementario,ya que debia acreditarse al dueño de la tarjeta #31442
select * from gxopera.comples where cocomer='9099343 ' and COMPLEFECOM='20220328';
delete FROM gxopera.comples where cocomer='9099343 ' and COMPLEFECOM='20220328';

select * from gxopera.COMPL00001 where cocomer='9099343 ' and COMPLEFEPRO='20220426';
delete FROM gxopera.COMPL00001 where cocomer='9099343 ' and COMPLEFEPRO='20220426';

select * from gxopera.oprecle
where removi='XDA' AND REFPROC='20220426' and recomer='9099343 ';
delete FROM gxopera.oprecle where removi='XDA' AND REFPROC='20220426' and recomer='9099343 ';

select * from  GXOPERA.OPAGO1P where pgidusr='U99GARAY';
delete FROM GXOPERA.OPAGO1P where pgidusr='U99GARAY';

