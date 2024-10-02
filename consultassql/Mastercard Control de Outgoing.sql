    SELECT                                             
IPMARN,                                            
IPMORV,                                            
IPMFEC,                                            
IPMFNAME,                                          
IPMICA,                                            
IPMCONF,                                           
CAST(IFNULL( (SELECT u.IPMDEV                      
         FROM GXBDBPS.IPMDTAE u                    
         WHERE (u.IPMARN,u.IPMICA,u.IPMDELN)=      
               (c.IPMARN,c.IPMICA, 2)   LIMIT 1),' ')
     AS CHAR(16)) "LNRTAR",                        
CAST(IFNULL( (SELECT u.IPMDEV                      
         FROM GXBDBPS.IPMDTAE u                     
         WHERE (u.IPMARN,u.IPMICA,u.IPMDELN)=       
               (c.IPMARN,c.IPMICA, 2)   LIMIT 1),' ')
     AS CHAR(16)) "LNRTAR",                         
CAST(IFNULL( (SELECT u.IPMDEV                       
         FROM GXBDBPS.IPMDTAE u                     
         WHERE (u.IPMARN,u.IPMICA,u.IPMDELN)=       
               (c.IPMARN,c.IPMICA, 37) LIMIT 1),' ')
     AS CHAR(12)) "LRRN",                           
CAST(IFNULL( (SELECT u.IPMDEV                       
         FROM GXBDBPS.IPMDTAE u                     
         WHERE (u.IPMARN,u.IPMICA,u.IPMDELN)=       
               (c.IPMARN,c.IPMICA, 38) LIMIT 1),' ')
     AS CHAR(6))  "LCAUTR",                         
CAST(IFNULL( (SELECT u.IPMDEV                       
          FROM GXBDBPS.IPMDTAE u                    
          WHERE (u.IPMARN,u.IPMICA,u.IPMDELN)=      
                (c.IPMARN,c.IPMICA, 4) LIMIT 1),' ')
      AS CHAR(17)) "LIMPGS",                        
 CAST(IFNULL( (SELECT u.IPMDEV                      
          FROM GXBDBPS.IPMDTAE u                    
          WHERE (u.IPMARN,u.IPMICA,u.IPMDELN)=      
                (c.IPMARN,c.IPMICA, 49) LIMIT 1),' ')
      AS CHAR(3)) "LMONTR",                         
 CAST(IFNULL( (SELECT u.IPMDEV                      
         FROM GXBDBPS.IPMDTAE u                   
         WHERE (u.IPMARN,u.IPMICA,u.IPMDELN)=     
               (c.IPMARN,c.IPMICA, 12) LIMIT 1),' ')
     AS CHAR(6)) "LFECTR",                        
CAST(IFNULL( (SELECT u.IPMDEV                     
         FROM GXBDBPS.IPMDTAE u                   
         WHERE (u.IPMARN,u.IPMICA,u.IPMDELN)=     
               (c.IPMARN,c.IPMICA, 6)  LIMIT 1),'0')
     AS CHAR(17)) "LIMPUS",                       
CAST(IFNULL( (SELECT u.IPMDEV                     
          FROM GXBDBPS.IPMDTAE u                    
          WHERE (u.IPMARN,u.IPMICA,u.IPMDELN)=      
                (c.IPMARN,c.IPMICA, 51) LIMIT 1 ),'0')
      AS CHAR(3)) "LMONUS"                          
 FROM GXBDBPS.IPMDTA c     
                          
WHERE  SUBSTR(IPMFNAME,1,4)='R111' 
 
IPMCONF IN (0, 0) AND                        
       IPMFNC = 200 AND                             
       IPMICA = 19832 AND                 
       
      -- IPMMSGSENT = 'I'                            
       FOR READ ONLY




select A.*, B.* FROM MASTERCARD.MASCTLDTA AS A INNER JOIN MASTERCARD
.MASTRNDTA AS B ON A.MCRRNBEPSA = B.MCRRNBEPSA AND A.MTI = B.MCMTI
INNER JOIN libdebito.DRCONBEp AS C ON A.MCRRNBEPSA = C.LERRNB AND
A.MC038 = C.LCAUTR AND B.MCIMPORTE = C.LIMPGS AND
B.MCFECCOM = 20210125
WHERE MC039 = '00' AND A.MTI = 0110 AND B.MCROL = 'ADQ' AND
B.MASIPMPRC <>'S' AND B.MCIMPORTE > 0 AND
C.LFCOTR = 20210125
