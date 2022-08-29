/** Crear el modelo en una base de datos llamada biblioteca, considerando las tablas definidas y sus atributos. **/


--Desde SQL postgres
-- tras ingresar con los datos de acceso y mi usuario "rude" se usan los siquientes comandos
DROP DATABASE biblioteca;
CREATE DATABASE biblioteca;

--\c biblioteca;
--\q
/**
-- Proceso de Exportación de la base de datos entregada 
--Entrando con SO windows
--Abro CMD con administrador
cd C:\Program Files\PostgreSQL\14\bin
--entramos a :
C:\Program Files\PostgreSQL\14\bin> 

--copie mi archivo sql a exportar en la raiz de "c:biblioteca.sql"

--Ejemplo : psql -U (usuario) -W -h (servidor) (nombre_BD creada previamente) <  (ruta con diagonales "/")
psql -U rude -W -h localhost biblioteca < C:/biblioteca.sql

exit
**/


-- desde SQL postgres
/**contenido de c:biblioteca.sql 
********************************************************************************************
**/

-- -----------------------------------------------------
-- Table socios
-- -----------------------------------------------------
CREATE TABLE socios (
  idsocios INT NOT NULL,
  rut character varying(13) NOT NULL,
  nombre character varying(30) NOT NULL,
  apellido character varying(30) NOT NULL,
  direccion character varying(150) NOT NULL,
  telefono character varying(20) NOT NULL,
  PRIMARY KEY (idsocios))
;


-- -----------------------------------------------------
-- Table autor
-- -----------------------------------------------------
CREATE TABLE autor (
  id_autor INT NOT NULL,
  nombre character varying(30) NOT NULL,
  apellido character varying(30) NOT NULL,
  fecha_nac DATE NOT NULL,
  fecha_mue DATE NULL,
  PRIMARY KEY (id_autor))
;


