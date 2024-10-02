select distinct(precotrx) from GXFINDTA.TCLPRE order by precotrx desc;

select * from GXFINDTA.TCLPRE order by precotrx desc;

/**query para obtener los datos de los servicios segun tipo de transaccion, codigo de comercio, etc.*/
select
varchar_format(CURRENT DATE,'YYYYMMDD') lastUpdateDate,
c.cocomer commerceId,
p.PREMATRX processingCode,
p.PREDISP terminalType,
m.MARCODMAR brand,
case when m.MARHABILI = 'S' AND s.SERHABILI = 'S' then 'ACTIVE' else 'INACTIVE' end status,
p.PRECODI prestationCode,
p.PREDESC prestationDescription,
a.SERCODI serviceCode,
a.SERDESC serviceDescription,
p.PREFPGO paymentMethod,
case when p.PREFPGO = 'EF' then 'EFECTIVO' else 'TARJETA' end paymentMethodDescription,
d.PROIDPRODU product,
d.PRODSPRODU productDescription,
p.PRECLEA prestationType
from GXFINDTA.tcocna c
left JOIN GXFINDTA.TCMMAR m ON c.CLICLICOD = m.CLICLICOD and c.SUCSUCCOD = m.SUCSUCCOD
left JOIN GXFINDTA.TCMSER s ON c.CLICLICOD = s.CLICLICOD and c.SUCSUCCOD = s.SUCSUCCOD
left JOIN GXFINDTA.TCLPRE p ON s.SERCODI = p.SERCODI
left JOIN GXTRJDTA.TDGPRO d ON p.PREPROD = d.PROIDPRODU
left JOIN GXFINDTA.TCLSER a ON s.SERCODI = a.SERCODI
where c.COCOMER = ? and p.PREDISP = ? and p.PREMATRX = ? and m.MARCODMAR = ?