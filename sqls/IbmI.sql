--brelac
SELECT  *--DISTINCT  WHPNAM,WHTEXT
FROM yapi.BRELACPROD WHERE /*WHLNAM='LIBDEBITO' AND WHLIB='LIBDEBITO'*/ /*AND WHOTYP !='*PGM'*/ WHfNAM LIKE '%TBDAUD%';
--------------------------------------------ver log as
SELECT * FROM TABLE(QSYS2.HISTORY_LOG_INFO()) A ;
SELECT *  FROM TABLE(QSYS2.HISTORY_LOG_INFO(CURRENT TIMESTAMP - 10 DAY)) A  ;
SELECT *  FROM TABLE(QSYS2.HISTORY_LOG_INFO(CURRENT TIMESTAMP - 1 DAY)) A WHERE FROM_USER = 'BEPSA';
SELECT * FROM TABLE(QSYS2.HISTORY_LOG_INFO('2025-07-02-13.40.00.000000', '2025-07-02-13.50.00.000000')) A
WHERE --FROM_JOB_NAME='QRWTSRVR' AND
fROM_USER = 'VISAUSR'; --AND FROM_JOB_NAME='VISAADQJ';
FROM_JOB LIKE '568321/USRRGNCON/ACTTASA'; --AND MESSAGE_ID='CPF1164';
--AND FROM_PROGRAM='VIBCNV002B';

SELECT *
FROM TABLE(QSYS2.HISTORY_LOG_INFO('2025-07-14-00.00.05.000000','2025-07-14-23.59.00.000000')) A
wHERE  SEVERITY >20;
---por mensajes
SELECT MESSAGE_ID,MESSAGE_TYPE AS MESSAGE_TYPE,SEVERITY,MESSAGE_TIMESTAMP AS TIMESTAMP,FROM_USER,FROM_JOB,
CAST(MESSAGE_TEXT AS CHAR(200) CCSID 37) AS MESSAGE_TEXT, CAST(MESSAGE_SECOND_LEVEL_TEXT AS CHAR(1000) CCSID 37) AS MESSAGE_TEXT_2
FROM TABLE(QSYS2.HISTORY_LOG_INFO('2023-02-22-05.00.00.000000','2023-02-22-06.00.00.000000')) A WHERE SEVERITY >= 30
ORDER BY ORDINAL_POSITION;
------------------------------------
--para ver subsistemas activos
SELECT * FROM QSYS2.SUBSYSTEM_INFO WHERE STATUS = 'ACTIVE';
SELECT *
    FROM TABLE ( QSYS2.ACTIVE_JOB_INFO(
                RESET_STATISTICS => 'NO',
                SUBSYSTEM_LIST_FILTER => '',
                JOB_NAME_FILTER => '*ALL',
                CURRENT_USER_LIST_FILTER => '',
                DETAILED_INFO => 'ALL' ))
    ORDER BY SUBSYSTEM, RUN_PRIORITY, JOB_NAME_SHORT, JOB_NUMBER LIMIT 100 OFFSET 0;
--descripcion de subsistemas
SELECT * FROM QSYS2.SUBSYSTEM_INFO WHERE STATUS = 'ACTIVE' OR STATUS = 'ENDING' OR STATUS = 'INACTIVE'
                                      OR STATUS = 'RESTRICTED' OR STATUS = 'STARTING';
---WRKACTJOB
SELECT * FROM TABLE(QSYS2.ACTIVE_JOB_INFO(RESET_STATISTICS=> 'NO',
        SUBSYSTEM_LIST_FILTER=>'',
        JOB_NAME_FILTER=>'*ALL',
        CURRENT_USER_LIST_FILTER=>'',
        DETAILED_INFO=>'ALL')) limit 100 offset 0;
-----FILTRAR POR TIPO MENSAJE
SELECT * FROM TABLE (QSYS2.ACTIVE_JOB_INFO( RESET_STATISTICS=> 'NO',
        SU  BSYSTEM_LIST_FILTER=>'',
        JOB_NAME_FILTER=>'*ALL',
        CURRENT_USER_LIST_FILTER=>'',
        DETAILED_INFO=>'ALL')) WHERE  upper(JOB_STATUS) LIKE 'MSGW%'  limit 100 offset 0;
---PARA VER USUARIOS
SELECT * FROM QSYS2.USER_INFO WHERE AUTHORIZATION_NAME='U99WILLIAN' GROUP_ID_NUMBER=0   limit 100 offset 0;
SELECT * FROM QSYS2.USER_INFO WHERE GROUP_ID_NUMBER=0   AND  upper(AUTHORIZATION_NAME) LIKE 'U99%' AND STATUS='*ENABLED' AND TEXT_DESCRIPTION LIKE '%NOC%' limit 100 offset 0;
----activo
SELECT a.SYSTEM_ASP_USED,a.ACTIVE_JOBS_IN_SYSTEM,b.AVERAGE_CPU_UTILIZATION
FROM QSYS2.SYSTEM_STATUS_INFO_BASIC AS a
        JOIN TABLE (QSYS2.SYSTEM_ACTIVITY_INFO()) AS b
ON 1 = 1;
--SYSROUTINEDEP == La vista SYSROUTINEDEP registra las dependencias de las rutinas..
SELECT * FROM QSYS2.SYSROUTINEDEP  WHERE OBJECT_NAME = 'TBDAUD';
--La tabla SYSVIEWDEP registra las dependencias de las vistas,
-- las tablas de funciones SQL y las tablas de consultas materializadas en otros objetos.
SELECT *
FROM QSYS2.SYSVIEWDEP  WHERE OBJECT_NAME = 'TBDAUD';
--------------------
/*cola de mensajes*/
SELECT OBJNAME,
       OBJLIB,
       OBJTEXT
    FROM TABLE (QSYS2.OBJECT_STATISTICS('*ALL','*MSGQ'));
/*cola de trabajos*/
SELECT *
    FROM QSYS2.JOB_QUEUE_INFO
    WHERE ACTIVE_JOBS IS NOT NULL;
