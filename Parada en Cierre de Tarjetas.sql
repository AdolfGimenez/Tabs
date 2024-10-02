UPDATE GXBDBPS.GCONTRP SET COTIPC = '*NORMAL', COBACK = '*NO' WHERE COCODI = '001';

UPDATE GXBDBPS.TPCIE
   SET PCEST = 'N'
WHERE PCFCH = '20211220'
AND   PROCCOD = 'INICIO      ';

UPDATE GXBDBPS.TSPCIE
   SET SUBEST = 'N'
WHERE PCFCH = '20211220'
AND   PROCCOD = 'PRPARTE1    '
AND   SUBPRC = 'RPDLT01INI  ';
UPDATE GXBDBPS.TSPCIE
   SET SUBEST = 'N'
WHERE PCFCH = '20211220'
AND   PROCCOD = 'PRPARTE1    '
AND   SUBPRC = 'RPCPY01     ';

select *from gxbdbps.tspcie where pcfch='20211220';

delete gxbdbps.tspciewhere pcfch='20211220';

select * from gxbdbps.tpcie where pcfch='20211220'

delete gxbdbps.tpcie where pcfch='20211220'
