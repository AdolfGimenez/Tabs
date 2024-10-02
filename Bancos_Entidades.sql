-----------VARIOS----------------------------
SELECT * FROM LIBDEBITO.DRCONBEP -- MAESTRO DE TRANSACCIONES
SELECT * FROM GXBDBPS.GENTIAF -- TABLA DE ENTIDADES
SELECT * FROM LIBDEBITO.TBCTRA0P -- TABLA DE COD. TRX
SELECT * FROM LIBDEBITO.TBCRET0P --TABLA DE COD DE RETORNO
select * from libdebito.binprodu ---Tabla de bines
select * FROM visa.VISCTLDTA -- TARJETAS VISA
select * from GXBDBPS.TAFINAF  where ENEMISO = '121'= 'conti'--
select * from libdebito.TBINPROC --BINES DE PROCARD
SELECT * FROM LIBDEBITO.TBBINE0P --BINES DE BEPSA
SELECT * FROM LIBDEBITO.TC33  --BINES
select * from gxbdbps.gentiaf where ENEMISO='146'--BANCOS--

SELECT * FROM   GXBDBPS.COMAEXD---TASA POR COMERCIO Y TIPO DE TARJETA

/*Bancos*/
Select * from contabilid.tatgene where TGENTI = '121 ' tgalfa = 'BA';
Select * from gxopera.clparf where PARCODBCO = ''

select * from gxbdbps.comaeaf where COCOMER in ('2300725','0201059')
and ADNUMCTA = '10082480006'
-- CODENO like '%LA FORTUNA%'
--actual
update gxbdbps.comaeaf set ADNUMCTA ='0626103507' where COCOMER ='0703051'
and ADNUMCTA = '10082480006'
--reing
SELECT * FROM  GXFINDTA.TCMSUC where SUCDENCOM like '%LA FORTUNA%'
  
Select * from gxtrjdta.tdgbin --Bines
Select * from gxtrjdta.tdgbin where BINNROBIN = '627431'
Select * from gxtrjdta.tdgent --Entidades
TBBINE0P Tabla de bines de POS
TBBINE0PA Tabla de bines de ATM
TDBIN Tabla de bines debito
tdgbin Tabla bines reingenieria

select * from GXOPERA.OPENTID1 where REENTI='146'--Entidades
select * from GXOPERA.opentid  --Entidades
select * from  GXBDBPS.GENTIAF  --Entidades
select * from  GXWEB.GENTIAF  --Entidades
select * FROM GXBDBPS.COMAEAF -- comercios
--where COCOMER = '0200878'
where CODENO like '%FOGONERA%'
--lenemis
Select * from gxopera.opentid1
--where ENTBINA like '%JUDIC%' 
where REENTI = '0146'
order by REENTI asc

select * from gxbdbps.gentiaf 
--where ENNOMBR like '%JUDIC%'
where ENEMISO='512'
order by ENEMISO asc

"0010"	"WALLY"
"0009"	"ZIMPLE"
"0005"	"TIGO"
"0007"	"PERSONAL"
"0008"	"CLARO"
