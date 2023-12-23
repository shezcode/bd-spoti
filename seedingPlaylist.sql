-- seed playlists
DECLARE
    v_id_playlist RAW(16);
    v_nombre VARCHAR2(30);
    v_descripcion VARCHAR2(50);
    v_fe_creacion DATE;
    v_id_usuario RAW(16);

    -- Cursor to fetch user IDs
    CURSOR c_user_ids IS SELECT Id_Usuario FROM Usuario;
    v_user_ids c_user_ids%ROWTYPE;
BEGIN
    OPEN c_user_ids;
    FETCH c_user_ids INTO v_user_ids;
    
    FOR i IN 1..50 LOOP
        -- Generate fake data
        v_id_playlist := SYS_GUID();
        v_nombre := 'Playlist' || TO_CHAR(i);
        v_descripcion := 'Description for Playlist' || TO_CHAR(i);
        v_fe_creacion := SYSDATE - TRUNC(DBMS_RANDOM.VALUE(1, 365)); -- Random creation date in the last year

        -- Fetch a random user ID
        FETCH c_user_ids INTO v_id_usuario;

        -- Insert data into the Playlist table
        INSERT INTO Playlist (Id_Playlist, Nombre, Descripcion, Fe_creacion, Id_Usuario)
        VALUES (v_id_playlist, v_nombre, v_descripcion, v_fe_creacion, v_id_usuario);
    END LOOP;

    CLOSE c_user_ids;
END;
/


-- seed CancionesPlaylist
DECLARE
    v_id_cancion VARCHAR2(255);
    v_id_playlist RAW(16);
    v_fe_inclusion DATE;

BEGIN
    FOR i IN 1..300 LOOP
        -- Fetch a random song and playlist ID
        SELECT c.Id_Cancion, p.Id_Playlist
        INTO v_id_cancion, v_id_playlist
        FROM (
            SELECT Id_Cancion, ROW_NUMBER() OVER (ORDER BY DBMS_RANDOM.VALUE) AS rn
            FROM Cancion
        ) c
        JOIN (
            SELECT Id_Playlist, ROW_NUMBER() OVER (ORDER BY DBMS_RANDOM.VALUE) AS rn
            FROM Playlist
        ) p ON c.rn = p.rn
        WHERE ROWNUM = 1;

        -- Generate fake inclusion date
        v_fe_inclusion := SYSDATE - TRUNC(DBMS_RANDOM.VALUE(1, 365)); -- Random inclusion date in the last year

        -- Insert data into the CancionesPlaylist table
        INSERT INTO CancionesPlaylist (Id_Cancion, Id_Playlist, Fe_inclusion)
        VALUES (v_id_cancion, v_id_playlist, v_fe_inclusion);
    END LOOP;
END;
/







