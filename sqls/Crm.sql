SELECT t.*, CTID
FROM "crm-bepsa"."UserIdentity" t WHERE "Email"='pgaleano@bepsa.com.py';

SELECT
 ui."UserName" ,
 gip."PermissionCode"
FROM  "crm-bepsa"."GroupIdentity" AS gi
INNER JOIN  "crm-bepsa"."GroupIdentityPermissions" AS gip ON  gi."Id" = gip."GroupIdentityId"
INNER JOIN
 "crm-bepsa"."GroupIdentityUserIdentity" AS giui ON  giui."RolesId" = gi."Id"
INNER JOIN  "crm-bepsa"."UserIdentity" AS ui ON  ui."Id"  = giui."UsersId"
WHERE
 ui."Email"  = 'pgaleano@bepsa.com.py';
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

select *
from "crm-bepsa"."GroupIdentityPermissions" gip where gip."GroupIdentityId" = '85369bc0-b41d-4b0d-ad49-38310fe64345';

SELECT * FROM "crm-bepsa"."System-Configuration";

SELECT * FROM "crm-bepsa"."Settings";
--delete from "crm-bepsa"."GroupIdentityUserIdentity";

SELECT * FROM "crm-bepsa"."CaseStatus";

INSERT INTO "crm-bepsa"."ResolutionAreas" ("Id", "Name", "Email", "CreatedAt", "UpdatedAt", "IsActive", "IsDefaultWelcomeKit", "IsDefaultReels", "IsDefaultMaterials", "IsDefaultSupplies", "IsDefaultTechnicalSupport")
VALUES (3, 'BACK OFFICE', 'devops@bepsa.com.py', '2024-10-10 09:57:18.211', '2025-01-23 11:36:50.757595', TRUE, FALSE, FALSE, FALSE, FALSE, FALSE),
       (22, 'RCI E-COMMERCE', '', '2024-11-06 15:39:44.01405', '2024-11-06 15:40:16.492333', TRUE, FALSE, FALSE, FALSE, FALSE, FALSE),
       (15, 'MARKETING', 'marketing@bepsa.com.py', '2024-10-10 09:57:18.211', '2025-01-23 11:36:50.766481', TRUE, TRUE, FALSE, TRUE, FALSE, FALSE),
       (5, 'RCI - CENTRAL', '', '2024-10-10 09:57:18.211', '2024-12-13 11:11:35.726858', TRUE, FALSE, FALSE, FALSE, FALSE, FALSE),
       (7, 'RCI - CORPORATIVO', '', '2024-10-10 09:57:18.211', '2024-12-13 11:14:14.717448', TRUE, FALSE, FALSE, FALSE, FALSE, FALSE),
       (8, 'POST VENTA CUENTA CORPORATIVA', '', '2024-10-10 09:57:18.211', NULL, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE),
       (6, 'RCI - INTERIOR', '', '2024-10-10 09:57:18.211', '2025-01-20 09:26:59.454604', TRUE, FALSE, FALSE, FALSE, FALSE, FALSE),
       (2, 'GESTION COMERCIAL', 'gestioncomercial@bepsa.com.py', '2024-10-10 09:57:18.211', '2025-01-20 09:51:50.979005', TRUE, FALSE, FALSE, FALSE, FALSE, FALSE),
       (12, 'TESORERIA', 'tesoreria@bepsa.com.py', '2024-10-10 09:57:18.211', '2024-10-30 10:18:26.127962', TRUE, FALSE, FALSE, FALSE, FALSE, FALSE),
       (24, 'PROVEEDOR EXTERNO', '', '2025-01-06 15:17:36.68', '2025-01-20 11:08:04.053451', TRUE, FALSE, TRUE, FALSE, FALSE, FALSE);
INSERT INTO "crm-bepsa"."ResolutionAreas" ("Id", "Name", "Email", "CreatedAt", "UpdatedAt", "IsActive", "IsDefaultWelcomeKit", "IsDefaultReels", "IsDefaultMaterials", "IsDefaultSupplies", "IsDefaultTechnicalSupport")
VALUES (4, 'COBRANZA', 'cobranzas@bepsa.com.py', '2024-10-10 09:57:18.211', '2024-10-30 10:08:14.479973', TRUE, FALSE, FALSE, FALSE, FALSE, FALSE),
       (9, 'CONTABILIDAD', 'contabilidad@bepsa.com.py', '2024-10-10 09:57:18.211', '2024-10-30 10:11:16.889424', TRUE, FALSE, FALSE, FALSE, FALSE, FALSE),
       (10, 'CONTRACARGOS', 'reclamos@bepsa.com.py', '2024-10-10 09:57:18.211', '2024-10-30 10:14:18.472137', TRUE, FALSE, FALSE, FALSE, FALSE, FALSE),
       (14, 'INPUT', 'input@bepsa.com.py', '2024-10-10 09:57:18.211', '2024-10-30 10:20:11.465898', TRUE, FALSE, FALSE, FALSE, FALSE, FALSE),
       (16, 'OPERACIONES', 'control_ope@bepsa.com.py', '2024-10-10 09:57:18.211', '2024-10-30 10:33:16.136332', TRUE, FALSE, FALSE, FALSE, FALSE, FALSE),
       (17, 'PRODUCTOS', 'productos@bepsa.com.py', '2024-10-10 09:57:18.211', '2024-10-30 10:35:07.240179', TRUE, FALSE, FALSE, FALSE, FALSE, FALSE),
       (18, 'SAE', 'sae@bepsa.com.py', '2024-10-10 09:57:18.211', '2024-10-30 10:36:25.220958', TRUE, FALSE, FALSE, FALSE, FALSE, FALSE),
       (19, 'ENTIDADES', 'entidades@bepsa.com.py', '2024-10-10 09:57:18.211', '2024-10-30 10:37:39.877571', TRUE, FALSE, FALSE, FALSE, FALSE, FALSE),
       (20, 'SEGURIDAD', 'seguridad@bepsa.com.py', '2024-10-10 09:57:18.211', '2024-10-30 10:39:02.513568', TRUE, FALSE, FALSE, FALSE, FALSE, FALSE),
       (21, 'RIESGO', 'riesgo@bepsa.com.py', '2024-10-10 09:57:18.211', '2024-10-30 10:40:57.490933', TRUE, FALSE, FALSE, FALSE, FALSE, FALSE);
