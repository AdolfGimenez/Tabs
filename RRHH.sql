select * from contabilid.TATSEDE
select * from contabilid.FICLIEN
select * from contabilid.SJMOVIM
select * from contabilid.TATRAEM
select * from CONTABILID.SJDPERS
select * from contabilid.SJSBMES

--tabla seguridad rr.hh
SELECT * FROM GXBDCON.GXLOFUN G WHERE FUNNOM='sjmovim';--funcion
SELECT * FROM GXBDCON.GXLOUSU G;--usuario
SELECT * FROM GXBDCON.GXLOPER G WHERE USUCOD='821';--operador
SELECT * FROM GXBDCON.GXLOPERDET G2 WHERE USUCOD='821';--detall

CREATE TABLE PUBLIC.bkrhemple as
select * from gth.rhemple where functiphor = 0;
update gth.rhemple set functiphor = 1 where functiphor = 0;