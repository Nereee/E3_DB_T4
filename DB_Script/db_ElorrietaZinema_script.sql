DROP DATABASE IF EXISTS db_ElorrietaZinema;

CREATE DATABASE IF NOT EXISTS db_ElorrietaZinema;
USE db_ElorrietaZinema;

CREATE TABLE ZINEMA (
idZinema VARCHAR(15) primary key,
NIF VARCHAR(15) UNIQUE NOT NULL,
izena VARCHAR(20),
helbidea VARCHAR(100),
telf INT  
);



CREATE TABLE FILMA(
idFilma INT UNSIGNED AUTO_INCREMENT PRIMARY KEY  ,
izena VARCHAR(50),
iraupena INT, 
argitarapenData VARCHAR(15),
generoa VARCHAR(20)
);

CREATE TABLE ARETOA (
idAretoa VARCHAR(10),
izena VARCHAR(30),
idZinema  VARCHAR(15),
PRIMARY KEY(idAretoa, idzinema),
FOREIGN KEY (idZinema) REFERENCES ZINEMA (idZinema) ON DELETE CASCADE
);

CREATE TABLE SAIOA(
idSaioa INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
idFilma INT UNSIGNED,
idZinema  VARCHAR(15),
idAretoa VARCHAR(10),
Eguna VARCHAR(15),
Ordua VARCHAR(15),
FOREIGN KEY (idFilma) REFERENCES FILMA (idFilma) ON DELETE CASCADE,
FOREIGN KEY (idAretoa, idZinema) REFERENCES ARETOA (idAretoa, idZinema) ON DELETE CASCADE
);

CREATE TABLE BEZEROA (
idBezero varchar(5) PRIMARY KEY,
NAN VARCHAR(15) UNIQUE NOT NULL,
izena VARCHAR(20),
abizena VARCHAR(20),
erabiltzailea VARCHAR(20) UNIQUE NOT NULL,
pasahitza VARCHAR(20),
txartela int,
tlf_zbk int,
sexua varchar(15)

);

CREATE TABLE LANGILEA (
idLangile varchar(5) PRIMARY KEY,
NAN VARCHAR(15) UNIQUE NOT NULL,
izena VARCHAR(20),
abizena VARCHAR(20),
erabiltzailea VARCHAR(20) UNIQUE NOT NULL,
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
    kant SMALLINT,
    eguna VARCHAR(15),
    deskontua DOUBLE,
    diru_totala DOUBLE,
    idMota INT UNSIGNED NOT NULL,
    idBezero VARCHAR(5), 
    idLangile varchar(5),
    FOREIGN KEY (idMota) REFERENCES SARRERAMOTA (idMota) ON DELETE CASCADE,
    -- fk BEZEROA
   FOREIGN KEY (idBezero) REFERENCES BEZEROA (idBezero) ON DELETE CASCADE,
    -- fk LANGILEA
   FOREIGN KEY (idLangile) REFERENCES LANGILEA (idLangile) ON DELETE CASCADE
);



CREATE TABLE SARRERA(

idSarrera INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
idErosketa INT UNSIGNED,
idSaioa INT UNSIGNED,

FOREIGN KEY (idErosketa) REFERENCES EROSKETA (idErosketa) ON DELETE CASCADE,
FOREIGN KEY (idSaioa) REFERENCES SAIOA (idSaioa) ON DELETE CASCADE

);


------------------------------------------------------------------------------------------------------ DATUAK EZARRI -----------------------------------------------------------------------------------------------------------------------------




-- ZINEMA taulan txertatzea
INSERT INTO ZINEMA (idZinema, NIF, izena, helbidea, telf) 
VALUES 
('Z01','123456789A', 'ELORRIETA ZINEMA', 'Calle Ejemplo 123', 944028843),
('Z02','321354154B', 'ERANDIO ZINEMA', 'Ramon Rubial Kalea, 2, 48950 Erandio, Bizkaia', 944673248),
('Z03','564651436X', 'BARAKALDO ZINEMA', 'San José Kalea, 0, Santa Teresa, 48901 Barakaldo, Bizkaia', 944372881),
('Z04','476864654A', 'SANTUXU ZINEMA', 'De la Cosa Juan Kalea, 25, 48004 Bilbo, Bizkaia', 944124811),
('Z05','884216412A', 'BASAURI KALEA', 'Altube Kalea, 48970 Basauri, Bizkaia', 671921072);

     


