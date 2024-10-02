*******************************************************************************************************************
CREATE MASK GXBDBPS.NOTIAPP ON GXBDBPS.NOTIAPP AS NOTIAPP 
	FOR COLUMN NOTITAR    
	RETURN  CASE 
WHEN QSYS2 . VERIFY_GROUP_FOR_USER ( CURRENT_USER , 'DBA' , 'VIEWTAR', 'OPERNOC' ) = 1 
THEN NOTIAPP . NOTITAR 
ELSE QSYS2 . SUBSTR ( NOTIAPP . NOTITAR , 1 , 6 ) CONCAT 'XXXXXX' CONCAT QSYS2 . SUBSTR ( NOTIAPP . NOTITAR , 13 , 4 ) 
END    
	ENABLE  ; 
  
;
*******************************************************************************************************************
CREATE MASK GXBDBPS.TCUOTAF ON GXBDBPS.TCUOTAF AS TCUOTAF 
  FOR COLUMN MTNUMTA 
  RETURN  CASE 
WHEN QSYS2 . VERIFY_GROUP_FOR_USER ( CURRENT_USER , 'DBA' , 'VIEWTAR', 'OPERNOC' ) = 1 
THEN TCUOTAF . MTNUMTA 
ELSE QSYS2 . SUBSTR ( TCUOTAF . MTNUMTA , 1 , 6 ) CONCAT 'XXXXXX' CONCAT QSYS2 . SUBSTR ( TCUOTAF . MTNUMTA , 13 , 4 ) 
END 
  ENABLE  ; 
;
*******************************************************************************************************************
CREATE MASK GXBDBPS.TCUO1AF ON GXBDBPS.TCUO1AF AS TCUO1AF 
	FOR COLUMN MTNUMTA    
	RETURN  CASE 
WHEN QSYS2 . VERIFY_GROUP_FOR_USER ( CURRENT_USER , 'DBA' , 'VIEWTAR', 'OPERNOC' ) = 1 
THEN TCUO1AF . MTNUMTA 
ELSE QSYS2 . SUBSTR ( TCUO1AF . MTNUMTA , 1 , 6 ) CONCAT 'XXXXXX' CONCAT QSYS2 . SUBSTR ( TCUO1AF . MTNUMTA , 13 , 4 ) 
END    
	ENABLE  ; 
;
*******************************************************************************************************************
CREATE MASK GXBDBPS.TDCTA ON GXBDBPS.TDCTA AS TDCTA 
	FOR COLUMN TDCTATAR   
	RETURN  CASE 
WHEN QSYS2 . VERIFY_GROUP_FOR_USER ( CURRENT_USER , 'DBA' , 'VIEWTAR', 'OPERNOC' ) = 1 
THEN TDCTA . TDCTATAR 
ELSE QSYS2 . SUBSTR ( TDCTA . TDCTATAR , 1 , 6 ) CONCAT 'XXXXXX' CONCAT QSYS2 . SUBSTR ( TDCTA . TDCTATAR , 13 , 4 ) 
END    
	ENABLE  ; 
;
*******************************************************************************************************************
CREATE MASK GXBDBPS.TENTARES ON GXBDBPS.TENTARES AS TENTARES 
	FOR COLUMN ENTARNRO   
	RETURN  CASE 
WHEN QSYS2 . VERIFY_GROUP_FOR_USER ( CURRENT_USER , 'DBA' , 'VIEWTAR', 'OPERNOC' ) = 1 
THEN TENTARES . ENTARNRO 
ELSE QSYS2 . SUBSTR ( TENTARES . ENTARNRO , 1 , 6 ) CONCAT 'XXXXXX' CONCAT QSYS2 . SUBSTR ( TENTARES . ENTARNRO , 13 , 4 ) 
END    
	ENABLE  ; 
  
;
*******************************************************************************************************************
CREATE MASK GXBDBPS.THEXTRAF ON GXBDBPS.THEXTRAF AS THEXTRAF 
	FOR COLUMN HENUMTA    
	RETURN  CASE 
WHEN QSYS2 . VERIFY_GROUP_FOR_USER ( CURRENT_USER , 'DBA' , 'VIEWTAR', 'OPERNOC' ) = 1 
THEN THEXTRAF . HENUMTA 
ELSE QSYS2 . SUBSTR ( THEXTRAF . HENUMTA , 1 , 6 ) CONCAT 'XXXXXX' CONCAT QSYS2 . SUBSTR ( THEXTRAF . HENUMTA , 13 , 4 ) 
END    
	ENABLE  ; 
;
*******************************************************************************************************************
CREATE MASK GXBDBPS.THMOVAF ON GXBDBPS.THMOVAF AS THMOVAF 
	FOR COLUMN HMNUMTA    
	RETURN  CASE 
