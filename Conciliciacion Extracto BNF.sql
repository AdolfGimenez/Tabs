select lfectr,
       substr(lerrnb,3,10) id_corto,
       lerrnb id_largo,
       eneadm||' - '||
       (select entdesc from gxopera.opentid where reenti=eneadm) entidad,
       lbcocr,
       limpgs monto,
       (select bnfcred from libprod.bnfextrac where bnfcref=substr(lerrnb,3,10)) bnf_monto,
       (select bnfdesc from libprod.bnfextrac where bnfcref=substr(lerrnb,3,10)) bnf_detalle,
       (select bnffech from libprod.bnfextrac where bnfcref=substr(lerrnb,3,10)) fecha_credito_bnf,
       (select bnfcref from libprod.bnfextrac where bnfcref=substr(lerrnb,3,10)) bnf_ref
  from libprod.transaccio
        where lfectr between '20201101' and '20210131'
          and lenemi = '015'
          and lesttr = 'A'
          and lcretr = '00'
          and lcodtr IN ('011000','012000')
          and lcodbc = 'VSA'



SELECT LFECTR fecha_real,LFCOTR fecha_comercial,LERRNB ref_trx,substr(LERRNB,3,10)ref_extra,bnfcref cccc,bnfcref,lcodtr cod_transaccion,LIMPGS IMPORTE_TRX,
bnffech fecha_credito,BNFCRED BNFCREDITO,BNFDEBI BNFDEBITO,bnfdesc
FROM LIBPROD.TRANSACCIO   inner JOIN LIBPROD.BNFEXTRAC 
ON SUBSTR(LERRNB,3,10) =bnfcref
WHERE LFECTR BETWEEN '20201101' AND '20210131'
    AND lenemi='015'
		AND LESTTR ='A'
		AND lcretr = '00'
		AND lcodtr IN ('010000','011000','012000')
		AND LCODBC ='VSA'
		
		

 
SELECT SUBSTR(LERRNB,3,10),SUBSTR(LERRNB,4,10),SUBSTR(LERRNB,5,8) FROM LIBPROD.TRANSACCIO WHERE  SUBSTR(LERRNB,4,10)='512398693'
512398693 
00001	00002	00003
0512398693	512398693 	
12398693
12398693
SELECT substr(bnfcref,2,8) ,bnfcref FROM LIBPROD.BNFEXTRAC WHERE BNFCREF ='612926196'
   

}
select  count(*) from libprod.bnfextrac 
select * from libprod.bnfextrac order by bnffech
where substr(bnffech,4,2)=''

delete from libprod.bnfextrac WHERE substr(bnffech,4,2)='12'

/*
CREATE TABLE LIBPROD.bnfextra (
	bnflfectr   DECIMAL(8)      DEFAULT 0 NOT NULL,
	bnfcodigo	decimal(3) 		DEFAULT 0 NOT NULL,
	bnfdebito   NUMERIC(18,2)   DEFAULT 0 NOT NULL,
	bnfcredito  NUMERIC(18,2)   DEFAULT 0 NOT NULL,
	bnfdescrip  CHAR(50)        CCSID 284 DEFAULT ' ' NOT NULL,
	bnfsaldo    NUMERIC(18,2)   DEFAULT 0 NOT NULL,
	bnfsucu   	decimal(12) 		DEFAULT 0 NOT NULL,
	bnfsucud    CHAR(50)        CCSID 284 DEFAULT ' ' NOT NULL,
	bnfref      CHAR(12)        CCSID 284 DEFAULT ' ' NOT NULL
	);
COMMIT;
*/



select * from libdebito.tbctra0p
select * from libdebito.drconbep where lcodtr='010000' and lfectr between '20201101' and '20210131'