-- FILMA taulan txertatzea
INSERT INTO FILMA (izena, generoa, iraupena, argitarapenData) 
VALUES 
('Expediente Warren: The Conjuring', 'Beldurra', 112, '2022-01-15'),
('Get Out', 'Beldurra', 104, '2017-02-24'),
('Hereditary', 'Beldurra', 127, '2018-06-04'),
('El Exorcista', 'Beldurra', 122, '1973-12-26'),
('Anabelle', 'Beldurra', 99, '2014-09-29'),
('Día de la Independencia', 'Zientzia Fikzioa', 145, '1996-07-02'),
('Guardianes de la Galaxia', 'Zientzia Fikzioa', 121, '2014-07-21'),
('Matrix', 'Zientzia Fikzioa', 136, '1999-03-24'),
('Avatar', 'Zientzia Fikzioa', 162, '2009-12-18'),
('E.T. el Extraterrestre', 'Zientzia Fikzioa', 115, '1982-06-11'),
('El Irlandés', 'Drama', 209, '2019-11-27'),
('Parásitos', 'Drama', 132, '2019-05-21'),
('Forrest Gump', 'Drama', 142, '1994-07-06'),
('Titanic', 'Drama', 195, '1997-12-19'),
('Cazafantasmas', 'Komedia', 116, '2016-07-15'),
('Dos tontos muy tontos', 'Komedia', 107, '1994-12-06'),
('Borat', 'Komedia', 84, '2006-11-03'),
('Resacon en las Vegas', 'Komedia', 100, '2009-06-05'),
('Shrek', 'Komedia', 90, '2001-04-22'),
('Cars', 'Animazioa', 117, '2006-07-06'),
('Handia', 'Drama', 116, '2017-10-20'),
('La lista de Schindler', 'Drama', 197, '1993-12-15'),
('Cadena Perpetua', 'Drama', 142, '1994-10-14'),
('Million Dollar Baby', 'Drama', 133, '2005-12-15'),
('2001: Odisea en el espacio', 'Sci-Fi', 142, '1968-04-03'),
('La novia de Frankenstein', 'Sci-Fi', 75, '1935-04-22'),
('El planeta de los simios', 'Sci-Fi', 115, '1968-02-08'),
('Alien, el octavo pasajero', 'Sci-Fi', 117, '1979-05-25'),
('Scary movie', 'Komedia', 90, '2000-07-07'),
('El gran Lebowsky', 'Komedia', 119, '1998-03-06'),
('La vida de Brian', 'Komedia', 94, '1979-08-17'),
('Aterriza como puedas', 'Komedia', 88, '1980-07-02'),
('Psicosis', 'Terror', 109, '1960-09-08'),
('El resplandor', 'Terror', 146, '1980-06-13'),
('Drácula', 'Terror', 155, '1931-02-14'),
('Cisne negro', 'Terror', 110, '2010-12-03');

-- Aretoen txertaketak ELORRIETA ZINEMA (idZinema = 1)
INSERT INTO ARETOA (idAretoa, izena, idzinema)
VALUES 
("A01", 'Rambo', "Z01"),
("A02", 'E.T.', "Z01"),
("A03", 'Indiana Jones', "Z01"),
("A04", 'Chewbacca', "Z01"),
("A05", 'Marty McFly', "Z01");

-- Aretoen txertaketak ERANDIO ZINEMA (idZinema = 2)
INSERT INTO ARETOA (idAretoa, izena, idzinema)
VALUES 
("A01", 'Terminator',"Z02"),
("A02", 'Sherlock Holmes', "Z02"),
("A03", 'Jack Sparrow', "Z02"),
("A04", 'Voldemort', "Z02"),
("A05", 'Darth Vader', "Z02");

