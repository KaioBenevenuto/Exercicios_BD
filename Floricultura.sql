create database floricultura;
use floricultura;

create table cliente(
	rg_cliente int not null,
	nome varchar(30) not null,
	telefone varchar(15),
	primary key(rg_cliente)
); 

create table produto(
	id_produto int not null auto_increment,
	nome varchar(30) not null,
	quant_estoque int,
	preco decimal (7,2),
	categoria varchar(30),
	primary key(id_produto)
);

create table endereco(
	id_endereco int not null auto_increment,
	rua varchar(30),
	bairro varchar(30),
	cep int,
	num_casa int,
	rg_cliente int,
	primary key(id_endereco),
	foreign key(rg_cliente) references cliente(rg_cliente)
    );
    
    create table cliente_produto(
	id_cliente_produto int not null auto_increment,
	data_compra date,
	rg_cliente int,
	id_produto int,
	primary key(id_cliente_produto),
	foreign key(rg_cliente) references cliente(rg_cliente),
	foreign key(id_produto) references produto(id_produto)
    );
    
insert into cliente values
	(1234567, 'Cleber Souza Guimarãins', '91228-8540'),
    (2345678, 'Juliana Lima Cesar', '95432-4990');
    
insert into endereco values
	(default,'Rua Madre tereza', 'Providente', 22989821, 157, '2345678'),
	(default,'Rua São jorge', 'Pirajá', 32104529, 309, '1234567');
    
insert into produto values
	(1, 'esponja', 1200, 2.50, 'utensílios de cozinha'),
    (2, 'talher', 3823, 9.99, 'utensílios de cozinha'),
    (3, 'carro', 289, 32500, 'Autómovel'),
    (4, 'TV', 785, 4000, 'Lazer');

insert into cliente_produto values
	(1, '2004-12-25', 1234567, 3),
    (2, '1999-8-2', 2345678, 1),
    (3, '2001-4-8', 2345678, 4),
    (4, '2010-6-23', 1234567, 4),
    (5, '2020-9-12', 1234567, 2);
    
select * from cliente;
select * from endereco;
select * from produto;
select * from cliente_produto;

select c.nome, e.rua, e.num_casa, p.nome, p.categoria, p.preco from endereco e join cliente c join cliente_produto cp join produto p
on e.rg_cliente = c.rg_cliente and cp.rg_cliente = c.rg_cliente and cp.id_produto = p.id_produto;