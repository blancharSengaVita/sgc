# Cas Pratique (PHP).
# -------------------
# Indiquez à la suite de ce fichier une seule requête SQL permettant de récupérer toutes les données
# nécessaires pour afficher les 6 premières recettes les plus populaires contenant au moins un ingrédient
# parmi les suivants :
#   - Vin blanc
#   - Tomate
#   - Lait
#
# --
# INFORMATIONS IMPORTANTES :
#   - Faites attention à tous les détails dans l'interface pour définir votre requête.
#   - Vous n'êtes pas censés connaître l'id des ingrédients, les seules information que vous possédez
#     sont les valeurs textuelles des ingrédients suivants : vin blanc, tomate, lait.
#   - Les requêtes imbriquées sont autorisées, uniquement lorsqu'elles ne peuvent pas être remplacées
#     par quelque chose de plus performant.
#   - Pour ordonner les résultats, il faut employer les règles suivantes :
#       1. Par popularité descendante, étant indice numérique qui peut se calculer comme suit : 
#          ["rate" moyen] * [nombre d'avis], le tout arrondi vers le dessus ;
#       2. En cas d'ex-aequo, par "rate" moyen descendant ;
#       3. En cas d'ex-aequo, par ordre alphabétique ascendant sur le titre de la recette.
# --
#
# Renommez ce fichier comme il se doit (<groupe>_<nom>_<prenom>.sql). N'ayez crainte, le
# système continuera à fonctionner malgré le renommage.

SELECT * FROM `recipes`;