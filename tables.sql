CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY,
    nombre NVARCHAR(100),
    correo_electronico NVARCHAR(255),
	pass NVARCHAR(255)
);

CREATE TABLE Comics (
    id_comic INT PRIMARY KEY,
    nombre NVARCHAR(100),
	anio tinyint,
    precio DECIMAL(10, 2)
);


CREATE TABLE Compras (
    id_compra INT PRIMARY KEY,
    id_cliente INT,
	id_comic INT,
    fecha_compra DATE,
    total DECIMAL(10, 2),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
	FOREIGN KEY (id_comic) REFERENCES Comics(id_comic)
);


CREATE TABLE Inventario (
    id_inventario INT PRIMARY KEY,
    id_comic INT,
    cantidad_disponible INT,
    FOREIGN KEY (id_comic) REFERENCES Comics(id_comic)
);


DROP TABLE Inventario ;  
DROP TABLE Comics ;  
DROP TABLE Compras ;  
DROP TABLE Clientes ;  


--- Insert's 

INSERT INTO Clientes (id_cliente, nombre, correo_electronico,pass)
VALUES
    (1, 'Juan ', 'juan@example.com', '123456789'),
	(2, 'Carlos', 'Carlos@example.com', '123456789'),
    (3, 'Maria ', 'Maria@example.com', '123456789'),
    (4, 'Alejandro', 'Ale@example.com', '123456789'),
	(5, 'Jesus', 'Jesus@example.com', '123456789'),
	(6, 'Vania', 'Vania@example.com', '123456789'),
	(7, 'Melissa', 'Meli@example.com', '123456789');


Select * from Clientes;

delete  from Clientes;


INSERT INTO Compras (id_compra, id_cliente, fecha_compra, total)
VALUES
    (101, 1, '2024-05-15', 50.00),
    (102, 2, '2024-05-14', 75.00),
    (103, 1, '2024-05-13', 30.00);




INSERT INTO Comics (id_comic, nombre, precio)
VALUES
    (1, 'Spider-Man #1', 10.00),
    (2, 'Batman #27', 12.50),
    (3, 'X-Men #12', 8.00);


INSERT INTO Inventario (id_inventario, id_comic, cantidad_disponible)
VALUES
    (201, 1, 20),
    (202, 2, 15),
    (203, 3, 30);



--- INNER JOIN para obtener los detalles de las compras junto con los nombres de los clientes:

SELECT Compras.id_compra, Clientes.nombre, Compras.fecha_compra, Compras.total
FROM Compras
INNER JOIN Clientes ON Compras.id_cliente = Clientes.id_cliente;


--- LEFT JOIN para obtener todos los comics junto con las compras realizadas por cada cliente:


SELECT Comics.nombre, Compras.id_compra, Clientes.nombre AS nombre_cliente
FROM Comics
LEFT JOIN Compras ON Comics.id_comic = Compras.id_comic
LEFT JOIN Clientes ON Compras.id_cliente = Clientes.id_cliente;



-- RIGHT JOIN para obtener todos los clientes junto con las compras que han realizado (incluso si no han realizado ninguna compra):


SELECT Clientes.nombre, Compras.id_compra, Compras.fecha_compra
FROM Clientes
RIGHT JOIN Compras ON Clientes.id_cliente = Compras.id_cliente;









