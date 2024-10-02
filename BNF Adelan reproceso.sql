/*Tabla Temporal*/
select * from gxopera.opago3p
/*Tabla Histórica*/
SELECT * FROM gxopera.copaen2phs WHERE BNFFECRE='20190724'
/*Tabla Temporal*/
SELECT * FROM gxopera.opago5p 
/*Tabla Histórica*/
SELECT * FROM gxopera.opago5ph WHERE PGFECRE5 ='20190724' 
/*Tabla Temporal*/
select * FROM gxopera.OPAGO3TC
/*Tabla Histórica*/
select * FROM gxopera.OPAGO3TCh WHERE TCFECRE='20190724'          
select tcfecre,tctipo,sum(tcimpor),tcidusr FROM gxopera.OPAGO3TCh WHERE TCFECRE='20190723'          
group by tcfecre,tctipo,tcidusr


select * from libdebito.COPAGO0PDM
