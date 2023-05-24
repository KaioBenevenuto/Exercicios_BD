create database exercicio_4;
use exercicio_4;

create table jogador(
	CPF int(11) unsigned not null,
	nome varchar(30) not null,
	ID_equipe int,
	primary key(CPF),
	foreign key(ID_equipe) references equipe(ID)
);

create table equipe(
	ID int not null auto_increment,
	nome varchar(30),
	primary key(ID)
);

insert into equipe value
	(default, 'Atletico-MG'),
    (default, 'Cruzeiro');

alter table jogador
	modify CPF varchar(15);

insert into jogador values
	('123456789-01', 'João Vitor', 1 ),
    ('234567890-12', 'Lucas Ghomes', 1),
    ('345678901-23', 'Josep da Silva', 2),
    ('456789012-34', 'Clara de Ovo', 1),
    ('567890123-45', 'Cleitin Fernandin', 2 ),
    ('678901234-56', 'Thiago Atelier', 2),
    ('789012345-67', 'Kevin Leven', 1),
    ('890123456-78', 'Bem Tevi', 2),
    ('901234567-89', 'Luisa Ghomes', null),
    ('909242562-13', 'Leitícia Lima', null);
    
select * from jogador;
select * from equipe;

select j.CPF, j.nome, e.nome from jogador as j join equipe as e
on j.ID_equipe = e.ID
order by j.nome;