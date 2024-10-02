drop database if exists pizzaria;

create database if not exists pizzaria;

use pizzaria;

CREATE TABLE Clientes (
	id INt not null AUTO_INCREMENT primary key,
	telefone VARCHAR(14),
	nome VARCHAR(30),
	logradouro VARCHAR(30),
	numero DECIMAL(5,0),
	complemento VARCHAR(30),
	bairro VARCHAR(30),
	referencia VARCHAR(30)
 );

 CREATE TABLE pizzas (
    id INTEGER not null AUTO_INCREMENT primary key,
    nome VARCHAR(30),
    descricao VARCHAR(30),
    valor DECIMAL(15 , 2 )
 );
 
 CREATE TABLE pedidos (
    id INTEGER AUTO_INCREMENT primary key,
    cliente_id INTEGER,
    data DATETIME,
    valor DECIMAL(15 , 2 )
 );
 
 alter table pedidos add FOREIGN KEY (cliente_id) REFERENCES Clientes (id);
 
 
 CREATE TABLE itens_pedido (
    pedido_id INTEGER,
    pizza_id INTEGER,
    quantidade int,
    valor DECIMAL(15 , 2 ),
    FOREIGN KEY (pizza_id)
        REFERENCES Pizzas (id),
    FOREIGN KEY (pedido_id)
        REFERENCES Pedidos (id)
 );
 


INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(11) 1111-1111', 'Alexandre Santos', 'Rua das Palmeiras', 111, NULL, 'Bela Vista', 'Em frente a escola');
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(22) 2222-2222','Bruna Dantas', 'Rua das Rosas',222,NULL,'Cantareira',NULL);
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(33) 3333-3333','Bruno Vieira', 'Rua das Avencas',333,NULL,'Bela Vista',NULL);
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(44) 4444-4444','Giulia Silva', 'Rua dos Cravos',444,NULL,'Cantareira','Esquina do mercado');
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(55) 5555-5555','José Silva', 'Rua das Acácias',555,NULL,'Bela Vista',NULL);
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(66) 6666-6666','Laura Madureira','Rua das Gardências',666,NULL,'Cantareira',NULL);

-- select * from cliente c 

INSERT INTO pizzas (nome, valor) VALUES ('Portuguesa', 15),
('Provolone', 17),
('4 Queijos', 20),
('Calabresa', 17);
INSERT INTO pizzas (nome) VALUES ('Escarola');


alter table pizzas modify valor decimal(15,2) default 99;

INSERT INTO pizzas (nome) VALUES ('Moda da Casa');

INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (1, 1, '2016-12-15 20:30:00', 32.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (2, 2, '2016-12-15 20:38:00', 40.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (3, 3, '2016-12-15 20:59:00', 22.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (4, 1, '2016-12-17 22:00:00', 42.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (5, 2, '2016-12-18 19:00:00', 45.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (6, 3, '2016-12-18 21:12:00', 44.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (7, 4, '2016-12-19 22:22:00', 72.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (8, 6, '2016-12-19 22:26:00', 34.0);


INSERT INTO itens_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (1, 1, 1, 15.00),
(1, 4, 1, 17.00),
(2, 3, 2, 40.00),
(3, 5, 1, 22.00),
(4, 3, 1, 20.00),
(4, 5, 1, 22.00),
(5, 1, 3, 45.00),
(6, 5, 2, 44.00),
(7, 1, 2, 30.00),
(7, 3, 1, 20.00),
(7, 5, 1, 22.00),
(8, 4, 2, 34.00);

select * from itens_pedido;

/*
      select [distinct] <colunas>
    from <tabelas>
    [where condição]
    [group by <coluna>]
    [gaving <condição>]
    [order by <coluna>];
*/

select * from clientes order by nome, bairro;

-- Selecionar todos os valores
select * from pizzas;

select id, nome, valor from pizzas;

-- A sequencia das colunas podem ser alteradas
select valor, id, nome from pizzas;

-- Nome da coluna exibido na resposta do comando pode ser alterada com a cláusula as
select id as codigo, nome, valor as 'Valor R$' from pizzas; 

-- Operações aritiméticas
select 10 + 3, 10 - 3, 10 / 3, 10 * 3;
select 10 + 3 as 'Soma', 10 - 3 as 'Subtração', 10 / 3 as 'Divisão', 10 * 3 as 'Multiplicação';


select * , (valor/100)*10 + valor as '+10%' from pizzas;

alter table pizzas add column custo decimal(15,2);

update pizzas set custo = valor * 0.60;

-- condição where
-- selecionar todas as pizzas com valor superior a R$17,00
select * from pizzas where valor > 17;

-- selecionar todas as pizzas com valor igual ou superior a R$17,00
select * from pizzas where valor >= 17;

-- selecionar todas as pizzas com valor igual ou inferior a R$17,00
select * from pizzas where valor <= 17;

-- selecionar todas as pizzas com valor inferior a R$17,00
select * from pizzas where valor < 17;

-- selecionar todas as pizzas com valor igual a R$17,00
select * from pizzas where valor = 17;

-- selecionar todas as pizzas com valor diferente de R$17,00
select * from pizzas where valor != 17;
select * from pizzas where valor <> 17;

-- selecionar todas as pizzas com a coluna valor nula
select * from pizzas where valor <=> null;
select * from pizzas where valor is null;

-- selecionar todas as pizzas com valor entre 15 e 20
select * from pizzas where valor > 15 and valor < 20;
select * from pizzas where valor between 16 and 19;

-- selecionar todas as pizzas com valores menores ou maiores do que R$17,00:
select * from pizzas where valor < 17 or valor > 17;

-- selecionar todas as pizzas com valores não menores ou maiores do que R$17,00:
select * from pizzas where not (valor < 17 or valor > 17);

-- selecionar todas as pizzas com valores menores ou maiores do que R$17,00:
select * from pizzas where valor >= 17 and valor <= 20;
select * from pizzas where valor between 17 and 20;

-- selecionar todas as pizzas com valores fora da faixa entre R$17,00 e 20:
select * from pizzas where valor < 17 or valor > 20;
select * from pizzas where valor not between 17 and 20;
select * from pizzas where not (valor >= 17 and valor <= 20);

-- selecionar todas as pizzas com valores iguais a 15 e 20:
select * from pizzas where valor = 15 or valor = 20;
select * from pizzas where valor in (15,20);

-- selecionar todas as pizzas com valores diferentes de 15 e 20:
select * from pizzas where valor != 15 and valor != 20;

select * from pizzas where valor not in (15,20);

-- selecionar todas as pizzas com vamores não nulos
select * from pizzas where valor is not null;

-- selecionar todas as pizzas que comece com a letra E 
select * from pizzas where nome like 'e%';

-- selecionar todas as pizzas que termina com a letra A 
select * from pizzas where nome like '%a';

-- selecionar todas as pizzas que tenham as letras Esa 
select * from pizzas where nome like '%esa%';

-- Clausula ORDER BY
-- order by <coluna 1> [asc/desc], <coluna n> [asc/desc];
-- listar todas as colunas da tabela PIZZA em ordem alfabetica:
select * from pizzas order by nome asc;

-- listar o nome e o valor das pizzas em ordem decrescente de preço e alfabetica de nome:
select * from pizzas order by valor desc, nome asc;

-- listar todas as colunas da tabela PIZZA em ordem alfabetica:
select * from pizzas order by valor desc limit 2;

select * from pizzas limit 2;

select distinct valor from pizzas order by valor;

select * from pizzas;

/* funções de agregação
conhecidas como funções estatísticas, as funções de agregação obtém informação sobre conjuntos de linhas especificados
*AVG(coluna) - Média dos valores da coluna
*COUNT() - Número de linhas
*MAX(coluna) - Maior valor da coluna
*MIN(coluna) - Menor valor da coluna
*SUM(coluna) - Soma dos valores da coluna
*/

-- Contar quanta pizzas estão cadastradas
select count(*) from pizzas;
select count(nome) from pizzas;
select count(valor) from pizzas;

-- Qual é a média de preço das pizzas?
select avg(valor) as media from pizzas;

select avg(valor) as media from pizzas where nome like '%esa';

-- Qual é o valor da pizza mais cara do cardápio da pizzaria?
select max(valor) as 'maior valor' from pizzas;

-- Qual é o valor da pizza mais barata do cardápio da pizzaria?
select min(valor) as 'menor valor' from pizzas;

-- Qual é o valor total do pedido número 7?
select * from itens_pedido;

select sum(valor) from itens_pedido where pedido_id = 7;

-- Exibir o id e o valor dos pedidos 
select pedido_id as pedido, sum(valor) as 'valor pedido' from itens_pedido group by pedido_id;

select pedido_id as pedido, sum(valor) as 'valor pedido', 
sum(quantidade) as 'qntd piizzas' from itens_pedido group by pedido_id;

select pedido_id as pedido, sum(valor) as 'valor pedido', 
sum(quantidade) as 'qntd piizzas',
avg(valor) as media,
 sum(valor) / sum(quantidade) as 'valor médio'
 from itens_pedido group by pedido_id;
 
 select * from itens_pedido;
 
 -- INNER JOIN (ou LEFT OUTER JOIN): Retorna registros quando há pelo menos uma correspondencia em ambas as tabelas
 -- (primeira tabela mencionada) e os registros correspondentes da tabela da direita
 -- (segunda tabela mencionada)
 
  -- (p)= pedidos; (c)= clientes
  
 select * from clientes as c
 inner join pedidos as p on p.cliente_id = c.id;

select  clientes.id as id_cliente, nome, telefone, pedidos.id as pedido, valor from clientes
 inner join pedidos on pedidos.cliente_id = clientes.id;
 
 select  clientes.id as id_cliente, nome, telefone, pedidos.id as pedido, valor from clientes
 left join pedidos on pedidos.cliente_id = clientes.id;
 
 select  clientes.id as id_cliente, nome, telefone, pedidos.id as pedido, valor from clientes
 right join pedidos on pedidos.cliente_id = clientes.id;
 
 insert into pedidos(id, data, valor) values (9, '2024-10-02', 0);
 
 -- Quantidade de pedido(s) realizado(s) por cliente, exibir nome do cliente e quantidade de pedidos realizados
 select nome, telefone, count(pedidos.id) from clientes left join pedidos on clientes.id = pedidos.cliente_id group by nome, telefone;
 
 select * from pedidos;
 
 -- 1. Quantos pedidos foram feitos no total?
 
 select sum(valor) from itens_pedido;
 
 -- 2. Quantos pedidos foram feitos pelo cliente com o nome "Alexandre Santos"? 
 
-- 3. Qual o valor total de todos os pedidos feitos até agora?