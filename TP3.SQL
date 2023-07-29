use championnat;
alter table RENCONTRE
drop Arbitre;

insert into JOUEUR (Nom,Prenom,Age,Nationalite)
	values  ('MENDY','Albert',25,'Gambienne'),
			('NOAH','Yannick',39,'Francaise');

insert into TOURNOI
	values  ('Dakar',2003),
			('Dakar',2002),
			('Kaolack',2001),
			('Thies',2002),
			('St-Louis',2003);

insert into JOUEUR(Nom,Prenom,Age,Nationalite)
	values  ('NDIAYE','Benoit',23,default),
			('FALL','Amath',33,'Ivoirienne'),
			('GUEYE','Cheikh Abdou',19,default),
			('DIOP','Ousmane',22,'Gabonnaise'),
			('BOROSI','Frederic',32,'Francaise'),
			('SY','Ali',26,'Malienne'),
			('DIONE','Modou',28,default);

insert into SPONSOR 
	values  ('Sonatel','Medina Dakar'),
			('Intech','Mermoz Dakar'),
			('Senelec',NULL),
			('SDE','P.A. unite 17 Dakar');

insert into RENCONTRE
	values  ('NDIAYE','DIOP','Dakar',2003,'9-2'),
			('BOROSI','NDIAYE','Dakar',2003,'7-5'),
			('NDIAYE','GUEYE','Dakar',2003,'8-6'),
			('BOROSI','DIOP','Dakar',2003,'7-6'),
			('DIOP','GUEYE','Dakar',2003,'7-2'),
			('GUEYE','BOROSI','Dakar',2003,'5-4'),
			('SY','GUEYE','Dakar',2002,'7-3'),
			('NDIAYE','GUEYE','Dakar',2002,'6-3'),
			('SY','NDIAYE','Dakar',2002,'8-5'),
			('GUEYE','FALL','Kaolack',2001,'7-2'),
			('SY','GUEYE','Thies',2002,'8-4'),
			('BOROSI','DIONE','St-Louis',2003,'7-5');

insert into GAIN 
	values  ('NDIAYE','Dakar',2003,1,1200000),
			('FALL','Kaolack',2001,2,500000),
			('GUEYE','Dakar',2002,3,600000),
			('DIOP','Dakar',2003,3,850000),
			('GUEYE','Thies',2002,2,700000),
			('SY','Dakar',2002,1,1300000),
			('DIONE','St-Louis',2003,1,890000),
			('BOROSI','St-Louis',2003,2,400000),
			('SY','Thies',2002,1,1100000),
			('NDIAYE','Dakar',2002,2,1050000),
			('BOROSI','Dakar',2003,2,900000),
			('GUEYE','Kaolack',2001,1,950000),
			('GUEYE','Dakar',2003,4,400000);

insert into SPONSORISE
	values  ('Sonatel','Dakar',2003,15000000),
			('Intech','Kaolack',2001,5000000),
			('Sonatel','Dakar',2002,10000000),
			('Senelec','St-Louis',2003,8500000),
			('SDE','Thies',2002,4000000),
			('Senelec','Dakar',2003,3000000);

update JOUEUR
	set Age=30
	where (Prenom='Albert');

update JOUEUR
	set Age=Age+2
	where (Age<23);

update JOUEUR
	set Prenom='Samba Ardo',
		Nom='SOW'
		where(Nom='NOAH');


delete from JOUEUR
	where(Nom='SOW');

delete from JOUEUR
	where(Age>30);

alter table GAIN
modify(
		NomJoueur varchar(20),
		LieuTournoi varchar(50),
		Annee int(4),
		Rang smallint,
		Prime int,
		
		constraint pk_gain primary key (NomJoueur,LieuTournoi,Annee),
		constraint fk_gain_1 foreign key (NomJoueur) references JOUEUR(Nom) on delete cascade,
		constraint fk_gain_23 foreign key (LieuTournoi,Annee) references TOURNOI(lieu,annee)
	);
