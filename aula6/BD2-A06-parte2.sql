DROP DATABASE IF EXISTS aula06;
CREATE DATABASE aula06;
USE aula06;

CREATE TABLE professores (
	id INT AUTO_INCREMENT,
	nome VARCHAR(50),
	email VARCHAR(100),
	sexo CHAR(1),
	PRIMARY KEY(id)
) ENGINE = InnoDB;

CREATE TABLE alunos (
	id INT AUTO_INCREMENT,
	nome VARCHAR(50),
	email VARCHAR (100), 
	obs TEXT,
	PRIMARY KEY(id),
	FULLTEXT (nome, obs)
) ENGINE = MyISAM;

INSERT INTO alunos (nome,email,obs) 
VALUES 
('Nomlanga D. Higgins','lacus.varius.et@liberoProin.edu','varius et, euismod et, commodo at,'),
('Aurelia Caldwell','est.congue@eulacusQuisque.ca','orci lacus vestibulum lorem, sit amet ultricies sem'),
('Brandon S. Kelly','intger.id@infaucibusorci.co.uk','Sed id risus quis diam luctus'),
('Aurelia E. Ortega','mollis@enimsitamet.edu','tristique senectus et netus et malesuada fames ac'),
('Charlotte Huff','eros@laoreet.edu','cubilia Curae;'),
('Eaton Byers','ante@auctor.ca','mi'),
('Kieran Glenn','nonummy.ac.feugiat@feugiatLorem.edu','nulla vulputate dui, nec tempus mauris erat'),
('Sawyer Vasquez','accumsan.sed@velfaucibus.ca','a, facilisis non, bibendum'),
('Jesse Fuller','Donec.egestas@enimMaurisquis.org','mauris eu elit.'),
('Shelly Alford','nisl.arcu.iaculis@ullamcorpermagnaSed.org','ut, nulla. Cras eu'),
('Martin K. Kelly','lacus.Etiam@eratvolutpat.org','Suspendisse sagittis. Nullam vitae diam.'),
('Abbot Wolfe','et.euismod@urna.co.uk','nulla. intger vulputate, risus a ultricies adipiscing, enim'),
('Whilemina Kerr','ante.Maecenas@metusAeneansed.ca','lobortis risus. In mi pede, nonummy ut, molestie in, tempus'),
('Armando Y. Merritt','mauris@Praesent.net','Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec'),
('Breanna H. Rasmussen','dictum.eu.eleifend@Donec.edu','rutrum lorem ac'),
('Phyllis Sharpe','condimentum.Donec@metusurnaconvallis.ca','felis eget varius ultrices, mauris'),
('Dylan Massey','velit.in@loremeget.ca','consequat dolor vitae dolor. Donec fringilla. Donec feugiat metus'),
('Christian E. Stewart','a.feugiat@consequatnec.net','massa. Vestibulum accumsan neque et nunc. Quisque ornare'),
('Kaden Arnold','augue.malesuada.malesuada@fringillacursus.net','fames ac'),
('Daphne Christensen','In.nec.orci@condimentum.net','arcu. Vivamus sit amet'),
('Jamalia Ayers','vitae@luctus.com','egestas blandit. Nam nulla magna, malesuada vel, convallis in,'),
('Kellie Contreras','dapibus@PraesentluctusCurabitur.ca','pede. Cras vulputate'),
('Laurel Vasquez','Quisque.varius@acmattisornare.com','pede blandit congue. In scelerisque scelerisque dui. Suspendisse'),
('Anastasia Y. Farrell','augue@aliquamenimnec.org','aliquet magna a neque. Nullam ut nisi a odio'),
('Orlando Adams','in@pedeacurna.edu','Cras convallis convallis dolor. Quisque tincidunt pede ac urna. Ut'),
('Jamal U. Bentley','mus@venenatisamagna.com','Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed pede.'),
('Christine Arnold','ornare.elit@risusMorbimetus.net','cursus et, magna. Praesent interdum ligula eu'),
('Aline C. Mcclain','tristique.senectus@Maurisquisturpis.org','ligula. Nullam enim. Sed nulla ante,'),
('Aphrodite Kelley','velit.Sed@Donecat.org','diam. Duis'),
('Nerea Snider','tempus@varius.net','Phasellus dolor elit, pellentesque a, facilisis non, bibendum'),
('Nelle Lindsay','conubia.nostra@magnaet.co.uk','elementum purus, accumsan interdum libero dui nec'),
('Callum Q. Weaver','metus.eu.erat@utnisi.ca','mauris sagittis placerat.'),
('Courtney Y. Davidson','cursus@sitametdiam.edu','metus urna convallis erat, eget tincidunt dui augue'),
('Harding C. Woodard','orci@Cum.net','congue a, aliquet vel, vulputate eu, odio. Phasellus at'),
('Zenaida Chang','Fusce.mi@nisi.co.uk','lobortis tellus justo sit amet nulla. Donec non'),
('Curran Lott','quis@fringillaeuismod.co.uk','id'),
('Ulysses Dominguez','neque.Nullam@acturpisegestas.org','Proin nisl sem, consequat nec, mollis vitae, posuere at, velit.'),
('Abra Beard','nibh.Aliquam.ornare@seddictumeleifend.edu','egestas. Sed pharetra,'),
('Travis S. Griffin','ac.urna.Ut@arcu.org','at, nisi. Cum sociis natoque penatibus et'),
('Piper U. Flores','sem.semper.erat@magnaDuisdignissim.co.uk','Aliquam vulputate ullamcorper magna. Sed eu eros.'),
('Bell Kemp','luctus.Curabitur@adipiscingfringilla.edu','penatibus et magnis'),
('Bryar Hays','augue.porttitor.interdum@liberonec.org','non ante bibendum ullamcorper. Duis'),
('Shay P. Jenkins','neque.Nullam@convallis.net','euismod urna. Nullam'),
('Wyoming Stark','leo.Morbi@ultricesVivamus.org','Nulla aliquet. Proin velit. Sed malesuada augue ut lacus.'),
('Quon Montoya','aliquet.libero@egestasSed.edu','nec quam. Curabitur'),
('Sydney V. Glover','arcu.vel.quam@auctornon.co.uk','Curabitur egestas nunc sed libero. Proin sed turpis nec'),
('Keely V. Mccormick','a.feugiat@aliquet.ca','a, auctor'),
('Blake Pitts','eu.tellus@cursus.edu','euismod mauris eu elit. Nulla facilisi.'),
('Beau R. Wood','lacus@montesnascetur.com','euismod in, dolor. Fusce'),
('Shellie Singleton','lectus@loremeget.net','luctus et ultrices posuere cubilia'),
('Bertha Ochoa','lorem@blandit.org','volutpat ornare, facilisis eget, ipsum.'),
('Eleanor Houston','sem.elit.pharetra@tempusloremfringilla.edu','et malesuada fames ac turpis egestas.'),
('Austin Gilbert','luctus.aliquet.odio@vellectusCum.ca','ac mattis semper, dui'),
('Iona Molina','ipsum.sodales@Fuscealiquet.org','pede, malesuada vel, venenatis vel, faucibus id,'),
('Amber D. Hansen','vitae.aliquam.eros@ut.net','fringilla mi'),
('Sebastian D. Booker','gravida@Uttincidunt.net','sem'),
('Adam X. Gates','quis.urna.Nunc@consequat.co.uk','blandit mattis. Cras eget'),
('Lydia O. Walter','ut@Duisvolutpatnunc.edu','adipiscing ligula. Aenean gravida nunc'),
('Ocean H. Faulkner','sed@sitamet.net','augue'),
('Cailin Dixon','auctor@in.edu','mauris. intger sem elit, pharetra ut, pharetra sed, hendrerit'),
('Michael K. Rasmussen','lobortis@lobortisrisus.edu','eget, dictum placerat, augue. Sed molestie.'),
('Shaine K. Lamb','Donec@odiotristique.edu','tristique pharetra. Quisque ac libero nec ligula'),
('Donna Q. Wells','eu.arcu.Morbi@pede.org','enim commodo hendrerit. Donec porttitor tellus'),
('Olivia Delgado','scelerisque.scelerisque.dui@aliquetnecimperdiet.com','ullamcorper. Duis'),
('Jaquelyn Alexander','mus.Proin@milacinia.ca','Duis'),
('Lara Shields','egestas@Quisquepurus.net','Phasellus elit pede, malesuada vel, venenatis'),
('Carlos Bonner','eu.eros.Nam@quam.org','Sed auctor odio a purus.'),
('Kay J. Rosales','dolor.sit.amet@eget.co.uk','odio sagittis semper. Nam tempor diam dictum sapien.'),
('Tasha Moss','semper.egestas@arcu.edu','aliquet lobortis, nisi'),
('Faith Y. Norris','nec.leo@orciconsectetuer.com','leo. Cras vehicula aliquet libero. intger'),
('Kato C. Bradshaw','est.mollis@gravida.ca','massa non ante bibendum ullamcorper. Duis cursus, diam at pretium'),
('Elaine Bridges','ante.iaculis@rhoncus.net','lobortis tellus justo sit amet nulla. Donec non justo.'),
('Charlotte Bryan','pede.Praesent@eu.com','Cras dolor dolor, tempus non, lacinia at, iaculis'),
('Jordan X. Sanders','Mauris@etipsumcursus.edu','a, auctor non, feugiat nec, diam. Duis mi enim,'),
('Tate L. Clark','ornare@tortorat.co.uk','Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu'),
('Idola I. Little','fermentum.metus.Aenean@magnaSuspendissetristique.net','ipsum dolor sit amet, consectetuer adipiscing elit. Etiam laoreet,'),
('Lacey L. Ramos','a.dui@a.edu','in'),
('Lucian Hogan','lectus@accumsannequeet.org','sit'),
('Ryan Conner','ullamcorper@Nullamfeugiatplacerat.com','lorem semper auctor. Mauris vel turpis. Aliquam'),
('Ruth Z. Brady','arcu.Vestibulum@convallisantelectus.co.uk','malesuada vel, convallis in, cursus et,'),
('Shellie Lancaster','sit@congueturpis.ca','In scelerisque scelerisque dui.'),
('Nolan Ward','nisl.elementum@liberoProin.ca','eros nec tellus. Nunc lectus pede, ultrices'),
('Tashya Potter','augue@Nulla.co.uk','est,'),
('Deacon V. Owens','Nullam@mauris.com','porttitor eros'),
('Lawrence Atkinson','odio.Nam.interdum@inceptos.co.uk','varius orci, in consequat enim diam vel'),
('Cade Burton','nulla.intger.vulputate@malesuadautsem.net','sem semper'),
('Cain L. Figueroa','et@felis.net','nec tellus. Nunc lectus pede, ultrices'),
('Brody Howard','luctus.et.ultrices@apurus.com','molestie tellus. Aenean egestas hendrerit'),
('Pamela B. Finch','facilisis@diamluctuslobortis.org','lorem'),
('Denise Vargas','est@arcuVivamus.ca','lobortis augue scelerisque mollis.'),
('Yoshio King','cursus@sapienAeneanmassa.co.uk','eget metus eu erat'),
('Quintessa Booker','blandit.enim@nuncinterdumfeugiat.com','Sed neque. Sed eget'),
('Patrick F. Christensen','luctus.sit.amet@Proin.ca','vitae velit egestas lacinia. Sed congue, elit sed'),
('Indira N. Camacho','imperdiet.erat@necmetus.org','senectus et'),
('Jeremy Key','dolor.quam@volutpatNulladignissim.ca','intger vulputate, risus a ultricies adipiscing,'),
('Norman Hopper','vitae@eteuismodet.net','diam lorem, auctor quis, tristique ac, eleifend vitae,'),
('Ariana Collier','Suspendisse.dui.Fusce@dolorQuisque.com','augue eu tellus. Phasellus elit pede, malesuada vel,'),
('Brendan W. Jennings','libero@feugiatLorem.edu','urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus'),
('Hedda B. Perry','Phasellus@lorem.org','tellus, imperdiet non, vestibulum nec, euismod'),
('Bell Keller','volutpat.ornare.facilisis@Donecnonjusto.net','metus. Vivamus euismod urna.');

