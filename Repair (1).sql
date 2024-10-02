TABLA FLICOM1
/*OBSERVACION CAMBIAR LA LIBRERIA YAPI*/
/*12/08/2022*/
--CREDITO
update yapi.FLICOM1 
set
  (LICANT, LIMONTO, LICOBPS, LIIVABPS,LIRENTA,LIREIVA,LINETO) 
  = 
  (SELECT  yapi.FLICOM1.LICANT - COUNT(*), yapi.FLICOM1.LIMONTO - SUM(movimpo), 
  			yapi.FLICOM1.LICOBPS - SUM(movimco), yapi.FLICOM1.LIIVABPS - SUM(movivco),
			yapi.FLICOM1.LIRENTA - SUM(movrent), yapi.FLICOM1.LIREIVA - SUM(movivren), 
			yapi.FLICOM1.LINETO - SUM(movimpo - movimco- movivco - movrent - movivren) 
	FROM yapi.tclmov inner join yapi.opmovi on movrrnbep = opnoref 
	where movfpro =  '20220812' 
	and yapi.FLICOM1.LICOMER =  yapi.opmovi.OPCOMER AND yapi.FLICOM1.LIFECHD =  yapi.opmovi.OPFECOM  
	AND  movmarc in ('VSA','MST') and movtpta = 'D' and optiptar = 'CRE' AND OPSTATUS ='A' 
	and movcodis <> 'ATM'
	GROUP BY MOVCOMER, MOVFPRO , MOVFPRO, OPCODTRN,  MOVFTRX , MOVTPTA)
where
 LIFECHD = '20220812' AND LICODTR = '000054'  AND LITIPTAR = 'CRE' 
AND LICOMER IN (SELECT DISTINCT OPCOMER
FROM YAPI.tclmov inner join YAPI.opmovi on movrrnbep = opnoref 
where MOVFTRX  =  '20220812' 
and movmarc in ('VSA','MST') and movtpta = 'D' and optiptar = 'CRE' AND OPSTATUS ='A' 
and movcodis <> 'ATM' )

--DEBITO
update yapi.FLICOM1 
set
  (LICANT, LIMONTO, LICOBPS, LIIVABPS,LIRENTA,LIREIVA,LINETO) 
  = 
  (SELECT  yapi.FLICOM1.LICANT + COUNT(*), yapi.FLICOM1.LIMONTO + SUM(movimpo), 
  			yapi.FLICOM1.LICOBPS + SUM(movimco), yapi.FLICOM1.LIIVABPS + SUM(movivco),
			yapi.FLICOM1.LIRENTA + SUM(movrent), yapi.FLICOM1.LIREIVA + SUM(movivren), 
			yapi.FLICOM1.LINETO + SUM(movimpo - movimco - movivco - movrent - movivren ) 
	FROM yapi.tclmov inner join yapi.opmovi on movrrnbep = opnoref 
	where movfpro =  '20220812'  
	and yapi.FLICOM1.LICOMER =  yapi.opmovi.OPCOMER AND yapi.FLICOM1.LIFECHD =  yapi.opmovi.OPFECOM  
	AND  movmarc in ('VSA','MST') and movtpta = 'D' and optiptar = 'CRE' AND OPSTATUS ='A' 
	and movcodis <> 'ATM'
	GROUP BY MOVCOMER, MOVFPRO , MOVFPRO, OPCODTRN,  MOVFTRX , MOVTPTA)
	where
 	LIFECHD = '20220812' AND LICODTR = '000054' AND LITIPTAR = 'DEB'
 	AND LICOMER IN (SELECT DISTINCT LICOMER FROM yapi.flicom1 WHERE LIFECHD = '20220812' AND LITIPTAR = 'DEB' AND LICODTR = '000054'
		AND LICOMER IN (SELECT OPCOMER FROM yapi.tclmov inner join yapi.opmovi on movrrnbep = opnoref 
		where movfpro = '20220812' 
		and movmarc in ('VSA','MST') and movtpta = 'D' and optiptar = 'CRE' AND OPSTATUS ='A'
		and movcodis <> 'ATM'));

