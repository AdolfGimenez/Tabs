/*Reversas de TigoMoney y Tigo Companion*/
Select optarj, opcomer, opcodaut, opferea, opfecom, sum(opmonto-opcomi), 'PE' 
select * from gxopera.opmovi where opfecom = '20190821' and opcodtrn = '000054' and openemi in ('581','152') and opcodaut in (
'233952','233843','233363','233313','233307','233272','232866','232624','232600','232524','232457','232409','232235','231981','231808','231773'
,'231625','231399','231350','231349','230955','230702','230695','230580','229976','229845','229749','229614','229235','229118','228955','228911'
,'228875','228654','228439','228373','228027','227636','227471','227291','227060','226818','226736','226402','226313','226256','226046','225905'
,'225883','225749','225660','225516','225415','225232','225189','225068','225039','224997','224930','224927','224805','224618','224613','224531'
,'224270','224208','223942','223769','223317','233798','233515','233502','233457','233415','233312','233145','231966','231786','231421','231026'
,'231019','230953','230738','230713','230011','229714','229564','229563','229539','228600','228353','227960','227408','227185','227036','226710'
,'226463','226377','226277','226078','226043','225662','225601','225453','225251','225161','225008','224908','224775','224224','223476')
group by optarj, opcomer, opcodaut, opferea, opfecom


Select optarj, opcomer, opcodaut, opferea, opfecom, sum(opmonto-opcomi), 'PE' 
select * from gxopera.opmovi where   opcodaut in ('226710') and opcodtrn = '000054' and opstatus='E' and openemi in ('581','152') and
/*'233952','233843','233363','233313','233307','233272','232866','232624','232600','232524','232457','232409','232235','231981','231808','231773'
,'231625','231399','231350','231349','230955','230702','230695','230580','229976','229845','229749','229614','229235','229118','228955','228911'
,'228875','228654','228439','228373','228027','227636','227471','227291','227060','226818','226736','226402','226313','226256','226046','225905'
,'225883','225749','225660','225516','225415','225232','225189','225068','225039','224997','224930','224927','224805','224618','224613','224531'
,'224270','224208','223942','223769','223317','233798','233515','233502','233457','233415','233312','233145','231966','231786','231421','231026'
,'231019','230953','230738','230713','230011','229714','229564','229563','229539','228600','228353','227960','227408','227185','227036','226710'
,'226463','226377','226277','226078','226043','225662','225601','225453','225251','225161','225008','224908','224775','224224','223476')*/
group by optarj, opcomer, opcodaut, opferea 



