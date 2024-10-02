select cocomer COD_COMERCIO,codeno DENOMINACION,coemail E_MAIL from gxbdbps.comaeaf
where costat='0'
select * from contabilid.ccchequ where chfeem>011018


select lfcotr,substr(leca62,1,4) DESCRP from libdebito.drconbep where lfcotr between '20180901' and '20180930'
and 
OR tipmov = 'T' AND                     
limpgs>0 and lesttr<>'R'and LCRETR ='00'
and lctade <> '0000000000000000'        
and %subst(lidtra:1:1) = 'T'            

s
select * from gxopera.fcobros where  comctama='0701571'  comnrornd='12710'
select * from gxopera.complesdetalle where cocomer='0701571'
select * from gxopera.flicom where licomer ='0701571' and licodban='BR'

SELECT comtipo,comnro,comsecu FROM gxopera.fcobros  wHERE comfereal='20190822' and comtimbr='12526347'
except
SELECT comtipo,comnro,comsecu FROM arnaldolib.fcobros1  WHERE  comfereal='20190822' and comtimbr='12526347'
except 
SELECT comtipo,comnro,comsecu FROM gxopera.fcobros  wHERE comfereal='20190822' and comtimbr='12526347'

select * from gxopera.fcobros where comdesc like ('%10030033499%')


COMTIPO	COMNRO	COMTIMBR	COMSECU	COMCOMER	COMFECHA	COMIMPOR	COMPROC	COMNROASI	COMPAGO	COMFACLIQ	COMRECNRO	COMUSER	COMFEREAL	COMHORA	COMSTATUS	COMONEDA	COMTIZACIO	COMDESC	COMRECTIP	COMBANCOS	COMNROCHQ	COMCTAMA	COMFECALT	COMIMPCHQ	COMNRORND	COMFECRND	COMFECLIQD	COMFECLIQH
CR	10030033499	12526347  	6	2100414	00000000	404622.00	N	0	E	0	851612	U99BRENDA 	20190822	14:56:10  	P	600	1.00	Cancelación Fact. Crédito Nro. 10030033499(ALQUILER DE POS - SETIEMBRE 2018.) y Cancelación Fact. Crédito Nro. 10030034073(BOBINAS PARA POS) y Cancelación Fact. Crédito Nro. 10030037305(ALQUILER DE POS - OCTUBRE 2018.) y Cancelación Fact. Crédito Nro. 10030041193(ALQUILER DE POS - NOVIEMBRE 2018.) y Pago parcial de Fact. Crédito Nro. 10030045116(ALQUILER DE POS - DICIEMBRE 2018.)#	RD	TO	0	2100414	20190822	0.00	0	20000101	20000101	20000101
CR	10030034073	12526347  	4	2100414	00000000	40136.00	N	0	E	0	851612	U99BRENDA 	20190822	14:56:10  	P	600	1.00	Cancelación Fact. Crédito Nro. 10030033499(ALQUILER DE POS - SETIEMBRE 2018.) y Cancelación Fact. Crédito Nro. 10030034073(BOBINAS PARA POS) y Cancelación Fact. Crédito Nro. 10030037305(ALQUILER DE POS - OCTUBRE 2018.) y Cancelación Fact. Crédito Nro. 10030041193(ALQUILER DE POS - NOVIEMBRE 2018.) y Pago parcial de Fact. Crédito Nro. 10030045116(ALQUILER DE POS - DICIEMBRE 2018.)#	RD	TO	0	2100414	20190822	0.00	0	20000101	20000101	20000101
CR	10030037305	12526347  	4	2100414	00000000	540000.00	N	0	E	0	851612	U99BRENDA 	20190822	14:56:10  	P	600	1.00	Cancelación Fact. Crédito Nro. 10030033499(ALQUILER DE POS - SETIEMBRE 2018.) y Cancelación Fact. Crédito Nro. 10030034073(BOBINAS PARA POS) y Cancelación Fact. Crédito Nro. 10030037305(ALQUILER DE POS - OCTUBRE 2018.) y Cancelación Fact. Crédito Nro. 10030041193(ALQUILER DE POS - NOVIEMBRE 2018.) y Pago parcial de Fact. Crédito Nro. 10030045116(ALQUILER DE POS - DICIEMBRE 2018.)#	RD	TO	0	2100414	20190822	0.00	0	20000101	20000101	20000101
CR	10030041193	12526347  	3	2100414	00000000	540000.00	N	0	E	0	851612	U99BRENDA 	20190822	14:56:10  	P	600	1.00	Cancelación Fact. Crédito Nro. 10030033499(ALQUILER DE POS - SETIEMBRE 2018.) y Cancelación Fact. Crédito Nro. 10030034073(BOBINAS PARA POS) y Cancelación Fact. Crédito Nro. 10030037305(ALQUILER DE POS - OCTUBRE 2018.) y Cancelación Fact. Crédito Nro. 10030041193(ALQUILER DE POS - NOVIEMBRE 2018.) y Pago parcial de Fact. Crédito Nro. 10030045116(ALQUILER DE POS - DICIEMBRE 2018.)#	RD	TO	0	2100414	20190822	0.00	0	20000101	20000101	20000101
CR	10030045116	12526347  	2	2100414	00000000	227242.00	N	0	E	0	851612	U99BRENDA 	20190822	14:56:10  	P	600	1.00	Cancelación Fact. Crédito Nro. 10030033499(ALQUILER DE POS - SETIEMBRE 2018.) y Cancelación Fact. Crédito Nro. 10030034073(BOBINAS PARA POS) y Cancelación Fact. Crédito Nro. 10030037305(ALQUILER DE POS - OCTUBRE 2018.) y Cancelación Fact. Crédito Nro. 10030041193(ALQUILER DE POS - NOVIEMBRE 2018.) y Pago parcial de Fact. Crédito Nro. 10030045116(ALQUILER DE POS - DICIEMBRE 2018.)#	RD	TO	0	2100414	20190822	0.00	0	20000101	20000101	20000101

--   COMNRORND = '12256' and

comnro='10030010667' 
DELETE FROM gxopera.fcobros  WHERE  COMNRORND = '12256' and COMFECRND='20190822' 



 inner join gxbdbps.comaeaf on cocomer=digits(lidcom)
where lfectr='20210525' and 

select lidcom,cocomer, lcomtr,codeno,corazo from libdebito.drconbep a 
inner join gxbdbps.comaeaf b on  b.cocomer = substr(digits(a.lidcom), 6, 7)
where lfectr='20210525'
