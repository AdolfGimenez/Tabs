select * from libdebito.drconbep where LIDCOM='1001254' and limpgs='800000.00' and lfectr='20210225';
select * from libdebito.drconbep where LIDCOM='1001254' and lfectr='20210317';

UPDATE libdebito.drconbep SET LESTTR='R'
where LIDCOM='1001254' and limpgs='800000.00' and lfectr='20210225';

--Sentencias para devolver saldo operativo

select * from libdebito.BST015 where BS15CODCOM='1000414';

update libdebito.BST015 set BS15MONSAL=(BS15MONSAL+800000.00)
where BS15CODCOM='     1000414';

select * from gxweb.BST015w where BS15CODCOM='     1000414';

update gxweb.BST015w set BS15MONSAL=(BS15MONSAL+800000.00)
where BS15CODCOM='     1000414';

--GXWEB.DEPCICO
SELECT * FROM GXWEB.DEPCICO D WHERE DEPID =8062;
/*   N = NUEVO | P = PROCESADO | A = ANULADO | L = LIQUIDADO */
--caso nelida #84271
SELECT * FROM GXWEB.DEPCICO WHERE DEPCOM='7200176' AND DEPFECH='20241111' and DEPID='8063';
UPDATE GXWEB.DEPCICO SET DEPESTADO = 'A' WHERE DEPCOM='7200176' AND DEPFECH='20241111' and DEPID='8063';

SELECT * FROM LIBDEBITO.BST015  WHERE BS15CODPRO = 'CICOMONEY ' AND BS15CODCOM = '     7200176';
UPDATE LIBDEBITO.BST015 SET BS15MONSAL = 30337020.78 WHERE BS15CODPRO = 'CICOMONEY ' AND BS15CODCOM = '     7200176';

SELECT * FROM gxweb.BST015w  WHERE BS15CODPRO = 'CICOMONEY ' AND BS15CODCOM = '     7200176';
UPDATE gxweb.BST015w SET BS15MONSAL = 30337020.78 WHERE BS15CODPRO = 'CICOMONEY ' AND BS15CODCOM = '     7200176';

select * from libdebito.BST021 where BS21CODCOM='     1000414';

--Consulta de transacciones (37000-Carga),(38000-Giro),(39000-Retiro)
select lfectr Feha, lfcotr Fecha_Comer, lhortr Hora, lctaor C_I, lctade Num_Ref
, lcotel Nume_Tell, lidcom Cod_Comer, lcomtr Comercio, limpgs Monto
, lcodtr Transaccion, LCRETR Retorno, lesttr from libdebito.drconbep
where lfectr between '20241111' and '20241111'
--where lhortr between '144216' and '155600'
--and lfectr in '20200528'
--and lcretr in ('96','93')
--and lctade like '%344064648'
--and lidcom in '1000581'
--and lcotel in '0986799413'
--AND LCRETR IN '51'
and lcodtr in  ('370000','380000','390000')
order by lhortr desc;