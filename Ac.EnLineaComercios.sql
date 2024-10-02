/*Banco BNF*/
Select opidliq,substr(opcampoa,41,8)FechaComercial, opfecliq fecha, ophorliq hora, opnroref referencia,opncomer comercio, codeno denominacion, corucn ruc, corazo social, a.enemiso banco, pardescri desbanco, adnumcta cuenta, substr(parcswift,1,8) swift, opimpor Importe, opmensaj Mensaje, opcodbco Banco, opstat EstadoBNF, opstatob estadobco
from gxopera.opliqui inner join gxbdbps.comaeaf a on opncomer = cocomer inner join gxopera.clparf on a.enemiso = parcodbco
where opfecliq >= '20220101' and substr(opcampoa,1,6) = '703002' and enemiso = '002' --and opnroref ='201023243640'
and opstat not in ('00','77', '88') and opstatob not in ('00','77','88')
order by opidliq

/*Banco Continental*/
Select opidliq,substr(opcampoa,41,8)FechaComercial, opfecliq fecha, ophorliq hora, opnroref referencia,opncomer comercio, codeno denominacion, corucn ruc, corazo social, a.enemiso banco, pardescri desbanco, adnumcta cuenta, substr(parcswift,1,8) swift, opimpor Importe, opmensaj Mensaje, opcodbco Banco, opstat EstadoBNF, opstatob estadobco
from gxopera.opliqui inner join gxbdbps.comaeaf a on opncomer = cocomer inner join gxopera.clparf on a.enemiso = parcodbco
where opfecliq >= '20220101' and substr(opcampoa,1,6) = '703002' and enemiso = '057' --and opnroref = 21120705760624
and opstat not in ('00','77','88') and opstatob not in ('00','77','88') 
order by opidliq 

/*Banco Continental BNF*/
Select opidliq,substr(opcampoa,41,8)FechaComercial, opfecliq fecha, ophorliq hora, opnroref referencia,opncomer comercio, codeno denominacion, corucn ruc, corazo social, a.enemiso banco, pardescri desbanco, adnumcta cuenta, substr(parcswift,1,8) swift, opimpor Importe, opmensaj Mensaje, opcodbco Banco, opstat EstadoBNF, opstatob estadobco
from gxopera.opliqui inner join gxbdbps.comaeaf a on opncomer = cocomer inner join gxopera.clparf on a.enemiso = parcodbco
where opfecliq >= '20220101' and substr(opcampoa,1,6) = '703002' and enemiso = '002' --and opnroref = 21120705760624
and opstat not in ('00','77','88') and opstatob not in ('00','77','88') and opimpor = '33558'
order by opidliq

/*Banco BBVA*/
Select opidliq,substr(opcampoa,41,8)FechaComercial, opfecliq fecha, ophorliq hora, opnroref referencia,opncomer comercio, codeno denominacion, corucn ruc, corazo social, a.enemiso banco, pardescri desbanco, adnumcta cuenta, substr(parcswift,1,8) swift, opimpor Importe, opmensaj Mensaje, opcodbco Banco, opstat EstadoBNF, opstatob estadobco
from gxopera.opliqui inner join gxbdbps.comaeaf a on opncomer = cocomer inner join gxopera.clparf on a.enemiso = parcodbco
where opfecliq >= '20220101' and substr(opcampoa,1,6) = '703002' and enemiso = '064'
and opstat not in ('00','77','88') and opstatob not in ('00','77','88') --and opimpor = '33558' --and opnroref = 21120605754485
order by opidliq

/*Otros Bancos*/
Select opidliq,substr(opcampoa,41,8)FechaComercial, opfecliq fecha, ophorliq hora, opnroref referencia,opncomer comercio,codeno denominacion, corucn ruc, corazo social, a.enemiso banco, pardescri desbanco, adnumcta cuenta, substr(parcswift,1,8) swift, opimpor Importe, opmensaj Mensaje, opcodbco Banco, opstat EstadoBNF, opstatob estadobco
from gxopera.opliqui inner join gxbdbps.comaeaf a on opncomer = cocomer inner join gxopera.clparf on a.enemiso = parcodbco
where opfecliq >= '20220101' and substr(opcampoa,1,6) = '703002' and enemiso not in ('074','057', '064','002')
and opstat not in ('00','77','88') and opstatob not in ('00','77','88') --and opimpor = '33558'--and opnroref = 21120605754609
order by opidliq

select * from gxopera.opliqui
select * from gxopera.clparf
select * from gxbdbps.comaeaf where enemiso = '002'
