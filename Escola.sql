create database escola;
use escola;

create table professor(
	rg_professor int not null,
    nome varchar(30) not null,
    primary key(rg_professor)
);

create table sala(
	id_sala int not null auto_increment,
    nome_sala varchar(5) not null,
    primary key(id_sala)
);

create table aulas(
	id_aula int not null auto_increment,
    materia varchar(15) not null,
    primary key(id_aula)
);

create table turma(
	id_turma int not null auto_increment,
    nome_turma varchar(10) not null,
    id_sala int,
    primary key(id_turma),
    foreign key(id_sala) references sala(id_sala)
);
    
create table professor_turma(
	id_profturma int not null auto_increment,
    id_turma int,
    rg_professor int,
    primary key(id_profturma),
    foreign key (id_turma) references turma(id_turma),
	foreign key (rg_professor) references professor(rg_professor)
);

create table turma_aulas(
	id_turmaula int not null auto_increment,
    id_turma int,
	id_aula int,
    primary key(id_turmaula),
    foreign key (id_turma) references turma(id_turma),
	foreign key (id_aula) references aulas(id_aula)
);

insert into professor values
	(1234567, 'Luffy'),
    (2345678, 'Flufy');

insert into sala values
	(1, '1A'),
    (2, '1B');

insert into aulas values
	(1, 'Matemática'),
    (2, 'Português1');

insert into turma values
	(1, '6°ano', 1),
    (2, '7°ano', 1),
    (3, '8°ano', 2),
    (4, '9°ano', 2);

insert into professor_turma values
	(1, 4, 1234567),
    (2, 1, 2345678),
    (3, 3, 2345678),
    (4, 2, 1234567);

insert into turma_aulas values
	(1, 4, 1),
    (2, 1, 2),
    (3, 3, 1),
    (4, 2, 2);
    
select * from aulas;
select * from professor;
select * from professor_turma;
select * from sala;
select * from turma;
select * from turma_aulas;

select a.materia, p.nome, s.nome_sala, t.nome_turma from aulas a join professor p join professor_turma pt join sala s join turma t join turma_aulas ta
on pt.id_turma = t.id_turma and pt.rg_professor = p.rg_professor and t.id_sala = s.id_sala and t.id_turma = ta.id_turma and ta.id_aula = a.id_aula;