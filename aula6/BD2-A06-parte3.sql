DROP DATABASE IF EXISTS aula06;
CREATE DATABASE IF NOT EXISTS aula06;
USE aula06;

-- Tabela t1 com MyISAM e indice
CREATE TABLE t1(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    valor INT NOT NULL
) ENGINE=MyISAM;
CREATE INDEX idx_t1valor ON t1(valor);

-- Tabela t2 com MyISAM sem indice
CREATE TABLE t2(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    valor INT NOT NULL
) ENGINE=MyISAM;

-- Tabela t3 com InnoDB e indice
CREATE TABLE t3(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    valor INT NOT NULL
) ENGINE=INNODB;
CREATE INDEX idx_t3valor ON t3(valor);

-- Tabela t4 com InnoDB sem indice
CREATE TABLE t4(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    valor INT NOT NULL
) ENGINE=INNODB;

-- Procedure para inserir dados em t1
DELIMITER $$
CREATE PROCEDURE insereDadosT1(IN qtdLinhas INT, IN minVal INT, IN maxVal INT)
BEGIN
    DECLARE i INT;
    DECLARE tmp INT;
    SET i = 1;
    START TRANSACTION;
    WHILE i <= qtdLinhas DO
        IF RAND() < 0.2 THEN 
            SET tmp = minVal; 
        ELSE 
            SET tmp = minVal + CEIL(RAND() * (maxVal - minVal)); 
        END IF;
        INSERT INTO t1 (valor) VALUES (tmp);
        SET i = i + 1;
    END WHILE;
    COMMIT;
END$$
DELIMITER ;

-- Procedure para inserir dados em t2
DELIMITER $$
CREATE PROCEDURE insereDadosT2(IN qtdLinhas INT, IN minVal INT, IN maxVal INT)
BEGIN
    DECLARE i INT;
    DECLARE tmp INT;
    SET i = 1;
    START TRANSACTION;
    WHILE i <= qtdLinhas DO
        IF RAND() < 0.2 THEN 
            SET tmp = minVal; 
        ELSE 
            SET tmp = minVal + CEIL(RAND() * (maxVal - minVal)); 
        END IF;
        INSERT INTO t2 (valor) VALUES (tmp);
        SET i = i + 1;
    END WHILE;
    COMMIT;
END$$
DELIMITER ;

-- Procedure para inserir dados em t3
DELIMITER $$
CREATE PROCEDURE insereDadosT3(IN qtdLinhas INT, IN minVal INT, IN maxVal INT)
BEGIN
    DECLARE i INT;
    DECLARE tmp INT;
    SET i = 1;
    START TRANSACTION;
    WHILE i <= qtdLinhas DO
        IF RAND() < 0.2 THEN 
            SET tmp = minVal; 
        ELSE 
            SET tmp = minVal + CEIL(RAND() * (maxVal - minVal)); 
        END IF;
        INSERT INTO t3 (valor) VALUES (tmp);
        SET i = i + 1;
    END WHILE;
    COMMIT;
END$$
DELIMITER ;

-- Procedure para inserir dados em t4
DELIMITER $$
CREATE PROCEDURE insereDadosT4(IN qtdLinhas INT, IN minVal INT, IN maxVal INT)
BEGIN
    DECLARE i INT;
    DECLARE tmp INT;
    SET i = 1;
    START TRANSACTION;
    WHILE i <= qtdLinhas DO
        IF RAND() < 0.2 THEN 
            SET tmp = minVal; 
        ELSE 
            SET tmp = minVal + CEIL(RAND() * (maxVal - minVal)); 
        END IF;
        INSERT INTO t4 (valor) VALUES (tmp);
        SET i = i + 1;
    END WHILE;
    COMMIT;
END$$
DELIMITER ;

CALL insereDadosT1(75000, 850, 99999);
CALL insereDadosT2(75000, 850, 99999);
CALL insereDadosT3(75000, 850, 99999);
CALL insereDadosT4(75000, 850, 99999);

-- Medicao de tempo para a tabela t1 (MyISAM com indice)
SELECT NOW();
SELECT SQL_NO_CACHE valor
FROM t1 
WHERE valor > 900 AND valor < 99000
ORDER BY valor;
SELECT NOW();

-- Medicao de tempo para a tabela t2 (MyISAM sem indice)
SELECT NOW();
SELECT SQL_NO_CACHE valor
FROM t2 
WHERE valor > 900 AND valor < 99000
ORDER BY valor;
SELECT NOW();

-- Medicao de tempo para a tabela t3 (InnoDB com indice)
SELECT NOW();
SELECT SQL_NO_CACHE valor
FROM t3 
WHERE valor > 900 AND valor < 99000
ORDER BY valor;
SELECT NOW();

-- Medicao de tempo para a tabela t4 (InnoDB sem indice)
SELECT NOW();
SELECT SQL_NO_CACHE valor
FROM t4 
WHERE valor > 900 AND valor < 99000
ORDER BY valor;
SELECT NOW();

-- Uso do EXPLAIN para visualizar o plano de execucao
EXPLAIN SELECT SQL_NO_CACHE valor
FROM t1 
WHERE valor > 900 AND valor < 99000
ORDER BY valor;

EXPLAIN SELECT SQL_NO_CACHE valor
FROM t2 
WHERE valor > 900 AND valor < 99000
ORDER BY valor;

EXPLAIN SELECT SQL_NO_CACHE valor
FROM t3 
WHERE valor > 900 AND valor < 99000
ORDER BY valor;

EXPLAIN SELECT SQL_NO_CACHE valor
FROM t4 
WHERE valor > 900 AND valor < 99000
ORDER BY valor;