-----------
SELECT MSG_TIME, MSGID, MSG_TYPE, CAST(MSG_TEXT AS CHAR(100) CCSID 37) AS TEXT, SEVERITY, FROM_USER, FROM_JOB, FROM_PGM
FROM QSYS2.MESSAGE_QUEUE_INFO
WHERE MSGQ_NAME = 'QSYSOPR'
ORDER BY MSG_TIME DESC;
/*mis mensajes*/
SELECT A.MESSAGE_ID,A.MESSAGE_TYPE,
       CASE
           WHEN B.MESSAGE_KEY IS NULL THEN 'NO'
           ELSE 'YES'
       END AS NEED_REPLY, A.MESSAGE_TEXT,A.SEVERITY,A.MESSAGE_TIMESTAMP,A.MESSAGE_KEY,A.ASSOCIATED_MESSAGE_KEY,A.FROM_USER,A.FROM_JOB,A.FROM_PROGRAM,
A.MESSAGE_FILE_LIBRARY,A.MESSAGE_FILE_NAME,A.MESSAGE_TOKENS,A.MESSAGE_SECOND_LEVEL_TEXT,A.MESSAGE_SUBTYPE,
       MESSAGE_QUEUE_LIBRARY_NAME AS MESSAGE_QUEUE_LIBRARY,
       MESSAGE_QUEUE_NAME
    FROM QSYS2.USER_INFO_BASIC,
       TABLE (QSYS2.MESSAGE_QUEUE_INFO(QUEUE_LIBRARY => MESSAGE_QUEUE_LIBRARY_NAME,
       QUEUE_NAME => MESSAGE_QUEUE_NAME)) AS A
       LEFT JOIN TABLE (QSYS2.MESSAGE_QUEUE_INFO(QUEUE_LIBRARY => MESSAGE_QUEUE_LIBRARY_NAME,QUEUE_NAME => MESSAGE_QUEUE_NAME,MESSAGE_FILTER => 'INQUIRY')) AS B
ON A.MESSAGE_KEY = B.MESSAGE_KEY
WHERE AUTHORIZATION_NAME = 'VISAUSR'
ORDER BY A.MESSAGE_TIMESTAMP DESC;
------------------------------------
--sintaxis de como tomar la informacion del espacio ocupado en los ifs..
--prueba con la funci?n SQL qsys2.ifs_object_statistics  Te paso un ejemplo
select path_name, object_type, data_size, object_owner, create_timestamp, access_timestamp,
       data_change_timestamp, object_change_timestamp
  from table (
      qsys2.ifs_object_statistics(
        start_path_name => '/',
        subtree_directories => 'YES',
        object_type_list => '*ALLDIR *NOQSYS'))
   where  data_size is not null and object_owner not in ('QSYS')
   order by 3 desc
   limit 10;
--Esto te devuelve los 10 directorios m?s pesados, excluyendo /qsys. Lo saqu? de los ejemplos publicados en SQL Script de ACS
--usuarios
SELECT *
       --CAST(TEXT_DESCRIPTION AS VARCHAR(50) CCSID 284) AS TEXT_DESCRIPTION,
           FROM QSYS2.USER_INFO
       -- WHERE INITIAL_PROGRAM_NAME='MNUCL000' AND INITIAL_MENU_NAME='DEBMN100'
    WHERE GROUP_ID_NUMBER = 0
AND AUTHORIZATION_NAME LIKE 'U99%' AND TEXT_DESCRIPTION LIKE '%QA%'
    --LIMIT 100    OFFSET 0;
-------------
SELECT DATA_QUEUE_LIBRARY, DATA_QUEUE_NAME , MAXIMUM_MESSAGE_LENGTH, CURRENT_MESSAGES FROM QSYS2.DATA_QUEUE_INFO WHERE DATA_QUEUE_NAME LIKE '%LOGQ%';
--con esta sentencia se puede ver todos los programas y mensajes que graba
select ordinal_position,CAST(message_data as char(200)) from table(qsys2.data_queue_entries(data_queue => 'LOGQ', data_queue_library =>'QUSRTOOLS'));
--
SELECT *
FROM QSYS2.DATA_QUEUE_INFO WHERE DATA_QUEUE_NAME LIKE '%LOGQ%';
--PARA VER SOTREDPROCEDURE
SELECT * FROM QSYS2.SYSPROCS S WHERE SPECIFIC_NAME LIKE '%%';
---VER SP O STORE PROCEDURES , PROCEDIMIENTOS CREADOS
SELECT * FROM QSYS2.SYSPROCS S where SPECIFIC_SCHEMA = 'GXTRJPGM'
AND ROUTINE_DEFINER='U99ADOLFO' AND S.ROUTINE_CREATED >= '2025-01-09 07:00:00.000000';
---triggers
SELECT *
FROM QSYS2.SYSTRIGGERS
WHERE EVENT_OBJECT_TABLE = 'TBDAUD';
    --TRIGGER_DEFINER='U99ADOLFO' AND CREATED='2025-01-09 21:02:02.000000' AND EVENT_OBJECT_SCHEMA = 'GXTRJDTA'
      AND EVENT_OBJECT_TABLE = 'TSWAUT';
--FUNCIONES
SELECT *
FROM QSYS2.SYSFUNCS WHERE ROUTINE_DEFINER='U99ADOLFO' AND ROUTINE_CREATED >='2025-01-09 11:02:02.000000'
AND ROUTINE_SCHEMA = 'GXTRJDTA';
/*para ver puertos habilitados*/
SELECT LOCAL_PORT, LOCAL_PORT_NAME, BIND_USER, IDLE_TIME
FROM QSYS2.NETSTAT_INFO
where LOCAL_ADDRESS = '0.0.0.0';
---listar fuentes
QSYS/DSPFD FILE(MASTERCARD/QMAINPGIPM) TYPE(*MBRLIST);
--ver bloqueos en el joblog
with my_spooled_files (job, file, file_number, user_data, create_timestamp) as (select job_name, spooled_file_name, file_number, user_data, create_timestamp
 from qsys2.output_queue_entries_basic where spooled_file_name = 'QPJOBLOG'
 and CREATE_TIMESTAMP > CURRENT TIMESTAMP - 48 hours order by create_timestamp desc), all_my_spooled_file_data (job, file, file_number, spool_data)
 as (select job, file, file_number, spooled_data from my_spooled_files,  table ( systools.spooled_file_data(job_name => job, spooled_file_name => file,
 spooled_file_number => file_number) ) ) select * from all_my_spooled_file_data where SUBSTR(spool_data, 1, 15) like '%CPF3203%';

