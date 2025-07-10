--Objeto . . . . . . . :   RPDLT01 -- Borra archivos temporales creados durante el cierre.
--Objeto . . . . . . . :   GCOBRAF -- Archivo de cobros de tarjetas
--*GXBDBPS
select * from gxbdbps.gempraf;
select * from libdebito.empresa0p;
select * from libdebito.TBBINE0P where qebi10='6274';
select * from gxbdbps.tpcie where pcfch='20181002';
select * from gxbdbps.TSPCie where pcfch='20181115' and subest='N'; --and proccod='CIEMAIN'
select * from gxbdbps.tcieraf where enemiso='002' and affecie='20190218'; --afafini='001' and affecie between '20190614' and '',
select * from gxbdbps.tmensaf where enemiso='319' and affecie='20190617';
select * from gxbdbps.guseraf where usidusr='U99OVELAR';
select * from gxbdbps.tlogsaf where  lsfecha='20181003';
select * from gxbdbps.gcontrp;

select lssecue,lstipro,lsidpro,lsfecha,lshora,a.ercodig,b.ernivel,b.erdescr,lsprog,lsdescr from gxbdbps.tlogsaf a
inner join gxbdbps.tmerraf b on a.ercodig=b.ercodig
 where lsfecha='20170504' and b.ernivel>=1;

--*FLARALIB
select micodsc,micods2,miemiso,minumco from flaralib.tmcieaf order by miemiso,micods2;
select * from flaralib.gempraf;
select * from flaralib.tpcie where pcfch='20200221';
select * from flaralib.TSPCie where pcfch='20200320' and subest='N'; --and proccod='CIEMAIN'
select * from FLARALIB.tcieraf where affecie='20170719';
select * from flaralib.tlogsaf where lsfecha='20191209' and lstipro='CIER';
select * from FLARALIB.gentiaf;
select * from FLARALIB.tmerraf;
select * from flaralib.tcieraf where enemiso='021' and affecie>'20200101' AND BIBINES='627431' and afafini='001'; --enemiso='021' and afafini='001' and affecie>='20190614'  and affecie>='20190614'
select * from flaralib.gcontrp;
select * from flaralib.tcieraf where  enemiso='002' and affecie>='20200101';
select * from flaralib.tmensaf where affecie>'20200101' and enemiso='021';
select * from flaralib.tmtaraf where ENEMISO='021';
select * from flaralib.TProc;
delete from flaralib.TProc where procniv='1' and procsubniv='1' and procsec=1;
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

select * from gxbdbps.garc1af;


select * from gxbdbps.gsaldaf where enemiso='307' and afafini='007';
select * from gxbdbps.gentiaf where enemiso='116';
select * from gxbdbps.tbineaf where enemiso='116';
select enemiso,bibines,afafini,afdescr,afstats from gxbdbps.tafinaf where afstats='1'; --enemiso not in (002,117,118,119,120,151,153,155,156,157,307,309,311,312,317,319,321,324,325,326,327,328,329,330,331,332,347,348,606)
--update flaralib.tafinaf set afstats='3' where enemiso not in (002,117,118,119,120,151,153,155,156,157,307,309,311,312,317,319,321,324,325,326,327,328,329,330,331,332,347,348,606)
--update gxbdbps.tafinaf set afstats='3' where enemiso='116' --and afafini='008'
select * from gxbdbps.tmoviaf where mvemiso='002' and mtnumta='6274310020096300';

select * from gxbdbps.PRMERR;
ALTER TABLE gxbdbps.PRMERR ALTER COLUMN ErrorDsc SET DATA TYPE CHAR(100);

Select a.usucod, usunom, a.siscodi, sisnom, a.funcod, funnom, fundes
from gxbdcon.gxloperdet a inner join gxbdcon.gxlousu b on a.usucod = b.usucod
inner join gxbdcon.gxlosis c on a.siscodi =c.siscodi
inner join gxbdcon.gxlofun d on a.funcod = d.funcod
where a.usucod = '343' and a.siscodi in ('TC','BI');


select * from flaralib.tmtaraf where enemiso='021';
select * from flaralib.tmctaaf where mcnumct=20112100001;

