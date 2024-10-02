--redmine #

[Ayer 9:15] Mirian Molinas
    select MCNUMCT,    MCLIMCO, MCLIMCU,    MCSAFAC,    MCDISCO,    MCDISCU, MCAUTPE,    MCAPCOC, MCAPCUC,MCAPCUA, MCCUOPE from gxbdbps.tmctaaf where mcnumct in ('21060000102','2030000026');
?[Ayer 9:15] Mirian Molinas
    select * from libdebito.drconbep where lnrtar in ('5429270000000126') and lfectr >= '20200526' and lcretr = '00';
select * from gxbdbps.tautpaf where mtnumta in ('5148480100000013','5303990100000061','5429270000000126')  and apferea >= '20200526';
?[Ayer 9:33] Mirian Molinas
    select * from gxbdbps.tmtaraf where mtnumta in ('5452892202010759','5148480100000013','5303990100000061','5429270000000126','5429270000000191')  
?[Ayer 9:33] Mirian Molinas
    select MCNUMCT,    MCLIMCO, MCLIMCU,    MCSAFAC,    MCDISCO,    MCDISCU, MCAUTPE,    MCAPCOC, MCAPCUC,MCAPCUA, MCCUOPE from gxbdbps.tmctaaf where mcnumct in ('21060000102','2030000026','21060000177');

--redmine #
select * from visa.visctldta where 


vistrndta
visctldta
drconbep
488234
420806

select * from visa.VIEWTRXCON

CREATE VIEW VISA.VIEWTRXCON AS 
SELECT B.VIMTI AS VMTI,B.VIRRNBEPSA AS VRRNBEPSA, B.VIPANNMBR AS VNROPAN,B.VIPANEXPDT AS VEXPPAN,B.VIFECREAL AS VFEREAL,B.VIHORAREAL AS VHORAREAL,B.VICCUOTAS AS VCUOTAS, B.VIIMPORTE 
AS VIMPORTE,B.VICOTIZ AS VCOTIZ,B.VICOMCOD AS VCOMCOD,B.VIF044RCOD AS VCODRESP,B.VIPANSVC AS VPANSVC, A.V038 AS VCODAUT,A.V022 AS VPOSEM,A.V025 AS VPOSCC,A.V003 AS VTRXCOD,A.V018 AS 
VMCC,A.V043 AS VCOMDESC,A.V049 AS VORIDESC,A.V004 AS VMONORI, A.V051 AS VDESDESC,A.V006 AS VMONDES, A.V041 AS VTERMINAL FROM VISA.VISCTLDTA A 
INNER JOIN VISA.VISTRNDTA B ON A.VIRRNBEPSA = B.VIRRNBEPSA;

CREATE VIEW MASTERCARD.VIEWMASTRXCON AS 
SELECT B.MCMTI AS MMTI,B.MCRRNBEPSA AS MRRNBEPSA, substr(B.MCPANNMBR,1,6) AS BIN, B.MCPANNMBR AS MNROPAN,B.MCPANEXPDT AS MEXPPAN,B.MCFECREAL AS MFEREAL,B.MCHORAREAL AS MHORAREAL,B.MCCCUOTAS AS MCUOTAS, B.MCIMPORTE 
AS MIMPORTE,B.MCCOTIZ AS MCOTIZ,B.MCCOMCOD AS MCOMCOD,B.MCF044RCOD AS MCODRESP,B.MCPANSVC AS MPANSVC, A.MC038 AS MCODAUT,A.MC022 AS MPOSEM,A.MC025 AS MPOSCC,A.MC003 AS MTRXCOD,A.MC018 AS 
MMCC,A.MC043 AS MCOMDESC,A.MC049 AS MORIDESC,A.MC004 AS MMONORI, A.MC051
 AS MDESDESC,A.MC006 AS MMONDES, A.MC041 AS MTERMINAL FROM MASTERCARD.MASCTLDTA A INNER JOIN MASTERCARD.MASTRNDTA B ON A.MCRRNBEPSA = B.MCRRNBEPSA;
 
