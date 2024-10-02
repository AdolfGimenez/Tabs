select * from YAPI.tdCta;
select * from YAPI.TdCtaAd;
select * from YAPI.TdEmis;
select * from YAPI.TdEmisNov;
select * from YAPI.TdEmNoTar;
select * from YAPI.MASTERCARD
SELECT * FROM GXBDBPS.SECPINOFF
UPDATE YAPI.MASTERCARD SET MCPANNMBR=(SUBSTR(MCPANNMBR,1,6) || '999999' ||SUBSTR(MCPANNMBR,13,4))
UPDATE YAPI.MASTERCARD SET MCPANNMBR=(SUBSTR(MCPANNMBR,1,6) || '999999' ||SUBSTR(MCPANNMBR,13,4))
SELECT * FROM YAPI.IPMIRDLOG 
UPDATE YAPI.IPMIRDLOG SET IRDLPAN=(SUBSTR(IRDLPAN,1,6) || '999999' ||SUBSTR(IRDLPAN,13,4))
UPDATE ARNALDOLIB.DRCONBEP SET LSALTR='0', LDISTR='0', LNRTAR=(SUBSTR(LNRTAR,1,6) || '999999' ||SUBSTR(LNRTAR,13,4))
UPDATE ARNALDOLIB.TDMPRSRV SET PRSRTRJ=(SUBSTR(PRSRTRJ,1,6) || '999999' ||SUBSTR(PRSRTRJ,13,4));
select * from ARNALDOLIB.TGEMBHAF 
update ARNALDOLIB.tgembhaf set CRTARJ=(SUBSTR(CRTARJ,1,6) || '999999' ||SUBSTR(CRTARJ,13,4));
select * from ARNALDOLIB.TDGPER
SELECT * FROM ARNALDOLIB.TMO1MAF 
UPDATE YAPI.TMO1MAF SET MDNUMTA=(SUBSTR(MDNUMTA,1,6) || '999999' ||SUBSTR(MDNUMTA,13,4));
SELECT * FROM YAPI.TTCTRJ;
UPDATE YAPI.TTCTRJ SET TRJNROTRJ=(SUBSTR(TRJNROTRJ,1,6) || '999999' ||SUBSTR(TRJNROTRJ,13,4));
SELECT * FROM YAPI.TTDEMI
UPDATE YAPI.TTDEMI SET EMINROTRJD=(SUBSTR(EMINROTRJD,1,6) || '999999' ||SUBSTR(EMINROTRJD,13,4));
--------------------------------------------------ENMASCARAR TARJETAS--------------------------------------------------------
SELECT * FROM YAPI.tdmov
--update YAPI.TDMOV set MOVNROTARJ=(SUBSTR(MOVNROTARJ,1,6) || '999999' ||SUBSTR(MOVNROTARJ,13,4));
--update YAPI.TCLMOV set MOVNTAR=(SUBSTR(MOVNTAR,1,6) || '999999' ||SUBSTR(MOVNTAR,13,4));
--update gxbdbps.gclieaf set CENOMB1='NOMBRE1',  CENOMB2='NOMBRE2', CEAPEL1='APELLIDO1', CEAPEL2='APELLIDO2'
--update gxbdbps.ait002  set AITCTRJNRO=(SUBSTR(AITCTRJNRO,1,6) || 'XXXXXX' ||SUBSTR(AITCTRJNRO,13,4));
--update YAPI.vistrndta set VIPANNMBR=(SUBSTR(VIPANNMBR,1,6) || 'XXXXXX' ||SUBSTR(VIPANNMBR,13,4));
--update ANDREALIB.visctldta set V002=(SUBSTR(V002,1,6) || 'XXXXXX' ||SUBSTR(V002,13,4));
--update PERALTALIB.tmctaaf set MCNUMTA=(SUBSTR(MCNUMTA,1,6) || '999999' ||SUBSTR(MCNUMTA,13,4));
--update YAPI.tgembhaf set CRTARJ=(SUBSTR(CRTARJ,1,6) || '999999' ||SUBSTR(CRTARJ,13,4));
--UPDATE YAPI.EMBNOVHST SET CRTARJ=(SUBSTR(CRTARJ,1,6) || '999999' ||SUBSTR(CRTARJ,13,4));
--update YAPI.tdcta set tdctatar=(SUBSTR(tdctatar,1,6) || '999999' ||SUBSTR(tdctatar,13,4));
--UPDATE YAPI.TDEMNOTAR SET NENROTARJ=SUBSTR(NENROTARJ,1,6) || '999999' ||SUBSTR(NENROTARJ,13,4), NROTARJCTA=SUBSTR(NROTARJCTA,1,6) || '999999' ||SUBSTR(NROTARJCTA,13,4),  NROTARJCTA='CUENTA PRIMARIA'
--update PERALTALIB.tautpaf set mtnumta=(SUBSTR(mtnumta,1,6) || '999999' ||SUBSTR(mtnumta,13,4));
--update PERALTALIB.tmtaraf set MTNUMTA=(SUBSTR(MTNUMTA,1,6) || '999999' ||SUBSTR(MTNUMTA,13,4));
select * from ARNALDOLIB.tmtaraf
SELECT * FROM YAPI.TMOVIAF   
--update yapi.TMCTAAF set mcnumta=(SUBSTR(mcnumta,1,6) || '999999' ||SUBSTR(mcnumta,13,4));
UPDATE YAPI.MCT464FRDR set T464FRPAN=(SUBSTR(T464FRPAN,1,6) || '999999' ||SUBSTR(T464FRPAN,13,4));
UPDATE YAPI.MCT464EREC set T464ERPAN=(SUBSTR(T464ERPAN,1,6) || '999999' ||SUBSTR(T464ERPAN,13,4));
UPDATE AGAONALIB.DRCONBEP set lnrtar=(SUBSTR(LNRTAR,1,6) || '999999' ||SUBSTR(LNRTAR,13,4)), lsaltr='0', ldistr='0';
SELECT * FROM YAPI.DRCON180
UPDATE YAPI.DRCON180 set alnrtar=(SUBSTR(ALNRTAR,1,6) || '999999' ||SUBSTR(ALNRTAR,13,4)), alsaltr='0', aldistr='0';
update YAPI.vistrndta set VIPANNMBR=(SUBSTR(VIPANNMBR,1,6) || '999999' ||SUBSTR(VIPANNMBR,13,4));
SELECT * FROM PERALTALIB.DRCONBEP
UPDATE AGAONALIB.DRCONBEP set lnrtar=(SUBSTR(LNRTAR,1,6) || '999999' ||SUBSTR(LNRTAR,13,4)), lsaltr='0', ldistr='0';
update YAPI.visctldta set V002=(SUBSTR(V002,1,6) || '999999' ||SUBSTR(V002,13,4));
update ANDREALIB.MASCTLDTA set MC002=(SUBSTR(MC002,1,6) || 'XXXXXX' ||SUBSTR(MC002,13,4));
update YAPI.MASTRNDTA set MCPANNMBR=(SUBSTR(MCPANNMBR,1,6) || '999999' ||SUBSTR(MCPANNMBR,13,4));
update agaonalib.tswaut set AUTPANNRO=(SUBSTR(AUTPANNRO,1,6) || '999999' ||SUBSTR(AUTPANNRO,13,4));
select * from DOLORESLIB.tswaut
update YAPI.OPMOVIIC set OPTARJ=(SUBSTR(OPTARJ,1,6) || '999999' ||SUBSTR(OPTARJ,13,4));
SELECT * FROM YAPI.tren8583MC 
update YAPI.tren8583MC set MC002=(SUBSTR(MC002,1,6) || '999999' ||SUBSTR(MC002,13,4));
UPDATE YAPI.TDEMNOTAR SET NENROTARJ=(SUBSTR(NENROTARJ,1,6) || '999999' ||SUBSTR(NENROTARJ,13,4)), NROTARJCTA='CUENTA PRIMARIA';
SELECT * FROM YAPI.TDEMNOTAR
UPDATE YAPI.TENTARES SET ENTARNRO=(SUBSTR(ENTARNRO,1,6) || '999999' ||SUBSTR(ENTARNRO,13,4));