with my_spooled_files (job, file, file_number, user_data, create_timestamp) as (select job_name, spooled_file_name, file_number, user_data, create_timestamp
 from qsys2.output_queue_entries_basic where spooled_file_name = 'QPJOBLOG'
 and CREATE_TIMESTAMP > CURRENT TIMESTAMP - 48 hours order by create_timestamp desc), all_my_spooled_file_data (job, file, file_number, ordinal_position, spool_data)
 as (select job, file, file_number, ordinal_position, spooled_data from my_spooled_files,  table (systools.spooled_file_data(job_name => job, spooled_file_name => file,
 spooled_file_number => file_number) ) ) select * from all_my_spooled_file_data where SUBSTR(spool_data, 1, 15) like '%CPF3203%';
----------------------------------------------------
---------------wrkjobscde
SELECT SCHEDULED_TIME HORA,  SCHEDULED_JOB_NAME NOMBRE,  USER_PROFILE_FOR_SUBMITTED_JOB USUARIO_EJEC,  COMMAND_STRING COMANDO,
DESCRIPTION,  LAST_SUCCESSFUL_SUBMISSION_JOB ULTIMA_EJEC,  LAST_ATTEMPTED_SUBMISSION_STATUS AS STATUS
FROM QSYS2.SCHEDULED_JOB_INFO SJI
    WHERE STATUS='SCHEDULED'
ORDER BY SCHEDULED_TIME ASC;
-- WRKOUTQ OUTPUT(*PRINT)
select *from OUTPUT_QUEUE_INFO;
--inidices
SELECT * FROM QSYS2.SYSINDEXES WHERE INDEX_SCHEMA='LIBDEBITO';
--INDICES
SELECT * FROM QSYS2.SYSINDEXSTAT S2 WHERE INDEX_NAME LIKE '%UTCOENC1%';
--DSPFD POR SQL
SELECT * FROM qsys2.syspartitionstat S;
---------------VER MENSAJES y quien las respondi?
SELECT A.MESSAGE_TIMESTAMP,
       A.MESSAGE_ID,
       A.FROM_JOB,
       A.MESSAGE_TEXT,
       B.MESSAGE_TIMESTAMP          AS "Reply time",
       SUBSTR(B.MESSAGE_TEXT, 1, 5) AS "Reply",
       B.FROM_USER                  AS "Reply user"
FROM TABLE(QSYS2.MESSAGE_QUEUE_INFO(
        QUEUE_LIBRARY => 'QSYS',
        QUEUE_NAME => 'QSYSOPR',
        SEVERITY_FILTER => 99)) A,
     LATERAL
     (SELECT MESSAGE_TIMESTAMP, MESSAGE_TEXT, FROM_USER
      FROM TABLE (QSYS2.MESSAGE_QUEUE_INFO(
                     QUEUE_LIBRARY => 'QSYS',
                     QUEUE_NAME => 'QSYSOPR',
                     SEVERITY_FILTER => 99))
      WHERE ASSOCIATED_MESSAGE_KEY = A.MESSAGE_KEY) B
ORDER BY MESSAGE_TIMESTAMP DESC;
---------------------trabajos preinicios activos | prestart | pre arranque
SELECT PJ.PRESTART_JOB_NAME, SUBSYSTEM_DESCRIPTION_LIBRARY, SUBSYSTEM_DESCRIPTION, USER_PROFILE, START_JOBS,
       INITIAL_JOBS, THRESHOLD, ADDITIONAL_JOBS, MAXIMUM_JOBS, STAT.*
    FROM QSYS2.PRESTART_JOB_INFO PJ,
         LATERAL ( SELECT * FROM TABLE ( QSYS2.PRESTART_JOB_STATISTICS(
 PJ.SUBSYSTEM_DESCRIPTION, PJ.PRESTART_JOB_PROGRAM_LIBRARY, PJ.PRESTART_JOB_PROGRAM ))) AS STAT
WHERE PJ.SUBSYSTEM_ACTIVE = 'YES' ORDER BY PJ.SUBSYSTEM_DESCRIPTION;
----trabajos de jvm activos
SELECT * FROM QSYS2.JVM_INFO;
------------------------------------------------------
SELECT JOB_USER, COUNT(*) CANTIDAD
FROM TABLE (QSYS2.SPOOLED_FILE_INFO
               (OUTPUT_QUEUE 'PRT01')
               GROUP BY JOB_USER);
SELECT *
    FROM QSYS2.SERVICES_INFO
    ORDER BY SERVICE_CATEGORY ASC;
SELECT USER_NAME, SUM(SIZE) AS TOTAL_SPOOL_SPACE, COUNT(*) CANTIDAD
FROM TABLE(QSYS2.OBJECT_STATISTICS('QSYS      ', '*LIB')) AS A,
     TABLE(QSYS2.OBJECT_STATISTICS(A.OBJNAME, 'OUTQ')) AS B,
     TABLE(QSYS2.OUTPUT_QUEUE_ENTRIES(A.OBJNAME, B.OBJNAME, '*NO')) AS C
WHERE USER_NAME LIKE 'MASTRUSR%'--NOT LIKE 'QCOMU%'
GROUP BY USER_NAME
ORDER BY TOTAL_SPOOL_SPACE DESC
    FETCH FIRST 30 ROWS ONLY;
--ver varios spool
SELECT JOB_NAME, OUTPUT_QUEUE_NAME, FILE_NUMBER, SPOOLED_DATA
FROM QSYS2.OUTPUT_QUEUE_ENTRIES OQE
CROSS JOIN TABLE(SYSTOOLS.SPOOLED_FILE_DATA(JOB_NAME => OQE.JOB_NAME, SPOOLED_FILE_NAME => OQE.SPOOLED_FILE_NAME, SPOOLED_FILE_NUMBER => OQE.FILE_NUMBER))
WHERE SPOOLED_FILE_NAME = 'QPJOBLOG';

SELECT * FROM  QSYS2.OBJECT_LOCK_INFO OLI;

SELECT *
FROM QSYS2.SYSROUTINES
WHERE ROUTINE_TYPE = 'PROCEDURE'
  AND ROUTINE_SCHEMA = 'GXTRJPGM' AND ROUTINE_DEFINER='U99ADOLFO' AND ROUTINE_CREATED >= '2025-01-09 07:00:00.000000';

