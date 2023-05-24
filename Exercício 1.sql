create database exercicio_1;
use exercicio_1;

create table aluno(
	id_aluno int not null auto_increment,
	nome varchar (30) not null,
	nascimento date,
	primary key(id_aluno)
)default charset = utf8; 

create table telefone(
	id_telefone int not null auto_increment,
	telefone tinyint unsigned,
	id_aluno int,
	primary key(id_telefone),
	foreign key(id_aluno) references aluno(id_aluno)
)default charset = utf8; 

create table trabalho(
	id_trabalho int not null auto_increment,
	materia varchar(20) not null,
	tema varchar(30),
	nota tinyint(2) unsigned,
	primary key (id_trabalho)
)default charset = utf8;

create table aluno_faz_trabalho(
	id_aluno_trabalho int not null auto_increment,
	id_aluno int,
	id_trabalho int,
	primary key (id_aluno_trabalho),
	foreign key (id_aluno) references aluno (id_aluno),
	foreign key (id_trabalho) references trabalho (id_trabalho)
)default charset = utf8;

insert into aluno values
	(default, 'João', '2000-03-17'),
	(default, 'Lucas', '1999-01-27'),
	(default, 'Vitor', '1994-12-01'),
	(default, 'Hiago','2006-07-16');
    
insert into trabalho values
	(default, 'História', 'Guerra fria', '5'),
	(default, 'Geografia','Amazônia', '7');
    
alter table telefone
		modify telefone varchar(20);

insert into telefone values
	(default, '920984213', '1'),
    (default, '976581233', '2'),
    (default, '988214612', '3'),
    (default, '951347551', '4'),
    (default, '981540281', '1');

insert into aluno_faz_trabalho values
	(default, '1', '1'),
    (default, '2', '2'),
    (default, '3', '1'),
    (default, '4', '2'),
    (default, '1', '2');

select * from aluno;
select * from trabalho;
select * from telefone;
select * from aluno_faz_trabalho;

select a.nome, t.materia, t.tema, t.nota from aluno as a join aluno_faz_trabalho as aft join trabalho as t
on a.id_aluno = aft.id_aluno and t.id_trabalho = aft.id_trabalho;