/*INSERT DE TRANSACCIONES FALTANTES*/
INSERT INTO yapi.FLICOM1 
(LICOMER,LIFECHD,LIFECHH,LICODTR,LIFECHA,LITIPTAR,LICANT,LIMONTO,LICOENT,LIIVAENT,LICOBPS,
LIIVABPS,LIRENTA,LIREIVA,LINETO,LINROINS,LIFECREDI,LINROFAC)
(SELECT MOVCOMER, MOVFPRO , MOVFPRO, OPCODTRN,  MOVFTRX , 'DEB' , COUNT(*), SUM(movimpo),0,0,SUM(movimco),SUM(movivco),0, 0,SUM(movimpo - movimco - movivco) ,0,'20220816',0
	FROM yapi.tclmov inner join yapi.opmovi on movrrnbep = opnoref 
	where movfpro =  '20220812' 
	and movmarc in ('VSA','MST') and movtpta = 'D' and optiptar = 'CRE' AND OPSTATUS ='A'
	and movcodis <> 'ATM' 
	AND OPCOMER NOT IN (SELECT LICOMER FROM yapi.flicom1 WHERE LIFECHD = '20220812' AND LITIPTAR = 'DEB' AND LICODTR = '000054'
						AND LICOMER IN (SELECT OPCOMER FROM yapi.tclmov inner join yapi.opmovi on movrrnbep = opnoref 
							where movfpro = '20220812' 
							and movmarc in ('VSA','MST') and movtpta = 'D' and optiptar = 'CRE' AND OPSTATUS ='A'
							and movcodis <> 'ATM'))
GROUP BY MOVCOMER, MOVFPRO , MOVFPRO, OPCODTRN,  MOVFTRX , MOVTPTA );


-- 13/08/2022


update YAPI.FLICOM1 
set
  (LICANT, LIMONTO, LICOBPS, LIIVABPS,LIRENTA,LIREIVA,LINETO) 
  = 
  (SELECT  YAPI.FLICOM1.LICANT - COUNT(*), YAPI.FLICOM1.LIMONTO - SUM(movimpo), 
  			YAPI.FLICOM1.LICOBPS - SUM(movimco), YAPI.FLICOM1.LIIVABPS - SUM(movivco),
			YAPI.FLICOM1.LIRENTA - SUM(movrent), YAPI.FLICOM1.LIREIVA - SUM(movivren), 
			YAPI.FLICOM1.LINETO - SUM(movimpo - movimco- movivco - movrent - movivren) 
	FROM yapi.tclmov inner join yapi.opmovi on movrrnbep = opnoref 
	where MOVFTRX = '20220813' 
	and yapi.FLICOM1.LICOMER =  yapi.opmovi.OPCOMER AND yapi.FLICOM1.LIFECHD =  yapi.opmovi.OPFECOM  
	AND  movmarc in ('VSA','MST') and movtpta = 'D' and optiptar = 'CRE' AND OPSTATUS ='A' 
	and movcodis <> 'ATM'
	GROUP BY MOVCOMER, MOVFPRO , MOVFPRO, OPCODTRN,  MOVFTRX , MOVTPTA)
where
 LIFECHD = '20220816' AND LICODTR = '000054' AND LIFECHA  = '20220813' AND LITIPTAR = 'CRE' 
AND LICOMER IN (SELECT DISTINCT OPCOMER
FROM YAPI.tclmov inner join YAPI.opmovi on movrrnbep = opnoref 
where MOVFTRX  =  '20220813' 
and movmarc in ('VSA','MST') and movtpta = 'D' and optiptar = 'CRE' AND OPSTATUS ='A' 
and movcodis <> 'ATM' );




/*PARA DEBITO*/


