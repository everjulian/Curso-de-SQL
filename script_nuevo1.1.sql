 
CREATE TABLE LIBRO(
ISBN_LIBRO VARCHAR(20) primary key not null,
TITULO_LIBRO  VARCHAR(100) not null,
ANIO_LIBRO int not null,
EDITORIAL_LIBRO VARCHAR(50)not null,
OBSERVACION VARCHAR(300)  null

)

insert into LIBRO (ISBN_LIBRO,TITULO_LIBRO,ANIO_LIBRO,EDITORIAL_LIBRO,OBSERVACION) VALUES('SBN001','MATEMATICAS',2018,'EDITORIAL 001','ESTA ES UNA PRUEBA RAPIDA')
insert into LIBRO (ISBN_LIBRO,TITULO_LIBRO,ANIO_LIBRO,EDITORIAL_LIBRO) VALUES('SBN002','MATEMATICAS',2018,'EDITORIAL 001')
insert into libro  VALUES('SBN003','MATEMATICAS',2018,'EDITORIAL 001','ESTA ES UNA PRUEBA RAPIDA dos')
insert into libro  VALUES('ESTA ES UNA OBSERVACION',2018,'EDJDJD')

/* error */
insert into LIBRO (ISBN_LIBRO,ANIO_LIBRO, TITULO_LIBRO,EDITORIAL_LIBRO) VALUES('SBN002',2018,'MATEMATICAS','EDITORIAL 001')
select * from libro

update LIBRO set TITULO_LIBRO ='LENGUAJE' where   isbn_libro ='SBN002'

delete from libro 

/* sentencia para crear una base de datos*/

--create database nombredelatabla

create database cine;

/*SENTENCIA PARA CREAR TABLAS

create  table nombredelatabla_entida(
nombreatributos tipodedato not null primary key UNIQUE,
nombreatributos2 tipodedato  null ,
nombreatributos3 tipodedato not null 
)

*/

create  table papel(
id_papel int not null primary key,
nombre_papel varchar(50) not  null 
)

create  table genero(
id_genero int not null primary key,
nombre_genero varchar(50) not  null --2 drama 
)

create  table director(
id_director int not null primary key,
nombre_director varchar(100) not  null 
)

create  table clasificacion(
id_clasificacion int not null primary key,
nombre_clasificacion varchar(100)  not  null 
)

/* cuando no es obligatorio se pone null y cuando es obligatorio el campo es not null
 * obligatorio=not null
 * no obligatorio=null
 * */
create  table tarifa(
id_tarifa int not null primary key,
dia_tarifa varchar(15)  not  null,
precio_tarifa decimal not  null 
)

select * from tarifa t 

--
alter table tarifa alter column precio_tarifa type decimal 

 insert into tarifa (id_tarifa, dia_tarifa,precio_tarifa) values(3,'Jueves',6.40)


create  table cine(
NOMBRE_CINE_PK varchar(50) not null primary key,
CALLE_CINE varchar(100)  not  null,
NUMERO_CINE int not  null,
ID_TARIFA_FK int not null,
FOREIGN KEY (ID_TARIFA_FK) REFERENCES tarifa(id_tarifa)
)	


create  table personaje(
ID_PERSONAJE int not null primary key,
NOMBRE_PERSONAJE varchar(50)  not  null,
APELLIDO_PERSONAJE varchar (50) not  null,
ID_PAPEL_FK int not null,
constraint fk_papel FOREIGN KEY (ID_PAPEL_FK) REFERENCES papel(id_papel)
)	


create  table pelicula(
TITULO_PELICULA_PK VARCHAR(200) not null primary key,
ID_DIRECTOR_FK int not  null,
ID_CLASIFICACION_FK int not  null,
ID_PERSONAJE_FK int not null,
ID_GENERO_FK int not null,
constraint fk_director  FOREIGN key  (ID_DIRECTOR_FK) REFERENCES director(id_director) ON UPDATE CASCADE ON DELETE CASCADE,
constraint fk_clasifcacion FOREIGN KEY  (ID_CLASIFICACION_FK) REFERENCES clasificacion(id_clasificacion) ON UPDATE CASCADE ON DELETE CASCADE,
constraint  fk_personaje FOREIGN key  (ID_PERSONAJE_FK) REFERENCES PERSONAJE(ID_PERSONAJE) ON UPDATE CASCADE ON DELETE CASCADE,
constraint fk_genero FOREIGN KEY (ID_GENERO_FK) REFERENCES GENERO(id_genero) ON UPDATE CASCADE ON DELETE CASCADE
)	
/* para crear las tablas se debe crear primero las tablas padres y las tablas hijas*/
/* para eliminar las tablas se debe borrar primero a las tablas hijas y luego a las padres*/
-- 