SELECT * FROM QSYS2.AUTHORIZATION_LIST_INFO ALI WHERE ALI.SYSTEM_OBJECT_SCHEMA='GXTRJPGM'
AND ALI.OBJECT_OWNER='U99ADOLFO';
SELECT * FROM QSYS2.AUTHORITY_COLLECTION();

--go perform
select jbname, jbuser, jbnbr, min(datetime) as INICIO, max(datetime) as FIN, max(jbacpu) as MILSEG_CPU
from QSYS.qapmhdjobm group by jbname, jbuser, jbnbr order by INICIO, jbname;
-------------------------------------------------

SELECT JOURNAL_ENTRY_TYPE,
       ENTRY_TIMESTAMP,
       JOB_NAME,
       JOB_USER,
       JOB_NUMBER,
       "CURRENT_USER"                                 AS CURRENT_USER,
       SUBSTR(CAST(OBJECT AS CHAR(30)), 1, 10)        AS OBJECT_NAME,
       SUBSTR(CAST(OBJECT AS CHAR(30)), 11, 10)       AS OBJECT_LIBRARY,
       OBJECT_TYPE,
       SUBSTR(CAST(ENTRY_DATA AS CHAR(2048)), 30, 10) AS NEW_OBJECT_NAME,
       SUBSTR(CAST(ENTRY_DATA AS CHAR(2048)), 40, 10) AS NEW_OBJECT_LIBRARY
FROM TABLE ( QSYS2.DISPLAY_JOURNAL( JOURNAL_LIBRARY => 'QSYS',
               JOURNAL_NAME => 'QAUDJRN', STARTING_RECEIVER_NAME => '*CURCHAIN', JOURNAL_ENTRY_TYPES => 'DO, OM',
               STARTING_TIMESTAMP => '2023-12-25 13:00:01',
               ENDING_TIMESTAMP => '2023-12-26 23:54:00'))
WHERE OBJECT LIKE '%tmtaraf%';-- <<<< Replace 'ASCENT' with the name of the object that has been deleted/moved or renamed.

-----JOURNAL
SELECT journal_code, journal_entry_type, object, object_type, X.*
FROM TABLE (
QSYS2.Display_Journal(
  '@JOURNAL', 'QSQJRN',                       -- Journal library and name
  JOURNAL_ENTRY_TYPES => 'DL' ,                                               -- Journal entry types
    'TSGNUM   GXSEGDTA  TSGNUM   ',
  STARTING_TIMESTAMP => CURRENT TIMESTAMP - 1 HOURS  -- Time period
) ) AS x
----------------------
/*NECESITO RECUPERAR EL NOMBRE CORTE Y EL NOMBRE LARGO DE LOS PROCEDIMIENTOS ALMACENADOS, QSYS2/SYSPROCS ME INFORMA NOMBRE LARGOS,
SI HAGO UN WRKOBJPDM ME INFORMA LOS NOMBRES CORTOS, DESDE YA MUCHAS GRACIAS
 Les paso la soluci?n*/
SELECT SYSTEM_PROGRAM_SCHEMA SCHEMA, SYSTEM_PROGRAM_NAME NAME_C,
       SUBSTR(PROGRAM_NAME, 1, 40) NAME_L,
       SUBSTR(PROGRAM_TYPE, 1, 10) TYPE,
       SUBSTR(PROGRAM_OWNER, 1, 10) OWNER,
       SUBSTR(PROGRAM_CREATOR, 1, 10) CREATOR,
       PROGRAM_SCHEMA
  FROM qSys2/SysProgramstat
 WHERE SYSTEM_PROGRAM_SCHEMA = 'TOPAZMIG';
-----------------------------------------------
SELECT * FROM ADOLFOLIB.SPLFAUD
WHERE JOPGMLIB='MASTERCARD';
SELECT *
FROM ADOLFOLIB.SPLFAUD
WHERE JOESD LIKE 'D%'
  AND JOESD LIKE '%QPRINT%'
  AND JOESD LIKE '%MyJob%';
------------------------------mole jorunal
SELECT * FROM QSYS2.JOURNAL_INFO
         WHERE REMOVE_FIXED_LENGTH_DETAIL = 'YES'
             OR FIXED_LENGTH_DATA_INCLUDES_REMOTE_ADDRESS = 'NO';
----------------------------------VER QUIEN ELIMIN? COSAS
SELECT *
--entry_timestamp, user_name, qualified_job_name, program_library, program_name, object_library, object_name, object_type, entry_type, entry_type
FROM TABLE (systools.audit_journal_DO (
STARTING_TIMESTAMP => CURRENT TIMESTAMP - 2 DAY ))
WHERE  object_type in ('*PGM', '*FILE', 'DTAARA'); --AND object_library = 'MOLEDA';
----------------
SELECT * FROM TABLE(
  SYSTOOLS.AUDIT_JOURNAL_DO('QSQJRN', '@JOURNAL',
  STARTING_RECEIVER_NAME => 'JRNRCV8836',--starting-receiver-name,
  ENDING_RECEIVER_NAME => 'AUDRCV6114', --ending-receiver-name,
  STARTING_TIMESTAMP  => CURRENT TIMESTAMP - 2 DAY--starting-timestamp,
 /* ENDING_TIMESTAMP => ending-timestamp,
  USER_NAME => user-name,
  JOB => job,
  PROGRAM => program,
  STARTING_SEQUENCE => starting-sequence,
  ENDING_SEQUENCE => ending-sequence)*/
));
----------------------------------------
 SELECT * FROM QSYS2.SOFTWARE_PRODUCT_INFO;
------------------QAUDIT
cl: CPYAUDJRNE ENTTYP(DO OM LD) OUTFILE(ADOLFOLIB/QAUDIT) JRNRCV(AUDRCV5970 AUDRCV5979) ;

SELECT DOTSTP, DOJOB, DOUSER, DONBR, DOPGM, DOONAM, DOOLIB, DOPGMLIB, DOUSPF, DOPNM, Q.*
FROM ADOLFOLIB.QAUDITDO Q
WHERE DOONAM = '*N'
AND DOPNM LIKE '/BUSDATOS' ;
----------------------------------------
--Para objetos de tipo Biblioteca
SELECT JOURNAL_ENTRY_TYPE,
       ENTRY_TIMESTAMP,
       JOB_NAME,
       JOB_USER,
       JOB_NUMBER,
       "CURRENT_USER"                                 AS CURRENT_USER,
       SUBSTR(CAST(OBJECT AS CHAR(30)), 1, 10)        AS OBJECT_NAME,
       SUBSTR(CAST(OBJECT AS CHAR(30)), 11, 10)       AS OBJECT_LIBRARY,
       OBJECT_TYPE,
       SUBSTR(CAST(ENTRY_DATA AS CHAR(2048)), 30, 10) AS NEW_OBJECT_NAME,
       SUBSTR(CAST(ENTRY_DATA AS CHAR(2048)), 40, 10) AS NEW_OBJECT_LIBRARY
