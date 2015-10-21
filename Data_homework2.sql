select movies.movieid, movies.title, avg(ratings.rating)
from movies join ratings on movies.movieid = ratings.movieid
group by ratings.movieid, movies.movieid
limit 1;

select movies.title, movies.movieid, count(ratings.rating)
from movies join ratings on movies.movieid = ratings.movieid
group by ratings.movieid, movies.movieid
limit 1;

SELECT movie_genre.genre_id, genre.genres,  count(movie_genre.movieid)
from movie_genre join genre on movie_genre.genre_id = genre.id
GROUP BY movie_genre.genre_id, genre.genres
limit 1;

select ratings.userid, avg(ratings.rating)
from ratings
group by ratings.userid, ratings.rating
limit 1;

SELECT ratings.userid, count(ratings.userid)
from ratings
group by ratings.userid, ratings.userid
order by count(ratings.userid) desc
limit 1;

select ratings.userid, avg(ratings.rating)
from ratings
GROUP BY ratings.userid
ORDER BY avg(ratings.rating) DESC
limit 1;

SELECT ratings.userid, avg(ratings.rating)
from ratings
group by ratings.userid
having avg(ratings.rating) < 50
order by avg(ratings.rating) DESC;

SELECT ratings.userid, avg(ratings.rating)
from ratings
GROUP BY ratings.userid
having avg(ratings.rating) >= 4.0;

select count(movie_genre.genre_id), genre.genres, genre.id, ratings.id, avg(ratings.rating)
from movie_genre join genre on movie_genre.genre_id = genre.id
join ratings on genre.id = ratings.id
GROUP BY genre.genres, genre.id, ratings.id, ratings.rating
order by avg(ratings.rating) DESC

CREATE TABLE actors(
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) not null,
  Charater_name VARCHAR(100) not null,
  date_of_birth int not NULL DEFAULT 0)

insert into actors (id, name, Charater_name, date_of_birth)
    values(1, 'Jim Carrey', 'Ace Ventura', 1171962), (2, 'Simon Callow', 'Vincent Cudby', 6151994),
      (3, 'Ina Mcneide', 'Fulton Greenwall', 1021950)
insert into actors (id, name, Charater_name, date_of_birth)
    VALUES(4, 'Maynard Eziash', 'Ouda', 1121965), (5,'Tommy Davidson', 'none', 11101993),
      (6, 'Bob Gunton', 'Burton Quinn', 1115194), (7, 'Sophie OKonedo', 'none', 8111968),
      (8, 'Adewale Akinnuoye-Agbaje', 'Hitu', 8111968), (9, 'Bruce Spence', 'Gahjii', 9171945),
      (10, 'tom Grunke', 'Derrick McCane', 331965), (11, 'Pierce Brosnan', 'James Bond', 5161953),
      (12, 'Isabella Scorupco', 'Natalya Simonova', 641970), (14, 'Famke Janssen', 'Xenia Onatopp', 1141964),
      (15, 'Sean Bean', 'Alec Trevelyan', 4171959), (16, 'Samantha Bond', 'Eve Moneypenny', 11271961),
      (17, 'Minni Driver', 'Irina', 1311970), (18, 'Judi Dench', 'M', 1291934),
      (19, 'Tcheky Karyo', 'Dmitri Mishkin', 1041953), (20, 'Joe DonBaker', 'Jack Wade', 2121936),
      (21, 'Ice Cube', 'Craig Jones', 6151969), (22, 'Tommy Lister', 'Deebo', 6241985),
      (23, 'Chris Tucker', 'Smokey', 8311971), (24, 'DJ Pooh', 'Red', 6291969),
      (25, 'F. Gary Gray', 'Stanley', 7171969), (26, 'Nia Long', 'Debbie', 10301970),
      (27, 'Angela Means', 'Felisha', 7171954), (28, 'Meagan Good', 'Kid2', 881981),
      (29, 'John Witherspoon', 'Willie Jones', 1271942), (30, '