select * from yapi.TCUOTAF  
update ANDREALIB.thmovaf set hmnumta=(SUBSTR(hmnumta,1,6) || '999999' ||SUBSTR(hmnumta,13,4));
update YAPI.tmoviaf set mtnumta=(SUBSTR(mtnumta,1,6) || '999999' ||SUBSTR(mtnumta,13,4));
select * from RROJASLIB.TMO1MAF
update RROJASLIB.TMO1MAF set mdnumta=(SUBSTR(mdnumta,1,6) || '999999' ||SUBSTR(mdnumta,13,4));

SELECT * FROM ANDREALIB.TCUOTAF
update YAPI.TCUOTAF set MTNUMTA=(SUBSTR(MTNUMTA,1,6) || '999999' ||SUBSTR(MTNUMTA,13,4));
UPDATE LIBPOZZOE.ATMCSTSDTZ SET ATMCSTSDTA=(SUBSTR(ATMCSTSDTA,1,6) || '999999' ||SUBSTR(ATMCSTSDTA,13,4));
------------------------------------------------------------------------------------------------------------------------------
select --count (*)
* from libdebito.drconbep
where lfectr between '20190705' and '20190705'
and lcretr='19'
--and SUBSTR(LNRTAR,1,6) IN ('484144')
order by lhortr desc


select lfectr fecha, count(*) cantidad
 from libdebito.drconbep 
 where lfectr > '20190420' and lcretr = '05' and substr(lidtra,1,1) = 'T'
 group by lfectr   	

--verificar trx tigo money--
select * from libdebito.drconbep
where lfectr between '20181107' and '20181107' and lnrtar like '627431117%' order by lhortr desc 	

--verificar trx por comercio--
select * from libdebito.drconbep
--lfectr, lhortr, lnrtar, lidcom, lcomtr, limpgs, lcretr, lesttr 
where lfectr between '20190520' and '20190520' and lidcom='2400080' order by lfectr, lhortr asc; 

SELECT * FROM LIBDEBITO.TBBINE0P

and limpgs = '140000'  and substr(lidtra,1,1) = 'T' and lhortr between '073000' and '080000'

select * from roshkalib.m_usuarios
where numero_celular = '0981131090'