drop from mastercard.masctldta

SELECT * FROM LIBDEBITO.DRCONBEP WHERE LFECTR = '20200625'

update cierrelib.TMCTAAF set mcpmfij=0, mcfefij ='20200630' where mcemiso='021' and mcstats='1'

select * from gxbdbps.tdemis where tdbinnro = '230671' and tdctanro = '2006'

select * from gxbdbps.atdemis where aefecha = '20200702'

select * from gxbdbps.tdemis where TDEMFECACT <> '0'

INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  2151,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
select * from gxbdbps.TPrmUtTx

select * from gxbdbps.tdcta where TDBINNRO = '703002'

select * from gxbdbps.tdctaad where TDBINNRO = '703002'

CREATE VIEW VISA.VIEWTRXCON AS 
SELECT B.VIMTI AS VMTI,B.VIRRNBEPSA AS VRRNBEPSA, B.VIPANNMBR AS VNROPAN,B.VIPANEXPDT AS VEXPPAN,B.VIFECREAL AS VFEREAL,B.VIHORAREAL AS VHORAREAL,B.VICCUOTAS AS VCUOTAS, B.VIIMPORTE 
AS VIMPORTE,B.VICOTIZ AS VCOTIZ,B.VICOMCOD AS VCOMCOD,B.VIF044RCOD AS VCODRESP,B.VIPANSVC AS VPANSVC, A.V038 AS VCODAUT,A.V022 AS VPOSEM,A.V025 AS VPOSCC,A.V003 AS VTRXCOD,A.V018 AS 
VMCC,A.V043 AS VCOMDESC,A.V049 AS VORIDESC,A.V004 AS VMONORI, A.V051 AS VDESDESC,A.V006 AS VMONDES, A.V041 AS VTERMINAL FROM VISA.VISCTLDTA A INNER JOIN VISA.VISTRNDTA B ON A.VIRRNBEPSA = B.VIRRNBEPSA;

CREATE VIEW MASTERCARD.VIEWMASTRXCON AS 
SELECT B.MCMTI AS MMTI,B.MCRRNBEPSA AS MRRNBEPSA, substr(B.MCPANNMBR,1,6) AS BIN, B.MCPANNMBR AS MNROPAN,B.MCPANEXPDT AS MEXPPAN,B.MCFECREAL AS MFEREAL,B.MCHORAREAL AS MHORAREAL,B.MCCCUOTAS AS MCUOTAS, B.MCIMPORTE 
AS MIMPORTE,B.MCCOTIZ AS MCOTIZ,B.MCCOMCOD AS MCOMCOD,B.MCF044RCOD AS MCODRESP,B.MCPANSVC AS MPANSVC, A.MC038 AS MCODAUT,A.MC022 AS MPOSEM,A.MC025 AS MPOSCC,A.MC003 AS MTRXCOD,A.MC018 AS 
MMCC,A.MC043 AS MCOMDESC,A.MC049 AS MORIDESC,A.MC004 AS MMONORI, A.MC051
 AS MDESDESC,A.MC006 AS MMONDES, A.MC041 AS MTERMINAL FROM MASTERCARD.MASCTLDTA A INNER JOIN MASTERCARD.MASTRNDTA B ON A.MCRRNBEPSA = B.MCRRNBEPSA;
 
select * from MASTERCARD.VIEWMASTRXCON

select * from gxbdbps.tdcliente where TDBINENTID = '1020' AND TDCLINRODOC = 'AA92246' --TDUSUING = 'CONTIUSR'


--PRUEBA CON CUENTAS NUEVAS - TARJETA VISA, BIN 456976
select * from gxbdbps.tdcta where substr(tdctatar,13,4) = '0069' and substr(tdctatar,1,6) = '456976' --tdctanro = '6601774266'--  and tdctatar = '2306710001000117'
delete from gxbdbps.tdcta where tdctanro = '6601774266';commit;

