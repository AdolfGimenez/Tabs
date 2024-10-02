--------------------------------AUTORIZACIONES PENDIENTES NEGATIVAS
-- Select de verificacion
select * from gxbdbps.tmctaaf where MCNUMCT in (
'40050000013', '40050000024', '40050000032', '40050000060', '40050000225', '40050000259', 
'40050000281', '40050000435', '40050000521', '40050000730', '40050000827', '40050000968', 
'40050001299', '40050001357', '176100000072')
and MCEMISO='176'

--Ajuste de autorizaciones pendiente
UPDATE GXBDBPS.TMCTAAF  AUT  SET AUT.MCAUTPE = coalesce((select sum(APIMPOR) from gxbdbps.tautpaf A where AUT.mcnumct = A.APNUMCT and a.APSTATS='P' and a.APCANCU=1),0)
,MCAPCOC = coalesce((select sum(APIMPOR) from gxbdbps.tautpaf a where AUT.mcnumct = A.APNUMCT and a.APSTATS='P' and CMCODIG='005' and a.APCANCU=1),0), --compras contado
MCAPCUC = coalesce((select sum(APIMPOR) from gxbdbps.tautpaf a where AUT.mcnumct = A.APNUMCT and a.APSTATS='P' and CMCODIG='005' and a.APCANCU>1),0), --compra cuotas
mcapcua = coalesce((select sum(APIMPOR) from gxbdbps.tautpaf a where AUT.mcnumct = A.APNUMCT and a.APSTATS='P' and CMCODIG='010' and a.APCANCU>1),0), --Adelanto Cuotas
mcapcoa = coalesce((select sum(APIMPOR) from gxbdbps.tautpaf a where AUT.mcnumct = A.APNUMCT and a.APSTATS='P' and CMCODIG='010' and a.APCANCU=1),0) -- Adelanto CONTADO
where AUT.mcnumct in ('40050000013', '40050000024', '40050000032', '40050000060', '40050000225', '40050000259', 
'40050000281', '40050000435', '40050000521', '40050000730', '40050000827', '40050000968', 
'40050001299', '40050001357', '176100000072')
and MCEMISO='176'

update gxbdbps.tmctaaf set mcdisco = mclimco - (mcsafac + mcsfnve + mcsalfi + mcapcoc + mcapcoa + mccuopc + mccuopa) where MCNUMCT in 
('40050000013', '40050000024', '40050000032', '40050000060', '40050000225', '40050000259', 
'40050000281', '40050000435', '40050000521', '40050000730', '40050000827', '40050000968', 
'40050001299', '40050001357', '176100000072')
and MCEMISO='176'
update gxbdbps.tmctaaf set mcdiscu = mclimcu - (mccuope + mcadepe + mcapcuc + mcapcua + mcrefpe) where MCNUMCT in 
('40050000013', '40050000024', '40050000032', '40050000060', '40050000225', '40050000259', 
'40050000281', '40050000435', '40050000521', '40050000730', '40050000827', '40050000968', 
'40050001299', '40050001357', '176100000072')
and MCEMISO='176'



-- Select de verificacion
select * from gxbdbps.tmctaaf where MCNUMCT in (
'40050000412',  
'40050000940',  
'40050001155',  
'40050001259',  
'40050001418')  
and MCEMISO='176'

--Ajuste de autorizaciones pendiente
UPDATE GXBDBPS.TMCTAAF  AUT  SET AUT.MCAUTPE = coalesce((select sum(APIMPOR) from gxbdbps.tautpaf A where AUT.mcnumct = A.APNUMCT and a.APSTATS='P' and a.APCANCU=1),0)
,MCAPCOC = coalesce((select sum(APIMPOR) from gxbdbps.tautpaf a where AUT.mcnumct = A.APNUMCT and a.APSTATS='P' and CMCODIG='005' and a.APCANCU=1),0), --compras contado
MCAPCUC = coalesce((select sum(APIMPOR) from gxbdbps.tautpaf a where AUT.mcnumct = A.APNUMCT and a.APSTATS='P' and CMCODIG='005' and a.APCANCU>1),0), --compra cuotas
mcapcua = coalesce((select sum(APIMPOR) from gxbdbps.tautpaf a where AUT.mcnumct = A.APNUMCT and a.APSTATS='P' and CMCODIG='010' and a.APCANCU>1),0), --Adelanto Cuotas
mcapcoa = coalesce((select sum(APIMPOR) from gxbdbps.tautpaf a where AUT.mcnumct = A.APNUMCT and a.APSTATS='P' and CMCODIG='010' and a.APCANCU=1),0) -- Adelanto CONTADO
where AUT.mcnumct in ('40050000412',  
'40050000940',  
'40050001155',  
'40050001259',  
'40050001418')  
and MCEMISO='176'

update gxbdbps.tmctaaf set mcdisco = mclimco - (mcsafac + mcsfnve + mcsalfi + mcapcoc + mcapcoa + mccuopc + mccuopa) where MCNUMCT in 
('40050000412',  
'40050000940',  
'40050001155',  
'40050001259',  
'40050001418')  
and MCEMISO='176'
update gxbdbps.tmctaaf set mcdiscu = mclimcu - (mccuope + mcadepe + mcapcuc + mcapcua + mcrefpe) where MCNUMCT in 
('40050000412',  
'40050000940',  
'40050001155',  
'40050001259',  
'40050001418')  
and MCEMISO='176'