--PASA(ID_PASA_PK,NOMBRE_CINE_FK,TITULO_PELICULA_FK,HORA_PASA)
create  table TRANSMITE_PELICULA(
ID_TRANSMITE int  not null primary key,
NOMBRE_CINE_FK varchar(50) not null ,
TITULO_PELICULA_FK VARCHAR(200) not  null,
constraint fk_cine  FOREIGN key  (NOMBRE_CINE_FK) REFERENCES cine(NOMBRE_CINE_PK) ON UPDATE CASCADE ON DELETE CASCADE,
constraint fk_pelicula FOREIGN KEY  (TITULO_PELICULA_FK) REFERENCES PELICULA(TITULO_PELICULA_PK) ON UPDATE CASCADE ON DELETE CASCADE
)	

/*SENTENCIA PARA A UNA A�ADIR UNA COLUMNA A UNA TABLA*/

ALTER TABLE genero add DETALLE_GENERO VARCHAR(100) null;


/*SENTENCIA PARA A UNA MODIFICAR UNA COLUMNA EN UNA TABLA*/

ALTER TABLE tarifa 
alter column  precio_tarifa type int;

/* sentencia para renombrar una columna*/
ALTER TABLE genero
 RENAME COLUMN DETALLE_GENERO TO DETALLE_GENERO_NUEVO;

/* sentencia para elimiar una columna*/
ALTER TABLE genero 
DROP column  detalle_genero


/**SENTENCIA PARA ELIMINAR UNA TABLA*/

drop table TRANSMITE_PELICULA


/*     INSERTAR DATOS EN UNA TABLA*/



insert into papel (ID_PAPEL NOMBRE_PAPEL) VALUES(1,'PRINCIPAL')
insert into papel (ID_PAPEL,NOMBRE_PAPEL) VALUES(4,'EXTRAS')
insert into papel (ID_PAPEL,NOMBRE_PAPEL) VALUES(5,'EXTRAS 2')
insert into papel VALUES(2,'PRINCIPAL')
--NO HACER POR FAVOR
insert into papel (NOMBRE_PAPEL,ID_PAPEL) VALUES('PRINCIPAL',3)
*

--MIRAR O SELECIONAR DATOS
select * from papel p 

--ACTUALIZAR DATOS DE UNA COLUMNA
--  ACTULIZAR NOMBRETABLE DONDE CAMPO QUE YO QUIERO ACTULIZAR="NUEVO NOMBRE" DONDE DEBE PONER LA CLAVE PRIMARIA QUE SE DESEA MODIFICAR
   update  papel set nombre_papel ='RELLENO' where id_papel =2
   --REALIZAR LA SENTENCIA DE ACTUALIZACION DE LA FILA CON ID=3 AL NOMBRE PAPEL QUE SE LLAME SECUNDARIO
    update  papel set nombre_papel ='SECUNDARIO' where id_papel =tres
    
   --ELIMINAR DATOS DE LA TABLA
    --SE DESEA ELIMINAR EL PAPEL QUE SE LLAMA EXTRAS 2
    
    delete from PAPEL where id_papel=5
    
 --SE DESEA ELIMINAR LA COLUMNA  PAPEL QUE tiene como id=1
   delete from PAPEL where id_papel=1

   
   -- 
   select * from tarifa t 
   
insert into tarifa (id_tarifa,dia_tarifa,precio_tarifa)values(1,'lunes',50)
insert into tarifa (id_tarifa,dia_tarifa,precio_tarifa)values(2,'Martes',1)
   
   
   
   
   select * from cine c 
  
   insert into cine(nombre_cine_pk,calle_cine,numero_cine,id_tarifa_fk) values('cine mark','no se',45,2)
   
      insert into cine(nombre_cine_pk,calle_cine,numero_cine,id_tarifa_fk) values('cine mark recrero','no se',45,1)
   
   
   
   
   
   
   
   
   
   
   
   
   /*deber*/
   
   
   

/* sentencia de creacion de tablas */
   
   /* creacion de la tabla genero*/
      
   
   creta table
   
   /* creacion de table pelicula*/
   

