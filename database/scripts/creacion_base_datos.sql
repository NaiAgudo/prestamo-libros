-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-06-2024 a las 18:56:50
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
--
-- Base de datos: `bancolibros`
--
-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `alumnos`
--
CREATE TABLE `alumnos` (
  `nie` varchar(10) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellidos` varchar(255) NOT NULL,
  `tramo` varchar(2) NOT NULL DEFAULT '0' COMMENT '0 nada, I tramo I y II Tramo 2',
  `bilingue` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0 True, 1 false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `alumnoscrusoslibros`
--
CREATE TABLE `alumnoscrusoslibros` (
  `nie` varchar(10) NOT NULL,
  `curso` varchar(255) NOT NULL,
  `isbn` varchar(20) NOT NULL,
  `fecha_entrega` date NOT NULL,
  `fecha_devolucion` date NOT NULL,
  `estado` varchar(1) NOT NULL DEFAULT 'P' COMMENT 'P: Prestado, D:Devuelto'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `cursos`
--
CREATE TABLE `cursos` (
  `curso` varchar(20) NOT NULL,
  `nivel` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `libros`
--
CREATE TABLE `libros` (
  `isbn` varchar(20) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `autor` varchar(255) NOT NULL,
  `numero_ejemplares` int(5) NOT NULL,
  `id_materia` int(11) NOT NULL,
  `id_curso` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `materias`
--
CREATE TABLE `materias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `departamento` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
--
-- Índices para tablas volcadas
--
--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`nie`);
--
-- Indices de la tabla `alumnoscrusoslibros`
--
ALTER TABLE `alumnoscrusoslibros`
  ADD PRIMARY KEY (`nie`,`curso`,`isbn`),
  ADD KEY `isbn` (`isbn`),
  ADD KEY `curso` (`curso`);
--
-- Indices de la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`curso`);
--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`isbn`),
  ADD KEY `FK_Materias` (`id_materia`),
  ADD KEY `FK_Cursos` (`id_curso`) USING BTREE;
--
-- Indices de la tabla `materias`
--
ALTER TABLE `materias`
  ADD PRIMARY KEY (`id`);
-- Restricciones para tablas volcadas
--
--
-- Filtros para la tabla `alumnoscrusoslibros`
--
ALTER TABLE `alumnoscrusoslibros`
  ADD CONSTRAINT `alumnoscrusoslibros_ibfk_1` FOREIGN KEY (`isbn`) REFERENCES `libros` (`isbn`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `alumnoscrusoslibros_ibfk_2` FOREIGN KEY (`nie`) REFERENCES `alumnos` (`nie`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `alumnoscrusoslibros_ibfk_3` FOREIGN KEY (`curso`) REFERENCES `cursos` (`curso`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Filtros para la tabla `libros`
--
ALTER TABLE `libros`
  ADD CONSTRAINT `fk_libros_cursos` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`curso`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_libros_materias` FOREIGN KEY (`id_materia`) REFERENCES `materias` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */; 
