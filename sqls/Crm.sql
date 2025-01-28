SELECT t.*, CTID
FROM "crm-bepsa"."UserIdentity" t;

SELECT
 ui."UserName" ,
 gip."PermissionCode"
FROM  "crm-bepsa"."GroupIdentity" AS gi
INNER JOIN  "crm-bepsa"."GroupIdentityPermissions" AS gip ON  gi."Id" = gip."GroupIdentityId"
INNER JOIN
 "crm-bepsa"."GroupIdentityUserIdentity" AS giui ON  giui."RolesId" = gi."Id"
INNER JOIN  "crm-bepsa"."UserIdentity" AS ui ON  ui."Id"  = giui."UsersId"
WHERE
 ui."Email"  = 'delio.chamorro@bepsa.com.py';

SELECT  * FROM "crm-bepsa"."GroupIdentity" AS gi ;

INSERT INTO "crm-bepsa"."GroupIdentityPermissions"
SELECT 'dc6952db-9936-45b4-a80c-8e86cfde1f10' AS "GroupId", P."Code"
FROM "crm-bepsa"."Permissions" AS P;

SELECT UI."Email", GI."Name" FROM  "crm-bepsa"."GroupIdentityUserIdentity" giui
INNER JOIN  "crm-bepsa"."UserIdentity" AS ui ON  ui."Id"  = giui."UsersId"
INNER join "crm-bepsa"."GroupIdentity"  AS gi on gi."Id" = giui."RolesId"


select *
from "crm-bepsa"."GroupIdentityPermissions" gip
where gip."GroupIdentityId" = 'dc6952db-9936-45b4-a80c-8e86cfde1f10';

SELECT * FROM "CRM-BEPSA"."system-configuration";