select * from gxbdbps.tdemnotar where nectanro = '5225275513' --where nebinnro = '456976' -- nenrotarj = '4569760000001267'
delete from gxbdbps.tdemnotar where nectanro = '5225275513'

select * from gxbdbps.tdctaad where tdctanro = '5225275513'-- and tdbinnro = '230671'
delete from gxbdbps.tdctaad where tdctanro = '5225275513'

select * from gxbdbps.tdemis where tdctanro = '5225275513'
delete from gxbdbps.tdemis where tdctanro = '5225275513'
-- and tdbinnro = '230671'

select * from gxbdbps.tdemisnov where tdctanro = '5225275513'
delete from gxbdbps.tdemisnov where tdctanro = '5225275513'
 -- and tdbinnro = '230671'

select * from gxbdbps.tdcliente where tdclinrodoc = '2247272'

--AUDITORIA DE CAMBIOS APLICADOS
SELECT * FROM GXBDBPS.ATDEMIS WHERE AEUSUARIO = 'U99JAVIER'

select * from libdebito.drconbep where lfectr = '20200924' and lcomtr = 'ATM BANCO CONTINENTAL         ' order by lhortr desc;

--PRUEBA CON CUENTAS NUEVAS - TARJETA MASTERCARD, BIN 230671
select * from gxbdbps.tdcta where tdctanro IN ('3804166868', '3804167251')--  and tdctatar = '2306710001000117'
delete from gxbdbps.tdcta where tdctanro IN ('3804166868', '3804167251');commit;

select * from gxbdbps.tdemnotar where nebinnro = '230671' -- nenrotarj = '4569760000001267'
delete from gxbdbps.tdemnotar where nebinnro = '230671';commit;

select * from gxbdbps.tdctaad where tdctanro IN ('3804166868', '3804167251')-- and tdbinnro = '230671'
delete from gxbdbps.tdctaad where tdctanro IN ('3804166868', '3804167251'); commit;

select * from gxbdbps.tdemis where tdctanro IN ('3804166868', '3804167251')
delete from gxbdbps.tdemis where tdctanro IN ('3804166868', '3804167251');commit;
-- and tdbinnro = '230671'

select * from gxbdbps.tdemisnov where tdctanro IN ('3804166868', '3804167251')
delete from gxbdbps.tdemisnov where tdctanro IN ('3804166868', '3804167251'); commit;
 -- and tdbinnro = '230671'

select * from gxbdbps.tdcliente where tdclinrodoc = '2247272'

--AUDITORIA DE CAMBIOS APLICADOS
SELECT * FROM GXBDBPS.ATDEMIS WHERE AEUSUARIO = 'U99JAVIER';
select * from gxbdbps.atdcta where actanro = '3804166868';

select * from gxweb.gxlousu where usuaid = '4842196';


--anterior
UPDATE GXWEB.GXLOUSU
   SET USUNOM = 'Javier Nuñez Comercio         ',
       USUAID = '4842196   ',
       USUEST = 1,
       USUMAI = 'jnunez@bepsa.com.py',
       TUSRID = 9,
       USUPASS = 'IBFVx2fsn6/SD0kdeMhiVg==        ',
       USUCLAV = '992D5EE10582B85205D3A9DCAA625A90',
       USUCARG = 'TESTING             ',
       USUADM = NULL,
       USUCORUC = '123457-8       ',
       USUUMO = 'U99JAVIER ',
       USUFMO = '20200807',
       USUUAL = 'U99HERNAN ',
       USUFAL = '20200323'
WHERE USUCOD = 2875;

--nuevo portal

UPDATE GXWEB.GXLOUSU  SET                    
usupass = 'c8cdf720db5562a039be5d81c51a07c5' ,
usuclav = '120eaf0bf142b2144f1a1eb7a95678d3'
WHERE USUCOD = 2875

