---CONSULTA DE SALDO EN TARJETAS GOURMET
select mcdisco saldo,mcnumta tarjeta from gxbdbps.tmctaaf where mcnumta='6274311550003328'

--tabla de codigo respuestas de bepsa por marca
select * from libdebito.tbcret0p

--tabla de maestro de transacciones
select * from libdebito.tbctra0p where TXDTRX like '%CONSULTA%'

Select * from gxopera.opmovi where opnoref = '472622298'

select * FROM LIBDEBITO.DRCONBEP where LERRNB = '6274311550000654' and lfectr = '20220310'

1400666

select * from gxtrjdta.tcadec where decnrotrj = '6274311550003328'
select * from gxbdbps.tmoviaf
select * from GXBDBPS.TDCLIENTE where tdclinrodoc = '1448565'
select * from gxbdbps.gclieaf WHERE CENUMDO='2307784'
select * from gxbdbps.comaeaf where corucn= ''
select * from libdebito.tgembhaf WHERE crtarj= '6274311550003328' CRNOMB LIKE '%%' AND CRENTI='020';
SELECT * FROM LIBDEBITO.TGEMBHAF WHERE CRDOCU='1448565' AND CRENTI='021';
SELECT * FROM GXBDBPS.TMTARAF WHERE CENUMDO='1448565'
SELECT * FROM GXBDBPS.TMCTAAF WHERE MCNUMDO='6274311550003328';
SELECT * FROM GXBDBPS.DRMAEAF WHERE AKAENB = '2307784'
--UPDATE GXBDBPS.DRMAEAF SET AKAENB = '5729555' WHERE AKAENB = '572955';
SELECT * FROM LIBDEBITO.EMBNOVHST WHERE CRDOCU='1448565'
select * from libdebito.bdcard0p where tecard='2307784'
SELECT * FROM GXBDBPS.TEMBSAF where BSNUMTA=''
