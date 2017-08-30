/**** CREACION DE LA BASE DE DATOS ****/

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


DROP DATABASE IF EXISTS bquiet;
CREATE DATABASE IF NOT EXISTS bquiet;

USE bquiet;

/**** CREACION DE TABLAS ****/

CREATE TABLE tipousuario (
	id INT(2) AUTO_INCREMENT  NOT NULL PRIMARY KEY,
	nombre VARCHAR(50) UNIQUE COLLATE utf8_spanish_ci NOT NULL

)ENGINE = INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE usuarios (
	id INT(6) AUTO_INCREMENT NOT NULL PRIMARY KEY,
	id_tipousuario INT(1) NOT NULL,
	nombre VARCHAR(50) COLLATE utf8_spanish_ci UNIQUE NOT NULL,
	pass VARCHAR(20) COLLATE utf8_spanish_ci NOT NULL,
	FOREIGN KEY (id_tipousuario) REFERENCES tipousuario (id) ON DELETE CASCADE ON UPDATE CASCADE

) ENGINE = INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE centros (
	id INT(5) AUTO_INCREMENT NOT NULL PRIMARY KEY,
	nombre VARCHAR(50) COLLATE utf8_spanish_ci NOT NULL,
	provincia VARCHAR(50) COLLATE utf8_spanish_ci NOT NULL default '',
	direccion VARCHAR(150) COLLATE utf8_spanish_ci UNIQUE NOT NULL default ''

) ENGINE = INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


