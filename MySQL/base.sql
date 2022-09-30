#Script de MySQL Workbench para generar Base de datos del TP.


#Crear Database:

CREATE DATABASE disqueria
DEFAULT CHARACTER SET 'utf8mb4'
COLLATE 'utf8mb4_0900_ai_ci';


#Seleccionamos Database:

use disqueria;


#Crear Tablas

CREATE TABLE `disqueria`.`album` (
  `id_album` INT NOT NULL AUTO_INCREMENT,
  `codigo_album` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  `cant_temas` INT NOT NULL,
  `fecha_lanzamiento` DATE NOT NULL,
  `precio` decimal(65,2) NOT NULL,
  `cantidad` INT NOT NULL,
  `caratula` VARCHAR(200) NULL,
  PRIMARY KEY (`id_album`));


CREATE TABLE `disqueria`.`interprete` (
  `id_interprete` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `apellido` VARCHAR(50) NULL,
  `foto` VARCHAR(100) NULL,
  PRIMARY KEY (`id_interprete`));


CREATE TABLE `disqueria`.`genero` (
  `id_genero` INT NOT NULL AUTO_INCREMENT,
  `nombre_genero` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_genero`));


CREATE TABLE `disqueria`.`discografica` (
  `id_discografica` INT NOT NULL AUTO_INCREMENT,
  `nombre_disco` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_discografica`));


