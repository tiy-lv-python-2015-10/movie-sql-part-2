
SELECT movies.title, avg(ratings.rating)
From ratings
  JOIN movies on ratings.movieid = movies.movieid
GROUP BY movies.title;

SELECT movies.title, count(ratings.rating)
from ratings JOIN movies
    on ratings.movieid = movies.movieid
GROUP BY movies.title;

SELECT movies.title, count(genre.genres)
from ratings JOIN movies
  on movies.movieid = genre.id
GROUP BY movies.title;


SELECT movie_genre.genre_id, genre.genres, count(*)
FROM movies
  JOIN movie_genre ON movies.movieid = movie_genre.movieid
  JOIN genre ON movie_genre.genre_id = genre.id
WHERE movie_genre.genre_id = 2
GROUP BY movie_genre.genre_id, genre.genres;


SELECT ratings.userid, avg(ratings.rating)
FROM ratings
GROUP BY ratings.userid
ORDER BY ratings.userid ASC;

SELECT ratings.userid, max(ratings.rating)
FROM ratings
GROUP BY ratings.rating
ORDER BY ratings.rating ASC;

SELECT ratings.userid, avg(ratings.rating)
FROM ratings
GROUP BY ratings.userid
ORDER BY avg(ratings.rating) DESC;

SELECT ratings.userid, avg(ratings.rating)
FROM ratings
GROUP BY ratings.userid
HAVING count(*) > 50
ORDER BY avg(ratings.rating) DESC;

SELECT movies.title, ratings.rating
FROM movies JOIN ratings
  on movies.movieid = ratings.movieid
GROUP BY movies.title ,ratings.rating
HAVING avg(ratings.rating) > 4
ORDER BY AVG(ratings.rating) DESC;


SELECT  genre.genres, count(ratings.rating), avg(ratings.rating)
FROM movies
  JOIN movie_genre ON movies.movieid = movie_genre.movieid
  JOIN ratings on movies.movieid = ratings.movieid
  JOIN genre ON movie_genre.genre_id = genre.id
GROUP BY  movie_genre.genre_id, genre.genres
ORDER BY AVG(ratings.rating) DESC;

CREATE TABLE actors(
  id int PRIMARY KEY,
  movie_id INT REFERENCES movies,
  name VARCHAR(50),
  character_name VARCHAR(50),
  dob VARCHAR(10)
);

INSERT INTO actors (movie_id,name,character_name,dob)
VALUES (1,"")
