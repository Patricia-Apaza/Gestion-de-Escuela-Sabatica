-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 14, 2025 at 11:24 AM
-- Server version: 8.4.3
-- PHP Version: 8.3.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ges`
--

-- --------------------------------------------------------

--
-- Table structure for table `auditoria`
--

CREATE TABLE `auditoria` (
  `id_auditoria` bigint NOT NULL,
  `usuario_id` bigint NOT NULL,
  `accion` varchar(50) NOT NULL,
  `tabla_afectada` varchar(50) NOT NULL,
  `registro_id` bigint DEFAULT NULL,
  `datos_anteriores` json DEFAULT NULL,
  `datos_nuevos` json DEFAULT NULL,
  `fecha_accion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `direccion_ip` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` bigint NOT NULL,
  `nombre_completo` varchar(100) NOT NULL,
  `dni` varchar(20) NOT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `contraseña` varchar(255) NOT NULL,
  `rol` enum('SUPERADMIN','ADMIN','LIDER','INTEGRANTE') NOT NULL,
  `estado` enum('ACTIVO','BLOQUEADO','INACTIVO') DEFAULT 'ACTIVO',
  `facultad_carrera` varchar(100) DEFAULT NULL,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_modificacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creado_por` bigint DEFAULT NULL,
  `modificado_por` bigint DEFAULT NULL,
  `grupo_asignado` varchar(100) DEFAULT NULL,
  `acceso_temporal_hasta` datetime(6) DEFAULT NULL,
  `direccion` text,
  `fecha_nacimiento` date DEFAULT NULL,
  `intentos_fallidos` int DEFAULT NULL,
  `observaciones` text,
  `telefono` varchar(20) DEFAULT NULL,
  `ultimo_acceso` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre_completo`, `dni`, `correo`, `contraseña`, `rol`, `estado`, `facultad_carrera`, `fecha_creacion`, `fecha_modificacion`, `creado_por`, `modificado_por`, `grupo_asignado`, `acceso_temporal_hasta`, `direccion`, `fecha_nacimiento`, `intentos_fallidos`, `observaciones`, `telefono`, `ultimo_acceso`) VALUES
(1, 'Super Administrador', '12345678', 'superadmin@ges.edu', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'SUPERADMIN', 'ACTIVO', NULL, '2025-09-14 09:37:37', '2025-09-14 09:37:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'Admin Ingeniería', '87654321', 'admin.ing@ges.edu', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'ADMIN', 'ACTIVO', 'Ingeniería de Sistemas', '2025-09-14 09:37:37', '2025-09-14 09:37:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'Admin Teología', '11122233', 'admin.teo@ges.edu', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'ADMIN', 'ACTIVO', 'Teología', '2025-09-14 09:37:37', '2025-09-14 09:37:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'Líder Grupo A', '33344455', 'lider.a@ges.edu', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'LIDER', 'ACTIVO', 'Ingeniería de Sistemas', '2025-09-14 09:44:22', '2025-09-14 09:44:22', NULL, NULL, 'Grupo A - Sistemas', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'Líder Grupo B', '44455566', 'lider.b@ges.edu', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'LIDER', 'ACTIVO', 'Teología', '2025-09-14 09:44:22', '2025-09-14 09:44:22', NULL, NULL, 'Grupo B - Teología', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'Juan Pérez', '55667788', 'juan.perez@ges.edu', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'INTEGRANTE', 'ACTIVO', 'Ingeniería de Sistemas', '2025-09-14 09:44:22', '2025-09-14 09:44:22', NULL, NULL, 'Grupo A - Sistemas', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'María García', '66778899', 'maria.garcia@ges.edu', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'INTEGRANTE', 'ACTIVO', 'Teología', '2025-09-14 09:44:22', '2025-09-14 09:44:22', NULL, NULL, 'Grupo B - Teología', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 'Carlos López', '77889900', 'carlos.lopez@ges.edu', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'INTEGRANTE', 'ACTIVO', 'Ingeniería de Sistemas', '2025-09-14 09:44:22', '2025-09-14 09:44:22', NULL, NULL, 'Grupo A - Sistemas', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vista_usuarios_estadisticas`
-- (See below for the actual view)
--
CREATE TABLE `vista_usuarios_estadisticas` (
`activos` decimal(23,0)
,`bloqueados` decimal(23,0)
,`inactivos` decimal(23,0)
,`rol` enum('SUPERADMIN','ADMIN','LIDER','INTEGRANTE')
,`total` bigint
);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auditoria`
--
ALTER TABLE `auditoria`
  ADD PRIMARY KEY (`id_auditoria`),
  ADD KEY `idx_usuario_fecha` (`usuario_id`,`fecha_accion`),
  ADD KEY `idx_tabla_fecha` (`tabla_afectada`,`fecha_accion`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `dni` (`dni`),
  ADD UNIQUE KEY `correo` (`correo`),
  ADD KEY `idx_dni` (`dni`),
  ADD KEY `idx_rol` (`rol`),
  ADD KEY `idx_estado` (`estado`),
  ADD KEY `idx_facultad_carrera` (`facultad_carrera`),
  ADD KEY `creado_por` (`creado_por`),
  ADD KEY `modificado_por` (`modificado_por`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auditoria`
--
ALTER TABLE `auditoria`
  MODIFY `id_auditoria` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

-- --------------------------------------------------------

--
-- Structure for view `vista_usuarios_estadisticas`
--
DROP TABLE IF EXISTS `vista_usuarios_estadisticas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_usuarios_estadisticas`  AS SELECT `usuario`.`rol` AS `rol`, count(0) AS `total`, sum((case when (`usuario`.`estado` = 'ACTIVO') then 1 else 0 end)) AS `activos`, sum((case when (`usuario`.`estado` = 'BLOQUEADO') then 1 else 0 end)) AS `bloqueados`, sum((case when (`usuario`.`estado` = 'INACTIVO') then 1 else 0 end)) AS `inactivos` FROM `usuario` GROUP BY `usuario`.`rol` ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auditoria`
--
ALTER TABLE `auditoria`
  ADD CONSTRAINT `auditoria_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE;

--
-- Constraints for table `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`creado_por`) REFERENCES `usuario` (`id_usuario`) ON DELETE SET NULL,
  ADD CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`modificado_por`) REFERENCES `usuario` (`id_usuario`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
