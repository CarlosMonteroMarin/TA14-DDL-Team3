create table usuario(
id_usuario int auto_increment not null primary key,
contraseña varchar(10),
nombre varchar(10),
apellidos varchar(50),
email varchar(100),
foto varchar(255) comment 'meter codigo url'
);

create table telefono(
numero int not null primary key,
id_usuario int,
foreign key (id_usuario)
references usuario(id_usuario)
on delete cascade on update cascade
);

create table escribir(
id_escribe int not null,
id_escrito int not null,
primary key(id_escribe,id_escrito),
foreign key (id_escribe)
references usuario(id_usuario)
on delete cascade on update cascade,
foreign key (id_escrito)
references usuario(id_usuario)
on delete cascade on update cascade
);

create table seguir(
id_sigue int not null,
id_seguido int not null,
primary key(id_sigue,id_seguido),
foreign key (id_sigue)
references usuario(id_usuario)
on delete cascade on update cascade,
foreign key (id_seguido)
references usuario(id_usuario)
on delete cascade on update cascade
);

create table post(
id_post int auto_increment not null primary key,
descripcion varchar(255),
max_caracteres int,
id_usuario int,
foreign key (id_usuario)
references usuario(id_usuario)
on delete cascade on update cascade
);

create table reaccionar(
id_usuario int not null,
id_post int not null,
primary key (id_usuario,id_post),
foreign key (id_usuario)
references usuario(id_usuario)
on delete cascade on update cascade,
foreign key (id_post)
references post(id_post)
on delete cascade on update cascade
);

create table compartir(
id_usuario int not null,
id_post int not null,
primary key (id_usuario,id_post),
foreign key (id_usuario)
references usuario(id_usuario)
on delete cascade on update cascade,
foreign key (id_post)
references post(id_post)
on delete cascade on update cascade
);

create table comentar(
id_usuario int not null,
id_post int not null,
primary key (id_usuario,id_post),
foreign key (id_usuario)
references usuario(id_usuario)
on delete cascade on update cascade,
foreign key (id_post)
references post(id_post)
on delete cascade on update cascade
);