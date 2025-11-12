CREATE DATABASE appHotel;
USE appHotel;

-- Tabla: Supervisor
CREATE TABLE Supervisor (
    id_Supervisor INT NOT NULL,
    DNI CHAR(8) NOT NULL,
    fecha_asignacion DATE NOT NULL,
    telefono CHAR(8) NOT NULL,
    estado_laboral VARCHAR(50) NOT NULL,
    salario DECIMAL(10,2) NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    apellido VARCHAR(20) NOT NULL
);

-- Tabla: Hotel
CREATE TABLE Hotel (
    id_hotel INT NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    calificacion DECIMAL(3,1),
    id_Supervisor INT NOT NULL
);

-- Tabla: Servicio
CREATE TABLE Servicio (
    id_servicio INT NOT NULL,
    descripcion VARCHAR(200),
    nombre_servicio VARCHAR(50) NOT NULL,
    costo DECIMAL(11,2) NOT NULL
);

-- Tabla: Habitacion
CREATE TABLE Habitacion (
    id_habitacion INT NOT NULL,
    numero INT NOT NULL,
    precio_dias DECIMAL(11,2) NOT NULL,
    estado VARCHAR(25),
    piso INT NOT NULL,
    id_hotel INT NOT NULL
);

-- Tabla: habitacion_servicio 
CREATE TABLE habitacion_servicio (
    id INT NOT NULL,
    id_servicio INT NOT NULL,
    id_habitacion INT NOT NULL
);

-- Tabla: Cliente
CREATE TABLE Cliente (
    id_cliente INT NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    apellido VARCHAR(20) NOT NULL,
    email VARCHAR(30),
    telefono VARCHAR(15) NOT NULL,
    pais VARCHAR(20)
);

-- Tabla: Empleado
CREATE TABLE Empleado (
    id_empleado INT NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    apellido VARCHAR(20) NOT NULL,
    salario DECIMAL(10,2) NOT NULL
);

-- Tabla: Reservas
CREATE TABLE Reserva (
    id_reserva INT NOT NULL,
    fecha_pago DATE NOT NULL,
    estado_reserva enum('Pagado','No pagado') NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_final DATE NOT NULL,
    monto DECIMAL(11,2) NOT NULL,
    id_cliente INT NOT NULL,
    id_habitacion INT NOT NULL
);

-- Tabla: empleado_reserva 
CREATE TABLE empleado_reserva (
    id INT NOT NULL,
    id_reserva INT NOT NULL,
    id_empleado INT NOT NULL
);

-- FK y PK de las tablas

ALTER TABLE cliente
  ADD PRIMARY KEY (id_cliente);

ALTER TABLE empleado
  ADD PRIMARY KEY (id_empleado);

ALTER TABLE empleado_reserva
  ADD PRIMARY KEY (id),
  ADD KEY id_reserva (id_reserva),
  ADD KEY id_empleado (id_empleado);

ALTER TABLE habitacion
  ADD PRIMARY KEY (id_habitacion),
  ADD KEY id_hotel (id_hotel);

ALTER TABLE habitacion_servicio
  ADD PRIMARY KEY (id),
  ADD KEY id_servicio (id_servicio),
  ADD KEY id_habitacion (id_habitacion);

ALTER TABLE hotel
  ADD PRIMARY KEY (id_hotel),
  ADD KEY id_Supervisor (id_Supervisor);

ALTER TABLE reserva
  ADD PRIMARY KEY (id_reserva),
  ADD KEY id_cliente (id_cliente),
  ADD KEY id_habitacion (id_habitacion);

ALTER TABLE servicio
  ADD PRIMARY KEY (id_servicio);

ALTER TABLE supervisor
  ADD PRIMARY KEY (id_Supervisor);

-- Agrego las incrementables de las tablas

ALTER TABLE cliente
  MODIFY id_cliente int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE empleado
  MODIFY id_empleado int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE empleado_reserva
  MODIFY id int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE habitacion
  MODIFY id_habitacion int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE habitacion_servicio
  MODIFY id int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE hotel
  MODIFY id_hotel int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE reserva
  MODIFY id_reserva int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE servicio
  MODIFY id_servicio int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE supervisor
  MODIFY id_Supervisor int(11) NOT NULL AUTO_INCREMENT;


