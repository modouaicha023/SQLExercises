@MODOU_AICHA_DIOP
--#1
select nom,prenom from etudiant;
--#2
select nom,prenom from etudiant where classe='L1';
--#3
select nom,prenom from etudiant where classe='L2' and nom='Ndiaye';
--#4
UPDATE enseignant SET prenom='Mohamed',nom='Diop' WHERE idEns='2';
--#5
select nom,prenom from enseignant where LENGTH(nom)='4';

--#6
delete from enseignant where nom like 'N%';
--#7
insert into etudiant ( nom, prenom, classe) VALUES('Diop', 'Modou Aicha', 'L1');
insert into etudiant ( nom, prenom, classe) VALUES('Yade', 'Limamou', 'L1');
insert into etudiant ( nom, prenom, classe) VALUES('Niang', 'Mor Talla', 'L2');
--#8
select * from enseignant order by nom;
--#9
select idEns,upper(nom) as nom,prenom from enseignant order by nom ;
--#10
select matiere.libelle,enseignant.nom,enseignant.prenom from matiere,enseignant where matiere.responsable= enseignant.idEns
--#11
SELECT interro.idInterro, matiere.libelle,matiere.classe FROM interro,matiere WHERE interro.idMatiere=matiere.idMat;
--#12
select * from enseignant where enseignant.idEns not in (select matiere.responsable from matiere);

--13
select avg(note),max(note),min(note) from notes;
--14
select sum(note)/count(note) as moy from notes;
--15
select enseignant.nom ,enseignant.prenom ,count(*) from enseignant,matiere where  matiere.responsable= enseignant.idEns group by nom ,prenom;
--16
select etudiant.idEtud,nom , prenom , avg(notes.note) as moyenne from etudiant,notes,interro where (notes.idEtud= etudiant.idEtud) group by nom,prenom,idEtud;
--17
select interro.idInterro,avg(notes.note) as moyenne_interrogation from notes,interro where (notes.idInterro= interro.idInterro) group by interro.idInterro order by moyenne_interrogation desc ;
--18
select etudiant.idEtud, nom, prenom, avg(notes.note) as moyenne from etudiant,notes where (notes.idEtud = etudiant.idEtud) group by nom,prenom,idEtud having count(notes.note)>12;