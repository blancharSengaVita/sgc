#exercices 1
#Il faut juste selectionner tout d'une table

#1.1
SELECT * FROM ecole_eleves;
#1.2
SELECT DISTINCT * FROM ecole_eleves;
#1.3
SELECT * FROM ecole_resultat;
#1.4
SELECT * FROM ecole_cours;

#exercice 2
#Il faut juste selectionner des colonnes spécifiques d'une table
#On peut utiliser le distinct

#2.1
SELECT nom,prenom FROM ecole_eleves;
#2.2
SELECT DISTINCT nom, prenom FROM ecole_eleves;
#2.3
SELECT nom, salaire_base FROM ecole_professeurs;
#2.4
SELECT nom FROM ecole_cours;

#exercice 3

#3.1
SELECT * FROM ecole_eleves WHERE annee = 1;
#3.2
SELECT * FROM ecole_eleves WHERE annee > 1;
#3.3
SELECT * FROM ecole_eleves WHERE nom = 'Brisefer';
#3.4
SELECT * FROM ecole_eleves WHERE poids < 45;
#3.5
SELECT * FROM ecole_eleves WHERE poids BETWEEN 45 AND 63;
#3.6
SELECT * FROM ecole_activites WHERE equipe LIKE 'AMC%';
#3.7
SELECT * FROM ecole_activites WHERE equipe LIKE '%i_';
#3.8
SELECT * FROM ecole_professeurs WHERE nom LIKE '%e'
#3.9
SELECT * FROM ecole_activites WHERE nom LIKE '%@ %' ESCAPE '@'
#ou SELECT * FROM ecole_activites WHERE nom LIKE '% %' ESCAPE '@'
#3.10
SELECT * FROM ecole_professeurs WHERE specialite IN ('sql','poesie');
#3.11
SELECT * FROM ecole_eleves WHERE poids IN (35, 42, 72, 78, 120);
#3.12
SELECT * FROM ecole_professeurs WHERE specialite IS NOT NULL
#3.13
SELECT * FROM ecole_professeurs WHERE der_prom IS NULL


#exercice 4
SELECT * FROM ecole_eleves WHERE poids > 52 and annee = 1;
SELECT * FROM ecole_professeurs WHERE salaire_base = 1900000 AND specialite = 'reseaux';
SELECT * FROM ecole_cours WHERE annee = 1 AND nbheures > 15;

#exercice 5
SELECT AVG(poids) FROM ecole_eleves;
SELECT AVG(poids) FROM ecole_eleves WHERE annee = 1;
SELECT MAX(poids) FROM ecole_eleves WHERE annee = 2;
SELECT COUNT(*) FROM ecole_eleves WHERE annee = 1;
SELECT COUNT(*) FROM ecole_eleves;
SELECT SUM(salaire_base) FROM ecole_professeurs;
SELECT MIN(salaire_base) FROM ecole_professeurs;
SELECT MAX(poids) FROM ecole_eleves WHERE annee = 3; #renvoie NULL
SELECT count(*) FROM ecole_professeurs WHERE `specialite` IS NOT NULL ;
SELECT count(DISTINCT `specialite`) FROM ecole_professeurs WHERE `specialite` IS NOT NULL;
SELECT COUNT(*) FROM ecole_professeurs;
SELECT COUNT(*) FROM ecole_professeurs WHERE specialite in ('spip');
SELECT SUM(poids) FROM ecole_eleves WHERE annee = 2;

#exercice 6
SELECT nom, salaire_base / 12 FROM ecole_professeurs
SELECT salaire_actuel - salaire_base  FROM ecole_professeurs;
SELECT (salaire_actuel - salaire_base) / 12  FROM ecole_professeurs;
SELECT nom FROM ecole_professeurs WHERE (salaire_actuel - salaire_base) / salaire_base > 0.28;
SELECT AVG((salaire_actuel - salaire_base)/12) FROM ecole_professeurs;

#exercice 7 je dois refaire ceux là
SELECT CURRENT_TIMESTAMP;
SELECT * FROM ecole_eleves WHERE date_naissance < '1977-10-01';
SELECT * FROM ecole_professeurs WHERE EXTRACT(YEAR FROM CURRENT_TIMESTAMP) - extract(YEAR FROM date_entree) > 30;

#exercice 8 (à refaire pour etre sur)
SELECT nom, prenom FROM ecole_eleves WHERE poids > (SELECT poids FROM ecole_eleves WHERE nom = 'brisefer');
SELECT MIN(points) FROM ecole_resultats WHERE num_eleve = (SELECT num_eleve FROM ecole_eleves WHERE nom = 'Brisefer');

#exercice 9
#9.1
SELECT * FROM ecole_eleves AS ee
JOIN ecole_activites_pratiquees AS eap USING(num_eleve)
WHERE eap.nom IN ('surf')
#ou 9.1 
SELECT * 
FROM ecole_eleves AS ee
JOIN ecole_activites_pratiquees AS eap
ON ee.num_eleve = eap.num_eleve 
WHERE eap.niveau = 1 AND eap.nom = 'surf'

#Question si on veut avoir juste les eleves qui pratiquent une activité
#au niveau 1 on fait comment
SELECT * 
FROM ecole_eleves AS ee
JOIN ecole_activites_pratiquees AS eap
ON ee.num_eleve = eap.num_eleve 
WHERE eap.niveau = 1

