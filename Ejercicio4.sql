create table guerra(
nombre varchar(30) not null primary key,
año_inicio date,
año_fin date
);

create table bando(
nombre varchar(20) not null primary key,
ganador boolean
);

create table participan(
nombre_guerra varchar(30) not null,
nombre_bando varchar (20) not null,
primary key (nombre_guerra, nombre_bando),
foreign key (nombre_guerra)
references guerra(nombre)
on delete cascade on update cascade,
foreign key (nombre_bando)
references bando(nombre)
on delete cascade on update cascade
);

create table pais (
nombre varchar (20) not null primary key,
año_entrada date,
año_salida date,
nombre_bando varchar(20),
foreign key (nombre_bando)
references bando(nombre)
on delete set null on update cascade
);

create table tiempo_independencia (
id_pais int auto_increment not null primary key,
fecha_inicio date,
fecha_fin date,
nombre_pais varchar(20),
foreign key (nombre_pais)
references pais(nombre)
on delete cascade
on update cascade
);
