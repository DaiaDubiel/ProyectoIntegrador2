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
  `fecha_lanzamiento` YEAR(4) NOT NULL,
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

insert into album values('1','2','602448064851','Holy Fvck','16','2022','2560.55','98','https://i.discogs.com/sROffi3nsEcQd3K7LLFCWM9NjS6TXpNY5BpA6jFjdVs/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTI0MjQ3/MjIzLTE2NjA5Mzgy/NjItNzIyOC5qcGVn.jpeg');
insert into album values('2','1','194397420524','MAS CARO QUE AYER','18','2021','300.48','16','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlSVH7Moy8fgjMpumDJWpnL7iMnBr44entXRZ-ip96V39kwFN2bMXJq-YVz7M-iZXDAP0&usqp=CAU');
insert into album values('3','3','508222 0','HEATHEN','12','2002','25.36','25','https://i.discogs.com/zPO_rrlppom0sAP_rgOnxCJznJqqw3-YW4NjqTYwtKI/rs:fit/g:sm/q:90/h:599/w:599/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTU5NjUx/MS0xMjI5NjM3NDkx/LmpwZWc.jpeg');
insert into album values('4','4','0034553235','BLACK TIE WHITE NOISE','4','2003','142.37','47','https://i.discogs.com/2VdYF1zlYBIkgYAQu0P-e0GaoHryN6rRfqa6pQzw-UE/rs:fit/g:sm/q:90/h:599/w:594/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTEwNjY2/NjQtMTE4OTUzOTUw/MS5qcGVn.jpeg');
insert into album values('5','5','B0027184_02','04:44','13','2017','1500','59','https://i.discogs.com/mY5jx7tLrGpIQvJKyfD8L0-PulDev7PgEXBajZ1HwCQ/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTEwNTM3/MTY1LTE1Njg2Njk4/NTQtMzAwMS5qcGVn.jpeg');
insert into album values('6','6','B0004813_02','LATE REGISTRATION','21','2005','123','1','https://i.discogs.com/VaGAJ7bFhiP1JY5nrQDFGGw2mmbU7OH0xm_j9msSaNM/rs:fit/g:sm/q:90/h:592/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTQ5NDE2/OS0xNTAxMjY5NDM1/LTMxNzIuanBlZw.jpeg');
insert into album values('7','7','B0001533-02','Resurrection','14','2003','14.78','3','https://i.discogs.com/pWMx5ErnYekeFomn1R8X4SjOFRBVm6csm5LUtcLuvLk/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTI1MTY5/MS0xMzk3ODgxMDU4/LTY3NzQuanBlZw.jpeg');
insert into album values('8','1','88697567792','Fuerza Natural','14','2009','151','345','https://i.discogs.com/Ng_TF7utB2rOpjVQDxssTwlERny9eKYBZS2XFFRpu7U/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTI2Mjkx/OTgtMTQyODI1OTM5/Ni05MzIyLmpwZWc.jpeg');
insert into album values('9','8','190296666988','MUSIC OF THE SPHERES','12','2021','169','49','');
insert into album values('10','2','0005797700','SONGS OF EXPERIENCE','17','2017','500','0','');
insert into album values('11','10','7A0F8109','AND JUSTICE FOR ALL','9','1988','320','0','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTl3PUIPfPPG2ZhxOK66BqaisoFd2-L-dYCXqMMax-xwYoRmtTGPT1BAyg3hhKHyAWYG8E&usqp=CAU');
insert into album values('12','11','R2671074','101','20','2021','316.59','57','https://i.discogs.com/ac4UDphQS0Z834SOOdufDWjxQceEN2hEVvVfylHBeWE/rs:fit/g:sm/q:90/h:592/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTIxMjI0/MjkwLTE2Mzg2MzA3/MTAtODQ4NS5qcGVn.jpeg');
insert into album values('13','1','19439885311','DOPAMINA','13','2021','516','12','https://i.discogs.com/A3eSclNDe4ciuX6W7DQJJ-5H6lyoKVzqFlXcn9JZPR0/rs:fit/g:sm/q:90/h:520/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTE4NzUx/MzQyLTE2MjExNjY4/NTItNzI4Mi5qcGVn.jpeg');
insert into album values('14','1','190759900925','ADN','16','2019','22','13','https://i.discogs.com/G2JgS66JLJT4a5isr-h14FbOUPfupHOLaa88jmNLOK8/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTE0Njkw/NDE0LTE1Nzk3MDkx/MjUtMjkyNi5qcGVn.jpeg');
insert into album values('15','1','88697567784-2','THE LAST','18','2009','34','46','https://i.discogs.com/JyMBDcKmCftrPK78lNB4cxW0mWuCfbX2hZLbOSk-lTI/rs:fit/g:sm/q:90/h:540/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTEwMDc1/ODkwLTE0OTExOTA5/MTgtMjk3Mi5qcGVn.jpeg');
insert into album values('16','1','MLMC 0554','GODS PROJECT','15','2005','28','48','https://i.discogs.com/3VNdvMaIP7R_IYeMxvQ-CTOoURdsKrsbKKQlSgY04Y8/rs:fit/g:sm/q:90/h:569/w:568/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTM3NjM5/NTEtMTM0MzQ1NzM4/Ny03OTY2LmpwZWc.jpeg');
insert into album values('17','12','K-136','BACHATA ROSA','10','1990','34','58','https://i.discogs.com/j-kpoILafNGHjoryjd2sOAs4iXOelNwUSoxLd1_hobU/rs:fit/g:sm/q:90/h:600/w:598/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTM2Nzgy/MjgtMTM0MDEwNzI5/OS0zMTc0LmpwZWc.jpeg');
insert into album values('18','13','7421-80227-2','ABRAZAME MUY FUERTE','12','2000','34','69','https://i.discogs.com/7XfzRQbUGcFurhFWVLDpYC7Mxay-UqyT5b-abYrK7nc/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTEwNDAw/NDExLTE1MjQzNTUz/ODgtMzgyMS5qcGVn.jpeg');
insert into album values('19','14','0000050102','CORAZON DE PAPEL','12','2000','67','22','https://i.discogs.com/v5PCgaS2Ga_5lCsum_mEuuIfKxTnOwaQf4sSxdwBaDU/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTExNDc5/MjQ0LTE1MTcwNjg2/MjAtNjQxMC5qcGVn.jpeg');
insert into album values('20','15','056 078','Phil Collins','10','1984','98','1','https://i.discogs.com/tE2BtkaUnn2n3HKMxJ-FQYF8PsHYXsJxsREWyS_OErM/rs:fit/g:sm/q:90/h:600/w:599/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTY3Mzc4/MS0xNTU5MjMwMzc4/LTk1ODAuanBlZw.jpeg');
insert into album values('21','16','814 287-1','Genesis','9','1983','247','3','https://i.discogs.com/53qsKzEyTkh_KxRmXgWy8mAxDfATHtSxasN1KPYFPXo/rs:fit/g:sm/q:90/h:593/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTE2MDU0/MzQtMTY2MjY3NDMw/OC02OTczLmpwZWc.jpeg');
insert into album values('22','4','0000047266','Thriller','9','1982','1320','11','https://i.discogs.com/t3Gzrzp1_DT27bSfVynl5bCmqWqddfUT5ohPHuUDtyE/rs:fit/g:sm/q:90/h:600/w:597/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTE2NTk1/MjctMTY2NDIwNDcy/Mi05NDU4LmpwZWc.jpeg');
insert into album values('23','18','COL 481367 1','Daydream','12','1995','12','2','https://i.discogs.com/GdNcjvx_s5QytpgbThAyx8jEIW8saXBTaky5Z5joiio/rs:fit/g:sm/q:90/h:592/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTE1NDQ0/MzEtMTQzNTcwMzg0/OS0xMDAyLmpwZWc.jpeg');
insert into album values('24','19','5 099907 142710','Charm School','12','2011','987','0','https://i.discogs.com/P-Ty0E8Y5dXZBmk14deaOwyt58eiQ4vPZ3UnsJlFy0w/rs:fit/g:sm/q:90/h:350/w:350/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTI3MjI2/MDUtMTI5ODExOTgy/Ny5qcGVn.jpeg');
insert into album values('25','20','0000017720','Live In Sydney 1991','10','2016','624','1','https://i.discogs.com/abWajKVPDOV28DxzUDwxCCUYqCXoKQMR1tvvBQIZQzU/rs:fit/g:sm/q:90/h:452/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTkxNjI4/NjEtMTQ3NTg5MTc1/OS0yNzIxLmpwZWc.jpeg');


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

























