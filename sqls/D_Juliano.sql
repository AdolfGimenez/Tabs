--http://iseries-peru.blogspot.com/2011/04/convertir-fecha-juliana-en-sql400.html

/*viernes, 1 de abril de 2011
Convertir Fecha Juliana en SQL/400 (Convertir a Formato Gregoriano, ISO, EUR)
FECHA_JUL es variable de archivo de tipo NUMERICO de 7 posiciones (7,0)*/

-- YYYYDDD a Formato DD/MM/YY

            DATE(CHAR (FECHA_JUL))

-- YYYYDDD a Formato DD.MM.YYYY (EUR)

CHAR(DATE(CHAR (FECHA_JUL)), EUR)

--- YYYYDDD a Formato YYYY-MM-DD (ISO)

CHAR(DATE(CHAR (FECHA_JUL)), ISO)
==> SELECT TASA, FEC_JUL, DATE(CHAR( FEC_JUL)) AS GREGORIANO,
CHAR(DATE(CHAR(FEC_JUL)), ISO) AS FORMATO_ISO,
CHAR(DATE(CHAR(FEC_JUL)), EUR) AS FORMATO_EUR
FROM MILIBRERIA/FECHAS

