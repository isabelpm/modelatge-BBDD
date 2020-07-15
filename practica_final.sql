-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 15-07-2020 a las 13:26:42
-- Versión del servidor: 10.4.13-MariaDB
-- Versión de PHP: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `exercici_6_1`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clients`
--

CREATE TABLE `clients` (
  `id_ clients` int(11) NOT NULL,
  `nom` varchar(45) DEFAULT NULL,
  `adreça_CP` varchar(5) DEFAULT NULL,
  `telèfon` decimal(10,0) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `data registre` date DEFAULT NULL,
  `recomenat per` varchar(20) DEFAULT NULL,
  `treballador_id_venta_ulleres` int(11) DEFAULT NULL,
  `models_id_ ulleres` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `clients`
--

INSERT INTO `clients` (`id_ clients`, `nom`, `adreça_CP`, `telèfon`, `email`, `data registre`, `recomenat per`, `treballador_id_venta_ulleres`, `models_id_ ulleres`) VALUES
(1, 'Isabel Puig', '08023', '650719954', 'provant1@yahoo.es', '2020-02-12', 'Martin', 1, NULL),
(2, 'Maria Carmen', '09089', '666777555', 'provant23@gmail.com', '2020-07-15', 'Isabel Puig', 3, NULL),
(3, 'Martin Rayo', '09089', '666777576', 'provant_43@gmail.com', '2020-07-15', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marques`
--