--  Generar SQL 
--  Versión:                   	V7R2M0 140418 
--  Generado en:              	21/08/20 14:59:01 
--  Base de datos relacional:       	E10E97CR 
--  Opción de estándares:          	DB2 for i 
ALTER TABLE CIERRELIB.TCUENOCOB
    ADD CONSTRAINT CIERRELIB.ITCUENOCOB1 FOREIGN KEY(CNCCUE)
    REFERENCES CIERRELIB.TMCTAAF1(MCNUMCT)
    ON DELETE NO ACTION ON UPDATE NO ACTION;
    
select * from mirianlib.mipissdeb
where date(DEBTIMSTMP) = '2020-07-27'

select * from mastercard.mastrndta where mcfereal = '2020'

select * from libdebito.drconbep where lfectr = '20200828';

select * from mastercard.MASCTLDTA where 

select mti MTI, mc002 NRO_TARJ, mc032 ICA, mc037 RRN_BEPSA, mcrol ROL from mastercard.masctldta where
--mc032 = '088684'
--mc002 in ('5148480000000030') and
--mc002 like '%5148480000000030%' and
--mc013 = 729 and
mc037 = '021791866893';

select mcrol ROL_MAST, mcmti MTI_MAST, mctrnsent ENVIO_TRX, mcrrnbepsa RRN_BEPSA, mcica ICA, mcfecreal FECHA, mcimporte IMPORTE, mcccuotas CUOTAS, mccomcod COD_COM from mastercard.mastrndta where MCMOVSEQ = '021791866893'

select lnrtar NRO_TARJ, lidcom COD_COM, lcomtr COMERCIO, lfectr FECHA_TRX, limpgs IMPORTE, lcuota CUOTAS, 
lbinpr BIN, lcodbc MARCA, lcodtr COD_TRX, lcretr COD_RETORNO, lesttr ESTADO_TRX, lerrnb RRN 
from libdebito.drconbep 
where lfectr = '20200831' 
order by lhortr--LERRNB = '021791866893';

select * from gxbdbps.tracelog order by tracts desc;

select * from libdebito.drconbep where lerrnb = '025300065829';

select * from libdebito.drconbep where LERRNB in 
('024400064674',
'024400064670',
'024400064668',
'024400064664',
'024400064662',
'024400064658',
'024400064656',
'024400064654',
'024400064650',
'024400064648',
'024400064646',
'024400064641',
'024400064639',
'024000064492',
'025300065871',
'023700063739',
'023400062440');

select * from mastercard.mastrndta where MCRRNBEPSA = '025300065829'--order by MCFECREAL desc;

select * from mastercard.masctldta where MCRRNBEPSA = '25300065829'; --in
('024400064674',
'024400064670',
'024400064668',
'024400064664',
'024400064662',
'024400064658',
'024400064656',
'024400064654',
'024400064650',
'024400064648',
'024400064646',
'024400064641',
'024400064639',
'024000064492',
'025300065871',
'023700063739',
'023400062440');

select * from mastercard.masctldta where MCRRNBEPSA = '025300065829';

select * from libdebito.drconbep where lfectr = '20200915' order by lhortr desc;

select * from libdebito.drconbep where lfectr = '20200909' order by lhortr desc;
select * from gxbdbps.tswaut where AUTTRXFCHF = '20200909' order by AUTTRXHORF desc

