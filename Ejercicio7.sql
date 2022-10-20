create table departamento(
id_departamento int auto_increment not null primary key,
nombre varchar(10)
);

create table empleado(
dni varchar(9) not null unique,
n_ss int unique,
id_trabajador int auto_increment not null primary key,
nombre varchar(8),
apellidos varchar(50),
direccion varchar(100),
telefono int,
id_departamento int,
dni_responsable varchar(9),
foreign key (id_departamento)
references departamento(id_departamento)
on delete set null
on update cascade,
foreign key (dni_responsable)
references empleado(dni)
on delete set null on update cascade
);

create table contrato(
id_contrato int auto_increment not null primary key,
fecha_inicial date,
fecha_final date,
categoria varchar(10),
dni_empleado varchar(9),
foreign key (dni_empleado)
references empleado(dni)
on delete no action on update cascade
);

create table nomina (
id_nomina int auto_increment not null primary key,
fecha date,
salario double,
id_contrato int,
foreign key (id_contrato)
references contrato(id_contrato)
on delete cascade on update cascade
);
