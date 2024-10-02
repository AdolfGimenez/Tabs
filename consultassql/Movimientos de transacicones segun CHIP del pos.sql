*******************************************************************************************************************
MOVIMIENTOS DE TRANSACCIONES DE POS SEGÚN CHIP
*******************************************************************************************************************
SELECT  lfectr,lhortr,lidcom,lcomtr,leca62,afsern, cocomer codigocomer
FROM LIBDEBITO.DRCONBEP 
INNER JOIN GXBDBPS.COMAEAF A ON substr(digits(lidcom), 6, 7) = A.COCOMER
INNER JOIN GXBDBPS.COAFMAF D ON AFCOMER = A.COCOMER
WHERE a.costat='0' and d.afsern like ('%P%') and lfectr='20200718'
order by lhortr desc

LISTADO DE POS POR CHIP
select a.cocomer,b.afcodi,b.afsern from gxbdbps.comaeaf a
inner join gxbdbps.coafmaf b on a.cocomer=b.afcomer
where a.costat='0' and b.afsern like ('%T%')
*******************************************************************************************************************
*******************************************************************************************************************
