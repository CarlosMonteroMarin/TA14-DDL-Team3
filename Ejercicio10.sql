create table estadio(
nombre varchar(20) not null primary key,
año_creacion date
);

create table partido(
id_partido int auto_increment not null primary key,
nombre varchar(20),
poblacion varchar(10)
);

create table arbitro(
dni varchar(9) not null primary key,
nombre varchar(10),
apellidos varchar(50)
);

create table arbitra(
id_partido int,
dni_arbitro varchar(9),
primary key (id_partido,dni_arbitro),
foreign key (id_partido)
references partido(id_partido)
on delete cascade on update cascade,
foreign key (dni_arbitro)
references arbitro(dni)
on delete cascade on update cascade
);

create table equipo (
nombre varchar(10) not null primary key,
año_creacion date,
nombre_estadio varchar(20),
foreign key (nombre_estadio)
references estadio(nombre)
on delete set null on update cascade
);

create table juega(
nombre_equipo varchar(10) not null,
nombre_estadio varchar(20) not null,
id_partido int not null,
primary key (nombre_equipo, nombre_estadio, id_partido),
foreign key (nombre_equipo)
references equipo(nombre)
on delete cascade on update cascade,
foreign key (nombre_estadio)
references estadio(nombre)
on delete cascade on update cascade,
foreign key (id_partido)
references partido(id_partido)
on delete cascade on update cascade
);

create table entrenador(
dni varchar(9) not null primary key,
nombre varchar(10),
apellidos varchar(50),
nombre_equipo varchar(10),
foreign key (nombre_equipo)
references equipo(nombre)
on delete set null on update cascade
);

create table jugador(
dni varchar(9) not null primary key,
nombre varchar(10),
apellidos varchar(50),
nombre_equipo varchar(10),
foreign key (nombre_equipo)
references equipo(nombre)
on delete set null on update cascade
);

create table ficha_estadistica(
id_estadistica int auto_increment not null primary key,
goles int,
faltas int,
minutos_jugados double,
dni_jugador varchar(9),
foreign key (dni_jugador)
references jugador(dni)
on delete cascade on update cascade
);