SELECT nome, obs FROM alunos WHERE MATCH(nome, obs) AGAINST ('Jordan Sanders feugiat');

SELECT nome, MATCH(nome, obs) AGAINST ('Jordan Sanders feugiat') FROM alunos ORDER BY MATCH(nome, obs) AGAINST ('Jordan Sanders feugiat') DESC;

DROP TABLE IF EXISTS usuario;
CREATE TABLE usuario
(
	id        INT(11) AUTO_INCREMENT,
	nome      VARCHAR(255),
	email     VARCHAR(255),
	senha     VARCHAR(255),
	PRIMARY KEY (id)
)ENGINE=InnoDB;

DROP TABLE IF EXISTS atividade;
CREATE TABLE atividade
(
	id INT(11) AUTO_INCREMENT,
	idUsuario  INT(11),
	dataHora   TIMESTAMP,
	PRIMARY KEY (id)
)ENGINE=InnoDB;

DROP PROCEDURE IF EXISTS insereUsuario;

DELIMITER $$  
CREATE PROCEDURE insereUsuario(qtd INT)
BEGIN
	DECLARE v_limite INT DEFAULT qtd;
	DECLARE v_contador INT DEFAULT 0;
	START TRANSACTION;
		WHILE v_contador < v_limite DO
	    	INSERT INTO usuario (nome, email, senha) 
	    		VALUES 
	    			(
	    			CONCAT ('nomedocara', FLOOR((RAND() * v_limite))),
	    			CONCAT ('emaildocara','@' , FLOOR((RAND() * v_limite)), '.com.br'),
	    			CONCAT ('senhadocara', MD5(RAND()))
	    			 );
	    	SET v_contador = v_contador + 1;
		END WHILE;
	COMMIT;