-- Restricciones para tablas volcadas
ALTER TABLE empleado_reserva
  ADD CONSTRAINT `empleado_reserva_ibfk_1` FOREIGN KEY (id_reserva) REFERENCES reserva (id_reserva),
  ADD CONSTRAINT `empleado_reserva_ibfk_2` FOREIGN KEY (id_empleado) REFERENCES empleado (id_empleado);

ALTER TABLE habitacion
  ADD CONSTRAINT `habitacion_ibfk_1` FOREIGN KEY (id_hotel) REFERENCES hotel (id_hotel);

ALTER TABLE habitacion_servicio
  ADD CONSTRAINT `habitacion_servicio_ibfk_1` FOREIGN KEY (id_servicio) REFERENCES servicio (id_servicio),
  ADD CONSTRAINT `habitacion_servicio_ibfk_2` FOREIGN KEY (id_habitacion) REFERENCES habitacion (id_habitacion);

ALTER TABLE hotel
  ADD CONSTRAINT `hotel_ibfk_1` FOREIGN KEY (id_Supervisor) REFERENCES supervisor (id_Supervisor);

ALTER TABLE reserva
  ADD CONSTRAINT `reserva_ibfk_1` FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente),
  ADD CONSTRAINT `reserva_ibfk_2` FOREIGN KEY (id_habitacion) REFERENCES habitacion (id_habitacion);


-- Inserts

-- Inserts supervisor
INSERT INTO Supervisor (DNI, fecha_asignacion, telefono, estado_laboral, salario, nombre, apellido)
VALUES ('67890123', '2023-10-01', '76789012', 'Activo', 3700.00, 'Diego', 'Suárez');
INSERT INTO Supervisor (DNI, fecha_asignacion, telefono, estado_laboral, salario, nombre, apellido)
VALUES ('78901234', '2023-11-12', '77890123', 'Activo', 3550.00, 'Valeria', 'Romero');
INSERT INTO Supervisor (DNI, fecha_asignacion, telefono, estado_laboral, salario, nombre, apellido)
VALUES ('89012345', '2024-01-20', '78901234', 'Inactivo', 3100.00, 'Pablo', 'Herrera');
INSERT INTO Supervisor (DNI, fecha_asignacion, telefono, estado_laboral, salario, nombre, apellido)
VALUES ('90123456', '2024-03-02', '79012345', 'Suspendido', 2950.00, 'Rocío', 'García');
INSERT INTO Supervisor (DNI, fecha_asignacion, telefono, estado_laboral, salario, nombre, apellido)
VALUES ('91234567', '2024-04-15', '79123456', 'Activo', 3650.00, 'Tomás', 'Ríos');
INSERT INTO Supervisor (DNI, fecha_asignacion, telefono, estado_laboral, salario, nombre, apellido)
VALUES ('92345678', '2024-05-28', '79234567', 'Activo', 3400.00, 'Elena', 'Morales');
INSERT INTO Supervisor (DNI, fecha_asignacion, telefono, estado_laboral, salario, nombre, apellido)
VALUES ('93456789', '2024-07-09', '79345678', 'Inactivo', 3000.00, 'Andrés', 'Vega');
INSERT INTO Supervisor (DNI, fecha_asignacion, telefono, estado_laboral, salario, nombre, apellido)
VALUES ('94567890', '2024-08-22', '79456789', 'Activo', 3750.00, 'Claudia', 'Navarro');
INSERT INTO Supervisor (DNI, fecha_asignacion, telefono, estado_laboral, salario, nombre, apellido)
VALUES ('95678901', '2024-09-30', '79567890', 'Activo', 3800.00, 'Hernán', 'Campos');
INSERT INTO Supervisor (DNI, fecha_asignacion, telefono, estado_laboral, salario, nombre, apellido)
VALUES ('96789012', '2024-10-12', '79678901', 'Suspendido', 2900.00, 'Natalia', 'Fuentes');

-- Inserts Hotel
INSERT INTO Hotel (direccion, calificacion, id_Supervisor)
VALUES ('Av. Independencia 123', 4.6, 1);
INSERT INTO Hotel (direccion, calificacion, id_Supervisor)
VALUES ('Calle Las Rosas 456', 3.9, 2);
INSERT INTO Hotel (direccion, calificacion, id_Supervisor)
VALUES ('Boulevard Central 789', 4.2, 3);
INSERT INTO Hotel (direccion, calificacion, id_Supervisor)
VALUES ('Ruta Provincial 12 Km 34', 4.0, 4);
INSERT INTO Hotel (direccion, calificacion, id_Supervisor)
VALUES ('Pasaje del Lago 321', 3.8, 5);

