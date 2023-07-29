use championnat;
select Nom, Nationalite
from joueur;
select *
from joueur;
select Nom, Nationalite
from joueur
where age>30;
select distinct nomSponsor
from sponsorise
where lieu='Dakar';
select *
from joueur
where Nom LIKE 'D%' or Nom like 'N%';
select *
from joueur
where Nationalite <> 'senegalaise';
select distinct lieu
from tournoi;
select lieu, annee
from sponsorise
where nomSponsor='Sonatel';
select Nom, Age
from joueur, gain
where joueur.Nom=gain.NomJoueur and LieuTournoi='Dakar' and Annee=2002;
select NomJoueur, Prime
from gain
where (LieuTournoi='Dakar' or LieuTournoi='Thies') and Annee>=2002 and Annee<=2003;
select distinct NomGagnant, Nationalite
from joueur j, rencontre r
where j.Nom=r.NomGagnant and Age<=25 ;
select Nom, Nationalite
from joueur,gain gd, gain gt
where joueur.Nom=gd.NomJoueur and joueur.Nom=gt.NomJoueur and gd.LieuTournoi='Dakar' and gt.LieuTournoi='Thies'
  and gd.Annee=2002 and gt.Annee=2002;
select distinct Nom, Age
from joueur,gain
where Nom=NomJoueur and Prime>1000000;

