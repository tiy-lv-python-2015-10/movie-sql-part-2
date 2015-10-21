SELECT movies.title, avg(ratings.rating)
FROM movies
  Join ratings ON movies.movieid = ratings.movieid
WHERE movies.title = 'Toy Story (1995)'
GROUP BY movies.title;

SELECT movies.title, count(*)
FROM movies
  JOIN ratings ON movies.movieid = ratings.movieid
WHERE movies.title = 'Toy Story (1995)'
GROUP BY movies.title;

SELECT movie_genre.genre_id, genre.genres, count(*)
FROM movies
  JOIN movie_genre ON movies.movieid = movie_genre.movieid
  JOIN genre ON movie_genre.genre_id = genre.id
WHERE movie_genre.genre_id = 9
GROUP BY movie_genre.genre_id, genre.genres;

SELECT ratings.userid, avg(ratings.rating) as avg_rating
FROM ratings
WHERE ratings.userid = 5
GROUP BY ratings.userid;

SELECT ratings.userid, count(ratings.rating)
FROM ratings
GROUP BY ratings.userid
ORDER BY count(ratings.rating) DESC
LIMIT 1;

SELECT ratings.userid, avg(ratings.rating) as avg_rating
FROM ratings
GROUP BY ratings.userid
ORDER BY avg_rating DESC
LIMIT 1;

SELECT ratings.userid, count(ratings.rating) as num_ratings, avg(ratings.rating) as avg_rating
FROM ratings
GROUP BY ratings.userid
  HAVING count(ratings.rating) > 50
ORDER BY avg_rating DESC;

SELECT movies.title, avg(ratings.rating) as avg_rating
FROM movies
  JOIN ratings ON movies.movieid = ratings.movieid
GROUP BY movies.title
HAVING avg(ratings.rating) > 4;

SELECT genre.genres, count(ratings.rating) as num_ratings, avg(ratings.rating) as avg_rating
FROM genre
  JOIN movies ON movies.genres like '%' || genre.genres || '%'
  JOIN ratings ON movies.movieid = ratings.movieid
GROUP BY genre.genres
ORDER BY avg_rating DESC;

/* Create a new table called actors (We are going to pretend the actor can only play in one movie)
The table should include name, character name, foreign key to movies and date of birth at least plus an id field. */
CREATE TABLE actors(
  id SERIAL PRIMARY KEY ,
  name varchar(100) NOT NULL,
  charater_name varchar(100),
  movieid int,
  dob varchar(20)
);

/*Pick 3 movies and create insert statements for 10 actors each. You should use the multi value insert statements */
INSERT INTO actors(name, charater_name, movieid, dob)
    VALUES ('Robert De Niro', 'Sam (ACE) Rothstein', 16, '08-17-1943'),
      ('Sharon Stone', 'Ginger McKenna', 16, '03-10-1958'),
      ('Joe Pesci', 'Nicky Santoro', 16, '02-09-1943'),
      ('James Woods', 'Lester Diamond', 16, '04-18-1947'),
      ('Don Rickles', 'Billy Sherbert', 16, '05-08-1926'),
      ('Alan King', 'Andy Stone', 16, '12-26-1927'),
      ('Kevin Pollak', 'Phillip Green', 16, '10-30-1957'),
      ('L.Q. Jones', 'Pat Webb', 16, '08-19-1927'),
      ('Dick Smothers', 'Senator', 16, '11-20-1939'),
      ('Frank Vincent', 'Frank Marino', 16, '04-04-1939'),
      ('Stepen Baldwin', 'McManus', 50, '05-12-1966'),
      ('Gabriel Byrne', 'Keaton', 50, '05-12-1950'),
      ('Benicio Del Toro', 'Fenster', 50, '02-19-1967'),
      ('Paul Bartel', 'Smuggler', 50, '08-06-1938'),
      ('Kevin Spacey', 'Verbal', 50, '07-26-1959'),
      ('Chazz Palminteri', 'Dave Kujan', 50, '05-15-1952'),
      ('Pete Postlethwaite', 'Kobayashi', 50, '02-07-1946'),
      ('Suzy Amis', 'Edie Finneran', 50, '01-05-1962'),
      ('Giancarlo Esposito', 'Jack Baer', 50, '04-26-1958'),
      ('Dan Hedaya', 'Jeff Rabin', 50, '07-24-1940'),
      ('Ice Cube', 'Craig Jones', 69, '06-15-1969'),
      ('Chris Tucker', 'Smokey', 69, '08-31-1972'),
      ('Nia Long', 'Debbie', 69, '10-30-1970'),
      ('Tommy "Tiny" Lister', 'Deebo', 69, '06-24-1958'),
      ('John Witherspoon', 'Mr. Jones', 69, '01-27-1942'),
      ('Anna Maria Horsford', 'Mrs. Jones', 69, '03-06-1948'),
      ('Regina King', 'Dana Jones', 69, '01-15-1971'),
      ('Paula Jai Parker', 'Joi', 69, '08-19-1969'),
      ('Faizon Love', 'Big Worm', 69, '06-14-1968'),
      ('DJ Pooh', 'Red', 69, '01-19-1984');

/*Create a new column in the movie table to hold the MPAA rating. UPDATE 5 different movies to their correct rating */
ALTER TABLE movies ADD mpaa_rating varchar(10) NULL;

UPDATE movies
SET mpaa_rating = 'G'
WHERE movieid = 1;

UPDATE movies
SET mpaa_rating = 'PG'
WHERE movieid = 2;

UPDATE movies
SET mpaa_rating = 'PG-13'
WHERE movieid = 3;

UPDATE movies
SET mpaa_rating = 'R'
WHERE movieid = 4;

UPDATE movies
SET mpaa_rating = 'PG'
WHERE movieid = 5;

ALTER TABLE movies add year int NULL;

UPDATE movies
SET year = cast(substring(movies.title, '(\d{4})') as int);

SELECT movies.movieid, movies.title, actors.name as actor, actors.charater_name
FROM movies
  JOIN actors ON movies.movieid = actors.movieid;

ALTER TABLE movies add avg_rating float NULL;