CREATE TABLE `marques` (
  `id_ marques` int(11) NOT NULL,
  `proveïdor` varchar(45) DEFAULT NULL,
  `marca` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `marques`
--

INSERT INTO `marques` (`id_ marques`, `proveïdor`, `marca`) VALUES
(1, ' Franscisco SL', 'prada'),
(2, ' Franscisco SL', 'vogue'),
(3, ' Franscisco SL', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `models`
--

CREATE TABLE `models` (
  `id_ ulleres` int(11) NOT NULL,
  `marca` varchar(45) NOT NULL,
  `graduacio_esquerra` varchar(10) NOT NULL,
  `graduacio_dreta` varchar(10) NOT NULL,
  `tipus muntura` varchar(45) NOT NULL COMMENT 'Flotant, pasta o metàl·lica',
  `color vidre` varchar(45) NOT NULL,
  `preu` float NOT NULL,
  `marques_id_ marques` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveïdors`
--

CREATE TABLE `proveïdors` (
  `id_ proveïdors` int(11) NOT NULL,
  `nom` varchar(45) DEFAULT NULL COMMENT 'Contiene el nombre del proveidor',
  `adreça_carrer` varchar(45) DEFAULT NULL COMMENT 'Contiene la calle\\n',
  `adreça_número` varchar(45) DEFAULT NULL COMMENT 'Contiene el número\\n',
  `adreça_pis` varchar(45) DEFAULT NULL COMMENT 'Contiene el piso\\n',
  `adreça_porta` varchar(45) DEFAULT NULL COMMENT 'Contiene la puerta\\n',
  `adreça_ciutat` varchar(10) DEFAULT NULL COMMENT 'contiene la ciudad\\r\\n',
  `adreça_cp` varchar(5) DEFAULT NULL COMMENT 'contiene el código postal\\n',
  `adreça_pais` varchar(45) DEFAULT NULL COMMENT 'contiene el país\\n',
  `telèfon` varchar(9) DEFAULT NULL COMMENT 'contiene el teléfono\\n\\n',
  `fax` varchar(9) DEFAULT NULL COMMENT 'contiene el fax\\n',
  `nif` varchar(15) DEFAULT NULL COMMENT 'contiene el nif',
  `marques_id_ marques` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `proveïdors`
--

INSERT INTO `proveïdors` (`id_ proveïdors`, `nom`, `adreça_carrer`, `adreça_número`, `adreça_pis`, `adreça_porta`, `adreça_ciutat`, `adreça_cp`, `adreça_pais`, `telèfon`, `fax`, `nif`, `marques_id_ marques`) VALUES
(1, 'Francisco', 'carrer altafulla', '1', '1', '2', 'tarragona', '08013', 'espanya', '934567678', '934567679', 'G4563245', 1),
(2, 'Guttman', 'carrer riera', '3', '0', '3', 'barcelona', '08032', 'espanya', '934598578', '934598579', 'A4563655', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Treballadors`
--

CREATE TABLE `Treballadors` (
  `codTreballador` int(11) NOT NULL COMMENT 'informacio del treballador amb el codi\n',
  `nom treballor` varchar(45) DEFAULT NULL,
  `Venda_id_codvenda` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Treballadors`
--

INSERT INTO `Treballadors` (`codTreballador`, `nom treballor`, `Venda_id_codvenda`) VALUES
(1, 'Gisele', NULL),
(2, 'Josep', NULL),
(3, 'Maria', NULL),
(4, 'Isabel', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Venda`
--

CREATE TABLE `Venda` (
  `id_codvenda` int(11) NOT NULL COMMENT 'relació entre treballador i compra del client',
  `codTreballador` int(11) NOT NULL,
  `clients_id_ clients` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Venda`
--

INSERT INTO `Venda` (`id_codvenda`, `codTreballador`, `clients_id_ clients`) VALUES
(1, 2, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id_ clients`),
  ADD KEY `fk_clients_treballador_idx` (`treballador_id_venta_ulleres`),
  ADD KEY `fk_clients_models1_idx` (`models_id_ ulleres`);

--
-- Indices de la tabla `marques`
--
ALTER TABLE `marques`
  ADD PRIMARY KEY (`id_ marques`);

--
-- Indices de la tabla `models`
--
ALTER TABLE `models`
  ADD PRIMARY KEY (`id_ ulleres`),
  ADD KEY `fk_models_marques1_idx` (`marques_id_ marques`);

--
-- Indices de la tabla `proveïdors`
--
ALTER TABLE `proveïdors`
  ADD PRIMARY KEY (`id_ proveïdors`),
  ADD KEY `fk_proveïdors_marques_idx` (`marques_id_ marques`);

--
-- Indices de la tabla `Treballadors`
--
ALTER TABLE `Treballadors`
  ADD PRIMARY KEY (`codTreballador`),
  ADD KEY `fk_Treballadors_Venda1_idx` (`Venda_id_codvenda`);

--
-- Indices de la tabla `Venda`
--
ALTER TABLE `Venda`
  ADD PRIMARY KEY (`id_codvenda`),
  ADD KEY `idx_clients` (`id_codvenda`),
  ADD KEY `fk_Venda_clients1_idx` (`clients_id_ clients`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `proveïdors`
--
ALTER TABLE `proveïdors`
  MODIFY `id_ proveïdors` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `Treballadors`
--
ALTER TABLE `Treballadors`
  MODIFY `codTreballador` int(11) NOT NULL AUTO_INCREMENT COMMENT 'informacio del treballador amb el codi\n', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `Venda`
--
ALTER TABLE `Venda`
  MODIFY `id_codvenda` int(11) NOT NULL AUTO_INCREMENT COMMENT 'relació entre treballador i compra del client', AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `fk_clients_models1` FOREIGN KEY (`models_id_ ulleres`) REFERENCES `models` (`id_ ulleres`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `models`
--
ALTER TABLE `models`
  ADD CONSTRAINT `fk_models_marques1` FOREIGN KEY (`marques_id_ marques`) REFERENCES `marques` (`id_ marques`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `proveïdors`
--
ALTER TABLE `proveïdors`
  ADD CONSTRAINT `fk_proveïdors_marques` FOREIGN KEY (`marques_id_ marques`) REFERENCES `marques` (`id_ marques`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `Treballadors`
--
ALTER TABLE `Treballadors`
  ADD CONSTRAINT `fk_Treballadors_Venda1` FOREIGN KEY (`Venda_id_codvenda`) REFERENCES `Venda` (`id_codvenda`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `Venda`
--
ALTER TABLE `Venda`
  ADD CONSTRAINT `fk_Venda_clients1` FOREIGN KEY (`clients_id_ clients`) REFERENCES `clients` (`id_ clients`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
