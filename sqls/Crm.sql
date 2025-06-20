SELECT t.*, CTID
FROM "crm-bepsa"."UserIdentity" t WHERE "Email"='ljara@bepsa.com.py';
--50a1ef8b-3920-430c-9a8e-819a53c1552d
SELECT
 ui."UserName" ,
 gip."PermissionCode"
FROM  "crm-bepsa"."GroupIdentity" AS gi
INNER JOIN  "crm-bepsa"."GroupIdentityPermissions" AS gip ON  gi."Id" = gip."GroupIdentityId"
INNER JOIN
 "crm-bepsa"."GroupIdentityUserIdentity" AS giui ON  giui."RolesId" = gi."Id"
INNER JOIN  "crm-bepsa"."UserIdentity" AS ui ON  ui."Id"  = giui."UsersId"
WHERE
 ui."Email"  = 'ljara@bepsa.com.py';
--grupos
SELECT  * FROM "crm-bepsa"."GroupIdentity" AS gi ;
--asignar permisos a usuarios
INSERT INTO "crm-bepsa"."GroupIdentityPermissions"
SELECT 'dc6952db-9936-45b4-a80c-8e86cfde1f10' AS "GroupId", P."Code"
FROM "crm-bepsa"."Permissions" AS P;

SELECT UI."Email", GI."Name"
FROM "crm-bepsa"."GroupIdentityUserIdentity" GIUI
         INNER JOIN "crm-bepsa"."UserIdentity" AS UI ON UI."Id" = GIUI."UsersId"
         INNER JOIN "crm-bepsa"."GroupIdentity" AS GI ON GI."Id" = GIUI."RolesId";

select * from "crm-bepsa"."GroupIdentityPermissions" gip
where gip."GroupIdentityId" = '85369bc0-b41d-4b0d-ad49-38310fe64345';

SELECT * FROM "crm-bepsa"."System-Configuration";

SELECT * FROM "crm-bepsa"."Settings";
--delete from "crm-bepsa"."GroupIdentityUserIdentity";

SELECT * FROM "crm-bepsa"."CaseStatus";

--usuarios
select * from "crm-bepsa"."Users";
---permisos - descripción
SELECT * FROM "crm-bepsa"."Permissions";

SELECT * FROM "crm-bepsa"."CaseSubtypes" AS cs ;

SELECT  *  FROM "crm-bepsa"."CaseSubtypeTypification" AS cst ;
SELECT  *  FROM "crm-bepsa"."CaseSubtypeTypification_Id_seq";
ALTER SEQUENCE "crm-bepsa"."CaseSubtypeTypification_Id_seq" RESTART 207;

SELECT * FROM "crm-bepsa"."CaseTypifications";
SELECT * FROM "crm-bepsa"."CaseTypifications_Id_seq";
ALTER SEQUENCE "crm-bepsa"."CaseTypifications_Id_seq" RESTART 192;

SELECT * FROM "crm-bepsa"."CaseTypes" ct ;
SELECT * FROM "crm-bepsa"."CaseSubtypes_Id_seq";
ALTER SEQUENCE "crm-bepsa"."CaseSubtypes_Id_seq" RESTART 25;

SELECT * FROM "crm-bepsa"."CaseTypeSubtype";
SELECT * FROM "crm-bepsa"."CaseTypeSubtype_Id_seq";

---cambiar usuarios que difieren de keycloak vs db
select ui."Id" , ui."Email" , ui.*
from "crm-bepsa"."UserIdentity" ui
where ui."Email" = 'carlos.chavez@bepsa.com.py';
----'8f7c0314-a3e9-422d-a85b-66979f60661a'
select *
from "crm-bepsa"."GroupIdentityUserIdentity" giui
where giui."UsersId" = '8f7c0314-a3e9-422d-a85b-66979f60661a';

select *
from "crm-bepsa"."Users" u
where u."IdentityId" = '8f7c0314-a3e9-422d-a85b-66979f60661a';
---ver si sincronizó bien el cmbio de grupo
SELECT
 gi."Name" AS rol
