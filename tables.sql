CREATE TABLE Clientes (
    id_cliente bigint identity(1,1) PRIMARY KEY,
    nombre NVARCHAR(100),
    correo_electronico NVARCHAR(255),
	pass NVARCHAR(255)
);

CREATE TABLE Comics (
    id_comic bigint identity(10,2) PRIMARY KEY,
    nombre NVARCHAR(100),
	anio tinyint,
    precio DECIMAL(10, 2)
);

CREATE TABLE Compras (
    id_compra bigint identity(100,3) PRIMARY KEY,
    id_cliente bigint ,
    fecha_compra DATE,
    total DECIMAL(10, 2),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
);


CREATE TABLE Inventario (
    id_inventario bigint identity(200,1)PRIMARY KEY,
    id_comic bigint ,
    cantidad_disponible INT,
	disponibilidad binary,
    FOREIGN KEY (id_comic) REFERENCES Comics(id_comic)
);


CREATE TABLE Comic_Compras (
    id_CC bigint identity(1000,2) PRIMARY KEY,
    cantidad tinyint,
	id_compra bigint ,
	id_comic bigint ,
	FOREIGN KEY (id_compra) REFERENCES Compras(id_compra),
	FOREIGN KEY (id_comic) REFERENCES Comics(id_comic),
	
);





DROP TABLE Comic_Compras;  
DROP TABLE Inventario ;  
DROP TABLE Comics ;  
DROP TABLE Compras ;  
DROP TABLE Clientes ;  




--- Insert's 

INSERT INTO Clientes (nombre, correo_electronico,pass)
VALUES
    ('Juan ', 'juan@example.com', '123456789'),
	('Carlos', 'Carlos@example.com', '123456789'),
    ('Maria ', 'Maria@example.com', '123456789'),
    ('Alejandro', 'Ale@example.com', '123456789'),
	('Jesus', 'Jesus@example.com', '123456789'),
	('Vania', 'Vania@example.com', '123456789'),
	('Reyna', 'Reyna@example.com', '123456789'),
	('Ivan', 'ivan@example.com', '123456789'),
	('Melissa', 'Meli@example.com', '123456789');


Select * from Clientes;

delete  from Clientes;



INSERT INTO Comics (nombre,anio,precio)
VALUES
    ('Spider-Man #1',1961, 100.00),
    ('Batman #27', 1978,98.50),
	('Deadpool #1 ', 1989,562.00),
	('Return to Barry Allen #1', 1992,12.50),
	('Wonder Woman #10',1978,450.50),
	('WatchMen #3', 1990,298.50),
	('Hellboy #15', 1988,654.50),
	('Civil war #5', 1990,324.00),
	('SandMan #1', 1990,127.00),
    ('X-Men #12', 1982, 800.00);


Select * from Comics;



INSERT INTO Inventario (id_comic, cantidad_disponible,disponibilidad)
VALUES
    (10, 100, 1),
    (12, 25, 1),
    (14, 0, 0),
	(16, 42, 1),
	(18, 7, 1),
	(20, 50, 1),
	(22, 0, 0),
	(24, 6, 1),
	(26, 9, 1),
	(28, 0, 0);

Select * from Inventario;




INSERT INTO Compras (id_cliente, fecha_compra, total)
VALUES
    ( 9, '2024-05-15', 580.00),
    ( 2, '2024-05-14', 755.00),
	( 5, '2024-05-14', 485.00),
    ( 1, '2024-05-14', 875.00),
	( 2, '2024-05-14', 755.00),
	( 9, '2024-05-14', 1111.00),
    ( 7, '2024-05-13', 360.00);

Select * from Compras;




INSERT INTO Comic_Compras (cantidad, id_compra, id_comic)
VALUES
    ( 2, 100, 14),
	( 3, 103, 20),
	( 1, 106, 18),
	( 8, 109, 10),
	( 1, 112, 28),
	( 2, 115, 22),
	( 2, 118, 26);

	Select * from Compras;
	Select * from Comics;

	Select * from Comic_Compras ;



--- INNER JOIN 


 --“Clientes” y “Compras” para obtener los detalles de las compras junto con los nombres de los clientes:

SELECT c.id_compra, cl.nombre AS nombre_cliente, c.fecha_compra, c.total
FROM Compras c
INNER JOIN Clientes cl ON c.id_cliente = cl.id_cliente;



-- Comics e Inventario para obtener los cómics disponibles en el inventario:

SELECT co.nombre, i.cantidad_disponible
FROM Comics co
INNER JOIN Inventario i ON co.id_comic = i.id_comic;



-- Compras” y “Comic_Compras” para obtener los detalles de las compras junto con los cómics comprados:

SELECT cc.id_compra, co.nombre AS nombre_comic, cc.cantidad
FROM Comic_Compras cc
INNER JOIN Comics co ON cc.id_comic = co.id_comic


