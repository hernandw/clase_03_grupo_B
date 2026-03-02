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