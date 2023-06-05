CREATE DATABASE new_app;
-- DROP database new_app;
CREATE USER 'usuarioapp' @'localhost' IDENTIFIED BY 'pass1234';
GRANT ALL PRIVILEGES ON new_app.* TO 'usuarioapp' @'localhost' WITH
GRANT OPTION;
use new_app;
CREATE TABLE usuarios (
  id_usuario INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL,
  apellido VARCHAR(255) NOT NULL,
  contraseña VARCHAR(255) NOT NULL,
  zona_horaria TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
  genero ENUM('M', 'F') NOT NULL,
  telefono VARCHAR(255) NOT NULL
);
INSERT INTO usuarios (nombre, apellido, contraseña, genero, telefono)
VALUES ('Juan', 'Pérez', 'contraseña1', 'M', '123456789'),
  (
    'María',
    'González',
    'contraseña2',
    'F',
    '987654321'
  ),
  (
    'Pedro',
    'Rodríguez',
    'contraseña3',
    'M',
    '111111111'
  ),
  ('Ana', 'López', 'contraseña4', 'F', '222222222'),
  (
    'Lucas',
    'Martínez',
    'contraseña5',
    'M',
    '333333333'
  ),
  (
    'Laura',
    'Fernández',
    'contraseña6',
    'F',
    '444444444'
  ),
  (
    'Santiago',
    'Gómez',
    'contraseña7',
    'M',
    '555555555'
  ),
  (
    'Carla',
    'Sánchez',
    'contraseña8',
    'F',
    '666666666'
  );
-- SET SQL_SAFE_UPDATES = 0;
-- SET SQL_SAFE_UPDATES = 1;
UPDATE usuarios
SET zona_horaria = CONVERT_TZ(zona_horaria, '+2:00', '+3:00');
SElECT *
FROM usuarios;
CREATE TABLE ingresos (
  id_ingreso INT AUTO_INCREMENT PRIMARY KEY,
  id_usuario INT NOT NULL,
  fecha_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
  FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);
INSERT INTO ingresos (id_usuario)
VALUES (1),
  (2),
  (3),
  (4),
  (5),
  (6),
  (7),
  (8);
SElECT *
FROM ingresos;
CREATE TABLE Contactos (
  id_contacto INT AUTO_INCREMENT PRIMARY KEY,
  id_usuario INT,
  numero_telefono VARCHAR(20),
  correo_electronico VARCHAR(100)
);
SELECT *
FROM Contactos;
-- DROP TABLE contactos;
ALTER TABLE Contactos
ADD CONSTRAINT fk_contactos_usuarios FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario);