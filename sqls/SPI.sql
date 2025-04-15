-----------------------------------------------------------------------------------------------------------------------------
-- Create the database BCP_SPI
CREATE DATABASE "BCP_SPI"
    WITH
	ENCODING = 'UTF8';

-----------------------------------------------------------------------------------------------------------------------------
-- Create the user
CREATE USER "SPI_MS" WITH PASSWORD 'Ffc09Tw7KtV8';

-- Grant privileges on the database to the user
GRANT ALL PRIVILEGES ON DATABASE "BCP_SPI" TO "SPI_MS";
GRANT CONNECT ON DATABASE "BCP_SPI" TO "SPI_MS";

-- Switch to the new database
-- \c BCP_SPI;
-----------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------
-- SCHEMA: BCP_SPI

-- DROP SCHEMA IF EXISTS "BCP_SPI" ;
CREATE SCHEMA IF NOT EXISTS "BCP_SPI"
    AUTHORIZATION "SPI_MS";

-- Grant necessary privileges to the user on the schema
GRANT USAGE, CREATE ON SCHEMA "BCP_SPI" TO "SPI_MS";

-- Grant necessary privileges to the user on schema objects (tables, sequences, etc.)
ALTER DEFAULT PRIVILEGES IN SCHEMA "BCP_SPI"
    GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO "SPI_MS";
ALTER DEFAULT PRIVILEGES IN SCHEMA "BCP_SPI"
    GRANT USAGE, SELECT ON SEQUENCES TO "SPI_MS";

-----------------------------------------------------------------------------------------------------------------------------
-- Table: BCP_SPI.MX_ADMI002

-- DROP TABLE IF EXISTS "BCP_SPI"."MX_ADMI002";