-- Inserts Servicio
INSERT INTO Servicio (descripcion, nombre_servicio, costo)
VALUES ('Baño privado con ducha, lavamanos y artículos de higiene personal', 'Baño estándar', 40.00);
INSERT INTO Servicio (descripcion, nombre_servicio, costo)
VALUES ('Baño con jacuzzi y amenities premium para relajación', 'Baño con jacuzzi', 120.00);
INSERT INTO Servicio (descripcion, nombre_servicio, costo)
VALUES ('Servicio de limpieza diaria y cambio de sábanas', 'Limpieza diaria', 35.00);
INSERT INTO Servicio (descripcion, nombre_servicio, costo)
VALUES ('Televisión por cable con más de 100 canales internacionales', 'TV por cable', 25.00);
INSERT INTO Servicio (descripcion, nombre_servicio, costo)
VALUES ('Mini bar con bebidas y snacks variados', 'Mini bar', 60.00);

-- Inserts Habitacion
INSERT INTO Habitacion (numero, precio_dias, estado, piso, id_hotel)
VALUES (101, 180.00, 'Disponible', 1, 1);
INSERT INTO Habitacion (numero, precio_dias, estado, piso, id_hotel)
VALUES (102, 250.00, 'Ocupada', 1, 2);
INSERT INTO Habitacion (numero, precio_dias, estado, piso, id_hotel)
VALUES (201, 300.00, 'Mantenimiento', 2, 3);
INSERT INTO Habitacion (numero, precio_dias, estado, piso, id_hotel)
VALUES (202, 220.00, 'Disponible', 2, 4);
INSERT INTO Habitacion (numero, precio_dias, estado, piso, id_hotel)
VALUES (301, 400.00, 'Ocupada', 3, 5);

-- Inserts Cliente
INSERT INTO Cliente (nombre, apellido, email, telefono, pais)
VALUES ('Santiago', 'Rivas', 'santiago.rivas@gmail.com', '71234567', 'Argentina');
INSERT INTO Cliente (nombre, apellido, email, telefono, pais)
VALUES ('Valentina', 'Suárez', 'valesuarez@hotmail.com', '72345678', 'Chile');
INSERT INTO Cliente (nombre, apellido, email, telefono, pais)
VALUES ('Mateo', 'Ortega', 'mateo.ortega@yahoo.com', '73456789', 'Perú');
INSERT INTO Cliente (nombre, apellido, email, telefono, pais)
VALUES ('Camila', 'Lagos', 'camila.lagos@gmail.com', '74567890', 'Uruguay');
INSERT INTO Cliente (nombre, apellido, email, telefono, pais)
VALUES ('Ignacio', 'Torres', 'ignacio.torres@hotmail.com', '75678901', 'Colombia');

-- Inserts Empleado
INSERT INTO Empleado (nombre, apellido, salario)
VALUES ('Julieta', 'Mansilla', 2100.00);
INSERT INTO Empleado (nombre, apellido, salario)
VALUES ('Bruno', 'Salazar', 2300.00);
INSERT INTO Empleado (nombre, apellido, salario)
VALUES ('Lucía', 'Herrera', 2250.00);
INSERT INTO Empleado (nombre, apellido, salario)
VALUES ('Tomás', 'Vega', 2400.00);
INSERT INTO Empleado (nombre, apellido, salario)
VALUES ('Martina', 'Roldán', 2200.00);

