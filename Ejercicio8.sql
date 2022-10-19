CREATE TABLE cliente(
dni_cliente VARCHAR (8) NOT NULL PRIMARY KEY,
nombre VARCHAR(30),
apellidos VARCHAR(30),
direccion VARCHAR(30),
telefono int,
tarjeta_credito int);

CREATE TABLE reserva(
id_reserva int auto_increment primary key,
fecha_reserva date,
dni_cliente VARCHAR (8),
FOREIGN KEY (dni_cliente)
REFERENCES cliente (dni_cliente)
ON DELETE SET NULL
ON UPDATE CASCADE);

CREATE TABLE tarjeta_embarque(
id_tarjeta_embarque int auto_increment primary key);


CREATE TABLE obtiene (
dni_cliente VARCHAR(8),
id_reserva INT,
id_tarjeta_embarque INT,
PRIMARY KEY (dni_cliente, id_reserva, id_tarjeta_embarque),
FOREIGN KEY (dni_cliente)
REFERENCES cliente (dni_cliente)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (id_reserva)
REFERENCES reserva (id_reserva)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (id_tarjeta_embarque)
REFERENCES tarjeta_embarque (id_tarjeta_embarque)
ON DELETE CASCADE
ON UPDATE CASCADE);


CREATE TABLE avion(
id_avion INT AUTO_INCREMENT PRIMARY KEY,
fecha_inicial date,
fecha_final date,
categoria VARCHAR(25));

CREATE TABLE asiento(
id_asiento INT AUTO_INCREMENT PRIMARY KEY,
fila INT,
columna INT, 
planta int, 
id_tarjeta_embarque INT,
id_avion INT,
FOREIGN KEY (id_tarjeta_embarque)
REFERENCES tarjeta_embarque (id_tarjeta_embarque)
ON DELETE SET NULL
ON UPDATE CASCADE,
FOREIGN KEY (id_avion)
REFERENCES avion (id_avion)
ON DELETE SET NULL
ON UPDATE CASCADE);

CREATE TABLE aeropuerto(
id_aeropuerto INT auto_increment primary key,
pais VARCHAR (15),
nombre VARCHAR (30),
localidad VARCHAR (30));

CREATE TABLE vuelo(
id_vuelo INT AUTO_INCREMENT PRIMARY KEY,
fecha_salida date,
fecha_llegada date,
id_avion INT,
id_aeropuerto_desp INT,
id_aeropuerto_aterr INT,
FOREIGN KEY (id_avion)
REFERENCES avion (id_avion)
ON DELETE SET NULL
ON UPDATE CASCADE,
FOREIGN KEY (id_aeropuerto_desp)
REFERENCES aeropuerto (id_aeropuerto)
ON DELETE SET NULL
ON UPDATE CASCADE,
FOREIGN KEY (id_aeropuerto_aterr)
REFERENCES aeropuerto (id_aeropuerto)
ON DELETE SET NULL
ON UPDATE CASCADE);





