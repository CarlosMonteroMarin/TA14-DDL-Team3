CREATE TABLE celebridad(
dni VARCHAR(8) NOT NULL PRIMARY KEY,
nombre varchar (30),
apellidos VARCHAR (50),
numero_ss int,
telefono_fijo int);

CREATE TABLE usuario(
id_usuario INT auto_increment primary key,
contraseña VARCHAR(30),
telefono int,
nombre varchar(30),
apellidos varchar (30),
email varchar(50),
foto blob, 
celebridad boolean,
dni VARCHAR(8),
FOREIGN KEY (dni)
REFERENCES celebridad (dni)
ON DELETE SET NULL
ON UPDATE CASCADE);

CREATE TABLE bloquear(
id_usuario int,
id_usuario_bloqueado int,
PRIMARY KEY (id_usuario, id_usuario_bloqueado),
FOREIGN KEY (id_usuario)
REFERENCES usuario (id_usuario)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (id_usuario_bloqueado)
REFERENCES usuario (id_usuario)
ON DELETE CASCADE
ON UPDATE CASCADE);


CREATE TABLE contacto(
id_contacto INT auto_increment PRIMARY KEY,
nombre varchar(20),
comentario varchar(255),
id_usuario int,
FOREIGN KEY (id_usuario)
REFERENCES usuario (id_usuario)
ON DELETE CASCADE
ON UPDATE CASCADE);

CREATE TABLE grupo(
id_grupo int auto_increment primary key,
nombre varchar(20),
id_usuario int,
FOREIGN KEY (id_usuario)
REFERENCES usuario (id_usuario)
ON DELETE CASCADE
ON UPDATE CASCADE);

CREATE TABLE formado_por(
id_grupo int,
id_contacto int,
PRIMARY KEY (id_grupo, id_contacto),
FOREIGN KEY (id_grupo)
REFERENCES grupo (id_grupo)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (id_contacto)
REFERENCES contacto (id_contacto)
ON DELETE CASCADE
ON UPDATE CASCADE);
