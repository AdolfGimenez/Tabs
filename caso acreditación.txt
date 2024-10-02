--caso 1 SUPER SEIS ENCARNACION
-- cambiar a a y fecha comercial a hoy para que liqueide, ver con el tio el tema de lcored es BATCH

select * from libdebito.drconbep where lidcom='6000376' and LERRNB in ('028607606545', '028807905239')

update  libdebito.drconbep set lfcotr='20210312', LESTTR='A', lcored='981'
where lidcom='6000376' and LERRNB in ('028607606545', '028807905239')


select * from gxbdbps.comaeaf where cocomer='6000376'



select * from gxbdbps.coafmaf where afcodi='2157845'

select * from gxopera.opmovi where opcomer='6000376' and opmonto='5035'    

select * from gxopera.opmovi where opcomer='6000376' and opmonto='7920' 

select * from gxopera.flicom1 where licomer='6000376' and limonto in ('5035.00', '7920.00')



-- caso 2 SUPER SEIS 3 DE FEBRERO este es correr clearing oniline

select * from libdebito.drconbep where lerrnb in ('106345442500', '106345442232', '106345442491')

select sum(limpgs) from libdebito.drconbep where lidcom='0701042' and lfcotr in ('20210312') and lcodtr='000054'  and LCRETR='00' and lenemi<>'152'

select * from libdebito.drconbep where lidcom='0701042' and 

lerrnb in (
'107046820611', 
'107146870548', 
'107146907880', 
'107046832852', 
'106345442500') 

 and LCODTR='000054' and LCRETR='00' 

select sum(opmonto) from gxopera.opmovi where opcomer='0701042'    and opfecom='20210312'

select sum(limonto) from gxopera.flicom1 where licomer='0701042'  and lifechd='20210312' and limonto in ('22904.00') and lifechd='20210304'

Select * from gxopera.opliqui 
where opnroref='106345442500'

-- caso 3 SUPER SEIS DENIS ROA este es correr clearing oniline


select * from libdebito.drconbep where lidcom='0700537' and lfectr in ('20210304') and lcautr='329976'

select * from gxopera.opmovi where opcomer='0700537' and opfecom='20210304'  and opmonto='96819' 

select * from gxopera.flicom1 where licomer='0700537' and lifechd='20210304' and limonto in ('96819.00')

Select * from gxopera.opliqui 
where opnroref='106345442232'

-- caso 4 stock ita este es correr clearing oniline

select * from libdebito.drconbep where lidcom='0700693' and lfectr in ('20210304') and lcautr='876729'

select * from gxopera.opmovi where opcomer='0700693' and opfecom='20210304' and opmonto='45000' 

select * from gxopera.flicom1 where licomer='0700693' and lifechd='20210304' and limonto in ('45000.00')

Select * from gxopera.opliqui 
where opnroref='106345442491'


-- caso 5 stock capiata, esta acreditado al comercio, especial ver silver tbn 

select * from libdebito.pruebclr where lidcom='0700692' and LERRNB ='106345442468' and lcautr='347336'



select * from libdebito.drconbep where lidcom='0700692' and LERRNB ='106345442468' and lcautr='347336'

select * from gxopera.opmovi where opcomer='0700692'  and opnoref='106345442468' and opfecom='20210304'

select * from gxopera.flicom1 where licomer='0700692' and lifechd='20210304' and limonto in ('30000.00')

Select * from gxopera.opliqui 
where opnroref='106345442468'


