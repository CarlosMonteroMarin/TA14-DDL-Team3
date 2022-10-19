CREATE TABLE empresa (
cif VARCHAR(9) NOT NULL PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
direccion VARCHAR(30) NOT NULL,
telefono INT NOT NULL,
codigo_interno INT NOT NULL
);

CREATE TABLE proyecto (
id_proyecto INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
fecha_inicio DATE,
fecha_finalizacion DATE,
fecha_prevista_finalizar DATE,
empresa VARCHAR(9) NOT NULL,
FOREIGN KEY (empresa)
REFERENCES empresa (cif)
ON DELETE CASCADE
ON UPDATE CASCADE
);

CREATE TABLE trabajador (
dni VARCHAR(9) NOT NULL PRIMARY KEY,
nombre VARCHAR(15) NOT NULL,
apellidos VARCHAR(30) NOT NULL,
codigo_trabajador INT NOT NULL
);

CREATE TABLE profesion (
id_profesion INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
nombre VARCHAR(15) NOT NULL
);

CREATE TABLE trabaja (
id_proyecto INT NOT NULL,
dni VARCHAR(9) NOT NULL,
horas_trabajadas INT,
PRIMARY KEY (id_proyecto, dni),
FOREIGN KEY (id_proyecto)
REFERENCES proyecto (id_proyecto)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (dni)
REFERENCES trabajador (dni)
ON DELETE CASCADE
ON UPDATE CASCADE
);

CREATE TABLE ejerce_de (
dni VARCHAR(9) NOT NULL,
id_profesion INT NOT NULL,
PRIMARY KEY (dni, id_profesion),
FOREIGN KEY (dni)
REFERENCES trabajador (dni)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (id_profesion)
REFERENCES profesion (id_profesion)
ON DELETE CASCADE
ON UPDATE CASCADE
);