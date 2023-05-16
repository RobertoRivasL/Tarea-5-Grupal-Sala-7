CREATE USER 'tarea5'@'localhost' IDENTIFIED BY 'Tin1959';
GRANT ALL PRIVILEGES ON * . * TO 'tarea5'@'localhost';
FLUSH PRIVILEGES;
SHOW GRANTS FOR 'tarea5'@'localhost';
create database T2_I_M3;
drop database T2_I_M3;
create database T5_I_M3;
use T5_I_M3;
SET time_zone = '-3:00';
CREATE TABLE IF NOT EXISTS usuarios_T5_I_M3
(id_usuario varchar(20) primary key unique not null,
 nombre varchar(40) not null,
 apellido varchar(40) not null,
 contrasena varchar(15) not null,
 utc varchar(15) default 'UTC-3' not null,
 genero varchar(1) not null,
 fono_contacto varchar(15) not null);
INSERT INTO usuarios_T5_I_M3 VALUES(
'11474861-7','JOAQUIN','SERRANO','gato123','2023-01-01','M','6424565'),
("15694122-0","LEO","REYES","CUMBIA4342","2023-02-12","M","6424565"),
("13637877-5","MARIE","CURIE","NOBEL","2023-01-15","F","32328973"),
("17554766-5","FRIDA","KHALO","CEJAS32","2023-05-10","F","92837832"),
("16069456-4","MICHELLE","BACHELET","PASO2013","2023-05-09","F","92237266"),
("15024121-9","ATURO","PRATT","ALABORDAJE","2023-05-10","M","92237116"),
("13864421-9","ARMANDO","MENDOZA","BETTYBELLA","2023-05-08","M","98672511"),
("26466659-7","FRANKLIN","FUENTES","VIRGO","2023-05-12","M","98675555");
alter table usuarios_T5_I_M3 change utc zona_horaria date;
update usuarios_T5_I_M3 set zona_horaria = 'UTC-3';
SELECT @@GLOBAL.time_zone, @@SESSION.time_zone;
CREATE TABLE IF NOT EXISTS usuarios_ing (
    `id_ingreso` INT,
    `id_usuario` VARCHAR(10) CHARACTER SET utf8mb4 not null,
    `fec_hor_ing` DATETIME DEFAULT CURRENT_TIMESTAMP);
DROP TABLE usuarios_ing;
INSERT INTO usuarios_ing VALUES (100,'11474861-7','2023-01-15 00:00:00'),
	(101,'15694122-0','2023-01-16 00:00:00'),
	(100,'11474861-7','2023-01-17 00:00:00'),
	(102,'13637877-5','2023-01-07 00:00:00'),
	(103,'17554766-5','2023-01-15 00:00:00'),
	(104,'16069456-4','2023-01-16 00:00:00'),
	(102,'13637877-5','2023-01-18 00:00:00');
UPDATE usuarios_ing SET `fec_hor_ing` = CONVERT_TZ(`fec_hor_ingreso`, '-03:00', '-02:00');
SELECT @@GLOBAL.time_zone, @@SESSION.time_zone;
SET time_zone = '-2:00';
CREATE TABLE IF NOT EXISTS contactos (
    `id_contacto` INT auto_increment primary key not null,
    `id_usuario` VARCHAR(10) CHARACTER SET utf8mb4 not null,
    `fono_contacto` varchar(15) CHARACTER SET utf8mb4 not null,
    `correo_electronico` VARCHAR(24) CHARACTER SET utf8mb4 not null);
INSERT INTO contactos VALUES (NULL,'11474861-7',6424565,'cviera@yahoo.es'),
	(NULL,'15694122-0',32328973,'carolina.reyes@live.com'),
	(NULL,'11474861-7',92837832,'cmanuel@hotmail.com'),
	(NULL,'13637877-5',92237266,'claudia.feliu@outlook.cl'),
	(NULL,'17554766-5',92237116,'claudia.calle@outlook.cl'),
	(NULL,'16069456-4',98672511,'claudio.araya@live.com'),
	(NULL,'13637877-5',98675555,'carayam@adalid.cl');
ALTER TABLE contactos ADD FOREIGN KEY (id_usuario) REFERENCES usuarios_t5_i_m3(id_usuario);
alter table usuarios_t5_i_m3 drop column fono_contacto;
