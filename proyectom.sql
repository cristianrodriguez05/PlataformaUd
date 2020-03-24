create database proyecto;
use proyecto;

CREATE TABLE `puntajes` (
  `id` int(11) NOT NULL,
  `usuario` varchar(100) NOT NULL,
  `puntaje` int(10) NOT NULL,
  `juego` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `juegos` (
  `id` int(11) NOT NULL,
  `nombreJuego` varchar(100) NOT NULL,
  `veces` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `usuario` varchar(100) NOT NULL,
  `pass` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `puntajes`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `puntajes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `juegos`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `juegos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
  

INSERT INTO `usuarios` (`id`, `nombre`, `apellido`, `usuario`, `pass`) VALUES
(1, 'Alejandro', 'Daza', 'alejandrodaza', 'clave');
INSERT INTO `juegos` (`id`, `nombreJuego`, `veces`) VALUES
(1, 'Asteroids', 0),
(2, 'LaLlonrona', 0),
(3, 'Trex', 0),
(4, 'Buscaminas', 0);

