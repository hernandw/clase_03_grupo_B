-- Funciones

-- UPPER
-- LOWER
-- LENGHTH
-- ROUND


--crea la tabla
create table IF NOT EXISTS empleados (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    salario NUMERIC(10, 2) NOT NULL
);

-- registros de empleados
INSERT INTO empleados (nombre, salario) VALUES
('Juan Pérez', 25000.00),
('María Gómez', 32000.50),
('Carlos López', 28000.75),
('Ana Martínez', 35000.00),
('Luis Rodríguez', 27000.40),
('Sofía Hernández', 31000.90),
('Miguel Torres', 29000.30),
('Laura Sánchez', 33000.80),
('Diego Ramírez', 26000.60),
('Elena Fernández', 34000.20);

Select * from empleados  where nombre = 'juan perez';

select * from empleados;

select UPPER(nombre) from empleados;

select id, lower(nombre) as nombre_completo, salario from empleados;

select id, lower(nombre) as nombre_completo, round(salario) as salario_redondeado from empleados;

select nombre, length(nombre) as cantidad_caracteres from empleados;

-- FUNCIONES DE AGREGADO

-- count
-- sum
-- avg
-- max
-- min

create table monedas (
nombre VARCHAR(50)
);
insert into monedas (nombre) values ('Guarani');
insert into monedas (nombre) values ('Rupiah');
insert into monedas (nombre) values ('Ruble');
insert into monedas (nombre) values ('Peso');
insert into monedas (nombre) values ('Peso');
insert into monedas (nombre) values ('Yuan Renminbi');
insert into monedas (nombre) values ('Yuan Renminbi');
insert into monedas (nombre) values ('Yuan Renminbi');
insert into monedas (nombre) values ('Euro');
insert into monedas (nombre) values ('Ariary');
insert into monedas (nombre) values ('Denar');
insert into monedas (nombre) values ('Rupiah');
insert into monedas (nombre) values ('Ruble');
insert into monedas (nombre) values ('Yuan Renminbi');
insert into monedas (nombre) values ('Lek');


select * from monedas;

select count(*) as cantidad_de_registros from monedas;

select count(*) as cantidad_por_moneda from monedas where  nombre = 'Peso';

insert into monedas (nombre) values ('PeSo');

select count(*) as cantidad_por_moneda from monedas where  lower(nombre) = 'peso';

-- Nos piden mostrar de todas las monedas sin repeticiones

select distinct(lower(nombre)) from monedas;

-- contar cuantas monedas son distintas

select count(distinct(lower(nombre))) as monedas_distintas from monedas;}

-- contar  todas las monedas que sean tipo peso o euro

select * from monedas;

select count(*) as cantidad_de_monedas from monedas where lower(nombre) = 'peso' or UPPER(nombre) = 'EURO';



--ejercicio 2

create table ventas (categoria VARCHAR(50), monto INT);
insert into ventas (categoria, monto) values ('Books', 214);
insert into ventas (categoria, monto) values ('Games', 293);
insert into ventas (categoria, monto) values ('Baby', 241);
insert into ventas (categoria, monto) values ('Tools', 719);
insert into ventas (categoria, monto) values ('Tools', 385);
insert into ventas (categoria, monto) values ('Movies', 882);
insert into ventas (categoria, monto) values ('Outdoors', 654);
insert into ventas (categoria, monto) values ('Baby', 332);
insert into ventas (categoria, monto) values ('Grocery', 332);
insert into ventas (categoria, monto) values ('Toys', 952);
insert into ventas (categoria, monto) values ('Games', 682);
insert into ventas (categoria, monto) values ('Books', 527);
insert into ventas (categoria, monto) values ('Kids', 980);
insert into ventas (categoria, monto) values ('Grocery', 300);

select * from ventas;

-- contar la cantidad de registros

select count(*) as cantidad_registros from ventas;


-- Contar la cantidad de registros con distinta categoría

