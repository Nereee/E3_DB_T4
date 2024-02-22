use db_elorrietazinemat4;




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

SELECT f.generoa AS 'Genero', sum(s.sarrerakant) AS 'Erosketa Kantitatea'
FROM FILMA f
JOIN SAIOA sa using (idfilma)
JOIN SARRERA s using (idsaioa)
JOIN erosketa e using (iderosketa)
group by f.generoa
ORDER BY sum(s.sarrerakant) DESC;


-- 3.b

SELECT f.generoa AS 'Genero',  sum(s.sarrerakant) AS 'Erosketa Kantitatea'
FROM FILMA f
JOIN SAIOA sa using (idfilma)
JOIN SARRERA s using (idsaioa)
JOIN erosketa e using (iderosketa)
group by f.generoa
ORDER BY  sum(s.sarrerakant) DESC
limit 1;


-- 3.c filmak , generoetan bananduta bere iraupenarekin

SELECT f.generoa , f.izena , f.iraupena-- S.idErosketa
FROM FILMA f
GROUP BY f.izena, f.generoa;



#4 Zein sarrera mota erosten den gehien

SELECT idMota
FROM EROSKETA
WHERE idErosketa = (
    SELECT MAX(idErosketa)
    FROM (
        SELECT idMota, SUM(idErosketa) AS total_kant
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