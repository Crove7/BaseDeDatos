USE appHotel;

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