#9.2
SELECT ee.`nom` FROM `ecole_eleves` AS ee
JOIN `ecole_activites_pratiquees` AS eap
ON ee.`num_eleve` = eap.`num_eleve`
JOIN `ecole_activites` AS ea
ON eap.`niveau` = ea.`niveau` 
WHERE ea.`equipe` IN ('AMC indus')
AND ea.`nom`  = eap.`nom`

#9.3
SELECT er.`points` FROM `ecole_resultats` AS er
JOIN `ecole_eleves` AS ee
ON er.`num_eleve` = ee.`num_eleve`
JOIN `ecole_cours`AS ec 
ON er.`num_cours` = ec.`num_cours`
WHERE ee.`nom` = 'Tsuno'

#9.4
SELECT er.`points` * 5 FROM `ecole_resultats` AS er
JOIN `ecole_eleves` AS ee
ON er.`num_eleve` = ee.`num_eleve`
JOIN `ecole_cours`AS ec 
ON er.`num_cours` = ec.`num_cours`
WHERE ee.`nom` = 'Tsuno'

#9.5
SELECT MIN(points) FROM ecole_resultats
JOIN ecole_eleves AS ee USING(num_eleve)
WHERE ee.nom = 'Brisefer';

#9.6 prof
SELECT er.`points`, ec.`nom` FROM `ecole_resultats` AS er
JOIN `ecole_eleves` AS ee
ON er.`num_eleve` = ee.`num_eleve`
JOIN `ecole_cours` AS ec
ON er.`num_cours` = er.`num_cours`
WHERE ee.`nom` = 'Brisefer' ORDER BY er.`points` ASC LIMIT 1;

SELECT `nom`, `prenom`
FROM `ecole_eleves` AS ee 
ORDER BY nom, prenom DESC 

SELECT *
FROM 
    `ecole_professeurs`
ORDER BY `salaire_actuel` DESC

SELECT points * 5 AS p FROM ecole_resultats
JOIN ecole_eleves USING(num_eleve)
WHERE nom = "tsuno"

#11
SELECT nom, AVG(points) FROM ecole_eleves
JOIN ecole_resultats USING(num_eleve)
GROUP BY num_eleve;

SELECT MAX(points) FROM ecole_eleves
JOIN ecole_resultats USING(num_eleve)
GROUP BY num_eleve;

#12
INSERT INTO ecole_eleves (num_eleve, nom, prenom, date_naissance, poids, annee) VALUES (12, 'Dujardin', 'Jean', '1970-03-29', 80, 2)

INSERT INTO `ecole_professeurs` (num_prof, nom, specialite, date_entree, der_prom, salaire_base, salaire_actuel) 
VALUES(9 ,'Tournesol', 'Inventeur', '1960-09-01', '2007-09-01', 100000, 1000000);

INSERT INTO ecole_cours VALUES
(6, 'Fusée', 150, 2),
(7, 'Astronaute', 200, 2),
INSERT INTO `ecole_charge` (num_cours,num_prof)
VALUES
((SELECT `num_cours` FROM `ecole_cours` WHERE `nom` = 'fusée' LIMIT 1),
(SELECT `num_prof` FROM `ecole_professeurs` WHERE `nom` = 'tournesol' LIMIT 1)),
((SELECT `num_cours` FROM `ecole_cours` WHERE `nom` = 'astronaute' LIMIT 1),
(SELECT `num_prof` FROM `ecole_professeurs` WHERE `nom` = 'tournesol' LIMIT 1));
#on est pas sené mettre 6 ET 7 car ça s'auto incremente d'ou la longue requete après
#on doit pas regarder la table mais juste voir ce qu'il est dans l'énoncé

#13
UPDATE `ecole_eleves` SET `date_naissance` = '2008-12-01' WHERE `nom` = 'Brisefer' AND `prenom` = 'benoit'

UPDATE `ecole_professeurs` SET `specialite` = 'Heavy Metal' WHERE `specialite` = 'poésie'

UPDATE ecole_eleves SET nom = 'BrokenAll' WHERE nom = 'Brisefer'



#14.1
DELETE FROM ecole_resultats
WHERE num_eleve = (SELECT num_eleve FROM ecole_eleves WHERE nom = 'Brisefer')

#14.2
DELETE FROM ecole_resultats WHERE `num_cours` = (SELECT `num_cours` FROM `ecole_cours` WHERE `nom` = 'réseau');
DELETE FROM ecole_charge WHERE `num_cours` IN (SELECT `num_cours` FROM `ecole_cours` WHERE `nom` = 'réseau');
DELETE FROM `ecole_cours` WHERE `nom` = 'réseau';

#14.3

DELETE FROM `ecole_activites_pratiquees` WHERE `nom` LIKE '%foot%';
DELETE FROM ecole_activites WHERE nom LIKE '%foot%';

#avec un soft delete on fait un update sur la
#on selection ceux qui null dans delete pour montrer les lignes non supprimé


#mémo
SELECT nom, AVG(points) FROM ecole_resultats
JOIN ecole_eleves USING (num_eleve)
GROUP BY num_eleve;
DELETE FROM ecole_activites WHERE nom like '%foot%'