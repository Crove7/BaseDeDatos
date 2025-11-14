DELIMITER $$

CREATE TRIGGER TR_Reserva_Concurrencia
BEFORE INSERT ON Reserva
FOR EACH ROW
BEGIN
    DECLARE conflicto INT;

    -- Cuenta cuántas reservas activas se superponen con las nuevas fechas
    SELECT COUNT(*) INTO conflicto
    FROM Reserva AS R
    WHERE 
        R.id_habitacion = NEW.id_habitacion 
        -- Fórmula de solapamiento:
        AND NEW.fecha_inicio < R.fecha_final 
        AND NEW.fecha_final > R.fecha_inicio;

    IF conflicto > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'ERROR DML: La habitación ya tiene una reserva activa que se solapa con estas fechas.';
    END IF;
END$$

DELIMITER $$

CREATE TRIGGER TR_Reserva_Validar_Estado
BEFORE INSERT ON Reserva
FOR EACH ROW
BEGIN
    DECLARE estado_actual VARCHAR(25);

    -- Obtener el estado actual de la habitación
    SELECT estado INTO estado_actual
    FROM Habitacion
    WHERE id_habitacion = NEW.id_habitacion;

    -- Si el estado es Mantenimiento o cualquier otro que no sea Disponible, fallar.
    IF estado_actual <> 'Disponible' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = CONCAT('ERROR DML: La habitación ', NEW.id_habitacion, ' no está disponible para reserva (Estado: ', estado_actual, ').');
    END IF;
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
