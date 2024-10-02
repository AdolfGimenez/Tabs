select * from gxbdbps.ipmm

GRANT SELECT   
ON ATMCENTRE.TREN8583AC to public

select * from ATMCENTRE.TREN8583AC


delete from cierrelib.tmpnum 
where numfch >= '20200623'

SELECT * FROM CIERRELIB.TMPNUM WHERE NUMFCH >= '20200623'

select * from cierrelib.tcieraf where enemiso='307' and affecie>'20200600'

select * from cierrelib.tspcie where pcfch = '20200623' order by proccod, subsec
delete from cierrelib.tspcie where pcfch = '20200623'

select * from CIERRELIB.tpcie where pcfch = '20200623'
delete from CIERRELIB.tpcie where pcfch = '20200623'

select * from cierrelib.tcieraf where enemiso='307' and affecie > '20200600'

UPDATE CIERRELIB.TSPCIE
   SET SUBEST = 'S'
WHERE PCFCH = '20200623'
AND   PROCCOD = 'PRPARTE1    '
AND   SUBPRC = 'TIPOPROCESO ';

UPDATE CIERRELIB.TSPCIE
   SET SUBEST = 'S'
WHERE PCFCH = '20200623'
AND   PROCCOD = 'PRPARTE1    '
AND   SUBPRC = 'JOURNAL     ';

UPDATE CIERRELIB.TSPCIE
   SET SUBEST = 'S'
WHERE PCFCH = '20200623'
AND   PROCCOD = 'PRPOSTCIERRE'
AND   SUBPRC = 'BKP-POST    ';

	select * from yapi.TGTCLF where clfcci = '1053806'

select * from cierrelib.TGTCLF where clfcci = '3742324'

select clfcci CI, clffch FECHA_CALIF, clfnom NOMBRE, clfape APELLIDO, clfcal CALIFICACION from cierrelib.TGTCLF where clfcci = '3742324' order by clffch desc

select * from cierrelib.tgtclf

select * from gxbdbps.TPRESAF

update cierrelib.TMCTAAF set mcpmfij=0, mcfefij ='20200630'
where mcemiso='307'

update cierrelib.TMCTAAF set mcpmfij=0, mcfefij ='20200831'
where mcemiso='021'
and mcstats='1'

select mcpmfij, mcfefij from cierrelib.TMCTAAF where mcemiso='021' and mcstats='1'

select * from cierrelib.TMCTAAF where mcemiso='021' and mcstats='1'

select * from cierrelib.tcieraf where enemiso = '021' and affecie >'20200700'

DELETE cierrelib.tspcie where pcfch = '20200723'

select * from cierrelib.tspcie where pcfch = '20200723' order by proccod, subsec

delete cierrelib.tpcie where pcfch = '20200723'


UPDATE CIERRELIB.TSPCIE
   SET SUBEST = 'S'
WHERE PCFCH = '20200723'
AND   PROCCOD = 'PRPARTE1    '
AND   SUBPRC = 'TIPOPROCESO ';

UPDATE CIERRELIB.TSPCIE
   SET SUBEST = 'S'
WHERE PCFCH = '20200723'
AND   PROCCOD = 'PRPARTE1    '
AND   SUBPRC = 'JOURNAL     ';

UPDATE CIERRELIB.TSPCIE
   SET SUBEST = 'S'
WHERE PCFCH = '20200723'
AND   PROCCOD = 'PRPOSTCIERRE'
AND   SUBPRC = 'BKP-POST    ';


select * from gxbdcon.gxloper

select * from cierrelib.GUSERAF where usidusr='U99JAVIER'

INSERT INTO CIERRELIB.GUSERAF
(
  USIDUSR,
  ENEMISO,
  SUCODIG,
  USNOMBR,
  USNIVEL,
  USSPOOL,
  USCARGO,
  GECODIG
)
VALUES
(
  'U99JAVIER  ',
  '002',
  '000',
  'JAVIER NUNEZ             ',
  5,
  1,
  '                                                  ',
  'TEC'
);

INSERT INTO CIERRELIB.GUSTRAF
(
  USIDUSR,
  TRCODIG
)
VALUES
(
  'U99JAVIER  ',
  'C   '
);

INSERT INTO CIERRELIB.GUSTRAF
(
  USIDUSR,
  TRCODIG
)
VALUES
(
  'U99JAVIER  ',
  'C1  '
);

INSERT INTO CIERRELIB.GUSTRAF
(
  USIDUSR,
  TRCODIG
)
VALUES
(
  'U99JAVIER  ',
  'C2  '
);

INSERT INTO CIERRELIB.GUSTRAF
(
  USIDUSR,
  TRCODIG
)
VALUES
(
  'U99JAVIER  ',
  'C3  '
);

INSERT INTO CIERRELIB.GUSTRAF
(
  USIDUSR,
  TRCODIG
)
VALUES
(
  'U99JAVIER  ',
  'C4  '
);

INSERT INTO CIERRELIB.GUSTRAF
(
  USIDUSR,
  TRCODIG
)
VALUES
(
  'U99JAVIER  ',
  'C5  '
);

INSERT INTO CIERRELIB.GUSTRAF
(
  USIDUSR,
  TRCODIG
)
VALUES
(
  'U99JAVIER  ',
  'C6  '
);

INSERT INTO CIERRELIB.GUSTRAF
(
  USIDUSR,
  TRCODIG
)
VALUES
(
  'U99JAVIER  ',
  'C7  '
);

