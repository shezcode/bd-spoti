-- seed usuarios
DECLARE
    v_id_usuario RAW(16);
    v_nombre VARCHAR2(30);
    v_email VARCHAR2(50);
    v_contrasena VARCHAR2(30);
    v_fe_alta DATE;
    v_tipo_suscripcion VARCHAR2(10);
BEGIN
    FOR i IN 1..100 LOOP
        -- Generate fake data
        v_id_usuario := SYS_GUID();
        v_nombre := 'User' || TO_CHAR(i);
        v_email := 'user' || TO_CHAR(i) || '@example.com';
        v_contrasena := 'password' || TO_CHAR(i);
        v_fe_alta := SYSDATE - TRUNC(DBMS_RANDOM.VALUE(1, 365)); -- Random registration date in the last year
        v_tipo_suscripcion := CASE WHEN DBMS_RANDOM.VALUE > 0.5 THEN 'Free' ELSE 'Premium' END;

        -- Insert data into the Usuario table
        INSERT INTO Usuario (Id_Usuario, Nombre, Email, Contraseña, Fe_alta, Tipo_suscripcion)
        VALUES (v_id_usuario, v_nombre, v_email, v_contrasena, v_fe_alta, v_tipo_suscripcion);
    END LOOP;
END;

--seed artistas 
INSERT ALL
INTO Artista (Id_Artista, Nombre, Nacionalidad, Genero)
VALUES ('0hEurMDQu99nJRq8pTxO14', 'John Mayer', 'USA', 'Singer-songwriter')
INTO Artista (Id_Artista, Nombre, Nacionalidad, Genero)
VALUES ('2FXC3k01G6Gw61bmprjgqS', 'Hozier', 'Ireland', 'Folk, Singer-songwriter')
INTO Artista (Id_Artista, Nombre, Nacionalidad, Genero)
VALUES ('3jK9MiCrA42lLAdMGUZpwa', 'Anderson .Paak', 'USA', 'Hip-hop, Neo-soul')
INTO Artista (Id_Artista, Nombre, Nacionalidad, Genero)
VALUES ('536osqBGKzeozje8BfcGsa', 'Allen Stone', 'USA', 'Soul')
INTO Artista (Id_Artista, Nombre, Nacionalidad, Genero)
VALUES ('2h93pZq0e7k5yf4dywlkpM', 'Frank Ocean', 'USA', 'RnB, Hip-hop')
INTO Artista (Id_Artista, Nombre, Nacionalidad, Genero)
VALUES ('4bUqnkrDrb4f7rqmDR9yDu', 'Foy Vance', 'Northern Ireland', 'Folk, blues')
INTO Artista (Id_Artista, Nombre, Nacionalidad, Genero)
VALUES ('4LEiUm1SRbFMgfqnQTwUbQ', 'Bon Iver', 'USA', 'Indie folk')
INTO Artista (Id_Artista, Nombre, Nacionalidad, Genero)
VALUES ('1r1uxoy19fzMxunt3ONAkG', 'Phoebe Bridgers', 'USA', 'Indie pop')
INTO Artista (Id_Artista, Nombre, Nacionalidad, Genero)
VALUES ('5schNIzWdI9gJ1QRK8SBnc', 'Ben Howard', 'UK', 'Singer-songwriter')
INTO Artista (Id_Artista, Nombre, Nacionalidad, Genero)
VALUES ('3VHAySZQPlfGlNLslzXYpN', 'Nathy Peluso', 'Argentina', 'RnB, Latin')

SELECT 1 FROM DUAL;












