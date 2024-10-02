/*CONSULTAS PARA VISA EMISOR*/ 
SELECT SUBSTR(LFECTR,1,4) || '-' ||SUBSTR(LFECTR,5,2) || '-' ||SUBSTR(LFECTR,7,2) fecha_real,VIFLD037,lhortr hora,lnrtar tarje_trx,
virol rol_visa,lerrnb,substr(lnrtar,1,6) tarje_trx,Substr(b.vipannmbr,1,6) tarje_visa,lcodbc MARCA,lenemi entidad,
lesttr estado,lcretr cod_retorno,lcodtr cod_trx,limpgs importe,lidcom cod_comercio,lcomtr comercio,b.virol,lidtra,b.vif044rmsg mensaje,
lnfisc,vimti,lposem,virol fROM libdebito.drconbep
  INNER JOIN visa.vistrndta b ON lerrnb = virrnbepsa
WHERE lfectr BETWEEN '20221130' AND '20221130'
--and lidcom='6000175'
--and lcodtr='000054'
--and lcomtr like '%Vienesa%'
---and lcretr in ('19')--,'91','05','76')--,'','','')
--and lesttr='R'
and virol IN ('ADQ')
--'ISA',n
--and substr(lidtra,1,1)='M'
--and lcretr IN ('81','05') 
--AND lbinpr IN ('456976')
--,'488234')
--and vipannmbr IN ('4594300000000016','4594300000000032')
--and vipannmbr='4569760000382808'
--and lnfisc in ('443073','472040')
--and vimti='110'
--and lenemi='020' --Filtrar solo para conti  002 BNF 040 Rio 
--and lcodbc='MST'
--and lhortr>233500
--and lerrnb in ('223488110069')--,'220278158409','220278163745')
--and vimti='120'
--and lcretr='14'
--and limpgs=192750
--AND lcautr='685433'
--and lactfj = '14281635'
--and lhortr >020800
--and vif044rmsg = 'AzCrypto Error AzCryRerr : 0008 - 0032'
ORDER BY lhortr DESC


select * from gxbdbps.tdcta WHERE  TDCTANRO='3121339497'

select virol,  ,count(*) from visa.vistrndta
where  lfectr between '20220130' and '20220210'
group by virol,lcodtr

select * from gxbdbps.tdctarel
select * from gxbdbps.tdctaad where tdctanro ='122409913'
select * from gxbdbps.tdcta where tdctanro='4427985502'
select * from gxbdbps.tdcta where tdctatar='4569760000009146'
select * from gxbdbps.tdemis where tdctanro='4604760868'

select * from gxbdbps.tdemisnov where  
select * from libdebito.tbbine0p where  QEBI10='456976'
select * from atmcentre.tbbine0p where  QEBI10 in ('456976','488234')
/*

select * from visa.VISctlDTA as A
inner join visa.vistrndta as B on A.VIRRNBEPSA = b.VIRRNBEPSA
where 
vifecreal= '20211117' 
and a.virol='ISA'
and vitdenti='1020'
--and a.virrnbepsa='128495364027'
order by vihorareal desc
*/


select * from visa.visctldta where V037='222433892111'
select * from visa.vistrndta where virrnbepsa='222485819305' 

vifecreal='20220521'     and vipannmbr in ('4569760000382808')   order by vihorareal 
and viimporte ='51000' 
and vifld037

select * from gxbdbps.tdcta
order by vihorareal desc  and vipannmbr in ('4594300000000016','4594300000000032')   

select * from visa.visctldta where  virol='ISS' and date(vimsgdatt)='2021-03-25' and mti='120'

campo 44 1 2 Time out con el Switch
campo 63 razon cod 9020 y 9011 delay issuer is down 
campo 32 bin adquirente
473204 continental
422745 bnf
443073 bancard atm 
472040 bancard pos

*/

SELECT * FROM GXBDBPS.TDENTCOM t ;
UPDATE GXBDBPS.TDENTCOM
   SET ENTRMTADD = '192.168.10.1'
WHERE ENTCOMID = '1002';

UPDATE GXBDBPS.TDENTCOM
   SET ENTRMTADD = '192.168.0.2'