update yapi.FLICOM1 
set
  (LICANT, LIMONTO, LICOBPS, LIIVABPS,LIRENTA,LIREIVA,LINETO) 
  = 
  (SELECT  yapi.FLICOM1.LICANT + COUNT(*), yapi.FLICOM1.LIMONTO + SUM(movimpo), 
  			yapi.FLICOM1.LICOBPS + SUM(movimco), yapi.FLICOM1.LIIVABPS + SUM(movivco),
			yapi.FLICOM1.LIRENTA + SUM(movrent), yapi.FLICOM1.LIREIVA + SUM(movivren), 
			yapi.FLICOM1.LINETO + SUM(movimpo - movimco - movivco - movrent - movivren ) 
	FROM yapi.tclmov inner join yapi.opmovi on movrrnbep = opnoref 
	where MOVFTRX = '20220813' 
	and yapi.FLICOM1.LICOMER =  yapi.opmovi.OPCOMER AND yapi.FLICOM1.LIFECHD =  yapi.opmovi.OPFECOM  
	AND  movmarc in ('VSA','MST') and movtpta = 'D' and optiptar = 'CRE' AND OPSTATUS ='A' 
	and movcodis <> 'ATM'
	GROUP BY MOVCOMER, MOVFPRO , MOVFPRO, OPCODTRN,  MOVFTRX , MOVTPTA)
	where
 	LIFECHD = '20220816' AND LICODTR = '000054' AND LIFECHA  = '20220813' AND LITIPTAR = 'DEB'
 	AND LICOMER IN (SELECT DISTINCT LICOMER FROM yapi.flicom1 WHERE LIFECHD = '20220816' AND LITIPTAR = 'DEB' AND LICODTR = '000054' AND LIFECHA  = '20220813'
		AND LICOMER IN (SELECT OPCOMER FROM yapi.tclmov inner join yapi.opmovi on movrrnbep = opnoref 
		where MOVFTRX = '20220813' 
		and movmarc in ('VSA','MST') and movtpta = 'D' and optiptar = 'CRE' AND OPSTATUS ='A'
		and movcodis <> 'ATM'));


/*INSERT DE TRANSACCIONES FALTANTES*/
INSERT INTO yapi.FLICOM1 
(LICOMER,LIFECHD,LIFECHH,LICODTR,LIFECHA,LITIPTAR,LICANT,LIMONTO,LICOENT,LIIVAENT,LICOBPS,
LIIVABPS,LIRENTA,LIREIVA,LINETO,LINROINS,LIFECREDI,LINROFAC)
(SELECT MOVCOMER, MOVFPRO , MOVFPRO, OPCODTRN,  MOVFTRX , 'DEB' , COUNT(*), SUM(movimpo),0,0,SUM(movimco),SUM(movivco),0, 0,SUM(movimpo - movimco - movivco) ,0,'20220817',0
	FROM yapi.tclmov inner join yapi.opmovi on movrrnbep = opnoref 
	where MOVFTRX = '20220813' 
	and movmarc in ('VSA','MST') and movtpta = 'D' and optiptar = 'CRE' AND OPSTATUS ='A'
	and movcodis <> 'ATM' 
	AND OPCOMER NOT IN (SELECT LICOMER FROM yapi.flicom1 WHERE LIFECHD ='20220816' AND LITIPTAR = 'DEB' AND LICODTR = '000054' AND LIFECHA  = '20220813'
						AND LICOMER IN (SELECT OPCOMER FROM yapi.tclmov inner join yapi.opmovi on movrrnbep = opnoref 
							where MOVFTRX = '20220813' 
							and movmarc in ('VSA','MST') and movtpta = 'D' and optiptar = 'CRE' AND OPSTATUS ='A'
							and movcodis <> 'ATM'))
GROUP BY MOVCOMER, MOVFPRO , MOVFPRO, OPCODTRN,  MOVFTRX , MOVTPTA );



--14/08/2022

