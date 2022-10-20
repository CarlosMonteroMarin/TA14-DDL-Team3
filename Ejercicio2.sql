CREATE TABLE estudiantes(
dni_estudiante VARCHAR(8) NOT NULL PRIMARY KEY,
direccion VARCHAR(50),
nombre VARCHAR(20),
telefono INT,
edad int);

CREATE TABLE empresa(
cif VARCHAR(15) NOT NULL PRIMARY KEY,
nombre VARCHAR(20),
telefono INT,
direccion VARCHAR(50));

CREATE  TABLE trabaja(
cif VARCHAR(15) NOT NULL,
dni_estudiante VARCHAR (8) NOT NULL,
PRIMARY KEY (cif, dni_estudiante),
FOREIGN KEY (cif)
REFERENCES empresa(cif)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (dni_estudiante)
REFERENCES estudiantes(dni_estudiante)
ON DELETE CASCADE
ON UPDATE CASCADE);


CREATE TABLE cursos(
codigo_curso INT AUTO_INCREMENT PRIMARY KEY,
programa VARCHAR(30),
fecha_inicio DATE,
fecha_fin DATE,
numero_curso INT);

CREATE TABLE profesores(
dni_profesor VARCHAR(8) NOT NULL PRIMARY KEY,
nombre VARCHAR(30),
apellidos VARCHAR(50),
direccion VARCHAR(50),
telefono INT,
codigo_curso INT,
FOREIGN KEY (codigo_curso)
REFERENCES cursos(codigo_curso)
ON DELETE SET NULL
ON UPDATE CASCADE);

CREATE TABLE cursan(
dni_profesor VARCHAR(8) NOT NULL,
codigo_curso INT NOT NULL,
PRIMARY KEY (dni_profesor, codigo_curso),
FOREIGN KEY (dni_profesor)
REFERENCES profesores (dni_profesor)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (codigo_curso)
REFERENCES cursos (codigo_curso)
ON DELETE CASCADE
ON UPDATE CASCADE);