select * from libdebito.drconbep
where lfectr between '20190610' and '20190610' and lidcom='1001217' order by lhortr desc 

-------------------------------------------------------------------------------------------------------------------
select lfectr, lhortr, lnrtar, lidcom, lcomtr, limpgs, lcretr, lesttr
from libdebito.drconbep 
where lfectr between '20190430' and '20190430' and lnrtar like '627431581%' order by lhortr desc --tigo money sin tarjeta
------------------------------------------------------------------------------------------------------------------- 
-------------------------------------------------------------------------------------------------------------------
select lfectr, lhortr, lnrtar, lidcom, lcomtr, limpgs, lcretr, lesttr
from libdebito.drconbep 
where lfectr between '20190430' and '20190430' and lnrtar like '627431152%' order by lhortr desc --tigo money con tarjeta
------------------------------------------------------------------------------------------------------------------- 
-------------------------------------------------------------------------------------------------------------------
select lfectr, lhortr, lnrtar, lbinpr, lidcom, lcomtr, limpgs, lcretr, lesttr, lerrnb
from libdebito.drconbep 
where lfectr between '20190530' and '20190530' and lnrtar like '703002%' order by lhortr desc --CONTI-DINELCO

------------------------------------------------------------------------------------------------------------------- 
select lfectr, lhortr, lnrtar, lexpir, lcodbc, lidcom, lcomtr, limpgs, lcretr, lesttr  ---RECHAZOS PROCARD
from libdebito.drconbep 
where lfectr='20190530' and lenemi='510' AND lcretr='XD' and LIMPGS <> '0.00' 
--and SUBSTR(LNRTAR,1,6) IN ('426350')
--and lcretr in ('12','63','XD') and lenemi='510' and LIMPGS <> '0.00' 
order by lhortr desc 
------------------------------------------------------------------------------------------------------------------- 
select lfectr, lhortr, lnrtar, lidcom, lcomtr, limpgs, lcretr, lesttr, substr(leca62,1,2)
from libdebito.drconbep 
where lfectr='20181129'
and substr(leca62,1,2)='SP'
order by lhortr desc
-------------------------------------------------------------------------------------------------------------------
select lfectr, lhortr, lnrtar, lidcom, lcomtr, limpgs, lcretr, lesttr
from libdebito.drconbep 
where lfectr between '20181129' and '20181129' and lnrtar like '443078%' order by lhortr desc
-------------------------------------------------------------------------------------------------------------------
--VERIFICAR TRX POR ENTIDAD--
select lfectr FECHA, lhortr HORA, lnrtar TARJETA, lidcom ID_COMERCIO, lcomtr COMERCIO, limpgs IMPORTE, lcretr RESPUESTA, lesttr ESTADO
from libdebito.drconbep 
where lfectr between '20190227' and '20190227' and lnrtar like '7%' order by lfectr desc, lhortr desc
-------------------------------------------------------------------------------------------------------------------
--VERIFICAR TRX POR COMERCIO--
select lfectr FECHA, lhortr HORA, lnrtar TARJETA, lidcom ID_COMERCIO, lcomtr COMERCIO, limpgs IMPORTE, lcretr RESPUESTA, lesttr ESTADO
from libdebito.drconbep 
where lfectr between '20190501' and '20190530' and LIDCOM= '1001865' order by lfectr desc, lhortr desc


select lfectr, lhortr, lnrtar, lexpir, lcodbc, lidcom, lcomtr, limpgs, lcretr, lesttr 
from libdebito.drconbep  
where lnrtar='7030200103079253' 
--order by lfectr, lhortr desc

--ENMASCARAR TARJETAS
select SUBSTR(mtnumta,1,6)||'XXXXXX'||SUBSTR(mtnumta,13,4) tarjeta  from gxbdbps.Tmtaraf
where enemiso = '121'
select lfectr, lhortr, SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4) tarjeta, lidcom, lcomtr, limpgs, lcretr, lesttr from libdebito.drconbep
where lfectr between '20190317' and '20190317' and lidcom='0700815' order by lhortr desc;



		SELECT --*-- COUNT(LBINPR),LBINPR
		LFECTR FECHA_TRX, LHORTR HORA, /*substr(lnrtar,1,6)||'XXXXXX'|| substr(lnrtar,13,4)*/LNRTAR TARJETA ,LBINPR BIN, LCODBC MARCA, LIDCOM COMERCIO,LCOMTR NOMBRE, LIMPGS IMPORTE, 
		LIDTRA ID_TRX, LCODTR COD_TRX, LCAUTR AUTORIZACION, LCRETR RESPUESTA, LESTTR ESTADO, LERRNB REFERENCIA, LECA62 DISPOSITIVO, LENEMI EMISOR, LCOTEL
		FROM LIBDEBITO.DRCONBEP
		WHERE LENEMI ='510'
		AND LFECTR between '20191114' and '20191114' --AND LNRTAR ='6274311130000117' --AND LCRETR ='XD' --AND LESTTR='A' AND LIMPGS > 0
		ORDER BY LFECTR DESC, LHORTR DESC
		select * from libdebito.drconbep where lcodtr ='567102' and LCRETR ='00' and LESTTR='R'
		select * from gxbdbps.tmctaaf where mcemiso='162'
		select * from gxbdbps.tmtaraf where enemiso='162'
		select * from gxbdbps.ATMCDTA 
		WHERE ATMCCODC IN ('9002369','9002232','9099426','9002333','9002212','9002398','9099452','9099210','9002254','9002346')
		
		SELECT * FROM LIBDEBITO.DRCONBEP
		WHERE LCAUTR='833969'
		AND LIDCOM='9002369'
		AND 

