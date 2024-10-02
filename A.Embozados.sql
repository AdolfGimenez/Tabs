Ayuda embozado

Origen
TGEMBHAF 
Destino
embnov0d debitos (incluidas las de 16 y 17 digitos 040, 165, 166)
embnov0p (creditos y prepagas)
TGEMBNOV (BNF)

Solicitar e usuario de operaciones la entidad, quien proceso, fecha, si es debito de 16 o 17, credito o prepaga o BNF para saber donde depositar los registros.

************************************************************************************

EMBNOV0P

SELECT
CRENTI, CRSUCU, CRCLAT, CRBINE, CRTARJ, CRDECR, 
CRNROC, CRNCTA, CRNOMB, CRDOCU, CRVENC, CRNEMP, 
CRDIRE, CRLOCA, CRTELE, CRLCRE, CRCODN, CRUSGE, 
CRHOGE, 20200325 as CRFEGE, CRRETO, 
'' as CRUSEJ, 0 as CRHOEJ, 0 as CRFEEJ
FROM libdebito.TGEMBHAF
where CRUSEJ='U99WALTER' AND        
CRFEEJ='20200427'
and             
CRENTI in (                        
'168')               
and CRCODN<>'5'

Luego

update biblioteca/auxiliar set CRUSEJ='', CRHOEJ=0, CRFEEJ=0

Copiar los datos de auxiliar a tabla correspondiente, en este caso EMBNOV0P

Borrar registros duplicados en TGEMBHAF.

Sentencias realizadas poner en redmine por auditoria

************************************************************************************
BNF TGEMBNOV 

SELECT
CRENTI, CRSUCU, CRCLAT, CRBINE, CRTARJ, CRDECR, 
CRNROC, CRNCTA, CRNOMB, CRTDOC, CRDOCU, CRVENC, CRNEMP, 
CRDIRE, CRLOCA, CRTELE, CRLCRE, CRCODN, CRUSGE, 
CRHOGE, CRFEGE, CRRETO, 
CRUSEJ, CRHOEJ, CRFEEJ
FROM libdebito.TGEMBHAF
where CRUSEJ='U99WALTER' AND        
CRFEEJ='20200427'
and             
CRENTI in (                        
'002')               
and CRCODN<>'5'

Luego

update biblioteca/auxiliar set CRUSEJ='', CRHOEJ=0, CRFEEJ=0

Copiar los datos de auxiliar a tabla correspondiente, en este caso TGEMBNOV 

Borrar registros duplicados en TGEMBHAF.

Sentencias realizadas poner en redmine por auditoria

************************************************************************************

embnov0d Debito 16 digitos

SELECT
CRENTI, CRSUCU, CRCLAT, 
CRBINE, CRTARJ, CRDECR, 
CRNROC, CRNCTA, CRNOMB, 
cRDOCU, CRVENC, CRNEMP, 
CRDIRE, CRLOCA, CRTELE, 
CRLCRE, CRCODN, CRUSGE, 
CRHOGE, 20200812 CRFEGE, CRRETO, 
CRUSEJ, CRHOEJ, 20200812 as CRFEEJ
FROM libdebito.TGEMBHAF
where CRUSEJ='U99WALTER' AND                 
CRFEEJ='20200812' and                         
CRENTI in ('020')
and crhoej>='150000'
and crbine='703020'

Luego

update biblioteca/auxiliar set CRUSEJ='', CRHOEJ=0, CRFEEJ=0

Copiar los datos de auxiliar a tabla correspondiente, en este caso EMBNOV0D

Borrar registros duplicados en TGEMBHAF.

Sentencias realizadas poner en redmine por auditoria


************************************************************************************

embnov0d DEBITO 17 digitos de tarjeta

select CRENTI, CRSUCU, CRCLAT, CRBINE, tdctatar as crtarj, CRDECR, 
decimal(substr(CRTARJ,7,10)) as CRNROC, 
CRNCTA, CRNOMB, CRDOCU, CRVENC, CRNEMP, 
CRDIRE, CRLOCA, CRTELE, CRLCRE, CRCODN, CRUSGE, 
CRHOGE, 20200518 as CRFEGE, CRRETO, CRUSEJ, CRHOEJ, 0 as CRFEEJ
from LIBDEBITO.TGEMBHAF a 
inner join gxbdbps.tdcta on tdctanro=decimal(substr(CRTARJ,7,10)) 
where   a.crbine in ('703020')
and a.crfege='20200518'
and a.crhoej>'105223'

Luego

update biblioteca/auxiliar set CRUSEJ='', CRHOEJ=0, CRFEEJ=0

Copiar los datos de auxiliar a tabla correspondiente, en este caso EMBNOV0D

Borrar registros duplicados en TGEMBHAF.

Sentencias realizadas poner en redmine por auditoria

************************************************************************************


--Temporales

select * from libdebito.embnovtmp

select * from libdebito.EMBNOVTMD


************************************************************************************

select CRENTI, CRSUCU, CRCLAT, CRBINE, tdctatar as crtarj, CRDECR, 
decimal(substr(CRTARJ,7,10)) as CRNROC, 
CRNCTA, CRNOMB, CRDOCU, CRVENC, CRNEMP, 
CRDIRE, CRLOCA, CRTELE, CRLCRE, CRCODN, CRUSGE, 
CRHOGE, 20200114 as CRFEGE, CRRETO, CRUSEJ, CRHOEJ, 0 as CRFEEJ
from yapi.TGEMBHAFhf a 
inner join gxbdbps.tdcta on tdctanro=decimal(substr(CRTARJ,7,10)) 
 

select * from libdebito/TGEMBHAF   
where CRUSEJ='U99IVANA' AND        
CRFEEJ='20200115' and              
CRENTI in (                        
'040', '165', '166')               
and CRCODN<>'5'          

update libdebito/embnov0d set CRUSEJ='', CRHOEJ=0, CRFEEJ=0


select * from libdebito/TGEMBHAF              
where CRUSEJ='U99ENRIQUE' AND                 
CRFEEJ='20200114' and                         
CRENTI in ('107', '151', '155', '158', '162', 
'319', '040', '165', '166', '002')            
                                              
and CRCODN<>'5'


SELECT
CRENTI, CRSUCU, CRCLAT, CRBINE, CRTARJ, CRDECR, 
CRNROC, CRNCTA, CRNOMB, CRDOCU, CRVENC, CRNEMP, 
CRDIRE, CRLOCA, CRTELE, CRLCRE, CRCODN, CRUSGE, 
CRHOGE, 20200120 as CRFEGE, CRRETO, 
'' as CRUSEJ, 0 as CRHOEJ, 0 as CRFEEJ
FROM libdebito.TGEMBHAF
where CRUSEJ='U99WALTER' AND        
CRFEEJ='20200120'
and             
CRENTI in (                        
'113', '151', '164',)               
and CRCODN<>'5'

Para generar archivo desde el historico

SELECT
CRENTI, CRSUCU, CRCLAT, CRBINE, CRTARJ, CRDECR, 
CRNROC, CRNCTA, CRNOMB, CRDOCU, CRVENC, CRNEMP, 
CRDIRE, CRLOCA, CRTELE, CRLCRE, CRCODN, CRUSGE, 
CRHOGE, 20200120 as CRFEGE, CRRETO, 
'' as CRUSEJ, 0 as CRHOEJ, 0 as CRFEEJ
FROM libdebito.TGEMBHAF
where CRUSEJ='U99WALTER' AND        
CRFEEJ='20200120'
and             
CRENTI in (                        
'113', '151', '164,)               
and CRCODN<>'5'
          