update yapi.FLICOM1 
set
  (LICANT, LIMONTO, LICOBPS, LIIVABPS,LIRENTA,LIREIVA,LINETO) 
  = 
  (SELECT  yapi.FLICOM1.LICANT - COUNT(*), yapi.FLICOM1.LIMONTO - SUM(movimpo), 
  			yapi.FLICOM1.LICOBPS - SUM(movimco), yapi.FLICOM1.LIIVABPS - SUM(movivco),
			yapi.FLICOM1.LIRENTA - SUM(movrent), yapi.FLICOM1.LIREIVA - SUM(movivren), 
			yapi.FLICOM1.LINETO - SUM(movimpo - movimco- movivco - movrent - movivren) 
	FROM yapi.tclmov inner join yapi.opmovi on movrrnbep = opnoref 
	where MOVFTRX = '20220814' 
	and yapi.FLICOM1.LICOMER =  yapi.opmovi.OPCOMER AND yapi.FLICOM1.LIFECHD =  yapi.opmovi.OPFECOM  
	AND  movmarc in ('VSA','MST') and movtpta = 'D' and optiptar = 'CRE' AND OPSTATUS ='A' 
	and movcodis <> 'ATM'
	GROUP BY MOVCOMER, MOVFPRO , MOVFPRO, OPCODTRN,  MOVFTRX , MOVTPTA)
where
 LIFECHD = '20220816' AND LICODTR = '000054' AND LIFECHA  = '20220814' AND LITIPTAR = 'CRE' 
AND LICOMER IN (SELECT DISTINCT OPCOMER
FROM YAPI.tclmov inner join YAPI.opmovi on movrrnbep = opnoref 
where MOVFTRX  =  '20220814' 
and movmarc in ('VSA','MST') and movtpta = 'D' and optiptar = 'CRE' AND OPSTATUS ='A' 
and movcodis <> 'ATM' );



/*PARA DEBITO*/

update yapi.FLICOM1 
set
  (LICANT, LIMONTO, LICOBPS, LIIVABPS,LIRENTA,LIREIVA,LINETO) 
  = 
  (SELECT  yapi.FLICOM1.LICANT + COUNT(*), yapi.FLICOM1.LIMONTO + SUM(movimpo), 
  			yapi.FLICOM1.LICOBPS + SUM(movimco), yapi.FLICOM1.LIIVABPS + SUM(movivco),
			yapi.FLICOM1.LIRENTA + SUM(movrent), yapi.FLICOM1.LIREIVA + SUM(movivren), 
			yapi.FLICOM1.LINETO + SUM(movimpo - movimco- movivco - movrent - movivren) 
	FROM yapi.tclmov inner join yapi.opmovi on movrrnbep = opnoref 
	where MOVFTRX = '20220814' 
	and yapi.FLICOM1.LICOMER =  yapi.opmovi.OPCOMER AND yapi.FLICOM1.LIFECHD =  yapi.opmovi.OPFECOM  
	AND  movmarc in ('VSA','MST') and movtpta = 'D' and optiptar = 'CRE' AND OPSTATUS ='A' 
	and movcodis <> 'ATM'
	GROUP BY MOVCOMER, MOVFPRO , MOVFPRO, OPCODTRN,  MOVFTRX , MOVTPTA)
	where
 	LIFECHD = '20220816' AND LICODTR = '000054' AND LIFECHA  = '20220814'  AND LITIPTAR = 'DEB'
 	AND LICOMER IN (SELECT DISTINCT LICOMER FROM yapi.flicom1 WHERE LIFECHD = '20220816' AND LITIPTAR = 'DEB' AND LICODTR = '000054' AND LIFECHA  = '20220814'
		AND LICOMER IN (SELECT OPCOMER FROM yapi.tclmov inner join yapi.opmovi on movrrnbep = opnoref 
		where MOVFTRX = '20220814' 
		and movmarc in ('VSA','MST') and movtpta = 'D' and optiptar = 'CRE' AND OPSTATUS ='A'
		and movcodis <> 'ATM'));


