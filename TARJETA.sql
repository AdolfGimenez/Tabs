select * from libdebito.tgembhaf  WHERE CRNOMB LIKE '%%' AND CRENTI='020';
SELECT * FROM LIBDEBITO.TGEMBHAF WHERE CRDOCU='5847311' AND CRENTI='021';  -- 7030200103081669  -- 6274311550000274
SELECT * FROM GXBDBPS.TMTARAF WHERE CENUMDO='4823150'
SELECT * FROM GXBDBPS.TMCTAAF WHERE MCNUMDO='4823150';
SELECT * FROM GXBDBPS.DRMAEAF WHERE AKAENB = '4823150'
--UPDATE GXBDBPS.DRMAEAF SET AKAENB = '5729555' WHERE AKAENB = '572955';
SELECT * FROM LIBDEBITO.EMBNOVHST WHERE CRDOCU='4918100'
select * from libdebito.bdcard0p where tecard='6274311550000274'
SELECT * FROM GXBDBPS.TEMBSAF where BSNUMTA='6274311550000274'
--------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT MCEMISO EMISOR, MCNUMDO CI_NRO, MCNUMDO CTA_NRO, MCNUMTA TARJETA, CRNOMB NOMBRE, MCSALFI SALDO_ANTERIOR, MCDISCO SALDO_ACTUAL, MCFEUPG FECHA_ULT_PAGO, MCUPAGO ULT_PAGO
FROM GXBDBPS.TMCTAAF 
JOIN LIBDEBITO.EMBNOVHST ON CRDOCU=MCNUMDO AND CRENTI=MCEMISO AND CRBINE=MCBINES AND CRTARJ=MCNUMTA AND CRNROC=MCNUMCT
WHERE  MCNUMDO='4918100' AND MCEMISO='155' --AND --AND  --AND MCFEUPG='20210706'; AND MCNUMTA ='6274311460131243'
GROUP BY MCEMISO,MCNUMDO,MCNUMDO,MCNUMTA,CRNOMB,MCSALFI,MCDISCO,MCFEUPG,MCUPAGO
--------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM GXBDBPS.tdCta WHERE TDBINENTID='1020' AND TDCTATAR LIKE '4569760000239834%';
SELECT * FROM GXBDBPS.TdCtaAd WHERE TDBINENTID='1020';
SELECT * FROM GXBDBPS.TdEmis WHERE TDBINENTID='1020';
SELECT * FROM GXBDBPS.TdEmisNov WHERE TDBINENTID='1020';
SELECT * FROM GXBDBPS.TdEmNoTar WHERE NEENTID='1020' AND Nenrotarj like '%4569760000239834%'

--------------------------CASO CONSULTA DE SALDO CIBERSONS--------------------------
SELECT --*
LFCOTR FECHA_CIAL, LFECTR FECHA_REAL, LHORTR HORA, LIDCOM COD_COM, LCOMTR COMERCIO, SUBSTR(LNRTAR,1,6) || 'XXXXXX' ||SUBSTR(LNRTAR,13,4) TARJETA, LCODBC MARCA, LIMPGS IMPORTE, LCRETR RETORNO,
LESTTR ESTADO, LCAUTR AUTORIZACION, LERRNB REFERENCIA, LIDTRA ID_TRX, LCODTR COD_TRX, TXDTRX TIPO_TRX, LCORED RED, LCOTEL LINEA_ORIGEN, LNTOKE LINEA_DESTINO, LECA62 DISPOSITIVO, LACTFJ ACT_FIJO, LENEMI EMISOR, LSALTR, LDISTR
FROM LIBDEBITO.DRCONBEP
INNER JOIN LIBDEBITO.TBCTRA0P ON (TXCTRX=LCODTR)
--WHERE LCOTEL='0981895330'
WHERE LNRTAR='7030200604061461' 
--AND LCODTR='304010' --COD TRX CONSULTA SALDO CIBERSON
--AND LCODTR='324000' --AVISO COBRO SALARIO
ORDER BY LFECTR DESC, LHORTR DESC;