select * from gxbdbps.gengraf where gecodig='BNF'

--------------------------------------------------------------------------------------------------------
select * from gxbdbps.comaeaf where cocomer='0700676' 
select * from libdebito.drconbep where lidcom='0700676' and lfectr between '20190927' and '20190927' and lcretr ='00' and lesttr='A' and limpgs > '0' --and lenemi = '020'
select * from gxopera.flicom where licomer ='0700676' and lifechd between '20190927' and '20190927'
select * from gxopera.flicom1 where licomer ='0700676' and lifechd between '20190927' and '20190927'
select * from gxopera.opliqui where opncomer='0700676' AND opfecliq = '20190927' --and opcodbco='21' 
select * from gxopera.opmovi where opcomer ='0700676' and opferea  between '20190927' and '20190927' --and opnoref in ('833890430743')
select * from gxopera.oprecle where recomer='0700676' and refech='20190927'
select * from libdebito.bst015 where bs15codcom like '%0701138%'
select sum(opimpor) from gxopera.opliqui where opncomer='0701721' and opcodbco='21'


select a.lifecredi,a.licomer,a.lifechd,a.lifechh,a.licodtr,a.lifecha,a.licant,a.limonto,a.litiptar,a.linrofac,
b.linro,b.linrofin,b.litipago,b.litidocu from 
gxopera.flicom1 a inner join gxopera.flicom b 
on a.licomer=b.licomer and a.lifechd=b.lifechd 
and a.lifechh=b.lifechh and a.licodtr=b.licodtr 
where
a.lifechd between '20190101' and '20191106' 
and a.lifechh between '20190101' and '20191106'
and b.litipago in('1','3')
and b.litidocu in ('LIQ','INS') 
and a.licodtr ='000054' 


SELECT * FROM LIBDEBITO.DRCONBEP WHERE LERRNB IN ('003548218256','003548217998')
UPDATE LIBDEBITO.DRCONBEP 
SET LFECTR='20200130', LFCOTR='20200130', LFECEN='20200130' --,LESTTR='A', LCORED='981' 
WHERE  lerrnb in ('000741279666') AND lidcom = '5400617' 
SELECT * FROM GXOPERA.OPMOVI WHERE OPNOREF IN ('000741279666')

UPDATE LIBDEBITO.DRCONBEP 
SET LFECTR='20191108', LFCOTR='20191108', LFECEN='20191108', LHORTR='070000', LESTTR='A', LCORED='981'
WHERE LERRNB IN ('929119668220','928719327315','927518104326','927918612724') AND LIDCOM = '5400617'

SELECT * FROM GXOPERA.OPMOVI WHERE OPNOREF IN ('003548218256','003548217998')
SELECT * FROM GXOPERA.OPLIQUI WHERE OPNROREF IN ('000741279666')
SELECT * FROM GXOPERA.OPRECLE WHERE 

SELECT * FROM GXOPERA.OPLIQUI
WHERE OPNROREF IN ('913605164806','915206761654','915206765504','916107486462','916807868082',
'918009235002','918910158868','919810667263','919810667306','921212005653','921512469869','922212996593',
'922613233729','924014256084','925416011116','926116354848','916507742083','916507714120','924915670593',
'905497662728','906599203310','907299646445','908100114970','911502802796','915206756255','915607182301',
'914305446650','924815602512','914505623329','915907406339','926316477674')


select * from visa.EASISSDEB where date(DEBTIMSTMP) = '2019-10-31'
SELECT * FROM MASTERCARD.DEBUGMC

SELECT --*
LFECTR FECHA_REAL, LFCOTR FECHA_CIAL, LHORTR HORA, /*substr(lnrtar,1,6)||'XXXXXX'|| substr(lnrtar,13,4)*/LNRTAR NRO_TARJETA, LIMPGS IMPORTE, LESTTR ESTADO, LCRETR RESPUESTA, LCAUTR AUTORIZACION,
LERRNB NRO_REF, LCODTR COD_TRX
FROM LIBDEBITO.DRCONBEP
WHERE LNRTAR = '7030200103081669' AND LFECTR BETWEEN '20191001' AND '20191205' --AND LESTTR = 'A' AND LCRETR ='00' AND LIMPGS > '0'
ORDER BY LFECTR DESC, LHORTR DESC
SELECT count(*) FROM LIBDEBITO.DRCONBEP WHERE LFECTR BETWEEN '20191005' AND '20191005' AND LIDCOM='9002342'
SELECT * FROM GXBDBPS.COMAEAF WHERE CODENO LIKE '%CREDIV%'
SELECT * FROM GXBDBPS.TDMOTA WHERE MOTASEC IN ('2','4','6','9','12','19','21','23','25','28')
SELECT * FROM GXBDBPS.TMMOTA WHERE MOTATIP='1'
SELECT * FROM GXBDBPS.TMTARAF WHERE ENEMISO='021'
SELECT * FROM GXBDBPS.TMCTAAF WHERE MCEMISO='021'
SELECT sum(tdacant) FROM gxopera.tdavistas where tdaanho='2019' and tdames='10' and tdadias='05' and tdacome='9002342'



