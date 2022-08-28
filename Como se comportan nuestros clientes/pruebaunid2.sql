/** Requerimiento 1**/


--Desde SQL postgres
-- tras ingresar con los datos de acceso y mi usuario "rude" se usan los siquientes comandos
DROP DATABASE unidad2;
CREATE DATABASE unidad2;

\c unidad2;
\q
/**
-- Proceso de Exportación de la base de datos entregada 
--Entrando con SO windows
--Abro CMD con administrador
cd C:\Program Files\PostgreSQL\14\bin
--entramos a :
C:\Program Files\PostgreSQL\14\bin> 

--copie mi archivo sql a exportar en la raiz de "c:unidad2.sql"

--Ejemplo : psql -U (usuario) -W -h (servidor) (nombre_BD creada previamente) <  
psql -U rude -W -h localhost unidad2 < C:/unidad2.sql

exit
**/


-- desde SQL postgres
/** Requerimiento 2**/


\c unidad2

BEGIN;
INSERT INTO compra (id, cliente_id, fecha)
VALUES (33, 1, current_date);
INSERT INTO detalle_compra (producto_id, compra_id, cantidad)
VALUES (9, 33, 4);
UPDATE producto SET stock = stock - 4
WHERE id = 9;
COMMIT;

/** Requerimiento 3**/

BEGIN;
INSERT INTO compra (cliente_id, fecha)
VALUES (2, NOW());
INSERT INTO detalle_compra (producto_id, compra_id, cantidad)
VALUES (1, (SELECT MAX(id) FROM compra), 3);
UPDATE producto SET stock = stock - 3
WHERE id = 1;
INSERT INTO detalle_compra (producto_id, compra_id, cantidad)
VALUES(2, (SELECT MAX(id) FROM compra), 3);
UPDATE producto SET stock = stock - 3
WHERE id = 2;
INSERT INTO detalle_compra (producto_id, compra_id, cantidad)
VALUES (8, (SELECT MAX(id) FROM compra), 3);
UPDATE producto SET stock = stock - 3
WHERE id = 8;
COMMIT;


/** Requerimiento 3**/
\set AUTOCOMMIT off

INSERT INTO cliente (nombre, email)
VALUES ('luis veliz', 'lveliz@gmail.com');

SELECT * FROM cliente;

ROLLBACK;

SELECT * FROM cliente;
\set AUTOCOMMIT on
\echo :AUTOCOMMIT