-- Aretoen txertaketa BARAKALDO ZINEMA (idZinema = 3)
INSERT INTO ARETOA (idAretoa, izena, idzinema)
VALUES 
("A01", 'Hannibal Lecter', "Z03"),
("A02", 'Rocky Balboa', "Z03"),
("A03", 'Rayo McQueen', "Z03"),
("A04", 'The Joker', "Z03"),
("A05", 'Hulk', "Z03");

-- Aretoen txertaketa SANTUXU ZINEMA (idZinema = 4)
INSERT INTO ARETOA (idAretoa, izena, idzinema)
VALUES 
("A01", 'James Bond', "Z04"),
("A02", 'Luke Skywalker', "Z04"),
("A03", 'Harry Potter', "Z04"),
("A04", 'Frodo Bolsón', "Z04"),
("A05", 'James T. Kirk', "Z04");

-- Aretoen txertaketa BASAURI ZINEMA (idZinema = 5)
INSERT INTO ARETOA (idAretoa, izena, idzinema)
VALUES 
("A01", 'Alan Grant', "Z05"),
("A02", 'Katniss Everdeen', "Z05"),
("A03", 'Neo', "Z05"),
("A04", 'Torrente', "Z05"),
("A05", 'Walter White', "Z05");


-- BEZEROA taulan txertatzea
INSERT INTO BEZEROA (idBezero, NAN, izena, abizena, erabiltzailea, pasahitza, txartela, tlf_zbk, sexua) 
VALUES 
('B01','12345678A', 'Juan', 'Pérez', 'juanperez', 'pasahitza', 12345678, 666123456, 'Gizonezkoa'),
('B02','98765432B', 'María', 'González', 'mariagonzalez', 'pasahitza123', 98765432, 666234567, 'Emakumezkoa'),
('B03','13579135C', 'Luis', 'Martínez', 'luismartinez', '123456', 13579135, 666345678, 'Gizonezkoa'),
('B04','24681357D', 'Ana', 'López', 'analorena', 'abcd1234', 24681357, 666456789, 'Emakumezkoa'),
('B05','15975328E', 'Pedro', 'Sánchez', 'pedrosanchez', 'pasahitza', 15975328, 666567890, 'Gizonezkoa'),
('B06','36925814F', 'Laura', 'Díaz', 'lauradiaz', 'abcd', 36925814, 666678901, 'Emakumezkoa');

-- Langile taulan txertatzea
INSERT INTO Langilea (idLangile, NAN, izena, abizena, erabiltzailea, pasahitza, txartela, tlf_zbk, sexua) 
VALUES 
('L01','75395128G', 'Iker', 'Sanchez', 'ikersanchez', 'pasahitza123', 75395128, 666789012, 'Gizonezkoa'),
('L02','85214796H', 'Paula', 'Pinta', 'paulapinta', 'abcd1234', 85214796, 666890123, 'Emakumezkoa'),
('L03','45612378I', 'Hegoi', 'Vazquez', 'hegoivazquez', '123456', 45612378, 666901234, 'Gizonezkoa'),
('L04','98741236J', 'Mikel', 'Martin', 'mikelmartin', 'password', 98741236, 666012345, 'Gizonezkoa');


-- SARRERAMOTA taulan txertatzea
INSERT INTO SARRERAMOTA (kostua, idMota) 
VALUES (8.90, 1),(6.90, 2),(6.90, 3);

-- ----------------------------------------------------------------- WARNING ------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------- WARNING ------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------- WARNING ------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------- WARNING ------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------- WARNING ------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------- WARNING ------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------- WARNING ------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------- WARNING ------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------- WARNING ------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------- WARNING ------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------- WARNING ------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------- WARNING ------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------- WARNING ------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------- WARNING ------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------- WARNING ------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------- WARNING ------------------------------------------------------------------------------------------------------------------