FROM TABLE ( QSYS2.DISPLAY_JOURNAL(
               JOURNAL_LIBRARY => '@JOURNAL',
               JOURNAL_NAME => 'QSQJRN', STARTING_RECEIVER_NAME => 'JRNRCV8836', ENDING_RECEIVER_NAME => 'JRNRCV8836')), JOURNAL_ENTRY_TYPES => 'DL, PT, PX, UP'))
        OBJECT_NAME=> 'TBBINE0P',
    OBJECT_LIBRARY=> 'LIBDEBITO',
    OBJECT_TYPE=> '*FILE'));
              -- STARTING_TIMESTAMP => '2021-08-16 13:00:01',
              -- ENDING_TIMESTAMP => '2021-08-16 13:34:00'))
WHERE OBJECT LIKE '%ASCENT%';  -- <<<< Replace 'ASCENT' with the name of the object that has been deleted/moved or renamed.
---For IFS objects
SELECT JOURNAL_ENTRY_TYPE,
       ENTRY_TIMESTAMP,
       JOB_NAME,
       JOB_USER,
       JOB_NUMBER,
       "CURRENT_USER"                                      AS CURRENT_USER,
       PATH_NAME,
       SUBSTR(CAST(ENTRY_DATA AS CHAR(12096)), 6482, 5000) AS NEW_PATH_NAME
FROM TABLE ( QSYS2.DISPLAY_JOURNAL(
               JOURNAL_LIBRARY => 'QSYS',
               JOURNAL_NAME => 'QAUDJRN', /*STARTING_RECEIVER_NAME => 'AUDRCV5970',*/ JOURNAL_ENTRY_TYPES => 'DO,OM,LD'))
              /* STARTING_TIMESTAMP => '2024-01-09 07:00:00',
               ENDING_TIMESTAMP => '2024-01-09 09:00:00'))*/
    OBJECT_NAME=> 'TBBINE0P'
    LIBRARY_NAME=> 'LIBDEBITO'
WHERE PATH_NAME LIKE '%BUS%'
   OR PATH_NAME LIKE '%bus%';  -- <<< Replace 'ASCENT' and 'ascent' with the name of the object that has been deleted/moved or renamed.
------------------------------------------------------
--Te paso un ejemplo, de f?sicos con acceso secuencial
select * from qsys2.sysfiles where native_type = 'PHYSICAL' and access_path_keyed = 'NO' ;
--si adem?s de saber la cantidad de registros, necesitas saber la Cantidad de Registros Eliminados para poder reorganizar
--lo que sea necesario, te dejo una query que me ha sido de mucha utilidad, e? resultado te da Cantidad de Registros
-- Eliminados, Porcentaje de Registros Eliminados y Cantidad de Registros Totales,
SELECT TRIM(SYSTEM_TABLE_SCHEMA)
           CONCAT '/' CONCAT
       TRIM(SYSTEM_TABLE_NAME)
           CONCAT '.' CONCAT
       TRIM(SYSTEM_TABLE_MEMBER) AS LIB_FILE_MEMBER, NUMBER_DELETED_ROWS, DATA_SIZE,
       CASE NUMBER_ROWS
           WHEN 0 THEN 100.00
           ELSE
               NUMBER_DELETED_ROWS * 100 / NUMBER_ROWS
           END                   AS PERCENT_DELETED, NUMBER_ROWS
FROM QSYS2.SYSPARTITIONSTAT
WHERE NUMBER_DELETED_ROWS > 0
ORDER BY NUMBER_DELETED_ROWS DESC;--si la ejecutas en pantalla verde cambiar algunos puntos por slash
--------------------------
SELECT
CCCNNAME,CCLIB,CCCLNFMT,CCSTATUS,CCSTRDT,CCENDDT,CCSIZE,CCSYSNAME,
CCSYSRLS,CCEXP1,CCEXP2,CCCLRID,CCJOBNM,CCUSRNM,CCJOBNBR,CCDEFN,CCCLNLVL
FROM QUSRSYS.QAPMCCCNTB;
--------------------------------
-- https://www.ibm.com/docs/en/i/7.5?topic=services-ended-job-info-table-function
-- Which job used the most temporary storage? (today or yesterday)
--Qu? trabajo utiliz? la mayor cantidad de almacenamiento temporal
select PEAK_TEMPORARY_STORAGE, MESSAGE_TIMESTAMP as job_end_time, FROM_USER, FROM_JOB, FROM_JOB_NAME, FROM_JOB_USER, FROM_JOB_NUMBER,
       JOB_INTERFACE, FROM_PROGRAM, CPU_TIME, NUMBER_OF_STEPS, JOB_END_CODE, JOB_END_DETAIL,
       SECONDARY_ENDING_CODE, SECONDARY_ENDING_CODE_DETAIL, JOB_ENTERED_SYSTEM_TIME,
       JOB_ACTIVE_TIME, TOTAL_RESPONSE_TIME, SUBSYSTEM, INTERACTIVE_TRANSACTIONS, SYNC_AUX_IO_COUNT,
       JOB_TYPE
  from table (
      SYSTOOLS.ENDED_JOB_INFO()
    )
  order by PEAK_TEMPORARY_STORAGE desc;
------------------------------------------------------------------
-- https://www.ibm.com/docs/en/i/7.5?topic=services-ended-job-info-table-function
-- Which jobs were the top 5 CPU consumers, by day, over the last week?
--Qu? trabajos fueron los 5 principales consumidores de CPU, por d?a, durante la ?ltima semana
with x as (
    select row_number() over (
             partition by date(message_timestamp)
             order by cpu_time desc nulls last
           ) as r, date(MESSAGE_TIMESTAMP) as job_end_date, CPU_TIME,
           MESSAGE_TIMESTAMP as job_ended, FROM_USER, FROM_JOB, JOB_END_CODE, JOB_END_DETAIL,
           SYNC_AUX_IO_COUNT, JOB_TYPE, PEAK_TEMPORARY_STORAGE
      from table (
          SYSTOOLS.ENDED_JOB_INFO(START_TIME => (CURRENT_DATE - 7 days))
        )
  )
  select *
    from x
    where r <= 5
    order by job_end_date, CPU_TIME desc;
