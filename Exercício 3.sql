create database exercicio_3;
use exercicio_3;

create table autor(
	RA int not null,
	nome_pseudonome varchar(30) not null,
	primary key(RA)
);

create table livro(
	id_livro int not null auto_increment,
	titulo varchar (20) not null,
	genero varchar(15),
	data_publicacao date,
	id_editora int,
	primary key(id_livro),
	foreign key(id_editora) references editora(id_editora)
);

create table editora(
	id_editora int not null auto_increment,
	email varchar(30) not null,
	cep int(10),
	telefone varchar(15),
	primary key(id_editora)
);

create table autor_faz_livro(
	id_autor_livro int not null auto_increment,
	RA_autor int,
	id_livro int,
	primary key(id_autor_livro),
	foreign key(RA_autor) references autor(RA),
	foreign key(id_livro) references livro(id_livro)
);

insert into autor values
	(98231033, 'Lucas'),
    (78640148, 'Flor flamejante'),
    (28197562, 'Thiago');
        
insert into editora values
	(default, 'Jpedinho12@.....', 22989821, '93018-4510'),
    (default, 'Foidebase@.....', 13426781, '97658-1233');

insert into livro values
    (default, 'Sherlock Holmes', 'Mistério', '1800/03/05', 2),
    (default, 'Percy Jackson', 'Fantasia', '1997/08/15', 1);
    
insert into autor_faz_livro values
	(default, 28197562, 2),
	(default, 78640148, 1),
	(default, 98231033, 1);

select * from autor;
select * from editora;
select * from livro;
select * from autor_faz_livro;

select a.RA, a.nome_pseudonome, l.titulo, l.genero, l.data_publicacao from autor as a join autor_faz_livro as al join livro as l
on al.RA_autor = a.RA and al.id_livro = l.id_livro;