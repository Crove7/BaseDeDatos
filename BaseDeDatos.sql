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
    /* numero_piso INT(2) NOT NULL*/
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