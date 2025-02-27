-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.27-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.4.0.6659
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para dbagencia
CREATE DATABASE IF NOT EXISTS `dbagencia` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;
USE `dbagencia`;

-- Volcando estructura para procedimiento dbagencia.clientes_mas_frecuentes_de_la_semana
DELIMITER //
CREATE PROCEDURE `clientes_mas_frecuentes_de_la_semana`()
BEGIN
    DECLARE start_date DATE;
    DECLARE end_date DATE;
    
    -- Variables para el cliente que más veces compró
    DECLARE cliente_mas_frecuente VARCHAR(8);
    DECLARE max_pasajes INT;
    
    -- Variables para el cliente que menos veces compró
    DECLARE cliente_menos_frecuente VARCHAR(8);
    DECLARE min_pasajes INT;
    
    -- Obtener el lunes de esta semana
    SET start_date = CURDATE() - INTERVAL WEEKDAY(CURDATE()) DAY;
    -- Obtener el domingo de esta semana
    SET end_date = start_date + INTERVAL 6 DAY;
    
    -- Obtener cliente que más veces compró pasajes en la semana
    SELECT id_cliente, COUNT(*) AS num_pasajes
    INTO cliente_mas_frecuente, max_pasajes
    FROM tbpasajes
    WHERE fecha BETWEEN start_date AND end_date
    GROUP BY id_cliente
    ORDER BY num_pasajes DESC
    LIMIT 1;
    
    -- Obtener cliente que menos veces compró pasajes en la semana
    SELECT id_cliente, COUNT(*) AS num_pasajes
    INTO cliente_menos_frecuente, min_pasajes
    FROM tbpasajes
    WHERE fecha BETWEEN start_date AND end_date
    GROUP BY id_cliente
    ORDER BY num_pasajes ASC
    LIMIT 1;
    
    -- Mostrar resultados
    SELECT 
        cliente_mas_frecuente AS 'Cliente con más pasajes comprados en la semana',
        max_pasajes AS 'Número de pasajes más comprados',
        cliente_menos_frecuente AS 'Cliente con menos pasajes comprados en la semana',
        min_pasajes AS 'Número de pasajes menos comprados';
    
END//
DELIMITER ;

-- Volcando estructura para procedimiento dbagencia.cliente_mas_frecuente_en_semana
DELIMITER //
CREATE PROCEDURE `cliente_mas_frecuente_en_semana`()
BEGIN
    DECLARE start_date DATE;
    DECLARE end_date DATE;
    DECLARE cliente_top VARCHAR(8);
    DECLARE max_pasajes INT;
    
    SET start_date = CURDATE() - INTERVAL WEEKDAY(CURDATE()) DAY; -- Obtener el lunes de esta semana
    SET end_date = start_date + INTERVAL 6 DAY; -- Obtener el domingo de esta semana
    
    SELECT id_cliente, COUNT(*) AS num_pasajes
    INTO cliente_top, max_pasajes
    FROM tbpasajes
    WHERE fecha BETWEEN start_date AND end_date
    GROUP BY id_cliente
    ORDER BY num_pasajes DESC
    LIMIT 1;
    
    SELECT cliente_top AS 'Cliente con más pasajes comprados en la semana', max_pasajes AS 'Número de pasajes';
END//
DELIMITER ;

-- Volcando estructura para procedimiento dbagencia.CRUDBuses
DELIMITER //
CREATE PROCEDURE `CRUDBuses`(
    IN action VARCHAR(10),
    IN bus_id INT,
    IN bus_placa VARCHAR(10),
    IN bus_modelo VARCHAR(50),
    IN bus_capacidad INT
)
BEGIN
    IF action = 'CREATE' THEN
        INSERT INTO tbbuses (placa, modelo, capacidad)
        VALUES (bus_placa, bus_modelo, bus_capacidad);
        
    ELSEIF action = 'READ' THEN
        SELECT * FROM tbbuses;
        
    ELSEIF action = 'UPDATE' THEN
        UPDATE tbbuses
        SET placa = bus_placa, modelo = bus_modelo, capacidad = bus_capacidad
        WHERE id_bus = bus_id;
        
    ELSEIF action = 'DELETE' THEN
        DELETE FROM tbbuses WHERE id_bus = bus_id;
        
    END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento dbagencia.CRUDCargo
DELIMITER //
CREATE PROCEDURE `CRUDCargo`(
	IN `action` VARCHAR(10),
	IN `cargo_id` INT,
	IN `cargo_name` VARCHAR(50),
	IN `cargo_description` VARCHAR(100)
)
BEGIN
    IF action = 'CREATE' THEN
        INSERT INTO tbcargo (cargo, descripcion)
        VALUES (cargo_name, cargo_description);
        
    ELSEIF action = 'READ' THEN
        SELECT * FROM tbcargo;
        
    ELSEIF action = 'UPDATE' THEN
        UPDATE tbcargo
        SET cargo = cargo_name, descripcion = cargo_description
        WHERE id_cargo = cargo_id;
        
    ELSEIF action = 'DELETE' THEN
        DELETE FROM tbcargo WHERE id_cargo = cargo_id;
        
    END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento dbagencia.CRUDCiudad
DELIMITER //
CREATE PROCEDURE `CRUDCiudad`(
    IN action VARCHAR(10),
    IN ciudad_id INT,
    IN ciudad_descripcion VARCHAR(50)
)
BEGIN
    IF action = 'CREATE' THEN
        INSERT INTO tbciudad (descripcion)
        VALUES (ciudad_descripcion);
        
    ELSEIF action = 'READ' THEN
        SELECT * FROM tbciudad;
        
    ELSEIF action = 'UPDATE' THEN
        UPDATE tbciudad
        SET descripcion = ciudad_descripcion
        WHERE idciudad = ciudad_id;
        
    ELSEIF action = 'DELETE' THEN
        DELETE FROM tbciudad WHERE idciudad = ciudad_id;
        
    END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento dbagencia.CRUDConductor
DELIMITER //
CREATE PROCEDURE `CRUDConductor`(
	IN `action` VARCHAR(10),
	IN `conductor_dni` INT,
	IN `conductor_licencia` VARCHAR(50),
	IN `conductor_nombre` VARCHAR(150),
	IN `conductor_apellido` VARCHAR(150)
)
BEGIN
    IF action = 'CREATE' THEN
        INSERT INTO tbconductor (dni, licencia, nombre, apellido)
        VALUES (conductor_dni, conductor_licencia, conductor_nombre, conductor_apellido);
        
    ELSEIF action = 'READ' THEN
        SELECT * FROM tbconductor;
        
    ELSEIF action = 'UPDATE' THEN
        UPDATE tbconductor
        SET licencia = conductor_licencia, nombre = conductor_nombre, apellido = conductor_apellido
        WHERE dni = conductor_dni;
        
    ELSEIF action = 'DELETE' THEN
        DELETE FROM tbconductor WHERE dni = conductor_dni;
        
    END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento dbagencia.CRUDEmpleados
