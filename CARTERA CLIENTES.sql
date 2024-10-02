select A.cocomer codigo, codeno denominacion, (CASE WHEN costat = '0' then 'ACTIVO'
WHEN COSTAT = '3' THEN 'SUSPENDIDO' WHEN COSTAT = '90' THEN 'BAJA' END) estado,
corazo razonsocial, corucn ruc , 'CONTINENTAL BANCO' ENTIDADPAG, adnumcta cuenta , (case when ADTICTA = '0' then 'CUENTA CORRIENTE'
WHEN ADTICTA = '1' then 'CAJA DE AHORRO'
WHEN ADTICTA = '4' then 'SIPAP GNB' END ) TIPOCUENTA, CONOCTA NOMBRECUENTA, DPPNYA TITULARCUENTA, DPPNDC NRODOC
from gxbdbps.comaeaf A  LEFT JOIN GXBDBPS.TCODPP B ON A.COCOMER = B.COCOMER
where   enemiso = '057' and costat ='0'


















