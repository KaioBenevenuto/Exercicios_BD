create database exercicio_2;
use exercicio_2;

create table diretor(
	id_diretor int not null auto_increment,
	id_departamento int,
	nome varchar (30) not null,
	email varchar(30) not null,
    telefone varchar(15),
	primary key (id_diretor),
	foreign key (id_departamento) references departamento(id_departamento)
);

create table departamento(
	id_departamento int not null auto_increment,
	nome_departamento varchar(30) not null,
    telefone varchar(15),
    primary key (id_departamento)
);

insert into departamento values
(default, 'Finanças' , '93018-4510'),
(default, 'Comercial' , '91618-1133'),
(default, 'Jurídico' , '92821-2212');

insert into  diretor value
(default, 3, 'João', 'Jpedinho12@.....', '92098-4213'),
(default, 1, 'Fabio', 'Foidebase@.....', '97658-1233'),
(default, 2, 'Liza', 'Lilipipi1403@.....', '98821-4612');

alter table departamento 
change telefone telefone_departamento varchar (15);

select * from departamento;
select * from diretor;

select d.nome, d.email, d.telefone, dep.nome_departamento, dep.telefone_departamento from diretor as d join departamento as dep
on d.id_departamento = dep.id_departamento
order by d.nome;