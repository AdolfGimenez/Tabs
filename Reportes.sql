select * from gxfindta.tcltsb
--no le gusta espacios, punto, acentos, barras
select TSBIDOP As Envio_ID,               
TSBTPOP As Operacion_Tipo,          
TSBDEOP As Operacion_Descripcion,   
TSBCODSWD As Cod_Switch_Debito ,     
TSBBADE As Entidad_Debito,         
TSBCTDE As Entidad_Cuenta_Debito,   
TSBTPDE As Cuenta_Tipo_Debito,      
TSBCODSWC As Cod_Switch_Credito,    
TSBBACR As Entidad_Credito,         
TSBCTCR As Entidad_Cuenta_Credito,  
TSBTPCR As Cuenta_Tipo_Credito,     
TSBCOCO As Codigo_Negocio,          
TSBDENE As Denominacion_Negocio,        
TSBNREF As Nro_Referencia_Lote,      
TSBIMPO As Importe,                  
TSBMONE As Moneda_Id,                
TSBMONSIG As Moneda_Sigla,             
TSBFEGE As Fecha_de_Generacion,      
TSBESTA As Operacion_Estado,         
TSBCOME As Codigo_Retorno,           
TSBDEME As Mensaje,                  
TSBUSUA As Usuario_Actualizacion,    
TSBFEAC As Fecha_Actualizacion,      
SERCODI As Codigo_Servicio,          
PRECODI As Codigo_Prestacion,       
TSBIDTPDOC As Tipo_Documento_Titular,                    
TSBNRODOC As Nro_Documento_Titular,          
TSBDOCCOM As Nro_Documento_Comercio,         
TSBMOTIVO As Motivo_Reenvio,                  
TSBTPOACR As Tipo_Acreditacion,               
TSBFECCON As Fecha_Conciliacion,              
TSBCONSN As Conciliado_S_N from gxfindta.tcltsb where TSBFEGE>='2021-12-01 00:00:01'