select * from GXOPERA.flicom1 where licomer = '5800005'
and limonto = 337500;
select * from GXWEB.flicom21 where licomer = '5800005' 
and limonto = 337500; 
52500 



------------------------------------CASO ATM PEDRO JUAN CABALLERO-----------------------------------------------
select * from libdebito.drconbep where substr(lidtra,1,4)='T342' and lfectr between '20191001' and '20191031' 
select * from libdebito.drconbep where LIDCOM = '9002342' AND lfectr between '20191001' and '20191031' 
	select * from gxbdbps.comaeaf where cocomer='9002357'
select * from libdebito.drconbep where lidcom = '9002342' 
and leca62 <> 'T342' AND lfectr between '20191001' and '20191031' 
select COUNT(*) from libdebito.drconbep where lidcom = '9002342' and leca62 <> 'T342' AND lfectr between '20191001' and '20191131'; 

select * from GXBDBPS.ATMCTXDEST
select CODNRO CODIGORESP, CODMAR MARCA, CODDES DESCRIPCION, CODCOR RESPCORTA from libdebito.tbcret0p 

select * from gxopera.trxcomer where trxcomer='0701505'
select * from gxopera.flicom1 where licomer='0701505' and lifecredi>='20191107' and litiptar='CRE'

--------------------ELIMINACION RECIBOS----------------------------
SELECT * FROM GXOPERA.CUSTODE WHERE CUSTOREC='137693';
SELECT * FROM GXOPERA.FCOBROS WHERE COMRECNRO='137693';
SELECT * FROM GXOPERA.RECIBOS WHERE RID='137693';
SELECT * FROM GXOPERA.FACTURA WHERE FACLIEN='0301359' AND FACTIMBR='137693';


select * from roshkalib.m_usuarios where USERNAME like '%0981131090%' 
select * from gxbdbps.TMANENCTA where MCEENE = '021' and MECECO = '000' 
SELECT * FROM LIBDEBITO.BST021 WHERE TRIM(BS21CODCOM)='0701861';
SELECT * FROM GXWEB.BST021W WHERE TRIM(BS21CODCOM)='0701861';



SELECT * FROM LIBDEBITO.DRCONBEP WHERE LERRNB IN (
'000240367463',
'000340620949',
'000340599791',
'000340587322',
'000340582688',
'000340575344',
'000340549991',
'000340493010'
)
SELECT * FROM GXOPERA.OPMOVI WHERE --OPCOMER='0701712' AND OPFECOM BETWEEN '20200101' AND '20200109'
OPNOREF IN (
'000240367463',
'000340620949',
'000340599791',
'000340587322',
'000340582688',
'000340575344',
'000340549991',
'000340493010'
)

SELECT * FROM GXOPERA.OPLIQUI WHERE OPNROREF  IN (
'000240367463',
'000340620949',
'000340599791',
'000340587322',
'000340582688',
'000340575344',
'000340549991',
'000340493010'
)
 


select opidliq IdTrx, opnroref Referencia,opcampob CodAutorizacion, opncomer Comercio, ophorliq HoraTrx, opnroctc CtaComercio, optictac TipoCtaComercio, 
opimporB ImporteBepsa, opimpor ImporteComercio, opstat Estado, opmensaj Descripcion, opfecliq fechaliq  from gxopera.opliqui 
where opcodbco = 2 and substr(opcampoa,1,6) = '703002' 
and SUBSTR(opfecliq,1,4)||'-'||SUBSTR(opfecliq,5,2)||'-'||SUBSTR(opfecliq,7,2) =  DATE(CURDATE() - 1 days)
and opstat in ('77')

select * from gxbdbps.contcom where concom = '0901578'

select * from visa.visctldta where v038='014083'
select * from visa.vistrndta where vifecreal='20200122' and viimporte='1500000'


select * from gxbdbps.ATMCTXDEST

SELECT * FROM LIBDEBITO.DRCONBEP WHERE LCORED='991' AND LFECTR>'20200110' AND LIDCOM = '5400617'
SELECT * FROM LIBDEBITO.TGEMBHAF WHERE CRTARJ = '6274311620001252'

SELECT * FROM GXBDBPS.IPMFCTL WHERE IPMFDWNL <> 'S' IPMFCNAME LIKE 'T140005%'
SELECT * FROM GXBDBPS.IPMFMDTA
UPDATE FROM GXBDBPS.IPMFCTL SET IPMFCSTS = 'PRC' WHERE IPMFCSTS = 'PEN'

select * from libdebito.drconbep where lfectr='20200624' and limpgs = '50000' and lnrtar like '%0026' and lbinpr='627431'
select * from gxbdbps.tmoviaf where cmcodig = '510' and mvnomco in ('PRACTIPAGO','PRONET')

