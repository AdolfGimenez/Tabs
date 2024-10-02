VERIFICACION DE ESTADOS DE TARJETAS - GXBDBPS
TMTARAF - credito 
TDEMIS - Debito 
TDCTAAD - DOC,CTA,NOMBRE
TEMBSAF - Credito
ATDEMIS - historico de estado debito
dsply

--------*********REINGENIERIA********----------------
TATAuD -- Auditoria Debito Cabecera
TATADD -- Auditoria Detalle Debito
TATAuC -- Auditoria Cuenta
TATADC -- Auditoria Detalle Cuenta
TATAuT -- Auditoria Tarjeta
TATADT -- Auditoria Detalle Tarjeta

-----------------------------------------*************************Comandos AS400**********************------------------------------
WRKDSKSTS
WRKSYSSTS - ESTADO DE MEMORIA

---------------------------------------**********Campo 63 - MTS *************-------------------------------------------------------
Se busca por numero de referencia
SELECT * FROM MASTERCARD.MASTRNDTA m WHERE MCFLD037 = '209146680429';
SELECT * FROM MASTERCARD.MASCTLDTA m WHERE MC037 = '209146680429' AND MC002 like '%60163723638877260%';

------------------**************PIN OLVIDADO*****************----------------------------------

SELECT * FROM  GXBDBPS.tswotp
WHERE OTPPANNRO IN ('4569760000235113', '2306710001107425')

SELECT * FROM GXBDBPS.tswotphis 
WHERE HISPANNRO='4569760000235113'

------------------*****Transacciones en linea****----------------------------------------------
select * from gxopera.opliqui where OPFECLIQ >='20220101' and opstat not in ('00','77','88') and opstatob not in ('00','77','88')
and OPSTAT like '96%'
or OPMENSAJ like '96%'
order by opidliq desc