**************************************************************************************************************************************
/*Monitoreo de Incomming*/
**************************************************************************************************************************************
select * from gxbdbps.ait001 WHERE aiid='2020202001'
UPDATE gxbdbps.ait001 SET AIEST='PEN', AICNTTCPEN = 1, AICNTTCERR=0, AICNTTCPRO=284
WHERE aiid='2019105002'
select * from gxbdbps.ait002
update gxbdbps.ait002 set AITCEST='PEN' 



select * from gxbdbps.ait001 where aiid='2020092002'
select * from  gxbdbps.ait015
select * from gxbdbps.ait003 where aiid='2020092002'
select * from gxbdbps.ait002 where aiid='2020092002'
select * from gxbdbps.tautpaf where apbines='420806'order by 
--update gxbdbps.tautpaf set apstats = 'P' ;
select * from gxbdbps.movisa

/*----si hubo problemas en el incoming----*/
select * from gxbdbps.tmoviaf where mtnumta in ('4208060100000104','4208060100000112')
select * from gxbdbps.tmtaraf where mtnumta in ('4208060100000104','4208060100000112')
--delete from gxbdbps.tmoviaf where mtnumta in ('4208060100000104')

--este update en caso que no finalice bien el inccomming paso 1 y/o 2
select * from gxbdbps.nut028
update gxbdbps.nut028 set parval = 'N' where parid = 'IN_PASO1'
update gxbdbps.nut028 set parval = 'N' where parid = 'IN_PASO2'

/*delete gxbdbps.ait015;
delete gxbdbps.ait003;
delete gxbdbps.ait002;
delete gxbdbps.ait001;*/

select * from gxbdbps.tmtaraf  
where enemiso='021'            
select * from gxbdbps.tmctaaf                        
where mcnumct='2020092001'
select * from gxbdbps/tmctaaf                        
where mcnumct='2020092001'                          

**************************************************************************************************************************************
**************************************************************************************************************************************

INSERT INTO GXBDBPS.GMONEAF(MOCODIG,MODESCR,MOSIMBO,MOPAIS,MOCODPA,MOGENTI,MOFEING,MOFEMOD,MOIDUSR)VALUES('999','Todos - RED                   ','   ','RED - TODOS                   ','  ','                    ','20181107','00000000','U99MIRIAN ');
INSERT INTO GXBDBPS.TDCANALES(TDCANALID,TDCANALDESC,TDLIDTRA) VALUES('99','RED - CANAL DE RED                                                              ','99');
INSERT INTO LIBDEBITO.TBCTRA0P(TXCTRX,TXDTRX,TXPROG,TXDTAQ,TXHPOS,TXHATM,TXHINT,TXWARM,TXDBCR,TXSTAT,TXTCDB,TXTCCR,TXCODB,TXCOCR,TRXCLE,TPCOPN) VALUES ('999999','RED - VALIDACIÓN TRANSACCIONES','          ','          ',' ',' ',' ',' ',' ',' ',' ',' ',0,0,' ','    ');

select * from LIBDEBITO.TBCTRA0P

select * from roshkalib.M_MED00001 where usuario_id = 380

select * from gxopera.comples
select * from gxopera.complesdetalle
select * from gxbdbps.comaeaf where codeno like '%COMERCIO%'
select * from contabilid.ficlien where clcocl='58'clcodo='PR' and clnomb like '%COMERCIO%'


select * from gxbdbps.thctaaf 
where hcnumct=20112100001 and hcaamm in ('201903','201904')
select * from gxbdbps.tmtaraf where mcnumct=2030151274

select * from libdebito.COPAGO0P
select * from gxbdbps.tlogsaf where lsfecha='20200401' and lstipro='CLEA'
select * from gxopera.opago1p
select * from gxopera.opago2p
select * from gxopera.opago3p

select * from gxbdbps.COMA2OP

select * from mastercard.masctldta where mcrol='ISS' and mcrrnbepsa='and mc002 like '%2306710001000034%'
