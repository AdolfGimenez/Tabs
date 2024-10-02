---···###---···###---···###---···###---···###---···###---···###---···###---···###---···###---···###---···###---···###---···###---···###---···###---···###---···###---···###
YAPPROD = PASO A PASO
#1 LIMPIEZA DE LA TABLA PRUEBCLR = CLRPFM FILE(LIBDEBITO/PRUEBCLR)
#2 COPIAR EL REGISTRO A LA TABLA PRUEBCLR
#3 CAMBIAR LAS FECHAS DEL REGISTRO DENTRO DE PRUEBCLR (COLOCAR LA FECHA ACTUAL EN QUE SE VA A EJECUTAR)
#4 COMPARAR ENTRE OPMOVI Y DRCONBEP EL REGISTRO ANTES Y DESPUES DEL PROCESO
#5 ORDENAR LISTA DE BIBLIOTECAS:
	A- LIBDEBITO
	B- GXOPERA
	C- GXWEB
#6 CORRER SUBMITIDO: SBMJOB (CARGAR 2 VECES PARAMETRO DE FECHA DEL DIA-ESPECIFICAR USER QCOMUNICA)
SBMJOB CMD(CALL PGM(LIBDEBITO/YAPPROD) PARM('20210406' '20210406')) JOB(CLEARIN_ON) USER(QCOMUNICA)                                                       

SELECT * FROM LIBDEBITO.PRUEBCLR
SELECT * FROM LIBDEBITO.DRCONBEP WHERE LERRNB='128094615790';
SELECT * FROM GXOPERA.OPMOVI WHERE OPNOREF='128094615790';
SELECT * FROM GXOPERA.OPLIQUI WHERE OPNROREF='128094615790';

select lerrnb, lnrtar, lidcom, lidtra, lfectr, lhortr,     
lbinpr, LIMPGS                                                     
from libdebito.pruebclr inner join gxopera.opentid1        
on lenemi = entcodi where lfectr between '20211010'            
and '20211015' and lcretr = '00' and lesttr = 'A'              
and limpgs > 0 and lbinpr in ('627431', '703002', '703040')
and lcodtr = '000054'  and enttipo = 'DEB'                 
                                                           
except                                                     

select opnoref, optarj, opcomer, opidtra, opferea, ophotrn,
substr(optarj,1,6), OPMONTO from GXOPERA.opmovi                 
where opfecom = '20211010' and opferea = '20211015' and           
opcodtrn = '000054' and optiptar = 'DEB';  
------------REGISTRO CON ERROR POR YAPPROD-------------
SELECT * FROM GXOPERA.OPMOVI WHERE OPNOREF IN ('035725724856');    
SELECT * FROM GXOPERA.OPliqui WHERE OPNrOREF IN ('035725724856');
SELECT * FROM GXOPERA.FLICOM WHERE LICOMER='0301685' AND LIFECHD='20210108';
SELECT * FROM GXOPERA.FLICOM1 WHERE LICOMER='0301685' AND LIFECHD='20210108';   
SELECT * FROM GXOPERA.OPRECLE WHERE RECOMER='0301685' AND REFECH='20210108';           

SELECT * FROM GXBDBPS.COMAEAF WHERE COCOMER='6000704'