-- Inserts Reservan
INSERT INTO Reserva (estado_reserva, fecha_pago, fecha_inicio, fecha_final, monto, id_cliente, id_habitacion) VALUES ('Pagado', '2025-11-01', '2025-11-08', '2025-11-13', 1000.00, 1, 1);
INSERT INTO Reserva (estado_reserva, fecha_pago, fecha_inicio, fecha_final, monto, id_cliente, id_habitacion) VALUES ('Pagado', '2025-2-02', '2025-9-06', '2025-9-08', 500.00, 2, 2);
INSERT INTO Reserva (estado_reserva, fecha_pago, fecha_inicio, fecha_final, monto, id_cliente, id_habitacion) VALUES ('Pagado', '2025-3-03', '2025-5-07', '2025-5-12', 800.00, 3, 3);
INSERT INTO Reserva (estado_reserva, fecha_pago, fecha_inicio, fecha_final, monto, id_cliente, id_habitacion) VALUES ('Pagado', '2025-9-04', '2025-10-10', '2025-10-15', 1100.00, 4, 4);
INSERT INTO Reserva (estado_reserva, fecha_pago, fecha_inicio, fecha_final, monto, id_cliente, id_habitacion) VALUES ('Pagado', '2025-12-05', '2025-12-11', '2025-12-14', 900.00, 5, 5);
INSERT INTO Reserva (estado_reserva, fecha_pago, fecha_inicio, fecha_final, monto, id_cliente, id_habitacion) VALUES ('Pagado', '2025-11-06', '2025-11-12', '2025-11-16', 1200.00, 1, 2);
INSERT INTO Reserva (estado_reserva, fecha_pago, fecha_inicio, fecha_final, monto, id_cliente, id_habitacion) VALUES ('Pagado', '2025-6-07', '2025-11-13', '2025-11-18', 950.00, 2, 3);
INSERT INTO Reserva (estado_reserva, fecha_pago, fecha_inicio, fecha_final, monto, id_cliente, id_habitacion) VALUES ('Pagado', '2025-2-08', '2025-2-14', '2025-2-19', 1100.00, 3, 4);
INSERT INTO Reserva (estado_reserva, fecha_pago, fecha_inicio, fecha_final, monto, id_cliente, id_habitacion) VALUES ('Pagado', '2025-3-09', '2025-11-15', '2025-11-20', 1250.00, 4, 5);
INSERT INTO Reserva (estado_reserva, fecha_pago, fecha_inicio, fecha_final, monto, id_cliente, id_habitacion) VALUES ( 'Pagado', '2025-2-10', '2025-2-16', '2025-2-21', 1050.00, 5, 1);
INSERT INTO Reserva (estado_reserva, fecha_pago, fecha_inicio, fecha_final, monto, id_cliente, id_habitacion) VALUES ( 'Pagado', '2025-3-11', '2025-12-17', '2025-12-22', 1300.00, 1, 3);
INSERT INTO Reserva (estado_reserva, fecha_pago, fecha_inicio, fecha_final, monto, id_cliente, id_habitacion) VALUES ( 'Pagado', '2025-10-12', '2025-12-18', '2025-12-23', 1150.00, 2, 4);
INSERT INTO Reserva (estado_reserva, fecha_pago, fecha_inicio, fecha_final, monto, id_cliente, id_habitacion) VALUES ( 'Pagado', '2025-12-13', '2025-12-19', '2025-12-24', 1000.00, 3, 5);
INSERT INTO Reserva (estado_reserva, fecha_pago, fecha_inicio, fecha_final, monto, id_cliente, id_habitacion) VALUES ( 'Pagado', '2025-8-14', '2025-12-20', '2025-12-25', 950.00, 4, 1);
INSERT INTO Reserva (estado_reserva, fecha_pago, fecha_inicio, fecha_final, monto, id_cliente, id_habitacion) VALUES ( 'Pagado', '2025-7-15', '2025-12-21', '2025-12-26', 1200.00, 5, 2);
INSERT INTO Reserva (estado_reserva, fecha_pago, fecha_inicio, fecha_final, monto, id_cliente, id_habitacion) VALUES ( 'Pagado', '2025-3-16', '2025-11-11', '2025-11-16', 1100.00, 1, 4);
INSERT INTO Reserva (estado_reserva, fecha_pago, fecha_inicio, fecha_final, monto, id_cliente, id_habitacion) VALUES ( 'Pagado', '2025-5-17', '2025-7-23', '2025-7-28', 1250.00, 2, 5);
INSERT INTO Reserva (estado_reserva, fecha_pago, fecha_inicio, fecha_final, monto, id_cliente, id_habitacion) VALUES ( 'Pagado', '2025-4-18', '2025-11-09', '2025-11-14', 1050.00, 3, 1);
INSERT INTO Reserva (estado_reserva, fecha_pago, fecha_inicio, fecha_final, monto, id_cliente, id_habitacion) VALUES ( 'Pagado', '2025-9-19', '2025-10-25', '2025-10-30', 1150.00, 4, 2);
INSERT INTO Reserva (estado_reserva, fecha_pago, fecha_inicio, fecha_final, monto, id_cliente, id_habitacion) VALUES ( 'Pagado', '2025-11-20', '2025-12-26', '2025-12-31', 1300.00, 5, 3);

