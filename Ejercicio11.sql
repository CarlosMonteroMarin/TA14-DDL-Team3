CREATE TABLE accidente_geografico(
id_accidente INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(20),
coor_x DOUBLE,
coor_y DOUBLE);

CREATE TABLE lago(
id_accidente int,
extension INT,
FOREIGN KEY (id_accidente)
REFERENCES accidente_geografico (id_accidente)
ON DELETE SET NULL
ON UPDATE CASCADE);

CREATE TABLE montaña(
id_accidente int,
altura INT,
FOREIGN KEY (id_accidente)
REFERENCES accidente_geografico (id_accidente)
ON DELETE SET NULL
ON UPDATE CASCADE);

CREATE TABLE rio(
id_accidente int,
longitud INT,
FOREIGN KEY (id_accidente)
REFERENCES accidente_geografico (id_accidente)
ON DELETE SET NULL
ON UPDATE CASCADE);


CREATE TABLE pais(
nombre_pais VARCHAR(20) NOT NULL PRIMARY KEY,
extension INT,
poblacion INT);

CREATE TABLE localidad(
nombre_localidad VARCHAR(20) NOT NULL PRIMARY KEY,
nombre_pais varchar(20),
FOREIGN KEY (nombre_pais)
REFERENCES pais (nombre_pais)
ON DELETE SET NULL
ON UPDATE CASCADE);

CREATE TABLE pasar(
id_accidente INT,
nombre_localidad VARCHAR(20),
PRIMARY KEY (id_accidente, nombre_localidad),
FOREIGN KEY (id_accidente)
REFERENCES rio (id_accidente)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (nombre_localidad)
REFERENCES localidad (nombre_localidad)
ON DELETE CASCADE
ON UPDATE CASCADE);

CREATE table ubicado(
id_accidente INT,
nombre_pais VARCHAR(20),
PRIMARY KEY (id_accidente, nombre_pais),
FOREIGN KEY (id_accidente)
REFERENCES accidente_geografico (id_accidente)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (nombre_pais)
REFERENCES pais (nombre_pais)
ON DELETE CASCADE
ON UPDATE CASCADE);

