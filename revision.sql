#exercice 1 
#1.1
SELECT * FROM `ecole_eleves`;
#1.2
SELECT DISTINCT * FROM `ecole_eleves`;
#1.3
SELECT * FROM `ecole_resultats`;
#1.4 
SELECT * FROM `ecole_cours`;

#exercice 2
#2.1
SELECT `nom`, `prenom` FROM `ecole_eleves`;
#2.2
SELECT DISTINCT `nom`, `prenom` FROM `ecole_eleves`;
#2.3
SELECT `nom`, `salaire_base` FROM `ecole_professeurs`;
#2.4
SELECT `nom`, `salaire_base` FROM `ecole_professeurs`;

#exercice 3
#3.1
SELECT * FROM `ecole_eleves` WHERE `annee` = 1;
#3.2
SELECT * FROM `ecole_eleves` WHERE `annee` <> 1;
#3.3
SELECT * FROM `ecole_eleves` WHERE `nom` = 'Brisefer'
#3.4
SELECT * FROM `ecole_eleves` WHERE `poids` > 45;
#3.5
SELECT * FROM `ecole_eleves` WHERE `poids` BETWEEN 45 AND 63
#3.6
SELECT 
    * 
FROM `ecole_activites` 
WHERE `equipe` 
LIKE 'AMC%';
#3.7
SELECT
    *
FROM `ecole_activites`
WHERE `equipe` LIKE '%i_';
#3.8
SELECT 
    * 
FROM `ecole_professeurs` 
WHERE `nom` 
LIKE '%e';
#3.9
SELECT
    * 
FROM `ecole_activites` 
WHERE `equipe` 
LIKE '% %';
#3.10
SELECT 
    * 
FROM `ecole_professeurs`
WHERE Specialite 
IN ('sql', 'poesie');
#3.11
SELECT
    * 
FROM `ecole_eleves`
WHERE poids
IN (35, 42, 72, 78, 120);
#3.12
SELECT 
    * 
FROM `ecole_professeurs` 
WHERE `specialite` IS NOT NULL;
#3.13
SELECT 
    *
FROM `ecole_professeurs`
WHERE `salaire_base` = `salaire_actuel`; 

#Exercice 4
#4.1
SELECT 
    *
FROM `ecole_eleves`
WHERE `poids` > 52 AND `annee` = 1;
#4.2
SELECT
    *
FROM `ecole_professeurs`
WHERE `salaire_base` = 1900000 
AND `specialite` = 'réseaux';
#4.3
SELECT 
    * 
FROM `ecole_cours`
WHERE `annee` = 1
AND `nbheures` = 15;

#exercices 5
#5.1
SELECT 
AVG(`poids`)
FROM `ecole_eleves`;
#5.2
SELECT AVG(`poids`) 
FROM `ecole_eleves` 
WHERE `annee` = 1
#5.3
SELECT 
MAX(`poids`) 
FROM `ecole_eleves`
WHERE `annee` = 2;
#5.4
SELECT COUNT(*) 
FROM `ecole_eleves` 
WHERE `annee` = 1;
#5.5
SELECT 
COUNT(*)
FROM `ecole_eleves`
#5.6
SELECT
SUM(`salaire_actuel`)
FROM `ecole_professeurs`;
#5.7
SELECT 
MIN(`salaire_actuel`) 
FROM `ecole_professeurs`;
#5.8
SELECT 
MAX(`poids`) 
FROM `ecole_eleves` 
WHERE annee = 3;
#5.9
SELECT 
COUNT(`specialite`) 
FROM `ecole_professeurs`;
#5.10
SELECT 
COUNT(DISTINCT `specialite`) 
FROM `ecole_professeurs`;
#5.11
SELECT
COUNT(DISTINCT `nom`)
FROM `ecole_professeurs`;
#5.12
SELECT 
COUNT(`specialite`)
FROM `ecole_professeurs`
WHERE `specialite` = 'spip';
#5.13
SELECT
SUM(`poids`) 
FROM `ecole_eleves`
WHERE `annee` = 2;


#exercice 6
#6.1
SELECT 
`nom`,
`salaire_actuel`/12 
FROM `ecole_professeurs`;
#6.2
SELECT 
(`salaire_actuel` - `salaire_base`)
FROM `ecole_professeurs`;
#6.3
SELECT 
((`salaire_actuel`-`salaire_base`)/12)
FROM `ecole_professeurs`;
#6.4
SELECT 
`nom` 
FROM `ecole_professeurs`
WHERE ((`salaire_actuel`-`salaire_base`) / `salaire_base`) > 0.28;
#6.5
SELECT 
AVG(`salaire_actuel` - `salaire_base`)/12 
FROM `ecole_professeurs`;

#exercice 7
#7.1
SELECT CURRENT_TIMESTAMP;
#7.2
SELECT 
* 
FROM `ecole_eleves`
WHERE `date_naissance` < '1977-02-27';
#7.3
SELECT 
* 
FROM `ecole_professeurs`
WHERE EXTRACT(YEAR FROM CURRENT_TIMESTAMP) - EXTRACT(YEAR FROM `date_entree`) > 30;

#exercice 8
#8.1
SELECT 
`nom`,
`prenom` 
FROM `ecole_eleves`
WHERE `poids` > 
(SELECT 
`poids` 
FROM `ecole_eleves`
WHERE `nom` = 'Brisefer' LIMIT 1); 
#8.2
SELECT 
MIN(`points`) 
FROM `ecole_resultats` 
WHERE `num_eleve` = 
(SELECT
`num_eleve` 
FROM `ecole_eleves` 
WHERE `nom` = 'Brisefer' LIMIT 1);

#9
#9.1
SELECT 
* 
FROM `ecole_eleves` as ee
JOIN `ecole_activites_pratiquees` as eap
ON ee.`num_eleve` = eap.`num_eleve`
WHERE eap.`nom` = 'surf' 
AND eap.`niveau` = 1; 
#9.2
SELECT ee.`nom` FROM `ecole_eleves` AS ee
JOIN  `ecole_activites_pratiquees` AS eap
ON ee.`num_eleve` = eap.`num_eleve`
JOIN  `ecole_activites` AS ea
ON eap.`niveau` = ea.`niveau`
WHERE ea.`equipe` = 'AMC indus' AND ea.`nom` = eap.`nom`;
#9.3
SELECT er.`points` FROM  `ecole_resultats` AS er
JOIN `ecole_eleves` AS ee 
ON ee.`num_eleve` = er.`num_eleve`
WHERE ee.`nom` = 'Tsuno';
#9.4
SELECT er.`points` * 5 FROM  `ecole_resultats` AS er
JOIN `ecole_eleves` AS ee 
ON ee.`num_eleve` = er.`num_eleve`
WHERE ee.`nom` = 'Tsuno';
#9.5
SELECT MIN(er.`points`) FROM `ecole_resultats` AS er 
JOIN `ecole_eleves` AS ee
ON er.`num_eleve` = ee.`num_eleve`
WHERE ee.`nom` = 'Brisefer';


SELECT 
    ee.`nom`, 
    AVG(er.`points`)
FROM `ecole_eleves` AS ee
JOIN `ecole_resultats` AS er ON
ee.`num_eleve` = er.`num_eleve`
WHERE ee.`annee` = 1 GROUP BY ee.`nom`;

