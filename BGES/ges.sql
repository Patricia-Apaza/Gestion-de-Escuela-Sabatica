-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 07, 2025 at 04:49 AM
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
(11, '0a0orbiv007s7mmeh0j96uu8d8', 'Escuela Sabática 2026', 'Confraternidad grupos pequeños', '2025-12-15 09:00:00', '2025-12-15 18:00:00', 'Universidad', '#1976d2', 'PLANIFICADO', 'OTRO', NULL, 'TODOS', 1, '2025-09-30 04:50:34', 1, 30, '2025-09-30 09:50:33', 2),
(14, 'pg4tk2pet5b4nr16ubcajn1roo', 'Sábado con tu facultad', 'Confraternidad grupos pequeños', '2025-12-15 09:00:00', '2025-12-15 18:00:00', 'Universidad', '#1976d2', 'PLANIFICADO', 'OTRO', NULL, 'TODOS', 1, '2025-10-06 08:01:56', 1, 30, '2025-10-06 13:01:52', 1);

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
(14, 11, NULL, 'maria.garcia@upeu.edu.pe', 'PENDIENTE', NULL, 0, NULL),
(15, 14, NULL, 'maria@upeu.edu.pe', 'PENDIENTE', NULL, 0, NULL);

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
(1, 2, '202499999', 'ANDY', 'ATAMARI CCAZA', '09876543', 'andy.nuevo@gmail.com', 'andy.atamari@upeu.edu.pe', 'andy.atamari', '946903345', 'Perú', NULL, 'Adventista del Séptimo Día', '2006-11-16', '2025-07-15 14:46:00', 'REGULAR', 'PRESENCIAL', 'FILIAL_JULIACA', 'Facultad de Ingeniería y Arquitectura', 'Ingeniería de Sistemas', 2, 1, '2025-10-05 13:36:12', '2025-10-07 04:31:55', 1, 1),
(2, 3, '202411999', 'MARIA', 'GOMEZ', '62177497', 'maria@gmail.com', 'maria@upeu.edu.pe', 'maria.gomez', '999888777', 'Perú', NULL, NULL, NULL, NULL, 'REGULAR', 'PRESENCIAL', 'FILIAL_JULIACA', 'Facultad de Ingeniería y Arquitectura', 'Ingeniería de Sistemas', 2, 1, '2025-10-05 13:37:01', '2025-10-05 13:37:01', 1, NULL),
(841, 851, '202320800', 'Joseph Rodrigo', 'Choquecota Centon', '75388130', NULL, '75388130@upeu.edu.pe', '75388130', '935277841', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:33:38', '2025-10-07 04:33:38', 1, NULL),
(842, 852, '202411761', 'Jimy Alvaro', 'Catacora Mamani', '76008236', 'alvarocatacora14@gmail.com', NULL, 'jimy.catacora', '951577514', 'Perú', NULL, 'Ninguno', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:33:38', '2025-10-07 04:33:38', 1, NULL),
(843, 853, '202411764', 'YEFER GUZMAN', 'YANARICO COAQUIRA', '60178124', '60178124@upeu.edu.pe', NULL, '60178124', '921838850', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:33:38', '2025-10-07 04:33:38', 1, NULL),
(844, 854, '202411930', 'KRESLEY YESEMIA', 'ARACA LLANOS', '60223519', '60223519@upeu.edu.pe', NULL, '60223519', '944295161', 'Perú', NULL, 'Ninguno', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:33:39', '2025-10-07 04:33:39', 1, NULL),
(845, 855, '202511806', 'JIMENA MARISOL', 'LUPACA MAMANI', '61254722', 'jimena.l.mamani@upeu.edu.pe', NULL, 'jimena.l.mamani', '917233272', 'Perú', NULL, 'Ninguno', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:33:39', '2025-10-07 04:33:39', 1, NULL),
(846, 856, '202511811', 'SHANTI YAMELY', 'APAZA CALISAYA', '60178283', 'shanti.apaza@upeu.edu.pe', NULL, 'shanti.apaza', '991482738', 'Perú', NULL, 'Evangélico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:33:40', '2025-10-07 04:33:40', 1, NULL),
(847, 857, '202512418', 'BRAYAN GODOY', 'SONCCO QUISPE', '74161774', 'brayan.soncco@upeu.edu.pe', NULL, 'brayan.soncco', '943761621', 'Perú', NULL, 'Ninguno', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:33:40', '2025-10-07 04:33:40', 1, NULL),
(848, 858, '202512726', 'JUAN JARED', 'LOPEZ FLORES', '61169393', NULL, 'jared.lopez@upeu.edu.pe', 'jared.lopez', '983 180 966', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:33:41', '2025-10-07 04:33:41', 1, NULL),
(849, 859, '202513403', 'DAMARYS NOHEMI', 'CHATA CCALLATA', '75539322', NULL, 'damarys.c.ccallata@upeu.edu.pe', 'damarys.c.ccallata', '925600597', 'Perú', NULL, 'Evangélico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:33:41', '2025-10-07 04:33:41', 1, NULL),
(850, 860, '202520175', 'CARLOS DANIEL', 'CONDORI PARIZACA', '71494687', NULL, 'carlos.condori01@upeu.edu.pe', 'carlos.condori01', '917180677', 'Perú', NULL, 'Ninguno', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:33:42', '2025-10-07 04:33:42', 1, NULL),
(851, 861, '202520176', 'DIEGO ALEXANDER', 'YANARICO QUISPE', '60837126', NULL, 'diego.yanarico@upeu.edu.pe', 'diego.yanarico', '927626743', 'Perú', NULL, 'Ninguno', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:33:42', '2025-10-07 04:33:42', 1, NULL),
(852, 862, '202520177', 'Jhon Franklin', 'Yana Chino', '60837070', NULL, 'jhon.yana12@upeu.edu.pe', 'jhon.yana12', '942232483', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:33:43', '2025-10-07 04:33:43', 1, NULL),
(853, 863, '202520179', 'YORD BRAYAN', 'PARICAHUA OJEDA', '75115296', NULL, 'yord.paricahua@upeu.edu.pe', 'yord.paricahua', '931038617', 'Perú', NULL, 'Ninguno', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:33:43', '2025-10-07 04:33:43', 1, NULL),
(854, 864, '202520182', 'CONDORI EDSON', 'LIPA', '60491200', NULL, 'edson.lipa@upeu.edu.pe', 'edson.lipa', '929959596', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:33:44', '2025-10-07 04:33:44', 1, NULL),
(855, 865, '202520183', 'Kenyer Rodrigo', 'Uturunco Zea', '61158689', NULL, 'kenyer.uturunco@upeu.edu.pe', 'kenyer.uturunco', '956040421', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:33:44', '2025-10-07 04:33:44', 1, NULL),
(856, 866, '202520641', 'JHONATAN BRAULIO', 'PARRA CARCAUSTO', '60313698', NULL, 'jhonatan.parra@upeu.edu.pe', 'jhonatan.parra', '935621528', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:33:45', '2025-10-07 04:33:45', 1, NULL),
(857, 867, '202520644', 'Yack Jemner', 'Condori Apaza', '75444647', 'yackjemner@gmail.com', 'yack.condori@upeu.edu.pe', 'yack.condori', '939766762', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:33:46', '2025-10-07 04:33:46', 1, NULL),
(858, 868, '202520649', 'EDILSON DIWAR', 'CONDORI LARICO', '60178377', NULL, 'edilson.condori49@upeu.edu.pe', 'edilson.condori49', '918430377', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:33:46', '2025-10-07 04:33:46', 1, NULL),
(859, 869, '202520650', 'RUTH MAYUMI', 'BAÑOS TURPO', '60909519', NULL, 'ruth.banos@upeu.edu.pe', 'ruth.banos', '910726850', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:33:47', '2025-10-07 04:33:47', 1, NULL),
(860, 870, '202520653', 'JESÚS EDUARDO', 'COARITE APAZA', '70951845', NULL, 'jesus.coarite@upeu.edu.pe', 'jesus.coarite', '900552287', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:33:47', '2025-10-07 04:33:47', 1, NULL),
(861, 871, '202520654', 'Alexander Noe', 'Coila Pelinco', '60328308', NULL, 'alexander.c.pelinco@upeu.edu.pe', 'alexander.c.pelinco', '987472408', 'Perú', NULL, 'Pentecostes', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:33:48', '2025-10-07 04:33:48', 1, NULL),
(862, 872, '202520656', 'JOSHEP FERNANDO', 'APAZA CAUNA', '74958840', 'joshep.apaza@upeu.edu.pe', 'joshep.apaza@upeu.edu.pe', 'joshep.apaza', '925698882', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:33:48', '2025-10-07 04:33:48', 1, NULL),
(863, 873, '202520660', 'WILSON ALEX', 'HUACASI PARQUI', '75864306', NULL, 'wilson.huacasi@upeu.edu.pe', 'wilson.huacasi', '995449443', 'Perú', NULL, 'Ninguno', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:33:49', '2025-10-07 04:33:49', 1, NULL),
(864, 874, '202520668', 'Jhonatan Juan', 'Aparicio Nina', '60590400', NULL, 'jhonatan.aparicio@upeu.edu.pe', 'jhonatan.aparicio', '958682305', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:33:49', '2025-10-07 04:33:49', 1, NULL),
(865, 875, '202520670', 'JOSE ALONZO REY', 'MAMANI QUISPE', '60176891', NULL, 'jose.mamani70@upeu.edu.pe', 'jose.mamani70', '987167968', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:33:50', '2025-10-07 04:33:50', 1, NULL),
(866, 876, '202520672', 'JOSUE ELIAS', 'VILCA FLORES', '75079545', NULL, 'josue.vilca@upeu.edu.pe', 'josue.vilca', '963221368', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:33:50', '2025-10-07 04:33:50', 1, NULL),
(867, 877, '202520673', 'FLOR NOEMY', 'TAPIA HERRERA', '60609859', NULL, 'flor.tapia@upeu.edu.pe', 'flor.tapia', '978884792', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:33:51', '2025-10-07 04:33:51', 1, NULL),
(868, 878, '202010771', 'Juan Sebastian', 'Condori Alanoca', '73430214', NULL, 'sebastian.condori@upeu.edu.pe', 'sebastian.condori', '967881233', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:33:52', '2025-10-07 04:33:52', 1, NULL),
(869, 879, '202123398', 'DENIS IVAN', 'APAZA MAMANI', '77495663', NULL, 'denisivan.apaza@upeu.edu.pe', 'denisivan.apaza', '982856949', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:33:52', '2025-10-07 04:33:52', 1, NULL),
(870, 880, '202414040', 'Cristhian David', 'Larico Cossio', '75396287', '75396287@upeu.edu.pe', NULL, 'cristhian.larico', '941177277', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:33:53', '2025-10-07 04:33:53', 1, NULL),
(871, 881, '202420892', 'KENJI ABEL', 'MAMANI QUIZA', '60065754', 'kenji.m.quiza@upeu.edu.pe', NULL, 'kenji.m.quiza', '927211445', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:33:53', '2025-10-07 04:33:53', 1, NULL),
(872, 882, '202510879', 'AARON JARED', 'ROMERO PARI', '61254718', 'aaron.r.pari@upeu.edu.pe', NULL, 'aaron.r.pari', '939755026', 'Perú', NULL, 'Evangélico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:33:53', '2025-10-07 04:33:53', 1, NULL),
(873, 883, '202511799', 'DEYVIS WILLIAMS', 'VARGAS CHARA', '60507026', 'deyvis.vargas@upeu.edu.pe', NULL, 'deyvis.vargas', '936952057', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:33:54', '2025-10-07 04:33:54', 1, NULL),
(874, 884, '202511805', 'GEAN PAUL FERNANDO', 'HANCCO MESTAS', '60230784', NULL, 'gean.h.mestas@upeu.edu.pe', 'gean.h.mestas', '940545147', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:33:54', '2025-10-07 04:33:54', 1, NULL),
(875, 885, '202511807', 'WILLIAMS ANTHONY', 'CONDORI HUAMAN', '60346291', 'williams.c.huaman@upeu.edu.pe', NULL, 'williams.c.huaman', '931130830', 'Perú', NULL, 'Ninguno', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:33:55', '2025-10-07 04:33:55', 1, NULL),
(876, 886, '202512437', 'KEVIN JHEAMPOOL', 'CONDORI QUISOCALA', '77126506', 'kevin.condori37@upeu.edu.pe', NULL, 'kevin.condori37', '935890085', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:33:55', '2025-10-07 04:33:55', 1, NULL),
(877, 887, '202514018', 'ALEXANDER AQUILES', 'ESCOBAR MAMANI', '76411397', NULL, 'alexander.escobar@upeu.edu.pe', 'alexander.escobar', '925720165', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:33:56', '2025-10-07 04:33:56', 1, NULL),
(878, 888, '202514350', 'JHON ALEXIS', 'MAMANI CCOSI', '60170463', NULL, 'jhon.mamani50@upeu.edu.pe', 'jhon.mamani50', '928481808', 'Perú', NULL, 'Ninguno', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:33:56', '2025-10-07 04:33:56', 1, NULL),
(879, 889, '202520174', 'OSCAR KENNETH', 'VELARDE MANRIQUE', '73148140', NULL, 'oscar.velarde@upeu.edu.pe', 'oscar.velarde', '943054899', 'Perú', NULL, 'Mormón', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:33:57', '2025-10-07 04:33:57', 1, NULL),
(880, 890, '202520181', 'Hadad Henry', 'Humpiri Humalla', '73539052', NULL, 'hadad.humpiri@upeu.edu.pe', 'hadad.humpiri', '926242640', 'Perú', NULL, 'Ninguno', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:33:57', '2025-10-07 04:33:57', 1, NULL),
(881, 891, '202520643', 'ERICK GONZALO', 'QUISPE APAZA', '74351137', NULL, 'erick.quispe43@upeu.edu.pe', 'erick.quispe43', '978953431', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:33:58', '2025-10-07 04:33:58', 1, NULL),
(882, 892, '202520645', 'BRANDON JACK', 'QUISPE ZAPANA', '76871021', NULL, 'brandon.quispe45@upeu.edu.pe', 'brandon.quispe45', '930435034', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:33:58', '2025-10-07 04:33:58', 1, NULL),
(883, 893, '202520647', 'JHARET JHOEL', 'VILLANUEVA QUISPE', '60568568', NULL, 'jharet.villanueva@upeu.edu.pe', 'jharet.villanueva', '961142846', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:33:59', '2025-10-07 04:33:59', 1, NULL),
(884, 894, '202520651', 'ROSY LUZ', 'YANA CUTIPA', '61000701', NULL, 'rosy.yana@upeu.edu.pe', 'rosy.yana', '958098998', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:33:59', '2025-10-07 04:33:59', 1, NULL),
(885, 895, '202520655', 'ROY JHON EMERSON', 'QUIROZ MOLLEAPAZA', '60068251', NULL, 'roy.quiroz@upeu.edu.pe', 'roy.quiroz', '919015049', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:00', '2025-10-07 04:34:00', 1, NULL),
(886, 896, '202520659', 'QUISPE ANDERSON', 'CAHUANA', '76697759', NULL, 'anderson.cahuana@upeu.edu.pe', 'anderson.cahuana', '957962001', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:00', '2025-10-07 04:34:00', 1, NULL),
(887, 897, '202520661', 'Will Spierro', 'Fernandez Soncco', '72669364', NULL, 'will.fernandez@upeu.edu.pe', 'will.fernandez', '992401926', 'Perú', NULL, 'Ninguno', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:01', '2025-10-07 04:34:01', 1, NULL),
(888, 898, '202520662', 'PITER BRAYAN', 'CRUZ SACACA', '60069631', NULL, 'piter.cruz@upeu.edu.pe', 'piter.cruz', '967947477', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:01', '2025-10-07 04:34:01', 1, NULL),
(889, 899, '202520663', 'WILLYAN SMITH', 'QUENAYA LAURA', '60515642', NULL, 'willyan.quenaya@upeu.edu.pe', 'willyan.quenaya', '906062542', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:02', '2025-10-07 04:34:02', 1, NULL),
(890, 900, '202520664', 'JOSUE JUNIOR', 'MIRANDA TORRES', '71995638', NULL, 'josue.miranda@upeu.edu.pe', 'josue.miranda', '923950202', 'Perú', NULL, 'Ninguno', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:02', '2025-10-07 04:34:02', 1, NULL),
(891, 901, '202520665', 'Jackie Elias', 'Mamani Rayme', '77908329', NULL, 'jackie.mamani@upeu.edu.pe', 'jackie.mamani', '935027235', 'Perú', NULL, 'Ninguno', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:03', '2025-10-07 04:34:03', 1, NULL),
(892, 902, '202520669', 'NIXON BRAYAN', 'HUALLA MORALES', '74179332', NULL, 'nixon.hualla@upeu.edu.pe', 'nixon.hualla', '900106406', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:03', '2025-10-07 04:34:03', 1, NULL),
(893, 903, '202520675', 'BRAYNER JHOSEP', 'PAREDES ALANOCA', '60069766', NULL, 'brayner.paredes@upeu.edu.pe', 'brayner.paredes', '997919376', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:04', '2025-10-07 04:34:04', 1, NULL),
(894, 904, '201812033', 'Daniela Lisbet', 'Condor Carreño', '71830701', 'daniela.condor@upeu.edu.pe', NULL, 'daniela.condor', '928697556', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:05', '2025-10-07 04:34:05', 1, NULL),
(895, 905, '202312711', 'Rojas Adan', 'Yana', '76086111', 'adanyanarojas@gmail.com', 'adan.yana@upeu.edu.pe', 'adan.yana', '966272115', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:05', '2025-10-07 04:34:05', 1, NULL),
(896, 906, '202410796', 'Yony Olmedo', 'Mamani Mamani', '75262822', 'yonyalcon12345@gmail.com', NULL, 'yony.mamani', '999959501', 'Perú', NULL, 'Ninguno', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:06', '2025-10-07 04:34:06', 1, NULL),
(897, 907, '202410819', 'ADEMIR ADRIAN', 'QUISOCALA MAMANI', '62728060', 'ademirtp12@gmail.com', NULL, '62728060', '948297516', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:06', '2025-10-07 04:34:06', 1, NULL),
(898, 908, '202411594', 'Jhon Sebastian', 'Taco Sumi', '60909452', '60909452@upeu.edu.pe', NULL, '60909452', '976303763', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:07', '2025-10-07 04:34:07', 1, NULL),
(899, 909, '202420363', 'Zamyr Nelio', 'Quispe Oquendo', '75506232', '75506232@upeu.edu.pe', NULL, '75506232', '963837426', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:07', '2025-10-07 04:34:07', 1, NULL),
(900, 910, '202420368', 'JUAN BERNARDO', 'BENIQUE CANAZA', '60908863', 'bernardo.benique@upeu.edu.pe', NULL, 'bernardo.benique', '902240595', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:08', '2025-10-07 04:34:08', 1, NULL),
(901, 911, '202510050', 'YOEL WAGNER', 'CHAMBI SIRENA', '73709582', 'wagner.chambi@upeu.edu.pe', NULL, 'wagner.chambi', '910099127', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:08', '2025-10-07 04:34:08', 1, NULL),
(902, 912, '202510052', 'WILSON RONALD', 'APAZA MAMANI', '76183244', 'ronald.apaza.m@upeu.edu.pe', NULL, 'ronald.apaza.m', '950986110', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:09', '2025-10-07 04:34:09', 1, NULL),
(903, 913, '202510053', 'Jhon Nildwar Miroshi', 'Tito Quispe', '75022601', 'nildwar.miroshi.tito@upeu.edu.pe', NULL, 'nildwar.miroshi.tito', '957768546', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:09', '2025-10-07 04:34:09', 1, NULL),
(904, 914, '202510847', 'VITZUEL ALEXANDER', 'MAMANI ALVARADO', '76241979', 'vitzuel.m.alvarado@upeu.edu.pe', NULL, 'vitzuel.m.alvarado', '993121281', 'Perú', NULL, 'Evangélico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:10', '2025-10-07 04:34:10', 1, NULL),
(905, 915, '202510852', 'Ricky Jherson', 'Mamani Adco', '76098003', 'ricky.m.adco@upeu.edu.pe', NULL, 'ricky.m.adco', '929388380', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:10', '2025-10-07 04:34:10', 1, NULL),
(906, 916, '202510855', 'JUAN CARLOS', 'PELINCO DIAZ', '61320133', 'juan.p.diaz@upeu.edu.pe', NULL, 'juan.p.diaz', '913545244', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:11', '2025-10-07 04:34:11', 1, NULL),
(907, 917, '202510866', 'Merry Krisellt', 'Mamani Ali', '73454203', 'merry.m.ali@upeu.edu.pe', NULL, 'merry.m.ali', '900170273', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:11', '2025-10-07 04:34:11', 1, NULL),
(908, 918, '202510869', 'ABNER JOSUE', 'QUISPE APAZA', '60200800', 'abner.q.apaza@upeu.edu.pe', NULL, 'abner.q.apaza', '928697382', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:12', '2025-10-07 04:34:12', 1, NULL),
(909, 919, '202510870', 'BENHY JULIAN', 'CHAÑE CUBA', '60332555', 'benhy.c.cuba@upeu.edu.pe', NULL, 'benhy.c.cuba', '932530825', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:12', '2025-10-07 04:34:12', 1, NULL),
(910, 920, '202510873', 'MOISES ZIDANE', 'CONDORI QUISPE', '72755236', 'zidane.condori@upeu.edu.pe', NULL, 'zidane.condori', '912602781', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:13', '2025-10-07 04:34:13', 1, NULL),
(911, 921, '202510876', 'Piero Jesus', 'Ccari Palomino', '71184714', 'piero.c.palomino@upeu.edu.pe', NULL, 'piero.c.palomino', '997065358', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:13', '2025-10-07 04:34:13', 1, NULL),
(912, 922, '202510878', 'ARON RODRIGO', 'MAGAÑO QUISPE', '61321012', 'aron.m.quispe@upeu.edu.pe', NULL, 'aron.m.quispe', '996626265', 'Perú', NULL, 'Ninguno', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:14', '2025-10-07 04:34:14', 1, NULL),
(913, 923, '202510881', 'Nestor Elisban', 'Huaylla Pila', '74988143', 'nestor.h.pila@upeu.edu.pe', NULL, 'nestor.h.pila', '949329822', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:14', '2025-10-07 04:34:14', 1, NULL),
(914, 924, '202511810', 'CRISTIAN OLIVER', 'CCANAHUIRE TTITO', '61306601', 'cristian.ccanahuire@upeu.edu.pe', NULL, 'cristian.ccanahuire', '935751474', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:15', '2025-10-07 04:34:15', 1, NULL),
(915, 925, '202511816', 'CONDORI CHRISTIAN', 'MAMANI', '60554840', 'christian.mamani16@upeu.edu.pe', NULL, 'christian.mamani16', '952363731', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:15', '2025-10-07 04:34:15', 1, NULL),
(916, 926, '202512417', 'JOEL ANTHONY', 'CEREZO GUTIERREZ', '61047109', 'joel.cerezo@upeu.edu.pe', NULL, 'joel.cerezo', '926929318', 'Perú', NULL, 'Evangélico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:16', '2025-10-07 04:34:16', 1, NULL),
(917, 927, '202512424', 'RONALD JOEL', 'GARCIA PARI', '60067206', 'joel.garcia@upeu.edu.pe', NULL, 'joel.garcia', '946704299', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:17', '2025-10-07 04:34:17', 1, NULL),
(918, 928, '202512432', 'DIEGO JUAN', 'MONTESINOS CHURQUI', '72213066', 'diego.montesinos@upeu.edu.pe', NULL, 'diego.montesinos', '950984514', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:17', '2025-10-07 04:34:17', 1, NULL),
(919, 929, '202512438', 'JIMY WILLIAM', 'AMANQUI CARCASI', '61320454', 'jimy.amanqui@upeu.edu.pe', NULL, 'jimy.amanqui', '900410703', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:17', '2025-10-07 04:34:17', 1, NULL),
(920, 930, '202513287', 'PEDRO EDUARDO', 'LOAYZA HUAMAN', '61001187', NULL, 'pedro.loayza@upeu.edu.pe', 'pedro.loayza', '971981251', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:17', '2025-10-07 04:34:17', 1, NULL),
(921, 931, '202513361', 'RONY AYMAR', 'TUMBILLO VILLANES', '74407364', NULL, 'rony.t.villanes@upeu.edu.pe', 'rony.t.villanes', '924722171', 'Perú', NULL, 'Ninguno', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:18', '2025-10-07 04:34:18', 1, NULL),
(922, 932, '202513363', 'CRISTIAN INDU JOEL', 'MAMANI MAMANI', '61091942', NULL, 'indu.joel.mamani@upeu.edu.pe', 'indu.joel.mamani', '900204481', 'Perú', NULL, 'Ninguno', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:18', '2025-10-07 04:34:18', 1, NULL),
(923, 933, '202514016', 'YAMPIER ANTONI', 'APAZA TURPO', '60764926', NULL, 'yampier.apaza@upeu.edu.pe', 'yampier.apaza', '915229337', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:18', '2025-10-07 04:34:18', 1, NULL),
(924, 934, '202514022', 'FRANCISCO ROGER', 'APAZA CHAMBI', '61093455', NULL, 'francisco.apaza@upeu.edu.pe', 'francisco.apaza', '974261517', 'Perú', NULL, 'Ninguno', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:19', '2025-10-07 04:34:19', 1, NULL),
(925, 935, '202514024', 'SACACHIPANA PAUL', 'CARIAPAZA', '60313938', NULL, 'paul.cariapaza@upeu.edu.pe', 'paul.cariapaza', '924220984', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:19', '2025-10-07 04:34:19', 1, NULL),
(926, 936, '202514027', 'DEYVIS JHOEL', 'LARICO CCAPA', '61001435', NULL, 'deyvis.larico@upeu.edu.pe', 'deyvis.larico', '914295837', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:19', '2025-10-07 04:34:19', 1, NULL),
(927, 937, '202514029', 'Romel Elio', 'Chino Apaza', '60305347', NULL, 'romel.chino@upeu.edu.pe', 'romel.chino', '946757683', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:20', '2025-10-07 04:34:20', 1, NULL),
(928, 938, '202010050', 'U?Apillco Isai', 'Armuto', '76922744', 'isai.armuto@upeu.edu.pe', NULL, 'isai.armuto', '930989110', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:20', '2025-10-07 04:34:20', 1, NULL),
(929, 939, '202211714', 'Henrry Lidhuardo', 'Hancco Sucari', '71662465', '0HenrryGamerYT@gmail.com', NULL, 'henrry.hancco', '929554862', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:21', '2025-10-07 04:34:21', 1, NULL),
(930, 940, '202211853', 'Maikol Nehemias', 'Quispe Ramos', '73944395', 'sgihfffyljff@gmail.com', NULL, 'maikol.quispe', '983060263', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:21', '2025-10-07 04:34:21', 1, NULL),
(931, 941, '202320599', 'Fany Lizbeth', 'Pari Coaquira', '73264878', '73264878@upeu.edu.pe', '73264878@upeu.edu.pe', '73264878', '51942036642', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:22', '2025-10-07 04:34:22', 1, NULL),
(932, 942, '202410795', 'Erick Midwar', 'Calsin Chura', '76843712', '76843712@upeu.edu.pe', NULL, '76843712', '943065682', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:22', '2025-10-07 04:34:22', 1, NULL),
(933, 943, '202420884', 'YERSON MICHEL', 'MAMANI CHALLCO', '75446439', 'michel.mamani.c@upeu.edu.pe', NULL, 'michel.mamani.c', '991837157', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:23', '2025-10-07 04:34:23', 1, NULL),
(934, 944, '202510051', 'YOSMET LEODAN', 'RAMIREZ POMARI', '73647610', 'yosmet.r.pomari@upeu.edu.pe', NULL, 'yosmet.r.pomari', '989011587', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:23', '2025-10-07 04:34:23', 1, NULL),
(935, 945, '202510054', 'LEYTON ANTHONY', 'ALI CHAVEZ', '60909369', 'leyton.a.chavez@upeu.edu.pe', NULL, 'leyton.a.chavez', '916879939', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:24', '2025-10-07 04:34:24', 1, NULL),
(936, 946, '202510850', 'JHON ANDERSON', 'PARICELA YAPU', '61254572', 'jhon.p.yapu@upeu.edu.pe', NULL, 'jhon.p.yapu', '925574233', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:24', '2025-10-07 04:34:24', 1, NULL),
(937, 947, '202510851', 'MAYKOL GABRIEL', 'MONTALVO MACHACA', '61159322', 'maykol.m.machaca@upeu.edu.pe', NULL, 'maykol.m.machaca', '935302584', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:25', '2025-10-07 04:34:25', 1, NULL),
(938, 948, '202510858', 'EDDY BRAYAN', 'HUAMAN TACO', '71181665', 'eddy.h.taco@upeu.edu.pe', NULL, 'eddy.h.taco', '950734752', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:25', '2025-10-07 04:34:25', 1, NULL),
(939, 949, '202510861', 'MAMANI RODRIGO', 'HUAMAN', '61320523', 'rodrigo.h.mamani@upeu.edu.pe', NULL, 'rodrigo.h.mamani', '948262268', 'Perú', NULL, 'Ninguno', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:25', '2025-10-07 04:34:25', 1, NULL),
(940, 950, '202511024', 'DEYSI NEYDA', 'CRUZ MENDOZA', '60527338', NULL, 'deysi.c.mendoza@upeu.edu.pe', 'deysi.c.mendoza', '927480509', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:26', '2025-10-07 04:34:26', 1, NULL),
(941, 951, '202511809', 'JUAN ENRRIQUE', 'ESTRADA MURGA', '60213460', 'juan.estrada@upeu.edu.pe', NULL, 'juan.estrada', '914054205', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:26', '2025-10-07 04:34:26', 1, NULL),
(942, 952, '202511823', 'JÉTER JOSUE', 'SUCASAIRE PANCA', '71177564', 'jeter.sucasaire@upeu.edu.pe', NULL, 'jeter.sucasaire', '977768270', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:27', '2025-10-07 04:34:27', 1, NULL),
(943, 953, '202512420', 'KAREN MILAGROS', 'APAZA PECCA', '77098082', 'karen.apaza20@upeu.edu.pe', NULL, 'karen.apaza20', '993849550', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:28', '2025-10-07 04:34:28', 1, NULL),
(944, 954, '202512427', 'Daniel Eddy', 'Condori Titi', '60589442', 'daniel.condori27@upeu.edu.pe', NULL, 'daniel.condori27', '992951304', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:28', '2025-10-07 04:34:28', 1, NULL),
(945, 955, '202512430', 'PIERO ALONZO', 'PARICAHUA APAZA', '60884712', 'piero.p.apaza@upeu.edu.pe', NULL, 'piero.p.apaza', '930717754', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:29', '2025-10-07 04:34:29', 1, NULL),
(946, 956, '202513362', 'ADRIAN JAIR', 'SAMANEZ RODRIGUEZ', '60665319', NULL, 'adrian.s.rodriguez@upeu.edu.pe', 'adrian.s.rodriguez', '924463124', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:29', '2025-10-07 04:34:29', 1, NULL),
(947, 957, '202513364', 'Anthony Erick Jorge', 'Ccosi Sucapuca', '61158799', NULL, 'anthony.c.sucapuca@upeu.edu.pe', 'anthony.c.sucapuca', '987590865', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:29', '2025-10-07 04:34:29', 1, NULL),
(948, 958, '202513366', 'ZAGGI LEONARDO', 'MORALES AUQUIPATA', '62181001', NULL, 'zaggi.m.auquipata@upeu.edu.pe', 'zaggi.m.auquipata', '982090921', 'Perú', NULL, 'Ninguno', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:30', '2025-10-07 04:34:30', 1, NULL),
(949, 959, '202514021', 'DEYSI KARINA', 'MAMANI CONDORI', '60765399', NULL, 'deysi.mamani21@upeu.edu.pe', 'deysi.mamani21', '986411187', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:30', '2025-10-07 04:34:30', 1, NULL),
(950, 960, '202514023', 'CHOQUEHUANCA EDWIN', 'CAYO', '76948523', NULL, 'edwin.c.choquehuanca@upeu.edu.pe', 'edwin.c.choquehuanca', '965109004', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:30', '2025-10-07 04:34:30', 1, NULL),
(951, 961, '202514031', 'AXCEL DANIEL', 'VARGAS QUISPE', '60764748', NULL, 'axcel.vargas@upeu.edu.pe', 'axcel.vargas', '914442897', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:31', '2025-10-07 04:34:31', 1, NULL),
(952, 962, '202514034', 'ELVIS PAUL', 'CONDORI CALISAYA', '60581244', NULL, 'elvis.condori34@upeu.edu.pe', 'elvis.condori34', '928803469', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:31', '2025-10-07 04:34:31', 1, NULL),
(953, 963, '202514035', 'STALIM JAVIER', 'CAYTE CUTISACA', '74463509', NULL, 'stalim.c.cutisaca@upeu.edu.pe', 'stalim.c.cutisaca', '964570818', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:32', '2025-10-07 04:34:32', 1, NULL),
(954, 964, '202514036', 'WILIAM ROBERTO', 'CASILLA MAMANI', '62139991', NULL, 'wiliam.c.mamani@upeu.edu.pe', 'wiliam.c.mamani', '921020718', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:32', '2025-10-07 04:34:32', 1, NULL),
(955, 965, '202514039', 'ANDEERSON HELDAI', 'MAMANI ARPASI', '73809720', NULL, 'andeerson.mamani@upeu.edu.pe', 'andeerson.mamani', '928904154', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:33', '2025-10-07 04:34:33', 1, NULL),
(956, 966, '202514040', 'HERNAN WALTER', 'CONDORI QUEA', '76969943', NULL, 'hernan.condori@upeu.edu.pe', 'hernan.condori', '927505372', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:33', '2025-10-07 04:34:33', 1, NULL),
(957, 967, '202514042', 'MELANI MAYLI', 'HANCCO ROQUE', '61320313', 'Maylihancco925@gmail.com', 'melani.hancco@upeu.edu.pe', 'melani.hancco', '916583920', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:34', '2025-10-07 04:34:34', 1, NULL),
(958, 968, '202514044', 'Romulo Simon', 'Yerba Rojas', '60764836', NULL, 'romulo.yerba@upeu.edu.pe', 'romulo.yerba', '930797044', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:34', '2025-10-07 04:34:34', 1, NULL),
(959, 969, '202514045', 'JOSE DAVID', 'CCOSI CRUZ', '71159682', NULL, 'jose.ccosi@upeu.edu.pe', 'jose.ccosi', '51939622876', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:34', '2025-10-07 04:34:34', 1, NULL),
(960, 970, '201911713', 'Cristhian Paul', 'Laura Vargas', '63431395', 'chistian.laura@upeu.edu.pe', NULL, 'chistian.laura', '965805236', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:35', '2025-10-07 04:34:35', 1, NULL),
(961, 971, '202123477', 'Nestor Rivaldo', 'Barrantes Ancco', '75876353', 'nestorbarrantes98@gmail.com', NULL, 'nestor.barrantes', '939766447', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:35', '2025-10-07 04:34:35', 1, NULL),
(962, 972, '202220564', 'Max Meinly', 'Mamani Carrizales', '77342068', 'maxcarrizales7@gmail.com', NULL, 'meinly.mamani', '925349611', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:36', '2025-10-07 04:34:36', 1, NULL),
(963, 973, '202413204', 'SANDRO GABRIEL', 'MAMANI CONDO', '77505232', 'condoreyna18@gmail.com', NULL, 'gabriel.mamani.c', '960132302', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:36', '2025-10-07 04:34:36', 1, NULL),
(964, 974, '202414007', 'JACK FRANKLIN', 'ALDAMA CARCAUSTO', '60568081', '60568081@upeu.edu.pe', NULL, 'jack.aldama', '978685588', 'Perú', NULL, 'Ninguno', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:37', '2025-10-07 04:34:37', 1, NULL),
(965, 975, '202414009', 'JUSEPHY DALBERT', 'MAMANI JAILA', '60908670', 'jusephymjaila@gmail.com', NULL, 'jusephy.mamani', '974526293', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:37', '2025-10-07 04:34:37', 1, NULL),
(966, 976, '202414103', 'Juan Cristhian', 'Luque Villasante', '77068639', NULL, 'juan.luque@upeu.edu.pe', 'juan.luque', '977699841', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:38', '2025-10-07 04:34:38', 1, NULL),
(967, 977, '202420881', 'HELIO PAUL', 'FAIJO CALISAYA', '75848157', 'helio.f.calisaya@upeu.edu.pe', NULL, 'helio.f.calisaya', '972374335', 'Perú', NULL, 'Ninguno', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:38', '2025-10-07 04:34:38', 1, NULL),
(968, 978, '202420889', 'GEDEÓN ELIEZER ABNER', 'FLORES FLORES', '75771546', 'eber.c.flores@upeu.edu.pe', NULL, 'eber.c.flores', '916308242', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:39', '2025-10-07 04:34:39', 1, NULL),
(969, 979, '202420899', 'RONALD ALEX', 'SOLORZANO SAYA', '76566561', 'ronald.s.saya@upeu.edu.pe', NULL, 'ronald.s.saya', '992678468', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:39', '2025-10-07 04:34:39', 1, NULL),
(970, 980, '202420900', 'VLADIMIR RONALD', 'APAZA HILAITA', '75518473', 'vladimir.a.hilaita@upeu.edu.pe', NULL, 'vladimir.a.hilaita', '939836426', 'Perú', NULL, 'Ninguno', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:40', '2025-10-07 04:34:40', 1, NULL),
(971, 981, '202510055', 'Arnold Abel', 'Reyna Quiñones', '75494157', '75494157@upeu.edu.pe', NULL, '75494157', '930304120', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:40', '2025-10-07 04:34:40', 1, NULL),
(972, 982, '202510853', 'Deyvis Yonseo', 'Nuñoncca Chuctaya', '61090839', 'deyvis.n.chuctaya@upeu.edu.pe', NULL, 'deyvis.n.chuctaya', '935631297', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:41', '2025-10-07 04:34:41', 1, NULL),
(973, 983, '202510860', 'JACKSON FRITS', 'HUAYHUA CALLOHUANCA', '61255178', 'jackson.h.callohuanca@upeu.edu.pe', NULL, 'jackson.h.callohuanca', '986941408', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:41', '2025-10-07 04:34:41', 1, NULL),
(974, 984, '202510862', 'JEANDERY WILLIAMS', 'QUIHUE VENEGAS', '61000455', 'jeandery.q.venegas@upeu.edu.pe', NULL, 'jeandery.q.venegas', '978970453', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:42', '2025-10-07 04:34:42', 1, NULL),
(975, 985, '202510863', 'VICTOR FELIX', 'MACHACA SANCA', '70865255', 'victor.m.sanca@upeu.edu.pe', NULL, 'victor.m.sanca', '916403380', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:42', '2025-10-07 04:34:42', 1, NULL),
(976, 986, '202510865', 'BRANDON ANDREE', 'CCALLA COLQUEHUANCA', '61320331', 'destroyer1025b@gmail.com', NULL, 'andree.ccalla', '977 998 119', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:43', '2025-10-07 04:34:43', 1, NULL);
INSERT INTO `personas` (`id_persona`, `usuario_id`, `codigo_estudiante`, `nombres`, `apellidos`, `documento_identidad`, `correo_personal`, `correo_institucional`, `usuario_login`, `celular`, `pais`, `foto_url`, `religion`, `fecha_nacimiento`, `fecha_matricula`, `modo_contrato`, `modalidad_estudio`, `sede`, `facultad`, `programa_estudio`, `ciclo`, `grupo`, `fecha_creacion`, `fecha_modificacion`, `creado_por`, `modificado_por`) VALUES
(977, 987, '202510868', 'EDWIN LUIS', 'BASURCO MAMANI', '60836545', 'edwin.b.mamani@upeu.edu.pe', NULL, 'edwin.b.mamani', '913465768', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:43', '2025-10-07 04:34:43', 1, NULL),
(978, 988, '202510875', 'HENRRY JUNIOR', 'HANCCO DEZA', '72106062', 'juniorhancco24@gmail.com', NULL, 'junior.hancco', '960621787', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:44', '2025-10-07 04:34:44', 1, NULL),
(979, 989, '202510877', 'JOSEFTH MIDWAR', 'VILCA ÑACA', '76000602', 'josefth.v.naca@upeu.edu.pe', NULL, 'josefth.v.naca', '982516532', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:44', '2025-10-07 04:34:44', 1, NULL),
(980, 990, '202512419', 'ANDRE JOSEPH', 'SUCARI TOTOCAYO', '60938554', 'andre.s.totocayo@upeu.edu.pe', NULL, 'andre.s.totocayo', '930328576', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:45', '2025-10-07 04:34:45', 1, NULL),
(981, 991, '202512423', 'DEYVIS EMILIANO', 'TICONA PEREZ', '61254593', 'deyvis.ticona23@upeu.edu.pe', NULL, 'deyvis.ticona23', '988253552', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:45', '2025-10-07 04:34:45', 1, NULL),
(982, 992, '202512429', 'FRANCOIS FREDERICK', 'CONDORI GIL', '70639079', 'francois.condori@upeu.edu.pe', NULL, 'francois.condori', '987780266', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:46', '2025-10-07 04:34:46', 1, NULL),
(983, 993, '202512434', 'RONALDO EMERSON', 'TOLA CALCINA', '76007922', 'ronaldo.tola@upeu.edu.pe', NULL, 'ronaldo.tola', '941658459', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:46', '2025-10-07 04:34:46', 1, NULL),
(984, 994, '202514019', 'DIEGO RAFAEL', 'ZAGA ALEJO', '61001215', NULL, 'diego.zaga@upeu.edu.pe', 'diego.zaga', '972386058', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:47', '2025-10-07 04:34:47', 1, NULL),
(985, 995, '202514020', 'MARICIELO MIGDALY', 'RODRIGUEZ YUCRA', '61159291', NULL, 'maricielo.r.yucra@upeu.edu.pe', 'maricielo.r.yucra', '975501661', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:47', '2025-10-07 04:34:47', 1, NULL),
(986, 996, '202514025', 'YOJAIDA ROHOSI', 'PRADOC CHAVEZ', '61563829', NULL, 'yojaida.p.chavez@upeu.edu.pe', 'yojaida.p.chavez', '963750960', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:48', '2025-10-07 04:34:48', 1, NULL),
(987, 997, '202514026', 'Jose Elias', 'Aroapaza Aza', '77912359', 'joseeaa7791@gmail.com', 'jose.aroapaza@upeu.edu.pe', 'jose.aroapaza', '942014625', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:48', '2025-10-07 04:34:48', 1, NULL),
(988, 998, '202514028', 'Micayla Jasmin', 'Ccasani Huachaca', '60555721', NULL, 'micayla.ccasani@upeu.edu.pe', 'micayla.ccasani', '907350270', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:49', '2025-10-07 04:34:49', 1, NULL),
(989, 999, '202514032', 'ELOY RUBEN', 'MAMANI ARAPA', '74057382', NULL, 'eloy.mamani32@upeu.edu.pe', 'eloy.mamani32', '986435390', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:49', '2025-10-07 04:34:49', 1, NULL),
(990, 1000, '202514033', 'Erick Franck', 'Ruelas Mamani', '74036466', NULL, 'erick.ruelas@upeu.edu.pe', 'erick.ruelas', '963510412', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:49', '2025-10-07 04:34:49', 1, NULL),
(991, 1001, '202514037', 'BRIYITH ARMIDA', 'MONZON GEMIO', '74382455', NULL, 'briyith.monzon@upeu.edu.pe', 'briyith.monzon', '945357259', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:50', '2025-10-07 04:34:50', 1, NULL),
(992, 1002, '202514041', 'KEVIN RONALDO', 'OJEDA MACHACA', '61254950', NULL, 'kevin.ojeda@upeu.edu.pe', 'kevin.ojeda', '992974770', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:50', '2025-10-07 04:34:50', 1, NULL),
(993, 1003, '202514047', 'JULIO ISAAC', 'APAZA ARAPA', '60765372', NULL, 'isaac.apaza.a@upeu.edu.pe', 'isaac.apaza.a', '910203144', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:50', '2025-10-07 04:34:50', 1, NULL),
(994, 1004, '202122996', 'Igarlos Ruben', 'Mamani Quispe', '73673845', 'igr.ruben@gmail.com', NULL, 'igarlos.mamani', '947934021', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:51', '2025-10-07 04:34:51', 1, NULL),
(995, 1005, '202212419', 'Frank Alexander', 'Pari Abado', '77488496', 'frankabado123@gmail.com', NULL, 'frank.pari', '938095579', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:51', '2025-10-07 04:34:51', 1, NULL),
(996, 1006, '202320600', 'Fidel Edison', 'Soncco Cruz', '71935656', '71935656@upeu.edu.pe', '71935656@upeu.edu.pe', '71935656', '993906146', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:51', '2025-10-07 04:34:51', 1, NULL),
(997, 1007, '202320719', 'Christian Yoel', 'Soncco Vargas', '75851268', '75851268@upeu.edu.pe', '75851268@upeu.edu.pe', '75851268', '912673623', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:52', '2025-10-07 04:34:52', 1, NULL),
(998, 1008, '202410803', 'Luz Mélani', 'Mamani Illacutipa', '60305325', '60305325@upeu.edu.pe', NULL, '60305325', '928110030', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:52', '2025-10-07 04:34:52', 1, NULL),
(999, 1009, '202410806', 'Turpo Dimas Kevin', 'De La Cruz', '60909683', '60909683@upeu.edu.pe', NULL, '60909683', '999900674', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:52', '2025-10-07 04:34:52', 1, NULL),
(1000, 1010, '202411747', 'ANCCO ALEXANDER', 'RAMOS', '60208022', '60208022@upeu.edu.pe', NULL, '60208022', '987950375', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:53', '2025-10-07 04:34:53', 1, NULL),
(1001, 1011, '202411766', 'GEMA NIKOL', 'TICONA LAURA', '60181293', '60181293@upeu.edu.pe', NULL, '60181293', '949513396', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:53', '2025-10-07 04:34:53', 1, NULL),
(1002, 1012, '202414037', 'ABEL YEINS', 'BERRIOS FLORES', '61000714', 'abelyeins123@gmail.com', NULL, 'abel.berrios', '983006410', 'Perú', NULL, 'Ninguno', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:54', '2025-10-07 04:34:54', 1, NULL),
(1003, 1013, '202420362', 'Fiorella Del Carmen', 'Perez Mamani', '72630860', 'del.carmen.perez@upeu.edu.pe', NULL, 'del.carmen.perez', '976360553', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:54', '2025-10-07 04:34:54', 1, NULL),
(1004, 1014, '202420367', 'DEISSY LUCERO', 'QUISPE TORRES', '60837039', 'deissy.quispe@upeu.edu.pe', NULL, 'deissy.quispe', '955949404', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:55', '2025-10-07 04:34:55', 1, NULL),
(1005, 1015, '202420369', 'JOSE FERNANDO', 'QUISPE BELLIDO', '60836548', 'jose.quispe.b@upeu.edu.pe', NULL, 'jose.quispe.b', '941236518', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:55', '2025-10-07 04:34:55', 1, NULL),
(1006, 1016, '202420504', 'VERGARA GABRIEL', 'ROJAS', '72709478', 'gabrielrojasvergara14@gmail.com', NULL, 'gabriel.rojas.v', '941421707', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:55', '2025-10-07 04:34:55', 1, NULL),
(1007, 1017, '202420506', 'JUAN DANIEL', 'QUISPE TITO', '75518434', 'daniel.quispe.t@upeu.edu.pe', NULL, 'daniel.quispe.t', '914685261', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:56', '2025-10-07 04:34:56', 1, NULL),
(1008, 1018, '202420507', 'Ticona Aldo', 'Calla', '72772895', 'aldo.c.ticona@upeu.edu.pe', NULL, 'aldo.c.ticona', '917098113', 'Perú', NULL, 'Ninguno', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:56', '2025-10-07 04:34:56', 1, NULL),
(1009, 1019, '202420880', 'ANDRE FABRICIO', 'BILBAO LIZARRAGA', '61000983', 'andre.b.lizarraga@upeu.edu.pe', NULL, 'andre.b.lizarraga', '999555503', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:57', '2025-10-07 04:34:57', 1, NULL),
(1010, 1020, '202420882', 'YESMI KAROL', 'YUPANQUI TOLENTINO', '74658572', 'yesmi.y.tolentino@upeu.edu.pe', NULL, 'yesmi.y.tolentino', '997425952', 'Perú', NULL, 'Ninguno', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:57', '2025-10-07 04:34:57', 1, NULL),
(1011, 1021, '202420883', 'JOAQUIN HASSAN', 'SANCHEZ SARAVIA', '72631475', 'joaquin.s.saravia@upeu.edu.pe', NULL, 'joaquin.s.saravia', '963166637', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:58', '2025-10-07 04:34:58', 1, NULL),
(1012, 1022, '202420885', 'JOHAN EMERSON', 'IRPANOCCA ALVAREZ', '60836465', 'johan.i.alvarez@upeu.edu.pe', NULL, 'johan.i.alvarez', '972803704', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:58', '2025-10-07 04:34:58', 1, NULL),
(1013, 1023, '202420887', 'ANGHELO HERNAN', 'TORRES ARIAS', '75840632', 'anghelo.t.arias@upeu.edu.pe', NULL, 'anghelo.t.arias', '961290278', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:59', '2025-10-07 04:34:59', 1, NULL),
(1014, 1024, '202420888', 'Edgar D Alessandro', 'Cabana Cruz', '60908327', 'edgar.cabana@upeu.edu.pe', NULL, 'edgar.cabana', '912980435', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:34:59', '2025-10-07 04:34:59', 1, NULL),
(1015, 1025, '202420891', 'Kengui Pieri', 'Calsin Mamani', '76568920', 'kengui.c.mamani@upeu.edu.pe', NULL, 'kengui.c.mamani', '914028693', 'Perú', NULL, 'Ninguno', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:00', '2025-10-07 04:35:00', 1, NULL),
(1016, 1026, '202420897', 'ANTHONY GABRIEL', 'RUIZ RUPA', '76298836', 'anthony.r.rupa@upeu.edu.pe', NULL, 'anthony.r.rupa', '900143323', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:00', '2025-10-07 04:35:00', 1, NULL),
(1017, 1027, '202420898', 'LUIS ANGEL', 'VILCA LARICO', '74575554', 'angel.vilca.l@upeu.edu.pe', NULL, 'angel.vilca.l', '974604300', 'Perú', NULL, 'AS', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:01', '2025-10-07 04:35:01', 1, NULL),
(1018, 1028, '202420901', 'NELSON ANTONY', 'LARICO QUISPE', '60909692', 'nelson.larico@upeu.edu.pe', NULL, 'nelson.larico', '921066357', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:01', '2025-10-07 04:35:01', 1, NULL),
(1019, 1029, '202420903', 'JHOSEPMIR HENRY', 'CHOQUE VELARDE', '76223810', 'jhosepmir.c.velarde@upeu.edu.pe', NULL, 'jhosepmir.c.velarde', '978374944', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:02', '2025-10-07 04:35:02', 1, NULL),
(1020, 1030, '201811324', 'Iosef Immanol', 'Chata Saavedra', '76877808', 'IMMA210809@GMAIL.COM', NULL, 'iosef.chata', '924852702', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:02', '2025-10-07 04:35:02', 1, NULL),
(1021, 1031, '201920194', 'Sharnol Emerson', 'Llavilla Betancur', '73485447', 'sharnolbetancur@gmail.com', NULL, 'sharnol.llavilla', '930716205', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:03', '2025-10-07 04:35:03', 1, NULL),
(1022, 1032, '202122856', 'Brayan David', 'Machaca Larico', '77207395', 'brayanmachaca345@gmail.com', NULL, 'david.machaca', '973361437', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:03', '2025-10-07 04:35:03', 1, NULL),
(1023, 1033, '202212960', 'Brayhan Yobel', 'Machaca Condori', '60177073', 'yobel.machaca@upeu.edu.pe', NULL, 'yobel.machaca', '958502264', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:04', '2025-10-07 04:35:04', 1, NULL),
(1024, 1034, '202312727', 'Brayan Anthonny', 'Calla Huaman', '75518499', 'alainbrayan68@gmail.com', 'anthonny.calla@upeu.edu.pe', 'anthonny.calla', '968273762', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:04', '2025-10-07 04:35:04', 1, NULL),
(1025, 1035, '202410797', 'Max Brayan', 'Gonzalo Quispe', '77534213', '77534213@upeu.edu.pe', NULL, '77534213', '924527898', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:05', '2025-10-07 04:35:05', 1, NULL),
(1026, 1036, '202410811', 'Juan Gabriel', 'Condori Vilca', '74214342', 'juangabrielricondo9@gmail.com', NULL, '74214342', '916457637', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:05', '2025-10-07 04:35:05', 1, NULL),
(1027, 1037, '202411744', 'WITMER JHETLY', 'MAMANI CAHUANA', '77470875', '77470875@upeu.edu.pe', NULL, '77470875', '921755294', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:06', '2025-10-07 04:35:06', 1, NULL),
(1028, 1038, '202413209', 'Edison Jhoner', 'Paye Mamani', '73735537', 'edisonjmina@gmail.com', NULL, 'edison.paye', '930105564', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:06', '2025-10-07 04:35:06', 1, NULL),
(1029, 1039, '202414004', 'BRAYAN OSCAR', 'ROQUE SUAQUITA', '60909650', '60909650@upeu.edu.pe', NULL, 'oscar.roque', '974715618', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:07', '2025-10-07 04:35:07', 1, NULL),
(1030, 1040, '202414008', 'PAUL OWEN', 'CAYO CCORI', '60181359', 'yeny@gmail.com', NULL, 'paul.cayo', '950482959', 'Perú', NULL, 'Ninguno', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:08', '2025-10-07 04:35:08', 1, NULL),
(1031, 1041, '202414018', 'CARLOS ALONSO', 'MAMANI SUAÑA', '75218456', '75218456@upeu.edu.pe', NULL, 'alonso.mamani.s', '920350468', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:08', '2025-10-07 04:35:08', 1, NULL),
(1032, 1042, '202414023', 'CESAR RIGOBERTO', 'LARICO MAMANI', '75431377', '75431377@upeu.edu.pe', NULL, 'cesar.larico', '929697026', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:08', '2025-10-07 04:35:08', 1, NULL),
(1033, 1043, '202414032', 'JUAN DIEGO', 'CHAMBILLA SERRANO', '60180319', '60180319@upeu.edu.pe', NULL, 'diego.chambilla', '940047758', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:09', '2025-10-07 04:35:09', 1, NULL),
(1034, 1044, '202414034', 'HERSON LUIS', 'VILLCA GUTIERREZ', '71313518', '71313518@upeu.edu.pe', NULL, 'herson.villca', '910281623', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:09', '2025-10-07 04:35:09', 1, NULL),
(1035, 1045, '202420361', 'Puma Rodrigo', 'Araujo', '75514453', '75514453@upeu.edu.pe', NULL, '75514453', '907762556', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:10', '2025-10-07 04:35:10', 1, NULL),
(1036, 1046, '202420364', 'Omar Michael', 'Larico Iquise', '76481780', 'omar.larico@upeu.edu.pe', NULL, 'omar.larico', '988353918', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:11', '2025-10-07 04:35:11', 1, NULL),
(1037, 1047, '202420366', 'FABRICIO FERNANDO', 'MESTAS GOMEZ', '60765423', 'fabricio.mestas@upeu.edu.pe', NULL, 'fabricio.mestas', '951864995', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:11', '2025-10-07 04:35:11', 1, NULL),
(1038, 1048, '202420886', 'HERMES ADAN', 'CHAMBILLA CHAMBILLA', '71953869', 'hermes.c.chambilla@upeu.edu.pe', NULL, 'hermes.c.chambilla', '915358260', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:12', '2025-10-07 04:35:12', 1, NULL),
(1039, 1049, '202420890', 'EDY WILLIAM', 'CHURA PACCO', '77906494', 'william.chura@upeu.edu.pe', NULL, 'william.chura', '900221784', 'Perú', NULL, 'Ninguno', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:12', '2025-10-07 04:35:12', 1, NULL),
(1040, 1050, '202420894', 'BRAYAN ROY', 'ESTOFANERO INOFUENTES', '73231090', 'brayan.e.inofuentes@upeu.edu.pe', NULL, 'brayan.e.inofuentes', '933891297', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:13', '2025-10-07 04:35:13', 1, NULL),
(1041, 1051, '202420902', 'CRISTOFER DUA', 'ORDOÑEZ QUISPE', '76903779', 'cristofer.o.quispe@upeu.edu.pe', NULL, 'cristofer.o.quispe', '993350757', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:13', '2025-10-07 04:35:13', 1, NULL),
(1042, 1052, '202012374', 'Cristhian Brandonlyn', 'Alejo Castillo', '72072476', 'cristhianalejocastillo2@gmail.col', 'cristhian.alejo@upeu.edu.pe', 'cristhian.alejo', '961315254', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:14', '2025-10-07 04:35:14', 1, NULL),
(1043, 1053, '202015141', 'Aldhair Ivan', 'Huaquisto Coyla', '74318155', 'aldhairsin@gmail.com', 'aldhair.huaquisto@upeu.edu.pe', 'aldhair.huaquisto', '958366332', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:14', '2025-10-07 04:35:14', 1, NULL),
(1044, 1054, '202220559', 'Apaza Heiner', 'Apaza', '73360821', 'heineeapaza@gmail.com', NULL, 'heiner.apaza.', '980814183', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:15', '2025-10-07 04:35:15', 1, NULL),
(1045, 1055, '202312731', 'Cristhian Gabriel', 'Murillo Mendoza', '70401756', 'mfjdiecymles@gmail.com', 'cristhian.murillo@upeu.edu.pe', 'cristhian.murillo', '992372611', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:15', '2025-10-07 04:35:15', 1, NULL),
(1046, 1056, '202312737', 'Edwar Fernando', 'Churata Callo', '75539560', 'ggtedy550@gmail.com', NULL, 'edwar.churata', '902009453', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:16', '2025-10-07 04:35:16', 1, NULL),
(1047, 1057, '202320265', 'Rody Jossep', 'Chuquimamani Apaza', '75601182', 'jossepapaza@gmail.com', '75601182@upeu.edu.pe', 'rody.chuquimamani', '914324274', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:16', '2025-10-07 04:35:16', 1, NULL),
(1048, 1058, '202320591', 'Jhon Saul', 'Mamani Cruz', '73602780', 'mamanicruzjhon42@gmail.com', '73602780@upeu.edu.pe', '73602780', '956245066', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:17', '2025-10-07 04:35:17', 1, NULL),
(1049, 1059, '202410794', 'Frank Vladimir', 'Canaza Quisocala', '74441247', 'frankcanazaquisocala@gmail.com', NULL, '74441247', '952726616', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:17', '2025-10-07 04:35:17', 1, NULL),
(1050, 1060, '202410802', 'Luis Alejandro', 'Chino Leon', '60066530', 'alejandrochinoleon@gmail.com', NULL, 'luis.chino', '931705247', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:18', '2025-10-07 04:35:18', 1, NULL),
(1051, 1061, '202410805', 'Yoel Fernando', 'Turpo Taccora', '60171224', 'fernandito15y@gmail.com', NULL, '60171224', '948179946', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:18', '2025-10-07 04:35:18', 1, NULL),
(1052, 1062, '202410812', 'Deysi Yaneth', 'Mamani Jinez', '60175517', '60175517@upeu.edu.pe', NULL, '60175517', '920315857', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:19', '2025-10-07 04:35:19', 1, NULL),
(1053, 1063, '202410827', 'Danny Yosimar', 'Quispe Mamani', '60203251', '60203251@upeu.edu.pe', NULL, '60203251', '989704809', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:19', '2025-10-07 04:35:19', 1, NULL),
(1054, 1064, '202411077', 'Edy Jair', 'Tola Quispe', '60836920', 'jaircitola@gmail.com', NULL, '60836920', '953466288', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:20', '2025-10-07 04:35:20', 1, NULL),
(1055, 1065, '202411082', 'Bonnier Nilss Rodrigo', 'Mamani Vargas', '61536276', '61536276@upeu.edu.pe', NULL, '61536276', '952044018', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:20', '2025-10-07 04:35:20', 1, NULL),
(1056, 1066, '202411734', 'Foraquita Yanil', 'Perez', '60850787', 'pyanil121@gmail.com', NULL, '60850787', '938781010', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:21', '2025-10-07 04:35:21', 1, NULL),
(1057, 1067, '202411735', 'MILKON EDDY', 'MAMANI CCAMA', '77023216', 'makerjetasahamigua@gmail.com', NULL, '77023216', '921688551', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:21', '2025-10-07 04:35:21', 1, NULL),
(1058, 1068, '202411738', 'JULIO PEDRO', 'AÑACATA PORTILLO', '60765139', 'Julio4pedro@gmail.com', NULL, '60765139', '958265249', 'Perú', NULL, 'Ninguno', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:22', '2025-10-07 04:35:22', 1, NULL),
(1059, 1069, '202411741', 'LENIN JHOSEF', 'ORTIZ MAYTA', '72161559', 'leninortizmayta@gmail.com', NULL, '72161559', '992088037', 'Perú', NULL, 'Ninguno', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:22', '2025-10-07 04:35:22', 1, NULL),
(1060, 1070, '202413202', 'Larico Juana', 'Tito', '73129308', 'juanatito.2001@gmail.com', NULL, 'juana.tito', '948201351', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:23', '2025-10-07 04:35:23', 1, NULL),
(1061, 1071, '202413206', 'RICHARD EDY', 'QUISPECONDORI HUARICALLO', '72033016', 'edy.956.00@gmail.com', NULL, 'richard.quispecondori', '921150662', 'Perú', NULL, 'Ninguno', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:23', '2025-10-07 04:35:23', 1, NULL),
(1062, 1072, '202413208', 'Keysy Gabriela', 'Inofuente Chua', '60732617', 'inofuentekeyst@gmai.com', NULL, 'keysy.inofuente', '927341202', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:24', '2025-10-07 04:35:24', 1, NULL),
(1063, 1073, '202413210', 'ABRAHAM KEVIN', 'APAZA CCASA', '60836936', 'apazazapanar@gmail.com', NULL, 'kevin.apaza.c', '925400509', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:24', '2025-10-07 04:35:24', 1, NULL),
(1064, 1074, '202413543', 'DIANA VANESSA', 'HUANCA CRUZ', '73462533', 'sofiarociohernandezchavez@gmail.com', NULL, '73462533', '958138303', 'Perú', NULL, 'Ninguno', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:25', '2025-10-07 04:35:25', 1, NULL),
(1065, 1075, '202413545', 'JHON WILLIAN', 'MAYTA AROTAYPE', '75073575', 'maytaarotaypewillian@gmail.com', NULL, 'willian.mayta', '902071317', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:25', '2025-10-07 04:35:25', 1, NULL),
(1066, 1076, '202414014', 'Reyder Edwin', 'Villafuerte Yupanqui', '60016250', 'reyderedwinvillafuerteyupanqui@gmail.com', NULL, 'reyder.villafuerte', '946781799', 'Perú', NULL, 'Evangélico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:26', '2025-10-07 04:35:26', 1, NULL),
(1067, 1077, '202414016', 'RUSSMAN KENY YOHAN', 'TORRES LOPE', '72456128', '72456128@upeu.edu.pe', NULL, 'russman.torres', '973724832', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:27', '2025-10-07 04:35:27', 1, NULL),
(1068, 1078, '202414027', 'ARIANA DANITZA', 'ALVAREZ MOYA', '73758034', '73758034@upeu.edu.pe', NULL, 'isaura.alvarez', '917717339', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:27', '2025-10-07 04:35:27', 1, NULL),
(1069, 1079, '202414029', 'YEFRI RONALDIÑO', 'LERMA PACOMPIA', '61000712', 'ronallerma033@gmail.com', NULL, 'yefri.lerma', '923045033', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:28', '2025-10-07 04:35:28', 1, NULL),
(1070, 1080, '202414031', 'MAYHUA YASEN', 'CUTIPA', '73517808', 'waltomyasen@gmail.com', NULL, 'yasen.cutipa', '916367161', 'Perú', NULL, 'Ninguno', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:28', '2025-10-07 04:35:28', 1, NULL),
(1071, 1081, '202122346', 'Mayda Rocio', 'Carlos Arotaype', '72125973', '72125973@upeu.edu.pe', 'mayda.carlos@upeu.edu.pe', 'mayda.carlos', '921023157', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:29', '2025-10-07 04:35:29', 1, NULL),
(1072, 1082, '202410799', 'Mamani Roy', 'Cruz', '60262751', 'roycruz7654@gmail.com', NULL, '60262751', '927596461', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:29', '2025-10-07 04:35:29', 1, NULL),
(1073, 1083, '202410804', 'Sait Alfredo', 'Gutierrez Velasquez', '60836973', 'SaitProYT34534@outlook.com', NULL, 'sait.gutierrez', '956316114', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:29', '2025-10-07 04:35:29', 1, NULL),
(1074, 1084, '202410807', 'Jhon Franklin', 'Ramos Paredes', '72114581', 'jhonfranklin123798@gmail.com', NULL, 'franklin.ramos', '976767669', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:30', '2025-10-07 04:35:30', 1, NULL),
(1075, 1085, '202410810', 'MATHIAS FABIAN', 'KANA PUMA', '75254568', 'mathiask357@gmail.com', NULL, '75254568', '957728302', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:30', '2025-10-07 04:35:30', 1, NULL),
(1076, 1086, '202410814', 'Olazabal Ronald', 'Condori', '75314538', '75314538@upeu.edu.pe', NULL, '75314538', '900360358', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:30', '2025-10-07 04:35:30', 1, NULL),
(1077, 1087, '202410815', 'Edson Caleb', 'Coaquira Pucutuni', '60262767', 'edson.caleb.23@gmail.com', NULL, 'caleb.coaquira', '944504882', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:31', '2025-10-07 04:35:31', 1, NULL),
(1078, 1088, '202410818', 'MARY MARGOTH', 'MAMANI QUISPE', '74770078', 'marymargoth321@gmail.com', NULL, '74770078', '901992342', 'Perú', NULL, 'Ninguno', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:31', '2025-10-07 04:35:31', 1, NULL),
(1079, 1089, '202410820', 'Julio Rodrigo', 'Zegarra Muñoz', '62393792', '62393792@upeu.edu.pe', NULL, '62393792', '959302359', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:32', '2025-10-07 04:35:32', 1, NULL),
(1080, 1090, '202410821', 'Marca Huaman', 'Kevin Yefherson', '60061661', 'marcakevin955@gmail.com', NULL, '60061661', '942322989', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:32', '2025-10-07 04:35:32', 1, NULL),
(1081, 1091, '202410824', 'Albert Fabio', 'Mamani Laime', '75413261', 'albertmlaime@gmail.com', NULL, '75413261', '912885809', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:33', '2025-10-07 04:35:33', 1, NULL),
(1082, 1092, '202410828', 'Jhosue Daniel', 'Medina Paye', '75576436', 'Daniel@upeu.edu.pe', NULL, '75576436', '912951082', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:33', '2025-10-07 04:35:33', 1, NULL),
(1083, 1093, '202411737', 'LINCOL WERNER', 'YUJRA CALLA', '77170827', '77170827@upeu.edu.pe', NULL, '77170827', '965370205', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:34', '2025-10-07 04:35:34', 1, NULL),
(1084, 1094, '202411739', 'JORGE HERNAN', 'VILCA APAZA', '74126646', 'hernanbill.vilca@gmail.com', NULL, '74126646', '991066834', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:34', '2025-10-07 04:35:34', 1, NULL),
(1085, 1095, '202411740', 'JORGE LUIS', 'RIVEROS LARICO', '60764578', 'jorgelarico872@gmail.com', NULL, '60764578', '932711134', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:35', '2025-10-07 04:35:35', 1, NULL),
(1086, 1096, '202411756', 'VICTOR MANUEL', 'SANCHO PAYE', '60837156', '60837156@upeu.edu.pe', NULL, '60837156', '921362745', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:36', '2025-10-07 04:35:36', 1, NULL),
(1087, 1097, '202411758', 'ERICK MIJAEL', 'DELGADO LIMA', '72292845', 'erickmijaeldelgafolima@gmail.com', NULL, 'erick.delgado', '916181096', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:36', '2025-10-07 04:35:36', 1, NULL),
(1088, 1098, '202411762', 'Yenifher Sharai', 'Sanchez Chipa', '60060062', 'yenifhersanchez123@gmail.com', NULL, 'yenifher.sanchez', '946301742', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:36', '2025-10-07 04:35:36', 1, NULL),
(1089, 1099, '202411765', 'RAMOS ALICIA', 'VIZCARRA', '60172302', 'vizcarrasheyla2@gmail.com', NULL, 'alicia.vizcarra', '967007832', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:37', '2025-10-07 04:35:37', 1, NULL),
(1090, 1100, '202413207', 'WALTER DAVID', 'QUISPESAYHUA QUISPE', '73820707', 'wasterwill@gmail.com', NULL, 'walter.quispesayhua', '933628378', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:37', '2025-10-07 04:35:37', 1, NULL),
(1091, 1101, '202413212', 'GUIDO DANIEL', 'MAYTA SUAÑA', '60066868', 'guido1808daniel2006@gmail.com', NULL, 'daniel.mayta', '989477180', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:37', '2025-10-07 04:35:37', 1, NULL),
(1092, 1102, '202413214', 'ERICK MAYCOL', 'QUISPE VALENCIA', '60765426', 'erickmaycol109@gmail.com', NULL, 'erickmaycol.quispe', '927467343', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:38', '2025-10-07 04:35:38', 1, NULL),
(1093, 1103, '202413544', 'Gianluck Yhuda', 'Pastor Lovón', '72117463', 'gluck.pastor@gmail.com', NULL, 'gianluck.pastor', '959437951', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:38', '2025-10-07 04:35:38', 1, NULL),
(1094, 1104, '202414001', 'Dubcek Leonel', 'Quispe Vilca', '76585795', 'leonelr159d@gmail.com', NULL, 'dubcek.quispe', '977915791', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:39', '2025-10-07 04:35:39', 1, NULL),
(1095, 1105, '202414019', 'OMAR RONALDO', 'MAMANI PAMPA', '60836701', '60836701@upeu.edu.pe', NULL, 'ronaldo.mamani.p', '910678398', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:39', '2025-10-07 04:35:39', 1, NULL),
(1096, 1106, '202414021', 'DILWER JHONATAN', 'AGUILAR PAJA', '71945097', 'dilwer@upeu.edu.pe', NULL, 'dilwer.aguilar', '901978977', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:39', '2025-10-07 04:35:39', 1, NULL),
(1097, 1107, '202414024', 'FERNANDO ANDRE', 'HUANCA HUALLPA', '73736548', 'nando104.fer@gmail.com', NULL, 'fernando.huanca', '978697531', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:40', '2025-10-07 04:35:40', 1, NULL),
(1098, 1108, '202414028', 'SAID RODRIGO', 'PACCORI SUAQUITA', '63175057', 'paccorisuaquitasaid@gmail.com', NULL, 'said.paccori', '910402955', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:40', '2025-10-07 04:35:40', 1, NULL),
(1099, 1109, '202414030', 'VALERIANO ANTONY', 'CONDORI', '75787081', 'condoriantony87@gmail.com', NULL, 'antony.condori', '910507279', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:41', '2025-10-07 04:35:41', 1, NULL),
(1100, 1110, '202312696', 'Emerlin Obed', 'Fernandez Condori', '60069713', 'emerlinobedf@gmail.com', 'emerlin.fernandez@upeu.edu.pe', 'emerlin.fernandez', '944161319', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:42', '2025-10-07 04:35:42', 1, NULL),
(1101, 1111, '202312746', 'Jhymel Nelio', 'Figueroa Chambi', '77297425', 'jhymelneliof@gmail.com', NULL, 'jhymel.figueroa', '943544845', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:42', '2025-10-07 04:35:42', 1, NULL),
(1102, 1112, '202320260', 'Gustavo Denis', 'Aguilar Mamani', '72357807', 'gustavoaguilarmamani71@gmail.com', '72357807@upeu.edu.pe', 'gustavo.aguilar', '934443410', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:43', '2025-10-07 04:35:43', 1, NULL),
(1103, 1113, '202320264', 'Jhon Fredy', 'Quilla Larico', '73855844', 'jhonffff12345@gmail.com', '73855844@upeu.edu.pe', 'jhon.quilla.q', '904416063', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:43', '2025-10-07 04:35:43', 1, NULL),
(1104, 1114, '202320274', 'Joel David', 'Pacheco Quispe', '73199116', 'mortisedsteam40@gmail.com', '73199116@upeu.edu.pe', 'joel.pacheco', '900593693', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:44', '2025-10-07 04:35:44', 1, NULL),
(1105, 1115, '202320346', 'Gabriel Guillermo', 'Frisancho Jallo', '70480266', 'frisanchogabriel@gmail.com', '70480266@upeu.edu.pe', '70480266', '957188254', 'Perú', NULL, 'Ninguno', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:44', '2025-10-07 04:35:44', 1, NULL),
(1106, 1116, '202320601', 'David Alexis', 'Puma Pocohuanca', '73820871', '73820871@upeu.edu.pe', '73820871@upeu.edu.pe', '73820871', '900082105', 'Perú', NULL, 'Ninguno', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:45', '2025-10-07 04:35:45', 1, NULL),
(1107, 1117, '202410792', 'Alex Brayan', 'Gutierrez Huanca', '74178925', 'hdialexsander358@gmail.com', NULL, '74178925', '995183535', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:45', '2025-10-07 04:35:45', 1, NULL),
(1108, 1118, '202410808', 'Jhosef Giampiere', 'Cuadros Flores', '77048303', 'jhosef.flowrs.10@gmail.com', NULL, 'jhosef.cuadros', '993661228', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:46', '2025-10-07 04:35:46', 1, NULL),
(1109, 1119, '202410823', 'Jayson Smit', 'Coaquira Ramirez', '60765466', 'Jaysoncoaquira1@gmail.com', NULL, '60765466', '901344157', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:46', '2025-10-07 04:35:46', 1, NULL),
(1110, 1120, '202410826', 'Mostajo Eliceo', 'Parillo', '76568621', '76568621@upeu.edu.pe', NULL, '76568621', '902564758', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:47', '2025-10-07 04:35:47', 1, NULL),
(1111, 1121, '202411733', 'YOSTIN ANDY', 'ILLANES ALAVE', '76873416', 'yostinillanes@gmail.com', NULL, '76873416', '919140313', 'Perú', NULL, 'Ninguno', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:47', '2025-10-07 04:35:47', 1, NULL),
(1112, 1122, '202413201', 'Dayron Rodolfo', 'Apaza Rodriguez', '74179046', 'Dayron.ear@gmail.com', NULL, 'dayron.apaza', '903110510', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:48', '2025-10-07 04:35:48', 1, NULL),
(1113, 1123, '202414026', 'KENNY JEFFERSON', 'LOPEZ TURPO', '71619842', 'Lopkenny7@gmail.com', NULL, 'kenny.lopez', '986309244', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:48', '2025-10-07 04:35:48', 1, NULL);
INSERT INTO `personas` (`id_persona`, `usuario_id`, `codigo_estudiante`, `nombres`, `apellidos`, `documento_identidad`, `correo_personal`, `correo_institucional`, `usuario_login`, `celular`, `pais`, `foto_url`, `religion`, `fecha_nacimiento`, `fecha_matricula`, `modo_contrato`, `modalidad_estudio`, `sede`, `facultad`, `programa_estudio`, `ciclo`, `grupo`, `fecha_creacion`, `fecha_modificacion`, `creado_por`, `modificado_por`) VALUES
(1114, 1124, '202414033', 'PUMA HEBERLEN', 'QUISPE', '71868523', 'heberlenq@gmail.com', NULL, 'heberlen.quispe', '918429067', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:48', '2025-10-07 04:35:48', 1, NULL),
(1115, 1125, '202013787', 'Eddysson Amadeus', 'Curo Escarcena', '73059618', 'krauser.ragnarok@hotmail.com', 'eddysson.curo@upeu.edu.pe', 'eddyssoncuro', '975902323', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:49', '2025-10-07 04:35:49', 1, NULL),
(1116, 1126, '202015208', 'Cristian Yeyson', 'Mamani Morales', '73645926', '73645926@upeu.edu.pe', '73645926@upeu.edu.pe', 'yeyson.mamani', '917717355', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:50', '2025-10-07 04:35:50', 1, NULL),
(1117, 1127, '202120720', 'Huaraccallo Christian', 'Luque', '71093427', 'christian.luque@upeu.edu.pe', 'christian.luque@upeu.edu.pe', 'christian.luque', '944560116', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:50', '2025-10-07 04:35:50', 1, NULL),
(1118, 1128, '202121460', 'Ramiro Engelbert', 'Vargas Tupac', '73857550', 'ramiroengelberth@gmail.com', NULL, 'ramiro.vargas', '985360559', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:51', '2025-10-07 04:35:51', 1, NULL),
(1119, 1129, '202211952', 'Fredy Rivaldo', 'Mamani Masco', '77080595', 'Fredyrivaldo75@gmail.com', NULL, 'fredy.mamani', '935068256', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:51', '2025-10-07 04:35:51', 1, NULL),
(1120, 1130, '202212428', 'Juan Diosdado', 'Phocco Mamani', '75425811', 'archiva1591@gmail.com', NULL, 'juan.phocco', '900025902', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:52', '2025-10-07 04:35:52', 1, NULL),
(1121, 1131, '202310095', 'Ana Belen', 'Arriaga Poquioma', '76924225', 'belen.poquioma@gmail.com', 'ana.poquioma@upeu.edu.pe', 'ana.arriagax', '925924997', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:52', '2025-10-07 04:35:52', 1, NULL),
(1122, 1132, '202312708', 'Jose Guillermo', 'Ticona Lipa', '71437690', 'jticonalipa@gmail.com', NULL, 'guillermo.ticona', '927468638', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:53', '2025-10-07 04:35:53', 1, NULL),
(1123, 1133, '202312730', 'Ciro Garry Kristopher', 'Machicado Velasquez', '72371368', 'cirogkmv@gmail.com', 'ciro.machicado@upeu.edu.pe', 'ciro.machicado', '998855359', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:53', '2025-10-07 04:35:53', 1, NULL),
(1124, 1134, '202320257', 'Willim Yemis', 'Parqui Vilca', '71851461', '71851461@upeu.edu.pe', NULL, 'willim.parqui', '916112934', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:54', '2025-10-07 04:35:54', 1, NULL),
(1125, 1135, '202320259', 'Josimar Yoseph', 'Huarilloclla Huarilloclla', '73507707', 'huari.josimar.est.17@gmail.com', '73507707@upeu.edu.pe', 'josimar.huarilloclla', '991820270', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:54', '2025-10-07 04:35:54', 1, NULL),
(1126, 1136, '202320267', 'Jorge Luis', 'Cahui Cahui', '76283796', 'jorgecahui347@gmail.com', '76283796@upeu.edu.pe', 'jorge.cahui', '983334126', 'Perú', NULL, 'Ninguno', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:55', '2025-10-07 04:35:55', 1, NULL),
(1127, 1137, '202320270', 'Harol Vladimir', 'Atoccsa Chambi', '79381778', 'harolatoccsa@gmail.com', '79381778@upeu.edu.pe', 'harol.atoccsa', '900035275', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:55', '2025-10-07 04:35:55', 1, NULL),
(1128, 1138, '202320273', 'Ccama Alexander', 'Huahuaccapa', '77148477', 'Alexander123huahuaccapa@gmail.com', '77148477@upeu.edu.pe', 'alexander.huahuaccapa', '924489359', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:56', '2025-10-07 04:35:56', 1, NULL),
(1129, 1139, '202320589', 'Jimy Alexander', 'Chatta Betanzos', '75980078', '75980078@upeu.edu.pe', '75980078@upeu.edu.pe', '75980078', '951630261', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:56', '2025-10-07 04:35:56', 1, NULL),
(1130, 1140, '202320590', 'Yack Richard', 'Mancha Mamani', '74541161', '74541161@upeu.edu.pe', '74541161@upeu.edu.pe', '74541161', '922977490', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:57', '2025-10-07 04:35:57', 1, NULL),
(1131, 1141, '202320592', 'Abel Josue', 'Colquehuanca Humpiri', '74176537', 'Abeljosuecolquehuanca789@gmail.com', '74176537@upeu.edu.pe', 'abel.colquehuanca', '940876465', 'Perú', NULL, 'Ninguno', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:57', '2025-10-07 04:35:57', 1, NULL),
(1132, 1142, '202320593', 'Chuquimamani Yacson', 'Carrizales', '76016734', '76016734@upeu.edu.pe', '76016734@upeu.edu.pe', '76016734', '932472215', 'Perú', NULL, 'Ninguno', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:58', '2025-10-07 04:35:58', 1, NULL),
(1133, 1143, '202320594', 'Mario Miguel', 'Soto Zea', '74020233', '74020233@upeu.edu.pe', '74020233@upeu.edu.pe', '74020233', '933203667', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:58', '2025-10-07 04:35:58', 1, NULL),
(1134, 1144, '202320595', 'Jhorman Alfredo', 'Huacani Quispe', '73744546', '73744546@upeu.edu.pe', NULL, '73744546', '974301550', 'Perú', NULL, 'Ninguno', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:59', '2025-10-07 04:35:59', 1, NULL),
(1135, 1145, '202320597', 'Miguel Angel', 'Alanguia Japura', '75493213', 'alanguiajapuram@gmail.com', '75493213@upeu.edu.pe', '75493213', '993243105', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:35:59', '2025-10-07 04:35:59', 1, NULL),
(1136, 1146, '202320598', 'BRAYAN ALFONSO', 'ARELA QUISPE', '71833371', '71833371@upeu.edu.pe', '71833371@upeu.edu.pe', '71833371', '983378352', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:00', '2025-10-07 04:36:00', 1, NULL),
(1137, 1147, '202320609', 'Yheyson Cristofer', 'Cala Choquepata', '73513691', '73513691@upeu.edu.pe', '73513691@upeu.edu.pe', '73513691', '916796421', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:01', '2025-10-07 04:36:01', 1, NULL),
(1138, 1148, '202320611', 'Veder Durandt', 'Quea Ccama', '75795237', 'vedermw@gmail.com', '75795237@upeu.edu.pe', '75795237', '930325255', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:01', '2025-10-07 04:36:01', 1, NULL),
(1139, 1149, '202320614', 'Fabrizzio Gabriel', 'Espinoza Mamani', '76422678', '76422678@upeu.edu.pe', 'fabrizzio@upeu.edu.pe', '76422678', '953151513', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:02', '2025-10-07 04:36:02', 1, NULL),
(1140, 1150, '202320616', 'MARK EMERSON', 'MERCADO HUARACHA', '75950880', 'markemerson1245@gmail.com', 'mark@upeu.edu.pe', '75950880', '921957661', 'Perú', NULL, 'Ninguno', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:02', '2025-10-07 04:36:02', 1, NULL),
(1141, 1151, '202320752', 'Alan Francisco', 'Luque Calcina', '74152593', 'luquecalcinaalanfrancisco@gmail.com', '74152593@upeu.edu.pe', '74152593', '904860944', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:03', '2025-10-07 04:36:03', 1, NULL),
(1142, 1152, '201620184', 'Rupa Olger', 'Meza', '73423212', 'olgeradrianomeza@gmail.com', NULL, 'olgermeza', '973629020', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:03', '2025-10-07 04:36:03', 1, NULL),
(1143, 1153, '201910784', 'Reginaldo Dan', 'Mayhuire Buendia', '75694089', 'reginaldomayhuire@upeu.edu.pe', 'reginaldomayhuire@upeu.edu.pe', 'reginaldomayhuire', '+51935069460', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:04', '2025-10-07 04:36:04', 1, NULL),
(1144, 1154, '202014018', 'Elroy Hernando', 'Vargas Mamani', '77672947', 'rojhas123456@gmail.com', NULL, 'elroyvargas', '948623319', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:04', '2025-10-07 04:36:04', 1, NULL),
(1145, 1155, '202118093', 'Josue Daniel', 'Ccana Yucra', '60119936', 'ccanadaniely@gmail.com', NULL, 'josue.ccana', '931832264', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:05', '2025-10-07 04:36:05', 1, NULL),
(1146, 1156, '202210704', 'Juan Enders', 'Prieto Quispe', '78803414', 'enders9245@gmail.com', NULL, 'juan.prieto.', '929507360', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:05', '2025-10-07 04:36:05', 1, NULL),
(1147, 1157, '202211726', 'Amachi Kenny', 'Aquino', '73771815', 'kennyaapro@hotmail.com', NULL, 'kenny.aquino', '900987917', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:06', '2025-10-07 04:36:06', 1, NULL),
(1148, 1158, '202212442', 'Rodrigo Russel', 'Chura Chaiña', '74349370', 'Rodrigochaina327@gmail.com', NULL, 'rodrigo.chura', '994182286', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:06', '2025-10-07 04:36:06', 1, NULL),
(1149, 1159, '202212444', 'De La Flor', 'Arce Apaza Bisleyn', '77494034', 'bisleyn0@gmail.com', 'bisleyn.arce@upeu.edu.pe', 'bisleyn.arce', '928180849', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:07', '2025-10-07 04:36:07', 1, NULL),
(1150, 1160, '202220560', 'Carlos Augusto', 'Mullisaca Condori', '75416391', 'mullisacacarlosagusto5nc5@gmail.com', 'carlos.mullisaca@upeu.edu.pe', 'carlos.mullisaca', '925764856', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:07', '2025-10-07 04:36:07', 1, NULL),
(1151, 1161, '202220563', 'Angelo Joshep Yoshua', 'Roque Quispe', '74214274', 'yoshuaroquequispe@gmail.com', NULL, 'angelo.roque', '958359055', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:08', '2025-10-07 04:36:08', 1, NULL),
(1152, 1162, '202310102', 'Uhziel Eli', 'Condori Rojas', '77167669', 'uhzielcreciendo@gmail.com', 'uhziel.condoriz@upeu.edu.pe', 'uhziel.condoriz', '997508664', 'Perú', NULL, 'Ninguno', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:08', '2025-10-07 04:36:08', 1, NULL),
(1153, 1163, '202310107', 'Russbell Daniel', 'Cari Mamani', '77502729', 'danieldecr7@gmail.com', 'russbell.cario@upeu.edu.pe', 'russbell.cario', '946774019', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:08', '2025-10-07 04:36:08', 1, NULL),
(1154, 1164, '202311894', 'Nelson Jose', 'Luque Mamani', '72198987', 'nelsonluque098@gmail.com', 'nelson.luque@upeu.edu.pe', 'nelson.luque', '950040079', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:09', '2025-10-07 04:36:09', 1, NULL),
(1155, 1165, '202311896', 'Kevin Jherson', 'Abarca Huayta', '75712023', 'kevindj13579@gmail.com', 'kevin.abarca@upeu.edu.pe', 'kevin.abarca', '983257498', 'Perú', NULL, 'Ninguno', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:09', '2025-10-07 04:36:09', 1, NULL),
(1156, 1166, '202311899', 'Randy Emmanuel', 'Concha Valle', '70377961', 'xxrandydxx78@gmail.com', 'randy.concha@upeu.edu.pe', 'randy.concha', '977857469', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:10', '2025-10-07 04:36:10', 1, NULL),
(1157, 1167, '202311904', 'Ronald Jhosue', 'Pastor Quispe', '76606525', 'ronald1pasot@gmial.com', 'ronald.pastor@upeu.edu.pe', 'ronald.pastor', '944501816', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:10', '2025-10-07 04:36:10', 1, NULL),
(1158, 1168, '202311909', 'William David', 'Ortiz Mamani', '72295671', 'davidom302@gmail.com', 'william.ortiz@upeu.edu.pe', 'william.ortiz', '935970356', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:11', '2025-10-07 04:36:11', 1, NULL),
(1159, 1169, '202311954', 'Xaris Fernando', 'Berrocal Saravia', '74172164', 'xarisfernando105@gmail.com', 'xaris.berrocal@upeu.edu.pe', 'xaris.berrocal', '960535210', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:11', '2025-10-07 04:36:11', 1, NULL),
(1160, 1170, '202312043', 'Moises Joaquin', 'Mestas Maque', '72198998', 'moisesjoaquin44@gmail.com', 'moises.mestas@upeu.edu.pe', 'moises.mestas', '965645314', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:12', '2025-10-07 04:36:12', 1, NULL),
(1161, 1171, '202312044', 'Erick Franco', 'Quispe Maza', '73857575', 'rrickquispe@gmail.com', 'franco.quispe@upeu.edu.pe', 'franco.quispe', '961758583', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:12', '2025-10-07 04:36:12', 1, NULL),
(1162, 1172, '202312049', 'Anthony Kelman', 'Mamani Vargas', '72471462', 'kelman.kmv@gmail.com', 'kelman.mamani@upeu.edu.pe', 'kelman.mamani', '913777376', 'Perú', NULL, 'Ninguno', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:13', '2025-10-07 04:36:13', 1, NULL),
(1163, 1173, '202312709', 'Howard Lemuel', 'Coila Alberto', '73892328', 'brayanhyo@gmail.com', 'howard.coila@upeu.edu.pe', 'howard.coila', '956799529', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:13', '2025-10-07 04:36:13', 1, NULL),
(1164, 1174, '202312716', 'Condori Julmer', 'Puma', '74027874', 'julmerpumacondori@gmail.com', 'julmer.puma@upeu.edu.pe', 'julmer.puma', '931939784', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:14', '2025-10-07 04:36:14', 1, NULL),
(1165, 1175, '202312725', 'Pawel Armando', 'Paricahua Adco', '76974581', 'jalpawel753@gmail.com', 'pawel.paricahua@upeu.edu.pe', 'pawel.paricahua', '938888511', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:14', '2025-10-07 04:36:14', 1, NULL),
(1166, 1176, '202312726', 'Marcelo Daniero', 'Torres Miranda', '73233666', 'marcelocoky0309@gmail.com', NULL, 'marcelo.torres', '938272056', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:15', '2025-10-07 04:36:15', 1, NULL),
(1167, 1177, '202312729', 'Hector Robert', 'Pacompia Quispe', '75148955', 'hector.pacompia@upeu.edu.pe', 'hector.pacompia@upeu.edu.pe', 'hector.pacompia', '923600530', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:15', '2025-10-07 04:36:15', 1, NULL),
(1168, 1178, '202312744', 'Rossel Teofilo', 'Turpo Maza', '74205582', 'rossel.turpo.123@gmail.com', 'rossel.turpo@upeu.edu.pe', 'rossel.turpo', '918112204', 'Perú', NULL, 'Evangélico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:15', '2025-10-07 04:36:15', 1, NULL),
(1169, 1179, '202121449', 'Daniel Franz', 'Pinto Mamani', '77231583', 'daniel.pinto@upeu.edu.pe', NULL, 'daniel.pinto', '935288996', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:16', '2025-10-07 04:36:16', 1, NULL),
(1170, 1180, '202211951', 'Guerry Cherman', 'Castillo Cuevaso', '73705695', 'guerrycastillo9@gmail.com', NULL, 'guerry.castillo', '940110116', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:16', '2025-10-07 04:36:16', 1, NULL),
(1171, 1181, '202212418', 'Nicole Sarai', 'Terrazas Rojas', '77342219', 'terrazasrojasnicole051@outlook.com', NULL, 'nicole.terrazas.', '979827362', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:17', '2025-10-07 04:36:17', 1, NULL),
(1172, 1182, '202212424', 'Rober Americo', 'Lipe Payehuanca', '75089492', 'payehuancarober18@gmail.com', NULL, 'rober.lipe', '927526220', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:17', '2025-10-07 04:36:17', 1, NULL),
(1173, 1183, '202212436', 'Jhon Alex', 'Gutierrez Morales', '75828539', 'gutierrezmoralesalex6@gmail.com', NULL, 'alex.gutierrez', '917062619', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:17', '2025-10-07 04:36:17', 1, NULL),
(1174, 1184, '202220532', 'Walter Geronimo', 'Cayte Sejje', '73306251', '90seuphoria.01@gmail.com', 'walter.cayte@upeu.edu.pe', 'walter.cayte', '920407364', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:18', '2025-10-07 04:36:18', 1, NULL),
(1175, 1185, '202220558', 'Jhony Alvaro', 'Mamani Pacco', '73743907', 'alvarojhony64@gmail.com', NULL, 'jhony.mamani.', '994058655', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:18', '2025-10-07 04:36:18', 1, NULL),
(1176, 1186, '202310096', 'Jeimy Paul', 'Ramos Coaquira', '75987810', 'jeimyramos@upeu.edu.pe', 'jeimy.ramos@upeu.edu.pe', 'jeimy.ramosa', '991116506', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:18', '2025-10-07 04:36:18', 1, NULL),
(1177, 1187, '202310097', 'JOSE MANUEL', 'QUISPE CONDORI', '75614685', 'tupapijosequispe901@gmail.com', 'manuel.quispe.ce@upeu.edu.pe', 'manuel.quispe.ce', '901084961', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:18', '2025-10-07 04:36:18', 1, NULL),
(1178, 1188, '202310103', 'Jhoel Midwar', 'Coila Mamani', '74178856', 'midwarcoila@gmail.com', 'jhoel.coilak@upeu.edu.pe', 'jhoel.coilak', '966127345', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:19', '2025-10-07 04:36:19', 1, NULL),
(1179, 1189, '202310105', 'Juan Anderson', 'Coasaca Huanca', '76015974', 'rankingrojo724@gmail.com', 'juan.coasaca@upeu.edu.pe', 'juan.coasacai', '901158525', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:19', '2025-10-07 04:36:19', 1, NULL),
(1180, 1190, '202310816', 'Idonis Mijael', 'Paye Trujillo', '75944258', 'axy09mijael@gmail.com', NULL, 'idonis.payen', '900527455', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:19', '2025-10-07 04:36:19', 1, NULL),
(1181, 1191, '202311893', 'Juan Diego', 'Condori Carlosviza', '75876243', 'juandiegocondori03@gmail.com', 'juan.condori.c@upeu.edu.pe', 'juan.condori.c', '999424252', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:20', '2025-10-07 04:36:20', 1, NULL),
(1182, 1192, '202311895', 'Kevin Edwin', 'Sucapuca Calcina', '74353032', 'kevinsucapuca894@gmail.com', 'kevin.sucapuca@upeu.edu.pe', 'kevin.sucapuca', '960906372', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:20', '2025-10-07 04:36:20', 1, NULL),
(1183, 1193, '202311897', 'Jannys Graciela', 'Navarro Acrota', '76210130', 'gnavarroacrota@gmail.com', 'jannys.navarro@upeu.edu.pe', 'jannys.navarro', '996579511', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:20', '2025-10-07 04:36:20', 1, NULL),
(1184, 1194, '202312046', 'Kevin Raphael', 'Paricahua Sanchez', '75128401', 'paricahuak40@gmail.com', 'kevin.paricahua@upeu.edu.pe', 'kevin.paricahua', '939191632', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:20', '2025-10-07 04:36:20', 1, NULL),
(1185, 1195, '202312051', 'Damaritd Camila', 'Mamani Paucar', '75395785', 'mamanipaucarcamila@gmail.com', 'damaritd.mamani@upeu.edu.pe', 'damaritd.mamani', '944313869', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:21', '2025-10-07 04:36:21', 1, NULL),
(1186, 1196, '202312053', 'Grover Brayan', 'Huisa Apaza', '71849102', 'groverbrayanh@gmail.com', 'grover.huisa@upeu.edu.pe', 'grover.huisa', '900213705', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:21', '2025-10-07 04:36:21', 1, NULL),
(1187, 1197, '202312054', 'Yohan Layder', 'Escarcena Pancca', '75902902', 'yohanlayder93122@gmail.com', 'yohan.escarcena@upeu.edu.pe', 'yohan.escarcena', '949552001', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:21', '2025-10-07 04:36:21', 1, NULL),
(1188, 1198, '202312057', 'Jose Luis', 'Huayta Mamani', '75378753', 'Mamanijoss635@gmail.com', NULL, 'jose.huayta', '974357754', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:22', '2025-10-07 04:36:22', 1, NULL),
(1189, 1199, '202312058', 'Yunior Benito', 'Quispe Quispe', '75606129', 'yunior_quispe_@hotmail.com', 'yunior.quispe@upeu.edu.pe', 'yunior.quispe', '963409485', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:23', '2025-10-07 04:36:23', 1, NULL),
(1190, 1200, '202312712', 'Carlos Santiago', 'Bustamante Carpio', '72042723', 'carlosbustamante8466@gmail.com', NULL, 'santiago.bustamante', '927049572', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:23', '2025-10-07 04:36:23', 1, NULL),
(1191, 1201, '202312714', 'Nahuel Rafael', 'Supo Huahuacondori', '72540737', 'yukyuel@gmail.com', NULL, 'nahuel.supo', '972794190', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:23', '2025-10-07 04:36:23', 1, NULL),
(1192, 1202, '202312722', 'Edgar David', 'Naira Alture', '61321351', 'mcdavnay@gmail.com', 'edgar.naira@upeu.edu.pe', 'edgar.naira', '981740957', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:23', '2025-10-07 04:36:23', 1, NULL),
(1193, 1203, '202312728', 'Elvis Jesus', 'Apaza Yucra', '76371922', 'elvisjesusapazayucra17@gmail.com', NULL, 'elvis.apaza.a', '916859627', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:24', '2025-10-07 04:36:24', 1, NULL),
(1194, 1204, '202312742', 'Maria De Los Angeles', 'Torres Apaza Rosa', '74059496', 'rosamariadelosangelestorres@gmail.com', NULL, 'rosa.torres.t', '998989901', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:24', '2025-10-07 04:36:24', 1, NULL),
(1195, 1205, '202010800', 'Jack Steve', 'Paricela Pongo', '72442022', 'paricela54@gmail.com', NULL, 'jack.paricela', '964975827', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:24', '2025-10-07 04:36:24', 1, NULL),
(1196, 1206, '201812020', 'Mijael Yurin', 'Coaquira Justo', '74695061', 'mijhoelyurinscoaquirojuzto@gmail.com', NULL, 'mizael.coaquira', '982851401', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:25', '2025-10-07 04:36:25', 1, NULL),
(1197, 1207, '201911714', 'Apaza Julmer', 'Quispe', '74949912', 'julmer.quispe@upeu.edu.pe', NULL, 'julmer.quispe', '967240217', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:25', '2025-10-07 04:36:25', 1, NULL),
(1198, 1208, '201911775', 'Jose Armando', 'Mamani Poccohuanca', '71734782', 'jose.mamani@upeu.edu.pe', 'jose.mamani@upeu.edu.pe', 'armando.mamani.p', '950337189', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:26', '2025-10-07 04:36:26', 1, NULL),
(1199, 1209, '202014001', 'Roy Guimel', 'Huaricallo Turpo', '71128207', 'royhuaricallo616@gmail.com', 'royhuaricallo@upeu.edu.pe', 'royhuaricallo', '969502000', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:26', '2025-10-07 04:36:26', 1, NULL),
(1200, 1210, '202014010', 'Marichi Lanzeloth', 'Vargas', '76947964', 'lvargasmarichi@gmail.com', NULL, 'lanzelothvargas', '950296100', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:26', '2025-10-07 04:36:26', 1, NULL),
(1201, 1211, '202015143', 'Turpo Vladimir', 'Quispe', '73645462', 'vladimir.quispe@upeu.edu.pe', 'vladimir.quispe@upeu.edu.pe', 'vladimir.quispe', '949214706', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:27', '2025-10-07 04:36:27', 1, NULL),
(1202, 1212, '202118091', 'Luz Milagros', 'Huanca Pacco', '77465101', 'mila.huanca11@gmail.com', 'milagros.huanca@upeu.edu.pe', 'milagros.huanca', '986493811', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:27', '2025-10-07 04:36:27', 1, NULL),
(1203, 1213, '202118099', 'Alahin Reyme', 'Ticona Veliz', '75945425', 'alahinticona@gmail.com', NULL, 'alahin.ticona', '929406064', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:27', '2025-10-07 04:36:27', 1, NULL),
(1204, 1214, '202118104', 'Yamil Valente', 'Quispe Cuellar', '72517914', 'rev15cpr@gmail.com', NULL, 'valente.quispe', '931818268', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:27', '2025-10-07 04:36:27', 1, NULL),
(1205, 1215, '202121457', 'Aquino Nilver', 'Salcca', '73763903', 'nilver.1967@gmail.com', 'nilver.salcca@upeu.edu.pe', 'nilver.salcca', '953510784', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:28', '2025-10-07 04:36:28', 1, NULL),
(1206, 1216, '202121472', 'Martinez Grimaldo', 'Arredondo', '72155931', 'grimaldoarredondomartinez@gmail.com', NULL, 'grimaldo.arredondo', '929424184', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:28', '2025-10-07 04:36:28', 1, NULL),
(1207, 1217, '202122864', 'Josue Gabriel', 'Ochoa Mamani', '72363716', 'josue.ochoa@upeu.edu.pe', NULL, 'josue.ochoa', '952206009', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:29', '2025-10-07 04:36:29', 1, NULL),
(1208, 1218, '202211721', 'Nina David', 'Romero', '75397140', 'davidnina658@gmail.com', 'david.romero@upeu.edu.pe', 'david.romero', '947753202', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:29', '2025-10-07 04:36:29', 1, NULL),
(1209, 1219, '202211724', 'Joselyn Milagros', 'Yucra Mamani', '75929941', 'joselyn.yucra@upeu.edu.pe', NULL, 'joselyn.yucra', '946793287', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:29', '2025-10-07 04:36:29', 1, NULL),
(1210, 1220, '202211727', 'Leonardo Jesus', 'Huaman Arhuata', '75978715', 'jesus.huaman181219@gmail.com', NULL, 'leonardojesus.huaman.a', '922070236', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:30', '2025-10-07 04:36:30', 1, NULL),
(1211, 1221, '202211852', 'Harry Jack', 'Ascuña Mamani', '71499708', 'bouncybobi64@gmail.com', NULL, 'harry.ascuna', '970972417', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:30', '2025-10-07 04:36:30', 1, NULL),
(1212, 1222, '202211894', 'Raquel Kantu', 'Coaquira Puma', '73389592', 'kantucoaquira@gmail.com', NULL, 'raquel.coaquira', '993173853', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:30', '2025-10-07 04:36:30', 1, NULL),
(1213, 1223, '202211955', 'Franck Albertson', 'Coaquira Justo', '75475383', 'frankcoaquirajusto4@gmail.com', NULL, 'franck.coaquira', '913936304', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:30', '2025-10-07 04:36:30', 1, NULL),
(1214, 1224, '202212426', 'Abdul Alfonso', 'Quispe Condori', '76595677', 'abdulalfonso77@gmail.com', NULL, 'abdul.quispe', '900360380', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:31', '2025-10-07 04:36:31', 1, NULL),
(1215, 1225, '202212434', 'Marco Stefano', 'Chura Rodriguez', '77135682', 'marcostefano123@gmail.com', NULL, 'marco.chura', '956636993', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:31', '2025-10-07 04:36:31', 1, NULL),
(1216, 1226, '202212437', 'Efrain Nayder', 'Arce Mayta', '77148460', 'kioarce12@gmail.com', NULL, 'nayder.arce', '955182152', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:31', '2025-10-07 04:36:31', 1, NULL),
(1217, 1227, '202212453', 'Jose Miguel', 'Condo Huamani', '76772797', 'josephmiguel1103@gmail.com', NULL, 'jose.condo', '985461582', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:31', '2025-10-07 04:36:31', 1, NULL),
(1218, 1228, '202212463', 'Wilbert Alex', 'Mayta Arotaype', '75073576', 'maytawilbert168@gmail.com', NULL, 'wilbert.mayta', '926524374', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:32', '2025-10-07 04:36:32', 1, NULL),
(1219, 1229, '202212839', 'Renzo Rodi', 'Juli Machaca', '75522903', 'renzojuli717@gmail.com', 'renzo.juli@upeu.edu.pe', 'renzo.juli.', '992809735', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:32', '2025-10-07 04:36:32', 1, NULL),
(1220, 1230, '202220534', 'Frank Pretel', 'Ramos Arisapana', '62483828', 'ramosfrank318@gmail.com', 'frank.ramos@upeu.edu.pe', 'frank.ramos', '960847774', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:32', '2025-10-07 04:36:32', 1, NULL),
(1221, 1231, '202220535', 'Glenen Wrangler', 'Choquechambi Luque', '75811536', 'Leninbk17@gmail.com', 'glenen.choquechambi@upeu.edu.pe', 'glenen.choquechambi', '987561497', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:32', '2025-10-07 04:36:32', 1, NULL),
(1222, 1232, '202220538', 'Brayan Raul', 'Condori Quispe', '74129067', 'brayanraulcondori@gmail.com', NULL, 'brayan.condori', '974201187', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:33', '2025-10-07 04:36:33', 1, NULL),
(1223, 1233, '202220543', 'Hanccoccallo Humberto', 'Ccollqque', '71052591', 'humber23ch@gmail.com', NULL, 'humberto.ccollqque', '910087582', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:33', '2025-10-07 04:36:33', 1, NULL),
(1224, 1234, '202220544', 'Nick Saim', 'Mayta Jara', '72883381', 'nicksaim69@gmail.com', NULL, 'nick.mayta', '958787651', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:33', '2025-10-07 04:36:33', 1, NULL),
(1225, 1235, '202220551', 'Inofuente Claudio', 'Bustinza', '71480000', 'guitarrapuno18@gmail.com', NULL, 'claudio.bustinza', '945667271', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:33', '2025-10-07 04:36:33', 1, NULL),
(1226, 1236, '202220553', 'Jhan Logan', 'Ramos Quispe', '77289678', 'jhanramos8888@gmail.com', NULL, 'jhan.ramos', '912067030', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:34', '2025-10-07 04:36:34', 1, NULL),
(1227, 1237, '202220561', 'Joel Jhonatan', 'Quispe Mamani', '75829130', 'jhon.13eleven@gmail.com', NULL, 'joel.quispe.', '971666848', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:34', '2025-10-07 04:36:34', 1, NULL),
(1228, 1238, '202220562', 'Henyelrey Lucio', 'Garcia Chura', '73636215', 'henyel91@gmail.com', NULL, 'henyelrey.garcia', '916479910', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:34', '2025-10-07 04:36:34', 1, NULL),
(1229, 1239, '202220568', 'Celia Patricia', 'Apaza Hilasaca', '72320785', 'apazap369@gmail.com', 'celia.apaza@upeu.edu.pe', 'celia.apaza', '931293340', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:35', '2025-10-07 04:36:35', 1, NULL),
(1230, 1240, '202220570', 'Jhenderson Aaron', 'Machaca Mamani', '75910460', 'yenderson123tmr@gmail.com', NULL, 'jhenderson.machaca.', '951494861', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:35', '2025-10-07 04:36:35', 1, NULL),
(1231, 1241, '201612464', 'Jarita Alex', 'Coila', '70405220', 'jonyd718@gmail.com', 'alex.coila@upeu.edu.pe', 'alex.coila', '955867498', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:35', '2025-10-07 04:36:35', 1, NULL),
(1232, 1242, '201620137', 'Denilson Leeke', 'Mamani Flores', '77799794', 'denilson.mamani@upeu.edu.pe', NULL, 'denilson.mamani', '925513836', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:36', '2025-10-07 04:36:36', 1, NULL),
(1233, 1243, '201810211', 'PACHAURI OMAR', 'CONDORI', '45275975', 'omarcondor200@gmail.com', 'omarcondori@upeu.edu.pe', 'omarcondori', '960899657', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:36', '2025-10-07 04:36:36', 1, NULL),
(1234, 1244, '201820093', 'Fray Benjamin', 'Kana Chullo', '72246403', 'fkanachullo12@gmail.com', 'fraykana@upeu.edu.pe', 'fraykana', '930459543', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:36', '2025-10-07 04:36:36', 1, NULL),
(1235, 1245, '202118086', 'Miguel Alexandre', 'Huayhua Chambi', '72220123', 'miguel2dre@gmail.com', 'miguel.huayhua@upeu.edu.pe', 'miguel.huayhua', '927142581', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:37', '2025-10-07 04:36:37', 1, NULL),
(1236, 1246, '202118119', 'Jorge Luis', 'Gutierrez Miranda', '76274953', 'george159357852@gmail.com', 'jorge.gutierrrez@upeu.edu.pe', 'jorge.gutierrrez', '906965252', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:37', '2025-10-07 04:36:37', 1, NULL),
(1237, 1247, '202121436', 'Ivan Yomar', 'Mamani Merma', '74178089', 'ivanmamani@gmail.com', 'yomar.mamani@upeu.edu.pe', 'yomar.mamani', '900685435', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:37', '2025-10-07 04:36:37', 1, NULL),
(1238, 1248, '202122862', 'Chura Crhistian', 'Chuquitarqui', '74541112', 'cristianchuquitarqui03@gmail.com', 'crhistian.chuquitarqui@upeu.edu.pe', 'crhistian.chuquitarqui', '942344382', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:37', '2025-10-07 04:36:37', 1, NULL),
(1239, 1249, '202122865', 'Luis Fernando', 'Mamani Mamani', '76652010', 'luisfernandomamanimamani456@gmail.com', NULL, 'fernando.mamani.m', '963665874', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:38', '2025-10-07 04:36:38', 1, NULL),
(1240, 1250, '202210708', 'Jose Samuel', 'Turpo Cauna', '73761424', 'jose.turpo.c@upeu.edu.pe', NULL, 'jose.turpo.', '910835680', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:38', '2025-10-07 04:36:38', 1, NULL),
(1241, 1251, '202210709', 'Yesenia Alejandra', 'Gutierrez Anco', '73382542', 'alejandraredfg3@gmail.com', NULL, 'yesenia.gutierrez', '927514181', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:38', '2025-10-07 04:36:38', 1, NULL),
(1242, 1252, '202210712', 'Ccama Jaqueline', 'Huahuaccapa', '77148458', 'jaqueline.21623@gmail.com', NULL, 'jaqueline.huahuaccapa', '927679319', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:39', '2025-10-07 04:36:39', 1, NULL),
(1243, 1253, '202211719', 'Klubhert Rennzo', 'Cardenas Vilca', '76607788', 'cardenascv590@gmail.com', NULL, 'klubhert.cardenas', '944646424', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:39', '2025-10-07 04:36:39', 1, NULL),
(1244, 1254, '202211720', 'Jhosef Anthony', 'Quispe Huarilloclla', '71397072', 'jhosefqh122@gmail.com', NULL, 'jhosef.quispe', '913730242', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:39', '2025-10-07 04:36:39', 1, NULL),
(1245, 1255, '202211953', 'Mery Elizabeth', 'Flores Llanque', '73945407', 'elizabeth.flores.l@upeu.edu.pe', NULL, 'elizabeth.flores.l', '918925849', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:40', '2025-10-07 04:36:40', 1, NULL),
(1246, 1256, '202211956', 'Eberth Emmanuel', 'Rosales Castillo', '75774954', 'eberthrosalescastillo@gmail.com', 'eberth.rosales@upeu.edu.pe', 'eberth.rosales', '991904321', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:40', '2025-10-07 04:36:40', 1, NULL),
(1247, 1257, '202212416', 'Sulca Cristian', 'Cabana', '75486048', 'christcabana@gmail.com', NULL, 'cristian.cabana', '936511008', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:41', '2025-10-07 04:36:41', 1, NULL);
INSERT INTO `personas` (`id_persona`, `usuario_id`, `codigo_estudiante`, `nombres`, `apellidos`, `documento_identidad`, `correo_personal`, `correo_institucional`, `usuario_login`, `celular`, `pais`, `foto_url`, `religion`, `fecha_nacimiento`, `fecha_matricula`, `modo_contrato`, `modalidad_estudio`, `sede`, `facultad`, `programa_estudio`, `ciclo`, `grupo`, `fecha_creacion`, `fecha_modificacion`, `creado_por`, `modificado_por`) VALUES
(1248, 1258, '202212421', 'Luis Alberto', 'Quilla Lopez', '71945296', 'quillaluis501@gmail.com', NULL, 'alberto.quilla', '983404586', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:41', '2025-10-07 04:36:41', 1, NULL),
(1249, 1259, '202212423', 'Andres Lino', 'Montes Mamani', '75218458', 'lmoplas0@gmail.com', NULL, 'andres.montes', '959746720', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:41', '2025-10-07 04:36:41', 1, NULL),
(1250, 1260, '202212425', 'Fran Franklin', 'Calizaya Apaza', '72655551', 'fraserk599@gmail.com', NULL, 'fran.calizaya', '918874568', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:42', '2025-10-07 04:36:42', 1, NULL),
(1251, 1261, '202212432', 'David Robert', 'Yucra Mamani', '74242506', 'david.yucra@upeu.edu.pe', NULL, 'david.yucra', '944042223', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:42', '2025-10-07 04:36:42', 1, NULL),
(1252, 1262, '202212438', 'Gladys Rosaura', 'Yana Pari', '61321161', 'sincorreo@upeu.edu.pe', NULL, 'gladys.yana', '977626607', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:43', '2025-10-07 04:36:43', 1, NULL),
(1253, 1263, '202212439', 'Jherson Jean Piero', 'Fernandez Sanchez', '72810350', 'jherson.fernandez.19@gmail.com', NULL, 'jherson.fernandez', '970345089', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:43', '2025-10-07 04:36:43', 1, NULL),
(1254, 1264, '202212441', 'Maykol Junior', 'Paredes Aracayo', '75783718', 'maykolaracayo22@gmail.com', NULL, 'maykol.paredes', '923788039', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:44', '2025-10-07 04:36:44', 1, NULL),
(1255, 1265, '202212450', 'Jamil Antony', 'Zuñiga Apaza', '76832304', 'antonyj1082000@gmail.com', NULL, 'jamil.zuniga', '992255284', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:44', '2025-10-07 04:36:44', 1, NULL),
(1256, 1266, '202212452', 'Alessandro Pastor', 'Mamani Mamani', '74144447', 'alexkip159alex@gmail.com', NULL, 'alessandro.mamani', '985909061', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:44', '2025-10-07 04:36:44', 1, NULL),
(1257, 1267, '202212454', 'Hiram Jeremy', 'Ccoto Cruz', '71611274', 'hiramjeremi.hariado@gmail.com', NULL, 'hiram.ccoto.', '937137465', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:45', '2025-10-07 04:36:45', 1, NULL),
(1258, 1268, '202212461', 'Fabrizio Yerald Alfonso', 'Sanchez Saravia', '72631474', 'fabrizio.sanchez.s@upeu.edu.pe', NULL, 'fabrizio.sanchez.', '922225356', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:45', '2025-10-07 04:36:45', 1, NULL),
(1259, 1269, '202212464', 'Jhoel Hairton', 'Apaza Quispe', '74214335', 'jhoelhairton770@gmail.com', NULL, 'hairton.apaza', '916542920', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:45', '2025-10-07 04:36:45', 1, NULL),
(1260, 1273, '200920467', 'Jhan Carlos', 'Flores Chaiña', '47462792', 'jhancarlosf@gmail.com', NULL, 'carlos_fc', '990174529', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:49', '2025-10-07 04:36:49', 1, NULL),
(1261, 1274, '201620106', 'Ronaldy Solano', 'Ito Lopez', '70405174', 'ronaldyitolopez@gmail.com', NULL, 'ronaldyito', '914331679', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:50', '2025-10-07 04:36:50', 1, NULL),
(1262, 1275, '202012376', 'Jose Israel', 'Ccoto Cruz', '71611273', 'jiccjoseisrael@gmail.com', 'jose.ccoto@upeu.edu.pe', 'jose.ccoto', '958708507', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:50', '2025-10-07 04:36:50', 1, NULL),
(1263, 1276, '202012380', 'Henry Jhonatan', 'Velasquez Rosas', '45849766', 'jhonatan_rosas25@hotmail.com', 'henry.velasquez@upeu.edu.pe', 'henry.velasquez', '969444400', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:51', '2025-10-07 04:36:51', 1, NULL),
(1264, 1277, '202012388', 'Christian Wilbert', 'Salas Yupanqui', '76874485', 'christiansalasyupanqui@gmail.com', 'christian.salas@upeu.edu.pe', 'christian.salas', '936935387', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:51', '2025-10-07 04:36:51', 1, NULL),
(1265, 1278, '202014004', 'Brayner Anibal', 'Mamani Calcina', '73598670', 'braynermc2021@gmail.com', 'braynermamani@upeu.edu.pe', 'braynermamani', '913611791', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:51', '2025-10-07 04:36:51', 1, NULL),
(1266, 1279, '202014014', 'Infa Manuel', 'Lazarte', '73759704', 'JOSE_654987@HOTMAIL.COM', NULL, 'manuellazarte', '944022664', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:52', '2025-10-07 04:36:52', 1, NULL),
(1267, 1280, '202014016', 'Guver Leon', 'Ccori Ccoarite', '60204054', 'gccoarite@gmail.com', 'guverccori@upeu.edu.pe', 'guverccori', '992247549', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:52', '2025-10-07 04:36:52', 1, NULL),
(1268, 1281, '202014017', 'Mucho Alexander', 'Chucuya', '71046725', 'a_alexander2002@hotmail.com', 'alexanderchucuya@upeu.edu.pe', 'alexanderchucuya', '910668541', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:52', '2025-10-07 04:36:52', 1, NULL),
(1269, 1282, '202100324', 'Olger Herber', 'Infa Ccallo', '73453504', 'olger.infa@upeu.edu.pe', 'olger.infa@upeu.edu.pe', 'olger.infa', '951448867', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:53', '2025-10-07 04:36:53', 1, NULL),
(1270, 1283, '202100418', 'Mark Roger', 'Pino Chata', '76651651', 'mark.pino@upeu.edu.pe', 'mark.pino@upeu.edu.pe', 'mark.pino', '974981999', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:53', '2025-10-07 04:36:53', 1, NULL),
(1271, 1284, '202118088', 'Jean Franco', 'Laura Quispe', '76412931', 'jeanlaura@gmail.com', NULL, 'jean.laura', '995491811', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:54', '2025-10-07 04:36:54', 1, NULL),
(1272, 1285, '202118101', 'Oscata Romel', 'Gutierrez', '73644322', 'romelgutierrez90@gmail.com', 'romel.gutierrez@upeu.edu.pe', 'romel.gutierrez', '918275453', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:54', '2025-10-07 04:36:54', 1, NULL),
(1273, 1286, '202118103', 'Gary Fernando', 'Yunganina Mamani', '71950118', 'gary.yunganina@upeu.edu.pe', NULL, 'gary.yunganina', '943560171', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:54', '2025-10-07 04:36:54', 1, NULL),
(1274, 1287, '202122850', 'Christian Rafael', 'Mamani Callata', '75374289', 'crmc2k04@gmail.com', NULL, 'rafael.mamani.c', '992848064', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:54', '2025-10-07 04:36:54', 1, NULL),
(1275, 1288, '202122859', 'Anyelo Jhans', 'Sarmiento Larico', '72656122', 'anyelojhans@gmail.com', NULL, 'angello.sarmiento', '982861471', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:55', '2025-10-07 04:36:55', 1, NULL),
(1276, 1289, '202122870', 'Jhon Alexander', 'Chambi Vilca', '74868952', 'alexander.chambi@upeu.edu.pe', NULL, 'alexander.chambi', '946657878', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:55', '2025-10-07 04:36:55', 1, NULL),
(1277, 1290, '202123376', 'Cristhian Edy', 'Llanque Tipo', '71617709', 'cristhian.llanque@upeu.edu.pe', 'cristhian.llanque@upeu.edu.pe', 'cristhian.llanque', '974342536', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:55', '2025-10-07 04:36:55', 1, NULL),
(1278, 1291, '202123391', 'Katherine Esmeralda', 'Aguirre Cruz', '71739614', 'katherine23062004@gmail.com', NULL, 'katherine.aguirre', '929405143', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:56', '2025-10-07 04:36:56', 1, NULL),
(1279, 1293, '201710603', 'Kevin Arturo', 'Quispe Apaza', '75848586', 'kevin.quispe@upeu.edu.pe', NULL, 'kevin.quispe', '951200857', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:56', '2025-10-07 04:36:56', 1, NULL),
(1280, 1294, '201712131', 'Frans Edward', 'Paxi Juchani', '78887021', 'frans.paxi@upeu.edu.pe', NULL, 'frans.paxi', '968428380', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:57', '2025-10-07 04:36:57', 1, NULL),
(1281, 1295, '201712135', 'Erickson Raul', 'Quispe Churata', '70521769', 'ericksonraulquispechurata@gmail.com', NULL, 'erickson.quispe', '955281207', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:57', '2025-10-07 04:36:57', 1, NULL),
(1282, 1296, '201720068', 'Gary Alexandro', 'Aguirre Medina', '71411055', 'gary.aguirre@upeu.edu.pe', NULL, 'gary.aguirre', '920169481', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:58', '2025-10-07 04:36:58', 1, NULL),
(1283, 1297, '201810398', 'Jose Angel', 'Condori Ccapa', '75276119', 'cj_angel@outlook.com', NULL, 'angel.cc', '930911491', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:58', '2025-10-07 04:36:58', 1, NULL),
(1284, 1298, '201811303', 'Cristhian Efrain', 'Ruelas Canaza', '75784734', 'ruelas@gmail.com', 'cristhian.ruelas@upeu.edu.pe', 'cristhian.ruelas', '995057895', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:58', '2025-10-07 04:36:58', 1, NULL),
(1285, 1299, '201811993', 'Eduardo Alexis', 'Yucra Sucapuca', '72888468', 'eduardo.yucra.alexis@gmail.com', NULL, 'eduardo.yucra', '976492765', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:59', '2025-10-07 04:36:59', 1, NULL),
(1286, 1300, '201910101', 'Darwin Julinho', 'Condori Mamani', '70182537', 'darwincondorimamani@gmail.com', NULL, 'darwincondori', '971857906', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:59', '2025-10-07 04:36:59', 1, NULL),
(1287, 1301, '201911633', 'Christian Giovani', 'Supo Condori', '73811842', 'christiangiovanisupocondori@gmail.com', 'christiansupo@upeu.edu.pe', 'christiansupo', '961473333', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:36:59', '2025-10-07 04:36:59', 1, NULL),
(1288, 1302, '202010802', 'Darwin Paul', 'Mamani Carta', '74444249', 'darwin199960@gmail.com', 'darwin.mamani@upeu.edu.pe', 'darwin.mamani', '927999598', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:37:00', '2025-10-07 04:37:00', 1, NULL),
(1289, 1303, '202015132', 'Jose Daniel', 'Quispe Arizaca', '77801391', 'josequispearizaca2003@gmail.com', 'daniel.quispe.a@upeu.edu.pe', 'daniel.quispe.a', '922166530', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:37:00', '2025-10-07 04:37:00', 1, NULL),
(1290, 1304, '202100357', 'Frank Diego', 'Choquehuanca Huayhua', '72680515', 'mjb306diego@gmail.com', 'frank.choquehuanca@upeu.edu.pe', 'frank.choquehuanca', '991387322', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:37:00', '2025-10-07 04:37:00', 1, NULL),
(1291, 1305, '202100419', 'Quispe Marilyn', 'Mamani', '71936545', 'marilyn.maman@upeu.edu.pe', 'marilyn.mamani@upeu.edu.pe', 'marilyn.mamani', '963131072', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:37:01', '2025-10-07 04:37:01', 1, NULL),
(1292, 1306, '202100458', 'Guino Elvis', 'Yujra Vargas', '74349846', 'ginoyujra38@gmail.com', 'guino.yujra@upeu.edu.pe', 'guino.yujra', '916882598', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:37:01', '2025-10-07 04:37:01', 1, NULL),
(1293, 1307, '202116218', 'Marcos Felipe', 'Valeriano Mamani', '72880237', 'marcos.valeriano@hotmail.com', NULL, 'marcos.valeriano', '989475095', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:37:02', '2025-10-07 04:37:02', 1, NULL),
(1294, 1308, '202118089', 'Gustavo Alberto', 'Salluca Solis', '70050849', 'gustavo08_99@hotmail.com', 'gustavo.salluca@upeu.edu.pe', 'gustavo.salluca', '906771606', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:37:02', '2025-10-07 04:37:02', 1, NULL),
(1295, 1309, '202118092', 'Mamani Manuel', 'Chunca', '77298041', 'manuel.chunca@upeu.edu.pe', 'manuel.chunca@upeu.edu.pe', 'manuel.chunca', '954569153', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:37:02', '2025-10-07 04:37:02', 1, NULL),
(1296, 1310, '202118095', 'Jhamil Noe', 'Apaza Quispe', '75840630', 'jhamil.apaza@upeu.edu.pe', 'jhamil.apaza@upeu.edu.pe', 'jhamil.apaza', '950994489', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:37:03', '2025-10-07 04:37:03', 1, NULL),
(1297, 1311, '202118098', 'Joselin Mayely', 'Condori Tintaya', '74056698', 'joselin.condori@upeu.edu.pe', 'joselin.condori@upeu.edu.pe', 'joselin.condori', '969269885', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:37:03', '2025-10-07 04:37:03', 1, NULL),
(1298, 1312, '202118100', 'Dan Elioth', 'Condori Pongo', '77689137', 'elitocp@gmail.com', 'dan.condori@upeu.edu.pe', 'dan.condori', '962715263', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:37:04', '2025-10-07 04:37:04', 1, NULL),
(1299, 1313, '202118108', 'Alex David', 'Zela Mamani', '76481964', 'alexdavidxela@gmail.com', 'alex.zela@upeu.edu.pe', 'alex.zela', '987077661', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:37:04', '2025-10-07 04:37:04', 1, NULL),
(1300, 1314, '202118110', 'Dyana Zarayd', 'Pari Quispe', '74406010', 'dayam935@gmail.com', 'dyana.pari@upeu.edu.pe', 'dyana.pari', '952074738', 'Perú', NULL, 'Otro', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:37:04', '2025-10-07 04:37:04', 1, NULL),
(1301, 1315, '202118122', 'Daniel Alexis', 'Aro Maquera', '73643346', 'arodan.co@gmail.com', 'daniel.aro@upeu.edu.pe', 'daniel.aro', '950315128', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:37:05', '2025-10-07 04:37:05', 1, NULL),
(1302, 1316, '202118123', 'Ortiz Junior', 'Vilcapaza', '77139027', 'juniorvilcapaza15@gmail.com', 'junior.vilcapaza@upeu.edu.pe', 'junior.vilcapaza', '916125197', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:37:05', '2025-10-07 04:37:05', 1, NULL),
(1303, 1317, '202118540', 'Morelia Lisbeth', 'Oblitas Azana', '72086302', 'morelia.oblitas@upeu.edu.pe', NULL, 'morelia.oblitas', '947990377', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:37:05', '2025-10-07 04:37:05', 1, NULL),
(1304, 1318, '202120651', 'Frank Grimaldy', 'Chunca Mamani', '77298040', 'frank.chunca@upeu.edu.pe', 'frank.chunca@upeu.edu.pe', 'frank.chunca', '997448946', 'Perú', NULL, 'Adventista del Séptimo Día', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:37:06', '2025-10-07 04:37:06', 1, NULL),
(1305, 1319, '202121992', 'Luis Martin', 'Vilca Hilasaca', '75998706', 'martinvilca@upeu.edu.pe', 'luis.vilca@upeu.edu.pe', 'luis.vilca', '993763335', 'Perú', NULL, 'Católico', NULL, NULL, 'REGULAR', 'PRESENCIAL', 'Filial Juliaca', 'Facultad de Ingeniería y Arquitectura', 'EP Ingeniería de Sistemas', NULL, NULL, '2025-10-07 04:37:06', '2025-10-07 04:37:06', 1, NULL);

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
(1, 'superadmin', 'superadmin@upeu.edu.pe', '$2a$10$Lj0lVO9xMA.Vbl1fZhZVDOpFFu/67IiQ3/KHn77n56wnlAfRmdxsK', 'SUPERADMIN', 1, '2025-10-04 21:53:30', '2025-10-07 04:30:59', '2025-10-06 23:31:00'),
(2, 'andy.atamari', 'andy.atamari@upeu.edu.pe', '$2a$10$2t5Wfn3s66137JfvkgeCPuiG/f/tiQ.yLBdD.tzx2OL8mxvA.7AiK', 'INTEGRANTE', 1, '2025-10-05 13:36:11', '2025-10-07 04:32:41', '2025-10-06 23:32:42'),
(3, 'maria.gomez', 'maria@upeu.edu.pe', '$2a$10$mATBujsD8OD1swc90dAU...2YtSHR9KJydc4qABWrYx1WrZbTHzV6', 'INTEGRANTE', 1, '2025-10-05 13:37:01', '2025-10-06 15:31:40', '2025-10-06 10:31:41'),
(851, '75388130', '75388130@upeu.edu.pe', '$2a$10$p3OLaQn/M6XrWE5RZ9b54OzAxo34P/IzST6KKj.8XRk7uCDAOiGHG', 'INTEGRANTE', 1, '2025-10-07 04:33:37', '2025-10-07 04:33:37', NULL),
(852, 'jimy.catacora', 'alvarocatacora14@gmail.com', '$2a$10$dyLzTNU.497srPDHtui4iuBZuZ3zeAmBnHRTjGof0rD2ubwlMfnHe', 'INTEGRANTE', 1, '2025-10-07 04:33:38', '2025-10-07 04:33:38', NULL),
(853, '60178124', '60178124@upeu.edu.pe', '$2a$10$e8ZfaiQGchYXJ.V52gaRWe4EUMADWv0nZ2tzhFhRkHSGKtlSzN/.C', 'INTEGRANTE', 1, '2025-10-07 04:33:38', '2025-10-07 04:33:38', NULL),
(854, '60223519', '60223519@upeu.edu.pe', '$2a$10$Lt.jUimDPbKKQLl7XyjtYeSCVZ/5Bm6G5vkdtYqP2aQKNKTViE8Ua', 'INTEGRANTE', 1, '2025-10-07 04:33:38', '2025-10-07 04:33:38', NULL),
(855, 'jimena.l.mamani', 'jimena.l.mamani@upeu.edu.pe', '$2a$10$FzaHExJwHBA4u6dVOtHEdeyQQL6HtXOoN.cg1fzQsS5hbyL6NBwlm', 'INTEGRANTE', 1, '2025-10-07 04:33:39', '2025-10-07 04:33:39', NULL),
(856, 'shanti.apaza', 'shanti.apaza@upeu.edu.pe', '$2a$10$Mv8phLPxnjUwXIl4hWrGSeOOilqNPEPCIlcL/yhgfnqdS.IvpjNgO', 'INTEGRANTE', 1, '2025-10-07 04:33:39', '2025-10-07 04:33:39', NULL),
(857, 'brayan.soncco', 'brayan.soncco@upeu.edu.pe', '$2a$10$WcN7uHqBZZKrenBShvQCWOpVpzrkt7Muhhsdj3DygiKVIDp9ldHT.', 'INTEGRANTE', 1, '2025-10-07 04:33:40', '2025-10-07 04:33:40', NULL),
(858, 'jared.lopez', 'jared.lopez@upeu.edu.pe', '$2a$10$RMAM2k1vQYsnF8uS9enFFexZi0FDr3apgxWDahC6vE6y130nCQqPe', 'INTEGRANTE', 1, '2025-10-07 04:33:40', '2025-10-07 04:33:40', NULL),
(859, 'damarys.c.ccallata', 'damarys.c.ccallata@upeu.edu.pe', '$2a$10$ftkKTNMmu2AHRtGHmue5QOJZjGVhH6MrHX6gIF7dlgrLu4adr12gK', 'INTEGRANTE', 1, '2025-10-07 04:33:41', '2025-10-07 04:33:41', NULL),
(860, 'carlos.condori01', 'carlos.condori01@upeu.edu.pe', '$2a$10$WcX2UOcL1FCRVT4mJE/q8OFrYE3LqT4/zcpksERAmxHxsxuQHJyD2', 'INTEGRANTE', 1, '2025-10-07 04:33:41', '2025-10-07 04:33:41', NULL),
(861, 'diego.yanarico', 'diego.yanarico@upeu.edu.pe', '$2a$10$IfgniJ4e9.or69aE3KuY3OEd0A9.rAYhU8a9QzYVM824xcZZqcSIy', 'INTEGRANTE', 1, '2025-10-07 04:33:42', '2025-10-07 04:33:42', NULL),
(862, 'jhon.yana12', 'jhon.yana12@upeu.edu.pe', '$2a$10$v5BzS7VCWkvP1FyubZryZue.B1fstf7XYFdsChJ9VniPWMkOLHJNK', 'INTEGRANTE', 1, '2025-10-07 04:33:42', '2025-10-07 04:33:42', NULL),
(863, 'yord.paricahua', 'yord.paricahua@upeu.edu.pe', '$2a$10$L/4cWnntXNZtjYk8RXKhp.Q8380ePyqru7FhGSEUMRuFHT3sALnva', 'INTEGRANTE', 1, '2025-10-07 04:33:43', '2025-10-07 04:33:43', NULL),
(864, 'edson.lipa', 'edson.lipa@upeu.edu.pe', '$2a$10$aaAEz1NlGBdssJ.jQ30yJeM8EySg3JFPEE7PBHpjPe674rwcEvaQS', 'INTEGRANTE', 1, '2025-10-07 04:33:43', '2025-10-07 04:33:43', NULL),
(865, 'kenyer.uturunco', 'kenyer.uturunco@upeu.edu.pe', '$2a$10$jxdX/F6TDTWJH1SaAi.fFeFyPorrqMGy.A6ubxxjYRmraCDkmBpKq', 'INTEGRANTE', 1, '2025-10-07 04:33:44', '2025-10-07 04:33:44', NULL),
(866, 'jhonatan.parra', 'jhonatan.parra@upeu.edu.pe', '$2a$10$oFBcftWAkugYSrLtBq1k1uD2wi3I8Sk/skxhRUvX/hcbupEaiWKkS', 'INTEGRANTE', 1, '2025-10-07 04:33:45', '2025-10-07 04:33:45', NULL),
(867, 'yack.condori', 'yack.condori@upeu.edu.pe', '$2a$10$g2gveMfri9AH2.XkWaqd0ewJZNQXxHmaEqCSAIemt.rccsJ/vNIJm', 'INTEGRANTE', 1, '2025-10-07 04:33:45', '2025-10-07 04:33:45', NULL),
(868, 'edilson.condori49', 'edilson.condori49@upeu.edu.pe', '$2a$10$kxoHnRi6cBuKfxHgL8vbbeF2ou9QoUI9LcHSFljljxQqjhXXxkMBW', 'INTEGRANTE', 1, '2025-10-07 04:33:46', '2025-10-07 04:33:46', NULL),
(869, 'ruth.banos', 'ruth.banos@upeu.edu.pe', '$2a$10$2dxBJxcChuJhPzxj4WJjyultp5cG8snTNnzMWuxBUOEMvxIHfjG02', 'INTEGRANTE', 1, '2025-10-07 04:33:46', '2025-10-07 04:33:46', NULL),
(870, 'jesus.coarite', 'jesus.coarite@upeu.edu.pe', '$2a$10$Ii.3.0d8I7ZP8vRK49dW1ufPSi.Vkx7hBz/Nujv9eR7.iUcfNxTU2', 'INTEGRANTE', 1, '2025-10-07 04:33:47', '2025-10-07 04:33:47', NULL),
(871, 'alexander.c.pelinco', 'alexander.c.pelinco@upeu.edu.pe', '$2a$10$njumFBX83jEQIDnczYEY/eK0r7tgOQ7aZMuWF/pRO0kOD9Vrjg7lO', 'INTEGRANTE', 1, '2025-10-07 04:33:47', '2025-10-07 04:33:47', NULL),
(872, 'joshep.apaza', 'joshep.apaza@upeu.edu.pe', '$2a$10$N77iXQ.BFhS/iPquR/kqgekuq9tKrU3Sk93oVQ4NSToBPR.niHuYK', 'INTEGRANTE', 1, '2025-10-07 04:33:48', '2025-10-07 04:33:48', NULL),
(873, 'wilson.huacasi', 'wilson.huacasi@upeu.edu.pe', '$2a$10$XYUkFhvmIKc6iTptUUiIS.FolstUe9JYxbLOr9eXmIh5T3WjoUjty', 'INTEGRANTE', 1, '2025-10-07 04:33:48', '2025-10-07 04:33:48', NULL),
(874, 'jhonatan.aparicio', 'jhonatan.aparicio@upeu.edu.pe', '$2a$10$v80RKXNkb3wKdRFue/M3S.p.vNdc6fNKjzx0kXBjTrrtnM2VwwVoW', 'INTEGRANTE', 1, '2025-10-07 04:33:49', '2025-10-07 04:33:49', NULL),
(875, 'jose.mamani70', 'jose.mamani70@upeu.edu.pe', '$2a$10$soPFTyYJv.NBx/vvtA4tgulUFOoON6g.WUb8tTTOz2TPo0NoJOoyO', 'INTEGRANTE', 1, '2025-10-07 04:33:49', '2025-10-07 04:33:49', NULL),
(876, 'josue.vilca', 'josue.vilca@upeu.edu.pe', '$2a$10$QufL0K0xTSojaulVRuZx4ORNaVetf5s.pvw6fQIyUrfJwpRv13J8W', 'INTEGRANTE', 1, '2025-10-07 04:33:50', '2025-10-07 04:33:50', NULL),
(877, 'flor.tapia', 'flor.tapia@upeu.edu.pe', '$2a$10$y/AXDaESb0kidNCir78i5OcBtblnIwJ9Nr3KNL44a4Io7AM97chVW', 'INTEGRANTE', 1, '2025-10-07 04:33:51', '2025-10-07 04:33:51', NULL),
(878, 'sebastian.condori', 'sebastian.condori@upeu.edu.pe', '$2a$10$z8618p47M2KsWHj.7PGN0.WlV.ubl4iFPMn92xhpfpvOgIiRYYknS', 'INTEGRANTE', 1, '2025-10-07 04:33:51', '2025-10-07 04:33:51', NULL),
(879, 'denisivan.apaza', 'denisivan.apaza@upeu.edu.pe', '$2a$10$hho5.CNz3MudH3G3210s9u0XHdTOuqwwk83v84n6WLnlmEn7rMjP.', 'INTEGRANTE', 1, '2025-10-07 04:33:52', '2025-10-07 04:33:52', NULL),
(880, 'cristhian.larico', '75396287@upeu.edu.pe', '$2a$10$woSuOfezjP5E7.A4Nch7xu799bk3MHnW3Qmos1GQO3N9FqyVTQR2u', 'INTEGRANTE', 1, '2025-10-07 04:33:52', '2025-10-07 04:33:52', NULL),
(881, 'kenji.m.quiza', 'kenji.m.quiza@upeu.edu.pe', '$2a$10$uL9l787kLi5JBByONGVuduBDEnuhUsvNnFHbJ0Z0kcUOPPWogVKd2', 'INTEGRANTE', 1, '2025-10-07 04:33:53', '2025-10-07 04:33:53', NULL),
(882, 'aaron.r.pari', 'aaron.r.pari@upeu.edu.pe', '$2a$10$HllfDmjPLk1wZW32ZD0mReTGcprG9Y9JKii.hA9rZkQWFR3Uz/QXq', 'INTEGRANTE', 1, '2025-10-07 04:33:53', '2025-10-07 04:33:53', NULL),
(883, 'deyvis.vargas', 'deyvis.vargas@upeu.edu.pe', '$2a$10$XMkjxfzqmXxHophBPfHRau53hGthuU6tiw5oHK1apFYYMGteB4idO', 'INTEGRANTE', 1, '2025-10-07 04:33:53', '2025-10-07 04:33:53', NULL),
(884, 'gean.h.mestas', 'gean.h.mestas@upeu.edu.pe', '$2a$10$57QvVwJzcRlMLpLTop5wR.CjuCt5B1SudONmMOcjwmB022PHuSLr2', 'INTEGRANTE', 1, '2025-10-07 04:33:54', '2025-10-07 04:33:54', NULL),
(885, 'williams.c.huaman', 'williams.c.huaman@upeu.edu.pe', '$2a$10$/N4vgKERMAZMwLg2z89v.eibwxBbzciKoROZcXMaVLeouXDhosk9u', 'INTEGRANTE', 1, '2025-10-07 04:33:54', '2025-10-07 04:33:54', NULL),
(886, 'kevin.condori37', 'kevin.condori37@upeu.edu.pe', '$2a$10$voObju3G1JFtejTfVNjO7OSezwWSxT6UYP7TKzFFMC2z2KusfcLxG', 'INTEGRANTE', 1, '2025-10-07 04:33:55', '2025-10-07 04:33:55', NULL),
(887, 'alexander.escobar', 'alexander.escobar@upeu.edu.pe', '$2a$10$jA4ixfvcO6wqTySkXg1MheCojsdHNzx57KubjiTJULECrApiNtXJG', 'INTEGRANTE', 1, '2025-10-07 04:33:55', '2025-10-07 04:33:55', NULL),
(888, 'jhon.mamani50', 'jhon.mamani50@upeu.edu.pe', '$2a$10$.h8qQT5SKH1NVPb2Xzrty.WvzSZuCnOm8BDqXQrggtuxsTvMhCIna', 'INTEGRANTE', 1, '2025-10-07 04:33:56', '2025-10-07 04:33:56', NULL),
(889, 'oscar.velarde', 'oscar.velarde@upeu.edu.pe', '$2a$10$wKbEh8SCJuhiGWTQqWVQUOtSRsI0C.e4oRYzkTQ85N.YjdqISQfZC', 'INTEGRANTE', 1, '2025-10-07 04:33:56', '2025-10-07 04:33:56', NULL),
(890, 'hadad.humpiri', 'hadad.humpiri@upeu.edu.pe', '$2a$10$CL1EVxm9Y6yQqr1zFzx0beW5sZIuGph.zWqAuhx/JaWpwFbQ7ja6.', 'INTEGRANTE', 1, '2025-10-07 04:33:57', '2025-10-07 04:33:57', NULL),
(891, 'erick.quispe43', 'erick.quispe43@upeu.edu.pe', '$2a$10$TZAujmvZP2kompnKO9hfF.36t1HIKfzNWAXlHPVCd79M32lXN7CYS', 'INTEGRANTE', 1, '2025-10-07 04:33:57', '2025-10-07 04:33:57', NULL),
(892, 'brandon.quispe45', 'brandon.quispe45@upeu.edu.pe', '$2a$10$iYTfABMKQz4eV6yMgb18/ebBV9ChTtY./qQdZOCI53JHFjmew2KJS', 'INTEGRANTE', 1, '2025-10-07 04:33:58', '2025-10-07 04:33:58', NULL),
(893, 'jharet.villanueva', 'jharet.villanueva@upeu.edu.pe', '$2a$10$X.PB5mdw1ep5.S7Z.OpJJOmWw.O6eAA8zMvRtz5z2cK1d1NKRQzly', 'INTEGRANTE', 1, '2025-10-07 04:33:58', '2025-10-07 04:33:58', NULL),
(894, 'rosy.yana', 'rosy.yana@upeu.edu.pe', '$2a$10$EraWK95jDzKurpu//AMWQu/rYeylTvZi3S51LhXjIjbr8ookttwr.', 'INTEGRANTE', 1, '2025-10-07 04:33:59', '2025-10-07 04:33:59', NULL),
(895, 'roy.quiroz', 'roy.quiroz@upeu.edu.pe', '$2a$10$RL1zJuOPw5ZY4i81QsHDWuVdzZoBuIVlQZgMoH5sGIdTYSGuT979O', 'INTEGRANTE', 1, '2025-10-07 04:33:59', '2025-10-07 04:33:59', NULL),
(896, 'anderson.cahuana', 'anderson.cahuana@upeu.edu.pe', '$2a$10$bfjVeTC2gh7jgv5aGFWKDe2/XYcsPAkSFqsbleEsG7meVmzQ/mU6u', 'INTEGRANTE', 1, '2025-10-07 04:34:00', '2025-10-07 04:34:00', NULL),
(897, 'will.fernandez', 'will.fernandez@upeu.edu.pe', '$2a$10$QwcEQdP1LJvlbXXpCmWHiexrc.9qAKGfJGA.ir/zRf8bws2iaOORm', 'INTEGRANTE', 1, '2025-10-07 04:34:00', '2025-10-07 04:34:00', NULL),
(898, 'piter.cruz', 'piter.cruz@upeu.edu.pe', '$2a$10$kkziePXSwNgptoEzEv1s3.XgNtOOicX0tVzbGNHSSmZWPcC5aOtmW', 'INTEGRANTE', 1, '2025-10-07 04:34:01', '2025-10-07 04:34:01', NULL),
(899, 'willyan.quenaya', 'willyan.quenaya@upeu.edu.pe', '$2a$10$j6H9E20xU4ih1VmaxtTD9u060N/eZSnFnKGTXXgUH7OmVLsUA.uMO', 'INTEGRANTE', 1, '2025-10-07 04:34:01', '2025-10-07 04:34:01', NULL),
(900, 'josue.miranda', 'josue.miranda@upeu.edu.pe', '$2a$10$uhHXVKrOs381YKcv7x5XCeDgxG2qyqZfor6xT2TDe0m6U5Gp2PLKC', 'INTEGRANTE', 1, '2025-10-07 04:34:02', '2025-10-07 04:34:02', NULL),
(901, 'jackie.mamani', 'jackie.mamani@upeu.edu.pe', '$2a$10$Hc7t.BA3ap7ahxBS5Xt1i.PaE4AWeuDyIvXIn/jGZju6qc2Khg6wi', 'INTEGRANTE', 1, '2025-10-07 04:34:02', '2025-10-07 04:34:02', NULL),
(902, 'nixon.hualla', 'nixon.hualla@upeu.edu.pe', '$2a$10$m0mvts399CMNzz/VPvgRFeCf12Endcmb/EstZBEcBRkDwlvQyyF0u', 'INTEGRANTE', 1, '2025-10-07 04:34:03', '2025-10-07 04:34:03', NULL),
(903, 'brayner.paredes', 'brayner.paredes@upeu.edu.pe', '$2a$10$vVVxnmQJU3zpp7u6uC9MhetfUQCeukQQHGJO2PeAJaTXro8ugeGBe', 'INTEGRANTE', 1, '2025-10-07 04:34:04', '2025-10-07 04:34:04', NULL),
(904, 'daniela.condor', 'daniela.condor@upeu.edu.pe', '$2a$10$.pMcfeF51WRfCSelzltXOegADcHQIosKUCcJkvlprjRJBPwaQ0IoC', 'INTEGRANTE', 1, '2025-10-07 04:34:04', '2025-10-07 04:34:04', NULL),
(905, 'adan.yana', 'adan.yana@upeu.edu.pe', '$2a$10$GzzkvFPghZs4ECfiwDOUoeVeAIiGv8lfjBbAqyzIrL/qjW0fKI9KS', 'INTEGRANTE', 1, '2025-10-07 04:34:05', '2025-10-07 04:34:05', NULL),
(906, 'yony.mamani', 'yonyalcon12345@gmail.com', '$2a$10$t9Xr0GIeWzYJ/vN9Zn1aM./skvyTg8czde79o1ttZPHou7QdU/NUC', 'INTEGRANTE', 1, '2025-10-07 04:34:05', '2025-10-07 04:34:05', NULL),
(907, '62728060', 'ademirtp12@gmail.com', '$2a$10$9cKCcTyEskTA1jYfGv59tOuTL42/QOzH1A2KL5NaGFTOYfjPvMjja', 'INTEGRANTE', 1, '2025-10-07 04:34:06', '2025-10-07 04:34:06', NULL),
(908, '60909452', '60909452@upeu.edu.pe', '$2a$10$ETrjV1GaGUXohkX3fifXCuM89aWrOzX2N7j4PK9n1ZtB.WpHNp3RK', 'INTEGRANTE', 1, '2025-10-07 04:34:06', '2025-10-07 04:34:06', NULL),
(909, '75506232', '75506232@upeu.edu.pe', '$2a$10$.2Mzu09l7ftMmmiNxHSELO.U8SdP0/oeszjp4rL8KQi5EQTEU5yNm', 'INTEGRANTE', 1, '2025-10-07 04:34:07', '2025-10-07 04:34:07', NULL),
(910, 'bernardo.benique', 'bernardo.benique@upeu.edu.pe', '$2a$10$cZGSd0hvJhakBwstSOu/NO3WG1/YvStVwtZoa2b7qaBKsA0vSTVja', 'INTEGRANTE', 1, '2025-10-07 04:34:07', '2025-10-07 04:34:07', NULL),
(911, 'wagner.chambi', 'wagner.chambi@upeu.edu.pe', '$2a$10$xFgrbTvyAVIJe/lI8YeWHOEy2F/2MAUK5fQ1/BWgggl57Q4/YIdEi', 'INTEGRANTE', 1, '2025-10-07 04:34:08', '2025-10-07 04:34:08', NULL),
(912, 'ronald.apaza.m', 'ronald.apaza.m@upeu.edu.pe', '$2a$10$lkLG4ZxiQXVeFk/UFeXFFO.Q.CydBgEMgHKgxcASmRFFzNmbYfTgS', 'INTEGRANTE', 1, '2025-10-07 04:34:08', '2025-10-07 04:34:08', NULL),
(913, 'nildwar.miroshi.tito', 'nildwar.miroshi.tito@upeu.edu.pe', '$2a$10$Gf4T.6aJTggWYRsaio5.HeK.ZnDLg/bGa6LcH9fF88z8LSp6tJOxm', 'INTEGRANTE', 1, '2025-10-07 04:34:09', '2025-10-07 04:34:09', NULL),
(914, 'vitzuel.m.alvarado', 'vitzuel.m.alvarado@upeu.edu.pe', '$2a$10$4WRoLhX8QlbxQhEbc7G9..l9pwA2r8uAtO4Ankwev3ly01HA5QRDG', 'INTEGRANTE', 1, '2025-10-07 04:34:09', '2025-10-07 04:34:09', NULL),
(915, 'ricky.m.adco', 'ricky.m.adco@upeu.edu.pe', '$2a$10$vVx3foB2FwZuwqGpygQMcOwPucwVIGH4LGPZeO7QJwY2iSPiVZPY.', 'INTEGRANTE', 1, '2025-10-07 04:34:10', '2025-10-07 04:34:10', NULL),
(916, 'juan.p.diaz', 'juan.p.diaz@upeu.edu.pe', '$2a$10$LsOfeAA0vYD/6PJ6NjaIk.mZska59eWBaTn1uQ6B3xo7LzVqDQCWK', 'INTEGRANTE', 1, '2025-10-07 04:34:10', '2025-10-07 04:34:10', NULL),
(917, 'merry.m.ali', 'merry.m.ali@upeu.edu.pe', '$2a$10$dLjk9X/xq0DEChRgD3ZUvealZjIjI1dXatN/ZgWVbfTE0WtRbjYiq', 'INTEGRANTE', 1, '2025-10-07 04:34:11', '2025-10-07 04:34:11', NULL),
(918, 'abner.q.apaza', 'abner.q.apaza@upeu.edu.pe', '$2a$10$UpydMYH6JR/GCeAHNx8bOeXpqLmNHs.VviBRP7WBTPHNumYMmMb66', 'INTEGRANTE', 1, '2025-10-07 04:34:11', '2025-10-07 04:34:11', NULL),
(919, 'benhy.c.cuba', 'benhy.c.cuba@upeu.edu.pe', '$2a$10$MBa/AVD0MBpbgAFBoQMtyuaTj0DLjJri5ZBG1dVINh6kdCaj.Ws.m', 'INTEGRANTE', 1, '2025-10-07 04:34:12', '2025-10-07 04:34:12', NULL),
(920, 'zidane.condori', 'zidane.condori@upeu.edu.pe', '$2a$10$tC8O6Y9xiFTFy6yc9vhtNuENsPcCtpXc0GU1dNzbz8MqykE.etQKy', 'INTEGRANTE', 1, '2025-10-07 04:34:12', '2025-10-07 04:34:12', NULL),
(921, 'piero.c.palomino', 'piero.c.palomino@upeu.edu.pe', '$2a$10$8ryYhvx7jKreGq/DSY/ohOY39/a3RsEiQ/1YPnRDw1CMzNenk.sgW', 'INTEGRANTE', 1, '2025-10-07 04:34:13', '2025-10-07 04:34:13', NULL),
(922, 'aron.m.quispe', 'aron.m.quispe@upeu.edu.pe', '$2a$10$d3Q.COyyRAsFFzFkF4FY3u1Fgyo52JZgDnw/sgItrwJgrsMtp5afu', 'INTEGRANTE', 1, '2025-10-07 04:34:13', '2025-10-07 04:34:13', NULL),
(923, 'nestor.h.pila', 'nestor.h.pila@upeu.edu.pe', '$2a$10$bAaNCAuhfk77P0auLTsDeem/t6MlNn0x3KoTV3cBPzWtgJp2qCD8O', 'INTEGRANTE', 1, '2025-10-07 04:34:14', '2025-10-07 04:34:14', NULL),
(924, 'cristian.ccanahuire', 'cristian.ccanahuire@upeu.edu.pe', '$2a$10$kUdzhN3Qfah1sgAKWDhH.exgVuzFu.y4xucEefgZeHOKP0i.sTDTO', 'INTEGRANTE', 1, '2025-10-07 04:34:14', '2025-10-07 04:34:14', NULL),
(925, 'christian.mamani16', 'christian.mamani16@upeu.edu.pe', '$2a$10$m0SXH44PjmgF3.3JZlA3VOKPGI4L/e6gyp6rtwajVENsEYqhkl/1a', 'INTEGRANTE', 1, '2025-10-07 04:34:15', '2025-10-07 04:34:15', NULL),
(926, 'joel.cerezo', 'joel.cerezo@upeu.edu.pe', '$2a$10$Y5vx2cXdLRvYBp/B3H8Uneu9FI37zNBYNqIn7HGGO/xffARCIZL1G', 'INTEGRANTE', 1, '2025-10-07 04:34:15', '2025-10-07 04:34:15', NULL),
(927, 'joel.garcia', 'joel.garcia@upeu.edu.pe', '$2a$10$X8Zj7h4tmBA72QLNOoXE4.PNuUP4z1b9pnXJKXy101lq7vNRiJuA2', 'INTEGRANTE', 1, '2025-10-07 04:34:16', '2025-10-07 04:34:16', NULL),
(928, 'diego.montesinos', 'diego.montesinos@upeu.edu.pe', '$2a$10$sfVN7d0AGJ.yVaUZq949jOxMZis2.NL7jdCruFEQmOQ7XoQzFCJG2', 'INTEGRANTE', 1, '2025-10-07 04:34:17', '2025-10-07 04:34:17', NULL),
(929, 'jimy.amanqui', 'jimy.amanqui@upeu.edu.pe', '$2a$10$Zfj6QtoY7LLatCu7MuxLB.5TNkq5f3P.wWuvgiBIyKgKXRdAOTZV.', 'INTEGRANTE', 1, '2025-10-07 04:34:17', '2025-10-07 04:34:17', NULL),
(930, 'pedro.loayza', 'pedro.loayza@upeu.edu.pe', '$2a$10$qFLSVjmzdTekmh91NN1aN.wBm8fdMMZoGDwM/vLInkf2XCIHgiFvO', 'INTEGRANTE', 1, '2025-10-07 04:34:17', '2025-10-07 04:34:17', NULL),
(931, 'rony.t.villanes', 'rony.t.villanes@upeu.edu.pe', '$2a$10$L9TwInEbOdaElBX1cVDsH.wY7P0R50fg8X63FVHN5cH77ro5eoZKi', 'INTEGRANTE', 1, '2025-10-07 04:34:17', '2025-10-07 04:34:17', NULL),
(932, 'indu.joel.mamani', 'indu.joel.mamani@upeu.edu.pe', '$2a$10$S0410Cf7Xkc1qdv90soxDe5wwihpRZEOPBE2BCN3Rq2M/zaiiFnW2', 'INTEGRANTE', 1, '2025-10-07 04:34:18', '2025-10-07 04:34:18', NULL),
(933, 'yampier.apaza', 'yampier.apaza@upeu.edu.pe', '$2a$10$HIYuh0bSFH9gsBICiC6vF.zL5yeXPHoHIdVO5EX5fh6YnKtWTfIG6', 'INTEGRANTE', 1, '2025-10-07 04:34:18', '2025-10-07 04:34:18', NULL),
(934, 'francisco.apaza', 'francisco.apaza@upeu.edu.pe', '$2a$10$i6Eh66GYFFyPXmOT7HnAEeM45B9NANbvsHQ4hXgsV89E.vr5fw9Sq', 'INTEGRANTE', 1, '2025-10-07 04:34:18', '2025-10-07 04:34:18', NULL),
(935, 'paul.cariapaza', 'paul.cariapaza@upeu.edu.pe', '$2a$10$d44gcM.RFw1vg5zEEqifKeCQp/WMxdMwXge4qGmGnB0jJFZqWkkbq', 'INTEGRANTE', 1, '2025-10-07 04:34:19', '2025-10-07 04:34:19', NULL),
(936, 'deyvis.larico', 'deyvis.larico@upeu.edu.pe', '$2a$10$wK9BRbSOhLXx6fK5s5ikdOGZ.iwaYA50n0aQxap8KDXIz1EcpHVG.', 'INTEGRANTE', 1, '2025-10-07 04:34:19', '2025-10-07 04:34:19', NULL),
(937, 'romel.chino', 'romel.chino@upeu.edu.pe', '$2a$10$KeKkm.vG5L7f13bIYsdg/OKd1/.6PwqvdzoLtMcnjk7OU3ePCsSde', 'INTEGRANTE', 1, '2025-10-07 04:34:19', '2025-10-07 04:34:19', NULL),
(938, 'isai.armuto', 'isai.armuto@upeu.edu.pe', '$2a$10$defIG6eQzfjbmhCxz.qz6uY1xpPXkBEMuHA2p0QyniPGCkqqCA0Eu', 'INTEGRANTE', 1, '2025-10-07 04:34:20', '2025-10-07 04:34:20', NULL),
(939, 'henrry.hancco', '0HenrryGamerYT@gmail.com', '$2a$10$F4vHO4RGeyrObI778El9sOufhAA838Wp39XSsdNiIBqsDge1b8rD2', 'INTEGRANTE', 1, '2025-10-07 04:34:20', '2025-10-07 04:34:20', NULL),
(940, 'maikol.quispe', 'sgihfffyljff@gmail.com', '$2a$10$Wm9GPolAp6ytK/BiZzyXW.yWNX6LRDDV04RNiMpO2I1U.J4Onl.S6', 'INTEGRANTE', 1, '2025-10-07 04:34:21', '2025-10-07 04:34:21', NULL),
(941, '73264878', '73264878@upeu.edu.pe', '$2a$10$dJAHqxOAIJ2ySdKGwMMaUuU55PqgfY4SmhjwSdRgZohrFr2IJBPWS', 'INTEGRANTE', 1, '2025-10-07 04:34:21', '2025-10-07 04:34:21', NULL),
(942, '76843712', '76843712@upeu.edu.pe', '$2a$10$jkayngyWhDDkrWDe9HO00./HCRGSDiCeIM386IOGpV9n6oRkbUpd.', 'INTEGRANTE', 1, '2025-10-07 04:34:22', '2025-10-07 04:34:22', NULL),
(943, 'michel.mamani.c', 'michel.mamani.c@upeu.edu.pe', '$2a$10$TlZRI74CqiblyEK99nHiQ.PSdMMtac9WiH/5Mn2fyazFygPeWpntW', 'INTEGRANTE', 1, '2025-10-07 04:34:22', '2025-10-07 04:34:22', NULL),
(944, 'yosmet.r.pomari', 'yosmet.r.pomari@upeu.edu.pe', '$2a$10$hDSZMfVgyru.JQYQBtsP6umH/wJkZsPXxazhSyR5rcWc3B0YCM9wK', 'INTEGRANTE', 1, '2025-10-07 04:34:23', '2025-10-07 04:34:23', NULL),
(945, 'leyton.a.chavez', 'leyton.a.chavez@upeu.edu.pe', '$2a$10$RgGOiOt8.ivtMsxZN.1bCeNJNTc1kABgjztgVtzdFUY4VuNdmysA.', 'INTEGRANTE', 1, '2025-10-07 04:34:23', '2025-10-07 04:34:23', NULL),
(946, 'jhon.p.yapu', 'jhon.p.yapu@upeu.edu.pe', '$2a$10$yjga6pPG5u.ePt7z3J8l8uAOUav/E/R2VLZhh4rl3zLo4xPYyfrIK', 'INTEGRANTE', 1, '2025-10-07 04:34:24', '2025-10-07 04:34:24', NULL),
(947, 'maykol.m.machaca', 'maykol.m.machaca@upeu.edu.pe', '$2a$10$iYDtIbVeOAEW5Mg3jsKx/.AZ30u5jzGk5PEMTptqMqrWKP5r6VMEu', 'INTEGRANTE', 1, '2025-10-07 04:34:24', '2025-10-07 04:34:24', NULL),
(948, 'eddy.h.taco', 'eddy.h.taco@upeu.edu.pe', '$2a$10$GDsqvBZO5.7uETp7znRlWObG0TEBhF9G4SLNr4r5eiJU9mETacypG', 'INTEGRANTE', 1, '2025-10-07 04:34:25', '2025-10-07 04:34:25', NULL),
(949, 'rodrigo.h.mamani', 'rodrigo.h.mamani@upeu.edu.pe', '$2a$10$BZxdbmqbrRr2.35mzTy7c.P0eKT9VMWNlDfi6m7O4Obi5yxUqCCra', 'INTEGRANTE', 1, '2025-10-07 04:34:25', '2025-10-07 04:34:25', NULL),
(950, 'deysi.c.mendoza', 'deysi.c.mendoza@upeu.edu.pe', '$2a$10$6tMlbdWAAYdRKuPIpNs1C.XaR00w5JEu8rU.OXXCZW4aCRIZLSqGS', 'INTEGRANTE', 1, '2025-10-07 04:34:26', '2025-10-07 04:34:26', NULL),
(951, 'juan.estrada', 'juan.estrada@upeu.edu.pe', '$2a$10$ba5mE9SYdlbiUwf7b1RJ0OWsXMaYya5Jh.oa3uck0H0xhZgUUNL8i', 'INTEGRANTE', 1, '2025-10-07 04:34:26', '2025-10-07 04:34:26', NULL),
(952, 'jeter.sucasaire', 'jeter.sucasaire@upeu.edu.pe', '$2a$10$Gh1oatWNhWL4gHTVdNK0UOGbyG9y3W5X.tKY60e7vkGdcqWBLqnmm', 'INTEGRANTE', 1, '2025-10-07 04:34:27', '2025-10-07 04:34:27', NULL),
(953, 'karen.apaza20', 'karen.apaza20@upeu.edu.pe', '$2a$10$8uY2YjOPFaFphtP.aVTd0OoSJxTjWQHDa7thOzRtB02QGU51WsZ8G', 'INTEGRANTE', 1, '2025-10-07 04:34:27', '2025-10-07 04:34:27', NULL),
(954, 'daniel.condori27', 'daniel.condori27@upeu.edu.pe', '$2a$10$FOHWRLVvscpsLfbktTSUVutRYgWSEE/ib6HOZphwuDO183ep1XLK6', 'INTEGRANTE', 1, '2025-10-07 04:34:28', '2025-10-07 04:34:28', NULL),
(955, 'piero.p.apaza', 'piero.p.apaza@upeu.edu.pe', '$2a$10$3POhL8juTN/YEI74.3fF2ew0v3OwX3ogsvjIOCMukMgITmM10zYLu', 'INTEGRANTE', 1, '2025-10-07 04:34:28', '2025-10-07 04:34:28', NULL),
(956, 'adrian.s.rodriguez', 'adrian.s.rodriguez@upeu.edu.pe', '$2a$10$LB9n4PyKV8lnWMF2BpZk9OjKBSocMK4J28IXCuCtZbRKr7ZFlztbW', 'INTEGRANTE', 1, '2025-10-07 04:34:29', '2025-10-07 04:34:29', NULL),
(957, 'anthony.c.sucapuca', 'anthony.c.sucapuca@upeu.edu.pe', '$2a$10$SrmCNC5RDINGRCH8MnI6QOtAJ97OSxkGnpOxCIbcXKCiEc5XhCY8u', 'INTEGRANTE', 1, '2025-10-07 04:34:29', '2025-10-07 04:34:29', NULL),
(958, 'zaggi.m.auquipata', 'zaggi.m.auquipata@upeu.edu.pe', '$2a$10$SI9J4/JQDrfTWgLKd3ZuCe6hVMdNoUVtJ0zU.nZfaSq/JBu.UMpaa', 'INTEGRANTE', 1, '2025-10-07 04:34:29', '2025-10-07 04:34:29', NULL),
(959, 'deysi.mamani21', 'deysi.mamani21@upeu.edu.pe', '$2a$10$HqYD0uI0LkY0cBPmtwVhL.pEOuew4riztaiTgQFZpL2LFzoppgBa6', 'INTEGRANTE', 1, '2025-10-07 04:34:30', '2025-10-07 04:34:30', NULL),
(960, 'edwin.c.choquehuanca', 'edwin.c.choquehuanca@upeu.edu.pe', '$2a$10$Ey9tDx8YjumnNRUKSU0Hb.GFpnzkZjQUAtJpnmwcHhjkyeBvdUDpW', 'INTEGRANTE', 1, '2025-10-07 04:34:30', '2025-10-07 04:34:30', NULL),
(961, 'axcel.vargas', 'axcel.vargas@upeu.edu.pe', '$2a$10$XSqN6rSdj.gURpQJ9UvKr./1rDm4DeLhhDsPM8SlUiMXyJHvz0hQq', 'INTEGRANTE', 1, '2025-10-07 04:34:30', '2025-10-07 04:34:30', NULL),
(962, 'elvis.condori34', 'elvis.condori34@upeu.edu.pe', '$2a$10$A4bPspWL06SlSEVeZFI0feypjwKCyPl8LdpBNWcrkOtLde2nEqlCe', 'INTEGRANTE', 1, '2025-10-07 04:34:31', '2025-10-07 04:34:31', NULL),
(963, 'stalim.c.cutisaca', 'stalim.c.cutisaca@upeu.edu.pe', '$2a$10$RvOBR7cWvWjlAFtWRSUDiexFKN1YZwt4ncHKlFUu3KNS7ALd9Z9J.', 'INTEGRANTE', 1, '2025-10-07 04:34:31', '2025-10-07 04:34:31', NULL),
(964, 'wiliam.c.mamani', 'wiliam.c.mamani@upeu.edu.pe', '$2a$10$sZRn/T.ubu4eMPJ6WRGVDOpKS6cv/ywh.OX.ugBEB.zUO9kdaSSiK', 'INTEGRANTE', 1, '2025-10-07 04:34:32', '2025-10-07 04:34:32', NULL),
(965, 'andeerson.mamani', 'andeerson.mamani@upeu.edu.pe', '$2a$10$lHPVXXBVltryQ9yDvwzy/elseCtACUbQs1coY4x/WQpCUxOjnE7Sm', 'INTEGRANTE', 1, '2025-10-07 04:34:32', '2025-10-07 04:34:32', NULL),
(966, 'hernan.condori', 'hernan.condori@upeu.edu.pe', '$2a$10$FhiGtHWbOpnPa1FBUk90ceADVcU./72XuUdHSjO.hMxRxwCSVEtBS', 'INTEGRANTE', 1, '2025-10-07 04:34:33', '2025-10-07 04:34:33', NULL),
(967, 'melani.hancco', 'melani.hancco@upeu.edu.pe', '$2a$10$ij358Bq9Lp2QBkgqayBKOO9TKsNfMXK6qXeO3TEvJ2ZNxrIvdlZoG', 'INTEGRANTE', 1, '2025-10-07 04:34:33', '2025-10-07 04:34:33', NULL),
(968, 'romulo.yerba', 'romulo.yerba@upeu.edu.pe', '$2a$10$w8FDFjWaysArFKl1s.IWieI4BBNF1OYaLY88bfhG97.39irzhAqUy', 'INTEGRANTE', 1, '2025-10-07 04:34:34', '2025-10-07 04:34:34', NULL),
(969, 'jose.ccosi', 'jose.ccosi@upeu.edu.pe', '$2a$10$J7/MvVSIkp0I5BgIS78pd.PFobrQJuywY5QZDWkw6NWLjbCrW0x1y', 'INTEGRANTE', 1, '2025-10-07 04:34:34', '2025-10-07 04:34:34', NULL),
(970, 'chistian.laura', 'chistian.laura@upeu.edu.pe', '$2a$10$/R4dP2PDCKmzgt.jOPGDvebVJ5Zby10SDzv9gO0n0eVu4dpthpsxm', 'INTEGRANTE', 1, '2025-10-07 04:34:34', '2025-10-07 04:34:34', NULL),
(971, 'nestor.barrantes', 'nestorbarrantes98@gmail.com', '$2a$10$OhabhT.759QbYCG7m8/dCeCX8V.qaVSiI5FMDcOeLLrnSP640Qi/a', 'INTEGRANTE', 1, '2025-10-07 04:34:35', '2025-10-07 04:34:35', NULL),
(972, 'meinly.mamani', 'maxcarrizales7@gmail.com', '$2a$10$S8ZMC9S0UMVFX3ufJDceNuyYoT1vpPJYFJD68LwuMupjCKvQSy0zu', 'INTEGRANTE', 1, '2025-10-07 04:34:35', '2025-10-07 04:34:35', NULL),
(973, 'gabriel.mamani.c', 'condoreyna18@gmail.com', '$2a$10$0jqFRQEalk9FnMtmuyPuD.OtN0aWnpTDh3ySNLSWRKXzsVNgJGqUK', 'INTEGRANTE', 1, '2025-10-07 04:34:36', '2025-10-07 04:34:36', NULL),
(974, 'jack.aldama', '60568081@upeu.edu.pe', '$2a$10$PmXxYp/ifRWQleBmVpcxfeRf6F4tLycbyvD6dffy7Y0NuoCuy0gIK', 'INTEGRANTE', 1, '2025-10-07 04:34:36', '2025-10-07 04:34:36', NULL),
(975, 'jusephy.mamani', 'jusephymjaila@gmail.com', '$2a$10$.0IRtMbJTR0gxSST.YiWGeHDwFSKuk0H6284ZQQDUxs6POh7vvuTO', 'INTEGRANTE', 1, '2025-10-07 04:34:37', '2025-10-07 04:34:37', NULL),
(976, 'juan.luque', 'juan.luque@upeu.edu.pe', '$2a$10$vgnQLZUp9HvBvaBW0gBb2u1pM/Fu2X4BoqiQoU1MDAbiDhES1xf2i', 'INTEGRANTE', 1, '2025-10-07 04:34:37', '2025-10-07 04:34:37', NULL),
(977, 'helio.f.calisaya', 'helio.f.calisaya@upeu.edu.pe', '$2a$10$H6xvppkd1Pyf1z7xd8b7C.hu96Up6qgjDJJ65H8GpHsHBEmYVRDgm', 'INTEGRANTE', 1, '2025-10-07 04:34:38', '2025-10-07 04:34:38', NULL),
(978, 'eber.c.flores', 'eber.c.flores@upeu.edu.pe', '$2a$10$NxeFqgG5AQvBcrG/F7HlS.sFhdIsiY0FBkde8tuQou8Khbh1zVxYm', 'INTEGRANTE', 1, '2025-10-07 04:34:38', '2025-10-07 04:34:38', NULL),
(979, 'ronald.s.saya', 'ronald.s.saya@upeu.edu.pe', '$2a$10$GMCbVW7tEMw9NlEZgpCvleUbpbQLpBy7uQpuyImTFQH3jSEzcHC9e', 'INTEGRANTE', 1, '2025-10-07 04:34:39', '2025-10-07 04:34:39', NULL),
(980, 'vladimir.a.hilaita', 'vladimir.a.hilaita@upeu.edu.pe', '$2a$10$E9g.MfGZT9.uX0HmH.l9AeFkC4re6avZursMUkcFPczSz7aqrLMFS', 'INTEGRANTE', 1, '2025-10-07 04:34:39', '2025-10-07 04:34:39', NULL),
(981, '75494157', '75494157@upeu.edu.pe', '$2a$10$adbbqq74/uYCuP0obngQOufylAAepdxlJRslgeiCg/TuGC/QitK1G', 'INTEGRANTE', 1, '2025-10-07 04:34:40', '2025-10-07 04:34:40', NULL),
(982, 'deyvis.n.chuctaya', 'deyvis.n.chuctaya@upeu.edu.pe', '$2a$10$ITIJAYuCNkJ8Og7W5ALXFefhSGoN.CF0NHVWqzFz.bZ1U0aBgnk/S', 'INTEGRANTE', 1, '2025-10-07 04:34:40', '2025-10-07 04:34:40', NULL),
(983, 'jackson.h.callohuanca', 'jackson.h.callohuanca@upeu.edu.pe', '$2a$10$KStZ/ErZmANFm9/fCn8GD.L/4n2mQwCQMeqkYdehyepZJmktHzojS', 'INTEGRANTE', 1, '2025-10-07 04:34:41', '2025-10-07 04:34:41', NULL),
(984, 'jeandery.q.venegas', 'jeandery.q.venegas@upeu.edu.pe', '$2a$10$OWb3norI014WGfy3BqtGn.6dx6.nLq8X4tNoBitqps6qERbAoZJbG', 'INTEGRANTE', 1, '2025-10-07 04:34:41', '2025-10-07 04:34:41', NULL),
(985, 'victor.m.sanca', 'victor.m.sanca@upeu.edu.pe', '$2a$10$Mui7BQ9YFCYxsFu1bDmO4uvlwihL.f7gGPo0sXFjgFiZVYzp0acC.', 'INTEGRANTE', 1, '2025-10-07 04:34:42', '2025-10-07 04:34:42', NULL),
(986, 'andree.ccalla', 'destroyer1025b@gmail.com', '$2a$10$YlsQ2gZbpLtWTCvMevNqRukYqnejsb0sFzTygmQu6cVNMLoVQMA6W', 'INTEGRANTE', 1, '2025-10-07 04:34:42', '2025-10-07 04:34:42', NULL),
(987, 'edwin.b.mamani', 'edwin.b.mamani@upeu.edu.pe', '$2a$10$XnPa1gIfZFu3bGXKHIOioOjDct4rUjp.5i8Xzd0RenrLBDaP8sGaC', 'INTEGRANTE', 1, '2025-10-07 04:34:43', '2025-10-07 04:34:43', NULL),
(988, 'junior.hancco', 'juniorhancco24@gmail.com', '$2a$10$AfWusIVdYJ3Oi765WH6Mpurk3QnN1YLEoSSbK8w8Odeq1GV6nbQUy', 'INTEGRANTE', 1, '2025-10-07 04:34:43', '2025-10-07 04:34:43', NULL),
(989, 'josefth.v.naca', 'josefth.v.naca@upeu.edu.pe', '$2a$10$0sPDrEjQgYkSs.xZk3U9ROg8Q5sYVHMYV6702Z/S4TxAE4m3boZKu', 'INTEGRANTE', 1, '2025-10-07 04:34:44', '2025-10-07 04:34:44', NULL),
(990, 'andre.s.totocayo', 'andre.s.totocayo@upeu.edu.pe', '$2a$10$cZwWZXTWIC8hrNaGPYQ/muKRZjBmuAz2JKDCTiN3YGwUQ60exxHWu', 'INTEGRANTE', 1, '2025-10-07 04:34:44', '2025-10-07 04:34:44', NULL),
(991, 'deyvis.ticona23', 'deyvis.ticona23@upeu.edu.pe', '$2a$10$mfyYlgq3xEBPBm1U4zGBXerClhAZmHjUI/eIyhj9efR.lhmyCUsBS', 'INTEGRANTE', 1, '2025-10-07 04:34:45', '2025-10-07 04:34:45', NULL),
(992, 'francois.condori', 'francois.condori@upeu.edu.pe', '$2a$10$7j.uNKo8gCcOKGZbU7R/R.rCBOCzUdciAX8XDgI34H1NDTzTgFipS', 'INTEGRANTE', 1, '2025-10-07 04:34:45', '2025-10-07 04:34:45', NULL),
(993, 'ronaldo.tola', 'ronaldo.tola@upeu.edu.pe', '$2a$10$wO9EY10rKf4lBbNx6nvdHegZhKKBkTI7/t..TwCa//.O9xqocbeU6', 'INTEGRANTE', 1, '2025-10-07 04:34:46', '2025-10-07 04:34:46', NULL),
(994, 'diego.zaga', 'diego.zaga@upeu.edu.pe', '$2a$10$vxklMpln5rHXhZ4hMrfKM.FrFcXuHgatFruUQAeZK9x9hbHbueX8y', 'INTEGRANTE', 1, '2025-10-07 04:34:46', '2025-10-07 04:34:46', NULL),
(995, 'maricielo.r.yucra', 'maricielo.r.yucra@upeu.edu.pe', '$2a$10$oolLWSzPoBm18gcvLjcnuOJXlZ2D85v4dSL0fPKRf86Qy67GHp0si', 'INTEGRANTE', 1, '2025-10-07 04:34:47', '2025-10-07 04:34:47', NULL),
(996, 'yojaida.p.chavez', 'yojaida.p.chavez@upeu.edu.pe', '$2a$10$m3cwf23qQwV7q1agiRRMz.I184TFfPC1VOxj3OgDYcp3/Q8aAsXTC', 'INTEGRANTE', 1, '2025-10-07 04:34:47', '2025-10-07 04:34:47', NULL),
(997, 'jose.aroapaza', 'jose.aroapaza@upeu.edu.pe', '$2a$10$E49EA0HzlmxvnnnZDG73iekBXO26VbOHmN8Efjg1dtqgybwLeaJY.', 'INTEGRANTE', 1, '2025-10-07 04:34:48', '2025-10-07 04:34:48', NULL),
(998, 'micayla.ccasani', 'micayla.ccasani@upeu.edu.pe', '$2a$10$i0/1HJYhLzBoY41MrFDLrurIyk6Sqik/IlmwuW.Ib4cq0C9JMkqVC', 'INTEGRANTE', 1, '2025-10-07 04:34:48', '2025-10-07 04:34:48', NULL),
(999, 'eloy.mamani32', 'eloy.mamani32@upeu.edu.pe', '$2a$10$rwuP6SgAAY/lvDOrvJqoj./MUr7MtFfA4oe9uut8a9y8hxoMEFKl6', 'INTEGRANTE', 1, '2025-10-07 04:34:49', '2025-10-07 04:34:49', NULL),
(1000, 'erick.ruelas', 'erick.ruelas@upeu.edu.pe', '$2a$10$m/n9aSyYxsjCrZRl12LNz.4rZ89tonff3J2LZcjOQ2bF00Wv5kQNi', 'INTEGRANTE', 1, '2025-10-07 04:34:49', '2025-10-07 04:34:49', NULL),
(1001, 'briyith.monzon', 'briyith.monzon@upeu.edu.pe', '$2a$10$ZMD2P61Iv6lwzPJuu1HHX.FBpDQUKeK7bNRDXFTGcp/8JKkO9cBba', 'INTEGRANTE', 1, '2025-10-07 04:34:50', '2025-10-07 04:34:50', NULL),
(1002, 'kevin.ojeda', 'kevin.ojeda@upeu.edu.pe', '$2a$10$Aa/9PW.4VGNjQWLubOaL8uUdUdtvsWppT24NQLnzgU2Tth3eCjC.S', 'INTEGRANTE', 1, '2025-10-07 04:34:50', '2025-10-07 04:34:50', NULL),
(1003, 'isaac.apaza.a', 'isaac.apaza.a@upeu.edu.pe', '$2a$10$1txyURwQcy8UOclM6im.rOYhGTeTtqhjJuVd9hTYDmvYZi6asqBze', 'INTEGRANTE', 1, '2025-10-07 04:34:50', '2025-10-07 04:34:50', NULL),
(1004, 'igarlos.mamani', 'igr.ruben@gmail.com', '$2a$10$T0DezkKLDI.QTqNsniIFi.TllAAkKonyE7q2std6pZqN3JlMEQkHi', 'INTEGRANTE', 1, '2025-10-07 04:34:50', '2025-10-07 04:34:50', NULL),
(1005, 'frank.pari', 'frankabado123@gmail.com', '$2a$10$RB6CB.Sza9xRf79CRcEHmONeZ6QPVLyWNppSgRn.XXs9yJF9hKlGi', 'INTEGRANTE', 1, '2025-10-07 04:34:51', '2025-10-07 04:34:51', NULL),
(1006, '71935656', '71935656@upeu.edu.pe', '$2a$10$7gQS2xCogmkQaK.n4vKVieX2TuIzdC372.yzDl9SFyg3832NpK7ZG', 'INTEGRANTE', 1, '2025-10-07 04:34:51', '2025-10-07 04:34:51', NULL),
(1007, '75851268', '75851268@upeu.edu.pe', '$2a$10$hk61WN8r84txMvs5BokFW.2MV5QtYWjoIcaCKpYtRR0pZJaZPQVZa', 'INTEGRANTE', 1, '2025-10-07 04:34:51', '2025-10-07 04:34:51', NULL),
(1008, '60305325', '60305325@upeu.edu.pe', '$2a$10$tbSRSjxCl4q4RESLtYmLdufyIXudgCztCYujybUKgylTd8b1D/2Z6', 'INTEGRANTE', 1, '2025-10-07 04:34:52', '2025-10-07 04:34:52', NULL),
(1009, '60909683', '60909683@upeu.edu.pe', '$2a$10$3AHJFkkPRS/GgpSiVk/hN.ViAp4kYtS/J6PWDgTwfotAS3MP/jIOe', 'INTEGRANTE', 1, '2025-10-07 04:34:52', '2025-10-07 04:34:52', NULL),
(1010, '60208022', '60208022@upeu.edu.pe', '$2a$10$rR2gO.YPFieh0uoaNO6bbebA61hgHToqAFC9dyRDcJ9zaw1ZBkuuG', 'INTEGRANTE', 1, '2025-10-07 04:34:52', '2025-10-07 04:34:52', NULL),
(1011, '60181293', '60181293@upeu.edu.pe', '$2a$10$xe0Msju4Ib0BRDHnO4mkPeEREdpV4ORiMOJvRWKEKxEWSe75SVhNi', 'INTEGRANTE', 1, '2025-10-07 04:34:53', '2025-10-07 04:34:53', NULL),
(1012, 'abel.berrios', 'abelyeins123@gmail.com', '$2a$10$FCEquSUENNLiHteCAKaoPO057mgjX8Oa7OyksOvUnyeb1qZQmEaoC', 'INTEGRANTE', 1, '2025-10-07 04:34:53', '2025-10-07 04:34:53', NULL),
(1013, 'del.carmen.perez', 'del.carmen.perez@upeu.edu.pe', '$2a$10$ZWbuERGd0oItlqbMP.i8h.xN7kes.32wDGVUYej1EmDg8i.YJ2edm', 'INTEGRANTE', 1, '2025-10-07 04:34:54', '2025-10-07 04:34:54', NULL),
(1014, 'deissy.quispe', 'deissy.quispe@upeu.edu.pe', '$2a$10$oxa9bpKCKGlCKwgmjyw7U.PYSE5nCRocoGqQEty49LLpIP/h46Vuq', 'INTEGRANTE', 1, '2025-10-07 04:34:54', '2025-10-07 04:34:54', NULL),
(1015, 'jose.quispe.b', 'jose.quispe.b@upeu.edu.pe', '$2a$10$FavRzeNvKIxGOJL0Kkj7UepzuRhmQGOnWXYiz1XPdh/VlkouzE5NK', 'INTEGRANTE', 1, '2025-10-07 04:34:55', '2025-10-07 04:34:55', NULL),
(1016, 'gabriel.rojas.v', 'gabrielrojasvergara14@gmail.com', '$2a$10$WuYWrcWKExaiTgTXoCFCZuEwIXd1iqm4HPWJGBNE2Dgsla0M46yVi', 'INTEGRANTE', 1, '2025-10-07 04:34:55', '2025-10-07 04:34:55', NULL),
(1017, 'daniel.quispe.t', 'daniel.quispe.t@upeu.edu.pe', '$2a$10$zWAYNp2vW1WRqlAVr1lkvuKtlSk9twbo3XvsC3ccMELfo/1A9A3Qm', 'INTEGRANTE', 1, '2025-10-07 04:34:55', '2025-10-07 04:34:55', NULL),
(1018, 'aldo.c.ticona', 'aldo.c.ticona@upeu.edu.pe', '$2a$10$gOqO40WsqIyNJxnkZogupOGG/eXgGeyl5U8kl8DUoJGLOhOzO1Plm', 'INTEGRANTE', 1, '2025-10-07 04:34:56', '2025-10-07 04:34:56', NULL),
(1019, 'andre.b.lizarraga', 'andre.b.lizarraga@upeu.edu.pe', '$2a$10$Sti/zgt6LAEIFJoehYpu3ueCnODpZR03lV6jJwwI3WyR/RSwbRcLK', 'INTEGRANTE', 1, '2025-10-07 04:34:56', '2025-10-07 04:34:56', NULL),
(1020, 'yesmi.y.tolentino', 'yesmi.y.tolentino@upeu.edu.pe', '$2a$10$5E.xjYBtP.nO/bdWhDLtcuouRhhNTTsIKrjjKKbvzKUOfXhDY0NfO', 'INTEGRANTE', 1, '2025-10-07 04:34:57', '2025-10-07 04:34:57', NULL),
(1021, 'joaquin.s.saravia', 'joaquin.s.saravia@upeu.edu.pe', '$2a$10$wGVSiuVyh7W3MFedhknIRuatsrHC87bgGmCxZ/Mihs7uXlsZkpG8S', 'INTEGRANTE', 1, '2025-10-07 04:34:57', '2025-10-07 04:34:57', NULL),
(1022, 'johan.i.alvarez', 'johan.i.alvarez@upeu.edu.pe', '$2a$10$.0OtkdbqLN7vitPKbe184OCI18TkL9r5bVxDoXeTImbc4w2kFWZBe', 'INTEGRANTE', 1, '2025-10-07 04:34:58', '2025-10-07 04:34:58', NULL),
(1023, 'anghelo.t.arias', 'anghelo.t.arias@upeu.edu.pe', '$2a$10$tOj3Z0mEkjdCUf0ADafz4e5wLcgYDdrlUDqzacT8xZxxq8hMxWRae', 'INTEGRANTE', 1, '2025-10-07 04:34:58', '2025-10-07 04:34:58', NULL),
(1024, 'edgar.cabana', 'edgar.cabana@upeu.edu.pe', '$2a$10$snMN6SmA0fBT5SNJuhFm0.nFmMzsBehrT0R6xGzOk3gplBpbsrsLK', 'INTEGRANTE', 1, '2025-10-07 04:34:59', '2025-10-07 04:34:59', NULL),
(1025, 'kengui.c.mamani', 'kengui.c.mamani@upeu.edu.pe', '$2a$10$D87pjJ38R8c4nOir0Q0ljOdNLy1z87LUF7.EapYR0sLz7MjdugXZS', 'INTEGRANTE', 1, '2025-10-07 04:34:59', '2025-10-07 04:34:59', NULL),
(1026, 'anthony.r.rupa', 'anthony.r.rupa@upeu.edu.pe', '$2a$10$pdv/st9tBH3bhcbifVUWmOu.r3wnw06DOqKqJQBQCE/O2wT3cPYz.', 'INTEGRANTE', 1, '2025-10-07 04:35:00', '2025-10-07 04:35:00', NULL),
(1027, 'angel.vilca.l', 'angel.vilca.l@upeu.edu.pe', '$2a$10$Im/6KI0K9Q59/.CbjT8G1Owo3h0ld9WraOe0mQmMc7xFTBiXDA8EC', 'INTEGRANTE', 1, '2025-10-07 04:35:00', '2025-10-07 04:35:00', NULL),
(1028, 'nelson.larico', 'nelson.larico@upeu.edu.pe', '$2a$10$h7lOb7DTSk7jql2N5rrhUeXM9JIfWkNJgTOP1kl1nA.0ObPS19Vim', 'INTEGRANTE', 1, '2025-10-07 04:35:01', '2025-10-07 04:35:01', NULL),
(1029, 'jhosepmir.c.velarde', 'jhosepmir.c.velarde@upeu.edu.pe', '$2a$10$5CDxBVJeeQDYdDdEEC33IeyIRbGSQC3G3dR0fi5RDA4NjWLZUSlQi', 'INTEGRANTE', 1, '2025-10-07 04:35:01', '2025-10-07 04:35:01', NULL),
(1030, 'iosef.chata', 'IMMA210809@GMAIL.COM', '$2a$10$v4FdUZ.VRWIrKf3lFwzcq.atG5vwB3OhGtFmXYPld5S24YWcySJRu', 'INTEGRANTE', 1, '2025-10-07 04:35:02', '2025-10-07 04:35:02', NULL),
(1031, 'sharnol.llavilla', 'sharnolbetancur@gmail.com', '$2a$10$DbhQS11hxhmu6I5Oybu9suhtGXe3C7SEMKKpbN0KNYvr1lL6Eh34K', 'INTEGRANTE', 1, '2025-10-07 04:35:02', '2025-10-07 04:35:02', NULL),
(1032, 'david.machaca', 'brayanmachaca345@gmail.com', '$2a$10$6VuiDsa/sW3ewO2OXnARJurwYlmhlflpTDNEW1mT.lGfkys.xshzO', 'INTEGRANTE', 1, '2025-10-07 04:35:03', '2025-10-07 04:35:03', NULL),
(1033, 'yobel.machaca', 'yobel.machaca@upeu.edu.pe', '$2a$10$V5BsUWbr6NPE.GsPXfC5JOjRbkiNioK4cpN6tlYS/RsF0x2KAbEFK', 'INTEGRANTE', 1, '2025-10-07 04:35:03', '2025-10-07 04:35:03', NULL),
(1034, 'anthonny.calla', 'anthonny.calla@upeu.edu.pe', '$2a$10$XKMttHV6Bm2hUxMsVGvyP.jNVLCtZwRBHlusdlBtuUE.9AHOqXhHy', 'INTEGRANTE', 1, '2025-10-07 04:35:04', '2025-10-07 04:35:04', NULL),
(1035, '77534213', '77534213@upeu.edu.pe', '$2a$10$yxWJfkUJFCKlKSw0YLUXDuELVpzCFD0nKIKmzvifpIG9uQUS3TCyu', 'INTEGRANTE', 1, '2025-10-07 04:35:04', '2025-10-07 04:35:04', NULL),
(1036, '74214342', 'juangabrielricondo9@gmail.com', '$2a$10$N5GNHW8oy4kRoyb0KzT5vuziRsJ84zgqCeU5G.7ZNFETOjCLluVre', 'INTEGRANTE', 1, '2025-10-07 04:35:05', '2025-10-07 04:35:05', NULL),
(1037, '77470875', '77470875@upeu.edu.pe', '$2a$10$ggJeFKik7QWGxJyM2nVOd.n.LPv5Z311Bg5VSEzM6GqJbtha7xtKC', 'INTEGRANTE', 1, '2025-10-07 04:35:05', '2025-10-07 04:35:05', NULL),
(1038, 'edison.paye', 'edisonjmina@gmail.com', '$2a$10$eqAAr.wQAjphoVMyg46TG.1dCnhZkxm4GbhxLle3LFmahEEDoJhjW', 'INTEGRANTE', 1, '2025-10-07 04:35:06', '2025-10-07 04:35:06', NULL),
(1039, 'oscar.roque', '60909650@upeu.edu.pe', '$2a$10$IgCIvhPUTiwNxbU5QKXtQeOJVNR2YP9wrMmFaprU3/493S7kGX5vq', 'INTEGRANTE', 1, '2025-10-07 04:35:06', '2025-10-07 04:35:06', NULL),
(1040, 'paul.cayo', 'yeny@gmail.com', '$2a$10$ivKLuTdd2SxK7WW.eaM/HudPt8vNmvnwH7PzOai33KV6aaYpSPLEe', 'INTEGRANTE', 1, '2025-10-07 04:35:07', '2025-10-07 04:35:07', NULL),
(1041, 'alonso.mamani.s', '75218456@upeu.edu.pe', '$2a$10$anvUiwOxS35PTPtUqWwFguQCLTHlDFBzxo5rUugYjPeFeikD4zJlG', 'INTEGRANTE', 1, '2025-10-07 04:35:08', '2025-10-07 04:35:08', NULL),
(1042, 'cesar.larico', '75431377@upeu.edu.pe', '$2a$10$74G6cQPi2GGlmvVBHRRqWOIRdLnhpuxBTE9VSjwu4WCs1W2jdLPFi', 'INTEGRANTE', 1, '2025-10-07 04:35:08', '2025-10-07 04:35:08', NULL),
(1043, 'diego.chambilla', '60180319@upeu.edu.pe', '$2a$10$m7rAFnmiyZMmgQVtpEzlBeN6HUqogMpW7HTZzjFuPGesGpoR.P2Am', 'INTEGRANTE', 1, '2025-10-07 04:35:09', '2025-10-07 04:35:09', NULL),
(1044, 'herson.villca', '71313518@upeu.edu.pe', '$2a$10$1YhlmO3jZi5/U5sz8y/8yunu/2Xe7aD4F0K8DaPqeubDrsJHdn30a', 'INTEGRANTE', 1, '2025-10-07 04:35:09', '2025-10-07 04:35:09', NULL),
(1045, '75514453', '75514453@upeu.edu.pe', '$2a$10$v93u9mYGqxX2JrjnAM2goeoIZ8H6.gZQqCCosGTEG1Uwz7Oz1rnrm', 'INTEGRANTE', 1, '2025-10-07 04:35:10', '2025-10-07 04:35:10', NULL),
(1046, 'omar.larico', 'omar.larico@upeu.edu.pe', '$2a$10$kzIOvco6nrSuwSqVvemIm.ZrhFLYMThNNTRic0rU5VxuuYE32/FGC', 'INTEGRANTE', 1, '2025-10-07 04:35:10', '2025-10-07 04:35:10', NULL),
(1047, 'fabricio.mestas', 'fabricio.mestas@upeu.edu.pe', '$2a$10$P2xsAhUVXo5sacSKRQg0k./EBlh4mjB09WTKmyIoPOzmJ86w9jLRO', 'INTEGRANTE', 1, '2025-10-07 04:35:11', '2025-10-07 04:35:11', NULL),
(1048, 'hermes.c.chambilla', 'hermes.c.chambilla@upeu.edu.pe', '$2a$10$WmfGrr54Yp4XmDI7YgbavuHnirrqFA6iVZnKAQrhZ2xG9Sl27sZZe', 'INTEGRANTE', 1, '2025-10-07 04:35:11', '2025-10-07 04:35:11', NULL),
(1049, 'william.chura', 'william.chura@upeu.edu.pe', '$2a$10$yh81UP0rUV2FzC5Kux9vO.XLoTYrNktSod.vaGSbACGqEe1XD4Oju', 'INTEGRANTE', 1, '2025-10-07 04:35:12', '2025-10-07 04:35:12', NULL),
(1050, 'brayan.e.inofuentes', 'brayan.e.inofuentes@upeu.edu.pe', '$2a$10$qwwRAfNPtJ8w7QFfKjNzuOjAYbFa5ouunyDTEh4NWVxOOuKD6Ch5C', 'INTEGRANTE', 1, '2025-10-07 04:35:12', '2025-10-07 04:35:12', NULL),
(1051, 'cristofer.o.quispe', 'cristofer.o.quispe@upeu.edu.pe', '$2a$10$neAHaKQmJh/AjAm.UhDE0.E4kxCcRj8tHM6tdxT5iKHF.IEa.hRfe', 'INTEGRANTE', 1, '2025-10-07 04:35:13', '2025-10-07 04:35:13', NULL),
(1052, 'cristhian.alejo', 'cristhian.alejo@upeu.edu.pe', '$2a$10$BPjQQR2gPP59twJQQEO7QuG.rxMp6eOBGxUg79Qna0neASrCaUA06', 'INTEGRANTE', 1, '2025-10-07 04:35:13', '2025-10-07 04:35:13', NULL),
(1053, 'aldhair.huaquisto', 'aldhair.huaquisto@upeu.edu.pe', '$2a$10$d5asnBjVS0DZcPpOXGl.I.YL8bar5fgGFmh.0VE.KQ7oyUpiSoUdW', 'INTEGRANTE', 1, '2025-10-07 04:35:14', '2025-10-07 04:35:14', NULL),
(1054, 'heiner.apaza.', 'heineeapaza@gmail.com', '$2a$10$tdesrBvLzoC5Wz6CjGrzXuBfs1YV4ykhIDEkplb5D9dPzM9iHtHv.', 'INTEGRANTE', 1, '2025-10-07 04:35:14', '2025-10-07 04:35:14', NULL),
(1055, 'cristhian.murillo', 'cristhian.murillo@upeu.edu.pe', '$2a$10$gHP/3uPAPmgkgOftaGatnOUKKS3KkRq.BdrbA74WO07vKsdTtSQXq', 'INTEGRANTE', 1, '2025-10-07 04:35:15', '2025-10-07 04:35:15', NULL),
(1056, 'edwar.churata', 'ggtedy550@gmail.com', '$2a$10$QDX0OrvPFSTVHXz7v7H6O.hgKUZ7LpxJxxOniEFkFZKEoN7GsttFm', 'INTEGRANTE', 1, '2025-10-07 04:35:15', '2025-10-07 04:35:15', NULL),
(1057, 'rody.chuquimamani', '75601182@upeu.edu.pe', '$2a$10$cBpAMnkmodW9zgi8mtoSvuJ6qhDpxCi64iGb/x.kNzSmqudosA/9y', 'INTEGRANTE', 1, '2025-10-07 04:35:16', '2025-10-07 04:35:16', NULL),
(1058, '73602780', '73602780@upeu.edu.pe', '$2a$10$744.VK3ScAzw.ni3/nC8dOzM.FcKqqbU.EDdAsLsFabG6KyFwKYVa', 'INTEGRANTE', 1, '2025-10-07 04:35:16', '2025-10-07 04:35:16', NULL),
(1059, '74441247', 'frankcanazaquisocala@gmail.com', '$2a$10$2sD7aLZ84YEUhMB.7c0y6ODJYFpkYK4R3hR7hyteCM.FXsrQEOJ7y', 'INTEGRANTE', 1, '2025-10-07 04:35:17', '2025-10-07 04:35:17', NULL),
(1060, 'luis.chino', 'alejandrochinoleon@gmail.com', '$2a$10$IBnV2hK/VWpitaRpJam.sOepjmTOvWo/8sppSbJ/ZqbccbODC0S8y', 'INTEGRANTE', 1, '2025-10-07 04:35:17', '2025-10-07 04:35:17', NULL),
(1061, '60171224', 'fernandito15y@gmail.com', '$2a$10$yfRZng2qR3WKdVdfanQjYeq38ybOpjhzsJItoKzgAloCOEx1vHNu2', 'INTEGRANTE', 1, '2025-10-07 04:35:18', '2025-10-07 04:35:18', NULL),
(1062, '60175517', '60175517@upeu.edu.pe', '$2a$10$JgKZn7kyC0q/2p9McVrePe2.EKOUPxaNKtolkD/lDTCyDh2hQR36q', 'INTEGRANTE', 1, '2025-10-07 04:35:18', '2025-10-07 04:35:18', NULL),
(1063, '60203251', '60203251@upeu.edu.pe', '$2a$10$7y.CLGqdrUtEgYHZqrbxyuRpJbGCSprOsLVfM9i4ttjJk6KBG.sly', 'INTEGRANTE', 1, '2025-10-07 04:35:19', '2025-10-07 04:35:19', NULL),
(1064, '60836920', 'jaircitola@gmail.com', '$2a$10$TCIHLyFeNdNybDHOBzMIPuJP/ILvKQrvqLuJgHxpco3tbYQazekD2', 'INTEGRANTE', 1, '2025-10-07 04:35:19', '2025-10-07 04:35:19', NULL),
(1065, '61536276', '61536276@upeu.edu.pe', '$2a$10$aKyboECfJCKlGxdfEyKUf.MrP/u4O5XXpREeZH.HWyeDjhVkr0sE.', 'INTEGRANTE', 1, '2025-10-07 04:35:20', '2025-10-07 04:35:20', NULL),
(1066, '60850787', 'pyanil121@gmail.com', '$2a$10$sixF/1Kz4Sz7aXOyiEXgBehMUA1AP.4IKPGZGBj.gZuazOrguCmQe', 'INTEGRANTE', 1, '2025-10-07 04:35:20', '2025-10-07 04:35:20', NULL),
(1067, '77023216', 'makerjetasahamigua@gmail.com', '$2a$10$jHnEUYpcEsq23GA5398l2uJK450okVTUs2QtNhOdJwqPNX9PRtx1y', 'INTEGRANTE', 1, '2025-10-07 04:35:21', '2025-10-07 04:35:21', NULL),
(1068, '60765139', 'Julio4pedro@gmail.com', '$2a$10$6F1n.sp/.0q4SwpxNnJB5OAySsyMX.B64oe9I3gv1tPaBC1791cPG', 'INTEGRANTE', 1, '2025-10-07 04:35:21', '2025-10-07 04:35:21', NULL),
(1069, '72161559', 'leninortizmayta@gmail.com', '$2a$10$gpp7iXPf7wsu8l6mjsjAY.w62wMV/g1A1V.jx6syzZRt6GmhkFfM2', 'INTEGRANTE', 1, '2025-10-07 04:35:22', '2025-10-07 04:35:22', NULL),
(1070, 'juana.tito', 'juanatito.2001@gmail.com', '$2a$10$Q/IPMgZjf710k96btB1UD.TaY7zgH/Rudu0PE8MaaMkb6FHlAsAgu', 'INTEGRANTE', 1, '2025-10-07 04:35:22', '2025-10-07 04:35:22', NULL),
(1071, 'richard.quispecondori', 'edy.956.00@gmail.com', '$2a$10$80QWlIEFPGyD2rOjHGVGTOZZcwEi1Ly25M4GWYn8Nb.WAK9ymo7Cy', 'INTEGRANTE', 1, '2025-10-07 04:35:23', '2025-10-07 04:35:23', NULL),
(1072, 'keysy.inofuente', 'inofuentekeyst@gmai.com', '$2a$10$d2.PCmid1MHzZ0//U3Xj.uC1Mu1A.A1BfqSvV46iZLvegTrQqALlK', 'INTEGRANTE', 1, '2025-10-07 04:35:23', '2025-10-07 04:35:23', NULL),
(1073, 'kevin.apaza.c', 'apazazapanar@gmail.com', '$2a$10$4DfyIHvoERhAY0PdAsejeeelghqaZDwF37evo.Vt/Myx4aNXpIXBi', 'INTEGRANTE', 1, '2025-10-07 04:35:24', '2025-10-07 04:35:24', NULL),
(1074, '73462533', 'sofiarociohernandezchavez@gmail.com', '$2a$10$uGwnUGsvr2B3THkqJZj1QuOIkruKXg55395u.tJPvUoy6bxiYq56G', 'INTEGRANTE', 1, '2025-10-07 04:35:24', '2025-10-07 04:35:24', NULL),
(1075, 'willian.mayta', 'maytaarotaypewillian@gmail.com', '$2a$10$RJo6J6xO0RuP7.YMHfhJJuYd/LGcqzDn9EvjxvdeGPExCScQtM9Ue', 'INTEGRANTE', 1, '2025-10-07 04:35:25', '2025-10-07 04:35:25', NULL),
(1076, 'reyder.villafuerte', 'reyderedwinvillafuerteyupanqui@gmail.com', '$2a$10$D3UtgkVMb3x9BKtBvneGRO5ipKbS8h.42L7UC4syyUHTu0X1U9LPC', 'INTEGRANTE', 1, '2025-10-07 04:35:26', '2025-10-07 04:35:26', NULL),
(1077, 'russman.torres', '72456128@upeu.edu.pe', '$2a$10$I6gq0Yrvr3h57Zejc0gj3eh8Pv8bq1MAo0amuhK2MEOlGMvNvc7GG', 'INTEGRANTE', 1, '2025-10-07 04:35:26', '2025-10-07 04:35:26', NULL),
(1078, 'isaura.alvarez', '73758034@upeu.edu.pe', '$2a$10$7N5D.ar6uNSv7L4fcT4muu9D.ife0YjLdcivZ3a8UXA2YFXtFCGXO', 'INTEGRANTE', 1, '2025-10-07 04:35:27', '2025-10-07 04:35:27', NULL),
(1079, 'yefri.lerma', 'ronallerma033@gmail.com', '$2a$10$9eiouhoFTOokdhi0/2pg8evYP09fUDG35WYiVOAw2rISATHCWTD8i', 'INTEGRANTE', 1, '2025-10-07 04:35:27', '2025-10-07 04:35:27', NULL),
(1080, 'yasen.cutipa', 'waltomyasen@gmail.com', '$2a$10$ObAfhEkXPkN2FgxtctlmeOAWm7ejgCS8qYiSmTAE1C6SN9.XKPnaC', 'INTEGRANTE', 1, '2025-10-07 04:35:28', '2025-10-07 04:35:28', NULL),
(1081, 'mayda.carlos', 'mayda.carlos@upeu.edu.pe', '$2a$10$Bu7iXJv7T3wGp.Cr.C50Ku1SUXeaJDcSvkRdwg7wunS/ATrakAgyS', 'INTEGRANTE', 1, '2025-10-07 04:35:28', '2025-10-07 04:35:28', NULL),
(1082, '60262751', 'roycruz7654@gmail.com', '$2a$10$fx6VKvIpv4709KBRVTcjUedivwZ3p5fRRNTiGYbCDXqg9VYYzfhzi', 'INTEGRANTE', 1, '2025-10-07 04:35:29', '2025-10-07 04:35:29', NULL),
(1083, 'sait.gutierrez', 'SaitProYT34534@outlook.com', '$2a$10$apGbPSVDo3Qt9gU34VSJPu0ygJEfU4nr52YnE1EJo2FN6lzvZUvIC', 'INTEGRANTE', 1, '2025-10-07 04:35:29', '2025-10-07 04:35:29', NULL),
(1084, 'franklin.ramos', 'jhonfranklin123798@gmail.com', '$2a$10$WZrRmSNTsrd42reZGcn/COZWmVzYApOq4vyPF5ZmxBuerj8dj29xy', 'INTEGRANTE', 1, '2025-10-07 04:35:29', '2025-10-07 04:35:29', NULL),
(1085, '75254568', 'mathiask357@gmail.com', '$2a$10$gVF2GnQDLEy7o.8RoQZ5CetlswwHBXQ11Ndn/kXqzudVg.0/4eQxm', 'INTEGRANTE', 1, '2025-10-07 04:35:30', '2025-10-07 04:35:30', NULL),
(1086, '75314538', '75314538@upeu.edu.pe', '$2a$10$LUndS/keA1xih1V3KfCUWe7sf.SbflD5R2OjtSHBivJNYer7Bk/om', 'INTEGRANTE', 1, '2025-10-07 04:35:30', '2025-10-07 04:35:30', NULL),
(1087, 'caleb.coaquira', 'edson.caleb.23@gmail.com', '$2a$10$od8tSkFlDsReIGVbVUT5o.Wnw34YJHnoYdY0DcgwvQDjGNiZGefb2', 'INTEGRANTE', 1, '2025-10-07 04:35:30', '2025-10-07 04:35:30', NULL),
(1088, '74770078', 'marymargoth321@gmail.com', '$2a$10$iX2b4b8r7n/Cng6efeg7mucC6EdGhtFO1UCM6OzbCzOFDdSRO79te', 'INTEGRANTE', 1, '2025-10-07 04:35:31', '2025-10-07 04:35:31', NULL),
(1089, '62393792', '62393792@upeu.edu.pe', '$2a$10$p6cDGkwluxBpiK/yFw2F2eN4hg9J99FpuUd9T0nZx9nRBLW.IVbwi', 'INTEGRANTE', 1, '2025-10-07 04:35:31', '2025-10-07 04:35:31', NULL),
(1090, '60061661', 'marcakevin955@gmail.com', '$2a$10$EodUo382IBBkTxqINKMKg.EHsZFG77zZirB1QRCA5k3WIwwb3sQVC', 'INTEGRANTE', 1, '2025-10-07 04:35:32', '2025-10-07 04:35:32', NULL),
(1091, '75413261', 'albertmlaime@gmail.com', '$2a$10$MKoXq1ZPqxwg0oHSh1PDXO8YQ4MwNb4yl1aIc1cOZZuZ4f2gI6pjW', 'INTEGRANTE', 1, '2025-10-07 04:35:32', '2025-10-07 04:35:32', NULL),
(1092, '75576436', 'Daniel@upeu.edu.pe', '$2a$10$ElOF6q2d1WylO7W309ZZHeeUelNIDPcBcnoUTIIs7iwuLec5aEiEi', 'INTEGRANTE', 1, '2025-10-07 04:35:33', '2025-10-07 04:35:33', NULL),
(1093, '77170827', '77170827@upeu.edu.pe', '$2a$10$E3zLM1SV2ZsUMgCF0Z1SouOV9MVnuBLFgoJ1rklv22kwR1ZzW6ZDu', 'INTEGRANTE', 1, '2025-10-07 04:35:33', '2025-10-07 04:35:33', NULL),
(1094, '74126646', 'hernanbill.vilca@gmail.com', '$2a$10$4XoJBWmDKNdLDR056p9GeedjG7yA/m2nmT.QXV9ad9H8mDt9xpyZK', 'INTEGRANTE', 1, '2025-10-07 04:35:34', '2025-10-07 04:35:34', NULL),
(1095, '60764578', 'jorgelarico872@gmail.com', '$2a$10$Vvk4Q/z44i4AwHubXsLw4O.7UEe0J33O67.yq8HUTMmJWW8GfnKpW', 'INTEGRANTE', 1, '2025-10-07 04:35:35', '2025-10-07 04:35:35', NULL),
(1096, '60837156', '60837156@upeu.edu.pe', '$2a$10$xiZQ3AOTpHzj8ZYeGMJ.Kuy5FoP3s/EnjiwTzMhqX7DcQI6yijN4u', 'INTEGRANTE', 1, '2025-10-07 04:35:35', '2025-10-07 04:35:35', NULL),
(1097, 'erick.delgado', 'erickmijaeldelgafolima@gmail.com', '$2a$10$VeCIC8J1V8RH4TPzGx.UAuGa8PcK8btmlJWxzcimWZUB46DSrNtlq', 'INTEGRANTE', 1, '2025-10-07 04:35:36', '2025-10-07 04:35:36', NULL),
(1098, 'yenifher.sanchez', 'yenifhersanchez123@gmail.com', '$2a$10$YL0VIRXeev4lH.iBwWHkwusx0Kg6ZAx1XRf8GeRT/ioGcwIgkPIxS', 'INTEGRANTE', 1, '2025-10-07 04:35:36', '2025-10-07 04:35:36', NULL),
(1099, 'alicia.vizcarra', 'vizcarrasheyla2@gmail.com', '$2a$10$u2KHcD8eqx1oeRAsfb7ZjO3kWLy.pjfxbk12B5GzIX6bIo2daG1NK', 'INTEGRANTE', 1, '2025-10-07 04:35:36', '2025-10-07 04:35:36', NULL),
(1100, 'walter.quispesayhua', 'wasterwill@gmail.com', '$2a$10$NncKuAcfHE/3lGXZubpmmuhChBjQGzaF1G1RT7khkjk6Emi83p1pS', 'INTEGRANTE', 1, '2025-10-07 04:35:37', '2025-10-07 04:35:37', NULL),
(1101, 'daniel.mayta', 'guido1808daniel2006@gmail.com', '$2a$10$Dd15MF/4IAP8gK6GIPxtse5TQLlg68qV45jKJvvxRA1/PxnO2arr.', 'INTEGRANTE', 1, '2025-10-07 04:35:37', '2025-10-07 04:35:37', NULL),
(1102, 'erickmaycol.quispe', 'erickmaycol109@gmail.com', '$2a$10$/78B7nGnxx1aRKThbko5fe5fayc7iyS6.MTFZL7TFOxACIKw5L88G', 'INTEGRANTE', 1, '2025-10-07 04:35:37', '2025-10-07 04:35:37', NULL),
(1103, 'gianluck.pastor', 'gluck.pastor@gmail.com', '$2a$10$qgbqfYl41kk5XIrM3VZoyeJuIi4U9AgscUblCN51kZpSZqC7C.RTS', 'INTEGRANTE', 1, '2025-10-07 04:35:38', '2025-10-07 04:35:38', NULL),
(1104, 'dubcek.quispe', 'leonelr159d@gmail.com', '$2a$10$6tlOuUMiBCuqZn1yfUfNqufAzux6jEdO5eGhcVnHJG75b/DNtqa7y', 'INTEGRANTE', 1, '2025-10-07 04:35:38', '2025-10-07 04:35:38', NULL),
(1105, 'ronaldo.mamani.p', '60836701@upeu.edu.pe', '$2a$10$19riAiQaTlIB7IXzaltY5ujdAm.h5kVes2cZf6SdH4.LI1v9VhkYq', 'INTEGRANTE', 1, '2025-10-07 04:35:39', '2025-10-07 04:35:39', NULL),
(1106, 'dilwer.aguilar', 'dilwer@upeu.edu.pe', '$2a$10$J8y91gb6ZsnDe/nZIV29MO6Y1/l5pJApDT1Y07MjLBbPyaKN/9Uyu', 'INTEGRANTE', 1, '2025-10-07 04:35:39', '2025-10-07 04:35:39', NULL),
(1107, 'fernando.huanca', 'nando104.fer@gmail.com', '$2a$10$5UWTIit/TE.KYSCdyaYO5eSU25aH7SxzhtFqz1cuMSyVFvJliIxiS', 'INTEGRANTE', 1, '2025-10-07 04:35:39', '2025-10-07 04:35:39', NULL),
(1108, 'said.paccori', 'paccorisuaquitasaid@gmail.com', '$2a$10$FQRdN8Mpgh0FE4V9L2Y11.CvCrCI8erUnwPnl3Noz6SShitL9TUPu', 'INTEGRANTE', 1, '2025-10-07 04:35:40', '2025-10-07 04:35:40', NULL),
(1109, 'antony.condori', 'condoriantony87@gmail.com', '$2a$10$vrP1nnPYlDaIE3gdYG86gucKNZ2YwV3p5jlSzEHzwz1JDl.nbpBHe', 'INTEGRANTE', 1, '2025-10-07 04:35:40', '2025-10-07 04:35:40', NULL),
(1110, 'emerlin.fernandez', 'emerlin.fernandez@upeu.edu.pe', '$2a$10$m/svayf8tOmp1Vqk1dbPfu.1WBQq/5wUmyZD8ltffUPf2stl4YEZS', 'INTEGRANTE', 1, '2025-10-07 04:35:41', '2025-10-07 04:35:41', NULL),
(1111, 'jhymel.figueroa', 'jhymelneliof@gmail.com', '$2a$10$8Fcfv83ZVE8RpFB/3nd/seruBl8yFK336JuK5.OJMpvGUju3LWIPK', 'INTEGRANTE', 1, '2025-10-07 04:35:42', '2025-10-07 04:35:42', NULL),
(1112, 'gustavo.aguilar', '72357807@upeu.edu.pe', '$2a$10$6/l8QhOjOg3w160fvnKiDuTtp5ZVtDCHgcJHoX200gaBcO8eJxY92', 'INTEGRANTE', 1, '2025-10-07 04:35:42', '2025-10-07 04:35:42', NULL),
(1113, 'jhon.quilla.q', '73855844@upeu.edu.pe', '$2a$10$WjPdytnWy.4bho1WGHwPCOLTVlQIsuEe9PrHxfTVtOebE77MhA0pe', 'INTEGRANTE', 1, '2025-10-07 04:35:43', '2025-10-07 04:35:43', NULL),
(1114, 'joel.pacheco', '73199116@upeu.edu.pe', '$2a$10$SSDdl3jOiDmm649ians/BeTW8/9AWNNLC46IbB3QSrqdDMeonyLM6', 'INTEGRANTE', 1, '2025-10-07 04:35:43', '2025-10-07 04:35:43', NULL),
(1115, '70480266', '70480266@upeu.edu.pe', '$2a$10$pd4kgU85W81sUj03Yd8Hi.nXQx.YPXAic/xZfM8CVqfnJKHo8NRp6', 'INTEGRANTE', 1, '2025-10-07 04:35:44', '2025-10-07 04:35:44', NULL),
(1116, '73820871', '73820871@upeu.edu.pe', '$2a$10$SbUxhXxUAN7PJwduoo7a2urZhPfShNqWQYIgkaf1i.uv6csfkZyz6', 'INTEGRANTE', 1, '2025-10-07 04:35:44', '2025-10-07 04:35:44', NULL),
(1117, '74178925', 'hdialexsander358@gmail.com', '$2a$10$V.CqEda78CZu1Ae1gZeQL.fahT47X/VBtCs6Q8oSkYAWCWaHgcE1O', 'INTEGRANTE', 1, '2025-10-07 04:35:45', '2025-10-07 04:35:45', NULL);
INSERT INTO `usuarios` (`id_usuario`, `usuario`, `correo`, `contraseña`, `rol`, `activo`, `fecha_creacion`, `fecha_modificacion`, `ultimo_acceso`) VALUES
(1118, 'jhosef.cuadros', 'jhosef.flowrs.10@gmail.com', '$2a$10$JCdlYoFz4s70K7ol/IJjNOtDKXBeQC4JuUC6u2Z4pz/.a/bLSW8qe', 'INTEGRANTE', 1, '2025-10-07 04:35:45', '2025-10-07 04:35:45', NULL),
(1119, '60765466', 'Jaysoncoaquira1@gmail.com', '$2a$10$InNTMATiD9waV39UkO4teO5DbuklYcFYR5Ju5Q33zK/9WL01ciQ0a', 'INTEGRANTE', 1, '2025-10-07 04:35:46', '2025-10-07 04:35:46', NULL),
(1120, '76568621', '76568621@upeu.edu.pe', '$2a$10$ih7YCqqrMebZgvytRHdG1uDwisGKaOpI5rbcxaQSBVkM.au.U.aFS', 'INTEGRANTE', 1, '2025-10-07 04:35:46', '2025-10-07 04:35:46', NULL),
(1121, '76873416', 'yostinillanes@gmail.com', '$2a$10$TfH1dQTZWn8GSGpY.AKlLennAtxq3Tj9AE14YkB88GPrG3uk8gMOW', 'INTEGRANTE', 1, '2025-10-07 04:35:47', '2025-10-07 04:35:47', NULL),
(1122, 'dayron.apaza', 'Dayron.ear@gmail.com', '$2a$10$zzelZfmr/db0S3GELhFPLeOhpWguT.e4XogUCbfjK10gtT272A3Vu', 'INTEGRANTE', 1, '2025-10-07 04:35:47', '2025-10-07 04:35:47', NULL),
(1123, 'kenny.lopez', 'Lopkenny7@gmail.com', '$2a$10$S6jK9Q93zd1E4JD40R70/eoctPK3AQMerWKgRqpdhYuvLJ.aAAtwO', 'INTEGRANTE', 1, '2025-10-07 04:35:48', '2025-10-07 04:35:48', NULL),
(1124, 'heberlen.quispe', 'heberlenq@gmail.com', '$2a$10$xYWLPg36CKOTh/ka/c1V4.EvrAJeJZKUkVvR9SC2HdwMQYjywUlt6', 'INTEGRANTE', 1, '2025-10-07 04:35:48', '2025-10-07 04:35:48', NULL),
(1125, 'eddyssoncuro', 'eddysson.curo@upeu.edu.pe', '$2a$10$wT90DKEmjCeqL2h0LFK5d.n4FaL0xJYhNo4JOINReotUHlwgJiGxW', 'INTEGRANTE', 1, '2025-10-07 04:35:49', '2025-10-07 04:35:49', NULL),
(1126, 'yeyson.mamani', '73645926@upeu.edu.pe', '$2a$10$YqXK/FwD8R4ceMO6bSQUaOh2ioUH6ud5h/l7impgQy.omlCwW/qlK', 'INTEGRANTE', 1, '2025-10-07 04:35:49', '2025-10-07 04:35:49', NULL),
(1127, 'christian.luque', 'christian.luque@upeu.edu.pe', '$2a$10$1/uHP4pDf/OfSLZ4qcAP6OSYTbwXn8YBy4ToV47gqT6MEGZpSosne', 'INTEGRANTE', 1, '2025-10-07 04:35:50', '2025-10-07 04:35:50', NULL),
(1128, 'ramiro.vargas', 'ramiroengelberth@gmail.com', '$2a$10$BUkH1782bSnCKRFK2h2KCuiokPYUFLwYtfCVSXlLqa.ZLT6ehkRk6', 'INTEGRANTE', 1, '2025-10-07 04:35:50', '2025-10-07 04:35:50', NULL),
(1129, 'fredy.mamani', 'Fredyrivaldo75@gmail.com', '$2a$10$.ceosGt.t69I9Kulz9fTYewvp.E3ybwLnWiNe4NpZ8LCR7qpNO9Be', 'INTEGRANTE', 1, '2025-10-07 04:35:51', '2025-10-07 04:35:51', NULL),
(1130, 'juan.phocco', 'archiva1591@gmail.com', '$2a$10$QBKBToPdg/vf77cuGllo8ummygt3668V8eC3e57HXt9ASrSEDYf8i', 'INTEGRANTE', 1, '2025-10-07 04:35:51', '2025-10-07 04:35:51', NULL),
(1131, 'ana.arriagax', 'ana.poquioma@upeu.edu.pe', '$2a$10$rJBW02kCcL9pLD1s.JSNdOTbP.G6UYSP1MXK2u8nqpYQ8kRoZ9R2G', 'INTEGRANTE', 1, '2025-10-07 04:35:52', '2025-10-07 04:35:52', NULL),
(1132, 'guillermo.ticona', 'jticonalipa@gmail.com', '$2a$10$tC.M3du2WKKGAeOZJYyau.Fz7b18FyrJ2iiX6qYuL9pPqX9/1Bbg2', 'INTEGRANTE', 1, '2025-10-07 04:35:52', '2025-10-07 04:35:52', NULL),
(1133, 'ciro.machicado', 'ciro.machicado@upeu.edu.pe', '$2a$10$sQbyRMkdn2tpHS6vSDGdle65YVjgG6TeNzqxkHBg4eKvegvEUNzzq', 'INTEGRANTE', 1, '2025-10-07 04:35:53', '2025-10-07 04:35:53', NULL),
(1134, 'willim.parqui', '71851461@upeu.edu.pe', '$2a$10$ZjU/e9N7Q53fAazmicmJFeD0ngbjBjLW1eCmhYbzaYxHVWoMdNKXq', 'INTEGRANTE', 1, '2025-10-07 04:35:53', '2025-10-07 04:35:53', NULL),
(1135, 'josimar.huarilloclla', '73507707@upeu.edu.pe', '$2a$10$po6L1Gt4z0TFwlYd4yV9jukUiZlYTMhwWueTgt4aGB1.XX9wMqegy', 'INTEGRANTE', 1, '2025-10-07 04:35:54', '2025-10-07 04:35:54', NULL),
(1136, 'jorge.cahui', '76283796@upeu.edu.pe', '$2a$10$DWA1UYlQfkliKFZgJLqjgO0f1malt177lx2ErwbI9JV0oklt3SPLm', 'INTEGRANTE', 1, '2025-10-07 04:35:54', '2025-10-07 04:35:54', NULL),
(1137, 'harol.atoccsa', '79381778@upeu.edu.pe', '$2a$10$lraas2bRzBGEebO6fvqngeRSUogZhoasfzdRvgw/zJxbtDQO8anX6', 'INTEGRANTE', 1, '2025-10-07 04:35:55', '2025-10-07 04:35:55', NULL),
(1138, 'alexander.huahuaccapa', '77148477@upeu.edu.pe', '$2a$10$6OOx8xqHjY1.JH9/msG0pOfVhvbxgCe2TaEmJzDCzipI9kglZtxQ2', 'INTEGRANTE', 1, '2025-10-07 04:35:55', '2025-10-07 04:35:55', NULL),
(1139, '75980078', '75980078@upeu.edu.pe', '$2a$10$Mb2j5fs8ksAr35GvLHjPP.zViC3apO0kpi7RIhbFm1Al/gn2nFTPK', 'INTEGRANTE', 1, '2025-10-07 04:35:56', '2025-10-07 04:35:56', NULL),
(1140, '74541161', '74541161@upeu.edu.pe', '$2a$10$aVonjr8DGP0tz8a2RoVTKeodBRqChQCOxlAqQP27SUN2um7mghkYS', 'INTEGRANTE', 1, '2025-10-07 04:35:56', '2025-10-07 04:35:56', NULL),
(1141, 'abel.colquehuanca', '74176537@upeu.edu.pe', '$2a$10$tS8dw3opjeaLAbrtoeTO6eEkDhxv4Lw4XaP2HeAxtAwWRKT21QY4e', 'INTEGRANTE', 1, '2025-10-07 04:35:57', '2025-10-07 04:35:57', NULL),
(1142, '76016734', '76016734@upeu.edu.pe', '$2a$10$aT31jgpiO.OOWDFp9nOOyOUctQrHRfBvWYKLaM89OLBtVxPQ77gIi', 'INTEGRANTE', 1, '2025-10-07 04:35:57', '2025-10-07 04:35:57', NULL),
(1143, '74020233', '74020233@upeu.edu.pe', '$2a$10$K26j7jn.4QbBzd4FMZJkoO3s/MW/qEujwsoSv0BpVM0g4sDRjLOmi', 'INTEGRANTE', 1, '2025-10-07 04:35:58', '2025-10-07 04:35:58', NULL),
(1144, '73744546', '73744546@upeu.edu.pe', '$2a$10$roYkwhIGNZpvqeGSl.uzuOXywRRPT9FUbd8Qyfy46Ewr33oe0K4tm', 'INTEGRANTE', 1, '2025-10-07 04:35:59', '2025-10-07 04:35:59', NULL),
(1145, '75493213', '75493213@upeu.edu.pe', '$2a$10$SUrE1V0YLzRpv8NWPSsvVeeDuEeXaVobv.rVesPqiViy1oYXaEwxG', 'INTEGRANTE', 1, '2025-10-07 04:35:59', '2025-10-07 04:35:59', NULL),
(1146, '71833371', '71833371@upeu.edu.pe', '$2a$10$aOT3beBzRyLi4Fz7gDoVjuLv9/6dIBoDqAsRuex1gaZEh4itjxd.e', 'INTEGRANTE', 1, '2025-10-07 04:36:00', '2025-10-07 04:36:00', NULL),
(1147, '73513691', '73513691@upeu.edu.pe', '$2a$10$mNQhr0sXcZq.D2Vpc9K4S.Zk8eINqeMrKs6acNCBr48ZUp8Vid8uS', 'INTEGRANTE', 1, '2025-10-07 04:36:00', '2025-10-07 04:36:00', NULL),
(1148, '75795237', '75795237@upeu.edu.pe', '$2a$10$vYyDZlEul39yrHw6Hq0MY.apt/OUkG5tKvdfv0BY0Ea6LkWcOolHq', 'INTEGRANTE', 1, '2025-10-07 04:36:01', '2025-10-07 04:36:01', NULL),
(1149, '76422678', 'fabrizzio@upeu.edu.pe', '$2a$10$KdrZe/6sAigqLVmvg6Yj.Oi.LgkaCHNtsW3FmoKMM64fvQYMxhIFy', 'INTEGRANTE', 1, '2025-10-07 04:36:01', '2025-10-07 04:36:01', NULL),
(1150, '75950880', 'mark@upeu.edu.pe', '$2a$10$CywivPNA0jlELUt8sECrfOQEiiyWIK8CiSyJ0qvoTEshncUqZlMQG', 'INTEGRANTE', 1, '2025-10-07 04:36:02', '2025-10-07 04:36:02', NULL),
(1151, '74152593', '74152593@upeu.edu.pe', '$2a$10$MUyraxeg15T7mPTgCw4Z7.hX8OaKAxUt2g.xLcpC99v1EUEMmSQTu', 'INTEGRANTE', 1, '2025-10-07 04:36:02', '2025-10-07 04:36:02', NULL),
(1152, 'olgermeza', 'olgeradrianomeza@gmail.com', '$2a$10$KxeZ6BFcRGhLsLIDLVOayO.prePAiDooVjP.O4qLn/G.NdciKFAG2', 'INTEGRANTE', 1, '2025-10-07 04:36:03', '2025-10-07 04:36:03', NULL),
(1153, 'reginaldomayhuire', 'reginaldomayhuire@upeu.edu.pe', '$2a$10$ONDWKGSsy1Qk8rE9DgDH4egQrPxz0tsp7bq7mOvv5EIwh7ju6ekS.', 'INTEGRANTE', 1, '2025-10-07 04:36:03', '2025-10-07 04:36:03', NULL),
(1154, 'elroyvargas', 'rojhas123456@gmail.com', '$2a$10$9vcdsaH8.R.JhcvEa5N0Q.pm686moufsjUo2prhs.u/6xem5/BBJG', 'INTEGRANTE', 1, '2025-10-07 04:36:04', '2025-10-07 04:36:04', NULL),
(1155, 'josue.ccana', 'ccanadaniely@gmail.com', '$2a$10$KmnuUl.5ZW3j9ERrmpPpROVr0fS69PPwzTV8OK2IYAP2iSH8sE2kC', 'INTEGRANTE', 1, '2025-10-07 04:36:04', '2025-10-07 04:36:04', NULL),
(1156, 'juan.prieto.', 'enders9245@gmail.com', '$2a$10$OyXh2U0v98yPNq5iKMx41O/SMumAyS4bgAqWY635MakGV4nAa7uBa', 'INTEGRANTE', 1, '2025-10-07 04:36:05', '2025-10-07 04:36:05', NULL),
(1157, 'kenny.aquino', 'kennyaapro@hotmail.com', '$2a$10$1X7tDqHkF6QraUialwqaLuoxlOwQnVjmCQeBgz8vbyZ3KNteVUQG6', 'INTEGRANTE', 1, '2025-10-07 04:36:05', '2025-10-07 04:36:05', NULL),
(1158, 'rodrigo.chura', 'Rodrigochaina327@gmail.com', '$2a$10$7Oz7CMBMCgr9l3d.dkmAMu8Qiu4VDpkfO7FrUZfoiOhwDh28ICvBK', 'INTEGRANTE', 1, '2025-10-07 04:36:06', '2025-10-07 04:36:06', NULL),
(1159, 'bisleyn.arce', 'bisleyn.arce@upeu.edu.pe', '$2a$10$QVScte2EKOwK/tJpjtTJNunNGQA6GDDqksJR2Yji3BkcZMYTWscfi', 'INTEGRANTE', 1, '2025-10-07 04:36:06', '2025-10-07 04:36:06', NULL),
(1160, 'carlos.mullisaca', 'carlos.mullisaca@upeu.edu.pe', '$2a$10$2NgcM5ecmZY/jWEczd/nOuFO/68WUvUdP/jOVzJEzGzY/l.OP4rCK', 'INTEGRANTE', 1, '2025-10-07 04:36:07', '2025-10-07 04:36:07', NULL),
(1161, 'angelo.roque', 'yoshuaroquequispe@gmail.com', '$2a$10$M4.vz8GQc1Y7JBZbXzbgy.InDZX37sb7PRHtAhszjm4njAuYDUD9G', 'INTEGRANTE', 1, '2025-10-07 04:36:07', '2025-10-07 04:36:07', NULL),
(1162, 'uhziel.condoriz', 'uhziel.condoriz@upeu.edu.pe', '$2a$10$iJb2cfSCu/08ZpuwmFYep.Lu5Ab2C5kcCpMOmPQCJTEnTDDGL/kVW', 'INTEGRANTE', 1, '2025-10-07 04:36:08', '2025-10-07 04:36:08', NULL),
(1163, 'russbell.cario', 'russbell.cario@upeu.edu.pe', '$2a$10$14nie711Gn7N6Ytrfxs.fenjBLZH7YKzdKvCrTcirinO.UxNgY3LK', 'INTEGRANTE', 1, '2025-10-07 04:36:08', '2025-10-07 04:36:08', NULL),
(1164, 'nelson.luque', 'nelson.luque@upeu.edu.pe', '$2a$10$xVzX0dJnhr3FkuHazRRXwejiSHVHvbPsi.RAxMhJH51bu3MQUVj8W', 'INTEGRANTE', 1, '2025-10-07 04:36:08', '2025-10-07 04:36:08', NULL),
(1165, 'kevin.abarca', 'kevin.abarca@upeu.edu.pe', '$2a$10$RJ1iEnV7e30N/5mmqpsFGupa1elSMHduMZrtKRoPG4QpLWM9vJeeG', 'INTEGRANTE', 1, '2025-10-07 04:36:09', '2025-10-07 04:36:09', NULL),
(1166, 'randy.concha', 'randy.concha@upeu.edu.pe', '$2a$10$KEWoUymNHWJU0LLB7wyA0eEahXyHOMsxT5Megg1/4tya5glIoiyz.', 'INTEGRANTE', 1, '2025-10-07 04:36:09', '2025-10-07 04:36:09', NULL),
(1167, 'ronald.pastor', 'ronald.pastor@upeu.edu.pe', '$2a$10$nm7GOFc8vo0xKDxs1Kvdj.u5aN05rhceVSr40wi.YPjZcvIvTUKOK', 'INTEGRANTE', 1, '2025-10-07 04:36:10', '2025-10-07 04:36:10', NULL),
(1168, 'william.ortiz', 'william.ortiz@upeu.edu.pe', '$2a$10$ii95tzmTCWygi7P1aL1oLugG5u396lEPniZ1DunSw4dEGXkTq87bS', 'INTEGRANTE', 1, '2025-10-07 04:36:10', '2025-10-07 04:36:10', NULL),
(1169, 'xaris.berrocal', 'xaris.berrocal@upeu.edu.pe', '$2a$10$5djbsVCCf2iP3U1Au3UqYe35aVpxZvh/XGhjJ.nfBMFTaBakwE70y', 'INTEGRANTE', 1, '2025-10-07 04:36:11', '2025-10-07 04:36:11', NULL),
(1170, 'moises.mestas', 'moises.mestas@upeu.edu.pe', '$2a$10$09PPxK0Y0CuPFi.ybi3Fz.mL70VNR5FI/v9.th2zP/mRbDZ6b.5Om', 'INTEGRANTE', 1, '2025-10-07 04:36:11', '2025-10-07 04:36:11', NULL),
(1171, 'franco.quispe', 'franco.quispe@upeu.edu.pe', '$2a$10$bhgELX976ncrjhLEtYucC.I60xg6O6kgv4m0x1EqSG0ScK54qewaC', 'INTEGRANTE', 1, '2025-10-07 04:36:12', '2025-10-07 04:36:12', NULL),
(1172, 'kelman.mamani', 'kelman.mamani@upeu.edu.pe', '$2a$10$piZym7csQh/BU3co534CceawOzFwmaQC.oLnnZSeHokvJCW1D.O82', 'INTEGRANTE', 1, '2025-10-07 04:36:12', '2025-10-07 04:36:12', NULL),
(1173, 'howard.coila', 'howard.coila@upeu.edu.pe', '$2a$10$9KxVbPetZL8uzxoVFGV.huRjDBaQe26/1ew2bLo5uJf56TZJdbCuy', 'INTEGRANTE', 1, '2025-10-07 04:36:13', '2025-10-07 04:36:13', NULL),
(1174, 'julmer.puma', 'julmer.puma@upeu.edu.pe', '$2a$10$FycLh3tNczVJMcwGqj6pgOMm7Psdd8HPG/eGMEAsQKOmUJ6vfE7jy', 'INTEGRANTE', 1, '2025-10-07 04:36:13', '2025-10-07 04:36:13', NULL),
(1175, 'pawel.paricahua', 'pawel.paricahua@upeu.edu.pe', '$2a$10$yCWwWVFv8FRnlOZ52kqWouFLv6nRjF2M2l.MwxN77uFcug47uQKaS', 'INTEGRANTE', 1, '2025-10-07 04:36:14', '2025-10-07 04:36:14', NULL),
(1176, 'marcelo.torres', 'marcelocoky0309@gmail.com', '$2a$10$OnVBGP6khYYKDhCbAO5VZeR8kSo65nJtH2G9dRW.gVpaxDDb8S9ky', 'INTEGRANTE', 1, '2025-10-07 04:36:14', '2025-10-07 04:36:14', NULL),
(1177, 'hector.pacompia', 'hector.pacompia@upeu.edu.pe', '$2a$10$KAyeOeN1ZLcAdq81HGBKBOD6spZ0kCDtf6rox7udFaxqylU7r0eB2', 'INTEGRANTE', 1, '2025-10-07 04:36:15', '2025-10-07 04:36:15', NULL),
(1178, 'rossel.turpo', 'rossel.turpo@upeu.edu.pe', '$2a$10$pY.V9HzdYACXzZ8iy2XC/eT90iuKqxG.Q1RFJ96/stQI4zehmJLfe', 'INTEGRANTE', 1, '2025-10-07 04:36:15', '2025-10-07 04:36:15', NULL),
(1179, 'daniel.pinto', 'daniel.pinto@upeu.edu.pe', '$2a$10$YT2FtUZTxEdI8UzJB9GHn.rKI7uHYpH/iV5VoRc59bhnwVcVtWjvG', 'INTEGRANTE', 1, '2025-10-07 04:36:15', '2025-10-07 04:36:15', NULL),
(1180, 'guerry.castillo', 'guerrycastillo9@gmail.com', '$2a$10$h.f/QvBv2KR8KzpaYcZVtu704iNLvZEQkq.F1n.5SubDUZ5aB0DT6', 'INTEGRANTE', 1, '2025-10-07 04:36:16', '2025-10-07 04:36:16', NULL),
(1181, 'nicole.terrazas.', 'terrazasrojasnicole051@outlook.com', '$2a$10$IcT1RXtYbNTWF8BVjuu.AO0dUlqNCslOSud.Ljp.yKAgy.KfMxOn.', 'INTEGRANTE', 1, '2025-10-07 04:36:16', '2025-10-07 04:36:16', NULL),
(1182, 'rober.lipe', 'payehuancarober18@gmail.com', '$2a$10$9fZVS9YbU1Z5.ohtAj8tg.xzb02B7SsaSabinlIK3hn/bBIlUAeO.', 'INTEGRANTE', 1, '2025-10-07 04:36:17', '2025-10-07 04:36:17', NULL),
(1183, 'alex.gutierrez', 'gutierrezmoralesalex6@gmail.com', '$2a$10$mr.GogJ75QGOz1WNd72s1egX97jvTlcnGiZTEEMlhY9f8r2UV9xle', 'INTEGRANTE', 1, '2025-10-07 04:36:17', '2025-10-07 04:36:17', NULL),
(1184, 'walter.cayte', 'walter.cayte@upeu.edu.pe', '$2a$10$8X86lyGE4VqMvgEsNFIU.uILyC2GZtmCIPYS8e.cSF9jKp7AUCfTq', 'INTEGRANTE', 1, '2025-10-07 04:36:17', '2025-10-07 04:36:17', NULL),
(1185, 'jhony.mamani.', 'alvarojhony64@gmail.com', '$2a$10$sj.Wkfv0Lu6AE45wkqpZyu5Acj6m0TT1svNNzP2JQjEL8u0k0xzA2', 'INTEGRANTE', 1, '2025-10-07 04:36:18', '2025-10-07 04:36:18', NULL),
(1186, 'jeimy.ramosa', 'jeimy.ramos@upeu.edu.pe', '$2a$10$7E2rRnEmdCynB9TLF1ey9usyFzMZKuMq29sOygF9tYNkjAc8Ougwa', 'INTEGRANTE', 1, '2025-10-07 04:36:18', '2025-10-07 04:36:18', NULL),
(1187, 'manuel.quispe.ce', 'manuel.quispe.ce@upeu.edu.pe', '$2a$10$.XMwqzersyML6NW/diwLWuNLLIywIpqx9kTgzHE3Vm.OhiQTttR1G', 'INTEGRANTE', 1, '2025-10-07 04:36:18', '2025-10-07 04:36:18', NULL),
(1188, 'jhoel.coilak', 'jhoel.coilak@upeu.edu.pe', '$2a$10$Df/5xhOG.dHUqq0zdd6.ve4pb4d/eSHkeLOY59FynqfbnIFuwTxHW', 'INTEGRANTE', 1, '2025-10-07 04:36:18', '2025-10-07 04:36:18', NULL),
(1189, 'juan.coasacai', 'juan.coasaca@upeu.edu.pe', '$2a$10$M.l6sQkVGp4r8yI9N4ncWulNc0BR96VpQ.m7onkp1c/N5Tr5BeidS', 'INTEGRANTE', 1, '2025-10-07 04:36:19', '2025-10-07 04:36:19', NULL),
(1190, 'idonis.payen', 'axy09mijael@gmail.com', '$2a$10$QunRX7QwDaLtbZUlqXzp6.aTNiqkiADE6aTIEuavDnc.oJy8yXaje', 'INTEGRANTE', 1, '2025-10-07 04:36:19', '2025-10-07 04:36:19', NULL),
(1191, 'juan.condori.c', 'juan.condori.c@upeu.edu.pe', '$2a$10$HsCERJ3wdC8.1R80UruNGuG4GyoO1nWtyYFkW41VSPNZ1C1UZSG2e', 'INTEGRANTE', 1, '2025-10-07 04:36:19', '2025-10-07 04:36:19', NULL),
(1192, 'kevin.sucapuca', 'kevin.sucapuca@upeu.edu.pe', '$2a$10$DFZ1ZkgHKvcZTxC0Xw71FOoPGF5PMnqdQ.JQb8eBKfyZ97GsG2pR2', 'INTEGRANTE', 1, '2025-10-07 04:36:20', '2025-10-07 04:36:20', NULL),
(1193, 'jannys.navarro', 'jannys.navarro@upeu.edu.pe', '$2a$10$btGPXYalA3H9uK1kwKwxO.pgypTxdroIAGykGNTOJxQVVAEEmzJhe', 'INTEGRANTE', 1, '2025-10-07 04:36:20', '2025-10-07 04:36:20', NULL),
(1194, 'kevin.paricahua', 'kevin.paricahua@upeu.edu.pe', '$2a$10$IVhb66CXwNL/ujc.hJVvnOFwdjRTwOuyW4Og0NaLDNfwQAH/VXei.', 'INTEGRANTE', 1, '2025-10-07 04:36:20', '2025-10-07 04:36:20', NULL),
(1195, 'damaritd.mamani', 'damaritd.mamani@upeu.edu.pe', '$2a$10$p4SenmM0js74CF3..PSle.hS1FveG.74JjVSv/AHkR/A3E0m5Jqvu', 'INTEGRANTE', 1, '2025-10-07 04:36:20', '2025-10-07 04:36:20', NULL),
(1196, 'grover.huisa', 'grover.huisa@upeu.edu.pe', '$2a$10$L3EREqFE1Iq71BYVx7CaJuzZeVOFFAEcrLbWYaodrdP70l076Vzgq', 'INTEGRANTE', 1, '2025-10-07 04:36:21', '2025-10-07 04:36:21', NULL),
(1197, 'yohan.escarcena', 'yohan.escarcena@upeu.edu.pe', '$2a$10$OhvDvhKzPOxYSTkdWy8ApOeEo.kAD25/3Tg7r/HxdwbDV.nwmRY4.', 'INTEGRANTE', 1, '2025-10-07 04:36:21', '2025-10-07 04:36:21', NULL),
(1198, 'jose.huayta', 'Mamanijoss635@gmail.com', '$2a$10$LyRzCXafh3AWvDqs51eeyejKB5IeZZehPr3RWBslO7IVlCcKIFuKu', 'INTEGRANTE', 1, '2025-10-07 04:36:21', '2025-10-07 04:36:21', NULL),
(1199, 'yunior.quispe', 'yunior.quispe@upeu.edu.pe', '$2a$10$zVc5gHsvN3zl9wWMqLlcluRQPdLSQ92r0rVRS.1j0H7QAD92HD022', 'INTEGRANTE', 1, '2025-10-07 04:36:22', '2025-10-07 04:36:22', NULL),
(1200, 'santiago.bustamante', 'carlosbustamante8466@gmail.com', '$2a$10$dTWW/71pCc.prVJHfhpzxu9l7eWRkitBvl5bGg3pVr4hXI9BdlKwO', 'INTEGRANTE', 1, '2025-10-07 04:36:23', '2025-10-07 04:36:23', NULL),
(1201, 'nahuel.supo', 'yukyuel@gmail.com', '$2a$10$W3.kji9ubLxeLtf/UMkumeT4G02DDDLhE9Cx8.sPGdRWkpfIJbWk.', 'INTEGRANTE', 1, '2025-10-07 04:36:23', '2025-10-07 04:36:23', NULL),
(1202, 'edgar.naira', 'edgar.naira@upeu.edu.pe', '$2a$10$qS4NoL4V1WxH4z31Ow8d1.dFlLtn6WGvrZenkEurQ3ncaY7tvvVAC', 'INTEGRANTE', 1, '2025-10-07 04:36:23', '2025-10-07 04:36:23', NULL),
(1203, 'elvis.apaza.a', 'elvisjesusapazayucra17@gmail.com', '$2a$10$fzTHupm5ZDZ4S/HEZkmv5OGwcfCJUKjOS2hoZft5xaA/ZBv71KC5.', 'INTEGRANTE', 1, '2025-10-07 04:36:23', '2025-10-07 04:36:23', NULL),
(1204, 'rosa.torres.t', 'rosamariadelosangelestorres@gmail.com', '$2a$10$Dyi0Xc1ZketGAr2eqbcKvu4ILusmrYr.mYNvb37uHZI8IGosvsKby', 'INTEGRANTE', 1, '2025-10-07 04:36:24', '2025-10-07 04:36:24', NULL),
(1205, 'jack.paricela', 'paricela54@gmail.com', '$2a$10$IuRqz//FyO3j4kEZyQWvBuOdY5EvhBmF74Tbq/3s18HLhCKk9.eVm', 'INTEGRANTE', 1, '2025-10-07 04:36:24', '2025-10-07 04:36:24', NULL),
(1206, 'mizael.coaquira', 'mijhoelyurinscoaquirojuzto@gmail.com', '$2a$10$M6TBzIu16LVwkBrO7SjBXueTk1SMN8QVjFhXLAeIUx4OhHVyZb896', 'INTEGRANTE', 1, '2025-10-07 04:36:25', '2025-10-07 04:36:25', NULL),
(1207, 'julmer.quispe', 'julmer.quispe@upeu.edu.pe', '$2a$10$xkk4pIOaf7pQN20TaXwO3eooBoY3Nf3HzFArwry.GyyO/JO4BNpcK', 'INTEGRANTE', 1, '2025-10-07 04:36:25', '2025-10-07 04:36:25', NULL),
(1208, 'armando.mamani.p', 'jose.mamani@upeu.edu.pe', '$2a$10$iFxQ0lm4pBiPVzcgW/Tox.WhC1FiJe4oBaSzRjU8fykKSef3XiLNO', 'INTEGRANTE', 1, '2025-10-07 04:36:25', '2025-10-07 04:36:25', NULL),
(1209, 'royhuaricallo', 'royhuaricallo@upeu.edu.pe', '$2a$10$bTxi0PE6.MBBfs6sEat7F.sPlW0u0BMfF7ijlxQkaPMT3789C7fV.', 'INTEGRANTE', 1, '2025-10-07 04:36:26', '2025-10-07 04:36:26', NULL),
(1210, 'lanzelothvargas', 'lvargasmarichi@gmail.com', '$2a$10$Y5UclcfuuAJ2ZH9SBeYqjOdF1E/b0aad31vyewsO//GWsSdFbUnyS', 'INTEGRANTE', 1, '2025-10-07 04:36:26', '2025-10-07 04:36:26', NULL),
(1211, 'vladimir.quispe', 'vladimir.quispe@upeu.edu.pe', '$2a$10$7i.Id8Rhs3JjdyqXmt8UTeS574vGTBKxjdJnOKKPa.Xi48HLvBZim', 'INTEGRANTE', 1, '2025-10-07 04:36:26', '2025-10-07 04:36:26', NULL),
(1212, 'milagros.huanca', 'milagros.huanca@upeu.edu.pe', '$2a$10$gmRV8fONsSAMmQ.iwYUImu6mBy7qH4Azdi8C0www9pDxzyRVMWnrm', 'INTEGRANTE', 1, '2025-10-07 04:36:27', '2025-10-07 04:36:27', NULL),
(1213, 'alahin.ticona', 'alahinticona@gmail.com', '$2a$10$s85izaETQHTqIfGHNDJk..o4W/YaIG2vZLgDrngWIuAuqnIArdFni', 'INTEGRANTE', 1, '2025-10-07 04:36:27', '2025-10-07 04:36:27', NULL),
(1214, 'valente.quispe', 'rev15cpr@gmail.com', '$2a$10$kn.M5e6PtQ5fdElVIvw84enQ0Qcfrd4QZRvXDVrgF3oxqqcap.So2', 'INTEGRANTE', 1, '2025-10-07 04:36:27', '2025-10-07 04:36:27', NULL),
(1215, 'nilver.salcca', 'nilver.salcca@upeu.edu.pe', '$2a$10$PwaxAym72AkCD8U8wsetROnTDMD7FW5pp.o5xn2ZPuHLs4xks8nPm', 'INTEGRANTE', 1, '2025-10-07 04:36:28', '2025-10-07 04:36:28', NULL),
(1216, 'grimaldo.arredondo', 'grimaldoarredondomartinez@gmail.com', '$2a$10$UquorbcfLPUSdvmsW4fs8ujs4gFqGYgF.AuV05cwMeVAw0HToX5Ue', 'INTEGRANTE', 1, '2025-10-07 04:36:28', '2025-10-07 04:36:28', NULL),
(1217, 'josue.ochoa', 'josue.ochoa@upeu.edu.pe', '$2a$10$HGx4X6ophxQlItdaC2StGOv21LqUjldpfStfUPn35uSeuINZsiF3O', 'INTEGRANTE', 1, '2025-10-07 04:36:28', '2025-10-07 04:36:28', NULL),
(1218, 'david.romero', 'david.romero@upeu.edu.pe', '$2a$10$hZvw/NtJm1t4NwPlC.1oYuOnxr9uryDeIOdzBF/B.Qj76Ix4LoeHC', 'INTEGRANTE', 1, '2025-10-07 04:36:29', '2025-10-07 04:36:29', NULL),
(1219, 'joselyn.yucra', 'joselyn.yucra@upeu.edu.pe', '$2a$10$MivtzishW8ADjpwZqJKFwuCtFY5I8CjT5yQjCFVleScyjggOQx3T6', 'INTEGRANTE', 1, '2025-10-07 04:36:29', '2025-10-07 04:36:29', NULL),
(1220, 'leonardojesus.huaman.a', 'jesus.huaman181219@gmail.com', '$2a$10$UOzjFO9OgvqWZmjlaSFlVOuCQWEkkZ.s3Oplj0DYuzhbPtnWwlJlS', 'INTEGRANTE', 1, '2025-10-07 04:36:29', '2025-10-07 04:36:29', NULL),
(1221, 'harry.ascuna', 'bouncybobi64@gmail.com', '$2a$10$mJN2tou0j.YUsmvedTtdJe7bkq7ME/zAWtL.Llu5WuZ5yfKZG57HK', 'INTEGRANTE', 1, '2025-10-07 04:36:30', '2025-10-07 04:36:30', NULL),
(1222, 'raquel.coaquira', 'kantucoaquira@gmail.com', '$2a$10$Ma/0DrUvN7GaFm7iI5zOpOsbIUSvqYalphLZ.Pti0X/BpB7YgMf5K', 'INTEGRANTE', 1, '2025-10-07 04:36:30', '2025-10-07 04:36:30', NULL),
(1223, 'franck.coaquira', 'frankcoaquirajusto4@gmail.com', '$2a$10$nQC8AW0GVUVwwAThaGlz6.xEycokISW7ZuGtkV7V4J1xRsmCT.Ot.', 'INTEGRANTE', 1, '2025-10-07 04:36:30', '2025-10-07 04:36:30', NULL),
(1224, 'abdul.quispe', 'abdulalfonso77@gmail.com', '$2a$10$MK87LHodZe6PlyJRDftGEe9iJwe.XYCRjvTPMyMWpQHPctUjlew2a', 'INTEGRANTE', 1, '2025-10-07 04:36:30', '2025-10-07 04:36:30', NULL),
(1225, 'marco.chura', 'marcostefano123@gmail.com', '$2a$10$ClrBK8CglUCh8pQkOju8R.zPfV5qindSqNCxW3gZI2yy5A7h1W3Py', 'INTEGRANTE', 1, '2025-10-07 04:36:31', '2025-10-07 04:36:31', NULL),
(1226, 'nayder.arce', 'kioarce12@gmail.com', '$2a$10$GZ5jROj7ih8EaXHTovZ5yuQyD/Nh3RAjkOZ0261gs88bE8u2x0H/u', 'INTEGRANTE', 1, '2025-10-07 04:36:31', '2025-10-07 04:36:31', NULL),
(1227, 'jose.condo', 'josephmiguel1103@gmail.com', '$2a$10$uTYmQrER9S8EskrNIpnQCOlucKYMwVHKFD2KRGmulzWSQ4QTovA.S', 'INTEGRANTE', 1, '2025-10-07 04:36:31', '2025-10-07 04:36:31', NULL),
(1228, 'wilbert.mayta', 'maytawilbert168@gmail.com', '$2a$10$K0xJbcn2qN6mHBQt2omtGeYix0VCv9zIKupto7ExgtoIZy8j3GIiO', 'INTEGRANTE', 1, '2025-10-07 04:36:31', '2025-10-07 04:36:31', NULL),
(1229, 'renzo.juli.', 'renzo.juli@upeu.edu.pe', '$2a$10$deFRZEKXD45OT8AmboaXiuNdYyF60.1rZuRJSn53TP1DIlibhFkAG', 'INTEGRANTE', 1, '2025-10-07 04:36:32', '2025-10-07 04:36:32', NULL),
(1230, 'frank.ramos', 'frank.ramos@upeu.edu.pe', '$2a$10$4VwkWaj1Ua2XAjWEb2Kr7.hDBIZWADHDjcct7WyL3P7WXiX/vTXBe', 'INTEGRANTE', 1, '2025-10-07 04:36:32', '2025-10-07 04:36:32', NULL),
(1231, 'glenen.choquechambi', 'glenen.choquechambi@upeu.edu.pe', '$2a$10$CkWFTt4xV76M0nXIZA.WFOOfoINZcwOZ1S3CPA1IsQmIG7clAmOQW', 'INTEGRANTE', 1, '2025-10-07 04:36:32', '2025-10-07 04:36:32', NULL),
(1232, 'brayan.condori', 'brayanraulcondori@gmail.com', '$2a$10$J90P2Z8oHG2dEstogC8wTeRncBagmRSoYtfr7cHcF3H7mTgKL/a52', 'INTEGRANTE', 1, '2025-10-07 04:36:32', '2025-10-07 04:36:32', NULL),
(1233, 'humberto.ccollqque', 'humber23ch@gmail.com', '$2a$10$q4lfyCRxPJ.xa.NK/tzzdeIOplh5aCSKkXuPbdz.WzzuwH0TmiUAG', 'INTEGRANTE', 1, '2025-10-07 04:36:33', '2025-10-07 04:36:33', NULL),
(1234, 'nick.mayta', 'nicksaim69@gmail.com', '$2a$10$QFD2T7onL4PUpBViyHHzyeG1VgfHblZE17WMcn7QR2YzGUM5ZhvV2', 'INTEGRANTE', 1, '2025-10-07 04:36:33', '2025-10-07 04:36:33', NULL),
(1235, 'claudio.bustinza', 'guitarrapuno18@gmail.com', '$2a$10$ZXJqGrNmLf7wDv8RzhzH2Ok89JkmGcHK8e254Hn9eCHZkgEeG0IQ6', 'INTEGRANTE', 1, '2025-10-07 04:36:33', '2025-10-07 04:36:33', NULL),
(1236, 'jhan.ramos', 'jhanramos8888@gmail.com', '$2a$10$BkoujyXTthUg43/Yq1qeQOwgqvnXa7bXuuaRrLfwaQqSMgC0QYAiG', 'INTEGRANTE', 1, '2025-10-07 04:36:34', '2025-10-07 04:36:34', NULL),
(1237, 'joel.quispe.', 'jhon.13eleven@gmail.com', '$2a$10$iAW3HP5gc.nf3Uw4eBVYJuRNsx9eJldgr2npBSiGkwLYgskJs1tD6', 'INTEGRANTE', 1, '2025-10-07 04:36:34', '2025-10-07 04:36:34', NULL),
(1238, 'henyelrey.garcia', 'henyel91@gmail.com', '$2a$10$gufe19WNZIuoS.44CwJQe.RrkfXxexA6aKC5KCTi6dk648Wz9Xoeq', 'INTEGRANTE', 1, '2025-10-07 04:36:34', '2025-10-07 04:36:34', NULL),
(1239, 'celia.apaza', 'celia.apaza@upeu.edu.pe', '$2a$10$9Gqaa9X9zS09BpqM.Qzku.JJ4reElmFLFabJXif4qMxmVunjOzY.u', 'INTEGRANTE', 1, '2025-10-07 04:36:34', '2025-10-07 04:36:34', NULL),
(1240, 'jhenderson.machaca.', 'yenderson123tmr@gmail.com', '$2a$10$peAbVjtwPn5iteDpPs7ua.3JFknvNftbMkxraQNNj7czP.hFcu14O', 'INTEGRANTE', 1, '2025-10-07 04:36:35', '2025-10-07 04:36:35', NULL),
(1241, 'alex.coila', 'alex.coila@upeu.edu.pe', '$2a$10$/hjSI/.K.xWF2JlnRtGRqO.tBItA5dFHN6gt0VWFkL7vZB2eODdMm', 'INTEGRANTE', 1, '2025-10-07 04:36:35', '2025-10-07 04:36:35', NULL),
(1242, 'denilson.mamani', 'denilson.mamani@upeu.edu.pe', '$2a$10$1V1opZuNYjHz9AnBmsGOCupVSUplME0hN0gj1UKSUhBXTlgz.QWq.', 'INTEGRANTE', 1, '2025-10-07 04:36:35', '2025-10-07 04:36:35', NULL),
(1243, 'omarcondori', 'omarcondori@upeu.edu.pe', '$2a$10$kFsl3nb85d6VwYSKNGbXeO0ma62vTg7/1enPaB5V9gBwMTPXgdSLi', 'INTEGRANTE', 1, '2025-10-07 04:36:36', '2025-10-07 04:36:36', NULL),
(1244, 'fraykana', 'fraykana@upeu.edu.pe', '$2a$10$Lw//KUNSRghCpjiXiKKmEumX6lrr/m3k1EXGEoyyRwndGg5kOBSZC', 'INTEGRANTE', 1, '2025-10-07 04:36:36', '2025-10-07 04:36:36', NULL),
(1245, 'miguel.huayhua', 'miguel.huayhua@upeu.edu.pe', '$2a$10$QIhUVqkMWFiPyOFOXaU2COMi2BQNxY5oWc9mAqkj3JvbP96lR4Bxm', 'INTEGRANTE', 1, '2025-10-07 04:36:36', '2025-10-07 04:36:36', NULL),
(1246, 'jorge.gutierrrez', 'jorge.gutierrrez@upeu.edu.pe', '$2a$10$9zfqdDhdpGWeP5nUevyjquTWn817PsW8gkBPNopz7LI3hLTMtkQdu', 'INTEGRANTE', 1, '2025-10-07 04:36:37', '2025-10-07 04:36:37', NULL),
(1247, 'yomar.mamani', 'yomar.mamani@upeu.edu.pe', '$2a$10$Mx3S3wqNVMd8/7QY6b9nre/YKNtkHgM3fvw/HYfuXwZIjNvMs0cCu', 'INTEGRANTE', 1, '2025-10-07 04:36:37', '2025-10-07 04:36:37', NULL),
(1248, 'crhistian.chuquitarqui', 'crhistian.chuquitarqui@upeu.edu.pe', '$2a$10$CYj1/L1mQ2mwk59A6aQNxuV7m39.fj4MCD0UZ9KdSCmmY56JY5ism', 'INTEGRANTE', 1, '2025-10-07 04:36:37', '2025-10-07 04:36:37', NULL),
(1249, 'fernando.mamani.m', 'luisfernandomamanimamani456@gmail.com', '$2a$10$7kEs/pWFemrRF.nKb6BZx.O1JYmn5sSKm5ck7dvITiHE2kmOWWIN6', 'INTEGRANTE', 1, '2025-10-07 04:36:37', '2025-10-07 04:36:37', NULL),
(1250, 'jose.turpo.', 'jose.turpo.c@upeu.edu.pe', '$2a$10$gjYh1jy9Ues1rk02ecFQEuPCRBYgN0P1f5LmM7Csvmj0ziG9CfXiq', 'INTEGRANTE', 1, '2025-10-07 04:36:38', '2025-10-07 04:36:38', NULL),
(1251, 'yesenia.gutierrez', 'alejandraredfg3@gmail.com', '$2a$10$t04k8pmoYkQ4EdrL1YLb9uE1zGv5ArGF/TXgq8OPXRvR/ACQ2Ha76', 'INTEGRANTE', 1, '2025-10-07 04:36:38', '2025-10-07 04:36:38', NULL),
(1252, 'jaqueline.huahuaccapa', 'jaqueline.21623@gmail.com', '$2a$10$U.ZMaNbw/fgtLu/AWQosy.MvAx9hFMcX.siR8JsAb5o.endd5LfDS', 'INTEGRANTE', 1, '2025-10-07 04:36:38', '2025-10-07 04:36:38', NULL),
(1253, 'klubhert.cardenas', 'cardenascv590@gmail.com', '$2a$10$/ijbGG7q6g5shzqFGMtP5OZfVG0e9HMB.KAhBfchiR6PbPFB5UyHa', 'INTEGRANTE', 1, '2025-10-07 04:36:39', '2025-10-07 04:36:39', NULL),
(1254, 'jhosef.quispe', 'jhosefqh122@gmail.com', '$2a$10$XusdZJnwQlQBk555ioIQL.r9GSF5sXVF1EQsg77ESgzpacTYAtaxW', 'INTEGRANTE', 1, '2025-10-07 04:36:39', '2025-10-07 04:36:39', NULL),
(1255, 'elizabeth.flores.l', 'elizabeth.flores.l@upeu.edu.pe', '$2a$10$WWDi7lQj1kKrOhjaMdit/.pkCZhogyJsjW17..SRySoeOo8SH7Spi', 'INTEGRANTE', 1, '2025-10-07 04:36:39', '2025-10-07 04:36:39', NULL),
(1256, 'eberth.rosales', 'eberth.rosales@upeu.edu.pe', '$2a$10$OPOJfY9REl4oFj8fUac.fOM5J9nwajcV4kN7LL3kjPqMWsiq8seaW', 'INTEGRANTE', 1, '2025-10-07 04:36:40', '2025-10-07 04:36:40', NULL),
(1257, 'cristian.cabana', 'christcabana@gmail.com', '$2a$10$PEWAOpMZfGWhdAQxKqeyp.qjqZkdQwVahGxmlQmnYQUu1RFGjTJc.', 'INTEGRANTE', 1, '2025-10-07 04:36:40', '2025-10-07 04:36:40', NULL),
(1258, 'alberto.quilla', 'quillaluis501@gmail.com', '$2a$10$7tIfsESetX6aQzJcd3YTIOSFDqqehIj8iH9QFF4o8qqXyeeyHbIhC', 'INTEGRANTE', 1, '2025-10-07 04:36:41', '2025-10-07 04:36:41', NULL),
(1259, 'andres.montes', 'lmoplas0@gmail.com', '$2a$10$4r1XUjeSlFqwpzu71JYlROsmcHM2mJPGv31AXh85/.x3OsUkvfAnS', 'INTEGRANTE', 1, '2025-10-07 04:36:41', '2025-10-07 04:36:41', NULL),
(1260, 'fran.calizaya', 'fraserk599@gmail.com', '$2a$10$pwDH7aZIHZrfCf7wI7KVpe/TFTmBu4mYiL6njmMk7iftHKCjdVg6W', 'INTEGRANTE', 1, '2025-10-07 04:36:41', '2025-10-07 04:36:41', NULL),
(1261, 'david.yucra', 'david.yucra@upeu.edu.pe', '$2a$10$79Jg0tYbOM65bdhOGQOAxOBGgS.Cg3uAM80SMn2Ghoo3xkGKH4eq.', 'INTEGRANTE', 1, '2025-10-07 04:36:42', '2025-10-07 04:36:42', NULL),
(1262, 'gladys.yana', 'sincorreo@upeu.edu.pe', '$2a$10$yNUHEuQanRbgHJFt5AJ1H.3i3OHkP4/ceIXyiXT7cdcHb3XWz3GGG', 'INTEGRANTE', 1, '2025-10-07 04:36:42', '2025-10-07 04:36:42', NULL),
(1263, 'jherson.fernandez', 'jherson.fernandez.19@gmail.com', '$2a$10$IdxaUA0TDIr80p48vPq9NemTBOMlQMJ.fGgXY6uH3GQ/3YxZziVqW', 'INTEGRANTE', 1, '2025-10-07 04:36:43', '2025-10-07 04:36:43', NULL),
(1264, 'maykol.paredes', 'maykolaracayo22@gmail.com', '$2a$10$VCR/WqXGruAymComqp1ZCucpDoMMQ2fAeSvY35CSDArp3DM.Lw1FK', 'INTEGRANTE', 1, '2025-10-07 04:36:43', '2025-10-07 04:36:43', NULL),
(1265, 'jamil.zuniga', 'antonyj1082000@gmail.com', '$2a$10$KEVyrg1NIVHWUdX0NlWAfOh4eDXgTMMJdTaSCmUNTcSEEdj9vAzLy', 'INTEGRANTE', 1, '2025-10-07 04:36:44', '2025-10-07 04:36:44', NULL),
(1266, 'alessandro.mamani', 'alexkip159alex@gmail.com', '$2a$10$eqslSZuCKCJkPCxf5fblkO9qQJgeGGU0rgofCcwDVHBo.8l/0xbUG', 'INTEGRANTE', 1, '2025-10-07 04:36:44', '2025-10-07 04:36:44', NULL),
(1267, 'hiram.ccoto.', 'hiramjeremi.hariado@gmail.com', '$2a$10$ggCcFIslEIHBX87p0nbQgOw21VKDBgXzAxJgW7QplAxAkid.Qkgey', 'INTEGRANTE', 1, '2025-10-07 04:36:44', '2025-10-07 04:36:44', NULL),
(1268, 'fabrizio.sanchez.', 'fabrizio.sanchez.s@upeu.edu.pe', '$2a$10$S8Yg7TfxQfZLwjyEH6kLYe0vADHDYopLQ6ubPDXY9tw7EdiA1jInO', 'INTEGRANTE', 1, '2025-10-07 04:36:45', '2025-10-07 04:36:45', NULL),
(1269, 'hairton.apaza', 'jhoelhairton770@gmail.com', '$2a$10$GXzWyvHhjULw5HDzgc4bzeeIzzoMKDpctaZwy7GoeMgw3GVWJTqLy', 'INTEGRANTE', 1, '2025-10-07 04:36:45', '2025-10-07 04:36:45', NULL),
(1270, 'ana.cuba', 'melodyanita57@gmail.com', '$2a$10$dlIsJHpBMyFpL8C.KSfUTOKG/y27VpNxl8/eylU431goPKQX4vd/S', 'INTEGRANTE', 1, '2025-10-07 04:36:45', '2025-10-07 04:36:45', NULL),
(1271, 'paulponce', 'paulponce@upeu.edu.pe', '$2a$10$zFRHPMJTNYieTqt3Ox7QO.0VcKjH2Fzds5yi.hEClOuPY60IDqngq', 'INTEGRANTE', 1, '2025-10-07 04:36:48', '2025-10-07 04:36:48', NULL),
(1272, 'jhenscutipa', 'jhens.cutipa@upeu.edu.pe', '$2a$10$n.UoT2UTYgd3nYGuI7jOt.jvvBeTJfWv96JV4R34uttgAv/af8u02', 'INTEGRANTE', 1, '2025-10-07 04:36:49', '2025-10-07 04:36:49', NULL),
(1273, 'carlos_fc', 'jhancarlosf@gmail.com', '$2a$10$BvmQ8JWN7PdjxxfWrMnf4.NYNif3Jfk8VcfSyrtv5YRoLgIznbS2a', 'INTEGRANTE', 1, '2025-10-07 04:36:49', '2025-10-07 04:36:49', NULL),
(1274, 'ronaldyito', 'ronaldyitolopez@gmail.com', '$2a$10$FYKoMR5o6PJbPuyTxhahgOWipB2rkpXjftllG7IDtjat64BIyCa3i', 'INTEGRANTE', 1, '2025-10-07 04:36:49', '2025-10-07 04:36:49', NULL),
(1275, 'jose.ccoto', 'jose.ccoto@upeu.edu.pe', '$2a$10$FKh26M2sdivJJRp5J3NZIOc77YGq3zlDh4TJvdcGdHsxM645T2bi6', 'INTEGRANTE', 1, '2025-10-07 04:36:50', '2025-10-07 04:36:50', NULL),
(1276, 'henry.velasquez', 'henry.velasquez@upeu.edu.pe', '$2a$10$XXHp3cHl/dntZqHNFXu6NuQ0Y0Nzre6ta18.3hrQWd.TINZdp218G', 'INTEGRANTE', 1, '2025-10-07 04:36:50', '2025-10-07 04:36:50', NULL),
(1277, 'christian.salas', 'christian.salas@upeu.edu.pe', '$2a$10$YsS1582rsJbLNeh35C92heAYnOx8lhyxv.GwODV3i9WXBMa6xkmCW', 'INTEGRANTE', 1, '2025-10-07 04:36:51', '2025-10-07 04:36:51', NULL),
(1278, 'braynermamani', 'braynermamani@upeu.edu.pe', '$2a$10$v2D2Rc74mMsl8g7lh48ZyeBCCbCT4HnF5N3Kcb5caP7LWKJmsnIsG', 'INTEGRANTE', 1, '2025-10-07 04:36:51', '2025-10-07 04:36:51', NULL),
(1279, 'manuellazarte', 'JOSE_654987@HOTMAIL.COM', '$2a$10$6Xv/gC0wQQtrftFLxNYPUufYr/928Pg8LXT5pXNFL3NLwfDTDO73K', 'INTEGRANTE', 1, '2025-10-07 04:36:51', '2025-10-07 04:36:51', NULL),
(1280, 'guverccori', 'guverccori@upeu.edu.pe', '$2a$10$z9LTKvBztBzhXPfiblzCneOWrSEtUowdoWDh9XI/uERU2h1d0dTvO', 'INTEGRANTE', 1, '2025-10-07 04:36:52', '2025-10-07 04:36:52', NULL),
(1281, 'alexanderchucuya', 'alexanderchucuya@upeu.edu.pe', '$2a$10$7E4XQYnQ0.rOGeGkvuMzb.1mwhCvigFAZKZhAt8ljkp0UMpOTKu4C', 'INTEGRANTE', 1, '2025-10-07 04:36:52', '2025-10-07 04:36:52', NULL),
(1282, 'olger.infa', 'olger.infa@upeu.edu.pe', '$2a$10$g5X6.ZDHYodk6bFb5hH/k.BNRih1XG8rsiHgUrPQ8O8y8spYpVhwK', 'INTEGRANTE', 1, '2025-10-07 04:36:53', '2025-10-07 04:36:53', NULL),
(1283, 'mark.pino', 'mark.pino@upeu.edu.pe', '$2a$10$TK4p.aH5c1YdaOIyZIr/QOAw7x.EOKSezSK77TUW9EmafzhJ.vlIS', 'INTEGRANTE', 1, '2025-10-07 04:36:53', '2025-10-07 04:36:53', NULL),
(1284, 'jean.laura', 'jeanlaura@gmail.com', '$2a$10$weOhyl/ytdRkKpU91Dpjnua1m2CP5LEQw4yl6amui09849x7/IZue', 'INTEGRANTE', 1, '2025-10-07 04:36:53', '2025-10-07 04:36:53', NULL),
(1285, 'romel.gutierrez', 'romel.gutierrez@upeu.edu.pe', '$2a$10$1UuapQ6fnQjDu3.dv9f7MuyTXoQwasliWpeZuhe4En6iNE1qwtm8a', 'INTEGRANTE', 1, '2025-10-07 04:36:54', '2025-10-07 04:36:54', NULL),
(1286, 'gary.yunganina', 'gary.yunganina@upeu.edu.pe', '$2a$10$I0SKl0o6Jn9d9..bwJe00u0g0yn9jYt8VD5QzcwAoSWRr82iqRya2', 'INTEGRANTE', 1, '2025-10-07 04:36:54', '2025-10-07 04:36:54', NULL),
(1287, 'rafael.mamani.c', 'crmc2k04@gmail.com', '$2a$10$3Ckv2cLWWCSRvHjLGXOi4uwnU28zMXB8tElKx3U2ZwYfv5kprVWOa', 'INTEGRANTE', 1, '2025-10-07 04:36:54', '2025-10-07 04:36:54', NULL),
(1288, 'angello.sarmiento', 'anyelojhans@gmail.com', '$2a$10$6pCYt25YWTz6XxL4bv7lVOzzvwOg5V3SPWN1vggO9I8buxvgWVmZu', 'INTEGRANTE', 1, '2025-10-07 04:36:54', '2025-10-07 04:36:54', NULL),
(1289, 'alexander.chambi', 'alexander.chambi@upeu.edu.pe', '$2a$10$fWLPGwn3/3c.qVEMtmmSyuz2aHDrUGPrA0c2GZwInC6iG0PLNG6O6', 'INTEGRANTE', 1, '2025-10-07 04:36:55', '2025-10-07 04:36:55', NULL),
(1290, 'cristhian.llanque', 'cristhian.llanque@upeu.edu.pe', '$2a$10$QHkNtQPHOntlL4gngZ1Ab.DF1PknHyLBkP75p2u24HqWCSz64esn.', 'INTEGRANTE', 1, '2025-10-07 04:36:55', '2025-10-07 04:36:55', NULL),
(1291, 'katherine.aguirre', 'katherine23062004@gmail.com', '$2a$10$9rXG1MD6SHkISg.UWHbFA.Z..pwn/u78S8l5oFoLOOP2zMNdS/jQm', 'INTEGRANTE', 1, '2025-10-07 04:36:55', '2025-10-07 04:36:55', NULL),
(1292, 'ciromamani', 'cirot1813@gmail.com', '$2a$10$3YWYa14VyFp8EAS79UdrIukuaB4Sm3wHf3988ztnqi3niWM8jCCfa', 'INTEGRANTE', 1, '2025-10-07 04:36:56', '2025-10-07 04:36:56', NULL),
(1293, 'kevin.quispe', 'kevin.quispe@upeu.edu.pe', '$2a$10$ndk6VTwJkkZJdpMdKgWyo.YbywlqB26FnFgFB/bcvouEtcPdf2Mm6', 'INTEGRANTE', 1, '2025-10-07 04:36:56', '2025-10-07 04:36:56', NULL),
(1294, 'frans.paxi', 'frans.paxi@upeu.edu.pe', '$2a$10$Z3509DBTBEwHX/Oi.5hlVeEgtGD8Z3vo6ukEF.xC63CnUecIUrLn.', 'INTEGRANTE', 1, '2025-10-07 04:36:57', '2025-10-07 04:36:57', NULL),
(1295, 'erickson.quispe', 'ericksonraulquispechurata@gmail.com', '$2a$10$9.sv/kj30T.ROcqPgxBOxulvH9F4svKvmJRZb5mpxvQyzxRltvdXS', 'INTEGRANTE', 1, '2025-10-07 04:36:57', '2025-10-07 04:36:57', NULL),
(1296, 'gary.aguirre', 'gary.aguirre@upeu.edu.pe', '$2a$10$p4k3SV8o4eOxfvLxZz0nTOZ5MgS7R7DEpfcMJ2pwhZskJE96f8j/S', 'INTEGRANTE', 1, '2025-10-07 04:36:57', '2025-10-07 04:36:57', NULL),
(1297, 'angel.cc', 'cj_angel@outlook.com', '$2a$10$NGoyp7a7.LTNrxIhEV7lt.qpKHVT6s0PjYHmqX6nBMAtmu7Jw1Twy', 'INTEGRANTE', 1, '2025-10-07 04:36:58', '2025-10-07 04:36:58', NULL),
(1298, 'cristhian.ruelas', 'cristhian.ruelas@upeu.edu.pe', '$2a$10$15Zv8qqkqF/.4OHion7RXupl/3/XUnPIzI4J2Q3k2BnSc6rzlPkS6', 'INTEGRANTE', 1, '2025-10-07 04:36:58', '2025-10-07 04:36:58', NULL),
(1299, 'eduardo.yucra', 'eduardo.yucra.alexis@gmail.com', '$2a$10$pQbKYH6CsjBj7J0JFRV4met3fahY6gQuUMmEM72djPjiHlqkyBbmC', 'INTEGRANTE', 1, '2025-10-07 04:36:58', '2025-10-07 04:36:58', NULL),
(1300, 'darwincondori', 'darwincondorimamani@gmail.com', '$2a$10$UNsL85ySGSfTpFUHD.3gAOcbBqsGjwTSzSe3IhWj0jbm/ABBPPGQO', 'INTEGRANTE', 1, '2025-10-07 04:36:59', '2025-10-07 04:36:59', NULL),
(1301, 'christiansupo', 'christiansupo@upeu.edu.pe', '$2a$10$xcJKkjMhzgwHRJ1v8tudI.8lCtdJel8t5wBEULC5uY5udI6XHlhJK', 'INTEGRANTE', 1, '2025-10-07 04:36:59', '2025-10-07 04:36:59', NULL),
(1302, 'darwin.mamani', 'darwin.mamani@upeu.edu.pe', '$2a$10$lz7kSfa9hVq4jRT8a2qHSO.uEeDbaUc2rwNsRRiii6ixYrdjC0u1e', 'INTEGRANTE', 1, '2025-10-07 04:36:59', '2025-10-07 04:36:59', NULL),
(1303, 'daniel.quispe.a', 'daniel.quispe.a@upeu.edu.pe', '$2a$10$IzWt.Kmp.BMb2Ix95rgxaeWMBZNy8sLLb5yjVcpPoNHGTB5cL6rwS', 'INTEGRANTE', 1, '2025-10-07 04:37:00', '2025-10-07 04:37:00', NULL),
(1304, 'frank.choquehuanca', 'frank.choquehuanca@upeu.edu.pe', '$2a$10$/dvHmNMZraNKIzh9VjVrSOue4KQI2e981wFFSzSlNkkLkWji2tSDu', 'INTEGRANTE', 1, '2025-10-07 04:37:00', '2025-10-07 04:37:00', NULL),
(1305, 'marilyn.mamani', 'marilyn.mamani@upeu.edu.pe', '$2a$10$WGuf3uhtDArXCFyV7AFtsu6s63aLwIIm3Mo8Vh/apWWrD1suOpcda', 'INTEGRANTE', 1, '2025-10-07 04:37:00', '2025-10-07 04:37:00', NULL),
(1306, 'guino.yujra', 'guino.yujra@upeu.edu.pe', '$2a$10$27sskb4TdOgJoZdGwUTTL.T0uumwaGAnoTNtmPbVMYy6iYNRiQd.m', 'INTEGRANTE', 1, '2025-10-07 04:37:01', '2025-10-07 04:37:01', NULL),
(1307, 'marcos.valeriano', 'marcos.valeriano@hotmail.com', '$2a$10$/VQwrfiBdzFWV4IDmvvGvunP3F3VBbUpKK8DaEqA64gvxKb0puwYm', 'INTEGRANTE', 1, '2025-10-07 04:37:01', '2025-10-07 04:37:01', NULL),
(1308, 'gustavo.salluca', 'gustavo.salluca@upeu.edu.pe', '$2a$10$SBt2v.IsagUplYg0LxyJ0O91/Em9AExUnaCQK441K31cqMcz39HCe', 'INTEGRANTE', 1, '2025-10-07 04:37:02', '2025-10-07 04:37:02', NULL),
(1309, 'manuel.chunca', 'manuel.chunca@upeu.edu.pe', '$2a$10$xEeZhPrFYI4NvfHGHXcCmePWzP8t2zP7DF9xO9tBF16iP3DxMlKJa', 'INTEGRANTE', 1, '2025-10-07 04:37:02', '2025-10-07 04:37:02', NULL),
(1310, 'jhamil.apaza', 'jhamil.apaza@upeu.edu.pe', '$2a$10$asOglOgUFJ7hPJr4aph8XOORCzH40sczNRyg8u/C2soxeCgkDs3.O', 'INTEGRANTE', 1, '2025-10-07 04:37:02', '2025-10-07 04:37:02', NULL),
(1311, 'joselin.condori', 'joselin.condori@upeu.edu.pe', '$2a$10$dE.02wjVvYRWjrnM0b.QWeF2ce7l8CVduiPSRkQn0JDp/uAMmDr4u', 'INTEGRANTE', 1, '2025-10-07 04:37:03', '2025-10-07 04:37:03', NULL),
(1312, 'dan.condori', 'dan.condori@upeu.edu.pe', '$2a$10$/oyqU8e2XWtx13VnHPDX/.mV49NDRyPEt7Y6gWYS3Io/sgR6qE6Dm', 'INTEGRANTE', 1, '2025-10-07 04:37:03', '2025-10-07 04:37:03', NULL),
(1313, 'alex.zela', 'alex.zela@upeu.edu.pe', '$2a$10$cbbXhqSLyyg974wR0Zl0v.mDJc3xTnfyU66F4nBU21eGkqAdHjf3G', 'INTEGRANTE', 1, '2025-10-07 04:37:04', '2025-10-07 04:37:04', NULL),
(1314, 'dyana.pari', 'dyana.pari@upeu.edu.pe', '$2a$10$GXmDzjU8ZCyLBbH9Du8jOe.SwNDRh90.PVQC3tHTDC5R806XKoJgi', 'INTEGRANTE', 1, '2025-10-07 04:37:04', '2025-10-07 04:37:04', NULL),
(1315, 'daniel.aro', 'daniel.aro@upeu.edu.pe', '$2a$10$AmkevGHlK5XdIon2oawI9.la9Or5149MZ5f.URVHoycBiFb97LI7G', 'INTEGRANTE', 1, '2025-10-07 04:37:04', '2025-10-07 04:37:04', NULL),
(1316, 'junior.vilcapaza', 'junior.vilcapaza@upeu.edu.pe', '$2a$10$Kgb7fVFITlMdpXebuD179eLe5HvDYQqJDtQB/mDpOZsx8/h0gXhbu', 'INTEGRANTE', 1, '2025-10-07 04:37:05', '2025-10-07 04:37:05', NULL),
(1317, 'morelia.oblitas', 'morelia.oblitas@upeu.edu.pe', '$2a$10$bWy0aGT.Y.TidjT25xCZuOpedisS.xrAgf2.Gh.hwfTdmMj2ke0Zy', 'INTEGRANTE', 1, '2025-10-07 04:37:05', '2025-10-07 04:37:05', NULL),
(1318, 'frank.chunca', 'frank.chunca@upeu.edu.pe', '$2a$10$yV5Z/CItGMIMW6/2vh/mc.Pgq.DolBpTmizv7MzBDOIw/Ok8P.oN2', 'INTEGRANTE', 1, '2025-10-07 04:37:05', '2025-10-07 04:37:05', NULL),
(1319, 'luis.vilca', 'luis.vilca@upeu.edu.pe', '$2a$10$r/n7E1101tCGeA/uE2v44exDC8zY6GZUBb8QPt.nM.pGYj2g5/tSu', 'INTEGRANTE', 1, '2025-10-07 04:37:06', '2025-10-07 04:37:06', NULL),
(1320, 'rickisurco', 'rickisurco@upeu.edu.pe', '$2a$10$jWIZA3cOSPl2Ik3bx9Gmg.bTlqd70GiuGH3i8nqflhqWlNpBWPHFK', 'INTEGRANTE', 1, '2025-10-07 04:37:06', '2025-10-07 04:37:06', NULL);

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
  ADD KEY `fk_eventos_calendario_usuarios` (`creado_por`);

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
  MODIFY `id_evento_local` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `evento_asistentes`
--
ALTER TABLE `evento_asistentes`
  MODIFY `id_asistente` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

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
  MODIFY `id_usuario` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1321;

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
  ADD CONSTRAINT `fk_eventos_calendario_usuarios` FOREIGN KEY (`creado_por`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE;

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
