CREATE DATABASE appHotel;
USE appHotel;

CREATE TABLE Supervisor(
	id_Supervisor INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    DNI CHAR(8) NOT NULL,
    fecha_asignacion DATE NOT NULL,
    telefono CHAR(8) NOT NULL,
    salario DECIMAL(10,2) NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    apellido VARCHAR(20) NOT NULL
);

CREATE TABLE Hotel(
	id_hotel INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    direccion VARCHAR(20) NOT NULL,
    calificacion DECIMAL(3,1),
    id_Supervisor INT,
    FOREIGN KEY (id_Supervisor) REFERENCES Supervisor (id_Supervisor)
);

CREATE TABLE Empleado(
	id_empleado INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(20) NOT NULL,
	apellido VARCHAR(20) NOT NULL,
    salario DECIMAL(10,2) NOT NULL,
    id_hotel INT,
    id_Supervisor INT,
    FOREIGN KEY (id_hotel) REFERENCES Hotel (id_hotel),
    FOREIGN key (id_Supervisor) REFERENCES Supervisor (id_Supervisor)
);

CREATE TABLE Habitacion(
	id_habitacion INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    numero INT NOT NULL,
    precio DECIMAL(11,2) NOT NULL,
    tipo VARCHAR(25),
    estado VARCHAR(25),
    fecha_inicio DATE NOT NULL,
    fecha_final DATE NOT NULL,
    piso INT NOT NULL,
    nombre_piso VARCHAR(25),
    id_hotel INT,
    FOREIGN KEY (id_hotel) REFERENCES Hotel (id_hotel)
);

CREATE TABLE Ambiente(
	id_ambiente INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    dimension DECIMAL(5,2) NOT NULL,
    estado VARCHAR(20) NOT NULL,
    id_habitacion INT,
    FOREIGN KEY (id_habitacion) REFERENCES Habitacion (id_habitacion)
);

CREATE TABLE Cliente(
	id_cliente INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    apellido VARCHAR(20) NOT NULL,
    email VARCHAR(30),
    telefono CHAR(8) NOT NULL,
    pais VARCHAR(20)
);

CREATE TABLE Reservan(
	id_reserva INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    fecha_pago DATE NOT NULL,
    monto DECIMAL(11,2) NOT NULL,
    id_cliente INT,
    id_habitacion INT,
    FOREIGN KEY (id_cliente) REFERENCES Cliente (id_cliente),
    FOREIGN KEY (id_habitacion) REFERENCES Habitacion (id_habitacion)
);

CREATE TABLE Servicio(
	id_servicio INT PRIMARY KEY AUTO_INCREMENT,
    descripcion VARCHAR(200),
    nombre_servicio VARCHAR(20) NOT NULL,
    costo DECIMAL(11,2) NOT NULL,
    id_hotel INT,
    FOREIGN KEY (id_hotel) REFERENCES Hotel (id_hotel)
);

CREATE TABLE Brinda(
	id_brinda INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	cantidad INT NOT NULL,
    fecha DATE NOT NULL,
    id_servicio INT,
    id_habitacion INT,
    FOREIGN KEY (id_servicio) REFERENCES Servicio (id_servicio),
    FOREIGN KEY (id_habitacion) REFERENCES Habitacion (id_habitacion)
    
); 

-- Inserts Supervisor
INSERT INTO Supervisor (DNI, fecha_asignacion, telefono, salario, nombre, apellido) VALUES ('12345678', '2022-03-15', '11112222', 5500.00, 'Carlos', 'Lopez');
INSERT INTO Supervisor (DNI, fecha_asignacion, telefono, salario, nombre, apellido) VALUES ('22334455', '2023-01-10', '33334444', 6200.00, 'Laura', 'Martinez');
INSERT INTO Supervisor (DNI, fecha_asignacion, telefono, salario, nombre, apellido) VALUES ('87654321', '2022-08-01', '55556666', 5800.00, 'Jorge', 'Perez');
INSERT INTO Supervisor (DNI, fecha_asignacion, telefono, salario, nombre, apellido) VALUES ('33445566', '2024-02-20', '77778888', 6000.00, 'Lucia', 'Ramirez');
INSERT INTO Supervisor (DNI, fecha_asignacion, telefono, salario, nombre, apellido) VALUES ('99887766', '2023-06-11', '99990000', 6500.00, 'Andres', 'Gomez');

