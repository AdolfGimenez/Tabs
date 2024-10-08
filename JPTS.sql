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

select * from tranlog t where transaction_token = '2024082600702424'