INSERT INTO MASTERCARD.MASTRNDTA
(
  MCROL,
  MCMTI,
  MCTRNSENT,
  MCREVFLAG,
  MCFLD037,
  MCRRNBEPSA,
  MCMOVSEQ,
  MCICA,
  MCPANNMBR,
  MCPANEXPDT,
  MCPANSVC,
  MCPANCVV,
  MCPANCVV2,
  MCPANTOKEN,
  MCFECCOM,
  MCFECREAL,
  MCHORAREAL,
  MCCCUOTAS,
  MCIMPORTE,
  MCCOTIZ,
  MCCOMCOD,
  MCRUBRO,
  MCDISTIP,
  MCDISCAP,
  MCTRANTYPE,
  MCTRANATTR,
  MCTRANAUTH,
  MCPARTAUTH,
  MCLINESP,
  MCUSERID,
  MCPARTREV,
  MCTRNQTY,
  MCTRNSUMGS,
  MCTRNSUMUS,
  MCMSGTYPE,
  MCMSGFAM,
  MCMIPCONN,
  MCMSGTIMO,
  MCENVIAPIN,
  MCENVIAEMV,
  MCPINKEYI,
  MCPINKEYO,
  MASCPI,
  MASGCMS,
  MASPRDCLS,
  MASCTRYCD,
  MASIPMPRC,
  MASIPMFIL,
  MASTIPOCRD,
  MASCRDAFI,
  MASTDCTA,
  MASTDENTI,
  MASTDADHE,
  MASTDEMIS,
  MASTDMONE,
  MCF044RCOD,
  MCF044RMSG
)
VALUES
(
  'ISS',
  110,
  '                    ',
  'N',
  0,
  '025300065829',
  '025300065829',
  0,
  '5148480000000030   ',
  2504,
  0,
  0,
  409,
  '                                ',
  20200909,
  20200909,
  151217,
  1,
  6945.00,
  6780.0000,
  6900296,
  '00',
  30,
  0,
  0,
  1,
  '0',
  0,
  0,
  'U99MIRIAN ',
  0,
  0,
  0.00,
  0.00,
  '                    ',
  0,
  '                                        ',
  0,
  ' ',
  ' ',
  'MASIWK    ',
  '          ',
  '   ',
  '   ',
  '   ',
  '   ',
  ' ',
  '          ',
  'C',
  '   ',
  0,
  0,
  0,
  0,
  0,
  9010,
  'Excede Parametro de Actividad                                                                                                                                                                                                                                                                               '
);

select * from gxbdbps.TPRMUTTX

INSERT INTO GXBDBPS.TPRMUTTX
(
  PRTXENEM,
  PRTXBINE,
  PRTXAFIN,
  PRTXPAIS,
  PRTXCANL,
  PRTXTXCT,
  PRTXTARC,
  PRTXADHE,
  PRTXDTRX,
  PRTXPER,
  PRTXCANT,
  PRTXMOTO,
  PRTXMOTX,
  PRTXFECD,
  PRTXFECH,
  PRTXCODR,
  PRTXUSRA,
  PRTXFECA,
  PRTXHORA,
  PRTXUSRM,
  PRTXFECM,
  PRTXHORM,
  PRTXCODRCT,
  PRTXCODRXT,
  PRTXCONT,
  PRTXOBS
)
VALUES
(
  '9999',
  '999999',
  '999',
  999,
  '99',
  '999999',
  '9999999999999999999',
  99,
  '                              ',
  1,
  999,
  99999999.00,
  99999999.00,
  '00000000',
  '00000000',
  61,
  'U99MIRIAN   ',
  '20181122',
  '13:10:42',
  '            ',
  '00000000',
  '        ',
  65,
  61,
  1,
  'Prueba limites Mastercard'
);

select * from gxbdbps.

select * from libdebito.drconbep where lfectr = '20200924' order by lhortr desc;

select * from gxbdbps.tswotp
where date(otpfecope) = '2020-09-24';
select * from gxbdbps.tswotphis
where date(hisfecope) = '2020-09-24'


---
---
---
---
SELECT * FROM GXBDBPS.TDBINDET WHERE TDBINNRO = '488234';

select * from libdebito.drconbep where lfectr = '20210114' and lbinpr = '230671' and lhortr > '150000' order by lhortr desc

select * from gxbdbps.tdcliente where tdclinrodoc in ('3528044');
select * from gxbdbps.tdcliente where tdclinrodoc in ('A457902','B577195');
select * from gxbdbps.tdcliented where tdclinrodoc in ('5474576');
select * from gxbdbps.tdcta where tdctanro in ('1000022001');
select * from gxbdbps.tdctaad where tdctanro in ('1000022001');
select * from gxbdbps.tdemnotar where NECTANRO in ('1000022001') --NENROTARJ like '%4569760000020069%' --nectanro in ('0000000123264808');


