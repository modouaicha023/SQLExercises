DROP DATABASE IF EXISTS `GestEval`;
CREATE DATABASE IF NOT EXISTS `GestEval`;
USE `GestEval`;

CREATE TABLE IF NOT EXISTS `Etudiant`
(
    `numero` VARCHAR(20) NOT NULL,
    PRIMARY KEY(`numero`),
    `nom` VARCHAR(20) NOT NULL,
    `prenom` VARCHAR(20) NOT NULL,
    `genre` ENUM('M', 'F') NOT NULL,
    `dateNais` DATE,
    `addresse` VARCHAR (30)
)Engine = InnoDB;

CREATE TABLE IF NOT EXISTS `Module`
(
    `code` INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY(`code`),
    `nom` VARCHAR(20) NOT NULL,
    `domaine` VARCHAR(30) NOT NULL
)Engine = InnoDB;

CREATE TABLE IF NOT EXISTS `Evaluation`
(
    `idEval` INT NOT NULL,
    PRIMARY KEY (`idEval`),
    `Note` TINYINT,
    `dateEval` DATE,
    `type` VARCHAR(10) NOT NULL,
    `semestre` TINYINT NOT NULL,
    `annee` YEAR NOT NULL,
    `session` VARCHAR(4),
    `numeroEtudiant` VARCHAR(20) NOT NULL,
    CONSTRAINT `FK_numero_etudiant` FOREIGN KEY (`numeroEtudiant`) REFERENCES `Etudiant`(`numero`)
)Engine = InnoDB;


-- Question [1]
ALTER TABLE `Evaluation`
MODIFY `dateEval` DATE DEFAULT(current_date()),
MODIFY `Note` TINYINT NOT NULL,
ADD CONSTRAINT `CHK_zero_to_twenty` CHECK(`Note` BETWEEN 0 AND 20),
MODIFY `annee` INT NOT NULL,
MODIFY `semestre` INT NOT NULL,
ADD CONSTRAINT `CHK_year_note_one_two` CHECK((`annee` BETWEEN 1 AND 2) AND (`semestre` BETWEEN 1 AND 2));

ALTER TABLE `Etudiant`
ADD CONSTRAINT `CHK_naiss_limit` CHECK(`dateNais` < '2002-01-01');


-- Question [2]
INSERT INTO `Etudiant`(`numero`, `nom`, `prenom`, `genre`, `addresse`)
VALUES('2018R3425', 'Toure', 'Saliou', 'M', NULL),
('2019R3425', 'Tousre', 'Salsiou', 'M', 'Keur Massar');

INSERT INTO `Module` (`nom`, `domaine`)
VALUES('SGBD', "Systemes d'information");

UPDATE `Etudiant`
SET `dateNais` = '2000-05-24'
WHERE `numero` = '2018R3425';


DELETE FROM `Etudiant`
WHERE `nom` LIKE ('%1%') OR `nom` LIKE ('%2%');


-- Question [3]
-- [3.a]
SELECT `prenom`, `nom`, `dateNais`
FROM `Etudiant`
WHERE `addresse` = 'Keur Massar';

-- [3.b]
SELECT `type` AS `Type Evaluation`
FROM Evaluation;

-- [3.c]
--SELECT `numero`, `nom`, `prenom`
-- SOURCE C:/Users/Wilfried/OneDrive/Bureau/Semestre 2/SGBD/PreDs/xint_e3.sql
