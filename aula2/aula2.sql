DROP DATABASE IF EXISTS loja;
CREATE DATABASE loja;

-- \c loja

------------------------
DROP DATABASE IF EXISTS loja;
CREATE DATABASE IF NOT EXISTS loja;

USE loja;


-- Criando tabela clientes
DROP TABLE IF EXISTS clientes;
CREATE TABLE clientes (
id INT PRIMARY KEY,
nome CHAR(30)
);

-- Criando tabela pedidos
DROP TABLE IF EXISTS pedidos;
CREATE TABLE pedidos (
id INT PRIMARY KEY,
cliente_id INT,
valor NUMERIC(10,2)
);

-- Inserindo dados nas tabelas
INSERT INTO clientes (id, nome) VALUES
(1, 'João'),
(2, 'Maria'),
(3, 'Carlos'),
(4, 'Fernanda'),
(5, 'Ana');

INSERT INTO pedidos (id, cliente_id, valor) VALUES
(1, 1, 150.00),
(2, 2, 220.50),
(3, 2, 99.90),
(4, 3, 305.00),
(5, 1, 50.00),
(6, 4, 400.00),
(7, 6, 120.00);  -- cliente_id 6 não existe

/* INNER JOIN – Somente clientes com pedidos
e pedidos que pertencem a cliente */
SELECT clientes.nome, pedidos.valor
FROM clientes
INNER JOIN pedidos ON clientes.id = pedidos.cliente_id;

-- LEFT JOIN - Todos os clientes (com ou sem pedido)
SELECT clientes.nome, pedidos.valor
FROM clientes
LEFT JOIN pedidos ON clientes.id = pedidos.cliente_id;

-- RIGHT JOIN - Todos os pedidos (com ou sem cliente)
SELECT clientes.nome, pedidos.valor
FROM clientes
RIGHT JOIN pedidos ON clientes.id = pedidos.cliente_id;

-- LEFT Excluding JOIN - Clientes sem pedidos
SELECT clientes.nome, pedidos.id
FROM clientes
LEFT JOIN pedidos ON clientes.id = pedidos.cliente_id
WHERE pedidos.id IS NULL;

-- RIGHT Excluding JOIN - Pedidos sem cliente
SELECT clientes.nome, pedidos.id
FROM clientes
RIGHT JOIN pedidos ON clientes.id = pedidos.cliente_id
WHERE clientes.id IS NULL;

-- Clientes (agrupados) com ou sem pedidos - Qtd de pedidos por cliente
SELECT clientes.nome, COUNT(pedidos.id) AS total_pedidos
FROM clientes
LEFT JOIN pedidos ON clientes.id = pedidos.cliente_id
GROUP BY clientes.nome
ORDER BY clientes.nome;

-- Clientes (agrupados) com pedidos - Qtd de pedidos por cliente
SELECT clientes.nome, COUNT(pedidos.id) AS total_pedidos
FROM clientes
INNER JOIN pedidos ON clientes.id = pedidos.cliente_id
GROUP BY clientes.nome
ORDER BY clientes.nome;

-- FULL JOIN – Todos os clientes e todos os pedidos
-- (nativo PostgreSQL, simulado no MySQL)
-- PostgreSQL
SELECT clientes.nome, pedidos.valor
FROM clientes
FULL OUTER JOIN pedidos ON clientes.id = pedidos.cliente_id
ORDER BY nome;
-- MySQL e PostgreSQL
SELECT clientes.nome, pedidos.valor
FROM clientes
LEFT JOIN pedidos ON clientes.id = pedidos.cliente_id
UNION
SELECT clientes.nome, pedidos.valor
FROM clientes
RIGHT JOIN pedidos ON clientes.id = pedidos.cliente_id
ORDER BY nome;

-------------------------
-- Você pode criar novos schemas assim:
CREATE SCHEMA vendas;

-- Criando tabela dentro do schema vendas:
CREATE TABLE vendas.clientes (
id SERIAL PRIMARY KEY,
nome TEXT,
cidade TEXT
);

-- Criando outra tabela com o mesmo nome no schema 'financeiro':
CREATE SCHEMA financeiro;

CREATE TABLE financeiro.clientes (
id SERIAL PRIMARY KEY,
nome TEXT,
limite_credito NUMERIC(10,2)
);

-- Inserindo dados em vendas.clientes
INSERT INTO vendas.clientes (nome, cidade) VALUES
('João Silva', 'Porto Alegre'),
('Maria Souza', 'Pelotas'),
('Carlos Lima', 'Canoas');

-- Inserindo dados em financeiro.clientes
INSERT INTO financeiro.clientes (nome, limite_credito) VALUES
('Angelo Luz', 1000.00),
('Gladimir Catarino', 2500.50),
('Pablo Rosa', 500.00);