/*Insert en Tabla Reversas*/
Select * from gxopera.reversas where rfecom = '20190821'
INSERT INTO gxopera.reversas VALUES('6274315815258074','0700139','225161','20190821','20190821','42824','PE',null);
INSERT INTO gxopera.reversas VALUES('6274311521370624','0700138','231808','20190821','20190821','95207','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311521425816','0200655','231350','20190821','20190821','8703','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311521605813','0800303','231399','20190821','20190821','29670','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311521281888','0701635','229614','20190821','20190821','35550','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311520238624','0200655','224270','20190821','20190821','14022','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311521217221','0701092','233363','20190821','20190821','25367','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311521558608','0700937','232600','20190821','20190821','28822','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311520978674','0800844','225516','20190821','20190821','29670','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311521474194','0700493','225883','20190821','20190821','197800','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311520257467','0700686','224531','20190821','20190821','150171','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311520310688','0700155','223317','20190821','20190821','28334','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311521605813','0800303','231625','20190821','20190821','29670','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274315815258074','0700139','224908','20190821','20190821','42824','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311521524840','0700861','229118','20190821','20190821','11802','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274315811877330','0200655','225251','20190821','20190821','9670','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274315811935899','0200655','233457','20190821','20190821','11604','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311521631603','2400047','233952','20190821','20190821','17406','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311520039469','0700249','230580','20190821','20190821','376237','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274315811974300','0200655','229539','20190821','20190821','5802','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274315811707922','0200658','227036','20190821','20190821','10154','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311521595287','0700692','226313','20190821','20190821','4956','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274315813311034','0700808','225008','20190821','20190821','100878','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311520068856','0700396','225232','20190821','20190821','77784','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311521605813','0800303','231773','20190821','20190821','29670','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274315812757765','2400047','229564','20190821','20190821','8703','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311521341765','0700690','227471','20190821','20190821','154487','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311520473312','0700249','229845','20190821','20190821','376237','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274315816774847','0700379','226377','20190821','20190821','4890','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274315814237413','6000275','230953','20190821','20190821','193650','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274315814909444','0700356','233312','20190821','20190821','14909','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274315813812868','0700139','229714','20190821','20190821','179257','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274315811877330','0200655','224224','20190821','20190821','9670','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311521405495','0700513','227291','20190821','20190821','9543','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311521468949','0700683','232457','20190821','20190821','66626','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274315811162885','2400047','226078','20190821','20190821','13055','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311521405495','0700513','223942','20190821','20190821','37779','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274315811820324','0701213','225453','20190821','20190821','69379','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311521560158','0700553','225039','20190821','20190821','19780','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274315811577582','0701068','227185','20190821','20190821','41439','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274315811656962','0200655','233415','20190821','20190821','5802','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274315811460379','0200658','225662','20190821','20190821','4834','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311521341765','0700690','227636','20190821','20190821','154487','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311520677458','0800624','233843','20190821','20190821','98900','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311521431590','0701210','230955','20190821','20190821','47325','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274315814147087','0700663','226710','20190821','20190821','39174','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274315813521099','0700623','223476','20190821','20190821','82730','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311521215951','0701555','228875','20190821','20190821','29799','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311520978674','0800844','225660','20190821','20190821','29670','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311520039469','0700249','230702','20190821','20190821','376237','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311520039220','0801237','226046','20190821','20190821','49449','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311521309929','0801033','224618','20190821','20190821','29670','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311521668266','0700850','226402','20190821','20190821','87234','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311521459534','1001175','232409','20190821','20190821','231213','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311521264710','0800394','229235','20190821','20190821','49449','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311520664308','0700227','233272','20190821','20190821','39648','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311520905321','0200655','224613','20190821','20190821','7736','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274315812238744','0701772','231026','20190821','20190821','77340','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311521591229','0701125','228027','20190821','20190821','86028','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274315812968817','0700808','226043','20190821','20190821','5439','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274315811577582','0701068','231786','20190821','20190821','39560','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274315813971503','0700250','226277','20190821','20190821','10879','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311520466050','0801237','223769','20190821','20190821','29670','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311521614864','0200289','228911','20190821','20190821','14834','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274315811222891','0700908','229563','20190821','20190821','20831','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311520257467','0700686','225068','20190821','20190821','150171','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274315814837558','0700208','227960','20190821','20190821','72593','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311520538478','0701166','232235','20190821','20190821','89764','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274315812183419','0700360','227408','20190821','20190821','85203','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311520473312','0700249','229976','20190821','20190821','376237','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311521281888','0701635','229749','20190821','20190821','35550','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311521277183','0701557','225189','20190821','20190821','167993','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274315815409700','0200790','224775','20190821','20190821','5379','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311520860559','1000839','232866','20190821','20190821','48349','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274315811612656','0700561','230011','20190821','20190821','89405','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311521632353','0700232','224997','20190821','20190821','83484','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311520043453','0700155','232524','20190821','20190821','89603','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311520620300','0700689','233313','20190821','20190821','143205','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311521276680','0701296','225749','20190821','20190821','16916','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311521668266','0700850','226818','20190821','20190821','87234','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274315811187571','0701302','231966','20190821','20190821','69041','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274315811300407','0800956','225601','20190821','20190821','34613','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311520554541','0700154','226736','20190821','20190821','88070','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274315816917290','0700583','231421','20190821','20190821','49449','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274315812357898','1000919','233502','20190821','20190821','229737','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311520229144','0700595','228439','20190821','20190821','172778','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274315813366475','0701762','228353','20190821','20190821','44147','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311520473312','0700249','231349','20190821','20190821','376237','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311520554541','0700154','226256','20190821','20190821','88070','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274315816900800','2400047','231019','20190821','20190821','4351','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311521151859','0700588','224930','20190821','20190821','141185','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311521560158','0700553','224927','20190821','20190821','19780','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311521597929','2300341','232624','20190821','20190821','47576','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311520238624','0200655','224208','20190821','20190821','14022','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274315815202203','0700995','233145','20190821','20190821','37115','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274315811910079','0701213','233798','20190821','20190821','31154','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311521334711','0700855','230695','20190821','20190821','82927','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311520358851','0700698','233307','20190821','20190821','38900','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274315815232078','0701725','230738','20190821','20190821','9724','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311521276680','0701296','225905','20190821','20190821','16916','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311521591229','0701125','227060','20190821','20190821','86028','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274315813489263','0700487','230713','20190821','20190821','67746','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311521522042','0700232','228373','20190821','20190821','71744','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311520978674','0800844','225415','20190821','20190821','29670','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274315815324284','0700871','233515','20190821','20190821','21412','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311521560158','0700553','224805','20190821','20190821','19830','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311521666674','0701632','228654','20190821','20190821','77605','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274315814157367','2400047','228600','20190821','20190821','1934','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311521605813','0800303','231981','20190821','20190821','29670','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311521215951','0701555','228955','20190821','20190821','29799','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274315811337073','0301905','226463','20190821','20190821','14504','PE',  null);

