[Ayer 15:30] Willian Reinaldo Arce Zarate
SELECT *FROM GXBDBPS.TAFITRA WHERE COCOMER = '0200819'
SELECT *FROM gxbdbps.GENTIAF WHERE enemiso = '155'

[Ayer 15:33] Willian Reinaldo Arce Zarate
SELECT *FROM GXBDBPS.TAFITRA a 
LEFT JOIN GXBDBPS.COMAEAF b ON b.cocomer = a.cocomer
WHERE PARENE = '155' AND TRAEST = 'A'


****************************************************************************************************************
****************************************************************************************************************
-- BEPSA

select *from gxbdbps.tafitra where parene='155' 3434
delete from gxbdbps.tafitra where parene='155' 

insert into gxbdbps.tafitra (PARENE, PARBIN, PARAFINI, COCOMER, TRAEST, TRAFCHALT,TRAUSRALT, TRAFCHMOD, TRAUSRMOD)
( select '155','627431','001', cocomer,'A', '20200124','U99JOSEEN','20200619',''
from gxbdbps.comaeaf where substr(cocomer,1,2) in ('02','07','24','28','60') and costat = 0)
3357 registros insertados. 
****************************************************************************************************************
****************************************************************************************************************
--AVALON

DELETE from gxbdbps.tafitra where parene='178'

insert into gxbdbps.tafitra (PARENE, PARBIN, PARAFINI, COCOMER, TRAEST, TRAFCHALT,TRAUSRALT, TRAFCHMOD, TRAUSRMOD)
( select '178','627431','001', cocomer,'A', '20210506','U99HERNAN','20210506',''
from gxbdbps.comaeaf where substr(cocomer,1,2) in ('02','07','24','28','60') and costat = 0)


****************************************************************************************************************
****************************************************************************************************************
****************************************************************************************************************
****************************************************************************************************************
--CONTI

DELETE from gxbdbps.tafitra where parene='021'

insert into gxbdbps.tafitra (PARENE, PARBIN, PARAFINI, COCOMER, TRAEST, TRAFCHALT,TRAUSRALT, TRAFCHMOD, TRAUSRMOD)
( select '021','627431','508', cocomer,'A', '20210506','U99HERNAN','20210506',''
from gxbdbps.comaeaf where substr(cocomer,1,2) in ('02','07','24','28','60') and costat = 0)


****************************************************************************************************************
****************************************************************************************************************

select *from gxbdbps.tafitra where parene='155' and COCOMER in (
'6000682', 
'6000683', 
'6000684', 
'6000685', 
'6000686', 
'6000687', 
'6000688', 
'6000689', 
'6000690', 
'6000691', 
'6000692', 
'6000693', 
'6000694', 
'6000695')

select *from gxbdbps.tafitra where parene='155' and COCOMER in ('6000722')

select costat from gxbdbps.comaeaf where cocomer='6000722'


