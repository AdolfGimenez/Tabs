--*GXBDBPS
select * from gxbdbps.gempraf
select * from libdebito.empresa0p
select * from libdebito.TBBINE0P where qebi10='6274'
select * from gxbdbps.tpcie where pcfch='20181002'
select * from gxbdbps.TSPCie where pcfch='20181115' and subest='N' --and proccod='CIEMAIN'
select * from gxbdbps.tcieraf where enemiso='002' and affecie='20190218' afafini='001' and affecie between '20190614' and ''
select * from gxbdbps.tmensaf where enemiso='319' and affecie='20190617'
select * from gxbdbps.guseraf where usidusr='U99OVELAR'
select * from gxbdbps.tlogsaf where  lsfecha='20181003'
select * from gxbdbps.gcontrp

select 
select lssecue,lstipro,lsidpro,lsfecha,lshora,a.ercodig,b.ernivel,b.erdescr,lsprog,lsdescr from gxbdbps.tlogsaf a
inner join gxbdbps.tmerraf b on a.ercodig=b.ercodig
 where lsfecha='20170504' and b.ernivel>=1
 
--*FLARALIB
select micodsc,micods2,miemiso,minumco from flaralib.tmcieaf order by miemiso,micods2
select * from flaralib.gempraf
select * from flaralib.tpcie where pcfch='20200221'
select * from flaralib.TSPCie where pcfch='20200320' and subest='N' --and proccod='CIEMAIN'
select * from FLARALIB.tcieraf where affecie='20170719'
select * from flaralib.tlogsaf where lsfecha='20191209' and lstipro='CIER'
select * from FLARALIB.gentiaf
select * from FLARALIB.tmerraf
select * from flaralib.tcieraf where enemiso='021' and affecie>'20200101' AND BIBINES='627431' and afafini='001' --enemiso='021' and afafini='001' and affecie>='20190614'  and affecie>='20190614'
select * from flaralib.gcontrp
select * from flaralib.tcieraf where  enemiso='002' and affecie>='20200101' and
select * from flaralib.tmensaf where affecie>'20200101' and enemiso='021'
select * from flaralib.tmtaraf where ENEMISO='021' mtnopla like '%LAURA%'
select * from flaralib.TProc
delete from flaralib.TProc where procniv='1' and procsubniv='1' and procsec=1
INSERT INTO flaralib.TPROC
(
  PROCCOD,
  PROCDSC,
  PROCNIV,
  PROCSUBNIV,
  PROCSEC
)
VALUES
(
  'BLQ',
  'Proceso Bloqueo de Bines',
  1,
  '1',
  1
);

select * from gxbdbps.garc1af


select * from gxbdbps.gsaldaf where enemiso='307' and afafini='007'
select * from gxbdbps.gentiaf where enemiso='116'
select * from gxbdbps.tbineaf where enemiso='116'
select enemiso,bibines,afafini,afdescr,afstats from gxbdbps.tafinaf where afstats='1' --enemiso not in (002,117,118,119,120,151,153,155,156,157,307,309,311,312,317,319,321,324,325,326,327,328,329,330,331,332,347,348,606)
--update flaralib.tafinaf set afstats='3' where enemiso not in (002,117,118,119,120,151,153,155,156,157,307,309,311,312,317,319,321,324,325,326,327,328,329,330,331,332,347,348,606)
--update gxbdbps.tafinaf set afstats='3' where enemiso='116' --and afafini='008'
select * from gxbdbps.tmoviaf where mvemiso='002' and mtnumta='6274310020096300'

select * from gxbdbps.PRMERR
ALTER TABLE gxbdbps.PRMERR ALTER COLUMN ErrorDsc SET DATA TYPE CHAR(100)



Select a.usucod, usunom, a.siscodi, sisnom, a.funcod, funnom, fundes
from gxbdcon.gxloperdet a inner join gxbdcon.gxlousu b on a.usucod = b.usucod
inner join gxbdcon.gxlosis c on a.siscodi =c.siscodi 
inner join gxbdcon.gxlofun d on a.funcod = d.funcod
where a.usucod = '343' and a.siscodi in ('TC','BI')


