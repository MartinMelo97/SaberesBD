CREATE DATABASE MEDIO_AMBIENTE;
CREATE USER 'martinmelo' IDENTIFIED BY 'administrador';
GRANT ALL PRIVILEGES ON MEDIO_AMBIENTE.* TO 'martinmelo';
use MEDIO_AMBIENTE;
CREATE TABLE Especie_Arbol (Cod_Especie varchar(100) NOT NULL PRIMARY KEY, Nombre varchar(100) NOT NULL, Familia varchar(100) NOT NULL);
CREATE TABLE Lugar (Nombre varchar(100) NOT NULL PRIMARY KEY, Calle/plaza varchar(100) NOT NULL, mapa varchar(255), coordenadas varchar(100) NOT NULL);
CREATE TABLE Operarios(Cod_Empleado varchar(100) NOT NULL PRIMARY KEY, Nombre varchar(100) NOT NULL, Telefono_Contacto INT NOT NULL);
CREATE TABLE Ejemplar (Cod_Ejemplar varchar(50) NOT NULL PRIMARY KEY, Num_Ejemplar INT NOT NULL, Fotografia_Inicial varchar(255), Descripcion_entorno text NOT NULL, Id_Especie VARCHAR(100),FOREIGN KEY (Id_Especie) REFERENCES Especie_Arbol(Cod_Especie) ON DELETE CASCADE, Id_Lugar VARCHAR(100), FOREIGN KEY (Id_Lugar) REFERENCES Lugar(Nombre) ON DELETE CASCADE);
CREATE TABLE Podas (Cod_Pode varchar(100) NOT NULL PRIMARY KEY, Tipo_Poda enum('Poda', 'Tala') NOT NULL, Comentarios text NOT NULL, Fotografia varchar(255), Fecha_inicio DATETIME NOT NULL, Fecha_Fin DATETIME NOT NULL, Id_Ejemplar varchar(50), FOREIGN KEY(Id_Ejemplar) REFERENCES Ejemplar(Cod_Ejemplar) ON DELETE CASCADE, Operario_Uno varchar(100) NULL, Operario_Dos varchar(100) NULL,FOREIGN KEY(Operario_Uno) REFERENCES Operarios(Cod_Empleado) ON DELETE CASCADE, FOREIGN KEY(Operario_Dos) REFERENCES Operarios(Cod_Empleado) ON DELETE CASCADE);
CREATE TABLE Eliminacion_Plagas (Cod_Plaga varchar(100) NOT NULL PRIMARY KEY, Descripcion_danos text NOT NULL, Especies_atacantes varchar(100) NOT NULL, Tratamiento text NOT NULL, Fecha_inicio DATETIME NOT NULL, Fecha_Fin DATETIME NOT NULL, Id_Ejemplar varchar(50), FOREIGN KEY(Id_Ejemplar) REFERENCES Ejemplar(Cod_Ejemplar) ON DELETE CASCADE, Operario_Uno varchar(100) NULL, Operario_Dos varchar(100) NULL,FOREIGN KEY(Operario_Uno) REFERENCES Operarios(Cod_Empleado) ON DELETE CASCADE, FOREIGN KEY(Operario_Dos) REFERENCES Operarios(Cod_Empleado) ON DELETE CASCADE);
CREATE TABLE Limpieza (Cod_Limpieza varchar(100) NOT NULL PRIMARY KEY, Tipo_Limpieza enum('Tronco','Base') NOT NULL, Descripcion text NOT NULL, Tratamiento text NOT NULL, Fecha_inicio DATETIME NOT NULL, Fecha_Fin DATETIME NOT NULL, Id_Ejemplar varchar(50) NOT NULL, FOREIGN KEY(Id_Ejemplar) REFERENCES Ejemplar(Cod_Ejemplar) ON DELETE CASCADE, Operario_Uno varchar(100) NULL, Operario_Dos varchar(100) NULL,FOREIGN KEY(Operario_Uno) REFERENCES Operarios(Cod_Empleado) ON DELETE CASCADE, FOREIGN KEY(Operario_Dos) REFERENCES Operarios(Cod_Empleado) ON DELETE CASCADE);
CREATE TABLE Mediciones (Cod_Medicion varchar(100) NOT NULL PRIMARY KEY, Altura INT NOT NULL, Tamano INT NOT NULL, Edad_Relativa INT NOT NULL, Fecha_inicio DATETIME NOT NULL, Fecha_Fin DATETIME NOT NULL, Id_Ejemplar varchar(50) NOT NULL, FOREIGN KEY(Id_Ejemplar) REFERENCES Ejemplar(Cod_Ejemplar) ON DELETE CASCADE, Operario_Uno varchar(100) NULL, Operario_Dos varchar(100) NULL,FOREIGN KEY(Operario_Uno) REFERENCES Operarios(Cod_Empleado) ON DELETE CASCADE, FOREIGN KEY(Operario_Dos) REFERENCES Operarios(Cod_Empleado) ON DELETE CASCADE);
//Insertando valores
INSERT INTO Especie_Arbol(Cod_Especie, Nombre, Familia) values ('ARB001', 'Arbol1', 'FamiliaGenerica');
INSERT INTO Especie_Arbol(Cod_Especie, Nombre, Familia) values ('ARB002', 'ArbolDos', 'Taxonomica');
INSERT INTO Especie_Arbol(Cod_Especie, Nombre, Familia) values ('ARB003', 'ArbolTres', 'Taxonomica');
INSERT INTO Especie_Arbol(Cod_Especie, Nombre, Familia) values ('ARB004', 'Arbol4', 'Hernandez');
INSERT INTO Especie_Arbol(Cod_Especie, Nombre, Familia) values ('ARB005', 'Arbol5', 'Melo');