-- Inserts Hotel
INSERT INTO Hotel (direccion, calificacion, id_Supervisor) VALUES ('Av. Central 123', 4.5, 1);
INSERT INTO Hotel (direccion, calificacion, id_Supervisor) VALUES ('Calle Sol 456', 4.2, 2);
INSERT INTO Hotel (direccion, calificacion, id_Supervisor) VALUES ('Ruta 9 Km 25', 3.9, 3);
INSERT INTO Hotel (direccion, calificacion, id_Supervisor) VALUES ('Av. Libertad 890', 4.8, 4);
INSERT INTO Hotel (direccion, calificacion, id_Supervisor) VALUES ('Calle Norte 321', 4.0, 5);

--Inserts Empleado
INSERT INTO Empleado (nombre, apellido, salario, id_hotel, id_Supervisor) VALUES ('Mario', 'Gonzalez', 2500.00, 1, 1);
INSERT INTO Empleado (nombre, apellido, salario, id_hotel, id_Supervisor) VALUES ('Ana', 'Diaz', 2700.00, 2, 2);
INSERT INTO Empleado (nombre, apellido, salario, id_hotel, id_Supervisor) VALUES ('Pedro', 'Sanchez', 2300.00, 3, 3);
INSERT INTO Empleado (nombre, apellido, salario, id_hotel, id_Supervisor) VALUES ('Rosa', 'Fernandez', 2600.00, 4, 4);
INSERT INTO Empleado (nombre, apellido, salario, id_hotel, id_Supervisor) VALUES ('Diego', 'Torres', 2550.00, 5, 5);

-- Inserts Habitacion
INSERT INTO Habitacion (numero, precio, tipo, estado, fecha_inicio, fecha_final, piso, nombre_piso, id_hotel) VALUES (101, 120.00, 'Doble', 'Disponible', '2025-01-01', '2025-01-05', 1, 'Planta Baja', 1);
INSERT INTO Habitacion (numero, precio, tipo, estado, fecha_inicio, fecha_final, piso, nombre_piso, id_hotel) VALUES (202, 150.00, 'Suite', 'Ocupada', '2025-02-10', '2025-02-20', 2, 'Primer Piso', 2);
INSERT INTO Habitacion (numero, precio, tipo, estado, fecha_inicio, fecha_final, piso, nombre_piso, id_hotel) VALUES (303, 100.00, 'Simple', 'Disponible', '2025-03-15', '2025-03-18', 3, 'Segundo Piso', 3);
INSERT INTO Habitacion (numero, precio, tipo, estado, fecha_inicio, fecha_final, piso, nombre_piso, id_hotel) VALUES (404, 200.00, 'Premium', 'Ocupada', '2025-04-05', '2025-04-12', 4, 'Tercer Piso', 4);
INSERT INTO Habitacion (numero, precio, tipo, estado, fecha_inicio, fecha_final, piso, nombre_piso, id_hotel) VALUES (505, 90.00, 'Simple', 'Mantenimiento', '2025-05-01', '2025-05-03', 5, 'Cuarto Piso', 5);

-- Inserts Ambiente
INSERT INTO Ambiente (nombre, dimension, estado, id_habitacion) VALUES ('Baño', 6.50, 'Limpio', 1);
INSERT INTO Ambiente (nombre, dimension, estado, id_habitacion) VALUES ('Cocina', 10.20, 'Limpio', 2);
INSERT INTO Ambiente (nombre, dimension, estado, id_habitacion) VALUES ('Sala', 15.00, 'Ocupado', 3);
INSERT INTO Ambiente (nombre, dimension, estado, id_habitacion) VALUES ('Terraza', 12.80, 'Mantenimiento', 4);
INSERT INTO Ambiente (nombre, dimension, estado, id_habitacion) VALUES ('Dormitorio', 14.30, 'Limpio', 5);

-- Inserts Cliente
INSERT INTO Cliente (nombre, apellido, email, telefono, pais) VALUES ('Juan', 'Perez', 'juanperez@mail.com', '11114444', 'Argentina');
INSERT INTO Cliente (nombre, apellido, email, telefono, pais) VALUES ('Maria', 'Lopez', 'maria.lopez@mail.com', '22225555', 'Chile');
INSERT INTO Cliente (nombre, apellido, email, telefono, pais) VALUES ('Luis', 'Gomez', 'luisg@mail.com', '33336666', 'Peru');
INSERT INTO Cliente (nombre, apellido, email, telefono, pais) VALUES ('Sofia', 'Diaz', 'sofia.diaz@mail.com', '44447777', 'Uruguay');
INSERT INTO Cliente (nombre, apellido, email, telefono, pais) VALUES ('Pablo', 'Fernandez', 'pablo.fer@mail.com', '55558888', 'Bolivia');