WHEN QSYS2 . VERIFY_GROUP_FOR_USER ( CURRENT_USER , 'DBA' , 'VIEWTAR', 'OPERNOC' ) = 1 
THEN THMOVAF . HMNUMTA 
ELSE QSYS2 . SUBSTR ( THMOVAF . HMNUMTA , 1 , 6 ) CONCAT 'XXXXXX' CONCAT QSYS2 . SUBSTR ( THMOVAF . HMNUMTA , 13 , 4 ) 
END    
	ENABLE  ; 
  
;
*******************************************************************************************************************
CREATE MASK GXBDBPS.TMCTAAF_MCNUMTA ON GXBDBPS.TMCTAAF AS TMCTAAF 
	FOR COLUMN MCNUMTA    
	RETURN  CASE 
WHEN QSYS2 . VERIFY_GROUP_FOR_USER ( CURRENT_USER , 'DBA' , 'VIEWTAR', 'OPERNOC' ) = 1 
THEN TMCTAAF . MCNUMTA 
ELSE QSYS2 . SUBSTR ( TMCTAAF . MCNUMTA , 1 , 6 ) CONCAT 'XXXXXX' CONCAT QSYS2 . SUBSTR ( TMCTAAF . MCNUMTA , 13 , 4 ) 
END    
	ENABLE  ; 
  
;
*******************************************************************************************************************
CREATE MASK GXBDBPS.TMOVIAF_MTNUMTA ON GXBDBPS.TMOVIAF AS TMOVIAF 
	FOR COLUMN MTNUMTA    
	RETURN  CASE 
WHEN QSYS2 . VERIFY_GROUP_FOR_USER ( CURRENT_USER , 'DBA' , 'VIEWTAR', 'OPERNOC' ) = 1 
THEN TMOVIAF . MTNUMTA 
ELSE QSYS2 . SUBSTR ( TMOVIAF . MTNUMTA , 1 , 6 ) CONCAT 'XXXXXX' CONCAT QSYS2 . SUBSTR ( TMOVIAF . MTNUMTA , 13 , 4 ) 
END    
	ENABLE  ; 
  
;
*******************************************************************************************************************
CREATE MASK GXBDBPS.TMTARAF_MTNUMTA ON GXBDBPS.TMTARAF AS TMTARAF 
	FOR COLUMN MTNUMTA    
	RETURN  CASE 
WHEN QSYS2 . VERIFY_GROUP_FOR_USER ( CURRENT_USER , 'DBA' , 'VIEWTAR', 'OPERNOC' ) = 1 
THEN TMTARAF . MTNUMTA 
ELSE QSYS2 . SUBSTR ( TMTARAF . MTNUMTA , 1 , 6 ) CONCAT 'XXXXXX' CONCAT QSYS2 . SUBSTR ( TMTARAF . MTNUMTA , 13 , 4 ) 
END    
	ENABLE  ; 
;
select * from gxbdbps.tmtaraf
update cierrelib.tmtaraf set mtnopla='NOMBRE DE TARJETA'
CREATE MASK GXBDBPS.TMTARAF_MTNUMTA ON GXBDBPS.TMTARAF AS TMTARAF 
	FOR COLUMN MTNUMTA    
	RETURN  CASE 
WHEN QSYS2 . VERIFY_GROUP_FOR_USER ( CURRENT_USER , 'DBA' , 'VIEWTAR', 'OPERNOC' ) = 1 
THEN TMTARAF . MTNUMTA 
ELSE QSYS2 . SUBSTR ( TMTARAF . MTNUMTA , 1 , 6 ) CONCAT 'XXXXXX' CONCAT QSYS2 . SUBSTR ( TMTARAF . MTNUMTA , 13 , 4 ) 
END    
	ENABLE  ; 
;
*******************************************************************************************************************
CREATE MASK LIBDEBITO.DRCONBEP_NROTARJ ON LIBDEBITO.DRCONBEP AS DRCONBEP 
	FOR COLUMN LNRTAR     
	RETURN  CASE 
WHEN QSYS2 . VERIFY_GROUP_FOR_USER ( CURRENT_USER , 'DBA' , 'VIEWTAR', 'OPERNOC' ) = 1 
THEN DRCONBEP . LNRTAR 
ELSE QSYS2 . SUBSTR ( DRCONBEP . LNRTAR , 1 , 6 ) CONCAT 'XXXXXX' CONCAT QSYS2 . SUBSTR ( DRCONBEP . LNRTAR , 13 , 4 ) 
END    
	ENABLE  ; 
  
;
*******************************************************************************************************************
CREATE MASK LIBDEBITO.DRCONBEP ON LIBDEBITO.DRCONBEP AS DRCONBEP 
	FOR COLUMN LNRTAR     
	RETURN  CASE 