WHERE ENTCOMID = '1002';
select * from GXBDBPS.TDENTCOM
select * from gxbdbps.lgcoment where date(lgfechor)='2022-10-20' and  lgentid='1002'  order by lgfechor desc --and lgmsg like '%223488110069%'
select * from gxbdbps.lgcoment where lgmsg like '%31815255502%';
select * from gxbdbps.lgcoment where lgmsg like '%136420314349%';



/*
select * from gxbdbps.comaeaf where cocomer='6900282'
select * from gxbdbps.tswaut where auttrxfchf='20210523' and auttrxhorf >'21:00:00'
and autbinemi='456976'
*/
--select * from visa.debugvs



/*

SELECT * FROM TABLE (QSYS2.OBJECT_STATISTICS('LIBDEBITO','*PGM')) ORDER BY OBJCREATED DESC


SELECT * FROM QGPL.QAUDITDO


SELECT ALL DOETYP, DOENTT, DOTSTP, DOJOB, DOUSER, DONBR, DOPGM, DOPGMLIB, DOUSPF, DORADR, DOONAM, DOOLIB, DOOTYP, DOATTR   
  FROM QGPL.QAUDITDO where DOOLIB NOT IN ('*N', 'MIMIX02_1', 'MIMIX02') ORDER BY DOOLIB;  





*/



/*
select count(*), substr(lidtra,1,1) from libdebito.drconbep 
where lfectr between '20210701' and '20210731' 
and substr(lidtra,1,1) in ('T','P')
group by substr(lidtra,1,1)
*/


select * from yapi.DRCONBEPAU where jodate='061021' 
AND jouser not in ('VISAUSR','MASTRUSR','ATMCENTUSR','QCOMUNICA','USRRGNCON') 
AND jodate='051021'
AND jouser in ('U99OTILIA')



select * from gxbdbps.tmctaaf

select * from gxbdbps.tmoviaf where mtnumta='4569760000363154'

select * from gxbdbps.tautpaf where mtnumta='4569760000363154' order by apfecom desc

  
select * from yapi.perfiles
select * from gxbdbps.tswaut


select * from gxbdbps.tmtaraf where 
select * from gxbdcon.gxlousu
select * from gxbdcon.gxloper a inner join gxbdcon.gxlinner join gxbdcon.gxlousu c b.usucod=c.usucod
select * from gxbdcon.gxloperdet

select * from gxbdcon.gxlofun where funcod='475'
select * from gxbd.gxloper
select * from gxbdbps.comms where commid='02'


UPDATE GXBDBPS.COMMS
   SET COMMPRIVAL = '192.168.155.16',
       COMMPRITC = '05',
       COMMSECVAL = '192.168.155.16',
       COMMSECTC = '05',
       COMMPRITCP = '11004',
       COMMSECTCP = '11004'
WHERE COMMID = '02  ';

UPDATE GXBDBPS.COMMS
   SET COMMPRIVAL = '10.251.251.251',
       COMMPRITC = '02',
       COMMSECVAL = '10.251.251.251',
       COMMSECTC = '02',
       COMMPRITCP = '11004',
       COMMSECTCP = '11004'
WHERE COMMID = '02  ';

UPDATE GXBDBPS.COMMS SET COMMTABLE = '1 ', COMMPRIVAL = '10.251.251.251', 
COMMPRINII = '023 ', COMMPRITCP = '11004 ', COMMPRITLS = '02', COMMPRITC = '02', COMMSECVAL = '10.251.251.251',
 COMMSECNII = '023 ', COMMSECTCP = '11004 ', COMMSECTLS = '02', COMMSECTC = '02', COMMTOCONN = '25  ', COMMTOPROC = '70'
  WHERE COMMID = '02  ';



select * from gxbdbps.comms where COMMID = '02  ';
select * from gxweb.gxlousudet
select * from gxweb.gxlousu where usuaid LIKE '%3794955%'


select * from visa.visatrndta where 

select * from visa.vis
select *from visa.vistrndta where vifecreal='20220325' virrnbepsa = '0208556173464'
select *from libdebito.drconbep where lerrnb = '0208556173464'


select * from gxbdbps.geoadmin

UPDATE GXBDBPS.GEOADMIN
   SET ADMTCCARP = 'BEPSA'





[16:33] Juan Angel Rojas
ahora veo

[16:33] Juan Angel Rojas
SELECT * FROM GXSWTDTA.TMIEXC t WHERE EXCTIPCAT IN ('02','03') ;

