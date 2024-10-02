/*Resumenes Trx  VISA DEBITO BNF*/
--Detalle
select 'D',lfcotr,/*substr(lidtra,1,1),*/'04','05',substr(lpad(limpgs,17,'0'),1,14)||'00', lmontr, lfectr, lpad(lhortr,6,'0'), lpad(lerrnb,15,'0'),lenemi, '002' from LIBDEBITO.DRCONBEP 
WHERE LNRTAR LIKE '488234%' AND LESTTR = 'A' and LCRETR = '00' and limpgs > 0  and lfcotr = '20191025' and lenemi = '015' ;
-- Subtotal - Resumen
select 'R','04','002','002',lfcotr,'00000000000000000',substr(lpad(sum(limpgs),17,'0'),1,14)||'00','00000000000000000','00000000000000000' from LIBDEBITO.DRCONBEP 
WHERE LNRTAR LIKE '488234%' AND LESTTR = 'A' and LCRETR = '00' and limpgs > 0  and lfcotr = '20191025'  and lenemi = '015' group by lfcotr;
-- Total por Entidad 
select 'T','04','002',lfcotr,substr(lpad(sum(limpgs),17,'0'),1,14)||'00',lpad(COUNT(*),17,'0')||'00','00000000000000000','00000000000000000' from LIBDEBITO.DRCONBEP 
WHERE LNRTAR LIKE '488234%' AND LESTTR = 'A' and LCRETR = '00' and limpgs > 0 and lfcotr = '20191025'  and lenemi = '015'  group by lfcotr
