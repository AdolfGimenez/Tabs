/*Favor Quitar marca de renovacion con cambio de vencimiento pendiente de activacion de la siguiente tarjeta a pedido de la entidad
N° Tarjeta 627431******2904
Nombre plástico LAURA M. RECALDE R.
Número de cuenta 020-11-058976/1
CI: 4830440
*/
SELECT MTFEVE2,t.* FROM  GXBDBPS.TMTARAF t WHERE CENUMDO='4830440' AND  MTNUMTA = '6274310212632904' ;

UPDATE
GXTRJDTA.TTCVTO
SET VTOUSUENTR = CURRENT USER ,
VTOESTADO = 'E',
VTOFECENTR = '20250430',
VTOOBSERVA = 'Segun redmine 93050'
-- SELECT * FROM GXTRJDTA.TTCVTO
WHERE VTONROTRJ='6274310212632904' AND VTOSECUE=1;

UPDATE GXBDBPS . TMTARAF
SET
MTFEVE2 = '0'
WHERE MTNUMTA = '6274310212632904' ;

paso 2 hacer update del tocaux 1 registro

SELECT * FROM GXTRJDTA.TCOAUX t WHERE date(AUXFEHO) = '2024-12-11'  AND AUXEST = 'N' AND AUXCLAV = '6274310212632904'

UPDATE GXTRJDTA.TCOAUX t
SET AUXEST = 'P'
--SELECT * FROM GXTRJDTA.TCOAUX t
WHERE date(AUXFEHO) = '2025-04-30'  AND AUXEST = 'N' AND AUXCLAV = '6274310212632904'