--
select *
  from table (
      qsys2.job_lock_info(job_name => '*')
    )
  order by object_library, object_name, object_type;

select  substr(R.reftabschema,1,12) as P_Schema, substr(R.reftabname,1,12) as PARENT,
        substr(R.tabschema,1,12) as C_Schema, substr (R.tabname,1,12) as CHILD,
        substr(R.constname,1,12) as CONSTNAME,
        substr(LISTAGG(C.colname,', ') WITHIN GROUP (ORDER BY C.colname),1,20) as FKCOLS
from syscat.references R, syscat.keycoluse C
where
   R.constname=C.constname and
   R.tabschema=C.tabschema and
   R.tabname=C.tabname
group by R.reftabschema, R.reftabname, R.tabschema, R.tabname, R.constname;

---PUERTOS
SELECT *
FROM QSYS2.NETSTAT_INFO
WHERE LOCAL_ADDRESS LIKE '%10.254.254.250%' AND PROTOCOL = 'TCP'
  AND LOCAL_PORT IN (SELECT LOCAL_PORT FROM QSYS2.NETSTAT_INFO WHERE LOCAL_ADDRESS LIKE '%10.254.254.250%'
                    AND PROTOCOL = 'TCP' AND TCP_STATE = 'LISTEN');
----------------------
---uso de asp vs trabajos vs cpu
SELECT a.SYSTEM_ASP_USED,
       a.ACTIVE_JOBS_IN_SYSTEM,
       b.AVERAGE_CPU_UTILIZATION
FROM QSYS2.SYSTEM_STATUS_INFO_BASIC AS a
       JOIN TABLE (QSYS2.SYSTEM_ACTIVITY_INFO()) AS b ON 1 = 1;
---DATA QUEUES
SELECT DQI.DATA_QUEUE_LIBRARY, DQI.DATA_QUEUE_NAME, DQI.MAXIMUM_MESSAGE_LENGTH, DQI.CURRENT_MESSAGES
       FROM QSYS2.DATA_QUEUE_INFO DQI WHERE DATA_QUEUE_LIBRARY = 'VISA';


SELECT * FROM TABLE(QSYS2.DATA_QUEUE_ENTRIES(
           DATA_QUEUE => 'TESTDTAQ',
           DATA_QUEUE_LIBRARY => 'MYLIB')) ;

 SELECT ORDINAL_POSITION AS "POS",
         MESSAGE_DATA,
         MESSAGE_ENQUEUE_TIMESTAMP AS "ENTERED TIME"
   FROM TABLE(QSYS2.DATA_QUEUE_ENTRIES('ACFIRECQR'))
 ORDER BY ORDINAL_POSITION;

---ver si crea indices temporales
SELECT MTI_NAME "Nombre",
       QSYS2.DELIMIT_NAME(TABLE_NAME) "Nombre de tabla",
       QSYS2.DELIMIT_NAME(TABLE_SCHEMA) "Esquema de tabla",
       '' "Partición de tabla",
       FILE_NAME "Nombre de sistema de tabla",
       LIBRARY_NAME "Esquema de sistema de tabla",
       TRIM(VARCHAR_FORMAT(REFERENCE_COUNT, '999G999G999G999G999')) "Reference Count",
       KEYS "Number of Keys",
       KEY_DEFINITION "Key Definition",
       CASE STATE
           WHEN 'CREATED' THEN 'Created'
           WHEN 'CREATING' THEN 'Creating'
           WHEN 'DELETING' THEN 'Deleting'
           WHEN 'MAPPING ERROR' THEN 'Mapping error'
           WHEN 'POPULATING' THEN 'Populating'
           WHEN 'REBUILD REQUIRED' THEN 'Rebuild required'
           WHEN 'VALID' THEN 'Valid'
           ELSE CAST(STATE AS VARCHAR(20))
       END "Estado",
       TRIM(VARCHAR_FORMAT(MTI_SIZE, '999G999G999G999G999')) "Size (bytes)",
       VARCHAR_FORMAT(CREATE_TIME, 'DD/MM/YYYY HH:MI:SS AM') "Fecha de creación",
       VARCHAR_FORMAT(LAST_BUILD_START_TIME, 'DD/MM/YYYY HH:MI:SS AM') "Last Build Start Time",
       VARCHAR_FORMAT(LAST_BUILD_END_TIME, 'DD/MM/YYYY HH:MI:SS AM') "Last Build End Time",
       CASE REUSABLE
           WHEN 'YES' THEN 'Sí'
           WHEN 'NO' THEN 'No'
           ELSE CAST(REUSABLE AS VARCHAR(3))
       END "Reusable",
       CASE SPARSE
           WHEN 'YES' THEN 'Sí'
           WHEN 'NO' THEN 'No'
           ELSE CAST(SPARSE AS VARCHAR(3))
       END "Disperso",
       SPARSE_DEFINITION "Sparse Definition",
       QRO_HASH "QRO Hash",
       PLAN_IDENTIFIER "Plan Identifier",
       USER_NAME "User Name",
       QUALIFIED_JOB_NAME "Qualified Job Name",
       JOB_NAME "Nombre de trabajo",
       JOB_USER "Usuario del trabajo",
       JOB_NUMBER "Número de trabajo"
    FROM TABLE (
            QSYS2.MTI_INFO('*ALL', '*ALL')
        )
    WHERE TABLE_NAME LIKE '%TAULOV%'
    ORDER BY 1 ASC;

--WRKOBJ FOR SQL FOR LIBRARY
SELECT OBJNAME, OBJTYPE, CHANGE_TIMESTAMP, X.*
FROM TABLE (QSYS2.OBJECT_STATISTICS('LIBDEBITO','*ALL')) X
--WHERE OBJCREATED >='2025-05-30 15:30:17.000000' AND OBJDEFINER='U99ADOLFO';
WHERE OBJTEXT LIKE '%CLARO%' OBJOWNER='U99GERMANV' ;-- OBJNAME LIKE 'R274%';

