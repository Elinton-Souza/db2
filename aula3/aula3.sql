DROP DATABASE IF EXISTS aula04;
CREATE DATABASE aula04m;

USE aula04m;
\c aula04m;

-- PostgreSQL
CREATE TABLE clientes (
id SERIAL,
nome VARCHAR(100),
email VARCHAR(100),
PRIMARY KEY(id)
);

-- MySQL
CREATE TABLE clientes (
  id INT AUTO_INCREMENT,
  nome VARCHAR(100),
  email VARCHAR(100),
  PRIMARY KEY (id)
);

-- PostgreSQL
CREATE TABLE pedidos (
id SERIAL,
cliente_id INT,
valor NUMERIC(10,2),
data_pedido DATE DEFAULT CURRENT_DATE,
PRIMARY KEY (id),
FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);
-- MySQL
CREATE TABLE pedidos (
id INT AUTO_INCREMENT,
cliente_id INT,
valor DECIMAL(10,2),
data_pedido DATE,
PRIMARY KEY (id),
FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);
-- PostgreSQL
CREATE TABLE log_pedidos (
id SERIAL,
mensagem TEXT,
data_log TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY(id)
);
-- MySQL
CREATE TABLE log_pedidos (
id INT AUTO_INCREMENT,
mensagem TEXT,
data_log TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY(id)
);

-- PostgreSQL e MySQL   \dt para ver tabelas   -   \d para descrever tabelas
-- Inserindo clientes   SHOW TABLES
INSERT INTO clientes (nome, email) VALUES
('João Silva', 'joao@email.com'),
('Maria Souza', 'maria@email.com');
-- Inserindo pedidos
INSERT INTO pedidos (cliente_id, valor, data_pedido) VALUES
(1, 199.90, '2025-03-01'),
(1, 49.90, '2025-03-10'),
(2, 99.90, '2025-03-15');

INSERT INTO pedidos (cliente_id, valor, data_pedido) VALUES
(1, 19.90, '2025-03-10'),
(1, 9.90, '2025-03-15'),
(2, 199.90, '2025-03-17');

-- TRIGGER AFTER INSERT (MySQL)
DELIMITER $$
CREATE TRIGGER trg_pedidos_AI
AFTER INSERT ON pedidos
FOR EACH ROW
BEGIN
INSERT INTO log_pedidos (mensagem)
VALUES (
CONCAT('Novo pedido inserido para o cliente ID ', NEW.cliente_id)
);
END $$
DELIMITER ;

-- TRIGGER BEFORE DELETE (MySQL)
DELIMITER $$
CREATE TRIGGER trg_clientes_BD
BEFORE DELETE ON clientes
FOR EACH ROW
BEGIN
INSERT INTO log_pedidos (mensagem)
VALUES (CONCAT('Cliente ID ', OLD.id, ' será removido: ',
OLD.nome));
END$$
DELIMITER ;

-- TRIGGER AFTER UPDATE (MySQL)
DELIMITER $$
CREATE TRIGGER trg_pedidos_AU
AFTER UPDATE ON pedidos
FOR EACH ROW
BEGIN
INSERT INTO log_pedidos (mensagem)
VALUES (
CONCAT('Pedido ID ', OLD.id, ' atualizado. Valor anterior: ',
OLD.valor, ', novo valor: ', NEW.valor)
);
END $$
DELIMITER ;

-- TRIGGER AFTER INSERT (PostgreSQL)
CREATE OR REPLACE FUNCTION log_pedido_insert()
RETURNS TRIGGER AS $$
BEGIN
INSERT INTO log_pedidos (mensagem)
VALUES ('Novo pedido inserido para o cliente ID ' ||
NEW.cliente_id);
RETURN NEW;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER trg_pedidos_AI
AFTER INSERT ON pedidos
FOR EACH ROW
EXECUTE FUNCTION log_pedido_insert();

-- TRIGGER BEFORE DELETE (PostgreSQL)
CREATE OR REPLACE FUNCTION log_delete_cliente()
RETURNS TRIGGER AS $$
BEGIN
INSERT INTO log_pedidos (mensagem)
VALUES ('Cliente ID ' || OLD.id || ' será removido: ' || OLD.nome);
RETURN OLD;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER trg_clientes_BD
BEFORE DELETE ON clientes
FOR EACH ROW
EXECUTE FUNCTION log_delete_cliente();

-- TRIGGER AFTER UPDATE (PostgreSQL)
CREATE OR REPLACE FUNCTION log_update_pedido()
RETURNS TRIGGER AS $$
BEGIN
INSERT INTO log_pedidos (mensagem)
VALUES (
'Pedido ID ' || OLD.id || ' atualizado. Valor anterior: ' ||
OLD.valor || ', novo valor: ' || NEW.valor
);
RETURN NEW;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER trg_pedidos_AU
AFTER UPDATE ON pedidos
FOR EACH ROW
EXECUTE FUNCTION log_update_pedido();