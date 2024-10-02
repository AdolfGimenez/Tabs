

DELETE  from gxbdcon.gxloPERDET where usucod='380' and siscodi='TC';

INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  2150,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);

INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
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

select * from GXBDCON.GXLOPER where usucod = '777' and siscodi = 'TC' and funcod = '604'

select * from gxbdcon.gxlousu where usucod = '779'

INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  2151,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);

INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'TC',
  2160,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);

INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  380,
  'CL',
  2169,
  'S  ',
  'S  ',
  'S  ',
  'S  '
); commit;

--delete from GXBDCON.GXLOPERDET where usucod = '777' and siscodi = 'TC' and funcod = '415'

select * from gxbdcon.gxloperdet where usucod = '777' /*and funcod = '415' IN ('2168', '2169')*/and siscodi = 'BI' --and funcod = '415'

select * from gxbdcon.gxlousu where usuaid IN(
 'U99JAVIER',
 'U99MIRIAN')
 INSERT INTO GXBDCON.GXLOPERDET
(
  USUCOD,
  SISCODI,
  FUNCOD,
  PERDSP,
  PERUPD,
  PERINS,
  PERDLT
)
VALUES
(
  777,
  'SC',
  2610,
  'S  ',
  'S  ',
  'S  ',
  'S  '
);

select * from gxbdcon.gxlousu where USUCOD = '503'--usuaid = 'U99JAVIER'
--usucod = '503' --alberto bagnoli
--usucod = '391' --mirian molinas
select * from gxbdcon.gxloperdet where usucod = '503' and siscodi = 'TC'; --and funcod in ('2168', '2169')
select * from gxbdcon.gxlofun where siscodi = 'TC';-- funnom like '%wwipmdtaep          %'--siscodi = 'SC'

select * from  gxbdcon.gxloper GROUP BY SISCODI;

--Tabla de Usuarios
select * from gxbdcon.gxlousu where usuaid = 'CONTIUSR';
--Tabla de relación USUARIO (USUCOD), SISTEMA (SISCODI)
select * from gxbdcon.gxloper WHERE USUCOD = '503';
--Tabla de Funcionalidades por SISTEMA(SISCODI)
select * from gxbdcon.gxlofun where FUNCOD = '224';
--Tabla de relación USUARIO(USUCOD), SISTEMA(SISCODI), FUNCIONALIDAD (FUNCOD)
select * from gxbdcon.gxloperdet WHERE USUCOD = '777' AND SISCODI = 'TC';

SELECT * FROM GXBDCON.GXRE WHERE 

select * from gxbdcon.

select * from libdebito.drconbep where lfectr = '20200803'


INSERT INTO GXBDCON.GXLOUSU
(
  USUCOD,
  USUNOM,
  USUAID,
  USUEST,
  USUDTO,
  USUARE,
  USUMAI,
  USUCINT,
  USUFUA,
  USUPAS,
  USUTIP
)
VALUES
(
  779,
  'Graciela Vera                  ',
  'U99VERA ',
  1,
  2,
  '02',
  'gvera@bepsa.com.py',
  0,
  '20200818',
  '',
  0
);


UPDATE GXWEB.GXLOUSU  SET                    
usupass = 'ID6tUiemNEiDm1VkFLelxw==        ' ,
usuclav = '11CED2296CEDE34522D1DDAAEA171D87'
WHERE USUCOD = 2881

select * from gxweb.gxlousu where usucod = 2881

delete from gxweb.gxlousu where usucod = 2881



--Tabla de Usuarios
select * from GXBDCON.GXLOUSU where usuaid = 'CONTIUSR'; --2884 CONTIUSR
--Tabla de relación USUARIO (USUCOD), SISTEMA (SISCODI)
select * from GXBDCON.gxloper;
--Tabla de Funcionalidades por SISTEMA(SISCODI)
select * from gxweb.gxlofun where fundes = '';
--Tabla de relación USUARIO(USUCOD), SISTEMA(SISCODI), FUNCIONALIDAD (FUNCOD)
select * from gxweb.gxloperdet WHERE USUCOD = '2874';

select * from gxbdbps.corubaf;

select * from libdebito.drconbep where lfectr = '20201001' order by lhortr desc;

INSERT INTO GXBDCON.GXLOFUN
(
  FUNCOD,
  SISCODI,
  FUNNOM,
  FUNDES,
  FUNMEN,
  FUNPAD,
  FUNORD
)
VALUES
(
  2612,
  'TC',
  'wwipmdtaep            ',
  'ipmdtaep                                                                         ',
  1,
  693,
  NULL
);

