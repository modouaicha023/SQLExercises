use championnat;
select Nom, Age
from joueur
where exists(
    select Nationalite
    from joueur
    where Nationalite not in ('senegalaise','Gambienne')
    );
select *
from joueur
where not exists(
    select *
    from rencontre
    where Nom=NomGagnant and LieuTournoi='Dakar'

    );
select *
from joueur
where Age  = (
    select min(Age)
    from joueur
    );
select NomJoueur
from  gain g1
where LieuTournoi='Dakar'
and not exists(select *
    from gain g2
    where g2.LieuTournoi='Dakar' and g2.Prime>g1.Prime);

select sum(MtContribution) montantTotal
from sponsorise
where nomSponsor='Sonatel';
select annee, avg(MtContribution)
from sponsorise
group by annee;
select annee, sum(MtContribution) montantTotal
from sponsorise
group by annee;
select LieuTournoi, count(NomJoueur)
from gain
group by LieuTournoi;
select distinct NomGagnant
from rencontre
where LieuTournoi='Dakar';
select j.*
from joueur j, gain g1
where j.Nom=g1.NomJoueur and g1.LieuTournoi='Dakar' and
      not exists(select *
          from gain g2
          where g2.NomJoueur=j.Nom
          and g2.Prime<=1000000);
select LieuTournoi,annee,sum(Prime)
from gain
where LieuTournoi='Dakar'
group by LieuTournoi, annee
having count(*)>3;

    )