select count(*), tdctanro, TDBINNRO from gxbdbps.tdcta where TDBINENTID = '1020' group by tdctanro, tdbinnro; --TDCTANRO in ('0102026062');--TDCTATAR like '%2306710101156468%';
select count(*), TDBINNRO, TDCTANRO from gxbdbps.tdctaad where tdbinentid = '1020' group by tdbinnro, tdctanro; /*tdbinentid = '1020' and*/ tdctanro in ('0101020260');
select * from gxbdbps.tdemis where  tdctanro in ('1000022001');-- and TDEMCTA = '2' and tdbinnro = '456976' ;
update gxbdbps.tdemis set tdemfecexp = 'AAAAMM' where tdbinentid = '5177' and tdctanro = '1000022001';
select * from gxbdbps.tdemisnov WHERE  tdctanro in ('1000022001');
select * from gxbdbps.tdemnotar where nectanro in ('1000022001');
select * from gxbdbps.atdemis where aecta in ('1504788845');
---
delete from gxbdbps.tdcliente where tdclinrodoc in ('5474576');
delete from gxbdbps.tdcliented where tdbinentid = '1020' and tdclinrodoc in ('A457902','B577195');
delete from gxbdbps.tdemnotar where nectanro in ('1504788845');
delete from gxbdbps.tdemisnov WHERE tdctanro in ('1504788845');
delete from gxbdbps.tdemis where tdctanro in ('1504788845');
delete from gxbdbps.tdctaad where tdctanro in ('1504788845');
delete from gxbdbps.tdcta where tdctanro in ('1504788845');
delete from gxbdbps.atdemis where aecta in ('1504788845');


SELECT * FROM gxbdbps.TDCTA WHERE  TDCTATAR LIKE '%62743110000220011%';


select * from libdebito.drcobep where lfectr = ''

select * from libdebito.TBCTRA0P WHERE txdtrx LIKE 'CONSULTA%'--TXCTRX = '012000'; --PEDIR A PRODUCCION

SELECT * FROM GXBDBPS.TDMOV WHERE MOVFECTR = '20200102' AND MOVLERRNB = '000240156193'

select * from yapi.ipmdtaep;

select * from libdebito.drconbep where lfectr = '20201019' order by lhortr desc;
	
select OTPFECOPE HORA_FECHA, OTPCODENT ENTIDAD, OTPPANNRO TARJETA, OTPUSUALT USUARIO_GEN from gxbdbps.tswotp where substr(OTPFECOPE,1,10) = '2020-10-27';

select * from visa.vistrndta where VIFECREAL = '20201030';

select virol ROL, vimti MTI, virevflag FLAG_REVERSA, virrnbepsa NRO_REF, viimporte IMPORTE, vifecreal FECHA from visa.vistrndta where VIFECREAL = '20201030';

select * from visa.visctldta where VIRRNBEPSA = '030400073791';

select virol ROL, mti MTI, v004 IMPORTE, virrnbepsa NUM_REF, virevflg FLAG_REVERSA, v043 COMERCIO from visa.visctldta where VIRRNBEPSA = '030400073791';

select * from libdebito.drconbep where lfectr = '20201030' and lidcom = '6900282' order by lhortr desc;

select lfectr FECHA_TRX, lidcom COD_COM, lcomtr COMERCIO, limpgs IMPORTE, lcodbc MARCA, lcretr COD_RETORNO, lesttr ESTADO_TRX, lerrnb NUM_REF, lenemi ENTIDAD  from libdebito.drconbep where lfectr = '20201030' and lidcom = '6900282' order by lhortr desc;

select * from gxbdbps.tswaut where AUTTRXFCHF = '20201030' order by AUTTRXHORF desc;

