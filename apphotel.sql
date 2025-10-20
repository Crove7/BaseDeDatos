-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3307
-- Tiempo de generación: 20-10-2025 a las 16:33:06
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `apphotel`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellido` varchar(20) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `telefono` char(8) NOT NULL,
  `pais` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nombre`, `apellido`, `email`, `telefono`, `pais`) VALUES
(1, 'Santiago', 'Rivas', 'santiago.rivas@gmail.com', '71234567', 'Argentina'),
(2, 'Valentina', 'Suárez', 'valesuarez@hotmail.com', '72345678', 'Chile'),
(3, 'Mateo', 'Ortega', 'mateo.ortega@yahoo.com', '73456789', 'Perú'),
(4, 'Camila', 'Lagos', 'camila.lagos@gmail.com', '74567890', 'Uruguay'),
(5, 'Ignacio', 'Torres', 'ignacio.torres@hotmail.com', '75678901', 'Colombia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `id_empleado` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellido` varchar(20) NOT NULL,
  `salario` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`id_empleado`, `nombre`, `apellido`, `salario`) VALUES
(1, 'Julieta', 'Mansilla', 2100.00),
(2, 'Bruno', 'Salazar', 2300.00),
(3, 'Lucía', 'Herrera', 2250.00),
(4, 'Tomás', 'Vega', 2400.00),
(5, 'Martina', 'Roldán', 2200.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado_reserva`
--

CREATE TABLE `empleado_reserva` (
  `id` int(11) NOT NULL,
  `id_reserva` int(11) NOT NULL,
  `id_empleado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleado_reserva`
--

INSERT INTO `empleado_reserva` (`id`, `id_reserva`, `id_empleado`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 2),
(4, 3, 3),
(5, 3, 4),
(6, 4, 5),
(7, 5, 1),
(8, 6, 2),
(9, 6, 3),
(10, 7, 4),
(11, 8, 5),
(12, 8, 1),
(13, 9, 2),
(14, 10, 3),
(15, 11, 4),
(16, 12, 5),
(17, 13, 1),
(18, 14, 2),
(19, 15, 3),
(20, 16, 4),
(21, 17, 5),
(22, 18, 1),
(23, 19, 2),
(24, 20, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habitacion`
--

CREATE TABLE `habitacion` (
  `id_habitacion` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `precio_dias` decimal(11,2) NOT NULL,
  `estado` varchar(25) DEFAULT NULL,
  `piso` int(11) NOT NULL,
  `id_hotel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `habitacion`
--

INSERT INTO `habitacion` (`id_habitacion`, `numero`, `precio_dias`, `estado`, `piso`, `id_hotel`) VALUES
(1, 101, 180.00, 'Disponible', 1, 1),
(2, 102, 250.00, 'Ocupada', 1, 2),
(3, 201, 300.00, 'Mantenimiento', 2, 3),
(4, 202, 220.00, 'Disponible', 2, 4),
(5, 301, 400.00, 'Ocupada', 3, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habitacion_servicio`
--

CREATE TABLE `habitacion_servicio` (
  `id` int(11) NOT NULL,
  `id_servicio` int(11) NOT NULL,
  `id_habitacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `habitacion_servicio`
--

INSERT INTO `habitacion_servicio` (`id`, `id_servicio`, `id_habitacion`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 2),
(4, 4, 3),
(5, 5, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hotel`
--

CREATE TABLE `hotel` (
  `id_hotel` int(11) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `calificacion` decimal(3,1) DEFAULT NULL,
  `id_Supervisor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `hotel`
--

INSERT INTO `hotel` (`id_hotel`, `direccion`, `calificacion`, `id_Supervisor`) VALUES
(1, 'Av. Independencia 123', 4.6, 1),
(2, 'Calle Las Rosas 456', 3.9, 2),
(3, 'Boulevard Central 789', 4.2, 3),
(4, 'Ruta Provincial 12 Km 34', 4.0, 4),
(5, 'Pasaje del Lago 321', 3.8, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservan`
--

CREATE TABLE `reservan` (
  `id_reserva` int(11) NOT NULL,
  `estado_reserva` enum('Pagado','No pagado') NOT NULL,
  `fecha_pago` date NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_final` date NOT NULL,
  `monto` decimal(11,2) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_habitacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reservan`
--

INSERT INTO `reservan` (`id_reserva`, `estado_reserva`, `fecha_pago`, `fecha_inicio`, `fecha_final`, `monto`, `id_cliente`, `id_habitacion`) VALUES
(1, 'Pagado', '2025-10-01', '2025-10-05', '2025-10-10', 1000.00, 1, 1),
(2, 'Pagado', '2025-10-02', '2025-10-06', '2025-10-08', 500.00, 2, 2),
(3, 'Pagado', '2025-10-03', '2025-10-07', '2025-10-12', 800.00, 3, 3),
(4, 'Pagado', '2025-10-04', '2025-10-10', '2025-10-15', 1100.00, 4, 4),
(5, 'Pagado', '2025-10-05', '2025-10-11', '2025-10-14', 900.00, 5, 5),
(6, 'Pagado', '2025-10-06', '2025-10-12', '2025-10-16', 1200.00, 1, 2),
(7, 'Pagado', '2025-10-07', '2025-10-13', '2025-10-18', 950.00, 2, 3),
(8, 'Pagado', '2025-10-08', '2025-10-14', '2025-10-19', 1100.00, 3, 4),
(9, 'Pagado', '2025-10-09', '2025-10-15', '2025-10-20', 1250.00, 4, 5),
(10, 'Pagado', '2025-10-10', '2025-10-16', '2025-10-21', 1050.00, 5, 1),
(11, 'Pagado', '2025-10-11', '2025-10-17', '2025-10-22', 1300.00, 1, 3),
(12, 'Pagado', '2025-10-12', '2025-10-18', '2025-10-23', 1150.00, 2, 4),
(13, 'Pagado', '2025-10-13', '2025-10-19', '2025-10-24', 1000.00, 3, 5),
(14, 'Pagado', '2025-10-14', '2025-10-20', '2025-10-25', 950.00, 4, 1),
(15, 'Pagado', '2025-10-15', '2025-10-21', '2025-10-26', 1200.00, 5, 2),
(16, 'Pagado', '2025-10-16', '2025-10-22', '2025-10-27', 1100.00, 1, 4),
(17, 'Pagado', '2025-10-17', '2025-10-23', '2025-10-28', 1250.00, 2, 5),
(18, 'Pagado', '2025-10-18', '2025-10-24', '2025-10-29', 1050.00, 3, 1),
(19, 'Pagado', '2025-10-19', '2025-10-25', '2025-10-30', 1150.00, 4, 2),
(20, 'Pagado', '2025-10-20', '2025-10-26', '2025-10-31', 1300.00, 5, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `id_servicio` int(11) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `nombre_servicio` varchar(50) NOT NULL,
  `costo` decimal(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `servicio`
--

INSERT INTO `servicio` (`id_servicio`, `descripcion`, `nombre_servicio`, `costo`) VALUES
(1, 'Baño privado con ducha, lavamanos y artículos de higiene personal', 'Baño estándar', 40.00),
(2, 'Baño con jacuzzi y amenities premium para relajación', 'Baño con jacuzzi', 120.00),
(3, 'Servicio de limpieza diaria y cambio de sábanas', 'Limpieza diaria', 35.00),
(4, 'Televisión por cable con más de 100 canales internacionales', 'TV por cable', 25.00),
(5, 'Mini bar con bebidas y snacks variados', 'Mini bar', 60.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `supervisor`
--

CREATE TABLE `supervisor` (
  `id_Supervisor` int(11) NOT NULL,
  `DNI` char(8) NOT NULL,
  `fecha_asignacion` date NOT NULL,
  `telefono` char(8) NOT NULL,
  `estado_laboral` varchar(50) NOT NULL,
  `salario` decimal(10,2) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellido` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `supervisor`
--

INSERT INTO `supervisor` (`id_Supervisor`, `DNI`, `fecha_asignacion`, `telefono`, `estado_laboral`, `salario`, `nombre`, `apellido`) VALUES
(1, '67890123', '2023-10-01', '76789012', 'Activo', 3700.00, 'Diego', 'Suárez'),
(2, '78901234', '2023-11-12', '77890123', 'Activo', 3550.00, 'Valeria', 'Romero'),
(3, '89012345', '2024-01-20', '78901234', 'Inactivo', 3100.00, 'Pablo', 'Herrera'),
(4, '90123456', '2024-03-02', '79012345', 'Suspendido', 2950.00, 'Rocío', 'García'),
(5, '91234567', '2024-04-15', '79123456', 'Activo', 3650.00, 'Tomás', 'Ríos'),
(6, '92345678', '2024-05-28', '79234567', 'Activo', 3400.00, 'Elena', 'Morales'),
(7, '93456789', '2024-07-09', '79345678', 'Inactivo', 3000.00, 'Andrés', 'Vega'),
(8, '94567890', '2024-08-22', '79456789', 'Activo', 3750.00, 'Claudia', 'Navarro'),
(9, '95678901', '2024-09-30', '79567890', 'Activo', 3800.00, 'Hernán', 'Campos'),
(10, '96789012', '2024-10-12', '79678901', 'Suspendido', 2900.00, 'Natalia', 'Fuentes');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id_empleado`);

--
-- Indices de la tabla `empleado_reserva`
--
ALTER TABLE `empleado_reserva`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_reserva` (`id_reserva`),
  ADD KEY `id_empleado` (`id_empleado`);

--
-- Indices de la tabla `habitacion`
--
ALTER TABLE `habitacion`
  ADD PRIMARY KEY (`id_habitacion`),
  ADD KEY `id_hotel` (`id_hotel`);

--
-- Indices de la tabla `habitacion_servicio`
--
ALTER TABLE `habitacion_servicio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_servicio` (`id_servicio`),
  ADD KEY `id_habitacion` (`id_habitacion`);

--
-- Indices de la tabla `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`id_hotel`),
  ADD KEY `id_Supervisor` (`id_Supervisor`);

--
-- Indices de la tabla `reservan`
--
ALTER TABLE `reservan`
  ADD PRIMARY KEY (`id_reserva`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_habitacion` (`id_habitacion`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`id_servicio`);

--
-- Indices de la tabla `supervisor`
--
ALTER TABLE `supervisor`
  ADD PRIMARY KEY (`id_Supervisor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `id_empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `empleado_reserva`
--
ALTER TABLE `empleado_reserva`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `habitacion`
--
ALTER TABLE `habitacion`
  MODIFY `id_habitacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `habitacion_servicio`
--
ALTER TABLE `habitacion_servicio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `hotel`
--
ALTER TABLE `hotel`
  MODIFY `id_hotel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `reservan`
--
ALTER TABLE `reservan`
  MODIFY `id_reserva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `id_servicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `supervisor`
--
ALTER TABLE `supervisor`
  MODIFY `id_Supervisor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `empleado_reserva`
--
ALTER TABLE `empleado_reserva`
  ADD CONSTRAINT `empleado_reserva_ibfk_1` FOREIGN KEY (`id_reserva`) REFERENCES `reservan` (`id_reserva`),
  ADD CONSTRAINT `empleado_reserva_ibfk_2` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`);

--
-- Filtros para la tabla `habitacion`
--
ALTER TABLE `habitacion`
  ADD CONSTRAINT `habitacion_ibfk_1` FOREIGN KEY (`id_hotel`) REFERENCES `hotel` (`id_hotel`);

--
-- Filtros para la tabla `habitacion_servicio`
--
ALTER TABLE `habitacion_servicio`
  ADD CONSTRAINT `habitacion_servicio_ibfk_1` FOREIGN KEY (`id_servicio`) REFERENCES `servicio` (`id_servicio`),
  ADD CONSTRAINT `habitacion_servicio_ibfk_2` FOREIGN KEY (`id_habitacion`) REFERENCES `habitacion` (`id_habitacion`);

--
-- Filtros para la tabla `hotel`
--
ALTER TABLE `hotel`
  ADD CONSTRAINT `hotel_ibfk_1` FOREIGN KEY (`id_Supervisor`) REFERENCES `supervisor` (`id_Supervisor`);

--
-- Filtros para la tabla `reservan`
--
ALTER TABLE `reservan`
  ADD CONSTRAINT `reservan_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `reservan_ibfk_2` FOREIGN KEY (`id_habitacion`) REFERENCES `habitacion` (`id_habitacion`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