----------------------------LISTADO DE PROVEEDORES-------------------------------------
SELECT * FROM CONTABILID.FICLIEN WHERE CLCODO='PR';
SELECT * FROM CONTABILID.FICLIDET WHERE PRCODO='PR';
SELECT * FROM GXBDBPS.COMAEAF;
SELECT * FROM GXBDBPS.GENTIAF;
SELECT CLCOCL CODIGO, CLNOMB NOMBRE, CLAPEL APELLIDO, CLRUCO RUC, CLDIPA DIRECCION, CLCOCI CIUDAD, CLCOPA COD_PAIS, 
PRCTABAN CTA_BANCO, PRENEMISO COD_EMISOR, ENNOMBR EMISOR, CLEMAI EMAIL
FROM CONTABILID.FICLIEN A
INNER JOIN CONTABILID.FICLIDET B ON (B.PRCOCL=A.CLCOCL) AND (B.PRCODO=A.CLCODO)
--INNER JOIN GXBDBPS.COMAEAF C ON (C.COCOMER=B.PRCOCL)
INNER JOIN GXBDBPS.GENTIAF D ON (B.PRENEMISO=D.ENEMISO)

SELECT CLCODO TIPO, CLCOCL CODIGO, CLNOMB NOMBRE, CLAPEL APELLIDO, CLRUCO RUC, CLDIPA DIRECCION, CLCOCI CIUDAD, CLCOPA COD_PAIS, 
PRCTABAN CTA_BANCO, PRENEMISO COD_EMISOR, CLEMAI EMAIL
FROM CONTABILID.FICLIEN A
INNER JOIN CONTABILID.FICLIDET B ON (B.PRCODO=A.CLCODO) AND (B.PRCODO=A.CLCODO)  --(B.PRCOCL=A.CLCOCL) AND (B.PRCODO=A.CLCODO)



select * from gxopera.cicorevr
SELECT * FROM GXOPERA.SERVBPS;





---------------------------------------------------------------------------------

SELECT ASFECH, ASNRAS, ASNRLI, ASIMPO FROM ARNALDOLIB.CCASI20 
WHERE ASFECH BETWEEN 200801 AND 200831 AND ASNRLI = 2
AND ASNRAS IN (582, 782, 3235, 4077, 4118, 10289, 10319, 10355, 10397)

SELECT ASCODB, SUM(ASIMPO) TOTAL FROM CONTABILID.CCASI20 WHERE ASFECH >
200801 AND ASNRAS = 10397 GROUP BY ASCODB
---------------------------------------------------------------------------------
-- Sentencias para actualizar el importe --

UPDATE CONTABILID.CCASI20 SET ASIMPO = 4326545
 WHERE ASFECH=200803 AND ASNRLI = 2 AND ASNRAS = 582

UPDATE CONTABILID.CCASI20 SET ASIMPO = 4785056
 WHERE ASFECH=200810 AND ASNRLI = 2 AND ASNRAS = 782

UPDATE CONTABILID.CCASI20 SET ASIMPO = 18376259
 WHERE ASFECH=200817 AND ASNRLI = 2 AND ASNRAS = 3235

UPDATE CONTABILID.CCASI20 SET ASIMPO = 6616108
 WHERE ASFECH=200824 AND ASNRLI = 2 AND ASNRAS = 4077

UPDATE CONTABILID.CCASI20 SET ASIMPO = 79943239
 WHERE ASFECH=200825 AND ASNRLI = 2 AND ASNRAS = 4118

UPDATE CONTABILID.CCASI20 SET ASIMPO = 57969219
 WHERE ASFECH=200826 AND ASNRLI = 2 AND ASNRAS = 10289

UPDATE CONTABILID.CCASI20 SET ASIMPO = 28056979
 WHERE ASFECH=200827 AND ASNRLI = 2 AND ASNRAS = 10319

UPDATE CONTABILID.CCASI20 SET ASIMPO = 86288302
 WHERE ASFECH=200828 AND ASNRLI = 2 AND ASNRAS = 10355

UPDATE CONTABILID.CCASI20 SET ASIMPO = 130289771
 WHERE ASFECH=200831 AND ASNRLI = 2 AND ASNRAS = 10397


---------------------------------------------------------------------------------  
SELECT * FROM MASTERCARD.MASCTLDTA WHERE MC002 LIKE '5122307072084032%'--DATE(MCREVDATT) BETWEEN '2020-10-01' AND '2020-10-28'
SELECT * FROM MASTERCARD.MASTRNDTA WHERE MCPANNMBR LIKE '%5122307072084032%' --MCFECCOM BETWEEN '20201001' AND '20201028'
SELECT * FROM LIBDEBITO.DRCONBEP WHERE LNRTAR LIKE '5122309999994032%' --LFCOTR BETWEEN '20201001' AND '20201028'
 ('5491670759341700','5505685318802450','5122307072084032')
 ('5491679999991700','5505689999992450','5122309999994032')




// tablas originales
select * from gxbdbps.IPMDTA WHERE ipmfec LIKE '202011%'
select * from gxbdbps.IPMDTAE WHERE ipmfec LIKE '202011%'
select * from gxbdbps.IPMDTAEP WHERE ipmfec LIKE '202011%'
select * from gxbdbps.IPMDTAT WHERE ipmfec LIKE '202011%'
select * from gxbdbps.IPMDTATEP -- Completo
select * from gxbdbps.IPMIRD -- completo
select * from gxbdbps.IPMFCTL WHERE ipmfcins LIKE '202011%'

