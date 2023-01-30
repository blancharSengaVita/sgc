# sqlTheory_1

Basé sur le modèle relationnel

# sqlTheory_2

Utf8mb4 avec collation ut8mb4_general_ci. Pour avoir de l'encodage multi-bite et par conséquent des caractères spéciaux tels que les smileys.

# sqlTheory_3

Grâce à DISTINCT. 
SELECT DISTINCT nom_cours FROM horaire;

# sqlTheory_4

Un soft-delete consiste à enlever certaines lignes des résultats de requêtes sans toutefois les supprimer réellement des tables. Pour ce faire, on place une colonne deleted_at de type DATETIME ou TIMESTAMP et à la valeur par défaut NULL sur la table concernée. Dès lors, les requêtes SELECT exécutées sur cette table devront toutes implémenter la condition "WHERE deleted_at IS NULL" afin de ne pas retourner les résultats qui auraient été "supprimés" à un moment donné.