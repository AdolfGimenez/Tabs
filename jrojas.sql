!"select * from libdebito.drconbep where lfectr = '20200225' and LPOSEM = '0510'-- and lnrtar = '4208060100000112'
order by LHORTR desc

--para consultar las transacciones realizadas en el ambiente transaccional montado por Juan Carlos Rojas
select lnfisc, lposem, lmcctr, lnfact, LHISOR, LHISDE, LFCOTR, LFECTR, LCOMTR, LCODBC, LERRNB from libdebito.drconbep where lfectr = '20200225' and lnrtar = '4208060100000112'
order by LHORTR desc

"
select * from gxbdbps.lgcoment where lgentid = '1020' order by LGID desc

select * from gxbdbps.TDEMNOTAR where NEBINNRO = '456976'

select * from libdebito.drconbep where LFECTR = '20200609' /*AND LENEMI = '500'*/ order by LHORTR;

select * from visa.visctldta where virol = 'ADQ' order by VIMSGDATT desc;

select * from visa.vistrndta where VIFECREAL = '20200609' order by VIHORAREAL desc

--tabla de parametrizacion del cambio a dolar
aitcot

--codigos de respuesta
select * from LIBDEBITO.TBCRET0P where codnro = '82'

select * from gxbdbps.lgcoment where lgentid = '1020'

select * from GXBDCON.gxlofun where SISCODI = 'TC' order by funcod where funcod = '21'

select * from visa.VISADQPATT

--testing #7207 - Ajustes para Transacciones E-Commerce - VISA
select *  from libdebito.drconbep where lfectr = '20200617' and lnrtar = '4569760000000103'

select lnrtar NUM_TARJETA, lbinpr BIN, lexpir FECH_EXP, lfectr FECHA_TRX, lhortr HORA_TRX, lmontr MONERA, 
limpgs IMPORTE_TRX, lcodbc MARCA_TARJ, lcautr COD_AUTOR, lcretr COD_RETORNO, lesttr ESTADO_TRX  
from libdebito.drconbep where lerrnb = '101400085064';--where lfectr = '20200617' and lnrtar = '4569760000000103'
order by lhortr asc

select * from gxbdbps.tdcta where tdctatar = '4123709999990025' --121880101
select * from gxbdbps.tdemis where tdctanro = '121880101' and tdbinnro = '456976'

select * from gxbdbps.tdemisnov order by TDFECHPROC desc

select * from gxbdbps.tdemnotar where NROTARJCTA = '4123709999990025'
select * from gxbdbps.mtdfic
select * from gxbdbps.tdctaad where TDADHTARIN = '4569760000000103'

select * from LIBDEBITO.TBCRET0P order by codnro --codigos de transaccion

select * from gxbdbps.tmoviaf where mtnumta = '4123709999990025' --MVNUMCT = '121880101' order by MVHORA desc

select * from GXBDBPS.autaraf where atnumta = '4123709999990025'

select * from gxbdbps.lgcoment

select * from visa.visctldta order by VIMSGDATT


select lctaor CUENTA_ORIGEN, lnrtar TARJETA, lexpir FECHA_EXP, lbinpr BIN, lcodbc COD_TRX_BANCO, lfectr FECHA_TRX, lhortr HORA_TRX, lcomtr ATM_TRX, lcretr COD_RESP, lesttr ESTADO_TRX from libdebito.drconbep where lfectr = '20200702' and lerrnb = '018400056706' order by lhortr desc  

select * from mastercard.debugmc

select * from LIBDEBITO.TBCRET0P

select * from gxbdbps.tmtaraf where mtnumta = '4123709999990025'

--TCREDITO
select * from gxbdbps.tmtaraf where MTNUMTA = '4123709999990025'--enemiso <> '021' AND MCNUMCT = '20110500027' --and MTNUMTA like '2307290000000011'

select * from gxbdbps.tmctaaf where mcnumct = '0000000000000025' -- mcemiso = '021'  AND MCTIPCB <> 'C' and

select * from gxbdbps.tmoviaf where MVNUMCT = '0000000000000025' order by MVHORA desc

--TDEBITO
select * from gxbdbps.tdemis where tdctanro = '0000000000000025'