FROM  "crm-bepsa"."GroupIdentityUserIdentity" AS giui
INNER JOIN  "crm-bepsa"."GroupIdentity" gi ON giui."RolesId" = gi."Id"
WHERE  giui."UsersId" = '33c5ea20-824b-42ef-82c2-60d9960214a8'; --id user

SELECT * FROM "crm-bepsa"."GroupIdentity" gi;
--"Id" = '8be7bced-fa66-4e4b-928b-f333466416f4' AND "Name" = 'crm input'
--"Id" = 'dc6952db-9936-45b4-a80c-8e86cfde1f10' AND "Name" = 'crm admin'
SELECT * FROM "crm-bepsa"."GroupIdentityUserIdentity" WHERE  "UsersId" = '33c5ea20-824b-42ef-82c2-60d9960214a8';

---ver usuarios activos:
SELECT ui."UserName", STRING_AGG(gi."Name", ', ') AS "Groups"
FROM "crm-bepsa"."UserIdentity" ui
JOIN "crm-bepsa"."GroupIdentityUserIdentity" giui ON ui."Id" = giui."UsersId"
JOIN "crm-bepsa"."GroupIdentity" gi ON giui."RolesId" = gi."Id"
WHERE ui."Enabled" = true
--AND ui."UserName" NOT LIKE '%@clt%'
GROUP BY ui."UserName"
ORDER BY ui."UserName";
-----------------------------
--lista de tipificaciones por tipo (COMERCIO/ ENTIDAD)
SELECT CTP."Name" AS "CaseTypeName", CS."Name"  AS "CaseSubtypeName", CT."Name"
FROM "crm-bepsa"."CaseTypifications" CT
         JOIN "crm-bepsa"."CaseSubtypeTypification" CST
              ON CT."Id" = CST."CaseTypificationId"
         JOIN "crm-bepsa"."CaseSubtypes" CS
              ON CST."CaseSubtypeId" = CS."Id"
         JOIN "crm-bepsa"."CaseTypes" CTP
              ON CST."CaseTypeId" = CTP."Id"
ORDER BY CTP."Name", CS."Name", CT."Name";
-------------
select * from "crm-bepsa"."GroupIdentityPermissions" gip where "PermissionCode"  = 'CAN_ATTACH_FILE';
SELECT * FROM "crm-bepsa"."Permissions" P where "Code" = 'CAN_ATTACH_FILE';

insert into "crm-bepsa"."GroupIdentityPermissions"
select gi."Id" , 'CAN_ATTACH_FILE' as "PermissionCode"
from "crm-bepsa"."GroupIdentity" gi
on conflict do nothing;
-------------------------
select * from "crm-bepsa"."Permissions" p where "Code"  = 'CAN_EXPORT_ORDERS';

insert into "crm-bepsa"."Permissions" ("Code", "Name", "Url", "ModulesCode")
values
('CAN_EXPORT_ORDERS','Acceso para Exportar Pedidos','/','ORDERS');


update "crm-bepsa"."Settings"
set "Value" = 'https://app.powerbi.com/links/_syq3X2Tsc?ctid=1ddf848f-0d03-499e-b9a3-ea636b84a351&pbi_source=linkShare'
where "Key" = '19';

insert into "crm-bepsa"."Settings"
("Key", "Value")
values('19', 'https://app.powerbi.com/groups/76e0bb1b-34e3-4bf4-91d7-189592dbbc38/reports/fc9ff715-281d-4276-8cf1-b771190bff0d/85d9225ef8c246336fbd?experience=power-bi')

SELECT
 gi."Name" , ui."FirtName" , ui."LastName"
FROM
 "crm-bepsa"."GroupIdentityUserIdentity" AS giui
