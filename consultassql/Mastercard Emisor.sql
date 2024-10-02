---/*CONSULTAS PARA MASTERCARD EMISOR*/                      
/*CONSULTAS PARA MASTERCARD ADQUIRENTE*/                     
select lfectr fecha_real,lhortr hora,substr(lerrnb,2,13) refencia,lerrnb, b.mcpannmbr tarje_mast,lcodbc MARCA,lenemi entidad,
lesttr estado,lcretr cod_retorno,lcodtr cod_trx,limpgs importe,mcmsgtype,MCMIPCONN,--lidcom cod_comercio,
lcomtr comercio,b.mcrol rol,b.mcf044rmsg mensaje,lcautr
from libdebito.drconbep inner join mastercard.mastrndta b on lerrnb=MCRRNBEPSA
--and lbinpr in ('542927','230671','530399') 
where lfectr between '20221130' and '20221130' --and b.mcrrnbepsa='010663493281'
--and lbinpr='230671'
--and lbinpr='601637'
--and lerrnb='217970906625'
--and lcretr in ('91','06')--,'91')
AND mcrol='ISS' 
--and substr(lidtra,1,1)='P'
and b.mcpannmbr in ('2306710001429696')--,'5447313236148265','5201328358438365')
--and lcautr in ('013776 ','265964 ','471266')
--and lcretr in ('12','05','57')
--and lcodtr in ('014000')--,'011000','012000')
--and lhortr>190000
--and lcomtr like '%ATM%SUC.%BNF%ITACURUBI%'
--and mcmipconn='MIP ADQUIRENTE SMS 1'
order by lhortr desc
 
'230671', --mastercard debito
'530399', --mc oro conti
'514848', --mc black
'542927', --mc clasica
'547697', -- mc waled
'546297', --mc debito rio 
'230729') --mc prepaga conti

select * from gxbdbps.lgcoment where date(lgfechor)='2022-11-30' and  lgentid='1020' and lgmsg like '%233420857497%'   order by lgfechor desc



select substr(mcfecreal,1,8),mcmti,substr(mchorareal,1,2),count(*)
 from mastercard.mastrndta where  mcfecreal between '20221019'
-- and substr(mchorareal,1,2)>'20'
 group by substr(mcfecreal,1,8),substr(mchorareal,1,2) ,mcmti
 order by substr(mcfecreal,1,8),substr(mchorareal,1,2) desc
MCMTI='110' and

SELECT * FROM GXBDBPS.TDEMIS t WHERE TDCTANRO ='2120436723'
 
select substr(mcfecreal,1,8),count(*)
 from mastercard.mastrndta where  mcfecreal between '20220115' and '20220131'
-- and substr(mchorareal,1,2)>'20'
 group by substr(mcfecreal,1,8)
 order by substr(mcfecreal,1,8) desc
 

select * from mastercard.mastrndta where mcfecreal between '20221007' and '20221007'  order by mchorareal desc

select mcrol,mcmti,mcfld037,mcrrnbepsa,mcmovseq,mcpannmbr,mcfeccom,mcfecreal,mchorareal,mcimporte,mcf044rmsg,MCMSGTYPE,MCMIPCONN
from mastercard.mastrndta where mcfecreal between '20221130' and '20221130' --and mcfld037='215600074623'
--group by mcrol,mcmti,mcfld037,mcrrnbepsa,mcmovseq,mcpannmbr,mcfeccom,mcfecreal,mchorareal,mcimporte,mcf044rmsg
--and mcpannmbr='2306710001429696'
and mcrol='ISS' and mcmti='430'
order by mchorareal desc
t1
union on t1.mcfld037=t2.mcfld037
select mcrol,mcmti,mcfld037,mcrrnbepsa,mcmovseq,mcpannmbr,mcfeccom,mcfecreal,mchorareal,mcimporte,mcf044rmsg,MCMSGTYPE,MCMIPCONN
from mastercard.mastrndta where mcfecreal between '20221130' and '20221130' --and mcfld037='215600074623'
--group by mcrol,mcmti,mcfld037,mcrrnbepsa,mcmovseq,mcpannmbr,mcfeccom,mcfecreal,mchorareal,mcimporte,mcf044rmsg
--and mcpannmbr='2306710001429696'
and mcrol='ISS' and mcmti='110'
t2