[16:33] Juan Angel Rojas
no hay nada cargado en tmiexc con esas categorias

[16:34] Juan Angel Rojas
SELECT * FROM GXSWTDTA.TMIPAR t WHERE PARCAT IN ('02','03');



select * from gxswtdta.TMITH


select * FROM GXSWTDTA.TMITH WHERE THFCHINI >= 20220401;
DELETE FROM GXSWTDTA.TMITH WHERE THFCHINI >= 20220401;

DELETE FROM GXSWTDTA.TMIEXC t WHERE EXCNROTAR = '4569760000228910';

DELETE FROM GXSWTDTA.TMIEXC t WHERE EXCTIPCAT IN ('01','04',' ') ;


select * from GXSWTDTA.TMIEXC


commit; gxswtdta.tmiexc;



CREATE UNIQUE INDEX GXSWTDTA.ITMIEXC
ON GXSWTDTA.TMIEXC (EXCBIN ASC, EXCMAR ASC, EXCNROTAR ASC, EXCTARADH ASC, EXCTAREMI ASC, EXCFCHING ASC, EXCCODCOM ASC);

CREATE INDEX GXSWTDTA.UTMIEXC1
ON GXSWTDTA.TMIEXC (EXCBIN ASC, EXCMAR ASC, EXCNROTAR ASC, EXCTARADH ASC, EXCTAREMI ASC, EXCFCHING ASC, EXCCODCOM ASC);


select * from gxtrjdta.ttdemi

select * from GXTRJDTA.TTDEMI

WHERE  EMIPROCABM = 'S'  and EMIFECEMB = '00000000' and EMIFECREC = '00000000' and  EMIFECPIN = '00000000'


select * from GXTRJDTA.TTDCAD where cadnmbanmg like '%METZ/EMILIO%'


select * from gxbdbps.tswaut where 

select * from gxbdbps.TDTARREL where tdtarnum='7030020149478809'

select * from gxfindta.tclcne
Select * FROM GXTRJDTA.TDSPWS where pwsidwebs in ( 'ACREDCONWS','TOKENNUEWS')


Select * from gxfindta.tcltsb inner join gxbdbps.comaeaf on tsbcoco = cocomer where tsbtpop = '01' and tsbcome <> '002' and tsbfeac>= '2022-06-16 12:00:00'



select * from gxfindta.tclmov
selectr 




  select lfectr as Fecha,  lhortr as Hora,lerrnb as Referencia,SUBSTR(lnrtar,1,6)||'XXXXXX'||SUBSTR(lnrtar,13,4)  AS Tarjeta,lbinpr as Bin,                       
    lcodbc as Marca,limpgs as Monto,lsaltr saldo, lesttr as Estado,lcretr as Retorno,lidcom as Codigo, lcomtr as Comercio,lenemi AS ENTIDAD,loritr as ATM_POS,lactfj Activo,leca62 AS VERSION,lcautr      
                  from libdebito.drconbep where lfectr between '20220301' and '20220301'
              --  and lcretr in ('83')
               -- and lerrnb ='215163332170'
   and lnrtar like '456976%0941'--    230671******2211
  --  and    lcautr in ('831048')--,'547278','547279')-- and lenemi='167'
      --and lhisde = '*COOPRE'   
      --and lnrtar like '%9556'-
                order by lfectr desc, lhortr desc



SELECT *
      FROM LIBDEBITO.DRCONBEP D
      WHERE -- d.LFECTR>='20221001' and
      LERRNB IN (SELECT LERRNB FROM LIBDEBITO.DRCONBEP D
      WHERE d.LFECTR='20221001'
      GROUP BY LERRNB HAVING COUNT(*)>1 ) ORDER BY LERRNB





INSERT INTO GXFINDTA.TFIZON (ZONCOD,FIDBANCOD,FIDCOD,ZONDES,ZONINCSN)
VALUES  (0,1020,1,'ZONA 0','S');



INSERT INTO GXFINDTA.TFIZON (ZONCOD,FIDBANCOD,FIDCOD,ZONDES,ZONINCSN)
VALUES  (0,1020,2,'ZONA 0','S');



SELECT * FROM GXOPERA.OPLIQUI WHERE OPNROREF IN ('227803572443','229708095204',
'229407622212','232417425926','226096894929');