/*INSERT DE TRANSACCIONES FALTANTES*/
INSERT INTO yapi.FLICOM1 
(LICOMER,LIFECHD,LIFECHH,LICODTR,LIFECHA,LITIPTAR,LICANT,LIMONTO,LICOENT,LIIVAENT,LICOBPS,
LIIVABPS,LIRENTA,LIREIVA,LINETO,LINROINS,LIFECREDI,LINROFAC)
(SELECT MOVCOMER, MOVFPRO , MOVFPRO, OPCODTRN,  MOVFTRX , 'DEB' , COUNT(*), SUM(movimpo),0,0,SUM(movimco),SUM(movivco),0, 0,SUM(movimpo - movimco - movivco) ,0,'20220817',0
	FROM yapi.tclmov inner join yapi.opmovi on movrrnbep = opnoref 
	where MOVFTRX = '20220814' 
	and movmarc in ('VSA','MST') and movtpta = 'D' and optiptar = 'CRE' AND OPSTATUS ='A'
	and movcodis <> 'ATM' 
	AND OPCOMER NOT IN (SELECT LICOMER FROM yapi.flicom1 WHERE LIFECHD ='20220816' AND LITIPTAR = 'DEB' AND LICODTR = '000054' AND LIFECHA  = '20220814'
						AND LICOMER IN (SELECT OPCOMER FROM yapi.tclmov inner join yapi.opmovi on movrrnbep = opnoref 
							where MOVFTRX = '20220814' 
							and movmarc in ('VSA','MST') and movtpta = 'D' and optiptar = 'CRE' AND OPSTATUS ='A'
							and movcodis <> 'ATM'))
GROUP BY MOVCOMER, MOVFPRO , MOVFPRO, OPCODTRN,  MOVFTRX , MOVTPTA );



--15/08/2022

update yapi.FLICOM1 
set
  (LICANT, LIMONTO, LICOBPS, LIIVABPS,LIRENTA,LIREIVA,LINETO) 
  = 
  (SELECT  yapi.FLICOM1.LICANT - COUNT(*), yapi.FLICOM1.LIMONTO - SUM(movimpo), 
  			yapi.FLICOM1.LICOBPS - SUM(movimco), yapi.FLICOM1.LIIVABPS - SUM(movivco),
			yapi.FLICOM1.LIRENTA - SUM(movrent), yapi.FLICOM1.LIREIVA - SUM(movivren), 
			yapi.FLICOM1.LINETO - SUM(movimpo - movimco- movivco - movrent - movivren) 
	FROM yapi.tclmov inner join yapi.opmovi on movrrnbep = opnoref 
	where MOVFTRX = '20220815' 
	and yapi.FLICOM1.LICOMER =  yapi.opmovi.OPCOMER AND yapi.FLICOM1.LIFECHD =  yapi.opmovi.OPFECOM  
	AND  movmarc in ('VSA','MST') and movtpta = 'D' and optiptar = 'CRE' AND OPSTATUS ='A' 
	and movcodis <> 'ATM'
	GROUP BY MOVCOMER, MOVFPRO , MOVFPRO, OPCODTRN,  MOVFTRX , MOVTPTA)
where
 LIFECHD = '20220816' AND LICODTR = '000054' AND LIFECHA  = '20220815' AND LITIPTAR = 'CRE' 
AND LICOMER IN (SELECT DISTINCT OPCOMER
FROM YAPI.tclmov inner join YAPI.opmovi on movrrnbep = opnoref 
where MOVFTRX  =  '20220815' 
and movmarc in ('VSA','MST') and movtpta = 'D' and optiptar = 'CRE' AND OPSTATUS ='A' 
and movcodis <> 'ATM' );



/*PARA DEBITO*/