select * from gxbdbps.tdcta where tdctatar = '0000000000000025' --where TDBINNRO = '703020'-- tdctanro = '102025857'

select movlerrnb NRO_ref, movfectr FECHA_TRX, movhortr HORA_TRX, tdbinentid ENTIDAD, tdbinnro BIN, tdctanro CUENTA, monid MONEDA, 
movimporte IMPORTE, movlcomtr ORIGEN_TRX, movpais PAIS_ORIGEN, movlcretr COD_MOV, movlesttr ESTADO_TRX,
tdcanalid CANAL_TRX from gxbdbps.tdmov where movfectr = '20200706' and tdadhcta = '0' order by movhortr asc

select * from gxbdbps.tdmov where movfectr = '20200706' and tdadhcta = '0' order by movhortr desc

select lnrtar NUM_TARJETA, lbinpr BIN_ADQ, lcodbc MARCA, lmarca TIPO, lfectr FECHA_TRX, lhortr HORA_TRX, 
limpgs IMPORTE_GS, lcomtr TERMINAL, lcautr COD_AUT, lcretr COD_TRX, lesttr EST_TRX, lerrnb REF_NUM, lenemi, lnfisc, lbcocr, lbcodb
from libdebito.drconbep where lfectr = '20200722' and LBINPR = '476134' order by lhortr desc
--codigos de respuesta
select * from LIBDEBITO.TBCRET0P where codnro = '19'

select * from gxbdbps.tswaut where AUTBINADQ = '476134' --autrrnbep = '020400058038'

select * from libdebito.drconbep29 where lfectr = '20200715' and LCAUTR = '003352'--lhortr > '140000' and substr(lcomtr,1,3) = 'ATM' and 

select * from gxbdbps.tswaut WHERE AUTRRNBEP in (
'020900058219',
'020900058222',
'020900058223')

select lnrtar NUM_TARJETA, lbinpr BIN_ADQ, lcodbc MARCA, lmarca TIPO, lfectr FECHA_TRX, lhortr HORA_TRX, 
limpgs IMPORTE_GS, lcomtr TERMINAL, lcautr COD_AUT, lcretr COD_TRX, lesttr EST_TRX, lerrnb REF_NUM, lenemi, lnfisc, lbcocr, lbcodb
 from libdebito.drconbep where lfectr = '20200727' and lhortr > '141000' and LCRETR = '81'
 
INSERT INTO LIBDEBITO.TBEPAD0P
(REENT, REENPA, REENCC, REENCB, RETASA)
VALUES('540', '540', '1234', '1234', 1.1)

select * from LIBDEBITO.TBEPAD0P

INSERT INTO LIBDEBITO.TBEPAD0P
(
  REENT,
  REENPA,
  REENCC,
  REENCB,
  RETASA
)
VALUES
(
  '540',
  '540',
  '1234           ',
  '1234           ',
  1.10000
);



select LNRTAR TARJETA, LIDCOM COD_COD, LCOMTR COMER, LHISDE DESTINO_TRX, LBCOCR COD_ADQ, LFECTR FECHA_TRX, LCRETR COD_TRX, LESTTR EST_TRX, LHORTR HORA_TRX, LIMPGS IMPORTE, LCUOTA CUOTAS, LBINPR BIN, LCODBC MARCA, LENEMI COD_EM_PROC, LERRNB NUM_REF
FROM libdebito.drconbep
WHERE lfectr = '20200825'
AND LCODBC = 'MST'
and LENEMI = '530'
ORDER BY lhortr DESC;

select * from mastercard.masctldta where MCRRNBEPSA = '023800063820';

select * from mastercard.mastrndta where 

select * from gxbdbps.tswaut where AUTRRNBEP = '023800063820';

--pruebas mejora mastercard

select * from mastercard.mastrndta where MCFECREAL = '20201013';

select * from mastercard.masctldta;

select * from gxbdbps.TCOCAT;

select * from libdebito.drconbep where lfectr = '20210114' and lcodbc = 'VSA' order by lhortr desc;

