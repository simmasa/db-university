create database university;
-- drop database figc;

use university;

create table dipartimenti(
id int not null auto_increment,
nome_corso_laurea varchar(50) not null,
crediti_totali smallint,
primary key(id)
);

create table corsi_di_laurea(
id int not null auto_increment,
nome_corso varchar(50) not null,
crediti smallint,
primary key(id)
);

ALTER TABLE corsi_di_laurea  ADD COLUMN dipartimenti_id INT;

alter table corsi_di_laurea 
add foreign key dipartimenti_id(dipartimenti_id) references dipartimenti(id);

CREATE TABLE university.corsi (
	id INT auto_increment NOT NULL,
	nome_corso varchar(100) NOT NULL,
	ore_totali SMALLINT NOT NULL,
	crediti TINYINT NOT null,
	primary key (id)
);

CREATE TABLE Corsi_di_laurea_Corsi (
corsi_id int not null,
laurea_id int not null
);

alter table Corsi_di_laurea_Corsi
add foreign key (corsi_id) references corsi(id);
alter table Corsi_di_laurea_Corsi
add foreign key (laurea_id) references corsi_di_laurea(id);

CREATE TABLE studente (
	matricola INT auto_increment NOT NULL,
	nome varchar(50) NOT NULL,
	cognome varchar(50) NOT NULL,
	telefono int,
	corsoLaurea_id int,
	foreign key (corsoLaurea_id) references corsi_di_laurea(id),
	primary key (matricola)
);
CREATE TABLE insegnante (
	matricola INT auto_increment NOT NULL,
	nome varchar(50) NOT NULL,
	cognome varchar(50) NOT NULL,
	materia varchar(50) not null,
	primary key (matricola)
);

CREATE TABLE Insegnante_Corsi (
corsi_id int not null,
insegnanti int not null
);

alter table Insegnante_Corsi
add foreign key (corsi_id) references corsi(id);
alter table Insegnante_Corsi
add foreign key (insegnanti) references insegnante(matricola);