DELIMITER //
CREATE PROCEDURE `CRUDEmpleados`(
	IN `action` VARCHAR(10),
	IN `empleado_id` INT,
	IN `empleado_dni` VARCHAR(8),
	IN `empleado_nombre` VARCHAR(50),
	IN `empleado_apellido` VARCHAR(50),
	IN `empleado_contraseña` VARCHAR(50),
	IN `empleado_id_cargo` INT
)
BEGIN
    IF action = 'CREATE' THEN
        INSERT INTO tbempleados (dni, nombre, apellido, contraseña, id_cargo)
        VALUES (empleado_dni, empleado_nombre, empleado_apellido, empleado_contraseña, empleado_id_cargo);
        
    ELSEIF action = 'READ' THEN
        SELECT * FROM tbempleados;
        
    ELSEIF action = 'UPDATE' THEN
        UPDATE tbempleados
        SET dni = empleado_dni, nombre = empleado_nombre, apellido = empleado_apellido, 
            contraseña = empleado_contraseña, id_cargo = empleado_id_cargo
        WHERE id_empleado = empleado_id;
        
    ELSEIF action = 'DELETE' THEN
        DELETE FROM tbempleados WHERE id_empleado = empleado_id;
        
    END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento dbagencia.listar_clientes_ultima_semana
DELIMITER //
CREATE PROCEDURE `listar_clientes_ultima_semana`()
BEGIN
    DECLARE start_date DATE;
    DECLARE end_date DATE;

    -- Definir fechas para la última semana
    SET start_date = CURDATE() - INTERVAL WEEKDAY(CURDATE()) DAY;
    SET end_date = start_date + INTERVAL 6 DAY;

    -- Consulta para obtener los clientes y la cantidad de pasajes comprados
    SELECT id_cliente, COUNT(*) AS num_pasajes
    FROM tbpasajes
    WHERE fecha >= start_date AND fecha < end_date
    GROUP BY id_cliente
    ORDER BY num_pasajes DESC;

END//
DELIMITER ;

-- Volcando estructura para procedimiento dbagencia.listar_clientes_ultimo_mes
DELIMITER //
CREATE PROCEDURE `listar_clientes_ultimo_mes`()
BEGIN
    DECLARE start_date DATE;
    DECLARE end_date DATE;

    -- Definir fechas para el último mes
    SET start_date = CURDATE() - INTERVAL DAYOFMONTH(CURDATE()) DAY; -- Primer día del mes actual
    SET end_date = CURDATE() + INTERVAL 1 DAY; -- Primer día del próximo mes
    

    -- Consulta para obtener los clientes y la cantidad de pasajes comprados
    SELECT id_cliente, COUNT(*) AS num_pasajes
    FROM tbpasajes
    WHERE fecha >= start_date AND fecha < end_date
    GROUP BY id_cliente
    ORDER BY num_pasajes DESC;

END//
DELIMITER ;

