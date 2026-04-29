DROP DATABASE IF EXISTS simulado;

CREATE DATABASE SIMULADO;

USE SIMULADO;

CREATE TABLE aluno (
  id            INT          NOT NULL AUTO_INCREMENT,
  nome_aluno    VARCHAR(150) NOT NULL, 
  email         VARCHAR(100) NOT NULL,
  data_cadastro DATE,
  PRIMARY KEY (id)
);

CREATE TABLE curso (
  id            INT          NOT NULL,
  nome_curso    VARCHAR(100) NOT NULL,
  instrutor     VARCHAR(100),
  carga_horaria INT,
  PRIMARY KEY (id)
);

CREATE TABLE inscricao (
  id              INT       NOT NULL,
  id_aluno        INT,
  id_curso        INT,
  data_inscricao  TIMESTAMP,
  status VARCHAR(20),
  PRIMARY KEY (id),
  FOREIGN KEY (id_aluno) REFERENCES aluno(id),
  FOREIGN KEY (id_curso) REFERENCES curso(id)
);

CREATE TABLE log_inscricao (
  id  INT NOT NULL,
  id_inscricao_ref INT,
  acao_realizada VARCHAR(50),
  data_log  TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (id_inscricao_ref) REFERENCES inscricao(id)
);

SHOW TABLES;
DESC aluno;
DESC curso;
DESC inscricao;
DESC log_inscricao;

-- 1. a. Insira pelo menos 8 novos cursos na tabela curso.
--    b. Insira pelo menos 15 novos alunos na tabela aluno.

INSERT INTO curso (id, nome_curso, instrutor, carga_horaria) VALUES
(1, 'ADS', 'Edécio Iepsen', 220);
(2, 'Marketing', 'Gladimir Iepsen', 220);
(3, 'Redes', 'Bruna Iepsen', 220);
(4, 'Matematica', 'Pablo Iepsen', 220);
(5, 'Inglês', 'Gustavo Iepsen', 220);
(6, 'Letras', 'Alessandro Iepsen', 220);
(7, 'Medicina', 'Reny Iepsen', 220);
(8, 'Algebra', 'Guilherme Iepsen', 220);

INSERT INTO aluno (nome_aluno, email, data_cadastro) VALUES
("Iris Cohen","a@icloud.org","2026-12-28 23:26:10"),
("Claudia Moon","semper.rutrum@outlook.com","2026-03-29 00:01:00"),
("Maggie Peters","lacinia.at@google.couk","2025-09-23 03:28:24"),
("Malcolm Trevino","interdum.sed@google.com","2026-03-15 14:43:19"),
("Angela Clayton","pellentesque.ut@google.net","2026-01-18 08:43:56"),
("Hedwig Fleming","diam.pellentesque@google.edu","2025-05-30 03:48:26"),
("Quinn Padilla","nulla@hotmail.net","2025-08-14 12:49:04"),
("Caleb Kirk","magna@aol.net","2025-11-06 21:55:28"),
("Iliana Little","nunc.laoreet@hotmail.com","2026-08-23 02:27:10"),
("Nicole Carrillo","at.nisi.cum@yahoo.com","2026-10-23 05:56:20"),
("Michael Mccoy","non@yahoo.couk","2027-02-11 06:24:37"),
("Fredericka Woodward","malesuada.fames@outlook.net","2026-06-12 18:26:09"),
("Hayfa Norman","tincidunt.vehicula@aol.couk","2027-02-13 12:47:15"),
("Risa Pierce","mattis@google.net","2026-04-23 23:01:00"),
("Samantha Hughes","tempus@google.edu","2025-06-30 00:45:19");

-- 2.  a. Escreva um comando para atualizar o instrutor do curso com id = 1 para "Prof. Gladimir"
UPDATE curso
SET instrutor = 'Prof. Gladimir'
WHERE id = 1;
--     b. Selecione o nome dos alunos (nome_aluno) e o nome dos cursos em que eles estão inscritos, mostrando apenas as inscrições da tabela inscricao com status 'ativa'.
SELECT a.nome_aluno, c.nome_curso
FROM inscricao i
JOIN aluno a ON i.id_aluno = a.id
JOIN curso c ON i.id_curso = c.id
WHERE i.status = 'ativa';

-- 3. Crie uma PROCEDURE chamada realizar_inscricao(aluno_id INT, curso_id INT)
-- que receba o ID de um aluno e de um curso e insira um novo registro na tabela
-- inscricao.
DROP PROCEDURE IF EXISTS realizar_inscricao;

DELIMITER $$
CREATE PROCEDURE realizar_inscricao(IN aluno_id INT, IN curso_id INT)
BEGIN
  DECLARE v_new_id INT;
  SELECT COALESCE(MAX(id), 0) + 1 INTO v_new_id FROM inscricao;
  INSERT INTO inscricao (id, id_aluno, id_curso, data_inscricao, status)
  VALUES (v_new_id, aluno_id, curso_id, NOW(), 'ativa');
END $$

DELIMITER ;