INSERT INTO Lugar(Nombre, CallePlaza, mapa, Coordenadas) values ('Obelisco', 'Parque Actopan', 'URL1', '(-150.32,345.21)');
INSERT INTO Lugar(Nombre, CallePlaza, mapa, Coordenadas) values ('Convento', 'Atrio', 'URL2', '(-120.312,-6545.2541)');
INSERT INTO Lugar(Nombre, CallePlaza, mapa, Coordenadas) values ('CITNOVA', 'Parque Cientifico y Tecnologico', 'URL3', '(0,+7643.22');
INSERT INTO Lugar(Nombre, CallePlaza, mapa, Coordenadas) values ('Frailes', 'Actopan', 'URL4', '(0,1)');
INSERT INTO Lugar(Nombre, CallePlaza, mapa, Coordenadas) values ('UPIITA', 'CDMX', 'URL5', '(43.34,-98.89)');

INSERT INTO Ejemplar(Cod_Ejemplar, Num_Ejemplar, Fotografia_inicial, Descripcion_entorno, Id_Especie, Id_Lugar) values ('EJM001', 2, 'URLFoto1','El quinto mas alto del mundo', 'ARB003','Obelisco');
INSERT INTO Ejemplar(Cod_Ejemplar, Num_Ejemplar, Fotografia_inicial, Descripcion_entorno, Id_Especie, Id_Lugar) values ('EJM002', 5, 'URLFoto2','La mejor escuela del IPN', 'ARB005','UPIITA');
INSERT INTO Ejemplar(Cod_Ejemplar, Num_Ejemplar, Fotografia_inicial, Descripcion_entorno, Id_Especie, Id_Lugar) values ('EJM003', 6, 'URLFoto3','Pastespastes', 'ARB001','Frailes');
INSERT INTO Ejemplar(Cod_Ejemplar, Num_Ejemplar, Fotografia_inicial, Descripcion_entorno, Id_Especie, Id_Lugar) values ('EJM004', 19, 'URLFoto4','FixterGeek', 'ARB004','CITNOVA');
INSERT INTO Ejemplar(Cod_Ejemplar, Num_Ejemplar, Fotografia_inicial, Descripcion_entorno, Id_Especie, Id_Lugar) values ('EJM005', 35, 'URLFoto5','De los primeros en Mexico', 'ARB002','Convento');

ALTER TABLE Operarios MODIFY COLUMN Telefono_Contacto varchar(10) NOT NULL;