INSERT INTO CIERRELIB.GUSTRAF
(
  USIDUSR,
  TRCODIG
)
VALUES
(
  'U99JAVIER  ',
  'C8  '
);

INSERT INTO CIERRELIB.GUSTRAF
(
  USIDUSR,
  TRCODIG
)
VALUES
(
  'U99JAVIER  ',
  'C9  '
);

INSERT INTO CIERRELIB.GUSTRAF
(
  USIDUSR,
  TRCODIG
)
VALUES
(
  'U99JAVIER  ',
  'G   '
);

INSERT INTO CIERRELIB.GUSTRAF
(
  USIDUSR,
  TRCODIG
)
VALUES
(
  'U99JAVIER  ',
  'G1  '
);

INSERT INTO CIERRELIB.GUSTRAF
(
  USIDUSR,
  TRCODIG
)
VALUES
(
  'U99JAVIER  ',
  'G2  '
);

INSERT INTO CIERRELIB.GUSTRAF
(
  USIDUSR,
  TRCODIG
)
VALUES
(
  'U99JAVIER  ',
  'G3  '
);

INSERT INTO CIERRELIB.GUSTRAF
(
  USIDUSR,
  TRCODIG
)
VALUES
(
  'U99JAVIER  ',
  'P   '
);

INSERT INTO CIERRELIB.GUSTRAF
(
  USIDUSR,
  TRCODIG
)
VALUES
(
  'U99JAVIER  ',
  'P1  '
);

INSERT INTO CIERRELIB.GUSTRAF
(
  USIDUSR,
  TRCODIG
)
VALUES
(
  'U99JAVIER  ',
  'P2  '
);

INSERT INTO CIERRELIB.GUSTRAF
(
  USIDUSR,
  TRCODIG
)
VALUES
(
  'U99JAVIER  ',
  'P203'
);

INSERT INTO CIERRELIB.GUSTRAF
(
  USIDUSR,
  TRCODIG
)
VALUES
(
  'U99JAVIER  ',
  'P3  '
);

INSERT INTO CIERRELIB.GUSTRAF
(
  USIDUSR,
  TRCODIG
)
VALUES
(
  'U99JAVIER  ',
  'P4  '
);

INSERT INTO CIERRELIB.GUSTRAF
(
  USIDUSR,
  TRCODIG
)
VALUES
(
  'U99JAVIER  ',
  'P5  '
);

INSERT INTO CIERRELIB.GUSTRAF
(
  USIDUSR,
  TRCODIG
)
VALUES
(
  'U99JAVIER  ',
  'R   '
);

INSERT INTO CIERRELIB.GUSTRAF
(
  USIDUSR,
  TRCODIG
)
VALUES
(
  'U99JAVIER  ',
  'R1  '
);

INSERT INTO CIERRELIB.GUSTRAF
(
  USIDUSR,
  TRCODIG
)
VALUES
(
  'U99JAVIER  ',
  'R2  '
);

INSERT INTO CIERRELIB.GUSTRAF
(
  USIDUSR,
  TRCODIG
)
VALUES
(
  'U99JAVIER  ',
  'R3  '
);

INSERT INTO CIERRELIB.GUSTRAF
(
  USIDUSR,
  TRCODIG
)
VALUES
(
  'U99JAVIER  ',
  'R4  '
);

INSERT INTO CIERRELIB.GUSTRAF
(
  USIDUSR,
  TRCODIG
)
VALUES
(
  'U99JAVIER  ',
  'T   '
);

INSERT INTO CIERRELIB.GUSTRAF
(
  USIDUSR,
  TRCODIG
)
VALUES
(
  'U99JAVIER  ',
  'T1  '
);

INSERT INTO CIERRELIB.GUSTRAF
(
  USIDUSR,
  TRCODIG
)
VALUES
(
  'U99JAVIER  ',
  'T118'
);

INSERT INTO CIERRELIB.GUSTRAF
(
  USIDUSR,
  TRCODIG
)
VALUES
(
  'U99JAVIER  ',
  'T2  '
);

INSERT INTO CIERRELIB.GUSTRAF
(
  USIDUSR,
  TRCODIG
)
VALUES
(
  'U99JAVIER  ',
  'T3  '
);

INSERT INTO CIERRELIB.GUSTRAF
(
  USIDUSR,
  TRCODIG
)
VALUES
(
  'U99JAVIER  ',
  'T4  '
);

INSERT INTO CIERRELIB.GUSTRAF
(
  USIDUSR,
  TRCODIG
)
VALUES
(
  'U99JAVIER  ',
  'T5  '
);

INSERT INTO CIERRELIB.GUSTRAF
(
  USIDUSR,
  TRCODIG
)
VALUES
(
  'U99JAVIER  ',
  'T6  '
);

INSERT INTO CIERRELIB.GUSTRAF
(
  USIDUSR,
  TRCODIG
)
VALUES
(
  'U99JAVIER  ',
  'T7  '
);

INSERT INTO CIERRELIB.GUSTRAF
(
  USIDUSR,
  TRCODIG
)
VALUES
(
  'U99JAVIER  ',
  'T8  '
);

INSERT INTO CIERRELIB.GUSTRAF
(
  USIDUSR,
  TRCODIG
)
VALUES
(
  'U99JAVIER  ',
  'T9  '
);
