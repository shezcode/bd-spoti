CREATE TABLE Usuario (
    Id_Usuario RAW(16) DEFAULT SYS_GUID() PRIMARY KEY,
    Nombre VARCHAR2(30) NOT NULL,
    Email VARCHAR2(50) NOT NULL,
    Contraseña VARCHAR2(30) NOT NULL, 
    Fe_alta DATE DEFAULT SYSDATE,
    Tipo_suscripcion VARCHAR2(10) CHECK (Tipo_suscripcion IN ('Free', 'Premium'))
);

CREATE TABLE Artista (
    Id_Artista VARCHAR2(255) PRIMARY KEY,
    Nombre VARCHAR2(30) NOT NULL,
    Nacionalidad VARCHAR2(30),
    Genero VARCHAR2(50)
);

CREATE TABLE Album (
    Id_Album VARCHAR2(255) PRIMARY KEY,
    Titulo VARCHAR2(30) NOT NULL,
    Fe_publicacion DATE DEFAULT SYSDATE,
    Id_Artista VARCHAR2(255) NOT NULL
);

CREATE TABLE Cancion (
    Id_Cancion VARCHAR2(255) PRIMARY KEY,
    Titulo VARCHAR2(255) NOT NULL,
    Duracion NUMBER(8) NOT NULL,
    Fe_publicacion DATE DEFAULT SYSDATE,
    Id_Artista VARCHAR2(255) NOT NULL,
    Id_Album VARCHAR2(255) NOT NULL
);

CREATE TABLE Playlist (
    Id_Playlist RAW(16) DEFAULT SYS_GUID() PRIMARY KEY,
    Nombre VARCHAR2(30) NOT NULL,
    Descripcion VARCHAR2(50),
    Fe_creacion DATE DEFAULT SYSDATE,
    Id_Usuario RAW(16) NOT NULL
);

CREATE TABLE CancionesPlaylist (
    Id_Cancion VARCHAR2(255),
    Id_Playlist RAW(16),
    Fe_inclusion DATE DEFAULT SYSDATE
);

ALTER TABLE Cancion ADD CONSTRAINT FK_Id_Artista
FOREIGN KEY (Id_Artista)
REFERENCES Artista(Id_Artista);

ALTER TABLE Cancion ADD CONSTRAINT FK_Id_Album
FOREIGN KEY (Id_Album)
REFERENCES Album(Id_Album);

ALTER TABLE Album ADD CONSTRAINT FK_Id_Artista_Album
FOREIGN KEY (Id_Artista)
REFERENCES Artista(Id_Artista);

ALTER TABLE Playlist ADD CONSTRAINT FK_Id_Usuario
FOREIGN KEY (Id_Usuario)
REFERENCES Usuario(Id_Usuario);

ALTER TABLE CancionesPlaylist ADD CONSTRAINT FK_Id_Cancion
FOREIGN KEY (Id_Cancion)
REFERENCES Cancion(Id_Cancion);

ALTER TABLE CancionesPlaylist ADD CONSTRAINT FK_Id_Playlist
FOREIGN KEY (Id_Playlist)
REFERENCES Playlist(Id_Playlist);

ALTER TABLE CancionesPlaylist ADD CONSTRAINT PK_CancionesPlaylist
PRIMARY KEY (Id_cancion, Id_playlist);

--comprobamos que las tablas se han creado correctamente;
select table_name from user_tables;








