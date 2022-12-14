CREATE TABLE compra (
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
fecha DATE NOT NULL,
valor DOUBLE NOT NULL
);

CREATE TABLE inmueble (
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
metros DOUBLE NOT NULL,
descripcion VARCHAR(255),
direccion VARCHAR(100)
);

CREATE TABLE piso (
codigo_piso INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
inmueble INT,
FOREIGN KEY (inmueble)
REFERENCES inmueble (id)
ON DELETE SET NULL
ON UPDATE CASCADE
);

CREATE TABLE garaje (
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
inmueble INT,
numero INT,
planta INT,
piso INT,
FOREIGN KEY (inmueble)
REFERENCES inmueble (id)
ON DELETE SET NULL
ON UPDATE CASCADE,
FOREIGN KEY (piso)
REFERENCES piso (codigo_piso)
ON DELETE SET NULL
ON UPDATE CASCADE
);

CREATE TABLE recinto (
id INT NOT NULL PRIMARY KEY,
uso VARCHAR(100),
servicio VARCHAR(100),
FOREIGN KEY (id)
REFERENCES inmueble (id)
ON DELETE CASCADE
ON UPDATE CASCADE
);

CREATE TABLE persona (
dni VARCHAR(9) NOT NULL PRIMARY KEY,
nombre VARCHAR(15) NOT NULL,
apellidos VARCHAR(30) NOT NULL,
tlf_fijo INT,
movil INT,
codigo_interno INT NOT NULL
);

CREATE TABLE alquiler (
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
nombre VARCHAR(15),
codigo INT,
metros DOUBLE NOT NULL,
persona VARCHAR(9) NOT NULL,
FOREIGN KEY (persona)
REFERENCES persona (dni)
);

CREATE TABLE pago (
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
mes VARCHAR(10) NOT NULL,
valor DOUBLE NOT NULL,
alquiler INT NOT NULL,
FOREIGN KEY (alquiler)
REFERENCES alquiler (id)
ON DELETE CASCADE
ON UPDATE CASCADE
);

CREATE TABLE comprar (
id_compra INT NOT NULL,
id_inmueble INT NOT NULL,
dni VARCHAR(9) NOT NULL,
FOREIGN KEY (id_compra)
REFERENCES compra (id)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (id_inmueble)
REFERENCES inmueble (id)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (dni)
REFERENCES persona (dni)
ON DELETE CASCADE
ON UPDATE CASCADE
);

CREATE TABLE alquila (
id_alquiler INT NOT NULL,
id_inmueble INT NOT NULL,
dni VARCHAR(9) NOT NULL,
FOREIGN KEY (id_alquiler)
REFERENCES alquiler (id)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (id_inmueble)
REFERENCES inmueble (id)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (dni)
REFERENCES persona (dni)
ON DELETE CASCADE
ON UPDATE CASCADE
);