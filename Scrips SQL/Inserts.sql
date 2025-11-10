USE appHotel;
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
INSERT INTO Reserva (estado_reserva, fecha_pago, fecha_inicio, fecha_final, monto, id_cliente, id_habitacion) VALUES ('Pagado', '2025-11-01', '2025-11-05', '2025-11-10', 1000.00, 1, 1);
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
INSERT INTO Reserva (estado_reserva, fecha_pago, fecha_inicio, fecha_final, monto, id_cliente, id_habitacion) VALUES ( 'Pagado', '2025-3-16', '2025-11-22', '2025-11-27', 1100.00, 1, 4);
INSERT INTO Reserva (estado_reserva, fecha_pago, fecha_inicio, fecha_final, monto, id_cliente, id_habitacion) VALUES ( 'Pagado', '2025-5-17', '2025-7-23', '2025-7-28', 1250.00, 2, 5);
INSERT INTO Reserva (estado_reserva, fecha_pago, fecha_inicio, fecha_final, monto, id_cliente, id_habitacion) VALUES ( 'Pagado', '2025-4-18', '2025-11-24', '2025-11-29', 1050.00, 3, 1);
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