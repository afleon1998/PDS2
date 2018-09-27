-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 12-04-2018 a las 02:22:48
-- Versión del servidor: 5.7.19
-- Versión de PHP: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `deserciones_sena`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asociacion_fichas_aprendices`
--

DROP TABLE IF EXISTS `asociacion_fichas_aprendices`;
CREATE TABLE IF NOT EXISTS `asociacion_fichas_aprendices` (
  `Id_Asociac_Ficha_Aprend` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Tipo_Documento` int(11) NOT NULL,
  `Id_Usuario` int(11) NOT NULL,
  `Id_Trimestre` int(11) NOT NULL,
  `Id_Asociac_Ficha_Instructor` int(11) NOT NULL,
  `Id_Ficha_Caracterizacion` int(11) NOT NULL,
  `Estado_Asoci_Aprend_Ficha` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Id_Asociac_Ficha_Aprend`,`Id_Tipo_Documento`,`Id_Usuario`,`Id_Trimestre`,`Id_Asociac_Ficha_Instructor`,`Id_Ficha_Caracterizacion`),
  KEY `id_tipo_Documento` (`Id_Tipo_Documento`),
  KEY `id_usuario` (`Id_Usuario`),
  KEY `id_trimestre` (`Id_Trimestre`),
  KEY `id_asociac_Ficha_Instructor` (`Id_Asociac_Ficha_Instructor`),
  KEY `id_ficha_caracterizacion` (`Id_Ficha_Caracterizacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asociacion_fichas_instructores`
--

DROP TABLE IF EXISTS `asociacion_fichas_instructores`;
CREATE TABLE IF NOT EXISTS `asociacion_fichas_instructores` (
  `Id_asociac_Ficha_Instructor` int(11) NOT NULL AUTO_INCREMENT,
  `Id_tipo_Documento` int(11) NOT NULL,
  `Id_Usuario` int(11) NOT NULL,
  `Id_Trimestre` int(11) NOT NULL,
  `Estado_Asoci_Instruc_Ficha` varchar(15) DEFAULT NULL,
  `Id_Ficha_Caracterizacion` int(11) NOT NULL,
  PRIMARY KEY (`Id_asociac_Ficha_Instructor`,`Id_tipo_Documento`,`Id_Usuario`,`Id_Trimestre`,`Id_Ficha_Caracterizacion`),
  KEY `id_tipo_documento` (`Id_tipo_Documento`),
  KEY `id_usuario` (`Id_Usuario`),
  KEY `id_Trimestre` (`Id_Trimestre`),
  KEY `id_Ficha_Caracterizacion` (`Id_Ficha_Caracterizacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `competencias`
--

