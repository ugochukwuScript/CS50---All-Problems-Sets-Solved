SELECT people.name FROM people
INNER JOIN people ON people.id = stars.person_id
INNER JOIN movies ON movies.id = stars.movie_id
WHERE movies.year = 2004;

SELECT title FROM movies
INNER JOIN people ON people.id = stars.person_id
INNER JOIN movies ON movies.id = stars.movie_id
WHERE movies.year = 2004;