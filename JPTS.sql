--translog
SELECT RC, BIN, LAST_FOUR, AMOUNT, t.* FROM PUBLIC.TRANLOG t
WHERE DATE BETWEEN '2023-07-31 14:50:00.865000' AND '2023-07-31 15:10:59.000000' AND BIN='703002' AND last_four='4611';

--para buscar trx aprobadas
select t.atm_session_id, t.mid, t.tid, t.amount, t.bin, t.last_four, t.ss_stan, t.dsrc from public.tranlog t
where t."date" between '2023-05-09 18:00:00' and '2023-05-09 18:30:00' and t.tid = '19899552';

--para buscar su contra parte, si tiene la reversa
select * from public.tranlog
where "date" between '2023-05-09 18:00:00' and '2023-05-09 18:30:00' and amount = 9550.00 and ss_stan = '004833' and mid like '%000000000704065';
------------------------------------------

SELECT * FROM PUBLIC.TRANLOG T WHERE T.SS LIKE '%REST%';--ORDER BY ID DESC
select * from public.tranlog t  where t.DATE>='2023-11-10 06:21:27.677000' AND ss = 'SS-REST'; --order by id desc
-------------------------------------------
SELECT * FROM PUBLIC.API_REQUEST_HISTORY ARH;

SELECT *
FROM PUBLIC.TRANLOG T
WHERE T.DATE = '2023-11-10 06:25:34.000000' --cast(T.DATE as date) = cast('2023-11-10T06:25:34' as date)
   -- T.LOCALTRANSACTIONDATE = '2023-11-10 06:25:34.000000' --'2023-11-10T06:25:34'
  AND T.TRANSACTION_TOKEN = '2023314600013398'
  AND T.AMOUNT = '20500'
  AND T.CURRENCYCODE = '600' --CURRENCY O MONEDA
  AND T.TID = '26989261' -- "terminal_id"
  AND T.MID = '000000002400172' --"merchant_id"
  AND T.SS_STAN = '007853'; --"stan": "007853",

SELECT *
FROM PUBLIC.TRANLOG_READONLY T
WHERE ss_rrn='468101778911'
  --T.DATE = '2023-11-10 06:25:34.000000'
 T.LOCALTRANSACTIONDATE = '2023-11-13 02:16:37.000000' --'2023-11-10T06:25:34'
  AND T.TRANSACTION_TOKEN = '2023314600013398'
  AND T.AMOUNT = '20500'
  AND T.CURRENCYCODE = '600'
  AND T.TID = '26989261'
  AND T.MID = '000000002400172'
  AND T.SS_STAN = '007853';
-------------------
SELECT * FROM PUBLIC.TRANLOG t
WHERE DATE BETWEEN '2023-07-31 14:50:00.865000' AND '2023-07-31 15:10:59.000000' AND t.AMOUNT='4250000';

SELECT * FROM SAF.MESSAGE_QUEUE MQ LIMIT 1;

#transaction_token
select * from qr.qr_transactions qr order by initial_date desc;

select * from public.tranlog_readonly t where t.transaction_token = '2024081500694820';
select * from public.tranlog t WHERE date>='2024-03-02 13:11:31.955000'  AND ss_rrn='466206130451';

select * from tranlog t where transaction_token = '2024082600702424';

SELECT * from keys_cybersource_shops where cybersource_shop_id = 'dinelco_mf_001969000006';

update keys_cybersource_shops
set cybersource_public_key = '05d756fe-ff5a-476d-af2a-9d8dc0777a88',
    cybersource_private_key = 'iCF8+S7T/+hTYPPnCYBc+j5rjJzmQp0hoq83pq3aTTo='
where cybersource_shop_id = 'dinelco_mf_001969000008';

update keys_cybersource_shops set
cybersource_public_key = '962d25f8-46f2-4f0e-bae1-65aed1bd7f30',
cybersource_private_key ='DLKlCCIbGXtcco5P5+YtJn3qD2ePvQ+tNjS9z/++tcw='
where cybersource_shop_id =  'dinelco_mf_001969000009';

update keys_cybersource_shops set
cybersource_public_key = '934ab2d6-f696-43ee-be94-ad2359e26064',
cybersource_private_key = '/5Gt7VKW0YW7szdDyGjs0iCtfeFRZ02jmSDMT2yFWF0='
where cybersource_shop_id =  'dinelco_mf_001969000006';

update keys_cybersource_shops set
cybersource_public_key = '77e6b199-b547-402e-9f9d-278d084cfdf4',
cybersource_private_key = 'vvXuTXj8s4Nm7SbWPMSgOXOgbDKAOPC8EK8nsRuk214='
where cybersource_shop_id =  'dinelco_mf_001969000012';

update keys_cybersource_shops set
cybersource_public_key = '8cd78ba8-48f2-4ace-9c67-0ea7ea5c1d3f',
cybersource_private_key = 'WoUle0w32ERj6uN7kJkiRMINCBbiM24rZT8fTeQNcMk='
where cybersource_shop_id = 'dinelco_mf_001969000011';

update keys_cybersource_shops set
cybersource_public_key = 'b881a151-ce2f-4e45-bf54-f758ba1d1f5c',
cybersource_private_key = 'cNNT+D4jTbg1qA/VYK0qQajQH7NVT0ToxBJ+vPhZBPc='
where cybersource_shop_id =  'dinelco_mf_001969000013';

update keys_cybersource_shops set
cybersource_public_key = '35a280ef-dde5-482f-ad73-610d9cb11179',
cybersource_private_key = 'SCiPTRPtOqDwCWV+PwS4XWq3D09JuwL6+KxhiwEf8Sw='
where cybersource_shop_id =  'dinelco_mf_001969000010';

update keys_cybersource_shops set
cybersource_public_key = '0e0e3014-cc0e-4d9c-a93c-c90b6b3963f4',
cybersource_private_key = 'sYYPm5XPmPWac2+UtlJt8rJrGqErEMu8D+MY/Qm7feo='
where cybersource_shop_id =  'dinelco_mf_001969000009';

update keys_cybersource_shops set
cybersource_public_key = '7bcf7b78-f792-4099-9e8b-b522afa36b0d',
cybersource_private_key = 'UkOiRZuvmfFOyaNrz+4g/do8s7F5X6CI8Z7pfW1sYVM='
where cybersource_shop_id =  'dinelco_mf_001969000008';