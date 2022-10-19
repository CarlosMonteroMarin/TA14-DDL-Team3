CREATE TABLE socio (
codigo_socio VARCHAR(8) NOT NULL PRIMARY KEY,
dni VARCHAR(9) NOT NULL,
direccion VARCHAR(30) NOT NULL,
telefono INT NOT NULL,
nombre VARCHAR(15) NOT NULL,
apellidos VARCHAR(50) NOT NULL
);

CREATE TABLE prestamo (
id_prestamo INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
nombre VARCHAR(15) NOT NULL,
fecha_prestamo DATE NOT NULL,
fecha_maxima_devolucion DATE NOT NULL,
fecha_devolucion DATE NOT NULL,
socio VARCHAR(8),
FOREIGN KEY (socio)
REFERENCES socio (codigo_socio)
ON DELETE SET NULL
ON UPDATE CASCADE
);

CREATE TABLE articulo (
id_articulo INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
nombre VARCHAR(15) NOT NULL,
año_obra DATE NOT NULL,
deterioro BOOLEAN NOT NULL,
descripcion_deterioro VARCHAR(100)
);

CREATE TABLE pelicula (
id_articulo INT NOT NULL PRIMARY KEY,
duracion DOUBLE NOT NULL,
FOREIGN KEY (id_articulo)
REFERENCES articulo (id_articulo)
ON DELETE CASCADE
ON UPDATE CASCADE
);

CREATE TABLE cd (
id_articulo INT NOT NULL PRIMARY KEY,
numero_canciones INT NOT NULL,
FOREIGN KEY (id_articulo)
REFERENCES articulo (id_articulo)
ON DELETE CASCADE
ON UPDATE CASCADE
);

CREATE TABLE libro (
id_articulo INT NOT NULL PRIMARY KEY,
numero_paginas INT NOT NULL,
FOREIGN KEY (id_articulo)
REFERENCES articulo (id_articulo)
ON DELETE CASCADE
ON UPDATE CASCADE
);

CREATE TABLE autor (
id_autor INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
nombre VARCHAR(15),
pais VARCHAR(15)
);

CREATE TABLE presta (
id_prestamo INT NOT NULL,
id_articulo INT NOT NULL,
PRIMARY KEY (id_prestamo, id_articulo),
FOREIGN KEY (id_prestamo)
REFERENCES prestamo (id_prestamo)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (id_articulo)
REFERENCES articulo (id_articulo)
ON DELETE CASCADE
ON UPDATE CASCADE
);

CREATE TABLE escribe (
id_autor INT NOT NULL,
id_articulo INT,
PRIMARY KEY (id_autor, id_articulo),
FOREIGN KEY (id_autor)
REFERENCES autor (id_autor)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (id_articulo)
REFERENCES articulo (id_articulo)
ON DELETE CASCADE
ON UPDATE CASCADE
);