select * from visa.vistrndta where VIRRNBEPSA in (select lerrnb from libdebito.drconbep where lfectr = '20210114' and lcodbc = 'VSA' order by lhortr desc);

select * from visa.visctldta where VIRRNBEPSA in (select lerrnb from libdebito.drconbep where lfectr = '20210114' and lcodbc = 'VSA' order by lhortr desc);

select * from libdebito.drconbep where lfectr = '20210114' and LERRNB = '101400085093' order by lhortr desc;

select * from visa.visctldta where;

select * from libdebito.drconbep where lerrnb = '101400085064';

select * from gxbdbps.tswaut where AUTRRNBEP = '101400085064';

select * from mastercard.masctldta where MCRRNBEPSA = '101400085064';

select * from mastercard.mastrndta where MCRRNBEPSA = '101400085064';

--12157 - Mejora de manejo de mensajes simultaneo, MC Emision
select * from libdebito.drconbep where lfectr = '20210203' and lcomtr = 'Computer Software      VegasNV';

select lnrtar TARJETA, lcodbc MARCA, lhisor ORIGEN_TRX, lhisde DESTINO_TRX, lfectr FECHA, lhortr HORA, limpgs IMPORTE, lcomtr COMERCIO, lerrnb REFERENCIA from libdebito.drconbep where lfectr = '20210203' and lcomtr = 'Computer Software      VegasNV' and lcretr = '00' and lesttr = 'A';
select autbinadq BIN_ADQUIRENTE, autbinemi BIN_EMISOR, autcomraz COMERCIO, autmartar MARCA, autprotar PRODUCTO, autpannro TARJETA, autrolbep ROL, autrrnbep REFERENCIA from gxbdbps.tswaut where AUTRRNBEP in (
select LERRNB from libdebito.drconbep where lfectr = '20210203' and lcomtr = 'Computer Software      VegasNV' and lcretr = '00' and lesttr = 'A');


select * from libdebito.drconbep where lfectr = '20210318' and LHORTR > '163000' and lbinpr = '456976'

select * from gxbdbps.tdcliente where tdclinrodoc in ('5474576');
select * from gxbdbps.tdcliented where tdbinentid = '1020' and tdclinrodoc in ('A457902','B577195');
select * from gxbdbps.tdemnotar where nectanro in ('0000006601774266');
select * from gxbdbps.tdemisnov WHERE tdctanro in ('6601774266');
select * from gxbdbps.tdemis where tdctanro in ('6601774266');
select * from gxbdbps.tdctaad where tdctanro in ('1504788845');
select * from gxbdbps.tdcta where tdctanro in ('1504788845');
select * from gxbdbps.atdemis where aecta in ('1504788845');

    --codigos de respuesta
select codnro CODIGO, codmar MARCA, coddes DESCRIPCION from LIBDEBITO.TBCRET0P where codnro = '75';

select * from libdebito.drconbep where lfectr = '20210323' and LHORTR > '102000' order by lhortr desc;

select lctaor CUENTA_OR, lctade CUENTA_DE, lnrtar NUMERO_TARJETA, lbinpr BIN, lcodbc MARCA, lfectr FECHA_TRX, lhortr HORA, limpgs IMPORTE, lsaltr SALDO_TRX, lcuota CUOTAS,
lcodtr COD_TRX, lcautr COD_AUTORIZACION, lcretr COR_RETORNO, lesttr ESTADO_TRX, lerrnb RRN, lcotel NUMERO_TELEFONO, lenemi ENTIDAD 
from libdebito.drconbep where lbinpr = '456976' and lfectr = '20210323' and lhortr > '105000' and lhortr < '105600' order by lhortr desc;

select *from libdebito.drconbep where lbinpr = '456976' and lfectr = '20210323' and lhortr > '105000' and lhortr < '105600' order by lhortr desc;

select * 
from gxbdbps.tdemis where TDBINNRO = '456976' and tdemfecexp = '202410';

select tdbinentid ENTIDAD, tdbinnro BIN, tdctanro CUENTA, tdemfecexp EXPIRA_EL, tdemest ESTADO, tdestid IDENTIFICADOR 
from gxbdbps.tdemis where TDBINNRO = '456976' and tdemfecexp = '202410';



