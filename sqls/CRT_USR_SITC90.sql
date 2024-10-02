SELECT *
FROM GXBDCON.GXLOUSU A
         JOIN GXBDCON.GXLOPER B ON A.USUCOD = B.USUCOD
WHERE SISCODI = 'TC';
---------------------------------------------------------------------
select * from gxbdcon.gxloper;
SELECT * FROM GXBDCON.GXLOPERDET G;
select * from GXBDBPS.GUSERAF where usidusr='U99ADOLFO';
INSERT INTO GXBDBPS.GUSERAF (USIDUSR, ENEMISO, SUCODIG, USNOMBR, USNIVEL, USSPOOL, USCARGO, GECODIG)
VALUES ('U99ADOLFO ', '014', '000', 'ADOLFO GIMENEZ              ', 5, 43, '                           ', 'TEC');

SELECT * FROM GXBDBPS.GUSTRAF WHERE USIDUSR = 'U99ADOLFO';
INSERT INTO GXBDBPS.GUSTRAF (USIDUSR, TRCODIG)
VALUES ('U99ADOLFO  ', 'C   ');
INSERT INTO GXBDBPS.GUSTRAF (USIDUSR, TRCODIG)
VALUES ('U99ADOLFO  ',        'C1  ');
INSERT INTO GXBDBPS.GUSTRAF (USIDUSR, TRCODIG)
VALUES ('U99ADOLFO  ',        'C2  ');
INSERT INTO GXBDBPS.GUSTRAF (USIDUSR, TRCODIG)
VALUES ('U99ADOLFO  ',       'C3  ');
INSERT INTO GXBDBPS.GUSTRAF (USIDUSR, TRCODIG)
VALUES ('U99ADOLFO  ',        'C4  ');
INSERT INTO GXBDBPS.GUSTRAF (USIDUSR, TRCODIG)
VALUES ('U99ADOLFO  ',        'C5  ');
INSERT INTO GXBDBPS.GUSTRAF (USIDUSR, TRCODIG)
VALUES ('U99ADOLFO  ',        'C6  ');
INSERT INTO GXBDBPS.GUSTRAF (USIDUSR, TRCODIG)
VALUES ('U99ADOLFO  ',        'C7  ');
INSERT INTO GXBDBPS.GUSTRAF (USIDUSR, TRCODIG)
VALUES ('U99ADOLFO  ',        'C8  ');
INSERT INTO GXBDBPS.GUSTRAF (USIDUSR, TRCODIG)
VALUES ('U99ADOLFO  ',        'C9  ');
INSERT INTO GXBDBPS.GUSTRAF (USIDUSR, TRCODIG)
VALUES ('U99ADOLFO  ',        'G   ');
INSERT INTO GXBDBPS.GUSTRAF (USIDUSR, TRCODIG)
VALUES ('U99ADOLFO  ',        'G1  ');
INSERT INTO GXBDBPS.GUSTRAF (USIDUSR, TRCODIG)
VALUES ('U99ADOLFO  ',        'G2  ');
INSERT INTO GXBDBPS.GUSTRAF (USIDUSR, TRCODIG)
VALUES ('U99ADOLFO  ',        'G3  ');
INSERT INTO GXBDBPS.GUSTRAF (USIDUSR, TRCODIG)
VALUES ('U99ADOLFO  ',        'P   ');
INSERT INTO GXBDBPS.GUSTRAF (USIDUSR, TRCODIG)
VALUES ('U99ADOLFO  ',        'P1  ');
INSERT INTO GXBDBPS.GUSTRAF (USIDUSR, TRCODIG)
VALUES ('U99ADOLFO  ',        'P2  ');
INSERT INTO GXBDBPS.GUSTRAF (USIDUSR, TRCODIG)
VALUES ('U99ADOLFO  ',        'P203');
INSERT INTO GXBDBPS.GUSTRAF (USIDUSR, TRCODIG)
VALUES ('U99ADOLFO  ',        'P3  ');
INSERT INTO GXBDBPS.GUSTRAF (USIDUSR, TRCODIG)
VALUES ('U99ADOLFO  ',        'P4  ');
INSERT INTO GXBDBPS.GUSTRAF (USIDUSR, TRCODIG)
VALUES ('U99ADOLFO  ',        'P5  ');
INSERT INTO GXBDBPS.GUSTRAF (USIDUSR, TRCODIG)
VALUES ('U99ADOLFO  ',        'R   ');
INSERT INTO GXBDBPS.GUSTRAF (USIDUSR, TRCODIG)
VALUES ('U99ADOLFO  ',        'R1  ');
INSERT INTO GXBDBPS.GUSTRAF (USIDUSR, TRCODIG)
VALUES ('U99ADOLFO  ',        'R2  ');
INSERT INTO GXBDBPS.GUSTRAF (USIDUSR, TRCODIG)
VALUES ('U99ADOLFO  ',        'R3  ');
INSERT INTO GXBDBPS.GUSTRAF (USIDUSR, TRCODIG)
VALUES ('U99ADOLFO  ',        'R4  ');
INSERT INTO GXBDBPS.GUSTRAF (USIDUSR, TRCODIG)
VALUES ('U99ADOLFO  ',        'T   ');
INSERT INTO GXBDBPS.GUSTRAF (USIDUSR, TRCODIG)
VALUES ('U99ADOLFO  ',        'T1  ');
INSERT INTO GXBDBPS.GUSTRAF (USIDUSR, TRCODIG)
VALUES ('U99ADOLFO  ',        'T118');
INSERT INTO GXBDBPS.GUSTRAF (USIDUSR, TRCODIG)
VALUES ('U99ADOLFO  ',        'T2  ');
INSERT INTO GXBDBPS.GUSTRAF (USIDUSR, TRCODIG)
VALUES ('U99ADOLFO  ',        'T3  ');
INSERT INTO GXBDBPS.GUSTRAF (USIDUSR, TRCODIG)
VALUES ('U99ADOLFO  ',        'T4  ');
INSERT INTO GXBDBPS.GUSTRAF (USIDUSR, TRCODIG)
VALUES ('U99ADOLFO  ',        'T5  ');
INSERT INTO GXBDBPS.GUSTRAF (USIDUSR, TRCODIG)
VALUES ('U99ADOLFO  ',        'T6  ');
INSERT INTO GXBDBPS.GUSTRAF (USIDUSR, TRCODIG)
VALUES ('U99ADOLFO  ',        'T7  ');
INSERT INTO GXBDBPS.GUSTRAF (USIDUSR, TRCODIG)
VALUES ('U99ADOLFO  ',        'T8  ');
INSERT INTO GXBDBPS.GUSTRAF (USIDUSR, TRCODIG)
VALUES ('U99ADOLFO  ',        'T9  ');
---------------------------------------------------
--DELETE  from gxbdcon.gxloPERDET where usucod='777' and siscodi='TC';

INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  222,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  223,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  224,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  225,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  226,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  227,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  228,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  229,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  230,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  231,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  234,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  235,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  236,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  237,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  238,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  239,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  240,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  241,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  242,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  243,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  244,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  245,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  246,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  247,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  248,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  249,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  250,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  251,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  252,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  253,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  254,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  255,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  256,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  257,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  258,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  259,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  260,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  261,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  262,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  263,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  265,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  266,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  267,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  268,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  269,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  270,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  271,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  273,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  281,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  385,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  386,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  387,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  388,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  389,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  390,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  391,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  392,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  393,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  394,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  395,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  396,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  397,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  398,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  399,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  400,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  401,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  402,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  403,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  404,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  405,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  420,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  421,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  424,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  425,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  426,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  427,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  428,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  429,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  430,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  431,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  432,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  433,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  434,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  435,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  436,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  437,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  438,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  439,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  440,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  441,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  442,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  443,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  444,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  445,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  446,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  447,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  448,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  449,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  450,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  451,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  452,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  453,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  454,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  455,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  456,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  457,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  458,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  459,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  460,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  461,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  462,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  463,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  464,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  465,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  466,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  467,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  468,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  469,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  470,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  471,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  472,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  473,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  474,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  475,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  476,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  477,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  478,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  479,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  480,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  481,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  482,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  483,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  484,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  485,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  486,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  487,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  488,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  489,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  490,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  491,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  492,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  493,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  494,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  495,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  496,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  497,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  498,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  499,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  500,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  501,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  502,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  503,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  504,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  505,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  506,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  507,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  508,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  509,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  510,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  511,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  512,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  513,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  514,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  515,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  516,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  517,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  518,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  519,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  520,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  521,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  522,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  523,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  524,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  525,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  526,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  527,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  528,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  529,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  530,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  531,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  532,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  533,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  534,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  535,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  536,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  537,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  538,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  539,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  540,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  541,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  542,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  543,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  544,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  545,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  546,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  549,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  550,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  551,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  552,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  553,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  554,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  557,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  558,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  559,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  560,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  561,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  562,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  563,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  566,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  567,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  569,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  570,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  571,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  572,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  573,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  574,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  575,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  576,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  577,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  578,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  579,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  580,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  581,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  582,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  611,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  612,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  613,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  614,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  615,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  616,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  617,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  618,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  619,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  620,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  621,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  622,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  623,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  624,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  625,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  629,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  633,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  634,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  635,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  636,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  637,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  638,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  639,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  640,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  641,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  642,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  643,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  644,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  645,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  646,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  647,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  648,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  649,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  650,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  651,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  652,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  653,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  654,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  655,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  656,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  657,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  658,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  659,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  661,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  662,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  663,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  664,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  665,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  666,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  667,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  668,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  669,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  672,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  673,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  677,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  678,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  679,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  680,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  681,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  682,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  683,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  684,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  685,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  686,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  687,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  688,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  689,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  690,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  691,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  692,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  693,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  694,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  695,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  696,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  697,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  698,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  699,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  700,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  701,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  702,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  703,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  704,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  705,
  'S  ',
  'S  ',
  'S  ',
  'N  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  706,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  707,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  708,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  709,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  710,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  711,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  712,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  713,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  714,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  715,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  716,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  717,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  718,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  719,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  720,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  721,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  722,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  723,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  724,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  725,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  726,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  727,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  728,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  729,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  730,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  731,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  732,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  733,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  734,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  735,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  736,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  737,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  738,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  739,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  740,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  741,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  742,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  743,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  744,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  745,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  746,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  747,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  748,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  749,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  750,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  751,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  752,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  753,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  754,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  755,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  756,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  757,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  758,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  759,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  760,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  761,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  762,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  763,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  764,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  765,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  765,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  765,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  765,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  765,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  765,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  765,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  765,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  765,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  765,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  765,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  765,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  765,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  765,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  765,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  765,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  765,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  765,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  765,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  765,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);
INSERT INTO GXBDCON.GXLOPERDET
(USUCOD,
 SISCODI,
 FUNCOD,
 PERDSP,
 PERUPD,
 PERINS,
 PERDLT)
VALUES (777,
        'TC',
        765,
        'S  ',
        'S  ',
        'S  ',
        'S  ');