update yapi.FLICOM1 
set
  (LICANT, LIMONTO, LICOBPS, LIIVABPS,LIRENTA,LIREIVA,LINETO) 
  = 
  (SELECT  yapi.FLICOM1.LICANT + COUNT(*), yapi.FLICOM1.LIMONTO + SUM(movimpo), 
  			yapi.FLICOM1.LICOBPS + SUM(movimco), yapi.FLICOM1.LIIVABPS + SUM(movivco),
			yapi.FLICOM1.LIRENTA + SUM(movrent), yapi.FLICOM1.LIREIVA + SUM(movivren), 
			yapi.FLICOM1.LINETO + SUM(movimpo - movimco- movivco - movrent - movivren) 
	FROM yapi.tclmov inner join yapi.opmovi on movrrnbep = opnoref 
	where MOVFTRX = '20220815' 
	and yapi.FLICOM1.LICOMER =  yapi.opmovi.OPCOMER AND yapi.FLICOM1.LIFECHD =  yapi.opmovi.OPFECOM  
	AND  movmarc in ('VSA','MST') and movtpta = 'D' and optiptar = 'CRE' AND OPSTATUS ='A' 
	and movcodis <> 'ATM'
	GROUP BY MOVCOMER, MOVFPRO , MOVFPRO, OPCODTRN,  MOVFTRX , MOVTPTA)
	where
 	LIFECHD = '20220816' AND LICODTR = '000054' AND LIFECHA  = '20220815' AND LITIPTAR = 'DEB'
 	AND LICOMER IN (SELECT DISTINCT LICOMER FROM yapi.flicom1 WHERE LIFECHD = '20220816' AND LITIPTAR = 'DEB' AND LICODTR = '000054' AND LIFECHA  = '20220815'
		AND LICOMER IN (SELECT OPCOMER FROM yapi.tclmov inner join yapi.opmovi on movrrnbep = opnoref 
		where MOVFTRX = '20220815' 
		and movmarc in ('VSA','MST') and movtpta = 'D' and optiptar = 'CRE' AND OPSTATUS ='A'
		and movcodis <> 'ATM'));


/*INSERT DE TRANSACCIONES FALTANTES*/
INSERT INTO yapi.FLICOM1 
(LICOMER,LIFECHD,LIFECHH,LICODTR,LIFECHA,LITIPTAR,LICANT,LIMONTO,LICOENT,LIIVAENT,LICOBPS,
LIIVABPS,LIRENTA,LIREIVA,LINETO,LINROINS,LIFECREDI,LINROFAC)
(SELECT MOVCOMER, MOVFPRO , MOVFPRO, OPCODTRN,  MOVFTRX , 'DEB' , COUNT(*), SUM(movimpo),0,0,SUM(movimco),SUM(movivco),0, 0,SUM(movimpo - movimco - movivco) ,0,'20220817',0
	FROM yapi.tclmov inner join yapi.opmovi on movrrnbep = opnoref 
	where MOVFTRX = '20220815' 
	and movmarc in ('VSA','MST') and movtpta = 'D' and optiptar = 'CRE' AND OPSTATUS ='A'
	and movcodis <> 'ATM' 
	AND OPCOMER NOT IN (SELECT LICOMER FROM yapi.flicom1 WHERE LIFECHD ='20220816' AND LITIPTAR = 'DEB' AND LICODTR = '000054' AND LIFECHA  = '20220815'
						AND LICOMER IN (SELECT OPCOMER FROM yapi.tclmov inner join yapi.opmovi on movrrnbep = opnoref 
							where MOVFTRX = '20220815' 
							and movmarc in ('VSA','MST') and movtpta = 'D' and optiptar = 'CRE' AND OPSTATUS ='A'
							and movcodis <> 'ATM'))
GROUP BY MOVCOMER, MOVFPRO , MOVFPRO, OPCODTRN,  MOVFTRX , MOVTPTA );