-- Inserts empleado_reserva
INSERT INTO empleado_reserva (id_reserva, id_empleado) VALUES (1, 1);
INSERT INTO empleado_reserva (id_reserva, id_empleado) VALUES (1, 2);
INSERT INTO empleado_reserva (id_reserva, id_empleado) VALUES (2, 2);
INSERT INTO empleado_reserva (id_reserva, id_empleado) VALUES (3, 3);
INSERT INTO empleado_reserva (id_reserva, id_empleado) VALUES (3, 4);
INSERT INTO empleado_reserva (id_reserva, id_empleado) VALUES (4, 5);
INSERT INTO empleado_reserva (id_reserva, id_empleado) VALUES (5, 1);
INSERT INTO empleado_reserva (id_reserva, id_empleado) VALUES (6, 2);
INSERT INTO empleado_reserva (id_reserva, id_empleado) VALUES (6, 3);
INSERT INTO empleado_reserva (id_reserva, id_empleado) VALUES (7, 4);
INSERT INTO empleado_reserva (id_reserva, id_empleado) VALUES (8, 5);
INSERT INTO empleado_reserva (id_reserva, id_empleado) VALUES (8, 1);
INSERT INTO empleado_reserva (id_reserva, id_empleado) VALUES (9, 2);
INSERT INTO empleado_reserva (id_reserva, id_empleado) VALUES (10, 3);
INSERT INTO empleado_reserva (id_reserva, id_empleado) VALUES (11, 4);
INSERT INTO empleado_reserva (id_reserva, id_empleado) VALUES (12, 5);
INSERT INTO empleado_reserva (id_reserva, id_empleado) VALUES (13, 1);
INSERT INTO empleado_reserva (id_reserva, id_empleado) VALUES (14, 2);
INSERT INTO empleado_reserva (id_reserva, id_empleado) VALUES (15, 3);
INSERT INTO empleado_reserva (id_reserva, id_empleado) VALUES (16, 4);
INSERT INTO empleado_reserva (id_reserva, id_empleado) VALUES (17, 5);
INSERT INTO empleado_reserva (id_reserva, id_empleado) VALUES (18, 1);
INSERT INTO empleado_reserva (id_reserva, id_empleado) VALUES (19, 2);
INSERT INTO empleado_reserva (id_reserva, id_empleado) VALUES (20, 3);

-- Inserts habitacion_servicio
INSERT INTO habitacion_servicio (id_servicio, id_habitacion) VALUES (1, 1);
INSERT INTO habitacion_servicio (id_servicio, id_habitacion) VALUES (2, 1);
INSERT INTO habitacion_servicio (id_servicio, id_habitacion) VALUES (3, 2);
INSERT INTO habitacion_servicio (id_servicio, id_habitacion) VALUES (4, 3);
INSERT INTO habitacion_servicio (id_servicio, id_habitacion) VALUES (5, 5);

-- Triggers

-- Cuando se crea una reserva, pone en "Ocupada" esa habitación
DELIMITER $$

CREATE TRIGGER ocupar_habitacion
AFTER INSERT ON Reserva
FOR EACH ROW
BEGIN
    UPDATE Habitacion
    SET estado = 'Ocupada'
    WHERE id_habitacion = NEW.id_habitacion;
END$$

DELIMITER ;

-- Cuando se elimina una reserva, pone en "Disponible" esa habitación
DELIMITER $$

CREATE TRIGGER desocupa_habitacion
AFTER DELETE ON Reserva
FOR EACH ROW
BEGIN
    UPDATE Habitacion
    SET estado = 'Disponible'
    WHERE id_habitacion = OLD.id_habitacion;
END$$

DELIMITER ;

-- Antes de insertar un empleado, si el salario < 2200, aumenta 10%
DELIMITER $$

CREATE TRIGGER empleado_aumento
BEFORE INSERT ON Empleado
FOR EACH ROW
BEGIN
    IF NEW.salario < 2200 THEN
        SET NEW.salario = NEW.salario * 1.10;
    END IF;
END$$

DELIMITER ;