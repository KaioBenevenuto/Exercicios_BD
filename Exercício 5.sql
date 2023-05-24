create database exercicio_5;
use exercicio_5;

create table cliente(
	CPF varchar(15) not null,
	nome varchar(30) not null,
	telefone varchar(15),
	primary key(CPF)
);

create table produto(
	ID int not null auto_increment,
	nome varchar(30) not null,
	categoria varchar(30),
	quant_estoque int,
	cpf_cliente varchar(15),
	primary key(ID),
	foreign key(cpf_cliente) references cliente(CPF)
);

create table endereco(
	ID_endereco int not null auto_increment,
	rua varchar(30),
	bairro varchar(30),
	cep int,
	num_casa int,
	cpf_cliente varchar(15),
	primary key(ID_endereco),
	foreign key(cpf_cliente) references cliente(CPF)
    );
    
    insert into cliente values
		('123456789-11', 'Jhonas James', '93018-4510'),
        ('234567890-12', 'Lara Crossft','97658-1233'),
        ('345678901-23', 'Mario Comgumelo', '91618-1133');
        
	insert into endereco values
		(default, 'Rua Madre tereza', 'Providente', 22989821, 157, '123456789-11'),
        (default, 'Rua Madre tereza', 'Providente', 22989821, 207, '345678901-23'),
        (default, 'Rua São jorge', 'Pirajá', 32104529, 309, '234567890-12');
        
	insert into produto values
		(default, 'Bola', 'Brinquedo', 380, '123456789-11'),
		(default, 'Carro', 'Autómovel', 163, '234567890-12'),
        (default, 'Fogão', 'Cozinha', 281, '123456789-11'),
        (default, 'Carro', 'Autómovel', 162, '345678901-23');
        
	select * from cliente;
    select * from endereco;
    select * from produto;
    
    select c.nome, c.telefone, e.rua, e.num_casa, p.nome, p.quant_estoque from cliente as c join endereco as e join produto as p 
    on c.CPF = p.cpf_cliente and c.CPF = e.cpf_cliente
    order by quant_estoque desc;