SELECT * FROM LIBDEBITO.LINPORTA WHERE LNUMER LIKE '%981449846%'
SELECT * FROM GXBDBPS.BST014 WHERE BS14RRN='103538548888'
------------------------------------------------------------------DINELCO MOVIL---------------------------------------------------------------------------------------------------------
SELECT * FROM GXDEBITO.TGENVMSG--TGENVMSG
SELECT * FROM GXDEBITO.TGENVMSGH WHERE AM1CIP LIKE '%657296'
select * from gxdebito.TGSVBEP WHERE CLIENTMV LIKE '%981449846%'--'%983641376%' -- TABLA DINELCO MOVIL
--NUEVAS TABLAS - REINGENIERIA - DINELCO MOVIL--
select * from gxswtdta.tdmserv; -- descripcion de tipo servicio
select * from gxswtdta.tdmenser;
select * from gxswtdta.tdmacbnf;
select * from gxswtdta.TDMPRSRV WHERE PRSRTEL = '0971909065'; --TABLA DINELCO MOVIL NUEVA
select * from gxswtdta.TDMTXSRV;
select * from gxswtdta.TDMAUD;
select * from gxswtdta.TDMAUDDT;
SELECT --*
LFCOTR FECHA_CIAL, LFECTR FECHA_REAL, LHORTR HORA, LIDCOM COD_COM, LCOMTR COMERCIO, SUBSTR(LNRTAR,1,6) || 'XXXXXX' ||SUBSTR(LNRTAR,13,4) TARJETA, LCODBC MARCA, LIMPGS IMPORTE, LCRETR RETORNO,
LESTTR ESTADO, LCAUTR AUTORIZACION, LERRNB REFERENCIA, LIDTRA ID_TRX, LCODTR COD_TRX, TXDTRX TIPO_TRX, LECA62 DISPOSITIVO, LACTFJ ACT_FIJO, LCORED RED, LCOTEL LINEA_ORIGEN, LNTOKE LINEA_DESTINO, LENEMI EMISOR, LSALTR, LDISTR
FROM LIBDEBITO.DRCONBEP
INNER JOIN LIBDEBITO.TBCTRA0P ON (TXCTRX=LCODTR)
WHERE LCODTR='304010' AND LCOTEL='0976843370' --AND LFECTR='20210629' --- CONSULTA DE SALDO CIBERSONS
ORDER BY LFECTR DESC, LHORTR DESC;
SELECT * FROM LIBDEBITO.LINPORTA WHERE LNUMER LIKE '%981131090%'
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
- TABLA DINELCO MOVIL - VIEJO -- 138344 reg
SELECT ID, CLIENTID CI_NRO, CLIENTMV CEL_NRO, CLIENTUP FECHA_ALTA, COMPMIN COMPRA_MIN, PAGFACT PAGO_FACT, CONSSAL CONS_SALDO, SMSTRAN SMS_TRX, UPUSER USER_ALTA, /*TGSVEND VENDEDOR,*/ FECMODI FECHA_MODIF, USERMO USER_MODIF
FROM GXDEBITO.TGSVBEP
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
- TABLA DINELCO MOVIL - NUEVO -- 85792 reg
SELECT PRSRDOC DOC_NRO, a.SERVID ID_SERVICE, b.SERVDESC DESCRIP_SERVICE, ENSERENT ENTIDAD, /*PRSRTRJ TARJETA,*/ PRSRADH ADHERENCIA, PRSRTEL TELF, PRSRESTR, PRSRESTS ESTADO, PRSRFCHA FECHA, PRSRUSM USER_MODIF, PRSRFCHM FECHA_MODIF
FROM GXSWTDTA.TDMPRSRV a
INNER JOIN gxswtdta.tdmserv b ON b.SERVID=a.SERVID
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	SELECT ID, CLIENTID CI_NRO, CLIENTMV CEL_NRO, CLIENTUP FECHA_ALTA, COMPMIN COMPRA_MIN, PAGFACT PAGO_FACT, CONSSAL CONS_SALDO, SMSTRAN SMS_TRX, UPUSER USER_ALTA,
	FECMODI FECHA_MODIF, USERMO USER_MODIF, a.SERVID ID_SERVICE, b.SERVDESC DESCRIP_SERVICE, ENSERENT ENTIDAD, PRSRESTS ESTADO, PRSRFCHA FECHA, PRSRUSM USER_MODIF, PRSRFCHM FECHA_MODIF, SUBSTR(PRSRTRJ,1,6) || 'XXXXXX' ||SUBSTR(PRSRTRJ,13,4) TARJETA
	FROM GXDEBITO.TGSVBEP x
	LEFT JOIN GXSWTDTA.TDMPRSRV a ON PRSRDOC=CLIENTID AND CLIENTMV=PRSRTEL
	LEFT JOIN gxswtdta.tdmserv b ON b.SERVID=a.SERVID
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM LIBDEBITO.TGEMBHAF
SELECT * FROM GXBDBPS.GCLIEAF WHERE CENUMDO='4918100'
SELECT * FROM GXBDBPS.THMOVAF WHERE HMEMISO='164' AND HMCODIG='529'; 
SELECT * FROM GXBDBPS.TMOVIAF WHERE MVEMISO='164' AND CMCODIG='529' 
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT HMFEPRO FECHA, SUBSTR(HMNUMTA,1,6) || 'XXXXXX' ||SUBSTR(HMNUMTA,13,4) TARJETA_NRO, HMNUMCT CUENTA_NRO, HMIMPO2 IMPORTE, HMNOMCO DESCRIPCION, CRNOMB NOMBRE, CRDOCU DOC_NRO
FROM GXBDBPS.THMOVAF 
INNER JOIN LIBDEBITO.TGEMBHAF ON CRTARJ=HMNUMTA AND CRENTI=HMEMISO 
WHERE HMEMISO='164' AND HMCODIG='529' 
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT MVFEPRO FECHA, SUBSTR(MTNUMTA,1,6) || 'XXXXXX' ||SUBSTR(MTNUMTA,13,4) TARJETA_NRO, MVNUMCT CUENTA_NRO, MVIMPO2 IMPORTE, MVNOMCO DESCRIPCION, CRNOMB NOMBRE, CRDOCU DOC_NRO
FROM GXBDBPS.TMOVIAF 
INNER JOIN LIBDEBITO.TGEMBHAF ON CRTARJ=MTNUMTA AND CRENTI=MVEMISO 
WHERE MVEMISO='164' AND CMCODIG='529' 
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT HMFEPRO FECHA, SUBSTR(HMNUMTA,1,6) || 'XXXXXX' ||SUBSTR(HMNUMTA,13,4) TARJETA_NRO, HMNUMCT CUENTA_NRO, HMIMPO2 IMPORTE, HMNOMCO DESCRIPCION, CRNOMB NOMBRE, CRDOCU DOC_NRO, CEEMPRE EMPRESA
FROM GXBDBPS.THMOVAF 
INNER JOIN LIBDEBITO.TGEMBHAF b ON b.CRTARJ=HMNUMTA AND b.CRENTI=HMEMISO 
INNER JOIN GXBDBPS.GCLIEAF c ON c.CENUMDO=b.CRDOCU AND c.ENEMISO=b.CRENTI
WHERE HMEMISO='164' AND CEEMPRE LIKE '%PEDIDOS YA%' AND HMCODIG='529' 
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT MVFEPRO FECHA, SUBSTR(MTNUMTA,1,6) || 'XXXXXX' ||SUBSTR(MTNUMTA,13,4) TARJETA_NRO, MVNUMCT CUENTA_NRO, MVIMPO2 IMPORTE, MVNOMCO DESCRIPCION, CRNOMB NOMBRE, CRDOCU DOC_NRO, CEEMPRE EMPRESA
FROM GXBDBPS.TMOVIAF 
INNER JOIN LIBDEBITO.TGEMBHAF b ON CRTARJ=MTNUMTA AND CRENTI=MVEMISO
INNER JOIN GXBDBPS.GCLIEAF c ON c.CENUMDO=b.CRDOCU AND c.ENEMISO=b.CRENTI
WHERE MVEMISO='164' AND CEEMPRE LIKE '%PEDIDOS YA%' AND CMCODIG='529' 
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CASES 

[15:36] Maria Veronica Ovelar
    (CASE WHEN lmontr = '600' THEN 'GUARANIES' ELSE 'DOLARES' END )
[15:37] Maria Veronica Ovelar
    (CASE WHEN LPOSEM in ('9010','9020','910','920') THEN 'BANDA MAGNETICA'  WHEN LPOSEM = '0510' THEN 'CHIP' WHEN LPOSEM = '0710' THEN 'CONTACLESS' else 'VACIO' END


select MTNUMTA,MTFEVEN,MTFEVE2,MTESTVE from gxbdbps.tmtaraf where mtnumta in ('6274311630015441');
update gxbdbps.tmtaraf set MTFEVEN=2408,MTFEVE2=0, MTESTVE = '' where mtnumta in ('6274311630015441');