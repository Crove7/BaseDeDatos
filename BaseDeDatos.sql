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
COMMIT;