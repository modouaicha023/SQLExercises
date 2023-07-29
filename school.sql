CREATE DATABASE school;
USE school;
CREATE TABLE Classe(
    code int PRIMARY KEY NOT NULL, 
    libelle VARCHAR(20) NOT NULL 
);

CREATE TABLE Chaise(
    referencee VARCHAR(10) PRIMARY KEY NOT NULL,
    rangee tinyint
);

CREATE TABLE Matiere(
    id int PRIMARY KEY NOT NULL,
    libelle VARCHAR(20) NOT NULL
);

CREATE TABLE seFaire(
    code int ,
    id int ,
    PRIMARY(code,id),
    CONTRAINT fk_sefaire_classe FOREIGN KEY (code) REFERENCES Classe(code),
    CONTRAINT fk_sefaire_matiere FOREIGN KEY (id) REFERENCES Matiere(id)
);

CREATE TABLE Etudiant(
    numero char(9) PRIMARY KEY,
    nom VARCHAR(20) NOT NULL,
    prenom VARCHAR(32) NOT NULL,
    code int,
    referencee VARCHAR(20),
    FOREIGN KEY(code) REFERENCES Classe(code),
    FOREIGN KEY(referencee) REFERENCES Chaise(referencee)
);




CREATE TABLE Etudiant(numero int PRIMARY KEY,nom varchar(20) NOT NULL,prenom varchar(32) NOT NULL);

CREATE TABLE Classe( id int PRIMARY KEY , nom VARCHAR(20) NOT NULL, effectif int NOT NULL , dpt int,CONSTRAINT fk_claase_dpt FOREIGN KEY(dpt) REFERENCES Departement(numero));


CREATE TABLE Departement(numero int PRIMARY KEY,nom varchar(20) NOT NULL);

CREATE TABLE Contact( numero_etudiant int ,telephone int , types VARCHAR(20) NOT NULL,PRIMARY KEY(numero_etudiant,telephone), FOREIGN KEY(numero_etudiant) REFERENCES Etudiant(numero));