/* insert tabla directorr*/
   inset into
   
   
  /* insert tabla genero*/
   
   /*update*/
   
   /*** ESPECIFICACION DEL DEBER VERAN QUE YA ESTA LA CREACION SOLO TRANSCRIBIR Y ENTENDER**//
   /* de cada tabla
    * sentencia de creacion
    * a�adir columna  // maximos 2
    * modificar columna  / maximo 2
    * delete tabla //  1 ejemplo
    * insert , maximo y minino 5 datos a las columnas
    *  * insert , maximo y minino 5 datos a las columnas
    *  * insert , maximo y minino 5 datos a las columnas
    *  * insert , maximo y minino 5 datos a las columnas
    *  * insert , maximo y minino 5 datos a las columnas
    * 
    * update   // 3 ejemplos 
    * 
    * update table cine set calle_cine='no se 1' where id=2
    * update table cine set calle_cine='no se 1' where id=2
    * update table cine set calle_cine='no se 1' where id=2
    * delete // 3 ejemplos
    * 
    * delete 
    *  delete from CINE where id_cine=1
    *  delete from CINE where id_cine=1
    * delete from CINE where id_cine=1

    * 
    * 
    *     * */
   
   
   /*CREAR UNA TABLA SIN PK Y CON EL TIPO DE DATO SERIAL , QUE VA A IR INCREMENTANDO EL NNUMERO DE ID*/
   
create  table papel2(
id_papel serial  ,
nombre_papel varchar(50) not  null,
alias_papel varchar(2) unique 
)  

/* anadir la clave primaria a mi tabla en caso de que me haya olvidado de especificar que campo es la PK,*/
Alter table papel2 ADD primary key ( id_papel);

--me muestra todos los datos de mi tabla
select * from papel2


 --insertando datos a mi tabla, y probando como funciona el tipo de dato unique y serial

insert into papel2 (nombre_papel,alias_papel)values('TRES','DOS')
-- alterando el campo alias papel que sea varhcar de 10 antes estaba con varchar de 2

alter table PAPEL2 alter column  ALIAS_PAPEL  type VARCHAR(10)

)	

--constraint FK




create  table personaje2(
ID_PERSONAJE serial primary key,
CEDULA_PERSONA varchar(10) unique,
NOMBRE_PERSONAJE varchar(50)  not  null,  
APELLIDO_PERSONAJE varchar (50) not  null,
ID_PAPEL_FK int not null,
alias_personaje  varchar(100) null,
numero_personaje int check(numero_personaje>0),
direccion_personaje varchar(200) default ' SN ',
estado_civil varchar(11) default'solteros',
 constraint fk_papel2 FOREIGN KEY (ID_PAPEL_FK) REFERENCES papel2(id_papel)
)



select * from papel2 p 
select * from personaje2 p 

insert into personaje2 (cedula_persona,nombre_personaje,apellido_personaje,alias_personaje,id_papel_fk,numero_personaje)
values ('22U2224','FERNANDO','SANTOS','PRIMEROO',1,2);
insert into personaje2 (cedula_persona,nombre_personaje,apellido_personaje,id_papel_fk)
values ('22U22234','luis','SANTOS',3);
insert into personaje2 (id_personaje,cedula_persona,nombre_personaje,apellido_personaje,alias_personaje,id_papel_fk,numero_personaje)
values (5,'22U2234','FERNANDO','SANTOS','PRIMEROO',3,2)

--se desea actualizar el nombre LUIS a jose

--se desea actualizar el id de personaje jose a 3

update personaje2 set nombre_personaje='Jose' where id_personaje=2

update personaje2 set id_personaje =3 where nombre_personaje='Jose'
--se desea actualizar id a 2 del  nombre de papel secundario 
update papel2 set id_papel =2 where nombre_papel='SECUNDARIO'

--creo null, quede not null

/* sentencia para actulizar los campos que esten vacios
 **/
 UPDATE personaje2
SET alias_personaje = 'esta campo estaba vacio'
WHERE alias_personaje IS NULL;


/* sentencia para alterar el tipo de dato nul a not null*/

alter table personaje2 alter column alias_personaje  set not null  

/* segunda parte de explicacion*/
select * from cine c 
select * from clasificacion c2  
insert into clasificacion values(2,'B')

update clasificacion  set id_clasificacion=3 where nombre_clasificacion='B'
select * from pelicula p 
insert into pelicula VALUES('ZORRO',2,1,1,1)
select * from director d 
insert into director  VALUES(2,'jOSE')
select * from papel p3  
select * from transmite_pelicula tp 
select * from genero g 
insert into genero(id_genero,nombre_genero,detalle_genero_nuevo) values (1,'drama','drama 2')
insert into genero(id_genero,nombre_genero,detalle_genero_nuevo) values (2,'romance','drama 2')

