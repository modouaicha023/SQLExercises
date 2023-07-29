DROP DATABASE IF EXISTS alpha;
create database alpha;
use alpha;
create table Commune(
    idcommune int ,
    nom varchar(32),
    constraint pk_idcommune primary key(idcommune)
);

create table Agence(
    idagence int ,
    nom varchar(32),
    directeur varchar(32),
    id_commune int,
    constraint pk_idagence primary key(idcommune),
    constraint fk_idcommune foreign key(id_commune) references Commune(idcommune)
);

create table Comptable(
    idcomptable int ,
    nom varchar(32),
    date date ,
    no_tel int,
    id_agence int,
    constraint pk_idcomptable primary key(idcomptable),
    constraint fk_idagence foreign key(id_agence) references Agence(idagence)
);

create table Exploitation(
    idexploitation int ,
    nom varchar(32),
    SAU int,
    id_comptable int,
    id_commune int,
    constraint pk_exploitation primary key(idexploitation),
    constraint fk_idcomptable foreign key(id_comptable) references Comptable(idcomptable),
    
    constraint fk_idcommune foreign key(id_commune) references Commune(idcommune)
);