//replica
select * from GXSWTDTA.IPMDTA WHERE ipmfec LIKE '202011%'
select * from GXSWTDTA.IPMDTAE WHERE ipmfec LIKE '202011%'
select * from GXSWTDTA.IPMDTAEP WHERE ipmfec LIKE '202011%'
select * from GXSWTDTA.IPMDTAT WHERE ipmfec LIKE '202011%'
select * from GXSWTDTA.IPMDTATE
select * from GXSWTDTA.IPMDTATEP -- Completo
select * from GXSWTDTA.IPMIRD -- completo
	select * from GXSWTDTA.IPMFCTL WHERE ipmfcins LIKE '202011%'

select * from gxbdbps.IPMDTAT WHERE IPMMSGSENT = 'O' and IPMFEC >= '20201001' ;
select * from gxswtdta.IPMDTAT WHERE IPMMSGSENT = 'O' and IPMFEC >= '20201001' ;






DELETE GXBDBPS.GCMSRDTAR WHERE GCMSFNAM = 'T140035003'
SELECT * FROM GXBDBPS.GCMSRDTAR WHERE GCMSFNAM = 'T140035003'
SELECT * FROM GXBDBPS.GCMSRDTA


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
                        w.AUTRRNBEP='034900081636'

SELECT * FROM ARNALDOLIB.SILVICELL
EXCEPT 
SELECT * FROM GXOPERA.OPMOVI WHERE OPFEREA BETWEEN '20201201' AND '20201231'




select lerrnb, lnrtar, lidcom, lidtra, lfectr, lhortr,     
lbinpr                                                     
from arnaldolib.silvicell inner join gxopera.opentid1        
on lenemi = entcodi where lfectr between '20201207'            
and '20201223' and lcretr = '00' and lesttr = 'A'              
and limpgs > 0 and lbinpr in ('703002')
and lcodtr in ('000054','013000','014000')  and enttipo = 'DEB'                 
                                                           
except                                                     

select opnoref, optarj, opcomer, opidtra, opferea, ophotrn,
substr(optarj , 1 , 6) from GXOPERA.opmovi                 
where opfecom = '20201207' and opferea = '20201223' and           
opcodtrn in ('000054','013000','014000') and optiptar = 'DEB';                  
                                                           

SELECT * FROM GXBDBPS.AIT001 WHERE AIID='2021088001';
SELECT * FROM GXBDBPS.AIT002 WHERE AIID='2021088001' AND AITCID='45';
SELECT * FROM GXBDBPS.AIT003 WHERE AIID='2021088001' AND AITCID='45';


SELECT * FROM YAPI.TCLMOV;
SELECT * FROM YAPI.tclrtc;
SELECT * FROM YAPI.tclrtd;


select * from                            
cierrelib.tspcie where pcfch = '20210531' --and subhora  like '%MAEDINEL%'
order by subhora asc

Select * from     
libdebito.maedinel

SELECT * FROM GXBDBPS.AIT001 WHERE AIID = '2021181001'; --PROD: 1 REG       --TEST: 1 REG
SELECT * FROM ARNALDOLIB.AIT002T WHERE AIID = '2021181001'; 
SELECT * FROM ARNALDOLIB.AIT002 WHERE AIID = '2021181001';


SELECT COUNT(*),AITCLINID ,AITCID FROM ARNALDOLIB.AIT002 WHERE AIID = '2021181001' AND AITCID ='45' GROUP BY AITCLINID ,AITCID, AITCBCHID ORDER BY AITCLINID ,AITCID, AITCBCHID; 
SELECT COUNT(*),AITCLINID ,AITCID FROM ARNALDOLIB.AIT002 WHERE AIID = '2021181001' AND AITCID ='45' GROUP BY AITCLINID ,AITCID ORDER BY AITCLINID ,AITCID; 

SELECT COUNT(*), AITCID FROM ARNALDOLIB.AIT002T WHERE AIID = '2021181001' GROUP BY AITCID ORDER BY AITCID; --AND AITCID NOT IN ('05','07','25','27');
SELECT COUNT(*), AITCID, AITCLINID FROM ARNALDOLIB.AIT002 WHERE AIID = '2021181001' GROUP BY AITCID ORDER BY AITCID;  --AND AITCID NOT IN ('05','07','25','27');
SELECT COUNT(*),MVBINES FROM GXBDBPS.TMOVIAF GROUP BY MVBINES
SELECT * FROM GXBDBPS.TMOVIAF WHERE MVBINES='' GROUP BY MVBINES  --WHERE MVBINES LIKE '%488234%' AND  MVFEPRO='20210629'
SELECT * FROM GXBDBPS.MOVISA
SELECT * FROM GXBDBPS.AIT002 WHERE AIID = '2021181001'; --AND AITCID ='45' ('05','07') AND AITCEST = 'PRO';--PROD: 249774 REG  --TEST: 249782 REG
SELECT * FROM ARNALDOLIB.AIT002T WHERE AIID = '2021181001';   --TEST: 249782 REG
SELECT * FROM GXBDBPS.AIT003 WHERE AIID = '2021181001'; --PROD: 262483 REG  --TEST: 262491 REG 

