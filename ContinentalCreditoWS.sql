"--BSMCOBR = 'N', BSFEACT = '00000000', BSNOVED = 'SEGUN EL CASO'
SELECT * FROM GXBDBPS.tembsaf WHERE bsnumta = '6274310211000012'
--consultas
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
select MTESTHA, MTFEVE2, mtfeemi, MTTIPOT FROM GXBDBPS.TMTArAF where bibines ='627431' and ENEMISO = '021' and MTNUMTA = '2307290000000037';
select BSMCOBR, BSFEACT, BSNOVED FROM GXBDBPS.tembsaf WHERE bsnumta = '6274310210000260'
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
--update para setear los datos
	update gxbdbps.tembsaf set BSMCOBR = 'N', BSFEACT = '00000000', BSNOVED = '3' 
	WHERE bsnumta = '2307290000000011';
	update gxbdbps.tmtaraf set MTESTHA = 'E', MTFEVE2 = '2101' , mtfeemi = '00000000', mttipot ='3' 
	where bibines ='627431' and ENEMISO = '021' and afafini = '501'and MTNUMTA = '2307290000000011';
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
--MTESTHA = 'E', MTFEVE2 <> 0 , mtfeemi = '00000000', MTTIPOT = 'SEGUN EL CASO'
select * FROM GXBDBPS.TMTArAF where bibines ='627431' and ENEMISO = '021' and afafini = '501'and MTNUMTA = '6274310211000012'

select * FROM GXBDBPS.TMTArAF where mttipot ='4' and bibines ='627431' and ENEMISO = '021'

--novedad 5

--para verificar el numero de tarjeta principal de una cuenta
select MCNUMTA from gxbdbps.tmctaaf where MCNUMCT = '20112100001'
-------------------------
-------------------------

select * FROM GXBDBPS.TMTArAF where MTNUMTA = '2307290000000037'

select * FROM GXBDBPS.TMTArAF where MTNUMTA = '6274310211000012'

select MTESTHA, MTFEVE2 FROM GXBDBPS.TMTArAF where MTNUMTA = '6274310211000012' MTESTHA = 'E' and MTFEVE2 <> 0

select * from gxbdbps.tmctaaf where MCNUMCT = '20112100001'
--cuotas tarjeta principal

															------------------------------------------------------------------------------------
															-------------------TOMA LAS CUOTAS DE ESTAS TABLAS----------------------------------
															------------------------------------------------------------------------------------


--SI EL TIPO DE TARJETA ES  1  O  4
--novedad 1
SELECT afcuemp FROM GXBDBPS.TAFINAF WHERE BIBINES LIKE '627431' AND ENEMISO LIKE '021' AND AFAFINI LIKE '501' and afcobem = '002'
--novedad 4, 6 y 7
SELECT afcurep FROM GXBDBPS.TAFINAF WHERE BIBINES LIKE '627431' AND ENEMISO LIKE '021' AND AFAFINI LIKE '501' and afcobem = '002'
--novedad 2 y 3
SELECT afcurgp FROM GXBDBPS.TAFINAF WHERE ENEMISO LIKE '021' AND AFAFINI LIKE '501' and afcobem = '002'
--novedad 5
SELECT afcupip FROM GXBDBPS.TAFINAF WHERE ENEMISO LIKE '021' AND AFAFINI LIKE '506' and afcobem = '002'

							--cuotas tarjeta adicional
							--SI EL TIPO DE TARJETA ES  3
							--novedad 1
							SELECT afcuema FROM GXBDBPS.TAFINAF WHERE BIBINES LIKE '627431' AND ENEMISO LIKE '021' AND AFAFINI LIKE '501'and afcobem = '002'
							--novedad 4, 6 y 7
							SELECT afcurea FROM GXBDBPS.TAFINAF WHERE BIBINES LIKE '627431' AND ENEMISO LIKE '021' AND AFAFINI LIKE '501'and afcobem = '002'
							--novedad 2 y 3
							SELECT afcurga FROM GXBDBPS.TAFINAF WHERE BIBINES LIKE '627431' AND ENEMISO LIKE '021' AND AFAFINI LIKE '501'and afcobem = '002'
							--novedad 5
							SELECT afcupia FROM GXBDBPS.TAFINAF WHERE ENEMISO LIKE '021' AND AFAFINI LIKE '506'and afcobem = '002'

															------------------------------------------------------------------------------------
															----------------SI EXISTEN CUOTAS, TOMA LOS MONTOS DE ESTAS TABLAS------------------
															------------------------------------------------------------------------------------
															--costos tarjeta principal
															--SI EL TIPO DE TARJETA ES  1  O  4
															--novedad 1
															SELECT afcoemp FROM GXBDBPS.TAFINAF WHERE BIBINES LIKE'627431' AND ENEMISO LIKE '021' AND AFAFINI LIKE '501' and afcobem = '002'
															--novedad 4, 6 y 7
															SELECT afcorep FROM GXBDBPS.TAFINAF WHERE BIBINES LIKE'627431' AND ENEMISO LIKE '021' AND AFAFINI LIKE '501' and afcobem = '002'
															--novedad 2 y 3
															SELECT afcorgp FROM GXBDBPS.TAFINAF WHERE BIBINES LIKE'627431' AND ENEMISO LIKE '021' AND AFAFINI LIKE '501' and afcobem = '002'
															--novedad 5
															SELECT afcopip FROM GXBDBPS.TAFINAF WHERE BIBINES LIKE'627431' AND ENEMISO LIKE '021' AND AFAFINI LIKE '501' and afcobem = '002'


															--costos tarjeta adicional
															--SI EL TIPO DE TARJETA ES  3
															--novedad 1
															SELECT afcoema FROM GXBDBPS.TAFINAF WHERE BIBINES LIKE '627431'  AND ENEMISO LIKE '021' AND AFAFINI LIKE '501' and afcobem = '002'
															--novedad 4, 6 y 7
															SELECT afcorea FROM GXBDBPS.TAFINAF WHERE BIBINES LIKE '627431'  AND ENEMISO LIKE '021' AND AFAFINI LIKE '501' and afcobem = '002'
															--novedad 2 y 3
															SELECT afcurga FROM GXBDBPS.TAFINAF WHERE BIBINES LIKE '627431'  AND ENEMISO LIKE '021' AND AFAFINI LIKE '501' and afcobem = '002'
															--novedad 5
															SELECT afcorga FROM GXBDBPS.TAFINAF WHERE BIBINES LIKE '627431'  AND ENEMISO LIKE '021' AND AFAFINI LIKE '501' and afcobem = '002'

