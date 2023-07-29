-- Active: 1658269410488@@127.0.0.1@3306
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
    idcommune int,
    constraint pk_idagence primary key(idcommune),
    constraint fk_idcommune foreign key(idcommune) references Commune(idcommune)
);

create table Comptable(
    idcomptable int ,
    nom varchar(32),
    date date ,
    no_tel int,
    idagence int,
    constraint pk_idcomptable primary key(idcomptable),
    constraint fk_idagence foreign key(idagence) references Agence(idagence)
);


create table Exploitation(
    idexploitation int ,
    nom varchar(32),
    SAU int,
    idcomptable int,
    idcommune int,
    constraint pk_exploitation primary key(idexploitation),
    constraint fk_idcomptable foreign key(idcomptable) references Comptable(idcomptable),
    
    constraint fk_idcommune foreign key(idcommune) references Commune(idcommune)
);