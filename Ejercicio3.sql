CREATE TABLE comunidad_autonoma (
nombre VARCHAR(50) NOT NULL PRIMARY KEY,
poblacion INT,
superficie DOUBLE
);

CREATE TABLE provincia (
codigo_postal INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
poblacion INT,
superficie DOUBLE,
nombre CHAR(50),
comunidad_autonoma CHAR(50),
FOREIGN KEY (comunidad_autonoma)
REFERENCES comunidad_autonoma (nombre)
ON DELETE SET NULL
ON UPDATE CASCADE
);

CREATE TABLE localidad (
nombre VARCHAR(50) NOT NULL PRIMARY KEY,
poblacion INT,
comunidad_autonoma CHAR(50),
provincia INT,
capital_provincia INT, 
FOREIGN KEY (comunidad_autonoma)
REFERENCES comunidad_autonoma (nombre)
ON DELETE SET NULL
ON UPDATE CASCADE,
FOREIGN KEY (provincia)
REFERENCES provincia (codigo_postal)
ON DELETE SET NULL
ON UPDATE CASCADE,
FOREIGN KEY (capital_provincia)
REFERENCES provincia (codigo_postal)
ON DELETE SET NULL
ON UPDATE CASCADE
);