-- “Clientes”, “Compras” y “Comic_Compras” para obtener los detalles de las compras realizadas por cada cliente y los cómics comprados

SELECT cl.nombre AS nombre_cliente, c.id_compra, co.nombre AS nombre_comic, cc.cantidad
FROM Clientes cl
INNER JOIN Compras c ON cl.id_cliente = c.id_cliente
INNER JOIN Comic_Compras cc ON c.id_compra = cc.id_compra
INNER JOIN Comics co ON cc.id_comic = co.id_comic;


-- Inner Join a todas las tablas 

SELECT cl.nombre AS nombre_cliente, c.id_compra, co.nombre AS nombre_comic, cc.cantidad, i.cantidad_disponible
FROM Clientes cl
INNER JOIN Compras c ON cl.id_cliente = c.id_cliente
INNER JOIN Comic_Compras cc ON c.id_compra = cc.id_compra
INNER JOIN Comics co ON cc.id_comic = co.id_comic
INNER JOIN Inventario i ON co.id_comic = i.id_comic;



--RIGHT JOIN

--  “Clientes” y “Compras” para obtener todos los clientes junto con las compras que han realizado

SELECT cl.nombre AS nombre_cliente, c.id_compra, c.fecha_compra
FROM Clientes cl
RIGHT JOIN Compras c ON cl.id_cliente = c.id_cliente;


-- “Comics” y “Inventario” para obtener todos los cómics junto con la cantidad disponible en el inventario

SELECT co.nombre AS nombre_comic, i.cantidad_disponible
FROM Comics co
RIGHT JOIN Inventario i ON co.id_comic = i.id_comic;



-- “Compras” y “Inventario” para obtener todas las compras junto con la cantidad disponible de cómics en el inventario

SELECT c.id_compra, co.nombre AS nombre_comic, i.cantidad_disponible
FROM Compras c
RIGHT JOIN Comic_Compras cc ON c.id_compra = cc.id_compra
RIGHT JOIN Comics co ON cc.id_comic = co.id_comic
RIGHT JOIN Inventario i ON co.id_comic = i.id_comic;




-- LEFT JOIN



--Clientes” y “Compras” para obtener todos los clientes junto con las compras que han realizado


SELECT cl.nombre AS nombre_cliente, c.id_compra, c.fecha_compra, c.total
FROM Clientes cl
LEFT JOIN Compras c ON cl.id_cliente = c.id_cliente;



-- "Comics” y “Inventario” para obtener todos los cómics junto con la cantidad disponible en el inventario

SELECT co.nombre AS nombre_comic, i.cantidad_disponible
FROM Comics co
LEFT JOIN Inventario i ON co.id_comic = i.id_comic;



--  “Compras” y “Comic_Compras” para obtener todas las compras junto con los cómics comprados

SELECT c.id_compra, co.nombre AS nombre_comic, cc.cantidad
FROM Compras c
LEFT JOIN Comic_Compras cc ON c.id_compra = cc.id_compra
LEFT JOIN Comics co ON cc.id_comic = co.id_comic;





--- VIEWS

--“VistaClientesCompras”: Esta vista mostrará los detalles de las compras realizadas por cada cliente.

CREATE VIEW VistaClientesCompras AS
SELECT cl.nombre AS nombre_cliente, c.id_compra, c.fecha_compra, c.total
FROM Clientes cl
LEFT JOIN Compras c ON cl.id_cliente = c.id_cliente;




-- “VistaComicsInventario”: Esta vista mostrará los cómics disponibles en el inventario junto con su cantidad.

CREATE VIEW VistaComicsInventario AS
SELECT co.nombre AS nombre_comic, i.cantidad_disponible
FROM Comics co
LEFT JOIN Inventario i ON co.id_comic = i.id_comic;


-- VistaComprasComicCompras”: Esta vista mostrará todas las compras junto con los cómics comprados

CREATE VIEW VistaComprasComicCompras AS
SELECT c.id_compra, co.nombre AS nombre_comic, cc.cantidad
FROM Compras c
LEFT JOIN Comic_Compras cc ON c.id_compra = cc.id_compra
LEFT JOIN Comics co ON cc.id_comic = co.id_comic;



-- VistaGeneral: integra un reporte principal de las compras

CREATE VIEW VistaGeneral AS
SELECT
    cl.id_cliente,
    cl.nombre AS nombre_cliente,
    cl.correo_electronico,
    c.id_compra,
    c.fecha_compra,
    c.total,
    co.id_comic,
    co.nombre AS nombre_comic,
    co.precio,
    i.cantidad_disponible
FROM Clientes cl
LEFT JOIN Compras c ON cl.id_cliente = c.id_cliente
LEFT JOIN Comic_Compras cc ON c.id_compra = cc.id_compra
LEFT JOIN Comics co ON cc.id_comic = co.id_comic
LEFT JOIN Inventario i ON co.id_comic = i.id_comic;