select * from flaralib.tmtaraf where enemiso='021'
select * from flaralib.tmctaaf where mcnumct=20112100001


select * from dcash.girfun
select * from dcash.gxlorol
select a.rolcod "Codigo de Rol",a.girfcod "Cod Funcionalidad",girfnom "Nombre de Objeto", girfdes "Descripción de Funcionalidad"  from dcash.roldet a
inner join dcash.girfun b on a.girfcod=b.girfcod
where rolcod=1

Select a.usucod, usunom, a.siscodi, sisnom, a.funcod, funnom, fundes from gxweb.gxloperdet a 
inner join gxweb.gxlousu b on a.usucod = b.usucod
inner join gxweb.gxlosis c on a.siscodi =c.siscodi 
inner join gxweb.gxlofun d on a.funcod = d.funcod
where a.usucod = '284' and a.siscodi in ('PC','PW','PE')

select * from flaralib.gentiaf
select * from gxbdbps.gtranaf

select b.usidusr "Cod Usuario",b.usnombr "Nombre Usuario",a.Trcodig "Codigo de Funcionalidad",a.trdescr "Descripcion" from gxbdbps.gtranaf a
inner join gxbdbps.gustraf c on a.trcodig=c.trcodig
inner join gxbdbps.guseraf b on b.usidusr=c.usidusr
where b.usidusr='U99FLARA'


select * from gxbdbps.TMVENPF
select * from flaralib.thextraf where heemiso='021' and henumcie=201903
select * from flaralib.gdireaf where enemiso='021' and cenumdo='4436424'

[?18/?03/?2020 16:31]  Ricardo Arce:  
select A.affecie, A.affevto, B.melinea from flaralib.tcieraf A 
inner join flaralib.tmensaf B on B.affecie = A.affecie 
where A.enemiso = '021' and A.bibines = '627431' and A.afafini = '501' and A.affecie like '202003%' 
 
 select * from gxbdbps.GTRANAF
 
select * from flaralib.tcconaf


select * from GXBDB.tmctaaf where mcnumct=20110500010
select * from flaralib.thmovaf where hmnumct=20110500010 and hmcierr='202006'

UPDATE GXBDBPS.TMCTAAF   SET MCNUMCA = 0 WHERE MCNUMCT = 20110500010;


select * from gxopera.oprecle where refech='20200814'
update gxopera.oprecle set reuser='QCOMUNICA' where refech='20200814'
SELECT * FROM GXOPERA.OPMOVI WHERE OPFECOM='20200814'
UPDATE GXOPERA.OPMOVI SET OPUSER='QCOMUNICA' WHERE OPFECOM='20200814'
SELECT * FROM GXOPERA.FLICOM WHERE LIFECHD='20200814'
UPDATE GXOPERA.FLICOM SET LIUSER='QCOMUNICA' WHERE LIFECHD='20200814'



select * from gxbdcon.gxlousu where usuaid = 'USRCONTI'
select * from gxbdcon.gxlousu where usucod in ('391','1040');
select * from gxbdbps.gxrelgru where usuaid in ('','USRCONTI');
select * from gxbdcon.gxloper where usucod in ('391','1040');
select * from gxbdcon.gxloperdet where usucod in ('391','1040') and siscodi = 'TC';

U99MIRIAN 	TEC	U99MIRIAN 	20200715	          	00000000

select * from gxbdcon.gxlofun where siscodi='TC' order by funcod


select * from gxbdcon.gxlousu ORDER BY USUCOD


INSERT INTO GXBDBPS.GXRELGRU
(
  USUAID,
  GECODIG,
  RUEUSUI,
  RUEFCHI,
  RUEUSUM,
  RUEFCHM
)
VALUES
(
  'USRCONTI',
  'CON',
  'U99HERNAN',
  '20200925',
  '          ',
  '00000000'
);