select * from personaje p2  
insert into personaje (id_personaje,nombre_personaje,apellido_personaje,id_papel_fk)values(1,'Maria','Nose',3)


select titulo_pelicula_pk  as  "TITULO DE LA PELICULA" from pelicula p 

-- SE DESEA ACTULIZAR EL NOMBRE DEL DIRECTOR A JOSE DONDE EL TITULO DE LA PELICULA SE LLAME RADIO ACTIVO 
 update pelicula 
 set id_director_fk=2
 where titulo_pelicula_pk ='RADIO ACTIVO'
 
 --SE DESEA ELIMINAR LA PELICULA DONDE  QUE TENGA COMO DIRECTOR A JOSE 
 select * from pelicula p 
 delete  from PELICULA where id_director_FK=2 
 
 select * from genero g 
 -- SE desea eliminar la pelicula donde tenga como director a jose y el genero  sea romance
  delete from pelicula  where id_director_fk=2 and id_genero_fk =2 
  
 
  
   -- SE desea eliminar la pelicula donde tenga como director a jose o el genero  sea romance
  delete from pelicula  where id_director_fk=2 or id_genero_fk =2
  
  
  --SE DESEA MIRAR UN REPORTE DE LA TABLA PELICULAS DONDE EL NOMBRE DE LA PELICULA SEA MIKE
  
select * from pelicula p where titulo_pelicula_pk ='MIKE'

--SE DESEA OBTENER UN REPORTE DE LA TABLA PELICULAS DONDE EL DIRECTOR SEA JOSE Y EL GENERO SEA DRAMA 


select * from pelicula p  where id_director_fk =2 and id_genero_fk =1

--SE DESEA OBTENER UN REPORTE DE LAS PELICULAS QUE EMPIEZEN CON Z EL NOMBRE 

select  * from pelicula p  where titulo_pelicula_pk like 'Z%' --INICE CON Z Y LO DEMAS no IMPORTA %

--SE DESEA OBTENER UN REPORTE DE LAS PELICULAS QUE TERMINE CON E 

select * from pelicula p  where titulo_pelicula_pk like '%E' --FINALICE CON E Y LO DEMAS no IMPORTA %



--SE DESEA OBTENER UN REPORTE DE LAS PELICULAS DONDE EL ID DEL DIRECTOR SEA 2

select * from pelicula p  where id_director_fk =2

--SE DESEA OBTENER UN REPORTE DE LAS PELICULAS DONDE EL NOMBRE TENGA LAS LETRAS RR

select * from pelicula p  where titulo_pelicula_pk like '%RR%' --FINALICE CON E Y LO DEMAS no IMPORTA %

--SE DESEA OBSERVAR EL REPORTE DE PELICULAS EN ORDEN DESENCENDETE POR EL NOMBRE DE LA pelicula 
select * from pelicula p order by titulo_pelicula_pk desc  
select * from pelicula p order by titulo_pelicula_pk ASC  
--SE DESEA OBSERVAR EL REPORTE DE PELICULAS EN ORDEN DESENCENDETE POR ID DE id_director_fk 
select * from pelicula p order by id_director_fk ASC  


select * from pelicula p 

--

insert into pelicula (titulo_pelicula_pk,id_director_fk,id_clasificacion_fk,id_personaje_fk,id_genero_fk)
values('spiderman',3,3,3,2)



select * from director d
select * from  clasificacion c 
select * from  personaje p
select * from papel p2 

insert into  personaje VALUES(3,'Johan','Nose',2)



insert into director values(5,'Tatiana')


--actualizar datos

update director set nombre_director ='Alexandra'where id_director =3

--anadir datos a mi tabla


alter table director add observacion  varchar(100)

alter table director add column novedaes varchar(100)

select * from director d 


--
update director set observacion='Partipa en la pelicula como director' where id_director =4

--se desea poner como novedad 'que esta suspendido a todos los directores con nombres Fernanda y Jose'

update director set novedades='que esta suspendido a todos los directores con nombres Fernanda y Jose'
where nombre_director ='Fernanda' and nombre_director ='jOSE'



update director set novedades='que esta suspendido a todos los directores con nombres Fernanda y Jose'
where  id_director =2 
 update director  set  novedades='que esta suspendido a todos los directores con nombres Fernanda y Jose'
where  id_director =1


select * from director d 

 update director  set  observacion='Dirigir'
where  nombre_director ='Alexandra'

ALTER TABLE director 
 RENAME COLUMN novedaes TO novedades;
 
--se desea obtener un reporte de todos los directores que tenga el campo novedades en null


select * from director d  where novedades is null 

