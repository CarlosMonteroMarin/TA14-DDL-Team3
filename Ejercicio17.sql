create table ciclo(
codigo_int_ciclo int auto_increment primary key,
nombre varchar(20),
grado varchar (20));


create table aula(
id_aula int auto_increment primary key,
nombre varchar(20),
codigo int,
metros double);

create table asignaturas(
codigo_int_assig int auto_increment primary key,
codigo_europeo int,
nombre varchar(20),
codigo_interno2 int, 
id_aula int,
foreign key (codigo_interno2)
references asignaturas (codigo_int_assig)
on delete set null
on update cascade,
foreign key (id_aula)
references aula (id_aula)
on delete set null
on update cascade);

create table tiene(
codigo_int_assig int,
codigo_int_ciclo int,
primary key (codigo_int_ciclo, codigo_int_assig),
foreign key (codigo_int_assig)
references asignaturas (codigo_int_assig)
on delete cascade
on update cascade,
foreign key (codigo_int_ciclo)
references ciclo (codigo_int_ciclo)
on delete cascade
on update cascade);

create table profesor(
codigo_int_profesor int auto_increment primary key,
dni varchar(8),
nombre varchar (20),
direccion varchar (50),
telefono int,
email varchar (50),
n_seguridad_social int,
años_antiguedad double,
fecha_inicio date,
fecha_fin date,
codigo_int_assig int,
Foreign Key (codigo_int_assig)
References asignaturas (codigo_int_assig)
On Delete Set Null
On Update Cascade);



Create Table horario(
id_horario int auto_increment primary key,
hora date,
dia_semana varchar (15),
id_aula int,
codigo_int_profesor int,
Foreign Key (id_aula)
References aula (id_aula)
On Delete Set Null
On Update Cascade,
Foreign Key (codigo_int_profesor)
References profesor (codigo_int_profesor)
On Delete Set Null
On Update Cascade);



