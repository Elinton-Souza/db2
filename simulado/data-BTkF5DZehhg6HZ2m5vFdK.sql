DROP TABLE IF EXISTS `myTable`;

CREATE TABLE `myTable` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `name_aluno` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `data_cadastro` varchar(255),
  PRIMARY KEY (`id`)
) AUTO_INCREMENT=1;

INSERT INTO `myTable` (`name_aluno`,`email`,`data_cadastro`)
VALUES
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