select * from gxbdbps.tdmov where MOVFECTR = '20201030' order by MOVHORTR desc;

INSERT INTO GXBDBPS.TPRMUTTX
(
  PRTXENEM,
  PRTXBINE,
  PRTXAFIN,
  PRTXPAIS,
  PRTXCANL,
  PRTXTXCT,
  PRTXTARC,
  PRTXADHE,
  PRTXDTRX,
  PRTXPER,
  PRTXCANT,
  PRTXMOTO,
  PRTXMOTX,
  PRTXFECD,
  PRTXFECH,
  PRTXCODR,
  PRTXUSRA,
  PRTXFECA,
  PRTXHORA,
  PRTXUSRM,
  PRTXFECM,
  PRTXHORM,
  PRTXCODRCT,
  PRTXCODRXT,
  PRTXCONT,
  PRTXOBS
)
VALUES
(
  '0319',
  '627431',
  '001',
  999,
  'PO',
  '013000',
  '9999999999999999999',
  99,
  '                              ',
  1,
  999,
  99999999.00,
  99999999.00,
  '00000000',
  '00000000',
  61,
  'U99JOAQUIN  ',
  '20181127',
  '15:11:53',
  'U99JOAQUIN  ',
  '20181128',
  '13:06:38',
  65,
  61,
  5,
  'A pedido de la entidad vía nota enviada por Yessica Jara en fecha 27/11/18 por correo.'
);


--consulta de codigos de transaccion
select * from libdebito.TBCTRA0P

--CONSULTA DE DATOS DE TARJETAS DE CREDITO
SELECT * FROM GXBDBPS.TMTARAF WHERE BIBINES like '627431' and mtnumta like '%6274310212000151%';
SELECT * FROM GXBDBPS.TMCTAAF where MCNUMCT = '20112100026';-- MCBINES = '627431' and MCNUMTA like '%6274310212000151%';
SELECT * FROM GXBDBPS.TMCTTAF;
SELECT * FROM GXBDBPS.TMCIEAF;
SELECT * FROM GXBDBPS.

select * from gxbdbps.tmtaraf where mtnumta like '%%';
select * from gxbdbps.tmctaaf where MCNUMCT = '2030000026';
SELECT * FROM GXBDBPS.TMCTTAF where mcnumct = '2030000026';
select * from gxbdbps.TMCIEAF where MIINTCA;






select * from atmcentre.;

select * from gxbdbps.tswotp;

select * from GXBDBPS.TPRMUTTX where prtxbine = '488234';

select * from gxbdbps.logrules where logfecha = '2020-11-20' order by loghora desc;

SELECT COUNT(*) as movcount,COALESCE(SUM(m.MOVIMPORTE), 0) as movsum FROM GXBDBPS.TDMOV m WHERE TRIM(m.MOVPAIS)='PY' AND m.TDCANALID='TM' AND m.MOVLCODTR='012000' AND m.TDCTANRO=6601774266 
AND  m.TDADHCTA = 0 AND  m.MOVLCRETR = '00' AND m.MOVFECTR >=20201113 AND m.MOVFECTR <=20201113 AND m.MOVLESTTR = 'A' LIMIT 1;

select * from gxbdbps.tdmov where movfectr = '20201117' and movlerrnb in (
'032100077126',
'032100077128',
'032100077129',
'032100077130');

select * from libdebito.drconbep where lerrnb in (
'032100077126',
'032100077128',
'032100077129',
'032100077130');

select * from gxbdbps.TSWAUT where AUTRRNBEP in (
'032100077126',
'032100077128',
'032100077129',
'032100077130');