-- Inserts Reservan
INSERT INTO Reservan (fecha_pago, monto, id_cliente, id_habitacion) VALUES ('2025-01-02', 480.00, 1, 1);
INSERT INTO Reservan (fecha_pago, monto, id_cliente, id_habitacion) VALUES ('2025-02-15', 1500.00, 2, 2);
INSERT INTO Reservan (fecha_pago, monto, id_cliente, id_habitacion) VALUES ('2025-03-16', 300.00, 3, 3);
INSERT INTO Reservan (fecha_pago, monto, id_cliente, id_habitacion) VALUES ('2025-04-08', 1600.00, 4, 4);
INSERT INTO Reservan (fecha_pago, monto, id_cliente, id_habitacion) VALUES ('2025-05-02', 180.00, 5, 5);

-- Inserts Servicio
INSERT INTO Servicio (descripcion, nombre_servicio, costo, id_hotel) VALUES ('Desayuno buffet completo', 'Desayuno', 20.00, 1);
INSERT INTO Servicio (descripcion, nombre_servicio, costo, id_hotel) VALUES ('Spa y masajes', 'Spa', 50.00, 2);
INSERT INTO Servicio (descripcion, nombre_servicio, costo, id_hotel) VALUES ('Servicio de lavandería', 'Lavandería', 15.00, 3);
INSERT INTO Servicio (descripcion, nombre_servicio, costo, id_hotel) VALUES ('Transporte al aeropuerto', 'Transporte', 30.00, 4);
INSERT INTO Servicio (descripcion, nombre_servicio, costo, id_hotel) VALUES ('WiFi Premium', 'Internet', 10.00, 5);

--Inserts Brinda
INSERT INTO Brinda (cantidad, fecha, id_servicio, id_habitacion) VALUES (2, '2025-01-02', 1, 1);
INSERT INTO Brinda (cantidad, fecha, id_servicio, id_habitacion) VALUES (1, '2025-02-15', 2, 2);
INSERT INTO Brinda (cantidad, fecha, id_servicio, id_habitacion) VALUES (3, '2025-03-16', 3, 3);
INSERT INTO Brinda (cantidad, fecha, id_servicio, id_habitacion) VALUES (1, '2025-04-08', 4, 4);
INSERT INTO Brinda (cantidad, fecha, id_servicio, id_habitacion) VALUES (4, '2025-05-02', 5, 5);

-- Consultas sin Probar
SELECT 
    c.nombre AS nombre_cliente,
    c.apellido AS apellido_cliente,
    h.numero AS numero_habitacion,
    ho.direccion AS direccion_hotel,
    s.nombre AS nombre_supervisor,
    s.apellido AS apellido_supervisor
FROM Reservan r
INNER JOIN Cliente c ON r.id_cliente = c.id_cliente
INNER JOIN Habitacion h ON r.id_habitacion = h.id_habitacion
INNER JOIN Hotel ho ON h.id_hotel = ho.id_hotel
INNER JOIN Supervisor s ON ho.id_Supervisor = s.id_Supervisor;

SELECT 
    h.numero AS numero_habitacion,
    ho.direccion AS direccion_hotel,
    s.nombre_servicio,
    s.costo AS costo_unitario,
    b.cantidad,
    (s.costo * b.cantidad) AS costo_total,
    b.fecha
FROM Brinda b
INNER JOIN Habitacion h ON b.id_habitacion = h.id_habitacion
INNER JOIN Hotel ho ON h.id_hotel = ho.id_hotel
INNER JOIN Servicio s ON b.id_servicio = s.id_servicio
ORDER BY h.numero;

SELECT 
    e.nombre AS nombre_empleado,
    e.apellido AS apellido_empleado,
    e.salario AS salario_empleado,
    h.direccion AS direccion_hotel,
    s.nombre AS nombre_supervisor,
    s.apellido AS apellido_supervisor,
    s.telefono AS telefono_supervisor
FROM Empleado e
INNER JOIN Hotel h ON e.id_hotel = h.id_hotel
INNER JOIN Supervisor s ON h.id_Supervisor = s.id_Supervisor
ORDER BY h.id_hotel;

SELECT 
    e.nombre AS empleado,
    e.apellido,
    h.direccion AS hotel
FROM Empleado e
JOIN Hotel h ON e.id_hotel = h.id_hotel;

SELECT 
    id_cliente,
    monto AS monto_pagado,
    fecha_pago
FROM Reservan;