-- Give me the names of all the actors in the movie 'Die Another Day'.
SELECT CONCAT(first, " ", last) AS "name" 
FROM Actor
JOIN MovieActor
ON Actor.id = MovieActor.aid
JOIN Movie
ON MovieActor.mid = Movie.id
WHERE title = "Die Another Day";

-- Give me the count of all the actors who acted in multiple movies.
SELECT COUNT(*) FROM (
	SELECT *
	FROM MovieActor
	GROUP BY aid
	HAVING COUNT(*) > 1
) T;

-- Give me the title of movies that sell more than 1,000,000 tickets.
SELECT title
FROM Movie
JOIN Sales
ON Movie.id = Sales.mid
WHERE ticketsSold > 1000000;

-- Give me the director(s)' names that direct(s) the largest number of movies.
SELECT CONCAT(first, " ", last) AS "name"
FROM Director
JOIN MovieDirector
ON Director.id = MovieDirector.did
GROUP BY Director.id
HAVING COUNT(*) = (
	SELECT MAX(count)
	FROM (
		SELECT COUNT(*) AS "count"
		FROM MovieDirector
		GROUP BY did
	) T
);

-- Give me the count of all the actors who acted in only one movie.
SELECT COUNT(*)
FROM (
	SELECT *
	FROM MovieActor
	GROUP BY aid
	HAVING COUNT(*) = 1
) T;
