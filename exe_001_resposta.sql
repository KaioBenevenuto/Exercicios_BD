create database exe_001;
use exe_001;


-- DROP TABLE tb_pessoa;
CREATE TABLE IF NOT EXISTS tb_pessoa(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(300) NOT NULL,
    email VARCHAR(200) NOT NULL,
    sexo ENUM('F', 'M') NOT NULL,
    idade INT NOT NULL
);

-- DROP TABLE tb_profissao;
CREATE TABLE IF NOT EXISTS tb_profissao(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(200) NOT NULL,
    salario DECIMAL(7,2)
);

-- DROP TABLE tb_pessoa_tb_profissao;
CREATE TABLE IF NOT EXISTS tb_pessoa_tb_profissao(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_pessoa INT NOT NULL,
    id_profissao INT NOT NULL,
    data_contratacao DATE NOT NULL,
    data_encerramento DATE,
    FOREIGN KEY (id_pessoa) REFERENCES tb_pessoa(id),
    FOREIGN KEY (id_pessoa) REFERENCES tb_pessoa(id)
);

INSERT INTO tb_pessoa VALUES (1 ,'Marcos Silva', 'marcos@hotmail.com', 'M', 45);
INSERT INTO tb_pessoa VALUES (2 ,'Adriana Lopes', 'adriana.lopes@hotmail.com', 'F', 23);
INSERT INTO tb_pessoa VALUES (3 ,'Paula Guerra', 'paula@gmail.com', 'F', 19);
INSERT INTO tb_pessoa VALUES (4 ,'Julieta Silva', 'julieta@hotmail.com', 'F', 36);
INSERT INTO tb_pessoa VALUES (5 ,'Antônio Silva', 'antonio@gmail.com', 'M', 25);
INSERT INTO tb_pessoa VALUES (6 ,'Cristiano Lopes', 'cristianinho@gmail.com', 'M', 30);
INSERT INTO tb_pessoa VALUES (7 ,'Júnior Klever', 'jk@yahoo.com', 'M', 71);
INSERT INTO tb_pessoa VALUES (8 ,'Patricia Silva', 'patricia@hotmail.com', 'F', 47);
INSERT INTO tb_pessoa VALUES (9 ,'Marcos Guerra', 'marquinhos@gmail.com', 'M', 21);
INSERT INTO tb_pessoa VALUES (10 ,'Joana Lopes', 'joana@gmail.com', 'F', 28);
INSERT INTO tb_pessoa VALUES (11 ,'Pedro Silva', 'pedro@gmail.com', 'M', 21);

INSERT INTO tb_profissao VALUES (1 ,'Médico', 12000.36);
INSERT INTO tb_profissao VALUES (2 ,'Pedreiro', 1400.36);
INSERT INTO tb_profissao VALUES (3 ,'Marceneiro', 1250.75);
INSERT INTO tb_profissao VALUES (4 ,'Bombeiro', 5600.00);
INSERT INTO tb_profissao VALUES (5 ,'Mecânico', 1100.15);
INSERT INTO tb_profissao VALUES (6 ,'Programador', 21000.00);
INSERT INTO tb_profissao VALUES (7 ,'Confeiteiro', 1100.00);

INSERT INTO tb_pessoa_tb_profissao VALUES (default , 1, 1, '2000-01-20', null);
INSERT INTO tb_pessoa_tb_profissao VALUES (default , 2, 3, '2020-04-12', null);
INSERT INTO tb_pessoa_tb_profissao VALUES (default , 3, 4, '2020-01-10', null);
INSERT INTO tb_pessoa_tb_profissao VALUES (default , 4, 7, '2022-09-01', null);
INSERT INTO tb_pessoa_tb_profissao VALUES (default , 5, 7, '2018-02-16', '2020-06-01');
INSERT INTO tb_pessoa_tb_profissao VALUES (default , 5, 6, '2020-07-01', null);
INSERT INTO tb_pessoa_tb_profissao VALUES (default , 6, 1, '2015-01-01', null);
INSERT INTO tb_pessoa_tb_profissao VALUES (default , 7, 1, '1995-10-12', '2022-01-01');
INSERT INTO tb_pessoa_tb_profissao VALUES (default , 8, 1, '2003-01-15', null);
INSERT INTO tb_pessoa_tb_profissao VALUES (default , 9, 4, '2021-06-24', null);
INSERT INTO tb_pessoa_tb_profissao VALUES (default , 10, 6, '2017-07-01', null);

