# Cas Pratique (PHP).
# -------------------
# Indiquez à la suite de ce fichier une seule requête SQL permettant de récupérer toutes les données
# nécessaires pour afficher le top 3 des séries ayant au moins une version anglaise ("en") pour 
# l'application fictive HEPLflix. 
#
# --
# INFORMATIONS IMPORTANTES :
#   - Faites attention à tous les détails dans l'interface pour définir votre requête
#   - N'oubliez pas de respecter les soft-deletes.
# --
#
# Renommez ce fichier comme il se doit (<groupe>-<nom>-<prenom>.sql). N'ayez crainte, le
# système MVC a été adapté et continuera à fonctionner malgré le renommage.

SELECT
s.title,
s.tagline,
s.description,
s.img,
s.url,
s.released_at,
sea.total AS seasons,
e.total AS episodes,
e.score AS score,
e.latest_release AS latest
FROM shows s
JOIN language_show ls ON s.id = ls.show_id
JOIN languages l ON ls.language_id = l.id
JOIN (SELECT show_id, COUNT(*) AS total FROM seasons GROUP BY show_id) sea ON s.id = sea.show_id
JOIN (SELECT seas.show_id, COUNT(*) AS total, AVG(ep.score) AS score, MAX(ep.released_at) AS latest_release FROM seasons seas JOIN episodes ep ON ep.season_id = seas.id GROUP BY seas.show_id) e ON s.id = e.show_id
WHERE l.code = 'en'
AND s.deleted_at IS NULL
ORDER BY e.score DESC
LIMIT 3;