SELECT * FROM ARNALDOLIB.AIT001T WHERE AIID = '2021181001';   --TEST: 1 REG
SELECT COUNT(*) FROM ARNALDOLIB.AIT002T WHERE AIID = '2021181001';   --TEST: 249782 REG
SELECT * FROM ARNALDOLIB.AIT003T WHERE AIID = '2021181001';   --TEST: 262491 REG 



[15:06] Ruben Velazquez
    SELECT DISTINCT  i.*
          FROM ARNALDOLIB.AIT002 i
          WHERE AIID = '2021181001' AND AITCID NOT IN ('05','07','25','27') AND (I.AITCID NOT IN
          (SELECT P.AITCID  FROM ARNALDOLIB.AIT002T P)) ORDER BY AIID
          FOR READ ONLY;

          

SELECT AIID, AITCLINID, AITCID, AITCBCHID 
FROM ARNALDOLIB.AIT002T
EXCEPT
SELECT AIID, AITCLINID, AITCID, AITCBCHID 
FROM ARNALDOLIB.AIT002

SELECT * FROM arnaldolib.AIT002T 
WHERE AIID='2021181001' AND AITCID='45' 
AND AITCBCHID='238' AND AITCLINID IN (
'232947',
'232948',
'232949',
'232950',
'232951',
'232952',
'232953',
'232954')






SELECT AIID, AITCLINID, AITCID, AITCRID
FROM ARNALDOLIB.AIT003T
EXCEPT
SELECT AIID, AITCLINID, AITCID, AITCRID
FROM ARNALDOLIB.AIT003

SELECT * FROM arnaldolib.AIT003T 
WHERE AIID='2021181001' AND AITCID='45' AND AITCLINID IN (
'232947',
'232948',
'232949',
'232950',
'232951',
'232952',
'232953',
'232954');

SELECT * FROM ARNALDOLIB.AIT002X;
UPDATE ARNALDOLIB.AIT002X SET AITCEST='PRO', AITCUSRAUD='U99ARNALDO', AITCFHAUD='2021-06-30 11:05:58'
UPDATE ARNALDOLIB.AIT002X SET AITCEST = 'PRO' WHERE AIID = 2021181001 AND AITCLINID = 232947 AND AITCID = '45 ' AND AITCBCHID = 238 AND AITCUSACOD = 0 AND AITCARN = '                       ' AND AITCTRJNRO = '                   ' AND AITCTRJCI = '               ' AND AITCCOMID = 0 AND AITCCOMNOM = '                         ' AND AITCMCCID IS NULL AND AITCPAIID IS NULL AND AITCAUTCOD = '      ' AND AITCFCHTRN = '00000000' AND AITCORIMON = 0.00 AND AITCORIMONID = 0 AND AITCDESMON = 0.00 AND AITCDESMONID = 0 AND AITCEST = 'PEN' AND AITCUSRAUD = 'U99JAVIER ' AND AITCFHAUD = '2021-06-30 11:26:09.218' AND AITCCNTME2 = 0 AND AITCCNTTCR = 1 AND AITCCNTME3 = 0 AND AITCCNTRR2 = 0 AND AITCCNTRM3 = 0;

SELECT * FROM ARNALDOLIB.AIT003X;
UPDATE ARNALDOLIB.AIT003X SET AITCRUSRAUD='U99ARNALDO', AITCRFHAUD='2021-06-30 11:05:58'

SELECT * FROM ARNALDOLIB.AIT003;


[15:12] Mariano Virgili Franco
Select * From LIBDEBITO.DRCONBEP
Where lfectr = '20210524' ;

[15:13] Mariano Virgili Franco
select * from gxbdbps.tswaut
where AUTTRXFCHC = '20210524';





INSERT INTO GXBDBPS.VIADQENTI (ADQENTI,ADQENTDEF,ADQENTPCR,ADQENTSTAT,ADQENTD,ADQENTKEYC,ADQENTKEY,ADQENTADQ,TDCANALID,ADQPROCID,ADQMAR) 
VALUES
  (1002,0,8075,100332,'Banco Nacional de Fomento                                                                                                                                       ','B97FØ4','VISAAWK ','473204      ','TM','540','VSA'),
  (1020,1,8075,100332,'BANCO CONTINENTAL                                                                                                                                               ','B97FØ4','VISAAWK ','473204      ','TM','540','VSA'),
  (1020,1,8075,100332,'Banco Continental                                                                                                                                               ','B97FØ4','VISAAWK ','473230      ','PO','540','VSA'),
  (1020,1,8075,100332,'Banco Continental                                                                                                                                               ','B97FØ4','VISAAWK ','473230      ','MO','540','VSA'),
  (1020,1,530,19696,'Banco Continental                                                                                                                                               ','      ','        ','19696       ','PO','530','MST'),
  (1020,1,530,19696,'Banco Continental                                                                                                                                               ','      ','        ','960023198   ','TM','530','MST'),
  (9999,1,530,19696,'Banco Continental                                                                                                                                               ','      ','        ','960023198   ','PO','530','MST');


