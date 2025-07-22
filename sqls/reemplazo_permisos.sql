 select p.id from permisos p where descripcion = 'Acceso pantalla Dinelco Link';
 select p.id from permisos p where descripcion = 'Acceso pantalla Pagos Digitales clientes';

 select p.id from permisos p where descripcion = 'Acceso a Pantalla de Dinelco Link Clientes';
 select p.id from permisos p where descripcion = 'Acceso a Gestion de Clientes';
 select p.id from permisos p where descripcion = 'Acceso a Ordenes de Pago';



--- paso 1: hacer backup de la tabla permisos por roles

--- paso 2: verificar los id de los permisos y cambiar en el query
--- 35: Acceso pantalla Dinelco Link
--- 32: Acceso pantalla Pagos Digitales clientes
--- 79: Acceso a Pantalla de Dinelco Link Clientes V2
--- 87: Acceso a Gestion de Clientes
--- 85: Acceso a Ordenes de Pago

--- paso 3: correr los querys y rezar a todos los santos

BEGIN;

-- Paso 0: obtener los roles que tenían permiso 35
WITH roles_con_permiso_35 AS (
  SELECT rol_id FROM permisos_x_roles WHERE permiso_id = 35
)

-- Paso 1: eliminar duplicados de permiso 79
DELETE FROM permisos_x_roles
WHERE permiso_id = 79
  AND rol_id IN (SELECT rol_id FROM roles_con_permiso_35);

-- Paso 2: actualizar permiso 35 a 79
UPDATE permisos_x_roles
SET permiso_id = 79
WHERE permiso_id = 35;

-- Paso 3: insertar permiso 87 si no lo tienen
INSERT INTO permisos_x_roles (
  permiso_id, rol_id, activo, insertado_el, modificado_el
)
SELECT
  87,
  r.rol_id,
  true,
  now(),
  now()
FROM roles_con_permiso_35 r
WHERE NOT EXISTS (
  SELECT 1 FROM permisos_x_roles pxr
  WHERE pxr.rol_id = r.rol_id AND pxr.permiso_id = 87
);

-- Paso 4: insertar permiso 85 si no lo tienen
INSERT INTO permisos_x_roles (
  permiso_id, rol_id, activo, insertado_el, modificado_el
)
SELECT
  85,
  r.rol_id,
  true,
  now(),
  now()
FROM roles_con_permiso_35 r
WHERE NOT EXISTS (
  SELECT 1 FROM permisos_x_roles pxr
  WHERE pxr.rol_id = r.rol_id AND pxr.permiso_id = 85
);


 -- Paso 5: eliminar permiso 32 de todos los roles - Acceso pantalla Pagos Digitales clientes
DELETE FROM permisos_x_roles WHERE permiso_id = 32;

COMMIT;