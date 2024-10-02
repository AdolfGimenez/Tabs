/*Total de transacciones agrupados por codigo de transaccion y BIN*/
Select lenemi ENTIDAD,lbinpr BIN,lcodtr COD_TRX, count(*) CANTIDAD from yapi.drconbep21 where lesttr = 'A' and lcretr = '00' and lenemi = '002'
group by lenemi, lbinpr,lcodtr

/*Tarjetas a los cuales se debe devolver el saldo*/
Select lnrtar TARJETA, lenemi ENTIDAD, count(*) CANTIDAD, sum(limpgs) IMPORTE from yapi.drconbep21 where lbinpr = '627431' and lenemi = '002' and lesttr = 'A' and lcretr = '00'
group by lnrtar, lenemi

/*Total de acreditaciones por BANCO BIN 703002*/
Select lenemi ENTIDAD, enemiso BANCO,tgdesc DESCRIPCION, count(*) CANT, sum(limpgs)IMPORTE  from yapi.drconbep21 inner join gxbdbps.comaeaf on substr(digits(lidcom), 6, 7)= cocomer
inner join contabilid.tatgene on tgenti = enemiso
where lesttr = 'A' and lcretr = '00' and lenemi = '002' -- and lbinpr = '703002' --and lcodtr = '000054'

group by  enemiso, lenemi, tgdesc

/*Detalle de transacciones por Banco BIN 703002*/
Select cocomer COD_COMERCIO, codeno DENOMINACION,lenemi ENTIDAD, enemiso COD_BANCO ,tgdesc DESCRIP,
 count(*) CANT_TRX, sum(limpgs) IMPORTE from yapi.drconbep21 inner join gxbdbps.comaeaf on substr(digits(lidcom), 6, 7)= cocomer
inner join contabilid.tatgene on tgenti = enemiso
where lesttr = 'A' and lcretr = '00' and lenemi = '002'  and lbinpr = '703002' 
group by  cocomer,codeno,enemiso, lenemi, tgdesc

select lerrnb  from yapi.drconbep21
where lnrtar='7030020023028209'


select * from libdebito.lmovbnf
where enrefe<>'00'

delete from libdebito.lmovbnf
where enrrnb='923313722379'


select * from libdebito.logmovbnf
where enrrnb='923313722379'
