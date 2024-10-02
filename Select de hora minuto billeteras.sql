
/*HORA*/
/*
select substr((lhortr + 10000000),3,2) Hora, count(*) Cant, sum(limpgs) Importe
from libdebito.drconbep where lfectr between '20200412' and '20200412'
and lcodtr in ('567101','567102') and substr(lidtra,1,1) = 'P'
group by substr((lhortr + 10000000),3,2) order by substr((lhortr + 10000000),3,2) desc
*/
/*HORA_MINUTO*/
/*
select substr((lhortr + 10000000),3,4) Hora, count(*) Cant, sum(limpgs) Importe
from libdebito.drconbep where lfectr between '20200413' and '20200413' 
and lcodtr in ('567101','567102') and substr(lidtra,1,1) = 'P' and substr((lhortr + 10000000),3,2) between 06 and 12
group by substr((lhortr + 10000000),3,4) order by substr((lhortr + 10000000),3,4) desc
*/