--  ------ --------------------------------- ------ SAIOAK INPORTATU BEHAR DIRA!!! EXCEL ERANTSI!  -----------------------------------------------------------------  ------------------------

-- ----------------------------------------------------------------- WARNING ------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------- WARNING ------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------- WARNING ------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------- WARNING ------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------- WARNING ------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------- WARNING ------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------- WARNING ------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------- WARNING ------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------- WARNING ------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------- WARNING ------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------- WARNING ------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------- WARNING ------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------- WARNING ------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------- WARNING ------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------- WARNING ------------------------------------------------------------------------------------------------------------------










-- Erosketak WebGunean edo Aplikazioan egin daitezkeen adierazten diren. 
-- WebGunean egin diren erosketetan langilea NULL izango da, 
-- baina Aplikazioan egin diren erosketetan langileak beti bete behar du.



INSERT INTO EROSKETA (kant, eguna, deskontua, diru_totala, idMota, idBezero, idLangile)
VALUES
(3, '2024-02-09', 0, 0, 2, 'B02', NULL),  -- WebGunean erosketa , langile null
(5, '2024-02-10', 0, 0, 1, 'B01', NULL),  -- WebGunean erosketa , langile null
(5, '2024-02-10', 0, 0, 1, 'B03', NULL), -- WebGunean erosketa , langile null
(5, '2023-04-01', 0, 0, 1, 'B04', NULL),  -- WebGunean erosketa , langile null
(5, '2023-04-01', 0, 0, 1, NULL, 'L01'), -- Aplikazioan erosketa , langile bai
(5, '2023-04-01', 0, 0, 1, NULL, 'L01');  -- Aplikazioan erosketa , langile bai

-- SARRERA taulan txertatzea
INSERT INTO SARRERA (idErosketa, idSaioa)
VALUES
(1, 100),
(2, 169),
(3, 169),
(4, 1),
(5, 2),
(6, 3);

-- ----------------------------------------------------------------- KONTSULTAK ------------------------------------------------------------------------------------------------------------------
#1 Iaz diru gehien aportatu duten filmen zerrenda osoa dementsio
#desberdinak erabiliz aztertzeko.

                              
SELECT f.*
FROM FILMA f
JOIN SAIOA sa ON f.idFilma = sa.idFilma 
JOIN SARRERA s ON sa.idSaioa = s.idSaioa
join erosketa e using (iderosketa)
GROUP BY f.izena
ORDER BY 1 DESC
LIMIT 5;


    
#2Film gehien ikusi dituzten erabiltzaileak
  
  Select b.izena , count(s.idSarrera)
From bezeroa b
left join erosketa e using (idbezero)
left join sarrera s using (iderosketa)
group by b.izena
order by 2 desc
limit 10;
 
-- 2.b Erosketa gehien daukaten filmak
  
SELECT f.izena AS Pelickula, COUNT(s.idSarrera) AS Erosketak -- S.idErosketa
FROM FILMA f
JOIN SAIOA sa ON f.idFilma = sa.idFilma 
JOIN SARRERA s ON sa.idSaioa = s.idSaioa
GROUP BY f.izena
ORDER BY Erosketak DESC
LIMIT 5;



#3 Film genero bakoitzeko, estadistikak

SELECT f.generoa AS 'Genero', sum(e.kant) AS 'Erosketa Kantitatea'
FROM FILMA f
JOIN SAIOA sa using (idfilma)
JOIN SARRERA s using (idsaioa)
JOIN erosketa e using (iderosketa)
group by f.generoa
ORDER BY sum(e.kant) DESC;


-- 3.b

SELECT f.generoa AS 'Genero', sum(e.kant) AS 'Erosketa Kantitatea'
FROM FILMA f
JOIN SAIOA sa using (idfilma)
JOIN SARRERA s using (idsaioa)
JOIN erosketa e using (iderosketa)
group by f.generoa
ORDER BY sum(e.kant) DESC
limit 1;


-- 3.c filmak , generoetan bananduta bere iraupenarekin