select * from dcash.girfun;
select * from dcash.gxlorol;
select a.rolcod "Codigo de Rol",a.girfcod "Cod Funcionalidad",girfnom "Nombre de Objeto", girfdes "Descripci�n de Funcionalidad"  from dcash.roldet a
inner join dcash.girfun b on a.girfcod=b.girfcod
where rolcod=1;

Select a.usucod, usunom, a.siscodi, sisnom, a.funcod, funnom, fundes from gxweb.gxloperdet a
inner join gxweb.gxlousu b on a.usucod = b.usucod
inner join gxweb.gxlosis c on a.siscodi =c.siscodi
inner join gxweb.gxlofun d on a.funcod = d.funcod
where a.usucod = '284' and a.siscodi in ('PC','PW','PE');

select * from flaralib.gentiaf;
select * from gxbdbps.gtranaf;

select b.usidusr "Cod Usuario",b.usnombr "Nombre Usuario",a.Trcodig "Codigo de Funcionalidad",a.trdescr "Descripcion" from gxbdbps.gtranaf a
inner join gxbdbps.gustraf c on a.trcodig=c.trcodig
inner join gxbdbps.guseraf b on b.usidusr=c.usidusr
where b.usidusr='U99FLARA';


select * from gxbdbps.TMVENPF;
select * from flaralib.thextraf where heemiso='021'; --and henumcie=201903;
select * from flaralib.gdireaf where enemiso='021' and cenumdo='4436424';

select A.affecie, A.affevto, B.melinea from flaralib.tcieraf A
inner join flaralib.tmensaf B on B.affecie = A.affecie
where A.enemiso = '021' and A.bibines = '627431' and A.afafini = '501' and A.affecie like '202003%';

 select * from gxbdbps.GTRANAF;
select * from flaralib.tcconaf;

select * from GXBDB.tmctaaf where mcnumct=20110500010;
select * from flaralib.thmovaf where hmnumct=20110500010 and hmcierr='202006';

--UPDATE GXBDBPS.TMCTAAF   SET MCNUMCA = 0 WHERE MCNUMCT = 20110500010;

select * from gxopera.oprecle where refech='20200814';
--update gxopera.oprecle set reuser='QCOMUNICA' where refech='20200814';
SELECT * FROM GXOPERA.OPMOVI WHERE OPFECOM='20200814';
--UPDATE GXOPERA.OPMOVI SET OPUSER='QCOMUNICA' WHERE OPFECOM='20200814';
SELECT * FROM GXOPERA.FLICOM WHERE LIFECHD='20200814';
--UPDATE GXOPERA.FLICOM SET LIUSER='QCOMUNICA' WHERE LIFECHD='20200814';

/*CASO XXX END MOV*/
SELECT * FROM GXBDBPS.TMCTAAF T WHERE MCNUMTA LIKE '%XXXXXX%';
SELECT * FROM GXBDBPS.TMTARAF WHERE MTNUMTA ='5452892202012623';
SELECT * FROM GXBDBPS.TMCTAAF T WHERE MCNUMCT='31400247';
----
SELECT t.MCNUMCT, f.MTNUMTA FROM GXBDBPS.TMCTAAF t LEFT JOIN GXBDBPS.TMTARAF f ON f.MCNUMCT = t.MCNUMCT
AND SUBSTRING(t.MCNUMTA,1,6)= SUBSTRING(MTNUMTA,1,6) AND SUBSTRING(t.MCNUMTA,13,4)= SUBSTRING(MTNUMTA,13,4)
WHERE t.MCNUMTA LIKE '%XXXXXX%';
--para ver si hay cuenta ducplicada
SELECT COUNT(DISTINCT(MCNUMCT)) FROM GXBDBPS.TMCTAAF t WHERE t.MCNUMTA LIKE '%XXXXXX%'; --493.923
--update
UPDATE GXBDBPS.TMCTAAF SET MCNUMTA = '5303990003000135' WHERE MCNUMCT = 31400656;
----------------------------

----correo
SELECT * FROM GXBDCON.GXLOUSU WHERE USUCOD = 9999 AND USUTIP = 2;
SELECT * FROM GXBDBPS.TCTPARD WHERE CPARGRUP  = 'EMAILEXTRACTOS';