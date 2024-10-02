Select movfpro,movftrx fechatrx,  movrrnbep nrotransaccion, (CASE WHEN movtpta = 'D' THEN 'DEBITO' ELSE 'CREDITO' END)  tipotarjeta, movcoau Autorizacion, movdesem Emisor,
substr(movntar,1,6)||'XXXXXX'||substr(movntar,13,4) tarjeta,
movmarc marca, 1 cuotas, '600' moneda,  movcoam origen, movcomer codsucursal, movdeno sucursal, a.sercodi tipo, movcodpr procesadora,
movcodis dispositivo, movesta estado, movidlt nroresumen, movimpo importe, (OPCOMENT+OPCOMBPS) COMISION, (OPIVAENT+OPIVABPS) IVACOMISION, OPRENTA RENTA, OPREIVA IVARENTA, (OPMONTO-OPCOMENT-OPCOMBPS-OPIVAENT-OPIVABPS-OPRENTA-OPREIVA) NETO,
MOVCDBCC CODBANCO, movctbcc CTABANCO, MOVCOCO PORCENCOMISION, substr(cast(varchar(tsbfeac) as char(10)),1,4)||substr(cast(varchar(tsbfeac) as char(10)),6,2)||substr(cast(varchar(tsbfeac) as char(10)),9,2) fechaacreditacion, (CASE WHEN MOVPGON= 'O'  THEN 'LINEA' WHEN  MOVPGON= 'B' THEN 'LOTE' ELSE 'PENDIENTE' END) TIPOOPERACION, tsbnref REF_EXTRACTO, tsbnref ref_bepsa
from gxfindta.tclmov a
inner join gxopera.opmovi b on movrrnbep = opnoref and MOVFPRO = OPFECOM and opstatus = 'A'
left join gxfindta.tcltsb c on movrrnbep = tsbnref and tsbtpop = '01'
--WHERE  substr(movfpro,1,4) = YEAR(NOW())
--and substr(movfpro,5,2) =  MONTH (now())
--AND substr(movfpro,7,2) between day(now()- 15 days) and  day (now())
--SUBSTR(movfpro,1,4)||'-'||SUBSTR(movfpro,5,2)||'-'||SUBSTR(movfpro,7,2) = YEARWEEK(date)
where movfpro BETWEEN '20220801' AND '20220831'
--where substr(movfpro,7,2) between day(now()- 4 days) and  day (now())
and movpgon = 'O'
and movruc = '80089348-4'
and movesta = 'A'
--and openemi in ('021','176')
UNION
/*Transacciones Reversadas Online*/
Select movfpro,movftrx fechatrx,  movrrnbep nrotransaccion, (CASE WHEN movtpta = 'D' THEN 'DEBITO' ELSE 'CREDITO' END)  tipotarjeta, movcoau Autorizacion, movdesem Emisor, substr(movntar,1,6)||'XXXXXX'||substr(movntar,13,4) tarjeta,
movmarc marca, 1 cuotas, '600' moneda,  movcoam origen, movcomer codsucursal, movdeno sucursal, a.sercodi tipo, movcodpr procesadora,
movcodis dispositivo, movesta estado, movidlt nroresumen, movimpo importe, (OPCOMENT+OPCOMBPS) COMISION, (OPIVAENT+OPIVABPS) IVACOMISION, OPRENTA RENTA, OPREIVA IVARENTA, (OPMONTO-OPCOMENT-OPCOMBPS-OPIVAENT-OPIVABPS-OPRENTA-OPREIVA) NETO,
MOVCDBCC CODBANCO, movctbcc CTABANCO, MOVCOCO PORCENCOMISION, substr(cast(varchar(tsbfeac) as char(10)),1,4)||substr(cast(varchar(tsbfeac) as char(10)),6,2)||substr(cast(varchar(tsbfeac) as char(10)),9,2) fechaacreditacion, (CASE WHEN MOVPGON= 'O'  THEN 'LINEA' WHEN  MOVPGON= 'B' THEN 'LOTE' ELSE 'PENDIENTE' END) TIPOOPERACION, tsbnref REF_EXTRACTO, tsbnref ref_bepsa
from gxfindta.tclmov a
inner join gxopera.opmovi b on movrrnbep = opnoref and MOVFPRO = OPFECOM and opstatus = 'E'
left join gxfindta.tcltsb c on movrrnbep = tsbnref and tsbtpop = '03'
--WHERE SUBSTR(movfpro,1,4)||'-'||SUBSTR(movfpro,5,2)||'-'||SUBSTR(movfpro,7,2) = DATE(CURDATE()- 1 days)
where movfpro BETWEEN '20220801' AND '20220831'  
--where substr(movfpro,7,2) between day(now()- 15 days) and  day (now())
and movpgon = 'O' and  movruc = '80089348-4'
and movesta = 'R'
UNION
/*Transacciones Aprobadas Batch <> Red de pagos*/
Select movfpro,movftrx fechatrx,  movrrnbep nrotransaccion, (CASE WHEN movtpta = 'D' THEN 'DEBITO' ELSE 'CREDITO' END)  tipotarjeta, movcoau Autorizacion, movdesem Emisor, substr(movntar,1,6)||'XXXXXX'||substr(movntar,13,4) tarjeta,
movmarc marca, 1 cuotas, '600' moneda,  movcoam origen, movcomer codsucursal, movdeno sucursal, a.sercodi tipo, movcodpr procesadora,
movcodis dispositivo, movesta estado, movidlt nroresumen,(Case when sercodi = 'DINEFE' THEN (OPMONTO-OPCOMENT-OPCOMBPS-OPIVAENT-OPIVABPS-OPRENTA-OPREIVA) ELSE movimpo END) importe, (CASE WHEN sercodi = 'DINEFE' THEN 0 ELSE (OPCOMENT+OPCOMBPS)END) COMISION,
(CASE WHEN sercodi = 'DINEFE' THEN 0 ELSE (OPIVAENT+OPIVABPS)END) IVACOMISION, OPRENTA RENTA, OPREIVA IVARENTA, (OPMONTO-OPCOMENT-OPCOMBPS-OPIVAENT-OPIVABPS-OPRENTA-OPREIVA) NETO,
MOVCDBCC CODBANCO, movctbcc CTABANCO, MOVCOCO PORCENCOMISION, movfcre fechaacreditacion, 'LOTE' TIPOOPERACION, opcreref REF_EXTRACTO, MOVIDLT ref_bepsa
from gxfindta.tclmov a
inner join gxopera.opmovi b on movrrnbep = opnoref and MOVFPRO = OPFECOM
left join gxopera.oplicre c on movfpro = opcrefcom and movcomer = opcrecom
--WHERE SUBSTR(movfpro,1,4)||'-'||SUBSTR(movfpro,5,2)||'-'||SUBSTR(movfpro,7,2) = DATE(CURDATE()- 1 days)
where movfpro BETWEEN '20220801' AND '20220831'
--where substr(movfpro,7,2) between day(now()- 15 days) and  day (now())   
and movpgon = 'B' and   movruc = '80089348-4'
AND SERCODI <> 'REDPAG'
UNION
/*Transacciones Aprobadas Batch = Red de pagos*/
Select movfpro,movftrx fechatrx,  movrrnbep nrotransaccion, (CASE WHEN movtpta = 'D' THEN 'DEBITO' ELSE 'CREDITO' END)  tipotarjeta, movcoau Autorizacion, movdesem Emisor, substr(movntar,1,6)||'XXXXXX'||substr(movntar,13,4) tarjeta,
movmarc marca, 1 cuotas, '600' moneda,  movcoam origen, movcomer codsucursal, movdeno sucursal, a.sercodi tipo, movcodpr procesadora,
movcodis dispositivo, movesta estado, movidlt nroresumen,  (Case when sercodi = 'REDPAG' THEN OPMONTO  ELSE movimpo END) importe, (CASE WHEN sercodi = 'REDPAG' THEN 0 ELSE (OPCOMENT+OPCOMBPS)END) COMISION, (CASE WHEN sercodi = 'REDPAG' THEN 0 ELSE (OPIVAENT+OPIVABPS)END) IVACOMISION, OPRENTA RENTA, OPREIVA IVARENTA, OPMONTO NETO,
MOVCDBCC CODBANCO, movctbcc CTABANCO, MOVCOCO PORCENCOMISION, movfcre fechaacreditacion, 'LOTE' TIPOOPERACION, opcreref REF_EXTRACTO, MOVIDLT ref_bepsa
from gxfindta.tclmov a
inner join gxopera.opmovi b on movrrnbep = opnoref and MOVFPRO = OPFECOM
left join gxopera.oplicre c on movfpro = opcrefcom and movcomer = opcrecom
--WHERE SUBSTR(movfpro,1,4)||'-'||SUBSTR(movfpro,5,2)||'-'||SUBSTR(movfpro,7,2) = DATE(CURDATE()- 1 days)
where movfpro BETWEEN '20220801' AND '20220831'
--where substr(movfpro,7,2) between day(now()- 15 days) and  day (now())  
and movpgon = 'B' and  movruc = '80089348-4'
AND SERCODI = 'REDPAG'
