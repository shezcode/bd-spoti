
------------EJERCICIO 6-------------------------
--ejecutamos la query, ERR valores duplicados:
ALTER TABLE CancionesPlaylist ADD CONSTRAINT PK_CancionesPlaylist
PRIMARY KEY (Id_cancion, Id_playlist);


--buscamos valores duplicados si existen
SELECT Id_cancion, Id_playlist, COUNT(*)
FROM CancionesPlaylist
GROUP BY Id_cancion, Id_playlist
HAVING COUNT(*) > 1;


--borramos valores duplicados
DELETE FROM CancionesPlaylist
WHERE (Id_cancion, Id_playlist, Fe_inclusion) IN (
    SELECT Id_cancion, Id_playlist, Fe_inclusion
    FROM (
        SELECT Id_cancion, Id_playlist, Fe_inclusion,
               ROW_NUMBER() OVER (PARTITION BY Id_cancion, Id_playlist ORDER BY Fe_inclusion) AS rnum
        FROM CancionesPlaylist
    ) 
    WHERE rnum > 1
);

-- volvemos a ejecutar la query
ALTER TABLE CancionesPlaylist ADD CONSTRAINT PK_CancionesPlaylist
PRIMARY KEY (Id_cancion, Id_playlist);

---------------------------------------------------------------

--Mostrar el titulo de las canciones que estan dentro de la Playlist3
SELECT Titulo
FROM Cancion C
JOIN CancionesPlaylist CP ON C.Id_Cancion = CP.Id_Cancion
JOIN Playlist P ON CP.Id_Playlist = P.Id_Playlist
WHERE P.Nombre = 'Playlist3';

--Obtener la duracion (en minutos) de la Playlist3.
select sum(duracion / 60000) from cancion 
join cancionesplaylist on cancion.id_cancion = cancionesplaylist.id_cancion
join playlist on cancionesplaylist.Id_playlist = playlist.id_playlist
where playlist.nombre = 'Playlist3';

--query 4a-----
SELECT
    c.Titulo AS Cancion,
    a.Nombre AS Artista
FROM
    CancionesPlaylist cp
INNER JOIN
    Cancion c ON cp.Id_Cancion = c.Id_Cancion
INNER JOIN
    Artista a ON c.Id_Artista = a.Id_Artista
INNER JOIN
    Playlist p ON cp.Id_Playlist = p.Id_Playlist
WHERE
    p.Nombre = 'Playlist3';

-----------------

---query 4b------------
SELECT Nombre
FROM Usuario 
where
usuario.Tipo_suscripcion = 'Free'
AND
Id_usuario not in (select id_usuario from playlist);
-----------------------


--query ejercicio 9-----------------------

SELECT
    (SELECT Titulo FROM Cancion WHERE Id_Cancion = cp.Id_Cancion) AS Cancion,
    (SELECT Nombre FROM Artista WHERE Id_Artista = (SELECT Id_Artista FROM Cancion WHERE Id_Cancion = cp.Id_Cancion)) AS Artista
FROM
    CancionesPlaylist cp
WHERE
    cp.Id_Playlist = (SELECT Id_Playlist FROM Playlist WHERE Nombre = 'Playlist3');
---------------------------------------



