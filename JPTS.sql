--vemor qr generado
select * from JPTSAPI.qr_transactions  t order by initial_date desc;

--para buscar trx aprobadas
SELECT T.ATM_SESSION_ID, T.MID, T.TID, T.AMOUNT, T.BIN, T.LAST_FOUR, T.SS_STAN, T.DSRC
FROM JPTSAPI.TRANLOG T
WHERE T.date BETWEEN '2023-05-09 18:00:00' AND '2023-05-09 18:30:00'  AND T.TID = '19899552';

--para buscar su contra parte, si tiene la reversa
SELECT * FROM JPTSAPI.TRANLOG
WHERE date BETWEEN '2023-05-09 18:00:00' AND '2023-05-09 18:30:00' AND AMOUNT = 9550.00
  AND SS_STAN = '004833' AND MID LIKE '%000000000704065';
------------------------------------------

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
-------------------
SELECT * FROM PUBLIC.TRANLOG t
WHERE DATE BETWEEN '2023-07-31 14:50:00.865000' AND '2023-07-31 15:10:59.000000' AND t.AMOUNT='4250000';

SELECT * FROM JPTSAPI.MESSAGE_QUEUE MQ LIMIT 1;
select * from JPTSAPI.stations S;
--transaction_token
select * from JPTSAPI.qr_transactions qr order by initial_date desc;

/*los que inician con dinelco_00111111 -> su main id es: dinelco_checkout
los que inician con dinelco_link_0011111 -> su main id es: dinelco_link
los que inician con dinelco_mf_0011111 -> su main id es: dinelco_mf
los que inician con dinelco_da_0011111 - > su main id es: dinelco_debitoauto
dinelco_0012300xxxxx (codigo de cliente de documenta), corresponde al main id dinelco_documeta
CYBERSOURCE_SHOP_ID = 'dinelco_bm_002327100002' AND CYBERSOURCE_SHOP_MAIN_ID = 'dinelco_bancame'*/

SELECT * FROM JPTSAPI.KEYS_CYBERSOURCE_SHOPS where cybersource_shop_id = 'dinelco_002692900047';
--inserta
INSERT INTO JPTSAPI.KEYS_CYBERSOURCE_SHOPS ( CYBERSOURCE_SHOP_ID, CYBERSOURCE_PUBLIC_KEY, CYBERSOURCE_PRIVATE_KEY, CREATED_AT, CYBERSOURCE_SHOP_MAIN_ID, ENTITY_ID) VALUES
( 'dinelco_002904300001',  '252c30ea-6dd5-4720-bf9e-1c2fff538c23',
 'S/itACoGpwiSc4bDsd2Hskwl4/Af3EAzB1D4NxbGPRk=',
 now(), 'dinelco_checkout', NULL);

--15 caracteres completar con 000
select * from JPTSAPI.cybersource_merchant_routing where merchant_id IN ('000000001900552');
--  legacy_code = '0304382' AND branch_name = 'BM - RAPIDCOMPRA.COM'
INSERT INTO JPTSAPI.cybersource_merchant_routing (merchant_id, create_at, merchant_name)
VALUES('000000001900552', now(), 'SG COMERCIAL');

--actualiza
update JPTSAPI.keys_cybersource_shops
set cybersource_public_key = 'ead9f407-3d46-4e30-bea0-e4195895fbda',
    cybersource_private_key = 'yHBRT1l68r/ayUT1xFIhRrk348kf3AzdB8BmDzlOrEI='
where cybersource_shop_id = 'dinelco_002729500001';
---------------------------------------------------
---en otras monedas
SELECT * FROM JPTSAPI.TRANLOG t
WHERE t."DATE" BETWEEN '2025-06-09 00:00:00.000' AND '2025-06-09 09:05:27.999'
  AND t.DESTINATIONS = 'ds-pix' AND t.AMOUNTCARDHOLDERBILLING = 433.17;

SELECT * FROM JPTSAPI.TRANLOG t
WHERE t.DATE BETWEEN '2025-06-25 00:00:00.908000' AND '2025-06-25 09:59:59.999' AND t.TRANSACTION_TOKEN='2025176401546384'--AND t.AMOUNT='77000';
---history insert ex apilog
SELECT * FROM JPTSAPI.HISTORY_LOGS HL WHERE HL.RRN='577600250557';
SELECT * FROM LIBDEBITO.DRCONBEP D WHERE D.LERRNB='577600250557';