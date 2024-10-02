SELECT * FROM GXBDBPS.COMAEAF C WHERE C.COCOMER='0801699'
--0802106 IGUAL A DATOS 1
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*ACTUALIZA PRODUCTO*/
Update libdebito.drconbep A
set LCPACE = (select B.AUTPROTAR from gxbdbps.tswaut B
where B.AUTTIPTAR = 'D' AND  lcpace=' ' AND A.LERRNB = B.AUTRRNBEP AND B.AUTMARTAR IN ('VSA','MST') AND B.AUTTRXFCHC = '20220817' AND B.AUTTRXESTF = 'A' AND B.AUTCODRET = '00')
where exists (select c.autambbin from gxbdbps.tswaut C
where C.AUTTIPTAR = 'D' and lcpace=' ' AND A.LERRNB = C.AUTRRNBEP AND C.AUTMARTAR IN ('VSA','MST') AND C.AUTTRXFCHC = '20220817' AND C.AUTTRXESTF = 'A' AND C.AUTCODRET = '00');
UPDATE libdebito.drconbep successful
5003 rows affected
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Execution time: 20.81s
/*aCTUALIZA AMBITO*/
Update libdebito.drconbep A
set lmarca = (select B.autambbin from gxbdbps.tswaut B
where B.AUTTIPTAR = 'D' AND A.LTIPTR = 'C' AND A.LERRNB = B.AUTRRNBEP AND B.AUTMARTAR IN ('VSA','MST') AND B.AUTTRXFCHC = '20220817' AND B.AUTTRXESTF = 'A' AND B.AUTCODRET = '00')
where exists (select c.autambbin from gxbdbps.tswaut C
where C.AUTTIPTAR = 'D' AND A.LTIPTR = 'C' AND A.LERRNB = C.AUTRRNBEP AND C.AUTMARTAR IN ('VSA','MST') AND C.AUTTRXFCHC = '20220817' AND C.AUTTRXESTF = 'A' AND C.AUTCODRET = '00');
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
UPDATE libdebito.drconbep successful
4999 rows affected
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*ACTUALIZA TIPO TARJETA*/
Update libdebito.drconbep A
set LTIPTR = (select B.AUTTIPTAR from gxbdbps.tswaut B
where B.AUTTIPTAR = 'D' AND A.LTIPTR = 'C' AND A.LERRNB = B.AUTRRNBEP AND B.AUTMARTAR IN ('VSA','MST') AND B.AUTTRXFCHC = '20220817' AND B.AUTTRXESTF = 'A' AND B.AUTCODRET = '00')
where exists (select c.autambbin from gxbdbps.tswaut C
where C.AUTTIPTAR = 'D' AND A.LTIPTR = 'C' AND A.LERRNB = C.AUTRRNBEP AND C.AUTMARTAR IN ('VSA','MST') AND C.AUTTRXFCHC = '20220817' AND C.AUTTRXESTF = 'A' AND C.AUTCODRET = '00');
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
sELECT A.AUTRRNBEP,A.AUTAMBBIN,A.AUTTIPTAR, A.AUTMARTAR, A.AUTPROTAR,B.LMARCA, B.LTIPTR, B.LCODBC, B.LCPACE,B.LENEMI
FROM GXBDBPS.TSWAUT A INNER JOIN LIBDEBITO.DRCONBEP B ON A.AUTRRNBEP = B.LERRNB WHERE A.AUTTIPTAR = 'D'
AND B.Lcpace=''  AND A.AUTMARTAR IN ('VSA','MST') AND A.AUTTRXFCHC between '20220818' and '20220901' AND A.AUTTRXESTF = 'A' AND A.AUTCODRET = '00';
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM gxfindta.TCLTSB t WHERE t.TSBCOCO