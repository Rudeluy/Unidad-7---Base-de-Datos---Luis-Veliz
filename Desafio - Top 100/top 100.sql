-- 1 creacion de BD
create database peliculas;
-- 2 Creacion de tablas y carga de datos
use database peliculas;
create table peliculas(id INT PRIMARY KEY,nom_pelicula VARCHAR(255),ano_estreno SMALLINT,director VARCHAR(255));
CREATE TABLE reparto(id INT NOT NULL, actor VARCHAR(255),FOREIGN KEY(id) REFERENCES peliculas(id));
\COPY peliculas FROM 'C:\Users\Rude\Documents\Desafio Latam\Unidad 7 - Base de Datos - Luis Veliz\Desafio - Top 100\peliculas.csv' csv header;
\COPY reparto FROM 'C:\Users\Rude\Documents\Desafio Latam\Unidad 7 - Base de Datos - Luis Veliz\Desafio - Top 100\reparto.csv' csv header;
-- 3 ID de pelicula titanic
select id from peliculas where nom_pelicula='titanic';
-- 4 Actores de ka pelicula titanic
select actor from reparto inner join peliculas on peliculas.id = reparto.id where peliculas.nom_pelicula='titanic';
-- 5 peliculas de en las que participa harrison Fort
select count(peliculas.id) as cantidad_peliculas_Harrison from peliculas inner join reparto on reparto.id = peliculas.id where reparto.actor='harrison ford';
-- 6 Peliculas estrenadas entre los años 1990 y 1999 ordenadas por titulo
select nom_pelicula,ano_estreno from peliculas where ano_estreno between 1990 and 1999 order by nom_pelicula asc; 
-- 7 titulos de peliculas y su longitud (nombrada)
select nom_pelicula, length(peliculas.nom_pelicula) as longitud_titulo from peliculas;
-- 8 Consultar cual es la longitud más grande entre todos los titulos de las peliculas
select nom_pelicula, length(nom_pelicula) from peliculas where length(nom_pelicula)=(select max(length(nom_pelicula)) from peliculas);