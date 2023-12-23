--consulta datos de la sesion
show con_name;
show pdbs;

--cambio a la pluggable db
alter session set container = xepdb1;

--antes de crear el usuario, creo el tablespace que va a utilizar.
create tablespace AToma_tabspace
datafile 'AToma_tabspace.dat'
size 10M autoextend on;

--creacion del usuario
create user AToma identified by oradbpass
default tablespace AToma_tabspace;

--asignacion de permisos al usuario
grant create session to AToma;

grant create table to AToma;

grant unlimited tablespace to AToma;


--comprobamos los permisos del usuario
select * from session_privs;