--16/08/2022
/*PARA CREDITO*/
update yapi.FLICOM1 
set
  (LICANT, LIMONTO, LICOBPS, LIIVABPS,LIRENTA,LIREIVA,LINETO) 
  = 
  (SELECT  yapi.FLICOM1.LICANT - COUNT(*), yapi.FLICOM1.LIMONTO - SUM(movimpo), 
  			yapi.FLICOM1.LICOBPS - SUM(movimco), yapi.FLICOM1.LIIVABPS - SUM(movivco),
			yapi.FLICOM1.LIRENTA - SUM(movrent), yapi.FLICOM1.LIREIVA - SUM(movivren), 
			yapi.FLICOM1.LINETO - SUM(movimpo - movimco- movivco - movrent - movivren) 
	FROM yapi.tclmov inner join yapi.opmovi on movrrnbep = opnoref 
	where MOVFTRX = '20220816' 
	and yapi.FLICOM1.LICOMER =  yapi.opmovi.OPCOMER AND yapi.FLICOM1.LIFECHD =  yapi.opmovi.OPFECOM  
	AND  movmarc in ('VSA','MST') and movtpta = 'D' and optiptar = 'CRE' AND OPSTATUS ='A' 
	and movcodis <> 'ATM'
	GROUP BY MOVCOMER, MOVFPRO , MOVFPRO, OPCODTRN,  MOVFTRX , MOVTPTA)
where
 LIFECHD = '20220816' AND LICODTR = '000054' AND LIFECHA  = '20220816' AND LITIPTAR = 'CRE' 
AND LICOMER IN (SELECT DISTINCT OPCOMER
FROM YAPI.tclmov inner join YAPI.opmovi on movrrnbep = opnoref 
where MOVFTRX  =  '20220816' 
and movmarc in ('VSA','MST') and movtpta = 'D' and optiptar = 'CRE' AND OPSTATUS ='A' 
and movcodis <> 'ATM' );



/*PARA DEBITO*/


update yapi.FLICOM1 
set
  (LICANT, LIMONTO, LICOBPS, LIIVABPS,LIRENTA,LIREIVA,LINETO) 
  = 
  (SELECT  yapi.FLICOM1.LICANT + COUNT(*), yapi.FLICOM1.LIMONTO + SUM(movimpo), 
  			yapi.FLICOM1.LICOBPS + SUM(movimco), yapi.FLICOM1.LIIVABPS + SUM(movivco),
			yapi.FLICOM1.LIRENTA + SUM(movrent), yapi.FLICOM1.LIREIVA + SUM(movivren), 
			yapi.FLICOM1.LINETO + SUM(movimpo - movimco- movivco - movrent - movivren) 
	FROM yapi.tclmov inner join yapi.opmovi on movrrnbep = opnoref 
	where MOVFTRX = '20220816' 
	and yapi.FLICOM1.LICOMER =  yapi.opmovi.OPCOMER AND yapi.FLICOM1.LIFECHD =  yapi.opmovi.OPFECOM  
	AND  movmarc in ('VSA','MST') and movtpta = 'D' and optiptar = 'CRE' AND OPSTATUS ='A' 
	and movcodis <> 'ATM'
	GROUP BY MOVCOMER, MOVFPRO , MOVFPRO, OPCODTRN,  MOVFTRX , MOVTPTA)
	where
 	LIFECHD = '20220816' AND LICODTR = '000054' AND LIFECHA  = '20220816'  AND LITIPTAR = 'DEB'
 	AND LICOMER IN (SELECT DISTINCT LICOMER FROM yapi.flicom1 WHERE LIFECHD = '20220816' AND LITIPTAR = 'DEB' AND LICODTR = '000054' AND LIFECHA  = '20220816'
		AND LICOMER IN (SELECT OPCOMER FROM yapi.tclmov inner join yapi.opmovi on movrrnbep = opnoref 
		where MOVFTRX = '20220816' 
		and movmarc in ('VSA','MST') and movtpta = 'D' and optiptar = 'CRE' AND OPSTATUS ='A'
		and movcodis <> 'ATM'));