--Busque todos los programas y programas de servicio en la biblioteca MYLIB. +
-- Utilice *ALLSIMPLE para devolver la lista rápidamente, omitiendo la información detallada.
SELECT * FROM TABLE (QSYS2.OBJECT_STATISTICS('MYLIB','PGM SRVPGM','*ALLSIMPLE')) X;
---fecha modificacion
SELECT ORDERNO, ROW CHANGE TIMESTAMP FOR ORDERS
   FROM ORDERS
   WHERE ORDER_DATE < CURRENT DATE - 4 WEEKS;

select table_schema , table_name from qsys2.systables where File_type = 'S';
---ver fuentes
SELECT SYSTEM_TABLE_MEMBER, SOURCE_TYPE, LAST_CHANGE_TIMESTAMP
FROM QSYS2.SYSPARTITIONSTAT
WHERE SYSTEM_TABLE_SCHEMA = 'LIBDEBITO' AND SYSTEM_TABLE_NAME = 'QRPGLESRC' AND SYSTEM_TABLE_MEMBER LIKE '%DRIVE2048%';

SELECT sys_dname, sys_tname
FROM qsys2.systables
ORDER BY sys_dname, sys_tname;

---VER LOGICOS E INDICES POR SQL
SELECT DBFLIB AS "Library",
       DBFFIL AS "File",
       DBFLDP AS "Dep file lib",
       DBFFDP AS "Dep file",
       CASE WHEN DBFTDP = 'D' THEN 'Data'
            WHEN DBFTDP = 'V' THEN 'View'
            WHEN DBFTDP = 'I' THEN 'Indirect'
            ELSE DBFTDP
       END AS "Dependency"
 FROM QSYS.QADBFDEP
WHERE DBFLIB = 'GXBDBPS' AND DBFFIL = 'TSWAUT'
ORDER BY DBFLIB,DBFFIL;

--QUERY ACTIVOS
SELECT QUALIFIED_JOB_NAME "Qualified Job Name",
       JOB_NAME "Nombre de trabajo",
       JOB_USER "Usuario del trabajo",
       JOB_NUMBER "Número de trabajo",
       '' "User Name",
       CASE QUERY_TYPE
           WHEN 'NATIVE' THEN 'Native'
           ELSE CAST(QUERY_TYPE AS VARCHAR(6))
       END "Query Type",
       CASE PSEUDO_CLOSED
           WHEN 'YES' THEN 'Sí'
           WHEN 'NO' THEN 'No'
           ELSE CAST(PSEUDO_CLOSED AS VARCHAR(3))
       END "Pseudo Closed",
       QRO_HASH "QRO Hash",
       PLAN_IDENTIFIER "Plan Identifier",
       VARCHAR_FORMAT(FULL_OPEN_TIMESTAMP, 'DD/MM/YYYY HH:MI:SS AM') "Full Open Date",
       VARCHAR_FORMAT(LAST_PSEUDO_OPEN_TIMESTAMP, 'DD/MM/YYYY HH:MI:SS AM') "Last Pseudo Open Date",
       LIBRARY_NAME "Esquema de sistema de tabla",
       FILE_NAME "Nombre de sistema de tabla",
       TRIM(VARCHAR_FORMAT(NUMBER_OF_PSEUDO_CLOSES, '999G999G999G999G999')) "Pseudo Close Count",
       TRIM(VARCHAR_FORMAT(CURRENT_ROW_COUNT, '999G999G999G999G999')) "Current Row Count",
       TRIM(VARCHAR_FORMAT(DECIMAL(CURRENT_RUNTIME, 19, 0) / 1000000, '999G999G999G999G990.999999')) "Current Runtime (sec)",
       TRIM(VARCHAR_FORMAT(CURRENT_TEMPORARY_STORAGE, '999G999G999G999G999')) "Current Temporary Storage (MB)",
       TRIM(VARCHAR_FORMAT(CURRENT_DATABASE_READS, '999G999G999G999G999')) "Current Database Reads",
       TRIM(VARCHAR_FORMAT(CURRENT_PAGE_FAULTS, '999G999G999G999G999')) "Current Page Faults",
       TRIM(VARCHAR_FORMAT(MTI_COUNT, '999G999G999G999G999')) "MTI Count",
       TRIM(VARCHAR_FORMAT(MTI_SIZE, '999G999G999G999G999')) "MTI Size (MB)",
       TRIM(VARCHAR_FORMAT(AVERAGE_ROW_COUNT, '999G999G999G999G999')) "Average Row Count",
       TRIM(VARCHAR_FORMAT(DECIMAL(AVERAGE_RUNTIME, 19, 0) / 1000000, '999G999G999G999G990.999999')) "Average Runtime (sec)",
       TRIM(VARCHAR_FORMAT(AVERAGE_TEMPORARY_STORAGE, '999G999G999G999G999')) "Average Temporary Storage (MB)",
       TRIM(VARCHAR_FORMAT(AVERAGE_DATABASE_READS, '999G999G999G999G999')) "Average Database Reads",
       TRIM(VARCHAR_FORMAT(AVERAGE_PAGE_FAULTS, '999G999G999G999G999')) "Average Page Faults"
    FROM TABLE (
            QSYS2.ACTIVE_QUERY_INFO(JOB_NAME => NULL, JOB_USER => NULL, JOB_NUMBER => NULL)
        )
    ORDER BY 1 ASC;

--WRKF y también se puede ver en la tabla de información de la base de datos y si fue creada por
--dds o sql columa NATIVE_TYPE TIPO NATIVO
/*LOGICAL = Es un archivo lógico creado por DDS o una vista o índice SQL.
PHYSICAL = Es un archivo físico o una tabla SQL.
        FILE_TYPE Tipo de archivo.
DATA =Este es un archivo de datos.
SOURCE = Este es un archivo físico de origen.
        SQL_OBJECT_TYPE	SQL_TYPE
Puede anularse = Tipo de objeto SQL.
ÍNDICE = Se trata de un índice SQL.
TABLE = Esta es una tabla SQL.
VIEW = Esta es una vista SQL.*/
 SELECT REUSE_DELETED_RECORDS, S.* FROM QSYS2.SYSFILES S WHERE SYSTEM_TABLE_NAME = 'TDGBIN' AND SYSTEM_TABLE_SCHEMA='GXTRJDTA';