select count(distinct(lower(categoria))) as cantidad_cat_diferentes from ventas;


-- Contar la cantidad de registros con distinto monto

select count(distinct(monto)) as montos_distintos from ventas;


-- Contar la cantidad de registros de tipo 'tools' o tipo games

select count(*) as "Cantidad registros Categoría Tools o Games" from ventas
where lower(categoria) = 'tools' or lower(categoria) = 'games';


select count(*) as "Registros Tools o Games" from ventas
where lower(categoria) in ( 'Tools', 'games');



select * from empleados;

-- calcular el monto total de la nomina de empleados

select round(sum(salario)) as Monto_mensual_nomina from empleados;

-- promedio

select round(avg(salario), 2) as salario_promedio from empleados;

--calcular el salario maximo

select max(salario) as maximo_salario from empleados;

-- calcular el salario minimo
select min(salario) as maximo_salario from empleados;


select * from monedas;

-- agrupar por categorias
select lower(nombre) as moneda, count(*) as cantidad from monedas group by lower(nombre);

select * from ventas;

select categoria, count(*) as cantidad, sum(monto) as monto_venta_categoria from ventas group by categoria;

-- ordenarlas
select categoria, count(*) as cantidad, sum(monto) as monto_venta_categoria from ventas group by categoria order by sum(monto) asc;



select * from empleados;

select * from empleados order by nombre;

select categoria, count(*) as cantidad, sum(monto) as monto_venta_categoria from ventas group by categoria;

select categoria, count(*) as cantidad, sum(monto) as monto_venta_categoria from ventas group by categoria limit 3 offset 0;
select categoria, count(*) as cantidad, sum(monto) as monto_venta_categoria from ventas group by categoria limit 3 offset 1;
select categoria, count(*) as cantidad, sum(monto) as monto_venta_categoria from ventas group by categoria limit 3 offset 2;



-- multiples tablas

 select * from libros
  inner join editoriales
  on libros.codigoeditorial=editoriales.codigo;

insert into editoriales(nombre) values('Planeta');
 insert into editoriales(nombre) values('Emece');
 insert into editoriales(nombre) values('Siglo XXI');

 insert into libros(titulo,autor,codigoeditorial,precio) 
  values('El aleph','Borges',2,20);
 insert into libros(titulo,autor,codigoeditorial,precio) 
  values('Martin Fierro','Jose Hernandez',1,30);
 insert into libros(titulo,autor,codigoeditorial,precio) 
  values('Aprenda PHP','Mario Molina',3,50);
 insert into libros(titulo,autor,codigoeditorial,precio) 
  values('Java en 10 minutos',default,3,45);



create table libros(
  codigo serial,
  titulo varchar(40) not null,
  autor varchar(30) not null default 'Desconocido',
  codigoeditorial smallint not null,
  precio decimal(5,2),
  primary key (codigo)
 );


 create table editoriales(
  codigo serial,
  nombre varchar(20) not null,
  primary key(codigo)
 );

 select * from libros;
 select * from editoriales;


insert into editoriales(nombre) values('Planeta');
 insert into editoriales(nombre) values('Emece');
 insert into editoriales(nombre) values('Siglo XXI');

 insert into libros(titulo,autor,codigoeditorial,precio) 
  values('El aleph','Borges',2,20);
 insert into libros(titulo,autor,codigoeditorial,precio) 
  values('Martin Fierro','Jose Hernandez',1,30);
 insert into libros(titulo,autor,codigoeditorial,precio) 
  values('Aprenda PHP','Mario Molina',3,50);
 insert into libros(titulo,autor,codigoeditorial,precio) 
  values('Java en 10 minutos',default,3,45);

  select a.codigo, titulo, autor, precio, b.codigo as codigoeditorial, nombre as editorial  from libros a
   join editoriales b
  on a.codigoeditorial = b.codigo;

select * from libros;
 select * from editoriales;

 delete from editoriales where codigo = 3;