DROP DATABASE IF EXISTS db_ElorrietaZinema;

CREATE DATABASE IF NOT EXISTS db_ElorrietaZinema;
USE db_ElorrietaZinema;

CREATE TABLE ZINEMA (
    idZinema INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    NIF VARCHAR(15) UNIQUE NOT NULL,
    izena VARCHAR(15),
    helbidea VARCHAR(30),
    telf INT  
);

CREATE TABLE ARETOA (
    idAretoa Smallint,
    izena VARCHAR(15),
    idzinema INT UNSIGNED AUTO_INCREMENT,
    PRIMARY KEY(idAretoa, idzinema),
    FOREIGN KEY (idzinema) REFERENCES ZINEMA (idZinema) ON DELETE CASCADE
);


CREATE TABLE FILMA(
    idFilma VARCHAR(15) PRIMARY KEY ,
    izena VARCHAR(15),
    iraupena INT, 
    data VARCHAR(15),
    generoa VARCHAR(20)
);

CREATE TABLE SAIOA(
    idSaioa VARCHAR(15) PRIMARY KEY, 
    idFilma VARCHAR(15),
    idzinema INT UNSIGNED,
    idAretoa Smallint,
	FOREIGN KEY (idAretoa, idzinema) REFERENCES ARETOA (idAretoa, idzinema) ON DELETE CASCADE
);

CREATE TABLE BEZEROA (
idBezero INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
NAN VARCHAR(15) UNIQUE NOT NULL,
izena VARCHAR(15),
abizena VARCHAR(15),
erabiltzailea VARCHAR(15),
pasahitza VARCHAR(15),
txartela int,
tlf_zbk int,
sexua varchar(15)

);

CREATE TABLE EROSKETA (
idErosketa INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
kant smallint,
data VARCHAR(15),
deskontua double,
diru_totala double,
mota 
idBezero INT UNSIGNED,
FOREIGN KEY (idAretoa, idzinema) REFERENCES ARETOA (idAretoa, idzinema) ON DELETE CASCADE



);