select * from gxbdbps.tbineaf where bibines = '488234' and enemiso = '156';                                                                                                                                                                                                                                                                                                                                         
`
SELECT * FROM gxtrjdta.tdgbin where /*BINNROBIN = '' and*/ BINDSBIN LIKE '%ÑEM%';

select * from gxbdbps.tdctarel;
select * from javierlib.tdctarel;

select * from gxbdbps.tdbinemb;

select * from gxbdbps.tdcta where tdctanro = '126356196';

--caso sixta salinas #12806
select * from libdebito.drconbep where lfectr = '20210216' and lcomtr = 'KOKUE GUAZU              AREPY';

select lnrtar TARJETA, lidcom COMERCIO, lhisor ORIGEN, lhisde DESTINO, lfectr FECHA_TRX, limpgs IMPORTE, loritr ORIGEN, lcodtr COD_TRX, lcretr COD_RETORNO, lesttr ESTADO, lerrnb RRN
from libdebito.drconbep where lfectr = '20210216' and lcomtr = 'KOKUE GUAZU              AREPY';

select * from gxbdbps.tswaut where AUTRRNBEP in (select lerrnb from libdebito.drconbep where lfectr = '20210216' and lcomtr = 'KOKUE GUAZU              AREPY');

select autcodser SERVICIO, autcodpre PRESTACION, autcodcomb COD_COMERCIO, autcomraz COMERCIO, autdistip DIPOSITIVO,  autmartar MARCA, autprotar PRODUCTO, 
autpannro TARETA, autrrnbep RRN, autcodret COD_RETORNO, auttrxestf ESTADO_TRX, auttrxcod COD_TRX
from gxbdbps.tswaut where AUTRRNBEP in (select lerrnb from libdebito.drconbep where lfectr = '20210216' and lcomtr = 'KOKUE GUAZU              AREPY');

select * from visa.vistrndta where VIRRNBEPSA in (select lerrnb from libdebito.drconbep where lfectr = '20210216' and lcomtr = 'KOKUE GUAZU              AREPY');

select virol ROL, vimti MTI, vitrnsent OBS, virrnbepsa RRN, vifecreal FECHA, viimporte IMPORTE, vicomcod COD_COM, vidistip TIPO_DISPOSITIVO
from visa.vistrndta where VIRRNBEPSA in (select lerrnb from libdebito.drconbep where lfectr = '20210216' and lcomtr = 'KOKUE GUAZU              AREPY');

select virol ROL, mti MTI, v002 TARJETA, v003 COD_TRX, virrnbepsa RRN, v039 COD_RETORNO, vimsgdatt FECHA_HORA, v043 COMERCIO
from visa.visctldta where VIRRNBEPSA in (select lerrnb from libdebito.drconbep where lfectr = '20210216' and lcomtr = 'KOKUE GUAZU              AREPY');

select * from visa.visctldta where VIRRNBEPSA in (select lerrnb from libdebito.drconbep where lfectr = '20210216' and lcomtr = 'KOKUE GUAZU              AREPY');

select * from libdebito.drconbep where lfectr between 20201207 and 20201207 and Lidcom = '0701712' and lerrnb = '034221168254'

select * from gxbdcon.gxlofun where siscodi = 'SC' and FUNNOM like '%wcom%';

select * from gxbdbps.comms;
--maestro de tarjetas, walled
select * from javierlib.tmtarafcie where enemiso = '176';

select * from gxbdbps.tmtaraf where enemiso = '176';

select * from cierrelib.tmtaraf where enemiso = '176';

--maestro de cuentas, walled
select * from javierlib.tmctaafcie where MCNUMCT in (
select mcnumct from javierlib.tmtarafcie where enemiso = '176');

select * from gxbdbps.tmctaaf where MCNUMCT in (
select mcnumct from gxbdbps.tmtaraf where enemiso = '176');

INSERT INTO GXBDBPS.GXRELGRU
(USUAID, GECODIG, RUEUSUI, RUEFCHI, RUEUSUM, RUEFCHM)
VALUES('U99JAVIER', 'ADM', 'U99JAVIER', '        ', '          ', '        ');

select * from gxbdbps.GXRELGRU where usuaid = 'U99JAVIER';


select * from gxtrjdta.TDGBIN where substr(binnrobin,1,6)='627431';
