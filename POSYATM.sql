--POS Y ATM
SELECT COUNT(*)--substr(LIDTRA, 5, 6), lcodtr, LNRTAR, trim(lcotel), lctade, lerrnb, lfectr, substr(digits(lhortr),3,8), lcretr, lesttr, limpgs, 'TIGO MONEY', LIDCOM
FROM libdebito.drconbep
WHERE LIDCOM <> 100001
AND   substr (LIDTRA,1,1) IN ('P','T')
AND   LFCOTR = '20220704' /*and LCODTR = '000052' */ 
AND   LESTTR = 'A'
AND   LCRETR = '00' /*and lenemi = '540'*/ 
--POS
SELECT COUNT(*)
--substr(LIDTRA, 5, 6), lcodtr, LNRTAR, trim(lcotel), lctade, lerrnb, lfectr, substr(digits(lhortr),3,8), lcretr, lesttr, limpgs, 'TIGO MONEY', LIDCOM
FROM libdebito.drconbep WHERE substr (LIDTRA,1,1) = 'P'
AND   LFCOTR = '20220704' /*and LCODTR = '000052' and eneadm <> '581'*/ 
AND   LESTTR = 'A'
AND   LCRETR = '00' /*and lenemi = '540'*/ 
--ATM
SELECT COUNT(*)
--substr(LIDTRA, 5, 6), lcodtr, LNRTAR, trim(lcotel), lctade, lerrnb, lfectr, substr(digits(lhortr),3,8), lcretr, lesttr, limpgs, 'TIGO MONEY', LIDCOM
FROM libdebito.drconbep WHERE substr (LIDTRA,1,1) = 'T'
AND   LFCOTR = '20220704' /*and LCODTR = '000052' and eneadm <> '581'*/ 
AND   LESTTR = 'A'
AND   LCRETR = '00' /*and lenemi = '540'*/  

select count(*) Cantidad from libdebito.drconbep WHERE substr (LIDTRA,1,1) = 'P' AND   LFCOTR = '20220704' group by LCOMTR