select LIDCOM as COD_COMERCIO, LFECTR as FECHA_REAL, LHORTR as HORA, LNRTAR AS TARJETA, LBINPR AS BIN, LIMPGS as MONTO,
LIDTRA, LCOMTR as COMERCIO, LORITR, LCODTR as CODIGO_TRX, LCODBC, LCAUTR as COD_AUTORIZ, LCRETR as COD_RESP, LESTTR as RESPUESTA, LERRNB, LECA62
from libdebito.drconbep where lfectr='20210430' AND LACTFJ in ('T004', 'T005', 'T007', 'T008', 'T009', 'T010', 'T013', 'T014', 'T015', 'T016',
'T017', 'T018', 'T019', 'T021', 'T022', 'T023', 'T025', 'T028', 'T029', 'T032',
'T033', 'T034', 'T035', 'T036', 'T037', 'T041', 'T042', 'T043', 'T044', 'T049',
'T050', 'T051', 'T052', 'T053', 'T054', 'T056', 'T058', 'T059', 'T061', 'T062',
'T065', 'T066', 'T067', 'T068', 'T069', 'T073', 'T074', 'T075', 'T076', 'T077',
'T079', 'T080', 'T081', 'T082', 'T083', 'T085', 'T086', 'T087', 'T088', 'T089',
'T090', 'T091', 'T092', 'T095', 'T096', 'T097', 'T098', 'T099', 'T102', 'T104',
'T106', 'T107', 'T109', 'T111', 'T113', 'T116', 'T117', 'T118', 'T123', 'T124',
'T125', 'T126', 'T128', 'T134', 'T135', 'T138', 'T141', 'T145', 'T151', 'T152',
'T154', 'T155', 'T158', 'T159', 'T160', 'T161', 'T162', 'T163', 'T168', 'T173',
'T174', 'T175', 'T176', 'T177', 'T179', 'T180', 'T182', 'T183', 'T184', 'T185',
'T186', 'T187', 'T190', 'T191', 'T192', 'T193', 'T196', 'T197', 'T198', 'T199',
'T202', 'T203', 'T204', 'T205', 'T207', 'T212', 'T213', 'T214', 'T215', 'T216',
'T217', 'T218', 'T219', 'T220', 'T222', 'T223', 'T224', 'T225', 'T226', 'T229',
'T230', 'T231', 'T232', 'T233', 'T234', 'T236', 'T238', 'T239', 'T240', 'T241',
'T242', 'T244', 'T245', 'T254', 'T255', 'T259', 'T260', 'T261', 'T262', 'T263',
'T264', 'T265', 'T266', 'T267', 'T268', 'T269', 'T271', 'T273', 'T274', 'T275',
'T279', 'T281', 'T284', 'T285', 'T288', 'T289', 'T291', 'T292', 'T294', 'T296',
'T297', 'T299', 'T300', 'T301', 'T303', 'T308', 'T309', 'T316', 'T320', 'T321',
'T322', 'T326', 'T327', 'T328', 'T329', 'T330', 'T331', 'T332', 'T333', 'T334',
'T335', 'T336', 'T337', 'T338', 'T340', 'T341', 'T342', 'T344', 'T345', 'T347',
'T348', 'T349', 'T350', 'T351', 'T352', 'T353', 'T354', 'T355', 'T356', 'T357',
'T358', 'T359', 'T360', 'T362', 'T363', 'T364', 'T365', 'T366', 'T367', 'T368',
'T369', 'T371', 'T372', 'T373', 'T375', 'T376', 'T377', 'T378', 'T380', 'T381',
'T386', 'T387', 'T389', 'T390', 'T391', 'T392', 'T393', 'T394', 'T395', 'T396',
'T397', 'T398', 'T399', 'T400', 'T401', 'T402', 'T404', 'T411', 'T436', 'T449',
'T468', 'T469', 'T470', 'T473', 'T474', 'T476', 'T483', 'T489', 'T490', 'T491',
'T494', 'T496', 'T497', 'T498', 'T499', 'T500', 'T504', 'T505', 'T509', 'T520',
'T523', 'T526', 'T527', 'T528', 'T532', 'T533', 'T534', 'T535', 'T536', 'T537',
'T545', 'T147', 'T148', 'T172', 'T246')
and lhortr>'180000' order by lhortr desc

select * from gxfindta.tcltsb where TSBFECCON='20210304' and TSBCOCO='0700692' and TSBNREF='106345579232'


select * from libdebito.drconbep where lerrnb 
in ('106345442500', '106345442232', '106345442491')


-- 

select * from yapi.aux1

update   yapi.aux1 set LFCOTR='20210312',  lfectr='20210312', LFECEN='20210312'




select lerrnb, lnrtar, lidcom, lidtra, lfectr, lhortr, 
lbinpr                                                 
from libdebito.pruebclr inner join gxopera.opentid1    
on lenemi = entcodi where lfectr between ''        
and '20210312' and lcretr = '00' and lesttr = 'A'          
and limpgs > 0 and                                     
lbinpr in ('627431', '703002', '703040', '703020')     
and lcodtr = '000054'  and enttipo = 'DEB'             
       
except                                                           
                                                                 
select opnoref, optarj, opcomer, opidtra, opferea, ophotrn,      
substr(optarj , 1 , 6) from GXOPERA.opmovi                       
where opfecom = '20210312' and opferea = '20210312' and                 
opcodtrn = '000054' and optiptar = 'DEB';                        


select * from atmcentre.LOGATMCENT where ATMCTIMST 
between '2021-04-30 18:00:00' and '2021-04-30 20:00:00'


select * from libdebito.pruebclr where lidcom='0700692' and LERRNB ='106345442468' and lcautr='347336'

select lerrnb, lnrtar, lidcom, lidtra, lfectr, lhortr, 
lbinpr                                                 
from libdebito.pruebclr inner join gxopera.opentid1    
on lenemi = entcodi where lfectr between '20210507'        
and '20210507' and lcretr = '00' and lesttr = 'A'          
and limpgs > 0 and                                     
lbinpr in ('627431', '703002', '703040', '703020')     
and lcodtr = '000054'  and enttipo = 'DEB'             
       
except                                                           
                                                                 
select opnoref, optarj, opcomer, opidtra, opferea, ophotrn,      
substr(optarj , 1 , 6) from GXOPERA.opmovi                       
where opfecom = '20210507' and opferea = '20210507' and                 
opcodtrn = '000054' and optiptar = 'DEB';                        


select * from gxbdbps.tswaut where AUTRRNBEP='106345442468'

select * from gxfindta.tcltsb
where TSBNREF='106345442468'

select * from gxfindta.tclmov
where MOVRRNBEP='106345442468'

Select * from gxfindta.tcltsb where tsbcoco = '0703780' and tsbnref in ('109050953723','109050974983','109050979238');

select * from gxbdbps.tswaut where AUTRRNBEP in ('109050953723', '109050974983', '109050979238')

Select * from gxfindta.tcltsb where tsbcoco = '0703289' and tsbnref in ('110554142856','110554143892');

Select * from gxfindta.tcltsb where tsbcoco = '0702665' and tsbnref in ('109050863268');

Select * from gxbdbps.tswaut where AUTRRNBEP in ('109050863268')

Select * from gxopera.opliqui 
where opnroref='109050863268'
