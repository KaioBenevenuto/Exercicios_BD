create database  berçario;
use berçario;
    
create table medico(
	RG int unsigned not null,
	nome varchar(30) not null,
	CRM varchar(15),
	especialidade varchar (30),
	telefone varchar(15),
	primary key(RG)
);

create table mae(
	CPF varchar(15) not null,
	nome varchar(30) not null,
	telefone varchar(15),
	primary key(CPF)
);

create table endereco(
	ID_endereco int not null auto_increment,
	rua varchar(30),
	bairro varchar(30),
	cep int,
	num_casa int,
	cpf_mae varchar(15),
	primary key(ID_endereco),
	foreign key(cpf_mae) references mae(CPF)
    );
    
create table mae_medico(
	ID int not null auto_increment,
    cpf_mae varchar(15),
    rg_medico int unsigned,
    primary key(ID),
    foreign key(cpf_mae) references mae(CPF),
    foreign key(rg_medico) references medico(RG)
);

create table bebe(
	id_bebe int auto_increment not null,
    nome varchar(30) not null,
    altura_cm decimal(3,1),
    peso_kg decimal (3,2),
    nascimento date,
    cpf_mae varchar(15),
    primary key(id_bebe),
    foreign key(cpf_mae) references mae(CPF)
);

insert into mae values
	('123456789-11', 'Marta da Silva', '93018-4510'),
    ('234567890-12', 'Keity Cat', '97658-1233'),
    ('345678901-23', 'Gabriela Lima', '92821-2212');

insert into medico values
	('1234567', 'Edgar Leonar', 'CRM/MG-123456','Parto', '91228-8540'),
    ('2345678', 'Colt Cool', 'CRM/SP-321456', 'Parto', '95432-4990'),
    ('3456789', 'Shely Mendolssa', 'CRM/AM-654321', 'Parto','92751-9070');
    
insert into endereco value
	(default,'Rua Madre tereza', 'Providente', 22989821, 157, '123456789-11'),
	(default,'Rua Madre tereza', 'Providente', 22989821, 207, '345678901-23'),
	(default,'Rua São jorge', 'Pirajá', 32104529, 309, '234567890-12');
   
insert into bebe values
	(1,'Cleitin', 47.6, 2.95, '2001-04-02', '123456789-11'),
    (2,'Vitin', 49.9, 3.42, '2005-02-19', '345678901-23'),
    (3,'Junin', 51.2, 3.18, '1999-01-27', '234567890-12');
    
insert into mae_medico values
	(1, '123456789-11', 1234567),
    (2, '123456789-11', 3456789),
    (3, '234567890-12', 1234567),
    (4, '234567890-12', 2345678),
    (5, '345678901-23', 3456789),
    (6, '345678901-23', 2345678);
        
select * from mae;
select * from medico;
select * from endereco;
select * from bebe;
select * from mae_medico;

select mae.nome, e.CEP, e.num_casa, me.nome, me.CRM, me.especialidade, bebe.nome, bebe.nascimento from endereco as e join mae join medico as me join mae_medico as mm join bebe
on e.cpf_mae = mae.CPF and mm.cpf_mae = mae.CPF and mm.rg_medico = me.RG and bebe.cpf_mae = mae.CPF;