SELECT f.generoa , f.izena , f.iraupena-- S.idErosketa
FROM FILMA f
GROUP BY f.izena, f.generoa;



#4 Zein sarrera mota erosten den gehien

SELECT idMota
FROM EROSKETA
WHERE kant = (
    SELECT MAX(kant)
    FROM (
        SELECT idMota, SUM(kant) AS total_kant
        FROM EROSKETA
    ) AS idMota
) group by idmota
limit 1;

-- #5 Nork egiten dituen erosketa gehien emakumeak edo gizonak.
SELECT b.sexua, COUNT(s.idSarrera) AS kantitatea
FROM SARRERA s
LEFT JOIN EROSKETA e ON s.idErosketa = e.idErosketa
LEFT JOIN BEZEROA b ON e.idBezero = b.idBezero
GROUP BY b.sexua
ORDER BY kantitatea DESC
LIMIT 1;


#6 Zein ordutan ikusten dira filma gehiago.

SELECT s.Ordua, COUNT(sa.idSarrera) AS Filma_Gehiago
FROM SAIOA s 
LEFT JOIN SARRERA sa USING (idSaioa)
GROUP BY s.Ordua
ORDER BY Filma_Gehiago DESC;



#7 Bezero gutxien dituen zinema, bezero-kopurua adierazita


SELECT z.izena AS Zinema_Izena, COUNT(e.idBezero) AS Bezero_Kopurua
FROM ZINEMA z
LEFT JOIN ARETOA a ON z.idZinema = a.idZinema
LEFT JOIN SAIOA s ON a.idAretoa = s.idAretoa AND a.idZinema = s.idZinema
LEFT JOIN SARRERA sr ON s.idSaioa = sr.idSaioa
LEFT JOIN EROSKETA e ON sr.idErosketa = e.idErosketa
GROUP BY z.idZinema
ORDER BY Bezero_Kopurua ASC;


#8 Zineman areto gehien dituzten zineek proiektatutako filmen batez besteko iraupena

SELECT z.izena AS Zinema_Izena, ROUND(AVG(f.iraupena), 2) AS Batez_Besteko_Iraupena
FROM ZINEMA z
LEFT JOIN ARETOA a ON z.idZinema = a.idZinema
LEFT JOIN SAIOA s ON a.idAretoa = s.idAretoa AND a.idZinema = s.idZinema
LEFT JOIN FILMA f ON s.idFilma = f.idFilma
GROUP BY z.idZinema
ORDER BY Batez_Besteko_Iraupena ASC;

#extra Jakin zein pelikulak ikusten dira zein zinemetan 

SELECT f.izena, z.izena
FROM SAIOA s 
LEFT JOIN ZINEMA z USING (idZinema)
LEFT JOIN FILMA f USING (idFilma)
GROUP BY f.izena, z.izena;

SELECT f.izena, z.izena
FROM SAIOA s 
LEFT JOIN ZINEMA z USING (idZinema)
LEFT JOIN FILMA f USING (idFilma)
WHERE s.Eguna = '2024-02-12'
GROUP BY f.izena, z.izena;


SELECT f.izena, z.izena, s.ordua, s.eguna, s.idaretoa
FROM SAIOA s 
LEFT JOIN ZINEMA z USING (idZinema)
LEFT JOIN FILMA f USING (idFilma)
WHERE s.Eguna = '2024-02-12' and z.idzinema = ("z01")
GROUP BY f.izena, z.izena;



SELECT f.izena, z.izena, s.ordua, s.eguna, s.idaretoa
FROM SAIOA s 
LEFT JOIN ZINEMA z USING (idZinema)
LEFT JOIN FILMA f USING (idFilma)
WHERE s.Eguna = '2024-02-12' and s.ordua = ("19:00") and z.idzinema = ("z01")
GROUP BY f.izena, z.izena;


SELECT f.izena, z.izena, s.ordua, s.eguna, s.idaretoa
FROM filma f 
LEFT JOIN saioa s USING (idfilma)
LEFT JOIN zinema z USING (idzinema)
WHERE f.izena = ("anabelle");
