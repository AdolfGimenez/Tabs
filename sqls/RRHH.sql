/*datos personales*/
select * from gth.rhm100;
--delete from gth.rhm100;

SELECT * FROM gth.rhemple;
--update gth.rhemple set TBcodi = 1;


ALTER TABLE gth.EMPM100
ADD EmpVerHisJefe SMALLINT,
ADD EmpVerEstRec SMALLINT;

COMMENT ON COLUMN gth.EMPM100.EmpTipoPartTime IS 'Tipo part time   '

COMMENT ON COLUMN gth.EMPM100.EmpVerHisJefe IS 'Ver historico de liq. del colaborador'

COMMENT ON COLUMN gth.EMPM100.EmpVerEstRec IS 'Ver columna Estado de Liquidación';

SELECT * FROM GTH.RHMHLQ