CREATE TABLE IF NOT EXISTS "BCP_SPI"."MX_ADMI002"
(
    "ID" character varying(36) COLLATE pg_catalog."default" NOT NULL,
    "ID_MENSAJE" character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "RAZON_RECHAZO" character varying(30) COLLATE pg_catalog."default" NOT NULL,
    "FECHA_RECHAZO" timestamp without time zone NOT NULL,
    "MX_RECHAZO" character varying(30) COLLATE pg_catalog."default",
    "DATO_RECHAZO" text COLLATE pg_catalog."default" NOT NULL,
    "DESCRIPCION_RECHAZO" character varying(350) COLLATE pg_catalog."default" NOT NULL,
    "FECHA_CREACION" timestamp without time zone NOT NULL
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS "BCP_SPI"."MX_ADMI002"
    OWNER to "SPI_MS";

-----------------------------------------------------------------------------------------------------------------------------
-- Table: BCP_SPI.MX_ADMI004

-- DROP TABLE IF EXISTS "BCP_SPI"."MX_ADMI004";

CREATE TABLE IF NOT EXISTS "BCP_SPI"."MX_ADMI004"
(
    "ID" character varying(36) COLLATE pg_catalog."default" NOT NULL,
    "CODIGO_EVENTO" numeric NOT NULL,
    "PARAMETRO_EVENTO" character varying(35) COLLATE pg_catalog."default" NOT NULL,
    "FECHA_EVENTO" date NOT NULL,
    "FECHA_CREACION" date NOT NULL,
    "DESCRIPCION_EVENTO" character varying(1000) COLLATE pg_catalog."default" NOT NULL
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS "BCP_SPI"."MX_ADMI004"
    OWNER to "SPI_MS";

-----------------------------------------------------------------------------------------------------------------------------
-- Table: BCP_SPI.MX_CAMT025

-- DROP TABLE IF EXISTS "BCP_SPI"."MX_CAMT025";

CREATE TABLE IF NOT EXISTS "BCP_SPI"."MX_CAMT025"
(
    "ID" character varying(36) COLLATE pg_catalog."default" NOT NULL,
    "ID_MENSAJE" character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "ID_MENSAJE_ORIGINAL" character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "FECHA_CREACION" timestamp without time zone NOT NULL,
    "MX_REFERENCIA" character varying(35) COLLATE pg_catalog."default" NOT NULL,
    "BIC_ORIGEN" character varying(70) COLLATE pg_catalog."default" NOT NULL,
    "CODIGO_ESTADO" character varying(4) COLLATE pg_catalog."default" NOT NULL,
    "DESCRIPCION" character varying(140) COLLATE pg_catalog."default" NOT NULL
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS "BCP_SPI"."MX_CAMT025"
    OWNER to "SPI_MS";

-----------------------------------------------------------------------------------------------------------------------------
-- Table: BCP_SPI.MX_CONFIGURACION

-- DROP TABLE IF EXISTS "BCP_SPI"."MX_CONFIGURACION";

CREATE TABLE IF NOT EXISTS "BCP_SPI"."MX_CONFIGURACION"
(
    "ID" integer NOT NULL,
    "CANT_TRANSACCIONES" character varying COLLATE pg_catalog."default",
    "ID_EXTREMO" character varying(255) COLLATE pg_catalog."default",
    "INSTRUMENTO_LOCAL" character varying(255) COLLATE pg_catalog."default",
    "METODO_DE_PAGO" character varying(255) COLLATE pg_catalog."default",
    "INSTRUCCION_PAGO" character varying(255) COLLATE pg_catalog."default",
    "PORTADOR_CARGO" character varying(255) COLLATE pg_catalog."default",
    "ID_ORGANIZACION" character varying(36) COLLATE pg_catalog."default",
    "ORGANIZACION_ESQUEMA_NOMBRE" character varying(36) COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS "BCP_SPI"."MX_CONFIGURACION"
    OWNER to"SPI_MS";

-- Insert data into MX_PAIN001_CONFIGURACION table
INSERT INTO "BCP_SPI"."MX_CONFIGURACION"(
	"ID", "CANT_TRANSACCIONES", "ID_EXTREMO", "INSTRUMENTO_LOCAL", "METODO_DE_PAGO", "INSTRUCCION_PAGO", "PORTADOR_CARGO", "ID_ORGANIZACION", "ORGANIZACION_ESQUEMA_NOMBRE")
	VALUES (1, '1', 'NOTPROVIDED', 'PAYMFROMMERCHANT', 'TRF', 'CCTI', 'SLEV', 'BEPSPYPA', 'PISPID');

-----------------------------------------------------------------------------------------------------------------------------
-- Table: BCP_SPI.MX_PAIN001

-- DROP TABLE IF EXISTS "BCP_SPI"."MX_PAIN001";

CREATE TABLE IF NOT EXISTS "BCP_SPI"."MX_PAIN001"
(
    "ID" character varying(140) COLLATE pg_catalog."default" NOT NULL,
    "ID_MENSAJE" character varying(35) COLLATE pg_catalog."default",
    "FECHA_CREACION_MX" timestamp without time zone,
    "ID_INSTRUCCION" character varying(35) COLLATE pg_catalog."default",
    "MONEDA" character varying(3) COLLATE pg_catalog."default",
    "MONTO" numeric(18,2),
    "FECHA_LIQUIDACION_MX" timestamp without time zone,
    "REMITENTE_NOMBRE" character varying(150) COLLATE pg_catalog."default",
    "REMITENTE_DOCUMENTO" character varying(35) COLLATE pg_catalog."default",
    "REMITENTE_TIPO_DOCUMENTO" character varying(35) COLLATE pg_catalog."default",
    "REMITENTE_CUENTA" character varying(35) COLLATE pg_catalog."default",
    "REMITENTE_BIC_AGENTE" character varying(35) COLLATE pg_catalog."default",
    "REMITENTE_CUENTA_SPI" character varying(35) COLLATE pg_catalog."default",
    "BENEFICIARIO_BIC_AGENTE" character varying(35) COLLATE pg_catalog."default",
    "BENEFICIARIO_CUENTA_SPI" character varying(35) COLLATE pg_catalog."default",
    "BENEFICIARIO_NOMBRE" character varying(150) COLLATE pg_catalog."default",
    "BENEFICIARIO_DOCUMENTO" character varying(35) COLLATE pg_catalog."default",
    "BENEFICIARIO_TIPO_DOCUMENTO" character varying(35) COLLATE pg_catalog."default",
    "BENEFICIARIO_CUENTA" character varying(35) COLLATE pg_catalog."default",
    "MOTIVO" character varying(3) COLLATE pg_catalog."default",
    "INFORMACION_REGULATORIA" character varying(255) COLLATE pg_catalog."default",
    "INFORMACION_ENVIO" character varying(255) COLLATE pg_catalog."default",
    "ESTADO" character varying(35) COLLATE pg_catalog."default",
    "CODIGO_ESTADO" character varying(35) COLLATE pg_catalog."default",
    "DESCRIPCION_ESTADO_RJCT" character varying(1000) COLLATE pg_catalog."default",
    "DESCRIPCION_ERROR" character varying(255) COLLATE pg_catalog."default",
    "CREATED_AT" timestamp without time zone,
    "UPDATED_AT" timestamp without time zone,
    "DOCUMENT" text COLLATE pg_catalog."default",
    "ID_CONFIGURACION" integer,
    "ID_BEPSA" character varying(35) COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS "BCP_SPI"."MX_PAIN001"
    OWNER to "SPI_MS";

-----------------------------------------------------------------------------------------------------------------------------
-- Table: BCP_SPI.MX_PAIN002

-- DROP TABLE IF EXISTS "BCP_SPI"."MX_PAIN002";

CREATE TABLE IF NOT EXISTS "BCP_SPI"."MX_PAIN002"
(
    "ID" character varying(140) COLLATE pg_catalog."default" NOT NULL,
    "INSTRUCCION_PAGO_ID" character varying(35) COLLATE pg_catalog."default" NOT NULL,
    "ESTADO_SPI" character varying(35) COLLATE pg_catalog."default" NOT NULL,
    "COD_DENEGA_TRANSF" character varying(35) COLLATE pg_catalog."default",
    "MOTIVO_DENEGADO" text[] COLLATE pg_catalog."default",
    "INFOR_PAGO_ID" character varying(35) COLLATE pg_catalog."default" NOT NULL,
    "INSTRUMENTO_LOCAL" character varying(35) COLLATE pg_catalog."default" NOT NULL,
    "ID_EXTREMO" character varying(35) COLLATE pg_catalog."default" NOT NULL,
    "METODO_PAGO" integer NOT NULL,
    "MONEDA" character varying(3) COLLATE pg_catalog."default" NOT NULL,
    "MONTO" numeric NOT NULL,
    "ORIGEN_IDMENSAJE" character varying(35) COLLATE pg_catalog."default" NOT NULL,
    "TIPO_MENSAJE" character varying(35) COLLATE pg_catalog."default" NOT NULL,
    "FECHA_CREACION_ORIGINAL" timestamp with time zone NOT NULL,
    "ESTADO" character varying(35) COLLATE pg_catalog."default" NOT NULL,
    "ID_MENSAJE" character varying(35) COLLATE pg_catalog."default" NOT NULL,
    "FECHA_CREACION" timestamp with time zone NOT NULL,
    "ANYBIC_BCP" character varying(35) COLLATE pg_catalog."default" NOT NULL,
    "ID_MIEMBRO" character varying(35) COLLATE pg_catalog."default" NOT NULL,
    "FECHA_TRANSACCION" timestamp with time zone,
    CONSTRAINT "PK_PAIN.002" PRIMARY KEY ("ID")
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS "BCP_SPI"."MX_PAIN002"
    OWNER to "SPI_MS";

-----------------------------------------------------------------------------------------------------------------------------
-- Table: BCP_SPI.MX_REPORTES

-- DROP TABLE IF EXISTS "BCP_SPI"."MX_REPORTES";

CREATE TABLE IF NOT EXISTS "BCP_SPI"."MX_REPORTES"
(
    "ID" character varying(36) COLLATE pg_catalog."default" NOT NULL,
    "REPORT_ID" numeric,
    "REPORT_TYPE" character varying(50) COLLATE pg_catalog."default",
    "DOCUMENT_TYPE" character varying(50) COLLATE pg_catalog."default",
    "STATUS" character varying(50) COLLATE pg_catalog."default",
    "REQUEST" text COLLATE pg_catalog."default",
    "RESPONSE" text COLLATE pg_catalog."default",
    "ARCHIVO" bytea,
    "ESTADO_RPT" character varying(50) COLLATE pg_catalog."default",
    "CREATED_AT" timestamp with time zone,
    "UPDATED_AT" timestamp with time zone,
    "SESSION_ID" character varying COLLATE pg_catalog."default",
    CONSTRAINT "MX_REPORTES_pkey" PRIMARY KEY ("ID")
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS "BCP_SPI"."MX_REPORTES"
    OWNER to "SPI_MS";

-----------------------------------------------------------------------------------------------------------------------------
-- Table: BCP_SPI.MX_SEGUIMIENTO

-- DROP TABLE IF EXISTS "BCP_SPI"."MX_SEGUIMIENTO";

CREATE TABLE IF NOT EXISTS "BCP_SPI"."MX_SEGUIMIENTO"
(
    "ID_SEGUIMIENTO" character varying(36) COLLATE pg_catalog."default" NOT NULL,
    "ID_MENSAJE" character varying(100) COLLATE pg_catalog."default",
    "ID_REFERENCIA" character varying(100) COLLATE pg_catalog."default",
    "TIPO" character varying(30) COLLATE pg_catalog."default",
    "BIC_ENVIO" character varying(15) COLLATE pg_catalog."default",
    "BIC_RECEPTOR" character varying(15) COLLATE pg_catalog."default",
    "ORIGEN" character varying(10) COLLATE pg_catalog."default",
    "FECHA_OPERACION" timestamp without time zone,
    "DOCUMENT" text COLLATE pg_catalog."default",
    CONSTRAINT "MX_SEGUIMIENTO_pkey" PRIMARY KEY ("ID_SEGUIMIENTO")
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS "BCP_SPI"."MX_SEGUIMIENTO"
    OWNER to "SPI_MS";

-- SEQUENCE: BCP_SPI.SEC_MESSAGEID_SPI

-- DROP SEQUENCE IF EXISTS "BCP_SPI"."SEC_MESSAGEID_SPI";

CREATE SEQUENCE IF NOT EXISTS "BCP_SPI"."SEC_MESSAGEID_SPI"
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 999999999999999999
    CACHE 1;

ALTER SEQUENCE "BCP_SPI"."SEC_MESSAGEID_SPI"
    OWNER TO "SPI_MS";

-----------------------------------------------------------------------------------------------------------------------------
-- Table: BCP_SPI.TOKEN_SPI

-- DROP TABLE IF EXISTS "BCP_SPI"."TOKEN_SPI";

CREATE TABLE IF NOT EXISTS "BCP_SPI"."TOKEN_SPI"
(
    "ID_TOKEN" character varying(4000) COLLATE pg_catalog."default" NOT NULL,
    "ACCESS_TOKEN" character varying(4000) COLLATE pg_catalog."default",
    "TOKEN_TYPE" character varying(50) COLLATE pg_catalog."default",
    "EXPIRES_IN" numeric,
    "REFRESH_TOKEN" character varying(4000) COLLATE pg_catalog."default",
    "REFRESH_EXPIRES_IN" numeric,
    "FECHA_HORA_INSERT" timestamp with time zone
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS "BCP_SPI"."TOKEN_SPI"
    OWNER to "SPI_MS";

-----------------------------------------------------------------------------------------------------------------------------
-- SEQUENCE: BCP_SPI.SEC_MESSAGEID_CAS

-- DROP SEQUENCE IF EXISTS "BCP_SPI"."SEC_MESSAGEID_CAS";

CREATE SEQUENCE IF NOT EXISTS "BCP_SPI"."SEC_MESSAGEID_CAS"
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 999999999999999999
    CACHE 1;

ALTER SEQUENCE "BCP_SPI"."SEC_MESSAGEID_CAS"
    OWNER TO "SPI_MS";

SELECT current_timestamp;

--3327e8ec-37b1-4c8d-ad4c-77f5fc0c0afa,,,0,,0,2023-09-13 18:49:13.548205 +00:00
SELECT * FROM "BCP_SPI"."TOKEN_SPI" TS;

SELECT * FROM "BCP_SPI"."MX_SEGUIMIENTO" MS;
SELECT * FROM "BCP_SPI"."MX_PAIN001" M --WHERE "ESTADO" ='ACSP'
ORDER BY M."CREATED_AT" DESC;

SELECT * FROM "BCP_SPI"."MX_PAIN002" P ORDER BY P."FECHA_CREACION_ORIGINAL" DESC;
SELECT * FROM "BCP_SPI"."MX_SEGUIMIENTO" MS ORDER BY "FECHA_OPERACION" DESC;
