CREATE TABLE Hotel(
	id_hotel INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    dirreccion VARCHAR(20) NOT NULL,
    calificacion INT(1)
);

CREATE TABLE Empleado(
	id_empleado INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nombre VARCHAR(20) NOT NULL,
	apellido VARCHAR(20) NOT NULL,
    salario DECIMAL(10,2) NOT NULL
);

CREATE TABLE Supervisor(
	id_Supervisor INT PRIMARY KEY NOT NULL,
    DNI INT(8) NOT NULL,
    fecha_asignacion DATE NOT NULL,
    telefono INT(8) NOT NULL,
    salario DECIMAL(10,2) NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    apellido VARCHAR(20) NOT NULL
);

CREATE TABLE Habitacion(
	id_habitacion INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    numero INT(2) NOT NULL,
    precio DECIMAL(11,2) NOT NULL,
    tipo VARCHAR(25),
    estado VARCHAR(25),
    fecha_inicio DATE NOT NULL,
    fecha_final DATE NOT NULL,
    piso INT(2) NOT NULL,
    nombre_piso VARCHAR(25)
    /* numero_piso INT(2) NOT NULL*/
);

CREATE TABLE Ambiente(
	id_ambiente INT PRIMARY KEY NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    dimension DECIMAL(3,2) NOT NULL,
    estado VARCHAR(20) NOT NULL
);

CREATE TABLE Reservan(
	id_reserva INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    fecha_pago DATE NOT NULL,
    monto DECIMAL(11,2) NOT NULL
);

CREATE TABLE Cliente(
	id_ambiente INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    apellido VARCHAR(20) NOT NULL,
    email VARCHAR(30),
    telefono INT(8) NOT NULL,
    pais VARCHAR(20)
);

CREATE TABLE Brinda(
	id_brinda INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	cantidad INT(1) NOT NULL,
    fecha DATE NOT NULL
    
); 

CREATE TABLE Servicio(
	id_servicio INT PRIMARY KEY,
    descripcion VARCHAR(200),
    nombre_servicio VARCHAR(20) NOT NULL,
    costo DECIMAL(11,2) NOT NULL
)