-- -----------------------------------------------------
-- Table libros
-- -----------------------------------------------------
CREATE TABLE libros (
  id_libro INT NOT NULL ,
  isbn character varying(15) NOT NULL,
  titulo character varying(100) NOT NULL,
  pag INT NOT NULL,
  id_autor INT NOT NULL,
  id_coautor INT NULL ,
  PRIMARY KEY (id_libro),
  CONSTRAINT principal
    FOREIGN KEY (id_autor)
    REFERENCES autor (id_autor)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT coautor
    FOREIGN KEY (id_autor)
    REFERENCES autor (id_autor)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table prestamo
-- -----------------------------------------------------
CREATE TABLE prestamo (
  idprestamo INT NOT NULL,
  id_socio INT NOT NULL,
  id_libro INT NOT NULL,
  fecha_pres DATE NOT NULL,
  fecha_dev DATE NULL,      
  PRIMARY KEY (idprestamo),
  CONSTRAINT id_socio
    FOREIGN KEY (id_socio)
    REFERENCES socios (idsocios)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT id_libro
    FOREIGN KEY (id_libro)
    REFERENCES libros (id_libro)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;



/** 2. Se deben insertar los registros en las tablas correspondientes **/

-- -----------------------------------------------------
-- Data for table autor
-- -----------------------------------------------------

INSERT INTO autor (id_autor, nombre, apellido, fecha_nac, fecha_mue) VALUES (1, 'ANDRÉS', 'ULLOA', '1982-01-01', NULL);
INSERT INTO autor (id_autor, nombre, apellido, fecha_nac, fecha_mue) VALUES (2, 'SERGIO', 'MARDONES', '1950-01-01', '2012-01-01');
INSERT INTO autor (id_autor, nombre, apellido, fecha_nac, fecha_mue) VALUES (3, 'JOSE', 'SALGADO', '1968-01-01', '2020-01-01');
INSERT INTO autor (id_autor, nombre, apellido, fecha_nac, fecha_mue) VALUES (4, 'ANA', 'SALGADO', '1972-01-01', NULL);
INSERT INTO autor (id_autor, nombre, apellido, fecha_nac, fecha_mue) VALUES (5, 'MARTIN', 'PORTA', '1976-01-01', NULL);

-- -----------------------------------------------------
-- Data for table libros
-- -----------------------------------------------------

INSERT INTO libros (id_libro, isbn, titulo, pag, id_autor, id_coautor) VALUES (1, '111-1111111-111', 'CUENTOS DE TERROR', 344, 3, 4);
INSERT INTO libros (id_libro, isbn, titulo, pag, id_autor, id_coautor) VALUES (2, '222-2222222-222', 'POESÍAS CONTEMPORANEAS', 167, 1, NULL);
INSERT INTO libros (id_libro, isbn, titulo, pag, id_autor, id_coautor) VALUES (3, '333-3333333-333', 'HISTORIA DE ASIA', 511, 2, NULL);
INSERT INTO libros (id_libro, isbn, titulo, pag, id_autor, id_coautor) VALUES (4, '444-4444444-444', 'MANUAL DE MECÁNICA', 298, 5, NULL);


-- -----------------------------------------------------
-- Data for table socios
-- -----------------------------------------------------


INSERT INTO socios (idsocios, rut, nombre, apellido, direccion, telefono) VALUES (1, '1111111-1', 'JUAN', 'SOTO', 'AVENIDA 1, SANTIAGO', '911111111');
INSERT INTO socios (idsocios, rut, nombre, apellido, direccion, telefono) VALUES (2, '2222222-2', 'ANA', 'PÉREZ', 'PASAJE 2, SANTIAGO', '922222222');
INSERT INTO socios (idsocios, rut, nombre, apellido, direccion, telefono) VALUES (3, '3333333-3', 'SANDRA', 'AGUILAR', 'AVENIDA 2, SANTIAGO', '933333333');
INSERT INTO socios (idsocios, rut, nombre, apellido, direccion, telefono) VALUES (4, '4444444-4', 'ESTEBAN', 'JEREZ', 'AVENIDA 3, SANTIAGO', '944444444');
INSERT INTO socios (idsocios, rut, nombre, apellido, direccion, telefono) VALUES (5, '5555555-5', 'SILVANA', 'MUÑOZ', 'PASAJE 3, SANTIAGO', '955555555');

-- -----------------------------------------------------
-- Data for table prestamo
-- -----------------------------------------------------


INSERT INTO prestamo (idprestamo, id_socio, id_libro, fecha_pres, fecha_dev) VALUES (1, 1, 1, '2020-01-20', '2020-01-27');
INSERT INTO prestamo (idprestamo, id_socio, id_libro, fecha_pres, fecha_dev) VALUES (2, 5, 2, '2020-01-20', '2020-01-30');
INSERT INTO prestamo (idprestamo, id_socio, id_libro, fecha_pres, fecha_dev) VALUES (3, 3, 3, '2020-01-22', '2020-01-30');
INSERT INTO prestamo (idprestamo, id_socio, id_libro, fecha_pres, fecha_dev) VALUES (4, 4, 4, '2020-01-23', '2020-01-30');
INSERT INTO prestamo (idprestamo, id_socio, id_libro, fecha_pres, fecha_dev) VALUES (5, 2, 1, '2020-01-27', '2020-02-04');
INSERT INTO prestamo (idprestamo, id_socio, id_libro, fecha_pres, fecha_dev) VALUES (6, 1, 4, '2020-01-31', '2020-02-12');
INSERT INTO prestamo (idprestamo, id_socio, id_libro, fecha_pres, fecha_dev) VALUES (7, 3, 2, '2020-01-31', '2020-02-12');



/** Fin de contenido  de c:biblioteca.sql 
******************************************************************************************** 
**/

/** Requerimiento 2**/

-- a Mostrar todos los libros que posean menos de 300 páginas.
select * from libros where pag < 300;

-- b. Mostrar todos los autores que hayan nacido después del 01-01-1970

SELECT * FROM autor WHERE fecha_nac >= '1970-01-01';

-- c. ¿Cuál es el libro más solicitado?

SELECT DISTINCT titulo AS "Libro Mas solicitado"
FROM libros AS A 
JOIN prestamo AS B 
ON A.id_libro=B.id_libro
WHERE B.id_libro=(SELECT MAX(id_libro) FROM prestamo);


-- d. Si se cobrara una multa de $100 por cada día de atraso, mostrar cuánto debería pagar cada usuario que entregue el préstamo después de 7 días.

select a.rut , a.nombre, a.apellido , b.id_libro, ( b.fecha_dev - b.fecha_pres) AS "Días prestado" , ( b.fecha_dev - b.fecha_pres) - 7 AS "dias de atrasado" , (( b.fecha_dev - b.fecha_pres) - 7) * 100 as " $ de Multa "
from socios as a
join prestamo as b 
on b.id_socio=a.idsocios;