/*INSERT DE TRANSACCIONES FALTANTES*/
INSERT INTO yapi.FLICOM1 
(LICOMER,LIFECHD,LIFECHH,LICODTR,LIFECHA,LITIPTAR,LICANT,LIMONTO,LICOENT,LIIVAENT,LICOBPS,
LIIVABPS,LIRENTA,LIREIVA,LINETO,LINROINS,LIFECREDI,LINROFAC)
(SELECT MOVCOMER, MOVFPRO , MOVFPRO, OPCODTRN,  MOVFTRX , 'DEB' , COUNT(*), SUM(movimpo),0,0,SUM(movimco),SUM(movivco),0, 0,SUM(movimpo - movimco - movivco) ,0,'20220817',0
	FROM yapi.tclmov inner join yapi.opmovi on movrrnbep = opnoref 
	where MOVFTRX = '20220816' 
	and movmarc in ('VSA','MST') and movtpta = 'D' and optiptar = 'CRE' AND OPSTATUS ='A'
	and movcodis <> 'ATM' 
	AND OPCOMER NOT IN (SELECT LICOMER FROM yapi.flicom1 WHERE LIFECHD ='20220816' AND LITIPTAR = 'DEB' AND LICODTR = '000054' AND LIFECHA  = '20220816'
						AND LICOMER IN (SELECT OPCOMER FROM yapi.tclmov inner join yapi.opmovi on movrrnbep = opnoref 
							where MOVFTRX = '20220816' 
							and movmarc in ('VSA','MST') and movtpta = 'D' and optiptar = 'CRE' AND OPSTATUS ='A'
							and movcodis <> 'ATM'))
GROUP BY MOVCOMER, MOVFPRO , MOVFPRO, OPCODTRN,  MOVFTRX , MOVTPTA );


/************************************************************/

/*opmovi*/
update yapi.opmovi
set
  (OPTIPTAR, OPCOMI, OPRENTA, OPREIVA, OPCOMBPS, OPIVABPS,OPCOMENT,OPIVAENT) 
  = 
  (select 'DEB', (movimco+movivco), 0,0,movimco, movivco,0,0
   from yapi.tclmov 
   where yapi.tclmov.movrrnbep = yapi.opmovi.opnoref  AND movfpro between '20220811' and '20220816' 
	and movmarc in ('VSA','MST') 
	and movtpta = 'D' and movcodis <> 'ATM')
where
 optiptar = 'CRE' and OPFECOM  BETWEEN  '20220812' and '20220816' 
 AND OPNOREF IN (Select movrrnbep
from yapi.tclmov inner join yapi.opmovi on movrrnbep = opnoref where movfpro BETWEEN  '20220812' and '20220816' 
and movmarc in ('VSA','MST') and movtpta = 'D' and optiptar = 'CRE' AND yapi.opmovi.OPSTATUS ='A'
and movcodis <> 'ATM' )

/*****************************************************************/
/*drconbep*/

Update yapi.drconbep
set (LCPACE, lmarca, LTIPTR )
	=
    (SELECT AUTPROTAR, AUTAMBBIN, AUTTIPTAR
	FROM yapi.TSWAUT 
	WHERE yapi.TSWAUT.AUTRRNBEP = yapi.drconbep.LERRNB AND AUTTIPTAR = 'D'
	AND AUTMARTAR IN ('VSA','MST') AND AUTTRXFCHC BETWEEN  '20220812' AND '20220816' 
	AND AUTTRXESTF = 'A' AND AUTCODRET = '00' AND SUBSTR(LIDTRA, 1,1) <> 'T' AND LENEMI <> '510')
WHERE 
LTIPTR = 'C' 
AND LERRNB  IN (sELECT DISTINCT A.AUTRRNBEP FROM yapi.TSWAUT A INNER JOIN yapi.drconbep B ON A.AUTRRNBEP = B.LERRNB WHERE A.AUTTIPTAR = 'D'
AND A.AUTMARTAR IN ('VSA','MST') AND B.LFCOTR BETWEEN '20220812' AND '20220816' AND A.AUTTRXESTF = 'A' AND A.AUTCODRET = '00' 
AND SUBSTR(B.LIDTRA, 1,1) <> 'T' 
AND B.LTIPTR = 'C'
AND B.LENEMI <> '510') ;