INNER JOIN  "crm-bepsa"."GroupIdentity" AS gi ON giui."RolesId" = gi."Id"
INNER JOIN  "crm-bepsa"."UserIdentity" AS ui ON giui."UsersId" = ui."Id"
WHERE  ui."Email"  = 'liz.vazquez@bepsa.com.py' ;


SELECT * FROM
 "crm-bepsa"."GroupIdentityUserIdentity" AS giui WHERE "UsersId" ='b3d3f077-a11f-434a-8b67-a214ab32d139';

---crmadmin= dc6952db-9936-45b4-a80c-8e86cfde1f10
--'06de0585-5c6a-4259-aa45-0a335ffe3513'

----imple
SELECT  * FROM  "crm-bepsa"."ClientBranches" AS cb
WHERE  cb."AttrData" ILIKE '%8100040%';

SELECT  * FROM  "crm-bepsa"."Clients" AS c WHERE  c."Name" ILIKE '%ROSS MARY BOCADITOS%' ;
SELECT  * FROM  "crm-bepsa"."ClientBranches" AS cb WHERE "CreatedAt" ISNULL;

UPDATE  "crm-bepsa"."ClientBranches" SET "CreatedAt"="UpdatedAt" WHERE "CreatedAt" ISNULL;

SELECT * FROM "crm-custom-bepsa"."crm-bepsa"."Clerks" WHERE "CreatedAt" IS NULL;
UPDATE "crm-custom-bepsa"."crm-bepsa"."Clerks" SET "CreatedAt"=now(), "UpdatedAt"=now()  WHERE "CreatedAt" IS NULL;


UPDATE "crm-bepsa"."Settings" SET  "Value" = '0 50 14 09 * ?' WHERE  "Key" = 'ClosingBillingSetup' ;

SELECT  * FROM  "crm-bepsa"."Settings" AS s WHERE  s."Key" = 'LastClosingBilling';

UPDATE
 "crm-bepsa"."Orders" SET  "Attributes" = (jsonb_set("Attributes"::jsonb, '{Status}', '"FACTURADO"', true))::TEXT
WHERE  "Id" = 164;

SELECT * FROM  "crm-bepsa"."Orders"  WHERE "Id" = 164;
---cantidad de ususarios
SELECT
    COUNT(CASE WHEN ui."Enabled" THEN 1 END) AS "Activos",
    COUNT(CASE WHEN NOT ui."Enabled" THEN 1 END) AS "Inactivos",
    COUNT(*) AS "Total"
    FROM "crm-bepsa"."UserIdentity" ui ;


select count(c.*)
from "crm-bepsa"."Cases" c ;

select o."OrderType" , count(*)
from "crm-bepsa"."Orders" o
group by o."OrderType" ;

select count(u."Id") as totalusers
from "crm-bepsa"."Users" u join "crm-bepsa"."UserIdentity" ud on u."IdentityId" = ud."Id"
where ud."Enabled" = true;

SELECT DISTINCT (U."Name")
FROM "crm-bepsa"."CaseResolutionArea"
INNER JOIN "crm-bepsa"."Users" U ON U."Id" = "CaseResolutionArea"."ByUserId"
WHERE "ByUserId" = U."Id" AND "UserId" = U."Id";

select count(u."Id") as totalusers
from "crm-bepsa"."Users" u join "crm-bepsa"."UserIdentity" ud on u."IdentityId" = ud."Id"
where ud."Enabled" = true;

SELECT  * FROM "crm-bepsa"."ClientBranches" WHERE "ClientId"=3554;

SELECT  * FROM "crm-bepsa"."CaseSubtypeTypification";

SELECT  * FROM "crm-bepsa"."Permissions";

----cierre para facturar bobinas
SELECT  * FROM  "crm-bepsa"."Settings" AS s WHERE  s."Key" ILIKE '%Closing%';
--update de horario para el mismo
UPDATE "crm-bepsa"."Settings"
SET  "Value" = '0 35 09 13 * ?'
WHERE  "Key" = 'ClosingBillingSetup' ;


