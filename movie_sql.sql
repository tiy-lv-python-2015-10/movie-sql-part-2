###'10/20/15'###

#'Get the average rating for a movie'
SELECT movies.movieid, movies.title, AVG(ratings.rating)
FROM movies
  JOIN ratings ON ratings.movieid = movies.movieid
GROUP BY movies.movieid
HAVING movies.movieid = 1;


#'Get the total ratings for a movie'
SELECT movies.movieid, movies.title, COUNT(*)
FROM movies
  JOIN ratings ON ratings.movieid = movies.movieid
GROUP BY movies.movieid
HAVING movies.movieid = 1;


#'Get the total movies for a genre'
SELECT movies.movieid, movies.title, movies.genres, COUNT(genres)
FROM movies
  JOIN ratings ON ratings.movieid = movies.movieid
GROUP BY movies.movieid
HAVING movies.genres = genres;


#'Get the average rating for a user'
SELECT movies.movieid, movies.title, AVG(ratings.rating)
FROM movies
  JOIN ratings ON ratings.movieid = movies.movieid
GROUP BY movies.movieid, ratings.userid
HAVING movies.movieid = userid;



#'Find the user with the most ratings'
SELECT movies.movieid, movies.title, MAX(ratings.rating)
FROM movies
  JOIN ratings ON ratings.movieid = movies.movieid
GROUP BY movies.movieid, ratings.userid
HAVING movies.movieid = userid;


#'Find the user with the highest average rating'
SELECT MAX(ratings.userid), AVG(ratings.rating) AS avg_rating
FROM ratings;


#'Find the user with the highest average rating with more than 50 reviews'
SELECT MAX(ratings.userid), AVG(ratings.rating) AS avg_rating
FROM ratings
GROUP BY ratings.rating > 0 AND ratings.rating > 50;
