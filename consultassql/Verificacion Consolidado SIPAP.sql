select  substr(dsftrans, 1,6) fecha, count(*) cantidad ,pdscotr, sum(pdsmonto)bruto, sum(pdsNETO)neto ,pdsagrup 
from gxopera.DESIPAP where  substr(pdsfecha, 1,6)='20211220' 
group by  substr(pdsfecha, 1,6), pdscotr, pdsagrup

select * from gxopera.DESIPAP