-- Volcando estructura para tabla dbagencia.tbasientos
CREATE TABLE IF NOT EXISTS `tbasientos` (
  `id_asiento` int(11) NOT NULL AUTO_INCREMENT,
  `id_bus` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `ocupado` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_asiento`),
  KEY `id_bus` (`id_bus`),
  CONSTRAINT `tbasientos_ibfk_1` FOREIGN KEY (`id_bus`) REFERENCES `tbbuses` (`id_bus`)
) ENGINE=InnoDB AUTO_INCREMENT=376 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla dbagencia.tbasientos: ~366 rows (aproximadamente)
INSERT INTO `tbasientos` (`id_asiento`, `id_bus`, `numero`, `ocupado`) VALUES
	(1, 1, 1, 0),
	(2, 1, 2, 0),
	(3, 1, 3, 0),
	(4, 1, 4, 0),
	(5, 1, 5, 0),
	(6, 1, 6, 0),
	(7, 1, 7, 0),
	(8, 1, 8, 0),
	(9, 1, 9, 0),
	(10, 1, 10, 0),
	(11, 1, 11, 0),
	(12, 1, 12, 0),
	(13, 1, 13, 0),
	(14, 1, 14, 0),
	(15, 1, 15, 0),
	(16, 1, 16, 0),
	(17, 1, 17, 0),
	(18, 1, 18, 0),
	(19, 1, 19, 0),
	(20, 1, 20, 0),
	(21, 1, 21, 0),
	(22, 1, 22, 0),
	(23, 1, 23, 0),
	(24, 1, 24, 0),
	(25, 1, 25, 0),
	(26, 1, 26, 0),
	(27, 1, 27, 0),
	(28, 1, 28, 0),
	(29, 1, 29, 0),
	(30, 1, 30, 0),
	(31, 1, 31, 0),
	(32, 1, 32, 0),
	(33, 1, 33, 0),
	(34, 1, 34, 0),
	(35, 1, 35, 0),
	(36, 1, 36, 0),
	(37, 1, 37, 0),
	(38, 1, 38, 0),
	(39, 1, 39, 0),
	(40, 1, 40, 0),
	(41, 1, 41, 0),
	(42, 1, 42, 0),
	(43, 1, 43, 0),
	(44, 1, 44, 0),
	(45, 1, 45, 0),
	(46, 1, 46, 0),
	(47, 1, 47, 0),
	(48, 1, 48, 0),
	(49, 1, 49, 0),
	(50, 1, 50, 0),
	(51, 2, 1, 0),
	(52, 2, 2, 0),
	(53, 2, 3, 0),
	(54, 2, 4, 0),
	(55, 2, 5, 0),
	(56, 2, 6, 0),
	(57, 2, 7, 0),
	(58, 2, 8, 0),
	(59, 2, 9, 0),
	(60, 2, 10, 0),
	(61, 2, 11, 0),
	(62, 2, 12, 0),
	(63, 2, 13, 0),
	(64, 2, 14, 0),
	(65, 2, 15, 0),
	(66, 2, 16, 0),
	(67, 2, 17, 0),
	(68, 2, 18, 0),
	(69, 2, 19, 0),
	(70, 2, 20, 0),
	(71, 2, 21, 0),
	(72, 2, 22, 0),
	(73, 2, 23, 0),
	(74, 2, 24, 0),
	(75, 2, 25, 0),
	(76, 2, 26, 0),
	(77, 2, 27, 0),
	(78, 2, 28, 0),
	(79, 2, 29, 0),
	(80, 2, 30, 0),
	(81, 2, 31, 0),
	(82, 2, 32, 0),
	(83, 2, 33, 0),
	(84, 2, 34, 0),
	(85, 2, 35, 0),
	(86, 2, 36, 0),
	(87, 2, 37, 0),
	(88, 2, 38, 0),
	(89, 2, 39, 0),
	(90, 2, 40, 0),
	(91, 2, 41, 0),
	(92, 2, 42, 0),
	(93, 2, 43, 0),
	(94, 2, 44, 0),
	(95, 2, 45, 0),
	(96, 2, 46, 0),
	(97, 2, 47, 0),
	(98, 2, 48, 0),
	(99, 2, 49, 0),
	(100, 2, 50, 0),
	(101, 3, 1, 0),
	(102, 3, 2, 0),
	(103, 3, 3, 0),
	(104, 3, 4, 0),
	(105, 3, 5, 0),
	(106, 3, 6, 0),
	(107, 3, 7, 0),
	(108, 3, 8, 0),
	(109, 3, 9, 0),
	(110, 3, 10, 0),
	(111, 3, 11, 0),
	(112, 3, 12, 0),
	(113, 3, 13, 0),
	(114, 3, 14, 0),
	(115, 3, 15, 0),
	(116, 3, 16, 0),
	(117, 3, 17, 0),
	(118, 3, 18, 0),
	(119, 3, 19, 0),
	(120, 3, 20, 0),
	(121, 3, 21, 0),
	(122, 3, 22, 0),
	(123, 3, 23, 0),
	(124, 3, 24, 0),
	(125, 3, 25, 0),
	(126, 3, 26, 0),
	(127, 3, 27, 0),
	(128, 3, 28, 0),
	(129, 3, 29, 0),
	(130, 3, 30, 0),
	(131, 3, 31, 0),
	(132, 3, 32, 0),
	(133, 3, 33, 0),
	(134, 3, 34, 0),
	(135, 3, 35, 0),
	(136, 3, 36, 0),
	(137, 3, 37, 0),
	(138, 3, 38, 0),
	(139, 3, 39, 0),
	(140, 3, 40, 0),
	(141, 3, 41, 0),
	(142, 3, 42, 0),
	(143, 3, 43, 0),
	(144, 3, 44, 0),
	(145, 3, 45, 0),
	(146, 3, 46, 0),
	(147, 3, 47, 0),
	(148, 3, 48, 0),
	(149, 3, 49, 0),
	(151, 4, 1, 0),
	(152, 4, 2, 0),
	(153, 4, 3, 0),
	(154, 4, 4, 0),
	(155, 4, 5, 0),
	(156, 4, 6, 0),
	(157, 4, 7, 0),
	(158, 4, 8, 0),
	(159, 4, 9, 0),
	(160, 4, 10, 0),
	(161, 4, 11, 0),
	(162, 4, 12, 0),
	(163, 4, 13, 0),
	(164, 4, 14, 0),
	(165, 4, 15, 0),
	(166, 4, 16, 0),
	(167, 4, 17, 0),
	(168, 4, 18, 0),
	(169, 4, 19, 0),
	(170, 4, 20, 0),
	(171, 4, 21, 0),
	(172, 4, 22, 0),
	(173, 4, 23, 0),
	(174, 4, 24, 0),
	(175, 4, 25, 0),
	(176, 4, 26, 0),
	(177, 4, 27, 0),
	(178, 4, 28, 0),
	(179, 4, 29, 0),
	(180, 4, 30, 0),
	(181, 4, 31, 0),
	(182, 4, 32, 0),
	(183, 4, 33, 0),
	(184, 4, 34, 0),
	(185, 4, 35, 0),
	(186, 4, 36, 0),
	(187, 4, 37, 0),
	(188, 4, 38, 0),
	(189, 4, 39, 0),
	(190, 4, 40, 0),
	(191, 4, 41, 0),
	(192, 4, 42, 0),
	(193, 4, 43, 0),
	(194, 4, 44, 0),
	(195, 4, 45, 0),
	(196, 4, 46, 0),
	(197, 4, 47, 0),
	(198, 4, 48, 0),
	(199, 4, 49, 0),
	(200, 4, 50, 0),
	(201, 5, 1, 0),
	(202, 5, 2, 0),
	(203, 5, 3, 0),
	(204, 5, 4, 0),
	(205, 5, 5, 0),
	(206, 5, 6, 0),
	(207, 5, 7, 0),
	(208, 5, 8, 0),
	(209, 5, 9, 0),
	(210, 5, 10, 0),
	(211, 5, 11, 0),
	(212, 5, 12, 0),
	(213, 5, 13, 0),
	(214, 5, 14, 0),
	(215, 5, 15, 0),
	(216, 5, 16, 0),
	(217, 5, 17, 0),
	(218, 5, 18, 0),
	(219, 5, 19, 0),
	(220, 5, 20, 0),
	(221, 5, 21, 0),
	(222, 5, 22, 0),
	(223, 5, 23, 0),
	(224, 5, 24, 0),
	(225, 5, 25, 0),
	(226, 5, 26, 0),
	(227, 5, 27, 0),
	(228, 5, 28, 0),
	(229, 5, 29, 0),
	(230, 5, 30, 0),
	(231, 5, 31, 0),
	(232, 5, 32, 0),
	(233, 5, 33, 0),
	(234, 5, 34, 0),
	(235, 5, 35, 0),
	(236, 5, 36, 0),
	(237, 5, 37, 0),
	(238, 5, 38, 0),
	(239, 5, 39, 0),
	(240, 5, 40, 0),
	(241, 5, 41, 0),
	(242, 5, 42, 0),
	(243, 5, 43, 0),
	(244, 5, 44, 0),
	(245, 5, 45, 0),
	(246, 5, 46, 0),
	(247, 5, 47, 0),
	(248, 5, 48, 0),
	(251, 6, 1, 0),
	(252, 6, 2, 0),
	(253, 6, 3, 0),
	(254, 6, 4, 0),
	(255, 6, 5, 0),
	(256, 6, 6, 0),
	(257, 6, 7, 0),
	(258, 6, 8, 0),
	(259, 6, 9, 0),
	(260, 6, 10, 0),
	(261, 6, 11, 0),
	(262, 6, 12, 0),
	(263, 6, 13, 0),
	(264, 6, 14, 0),
	(265, 6, 15, 0),
	(266, 6, 16, 0),
	(267, 6, 17, 0),
	(268, 6, 18, 0),
	(269, 6, 19, 0),
	(270, 6, 20, 0),
	(271, 6, 21, 0),
	(272, 6, 22, 0),
	(273, 6, 23, 0),
	(274, 6, 24, 0),
	(275, 6, 25, 0),
	(276, 6, 26, 0),
	(277, 6, 27, 0),
	(278, 6, 28, 0),
	(279, 6, 29, 0),
	(280, 6, 30, 0),
	(281, 6, 31, 0),
	(282, 6, 32, 0),
	(283, 6, 33, 0),
	(284, 6, 34, 0),
	(285, 6, 35, 0),
	(286, 6, 36, 0),
	(287, 6, 37, 0),
	(288, 6, 38, 0),
	(289, 6, 39, 0),
	(290, 6, 40, 0),
	(291, 6, 41, 0),
	(292, 6, 42, 0),
	(293, 6, 43, 0),
	(294, 6, 44, 0),
	(295, 6, 45, 0),
	(296, 6, 46, 0),
	(297, 6, 47, 0),
	(298, 6, 48, 0),
	(299, 6, 49, 0),
	(300, 6, 50, 0),
	(301, 7, 1, 0),
	(302, 7, 2, 0),
	(303, 7, 3, 0),
	(304, 7, 4, 0),
	(305, 7, 5, 0),
	(306, 7, 6, 0),
	(307, 7, 7, 0),
	(308, 7, 8, 0),
	(309, 7, 9, 0),
	(310, 7, 10, 0),
	(311, 7, 11, 0),
	(312, 7, 12, 0),
	(313, 7, 13, 0),
	(314, 7, 14, 0),
	(315, 7, 15, 0),
	(316, 7, 16, 0),
	(317, 7, 17, 0),
	(318, 7, 18, 0),
	(319, 7, 19, 0),
	(320, 7, 20, 0),
	(321, 7, 21, 0),
	(322, 7, 22, 0),
	(323, 7, 23, 0),
	(324, 7, 24, 0),
	(325, 7, 25, 0),
	(326, 7, 26, 0),
	(327, 7, 27, 0),
	(328, 7, 28, 0),
	(329, 7, 29, 0),
	(330, 7, 30, 0),
	(331, 7, 31, 0),
	(332, 7, 32, 0),
	(333, 7, 33, 0),
	(334, 7, 34, 0),
	(335, 7, 35, 0),
	(336, 7, 36, 0),
	(337, 7, 37, 0),
	(338, 7, 38, 0),
	(339, 7, 39, 0),
	(340, 7, 40, 0),
	(341, 7, 41, 0),
	(342, 7, 42, 0),
	(343, 7, 43, 0),
	(344, 7, 44, 0),
	(345, 7, 45, 0),
	(346, 7, 46, 0),
	(347, 7, 47, 0),
	(348, 7, 48, 0),
	(349, 7, 49, 0),
	(350, 7, 50, 0),
	(351, 7, 51, 0),
	(352, 7, 52, 0),
	(353, 7, 53, 0),
	(354, 2, 51, 0),
	(355, 2, 52, 0),
	(356, 4, 51, 0),
	(357, 4, 52, 0),
	(358, 4, 53, 0),
	(359, 4, 54, 0),
	(360, 6, 51, 0),
	(361, 6, 52, 0),
	(362, 6, 53, 0),
	(363, 6, 54, 0),
	(364, 6, 55, 0),
	(365, 6, 56, 0),
	(366, 6, 57, 0),
	(367, 6, 58, 0),
	(368, 6, 59, 0);

-- Volcando estructura para tabla dbagencia.tbbuses
CREATE TABLE IF NOT EXISTS `tbbuses` (
  `id_bus` int(11) NOT NULL AUTO_INCREMENT,
  `placa` varchar(10) NOT NULL,
  `modelo` varchar(50) NOT NULL,
  `capacidad` int(11) NOT NULL,
  PRIMARY KEY (`id_bus`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla dbagencia.tbbuses: ~13 rows (aproximadamente)
INSERT INTO `tbbuses` (`id_bus`, `placa`, `modelo`, `capacidad`) VALUES
	(1, 'ABC123', 'Mercedes-Benz Tourismo', 50),
	(2, 'DEF456', 'Volvo 9700', 52),
	(3, 'GHI789', 'Scania K410', 49),
	(4, 'JKL012', 'MAN Lion’s Coach', 54),
	(5, 'MNO345', 'Iveco Bus Crossway', 48),
	(6, 'PQR678', 'Setra S 517 HD', 59),
	(7, 'STU901', 'Mercedes-Benz Intouro', 53),
	(8, '124WIB', 'GTO', 48),
	(9, '456XYC', 'Sportvan G30', 52),
	(10, '789RFD', 'Forester', 49),
	(11, '132KFAR', 'Mazda6', 60),
	(12, '894JKU', 'SLR McLaren', 51);

-- Volcando estructura para tabla dbagencia.tbcargo
CREATE TABLE IF NOT EXISTS `tbcargo` (
  `id_cargo` int(11) NOT NULL AUTO_INCREMENT,
  `cargo` varchar(50) NOT NULL DEFAULT '',
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`id_cargo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla dbagencia.tbcargo: ~4 rows (aproximadamente)
INSERT INTO `tbcargo` (`id_cargo`, `cargo`, `descripcion`) VALUES
	(1, 'Gerente General', 'Responsable de la gestión y dirección estratégica de la agencia.'),
	(2, 'Administrador de Operaciones', 'Supervisa las operaciones diarias de la flota de buses, incluyendo mantenimiento y programaciones.'),
	(3, 'Agente de Ventas', 'Atiende a los clientes en la compra de pasajes y otras consultas.'),
	(4, 'Chofer de Bus', 'Conduce los buses, siendo responsable del transporte seguro de los pasajeros.'),
	(5, 'Servicios', 'ORDEN Y LIMPIEZA XD');

-- Volcando estructura para tabla dbagencia.tbciudad
CREATE TABLE IF NOT EXISTS `tbciudad` (
  `idciudad` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`idciudad`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla dbagencia.tbciudad: ~23 rows (aproximadamente)
INSERT INTO `tbciudad` (`idciudad`, `descripcion`) VALUES
	(1, 'Tacna'),
	(2, 'Cuzco'),
	(3, 'Arequipa'),
	(4, 'La Libertad'),
	(5, 'Pasco'),
	(6, 'Puno'),
	(7, 'Lima'),
	(8, 'Ayacucho'),
	(9, 'Ica'),
	(10, 'Callao'),
	(11, 'Piura'),
	(12, 'Tumbes'),
	(13, 'Lambayeque'),
	(14, 'Ucayali'),
	(15, 'San Martin'),
	(16, 'Moquegua'),
	(17, 'Madre de Dios'),
	(18, 'Loreto'),
	(19, 'Junin'),
	(20, 'Huanuco'),
	(21, 'Huancavelica'),
	(22, 'Ancash'),
	(23, 'Amazonas'),
	(24, 'Apurimac'),
	(25, 'Cajamarca');

-- Volcando estructura para tabla dbagencia.tbcliente
CREATE TABLE IF NOT EXISTS `tbcliente` (
  `dni` varchar(8) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `celular` varchar(9) NOT NULL,
  `email` varchar(100) NOT NULL,
  `clave` varchar(20) NOT NULL,
  PRIMARY KEY (`dni`),
  UNIQUE KEY `dni` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla dbagencia.tbcliente: ~130 rows (aproximadamente)
INSERT INTO `tbcliente` (`dni`, `nombre`, `apellido`, `celular`, `email`, `clave`) VALUES
	('10101010', 'epis', 'upt', '123456789', '10@gmail.com', '1234'),
	('10747543', 'Wallie', 'Kubacek', '484897115', 'wkubacek21@flickr.com', '6109Nkm'),
	('11111110', 'epis', 'upt', '123456789', '11@gmail.com', '1234'),
	('11111111', 'epis', 'upt', '123456789', '1@gmail.com', '1234'),
	('12121212', 'epis', 'upt', '123456789', '12@gmail.com', '1234'),
	('12386663', 'Flossi', 'McIlvoray', '820815408', 'fmcilvoray1i@latimes.com', '0578'),
	('13131313', 'epis', 'upt', '123456789', '13@gmail.com', '1234'),
	('14047592', 'Kingsley', 'Franies', '148980008', 'kfraniesi@php.net', '1234'),
	('14141414', 'epis', 'upt', '123456789', '14@gmail.com', '1234'),
	('14502914', 'Gasper', 'Leeson', '167243253', 'gleeson1d@earthlink.net', '9298\nb'),
	('15151515', 'epis', 'upt', '123456789', '15@gmail.com', '1234'),
	('15665458', 'Callean', 'Izakof', '277285908', 'cizakof2k@angelfire.com', '1234'),
	('16161616', 'epis', 'upt', '123456789', '16@gmail.com', '1234'),
	('16971686', 'Morty', 'Culshew', '991947287', 'mculshew1f@phoca.cz', '1234'),
	('17171717', 'epis', 'upt', '123456789', '17@gmail.com', '1234'),
	('17798120', 'Addi', 'Marsden', '146718668', 'amarsden28@oracle.com', '1234'),
	('18181818', 'epis', 'upt', '123456789', '18@gmail.com', '1234'),
	('19191919', 'epis', 'upt', '123456789', '19@gmail.com', '1234'),
	('19265261', 'Eziechiele', 'Saunt', '108989149', 'esaunt27@cloudflare.com', '3112'),
	('19965300', 'Sashenka', 'De Roeck', '172359167', 'sderoeck2@youtube.com', '1234'),
	('20202020', 'epis', 'upt', '123456789', '20@gmail.com', '1234'),
	('20790991', 'Joelynn', 'Gethyn', '688445323', 'jgethynt@accuweather.com', '1234'),
	('21212121', 'epis', 'upt', '123456789', '21@gmail.com', '1234'),
	('21389308', 'Gwen', 'Oliphard', '156146760', 'goliphard1n@tripadvisor.com', '5914'),
	('22222222', 'epis', 'upt', '123456789', '2@gmail.com', '1234'),
	('22232323', 'epis', 'upt', '123456789', '22@gmail.com', '1234'),
	('22642651', 'Sabina', 'Dunckley', '949774299', 'sdunckley1p@noaa.gov', '1234'),
	('23242424', 'epis', 'upt', '123456789', '23@gmail.com', '1234'),
	('24252525', 'epis', 'upt', '123456789', '24@gmail.com', '1234'),
	('24255973', 'Gayleen', 'Olivi', '812450367', 'golivi1l@google.es', '1234'),
	('25262626', 'epis', 'upt', '123456789', '25@gmail.com', '1234'),
	('25283781', 'Janek', 'Barcke', '477717890', 'jbarcked@chron.com', '1912q'),
	('26272727', 'epis', 'upt', '123456789', '26@gmail.com', '1234'),
	('26286145', 'Pippo', 'Connold', '443881471', 'pconnoldw@ucsd.edu', '1234'),
	('26386304', 'Alberik', 'Stelfax', '946702489', 'astelfax2j@psu.edu', '1234'),
	('26835906', 'Ashley', 'Le Barr', '265465913', 'alebarr25@patch.com', '1234'),
	('27282828', 'epis', 'upt', '123456789', '27@gmail.com', '1234'),
	('27367350', 'Marcy', 'Lampet', '158208013', 'mlampetr@businessinsider.com', '1234'),
	('27472595', 'Woody', 'Yashin', '683792004', 'wyashin2h@jalbum.net', '1234'),
	('28292929', 'epis', 'upt', '123456789', '28@gmail.com', '1234'),
	('29202020', 'epis', 'upt', '123456789', '29@gmail.com', '1234'),
	('30313131', 'epis', 'upt', '123456789', '30@gmail.com', '1234'),
	('31197110', 'Kaleena', 'Duchatel', '260964101', 'kduchatel15@ebay.co.uk', '1667VY'),
	('31578213', 'Martelle', 'Etock', '237199541', 'metock11@pen.io', '1234'),
	('31982731', 'Thorsten', 'Butcher', '946112325', 'tbutcher10@bravesites.com', '5347p)g'),
	('32259723', 'Art', 'Dysert', '358643729', 'adyserty@hostgator.com', '1234'),
	('32487634', 'Isidor', 'Penny', '122565284', 'ipenny2c@sun.com', '1234'),
	('33333333', 'epis', 'upt', '123456789', '3@gmail.com', '1234'),
	('33447771', 'Jarrett', 'Harness', '462517844', 'jharness1m@nba.com', '1234'),
	('34626858', 'Jephthah', 'Lightoller', '653642605', 'jlightollerv@multiply.com', '0265'),
	('35176160', 'Redd', 'Lowless', '222554507', 'rlowless12@cbsnews.com', '1234'),
	('35727936', 'Marybeth', 'Redwall', '110409042', 'mredwall2a@bigcartel.com', '74550c'),
	('36587143', 'Sarine', 'Largent', '619222526', 'slargenta@dot.gov', '4674'),
	('38383013', 'Raynard', 'Paoli', '628726188', 'rpaoli4@geocities.jp', '1234'),
	('40579302', 'Tito', 'Delyth', '826961763', 'tdelyth9@nhs.uk', '2243k'),
	('40948315', 'Vick', 'Eltringham', '146906390', 'veltringham1r@indiatimes.com', '1234'),
	('43676282', 'Paulette', 'Winchurch', '669860327', 'pwinchurch1w@eventbrite.com', '5154VIfG'),
	('43954115', 'Shannan', 'Hawtrey', '109979136', 'shawtrey17@marketwatch.com', '1234'),
	('44158794', 'Zack', 'Lazar', '305189331', 'zlazar1h@irs.gov', '1234'),
	('44195307', 'Mischa', 'Carcas', '634488943', 'mcarcas2b@icio.us', '68159a'),
	('44204922', 'Chick', 'Gisburne', '417379043', 'cgisburneo@unesco.org', '8011'),
	('44444444', 'epis', 'upt', '123456789', '4@gmail.com', '1234'),
	('45205174', 'Benedikta', 'Exon', '980448963', 'bexonj@google.com.hk', '1234'),
	('45953367', 'Randee', 'Branche', '626271986', 'rbranche13@economist.com', '1234'),
	('46641809', 'Judas', 'Iacovone', '388418509', 'jiacovone2g@artisteer.com', '1234'),
	('46870446', 'Editha', 'Dumbleton', '814898650', 'edumbleton2r@histats.com', '4981'),
	('48577340', 'Regan', 'Tawn', '876145759', 'rtawns@bigcartel.com', '20795JmQ'),
	('48882693', 'Rosy', 'Kelf', '143696903', 'rkelf2o@issuu.com', '9790'),
	('50379252', 'Vivia', 'Coppeard', '861845005', 'vcoppeardh@slate.com', '1234'),
	('50563262', 'Merrick', 'Jillings', '183944613', 'mjillings1z@list-manage.com', '1234'),
	('51758736', 'Bobbie', 'Somes', '716376976', 'bsomesf@senate.gov', '5079M'),
	('52580927', 'Gino', 'Hamp', '418685922', 'ghampq@4shared.com', '1234'),
	('52737140', 'Heidi', 'Hurche', '217147204', 'hhurche1c@posterous.com', '1234'),
	('53355820', 'Lucilia', 'Batsford', '584551517', 'lbatsfordu@yelp.com', '5812VA'),
	('53551097', 'Torie', 'Burke', '181467887', 'tburkeg@independent.co.uk', '1234'),
	('55204037', 'Jesus', 'Franzonetti', '372552058', 'jfranzonetti2q@cocolog-nifty.com', '1234'),
	('55548108', 'Brinna', 'Chick', '363292480', 'bchicke@google.cn', '1636'),
	('55555555', 'epis', 'upt', '555555555', '5@upt.pe', '1234'),
	('58607513', 'Delainey', 'Amis', '586266959', 'damisk@soundcloud.com', '0318C'),
	('60743292', 'Marcela', 'Grzes', '237366099', 'mgrzes18@techcrunch.com', '9243'),
	('61396754', 'Lancelot', 'Petruskevich', '901932211', 'lpetruskevich1s@oakley.com', '1445b'),
	('61701664', 'Roxy', 'Charrier', '163771721', 'rcharrier29@ox.ac.uk', '2512Uy'),
	('62820321', 'Ursa', 'Stennes', '152430001', 'ustennes1y@constantcontact.com', '1234'),
	('62888331', 'Marisa', 'Thomazet', '715170585', 'mthomazetc@tripod.com', '0060l'),
	('63122374', 'Jaquenetta', 'Ablott', '562907134', 'jablott1x@aboutads.info', '2806S'),
	('63583395', 'Sibley', 'Jedrzejewsky', '110959939', 'sjedrzejewsky8@census.gov', '33255'),
	('64173845', 'Kyrstin', 'Bodell', '969507880', 'kbodell1e@jalbum.net', '8785gQ'),
	('64741168', 'Sinclare', 'Tennet', '737226061', 'stennet16@wp.com', '6490KQRz'),
	('66666666', 'epis', 'upt', '123456789', '6@gmail.com', '1234'),
	('68405743', 'Omar', 'Mackleden', '302507992', 'omackleden2n@ameblo.jp', '1234'),
	('68446898', 'Angus', 'Farrant', '394880791', 'afarrant2f@cornell.edu', '1234'),
	('69806425', 'Rolfe', 'O\'Regan', '334169470', 'roregan22@skype.com', '7067k'),
	('70361490', 'Alyce', 'Ivashin', '424420274', 'aivashin1q@time.com', '7361C'),
	('71049171', 'Gerhard', 'Gregolotti', '685104950', 'ggregolotti2m@nih.gov', '1234'),
	('72799022', 'Kati', 'Clarage', '440351753', 'kclaragep@icq.com', '7805'),
	('72843682', 'Sebastien', 'Wackly', '612442878', 'swacklyz@gnu.org', '2512ba'),
	('74318275', 'Davin', 'Oriel', '894922889', 'doriel1j@pen.io', '1234'),
	('75932894', 'Giselle', 'Dahlbom', '219125057', 'gdahlbom23@macromedia.com', '1234'),
	('75990637', 'Carolan', 'Soal', '959817995', 'csoalb@fc2.com', '1234'),
	('76058061', 'Travis', 'Storah', '423386780', 'tstorah1o@ovh.net', '1234'),
	('77426122', 'Osbert', 'Lamas', '693768274', 'olamas1g@simplemachines.org', '1234'),
	('77777777', 'epis', 'upt', '123456789', '7@gmail.com', '1234'),
	('78243534', 'Alexandre', 'Dorset', '202697279', 'adorset1a@yelp.com', '1234'),
	('80414767', 'Feodor', 'Balharrie', '640349813', 'fbalharrie2p@unblog.fr', '1234'),
	('82234647', 'Robenia', 'Rosario', '142647228', 'rrosario24@naver.com', '1234'),
	('82278010', 'Bonny', 'Crosetto', '812391953', 'bcrosetto14@exblog.jp', '1234'),
	('83317964', 'Renata', 'Ottey', '983358433', 'rottey1b@apple.com', '1234'),
	('83416808', 'Mella', 'Riach', '789401142', 'mriach1t@ustream.tv', '1234'),
	('83505652', 'Berton', 'Caisley', '782954323', 'bcaisley2d@umn.edu', '1234'),
	('84872631', 'Orville', 'Blazhevich', '833246735', 'oblazhevichn@nbcnews.com', '1234'),
	('85156865', 'Pyotr', 'Chattock', '403789441', 'pchattock26@ustream.tv', '1234'),
	('85436006', 'Kahlil', 'Vasyatkin', '687593692', 'kvasyatkin2l@purevolume.com', '1234'),
	('86725484', 'Delcina', 'Alben', '945900788', 'dalbenm@discovery.com', '1234'),
	('87209028', 'Tildy', 'Dorbin', '151405413', 'tdorbin2i@fc2.com', '1234'),
	('87277269', 'Kerry', 'Buston', '193757836', 'kbuston1u@jiathis.com', '1234'),
	('88888888', 'epis', 'upt', '123456789', '8@gmail.com', '1234'),
	('89362361', 'Viole', 'Nuth', '456394491', 'vnuth6@people.com.cn', '1234'),
	('89870438', 'Lavina', 'Piddlesden', '431564127', 'lpiddlesden20@hibu.com', '1234'),
	('91935135', 'Christie', 'Mackison', '351597488', 'cmackison3@tinyurl.com', '1234'),
	('93710486', 'Arne', 'Schuck', '904391486', 'aschuckl@washingtonpost.com', '1234'),
	('94927918', 'Dominik', 'Hamstead', '586224532', 'dhamstead1@google.co.uk', '1234'),
	('95495603', 'Gwenora', 'Jeavons', '636338153', 'gjeavons2e@bigcartel.com', '1234'),
	('96413749', 'Hobey', 'Colrein', '114602161', 'hcolrein19@fc2.com', '1234'),
	('97205524', 'Alysia', 'Breagan', '430839992', 'abreagan7@dailymail.co.uk', '1234'),
	('97236957', 'Marcel', 'McGrae', '514255805', 'mmcgrae1k@multiply.com', '1234'),
	('98791293', 'Ailee', 'Hache', '692997411', 'ahachex@i2i.jp', '1234'),
	('99522289', 'Margette', 'Theyer', '593584655', 'mtheyer1v@nyu.edu', '1234'),
	('99594784', 'Lauree', 'Garms', '492486681', 'lgarms0@theglobeandmail.com', '1234'),
	('99961145', 'Courtney', 'Melrose', '502925781', 'cmelrose5@sphinn.com', '1234'),
	('99999999', 'epis', 'upt', '123456789', '9@gmail.com', '1234');

-- Volcando estructura para tabla dbagencia.tbconductor
CREATE TABLE IF NOT EXISTS `tbconductor` (
  `dni` int(8) NOT NULL,
  `licencia` varchar(50) DEFAULT NULL,
  `nombre` varchar(150) DEFAULT NULL,
  `apellido` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`dni`),
  UNIQUE KEY `dni` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla dbagencia.tbconductor: ~2 rows (aproximadamente)
INSERT INTO `tbconductor` (`dni`, `licencia`, `nombre`, `apellido`) VALUES
	(49598245, '789546', 'Fabian', 'Chavez'),
	(70614176, '978456', 'Cesar', 'Chavez'),
	(74125887, 'AHD-12A', 'BRANT', 'CHATA');

-- Volcando estructura para tabla dbagencia.tbempleados
CREATE TABLE IF NOT EXISTS `tbempleados` (
  `id_empleado` int(11) NOT NULL AUTO_INCREMENT,
  `dni` varchar(8) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `contraseña` varchar(50) DEFAULT NULL,
  `id_cargo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_empleado`),
  KEY `id_cargo` (`id_cargo`),
  CONSTRAINT `tbempleados_ibfk_1` FOREIGN KEY (`id_cargo`) REFERENCES `tbcargo` (`id_cargo`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla dbagencia.tbempleados: ~7 rows (aproximadamente)
INSERT INTO `tbempleados` (`id_empleado`, `dni`, `nombre`, `apellido`, `contraseña`, `id_cargo`) VALUES
	(1, '70614175', 'Cesar', 'Chavez', '1234', 1),
	(2, '12345678', 'Antony', 'Chata', '1234', 2),
	(3, '23456789', 'Sebastian', 'Arce', '1234', 3),
	(4, '34567890', 'Victor', 'Aguilar', '1234', 4),
	(40, '111', ' aaa', 'bbb', '1234', 3),
	(42, '70754819', ' JULIO CESAR', 'ESPINAR DELGADO', '1234', 2),
	(52, '123', ' bbb', 'eee', '1234', 2),
	(53, '46578945', 'CESAR', 'CHAVEZ', '1234', 5);

-- Volcando estructura para tabla dbagencia.tbpasajes
CREATE TABLE IF NOT EXISTS `tbpasajes` (
  `id_pasaje` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` varchar(8) NOT NULL,
  `id_bus` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `destino` varchar(100) DEFAULT NULL,
  `id_ciudad_destino` int(11) NOT NULL,
  `id_ciudad_origen` int(11) NOT NULL,
  `asiento` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_pasaje`),
  KEY `id_bus` (`id_bus`),
  KEY `FK_tbpasajes_tbcliente` (`id_cliente`),
  KEY `id_ciudad` (`id_ciudad_destino`) USING BTREE,
  KEY `id_ciudad_origen` (`id_ciudad_origen`),
  KEY `FK_tbpasajes_tbasientos` (`asiento`),
  CONSTRAINT `FK_tbpasajes_tbbuses` FOREIGN KEY (`id_bus`) REFERENCES `tbbuses` (`id_bus`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbpasajes_tbciudad` FOREIGN KEY (`id_ciudad_destino`) REFERENCES `tbciudad` (`idciudad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbpasajes_tbciudad_2` FOREIGN KEY (`id_ciudad_origen`) REFERENCES `tbciudad` (`idciudad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbpasajes_tbcliente` FOREIGN KEY (`id_cliente`) REFERENCES `tbcliente` (`dni`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla dbagencia.tbpasajes: ~64 rows (aproximadamente)
INSERT INTO `tbpasajes` (`id_pasaje`, `id_cliente`, `id_bus`, `fecha`, `destino`, `id_ciudad_destino`, `id_ciudad_origen`, `asiento`) VALUES
	(1, '11111111', 1, '2024-05-14 15:27:21', 'Cuzco', 2, 1, 1),
	(2, '22222222', 2, '2024-06-16 01:11:11', 'Arequipa', 3, 1, 1),
	(3, '33333333', 3, '2024-06-17 01:00:00', 'La Libertad', 4, 3, 1),
	(4, '44444444', 4, '2024-06-18 22:22:22', 'Pasco', 5, 1, 1),
	(5, '11111111', 5, '2024-06-19 05:55:55', 'Puno', 6, 1, 1),
	(10, '17798120', 2, '2024-06-14 16:18:15', 'Lima', 7, 1, 1),
	(11, '11111111', 2, '2024-06-20 15:24:53', 'Lima', 7, 1, 2),
	(12, '11111111', 1, '2024-05-14 15:27:21', 'Cuzco', 2, 1, 2),
	(13, '22222222', 2, '2024-06-20 22:00:00', 'Ucayali', 14, 1, 2),
	(14, '33333333', 3, '2024-06-20 08:15:00', 'San Martin', 15, 1, 2),
	(15, '44444444', 4, '2024-06-20 06:30:00', 'Moquegua', 16, 1, 2),
	(17, '11111111', 2, '2024-06-20 15:35:03', 'Lima', 7, 1, 3),
	(18, '11111111', 2, '2024-06-20 15:30:30', 'Lima', 7, 1, 4),
	(21, '77777777', 2, '2024-06-20 15:48:37', 'Lima', 7, 1, 5),
	(22, '11111110', 2, '2024-06-25 15:30:58', 'Lima', 7, 1, 6),
	(23, '32259723', 2, '2024-06-25 15:31:26', 'Lima', 7, 9, 1),
	(24, '17798120', 4, '2024-06-25 15:32:01', 'Moquegua', 16, 7, 1),
	(25, '17798120', 4, '2024-06-25 15:32:46', 'Moquegua', 16, 7, 2),
	(26, '17798120', 4, '2024-06-25 16:16:38', 'Moquegua', 16, 7, 3),
	(27, '98791293', 1, '2024-06-25 16:17:30', 'Cuzco', 2, 1, 3),
	(28, '98791293', 1, '2024-06-25 16:18:01', 'Cuzco', 2, 1, 4),
	(29, '98791293', 1, '2024-06-25 16:18:30', 'Cuzco', 2, 1, 5),
	(30, '98791293', 1, '2024-06-25 16:18:30', 'Cuzco', 2, 1, 6),
	(31, '98791293', 1, '2024-06-25 16:18:30', 'Cuzco', 2, 1, 7),
	(32, '98791293', 1, '2024-06-25 16:18:30', 'Cuzco', 2, 1, 8),
	(33, '98791293', 1, '2024-06-25 16:18:30', 'Cuzco', 2, 1, 9),
	(34, '98791293', 1, '2024-06-25 16:18:30', 'Cuzco', 2, 1, 10),
	(35, '11111111', 1, '2024-06-25 16:19:30', 'Cuzco', 2, 1, 11),
	(36, '11111111', 1, '2024-06-25 16:19:30', 'Cuzco', 2, 1, 12),
	(37, '11111111', 1, '2024-06-25 16:19:30', 'Cuzco', 2, 1, 13),
	(38, '11111111', 1, '2024-06-25 16:19:30', 'Cuzco', 2, 1, 14),
	(39, '11111111', 1, '2024-06-25 16:19:30', 'Cuzco', 2, 1, 15),
	(40, '22222222', 1, '2024-06-25 16:19:30', 'Cuzco', 2, 1, 16),
	(41, '22222222', 1, '2024-06-25 16:19:30', 'Cuzco', 2, 1, 17),
	(42, '22222222', 1, '2024-06-25 16:19:30', 'Cuzco', 2, 1, 18),
	(43, '22222222', 1, '2024-06-25 16:19:30', 'Cuzco', 2, 1, 19),
	(44, '22222222', 1, '2024-06-25 16:19:30', 'Cuzco', 2, 1, 20),
	(45, '33333333', 1, '2024-06-25 16:19:30', 'Cuzco', 2, 1, 21),
	(46, '33333333', 1, '2024-06-25 16:19:30', 'Cuzco', 2, 1, 22),
	(47, '33333333', 1, '2024-06-25 16:19:30', 'Cuzco', 2, 1, 23),
	(48, '33333333', 1, '2024-06-25 16:19:30', 'Cuzco', 2, 1, 24),
	(49, '44444444', 1, '2024-06-25 16:19:30', 'Cuzco', 2, 1, 25),
	(50, '44444444', 1, '2024-06-25 16:19:30', 'Cuzco', 2, 1, 26),
	(51, '44444444', 1, '2024-06-25 16:19:30', 'Cuzco', 2, 1, 27),
	(52, '44444444', 1, '2024-06-25 16:19:30', 'Cuzco', 2, 1, 28),
	(53, '44444444', 1, '2024-06-25 16:19:30', 'Cuzco', 2, 1, 29),
	(54, '77777777', 1, '2024-06-25 16:19:30', 'Cuzco', 2, 1, 25),
	(55, '77777777', 1, '2024-06-25 16:19:30', 'Cuzco', 2, 1, 26),
	(56, '77777777', 1, '2024-06-25 16:19:30', 'Cuzco', 2, 1, 27),
	(57, '77777777', 1, '2024-06-25 16:19:30', 'Cuzco', 2, 1, 28),
	(58, '77777777', 1, '2024-06-25 16:19:30', 'Cuzco', 2, 1, 29),
	(59, '10101010', 1, '2024-06-25 16:19:30', 'Cuzco', 2, 1, 30),
	(60, '10101010', 1, '2024-06-25 16:19:30', 'Cuzco', 2, 1, 31),
	(61, '10101010', 1, '2024-06-25 16:19:30', 'Cuzco', 2, 1, 32),
	(62, '10101010', 1, '2024-06-25 16:19:30', 'Cuzco', 2, 1, 33),
	(63, '10101010', 1, '2024-06-25 16:19:30', 'Cuzco', 2, 1, 34),
	(64, '10747543', 1, '2024-06-25 16:19:30', 'Cuzco', 2, 1, 35),
	(65, '12121212', 1, '2024-06-25 16:19:30', 'Cuzco', 2, 1, 36),
	(66, '12121212', 1, '2024-06-25 16:19:30', 'Cuzco', 2, 1, 37),
	(67, '12121212', 1, '2024-06-25 16:19:30', 'Cuzco', 2, 1, 38),
	(68, '12121212', 1, '2024-06-25 16:19:30', 'Cuzco', 2, 1, 39),
	(69, '12121212', 1, '2024-06-25 16:19:30', 'Cuzco', 2, 1, 40),
	(70, '12121212', 1, '2024-06-25 16:19:30', 'Cuzco', 2, 1, 41),
	(71, '12121212', 1, '2024-06-25 16:19:30', 'Cuzco', 2, 1, 42),
	(72, '12121212', 1, '2024-06-25 16:19:30', 'Cuzco', 2, 1, 43),
	(73, '12121212', 1, '2024-06-25 16:19:30', 'Cuzco', 2, 1, 44),
	(74, '12121212', 1, '2024-06-25 16:19:30', 'Cuzco', 2, 1, 45),
	(75, '12386663', 1, '2024-06-25 16:19:30', 'Cuzco', 2, 1, 46),
	(76, '12386663', 1, '2024-06-25 16:19:30', 'Cuzco', 2, 1, 47),
	(77, '12386663', 1, '2024-06-25 16:19:30', 'Cuzco', 2, 1, 48),
	(78, '12386663', 1, '2024-06-25 16:19:30', 'Cuzco', 2, 1, 49),
	(79, '12386663', 1, '2024-06-25 16:19:30', 'Cuzco', 2, 1, 50);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
