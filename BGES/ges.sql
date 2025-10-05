-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 05, 2025 at 02:20 PM
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
-- Table structure for table `alertas`
--

CREATE TABLE `alertas` (
  `id_alerta` bigint NOT NULL,
  `usuario_id` bigint NOT NULL,
  `tipo_alerta` enum('BAJA_ASISTENCIA','AUSENCIA_PROLONGADA','SEGUIMIENTO_ESPIRITUAL','COMPORTAMIENTO','OTRO') NOT NULL,
  `titulo` varchar(200) NOT NULL,
  `descripcion` text,
  `nivel_prioridad` enum('BAJA','MEDIA','ALTA','CRITICA') DEFAULT 'MEDIA',
  `estado` enum('ABIERTA','EN_SEGUIMIENTO','RESUELTA','CERRADA') DEFAULT 'ABIERTA',
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_resolucion` timestamp NULL DEFAULT NULL,
  `creado_por` bigint DEFAULT NULL,
  `resuelto_por` bigint DEFAULT NULL,
  `comentarios_seguimiento` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `asistencias`
--

CREATE TABLE `asistencias` (
  `id_asistencia` bigint NOT NULL,
  `usuario_id` bigint NOT NULL,
  `grupo_id` bigint NOT NULL,
  `fecha_asistencia` date NOT NULL,
  `presente` tinyint(1) DEFAULT '0',
  `motivo_ausencia` enum('ENFERMEDAD','VIAJE','TRABAJO','PERSONAL','DESCONOCIDA') DEFAULT NULL,
  `observaciones` text,
  `registrado_por` bigint DEFAULT NULL,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `catalogo_programas`
--

CREATE TABLE `catalogo_programas` (
  `id_programa` bigint NOT NULL,
  `sede` varchar(50) NOT NULL,
  `facultad` varchar(200) NOT NULL,
  `programa_estudio` varchar(200) NOT NULL,
  `activo` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `catalogo_programas`
--

INSERT INTO `catalogo_programas` (`id_programa`, `sede`, `facultad`, `programa_estudio`, `activo`) VALUES
(1, 'FILIAL_LIMA', 'Facultad de Ciencias Humanas y Educación', 'Comunicación Audiovisual y Medios Interactivos', 1),
(2, 'FILIAL_LIMA', 'Facultad de Ciencias Humanas y Educación', 'Comunicación Organizacional', 1),
(3, 'FILIAL_LIMA', 'Facultad de Ciencias Humanas y Educación', 'Comunicación y Periodismo', 1),
(4, 'FILIAL_LIMA', 'Facultad de Ciencias Humanas y Educación', 'Comunicación y Publicidad', 1),
(5, 'FILIAL_LIMA', 'Facultad de Ciencias Humanas y Educación', 'Derecho', 1),
(6, 'FILIAL_LIMA', 'Facultad de Ciencias Humanas y Educación', 'Educación Especialidad Ciencias Naturales y Tecnología', 1),
(7, 'FILIAL_LIMA', 'Facultad de Ciencias Humanas y Educación', 'Educación, Especialidad Educación Física, Recreación y Deportes', 1),
(8, 'FILIAL_LIMA', 'Facultad de Ciencias Humanas y Educación', 'Educación, Especialidad Inglés y Español', 1),
(9, 'FILIAL_LIMA', 'Facultad de Ciencias Humanas y Educación', 'Educación, Especialidad Inicial y Puericultura', 1),
(10, 'FILIAL_LIMA', 'Facultad de Ciencias Humanas y Educación', 'Educación Especialidad Matemática Análisis de Datos y Computación', 1),
(11, 'FILIAL_LIMA', 'Facultad de Ciencias Humanas y Educación', 'Educación, Especialidad Música y Artes Visuales', 1),
(12, 'FILIAL_LIMA', 'Facultad de Ciencias Humanas y Educación', 'Educación, Especialidad Primaria y Pedagogía Terapéutica', 1),
(13, 'FILIAL_LIMA', 'Facultad de Ingeniería y Arquitectura', 'Arquitectura y Urbanismo', 1),
(14, 'FILIAL_LIMA', 'Facultad de Ingeniería y Arquitectura', 'Ingeniería Ambiental', 1),
(15, 'FILIAL_LIMA', 'Facultad de Ingeniería y Arquitectura', 'Ingeniería Civil', 1),
(16, 'FILIAL_LIMA', 'Facultad de Ingeniería y Arquitectura', 'Ingeniería de Ciberseguridad', 1),
(17, 'FILIAL_LIMA', 'Facultad de Ingeniería y Arquitectura', 'Ingeniería de Industrias Alimentarias', 1),
(18, 'FILIAL_LIMA', 'Facultad de Ingeniería y Arquitectura', 'Ingeniería de Sistemas', 1),
(19, 'FILIAL_LIMA', 'Facultad de Ingeniería y Arquitectura', 'Ingeniería de Software', 1),
(20, 'FILIAL_LIMA', 'Facultad de Ingeniería y Arquitectura', 'Ingeniería en Ciencia de Datos', 1),
(21, 'FILIAL_LIMA', 'Facultad de Ingeniería y Arquitectura', 'Ingeniería Industrial', 1),
(22, 'FILIAL_LIMA', 'Facultad de Ciencias de la Salud', 'Enfermería', 1),
(23, 'FILIAL_LIMA', 'Facultad de Ciencias de la Salud', 'Nutrición Humana', 1),
(24, 'FILIAL_LIMA', 'Facultad de Ciencias de la Salud', 'Psicología', 1),
(25, 'FILIAL_LIMA', 'Facultad de Ciencias de la Salud', 'Medicina', 1),
(26, 'FILIAL_LIMA', 'Facultad de Ciencias de la Salud', 'Tecnología Médica Laboratorio Clínico y Anatomía Patológica', 1),
(27, 'FILIAL_LIMA', 'Facultad de Ciencias de la Salud', 'Tecnología Médica Terapia Física y Rehabilitación', 1),
(28, 'FILIAL_LIMA', 'Facultad de Teología', 'Teología', 1),
(29, 'FILIAL_LIMA', 'Facultad de Ciencias Empresariales', 'Administración', 1),
(30, 'FILIAL_LIMA', 'Facultad de Ciencias Empresariales', 'Contabilidad, Gestión Tributaria y Aduanera', 1),
(31, 'FILIAL_LIMA', 'Facultad de Ciencias Empresariales', 'Marketing y Negocios Internacionales', 1),
(32, 'FILIAL_TARAPOTO', 'Facultad de Ciencias Humanas y Educación', 'Educación, Especialidad Primaria y Pedagogía Terapéutica', 1),
(33, 'FILIAL_TARAPOTO', 'Facultad de Ciencias Humanas y Educación', 'Educación, Especialidad Inicial y Puericultura', 1),
(34, 'FILIAL_TARAPOTO', 'Facultad de Ingeniería y Arquitectura', 'Arquitectura y Urbanismo', 1),
(35, 'FILIAL_TARAPOTO', 'Facultad de Ingeniería y Arquitectura', 'Ingeniería Ambiental', 1),
(36, 'FILIAL_TARAPOTO', 'Facultad de Ingeniería y Arquitectura', 'Ingeniería Civil', 1),
(37, 'FILIAL_TARAPOTO', 'Facultad de Ingeniería y Arquitectura', 'Ingeniería de Sistemas', 1),
(38, 'FILIAL_TARAPOTO', 'Facultad de Ciencias de la Salud', 'Enfermería', 1),
(39, 'FILIAL_TARAPOTO', 'Facultad de Ciencias de la Salud', 'Psicología', 1),
(40, 'FILIAL_TARAPOTO', 'Facultad de Ciencias Empresariales', 'Administración', 1),
(41, 'FILIAL_TARAPOTO', 'Facultad de Ciencias Empresariales', 'Contabilidad, Gestión Tributaria y Aduanera', 1),
(42, 'FILIAL_TARAPOTO', 'Facultad de Ciencias Empresariales', 'Marketing y Negocios Internacionales', 1),
(43, 'FILIAL_JULIACA', 'Facultad de Ciencias Humanas y Educación', 'Educación Especialidad Ciencias Naturales y Tecnología', 1),
(44, 'FILIAL_JULIACA', 'Facultad de Ciencias Humanas y Educación', 'Educación, Especialidad Educación Física, Recreación y Deportes', 1),
(45, 'FILIAL_JULIACA', 'Facultad de Ciencias Humanas y Educación', 'Educación, Especialidad Inglés y Español', 1),
(46, 'FILIAL_JULIACA', 'Facultad de Ciencias Humanas y Educación', 'Educación, Especialidad Inicial y Puericultura', 1),
(47, 'FILIAL_JULIACA', 'Facultad de Ciencias Humanas y Educación', 'Educación Especialidad Matemática Análisis de Datos y Computación', 1),
(48, 'FILIAL_JULIACA', 'Facultad de Ciencias Humanas y Educación', 'Educación, Especialidad Primaria y Pedagogía Terapéutica', 1),
(49, 'FILIAL_JULIACA', 'Facultad de Ingeniería y Arquitectura', 'Arquitectura y Urbanismo', 1),
(50, 'FILIAL_JULIACA', 'Facultad de Ingeniería y Arquitectura', 'Ingeniería Ambiental', 1),
(51, 'FILIAL_JULIACA', 'Facultad de Ingeniería y Arquitectura', 'Ingeniería Civil', 1),
(52, 'FILIAL_JULIACA', 'Facultad de Ingeniería y Arquitectura', 'Ingeniería de Industrias Alimentarias', 1),
(53, 'FILIAL_JULIACA', 'Facultad de Ingeniería y Arquitectura', 'Ingeniería de Sistemas', 1),
(54, 'FILIAL_JULIACA', 'Facultad de Ciencias de la Salud', 'Enfermería', 1),
(55, 'FILIAL_JULIACA', 'Facultad de Ciencias de la Salud', 'Nutrición Humana', 1),
(56, 'FILIAL_JULIACA', 'Facultad de Ciencias de la Salud', 'Psicología', 1),
(57, 'FILIAL_JULIACA', 'Facultad de Ciencias Empresariales', 'Administración', 1),
(58, 'FILIAL_JULIACA', 'Facultad de Ciencias Empresariales', 'Contabilidad, Gestión Tributaria y Aduanera', 1);

-- --------------------------------------------------------

--
-- Table structure for table `comunicaciones`
--

CREATE TABLE `comunicaciones` (
  `id_comunicacion` bigint NOT NULL,
  `titulo` varchar(200) NOT NULL,
  `mensaje` text NOT NULL,
  `tipo_comunicacion` enum('ANUNCIO','RECORDATORIO','ALERTA','FELICITACION','INVITACION') NOT NULL,
  `canal` enum('CORREO','WHATSAPP','PUSH','SMS') NOT NULL,
  `dirigido_a` enum('TODOS','FACULTAD','GRUPO','ROL','INDIVIDUAL') NOT NULL,
  `filtro_facultad` varchar(100) DEFAULT NULL,
  `filtro_grupo` bigint DEFAULT NULL,
  `filtro_rol` enum('SUPERADMIN','ADMIN','LIDER','INTEGRANTE') DEFAULT NULL,
  `usuario_destinatario` bigint DEFAULT NULL,
  `fecha_programada` datetime DEFAULT NULL,
  `fecha_enviado` timestamp NULL DEFAULT NULL,
  `estado` enum('BORRADOR','PROGRAMADO','ENVIADO','ERROR') DEFAULT 'BORRADOR',
  `enviado_por` bigint DEFAULT NULL,
  `resultado_envio` json DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `configuracion_sistema`
--

CREATE TABLE `configuracion_sistema` (
  `id_config` bigint NOT NULL,
  `clave` varchar(100) NOT NULL,
  `valor` text NOT NULL,
  `descripcion` text,
  `tipo_dato` enum('STRING','INTEGER','BOOLEAN','JSON','DATE') DEFAULT 'STRING',
  `categoria` varchar(50) DEFAULT 'GENERAL',
  `modificable` tinyint(1) DEFAULT '1',
  `fecha_modificacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modificado_por` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `configuracion_sistema`
--

INSERT INTO `configuracion_sistema` (`id_config`, `clave`, `valor`, `descripcion`, `tipo_dato`, `categoria`, `modificable`, `fecha_modificacion`, `modificado_por`) VALUES
(1, 'asistencia_minima_global', '75', 'Porcentaje mínimo de asistencia requerido globalmente', 'INTEGER', 'ASISTENCIA', 1, '2025-09-21 04:28:12', NULL),
(2, 'periodo_academico_actual', '2024-1', 'Período académico actual', 'STRING', 'ACADEMICO', 1, '2025-09-21 04:28:12', NULL),
(3, 'fecha_inicio_periodo', '2024-03-01', 'Fecha de inicio del período académico actual', 'DATE', 'ACADEMICO', 1, '2025-09-21 04:28:12', NULL),
(4, 'fecha_fin_periodo', '2024-07-31', 'Fecha de fin del período académico actual', 'DATE', 'ACADEMICO', 1, '2025-09-21 04:28:12', NULL),
(5, 'notificaciones_activas', 'true', 'Si las notificaciones automáticas están activas', 'BOOLEAN', 'COMUNICACION', 1, '2025-09-21 04:28:12', NULL),
(6, 'capacidad_maxima_grupo', '15', 'Capacidad máxima por defecto para grupos', 'INTEGER', 'GRUPOS', 1, '2025-09-21 04:28:12', NULL),
(7, 'dias_alerta_ausencia', '3', 'Días consecutivos de ausencia para generar alerta', 'INTEGER', 'ALERTAS', 1, '2025-09-21 04:28:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `eventos`
--

CREATE TABLE `eventos` (
  `id_evento` bigint NOT NULL,
  `titulo` varchar(200) NOT NULL,
  `descripcion` text,
  `fecha_inicio` datetime NOT NULL,
  `fecha_fin` datetime NOT NULL,
  `tipo_evento` enum('RETIRO','CONGRESO','CAMPAÑA','CAPACITACION','SOCIAL','OTRO') NOT NULL,
  `ubicacion` varchar(200) DEFAULT NULL,
  `capacidad_maxima` int DEFAULT NULL,
  `costo` decimal(10,2) DEFAULT '0.00',
  `estado` enum('PLANIFICADO','EN_CURSO','FINALIZADO','CANCELADO') DEFAULT 'PLANIFICADO',
  `facultad_carrera` varchar(100) DEFAULT NULL,
  `imagen_url` varchar(500) DEFAULT NULL,
  `requisitos` text,
  `contacto_responsable` varchar(100) DEFAULT NULL,
  `fecha_limite_inscripcion` datetime DEFAULT NULL,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `creado_por` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `eventos_calendario`
--

CREATE TABLE `eventos_calendario` (
  `id_evento_local` bigint NOT NULL,
  `google_event_id` varchar(500) DEFAULT NULL,
  `titulo` varchar(200) NOT NULL,
  `descripcion` text,
  `fecha_inicio` datetime NOT NULL,
  `fecha_fin` datetime NOT NULL,
  `ubicacion` varchar(200) DEFAULT NULL,
  `color` varchar(20) DEFAULT '#1976d2',
  `estado` enum('PLANIFICADO','EN_CURSO','FINALIZADO','CANCELADO') DEFAULT 'PLANIFICADO',
  `tipo_evento` enum('RETIRO','CONGRESO','REUNION','CAPACITACION','CULTO','OTRO') NOT NULL,
  `facultad_carrera` varchar(100) DEFAULT NULL,
  `visible_para` enum('TODOS','FACULTAD','GRUPO','ADMIN') DEFAULT 'TODOS',
  `sincronizado_google` tinyint(1) DEFAULT '0',
  `fecha_sincronizacion` datetime DEFAULT NULL,
  `recordatorio` tinyint(1) DEFAULT '1',
  `minutos_antes_recordatorio` int DEFAULT '30',
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `creado_por` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `eventos_calendario`
--

INSERT INTO `eventos_calendario` (`id_evento_local`, `google_event_id`, `titulo`, `descripcion`, `fecha_inicio`, `fecha_fin`, `ubicacion`, `color`, `estado`, `tipo_evento`, `facultad_carrera`, `visible_para`, `sincronizado_google`, `fecha_sincronizacion`, `recordatorio`, `minutos_antes_recordatorio`, `fecha_creacion`, `creado_por`) VALUES
(3, 'df42hd5350bbduouchg1s08fv0', 'Retiro Espiritual 2024', 'Retiro anual de grupos pequeños', '2024-12-15 09:00:00', '2024-12-15 18:00:00', 'Campus Universidad', '#1976d2', 'PLANIFICADO', 'OTRO', NULL, 'TODOS', 1, '2025-09-29 09:36:59', 1, 30, '2025-09-29 14:36:57', 1),
(4, 'h5akbump0qj2rl737nbaaf55h4', 'Retiro Espiritual 2025', 'Grupos pequeños', '2024-12-15 09:00:00', '2024-12-15 18:00:00', 'Campus Universidad', '#1976d2', 'PLANIFICADO', 'OTRO', NULL, 'TODOS', 1, '2025-09-29 09:39:36', 1, 30, '2025-09-29 14:39:35', 1),
(5, 'v7e12gtp7j8ct7t4stqb6jh8rk', 'Retiro Espiritual 2024 - ACTUALIZADO', 'Nueva descripción', '2024-12-15 10:00:00', '2024-12-15 19:00:00', 'Nuevo lugar', '#1976d2', 'PLANIFICADO', 'OTRO', NULL, 'TODOS', 1, '2025-09-29 09:41:35', 1, 30, '2025-09-29 14:41:33', 1),
(6, 'pt1nb4o382h59bjn9m96tt3cq4', 'Espiritual 2025', 'Retiro anual de grupos pequeños', '2025-12-15 09:00:00', '2025-12-15 18:00:00', 'Universidad', '#1976d2', 'PLANIFICADO', 'OTRO', NULL, 'TODOS', 1, '2025-09-29 09:51:14', 1, 30, '2025-09-29 14:51:12', 1),
(7, 'nkalccmltf9rltmuro1girb3c4', 'Confraternidad 2025', 'Confraternidad grupos pequeños', '2025-12-15 09:00:00', '2025-12-15 18:00:00', 'Universidad', '#1976d2', 'PLANIFICADO', 'OTRO', NULL, 'TODOS', 1, '2025-09-29 10:06:50', 1, 30, '2025-09-29 15:06:48', 1),
(8, '3ohcr8g440p7bsoshasffas1p8', 'Con 2026', 'Confraternidad grupos pequeños', '2025-12-15 09:00:00', '2025-12-15 18:00:00', 'Universidad', '#1976d2', 'PLANIFICADO', 'OTRO', NULL, 'TODOS', 1, '2025-09-30 04:13:32', 1, 30, '2025-09-30 09:13:31', 3),
(9, 'i4gjf4m6tlvv9qmqfhgsmd4ofo', 'Con Gru 2026', 'Confraternidad grupos pequeños', '2025-12-15 09:00:00', '2025-12-15 18:00:00', 'Universidad', '#1976d2', 'PLANIFICADO', 'OTRO', NULL, 'TODOS', 1, '2025-09-30 04:14:34', 1, 30, '2025-09-30 09:14:33', 3),
(10, 'o78clu5kqosj43jc6e11a5pg6o', 'Sábado 2026', 'Confraternidad grupos pequeños', '2025-12-15 09:00:00', '2025-12-15 18:00:00', 'Universidad', '#1976d2', 'PLANIFICADO', 'OTRO', NULL, 'TODOS', 1, '2025-09-30 04:28:35', 1, 30, '2025-09-30 09:28:34', 2),
(11, '0a0orbiv007s7mmeh0j96uu8d8', 'Escuela Sabática 2026', 'Confraternidad grupos pequeños', '2025-12-15 09:00:00', '2025-12-15 18:00:00', 'Universidad', '#1976d2', 'PLANIFICADO', 'OTRO', NULL, 'TODOS', 1, '2025-09-30 04:50:34', 1, 30, '2025-09-30 09:50:33', 2);

-- --------------------------------------------------------

--
-- Table structure for table `evento_asistentes`
--

CREATE TABLE `evento_asistentes` (
  `id_asistente` bigint NOT NULL,
  `evento_id` bigint NOT NULL,
  `usuario_id` bigint DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `estado_confirmacion` enum('PENDIENTE','CONFIRMADO','RECHAZADO','TENTATIVO') DEFAULT 'PENDIENTE',
  `fecha_confirmacion` datetime DEFAULT NULL,
  `notificado` tinyint(1) DEFAULT '0',
  `fecha_notificacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `evento_asistentes`
--

INSERT INTO `evento_asistentes` (`id_asistente`, `evento_id`, `usuario_id`, `email`, `estado_confirmacion`, `fecha_confirmacion`, `notificado`, `fecha_notificacion`) VALUES
(1, 3, NULL, 'estudiante1@upeu.edu.pe', 'PENDIENTE', NULL, 0, NULL),
(2, 3, NULL, 'estudiante2@upeu.edu.pe', 'PENDIENTE', NULL, 0, NULL),
(3, 4, NULL, 'estudiante1@upeu.edu.pe', 'PENDIENTE', NULL, 0, NULL),
(4, 4, NULL, 'estudiante2@upeu.edu.pe', 'PENDIENTE', NULL, 0, NULL),
(5, 5, NULL, 'nuevo@upeu.edu.pe', 'PENDIENTE', NULL, 0, NULL),
(6, 6, NULL, 'estudiante1@upeu.edu.pe', 'PENDIENTE', NULL, 0, NULL),
(7, 6, NULL, 'estudiante2@upeu.edu.pe', 'PENDIENTE', NULL, 0, NULL),
(8, 7, NULL, 'estudiante1@upeu.edu.pe', 'PENDIENTE', NULL, 0, NULL),
(9, 7, NULL, 'estudiante2@upeu.edu.pe', 'PENDIENTE', NULL, 0, NULL),
(10, 8, NULL, 'estudiante1@upeu.edu.pe', 'PENDIENTE', NULL, 0, NULL),
(11, 8, NULL, 'estudiante2@upeu.edu.pe', 'PENDIENTE', NULL, 0, NULL),
(12, 9, NULL, 'maria.garcia@upeu.edu.pe', 'PENDIENTE', NULL, 0, NULL),
(13, 10, NULL, 'maria.garcia@upeu.edu.pe', 'PENDIENTE', NULL, 0, NULL),
(14, 11, NULL, 'maria.garcia@upeu.edu.pe', 'PENDIENTE', NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `grupos`
--

CREATE TABLE `grupos` (
  `id_grupo` bigint NOT NULL,
  `nombre_grupo` varchar(100) NOT NULL,
  `codigo_grupo` varchar(20) DEFAULT NULL,
  `facultad_carrera` varchar(100) NOT NULL,
  `lider_id` bigint DEFAULT NULL,
  `estado` enum('ACTIVO','INACTIVO','PENDIENTE') DEFAULT 'ACTIVO',
  `capacidad_maxima` int DEFAULT '15',
  `descripcion` text,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_modificacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creado_por` bigint DEFAULT NULL,
  `modificado_por` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inscripciones_eventos`
--

CREATE TABLE `inscripciones_eventos` (
  `id_inscripcion` bigint NOT NULL,
  `evento_id` bigint NOT NULL,
  `usuario_id` bigint NOT NULL,
  `fecha_inscripcion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `estado_inscripcion` enum('INSCRITO','CONFIRMADO','CANCELADO','PRESENTE','AUSENTE') DEFAULT 'INSCRITO',
  `comentarios` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id_menu` bigint NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `titulo_display` varchar(100) NOT NULL,
  `icono` varchar(50) DEFAULT NULL,
  `ruta` varchar(200) DEFAULT NULL,
  `orden` int NOT NULL DEFAULT '0',
  `activo` tinyint(1) DEFAULT '1',
  `es_padre` tinyint(1) DEFAULT '0',
  `menu_padre_id` bigint DEFAULT NULL,
  `descripcion` text,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_modificacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id_menu`, `nombre`, `titulo_display`, `icono`, `ruta`, `orden`, `activo`, `es_padre`, `menu_padre_id`, `descripcion`, `fecha_creacion`, `fecha_modificacion`) VALUES
(1, 'dashboard', 'Dashboard', 'dashboard', '/superadmin/dashboard', 1, 1, 0, NULL, NULL, '2025-09-21 06:20:58', '2025-09-21 06:20:58'),
(2, 'grupos', 'Grupos', 'users', '/superadmin/grupos', 2, 1, 0, NULL, NULL, '2025-09-21 06:20:58', '2025-09-21 06:20:58'),
(3, 'estudiantes', 'Estudiantes', 'graduation-cap', '/superadmin/estudiantes', 3, 1, 0, NULL, NULL, '2025-09-21 06:20:58', '2025-09-21 06:20:58'),
(4, 'calendario', 'Calendario', 'calendar', '/superadmin/calendario', 4, 1, 0, NULL, NULL, '2025-09-21 06:20:58', '2025-09-21 06:20:58'),
(5, 'asistencia', 'Asistencia', 'check-circle', '/superadmin/asistencia', 5, 1, 0, NULL, NULL, '2025-09-21 06:20:58', '2025-09-21 06:20:58'),
(6, 'alertas', 'Alertas y seguimiento', 'alert-triangle', '/superadmin/alertas', 6, 1, 0, NULL, NULL, '2025-09-21 06:20:58', '2025-09-21 06:20:58'),
(7, 'comunicacion', 'Comunicación', 'message-circle', '/superadmin/comunicacion', 7, 1, 0, NULL, NULL, '2025-09-21 06:20:58', '2025-09-21 06:20:58'),
(8, 'reportes', 'Reportes Locales', 'bar-chart', '/superadmin/reportes', 8, 1, 0, NULL, NULL, '2025-09-21 06:20:58', '2025-09-21 06:20:58'),
(9, 'eventos', 'Eventos Especiales', 'calendar-plus', '/superadmin/eventos', 9, 1, 0, NULL, NULL, '2025-09-21 06:20:58', '2025-09-21 06:20:58'),
(10, 'cerrar_sesion', 'Cerrar Sesión', 'log-out', '/logout', 10, 1, 0, NULL, NULL, '2025-09-21 06:20:58', '2025-09-21 06:20:58'),
(11, 'admin_dashboard', 'Dashboard', 'dashboard', '/admin/dashboard', 1, 1, 0, NULL, NULL, '2025-09-21 06:20:58', '2025-09-21 06:20:58'),
(12, 'admin_grupos', 'Grupos', 'users', '/admin/grupos', 2, 1, 0, NULL, NULL, '2025-09-21 06:20:58', '2025-09-21 06:20:58'),
(13, 'admin_estudiantes', 'Estudiantes', 'graduation-cap', '/admin/estudiantes', 3, 1, 0, NULL, NULL, '2025-09-21 06:20:58', '2025-09-21 06:20:58'),
(14, 'admin_liderazgo', 'Liderazgo', 'user-check', '/admin/liderazgo', 4, 1, 0, NULL, NULL, '2025-09-21 06:20:58', '2025-09-21 06:20:58'),
(15, 'admin_calendario', 'Calendario', 'calendar', '/admin/calendario', 5, 1, 0, NULL, NULL, '2025-09-21 06:20:58', '2025-09-21 06:20:58'),
(16, 'admin_asistencia', 'Asistencia', 'check-circle', '/admin/asistencia', 6, 1, 0, NULL, NULL, '2025-09-21 06:20:58', '2025-09-21 06:20:58'),
(17, 'admin_comunicacion', 'Comunicación', 'message-circle', '/admin/comunicacion', 7, 1, 0, NULL, NULL, '2025-09-21 06:20:58', '2025-09-21 06:20:58'),
(18, 'admin_reportes', 'Reportes y Analítica', 'bar-chart', '/admin/reportes', 8, 1, 0, NULL, NULL, '2025-09-21 06:20:58', '2025-09-21 06:20:58'),
(19, 'admin_eventos', 'Eventos', 'calendar-plus', '/admin/eventos', 9, 1, 0, NULL, NULL, '2025-09-21 06:20:58', '2025-09-21 06:20:58'),
(20, 'admin_cerrar_sesion', 'Cerrar Sesión', 'log-out', '/logout', 10, 1, 0, NULL, NULL, '2025-09-21 06:20:58', '2025-09-21 06:20:58'),
(21, 'lider_calendario', 'Cronograma de Actividades', 'calendar', '/lider/calendario', 1, 1, 0, NULL, NULL, '2025-09-21 06:20:58', '2025-09-21 06:20:58'),
(22, 'lider_asistencia', 'Registro de Asistencia', 'check-circle', '/lider/asistencia', 2, 1, 0, NULL, NULL, '2025-09-21 06:20:58', '2025-09-21 06:20:58'),
(23, 'lider_invitados', 'Invitados/Visitas', 'user-plus', '/lider/invitados', 3, 1, 0, NULL, NULL, '2025-09-21 06:20:58', '2025-09-21 06:20:58'),
(24, 'lider_espiritual', 'Registro Espiritual', 'heart', '/lider/espiritual', 4, 1, 0, NULL, NULL, '2025-09-21 06:20:58', '2025-09-21 06:20:58'),
(25, 'lider_notas', 'Notas del Grupo', 'file-text', '/lider/notas', 5, 1, 0, NULL, NULL, '2025-09-21 06:20:58', '2025-09-21 06:20:58'),
(26, 'lider_reportes', 'Reportes Básicos', 'bar-chart-2', '/lider/reportes', 6, 1, 0, NULL, NULL, '2025-09-21 06:20:58', '2025-09-21 06:20:58'),
(27, 'lider_perfiles', 'Gestión de Perfiles', 'users', '/lider/perfiles', 7, 1, 0, NULL, NULL, '2025-09-21 06:20:58', '2025-09-21 06:20:58'),
(28, 'lider_reconocimientos', 'Reconocimientos', 'award', '/lider/reconocimientos', 8, 1, 0, NULL, NULL, '2025-09-21 06:20:58', '2025-09-21 06:20:58'),
(29, 'lider_cerrar_sesion', 'Cerrar Sesión', 'log-out', '/logout', 9, 1, 0, NULL, NULL, '2025-09-21 06:20:58', '2025-09-21 06:20:58'),
(30, 'integrante_calendario', 'Cronograma de Actividades', 'calendar', '/integrante/calendario', 1, 1, 0, NULL, NULL, '2025-09-21 06:20:58', '2025-09-21 06:20:58'),
(31, 'integrante_asistencias', 'Mis Asistencias', 'check-circle', '/integrante/asistencias', 2, 1, 0, NULL, NULL, '2025-09-21 06:20:58', '2025-09-21 06:20:58'),
(32, 'integrante_qr', 'Registrar por QR', 'qr-code', '/integrante/qr', 3, 1, 0, NULL, NULL, '2025-09-21 06:20:58', '2025-09-21 06:20:58'),
(33, 'integrante_perfil', 'Mi Perfil', 'user', '/integrante/perfil', 4, 1, 0, NULL, NULL, '2025-09-21 06:20:58', '2025-09-21 06:20:58'),
(34, 'integrante_cerrar_sesion', 'Cerrar Sesión', 'log-out', '/logout', 5, 1, 0, NULL, NULL, '2025-09-21 06:20:58', '2025-09-21 06:20:58');

-- --------------------------------------------------------

--
-- Table structure for table `menu_roles`
--

CREATE TABLE `menu_roles` (
  `id_menu_rol` bigint NOT NULL,
  `menu_id` bigint NOT NULL,
  `rol` enum('SUPERADMIN','ADMIN','LIDER','INTEGRANTE') NOT NULL,
  `puede_ver` tinyint(1) DEFAULT '1',
  `puede_editar` tinyint(1) DEFAULT '0',
  `puede_eliminar` tinyint(1) DEFAULT '0',
  `fecha_asignacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `menu_roles`
--

INSERT INTO `menu_roles` (`id_menu_rol`, `menu_id`, `rol`, `puede_ver`, `puede_editar`, `puede_eliminar`, `fecha_asignacion`) VALUES
(1, 1, 'SUPERADMIN', 1, 1, 1, '2025-09-21 06:20:58'),
(2, 2, 'SUPERADMIN', 1, 1, 1, '2025-09-21 06:20:58'),
(3, 3, 'SUPERADMIN', 1, 1, 1, '2025-09-21 06:20:58'),
(4, 4, 'SUPERADMIN', 1, 1, 1, '2025-09-21 06:20:58'),
(5, 5, 'SUPERADMIN', 1, 1, 1, '2025-09-21 06:20:58'),
(6, 6, 'SUPERADMIN', 1, 1, 1, '2025-09-21 06:20:58'),
(7, 7, 'SUPERADMIN', 1, 1, 1, '2025-09-21 06:20:58'),
(8, 8, 'SUPERADMIN', 1, 1, 1, '2025-09-21 06:20:58'),
(9, 9, 'SUPERADMIN', 1, 1, 1, '2025-09-21 06:20:58'),
(10, 10, 'SUPERADMIN', 1, 1, 1, '2025-09-21 06:20:58'),
(16, 11, 'ADMIN', 1, 1, 0, '2025-09-21 06:20:58'),
(17, 12, 'ADMIN', 1, 1, 0, '2025-09-21 06:20:58'),
(18, 13, 'ADMIN', 1, 1, 0, '2025-09-21 06:20:58'),
(19, 14, 'ADMIN', 1, 1, 0, '2025-09-21 06:20:58'),
(20, 15, 'ADMIN', 1, 1, 0, '2025-09-21 06:20:58'),
(21, 16, 'ADMIN', 1, 1, 0, '2025-09-21 06:20:58'),
(22, 17, 'ADMIN', 1, 1, 0, '2025-09-21 06:20:58'),
(23, 18, 'ADMIN', 1, 1, 0, '2025-09-21 06:20:58'),
(24, 19, 'ADMIN', 1, 1, 0, '2025-09-21 06:20:58'),
(25, 20, 'ADMIN', 1, 1, 0, '2025-09-21 06:20:58'),
(31, 21, 'LIDER', 1, 1, 0, '2025-09-21 06:20:58'),
(32, 22, 'LIDER', 1, 1, 0, '2025-09-21 06:20:58'),
(33, 23, 'LIDER', 1, 1, 0, '2025-09-21 06:20:58'),
(34, 24, 'LIDER', 1, 1, 0, '2025-09-21 06:20:58'),
(35, 25, 'LIDER', 1, 1, 0, '2025-09-21 06:20:58'),
(36, 26, 'LIDER', 1, 1, 0, '2025-09-21 06:20:58'),
(37, 27, 'LIDER', 1, 1, 0, '2025-09-21 06:20:58'),
(38, 28, 'LIDER', 1, 1, 0, '2025-09-21 06:20:58'),
(39, 29, 'LIDER', 1, 1, 0, '2025-09-21 06:20:58'),
(46, 30, 'INTEGRANTE', 1, 0, 0, '2025-09-21 06:20:59'),
(47, 31, 'INTEGRANTE', 1, 0, 0, '2025-09-21 06:20:59'),
(48, 32, 'INTEGRANTE', 1, 0, 0, '2025-09-21 06:20:59'),
(49, 33, 'INTEGRANTE', 1, 0, 0, '2025-09-21 06:20:59'),
(50, 34, 'INTEGRANTE', 1, 0, 0, '2025-09-21 06:20:59');

-- --------------------------------------------------------

--
-- Table structure for table `personas`
--

CREATE TABLE `personas` (
  `id_persona` bigint NOT NULL,
  `usuario_id` bigint DEFAULT NULL COMMENT 'Relación con tabla usuarios',
  `codigo_estudiante` varchar(20) NOT NULL COMMENT 'Código único del estudiante',
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `nombre_completo` varchar(200) GENERATED ALWAYS AS (concat(`apellidos`,_utf8mb4' ',`nombres`)) STORED,
  `documento_identidad` varchar(20) NOT NULL COMMENT 'DNI',
  `correo_personal` varchar(100) DEFAULT NULL,
  `correo_institucional` varchar(100) DEFAULT NULL,
  `usuario_login` varchar(50) DEFAULT NULL COMMENT 'Usuario del sistema (andy.ccaza)',
  `celular` varchar(20) DEFAULT NULL,
  `pais` varchar(50) DEFAULT 'Perú',
  `foto_url` varchar(500) DEFAULT NULL,
  `religion` varchar(100) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `fecha_matricula` datetime DEFAULT NULL,
  `modo_contrato` enum('REGULAR','IRREGULAR') DEFAULT 'REGULAR',
  `modalidad_estudio` enum('PRESENCIAL','SEMIPRESENCIAL','VIRTUAL') DEFAULT 'PRESENCIAL',
  `sede` varchar(50) NOT NULL,
  `facultad` varchar(200) NOT NULL,
  `programa_estudio` varchar(200) NOT NULL,
  `ciclo` int DEFAULT NULL,
  `grupo` int DEFAULT NULL,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_modificacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creado_por` bigint DEFAULT NULL,
  `modificado_por` bigint DEFAULT NULL
) ;

--
-- Dumping data for table `personas`
--

INSERT INTO `personas` (`id_persona`, `usuario_id`, `codigo_estudiante`, `nombres`, `apellidos`, `documento_identidad`, `correo_personal`, `correo_institucional`, `usuario_login`, `celular`, `pais`, `foto_url`, `religion`, `fecha_nacimiento`, `fecha_matricula`, `modo_contrato`, `modalidad_estudio`, `sede`, `facultad`, `programa_estudio`, `ciclo`, `grupo`, `fecha_creacion`, `fecha_modificacion`, `creado_por`, `modificado_por`) VALUES
(1, 2, '202411800', 'ANDY LEONEL', 'CCAZA ATAMARI', '12345678', 'juan.lopez@gmail.com', 'juan.lopez@upeu.edu.pe', 'juan.lopez', '987654321', 'Perú', NULL, 'Adventista del Séptimo Día', '2005-05-15', '2024-08-01 10:00:00', 'REGULAR', 'PRESENCIAL', 'FILIAL_JULIACA', 'Facultad de Ingeniería y Arquitectura', 'Ingeniería de Sistemas', 1, 1, '2025-10-05 13:36:12', '2025-10-05 14:17:57', 1, 1),
(2, 3, '202411999', 'MARIA', 'GOMEZ', '62177497', 'maria@gmail.com', 'maria@upeu.edu.pe', 'maria.gomez', '999888777', 'Perú', NULL, NULL, NULL, NULL, 'REGULAR', 'PRESENCIAL', 'FILIAL_JULIACA', 'Facultad de Ingeniería y Arquitectura', 'Ingeniería de Sistemas', 2, 1, '2025-10-05 13:37:01', '2025-10-05 13:37:01', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `reportes_programados`
--

CREATE TABLE `reportes_programados` (
  `id_reporte` bigint NOT NULL,
  `nombre_reporte` varchar(100) NOT NULL,
  `tipo_reporte` enum('ASISTENCIA','SEGUIMIENTO_ESPIRITUAL','EVENTOS','ALERTAS','GENERAL') NOT NULL,
  `frecuencia` enum('DIARIO','SEMANAL','MENSUAL','TRIMESTRAL') NOT NULL,
  `dia_semana` tinyint DEFAULT NULL,
  `dia_mes` tinyint DEFAULT NULL,
  `hora_envio` time DEFAULT '08:00:00',
  `destinatarios` json DEFAULT NULL,
  `parametros` json DEFAULT NULL,
  `activo` tinyint(1) DEFAULT '1',
  `ultimo_envio` timestamp NULL DEFAULT NULL,
  `proximo_envio` timestamp NULL DEFAULT NULL,
  `creado_por` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seguimiento_espiritual`
--

CREATE TABLE `seguimiento_espiritual` (
  `id_seguimiento` bigint NOT NULL,
  `usuario_id` bigint NOT NULL,
  `fecha_registro` date NOT NULL,
  `estudio_biblico` tinyint(1) DEFAULT '0',
  `actividad_misionera` tinyint(1) DEFAULT '0',
  `culto_oracion` tinyint(1) DEFAULT '0',
  `ofrendas` tinyint(1) DEFAULT '0',
  `testimonio` tinyint(1) DEFAULT '0',
  `observaciones` text,
  `registrado_por` bigint DEFAULT NULL,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` bigint NOT NULL,
  `usuario` varchar(50) NOT NULL COMMENT 'Usuario para login (ej: andy.ccaza)',
  `correo` varchar(100) DEFAULT NULL COMMENT 'Correo para login',
  `contraseña` varchar(255) NOT NULL COMMENT 'Contraseña encriptada',
  `rol` enum('SUPERADMIN','ADMIN','LIDER','INTEGRANTE') NOT NULL DEFAULT 'INTEGRANTE',
  `activo` tinyint(1) DEFAULT '1',
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_modificacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ultimo_acceso` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `usuario`, `correo`, `contraseña`, `rol`, `activo`, `fecha_creacion`, `fecha_modificacion`, `ultimo_acceso`) VALUES
(1, 'superadmin', 'superadmin@upeu.edu.pe', '$2a$10$Lj0lVO9xMA.Vbl1fZhZVDOpFFu/67IiQ3/KHn77n56wnlAfRmdxsK', 'SUPERADMIN', 1, '2025-10-04 21:53:30', '2025-10-05 13:55:18', '2025-10-05 08:55:18'),
(2, 'juan.lopez', 'juan.lopez@upeu.edu.pe', '$2a$10$KWLc.w1N3rIshAdLZJChzOEnsnQHfu7nMuInv/nJMKqf6s78rsrxi', 'INTEGRANTE', 1, '2025-10-05 13:36:11', '2025-10-05 13:36:11', NULL),
(3, 'maria.gomez', 'maria@upeu.edu.pe', '$2a$10$mATBujsD8OD1swc90dAU...2YtSHR9KJydc4qABWrYx1WrZbTHzV6', 'INTEGRANTE', 1, '2025-10-05 13:37:01', '2025-10-05 14:16:35', '2025-10-05 09:16:36');

-- --------------------------------------------------------

--
-- Stand-in structure for view `vista_usuarios_estadisticas`
-- (See below for the actual view)
--
CREATE TABLE `vista_usuarios_estadisticas` (
);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alertas`
--
ALTER TABLE `alertas`
  ADD PRIMARY KEY (`id_alerta`),
  ADD KEY `idx_usuario` (`usuario_id`),
  ADD KEY `idx_tipo` (`tipo_alerta`),
  ADD KEY `idx_estado` (`estado`),
  ADD KEY `idx_prioridad` (`nivel_prioridad`),
  ADD KEY `creado_por` (`creado_por`),
  ADD KEY `resuelto_por` (`resuelto_por`);

--
-- Indexes for table `asistencias`
--
ALTER TABLE `asistencias`
  ADD PRIMARY KEY (`id_asistencia`),
  ADD UNIQUE KEY `unique_usuario_fecha` (`usuario_id`,`fecha_asistencia`),
  ADD KEY `idx_usuario_fecha` (`usuario_id`,`fecha_asistencia`),
  ADD KEY `idx_grupo_fecha` (`grupo_id`,`fecha_asistencia`),
  ADD KEY `idx_fecha` (`fecha_asistencia`),
  ADD KEY `registrado_por` (`registrado_por`);

--
-- Indexes for table `catalogo_programas`
--
ALTER TABLE `catalogo_programas`
  ADD PRIMARY KEY (`id_programa`),
  ADD UNIQUE KEY `unique_sede_facultad_programa` (`sede`,`facultad`,`programa_estudio`),
  ADD KEY `idx_sede` (`sede`),
  ADD KEY `idx_facultad` (`facultad`);

--
-- Indexes for table `comunicaciones`
--
ALTER TABLE `comunicaciones`
  ADD PRIMARY KEY (`id_comunicacion`),
  ADD KEY `idx_tipo` (`tipo_comunicacion`),
  ADD KEY `idx_estado` (`estado`),
  ADD KEY `idx_fecha_programada` (`fecha_programada`),
  ADD KEY `idx_dirigido_a` (`dirigido_a`),
  ADD KEY `filtro_grupo` (`filtro_grupo`),
  ADD KEY `usuario_destinatario` (`usuario_destinatario`),
  ADD KEY `enviado_por` (`enviado_por`);

--
-- Indexes for table `configuracion_sistema`
--
ALTER TABLE `configuracion_sistema`
  ADD PRIMARY KEY (`id_config`),
  ADD UNIQUE KEY `clave` (`clave`),
  ADD KEY `idx_categoria` (`categoria`),
  ADD KEY `idx_clave` (`clave`),
  ADD KEY `modificado_por` (`modificado_por`);

--
-- Indexes for table `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`id_evento`),
  ADD KEY `idx_fecha_inicio` (`fecha_inicio`),
  ADD KEY `idx_tipo_evento` (`tipo_evento`),
  ADD KEY `idx_estado` (`estado`),
  ADD KEY `idx_facultad` (`facultad_carrera`),
  ADD KEY `creado_por` (`creado_por`);

--
-- Indexes for table `eventos_calendario`
--
ALTER TABLE `eventos_calendario`
  ADD PRIMARY KEY (`id_evento_local`),
  ADD UNIQUE KEY `google_event_id` (`google_event_id`),
  ADD KEY `idx_fecha_inicio` (`fecha_inicio`),
  ADD KEY `idx_google_id` (`google_event_id`),
  ADD KEY `idx_facultad` (`facultad_carrera`),
  ADD KEY `creado_por` (`creado_por`);

--
-- Indexes for table `evento_asistentes`
--
ALTER TABLE `evento_asistentes`
  ADD PRIMARY KEY (`id_asistente`),
  ADD UNIQUE KEY `unique_evento_email` (`evento_id`,`email`),
  ADD KEY `idx_evento` (`evento_id`),
  ADD KEY `idx_usuario` (`usuario_id`);

--
-- Indexes for table `grupos`
--
ALTER TABLE `grupos`
  ADD PRIMARY KEY (`id_grupo`),
  ADD UNIQUE KEY `codigo_grupo` (`codigo_grupo`),
  ADD KEY `idx_facultad_carrera` (`facultad_carrera`),
  ADD KEY `idx_lider` (`lider_id`),
  ADD KEY `idx_estado` (`estado`),
  ADD KEY `creado_por` (`creado_por`),
  ADD KEY `modificado_por` (`modificado_por`);

--
-- Indexes for table `inscripciones_eventos`
--
ALTER TABLE `inscripciones_eventos`
  ADD PRIMARY KEY (`id_inscripcion`),
  ADD UNIQUE KEY `unique_evento_usuario` (`evento_id`,`usuario_id`),
  ADD KEY `idx_evento` (`evento_id`),
  ADD KEY `idx_usuario` (`usuario_id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id_menu`),
  ADD KEY `idx_orden` (`orden`),
  ADD KEY `idx_activo` (`activo`),
  ADD KEY `idx_menu_padre` (`menu_padre_id`);

--
-- Indexes for table `menu_roles`
--
ALTER TABLE `menu_roles`
  ADD PRIMARY KEY (`id_menu_rol`),
  ADD UNIQUE KEY `unique_menu_rol` (`menu_id`,`rol`),
  ADD KEY `idx_menu_rol` (`menu_id`,`rol`),
  ADD KEY `idx_rol` (`rol`);

--
-- Indexes for table `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`id_persona`),
  ADD UNIQUE KEY `codigo_estudiante` (`codigo_estudiante`),
  ADD UNIQUE KEY `documento_identidad` (`documento_identidad`),
  ADD UNIQUE KEY `usuario_id` (`usuario_id`),
  ADD KEY `idx_codigo` (`codigo_estudiante`),
  ADD KEY `idx_documento` (`documento_identidad`),
  ADD KEY `idx_sede_facultad` (`sede`,`facultad`),
  ADD KEY `idx_programa` (`programa_estudio`),
  ADD KEY `idx_correo_personal` (`correo_personal`),
  ADD KEY `idx_correo_institucional` (`correo_institucional`),
  ADD KEY `creado_por` (`creado_por`),
  ADD KEY `modificado_por` (`modificado_por`);

--
-- Indexes for table `reportes_programados`
--
ALTER TABLE `reportes_programados`
  ADD PRIMARY KEY (`id_reporte`),
  ADD KEY `idx_tipo` (`tipo_reporte`),
  ADD KEY `idx_activo` (`activo`),
  ADD KEY `idx_proximo_envio` (`proximo_envio`),
  ADD KEY `creado_por` (`creado_por`);

--
-- Indexes for table `seguimiento_espiritual`
--
ALTER TABLE `seguimiento_espiritual`
  ADD PRIMARY KEY (`id_seguimiento`),
  ADD UNIQUE KEY `unique_usuario_fecha` (`usuario_id`,`fecha_registro`),
  ADD KEY `idx_usuario_fecha` (`usuario_id`,`fecha_registro`),
  ADD KEY `idx_fecha` (`fecha_registro`),
  ADD KEY `registrado_por` (`registrado_por`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `usuario` (`usuario`),
  ADD UNIQUE KEY `correo` (`correo`),
  ADD KEY `idx_usuario` (`usuario`),
  ADD KEY `idx_correo` (`correo`),
  ADD KEY `idx_rol` (`rol`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alertas`
--
ALTER TABLE `alertas`
  MODIFY `id_alerta` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `asistencias`
--
ALTER TABLE `asistencias`
  MODIFY `id_asistencia` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `catalogo_programas`
--
ALTER TABLE `catalogo_programas`
  MODIFY `id_programa` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `comunicaciones`
--
ALTER TABLE `comunicaciones`
  MODIFY `id_comunicacion` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `configuracion_sistema`
--
ALTER TABLE `configuracion_sistema`
  MODIFY `id_config` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `eventos`
--
ALTER TABLE `eventos`
  MODIFY `id_evento` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `eventos_calendario`
--
ALTER TABLE `eventos_calendario`
  MODIFY `id_evento_local` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `evento_asistentes`
--
ALTER TABLE `evento_asistentes`
  MODIFY `id_asistente` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `grupos`
--
ALTER TABLE `grupos`
  MODIFY `id_grupo` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inscripciones_eventos`
--
ALTER TABLE `inscripciones_eventos`
  MODIFY `id_inscripcion` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id_menu` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `menu_roles`
--
ALTER TABLE `menu_roles`
  MODIFY `id_menu_rol` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `personas`
--
ALTER TABLE `personas`
  MODIFY `id_persona` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reportes_programados`
--
ALTER TABLE `reportes_programados`
  MODIFY `id_reporte` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seguimiento_espiritual`
--
ALTER TABLE `seguimiento_espiritual`
  MODIFY `id_seguimiento` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
-- Constraints for table `alertas`
--
ALTER TABLE `alertas`
  ADD CONSTRAINT `alertas_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE,
  ADD CONSTRAINT `alertas_ibfk_2` FOREIGN KEY (`creado_por`) REFERENCES `usuario` (`id_usuario`) ON DELETE SET NULL,
  ADD CONSTRAINT `alertas_ibfk_3` FOREIGN KEY (`resuelto_por`) REFERENCES `usuario` (`id_usuario`) ON DELETE SET NULL;

--
-- Constraints for table `asistencias`
--
ALTER TABLE `asistencias`
  ADD CONSTRAINT `asistencias_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE,
  ADD CONSTRAINT `asistencias_ibfk_2` FOREIGN KEY (`grupo_id`) REFERENCES `grupos` (`id_grupo`) ON DELETE CASCADE,
  ADD CONSTRAINT `asistencias_ibfk_3` FOREIGN KEY (`registrado_por`) REFERENCES `usuario` (`id_usuario`) ON DELETE SET NULL;

--
-- Constraints for table `comunicaciones`
--
ALTER TABLE `comunicaciones`
  ADD CONSTRAINT `comunicaciones_ibfk_1` FOREIGN KEY (`filtro_grupo`) REFERENCES `grupos` (`id_grupo`) ON DELETE SET NULL,
  ADD CONSTRAINT `comunicaciones_ibfk_2` FOREIGN KEY (`usuario_destinatario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE,
  ADD CONSTRAINT `comunicaciones_ibfk_3` FOREIGN KEY (`enviado_por`) REFERENCES `usuario` (`id_usuario`) ON DELETE SET NULL;

--
-- Constraints for table `configuracion_sistema`
--
ALTER TABLE `configuracion_sistema`
  ADD CONSTRAINT `configuracion_sistema_ibfk_1` FOREIGN KEY (`modificado_por`) REFERENCES `usuario` (`id_usuario`) ON DELETE SET NULL;

--
-- Constraints for table `eventos`
--
ALTER TABLE `eventos`
  ADD CONSTRAINT `eventos_ibfk_1` FOREIGN KEY (`creado_por`) REFERENCES `usuario` (`id_usuario`) ON DELETE SET NULL;

--
-- Constraints for table `eventos_calendario`
--
ALTER TABLE `eventos_calendario`
  ADD CONSTRAINT `eventos_calendario_ibfk_1` FOREIGN KEY (`creado_por`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE;

--
-- Constraints for table `evento_asistentes`
--
ALTER TABLE `evento_asistentes`
  ADD CONSTRAINT `evento_asistentes_ibfk_1` FOREIGN KEY (`evento_id`) REFERENCES `eventos_calendario` (`id_evento_local`) ON DELETE CASCADE,
  ADD CONSTRAINT `evento_asistentes_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE;

--
-- Constraints for table `grupos`
--
ALTER TABLE `grupos`
  ADD CONSTRAINT `grupos_ibfk_1` FOREIGN KEY (`lider_id`) REFERENCES `usuario` (`id_usuario`) ON DELETE SET NULL,
  ADD CONSTRAINT `grupos_ibfk_2` FOREIGN KEY (`creado_por`) REFERENCES `usuario` (`id_usuario`) ON DELETE SET NULL,
  ADD CONSTRAINT `grupos_ibfk_3` FOREIGN KEY (`modificado_por`) REFERENCES `usuario` (`id_usuario`) ON DELETE SET NULL;

--
-- Constraints for table `inscripciones_eventos`
--
ALTER TABLE `inscripciones_eventos`
  ADD CONSTRAINT `inscripciones_eventos_ibfk_1` FOREIGN KEY (`evento_id`) REFERENCES `eventos` (`id_evento`) ON DELETE CASCADE,
  ADD CONSTRAINT `inscripciones_eventos_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE;

--
-- Constraints for table `menus`
--
ALTER TABLE `menus`
  ADD CONSTRAINT `menus_ibfk_1` FOREIGN KEY (`menu_padre_id`) REFERENCES `menus` (`id_menu`) ON DELETE CASCADE;

--
-- Constraints for table `menu_roles`
--
ALTER TABLE `menu_roles`
  ADD CONSTRAINT `menu_roles_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id_menu`) ON DELETE CASCADE;

--
-- Constraints for table `personas`
--
ALTER TABLE `personas`
  ADD CONSTRAINT `personas_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id_usuario`) ON DELETE SET NULL,
  ADD CONSTRAINT `personas_ibfk_2` FOREIGN KEY (`creado_por`) REFERENCES `usuarios` (`id_usuario`) ON DELETE SET NULL,
  ADD CONSTRAINT `personas_ibfk_3` FOREIGN KEY (`modificado_por`) REFERENCES `usuarios` (`id_usuario`) ON DELETE SET NULL;

--
-- Constraints for table `reportes_programados`
--
ALTER TABLE `reportes_programados`
  ADD CONSTRAINT `reportes_programados_ibfk_1` FOREIGN KEY (`creado_por`) REFERENCES `usuario` (`id_usuario`) ON DELETE SET NULL;

--
-- Constraints for table `seguimiento_espiritual`
--
ALTER TABLE `seguimiento_espiritual`
  ADD CONSTRAINT `seguimiento_espiritual_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE,
  ADD CONSTRAINT `seguimiento_espiritual_ibfk_2` FOREIGN KEY (`registrado_por`) REFERENCES `usuario` (`id_usuario`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
