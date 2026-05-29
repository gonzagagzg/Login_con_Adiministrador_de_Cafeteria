--ver bd
SELECT name AS [Base de Datos], database_id, create_date 
FROM sys.databases;

CREATE DATABASE CafeteriaDB;
GO
USE CafeteriaDB;


CREATE TABLE categorias (
    id INT PRIMARY KEY IDENTITY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE productos (
    id INT PRIMARY KEY IDENTITY,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    id_categoria INT FOREIGN KEY REFERENCES categorias(id),
    fecha_elaboracion DATE,
    estado BIT DEFAULT 1
);

CREATE TABLE usuarios (
    id BIGINT PRIMARY KEY IDENTITY(1,1),
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(50) NOT NULL, 
    email VARCHAR(100)
);

--Ver tablas
SELECT SCHEMA_NAME(schema_id) AS [Esquema], name AS [Tabla]
FROM sys.tables
ORDER BY [Esquema], [Tabla]; 


INSERT INTO usuarios (username, password, email) 
VALUES ('admin', '12345', 'admin@example.com');

INSERT INTO categorias (nombre) VALUES 
('Bebidas Calientes'),
('Snacks'),
('Postres'),
('Bebidas Frías'),
('Panadería'),
('Ensaladas'),
('Sándwiches'),
('Desayunos'),
('Salsas y Aderezos'),
('Opciones Veganas');

INSERT INTO productos (nombre, precio, id_categoria, fecha_elaboracion, estado) VALUES 
('Café Espresso Americano', 2.50, 1, '2026-05-28', 1), 
('Papas Fritas Artesanales', 1.50, 2, '2026-05-20', 1), 
('Cheesecake de Frutos Rojos', 4.50, 3, '2026-05-27', 1), 
('Té Negro Helado con Limón', 2.20, 4, '2026-05-28', 1), 
('Croissant de Mantequilla', 1.80, 5, '2026-05-28', 1), 
('Ensalada César con Pollo', 5.90, 6, '2026-05-28', 1), 
('Sándwich de Pavo y Queso', 4.20, 7, '2026-05-28', 1), 
('Waffles con Miel de Maple', 4.80, 8, '2026-05-26', 1), 
('Aderezo de Mostaza y Miel', 0.75, 9, '2026-05-10', 1), 
('Hamburguesa de Lentejas', 6.50, 10, '2026-05-28', 1); 

USE CafeteriaDB;

select * from categorias c;
select * from productos p ;
SELECT * from usuarios u;
