# sqlPractical_1

SELECT c.`name`, c.`country`, a.movies FROM companies c
JOIN (
    SELECT sc.id, COUNT(*) AS movies FROM companies sc
    JOIN company_movie scm ON sc.id = scm.company_id
    JOIN movies sm ON sm.id = scm.movie_id
    GROUP BY sc.id
) a ON c.id = a.id
WHERE c.deleted_at IS NULL
ORDER BY a.movies DESC;

# sqlPractical_2

SELECT * FROM movies
WHERE (title LIKE '%mission%' OR tagline LIKE '%mission%' OR description LIKE '%mission%') 
AND deleted_at IS NULL;

# sqlPractical_3

SELECT title, (revenue - budget) AS gain FROM movies
WHERE budget IS NOT NULL
AND revenue IS NOT NULL
AND released_at BETWEEN '2015-01-01' AND '2021-12-31'
AND deleted_at IS NULL
ORDER BY gain DESC
LIMIT 10;

# sqlPractical_4

SELECT DISTINCT m.title, m.score FROM movies m
JOIN genre_movie gm ON m.id = gm.movie_id
JOIN genres g ON g.id = gm.genre_id
WHERE g.ref IN (12, 35, 16)
AND deleted_at IS NULL
ORDER BY m.score DESC;

# sqlPractical_5

SELECT * FROM episodes e
JOIN seasons se ON e.season_id = se.id
JOIN shows sh ON se.show_id = sh.id
WHERE sh.title = 'dix pour cent'
AND sh.deleted_at IS NULL
ORDER BY se.order ASC, e.order ASC;

# sqlPractical_6

UPDATE movies
SET original_language_id = (SELECT id FROM languages WHERE code = 'fr' LIMIT 1),
updated_at = CURRENT_TIMESTAMP
WHERE ref = '510065';

# sqlPractical_7

INSERT INTO episodes (`season_id`, `ref`, `title`, `description`, `order`, `score`, `released_at`)
VALUES (
    (SELECT seasons.id FROM seasons JOIN shows ON seasons.show_id = shows.id WHERE shows.title = 'dix pour cent' AND shows.deleted_at IS NULL ORDER BY seasons.order DESC LIMIT 1),
    'some-ref',
    'Mon Titre pour Dix pour cent',
    'Une superbe description',
    (SELECT (e.order + 1) FROM episodes e JOIN seasons s ON e.season_id = s.id JOIN shows a ON s.show_id = a.id WHERE a.title = 'dix pour cent' AND a.deleted_at IS NULL ORDER BY s.order DESC, e.order DESC LIMIT 1),
    7.2,
    CURRENT_DATE
);

# sqlPractical_8

DELETE FROM companies WHERE country = 'FR' AND created_at < '2010-01-01 00:00:00';