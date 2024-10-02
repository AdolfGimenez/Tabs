WITH mastercard AS (
SELECT
w.AUTCODCOMB ,
w.AUTCOMRAZ ,
SUBSTR(w.AUTPANNRO, 1, 6) "BIN",
w.AUTTIPTAR,
IFNULL(
      (SELECT b.BINIDPRODU 
       FROM GXTRJDTA.TDGBIN b 
       WHERE SUBSTR(w.AUTPANNRO, 1, 6) = SUBSTR(b.BINNROBIN, 1, 6)
      LIMIT 1 
      ), 'X') "PRODUCTO", 
w.AUTCOMMCC, 
c.LOCODI,   
  
CAST(SUM(w.AUTMONTORI) AS DEC(15, 2)) "Monto Origen",
CAST(SUM(w.AUTMONCOM ) AS DEC(15, 2)) "Monto Comision" 

FROM LIBCLEA.TSWAUT w, GXBDBPS.COMAEAF c 
WHERE w.AUTMARTAR ='MST' AND
      w.AUTCODRET='00'   AND
      w.AUTCODCOMB=c.COCOMER 
GROUP BY w.AUTCODCOMB, w.AUTCOMRAZ , w.AUTTIPTAR,   SUBSTR(w.AUTPANNRO, 1, 6),  
IFNULL(
      (SELECT b.BINIDPRODU 
       FROM GXTRJDTA.TDGBIN b 
       WHERE SUBSTR(w.AUTPANNRO, 1, 6) = SUBSTR(b.BINNROBIN, 1, 6)
      LIMIT 1 
      ), 'X'),
w.AUTCOMMCC,
c.LOCODI  
 
ORDER BY 1, 4, 5 DESC)
SELECT 
AUTCODCOMB ,
AUTCOMRAZ ,
 "BIN", 
 AUTTIPTAR,
 "PRODUCTO", 
AUTCOMMCC, 
LOCODI,
(IFNULL((SELECT 
         r.RUCODI
         FROM GXBDBPS.CORUBAF r
         WHERE r.RUMCC =AUTCOMMCC
         LIMIT 1), '00'))  "RUBRO" ,
"Monto Origen",
"Monto Comision"  
 FROM mastercard 
ORDER BY 1, 3, 4

-- Tabla de comercios con adquirencia MC 
--select * from gxbdbps.coma3af  
--where destcod='530' and destact='S'
-- Tabla de comercios con sus comisiones MC 
---select * from gxbdbps.comaexd
--where ccmarca='MST'
--select * from gxbdbps.comaext where bpssrvcod='1'
--select * from gxtrjdta.tdgbin where substr(binnrobin,1,1)='5'