------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
luego si MTTIPOT de la tarjeta es 4
--novedad 4 y 7
	
       select mtestha, mttipot, mtfeemi, MTFEVEN, MTFEVE2 from GXBDBPS.tmtaraf  where enemiso = '021' and mtnumta = '6274310210000260'
--novedad 2 y 6
			 
       select mtestha, mttipot, mtfeemi, BLCODIG from GXBDBPS.tmtaraf where enemiso = '021' and mtnumta = '6274310210000260'
--novedad 1, 5 y 3
        select mtestha, mttipot, mtfeemi from GXBDBPS.tmtaraf where enemiso = '021' and mtnumta = '6274310210000260'
si no es 4 entra a:
--novedad 4 y 7
    
         select mtestha, mtfeemi, MTFEVEN, MTFEVE2 from GXBDBPS.tmtaraf  where enemiso = '021' and mtnumta = '6274310211000038'
--novedad 2, 3 y 6
    
         select mtestha, mtfeemi, BLCODIG from GXBDBPS.tmtaraf where enemiso = '021' and mtnumta = '6274310211000038'
--novedad 5 y 1
         select mtestha, mtfeemi from GXBDBPS.tmtaraf where enemiso = '021' and mtnumta = '2307290000000011'

------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
SELECT CMDESCR FROM GXBDBPS.TCMOVAF WHERE CMCODIG = '050'

--Detalle y cabecera de cuotas--
															------------------------------------------------------------------------------------
															----------------SI EXISTEN CUOTAS, SE CARGAN LAS TABLAS CABECERA Y DETALLE----------
															------------------------------------------------------------------------------------
select * from gxbdbps.tcuotaf --(cabecera)-- 
select * from gxbdbps.tcuotaf where cmcodig in ('050', '060', '070', '080') and cuidusr ='USERWS' and cuferea ='20200219' and  mtnumta = '2307290000000011' order by CUHORA --in ('6274310211000153', '6274310210000617', '6274310211000204', '6274310210000633') = '6274310211000095'
select * from	gxbdbps.tcuo1af --(detalle)--
select * from	gxbdbps.tcuo1af where mtnumta= '2307290000000011' --in ('6274310211000153', '6274310210000617', '6274310211000204', '6274310210000633') = '6274310211000095' 
--Tmoviaf para una sola cuota--
select * from gxbdbps.tmoviaf where cmcodig in ('050', '060', '070', '080')

															------------------------------------------------------------------------------------
															----------------SI NO EXISTEN CUOTAS, EL MONTO SE ALMACENA EN ESTA TABLA------------
															------------------------------------------------------------------------------------

select * from gxbdbps.tmoviaf where mtnumta = '2307290000000011' and MVFEREA = '20200219' order by MVHORA -- in ( '6274310210000716', '6274310210000625', '6274310210000641') ('6274310211000153', '6274310210000617', '6274310

