SELECT  OPCOMER CODigo, CODENO NOMBREFANTASIA, SUM(OPMONTO) VOLUMEN, SUM(OPCOMI) COMISIONTOTAL,  COUNT(*) CANTIDAD, SUM(OPCOMENT) COMICOMER,SUM(OPIVAENT) IVACOMER, SUM(OPCOMBPS) COMIBEPSA, SUM(OPIVABPS) IVABPSA
FROM GXOPERA.OPMOVI INNER JOIN GXBDBPS.COMAEAF ON OPCOMER = COCOMER
WHERE OPFEREA BETWEEN '{?DESDE}' AND '{?HASTA}'
AND OPCODTRN = '014000' AND SUBSTR(OPCOMER,1,2) = '86'
GROUP BY OPCOMER, CODENO
ORDER BY 1