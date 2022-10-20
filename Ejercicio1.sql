create table socio (
codigo_socio int auto_increment not null primary key,
dni varchar(9),
direccion varchar(100),
telefono int,
nombre nvarchar(8),
apellidos nvarchar(50)
);

create table libro(
isbn varchar(10) not null primary key,
titulo nvarchar(50),
editorial nvarchar (100),
año_escritura date,
año_edicion date,
editorial_editora nvarchar (100)
);

create table autores(
id_autores int auto_increment not null primary key,
autor nvarchar(8)
);

create table volumen(
id_volumen int auto_increment not null primary key,
deteriorado boolean,
isbn varchar(10),
foreign key (isbn)
references libro(isbn)
on delete cascade
on update cascade
);

create table prestamo(
id_prestamo int auto_increment not null primary key,
nombre nvarchar(20),
fecha_prestamo date,
fecha_devolucion date,
fecha_max date,
codigo_socio int,
id_volumen int,
foreign key (codigo_socio)
references socio(codigo_socio)
on delete set null
on update cascade,
foreign key (id_volumen)
references volumen(id_volumen)
on delete set null
on update cascade
);

alter table prestamo
add constraint fecha_max check (fecha_max=fecha_prestamo+15);


create table escribe(
isbn varchar(10) not null,
id_autor int not null,
primary key (isbn, id_autor),
foreign key (isbn)
references libro(isbn)
on delete cascade
on update cascade,
foreign key (id_autor)
references autores(id_autores)
on delete cascade 
on update cascade
);