CREATE TABLE `disqueria`.`formato` (
  `id_formato` INT NOT NULL AUTO_INCREMENT,
  `tipo_formato` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_formato`));


CREATE TABLE `disqueria`.`tema` (
  `id_tema` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(50) NOT NULL,
  `duracion` TIME NOT NULL,
  `autor` VARCHAR(50) NOT NULL,
  `compositor` VARCHAR(50) NOT NULL,
  `track` INT NULL,
  PRIMARY KEY (`id_tema`));


CREATE TABLE `disqueria`.`album_interprete` (
  `id_album` INT NOT NULL,
  `id_interprete` INT NOT NULL,
  PRIMARY KEY (`id_album`, `id_interprete`));


ALTER TABLE `disqueria`.`album_interprete` 
ADD CONSTRAINT `fk_id_album`
  FOREIGN KEY (`id_album`)
  REFERENCES `disqueria`.`album` (`id_album`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `disqueria`.`album_interprete` 
ADD CONSTRAINT `fk_id_interprete`
  FOREIGN KEY (`id_interprete`)
  REFERENCES `disqueria`.`interprete` (`id_interprete`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


CREATE TABLE `disqueria`.`album_tema` (
  `id_album` INT NOT NULL,
  `id_tema` INT NOT NULL,
  PRIMARY KEY (`id_album`, `id_tema`));

ALTER TABLE `disqueria`.`album_tema` 
ADD CONSTRAINT `fk_idalbum`
  FOREIGN KEY (`id_album`)
  REFERENCES `disqueria`.`album` (`id_album`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `disqueria`.`album_tema` 
ADD CONSTRAINT `fk_idtema`
  FOREIGN KEY (`id_tema`)
  REFERENCES `disqueria`.`tema` (`id_tema`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


CREATE TABLE `disqueria`.`album_genero` (
  `id_album` INT NOT NULL,
  `id_genero` INT NOT NULL,
  PRIMARY KEY (`id_album`, `id_genero`));

ALTER TABLE `disqueria`.`album_genero` 
ADD CONSTRAINT `fk_album`
  FOREIGN KEY (`id_album`)
  REFERENCES `disqueria`.`album` (`id_album`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `disqueria`.`album_genero` 
ADD CONSTRAINT `fk_id_genero`
  FOREIGN KEY (`id_genero`)
  REFERENCES `disqueria`.`genero` (`id_genero`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


CREATE TABLE `disqueria`.`album_formato` (
  `id_album` INT NOT NULL,
  `id_formato` INT NOT NULL,
  PRIMARY KEY (`id_album`, `id_formato`));

ALTER TABLE `disqueria`.`album_formato` 
ADD CONSTRAINT `fk_id_album_af`
  FOREIGN KEY (`id_album`)
  REFERENCES `disqueria`.`album` (`id_album`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `disqueria`.`album_formato` 
ADD CONSTRAINT `fk_id_formato_af`
  FOREIGN KEY (`id_formato`)
  REFERENCES `disqueria`.`formato` (`id_formato`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `disqueria`.`album` 
ADD COLUMN `id_discografia` INT NOT NULL AFTER `id_album`;

ALTER TABLE `disqueria`.`album` 
ADD CONSTRAINT `fk_id_discografica`
  FOREIGN KEY (`id_discografia`)
  REFERENCES `disqueria`.`discografica` (`id_discografica`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


#Insert a las tablas
insert into discografica values('1','Sony Music');
insert into discografica values('2','Island Records');
insert into discografica values('3','ISO RECORDS');
insert into discografica values('4','EMI');
insert into discografica values('5','ROC NATION');
insert into discografica values('6','Roc-A-Fella Records');
insert into discografica values('7','AMARU ENTERTAIMENT');
insert into discografica values('8','PARLOPHONE');
insert into discografica values('9','Island Records');
insert into discografica values('10','Elektra Records');
insert into discografica values('11','RHINO RECORDS');
insert into discografica values('12','KAREN RECORDS');
insert into discografica values('13','BMG');
insert into discografica values('14','UNIVERSAL');
insert into discografica values('15','AMIGA');
insert into discografica values('16','VERTIGO');
insert into discografica values('17','EPIC');
insert into discografica values('18','COLUMBIA');
insert into discografica values('19','Capitol Records');
insert into discografica values('20','Discos CNR Chile');

insert into album values('1','2','602448064851','Holy Fvck','16','2022-01-10','2560.55','98','https://i.discogs.com/sROffi3nsEcQd3K7LLFCWM9NjS6TXpNY5BpA6jFjdVs/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTI0MjQ3/MjIzLTE2NjA5Mzgy/NjItNzIyOC5qcGVn.jpeg');
insert into album values('2','1','194397420524','MAS CARO QUE AYER','18','2021-06-18','300.48','16','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlSVH7Moy8fgjMpumDJWpnL7iMnBr44entXRZ-ip96V39kwFN2bMXJq-YVz7M-iZXDAP0&usqp=CAU');

insert into genero values('1','Latino');
insert into genero values('2','Pop');
insert into genero values('3','Rock');
insert into genero values('4','Soul');
insert into genero values('5','Bachata');
insert into genero values('6','Hip Hop');

insert into formato values('1','CD');
insert into formato values('2','Cassette');
insert into formato values('3','Disco Vinilo');

insert into interprete values('1','MANUEL','TURIZO','');
insert into interprete values('2','AVENTURA','','');
insert into interprete values('3','JUAN LUIS','GUERRA','');
insert into interprete values('4','JUAN','GABRIEL','');
insert into interprete values('5','LOS CHARROS','','');
insert into interprete values('6','GERARDO','ORTIZ','');
insert into interprete values('7','Phil','Collins','');
insert into interprete values('8','Genesis','','');
insert into interprete values('9','Michael','Jackson','');
insert into interprete values('10','Mariah','Carey','');
insert into interprete values('11','Roxette','','');
insert into interprete values('12','DEMI','LOVATO','');
insert into interprete values('13','DAVID','BOWIE','');
insert into interprete values('14','JAY_Z','','');
insert into interprete values('15','KAYNE','WEST','');
insert into interprete values('16','TUPAC','','');
insert into interprete values('17','Gustavo','Cerati','');
insert into interprete values('18','COLDPLAY','','');
insert into interprete values('19','U2','','');
insert into interprete values('20','METALLICA','','');
insert into interprete values('21','DEPECHE MODE','','');


insert into tema values('1','Más Caro, que ayer (versión norteño banda)','02:41','Gerardo Ortiz','Gerardo Ortiz','1');
insert into tema values('2','El Omega','02:09','Gerardo Ortiz','Gerardo Ortiz','2');
insert into tema values('3','Sin alucinarme','02:22','Gerardo Ortiz','Gerardo Ortiz','3');
insert into tema values('4','Esa noche','03:04','Gerardo Ortiz','Gerardo Ortiz','4');
insert into tema values('5','El Supremo','02:33','Gerardo Ortiz','Gerardo Ortiz','5');
insert into tema values('6','Jorgito Corona','03:31','Gerardo Ortiz','Gerardo Ortiz','6');
insert into tema values('7','El Uno','02:51','Gerardo Ortiz','Gerardo Ortiz','7');
insert into tema values('8','Dos extraños','02:25','Gerardo Ortiz','Gerardo Ortiz','8');
insert into tema values('9','El Rubio','02:21','Gerardo Ortiz','Gerardo Ortiz','9');
insert into tema values('10','Elefante blanco','02:30','Gerardo Ortiz','Gerardo Ortiz','10');
insert into tema values('11','Demi Ortiz','02:55','Gerardo Ortiz','Gerardo Ortiz','11');
insert into tema values('12','Callada','02:37','Gerardo Ortiz','Gerardo Ortiz','12');
insert into tema values('13','El Chavo','02:25','Gerardo Ortiz','Gerardo Ortiz','13');
insert into tema values('14','Rápido me muevo','02:27','Gerardo Ortiz','Gerardo Ortiz','14');
insert into tema values('15','El sombrero no se cae','03:15','Gerardo Ortiz','Gerardo Ortiz','15');
insert into tema values('16','Más caro, que ayer','02:27','Gerardo Ortiz','Gerardo Ortiz','16');
insert into tema values('17','Otra borrachera','02:18','Gerardo Ortiz','Gerardo Ortiz','17');
insert into tema values('18','Otra borrachera (versión mariachi)','02:18','Gerardo Ortiz','Gerardo Ortiz','18');

insert into tema values('19','Freak (con Yungblud )','02:36','Demi Lovato feat. YUNGBLUD','Laura Veltz Michael Pollack dominic harrison','1');
insert into tema values('20',' Piel de mis dientes ','02:42','Demi Lovato','Veltz Aaron Puckett','2');
insert into tema values('21','sustancia','02:40','Demi Lovato','Veltz Jordan Laúdes','3');
insert into tema values('22','Eat Me (con Royal & the Serpent )','03:00','Demi Lovato feat. Royal & the Serpent','Veltz Ryan Santiago','4');
insert into tema values('23','Santo Fvck','02:34','Demi Lovato','Veltz Salem Ilese Davern','5');
insert into tema values('24','29','02:43','Demi Lovato','Veltz Sean Douglas','6');
insert into tema values('25','Final feliz','03:49','Demi Lovato','Veltz laúdes mitch alan','7');
insert into tema values('26','Cielo','02:27','Demi Lovato','Veltz puckett','8');
insert into tema values('27','Ciudad de Angeles','02:51','Demi Lovato','Alano laúdes Davern','9');
insert into tema values('28','Huesos','02:31','Demi Lovato','emily amstrong popurrí siouxsie sean viernes','10');
insert into tema values('29','Desperdiciado','03:03','Demi Lovato','Veltz douglas','11');
insert into tema values('30','Reunirse','03:33','Demi Lovato','Veltz douglas','12');
insert into tema values('31','Amigos muertos','02:57','Demi Lovato','Veltz sam ellis','13');
insert into tema values('32','Ayúdame (con Dead Sara )','03:23','Demi Lovato feat. Dead Sara','amstrong Popurrí Viernes','14');
insert into tema values('33','Alimento','03:13','Demi Lovato','Veltz daniel tashian JT Daly','15');
insert into tema values('34','4 siempre 4 yo','03:43','Demi Lovato','Veltz Alano Susan Joyce','16');

insert into album_interprete values('1','12');
insert into album_interprete values('2','6');

insert into album_genero values('1','2');
insert into album_genero values('2','1');

insert into album_formato values('1','1');
insert into album_formato values('2','1');

insert into album_tema values('1','19');
insert into album_tema values('1','20');
insert into album_tema values('1','21');
insert into album_tema values('1','22');
insert into album_tema values('1','23');
insert into album_tema values('1','24');
insert into album_tema values('1','25');
insert into album_tema values('1','26');
insert into album_tema values('1','27');
insert into album_tema values('1','28');
insert into album_tema values('1','29');
insert into album_tema values('1','30');
insert into album_tema values('1','31');
insert into album_tema values('1','32');
insert into album_tema values('1','33');
insert into album_tema values('1','34');
insert into album_tema values('2','1');
insert into album_tema values('2','2');
insert into album_tema values('2','3');
insert into album_tema values('2','4');
insert into album_tema values('2','5');
insert into album_tema values('2','6');
insert into album_tema values('2','7');
insert into album_tema values('2','8');
insert into album_tema values('2','9');
insert into album_tema values('2','10');
insert into album_tema values('2','11');
insert into album_tema values('2','12');
insert into album_tema values('2','13');
insert into album_tema values('2','14');
insert into album_tema values('2','15');
insert into album_tema values('2','16');
insert into album_tema values('2','17');
insert into album_tema values('2','18');







