--VER LOGICAL FILES
WITH BASED_ONS (LF_NAME, BASED_ON_NAMES) AS (
    SELECT TABLE_NAME, BASED_ON_FILES
      FROM QSYS2.SYSFILES
      WHERE SYSTEM_TABLE_SCHEMA = 'GXTRJDTA' AND NATIVE_TYPE = 'LOGICAL' AND SQL_OBJECT_TYPE IS NULL)
  SELECT DISTINCT LF_NAME, LIBRARY AS BASED_ON_LIBRARY, FILE AS BASED_ON_FILE
    FROM BASED_ONS, JSON_TABLE( BASED_ON_NAMES,'lax $.BASED_ON_FILES'COLUMNS(LIBRARY CHAR(10), FILE CHAR(10)))
  order by 1, 2, 3;

----para procesar sin bloqueos
CALL QSYS2.OVERRIDE_QAQQINI(1, '',  '');
CALL QSYS2.OVERRIDE_QAQQINI(2, 'ALLOW_DDL_CHANGES_WHILE_OPEN', '*YES');
---desabilitar trigger
CALL QSYS2.OVERRIDE_QAQQINI(1, '',  '');
CALL QSYS2.OVERRIDE_QAQQINI(2, 'ALLOW_DDL_CHANGES_WHILE_OPEN', '*YES');
ALTER TRIGGER GXBDBPS.INSUPD_AUT_TSWAUT ENABLE;
----habilitar trigger
CALL QSYS2.OVERRIDE_QAQQINI(1, '',  '');
CALL QSYS2.OVERRIDE_QAQQINI(2, 'ALLOW_DDL_CHANGES_WHILE_OPEN', '*YES');
ALTER TRIGGER GXBDBPS.INSUPD_AUT_TSWAUT DISABLE;


---query dsptap
SELECT RDSYSN SISTEMA, RDDEVN DRIVER, SUBSTR(RDTRL1, 5, 10 ) LIBERERIAS,
       ('20'|| CHAR(substr(RDTRL1,43, 6))) FECHA_JULIANA,  --2025035
       CHAR(DATE('20'|| CHAR(substr(RDTRL1,43, 6))), ISO) AS FORMATO_ISO,
RDLFSQ NRO_SECUENCIA
FROM LIBDEBITO.DSPTAP11 D;

-----para ver estado de tablas
SELECT TABLE_SCHEMA AS BIBLIOTECA,
       TABLE_NAME AS TABLA,
       NUMBER_ROWS AS FILAS_VALIDAS,
       NUMBER_DELETED_ROWS AS FILAS_ELIMINADAS,
       DEC(dec(DATA_SIZE) / 1073741824, 19, 2) AS SIZE_TABLA_GB,
       DEC(DEC(NUMBER_DELETED_ROWS, 19, 2) / DEC(NUMBER_ROWS + NUMBER_DELETED_ROWS, 19, 2) * 100, 19, 2)
           AS FILAS_ELIMINADAS_PORCENTAJE,
       CASE
           WHEN
               DEC(DEC(NUMBER_DELETED_ROWS, 19, 2) / DEC(NUMBER_ROWS + NUMBER_DELETED_ROWS, 19, 2) * 100, 19, 2) BETWEEN 15 AND 40
               THEN 'PLANIFIQUE DENTRO DEL AÑO EJECUTAR UN RGZPFM'
           WHEN
               DEC(DEC(NUMBER_DELETED_ROWS, 19, 2) / DEC(NUMBER_ROWS + NUMBER_DELETED_ROWS, 19, 2) * 100, 19, 2) BETWEEN 41 AND 79
               THEN 'PLANIFIQUE DENTRO DE ESTOS MESES EJECUTAR UN RGZPFM '
           WHEN
               DEC(DEC(NUMBER_DELETED_ROWS, 19, 2) / DEC(NUMBER_ROWS + NUMBER_DELETED_ROWS, 19, 2) * 100, 19, 2) > 79
               THEN 'PLANIFIQUE CUANTO ANTES EJECUTAR UN RGZPFM'
           ELSE 'TODAVIA NO HACE FALTA REORGANIZAR, YA QUE EL %ELIMINADO ES MENOR A 15'
       END AS NIVEL_AVISO_ALERTA,
       (DEC(DEC(NUMBER_DELETED_ROWS, 19, 2) / DEC(NUMBER_ROWS + NUMBER_DELETED_ROWS, 19, 2) * 100, 19, 2) *
           (DEC(dec(DATA_SIZE) / 1073741824, 19, 2)) / 100) AS GB_Recuperados_Post_RGZPFM
    FROM qsys2.syspartitionstat
    WHERE table_schema = 'LIBDEBITO'
          AND
          -- FILTRO LAS QUE TIENEN MAS DE 1000000 REGISTROS DELETEADOS
          NUMBER_DELETED_ROWS > 1000000
    ORDER BY GB_Recuperados_Post_RGZPFM DESC;
-------------ver problemas de permisos
SELECT  ENTRY_TIMESTAMP, VIOLATION_TYPE_DETAIL, USER_NAME,
  COALESCE( PATH_NAME, OBJECT_LIBRARY CONCAT '/' CONCAT OBJECT_NAME CONCAT ' ' CONCAT OBJECT_TYPE) AS OBJECT
FROM TABLE (SYSTOOLS.AUDIT_JOURNAL_AF(STARTING_TIMESTAMP => CURRENT TIMESTAMP - 1 HOURS))
ORDER BY ENTRY_TIMESTAMP DESC;

----Ver cantidad de mensaje por Dataqueue
SELECT DATA_QUEUE_LIBRARY, DATA_QUEUE_NAME, CURRENT_MESSAGES
FROM QSYS2.DATA_QUEUE_INFO
WHERE CURRENT_MESSAGES > 0  AND DATA_QUEUE_NAME <> 'ACFIRECQR'  ;

--por hora y fecha
SELECT * FROM TABLE(QSYS2.DATA_QUEUE_ENTRIES(
                    DATA_QUEUE => 'EASRCVDTQ',
                    DATA_QUEUE_LIBRARY => 'VISA'))
  ORDER BY ORDINAL_POSITION  ;
---Posiblemente no esté vaciando la cola o esté caído.
WRKMSGQ MSGQ(VISA/EASRCVDTQ)
--Ver de Incrementar la capacidad máxima de la cola temporalmente, si es necesario:
CHGMSGQ MSGQ(VISA/EASRCVDTQ) MAXLEN(9999)