CREATE TABLE usuarios_centros (
	id INT(5) AUTO_INCREMENT NOT NULL PRIMARY KEY,
	id_usuario INT(50) NOT NULL,
	id_centro INT(5) NOT NULL,
	FOREIGN KEY (id_usuario) REFERENCES usuarios (id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (id_centro) REFERENCES centros (id) ON DELETE CASCADE ON UPDATE CASCADE

) ENGINE = INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE registros (
	id INT(5) AUTO_INCREMENT NOT NULL PRIMARY KEY,
	lmax INT(5) NOT NULL,
	lmin INT(5) NOT NULL,
	id_usuario INT(5) NOT NULL,
	fecha DATE  NOT NULL,
	FOREIGN KEY (id_usuario) REFERENCES usuarios (id) ON DELETE CASCADE ON UPDATE CASCADE
	
) ENGINE = INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE lista_registros (
	id INT(5) AUTO_INCREMENT NOT NULL PRIMARY KEY,
	id_registro INT(5) NOT NULL,
	valor INT(5) NOT NULL,
	fecha TIME NOT NULL,
	FOREIGN KEY (id_registro) REFERENCES registros (id) ON DELETE CASCADE ON UPDATE CASCADE
	
) ENGINE = INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE tokens (
	id INT(5) AUTO_INCREMENT NOT NULL PRIMARY KEY,
	id_usuario INT(5) UNIQUE NOT NULL,
	token VARCHAR(36) COLLATE utf8_spanish_ci UNIQUE NOT NULL,
	FOREIGN KEY (id_usuario) REFERENCES usuarios (id) ON DELETE CASCADE ON UPDATE CASCADE
	
) ENGINE = INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


/**** INSERCION EN TABLAS ****/

INSERT INTO tipousuario (nombre) VALUES ('administrador');
INSERT INTO tipousuario (nombre) VALUES ('superusuario');
INSERT INTO tipousuario (nombre) VALUES ('usuario');

INSERT INTO usuarios (id, id_tipousuario, nombre, pass) VALUES (1, 1, 'admin', 'admin');
INSERT INTO usuarios (id_tipousuario, nombre, pass) VALUES (2, 'super', 'admin');
INSERT INTO usuarios (id_tipousuario, nombre, pass) VALUES (2, 'Ivan', 'admin');
INSERT INTO usuarios (id_tipousuario, nombre, pass) VALUES (2, 'Cris', 'admin');
INSERT INTO usuarios (id_tipousuario, nombre, pass) VALUES (3, 'Sergio', 'admin');
INSERT INTO usuarios (id_tipousuario, nombre, pass) VALUES (3, 'Cristian', 'admin');
INSERT INTO usuarios (id_tipousuario, nombre, pass) VALUES (3, 'Rodolfo', 'admin');
INSERT INTO usuarios (id_tipousuario, nombre, pass) VALUES (3, 'Agustin', 'admin');
INSERT INTO usuarios (id_tipousuario, nombre, pass) VALUES (3, 'Laura', 'admin');
INSERT INTO usuarios (id_tipousuario, nombre, pass) VALUES (3, 'Paula', 'admin');
INSERT INTO usuarios (id_tipousuario, nombre, pass) VALUES (3, 'Emilio', 'admin');
INSERT INTO usuarios (id_tipousuario, nombre, pass) VALUES (3, 'Federico', 'admin');
INSERT INTO usuarios (id_tipousuario, nombre, pass) VALUES (3, 'Carolina', 'admin');

INSERT INTO centros(nombre,provincia,direccion) VALUES ("Los llanos","Málaga","Calle llanos");
INSERT INTO centros(nombre,provincia,direccion) VALUES ("Los flores","Málaga","Calle flores");
INSERT INTO centros(nombre,provincia,direccion) VALUES ("El valle","Málaga","Calle valle");



INSERT INTO usuarios_centros(id_usuario,id_centro) VALUES (2,1);
INSERT INTO usuarios_centros(id_usuario,id_centro) VALUES (3,2);
INSERT INTO usuarios_centros(id_usuario,id_centro) VALUES (4,3);
INSERT INTO usuarios_centros(id_usuario,id_centro) VALUES (5,2);
INSERT INTO usuarios_centros(id_usuario,id_centro) VALUES (6,2);
INSERT INTO usuarios_centros(id_usuario,id_centro) VALUES (7,1);
INSERT INTO usuarios_centros(id_usuario,id_centro) VALUES (8,1);
INSERT INTO usuarios_centros(id_usuario,id_centro) VALUES (9,1);
INSERT INTO usuarios_centros(id_usuario,id_centro) VALUES (10,2);
INSERT INTO usuarios_centros(id_usuario,id_centro) VALUES (11,2);
INSERT INTO usuarios_centros(id_usuario,id_centro) VALUES (12,2);
INSERT INTO usuarios_centros(id_usuario,id_centro) VALUES (13,2);



/*Usuario 6*/
INSERT INTO registros (id, lmax, lmin, id_usuario, fecha) VALUES (1, 80, 40, 6, "2017/03/15");

INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 85, "09:01:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 81, "09:02:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 80, "09:03:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 77, "09:04:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 73, "09:05:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 81, "09:06:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 71, "09:07:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 68, "09:08:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 50, "09:09:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 20, "09:10:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 30, "09:11:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 45, "09:12:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 66, "09:13:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 33, "09:14:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 28, "09:15:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 55, "09:16:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 81, "09:17:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 67, "09:18:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 34, "09:19:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 76, "09:20:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 55, "09:21:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 53, "09:22:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 75, "09:23:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 66, "09:24:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 80, "09:25:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 83, "09:26:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 81, "09:27:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 79, "09:28:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 75, "09:29:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 61, "09:30:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 85, "09:31:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 81, "09:32:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 80, "09:33:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 77, "09:34:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 73, "09:35:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 81, "09:36:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 71, "09:37:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 68, "09:38:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 50, "09:39:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 20, "09:40:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 30, "09:41:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 45, "09:42:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 66, "09:43:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 33, "09:44:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 28, "09:45:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 55, "09:46:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 81, "09:47:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 67, "09:48:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 34, "09:49:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 76, "09:50:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 55, "09:51:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 53, "09:52:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 75, "09:53:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 66, "09:54:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 80, "09:55:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 83, "09:56:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 81, "09:57:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 79, "09:58:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 75, "09:59:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 61, "10:00:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 85, "10:01:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 81, "10:02:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 80, "10:03:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 77, "10:04:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 73, "10:05:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 81, "10:06:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 71, "10:07:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 68, "10:08:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 50, "10:09:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 20, "10:10:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 30, "10:11:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 45, "10:12:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 66, "10:13:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 33, "10:14:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 28, "10:15:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 55, "10:16:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 81, "10:17:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 67, "10:18:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 34, "10:19:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 76, "10:20:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 55, "10:21:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 53, "10:22:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 75, "10:23:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 66, "10:24:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 80, "10:25:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 83, "10:26:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 81, "10:27:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 79, "10:28:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 75, "10:29:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 61, "10:30:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 85, "10:31:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 81, "10:32:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 80, "10:33:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 77, "10:34:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 73, "10:35:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 81, "10:36:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 71, "10:37:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 68, "10:38:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 50, "10:39:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 20, "10:40:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 30, "10:41:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 45, "10:42:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 66, "10:43:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 33, "10:44:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 28, "10:45:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 55, "10:46:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 81, "10:47:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 67, "10:48:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 34, "10:49:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 76, "10:50:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 55, "10:51:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 53, "10:52:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 75, "10:53:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 66, "10:54:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 80, "10:55:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 83, "10:56:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 81, "10:57:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 79, "10:58:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 75, "10:59:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 24, "11:01:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 24, "11:02:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 24, "11:03:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 77, "11:04:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 73, "11:05:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 24, "11:06:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 71, "11:07:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 68, "11:08:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 50, "11:09:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 20, "11:10:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 30, "11:11:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 45, "11:12:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 66, "11:13:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 33, "11:14:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 28, "11:15:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 55, "11:16:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 24, "11:17:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 67, "11:18:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 34, "11:19:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 76, "11:20:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 55, "11:21:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 53, "11:22:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 75, "11:23:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 66, "11:24:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 24, "11:25:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 24, "11:26:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 24, "11:27:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 79, "11:28:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 75, "11:29:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 61, "11:30:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 24, "11:31:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 24, "11:32:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 24, "11:33:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 77, "11:34:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 73, "11:35:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 24, "11:36:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 71, "11:37:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 68, "11:38:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 50, "11:39:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 20, "11:40:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 30, "11:41:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 45, "11:42:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 66, "11:43:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 33, "11:44:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 28, "11:45:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 55, "11:46:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 24, "11:47:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 67, "11:48:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 34, "11:49:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 76, "11:50:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 55, "11:51:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 53, "11:52:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 75, "11:53:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 66, "11:54:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 24, "11:55:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 24, "11:56:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 24, "11:57:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 79, "11:58:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (1, 75, "11:59:00");

INSERT INTO registros (lmax, lmin, id_usuario, fecha) VALUES (75, 35, 6, "2017/03/16");

INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 85, "09:01:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 81, "09:02:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 80, "09:03:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 77, "09:04:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 73, "09:05:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 81, "09:06:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 71, "09:07:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 68, "09:08:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 50, "09:09:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 20, "09:10:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 30, "09:11:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 45, "09:12:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 66, "09:13:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 33, "09:14:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 28, "09:15:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 55, "09:16:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 81, "09:17:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 67, "09:18:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 34, "09:19:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 76, "09:20:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 55, "09:21:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 53, "09:22:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 75, "09:23:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 66, "09:24:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 80, "09:25:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 83, "09:26:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 81, "09:27:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 79, "09:28:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 75, "09:29:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 61, "09:30:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 85, "09:31:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 81, "09:32:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 80, "09:33:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 77, "09:34:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 73, "09:35:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 81, "09:36:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 71, "09:37:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 68, "09:38:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 50, "09:39:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 20, "09:40:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 30, "09:41:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 45, "09:42:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 66, "09:43:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 33, "09:44:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 28, "09:45:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 55, "09:46:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 81, "09:47:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 67, "09:48:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 34, "09:49:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 76, "09:50:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 55, "09:51:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 53, "09:52:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 75, "09:53:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 66, "09:54:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 80, "09:55:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 83, "09:56:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 81, "09:57:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 79, "09:58:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 75, "09:59:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 61, "10:00:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 85, "10:01:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 81, "10:02:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 80, "10:03:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 77, "10:04:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 73, "10:05:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 81, "10:06:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 71, "10:07:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 68, "10:08:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 50, "10:09:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 20, "10:10:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 30, "10:11:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 45, "10:12:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 66, "10:13:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 33, "10:14:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 28, "10:15:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 55, "10:16:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 81, "10:17:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 67, "10:18:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 34, "10:19:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 76, "10:20:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 55, "10:21:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 53, "10:22:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 75, "10:23:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 66, "10:24:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 80, "10:25:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 83, "10:26:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 81, "10:27:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 79, "10:28:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 75, "10:29:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 61, "10:30:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 85, "10:31:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 81, "10:32:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 80, "10:33:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 77, "10:34:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 73, "10:35:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 81, "10:36:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 71, "10:37:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 68, "10:38:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 50, "10:39:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 20, "10:40:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 30, "10:41:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 45, "10:42:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 66, "10:43:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 33, "10:44:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 28, "10:45:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 55, "10:46:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 81, "10:47:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 67, "10:48:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 34, "10:49:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 76, "10:50:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 55, "10:51:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 53, "10:52:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 75, "10:53:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 66, "10:54:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 80, "10:55:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 83, "10:56:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 81, "10:57:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 79, "10:58:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 75, "10:59:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 24, "11:01:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 24, "11:02:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 24, "11:03:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 77, "11:04:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 73, "11:05:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 24, "11:06:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 71, "11:07:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 68, "11:08:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 50, "11:09:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 20, "11:10:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 30, "11:11:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 45, "11:12:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 66, "11:13:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 33, "11:14:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 28, "11:15:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 55, "11:16:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 24, "11:17:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 67, "11:18:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 34, "11:19:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 76, "11:20:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 55, "11:21:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 53, "11:22:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 75, "11:23:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 66, "11:24:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 24, "11:25:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 24, "11:26:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 24, "11:27:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 79, "11:28:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 75, "11:29:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 61, "11:30:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 24, "11:31:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 24, "11:32:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 24, "11:33:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 77, "11:34:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 73, "11:35:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 24, "11:36:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 71, "11:37:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 68, "11:38:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 50, "11:39:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 20, "11:40:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 30, "11:41:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 45, "11:42:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 66, "11:43:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 33, "11:44:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 28, "11:45:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 55, "11:46:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 24, "11:47:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 67, "11:48:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 34, "11:49:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 76, "11:50:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 55, "11:51:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 53, "11:52:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 75, "11:53:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 66, "11:54:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 24, "11:55:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 24, "11:56:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 24, "11:57:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 79, "11:58:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (2, 75, "11:59:00");


/*Usuario 7*/
INSERT INTO registros (lmax, lmin, id_usuario, fecha) VALUES (80, 40, 7, "2017/03/15");

INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 85, "09:01:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 81, "09:02:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 80, "09:03:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 77, "09:04:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 73, "09:05:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 81, "09:06:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 71, "09:07:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 68, "09:08:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 50, "09:09:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 20, "09:10:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 30, "09:11:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 45, "09:12:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 66, "09:13:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 33, "09:14:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 28, "09:15:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 55, "09:16:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 81, "09:17:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 67, "09:18:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 34, "09:19:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 76, "09:20:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 55, "09:21:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 53, "09:22:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 75, "09:23:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 66, "09:24:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 80, "09:25:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 83, "09:26:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 81, "09:27:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 79, "09:28:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 75, "09:29:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 61, "09:30:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 85, "09:31:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 81, "09:32:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 80, "09:33:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 77, "09:34:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 73, "09:35:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 81, "09:36:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 71, "09:37:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 68, "09:38:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 50, "09:39:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 20, "09:40:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 30, "09:41:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 45, "09:42:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 66, "09:43:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 33, "09:44:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 28, "09:45:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 55, "09:46:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 81, "09:47:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 67, "09:48:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 34, "09:49:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 76, "09:50:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 55, "09:51:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 53, "09:52:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 75, "09:53:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 66, "09:54:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 80, "09:55:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 83, "09:56:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 81, "09:57:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 79, "09:58:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 75, "09:59:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 61, "10:00:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 85, "10:01:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 81, "10:02:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 80, "10:03:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 77, "10:04:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 73, "10:05:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 81, "10:06:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 71, "10:07:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 68, "10:08:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 50, "10:09:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 20, "10:10:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 30, "10:11:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 45, "10:12:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 66, "10:13:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 33, "10:14:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 28, "10:15:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 55, "10:16:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 81, "10:17:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 67, "10:18:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 34, "10:19:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 76, "10:20:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 55, "10:21:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 53, "10:22:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 75, "10:23:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 66, "10:24:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 80, "10:25:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 83, "10:26:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 81, "10:27:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 79, "10:28:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 75, "10:29:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 61, "10:30:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 85, "10:31:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 81, "10:32:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 80, "10:33:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 77, "10:34:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 73, "10:35:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 81, "10:36:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 71, "10:37:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 68, "10:38:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 50, "10:39:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 20, "10:40:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 30, "10:41:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 45, "10:42:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 66, "10:43:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 33, "10:44:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 28, "10:45:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 55, "10:46:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 81, "10:47:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 67, "10:48:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 34, "10:49:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 76, "10:50:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 55, "10:51:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 53, "10:52:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 75, "10:53:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 66, "10:54:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 80, "10:55:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 83, "10:56:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 81, "10:57:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 79, "10:58:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 75, "10:59:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 24, "11:01:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 24, "11:02:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 24, "11:03:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 77, "11:04:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 73, "11:05:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 24, "11:06:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 71, "11:07:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 68, "11:08:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 50, "11:09:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 20, "11:10:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 30, "11:11:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 45, "11:12:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 66, "11:13:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 33, "11:14:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 28, "11:15:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 55, "11:16:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 24, "11:17:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 67, "11:18:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 34, "11:19:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 76, "11:20:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 55, "11:21:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 53, "11:22:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 75, "11:23:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 66, "11:24:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 24, "11:25:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 24, "11:26:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 24, "11:27:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 79, "11:28:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 75, "11:29:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 61, "11:30:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 24, "11:31:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 24, "11:32:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 24, "11:33:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 77, "11:34:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 73, "11:35:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 24, "11:36:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 71, "11:37:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 68, "11:38:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 50, "11:39:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 20, "11:40:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 30, "11:41:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 45, "11:42:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 66, "11:43:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 33, "11:44:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 28, "11:45:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 55, "11:46:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 24, "11:47:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 67, "11:48:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 34, "11:49:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 76, "11:50:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 55, "11:51:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 53, "11:52:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 75, "11:53:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 66, "11:54:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 24, "11:55:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 24, "11:56:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 24, "11:57:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 79, "11:58:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (3, 75, "11:59:00");

INSERT INTO registros (lmax, lmin, id_usuario, fecha) VALUES (70, 45, 7, "2017/03/16");

INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 85, "09:01:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 81, "09:02:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 80, "09:03:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 77, "09:04:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 73, "09:05:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 81, "09:06:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 71, "09:07:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 68, "09:08:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 50, "09:09:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 20, "09:10:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 30, "09:11:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 45, "09:12:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 66, "09:13:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 33, "09:14:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 28, "09:15:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 55, "09:16:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 81, "09:17:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 67, "09:18:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 34, "09:19:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 76, "09:20:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 55, "09:21:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 53, "09:22:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 75, "09:23:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 66, "09:24:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 80, "09:25:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 83, "09:26:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 81, "09:27:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 79, "09:28:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 75, "09:29:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 61, "09:30:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 85, "09:31:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 81, "09:32:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 80, "09:33:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 77, "09:34:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 73, "09:35:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 81, "09:36:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 71, "09:37:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 68, "09:38:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 50, "09:39:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 20, "09:40:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 30, "09:41:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 45, "09:42:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 66, "09:43:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 33, "09:44:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 28, "09:45:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 55, "09:46:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 81, "09:47:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 67, "09:48:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 34, "09:49:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 76, "09:50:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 55, "09:51:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 53, "09:52:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 75, "09:53:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 66, "09:54:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 80, "09:55:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 83, "09:56:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 81, "09:57:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 79, "09:58:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 75, "09:59:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 61, "10:00:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 85, "10:01:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 81, "10:02:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 80, "10:03:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 77, "10:04:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 73, "10:05:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 81, "10:06:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 71, "10:07:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 68, "10:08:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 50, "10:09:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 20, "10:10:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 30, "10:11:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 45, "10:12:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 66, "10:13:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 33, "10:14:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 28, "10:15:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 55, "10:16:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 81, "10:17:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 67, "10:18:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 34, "10:19:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 76, "10:20:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 55, "10:21:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 53, "10:22:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 75, "10:23:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 66, "10:24:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 80, "10:25:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 83, "10:26:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 81, "10:27:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 79, "10:28:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 75, "10:29:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 61, "10:30:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 85, "10:31:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 81, "10:32:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 80, "10:33:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 77, "10:34:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 73, "10:35:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 81, "10:36:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 71, "10:37:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 68, "10:38:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 50, "10:39:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 20, "10:40:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 30, "10:41:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 45, "10:42:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 66, "10:43:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 33, "10:44:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 28, "10:45:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 55, "10:46:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 81, "10:47:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 67, "10:48:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 34, "10:49:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 76, "10:50:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 55, "10:51:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 53, "10:52:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 75, "10:53:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 66, "10:54:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 80, "10:55:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 83, "10:56:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 81, "10:57:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 79, "10:58:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 75, "10:59:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 24, "11:01:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 24, "11:02:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 24, "11:03:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 77, "11:04:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 73, "11:05:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 24, "11:06:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 71, "11:07:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 68, "11:08:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 50, "11:09:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 20, "11:10:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 30, "11:11:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 45, "11:12:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 66, "11:13:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 33, "11:14:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 28, "11:15:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 55, "11:16:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 24, "11:17:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 67, "11:18:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 34, "11:19:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 76, "11:20:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 55, "11:21:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 53, "11:22:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 75, "11:23:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 66, "11:24:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 24, "11:25:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 24, "11:26:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 24, "11:27:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 79, "11:28:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 75, "11:29:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 61, "11:30:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 24, "11:31:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 24, "11:32:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 24, "11:33:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 77, "11:34:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 73, "11:35:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 24, "11:36:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 71, "11:37:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 68, "11:38:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 50, "11:39:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 20, "11:40:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 30, "11:41:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 45, "11:42:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 66, "11:43:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 33, "11:44:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 28, "11:45:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 55, "11:46:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 24, "11:47:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 67, "11:48:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 34, "11:49:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 76, "11:50:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 55, "11:51:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 53, "11:52:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 75, "11:53:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 66, "11:54:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 24, "11:55:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 24, "11:56:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 24, "11:57:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 79, "11:58:00");
INSERT INTO lista_registros (id_registro, valor, fecha) VALUES (4, 75, "11:59:00");


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;