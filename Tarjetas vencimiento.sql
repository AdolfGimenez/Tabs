
select * from libdebito.tgembhaf where CRBINE='703002'
 and crenti='002' and CRVENC>'2000'
 

select COUNT(*) from libdebito.tgembhaf where CRBINE='703002'   
 and crenti='002' and CRVENC IN('2101', '2102', '2103', '2104', 
'2105', '2106', '2107', '2108', '2109', '2110', '2111', '2112')        

select * from libdebito.tgembhaf where CRBINE='703002'   
 and crenti='002' and CRVENC IN('2201', '2202', '2203', '2204', 
'2205', '2206', '2207', '2208', '2209', '2210', '2211', '2212')  
order by crvenc     