DROP TABLE IF EXISTS `competencias`;
CREATE TABLE IF NOT EXISTS `competencias` (
  `Id_Competencia` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Progra_Forma` int(11) NOT NULL,
  `Version_Competencia` int(20) DEFAULT NULL,
  `Nombre_Competencia` varchar(150) DEFAULT NULL,
  `Codigo_Competencia` int(15) DEFAULT NULL,
  `Denomicacion_Competencia` varchar(100) DEFAULT NULL,
  `Id_Trimestre` int(11) NOT NULL,
  `Estado_Competencia` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Id_Competencia`,`Id_Progra_Forma`,`Id_Trimestre`),
  KEY `id_Progra_Forma` (`Id_Progra_Forma`),
  KEY `id_Trimestre` (`Id_Trimestre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fichas_caracterizacion`
--

DROP TABLE IF EXISTS `fichas_caracterizacion`;
CREATE TABLE IF NOT EXISTS `fichas_caracterizacion` (
  `Id_Ficha_Caracterizacion` int(11) NOT NULL AUTO_INCREMENT,
  `Numero_Ficha_Formacion` int(15) DEFAULT NULL,
  `Id_Progra_Forma` int(11) NOT NULL,
  `Id_Jornada` int(11) NOT NULL,
  `Estado_Ficha` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Id_Ficha_Caracterizacion`,`Id_Progra_Forma`,`Id_Jornada`),
  KEY `id_Progra_Forma` (`Id_Progra_Forma`),
  KEY `id_jornada` (`Id_Jornada`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jornadas`
--

DROP TABLE IF EXISTS `jornadas`;
CREATE TABLE IF NOT EXISTS `jornadas` (
  `Id_Jornada` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_Jornada` varchar(9) DEFAULT NULL,
  `Descripcion_Jornada` varchar(50) DEFAULT NULL,
  `Estado_Jornada` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Id_Jornada`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `justificaciones`
--

DROP TABLE IF EXISTS `justificaciones`;
CREATE TABLE IF NOT EXISTS `justificaciones` (
  `Id_Justificacion` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo_Justificacion` varchar(30) DEFAULT NULL,
  `Id_Ficha_Caracterizacion` int(11) NOT NULL,
  `Archivo_Justificacion` longblob,
  `Id_Registro_Asis` int(11) NOT NULL,
  `Fecha_Presentacion_Justificacion` datetime DEFAULT NULL,
  `Id_Usuario` int(11) NOT NULL,
  `Estado_Justificacion` varchar(20) DEFAULT NULL,
  `Id_Asociac_Ficha_Instructor` int(11) NOT NULL,
  PRIMARY KEY (`Id_Justificacion`,`Id_Ficha_Caracterizacion`,`Id_Registro_Asis`,`Id_Usuario`),
  KEY `Id_Ficha_Caracterizacion` (`Id_Ficha_Caracterizacion`),
  KEY `Id_Usuario` (`Id_Usuario`),
  KEY `id_Registro_Asis` (`Id_Registro_Asis`),
  KEY ` Justificaciones_ibfk_2` (`Id_Asociac_Ficha_Instructor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programas_formacion`
--

DROP TABLE IF EXISTS `programas_formacion`;
CREATE TABLE IF NOT EXISTS `programas_formacion` (
  `Id_Progra_Forma` int(11) NOT NULL AUTO_INCREMENT,
  `Codigo_Programa` int(15) DEFAULT NULL,
  `Nombre_Programa` varchar(100) DEFAULT NULL,
  `Version_Programa` int(20) DEFAULT NULL,
  `Denominacion_Programa` varchar(100) DEFAULT NULL,
  `Estado_Programa_Formacion` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Id_Progra_Forma`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_alerta_desercion`
--

DROP TABLE IF EXISTS `registro_alerta_desercion`;
CREATE TABLE IF NOT EXISTS `registro_alerta_desercion` (
  `Id_Desercion` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Tipo_Documento` int(11) NOT NULL,
  `Id_Usuario` int(11) NOT NULL,
  `Mensaje` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`Id_Desercion`,`Id_Tipo_Documento`,`Id_Usuario`),
  KEY `Id_tipo_Documento` (`Id_Tipo_Documento`),
  KEY `id_Usuario` (`Id_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_llamado_asistencia`
--

DROP TABLE IF EXISTS `registro_llamado_asistencia`;
CREATE TABLE IF NOT EXISTS `registro_llamado_asistencia` (
  `Id_Registro_Asis` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Progra_Forma` int(11) NOT NULL,
  `Id_Ficha_Caracterizacion` int(11) NOT NULL,
  `Id_Usuario` int(11) NOT NULL,
  `Falla` varchar(5) DEFAULT NULL,
  `Id_Jornada` int(11) NOT NULL,
  `Fecha_Falla` datetime DEFAULT NULL,
  `Id_Asociac_Ficha_Instructor` int(11) NOT NULL,
  PRIMARY KEY (`Id_Registro_Asis`,`Id_Progra_Forma`,`Id_Ficha_Caracterizacion`,`Id_Usuario`,`Id_Jornada`),
  KEY `id_progra_forma` (`Id_Progra_Forma`),
  KEY `id_Ficha_Caracterizacion` (`Id_Ficha_Caracterizacion`),
  KEY `id_usuario` (`Id_Usuario`),
  KEY `id_Jornada` (`Id_Jornada`),
  KEY `Registro_Llamado_Asistencia_ibfk_5` (`Id_Asociac_Ficha_Instructor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id_rol` int(11) NOT NULL AUTO_INCREMENT,
  `Rol` varchar(15) DEFAULT NULL,
  `Descripcion_Rol` varchar(20) DEFAULT NULL,
  `Estado_Rol` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `Rol`, `Descripcion_Rol`, `Estado_Rol`) VALUES
(1, 'AP', 'Aprendiz', 'A'),
(2, 'LA', 'Lider de Area', 'A'),
(3, 'IN', 'Instructor', 'A'),
(4, 'EN', 'eNFERMERA', 'a');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_documentos`
--

DROP TABLE IF EXISTS `tipos_documentos`;
CREATE TABLE IF NOT EXISTS `tipos_documentos` (
  `Id_Tipo_Documento` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo_Documento` varchar(8) DEFAULT NULL,
  `Descripcion_Tipo_Documento` varchar(50) DEFAULT NULL,
  `Estado_Tipo_Documento` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Id_Tipo_Documento`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipos_documentos`
--

INSERT INTO `tipos_documentos` (`Id_Tipo_Documento`, `Tipo_Documento`, `Descripcion_Tipo_Documento`, `Estado_Tipo_Documento`) VALUES
(1, 'CC', 'Cedula de Ciudadania', 'A'),
(2, 'TI', 'Tarjeta de Identidad', 'A'),
(3, 'CE', 'Cedula de Extranjeria', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trimestres`
--

DROP TABLE IF EXISTS `trimestres`;
CREATE TABLE IF NOT EXISTS `trimestres` (
  `Id_Trimestre` int(11) NOT NULL AUTO_INCREMENT,
  `Numero_Trimestre` int(6) DEFAULT NULL,
  `Id_Jornada` int(11) NOT NULL,
  `Descripcion_Trimestre` varchar(30) DEFAULT NULL,
  `Estado_Trimestre` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Id_Trimestre`,`Id_Jornada`),
  KEY `Id_Jornada` (`Id_Jornada`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `Id_Usuario` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Tipo_Documento` int(11) NOT NULL,
  `Id_Rol` int(11) NOT NULL,
  `Numero_Documento` varchar(20) DEFAULT NULL,
  `Primer_Nombre` varchar(20) DEFAULT NULL,
  `Segundo_Nombre` varchar(20) DEFAULT NULL,
  `Primer_Apellido` varchar(20) DEFAULT NULL,
  `Segundo_Apellido` varchar(20) DEFAULT NULL,
  `Correo_Electronico` varchar(50) DEFAULT NULL,
  `Contraseña` varchar(30) DEFAULT NULL,
  `Contraseña_Encriptada` varchar(100) DEFAULT NULL,
  `Estado_Usuario` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Id_Usuario`,`Id_Tipo_Documento`,`Id_Rol`),
  KEY `Id_Tipo_Documento` (`Id_Tipo_Documento`),
  KEY `Id_Rol` (`Id_Rol`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asociacion_fichas_aprendices`
--
ALTER TABLE `asociacion_fichas_aprendices`
  ADD CONSTRAINT `Asociacion_Fichas_Aprendices_ibfk_1` FOREIGN KEY (`Id_Usuario`) REFERENCES `usuarios` (`Id_Usuario`),
  ADD CONSTRAINT `Asociacion_Fichas_Aprendices_ibfk_2` FOREIGN KEY (`Id_Trimestre`) REFERENCES `trimestres` (`Id_Trimestre`),
  ADD CONSTRAINT `Asociacion_Fichas_Aprendices_ibfk_3` FOREIGN KEY (`Id_Ficha_Caracterizacion`) REFERENCES `fichas_caracterizacion` (`Id_Ficha_Caracterizacion`),
  ADD CONSTRAINT `Asociacion_Fichas_Aprendices_ibfk_4` FOREIGN KEY (`Id_Asociac_Ficha_Instructor`) REFERENCES `asociacion_fichas_instructores` (`Id_asociac_Ficha_Instructor`);

--
-- Filtros para la tabla `asociacion_fichas_instructores`
--
ALTER TABLE `asociacion_fichas_instructores`
  ADD CONSTRAINT `Asociacion_Fichas_Instructores_ibfk_1` FOREIGN KEY (`Id_Usuario`) REFERENCES `usuarios` (`Id_Usuario`),
  ADD CONSTRAINT `Asociacion_Fichas_Instructores_ibfk_2` FOREIGN KEY (`Id_Trimestre`) REFERENCES `trimestres` (`Id_Trimestre`),
  ADD CONSTRAINT `Asociacion_Fichas_Instructores_ibfk_3` FOREIGN KEY (`Id_Ficha_Caracterizacion`) REFERENCES `fichas_caracterizacion` (`Id_Ficha_Caracterizacion`);

--
-- Filtros para la tabla `competencias`
--
ALTER TABLE `competencias`
  ADD CONSTRAINT `competencias_ibfk_1` FOREIGN KEY (`Id_Progra_Forma`) REFERENCES `programas_formacion` (`Id_Progra_Forma`),
  ADD CONSTRAINT `competencias_ibfk_2` FOREIGN KEY (`Id_Trimestre`) REFERENCES `trimestres` (`Id_Trimestre`);

--
-- Filtros para la tabla `fichas_caracterizacion`
--
ALTER TABLE `fichas_caracterizacion`
  ADD CONSTRAINT `Fichas_Caracterizacion_ibfk_1` FOREIGN KEY (`Id_Progra_Forma`) REFERENCES `programas_formacion` (`Id_Progra_Forma`),
  ADD CONSTRAINT `Fichas_Caracterizacion_ibfk_2` FOREIGN KEY (`Id_Jornada`) REFERENCES `jornadas` (`Id_Jornada`);

--
-- Filtros para la tabla `justificaciones`
--
ALTER TABLE `justificaciones`
  ADD CONSTRAINT ` Justificaciones_ibfk_2` FOREIGN KEY (`Id_Asociac_Ficha_Instructor`) REFERENCES `asociacion_fichas_instructores` (`Id_asociac_Ficha_Instructor`),
  ADD CONSTRAINT `Justificaciones_ibfk_1` FOREIGN KEY (`Id_Registro_Asis`) REFERENCES `registro_llamado_asistencia` (`Id_Registro_Asis`);

--
-- Filtros para la tabla `registro_alerta_desercion`
--
ALTER TABLE `registro_alerta_desercion`
  ADD CONSTRAINT `registro_alerta_desercion_ibfk_1` FOREIGN KEY (`Id_Usuario`) REFERENCES `registro_llamado_asistencia` (`Id_Registro_Asis`);

--
-- Filtros para la tabla `registro_llamado_asistencia`
--
ALTER TABLE `registro_llamado_asistencia`
  ADD CONSTRAINT `Registro_Llamado_Asistencia_ibfk_1` FOREIGN KEY (`Id_Progra_Forma`) REFERENCES `programas_formacion` (`Id_Progra_Forma`),
  ADD CONSTRAINT `Registro_Llamado_Asistencia_ibfk_2` FOREIGN KEY (`Id_Ficha_Caracterizacion`) REFERENCES `fichas_caracterizacion` (`Id_Ficha_Caracterizacion`),
  ADD CONSTRAINT `Registro_Llamado_Asistencia_ibfk_3` FOREIGN KEY (`Id_Usuario`) REFERENCES `usuarios` (`Id_Usuario`),
  ADD CONSTRAINT `Registro_Llamado_Asistencia_ibfk_4` FOREIGN KEY (`Id_Jornada`) REFERENCES `jornadas` (`Id_Jornada`),
  ADD CONSTRAINT `Registro_Llamado_Asistencia_ibfk_5` FOREIGN KEY (`Id_Asociac_Ficha_Instructor`) REFERENCES `asociacion_fichas_instructores` (`Id_asociac_Ficha_Instructor`);

--
-- Filtros para la tabla `trimestres`
--
ALTER TABLE `trimestres`
  ADD CONSTRAINT `Trimestres_ibfk_1` FOREIGN KEY (`Id_Jornada`) REFERENCES `jornadas` (`Id_Jornada`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`Id_Rol`) REFERENCES `roles` (`id_rol`),
  ADD CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`Id_Tipo_Documento`) REFERENCES `tipos_documentos` (`Id_Tipo_Documento`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