/*Insert en la tabla TRXCOMER*/
Select opcomer, opferea, sum(opmonto-opcomi),sum(opmonto-opcomi),'P','' ,OPCODAUT from gxopera.opmovi where opfecom = '20190821' and opcodtrn = '000054' and openemi in ('581','152') and opcodaut in (
select * from gxopera.opmovi where  opcodtrn = '000054' and openemi in ('581','152') --and opfecom = '20190821' and
--select * from gxopera.trxcomer where trxcaut
and opstatus='E' and OPCODAUT in (
'233952','233843','233363','233313','233307','233272','232866','232624','232600','232524','232457','232409','232235','231981','231808','231773'
,'231625','231399','231350','231349','230955','230702','230695','230580','229976','229845','229749','229614','229235','229118','228955','228911'
,'228875','228654','228439','228373','228027','227636','227471','227291','227060','226818','226736','226402','226313','226256','226046','225905'
,'225883','225749','225660','225516','225415','225232','225189','225068','225039','224997','224930','224927','224805','224618','224613','224531'
,'224270','224208','223942','223769','223317','233798','233515','233502','233457','233415','233312','233145','231966','231786','231421','231026'
,'231019','230953','230738','230713','230011','229714','229564','229563','229539','228600','228353','227960','227408','227185','227036','226710'
,'226463','226377','226277','226078','226043','225662','225601','225453','225251','225161','225008','224908','224775','224224','223476')
group by  opcomer, opferea, OPCODAUT

Select * from gxopera.
Select * from gxopera.trxcomer where trxcaut='226710' TRXFECH = '20190821'
--DELETE  from gxopera.trxcomer where TRXFECH = '20190821'

INSERT INTO gxopera.TRXCOMER VALUES('0200289','20190821','14834','14834','P','','228911');
INSERT INTO gxopera.TRXCOMER VALUES('0200655','20190821','14022','14022','P','','224270');
INSERT INTO gxopera.TRXCOMER VALUES('0200655','20190822','5802','5802','P','','229539');
INSERT INTO gxopera.TRXCOMER VALUES('0200655','20190823','8703','8703','P','','231350');
INSERT INTO gxopera.TRXCOMER VALUES('0200655','20190824','11604','11604','P','','233457');
INSERT INTO gxopera.TRXCOMER VALUES('0200655','20190825','9670','9670','P','','224224');
INSERT INTO gxopera.TRXCOMER VALUES('0200655','20190826','7736','7736','P','','224613');
INSERT INTO gxopera.TRXCOMER VALUES('0200655','20190827','5802','5802','P','','233415');
INSERT INTO gxopera.TRXCOMER VALUES('0200655','20190828','9670','9670','P','','225251');
INSERT INTO gxopera.TRXCOMER VALUES('0200655','20190829','14022','14022','P','','224208');
INSERT INTO gxopera.TRXCOMER VALUES('0200658','20190821','4834','4834','P','','225662');
INSERT INTO gxopera.TRXCOMER VALUES('0200658','20190822','10154','10154','P','','227036');
INSERT INTO gxopera.TRXCOMER VALUES('0200790','20190821','5379','5379','P','','224775');
INSERT INTO gxopera.TRXCOMER VALUES('0301905','20190821','14504','14504','P','','226463');
INSERT INTO gxopera.TRXCOMER VALUES('0700138','20190821','95207','95207','P','','231808');
INSERT INTO gxopera.TRXCOMER VALUES('0700139','20190821','179257','179257','P','','229714');
INSERT INTO gxopera.TRXCOMER VALUES('0700139','20190822','42824','42824','P','','224908');
INSERT INTO gxopera.TRXCOMER VALUES('0700139','20190823','42824','42824','P','','225161');
INSERT INTO gxopera.TRXCOMER VALUES('0700154','20190821','88070','88070','P','','226736');
INSERT INTO gxopera.TRXCOMER VALUES('0700154','20190822','88070','88070','P','','226256');
INSERT INTO gxopera.TRXCOMER VALUES('0700155','20190821','89603','89603','P','','232524');
INSERT INTO gxopera.TRXCOMER VALUES('0700155','20190822','28334','28334','P','','223317');
INSERT INTO gxopera.TRXCOMER VALUES('0700208','20190821','72593','72593','P','','227960');
INSERT INTO gxopera.TRXCOMER VALUES('0700227','20190821','39648','39648','P','','233272');
INSERT INTO gxopera.TRXCOMER VALUES('0700232','20190821','71744','71744','P','','228373');
INSERT INTO gxopera.TRXCOMER VALUES('0700232','20190822','83484','83484','P','','224997');
INSERT INTO gxopera.TRXCOMER VALUES('0700249','20190821','376237','376237','P','','231349');
INSERT INTO gxopera.TRXCOMER VALUES('0700249','20190822','376237','376237','P','','229976');
INSERT INTO gxopera.TRXCOMER VALUES('0700249','20190823','376237','376237','P','','230580');
INSERT INTO gxopera.TRXCOMER VALUES('0700249','20190824','376237','376237','P','','230702');
INSERT INTO gxopera.TRXCOMER VALUES('0700249','20190825','376237','376237','P','','229845');
INSERT INTO gxopera.TRXCOMER VALUES('0700250','20190821','10879','10879','P','','226277');
INSERT INTO gxopera.TRXCOMER VALUES('0700356','20190821','14909','14909','P','','233312');
INSERT INTO gxopera.TRXCOMER VALUES('0700360','20190821','85203','85203','P','','227408');
INSERT INTO gxopera.TRXCOMER VALUES('0700379','20190821','4890','4890','P','','226377');
INSERT INTO gxopera.TRXCOMER VALUES('0700396','20190821','77784','77784','P','','225232');
INSERT INTO gxopera.TRXCOMER VALUES('0700487','20190821','67746','67746','P','','230713');
INSERT INTO gxopera.TRXCOMER VALUES('0700493','20190821','197800','197800','P','','225883');
INSERT INTO gxopera.TRXCOMER VALUES('0700513','20190821','9543','9543','P','','227291');
INSERT INTO gxopera.TRXCOMER VALUES('0700513','20190822','37779','37779','P','','223942');
INSERT INTO gxopera.TRXCOMER VALUES('0700553','20190821','19780','19780','P','','225039');
INSERT INTO gxopera.TRXCOMER VALUES('0700553','20190822','19830','19830','P','','224805');
INSERT INTO gxopera.TRXCOMER VALUES('0700553','20190823','19780','19780','P','','224927');
INSERT INTO gxopera.TRXCOMER VALUES('0700561','20190821','89405','89405','P','','230011');
INSERT INTO gxopera.TRXCOMER VALUES('0700583','20190821','49449','49449','P','','231421');
INSERT INTO gxopera.TRXCOMER VALUES('0700588','20190821','141185','141185','P','','224930');
INSERT INTO gxopera.TRXCOMER VALUES('0700595','20190821','172778','172778','P','','228439');
INSERT INTO gxopera.TRXCOMER VALUES('0700623','20190821','82730','82730','P','','223476');
INSERT INTO gxopera.TRXCOMER VALUES('0700663','20190821','39174','39174','P','','226710');
INSERT INTO gxopera.TRXCOMER VALUES('0700683','20190821','66626','66626','P','','232457');
INSERT INTO gxopera.TRXCOMER VALUES('0700686','20190821','150171','150171','P','','224531');
INSERT INTO gxopera.TRXCOMER VALUES('0700686','20190822','150171','150171','P','','225068');
INSERT INTO gxopera.TRXCOMER VALUES('0700689','20190821','143205','143205','P','','233313');
INSERT INTO gxopera.TRXCOMER VALUES('0700690','20190821','154487','154487','P','','227636');
INSERT INTO gxopera.TRXCOMER VALUES('0700690','20190822','154487','154487','P','','227471');
INSERT INTO gxopera.TRXCOMER VALUES('0700692','20190821','4956','4956','P','','226313');
INSERT INTO gxopera.TRXCOMER VALUES('0700698','20190821','38900','38900','P','','233307');
INSERT INTO gxopera.TRXCOMER VALUES('0700808','20190821','100878','100878','P','','225008');
INSERT INTO gxopera.TRXCOMER VALUES('0700808','20190822','5439','5439','P','','226043');
INSERT INTO gxopera.TRXCOMER VALUES('0700850','20190821','87234','87234','P','','226818');
INSERT INTO gxopera.TRXCOMER VALUES('0700850','20190822','87234','87234','P','','226402');
INSERT INTO gxopera.TRXCOMER VALUES('0700855','20190821','82927','82927','P','','230695');
INSERT INTO gxopera.TRXCOMER VALUES('0700861','20190821','11802','11802','P','','229118');
INSERT INTO gxopera.TRXCOMER VALUES('0700871','20190821','21412','21412','P','','233515');
INSERT INTO gxopera.TRXCOMER VALUES('0700937','20190821','28822','28822','P','','232600');
INSERT INTO gxopera.TRXCOMER VALUES('0700995','20190821','37115','37115','P','','233145');
INSERT INTO gxopera.TRXCOMER VALUES('0701068','20190821','39560','39560','P','','231786');
INSERT INTO gxopera.TRXCOMER VALUES('0701068','20190822','41439','41439','P','','227185');
INSERT INTO gxopera.TRXCOMER VALUES('0701092','20190821','25367','25367','P','','233363');
INSERT INTO gxopera.TRXCOMER VALUES('0701125','20190821','86028','86028','P','','227060');
INSERT INTO gxopera.TRXCOMER VALUES('0701125','20190822','86028','86028','P','','228027');
INSERT INTO gxopera.TRXCOMER VALUES('0701166','20190821','89764','89764','P','','232235');
INSERT INTO gxopera.TRXCOMER VALUES('0701210','20190821','47325','47325','P','','230955');
INSERT INTO gxopera.TRXCOMER VALUES('0701213','20190821','69379','69379','P','','225453');
INSERT INTO gxopera.TRXCOMER VALUES('0701213','20190822','31154','31154','P','','233798');
INSERT INTO gxopera.TRXCOMER VALUES('0701296','20190821','16916','16916','P','','225749');
INSERT INTO gxopera.TRXCOMER VALUES('0701296','20190822','16916','16916','P','','225905');
INSERT INTO gxopera.TRXCOMER VALUES('0701302','20190821','69041','69041','P','','231966');
INSERT INTO gxopera.TRXCOMER VALUES('0701555','20190821','29799','29799','P','','228875');
INSERT INTO gxopera.TRXCOMER VALUES('0701555','20190822','29799','29799','P','','228955');
INSERT INTO gxopera.TRXCOMER VALUES('0701557','20190821','167993','167993','P','','225189');
INSERT INTO gxopera.TRXCOMER VALUES('0701632','20190821','77605','77605','P','','228654');
INSERT INTO gxopera.TRXCOMER VALUES('0701635','20190821','35550','35550','P','','229749');
INSERT INTO gxopera.TRXCOMER VALUES('0701635','20190822','35550','35550','P','','229614');
INSERT INTO gxopera.TRXCOMER VALUES('0701725','20190821','9724','9724','P','','230738');
INSERT INTO gxopera.TRXCOMER VALUES('0701762','20190821','44147','44147','P','','228353');
INSERT INTO gxopera.TRXCOMER VALUES('0701772','20190821','77340','77340','P','','231026');
INSERT INTO gxopera.TRXCOMER VALUES('0800303','20190821','29670','29670','P','','231981');
INSERT INTO gxopera.TRXCOMER VALUES('0800303','20190822','29670','29670','P','','231399');
INSERT INTO gxopera.TRXCOMER VALUES('0800303','20190823','29670','29670','P','','231625');
INSERT INTO gxopera.TRXCOMER VALUES('0800303','20190824','29670','29670','P','','231773');
INSERT INTO gxopera.TRXCOMER VALUES('0800394','20190821','49449','49449','P','','229235');
INSERT INTO gxopera.TRXCOMER VALUES('0800624','20190821','98900','98900','P','','233843');
INSERT INTO gxopera.TRXCOMER VALUES('0800844','20190821','29670','29670','P','','225660');
INSERT INTO gxopera.TRXCOMER VALUES('0800844','20190822','29670','29670','P','','225516');
INSERT INTO gxopera.TRXCOMER VALUES('0800844','20190823','29670','29670','P','','225415');
INSERT INTO gxopera.TRXCOMER VALUES('0800956','20190821','34613','34613','P','','225601');
INSERT INTO gxopera.TRXCOMER VALUES('0801033','20190821','29670','29670','P','','224618');
INSERT INTO gxopera.TRXCOMER VALUES('0801237','20190821','29670','29670','P','','223769');
INSERT INTO gxopera.TRXCOMER VALUES('0801237','20190822','49449','49449','P','','226046');
INSERT INTO gxopera.TRXCOMER VALUES('1000839','20190821','48349','48349','P','','232866');
INSERT INTO gxopera.TRXCOMER VALUES('1000919','20190821','229737','229737','P','','233502');
INSERT INTO gxopera.TRXCOMER VALUES('1001175','20190821','231213','231213','P','','232409');
INSERT INTO gxopera.TRXCOMER VALUES('2300341','20190821','47576','47576','P','','232624');
INSERT INTO gxopera.TRXCOMER VALUES('2400047','20190821','17406','17406','P','','233952');
INSERT INTO gxopera.TRXCOMER VALUES('2400047','20190822','8703','8703','P','','229564');
INSERT INTO gxopera.TRXCOMER VALUES('2400047','20190823','13055','13055','P','','226078');
INSERT INTO gxopera.TRXCOMER VALUES('2400047','20190824','4351','4351','P','','231019');
INSERT INTO gxopera.TRXCOMER VALUES('2400047','20190825','1934','1934','P','','228600');
INSERT INTO gxopera.TRXCOMER VALUES('6000275','20190821','193650','193650','P','','230953');
INSERT INTO gxopera.TRXCOMER VALUES('0700908','20190821','20831','20831','P','','229563'); 

*************************************************************************************************************************************************************
*************************************************************************************************************************************************************
/*REVERSAS*/
INSERT INTO gxopera.reversas VALUES('6274310020129143','0301959','366520','20190821','20190821','309000','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274310020053129','0700208','464747','20190821','20190821','53100','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274310020053129','0700208','813540','20190821','20190821','53100','PE',   null);
INSERT INTO gxopera.reversas VALUES('6274310020053129','0700208','426382','20190821','20190821','53100','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274310020072780','0700227','078540','20190821','20190821','285443','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274310020072780','0700227','374240','20190821','20190821','285443','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274310020072780','0700227','749560','20190821','20190821','285443','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274313320013074','0700527','376762','20190821','20190821',' 17050','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311630006960','0700577','894800','20190821','20190821',' 17300','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311640000417','0700679','630266','20190821','20190821',' 72150','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311640000417','0700679','720440','20190821','20190821',' 72150','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311530002036','0700898','575536','20190821','20190821',' 60000','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311070163727','0701213','991825','20190821','20190821','102600','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311070163727','0701213','991825','20190822','20190821','102600','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311070164980','0701519','991851','20190821','20190821',' 34050','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311620012366','0701699','418928','20190821','20190821',' 86000','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311620010758','0701710','188982','20190821','20190821','171980','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274310020124821','0701721','493299','20190821','20190821',' 60000','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274310020124821','0701721','256298','20190821','20190821',' 60000','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274313320011862','0800829','804030','20190821','20190821','100000','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274313320011862','0800829','011616','20190821','20190821','100000','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311630002563','0800869','143907','20190821','20190821',' 50000','PE',  null);
INSERT INTO gxopera.reversas VALUES('6274311630002563','0800869','237448','20190821','20190821',' 50000','PE',  null);
/*TRXCOMER*/
Select opcomer, openemi,opferea, opmonto,(opmonto-opcomi), 'P','', opcodaut from gxopera.opmovi where opferea = '20190821' 
and openemi not in ('152','581') and OPCODTRN = '000054' and substr(optarj,1,6) = '627431' and opcodaut in (
'366520','464747','813540','426382','078540','374240','749560','376762','894800',
'630266','720440','575536','991825','991825','991851','418928','188982','493299',
'256298','804030','011616','143907','237448')
Select * from gxopera.trxcomer where trxcaut in ('366520','464747','813540','426382','078540','374240','749560','376762','894800',
'630266','720440','575536','991825','991825','991851','418928','188982','493299',
'256298','804030','011616','143907','237448')
/*Recupero parcial TRXCOMER*/
INSERT INTO gxopera.TRXCOMER VALUES('0301959','20190821','292004','292004','P','','366520');
INSERT INTO gxopera.TRXCOMER VALUES('0700208','20190824',' 52514',' 52514','P','','464747'); 
INSERT INTO gxopera.TRXCOMER VALUES('0700208','20190822',' 52514',' 52514','P','','813540');
INSERT INTO gxopera.TRXCOMER VALUES('0700208','20190823',' 52514',' 52514','P','','426382');
INSERT INTO gxopera.TRXCOMER VALUES('0700227','20190824','282931','282931','P','','078540');
INSERT INTO gxopera.TRXCOMER VALUES('0700227','20190822','282931','282931','P','','374240');
INSERT INTO gxopera.TRXCOMER VALUES('0700227','20190823','282931','282931','P','','749560');
INSERT INTO gxopera.TRXCOMER VALUES('0700527','20190821',' 16675',' 16675','P','','376762');
INSERT INTO gxopera.TRXCOMER VALUES('0700577','20190821',' 16824',' 16824','P','','894800');
INSERT INTO gxopera.TRXCOMER VALUES('0700679','20190821',' 71515',' 71515','P','','630266');
INSERT INTO gxopera.TRXCOMER VALUES('0700679','20190822',' 71515',' 71515','P','','720440');
INSERT INTO gxopera.TRXCOMER VALUES('0700898','20190821',' 59340',' 59340','P','','575536');
INSERT INTO gxopera.TRXCOMER VALUES('0701213','20190823','101471','101471','P','','991825');
INSERT INTO gxopera.TRXCOMER VALUES('0701213','20190824','101471','101471','P','','991825');
INSERT INTO gxopera.TRXCOMER VALUES('0701519','20190821',' 33114',' 33114','P','','991851');
INSERT INTO gxopera.TRXCOMER VALUES('0701699','20190821',' 85243',' 85243','P','','418928');
INSERT INTO gxopera.TRXCOMER VALUES('0701710','20190821','170467','170467','P','','188982');
INSERT INTO gxopera.TRXCOMER VALUES('0701721','20190821',' 59010',' 59010','P','','493299');
INSERT INTO gxopera.TRXCOMER VALUES('0701721','20190822',' 59010',' 59010','P','','256298');
INSERT INTO gxopera.TRXCOMER VALUES('0800829','20190821',' 98900',' 98900','P','','804030');
INSERT INTO gxopera.TRXCOMER VALUES('0800829','20190822',' 98900',' 98900','P','','011616');
INSERT INTO gxopera.TRXCOMER VALUES('0800869','20190823',' 49450',' 49450','P','','143907');
INSERT INTO gxopera.TRXCOMER VALUES('0800869','20190824',' 49450',' 49450','P','','237448');
*************************************************************************************************************************************************************
*************************************************************************************************************************************************************


Carga de Reversas a recuperar del comercio.
/*Carga de Reversas*/
INSERT INTO gxopera.reversas VALUES('7030204607530673','1001880','722376','20190821','20190821','43000','PE',  null);
INSERT INTO gxopera.reversas VALUES('7030204607542287','1001887','724018','20190821','20190821','25883','PE',  null);
INSERT INTO gxopera.reversas VALUES('7030204607542287','1001887','724102','20190821','20190821','25883','PE',  null);
INSERT INTO gxopera.reversas VALUES('7030200107734279','8100678','725262','20190821','20190821','1100','PE',  null);

/*Carga de Reversas para recupero parcial*/
Select opcomer, opferea, opmonto,(opmonto-opcomi), 'P','', opcodaut from gxopera.opmovi where opferea = '20190821' 
and openemi = '020' and opcodaut in ('722376','724018','724102','725262')
/*Carga de Recupero en TRXCOMER*/
INSERT INTO gxopera.TRXCOMER VALUES('1001880','20190821','43000','41581','P','','722376');
INSERT INTO gxopera.TRXCOMER VALUES('1001887','20190821','25883','25028','P','','724018');
INSERT INTO gxopera.TRXCOMER VALUES('1001887','20190822','25883','25028','P','','724102');
INSERT INTO gxopera.TRXCOMER VALUES('8100678','20190821','1100','1100','P','','725262');