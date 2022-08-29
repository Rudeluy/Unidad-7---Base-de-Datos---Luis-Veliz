/** Requerimiento 1**/


--Desde SQL postgres
-- tras ingresar con los datos de acceso y mi usuario "rude" se usan los siquientes comandos
DROP DATABASE biblioteca;
CREATE DATABASE biblioteca;

\c biblioteca;
\q
/**
-- Proceso de Exportación de la base de datos entregada 
--Entrando con SO windows
--Abro CMD con administrador
cd C:\Program Files\PostgreSQL\14\bin
--entramos a :
C:\Program Files\PostgreSQL\14\bin> 

--copie mi archivo sql a exportar en la raiz de "c:biblioteca.sql"

--Ejemplo : psql -U (usuario) -W -h (servidor) (nombre_BD creada previamente) <  
psql -U rude -W -h localhost biblioteca < C:/biblioteca.sql

exit
**/


-- desde SQL postgres