--se eliminar  a todos los directores que tenga el campo novedades en null

delete from director  where novedades is null

delete from director  where novedades is null
--
select p.titulo_pelicula_pk ,p.id_director_fk ,d.nombre_director, d.novedades
from pelicula p ,director d 
where p.id_director_fk =d.id_director
order by id_director_fk asc 
--

--- se desea eliminar a todas las peliculas que tengan como genero 1

select * from pelicula p  where id_genero_fk =1

update pelicula set id_clasificacion_fk =3 where  id_genero_fk =1

delete from pelicula    where id_genero_fk =1

select * from genero g 
--se desea obtener el titulo y el director de la pelicula que tenga como genero  drama

select titulo_pelicula_pk ,id_director_fk from pelicula p where id_genero_fk =1

select * from director d 
select * from pelicula p 
--permite ver el nombre del director y novededades del director 
select p.titulo_pelicula_pk ,p.id_director_fk ,d.nombre_director, d.novedades
from pelicula p ,director d 
where p.id_director_fk =d.id_director
order by id_director_fk asc 
--
----

select p.titulo_pelicula_pk ,
p.id_director_fk ,d.nombre_director,
p.id_genero_fk ,g.nombre_genero,
p.id_clasificacion_fk ,c.nombre_clasificacion,
p.id_personaje_fk p2,nombre_personaje
from pelicula p ,director d, genero g ,clasificacion c ,personaje p2 
where p.id_director_fk =d.id_director 
and p.id_genero_fk =g.id_genero 
and p.id_clasificacion_fk =c.id_clasificacion
and p.id_personaje_fk =p2.id_personaje
order by id_director_fk asc 

--presentacion


select p.titulo_pelicula_pk  as "TITULO DE LA PELICULA",
d.nombre_director as "DIRECTOR",
g.nombre_genero as "GENERO",
c.nombre_clasificacion as "CLASIFICACION",
nombre_personaje as " PERSONAJE"
from pelicula p ,director d, genero g ,clasificacion c ,personaje p2 
where p.id_director_fk =d.id_director 
and p.id_genero_fk =g.id_genero 
and p.id_clasificacion_fk =c.id_clasificacion
and p.id_personaje_fk =p2.id_personaje
order by id_director_fk asc

--

create table table1 as select * from pelicula p 

select *  from TABLE1


select * from pelicula p2

select count(*) from pelicula p 

--saber cuantas filas tiene mi tabla

select count(*) from pelicula p where id_genero_fk =2

--mimino
select min(id_director_fk) from pelicula p 
--maximo
select max(id_director_fk) from pelicula p 
 
select * from tarifa t 

alter table tarifa 
add descuento decimal

update tarifa  set descuento=5 where id_tarifa =2

update tarifa  set precio_tarifa =10 where id_tarifa =2

--sumar precio tarifa mas descuento quiero saber el total
select  sum(precio_tarifa+descuento) as "suma de valores" from tarifa t 

--se desea saber el promedio de la columna precio tarifa
select avg(precio_tarifa) from tarifa t 

select * from director d 

insert into director values(9,'Diana','Valencia') 



alter table director 
add fecha_fin date

alter table director 
rename observacion to apellido_1
--definicion de distinct
--Utilice la palabra clave DISTINCT antes de los nombres de columna en una sentencia SQL para evitar que se seleccionen filas duplicadas.

select distinct (nombre_director) from director d 

--desea saber cuantos directores donde el nombre Raul se tiene 
select  count(nombre_director) from director d where nombre_director ='Raul'


select  count(*) from director d where nombre_director ='Pepe'







select * from director d 

update director  set fecha_inicio='05-06-2022' where id_director =6

update director  set fecha_fin='2022-05-05' where id_director =6


update director  set fecha_fin='2022-02-05' where id_director =2;

update director  set fecha_inicio='2022-03-05' where id_director =2;

--se desea conocer a todos los que tengan fecha de inicio el 5 de mayo del 2022

--/*
--SELECT columna1
--FROM tabla
--WHERE columna1 BETWEEN valor1 AND valor2;
--En esta sintaxis:

    -- Primero, especificas la columna o expresi�n a probar.
  --   En segundo lugar, debes colocar valor1 y valor2 entre las palabras clave BETWEEN y AND. valor1, valor2 y la columna1 a probar deben tener el mismo tipo de datos.
--El operador BETWEEN devuelve TRUE si la expresi�n a probar es mayor o igual que el valor de valor1 y menor o igual que el valor de valor2.*/

select * from director d  where fecha_inicio  between '2022-01-01' and  '2022-05-30'

