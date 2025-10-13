DROP DATABASE IF EXISTS apphotel;
CREATE DATABASE appHotel;
USE appHotel;

-- Tabla: Supervisor
CREATE TABLE Supervisor (
    id_Supervisor INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
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
    id_hotel INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    calificacion DECIMAL(3,1),
    id_Supervisor INT NOT NULL,
    FOREIGN KEY (id_Supervisor) REFERENCES Supervisor(id_Supervisor)
);

-- Tabla: Servicio
CREATE TABLE Servicio (
    id_servicio INT PRIMARY KEY AUTO_INCREMENT,
    descripcion VARCHAR(200),
    nombre_servicio VARCHAR(50) NOT NULL,
    costo DECIMAL(11,2) NOT NULL
);

-- Tabla: Habitacion
CREATE TABLE Habitacion (
    id_habitacion INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    numero INT NOT NULL,
    precio_dias DECIMAL(11,2) NOT NULL,
    estado VARCHAR(25),
    piso INT NOT NULL,
    id_hotel INT NOT NULL,
    FOREIGN KEY (id_hotel) REFERENCES Hotel(id_hotel)
);

-- Tabla: habitacion_servicio (N:M)
CREATE TABLE habitacion_servicio (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    id_servicio INT NOT NULL,
    id_habitacion INT NOT NULL,
    FOREIGN KEY (id_servicio) REFERENCES Servicio(id_servicio),
    FOREIGN KEY (id_habitacion) REFERENCES Habitacion(id_habitacion)
);

-- Tabla: Cliente
CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    apellido VARCHAR(20) NOT NULL,
    email VARCHAR(30),
    telefono CHAR(8) NOT NULL,
    pais VARCHAR(20)
);

-- Tabla: Empleado
CREATE TABLE Empleado (
    id_empleado INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    apellido VARCHAR(20) NOT NULL,
    salario DECIMAL(10,2) NOT NULL
);

-- Tabla: Reservas
CREATE TABLE Reservan (
    id_reserva INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    fecha_pago DATE NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_final DATE NOT NULL,
    monto DECIMAL(11,2) NOT NULL,
    id_cliente INT NOT NULL,
    id_habitacion INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_habitacion) REFERENCES Habitacion(id_habitacion)
);

-- Tabla: empleado_reserva (N:M)
CREATE TABLE empleado_reserva (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    id_reserva INT NOT NULL,
    id_empleado INT NOT NULL,
    FOREIGN KEY (id_reserva) REFERENCES Reservan (id_reserva),
    FOREIGN KEY (id_empleado) REFERENCES Empleado (id_empleado)
);

-- Inserts

INSERT INTO Supervisor (DNI, fecha_asignacion, telefono, estado_laboral, salario, nombre, apellido)
VALUES 
('12345678', '2023-01-10', '71234567', 'Activo', 3200.00, 'Carlos', 'Gómez'),
('23456789', '2023-03-15', '72345678', 'Activo', 3400.00, 'Lucía', 'Martínez'),
('34567890', '2023-05-20', '73456789', 'Inactivo', 3100.00, 'Luis', 'Fernández'),
('45678901', '2023-07-25', '74567890', 'Activo', 3600.00, 'Ana', 'Pérez'),
('56789012', '2023-09-05', '75678901', 'Suspendido', 3000.00, 'Marta', 'Díaz');

INSERT INTO Hotel (direccion, calificacion, id_Supervisor)
VALUES 
('Av. Central 123', 4.5, 1),
('Calle Norte 456', 3.8, 2),
('Pasaje Sur 789', 4.0, 3),
('Boulevard Este 321', 4.2, 4),
('Callejón Oeste 654', 3.5, 5);

INSERT INTO Servicio (descripcion, nombre_servicio, costo)
VALUES
('Limpieza diaria de habitación', 'Limpieza', 45.00),
('Acceso a spa y sauna', 'Spa', 120.00),
('Servicio a la habitación 24h', 'Room Service', 85.00),
('Wi-Fi de alta velocidad', 'Internet', 30.00),
('Desayuno buffet', 'Desayuno', 60.00);

INSERT INTO Habitacion (numero, precio_dias, estado, piso, id_hotel)
VALUES 
(101, 200.00, 'Disponible', 1, 1),
(102, 250.00, 'Ocupada', 1, 1),
(201, 180.00, 'Disponible', 2, 2),
(202, 220.00, 'Mantenimiento', 2, 3),
(301, 300.00, 'Ocupada', 3, 4);

INSERT INTO Cliente (nombre, apellido, email, telefono, pais)
VALUES 
('Jorge', 'Santos', 'jorge@gmail.com', '74125896', 'Perú'),
('María', 'Fernández', 'mariaf@gmail.com', '78945612', 'Chile'),
('Pedro', 'Mendoza', 'pedro@yahoo.com', '75315948', 'Argentina'),
('Laura', 'López', 'laura@gmail.com', '79864532', 'Uruguay'),
('Ricardo', 'Torres', 'ricardo@hotmail.com', '71239876', 'Colombia');

INSERT INTO Empleado (nombre, apellido, salario)
VALUES 
('Ana', 'Ramírez', 2000.00),
('Luis', 'Pérez', 2200.00),
('Sofía', 'López', 2100.00),
('Martín', 'Castro', 2300.00),
('Camila', 'Silva', 2150.00);

INSERT INTO Reservan (fecha_pago, fecha_inicio, fecha_final, monto, id_cliente, id_habitacion)
VALUES 
('2025-10-01', '2025-10-05', '2025-10-10', 1000.00, 1, 1),
('2025-10-02', '2025-10-06', '2025-10-08', 500.00, 2, 2),
('2025-10-03', '2025-10-07', '2025-10-12', 800.00, 3, 3),
('2025-10-04', '2025-10-10', '2025-10-15', 1100.00, 4, 4),
('2025-10-05', '2025-10-11', '2025-10-14', 900.00, 5, 5);

INSERT INTO empleado_reserva (id_reserva, id_empleado)
VALUES 
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(4, 5);

INSERT INTO habitacion_servicio (id_servicio, id_habitacion)
VALUES 
(1, 1),  
(2, 1),  
(3, 2),  
(4, 3),  
(5, 5); 