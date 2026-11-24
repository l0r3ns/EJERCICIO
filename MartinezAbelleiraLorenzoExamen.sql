
-- Lorenzo Martínez Abelleira
drop database if exists sistema_biblioteca;
create database sistema_biblioteca;
use sistema_biblioteca;

-- Parte A
-- 1 tabla socios
create table socios(
id_socio int unsigned auto_increment primary key,
nombre text not null,
dni char(9) unique not null,
fecha_alta date not null,
tipo_socio enum("Infantil","Adulto","Senior") not null
);

-- 2 tabla libros
create table libros(
id_libro int unsigned auto_increment primary key,
titulo varchar(75) not null,
autor varchar(100) not null,
isbn char(13) unique,
fecha_publicacion year,
estado enum("Disponible","Prestado","Extraviado") not null
);

-- 3 tabla prestamos
create table prestamos(
id_prestamo int unsigned auto_increment primary key,
id_socio int unsigned not null,
id_libro int unsigned not null ,
fecha_prestamo date not null,
fecha_devolucion date,
foreign key(id_socio) references socios(id_socio),
foreign key(id_libro) references libros(id_libro),
unique key repetir(id_socio,id_libro)
);

-- Parte B
drop user if exists'biblioteca_app'@'localhost' ;
create user 'biblioteca_app'@'localhost' identified by 'LibPass$2026';

drop role if exists 'rol_consulta';
create role 'rol_consulta';
grant select on sistema_biblioteca.* to 'rol_consulta';


drop role if exists 'rol_gestion';
create role 'rol_gestion';
grant insert, update on sistema_biblioteca.* to 'rol_gestion';


grant 'rol_consulta' to 'biblioteca_app'@'localhost';
grant 'rol_gestion' to 'biblioteca_app'@'localhost';
set default role 'rol_consulta' to 'biblioteca_app'@'localhost';


drop user if exists'biblioteca_app'@'localhost' ;
drop role if exists 'rol_consulta';
drop role if exists 'rol_gestion';