INSERT INTO "crm-bepsa"."ResolutionAreas" ("Id", "Name", "Email", "CreatedAt", "UpdatedAt", "IsActive", "IsDefaultWelcomeKit", "IsDefaultReels", "IsDefaultMaterials", "IsDefaultSupplies", "IsDefaultTechnicalSupport")
VALUES (1, 'CAC', 'cac@bepsa.com.py', '2024-10-10 09:57:18.211', '2025-01-20 11:56:59.313026', TRUE, FALSE, FALSE, FALSE, FALSE, FALSE),
       (11, 'FACTURACION', 'facturacion@bepsa.com.py', '2024-10-10 09:57:18.211', '2024-10-30 10:15:57.08176', TRUE, FALSE, FALSE, FALSE, TRUE, FALSE),
       (23, 'SOPORTE TECNICO', 'tecnicos@bepsa.com.py', '2025-01-06 15:17:36.680446', '2025-01-15 11:54:34.890603', TRUE, FALSE, FALSE, FALSE, FALSE, TRUE);

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
where ui."Email" = 'sbenitez@bepsa.com.py';

--'d89b1b43-0a32-46a9-8480-a7294ef4be83';
select *
from "crm-bepsa"."GroupIdentityUserIdentity" giui
where giui."UsersId" = 'b3d3f077-a11f-434a-8b67-a214ab32d139';

select *
from "crm-bepsa"."Users" u
where u."IdentityId" = 'b3d3f077-a11f-434a-8b67-a214ab32d139';


---ver usuarios activos:
SELECT ui."UserName", STRING_AGG(gi."Name", ', ') AS "Groups"
FROM "crm-bepsa"."UserIdentity" ui
JOIN "crm-bepsa"."GroupIdentityUserIdentity" giui ON ui."Id" = giui."UsersId"
JOIN "crm-bepsa"."GroupIdentity" gi ON giui."RolesId" = gi."Id"
WHERE ui."Enabled" = true
AND ui."UserName" NOT LIKE '%@clt%'
GROUP BY ui."UserName"
ORDER BY ui."UserName";
-----------------------------
--lista de tipificaciones por tipo (COMERCIO/ ENTIDAD)
SELECT CTP."Name" AS "CaseTypeName",
       CS."Name"  AS "CaseSubtypeName",
       CT."Name"
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


insert into "crm-bepsa"."GroupIdentityPermissions"
select gi."Id" , 'CAN_EXPORT_ORDERS' as "PermissionCode"
from "crm-bepsa"."GroupIdentity" gi
on conflict do nothing;


update "crm-bepsa"."Settings"
set "Value" = 'https://app.powerbi.com/links/_syq3X2Tsc?ctid=1ddf848f-0d03-499e-b9a3-ea636b84a351&pbi_source=linkShare'
where "Key" = '19';

insert into "crm-bepsa"."Settings"
("Key", "Value")
values('19', 'https://app.powerbi.com/groups/76e0bb1b-34e3-4bf4-91d7-189592dbbc38/reports/fc9ff715-281d-4276-8cf1-b771190bff0d/85d9225ef8c246336fbd?experience=power-bi')


INSERT INTO  "crm-bepsa"."GroupIdentityPermissions"
SELECT gi."Id" AS  "GroupIdentityId", 'CAN_UPDATE_CLOSED_CASES' AS "PermissionCode"
FROM "crm-bepsa"."GroupIdentity" AS gi WHERE gi."Name" = 'crm admin' ON CONFLICT DO NOTHING ;


-------------------------------------------------- Tabla Settings--------------------------------------------------------------
SELECT
 gi."Name" , ui."FirtName" , ui."LastName"
FROM
 "crm-bepsa"."GroupIdentityUserIdentity" AS giui
INNER JOIN  "crm-bepsa"."GroupIdentity" AS gi ON giui."RolesId" = gi."Id"
INNER JOIN  "crm-bepsa"."UserIdentity" AS ui ON giui."UsersId" = ui."Id"
WHERE  ui."Email"  = 'sbenitez@bepsa.com.py' ;


SELECT * FROM
 "crm-bepsa"."GroupIdentityUserIdentity" AS giui WHERE "UsersId" ='b3d3f077-a11f-434a-8b67-a214ab32d139'

---crmadmin= dc6952db-9936-45b4-a80c-8e86cfde1f10
