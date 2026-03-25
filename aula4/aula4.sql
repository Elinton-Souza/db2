DROP DATABASE IF EXISTS aula04;
CREATE DATABASE aula04;

USE aula04;
\c aula04;

CREATE TABLE produto (
codigo CHAR(3),
descricao VARCHAR(50) NOT NULL,
qtd_estoque INT NOT NULL CHECK (qtd_estoque > 0),
PRIMARY KEY (codigo)
);

INSERT INTO produto (codigo, descricao, qtd_estoque) VALUES
('001', 'Feijão', 10),
('002', 'Arroz', 5),
('003', 'Farinha', 15);

SELECT * FROM produto;


DELIMITER $$
CREATE TRIGGER trg_itensvenda_AI AFTER INSERT
ON itensVenda
FOR EACH ROW
BEGIN
UPDATE produto
SET produto.qtd_estoque = produto.qtd_estoque - NEW.qtd_vendida
WHERE codigo = NEW.produto_codigo;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER trg_itensvenda_AD AFTER DELETE
ON itensVenda
FOR EACH ROW
BEGIN
-- Ao remover o item da venda, devolve a quantidade ao estoque
UPDATE produto
SET qtd_estoque = qtd_estoque + OLD.qtd_vendida
WHERE codigo = OLD.produto_codigo;
END$$
DELIMITER ;

INSERT INTO itensVenda VALUES (1, 1, '003', 2); -- Cliente 1 comprou 2 unidades do produto '003'
INSERT INTO itensVenda VALUES (2, 1, '001', 3); -- Cliente 1 comprou 3 unidades do produto '001'
INSERT INTO itensVenda VALUES (3, 1, '002', 1); -- Cliente 1 comprou 1 unidade do produto '002'
INSERT INTO itensVenda VALUES (4, 2, '002', 1); -- Cliente 2 comprou 1 unidade do produto '002'
INSERT INTO itensVenda VALUES (5, 2, '003', 4); -- Cliente 2 comprou 4 unidades do produto '003'
INSERT INTO itensVenda VALUES (6, 2, '001', 3); -- Cliente 2 comprou 3 unidades do produto '001'
INSERT INTO itensVenda VALUES (7, 3, '001', 1); -- Cliente 3 comprou 1 unidade do produto '001'
INSERT INTO itensVenda VALUES (8, 3, '002', 2); -- Cliente 3 comprou 2 unidades do produto '002'

DELETE FROM itensVenda WHERE id = 1;



------------------------------------------------------------

DROP DATABASE IF EXISTS aula04b;
CREATE DATABASE aula04b;

USE aula04b;

CREATE TABLE produto (
id INT AUTO_INCREMENT,
status CHAR(1) NOT NULL DEFAULT 'A',
 -- Indica se o cadastro está ativo 'A' ou inativo 'I'
descricao VARCHAR(50),
estoqueMinimo INT(11),
estoqueMaximo INT(11),
PRIMARY KEY (id)
);

INSERT INTO produto (descricao, estoqueMinimo, estoqueMaximo)
VALUES
('PENDRIVE', 10, 100),
('MOUSE', 10, 100),
('IOGURTE', 5, 50),
('TEQUILA', 5, 40),
('PRESUNTO', 5, 20);

CREATE TABLE estoque (
id INT AUTO_INCREMENT,
idProduto INT,
qtd INT,
vlrUnitario DECIMAL(9,2) NULL DEFAULT 0.00,
PRIMARY KEY (id)
);

CREATE TABLE produtoEntrada (
id INT AUTO_INCREMENT,
idProduto INT,
qtd INT,
vlrUnitario DECIMAL(9,2) NULL DEFAULT 0.00,
entradaData DATE,
PRIMARY KEY (id)
);

CREATE TABLE produtoSaida (
id INT AUTO_INCREMENT,
idProduto INT,
qtd INT,
saidaData DATE,
vlrUnitario DECIMAL(9,2) NULL DEFAULT 0.00,
PRIMARY KEY (id));

DELIMITER $$
CREATE PROCEDURE SP_AtualizaEstoque(
  IN var_idProduto INT,
  IN var_qtdComprada INT,
  IN var_vlrUnitario DECIMAL(9,2)
)
BEGIN
  DECLARE var_contador INT(11);
-- Conta quantos registros já existem no estoque para o produto
  SELECT COUNT(*)
  INTO var_contador
  FROM estoque e
  WHERE e.idProduto = var_idProduto;
-- Se já existe, faz o UPDATE
  IF var_contador > 0 THEN
    UPDATE estoque e
    SET e.qtd = e.qtd + var_qtdComprada,
        e.vlrUnitario = var_vlrUnitario
    WHERE e.idProduto = var_idProduto;
-- Senão, faz o INSERT
  ELSE
    INSERT INTO estoque (idProduto, qtd, vlrUnitario)
    VALUES (var_idProduto, var_qtdComprada, var_vlrUnitario);
  END IF ;
END $$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER trg_produtoEntrada_AI AFTER INSERT
ON produtoEntrada
FOR EACH ROW
BEGIN
  CALL SP_AtualizaEstoque (NEW.idProduto,
                           NEW.qtd,
                           NEW.vlrUnitario);
END $$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER trg_produtoEntrada_AD AFTER DELETE
ON produtoEntrada
FOR EACH ROW
BEGIN
  CALL SP_AtualizaEstoque (OLD.idProduto,
                           OLD.qtd * - 1,
                           OLD.vlrUnitario);
END $$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER trg_produtoEntrada_AU AFTER UPDATE
ON produtoEntrada
FOR EACH ROW
BEGIN
  CALL SP_AtualizaEstoque (NEW.idProduto,
                           NEW.qtd - OLD.qtd,
                           NEW.vlrUnitario);
END $$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER trg_produtoSaida_AI AFTER INSERT
ON produtoSaida
FOR EACH ROW
BEGIN
  CALL SP_AtualizaEstoque (NEW.idProduto,
                           NEW.qtd * - 1,
                           NEW.vlrUnitario);
END $$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER trg_produtoSaida_AD AFTER DELETE
ON produtoSaida
FOR EACH ROW
BEGIN
  CALL SP_AtualizaEstoque (OLD.idProduto,
                           OLD.qtd,
                           OLD.vlrUnitario);
END $$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER trg_produtoSaida_AU AFTER UPDATE
ON produtoSaida
FOR EACH ROW
BEGIN
  CALL SP_AtualizaEstoque (NEW.idProduto,
                           OLD.qtd - NEW.qtd,
                           NEW.vlrUnitario);
END $$
DELIMITER ;

-- Testes de ENTRADA (compras)
INSERT INTO produtoEntrada VALUES(1,2,10,80.53,"2026-03-25");

INSERT INTO produtoEntrada (idProdutp, qtd, vlrUnitario, entradaData) VALUES(2,20,80.53,"2026-03-25");

SELECT em produtoEntrada e SELECT em estoque
UPDATE em produtoEntrada
SELECT em produtoEntrada e SELECT em estoque
DELETE em produtoEntrada
SELECT em produtoEntrada e SELECT em estoque
-- Testes de SAÍDA (vendas)
INSERT em produtoSaida
SELECT em produtoSaida e SELECT em estoque
UPDATE em produtoSaida
SELECT em produtoSaida e SELECT em estoque
DELETE em produtoSaida
SELECT em produtoSaida e SELECT em estoque