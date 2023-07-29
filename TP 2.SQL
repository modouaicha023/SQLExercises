create database championnat;
use championnat;

create table JOUEUR
	(
		Nom varchar (20) primary key,
		Prenom varchar (50),
		Age int(2),
		Nationalite varchar(30) 
	);

create table TOURNOI
	(
		lieu varchar(50),
		annee int(4),

		constraint pk_tournoi primary key (lieu,annee) 
	);

create table SPONSOR
	(
		Nom varchar(20) primary key,
		Adresse varchar(50)
	);

create table GAIN
	(
		NomJoueur varchar(20),
		LieuTournoi varchar(50),
		Annee int(4),
		Rang smallint,
		Prime int,
		
		constraint pk_gain primary key (NomJoueur,LieuTournoi,Annee)
	);

create table RENCONTRE
	(
		NomGagnant varchar(20),
		NomPerdant varchar(20),
		LieuTournoi varchar(50),
		Annee int(4),
		Score varchar(3),

		constraint pk_rencontre primary key (NomGagnant,NomPerdant,LieuTournoi,Annee)
	);

create table SPONSORISE
	(
		nomSponsor varchar(20),
		lieu varchar(50),
		annee int(4),
		MtContribution int(10),

		constraint pk_sponsorise primary key (nomSponsor,lieu,annee) 
	);

alter table GAIN 
add (constraint fk_gain_1 foreign key (NomJoueur) references JOUEUR(Nom),
constraint fk_gain_23 foreign key (LieuTournoi,Annee) references TOURNOI(lieu,annee));

alter table RENCONTRE
add (constraint fk_rencontre_1 foreign key (NomGagnant) references JOUEUR(Nom),
 constraint fk_rencontre_2 foreign key (NomPerdant) references JOUEUR(Nom),
 constraint fk_rencontre_34 foreign key (LieuTournoi,Annee) references TOURNOI(lieu,annee));

alter table SPONSORISE
add (constraint fk_sponsorise_1 foreign key (nomSponsor) references SPONSOR(Nom),
constraint fk_rencontre_23 foreign key (lieu,annee) references TOURNOI(lieu,annee));

alter table JOUEUR
add constraint ck_age check (Age > 16 and Age < 45);
alter table JOUEUR
drop Prenom;
alter table JOUEUR
drop Nationalite;
alter table JOUEUR
add (Prenom varchar(15) NOT NULL,
Nationalite varchar(30) DEFAULT 'senegalaise');

alter table JOUEUR
add (Adresse varchar(50));
alter table RENCONTRE
add (Arbitre varchar(20));

alter table JOUEUR
drop Adresse;

