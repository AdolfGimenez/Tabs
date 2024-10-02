select * from GXBDBPS.MCT464FRDR AS A
INNER JOIN libdebito.DRCONBEP AS B
ON A.T464FRRENU  = B.LERRNB
 where T464FRAUCO <> ' ' and t464frcors = 0  and t464frprcd between 0 and 013000
AND B.LESTTR = 'A' and lfectr between '' and ''



select A.*, B.* FROM MASTERCARD.MASCTLDTA AS A INNER JOIN MASTERCARD 
.MASTRNDTA AS B ON A.MCRRNBEPSA = B.MCRRNBEPSA AND A.MTI = B.MCMTI   
INNER JOIN LIBDEBITO.DRCONBEP AS C ON A.MCRRNBEPSA = C.LERRNB AND    
A.MC038 = C.LCAUTR AND B.MCIMPORTE = C.LIMPGS AND                    
B.MCFECCOM between '20201123' and '20201223'                                           
WHERE MC039 = '00' AND A.MTI = 0110 AND B.MCROL = 'ADQ' 
AND B.MASIPMPRC <>'N' AND B.MCIMPORTE > 0  
--and b.MCRRNBEPSA='027203743513'
--and masipmfil='R111032585'
and C.LFCOTR between '20201123' and '20201123'



select * from libdebito.drconbep where lnrtar in ('5452899999997915')   lerrnb='027203743513'
select * from mastercard.MASCTLDTA where mc002 like '%5452892201167915%'
select * from mastercard.MAStrndta where mcrrnbepsa='035022724689'
select * from gxbdbps.ipmdtae where ipmdeln='2' and ipmdev='5452892201167915'
select * from gxbdbps.ipmdta where  ipmfname='R111032990'  and ipmfec>'20201001'
