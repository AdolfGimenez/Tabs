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
set cybersource_public_key = '82c8c803-01b5-4709-b787-e52f0ea3bb90',
    cybersource_private_key = 'w2/B3si/Pqr0vii7PILOCpPYmxZoAYxb2ihb3Eh+JDE='
where cybersource_shop_id = 'dinelco_mf_001969000006';

update keys_cybersource_shops set
cybersource_public_key = 'f0c74694-91b4-48d3-a887-026f4d2683c7',
cybersource_private_key ='Voan5Twg7fSM08THtVf7aYlz3ewsV/Cl0Jv+ZNpy0bw='
where cybersource_shop_id =  'dinelco_mf_001969000007';

update keys_cybersource_shops set
cybersource_public_key = 'a7606707-374e-471e-a07e-3727cbce004f',
cybersource_private_key = 'ikUL0sGF1GV4tyPz23Y3Hb5V4GMu2nxbtajZVPKkrXA='
where cybersource_shop_id =  'dinelco_mf_001969000005';

update keys_cybersource_shops set
cybersource_public_key = 'd56ea9e1-2409-4189-9d11-b45594896261',
cybersource_private_key = 'sjYkKGe2/0UzRGqrNhpb0Io0/RHwDzWjzxeDkNKR4fg='
where cybersource_shop_id =  'dinelco_mf_001969000010';

update keys_cybersource_shops set
cybersource_public_key = '2fe49a66-f163-446e-82b0-714137b4a687',
cybersource_private_key = 'p+5+OPYUhOI3Z89OLbVRYRGjshwYXDNGNyMm0ogIUnA='
where cybersource_shop_id = 'dinelco_mf_001969000013';

update keys_cybersource_shops set
cybersource_public_key = '0c82fd3d-6a5c-4528-ad9a-9b1cfd5576f3',
cybersource_private_key = 'r6HIGK1X4L7AHYUvaRnWatLICF1r+l8UEQMQXRHBIgw='
where cybersource_shop_id =  'dinelco_mf_001969000011';

update keys_cybersource_shops set
cybersource_public_key = '3bb8bff0-b7e5-4a54-b414-d241c8fa3513',
cybersource_private_key = 'D3D8aIDD6h6bH81IY1M370vkohzpZWrF2UzJRd6YVto='
where cybersource_shop_id =  'dinelco_mf_001969000012';

update keys_cybersource_shops set
cybersource_public_key = '0e0e3014-cc0e-4d9c-a93c-c90b6b3963f4',
cybersource_private_key = 'sYYPm5XPmPWac2+UtlJt8rJrGqErEMu8D+MY/Qm7feo='
where cybersource_shop_id =  'dinelco_mf_001969000009';

update keys_cybersource_shops set
cybersource_public_key = '7bcf7b78-f792-4099-9e8b-b522afa36b0d',
cybersource_private_key = 'UkOiRZuvmfFOyaNrz+4g/do8s7F5X6CI8Z7pfW1sYVM='
where cybersource_shop_id =  'dinelco_mf_001969000008';