END $$

DELIMITER ;

DROP PROCEDURE IF EXISTS insereatividade;

DELIMITER $$  
CREATE PROCEDURE insereAtividade(qtd INT)
BEGIN
	DECLARE v_limite INT DEFAULT qtd;
	DECLARE v_contador INT DEFAULT 0;
    SELECT MAX(id) INTO @v_limite FROM usuario;
	START TRANSACTION;
		WHILE v_contador < v_limite DO
	    	INSERT INTO atividade (idUsuario) 
	    		VALUES 
	    			(1+RAND()*v_limite);
	    	SET v_contador = v_contador + 1;
		END WHILE;
	COMMIT;
END $$

DELIMITER ;

CALL insereUsuario(100000);
CALL insereAtividade(1000);

-- Tente valores maiores (cuidado para "não travar o Nintendo")
/*
mysqlslap --user=root --password --host=localhost --concurrency=88 --iterations=100 --create-schema=aula06 --query="SELECT * FROM alunos;"

mysqlslap --user=root --password --host=localhost --concurrency=90 --iterations=10 --create-schema=aula06 --query="SELECT MAX(id) FROM usuario;"

mysqlslap --user=root --password --host=localhost --concurrency=90 --iterations=20 --number-int-cols=2 --number-char-cols=3 --auto-generate-sql

mysqlslap --user=root --password --delimiter=";" --create="CREATE TABLE a (b int); INSERT INTO a VALUES (23)" --query="SELECT * FROM a" --concurrency=80 --iterations=20

mysqlslap --delimiter=";" --create="CREATE TABLE a (b int); INSERT INTO a VALUES (23)" --query="SELECT * FROM a" --concurrency=50 --iterations=200
*/

SELECT COUNT(*) 
FROM usuario 
WHERE email = 'emaildocara@591939.com.br';

SELECT COUNT(*) 
FROM usuario 
WHERE nome = 'nomedocara189970';

ALTER TABLE usuario ADD INDEX idxEmail (email);

SELECT COUNT(*) 
FROM usuario 
WHERE email = 'emaildocara@591939.com.br';

