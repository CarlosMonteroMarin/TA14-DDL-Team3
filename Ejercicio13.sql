create table empleado(
dni varchar(9) not null primary key,
nombre varchar(10),
apellidos varchar(50),
numero_ss int,
telefono_fijo int,
telefono_movil int
);

create table cocinero(
dni varchar(9) not null primary key,
años_servicio double,
fecha_inicio date,
foreign key (dni)
references empleado(dni)
on delete cascade on update cascade
);

create table pinche(
dni varchar(9) not null primary key,
fecha_nacimiento date,
dni_cocinero varchar(9),
foreign key (dni)
references empleado(dni)
on delete cascade on update cascade,
foreign key (dni_cocinero)
references cocinero(dni)
on delete set null on update cascade
);

create table plato (
nombre varchar(20) not null primary key,
precio double,
tipo_plato varchar(10)
);

create table cocina(
dni_cocinero varchar(9) not null,
nombre_plato varchar(10) not null,
primary key (dni_cocinero,nombre_plato),
foreign key (dni_cocinero)
references cocinero(dni)
on delete cascade on update cascade,
foreign key (nombre_plato)
references plato(nombre)
on delete cascade on update cascade
);

create table ingrediente(
nombre varchar(10) not null primary key,
cantidad int not null
);

create table gasta(
nombre_plato varchar(20) not null,
nombre_ingrediente varchar(10) not null,
cantidad_usada int,
primary key (nombre_plato, nombre_ingrediente),
foreign key (nombre_plato)
references plato(nombre)
on delete cascade on update cascade,
foreign key (nombre_ingrediente)
references ingrediente(nombre)
on delete cascade on update cascade
);

create table almacen(
id_almacen int auto_increment not null primary key,
nombre varchar(10),
descripcion varchar(255)
);

create table almacena (
nombre_ingrediente varchar(10) not null,
id_almacen int not null,
primary key(nombre_ingrediente, id_almacen),
foreign key (nombre_ingrediente)
references ingrediente(nombre)
on delete cascade on update cascade,
foreign key (id_almacen)
references almacen(id_almacen)
on delete cascade on update cascade
);

create table estanteria(
id int auto_increment not null primary key,
tamaño double,
id_almacen int,
foreign key (id_almacen)
references almacen(id_almacen)
on delete cascade on update cascade
);