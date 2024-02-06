DROP DATABASE IF EXISTS db_ElorrietaZinema;

CREATE DATABASE IF NOT EXISTS db_ElorrietaZinema;
USE db_ElorrietaZinema;

CREATE TABLE ZINEMA (
    idZinema INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    NIF VARCHAR(15) UNIQUE NOT NULL,
    izena VARCHAR(20),
    helbidea VARCHAR(100),
    telf INT  
);



CREATE TABLE FILMA(
    idFilma VARCHAR(15) PRIMARY KEY ,
    izena VARCHAR(20),
    iraupena INT, 
    data VARCHAR(15),
    generoa VARCHAR(20)
);

CREATE TABLE ARETOA (
    idFilma VARCHAR(15) ,
    idAretoa Smallint,
    izena VARCHAR(15),
    idzinema INT UNSIGNED AUTO_INCREMENT,
    PRIMARY KEY(idAretoa, idzinema),
    FOREIGN KEY (idzinema) REFERENCES ZINEMA (idZinema) ON DELETE CASCADE,
	FOREIGN KEY (idFilma) REFERENCES FILMA (idFilma) ON DELETE CASCADE

);

CREATE TABLE SAIOA(
    idSaioa VARCHAR(15) PRIMARY KEY, 
    idFilma VARCHAR(15),
    idzinema INT UNSIGNED,
    idAretoa Smallint,
	FOREIGN KEY (idFilma) REFERENCES FILMA (idFilma) ON DELETE CASCADE,
    FOREIGN KEY (idAretoa, idzinema) REFERENCES ARETOA (idAretoa, idzinema) ON DELETE CASCADE
);

CREATE TABLE BEZEROA (
idBezero INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
NAN VARCHAR(15) UNIQUE NOT NULL,
izena VARCHAR(20),
abizena VARCHAR(20),
erabiltzailea VARCHAR(20),
pasahitza VARCHAR(20),
txartela int,
tlf_zbk int,
sexua varchar(15)

);

CREATE TABLE SARRERAMOTA(
kostua double,
idMota int unsigned primary key 
);

CREATE TABLE EROSKETA (
idErosketa INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
kant smallint,
data VARCHAR(15),
deskontua double,
diru_totala double,
idmota int unsigned not null ,
idBezero INT UNSIGNED,
FOREIGN KEY (idBezero) REFERENCES BEZEROA (idBezero) ON DELETE CASCADE,
FOREIGN KEY (idMota) REFERENCES SARRERAMOTA (idMota) ON DELETE CASCADE
);

CREATE TABLE SARRERA(

idSarrera INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
idErosketa INT UNSIGNED,
idSaioa VARCHAR(15),

FOREIGN KEY (idErosketa) REFERENCES EROSKETA (idErosketa) ON DELETE CASCADE,
FOREIGN KEY (idSaioa) REFERENCES SAIOA (idSaioa) ON DELETE CASCADE

);



------------------------------------------------------------------------------------------------------ DATUAK EZARRI -----------------------------------------------------------------------------------------------------------------------------




-- Inserción en la tabla ZINEMA
INSERT INTO ZINEMA (NIF, izena, helbidea, telf) 
VALUES 
('123456789A', 'ELORRIETA ZINEMA', 'Calle Ejemplo 123', 944028843),
('321354154B', 'ERANDIO ZINEMA', 'Ramon Rubial Kalea, 2, 48950 Erandio, Bizkaia', 944673248),
('564651436X', 'BARAKALDO ZINEMA', 'San José Kalea, 0, Santa Teresa, 48901 Barakaldo, Bizkaia', 944372881),
('476864654A', 'SANTUXU ZINEMA', 'De la Cosa Juan Kalea, 25, 48004 Bilbo, Bizkaia', 944124811),
('884216412A', 'BASAURI KALEA', 'Altube Kalea, 48970 Basauri, Bizkaia', 671921072);

-- Inserción en la tabla FILMA
INSERT INTO FILMA (idFilma, izena, iraupena, data, generoa) 
VALUES ('FILM001', 'Pelicula de Ejemplo', 120, '2024-02-06', 'Acción');

-- Inserción en la tabla ARETOA
INSERT INTO ARETOA (idFilma, idAretoa, izena, idzinema) 
VALUES ('FILM001', 1, 'Sala 1', 1);

-- Inserción en la tabla BEZEROA
INSERT INTO BEZEROA (NAN, izena, abizena, erabiltzailea, pasahitza, txartela, tlf_zbk, sexua) 
VALUES ('1234567A', 'Juan', 'Pérez', 'juanperez', 'contraseña', 123456789, 987654321, 'Masculino');

-- Inserción en la tabla SARRERAMOTA
INSERT INTO SARRERAMOTA (kostua, idMota) 
VALUES (8.90, 1),(6.90, 2),(6.90, 3);


