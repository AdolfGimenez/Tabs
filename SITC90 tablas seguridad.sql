-- usuarios
select * from gxbdbps.GUSERAF
-- opciones y niveles
select * from gxbdbps.GTRANAF
-- opciones habilitadas para usuarios
select * from gxbdbps.GUSTRAF
-- Grupos para usuarios
select * from gxbdbps.GGRUPAF
-- Grupo-entidad
select * from gxbdbps.GENGRAF
-- Entidad - Sucursal
select * from gxbdbps.GSUCUAF
-- Permisos especiales
select * from gxbdbps.tfuncaf
-- Usuario/Permisos especiales
select * from gxbdbps.TFUN1AF where FCVALOR='U99GABRI'


select * from gxbdbps.GUSTRAF where TRCODIG='T111'

select * from gxbdbps.guseraf where USIDUSR='U99ARTURO'

select * from gxbdbps.gusTRAF where USIDUSR='U99ARTURO'
