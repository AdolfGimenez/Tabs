select A.*, B.* FROM MASTERCARD.MASCTLDTA AS A INNER JOIN MASTERCARD 
.MASTRNDTA AS B ON A.MCRRNBEPSA = B.MCRRNBEPSA AND A.MTI = B.MCMTI   
INNER JOIN LIBDEBITO.DRCONBEP AS C ON A.MCRRNBEPSA = C.LERRNB AND    
A.MC038 = C.LCAUTR AND B.MCIMPORTE = C.LIMPGS AND                    
B.MCFECCOM =  '20200429'                                         
WHERE MC039 = '00' AND A.MTI = 0110 AND B.MCROL = 'ADQ' AND          
B.MASIPMPRC <>'S' AND B.MCIMPORTE > 0 AND                            
C.LFCOTR = '20200429'


select A.*, B.* FROM MASTERCARD.MASCTLDTA AS A INNER JOIN MASTERCARD 
.MASTRNDTA AS B ON A.MCRRNBEPSA = B.MCRRNBEPSA AND A.MTI = B.MCMTI   
INNER JOIN LIBDEBITO.DRCONBEP AS C ON A.MCRRNBEPSA = C.LERRNB AND    
A.MC038 = C.LCAUTR AND B.MCIMPORTE = C.LIMPGS AND                    
B.MCFECCOM =  '20200429'                                         
WHERE MC039 = '00' AND A.MTI = 0110 AND B.MCROL = 'ADQ' AND          
B.MASIPMPRC ='S' AND B.MCIMPORTE > 0 AND                            
C.LFCOTR = '20200429'




select count(*) Cantidad,substr(mc002,1,6) bin ,mcpansvc Cod_serv  FROM MASTERCARD.MASCTLDTA AS A INNER JOIN MASTERCARD 
.MASTRNDTA AS B ON A.MCRRNBEPSA = B.MCRRNBEPSA AND A.MTI = B.MCMTI   
INNER JOIN LIBDEBITO.DRCONBEP AS C ON A.MCRRNBEPSA = C.LERRNB AND    
A.MC038 = C.LCAUTR AND B.MCIMPORTE = C.LIMPGS AND                    
B.MCFECCOM  between '20200401' and '20200430'                                         
WHERE MC039 = '00' and substr(mc041,1,1)='T'
group by substr(mc002,1,6) ,mcpansvc



AND A.MTI = 0110 AND B.MCROL = 'ADQ' AND          
B.MASIPMPRC <>'S' AND B.MCIMPORTE > 0 AND                            
C.LFCOTR = '20200429'