CREATE TABLE almacen(
numero_almacen INT AUTO_INCREMENT PRIMARY KEY,
descripcion VARCHAR(255),
direccion varchar(50));

CREATE TABLE estanteria(
numero_estanteria VARCHAR(3) NOT NULL PRIMARY KEY,
nombre VARCHAR (20),
numero_almacen INT,
FOREIGN KEY (numero_almacen)
REFERENCES almacen (numero_almacen)
ON DELETE SET NULL
ON UPDATE CASCADE);

CREATE TABLE almacena(
numero_almacen INT,
numero_estanteria VARCHAR(3),
PRIMARY KEY (numero_almacen, numero_estanteria),
FOREIGN KEY (numero_almacen)
REFERENCES almacen (numero_almacen)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (numero_estanteria)
REFERENCES estanteria (numero_estanteria)
ON DELETE CASCADE
ON UPDATE CASCADE);

CREATE TABLE tipo_pieza(
letras_tipo_pieza VARCHAR(5) NOT NULL PRIMARY KEY,
descripcion VARCHAR(255));


CREATE TABLE pieza(
letra_pieza VARCHAR(5) NOT NULL PRIMARY KEY,
numero int,
cantidad int,
precio double,
letras_tipo_pieza VARCHAR(5),
FOREIGN KEY (letras_tipo_pieza)
REFERENCES tipo_pieza (letras_tipo_pieza)
ON DELETE SET NULL
ON UPDATE CASCADE);

CREATE TABLE se_compone(
letra_pieza VARCHAR(5),
letra_pieza_compuesta VARCHAR (5),
cantidad int,
PRIMARY KEY (letra_pieza, letra_pieza_compuesta),
FOREIGN KEY (letra_pieza)
REFERENCES pieza (letra_pieza)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (letra_pieza_compuesta)
REFERENCES pieza (letra_pieza)
ON DELETE CASCADE
ON UPDATE CASCADE);
 