INSERT INTO Operarios(Cod_Empleado, Nombre, Telefono_Contacto) values ('EMP001', 'Martin Melo Godinez', '7721018271');
INSERT INTO Operarios(Cod_Empleado, Nombre, Telefono_Contacto) values ('EMP002', 'Alejandra Moctezuma  Morales', '7721054443');
INSERT INTO Operarios(Cod_Empleado, Nombre, Telefono_Contacto) values ('EMP003', 'Samantha Sanchez Aguilar', '7721034342');
INSERT INTO Operarios(Cod_Empleado, Nombre, Telefono_Contacto) values ('EMP004', 'Jose Diego Uribe Chavez', '7721240909');
INSERT INTO Operarios(Cod_Empleado, Nombre, Telefono_Contacto) values ('EMP005', 'Juan Carlos Olvera Flores', '7721346473');

INSERT INTO Podas(Cod_Pode, Tipo_poda, Comentarios, Fotografia, Fecha_inicio, Fecha_fin, Id_Ejemplar, Operario_Uno, Operario_Dos) values ('POD001','Tala','No se termino','URL1','2017-08-21 21:30:00','2017-08-22 06:35:12','EJM005','EMP001','EMP002');
INSERT INTO Podas(Cod_Pode, Tipo_poda, Comentarios, Fotografia, Fecha_inicio, Fecha_fin, Id_Ejemplar, Operario_Uno, Operario_Dos) values ('POD002','Poda','Todo en tiempo y forma','URL2','2017-08-25 05:40:10','2017-08-27 16:25:59','EJM003','EMP005',NULL);
INSERT INTO Podas(Cod_Pode, Tipo_poda, Comentarios, Fotografia, Fecha_inicio, Fecha_fin, Id_Ejemplar, Operario_Uno, Operario_Dos) values ('POD003','Poda','Sin comentarios','URL3','2017-07-23 12:50:34','2017-07-23 23:59:59','EJM002','EMP004','EMP001');
INSERT INTO Podas(Cod_Pode, Tipo_poda, Comentarios, Fotografia, Fecha_inicio, Fecha_fin, Id_Ejemplar, Operario_Uno, Operario_Dos) values ('POD004','Tala','5mentarios','URL4','2017-04-29 12:50:34','2017-05-10 13:29:49','EJM001','EMP002',NULL);
INSERT INTO Podas(Cod_Pode, Tipo_poda, Comentarios, Fotografia, Fecha_inicio, Fecha_fin, Id_Ejemplar, Operario_Uno, Operario_Dos) values ('POD005','Poda','No hay nada que decir','URL5','2017-08-29 00:00:00','2017-08-29 00:00:01','EJM001','EMP005','EMP003');

INSERT INTO Eliminacion_Plagas(Cod_Plaga, Descripcion_danos, Especies_atacantes, Tratamiento, Fecha_inicio, Fecha_fin, Id_Ejemplar, Operario_Uno, Operario_Dos) values ('LIM001','De arriba para abajo','Pulgas','Paracetamol','2016-08-29 00:00:00','2017-08-29 00:00:00','EJM004','EMP002','EMP005');
INSERT INTO Eliminacion_Plagas(Cod_Plaga, Descripcion_danos, Especies_atacantes, Tratamiento, Fecha_inicio, Fecha_fin, Id_Ejemplar, Operario_Uno, Operario_Dos) values ('LIM002','De abajo para arriba','Bacterias','Inyecciones','2017-04-11 12:00:00','2017-04-12 00:50:00','EJM002','EMP004','EMP003');
INSERT INTO Eliminacion_Plagas(Cod_Plaga, Descripcion_danos, Especies_atacantes, Tratamiento, Fecha_inicio, Fecha_fin, Id_Ejemplar, Operario_Uno, Operario_Dos) values ('LIM003','Ya no se que poner','Monos','Alguno desconocido','2015-04-11 11:10:10','2015-06-22 12:42:00','EJM001','EMP001',nulL);
INSERT INTO Eliminacion_Plagas(Cod_Plaga, Descripcion_danos, Especies_atacantes, Tratamiento, Fecha_inicio, Fecha_fin, Id_Ejemplar, Operario_Uno, Operario_Dos) values ('LIM004','La base de los datos','Perros','Alguno desconocidox2','2017-02-14 12:54:10','2017-06-22 12:42:00','EJM005','EMP003',nulL);
INSERT INTO Eliminacion_Plagas(Cod_Plaga, Descripcion_danos, Especies_atacantes, Tratamiento, Fecha_inicio, Fecha_fin, Id_Ejemplar, Operario_Uno, Operario_Dos) values ('LIM005','Palabras sin sentido','Humanos','Alguno desconocidox3','2017-02-13 02:04:00','2017-02-13 02:04:10','EJM004','EMP002','EMP003');

