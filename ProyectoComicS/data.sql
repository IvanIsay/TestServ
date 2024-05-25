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