/**
1) Faça um select que mostre o total de pessoas do sexo Masculino (M)
*/
    SELECT count(*) FROM tb_pessoa GROUP BY sexo HAVING sexo = 'M';

/**
2) Faça um select que mostre o total de pessoas do sexo F (F)
*/
	SELECT count(*) FROM tb_pessoa GROUP BY sexo HAVING sexo = 'F';

/**
3) Faça um select que mostre todas as pessoas que tem a idade superior a 40
*/
	SELECT * FROM tb_pessoa WHERE idade > 40;

/**
4) Faça um select que mostre todas as pessoas ordenadas pelo sexo
*/
	SELECT * FROM tb_pessoa ORDER BY sexo;

/**
5) Faça um select que mostre todas as pessoas que usem hotmail
*/
	SELECT * FROM tb_pessoa WHERE email like '%hotmail%';
    
/**
6) Faça um select que mostre todas as pessoas que comecem com o nome com letra P
*/
	SELECT * FROM tb_pessoa WHERE nome like 'P%';

/**
7) Faça um select que mostre qual é a pessoas mais nova
*/
	SELECT * FROM tb_pessoa WHERE idade = (SELECT min(idade) FROM tb_pessoa);

/**
8) Faça um select que mostre todos os dados da profissão que possuí o maior salário
*/
	SELECT * FROM tb_profissao WHERE salario = (SELECT max(salario) FROM tb_profissao);

/**
9) Faça um select que mostre todas as profissões que contenham a palavra 'iro'
*/
	SELECT * FROM tb_profissao WHERE descricao like '%iro%';

/**
10) Faça um select que mostre a média salarial
*/
	SELECT AVG(salario) FROM tb_profissao;

/**
11) Faça um select que mostre a soma de todos os salários
*/
	SELECT sum(salario) FROM tb_profissao;
    
/**
12) Faça um select que mostre o NOME, PROFISSAO, SALARIO, DATA DE CONTRATACAO e DATA DE ENCERRAMENTO de cada um
*/
	SELECT pe.nome, pr.descricao, pr.salario, pp.data_contratacao, pp.data_encerramento 
    FROM  tb_pessoa pe JOIN tb_pessoa_tb_profissao pp JOIN tb_profissao pr
	ON pe.id = pp.id_pessoa AND pr.id = pp.id_profissao;
/**
13) Faça um select que mostre o NOME, PROFISSAO, SALARIO das pessoas que ganham mais de 5.000,00 reais
*/
	SELECT p.nome, pr.descricao, pr.salario FROM tb_pessoa p JOIN tb_pessoa_tb_profissao pp JOIN tb_profissao pr
    ON pp.id_pessoa = p.id AND pp.id_profissao = pr.id
    WHERE pr.salario > 5000.00;

/**
14) Faça um select que mostre o NOME, PROFISSAO, SALARIO das pessoas que ganham menos de 5.000,00 reais
*/
	SELECT p.nome, pr.descricao, pr.salario FROM tb_pessoa p JOIN tb_pessoa_tb_profissao pp JOIN tb_profissao pr
    ON pp.id_pessoa = p.id AND pp.id_profissao = pr.id
    WHERE pr.salario < 5000.00;

/**
15) Faça um select que mostre o NOME, PROFISSAO, SALARIO, DATA DE CONTRATACAO e DATA DE ENCERRAMENTO
	das pessoas que tiveram mais de um emprego
*/
	SELECT p.nome, pr.descricao, pr.salario, pp.data_contratacao, pp.data_encerramento
    FROM tb_pessoa p JOIN tb_pessoa_tb_profissao pp JOIN tb_profissao pr
    ON pp.id_pessoa = p.id AND pp.id_profissao = pr.id
    GROUP BY pp.id_pessoa HAVING count(pp.id_pessoa) > 1;