ALTER TABLE Limpieza DROP COLUMN Tratamiento;

INSERT INTO Limpieza(Cod_Limpieza, Tipo_Limpieza, Descripcion, Fecha_inicio, Fecha_fin, Id_Ejemplar, Operario_Uno, Operario_Dos) values ('LMP001','Base','Por altura','2016-08-29 00:00:00','2017-08-29 00:00:00','EJM005', 'EMP001','EMP002');
INSERT INTO Limpieza(Cod_Limpieza, Tipo_Limpieza, Descripcion, Fecha_inicio, Fecha_fin, Id_Ejemplar, Operario_Uno, Operario_Dos) values ('LMP002','Base','Por altura sobre dos','2016-08-28 12:12:12','2016-08-30 10:10:50','EJM004', 'EMP002','EMP004');
INSERT INTO Limpieza(Cod_Limpieza, Tipo_Limpieza, Descripcion, Fecha_inicio, Fecha_fin, Id_Ejemplar, Operario_Uno, Operario_Dos) values ('LMP003','Tronco','Cafe','2014-08-28 12:12:12','2014-08-30 10:10:50','EJM001', 'EMP004',NULL);
INSERT INTO Limpieza(Cod_Limpieza, Tipo_Limpieza, Descripcion, Fecha_inicio, Fecha_fin, Id_Ejemplar, Operario_Uno, Operario_Dos) values ('LMP004','Tronco','Cafe marron','2017-05-28 12:12:12','2017-05-30 12:15:55','EJM002', 'EMP003',NULL);
INSERT INTO Limpieza(Cod_Limpieza, Tipo_Limpieza, Descripcion, Fecha_inicio, Fecha_fin, Id_Ejemplar, Operario_Uno, Operario_Dos) values ('LMP005','Tronco','Ya me canse','2017-11-28 14:13:15','2017-11-29 17:15:55','EJM005', 'EMP004','EMP005');

INSERT INTO Mediciones(Cod_Medicion, Altura, Tamano, Edad_Relativa, Fecha_inicio, Fecha_fin, Id_Ejemplar, Operario_Uno, Operario_Dos) values ('MED001','12','50','13', '2017-11-28 19:23:35','2017-11-30 19:24:55','EJM002','EMP001','EMP003');
INSERT INTO Mediciones(Cod_Medicion, Altura, Tamano, Edad_Relativa, Fecha_inicio, Fecha_fin, Id_Ejemplar, Operario_Uno, Operario_Dos) values ('MED002','21','5','31', '2017-11-23 21:23:34','2017-11-25 09:04:05','EJM001','EMP002','EMP005');
INSERT INTO Mediciones(Cod_Medicion, Altura, Tamano, Edad_Relativa, Fecha_inicio, Fecha_fin, Id_Ejemplar, Operario_Uno, Operario_Dos) values ('MED003','65','45','100', '2016-01-01 21:23:34','2016-01-15 09:04:05','EJM003','EMP004','EMP002');
INSERT INTO Mediciones(Cod_Medicion, Altura, Tamano, Edad_Relativa, Fecha_inicio, Fecha_fin, Id_Ejemplar, Operario_Uno, Operario_Dos) values ('MED004','85','15','10', '2016-11-21 21:23:34','2016-11-25 09:04:05','EJM004','EMP001','EMP005');
INSERT INTO Mediciones(Cod_Medicion, Altura, Tamano, Edad_Relativa, Fecha_inicio, Fecha_fin, Id_Ejemplar, Operario_Uno, Operario_Dos) values ('MED005','05','01','12', '2016-10-31 21:23:34','2016-10-31 23:04:05','EJM005','EMP003',NULL);