WHEN QSYS2 . VERIFY_GROUP_FOR_USER ( CURRENT_USER , 'DBA' , 'VIEWTAR', 'OPERNOC') = 1 
THEN DRCONBEP . LNRTAR 
ELSE QSYS2 . SUBSTR ( DRCONBEP . LNRTAR , 1 , 6 ) CONCAT 'XXXXXX' CONCAT QSYS2 . SUBSTR ( DRCONBEP . LNRTAR , 13 , 4 ) 
END    
	ENABLE  ; 
;
select * from libdebito.drconbep
*******************************************************************************************************************
CREATE MASK LIBDEBITO.MAEDINEL ON LIBDEBITO.MAEDINEL AS MAEDINEL 
	FOR COLUMN PRIN01     
	RETURN  CASE 
WHEN QSYS2 . VERIFY_GROUP_FOR_USER ( CURRENT_USER , 'DBA' , 'VIEWTAR', 'OPERNOC') = 1 
THEN MAEDINEL . PRIN01 
ELSE QSYS2 . SUBSTR ( MAEDINEL . PRIN01 , 1 , 6 ) CONCAT 'XXXXXX' CONCAT QSYS2 . SUBSTR ( MAEDINEL . PRIN01 , 13 , 4 ) 
END    
	ENABLE  ; 
  
;
*******************************************************************************************************************
CREATE MASK LIBDEBITO.MOVDINEL ON LIBDEBITO.MOVDINEL AS MOVDINEL 
	FOR COLUMN MVTAR02    
	RETURN  CASE 
WHEN QSYS2 . VERIFY_GROUP_FOR_USER ( CURRENT_USER , 'DBA' , 'VIEWTAR', 'OPERNOC' ) = 1 
THEN MOVDINEL . MVTAR02 
ELSE QSYS2 . SUBSTR ( MOVDINEL . MVTAR02 , 1 , 6 ) CONCAT 'XXXXXX' CONCAT QSYS2 . SUBSTR ( MOVDINEL . MVTAR02 , 13 , 4 ) 
END    
	ENABLE  ; 
;
*******************************************************************************************************************
CREATE MASK BEPSABKP.DRCONBKP_NROTARJ ON LIBDEBITO.DRCONBEP AS DRCONBEP 
	FOR COLUMN BLNRTAR     
	RETURN  CASE 
WHEN QSYS2 . VERIFY_GROUP_FOR_USER ( CURRENT_USER , 'DBA' , 'VIEWTAR', 'OPERNOC' ) = 1 
THEN DRCONBKP . BLNRTAR 
ELSE QSYS2 . SUBSTR ( DRCONBBKP . LNRTAR , 1 , 6 ) CONCAT 'XXXXXX' CONCAT QSYS2 . SUBSTR ( DRCONBKP . LNRTAR , 13 , 4 ) 
END    
	ENABLE  ; 
*******************************************************************************************************************
CREATE MASK GXBDBPS.TDEMNOTAR ON GXBDBPS.TDEMNOTAR AS TDEMNOTAR
FOR COLUMN NENROTARJ
RETURN  CASE 
WHEN QSYS2.VERIFY_GROUP_FOR_USER ( CURRENT_USER, 'DBA' , 'DESAPRF2')=1 
THEN TDEMNOTAR.NENROTARJ
ELSE QSYS2.SUBSTR ( TDEMNOTAR . NENROTARJ , 1 , 6 ) CONCAT 'XXXXXX' CONCAT QSYS2 . SUBSTR ( TDEMNOTAR . NENROTARJ , 13 , 4 ) 
END    
	ENABLE  ; 
;
*******************************************************************************************************************
CREATE MASK GXTRJDTA.TTDEMI ON GXTRJDTA.TTDEMI AS TTDEMI
FOR COLUMN EMINROTRJD
RETURN  CASE 
WHEN QSYS2.VERIFY_GROUP_FOR_USER ( CURRENT_USER, 'DBA' , 'DESAPRF2')=1 
THEN TTDEMI.EMINROTRJD
ELSE QSYS2.SUBSTR ( TTDEMI . EMINROTRJD , 1 , 6 ) CONCAT 'XXXXXX' CONCAT QSYS2 . SUBSTR ( TTDEMI . EMINROTRJD , 13 , 4 ) 
END    
	ENABLE  ; 
;

*******************************************************************************************************************
CREATE MASK GXBDBPS.AIT002 ON GXBDBPS.AIT002 AS AIT002 
	FOR COLUMN AITCTRJNRO    
	RETURN  CASE 
WHEN QSYS2 . VERIFY_GROUP_FOR_USER ( CURRENT_USER , 'DBA') = 1 
THEN AIT002 . AITCTRJNRO 
ELSE QSYS2 . SUBSTR ( AIT002 . AITCTRJNRO , 1 , 6 ) CONCAT 'XXXXXX' CONCAT QSYS2 . SUBSTR ( AIT002 . AITCTRJNRO , 13 , 4 ) 
END    
	ENABLE  ; 
;
*******************************************************************************************************************