select * from gxtrjdta.tdgbin where substr(binnrobin,1,6) ='433181' 



select * from libdebito.tbinproc where pbin='433181'


select * from gxbdbps.comaeaf where cocomer ='0700663'
--relacion tajeta titular

select  mcfecreal, mchorareal,mcrol,mcmti,mcpannmbr tarje_mast,mcfld037,crnomb,mcmsgtype,MCMIPCONN,
mcf044rmsg mensaje,mcpancvv2,mcrrnbepsa,mcmovseq,mcimporte,mccomcod
from mastercard.mastrndta inner join libdebito.tgembhaf on mcpannmbr=crtarj
where mcfecreal='20220319' and substr(mcpannmbr,1,6) in ('530399','514848')
and crnomb like '%ALTIERI%'
 

select * from libdebito.tgembhaf
530399 mc oro
514848 mc black



select *  from libdebito.DRCONBEP
WHERE LNRTAR = ' ';

/*Banco Continental BNF*/
Select opidliq,substr(opcampoa,41,8)FechaComercial, opfecliq fecha, ophorliq hora, opnroref referencia,opncomer comercio, codeno denominacion, corucn ruc, corazo social, a.enemiso banco, pardescri desbanco, adnumcta cuenta, substr(parcswift,1,8) swift, opimpor Importe, opmensaj Mensaje, opcodbco Banco, opstat EstadoBNF, opstatob estadobco

select *  

SELECT * FROM GXBDBPS.TDENTCOM;
from gxopera.opliqui inner join gxbdbps.comaeaf a on opncomer = cocomer inner join gxopera.clparf on a.enemiso = parcodbco
where opfecliq >= '20220101' --and substr(opcampoa,1,6) = '703002' and enemiso = '002' --and opnroref = 21120705760624
and opstatob ='96'
and opstat not in ('00','77','88') and opstatob not in ('00','77','88')
order by opidliq




select COUNT(*) CANTIDAD,lbinpr AS BIN ,d.pdescricion descrip_marca, lcodbc AS MARCA, lcretr AS CODIGO, coddes Descripcion_DEL_CODIGO
from libdebito.drconbep
inner join LIBDEBITO.TBCTRA0P A on A.TXCTRX = lcodtr
right join libdebito.tbcret0p on lcretr = codnro
inner join mastercard.mastrndta b on lerrnb=MCRRNBEPSA inner join LIBDEBITO.TBCTRA0P c on c.TXCTRX = lcodtr
inner join libdebito.tbinproc d on lbinpr=pbin
where lfectr='20220505' and lcodbc = 'MST' and codmar='MSTC' --and lbinpr LIKE ('546297%')
And lcodtr IN ('000054','011000','012000')
and lcretr in ('91','92','05')
and lhortr between '170000' and '224500' -- and substr(lidtra,1,1)= 'T'
GROUP BY lbinpr,pdescricion, lcretr, lcodbc,LENEMI,coddes
order by lcretr asc, cantidad desc;





select * from gxfindta.tclser

[09:06] Jose Enciso.
Gracias! miro esa tabla 



select * from adolfolib.AIT002HIST where aiid=''


select * from gxbdbps.coma3af where cocomer in ('','','')



select mcfld037,mcrrnbepsa,mcpannmbr,mcfeccom,mcfecreal,mchorareal,mcimporte,mcf044rmsg,MCMSGTYPE,MCMIPCONN
from mastercard.mastrndta where mcfecreal between '20221007' and '20221007' --and mcfld037='215600074623'
--group by mcrol,mcmti,mcfld037,mcrrnbepsa,mcmovseq,mcpannmbr,mcfeccom,mcfecreal,mchorareal,mcimporte,mcf044rmsg
order by mchorareal desc

